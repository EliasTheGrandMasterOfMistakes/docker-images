# How to use

# Run the docker command in the directory that has your source code
```
docker \
    run --rm -it \
    --privileged \
    -v `pwd`:/scratchbox/users/admin/home/admin/code \
    accupara/maemo \
    /bin/bash
```

# Helpful aliases
## Start Scratchbox:
```
sb-start
```

## Switch the target using one of the two aliases:
```
sb-switch-x86   # Switch to FREMANTEL_X86
sb-switch-armel # Switch to FREMANTEL_ARMEL
```