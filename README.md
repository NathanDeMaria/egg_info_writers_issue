Highlight an issue(?) with `egg_info.writers` in `setuptools.setup`. I have 3 packages:

- `writer`, which has one method that writes an `output.txt` file
- `writing`, which uses `writer` to write an `output.txt` file to it's `EGG-INFO` directory
  - More on that can be found [here](https://setuptools.readthedocs.io/en/latest/setuptools.html#adding-new-egg-info-files)
- `innocent`, which has nothing to do with the two other packages.

The issue: if you install `writer`, `writing`, and then `innocent` in that order, `writer:write` is run as part of the install process for `innocent`, giving it an `output.txt` file.

To me, this seems like an error, or at least a confusing behavior. I wouldn't expect this to apply to all future python package installs, and could easily see it causing issues if:
- Some later application checked these `egg-info/` directories, and the presence of this new file meant something.
- The `egg_info.writers` function performed some action coupled to the package itself, causing installs of other packages to error.

## Reproduce

```shell
docker-compose up --build; docker-compose rm
```

will run an `ls` inside the "innocent" package's `egg-info` directory, showing the confusingly written `output.txt` file.

## Workaround

Check out the `workaround` package to see a way to get `egg_info.writers` to behave like I'd expect.
