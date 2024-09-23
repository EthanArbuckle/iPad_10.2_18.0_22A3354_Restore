@implementation PyramidStage

- (BOOL)useM2M
{
  return self->_conf.use_m2m;
}

- (PyramidStage)initWithOptions:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  PyramidStage *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL *p_supportFP16;
  FigMetalContext **p_metal;
  FigM2MController *v21;
  FigM2MController *m2mController;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  uint64_t v45;
  char *v46;
  MTLBuffer *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  PyramidStage *v51;
  PyramidStage *v52;
  int v54;
  objc_super v55;

  v6 = a4;
  loadDefaultsWritesWithPrefix();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v55.receiver = self;
  v55.super_class = (Class)PyramidStage;
  v8 = -[PyramidStage init](&v55, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PyrGen.UseHW"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", &unk_24D670258);

    if (v10)
    {
      v11 = 0;
      v8->_conf.use_m2m = 0;
    }
    else
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PyrGen.UseHW"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_conf.use_m2m = objc_msgSend(v12, "intValue") == 1;

      v11 = 1;
    }
    v8->_forceHW = v11;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PyrGen.DoSync"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PyrGen.DoSync"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_conf.do_sync_at_end = objc_msgSend(v14, "BOOLValue");

    }
    else
    {
      v8->_conf.do_sync_at_end = 1;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PyrGen.CompensateGpuShift"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PyrGen.CompensateGpuShift"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_conf.compensate_gpu_shift = objc_msgSend(v16, "BOOLValue");

    }
    else
    {
      v8->_conf.compensate_gpu_shift = 0;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PyrGen.SupportFP16"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PyrGen.SupportFP16"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_conf.supportFP16 = objc_msgSend(v18, "BOOLValue");
      p_supportFP16 = &v8->_conf.supportFP16;

    }
    else
    {
      v8->_conf.supportFP16 = 1;
      p_supportFP16 = &v8->_conf.supportFP16;
    }

    p_metal = &v8->_metal;
    objc_storeStrong((id *)&v8->_metal, a4);
    v21 = (FigM2MController *)objc_alloc_init(MEMORY[0x24BE119F8]);
    m2mController = v8->_m2mController;
    v8->_m2mController = v21;

    if (v8->_m2mController)
    {
      +[PyramidStageShared sharedInstance](PyramidStageShared, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "getPipeline:lumaWrite:chromaType:", *p_metal, 0, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {

        if (*p_supportFP16)
        {
          +[PyramidStageShared sharedInstance](PyramidStageShared, "sharedInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "getPipeline:lumaWrite:chromaType:", *p_metal, 0, 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v26)
            goto LABEL_33;

        }
        +[PyramidStageShared sharedInstance](PyramidStageShared, "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "getPipeline:lumaWrite:chromaType:", *p_metal, 0, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {

          if (!*p_supportFP16)
            goto LABEL_27;
          +[PyramidStageShared sharedInstance](PyramidStageShared, "sharedInstance");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "getPipeline:lumaWrite:chromaType:", *p_metal, 1, 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v30)
            goto LABEL_33;

          if (*p_supportFP16)
          {
            +[PyramidStageShared sharedInstance](PyramidStageShared, "sharedInstance");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "getPipeline:lumaWrite:chromaType:", *p_metal, 1, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v32)
              goto LABEL_33;

          }
          +[PyramidStageShared sharedInstance](PyramidStageShared, "sharedInstance");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "getPipeline:lumaWrite:chromaType:", *p_metal, 1, 2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          if (v34)
          {

LABEL_27:
            v35 = 0;
            *(_OWORD *)&v8[1]._pyr = xmmword_216F961C0;
            v8[1]._metal = (FigMetalContext *)0x3F80000000000000;
            __asm { FMOV            V1.4S, #1.0 }
            *(_OWORD *)&v8[1]._uniforms_Y[3] = _Q1;
            *(_OWORD *)&v8[1]._uniforms_Y[5] = _Q1;
            v8[1]._uniforms_Y[1] = (MTLBuffer *)0x3F00000000000000;
            v41 = MEMORY[0x24BDAEDF8];
            v42 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
            *(_OWORD *)&v8->_colorSpaceConversionParameters.transferFunctionFwd.linearScale = *MEMORY[0x24BDAEDF8];
            *(_OWORD *)&v8->_colorSpaceConversionParameters.transferFunctionFwd.nonLinearPower = v42;
            v43 = *(_OWORD *)(v41 + 32);
            BYTE2(v8[1]._uniforms_Y[7]) = 1;
            LOWORD(v8[1]._uniforms_Y[7]) = 257;
            v8->_band0ColorSpace = 0;
            *(_OWORD *)&v8->_colorSpaceConversionParameters.transferFunctionInv.nonLinearBias = v43;
            *(_OWORD *)&v8[1].super.isa = xmmword_216F961B0;
            while (1)
            {
              -[FigMetalContext device](v8->_metal, "device");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "newBufferWithLength:options:", 16, 0);
              v46 = (char *)v8 + v35 * 8;
              v47 = v8->_uniforms_Y[v35];
              v8->_uniforms_Y[v35] = (MTLBuffer *)v45;

              if (!v8->_uniforms_Y[v35])
                break;
              -[FigMetalContext device](v8->_metal, "device");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v48, "newBufferWithLength:options:", 16, 0);
              v50 = (void *)*((_QWORD *)v46 + 25);
              *((_QWORD *)v46 + 25) = v49;

              if (!*((_QWORD *)v46 + 25))
                break;
              if (++v35 == 20)
                goto LABEL_31;
            }
          }
        }
      }
    }
