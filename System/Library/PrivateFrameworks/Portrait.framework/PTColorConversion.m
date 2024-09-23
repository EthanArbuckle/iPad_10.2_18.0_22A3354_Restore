@implementation PTColorConversion

- (PTColorConversion)initWithMetalContext:(id)a3
{
  id v5;
  PTColorConversion *v6;
  id *p_isa;
  void *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  id *v12;
  id *v13;
  id *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  int v24;
  PTColorConversion *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v49;
  objc_super v50;

  v5 = a3;
  v50.receiver = self;
  v50.super_class = (Class)PTColorConversion;
  v6 = -[PTColorConversion init](&v50, sel_init);
  p_isa = (id *)&v6->super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    v8 = (void *)objc_opt_new();
    v9 = objc_msgSend(p_isa[1], "imageblocksSupported");
    v10 = CFSTR("NoImageBlocks");
    if (v9)
      v10 = &stru_1E822B200;
    v11 = v10;
    v12 = p_isa + 2;
    v49 = 0;
    v13 = p_isa + 11;
    v14 = p_isa + 20;
    while (1)
    {
      objc_msgSend(v8, "reset");
      objc_msgSend(v8, "setConstantValue:type:withName:", &v49, 29, CFSTR("kColorTransferFunction"));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("convertRGB%@"), v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "computePipelineStateFor:withConstants:", v15, v8);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = v12[v49];
      v12[v49] = (id)v16;

      if (!v12[v49])
        break;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("convertRGBToYUV%@"), v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "computePipelineStateFor:withConstants:", v18, v8);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v13[v49];
      v13[v49] = (id)v19;

      if (!v13[v49])
      {
        _PTLogSystem();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[PTColorConversion initWithMetalContext:].cold.2(v26, v34, v35, v36, v37, v38, v39, v40);
        goto LABEL_17;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("convertYUVToRGB%@"), v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "computePipelineStateFor:withConstants:", v21, v8);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v14[v49];
      v14[v49] = (id)v22;

      v24 = v49;
      if (!v14[v49])
      {
        _PTLogSystem();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          -[PTColorConversion initWithMetalContext:].cold.3(v26, v41, v42, v43, v44, v45, v46, v47);
        goto LABEL_17;
      }
      ++v49;
      if (v24 > 7)
      {
        v25 = p_isa;
        goto LABEL_18;
      }
    }
    _PTLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[PTColorConversion initWithMetalContext:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
LABEL_17:

    v25 = 0;
LABEL_18:

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

+ (void)getColorMatrix:(unsigned int)a3@<W4> toRGB:(uint64_t)a4@<X5> fullRange:(_QWORD *)a5@<X8> colorYCbCrDepth:
{
  const __CFString *v9;
  __CFString *v10;
  double v11;
  double v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  float v23;
  const float *v24;
  float32x2_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v35;
  double v36;
  unsigned int v37;
  __int128 v38;
  unsigned int v39;
  unint64_t v40;
  double v41;
  __int128 v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  double v46;
  uint64_t v47;
  unsigned int v48;
  double v49;
  unsigned int v50;
  __int128 v51;
  unint64_t v52;
  float v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  float32x4_t v61;
  float32_t v62;
  float32x4_t v63;
  float32_t v64;
  unsigned int v65;
  float32x4_t v66;
  unint64_t v67;
  __int128 v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  int32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x4_t v90;

  v9 = a1;
  v10 = (__CFString *)v9;
  if (!v9)
  {
    _PTLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[PTColorConversion getColorMatrix:toRGB:fullRange:colorYCbCrDepth:].cold.2();

    v11 = 0.2126;
    v12 = 0.7152;
    v13 = 0.0722;
    if (!a4)
      goto LABEL_35;
    goto LABEL_18;
  }
  if (CFStringCompare(v9, (CFStringRef)*MEMORY[0x1E0CA8F00], 0) == kCFCompareEqualTo)
  {
    v11 = 0.2627;
    v12 = 0.678;
    v13 = 0.0593;
    if (a4)
      goto LABEL_18;
    goto LABEL_35;
  }
  v11 = 0.2126;
  v12 = 0.7152;
  v13 = 0.0722;
  if (CFStringCompare(v10, (CFStringRef)*MEMORY[0x1E0CA8F18], 0) == kCFCompareEqualTo)
    goto LABEL_17;
  if (CFStringCompare(v10, (CFStringRef)*MEMORY[0x1E0CA8F10], 0) == kCFCompareEqualTo)
  {
    v11 = 0.299;
    v12 = 0.587;
    v13 = 0.114;
LABEL_17:
    if (a4)
      goto LABEL_18;
    goto LABEL_35;
  }
  if (CFStringCompare(v10, (CFStringRef)*MEMORY[0x1E0CA8F30], 0) == kCFCompareEqualTo)
  {
    v11 = 0.212;
    v12 = 0.701;
    v13 = 0.087;
    if (a4)
      goto LABEL_18;
LABEL_35:
    v25 = 0;
    __asm { FMOV            V1.2S, #1.0 }
    goto LABEL_36;
  }
  _PTLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    +[PTColorConversion getColorMatrix:toRGB:fullRange:colorYCbCrDepth:].cold.3((uint64_t)v10, v14, v15, v16, v17, v18, v19, v20);

  if (!a4)
    goto LABEL_35;
LABEL_18:
  if (a4 == 8)
  {
    _D1 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(a3), 0x1FuLL)), (int8x8_t)vdup_n_s32(0x3F7EFEFFu), (int8x8_t)0x3F60E0E13F5BDBDCLL);
    v23 = 0.0;
    if (!a3)
      v23 = 0.062745;
    v24 = (const float *)&unk_1C93439EC;
    goto LABEL_26;
  }
  if (a4 == 10)
  {
    _D1 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(a3), 0x1FuLL)), (int8x8_t)vdup_n_s32(0x3F7FBFF0u), (int8x8_t)0x3F60380E3F5B36CELL);
    v23 = 0.0;
    if (!a3)
      v23 = 0.062561;
    v24 = (const float *)&unk_1C93439E4;
