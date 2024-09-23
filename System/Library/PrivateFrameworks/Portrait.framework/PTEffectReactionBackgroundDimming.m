@implementation PTEffectReactionBackgroundDimming

- (PTEffectReactionBackgroundDimming)initWithMetalContext:(id)a3
{
  id v5;
  PTEffectReactionBackgroundDimming *v6;
  PTEffectReactionBackgroundDimming *v7;
  void *v8;
  MTLComputePipelineState **backgroundDimAndConvertYUVtoRGB;
  uint64_t v10;
  MTLComputePipelineState *v11;
  int v12;
  PTEffectReactionBackgroundDimming *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v23;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PTEffectReactionBackgroundDimming;
  v6 = -[PTEffectReactionBackgroundDimming init](&v24, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metalContext, a3);
    v8 = (void *)objc_opt_new();
    v23 = 0;
    backgroundDimAndConvertYUVtoRGB = v7->_backgroundDimAndConvertYUVtoRGB;
    while (1)
    {
      objc_msgSend(v8, "reset");
      objc_msgSend(v8, "setConstantValue:type:withName:", &v23, 29, CFSTR("kColorTransferFunction"));
      objc_msgSend(v5, "computePipelineStateFor:withConstants:", CFSTR("backgroundDimAndConvertYUVToRGB"), v8);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = backgroundDimAndConvertYUVtoRGB[v23];
      backgroundDimAndConvertYUVtoRGB[v23] = (MTLComputePipelineState *)v10;

      v12 = v23;
      if (!backgroundDimAndConvertYUVtoRGB[v23])
        break;
      ++v23;
      if (v12 > 7)
      {
        v13 = v7;
        goto LABEL_10;
      }
    }
    _PTLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PTEffectReactionBackgroundDimming initWithMetalContext:].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    v13 = 0;
LABEL_10:

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (int)backgroundDimAndConvertRGBLinearFromPTTexture:(id)a3 inPTTexture:(id)a4 inCenteredDisparity:(id)a5 inSegmentation:(id)a6 outRGBA:(id)a7 dimmingFactor:(float)a8 disparityRemapping:(CGRect)a9 outColorROI:(CGRect)a10
{
  id v16;
  id v17;
  id v18;
  void *v19;
  id v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  float64x2_t v46;
  float64x2_t v47;
  float64x2_t v48;
  uint64_t v49;
  uint64_t v50;
  float64_t v52;
  CGFloat height;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  __int128 v57;
  uint64_t v58;
  _QWORD v59[3];
  float32x4_t v60;
  float32x4_t v61;
  _QWORD v62[3];
  _WORD v63[3];
  int v64;

  height = a9.size.height;
  x = a9.origin.x;
  y = a9.origin.y;
  width = a9.size.width;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = v18;
  _D1 = a8 * 0.6;
  __asm { FCVT            H1, D1 }
  v63[0] = LOWORD(_D1);
  _D1 = a8 * 0.85;
  __asm { FCVT            H1, D1 }
  v63[1] = LOWORD(_D1);
  _D0 = a8 * 0.95;
  __asm { FCVT            H0, D0 }
  v63[2] = LOWORD(_D0);
  v64 = -1207911424;
  if (v18)
  {
    v27 = v18;
    v64 = 1006632960;
  }
  else
  {
    v27 = v17;
  }
  memset(v62, 0, sizeof(v62));
  v28 = a7;
  v29 = a3;
  objc_msgSend(v16, "transferFunction");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v30, 1);

  objc_msgSend(v29, "computeCommandEncoder");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    _PTLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[PTEffectReactionBackgroundDimming backgroundDimAndConvertRGBLinearFromPTTexture:inPTTexture:inCenteredDisparity:inSegmentation:outRGBA:dimmingFactor:disparityRemapping:outColorROI:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);

  }
  objc_msgSend(v32, "setComputePipelineState:", self->_backgroundDimAndConvertYUVtoRGB[v31], *(_QWORD *)&a10.size.height, v33);
  if (objc_msgSend(v16, "isRGB"))
  {
    objc_msgSend(v16, "texRGBA");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTexture:atIndex:", v42, 0);

    objc_msgSend(v32, "setTexture:atIndex:", 0, 1);
  }
  else
  {
    +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v16, 1);
    v43 = v16;
    objc_msgSend(v43, "texLuma");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTexture:atIndex:", v44, 0);

    objc_msgSend(v43, "texChroma");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "setTexture:atIndex:", v45, 1);
  }
  objc_msgSend(v32, "setTexture:atIndex:", v27, 2);
  objc_msgSend(v32, "setTexture:atIndex:", v28, 3);
  objc_msgSend(v32, "setBytes:length:atIndex:", v62, 24, 0);
  objc_msgSend(v32, "setBytes:length:atIndex:", v63, 10, 1);
  v46.f64[0] = width;
  v47.f64[0] = x;
  v46.f64[1] = height;
  v47.f64[1] = y;
  v61 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v47), v46);
  objc_msgSend(v32, "setBytes:length:atIndex:", &v61, 16, 2);
  v48.f64[0] = a10.size.width;
  v48.f64[1] = v52;
  v60 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)a10.origin), v48);
  objc_msgSend(v32, "setBytes:length:atIndex:", &v60, 16, 3);
  v49 = objc_msgSend(v28, "width");
  v50 = objc_msgSend(v28, "height");

  v59[0] = v49;
  v59[1] = v50;
  v59[2] = 1;
  v57 = xmmword_1C9322A40;
  v58 = 1;
  objc_msgSend(v32, "dispatchThreads:threadsPerThreadgroup:", v59, &v57);
  objc_msgSend(v32, "endEncoding");

  return 0;
}

- (void).cxx_destruct
{
  uint64_t i;

  for (i = 80; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
}

- (void)backgroundDimAndConvertRGBLinearFromPTTexture:(NSObject *)a1 inPTTexture:(uint64_t)a2 inCenteredDisparity:(uint64_t)a3 inSegmentation:(uint64_t)a4 outRGBA:(uint64_t)a5 dimmingFactor:(uint64_t)a6 disparityRemapping:(uint64_t)a7 outColorROI:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
}

@end
