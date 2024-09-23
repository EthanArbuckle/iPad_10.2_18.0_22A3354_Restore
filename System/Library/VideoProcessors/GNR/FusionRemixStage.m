@implementation FusionRemixStage

- (id)initBandFusion:(id)a3
{
  FusionRemixStage *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  uint64_t v10;
  int *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  FusionRemixUniforms *v16;
  FusionRemixUniforms *v17;
  FusionRemixUniforms *v18;
  FusionRemixUniforms *v19;
  FusionRemixUniforms *v20;
  FusionRemixUniforms *v21;
  FusionRemixUniforms *v22;
  FusionRemixUniforms *v23;
  FusionRemixUniforms *v24;
  FusionRemixUniforms *v25;
  FusionRemixUniforms *v26;
  FusionRemixUniforms *v27;
  FusionRemixUniforms *v28;
  FusionRemixUniforms *v29;
  FusionRemixUniforms *v30;
  FusionRemixUniforms *v31;
  FusionRemixUniforms *v32;
  FusionRemixUniforms *v33;
  FusionRemixUniforms *v34;
  FusionRemixUniforms *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  MTLTexture *placeHolderTex;
  void *v40;
  uint64_t v41;
  MTLTexture *ltcBinsTex;
  void *v43;
  uint64_t v44;
  MTLTexture *ltcGTCRatioTex;
  void *v46;
  uint64_t v47;
  MTLTexture *ltcGTCFinalTex;
  void *v54;
  uint64_t v55;
  MTLBuffer *blackSubBandHistogram;
  void *v57;
  uint64_t v58;
  MTLBuffer *blackWhiteStrengthCenter;
  void *v60;
  uint64_t v61;
  MTLBuffer *grayGhostCountBuffer;
  void *v63;
  uint64_t v64;
  MTLBuffer *flickerCountBuffer;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  uint64_t v72;
  id v73;
  MTLComputePipelineState *calculateBlackWhiteStrengthCenter;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  MTLComputePipelineState *ltmApply;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  MTLComputePipelineState *computeGrayGhostCount;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  MTLComputePipelineState *detectFlickerForHDR;
  void *v91;
  void *v92;
  void *v93;
  FusionRemixStage *v94;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  int v101;
  __int128 v102;
  objc_super v103;
  const __CFString *v104;
  _QWORD v105[2];

  v105[1] = *MEMORY[0x24BDAC8D0];
  v96 = a3;
  v103.receiver = self;
  v103.super_class = (Class)FusionRemixStage;
  v5 = -[FusionRemixStage init](&v103, sel_init);
  if (v5)
  {
    v104 = CFSTR("gnr.HDR.ToneMapSaturationFactor");
    v105[0] = &unk_24D670730;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v105, &v104, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    loadDefaultsWritesWithPrefix();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("gnr.HDR.ToneMapSaturationFactor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v5->_toneMapSaturationFactor = v9;

    objc_storeStrong((id *)&v5->_metal, a3);
    v10 = 0;
    v11 = &usedFusionShaders;
    do
    {
      v12 = *v11;
      v11 += 5;
      +[FusionRemixStageShared sharedInstance](FusionRemixStageShared, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "getShaders:fusionType:fp16:staticOIS:reduceOisGhosting:fusionAlignment:", v5->_metal, v12, (v10 & 0x7FFFFFFE) == 10, (0xB0uLL >> v10) & 1, (v10 & 0x7FFFFFFE) == 6, (0xAEAuLL >> v10) & 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        FigSignalErrorAt();
        v94 = 0;
        v15 = v96;
        goto LABEL_43;
      }

      ++v10;
    }
    while (v10 != 12);
    v15 = v96;
    v16 = -[FusionRemixUniforms initWithMetal:]([FusionRemixUniforms alloc], "initWithMetal:", v96);
    v17 = v5->_uniforms[0];
    v5->_uniforms[0] = v16;

    if (!v5->_uniforms[0])
      goto LABEL_34;
    v18 = -[FusionRemixUniforms initWithMetal:]([FusionRemixUniforms alloc], "initWithMetal:", v96);
    v19 = v5->_uniforms[1];
    v5->_uniforms[1] = v18;

    if (!v5->_uniforms[1])
      goto LABEL_34;
    v20 = -[FusionRemixUniforms initWithMetal:]([FusionRemixUniforms alloc], "initWithMetal:", v96);
    v21 = v5->_uniforms[2];
    v5->_uniforms[2] = v20;

    if (!v5->_uniforms[2])
      goto LABEL_34;
    v22 = -[FusionRemixUniforms initWithMetal:]([FusionRemixUniforms alloc], "initWithMetal:", v96);
    v23 = v5->_uniforms[3];
    v5->_uniforms[3] = v22;

    if (!v5->_uniforms[3])
      goto LABEL_34;
    v24 = -[FusionRemixUniforms initWithMetal:]([FusionRemixUniforms alloc], "initWithMetal:", v96);
    v25 = v5->_uniforms[4];
    v5->_uniforms[4] = v24;

    if (!v5->_uniforms[4])
      goto LABEL_34;
    v26 = -[FusionRemixUniforms initWithMetal:]([FusionRemixUniforms alloc], "initWithMetal:", v96);
    v27 = v5->_uniforms[5];
    v5->_uniforms[5] = v26;

    if (!v5->_uniforms[5])
      goto LABEL_34;
    v28 = -[FusionRemixUniforms initWithMetal:]([FusionRemixUniforms alloc], "initWithMetal:", v96);
    v29 = v5->_uniforms[6];
    v5->_uniforms[6] = v28;

    if (!v5->_uniforms[6])
      goto LABEL_34;
    v30 = -[FusionRemixUniforms initWithMetal:]([FusionRemixUniforms alloc], "initWithMetal:", v96);
    v31 = v5->_uniforms[7];
    v5->_uniforms[7] = v30;

    if (!v5->_uniforms[7])
      goto LABEL_34;
    v32 = -[FusionRemixUniforms initWithMetal:]([FusionRemixUniforms alloc], "initWithMetal:", v96);
    v33 = v5->_uniforms[8];
    v5->_uniforms[8] = v32;

    if (!v5->_uniforms[8])
      goto LABEL_34;
    v34 = -[FusionRemixUniforms initWithMetal:]([FusionRemixUniforms alloc], "initWithMetal:", v96);
    v35 = v5->_uniforms[9];
    v5->_uniforms[9] = v34;

    if (v5->_uniforms[9])
    {
      objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 10, 1, 1, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v36;
      if (!v36)
        goto LABEL_35;
      objc_msgSend(v36, "setUsage:", 1);
      -[FigMetalContext device](v5->_metal, "device");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "newTextureWithDescriptor:", v14);
      placeHolderTex = v5->_placeHolderTex;
      v5->_placeHolderTex = (MTLTexture *)v38;

      if (!v5->_placeHolderTex)
        goto LABEL_35;
      objc_msgSend(v14, "setTextureType:", 7);
      objc_msgSend(v14, "setWidth:", 33);
      objc_msgSend(v14, "setHeight:", 8);
      objc_msgSend(v14, "setDepth:", 6);
      objc_msgSend(v14, "setPixelFormat:", 20);
      objc_msgSend(v14, "setUsage:", 1);
      -[FigMetalContext device](v5->_metal, "device");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "newTextureWithDescriptor:", v14);
      ltcBinsTex = v5->_ltcBinsTex;
      v5->_ltcBinsTex = (MTLTexture *)v41;

      objc_msgSend(v14, "setTextureType:", 0);
      objc_msgSend(v14, "setWidth:", 257);
      objc_msgSend(v14, "setHeight:", 1);
      objc_msgSend(v14, "setDepth:", 1);
      objc_msgSend(v14, "setPixelFormat:", 20);
      objc_msgSend(v14, "setUsage:", 1);
      -[FigMetalContext device](v5->_metal, "device");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "newTextureWithDescriptor:", v14);
      ltcGTCRatioTex = v5->_ltcGTCRatioTex;
      v5->_ltcGTCRatioTex = (MTLTexture *)v44;

      objc_msgSend(v14, "setTextureType:", 0);
      objc_msgSend(v14, "setWidth:", 257);
      objc_msgSend(v14, "setHeight:", 1);
      objc_msgSend(v14, "setDepth:", 1);
      objc_msgSend(v14, "setPixelFormat:", 20);
      objc_msgSend(v14, "setUsage:", 1);
      -[FigMetalContext device](v5->_metal, "device");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "newTextureWithDescriptor:", v14);
      ltcGTCFinalTex = v5->_ltcGTCFinalTex;
      v5->_ltcGTCFinalTex = (MTLTexture *)v47;

      *(_WORD *)&v5->_isOISDenoiseParamsSet = 0;
      v5->_ROI.origin = 0u;
      __asm { FMOV            V0.2D, #1.0 }
      v5->_ROI.size = _Q0;
      objc_msgSend(v96, "device");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "newBufferWithLength:options:", 1024, 0);
      blackSubBandHistogram = v5->_blackSubBandHistogram;
      v5->_blackSubBandHistogram = (MTLBuffer *)v55;

      if (v5->_blackSubBandHistogram)
      {
        objc_msgSend(v96, "device");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v102 = xmmword_216F95F40;
        v58 = objc_msgSend(v57, "newBufferWithBytes:length:options:", &v102, 16, 0);
        blackWhiteStrengthCenter = v5->_blackWhiteStrengthCenter;
        v5->_blackWhiteStrengthCenter = (MTLBuffer *)v58;

        if (v5->_blackWhiteStrengthCenter)
        {
          -[FigMetalContext device](v5->_metal, "device");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "newBufferWithLength:options:", 4, 0);
          grayGhostCountBuffer = v5->_grayGhostCountBuffer;
          v5->_grayGhostCountBuffer = (MTLBuffer *)v61;

          if (v5->_grayGhostCountBuffer)
          {
            -[FigMetalContext device](v5->_metal, "device");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = objc_msgSend(v63, "newBufferWithLength:options:", 4, 0);
            flickerCountBuffer = v5->_flickerCountBuffer;
            v5->_flickerCountBuffer = (MTLBuffer *)v64;

            if (v5->_flickerCountBuffer)
            {
              v66 = (void *)objc_opt_new();
              v67 = v66;
              if (v66)
              {
                v101 = 256;
                objc_msgSend(v66, "setConstantValue:type:atIndex:", &v101, 29, 1);
                objc_msgSend(v96, "library");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v100 = 0;
                v69 = (void *)objc_msgSend(v68, "newFunctionWithName:constantValues:error:", CFSTR("calculateBlackWhiteStrengthCenter"), v67, &v100);
                v70 = v100;

                if (v69)
                {
                  objc_msgSend(v96, "device");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  v99 = v70;
                  v72 = objc_msgSend(v71, "newComputePipelineStateWithFunction:error:", v69, &v99);
                  v73 = v99;

                  calculateBlackWhiteStrengthCenter = v5->_calculateBlackWhiteStrengthCenter;
                  v5->_calculateBlackWhiteStrengthCenter = (MTLComputePipelineState *)v72;

                  if (!v5->_calculateBlackWhiteStrengthCenter)
                  {
                    fig_log_get_emitter();
                    FigDebugAssert3();
                    FigSignalErrorAt();

                    goto LABEL_31;
                  }
                  objc_msgSend(v96, "library");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                  v98 = v73;
                  v76 = (void *)objc_msgSend(v75, "newFunctionWithName:constantValues:error:", CFSTR("LTM"), v67, &v98);
                  v70 = v98;

                  if (v76)
                  {
                    objc_msgSend(v96, "device");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    v97 = v70;
                    v78 = objc_msgSend(v77, "newComputePipelineStateWithFunction:error:", v76, &v97);
                    v79 = v97;

                    ltmApply = v5->_ltmApply;
                    v5->_ltmApply = (MTLComputePipelineState *)v78;

                    if (v5->_ltmApply)
                    {
                      objc_msgSend(v96, "library");
                      v81 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = (void *)objc_msgSend(v81, "newFunctionWithName:", CFSTR("computeGrayGhostCount"));

                      if (!v82)
                        goto LABEL_47;
                      -[FigMetalContext device](v5->_metal, "device");
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      v84 = objc_msgSend(v83, "newComputePipelineStateWithFunction:error:", v82, 0);
                      computeGrayGhostCount = v5->_computeGrayGhostCount;
                      v5->_computeGrayGhostCount = (MTLComputePipelineState *)v84;

                      if (v5->_computeGrayGhostCount)
                      {
                        objc_msgSend(v96, "library");
                        v86 = (void *)objc_claimAutoreleasedReturnValue();
                        v87 = (void *)objc_msgSend(v86, "newFunctionWithName:", CFSTR("detectFlickerForHDR"));

                        if (v87)
                        {
                          -[FigMetalContext device](v5->_metal, "device");
                          v88 = (void *)objc_claimAutoreleasedReturnValue();
                          v89 = objc_msgSend(v88, "newComputePipelineStateWithFunction:error:", v87, 0);
                          detectFlickerForHDR = v5->_detectFlickerForHDR;
                          v5->_detectFlickerForHDR = (MTLComputePipelineState *)v89;

                          if (v5->_detectFlickerForHDR)
                          {
                            -[FigMetalContext commandQueue](v5->_metal, "commandQueue");
                            v91 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v91, "commandBuffer");
                            v92 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v92, "blitCommandEncoder");
                            v93 = (void *)objc_claimAutoreleasedReturnValue();

                            objc_msgSend(v93, "fillBuffer:range:value:", v5->_blackSubBandHistogram, 0, -[MTLBuffer length](v5->_blackSubBandHistogram, "length"), 0);
                            objc_msgSend(v93, "endEncoding");
                            -[FigMetalContext prewarmInternalMetalShadersForFormatsList:](v5->_metal, "prewarmInternalMetalShadersForFormatsList:", &unk_24D670718);

                            v94 = v5;
                            goto LABEL_43;
                          }
                          fig_log_get_emitter();
                          FigDebugAssert3();
                          FigSignalErrorAt();

                          goto LABEL_31;
                        }
LABEL_47:
                        fig_log_get_emitter();
                        FigDebugAssert3();
                        FigSignalErrorAt();

                      }
                      else
                      {
                        fig_log_get_emitter();
                        FigDebugAssert3();
                        FigSignalErrorAt();

                      }
                    }
                    else
                    {
                      fig_log_get_emitter();
                      FigDebugAssert3();
                      FigSignalErrorAt();

                    }
LABEL_31:
                    v94 = 0;
                    goto LABEL_43;
                  }
                  fig_log_get_emitter();
                }
                else
                {
                  fig_log_get_emitter();
                }
                FigDebugAssert3();
                FigSignalErrorAt();

                goto LABEL_31;
              }
              fig_log_get_emitter();
              FigDebugAssert3();
              FigSignalErrorAt();

              goto LABEL_31;
            }
          }
        }
        fig_log_get_emitter();
      }
      else
      {
LABEL_35:
        fig_log_get_emitter();
      }
      FigDebugAssert3();
      FigSignalErrorAt();
      v94 = 0;
    }
    else
    {
LABEL_34:
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      v14 = 0;
      v94 = 0;
    }
  }
  else
  {
    v14 = 0;
    v94 = 0;
    v15 = v96;
  }
LABEL_43:

  return v94;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sidecarWriter);
  objc_storeStrong((id *)&self->_placeHolderTex, 0);
  objc_storeStrong((id *)&self->_simMapTex, 0);
  objc_storeStrong((id *)&self->_ltcGTCFinalTex, 0);
  objc_storeStrong((id *)&self->_ltcGTCRatioTex, 0);
  objc_storeStrong((id *)&self->_ltcBinsTex, 0);
  objc_storeStrong((id *)&self->_ltmApply, 0);
  objc_storeStrong((id *)&self->_blackSubRenderPipeline, 0);
  objc_storeStrong((id *)&self->_blackWhiteStrengthCenter, 0);
  objc_storeStrong((id *)&self->_calculateBlackWhiteStrengthCenter, 0);
  objc_storeStrong((id *)&self->_blackSubBandHistogram, 0);
  objc_storeStrong((id *)&self->_flickerCountBuffer, 0);
  objc_storeStrong((id *)&self->_detectFlickerForHDR, 0);
  objc_storeStrong((id *)&self->_grayGhostCountBuffer, 0);
  objc_storeStrong((id *)&self->_computeGrayGhostCount, 0);
  objc_storeStrong((id *)&self->_uniforms[9], 0);
  objc_storeStrong((id *)&self->_uniforms[8], 0);
  objc_storeStrong((id *)&self->_uniforms[7], 0);
  objc_storeStrong((id *)&self->_uniforms[6], 0);
  objc_storeStrong((id *)&self->_uniforms[5], 0);
  objc_storeStrong((id *)&self->_uniforms[4], 0);
  objc_storeStrong((id *)&self->_uniforms[3], 0);
  objc_storeStrong((id *)&self->_uniforms[2], 0);
  objc_storeStrong((id *)&self->_uniforms[1], 0);
  objc_storeStrong((id *)self->_uniforms, 0);
  objc_storeStrong((id *)&self->_metal, 0);
}

- (void)setSidecarWriter:(id)a3
{
  objc_storeWeak((id *)&self->_sidecarWriter, a3);
}

+ (BOOL)isSupported
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE11A10], "metalDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsFamily:", 1003);

  return v3;
}

+ (id)getFragmentShader:(id)a3 bandIndex:(int)a4 isLuma:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;

  v5 = 32;
  if (a5)
    v5 = 24;
  v6 = 16;
  if (a5)
    v6 = 8;
  if (a4 == 3)
    v5 = v6;
  return *(id *)((char *)a3 + v5);
}

