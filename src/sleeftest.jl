
@inline function erf(v::Vec{8,Float64})
        Base.llvmcall(("""
declare <8 x double> @llvm.fma.v8f64(<8 x double>, <8 x double>, <8 x double>)
declare <4 x double> @llvm.x86.avx.round.pd.256(<4 x double>, i32)
declare <8 x i32> @llvm.x86.avx512.mask.cvtpd2dq.512(<8 x double>, <8 x i32>, i8, i32)
declare <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double>, <8 x i64>) 
""","""
  %2 = bitcast <8 x double> %0 to <8 x i64>
  %3 = and <8 x i64> %2, <i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807>
  %4 = bitcast <8 x i64> %3 to <8 x double>
  %5 = fcmp olt <8 x double> %4, <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
  %6 = fcmp olt <8 x double> %4, <double 3.700000e+00, double 3.700000e+00, double 3.700000e+00, double 3.700000e+00, double 3.700000e+00, double 3.700000e+00, double 3.700000e+00, double 3.700000e+00>
  %7 = fcmp olt <8 x double> %4, <double 6.000000e+00, double 6.000000e+00, double 6.000000e+00, double 6.000000e+00, double 6.000000e+00, double 6.000000e+00, double 6.000000e+00, double 6.000000e+00>
  %8 = fmul <8 x double> %4, %4
  %9 = select <8 x i1> %5, <8 x double> %8, <8 x double> %4
  %10 = select <8 x i1> %6, <8 x i64> <i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1>, <8 x i64> <i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3>
  %11 = select <8 x i1> %5, <8 x i64> zeroinitializer, <8 x i64> %10
  %12 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3BC00EFEFABE989B, double 0x3D1FDFABBDFC43F1, double 0xBC5AF69FE192740F, double 0xBC5AF69FE192740F, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %13 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBC0FE6EC06B043F5, double 0xBD7A8E25B9CCCB64, double 0x3CC5E4C21B562709, double 0x3CC5E4C21B562709, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %14 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %12, <8 x double> %9, <8 x double> %13) #13
  %15 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3C55A7F67BDE0C17, double 0x3DC50B3AE48C7164, double 0xBD20EE4A859274F9, double 0xBD20EE4A859274F9, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %16 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %14, <8 x double> %9, <8 x double> %15) #13
  %17 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBC9A15164BF4F36C, double 0xBE0518912B895660, double 0x3D7095F3964F9BBA, double 0x3D7095F3964F9BBA, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %18 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %16, <8 x double> %9, <8 x double> %17) #13
  %19 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3CDD6F95068FEEA8, double 0x3E3E0083E7FD4B05, double 0xBDB7174964833400, double 0xBDB7174964833400, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %20 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %18, <8 x double> %9, <8 x double> %19) #13
  %21 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBD1F56D9FF51275A, double 0xBE70131398DAE973, double 0x3DF84A341FC35F63, double 0x3DF84A341FC35F63, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %22 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %20, <8 x double> %9, <8 x double> %21) #13
  %23 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3D5F6839841402FB, double 0x3E9AE1C4F259778D, double 0xBE34092FAEC3CB81, double 0xBE34092FAEC3CB81, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %24 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %22, <8 x double> %9, <8 x double> %23) #13
  %25 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBD9D8453B9E7FD7B, double 0xBEC1E2D7E8039AC0, double 0x3E6A8ABD2DF8AA98, double 0x3E6A8ABD2DF8AA98, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %26 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %24, <8 x double> %9, <8 x double> %25) #13
  %27 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3DD9E6AD5DAB7034, double 0x3EE3117A5DB988BA, double 0xBE9CA9DF1E6D3F55, double 0xBE9CA9DF1E6D3F55, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %28 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %26, <8 x double> %9, <8 x double> %27) #13
  %29 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBE151D7181C08B9D, double 0xBF0024D0F7EE3723, double 0x3EC9739C586B056B, double 0x3EC9739C586B056B, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %30 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %28, <8 x double> %9, <8 x double> %29) #13
  %31 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3E4FCC5720620921, double 0x3F14E58666D1B46F, double 0xBEF2A034D3F36A50, double 0xBEF2A034D3F36A50, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %32 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %30, <8 x double> %9, <8 x double> %31) #13
  %33 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBE85F742EC43E5C7, double 0xBF2230DCD58EAD99, double 0x3F1658BA21A7397E, double 0x3F1658BA21A7397E, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %34 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %32, <8 x double> %9, <8 x double> %33) #13
  %35 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3EBB9E6C9DC6519C, double 0x3F10F5BA38B6A6E5, double 0xBF3590AE9D03C290, double 0xBF3590AE9D03C290, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %36 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %34, <8 x double> %9, <8 x double> %35) #13
  %37 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBEEF4D25C3E0C2EA, double 0x3F405F7D6748381E, double 0x3F4FC6679B56D25A, double 0x3F4FC6679B56D25A, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %38 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %36, <8 x double> %9, <8 x double> %37) #13
  %39 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3F1F9A326F9B89B8, double 0xBF5A9686E5DE05F7, double 0xBF5DB24AB8ACFC8B, double 0xBF5DB24AB8ACFC8B, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %40 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %38, <8 x double> %9, <8 x double> %39) #13
  %41 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBF4C02DB40040B84, double 0x3F252C1DCB0324BA, double 0xBF3EF7EC1133F0A8, double 0xBF3EF7EC1133F0A8, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %42 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %40, <8 x double> %9, <8 x double> %41) #13
  %43 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3F7565BCD0E6A540, double 0x3F939CBECA106F66, double 0x3F9567A2F00CE3E5, double 0x3F9567A2F00CE3E5, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %44 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %42, <8 x double> %9, <8 x double> %43) #13
  %45 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBF9B82CE31288B52, double 0xBFBA4FE8F5D2A23C, double 0xBFBAEEA974D564EF, double 0xBFBAEEA974D564EF, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %46 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %44, <8 x double> %9, <8 x double> %45) #13
  %47 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3FBCE2F21A042BE3, double 0xBFE45F2B34C61AC0, double 0xBFE44E1CB940DA9C, double 0xBFE44E1CB940DA9C, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %48 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %46, <8 x double> %9, <8 x double> %47) #13
  %49 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBFD812746B0379E7, double 0xBFF20DD7C1F4F99A, double 0xBFF21232BFB32B5A, double 0xBFF21232BFB32B5A, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %50 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %48, <8 x double> %9, <8 x double> %49) #13
  %51 = fmul <8 x double> %9, %50
  %52 = fneg <8 x double> %51
  %53 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %50, <8 x double> %9, <8 x double> %52) #13
  %54 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3FF20DD750429B6D, double 0x3E6250219DD8BAD1, double 0x3F305C1A38102E9A, double 0x3F305C1A38102E9A, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %55 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3C71AE3A914FED6D, double 0xBB080EE9AD757828, double 0xBBB9AC0AFE024E87, double 0xBBB9AC0AFE024E87, double undef, double undef, double undef, double undef>, <8 x i64> %11) #13
  %56 = fadd <8 x double> %54, %51
  %57 = fsub <8 x double> %56, %51
  %58 = fsub <8 x double> %56, %57
  %59 = fsub <8 x double> %51, %58
  %60 = fsub <8 x double> %54, %57
  %61 = fadd <8 x double> %60, %59
  %62 = fadd <8 x double> %55, %53
  %63 = fadd <8 x double> %62, %61
  %64 = fmul <8 x double> %56, %4
  %65 = fneg <8 x double> %64
  %66 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %56, <8 x double> %4, <8 x double> %65) #13
  %67 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %63, <8 x double> %4, <8 x double> %66) #13
  %68 = fadd <8 x double> %56, %63
  %69 = fmul <8 x double> %68, <double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE>
  %70 = shufflevector <8 x double> %69, <8 x double> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %71 = shufflevector <8 x double> %69, <8 x double> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %72 = tail call <4 x double> @llvm.x86.avx.round.pd.256(<4 x double> %70, i32 8) #13
  %73 = tail call <4 x double> @llvm.x86.avx.round.pd.256(<4 x double> %71, i32 8) #13
  %74 = shufflevector <4 x double> %73, <4 x double> %72, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %75 = tail call <8 x i32> @llvm.x86.avx512.mask.cvtpd2dq.512(<8 x double> %74, <8 x i32> zeroinitializer, i8 -1, i32 8) #13
  %76 = fmul <8 x double> %74, <double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000>
  %77 = fadd <8 x double> %56, %76
  %78 = fsub <8 x double> %77, %56
  %79 = fsub <8 x double> %77, %78
  %80 = fsub <8 x double> %56, %79
  %81 = fsub <8 x double> %76, %78
  %82 = fadd <8 x double> %81, %80
  %83 = fadd <8 x double> %63, %82
  %84 = fmul <8 x double> %74, <double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6>
  %85 = fadd <8 x double> %84, %77
  %86 = fsub <8 x double> %85, %77
  %87 = fsub <8 x double> %85, %86
  %88 = fsub <8 x double> %77, %87
  %89 = fsub <8 x double> %84, %86
  %90 = fadd <8 x double> %89, %88
  %91 = fadd <8 x double> %90, %83
  %92 = fmul <8 x double> %85, %85
  %93 = fadd <8 x double> %85, %85
  %94 = fneg <8 x double> %92
  %95 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %85, <8 x double> %85, <8 x double> %94) #13
  %96 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %93, <8 x double> %91, <8 x double> %95) #13
  %97 = fmul <8 x double> %92, %92
  %98 = fadd <8 x double> %92, %92
  %99 = fneg <8 x double> %97
  %100 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %92, <8 x double> %92, <8 x double> %99) #13
  %101 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %98, <8 x double> %96, <8 x double> %100) #13
  %102 = fmul <8 x double> %97, %97
  %103 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %85, <8 x double> <double 0x3DE60632A887194C, double 0x3DE60632A887194C, double 0x3DE60632A887194C, double 0x3DE60632A887194C, double 0x3DE60632A887194C, double 0x3DE60632A887194C, double 0x3DE60632A887194C, double 0x3DE60632A887194C>, <8 x double> <double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC>) #13
  %104 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %85, <8 x double> <double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6>, <8 x double> <double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C>) #13
  %105 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %85, <8 x double> <double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656>, <8 x double> <double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7>) #13
  %106 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %92, <8 x double> %104, <8 x double> %105) #13
  %107 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %85, <8 x double> <double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002>, <8 x double> <double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC>) #13
  %108 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %85, <8 x double> <double 0x3F81111111111119, double 0x3F81111111111119, double 0x3F81111111111119, double 0x3F81111111111119, double 0x3F81111111111119, double 0x3F81111111111119, double 0x3F81111111111119, double 0x3F81111111111119>, <8 x double> <double 0x3FA555555555555A, double 0x3FA555555555555A, double 0x3FA555555555555A, double 0x3FA555555555555A, double 0x3FA555555555555A, double 0x3FA555555555555A, double 0x3FA555555555555A, double 0x3FA555555555555A>) #13
  %109 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %92, <8 x double> %107, <8 x double> %108) #13
  %110 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %97, <8 x double> %106, <8 x double> %109) #13
  %111 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %102, <8 x double> %103, <8 x double> %110) #13
  %112 = fmul <8 x double> %85, <double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555>
  %113 = fneg <8 x double> %112
  %114 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %85, <8 x double> <double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555>, <8 x double> %113) #13
  %115 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %91, <8 x double> <double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555>, <8 x double> %114) #13
  %116 = fadd <8 x double> %112, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  %117 = fsub <8 x double> <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>, %116
  %118 = fadd <8 x double> %112, %117
  %119 = fadd <8 x double> %118, %115
  %120 = fmul <8 x double> %85, %116
  %121 = fneg <8 x double> %120
  %122 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %116, <8 x double> %85, <8 x double> %121) #13
  %123 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %119, <8 x double> %85, <8 x double> %122) #13
  %124 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %116, <8 x double> %91, <8 x double> %123) #13
  %125 = fadd <8 x double> %120, <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
  %126 = fsub <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %125
  %127 = fadd <8 x double> %120, %126
  %128 = fadd <8 x double> %127, %124
  %129 = fmul <8 x double> %85, %125
  %130 = fneg <8 x double> %129
  %131 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %125, <8 x double> %85, <8 x double> %130) #13
  %132 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %128, <8 x double> %85, <8 x double> %131) #13
  %133 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %125, <8 x double> %91, <8 x double> %132) #13
  %134 = fadd <8 x double> %129, <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
  %135 = fsub <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %134
  %136 = fadd <8 x double> %129, %135
  %137 = fadd <8 x double> %136, %133
  %138 = fmul <8 x double> %97, %111
  %139 = fneg <8 x double> %138
  %140 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %97, <8 x double> %111, <8 x double> %139) #13
  %141 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %101, <8 x double> %111, <8 x double> %140) #13
  %142 = fadd <8 x double> %138, %134
  %143 = fsub <8 x double> %134, %142
  %144 = fadd <8 x double> %138, %143
  %145 = fadd <8 x double> %144, %137
  %146 = fadd <8 x double> %141, %145
  %147 = ashr <8 x i32> %75, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %148 = add nsw <8 x i32> %147, <i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023>
  %149 = bitcast <8 x i32> %148 to <4 x i64>
  %150 = shufflevector <4 x i64> %149, <4 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef>
  %151 = bitcast <8 x i64> %150 to <16 x i32>
  %152 = shufflevector <16 x i32> %151, <16 x i32> undef, <16 x i32> <i32 undef, i32 0, i32 undef, i32 1, i32 undef, i32 2, i32 undef, i32 3, i32 undef, i32 4, i32 undef, i32 5, i32 undef, i32 6, i32 undef, i32 7>
  %153 = shufflevector <16 x i32> <i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef>, <16 x i32> %152, <16 x i32> <i32 0, i32 17, i32 2, i32 19, i32 4, i32 21, i32 6, i32 23, i32 8, i32 25, i32 10, i32 27, i32 12, i32 29, i32 14, i32 31>
  %154 = shl <16 x i32> %153, <i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20>
  %155 = bitcast <16 x i32> %154 to <8 x double>
  %156 = fmul <8 x double> %142, %155
  %157 = add <8 x i32> %75, <i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023>
  %158 = sub <8 x i32> %157, %147
  %159 = bitcast <8 x i32> %158 to <4 x i64>
  %160 = shufflevector <4 x i64> %159, <4 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef>
  %161 = bitcast <8 x i64> %160 to <16 x i32>
  %162 = shufflevector <16 x i32> %161, <16 x i32> undef, <16 x i32> <i32 undef, i32 0, i32 undef, i32 1, i32 undef, i32 2, i32 undef, i32 3, i32 undef, i32 4, i32 undef, i32 5, i32 undef, i32 6, i32 undef, i32 7>
  %163 = shufflevector <16 x i32> <i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef>, <16 x i32> %162, <16 x i32> <i32 0, i32 17, i32 2, i32 19, i32 4, i32 21, i32 6, i32 23, i32 8, i32 25, i32 10, i32 27, i32 12, i32 29, i32 14, i32 31>
  %164 = shl <16 x i32> %163, <i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20>
  %165 = bitcast <16 x i32> %164 to <8 x double>
  %166 = fmul <8 x double> %156, %165
  %167 = fmul <8 x double> %146, %155
  %168 = fmul <8 x double> %167, %165
  %169 = fcmp olt <8 x double> %56, <double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03>
  %170 = select <8 x i1> %169, <8 x double> zeroinitializer, <8 x double> %166
  %171 = select <8 x i1> %169, <8 x double> zeroinitializer, <8 x double> %168
  %172 = bitcast <8 x double> %170 to <8 x i64>
  %173 = xor <8 x i64> %172, <i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808>
  %174 = bitcast <8 x double> %171 to <8 x i64>
  %175 = xor <8 x i64> %174, <i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808>
  %176 = bitcast <8 x i64> %173 to <8 x double>
  %177 = bitcast <8 x i64> %175 to <8 x double>
  %178 = fadd <8 x double> %176, <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
  %179 = fsub <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %178
  %180 = fadd <8 x double> %179, %176
  %181 = fadd <8 x double> %180, %177
  %182 = select <8 x i1> %5, <8 x double> %64, <8 x double> %178
  %183 = select <8 x i1> %5, <8 x double> %67, <8 x double> %181
  %184 = fadd <8 x double> %182, %183
  %185 = select <8 x i1> %7, <8 x double> %184, <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
  %186 = bitcast <8 x double> %185 to <8 x i64>
  %187 = and <8 x i64> %2, <i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808>
  %188 = xor <8 x i64> %187, %186
  %189 = bitcast <8 x i64> %188 to <8 x double>
  %190 = fcmp uno <8 x double> %4, zeroinitializer
  %191 = select <8 x i1> %190, <8 x double> <double 0x7FF8000000000000, double 0x7FF8000000000000, double 0x7FF8000000000000, double 0x7FF8000000000000, double 0x7FF8000000000000, double 0x7FF8000000000000, double 0x7FF8000000000000, double 0x7FF8000000000000>, <8 x double> %189
  ret <8 x double> %191
"""), Vec{8,Float64}, Tuple{Vec{8,Float64}}, v)
end

