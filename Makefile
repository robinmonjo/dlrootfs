HARDWARE=$(shell uname -m)

test:
	go install
	go test

build:
	go build

release:
	mkdir -p release
	GOOS=linux go build -o release/dlrootfs
	cd release && tar -zcf dlrootfs_$(HARDWARE).tgz dlrootfs

	rm release/dlrootfs

clean:
	rm -rf release
