return {
  settings = {
    yaml = {
      validate = true,
      hover = true,
      completion = true,
      schemas = {
        ["https://github.com/spread-ai/nextgen-xmap/raw/refs/heads/main/schema/json_schema.json"] = "*mapping*.yaml",
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/docker-compose.json"] = "docker-compose*.yml",
        ["https://json.schemastore.org/kubernetes.json"] = "*.k8s.yaml",
      },
    },
  },
}

