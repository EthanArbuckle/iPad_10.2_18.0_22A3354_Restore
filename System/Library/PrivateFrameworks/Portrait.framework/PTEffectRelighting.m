@implementation PTEffectRelighting

- (void)updateColorCube
{
  SingleColorCubeCorrectionStage *v3;
  PTMSRResize *v4;
  PTMSRResize *msrColorPyramid;
  id v6;

  if (LODWORD(self->_boxFilter) != 1)
  {
    LODWORD(self->_boxFilter) = 1;
    v3 = [SingleColorCubeCorrectionStage alloc];
    -[PTMetalContext device](self->_metalContext, "device");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = -[SingleColorCubeCorrectionStage init:cubeSize:data:](v3, "init:cubeSize:data:", v6, 32, &yellowSatFixCubeData);
    msrColorPyramid = self->_msrColorPyramid;
    self->_msrColorPyramid = v4;

  }
}

- (void)initRelightingParam
{
  int v2;
  __int128 v3;
  int v4;
  __int128 v5;
  __int128 v6;

  v2 = 0;
  *(_DWORD *)&self->_anon_60[8] = 1064011039;
  *(_QWORD *)self->_anon_60 = vdupq_n_s32(0x3F5EB852u).u64[0];
  *(_OWORD *)&self->_bgVignetteLightIntensity[8] = xmmword_1C93236E0;
  v3 = *(_OWORD *)&self->_anon_60[16];
  do
  {
    v5 = xmmword_1C93236E0;
    v4 = *(_DWORD *)((unint64_t)&v5 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3)));
    v6 = v3;
    *(_DWORD *)((unint64_t)&v6 & 0xFFFFFFFFFFFFFFF3 | (4 * (v2 & 3))) = v4;
    v3 = v6;
    ++v2;
  }
  while (v2 != 3);
  *(_DWORD *)&self->_anon_60[24] = DWORD2(v6);
  *(_QWORD *)&self->_anon_60[16] = v3;
  *(_QWORD *)&self->_anon_60[32] = 0x3F8666663F000000;
  *(_DWORD *)&self->_anon_60[40] = 1063675494;
  *(_DWORD *)&self->_anon_60[72] = 1061158912;
  *(_QWORD *)&self->_anon_60[64] = 0x3F6666663F800000;
  *(_DWORD *)&self->_anon_60[88] = 1065353216;
  *(_QWORD *)&self->_anon_60[80] = vdupq_n_s32(0x3F83F571u).u64[0];
  *(_DWORD *)&self->_anon_60[48] = 1056964608;
  *(_QWORD *)&self->_weightHeadEye[4] = 0x3E19999A3E800000;
  LODWORD(self->_lightMasks) = 1075838976;
}

