#! /bin/bash
BACKUP_OLD_DOT_FILES_FOLDER=~/olddotfiles
DOT_FILES_FOLDER="~/dotfiles"
DOT_FILES_AND_FOLDERS=".vimrc .tmux.conf"

echo "Backing up old dot files in $BACKUP_OLD_DOT_FILES_FOLDER"
mkdir "$BACKUP_OLD_DOT_FILES_FOLDER"
for dot_file in $DOT_FILES_AND_FOLDERS
do
  if [ -e ~/.$dot_file ];then
    move_cmd="mv -v ~/$dot_file $BACKUP_OLD_DOT_FILES_FOLDER"
    eval $move_cmd
  fi
done

echo "Creating sym links to new dot files"
for dot_file in $DOT_FILES_AND_FOLDERS
do
  sym_link_cmd="ln -vs $DOT_FILES_FOLDER/$dot_file ~/$dot_file"
  eval $sym_link_cmd
done

