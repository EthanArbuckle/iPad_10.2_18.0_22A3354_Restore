@implementation PTRaytracingV14RenderState

- (PTRaytracingV14RenderState)initWithMetalContext:(id)a3 util:(id)a4 quality:(int)a5 colorSize:(CGSize)a6 disparitySize:(CGSize)a7 debugRendering:(int64_t)a8 pyramidPixelFormat:(unint64_t)a9 options:(id)a10 debugTextures:(id)a11
{
  double height;
  double width;
  uint64_t v14;
  id v17;
  id v18;
  id v19;
  id v20;
  PTRaytracingV14RenderState *v21;
  uint64_t v22;
  PTQualitySettings *qualitySettings;
  PTQualitySettings *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  MTLBuffer *randomUChars;
  float64x2_t v36;
  float raytracingRadiusLocal;
  float v38;
  float v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  MTLComputePipelineState *raytracingSDOF;
  PTGlobalReduction *v47;
  PTGlobalReduction *globalReduction;
  void *v49;
  uint64_t v50;
  MTLBuffer *disparityDiffGlobalMinMax;
  void *v52;
  uint64_t v53;
  MTLTexture *disparityEdges;
  void *v55;
  uint64_t v56;
  MTLTexture *disparityEdgesTemp;
  PTDisparityUpscale *v58;
  PTDisparityUpscale *disparityUpscale;
  void *v60;
  uint64_t v61;
  MTLTexture *disparityDiff;
  void *v63;
  uint64_t v64;
  MTLTexture *focusEdgeMask;
  void *v66;
  uint64_t v67;
  MTLTexture *randomGaussNoise;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  void *v72;
  float v73;
  float v74;
  float v75;
  float v76;
  void *v77;
  double v78;
  double v79;
  uint64_t v80;
  MTLTexture *raytracedRGBRadius;
  void *v82;
  uint64_t v83;
  MTLTexture *raytracedRGBRadiusUpscaled;
  void *v85;
  void *v86;
  uint64_t v87;
  NSString *description;
  PTRaytracingV14RenderState *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
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
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
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
  NSObject *v189;
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
  NSObject *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v213;
  void *v214;
  double v215;
  double v216;
  BOOL v217;
  objc_super v218;

  height = a7.height;
  width = a7.width;
  v215 = a6.width;
  v216 = a6.height;
  v14 = *(_QWORD *)&a5;
  v17 = a3;
  v18 = a4;
  v19 = a10;
  v20 = a11;
  v218.receiver = self;
  v218.super_class = (Class)PTRaytracingV14RenderState;
  v21 = -[PTRaytracingV14RenderState init](&v218, sel_init);
  v21->_quality = v14;
  +[PTQualitySettings createWithQuality:options:](PTQualitySettings, "createWithQuality:options:", v14, v19);
  v22 = objc_claimAutoreleasedReturnValue();
  qualitySettings = v21->_qualitySettings;
  v21->_qualitySettings = (PTQualitySettings *)v22;

  v24 = v21->_qualitySettings;
  if (v24)
  {
    -[PTQualitySettings setDoFirstLevelGaussianDownsample:](v24, "setDoFirstLevelGaussianDownsample:", 1);
    v25 = +[PTPrecomputeRandom computeUnitDiskPoints:numberOfPatternCircles:](PTPrecomputeRandom, "computeUnitDiskPoints:numberOfPatternCircles:", v17, -[PTQualitySettings numberOfPatternCircles](v21->_qualitySettings, "numberOfPatternCircles"));
    v27 = v26;
    objc_storeStrong((id *)&v21->_aperturePointsXY, v25);
    if (v21->_aperturePointsXY)
    {
      +[PTPrecomputeRandom computeRandomUChars:rayCount:](PTPrecomputeRandom, "computeRandomUChars:rayCount:", v17, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      randomUChars = v21->_randomUChars;
      v21->_randomUChars = (MTLBuffer *)v28;

      if (v21->_randomUChars)
      {
        _H0 = WORD2(v27);
        v21->_rayCount = v27;
        v21->_doVisualization = 0;
        __asm { FCVT            S0, H0 }
        v21->_raytracingRadiusLocal = _S0;
        v36.f64[0] = v215;
        v36.f64[1] = v216;
        *(float32x2_t *)v21->_colorSize = vcvt_f32_f64(v36);
        v21->_anamorphicFactor = 1.2;
        *(_QWORD *)&v21->_kPyramidSamplingFraction = 0x3CCCCCCD3F99999ALL;
        v217 = 0;
        v217 = -[PTQualitySettings rayMarch](v21->_qualitySettings, "rayMarch");
        raytracingRadiusLocal = v21->_raytracingRadiusLocal;
        -[PTQualitySettings renderDownscale](v21->_qualitySettings, "renderDownscale");
        v39 = v38;
        v40 = (void *)objc_opt_new();
        objc_msgSend(v40, "setConstantValue:type:withName:", &v21->_rayCount, 29, CFSTR("kRaytracingRaycount"));
        objc_msgSend(v40, "setConstantValue:type:withName:", &v217, 53, CFSTR("kRayMarch"));
        *(float *)&v41 = raytracingRadiusLocal * 0.25;
        objc_msgSend(v40, "setConstantFloat:withName:", CFSTR("kRadiusLocal_float"), v41);
        *(float *)&v42 = v21->_kPyramidSamplingFraction;
        objc_msgSend(v40, "setConstantFloat:withName:", CFSTR("kPyramidSamplingFraction_float"), v42);
        v43 = fmax(v39 * 0.25 + 1.5, 2.0);
        *(float *)&v43 = v43;
        objc_msgSend(v40, "setConstantFloat:withName:", CFSTR("kDiameterCoverageLimit_float"), v43);
        LODWORD(v44) = 4.0;
        objc_msgSend(v40, "setConstantFloat:withName:", CFSTR("kRayMarchDisparityRadiusTolerance_float"), v44);
        objc_msgSend(v17, "computePipelineStateFor:withConstants:", CFSTR("raytracingV14"), v40);
        v45 = objc_claimAutoreleasedReturnValue();
        raytracingSDOF = v21->_raytracingSDOF;
        v21->_raytracingSDOF = (MTLComputePipelineState *)v45;

        if (!v21->_raytracingSDOF)
        {
          _PTLogSystem();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.4(v70, v112, v113, v114, v115, v116, v117, v118);
          goto LABEL_74;
        }
        if (-[PTQualitySettings rayMarch](v21->_qualitySettings, "rayMarch"))
        {
          v47 = -[PTGlobalReduction initWithMetalContext:textureSize:]([PTGlobalReduction alloc], "initWithMetalContext:textureSize:", v17, width, height);
          globalReduction = v21->_globalReduction;
          v21->_globalReduction = v47;

          if (!v21->_globalReduction)
          {
            _PTLogSystem();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.8(v70, v119, v120, v121, v122, v123, v124, v125);
            goto LABEL_74;
          }
          objc_msgSend(v17, "device");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "newBufferWithLength:options:", 8, 0);
          disparityDiffGlobalMinMax = v21->_disparityDiffGlobalMinMax;
          v21->_disparityDiffGlobalMinMax = (MTLBuffer *)v50;

          if (!v21->_disparityDiffGlobalMinMax)
          {
            _PTLogSystem();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.6(v70, v126, v127, v128, v129, v130, v131, v132);
            goto LABEL_74;
          }
          objc_msgSend(v17, "textureUtil");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "createWithSize:pixelFormat:", 10, width, height);
          v53 = objc_claimAutoreleasedReturnValue();
          disparityEdges = v21->_disparityEdges;
          v21->_disparityEdges = (MTLTexture *)v53;

          if (!v21->_disparityEdges)
          {
            _PTLogSystem();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.7(v70, v147, v148, v149, v150, v151, v152, v153);
            goto LABEL_74;
          }
          objc_msgSend(v17, "textureUtil");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "createWithSize:pixelFormat:", 10, width, height);
          v56 = objc_claimAutoreleasedReturnValue();
          disparityEdgesTemp = v21->_disparityEdgesTemp;
          v21->_disparityEdgesTemp = (MTLTexture *)v56;

          if (!v21->_disparityEdgesTemp)
          {
            _PTLogSystem();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.8(v70, v175, v176, v177, v178, v179, v180, v181);
            goto LABEL_74;
          }
        }
        if (-[PTQualitySettings doDisparityUpsampling](v21->_qualitySettings, "doDisparityUpsampling"))
        {
          v58 = -[PTDisparityUpscale initWithMetalContext:colorSize:disparitySize:]([PTDisparityUpscale alloc], "initWithMetalContext:colorSize:disparitySize:", v17, v215, v216, width, height);
          disparityUpscale = v21->_disparityUpscale;
          v21->_disparityUpscale = v58;

          if (!v21->_disparityUpscale)
          {
            _PTLogSystem();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.9(v70, v133, v134, v135, v136, v137, v138, v139);
            goto LABEL_74;
          }
        }
        if (-[PTQualitySettings doCenterDisparity](v21->_qualitySettings, "doCenterDisparity"))
        {
          objc_msgSend(v17, "textureUtil");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "createWithSize:pixelFormat:", 25, width, height);
          v61 = objc_claimAutoreleasedReturnValue();
          disparityDiff = v21->_disparityDiff;
          v21->_disparityDiff = (MTLTexture *)v61;

          if (!v21->_disparityDiff)
          {
            _PTLogSystem();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.10(v70, v140, v141, v142, v143, v144, v145, v146);
            goto LABEL_74;
          }
        }
        if (-[PTQualitySettings doFocusEdgeMask](v21->_qualitySettings, "doFocusEdgeMask"))
        {
          if (-[PTQualitySettings doDisparityUpsampling](v21->_qualitySettings, "doDisparityUpsampling"))
            width = (double)-[PTDisparityUpscale width](v21->_disparityUpscale, "width");
          if (-[PTQualitySettings doDisparityUpsampling](v21->_qualitySettings, "doDisparityUpsampling"))
            height = (double)-[PTDisparityUpscale height](v21->_disparityUpscale, "height");
          objc_msgSend(v17, "textureUtil");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "createWithWidth:height:pixelFormat:", (unint64_t)width, (unint64_t)height, 25);
          v64 = objc_claimAutoreleasedReturnValue();
          focusEdgeMask = v21->_focusEdgeMask;
          v21->_focusEdgeMask = (MTLTexture *)v64;

          if (!v21->_focusEdgeMask)
          {
            _PTLogSystem();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              -[PTRaytracingUtils initWithMetalContext:].cold.6(v70, v154, v155, v156, v157, v158, v159, v160);
            goto LABEL_74;
          }
        }
        if (-[PTQualitySettings quality](v21->_qualitySettings, "quality") <= 25)
        {
          objc_msgSend(v17, "textureUtil");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "createWithWidth:height:pixelFormat:", 256, 256, 12);
          v67 = objc_claimAutoreleasedReturnValue();
          randomGaussNoise = v21->_randomGaussNoise;
          v21->_randomGaussNoise = (MTLTexture *)v67;

          if (!v21->_randomGaussNoise)
          {
            _PTLogSystem();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.12(v70, v168, v169, v170, v171, v172, v173, v174);
            goto LABEL_74;
          }
          objc_msgSend(v17, "commandQueue");
          v69 = objc_claimAutoreleasedReturnValue();
          v70 = v69;
          if (!v69)
          {
            _PTLogSystem();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.13(v70, v182, v183, v184, v185, v186, v187, v188);
            goto LABEL_74;
          }
          -[NSObject commandBuffer](v69, "commandBuffer");
          v71 = objc_claimAutoreleasedReturnValue();
          if (!v71)
          {
            _PTLogSystem();
            v189 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
              -[PTEffect updateEffectDelegate:].cold.1(v189, v190, v191, v192, v193, v194, v195, v196);

            goto LABEL_74;
          }
          v214 = (void *)v71;
          objc_msgSend(v17, "device");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          +[PTRaytracingUtilsV1 precomputeNoise:sideLength:](PTRaytracingUtilsV1, "precomputeNoise:sideLength:", v72, 256);
          v213 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v213)
          {
            _PTLogSystem();
            v204 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v204, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.15(v204, v205, v206, v207, v208, v209, v210, v211);

            goto LABEL_74;
          }
          objc_msgSend(v18, "gaussianNoise:inNoise:outTex:", v214, v213, v21->_randomGaussNoise);
          objc_msgSend(v214, "commit");
          objc_msgSend(v214, "waitUntilScheduled");

        }
        -[PTQualitySettings renderDownscale](v21->_qualitySettings, "renderDownscale");
        v74 = v73;
        -[PTQualitySettings renderDownscale](v21->_qualitySettings, "renderDownscale");
        v76 = v75;
        objc_msgSend(v17, "textureUtil");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = v215 / v74;
        v79 = v216 / v76;
        objc_msgSend(v77, "createWithSize:pixelFormat:", 115, v78, v79);
        v80 = objc_claimAutoreleasedReturnValue();
        raytracedRGBRadius = v21->_raytracedRGBRadius;
        v21->_raytracedRGBRadius = (MTLTexture *)v80;

        if (v21->_raytracedRGBRadius)
        {
          if (!-[PTQualitySettings doIntermediate2XUpscale](v21->_qualitySettings, "doIntermediate2XUpscale"))
            goto LABEL_29;
          objc_msgSend(v17, "textureUtil");
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "createWithWidth:height:pixelFormat:", (unint64_t)(v78 + v78), (unint64_t)(v79 + v79), 115);
          v83 = objc_claimAutoreleasedReturnValue();
          raytracedRGBRadiusUpscaled = v21->_raytracedRGBRadiusUpscaled;
          v21->_raytracedRGBRadiusUpscaled = (MTLTexture *)v83;

          if (v21->_raytracedRGBRadiusUpscaled)
          {
LABEL_29:
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", v21->_raytracedRGBRadius, v21->_disparityEdges, v21->_disparityEdgesTemp, 0);
            v70 = objc_claimAutoreleasedReturnValue();
            if (-[PTQualitySettings doDisparityUpsampling](v21->_qualitySettings, "doDisparityUpsampling"))
            {
              -[PTDisparityUpscale upscaledTexture](v21->_disparityUpscale, "upscaledTexture");
              v85 = (void *)objc_claimAutoreleasedReturnValue();

              if (v85)
              {
                -[PTDisparityUpscale upscaledTexture](v21->_disparityUpscale, "upscaledTexture");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject addObject:](v70, "addObject:", v86);

              }
            }
            if (-[PTQualitySettings doFocusEdgeMask](v21->_qualitySettings, "doFocusEdgeMask") && v21->_focusEdgeMask)
              -[NSObject addObject:](v70, "addObject:");
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, Rays: %i"), v21->_qualitySettings, v27);
            v87 = objc_claimAutoreleasedReturnValue();
            description = v21->_description;
            v21->_description = (NSString *)v87;

            v89 = v21;
            goto LABEL_75;
          }
          _PTLogSystem();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.17(v70, v197, v198, v199, v200, v201, v202, v203);
        }
        else
        {
          _PTLogSystem();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.16(v70, v161, v162, v163, v164, v165, v166, v167);
        }