- (PTEffectRelighting)initWithMetalContext:(id)a3 faceAttributesNetwork:(id)a4 availableEffectTypes:(unint64_t)a5 effectUtil:(id)a6 util:(id)a7 prewarmOnly:(BOOL)a8 colorSize:(id *)a9 msrColorPyramid:(id)a10 studiolightFromSegmentation:(BOOL)a11 sharedResources:(id)a12
{
  _BOOL8 v12;
  id v18;
  id v19;
  id v20;
  id v21;
  PTEffectRelighting *v22;
  PTEffectRelighting *v23;
  PTBrightSceneDetector *v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  float v29;
  uint64_t v30;
  _DWORD *v31;
  uint64_t v32;
  int v33;
  float v34;
  uint64_t i;
  NSObject *v36;
  uint64_t v47;
  Class isa;
  double v49;
  uint64_t v50;
  MTLComputePipelineState *studioLight;
  uint64_t v52;
  MTLComputePipelineState *createLightMask;
  uint64_t v54;
  MTLComputePipelineState *relightFullsizeInput;
  NSObject *v56;
  uint64_t v57;
  MTLComputePipelineState *filterLightGainApplyToRGB;
  PTSyntheticLight *v59;
  MTLTexture *quarterSizeRGBA;
  uint64_t v61;
  PTSyntheticLight *syntheticLight;
  float v63;
  int v64;
  int v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  MTLTexture *lightGainMapLowResFiltered;
  void *v70;
  uint64_t v71;
  MTLTexture *lightGainMapFiltered;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  PTBrightSceneDetector *brightSceneDetector;
  void *v77;
  uint64_t v78;
  void *v79;
  PTBoxFilter *v80;
  MTLTexture *approximatedDiffuseIntermediate;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t var1;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  MTLTexture *approximatedDiffuse;
  void *v91;
  uint64_t v92;
  MTLFunctionConstantValues *functionConstants;
  void *v94;
  uint64_t v95;
  MTLTexture *relightSizeRGBA;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  PTEffectRelighting *v102;
  NSObject *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  NSObject *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  NSObject *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  id v178;
  char v179;
  id v180;
  id v181;
  _QWORD v182[3];
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v183;
  int v184;
  _WORD v185[3];
  _WORD v186[3];
  objc_super v187;
  _DWORD v188[9];
  uint64_t v189;

  v12 = a8;
  v179 = a5;
  v189 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v181 = a6;
  v20 = a7;
  v180 = a10;
  v21 = a12;
  v187.receiver = self;
  v187.super_class = (Class)PTEffectRelighting;
  v22 = -[PTEffectRelighting init](&v187, sel_init);
  v23 = v22;
  if (v22)
  {
    LODWORD(v22->_boxFilter) = -1;
    objc_storeStrong((id *)&v22->_metalContext, a3);
    v23->_frameIndex = 0;
    LODWORD(v23->_colorCube) = 0;
    objc_storeStrong((id *)&v23->_util, a7);
    objc_storeStrong((id *)&v23->_quarterSizeRGBA, a10);
    v23->_smoothFaceRects.aspect = (float)a9->var0 / (float)a9->var1;
    -[PTEffectRelighting updateColorCube](v23, "updateColorCube");
    v24 = [PTBrightSceneDetector alloc];
    LODWORD(v25) = 1045220557;
    LODWORD(v26) = 3.0;
    v27 = -[PTBrightSceneDetector initWithLuxLevelThreshold:emaFilterCoefficient:transitionTime:](v24, "initWithLuxLevelThreshold:emaFilterCoefficient:transitionTime:", 2.1857382e27, v25, v26);
    v28 = *(void **)&v23->_lastFrameTimeSeconds;
    *(_QWORD *)&v23->_lastFrameTimeSeconds = v27;

    if (*(_QWORD *)&v23->_lastFrameTimeSeconds)
    {
      v178 = v19;
      v29 = 0.0;
      v30 = -1;
      v31 = v188;
      do
      {
        v32 = 0;
        v33 = -1;
        do
        {
          v34 = pow(2.71828183, (float)((float)((float)((float)v33 * (float)v33) + (float)((float)(int)v30 * (float)(int)v30)) * -0.5))* 0.159154943;
          v29 = v29 + v34;
          *(float *)&v31[v32] = v34;
          v32 += 3;
          ++v33;
        }
        while (v32 != 9);
        ++v30;
        ++v31;
      }
      while (v30 != 2);
      for (i = 0; i != 9; ++i)
        *(float *)&v188[i] = *(float *)&v188[i] / v29;
      LODWORD(v23->_lightGainMapLowRes) = 1056964608;
      _PTLogSystem();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.11((float *)&v23->_lightGainMapLowRes, v36);

      _S0 = v188[0];
      _S1 = v188[1];
      __asm { FCVT            H0, S0 }
      v186[0] = _S0;
      __asm { FCVT            H0, S1 }
      v186[1] = _S0;
      _S0 = v188[2];
      _S1 = v188[3];
      __asm { FCVT            H0, S0 }
      v186[2] = _S0;
      __asm { FCVT            H0, S1 }
      v185[0] = _S0;
      _S0 = v188[4];
      _S1 = v188[5];
      __asm { FCVT            H0, S0 }
      v185[1] = _S0;
      __asm { FCVT            H0, S1 }
      v185[2] = _S0;
      v47 = objc_opt_new();
      isa = v23[1].super.isa;
      v23[1].super.isa = (Class)v47;

      -[objc_class setConstantHalf3:withName:](v23[1].super.isa, "setConstantHalf3:withName:", v186, CFSTR("kWeights2DRow0_half3"));
      -[objc_class setConstantHalf3:withName:](v23[1].super.isa, "setConstantHalf3:withName:", v185, CFSTR("kWeights2DRow1_half3"));
      LODWORD(v49) = 1.5;
      if (*(float *)&v23->_lightGainMapLowRes > 0.25)
        *(float *)&v49 = 2.0;
      v184 = 3;
      -[objc_class setConstantFloat:withName:](v23[1].super.isa, "setConstantFloat:withName:", CFSTR("kDisparityFilterStepWidth_float"), v49);
      -[objc_class setConstantValue:type:withName:](v23[1].super.isa, "setConstantValue:type:withName:", &v184, 29, CFSTR("kDisparityFilterType"));
      objc_msgSend(v18, "computePipelineStateFor:withConstants:", CFSTR("studioLight"), v23[1].super.isa);
      v50 = objc_claimAutoreleasedReturnValue();
      studioLight = v23->_studioLight;
      v23->_studioLight = (MTLComputePipelineState *)v50;

      v19 = v178;
      if (v23->_studioLight)
      {
        objc_msgSend(v18, "computePipelineStateFor:withConstants:", CFSTR("createLightMask"), v23[1].super.isa);
        v52 = objc_claimAutoreleasedReturnValue();
        createLightMask = v23->_createLightMask;
        v23->_createLightMask = (MTLComputePipelineState *)v52;

        if (v23->_createLightMask)
        {
          objc_msgSend(v18, "computePipelineStateFor:withConstants:", CFSTR("relightFullsizeInput"), 0);
          v54 = objc_claimAutoreleasedReturnValue();
          relightFullsizeInput = v23->_relightFullsizeInput;
          v23->_relightFullsizeInput = (MTLComputePipelineState *)v54;

          if (v23->_relightFullsizeInput)
          {
            v56 = objc_opt_new();
            -[NSObject setConstantHalf3:withName:](v56, "setConstantHalf3:withName:", v186, CFSTR("kWeights2DRow0_half3"));
            -[NSObject setConstantHalf3:withName:](v56, "setConstantHalf3:withName:", v185, CFSTR("kWeights2DRow1_half3"));
            objc_msgSend(v18, "computePipelineStateFor:withConstants:", CFSTR("filterLightGainApplyToRGB"), v56);
            v57 = objc_claimAutoreleasedReturnValue();
            filterLightGainApplyToRGB = v23->_filterLightGainApplyToRGB;
            v23->_filterLightGainApplyToRGB = (MTLComputePipelineState *)v57;

            if (v23->_filterLightGainApplyToRGB)
            {
              v59 = [PTSyntheticLight alloc];
              quarterSizeRGBA = v23->_quarterSizeRGBA;
              v183 = *a9;
              v61 = -[PTSyntheticLight initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:](v59, "initWithMetalContext:faceAttributesNetwork:effectUtil:msrColorPyramid:colorSize:prewarmOnly:sharedResources:", v18, v178, v181, quarterSizeRGBA, &v183, v12, v21);
              syntheticLight = v23->_syntheticLight;
              v23->_syntheticLight = (PTSyntheticLight *)v61;

              if (v23->_syntheticLight)
              {
                -[PTEffectRelighting initRelightingParam](v23, "initRelightingParam");
                v63 = *(float *)&v23->_lightGainMapLowRes;
                v64 = (int)(float)((float)(v63 * (float)a9->var0) * 0.5);
                v65 = (int)(float)((float)(v63 * (float)a9->var1) * 0.5);
                objc_msgSend(v18, "textureUtil");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                v67 = v65;
                objc_msgSend(v66, "createWithWidth:height:pixelFormat:", v64, v65, 115);
                v68 = objc_claimAutoreleasedReturnValue();
                lightGainMapLowResFiltered = v23->_lightGainMapLowResFiltered;
                v23->_lightGainMapLowResFiltered = (MTLTexture *)v68;

                if (!v23->_lightGainMapLowResFiltered)
                {
                  _PTLogSystem();
                  v148 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
                    -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.7(v148, v149, v150, v151, v152, v153, v154, v155);

                  v102 = 0;
                  v19 = v178;
                  goto LABEL_61;
                }
                objc_msgSend(v18, "textureUtil");
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "createWithWidth:height:pixelFormat:", a9->var0 >> 2, a9->var1 >> 2, 115);
                v71 = objc_claimAutoreleasedReturnValue();
                lightGainMapFiltered = v23->_lightGainMapFiltered;
                v23->_lightGainMapFiltered = (MTLTexture *)v71;

                if (v23->_lightGainMapFiltered)
                {
                  v73 = v64;
                  objc_msgSend(v18, "textureUtil");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v74, "createWithWidth:height:pixelFormat:", a9->var0 >> 1, a9->var1 >> 1, 115);
                  v75 = objc_claimAutoreleasedReturnValue();
                  brightSceneDetector = v23->_brightSceneDetector;
                  v23->_brightSceneDetector = (PTBrightSceneDetector *)v75;

                  v19 = v178;
                  if (v23->_brightSceneDetector)
                  {
                    objc_msgSend(v18, "textureUtil");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v77, "createWithWidth:height:pixelFormat:", v73, v67, 30);
                    v78 = objc_claimAutoreleasedReturnValue();
                    v79 = *(void **)v23->_bgVignetteLightIntensity;
                    *(_QWORD *)v23->_bgVignetteLightIntensity = v78;

                    if (*(_QWORD *)v23->_bgVignetteLightIntensity)
                    {
                      if ((v179 & 0x40) != 0 && a11)
                      {
                        v80 = -[PTBoxFilter initWithMetalContext:options:]([PTBoxFilter alloc], "initWithMetalContext:options:", v23->_metalContext, 8);
                        approximatedDiffuseIntermediate = v23->_approximatedDiffuseIntermediate;
                        v23->_approximatedDiffuseIntermediate = (MTLTexture *)v80;

                        v82 = +[PTEffectUtil aspectRatio:](PTEffectUtil, "aspectRatio:", (double)a9->var0, (double)a9->var1);
                        v83 = 288;
                        if (v82 == 1)
                          v83 = 320;
                        v84 = 216;
                        if (v82 == 1)
                          v84 = 176;
                        var1 = a9->var1;
                        if (a9->var0 >= var1)
                          v86 = v83;
                        else
                          v86 = v84;
                        if (a9->var0 >= var1)
                          v87 = v84;
                        else
                          v87 = v83;
                        -[PTMetalContext textureUtil](v23->_metalContext, "textureUtil");
                        v88 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v88, "createWithWidth:height:pixelFormat:", v86, v87, 10);
                        v89 = objc_claimAutoreleasedReturnValue();
                        approximatedDiffuse = v23->_approximatedDiffuse;
                        v23->_approximatedDiffuse = (MTLTexture *)v89;

                        -[PTMetalContext textureUtil](v23->_metalContext, "textureUtil");
                        v91 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v91, "createWithWidth:height:pixelFormat:", v86, v87, 10);
                        v92 = objc_claimAutoreleasedReturnValue();
                        functionConstants = v23->_functionConstants;
                        v23->_functionConstants = (MTLFunctionConstantValues *)v92;

                      }
                      -[MTLTexture pyramidRGBA](v23->_quarterSizeRGBA, "pyramidRGBA");
                      v94 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v94, "firstObject");
                      v95 = objc_claimAutoreleasedReturnValue();
                      relightSizeRGBA = v23->_relightSizeRGBA;
                      v23->_relightSizeRGBA = (MTLTexture *)v95;

                      -[MTLTexture pyramidRGBA](v23->_quarterSizeRGBA, "pyramidRGBA");
                      v97 = (void *)objc_claimAutoreleasedReturnValue();
                      v98 = -[MTLTexture width](v23->_lightGainMapLowResFiltered, "width");
                      v99 = -[MTLTexture height](v23->_lightGainMapLowResFiltered, "height");
                      v182[0] = v98;
                      v182[1] = v99;
                      v182[2] = 1;
                      +[PTUtil findMipmapLevel:largerThan:](PTUtil, "findMipmapLevel:largerThan:", v97, v182);
                      v100 = objc_claimAutoreleasedReturnValue();
                      v101 = *(void **)&v23->_colorCubeType;
                      *(_QWORD *)&v23->_colorCubeType = v100;

                      v102 = v23;
                      goto LABEL_61;
                    }
                    _PTLogSystem();
                    v133 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                      -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.10(v133, v170, v171, v172, v173, v174, v175, v176);
                  }
                  else
                  {
                    _PTLogSystem();
                    v133 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                      -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.9(v133, v163, v164, v165, v166, v167, v168, v169);
                  }
                }
                else
                {
                  _PTLogSystem();
                  v133 = objc_claimAutoreleasedReturnValue();
                  v19 = v178;
                  if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                    -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.8(v133, v156, v157, v158, v159, v160, v161, v162);
                }
              }
              else
              {
                _PTLogSystem();
                v133 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                  -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.6(v133, v141, v142, v143, v144, v145, v146, v147);
              }
            }
            else
            {
              _PTLogSystem();
              v133 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
                -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.5(v133, v134, v135, v136, v137, v138, v139, v140);
            }

          }
          else
          {
            _PTLogSystem();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
              -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.4(v56, v126, v127, v128, v129, v130, v131, v132);
          }
        }
        else
        {
          _PTLogSystem();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.3(v56, v119, v120, v121, v122, v123, v124, v125);
        }
      }
      else
      {
        _PTLogSystem();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.2(v56, v112, v113, v114, v115, v116, v117, v118);
      }
      v102 = 0;