- (void)computeFusionParams:(id)a3 exposures:(exposureParameters *)a4 config:(FusionConfiguration *)a5
{
  id v7;
  uint64_t v8;
  exposureParameters *v9;
  uint64_t v10;
  float v11;
  float gain;
  float *v13;
  void *v14;
  int fusionAlgo;
  uint64_t v16;
  FusionRemixStage *v17;
  int v18;
  float v19;
  BOOL v20;
  float toneMapSaturationFactor;
  _DWORD *v22;
  int v23;
  char *v24;
  int v25;
  int v26;
  int v27;
  int32x2_t v28;
  uint64_t v29;
  int v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  float *p_gain;
  float RelativeBrightness;
  float *v45;
  exposureParameters *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _OWORD v54[2];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _OWORD v58[6];
  int v59;
  float v60;
  float v61;

  v7 = a3;
  v8 = 0;
  v59 = 0;
  memset(v58, 0, sizeof(v58));
  v56 = 0u;
  v57 = 0u;
  v55 = 0u;
  memset(v54, 0, sizeof(v54));
  v46 = a4;
  v9 = &a4[a5[6].ev0];
  v10 = *((_QWORD *)v7 + 3);
  v11 = 0.0;
  if (*(_BYTE *)(v10 + 67))
    v11 = 1.0;
  gain = v9->gain;
  v60 = (float)((float)a5[6].longest + -1.0) + *(float *)(v10 + 60);
  v61 = v11;
  LODWORD(v55) = *(_DWORD *)(v10 + 48);
  v13 = (float *)v58 + 1;
  do
  {
    objc_msgSend(*(id *)(*((_QWORD *)v7 + 3) + 72), "objectAtIndexedSubscript:", v8, v46);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(v13 - 12) = interpolate_with_gain((uint64_t)v14 + 8, gain);
    *(v13 - 8) = interpolate_with_gain((uint64_t)v14 + 24, gain);
    *(v13 - 4) = interpolate_with_gain((uint64_t)v14 + 40, gain);
    *v13 = interpolate_with_gain((uint64_t)v14 + 56, gain);
    v13[4] = interpolate_with_gain((uint64_t)v14 + 72, gain);
    *(v13 - 21) = interpolate_with_gain((uint64_t)v14 + 88, gain);
    *(v13 - 17) = interpolate_with_gain((uint64_t)v14 + 104, gain);
    fusionAlgo = a5->fusionAlgo;
    if ((a5->fusionAlgo & 0xFFFFFFFE) == 2)
    {
      v13[8] = interpolate_with_gain((uint64_t)v14 + 120, gain);
      v13[12] = interpolate_with_gain((uint64_t)v14 + 136, gain);
      v13[16] = interpolate_with_gain((uint64_t)v14 + 152, gain);
      fusionAlgo = a5->fusionAlgo;
    }
    if (fusionAlgo == 2 && *(_BYTE *)(*((_QWORD *)v7 + 3) + 64))
      v13[20] = interpolate_with_gain((uint64_t)v14 + 168, gain);

    ++v8;
    ++v13;
  }
  while (v8 != 4);
  v16 = 0;
  v17 = self;
  v18 = v55;
  v19 = v60;
  v20 = v61 != 0.0;
  do
  {
    v22 = (_DWORD *)v54 + v16;
    v23 = v22[13];
    v24 = (char *)self->_arrayOfinputParams + 736 * v16;
    *((_DWORD *)v24 + 159) = v23;
    *((_DWORD *)v24 + 67) = v23;
    *((_DWORD *)v24 + 157) = *v22;
    *((_DWORD *)v24 + 65) = v22[4];
    v25 = v22[17];
    *((_DWORD *)v24 + 162) = v25;
    *((_DWORD *)v24 + 70) = v25;
    v26 = v22[9];
    *((_DWORD *)v24 + 158) = v26;
    *((_DWORD *)v24 + 66) = v26;
    *((_DWORD *)v24 + 160) = v18;
    *((_DWORD *)v24 + 68) = v18;
    *((_DWORD *)v24 + 72) = v22[25];
    *((_DWORD *)v24 + 164) = v22[21];
    v27 = v22[29];
    *((_DWORD *)v24 + 161) = v27;
    *((_DWORD *)v24 + 69) = v27;
    *((_DWORD *)v24 + 71) = v22[37];
    *((_DWORD *)v24 + 163) = v22[33];
    *((_DWORD *)v24 + 179) = v22[41];
    *((float *)v24 + 180) = v19;
    *((float *)v24 + 88) = v19;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    computeNoiseModel((uint64_t)&v48, *((void **)v7 + 1), &v9->gain, v16, 0, 0);
    v28 = vrev64_s32(*(int32x2_t *)&v49);
    *(int32x2_t *)(v24 + 252) = v28;
    *(int32x2_t *)(v24 + 620) = v28;
    v29 = v48;
    *((_DWORD *)v24 + 152) = v48;
    v30 = DWORD2(v48);
    *((_DWORD *)v24 + 61) = HIDWORD(v29);
    *((_DWORD *)v24 + 62) = v30;
    *((_DWORD *)v24 + 154) = v30;
    *((_DWORD *)v24 + 60) = v29;
    *((_DWORD *)v24 + 153) = HIDWORD(v29);
    v31 = *(_OWORD *)&a5[1].fusionAlgo;
    v32 = *(_OWORD *)&a5->fusionAlgo;
    *((_OWORD *)v24 + 1) = *(_OWORD *)&a5->longest;
    *((_OWORD *)v24 + 2) = v31;
    *(_OWORD *)v24 = v32;
    v33 = *(_OWORD *)&a5[2].longest;
    v34 = *(_OWORD *)&a5[3].fusionAlgo;
    v35 = *(_OWORD *)&a5[2].fusionAlgo;
    *((_OWORD *)v24 + 3) = *(_OWORD *)&a5[1].longest;
    *((_OWORD *)v24 + 4) = v35;
    *((_OWORD *)v24 + 5) = v33;
    *((_OWORD *)v24 + 6) = v34;
    v36 = *(_OWORD *)&a5[4].longest;
    v37 = *(_OWORD *)&a5[5].fusionAlgo;
    v38 = *(_OWORD *)&a5[4].fusionAlgo;
    *((_OWORD *)v24 + 7) = *(_OWORD *)&a5[3].longest;
    *((_OWORD *)v24 + 8) = v38;
    *((_OWORD *)v24 + 9) = v36;
    *((_OWORD *)v24 + 10) = v37;
    v39 = *(_OWORD *)&a5[6].longest;
    v40 = *(_OWORD *)&a5[7].fusionAlgo;
    v41 = *(_OWORD *)&a5[6].fusionAlgo;
    *((_OWORD *)v24 + 11) = *(_OWORD *)&a5[5].longest;
    *((_OWORD *)v24 + 12) = v41;
    *((_OWORD *)v24 + 13) = v39;
    *((_OWORD *)v24 + 14) = v40;
    memmove(v24 + 368, a5, 0xF0uLL);
    if (a5[6].longest >= 1)
    {
      v42 = 0;
      p_gain = &v46->gain;
      do
      {
        RelativeBrightness = getRelativeBrightness(&v9->gain, p_gain);
        v45 = (float *)((char *)v17 + 4 * v42);
        v45[77] = RelativeBrightness;
        v45[169] = RelativeBrightness;
        ++v42;
        p_gain += 10;
      }
      while (v42 < a5[6].longest);
    }
    toneMapSaturationFactor = self->_toneMapSaturationFactor;
    *((float *)v24 + 86) = toneMapSaturationFactor;
    *((float *)v24 + 178) = toneMapSaturationFactor;
    v24[724] = v20;
    ++v16;
    v17 = (FusionRemixStage *)((char *)v17 + 736);
  }
  while (v16 != 4);

}

- (int)detectFlickerForHDR:(id)a3 config:(FusionConfiguration *)a4 exposures:(exposureParameters *)a5 tuningParams:(id)a6 height:(int *)a7
{
  FigMetalContext *metal;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  int *v20;
  __int128 v21;
  exposureParameters *v22;
  exposureParameters *v23;
  uint64_t v24;
  float64x2_t v25;
  uint64_t v26;
  uint64_t v27;
  float64x2_t v28;
  uint64_t v29;
  uint64x2_t v30;
  uint64x2_t v31;
  int32x4_t v32;
  int32x4_t v33;
  CGFloat width;
  float64x2_t v36;
  CGFloat x;
  float64x2_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  int64x2_t v42;
  int32x4_t v43;
  float v44;
  _OWORD v45[4];

  metal = self->_metal;
  v12 = a3;
  -[FigMetalContext commandQueue](metal, "commandQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commandBuffer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setComputePipelineState:", self->_detectFlickerForHDR);
  v16 = *(void **)(v12[a4[7].fusionAlgo + 3] + 360);
  v17 = v12[a4[7].frameCount + 3];

  v18 = *(id *)(v17 + 360);
  v19 = v16;
  objc_msgSend(v15, "setTexture:atIndex:", v19, 0);
  objc_msgSend(v15, "setTexture:atIndex:", v18, 1);
  v20 = &a4->fusionAlgo + 12 * a4[7].frameCount;
  v21 = *((_OWORD *)v20 + 2);
  v45[0] = *((_OWORD *)v20 + 1);
  v45[1] = v21;
  v45[2] = *((_OWORD *)v20 + 3);
  objc_msgSend(v15, "setBytes:length:atIndex:", v45, 48, 0);
  v22 = &a5[a4[7].fusionAlgo];
  v23 = &a5[a4[7].frameCount];
  v44 = sqrtf((float)(v22->exposure_time * v22->gain) / (float)(v23->exposure_time * v23->gain));
  objc_msgSend(v15, "setBytes:length:atIndex:", &v44, 4, 1);
  x = self->_ROI.origin.x;
  v24 = objc_msgSend(v19, "width");
  v25.f64[0] = x;
  v25.f64[1] = self->_ROI.origin.y;
  v38 = v25;
  v26 = objc_msgSend(v19, "height");
  width = self->_ROI.size.width;
  v27 = objc_msgSend(v19, "width");
  v28.f64[0] = width;
  v28.f64[1] = self->_ROI.size.height;
  v36 = v28;
  v29 = objc_msgSend(v19, "height");
  v30.i64[0] = v27;
  v30.i64[1] = v29;
  v31.i64[0] = v24;
  v31.i64[1] = v26;
  v32 = (int32x4_t)vcvtq_s64_f64(vmulq_f64(v36, vcvtq_f64_u64(v30)));
  v33 = vuzp1q_s32((int32x4_t)vcvtq_s64_f64(vmulq_f64(v38, vcvtq_f64_u64(v31))), v32);
  HIDWORD(v38.f64[0]) = vmovn_s64(*(int64x2_t *)&v32).i32[1];
  *a7 = HIDWORD(v38.f64[0]);
  v43 = v33;
  objc_msgSend(v15, "setBytes:length:atIndex:", &v43, 16, 2);
  objc_msgSend(v15, "setBuffer:offset:atIndex:", self->_flickerCountBuffer, 0, 3);

  v40 = 1;
  v41 = SHIDWORD(v38.f64[0]);
  v42 = vdupq_n_s64(1uLL);
  v39 = xmmword_216F95F50;
  objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", &v41, &v39);
  objc_msgSend(v15, "endEncoding");
  objc_msgSend(v14, "commit");

  return 0;
}

- (int)computeGrayGhostCount:(id)a3 atBand:(int)a4 config:(FusionConfiguration *)a5 exposures:(exposureParameters *)a6 tuningParams:(id)a7 size:(int *)a8
{
  FigMetalContext *metal;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  int *v25;
  __int128 v26;
  double x;
  double y;
  uint64_t v29;
  float64x2_t v30;
  uint64_t v31;
  uint64x2_t v32;
  int64x2_t v33;
  int32x2_t v34;
  double v35;
  double v36;
  double height;
  unint64_t v38;
  _QWORD *v40;
  id v41;
  void *v42;
  CGFloat width;
  float64x2_t v46;
  int64x2_t v47;
  uint64_t v48;
  uint64x2_t v49;
  uint64_t v50;
  int32x4_t v51;
  uint64_t v52;
  float v53;
  _OWORD v54[4];

  metal = self->_metal;
  v40 = a7;
  v13 = a3;
  -[FigMetalContext commandQueue](metal, "commandQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "commandBuffer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "computeCommandEncoder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setComputePipelineState:", self->_computeGrayGhostCount);
  v16 = v13[a5[7].fusionAlgo + 3];
  v17 = 8 * a4;
  v18 = *(void **)(v16 + 336 + v17);
  v19 = *(void **)(v16 + 496 + v17);
  v20 = v13[a5[7].frameCount + 3];
  v21 = *(void **)(v20 + 336 + v17);

  v22 = *(id *)(v20 + 496 + v17);
  v23 = v21;
  v24 = v19;
  v41 = v18;
  objc_msgSend(v15, "setTexture:atIndex:", v41, 0);
  objc_msgSend(v15, "setTexture:atIndex:", v24, 1);
  objc_msgSend(v15, "setTexture:atIndex:", v23, 2);
  objc_msgSend(v15, "setTexture:atIndex:", v22, 3);
  v25 = &a5->fusionAlgo + 12 * a5[7].frameCount;
  v26 = *((_OWORD *)v25 + 2);
  v54[0] = *((_OWORD *)v25 + 1);
  v54[1] = v26;
  v54[2] = *((_OWORD *)v25 + 3);
  objc_msgSend(v15, "setBytes:length:atIndex:", v54, 48, 0);
  v53 = sqrtf(getRelativeBrightness(&a6[a5[7].fusionAlgo].gain, &a6[a5[7].frameCount].gain));
  objc_msgSend(v15, "setBytes:length:atIndex:", &v53, 4, 1);
  v52 = *(_QWORD *)(v40[3] + 16);
  objc_msgSend(v15, "setBytes:length:atIndex:", &v52, 8, 2);
  x = self->_ROI.origin.x;
  LODWORD(v18) = (int)(x * (double)(unint64_t)objc_msgSend(v22, "width"));
  y = self->_ROI.origin.y;
  LODWORD(v20) = (int)(y * (double)(unint64_t)objc_msgSend(v22, "height"));
  width = self->_ROI.size.width;
  v29 = objc_msgSend(v22, "width");
  v30.f64[0] = width;
  v30.f64[1] = self->_ROI.size.height;
  v46 = v30;
  v31 = objc_msgSend(v22, "height");
  v32.i64[0] = v29;
  v32.i64[1] = v31;
  v33 = vcvtq_s64_f64(vmulq_f64(v46, vcvtq_f64_u64(v32)));
  v34 = vmovn_s64(v33);
  v51 = vmovn_hight_s64((int32x2_t)__PAIR64__(v20, v18), v33);
  objc_msgSend(v15, "setBytes:length:atIndex:", &v51, 16, 3);
  objc_msgSend(v15, "setBuffer:offset:atIndex:", self->_grayGhostCountBuffer, 0, 4);
  v49 = vshrq_n_u64((uint64x2_t)vaddw_s32(vdupq_n_s64(7uLL), v34), 3uLL);
  v50 = 1;
  v47 = vdupq_n_s64(8uLL);
  v48 = 1;
  objc_msgSend(v15, "dispatchThreadgroups:threadsPerThreadgroup:", &v49, &v47);
  objc_msgSend(v15, "endEncoding");
  objc_msgSend(v42, "commit");
  v35 = self->_ROI.size.width;
  v36 = (double)(unint64_t)objc_msgSend(v23, "width");
  height = self->_ROI.size.height;
  v38 = objc_msgSend(v23, "height");

  *a8 = (int)(v35 * height * v36 * (double)v38);
  return 0;
}

