package cmd

import (
	"encoding/csv"
	"fmt"
	"os"
	"path/filepath"

	"github.com/spf13/cobra"
)

// listCmd represents the list command
var listCmd = &cobra.Command{
	Use:   "list [directory]",
	Short: "List files in a directory and save to CSV with an empty column",
	Long:  `List all files in the provided directory and save them to a CSV file, with an extra empty column.`,
	Args:  cobra.ExactArgs(1),
	RunE: func(cmd *cobra.Command, args []string) error {
		dir := args[0]
		csvPath, _ := cmd.Flags().GetString("output")

		files, err := listFiles(dir)
		if err != nil {
			return err
		}

		if err := saveToCSVWithEmptyColumn(files, csvPath); err != nil {
			return err
		}

		fmt.Printf("Files listed and saved to %s\n", csvPath)
		return nil
	},
}

func init() {
	rootCmd.AddCommand(listCmd)
	listCmd.Flags().StringP("output", "o", "output.csv", "Path to output CSV file")
}

func listFiles(dir string) ([]string, error) {
	var files []string

	err := filepath.Walk(dir, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		if !info.IsDir() {
			files = append(files, path)
		}
		return nil
	})

	if err != nil {
		return nil, err
	}

	return files, nil
}

func saveToCSVWithEmptyColumn(files []string, csvPath string) error {
	file, err := os.Create(csvPath)
	if err != nil {
		return err
	}
	defer file.Close()

	writer := csv.NewWriter(file)
	defer writer.Flush()

	for _, filePath := range files {
		// Write the file path and an empty column for each file
		if err := writer.Write([]string{filePath, ""}); err != nil {
			return err
		}
	}

	return nil
}
