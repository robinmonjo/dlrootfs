HARDWARE=$(shell uname -m)

test:
	go install
	sudo -E go test

build:
	go build

release:
	mkdir -p release
	GOOS=linux go build -o release/dlrootfs
	cd release && tar -zcf dlrootfs_$(HARDWARE).tgz dlrootfs

	rm release/dlrootfs

clean:
	rm -rf release