- (int)runBandFusion:(int)a3 config:(FusionConfiguration *)a4 prevFusedTex:(id)a5 outputTex:(id)a6 bandFusionParams:(FusionRemixStageUniformsSBP *)a7 fragmentBufferIndex:(int)a8 processLuma:(BOOL)a9 processTopBand:(BOOL)a10 computeSpecialMap:(int)a11 hdrFusionMode:(int)a12 ambnrBuffers:(id)a13 simMapTex:(id)a14 toneMapTex:(id)a15 mismatchCoef:(float)a16 confidence:(id)a17 staticOIS:(BOOL)a18 reduceOisGhosting:(BOOL)a19
{
  uint64_t v24;
  id v26;
  id v27;
  id v28;
  _BOOL8 v29;
  void *v30;
  void *v31;
  void *v32;
  FusionRemixUniforms *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  FusionRemixStageUniformsVertex *ptr2VertBufSBP;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  FusionRemixStageUniformsInternal *ptr2FragBufInt;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  MTLTexture **p_placeHolderTex;
  uint64_t v59;
  int longest;
  MTLTexture **v61;
  void *v62;
  MTLTexture *v63;
  MTLTexture **v64;
  MTLTexture *v65;
  MTLTexture *v66;
  void **v67;
  void *v68;
  id *v69;
  id v70;
  id v71;
  void **v72;
  void *v73;
  id *v74;
  id v75;
  id v76;
  void **v77;
  void *v78;
  MTLTexture *v79;
  id v80;
  void *v81;
  _QWORD *v82;
  int fusionAlgo;
  void *v84;
  id v85;
  uint64_t v86;
  MTLTexture **v87;
  MTLTexture *v88;
  MTLTexture **v89;
  MTLTexture *v90;
  MTLTexture *v91;
  id *v92;
  id v93;
  id *v94;
  id v95;
  void **v96;
  void *v97;
  id *v98;
  id v99;
  id v100;
  id *v101;
  id v102;
  id *v103;
  id v104;
  void **v105;
  void *v106;
  id *v107;
  id v108;
  id v109;
  id *v110;
  id v111;
  id *v112;
  id v113;
  void **v114;
  void *v115;
  id *v116;
  id v117;
  id v118;
  id *v119;
  id v120;
  MTLTexture *v121;
  int v122;
  _QWORD *v124;
  void *v125;
  id v126;
  void *v127;
  id v128;
  id v129;
  _QWORD *v130;
  id v131;
  void *v132;
  _QWORD *v133;

  v24 = *(_QWORD *)&a3;
  v131 = a5;
  v26 = a6;
  v133 = a13;
  v27 = a14;
  v28 = a15;
  v130 = a17;
  objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v132 || a8 >= 10 || v24 >= 4)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v122 = FigSignalErrorAt();
    v82 = v130;
    v81 = v131;
    v62 = v133;
    goto LABEL_70;
  }
  v128 = v28;
  v129 = v27;
  v29 = objc_msgSend(v26, "pixelFormat") == 25 || objc_msgSend(v26, "pixelFormat") == 65;
  +[FusionRemixStageShared sharedInstance](FusionRemixStageShared, "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "getShaders:fusionType:fp16:staticOIS:reduceOisGhosting:fusionAlignment:", self->_metal, a4->fusionAlgo, v29, a18, a19, LOBYTE(a7[1].adaptiveBlur));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v122 = FigSignalErrorAt();
LABEL_74:
    v81 = v131;
LABEL_76:
    v62 = v133;
    v28 = v128;
    v27 = v129;
    v82 = v130;
    goto LABEL_70;
  }
  +[FusionRemixStage getFragmentShader:bandIndex:isLuma:](FusionRemixStage, "getFragmentShader:bandIndex:isLuma:", v31, v24, a9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = self->_uniforms[a8];
  if (!v26)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v122 = FigSignalErrorAt();

    goto LABEL_74;
  }
  v124 = v32;
  v125 = v31;
  v34 = v26;
  objc_msgSend(v132, "colorAttachments");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTexture:", v26);

  objc_msgSend(v132, "colorAttachments");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setLoadAction:", 0);

  memcpy(v33->_ptr2FragBufSBP, a7, 0x170uLL);
  *(float *)&self->_anon_1060[196] = (float)(unint64_t)objc_msgSend(v26, "width");
  v126 = v26;
  *(float *)&self->_anon_1060[200] = (float)(unint64_t)objc_msgSend(v26, "height");
  *(_DWORD *)&self->_anon_1060[204] = v24;
  ptr2VertBufSBP = v33->_ptr2VertBufSBP;
  v40 = *(_OWORD *)&self->_vertexUniforms.config.fusionAlgo;
  v41 = *(_OWORD *)&self->_vertexUniforms.config.longest;
  v42 = *(_OWORD *)self->_anon_1060;
  *(_OWORD *)&ptr2VertBufSBP->hdrFusionMode = *(_OWORD *)&self->_vertexUniforms.hdrFusionMode;
  *(_OWORD *)&ptr2VertBufSBP[1].config.fusionAlgo = v42;
  *(_OWORD *)&ptr2VertBufSBP->config.longest = v41;
  v43 = *(_OWORD *)&self->_anon_1060[16];
  v44 = *(_OWORD *)&self->_anon_1060[32];
  v45 = *(_OWORD *)&self->_anon_1060[64];
  *(_OWORD *)&ptr2VertBufSBP[2].config.fusionAlgo = *(_OWORD *)&self->_anon_1060[48];
  *(_OWORD *)&ptr2VertBufSBP[2].config.longest = v45;
  *(_OWORD *)&ptr2VertBufSBP[1].config.longest = v43;
  *(_OWORD *)&ptr2VertBufSBP[1].hdrFusionMode = v44;
  v46 = *(_OWORD *)&self->_anon_1060[80];
  v47 = *(_OWORD *)&self->_anon_1060[96];
  v48 = *(_OWORD *)&self->_anon_1060[128];
  *(_OWORD *)&ptr2VertBufSBP[3].config.longest = *(_OWORD *)&self->_anon_1060[112];
  *(_OWORD *)&ptr2VertBufSBP[3].hdrFusionMode = v48;
  *(_OWORD *)&ptr2VertBufSBP[2].hdrFusionMode = v46;
  *(_OWORD *)&ptr2VertBufSBP[3].config.fusionAlgo = v47;
  *(_OWORD *)&ptr2VertBufSBP->config.fusionAlgo = v40;
  v49 = *(_OWORD *)&self->_anon_1060[176];
  v50 = *(_OWORD *)&self->_anon_1060[160];
  v51 = *(_OWORD *)&self->_anon_1060[192];
  *(_OWORD *)&ptr2VertBufSBP[4].config.fusionAlgo = *(_OWORD *)&self->_anon_1060[144];
  *(_OWORD *)&ptr2VertBufSBP[4].config.longest = v50;
  *(_OWORD *)&ptr2VertBufSBP[4].hdrFusionMode = v49;
  *(_OWORD *)&ptr2VertBufSBP[5].config.fusionAlgo = v51;
  *(_OWORD *)&v33->_ptr2FragBufInt[2].var0 = *(_OWORD *)self->_dcValue;
  *(_OWORD *)&v33->_ptr2FragBufInt[4].var0 = *(_OWORD *)&self->_dcValue[16];
  *(_OWORD *)&v33->_ptr2FragBufInt[6].var0 = *(_OWORD *)&self->_dcValue[32];
  *(_OWORD *)&v33->_ptr2FragBufInt[8].var0 = *(_OWORD *)&self->_dcValue[48];
  ptr2FragBufInt = v33->_ptr2FragBufInt;
  ptr2FragBufInt->var1 = a16;
  ptr2FragBufInt[10].var0 = a11;
  LODWORD(ptr2FragBufInt[10].var1) = a12;
  ptr2FragBufInt->var0 = v24;
  LOBYTE(ptr2FragBufInt[11].var0) = a18;
  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commandBuffer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v54)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v122 = FigSignalErrorAt();

    v81 = v131;
    v26 = v34;
    goto LABEL_76;
  }
  objc_msgSend(v54, "renderCommandEncoderWithDescriptor:", v132);
  v55 = objc_claimAutoreleasedReturnValue();
  if (!v55)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v122 = FigSignalErrorAt();

    v82 = v130;
    v81 = v131;
    v26 = v34;
    v28 = v128;
    v27 = v129;
    v62 = v133;
    goto LABEL_70;
  }
  v56 = (void *)v55;
  v127 = v54;
  -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setVertexBuffer:offset:atIndex:", v57, 0, 0);

  objc_msgSend(v56, "setVertexBuffer:offset:atIndex:", v33->_vertexUniBufSBP, 0, 1);
  p_placeHolderTex = &self->_placeHolderTex;
  v59 = v24;
  longest = a4[6].longest;
  if (!a10)
  {
    v87 = &self->_placeHolderTex;
    if (longest > 0)
      v87 = (MTLTexture **)(v133[3] + 336 + 8 * v24);
    v88 = *v87;
    v89 = &self->_placeHolderTex;
    if (a4[6].longest >= 1)
      v89 = (MTLTexture **)(v133[3] + 496 + 8 * v24);
    v90 = *v89;
    v91 = v88;
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v91, 0);
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v90, 8);
    v92 = (id *)p_placeHolderTex;
    if (a4[6].longest >= 1)
      v92 = (id *)(v133[3] + 336 + 8 * v24 + 8);
    v93 = *v92;

    v94 = (id *)p_placeHolderTex;
    if (a4[6].longest >= 1)
      v94 = (id *)(v133[3] + 496 + 8 * v59 + 8);
    v95 = *v94;

    objc_msgSend(v56, "setFragmentTexture:atIndex:", v93, 4);
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v95, 12);

    v96 = (void **)p_placeHolderTex;
    if (a4[6].longest > 1)
      v96 = (void **)(v133[4] + 336 + 8 * v59);
    v97 = *v96;
    v98 = (id *)p_placeHolderTex;
    if (a4[6].longest >= 2)
      v98 = (id *)(v133[4] + 496 + 8 * v59);
    v99 = *v98;
    v100 = v97;
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v100, 1);
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v99, 9);
    v101 = (id *)p_placeHolderTex;
    if (a4[6].longest >= 2)
      v101 = (id *)(v133[4] + 336 + 8 * v59 + 8);
    v102 = *v101;

    v103 = (id *)p_placeHolderTex;
    if (a4[6].longest >= 2)
      v103 = (id *)(v133[4] + 496 + 8 * v59 + 8);
    v104 = *v103;

    objc_msgSend(v56, "setFragmentTexture:atIndex:", v102, 5);
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v104, 13);

    v105 = (void **)p_placeHolderTex;
    if (a4[6].longest > 2)
      v105 = (void **)(v133[5] + 336 + 8 * v59);
    v106 = *v105;
    v107 = (id *)p_placeHolderTex;
    if (a4[6].longest >= 3)
      v107 = (id *)(v133[5] + 496 + 8 * v59);
    v108 = *v107;
    v109 = v106;
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v109, 2);
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v108, 10);
    v110 = (id *)p_placeHolderTex;
    if (a4[6].longest >= 3)
      v110 = (id *)(v133[5] + 336 + 8 * v59 + 8);
    v111 = *v110;

    v112 = (id *)p_placeHolderTex;
    if (a4[6].longest >= 3)
      v112 = (id *)(v133[5] + 496 + 8 * v59 + 8);
    v113 = *v112;

    objc_msgSend(v56, "setFragmentTexture:atIndex:", v111, 6);
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v113, 14);

    v114 = (void **)p_placeHolderTex;
    if (a4[6].longest > 3)
      v114 = (void **)(v133[6] + 336 + 8 * v59);
    v115 = *v114;
    v116 = (id *)p_placeHolderTex;
    if (a4[6].longest >= 4)
      v116 = (id *)(v133[6] + 496 + 8 * v59);
    v117 = *v116;
    v118 = v115;
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v118, 3);
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v117, 11);
    v119 = (id *)p_placeHolderTex;
    if (a4[6].longest >= 4)
      v119 = (id *)(v133[6] + 336 + 8 * v59 + 8);
    v120 = *v119;

    v62 = v133;
    if (a4[6].longest >= 4)
      p_placeHolderTex = (MTLTexture **)(v133[6] + 496 + 8 * v59 + 8);
    v121 = *p_placeHolderTex;

    objc_msgSend(v56, "setFragmentTexture:atIndex:", v120, 7);
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v121, 15);

    v81 = v131;
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v131, 16);
    fusionAlgo = a4->fusionAlgo;
    v28 = v128;
    v27 = v129;
    v82 = v130;
    if (a4->fusionAlgo != 3)
      goto LABEL_29;
LABEL_65:
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v27, 17);
    v84 = v56;
    v85 = v28;
    v86 = 18;
    goto LABEL_66;
  }
  v61 = &self->_placeHolderTex;
  v62 = v133;
  if (longest >= 1)
    v61 = (MTLTexture **)(v133[3] + 336 + 8 * v24);
  v63 = *v61;
  v64 = &self->_placeHolderTex;
  if (a4[6].longest >= 1)
    v64 = (MTLTexture **)(v133[3] + 496 + 8 * v24);
  v65 = *v64;
  v66 = v63;
  objc_msgSend(v56, "setFragmentTexture:atIndex:", v66, 0);
  objc_msgSend(v56, "setFragmentTexture:atIndex:", v65, 4);

  v67 = (void **)p_placeHolderTex;
  if (a4[6].longest > 1)
    v67 = (void **)(v133[4] + 336 + 8 * v24);
  v68 = *v67;
  v69 = (id *)p_placeHolderTex;
  if (a4[6].longest >= 2)
    v69 = (id *)(v133[4] + 496 + 8 * v24);
  v70 = *v69;
  v71 = v68;
  objc_msgSend(v56, "setFragmentTexture:atIndex:", v71, 1);
  objc_msgSend(v56, "setFragmentTexture:atIndex:", v70, 5);

  v72 = (void **)p_placeHolderTex;
  if (a4[6].longest > 2)
    v72 = (void **)(v133[5] + 336 + 8 * v24);
  v73 = *v72;
  v74 = (id *)p_placeHolderTex;
  if (a4[6].longest >= 3)
    v74 = (id *)(v133[5] + 496 + 8 * v24);
  v75 = *v74;
  v76 = v73;
  objc_msgSend(v56, "setFragmentTexture:atIndex:", v76, 2);
  objc_msgSend(v56, "setFragmentTexture:atIndex:", v75, 6);

  v77 = (void **)p_placeHolderTex;
  if (a4[6].longest > 3)
    v77 = (void **)(v133[6] + 336 + 8 * v24);
  v78 = *v77;
  if (a4[6].longest >= 4)
    p_placeHolderTex = (MTLTexture **)(v133[6] + 496 + 8 * v24);
  v79 = *p_placeHolderTex;
  v80 = v78;
  objc_msgSend(v56, "setFragmentTexture:atIndex:", v80, 3);
  objc_msgSend(v56, "setFragmentTexture:atIndex:", v79, 7);

  v82 = v130;
  v81 = v131;
  fusionAlgo = a4->fusionAlgo;
  v28 = v128;
  v27 = v129;
  if (a4->fusionAlgo == 3)
    goto LABEL_65;
LABEL_29:
  if (fusionAlgo != 2 || !a19)
    goto LABEL_67;
  v84 = v56;
  v85 = v27;
  v86 = 17;
LABEL_66:
  objc_msgSend(v84, "setFragmentTexture:atIndex:", v85, v86);
LABEL_67:
  if (v82)
    objc_msgSend(v56, "setFragmentTexture:atIndex:", v82[v59 + 42], 19);
  objc_msgSend(v56, "setFragmentBuffer:offset:atIndex:", v33->_fragUniBufSBP, 0, 0);
  objc_msgSend(v56, "setFragmentBuffer:offset:atIndex:", v33->_fragUniBufInt, 0, 1);
  objc_msgSend(v56, "setRenderPipelineState:", v124[1]);
  objc_msgSend(v56, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
  objc_msgSend(v56, "endEncoding");
  objc_msgSend(v127, "commit");

  v122 = 0;
  v26 = v126;
LABEL_70:

  return v122;
}

- (int)computeMismatchCoef:(__CVBuffer *)a3 morphologyBuffer:(char *)a4 gain:(float)a5 mismatchCoef:(float *)a6 config:(FusionConfiguration *)a7
{
  int WidthOfPlane;
  int HeightOfPlane;
  size_t BytesPerRowOfPlane;
  char *BaseAddressOfPlane;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unsigned __int8 *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint8x8_t *v32;
  uint64_t v33;
  uint16x8_t v34;
  int32x4_t v35;
  int32x4_t v36;
  uint16x8_t v37;
  uint16x8_t v38;
  uint64_t v39;
  uint8x8_t *v40;
  uint8x8_t *v41;
  uint8x8_t *v42;
  int32x4_t v43;
  int32x4_t v44;
  uint64_t v45;
  uint8x8_t *v46;
  int32x4_t v47;
  int32x4_t v48;
  int32x4_t v49;
  int32x4_t v50;
  int32x4_t v51;
  int32x4_t v52;
  uint8x16_t v53;
  uint16x8_t v54;
  uint16x8_t v55;
  uint16x8_t v56;
  uint16x8_t v57;
  unsigned int v58;
  uint64_t v59;
  int32x4_t v60;
  int32x4_t v61;
  uint64_t v62;
  uint8x8_t *v63;
  uint8x8_t v64;
  uint16x8_t v65;
  char *v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  char *v70;
  unsigned int v71;
  uint8x8_t *v72;
  uint16x8_t v73;
  int32x4_t v74;
  int32x4_t v75;
  uint16x8_t v76;
  uint16x8_t v77;
  char *v78;
  uint64_t v79;
  int v80;
  float v81;
  float v82;
  float v89;
  float v90;
  double v91;
  float32x2_t v92;
  float v93;
  double v94;
  double v95;
  float v96;
  float *v98;
  FusionConfiguration *v99;
  vImage_Buffer dest;
  vImage_Buffer src;
  int16_t kernel[8];
  __int16 v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  if (CVPixelBufferLockBaseAddress(a3, 1uLL))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    *a6 = NAN;
    return -1;
  }
  v98 = a6;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  BytesPerRowOfPlane = (int)CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  v17 = BaseAddressOfPlane;
  v99 = a7;
  if (a7->fusionAlgo != 3)
  {
    if (a7->fusionAlgo == 2)
    {
      src.data = BaseAddressOfPlane;
      src.height = HeightOfPlane;
      src.width = WidthOfPlane;
      src.rowBytes = BytesPerRowOfPlane;
      dest.data = a4;
      dest.height = HeightOfPlane;
      dest.width = WidthOfPlane;
      dest.rowBytes = WidthOfPlane;
      if (vImageMax_Planar8(&src, &dest, 0, 0, 0, 3uLL, 3uLL, 0))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        FigSignalErrorAt();
      }
      src.data = a4;
      src.height = HeightOfPlane;
      src.width = WidthOfPlane;
      src.rowBytes = WidthOfPlane;
      dest.data = v17;
      dest.height = HeightOfPlane;
      dest.width = WidthOfPlane;
      dest.rowBytes = BytesPerRowOfPlane;
      if (vImageMin_Planar8(&src, &dest, 0, 0, 0, 3uLL, 3uLL, 0))
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        FigSignalErrorAt();
      }
    }
    goto LABEL_12;
  }
  v18 = HeightOfPlane;
  src.data = BaseAddressOfPlane;
  src.height = HeightOfPlane;
  src.width = WidthOfPlane;
  src.rowBytes = BytesPerRowOfPlane;
  dest.data = a4;
  dest.height = HeightOfPlane;
  dest.width = WidthOfPlane;
  dest.rowBytes = WidthOfPlane;
  *(_OWORD *)kernel = xmmword_216F960F8;
  v103 = 1;
  if (vImageConvolve_Planar8(&src, &dest, 0, 0, 0, kernel, 3u, 3u, 16, 0, 8u))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();
    if (HeightOfPlane < 1)
      goto LABEL_12;
  }
  else if (HeightOfPlane < 1)
  {
    goto LABEL_12;
  }
  v19 = v17;
  do
  {
    memcpy(v19, a4, WidthOfPlane);
    a4 += WidthOfPlane;
    v19 += BytesPerRowOfPlane;
    --v18;
  }
  while (v18);
