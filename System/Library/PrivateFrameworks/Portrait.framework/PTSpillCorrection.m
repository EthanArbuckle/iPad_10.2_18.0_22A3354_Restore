@implementation PTSpillCorrection

- (PTSpillCorrection)initWithMetalContext:(id)a3 refinementWidth:(unint64_t)a4 refinementHeight:(unint64_t)a5
{
  double v5;

  LODWORD(v5) = 2.0;
  return -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:](self, "initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:", a3, a4, a5, 2, 3, 3, v5, 5, 5);
}

- (PTSpillCorrection)initWithMetalContext:(id)a3 refinementWidth:(unint64_t)a4 refinementHeight:(unint64_t)a5 refinementSteps:(unint64_t)a6 minFilterKernelWidth:(unint64_t)a7 minFilterKernelHeight:(unint64_t)a8 maxFilterKernelWidth:(unint64_t)a9 maxFilterKernelHeight:(unint64_t)a10 gaussianBlurSigma:(float)a11
{
  id v19;
  PTSpillCorrection *v20;
  PTSpillCorrection *v21;
  uint64_t v22;
  MTLComputePipelineState *initConstraintsPart1;
  uint64_t v24;
  MTLComputePipelineState *initConstraintsPart2;
  uint64_t v26;
  MTLComputePipelineState *initDiffusion;
  uint64_t v28;
  MTLComputePipelineState *constrainDiffusion;
  uint64_t v30;
  MTLComputePipelineState *computeUpsamplingCoefficients;
  uint64_t v32;
  MTLComputePipelineState *averageUpsamplingCoefficients;
  uint64_t v34;
  MTLComputePipelineState *applyUpsamplingCoefficients;
  void *v36;
  uint64_t v37;
  MTLTexture *guideTexture;
  void *v39;
  uint64_t v40;
  MTLTexture *diffusionTexture;
  void *v42;
  uint64_t v43;
  MTLTexture *constraintsTexture;
  void *v45;
  uint64_t v46;
  MTLTexture *coeffXTexture;
  void *v48;
  uint64_t v49;
  MTLTexture *coeffYTexture;
  void *v51;
  uint64_t v52;
  MTLTexture *coeffZTexture;
  void *v54;
  uint64_t v55;
  MTLTexture *coeffXFilteredTexture;
  void *v57;
  uint64_t v58;
  MTLTexture *coeffYFilteredTexture;
  void *v60;
  uint64_t v61;
  MTLTexture *coeffZFilteredTexture;
  void *v63;
  uint64_t v64;
  MTLTexture *segmentationTexture;
  void *v66;
  uint64_t v67;
  MTLTexture *segmentationMinTexture;
  void *v69;
  uint64_t v70;
  MTLTexture *segmentationMaxTexture;
  id v72;
  void *v73;
  uint64_t v74;
  MPSImageAreaMin *minFilter;
  id v76;
  void *v77;
  uint64_t v78;
  MPSImageAreaMax *maxFilter;
  id v80;
  void *v81;
  double v82;
  uint64_t v83;
  MPSImageGaussianBlur *gaussianBlur;
  PTSpillCorrection *v85;
  NSObject *v86;
  uint64_t v87;
  uint64_t v88;
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
  objc_super v221;

  v19 = a3;
  v221.receiver = self;
  v221.super_class = (Class)PTSpillCorrection;
  v20 = -[PTSpillCorrection init](&v221, sel_init);
  v21 = v20;
  if (!v20)
    goto LABEL_63;
  objc_storeStrong((id *)&v20->_metalContext, a3);
  v21->_refinementSteps = a6;
  objc_msgSend(v19, "computePipelineStateFor:withConstants:", CFSTR("PTSpillCorrection_initConstraintsPart1"), 0);
  v22 = objc_claimAutoreleasedReturnValue();
  initConstraintsPart1 = v21->_initConstraintsPart1;
  v21->_initConstraintsPart1 = (MTLComputePipelineState *)v22;

  if (!v21->_initConstraintsPart1)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.1(v86, v87, v88, v89, v90, v91, v92, v93);
    goto LABEL_62;
  }
  objc_msgSend(v19, "computePipelineStateFor:withConstants:", CFSTR("PTSpillCorrection_initConstraintsPart2"), 0);
  v24 = objc_claimAutoreleasedReturnValue();
  initConstraintsPart2 = v21->_initConstraintsPart2;
  v21->_initConstraintsPart2 = (MTLComputePipelineState *)v24;

  if (!v21->_initConstraintsPart2)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.2(v86, v94, v95, v96, v97, v98, v99, v100);
    goto LABEL_62;
  }
  objc_msgSend(v19, "computePipelineStateFor:withConstants:", CFSTR("PTSpillCorrection_initDiffusion"), 0);
  v26 = objc_claimAutoreleasedReturnValue();
  initDiffusion = v21->_initDiffusion;
  v21->_initDiffusion = (MTLComputePipelineState *)v26;

  if (!v21->_initDiffusion)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.3(v86, v101, v102, v103, v104, v105, v106, v107);
    goto LABEL_62;
  }
  objc_msgSend(v19, "computePipelineStateFor:withConstants:", CFSTR("PTSpillCorrection_constrainDiffusion"), 0);
  v28 = objc_claimAutoreleasedReturnValue();
  constrainDiffusion = v21->_constrainDiffusion;
  v21->_constrainDiffusion = (MTLComputePipelineState *)v28;

  if (!v21->_constrainDiffusion)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.4(v86, v108, v109, v110, v111, v112, v113, v114);
    goto LABEL_62;
  }
  objc_msgSend(v19, "computePipelineStateFor:withConstants:", CFSTR("PTSpillCorrection_computeUpsamplingCoefficients"), 0);
  v30 = objc_claimAutoreleasedReturnValue();
  computeUpsamplingCoefficients = v21->_computeUpsamplingCoefficients;
  v21->_computeUpsamplingCoefficients = (MTLComputePipelineState *)v30;

  if (!v21->_computeUpsamplingCoefficients)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.5(v86, v115, v116, v117, v118, v119, v120, v121);
    goto LABEL_62;
  }
  objc_msgSend(v19, "computePipelineStateFor:withConstants:", CFSTR("PTSpillCorrection_averageUpsamplingCoefficients"), 0);
  v32 = objc_claimAutoreleasedReturnValue();
  averageUpsamplingCoefficients = v21->_averageUpsamplingCoefficients;
  v21->_averageUpsamplingCoefficients = (MTLComputePipelineState *)v32;

  if (!v21->_averageUpsamplingCoefficients)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.6(v86, v122, v123, v124, v125, v126, v127, v128);
    goto LABEL_62;
  }
  objc_msgSend(v19, "computePipelineStateFor:withConstants:", CFSTR("PTSpillCorrection_applyUpsamplingCoefficients"), 0);
  v34 = objc_claimAutoreleasedReturnValue();
  applyUpsamplingCoefficients = v21->_applyUpsamplingCoefficients;
  v21->_applyUpsamplingCoefficients = (MTLComputePipelineState *)v34;

  if (!v21->_applyUpsamplingCoefficients)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.7(v86, v129, v130, v131, v132, v133, v134, v135);
    goto LABEL_62;
  }
  objc_msgSend(v19, "textureUtil");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "createWithWidth:height:pixelFormat:", a4, a5, 115);
  v37 = objc_claimAutoreleasedReturnValue();
  guideTexture = v21->_guideTexture;
  v21->_guideTexture = (MTLTexture *)v37;

  if (!v21->_guideTexture)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.8(v86, v136, v137, v138, v139, v140, v141, v142);
    goto LABEL_62;
  }
  objc_msgSend(v19, "textureUtil");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "createWithWidth:height:pixelFormat:", a4, a5, 115);
  v40 = objc_claimAutoreleasedReturnValue();
  diffusionTexture = v21->_diffusionTexture;
  v21->_diffusionTexture = (MTLTexture *)v40;

  if (!v21->_diffusionTexture)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.9(v86, v143, v144, v145, v146, v147, v148, v149);
    goto LABEL_62;
  }
  objc_msgSend(v19, "textureUtil");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "createWithWidth:height:pixelFormat:", a4, a5, 115);
  v43 = objc_claimAutoreleasedReturnValue();
  constraintsTexture = v21->_constraintsTexture;
  v21->_constraintsTexture = (MTLTexture *)v43;

  if (!v21->_constraintsTexture)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.10(v86, v150, v151, v152, v153, v154, v155, v156);
    goto LABEL_62;
  }
  objc_msgSend(v19, "textureUtil");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "createWithWidth:height:pixelFormat:", a4, a5, 115);
  v46 = objc_claimAutoreleasedReturnValue();
  coeffXTexture = v21->_coeffXTexture;
  v21->_coeffXTexture = (MTLTexture *)v46;

  if (!v21->_coeffXTexture)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.11(v86, v157, v158, v159, v160, v161, v162, v163);
    goto LABEL_62;
  }
  objc_msgSend(v19, "textureUtil");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "createWithWidth:height:pixelFormat:", a4, a5, 115);
  v49 = objc_claimAutoreleasedReturnValue();
  coeffYTexture = v21->_coeffYTexture;
  v21->_coeffYTexture = (MTLTexture *)v49;

  if (!v21->_coeffYTexture)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.12(v86, v164, v165, v166, v167, v168, v169, v170);
    goto LABEL_62;
  }
  objc_msgSend(v19, "textureUtil");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "createWithWidth:height:pixelFormat:", a4, a5, 115);
  v52 = objc_claimAutoreleasedReturnValue();
  coeffZTexture = v21->_coeffZTexture;
  v21->_coeffZTexture = (MTLTexture *)v52;

  if (!v21->_coeffZTexture)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.13(v86, v171, v172, v173, v174, v175, v176, v177);
    goto LABEL_62;
  }
  objc_msgSend(v19, "textureUtil");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "createWithWidth:height:pixelFormat:", a4, a5, 115);
  v55 = objc_claimAutoreleasedReturnValue();
  coeffXFilteredTexture = v21->_coeffXFilteredTexture;
  v21->_coeffXFilteredTexture = (MTLTexture *)v55;

  if (!v21->_coeffXFilteredTexture)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.14(v86, v178, v179, v180, v181, v182, v183, v184);
    goto LABEL_62;
  }
  objc_msgSend(v19, "textureUtil");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "createWithWidth:height:pixelFormat:", a4, a5, 115);
  v58 = objc_claimAutoreleasedReturnValue();
  coeffYFilteredTexture = v21->_coeffYFilteredTexture;
  v21->_coeffYFilteredTexture = (MTLTexture *)v58;

  if (!v21->_coeffYFilteredTexture)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.15(v86, v185, v186, v187, v188, v189, v190, v191);
    goto LABEL_62;
  }
  objc_msgSend(v19, "textureUtil");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "createWithWidth:height:pixelFormat:", a4, a5, 115);
  v61 = objc_claimAutoreleasedReturnValue();
  coeffZFilteredTexture = v21->_coeffZFilteredTexture;
  v21->_coeffZFilteredTexture = (MTLTexture *)v61;

  if (!v21->_coeffZFilteredTexture)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.16(v86, v192, v193, v194, v195, v196, v197, v198);
    goto LABEL_62;
  }
  objc_msgSend(v19, "textureUtil");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "createWithWidth:height:pixelFormat:", a4, a5, 25);
  v64 = objc_claimAutoreleasedReturnValue();
  segmentationTexture = v21->_segmentationTexture;
  v21->_segmentationTexture = (MTLTexture *)v64;

  if (!v21->_segmentationTexture)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.17(v86, v199, v200, v201, v202, v203, v204, v205);
    goto LABEL_62;
  }
  objc_msgSend(v19, "textureUtil");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "createWithWidth:height:pixelFormat:", a4, a5, 25);
  v67 = objc_claimAutoreleasedReturnValue();
  segmentationMinTexture = v21->_segmentationMinTexture;
  v21->_segmentationMinTexture = (MTLTexture *)v67;

  if (!v21->_segmentationMinTexture)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.18(v86, v206, v207, v208, v209, v210, v211, v212);
    goto LABEL_62;
  }
  objc_msgSend(v19, "textureUtil");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "createWithWidth:height:pixelFormat:", a4, a5, 25);
  v70 = objc_claimAutoreleasedReturnValue();
  segmentationMaxTexture = v21->_segmentationMaxTexture;
  v21->_segmentationMaxTexture = (MTLTexture *)v70;

  if (!v21->_segmentationMaxTexture)
  {
    _PTLogSystem();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
      -[PTSpillCorrection initWithMetalContext:refinementWidth:refinementHeight:refinementSteps:minFilterKernelWidth:minFilterKernelHeight:maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:].cold.19(v86, v213, v214, v215, v216, v217, v218, v219);
LABEL_62:

LABEL_63:
    v85 = 0;
    goto LABEL_64;
  }
  if ((PTDefaultsPublicGetBool(CFSTR("harvesting.enabled"), 0) & 1) == 0)
  {
    v72 = objc_alloc(MEMORY[0x1E0CC6E00]);
    objc_msgSend(v19, "device");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v72, "initWithDevice:kernelWidth:kernelHeight:", v73, a7, a8);
    minFilter = v21->_minFilter;
    v21->_minFilter = (MPSImageAreaMin *)v74;

    v76 = objc_alloc(MEMORY[0x1E0CC6DF8]);
    objc_msgSend(v19, "device");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v76, "initWithDevice:kernelWidth:kernelHeight:", v77, a9, a10);
    maxFilter = v21->_maxFilter;
    v21->_maxFilter = (MPSImageAreaMax *)v78;

    v80 = objc_alloc(MEMORY[0x1E0CC6E48]);
    objc_msgSend(v19, "device");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v82 = a11;
    v83 = objc_msgSend(v80, "initWithDevice:sigma:", v81, v82);
    gaussianBlur = v21->_gaussianBlur;
    v21->_gaussianBlur = (MPSImageGaussianBlur *)v83;

  }
  v85 = v21;
