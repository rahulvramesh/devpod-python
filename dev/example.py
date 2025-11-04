"""Example Python file to demonstrate the dev container setup."""


def hello_world() -> str:
    """Return a greeting message.
    
    Returns:
        str: A simple greeting message
    """
    return "Hello from DevPod Python!"


def main() -> None:
    """Main entry point for the example."""
    message = hello_world()
    print(message)


if __name__ == "__main__":
    main()
