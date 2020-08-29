install: deb
	cd build; sudo apt install --reinstall ./plot_0.1-1_all.deb

deb: docker clean
	mkdir -p build/plot-0.1
	cp plot build/plot-0.1
	cd build/plot-0.1; \
		dh_make --indep --createorig; \
		echo 'plot usr/bin' > debian/install; \
		debuild -us -uc

docker:
	docker build --tag plot .

clean:
	rm -rf build

