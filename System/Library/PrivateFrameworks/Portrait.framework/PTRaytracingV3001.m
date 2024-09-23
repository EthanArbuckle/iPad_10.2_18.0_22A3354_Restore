@implementation PTRaytracingV3001

- (PTRaytracingV3001)initWithMetalContext:(id)a3 renderEffects:(id)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6 debugRendering:(int64_t)a7 verbose:(BOOL)a8 options:(id)a9 quality:(int)a10
{
  uint64_t v10;
  id v16;
  id v17;
  id v18;
  PTRaytracingV3001 *v19;
  uint64_t v20;
  PTQualitySettings *qualitySettings;
  float v22;
  float v23;
  float v24;
  float v25;
  int v26;
  _BOOL4 updateSourceColor;
  BOOL v29;
  PTColorConversion *v30;
  PTColorConversion *colorConversion;
  void *v32;
  uint64_t v33;
  MTLTexture *rgba;
  void *v35;
  uint64_t v36;
  PTPyramid *rgbaPyramid;
  NSObject *v38;
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
  PTPyramid *v53;
  PTPyramid *v54;
  PTRaytracingUtils *v55;
  PTRaytracingUtils *raytracingUtils;
  PTRaytracingInterpolateResult *v57;
  PTRaytracingInterpolateResult *raytracingInterpolateResult;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  MTLBuffer *xy;
  uint64_t v63;
  MTLBuffer *randomUChars;
  _BOOL4 v65;
  float v66;
  float v67;
  int v68;
  float v69;
  int v70;
  float64x2_t v72;
  float64x2_t v73;
  void *v74;
  void *v75;
  float v76;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  BOOL v86;
  float v87;
  double v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  uint64_t v96;
  MTLComputePipelineState *raytracingSDOF;
  PTGlobalReduction *v98;
  PTGlobalReduction *globalReduction;
  void *v100;
  uint64_t v101;
  MTLBuffer *disparityDiffGlobalMinMax;
  void *v103;
  uint64_t v104;
  MTLTexture *disparityEdges;
  void *v106;
  uint64_t v107;
  MTLTexture *disparityEdgesTemp;
  PTGuidedFilter *v109;
  uint64_t v110;
  PTGuidedFilter *guidedFilter;
  float v112;
  CGFloat v113;
  float v114;
  void *v115;
  uint64_t v116;
  MTLTexture *disparityUpscaled;
  MTLTexture *v118;
  PTPyramid *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  MTLTexture *guideRGBAUpscale;
  PTPyramid *v124;
  uint64_t v125;
  MTLTexture *guideRGBACoefficients;
  void *v127;
  uint64_t v128;
  MTLTexture *disparityDiff;
  void *v130;
  uint64_t v131;
  MTLTexture *disparityEffects;
  void *v133;
  _BOOL4 v134;
  double v135;
  double v136;
  uint64_t v137;
  MTLTexture *focusEdgeMask;
  float v139;
  double v140;
  float v141;
  double v142;
  void *v143;
  uint64_t v144;
  MTLTexture *raytracedRGBWeight;
  void *v146;
  uint64_t v147;
  MTLTexture *raytracedRGBWeightUpscaled;
  NSObject *v149;
  NSObject *v150;
  PTRaytracingV3001 *v151;
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
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  double v279;
  double v280;
  double v281;
  double width;
  double height;
  _QWORD v284[3];
  _QWORD v285[3];
  _QWORD v286[3];
  BOOL v287;
  objc_super v288;

  v10 = *(_QWORD *)&a10;
  width = a6.width;
  height = a6.height;
  v280 = a5.width;
  v281 = a5.height;
  v16 = a3;
  v17 = a4;
  v18 = a9;
  v288.receiver = self;
  v288.super_class = (Class)PTRaytracingV3001;
  v19 = -[PTRaytracingV3001 init](&v288, sel_init);
  if (!v19)
    goto LABEL_74;
  PTKTraceInit();
  v19->_disparitySize.width = width;
  v19->_disparitySize.height = height;
  objc_storeStrong((id *)&v19->_metalContext, a3);
  v19->_debugRendering = a7;
  objc_storeStrong((id *)&v19->_options, a9);
  objc_storeStrong((id *)&v19->_renderEffects, a4);
  +[PTQualitySettings createWithQuality:options:](PTQualitySettings, "createWithQuality:options:", v10, v18);
  v20 = objc_claimAutoreleasedReturnValue();
  qualitySettings = v19->_qualitySettings;
  v19->_qualitySettings = (PTQualitySettings *)v20;

  if (!v19->_qualitySettings)
  {
    _PTLogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.1(v38, v39, v40, v41, v42, v43, v44, v45);
    goto LABEL_73;
  }
  +[PTRaytracingUtils createFocusEdge](PTRaytracingUtils, "createFocusEdge");
  v19->_focusEdge.width = v22;
  v19->_focusEdge.gradientThreshold = v23;
  v19->_focusEdge.gradientWeight = v24;
  v19->_focusEdge.minMaxThreshold = v25;
  v19->_updateSourceColor = 0;
  v26 = -[PTQualitySettings quality](v19->_qualitySettings, "quality");
  updateSourceColor = v19->_updateSourceColor;
  v29 = v26 < 100 && !updateSourceColor;
  v19->_skipFullSizeLayer = v29;
  if (!updateSourceColor)
    goto LABEL_12;
  v30 = -[PTColorConversion initWithMetalContext:]([PTColorConversion alloc], "initWithMetalContext:", v16);
  colorConversion = v19->_colorConversion;
  v19->_colorConversion = v30;

  if (!v19->_colorConversion)
  {
    _PTLogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.19(v38, v46, v47, v48, v49, v50, v51, v52);
    goto LABEL_73;
  }
  objc_msgSend(v16, "textureUtil");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "createWithSize:pixelFormat:", 115, v280, v281);
  v33 = objc_claimAutoreleasedReturnValue();
  rgba = v19->_rgba;
  v19->_rgba = (MTLTexture *)v33;

  if (!v19->_rgba)
  {
    _PTLogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.20(v38, v159, v160, v161, v162, v163, v164, v165);
  }
  else
  {
LABEL_12:
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E8251FB0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v19->_injectedRGBAPyramid = v35 != 0;

    if (v19->_injectedRGBAPyramid)
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E8251FB0);
      v36 = objc_claimAutoreleasedReturnValue();
      rgbaPyramid = v19->_rgbaPyramid;
      v19->_rgbaPyramid = (PTPyramid *)v36;

      goto LABEL_19;
    }
    v53 = -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:]([PTPyramid alloc], "initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:", v16, 115, v19->_skipFullSizeLayer, -[PTQualitySettings doFirstLevelGaussianDownsample](v19->_qualitySettings, "doFirstLevelGaussianDownsample"), 4, v280, v281);
    v54 = v19->_rgbaPyramid;
    v19->_rgbaPyramid = v53;

    if (v19->_rgbaPyramid)
    {
LABEL_19:
      v55 = -[PTRaytracingUtils initWithMetalContext:]([PTRaytracingUtils alloc], "initWithMetalContext:", v16);
      raytracingUtils = v19->_raytracingUtils;
      v19->_raytracingUtils = v55;

      if (v19->_raytracingUtils)
      {
        v57 = -[PTRaytracingInterpolateResult initWithMetalContext:useExportQualityNoise:]([PTRaytracingInterpolateResult alloc], "initWithMetalContext:useExportQualityNoise:", v16, -[PTQualitySettings useExportQualityNoise](v19->_qualitySettings, "useExportQualityNoise"));
        raytracingInterpolateResult = v19->_raytracingInterpolateResult;
        v19->_raytracingInterpolateResult = v57;

        if (v19->_raytracingInterpolateResult)
        {
          v59 = +[PTPrecomputeRandom computeUnitDiskPoints:numberOfPatternCircles:](PTPrecomputeRandom, "computeUnitDiskPoints:numberOfPatternCircles:", v16, -[PTQualitySettings numberOfPatternCircles](v19->_qualitySettings, "numberOfPatternCircles"));
          v61 = v60;
          xy = v19->_aperturePoints.xy;
          v19->_aperturePoints.xy = (MTLBuffer *)v59;

          *((_WORD *)&v19->_aperturePoints.rayCount + 2) = WORD2(v61);
          v19->_aperturePoints.rayCount = v61;
          if (v19->_aperturePoints.xy)
          {
            +[PTPrecomputeRandom computeRandomUChars:rayCount:](PTPrecomputeRandom, "computeRandomUChars:rayCount:", v16, v61);
            v63 = objc_claimAutoreleasedReturnValue();
            randomUChars = v19->_randomUChars;
            v19->_randomUChars = (MTLBuffer *)v63;

            if (v19->_randomUChars)
            {
              v19->_doVisualization = 0;
              v65 = -[PTQualitySettings doMacroApertureLimit](v19->_qualitySettings, "doMacroApertureLimit");
              v66 = 0.0051429;
              if (v65)
                v66 = 0.00043025;
              v19->_circleOfConfusionReference = v66;
              v19->_fNumberLimitWeight = 0.33333;
              *(float32x2_t *)&v19->_circleOfConfusionLimitBgFg[4] = vmul_n_f32((float32x2_t)0x3FC0000040800000, v66);
              -[PTQualitySettings circleOfConfusionLimitBackground](v19->_qualitySettings, "circleOfConfusionLimitBackground");
              if (fabsf(v67) != INFINITY)
              {
                -[PTQualitySettings circleOfConfusionLimitBackground](v19->_qualitySettings, "circleOfConfusionLimitBackground");
                *(_DWORD *)&v19->_circleOfConfusionLimitBgFg[4] = v68;
              }
              -[PTQualitySettings circleOfConfusionLimitForeground](v19->_qualitySettings, "circleOfConfusionLimitForeground");
              if (fabsf(v69) != INFINITY)
              {
                -[PTQualitySettings circleOfConfusionLimitForeground](v19->_qualitySettings, "circleOfConfusionLimitForeground");
                *(_DWORD *)&v19->_circleOfConfusionLimitBgFg[8] = v70;
              }
              v19->_kRayCount = v19->_aperturePoints.rayCount;
              _H8 = *((_WORD *)&v19->_aperturePoints.rayCount + 2);
              v72.f64[0] = v280;
              v72.f64[1] = v281;
              v73.f64[0] = width;
              v73.f64[1] = height;
              *(float32x2_t *)v19->_sourceColorSize = vcvt_f32_f64(v72);
              *(float32x2_t *)v19->_sourceDisparitySize = vcvt_f32_f64(v73);
              v19->_anamorphicFactor = 1.2;
              objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E8251FC8);
              v74 = (void *)objc_claimAutoreleasedReturnValue();

              if (v74)
              {
                objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E8251FC8);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "floatValue");
                v19->_anamorphicFactor = v76;

              }
              __asm { FCVT            S8, H8 }
              v19->_kPyramidSamplingFraction = 0.665;
              v19->_edgeTolerance = 0.025;
              v287 = 0;
              v287 = -[PTQualitySettings rayMarch](v19->_qualitySettings, "rayMarch");
              -[PTQualitySettings renderDownscale](v19->_qualitySettings, "renderDownscale");
              v81 = 3.0;
              if (v82 <= 3.0)
              {
                -[PTQualitySettings renderDownscale](v19->_qualitySettings, "renderDownscale");
                v81 = 1.0;
                if (v83 >= 2.0)
                  v81 = 2.0;
              }
              -[PTQualitySettings renderDownscale](v19->_qualitySettings, "renderDownscale");
              v85 = v84 + 0.5;
              v86 = v84 <= 2.0;
              v87 = 2.5;
              if (!v86)
                v87 = v85;
              *(float *)&v88 = 1.0 / (float)(0.5 - v87);
              *((float *)&v88 + 1) = -v87;
              v279 = v88;
              v89 = (void *)objc_opt_new();
              objc_msgSend(v89, "setConstantValue:type:withName:", &v19->_kRayCount, 29, CFSTR("kRaycount"));
              objc_msgSend(v89, "setConstantValue:type:withName:", &v287, 53, CFSTR("kRayMarch"));
              objc_msgSend(v89, "setConstantValue:type:withName:", &v19->_skipFullSizeLayer, 53, CFSTR("kSkipFullSizeLayer"));
              LODWORD(v90) = _S8;
              objc_msgSend(v89, "setConstantFloat:withName:", CFSTR("kRadiusLocal_float"), v90);
              LODWORD(v91) = 0.25;
              objc_msgSend(v89, "setConstantFloat:withName:", CFSTR("kRadiusLocalFraction_float"), v91);
              *(float *)&v92 = v81;
              objc_msgSend(v89, "setConstantFloat:withName:", CFSTR("kDiameterCoverageLimit_float"), v92);
              objc_msgSend(v89, "setConstantFloat2:withName:", CFSTR("kFocusBlendCoefficients_float2"), v279);
              *(float *)&v93 = v19->_kPyramidSamplingFraction;
              objc_msgSend(v89, "setConstantFloat:withName:", CFSTR("kPyramidSamplingFraction_float"), v93);
              LODWORD(v94) = 6.0;
              objc_msgSend(v89, "setConstantFloat:withName:", CFSTR("kRayMarchDisparityRadiusTolerance_float"), v94);
              LODWORD(v95) = 1017370378;
              objc_msgSend(v89, "setConstantFloat:withName:", CFSTR("kHighlightBoostFactor_float"), v95);
              -[PTMetalContext computePipelineStateFor:withConstants:](v19->_metalContext, "computePipelineStateFor:withConstants:", CFSTR("raytracingV3001"), v89);
              v96 = objc_claimAutoreleasedReturnValue();
              raytracingSDOF = v19->_raytracingSDOF;
              v19->_raytracingSDOF = (MTLComputePipelineState *)v96;

              if (!v19->_raytracingSDOF)
              {
                _PTLogSystem();
                v150 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                  -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.7(v150, v195, v196, v197, v198, v199, v200, v201);
                goto LABEL_100;
              }
              if (-[PTQualitySettings rayMarch](v19->_qualitySettings, "rayMarch"))
              {
                v98 = -[PTGlobalReduction initWithMetalContext:textureSize:]([PTGlobalReduction alloc], "initWithMetalContext:textureSize:", v16, width, height);
                globalReduction = v19->_globalReduction;
                v19->_globalReduction = v98;

                if (!v19->_globalReduction)
                {
                  _PTLogSystem();
                  v150 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.8(v150, v202, v203, v204, v205, v206, v207, v208);
                  goto LABEL_100;
                }
                objc_msgSend(v16, "device");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = objc_msgSend(v100, "newBufferWithLength:options:", 8, 0);
                disparityDiffGlobalMinMax = v19->_disparityDiffGlobalMinMax;
                v19->_disparityDiffGlobalMinMax = (MTLBuffer *)v101;

                if (!v19->_disparityDiffGlobalMinMax)
                {
                  _PTLogSystem();
                  v150 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.9(v150, v209, v210, v211, v212, v213, v214, v215);
                  goto LABEL_100;
                }
                -[PTMetalContext textureUtil](v19->_metalContext, "textureUtil");
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v103, "createWithSize:pixelFormat:", 10, width, height);
                v104 = objc_claimAutoreleasedReturnValue();
                disparityEdges = v19->_disparityEdges;
                v19->_disparityEdges = (MTLTexture *)v104;

                if (!v19->_disparityEdges)
                {
                  _PTLogSystem();
                  v150 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.10(v150, v237, v238, v239, v240, v241, v242, v243);
                  goto LABEL_100;
                }
                -[PTMetalContext textureUtil](v19->_metalContext, "textureUtil");
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "createWithSize:pixelFormat:", 10, width, height);
                v107 = objc_claimAutoreleasedReturnValue();
                disparityEdgesTemp = v19->_disparityEdgesTemp;
                v19->_disparityEdgesTemp = (MTLTexture *)v107;

                if (!v19->_disparityEdgesTemp)
                {
                  _PTLogSystem();
                  v150 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.11(v150, v265, v266, v267, v268, v269, v270, v271);
                  goto LABEL_100;
                }
              }
              if (-[PTQualitySettings doDisparityUpsampling](v19->_qualitySettings, "doDisparityUpsampling"))
              {
                v109 = [PTGuidedFilter alloc];
                v286[0] = (unint64_t)width;
                v286[1] = (unint64_t)height;
                v286[2] = 1;
                -[PTQualitySettings disparityGuidedFilterEpsilon](v19->_qualitySettings, "disparityGuidedFilterEpsilon");
                v110 = -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:](v109, "initWithMetalContext:inputSize:epsilon:", v16, v286);
                guidedFilter = v19->_guidedFilter;
                v19->_guidedFilter = (PTGuidedFilter *)v110;

                if (!v19->_guidedFilter)
                {
                  _PTLogSystem();
                  v150 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.12(v150, v216, v217, v218, v219, v220, v221, v222);
                  goto LABEL_100;
                }
                -[PTQualitySettings disparityUpsampleFactor](v19->_qualitySettings, "disparityUpsampleFactor");
                v113 = width * v112;
                -[PTQualitySettings disparityUpsampleFactor](v19->_qualitySettings, "disparityUpsampleFactor");
                v19->_disparitySizeUpscaled.width = v113;
                v19->_disparitySizeUpscaled.height = height * v114;
                objc_msgSend(v16, "textureUtil");
                v115 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v115, "createWithSize:pixelFormat:", 25, v19->_disparitySizeUpscaled.width, v19->_disparitySizeUpscaled.height);
                v116 = objc_claimAutoreleasedReturnValue();
                disparityUpscaled = v19->_disparityUpscaled;
                v19->_disparityUpscaled = (MTLTexture *)v116;

                v118 = v19->_disparityUpscaled;
                if (!v118)
                {
                  _PTLogSystem();
                  v150 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.13(v150, v244, v245, v246, v247, v248, v249, v250);
                  goto LABEL_100;
                }
                v119 = v19->_rgbaPyramid;
                v120 = -[MTLTexture width](v118, "width");
                v121 = -[MTLTexture height](v19->_disparityUpscaled, "height");
                v285[0] = v120;
                v285[1] = v121;
                v285[2] = 1;
                -[PTPyramid findMipmapLevelLargerThan:](v119, "findMipmapLevelLargerThan:", v285);
                v122 = objc_claimAutoreleasedReturnValue();
                guideRGBAUpscale = v19->_guideRGBAUpscale;
                v19->_guideRGBAUpscale = (MTLTexture *)v122;

                v124 = v19->_rgbaPyramid;
                v284[0] = (unint64_t)width;
                v284[1] = (unint64_t)height;
                v284[2] = 1;
                -[PTPyramid findMipmapLevelLargerThan:](v124, "findMipmapLevelLargerThan:", v284);
                v125 = objc_claimAutoreleasedReturnValue();
                guideRGBACoefficients = v19->_guideRGBACoefficients;
                v19->_guideRGBACoefficients = (MTLTexture *)v125;

              }
              if (!-[PTQualitySettings doCenterDisparity](v19->_qualitySettings, "doCenterDisparity"))
                goto LABEL_104;
              -[PTMetalContext textureUtil](v19->_metalContext, "textureUtil");
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v127, "createWithSize:pixelFormat:", 25, width, height);
              v128 = objc_claimAutoreleasedReturnValue();
              disparityDiff = v19->_disparityDiff;
              v19->_disparityDiff = (MTLTexture *)v128;

              if (!v19->_disparityDiff)
              {
                _PTLogSystem();
                v150 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                  -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.14(v150, v230, v231, v232, v233, v234, v235, v236);
                goto LABEL_100;
              }
              -[PTMetalContext textureUtil](v19->_metalContext, "textureUtil");
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "createWithSize:pixelFormat:", 25, width, height);
              v131 = objc_claimAutoreleasedReturnValue();
              disparityEffects = v19->_disparityEffects;
              v19->_disparityEffects = (MTLTexture *)v131;

              if (!v19->_disparityEffects)
              {
                _PTLogSystem();
                v150 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                  -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.15(v150, v258, v259, v260, v261, v262, v263, v264);
              }
              else
              {
                if (!-[PTQualitySettings doFocusEdgeMask](v19->_qualitySettings, "doFocusEdgeMask"))
                  goto LABEL_53;
LABEL_104:
                -[PTMetalContext textureUtil](v19->_metalContext, "textureUtil");
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                v134 = -[PTQualitySettings doDisparityUpsampling](v19->_qualitySettings, "doDisparityUpsampling");
                v135 = width;
                v136 = height;
                if (v134)
                {
                  v135 = v19->_disparitySizeUpscaled.width;
                  v136 = v19->_disparitySizeUpscaled.height;
                }
                objc_msgSend(v133, "createWithSize:pixelFormat:", 25, v135, v136);
                v137 = objc_claimAutoreleasedReturnValue();
                focusEdgeMask = v19->_focusEdgeMask;
                v19->_focusEdgeMask = (MTLTexture *)v137;

                if (!v19->_focusEdgeMask)
                {
                  _PTLogSystem();
                  v150 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingUtils initWithMetalContext:].cold.6(v150, v251, v252, v253, v254, v255, v256, v257);
                }
                else
                {
LABEL_53:
                  -[PTQualitySettings renderDownscale](v19->_qualitySettings, "renderDownscale");
                  v140 = v280 / v139;
                  -[PTQualitySettings renderDownscale](v19->_qualitySettings, "renderDownscale");
                  v142 = v281 / v141;
                  objc_msgSend(v16, "textureUtil");
                  v143 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v143, "createWithSize:pixelFormat:", -[PTQualitySettings intermediatePixelFormat](v19->_qualitySettings, "intermediatePixelFormat"), v140, v142);
                  v144 = objc_claimAutoreleasedReturnValue();
                  raytracedRGBWeight = v19->_raytracedRGBWeight;
                  v19->_raytracedRGBWeight = (MTLTexture *)v144;

                  if (v19->_raytracedRGBWeight)
                  {
                    if (!-[PTQualitySettings doIntermediate2XUpscale](v19->_qualitySettings, "doIntermediate2XUpscale"))
                      goto LABEL_56;
                    -[PTMetalContext textureUtil](v19->_metalContext, "textureUtil");
                    v146 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v146, "createWithWidth:height:pixelFormat:", (unint64_t)(v140 + v140), (unint64_t)(v142 + v142), -[PTQualitySettings intermediatePixelFormat](v19->_qualitySettings, "intermediatePixelFormat"));
                    v147 = objc_claimAutoreleasedReturnValue();
                    raytracedRGBWeightUpscaled = v19->_raytracedRGBWeightUpscaled;
                    v19->_raytracedRGBWeightUpscaled = (MTLTexture *)v147;

                    if (v19->_raytracedRGBWeightUpscaled)
                    {
LABEL_56:
                      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v19->_raytracedRGBWeight, v19->_disparityEdges, v19->_disparityEdgesTemp, 0);
                      v149 = objc_claimAutoreleasedReturnValue();
                      v150 = v149;
                      if (v19->_disparityUpscaled)
                        -[NSObject addObject:](v149, "addObject:");
                      if (v19->_focusEdgeMask)
                        -[NSObject addObject:](v150, "addObject:");
                      v151 = v19;
                      goto LABEL_101;
                    }
                    _PTLogSystem();
                    v150 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.18(v150, v272, v273, v274, v275, v276, v277, v278);
                  }
                  else
                  {
                    _PTLogSystem();
                    v150 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
                      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.17(v150, v223, v224, v225, v226, v227, v228, v229);
                  }
                }
              }
