@implementation PTBackgroundReplacement

- (PTBackgroundReplacement)initWithMetalContext:(id)a3 effectDescriptor:(id)a4 sharedSDOFRenderRequest:(id)a5 renderPipeline:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PTBackgroundReplacement *v15;
  PTBackgroundReplacement *v16;
  id *p_metalContext;
  uint64_t v18;
  MTLComputePipelineState *backgroundCropAndResize;
  uint64_t v20;
  MTLComputePipelineState *backgroundReplacement;
  uint64_t v22;
  MTLComputePipelineState *backgroundReplacementTransition;
  uint64_t v24;
  MTLComputePipelineState *studiolightBackgroundDimming;
  uint64_t v26;
  MTLComputePipelineState *backgroundReplacementCopyTransition;
  unint64_t v28;
  PTColorTemperatureCorrection *v29;
  PTColorTemperatureCorrection *colorTemperatureCorrection;
  uint64_t v36;
  MTLBuffer *v37;
  uint64_t v38;
  MTLBuffer *v39;
  int v40;
  int v41;
  void *v42;
  uint64_t v43;
  MTLTexture *constantDisparity;
  MTLTexture *v45;
  void *v46;
  double v47;
  unint64_t v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  unint64_t v53;
  double v54;
  void *v55;
  uint64_t v56;
  PTTextureYUV *backgroundWithSDOF;
  void *v58;
  double v59;
  unint64_t v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  unint64_t v65;
  double v66;
  void *v67;
  uint64_t v68;
  PTTextureYUV *backgroundWithStudioLight;
  uint64_t v70;
  PTPyramid **backgroundTransitionPyramidYUV;
  int v72;
  MTLTexture **colorTemperatureCorrectionYUVCubes;
  char v74;
  char v75;
  PTPyramid *v76;
  id v77;
  double v78;
  double v79;
  double v80;
  uint64_t v81;
  PTPyramid *v82;
  id v83;
  NSObject *v84;
  void *v85;
  uint64_t v86;
  MTLTexture *v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  double v103;
  double v104;
  double v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  PTBackgroundReplacement *v121;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  unint64_t v132;
  PTSpillCorrection *v133;
  PTSpillCorrection *spillCorrection;
  uint8_t *v135;
  id v136;
  double v137;
  id v138;
  id v139;
  _QWORD v140[3];
  int64x2_t v141;
  uint64_t v142;
  objc_super v143;
  uint8_t buf[16];
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v143.receiver = self;
  v143.super_class = (Class)PTBackgroundReplacement;
  v15 = -[PTBackgroundReplacement init](&v143, sel_init);
  v16 = v15;
  if (!v15)
    goto LABEL_33;
  p_metalContext = (id *)&v15->_metalContext;
  objc_storeStrong((id *)&v15->_metalContext, a3);
  objc_storeStrong((id *)&v16->_sharedSDOFRenderRequest, a5);
  objc_storeStrong((id *)&v16->_renderPipeline, a6);
  objc_storeStrong((id *)&v16->_effectDescriptor, a4);
  v16->_backgroundTransisionCount = 0;
  v16->_transitionDuration = 0.8;
  v16->_currentState = 0;
  v16->_lastPresenterOverlayMode = 0;
  -[PTMetalContext computePipelineStateFor:withConstants:](v16->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("backgroundCropAndResize"), 0);
  v18 = objc_claimAutoreleasedReturnValue();
  backgroundCropAndResize = v16->_backgroundCropAndResize;
  v16->_backgroundCropAndResize = (MTLComputePipelineState *)v18;

  if (!v16->_backgroundCropAndResize)
  {
    _PTLogSystem();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      -[PTBackgroundReplacement initWithMetalContext:effectDescriptor:sharedSDOFRenderRequest:renderPipeline:].cold.1(v88, v89, v90, v91, v92, v93, v94, v95);
    goto LABEL_32;
  }
  -[PTMetalContext computePipelineStateFor:withConstants:](v16->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("backgroundReplacement"), 0);
  v20 = objc_claimAutoreleasedReturnValue();
  backgroundReplacement = v16->_backgroundReplacement;
  v16->_backgroundReplacement = (MTLComputePipelineState *)v20;

  if (!v16->_backgroundReplacement)
  {
    _PTLogSystem();
    v88 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
    {
LABEL_32:

LABEL_33:
      v121 = 0;
      goto LABEL_34;
    }
LABEL_23:
    -[PTBackgroundReplacement initWithMetalContext:effectDescriptor:sharedSDOFRenderRequest:renderPipeline:].cold.2(v88, v96, v97, v98, v99, v100, v101, v102);
    goto LABEL_32;
  }
  -[PTMetalContext computePipelineStateFor:withConstants:](v16->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("backgroundReplacementTransition"), 0);
  v22 = objc_claimAutoreleasedReturnValue();
  backgroundReplacementTransition = v16->_backgroundReplacementTransition;
  v16->_backgroundReplacementTransition = (MTLComputePipelineState *)v22;

  if (!v16->_backgroundReplacement)
  {
    _PTLogSystem();
    v88 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      goto LABEL_32;
    goto LABEL_23;
  }
  -[PTMetalContext computePipelineStateFor:withConstants:](v16->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("studiolightBackgroundDimming"), 0);
  v24 = objc_claimAutoreleasedReturnValue();
  studiolightBackgroundDimming = v16->_studiolightBackgroundDimming;
  v16->_studiolightBackgroundDimming = (MTLComputePipelineState *)v24;

  if (!v16->_studiolightBackgroundDimming)
  {
    _PTLogSystem();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      -[PTBackgroundReplacement initWithMetalContext:effectDescriptor:sharedSDOFRenderRequest:renderPipeline:].cold.4(v88, v107, v108, v109, v110, v111, v112, v113);
    goto LABEL_32;
  }
  -[PTMetalContext computePipelineStateFor:withConstants:](v16->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("backgroundReplacementCopyTransition"), 0);
  v26 = objc_claimAutoreleasedReturnValue();
  backgroundReplacementCopyTransition = v16->_backgroundReplacementCopyTransition;
  v16->_backgroundReplacementCopyTransition = (MTLComputePipelineState *)v26;

  if (!v16->_backgroundReplacementCopyTransition)
  {
    _PTLogSystem();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      -[PTBackgroundReplacement initWithMetalContext:effectDescriptor:sharedSDOFRenderRequest:renderPipeline:].cold.5(v88, v114, v115, v116, v117, v118, v119, v120);
    goto LABEL_32;
  }
  v139 = v11;
  v28 = objc_msgSend(v12, "activeEffectType");
  if ((v28 & 4) == 0)
  {
    v29 = -[PTColorTemperatureCorrection initWithMetalContext:]([PTColorTemperatureCorrection alloc], "initWithMetalContext:", v16->_metalContext);
    colorTemperatureCorrection = v16->_colorTemperatureCorrection;
    v16->_colorTemperatureCorrection = v29;

    __asm { FMOV            V0.4S, #1.0 }
    v137 = *(double *)&_Q0;
    -[PTBackgroundReplacement bufferWithContent:](v16, "bufferWithContent:");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v16->_colorTemperatureRGB[0];
    v16->_colorTemperatureRGB[0] = (MTLBuffer *)v36;

    -[PTBackgroundReplacement bufferWithContent:](v16, "bufferWithContent:", v137);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = v16->_colorTemperatureRGB[1];
    v16->_colorTemperatureRGB[1] = (MTLBuffer *)v38;

  }
  v136 = v14;
  v138 = v13;
  v40 = objc_msgSend(v12, "prewarmOnly");
  if ((v40 & 1) == 0)
  {
    v41 = v40;
    -[PTMetalContext textureUtil](v16->_metalContext, "textureUtil");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "createWithWidth:height:pixelFormat:", 2, 2, 25);
    v43 = objc_claimAutoreleasedReturnValue();
    constantDisparity = v16->_constantDisparity;
    v16->_constantDisparity = (MTLTexture *)v43;

    *(_QWORD *)buf = 0x3C003C003C003C00;
    v45 = v16->_constantDisparity;
    memset(v140, 0, sizeof(v140));
    v141 = vdupq_n_s64(2uLL);
    v142 = 1;
    -[MTLTexture replaceRegion:mipmapLevel:withBytes:bytesPerRow:](v45, "replaceRegion:mipmapLevel:withBytes:bytesPerRow:", v140, 0, buf, 4);
    -[PTMetalContext textureUtil](v16->_metalContext, "textureUtil");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "colorSize");
    v48 = (unint64_t)v47;
    objc_msgSend(v12, "colorSize");
    objc_msgSend(v46, "createWithWidth:height:pixelFormat:", v48, (unint64_t)v49, 10);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTMetalContext textureUtil](v16->_metalContext, "textureUtil");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "colorSize");
    v53 = (unint64_t)(v52 * 0.5);
    objc_msgSend(v12, "colorSize");
    objc_msgSend(v51, "createWithWidth:height:pixelFormat:", v53, (unint64_t)(v54 * 0.5), 30);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTTexture createYUV420:chroma:](PTTexture, "createYUV420:chroma:", v50, v55);
    v56 = objc_claimAutoreleasedReturnValue();
    backgroundWithSDOF = v16->_backgroundWithSDOF;
    v16->_backgroundWithSDOF = (PTTextureYUV *)v56;

    -[PTMetalContext textureUtil](v16->_metalContext, "textureUtil");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "colorSize");
    v60 = (unint64_t)v59;
    objc_msgSend(v12, "colorSize");
    objc_msgSend(v58, "createWithWidth:height:pixelFormat:", v60, (unint64_t)v61, 10);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTMetalContext textureUtil](v16->_metalContext, "textureUtil");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "colorSize");
    v65 = (unint64_t)(v64 * 0.5);
    objc_msgSend(v12, "colorSize");
    objc_msgSend(v63, "createWithWidth:height:pixelFormat:", v65, (unint64_t)(v66 * 0.5), 30);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTTexture createYUV420:chroma:](PTTexture, "createYUV420:chroma:", v62, v67);
    v68 = objc_claimAutoreleasedReturnValue();
    backgroundWithStudioLight = v16->_backgroundWithStudioLight;
    v16->_backgroundWithStudioLight = (PTTextureYUV *)v68;

    v40 = v41;
  }
  v70 = 0;
  backgroundTransitionPyramidYUV = v16->_backgroundTransitionPyramidYUV;
  v72 = (v28 >> 2) & 1 | v40;
  v135 = &buf[4];
  colorTemperatureCorrectionYUVCubes = v16->_colorTemperatureCorrectionYUVCubes;
  v74 = 1;
  do
  {
    v75 = v74;
    v76 = [PTPyramid alloc];
    v77 = *p_metalContext;
    objc_msgSend(v12, "colorSize");
    v79 = v78 * 0.5;
    objc_msgSend(v12, "colorSize");
    v81 = -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:](v76, "initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:", v77, 70, 0, 1, 3, v79, v80 * 0.5);
    v82 = backgroundTransitionPyramidYUV[v70];
    backgroundTransitionPyramidYUV[v70] = (PTPyramid *)v81;

    if ((v72 & 1) == 0)
    {
      v83 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
      if (!v83)
      {
        _PTLogSystem();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
          -[PTBackgroundReplacement initWithMetalContext:effectDescriptor:sharedSDOFRenderRequest:renderPipeline:].cold.6(buf, v135, v84);

      }
      objc_msgSend(v83, "setTextureType:", 7, v135);
      objc_msgSend(v83, "setWidth:", 16);
      objc_msgSend(v83, "setHeight:", 16);
      objc_msgSend(v83, "setDepth:", 16);
      objc_msgSend(v83, "setPixelFormat:", 70);
      objc_msgSend(v83, "setUsage:", 3);
      objc_msgSend(*p_metalContext, "device");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "newTextureWithDescriptor:", v83);
      v87 = colorTemperatureCorrectionYUVCubes[v70];
      colorTemperatureCorrectionYUVCubes[v70] = (MTLTexture *)v86;

    }
    v74 = 0;
    v70 = 1;
  }
  while ((v75 & 1) != 0);
  objc_msgSend(v12, "colorSize");
  v104 = v103;
  objc_msgSend(v12, "colorSize");
  v11 = v139;
  v14 = v136;
  if (v104 <= v105)
  {
    objc_msgSend(v12, "colorSize");
    v124 = v123;
    objc_msgSend(v12, "colorSize");
    v106 = vcvtd_n_u64_f64(v124 / v125, 8uLL);
  }
  else
  {
    v106 = 256;
  }
  v13 = v138;
  objc_msgSend(v12, "colorSize", v135);
  v127 = v126;
  objc_msgSend(v12, "colorSize");
  if (v127 <= v128)
  {
    v132 = 256;
  }
  else
  {
    objc_msgSend(v12, "colorSize");
    v130 = v129;
    objc_msgSend(v12, "colorSize");
    v132 = vcvtd_n_u64_f64(v130 / v131, 8uLL);
  }
  v133 = -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:]([PTSpillCorrection alloc], "initWithMetalContext:refinementWidth:refinementHeight:", v16->_metalContext, v106, v132);
  spillCorrection = v16->_spillCorrection;
  v16->_spillCorrection = v133;

  v121 = v16;