LABEL_61:
      v111 = v180;

      goto LABEL_62;
    }
    _PTLogSystem();
    v103 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      -[PTEffectRelighting initWithMetalContext:faceAttributesNetwork:availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:].cold.1(v103, v104, v105, v106, v107, v108, v109, v110);

  }
  v102 = 0;
  v111 = v180;
LABEL_62:

  return v102;
}

- (id)gainMap
{
  return self->_brightSceneDetector;
}

- (id)colorCube
{
  return (id)-[PTMSRResize cubeTexture](self->_msrColorPyramid, "cubeTexture");
}

- (SmoothFaceRectData)smoothFaceRects
{
  return &self->_smoothFaceRects;
}

- (void)updateParamters:(id)a3 relightStrength:(float)a4
{
  uint64_t v6;
  float v7;
  int v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  float v12;
  float v13;
  float v14;
  float32x4_t v15;
  float32x4_t v21;
  float32x4_t v22;
  uint32x4_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  float v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v6 = objc_msgSend(*(id *)&self->_lastFrameTimeSeconds, "brightScene", a3);
  v33 = v7;
  PTDefaultsFlush(v6);
  -[PTEffectRelighting updateColorCube](self, "updateColorCube");
  v8 = 0;
  *(_QWORD *)&self->_anon_60[96] = 0x3FC000003F000000;
  *(_QWORD *)&self->_anon_60[104] = 0x400000003F000000;
  v9 = *(_OWORD *)&self->_bgVignetteLightIntensity[8];
  v11 = *(_OWORD *)self->_anon_60;
  v10 = *(_OWORD *)&self->_anon_60[16];
  do
  {
    v35 = xmmword_1C9323700;
    v12 = (float)(*(float *)((unint64_t)&v35 & 0xFFFFFFFFFFFFFFF3 | (4 * (v8 & 3))) * 1.25)
        + (float)(a4
                * (float)((float)(*(float *)((unint64_t)&v35 & 0xFFFFFFFFFFFFFFF3 | (4 * (v8 & 3))) * 0.85)
                        - (float)(*(float *)((unint64_t)&v35 & 0xFFFFFFFFFFFFFFF3 | (4 * (v8 & 3))) * 1.25)));
    if (v12 > 1.0)
      v12 = 1.0;
    v37 = v11;
    *(float *)((unint64_t)&v37 & 0xFFFFFFFFFFFFFFF3 | (4 * (v8 & 3))) = v12;
    v11 = v37;
    v34 = v9;
    v13 = *(float *)((unint64_t)&v34 & 0xFFFFFFFFFFFFFFF3 | (4 * (v8 & 3)));
    v14 = (float)(v13 * 1.25) + (float)(a4 * (float)((float)(v13 * 0.85) - (float)(v13 * 1.25)));
    if (v14 > 1.0)
      v14 = 1.0;
    v36 = v10;
    *(float *)((unint64_t)&v36 & 0xFFFFFFFFFFFFFFF3 | (4 * (v8 & 3))) = v14;
    v10 = v36;
    ++v8;
  }
  while (v8 != 3);
  *(_DWORD *)&self->_anon_60[8] = DWORD2(v11);
  *(_QWORD *)self->_anon_60 = v11;
  *(_DWORD *)&self->_anon_60[24] = DWORD2(v10);
  *(_QWORD *)&self->_anon_60[16] = v10;
  v15 = *(float32x4_t *)&self->_anon_60[80];
  __asm { FMOV            V0.4S, #1.0 }
  v21 = vmlaq_n_f32(*(float32x4_t *)&self->_anon_60[16], vsubq_f32(_Q0, *(float32x4_t *)&self->_anon_60[16]), v33);
  *(float32x4_t *)self->_anon_60 = vmlaq_n_f32(*(float32x4_t *)self->_anon_60, vsubq_f32(_Q0, *(float32x4_t *)self->_anon_60), v33);
  *(float32x4_t *)&self->_anon_60[16] = v21;
  v22 = vmlaq_n_f32(v15, vsubq_f32(_Q0, v15), v33);
  v23 = (uint32x4_t)vceqq_f32(v15, v22);
  v23.i32[3] = v23.i32[2];
  if ((vminvq_u32(v23) & 0x80000000) == 0)
    *(float32x4_t *)&self->_anon_60[80] = vdivq_f32(_Q0, v22);
  if (*(float *)&self->_anon_60[36] <= *(float *)&self->_anon_60[40])
  {
    _PTLogSystem();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[PTEffectRelighting updateParamters:relightStrength:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

    v32 = *(float *)&self->_anon_60[40] + 0.05;
    *(float *)&self->_anon_60[36] = v32;
  }
}

- (void)computeSmoothFaceRect:(id)a3 transform:(CGAffineTransform *)a4
{
  uint64_t v6;
  unsigned __int8 *v7;
  int8x16_t v13;
  float32x2_t v14;
  int8x16_t v15;
  float32x2_t v16;
  int8x16_t v17;
  float32x2_t v18;
  float32x2_t v19;
  __int128 v20;
  id v21;

  v21 = a3;
  v6 = 0;
  self->_smoothFaceRects.lightMaskFaceOffsetY = 0.25;
  *(_QWORD *)&self->_anon_f4[4] = *(_QWORD *)&self->_weightHeadEye[4];
  v7 = &self->_anon_f4[92];
  __asm { FMOV            V0.2S, #2.5 }
  v20 = _Q0;
  do
  {
    v13 = *(int8x16_t *)(objc_msgSend(v21, "detectionsFiltered", v20) + v6 + 16);
    *((float32x2_t *)v7 - 8) = vadd_f32(*(float32x2_t *)v13.i8, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v13, v13, 8uLL), (float32x2_t)0x3F0000003F000000));
    v14.f32[0] = *(float *)&v13.i32[2] / self->_smoothFaceRects.aspect;
    v14.i32[1] = v13.i32[3];
    *(float32x2_t *)v13.i8 = vmul_f32(v14, (float32x2_t)0x3F0000003F000000);
    *((float *)v7 - 14) = sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v13.i8, *(float32x2_t *)v13.i8))) * 0.91924;
    *(_DWORD *)v7 = *(_DWORD *)(objc_msgSend(v21, "detectionsFiltered") + v6 + 132);
    v15 = *(int8x16_t *)(objc_msgSend(v21, "detectionsFiltered") + v6 + 96);
    *((float32x2_t *)v7 - 4) = vadd_f32(*(float32x2_t *)v15.i8, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v15, v15, 8uLL), (float32x2_t)0x3F0000003F000000));
    v16.f32[0] = *(float *)&v15.i32[2] / self->_smoothFaceRects.aspect;
    v16.i32[1] = v15.i32[3];
    *(float32x2_t *)v15.i8 = vmul_f32(v16, (float32x2_t)0x3F0000003F000000);
    *((float *)v7 - 6) = *(float *)&self->_lightMasks
                       * sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v15.i8, *(float32x2_t *)v15.i8)));
    v17 = *(int8x16_t *)(objc_msgSend(v21, "detectionsFiltered") + v6 + 112);
    *((float32x2_t *)v7 - 2) = vadd_f32(*(float32x2_t *)v17.i8, vmul_f32((float32x2_t)*(_OWORD *)&vextq_s8(v17, v17, 8uLL), (float32x2_t)0x3F0000003F000000));
    v18.f32[0] = *(float *)&v17.i32[2] / self->_smoothFaceRects.aspect;
    v18.i32[1] = v17.i32[3];
    *(float32x2_t *)v17.i8 = vmul_f32(v18, (float32x2_t)0x3F0000003F000000);
    v18.i32[0] = (__int32)self->_lightMasks;
    v18.i32[1] = *((_DWORD *)v7 - 14);
    *((float32x2_t *)v7 - 1) = vmul_f32(v18, (float32x2_t)__PAIR64__(DWORD1(v20), COERCE_UNSIGNED_INT(sqrtf(vaddv_f32(vmul_f32(*(float32x2_t *)v17.i8, *(float32x2_t *)v17.i8))))));
    v7 += 72;
    v6 += 144;
  }
  while (v6 != 576);
  v19 = vcvt_f32_f64(*(float64x2_t *)&a4->c);
  *(float32x2_t *)&self->_anon_f4[12] = vcvt_f32_f64(*(float64x2_t *)&a4->a);
  *(float32x2_t *)&self->_anon_f4[20] = v19;
  self->_smoothFaceRects.lightMaskWidth = 0.9;
  *(_QWORD *)&self->_smoothFaceRects.lightMaskExponent = 0x404000003FC00000;

}

