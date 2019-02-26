# CUDA device runtime

CUDAnative.jl provides wrapper functions for the functions defined as part of the
CUDA device runtime. This functionality is currently under development and contributions
are welcomed. Features like dynamic parallelism and cooperative groups belong to the
device runtime. Since it is easy to confuse them with the host side versions they are
encapsualted in `CUDAnative.DevRT`.

```@docs
DevRT.cudaDeviceSynchronize
```