LABEL_12:
  v20 = (int)(self->_ROI.size.width * (double)WidthOfPlane);
  v21 = (int)(self->_ROI.size.height * (double)HeightOfPlane);
  v22 = 0.0;
  if ((int)v21 >= 1 && (int)v20 >= 1)
  {
    v24 = (int)(self->_ROI.origin.y * (double)HeightOfPlane);
    v25 = (int)(self->_ROI.origin.x * (double)WidthOfPlane);
    v26 = (int)BytesPerRowOfPlane * (uint64_t)v24;
    if (v20 > 7)
    {
      v30 = &v17[v25 + (int)BytesPerRowOfPlane * (uint64_t)v24];
      v31 = v20 & 0xFFFFFFF8;
      if (v20 >= 0x20)
      {
        v39 = 0;
        v27 = 0;
        v40 = (uint8x8_t *)&v17[v26 + v25];
        v41 = v40 + 2;
        v42 = (uint8x8_t *)((char *)v40 + (v20 & 0xFFFFFFE0));
        do
        {
          v43 = 0uLL;
          v44 = (int32x4_t)v27;
          v45 = v20 & 0xFFFFFFE0;
          v46 = v41;
          v47 = 0uLL;
          v48 = 0uLL;
          v49 = 0uLL;
          v50 = 0uLL;
          v51 = 0uLL;
          v52 = 0uLL;
          do
          {
            v53 = *(uint8x16_t *)v46[-2].i8;
            v54 = vmovl_u8(*(uint8x8_t *)v53.i8);
            v55 = vmovl_high_u8(v53);
            v56 = vmovl_u8(*v46);
            v57 = vmovl_high_u8(*(uint8x16_t *)v46->i8);
            v48 = (int32x4_t)vaddw_high_u16((uint32x4_t)v48, v55);
            v47 = (int32x4_t)vaddw_u16((uint32x4_t)v47, *(uint16x4_t *)v55.i8);
            v43 = (int32x4_t)vaddw_high_u16((uint32x4_t)v43, v54);
            v44 = (int32x4_t)vaddw_u16((uint32x4_t)v44, *(uint16x4_t *)v54.i8);
            v52 = (int32x4_t)vaddw_high_u16((uint32x4_t)v52, v57);
            v51 = (int32x4_t)vaddw_u16((uint32x4_t)v51, *(uint16x4_t *)v57.i8);
            v50 = (int32x4_t)vaddw_high_u16((uint32x4_t)v50, v56);
            v49 = (int32x4_t)vaddw_u16((uint32x4_t)v49, *(uint16x4_t *)v56.i8);
            v46 += 4;
            v45 -= 32;
          }
          while (v45);
          v58 = vaddvq_s32(vaddq_s32(vaddq_s32(vaddq_s32(v49, v44), vaddq_s32(v51, v47)), vaddq_s32(vaddq_s32(v50, v43), vaddq_s32(v52, v48))));
          v27 = v58;
          if ((v20 & 0xFFFFFFE0) != v20)
          {
            v59 = v20 & 0xFFFFFFE0;
            if ((v20 & 0x18) == 0)
              goto LABEL_42;
            v60 = 0uLL;
            v61 = (int32x4_t)v58;
            v62 = v31 - (v20 & 0xFFFFFFE0);
            v63 = v42;
            do
            {
              v64 = *v63++;
              v65 = vmovl_u8(v64);
              v60 = (int32x4_t)vaddw_high_u16((uint32x4_t)v60, v65);
              v61 = (int32x4_t)vaddw_u16((uint32x4_t)v61, *(uint16x4_t *)v65.i8);
              v62 -= 8;
            }
            while (v62);
            v27 = vaddvq_s32(vaddq_s32(v61, v60));
            v59 = v20 & 0xFFFFFFF8;
            if (v20 != v31)
            {
LABEL_42:
              v66 = &v30[v59];
              v67 = v20 - v59;
              do
              {
                v68 = *v66++;
                v27 += v68;
                --v67;
              }
              while (v67);
            }
          }
          ++v39;
          v41 = (uint8x8_t *)((char *)v41 + BytesPerRowOfPlane);
          v42 = (uint8x8_t *)((char *)v42 + BytesPerRowOfPlane);
          v30 += BytesPerRowOfPlane;
        }
        while (v39 != v21);
      }
      else if (v20 == v31)
      {
        v27 = 0;
        v32 = (uint8x8_t *)&v17[v26 + 16 + v25];
        v33 = (int)(self->_ROI.size.height * (double)HeightOfPlane);
        do
        {
          v34 = vmovl_u8(v32[-2]);
          v35 = (int32x4_t)vmovl_high_u16(v34);
          v36 = (int32x4_t)vaddw_u16((uint32x4_t)v27, *(uint16x4_t *)v34.i8);
          if (v31 != 8)
          {
            v37 = vmovl_u8(v32[-1]);
            v35 = (int32x4_t)vaddw_high_u16((uint32x4_t)v35, v37);
            v36 = (int32x4_t)vaddw_u16((uint32x4_t)v36, *(uint16x4_t *)v37.i8);
            if (v31 != 16)
            {
              v38 = vmovl_u8(*v32);
              v35 = (int32x4_t)vaddw_high_u16((uint32x4_t)v35, v38);
              v36 = (int32x4_t)vaddw_u16((uint32x4_t)v36, *(uint16x4_t *)v38.i8);
            }
          }
          v27 = vaddvq_s32(vaddq_s32(v36, v35));
          v32 = (uint8x8_t *)((char *)v32 + BytesPerRowOfPlane);
          --v33;
        }
        while (v33);
      }
      else
      {
        v69 = 0;
        v27 = 0;
        v70 = &v17[v25 + v26 + v31];
        do
        {
          v71 = v27;
          v72 = (uint8x8_t *)&v30[BytesPerRowOfPlane * v69];
          v73 = vmovl_u8(*v72);
          v74 = (int32x4_t)vmovl_high_u16(v73);
          v75 = (int32x4_t)vaddw_u16((uint32x4_t)v71, *(uint16x4_t *)v73.i8);
          if (v31 != 8)
          {
            v76 = vmovl_u8(v72[1]);
            v74 = (int32x4_t)vaddw_high_u16((uint32x4_t)v74, v76);
            v75 = (int32x4_t)vaddw_u16((uint32x4_t)v75, *(uint16x4_t *)v76.i8);
            if (v31 != 16)
            {
              v77 = vmovl_u8(v72[2]);
              v74 = (int32x4_t)vaddw_high_u16((uint32x4_t)v74, v77);
              v75 = (int32x4_t)vaddw_u16((uint32x4_t)v75, *(uint16x4_t *)v77.i8);
            }
          }
          v27 = vaddvq_s32(vaddq_s32(v75, v74));
          v78 = v70;
          v79 = v20 - v31;
          do
          {
            v80 = *v78++;
            v27 += v80;
            --v79;
          }
          while (v79);
          ++v69;
          v70 += BytesPerRowOfPlane;
        }
        while (v69 != v21);
      }
    }
    else
    {
      v27 = 0;
      v28 = (unsigned __int8 *)&v17[v26 + 3 + v25];
      v29 = (int)(self->_ROI.size.height * (double)HeightOfPlane);
      do
      {
        v27 += *(v28 - 3);
        if ((_DWORD)v20 != 1)
        {
          v27 += *(v28 - 2);
          if ((_DWORD)v20 != 2)
          {
            v27 += *(v28 - 1);
            if ((_DWORD)v20 != 3)
            {
              v27 += *v28;
              if ((_DWORD)v20 != 4)
              {
                v27 += v28[1];
                if ((_DWORD)v20 != 5)
                {
                  v27 += v28[2];
                  if ((_DWORD)v20 != 6)
                    v27 += v28[3];
                }
              }
            }
          }
        }
        v28 += BytesPerRowOfPlane;
        --v29;
      }
      while (v29);
    }
    v22 = (double)(int)v27;
  }
  if (v99->fusionAlgo == 2)
  {
    v82 = fminf(fmaxf((float)(a5 * 0.1) + -1.0, 0.0), 1.0);
    __asm { FMOV            V3.2D, #1.0 }
    _Q1 = vcvtq_f64_f32(vcvt_f32_f64(vmlaq_n_f64(_Q3, (float64x2_t)xmmword_216F95F60, (float)((float)(v82 * v82) * (float)(3.0 - (float)(v82 + v82))))));
  }
  else
  {
    __asm { FMOV            V1.2D, #1.0 }
  }
  v89 = (float)(a5 * -0.1) + 2.0;
  if (a5 > 20.0)
    v89 = 0.0;
  if (a5 > 10.0)
    v90 = v89;
  else
    v90 = 1.0;
  v91 = (float)(1.0 - v90);
  v92 = vcvt_f32_f64(vdivq_f64((float64x2_t)xmmword_216F95F70, _Q1));
  v81 = v22 / ((double)(int)v20 * 255.0 * (double)(int)v21);
  v93 = fminf(fmaxf((float)(v81 - v92.f32[1]) / (float)(v92.f32[0] - v92.f32[1]), 0.0), 1.0);
  v94 = (float)((float)(v93 * v93) * (float)((float)(v93 + v93) + -3.0));
  v95 = 1.0;
  if (v99->fusionAlgo != 3)
    v95 = v91;
  v96 = v95 + v94 * v95;
  *v98 = v96;
  CVPixelBufferUnlockBaseAddress(a3, 1uLL);
  return 0;
}

- (int)estimateDCValues:(FusionConfiguration *)a3 ambnrBuffers:(id)a4
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  __IOSurface *v12;
  int v13;
  int v14;
  int v15;
  size_t v16;
  __IOSurface *v17;
  int v18;
  char *BaseAddressOfPlane;
  char *v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  double y;
  double width;
  uint64_t v27;
  double height;
  double v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  FusionConfiguration *v36;
  uint64_t v37;
  int8x16_t v38;
  int8x16_t v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v45;
  uint64_t v46;
  unsigned __int8 *v47;
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
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  int64x2_t v62;
  int64x2_t v63;
  int64x2_t v64;
  uint64_t v65;
  const char *v66;
  int64x2_t v67;
  int64x2_t v68;
  int64x2_t v69;
  int64x2_t v70;
  int64x2_t v71;
  int64x2_t v72;
  int64x2_t v73;
  int64x2_t v74;
  int64x2_t v75;
  int64x2_t v76;
  int64x2_t v77;
  int64x2_t v78;
  int64x2_t v79;
  uint32x4_t v80;
  uint32x4_t v81;
  uint32x4_t v82;
  uint32x4_t v83;
  uint32x4_t v84;
  uint32x4_t v85;
  uint32x4_t v86;
  int64x2_t v87;
  int64x2_t v88;
  int64x2_t v89;
  uint64_t v90;
  uint64_t v91;
  int64x2_t v92;
  int64x2_t v93;
  int64x2_t v94;
  int64x2_t v95;
  int64x2_t v96;
  const char *v97;
  uint32x4_t v98;
  uint32x4_t v99;
  uint32x4_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int8x16_t *v104;
  uint64_t v105;
  uint64_t v106;
  int64x2_t v107;
  int64x2_t v108;
  int64x2_t v109;
  uint64_t v110;
  int8x16_t *v111;
  int64x2_t v112;
  int64x2_t v113;
  int64x2_t v114;
  int64x2_t v115;
  int64x2_t v116;
  int64x2_t v117;
  int64x2_t v118;
  int64x2_t v119;
  int64x2_t v120;
  int64x2_t v121;
  int64x2_t v122;
  int8x16_t v123;
  int8x16_t v124;
  uint16x8_t v125;
  uint32x4_t v126;
  int8x16_t v127;
  int8x16_t v128;
  int64x2_t v129;
  int64x2_t v130;
  uint32x4_t v131;
  int64x2_t v132;
  uint16x8_t v133;
  uint32x4_t v134;
  int64x2_t v135;
  int64x2_t v136;
  int64x2_t v137;
  uint32x4_t v138;
  int64x2_t v139;
  int8x16_t v140;
  uint32x4_t v141;
  uint32x4_t v142;
  uint32x4_t v143;
  uint32x4_t v144;
  uint64_t v145;
  int64x2_t v146;
  int64x2_t v147;
  int64x2_t v148;
  int64x2_t v149;
  int64x2_t v150;
  int64x2_t v151;
  int64x2_t v152;
  int64x2_t v153;
  int8x8_t v154;
  uint16x8_t v155;
  uint32x4_t v156;
  int8x16_t v157;
  int8x16_t v158;
  int64x2_t v159;
  int64x2_t v160;
  uint32x4_t v161;
  int64x2_t v162;
  uint32x4_t v163;
  uint64_t v164;
  __int32 v165;
  __int32 v166;
  uint64_t v167;
  int v168;
  unsigned __int8 *dcValue;
  int BytesPerRowOfPlane;
  int v175;
  int v176;
  uint64_t v177;
  id v178;
  __IOSurface *buffer;
  int8x16x2_t v180;

  if (a3[6].longest < 1)
    return 0;
  v4 = 0;
  dcValue = self->_dcValue;
  while (2)
  {
    v5 = *(id *)(*((_QWORD *)a4 + v4 + 3) + 360);
    v6 = *(id *)(*((_QWORD *)a4 + v4 + 3) + 520);
    if (objc_msgSend(v5, "iosurface"))
    {
      buffer = (__IOSurface *)objc_msgSend(v5, "iosurface");
      if (!buffer)
        goto LABEL_101;
    }
    else
    {
      objc_msgSend(v5, "buffer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "iosurface");

      buffer = (__IOSurface *)v8;
      if (!v8)
        goto LABEL_101;
    }
    if (objc_msgSend(v6, "iosurface"))
    {
      v9 = objc_msgSend(v6, "iosurface");
      if (!v9)
        goto LABEL_101;
    }
    else
    {
      objc_msgSend(v6, "buffer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "iosurface");

      if (!v9)
      {
LABEL_101:
        fig_log_get_emitter();
        FigDebugAssert3();
        v168 = FigSignalErrorAt();
LABEL_105:

        return v168;
      }
    }
    v177 = v4;
    v11 = objc_msgSend(v5, "iosurfacePlane");
    v12 = (__IOSurface *)v9;
    v13 = objc_msgSend(v6, "iosurfacePlane");
    v14 = objc_msgSend(v5, "width");
    v15 = objc_msgSend(v5, "height");
    BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(buffer, v11);
    v176 = objc_msgSend(v6, "width");
    v178 = v6;
    v175 = objc_msgSend(v6, "height");
    v16 = v13;
    v17 = v12;
    v18 = IOSurfaceGetBytesPerRowOfPlane(v12, v16);
    if (IOSurfaceLock(buffer, 1u, 0))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
LABEL_104:
      fig_log_get_emitter();
      v168 = -1;
      FigDebugAssert3();
      v6 = v178;
      goto LABEL_105;
    }
    if (buffer != v17 && IOSurfaceLock(v17, 1u, 0))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      IOSurfaceUnlock(buffer, 1u, 0);
      goto LABEL_104;
    }
    BaseAddressOfPlane = (char *)IOSurfaceGetBaseAddressOfPlane(buffer, v11);
    v20 = (char *)IOSurfaceGetBaseAddressOfPlane(v17, v16);
    y = self->_ROI.origin.y;
    width = self->_ROI.size.width;
    v27 = (int)(width * (double)v14);
    height = self->_ROI.size.height;
    v29 = height * (double)v15;
    v30 = (int)v29;
    if ((int)v30 >= 1 && (int)v27 >= 1)
    {
      v46 = (int)(self->_ROI.origin.x * (double)v14) + (int)(y * (double)v15) * BytesPerRowOfPlane;
      v36 = a3;
      v37 = v177;
      v39 = (int8x16_t)xmmword_216F95FA0;
      v38 = (int8x16_t)xmmword_216F95F90;
      if (v27 < 8)
      {
        v33 = 0;
        v32 = 0;
        v47 = (unsigned __int8 *)&BaseAddressOfPlane[v46 + 3];
        v48 = (int)v29;
        v35 = v178;
        v34 = v5;
        do
        {
          if (*(v47 - 3) >= 0x81u)
          {
            v49 = 0;
          }
          else
          {
            ++v32;
            v49 = *(v47 - 3);
          }
          v33 += v49;
          if ((_DWORD)v27 != 1)
          {
            if (*(v47 - 2) >= 0x81u)
            {
              v50 = 0;
            }
            else
            {
              ++v32;
              v50 = *(v47 - 2);
            }
            v33 += v50;
            if ((_DWORD)v27 != 2)
            {
              if (*(v47 - 1) >= 0x81u)
              {
                v51 = 0;
              }
              else
              {
                ++v32;
                v51 = *(v47 - 1);
              }
              v33 += v51;
              if ((_DWORD)v27 != 3)
              {
                if (*v47 >= 0x81u)
                {
                  v52 = 0;
                }
                else
                {
                  ++v32;
                  v52 = *v47;
                }
                v33 += v52;
                if ((_DWORD)v27 != 4)
                {
                  if (v47[1] >= 0x81u)
                  {
                    v53 = 0;
                  }
                  else
                  {
                    ++v32;
                    v53 = v47[1];
                  }
                  v33 += v53;
                  if ((_DWORD)v27 != 5)
                  {
                    if (v47[2] >= 0x81u)
                    {
                      v54 = 0;
                    }
                    else
                    {
                      ++v32;
                      v54 = v47[2];
                    }
                    v33 += v54;
                    if ((_DWORD)v27 != 6)
                    {
                      if (v47[3] >= 0x81u)
                      {
                        v55 = 0;
                      }
                      else
                      {
                        ++v32;
                        v55 = v47[3];
                      }
                      v33 += v55;
                    }
                  }
                }
              }
            }
          }
          v47 += BytesPerRowOfPlane;
          --v48;
        }
        while (v48);
        goto LABEL_20;
      }
      v103 = 0;
      v33 = 0;
      v32 = 0;
      v104 = (int8x16_t *)&BaseAddressOfPlane[v46];
      v105 = v27 & 0xFFFFFFF8;
      v35 = v178;
      v34 = v5;
      while (1)
      {
        if (v27 >= 0x10)
        {
          v107 = 0uLL;
          v108 = (int64x2_t)(unint64_t)v33;
          v109 = (int64x2_t)(unint64_t)v32;
          v110 = v27 & 0xFFFFFFF0;
          v111 = v104;
          v112 = 0uLL;
          v113 = 0uLL;
          v114 = 0uLL;
          v22 = 0uLL;
          v115 = 0uLL;
          v23 = 0uLL;
          v116 = 0uLL;
          v117 = 0uLL;
          v118 = 0uLL;
          v119 = 0uLL;
          v120 = 0uLL;
          v121 = 0uLL;
          v122 = 0uLL;
          v21.i64[0] = 0x8181818181818181;
          v21.i64[1] = 0x8181818181818181;
          do
          {
            v123 = *v111++;
            v124 = (int8x16_t)vcgtq_u8((uint8x16_t)v21, (uint8x16_t)v123);
            v125 = vmovl_u8(*(uint8x8_t *)v124.i8);
            v126 = vmovl_u16(*(uint16x4_t *)v125.i8);
            v127.i64[0] = v126.u32[0];
            v127.i64[1] = v126.u32[1];
            v128 = (int8x16_t)vdupq_n_s64(1uLL);
            v129 = (int64x2_t)vandq_s8(v127, v128);
            v127.i64[0] = v126.u32[2];
            v127.i64[1] = v126.u32[3];
            v130 = (int64x2_t)vandq_s8(v127, v128);
            v131 = vmovl_high_u16(v125);
            v127.i64[0] = v131.u32[0];
            v127.i64[1] = v131.u32[1];
            v132 = (int64x2_t)vandq_s8(v127, v128);
            v133 = vmovl_high_u8((uint8x16_t)v124);
            v134 = vmovl_u16(*(uint16x4_t *)v133.i8);
            v127.i64[0] = v134.u32[0];
            v127.i64[1] = v134.u32[1];
            v135 = (int64x2_t)vandq_s8(v127, v128);
            v127.i64[0] = v131.u32[2];
            v127.i64[1] = v131.u32[3];
            v136 = (int64x2_t)vandq_s8(v127, v128);
            v127.i64[0] = v134.u32[2];
            v127.i64[1] = v134.u32[3];
            v137 = (int64x2_t)vandq_s8(v127, v128);
            v138 = vmovl_high_u16(v133);
            v127.i64[0] = v138.u32[0];
            v127.i64[1] = v138.u32[1];
            v139 = (int64x2_t)vandq_s8(v127, v128);
            v127.i64[0] = v138.u32[2];
            v127.i64[1] = v138.u32[3];
            v122 = vaddq_s64(v122, (int64x2_t)vandq_s8(v127, v128));
            v121 = vaddq_s64(v121, v139);
            v120 = vaddq_s64(v120, v137);
            v118 = vaddq_s64(v118, v136);
            v119 = vaddq_s64(v119, v135);
            v117 = vaddq_s64(v117, v132);
            v39 = (int8x16_t)xmmword_216F95FA0;
            v38 = (int8x16_t)xmmword_216F95F90;
            v116 = vaddq_s64(v116, v130);
            v109 = vaddq_s64(v109, v129);
            v140 = vandq_s8(v123, v124);
            v141 = (uint32x4_t)vqtbl1q_s8(v140, (int8x16_t)xmmword_216F95F80);
            v142 = (uint32x4_t)vqtbl1q_s8(v140, (int8x16_t)xmmword_216F95F90);
            v143 = (uint32x4_t)vqtbl1q_s8(v140, (int8x16_t)xmmword_216F95FA0);
            v144 = (uint32x4_t)vqtbl1q_s8(v140, (int8x16_t)xmmword_216F95FB0);
            v113 = (int64x2_t)vaddw_high_u32((uint64x2_t)v113, v142);
            v107 = (int64x2_t)vaddw_high_u32((uint64x2_t)v107, v143);
            v22 = (int64x2_t)vaddw_high_u32((uint64x2_t)v22, v141);
            v114 = (int64x2_t)vaddw_u32((uint64x2_t)v114, *(uint32x2_t *)v141.i8);
            v112 = (int64x2_t)vaddw_u32((uint64x2_t)v112, *(uint32x2_t *)v142.i8);
            v108 = (int64x2_t)vaddw_u32((uint64x2_t)v108, *(uint32x2_t *)v143.i8);
            v115 = (int64x2_t)vaddw_u32((uint64x2_t)v115, *(uint32x2_t *)v144.i8);
            v23 = (int64x2_t)vaddw_high_u32((uint64x2_t)v23, v144);
            v110 -= 16;
          }
          while (v110);
          v24 = vaddq_s64(vaddq_s64(vaddq_s64(v109, v119), vaddq_s64(v117, v121)), vaddq_s64(vaddq_s64(v116, v120), vaddq_s64(v118, v122)));
          v32 = vaddvq_s64(v24);
          v33 = vaddvq_s64(vaddq_s64(vaddq_s64(vaddq_s64(v108, v114), vaddq_s64(v112, v115)), vaddq_s64(vaddq_s64(v107, v22), vaddq_s64(v113, v23))));
          if ((v27 & 0xFFFFFFF0) == v27)
            goto LABEL_74;
          v106 = v27 & 0xFFFFFFF0;
          v145 = v106;
          if ((v27 & 8) == 0)
            goto LABEL_84;
        }
        else
        {
          v106 = 0;
        }
        v146 = (int64x2_t)(unint64_t)v33;
        v147 = (int64x2_t)(unint64_t)v32;
        v148 = 0uLL;
        v149 = 0uLL;
        v150 = 0uLL;
        v151 = 0uLL;
        v152 = 0uLL;
        v153 = 0uLL;
        do
        {
          v24.i64[0] = *(uint64_t *)((char *)v104->i64 + v106);
          v154 = (int8x8_t)vcgt_u8((uint8x8_t)0x8181818181818181, *(uint8x8_t *)v24.i8);
          v155 = vmovl_u8((uint8x8_t)v154);
          v156 = vmovl_u16(*(uint16x4_t *)v155.i8);
          v157.i64[0] = v156.u32[0];
          v157.i64[1] = v156.u32[1];
          v158 = (int8x16_t)vdupq_n_s64(1uLL);
          v159 = (int64x2_t)vandq_s8(v157, v158);
          v157.i64[0] = v156.u32[2];
          v157.i64[1] = v156.u32[3];
          v160 = (int64x2_t)vandq_s8(v157, v158);
          v161 = vmovl_high_u16(v155);
          v157.i64[0] = v161.u32[0];
          v157.i64[1] = v161.u32[1];
          v162 = (int64x2_t)vandq_s8(v157, v158);
          v157.i64[0] = v161.u32[2];
          v157.i64[1] = v161.u32[3];
          v153 = vaddq_s64(v153, (int64x2_t)vandq_s8(v157, v158));
          v152 = vaddq_s64(v152, v162);
          v151 = vaddq_s64(v151, v160);
          v147 = vaddq_s64(v147, v159);
          *(int8x8_t *)v24.i8 = vand_s8(*(int8x8_t *)v24.i8, v154);
          v163 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v24, v38);
          v24 = (int64x2_t)vqtbl1q_s8((int8x16_t)v24, v39);
          v150 = (int64x2_t)vaddw_high_u32((uint64x2_t)v150, v163);
          v148 = (int64x2_t)vaddw_high_u32((uint64x2_t)v148, (uint32x4_t)v24);
          v149 = (int64x2_t)vaddw_u32((uint64x2_t)v149, *(uint32x2_t *)v163.i8);
          v146 = (int64x2_t)vaddw_u32((uint64x2_t)v146, *(uint32x2_t *)v24.i8);
          v106 += 8;
        }
        while (v105 != v106);
        v23 = vaddq_s64(v151, v153);
        v22 = vaddq_s64(vaddq_s64(v147, v152), v23);
        v32 = vaddvq_s64(v22);
        v33 = vaddvq_s64(vaddq_s64(vaddq_s64(v146, v149), vaddq_s64(v148, v150)));
        v145 = v27 & 0xFFFFFFF8;
        if (v105 != v27)
        {
          do
          {
LABEL_84:
            if (v104->u8[v145] >= 0x81u)
            {
              v164 = 0;
            }
            else
            {
              ++v32;
              v164 = v104->u8[v145];
            }
            v33 += v164;
            ++v145;
          }
          while (v27 != v145);
        }
LABEL_74:
        ++v103;
        v104 = (int8x16_t *)((char *)v104 + BytesPerRowOfPlane);
        if (v103 == v30)
          goto LABEL_20;
      }
    }
    v32 = 0;
    v33 = 0;
    v35 = v178;
    v34 = v5;
    v36 = a3;
    v37 = v177;
    v39 = (int8x16_t)xmmword_216F95FA0;
    v38 = (int8x16_t)xmmword_216F95F90;
LABEL_20:
    v40 = (double)v32;
    v41 = (double)(int)v27 * 0.05 * (double)(int)v30;
    if (v41 >= (double)v32)
      goto LABEL_91;
    v42 = (int)(width * (double)v176);
    v43 = (int)(height * (double)v175);
    if ((int)v43 < 1 || (int)v42 < 1)
    {
      v58 = 0;
      v57 = 0;
      v45 = 0;
      goto LABEL_90;
    }
    v56 = 0;
    v57 = 0;
    v58 = 0;
    v59 = &v20[2 * (int)(self->_ROI.origin.x * (double)v176) + (int)(y * (double)v175) * v18];
    do
    {
      if (v42 < 8)
      {
        v60 = 0;
LABEL_70:
        v101 = 2 * v60;
        v102 = v42 - v60;
        do
        {
          v58 += v59[v101];
          v57 += v59[v101 + 1];
          v101 += 2;
          --v102;
        }
        while (v102);
        goto LABEL_58;
      }
      if (v42 >= 0x10)
      {
        v62 = 0uLL;
        v63 = (int64x2_t)(unint64_t)v57;
        v64 = (int64x2_t)(unint64_t)v58;
        v65 = v42 & 0xFFFFFFF0;
        v66 = v59;
        v67 = 0uLL;
        v68 = 0uLL;
        v69 = 0uLL;
        v70 = 0uLL;
        v71 = 0uLL;
        v72 = 0uLL;
        v73 = 0uLL;
        v74 = 0uLL;
        v75 = 0uLL;
        v76 = 0uLL;
        v77 = 0uLL;
        v78 = 0uLL;
        v79 = 0uLL;
        do
        {
          v180 = vld2q_s8(v66);
          v66 += 32;
          v80 = (uint32x4_t)vqtbl1q_s8(v180.val[0], (int8x16_t)xmmword_216F95F80);
          v81 = (uint32x4_t)vqtbl1q_s8(v180.val[0], v38);
          v82 = (uint32x4_t)vqtbl1q_s8(v180.val[0], v39);
          v83 = (uint32x4_t)vqtbl1q_s8(v180.val[0], (int8x16_t)xmmword_216F95FB0);
          v75 = (int64x2_t)vaddw_high_u32((uint64x2_t)v75, v81);
          v73 = (int64x2_t)vaddw_high_u32((uint64x2_t)v73, v82);
          v76 = (int64x2_t)vaddw_u32((uint64x2_t)v76, *(uint32x2_t *)v80.i8);
          v74 = (int64x2_t)vaddw_u32((uint64x2_t)v74, *(uint32x2_t *)v81.i8);
          v64 = (int64x2_t)vaddw_u32((uint64x2_t)v64, *(uint32x2_t *)v82.i8);
          v77 = (int64x2_t)vaddw_high_u32((uint64x2_t)v77, v80);
          v78 = (int64x2_t)vaddw_u32((uint64x2_t)v78, *(uint32x2_t *)v83.i8);
          v79 = (int64x2_t)vaddw_high_u32((uint64x2_t)v79, v83);
          v84 = (uint32x4_t)vqtbl1q_s8(v180.val[1], (int8x16_t)xmmword_216F95F80);
          v85 = (uint32x4_t)vqtbl1q_s8(v180.val[1], v38);
          v86 = (uint32x4_t)vqtbl1q_s8(v180.val[1], v39);
          v180.val[0] = vqtbl1q_s8(v180.val[1], (int8x16_t)xmmword_216F95FB0);
          v68 = (int64x2_t)vaddw_high_u32((uint64x2_t)v68, v85);
          v62 = (int64x2_t)vaddw_high_u32((uint64x2_t)v62, v86);
          v69 = (int64x2_t)vaddw_u32((uint64x2_t)v69, *(uint32x2_t *)v84.i8);
          v67 = (int64x2_t)vaddw_u32((uint64x2_t)v67, *(uint32x2_t *)v85.i8);
          v63 = (int64x2_t)vaddw_u32((uint64x2_t)v63, *(uint32x2_t *)v86.i8);
          v70 = (int64x2_t)vaddw_high_u32((uint64x2_t)v70, v84);
          v71 = (int64x2_t)vaddw_u32((uint64x2_t)v71, *(uint32x2_t *)v180.val[0].i8);
          v72 = (int64x2_t)vaddw_high_u32((uint64x2_t)v72, (uint32x4_t)v180.val[0]);
          v65 -= 16;
        }
        while (v65);
        v23 = vaddq_s64(vaddq_s64(v73, v77), vaddq_s64(v75, v79));
        v22 = vaddq_s64(vaddq_s64(vaddq_s64(v64, v76), vaddq_s64(v74, v78)), v23);
        v58 = vaddvq_s64(v22);
        v21 = vaddq_s64(vaddq_s64(vaddq_s64(v63, v69), vaddq_s64(v67, v71)), vaddq_s64(vaddq_s64(v62, v70), vaddq_s64(v68, v72)));
        v57 = vaddvq_s64(v21);
        if ((v42 & 0xFFFFFFF0) == v42)
          goto LABEL_58;
        v61 = v42 & 0xFFFFFFF0;
        v60 = v61;
        if ((v42 & 8) == 0)
          goto LABEL_70;
      }
      else
      {
        v61 = 0;
      }
      v87 = 0uLL;
      v88 = (int64x2_t)(unint64_t)v57;
      v89 = (int64x2_t)(unint64_t)v58;
      v90 = 2 * v61;
      v91 = v61 - (v42 & 0xFFFFFFF8);
      v92 = 0uLL;
      v93 = 0uLL;
      v94 = 0uLL;
      v95 = 0uLL;
      v96 = 0uLL;
      do
      {
        v97 = &v59[v90];
        v22 = (int64x2_t)vld2_s8(v97);
        v98 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v22, v38);
        v99 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v22, v39);
        v96 = (int64x2_t)vaddw_high_u32((uint64x2_t)v96, v98);
        v94 = (int64x2_t)vaddw_high_u32((uint64x2_t)v94, v99);
        v95 = (int64x2_t)vaddw_u32((uint64x2_t)v95, *(uint32x2_t *)v98.i8);
        v89 = (int64x2_t)vaddw_u32((uint64x2_t)v89, *(uint32x2_t *)v99.i8);
        v100 = (uint32x4_t)vqtbl1q_s8((int8x16_t)v23, v38);
        v22 = (int64x2_t)vqtbl1q_s8((int8x16_t)v23, v39);
        v93 = (int64x2_t)vaddw_high_u32((uint64x2_t)v93, v100);
        v87 = (int64x2_t)vaddw_high_u32((uint64x2_t)v87, (uint32x4_t)v22);
        v92 = (int64x2_t)vaddw_u32((uint64x2_t)v92, *(uint32x2_t *)v100.i8);
        v88 = (int64x2_t)vaddw_u32((uint64x2_t)v88, *(uint32x2_t *)v22.i8);
        v90 += 16;
        v91 += 8;
      }
      while (v91);
      v58 = vaddvq_s64(vaddq_s64(vaddq_s64(v89, v95), vaddq_s64(v94, v96)));
      v21 = vaddq_s64(vaddq_s64(v88, v92), vaddq_s64(v87, v93));
      v57 = vaddvq_s64(v21);
      v60 = v42 & 0xFFFFFFF8;
      if (v60 != v42)
        goto LABEL_70;