LABEL_64:

  return v85;
}

- (int)encodeToCommandBuffer:(id)a3 rgbTexture:(id)a4 segmentationTexture:(id)a5
{
  PTMetalContext *metalContext;
  id v9;
  id v10;
  id v11;
  void *v12;

  metalContext = self->_metalContext;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[PTMetalContext textureUtil](metalContext, "textureUtil");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "copy:inTex:outTex:", v11, v10, self->_guideTexture);

  LODWORD(v10) = -[PTSpillCorrection encodeToCommandBuffer:segmentationTexture:](self, "encodeToCommandBuffer:segmentationTexture:", v11, v9);
  return (int)v10;
}

- (int)encodeToCommandBuffer:(id)a3 lumaTexture:(id)a4 chromaTexture:(id)a5 normChromaOffset:(id)a6 segmentationTexture:
{
  PTMetalContext *metalContext;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  metalContext = self->_metalContext;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  -[PTMetalContext textureUtil](metalContext, "textureUtil");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resample420To444:inLuma:inChroma:outYUV:", v14, v13, v12, self->_guideTexture);

  LODWORD(v12) = -[PTSpillCorrection encodeToCommandBuffer:segmentationTexture:](self, "encodeToCommandBuffer:segmentationTexture:", v14, v11);
  return (int)v12;
}