- (void)fgBgDebugWithDisparity:(id)a3 inDiffuse:(id)a4 inFocusDisparityModifier:(id)a5 outMask:(id)a6 debugType:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MTLComputePipelineState *v16;
  MTLComputePipelineState *fgBgForDebug;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  uint64_t v30;
  _QWORD v31[3];
  int64_t v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v32 = a7;
  if (!self->_fgBgForDebug)
  {
    -[PTMetalContext computePipelineStateFor:withConstants:](self->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("fgBgForDebug"), self[1].super.isa);
    v16 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    fgBgForDebug = self->_fgBgForDebug;
    self->_fgBgForDebug = v16;

    if (!self->_fgBgForDebug)
    {
      _PTLogSystem();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PTEffectRelighting fgBgDebugWithDisparity:inDiffuse:inFocusDisparityModifier:outMask:debugType:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

    }
  }
  -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "computeCommandEncoder");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setComputePipelineState:", self->_fgBgForDebug);
  objc_msgSend(v27, "setTexture:atIndex:", v12, 0);
  objc_msgSend(v27, "setTexture:atIndex:", v13, 1);
  objc_msgSend(v27, "setTexture:atIndex:", v15, 2);
  objc_msgSend(v27, "setBuffer:offset:atIndex:", v14, 24, 0);
  objc_msgSend(v27, "setBytes:length:atIndex:", self->_anon_60, 128, 1);
  objc_msgSend(v27, "setBytes:length:atIndex:", &self->_smoothFaceRects, 336, 2);
  objc_msgSend(v27, "setBytes:length:atIndex:", &v32, 8, 3);
  -[PTSyntheticLight lightEstimation](self->_syntheticLight, "lightEstimation");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setBuffer:offset:atIndex:", v28, 0, 4);

  v31[0] = objc_msgSend(v15, "width");
  v31[1] = objc_msgSend(v15, "height");
  v31[2] = 1;
  v29 = xmmword_1C9322A40;
  v30 = 1;
  objc_msgSend(v27, "dispatchThreads:threadsPerThreadgroup:", v31, &v29);
  objc_msgSend(v27, "endEncoding");

}