LABEL_74:
        v89 = 0;
LABEL_75:

        goto LABEL_76;
      }
      _PTLogSystem();
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.3(v97, v105, v106, v107, v108, v109, v110, v111);
    }
    else
    {
      _PTLogSystem();
      v97 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
        -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.2(v97, v98, v99, v100, v101, v102, v103, v104);
    }

  }
  else
  {
    _PTLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV14RenderState initWithMetalContext:util:quality:colorSize:disparitySize:debugRendering:pyramidPixelFormat:options:debugTextures:].cold.1(v25, v90, v91, v92, v93, v94, v95, v96);
  }
  v89 = 0;
LABEL_76:

  return v89;
}

- (unint64_t)dependentFrames
{
  return 0;
}

- (MTLBuffer)randomUChars
{
  return self->_randomUChars;
}

- (void)setRandomUChars:(id)a3
{
  objc_storeStrong((id *)&self->_randomUChars, a3);
}

- (id)description
{
  return objc_getProperty(self, a2, 104, 1);
}

- (MTLTexture)randomGaussNoise
{
  return self->_randomGaussNoise;
}

- (void)setRandomGaussNoise:(id)a3
{
  objc_storeStrong((id *)&self->_randomGaussNoise, a3);
}

- (MTLTexture)focusEdgeMask
{
  return self->_focusEdgeMask;
}