LABEL_100:
              v151 = 0;
LABEL_101:

              goto LABEL_75;
            }
            _PTLogSystem();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.6(v38, v187, v188, v189, v190, v191, v192, v193);
          }
          else
          {
            _PTLogSystem();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.5(v38, v180, v181, v182, v183, v184, v185, v186);
          }
        }
        else
        {
          _PTLogSystem();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.4(v38, v166, v167, v168, v169, v170, v171, v172);
        }
      }
      else
      {
        _PTLogSystem();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.3(v38, v152, v153, v154, v155, v156, v157, v158);
      }
      goto LABEL_73;
    }
    _PTLogSystem();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV3001 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.2(v38, v173, v174, v175, v176, v177, v178, v179);
  }
LABEL_73:

LABEL_74:
  v151 = 0;
LABEL_75:

  return v151;
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
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  MTLTexture *v14;
  double v15;
  float32x2_t v16;
  float v17;
  __int32 v18;
  _BOOL4 v19;
  PTRaytracingUtils *raytracingUtils;
  MTLTexture *disparityDiff;
  double v22;
  double v23;
  double v24;
  MTLTexture *v25;
  PTGlobalReduction *globalReduction;
  PTRaytracingUtils *v27;
  MTLTexture *disparityEdgesTemp;
  MTLTexture *disparityEdges;
  MTLBuffer *disparityDiffGlobalMinMax;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  PTGuidedFilter *guidedFilter;
  MTLTexture *guideRGBAUpscale;
  MTLTexture *disparityUpscaled;
  MTLTexture *guideRGBACoefficients;
  void *v41;
  MTLTexture *v42;
  unsigned int v43;
  float32x2_t v44;
  unsigned int v45;
  int32x2_t v51;
  float v52;
  unint64_t v53;
  float v54;
  float v55;
  unint64_t v56;
  void *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  MTLTexture *v67;
  void *v68;
  void *v69;
  MTLTexture *v70;
  PTRaytracingInterpolateResult *raytracingInterpolateResult;
  void *v72;
  void *v73;
  unint64_t v75;
  unsigned int v76;
  void *v77;
  _QWORD v78[5];
  int64x2_t v79;
  uint64_t v80;
  _QWORD v81[3];
  _WORD v82[2];
  _OWORD v83[2];
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  _QWORD v87[2];
  __int128 v88;
  __int128 v89;
  uint64_t v90;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "renderState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quality");
  objc_msgSend(v7, "fNumber");
  objc_msgSend(v7, "focusDisparity");
  objc_msgSend(v7, "alphaLowLight");
  kdebug_trace();

  v90 = 0;
  v88 = 0u;
  v89 = 0u;
  *(float *)&v9 = self->_circleOfConfusionReference;
  *(float *)&v10 = self->_fNumberLimitWeight;
  +[PTRaytracingUtils createFocusObject:anamorphicFactor:colorSize:circleOfConfusionReference:fNumberLimitWeight:](PTRaytracingUtils, "createFocusObject:anamorphicFactor:colorSize:circleOfConfusionReference:fNumberLimitWeight:", v7, COERCE_DOUBLE((unint64_t)LODWORD(self->_anamorphicFactor)), *(double *)self->_sourceColorSize, v9, v10);
  v87[0] = 0;
  v87[1] = 0;
  objc_msgSend(v7, "sourceDisparity");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!self->_injectedRGBAPyramid)
  {
    objc_msgSend(v7, "sourceColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTPyramid updatePyramidFromPTTexture:inPTTexture:](self->_rgbaPyramid, "updatePyramidFromPTTexture:inPTTexture:", v6, v12);

  }
  v13 = -[PTQualitySettings doCenterDisparity](self->_qualitySettings, "doCenterDisparity");
  v14 = (MTLTexture *)v11;
  if (v13)
  {
    v15 = (*(float *)&v88 + *(float *)&v88) * *((float *)&v88 + 2);
    *(float *)&v15 = v15;
    v16 = vdiv_f32(*(float32x2_t *)&self->_circleOfConfusionLimitBgFg[4], (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v15, 0));
    v17 = -v16.f32[0];
    v18 = v16.i32[1];
    v19 = -[PTQualitySettings portraitPreviewDeadzone](self->_qualitySettings, "portraitPreviewDeadzone");
    raytracingUtils = self->_raytracingUtils;
    disparityDiff = self->_disparityDiff;
    *(float *)&v22 = -*((float *)&v88 + 1);
    *(float *)&v23 = v17;
    LODWORD(v24) = v18;
    if (v19)
      -[PTRaytracingUtils disparityPortraitPreviewDeadzone:inDisparity:outDisparity:postModfier:](raytracingUtils, "disparityPortraitPreviewDeadzone:inDisparity:outDisparity:postModfier:", v6, v11, disparityDiff, v22, v23, v24);
    else
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:](raytracingUtils, "disparityApplyPostModifier:inDisparity:outDisparity:postModfier:", v6, v11, disparityDiff, v22, v23, v24);
    v14 = self->_disparityDiff;
  }
  v77 = (void *)v11;
  v25 = v14;
  globalReduction = self->_globalReduction;
  if (globalReduction)
  {
    -[PTGlobalReduction parallelReductionMinMax:inTexture:globalMinMaxBuffer:](globalReduction, "parallelReductionMinMax:inTexture:globalMinMaxBuffer:", v6, v25, self->_disparityDiffGlobalMinMax);
    v27 = self->_raytracingUtils;
    disparityEdges = self->_disparityEdges;
    disparityEdgesTemp = self->_disparityEdgesTemp;
    disparityDiffGlobalMinMax = self->_disparityDiffGlobalMinMax;
    *(float *)&v31 = self->_edgeTolerance;
    v84 = v88;
    v85 = v89;
    v86 = v90;
    -[PTRaytracingUtils detectDilatedEdges:inDisparity:tempEdges:outEdges:focusObject:disparityDiffMinMax:edgeTolerance:](v27, "detectDilatedEdges:inDisparity:tempEdges:outEdges:focusObject:disparityDiffMinMax:edgeTolerance:", v6, v25, disparityEdgesTemp, disparityEdges, &v84, disparityDiffGlobalMinMax, v31);
  }
  v36 = v6;
  if (-[PTQualitySettings doDisparityUpsampling](self->_qualitySettings, "doDisparityUpsampling"))
  {
    guidedFilter = self->_guidedFilter;
    disparityUpscaled = self->_disparityUpscaled;
    guideRGBAUpscale = self->_guideRGBAUpscale;
    guideRGBACoefficients = self->_guideRGBACoefficients;
    objc_msgSend(v7, "renderState");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTGuidedFilter guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImage:sourceColorBitDepth:postModifierPtr:](guidedFilter, "guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImage:sourceColorBitDepth:postModifierPtr:", v36, v25, guideRGBACoefficients, guideRGBAUpscale, disparityUpscaled, objc_msgSend(v41, "sourceColorBitDepth"), 0);

    v6 = v36;
    v42 = self->_disparityUpscaled;

    v25 = v42;
  }
  if (self->_focusEdgeMask)
  {
    *(float *)&v32 = self->_focusEdge.width;
    *(float *)&v33 = self->_focusEdge.gradientThreshold;
    *(float *)&v34 = self->_focusEdge.gradientWeight;
    *(float *)&v35 = self->_focusEdge.minMaxThreshold;
    -[PTRaytracingUtils focusEdgeMask:inDisparityDiff:focusEdge:outFocusEdgeMask:](self->_raytracingUtils, "focusEdgeMask:inDisparityDiff:focusEdge:outFocusEdgeMask:", v6, v25, v32, v33, v34, v35);
  }
  v84 = 0u;
  v85 = 0u;
  if (v7)
    objc_msgSend(v7, "scissorRect");
  else
    memset(v83, 0, sizeof(v83));
  +[PTImageblockConfig adjustScissorRectToImageBlocks:](PTImageblockConfig, "adjustScissorRectToImageBlocks:", v83);
  v75 = v84;
  -[PTQualitySettings renderDownscale](self->_qualitySettings, "renderDownscale");
  v76 = v43;
  v44 = vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)__PAIR128__(*((unint64_t *)&v84 + 1), v75)));
  -[PTQualitySettings renderDownscale](self->_qualitySettings, "renderDownscale");
  __asm { FMOV            V1.2D, #-0.5 }
  v51 = vmovn_s64(vcvtq_s64_f64(vrndmq_f64(vaddq_f64(vcvtq_f64_f32(vdiv_f32(v44, (float32x2_t)__PAIR64__(v45, v76))), _Q1))));
  v82[1] = v51.i16[2];
  v82[0] = v51.i16[0];
  v44.f32[0] = (float)(unint64_t)v85;
  -[PTQualitySettings renderDownscale](self->_qualitySettings, "renderDownscale");
  v53 = vcvtpd_u64_f64((float)(v44.f32[0] / v52) + 0.5);
  v54 = (float)*((unint64_t *)&v85 + 1);
  -[PTQualitySettings renderDownscale](self->_qualitySettings, "renderDownscale");
  v56 = vcvtpd_u64_f64((float)(v54 / v55) + 0.5);
  objc_msgSend(v6, "computeCommandEncoder");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v57)
  {
    _PTLogSystem();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v58, v59, v60, v61, v62, v63, v64, v65);

  }
  objc_msgSend(v57, "setComputePipelineState:", self->_raytracingSDOF);
  -[PTPyramid mipmapTexture](self->_rgbaPyramid, "mipmapTexture");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setTexture:atIndex:", v66, 0);

  objc_msgSend(v57, "setTexture:atIndex:", v25, 1);
  objc_msgSend(v57, "setTexture:atIndex:", self->_disparityEdges, 2);
  objc_msgSend(v57, "setTexture:atIndex:", self->_raytracedRGBWeight, 3);
  objc_msgSend(v57, "setTexture:atIndex:", self->_focusEdgeMask, 4);
  objc_msgSend(v57, "setBytes:length:atIndex:", v87, 16, 0);
  objc_msgSend(v57, "setBuffer:offset:atIndex:", self->_aperturePoints.xy, 0, 1);
  objc_msgSend(v57, "setBuffer:offset:atIndex:", self->_randomUChars, 0, 2);
  objc_msgSend(v57, "setBuffer:offset:atIndex:", self->_disparityDiffGlobalMinMax, 0, 3);
  objc_msgSend(v57, "setBytes:length:atIndex:", self->_sourceColorSize, 8, 4);
  objc_msgSend(v57, "setBytes:length:atIndex:", self->_sourceDisparitySize, 8, 5);
  objc_msgSend(v57, "setBytes:length:atIndex:", v82, 4, 6);
  v81[0] = v53;
  v81[1] = v56;
  v81[2] = 1;
  v79 = vdupq_n_s64(8uLL);
  v80 = 1;
  objc_msgSend(v57, "dispatchThreads:threadsPerThreadgroup:", v81, &v79);
  objc_msgSend(v57, "endEncoding");
  v67 = self->_raytracedRGBWeight;
  if (self->_raytracedRGBWeightUpscaled)
  {
    -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v36;
    objc_msgSend(v68, "copy:inTex:outTex:", v36, self->_raytracedRGBWeight, self->_raytracedRGBWeightUpscaled);

    v70 = self->_raytracedRGBWeightUpscaled;
    v67 = v70;
  }
  else
  {
    v69 = v36;
  }
  raytracingInterpolateResult = self->_raytracingInterpolateResult;
  if (self->_skipFullSizeLayer)
  {
    -[PTRaytracingInterpolateResult interpolateRGBWeightUsingSourceToDest:renderRequest:inRGBWeight:](self->_raytracingInterpolateResult, "interpolateRGBWeightUsingSourceToDest:renderRequest:inRGBWeight:", v69, v7, v67);
  }
  else
  {
    -[PTPyramid mipmapLevels](self->_rgbaPyramid, "mipmapLevels");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "objectAtIndexedSubscript:", 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTRaytracingInterpolateResult interpolateRGBWeightUsingRGBALinearToDest:renderRequest:inRGBWeight:inRGBA:](raytracingInterpolateResult, "interpolateRGBWeightUsingRGBALinearToDest:renderRequest:inRGBWeight:inRGBA:", v36, v7, v67, v73);

    v69 = v36;
  }
  if (kdebug_is_enabled())
  {
    v78[0] = MEMORY[0x1E0C809B0];
    v78[1] = 3221225472;
    v78[2] = __62__PTRaytracingV3001_renderContinuousWithSource_renderRequest___block_invoke;
    v78[3] = &unk_1E822A0B0;
    v78[4] = self;
    objc_msgSend(v69, "addCompletedHandler:", v78);
  }

  return 0;
}