@inline function erf_fast(v::Vec{8,Float64})
    Base.llvmcall(("""
declare <8 x double> @llvm.fma.v8f64(<8 x double>, <8 x double>, <8 x double>)
declare <4 x double> @llvm.x86.avx.round.pd.256(<4 x double>, i32)
declare <8 x i32> @llvm.x86.avx512.mask.cvtpd2dq.512(<8 x double>, <8 x i32>, i8, i32)
declare <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double>, <8 x i64>) 
""","""
  %2 = bitcast <8 x double> %0 to <8 x i64>
  %3 = and <8 x i64> %2, <i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807, i64 9223372036854775807>
  %4 = bitcast <8 x i64> %3 to <8 x double>
  %5 = fcmp olt <8 x double> %4, <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
  %6 = fcmp olt <8 x double> %4, <double 2.200000e+00, double 2.200000e+00, double 2.200000e+00, double 2.200000e+00, double 2.200000e+00, double 2.200000e+00, double 2.200000e+00, double 2.200000e+00>
  %7 = fcmp olt <8 x double> %4, <double 4.200000e+00, double 4.200000e+00, double 4.200000e+00, double 4.200000e+00, double 4.200000e+00, double 4.200000e+00, double 4.200000e+00, double 4.200000e+00>
  %8 = fcmp olt <8 x double> %4, <double 2.730000e+01, double 2.730000e+01, double 2.730000e+01, double 2.730000e+01, double 2.730000e+01, double 2.730000e+01, double 2.730000e+01, double 2.730000e+01>
  %9 = fmul <8 x double> %4, %4
  %10 = fneg <8 x double> %9
  %11 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %4, <8 x double> %10) #13
  %12 = fdiv <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %4
  %13 = fneg <8 x double> %12
  %14 = fsub <8 x double> %12, %12
  %15 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %4, <8 x double> %13, <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #13
  %16 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %13, <8 x double> zeroinitializer, <8 x double> %15) #13
  %17 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %12, <8 x double> zeroinitializer, <8 x double> %14) #13
  %18 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %12, <8 x double> %16, <8 x double> %17) #13
  %19 = select <8 x i1> %6, <8 x double> %4, <8 x double> %12
  %20 = select <8 x i1> %6, <8 x double> zeroinitializer, <8 x double> %18
  %21 = select <8 x i1> %5, <8 x double> %9, <8 x double> %19
  %22 = select <8 x i1> %5, <8 x double> %11, <8 x double> %20
  %23 = select <8 x i1> %7, <8 x i64> <i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2>, <8 x i64> <i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3>
  %24 = select <8 x i1> %6, <8 x i64> <i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1>, <8 x i64> %23
  %25 = select <8 x i1> %5, <8 x i64> zeroinitializer, <8 x i64> %24
  %26 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3BC00EFEFABE9897, double 0x3D58315E6C186224, double 0xC04CCA024E41FBF2, double 0x40D6CB9FD3B439A9, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %27 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBC0FE6EC06B043F2, double 0xBDAB33CF696F6246, double 0x407D2EDD0AE020CC, double 0xC0E6ED9388CD091B, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %28 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %26, <8 x double> %21, <8 x double> %27) #13
  %29 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3C55A7F67BDE0C13, double 0x3DED1C000C3FE200, double 0xC09C1151CBEBE895, double 0x40DEFD81FD565E63, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %30 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %28, <8 x double> %21, <8 x double> %29) #13
  %31 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBC9A15164BF4F369, double 0xBE23ACFF2B1B8BEC, double 0x40B103E466CE6960, double 0x40A955F72FDA349C, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %32 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %30, <8 x double> %21, <8 x double> %31) #13
  %33 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3CDD6F95068FEEA4, double 0x3E52C76D37FDB57D, double 0xC0BD20424648FD63, double 0xC0D3ACCB8514AB13, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %34 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %32, <8 x double> %21, <8 x double> %33) #13
  %35 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBD1F56D9FF51274F, double 0xBE7ABA200DE4015C, double 0x40C2A8FD1A1289EB, double 0x40CE5A08EC3F1AF9, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %36 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %34, <8 x double> %21, <8 x double> %35) #13
  %37 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3D5F683984140301, double 0x3E9D0EE6A4A80D73, double 0xC0C27F028C42F7FD, double 0xC0B806DFCAF3E8F0, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %38 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %36, <8 x double> %21, <8 x double> %37) #13
  %39 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBD9D8453B9E7FD78, double 0xBEB8137ED27E2624, double 0x40BCDB58257A0C6D, double 0x40936030E9797DA0, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %40 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %38, <8 x double> %21, <8 x double> %39) #13
  %41 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3DD9E6AD5DAB7037, double 0x3ECD0697CBB9A376, double 0xC0B1CDB68AB7C4E4, double 0xC054869BB9D7AF08, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %42 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %40, <8 x double> %21, <8 x double> %41) #13
  %43 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBE151D7181C08BA0, double 0xBED4ECCCA37D22C1, double 0x40A13FBBE32520BC, double 0x4040365402C89D37, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %44 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %42, <8 x double> %21, <8 x double> %43) #13
  %45 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3E4FCC572062092A, double 0xBEB5F5266774B791, double 0xC089AE616A35F399, double 0xC03D3BF3C95EBAA1, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %46 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %44, <8 x double> %21, <8 x double> %45) #13
  %47 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBE85F742EC43E5BC, double 0x3EFD9F88B02EA0EC, double 0x406C5BB5D950D59F, double 0x3FD620B48EBD7FD2, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %48 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %46, <8 x double> %21, <8 x double> %47) #13
  %49 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3EBB9E6C9DC6519D, double 0xBF10C2E202FB0D80, double 0xC0472AB3D15A1B99, double 0x4015F57BD26EB8D7, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %50 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %48, <8 x double> %21, <8 x double> %49) #13
  %51 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBEEF4D25C3E0C2E2, double 0xBEFAE939BE608207, double 0x40231D60ED75C166, double 0x3F598ED6853E65C9, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %52 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %50, <8 x double> %21, <8 x double> %51) #13
  %53 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3F1F9A326F9B89C2, double 0x3F4351BFC5997AEF, double 0xC007AADCFF61A9EE, double 0xBFF8AAF93486CD89, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %54 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %52, <8 x double> %21, <8 x double> %53) #13
  %55 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBF4C02DB40040B83, double 0xBF5BC858BD2C3DEE, double 0x3FC56155F28A44A2, double 0x3EC7AEAC5A2C6C34, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %56 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %54, <8 x double> %21, <8 x double> %55) #13
  %57 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3F7565BCD0E6A53F, double 0x3F2B61E95A64E1B4, double 0x3FE38258FA079AD9, double 0x3FE3FFFFD433AA8A, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %58 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %56, <8 x double> %21, <8 x double> %57) #13
  %59 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBF9B82CE31288B51, double 0x3F93966FE5D12A2E, double 0x3F515AA8B364E28B, double 0x3E1DEC4B817418DD, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %60 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %58, <8 x double> %21, <8 x double> %59) #13
  %61 = fmul <8 x double> %21, %60
  %62 = fneg <8 x double> %61
  %63 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %21, <8 x double> %60, <8 x double> %62) #13
  %64 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %22, <8 x double> %60, <8 x double> %63) #13
  %65 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3FBCE2F21A042BE2, double 0xBFBA4F4EAB8311A0, double 0xBFE0006CA4753FC8, double 0xBFE0000000038D52, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %66 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBC52871BC5EF8ED7, double 0xBC5CBFA8068241AE, double 0x3C7E64BB064EBF0B, double 0xBC8719E29ACB2723, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %67 = fadd <8 x double> %65, %61
  %68 = fsub <8 x double> %67, %61
  %69 = fsub <8 x double> %67, %68
  %70 = fsub <8 x double> %61, %69
  %71 = fsub <8 x double> %65, %68
  %72 = fadd <8 x double> %71, %70
  %73 = fadd <8 x double> %66, %64
  %74 = fadd <8 x double> %73, %72
  %75 = fmul <8 x double> %21, %67
  %76 = fneg <8 x double> %75
  %77 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %67, <8 x double> %21, <8 x double> %76) #13
  %78 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %74, <8 x double> %21, <8 x double> %77) #13
  %79 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %67, <8 x double> %22, <8 x double> %78) #13
  %80 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0xBFD812746B0379E7, double 0xBFE45F306B230D62, double 0x3EBADCB2F72A1080, double 0x3D50B89397C75A64, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %81 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3C6EE12E49CAD52E, double 0x3C619932A20CE10B, double 0x3B2CF38C548C5245, double 0xB9ED96501FDC09B6, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %82 = fadd <8 x double> %80, %75
  %83 = fsub <8 x double> %82, %75
  %84 = fsub <8 x double> %82, %83
  %85 = fsub <8 x double> %75, %84
  %86 = fsub <8 x double> %80, %83
  %87 = fadd <8 x double> %86, %85
  %88 = fadd <8 x double> %81, %79
  %89 = fadd <8 x double> %87, %88
  %90 = fmul <8 x double> %21, %82
  %91 = fneg <8 x double> %90
  %92 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %82, <8 x double> %21, <8 x double> %91) #13
  %93 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %89, <8 x double> %21, <8 x double> %92) #13
  %94 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %82, <8 x double> %22, <8 x double> %93) #13
  %95 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3FF20DD750429B6D, double 0xBFF20DD7505C75E8, double 0xBFE250D055891FD0, double 0xBFE250D048E7A1C6, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %96 = tail call <8 x double> @llvm.x86.avx512.permvar.df.512(<8 x double> <double 0x3C71AE3A914FED6D, double 0x3C9751223FE9154D, double 0x3C81B3313996DEA7, double 0xBC7BA6EE6A6AB496, double undef, double undef, double undef, double undef>, <8 x i64> %25) #13
  %97 = fadd <8 x double> %95, %90
  %98 = fsub <8 x double> %97, %90
  %99 = fsub <8 x double> %97, %98
  %100 = fsub <8 x double> %90, %99
  %101 = fsub <8 x double> %95, %98
  %102 = fadd <8 x double> %101, %100
  %103 = fadd <8 x double> %96, %94
  %104 = fadd <8 x double> %102, %103
  %105 = or <8 x i64> %2, <i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808, i64 -9223372036854775808>
  %106 = bitcast <8 x i64> %105 to <8 x double>
  %107 = select <8 x i1> %6, <8 x double> %97, <8 x double> %106
  %108 = select <8 x i1> %6, <8 x double> %104, <8 x double> zeroinitializer
  %109 = fmul <8 x double> %107, %4
  %110 = fneg <8 x double> %109
  %111 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %107, <8 x double> %4, <8 x double> %110) #13
  %112 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %108, <8 x double> %4, <8 x double> %111) #13
  %113 = fadd <8 x double> %97, %109
  %114 = fsub <8 x double> %113, %109
  %115 = fsub <8 x double> %113, %114
  %116 = fsub <8 x double> %109, %115
  %117 = fsub <8 x double> %97, %114
  %118 = fadd <8 x double> %117, %116
  %119 = fadd <8 x double> %104, %112
  %120 = fadd <8 x double> %118, %119
  %121 = select <8 x i1> %6, <8 x double> %109, <8 x double> %113
  %122 = select <8 x i1> %6, <8 x double> %112, <8 x double> %120
  %123 = fsub <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %121
  %124 = fsub <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %123
  %125 = fsub <8 x double> %124, %121
  %126 = fadd <8 x double> %125, zeroinitializer
  %127 = fsub <8 x double> %126, %122
  %128 = fadd <8 x double> %121, %122
  %129 = fmul <8 x double> %128, <double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE>
  %130 = shufflevector <8 x double> %129, <8 x double> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %131 = shufflevector <8 x double> %129, <8 x double> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %132 = tail call <4 x double> @llvm.x86.avx.round.pd.256(<4 x double> %130, i32 8) #13
  %133 = tail call <4 x double> @llvm.x86.avx.round.pd.256(<4 x double> %131, i32 8) #13
  %134 = shufflevector <4 x double> %133, <4 x double> %132, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %135 = tail call <8 x i32> @llvm.x86.avx512.mask.cvtpd2dq.512(<8 x double> %134, <8 x i32> zeroinitializer, i8 -1, i32 8) #13
  %136 = fmul <8 x double> %134, <double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000>
  %137 = fadd <8 x double> %136, %121
  %138 = fsub <8 x double> %137, %121
  %139 = fsub <8 x double> %137, %138
  %140 = fsub <8 x double> %121, %139
  %141 = fsub <8 x double> %136, %138
  %142 = fadd <8 x double> %141, %140
  %143 = fadd <8 x double> %142, %122
  %144 = fmul <8 x double> %134, <double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6>
  %145 = fadd <8 x double> %144, %137
  %146 = fsub <8 x double> %145, %137
  %147 = fsub <8 x double> %145, %146
  %148 = fsub <8 x double> %137, %147
  %149 = fsub <8 x double> %144, %146
  %150 = fadd <8 x double> %149, %148
  %151 = fadd <8 x double> %150, %143
  %152 = fmul <8 x double> %145, %145
  %153 = fadd <8 x double> %145, %145
  %154 = fneg <8 x double> %152
  %155 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %145, <8 x double> %145, <8 x double> %154) #13
  %156 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %153, <8 x double> %151, <8 x double> %155) #13
  %157 = fmul <8 x double> %152, %152
  %158 = fadd <8 x double> %152, %152
  %159 = fneg <8 x double> %157
  %160 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %152, <8 x double> %152, <8 x double> %159) #13
  %161 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %158, <8 x double> %156, <8 x double> %160) #13
  %162 = fmul <8 x double> %157, %157
  %163 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %145, <8 x double> <double 0x3DE60632A887194C, double 0x3DE60632A887194C, double 0x3DE60632A887194C, double 0x3DE60632A887194C, double 0x3DE60632A887194C, double 0x3DE60632A887194C, double 0x3DE60632A887194C, double 0x3DE60632A887194C>, <8 x double> <double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC, double 0x3E21F8EAF54829DC>) #13
  %164 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %145, <8 x double> <double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6, double 0x3E5AE652E8103AB6>, <8 x double> <double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C, double 0x3E927E4C95A9765C>) #13
  %165 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %145, <8 x double> <double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656, double 0x3EC71DE3A11D7656>, <8 x double> <double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7, double 0x3EFA01A01AF6F0B7>) #13
  %166 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %152, <8 x double> %164, <8 x double> %165) #13
  %167 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %145, <8 x double> <double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002, double 0x3F2A01A01A02D002>, <8 x double> <double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC, double 0x3F56C16C16C145CC>) #13
  %168 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %145, <8 x double> <double 0x3F81111111111119, double 0x3F81111111111119, double 0x3F81111111111119, double 0x3F81111111111119, double 0x3F81111111111119, double 0x3F81111111111119, double 0x3F81111111111119, double 0x3F81111111111119>, <8 x double> <double 0x3FA555555555555A, double 0x3FA555555555555A, double 0x3FA555555555555A, double 0x3FA555555555555A, double 0x3FA555555555555A, double 0x3FA555555555555A, double 0x3FA555555555555A, double 0x3FA555555555555A>) #13
  %169 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %152, <8 x double> %167, <8 x double> %168) #13
  %170 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %157, <8 x double> %166, <8 x double> %169) #13
  %171 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %162, <8 x double> %163, <8 x double> %170) #13
  %172 = fmul <8 x double> %145, <double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555>
  %173 = fneg <8 x double> %172
  %174 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %145, <8 x double> <double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555>, <8 x double> %173) #13
  %175 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %151, <8 x double> <double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555, double 0x3FC5555555555555>, <8 x double> %174) #13
  %176 = fadd <8 x double> %172, <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>
  %177 = fsub <8 x double> <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>, %176
  %178 = fadd <8 x double> %172, %177
  %179 = fadd <8 x double> %178, %175
  %180 = fmul <8 x double> %145, %176
  %181 = fneg <8 x double> %180
  %182 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %176, <8 x double> %145, <8 x double> %181) #13
  %183 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %179, <8 x double> %145, <8 x double> %182) #13
  %184 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %176, <8 x double> %151, <8 x double> %183) #13
  %185 = fadd <8 x double> %180, <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
  %186 = fsub <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %185
  %187 = fadd <8 x double> %180, %186
  %188 = fadd <8 x double> %187, %184
  %189 = fmul <8 x double> %145, %185
  %190 = fneg <8 x double> %189
  %191 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %185, <8 x double> %145, <8 x double> %190) #13
  %192 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %188, <8 x double> %145, <8 x double> %191) #13
  %193 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %185, <8 x double> %151, <8 x double> %192) #13
  %194 = fadd <8 x double> %189, <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
  %195 = fsub <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>, %194
  %196 = fadd <8 x double> %189, %195
  %197 = fadd <8 x double> %196, %193
  %198 = fmul <8 x double> %157, %171
  %199 = fneg <8 x double> %198
  %200 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %157, <8 x double> %171, <8 x double> %199) #13
  %201 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %161, <8 x double> %171, <8 x double> %200) #13
  %202 = fadd <8 x double> %198, %194
  %203 = fsub <8 x double> %194, %202
  %204 = fadd <8 x double> %198, %203
  %205 = fadd <8 x double> %204, %197
  %206 = fadd <8 x double> %201, %205
  %207 = ashr <8 x i32> %135, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %208 = add nsw <8 x i32> %207, <i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023>
  %209 = bitcast <8 x i32> %208 to <4 x i64>
  %210 = shufflevector <4 x i64> %209, <4 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef>
  %211 = bitcast <8 x i64> %210 to <16 x i32>
  %212 = shufflevector <16 x i32> %211, <16 x i32> undef, <16 x i32> <i32 undef, i32 0, i32 undef, i32 1, i32 undef, i32 2, i32 undef, i32 3, i32 undef, i32 4, i32 undef, i32 5, i32 undef, i32 6, i32 undef, i32 7>
  %213 = shufflevector <16 x i32> <i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef>, <16 x i32> %212, <16 x i32> <i32 0, i32 17, i32 2, i32 19, i32 4, i32 21, i32 6, i32 23, i32 8, i32 25, i32 10, i32 27, i32 12, i32 29, i32 14, i32 31>
  %214 = shl <16 x i32> %213, <i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20>
  %215 = bitcast <16 x i32> %214 to <8 x double>
  %216 = fmul <8 x double> %202, %215
  %217 = add <8 x i32> %135, <i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023>
  %218 = sub <8 x i32> %217, %207
  %219 = bitcast <8 x i32> %218 to <4 x i64>
  %220 = shufflevector <4 x i64> %219, <4 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef>
  %221 = bitcast <8 x i64> %220 to <16 x i32>
  %222 = shufflevector <16 x i32> %221, <16 x i32> undef, <16 x i32> <i32 undef, i32 0, i32 undef, i32 1, i32 undef, i32 2, i32 undef, i32 3, i32 undef, i32 4, i32 undef, i32 5, i32 undef, i32 6, i32 undef, i32 7>
  %223 = shufflevector <16 x i32> <i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef>, <16 x i32> %222, <16 x i32> <i32 0, i32 17, i32 2, i32 19, i32 4, i32 21, i32 6, i32 23, i32 8, i32 25, i32 10, i32 27, i32 12, i32 29, i32 14, i32 31>
  %224 = shl <16 x i32> %223, <i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20>
  %225 = bitcast <16 x i32> %224 to <8 x double>
  %226 = fmul <8 x double> %216, %225
  %227 = fmul <8 x double> %206, %215
  %228 = fmul <8 x double> %227, %225
  %229 = fcmp olt <8 x double> %121, <double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03>
  %230 = select <8 x i1> %229, <8 x double> zeroinitializer, <8 x double> %226
  %231 = select <8 x i1> %229, <8 x double> zeroinitializer, <8 x double> %228
  %232 = select <8 x i1> %5, <8 x double> %123, <8 x double> %230
  %233 = select <8 x i1> %5, <8 x double> %127, <8 x double> %231
  %234 = fmul <8 x double> %21, %232
  %235 = fneg <8 x double> %234
  %236 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %232, <8 x double> %21, <8 x double> %235) #13
  %237 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %233, <8 x double> %21, <8 x double> %236) #13
  %238 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %232, <8 x double> %22, <8 x double> %237) #13
  %239 = select <8 x i1> %6, <8 x double> %232, <8 x double> %234
  %240 = select <8 x i1> %6, <8 x double> %233, <8 x double> %238
  %241 = fadd <8 x double> %239, %240
  %242 = select <8 x i1> %8, <8 x double> %241, <8 x double> zeroinitializer
  %243 = icmp slt <8 x i64> %2, zeroinitializer
  %244 = fsub <8 x double> <double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00>, %242
  %245 = select <8 x i1> %243, <8 x double> %244, <8 x double> %242
  %246 = fcmp uno <8 x double> %0, zeroinitializer
  %247 = select <8 x i1> %246, <8 x double> <double 0x7FF8000000000000, double 0x7FF8000000000000, double 0x7FF8000000000000, double 0x7FF8000000000000, double 0x7FF8000000000000, double 0x7FF8000000000000, double 0x7FF8000000000000, double 0x7FF8000000000000>, <8 x double> %245
  ret <8 x double> %247
"""), Vec{8,Float64}, Tuple{Vec{8,Float64}}, v)
end


