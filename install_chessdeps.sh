if [ ! -d scoutfish ]; then
	echo "scoutfish git clone"
        git clone https://github.com/mcostalba/scoutfish
fi
cd scoutfish;git pull; cd ..
cd scoutfish/src;make -j5 profile-build ARCH=armv7; cd ../..
mkdir -p external
cp scoutfish/src/scoutfish ./external
cp scoutfish/src/scoutfish.py ./external

if [ ! -d chess_db ]; then
	echo "chess_db git clone"
        git clone https://github.com/sshivaji/chess_db
fi
cd chess_db;git pull; cd ..
cp -r Makefiles/Makefile-chess_db-parser Makefile
cd chess_db/parser;make -j5 build ARCH=armv7; cd ../..
cp chess_db/parser/parser ./external
cp chess_db/parser/chess_db.py ./external

if [ ! -d pgnextractor ]; then
	echo "pgnextractor git clone"
        git clone https://github.com/sshivaji/pgnextractor
fi
cd pgnextractor;git pull; cd ..
cp -r Makefiles/Makefile-pgnextractor-parser Makefile
cd pgnextractor/parser;make -j5 build ARCH=armv7; cd ../..
cp pgnextractor/parser/pgnextractor ./external

if [ ! -d ctgreader ]; then
	echo "ctgreader git clone"
	git clone https://github.com/sshivaji/ctgreader
fi
cd ctgreader; git pull; cd ..
cp -r Makefile/Makefile-ctgreader Makefile
cd ctgreader; make; cd ..
cp ctgreader/ctg_reader ./external