LABEL_26:
    v25 = vld1_dup_f32(v24);
    v25.f32[0] = v23;
LABEL_36:
    v35 = 0;
    if (a2)
    {
      v36 = v13 * -2.0 + 2.0;
      *(float *)&v37 = -(v36 * v13) / v12;
      *(_QWORD *)&v38 = __PAIR64__(v37, 1.0);
      HIDWORD(v38) = 0;
      *(float *)&v39 = 1.0 / *(float *)_D1.i32;
      LODWORD(v40) = 0;
      *((float *)&v40 + 1) = 1.0 / *(float *)&_D1.i32[1];
      v41 = v11 * -2.0 + 2.0;
      *(_QWORD *)&v42 = 0;
      *((_QWORD *)&v42 + 1) = HIDWORD(v40);
      v43.i64[0] = COERCE_UNSIGNED_INT(1.0);
      v43.i32[2] = 0;
      v45.i64[0] = 0;
      v44.i32[0] = 0;
      v44.i32[1] = 1.0;
      v44.i32[2] = 0;
      v45.i32[2] = 1.0;
      v83 = v39;
      v84 = v40;
      v85 = v42;
      v86 = xmmword_1C9322B60;
      v87 = 0u;
      v88 = 0u;
      v46 = -(v41 * v11);
      v89 = 0u;
      v90 = 0u;
      do
      {
        v43.f32[3] = -v25.f32[0];
        v45.f32[3] = -v25.f32[1];
        v44.f32[3] = -v25.f32[1];
        *(float32x4_t *)((char *)&v87 + v35) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v43, COERCE_FLOAT(*(__int128 *)((char *)&v83 + v35))), v44, *(float32x2_t *)((char *)&v83 + v35), 1), v45, *(float32x4_t *)((char *)&v83 + v35), 2), (float32x4_t)xmmword_1C9322B60, *(float32x4_t *)((char *)&v83 + v35), 3);
        v35 += 16;
      }
      while (v35 != 64);
      v47 = 0;
      *(float *)&v48 = v41;
      v49 = v46 / v12;
      *(float *)&v50 = v36;
      *(_QWORD *)&v51 = COERCE_UNSIGNED_INT(1.0);
      v52 = __PAIR64__(v50, 1.0);
      *((_QWORD *)&v51 + 1) = v48;
      v53 = v49;
      *((float *)&v38 + 2) = v53;
      v54 = (float32x4_t)v87;
      v55 = v88;
      v56 = v89;
      v57 = v90;
      v83 = v51;
      v84 = v38;
      v85 = v52;
      v86 = xmmword_1C9322B60;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v87 + v47) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v54, COERCE_FLOAT(*(__int128 *)((char *)&v83 + v47))), v55, *(float32x2_t *)((char *)&v83 + v47), 1), v56, *(float32x4_t *)((char *)&v83 + v47), 2), v57, *(float32x4_t *)((char *)&v83 + v47), 3);
        v47 += 16;
      }
      while (v47 != 64);
    }
    else
    {
      *(float *)&v58 = v11;
      *(float *)&v59 = v12;
      *(float *)&v60 = v13;
      v61.i64[0] = __PAIR64__(v59, v58);
      v61.i64[1] = v60;
      v63.f32[0] = v11 * -0.5 / (1.0 - v13);
      v62 = v12 * -0.5 / (1.0 - v13);
      v63.f32[1] = v62;
      v66.i32[0] = 0.5;
      v63.i64[1] = COERCE_UNSIGNED_INT(0.5);
      v64 = v12 * -0.5 / (1.0 - v11);
      *(float *)&v65 = v13 * -0.5 / (1.0 - v11);
      v66.f32[1] = v64;
      v66.i64[1] = v65;
      LODWORD(v67) = 0;
      HIDWORD(v67) = _D1.i32[1];
      *(_QWORD *)&v68 = 0;
      *((_QWORD *)&v68 + 1) = _D1.u32[1];
      v83 = _D1.u32[0];
      v84 = v67;
      v85 = v68;
      v86 = xmmword_1C9322B60;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v87 + v35) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v61, COERCE_FLOAT(*(__int128 *)((char *)&v83 + v35))), v63, *(float32x2_t *)((char *)&v83 + v35), 1), v66, *(float32x4_t *)((char *)&v83 + v35), 2), (float32x4_t)xmmword_1C9322B60, *(float32x4_t *)((char *)&v83 + v35), 3);
        v35 += 16;
      }
      while (v35 != 64);
      v69 = 0;
      v70 = xmmword_1C9322B80;
      HIDWORD(v70) = v25.i32[1];
      v71 = xmmword_1C9322B40;
      HIDWORD(v71) = v25.i32[0];
      v72 = xmmword_1C9322B50;
      HIDWORD(v72) = v25.i32[1];
      v73 = (float32x4_t)v87;
      v74 = v88;
      v75 = v89;
      v76 = v90;
      v83 = v71;
      v84 = v70;
      v85 = v72;
      v86 = xmmword_1C9322B60;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v87 + v69) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v73, COERCE_FLOAT(*(__int128 *)((char *)&v83 + v69))), v74, *(float32x2_t *)((char *)&v83 + v69), 1), v75, *(float32x4_t *)((char *)&v83 + v69), 2), v76, *(float32x4_t *)((char *)&v83 + v69), 3);
        v69 += 16;
      }
      while (v69 != 64);
    }
    v77 = 0;
    a5[1] = 0;
    a5[2] = 0;
    *a5 = 0;
    do
    {
      v78 = 0;
      v79 = *((_OWORD *)&v87 + v77);
      do
      {
        v82 = v79;
        _S1 = *(_DWORD *)((unint64_t)&v82 & 0xFFFFFFFFFFFFFFF3 | (4 * (v78 & 3)));
        __asm { FCVT            H1, S1 }
        *((_WORD *)a5 + v78++) = _S1;
      }
      while (v78 != 4);
      ++v77;
      ++a5;
    }
    while (v77 != 3);
    goto LABEL_50;
  }
  _PTLogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    +[PTColorConversion getColorMatrix:toRGB:fullRange:colorYCbCrDepth:].cold.1(a4, v26);

  v27 = 0;
  v87 = vdupq_n_s32(0x7FC00000u);
  v88 = (float32x4_t)v87;
  v89 = (float32x4_t)v87;
  v90 = (float32x4_t)v87;
  a5[1] = 0;
  a5[2] = 0;
  *a5 = 0;
  do
  {
    v28 = 0;
    v29 = *((_OWORD *)&v87 + v27);
    do
    {
      v81 = v29;
      _S1 = *(_DWORD *)((unint64_t)&v81 & 0xFFFFFFFFFFFFFFF3 | (4 * (v28 & 3)));
      __asm { FCVT            H1, S1 }
      *((_WORD *)a5 + v28++) = _S1;
    }
    while (v28 != 4);
    ++v27;
    ++a5;
  }
  while (v27 != 3);
