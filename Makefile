tests:
	go test -v -race -covermode atomic -coverprofile coverage.out && go tool cover -html coverage.out -o coverage.html

tests_without_race:
	go test -v -covermode atomic -coverprofile coverage.out && go tool cover -html coverage.out -o coverage.html

format:
	go fmt . ./cmd/... ./cmd/fasttld/... ./examples/...

bench:
	go test -bench . -benchmem -cpu 1

report_bench:
	go test -cpuprofile cpu.prof -memprofile mem.prof -bench . -cpu 1

cpu_report:
	go tool pprof cpu.prof

mem_report:
	go tool pprof mem.prof

build_cli:
	go build -o ./dist/fasttld -ldflags "-X 'github.com/elliotwutingfeng/go-fasttld/cmd/fasttld.version=v0.4.4'" ./cmd/main.go

demo:
	go run ./examples/demo.go

update_psl:
	go generate data/gen.go