LABEL_34:

  return v121;
}

- (void)dealloc
{
  objc_super v3;

  CVPixelBufferRelease(self->_backgroundPixelBuffer);
  CVPixelBufferRelease(self->_backgroundForPresenterOverlaySmallPixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)PTBackgroundReplacement;
  -[PTBackgroundReplacement dealloc](&v3, sel_dealloc);
}

- (id)bufferWithContent:(PTBackgroundReplacement *)self
{
  __int128 v2;
  void *v3;
  void *v4;
  __int128 v6;

  -[PTMetalContext device](self->_metalContext, "device", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newBufferWithBytes:length:options:", &v6, 16, 0);

  return v4;
}

- (id)backgroundBufferCropAndResize:(id)a3 background:(__CVBuffer *)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PTTextureYUV *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PTTextureYUV *v19;
  PTTextureYUV *backgroundCropped;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  float v32;
  float v33;
  float v34;
  unint64_t v35;
  float v36;
  __int128 v37;
  float v38;
  float v39;
  float v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __int128 v45;
  uint64_t v46;
  _QWORD v47[3];
  __int128 v48;
  uint64_t v49;

  -[PTMetalContext device](self->_metalContext, "device", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTTexture createFromPixelbuffer:device:read:write:](PTTexture, "createFromPixelbuffer:device:read:write:", a4, v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PTEffectDescriptor colorSize](self->_effectDescriptor, "colorSize");
  v9 = v8;
  v11 = v10;
  if (v8 == (double)(unint64_t)objc_msgSend(v7, "width")
    && v11 == (double)(unint64_t)objc_msgSend(v7, "height"))
  {
    objc_storeStrong((id *)&self->_backgroundCropped, v7);
    v12 = v7;
  }
  else
  {
    v13 = -[PTTextureYUV width](self->_backgroundCropped, "width");
    if (v13 != objc_msgSend(v7, "width")
      || (v14 = -[PTTextureYUV height](self->_backgroundCropped, "height"), v14 != objc_msgSend(v7, "height")))
    {
      -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "createWithWidth:height:pixelFormat:", (unint64_t)v9, (unint64_t)v11, 10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "createWithWidth:height:pixelFormat:", (unint64_t)(v9 * 0.5), (unint64_t)(v11 * 0.5), 30);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PTTexture createYUV420:chroma:](PTTexture, "createYUV420:chroma:", v16, v18);
      v19 = (PTTextureYUV *)objc_claimAutoreleasedReturnValue();
      backgroundCropped = self->_backgroundCropped;
      self->_backgroundCropped = v19;

    }
    objc_msgSend(v7, "copyMetadataTo:", self->_backgroundCropped);
    -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "computeCommandEncoder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setComputePipelineState:", self->_backgroundCropAndResize);
    objc_msgSend(v7, "texLuma");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTexture:atIndex:", v23, 0);

    objc_msgSend(v7, "texChroma");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTexture:atIndex:", v24, 1);

    -[PTTextureYUV texLuma](self->_backgroundCropped, "texLuma");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTexture:atIndex:", v25, 2);

    -[PTTextureYUV texChroma](self->_backgroundCropped, "texChroma");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setTexture:atIndex:", v26, 3);

    -[PTTextureYUV texLuma](self->_backgroundCropped, "texLuma");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTTextureYUV texChroma](self->_backgroundCropped, "texChroma");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTColorConversion getChromaOffsetFromLuma:texChroma:](PTColorConversion, "getChromaOffsetFromLuma:texChroma:", v27, v28);
    v30 = v29;

    v49 = v30;
    objc_msgSend(v22, "setBytes:length:atIndex:", &v49, 8, 0);
    *(float *)&v30 = (float)(unint64_t)objc_msgSend(v7, "width");
    v31 = *(float *)&v30 / (float)(unint64_t)objc_msgSend(v7, "height");
    v32 = v11;
    v33 = v9 / v32;
    if (v31 <= v33)
    {
      v39 = v9 / (float)(unint64_t)objc_msgSend(v7, "width");
      *(double *)&v37 = (float)((float)(unint64_t)objc_msgSend(v7, "height") * v39);
      v40 = (*(double *)&v37 - v11) * 0.5 / *(double *)&v37;
      LODWORD(v37) = 0;
      *((float *)&v37 + 1) = v40;
      v38 = v40 * -2.0 + 1.0;
      DWORD2(v37) = 1.0;
    }
    else
    {
      v34 = v11 / (float)(unint64_t)objc_msgSend(v7, "height");
      v35 = objc_msgSend(v7, "width");
      *(float *)&v37 = ((float)((float)v35 * v34) - v9) * 0.5 / (float)((float)v35 * v34);
      DWORD1(v37) = 0;
      v36 = *(float *)&v37 * -2.0 + 1.0;
      *((float *)&v37 + 2) = v36;
      v38 = 1.0;
    }
    *((float *)&v37 + 3) = v38;
    v48 = v37;
    objc_msgSend(v22, "setBytes:length:atIndex:", &v48, 16, 1);
    -[PTTextureYUV texLuma](self->_backgroundCropped, "texLuma");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "width");
    -[PTTextureYUV texLuma](self->_backgroundCropped, "texLuma");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v42;
    v47[1] = objc_msgSend(v43, "height");
    v47[2] = 1;
    v45 = xmmword_1C9322A40;
    v46 = 1;
    objc_msgSend(v22, "dispatchThreads:threadsPerThreadgroup:", v47, &v45);

    objc_msgSend(v22, "endEncoding");
    v12 = self->_backgroundCropped;

  }
  return v12;
}