LABEL_33:
    fig_log_get_emitter();
    FigDebugAssert3();
    v54 = FigSignalErrorAt();
    v51 = 0;
    if (v54)
      goto LABEL_32;
  }
LABEL_31:
  v51 = v8;
LABEL_32:
  v52 = v51;

  return v52;
}

- (int)runGPUWithFilters:(PyramidFilterParams *)a3 doShift:(BOOL)a4
{
  int32x2_t v4;
  PyramidStorage *pyr;
  uint64_t v8;
  int32x2_t v9;
  float *p_chroma_param;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  int band0ColorSpace;
  BOOL v19;
  uint64_t v20;
  void *v21;
  void *v22;
  MTLTexture *v23;
  MTLTexture *v24;
  MTLTexture *v25;
  float luma_param;
  float chroma_param;
  void *v28;
  unsigned int v29;
  int v30;
  int v31;
  int v32;
  __int128 v33;
  MTLTexture *v34;
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  uint64_t v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  PyramidStorage *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  unint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  char v73;
  void *v74;
  void *v75;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  int64x2_t v83;
  int64x2_t v84;
  int v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unsigned int v92;
  unint64_t v93;
  int v94;
  unint64_t v95;
  MTLTexture *v96;
  void *v97;
  int64x2_t v98;
  uint64_t v99;
  int64x2_t v100;
  uint64_t v101;
  _QWORD v102[3];
  int64x2_t v103;
  uint64_t v104;
  _QWORD v105[3];
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  uint64_t v117;

  pyr = self->_pyr;
  if (pyr->levels >= 2)
  {
    v8 = 0;
    v4.i32[0] = 0;
    if (a4)
      *(float *)v4.i32 = 1.0;
    v9 = vdup_lane_s32(v4, 0);
    p_chroma_param = &a3->chroma_param;
    while (*((_DWORD *)p_chroma_param - 2) == 1)
    {
      v11 = (id *)(&self->super.isa + v8);
      v12 = objc_msgSend(objc_retainAutorelease(v11[5]), "contents");
      *(_DWORD *)v12 = (int)*(p_chroma_param - 1);
      *(int32x2_t *)(v12 + 8) = v9;
      v13 = objc_msgSend(objc_retainAutorelease(v11[25]), "contents");
      v14 = *p_chroma_param;
      p_chroma_param += 3;
      *(_DWORD *)v13 = (int)v14;
      *(int32x2_t *)(v13 + 8) = v9;
      ++v8;
      pyr = self->_pyr;
      if (v8 >= pyr->levels - 1)
        goto LABEL_7;
    }
LABEL_79:
    fig_log_get_emitter();
    FigDebugAssert3();
    return FigSignalErrorAt();
  }
LABEL_7:
  v15 = -[MTLTexture pixelFormat](pyr->textureY[0], "pixelFormat", a3, a4);
  v16 = v15;
  v17 = v15 == 576 || v15 == 588;
  band0ColorSpace = self->_band0ColorSpace;
  v19 = v17 || band0ColorSpace == 2;
  v20 = v19;
  v91 = v20;
  if (v19)
  {
    -[FigMetalContext commandQueue](self->_metal, "commandQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "commandBuffer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_79;
    v96 = self->_pyr->textureY[0];
    v23 = self->_pyr->textureUV[0];
    v24 = self->_pyr->textureY[1];
    v25 = self->_pyr->textureUV[1];
    luma_param = a3->luma_param;
    chroma_param = a3->chroma_param;
    objc_msgSend(v22, "computeCommandEncoder");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v89 = v16;
      v94 = band0ColorSpace;
      v29 = luma_param;
      if (chroma_param == 5)
        v30 = 2;
      else
        v30 = 1;
      v116 = 0;
      v117 = 0;
      if (chroma_param == 7)
        v31 = 3;
      else
        v31 = v30;
      v85 = v31;
      if (v29 == 5)
        v32 = 2;
      else
        v32 = 1;
      v33 = *(_OWORD *)&self[1]._uniforms_Y[3];
      v34 = v24;
      if (v29 == 7)
        v35 = 3;
      else
        v35 = v32;
      v92 = v31 + 2;
      v112 = *(_OWORD *)&self[1]._uniforms_Y[1];
      v113 = v33;
      v36 = *(_OWORD *)&self[1]._uniforms_Y[7];
      v114 = *(_OWORD *)&self[1]._uniforms_Y[5];
      v115 = v36;
      v37 = *(_OWORD *)&self[1].super.isa;
      v108 = *(_OWORD *)&self->_colorSpaceConversionParameters.transferFunctionInv.nonLinearBias;
      v109 = v37;
      v38 = *(_OWORD *)&self[1]._metal;
      v110 = *(_OWORD *)&self[1]._pyr;
      v111 = v38;
      v39 = *(_OWORD *)&self->_colorSpaceConversionParameters.transferFunctionFwd.nonLinearPower;
      v106 = *(_OWORD *)&self->_colorSpaceConversionParameters.transferFunctionFwd.linearScale;
      v107 = v39;
      LOBYTE(v116) = self->_conf.compensate_gpu_shift;
      +[PyramidStageShared sharedInstance](PyramidStageShared, "sharedInstance");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "getRec709DownsamplePipelineState:kernelType:", self->_metal, (v35 - 1));
      v41 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "setTexture:atIndex:", v96, 0);
      objc_msgSend(v28, "setTexture:atIndex:", v23, 1);
      objc_msgSend(v28, "setTexture:atIndex:", v34, 2);
      objc_msgSend(v28, "setBytes:length:atIndex:", &v106, 176, 0);
      v86 = (void *)v41;
      objc_msgSend(v28, "setComputePipelineState:", v41);
      objc_msgSend(v28, "setImageblockWidth:height:", 32, 32);
      v42 = v35 + (v35 & 1);
      LODWORD(v40) = 16 - v42;
      v42 ^= 0xFu;
      v105[0] = (v42 + -[MTLTexture width](v34, "width")) / v40;
      v105[1] = (v42 + -[MTLTexture height](v34, "height")) / v40;
      v105[2] = 1;
      v83 = vdupq_n_s64(0x10uLL);
      v103 = v83;
      v104 = 1;
      objc_msgSend(v28, "dispatchThreadgroups:threadsPerThreadgroup:", v105, &v103);
      +[PyramidStageShared sharedInstance](PyramidStageShared, "sharedInstance");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "getRec709DownsamplePipelineState:kernelType:", self->_metal, v92);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "setTexture:atIndex:", v96, 0);
      objc_msgSend(v28, "setTexture:atIndex:", v23, 1);
      objc_msgSend(v28, "setTexture:atIndex:", v25, 2);
      objc_msgSend(v28, "setBytes:length:atIndex:", &v106, 176, 0);
      objc_msgSend(v28, "setComputePipelineState:", v44);
      objc_msgSend(v28, "setImageblockWidth:height:", 32, 32);
      v102[0] = ((v85 ^ 0xF) + -[MTLTexture width](v25, "width")) / (16 - v85);
      v102[1] = ((v85 ^ 0xF) + -[MTLTexture height](v25, "height")) / (16 - v85);
      v102[2] = 1;
      v100 = v83;
      v101 = 1;
      objc_msgSend(v28, "dispatchThreadgroups:threadsPerThreadgroup:", v102, &v100);
      objc_msgSend(v28, "endEncoding");
      if (*MEMORY[0x24BDC0B48])
      {
        objc_msgSend(v22, "commandQueue");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "commandBuffer");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "setLabel:", CFSTR("KTRACE_MTLCMDBUF"));
        objc_msgSend(v46, "addCompletedHandler:", &__block_literal_global_2);
        objc_msgSend(v46, "commit");
        objc_msgSend(v22, "addCompletedHandler:", &__block_literal_global_143);

      }
      objc_msgSend(v22, "commit");

      v47 = 0;
      band0ColorSpace = v94;
      v24 = v34;
      v16 = v89;
    }
    else
    {
      fig_log_get_emitter();
      v79 = v81;
      LODWORD(v77) = 0;
      FigDebugAssert3();
      v47 = FigSignalErrorAt();
    }

    if (!v28)
      return v47;
  }
  else
  {
    v47 = 0;
  }
  -[FigMetalContext commandQueue](self->_metal, "commandQueue", v77, v79);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "commandBuffer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v82 = FigSignalErrorAt();
    goto LABEL_77;
  }
  v82 = v47;
  v50 = 0;
  LODWORD(v51) = v16 == 588;
  if (v51 <= (v16 == 576))
    LODWORD(v51) = v16 == 576;
  if (v51 <= (band0ColorSpace == 2))
    v51 = band0ColorSpace == 2;
  else
    v51 = v51;
  v88 = v49;
  v90 = v91 - 1;
  v95 = 8 * (v91 - 1);
  v87 = v51;
  v93 = 8 * v51;
  v84 = vdupq_n_s64(8uLL);
  while (1)
  {
    v52 = v90 + v50;
    v53 = self->_pyr;
    v54 = v53->levels - 1;
    if (v90 + v50 >= v54)
      break;
    if (v52 >= v91)
    {
      v55 = v53->isFP16[v52];
      v56 = v87 + v50;
      if (v87 + v50 >= v54)
      {
LABEL_46:
        v57 = 0;
        if ((_DWORD)v55 != 2)
          goto LABEL_47;
        goto LABEL_50;
      }
    }
    else
    {
      v55 = 2;
      v56 = v87 + v50;
      if (v87 + v50 >= v54)
        goto LABEL_46;
    }
    v57 = *(id *)((char *)&v53->textureY_RG[v50 + 1] + v93);
    if ((_DWORD)v55 != 2)
    {
LABEL_47:
      v58 = *(MTLTexture **)((char *)&self->_pyr->textureUV[v50 + 1] + v95);
      goto LABEL_51;
    }
LABEL_50:
    v58 = 0;
LABEL_51:
    v59 = v58;
    +[PyramidStageShared sharedInstance](PyramidStageShared, "sharedInstance");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "getPipeline:lumaWrite:chromaType:", self->_metal, v56 < v54, v55);
    v97 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56 >= v54)
    {
      v61 = (unint64_t)(objc_msgSend(v59, "width") + 1) >> 1;
      v62 = v59;
    }
    else
    {
      v61 = objc_msgSend(v57, "width");
      v62 = v57;
    }
    v63 = objc_msgSend(v62, "height", v78, v80);
    objc_msgSend(v49, "computeCommandEncoder");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (!v64)
    {
LABEL_73:
      fig_log_get_emitter();
      v80 = v81;
      LODWORD(v78) = 0;
      FigDebugAssert3();
      v82 = FigSignalErrorAt();
      v73 = 0;
      goto LABEL_71;
    }
    objc_msgSend(v64, "setComputePipelineState:", v97);
    if (v56 < v54)
    {
      if (!v57)
        goto LABEL_73;
      v66 = *(uint64_t *)((char *)&self->_pyr->textureY[v50] + v93);
      if (!v66)
        goto LABEL_73;
      objc_msgSend(v65, "setTexture:atIndex:", v66, 0);
      v67 = *(uint64_t *)((char *)&self->_pyr->textureY_RG[v50 + 1] + v93);
      if (!v67)
        goto LABEL_73;
      objc_msgSend(v65, "setTexture:atIndex:", v67, 3);
    }
    if ((_DWORD)v55 == 1)
    {
      if (!v59)
        goto LABEL_73;
      v70 = *(uint64_t *)((char *)&self->_pyr->textureUV_packed[v50] + v95);
      if (!v70)
        goto LABEL_73;
      objc_msgSend(v65, "setTexture:atIndex:", v70, 2);
      v69 = *(uint64_t *)((char *)&self->_pyr->textureUV[v50 + 1] + v95);
      if (!v69)
        goto LABEL_73;
      goto LABEL_69;
    }
    if (!(_DWORD)v55)
    {
      if (!v59)
        goto LABEL_73;
      v68 = *(uint64_t *)((char *)&self->_pyr->textureUV_packed[v50] + v95);
      if (!v68)
        goto LABEL_73;
      objc_msgSend(v65, "setTexture:atIndex:", v68, 1);
      v69 = *(uint64_t *)((char *)&self->_pyr->textureUV[v50 + 1] + v95);
      if (!v69)
        goto LABEL_73;
LABEL_69:
      objc_msgSend(v65, "setTexture:atIndex:", v69, 4);
    }
    v71 = (v61 + 7) >> 3;
    v72 = (unint64_t)(v63 + 7) >> 3;
    objc_msgSend(v65, "setBuffer:offset:atIndex:", *((_QWORD *)&self->_uniforms_Y[v93 / 8] + v50), 0, 0);
    v73 = 1;
    objc_msgSend(v65, "setBuffer:offset:atIndex:", *((_QWORD *)&self->_uniforms_UV[v95 / 8] + v50), 0, 1);
    *(_QWORD *)&v106 = v71;
    *((_QWORD *)&v106 + 1) = v72;
    *(_QWORD *)&v107 = 1;
    v98 = v84;
    v99 = 1;
    objc_msgSend(v65, "dispatchThreadgroups:threadsPerThreadgroup:", &v106, &v98);
    objc_msgSend(v65, "endEncoding");
