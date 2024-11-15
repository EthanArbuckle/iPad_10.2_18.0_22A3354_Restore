@implementation SDOFMetadata

+ (int)getUnifiedRenderingMaxVersionSupported
{
  return 7;
}

+ (BOOL)getUnifiedRenderingForegroundBlurEnabled:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  int hasValidHeader;
  int v11;

  v3 = objc_retainAutorelease(a3);
  v6 = objc_msgSend_bytes(v3, v4, v5);
  v7 = (void *)objc_opt_class();
  hasValidHeader = objc_msgSend_hasValidHeader_(v7, v8, v6);
  if (hasValidHeader)
  {
    if (*(int *)(v6 + 4) >= 6)
    {
      v11 = 0;
      sub_24B6D2098(v6, 0x4B0u, 2u, &v11);
      LOBYTE(hasValidHeader) = v11 > 0;
    }
    else
    {
      LOBYTE(hasValidHeader) = 0;
    }
  }
  return hasValidHeader;
}

+ (int)getEffectiveVersion:(FigDepthBlurEffectRenderingParametersHeader *)a3
{
  int var1;
  int v4;

  if (!a3)
    return 0;
  var1 = a3->var1;
  if (var1 >= 4)
    v4 = 4;
  else
    v4 = a3->var1;
  if (var1 >= 0x10000)
    return 0;
  else
    return v4;
}

+ (BOOL)hasValidHeader:(void *)a3
{
  int EffectiveVersion;
  BOOL result;
  unsigned int v6;

  if (!a3)
    return 0;
  if (*(_DWORD *)a3 != 1145980242 || *((int *)a3 + 1) > 7)
    return 0;
  EffectiveVersion = objc_msgSend_getEffectiveVersion_(SDOFMetadata, a2, (uint64_t)a3);
  if (EffectiveVersion != 4)
    return EffectiveVersion == 3 && *((_DWORD *)a3 + 2) == 472;
  result = 0;
  v6 = *((_DWORD *)a3 + 2);
  if (v6 >= 0x10 && (v6 & 7) == 0)
    return 1;
  return result;
}

+ (int)getRenderingVersion:(void *)a3
{
  void *v4;
  const char *v5;

  v4 = (void *)objc_opt_class();
  if (objc_msgSend_hasValidHeader_(v4, v5, (uint64_t)a3))
    return *((_DWORD *)a3 + 1);
  else
    return -1;
}

+ (float)minSimulatedAperture:(void *)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  float v7;
  int EffectiveVersion;
  float v10;

  v4 = (void *)objc_opt_class();
  v7 = 0.0;
  if (objc_msgSend_hasValidHeader_(v4, v5, (uint64_t)a3))
  {
    EffectiveVersion = objc_msgSend_getEffectiveVersion_(SDOFMetadata, v6, (uint64_t)a3);
    if (EffectiveVersion == 4)
    {
      v10 = 0.0;
      sub_24B6D2098((uint64_t)a3, 0x259u, 1u, &v10);
      return v10;
    }
    else if (EffectiveVersion == 3)
    {
      return *((float *)a3 + 25);
    }
  }
  return v7;
}

+ (float)maxSimulatedAperture:(void *)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  float v7;
  int EffectiveVersion;
  float v10;

  v4 = (void *)objc_opt_class();
  v7 = 0.0;
  if (objc_msgSend_hasValidHeader_(v4, v5, (uint64_t)a3))
  {
    EffectiveVersion = objc_msgSend_getEffectiveVersion_(SDOFMetadata, v6, (uint64_t)a3);
    if (EffectiveVersion == 4)
    {
      v10 = 0.0;
      sub_24B6D2098((uint64_t)a3, 0x25Au, 1u, &v10);
      return v10;
    }
    else if (EffectiveVersion == 3)
    {
      return *((float *)a3 + 67);
    }
  }
  return v7;
}

+ (void)getRenderingParametersFromMetaData:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  int EffectiveVersion;
  __int16 *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  size_t v22;
  __int16 *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  __int16 *v34;
  uint64_t v35;
  unint64_t v36;
  int v37;
  _OWORD v39[30];

  v3 = objc_retainAutorelease(a3);
  v6 = objc_msgSend_bytes(v3, v4, v5);
  if (*(int *)(v6 + 4) > 7)
    goto LABEL_30;
  EffectiveVersion = objc_msgSend_getEffectiveVersion_(SDOFMetadata, v7, v6);
  if (EffectiveVersion == 4)
  {
    v15 = v3;
    v13 = v15;
    if (v15)
    {
      if ((unint64_t)objc_msgSend_length(v15, v16, v17) >= 0x10 && (objc_msgSend_length(v13, v18, v19) & 7) == 0)
      {
        v22 = objc_msgSend_length(v13, v20, v21);
        v23 = (__int16 *)malloc_type_malloc(v22, 0x9CB72595uLL);
        if (v23)
        {
          v9 = v23;
          v26 = objc_msgSend_length(v13, v24, v25);
          objc_msgSend_getBytes_length_(v13, v27, (uint64_t)v9, v26);
          if (*(_DWORD *)v9 == 1145980242 && (*((_DWORD *)v9 + 1) - 8) >= 0xFFFFFFFC)
          {
            v30 = *((unsigned int *)v9 + 2);
            if (objc_msgSend_length(v13, v28, v29) == v30)
            {
              v31 = *((unsigned int *)v9 + 2) - 16;
              if (v31 < 8)
                goto LABEL_10;
              v32 = v31 >> 3;
              v33 = v32 <= 1 ? 1 : v32;
              if (v9[8] >= 1)
              {
                v34 = v9 + 12;
                v35 = 1;
                do
                {
                  v36 = v35;
                  if (v33 == v35)
                    break;
                  v37 = *v34;
                  v34 += 4;
                  ++v35;
                }
                while (v37 > 0);
                if (v36 >= v32)
                  goto LABEL_10;
              }
            }
          }
          free(v9);
        }
      }
    }

LABEL_30:
    v9 = 0;
    goto LABEL_31;
  }
  if (EffectiveVersion != 3)
    goto LABEL_30;
  v9 = (__int16 *)malloc_type_malloc(0x1D8uLL, 0x1000040156972F5uLL);
  v10 = v3;
  v13 = v10;
  memset(v39, 0, 472);
  if (!v10
    || !v9
    || (unint64_t)objc_msgSend_length(v10, v11, v12) < 0x1D8
    || (objc_msgSend_getBytes_length_(v13, v14, (uint64_t)v39, 472), LODWORD(v39[0]) != 1145980242)
    || *(_QWORD *)((char *)v39 + 4) != 0x1D800000003)
  {

    free(v9);
    goto LABEL_30;
  }
  memcpy(v9, v39, 0x1D8uLL);

LABEL_10:
LABEL_31:

  return v9;
}

+ (int)disparityRefinementVersion:(void *)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  int EffectiveVersion;
  int result;
  int v9;

  v4 = (void *)objc_opt_class();
  if (!objc_msgSend_hasValidHeader_(v4, v5, (uint64_t)a3))
    return -1;
  EffectiveVersion = objc_msgSend_getEffectiveVersion_(SDOFMetadata, v6, (uint64_t)a3);
  result = -1;
  if (EffectiveVersion == 4)
  {
    v9 = -1;
    sub_24B6D2098((uint64_t)a3, 0x64u, 2u, &v9);
    return v9;
  }
  else if (EffectiveVersion == 3)
  {
    return *((_DWORD *)a3 + 70);
  }
  return result;
}

