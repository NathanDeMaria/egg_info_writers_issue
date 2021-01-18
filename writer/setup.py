from setuptools import setup

setup(
    name='writer',
    py_modules=['writer'],
    entry_points={
        "egg_info.writers": ["output.txt = writer:write"]
    },
)