- (int)encodeToCommandBuffer:(id)a3 segmentationTexture:(id)a4
{
  PTMetalContext *metalContext;
  id v7;
  id v8;
  void *v9;

  metalContext = self->_metalContext;
  v7 = a4;
  v8 = a3;
  -[PTMetalContext textureUtil](metalContext, "textureUtil");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "copy:inTex:outTex:", v8, v7, self->_segmentationTexture);

  -[PTSpillCorrection updateFromDefaults](self, "updateFromDefaults");
  -[PTSpillCorrection initConstraints:](self, "initConstraints:", v8);
  -[PTSpillCorrection diffusion:](self, "diffusion:", v8);

  return 0;
}

- (void)initConstraints:(id)a3
{
  MPSImageAreaMin *minFilter;
  MTLTexture *segmentationTexture;
  MTLTexture *segmentationMinTexture;
  id v7;
  void *v8;
  MTLTexture **p_constraintsTexture;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[3];
  __int128 v16;
  uint64_t v17;
  _QWORD v18[3];

  minFilter = self->_minFilter;
  segmentationTexture = self->_segmentationTexture;
  segmentationMinTexture = self->_segmentationMinTexture;
  v7 = a3;
  -[MPSImageAreaMin encodeToCommandBuffer:sourceTexture:destinationTexture:](minFilter, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v7, segmentationTexture, segmentationMinTexture);
  -[MPSImageAreaMax encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_maxFilter, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v7, self->_segmentationTexture, self->_segmentationMaxTexture);
  objc_msgSend(v7, "computeCommandEncoder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setComputePipelineState:", self->_initConstraintsPart1);
  objc_msgSend(v8, "setTexture:atIndex:", self->_guideTexture, 0);
  objc_msgSend(v8, "setTexture:atIndex:", self->_segmentationMinTexture, 1);
  p_constraintsTexture = &self->_constraintsTexture;
  objc_msgSend(v8, "setTexture:atIndex:", self->_constraintsTexture, 2);
  v10 = -[MTLTexture width](self->_constraintsTexture, "width");
  v11 = -[MTLTexture height](self->_constraintsTexture, "height");
  v18[0] = v10;
  v18[1] = v11;
  v18[2] = 1;
  v16 = xmmword_1C9322A40;
  v17 = 1;
  objc_msgSend(v8, "dispatchThreads:threadsPerThreadgroup:", v18, &v16);
  objc_msgSend(v8, "endEncoding");

  -[MPSImageGaussianBlur encodeToCommandBuffer:inPlaceTexture:fallbackCopyAllocator:](self->_gaussianBlur, "encodeToCommandBuffer:inPlaceTexture:fallbackCopyAllocator:", v7, &self->_constraintsTexture, 0);
  objc_msgSend(v7, "computeCommandEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setComputePipelineState:", self->_initConstraintsPart2);
  objc_msgSend(v12, "setTexture:atIndex:", self->_guideTexture, 0);
  objc_msgSend(v12, "setTexture:atIndex:", self->_segmentationMinTexture, 1);
  objc_msgSend(v12, "setTexture:atIndex:", self->_segmentationMaxTexture, 2);
  objc_msgSend(v12, "setTexture:atIndex:", self->_constraintsTexture, 3);
  v13 = -[MTLTexture width](self->_constraintsTexture, "width");
  v14 = -[MTLTexture height](*p_constraintsTexture, "height");
  v15[0] = v13;
  v15[1] = v14;
  v15[2] = 1;
  v16 = xmmword_1C9322A40;
  v17 = 1;
  objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", v15, &v16);
  objc_msgSend(v12, "endEncoding");

}

