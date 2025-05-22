return {
  settings = {
    yaml = {
      validate = true,
      hover = true,
      completion = true,
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/docker-compose.json"] = "docker-compose*.yml",
        ["https://json.schemastore.org/kubernetes.json"] = "*.k8s.yaml",
      },
    },
  },
}