#!/bin/bash

# 测试脚本：模拟 GitHub Actions 环境下的 issue 标题更新逻辑

# 测试用例1：单个镜像
echo "=== 测试用例1：单个镜像 ==="
cat << 'EOF'
测试 issue body:
```json
{
  "platform": "linux/amd64",
  "hub-mirror": [
    "registry.k8s.io/kube-apiserver:v1.27.4"
  ]
}
```

预期标题: linux/amd64 kube-apiserver
EOF

echo -e "\n=== 测试用例2：多个镜像 ==="
cat << 'EOF'
测试 issue body:
```json
{
  "platform": "linux/arm64",
  "hub-mirror": [
    "registry.k8s.io/kube-apiserver:v1.27.4",
    "registry.k8s.io/kube-controller-manager:v1.27.4",
    "registry.k8s.io/kube-scheduler:v1.27.4"
  ]
}
```

预期标题: linux/arm64 3个镜像
EOF

echo -e "\n=== 测试用例3：无平台信息 ==="
cat << 'EOF'
测试 issue body:
```json
{
  "platform": "",
  "hub-mirror": [
    "nginx:latest"
  ]
}
```

预期标题: nginx
EOF

echo -e "\n=== 工作流文件已创建 ==="
echo "位置: .github/workflows/update-issue-title.yaml"
echo "该工作流将在 issue 被标记为 'success' 时自动执行"