+ (float)defaultSimulatedAperture:(void *)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  float v7;
  int EffectiveVersion;
  float v10;

  v4 = (void *)objc_opt_class();
  v7 = 0.0;
  if (objc_msgSend_hasValidHeader_(v4, v5, (uint64_t)a3))
  {
    EffectiveVersion = objc_msgSend_getEffectiveVersion_(SDOFMetadata, v6, (uint64_t)a3);
    if (EffectiveVersion == 4)
    {
      v10 = 0.0;
      sub_24B6D2098((uint64_t)a3, 0x258u, 1u, &v10);
      return v10;
    }
    else if (EffectiveVersion == 3)
    {
      return *((float *)a3 + 71);
    }
  }
  return v7;
}

+ (simple_lens_model_params)loadLensModelParams:(SEL)a3 simulatedAperture:(void *)a4 focusWindow:(float)a5 frameNormalizedFocalLength:(CGRect)a6 maxBlur:(float)a7
{
  double height;
  double width;
  double y;
  double x;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;

  *(_QWORD *)&retstr->var12 = 0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  if (*((int *)a4 + 1) <= 7)
  {
    height = a6.size.height;
    width = a6.size.width;
    y = a6.origin.y;
    x = a6.origin.x;
    result = (simple_lens_model_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if ((_DWORD)result == 4)
    {
      v27 = x;
      v28 = y;
      retstr->var0 = v27;
      retstr->var1 = v28;
      v29 = width;
      v30 = height;
      retstr->var2 = v29;
      retstr->var3 = v30;
      sub_24B6D2098((uint64_t)a4, 0xC9u, 1u, &retstr->var4);
      retstr->var5 = a7 * 36.0;
      retstr->var6 = a5;
      sub_24B6D2098((uint64_t)a4, 0x259u, 1u, &retstr->var7);
      sub_24B6D2098((uint64_t)a4, 0x25Au, 1u, &retstr->var8);
      retstr->var9 = a7;
      sub_24B6D2098((uint64_t)a4, 0xCAu, 1u, &retstr->var10);
      retstr->var11 = a8;
      sub_24B6D2098((uint64_t)a4, 0xC8u, 1u, &retstr->var12);
      return (simple_lens_model_params *)sub_24B6D2098((uint64_t)a4, 0x25Bu, 1u, &retstr->var13);
    }
    else if ((_DWORD)result == 3)
    {
      v17 = x;
      v18 = *((float *)a4 + 25);
      v19 = y;
      v20 = width;
      v21 = *((float *)a4 + 67);
      v22 = height;
      v23 = *((float *)a4 + 37);
      v24 = *((float *)a4 + 38);
      v25 = *((float *)a4 + 8);
      v26 = *((float *)a4 + 72);
      retstr->var0 = v17;
      retstr->var1 = v19;
      retstr->var2 = v20;
      retstr->var3 = v22;
      retstr->var4 = v23;
      retstr->var5 = a7 * 36.0;
      retstr->var6 = a5;
      retstr->var7 = v18;
      retstr->var8 = v21;
      retstr->var9 = a7;
      retstr->var10 = v24;
      retstr->var11 = a8;
      retstr->var12 = v25;
      retstr->var13 = v26;
    }
  }
  return result;
}

+ (int)loadMattingParams:(void *)a3 config:(id *)a4
{
  int result;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;

  result = -1;
  if (a3 && a4)
  {
    *a4 = *($E978C65257034D8B8CEA657553AB82B8 *)byte_24B6F5760;
    if ((*((_DWORD *)a3 + 1) - 8) >= 0xFFFFFFFD)
    {
      v7 = sub_24B6D2098((uint64_t)a3, 0x75u, 1u, a4);
      v8 = sub_24B6D2098((uint64_t)a3, 0x76u, 1u, &a4->var1) | v7;
      v9 = sub_24B6D2098((uint64_t)a3, 0x77u, 1u, &a4->var2);
      v10 = v8 | v9 | sub_24B6D2098((uint64_t)a3, 0x78u, 1u, &a4->var3);
      v11 = sub_24B6D2098((uint64_t)a3, 0x79u, 1u, &a4->var4);
      v12 = v11 | sub_24B6D2098((uint64_t)a3, 0x7Au, 1u, &a4->var5);
      v13 = v10 | v12 | sub_24B6D2098((uint64_t)a3, 0x7Bu, 1u, &a4->var6);
      v14 = sub_24B6D2098((uint64_t)a3, 0x7Cu, 1u, &a4->var7);
      v15 = v14 | sub_24B6D2098((uint64_t)a3, 0x7Du, 1u, &a4->var8);
      v16 = v15 | sub_24B6D2098((uint64_t)a3, 0x7Eu, 1u, &a4->var9);
      v17 = v13 | v16 | sub_24B6D2098((uint64_t)a3, 0x7Fu, 2u, &a4->var11);
      return v17 | sub_24B6D2098((uint64_t)a3, 0x80u, 1u, &a4->var10);
    }
    else
    {
      return -1;
    }
  }
  return result;
}

+ (crisp_hair_params)loadCrispHairParams:(SEL)a3
{
  *(_QWORD *)&retstr->var0 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var4 = 0.0;
  if ((*((_DWORD *)a4 + 1) - 8) >= 0xFFFFFFFC)
  {
    *(_OWORD *)&retstr->var0 = xmmword_24B6F5790;
    retstr->var4 = 0.4;
    sub_24B6D2098((uint64_t)a4, 0x44Cu, 1u, retstr);
    sub_24B6D2098((uint64_t)a4, 0x44Du, 1u, &retstr->var1);
    sub_24B6D2098((uint64_t)a4, 0x44Eu, 1u, &retstr->var2);
    sub_24B6D2098((uint64_t)a4, 0x44Fu, 1u, &retstr->var3);
    return (crisp_hair_params *)sub_24B6D2098((uint64_t)a4, 0x450u, 1u, &retstr->var4);
  }
  return result;
}

+ (disparity_refinement_params)loadDisparityRefinementParams:(SEL)a3
{
  int v6;
  float v7;
  float v8;
  __int128 v9;
  uint64_t v10;
  float v11;
  float v12;
  float *p_fgBlurScale;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  int *p_fgBgDilationSize;
  NSObject *v26;

  retstr->fgBgDilationSize = 0;
  *(_OWORD *)&retstr->aaLumaSigma = 0u;
  *(_OWORD *)&retstr->fgBlurScale = 0u;
  *(_OWORD *)&retstr->outerSamplingRadius = 0u;
  *(_OWORD *)&retstr->segmentationSigma = 0u;
  *(_OWORD *)&retstr->radius = 0u;
  if (*((int *)a4 + 1) <= 7)
  {
    result = (disparity_refinement_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if ((_DWORD)result == 4)
    {
      sub_24B6D2098((uint64_t)a4, 0x65u, 2u, retstr);
      sub_24B6D2098((uint64_t)a4, 0x6Au, 1u, &retstr->weightScaling);
      sub_24B6D2098((uint64_t)a4, 0x6Bu, 1u, &retstr->maxReconstructionWeight);
      sub_24B6D2098((uint64_t)a4, 0x6Cu, 1u, &retstr->innerSamplingRadius);
      sub_24B6D2098((uint64_t)a4, 0x6Du, 1u, &retstr->outerSamplingRadius);
      sub_24B6D2098((uint64_t)a4, 0x6Eu, 2u, &retstr->nSamples);
      sub_24B6D2098((uint64_t)a4, 0x6Fu, 1u, &retstr->lumaSigma);
      sub_24B6D2098((uint64_t)a4, 0x70u, 1u, &retstr->chromaSigma);
      sub_24B6D2098((uint64_t)a4, 0x73u, 1u, &retstr->segmentationSigma);
      sub_24B6D2098((uint64_t)a4, 0x66u, 1u, &retstr->disparitySigma);
      sub_24B6D2098((uint64_t)a4, 0x71u, 1u, &retstr->accumulatedWeightT0);
      sub_24B6D2098((uint64_t)a4, 0x72u, 1u, &retstr->accumulatedWeightT1);
      sub_24B6D2098((uint64_t)a4, 0x67u, 1u, &retstr->aaLumaSigma);
      sub_24B6D2098((uint64_t)a4, 0x68u, 1u, &retstr->aaChromaSigma);
      sub_24B6D2098((uint64_t)a4, 0x74u, 1u, &retstr->aaSegmentationSigma);
      result = (disparity_refinement_params *)sub_24B6D2098((uint64_t)a4, 0x69u, 1u, &retstr->aaSpatialSigma);
      p_fgBlurScale = &retstr->fgBlurScale;
      if (*((int *)a4 + 1) < 6)
      {
        *(_QWORD *)p_fgBlurScale = 0;
        *(_QWORD *)&retstr->fgDeadZoneOffset = 0;
        retstr->fgBgDilationSize = 0;
      }
      else
      {
        if (sub_24B6D2098((uint64_t)a4, 0x4B5u, 1u, &retstr->fgBlurScale))
        {
          *p_fgBlurScale = 1.0;
          uni_logger_api();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            sub_24B6EF9C0();

        }
        if (sub_24B6D2098((uint64_t)a4, 0x4B6u, 1u, &retstr->fgBlurClamp))
        {
          retstr->fgBlurClamp = 1.0;
          uni_logger_api();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            sub_24B6EF95C();

        }
        if (sub_24B6D2098((uint64_t)a4, 0x4BBu, 1u, &retstr->fgDeadZoneOffset))
        {
          retstr->fgDeadZoneOffset = 0.0;
          uni_logger_api();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            sub_24B6EF8F4(v16, v17, v18, v19, v20, v21, v22, v23);

        }
        if (sub_24B6D2098((uint64_t)a4, 0x4BDu, 1u, &retstr->fgFgBgThreshold))
        {
          retstr->fgFgBgThreshold = 0.05;
          uni_logger_api();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            sub_24B6EF888();

        }
        p_fgBgDilationSize = &retstr->fgBgDilationSize;
        result = (disparity_refinement_params *)sub_24B6D2098((uint64_t)a4, 0x4BEu, 2u, p_fgBgDilationSize);
        if ((_DWORD)result)
        {
          *p_fgBgDilationSize = 7;
          uni_logger_api();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            sub_24B6EF80C(v26);

        }
      }
    }
    else if ((_DWORD)result == 3)
    {
      v6 = *((_DWORD *)a4 + 32);
      v7 = *((float *)a4 + 68);
      v8 = *((float *)a4 + 4);
      *(_QWORD *)&v9 = *(_QWORD *)((char *)a4 + 140);
      v10 = *(_QWORD *)((char *)a4 + 20);
      v11 = *((float *)a4 + 69);
      v12 = *((float *)a4 + 7);
      retstr->radius = *((_DWORD *)a4 + 3);
      *(_OWORD *)&retstr->weightScaling = *((_OWORD *)a4 + 7);
      retstr->nSamples = v6;
      *(_QWORD *)&retstr->lumaSigma = *(_QWORD *)((char *)a4 + 132);
      retstr->segmentationSigma = v7;
      retstr->disparitySigma = v8;
      *((_QWORD *)&v9 + 1) = v10;
      *(_OWORD *)&retstr->accumulatedWeightT0 = v9;
      retstr->aaSegmentationSigma = v11;
      retstr->aaSpatialSigma = v12;
      *(_QWORD *)&retstr->fgBlurScale = 0;
      *(_QWORD *)&retstr->fgDeadZoneOffset = 0;
      retstr->fgBgDilationSize = 0;
    }
  }
  return result;
}

+ (segmentation_fusion_params)loadSegmentationFusionParams:(SEL)a3 simulatedAperture:(void *)a4 maxBlur:(float)a5
{
  float v10;

  retstr->var8 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  if (*((int *)a4 + 1) <= 7)
  {
    result = (segmentation_fusion_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if ((_DWORD)result == 4)
    {
      retstr->var0 = a5;
      retstr->var2 = a6;
      sub_24B6D2098((uint64_t)a4, 0x258u, 1u, &retstr->var1);
      sub_24B6D2098((uint64_t)a4, 0x384u, 1u, &retstr->var3);
      sub_24B6D2098((uint64_t)a4, 0x385u, 1u, &retstr->var4);
      sub_24B6D2098((uint64_t)a4, 0x386u, 1u, &retstr->var5);
      sub_24B6D2098((uint64_t)a4, 0x387u, 1u, &retstr->var6);
      sub_24B6D2098((uint64_t)a4, 0x388u, 1u, &retstr->var7);
      return (segmentation_fusion_params *)sub_24B6D2098((uint64_t)a4, 0x389u, 1u, &retstr->var8);
    }
    else if ((_DWORD)result == 3)
    {
      v10 = *((float *)a4 + 71);
      retstr->var0 = a5;
      retstr->var1 = v10;
      retstr->var2 = a6;
      *(_OWORD *)&retstr->var3 = *(_OWORD *)((char *)a4 + 228);
      *(_QWORD *)&retstr->var7 = *(_QWORD *)((char *)a4 + 244);
    }
  }
  return result;
}

+ (blurmap_refinement_params)loadBlurmapRefinementParams:(SEL)a3 apertureScaling:(void *)a4 inputScale:(float)a5 focusWindow:(float)a6 segmentationFusionParams:(CGRect)a7
{
  double height;
  double width;
  double y;
  double x;
  int v17;
  __int128 v18;
  int v19;
  float v20;
  float v21;
  int v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  uint64_t v28;
  float v29;
  float v30;
  float v31;
  float v32;

  *(_OWORD *)&retstr->var13 = 0u;
  *(_OWORD *)&retstr->var10.var11 = 0u;
  *(_OWORD *)&retstr->var10.var15 = 0u;
  *(_OWORD *)&retstr->var10.var3 = 0u;
  *(_OWORD *)&retstr->var10.var7 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var9.var3 = 0u;
  *(_OWORD *)&retstr->var1.var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var0.var3 = 0u;
  *(_OWORD *)&retstr->var0.var0.var0 = 0u;
  *(_OWORD *)&retstr->var0.var0.var4 = 0u;
  if (*((int *)a4 + 1) <= 7)
  {
    height = a7.size.height;
    width = a7.size.width;
    y = a7.origin.y;
    x = a7.origin.x;
    result = (blurmap_refinement_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if ((_DWORD)result == 4)
    {
      *(_OWORD *)&retstr->var0.var0.var0 = *(_OWORD *)&a8->var3;
      *(_QWORD *)&retstr->var0.var0.var4 = *(_QWORD *)&a8->var7;
      sub_24B6D2098((uint64_t)a4, 0x3F3u, 2u, &retstr->var0.var1);
      sub_24B6D2098((uint64_t)a4, 0x3F4u, 1u, &retstr->var0.var2);
      sub_24B6D2098((uint64_t)a4, 0x3F5u, 1u, &retstr->var0.var3);
      sub_24B6D2098((uint64_t)a4, 0x3F9u, 1u, &retstr->var1.var0.var0);
      sub_24B6D2098((uint64_t)a4, 0x3FAu, 1u, &retstr->var1.var0.var1);
      sub_24B6D2098((uint64_t)a4, 0x3FEu, 1u, &retstr->var1.var0.var2);
      sub_24B6D2098((uint64_t)a4, 0x3FBu, 1u, &retstr->var1.var0.var3);
      sub_24B6D2098((uint64_t)a4, 0x3FCu, 1u, &retstr->var1.var0.var4);
      sub_24B6D2098((uint64_t)a4, 0x3FDu, 1u, &retstr->var1.var0.var5);
      sub_24B6D2098((uint64_t)a4, 0x3F6u, 2u, &retstr->var1.var1);
      sub_24B6D2098((uint64_t)a4, 0x3F7u, 1u, &retstr->var1.var2);
      sub_24B6D2098((uint64_t)a4, 0x3F8u, 1u, &retstr->var1.var3);
      sub_24B6D2098((uint64_t)a4, 0x3ECu, 1u, &retstr->var2);
      retstr->var3 = a5;
      sub_24B6D2098((uint64_t)a4, 0x3FFu, 1u, &retstr->var4);
      sub_24B6D2098((uint64_t)a4, 0x3EEu, 1u, &retstr->var5);
      sub_24B6D2098((uint64_t)a4, 0x3EFu, 1u, &retstr->var6);
      sub_24B6D2098((uint64_t)a4, 0x3EDu, 1u, &retstr->var7);
      sub_24B6D2098((uint64_t)a4, 0x3F0u, 1u, &retstr->var8);
      sub_24B6D2098((uint64_t)a4, 0x3E8u, 1u, &retstr->var9.var0);
      sub_24B6D2098((uint64_t)a4, 0x3E9u, 1u, &retstr->var9.var1);
      sub_24B6D2098((uint64_t)a4, 0x3EAu, 1u, &retstr->var9.var2);
      sub_24B6D2098((uint64_t)a4, 0x3EBu, 1u, &retstr->var9.var3);
      sub_24B6D2098((uint64_t)a4, 0x400u, 2u, &retstr->var10.var0);
      sub_24B6D2098((uint64_t)a4, 0x401u, 1u, &retstr->var10.var1);
      sub_24B6D2098((uint64_t)a4, 0x402u, 1u, &retstr->var10.var2);
      sub_24B6D2098((uint64_t)a4, 0x403u, 1u, &retstr->var10.var3);
      sub_24B6D2098((uint64_t)a4, 0x404u, 1u, &retstr->var10.var4);
      sub_24B6D2098((uint64_t)a4, 0x405u, 1u, &retstr->var10.var5);
      sub_24B6D2098((uint64_t)a4, 0x406u, 1u, &retstr->var10.var6);
      sub_24B6D2098((uint64_t)a4, 0x407u, 1u, &retstr->var10.var7);
      sub_24B6D2098((uint64_t)a4, 0x408u, 1u, &retstr->var10.var8);
      sub_24B6D2098((uint64_t)a4, 0x409u, 1u, &retstr->var10.var9);
      sub_24B6D2098((uint64_t)a4, 0x40Au, 1u, &retstr->var10.var10);
      sub_24B6D2098((uint64_t)a4, 0x40Bu, 1u, &retstr->var10.var11);
      sub_24B6D2098((uint64_t)a4, 0x40Cu, 1u, &retstr->var10.var12);
      sub_24B6D2098((uint64_t)a4, 0x40Du, 1u, &retstr->var10.var13);
      sub_24B6D2098((uint64_t)a4, 0x40Eu, 1u, &retstr->var10.var14);
      sub_24B6D2098((uint64_t)a4, 0x40Fu, 1u, &retstr->var10.var15);
      sub_24B6D2098((uint64_t)a4, 0x3F1u, 1u, &retstr->var11);
      result = (blurmap_refinement_params *)sub_24B6D2098((uint64_t)a4, 0x3F2u, 1u, &retstr->var12);
      v29 = x;
      v30 = y;
      retstr->var13 = v29;
      retstr->var14 = v30;
      v31 = width;
      v32 = height;
      retstr->var15 = v31;
      retstr->var16 = v32;
    }
    else if ((_DWORD)result == 3)
    {
      v17 = (int)*((float *)a4 + 84);
      *(_QWORD *)&v18 = *(_QWORD *)((char *)a4 + 340);
      v19 = (int)*((float *)a4 + 87);
      v20 = *((float *)a4 + 77);
      v21 = *((float *)a4 + 96);
      v22 = *((_DWORD *)a4 + 97);
      v23 = *((float *)a4 + 110);
      v24 = x;
      v25 = y;
      v26 = width;
      v27 = height;
      *(_OWORD *)&retstr->var0.var0.var0 = *(_OWORD *)&a8->var3;
      *(_QWORD *)&retstr->var0.var0.var4 = *(_QWORD *)&a8->var7;
      retstr->var0.var1 = v17;
      v28 = *((_QWORD *)a4 + 44);
      *((_QWORD *)&v18 + 1) = *((_QWORD *)a4 + 45);
      *(_OWORD *)&retstr->var0.var2 = v18;
      *(int8x16_t *)&retstr->var1.var0.var2 = vextq_s8(*((int8x16_t *)a4 + 23), *((int8x16_t *)a4 + 23), 0xCuLL);
      retstr->var1.var1 = v19;
      *(_QWORD *)&retstr->var1.var2 = v28;
      retstr->var2 = v20;
      retstr->var3 = a5;
      retstr->var4 = v21;
      *(int32x4_t *)&retstr->var5 = vzip2q_s32(vzip1q_s32(*(int32x4_t *)((char *)a4 + 312), (int32x4_t)vextq_s8(*(int8x16_t *)((char *)a4 + 312), *(int8x16_t *)((char *)a4 + 312), 0xCuLL)), *(int32x4_t *)((char *)a4 + 312));
      retstr->var9 = *(subject_distance *)((char *)a4 + 292);
      retstr->var10.var0 = v22;
      *(_OWORD *)&retstr->var10.var1 = *(_OWORD *)((char *)a4 + 392);
      *(_OWORD *)&retstr->var10.var5 = *(_OWORD *)((char *)a4 + 408);
      *(_OWORD *)&retstr->var10.var9 = *(_OWORD *)((char *)a4 + 424);
      retstr->var10.var13 = v23;
      *(_QWORD *)&retstr->var10.var14 = 0x3F80000000000000;
      *(_QWORD *)&retstr->var11 = *((_QWORD *)a4 + 41);
      retstr->var13 = v24;
      retstr->var14 = v25;
      retstr->var15 = v26;
      retstr->var16 = v27;
    }
    if (a6 != 1.0)
    {
      retstr->var0.var1 = (int)(float)((float)retstr->var0.var1 * a6);
      retstr->var1.var1 = (int)(float)((float)retstr->var1.var1 * a6);
    }
  }
  return result;
}

+ (face_mask_params)loadFaceMaskParams:(SEL)a3 facePoints:(void *)a4 simulatedAperture:(CGPoint *)a5 aspectRatio:(float)a6 maxBlur:(float)a7
{
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float32x4_t v18;
  float64x2_t v20;
  float64x2_t v21;
  float32x4_t v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float64x2_t v29;
  float32x4_t v30;
  float64x2_t v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  float64x2_t v40;
  float64x2_t v41;
  float64x2_t v42;

  *(_OWORD *)&retstr[2].var10 = 0u;
  *(_OWORD *)&retstr[2].var14 = 0u;
  *(_OWORD *)&retstr[2].var2 = 0u;
  *(_OWORD *)&retstr[2].var6 = 0u;
  *(_OWORD *)&retstr[1].var9 = 0u;
  *(_OWORD *)&retstr[1].var13 = 0u;
  *(_OWORD *)&retstr[1].var1 = 0u;
  *(_OWORD *)&retstr[1].var5 = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  if (*((int *)a4 + 1) <= 7)
  {
    result = (face_mask_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if ((_DWORD)result == 4)
    {
      retstr->var0 = a8;
      retstr->var1 = a6;
      sub_24B6D2098((uint64_t)a4, 0x258u, 1u, &retstr->var2);
      v35.f64[0] = a5[8].x;
      v36.f64[0] = a5[8].y;
      v35.f64[1] = a5[12].x;
      v37.f64[0] = a5->x;
      v38.f64[0] = a5->y;
      v37.f64[1] = a5[4].x;
      v36.f64[1] = a5[12].y;
      v38.f64[1] = a5[4].y;
      *(float32x4_t *)&retstr->var4 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v37), v35);
      *(float32x4_t *)&retstr->var8 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v38), v36);
      v35.f64[0] = a5[9].x;
      v36.f64[0] = a5[9].y;
      v35.f64[1] = a5[13].x;
      v37.f64[0] = a5[1].x;
      v38.f64[0] = a5[1].y;
      v37.f64[1] = a5[5].x;
      v39 = (float64x2_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v37), v35);
      v36.f64[1] = a5[13].y;
      v38.f64[1] = a5[5].y;
      v40 = (float64x2_t)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v38), v36);
      v36.f64[0] = a5[10].x;
      v38.f64[0] = a5[10].y;
      v36.f64[1] = a5[14].x;
      v41.f64[0] = a5[2].x;
      v42.f64[0] = a5[2].y;
      v41.f64[1] = a5[6].x;
      *(float64x2_t *)&retstr->var12 = v39;
      *(float64x2_t *)&retstr[1].var1 = v40;
      v38.f64[1] = a5[14].y;
      v42.f64[1] = a5[6].y;
      *(float32x4_t *)&retstr[1].var5 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v41), v36);
      *(float32x4_t *)&retstr[1].var9 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v42), v38);
      v40.f64[0] = a5[11].x;
      v36.f64[0] = a5[11].y;
      v40.f64[1] = a5[15].x;
      v39.f64[0] = a5[3].x;
      v38.f64[0] = a5[3].y;
      v39.f64[1] = a5[7].x;
      v36.f64[1] = a5[15].y;
      v38.f64[1] = a5[7].y;
      *(float32x4_t *)&retstr[1].var13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v39), v40);
      *(float32x4_t *)&retstr[2].var2 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v38), v36);
      sub_24B6D2098((uint64_t)a4, 0x130u, 1u, &retstr[2].var6);
      sub_24B6D2098((uint64_t)a4, 0x131u, 1u, &retstr[2].var7);
      sub_24B6D2098((uint64_t)a4, 0x12Fu, 1u, &retstr[2].var8);
      sub_24B6D2098((uint64_t)a4, 0x12Cu, 1u, &retstr[2].var9);
      sub_24B6D2098((uint64_t)a4, 0x12Du, 1u, &retstr[2].var10);
      sub_24B6D2098((uint64_t)a4, 0x12Eu, 1u, &retstr[2].var11);
      sub_24B6D2098((uint64_t)a4, 0x132u, 1u, &retstr[2].var12);
      result = (face_mask_params *)sub_24B6D2098((uint64_t)a4, 0x133u, 1u, &retstr[2].var13);
      __asm { FMOV            V0.2S, #1.0 }
      *(_QWORD *)&retstr[2].var14 = _D0;
    }
    else
    {
      if ((_DWORD)result != 3)
        return result;
      v14.f64[0] = a5[8].x;
      v15.f64[0] = a5[8].y;
      v14.f64[1] = a5[12].x;
      v16.f64[0] = a5->x;
      v17.f64[0] = a5->y;
      v16.f64[1] = a5[4].x;
      v18 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v16), v14);
      v15.f64[1] = a5[12].y;
      v17.f64[1] = a5[4].y;
      _Q1 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v17), v15);
      v17.f64[0] = a5[9].x;
      v20.f64[0] = a5[9].y;
      v17.f64[1] = a5[13].x;
      v15.f64[0] = a5[1].x;
      v21.f64[0] = a5[1].y;
      v15.f64[1] = a5[5].x;
      v20.f64[1] = a5[13].y;
      v21.f64[1] = a5[5].y;
      v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v15), v17);
      *(float32x2_t *)&v17.f64[0] = vcvt_f32_f64(v21);
      v21.f64[0] = a5[10].x;
      v23.f64[0] = a5[10].y;
      v21.f64[1] = a5[14].x;
      v24.f64[0] = a5[2].x;
      v25.f64[0] = a5[2].y;
      v24.f64[1] = a5[6].x;
      v26 = vcvt_hight_f32_f64(*(int32x2_t *)&v17.f64[0], v20);
      v27 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v24), v21);
      v23.f64[1] = a5[14].y;
      v25.f64[1] = a5[6].y;
      v28 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v25), v23);
      v23.f64[0] = a5[11].x;
      v24.f64[0] = a5[11].y;
      v23.f64[1] = a5[15].x;
      v25.f64[0] = a5[3].x;
      v29.f64[0] = a5[3].y;
      v25.f64[1] = a5[7].x;
      v30 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v25), v23);
      LODWORD(v23.f64[0]) = *((_DWORD *)a4 + 71);
      v24.f64[1] = a5[15].y;
      v29.f64[1] = a5[7].y;
      retstr->var0 = a8;
      retstr->var1 = a6;
      retstr->var2 = *(float *)v23.f64;
      *(float32x4_t *)&retstr->var4 = v18;
      *(float32x4_t *)&retstr->var8 = _Q1;
      *(float32x4_t *)&retstr->var12 = v22;
      *(float32x4_t *)&retstr[1].var1 = v26;
      *(float32x4_t *)&retstr[1].var5 = v27;
      *(float32x4_t *)&retstr[1].var9 = v28;
      *(float32x4_t *)&retstr[1].var13 = v30;
      *(float32x4_t *)&retstr[2].var2 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v29), v24);
      *(_QWORD *)&retstr[2].var6 = *(_QWORD *)((char *)a4 + 212);
      *(int8x16_t *)&retstr[2].var8 = vextq_s8(*(int8x16_t *)((char *)a4 + 36), *(int8x16_t *)((char *)a4 + 36), 0xCuLL);
      __asm { FMOV            V1.2S, #1.0 }
      *(_QWORD *)&retstr[2].var12 = *(_QWORD *)((char *)a4 + 220);
      *(_QWORD *)&retstr[2].var14 = _Q1.i64[0];
    }
    retstr[3].var1 = 0.5;
    retstr[3].var2 = a7;
  }
  return result;
}