LABEL_58:
      ++v56;
      v59 += v18;
    }
    while (v56 != v43);
    v45 = v42 * (unint64_t)(v43 - 1) + 1 + (v42 - 1);
LABEL_90:
    *(float *)v21.i32 = (float)((float)v33 / (float)v32) * 0.00392156863;
    *(float *)&v165 = (float)((float)v58 / (float)v45) * 0.00392156863;
    *(float *)&v166 = (float)((float)v57 / (float)v45) * 0.00392156863;
    v21.i32[1] = v165;
    v21.i32[2] = v166;
    *(int64x2_t *)&dcValue[16 * v37] = v21;
LABEL_91:
    IOSurfaceUnlock(buffer, 1u, 0);
    if (buffer != v17)
      IOSurfaceUnlock(v17, 1u, 0);

    if (v41 < v40)
    {
      v4 = v37 + 1;
      if (v4 >= v36[6].longest)
        return 0;
      continue;
    }
    break;
  }
  if (v36[6].longest >= 1)
  {
    v167 = 0;
    do
      *(_OWORD *)&dcValue[16 * v167++] = xmmword_216F95FC0;
    while (v167 < v36[6].longest);
  }
  return 0;
}

- (void)setOISDenoiseConf:(AmbnrConfiguration *)a3
{
  memcpy(self->_oisDenoiseConf, a3, 0x440uLL);
  self->_isOISDenoiseParamsSet = 1;
}

- (void)setArrayOfInputParams:(FusionRemixStageUniformsSBP *)a3
{
  memcpy(self->_arrayOfinputParams, a3, 0xB80uLL);
  self->_isFusionParamsSet = 1;
}

- (void)setROI:(CGRect)a3
{
  self->_ROI = a3;
}

- (int)calculateBlackWhiteContrastCenter:(float)a3 contrastParam:
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  int64x2_t v9;
  uint64_t v10;
  int64x2_t v11;
  uint64_t v12;
  int v13;
  __int128 v14;

  v14 = *(_OWORD *)&a3;
  v13 = v3;
  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commandBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "computeCommandEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setComputePipelineState:", self->_calculateBlackWhiteStrengthCenter);
  objc_msgSend(v7, "setBuffer:offset:atIndex:", self->_blackSubBandHistogram, 0, 0);
  objc_msgSend(v7, "setBytes:length:atIndex:", &v14, 16, 1);
  objc_msgSend(v7, "setBytes:length:atIndex:", &v13, 4, 2);
  objc_msgSend(v7, "setBuffer:offset:atIndex:", self->_blackWhiteStrengthCenter, 0, 3);
  v11 = vdupq_n_s64(1uLL);
  v12 = 1;
  v9 = v11;
  v10 = 1;
  objc_msgSend(v7, "dispatchThreadgroups:threadsPerThreadgroup:", &v11, &v9);
  objc_msgSend(v7, "endEncoding");
  objc_msgSend(v6, "commit");

  return 0;
}

- (int)performBlackSubtractionWithBlackWhiteParams:(float)a3 maxContrastStrength:(id)a4 tmpTex:(id)a5 outputTex:
{
  int v5;
  int v7;
  id v9;
  id v10;
  void *v11;
  _QWORD *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  double v25;

  v7 = v5;
  v25 = *(double *)&a3;
  v9 = a4;
  v10 = a5;
  +[FusionRemixStageShared sharedInstance](FusionRemixStageShared, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "getShaders:fusionType:fp16:staticOIS:reduceOisGhosting:fusionAlignment:", self->_metal, 3, 1, 0, 0, 0);
  v12 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  LODWORD(v13) = v7;
  -[FusionRemixStage calculateBlackWhiteContrastCenter:contrastParam:](self, "calculateBlackWhiteContrastCenter:contrastParam:", v25, v13);
  objc_msgSend(MEMORY[0x24BDDD690], "renderPassDescriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    goto LABEL_6;
  objc_msgSend(v14, "colorAttachments");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTexture:", v10);

  -[FigMetalContext commandQueue](self->_metal, "commandQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "commandBuffer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "renderCommandEncoderWithDescriptor:", v15);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      -[FigMetalContext fullRangeVertexBuf](self->_metal, "fullRangeVertexBuf");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setVertexBuffer:offset:atIndex:", v22, 0, 0);

      objc_msgSend(v21, "setVertexBuffer:offset:atIndex:", self->_uniforms[0]->_vertexUniBufSBP, 0, 1);
      objc_msgSend(v21, "setFragmentTexture:atIndex:", v9, 0);
      objc_msgSend(v21, "setFragmentBuffer:offset:atIndex:", self->_blackWhiteStrengthCenter, 0, 0);
      objc_msgSend(v21, "setRenderPipelineState:", *(_QWORD *)(v12[5] + 8));
      objc_msgSend(v21, "drawPrimitives:vertexStart:vertexCount:", 4, 0, 4);
      objc_msgSend(v21, "endEncoding");
      objc_msgSend(v19, "commit");

      v23 = 0;
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v23 = FigSignalErrorAt();

    }
  }
  else
  {
LABEL_6:
    fig_log_get_emitter();
    FigDebugAssert3();
    v23 = FigSignalErrorAt();
  }

  return v23;
}

