from setuptools.command.egg_info import egg_info


def write(cmd: egg_info, basename: str, filename: str):
    if cmd.distribution.entry_points:
        writers = cmd.distribution.entry_points.get('egg_info.writers', [])

        # If any of the egg_info.writers are trying to write this file, let them
        if any(w.startswith(basename) for w in writers):
            cmd.write_or_delete_file("whocares", filename, "file contents")
