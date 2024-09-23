@implementation PTRaytracingV14

- (PTRaytracingV14)initWithMetalContext:(id)a3 renderEffects:(id)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6 debugRendering:(int64_t)a7 verbose:(BOOL)a8 options:(id)a9 quality:(int)a10
{
  CGFloat height;
  CGFloat width;
  double v15;
  double v16;
  id v19;
  id v20;
  PTRaytracingV14 *v21;
  float v22;
  float v23;
  float v24;
  float v25;
  PTColorConversion *v26;
  PTColorConversion *colorConversion;
  PTRaytracingUtilsV1 *v28;
  PTRaytracingUtilsV1 *raytracingUtils;
  PTUtil *v30;
  PTUtil *util;
  void *v32;
  uint64_t v33;
  PTPyramid *rgbaPyramid;
  NSObject *v35;
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
  PTPyramid *v57;
  PTMetalContext *metalContext;
  void *v59;
  uint64_t v60;
  PTPyramid *v61;
  PTRaytracingV14RenderState *v62;
  PTUtil *v63;
  void *v64;
  uint64_t v65;
  NSDictionary *options;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  PTRaytracingV14RenderState *renderState;
  PTRaytracingV14 *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  PTMetalContext *v88;
  PTRaytracingV14RenderState *v89;
  unsigned int v90;
  objc_super v91;

  height = a6.height;
  width = a6.width;
  v15 = a5.height;
  v16 = a5.width;
  v19 = a3;
  v20 = a9;
  v91.receiver = self;
  v91.super_class = (Class)PTRaytracingV14;
  v21 = -[PTRaytracingV14 init](&v91, sel_init);
  if (!v21)
    goto LABEL_21;
  PTKTraceInit();
  v21->_disparitySize.width = width;
  v21->_disparitySize.height = height;
  objc_storeStrong((id *)&v21->_metalContext, a3);
  v21->_debugRendering = a7;
  objc_storeStrong((id *)&v21->_options, a9);
  +[PTRaytracingUtilsV1 createFocusEdge](PTRaytracingUtilsV1, "createFocusEdge");
  v21->_focusEdge.width = v22;
  v21->_focusEdge.gradientThreshold = v23;
  v21->_focusEdge.gradientWeight = v24;
  v21->_focusEdge.minMaxThreshold = v25;
  v26 = -[PTColorConversion initWithMetalContext:]([PTColorConversion alloc], "initWithMetalContext:", v19);
  colorConversion = v21->_colorConversion;
  v21->_colorConversion = v26;

  if (!v21->_colorConversion)
  {
    _PTLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV14 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.1(v35, v36, v37, v38, v39, v40, v41, v42);
    goto LABEL_20;
  }
  v28 = -[PTRaytracingUtilsV1 initWithMetalContext:]([PTRaytracingUtilsV1 alloc], "initWithMetalContext:", v21->_metalContext);
  raytracingUtils = v21->_raytracingUtils;
  v21->_raytracingUtils = v28;

  if (!v21->_raytracingUtils)
  {
    _PTLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV14 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.2(v35, v43, v44, v45, v46, v47, v48, v49);
    goto LABEL_20;
  }
  v30 = -[PTUtil initWithMetalContext:]([PTUtil alloc], "initWithMetalContext:", v21->_metalContext);
  util = v21->_util;
  v21->_util = v30;

  if (!v21->_util)
  {
    _PTLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV14 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.3(v35, v50, v51, v52, v53, v54, v55, v56);
    goto LABEL_20;
  }
  v21->_bicubicUpscale = 0;
  objc_msgSend(v20, "objectForKeyedSubscript:", &unk_1E8252190);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v21->_injectedRGBAPyramid = v32 != 0;

  if (v21->_injectedRGBAPyramid)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", &unk_1E8252190);
    v33 = objc_claimAutoreleasedReturnValue();
    rgbaPyramid = v21->_rgbaPyramid;
    v21->_rgbaPyramid = (PTPyramid *)v33;

  }
  else
  {
    v57 = [PTPyramid alloc];
    metalContext = v21->_metalContext;
    -[PTRaytracingV14RenderState qualitySettings](v21->_renderState, "qualitySettings");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:](v57, "initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:", metalContext, 115, 0, objc_msgSend(v59, "doFirstLevelGaussianDownsample"), 4, v16, v15);
    v61 = v21->_rgbaPyramid;
    v21->_rgbaPyramid = (PTPyramid *)v60;

    if (!v21->_rgbaPyramid)
    {
      _PTLogSystem();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[PTRaytracingV14 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.4(v35, v80, v81, v82, v83, v84, v85, v86);
      goto LABEL_20;
    }
  }
  v62 = [PTRaytracingV14RenderState alloc];
  v88 = v21->_metalContext;
  v89 = v62;
  v90 = a10;
  v63 = v21->_util;
  -[PTPyramid mipmapTexture](v21->_rgbaPyramid, "mipmapTexture");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "pixelFormat");
  options = v21->_options;
  v67 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[PTPyramid mipmapTexture](v21->_rgbaPyramid, "mipmapTexture");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend(v67, "initWithObjects:", v68, 0);
  v70 = -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:](v89, "initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:", v88, v63, v90, a7, v65, options, v16, v15, v21->_disparitySize.width, v21->_disparitySize.height, v69);
  renderState = v21->_renderState;
  v21->_renderState = (PTRaytracingV14RenderState *)v70;

  if (!v21->_renderState)
  {
    _PTLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV14 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.5(v35, v73, v74, v75, v76, v77, v78, v79);
LABEL_20:

LABEL_21:
    v72 = 0;
    goto LABEL_22;
  }
  v72 = v21;