- (int)applyPortraitBlur:(id)a3 inColorBuffer:(id)a4 inBackgroundBuffer:(id)a5 effectRenderRequest:(id)a6
{
  PTBackgroundReplacement *v9;
  PTTextureYUV *backgroundWithSDOF;
  id v11;
  id v12;
  id v13;
  int v14;
  int v15;
  double v16;

  v9 = self;
  backgroundWithSDOF = self->_backgroundWithSDOF;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  objc_msgSend(a4, "copyMetadataTo:", backgroundWithSDOF);
  -[PTRenderRequest setSourceColor:](v9->_sharedSDOFRenderRequest, "setSourceColor:", v12);

  -[PTRenderRequest setDestinationColor:](v9->_sharedSDOFRenderRequest, "setDestinationColor:", v9->_backgroundWithSDOF);
  -[PTRenderRequest setSourceDisparity:](v9->_sharedSDOFRenderRequest, "setSourceDisparity:", v9->_constantDisparity);
  objc_msgSend(v11, "remappedAperture");
  v15 = v14;

  LODWORD(v16) = v15;
  -[PTRenderRequest setFNumber:](v9->_sharedSDOFRenderRequest, "setFNumber:", v16);
  LODWORD(v9) = -[PTRenderPipeline encodeRenderTo:withRenderRequest:](v9->_renderPipeline, "encodeRenderTo:withRenderRequest:", v13, v9->_sharedSDOFRenderRequest);

  return (int)v9;
}