LABEL_50:

}

+ (void)getColorMatrix:(void *)a3 toRGB:(uint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  objc_msgSend(v5, "YCbCrMatrix");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "YCbCrFullRange");
  v7 = objc_msgSend(v5, "YCbCrColorDepth");

  +[PTColorConversion getColorMatrix:toRGB:fullRange:colorYCbCrDepth:](PTColorConversion, "getColorMatrix:toRGB:fullRange:colorYCbCrDepth:", v8, a4, v6, v7);
}

+ (int)getTransferFunction:(id)a3 toLinear:(BOOL)a4
{
  _BOOL4 v4;
  const __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  BOOL v8;
  int v9;
  int v10;

  v4 = a4;
  v5 = (const __CFString *)a3;
  v6 = (__CFString *)v5;
  if (!v5)
  {
    _PTLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[PTColorConversion getTransferFunction:toLinear:].cold.1();
    goto LABEL_11;
  }
  if (CFStringCompare(v5, (CFStringRef)*MEMORY[0x1E0CA8EA8], 0))
  {
    if (CFStringCompare(v6, (CFStringRef)*MEMORY[0x1E0CA8EB0], 0) == kCFCompareEqualTo)
    {
LABEL_12:
      v8 = !v4;
      v9 = 1;
      goto LABEL_17;
    }
    if (CFStringCompare(v6, (CFStringRef)*MEMORY[0x1E0CA8E50], 0))
    {
      if (CFStringCompare(v6, (CFStringRef)*MEMORY[0x1E0CA8EB8], 0) == kCFCompareEqualTo)
      {
        v10 = 0;
        goto LABEL_20;
      }
      if (CFStringCompare(v6, CFSTR("PTImageBufferTransferFunction_Linear_1_6"), 0))
      {
        _PTLogSystem();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          +[PTColorConversion getTransferFunction:toLinear:].cold.2();
LABEL_11:

        goto LABEL_12;
      }
      v8 = !v4;
      v9 = 7;
    }
    else
    {
      v8 = !v4;
      v9 = 5;
    }
  }
  else
  {
    v8 = !v4;
    v9 = 3;
  }
LABEL_17:
  if (v8)
    v10 = v9 + 1;
  else
    v10 = v9;
LABEL_20:

  return v10;
}