LABEL_71:

    ++v50;
    v49 = v88;
    if ((v73 & 1) == 0)
      goto LABEL_77;
  }
  if (*MEMORY[0x24BDC0B48])
  {
    objc_msgSend(v49, "commandQueue");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "commandBuffer");
    v75 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v75, "setLabel:", CFSTR("KTRACE_MTLCMDBUF"));
    objc_msgSend(v75, "addCompletedHandler:", &__block_literal_global_151);
    objc_msgSend(v75, "commit");
    objc_msgSend(v49, "addCompletedHandler:", &__block_literal_global_152);

  }
  objc_msgSend(v49, "commit", v78, v80);
LABEL_77:

  return v82;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniforms_UV[19], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[18], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[17], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[16], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[15], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[14], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[13], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[12], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[11], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[10], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[9], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[8], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[7], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[6], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[5], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[4], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[3], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[2], 0);
  objc_storeStrong((id *)&self->_uniforms_UV[1], 0);
  objc_storeStrong((id *)self->_uniforms_UV, 0);
  objc_storeStrong((id *)&self->_uniforms_Y[19], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[18], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[17], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[16], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[15], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[14], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[13], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[12], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[11], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[10], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[9], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[8], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[7], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[6], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[5], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[4], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[3], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[2], 0);
  objc_storeStrong((id *)&self->_uniforms_Y[1], 0);
  objc_storeStrong((id *)self->_uniforms_Y, 0);
  objc_storeStrong((id *)&self->_metal, 0);
  objc_storeStrong((id *)&self->_m2mController, 0);
  objc_storeStrong((id *)&self->_pyr, 0);
}

