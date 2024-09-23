@implementation PTRaytracingV2002

- (PTRaytracingV2002)initWithMetalContext:(id)a3 renderEffects:(id)a4 colorSize:(CGSize)a5 disparitySize:(CGSize)a6 debugRendering:(int64_t)a7 verbose:(BOOL)a8 options:(id)a9 quality:(int)a10
{
  uint64_t v10;
  double height;
  double width;
  id v17;
  id v18;
  char *v19;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  PTPyramid *v37;
  void *v38;
  PTRaytracingUtilsV2 *v39;
  void *v40;
  PTRaytracingInterpolateResultV2 *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  float64x2_t v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  BOOL v61;
  float v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  void *v71;
  PTGlobalReduction *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  PTGuidedFilter *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  float v87;
  double v88;
  float v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  float v108;
  double v109;
  float v110;
  double v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  NSObject *v118;
  PTRaytracingV2002 *v119;
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
  double v233;
  double v234;
  double v235;
  _QWORD v236[3];
  _QWORD v237[3];
  _QWORD v238[3];
  char v239;
  BOOL v240;
  objc_super v241;

  v10 = *(_QWORD *)&a10;
  height = a6.height;
  width = a6.width;
  v234 = a5.width;
  v235 = a5.height;
  v17 = a3;
  v18 = a9;
  v241.receiver = self;
  v241.super_class = (Class)PTRaytracingV2002;
  v19 = -[PTRaytracingV2002 init](&v241, sel_init);
  if (!v19)
    goto LABEL_54;
  PTKTraceInit();
  *((double *)v19 + 5) = width;
  *((double *)v19 + 6) = height;
  objc_storeStrong((id *)v19 + 7, a3);
  *((_QWORD *)v19 + 4) = a7;
  objc_storeStrong((id *)v19 + 1, a9);
  +[PTQualitySettings createWithQuality:options:](PTQualitySettings, "createWithQuality:options:", v10, v18);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)*((_QWORD *)v19 + 11);
  *((_QWORD *)v19 + 11) = v20;

  if (*((_QWORD *)v19 + 11))
  {
    +[PTRaytracingUtilsV2 createFocusEdge](PTRaytracingUtilsV2, "createFocusEdge");
    *((_DWORD *)v19 + 17) = v22;
    *((_DWORD *)v19 + 18) = v23;
    *((_DWORD *)v19 + 19) = v24;
    *((_DWORD *)v19 + 20) = v25;
    v240 = 0;
    v240 = (int)objc_msgSend(*((id *)v19 + 11), "quality") < 100;
    objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E8251E00);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v19[64] = v26 != 0;

    if (v19[64])
    {
      objc_msgSend(v18, "objectForKeyedSubscript:", &unk_1E8251E00);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)*((_QWORD *)v19 + 2);
      *((_QWORD *)v19 + 2) = v27;

      goto LABEL_8;
    }
    v37 = -[PTPyramid initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:]([PTPyramid alloc], "initWithMetalContext:colorSize:pixelFormat:skipFullSizeLayer:doFirstLevelGaussianDownsample:mipmapLevelCount:", v17, 115, v240, objc_msgSend(*((id *)v19 + 11), "doFirstLevelGaussianDownsample"), 4, v234, v235);
    v38 = (void *)*((_QWORD *)v19 + 2);
    *((_QWORD *)v19 + 2) = v37;

    if (*((_QWORD *)v19 + 2))
    {
LABEL_8:
      v39 = -[PTRaytracingUtilsV2 initWithMetalContext:]([PTRaytracingUtilsV2 alloc], "initWithMetalContext:", v17);
      v40 = (void *)*((_QWORD *)v19 + 12);
      *((_QWORD *)v19 + 12) = v39;

      if (*((_QWORD *)v19 + 12))
      {
        v41 = -[PTRaytracingInterpolateResultV2 initWithMetalContext:useExportQualityNoise:]([PTRaytracingInterpolateResultV2 alloc], "initWithMetalContext:useExportQualityNoise:", v17, objc_msgSend(*((id *)v19 + 11), "useExportQualityNoise"));
        v42 = (void *)*((_QWORD *)v19 + 13);
        *((_QWORD *)v19 + 13) = v41;

        if (*((_QWORD *)v19 + 13))
        {
          v43 = +[PTPrecomputeRandom computeUnitDiskPoints:numberOfPatternCircles:](PTPrecomputeRandom, "computeUnitDiskPoints:numberOfPatternCircles:", v17, objc_msgSend(*((id *)v19 + 11), "numberOfPatternCircles"));
          v45 = v44;
          v46 = (void *)*((_QWORD *)v19 + 16);
          *((_QWORD *)v19 + 16) = v43;

          *((_WORD *)v19 + 70) = WORD2(v45);
          *((_DWORD *)v19 + 34) = v45;
          if (*((_QWORD *)v19 + 16))
          {
            +[PTPrecomputeRandom computeRandomUChars:rayCount:](PTPrecomputeRandom, "computeRandomUChars:rayCount:", v17, v45);
            v47 = objc_claimAutoreleasedReturnValue();
            v48 = (void *)*((_QWORD *)v19 + 18);
            *((_QWORD *)v19 + 18) = v47;

            if (*((_QWORD *)v19 + 18))
            {
              *((_DWORD *)v19 + 63) = *((_DWORD *)v19 + 34);
              v19[248] = 0;
              _H0 = *((_WORD *)v19 + 70);
              __asm { FCVT            S10, H0 }
              v55.f64[0] = v234;
              v55.f64[1] = v235;
              *((float32x2_t *)v19 + 32) = vcvt_f32_f64(v55);
              *(_OWORD *)(v19 + 264) = xmmword_1C9322DC0;
              v239 = 0;
              v239 = objc_msgSend(*((id *)v19 + 11), "rayMarch");
              objc_msgSend(*((id *)v19 + 11), "renderDownscale");
              v56 = 3.0;
              if (v57 <= 3.0)
              {
                objc_msgSend(*((id *)v19 + 11), "renderDownscale");
                v56 = 1.0;
                if (v58 >= 2.0)
                  v56 = 2.0;
              }
              objc_msgSend(*((id *)v19 + 11), "renderDownscale");
              v60 = v59 + 0.5;
              v61 = v59 <= 2.0;
              v62 = 2.5;
              if (!v61)
                v62 = v60;
              *(float *)&v63 = 1.0 / (float)(0.5 - v62);
              *((float *)&v63 + 1) = -v62;
              v233 = v63;
              v64 = (void *)objc_opt_new();
              objc_msgSend(v64, "setConstantValue:type:withName:", v19 + 252, 29, CFSTR("kRaycount"));
              objc_msgSend(v64, "setConstantValue:type:withName:", &v239, 53, CFSTR("kRayMarch"));
              objc_msgSend(v64, "setConstantValue:type:withName:", &v240, 53, CFSTR("kSkipFullSizeLayer"));
              LODWORD(v65) = _S10;
              objc_msgSend(v64, "setConstantFloat:withName:", CFSTR("kRadiusLocal_float"), v65);
              LODWORD(v66) = 0.25;
              objc_msgSend(v64, "setConstantFloat:withName:", CFSTR("kRadiusLocalFraction_float"), v66);
              *(float *)&v67 = v56;
              objc_msgSend(v64, "setConstantFloat:withName:", CFSTR("kDiameterCoverageLimit_float"), v67);
              objc_msgSend(v64, "setConstantFloat2:withName:", CFSTR("kFocusBlendCoefficients_float2"), v233);
              LODWORD(v68) = *((_DWORD *)v19 + 66);
              objc_msgSend(v64, "setConstantFloat:withName:", CFSTR("kPyramidSamplingFraction_float"), v68);
              LODWORD(v69) = 6.0;
              objc_msgSend(v64, "setConstantFloat:withName:", CFSTR("kRayMarchDisparityRadiusTolerance_float"), v69);
              objc_msgSend(*((id *)v19 + 7), "computePipelineStateFor:withConstants:", CFSTR("raytracingV2002"), v64);
              v70 = objc_claimAutoreleasedReturnValue();
              v71 = (void *)*((_QWORD *)v19 + 35);
              *((_QWORD *)v19 + 35) = v70;

              if (!*((_QWORD *)v19 + 35))
              {
                _PTLogSystem();
                v118 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                  -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.7(v118, v156, v157, v158, v159, v160, v161, v162);
                goto LABEL_78;
              }
              if (objc_msgSend(*((id *)v19 + 11), "rayMarch"))
              {
                v72 = -[PTGlobalReduction initWithMetalContext:textureSize:]([PTGlobalReduction alloc], "initWithMetalContext:textureSize:", *((_QWORD *)v19 + 7), width, height);
                v73 = (void *)*((_QWORD *)v19 + 14);
                *((_QWORD *)v19 + 14) = v72;

                if (!*((_QWORD *)v19 + 14))
                {
                  _PTLogSystem();
                  v118 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.8(v118, v163, v164, v165, v166, v167, v168, v169);
                  goto LABEL_78;
                }
                objc_msgSend(*((id *)v19 + 7), "device");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = objc_msgSend(v74, "newBufferWithLength:options:", 8, 0);
                v76 = (void *)*((_QWORD *)v19 + 19);
                *((_QWORD *)v19 + 19) = v75;

                if (!*((_QWORD *)v19 + 19))
                {
                  _PTLogSystem();
                  v118 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.9(v118, v170, v171, v172, v173, v174, v175, v176);
                  goto LABEL_78;
                }
                objc_msgSend(*((id *)v19 + 7), "textureUtil");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v77, "createWithSize:pixelFormat:", 10, width, height);
                v78 = objc_claimAutoreleasedReturnValue();
                v79 = (void *)*((_QWORD *)v19 + 20);
                *((_QWORD *)v19 + 20) = v78;

                if (!*((_QWORD *)v19 + 20))
                {
                  _PTLogSystem();
                  v118 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.10(v118, v198, v199, v200, v201, v202, v203, v204);
                  goto LABEL_78;
                }
                objc_msgSend(*((id *)v19 + 7), "textureUtil");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "createWithSize:pixelFormat:", 10, width, height);
                v81 = objc_claimAutoreleasedReturnValue();
                v82 = (void *)*((_QWORD *)v19 + 21);
                *((_QWORD *)v19 + 21) = v81;

                if (!*((_QWORD *)v19 + 21))
                {
                  _PTLogSystem();
                  v118 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.11(v118, v219, v220, v221, v222, v223, v224, v225);
                  goto LABEL_78;
                }
              }
              if (objc_msgSend(*((id *)v19 + 11), "doDisparityUpsampling"))
              {
                v83 = [PTGuidedFilter alloc];
                v84 = *((_QWORD *)v19 + 7);
                v238[0] = (unint64_t)width;
                v238[1] = (unint64_t)height;
                v238[2] = 1;
                objc_msgSend(*((id *)v19 + 11), "disparityGuidedFilterEpsilon");
                v85 = -[PTGuidedFilter initWithMetalContext:inputSize:epsilon:](v83, "initWithMetalContext:inputSize:epsilon:", v84, v238);
                v86 = (void *)*((_QWORD *)v19 + 15);
                *((_QWORD *)v19 + 15) = v85;

                if (!*((_QWORD *)v19 + 15))
                {
                  _PTLogSystem();
                  v118 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.12(v118, v177, v178, v179, v180, v181, v182, v183);
                  goto LABEL_78;
                }
                objc_msgSend(*((id *)v19 + 11), "disparityUpsampleFactor");
                v88 = width * v87;
                objc_msgSend(*((id *)v19 + 11), "disparityUpsampleFactor");
                *((double *)v19 + 29) = v88;
                *((double *)v19 + 30) = height * v89;
                objc_msgSend(v17, "textureUtil");
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v90, "createWithSize:pixelFormat:", 25, *((double *)v19 + 29), *((double *)v19 + 30));
                v91 = objc_claimAutoreleasedReturnValue();
                v92 = (void *)*((_QWORD *)v19 + 26);
                *((_QWORD *)v19 + 26) = v91;

                v93 = (void *)*((_QWORD *)v19 + 26);
                if (!v93)
                {
                  _PTLogSystem();
                  v118 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.13(v118, v205, v206, v207, v208, v209, v210, v211);
                  goto LABEL_78;
                }
                v94 = (void *)*((_QWORD *)v19 + 2);
                v95 = objc_msgSend(v93, "width");
                v96 = objc_msgSend(*((id *)v19 + 26), "height");
                v237[0] = v95;
                v237[1] = v96;
                v237[2] = 1;
                objc_msgSend(v94, "findMipmapLevelLargerThan:", v237);
                v97 = objc_claimAutoreleasedReturnValue();
                v98 = (void *)*((_QWORD *)v19 + 28);
                *((_QWORD *)v19 + 28) = v97;

                v99 = (void *)*((_QWORD *)v19 + 2);
                v236[0] = (unint64_t)width;
                v236[1] = (unint64_t)height;
                v236[2] = 1;
                objc_msgSend(v99, "findMipmapLevelLargerThan:", v236);
                v100 = objc_claimAutoreleasedReturnValue();
                v101 = (void *)*((_QWORD *)v19 + 27);
                *((_QWORD *)v19 + 27) = v100;

              }
              if (!objc_msgSend(*((id *)v19 + 11), "doCenterDisparity"))
                goto LABEL_82;
              objc_msgSend(*((id *)v19 + 7), "textureUtil");
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "createWithSize:pixelFormat:", 25, width, height);
              v103 = objc_claimAutoreleasedReturnValue();
              v104 = (void *)*((_QWORD *)v19 + 22);
              *((_QWORD *)v19 + 22) = v103;

              if (!*((_QWORD *)v19 + 22))
              {
                _PTLogSystem();
                v118 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                  -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.14(v118, v191, v192, v193, v194, v195, v196, v197);
              }
              else
              {
                if (!objc_msgSend(*((id *)v19 + 11), "doFocusEdgeMask"))
                  goto LABEL_33;
LABEL_82:
                objc_msgSend(*((id *)v19 + 7), "textureUtil");
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(*((id *)v19 + 11), "doDisparityUpsampling"))
                {
                  width = *((double *)v19 + 29);
                  height = *((double *)v19 + 30);
                }
                objc_msgSend(v105, "createWithSize:pixelFormat:", 25, width, height);
                v106 = objc_claimAutoreleasedReturnValue();
                v107 = (void *)*((_QWORD *)v19 + 23);
                *((_QWORD *)v19 + 23) = v106;

                if (!*((_QWORD *)v19 + 23))
                {
                  _PTLogSystem();
                  v118 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                    -[PTRaytracingUtils initWithMetalContext:].cold.6(v118, v212, v213, v214, v215, v216, v217, v218);
                }
                else
                {
LABEL_33:
                  objc_msgSend(*((id *)v19 + 11), "renderDownscale");
                  v109 = v234 / v108;
                  objc_msgSend(*((id *)v19 + 11), "renderDownscale");
                  v111 = v235 / v110;
                  objc_msgSend(v17, "textureUtil");
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v112, "createWithSize:pixelFormat:", 115, v109, v111);
                  v113 = objc_claimAutoreleasedReturnValue();
                  v114 = (void *)*((_QWORD *)v19 + 24);
                  *((_QWORD *)v19 + 24) = v113;

                  if (*((_QWORD *)v19 + 24))
                  {
                    if (!objc_msgSend(*((id *)v19 + 11), "doIntermediate2XUpscale"))
                      goto LABEL_36;
                    objc_msgSend(*((id *)v19 + 7), "textureUtil");
                    v115 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v115, "createWithWidth:height:pixelFormat:", (unint64_t)(v109 + v109), (unint64_t)(v111 + v111), objc_msgSend(*((id *)v19 + 11), "intermediatePixelFormat"));
                    v116 = objc_claimAutoreleasedReturnValue();
                    v117 = (void *)*((_QWORD *)v19 + 25);
                    *((_QWORD *)v19 + 25) = v116;

                    if (*((_QWORD *)v19 + 25))
                    {
LABEL_36:
                      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", *((_QWORD *)v19 + 24), *((_QWORD *)v19 + 20), *((_QWORD *)v19 + 21), 0);
                      v118 = objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(*((id *)v19 + 11), "doDisparityUpsampling")
                        && *((_QWORD *)v19 + 26))
                      {
                        -[NSObject addObject:](v118, "addObject:");
                      }
                      if (objc_msgSend(*((id *)v19 + 11), "doFocusEdgeMask") && *((_QWORD *)v19 + 23))
                        -[NSObject addObject:](v118, "addObject:");
                      v119 = v19;
                      goto LABEL_79;
                    }
                    _PTLogSystem();
                    v118 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                      -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.17(v118, v226, v227, v228, v229, v230, v231, v232);
                  }
                  else
                  {
                    _PTLogSystem();
                    v118 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
                      -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.16(v118, v184, v185, v186, v187, v188, v189, v190);
                  }
                }
              }