+ (BOOL2)getChromaSubsampledFromLuma:(id)a3 texChroma:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  __int16 v8;
  unint64_t v9;
  unint64_t v10;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "width");
  v8 = v7 / objc_msgSend(v5, "width") == 2;
  v9 = objc_msgSend(v6, "height");

  v10 = objc_msgSend(v5, "height");
  return (BOOL2)(v8 | ((v9 / v10 == 2) << 8));
}

+ (float32x2_t)getChromaOffsetFromLuma:(void *)a3 texChroma:(uint64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int32x2_t v8;
  int8x16_t v9;
  float64x2_t v15;

  v5 = a3;
  LODWORD(a4) = +[PTColorConversion getChromaSubsampledFromLuma:texChroma:](PTColorConversion, "getChromaSubsampledFromLuma:texChroma:", v5, a4);
  v6 = objc_msgSend(v5, "width");
  v7 = objc_msgSend(v5, "height");

  v8 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)vdup_n_s32(a4), (int8x8_t)0x10000000001));
  v9.i64[0] = v8.i32[0];
  v9.i64[1] = v8.i32[1];
  __asm { FMOV            V1.2D, #0.5 }
  v15 = (float64x2_t)vbicq_s8(_Q1, v9);
  _Q1.i64[0] = v6;
  _Q1.i64[1] = v7;
  return vcvt_f32_f64(vdivq_f64(v15, vcvtq_f64_u64((uint64x2_t)_Q1)));
}

