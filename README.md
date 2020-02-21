# Makedockfile

[![Build Status](https://travis-ci.com/Thomvaill/Makedockfile.svg?branch=master)](https://travis-ci.com/Thomvaill/Makedockfile)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Purpose

Makedockfile provides useful commands for development and CI/CD.

In development, building and running your Docker image can be done with just a `make up` command.
Also, it makes it easier to pass environment variables, expose ports and bind mount volumes thanks to `.conf` config files.
Execute `make help` to see the full command list.

On the CI/CD side, it enforces tagging good practices such as:

- not using `:latest` tag
- one tag per branch
- one tag per version
- one tag per commit

It is also possible to create a `Dockerfile.test` file to execute unit or integration tests from your image with `make test`.
Have a look at [example/Dockerfile.test](example/Dockerfile.test) to see an example.

Everything is customizable into `Makedockfile.conf`, and locally into `Makedockfile.dist.conf` (not versioned).
Please see the documentation directly into the [Makefile](Makefile).

## Quick start

```bash
cd your_project
wget -q -i https://raw.githubusercontent.com/Thomvaill/Makedockfile/master/wget.txt
echo "\nMakedockfile.dist.conf\nMakedockfile.out\n" >> .gitignore
```

## Acknowledgments

- Makefile inspired from [mpneuried's gist](https://gist.github.com/mpneuried/0594963ad38e68917ef189b4e6a269db)
- François Zaninotto for his [self-documented Makefile](https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html)

## License

This project is licensed under the MIT license, Copyright (c) 2019 Thomas Vaillant. For more information see [LICENSE](LICENSE) file.
