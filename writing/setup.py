from setuptools import setup, find_packages


setup(
    name='writing',
    py_modules=['writing'],
    setup_requires=['writer'],
    entry_points={
        "egg_info.writers": ["output.txt = writer:write"]
    }
)