+ (blurmap_smoothing_params)loadBlurmapSmoothingParams:(SEL)a3
{
  *(_QWORD *)&retstr->var0 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var4 = 0.0;
  if (*((int *)a4 + 1) <= 7)
  {
    result = (blurmap_smoothing_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if ((_DWORD)result == 4)
    {
      sub_24B6D2098((uint64_t)a4, 0x320u, 2u, retstr);
      sub_24B6D2098((uint64_t)a4, 0x321u, 1u, &retstr->var1);
      sub_24B6D2098((uint64_t)a4, 0x322u, 1u, &retstr->var2);
      sub_24B6D2098((uint64_t)a4, 0x323u, 1u, &retstr->var3);
      return (blurmap_smoothing_params *)sub_24B6D2098((uint64_t)a4, 0x324u, 1u, &retstr->var4);
    }
    else if ((_DWORD)result == 3)
    {
      retstr->var0 = *((_DWORD *)a4 + 39);
      *(_OWORD *)&retstr->var1 = *(_OWORD *)((char *)a4 + 252);
    }
  }
  return result;
}

+ (rendering_config_params)loadRenderingParams:(SEL)a3 simulatedAperture:(void *)a4 lumaNoiseAmplitude:(float)a5 maxBlur:(float)a6
{
  float v12;
  int v13;
  float v14;
  int v15;
  float v16;
  float v17;
  int v18;
  float v19;
  float v20;
  __int128 v21;
  uint64_t v22;
  float v23;
  int v24;
  __int128 v25;
  uint64_t v26;
  float v27;
  int *p_nRings;
  int v35;
  float *p_bicubicDownsampleParamB;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int *p_fgNRings;
  NSObject *v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;

  *(_OWORD *)&retstr->fgHitThreshold = 0u;
  *(_OWORD *)&retstr->fgBlurWeightSmoothstepEnd = 0u;
  *(_OWORD *)&retstr->ohlbIntensityGain = 0u;
  *(_OWORD *)&retstr->fgMinNRings = 0u;
  *(_OWORD *)&retstr->xhlrbMaxIntensityT1 = 0u;
  *(_OWORD *)&retstr->xhlrbWeightGain = 0u;
  *(_OWORD *)&retstr->ringAmplitude = 0u;
  *(_OWORD *)&retstr->xhlrbIterations = 0u;
  *(_OWORD *)&retstr->nRings = 0u;
  *(_OWORD *)&retstr->relativeWeightThreshold = 0u;
  *(_OWORD *)&retstr->maxBlur = 0u;
  *(_OWORD *)&retstr->lumaNoiseAmplitude = 0u;
  *(_OWORD *)&retstr->simulatedAperture = 0u;
  if (*((int *)a4 + 1) <= 7)
  {
    result = (rendering_config_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if ((_DWORD)result == 4)
    {
      retstr->simulatedAperture = a5;
      sub_24B6D2098((uint64_t)a4, 0x258u, 1u, &retstr->defaultSimulatedAperture);
      sub_24B6D2098((uint64_t)a4, 0x1FAu, 1u, &retstr->preFilterBlurStrength);
      sub_24B6D2098((uint64_t)a4, 0x1FCu, 2u, &retstr->preFilterRadius);
      retstr->maxBlur = a7;
      sub_24B6D2098((uint64_t)a4, 0x1FDu, 1u, &retstr->sharpRadius);
      sub_24B6D2098((uint64_t)a4, 0x1FEu, 1u, &retstr->softRadius);
      sub_24B6D2098((uint64_t)a4, 0x1FFu, 1u, &retstr->lumaNoiseModelCoeff);
      retstr->lumaNoiseAmplitude = a6;
      sub_24B6D2098((uint64_t)a4, 0x1F6u, 1u, &retstr->highlightBoostGain);
      p_nRings = &retstr->nRings;
      sub_24B6D2098((uint64_t)a4, 0x1F4u, 2u, &retstr->nRings);
      if (sub_24B6D2098((uint64_t)a4, 0x1F2u, 2u, &retstr->minNRings))
        retstr->minNRings = *p_nRings;
      if (sub_24B6D2098((uint64_t)a4, 0x1F3u, 2u, &retstr->maxNRings))
        retstr->maxNRings = *p_nRings;
      retstr->basePixelWeight = 1.0e-12;
      sub_24B6D2098((uint64_t)a4, 0x1FBu, 1u, &retstr->antiAliasBlurStrength);
      sub_24B6D2098((uint64_t)a4, 0x200u, 2u, &retstr->antiAliasRadius);
      sub_24B6D2098((uint64_t)a4, 0x1F5u, 1u, &retstr->relativeWeightThreshold);
      sub_24B6D2098((uint64_t)a4, 0x201u, 1u, &retstr->alphaEpsilon);
      sub_24B6D2098((uint64_t)a4, 0x202u, 1u, &retstr->alphaGain);
      sub_24B6D2098((uint64_t)a4, 0x1F7u, 1u, &retstr->shapeObstructionCoeff);
      sub_24B6D2098((uint64_t)a4, 0x1F8u, 1u, &retstr->ringAmplitude);
      sub_24B6D2098((uint64_t)a4, 0x1F9u, 1u, &retstr->ringSharpness);
      sub_24B6D2098((uint64_t)a4, 0x2BCu, 1u, &retstr->blendingQuarterResAlphaGain);
      sub_24B6D2098((uint64_t)a4, 0x2BDu, 1u, &retstr->blendingFullResAlphaGain);
      sub_24B6D2098((uint64_t)a4, 0x190u, 2u, &retstr->xhlrbIterations);
      sub_24B6D2098((uint64_t)a4, 0x194u, 1u, &retstr->xhlrbBlurRadiusT0);
      sub_24B6D2098((uint64_t)a4, 0x195u, 1u, &retstr->xhlrbBlurRadiusT1);
      sub_24B6D2098((uint64_t)a4, 0x196u, 1u, &retstr->xhlrbMaxIntensityT0);
      sub_24B6D2098((uint64_t)a4, 0x197u, 1u, &retstr->xhlrbMaxIntensityT1);
      sub_24B6D2098((uint64_t)a4, 0x198u, 1u, &retstr->xhlrbMinIntensityT0);
      sub_24B6D2098((uint64_t)a4, 0x199u, 1u, &retstr->xhlrbMinIntensityT1);
      sub_24B6D2098((uint64_t)a4, 0x191u, 1u, &retstr->xhlrbPreFilterGain);
      sub_24B6D2098((uint64_t)a4, 0x192u, 1u, &retstr->xhlrbWeightGain);
      sub_24B6D2098((uint64_t)a4, 0x193u, 1u, &retstr->xhlrbIntensityGain);
      sub_24B6D2098((uint64_t)a4, 0x1C2u, 1u, &retstr->ohlbPreFilterGain);
      sub_24B6D2098((uint64_t)a4, 0x1C3u, 1u, &retstr->ohlbWeightGain);
      sub_24B6D2098((uint64_t)a4, 0x1C4u, 1u, &retstr->ohlbIntensityGain);
      result = (rendering_config_params *)sub_24B6D2098((uint64_t)a4, 0x1C5u, 1u, &retstr->gainMapHeadroom);
      v35 = *((_DWORD *)a4 + 1);
      if (v35 < 5
        || (result = (rendering_config_params *)sub_24B6D2098((uint64_t)a4, 0x1C6u, 1u, &retstr->linearBoostGain),
            v35 == 5))
      {
        retstr->fgNRings = 0;
        *(_QWORD *)&retstr->fgMinNRings = 0;
        __asm { FMOV            V0.2S, #1.0 }
        *(_QWORD *)&retstr->fgTraceStepScale = _D0;
        *(_QWORD *)&retstr->fgBlurWeightSmoothstepStart = 0;
        *(_QWORD *)&retstr->fgAlphaSmoothstepStart = 0;
        retstr->fgAARadius = 0.0;
      }
      else
      {
        p_fgNRings = &retstr->fgNRings;
        sub_24B6D2098((uint64_t)a4, 0x4B0u, 2u, &retstr->fgNRings);
        if (sub_24B6D2098((uint64_t)a4, 0x4B1u, 2u, &retstr->fgMinNRings))
          retstr->fgMinNRings = *p_fgNRings;
        if (sub_24B6D2098((uint64_t)a4, 0x4B2u, 2u, &retstr->fgMaxNRings))
          retstr->fgMaxNRings = *p_fgNRings;
        if (sub_24B6D2098((uint64_t)a4, 0x4B3u, 1u, &retstr->fgTraceStepScale))
        {
          retstr->fgTraceStepScale = 1.0;
          uni_logger_api();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            sub_24B6EFD74();

        }
        if (sub_24B6D2098((uint64_t)a4, 0x4B4u, 1u, &retstr->fgHitThreshold))
        {
          retstr->fgHitThreshold = 1.0;
          uni_logger_api();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            sub_24B6EFD10();

        }
        if (sub_24B6D2098((uint64_t)a4, 0x4B7u, 1u, &retstr->fgAlphaSmoothstepStart))
        {
          retstr->fgAlphaSmoothstepStart = -2.0;
          uni_logger_api();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
            sub_24B6EFCA4(v57, v58, v59, v60, v61, v62, v63, v64);

        }
        if (sub_24B6D2098((uint64_t)a4, 0x4B8u, 1u, &retstr->fgAlphaSmoothstepEnd))
        {
          retstr->fgAlphaSmoothstepEnd = 0.0;
          uni_logger_api();
          v65 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
            sub_24B6EFC3C(v65, v66, v67, v68, v69, v70, v71, v72);

        }
        if (sub_24B6D2098((uint64_t)a4, 0x4B9u, 1u, &retstr->fgBlurWeightSmoothstepStart))
        {
          retstr->fgBlurWeightSmoothstepStart = -1.0;
          uni_logger_api();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
            sub_24B6EFBD0(v73, v74, v75, v76, v77, v78, v79, v80);

        }
        if (sub_24B6D2098((uint64_t)a4, 0x4BAu, 1u, &retstr->fgBlurWeightSmoothstepEnd))
        {
          retstr->fgBlurWeightSmoothstepEnd = 0.3;
          uni_logger_api();
          v81 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
            sub_24B6EFB64();

        }
        result = (rendering_config_params *)sub_24B6D2098((uint64_t)a4, 0x4BCu, 1u, &retstr->fgAARadius);
        if ((_DWORD)result)
        {
          retstr->fgAARadius = 2.0;
          uni_logger_api();
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
            sub_24B6EFAF8(v82, v83, v84, v85, v86, v87, v88, v89);

        }
      }
      p_bicubicDownsampleParamB = &retstr->bicubicDownsampleParamB;
      if (*((int *)a4 + 1) < 7)
      {
        *(_QWORD *)p_bicubicDownsampleParamB = 0x3F40000000000000;
      }
      else
      {
        if (sub_24B6D2098((uint64_t)a4, 0x522u, 1u, &retstr->bicubicDownsampleParamB))
        {
          *p_bicubicDownsampleParamB = 0.0;
          uni_logger_api();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            sub_24B6EFA90(v38, v39, v40, v41, v42, v43, v44, v45);

        }
        result = (rendering_config_params *)sub_24B6D2098((uint64_t)a4, 0x523u, 1u, &retstr->bicubicDownsampleParamC);
        if ((_DWORD)result)
        {
          retstr->bicubicDownsampleParamC = 0.75;
          uni_logger_api();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            sub_24B6EFA24(v46, v47, v48, v49, v50, v51, v52, v53);

        }
      }
      retstr->xhlrbTileSize = 8;
    }
    else if ((_DWORD)result == 3)
    {
      v12 = *((float *)a4 + 71);
      v13 = *((_DWORD *)a4 + 40);
      v14 = *((float *)a4 + 43);
      v15 = *((_DWORD *)a4 + 17);
      v17 = *((float *)a4 + 23);
      v16 = *((float *)a4 + 24);
      v18 = *((_DWORD *)a4 + 44);
      v20 = *((float *)a4 + 18);
      v19 = *((float *)a4 + 19);
      *(_QWORD *)&v21 = *(_QWORD *)((char *)a4 + 180);
      v22 = *((_QWORD *)a4 + 10);
      v23 = *((float *)a4 + 22);
      v24 = *((_DWORD *)a4 + 13);
      *(_QWORD *)&v25 = *(_QWORD *)((char *)a4 + 204);
      v26 = *((_QWORD *)a4 + 7);
      v27 = *((float *)a4 + 16);
      retstr->simulatedAperture = a5;
      retstr->defaultSimulatedAperture = v12;
      retstr->preFilterBlurStrength = v17;
      retstr->preFilterRadius = v13;
      retstr->maxBlur = a7;
      *(_QWORD *)&retstr->sharpRadius = *(_QWORD *)((char *)a4 + 164);
      retstr->lumaNoiseModelCoeff = v14;
      retstr->lumaNoiseAmplitude = a6;
      retstr->highlightBoostGain = v19;
      retstr->minNRings = v15;
      retstr->maxNRings = v15;
      retstr->nRings = v15;
      retstr->basePixelWeight = 1.0e-12;
      retstr->antiAliasBlurStrength = v16;
      retstr->antiAliasRadius = v18;
      retstr->relativeWeightThreshold = v20;
      *((_QWORD *)&v21 + 1) = v22;
      *(_OWORD *)&retstr->alphaEpsilon = v21;
      retstr->ringSharpness = v23;
      *(_QWORD *)&retstr->blendingQuarterResAlphaGain = *((_QWORD *)a4 + 13);
      retstr->xhlrbIterations = v24;
      *((_QWORD *)&v25 + 1) = v26;
      *(_OWORD *)&retstr->xhlrbBlurRadiusT0 = *(_OWORD *)((char *)a4 + 188);
      *(_OWORD *)&retstr->xhlrbMinIntensityT0 = v25;
      retstr->xhlrbIntensityGain = v27;
      *(_QWORD *)&retstr->ohlbPreFilterGain = 0;
      *(_QWORD *)&retstr->ohlbIntensityGain = 0x800000000;
      __asm { FMOV            V0.2S, #4.0 }
      *(_QWORD *)&retstr->gainMapHeadroom = _D0;
      *(_QWORD *)&retstr->fgMinNRings = 0;
      retstr->fgNRings = 0;
      __asm { FMOV            V0.2S, #1.0 }
      *(_QWORD *)&retstr->fgTraceStepScale = _D0;
      *(_QWORD *)&retstr->fgBlurWeightSmoothstepStart = 0;
      *(_QWORD *)&retstr->fgAlphaSmoothstepStart = 0;
      retstr->bicubicDownsampleParamC = 0.0;
      *(_QWORD *)&retstr->fgAARadius = 0;
    }
  }
  return result;
}

+ (hairnet_params)defaultHairnetParams
{
  *retstr = *(hairnet_params *)zmmword_24B6F5720;
  return result;
}

+ (hairnet_params)loadHairnetParams:(SEL)a3
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  float *p_var15;
  NSObject *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;

  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var12 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  if (*((int *)a4 + 1) <= 7)
  {
    result = (hairnet_params *)objc_msgSend_getEffectiveVersion_(SDOFMetadata, a3, (uint64_t)a4);
    if ((int)result >= 4 && *((int *)a4 + 1) >= 7)
    {
      if (sub_24B6D2098((uint64_t)a4, 0x514u, 1u, retstr))
      {
        retstr->var0 = 0.25;
        uni_logger_api();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          sub_24B6F0450(v6, v7, v8, v9, v10, v11, v12, v13);

      }
      if (sub_24B6D2098((uint64_t)a4, 0x515u, 1u, &retstr->var1))
      {
        retstr->var1 = 0.2163;
        uni_logger_api();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          sub_24B6F03DC(v14, v15, v16, v17, v18, v19, v20, v21);

      }
      if (sub_24B6D2098((uint64_t)a4, 0x516u, 1u, &retstr->var2))
      {
        retstr->var2 = 0.029762;
        uni_logger_api();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          sub_24B6F0378();

      }
      if (sub_24B6D2098((uint64_t)a4, 0x517u, 1u, &retstr->var3))
      {
        retstr->var3 = 0.02;
        uni_logger_api();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          sub_24B6F0304(v23, v24, v25, v26, v27, v28, v29, v30);

      }
      if (sub_24B6D2098((uint64_t)a4, 0x518u, 1u, &retstr->var4))
      {
        retstr->var4 = 0.85;
        uni_logger_api();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          sub_24B6F0298();

      }
      if (sub_24B6D2098((uint64_t)a4, 0x519u, 1u, &retstr->var5))
      {
        retstr->var5 = 0.029762;
        uni_logger_api();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          sub_24B6F0234();

      }
      if (sub_24B6D2098((uint64_t)a4, 0x51Au, 1u, &retstr->var6))
      {
        retstr->var6 = 0.001;
        uni_logger_api();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          sub_24B6F01C0(v33, v34, v35, v36, v37, v38, v39, v40);

      }
      if (sub_24B6D2098((uint64_t)a4, 0x51Bu, 1u, &retstr->var7))
      {
        retstr->var7 = 0.0014881;
        uni_logger_api();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          sub_24B6F014C(v41, v42, v43, v44, v45, v46, v47, v48);

      }
      if (sub_24B6D2098((uint64_t)a4, 0x51Cu, 1u, &retstr->var8))
      {
        retstr->var8 = 0.2;
        uni_logger_api();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          sub_24B6F00E0();

      }
      if (sub_24B6D2098((uint64_t)a4, 0x51Du, 1u, &retstr->var9))
      {
        retstr->var9 = 0.0044643;
        uni_logger_api();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          sub_24B6F006C(v50, v51, v52, v53, v54, v55, v56, v57);

      }
      if (sub_24B6D2098((uint64_t)a4, 0x51Eu, 1u, &retstr->var10))
      {
        retstr->var10 = 0.1;
        uni_logger_api();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          sub_24B6F0000();

      }
      if (sub_24B6D2098((uint64_t)a4, 0x51Fu, 1u, &retstr->var11))
      {
        retstr->var11 = 1.5;
        uni_logger_api();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
          sub_24B6EFF94(v59, v60, v61, v62, v63, v64, v65, v66);

      }
      if (sub_24B6D2098((uint64_t)a4, 0x520u, 1u, &retstr->var12))
      {
        retstr->var12 = 0.6;
        uni_logger_api();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
          sub_24B6EFF28();

      }
      if (sub_24B6D2098((uint64_t)a4, 0x521u, 1u, &retstr->var13))
      {
        retstr->var13 = 0.0019841;
        uni_logger_api();
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          sub_24B6EFEB8(v68, v69, v70, v71, v72, v73, v74, v75);

      }
      if (sub_24B6D2098((uint64_t)a4, 0x524u, 1u, &retstr->var14))
      {
        retstr->var14 = 0.33;
        uni_logger_api();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          sub_24B6EFE44(v76, v77, v78, v79, v80, v81, v82, v83);

      }
      p_var15 = &retstr->var15;
      result = (hairnet_params *)sub_24B6D2098((uint64_t)a4, 0x525u, 1u, p_var15);
      if ((_DWORD)result)
      {
        *p_var15 = 1.5;
        uni_logger_api();
        v85 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
          sub_24B6EFDD8(v85, v86, v87, v88, v89, v90, v91, v92);

      }
    }
  }
  return result;
}

+ (void)getRenderingParametersFromAuxMetadata:(CGImageMetadata *)a3
{
  return 0;
}

+ (CGImageMetadata)replaceRenderingParameters:(CGImageMetadata *)a3 params:(FigDepthBlurEffectRenderingParametersV4 *)a4
{
  return 0;
}

+ (id)tuningParamsToDict:(void *)a3
{
  return 0;
}

+ (void)dictToTuningParams:(id)a3 majorVersion:(int)a4 minorVersion:(int)a5
{
  return 0;
}

+ (int)getMinorRenderingVersion:(void *)a3
{
  void *v4;
  const char *v5;

  v4 = (void *)objc_opt_class();
  if (objc_msgSend_hasValidHeader_(v4, v5, (uint64_t)a3))
    return *((_DWORD *)a3 + 3);
  else
    return -1;
}

+ (id)getRenderingParamsAsDictionary:(CGImageMetadata *)a3
{
  return 0;
}

+ (CGImageMetadata)replaceRenderingParameters:(CGImageMetadata *)a3 withDictionary:(id)a4
{
  return a3;
}

+ (id)minMaxForParam:(id)a3
{
  return 0;
}

@end