- (void)setFocusEdgeMask:(id)a3
{
  objc_storeStrong((id *)&self->_focusEdgeMask, a3);
}

- (BOOL)doVisualization
{
  return self->_doVisualization;
}

- (void)setDoVisualization:(BOOL)a3
{
  self->_doVisualization = a3;
}

- (double)colorSize
{
  return *(double *)(a1 + 72);
}

- (void)setColorSize:(PTRaytracingV14RenderState *)self
{
  uint64_t v2;

  *(_QWORD *)self->_colorSize = v2;
}

- (float)pyramidSamplingFraction
{
  return self->_kPyramidSamplingFraction;
}

- (void)setPyramidSamplingFraction:(float)a3
{
  self->_kPyramidSamplingFraction = a3;
}

- (float)edgeTolerance
{
  return self->_edgeTolerance;
}

- (void)setEdgeTolerance:(float)a3
{
  self->_edgeTolerance = a3;
}

- (int)rayCount
{
  return self->_rayCount;
}

- (void)setRayCount:(int)a3
{
  self->_rayCount = a3;
}

- (MTLComputePipelineState)raytracingSDOF
{
  return self->_raytracingSDOF;
}

- (void)setRaytracingSDOF:(id)a3
{
  objc_storeStrong((id *)&self->_raytracingSDOF, a3);
}

