@implementation PTRaytracingV4001

- (PTRaytracingV4001)initWithMetalContext:(id)a3 renderEffects:(id)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6 debugRendering:(int64_t)a7 verbose:(BOOL)a8 options:(id)a9 quality:(int)a10
{
  uint64_t v10;
  id v15;
  id v16;
  PTRaytracingV4001 *v17;
  uint64_t v18;
  PTQualitySettings *qualitySettings;
  float v20;
  float v21;
  float v22;
  float v23;
  void *v24;
  uint64_t v25;
  PTPyramid *rgbaPyramid;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  PTPyramid *v35;
  PTPyramid *v36;
  PTRaytracingUtils *v37;
  PTRaytracingUtils *raytracingUtils;
  PTRaytracingInterpolateResult *v39;
  PTRaytracingInterpolateResult *raytracingInterpolateResult;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  MTLBuffer *xy;
  uint64_t v45;
  MTLBuffer *randomUChars;
  _BOOL4 v47;
  float v48;
  float v49;
  int v50;
  float v51;
  int v52;
  float64x2_t v54;
  void *v55;
  void *v56;
  float v57;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  BOOL v68;
  float v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  uint64_t v78;
  MTLComputePipelineState *raytracingSDOF;
  PTGlobalReduction *v80;
  PTGlobalReduction *globalReduction;
  void *v82;
  uint64_t v83;
  MTLBuffer *disparityDiffGlobalMinMax;
  void *v85;
  uint64_t v86;
  MTLTexture *disparityEdges;
  void *v88;
  uint64_t v89;
  MTLTexture *disparityEdgesTemp;
  PTGuidedFilter *v91;
  uint64_t v92;
  PTGuidedFilter *guidedFilter;
  float v94;
  CGFloat v95;
  float v96;
  void *v97;
  uint64_t v98;
  MTLTexture *disparityDiffUpscaled;
  MTLTexture *v100;
  PTPyramid *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  MTLTexture *guideRGBAUpscale;
  PTPyramid *v106;
  uint64_t v107;
  MTLTexture *guideRGBACoefficients;
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
  uint64_t v133;
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
  PTRaytracingV4001 *v144;
  NSObject *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  MTLTexture *disparityDiff;
  void *v157;
  _BOOL4 v158;
  double v159;
  double v160;
  uint64_t v161;
  MTLTexture *focusEdgeMask;
  float v163;
  double v164;
  float v165;
  double v166;
  void *v167;
  uint64_t v168;
  MTLTexture *raytracedRGBWeight;
  void *v170;
  uint64_t v171;
  MTLTexture *raytracedRGBWeightUpscaled;
  NSObject *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  double v244;
  double v245;
  double v246;
  double width;
  double height;
  _QWORD v249[3];
  _QWORD v250[3];
  _QWORD v251[3];
  BOOL v252;
  objc_super v253;

  v10 = *(_QWORD *)&a10;
  width = a6.width;
  height = a6.height;
  v245 = a5.width;
  v246 = a5.height;
  v15 = a3;
  v16 = a9;
  v253.receiver = self;
  v253.super_class = (Class)PTRaytracingV4001;
  v17 = -[PTRaytracingV4001 init](&v253, sel_init);
  if (!v17)
    goto LABEL_46;
  PTKTraceInit();
  v17->_disparitySize.width = width;
  v17->_disparitySize.height = height;
  objc_storeStrong((id *)&v17->_metalContext, a3);
  v17->_debugRendering = a7;
  objc_storeStrong((id *)&v17->_options, a9);
  +[PTQualitySettings createWithQuality:options:](PTQualitySettings, "createWithQuality:options:", v10, v16);
  v18 = objc_claimAutoreleasedReturnValue();
  qualitySettings = v17->_qualitySettings;
  v17->_qualitySettings = (PTQualitySettings *)v18;

  if (v17->_qualitySettings)
  {
    +[PTRaytracingUtils createFocusEdge](PTRaytracingUtils, "createFocusEdge");
    v17->_focusEdge.width = v20;
    v17->_focusEdge.gradientThreshold = v21;
    v17->_focusEdge.gradientWeight = v22;
    v17->_focusEdge.minMaxThreshold = v23;
    v17->_skipFullSizeLayer = -[PTQualitySettings quality](v17->_qualitySettings, "quality") < 100;
    objc_msgSend(v16, "objectForKeyedSubscript:", &unk_1E8251D10);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v17->_injectedRGBAPyramid = v24 != 0;

    if (v17->_injectedRGBAPyramid)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", &unk_1E8251D10);
      v25 = objc_claimAutoreleasedReturnValue();
      rgbaPyramid = v17->_rgbaPyramid;
      v17->_rgbaPyramid = (PTPyramid *)v25;

      goto LABEL_8;
    }
    v35 = -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:]([PTPyramid alloc], "initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:", v15, 115, v17->_skipFullSizeLayer, -[PTQualitySettings doFirstLevelGaussianDownsample](v17->_qualitySettings, "doFirstLevelGaussianDownsample"), 4, v245, v246);
    v36 = v17->_rgbaPyramid;
    v17->_rgbaPyramid = v35;

    if (v17->_rgbaPyramid)
    {
LABEL_8:
      v37 = -[PTRaytracingUtils initWithMetalContext:]([PTRaytracingUtils alloc], "initWithMetalContext:", v15);
      raytracingUtils = v17->_raytracingUtils;
      v17->_raytracingUtils = v37;

      if (v17->_raytracingUtils)
      {
        v39 = -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:]([PTRaytracingInterpolateResult alloc], "initWithMetalContext:useExportQualityNoise:", v15, -[PTQualitySettings useExportQualityNoise](v17->_qualitySettings, "useExportQualityNoise"));
        raytracingInterpolateResult = v17->_raytracingInterpolateResult;
        v17->_raytracingInterpolateResult = v39;

        if (v17->_raytracingInterpolateResult)
        {
          v41 = +[PTPrecomputeRandom computeUnitDiskPoints:numberOfPatternCircles:](PTPrecomputeRandom, "computeUnitDiskPoints:numberOfPatternCircles:", v15, -[PTQualitySettings numberOfPatternCircles](v17->_qualitySettings, "numberOfPatternCircles"));
          v43 = v42;
          xy = v17->_aperturePoints.xy;
          v17->_aperturePoints.xy = (MTLBuffer *)v41;

          *((_WORD *)&v17->_aperturePoints.rayCount + 2) = WORD2(v43);
          v17->_aperturePoints.rayCount = v43;
          if (v17->_aperturePoints.xy)
          {
            +[PTPrecomputeRandom computeRandomUChars:rayCount:](PTPrecomputeRandom, "computeRandomUChars:rayCount:", v15, v43);
            v45 = objc_claimAutoreleasedReturnValue();
            randomUChars = v17->_randomUChars;
            v17->_randomUChars = (MTLBuffer *)v45;

            if (v17->_randomUChars)
            {
              v17->_doVisualization = 0;
              v47 = -[PTQualitySettings doMacroApertureLimit](v17->_qualitySettings, "doMacroApertureLimit");
              v48 = 0.0051429;
              if (v47)
                v48 = 0.00043025;
              v17->_circleOfConfusionReference = v48;
              v17->_fNumberLimitWeight = 0.33333;
              *(float32x2_t *)&v17->_circleOfConfusionLimitBgFg[4] = vmul_n_f32((float32x2_t)0x3FC0000040800000, v48);
              -[PTQualitySettings circleOfConfusionLimitBackground](v17->_qualitySettings, "circleOfConfusionLimitBackground");
              if (fabsf(v49) != INFINITY)
              {
                -[PTQualitySettings circleOfConfusionLimitBackground](v17->_qualitySettings, "circleOfConfusionLimitBackground");
                *(_DWORD *)&v17->_circleOfConfusionLimitBgFg[4] = v50;
              }
              -[PTQualitySettings circleOfConfusionLimitForeground](v17->_qualitySettings, "circleOfConfusionLimitForeground");
              if (fabsf(v51) != INFINITY)
              {
                -[PTQualitySettings circleOfConfusionLimitForeground](v17->_qualitySettings, "circleOfConfusionLimitForeground");
                *(_DWORD *)&v17->_circleOfConfusionLimitBgFg[8] = v52;
              }
              v17->_kRayCount = v17->_aperturePoints.rayCount;
              _H8 = *((_WORD *)&v17->_aperturePoints.rayCount + 2);
              v54.f64[0] = v245;
              v54.f64[1] = v246;
              *(float32x2_t *)v17->_sourceColorSize = vcvt_f32_f64(v54);
              v54.f64[0] = width;
              v54.f64[1] = height;
              *(float32x2_t *)v17->_sourceDisparitySize = vcvt_f32_f64(v54);
              v17->_anamorphicFactor = 1.2;
              objc_msgSend(v16, "objectForKeyedSubscript:", &unk_1E8251D28);
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              if (v55)
              {
                objc_msgSend(v16, "objectForKeyedSubscript:", &unk_1E8251D28);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "floatValue");
                v17->_anamorphicFactor = v57;

              }
              __asm { FCVT            S8, H8 }
              v17->_kPyramidSamplingFraction = 0.665;
              v17->_edgeTolerance = 0.025;
              v252 = 0;
              v252 = -[PTQualitySettings rayMarch](v17->_qualitySettings, "rayMarch");
              -[PTQualitySettings renderDownscale](v17->_qualitySettings, "renderDownscale");
              v63 = 3.0;
              if (v64 <= 3.0)
              {
                -[PTQualitySettings renderDownscale](v17->_qualitySettings, "renderDownscale");
                v63 = 1.0;
                if (v65 >= 2.0)
                  v63 = 2.0;
              }
              -[PTQualitySettings renderDownscale](v17->_qualitySettings, "renderDownscale");
              v67 = v66 + 0.5;
              v68 = v66 <= 2.0;
              v69 = 2.5;
              if (!v68)
                v69 = v67;
              *(float *)&v70 = 1.0 / (float)(0.5 - v69);
              *((float *)&v70 + 1) = -v69;
              v244 = v70;
              v71 = (void *)objc_opt_new();
              objc_msgSend(v71, "setConstantValue:type:withName:", &v17->_kRayCount, 29, CFSTR("kRaycount"));
              objc_msgSend(v71, "setConstantValue:type:withName:", &v252, 53, CFSTR("kRayMarch"));
              objc_msgSend(v71, "setConstantValue:type:withName:", &v17->_skipFullSizeLayer, 53, CFSTR("kSkipFullSizeLayer"));
              LODWORD(v72) = _S8;
              objc_msgSend(v71, "setConstantFloat:withName:", CFSTR("kRadiusLocal_float"), v72);
              LODWORD(v73) = 0.25;
              objc_msgSend(v71, "setConstantFloat:withName:", CFSTR("kRadiusLocalFraction_float"), v73);
              *(float *)&v74 = v63;
              objc_msgSend(v71, "setConstantFloat:withName:", CFSTR("kDiameterCoverageLimit_float"), v74);
              objc_msgSend(v71, "setConstantFloat2:withName:", CFSTR("kFocusBlendCoefficients_float2"), v244);
              *(float *)&v75 = v17->_kPyramidSamplingFraction;
              objc_msgSend(v71, "setConstantFloat:withName:", CFSTR("kPyramidSamplingFraction_float"), v75);
              LODWORD(v76) = 6.0;
              objc_msgSend(v71, "setConstantFloat:withName:", CFSTR("kRayMarchDisparityRadiusTolerance_float"), v76);
              LODWORD(v77) = 1017370378;
              objc_msgSend(v71, "setConstantFloat:withName:", CFSTR("kHighlightBoostFactor_float"), v77);
              -[PTMetalContext computePipelineStateFor:withConstants:](v17->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("raytracingV4001"), v71);
              v78 = objc_claimAutoreleasedReturnValue();
              raytracingSDOF = v17->_raytracingSDOF;
              v17->_raytracingSDOF = (MTLComputePipelineState *)v78;

              if (!v17->_raytracingSDOF)
              {
                _PTLogSystem();
                v146 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                  -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.7(v146, v147, v148, v149, v150, v151, v152, v153);
                goto LABEL_82;
              }
              if (-[PTQualitySettings rayMarch](v17->_qualitySettings, "rayMarch"))
              {
                v80 = -[PTGlobalReduction initWithMetalContext:textureSize:]([PTGlobalReduction alloc], "initWithMetalContext:textureSize:", v15, width, height);
                globalReduction = v17->_globalReduction;
                v17->_globalReduction = v80;

                if (!v17->_globalReduction)
                {
                  _PTLogSystem();
                  v146 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.8(v146, v174, v175, v176, v177, v178, v179, v180);
                  goto LABEL_82;
                }
                objc_msgSend(v15, "device");
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                v83 = objc_msgSend(v82, "newBufferWithLength:options:", 8, 0);
                disparityDiffGlobalMinMax = v17->_disparityDiffGlobalMinMax;
                v17->_disparityDiffGlobalMinMax = (MTLBuffer *)v83;

                if (!v17->_disparityDiffGlobalMinMax)
                {
                  _PTLogSystem();
                  v146 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.9(v146, v181, v182, v183, v184, v185, v186, v187);
                  goto LABEL_82;
                }
                -[PTMetalContext textureUtil](v17->_metalContext, "textureUtil");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "createWithSize:pixelFormat:", 10, width, height);
                v86 = objc_claimAutoreleasedReturnValue();
                disparityEdges = v17->_disparityEdges;
                v17->_disparityEdges = (MTLTexture *)v86;

                if (!v17->_disparityEdges)
                {
                  _PTLogSystem();
                  v146 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.10(v146, v202, v203, v204, v205, v206, v207, v208);
                  goto LABEL_82;
                }
                -[PTMetalContext textureUtil](v17->_metalContext, "textureUtil");
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v88, "createWithSize:pixelFormat:", 10, width, height);
                v89 = objc_claimAutoreleasedReturnValue();
                disparityEdgesTemp = v17->_disparityEdgesTemp;
                v17->_disparityEdgesTemp = (MTLTexture *)v89;

                if (!v17->_disparityEdgesTemp)
                {
                  _PTLogSystem();
                  v146 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.11(v146, v230, v231, v232, v233, v234, v235, v236);
                  goto LABEL_82;
                }
              }
              if (-[PTQualitySettings doDisparityUpsampling](v17->_qualitySettings, "doDisparityUpsampling"))
              {
                v91 = [PTGuidedFilter alloc];
                v251[0] = (unint64_t)width;
                v251[1] = (unint64_t)height;
                v251[2] = 1;
                -[PTQualitySettings disparityGuidedFilterEpsilon](v17->_qualitySettings, "disparityGuidedFilterEpsilon");
                v92 = -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:](v91, "initWithMetalContext:inputSize:epsilon:", v15, v251);
                guidedFilter = v17->_guidedFilter;
                v17->_guidedFilter = (PTGuidedFilter *)v92;

                if (!v17->_guidedFilter)
                {
                  _PTLogSystem();
                  v146 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.12(v146, v188, v189, v190, v191, v192, v193, v194);
                  goto LABEL_82;
                }
                -[PTQualitySettings disparityUpsampleFactor](v17->_qualitySettings, "disparityUpsampleFactor");
                v95 = width * v94;
                -[PTQualitySettings disparityUpsampleFactor](v17->_qualitySettings, "disparityUpsampleFactor");
                v17->_disparitySizeUpscaled.width = v95;
                v17->_disparitySizeUpscaled.height = height * v96;
                objc_msgSend(v15, "textureUtil");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "createWithSize:pixelFormat:", 25, v17->_disparitySizeUpscaled.width, v17->_disparitySizeUpscaled.height);
                v98 = objc_claimAutoreleasedReturnValue();
                disparityDiffUpscaled = v17->_disparityDiffUpscaled;
                v17->_disparityDiffUpscaled = (MTLTexture *)v98;

                v100 = v17->_disparityDiffUpscaled;
                if (!v100)
                {
                  _PTLogSystem();
                  v146 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.13(v146, v209, v210, v211, v212, v213, v214, v215);
                  goto LABEL_82;
                }
                v101 = v17->_rgbaPyramid;
                v102 = -[MTLTexture width](v100, "width");
                v103 = -[MTLTexture height](v17->_disparityDiffUpscaled, "height");
                v250[0] = v102;
                v250[1] = v103;
                v250[2] = 1;
                -[PTPyramid findMipmapLevelLargerThan:](v101, "findMipmapLevelLargerThan:", v250);
                v104 = objc_claimAutoreleasedReturnValue();
                guideRGBAUpscale = v17->_guideRGBAUpscale;
                v17->_guideRGBAUpscale = (MTLTexture *)v104;

                v106 = v17->_rgbaPyramid;
                v249[0] = (unint64_t)width;
                v249[1] = (unint64_t)height;
                v249[2] = 1;
                -[PTPyramid findMipmapLevelLargerThan:](v106, "findMipmapLevelLargerThan:", v249);
                v107 = objc_claimAutoreleasedReturnValue();
                guideRGBACoefficients = v17->_guideRGBACoefficients;
                v17->_guideRGBACoefficients = (MTLTexture *)v107;

              }
              else if (-[PTQualitySettings doCenterDisparity](v17->_qualitySettings, "doCenterDisparity"))
              {
                -[PTMetalContext textureUtil](v17->_metalContext, "textureUtil");
                v154 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v154, "createWithSize:pixelFormat:", 25, width, height);
                v155 = objc_claimAutoreleasedReturnValue();
                disparityDiff = v17->_disparityDiff;
                v17->_disparityDiff = (MTLTexture *)v155;

                if (!v17->_disparityDiff)
                {
                  _PTLogSystem();
                  v146 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.17(v146, v223, v224, v225, v226, v227, v228, v229);
                  goto LABEL_82;
                }
              }
              if (!-[PTQualitySettings doFocusEdgeMask](v17->_qualitySettings, "doFocusEdgeMask"))
                goto LABEL_56;
              -[PTMetalContext textureUtil](v17->_metalContext, "textureUtil");
              v157 = (void *)objc_claimAutoreleasedReturnValue();
              v158 = -[PTQualitySettings doDisparityUpsampling](v17->_qualitySettings, "doDisparityUpsampling");
              v159 = width;
              v160 = height;
              if (v158)
              {
                v159 = v17->_disparitySizeUpscaled.width;
                v160 = v17->_disparitySizeUpscaled.height;
              }
              objc_msgSend(v157, "createWithSize:pixelFormat:", 25, v159, v160);
              v161 = objc_claimAutoreleasedReturnValue();
              focusEdgeMask = v17->_focusEdgeMask;
              v17->_focusEdgeMask = (MTLTexture *)v161;

              if (!v17->_focusEdgeMask)
              {
                _PTLogSystem();
                v146 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                  -[PTRaytracingUtils initWithMetalContext:].cold.6(v146, v216, v217, v218, v219, v220, v221, v222);
              }
              else
              {
LABEL_56:
                -[PTQualitySettings renderDownscale](v17->_qualitySettings, "renderDownscale");
                v164 = v245 / v163;
                -[PTQualitySettings renderDownscale](v17->_qualitySettings, "renderDownscale");
                v166 = v246 / v165;
                objc_msgSend(v15, "textureUtil");
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v167, "createWithSize:pixelFormat:", -[PTQualitySettings intermediatePixelFormat](v17->_qualitySettings, "intermediatePixelFormat"), v164, v166);
                v168 = objc_claimAutoreleasedReturnValue();
                raytracedRGBWeight = v17->_raytracedRGBWeight;
                v17->_raytracedRGBWeight = (MTLTexture *)v168;

                if (v17->_raytracedRGBWeight)
                {
                  if (!-[PTQualitySettings doIntermediate2XUpscale](v17->_qualitySettings, "doIntermediate2XUpscale"))
                    goto LABEL_59;
                  -[PTMetalContext textureUtil](v17->_metalContext, "textureUtil");
                  v170 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v170, "createWithWidth:height:pixelFormat:", (unint64_t)(v164 + v164), (unint64_t)(v166 + v166), -[PTQualitySettings intermediatePixelFormat](v17->_qualitySettings, "intermediatePixelFormat"));
                  v171 = objc_claimAutoreleasedReturnValue();
                  raytracedRGBWeightUpscaled = v17->_raytracedRGBWeightUpscaled;
                  v17->_raytracedRGBWeightUpscaled = (MTLTexture *)v171;

                  if (v17->_raytracedRGBWeightUpscaled)
                  {
LABEL_59:
                    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v17->_raytracedRGBWeight, v17->_disparityEdges, v17->_disparityEdgesTemp, 0);
                    v173 = objc_claimAutoreleasedReturnValue();
                    v146 = v173;
                    if (v17->_focusEdgeMask)
                      -[NSObject addObject:](v173, "addObject:");
                    v144 = v17;
                    goto LABEL_83;
                  }
                  _PTLogSystem();
                  v146 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.16(v146, v237, v238, v239, v240, v241, v242, v243);
                }
                else
                {
                  _PTLogSystem();
                  v146 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.15(v146, v195, v196, v197, v198, v199, v200, v201);
                }
              }