- (void)lightMaskDebugWithMSRPyramid:(id)a3 outFaceMask:(id)a4
{
  id v6;
  id v7;
  MTLComputePipelineState *v8;
  MTLComputePipelineState *lightMaskForDebug;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[3];

  v6 = a3;
  v7 = a4;
  if (!self->_lightMaskForDebug)
  {
    -[PTMetalContext computePipelineStateFor:withConstants:](self->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("lightMaskForDebug"), 0);
    v8 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
    lightMaskForDebug = self->_lightMaskForDebug;
    self->_lightMaskForDebug = v8;

    if (!self->_lightMaskForDebug)
    {
      _PTLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[PTEffectRelighting lightMaskDebugWithMSRPyramid:outFaceMask:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    }
  }
  -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "computeCommandEncoder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setComputePipelineState:", self->_lightMaskForDebug);
  objc_msgSend(v6, "pyramidRGBA");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTexture:atIndex:", v21, 0);

  objc_msgSend(v19, "setTexture:atIndex:", v7, 1);
  objc_msgSend(v19, "setBytes:length:atIndex:", &self->_smoothFaceRects, 336, 0);
  v24[0] = objc_msgSend(v7, "width");
  v24[1] = objc_msgSend(v7, "height");
  v24[2] = 1;
  v22 = xmmword_1C9322A40;
  v23 = 1;
  objc_msgSend(v19, "dispatchThreads:threadsPerThreadgroup:", v24, &v22);
  objc_msgSend(v19, "endEncoding");

}