- (MTLBuffer)aperturePointsXY
{
  return self->_aperturePointsXY;
}

- (void)setAperturePointsXY:(id)a3
{
  objc_storeStrong((id *)&self->_aperturePointsXY, a3);
}

- (MTLTexture)raytracedRGBRadius
{
  return self->_raytracedRGBRadius;
}

- (void)setRaytracedRGBRadius:(id)a3
{
  objc_storeStrong((id *)&self->_raytracedRGBRadius, a3);
}

- (MTLTexture)raytracedRGBRadiusUpscaled
{
  return self->_raytracedRGBRadiusUpscaled;
}

- (void)setRaytracedRGBRadiusUpscaled:(id)a3
{
  objc_storeStrong((id *)&self->_raytracedRGBRadiusUpscaled, a3);
}

- (MTLTexture)disparityEdges
{
  return self->_disparityEdges;
}

- (void)setDisparityEdges:(id)a3
{
  objc_storeStrong((id *)&self->_disparityEdges, a3);
}

- (MTLTexture)disparityEdgesTemp
{
  return self->_disparityEdgesTemp;
}

- (void)setDisparityEdgesTemp:(id)a3
{
  objc_storeStrong((id *)&self->_disparityEdgesTemp, a3);
}

- (PTDisparityUpscale)disparityUpscale
{
  return self->_disparityUpscale;
}

