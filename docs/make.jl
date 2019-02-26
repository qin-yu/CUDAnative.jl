using Documenter

using Pkg
if haskey(ENV, "GITLAB_CI")
  Pkg.add([PackageSpec(name = x; rev = "master") for x in ["CUDAdrv", "LLVM"]])
end

using CUDAnative

makedocs(
    modules = [CUDAnative],
    format = Documenter.HTML(prettyurls = get(ENV, "CI", nothing) == "true"),
    sitename = "CUDAnative.jl",
    pages = [
        "Home"    => "index.md",
        "Manual"  => [
            "man/usage.md",
            "man/troubleshooting.md",
            "man/performance.md",
            "man/hacking.md"
        ],
        "Library" => [
            "lib/compilation.md",
            "lib/reflection.md",
            "Device Code" => [
                "lib/device/intrinsics.md",
                "lib/device/array.md",
                "lib/device/libdevice.md"
                "lib/device/libcudadevrt.md"
            ]
        ]
    ],
    doctest = true
)
