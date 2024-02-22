object/%.yy.cpp: %.l
	flex --header-file=object/$(basename $(notdir $<)).yy.h -o $@ $<

object/%.tab.cpp: %.y
	bison --header=object/$(basename $(notdir $<)).tab.h -o $@ $<

farmsay: main.cpp object/farmsay.tab.cpp object/farmsay.yy.cpp
	g++ -Iobject/ $+ -o farmsay -ggdb

clean:
	-rm object/*

test:
	-./farmsay < <(printf "I'me! Megmutatom ne'ktek az utolso' embert. Mi az, hogy szerelem? Mi az, hogy teremte's? Mi az, hogy va'gy? Mi az, hogy csillag? - i'gy ke'rdezo''sko:dik az utolso' ember e's vaksin pislog.")