LABEL_82:
              v144 = 0;
LABEL_83:

              goto LABEL_47;
            }
            _PTLogSystem();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.6(v27, v137, v138, v139, v140, v141, v142, v143);
          }
          else
          {
            _PTLogSystem();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.5(v27, v130, v131, v132, v133, v134, v135, v136);
          }
        }
        else
        {
          _PTLogSystem();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.4(v27, v116, v117, v118, v119, v120, v121, v122);
        }
      }
      else
      {
        _PTLogSystem();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.3(v27, v109, v110, v111, v112, v113, v114, v115);
      }
      goto LABEL_45;
    }
    _PTLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.2(v27, v123, v124, v125, v126, v127, v128, v129);
  }
  else
  {
    _PTLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV4001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);
  }
LABEL_45:

LABEL_46:
  v144 = 0;
LABEL_47:

  return v144;
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
  double v9;
  double v10;
  PTPyramid *rgbaPyramid;
  void *v12;
  double v13;
  float32x2_t v14;
  float v15;
  float v16;
  __int32 v17;
  PTGlobalReduction *globalReduction;
  void *v19;
  double v20;
  double v21;
  double v22;
  PTRaytracingUtils *raytracingUtils;
  void *v24;
  MTLTexture *disparityEdgesTemp;
  MTLTexture *disparityEdges;
  MTLBuffer *disparityDiffGlobalMinMax;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  MTLTexture **p_disparityDiffUpscaled;
  MTLTexture *disparityDiffUpscaled;
  MTLTexture *guideRGBACoefficients;
  MTLTexture *guideRGBAUpscale;
  void *v36;
  uint64_t v37;
  MTLTexture *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  PTRaytracingUtils *v43;
  double v44;
  double v45;
  double v46;
  MTLTexture *v47;
  void *v48;
  unsigned int v49;
  float32x2_t v50;
  unsigned int v51;
  int32x2_t v57;
  float v58;
  unint64_t v59;
  float v60;
  float v61;
  unint64_t v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  MTLTexture *v73;
  void *v74;
  MTLTexture *v75;
  PTRaytracingInterpolateResult *raytracingInterpolateResult;
  void *v77;
  void *v78;
  unint64_t v80;
  PTGuidedFilter *guidedFilter;
  unsigned int v82;
  _QWORD v83[5];
  int64x2_t v84;
  uint64_t v85;
  _QWORD v86[3];
  _WORD v87[2];
  _OWORD v88[2];
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  float v92[3];
  _QWORD v93[2];
  __int128 v94;
  __int128 v95;
  uint64_t v96;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "renderState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quality");
  objc_msgSend(v7, "fNumber");
  objc_msgSend(v7, "focusDisparity");
  objc_msgSend(v7, "alphaLowLight");
  kdebug_trace();

  v96 = 0;
  v94 = 0u;
  v95 = 0u;
  *(float *)&v9 = self->_circleOfConfusionReference;
  *(float *)&v10 = self->_fNumberLimitWeight;
  +[PTRaytracingUtils createFocusObject:anamorphicFactor:colorSize:circleOfConfusionReference:fNumberLimitWeight:](PTRaytracingUtils, "createFocusObject:anamorphicFactor:colorSize:circleOfConfusionReference:fNumberLimitWeight:", v7, COERCE_DOUBLE((unint64_t)LODWORD(self->_anamorphicFactor)), *(double *)self->_sourceColorSize, v9, v10);
  v93[0] = 0;
  v93[1] = 0;
  if (!self->_injectedRGBAPyramid)
  {
    rgbaPyramid = self->_rgbaPyramid;
    objc_msgSend(v7, "sourceColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTPyramid updatePyramidFromPTTexture:inPTTexture:](rgbaPyramid, "updatePyramidFromPTTexture:inPTTexture:", v6, v12);

  }
  v13 = (*(float *)&v94 + *(float *)&v94) * *((float *)&v94 + 2);
  *(float *)&v13 = v13;
  v14 = vdiv_f32(*(float32x2_t *)&self->_circleOfConfusionLimitBgFg[4], (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v13, 0));
  v15 = -*((float *)&v94 + 1);
  v16 = -v14.f32[0];
  v92[0] = -*((float *)&v94 + 1);
  v92[1] = -v14.f32[0];
  v17 = v14.i32[1];
  v92[2] = v14.f32[1];
  globalReduction = self->_globalReduction;
  if (globalReduction)
  {
    objc_msgSend(v7, "sourceDisparity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTGlobalReduction parallelReductionMinMax:inTexture:globalMinMaxBuffer:](globalReduction, "parallelReductionMinMax:inTexture:globalMinMaxBuffer:", v6, v19, self->_disparityDiffGlobalMinMax);

    *(float *)&v20 = v15;
    *(float *)&v21 = v16;
    LODWORD(v22) = v17;
    -[PTRaytracingUtils disparityMinMaxApplyPostModifier:disparityMinMaxBuffer:postModfier:](self->_raytracingUtils, "disparityMinMaxApplyPostModifier:disparityMinMaxBuffer:postModfier:", v6, self->_disparityDiffGlobalMinMax, v20, v21, v22);
    raytracingUtils = self->_raytracingUtils;
    objc_msgSend(v7, "sourceDisparity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    disparityEdges = self->_disparityEdges;
    disparityEdgesTemp = self->_disparityEdgesTemp;
    disparityDiffGlobalMinMax = self->_disparityDiffGlobalMinMax;
    *(float *)&v28 = self->_edgeTolerance;
    v89 = v94;
    v90 = v95;
    v91 = v96;
    -[PTRaytracingUtils detectDilatedEdges:inDisparity:tempEdges:outEdges:focusObject:disparityDiffMinMax:edgeTolerance:](raytracingUtils, "detectDilatedEdges:inDisparity:tempEdges:outEdges:focusObject:disparityDiffMinMax:edgeTolerance:", v6, v24, disparityEdgesTemp, disparityEdges, &v89, disparityDiffGlobalMinMax, v28);

  }
  objc_msgSend(v7, "sourceDisparity");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PTQualitySettings doDisparityUpsampling](self->_qualitySettings, "doDisparityUpsampling"))
  {
    guidedFilter = self->_guidedFilter;
    objc_msgSend(v7, "sourceDisparity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v29;
    p_disparityDiffUpscaled = &self->_disparityDiffUpscaled;
    disparityDiffUpscaled = self->_disparityDiffUpscaled;
    guideRGBACoefficients = self->_guideRGBACoefficients;
    guideRGBAUpscale = self->_guideRGBAUpscale;
    objc_msgSend(v7, "renderState");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "sourceColorBitDepth");
    v38 = disparityDiffUpscaled;
    v29 = v31;
    -[PTGuidedFilter guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImage:sourceColorBitDepth:postModifierPtr:](guidedFilter, "guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImage:sourceColorBitDepth:postModifierPtr:", v6, v30, guideRGBACoefficients, guideRGBAUpscale, v38, v37, v92);

  }
  else
  {
    if (!-[PTQualitySettings doCenterDisparity](self->_qualitySettings, "doCenterDisparity"))
      goto LABEL_10;
    v43 = self->_raytracingUtils;
    objc_msgSend(v7, "sourceDisparity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    p_disparityDiffUpscaled = &self->_disparityDiff;
    *(float *)&v44 = v15;
    *(float *)&v45 = v16;
    LODWORD(v46) = v17;
    -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](v43, "disparityApplyPostModifier:inDisparity:outDisparity:postModfier:", v6, v30, self->_disparityDiff, v44, v45, v46);
  }

  v47 = *p_disparityDiffUpscaled;
  v29 = v47;
LABEL_10:
  if (self->_focusEdgeMask)
  {
    *(float *)&v39 = self->_focusEdge.width;
    *(float *)&v40 = self->_focusEdge.gradientThreshold;
    *(float *)&v41 = self->_focusEdge.gradientWeight;
    *(float *)&v42 = self->_focusEdge.minMaxThreshold;
    -[PTRaytracingUtils focusEdgeMask:inDisparityDiff:focusEdge:outFocusEdgeMask:](self->_raytracingUtils, "focusEdgeMask:inDisparityDiff:focusEdge:outFocusEdgeMask:", v6, v29, v39, v40, v41, v42);
  }
  v89 = 0u;
  v90 = 0u;
  if (v7)
    objc_msgSend(v7, "scissorRect");
  else
    memset(v88, 0, sizeof(v88));
  v48 = v29;
  +[PTImageblockConfig adjustScissorRectToImageBlocks:](PTImageblockConfig, "adjustScissorRectToImageBlocks:", v88);
  v80 = v89;
  -[PTQualitySettings renderDownscale](self->_qualitySettings, "renderDownscale");
  v82 = v49;
  v50 = vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)__PAIR128__(*((unint64_t *)&v89 + 1), v80)));
  -[PTQualitySettings renderDownscale](self->_qualitySettings, "renderDownscale");
  __asm { FMOV            V1.2D, #-0.5 }
  v57 = vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vaddq_f64(vcvtq_f64_f32(vdiv_f32(v50, (float32x2_t)__PAIR64__(v51, v82))), _Q1))));
  v87[1] = v57.i16[2];
  v87[0] = v57.i16[0];
  v50.f32[0] = (float)(unint64_t)v90;
  -[PTQualitySettings renderDownscale](self->_qualitySettings, "renderDownscale");
  v59 = vcvtpd_u64_f64((float)(v50.f32[0] / v58) + 0.5);
  v60 = (float)*((unint64_t *)&v90 + 1);
  -[PTQualitySettings renderDownscale](self->_qualitySettings, "renderDownscale");
  v62 = vcvtpd_u64_f64((float)(v60 / v61) + 0.5);
  objc_msgSend(v6, "computeCommandEncoder");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v63)
  {
    _PTLogSystem();
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v64, v65, v66, v67, v68, v69, v70, v71);

  }
  objc_msgSend(v63, "setComputePipelineState:", self->_raytracingSDOF);
  -[PTPyramid mipmapTexture](self->_rgbaPyramid, "mipmapTexture");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setTexture:atIndex:", v72, 0);

  objc_msgSend(v63, "setTexture:atIndex:", v48, 1);
  objc_msgSend(v63, "setTexture:atIndex:", self->_disparityEdges, 2);
  objc_msgSend(v63, "setTexture:atIndex:", self->_raytracedRGBWeight, 3);
  objc_msgSend(v63, "setTexture:atIndex:", self->_focusEdgeMask, 4);
  objc_msgSend(v63, "setBytes:length:atIndex:", v93, 16, 0);
  objc_msgSend(v63, "setBuffer:offset:atIndex:", self->_aperturePoints.xy, 0, 1);
  objc_msgSend(v63, "setBuffer:offset:atIndex:", self->_randomUChars, 0, 2);
  objc_msgSend(v63, "setBuffer:offset:atIndex:", self->_disparityDiffGlobalMinMax, 0, 3);
  objc_msgSend(v63, "setBytes:length:atIndex:", self->_sourceColorSize, 8, 4);
  objc_msgSend(v63, "setBytes:length:atIndex:", self->_sourceDisparitySize, 8, 5);
  objc_msgSend(v63, "setBytes:length:atIndex:", v87, 4, 6);
  v86[0] = v59;
  v86[1] = v62;
  v86[2] = 1;
  v84 = vdupq_n_s64(8uLL);
  v85 = 1;
  objc_msgSend(v63, "dispatchThreads:threadsPerThreadgroup:", v86, &v84);
  objc_msgSend(v63, "endEncoding");
  v73 = self->_raytracedRGBWeight;
  if (self->_raytracedRGBWeightUpscaled)
  {
    -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "copy:inTex:outTex:", v6, self->_raytracedRGBWeight, self->_raytracedRGBWeightUpscaled);

    v75 = self->_raytracedRGBWeightUpscaled;
    v73 = v75;
  }
  raytracingInterpolateResult = self->_raytracingInterpolateResult;
  if (self->_skipFullSizeLayer)
  {
    -[PTRaytracingInterpolateResult interpolateRGBWeightUsingSourceToDest:renderRequest:inRGBWeight:](self->_raytracingInterpolateResult, "interpolateRGBWeightUsingSourceToDest:renderRequest:inRGBWeight:", v6, v7, v73);
  }
  else
  {
    -[PTPyramid mipmapLevels](self->_rgbaPyramid, "mipmapLevels");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "objectAtIndexedSubscript:", 0);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRaytracingInterpolateResult interpolateRGBWeightUsingRGBALinearToDest:renderRequest:inRGBWeight:inRGBA:](raytracingInterpolateResult, "interpolateRGBWeightUsingRGBALinearToDest:renderRequest:inRGBWeight:inRGBA:", v6, v7, v73, v78);

  }
  if (kdebug_is_enabled())
  {
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke;
    v83[3] = &unk_1E822A0B0;
    v83[4] = self;
    objc_msgSend(v6, "addCompletedHandler:", v83);
  }

  return 0;
}