LABEL_78:
              v119 = 0;
LABEL_79:

              goto LABEL_55;
            }
            _PTLogSystem();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.6(v29, v148, v149, v150, v151, v152, v153, v154);
          }
          else
          {
            _PTLogSystem();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.5(v29, v141, v142, v143, v144, v145, v146, v147);
          }
        }
        else
        {
          _PTLogSystem();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.4(v29, v127, v128, v129, v130, v131, v132, v133);
        }
      }
      else
      {
        _PTLogSystem();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.3(v29, v120, v121, v122, v123, v124, v125, v126);
      }
      goto LABEL_53;
    }
    _PTLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.2(v29, v134, v135, v136, v137, v138, v139, v140);
  }
  else
  {
    _PTLogSystem();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[PTRaytracingV2002 initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);
  }
LABEL_53:

LABEL_54:
  v119 = 0;
LABEL_55:

  return v119;
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
  float kPyramidSamplingFraction;
  float anamorphicFactor;
  uint64_t kRayCount;
  double v12;
  _BOOL8 v13;
  double v14;
  double v15;
  PTPyramid *rgbaPyramid;
  void *v17;
  PTRaytracingUtilsV2 *raytracingUtils;
  void *v19;
  MTLTexture *disparityDiff;
  double v21;
  MTLTexture *v22;
  MTLTexture *v23;
  PTGlobalReduction *globalReduction;
  PTRaytracingUtilsV2 *v25;
  MTLTexture *disparityEdgesTemp;
  MTLTexture *disparityEdges;
  MTLBuffer *disparityDiffGlobalMinMax;
  double v29;
  double v30;
  double v31;
  PTGuidedFilter *guidedFilter;
  MTLTexture *guideRGBAUpscale;
  MTLTexture *guideRGBACoefficients;
  MTLTexture *disparityUpscaled;
  void *v36;
  MTLTexture *v37;
  PTRaytracingUtilsV2 *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  int v45;
  float32x2_t v46;
  unsigned int v47;
  int32x2_t v48;
  float v49;
  unint64_t v50;
  float v51;
  unint64_t v52;
  void *v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  MTLTexture *v63;
  void *v64;
  MTLTexture *v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v76;
  float v77;
  uint64_t v78;
  _QWORD v79[5];
  int64x2_t v80;
  uint64_t v81;
  _WORD v82[2];
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "renderState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "quality");
  objc_msgSend(v7, "fNumber");
  objc_msgSend(v7, "focusDisparity");
  objc_msgSend(v7, "alphaLowLight");
  kdebug_trace();

  v91 = 0;
  v89 = 0u;
  v90 = 0u;
  kPyramidSamplingFraction = self->_kPyramidSamplingFraction;
  anamorphicFactor = self->_anamorphicFactor;
  kRayCount = self->_kRayCount;
  v12 = *(double *)self->_colorSize;
  v13 = -[PTQualitySettings doMacroApertureLimit](self->_qualitySettings, "doMacroApertureLimit");
  *(float *)&v14 = kPyramidSamplingFraction;
  *(float *)&v15 = anamorphicFactor;
  +[PTRaytracingUtilsV2 createFocusObject:pyramidSamplingFraction:anamorphicFactor:rayCount:colorSize:doMacroApertureLimit:](PTRaytracingUtilsV2, "createFocusObject:pyramidSamplingFraction:anamorphicFactor:rayCount:colorSize:doMacroApertureLimit:", v7, kRayCount, v13, v14, v15, v12);
  v87 = 0u;
  v88 = 0u;
  if (v7)
    objc_msgSend(v7, "scissorRect");
  if (!self->_injectedRGBAPyramid)
  {
    rgbaPyramid = self->_rgbaPyramid;
    objc_msgSend(v7, "sourceColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTPyramid updatePyramidFromPTTexture:inPTTexture:](rgbaPyramid, "updatePyramidFromPTTexture:inPTTexture:", v6, v17);

  }
  if (-[PTQualitySettings doCenterDisparity](self->_qualitySettings, "doCenterDisparity"))
  {
    raytracingUtils = self->_raytracingUtils;
    objc_msgSend(v7, "sourceDisparity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    disparityDiff = self->_disparityDiff;
    *(float *)&v21 = self->_foregroundBlurLimitingFactor;
    v84 = v89;
    v85 = v90;
    v86 = v91;
    -[PTRaytracingUtilsV2 centerDisparityOnFocus:inDisparity:outDisparity:focusObject:foregroundBlurLimitingFactor:](raytracingUtils, "centerDisparityOnFocus:inDisparity:outDisparity:focusObject:foregroundBlurLimitingFactor:", v6, v19, disparityDiff, &v84, v21);

    v22 = self->_disparityDiff;
  }
  else
  {
    objc_msgSend(v7, "sourceDisparity");
    v22 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
  }
  v23 = v22;
  globalReduction = self->_globalReduction;
  if (globalReduction)
  {
    -[PTGlobalReduction parallelReductionMinMax:inTexture:globalMinMaxBuffer:](globalReduction, "parallelReductionMinMax:inTexture:globalMinMaxBuffer:", v6, v23, self->_disparityDiffGlobalMinMax);
    v25 = self->_raytracingUtils;
    disparityEdges = self->_disparityEdges;
    disparityEdgesTemp = self->_disparityEdgesTemp;
    disparityDiffGlobalMinMax = self->_disparityDiffGlobalMinMax;
    *(float *)&v29 = self->_edgeTolerance;
    v84 = v89;
    v85 = v90;
    v86 = v91;
    -[PTRaytracingUtilsV2 detectDilatedEdges:inDisparity:tempEdges:outEdges:focusObject:disparityDiffMinMax:edgeTolerance:](v25, "detectDilatedEdges:inDisparity:tempEdges:outEdges:focusObject:disparityDiffMinMax:edgeTolerance:", v6, v23, disparityEdgesTemp, disparityEdges, &v84, disparityDiffGlobalMinMax, v29);
  }
  if (-[PTQualitySettings doDisparityUpsampling](self->_qualitySettings, "doDisparityUpsampling"))
  {
    guidedFilter = self->_guidedFilter;
    guideRGBACoefficients = self->_guideRGBACoefficients;
    guideRGBAUpscale = self->_guideRGBAUpscale;
    disparityUpscaled = self->_disparityUpscaled;
    objc_msgSend(v7, "renderState");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTGuidedFilter guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImage:sourceColorBitDepth:postModifierPtr:](guidedFilter, "guidedFilter:image:guideRGBACoefficients:guideRGBAUpscale:upscaledImage:sourceColorBitDepth:postModifierPtr:", v6, v23, guideRGBACoefficients, guideRGBAUpscale, disparityUpscaled, objc_msgSend(v36, "sourceColorBitDepth"), 0);

    v37 = self->_disparityUpscaled;
    v23 = v37;
  }
  if (self->_focusEdgeMask)
  {
    v38 = self->_raytracingUtils;
    HIDWORD(v39) = DWORD1(v89);
    HIDWORD(v40) = DWORD1(v90);
    v84 = v89;
    v85 = v90;
    v86 = v91;
    *(float *)&v39 = self->_focusEdge.width;
    *(float *)&v40 = self->_focusEdge.gradientThreshold;
    *(float *)&v30 = self->_focusEdge.gradientWeight;
    *(float *)&v31 = self->_focusEdge.minMaxThreshold;
    -[PTRaytracingUtilsV2 focusEdgeMask:inDisparityDiff:focusObject:focusEdge:outFocusEdgeMask:](v38, "focusEdgeMask:inDisparityDiff:focusObject:focusEdge:outFocusEdgeMask:", v6, v23, &v84, v39, v40, v30, v31);
  }
  objc_msgSend(v7, "sourceDisparity");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (float)(unint64_t)objc_msgSend(v41, "width");
  objc_msgSend(v7, "sourceDisparity");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "height");
  *(float *)&v44 = v77;
  *((float *)&v44 + 1) = (float)v43;
  v78 = v44;

  v83 = v78;
  v76 = v87;
  -[PTQualitySettings renderDownscale](self->_qualitySettings, "renderDownscale");
  LODWORD(v78) = v45;
  v46 = vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)vmovn_s64((int64x2_t)__PAIR128__(*((unint64_t *)&v87 + 1), v76)), (int8x8_t)0xFFFF0000FFFFLL));
  -[PTQualitySettings renderDownscale](self->_qualitySettings, "renderDownscale");
  v48 = vcvt_s32_f32(vdiv_f32(v46, (float32x2_t)__PAIR64__(v47, v78)));
  v82[1] = v48.i16[2];
  v82[0] = v48.i16[0];
  v46.f32[0] = (float)(unint64_t)v88;
  -[PTQualitySettings renderDownscale](self->_qualitySettings, "renderDownscale");
  v50 = vcvtps_u32_f32(v46.f32[0] / v49);
  v46.f32[0] = (float)*((unint64_t *)&v88 + 1);
  -[PTQualitySettings renderDownscale](self->_qualitySettings, "renderDownscale");
  v52 = vcvtps_u32_f32(v46.f32[0] / v51);
  objc_msgSend(v6, "computeCommandEncoder");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v53)
  {
    _PTLogSystem();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v54, v55, v56, v57, v58, v59, v60, v61);

  }
  objc_msgSend(v53, "setComputePipelineState:", self->_raytracingSDOF);
  -[PTPyramid mipmapTexture](self->_rgbaPyramid, "mipmapTexture");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setTexture:atIndex:", v62, 0);

  objc_msgSend(v53, "setTexture:atIndex:", v23, 1);
  objc_msgSend(v53, "setTexture:atIndex:", self->_disparityEdges, 2);
  objc_msgSend(v53, "setTexture:atIndex:", self->_raytracedRGBWeight, 3);
  objc_msgSend(v53, "setTexture:atIndex:", self->_focusEdgeMask, 4);
  objc_msgSend(v53, "setBytes:length:atIndex:", &v89, 40, 0);
  objc_msgSend(v53, "setBuffer:offset:atIndex:", self->_aperturePoints.xy, 0, 1);
  objc_msgSend(v53, "setBuffer:offset:atIndex:", self->_randomUChars, 0, 2);
  objc_msgSend(v53, "setBuffer:offset:atIndex:", self->_disparityDiffGlobalMinMax, 0, 3);
  objc_msgSend(v53, "setBytes:length:atIndex:", &v83, 8, 4);
  objc_msgSend(v53, "setBytes:length:atIndex:", v82, 4, 5);
  *(_QWORD *)&v84 = v50;
  *((_QWORD *)&v84 + 1) = v52;
  *(_QWORD *)&v85 = 1;
  v80 = vdupq_n_s64(8uLL);
  v81 = 1;
  objc_msgSend(v53, "dispatchThreads:threadsPerThreadgroup:", &v84, &v80);
  objc_msgSend(v53, "endEncoding");
  v63 = self->_raytracedRGBWeight;
  if (self->_raytracedRGBWeightUpscaled)
  {
    -[PTMetalContext textureUtil](self->_metalContext, "textureUtil");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "copy:inTex:outTex:", v6, self->_raytracedRGBWeight, self->_raytracedRGBWeightUpscaled);

    v65 = self->_raytracedRGBWeightUpscaled;
    v63 = v65;
  }
  objc_msgSend(v6, "computeCommandEncoder");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v66)
  {
    _PTLogSystem();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      -[PTRaytracingUtils disparityApplyPostModifier:inDisparity:outDisparity:postModfier:].cold.1(v67, v68, v69, v70, v71, v72, v73, v74);

  }
  -[PTRaytracingInterpolateResultV2 interpolateRGBWeightUsingSourceToDest:renderRequest:inRGBWeight:](self->_raytracingInterpolateResult, "interpolateRGBWeightUsingSourceToDest:renderRequest:inRGBWeight:", v66, v7, v63);
  objc_msgSend(v66, "endEncoding");
  if (kdebug_is_enabled())
  {
    v79[0] = MEMORY[0x1E0C809B0];
    v79[1] = 3221225472;
    v79[2] = __62__PTRaytracingV2002_renderContinuousWithSource_renderRequest___block_invoke;
    v79[3] = &unk_1E822A0B0;
    v79[4] = self;
    objc_msgSend(v6, "addCompletedHandler:", v79);
  }

  return 0;
}

void __62__PTRaytracingV2002_renderContinuousWithSource_renderRequest___block_invoke(uint64_t a1, void *a2)
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
  objc_storeStrong((id *)&self->_disparityUpscaled, 0);
  objc_storeStrong((id *)&self->_raytracedRGBWeightUpscaled, 0);
  objc_storeStrong((id *)&self->_raytracedRGBWeight, 0);
  objc_storeStrong((id *)&self->_focusEdgeMask, 0);
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

- (void)initWithMetalContext:(NSObject *)a1 renderEffects:(uint64_t)a2 colorSize:(uint64_t)a3 disparitySize:(uint64_t)a4 debugRendering:(uint64_t)a5 verbose:(uint64_t)a6 options:(uint64_t)a7 quality:(uint64_t)a8 .cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

@end
