# space_rename 

Command line tool to rename files with spaces replacing them with '_'; individually, searching by pattern or an entire folder.

## Usage

`space_rename [OPTION] [INPUT]*`

**Note**: the '*' symbol mean as many _inputs_ you want.

### Options

#### Help 

Shows help.

`space_rename -h`

#### Recursive

Rename recursively in the specified directories.

`space_rename -r [INPUT]*`

### Inputs

#### Individually

`space_rename "file with spaces"` # ./file with spaces -> file_with_spaces

#### Directory

`space_rename dir_without_spaces`

Rename its files.

`space_rename "dir with spaces"`

**Warning**: Rename the Directory itself and its files. 

#### Patterns 

`space_rename "~/Dowloads/foo **"`

#### Mixed

`space_rename -r ~/Downloads "dir\ with\ spaces/foo\ **" "file\ with\ spaces"`

**Warning**: Rename recursively in '~/Downloads' and in 'dir with spaces' also.  