- (void)estimateLightIntensity:(id)a3 inFaceRects:numberOfFaceRects:humanDetections:effectRenderRequest:asyncWork:
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  void *v19;
  PTSyntheticLight *syntheticLight;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v8 = v7;
  v9 = v5;
  v10 = v4;
  v11 = v3;
  v14 = v6;
  v15 = v8;
  v16 = v9;
  v17 = a3;
  objc_msgSend(v14, "frameTimeSeconds");
  objc_msgSend(v14, "frameTimeSeconds");
  *(float *)&v18 = v18;
  LODWORD(self->_colorCube) = LODWORD(v18);
  v19 = *(void **)&self->_lastFrameTimeSeconds;
  objc_msgSend(v14, "luxLevel");
  objc_msgSend(v19, "updateWithLuxLevel:deltaTime:");
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  if (v14)
    objc_msgSend(v14, "transform");
  objc_msgSend(v14, "relightStrengthStudioLight");
  -[PTEffectRelighting updateParamters:relightStrength:](self, "updateParamters:relightStrength:", v14);
  v21 = v24;
  v22 = v25;
  v23 = v26;
  -[PTEffectRelighting computeSmoothFaceRect:transform:](self, "computeSmoothFaceRect:transform:", v16, &v21);
  syntheticLight = self->_syntheticLight;
  v21 = v24;
  v22 = v25;
  v23 = v26;
  -[PTSyntheticLight estimateLightIntensityWithFaceRects:inTex:numberOfFaceRects:transform:humanDetections:asyncWork:](syntheticLight, "estimateLightIntensityWithFaceRects:inTex:numberOfFaceRects:transform:humanDetections:asyncWork:", v11, v17, v10, &v21, v16, v15);

}

- (void)studioLightInYUV:(id)a3 inDiffuse:(id)a4 inDisparity:(id)a5 inFocusDisparityModifier:(id)a6 outYUV:(id)a7 relightStrength:(float)a8 studioLightFromSegmentationBlend:(float)a9 studioLightEffectModifier:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  int v38;
  double v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  PTUtil *util;
  void *v50;
  PTImageblockConfig *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  __int128 v64;
  uint64_t v65;
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  _DWORD v69[3];

  v18 = a3;
  v19 = a7;
  v20 = a10;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  objc_msgSend(v18, "texLuma");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "texLuma");
  v25 = objc_claimAutoreleasedReturnValue();
  v59 = v20;
  v60 = v19;
  if (v24 == (void *)v25)
  {

  }
  else
  {
    v26 = (void *)v25;
    objc_msgSend(v18, "texChroma");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "texChroma");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27 != v28)
      goto LABEL_8;
  }
  _PTLogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    -[PTEffectRelighting studioLightInYUV:inDiffuse:inDisparity:inFocusDisparityModifier:outYUV:relightStrength:studioLightFromSegmentationBlend:studioLightEffectModifier:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);