@inline function log_fast(v::Vec{8,Float64})
    Base.llvmcall(("""
declare <8 x double> @llvm.fma.v8f64(<8 x double>, <8 x double>, <8 x double>)
declare <8 x double> @llvm.x86.avx512.mask.fixupimm.pd.512(<8 x double>, <8 x double>, <8 x i64>, i32, i8, i32)
declare <8 x double> @llvm.x86.avx512.mask.getexp.pd.512(<8 x double>, <8 x double>, i8, i32)
declare <8 x double> @llvm.x86.avx512.mask.getmant.pd.512(<8 x double>, i32, <8 x double>, i8, i32)
""","""
 %2 = fmul <8 x double> %0, <double 0x3FF5555555555555, double 0x3FF5555555555555, double 0x3FF5555555555555, double 0x3FF5555555555555, double 0x3FF5555555555555, double 0x3FF5555555555555, double 0x3FF5555555555555, double 0x3FF5555555555555>
  %3 = tail call <8 x double> @llvm.x86.avx512.mask.getexp.pd.512(<8 x double> %2, <8 x double> zeroinitializer, i8 -1, i32 4) #13
  %4 = fcmp oeq <8 x double> %3, <double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000>
  %5 = tail call <8 x double> @llvm.x86.avx512.mask.getmant.pd.512(<8 x double> %0, i32 11, <8 x double> zeroinitializer, i8 -1, i32 4) #13
  %6 = fadd <8 x double> %5, <double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00, double -1.000000e+00>
  %7 = fadd <8 x double> %5, <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>
  %8 = fdiv <8 x double> %6, %7
  %9 = fmul <8 x double> %8, %8
  %10 = fmul <8 x double> %9, %9
  %11 = fmul <8 x double> %10, %10
  %12 = fmul <8 x double> %8, %9
  %13 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %9, <8 x double> <double 0x3FC385C5CBC3F50D, double 0x3FC385C5CBC3F50D, double 0x3FC385C5CBC3F50D, double 0x3FC385C5CBC3F50D, double 0x3FC385C5CBC3F50D, double 0x3FC385C5CBC3F50D, double 0x3FC385C5CBC3F50D, double 0x3FC385C5CBC3F50D>, <8 x double> <double 0x3FC7474BA672B05F, double 0x3FC7474BA672B05F, double 0x3FC7474BA672B05F, double 0x3FC7474BA672B05F, double 0x3FC7474BA672B05F, double 0x3FC7474BA672B05F, double 0x3FC7474BA672B05F, double 0x3FC7474BA672B05F>) #13
  %14 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %10, <8 x double> <double 0x3FC3A5791D95DB39, double 0x3FC3A5791D95DB39, double 0x3FC3A5791D95DB39, double 0x3FC3A5791D95DB39, double 0x3FC3A5791D95DB39, double 0x3FC3A5791D95DB39, double 0x3FC3A5791D95DB39, double 0x3FC3A5791D95DB39>, <8 x double> %13) #13
  %15 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %9, <8 x double> <double 0x3FCC71BFEED5D419, double 0x3FCC71BFEED5D419, double 0x3FCC71BFEED5D419, double 0x3FCC71BFEED5D419, double 0x3FCC71BFEED5D419, double 0x3FCC71BFEED5D419, double 0x3FCC71BFEED5D419, double 0x3FCC71BFEED5D419>, <8 x double> <double 0x3FD249249BFBE987, double 0x3FD249249BFBE987, double 0x3FD249249BFBE987, double 0x3FD249249BFBE987, double 0x3FD249249BFBE987, double 0x3FD249249BFBE987, double 0x3FD249249BFBE987, double 0x3FD249249BFBE987>) #13
  %16 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %9, <8 x double> <double 0x3FD99999998C136E, double 0x3FD99999998C136E, double 0x3FD99999998C136E, double 0x3FD99999998C136E, double 0x3FD99999998C136E, double 0x3FD99999998C136E, double 0x3FD99999998C136E, double 0x3FD99999998C136E>, <8 x double> <double 0x3FE555555555593F, double 0x3FE555555555593F, double 0x3FE555555555593F, double 0x3FE555555555593F, double 0x3FE555555555593F, double 0x3FE555555555593F, double 0x3FE555555555593F, double 0x3FE555555555593F>) #13
  %17 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %10, <8 x double> %15, <8 x double> %16) #13
  %18 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %11, <8 x double> %14, <8 x double> %17) #13
  %19 = fmul <8 x double> %3, <double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF>
  %20 = select <8 x i1> %4, <8 x double> <double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF, double 0x40862E42FEFA39EF>, <8 x double> %19
  %21 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %8, <8 x double> <double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00, double 2.000000e+00>, <8 x double> %20) #13
  %22 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %12, <8 x double> %18, <8 x double> %21) #13
  %23 = tail call <8 x double> @llvm.x86.avx512.mask.fixupimm.pd.512(<8 x double> %22, <8 x double> %0, <8 x i64> <i64 22517998142095360, i64 22517998142095360, i64 22517998142095360, i64 22517998142095360, i64 22517998142095360, i64 22517998142095360, i64 22517998142095360, i64 22517998142095360>, i32 0, i8 -1, i32 4)
  ret <8 x double> %23
"""), Vec{8,Float64}, Tuple{Vec{8,Float64}}, v)
end

