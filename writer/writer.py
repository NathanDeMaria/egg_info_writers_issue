from setuptools.command.egg_info import egg_info


def write(cmd: egg_info, basename: str, filename: str):
    should_write = cmd.name == 'writing'
    if not should_write:
        return
    cmd.write_or_delete_file("whocares", filename, "file contents")