- (int)convertRGB:(id)a3 inRGBA:(id)a4 outRGBA:(id)a5 toLinear:(BOOL)a6 transferFunction:(id)a7 outRect:
{
  __int128 v7;
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  int v18;
  int v19;
  PTImageblockConfig *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v32;
  double v33;
  _QWORD v34[3];
  _QWORD v35[3];
  uint64_t v36;

  v32 = v7;
  v9 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (-[PTMetalContext imageblocksSupported](self->_metalContext, "imageblocksSupported")
    || !vorr_s8((int8x8_t)vdup_lane_s16(*(int16x4_t *)&v32, 1), *(int8x8_t *)&v32).u16[0])
  {
    v19 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v16, v9, v32);
    v20 = [PTImageblockConfig alloc];
    +[PTTexture createRGBA:](PTTexture, "createRGBA:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PTImageblockConfig initWithPTTexture:outRect:](v20, "initWithPTTexture:outRect:", v21, v33);

    v36 = -[NSObject outOffset](v17, "outOffset");
    objc_msgSend(v13, "computeCommandEncoder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      _PTLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

    }
    objc_msgSend(v22, "setComputePipelineState:", self->_convertRGB[v19]);
    if (-[PTMetalContext imageblocksSupported](self->_metalContext, "imageblocksSupported"))
      objc_msgSend(v22, "setImageblockWidth:height:", -[NSObject imageblockSize](v17, "imageblockSize"), -[NSObject imageblockSize](v17, "imageblockSize"));
    objc_msgSend(v22, "setTexture:atIndex:", v14, 0);
    objc_msgSend(v22, "setTexture:atIndex:", v15, 1);
    objc_msgSend(v22, "setBytes:length:atIndex:", &v36, 8, 0);
    if (v17)
    {
      -[NSObject threads](v17, "threads");
      -[NSObject threadsPerGroup](v17, "threadsPerGroup");
    }
    else
    {
      memset(v35, 0, sizeof(v35));
      memset(v34, 0, sizeof(v34));
    }
    objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v35, v34);
    objc_msgSend(v22, "endEncoding");

    v18 = 0;
  }
  else
  {
    _PTLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[PTColorConversion convertRGB:inRGBA:outRGBA:toLinear:transferFunction:outRect:].cold.2();
    v18 = -1;
  }

  return v18;
}

- (int)convertRGB:(id)a3 inRGBA:(id)a4 outRGBA:(id)a5 toLinear:(BOOL)a6 transferFunction:(id)a7
{
  uint64_t v7;
  id v12;
  id v13;
  id v14;
  id v15;
  __int16 v16;
  __int16 v17;
  double v18;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_msgSend(v13, "width");
  v17 = objc_msgSend(v13, "height");
  LODWORD(v18) = 0;
  WORD2(v18) = v16;
  HIWORD(v18) = v17;
  LODWORD(v7) = -[PTColorConversion convertRGB:inRGBA:outRGBA:toLinear:transferFunction:outRect:](self, "convertRGB:inRGBA:outRGBA:toLinear:transferFunction:outRect:", v15, v14, v13, v7, v12, v18);

  return v7;
}

- (int)convertRGBtoYUV:(id)a3 inRGBA:(id)a4 outLuma:(id)a5 outChroma:(id)a6 toLinear:(BOOL)a7 transferFunction:(id)a8 colorYCbCrMatrix:(id)a9 colorYCbCrFullRange:(BOOL)a10 colorYCbCrDepthOut:(int64_t)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __int16 v23;
  __int16 v24;
  double v25;
  int v26;
  uint64_t v28;
  _BOOL4 v29;

  v29 = a7;
  v17 = a9;
  v18 = a8;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = objc_msgSend(v20, "width");
  v24 = objc_msgSend(v20, "height");
  LODWORD(v25) = 0;
  WORD2(v25) = v23;
  HIWORD(v25) = v24;
  LOBYTE(v28) = a10;
  v26 = -[PTColorConversion convertRGBtoYUV:inRGBA:outLuma:outChroma:toLinear:transferFunction:colorYCbCrMatrix:colorYCbCrFullRange:colorYCbCrDepthOut:outRect:](self, "convertRGBtoYUV:inRGBA:outLuma:outChroma:toLinear:transferFunction:colorYCbCrMatrix:colorYCbCrFullRange:colorYCbCrDepthOut:outRect:", v22, v21, v20, v19, v29, v18, v25, v17, v28, a11);

  return v26;
}