- (void)diffusion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  __int128 v25;
  uint64_t v26;
  _QWORD v27[3];

  v4 = a3;
  objc_msgSend(v4, "computeCommandEncoder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setComputePipelineState:", self->_initDiffusion);
  objc_msgSend(v5, "setTexture:atIndex:", self->_guideTexture, 0);
  objc_msgSend(v5, "setTexture:atIndex:", self->_segmentationTexture, 1);
  objc_msgSend(v5, "setTexture:atIndex:", self->_constraintsTexture, 2);
  objc_msgSend(v5, "setTexture:atIndex:", self->_diffusionTexture, 3);
  v6 = -[MTLTexture width](self->_diffusionTexture, "width");
  v7 = -[MTLTexture height](self->_diffusionTexture, "height");
  v27[0] = v6;
  v27[1] = v7;
  v27[2] = 1;
  v25 = xmmword_1C9322A40;
  v26 = 1;
  objc_msgSend(v5, "dispatchThreads:threadsPerThreadgroup:", v27, &v25);
  objc_msgSend(v5, "endEncoding");

  if (self->_refinementSteps)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v4, "computeCommandEncoder");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setComputePipelineState:", self->_computeUpsamplingCoefficients);
      objc_msgSend(v9, "setTexture:atIndex:", self->_guideTexture, 0);
      objc_msgSend(v9, "setTexture:atIndex:", self->_diffusionTexture, 1);
      objc_msgSend(v9, "setTexture:atIndex:", self->_coeffXTexture, 2);
      objc_msgSend(v9, "setTexture:atIndex:", self->_coeffYTexture, 3);
      objc_msgSend(v9, "setTexture:atIndex:", self->_coeffZTexture, 4);
      v10 = -[MTLTexture width](self->_coeffXTexture, "width");
      v11 = -[MTLTexture height](self->_coeffXTexture, "height");
      v24[0] = v10;
      v24[1] = v11;
      v24[2] = 1;
      v25 = xmmword_1C9322A40;
      v26 = 1;
      objc_msgSend(v9, "dispatchThreads:threadsPerThreadgroup:", v24, &v25);
      objc_msgSend(v9, "endEncoding");

      objc_msgSend(v4, "computeCommandEncoder");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setComputePipelineState:", self->_averageUpsamplingCoefficients);
      objc_msgSend(v12, "setTexture:atIndex:", self->_coeffXTexture, 0);
      objc_msgSend(v12, "setTexture:atIndex:", self->_coeffYTexture, 1);
      objc_msgSend(v12, "setTexture:atIndex:", self->_coeffZTexture, 2);
      objc_msgSend(v12, "setTexture:atIndex:", self->_coeffXFilteredTexture, 3);
      objc_msgSend(v12, "setTexture:atIndex:", self->_coeffYFilteredTexture, 4);
      objc_msgSend(v12, "setTexture:atIndex:", self->_coeffZFilteredTexture, 5);
      v13 = -[MTLTexture width](self->_coeffXTexture, "width");
      v14 = -[MTLTexture height](self->_coeffXTexture, "height");
      v23[0] = v13;
      v23[1] = v14;
      v23[2] = 1;
      v25 = xmmword_1C9322A40;
      v26 = 1;
      objc_msgSend(v12, "dispatchThreads:threadsPerThreadgroup:", v23, &v25);
      objc_msgSend(v12, "endEncoding");

      objc_msgSend(v4, "computeCommandEncoder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setComputePipelineState:", self->_applyUpsamplingCoefficients);
      objc_msgSend(v15, "setTexture:atIndex:", self->_guideTexture, 0);
      objc_msgSend(v15, "setTexture:atIndex:", self->_coeffXFilteredTexture, 1);
      objc_msgSend(v15, "setTexture:atIndex:", self->_coeffYFilteredTexture, 2);
      objc_msgSend(v15, "setTexture:atIndex:", self->_coeffZFilteredTexture, 3);
      objc_msgSend(v15, "setTexture:atIndex:", self->_diffusionTexture, 4);
      v16 = -[MTLTexture width](self->_diffusionTexture, "width");
      v17 = -[MTLTexture height](self->_diffusionTexture, "height");
      v22[0] = v16;
      v22[1] = v17;
      v22[2] = 1;
      v25 = xmmword_1C9322A40;
      v26 = 1;
      objc_msgSend(v15, "dispatchThreads:threadsPerThreadgroup:", v22, &v25);
      objc_msgSend(v15, "endEncoding");

      objc_msgSend(v4, "computeCommandEncoder");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setComputePipelineState:", self->_constrainDiffusion);
      objc_msgSend(v18, "setTexture:atIndex:", self->_constraintsTexture, 0);
      objc_msgSend(v18, "setTexture:atIndex:", self->_diffusionTexture, 1);
      v19 = -[MTLTexture width](self->_diffusionTexture, "width");
      v20 = -[MTLTexture height](self->_diffusionTexture, "height");
      v21[0] = v19;
      v21[1] = v20;
      v21[2] = 1;
      v25 = xmmword_1C9322A40;
      v26 = 1;
      objc_msgSend(v18, "dispatchThreads:threadsPerThreadgroup:", v21, &v25);
      objc_msgSend(v18, "endEncoding");

      ++v8;
    }
    while (self->_refinementSteps > v8);
  }

}