@inline function vexp2(v::Vec{8,Float64})
    Base.llvmcall(("""
declare <4 x double> @llvm.x86.avx.round.pd.256(<4 x double>, i32)
declare <8 x i32> @llvm.x86.avx512.mask.cvtpd2dq.512(<8 x double>, <8 x i32>, i8, i32)
declare <8 x double> @llvm.fma.v8f64(<8 x double>, <8 x double>, <8 x double>)
""","""
  %2 = shufflevector <8 x double> %0, <8 x double> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %3 = shufflevector <8 x double> %0, <8 x double> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %4 = tail call <4 x double> @llvm.x86.avx.round.pd.256(<4 x double> %2, i32 8) #13
  %5 = tail call <4 x double> @llvm.x86.avx.round.pd.256(<4 x double> %3, i32 8) #13
  %6 = shufflevector <4 x double> %5, <4 x double> %4, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %7 = tail call <8 x i32> @llvm.x86.avx512.mask.cvtpd2dq.512(<8 x double> %6, <8 x i32> zeroinitializer, i8 -1, i32 8) #13
  %8 = fsub <8 x double> %0, %6
  %9 = fmul <8 x double> %8, %8
  %10 = fmul <8 x double> %9, %9
  %11 = fmul <8 x double> %10, %10
  %12 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %8, <8 x double> <double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150>, <8 x double> <double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17>) #13
  %13 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %8, <8 x double> <double 0x3E7B5266946BF979, double 0x3E7B5266946BF979, double 0x3E7B5266946BF979, double 0x3E7B5266946BF979, double 0x3E7B5266946BF979, double 0x3E7B5266946BF979, double 0x3E7B5266946BF979, double 0x3E7B5266946BF979>, <8 x double> <double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81>) #13
  %14 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %8, <8 x double> <double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80>, <8 x double> <double 0x3F24309130CB34EC, double 0x3F24309130CB34EC, double 0x3F24309130CB34EC, double 0x3F24309130CB34EC, double 0x3F24309130CB34EC, double 0x3F24309130CB34EC, double 0x3F24309130CB34EC, double 0x3F24309130CB34EC>) #13
  %15 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %9, <8 x double> %13, <8 x double> %14) #13
  %16 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %8, <8 x double> <double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960>, <8 x double> <double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0>) #13
  %17 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %8, <8 x double> <double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F>, <8 x double> <double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1>) #13
  %18 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %9, <8 x double> %16, <8 x double> %17) #13
  %19 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %10, <8 x double> %15, <8 x double> %18) #13
  %20 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %11, <8 x double> %12, <8 x double> %19) #13
  %21 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %20, <8 x double> %8, <8 x double> <double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF>) #13
  %22 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %21, <8 x double> %8, <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #13
  %23 = ashr <8 x i32> %7, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %24 = add nsw <8 x i32> %23, <i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023>
  %25 = bitcast <8 x i32> %24 to <4 x i64>
  %26 = shufflevector <4 x i64> %25, <4 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef>
  %27 = bitcast <8 x i64> %26 to <16 x i32>
  %28 = shufflevector <16 x i32> %27, <16 x i32> undef, <16 x i32> <i32 undef, i32 0, i32 undef, i32 1, i32 undef, i32 2, i32 undef, i32 3, i32 undef, i32 4, i32 undef, i32 5, i32 undef, i32 6, i32 undef, i32 7>
  %29 = shufflevector <16 x i32> <i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef>, <16 x i32> %28, <16 x i32> <i32 0, i32 17, i32 2, i32 19, i32 4, i32 21, i32 6, i32 23, i32 8, i32 25, i32 10, i32 27, i32 12, i32 29, i32 14, i32 31>
  %30 = shl <16 x i32> %29, <i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20>
  %31 = bitcast <16 x i32> %30 to <8 x double>
  %32 = fmul <8 x double> %22, %31
  %33 = add <8 x i32> %7, <i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023>
  %34 = sub <8 x i32> %33, %23
  %35 = bitcast <8 x i32> %34 to <4 x i64>
  %36 = shufflevector <4 x i64> %35, <4 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef>
  %37 = bitcast <8 x i64> %36 to <16 x i32>
  %38 = shufflevector <16 x i32> %37, <16 x i32> undef, <16 x i32> <i32 undef, i32 0, i32 undef, i32 1, i32 undef, i32 2, i32 undef, i32 3, i32 undef, i32 4, i32 undef, i32 5, i32 undef, i32 6, i32 undef, i32 7>
  %39 = shufflevector <16 x i32> <i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef>, <16 x i32> %38, <16 x i32> <i32 0, i32 17, i32 2, i32 19, i32 4, i32 21, i32 6, i32 23, i32 8, i32 25, i32 10, i32 27, i32 12, i32 29, i32 14, i32 31>
  %40 = shl <16 x i32> %39, <i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20>
  %41 = bitcast <16 x i32> %40 to <8 x double>
  %42 = fmul <8 x double> %32, %41
  %43 = fcmp oge <8 x double> %0, <double 1.024000e+03, double 1.024000e+03, double 1.024000e+03, double 1.024000e+03, double 1.024000e+03, double 1.024000e+03, double 1.024000e+03, double 1.024000e+03>
  %44 = select <8 x i1> %43, <8 x double> <double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000>, <8 x double> %42
  %45 = fcmp olt <8 x double> %0, <double -2.000000e+03, double -2.000000e+03, double -2.000000e+03, double -2.000000e+03, double -2.000000e+03, double -2.000000e+03, double -2.000000e+03, double -2.000000e+03>
  %46 = select <8 x i1> %45, <8 x double> zeroinitializer, <8 x double> %44
  ret <8 x double> %46
"""), Vec{8,Float64}, Tuple{Vec{8,Float64}}, v)
end