LABEL_8:
  objc_msgSend(v18, "transferFunction");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = +[PTColorConversion getTransferFunction:toLinear:](PTColorConversion, "getTransferFunction:toLinear:", v37, 0);

  v69[0] = v38;
  *(float *)&self->_anon_60[112] = a9;
  *(float *)&v39 = a8;
  -[PTSyntheticLight interpolateLightIntensity:](self->_syntheticLight, "interpolateLightIntensity:", v39);
  memset(v68, 0, sizeof(v68));
  +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v18, 0);
  memset(v67, 0, sizeof(v67));
  +[PTColorConversion getColorMatrix:toRGB:](PTColorConversion, "getColorMatrix:toRGB:", v18, 1);
  -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "computeCommandEncoder");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "setComputePipelineState:", self->_createLightMask);
  objc_msgSend(v41, "setTexture:atIndex:", *(_QWORD *)self->_bgVignetteLightIntensity, 0);
  objc_msgSend(v41, "setBytes:length:atIndex:", &self->_smoothFaceRects, 336, 0);
  v42 = objc_msgSend(*(id *)self->_bgVignetteLightIntensity, "width");
  v43 = objc_msgSend(*(id *)self->_bgVignetteLightIntensity, "height");
  v66[0] = v42;
  v66[1] = v43;
  v66[2] = 1;
  v64 = xmmword_1C9322A40;
  v65 = 1;
  objc_msgSend(v41, "dispatchThreads:threadsPerThreadgroup:", v66, &v64);
  objc_msgSend(v41, "endEncoding");
  -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "computeCommandEncoder");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "setComputePipelineState:", self->_studioLight);
  objc_msgSend(v45, "setTexture:atIndex:", *(_QWORD *)&self->_colorCubeType, 0);
  objc_msgSend(v45, "setTexture:atIndex:", v23, 1);

  objc_msgSend(v45, "setTexture:atIndex:", v22, 2);
  objc_msgSend(v45, "setTexture:atIndex:", *(_QWORD *)self->_bgVignetteLightIntensity, 3);
  objc_msgSend(v45, "setTexture:atIndex:", self->_lightGainMapLowResFiltered, 4);
  objc_msgSend(v45, "setBytes:length:atIndex:", v68, 24, 0);
  objc_msgSend(v45, "setBytes:length:atIndex:", v67, 24, 1);
  objc_msgSend(v45, "setBytes:length:atIndex:", v69, 4, 2);
  objc_msgSend(v45, "setBytes:length:atIndex:", self->_anon_60, 128, 3);
  -[PTSyntheticLight lightEstimation](self->_syntheticLight, "lightEstimation");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setBuffer:offset:atIndex:", v46, 0, 4);

  objc_msgSend(v45, "setBuffer:offset:atIndex:", v21, 24, 5);
  objc_msgSend(v45, "setBytes:length:atIndex:", &self->_smoothFaceRects, 336, 6);
  objc_msgSend(v45, "setBuffer:offset:atIndex:", v59, 0, 7);

  v47 = -[MTLTexture width](self->_lightGainMapLowResFiltered, "width");
  v48 = -[MTLTexture height](self->_lightGainMapLowResFiltered, "height");
  v63[0] = v47;
  v63[1] = v48;
  v63[2] = 1;
  v64 = xmmword_1C9322A40;
  v65 = 1;
  objc_msgSend(v45, "dispatchThreads:threadsPerThreadgroup:", v63, &v64);
  objc_msgSend(v45, "endEncoding");
  util = self->_util;
  -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTUtil gaussianFilter3x3:inRGB:outRGB:](util, "gaussianFilter3x3:inRGB:outRGB:", v50, self->_lightGainMapLowResFiltered, self->_lightGainMapFiltered);

  -[PTEffectRelighting filterLightGainApplyInRGB:](self, "filterLightGainApplyInRGB:", self->_relightSizeRGBA);
  v51 = -[PTImageblockConfig initWithPTTexture:]([PTImageblockConfig alloc], "initWithPTTexture:", v60);
  -[PTMetalContext commandBuffer](self->_metalContext, "commandBuffer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "computeCommandEncoder");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v53, "setComputePipelineState:", self->_relightFullsizeInput);
  objc_msgSend(v53, "setImageblockWidth:height:", -[PTImageblockConfig imageblockSize](v51, "imageblockSize"), -[PTImageblockConfig imageblockSize](v51, "imageblockSize"));
  objc_msgSend(v53, "setTexture:atIndex:", self->_brightSceneDetector, 0);
  objc_msgSend(v18, "texLuma");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setTexture:atIndex:", v54, 1);

  objc_msgSend(v18, "texChroma");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setTexture:atIndex:", v55, 2);

  -[PTMSRResize cubeTexture](self->_msrColorPyramid, "cubeTexture");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setTexture:atIndex:", v56, 3);

  objc_msgSend(v60, "texLuma");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setTexture:atIndex:", v57, 4);

  objc_msgSend(v60, "texChroma");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setTexture:atIndex:", v58, 5);

  objc_msgSend(v53, "setBytes:length:atIndex:", v68, 24, 0);
  objc_msgSend(v53, "setBytes:length:atIndex:", v67, 24, 1);
  objc_msgSend(v53, "setBytes:length:atIndex:", v69, 4, 2);
  objc_msgSend(v53, "setBytes:length:atIndex:", self->_anon_60, 128, 3);
  if (v51)
  {
    -[PTImageblockConfig threads](v51, "threads");
    -[PTImageblockConfig threadsPerGroup](v51, "threadsPerGroup");
  }
  else
  {
    memset(v62, 0, sizeof(v62));
    memset(v61, 0, sizeof(v61));
  }
  objc_msgSend(v53, "dispatchThreads:threadsPerThreadgroup:", v62, v61);
  objc_msgSend(v53, "endEncoding");
  ++self->_frameIndex;

}