- (void)studioLightBackgroundDimming:(id)a3 inCurrentBackground:(id)a4 effectRenderRequest:(id)a5 outColorBufferYUV:(id)a6
{
  PTTextureYUV *backgroundWithStudioLight;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  uint64_t v26;
  _QWORD v27[3];
  int v28;
  uint64_t v29;

  backgroundWithStudioLight = self->_backgroundWithStudioLight;
  v9 = a5;
  v10 = a4;
  -[PTTextureYUV texLuma](backgroundWithStudioLight, "texLuma");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTTextureYUV texChroma](self->_backgroundWithStudioLight, "texChroma");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTColorConversion getChromaOffsetFromLuma:texChroma:](PTColorConversion, "getChromaOffsetFromLuma:texChroma:", v11, v12);
  v14 = v13;

  v29 = v14;
  objc_msgSend(v9, "relightStrengthStudioLight");
  LODWORD(v14) = v15;

  v28 = v14;
  -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "computeCommandEncoder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setComputePipelineState:", self->_studiolightBackgroundDimming);
  objc_msgSend(v10, "texLuma");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTexture:atIndex:", v18, 0);

  objc_msgSend(v10, "texChroma");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setTexture:atIndex:", v19, 1);
  -[PTTextureYUV texLuma](self->_backgroundWithStudioLight, "texLuma");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTexture:atIndex:", v20, 2);

  -[PTTextureYUV texChroma](self->_backgroundWithStudioLight, "texChroma");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTexture:atIndex:", v21, 3);

  objc_msgSend(v17, "setBytes:length:atIndex:", &v29, 8, 0);
  objc_msgSend(v17, "setBytes:length:atIndex:", &v28, 4, 1);
  -[PTTextureYUV texLuma](self->_backgroundWithStudioLight, "texLuma");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "width");
  -[PTTextureYUV texLuma](self->_backgroundWithStudioLight, "texLuma");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v23;
  v27[1] = objc_msgSend(v24, "height");
  v27[2] = 1;
  v25 = xmmword_1C9322A40;
  v26 = 1;
  objc_msgSend(v17, "dispatchThreads:threadsPerThreadgroup:", v27, &v25);

  objc_msgSend(v17, "endEncoding");
}