- (int)convertRGBtoYUV:(id)a3 inRGBA:(id)a4 outLuma:(id)a5 outChroma:(id)a6 toLinear:(BOOL)a7 transferFunction:(id)a8 colorYCbCrMatrix:(id)a9 colorYCbCrFullRange:(BOOL)a10 colorYCbCrDepthOut:(int64_t)a11 outRect:
{
  int16x4_t v11;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  unsigned __int16 v24;
  NSObject *v25;
  id v26;
  int v27;
  PTImageblockConfig *v28;
  void *v29;
  PTImageblockConfig *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  id v44;
  id v45;
  id v46;
  int16x4_t v47;
  _QWORD v48[3];
  _QWORD v49[3];
  uint64_t v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v47 = v11;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = a9;
  v23 = -[PTMetalContext imageblocksSupported](self->_metalContext, "imageblocksSupported");
  v24 = vorr_s8((int8x8_t)vdup_lane_s16(v47, 1), (int8x8_t)v47).u16[0];
  if (!v23)
  {
    if (v24)
    {
      _PTLogSystem();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[PTColorConversion convertRGB:inRGBA:outRGBA:toLinear:transferFunction:outRect:].cold.2();
LABEL_19:

      v42 = -1;
      goto LABEL_22;
    }
    LOBYTE(v24) = 0;
  }
  if (v24 & 1 | v47.i8[4] & 1 | v47.i8[6] & 1)
  {
    _PTLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[PTColorConversion convertRGBtoYUV:inRGBA:outLuma:outChroma:toLinear:transferFunction:colorYCbCrMatrix:colorYCbCrFullRange:colorYCbCrDepthOut:outRect:].cold.2();
    goto LABEL_19;
  }
  v44 = v18;
  v26 = v17;
  v46 = v21;
  v27 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:");
  v52 = 0;
  v53 = 0;
  v54 = 0;
  v45 = v22;
  +[PTColorConversion getColorMatrix:toRGB:fullRange:colorYCbCrDepth:](PTColorConversion, "getColorMatrix:toRGB:fullRange:colorYCbCrDepth:", v22, 0, a10, a11);
  v51 = (unsigned __int16)+[PTColorConversion getChromaSubsampledFromLuma:texChroma:](PTColorConversion, "getChromaSubsampledFromLuma:texChroma:", v19, v20);
  v28 = [PTImageblockConfig alloc];
  +[PTTexture createYUV420:chroma:](PTTexture, "createYUV420:chroma:", v19, v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[PTImageblockConfig initWithPTTexture:outRect:](v28, "initWithPTTexture:outRect:", v29, *(double *)&v47);

  v50 = (uint64_t)-[PTImageblockConfig outOffset](v30, "outOffset");
  v31 = v26;
  v32 = v26;
  v18 = v44;
  objc_msgSend(v32, "computeCommandEncoder");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    _PTLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);

  }
  objc_msgSend(v33, "setComputePipelineState:", self->_convertRGBToYUV[v27]);
  if (-[PTMetalContext imageblocksSupported](self->_metalContext, "imageblocksSupported"))
    objc_msgSend(v33, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v30, "imageblockSize"), -[PTImageblockConfig imageblockSize](v30, "imageblockSize"));
  objc_msgSend(v33, "setTexture:atIndex:", v44, 0);
  objc_msgSend(v33, "setTexture:atIndex:", v19, 1);
  objc_msgSend(v33, "setTexture:atIndex:", v20, 2);
  objc_msgSend(v33, "setBytes:length:atIndex:", (char *)&v51 + 2, 24, 0);
  objc_msgSend(v33, "setBytes:length:atIndex:", &v51, 2, 1);
  v21 = v46;
  if (-[PTMetalContext imageblocksSupported](self->_metalContext, "imageblocksSupported"))
    objc_msgSend(v33, "setBytes:length:atIndex:", &v50, 8, 2);
  if (v30)
  {
    -[PTImageblockConfig threads](v30, "threads");
    -[PTImageblockConfig threadsPerGroup](v30, "threadsPerGroup");
  }
  else
  {
    memset(v49, 0, sizeof(v49));
    memset(v48, 0, sizeof(v48));
  }
  objc_msgSend(v33, "dispatchThreads:threadsPerThreadgroup:", v49, v48);
  objc_msgSend(v33, "endEncoding");

  v42 = 0;
  v17 = v31;
  v22 = v45;