- (uint64_t)performLTM:(__n128)a3 bufferOffset:(__n128)a4 chromaTex:(__n128)a5 outChromaTex:(uint64_t)a6 bilateralGrid:(void *)a7 detailEnhance:(uint64_t)a8 evmTransform:(void *)a9
{
  _QWORD *v16;
  id v17;
  id v18;
  id v19;
  int v20;
  __int128 v21;
  double v22;
  double v23;
  double v24;
  int v25;
  double v26;
  int v27;
  __int128 v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t v36;
  __int128 v37;
  uint64_t v38;
  _QWORD v39[3];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __n128 v43;
  _OWORD v44[4];

  v44[0] = a3;
  v44[1] = a4;
  v44[2] = a5;
  v43 = a2;
  v16 = a11;
  v17 = a10;
  v18 = a9;
  v19 = a7;
  LODWORD(a9) = objc_msgSend(v18, "width");
  v20 = objc_msgSend(v18, "height");
  LODWORD(v21) = 2 * (_DWORD)a9;
  DWORD1(v21) = 2 * v20;
  DWORD2(v21) = ((_DWORD)a9 + 15) & 0x3FFFFFF0;
  v42 = v21;
  v22 = *(double *)(a1 + 4464);
  LODWORD(a9) = (int)(v22 * (double)(unint64_t)objc_msgSend(v18, "width"));
  v23 = *(double *)(a1 + 4472);
  LODWORD(a7) = (int)(v23 * (double)(unint64_t)objc_msgSend(v18, "height"));
  v24 = *(double *)(a1 + 4480);
  v25 = (int)(v24 * (double)(unint64_t)objc_msgSend(v18, "width"));
  v26 = *(double *)(a1 + 4488);
  v27 = (int)(v26 * (double)(unint64_t)objc_msgSend(v18, "height"));
  *(_QWORD *)&v28 = __PAIR64__(a7, a9);
  *((_QWORD *)&v28 + 1) = __PAIR64__(v27, v25);
  v41 = v28;
  LODWORD(v28) = (_DWORD)a9 + v25 / 16;
  DWORD1(v28) = v27 / 12 + (_DWORD)a7;
  DWORD2(v28) = v25 - v25 / 8;
  HIDWORD(v28) = v27 / -6 + v27;
  v40 = v28;
  v36 = (unint64_t)(v25 + 31) >> 5;
  v29 = v27;
  objc_msgSend(*(id *)(a1 + 4056), "commandQueue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commandBuffer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "blitCommandEncoder");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "fillBuffer:range:value:", *(_QWORD *)(a1 + 4528), 0, objc_msgSend(*(id *)(a1 + 4528), "length"), 0);
  objc_msgSend(v32, "endEncoding");
  objc_msgSend(v31, "computeCommandEncoder");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setComputePipelineState:", *(_QWORD *)(a1 + 4560));
  objc_msgSend(v33, "setTexture:atIndex:", v18, 0);

  objc_msgSend(v33, "setTexture:atIndex:", *(_QWORD *)(a1 + 4568), 1);
  objc_msgSend(v33, "setTexture:atIndex:", *(_QWORD *)(a1 + 4576), 2);
  objc_msgSend(v33, "setTexture:atIndex:", *(_QWORD *)(a1 + 4584), 3);
  objc_msgSend(v33, "setTexture:atIndex:", v16[1], 4);
  objc_msgSend(v33, "setTexture:atIndex:", v17, 5);

  objc_msgSend(v33, "setBuffer:offset:atIndex:", v19, a8, 0);
  objc_msgSend(v33, "setBytes:length:atIndex:", &v42, 16, 1);
  v34 = v16[2];

  objc_msgSend(v33, "setBuffer:offset:atIndex:", v34, 0, 2);
  objc_msgSend(v33, "setBytes:length:atIndex:", &v43, 16, 3);
  objc_msgSend(v33, "setBytes:length:atIndex:", v44, 48, 4);
  objc_msgSend(v33, "setBytes:length:atIndex:", &v41, 16, 5);
  objc_msgSend(v33, "setBytes:length:atIndex:", &v40, 16, 6);
  objc_msgSend(v33, "setBuffer:offset:atIndex:", *(_QWORD *)(a1 + 4528), 0, 7);
  v39[0] = v36;
  v39[1] = v29;
  v39[2] = 1;
  v37 = xmmword_216F95F50;
  v38 = 1;
  objc_msgSend(v33, "dispatchThreadgroups:threadsPerThreadgroup:", v39, &v37);
  objc_msgSend(v33, "endEncoding");
  objc_msgSend(v31, "commit");

  return 0;
}

- (int)prepareForFusion:(id)a3 config:(FusionConfiguration *)a4 fusedPyramid:(id)a5 preAllocatedBuffers:(id)a6 exposures:(exposureParameters *)a7 tuningParams:(id)a8
{
  _QWORD *v14;
  int *v15;
  _QWORD *v16;
  _QWORD *v17;
  int longest;
  uint64_t v19;
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  int v32;
  _QWORD *v33;
  int v34;
  _QWORD *v35;
  int v36;
  int *v37;
  int v38;
  int v39;
  MTLTexture *v40;
  MTLTexture *simMapTex;
  MTLTexture *v42;
  double v43;
  uint64_t v44;
  unsigned __int8 *v45;
  MTLTexture *placeHolderTex;
  BOOL v47;
  int v48;
  int v49;
  __int128 v51;
  uint64_t v52;
  int *v53;

  v14 = a3;
  v15 = (int *)a5;
  v16 = a6;
  v17 = a8;
  longest = a4[6].longest;
  if (longest <= 1 || longest >= 5)
    goto LABEL_23;
  v19 = v15[2];
  *(_OWORD *)-[MTLBuffer contents](self->_blackWhiteStrengthCenter, "contents") = xmmword_216F95F40;
  if (!self->_isFusionParamsSet)
    -[FusionRemixStage computeFusionParams:exposures:config:](self, "computeFusionParams:exposures:config:", v17, a7, a4);
  if (a4[6].longest >= 1)
  {
    v20 = 0;
    do
    {
      v21 = *(_OWORD *)&a4->fusionAlgo;
      v22 = *(_OWORD *)&a4[1].fusionAlgo;
      *(_OWORD *)&self->_vertexUniforms.config.longest = *(_OWORD *)&a4->longest;
      *(_OWORD *)&self->_vertexUniforms.hdrFusionMode = v22;
      *(_OWORD *)&self->_vertexUniforms.config.fusionAlgo = v21;
      v23 = *(_OWORD *)&a4[1].longest;
      v24 = *(_OWORD *)&a4[2].fusionAlgo;
      v25 = *(_OWORD *)&a4[3].fusionAlgo;
      *(_OWORD *)&self->_anon_1060[32] = *(_OWORD *)&a4[2].longest;
      *(_OWORD *)&self->_anon_1060[48] = v25;
      *(_OWORD *)self->_anon_1060 = v23;
      *(_OWORD *)&self->_anon_1060[16] = v24;
      v26 = *(_OWORD *)&a4[3].longest;
      v27 = *(_OWORD *)&a4[4].fusionAlgo;
      v28 = *(_OWORD *)&a4[5].fusionAlgo;
      *(_OWORD *)&self->_anon_1060[96] = *(_OWORD *)&a4[4].longest;
      *(_OWORD *)&self->_anon_1060[112] = v28;
      *(_OWORD *)&self->_anon_1060[64] = v26;
      *(_OWORD *)&self->_anon_1060[80] = v27;
      v29 = *(_OWORD *)&a4[5].longest;
      v30 = *(_OWORD *)&a4[6].fusionAlgo;
      v31 = *(_OWORD *)&a4[7].fusionAlgo;
      *(_OWORD *)&self->_anon_1060[160] = *(_OWORD *)&a4[6].longest;
      *(_OWORD *)&self->_anon_1060[176] = v31;
      *(_OWORD *)&self->_anon_1060[128] = v29;
      *(_OWORD *)&self->_anon_1060[144] = v30;
      ++v20;
    }
    while (v20 < a4[6].longest);
  }
  v32 = objc_msgSend(*(id *)(v14[3] + 8 * v19 + 336 - 8), "width");
  v33 = v14;
  v34 = v32;
  v35 = v33;
  v36 = objc_msgSend(*(id *)(v33[3] + 8 * v19 + 336 - 8), "height");
  v53 = v15;
  v37 = &v15[2 * v19];
  v38 = objc_msgSend(*((id *)v37 + 41), "width");
  v39 = objc_msgSend(*((id *)v37 + 41), "height");
  if (v34 != v38
    || v36 != v39
    || (-[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](self->_metal, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", v16[2], 10, 23, 0), v40 = (MTLTexture *)objc_claimAutoreleasedReturnValue(), simMapTex = self->_simMapTex, self->_simMapTex = v40, simMapTex, (v42 = self->_simMapTex) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v49 = FigSignalErrorAt();
    v15 = v53;
    v14 = v35;
    goto LABEL_19;
  }
  v14 = v35;
  if (a4->fusionAlgo != 3)
  {
    v15 = v53;
    if (!-[FusionRemixStage estimateDCValues:ambnrBuffers:](self, "estimateDCValues:ambnrBuffers:", a4, v35))
    {
      v42 = self->_simMapTex;
      v44 = (v19 - 1);
      v45 = &self->_anon_4d0[1360];
      placeHolderTex = self->_placeHolderTex;
      if (v17)
        goto LABEL_13;
LABEL_16:
      v47 = 0;
      goto LABEL_17;
    }
LABEL_23:
    fig_log_get_emitter();
    FigDebugAssert3();
    v48 = FigSignalErrorAt();
    goto LABEL_18;
  }
  memset_pattern16(self->_dcValue, &unk_216F95FF0, 0x40uLL);
  v15 = v53;
  v44 = (v19 - 1);
  v45 = &self->_anon_4d0[1360];
  placeHolderTex = self->_placeHolderTex;
  if (!v17)
    goto LABEL_16;
LABEL_13:
  v47 = *(_BYTE *)(v17[3] + 65) != 0;
LABEL_17:
  BYTE1(v52) = v47;
  LOBYTE(v52) = 0;
  LODWORD(v43) = 0;
  *(_QWORD *)((char *)&v51 + 4) = 1;
  LOWORD(v51) = 257;
  v48 = -[FusionRemixStage runBandFusion:config:prevFusedTex:outputTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:hdrFusionMode:ambnrBuffers:simMapTex:toneMapTex:mismatchCoef:confidence:staticOIS:reduceOisGhosting:](self, "runBandFusion:config:prevFusedTex:outputTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:hdrFusionMode:ambnrBuffers:simMapTex:toneMapTex:mismatchCoef:confidence:staticOIS:reduceOisGhosting:", v44, a4, 0, v42, v45, 0, v43, v51, v35, placeHolderTex, 0, 0, v52);
LABEL_18:
  v49 = v48;
LABEL_19:

  return v49;
}

- (int)selectOisFusionMode:(id)a3 config:(FusionConfiguration *)a4 exposures:(exposureParameters *)a5 tuningParams:(id)a6 outputFusionMode:(int *)a7
{
  _QWORD *v12;
  _QWORD *v13;
  uint64_t longest;
  uint64_t evp;
  uint64_t v16;
  float *p_average_focus_score;
  float v18;
  int v19;
  float average_focus_score;
  int32x4_t *v21;
  int32x4_t *v22;
  void *v23;
  double x;
  double y;
  double width;
  double height;
  id v28;
  id v29;
  float v30;
  __IOSurface *v31;
  __IOSurface *v32;
  int v33;
  int v34;
  int BytesPerRowOfPlane;
  int v36;
  char *BaseAddressOfPlane;
  char *v38;
  uint8x8_t v39;
  uint64_t v40;
  uint64_t v41;
  float32x4_t v42;
  float v44;
  float32x4_t v45;
  float v46;
  float32x4_t v47;
  float v48;
  float v49;
  float v50;
  uint64_t v51;
  _BOOL4 v52;
  int v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  float v59;
  char *v60;
  __int8 *v61;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  float32x4_t v71;
  char *v72;
  __int32 *v73;
  char *v74;
  __int32 *v75;
  char *v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  __int32 *v82;
  __int32 *v83;
  uint64_t v84;
  float32x4_t v85;
  float32x4_t v86;
  float32x4_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float v90;
  float32x4_t v91;
  float v92;
  float32x4_t v93;
  float32x4_t v94;
  float v95;
  float32x4_t v96;
  float v97;
  float32x4_t v98;
  float32x4_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  unsigned int v103;
  float v104;
  unsigned int v105;
  float v106;
  __IOSurface *v107;
  __IOSurface *buffer;
  id v109;
  id v110;
  int *v111;
  _QWORD *v112;
  _QWORD *v113;
  int32x4_t v114;
  int32x4_t v115;
  int32x4_t v116;
  int8x16_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  float32x4_t v123;
  float32x4_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;
  float32x4_t v132;
  float32x4_t v133;
  float32x4_t v134;
  float32x4_t v135;
  float32x4_t v136;
  float32x4_t v137;
  float32x4_t v138;
  float32x4_t v139;
  float32x4_t v140;
  float v141;
  float32x4_t v142;
  float32x4_t v143;
  float32x4_t v144;
  float32x4_t v145;

  v12 = a3;
  v13 = a6;
  longest = a4[6].longest;
  evp = a4[6].evp;
  if ((int)longest < 1)
  {
    v19 = -1;
    v18 = 0.0;
  }
  else
  {
    v16 = 0;
    p_average_focus_score = &a5->average_focus_score;
    v18 = 0.0;
    v19 = -1;
    do
    {
      if (evp != v16)
      {
        v18 = v18 + (float)(*p_average_focus_score * (float)(1.0 / (float)(longest - 1)));
        if (v16 != a4[6].ev0)
          v19 = v16;
      }
      ++v16;
      p_average_focus_score += 10;
    }
    while (longest != v16);
  }
  average_focus_score = a5[(int)evp].average_focus_score;
  v21 = (int32x4_t *)a4 + 3 * v19;
  v114 = v21[2];
  v115 = v21[1];
  v22 = (int32x4_t *)a4 + 3 * (int)evp;
  v116 = v22[1];
  v117 = (int8x16_t)v22[2];
  v23 = *(void **)(v12[(int)evp + 3] + 360);
  x = self->_ROI.origin.x;
  y = self->_ROI.origin.y;
  width = self->_ROI.size.width;
  height = self->_ROI.size.height;
  v28 = *(id *)(v12[a4[6].ev0 + 3] + 360);
  v29 = v23;
  v30 = 3.4028e38;
  if (v18 < 1.0 || average_focus_score < 1.0)
    goto LABEL_24;
  if (objc_msgSend(v28, "iosurface"))
  {
    v31 = (__IOSurface *)objc_msgSend(v28, "iosurface");
    if (!v31)
      goto LABEL_43;
  }
  else
  {
    objc_msgSend(v28, "buffer");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (__IOSurface *)objc_msgSend(v62, "iosurface");

    if (!v31)
      goto LABEL_43;
  }
  if (objc_msgSend(v29, "iosurface"))
  {
    v32 = (__IOSurface *)objc_msgSend(v29, "iosurface");
    if (v32)
      goto LABEL_14;
LABEL_43:
    fig_log_get_emitter();
    FigDebugAssert3();
    v64 = FigSignalErrorAt();

    v30 = 0.0;
    if (!v64)
      goto LABEL_25;
LABEL_56:
    fig_log_get_emitter();
    FigDebugAssert3();
    v53 = FigSignalErrorAt();
    goto LABEL_29;
  }
  objc_msgSend(v29, "buffer");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (__IOSurface *)objc_msgSend(v63, "iosurface");

  if (!v32)
    goto LABEL_43;
LABEL_14:
  if (IOSurfaceLock(v31, 1u, 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_55:

    goto LABEL_56;
  }
  if (IOSurfaceLock(v32, 1u, 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    IOSurfaceUnlock(v31, 1u, 0);
    goto LABEL_55;
  }
  v109 = v29;
  v111 = a7;
  v112 = v13;
  v113 = v12;
  v33 = objc_msgSend(v28, "width");
  v110 = v28;
  v34 = objc_msgSend(v28, "height");
  BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(v31, 0);
  v36 = IOSurfaceGetBytesPerRowOfPlane(v32, 0);
  buffer = v31;
  BaseAddressOfPlane = (char *)IOSurfaceGetBaseAddressOfPlane(v31, 0);
  v107 = v32;
  v38 = (char *)IOSurfaceGetBaseAddressOfPlane(v32, 0);
  v40 = (int)(width * (double)v33);
  *(double *)v42.i64 = height * (double)v34;
  v41 = (int)*(double *)v42.i64;
  v42.i32[0] = 0;
  v122 = v41;
  if ((int)v41 >= 1 && (int)v40 >= 1)
  {
    v58 = y * (double)v34;
    v55 = (int)(x * (double)v33);
    v56 = BytesPerRowOfPlane * (uint64_t)(int)v58;
    v57 = v36 * (uint64_t)(int)v58;
    *(float *)&v58 = (float)(v122 * v40);
    v59 = 1.0 / *(float *)&v58;
    if (v40 >= 8)
    {
      v65 = 0;
      __asm { FMOV            V6.4S, #1.0 }
      v71 = vdivq_f32(_Q6, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v58, 0));
      v72 = &BaseAddressOfPlane[v56 + v55];
      v73 = (__int32 *)(v72 + 4);
      v74 = &v38[v57 + v55];
      v75 = (__int32 *)(v74 + 4);
      v118 = v40 - (v40 & 0xFFFFFFF8);
      v119 = v40;
      v121 = &v74[v40 & 0xFFFFFFF8];
      v120 = v40 & 0xFFFFFFF8;
      v76 = &v72[v120];
      v77 = (float32x4_t)vdupq_n_s32(0x3B808081u);
      v78 = (float32x4_t)vdupq_n_s32(0xBC23D70A);
      v79 = 0uLL;
      v80 = (float32x4_t)vdupq_n_s32(0x42C80000u);
      v42.i32[0] = 0;
      v127 = _Q6;
      v123 = v71;
      v124 = v80;
      v125 = v78;
      v126 = v77;
      do
      {
        v81 = (float32x4_t)v42.u32[0];
        v82 = v75;
        v83 = v73;
        v84 = v120;
        v42 = 0uLL;
        do
        {
          v128 = v42;
          v129 = v81;
          v81.i32[0] = *(v83 - 1);
          v71.i32[0] = *v83;
          v85 = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v81.f32))), v77);
          v86 = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v71.f32))), v77);
          v42.i32[0] = *(v82 - 1);
          v39.i32[0] = *v82;
          v87 = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(*(uint8x8_t *)v42.f32))), v77);
          v88 = vmulq_f32(vcvtq_f32_u32(vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v39))), v77);
          v130 = vmulq_f32(vmaxnmq_f32(vaddq_f32(vdivq_f32(vabdq_f32(v85, v87), vaddq_f32(vaddq_f32(v85, _Q6), v87)), v78), v79), v80);
          v133 = vmulq_f32(vmaxnmq_f32(vaddq_f32(vdivq_f32(vabdq_f32(v86, v88), vaddq_f32(vaddq_f32(v86, _Q6), v88)), v78), v79), v80);
          v141 = expf(v130.f32[1]);
          v89.f32[0] = expf(v130.f32[0]);
          v89.f32[1] = v141;
          v142 = v89;
          v90 = expf(v130.f32[2]);
          v91 = v142;
          v91.f32[2] = v90;
          v143 = v91;
          v92 = expf(v130.f32[3]);
          v93 = v143;
          v93.f32[3] = v92;
          v144 = v93;
          v130.i32[0] = expf(v133.f32[1]);
          v94.f32[0] = expf(v133.f32[0]);
          v94.i32[1] = v130.i32[0];
          v131 = v94;
          v95 = expf(v133.f32[2]);
          v96 = v131;
          v96.f32[2] = v95;
          v132 = v96;
          v97 = expf(v133.f32[3]);
          _Q6 = v127;
          v80 = v124;
          v78 = v125;
          v79 = 0uLL;
          v77 = v126;
          v71.i32[1] = v123.i32[1];
          v98 = v132;
          v98.f32[3] = v97;
          v39.i32[1] = v144.i32[1];
          v81 = vmlaq_f32(v129, v144, v123);
          v42 = vmlaq_f32(v128, v98, v123);
          v83 += 2;
          v82 += 2;
          v84 -= 8;
        }
        while (v84);
        v99 = vaddq_f32(v42, v81);
        v42.f32[0] = vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v99, v99));
        if (v119 != v120)
        {
          v100 = v76;
          v101 = v121;
          v102 = v118;
          do
          {
            v145 = v42;
            v103 = *v100++;
            v104 = (float)v103;
            v105 = *v101++;
            v106 = expf(fmaxf((float)(vabds_f32(v104 * 0.0039216, (float)v105 * 0.0039216)/ (float)((float)((float)(v104 * 0.0039216) + 1.0) + (float)((float)v105 * 0.0039216)))+ -0.01, 0.0)* 100.0);
            v42 = v145;
            v42.f32[0] = v145.f32[0] + (float)(v106 * v59);
            --v102;
          }
          while (v102);
        }
        ++v65;
        v73 = (__int32 *)((char *)v73 + BytesPerRowOfPlane);
        v75 = (__int32 *)((char *)v75 + v36);
        v121 += v36;
        v76 += BytesPerRowOfPlane;
        _Q6 = v127;
        v78 = v125;
        v77 = v126;
        v79 = 0uLL;
        v80 = v124;
      }
      while (v65 != v122);
    }
    else
    {
      v60 = &BaseAddressOfPlane[v56 + 3 + v55];
      v61 = &v38[v57 + 3 + v55];
      v42.i32[0] = 0;
      do
      {
        v134 = v42;
        LOBYTE(v58) = *(v60 - 3);
        v42.i8[0] = *(v61 - 3);
        *(float *)&v58 = expf(fmaxf((float)(vabds_f32((float)LODWORD(v58) * 0.0039216, (float)v42.u32[0] * 0.0039216)/ (float)((float)((float)((float)LODWORD(v58) * 0.0039216) + 1.0)+ (float)((float)v42.u32[0] * 0.0039216)))+ -0.01, 0.0)* 100.0);
        v42 = v134;
        v42.f32[0] = v134.f32[0] + (float)(*(float *)&v58 * v59);
        if ((_DWORD)v40 != 1)
        {
          LOBYTE(v58) = *(v60 - 2);
          v135 = v42;
          v42.i8[0] = *(v61 - 2);
          *(float *)&v58 = expf(fmaxf((float)(vabds_f32((float)LODWORD(v58) * 0.0039216, (float)v42.u32[0] * 0.0039216)/ (float)((float)((float)((float)LODWORD(v58) * 0.0039216) + 1.0)+ (float)((float)v42.u32[0] * 0.0039216)))+ -0.01, 0.0)* 100.0);
          v42 = v135;
          v42.f32[0] = v135.f32[0] + (float)(*(float *)&v58 * v59);
          if ((_DWORD)v40 != 2)
          {
            LOBYTE(v58) = *(v60 - 1);
            v136 = v42;
            v42.i8[0] = *(v61 - 1);
            *(float *)&v58 = expf(fmaxf((float)(vabds_f32((float)LODWORD(v58) * 0.0039216, (float)v42.u32[0] * 0.0039216)/ (float)((float)((float)((float)LODWORD(v58) * 0.0039216) + 1.0)+ (float)((float)v42.u32[0] * 0.0039216)))+ -0.01, 0.0)* 100.0);
            v42 = v136;
            v42.f32[0] = v136.f32[0] + (float)(*(float *)&v58 * v59);
            if ((_DWORD)v40 != 3)
            {
              LOBYTE(v58) = *v60;
              v137 = v42;
              v42.i8[0] = *v61;
              *(float *)&v58 = expf(fmaxf((float)(vabds_f32((float)LODWORD(v58) * 0.0039216, (float)v42.u32[0] * 0.0039216)/ (float)((float)((float)((float)LODWORD(v58) * 0.0039216) + 1.0)+ (float)((float)v42.u32[0] * 0.0039216)))+ -0.01, 0.0)* 100.0);
              v42 = v137;
              v42.f32[0] = v137.f32[0] + (float)(*(float *)&v58 * v59);
              if ((_DWORD)v40 != 4)
              {
                LOBYTE(v58) = v60[1];
                v138 = v42;
                v42.i8[0] = v61[1];
                *(float *)&v58 = expf(fmaxf((float)(vabds_f32((float)LODWORD(v58) * 0.0039216, (float)v42.u32[0] * 0.0039216)/ (float)((float)((float)((float)LODWORD(v58) * 0.0039216) + 1.0)+ (float)((float)v42.u32[0] * 0.0039216)))+ -0.01, 0.0)* 100.0);
                v42 = v138;
                v42.f32[0] = v138.f32[0] + (float)(*(float *)&v58 * v59);
                if ((_DWORD)v40 != 5)
                {
                  LOBYTE(v58) = v60[2];
                  v139 = v42;
                  v42.i8[0] = v61[2];
                  *(float *)&v58 = expf(fmaxf((float)(vabds_f32((float)LODWORD(v58) * 0.0039216, (float)v42.u32[0] * 0.0039216)/ (float)((float)((float)((float)LODWORD(v58) * 0.0039216) + 1.0)+ (float)((float)v42.u32[0] * 0.0039216)))+ -0.01, 0.0)* 100.0);
                  v42 = v139;
                  v42.f32[0] = v139.f32[0] + (float)(*(float *)&v58 * v59);
                  if ((_DWORD)v40 != 6)
                  {
                    LOBYTE(v58) = v60[3];
                    v140 = v42;
                    v42.i8[0] = v61[3];
                    *(float *)&v58 = expf(fmaxf((float)(vabds_f32((float)LODWORD(v58) * 0.0039216, (float)v42.u32[0] * 0.0039216)/ (float)((float)((float)((float)LODWORD(v58) * 0.0039216) + 1.0)+ (float)((float)v42.u32[0] * 0.0039216)))+ -0.01, 0.0)* 100.0);
                    v42 = v140;
                    v42.f32[0] = v140.f32[0] + (float)(*(float *)&v58 * v59);
                  }
                }
              }
            }
          }
        }
        v60 += BytesPerRowOfPlane;
        v61 += v36;
        --v122;
      }
      while (v122);
    }
  }
  v44 = logf(v42.f32[0]);
  v45 = vabsq_f32((float32x4_t)vextq_s8((int8x16_t)vzip1q_s32(v115, vzip2q_s32(v115, v114)), (int8x16_t)v114, 4uLL));
  v46 = (float)((float)((float)(fabsf(*(float *)v115.i32 + -1.0) + fabsf(*(float *)&v114.i32[1] + -1.0))
                      + vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v45, v45)))
              * 60.0)
      + 6.0;
  v47 = vabsq_f32((float32x4_t)vextq_s8((int8x16_t)vzip1q_s32(v116, vzip2q_s32(v116, (int32x4_t)v117)), v117, 4uLL));
  v48 = (float)((float)((float)(fabsf(*(float *)v116.i32 + -1.0) + fabsf(*(float *)&v117.i32[1] + -1.0))
                      + vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v47, v47)))
              * 100.0)
      + 6.0;
  v49 = (float)(v18 * 10.0) / (float)(average_focus_score + 0.00001);
  v47.f32[0] = v49 + -10.0;
  v50 = (float)(v49 * 0.027778) + -0.25;
  if (v47.f32[0] < 0.0)
    v50 = 0.027778;
  v30 = (float)((float)(v46 * v48) * v50) + (float)(v44 * (float)((float)(v46 * v48) * v50));
  IOSurfaceUnlock(buffer, 1u, 0);
  IOSurfaceUnlock(v107, 1u, 0);
  v13 = v112;
  v12 = v113;
  v28 = v110;
  a7 = v111;
  v29 = v109;