- (int)replaceBackground:(id)a3 inYUV:(id)a4 inSegmentation:(id)a5 effectRenderRequest:(id)a6 outYUV:(id)a7 frameIndex:(int)a8
{
  uint64_t v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  __CVBuffer *v19;
  __CVBuffer *backgroundPixelBuffer;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *p_super;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  float v37;
  float v38;
  float v39;
  id v40;
  float v41;
  _BOOL4 v42;
  uint64_t v43;
  _BOOL4 v44;
  PTTextureYUV *v45;
  float v46;
  float v47;
  double v48;
  void *v49;
  double v50;
  PTColorTemperatureCorrection *colorTemperatureCorrection;
  void *v52;
  void *v53;
  int v54;
  int backgroundTransisionCount;
  char v56;
  BOOL v57;
  char v58;
  int v59;
  int v60;
  PTPyramid **backgroundTransitionPyramidYUV;
  int v62;
  MTLTexture *v63;
  int v64;
  int v65;
  int v66;
  PTTextureYUV *v67;
  PTTextureYUV *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  int v73;
  double v74;
  float v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  PTSpillCorrection *spillCorrection;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  BOOL v89;
  char v90;
  _BOOL8 v91;
  unint64_t lastPresenterOverlayMode;
  PTImageblockConfig *v93;
  float v94;
  float v95;
  PTBackgroundReplacementInterpolation *p_interpolation;
  void *v97;
  void *v98;
  BOOL v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  int v120;
  void *v121;
  void *v122;
  _QWORD *v123;
  _QWORD *v124;
  MTLTexture **colorTemperatureCorrectionYUVCubes;
  uint64_t v127;
  id v128;
  MTLTexture *v129;
  MTLTexture *v130;
  uint64_t v131;
  void *v132;
  char v133;
  int v134;
  char v135;
  PTImageblockConfig *v136;
  _BOOL4 v137;
  void *v138;
  void *v139;
  id v140;
  _QWORD v141[3];
  _QWORD v142[3];
  _QWORD v143[3];
  _QWORD v144[3];
  double v145;
  _OWORD v146[4];

  v8 = *(_QWORD *)&a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (__CVBuffer *)objc_msgSend(v17, "inBackgroundReplacementBuffer");
  backgroundPixelBuffer = self->_backgroundPixelBuffer;
  if (self->_currentState == 3)
  {
    v19 = self->_backgroundPixelBuffer;
  }
  else if (backgroundPixelBuffer != v19)
  {
    CVPixelBufferRelease(backgroundPixelBuffer);
    self->_backgroundPixelBuffer = CVPixelBufferRetain(v19);
  }
  if (v19)
  {
    if (v17)
      objc_msgSend(v17, "transform");
    else
      memset(v146, 0, 48);
    if (+[PTUtil getRotationDegreesFromAffineTransform:](PTUtil, "getRotationDegreesFromAffineTransform:", v146))
    {
      _PTLogSystem();
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        -[PTBackgroundReplacement replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:].cold.4();
      v29 = -10;
      goto LABEL_133;
    }
    v140 = v14;
    v133 = objc_msgSend(v17, "effectType");
    v135 = objc_msgSend(v17, "effectType");
    objc_msgSend(v15, "texLuma");
    v30 = v15;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "texLuma");
    v32 = objc_claimAutoreleasedReturnValue();
    v139 = v30;
    if (v31 == (void *)v32)
    {

    }
    else
    {
      v33 = (void *)v32;
      objc_msgSend(v30, "texChroma");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "texChroma");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34 != v35)
      {
LABEL_23:
        v37 = -1.0;
        v38 = -1.0;
        if ((v133 & 1) != 0)
        {
          objc_msgSend(v17, "apertureSDOF");
          v38 = v39;
        }
        v40 = v140;
        if ((v135 & 2) != 0)
        {
          objc_msgSend(v17, "relightStrengthStudioLight");
          v37 = v41;
        }
        v42 = (*(_QWORD *)&self->_lastBackgroundCroppedKey.apertureSDOF & 0x7FFFFFFF7FFFFFFFLL) != 0
           || v19 != self->_lastBackgroundCroppedKey.backgroundReplacementBuffer;
        v43 = *(_QWORD *)&self->_lastEffectUpdateKey.apertureSDOF;
        v44 = v38 != *(float *)&v43
           || v37 != *((float *)&v43 + 1)
           || v19 != self->_lastEffectUpdateKey.backgroundReplacementBuffer;
        v137 = v44;
        *(_QWORD *)&self->_lastBackgroundCroppedKey.apertureSDOF = 0;
        self->_lastBackgroundCroppedKey.backgroundReplacementBuffer = v19;
        self->_lastEffectUpdateKey.apertureSDOF = v38;
        self->_lastEffectUpdateKey.relightStrengthStudioLight = v37;
        self->_lastEffectUpdateKey.backgroundReplacementBuffer = v19;
        v45 = self->_backgroundCropped;
        -[PTBackgroundReplacement updateAndGetBackgroundState:frameIndex:](self, "updateAndGetBackgroundState:frameIndex:", v17, v8);
        -[PTBackgroundReplacement transitionTimeNormalized:](self, "transitionTimeNormalized:", v17);
        v47 = v46;
        if (v42)
        {
          -[PTBackgroundReplacement backgroundBufferCropAndResize:background:](self, "backgroundBufferCropAndResize:background:", v140, v19);
          p_super = objc_claimAutoreleasedReturnValue();

          ++self->_backgroundTransisionCount;
          if (v47 < 1.0 && v47 > 0.01 && self->_currentState == 4)
            -[PTBackgroundReplacement copyInterruptedTransitionToTransitionPyramid:](self, "copyInterruptedTransitionToTransitionPyramid:", v140);
          if ((_DWORD)v8)
          {
            if (self->_currentState == 1)
              self->_currentState = 4;
            objc_msgSend(v17, "frameTimeSeconds");
            *(float *)&v48 = v48;
            self->_transitionStart = *(float *)&v48;
            v47 = 0.0;
          }
          else
          {
            objc_msgSend(v17, "frameTimeSeconds");
            *(float *)&v50 = v50 + self->_transitionDuration * -2.0;
            self->_transitionStart = *(float *)&v50;
            self->_currentState = 1;
            v47 = 1.0;
          }
          colorTemperatureCorrection = self->_colorTemperatureCorrection;
          -[NSObject texLuma](p_super, "texLuma");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject texChroma](p_super, "texChroma");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          if (self->_backgroundTransisionCount >= 0)
            v54 = self->_backgroundTransisionCount & 1;
          else
            v54 = -(self->_backgroundTransisionCount & 1);
          -[PTColorTemperatureCorrection estimateColorTemperatureFromBackground:inYUV:inBackgroundLuma:inBackgroundChroma:outColorTemperatureBuffer:](colorTemperatureCorrection, "estimateColorTemperatureFromBackground:inYUV:inBackgroundLuma:inBackgroundChroma:outColorTemperatureBuffer:", v140, v139, v52, v53, self->_colorTemperatureRGB[v54]);

          v40 = v140;
          v49 = v139;
        }
        else
        {
          p_super = &v45->super.super;
          v49 = v139;
        }
        backgroundTransisionCount = self->_backgroundTransisionCount;
        if (backgroundTransisionCount == 1 || (self->_currentState & 0xFFFFFFFFFFFFFFFELL) == 2)
        {
          v132 = 0;
          v56 = 1;
        }
        else
        {
          v57 = __OFADD__(backgroundTransisionCount, 1);
          v59 = backgroundTransisionCount + 1;
          v58 = (v59 < 0) ^ v57;
          v60 = v59 & 1;
          if (v58)
            v60 = -v60;
          -[PTPyramid mipmapTexture](self->_backgroundTransitionPyramidYUV[v60], "mipmapTexture");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = 0;
        }
        backgroundTransitionPyramidYUV = self->_backgroundTransitionPyramidYUV;
        if (self->_backgroundTransisionCount >= 0)
          v62 = self->_backgroundTransisionCount & 1;
        else
          v62 = -(self->_backgroundTransisionCount & 1);
        -[PTPyramid mipmapTexture](backgroundTransitionPyramidYUV[v62], "mipmapTexture");
        v131 = objc_claimAutoreleasedReturnValue();
        if ((v56 & 1) != 0)
        {
          v63 = 0;
        }
        else
        {
          v64 = self->_backgroundTransisionCount;
          v57 = __OFADD__(v64++, 1);
          v58 = (v64 < 0) ^ v57;
          v65 = v64 & 1;
          if (v58)
            v65 = -v65;
          v63 = self->_colorTemperatureCorrectionYUVCubes[v65];
        }
        v130 = v63;
        if (self->_backgroundTransisionCount >= 0)
          v66 = self->_backgroundTransisionCount & 1;
        else
          v66 = -(self->_backgroundTransisionCount & 1);
        colorTemperatureCorrectionYUVCubes = self->_colorTemperatureCorrectionYUVCubes;
        v129 = self->_colorTemperatureCorrectionYUVCubes[v66];
        if ((v133 & 1) != 0)
        {
          if (v137)
            v134 = -[PTBackgroundReplacement applyPortraitBlur:inColorBuffer:inBackgroundBuffer:effectRenderRequest:](self, "applyPortraitBlur:inColorBuffer:inBackgroundBuffer:effectRenderRequest:", v40, v49, p_super, v17);
          else
            v134 = 0;
          v67 = self->_backgroundWithSDOF;

          p_super = &v67->super.super;
        }
        else
        {
          v134 = 0;
        }
        if ((v135 & 2) != 0)
        {
          if (v137)
            -[PTBackgroundReplacement studioLightBackgroundDimming:inCurrentBackground:effectRenderRequest:outColorBufferYUV:](self, "studioLightBackgroundDimming:inCurrentBackground:effectRenderRequest:outColorBufferYUV:", v40, p_super, v17, v18);
          v68 = self->_backgroundWithStudioLight;

          p_super = &v68->super.super;
        }
        v128 = v16;
        if (v137)
        {
          -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject texLuma](p_super, "texLuma");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject texChroma](p_super, "texChroma");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "resample420To444:inLuma:inChroma:outYUV:", v140, v70, v71, v131);

          if (self->_backgroundTransisionCount >= 0)
            v73 = self->_backgroundTransisionCount & 1;
          else
            v73 = -(self->_backgroundTransisionCount & 1);
          LODWORD(v72) = 1.5;
          -[PTPyramid updatePyramid:offset:samplingRadius:](backgroundTransitionPyramidYUV[v73], "updatePyramid:offset:samplingRadius:", v140, 0, v72, colorTemperatureCorrectionYUVCubes);
          v74 = 1.0;
          if ((v135 & 2) != 0)
          {
            objc_msgSend(v17, "relightStrengthStudioLight", 1.0);
            v74 = v75 * -0.5 + 1.0;
          }
          *(float *)&v74 = v74;
          if (self->_backgroundTransisionCount >= 0)
            v76 = self->_backgroundTransisionCount & 1;
          else
            v76 = -(self->_backgroundTransisionCount & 1);
          -[PTColorTemperatureCorrection colorTemperatureCorrectionYUVCube:inYUV:outColorTemperatureCorrectionCube:colorTemperatureRGB:colorCorrectionIntensity:](self->_colorTemperatureCorrection, "colorTemperatureCorrectionYUVCube:inYUV:outColorTemperatureCorrectionCube:colorTemperatureRGB:colorCorrectionIntensity:", v140, v18, colorTemperatureCorrectionYUVCubes[v76], self->_colorTemperatureRGB[v76], v74);
          v16 = v128;
          v49 = v139;
        }
        objc_msgSend(v49, "texLuma", colorTemperatureCorrectionYUVCubes);
        v77 = v49;
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "texChroma");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        +[PTColorConversion getChromaOffsetFromLuma:texChroma:](PTColorConversion, "getChromaOffsetFromLuma:texChroma:", v78, v79);
        v81 = v80;

        v145 = v81;
        spillCorrection = self->_spillCorrection;
        objc_msgSend(v77, "texLuma");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "texChroma");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[PTSpillCorrection encodeToCommandBuffer:lumaTexture:chromaTexture:normChromaOffset:segmentationTexture:](spillCorrection, "encodeToCommandBuffer:lumaTexture:chromaTexture:normChromaOffset:segmentationTexture:", v140, v83, v84, v16, v81);

        if ((objc_msgSend(v17, "effectType") & 4) != 0
          && (objc_msgSend(v17, "presenterOverlayMode") == 3 || objc_msgSend(v17, "presenterOverlayMode") == 4))
        {
          -[PTBackgroundReplacement lazyInitializeBackgroundForPresenterOverlaySmall:](self, "lazyInitializeBackgroundForPresenterOverlaySmall:", v19);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "width");
          if (v86 != objc_msgSend(v18, "width")
            || (v87 = objc_msgSend(v85, "height"), v87 != objc_msgSend(v18, "height")))
          {
            _PTLogSystem();
            v88 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
              -[PTBackgroundReplacement replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:].cold.2();

            v85 = 0;
          }
          objc_msgSend(v17, "setOutBackgroundReplacementPostProcessingBuffer:", self->_backgroundForPresenterOverlaySmallPixelBuffer);
          if (!v132)
            v47 = 1.0;
        }
        else
        {
          v85 = 0;
        }
        v89 = objc_msgSend(v17, "presenterOverlayMode") != 3 && objc_msgSend(v17, "presenterOverlayMode") != 2;
        v90 = v47 < 1.0 || v137;
        if ((v90 & 1) != 0)
        {
          v91 = 1;
        }
        else
        {
          lastPresenterOverlayMode = self->_lastPresenterOverlayMode;
          v91 = lastPresenterOverlayMode != objc_msgSend(v17, "presenterOverlayMode");
        }
        objc_msgSend(v17, "setOutBackgroundReplacementPostProcessingBufferUpdated:", v91);
        if ((objc_msgSend(v17, "outBackgroundReplacementPostProcessingBufferUpdated") & 1) == 0)
        {

          v85 = 0;
        }
        v138 = v85;
        self->_lastPresenterOverlayMode = objc_msgSend(v17, "presenterOverlayMode");
        v93 = -[PTImageblockConfig initWithPTTexture:]([PTImageblockConfig alloc], "initWithPTTexture:", v18);
        if (v47 >= 1.0)
        {
          -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v105, "computeCommandEncoder");
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v98, "setComputePipelineState:", self->_backgroundReplacement);
          objc_msgSend(v98, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v93, "imageblockSize"), -[PTImageblockConfig imageblockSize](v93, "imageblockSize"));
          objc_msgSend(v139, "texLuma");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v106, 0);

          objc_msgSend(v139, "texChroma");
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v107, 1);

          objc_msgSend(v98, "setTexture:atIndex:", v16, 2);
          -[NSObject texLuma](p_super, "texLuma");
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v108, 3);

          -[NSObject texChroma](p_super, "texChroma");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v109, 4);

          if (v89)
          {
            objc_msgSend(v18, "texLuma");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setTexture:atIndex:", v110, 5);

            objc_msgSend(v18, "texChroma");
            v111 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setTexture:atIndex:", v111, 6);

          }
          else
          {
            objc_msgSend(v98, "setTexture:atIndex:", 0, 5);
            objc_msgSend(v98, "setTexture:atIndex:", 0, 6);
          }
          v102 = (void *)v131;
          v29 = v134;
          -[PTSpillCorrection coeffXTexture](self->_spillCorrection, "coeffXTexture");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v117, 7);

          -[PTSpillCorrection coeffYTexture](self->_spillCorrection, "coeffYTexture");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v118, 8);

          -[PTSpillCorrection coeffZTexture](self->_spillCorrection, "coeffZTexture");
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v119, 9);

          if (self->_colorTemperatureCorrectionYUVCubes[0])
          {
            if (self->_backgroundTransisionCount >= 0)
              v120 = self->_backgroundTransisionCount & 1;
            else
              v120 = -(self->_backgroundTransisionCount & 1);
            objc_msgSend(v98, "setTexture:atIndex:", *(_QWORD *)(v127 + 8 * v120), 10);
          }
          objc_msgSend(v138, "texLuma");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v121, 11);

          objc_msgSend(v138, "texChroma");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v122, 12);

          objc_msgSend(v98, "setBytes:length:atIndex:", &v145, 8, 0);
          v15 = v139;
          if (v93)
          {
            -[PTImageblockConfig threads](v93, "threads");
            -[PTImageblockConfig threadsPerGroup](v93, "threadsPerGroup");
          }
          else
          {
            memset(v142, 0, sizeof(v142));
            memset(v141, 0, sizeof(v141));
          }
          v123 = v142;
          v124 = v141;
        }
        else
        {
          v94 = 1.0 - v47;
          if (self->_currentState != 3)
            v94 = v47;
          v95 = fminf(fmaxf((float)(v94 + -0.05) / 0.9, 0.0), 1.0);
          self->_interpolation.alphaBlend = (float)(v95 * v95) * (float)((float)(v95 * -2.0) + 3.0);
          p_interpolation = &self->_interpolation;
          self->_interpolation.lodLevel = 0.0;
          -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "computeCommandEncoder");
          v98 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v98, "setComputePipelineState:", self->_backgroundReplacementTransition);
          v136 = v93;
          objc_msgSend(v98, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v93, "imageblockSize"), -[PTImageblockConfig imageblockSize](v93, "imageblockSize"));
          v99 = v89;
          objc_msgSend(v139, "texLuma");
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v100, 0);

          objc_msgSend(v139, "texChroma");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v101, 1);

          objc_msgSend(v98, "setTexture:atIndex:", v16, 2);
          objc_msgSend(v98, "setTexture:atIndex:", v132, 3);
          v102 = (void *)v131;
          objc_msgSend(v98, "setTexture:atIndex:");
          if (v99)
          {
            objc_msgSend(v18, "texLuma");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setTexture:atIndex:", v103, 5);

            objc_msgSend(v18, "texChroma");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setTexture:atIndex:", v104, 6);

          }
          else
          {
            objc_msgSend(v98, "setTexture:atIndex:", 0, 5);
            objc_msgSend(v98, "setTexture:atIndex:", 0, 6);
          }
          v16 = v128;
          v93 = v136;
          -[PTSpillCorrection coeffXTexture](self->_spillCorrection, "coeffXTexture");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v112, 7);

          -[PTSpillCorrection coeffYTexture](self->_spillCorrection, "coeffYTexture");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v113, 8);

          -[PTSpillCorrection coeffZTexture](self->_spillCorrection, "coeffZTexture");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v114, 9);

          if (self->_colorTemperatureCorrectionYUVCubes[0])
          {
            objc_msgSend(v98, "setTexture:atIndex:", v130, 10);
            objc_msgSend(v98, "setTexture:atIndex:", v129, 11);
          }
          objc_msgSend(v138, "texLuma");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v115, 12);

          objc_msgSend(v138, "texChroma");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "setTexture:atIndex:", v116, 13);

          objc_msgSend(v98, "setBytes:length:atIndex:", &v145, 8, 0);
          objc_msgSend(v98, "setBytes:length:atIndex:", p_interpolation, 8, 1);
          v15 = v139;
          if (v136)
          {
            -[PTImageblockConfig threads](v136, "threads");
            -[PTImageblockConfig threadsPerGroup](v136, "threadsPerGroup");
          }
          else
          {
            memset(v144, 0, sizeof(v144));
            memset(v143, 0, sizeof(v143));
          }
          v29 = v134;
          v123 = v144;
          v124 = v143;
        }
        objc_msgSend(v98, "dispatchThreads:threadsPerThreadgroup:", v123, v124);
        objc_msgSend(v98, "endEncoding");

        v14 = v140;
        goto LABEL_133;
      }
    }
    _PTLogSystem();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[PTBackgroundReplacement replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:].cold.3();

    goto LABEL_23;
  }
  _PTLogSystem();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    -[PTBackgroundReplacement replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:].cold.1();

  -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "texLuma");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "texLuma");
  v24 = v15;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "copy:inTex:outTex:", v14, v23, v25);

  v15 = v24;
  -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
  p_super = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "texChroma");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "texChroma");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject copy:inTex:outTex:](p_super, "copy:inTex:outTex:", v14, v27, v28);

  v29 = 0;
