#!/bin/sh
#
# vimcdoc.sh:	vimcdoc Linux install/uninstall script
#
# Usage: 		(run it as root)
#				'./vimcdoc.sh -i' to install vimcdoc and set helplang
#				'./vimcdoc.sh -I' to install vimcdoc only
#				'./vimcdoc.sh -u' to uninstall vimcdoc
#
# Author:		wandys	(wandys@users.sf.net)
#				lang2	(lang2@users.sf.net)

if [ $# -ne 1 ]; then
	echo "Usage: $0 {-i|-I|-u}"
	exit 1
fi

vim --cmd ":exec 'normal i' . \$VIM | wq! /tmp/vimrt.$$" > /dev/null 2>&1 
if [ -e /tmp/vimrt.$$ ]; then
	VIM_PATH=`cat /tmp/vimrt.$$`/vimfiles
	rm /tmp/vimrt.$$
else
	echo 'Error: No vim found on this system.'
	exit 1
fi

VIMCDOC_PATH_LINK=`echo $VIM_PATH|sed 's:vim.*$:doc/vimcdoc:'`
VIMCDOC_PATH=$VIMCDOC_PATH_LINK-`cat VERSION`
TWTAGS=tags-tw
DIST_FILES="README.md
guides.txt
LICENSE
VERSION
AUTHORS
dict.txt"
VIMCDOC_INST='vimcdoc.sh'
install_dist_files=0

if [ `whoami` = 'root' ]; then
	install_dist_files=1
else
	VIM_PATH=$HOME/.vim
fi

case $1 in
	-[iI])
	if [ $install_dist_files -eq 1 ]; then
		for i in $DIST_FILES; do
			if [ ! -d $VIMCDOC_PATH ]; then
				rm -f $VIMCDOC_PATH
				mkdir $VIMCDOC_PATH
			fi
			echo "install -m 644 $i $VIMCDOC_PATH/$i"
			install -m 644 $i $VIMCDOC_PATH/$i
		done
		echo "install -m 755 $VIMCDOC_INST $VIMCDOC_PATH/$VIMCDOC_INST"
		install -m 755 $VIMCDOC_INST $VIMCDOC_PATH/$VIMCDOC_INST
		ln -sf $VIMCDOC_PATH $VIMCDOC_PATH_LINK
	fi
	cd doc
	for i in *.twx; do
		if [ ! -d $VIM_PATH/doc ]; then
			rm -f $VIM_PATH/doc
			mkdir -p $VIM_PATH/doc
		fi
		echo "install -m 644 $i $VIM_PATH/doc/$i"
		install -m 644 $i $VIM_PATH/doc/$i
	done
	echo "install -m 644 $TWTAGS $VIM_PATH/doc/$TWTAGS"
	install -m 644 $TWTAGS $VIM_PATH/doc/$TWTAGS
    cd ..
    if [ ! -d $VIM_PATH/syntax ]; then
		rm -f $VIM_PATH/syntax
		mkdir -p $VIM_PATH/syntax
    fi
    echo "install -m 644 syntax/help_tw.vim $VIM_PATH/syntax/help_tw.vim"
    install -m 644 syntax/help_tw.vim $VIM_PATH/syntax/help_tw.vim
    if [ $1 = "-i" ]; then
        if [ ! -d $VIM_PATH/plugin ]; then
            rm -f $VIM_PATH/plugin
            mkdir -p $VIM_PATH/plugin
        fi
        echo "install -m 644 plugin/vimcdoc.vim $VIM_PATH/plugin/vimcdoc.vim"
        install -m 644 plugin/vimcdoc.vim $VIM_PATH/plugin/vimcdoc.vim
    fi
	echo 'Done.'
	;;

	-u)
	if [ $install_dist_files -eq 1 ]; then
		rm -rf $VIMCDOC_PATH $VIMCDOC_PATH_LINK
	fi
	if [ -d $VIM_PATH/doc ]; then
		cd $VIM_PATH/doc
		rm -f *.twx $TWTAGS
	fi
	rm -f $VIM_PATH/syntax/help_tw.vim
	rm -f $VIM_PATH/plugin/vimcdoc.vim
	echo 'Done.'
	;;

    *)
	echo "Usage: $0 {-i|-u}"
	exit 1
	;;
esac

# vim:ts=4:sw=4:
# EOF