- (int)runWithFilters:(PyramidFilterParams *)a3
{
  PyramidStorage *pyr;
  uint64_t v6;
  Class *v7;

  pyr = self->_pyr;
  if (!pyr)
    goto LABEL_10;
  if (pyr->levels >= 2)
  {
    v6 = 0;
    do
    {
      v7 = &pyr->super.isa + v6++;
      CVBufferPropagateAttachments(v7[2], v7[3]);
      pyr = self->_pyr;
    }
    while (v6 < pyr->levels - 1);
  }
  if (self->_conf.use_m2m)
  {
    if (-[PyramidStage runM2MWithFilters:](self, "runM2MWithFilters:", a3))
      goto LABEL_10;
    return 0;
  }
  if (!-[PyramidStage runGPUWithFilters:doShift:](self, "runGPUWithFilters:doShift:", a3, self->_conf.compensate_gpu_shift))return 0;
LABEL_10:
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

- (int)setResourcesWithPyramid:(id)a3
{
  char *v5;
  PyramidStorage **p_pyr;
  PyramidStorage *pyr;
  int levels;
  int v9;
  uint64_t v10;
  char *v11;
  BOOL v12;
  __CVBuffer *v13;
  OSType PixelFormatType;
  char WidthOfPlane;

  v5 = (char *)a3;
  p_pyr = &self->_pyr;
  objc_storeStrong((id *)&self->_pyr, a3);
  pyr = self->_pyr;
  levels = pyr->levels;
  if (levels >= 20)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v9 = FigSignalErrorAt();
  }
  else if (self->_forceHW)
  {
    v9 = 0;
  }
  else
  {
    if (levels < 1)
    {
      v12 = 1;
    }
    else
    {
      v10 = 0;
      v11 = v5 + 976;
      v12 = 1;
      do
      {
        while (1)
        {
          if (v12 && !v11[v10])
          {
            v13 = *(__CVBuffer **)&v11[8 * v10 - 960];
            if (v13)
            {
              PixelFormatType = CVPixelBufferGetPixelFormatType(v13);
              pyr = *p_pyr;
              if (PixelFormatType == 875704422)
              {
                WidthOfPlane = CVPixelBufferGetWidthOfPlane(pyr->pixelBuffer[v10], 0);
                pyr = *p_pyr;
                if ((WidthOfPlane & 1) == 0)
                  break;
              }
            }
          }
          v12 = 0;
          if (++v10 >= pyr->levels)
            goto LABEL_16;
        }
        v12 = (CVPixelBufferGetHeightOfPlane(pyr->pixelBuffer[v10], 0) & 1) == 0;
        pyr = *p_pyr;
        ++v10;
      }
      while (v10 < (*p_pyr)->levels);
    }
LABEL_16:
    v9 = 0;
    self->_conf.use_m2m = v12;
  }

  return v9;
}

