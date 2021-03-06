
# Copyright (c) 2018 SAP SE or an SAP affiliate company. All rights reserved. This file is licensed under the Apache Software License, v. 2 except as noted otherwise in the LICENSE file
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DATE=$(shell date -u  +%Y-%m-%d)
VERSION=$(shell cat VERSION | sed 's/[-dev]//g')

.PHONY: build
build:
	@CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build \
		-ldflags "-w -X github.com/gardener/gardenctl/cmd.version=${VERSION} -X github.com/gardener/gardenctl/cmd.buildDate=${DATE}" \
		-o bin/linux-amd64/gardenctl-linux-amd64 gardenctl.go

	@CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build \
		-ldflags "-w -X github.com/gardener/gardenctl/cmd.version=${VERSION} -X github.com/gardener/gardenctl/cmd.buildDate=${DATE}" \
		-o bin/darwin-amd64/gardenctl-darwin-amd64 gardenctl.go

.PHONY: clean
clean:
	@rm -rf bin/