- (id)approximateDiffuseFromSegmentation:(id)a3
{
  MTLTexture *approximatedDiffuseIntermediate;
  PTMetalContext *metalContext;
  id v6;
  void *v7;

  approximatedDiffuseIntermediate = self->_approximatedDiffuseIntermediate;
  metalContext = self->_metalContext;
  v6 = a3;
  -[PTMetalContext commandBuffer](metalContext, "commandBuffer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTLTexture boxFilter1Channel:inTex:intermediate:outTex:kernelWidth:outputRemapping:](approximatedDiffuseIntermediate, "boxFilter1Channel:inTex:intermediate:outTex:kernelWidth:outputRemapping:", v7, v6, self->_approximatedDiffuse, self->_functionConstants, 13, 0.00781250557);

  return self->_functionConstants;
}

- (int)filterLightGainApplyInRGB:(id)a3
{
  PTMetalContext *metalContext;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[3];

  metalContext = self->_metalContext;
  v5 = a3;
  -[PTMetalContext commandBuffer](metalContext, "commandBuffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "computeCommandEncoder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setComputePipelineState:", self->_filterLightGainApplyToRGB);
  objc_msgSend(v7, "setTexture:atIndex:", self->_lightGainMapFiltered, 0);
  objc_msgSend(v7, "setTexture:atIndex:", self->_brightSceneDetector, 1);
  objc_msgSend(v7, "setTexture:atIndex:", v5, 2);

  v8 = -[PTBrightSceneDetector width](self->_brightSceneDetector, "width");
  v9 = -[PTBrightSceneDetector height](self->_brightSceneDetector, "height");
  v13[0] = v8;
  v13[1] = v9;
  v13[2] = 1;
  v11 = xmmword_1C9323050;
  v12 = 1;
  objc_msgSend(v7, "dispatchThreads:threadsPerThreadgroup:", v13, &v11);
  objc_msgSend(v7, "endEncoding");

  return 0;
}

- (id)syntheticLight
{
  return self->_syntheticLight;
}

- (void)reset
{
  kdebug_trace();
  self->_frameIndex = 0;
  -[PTSyntheticLight reset](self->_syntheticLight, "reset");
  objc_msgSend(*(id *)&self->_lastFrameTimeSeconds, "reset");
  kdebug_trace();
}

- (id)brightSceneDetector
{
  return *(id *)&self->_lastFrameTimeSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self[1].super.isa, 0);
  objc_storeStrong((id *)&self->_functionConstants, 0);
  objc_storeStrong((id *)&self->_approximatedDiffuse, 0);
  objc_storeStrong((id *)&self->_approximatedDiffuseIntermediate, 0);
  objc_storeStrong((id *)&self->_colorCubeType, 0);
  objc_storeStrong((id *)&self->_relightSizeRGBA, 0);
  objc_storeStrong((id *)&self->_quarterSizeRGBA, 0);
  objc_storeStrong((id *)&self->_msrColorPyramid, 0);
  objc_storeStrong((id *)&self->_lastFrameTimeSeconds, 0);
  objc_storeStrong((id *)&self->_brightSceneDetector, 0);
  objc_storeStrong((id *)&self->_lightGainMapFiltered, 0);
  objc_storeStrong((id *)&self->_lightGainMapLowResFiltered, 0);
  objc_storeStrong((id *)self->_bgVignetteLightIntensity, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_syntheticLight, 0);
  objc_storeStrong((id *)&self->_filterLightGainApplyToRGB, 0);
  objc_storeStrong((id *)&self->_lightMaskOutline, 0);
  objc_storeStrong((id *)&self->_relightFullsizeInput, 0);
  objc_storeStrong((id *)&self->_lightMaskForDebug, 0);
  objc_storeStrong((id *)&self->_fgBgForDebug, 0);
  objc_storeStrong((id *)&self->_createLightMask, 0);
  objc_storeStrong((id *)&self->_studioLight, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 faceAttributesNetwork:(uint64_t)a4 availableEffectTypes:(uint64_t)a5 effectUtil:(uint64_t)a6 util:(uint64_t)a7 prewarmOnly:(uint64_t)a8 colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(float *)a1 faceAttributesNetwork:(NSObject *)a2 availableEffectTypes:effectUtil:util:prewarmOnly:colorSize:msrColorPyramid:studiolightFromSegmentation:sharedResources:.cold.11(float *a1, NSObject *a2)
{
  double v2;
  int v3;
  double v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_1C9281000, a2, OS_LOG_TYPE_DEBUG, "lightGainMapScale: %f", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)updateParamters:(uint64_t)a3 relightStrength:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Invalid fgOffsetFactorNear", a5, a6, a7, a8, 0);
}

- (void)fgBgDebugWithDisparity:(uint64_t)a3 inDiffuse:(uint64_t)a4 inFocusDisparityModifier:(uint64_t)a5 outMask:(uint64_t)a6 debugType:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)lightMaskDebugWithMSRPyramid:(uint64_t)a3 outFaceMask:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)studioLightInYUV:(NSObject *)a1 inDiffuse:(uint64_t)a2 inDisparity:(uint64_t)a3 inFocusDisparityModifier:(uint64_t)a4 outYUV:(uint64_t)a5 relightStrength:(uint64_t)a6 studioLightFromSegmentationBlend:(uint64_t)a7 studioLightEffectModifier:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1C9281000, a1, a3, "Unexpected read write access to input/output texture", a5, a6, a7, a8, 0);
}

@end
