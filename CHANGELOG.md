# Changelog

## [1.2.0](https://github.com/wsdjeg/code-runner.nvim/compare/v1.1.0...v1.2.0) (2026-07-17)


### Features

* support output transform ([0a2e00d](https://github.com/wsdjeg/code-runner.nvim/commit/0a2e00d8d7973fb267a1395cdf8317eb243c0730))
* support runner encoding and handle as text ([ade95a7](https://github.com/wsdjeg/code-runner.nvim/commit/ade95a7260f49248b9dd0126dd797668dda64f5e))


### Bug Fixes

* update release-please-action ([d05ce1f](https://github.com/wsdjeg/code-runner.nvim/commit/d05ce1fc768ad8868bb1330f5eb88b7ce01d6fcf))


### Documentation

* add CI badge to README ([e7d11a9](https://github.com/wsdjeg/code-runner.nvim/commit/e7d11a9711bfad13a179a6b5bb054c4f9adc1df1))
* reorder badges to match nvim-plug convention ([c117a8a](https://github.com/wsdjeg/code-runner.nvim/commit/c117a8a3c804c90028c77cfe5c5dc27ab3a018b1))
* update AGENTS.md with accurate project structure ([e216e31](https://github.com/wsdjeg/code-runner.nvim/commit/e216e31a35c01b27f73f4ba86194913f1ed666c4))
* use test.yml for CI badge ([6b9e024](https://github.com/wsdjeg/code-runner.nvim/commit/6b9e024256ef2c7af90095d07fd671ab3eea03bc))


### Tests

* add test suite and CI workflow ([6f0d764](https://github.com/wsdjeg/code-runner.nvim/commit/6f0d7648efcb0ae2ab29aba7eccdddd9a302e063))
* use tempname() instead of hardcoded /tmp path ([c397a9a](https://github.com/wsdjeg/code-runner.nvim/commit/c397a9a8ece78d2f6a58e5803b0b4286f63a211d))

## [1.1.0](https://github.com/wsdjeg/code-runner.nvim/compare/v1.0.0...v1.1.0) (2025-11-23)


### Features

* add luarocks support ([5a9647d](https://github.com/wsdjeg/code-runner.nvim/commit/5a9647df814383aabb422b3e3bc1db160efc51b8))
* use api functions instead of vim.cmd ([0975117](https://github.com/wsdjeg/code-runner.nvim/commit/0975117d928216a3a2218ce764caf409c5755704))


### Bug Fixes

* fix merge_list arguments ([29db7ed](https://github.com/wsdjeg/code-runner.nvim/commit/29db7ed7517a31cd0d873013bfeaa99b4768fca7))
* fix resize line type ([400283b](https://github.com/wsdjeg/code-runner.nvim/commit/400283ba752ef48c62d1ec58702f9dacfe56ef4a))

## 1.0.0 (2025-10-25)


### Features

* implement logger ([77feab0](https://github.com/wsdjeg/code-runner.nvim/commit/77feab0b185e155fdfa9ff9b5a3b2d88c37cde9b))


### Bug Fixes

* address deprecations on `init.lua` ([8d20087](https://github.com/wsdjeg/code-runner.nvim/commit/8d2008769cd31988156caf6d408a94c619930267))
* **init:** fixed deprecations, some code improvements ([d562373](https://github.com/wsdjeg/code-runner.nvim/commit/d5623736a37d1c4213e38c72b86e9946ae2e59c5))
* remove job.stop when usestdin is true ([970a483](https://github.com/wsdjeg/code-runner.nvim/commit/970a48386aebb7b4a7d3bf7c6258eb681b0d50d5))
* replaced `vim.api.buf_set_keymap` with `vim.keymap.set` ([a75a635](https://github.com/wsdjeg/code-runner.nvim/commit/a75a63537e11c42b427f4db4b4193e630d14fdc2))
* update output buffer syntax ([8993e7f](https://github.com/wsdjeg/code-runner.nvim/commit/8993e7f2b02b560b491e196d3f405e73e2f990e9))
* use `vim.cmd.<command>()` when possible ([5ab018a](https://github.com/wsdjeg/code-runner.nvim/commit/5ab018a0fb05e3f3e4409ab7d36f0eb182463a68))
