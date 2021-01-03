# credit to https://github.com/nbeaver/stow-makefile
sys_dirs = sys/
home_dirs = $(filter-out $(sys_dirs), $(wildcard */))

.PHONY : stow
stow :
	stow --target $(HOME) --verbose $(home_dirs)
	sudo --user=root stow --target / --verbose $(sys_dirs)

.PHONY : stow-verbose
# verbosity goes from 0 to 4
VERBOSITY=1
stow-verbose :
	stow --verbose $(VERBOSITY) --target $(HOME) --verbose $(home_dirs)
	sudo --user=root stow --verbose $(VERBOSITY) --target / --verbose $(sys_dirs)

.PHONY : dry-run
dry-run :
	stow --no --target $(HOME) --verbose $(home_dirs)
	sudo --user=root stow --no --target / --verbose $(sys_dirs)

.PHONY : restow
restow :
	stow --target $(HOME) --verbose --restow $(home_dirs)
	sudo --user=root stow --target / --verbose --restow $(sys_dirs)

# Do this *before* moving to another directory.
.PHONY : delete
delete :
	stow --target $(HOME) --verbose --delete $(home_dirs)
	sudo --user=root stow --target / --verbose --delete $(sys_dirs)