void __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "doDisparityUpsampling");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "renderDownscale");
  kdebug_trace();
  if (objc_msgSend(v3, "status") != 4)
  {
    _PTLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke_cold_2(v3, v4);

    if (objc_msgSend(v3, "status") != 4)
    {
      _PTLogSystem();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke_cold_1(v3, v5);

    }
  }

}

- (unint64_t)minimumResourceHeapSize
{
  return 1024;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_raytracingSDOF, 0);
  objc_storeStrong((id *)&self->_guideRGBAUpscale, 0);
  objc_storeStrong((id *)&self->_guideRGBACoefficients, 0);
  objc_storeStrong((id *)&self->_raytracedRGBWeightUpscaled, 0);
  objc_storeStrong((id *)&self->_raytracedRGBWeight, 0);
  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
  objc_storeStrong((id *)&self->_disparityDiffUpscaled, 0);
  objc_storeStrong((id *)&self->_disparityDiff, 0);
  objc_storeStrong((id *)&self->_disparityEdgesTemp, 0);
  objc_storeStrong((id *)&self->_disparityEdges, 0);
  objc_storeStrong((id *)&self->_disparityDiffGlobalMinMax, 0);
  objc_storeStrong((id *)&self->_randomUChars, 0);

  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_globalReduction, 0);
  objc_storeStrong((id *)&self->_raytracingInterpolateResult, 0);
  objc_storeStrong((id *)&self->_raytracingUtils, 0);
  objc_storeStrong((id *)&self->_qualitySettings, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_debugLayer, 0);
  objc_storeStrong((id *)&self->_rgbaPyramid, 0);
  objc_storeStrong((id *)&self->_options, 0);
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

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "%@ label %@", (uint8_t *)&v6, 0x16u);

}

void __62__PTRaytracingV4001_renderContinuousWithSource_renderRequest___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9281000, a2, OS_LOG_TYPE_ERROR, "Commandbuffer Error %@", (uint8_t *)&v4, 0xCu);

}

@end