LABEL_133:

  return v29;
}

- (id)lazyInitializeBackgroundForPresenterOverlaySmall:(__CVBuffer *)a3
{
  __CVBuffer **p_backgroundForPresenterOverlaySmallPixelBuffer;
  const __CFAllocator *v6;
  double v7;
  size_t v8;
  double v9;
  size_t v10;
  OSType PixelFormatType;
  __CVBuffer *v12;
  void *v13;
  PTTextureYUV *v14;
  PTTextureYUV *backgroundForPresenterOverlaySmall;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!self->_backgroundForPresenterOverlaySmall)
  {
    p_backgroundForPresenterOverlaySmallPixelBuffer = &self->_backgroundForPresenterOverlaySmallPixelBuffer;
    CVPixelBufferRelease(self->_backgroundForPresenterOverlaySmallPixelBuffer);
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    -[PTEffectDescriptor colorSize](self->_effectDescriptor, "colorSize");
    v8 = (unint64_t)v7;
    -[PTEffectDescriptor colorSize](self->_effectDescriptor, "colorSize");
    v10 = (unint64_t)v9;
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    v17 = *MEMORY[0x1E0CA8FF0];
    v18[0] = MEMORY[0x1E0C9AA70];
    CVPixelBufferCreate(v6, v8, v10, PixelFormatType, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1), &self->_backgroundForPresenterOverlaySmallPixelBuffer);
    v12 = *p_backgroundForPresenterOverlaySmallPixelBuffer;
    -[PTMetalContext device](self->_metalContext, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PTTexture createFromPixelbuffer:device:read:write:](PTTexture, "createFromPixelbuffer:device:read:write:", v12, v13, 0, 1);
    v14 = (PTTextureYUV *)objc_claimAutoreleasedReturnValue();
    backgroundForPresenterOverlaySmall = self->_backgroundForPresenterOverlaySmall;
    self->_backgroundForPresenterOverlaySmall = v14;

  }
  CVBufferRemoveAllAttachments(self->_backgroundForPresenterOverlaySmallPixelBuffer);
  CVBufferPropagateAttachments(a3, self->_backgroundForPresenterOverlaySmallPixelBuffer);
  return self->_backgroundForPresenterOverlaySmall;
}