LABEL_22:

  return v42;
}

- (int)convertYUVtoRGB:(id)a3 inLuma:(id)a4 inChroma:(id)a5 outRGBA:(id)a6 toLinear:(BOOL)a7 transferFunction:(id)a8 colorYCbCrMatrix:(id)a9 colorYCbCrFullRange:(BOOL)a10 colorYCbCrDepthIn:(int64_t)a11
{
  _BOOL8 v12;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  void *v22;
  PTImageblockConfig *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v34;
  _QWORD v35[3];
  _QWORD v36[3];
  uint64_t v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v12 = a7;
  v34 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  v20 = a3;
  v21 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", a8, v12);
  v39 = 0;
  v40 = 0;
  v41 = 0;
  +[PTColorConversion getColorMatrix:toRGB:fullRange:colorYCbCrDepth:](PTColorConversion, "getColorMatrix:toRGB:fullRange:colorYCbCrDepth:", v19, 1, a10, a11);

  v22 = v34;
  v38 = (unsigned __int16)+[PTColorConversion getChromaSubsampledFromLuma:texChroma:](PTColorConversion, "getChromaSubsampledFromLuma:texChroma:", v34, v17);
  v23 = -[PTImageblockConfig initWithTexture:]([PTImageblockConfig alloc], "initWithTexture:", v18);
  v37 = (uint64_t)-[PTImageblockConfig outOffset](v23, "outOffset");
  objc_msgSend(v20, "computeCommandEncoder");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    _PTLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

  }
  objc_msgSend(v24, "setComputePipelineState:", self->_convertYUVToRGB[v21], v34);
  if (-[PTMetalContext imageblocksSupported](self->_metalContext, "imageblocksSupported"))
    objc_msgSend(v24, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v23, "imageblockSize"), -[PTImageblockConfig imageblockSize](v23, "imageblockSize"));
  objc_msgSend(v24, "setTexture:atIndex:", v22, 0);
  objc_msgSend(v24, "setTexture:atIndex:", v17, 1);
  objc_msgSend(v24, "setTexture:atIndex:", v18, 2);
  objc_msgSend(v24, "setBytes:length:atIndex:", (char *)&v38 + 2, 24, 0);
  objc_msgSend(v24, "setBytes:length:atIndex:", &v38, 2, 1);
  if (-[PTMetalContext imageblocksSupported](self->_metalContext, "imageblocksSupported"))
    objc_msgSend(v24, "setBytes:length:atIndex:", &v37, 8, 2);
  if (v23)
  {
    -[PTImageblockConfig threads](v23, "threads");
    -[PTImageblockConfig threadsPerGroup](v23, "threadsPerGroup");
  }
  else
  {
    memset(v36, 0, sizeof(v36));
    memset(v35, 0, sizeof(v35));
  }
  objc_msgSend(v24, "dispatchThreads:threadsPerThreadgroup:", v36, v35);
  objc_msgSend(v24, "endEncoding");

  return 0;
}

- (int)convertRGBLinearFromPTTexture:(id)a3 inPTTexture:(id)a4 outRGBA:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v19;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (objc_msgSend(v9, "isRGB"))
  {
    objc_msgSend(v9, "texRGBA");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transferFunction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = -[PTColorConversion convertRGB:inRGBA:outRGBA:toLinear:transferFunction:](self, "convertRGB:inRGBA:outRGBA:toLinear:transferFunction:", v10, v11, v8, 1, v12);
  }
  else
  {
    objc_msgSend(v9, "texLuma");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "texChroma");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transferFunction");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "YCbCrMatrix");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v9, "YCbCrFullRange");
    v17 = objc_msgSend(v9, "YCbCrColorDepth");

    LOBYTE(v19) = v16;
    v13 = -[PTColorConversion convertYUVtoRGB:inLuma:inChroma:outRGBA:toLinear:transferFunction:colorYCbCrMatrix:colorYCbCrFullRange:colorYCbCrDepthIn:](self, "convertYUVtoRGB:inLuma:inChroma:outRGBA:toLinear:transferFunction:colorYCbCrMatrix:colorYCbCrFullRange:colorYCbCrDepthIn:", v10, v11, v12, v8, 1, v14, v15, v19, v17);

    v8 = (id)v15;
    v10 = (id)v14;
  }

  return v13;
}