LABEL_22:

  return v72;
}

- (int)prewarm
{
  return 0;
}

- (int)renderContinuousWithSource:(id)a3 renderRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  int v24;
  PTColorConversion *colorConversion;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  int v30;
  int v31;
  NSObject *v32;
  PTRaytracingUtilsV1 *raytracingUtils;
  void *v34;
  NSObject *v35;
  int v36;
  int v37;
  void *v38;
  int v39;
  PTRaytracingUtilsV1 *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  PTRaytracingUtilsV1 *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  PTPyramid *rgbaPyramid;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  PTRaytracingUtilsV1 *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  unint64_t v74;
  uint64_t v75;
  void *v76;
  int v77;
  float32x2_t v78;
  void *v79;
  unsigned int v80;
  void *v81;
  float v82;
  unint64_t v83;
  void *v84;
  float v85;
  unint64_t v86;
  void *v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  NSObject *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  int v120;
  PTRaytracingUtilsV1 *v121;
  void *v122;
  void *v123;
  int v125;
  unint64_t v126;
  float v127;
  uint64_t v128;
  int32x2_t v129;
  _QWORD v130[5];
  int64x2_t v131;
  uint64_t v132;
  _WORD v133[2];
  uint64_t v134;
  _QWORD v135[3];
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  uint64_t v143;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "renderState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quality");
  objc_msgSend(v7, "fNumber");
  objc_msgSend(v7, "focusDisparity");
  objc_msgSend(v7, "alphaLowLight");
  kdebug_trace();

  v143 = 0;
  v141 = 0u;
  v142 = 0u;
  -[PTRaytracingV14RenderState pyramidSamplingFraction](self->_renderState, "pyramidSamplingFraction");
  v10 = v9;
  -[PTRaytracingV14RenderState anamorphicFactor](self->_renderState, "anamorphicFactor");
  v12 = v11;
  -[PTRaytracingV14RenderState raytracingRadiusLocal](self->_renderState, "raytracingRadiusLocal");
  v14 = v13;
  v15 = -[PTRaytracingV14RenderState rayCount](self->_renderState, "rayCount");
  -[PTRaytracingV14RenderState colorSize](self->_renderState, "colorSize");
  v17 = v16;
  -[PTRaytracingV14RenderState qualitySettings](self->_renderState, "qualitySettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "doMacroApertureLimit");
  LODWORD(v20) = v10;
  LODWORD(v21) = v12;
  LODWORD(v22) = v14;
  +[PTRaytracingUtilsV1 createFocusObject:pyramidSamplingFraction:anamorphicFactor:raytracingRadiusLocal:rayCount:colorSize:doMacroApertureLimit:](PTRaytracingUtilsV1, "createFocusObject:pyramidSamplingFraction:anamorphicFactor:raytracingRadiusLocal:rayCount:colorSize:doMacroApertureLimit:", v7, v15, v19, v20, v21, v22, v17);

  v139 = 0u;
  v140 = 0u;
  if (v7)
    objc_msgSend(v7, "scissorRect");
  if (self->_injectedRGBAPyramid)
    goto LABEL_4;
  -[PTRaytracingV14RenderState qualitySettings](self->_renderState, "qualitySettings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "doFirstLevelGaussianDownsample");

  if (v24)
  {
    colorConversion = self->_colorConversion;
    objc_msgSend(v7, "sourceColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTPyramid mipmapLevels](self->_rgbaPyramid, "mipmapLevels");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(colorConversion) = -[PTColorConversion convertRGBLinearFromPTTexture:inPTTexture:outRGBA:](colorConversion, "convertRGBLinearFromPTTexture:inPTTexture:outRGBA:", v6, v26, v28);

    if ((_DWORD)colorConversion)
    {
      _PTLogSystem();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[PTEffect render:].cold.2();

    }
    v30 = -[PTPyramid updatePyramid:offset:](self->_rgbaPyramid, "updatePyramid:offset:", v6, 0);
    if (v30)
    {
      v31 = v30;
      _PTLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      v125 = v31;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      goto LABEL_20;
    }
LABEL_4:
    v125 = 0;
    goto LABEL_21;
  }
  raytracingUtils = self->_raytracingUtils;
  -[PTPyramid mipmapLevels](self->_rgbaPyramid, "mipmapLevels");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(raytracingUtils) = -[PTRaytracingUtilsV1 convertRGBPyramidFromSource:renderRequest:rgbaPyramidArray:skipLevel0:](raytracingUtils, "convertRGBPyramidFromSource:renderRequest:rgbaPyramidArray:skipLevel0:", v6, v7, v34, 1);

  if ((_DWORD)raytracingUtils)
  {
    _PTLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[PTEffect render:].cold.2();

  }
  v36 = -[PTPyramid updatePyramid:offset:](self->_rgbaPyramid, "updatePyramid:offset:", v6, 1);
  if (!v36)
    goto LABEL_4;
  v37 = v36;
  _PTLogSystem();
  v32 = objc_claimAutoreleasedReturnValue();
  v125 = v37;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
LABEL_19:
    -[PTEffect render:].cold.2();
LABEL_20:

LABEL_21:
  -[PTRaytracingV14RenderState qualitySettings](self->_renderState, "qualitySettings");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "doCenterDisparity");

  if (v39)
  {
    v40 = self->_raytracingUtils;
    objc_msgSend(v7, "sourceDisparity");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRaytracingV14RenderState disparityDiff](self->_renderState, "disparityDiff");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = v141;
    v137 = v142;
    v138 = v143;
    -[PTRaytracingUtilsV1 centerDisparityOnFocus:inDisparity:outDisparity:focusObject:](v40, "centerDisparityOnFocus:inDisparity:outDisparity:focusObject:", v6, v41, v42, &v136);

    -[PTRaytracingV14RenderState disparityDiff](self->_renderState, "disparityDiff");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "sourceDisparity");
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v43;
  -[PTRaytracingV14RenderState globalReduction](self->_renderState, "globalReduction");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
  {
    -[PTRaytracingV14RenderState globalReduction](self->_renderState, "globalReduction");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRaytracingV14RenderState disparityDiffGlobalMinMax](self->_renderState, "disparityDiffGlobalMinMax");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "parallelReductionMinMax:inTexture:globalMinMaxBuffer:", v6, v44, v47);

    v48 = self->_raytracingUtils;
    -[PTRaytracingV14RenderState disparityEdgesTemp](self->_renderState, "disparityEdgesTemp");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRaytracingV14RenderState disparityEdges](self->_renderState, "disparityEdges");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRaytracingV14RenderState disparityDiffGlobalMinMax](self->_renderState, "disparityDiffGlobalMinMax");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRaytracingV14RenderState edgeTolerance](self->_renderState, "edgeTolerance");
    v136 = v141;
    v137 = v142;
    v138 = v143;
    -[PTRaytracingUtilsV1 detectDilatedEdges:inDisparity:tempEdges:outEdges:focusObject:disparityDiffMinMax:edgeTolerance:](v48, "detectDilatedEdges:inDisparity:tempEdges:outEdges:focusObject:disparityDiffMinMax:edgeTolerance:", v6, v44, v49, v50, &v136, v51);

  }
  -[PTRaytracingV14RenderState qualitySettings](self->_renderState, "qualitySettings");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "doDisparityUpsampling");

  if (v53)
  {
    rgbaPyramid = self->_rgbaPyramid;
    -[PTRaytracingV14RenderState disparityUpscale](self->_renderState, "disparityUpscale");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "upscaledTexture");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "width");
    -[PTRaytracingV14RenderState disparityUpscale](self->_renderState, "disparityUpscale");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "upscaledTexture");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v135[0] = v57;
    v135[1] = objc_msgSend(v59, "height");
    v135[2] = 0;
    -[PTRaytracingV14RenderState qualitySettings](self->_renderState, "qualitySettings");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTPyramid findMipmapLevelLargerThan:fromLevel:](rgbaPyramid, "findMipmapLevelLargerThan:fromLevel:", v135, objc_msgSend(v60, "doFirstLevelGaussianDownsample") ^ 1);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    -[PTRaytracingV14RenderState disparityUpscale](self->_renderState, "disparityUpscale");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sourceColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "guidedUpsampling:inDisparity:inRGBA:colorDepth:", v6, v44, v61, objc_msgSend(v63, "YCbCrColorDepth"));
    v64 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v64;
  }
  -[PTRaytracingV14RenderState focusEdgeMask](self->_renderState, "focusEdgeMask");
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    v66 = self->_raytracingUtils;
    -[PTRaytracingV14RenderState focusEdgeMask](self->_renderState, "focusEdgeMask");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    HIDWORD(v68) = DWORD1(v141);
    HIDWORD(v69) = DWORD1(v142);
    v136 = v141;
    v137 = v142;
    v138 = v143;
    *(float *)&v68 = self->_focusEdge.width;
    *(float *)&v69 = self->_focusEdge.gradientThreshold;
    *(float *)&v70 = self->_focusEdge.gradientWeight;
    *(float *)&v71 = self->_focusEdge.minMaxThreshold;
    -[PTRaytracingUtilsV1 focusEdgeMask:inDisparityDiff:focusObject:focusEdge:outFocusEdgeMask:](v66, "focusEdgeMask:inDisparityDiff:focusObject:focusEdge:outFocusEdgeMask:", v6, v44, &v136, v67, v68, v69, v70, v71);

  }
  objc_msgSend(v7, "sourceDisparity");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = (float)(unint64_t)objc_msgSend(v72, "width");
  objc_msgSend(v7, "sourceDisparity");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "height");
  *(float *)&v75 = v127;
  *((float *)&v75 + 1) = (float)v74;
  v128 = v75;

  v134 = v128;
  v126 = v139;
  -[PTRaytracingV14RenderState qualitySettings](self->_renderState, "qualitySettings");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "renderDownscale");
  LODWORD(v128) = v77;
  v78 = vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)vmovn_s64((int64x2_t)__PAIR128__(*((unint64_t *)&v139 + 1), v126)), (int8x8_t)0xFFFF0000FFFFLL));
  -[PTRaytracingV14RenderState qualitySettings](self->_renderState, "qualitySettings");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "renderDownscale");
  v129 = vcvt_s32_f32(vdiv_f32(v78, (float32x2_t)__PAIR64__(v80, v128)));

  v133[1] = v129.i16[2];
  v133[0] = v129.i16[0];
  v78.f32[0] = (float)(unint64_t)v140;
  -[PTRaytracingV14RenderState qualitySettings](self->_renderState, "qualitySettings");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "renderDownscale");
  v83 = vcvtps_u32_f32(v78.f32[0] / v82);
  v78.f32[0] = (float)*((unint64_t *)&v140 + 1);
  -[PTRaytracingV14RenderState qualitySettings](self->_renderState, "qualitySettings");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "renderDownscale");
  v86 = vcvtps_u32_f32(v78.f32[0] / v85);

  objc_msgSend(v6, "computeCommandEncoder");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v87)
  {
    _PTLogSystem();
    v88 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v88, v89, v90, v91, v92, v93, v94, v95);

  }
  -[PTRaytracingV14RenderState raytracingSDOF](self->_renderState, "raytracingSDOF");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setComputePipelineState:", v96);

  -[PTPyramid mipmapTexture](self->_rgbaPyramid, "mipmapTexture");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setTexture:atIndex:", v97, 0);

  objc_msgSend(v87, "setTexture:atIndex:", v44, 1);
  -[PTRaytracingV14RenderState disparityEdges](self->_renderState, "disparityEdges");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setTexture:atIndex:", v98, 2);

  -[PTRaytracingV14RenderState raytracedRGBRadius](self->_renderState, "raytracedRGBRadius");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setTexture:atIndex:", v99, 3);

  -[PTRaytracingV14RenderState focusEdgeMask](self->_renderState, "focusEdgeMask");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setTexture:atIndex:", v100, 4);

  objc_msgSend(v87, "setBytes:length:atIndex:", &v141, 40, 0);
  -[PTRaytracingV14RenderState aperturePointsXY](self->_renderState, "aperturePointsXY");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setBuffer:offset:atIndex:", v101, 0, 1);

  -[PTRaytracingV14RenderState randomUChars](self->_renderState, "randomUChars");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setBuffer:offset:atIndex:", v102, 0, 2);

  -[PTRaytracingV14RenderState disparityDiffGlobalMinMax](self->_renderState, "disparityDiffGlobalMinMax");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setBuffer:offset:atIndex:", v103, 0, 3);

  objc_msgSend(v87, "setBytes:length:atIndex:", &v134, 8, 4);
  objc_msgSend(v87, "setBytes:length:atIndex:", v133, 4, 5);
  *(_QWORD *)&v136 = v83;
  *((_QWORD *)&v136 + 1) = v86;
  *(_QWORD *)&v137 = 1;
  v131 = vdupq_n_s64(8uLL);
  v132 = 1;
  objc_msgSend(v87, "dispatchThreads:threadsPerThreadgroup:", &v136, &v131);
  objc_msgSend(v87, "endEncoding");
  -[PTRaytracingV14RenderState raytracedRGBRadius](self->_renderState, "raytracedRGBRadius");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTRaytracingV14RenderState raytracedRGBRadiusUpscaled](self->_renderState, "raytracedRGBRadiusUpscaled");
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  if (v105)
  {
    -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRaytracingV14RenderState raytracedRGBRadius](self->_renderState, "raytracedRGBRadius");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRaytracingV14RenderState raytracedRGBRadiusUpscaled](self->_renderState, "raytracedRGBRadiusUpscaled");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "copy:inTex:outTex:", v6, v107, v108);

    -[PTRaytracingV14RenderState raytracedRGBRadiusUpscaled](self->_renderState, "raytracedRGBRadiusUpscaled");
    v109 = objc_claimAutoreleasedReturnValue();

    v104 = (void *)v109;
  }
  objc_msgSend(v6, "computeCommandEncoder");
  v110 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v110)
  {
    _PTLogSystem();
    v111 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v111, v112, v113, v114, v115, v116, v117, v118);

  }
  -[PTRaytracingV14RenderState qualitySettings](self->_renderState, "qualitySettings");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v119, "doFirstLevelGaussianDownsample");

  v121 = self->_raytracingUtils;
  if (v120)
  {
    -[PTPyramid mipmapTexture](self->_rgbaPyramid, "mipmapTexture");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRaytracingV14RenderState randomGaussNoise](self->_renderState, "randomGaussNoise");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRaytracingUtilsV1 interpolateRGBRadiusToDest:renderRequest:inRGBA:inRGBRadius:inRandomGauss:bicubicSampling:](v121, "interpolateRGBRadiusToDest:renderRequest:inRGBA:inRGBRadius:inRandomGauss:bicubicSampling:", v110, v7, v122, v104, v123, self->_bicubicUpscale);

  }
  else
  {
    -[PTRaytracingV14RenderState randomGaussNoise](self->_renderState, "randomGaussNoise");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRaytracingUtilsV1 interpolateRGBRadiusUsingSourceToDest:renderRequest:inRGBRadius:inRandomGauss:bicubicSampling:](v121, "interpolateRGBRadiusUsingSourceToDest:renderRequest:inRGBRadius:inRandomGauss:bicubicSampling:", v110, v7, v104, v122, self->_bicubicUpscale);
  }

  objc_msgSend(v110, "endEncoding");
  if (kdebug_is_enabled())
  {
    v130[0] = MEMORY[0x1E0C809B0];
    v130[1] = 3221225472;
    v130[2] = __60__PTRaytracingV14_renderContinuousWithSource_renderRequest___block_invoke;
    v130[3] = &unk_1E822A0B0;
    v130[4] = self;
    objc_msgSend(v6, "addCompletedHandler:", v130);
  }

  return v125;
}

void __60__PTRaytracingV14_renderContinuousWithSource_renderRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "qualitySettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doDisparityUpsampling");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "qualitySettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renderDownscale");
  kdebug_trace();

  if (objc_msgSend(v3, "status") != 4)
  {
    _PTLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke_cold_2(v3, v6);

    if (objc_msgSend(v3, "status") != 4)
    {
      _PTLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke_cold_1(v3, v7);

    }
  }

}

- (unint64_t)minimumResourceHeapSize
{
  return 1024;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_raytracingUtils, 0);
  objc_storeStrong((id *)&self->_debugLayer, 0);
  objc_storeStrong((id *)&self->_rgbaPyramid, 0);
  objc_storeStrong((id *)&self->_colorConversion, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_renderState, 0);
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