- (BOOL)dumpIntermediateData:(id)a3 counter:(int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (self->_pyr->levels < 1)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    v7 = 0;
    v8 = 1;
    do
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pyramid_%d_pyr_%d.420f"), v4, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathComponent:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_retainAutorelease(v10);
      objc_msgSend(v11, "UTF8String");
      v8 &= WritePixelBufferToFile();

      ++v7;
    }
    while (v7 < self->_pyr->levels);
  }

  return v8;
}

+ (int)prewarmShaders:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  +[PyramidStageShared compileShader:lumaWrite:chromaType:](PyramidStageShared, "compileShader:lumaWrite:chromaType:", v3, 0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_15;
  v5 = (void *)v4;
  +[PyramidStageShared compileShader:lumaWrite:chromaType:](PyramidStageShared, "compileShader:lumaWrite:chromaType:", v3, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_15;
  +[PyramidStageShared compileShader:lumaWrite:chromaType:](PyramidStageShared, "compileShader:lumaWrite:chromaType:", v3, 0, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_15;
  +[PyramidStageShared compileShader:lumaWrite:chromaType:](PyramidStageShared, "compileShader:lumaWrite:chromaType:", v3, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_15;
  +[PyramidStageShared compileShader:lumaWrite:chromaType:](PyramidStageShared, "compileShader:lumaWrite:chromaType:", v3, 1, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_15;
  +[PyramidStageShared compileShader:lumaWrite:chromaType:](PyramidStageShared, "compileShader:lumaWrite:chromaType:", v3, 1, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    goto LABEL_15;
  if (+[PyramidStageShared isRec709DownsampleSupported](PyramidStageShared, "isRec709DownsampleSupported"))
  {
    +[PyramidStageShared compileShader:kernelType:](PyramidStageShared, "compileShader:kernelType:", v3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      goto LABEL_15;
    +[PyramidStageShared compileShader:kernelType:](PyramidStageShared, "compileShader:kernelType:", v3, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_15;
    +[PyramidStageShared compileShader:kernelType:](PyramidStageShared, "compileShader:kernelType:", v3, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_15;
    +[PyramidStageShared compileShader:kernelType:](PyramidStageShared, "compileShader:kernelType:", v3, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14
      || (+[PyramidStageShared compileShader:kernelType:](PyramidStageShared, "compileShader:kernelType:", v3, 4), v15 = (void *)objc_claimAutoreleasedReturnValue(), v14, !v15)|| (+[PyramidStageShared compileShader:kernelType:](PyramidStageShared, "compileShader:kernelType:", v3, 5), v10 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v10))
    {
LABEL_15:
      fig_log_get_emitter();
      FigDebugAssert3();
      FigSignalErrorAt();
      v10 = 0;
    }
  }

  return 0;
}

- (int)runM2MWithFilters:(PyramidFilterParams *)a3
{
  uint64_t v4;
  float *p_luma_param;
  _BOOL8 v6;
  int v7;
  PyramidStorage *pyr;
  Class *v9;
  __CVBuffer *v10;
  double v11;
  double v12;
  int v13;
  uint64_t v14;
  PyramidStorage *v15;

  v4 = 0;
  p_luma_param = &a3->luma_param;
  do
  {
    pyr = self->_pyr;
    if (v4 >= pyr->levels - 1)
      return 0;
    v9 = &pyr->super.isa + v4;
    if (!v9[2])
      break;
    v10 = v9[3];
    if (!v10 || CVPixelBufferGetPixelFormatType(v10) != 875704422)
      break;
    v13 = *((_DWORD *)p_luma_param - 1);
    v14 = v13 == 2 ? 2 : v13 == 1;
    *(float *)&v11 = *p_luma_param;
    *(float *)&v12 = p_luma_param[1];
    if (-[FigM2MController setCustomFilter:alignment:src:dst:luma_param:chroma_param:](self->_m2mController, "setCustomFilter:alignment:src:dst:luma_param:chroma_param:", v14, self->_conf.compensate_gpu_shift, self->_pyr->pixelBuffer[v4], self->_pyr->pixelBuffer[v4 + 1], v11, v12))break;
    v15 = self->_pyr;
    v6 = v4 == v15->levels - 2 && (unint64_t)self->_conf.do_sync_at_end;
    v7 = -[FigM2MController downsample:dst:sync_m2m:](self->_m2mController, "downsample:dst:sync_m2m:", v15->pixelBuffer[v4], v15->pixelBuffer[v4 + 1], v6);
    p_luma_param += 3;
    ++v4;
  }
  while (!v7);
  fig_log_get_emitter();
  FigDebugAssert3();
  return FigSignalErrorAt();
}

uint64_t __42__PyramidStage_runGPUWithFilters_doShift___block_invoke()
{
  uint64_t result;

  if (*MEMORY[0x24BDC0B48] == 1)
    return kdebug_trace();
  return result;
}

void __42__PyramidStage_runGPUWithFilters_doShift___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    objc_msgSend(v2, "GPUEndTime");
    objc_msgSend(v2, "GPUStartTime");
    if (*MEMORY[0x24BDC0B48] != 1)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v2, "status");
  if (*MEMORY[0x24BDC0B48] == 1)
LABEL_5:
    kdebug_trace();
LABEL_6:

}

uint64_t __42__PyramidStage_runGPUWithFilters_doShift___block_invoke_3()
{
  uint64_t result;

  if (*MEMORY[0x24BDC0B48] == 1)
    return kdebug_trace();
  return result;
}

void __42__PyramidStage_runGPUWithFilters_doShift___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "status") == 4)
  {
    objc_msgSend(v2, "GPUEndTime");
    objc_msgSend(v2, "GPUStartTime");
    if (*MEMORY[0x24BDC0B48] != 1)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(v2, "status");
  if (*MEMORY[0x24BDC0B48] == 1)
LABEL_5:
    kdebug_trace();
LABEL_6:

}

- (void)setColorSpace:(int)a3 withParams:(const ColorSpaceConversionParameters *)a4
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  self->_band0ColorSpace = a3;
  if (a4)
  {
    v4 = *(_OWORD *)&a4->transferFunctionFwd.nonLinearPower;
    *(_OWORD *)&self->_colorSpaceConversionParameters.transferFunctionFwd.linearScale = *(_OWORD *)&a4->transferFunctionFwd.linearScale;
    *(_OWORD *)&self->_colorSpaceConversionParameters.transferFunctionFwd.nonLinearPower = v4;
    v5 = *(_OWORD *)&a4->transferFunctionInv.nonLinearBias;
    v6 = *(_OWORD *)&a4[1].transferFunctionFwd.linearScale;
    v7 = *(_OWORD *)&a4[1].transferFunctionInv.nonLinearBias;
    *(_OWORD *)&self[1]._pyr = *(_OWORD *)&a4[1].transferFunctionFwd.nonLinearPower;
    *(_OWORD *)&self[1]._metal = v7;
    *(_OWORD *)&self->_colorSpaceConversionParameters.transferFunctionInv.nonLinearBias = v5;
    *(_OWORD *)&self[1].super.isa = v6;
    v8 = *(_OWORD *)&a4[2].transferFunctionFwd.linearScale;
    v9 = *(_OWORD *)&a4[2].transferFunctionFwd.nonLinearPower;
    v10 = *(_OWORD *)&a4[3].transferFunctionFwd.linearScale;
    *(_OWORD *)&self[1]._uniforms_Y[5] = *(_OWORD *)&a4[2].transferFunctionInv.nonLinearBias;
    *(_OWORD *)&self[1]._uniforms_Y[7] = v10;
    *(_OWORD *)&self[1]._uniforms_Y[1] = v8;
    *(_OWORD *)&self[1]._uniforms_Y[3] = v9;
  }
}

@end
