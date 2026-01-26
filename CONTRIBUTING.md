# Contributing to SBA Python

## Development Setup

### System Requirements
- Python 3.11 or higher
- CMake 3.1 or higher
- C++11 compatible compiler

### System Dependencies

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install -y \
    libeigen3-dev \
    libsuitesparse-dev \
    libopenblas-dev \
    liblapack-dev
```

#### macOS
```bash
brew install eigen suite-sparse openblas lapack
```

### Building from Source
```bash
# Clone with submodules
git clone --recursive https://github.com/safijari/sba_python.git
cd sba_python

# Install Python dependencies
pip install pybind11-cmake

# Build in development mode
pip install -e .
```

## Testing
Run the test script:
```bash
python test.py
```

## Creating a Release

To create a new release:

1. Update the version in both `setup.py` and `pyproject.toml` (both files need to be kept in sync)
2. Commit the changes
3. Create and push a tag:
   ```bash
   git tag -a v0.9.7 -m "Release version 0.9.7"
   git push origin v0.9.7
   ```
4. GitHub Actions will automatically:
   - Build wheels for Python 3.11, 3.12, and 3.13
   - Build for Linux (x86_64) and macOS (x86_64 and arm64)
   - Create a GitHub release with the built wheels

## CI/CD

The project uses GitHub Actions for continuous integration and deployment. The workflow:
- Runs on pushes to main branches and pull requests
- Builds wheels for multiple Python versions (3.11+) and platforms (Linux, macOS)
- Automatically creates releases when version tags are pushed
- Uploads artifacts to GitHub releases

See `.github/workflows/build-and-release.yml` for details.
