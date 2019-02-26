# Functions defined in libcudadevrt
module DevRT

using LLVM
using LLVM.Interop

"""
    cudaDeviceSynchronize()

Wait for the device to finish. This is the device side version,
and should not be called from the host. 

`cudaDeviceSynchronize` acts as a synchronization point for
child grids in the context of dynamic parallelism.
"""
@generated function cudaDeviceSynchronize()
    T_int32 = LLVM.Int32Type(JuliaContext())

    # create function
    param_types = LLVMType[]
    llvm_f, _ = create_function(T_int32, param_types)
    mod = LLVM.parent(llvm_f)

    # generate IR
    Builder(JuliaContext()) do builder
        entry = BasicBlock(llvm_f, "entry", JuliaContext())
        position!(builder, entry)

        f_typ = LLVM.FunctionType(T_int32, param_types)
        f = LLVM.Function(mod, "cudaDeviceSynchronize", f_typ)
        LLVM.linkage!(f, LLVM.API.LLVMExternalLinkage)

        val = call!(builder, f)
        ret!(builder, val)
    end

    call_function(llvm_f, Cint, Tuple{})
end

end
