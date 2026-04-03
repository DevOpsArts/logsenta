## 🚀 Logsnare v1.1.0

### Features
- **9 Storage Backends**: File, PostgreSQL, MongoDB, MySQL, InfluxDB, Elasticsearch, Azure Log Analytics, AWS CloudWatch, GCP Cloud Logging
- **Intelligent Error Detection**: Regex and string-based pattern matching
- **Context Capture**: Rolling buffer captures logs before AND after errors
- **High Availability**: Leader election for multi-replica deployments
- **Scalability**: ThreadPoolExecutor handles 500+ pods efficiently
- **Security**: Non-root container, read-only filesystem, seccomp profiles

### Installation

```bash
git clone https://github.com/DevOpsArts/logsnare.git
cd logsnare
helm install logsnare-engine ./charts/logsnare-engine --namespace logsnare --create-namespace
```

### Documentation
- 📖 [Wiki Documentation](https://github.com/DevOpsArts/logsnare/wiki)
- 📦 [Docker Image](https://hub.docker.com/r/devopsart1/logsnare-engine)

### What's New
- Added Azure Log Analytics, AWS CloudWatch, GCP Cloud Logging backends
- SSL/TLS support for all database connections
- Network policies for production security
- Pod Disruption Budget for HA deployments
- Comprehensive wiki documentation