- (void)copyInterruptedTransitionToTransitionPyramid:(id)a3
{
  id v4;
  PTImageblockConfig *v5;
  PTPyramid **backgroundTransitionPyramidYUV;
  void *v7;
  PTImageblockConfig *v8;
  void *v9;
  int v10;
  void *v11;
  int backgroundTransisionCount;
  BOOL v13;
  char v14;
  int v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  double v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  v5 = [PTImageblockConfig alloc];
  backgroundTransitionPyramidYUV = self->_backgroundTransitionPyramidYUV;
  -[PTPyramid mipmapTexture](self->_backgroundTransitionPyramidYUV[0], "mipmapTexture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PTImageblockConfig initWithTexture:](v5, "initWithTexture:", v7);

  objc_msgSend(v4, "computeCommandEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setComputePipelineState:", self->_backgroundReplacementCopyTransition);
  objc_msgSend(v9, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v8, "imageblockSize"), -[PTImageblockConfig imageblockSize](v8, "imageblockSize"));
  if (self->_backgroundTransisionCount >= 0)
    v10 = self->_backgroundTransisionCount & 1;
  else
    v10 = -(self->_backgroundTransisionCount & 1);
  -[PTPyramid mipmapTexture](backgroundTransitionPyramidYUV[v10], "mipmapTexture");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTexture:atIndex:", v11, 0);

  backgroundTransisionCount = self->_backgroundTransisionCount;
  v13 = __OFADD__(backgroundTransisionCount++, 1);
  v14 = (backgroundTransisionCount < 0) ^ v13;
  v15 = backgroundTransisionCount & 1;
  if (v14)
    v15 = -v15;
  -[PTPyramid mipmapTexture](backgroundTransitionPyramidYUV[v15], "mipmapTexture");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTexture:atIndex:", v16, 1);

  v17 = self->_backgroundTransisionCount;
  v13 = __OFADD__(v17++, 1);
  v14 = (v17 < 0) ^ v13;
  v18 = v17 & 1;
  if (v14)
    v18 = -v18;
  -[PTPyramid mipmapTexture](backgroundTransitionPyramidYUV[v18], "mipmapTexture");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTexture:atIndex:", v19, 2);

  objc_msgSend(v9, "setBytes:length:atIndex:", &self->_interpolation, 8, 0);
  if (v8)
  {
    -[PTImageblockConfig threads](v8, "threads");
    -[PTImageblockConfig threadsPerGroup](v8, "threadsPerGroup");
  }
  else
  {
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v24 = 0;
    v25 = 0;
    v23 = 0;
  }
  objc_msgSend(v9, "dispatchThreads:threadsPerThreadgroup:", &v26, &v23);
  objc_msgSend(v9, "endEncoding");
  v21 = self->_backgroundTransisionCount;
  v13 = __OFADD__(v21++, 1);
  v14 = (v21 < 0) ^ v13;
  v22 = v21 & 1;
  if (v14)
    v22 = -v22;
  LODWORD(v20) = 1.5;
  -[PTPyramid updatePyramid:offset:samplingRadius:](backgroundTransitionPyramidYUV[v22], "updatePyramid:offset:samplingRadius:", v4, 0, v20, v23, v24, v25, v26, v27, v28);

}