LABEL_24:

LABEL_25:
  v51 = v13[3];
  if (*(_BYTE *)(v51 + 64))
    v52 = v30 < *(float *)(v51 + 52);
  else
    v52 = 0;
  v53 = 0;
  *a7 = v52;
LABEL_29:

  return v53;
}

- (int)selectHdrFusionReferenceFrame:(id)a3 config:(FusionConfiguration *)a4 exposures:(exposureParameters *)a5 tuningParams:(id)a6 outputFusionMode:(int *)a7
{
  id v12;
  _QWORD *v13;
  unsigned int *v14;
  float v15;
  unsigned int *v16;
  float v17;
  int v19;
  int v20;
  int v22;
  int v23;

  v12 = a3;
  v13 = a6;
  v23 = 0;
  *(_DWORD *)-[MTLBuffer contents](self->_flickerCountBuffer, "contents") = 0;
  if (-[FusionRemixStage detectFlickerForHDR:config:exposures:tuningParams:height:](self, "detectFlickerForHDR:config:exposures:tuningParams:height:", v12, a4, a5, v13, &v23))
  {
    fig_log_get_emitter();
LABEL_14:
    FigDebugAssert3();
LABEL_15:
    v19 = FigSignalErrorAt();
    goto LABEL_16;
  }
  v22 = 0;
  *(_DWORD *)-[MTLBuffer contents](self->_grayGhostCountBuffer, "contents") = 0;
  if (-[FusionRemixStage computeGrayGhostCount:atBand:config:exposures:tuningParams:size:](self, "computeGrayGhostCount:atBand:config:exposures:tuningParams:size:", v12, 2, a4, a5, v13, &v22))
  {
    fig_log_get_emitter();
    goto LABEL_14;
  }
  -[FigMetalContext waitForIdle](self->_metal, "waitForIdle");
  v14 = (unsigned int *)-[MTLBuffer contents](self->_grayGhostCountBuffer, "contents");
  v15 = (float)*v14 / (float)v22;
  v16 = (unsigned int *)-[MTLBuffer contents](self->_flickerCountBuffer, "contents");
  v17 = *(float *)(v13[3] + 12);
  if ((float)((float)*v16 / (float)v23) > 0.08 && v15 >= v17)
    goto LABEL_15;
  v19 = 0;
  if (v15 >= v17)
    v20 = 1;
  else
    v20 = 2;
  *a7 = v20;
LABEL_16:

  return v19;
}

- (int)runImageFusion:(id)a3 config:(FusionConfiguration *)a4 fusedPyramid:(id)a5 fusedDenoisedPyramid:(id)a6 preAllocatedBuffers:(id)a7 denoiser:(id)a8 bilateralGrid:(id)a9 exposures:(exposureParameters *)a10 tuningParams:(id)a11 confidence:(id)a12 hdrFusionMode:(int)a13 oisFusionMode:(int)a14
{
  _DWORD *v20;
  id *v21;
  void **v22;
  _QWORD *v23;
  int v24;
  int ev0;
  id *v26;
  exposureParameters *v27;
  double v28;
  _BOOL4 v30;
  exposureParameters *v31;
  float v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD *v53;
  int v54;
  void *v55;
  id *v56;
  _OWORD *v57;
  uint64_t v58;
  __int128 v59;
  void *v60;
  BOOL v61;
  int fusionAlgo;
  void *v63;
  _OWORD *v64;
  uint64_t v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id *v70;
  uint64_t v71;
  double v72;
  double v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  id v78;
  FusionRemixStage *v79;
  FusionConfiguration *v80;
  uint64_t v81;
  uint64_t v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  id *v88;
  uint64_t v89;
  double v90;
  double v91;
  char v92;
  void *v93;
  int v94;
  id v95;
  uint64_t v96;
  double *v97;
  _DWORD *v98;
  double v99;
  double v100;
  int v101;
  uint64_t v103;
  char *v104;
  _OWORD *v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  float32x4_t v110;
  float32x4_t v111;
  float32x4_t v112;
  float32x4_t v113;
  char *v114;
  unsigned int v115;
  unsigned int v116;
  unsigned int v117;
  unsigned int v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void **v127;
  id v128;
  char *v129;
  id *v130;
  id *v131;
  FusionRemixStage *v132;
  _QWORD *v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  BOOL v137;
  FusionRemixStageUniformsSBP *arrayOfinputParams;
  BOOL v139;
  id v140;
  id v141;
  FusionConfiguration *v142;
  _QWORD *v143;
  uint64_t v144;
  uint64_t v145;
  id v146;
  id v147;
  id v148;
  double v149;
  void *v150;
  float v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  int v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  float v163[3];
  simd_float3x3 v164;
  simd_float3x3 v165;

  v141 = a3;
  v20 = a5;
  v129 = (char *)a6;
  v21 = (id *)a7;
  v134 = a8;
  v128 = a9;
  v22 = (void **)a11;
  v140 = a12;
  v23 = v20;
  v24 = v20[2];
  ev0 = a4[6].ev0;
  -[FigMetalContext waitForSchedule](self->_metal, "waitForSchedule");
  v163[0] = NAN;
  v26 = v21;
  v27 = &a10[ev0];
  *(float *)&v28 = v27->gain;
  if (-[FusionRemixStage computeMismatchCoef:morphologyBuffer:gain:mismatchCoef:config:](self, "computeMismatchCoef:morphologyBuffer:gain:mismatchCoef:config:", v21[2], v21[1], v163, a4, v28))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v101 = FigSignalErrorAt();
    v55 = v140;
    v53 = v23;
    v63 = v128;
    v60 = v129;
    v56 = v26;

    goto LABEL_52;
  }
  v142 = a4;
  v30 = v163[0] > 0.0 && (a4->fusionAlgo & 0xFFFFFFFE) == 2;
  v139 = v30;
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v132 = self;
  if (!self->_isOISDenoiseParamsSet && v30)
  {
    v31 = &a10[ev0];
    v156 = 0;
    v32 = v27->gain + v163[0] * v27->gain;
    v151 = v32;
    v152 = *(_QWORD *)&v31->red_gain;
    v153 = 0;
    v155 = 0;
    v154 = 0;
    computeNoiseModel((uint64_t)&v157, v22[1], &v151, 0, 1, 0);
    *(_QWORD *)&v33 = -1;
    *((_QWORD *)&v33 + 1) = -1;
    *(_OWORD *)&self->_anon_bf0[160] = v33;
    *(_OWORD *)&self->_anon_bf0[144] = v33;
    *(_OWORD *)&self->_anon_bf0[128] = v33;
    *(_OWORD *)&self->_anon_bf0[112] = v33;
    *(_OWORD *)&self->_anon_bf0[96] = v33;
    *(_OWORD *)&self->_anon_bf0[80] = v33;
    *(_OWORD *)&self->_anon_bf0[64] = v33;
    *(_OWORD *)&self->_anon_bf0[48] = v33;
    *(_OWORD *)&self->_anon_bf0[32] = v33;
    *(_OWORD *)&self->_anon_bf0[16] = v33;
    *(_OWORD *)self->_anon_bf0 = v33;
    *(_OWORD *)&self->_oisDenoiseConf[3].nm.lumaSigmaMax = v33;
    *(_OWORD *)&self->_oisDenoiseConf[2].var0 = v33;
    *(_OWORD *)&self->_oisDenoiseConf[2].nm.lumaSigmaIntercept = v33;
    *(_OWORD *)&self->_oisDenoiseConf[1].nm.lumaSigmaMax = v33;
    *(_OWORD *)&self->_oisDenoiseConf[0].var0 = v33;
    *(_OWORD *)&self->_oisDenoiseConf[0].nm.lumaSigmaIntercept = v33;
    v34 = v160;
    *(_OWORD *)&self->_oisDenoiseConf[1].nm.lumaSigmaMax = v159;
    *(_OWORD *)&self->_oisDenoiseConf[2].nm.lumaSigmaIntercept = v34;
    v35 = v162;
    *(_OWORD *)&self->_oisDenoiseConf[2].var0 = v161;
    *(_OWORD *)&self->_oisDenoiseConf[3].nm.lumaSigmaMax = v35;
    v36 = v158;
    *(_OWORD *)&self->_oisDenoiseConf[0].nm.lumaSigmaIntercept = v157;
    *(_OWORD *)&self->_oisDenoiseConf[0].var0 = v36;
    __asm { FMOV            V8.2S, #1.0 }
    *(_QWORD *)&self->_anon_bf0[136] = _D8;
    v156 = 0;
    *(float *)&v33 = v27->gain + v163[0] * v27->gain;
    v151 = *(float *)&v33;
    v152 = *(_QWORD *)&v31->red_gain;
    v153 = 0;
    v155 = 0;
    v154 = 0;
    computeNoiseModel((uint64_t)&v157, v22[1], &v151, 1, 1, 0);
    *(_QWORD *)&v41 = -1;
    *((_QWORD *)&v41 + 1) = -1;
    *(_OWORD *)&self->_anon_bf0[432] = v41;
    *(_OWORD *)&self->_anon_bf0[416] = v41;
    *(_OWORD *)&self->_anon_bf0[400] = v41;
    *(_OWORD *)&self->_anon_bf0[384] = v41;
    *(_OWORD *)&self->_anon_bf0[368] = v41;
    *(_OWORD *)&self->_anon_bf0[352] = v41;
    *(_OWORD *)&self->_anon_bf0[336] = v41;
    *(_OWORD *)&self->_anon_bf0[320] = v41;
    *(_OWORD *)&self->_anon_bf0[304] = v41;
    *(_OWORD *)&self->_anon_bf0[288] = v41;
    *(_OWORD *)&self->_anon_bf0[272] = v41;
    *(_OWORD *)&self->_anon_bf0[256] = v41;
    *(_OWORD *)&self->_anon_bf0[240] = v41;
    *(_OWORD *)&self->_anon_bf0[224] = v41;
    *(_OWORD *)&self->_anon_bf0[208] = v41;
    *(_OWORD *)&self->_anon_bf0[192] = v41;
    *(_OWORD *)&self->_anon_bf0[176] = v41;
    v42 = v160;
    *(_OWORD *)&self->_anon_bf0[208] = v159;
    *(_OWORD *)&self->_anon_bf0[224] = v42;
    v43 = v162;
    *(_OWORD *)&self->_anon_bf0[240] = v161;
    *(_OWORD *)&self->_anon_bf0[256] = v43;
    v44 = v158;
    *(_OWORD *)&self->_anon_bf0[176] = v157;
    *(_OWORD *)&self->_anon_bf0[192] = v44;
    *(_QWORD *)&self->_anon_bf0[408] = _D8;
    v156 = 0;
    *(float *)&v41 = v27->gain + v163[0] * v27->gain;
    v151 = *(float *)&v41;
    v152 = *(_QWORD *)&v31->red_gain;
    v153 = 0;
    v155 = 0;
    v154 = 0;
    computeNoiseModel((uint64_t)&v157, v22[1], &v151, 2, 1, 0);
    *(_QWORD *)&v45 = -1;
    *((_QWORD *)&v45 + 1) = -1;
    *(_OWORD *)&self->_anon_bf0[704] = v45;
    *(_OWORD *)&self->_anon_bf0[688] = v45;
    *(_OWORD *)&self->_anon_bf0[672] = v45;
    *(_OWORD *)&self->_anon_bf0[656] = v45;
    *(_OWORD *)&self->_anon_bf0[640] = v45;
    *(_OWORD *)&self->_anon_bf0[624] = v45;
    *(_OWORD *)&self->_anon_bf0[608] = v45;
    *(_OWORD *)&self->_anon_bf0[592] = v45;
    *(_OWORD *)&self->_anon_bf0[576] = v45;
    *(_OWORD *)&self->_anon_bf0[560] = v45;
    *(_OWORD *)&self->_anon_bf0[544] = v45;
    *(_OWORD *)&self->_anon_bf0[528] = v45;
    *(_OWORD *)&self->_anon_bf0[512] = v45;
    *(_OWORD *)&self->_anon_bf0[496] = v45;
    *(_OWORD *)&self->_anon_bf0[480] = v45;
    *(_OWORD *)&self->_anon_bf0[464] = v45;
    *(_OWORD *)&self->_anon_bf0[448] = v45;
    v46 = v160;
    *(_OWORD *)&self->_anon_bf0[480] = v159;
    *(_OWORD *)&self->_anon_bf0[496] = v46;
    v47 = v162;
    *(_OWORD *)&self->_anon_bf0[512] = v161;
    *(_OWORD *)&self->_anon_bf0[528] = v47;
    v48 = v158;
    *(_OWORD *)&self->_anon_bf0[448] = v157;
    *(_OWORD *)&self->_anon_bf0[464] = v48;
    *(_QWORD *)&self->_anon_bf0[680] = _D8;
    v156 = 0;
    *(float *)&v45 = v27->gain + v163[0] * v27->gain;
    v151 = *(float *)&v45;
    v152 = *(_QWORD *)&v31->red_gain;
    v153 = 0;
    v155 = 0;
    v154 = 0;
    computeNoiseModel((uint64_t)&v157, v22[1], &v151, 3, 1, 0);
    *(_QWORD *)&v49 = -1;
    *((_QWORD *)&v49 + 1) = -1;
    *(_OWORD *)&self->_anon_bf0[976] = v49;
    *(_OWORD *)&self->_anon_bf0[960] = v49;
    *(_OWORD *)&self->_anon_bf0[944] = v49;
    *(_OWORD *)&self->_anon_bf0[928] = v49;
    *(_OWORD *)&self->_anon_bf0[912] = v49;
    *(_OWORD *)&self->_anon_bf0[896] = v49;
    *(_OWORD *)&self->_anon_bf0[880] = v49;
    *(_OWORD *)&self->_anon_bf0[864] = v49;
    *(_OWORD *)&self->_anon_bf0[848] = v49;
    *(_OWORD *)&self->_anon_bf0[832] = v49;
    *(_OWORD *)&self->_anon_bf0[816] = v49;
    *(_OWORD *)&self->_anon_bf0[800] = v49;
    *(_OWORD *)&self->_anon_bf0[784] = v49;
    *(_OWORD *)&self->_anon_bf0[768] = v49;
    *(_OWORD *)&self->_anon_bf0[752] = v49;
    *(_OWORD *)&self->_anon_bf0[736] = v49;
    *(_OWORD *)&self->_anon_bf0[720] = v49;
    v50 = v160;
    *(_OWORD *)&self->_anon_bf0[752] = v159;
    *(_OWORD *)&self->_anon_bf0[768] = v50;
    v51 = v162;
    *(_OWORD *)&self->_anon_bf0[784] = v161;
    *(_OWORD *)&self->_anon_bf0[800] = v51;
    v52 = v158;
    *(_OWORD *)&self->_anon_bf0[720] = v157;
    *(_OWORD *)&self->_anon_bf0[736] = v52;
    *(_QWORD *)&self->_anon_bf0[952] = _D8;
  }
  v53 = v23;
  if (v142->fusionAlgo != 3)
  {
    v55 = v140;
    v56 = v21;
    v54 = a13;
    v60 = v129;
    if (v140)
    {
      v64 = (_OWORD *)((char *)v132 + 48 * v142[6].evp);
      v65 = MEMORY[0x24BDAEDF8];
      v66 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
      v64[260] = *MEMORY[0x24BDAEDF8];
      v64[261] = v66;
      v64[262] = *(_OWORD *)(v65 + 32);
    }
    if (v22)
      goto LABEL_20;
LABEL_14:
    v61 = 0;
    fusionAlgo = v142->fusionAlgo;
    if (v24 < 1)
      goto LABEL_15;
    goto LABEL_21;
  }
  v54 = a13;
  v55 = v140;
  v56 = v21;
  if (a13 != 1)
  {
    v103 = 48 * v142[7].frameCount;
    v104 = (char *)v142 + v103;
    v105 = (_OWORD *)((char *)&v132->_vertexUniforms.config.longest + v103);
    v106 = MEMORY[0x24BDAEDF8];
    v164 = *(simd_float3x3 *)(v104 + 16);
    v107 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
    *v105 = *MEMORY[0x24BDAEDF8];
    v105[1] = v107;
    v105[2] = *(_OWORD *)(v106 + 32);
    v108 = (uint64_t)(&v132->_vertexUniforms.config.longest + 12 * v142[7].fusionAlgo);
    v165 = __invert_f3(v164);
    *(_DWORD *)(v108 + 8) = v165.columns[0].i32[2];
    *(_DWORD *)(v108 + 24) = v165.columns[1].i32[2];
    *(_QWORD *)v108 = v165.columns[0].i64[0];
    *(_QWORD *)(v108 + 16) = v165.columns[1].i64[0];
    *(_DWORD *)(v108 + 40) = v165.columns[2].i32[2];
    *(_QWORD *)(v108 + 32) = v165.columns[2].i64[0];
    v109 = 48 * *(int *)&v142[7].fixPyramidAlignment;
    v54 = a13;
    v110 = *(float32x4_t *)((char *)&v142->longest + v109);
    v111 = *(float32x4_t *)((char *)&v142[1].fusionAlgo + v109);
    v112 = *(float32x4_t *)((char *)&v142[1].longest + v109);
    v113 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v110, v165.columns[0].f32[0]), v111, *(float32x2_t *)v165.columns[0].f32, 1), v112, (float32x4_t)v165.columns[0], 2);
    v165.columns[0] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v110, v165.columns[1].f32[0]), v111, *(float32x2_t *)v165.columns[1].f32, 1), v112, (float32x4_t)v165.columns[1], 2);
    v114 = (char *)&v132->_vertexUniforms.config.longest + v109;
    *((_DWORD *)v114 + 2) = v113.i32[2];
    *(_QWORD *)v114 = v113.i64[0];
    *((_DWORD *)v114 + 6) = v165.columns[0].i32[2];
    v165.columns[1] = (simd_float3)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v110, v165.columns[2].f32[0]), v111, *(float32x2_t *)v165.columns[2].f32, 1), v112, (float32x4_t)v165.columns[2], 2);
    *((_QWORD *)v114 + 2) = v165.columns[0].i64[0];
    *((_DWORD *)v114 + 10) = v165.columns[1].i32[2];
    *((_QWORD *)v114 + 4) = v165.columns[1].i64[0];
    *(_DWORD *)&v132->_anon_1060[192] = a13;
    v60 = v129;
    if (v22)
      goto LABEL_20;
    goto LABEL_14;
  }
  v57 = (_OWORD *)((char *)v132 + 48 * v142[7].frameCount);
  v58 = MEMORY[0x24BDAEDF8];
  v59 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
  v57[260] = *MEMORY[0x24BDAEDF8];
  v57[261] = v59;
  v57[262] = *(_OWORD *)(v58 + 32);
  *(_DWORD *)&v132->_anon_1060[192] = 1;
  v60 = v129;
  if (!v22)
    goto LABEL_14;
