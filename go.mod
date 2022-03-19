module github.com/moonbys/pan

go 1.16

require (
	github.com/cosmos/cosmos-sdk v0.44.6
	github.com/cosmos/ibc-go v1.2.2
	github.com/dustin/go-humanize v1.0.1-0.20200219035652-afde56e7acac // indirect
	github.com/fsnotify/fsnotify v1.5.1 // indirect
	github.com/gin-gonic/gin v1.7.0 // indirect
	github.com/golang/snappy v0.0.3 // indirect
	github.com/google/go-cmp v0.5.7 // indirect
	github.com/klauspost/compress v1.11.13 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.2-0.20181231171920-c182affec369 // indirect
	github.com/mitchellh/mapstructure v1.4.2 // indirect
	github.com/pelletier/go-toml v1.9.4 // indirect
	github.com/spf13/cast v1.4.1
	github.com/tendermint/spm v0.1.8
	github.com/tendermint/tendermint v0.34.14
	github.com/tendermint/tm-db v0.6.4
	golang.org/x/net v0.0.0-20220127200216-cd36cc0744dd // indirect
	google.golang.org/genproto v0.0.0-20220314164441-57ef72a4c106 // indirect
	gopkg.in/ini.v1 v1.63.2 // indirect
)

replace (
	github.com/99designs/keyring => github.com/cosmos/keyring v1.1.7-0.20210622111912-ef00f8ac3d76
	github.com/gogo/protobuf => github.com/regen-network/protobuf v1.3.3-alpha.regen.1
	google.golang.org/grpc => google.golang.org/grpc v1.33.2
)
