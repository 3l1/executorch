#!/bin/bash
# Copyright (c) Meta Platforms, Inc. and affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

set -euxo pipefail

_repo_root_dir=$(git rev-parse --show-toplevel)
export PYTHONPATH=${_repo_root_dir}

# Event refers to the type of models that will be downloaded. "pull_request"
# uses higher priority and fast models.
_models=$(python .ci/scripts/gather_test_models.py --event pull_request --json)

echo "${_models}" | jq