- (float)transitionTimeNormalized:(id)a3
{
  double v4;

  objc_msgSend(a3, "frameTimeSeconds");
  *(float *)&v4 = v4 - self->_transitionStart;
  return *(float *)&v4 / self->_transitionDuration;
}

- (unint64_t)updateAndGetBackgroundState:(id)a3 frameIndex:(int)a4
{
  id v6;
  void *v7;
  char v8;
  float v9;
  double v10;
  unint64_t *p_currentState;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  unint64_t v19;
  NSObject *v20;
  double v21;
  NSObject *v22;
  float v23;
  unint64_t v24;
  unint64_t v25;

  v6 = a3;
  v7 = v6;
  if (!a4 && (objc_msgSend(v6, "effectType") & 0x40) != 0)
  {
    if (objc_msgSend(v7, "inBackgroundReplacementBuffer"))
    {
      objc_msgSend(v7, "frameTimeSeconds");
      *(float *)&v15 = v15 + self->_transitionDuration * -2.0;
      self->_transitionStart = *(float *)&v15;
      self->_currentState = 1;
    }
    else
    {
      _PTLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PTBackgroundReplacement updateAndGetBackgroundState:frameIndex:].cold.2();

    }
    p_currentState = &self->_currentState;
  }
  else
  {
    v8 = objc_msgSend(v7, "effectType");
    -[PTBackgroundReplacement transitionTimeNormalized:](self, "transitionTimeNormalized:", v7);
    v10 = 0.0;
    if (v9 < 1.0)
      v10 = (float)((float)(1.0 - v9) * self->_transitionDuration);
    p_currentState = &self->_currentState;
    switch(self->_currentState)
    {
      case 0uLL:
      case 3uLL:
        if ((v8 & 0x40) != 0)
        {
          if (objc_msgSend(v7, "inBackgroundReplacementBuffer"))
          {
            if ((objc_msgSend(v7, "effectType") & 4) == 0
              || (objc_msgSend(v7, "inScreenCaptureRect"), v12 <= 0.8)
              && (objc_msgSend(v7, "inScreenCaptureRect"), v13 <= 0.8))
            {
              objc_msgSend(v7, "frameTimeSeconds");
              *(float *)&v21 = v21 - v10;
              self->_transitionStart = *(float *)&v21;
              v19 = 2;
              goto LABEL_26;
            }
            self->_currentState = 1;
            objc_msgSend(v7, "frameTimeSeconds");
            *(float *)&v14 = v14 + self->_transitionDuration * -2.0;
            self->_transitionStart = *(float *)&v14;
          }
          else
          {
            _PTLogSystem();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              -[PTBackgroundReplacement updateAndGetBackgroundState:frameIndex:].cold.1();

          }
        }
        break;
      case 1uLL:
        if ((v8 & 0x40) == 0)
        {
          objc_msgSend(v7, "frameTimeSeconds");
          goto LABEL_18;
        }
        break;
      case 2uLL:
        if ((v8 & 0x40) == 0)
        {
          objc_msgSend(v7, "frameTimeSeconds");
          v16 = v17 - v10;
LABEL_18:
          v18 = v16;
          self->_transitionStart = v18;
          v19 = 3;
LABEL_26:
          self->_currentState = v19;
        }
        break;
      case 4uLL:
        if ((v8 & 0x40) == 0)
          *p_currentState = 3;
        break;
      default:
        break;
    }
    -[PTBackgroundReplacement transitionTimeNormalized:](self, "transitionTimeNormalized:", v7);
    if (v23 >= 1.0)
    {
      v24 = *p_currentState;
      if (*p_currentState == 4)
        goto LABEL_34;
      if (v24 == 3)
      {
        *p_currentState = 0;
        goto LABEL_36;
      }
      if (v24 == 2)
LABEL_34:
        *p_currentState = 1;
    }
  }
LABEL_36:
  v25 = *p_currentState;

  return v25;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;

  objc_storeStrong((id *)&self->_spillCorrection, 0);
  objc_storeStrong((id *)&self->_renderPipeline, 0);
  objc_storeStrong((id *)&self->_sharedSDOFRenderRequest, 0);
  objc_storeStrong((id *)&self->_constantDisparity, 0);
  objc_storeStrong((id *)&self->_colorTemperatureCorrection, 0);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_colorTemperatureCorrectionYUVCubes[i + 1], 0);
  for (j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_colorTemperatureRGB[j + 1], 0);
  for (k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_backgroundTransitionPyramidYUV[k + 1], 0);
  objc_storeStrong((id *)&self->_backgroundForPresenterOverlaySmall, 0);
  objc_storeStrong((id *)&self->_backgroundWithStudioLight, 0);
  objc_storeStrong((id *)&self->_backgroundWithSDOF, 0);
  objc_storeStrong((id *)&self->_backgroundCropped, 0);
  objc_storeStrong((id *)&self->_effectDescriptor, 0);
  objc_storeStrong((id *)&self->_backgroundReplacementCopyTransition, 0);
  objc_storeStrong((id *)&self->_backgroundReplacementTransition, 0);
  objc_storeStrong((id *)&self->_backgroundReplacement, 0);
  objc_storeStrong((id *)&self->_studiolightBackgroundDimming, 0);
  objc_storeStrong((id *)&self->_backgroundCropAndResize, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 effectDescriptor:(uint64_t)a4 sharedSDOFRenderRequest:(uint64_t)a5 renderPipeline:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 effectDescriptor:(uint64_t)a4 sharedSDOFRenderRequest:(uint64_t)a5 renderPipeline:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 effectDescriptor:(uint64_t)a4 sharedSDOFRenderRequest:(uint64_t)a5 renderPipeline:(uint64_t)a6 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 effectDescriptor:(uint64_t)a4 sharedSDOFRenderRequest:(uint64_t)a5 renderPipeline:(uint64_t)a6 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(os_log_t)log effectDescriptor:sharedSDOFRenderRequest:renderPipeline:.cold.6(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "texDesc";
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "Assertion failed %s", buf, 0xCu);
}

- (void)replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "background is NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Invalid size of outPresenterOverlaySmallYUV", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Unexpected read write access to input/output texture", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)replaceBackground:inYUV:inSegmentation:effectRenderRequest:outYUV:frameIndex:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Only 0 rotation supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)updateAndGetBackgroundState:frameIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Requesting background replacement with inBackgroundReplacementBuffer being NULL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

- (void)updateAndGetBackgroundState:frameIndex:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, v0, v1, "Requesting background replacement with inBackgroundReplacementBuffer being NULL for initial frame", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_12();
}

@end
