@implementation PTEffectTemporalFilter

- (id)normalFiltered
{
  return self->_temporalNormal[self->_indexOut];
}

- (id)displacementFWD
{
  return -[PTOpticalFlow displacementFWD](self->_opticalFlow, "displacementFWD");
}

- (id)disparityFiltered
{
  return self->_temporalDisparity[self->_indexOut];
}

- (PTEffectTemporalFilter)initWithMetalContext:(id)a3 disparitySize:(id *)a4
{
  id v7;
  char *v8;
  _QWORD *v9;
  __int128 v10;
  PTOpticalFlow *v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  char v17;
  char v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  PTFilterEMA_LKT *v28;
  void *v29;
  PTEffectTemporalFilter *v30;
  NSObject *v31;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64x2_t v75;
  uint64x2_t v76;
  uint64_t v77;
  objc_super v78;

  v7 = a3;
  v78.receiver = self;
  v78.super_class = (Class)PTEffectTemporalFilter;
  v8 = -[PTEffectTemporalFilter init](&v78, sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = *(_OWORD *)&a4->var0;
    *((_QWORD *)v8 + 13) = a4->var2;
    *(_OWORD *)(v8 + 88) = v10;
    objc_storeStrong((id *)v8 + 1, a3);
    if (v9[1])
    {
      v75 = vcvtq_u64_f64(vcvtq_f64_f32(vmul_f32(vcvt_f32_f64(vcvtq_f64_u64(*(uint64x2_t *)&a4->var0)), (float32x2_t)0x3F0000003F000000)));
      v76 = v75;
      v77 = 1;
      v11 = -[PTOpticalFlow initWithMetalContext:colorSize:lktPreset:allocateDisplacementFWD:needConversionBGRA2YUVA:inverseFlow:]([PTOpticalFlow alloc], "initWithMetalContext:colorSize:lktPreset:allocateDisplacementFWD:needConversionBGRA2YUVA:inverseFlow:", v7, &v76, 4, 1, 0, 1);
      v12 = (void *)v9[2];
      v9[2] = v11;

      if (v9[2])
      {
        v13 = 0;
        v14 = v9 + 4;
        v15 = v9 + 6;
        v16 = v9 + 8;
        v17 = 1;
        do
        {
          v18 = v17;
          objc_msgSend(v7, "textureUtil", *(_OWORD *)&v75);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "createWithWidth:height:pixelFormat:", a4->var0, a4->var1, 25);
          v20 = objc_claimAutoreleasedReturnValue();
          v21 = (void *)v14[v13];
          v14[v13] = v20;

          if (!v14[v13])
          {
            _PTLogSystem();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              -[PTEffectTemporalFilter initWithMetalContext:disparitySize:].cold.3(v31, v46, v47, v48, v49, v50, v51, v52);
            goto LABEL_23;
          }
          objc_msgSend(v7, "textureUtil");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "createWithWidth:height:pixelFormat:", a4->var0, a4->var1, 115);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v15[v13];
          v15[v13] = v23;

          if (!v15[v13])
          {
            _PTLogSystem();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              -[PTEffectTemporalFilter initWithMetalContext:disparitySize:].cold.4(v31, v53, v54, v55, v56, v57, v58, v59);
            goto LABEL_23;
          }
          objc_msgSend(v7, "textureUtil");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "createWithWidth:height:pixelFormat:", a4->var0, a4->var1, 10);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v16[v13];
          v16[v13] = v26;

          if (!v16[v13])
          {
            _PTLogSystem();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              -[PTEffectTemporalFilter initWithMetalContext:disparitySize:].cold.5(v31, v60, v61, v62, v63, v64, v65, v66);
            goto LABEL_23;
          }
          v17 = 0;
          v13 = 1;
        }
        while ((v18 & 1) != 0);
        v28 = -[PTFilterEMA_LKT initWithMetalContext:]([PTFilterEMA_LKT alloc], "initWithMetalContext:", v7);
        v29 = (void *)v9[10];
        v9[10] = v28;

        if (v9[10])
        {
          v30 = v9;
          goto LABEL_25;
        }
        _PTLogSystem();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[PTEffectTemporalFilter initWithMetalContext:disparitySize:].cold.6(v31, v67, v68, v69, v70, v71, v72, v73);
      }
      else
      {
        _PTLogSystem();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[PTEffectTemporalFilter initWithMetalContext:disparitySize:].cold.2(v31, v39, v40, v41, v42, v43, v44, v45);
      }
    }
    else
    {
      _PTLogSystem();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[PTEffectTemporalFilter initWithMetalContext:disparitySize:].cold.1(v31, v32, v33, v34, v35, v36, v37, v38);
    }
LABEL_23:

  }
  v30 = 0;
LABEL_25:

  return v30;
}

- (unsigned)prepareFilter:(id)a3 opticalFlowRGB:(id)a4 frameIndex:(int)a5
{
  PTOpticalFlow *opticalFlow;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  NSObject *v10;

  opticalFlow = self->_opticalFlow;
  v7 = (a5 + 1) & 1;
  if (a5 >= -1)
    v8 = v7;
  else
    v8 = -v7;
  v9 = -[PTOpticalFlow estimateDisplacementStream:index:doOpticalFlow:destRGBA:](opticalFlow, "estimateDisplacementStream:index:doOpticalFlow:destRGBA:", a3, v8, a5 > 0, a4);
  if (v9)
  {
    _PTLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PTCVMNetwork executeNetwork:].cold.2(v9, v10);

  }
  return v9;
}