@inline function vexp2_fast(v::Vec{8,Float64})
    Base.llvmcall(("""
declare <4 x double> @llvm.x86.avx.round.pd.256(<4 x double>, i32)
declare <8 x i32> @llvm.x86.avx512.mask.cvtpd2dq.512(<8 x double>, <8 x i32>, i8, i32)
declare <8 x double> @llvm.fma.v8f64(<8 x double>, <8 x double>, <8 x double>)
""","""
  %2 = shufflevector <8 x double> %0, <8 x double> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %3 = shufflevector <8 x double> %0, <8 x double> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %4 = tail call <4 x double> @llvm.x86.avx.round.pd.256(<4 x double> %2, i32 8) #13
  %5 = tail call <4 x double> @llvm.x86.avx.round.pd.256(<4 x double> %3, i32 8) #13
  %6 = shufflevector <4 x double> %5, <4 x double> %4, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %7 = tail call <8 x i32> @llvm.x86.avx512.mask.cvtpd2dq.512(<8 x double> %6, <8 x i32> zeroinitializer, i8 -1, i32 8) #13
  %8 = fsub <8 x double> %0, %6
  %9 = fmul <8 x double> %8, %8
  %10 = fmul <8 x double> %9, %9
  %11 = fmul <8 x double> %10, %10
  %12 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %8, <8 x double> <double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150, double 0x3DFE7901CA95E150>, <8 x double> <double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17, double 0x3E3E6106D72C1C17>) #13
  %13 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %8, <8 x double> <double 0x3E7B5266946BF979, double 0x3E7B5266946BF979, double 0x3E7B5266946BF979, double 0x3E7B5266946BF979, double 0x3E7B5266946BF979, double 0x3E7B5266946BF979, double 0x3E7B5266946BF979, double 0x3E7B5266946BF979>, <8 x double> <double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81, double 0x3EB62BFCDABCBB81>) #13
  %14 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %8, <8 x double> <double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80, double 0x3EEFFCBFBC12CC80>, <8 x double> <double 0x3F24309130CB34EC, double 0x3F24309130CB34EC, double 0x3F24309130CB34EC, double 0x3F24309130CB34EC, double 0x3F24309130CB34EC, double 0x3F24309130CB34EC, double 0x3F24309130CB34EC, double 0x3F24309130CB34EC>) #13
  %15 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %9, <8 x double> %13, <8 x double> %14) #13
  %16 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %8, <8 x double> <double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960, double 0x3F55D87FE78C5960>, <8 x double> <double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0, double 0x3F83B2AB6FBA08F0>) #13
  %17 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %8, <8 x double> <double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F, double 0x3FAC6B08D704A01F>, <8 x double> <double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1, double 0x3FCEBFBDFF82C5A1>) #13
  %18 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %9, <8 x double> %16, <8 x double> %17) #13
  %19 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %10, <8 x double> %15, <8 x double> %18) #13
  %20 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %11, <8 x double> %12, <8 x double> %19) #13
  %21 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %20, <8 x double> %8, <8 x double> <double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF, double 0x3FE62E42FEFA39EF>) #13
  %22 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %21, <8 x double> %8, <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #13
  %23 = ashr <8 x i32> %7, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %24 = add nsw <8 x i32> %23, <i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023>
  %25 = bitcast <8 x i32> %24 to <4 x i64>
  %26 = shufflevector <4 x i64> %25, <4 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef>
  %27 = bitcast <8 x i64> %26 to <16 x i32>
  %28 = shufflevector <16 x i32> %27, <16 x i32> undef, <16 x i32> <i32 undef, i32 0, i32 undef, i32 1, i32 undef, i32 2, i32 undef, i32 3, i32 undef, i32 4, i32 undef, i32 5, i32 undef, i32 6, i32 undef, i32 7>
  %29 = shufflevector <16 x i32> <i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef>, <16 x i32> %28, <16 x i32> <i32 0, i32 17, i32 2, i32 19, i32 4, i32 21, i32 6, i32 23, i32 8, i32 25, i32 10, i32 27, i32 12, i32 29, i32 14, i32 31>
  %30 = shl <16 x i32> %29, <i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20>
  %31 = bitcast <16 x i32> %30 to <8 x double>
  %32 = fmul <8 x double> %22, %31
  %33 = add <8 x i32> %7, <i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023>
  %34 = sub <8 x i32> %33, %23
  %35 = bitcast <8 x i32> %34 to <4 x i64>
  %36 = shufflevector <4 x i64> %35, <4 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef>
  %37 = bitcast <8 x i64> %36 to <16 x i32>
  %38 = shufflevector <16 x i32> %37, <16 x i32> undef, <16 x i32> <i32 undef, i32 0, i32 undef, i32 1, i32 undef, i32 2, i32 undef, i32 3, i32 undef, i32 4, i32 undef, i32 5, i32 undef, i32 6, i32 undef, i32 7>
  %39 = shufflevector <16 x i32> <i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef>, <16 x i32> %38, <16 x i32> <i32 0, i32 17, i32 2, i32 19, i32 4, i32 21, i32 6, i32 23, i32 8, i32 25, i32 10, i32 27, i32 12, i32 29, i32 14, i32 31>
  %40 = shl <16 x i32> %39, <i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20>
  %41 = bitcast <16 x i32> %40 to <8 x double>
  %42 = fmul <8 x double> %32, %41
  %43 = fcmp oge <8 x double> %0, <double 1.024000e+03, double 1.024000e+03, double 1.024000e+03, double 1.024000e+03, double 1.024000e+03, double 1.024000e+03, double 1.024000e+03, double 1.024000e+03>
  %44 = select <8 x i1> %43, <8 x double> <double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000>, <8 x double> %42
  %45 = fcmp olt <8 x double> %0, <double -2.000000e+03, double -2.000000e+03, double -2.000000e+03, double -2.000000e+03, double -2.000000e+03, double -2.000000e+03, double -2.000000e+03, double -2.000000e+03>
  %46 = select <8 x i1> %45, <8 x double> zeroinitializer, <8 x double> %44
  ret <8 x double> %46
"""), Vec{8,Float64}, Tuple{Vec{8,Float64}}, v)
end