LABEL_20:
  v61 = *((_BYTE *)v22[3] + 65) != 0;
  fusionAlgo = v142->fusionAlgo;
  if (v24 < 1)
  {
LABEL_15:
    v150 = 0;
    v63 = v128;
    if (fusionAlgo != 3)
      goto LABEL_50;
    goto LABEL_48;
  }
LABEL_21:
  v67 = (v24 - 1);
  v130 = v56 + 5;
  v131 = v56;
  arrayOfinputParams = v132->_arrayOfinputParams;
  v68 = v67;
  v137 = v61;
  v136 = v67;
  v133 = v53;
  v127 = v22;
  v145 = 8 * v67;
  if (fusionAlgo == 3 && !(_DWORD)v67)
  {
    v69 = v55;
    v148 = v56[4];
    v70 = v56 + 5;
  }
  else
  {
    v69 = v55;
    v148 = (id)v53[v67 + 42];
    v70 = (id *)&v53[v68 + 62];
  }
  v146 = *v70;
  v71 = (v24 - 1);
  *(float *)&v72 = v163[0];
  BYTE1(v123) = v137;
  LOBYTE(v123) = a14 == 1;
  LODWORD(v119) = v54;
  LOWORD(v115) = 257;
  if (-[FusionRemixStage runBandFusion:config:prevFusedTex:outputTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:hdrFusionMode:ambnrBuffers:simMapTex:toneMapTex:mismatchCoef:confidence:staticOIS:reduceOisGhosting:](v132, "runBandFusion:config:prevFusedTex:outputTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:hdrFusionMode:ambnrBuffers:simMapTex:toneMapTex:mismatchCoef:confidence:staticOIS:reduceOisGhosting:", v136, v142, 0, v148, &arrayOfinputParams[2].hdrEVPChromaWeightBoost + 92 * (2 * v136), (2 * v136 + 3), v72, v115, v119, v141, v132->_simMapTex, 0, v69, v123))
  {
    v74 = v146;
    v150 = 0;
    v63 = v128;
    v60 = v129;
    v55 = v69;
LABEL_65:
    v22 = v127;
    goto LABEL_60;
  }
  *(float *)&v73 = v163[0];
  BYTE1(v124) = v137;
  LOBYTE(v124) = a14 == 1;
  LODWORD(v120) = v54;
  LOWORD(v116) = 256;
  v74 = v146;
  v55 = v69;
  if (-[FusionRemixStage runBandFusion:config:prevFusedTex:outputTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:hdrFusionMode:ambnrBuffers:simMapTex:toneMapTex:mismatchCoef:confidence:staticOIS:reduceOisGhosting:](v132, "runBandFusion:config:prevFusedTex:outputTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:hdrFusionMode:ambnrBuffers:simMapTex:toneMapTex:mismatchCoef:confidence:staticOIS:reduceOisGhosting:", v136, v142, 0, v73, v116, v120, v141, v132->_simMapTex, 0, v69, v124))
  {
    v150 = 0;
    v63 = v128;
    v60 = v129;
    goto LABEL_65;
  }
  v75 = !v139;
  v76 = (void *)v53[v136 + 42];
  if (v24 == 1)
    v75 = 1;
  v77 = v148;
  if ((v75 & 1) != 0)
  {
    v78 = v76;

    v79 = v132;
    v80 = v142;
    if (!(_DWORD)v136)
    {
LABEL_47:
      v94 = v80->fusionAlgo;
      v150 = v78;
      v53 = v133;
      v63 = v128;
      v60 = v129;
      v56 = v131;
      v22 = v127;
      v55 = v140;
      if (v94 != 3)
        goto LABEL_50;
LABEL_48:
      if (!v22)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        v101 = -1;
        goto LABEL_51;
      }
      v149 = *(double *)((char *)v22[3] + 36);
      v95 = v56[3];
      v96 = objc_msgSend(v56[4], "bufferOffset");
      v97 = (double *)(&v142->fusionAlgo + 12 * v142[7].fusionAlgo);
      -[FusionRemixStage performLTM:bufferOffset:chromaTex:outChromaTex:bilateralGrid:detailEnhance:evmTransform:](v132, "performLTM:bufferOffset:chromaTex:outChromaTex:bilateralGrid:detailEnhance:evmTransform:", v95, v96, v56[5], v53[62], v63, v149, v97[2], v97[4], v97[6]);
      v98 = v22[3];
      LODWORD(v99) = v98[7];
      HIDWORD(v99) = 973279855;
      LODWORD(v100) = v98[8];
      -[FusionRemixStage performBlackSubtractionWithBlackWhiteParams:maxContrastStrength:tmpTex:outputTex:](v132, "performBlackSubtractionWithBlackWhiteParams:maxContrastStrength:tmpTex:outputTex:", v56[4], v53[42], v99, v100);
LABEL_50:
      v101 = 0;
      goto LABEL_51;
    }
  }
  else
  {
    v60 = v129;
    if (objc_msgSend(v134, "runLumaAlpha:alpha:output:level:config:", v76, v132->_simMapTex, *(_QWORD *)&v129[8 * v136 + 336], v136, (char *)v132->_oisDenoiseConf + 272 * v136))
    {
      v150 = 0;
      v22 = v127;
      v63 = v128;
      goto LABEL_61;
    }
    v78 = *(id *)&v129[8 * v136 + 336];

    v79 = v132;
    v80 = v142;
  }
  v81 = 0;
  v82 = (uint64_t)&v79->_anon_4d0[272 * v136 + 1456];
  v143 = &v53[(unint64_t)v145 / 8];
  v135 = (v24 - 2);
  v83 = 2 * v24 - 4;
  v84 = -8;
  v85 = (v24 - 1);
  v150 = v78;
  while (1)
  {
    v144 = v84;
    if (v80->fusionAlgo == 3)
    {
      v87 = a14;
      if (v71 + v81 == 1)
      {
        v148 = v131[4];
        v88 = v130;
      }
      else
      {
        v148 = (id)v143[v81 + 41];
        v88 = (id *)&v133[v85 + 61];
      }
    }
    else
    {
      v148 = (id)v143[v81 + 41];
      v88 = (id *)((char *)v143 + v84 + 496);
      v87 = a14;
    }
    v147 = *v88;
    v89 = v135 + v81;
    *(float *)&v90 = v163[0];
    BYTE1(v125) = v137;
    LOBYTE(v125) = v87 == 1;
    v55 = v140;
    LODWORD(v121) = a13;
    LOWORD(v117) = 1;
    if (-[FusionRemixStage runBandFusion:config:prevFusedTex:outputTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:hdrFusionMode:ambnrBuffers:simMapTex:toneMapTex:mismatchCoef:confidence:staticOIS:reduceOisGhosting:](v79, "runBandFusion:config:prevFusedTex:outputTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:hdrFusionMode:ambnrBuffers:simMapTex:toneMapTex:mismatchCoef:confidence:staticOIS:reduceOisGhosting:", v135 + v81, v142, v150, v148, &v132->_arrayOfinputParams[2].hdrEVPChromaWeightBoost + 92 * v83, v83 + 3, v90, v117, v121, v141, v79->_simMapTex, 0, v140, v125))
    {
      v74 = v147;
      v77 = v148;
      v53 = v133;
      v63 = v128;
      v60 = v129;
      v56 = v131;
      v22 = v127;
      goto LABEL_61;
    }
    *(float *)&v91 = v163[0];
    BYTE1(v126) = v137;
    LOBYTE(v126) = v87 == 1;
    LODWORD(v122) = a13;
    LOWORD(v118) = 0;
    if (-[FusionRemixStage runBandFusion:config:prevFusedTex:outputTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:hdrFusionMode:ambnrBuffers:simMapTex:toneMapTex:mismatchCoef:confidence:staticOIS:reduceOisGhosting:](v79, "runBandFusion:config:prevFusedTex:outputTex:bandFusionParams:fragmentBufferIndex:processLuma:processTopBand:computeSpecialMap:hdrFusionMode:ambnrBuffers:simMapTex:toneMapTex:mismatchCoef:confidence:staticOIS:reduceOisGhosting:", v89, v142, v143[v81 + 62], v147, (char *)arrayOfinputParams + 368 * v83, v83 + 2, v91, v118, v122, v141, v79->_simMapTex, 0, v140, v126))
    {
      v74 = v147;
      goto LABEL_59;
    }
    v80 = v142;
    v92 = !v139;
    v93 = (void *)v143[v81 + 41];
    if (v71 + v81 == 1)
      v92 = 1;
    if ((v92 & 1) == 0)
      break;
    v86 = v136;
LABEL_34:
    v78 = v93;

    v82 -= 272;
    --v81;
    v84 = v144 - 8;
    v83 -= 2;
    --v85;
    v150 = v78;
    v71 = v86;
    if ((unint64_t)(v86 + v81 + 1) <= 1)
      goto LABEL_47;
  }
  v86 = v136;
  if (!objc_msgSend(v134, "runLumaAlpha:alpha:output:level:config:", v93, v79->_simMapTex, *(_QWORD *)&v129[8 * v81 + 328 + v145], v89, v82))
  {
    v93 = *(void **)&v129[8 * v81 + 328 + v145];
    goto LABEL_34;
  }
  v74 = v147;
LABEL_59:
  v53 = v133;
  v63 = v128;
  v60 = v129;
  v56 = v131;
  v22 = v127;
  v55 = v140;
LABEL_60:
  v77 = v148;
LABEL_61:
  fig_log_get_emitter();
  FigDebugAssert3();
  v101 = FigSignalErrorAt();

LABEL_51:
LABEL_52:

  return v101;
}

- (void)setToneCurvesWithLtmEVM:(ltmCurves *)a3 ltmEv0:(ltmCurves *)a4
{
  MTLTexture *ltcBinsTex;
  MTLTexture *ltcGTCRatioTex;
  MTLTexture *ltcGTCFinalTex;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;

  ltcBinsTex = self->_ltcBinsTex;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = xmmword_216F95FD0;
  v14 = 6;
  -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](ltcBinsTex, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", &v10, 0, 0, a3, 66, 528);
  ltcGTCRatioTex = self->_ltcGTCRatioTex;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = xmmword_216F95FE0;
  v14 = 1;
  -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](ltcGTCRatioTex, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", &v10, 0, 0, a3->globalLtmLut, 0, 0);
  ltcGTCFinalTex = self->_ltcGTCFinalTex;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = xmmword_216F95FE0;
  v14 = 1;
  -[MTLTexture replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:](ltcGTCFinalTex, "replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:", &v10, 0, 0, a4->gtcLut, 0, 0);
}

- (SidecarWriter)sidecarWriter
{
  return (SidecarWriter *)objc_loadWeakRetained((id *)&self->_sidecarWriter);
}

@end