- (int)convertRGBLinearToPTTexture:(id)a3 inRGBA:(id)a4 outPTTexture:(id)a5
{
  id v8;
  id v9;
  id v10;
  __int16 v11;
  __int16 v12;
  double v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v8, "width");
  v12 = objc_msgSend(v8, "height");
  LODWORD(v13) = 0;
  WORD2(v13) = v11;
  HIWORD(v13) = v12;
  LODWORD(self) = -[PTColorConversion convertRGBLinearToPTTexture:inRGBA:outPTTexture:outRect:](self, "convertRGBLinearToPTTexture:inRGBA:outPTTexture:outRect:", v10, v9, v8, v13);

  return (int)self;
}

- (int)convertRGBLinearToPTTexture:(id)a3 inRGBA:(id)a4 outPTTexture:(id)a5 outRect:
{
  double v5;
  double v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v21;

  v6 = v5;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  if (objc_msgSend(v10, "isRGB"))
  {
    objc_msgSend(v10, "texRGBA");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transferFunction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[PTColorConversion convertRGB:inRGBA:outRGBA:toLinear:transferFunction:outRect:](self, "convertRGB:inRGBA:outRGBA:toLinear:transferFunction:outRect:", v12, v11, v13, 0, v14, v6);
  }
  else
  {
    objc_msgSend(v10, "texLuma");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "texChroma");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transferFunction");
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "YCbCrMatrix");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v10, "YCbCrFullRange");
    v19 = objc_msgSend(v10, "YCbCrColorDepth");

    LOBYTE(v21) = v18;
    v15 = -[PTColorConversion convertRGBtoYUV:inRGBA:outLuma:outChroma:toLinear:transferFunction:colorYCbCrMatrix:colorYCbCrFullRange:colorYCbCrDepthOut:outRect:](self, "convertRGBtoYUV:inRGBA:outLuma:outChroma:toLinear:transferFunction:colorYCbCrMatrix:colorYCbCrFullRange:colorYCbCrDepthOut:outRect:", v12, v11, v13, v14, 0, v16, v6, v17, v21, v19);

    v11 = (id)v17;
    v12 = (id)v16;
  }

  return v15;
}

- (void).cxx_destruct
{
  uint64_t v3;
  MTLComputePipelineState **v4;
  uint64_t i;

  v3 = 0;
  v4 = &self->_convertYUVToRGB[8];
  do
    objc_storeStrong((id *)&v4[v3--], 0);
  while (v3 != -9);
  for (i = 152; i != 80; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i != 8);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getColorMatrix:(int)a1 toRGB:(NSObject *)a2 fullRange:colorYCbCrDepth:.cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "Unsupported bit depth: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_12();
}

+ (void)getColorMatrix:toRGB:fullRange:colorYCbCrDepth:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "YCbCrMatrix is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

+ (void)getColorMatrix:(uint64_t)a3 toRGB:(uint64_t)a4 fullRange:(uint64_t)a5 colorYCbCrDepth:(uint64_t)a6 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a2, a3, "colorMatrixAndBiasFor: only support for ITU_R_2020, ITU_R_709_2, ITU_R_601_4, SMPTE_240M_1995, but got %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)getTransferFunction:toLinear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "TransferFunction is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

+ (void)getTransferFunction:toLinear:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "PTRenderPipeline only supports transferFunctions: kCVImageBufferTransferFunction_ITU_R_709_2, kCVImageBufferTransferFunction_ITU_R_2100_HLG, kCVImageBufferTransferFunction_Linear", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)convertRGB:inRGBA:outRGBA:toLinear:transferFunction:outRect:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "outRect.origin requires imageblock support", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)convertRGBtoYUV:inRGBA:outLuma:outChroma:toLinear:transferFunction:colorYCbCrMatrix:colorYCbCrFullRange:colorYCbCrDepthOut:outRect:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "outRect does not align with 420", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end