- (unsigned)filter:(id)a3 inDisparity:(id)a4 inNormal:(id)a5 filterNormalSpatial:(BOOL)a6 frameIndex:(int)a7 disparityScale:(float)a8
{
  uint64_t v9;

  LODWORD(v9) = a7;
  return -[PTEffectTemporalFilter filter:inDisparity:inNormal:inDiffuse:filterNormalSpatial:filterDiffuseSpatial:frameIndex:disparityScale:](self, "filter:inDisparity:inNormal:inDiffuse:filterNormalSpatial:filterDiffuseSpatial:frameIndex:disparityScale:", a3, a4, a5, 0, a6, 0, v9);
}

- (unsigned)filter:(id)a3 inDisparity:(id)a4 inNormal:(id)a5 inDiffuse:(id)a6 filterNormalSpatial:(BOOL)a7 filterDiffuseSpatial:(BOOL)a8 frameIndex:(int)a9 disparityScale:(float)a10
{
  unsigned int v11;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  int v22;
  PTFilterEMA_LKT *disparityFilter;
  void *v24;
  double v25;
  uint64_t indexIn;
  uint64_t indexOut;
  MTLTexture *v28;
  MTLTexture *v29;
  PTFilterEMA_LKT *v30;
  NSObject *v31;
  PTFilterEMA_LKT *v33;
  void *v34;
  double v35;
  MTLTexture *v36;
  MTLTexture *v37;
  uint64_t v38;

  v11 = a8;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  if (__PAIR128__(objc_msgSend(v18, "height"), objc_msgSend(v18, "width")) != *(_OWORD *)&self->_disparitySize.width)
  {
    _PTLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[PTEffectTemporalFilter filter:inDisparity:inNormal:inDiffuse:filterNormalSpatial:filterDiffuseSpatial:frameIndex:disparityScale:].cold.1(v31);

    v11 = -10;
    goto LABEL_12;
  }
  v21 = (a9 + 1) & 1;
  if (a9 < -1)
    v21 = -v21;
  v22 = a9 & 1;
  if (a9 < 0)
    v22 = -v22;
  self->_indexIn = v21;
  self->_indexOut = v22;
  disparityFilter = self->_disparityFilter;
  -[PTOpticalFlow displacementFWD](self->_opticalFlow, "displacementFWD");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  indexIn = self->_indexIn;
  indexOut = self->_indexOut;
  v28 = self->_temporalDisparity[indexIn];
  v29 = self->_temporalDisparity[indexOut];
  if (!a7)
  {
    LODWORD(v38) = a9;
    -[PTFilterEMA_LKT emaFilterDisparityNormal:inDisplacement:inDisparityPrev:inDisparity:outDisparity:inNormalPrev:inNormal:outNormal:frameIndex:](disparityFilter, "emaFilterDisparityNormal:inDisplacement:inDisparityPrev:inDisparity:outDisparity:inNormalPrev:inNormal:outNormal:frameIndex:", v17, v24, v28, v18, v29, self->_temporalNormal[indexIn], v19, self->_temporalNormal[indexOut], v38);
    goto LABEL_14;
  }
  *(float *)&v25 = a10;
  -[PTFilterEMA_LKT emaFilter:inDisplacement:inTexPrev:inTex:outTex:frameIndex:scale:](disparityFilter, "emaFilter:inDisplacement:inTexPrev:inTex:outTex:frameIndex:scale:", v17, v24, v28, v18, v29, a9, v25);

  if (v19)
  {
    v30 = self->_disparityFilter;
    -[PTOpticalFlow displacementFWD](self->_opticalFlow, "displacementFWD");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTFilterEMA_LKT gaussEMAFilterNormal:inDisplacement:inNormalPrev:inNormal:outNormal:frameIndex:](v30, "gaussEMAFilterNormal:inDisplacement:inNormalPrev:inNormal:outNormal:frameIndex:", v17, v24, self->_temporalNormal[self->_indexIn], v19, self->_temporalNormal[self->_indexOut], a9);
LABEL_14:

  }
  if (v20)
  {
    v33 = self->_disparityFilter;
    -[PTOpticalFlow displacementFWD](self->_opticalFlow, "displacementFWD");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = self->_temporalDiffuse[self->_indexIn];
    v37 = self->_temporalDiffuse[self->_indexOut];
    if (!v11)
    {
      LODWORD(v35) = 1.0;
      -[PTFilterEMA_LKT emaFilter:inDisplacement:inTexPrev:inTex:outTex:frameIndex:scale:](v33, "emaFilter:inDisplacement:inTexPrev:inTex:outTex:frameIndex:scale:", v17, v34, v36, v20, v37, a9, v35);

      goto LABEL_12;
    }
    -[PTFilterEMA_LKT gaussEMAFilter:inDisplacement:inTexPrev:inTex:outTex:frameIndex:](v33, "gaussEMAFilter:inDisplacement:inTexPrev:inTex:outTex:frameIndex:", v17, v34, v36, v20, v37, a9);

  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (unsigned)reset
{
  kdebug_trace();
  -[PTOpticalFlow reset](self->_opticalFlow, "reset");
  kdebug_trace();
  return 0;
}

- (id)diffuseFiltered
{
  return self->_temporalDiffuse[self->_indexOut];
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;

  objc_storeStrong((id *)&self->_disparityFilter, 0);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_temporalDiffuse[i + 1], 0);
  for (j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_temporalNormal[j + 1], 0);
  for (k = 40; k != 24; k -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + k), 0);
  objc_storeStrong((id *)&self->_opticalFlow, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 disparitySize:(uint64_t)a4 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)filter:(os_log_t)log inDisparity:inNormal:inDiffuse:filterNormalSpatial:filterDiffuseSpatial:frameIndex:disparityScale:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Disparity filtering failed. Size of inDisparity does not match filter size.", v1, 2u);
}

@end
