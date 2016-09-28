```
# 1. Simplest merge ever
./create_one_change_from_start.sh
# We have 1 commit on devel, we want to merge it to feature
git merge devel
git lg -3

# You see there is no merge commit - default GIT behaviour. To have similar as UI tools:
./create_one_change_from_start.sh
git merge devel --no-ff
git lg -3
# See merge commit - it's empty, has only message and info which hashes mere merged together
git show

# Rebase would work the same way here
./create_one_change_from_start.sh
git rebase devel
git lg -3


# 2. Same changes on 2 branches
./create_same_changes.sh
git merge devel
git lg -5
# merge commit is empty, 2 commits have the same hashes as on original branches
git show

# Rebase
./create_same_changes.sh
git rebase devel
git lg -5
# Rebase took the commit from devel and tried to apply on it changes from feature, but there was nothing to change


# 3. Typical merge where new commits were added on both branches
./create_changes_from_start.sh
git merge devel
git lg -5
# commits with original hashes, commit hash including the auto-resolved conflicts (same file changed)
git show

# Rebase
./create_changes_from_start.sh
git rebase devel
git lg -5
# commit from devel has original has, commit from feature has changed (even though delta is the same)
git show


# 4. Simple conflict
./create_conflict_from_start.sh
# see the changes
git show devel
git show
# merge and resolve manually
git merge devel
git st
git diff
vim config.php
git diff
git st
git add config.php
git st
git commit
git lg -5
# empty merge commit, original hashes
git show

# Do the same, but resolve combining the string
./create_conflict_from_start.sh
git merge devel
vim config.php
git diff
git st
git add config.php
git commit
git lg -5
# merge commit contains manually resolved conflict (changes from 2 branches and the result)
git show

# Rebase requires resolving conflicts
./create_conflict_from_start.sh
git rebase devel
git diff
git st
vim config.php
git add config.php
git rebase --continue
git lg -5
# the last commit is different than it used to be (it contains delta of devel)
git show


# 5. Conflict with 2 commits
./create_conflict_from_start_for_rebase.sh
git show devel
git show HEAD~1
git show
git rebase devel
# see the diff between first new commit on devel, and first new commit on feature
git diff
# choose different content than from branches
vim config.php
git st
git diff
git add config.php
git rebase --continue
# now it's a conflict between second commit on feature and the resolved commit of first feature and first (all) devel
git diff
vim config.php
git st
git diff
git add config.php
git rebase --continue
# still 2 commits on feature, but with different deltas
```