- (unint64_t)refinementWidth
{
  return -[MTLTexture width](self->_guideTexture, "width");
}

- (unint64_t)refinementHeight
{
  return -[MTLTexture height](self->_guideTexture, "height");
}

- (id)guideLowRes
{
  return self->_guideTexture;
}

- (id)segmentationLowRes
{
  return self->_segmentationTexture;
}

- (id)diffusionTexture
{
  return self->_diffusionTexture;
}

- (id)coeffXTexture
{
  return self->_coeffXTexture;
}

- (id)coeffYTexture
{
  return self->_coeffYTexture;
}

- (id)coeffZTexture
{
  return self->_coeffZTexture;
}

- (id)segmentationMin
{
  return self->_segmentationMinTexture;
}

- (id)segmentationMax
{
  return self->_segmentationMaxTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_gaussianBlur, 0);
  objc_storeStrong((id *)&self->_maxFilter, 0);
  objc_storeStrong((id *)&self->_minFilter, 0);
  objc_storeStrong((id *)&self->_coeffZFilteredTexture, 0);
  objc_storeStrong((id *)&self->_coeffYFilteredTexture, 0);
  objc_storeStrong((id *)&self->_coeffXFilteredTexture, 0);
  objc_storeStrong((id *)&self->_coeffZTexture, 0);
  objc_storeStrong((id *)&self->_coeffYTexture, 0);
  objc_storeStrong((id *)&self->_coeffXTexture, 0);
  objc_storeStrong((id *)&self->_segmentationMaxTexture, 0);
  objc_storeStrong((id *)&self->_segmentationMinTexture, 0);
  objc_storeStrong((id *)&self->_segmentationTexture, 0);
  objc_storeStrong((id *)&self->_constraintsTexture, 0);
  objc_storeStrong((id *)&self->_diffusionTexture, 0);
  objc_storeStrong((id *)&self->_guideTexture, 0);
  objc_storeStrong((id *)&self->_applyUpsamplingCoefficients, 0);
  objc_storeStrong((id *)&self->_averageUpsamplingCoefficients, 0);
  objc_storeStrong((id *)&self->_computeUpsamplingCoefficients, 0);
  objc_storeStrong((id *)&self->_constrainDiffusion, 0);
  objc_storeStrong((id *)&self->_initDiffusion, 0);
  objc_storeStrong((id *)&self->_initConstraintsPart2, 0);
  objc_storeStrong((id *)&self->_initConstraintsPart1, 0);
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)initWithMetalContext:(uint64_t)a3 refinementWidth:(uint64_t)a4 refinementHeight:(uint64_t)a5 refinementSteps:(uint64_t)a6 minFilterKernelWidth:(uint64_t)a7 minFilterKernelHeight:(uint64_t)a8 maxFilterKernelWidth:maxFilterKernelHeight:gaussianBlurSigma:.cold.19(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C9281000, a1, a3, "Assertion failed %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