@inline function vexp(v::Vec{8,Float64})
    Base.llvmcall(("""
declare <4 x double> @llvm.x86.avx.round.pd.256(<4 x double>, i32)
declare <8 x i32> @llvm.x86.avx512.mask.cvtpd2dq.512(<8 x double>, <8 x i32>, i8, i32)
declare <8 x double> @llvm.fma.v8f64(<8 x double>, <8 x double>, <8 x double>)
""","""
  %2 = fmul <8 x double> %0, <double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE, double 0x3FF71547652B82FE>
  %3 = shufflevector <8 x double> %2, <8 x double> undef, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %4 = shufflevector <8 x double> %2, <8 x double> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %5 = tail call <4 x double> @llvm.x86.avx.round.pd.256(<4 x double> %3, i32 8) #13
  %6 = tail call <4 x double> @llvm.x86.avx.round.pd.256(<4 x double> %4, i32 8) #13
  %7 = shufflevector <4 x double> %6, <4 x double> %5, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %8 = tail call <8 x i32> @llvm.x86.avx512.mask.cvtpd2dq.512(<8 x double> %7, <8 x i32> zeroinitializer, i8 -1, i32 8) #13
  %9 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %7, <8 x double> <double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000, double 0xBFE62E42FEFA3000>, <8 x double> %0) #13
  %10 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %7, <8 x double> <double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6, double 0xBD53DE6AF278ECE6>, <8 x double> %9) #13
  %11 = fmul <8 x double> %10, %10
  %12 = fmul <8 x double> %11, %11
  %13 = fmul <8 x double> %12, %12
  %14 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %10, <8 x double> <double 0x3E21E0C670AFFF06, double 0x3E21E0C670AFFF06, double 0x3E21E0C670AFFF06, double 0x3E21E0C670AFFF06, double 0x3E21E0C670AFFF06, double 0x3E21E0C670AFFF06, double 0x3E21E0C670AFFF06, double 0x3E21E0C670AFFF06>, <8 x double> <double 0x3E5AF6C36F75740C, double 0x3E5AF6C36F75740C, double 0x3E5AF6C36F75740C, double 0x3E5AF6C36F75740C, double 0x3E5AF6C36F75740C, double 0x3E5AF6C36F75740C, double 0x3E5AF6C36F75740C, double 0x3E5AF6C36F75740C>) #13
  %15 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %10, <8 x double> <double 0x3E927E5D38A23654, double 0x3E927E5D38A23654, double 0x3E927E5D38A23654, double 0x3E927E5D38A23654, double 0x3E927E5D38A23654, double 0x3E927E5D38A23654, double 0x3E927E5D38A23654, double 0x3E927E5D38A23654>, <8 x double> <double 0x3EC71DDEF633FB47, double 0x3EC71DDEF633FB47, double 0x3EC71DDEF633FB47, double 0x3EC71DDEF633FB47, double 0x3EC71DDEF633FB47, double 0x3EC71DDEF633FB47, double 0x3EC71DDEF633FB47, double 0x3EC71DDEF633FB47>) #13
  %16 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %10, <8 x double> <double 0x3EFA01A0127F883A, double 0x3EFA01A0127F883A, double 0x3EFA01A0127F883A, double 0x3EFA01A0127F883A, double 0x3EFA01A0127F883A, double 0x3EFA01A0127F883A, double 0x3EFA01A0127F883A, double 0x3EFA01A0127F883A>, <8 x double> <double 0x3F2A01A01B4421FD, double 0x3F2A01A01B4421FD, double 0x3F2A01A01B4421FD, double 0x3F2A01A01B4421FD, double 0x3F2A01A01B4421FD, double 0x3F2A01A01B4421FD, double 0x3F2A01A01B4421FD, double 0x3F2A01A01B4421FD>) #13
  %17 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %11, <8 x double> %15, <8 x double> %16) #13
  %18 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %10, <8 x double> <double 0x3F56C16C16C3396B, double 0x3F56C16C16C3396B, double 0x3F56C16C16C3396B, double 0x3F56C16C16C3396B, double 0x3F56C16C16C3396B, double 0x3F56C16C16C3396B, double 0x3F56C16C16C3396B, double 0x3F56C16C16C3396B>, <8 x double> <double 0x3F8111111110E7A5, double 0x3F8111111110E7A5, double 0x3F8111111110E7A5, double 0x3F8111111110E7A5, double 0x3F8111111110E7A5, double 0x3F8111111110E7A5, double 0x3F8111111110E7A5, double 0x3F8111111110E7A5>) #13
  %19 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %10, <8 x double> <double 0x3FA55555555554F9, double 0x3FA55555555554F9, double 0x3FA55555555554F9, double 0x3FA55555555554F9, double 0x3FA55555555554F9, double 0x3FA55555555554F9, double 0x3FA55555555554F9, double 0x3FA55555555554F9>, <8 x double> <double 0x3FC555555555555E, double 0x3FC555555555555E, double 0x3FC555555555555E, double 0x3FC555555555555E, double 0x3FC555555555555E, double 0x3FC555555555555E, double 0x3FC555555555555E, double 0x3FC555555555555E>) #13
  %20 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %11, <8 x double> %18, <8 x double> %19) #13
  %21 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %12, <8 x double> %17, <8 x double> %20) #13
  %22 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %13, <8 x double> %14, <8 x double> %21) #13
  %23 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %22, <8 x double> %10, <8 x double> <double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01, double 5.000000e-01>) #13
  %24 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %23, <8 x double> %10, <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #13
  %25 = tail call <8 x double> @llvm.fma.v8f64(<8 x double> %24, <8 x double> %10, <8 x double> <double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00, double 1.000000e+00>) #13
  %26 = ashr <8 x i32> %8, <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %27 = add nsw <8 x i32> %26, <i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023>
  %28 = bitcast <8 x i32> %27 to <4 x i64>
  %29 = shufflevector <4 x i64> %28, <4 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef>
  %30 = bitcast <8 x i64> %29 to <16 x i32>
  %31 = shufflevector <16 x i32> %30, <16 x i32> undef, <16 x i32> <i32 undef, i32 0, i32 undef, i32 1, i32 undef, i32 2, i32 undef, i32 3, i32 undef, i32 4, i32 undef, i32 5, i32 undef, i32 6, i32 undef, i32 7>
  %32 = shufflevector <16 x i32> <i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef>, <16 x i32> %31, <16 x i32> <i32 0, i32 17, i32 2, i32 19, i32 4, i32 21, i32 6, i32 23, i32 8, i32 25, i32 10, i32 27, i32 12, i32 29, i32 14, i32 31>
  %33 = shl <16 x i32> %32, <i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20>
  %34 = bitcast <16 x i32> %33 to <8 x double>
  %35 = fmul <8 x double> %25, %34
  %36 = add <8 x i32> %8, <i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023, i32 1023>
  %37 = sub <8 x i32> %36, %26
  %38 = bitcast <8 x i32> %37 to <4 x i64>
  %39 = shufflevector <4 x i64> %38, <4 x i64> undef, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 undef, i32 undef, i32 undef, i32 undef>
  %40 = bitcast <8 x i64> %39 to <16 x i32>
  %41 = shufflevector <16 x i32> %40, <16 x i32> undef, <16 x i32> <i32 undef, i32 0, i32 undef, i32 1, i32 undef, i32 2, i32 undef, i32 3, i32 undef, i32 4, i32 undef, i32 5, i32 undef, i32 6, i32 undef, i32 7>
  %42 = shufflevector <16 x i32> <i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef, i32 0, i32 undef>, <16 x i32> %41, <16 x i32> <i32 0, i32 17, i32 2, i32 19, i32 4, i32 21, i32 6, i32 23, i32 8, i32 25, i32 10, i32 27, i32 12, i32 29, i32 14, i32 31>
  %43 = shl <16 x i32> %42, <i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20, i32 20>
  %44 = bitcast <16 x i32> %43 to <8 x double>
  %45 = fmul <8 x double> %35, %44
  %46 = fcmp ogt <8 x double> %0, <double 0x40862E42FE102C83, double 0x40862E42FE102C83, double 0x40862E42FE102C83, double 0x40862E42FE102C83, double 0x40862E42FE102C83, double 0x40862E42FE102C83, double 0x40862E42FE102C83, double 0x40862E42FE102C83>
  %47 = select <8 x i1> %46, <8 x double> <double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000, double 0x7FF0000000000000>, <8 x double> %45
  %48 = fcmp olt <8 x double> %0, <double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03, double -1.000000e+03>
  %49 = select <8 x i1> %48, <8 x double> zeroinitializer, <8 x double> %47
  ret <8 x double> %49
"""), Vec{8,Float64}, Tuple{Vec{8,Float64}}, v)
end


