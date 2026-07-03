from datetime import datetime
from pathlib import Path


def main() -> None:
    print("Hello from a minimal Python project!")
    print(f"Working directory: {Path.cwd()}")
    print(f"Timestamp: {datetime.utcnow().isoformat()}Z")


if __name__ == "__main__":
    main()
