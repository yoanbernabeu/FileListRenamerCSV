package cmd

import (
	"encoding/csv"
	"fmt"
	"os"
	"path/filepath"

	"github.com/spf13/cobra"
)

// renameCmd represents the rename command
var renameCmd = &cobra.Command{
	Use:   "rename [csv] [directory]",
	Short: "Renames files based on a CSV",
	Long: `Renames files in the provided directory based on a CSV.
The CSV should have the original filename in the first column and the new name in the second column.`,
	Args: cobra.ExactArgs(2),
	RunE: func(cmd *cobra.Command, args []string) error {
		csvPath := args[0]
		dir := args[1]

		renames, err := readCSV(csvPath)
		if err != nil {
			return err
		}

		for _, rename := range renames {
			src := filepath.Join(dir, rename[0])
			dest := filepath.Join(dir, rename[1])
			if err := os.Rename(src, dest); err != nil {
				fmt.Printf("Failed to rename %s to %s: %s\n", src, dest, err)
			}
		}

		fmt.Println("Files renamed based on the CSV")
		return nil
	},
}

func init() {
	rootCmd.AddCommand(renameCmd)
}

func readCSV(csvPath string) ([][]string, error) {
	file, err := os.Open(csvPath)
	if err != nil {
		return nil, err
	}
	defer file.Close()

	reader := csv.NewReader(file)
	renames, err := reader.ReadAll()
	if err != nil {
		return nil, err
	}

	return renames, nil
}