- (void)setDisparityUpscale:(id)a3
{
  objc_storeStrong((id *)&self->_disparityUpscale, a3);
}

- (PTGlobalReduction)globalReduction
{
  return self->_globalReduction;
}

- (void)setGlobalReduction:(id)a3
{
  objc_storeStrong((id *)&self->_globalReduction, a3);
}

- (MTLBuffer)disparityDiffGlobalMinMax
{
  return self->_disparityDiffGlobalMinMax;
}

- (void)setDisparityDiffGlobalMinMax:(id)a3
{
  objc_storeStrong((id *)&self->_disparityDiffGlobalMinMax, a3);
}

- (float)anamorphicFactor
{
  return self->_anamorphicFactor;
}

- (void)setAnamorphicFactor:(float)a3
{
  self->_anamorphicFactor = a3;
}

- (float)raytracingRadiusLocal
{
  return self->_raytracingRadiusLocal;
}

- (void)setRaytracingRadiusLocal:(float)a3
{
  self->_raytracingRadiusLocal = a3;
}

- (PTQualitySettings)qualitySettings
{
  return self->_qualitySettings;
}

- (void)setQualitySettings:(id)a3
{
  objc_storeStrong((id *)&self->_qualitySettings, a3);
}

- (MTLTexture)disparityDiff
{
  return self->_disparityDiff;
}

- (void)setDisparityDiff:(id)a3
{
  objc_storeStrong((id *)&self->_disparityDiff, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disparityDiff, 0);
  objc_storeStrong((id *)&self->_qualitySettings, 0);
  objc_storeStrong((id *)&self->_disparityDiffGlobalMinMax, 0);
  objc_storeStrong((id *)&self->_disparityEdgesTemp, 0);
  objc_storeStrong((id *)&self->_disparityEdges, 0);
  objc_storeStrong((id *)&self->_raytracedRGBRadiusUpscaled, 0);
  objc_storeStrong((id *)&self->_raytracedRGBRadius, 0);
  objc_storeStrong((id *)&self->_aperturePointsXY, 0);
  objc_storeStrong((id *)&self->_randomGaussNoise, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
  objc_storeStrong((id *)&self->_randomizedGauss, 0);
  objc_storeStrong((id *)&self->_raytracingSDOF, 0);
  objc_storeStrong((id *)&self->_disparityDiffGlobalMax, 0);
  objc_storeStrong((id *)&self->_randomUChars, 0);
  objc_storeStrong((id *)&self->_disparityUpscale, 0);
  objc_storeStrong((id *)&self->_globalReduction, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 util:(uint64_t)a4 quality:(uint64_t)a5 colorSize:(uint64_t)a6 disparitySize:(uint64_t)a7 debugRendering:(uint64_t)a8 pyramidPixelFormat:options:debugTextures:.cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