void __62__PTRaytracingV3001_renderContinuousWithSource_renderRequest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "doDisparityUpsampling");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "renderDownscale");
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
  objc_storeStrong((id *)&self->_renderEffects, 0);
  objc_storeStrong((id *)&self->_raytracingSDOF, 0);
  objc_storeStrong((id *)&self->_guideRGBAUpscale, 0);
  objc_storeStrong((id *)&self->_disparityUpscaled, 0);
  objc_storeStrong((id *)&self->_guideRGBACoefficients, 0);
  objc_storeStrong((id *)&self->_raytracedRGBWeightUpscaled, 0);
  objc_storeStrong((id *)&self->_raytracedRGBWeight, 0);
  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
  objc_storeStrong((id *)&self->_disparityDiff, 0);
  objc_storeStrong((id *)&self->_disparityEffects, 0);
  objc_storeStrong((id *)&self->_disparityEdgesTemp, 0);
  objc_storeStrong((id *)&self->_disparityEdges, 0);
  objc_storeStrong((id *)&self->_disparityDiffGlobalMinMax, 0);
  objc_storeStrong((id *)&self->_randomUChars, 0);

  objc_storeStrong((id *)&self->_rgba, 0);
  objc_storeStrong((id *)&self->_colorConversion, 0);
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

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.19(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
