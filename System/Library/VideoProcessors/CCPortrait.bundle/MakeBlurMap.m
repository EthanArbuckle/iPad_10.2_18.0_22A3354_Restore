@implementation MakeBlurMap

- (int)setOptions:(const void *)a3 isPrewarm:(BOOL)a4
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  if (!a3)
    sub_24B6EDDB0();
  v4 = *((_OWORD *)a3 + 1);
  *(_OWORD *)&self->_disparity_refinement_config_params.radius = *(_OWORD *)a3;
  *(_OWORD *)&self->_disparity_refinement_config_params.outerSamplingRadius = v4;
  v5 = *((_OWORD *)a3 + 2);
  v6 = *((_OWORD *)a3 + 3);
  v7 = *((_OWORD *)a3 + 4);
  self->_disparity_refinement_config_params.fgBgDilationSize = *((_DWORD *)a3 + 20);
  *(_OWORD *)&self->_disparity_refinement_config_params.aaLumaSigma = v6;
  *(_OWORD *)&self->_disparity_refinement_config_params.fgBlurScale = v7;
  *(_OWORD *)&self->_disparity_refinement_config_params.segmentationSigma = v5;
  return objc_msgSend_loadShaders(self, a2, (uint64_t)a3, a4);
}

+ (unint64_t)maxBlurMapSize
{
  if (qword_2544D9D10 != -1)
    dispatch_once(&qword_2544D9D10, &unk_251C8F388);
  return qword_2579AEA40;
}

+ (CGSize)blurMapSize:(CGSize)a3
{
  uint64_t v3;
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = fmin((double)(unint64_t)objc_msgSend_maxBlurMapSize(MakeBlurMap, a2, v3)/ (double)(unint64_t)fmax(a3.height, a3.width), 0.5);
  v7 = ceil(v6 * width + -0.001);
  v8 = ceil(v6 * height + -0.001);
  result.height = v8;
  result.width = v7;
  return result;
}

- (MakeBlurMap)init
{
  NSObject *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  uni_logger_api();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = objc_retainAutorelease((id)objc_opt_class());
    v6 = 136446466;
    v7 = "-[MakeBlurMap init]";
    v8 = 2080;
    v9 = objc_msgSend_UTF8String(v3, v4, v5);
    _os_log_error_impl(&dword_24B6B5000, v2, OS_LOG_TYPE_ERROR, "%{public}s invalid initialization method for %s", (uint8_t *)&v6, 0x16u);
  }

  abort();
}

- (MakeBlurMap)initWithMetalQueue:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  MakeBlurMap *v10;
  MakeBlurMap *v11;
  void **p_mtlQueue;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  UniLibrary *v18;
  const char *v19;
  uint64_t v20;
  UniLibrary *library;
  UniKernel *v22;
  const char *v23;
  uint64_t v24;
  UniKernel *slmMinMax;
  const char *v26;
  UniKernel *v27;
  const char *v28;
  UniKernel *v29;
  const char *v30;
  uint64_t v31;
  UniKernel *slmCalc;
  const char *v33;
  UniKernel *v34;
  const char *v35;
  UniKernel *v36;
  const char *v37;
  uint64_t v38;
  UniKernel *slmCalcEyes;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  UniKernel *v45;
  const char *v46;
  uint64_t v47;
  UniKernel *passthrough;
  const char *v49;
  UniKernel *v50;
  const char *v51;
  UniKernel *v52;
  const char *v53;
  uint64_t v54;
  UniKernel *extractPositiveBlurValues;
  const char *v56;
  UniKernel *v57;
  UniKernel *v58;
  const char *v59;
  uint64_t v60;
  UniKernel *insertPositiveBlurValues;
  const char *v62;
  UniKernel *v63;
  UniKernel *v64;
  const char *v65;
  uint64_t v66;
  UniKernel *thresholdHard;
  const char *v68;
  UniKernel *v69;
  const char *v70;
  UniGaussianBlur *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  UniGaussianBlur *gaussian;
  UniKernel *v78;
  const char *v79;
  uint64_t v80;
  UniKernel *mapLinear;
  const char *v82;
  UniKernel *v83;
  const char *v84;
  UniKernel *v85;
  const char *v86;
  uint64_t v87;
  UniKernel *mapLinearNoSecondary;
  const char *v89;
  UniKernel *v90;
  const char *v91;
  UniKernel *v92;
  const char *v93;
  uint64_t v94;
  UniKernel *eyeProtectionFace;
  UniKernel *v96;
  const char *v97;
  uint64_t v98;
  UniKernel *eyeProtectionGlassesFace;
  const char *v100;
  const char *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  UniKernel *v107;
  const char *v108;
  uint64_t v109;
  UniKernel *modifyBlurmap;
  const char *v111;
  UniKernel *v112;
  const char *v113;
  UniKernel *v114;
  const char *v115;
  uint64_t v116;
  UniKernel *modifyBlurmapGlasses;
  const char *v118;
  UniKernel *v119;
  const char *v120;
  UniKernel *v121;
  const char *v122;
  uint64_t v123;
  UniKernel *segmentationFusion;
  const char *v125;
  UniKernel *v126;
  const char *v127;
  UniKernel *v128;
  const char *v129;
  uint64_t v130;
  UniKernel *faceMaskCalc;
  const char *v132;
  UniKernel *v133;
  const char *v134;
  UniKernel *v135;
  const char *v136;
  uint64_t v137;
  UniKernel *faceMaskApply;
  const char *v139;
  UniKernel *v140;
  const char *v141;
  UniKernel *v142;
  const char *v143;
  uint64_t v144;
  UniKernel *sparseRenderingPreprocessingScaled;
  const char *v146;
  UniKernel *v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  UniGuidedFilter *v151;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  UniKernel *guidedFilter;
  UniGuidedFilter *v158;
  UniKernel *v159;
  UniKernel *v160;
  const char *v161;
  uint64_t v162;
  UniKernel *fpDisparityRefinementPreprocessing;
  UniKernel *v164;
  const char *v165;
  uint64_t v166;
  UniKernel *crispHairBlurX;
  const char *v168;
  UniKernel *v169;
  const char *v170;
  UniKernel *v171;
  const char *v172;
  uint64_t v173;
  UniKernel *crispHairBlurY;
  const char *v175;
  UniKernel *v176;
  const char *v177;
  UniKernel *v178;
  const char *v179;
  uint64_t v180;
  UniKernel *crispHairBlurSingleX;
  const char *v182;
  UniKernel *v183;
  const char *v184;
  UniKernel *v185;
  const char *v186;
  uint64_t v187;
  UniKernel *crispHairBlurSingleY;
  const char *v189;
  UniKernel *v190;
  const char *v191;
  UniKernel *v192;
  const char *v193;
  uint64_t v194;
  UniKernel *crispHairExpandedDisparityX;
  const char *v196;
  UniKernel *v197;
  const char *v198;
  UniKernel *v199;
  const char *v200;
  uint64_t v201;
  UniKernel *crispHairExpandedDisparityY;
  const char *v203;
  UniKernel *v204;
  const char *v205;
  UniKernel *v206;
  const char *v207;
  uint64_t v208;
  UniKernel *crispHairExpandedDisparitySingleY;
  const char *v210;
  UniKernel *v211;
  const char *v212;
  UniKernel *v213;
  const char *v214;
  uint64_t v215;
  UniKernel *crispHairDownsamplingSingle;
  const char *v217;
  UniKernel *v218;
  const char *v219;
  UniKernel *v220;
  const char *v221;
  uint64_t v222;
  UniKernel *blendBackgroundBlur;
  const char *v224;
  UniKernel *v225;
  UniKernel *v226;
  const char *v227;
  uint64_t v228;
  UniKernel *thresholdedSobel;
  const char *v230;
  UniKernel *v231;
  const char *v232;
  UniMorphology *v233;
  const char *v234;
  uint64_t v235;
  UniKernel *morphology;
  const char *v237;
  UniKernel *v238;
  UniScaleImage *v239;
  const char *v240;
  objc_super v242;

  v5 = a3;
  v8 = v5;
  if (v5)
  {
    objc_msgSend_device(v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v242.receiver = self;
  v242.super_class = (Class)MakeBlurMap;
  v10 = -[MakeBlurMap init](&v242, sel_init);
  if (!v10)
    sub_24B6EDDD8();
  v11 = v10;
  p_mtlQueue = (void **)&v10->_mtlQueue;
  objc_storeStrong((id *)&v10->_mtlQueue, a3);
  v13 = (void *)MEMORY[0x24BDD1488];
  v14 = objc_opt_class();
  objc_msgSend_bundleForClass_(v13, v15, v14);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    sub_24B6EDE00();
  v17 = (void *)v16;
  v18 = [UniLibrary alloc];
  v20 = objc_msgSend_initWithDevice_metalOnly_(v18, v19, (uint64_t)v9, v8 != 0);
  library = v11->_library;
  v11->_library = (UniLibrary *)v20;

  if (!v11->_library)
    sub_24B6EDE28();
  v22 = [UniKernel alloc];
  v24 = objc_msgSend_initWithName_library_(v22, v23, (uint64_t)CFSTR("slm_shiftmap_calcminmax"), v11->_library);
  slmMinMax = v11->_slmMinMax;
  v11->_slmMinMax = (UniKernel *)v24;

  v27 = v11->_slmMinMax;
  if (!v27)
    sub_24B6EDE50();
  objc_msgSend_setPreferredOutputFormat_(v27, v26, (uint64_t)&unk_251C9CBB8);
  objc_msgSend_setRoiCallback_(v11->_slmMinMax, v28, (uint64_t)&unk_251C8F3A8);
  v29 = [UniKernel alloc];
  v31 = objc_msgSend_initWithName_library_(v29, v30, (uint64_t)CFSTR("slm_calc"), v11->_library);
  slmCalc = v11->_slmCalc;
  v11->_slmCalc = (UniKernel *)v31;

  v34 = v11->_slmCalc;
  if (!v34)
    sub_24B6EDE78();
  objc_msgSend_setPreferredOutputFormat_(v34, v33, (uint64_t)&unk_251C9CBB8);
  objc_msgSend_setRoiCallback_(v11->_slmCalc, v35, (uint64_t)&unk_251C8F3C8);
  v36 = [UniKernel alloc];
  v38 = objc_msgSend_initWithName_library_(v36, v37, (uint64_t)CFSTR("slm_calc_eyes"), v11->_library);
  slmCalcEyes = v11->_slmCalcEyes;
  v11->_slmCalcEyes = (UniKernel *)v38;

  if (!v11->_slmCalcEyes)
    sub_24B6EDEA0();
  objc_msgSend_preferredOutputFormat(v11->_slmCalc, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreferredOutputFormat_(v11->_slmCalcEyes, v43, (uint64_t)v42);

  objc_msgSend_setRoiCallback_(v11->_slmCalcEyes, v44, (uint64_t)&unk_251C8F3E8);
  v11->_disparity_refinement_config_params.radius = 3;
  *(_OWORD *)&v11->_disparity_refinement_config_params.weightScaling = xmmword_24B6F5640;
  v11->_disparity_refinement_config_params.nSamples = 20;
  *(_OWORD *)&v11->_disparity_refinement_config_params.lumaSigma = xmmword_24B6F5650;
  *(_OWORD *)&v11->_disparity_refinement_config_params.accumulatedWeightT0 = xmmword_24B6F5660;
  *(_QWORD *)&v11->_disparity_refinement_config_params.aaSegmentationSigma = 0x3FB33333447A0000;
  *(_QWORD *)&v11->_disparity_refinement_config_params.fgBlurScale = 0;
  *(_QWORD *)&v11->_disparity_refinement_config_params.fgDeadZoneOffset = 0;
  v11->_disparity_refinement_config_params.fgBgDilationSize = 0;
  v45 = [UniKernel alloc];
  v47 = objc_msgSend_initWithName_library_(v45, v46, (uint64_t)CFSTR("disparity_refinement_slm_passthrough"), v11->_library);
  passthrough = v11->_passthrough;
  v11->_passthrough = (UniKernel *)v47;

  v50 = v11->_passthrough;
  if (!v50)
    sub_24B6EDEC8();
  objc_msgSend_setPreferredOutputFormat_(v50, v49, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(v11->_passthrough, v51, (uint64_t)&unk_251C8F408);
  v52 = [UniKernel alloc];
  v54 = objc_msgSend_initWithName_library_(v52, v53, (uint64_t)CFSTR("disparity_refinement_extract_positive_blur_values"), v11->_library);
  extractPositiveBlurValues = v11->_extractPositiveBlurValues;
  v11->_extractPositiveBlurValues = (UniKernel *)v54;

  v57 = v11->_extractPositiveBlurValues;
  if (!v57)
    sub_24B6EDEF0();
  objc_msgSend_setPreferredOutputFormat_(v57, v56, (uint64_t)&unk_251C9CBD0);
  v58 = [UniKernel alloc];
  v60 = objc_msgSend_initWithName_library_(v58, v59, (uint64_t)CFSTR("disparity_refinement_insert_positive_blur_values"), v11->_library);
  insertPositiveBlurValues = v11->_insertPositiveBlurValues;
  v11->_insertPositiveBlurValues = (UniKernel *)v60;

  v63 = v11->_insertPositiveBlurValues;
  if (!v63)
    sub_24B6EDF18();
  objc_msgSend_setPreferredOutputFormat_(v63, v62, (uint64_t)&unk_251C9CBE8);
  v64 = [UniKernel alloc];
  v66 = objc_msgSend_initWithName_library_(v64, v65, (uint64_t)CFSTR("threshold_hard_apply"), v11->_library);
  thresholdHard = v11->_thresholdHard;
  v11->_thresholdHard = (UniKernel *)v66;

  v69 = v11->_thresholdHard;
  if (!v69)
    sub_24B6EDF40();
  objc_msgSend_setPreferredOutputFormat_(v69, v68, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(v11->_thresholdHard, v70, (uint64_t)&unk_251C8F428);
  v71 = [UniGaussianBlur alloc];
  objc_msgSend_device(v11->_mtlQueue, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = objc_msgSend_initWithDevice_(v71, v75, (uint64_t)v74);
  gaussian = v11->_gaussian;
  v11->_gaussian = (UniGaussianBlur *)v76;

  if (!v11->_gaussian)
    sub_24B6EDF68();
  v78 = [UniKernel alloc];
  v80 = objc_msgSend_initWithName_library_(v78, v79, (uint64_t)CFSTR("map_linear_apply"), v11->_library);
  mapLinear = v11->_mapLinear;
  v11->_mapLinear = (UniKernel *)v80;

  v83 = v11->_mapLinear;
  if (!v83)
    sub_24B6EDF90();
  objc_msgSend_setPreferredOutputFormat_(v83, v82, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(v11->_mapLinear, v84, (uint64_t)&unk_251C8F448);
  v85 = [UniKernel alloc];
  v87 = objc_msgSend_initWithName_library_(v85, v86, (uint64_t)CFSTR("map_linear_no_secondary_tex_apply"), v11->_library);
  mapLinearNoSecondary = v11->_mapLinearNoSecondary;
  v11->_mapLinearNoSecondary = (UniKernel *)v87;

  v90 = v11->_mapLinearNoSecondary;
  if (!v90)
    sub_24B6EDFB8();
  objc_msgSend_setPreferredOutputFormat_(v90, v89, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(v11->_mapLinearNoSecondary, v91, (uint64_t)&unk_251C8F468);
  if (qword_2544D9D08 != -1)
    dispatch_once(&qword_2544D9D08, &unk_251C8F488);
  v92 = [UniKernel alloc];
  v94 = objc_msgSend_initWithName_library_(v92, v93, (uint64_t)CFSTR("eye_protection_face_calc"), v11->_library);
  eyeProtectionFace = v11->_eyeProtectionFace;
  v11->_eyeProtectionFace = (UniKernel *)v94;

  if (!v11->_eyeProtectionFace)
    sub_24B6EDFE0();
  v96 = [UniKernel alloc];
  v98 = objc_msgSend_initWithName_library_(v96, v97, (uint64_t)CFSTR("eye_protection_glasses_face_calc"), v11->_library);
  eyeProtectionGlassesFace = v11->_eyeProtectionGlassesFace;
  v11->_eyeProtectionGlassesFace = (UniKernel *)v98;

  if (!v11->_eyeProtectionGlassesFace)
    sub_24B6EE008();
  objc_msgSend_setPreferredOutputFormat_(v11->_eyeProtectionFace, v100, (uint64_t)&unk_251C9CBB8);
  objc_msgSend_setPreferredOutputFormat_(v11->_eyeProtectionGlassesFace, v101, (uint64_t)&unk_251C9CBB8);
  objc_msgSend_setRoiCallback_(v11->_eyeProtectionFace, v102, (uint64_t)&unk_251C8F4A8);
  objc_msgSend_roiCallback(v11->_eyeProtectionFace, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRoiCallback_(v11->_eyeProtectionGlassesFace, v106, (uint64_t)v105);

  v107 = [UniKernel alloc];
  v109 = objc_msgSend_initWithName_library_(v107, v108, (uint64_t)CFSTR("modify_blurmap_apply"), v11->_library);
  modifyBlurmap = v11->_modifyBlurmap;
  v11->_modifyBlurmap = (UniKernel *)v109;

  v112 = v11->_modifyBlurmap;
  if (!v112)
    sub_24B6EE030();
  objc_msgSend_setPreferredOutputFormat_(v112, v111, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(v11->_modifyBlurmap, v113, (uint64_t)&unk_251C8F4C8);
  v114 = [UniKernel alloc];
  v116 = objc_msgSend_initWithName_library_(v114, v115, (uint64_t)CFSTR("modify_blurmap_glasses_apply"), v11->_library);
  modifyBlurmapGlasses = v11->_modifyBlurmapGlasses;
  v11->_modifyBlurmapGlasses = (UniKernel *)v116;

  v119 = v11->_modifyBlurmapGlasses;
  if (!v119)
    sub_24B6EE058();
  objc_msgSend_setPreferredOutputFormat_(v119, v118, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(v11->_modifyBlurmapGlasses, v120, (uint64_t)&unk_251C8F4E8);
  v121 = [UniKernel alloc];
  v123 = objc_msgSend_initWithName_library_(v121, v122, (uint64_t)CFSTR("segmentation_fusion_apply"), v11->_library);
  segmentationFusion = v11->_segmentationFusion;
  v11->_segmentationFusion = (UniKernel *)v123;

  v126 = v11->_segmentationFusion;
  if (!v126)
    sub_24B6EE080();
  objc_msgSend_setPreferredOutputFormat_(v126, v125, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(v11->_segmentationFusion, v127, (uint64_t)&unk_251C8F508);
  v128 = [UniKernel alloc];
  v130 = objc_msgSend_initWithName_library_(v128, v129, (uint64_t)CFSTR("facemask_calc"), v11->_library);
  faceMaskCalc = v11->_faceMaskCalc;
  v11->_faceMaskCalc = (UniKernel *)v130;

  v133 = v11->_faceMaskCalc;
  if (!v133)
    sub_24B6EE0A8();
  objc_msgSend_setPreferredOutputFormat_(v133, v132, (uint64_t)&unk_251C9CBB8);
  objc_msgSend_setRoiCallback_(v11->_faceMaskCalc, v134, (uint64_t)&unk_251C8F528);
  v135 = [UniKernel alloc];
  v137 = objc_msgSend_initWithName_library_(v135, v136, (uint64_t)CFSTR("facemask_apply"), v11->_library);
  faceMaskApply = v11->_faceMaskApply;
  v11->_faceMaskApply = (UniKernel *)v137;

  v140 = v11->_faceMaskApply;
  if (!v140)
    sub_24B6EE0D0();
  objc_msgSend_setPreferredOutputFormat_(v140, v139, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(v11->_faceMaskApply, v141, (uint64_t)&unk_251C8F548);
  v142 = [UniKernel alloc];
  v144 = objc_msgSend_initWithName_library_(v142, v143, (uint64_t)CFSTR("sparserendering_preprocess_scaled"), v11->_library);
  sparseRenderingPreprocessingScaled = v11->_sparseRenderingPreprocessingScaled;
  v11->_sparseRenderingPreprocessingScaled = (UniKernel *)v144;

  v147 = v11->_sparseRenderingPreprocessingScaled;
  if (!v147)
    sub_24B6EE0F8();
  objc_msgSend_setRoiCallback_(v147, v146, (uint64_t)&unk_251C8F568);
  objc_msgSend_device(*p_mtlQueue, v148, v149);
  v150 = (void *)objc_claimAutoreleasedReturnValue();

  if (v150)
  {
    v151 = [UniGuidedFilter alloc];
    objc_msgSend_device(v11->_mtlQueue, v152, v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = objc_msgSend_initWithDevice_(v151, v155, (uint64_t)v154);
    guidedFilter = v11->_guidedFilter;
    v11->_guidedFilter = (UniKernel *)v156;

    if (!v11->_guidedFilter)
      sub_24B6EE328();
  }
  else
  {
    v158 = objc_alloc_init(UniGuidedFilter);
    v159 = v11->_guidedFilter;
    v11->_guidedFilter = &v158->super;

    if (!v11->_guidedFilter)
      sub_24B6EE120();
  }
  v160 = [UniKernel alloc];
  v162 = objc_msgSend_initWithName_library_(v160, v161, (uint64_t)CFSTR("fpDisparityRefinementPreprocessing"), v11->_library);
  fpDisparityRefinementPreprocessing = v11->_fpDisparityRefinementPreprocessing;
  v11->_fpDisparityRefinementPreprocessing = (UniKernel *)v162;

  if (!v11->_fpDisparityRefinementPreprocessing)
    sub_24B6EE148();
  v164 = [UniKernel alloc];
  v166 = objc_msgSend_initWithName_library_(v164, v165, (uint64_t)CFSTR("crispHair_BlurX"), v11->_library);
  crispHairBlurX = v11->_crispHairBlurX;
  v11->_crispHairBlurX = (UniKernel *)v166;

  v169 = v11->_crispHairBlurX;
  if (!v169)
    sub_24B6EE170();
  objc_msgSend_setPreferredOutputFormat_(v169, v168, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(v11->_crispHairBlurX, v170, (uint64_t)&unk_251C8F588);
  v171 = [UniKernel alloc];
  v173 = objc_msgSend_initWithName_library_(v171, v172, (uint64_t)CFSTR("crispHair_BlurY"), v11->_library);
  crispHairBlurY = v11->_crispHairBlurY;
  v11->_crispHairBlurY = (UniKernel *)v173;

  v176 = v11->_crispHairBlurY;
  if (!v176)
    sub_24B6EE198();
  objc_msgSend_setPreferredOutputFormat_(v176, v175, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(v11->_crispHairBlurY, v177, (uint64_t)&unk_251C8F5A8);
  v178 = [UniKernel alloc];
  v180 = objc_msgSend_initWithName_library_(v178, v179, (uint64_t)CFSTR("crispHair_BlurSingleX"), v11->_library);
  crispHairBlurSingleX = v11->_crispHairBlurSingleX;
  v11->_crispHairBlurSingleX = (UniKernel *)v180;

  v183 = v11->_crispHairBlurSingleX;
  if (!v183)
    sub_24B6EE1C0();
  objc_msgSend_setPreferredOutputFormat_(v183, v182, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(v11->_crispHairBlurSingleX, v184, (uint64_t)&unk_251C8F5C8);
  v185 = [UniKernel alloc];
  v187 = objc_msgSend_initWithName_library_(v185, v186, (uint64_t)CFSTR("crispHair_BlurSingleY"), v11->_library);
  crispHairBlurSingleY = v11->_crispHairBlurSingleY;
  v11->_crispHairBlurSingleY = (UniKernel *)v187;

  v190 = v11->_crispHairBlurSingleY;
  if (!v190)
    sub_24B6EE1E8();
  objc_msgSend_setPreferredOutputFormat_(v190, v189, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(v11->_crispHairBlurSingleY, v191, (uint64_t)&unk_251C8F5E8);
  v192 = [UniKernel alloc];
  v194 = objc_msgSend_initWithName_library_(v192, v193, (uint64_t)CFSTR("crispHair_expandedDispX"), v11->_library);
  crispHairExpandedDisparityX = v11->_crispHairExpandedDisparityX;
  v11->_crispHairExpandedDisparityX = (UniKernel *)v194;

  v197 = v11->_crispHairExpandedDisparityX;
  if (!v197)
    sub_24B6EE210();
  objc_msgSend_setPreferredOutputFormat_(v197, v196, (uint64_t)&unk_251C9CC00);
  objc_msgSend_setRoiCallback_(v11->_crispHairExpandedDisparityX, v198, (uint64_t)&unk_251C8F608);
  v199 = [UniKernel alloc];
  v201 = objc_msgSend_initWithName_library_(v199, v200, (uint64_t)CFSTR("crispHair_expandedDispY"), v11->_library);
  crispHairExpandedDisparityY = v11->_crispHairExpandedDisparityY;
  v11->_crispHairExpandedDisparityY = (UniKernel *)v201;

  v204 = v11->_crispHairExpandedDisparityY;
  if (!v204)
    sub_24B6EE238();
  objc_msgSend_setPreferredOutputFormat_(v204, v203, (uint64_t)&unk_251C9CC00);
  objc_msgSend_setRoiCallback_(v11->_crispHairExpandedDisparityY, v205, (uint64_t)&unk_251C8F628);
  v206 = [UniKernel alloc];
  v208 = objc_msgSend_initWithName_library_(v206, v207, (uint64_t)CFSTR("crispHair_expandedDispSingleY"), v11->_library);
  crispHairExpandedDisparitySingleY = v11->_crispHairExpandedDisparitySingleY;
  v11->_crispHairExpandedDisparitySingleY = (UniKernel *)v208;

  v211 = v11->_crispHairExpandedDisparitySingleY;
  if (!v211)
    sub_24B6EE260();
  objc_msgSend_setPreferredOutputFormat_(v211, v210, (uint64_t)&unk_251C9CC00);
  objc_msgSend_setRoiCallback_(v11->_crispHairExpandedDisparitySingleY, v212, (uint64_t)&unk_251C8F648);
  v213 = [UniKernel alloc];
  v215 = objc_msgSend_initWithName_library_(v213, v214, (uint64_t)CFSTR("crispHairDownsamplingSingle"), v11->_library);
  crispHairDownsamplingSingle = v11->_crispHairDownsamplingSingle;
  v11->_crispHairDownsamplingSingle = (UniKernel *)v215;

  v218 = v11->_crispHairDownsamplingSingle;
  if (!v218)
    sub_24B6EE288();
  objc_msgSend_setPreferredOutputFormat_(v218, v217, (uint64_t)&unk_251C9CC00);
  objc_msgSend_setRoiCallback_(v11->_crispHairDownsamplingSingle, v219, (uint64_t)&unk_251C8F668);
  v220 = [UniKernel alloc];
  v222 = objc_msgSend_initWithName_library_(v220, v221, (uint64_t)CFSTR("blendBackgroundBlur"), v11->_library);
  blendBackgroundBlur = v11->_blendBackgroundBlur;
  v11->_blendBackgroundBlur = (UniKernel *)v222;

  v225 = v11->_blendBackgroundBlur;
  if (!v225)
    sub_24B6EE2B0();
  objc_msgSend_setPreferredOutputFormat_(v225, v224, (uint64_t)&unk_251C9CC18);
  v226 = [UniKernel alloc];
  v228 = objc_msgSend_initWithName_library_(v226, v227, (uint64_t)CFSTR("sobel_yChannel_Thresholded"), v11->_library);
  thresholdedSobel = v11->_thresholdedSobel;
  v11->_thresholdedSobel = (UniKernel *)v228;

  v231 = v11->_thresholdedSobel;
  if (!v231)
    sub_24B6EE2D8();
  objc_msgSend_setRoiCallback_(v231, v230, (uint64_t)&unk_251C8F688);
  objc_msgSend_setPreferredOutputFormat_(v11->_thresholdedSobel, v232, (uint64_t)&unk_251C9CC18);
  v233 = [UniMorphology alloc];
  v235 = objc_msgSend_initWithDevice_(v233, v234, (uint64_t)v9);
  morphology = v11->_morphology;
  v11->_morphology = (UniKernel *)v235;

  v238 = v11->_morphology;
  if (!v238)
    sub_24B6EE300();
  objc_msgSend_setPreferredOutputFormat_(v238, v237, (uint64_t)&unk_251C9CC18);
  v239 = [UniScaleImage alloc];

  return v11;
}

- (int)allocateResourcesForShiftMapWidth:(unint64_t)a3 shiftMapHeight:(unint64_t)a4
{
  void *v5;
  UniImage *v6;
  UniImage *minMaxTex;
  const char *v8;
  uint64_t v9;
  void *v10;
  UniImage *v11;
  UniImage *outputParamsImage;
  const char *v13;
  uint64_t v14;
  void *v15;
  UniImage *v16;
  UniImage *faceParamsTex;
  const char *v18;
  uint64_t v19;
  void *v20;
  UniImage *v21;
  UniImage *eyeProtectionFacesTex;
  const char *v23;
  uint64_t v24;
  void *v25;
  UniImage *v26;
  UniImage *faceMaskOutputParamsTex;

  objc_msgSend_device(self->_mtlQueue, a2, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6C3F48(1, v5);
  v6 = (UniImage *)objc_claimAutoreleasedReturnValue();
  minMaxTex = self->_minMaxTex;
  self->_minMaxTex = v6;

  if (!self->_minMaxTex)
    sub_24B6EE7F0();
  objc_msgSend_device(self->_mtlQueue, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6C3F48(1, v10);
  v11 = (UniImage *)objc_claimAutoreleasedReturnValue();
  outputParamsImage = self->_outputParamsImage;
  self->_outputParamsImage = v11;

  if (!self->_outputParamsImage)
    sub_24B6EE818();
  objc_msgSend_device(self->_mtlQueue, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6C3F48(9, v15);
  v16 = (UniImage *)objc_claimAutoreleasedReturnValue();
  faceParamsTex = self->_faceParamsTex;
  self->_faceParamsTex = v16;

  if (!self->_faceParamsTex)
    sub_24B6EE840();
  objc_msgSend_device(self->_mtlQueue, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6C3F48(8, v20);
  v21 = (UniImage *)objc_claimAutoreleasedReturnValue();
  eyeProtectionFacesTex = self->_eyeProtectionFacesTex;
  self->_eyeProtectionFacesTex = v21;

  if (!self->_eyeProtectionFacesTex)
    sub_24B6EE868();
  objc_msgSend_device(self->_mtlQueue, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  sub_24B6C3F48(9, v25);
  v26 = (UniImage *)objc_claimAutoreleasedReturnValue();
  faceMaskOutputParamsTex = self->_faceMaskOutputParamsTex;
  self->_faceMaskOutputParamsTex = v26;

  if (!self->_faceMaskOutputParamsTex)
    sub_24B6EE890();
  return 0;
}

- (int)allocateFakeResources
{
  uint64_t v2;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  UniImage *v12;
  UniImage *minMaxTex;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  UniImage *v18;
  UniImage *outputParamsImage;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  UniImage *v24;
  UniImage *faceParamsTex;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  UniImage *v30;
  UniImage *eyeProtectionFacesTex;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  UniImage *v36;
  UniImage *faceMaskOutputParamsTex;

  v4 = (void *)MEMORY[0x24BDBF660];
  objc_msgSend_whiteColor(MEMORY[0x24BDBF638], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageWithColor_(v4, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_imageByCroppingToRect_(v7, v8, v9, 0.0, 0.0, 1.0, 1.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageWithCIImage_(UniImage, v11, (uint64_t)v10);
  v12 = (UniImage *)objc_claimAutoreleasedReturnValue();
  minMaxTex = self->_minMaxTex;
  self->_minMaxTex = v12;

  objc_msgSend_imageByCroppingToRect_(v7, v14, v15, 0.0, 0.0, 1.0, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageWithCIImage_(UniImage, v17, (uint64_t)v16);
  v18 = (UniImage *)objc_claimAutoreleasedReturnValue();
  outputParamsImage = self->_outputParamsImage;
  self->_outputParamsImage = v18;

  objc_msgSend_imageByCroppingToRect_(v7, v20, v21, 0.0, 0.0, 9.0, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageWithCIImage_(UniImage, v23, (uint64_t)v22);
  v24 = (UniImage *)objc_claimAutoreleasedReturnValue();
  faceParamsTex = self->_faceParamsTex;
  self->_faceParamsTex = v24;

  objc_msgSend_imageByCroppingToRect_(v7, v26, v27, 0.0, 0.0, 8.0, 1.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageWithCIImage_(UniImage, v29, (uint64_t)v28);
  v30 = (UniImage *)objc_claimAutoreleasedReturnValue();
  eyeProtectionFacesTex = self->_eyeProtectionFacesTex;
  self->_eyeProtectionFacesTex = v30;

  objc_msgSend_imageByCroppingToRect_(v7, v32, v33, 0.0, 0.0, 9.0, 1.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageWithCIImage_(UniImage, v35, (uint64_t)v34);
  v36 = (UniImage *)objc_claimAutoreleasedReturnValue();
  faceMaskOutputParamsTex = self->_faceMaskOutputParamsTex;
  self->_faceMaskOutputParamsTex = v36;

  return 0;
}

- (int)loadShaders
{
  float aaSpatialSigma;
  void *v12;
  const char *v13;
  const char *v14;
  void *v15;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  const char *v26;
  const char *v28;
  const char *v30;
  uint64_t v32;
  const char *v33;
  const char *v34;
  void *v35;
  const char *v37;
  void *v38;
  const char *v39;
  void *v40;
  const char *v42;
  void *v43;
  const char *v45;
  void *v46;
  const char *v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v53;
  void *v54;
  const char *v55;
  const char *v57;
  void *v58;
  const char *v60;
  void *v61;
  uint64_t v63;
  const char *v64;
  void *v65;
  const char *v66;
  void *v67;
  const char *v69;
  void *v70;
  const char *v71;
  void *v72;
  const char *v74;
  void *v75;
  const char *v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v81;
  void *v82;
  const char *v83;
  const char *v85;
  void *v86;
  const char *v87;
  const char *v89;
  void *v90;
  const char *v91;
  UniKernel *v92;
  const char *v93;
  UniKernel *v94;
  UniKernel *calcWeightsX;
  const char *v96;
  UniKernel *v97;
  const char *v98;
  UniKernel *v99;
  const char *v100;
  UniKernel *v101;
  UniKernel *calcWeightsY;
  const char *v103;
  UniKernel *v104;
  const char *v105;
  UniKernel *v106;
  const char *v107;
  UniKernel *v108;
  UniKernel *preprocessing;
  const char *v110;
  UniKernel *v111;
  const char *v112;
  UniKernel *v113;
  const char *v114;
  UniKernel *v115;
  UniKernel *sample;
  const char *v117;
  UniKernel *v118;
  const char *v119;
  UniKernel *v120;
  const char *v121;
  UniKernel *v122;
  UniKernel *antialias;
  const char *v124;
  UniKernel *v125;
  const char *v126;
  UniKernel *v127;
  const char *v128;
  UniKernel *v129;
  UniKernel *antialiasWithForegroundBlur;
  const char *v131;
  UniKernel *v132;
  const char *v133;
  UniKernel *v134;
  const char *v135;
  UniKernel *v136;
  UniKernel *blurmap_x_smoothing;
  const char *v138;
  UniKernel *v139;
  UniKernel *v140;
  const char *v141;
  UniKernel *v142;
  UniKernel *blurmap_y_smoothing;
  const char *v144;
  UniKernel *v145;
  UniKernel *v146;
  const char *v147;
  UniKernel *v148;
  UniKernel *blurmap_x_smoothing_scaled;
  const char *v150;
  UniKernel *v151;
  UniKernel *v152;
  const char *v153;
  UniKernel *v154;
  UniKernel *blurmap_y_smoothing_scaled;
  const char *v156;
  UniKernel *v157;
  UniKernel *v158;
  const char *v159;
  UniKernel *v160;
  UniKernel *blurmap_x_smoothing_unbiased;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  UniKernel *v166;
  const char *v167;
  UniKernel *v168;
  UniKernel *blurmap_y_smoothing_unbiased;
  const char *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  UniKernel *v174;
  const char *v175;
  UniKernel *v176;
  UniKernel *blurmap_x_smoothing_scaled_unbiased;
  const char *v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  UniKernel *v182;
  const char *v183;
  UniKernel *v184;
  UniKernel *blurmap_y_smoothing_scaled_unbiased;
  const char *v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  const char *v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  const char *v195;
  const char *v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  const char *v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  const char *v205;
  const char *v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  float v218;
  void *v219;
  _QWORD v220[4];
  _QWORD v221[4];
  _QWORD v222[4];
  _QWORD v223[4];
  _QWORD v224[10];
  _QWORD v225[10];
  _QWORD v226[2];
  _QWORD v227[2];
  const __CFString *v228;
  _QWORD v229[3];

  v229[1] = *MEMORY[0x24BDAC8D0];
  _S8 = -1.0
      / (float)(self->_disparity_refinement_config_params.weightScaling
              * (float)(self->_disparity_refinement_config_params.weightScaling
                      + self->_disparity_refinement_config_params.weightScaling));
  _S15 = -1.0
       / (float)(self->_disparity_refinement_config_params.lumaSigma
               * (float)(self->_disparity_refinement_config_params.lumaSigma
                       + self->_disparity_refinement_config_params.lumaSigma));
  _S14 = -1.0
       / (float)(self->_disparity_refinement_config_params.chromaSigma
               * (float)(self->_disparity_refinement_config_params.chromaSigma
                       + self->_disparity_refinement_config_params.chromaSigma));
  _S13 = -1.0
       / (float)(self->_disparity_refinement_config_params.segmentationSigma
               * (float)(self->_disparity_refinement_config_params.segmentationSigma
                       + self->_disparity_refinement_config_params.segmentationSigma));
  _S12 = -1.0
       / (float)(self->_disparity_refinement_config_params.disparitySigma
               * (float)(self->_disparity_refinement_config_params.disparitySigma
                       + self->_disparity_refinement_config_params.disparitySigma));
  _S11 = -1.0
       / (float)(self->_disparity_refinement_config_params.aaLumaSigma
               * (float)(self->_disparity_refinement_config_params.aaLumaSigma
                       + self->_disparity_refinement_config_params.aaLumaSigma));
  _S10 = -1.0
       / (float)(self->_disparity_refinement_config_params.aaChromaSigma
               * (float)(self->_disparity_refinement_config_params.aaChromaSigma
                       + self->_disparity_refinement_config_params.aaChromaSigma));
  aaSpatialSigma = self->_disparity_refinement_config_params.aaSpatialSigma;
  _S9 = -1.0
      / (float)(self->_disparity_refinement_config_params.aaSegmentationSigma
              * (float)(self->_disparity_refinement_config_params.aaSegmentationSigma
                      + self->_disparity_refinement_config_params.aaSegmentationSigma));
  v228 = CFSTR("DisparityRefinement::kRadius");
  v218 = -1.0 / (float)(aaSpatialSigma * (float)(aaSpatialSigma + aaSpatialSigma));
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], a2, self->_disparity_refinement_config_params.radius);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v229[0] = v12;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)v229, &v228, 1);
  v219 = (void *)objc_claimAutoreleasedReturnValue();

  v226[0] = CFSTR("DisparityRefinement::kRadius");
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v14, self->_disparity_refinement_config_params.radius);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v226[1] = CFSTR("DisparityRefinement::kWeightScaling_ushort");
  v227[0] = v15;
  __asm { FCVT            H0, S8 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v21, _H0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v227[1] = v22;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v23, (uint64_t)v227, v226, 2);
  v212 = (void *)objc_claimAutoreleasedReturnValue();

  v224[0] = CFSTR("DisparityRefinement::kNumSamples");
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v24, self->_disparity_refinement_config_params.nSamples);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  v225[0] = v217;
  v224[1] = CFSTR("DisparityRefinement::kInnerSamplingRadius_ushort");
  _S0 = self->_disparity_refinement_config_params.innerSamplingRadius;
  __asm { FCVT            H0, S0 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v26, LOWORD(_S0));
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  v225[1] = v216;
  v224[2] = CFSTR("DisparityRefinement::kOuterSamplingRadius_ushort");
  _S0 = self->_disparity_refinement_config_params.outerSamplingRadius;
  __asm { FCVT            H0, S0 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v28, LOWORD(_S0));
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  v225[2] = v215;
  v224[3] = CFSTR("DisparityRefinement::kColorSegScaling_ushort");
  __asm { FCVT            H0, S15 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v30, _H0);
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v223[0] = v214;
  __asm { FCVT            H0, S14 }
  v32 = _H0;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v33, v32);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  v223[1] = v213;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v34, v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v223[2] = v35;
  __asm { FCVT            H0, S13 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v37, _H0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v223[3] = v38;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v39, (uint64_t)v223, 4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v225[3] = v40;
  v224[4] = CFSTR("DisparityRefinement::kDisparityVarianceScaling_ushort");
  __asm { FCVT            H0, S12 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v42, _H0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v225[4] = v43;
  v224[5] = CFSTR("DisparityRefinement::kAccumulatedWeightT0_ushort");
  _S0 = self->_disparity_refinement_config_params.accumulatedWeightT0;
  __asm { FCVT            H0, S0 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v45, LOWORD(_S0));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v225[5] = v46;
  v224[6] = CFSTR("DisparityRefinement::kAccumulatedWeightT1_ushort");
  _S0 = self->_disparity_refinement_config_params.accumulatedWeightT1;
  __asm { FCVT            H0, S0 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v48, LOWORD(_S0));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v225[6] = v49;
  v224[7] = CFSTR("DisparityRefinement::kRadius");
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v50, self->_disparity_refinement_config_params.radius);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v225[7] = v51;
  v224[8] = CFSTR("DisparityRefinement::kMaxReconstructionWeight_ushort");
  _S0 = self->_disparity_refinement_config_params.maxReconstructionWeight;
  __asm { FCVT            H0, S0 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v53, LOWORD(_S0));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v224[9] = CFSTR("CoreImageMetalAbstraction::kEmulateBicubic");
  v225[8] = v54;
  v225[9] = &unk_251C9CC30;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v55, (uint64_t)v225, v224, 10);
  v211 = (void *)objc_claimAutoreleasedReturnValue();

  v221[0] = CFSTR("DisparityRefinement::kMaxReconstructionWeight_ushort");
  _S0 = self->_disparity_refinement_config_params.maxReconstructionWeight;
  __asm { FCVT            H0, S0 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v57, LOWORD(_S0));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v222[0] = v58;
  v221[1] = CFSTR("DisparityRefinement::kAAColorSegScaling_ushort");
  __asm { FCVT            H0, S11 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v60, _H0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v220[0] = v61;
  __asm { FCVT            H0, S10 }
  v63 = _H0;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v64, v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v220[1] = v65;
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v66, v63);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v220[2] = v67;
  __asm { FCVT            H0, S9 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v69, _H0);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v220[3] = v70;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v71, (uint64_t)v220, 4);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v222[1] = v72;
  v221[2] = CFSTR("DisparityRefinement::kAASpatialScaling_ushort");
  _S0 = v218;
  __asm { FCVT            H0, S0 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v74, LOWORD(_S0));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v221[3] = CFSTR("CoreImageMetalAbstraction::kEmulateBicubic");
  v222[2] = v75;
  v222[3] = &unk_251C9CC30;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v76, (uint64_t)v222, v221, 4);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v78, (uint64_t)v77);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  _S0 = self->_disparity_refinement_config_params.fgBlurScale;
  __asm { FCVT            H0, S0 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v81, LOWORD(_S0));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v79, v83, (uint64_t)v82, CFSTR("DisparityRefinement::kFgBlurScale_ushort"));

  _S0 = self->_disparity_refinement_config_params.fgBlurClamp;
  __asm { FCVT            H0, S0 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v85, LOWORD(_S0));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v79, v87, (uint64_t)v86, CFSTR("DisparityRefinement::kFgBlurClamp_ushort"));

  _S0 = self->_disparity_refinement_config_params.fgDeadZoneOffset;
  __asm { FCVT            H0, S0 }
  objc_msgSend_numberWithUnsignedShort_(MEMORY[0x24BDD16E0], v89, LOWORD(_S0));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v79, v91, (uint64_t)v90, CFSTR("DisparityRefinement::kFgDeadZoneOffset_ushort"));

  v92 = [UniKernel alloc];
  v94 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v92, v93, (uint64_t)CFSTR("disparity_refinement_calcweightsX"), self->_library, v219);
  calcWeightsX = self->_calcWeightsX;
  self->_calcWeightsX = v94;

  v97 = self->_calcWeightsX;
  if (!v97)
    sub_24B6EE8B8();
  objc_msgSend_setPreferredOutputFormat_(v97, v96, (uint64_t)&unk_251C9CC18);
  objc_msgSend_setRoiCallback_(self->_calcWeightsX, v98, (uint64_t)&unk_251C8F6A8);
  v99 = [UniKernel alloc];
  v101 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v99, v100, (uint64_t)CFSTR("disparity_refinement_calcweightsY"), self->_library, v212);
  calcWeightsY = self->_calcWeightsY;
  self->_calcWeightsY = v101;

  v104 = self->_calcWeightsY;
  if (!v104)
    sub_24B6EE8E0();
  objc_msgSend_setPreferredOutputFormat_(v104, v103, (uint64_t)&unk_251C9CC18);
  objc_msgSend_setRoiCallback_(self->_calcWeightsY, v105, (uint64_t)&unk_251C8F6C8);
  v106 = [UniKernel alloc];
  v108 = (UniKernel *)objc_msgSend_initWithName_library_(v106, v107, (uint64_t)CFSTR("disparity_refinement_preproc"), self->_library);
  preprocessing = self->_preprocessing;
  self->_preprocessing = v108;

  v111 = self->_preprocessing;
  if (!v111)
    sub_24B6EE908();
  objc_msgSend_setPreferredOutputFormat_(v111, v110, (uint64_t)&unk_251C9CC48);
  objc_msgSend_setRoiCallback_(self->_preprocessing, v112, (uint64_t)&unk_251C8F6E8);
  v113 = [UniKernel alloc];
  v115 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v113, v114, (uint64_t)CFSTR("disparity_refinement_sample"), self->_library, v211);
  sample = self->_sample;
  self->_sample = v115;

  v118 = self->_sample;
  if (!v118)
    sub_24B6EE930();
  objc_msgSend_setPreferredOutputFormat_(v118, v117, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(self->_sample, v119, (uint64_t)&unk_251C8F708);
  v120 = [UniKernel alloc];
  v122 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v120, v121, (uint64_t)CFSTR("disparity_refinement_antialias"), self->_library, v77);
  antialias = self->_antialias;
  self->_antialias = v122;

  v125 = self->_antialias;
  if (!v125)
    sub_24B6EE958();
  objc_msgSend_setPreferredOutputFormat_(v125, v124, (uint64_t)&unk_251C9CBD0);
  objc_msgSend_setRoiCallback_(self->_antialias, v126, (uint64_t)&unk_251C8F728);
  v127 = [UniKernel alloc];
  v129 = (UniKernel *)objc_msgSend_initWithName_library_constants_(v127, v128, (uint64_t)CFSTR("disparity_refinement_antialias_with_foreground_blur"), self->_library, v79);
  antialiasWithForegroundBlur = self->_antialiasWithForegroundBlur;
  self->_antialiasWithForegroundBlur = v129;

  v132 = self->_antialiasWithForegroundBlur;
  if (!v132)
    sub_24B6EE980();
  objc_msgSend_setPreferredOutputFormat_(v132, v131, (uint64_t)&unk_251C9CBE8);
  objc_msgSend_setRoiCallback_(self->_antialiasWithForegroundBlur, v133, (uint64_t)&unk_251C8F748);
  v134 = [UniKernel alloc];
  v136 = (UniKernel *)objc_msgSend_initWithName_library_(v134, v135, (uint64_t)CFSTR("blurmap_x_smoothing"), self->_library);
  blurmap_x_smoothing = self->_blurmap_x_smoothing;
  self->_blurmap_x_smoothing = v136;

  v139 = self->_blurmap_x_smoothing;
  if (!v139)
    sub_24B6EE9A8();
  objc_msgSend_setPreferredOutputFormat_(v139, v138, (uint64_t)&unk_251C9CBE8);
  v140 = [UniKernel alloc];
  v142 = (UniKernel *)objc_msgSend_initWithName_library_(v140, v141, (uint64_t)CFSTR("blurmap_y_smoothing"), self->_library);
  blurmap_y_smoothing = self->_blurmap_y_smoothing;
  self->_blurmap_y_smoothing = v142;

  v145 = self->_blurmap_y_smoothing;
  if (!v145)
    sub_24B6EE9D0();
  objc_msgSend_setPreferredOutputFormat_(v145, v144, (uint64_t)&unk_251C9CBD0);
  v146 = [UniKernel alloc];
  v148 = (UniKernel *)objc_msgSend_initWithName_library_(v146, v147, (uint64_t)CFSTR("blurmap_x_smoothing_scaled"), self->_library);
  blurmap_x_smoothing_scaled = self->_blurmap_x_smoothing_scaled;
  self->_blurmap_x_smoothing_scaled = v148;

  v151 = self->_blurmap_x_smoothing_scaled;
  if (!v151)
    sub_24B6EE9F8();
  objc_msgSend_setPreferredOutputFormat_(v151, v150, (uint64_t)&unk_251C9CBE8);
  v152 = [UniKernel alloc];
  v154 = (UniKernel *)objc_msgSend_initWithName_library_(v152, v153, (uint64_t)CFSTR("blurmap_y_smoothing_scaled"), self->_library);
  blurmap_y_smoothing_scaled = self->_blurmap_y_smoothing_scaled;
  self->_blurmap_y_smoothing_scaled = v154;

  v157 = self->_blurmap_y_smoothing_scaled;
  if (!v157)
    sub_24B6EEA20();
  objc_msgSend_setPreferredOutputFormat_(v157, v156, (uint64_t)&unk_251C9CBD0);
  v158 = [UniKernel alloc];
  v160 = (UniKernel *)objc_msgSend_initWithName_library_(v158, v159, (uint64_t)CFSTR("blurmap_x_smoothing_unbiased"), self->_library);
  blurmap_x_smoothing_unbiased = self->_blurmap_x_smoothing_unbiased;
  self->_blurmap_x_smoothing_unbiased = v160;

  if (!self->_blurmap_x_smoothing_unbiased)
    sub_24B6EEA48();
  objc_msgSend_preferredOutputFormat(self->_blurmap_x_smoothing, v162, v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreferredOutputFormat_(self->_blurmap_x_smoothing_unbiased, v165, (uint64_t)v164);

  v166 = [UniKernel alloc];
  v168 = (UniKernel *)objc_msgSend_initWithName_library_(v166, v167, (uint64_t)CFSTR("blurmap_y_smoothing_unbiased"), self->_library);
  blurmap_y_smoothing_unbiased = self->_blurmap_y_smoothing_unbiased;
  self->_blurmap_y_smoothing_unbiased = v168;

  if (!self->_blurmap_y_smoothing_unbiased)
    sub_24B6EEA70();
  objc_msgSend_preferredOutputFormat(self->_blurmap_y_smoothing, v170, v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreferredOutputFormat_(self->_blurmap_y_smoothing_unbiased, v173, (uint64_t)v172);

  v174 = [UniKernel alloc];
  v176 = (UniKernel *)objc_msgSend_initWithName_library_(v174, v175, (uint64_t)CFSTR("blurmap_x_smoothing_scaled_unbiased"), self->_library);
  blurmap_x_smoothing_scaled_unbiased = self->_blurmap_x_smoothing_scaled_unbiased;
  self->_blurmap_x_smoothing_scaled_unbiased = v176;

  if (!self->_blurmap_x_smoothing_scaled_unbiased)
    sub_24B6EEA98();
  objc_msgSend_preferredOutputFormat(self->_blurmap_x_smoothing_scaled, v178, v179);
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreferredOutputFormat_(self->_blurmap_x_smoothing_scaled_unbiased, v181, (uint64_t)v180);

  v182 = [UniKernel alloc];
  v184 = (UniKernel *)objc_msgSend_initWithName_library_(v182, v183, (uint64_t)CFSTR("blurmap_y_smoothing_scaled_unbiased"), self->_library);
  blurmap_y_smoothing_scaled_unbiased = self->_blurmap_y_smoothing_scaled_unbiased;
  self->_blurmap_y_smoothing_scaled_unbiased = v184;

  if (!self->_blurmap_y_smoothing_scaled_unbiased)
    sub_24B6EEAC0();
  objc_msgSend_preferredOutputFormat(self->_blurmap_y_smoothing_scaled, v186, v187);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreferredOutputFormat_(self->_blurmap_y_smoothing_scaled_unbiased, v189, (uint64_t)v188);

  objc_msgSend_setRoiCallback_(self->_blurmap_x_smoothing, v190, (uint64_t)&unk_251C8F768);
  objc_msgSend_roiCallback(self->_blurmap_x_smoothing, v191, v192);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRoiCallback_(self->_blurmap_x_smoothing_unbiased, v194, (uint64_t)v193);

  objc_msgSend_setRoiCallback_(self->_blurmap_y_smoothing, v195, (uint64_t)&unk_251C8F788);
  objc_msgSend_roiCallback(self->_blurmap_y_smoothing, v196, v197);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRoiCallback_(self->_blurmap_y_smoothing_unbiased, v199, (uint64_t)v198);

  objc_msgSend_setRoiCallback_(self->_blurmap_x_smoothing_scaled, v200, (uint64_t)&unk_251C8F7A8);
  objc_msgSend_roiCallback(self->_blurmap_x_smoothing_scaled, v201, v202);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRoiCallback_(self->_blurmap_x_smoothing_scaled_unbiased, v204, (uint64_t)v203);

  objc_msgSend_setRoiCallback_(self->_blurmap_y_smoothing_scaled, v205, (uint64_t)&unk_251C8F7C8);
  objc_msgSend_roiCallback(self->_blurmap_y_smoothing_scaled, v206, v207);
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRoiCallback_(self->_blurmap_y_smoothing_scaled_unbiased, v209, (uint64_t)v208);

  return 0;
}

- (void)deallocateResources
{
  UniImage *minMaxTex;
  UniImage *outputParamsImage;
  UniImage *faceParamsTex;
  UniImage *eyeProtectionFacesTex;
  UniImage *faceMaskOutputParamsTex;

  minMaxTex = self->_minMaxTex;
  self->_minMaxTex = 0;

  outputParamsImage = self->_outputParamsImage;
  self->_outputParamsImage = 0;

  faceParamsTex = self->_faceParamsTex;
  self->_faceParamsTex = 0;

  eyeProtectionFacesTex = self->_eyeProtectionFacesTex;
  self->_eyeProtectionFacesTex = 0;

  faceMaskOutputParamsTex = self->_faceMaskOutputParamsTex;
  self->_faceMaskOutputParamsTex = 0;

}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_deallocateResources(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)MakeBlurMap;
  -[MakeBlurMap dealloc](&v4, sel_dealloc);
}

- (id)performBlurmapSmoothingUsingSmoothingConfig:(const blurmap_smoothing_params *)a3 inputBlurMap:(id)a4 inputIntermediateTex:(id)a5 outputSmoothedBlurmap:(id)a6 scale:(float)a7 version:(int)a8 context:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  const char *v33;
  int v34;
  id v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  double v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  double v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  double v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const blurmap_smoothing_params *v58;
  double v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  id v72;
  id v73;
  UniRunInfo *v74;
  const char *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  UniRunInfo *v79;
  const char *v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  double v86;
  id v87;
  int var0;
  const blurmap_smoothing_params *v89;
  void *v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  const char *v95;
  void *v96;
  const char *v97;
  void *v98;
  void *v99;
  double v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  void *v105;
  const char *v106;
  id v108;
  void *v109;
  const blurmap_smoothing_params *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  int v115;
  void *v116;
  uint64_t v117;
  _QWORD v118[3];
  _QWORD v119[3];
  _QWORD v120[6];
  _QWORD v121[6];
  _QWORD v122[4];
  _QWORD v123[4];
  _QWORD v124[5];
  _QWORD v125[7];

  v125[5] = *MEMORY[0x24BDAC8D0];
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  v20 = v16;
  v23 = v20;
  v24 = v20;
  if (a3->var0 >= 1)
  {
    v108 = v19;
    objc_msgSend_extent(v20, v21, v22);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = objc_msgSend_conformsToProtocol_(v17, v33, (uint64_t)&unk_2579B9140);
    v35 = v17;
    v38 = v35;
    v114 = v18;
    v115 = a8;
    if (v34)
    {
      v39 = objc_msgSend_pixelFormat(v35, v36, v37);
      tmpTexturesFromTexture(v38, 1u, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectAtIndexedSubscript_(v40, v41, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_texture(v42, v43, v44);
      v117 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v117 = (uint64_t)v35;
    }
    v124[0] = CFSTR("nIterations");
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v36, a3->var0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v125[0] = v45;
    v124[1] = CFSTR("originalBlurValueT0");
    *(float *)&v46 = a3->var1;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v47, v48, v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v125[1] = v49;
    v124[2] = CFSTR("originalBlurValueT1");
    *(float *)&v50 = a3->var2;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v51, v52, v50);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v125[2] = v53;
    v124[3] = CFSTR("localMinimumBlurValueT0");
    *(float *)&v54 = a3->var3;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v55, v56, v54);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v125[3] = v57;
    v124[4] = CFSTR("localMinimumBlurValueT1");
    v58 = a3;
    *(float *)&v59 = a3->var4;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v60, v61, v59);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v125[4] = v62;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v63, (uint64_t)v125, v124, 5);
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v23;
    v64 = 464;
    if (a7 >= 1.0)
      v64 = 448;
    v65 = *(Class *)((char *)&self->super.isa + v64);
    if (a7 < 1.0)
      v66 = 472;
    else
      v66 = 456;
    v67 = v65;
    v68 = *(id *)((char *)&self->super.isa + v66);
    if (v115 >= 4)
    {
      v69 = 496;
      if (a7 >= 1.0)
        v69 = 480;
      v70 = *(Class *)((char *)&self->super.isa + v69);
      if (a7 < 1.0)
        v71 = 504;
      else
        v71 = 488;
      v72 = v70;

      v73 = *(id *)((char *)&self->super.isa + v71);
      v67 = v72;
      v68 = v73;
    }
    v74 = [UniRunInfo alloc];
    v119[0] = (unint64_t)(v30 * 0.5);
    v119[1] = (unint64_t)(v32 * 0.5);
    v119[2] = 1;
    v76 = (void *)objc_msgSend_initWithGridSize_kernel_(v74, v75, (uint64_t)v119, v67);
    objc_msgSend_setCoreImageOutputExtent_(v76, v77, v78, v26, v28, v30, v32);
    v79 = [UniRunInfo alloc];
    v118[0] = (unint64_t)(v30 * 0.5);
    v118[1] = (unint64_t)(v32 * 0.5);
    v118[2] = 1;
    v81 = (void *)objc_msgSend_initWithGridSize_kernel_(v79, v80, (uint64_t)v118, v68);
    objc_msgSend_setCoreImageOutputExtent_(v81, v82, v83, v26, v28, v30, v32);
    v109 = v23;
    v87 = v67;
    if (a7 > 1.0)
    {

      v76 = 0;
      v81 = 0;
    }
    v111 = v81;
    v112 = v68;
    var0 = v58->var0;
    v116 = v24;
    v19 = v108;
    v89 = v58;
    v90 = (void *)v117;
    v91 = v87;
    v92 = v76;
    if (var0 >= 1)
    {
      v93 = 0;
      v110 = v89;
      do
      {
        v122[0] = CFSTR("inputTex");
        v122[1] = CFSTR("outputTex");
        v123[0] = v24;
        v123[1] = v90;
        v123[2] = v108;
        v122[2] = CFSTR("_renderContext");
        v122[3] = CFSTR("_kernelScale");
        *(float *)&v86 = a7;
        objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v84, v85, v86);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v123[3] = v94;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v95, (uint64_t)v123, v122, 4);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageByApplyingParameters_runInfo_(v91, v97, (uint64_t)v96, v92);
        v98 = v91;
        v99 = (void *)objc_claimAutoreleasedReturnValue();

        v120[0] = CFSTR("params");
        v120[1] = CFSTR("referenceTex");
        v121[0] = v113;
        v121[1] = v116;
        v120[2] = CFSTR("inputTex");
        v120[3] = CFSTR("outputTex");
        v121[2] = v99;
        v121[3] = v114;
        v121[4] = v108;
        v120[4] = CFSTR("_renderContext");
        v120[5] = CFSTR("_kernelScale");
        *(float *)&v100 = a7;
        objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v101, v102, v100);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v121[5] = v103;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v104, (uint64_t)v121, v120, 6);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageByApplyingParameters_runInfo_(v112, v106, (uint64_t)v105, v111);
        v24 = (id)objc_claimAutoreleasedReturnValue();

        v91 = v98;
        v90 = (void *)v117;

        ++v93;
      }
      while (v93 < v110->var0);
    }

    v23 = v109;
    v18 = v114;
  }

  return v24;
}

- (id)performDisparityRefinementViaMatting:(id)a3 inputShiftmap:(id)a4 focusRect:(CGRect)a5 inputLuma:(id)a6 inputChroma:(id)a7 simpleLensModelCalculatorImage:(id)a8 disparityConfigIndex:(int)a9 outputRefinedImage:(id)a10 tmpRGB:(id)a11 tmpDisparity:(id)a12 tmpRGBA:(id)a13 SDOFVersion:(int)a14 mattingParams:(id *)a15 context:(id)a16
{
  double height;
  double width;
  double y;
  double x;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  char isKindOfClass;
  const char *v34;
  float v35;
  void *v36;
  void *v37;
  $E978C65257034D8B8CEA657553AB82B8 *v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  float v43;
  __int128 v44;
  float v45;
  float v46;
  float v47;
  float v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  UniKernel *fpDisparityRefinementPreprocessing;
  const char *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  UniKernel *sparseRenderingPreprocessingScaled;
  void *v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  const char *v74;
  uint64_t v75;
  CGFloat v76;
  CGFloat v77;
  CGFloat v78;
  CGFloat v79;
  const char *v80;
  uint64_t v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double v88;
  CGFloat v89;
  const char *v90;
  uint64_t v91;
  CGFloat v92;
  CGFloat v93;
  CGFloat v94;
  CGFloat v95;
  const char *v96;
  uint64_t v97;
  double v98;
  id v99;
  MakeBlurMap *v100;
  void *v101;
  void *v102;
  const char *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  void *v109;
  UniFakeImage *v110;
  const char *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  double v121;
  unint64_t v122;
  const char *v123;
  uint64_t v124;
  double v125;
  const char *v126;
  const char *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  void *v132;
  const char *v133;
  const char *v134;
  uint64_t v135;
  double v136;
  double v137;
  double v138;
  double v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  UniKernel *guidedFilter;
  void *v145;
  double v146;
  const char *v147;
  uint64_t v148;
  void *v149;
  double v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  void *v155;
  double v156;
  const char *v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  char v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  id v176;
  id v177;
  id v178;
  id v179;
  id v181;
  void *v182;
  void *v183;
  id v185;
  _DWORD v186[5];
  __int128 v187;
  __int128 v188;
  __int128 v189;
  _QWORD v190[10];
  _QWORD v191[10];
  _QWORD v192[5];
  _QWORD v193[5];
  _QWORD v194[7];
  _QWORD v195[10];
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v195[7] = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  v25 = a4;
  v26 = a6;
  v27 = a7;
  v28 = a8;
  v185 = a10;
  v29 = a11;
  v30 = a12;
  v31 = a13;
  v32 = a16;
  if (v24)
  {
    v176 = v27;
    v177 = v25;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v187 = xmmword_24B6F56C8;
    v188 = unk_24B6F56D8;
    v189 = xmmword_24B6F56E8;
    v178 = v30;
    v179 = v28;
    if (a9 == 5 && a14 >= 4)
    {
      DWORD2(v189) = 1051931443;
      v35 = 4.0;
      v36 = v25;
      v37 = v185;
      v38 = a15;
    }
    else
    {
      v38 = a15;
      if (a9 == 4 && a14 <= 3)
      {
        DWORD2(v189) = 1051931443;
        v36 = v25;
        v37 = v185;
        goto LABEL_14;
      }
      v36 = v25;
      v37 = v185;
      if (a9 == 7)
      {
        DWORD2(v189) = 1048576000;
        LODWORD(v188) = 1065353216;
        HIDWORD(v188) = 1084227584;
        v35 = 1.0;
      }
      else
      {
        if (a9 != 6)
          goto LABEL_6;
        DWORD2(v189) = 1036831949;
        v35 = 8.0;
      }
    }
    *(float *)&v189 = v35;
LABEL_6:
    if (a14 > 4)
    {
      if (!v38)
      {
        v39 = v24;
        uni_logger_api();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          sub_24B6EEDDC(v40, v113, v114, v115, v116, v117, v118, v119);
        goto LABEL_40;
      }
      if (a9 != 0xFFFF)
      {
        v39 = v24;
        uni_logger_api();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          sub_24B6EEE4C(v40, v163, v164, v165, v166, v167, v168, v169);
        goto LABEL_40;
      }
      goto LABEL_18;
    }
    if ((a9 - 7) <= 0xFFFFFFF9)
    {
      v39 = v24;
      uni_logger_api();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        sub_24B6EECB8(a9, v40);
LABEL_40:

      v41 = 0;
      v30 = v178;
LABEL_41:

      v28 = v179;
      goto LABEL_42;
    }
LABEL_14:
    if (!v38)
    {
      v171 = isKindOfClass;
      v181 = v31;
      v42 = v29;
      v43 = 0.75;
LABEL_19:
      v45 = x;
      v46 = y;
      *(float *)v186 = v45;
      *(float *)&v186[1] = v46;
      v47 = width;
      v48 = height;
      *(float *)&v186[2] = v47;
      *(float *)&v186[3] = v48;
      *(float *)&v186[4] = v43;
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v34, (uint64_t)&v187, 48);
      v49 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v50, (uint64_t)v186, 20);
      v51 = objc_claimAutoreleasedReturnValue();
      fpDisparityRefinementPreprocessing = self->_fpDisparityRefinementPreprocessing;
      v194[0] = CFSTR("alpha");
      v194[1] = CFSTR("inputDisparity");
      v195[1] = v36;
      v195[2] = v178;
      v194[2] = CFSTR("outputDisparity");
      v194[3] = CFSTR("focusRect");
      v174 = (void *)v51;
      v175 = (void *)v49;
      v195[3] = v51;
      v195[4] = v49;
      v194[4] = CFSTR("config");
      v194[5] = CFSTR("zeroShiftTex");
      v194[6] = CFSTR("_renderContext");
      v195[0] = v24;
      v195[5] = v179;
      v195[6] = v32;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v53, (uint64_t)v195, v194, 7);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(fpDisparityRefinementPreprocessing, v55, (uint64_t)v54);
      v56 = objc_claimAutoreleasedReturnValue();

      if (!v56)
        sub_24B6EED64();
      sparseRenderingPreprocessingScaled = self->_sparseRenderingPreprocessingScaled;
      v192[0] = CFSTR("inputChromaTex");
      v192[1] = CFSTR("inputLumaTex");
      v193[0] = v176;
      v193[1] = v26;
      v173 = v26;
      v193[2] = v24;
      v60 = v42;
      v192[2] = CFSTR("inputBlurMapTex");
      v192[3] = CFSTR("outputTex");
      if (!v42)
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v57, v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v192[4] = CFSTR("_renderContext");
      v193[3] = v60;
      v193[4] = v32;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v57, (uint64_t)v193, v192, 5);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(sparseRenderingPreprocessingScaled, v62, (uint64_t)v61);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      v172 = v42;
      if (!v42)

      objc_msgSend_extent(v63, v64, v65);
      v67 = v66;
      v69 = v68;
      v71 = v70;
      v73 = v72;
      objc_msgSend_extent(v37, v74, v75);
      v198.origin.x = v76;
      v198.origin.y = v77;
      v198.size.width = v78;
      v198.size.height = v79;
      v196.origin.x = v67;
      v196.origin.y = v69;
      v196.size.width = v71;
      v196.size.height = v73;
      if (!CGRectEqualToRect(v196, v198))
        sub_24B6EEDB4();
      objc_msgSend_extent(v24, v80, v81);
      v83 = v82;
      v85 = v84;
      v87 = v86;
      v89 = v88;
      objc_msgSend_extent(v37, v90, v91);
      v199.origin.x = v92;
      v199.origin.y = v93;
      v199.size.width = v94;
      v199.size.height = v95;
      v197.origin.x = v83;
      v197.origin.y = v85;
      v197.size.width = v87;
      v197.size.height = v89;
      v182 = v63;
      v183 = (void *)v56;
      if (CGRectEqualToRect(v197, v199))
      {
        v99 = v32;
        v39 = v24;
        v100 = self;
      }
      else
      {
        if ((v171 & 1) != 0)
        {
          v101 = (void *)MEMORY[0x24BDBF660];
          objc_msgSend_blackColor(MEMORY[0x24BDBF638], v96, v97);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_imageWithColor_(v101, v103, (uint64_t)v102);
          v104 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_extent(v37, v105, v106);
          objc_msgSend_imageByCroppingToRect_(v104, v107, v108);
          v109 = (void *)objc_claimAutoreleasedReturnValue();

          v110 = [UniFakeImage alloc];
          v112 = (void *)objc_msgSend_initWithCIImage_format_(v110, v111, (uint64_t)v109, 10);
          v100 = self;
        }
        else
        {
          v120 = (void *)MEMORY[0x24BDDD740];
          objc_msgSend_extent(v37, v96, v97);
          v122 = (unint64_t)v121;
          objc_msgSend_extent(v37, v123, v124);
          objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v120, v126, 10, v122, (unint64_t)v125, 0);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setUsage_(v109, v127, 19);
          v100 = self;
          objc_msgSend_device(self->_mtlQueue, v128, v129);
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          v132 = (void *)objc_msgSend_newTextureWithDescriptor_(v130, v131, (uint64_t)v109);

          objc_msgSend_imageWithMTLTexture_(UniImage, v133, (uint64_t)v132);
          v112 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend_extent(v37, v134, v135);
        v137 = v136;
        v139 = v138;
        objc_msgSend_device(v100->_mtlQueue, v140, v141);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = v32;
        objc_msgSend__scaleImage_targetSize_device_useBoxFiltering_outputImage_context_(v100, v143, (uint64_t)v24, v142, 0, v112, v32, v137, v139);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
          sub_24B6EED8C();

        v63 = v182;
      }
      guidedFilter = v100->_guidedFilter;
      v190[0] = CFSTR("source");
      v190[1] = CFSTR("guidance");
      v191[0] = v183;
      v191[1] = v63;
      v190[2] = CFSTR("weights");
      v190[3] = CFSTR("destinationCoefficients");
      v191[2] = v39;
      v191[3] = v37;
      v190[4] = CFSTR("spatialDiameter");
      *(float *)&v98 = (float)(*((float *)&v188 + 3) * 2.0) + 1.0;
      objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v96, v97, v98);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v191[4] = v145;
      v190[5] = CFSTR("subsampleFactor");
      LODWORD(v146) = v189;
      objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v147, v148, v146);
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v191[5] = v149;
      v190[6] = CFSTR("epsilon");
      LODWORD(v150) = DWORD1(v189);
      objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v151, v152, v150);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v191[6] = v153;
      v190[7] = CFSTR("iterations");
      objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v154, HIDWORD(v189));
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      v191[7] = v155;
      v191[8] = v99;
      v32 = v99;
      v190[8] = CFSTR("_renderContext");
      v190[9] = CFSTR("rgbWeight");
      LODWORD(v156) = DWORD2(v189);
      objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v157, v158, v156);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v191[9] = v159;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v160, (uint64_t)v191, v190, 10);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(guidedFilter, v162, (uint64_t)v161);
      v41 = (id)objc_claimAutoreleasedReturnValue();

      v27 = v176;
      v36 = v177;
      v29 = v172;
      v26 = v173;
      v30 = v178;
      v31 = v181;
      goto LABEL_41;
    }
LABEL_18:
    v171 = isKindOfClass;
    v181 = v31;
    v42 = v29;
    v44 = *(_OWORD *)&v38->var4;
    v187 = *(_OWORD *)&v38->var0;
    v188 = v44;
    v189 = *(_OWORD *)&v38->var8;
    v43 = *(float *)&v187;
    goto LABEL_19;
  }
  v41 = v25;
  v36 = v25;
LABEL_42:

  return v41;
}

- (id)performDisparityRefinementUsingParams:(const disparity_refinement_params *)a3 inputDisparity:(id)a4 inputSegmentation:(id)a5 inputImageLuma:(id)a6 inputImageChroma:(id)a7 inputSlmParams:(id)a8 inputWeightsX:(id)a9 inputWeightsY:(id)a10 inputPreproc:(id)a11 inputSampledD:(id)a12 outputBlurMap:(id)a13 scale:(float)a14 havePerformedMatting:(BOOL)a15 editTimeRender:(BOOL)a16 context:(id)a17
{
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  double v35;
  double v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  _BOOL4 v52;
  BOOL v53;
  void *v54;
  UniKernel *passthrough;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  const char *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  UniKernel *calcWeightsX;
  void *v67;
  id v68;
  void *v69;
  const char *v70;
  void *v71;
  const char *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  double v76;
  UniKernel *calcWeightsY;
  void *v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  UniKernel *preprocessing;
  void *v86;
  void *v87;
  void *v88;
  const char *v89;
  const char *v90;
  UniKernel *sample;
  const char *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  const char *v97;
  void *v98;
  float fgBlurClamp;
  _BOOL4 v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  float fgFgBgThreshold;
  _BOOL4 v105;
  _BOOL4 v106;
  void *v107;
  uint64_t i;
  const char *v109;
  double v110;
  double v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  id v116;
  double v117;
  void *v118;
  void *v119;
  const char *v120;
  void *v121;
  const char *v122;
  id v123;
  UniKernel *thresholdedSobel;
  double v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  double v131;
  void *v132;
  void *v133;
  void *v134;
  const char *v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  UniKernel *morphology;
  const char *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  const char *v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  UniKernel *blendBackgroundBlur;
  void *v154;
  void *v155;
  const char *v156;
  uint64_t j;
  id v159;
  int fgBgDilationSize;
  void *v161;
  id v162;
  id v163;
  const disparity_refinement_params *v164;
  void *v165;
  id v166;
  void *v167;
  void *v168;
  void *v169;
  id v170;
  id v171;
  void *v172;
  id v173;
  id v174;
  void *v175;
  _WORD v176[2];
  _QWORD v177[4];
  _QWORD v178[4];
  _QWORD v179[5];
  _QWORD v180[5];
  _QWORD v181[5];
  _QWORD v182[5];
  _QWORD v183[7];
  _QWORD v184[7];
  void *v185;
  void *v186;
  void *v187;
  _QWORD v188[5];
  _QWORD v189[5];
  _QWORD v190[5];
  _QWORD v191[5];
  _QWORD v192[5];
  _QWORD v193[5];
  _QWORD v194[4];
  _QWORD v195[4];
  _QWORD v196[4];
  _QWORD v197[6];

  v197[4] = *MEMORY[0x24BDAC8D0];
  v174 = a4;
  v173 = a5;
  v24 = a6;
  v25 = a7;
  v26 = a8;
  v27 = a9;
  v170 = a10;
  v28 = a11;
  v29 = a12;
  v30 = a13;
  v31 = a17;
  v164 = a3;
  v175 = v31;
  v172 = v24;
  v169 = v27;
  if (objc_msgSend_setOptions_isPrewarm_(self, v32, (uint64_t)a3, 0))
  {
    syslog(3, "err error, (%s) at %s:%d", "-[MakeBlurMap performDisparityRefinementUsingParams:inputDisparity:inputSegmentation:inputImageLuma:inputImageChroma:inputSlmParams:inputWeightsX:inputWeightsY:inputPreproc:inputSampledD:outputBlurMap:scale:havePerformedMatting:editTimeRender:context:]", "/Library/Caches/com.apple.xbs/Sources/CameraCapture/VideoProcessors/Portrait/CCPortrait/MakeBlurMap.m", 2078);
    v61 = 0;
    v62 = v173;
    v57 = v174;
    v63 = v170;
    v54 = v29;
  }
  else
  {
    objc_msgSend_extent(v30, v33, v34);
    v36 = v35;
    v38 = v37;
    objc_msgSend_extent(v174, v39, v40);
    v42 = v41;
    v44 = v43;
    objc_msgSend_extent(v28, v45, v46);
    v52 = v42 != v36;
    if (v44 != v38)
      v52 = 1;
    v53 = (v52 || a16) && !a15;
    v171 = v28;
    if (v53)
    {
      v64 = v50;
      v65 = v51;
      v163 = v26;
      v166 = v25;
      calcWeightsX = self->_calcWeightsX;
      v195[0] = v174;
      v194[0] = CFSTR("inputDisparityTex");
      v194[1] = CFSTR("outputMinMaxTex");
      v67 = v27;
      v68 = v29;
      if (!v27)
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v47, v48);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v195[1] = v67;
      v194[2] = CFSTR("_renderContext");
      v195[2] = v31;
      v194[3] = CFSTR("_kernelScale");
      *(float *)&v49 = a14;
      objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v47, v48, v49);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v195[3] = v69;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v70, (uint64_t)v195, v194, 4);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(calcWeightsX, v72, (uint64_t)v71);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v27)
      calcWeightsY = self->_calcWeightsY;
      v192[0] = CFSTR("inputDisparityTex");
      v192[1] = CFSTR("inputMinMaxTex");
      v193[0] = v174;
      v193[1] = v73;
      v192[2] = CFSTR("outputDisparityWeightTex");
      v63 = v170;
      v78 = v170;
      if (!v170)
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v74, v75);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v193[2] = v78;
      v193[3] = v175;
      v192[3] = CFSTR("_renderContext");
      v192[4] = CFSTR("_kernelScale");
      *(float *)&v76 = a14;
      objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v74, v75, v76);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v193[4] = v79;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v80, (uint64_t)v193, v192, 5);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(calcWeightsY, v82, (uint64_t)v81);
      v168 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v170)
      preprocessing = self->_preprocessing;
      v190[0] = CFSTR("inputSegmentationTex");
      v86 = v173;
      if (!v173)
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v83, v84);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v191[0] = v86;
      v191[1] = v24;
      v190[1] = CFSTR("inputLumaTex");
      v190[2] = CFSTR("inputChromaTex");
      v191[2] = v166;
      v190[3] = CFSTR("outputCombinedTex");
      v87 = v171;
      if (!v171)
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v83, v84);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v190[4] = CFSTR("_renderContext");
      v191[3] = v87;
      v191[4] = v175;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v83, (uint64_t)v191, v190, 5);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(preprocessing, v89, (uint64_t)v88);
      v167 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v171)
      if (!v173)

      v176[0] = (int)v64;
      v176[1] = (int)v65;
      sample = self->_sample;
      v188[0] = CFSTR("outputDimension");
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v90, (uint64_t)v176, 4);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v189[0] = v94;
      v189[1] = v167;
      v188[1] = CFSTR("inputPreprocTex");
      v188[2] = CFSTR("inputDisparityWeightTex");
      v189[2] = v168;
      v188[3] = CFSTR("outputDisparityTex");
      v95 = v68;
      if (!v68)
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v92, v93);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v188[4] = CFSTR("_renderContext");
      v189[3] = v95;
      v189[4] = v175;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v92, (uint64_t)v189, v188, 5);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(sample, v97, (uint64_t)v96);
      v98 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v68)
      fgBlurClamp = self->_disparity_refinement_config_params.fgBlurClamp;
      if (fgBlurClamp >= self->_disparity_refinement_config_params.fgBlurScale)
        fgBlurClamp = self->_disparity_refinement_config_params.fgBlurScale;
      v100 = enableFGBlur(fgBlurClamp > 0.0);
      v101 = 184;
      if (v100)
        v101 = 192;
      v162 = *(id *)((char *)&self->super.isa + v101);
      fgFgBgThreshold = v164->fgFgBgThreshold;
      v105 = fgFgBgThreshold > 0.0 && v100;
      fgBgDilationSize = v164->fgBgDilationSize;
      v106 = fgBgDilationSize > 0 && v105;
      v185 = 0;
      v186 = 0;
      v187 = 0;
      v107 = v30;
      if (v106)
      {
        for (i = 0; i != 24; i += 8)
        {
          objc_msgSend_extent(v30, v102, v103);
          objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_pixelFormat_(self, v109, (uint64_t)v30, v30, 65, v110, v111);
          v112 = objc_claimAutoreleasedReturnValue();
          v113 = *(void **)((char *)&v185 + i);
          *(void **)((char *)&v185 + i) = (void *)v112;

        }
        v107 = v185;
      }
      v165 = v68;
      v116 = v107;
      v183[0] = CFSTR("slmParamsTex");
      v183[1] = CFSTR("inputDisparityWeightTex");
      v184[0] = v163;
      v184[1] = v168;
      v183[2] = CFSTR("inputPreprocTex");
      v183[3] = CFSTR("inputSampledDisparityTex");
      v184[2] = v167;
      v184[3] = v98;
      v118 = v116;
      v183[4] = CFSTR("outputBlurMapTex");
      if (!v116)
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v114, v115);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v184[4] = v118;
      v184[5] = v175;
      v183[5] = CFSTR("_renderContext");
      v183[6] = CFSTR("_kernelScale");
      *(float *)&v117 = a14;
      objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v114, v115, v117);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      v184[6] = v119;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v120, (uint64_t)v184, v183, 7);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(v162, v122, (uint64_t)v121);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v116)
      v25 = v166;
      if (v106)
      {
        v123 = v61;
        thresholdedSobel = self->_thresholdedSobel;
        v159 = v123;
        v182[0] = v123;
        v181[0] = CFSTR("inputTex");
        v181[1] = CFSTR("threshold");
        *(float *)&v125 = fgFgBgThreshold;
        objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v126, v127, v125);
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v182[1] = v130;
        v181[2] = CFSTR("outputTex");
        v132 = v186;
        v133 = v186;
        if (!v186)
        {
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v128, v129);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v182[2] = v133;
        v182[3] = v175;
        v181[3] = CFSTR("_renderContext");
        v181[4] = CFSTR("_kernelScale");
        *(float *)&v131 = a14;
        objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v128, v129, v131);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v182[4] = v134;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v135, (uint64_t)v182, v181, 5);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageByApplyingParameters_(thresholdedSobel, v137, (uint64_t)v136);
        v138 = objc_claimAutoreleasedReturnValue();

        if (!v132)
        morphology = self->_morphology;
        v179[0] = *MEMORY[0x24BDBF978];
        objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v140, fgBgDilationSize);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v144 = *MEMORY[0x24BDBF960];
        v180[0] = v143;
        v180[1] = v138;
        v161 = (void *)v138;
        v179[1] = v144;
        v179[2] = CFSTR("inputDoMin");
        v180[2] = &unk_251C9CC30;
        v180[3] = v175;
        v145 = *MEMORY[0x24BDBF9C8];
        v179[3] = CFSTR("_renderContext");
        v179[4] = v145;
        v146 = v187;
        v147 = v187;
        if (!v187)
        {
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v141, v142);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v180[4] = v147;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v141, (uint64_t)v180, v179, 5);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageByApplyingParameters_(morphology, v149, (uint64_t)v148);
        v150 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v146)
        blendBackgroundBlur = self->_blendBackgroundBlur;
        v177[0] = CFSTR("disparityRefinementTex");
        v177[1] = CFSTR("modifiedBackgroundTex");
        v178[0] = v159;
        v178[1] = v150;
        v177[2] = CFSTR("dstTex");
        v154 = v30;
        v28 = v171;
        if (!v30)
        {
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v151, v152);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v177[3] = CFSTR("_renderContext");
        v178[2] = v154;
        v178[3] = v175;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v151, (uint64_t)v178, v177, 4);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageByApplyingParameters_(blendBackgroundBlur, v156, (uint64_t)v155);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        v62 = v173;
        v25 = v166;
        v63 = v170;
      }
      else
      {
        v28 = v171;
        v62 = v173;
      }
      for (j = 16; j != -8; j -= 8)

      v57 = v174;
      v26 = v163;
      v54 = v165;
    }
    else
    {
      v54 = v29;
      passthrough = self->_passthrough;
      v196[0] = CFSTR("slmParamsTex");
      v56 = v26;
      v197[0] = v26;
      v196[1] = CFSTR("inputShiftMapTex");
      v57 = v174;
      v197[1] = v174;
      v196[2] = CFSTR("outputBlurmapTex");
      v58 = v30;
      if (!v30)
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v47, v48);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v197[2] = v58;
      v196[3] = CFSTR("_renderContext");
      v197[3] = v31;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v47, (uint64_t)v197, v196, 4);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(passthrough, v60, (uint64_t)v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v30)
      v62 = v173;
      v26 = v56;
      v63 = v170;
      v28 = v171;
    }
  }

  return v61;
}

- (id)performSLMCalculatorUsingParams:(const simple_lens_model_params *)a3 inputShiftMap:(id)a4 faceMaskParams:(const face_mask_params *)a5 version:(int)a6 context:(id)a7 isFGBlurEnabled:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  void *v16;
  UniRunInfo *v17;
  const char *v18;
  void *v19;
  UniKernel *slmMinMax;
  UniImage *minMaxTex;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  UniRunInfo *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  void *v30;
  _BOOL4 v31;
  BOOL v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  float v39;
  _QWORD *v40;
  float v41;
  float v42;
  BOOL v43;
  BOOL v44;
  UniImage *outputParamsImage;
  void *v46;
  const char *v47;
  UniKernel *v48;
  UniKernel *v49;
  const char *v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  _BOOL4 v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _OWORD v66[4];
  uint64_t v67;
  __int128 v68;
  uint64_t v69;
  int64x2_t v70;
  uint64_t v71;
  __int128 v72;
  uint64_t v73;
  int64x2_t v74;
  uint64_t v75;
  _QWORD v76[5];
  _QWORD v77[5];
  _QWORD v78[3];
  _QWORD v79[5];

  v8 = a8;
  v79[3] = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v15 = a7;
  if (!v14)
    sub_24B6EEEBC();
  if (!a3)
    sub_24B6EEEE4();
  v16 = v15;
  v60 = v8;
  v17 = [UniRunInfo alloc];
  v74 = vdupq_n_s64(1uLL);
  v75 = 1;
  v72 = xmmword_24B6F5670;
  v73 = 1;
  v19 = (void *)objc_msgSend_initWithThreadgroupsPerGrid_threadsPerThreadGroup_(v17, v18, (uint64_t)&v74, &v72);
  slmMinMax = self->_slmMinMax;
  v78[0] = CFSTR("inputBlurMapTex");
  v78[1] = CFSTR("outputMinMaxParamsTex");
  minMaxTex = self->_minMaxTex;
  v79[0] = v14;
  v79[1] = minMaxTex;
  v78[2] = CFSTR("_renderContext");
  v79[2] = v16;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v22, (uint64_t)v79, v78, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByApplyingParameters_runInfo_(slmMinMax, v24, (uint64_t)v23, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    sub_24B6EEF0C();
  v26 = [UniRunInfo alloc];
  v70 = vdupq_n_s64(1uLL);
  v71 = 1;
  v68 = xmmword_24B6F5680;
  v69 = 1;
  v61 = (void *)objc_msgSend_initWithThreadgroupsPerGrid_threadsPerThreadGroup_(v26, v27, (uint64_t)&v70, &v68);
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v28, (uint64_t)a3, 56);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_2544D9CA0 != -1)
    dispatch_once(&qword_2544D9CA0, &unk_251C8F7E8);
  v31 = 0;
  v67 = 0;
  memset(v66, 0, sizeof(v66));
  if (byte_2579AEB78)
    v32 = byte_2579AEB79 == 0;
  else
    v32 = a6 < 4;
  if (a5 && !v32)
  {
    v33 = 0;
    v34 = *(_OWORD *)&a5->var12;
    v35 = *(_OWORD *)&a5[1].var1;
    v36 = *(_OWORD *)&a5[1].var5;
    v37 = *(_OWORD *)&a5[1].var9;
    do
    {
      v62 = v34;
      LODWORD(v38) = *(_DWORD *)((unint64_t)&v62 & 0xFFFFFFFFFFFFFFF3 | (4 * (v33 & 3)));
      v63 = v35;
      v39 = *(float *)((unint64_t)&v63 & 0xFFFFFFFFFFFFFFF3 | (4 * (v33 & 3)));
      v43 = *(float *)&v38 == -1.0;
      *((float *)&v38 + 1) = v39;
      v40 = (_QWORD *)v66 + v33;
      *v40 = v38;
      v64 = v36;
      v41 = *(float *)((unint64_t)&v64 & 0xFFFFFFFFFFFFFFF3 | (4 * (v33 & 3)));
      v65 = v37;
      v42 = *(float *)((unint64_t)&v65 & 0xFFFFFFFFFFFFFFF3 | (4 * (v33 & 3)));
      v40[4] = __PAIR64__(LODWORD(v42), LODWORD(v41));
      v43 = v43 || v39 == -1.0;
      if (!v43 || (v41 != -1.0 ? (v44 = v42 == -1.0) : (v44 = 1), !v44))
        LODWORD(v67) = v67 + 1;
      ++v33;
    }
    while (v33 != 4);
    v31 = (int)v67 > 0;
  }
  v76[0] = CFSTR("inputParams");
  v76[1] = CFSTR("minMaxParamsTex");
  v77[0] = v30;
  v77[1] = v25;
  v76[2] = CFSTR("inputShiftMapTex");
  v76[3] = CFSTR("outputParamTexture");
  outputParamsImage = self->_outputParamsImage;
  v77[2] = v14;
  v77[3] = outputParamsImage;
  v76[4] = CFSTR("_renderContext");
  v77[4] = v16;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v29, (uint64_t)v77, v76, 5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = self->_slmCalc;
  if (v31)
  {
    v49 = self->_slmCalcEyes;

    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v50, (uint64_t)v46);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v52, (uint64_t)v66, 72);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v51, v54, (uint64_t)v53, CFSTR("inputEyes"));

    if (v60)
      objc_msgSend_setObject_forKeyedSubscript_(v51, v55, (uint64_t)&unk_251C9D680, CFSTR("nearestEyeWeight"));
    else
      objc_msgSend_setObject_forKeyedSubscript_(v51, v55, (uint64_t)&unk_251C9D690, CFSTR("nearestEyeWeight"));
    objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v56, (uint64_t)v51);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v49;
  }
  objc_msgSend_imageByApplyingParameters_runInfo_(v48, v47, (uint64_t)v46, v61);
  v57 = objc_claimAutoreleasedReturnValue();
  if (!v57)
    sub_24B6EEF34();
  v58 = (void *)v57;

  return v58;
}

- (id)enqueueBoundaryMaskPassForInputTex:(id)a3 inputSecondaryTex:(id)a4 intermediateTex:(id)a5 thresholdValue:(float)a6 boundaryScalingFactor:(float)a7 outputTex:(id)a8 blurRadius:(float)a9 passName:(id)a10 scale:(float)a11 context:(id)a12
{
  id v21;
  id v22;
  id v23;
  id v24;
  const char *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  UniRunInfo *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  UniKernel *thresholdHard;
  double v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  double v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  double v51;
  UniGaussianBlur *gaussian;
  void *v53;
  void *v54;
  double v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  void *v62;
  UniRunInfo *v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  double v70;
  UniKernel *mapLinear;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  double v84;
  double v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  void *v89;
  const char *v90;
  void *v91;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  void *v97;
  id v98;
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[5];
  _QWORD v103[5];
  _QWORD v104[6];
  _QWORD v105[6];
  _QWORD v106[5];
  _QWORD v107[5];
  _QWORD v108[5];
  _QWORD v109[7];

  v109[5] = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v98 = a4;
  v22 = a5;
  v23 = a8;
  v24 = a12;
  objc_msgSend_extent(v23, v25, v26);
  v28 = v27;
  v30 = v29;
  v31 = [UniRunInfo alloc];
  v101[0] = (unint64_t)(v28 * 0.5);
  v101[1] = (unint64_t)(v30 * 0.5);
  v101[2] = 1;
  v33 = (void *)objc_msgSend_initWithGridSize_kernel_(v31, v32, (uint64_t)v101, self->_thresholdHard);
  objc_msgSend_setCoreImageOutputExtent_(v33, v34, v35, 0.0, 0.0, v28, v30);
  thresholdHard = self->_thresholdHard;
  v108[0] = CFSTR("inputTex");
  v108[1] = CFSTR("outputTex");
  v97 = v21;
  v109[0] = v21;
  v109[1] = v23;
  v93 = v23;
  v108[2] = CFSTR("value");
  *(float *)&v37 = a6;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v38, v39, v37);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v109[2] = v40;
  v109[3] = v24;
  v108[3] = CFSTR("_renderContext");
  v108[4] = CFSTR("_scale");
  *(float *)&v41 = a11;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v42, v43, v41);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v109[4] = v44;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v45, (uint64_t)v109, v108, 5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = v33;
  objc_msgSend_imageByApplyingParameters_runInfo_(thresholdHard, v47, (uint64_t)v46, v33);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  gaussian = self->_gaussian;
  v107[0] = v48;
  v106[0] = CFSTR("inputImage");
  v106[1] = CFSTR("outputImage");
  v53 = v22;
  if (!v22)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v49, v50);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v107[1] = v53;
  v106[2] = CFSTR("inputRadius");
  *(float *)&v51 = a9;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v49, v50, v51);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v107[2] = v54;
  v107[3] = v24;
  v95 = v24;
  v106[3] = CFSTR("_renderContext");
  v106[4] = CFSTR("_scale");
  *(float *)&v55 = a11;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v56, v57, v55);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v107[4] = v58;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v59, (uint64_t)v107, v106, 5);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByApplyingParameters_(gaussian, v61, (uint64_t)v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v96 = v22;
  if (!v22)

  v63 = [UniRunInfo alloc];
  if (v98)
  {
    v100[0] = (unint64_t)(v28 * 0.5);
    v100[1] = (unint64_t)(v30 * 0.5);
    v100[2] = 1;
    v65 = (void *)objc_msgSend_initWithGridSize_kernel_(v63, v64, (uint64_t)v100, self->_mapLinear);
    objc_msgSend_setCoreImageOutputExtent_(v65, v66, v67, 0.0, 0.0, v28, v30);
    mapLinear = self->_mapLinear;
    v104[0] = CFSTR("inputTex0");
    v104[1] = CFSTR("inputTex1");
    v105[0] = v62;
    v105[1] = v98;
    v104[2] = CFSTR("outputTex");
    v72 = v93;
    v73 = v95;
    if (!v93)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v68, v69);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v105[2] = v72;
    v104[3] = CFSTR("scalingFactor");
    *(float *)&v70 = a7;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v68, v69, v70);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v105[3] = v74;
    v105[4] = v95;
    v104[4] = CFSTR("_renderContext");
    v104[5] = CFSTR("_scale");
    *(float *)&v75 = a11;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v76, v77, v75);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v105[5] = v78;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v79, (uint64_t)v105, v104, 6);
  }
  else
  {
    v99[0] = (unint64_t)(v28 * 0.5);
    v99[1] = (unint64_t)(v30 * 0.5);
    v99[2] = 1;
    v65 = (void *)objc_msgSend_initWithGridSize_kernel_(v63, v64, (uint64_t)v99, self->_mapLinearNoSecondary);
    objc_msgSend_setCoreImageOutputExtent_(v65, v80, v81, 0.0, 0.0, v28, v30);
    mapLinear = self->_mapLinearNoSecondary;
    v103[0] = v62;
    v102[0] = CFSTR("inputTex0");
    v102[1] = CFSTR("outputTex");
    v72 = v93;
    v73 = v95;
    if (!v93)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v82, v83);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v103[1] = v72;
    v102[2] = CFSTR("scalingFactor");
    *(float *)&v84 = a7;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v82, v83, v84);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v103[2] = v74;
    v103[3] = v95;
    v102[3] = CFSTR("_renderContext");
    v102[4] = CFSTR("_scale");
    *(float *)&v85 = a11;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v86, v87, v85);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v103[4] = v78;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v88, (uint64_t)v103, v102, 5);
  }
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageByApplyingParameters_runInfo_(mapLinear, v90, (uint64_t)v89, v65);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v93)
  return v91;
}

- (id)_smallerTextureFromTexture:(id)a3 modelTexture:(id)a4 targetSize:(CGSize)a5 numTextures:(unsigned int)a6 pixelFormat:(unint64_t)a7
{
  double height;
  double width;
  id v12;
  id v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  UniFakeImage *v36;
  const char *v37;
  const char *v38;
  void *v39;
  void *v40;
  BOOL v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  id v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  void *v89;
  void *v90;
  const char *v91;
  id v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  id v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  uint8_t buf[4];
  const char *v105;
  __int16 v106;
  uint64_t v107;
  __int16 v108;
  unint64_t v109;
  uint64_t v110;

  height = a5.height;
  width = a5.width;
  v110 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  objc_msgSend__mtlTextureForImage_(UniKernel, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__mtlTextureForImage_(UniKernel, v16, (uint64_t)v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v102 = v17;
    v20 = (void *)MEMORY[0x24BDBF660];
    objc_msgSend_blackColor(MEMORY[0x24BDBF638], v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithColor_(v20, v22, (uint64_t)v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_imageByCroppingToRect_(v23, v24, v25, 0.0, 0.0, width, height);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = a6;
    objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v28, a6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a7)
    {
      objc_msgSend_fakeFormat(v13, v29, v30);
      v32 = v15;
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      a7 = objc_msgSend_unsignedIntValue(v33, v34, v35);

      v15 = v32;
    }
    v36 = [UniFakeImage alloc];
    v39 = (void *)objc_msgSend_initWithCIImage_format_(v36, v37, (uint64_t)v26, a7);
    if (a6)
    {
      do
      {
        objc_msgSend_addObject_(v31, v38, (uint64_t)v39);
        --v27;
      }
      while (v27);
    }
    objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v38, (uint64_t)v31);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v102;
  }
  else
  {
    if (v15)
      v41 = v17 == 0;
    else
      v41 = 1;
    if (v41)
    {
      uni_logger_api();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        sub_24B6EEF5C(v42, v43, v44, v45, v46, v47, v48, v49);

      v40 = 0;
    }
    else
    {
      v99 = v13;
      v100 = v12;
      objc_msgSend_device(v17, v18, v19);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_buffer(v17, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend_bufferOffset(v17, v54, v55);
      v59 = v56;
      if (!a7)
        a7 = objc_msgSend_pixelFormat(v15, v57, v58);
      v101 = v15;
      objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(MEMORY[0x24BDDD740], v57, a7, (unint64_t)width, (unint64_t)height, 0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUsage_(v60, v61, 19);
      v63 = objc_msgSend_minimumLinearTextureAlignmentForPixelFormat_(v50, v62, a7);
      v103 = v50;
      MTLPixelFormatGetInfoForDevice();
      v64 = (v63 - 1) & -v63;
      v65 = v64 * (unint64_t)height;
      v66 = a6;
      if (v65 * a6 > objc_msgSend_allocatedSize(v17, v67, v68))
      {
        uni_logger_performance();
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446722;
          v105 = "-[MakeBlurMap _smallerTextureFromTexture:modelTexture:targetSize:numTextures:pixelFormat:]";
          v106 = 2048;
          v107 = objc_msgSend_allocatedSize(v17, v71, v72);
          v108 = 2048;
          v109 = v65 * a6;
          _os_log_impl(&dword_24B6B5000, v70, OS_LOG_TYPE_INFO, "%{public}s Insufficient backing size = %ld need %ld", buf, 0x20u);
        }

        v53 = 0;
      }
      objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v69, a6);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if (a6)
      {
        while (1)
        {
          uni_logger_performance();
          v75 = objc_claimAutoreleasedReturnValue();
          v76 = v75;
          if (v53)
          {
            if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
            {
              objc_msgSend_description(v60, v77, v78);
              v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v82 = objc_msgSend_UTF8String(v79, v80, v81);
              *(_DWORD *)buf = 136446466;
              v105 = "-[MakeBlurMap _smallerTextureFromTexture:modelTexture:targetSize:numTextures:pixelFormat:]";
              v106 = 2080;
              v107 = v82;
              _os_log_impl(&dword_24B6B5000, v76, OS_LOG_TYPE_INFO, "%{public}s Creating texture at runtime from existing buffer %s", buf, 0x16u);

            }
            v84 = objc_msgSend_newTextureWithDescriptor_offset_bytesPerRow_(v53, v83, (uint64_t)v60, v59, v64);
          }
          else
          {
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend_description(v60, v86, v87);
              v92 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v95 = objc_msgSend_UTF8String(v92, v93, v94);
              *(_DWORD *)buf = 136446466;
              v105 = "-[MakeBlurMap _smallerTextureFromTexture:modelTexture:targetSize:numTextures:pixelFormat:]";
              v106 = 2080;
              v107 = v95;
              _os_log_debug_impl(&dword_24B6B5000, v76, OS_LOG_TYPE_DEBUG, "%{public}s Creating texture at runtime %s", buf, 0x16u);

            }
            v84 = objc_msgSend_newTextureWithDescriptor_(v103, v88, (uint64_t)v60);
          }
          v89 = (void *)v84;
          if (!v84)
            break;
          objc_msgSend_imageWithMTLTexture_(UniImage, v85, v84);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v74, v91, (uint64_t)v90);

          v59 += v65;
          if (!--v66)
            goto LABEL_32;
        }
        uni_logger_performance();
        v96 = (char *)objc_claimAutoreleasedReturnValue();
        v13 = v99;
        v12 = v100;
        if (os_log_type_enabled((os_log_t)v96, OS_LOG_TYPE_DEBUG))
          sub_24B6EEFCC(v60, v96, v97);

        v40 = (void *)MEMORY[0x24BDBD1A8];
      }
      else
      {
LABEL_32:
        objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v73, (uint64_t)v74);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v99;
        v12 = v100;
      }

      v15 = v101;
    }
  }

  return v40;
}

- (id)_smallerTextureFromTexture:(id)a3 modelTexture:(id)a4 targetSize:(CGSize)a5 pixelFormat:(unint64_t)a6
{
  void *v6;
  const char *v7;
  void *v8;

  objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_numTextures_pixelFormat_(self, a2, (uint64_t)a3, a4, 1, a6, a5.width, a5.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_smallerTextureFromTexture:(id)a3 modelTexture:(id)a4 targetSize:(CGSize)a5
{
  return (id)objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_pixelFormat_(self, a2, (uint64_t)a3, a4, 0, a5.width, a5.height);
}

- (id)_smallerTextureFromTexture:(id)a3 modelTexture:(id)a4 targetSize:(CGSize)a5 numTextures:(unsigned int)a6
{
  return (id)objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_numTextures_pixelFormat_(self, a2, (uint64_t)a3, a4, *(_QWORD *)&a6, 0, a5.width, a5.height);
}

- (id)_scaleImage:(id)a3 targetSize:(CGSize)a4 sourceSize:(CGSize)a5 device:(id)a6 outputImage:(id)a7 context:(id)a8
{
  double height;
  double width;
  double v13;
  double v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char isKindOfClass;
  double v20;
  double v21;
  BOOL v22;
  id v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  UniScaleImage *v31;
  const char *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  const char *v40;
  void *v41;
  id v42;
  _QWORD v44[4];
  _QWORD v45[5];

  height = a5.height;
  width = a5.width;
  v13 = a4.height;
  v14 = a4.width;
  v45[4] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v15
    && (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v17)
    && (isKindOfClass & 1) != 0
    && ((v20 = v14 / width, v21 = v13 / height, v20 == 1.0) ? (v22 = v21 == 1.0) : (v22 = 0), !v22))
  {
    v23 = v16;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend__mtlTextureForImage_(UniKernel, v24, (uint64_t)v17);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v25;
      if (v25 && objc_msgSend_conformsToProtocol_(v25, v26, (uint64_t)&unk_2579B9140))
      {
        objc_msgSend_device(v27, v28, v29);
        v30 = objc_claimAutoreleasedReturnValue();

        v23 = (id)v30;
      }

    }
    v31 = [UniScaleImage alloc];
    v33 = (void *)objc_msgSend_initWithDevice_(v31, v32, (uint64_t)v23);
    v44[0] = *MEMORY[0x24BDBF988];
    objc_msgSend_vectorWithX_Y_(MEMORY[0x24BDBF690], v34, v35, v20, v21);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x24BDBF9C8];
    v44[1] = *MEMORY[0x24BDBF960];
    v44[2] = v37;
    v45[0] = v36;
    v45[1] = v15;
    v44[3] = CFSTR("_renderContext");
    v45[2] = v17;
    v45[3] = v18;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v38, (uint64_t)v45, v44, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingParameters_(v33, v40, (uint64_t)v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v41;
  }
  else
  {
    v42 = v15;
  }

  return v42;
}

- (id)_scaleImage:(id)a3 targetSize:(CGSize)a4 device:(id)a5 useBoxFiltering:(BOOL)a6 outputImage:(id)a7 context:(id)a8
{
  double height;
  double width;
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  uint64_t v20;
  double v21;
  double v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  const char *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double x;
  double y;
  double v42;
  double v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  UniFakeImage *v53;
  const char *v54;
  uint64_t v55;
  UniKernel *crispHairDownsamplingSingle;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  const char *v62;
  void *v63;
  const char *v64;
  id v65;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  UniScaleImage *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  void *v79;
  CGAffineTransform v80;
  _QWORD v81[5];
  _QWORD v82[5];
  _QWORD v83[4];
  _QWORD v84[5];
  CGRect v85;
  CGRect v86;

  height = a4.height;
  width = a4.width;
  v84[4] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_extent(v15, v19, v20);
      v22 = width / v21;
      objc_msgSend_extent(v15, v23, v24);
      v26 = height / v25;
      if (v22 != 1.0 || v26 != 1.0)
      {
        v29 = v16;
        if (v29)
        {
          if (a6)
          {
LABEL_9:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend_extent(v15, v30, v31);
              v33 = v32;
              v35 = v34;
              v37 = v36;
              v39 = v38;
              CGAffineTransformMakeScale(&v80, v22, v26);
              v85.origin.x = v33;
              v85.origin.y = v35;
              v85.size.width = v37;
              v85.size.height = v39;
              v86 = CGRectApplyAffineTransform(v85, &v80);
              x = v86.origin.x;
              y = v86.origin.y;
              v42 = v86.size.width;
              v43 = v86.size.height;
              v44 = (void *)MEMORY[0x24BDBF660];
              objc_msgSend_blackColor(MEMORY[0x24BDBF638], v45, v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_imageWithColor_(v44, v48, (uint64_t)v47);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_imageByCroppingToRect_(v49, v50, v51, x, y, v42, v43);
              v52 = (void *)objc_claimAutoreleasedReturnValue();

              v53 = [UniFakeImage alloc];
              v55 = objc_msgSend_initWithCIImage_(v53, v54, (uint64_t)v52);

              v17 = (id)v55;
            }
            crispHairDownsamplingSingle = self->_crispHairDownsamplingSingle;
            v81[0] = CFSTR("inputScaleX");
            objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v30, v31, v22);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v82[0] = v57;
            v81[1] = CFSTR("inputScaleY");
            objc_msgSend_numberWithDouble_(MEMORY[0x24BDD16E0], v58, v59, v26);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = *MEMORY[0x24BDBF9C8];
            v81[2] = *MEMORY[0x24BDBF960];
            v81[3] = v61;
            v82[1] = v60;
            v82[2] = v15;
            v81[4] = CFSTR("_renderContext");
            v82[3] = v17;
            v82[4] = v18;
            objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v62, (uint64_t)v82, v81, 5);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_imageByApplyingParameters_(crispHairDownsamplingSingle, v64, (uint64_t)v63);
            goto LABEL_20;
          }
        }
        else
        {
          objc_msgSend__mtlTextureForImage_(UniKernel, v28, (uint64_t)v17);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v67;
          if (v67 && objc_msgSend_conformsToProtocol_(v67, v68, (uint64_t)&unk_2579B9140))
          {
            objc_msgSend_device(v69, v70, v71);
            v29 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v29 = 0;
          }

          if (a6)
            goto LABEL_9;
        }
        v72 = [UniScaleImage alloc];
        v57 = (void *)objc_msgSend_initWithDevice_(v72, v73, (uint64_t)v29);
        v83[0] = *MEMORY[0x24BDBF988];
        objc_msgSend_vectorWithX_Y_(MEMORY[0x24BDBF690], v74, v75, v22, v26);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = *MEMORY[0x24BDBF9C8];
        v83[1] = *MEMORY[0x24BDBF960];
        v83[2] = v76;
        v84[0] = v60;
        v84[1] = v15;
        v83[3] = CFSTR("_renderContext");
        v84[2] = v17;
        v84[3] = v18;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v77, (uint64_t)v84, v83, 4);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageByApplyingParameters_(v57, v78, (uint64_t)v63);
LABEL_20:
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        v65 = v79;
        goto LABEL_13;
      }
    }
  }
  v65 = v15;
LABEL_13:

  return v65;
}

- (id)enqueueRefinementUsingParams:(const blurmap_refinement_params *)a3 maskParams:(const face_mask_params *)a4 inputBlurMap:(id)a5 inputAlpha:(id)a6 inputHair:(id)a7 inputGlasses:(id)a8 inputAlphaMaskDelta:(id)a9 inputHairMaskDelta:(id)a10 inputBlurRefineIntermediate:(id)a11 outputBlurMap:(id)a12 scale:(float)a13 inputsAlreadyScaled:(BOOL)a14 context:(id)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  int v29;
  void *v30;
  double var15;
  double v32;
  double var16;
  double v34;
  _BOOL4 v35;
  _BOOL4 v36;
  _BOOL4 v37;
  _BOOL4 v38;
  const char *v39;
  double v40;
  double v41;
  double var2;
  uint64_t v43;
  unsigned int v44;
  char v45;
  uint64_t v46;
  double v47;
  float *v48;
  double v49;
  double v50;
  float v51;
  double v52;
  double v53;
  double width;
  double height;
  float var0;
  float var1;
  char *v58;
  float32x2_t v59;
  float32x2_t v60;
  float32x2_t v61;
  float32x2_t v62;
  float32x2_t v63;
  int32x2_t v64;
  float32x2_t v65;
  float32x2_t v66;
  float32x2_t v67;
  int32x2_t v68;
  float32x2_t v69;
  float32x2_t v70;
  float32x2_t v71;
  double v72;
  double v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  float v77;
  float v78;
  float v79;
  float var3;
  float v81;
  void *v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  id v87;
  void *v88;
  id v89;
  const char *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  MakeBlurMap *v95;
  uint64_t v96;
  id v97;
  UniScaleImage *v98;
  const char *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  float v113;
  float v114;
  void *v115;
  const char *v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  MakeBlurMap *v122;
  void *v123;
  UniScaleImage *v124;
  const char *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  float v141;
  float v142;
  float v144;
  float v145;
  float v147;
  __int128 v148;
  float v149;
  float v150;
  __int128 v151;
  const char *v158;
  UniRunInfo *v159;
  const char *v160;
  uint64_t v161;
  MakeBlurMap *v162;
  UniImage *faceParamsTex;
  UniKernel *faceMaskCalc;
  const char *v165;
  void *v166;
  const char *v167;
  UniRunInfo *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
  UniImage *eyeProtectionFacesTex;
  const char *v174;
  void *v175;
  void *v176;
  id v177;
  const char *v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  const char *v182;
  id v183;
  double v184;
  double v185;
  uint64_t v186;
  double v187;
  double v188;
  void *v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  void *v205;
  const char *v206;
  void *v207;
  const char *v208;
  char v209;
  void *v210;
  char v211;
  char v212;
  int v213;
  int v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  void *v226;
  const char *v227;
  void *v228;
  char isKindOfClass;
  const char *v230;
  uint64_t v231;
  void *v232;
  void *v233;
  const char *v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  void *v238;
  UniFakeImage *v239;
  const char *v240;
  void *v241;
  const char *v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  const char *v246;
  void *v247;
  const char *v248;
  uint64_t v249;
  const char *v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  id v255;
  UniRunInfo *v256;
  float64x2_t v257;
  const char *v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  double v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  const char *v271;
  void *v272;
  const char *v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  const char *v283;
  void *v284;
  const char *v285;
  void *v286;
  const char *v287;
  void *v288;
  const char *v289;
  const char *v290;
  const char *v291;
  void *v292;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  id v303;
  uint64_t v304;
  void *v306;
  void *v307;
  id v308;
  void *v309;
  void *v310;
  int v311;
  id v312;
  id v313;
  double v314;
  void *v315;
  int64x2_t v316;
  double v317;
  uint64x2_t v318;
  uint64_t v319;
  __int128 v320;
  uint64_t v321;
  int64x2_t v322;
  uint64_t v323;
  __int128 v324;
  uint64_t v325;
  int64x2_t v326;
  uint64_t v327;
  __int128 v328;
  float32x4_t v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  _OWORD v334[4];
  _QWORD v335[9];
  _QWORD v336[9];
  _QWORD v337[3];
  _QWORD v338[3];
  _QWORD v339[5];
  _QWORD v340[5];
  _QWORD v341[4];
  _QWORD v342[4];
  _QWORD v343[4];
  _QWORD v344[4];
  _QWORD v345[4];
  _QWORD v346[7];
  CGRect v347;
  CGRect v348;

  v346[4] = *MEMORY[0x24BDAC8D0];
  v308 = a5;
  v21 = a6;
  v313 = a7;
  v312 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v303 = a12;
  v25 = a15;
  v26 = v22;
  v27 = v23;
  if (qword_2544D9C88 != -1)
    dispatch_once(&qword_2544D9C88, &unk_251C8F808);
  if (v312)
    _ZF = byte_2579AEA48 == 0;
  else
    _ZF = 1;
  v29 = !_ZF;
  v311 = v29;
  if (!a3)
    sub_24B6EF07C();
  if (!a4)
    sub_24B6EF0A4();
  v304 = (uint64_t)v24;
  v30 = v21;
  var15 = a3->var15;
  v32 = a3->var13 - var15 * 0.5;
  var16 = a3->var16;
  v34 = 1.0 - a3->var14 - var16 * 0.5;
  v35 = sub_24B6CD06C((uint64_t)a4, 0);
  LOBYTE(v328) = v35;
  v36 = sub_24B6CD06C((uint64_t)a4, 1);
  BYTE1(v328) = v36;
  v37 = sub_24B6CD06C((uint64_t)a4, 2);
  BYTE2(v328) = v37;
  v38 = sub_24B6CD06C((uint64_t)a4, 3);
  v43 = 0;
  BYTE3(v328) = v38;
  v44 = v36 + v35 + v37 + v38;
  while (!*((_BYTE *)&v328 + v43))
  {
    if (++v43 == 4)
    {
      v45 = 0;
      goto LABEL_16;
    }
  }
  v45 = v43;
LABEL_16:
  if (v44 >= 2)
  {
    v46 = 0;
    v47 = 0.0;
    do
    {
      if (*((_BYTE *)&v328 + v46))
      {
        v48 = &a4->var0 + (v46 & 3);
        v49 = (float)(1.0 - v48[32]);
        v50 = v48[12];
        v51 = 1.0 - v48[16];
        if ((float)(1.0 - v48[24]) >= v51)
          v51 = 1.0 - v48[24];
        v53 = v51 - v49;
        v347.origin.x = v32;
        v347.origin.y = v34;
        v347.size.width = var15;
        v347.size.height = var16;
        v52 = v48[20] - v50;
        v348 = CGRectIntersection(v347, *(CGRect *)&v50);
        width = v348.size.width;
        height = v348.size.height;
        if (!CGRectIsNull(v348))
        {
          v40 = width * height;
          if (width * height > v47)
          {
            v47 = width * height;
            v45 = v46;
          }
        }
      }
      ++v46;
    }
    while (v46 != 4);
  }
  var0 = a3->var9.var0;
  var1 = a3->var9.var1;
  v58 = (char *)(&a4->var0 + (v45 & 3));
  v59.i32[0] = *((_DWORD *)v58 + 12);
  if (fminf(v59.f32[0], *((float *)v58 + 16)) < 0.0
    || (v60.i32[0] = *((_DWORD *)v58 + 20), fminf(v60.f32[0], *((float *)v58 + 24)) < 0.0)
    || (v61.i32[0] = *((_DWORD *)v58 + 4), fminf(v61.f32[0], *((float *)v58 + 8)) < 0.0)
    || (v62.i32[0] = *((_DWORD *)v58 + 28), fminf(v62.f32[0], *((float *)v58 + 32)) < 0.0))
  {
    v73 = (float)((float)(var1 + var1) * 0.5);
  }
  else
  {
    v62.i32[1] = *((_DWORD *)v58 + 32);
    v61.i32[1] = *((_DWORD *)v58 + 8);
    v60.i32[1] = *((_DWORD *)v58 + 24);
    v59.i32[1] = *((_DWORD *)v58 + 16);
    v63 = vsub_f32(v59, v60);
    v64 = (int32x2_t)vmul_f32(v63, v63);
    v65 = vsub_f32(v59, v61);
    v66 = vsub_f32(v60, v61);
    v67 = vsub_f32(v61, v62);
    v68 = (int32x2_t)vmul_f32(v67, v67);
    v69 = vmaxnm_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v64, v68), (float32x2_t)vzip2_s32(v64, v68))), (float32x2_t)vdup_n_s32(0x3A83126Fu));
    v70 = vsub_f32(v59, v62);
    v71 = vsub_f32(v60, v62);
    v72 = fmaxf(sqrtf(vaddv_f32(vmul_f32(v65, v65))), 0.001) * -3.3737
        + v69.f32[0] * -12.1925
        + fmaxf(sqrtf(vaddv_f32(vmul_f32(v66, v66))), 0.001) * -3.025
        + v69.f32[1] * -11.9485
        + fmaxf(sqrtf(vaddv_f32(vmul_f32(v70, v70))), 0.001) * 1.6734
        + fmaxf(sqrtf(vaddv_f32(vmul_f32(v71, v71))), 0.001) * 1.8423
        + vmuls_lane_f32(v69.f32[0], v69, 1) * 47.7061
        + 3.1214;
    var2 = a3->var9.var2;
    v73 = var1;
    if (a3->var9.var3 + v72 * var2 < v73)
      v73 = a3->var9.var3 + v72 * var2;
    v41 = var0;
    if (v73 < var0)
      v73 = var0;
  }
  v74 = v308;
  v75 = (uint64_t)v30;
  v76 = (uint64_t)v313;
  v77 = v73;
  v78 = fmaxf(fmaxf(var0, v77), 0.00001);
  v79 = (float)(1.0 / v78) - (float)(1.0 / (float)(a3->var8 + v78));
  v298 = v26;
  v300 = v27;
  v307 = v25;
  if (v30 && (var3 = a3->var0.var3, var3 > 0.0))
  {
    v81 = (float)(v79 * var3) * a3->var3;
    if (a13 == 1.0 || a14)
    {
      v96 = v304;
      v97 = v25;
    }
    else
    {
      objc_msgSend__mtlTextureForImage_(UniKernel, v39, (uint64_t)v26);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v82;
      if (v82 && objc_msgSend_conformsToProtocol_(v82, v83, (uint64_t)&unk_2579B9140))
      {
        v87 = v25;
        objc_msgSend_device(v84, v85, v86);
        v88 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v87 = v25;
        v88 = 0;
      }
      v98 = [UniScaleImage alloc];
      v100 = (void *)objc_msgSend_initWithDevice_(v98, v99, (uint64_t)v88);
      v345[0] = *MEMORY[0x24BDBF988];
      objc_msgSend_vectorWithX_Y_(MEMORY[0x24BDBF690], v101, v102, a13, a13);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = *MEMORY[0x24BDBF960];
      v346[0] = v103;
      v346[1] = v30;
      v105 = *MEMORY[0x24BDBF9C8];
      v345[1] = v104;
      v345[2] = v105;
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v106, v107);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v345[3] = CFSTR("_renderContext");
      v346[2] = v108;
      v346[3] = v87;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v109, (uint64_t)v346, v345, 4);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(v100, v111, (uint64_t)v110);
      v112 = objc_claimAutoreleasedReturnValue();

      v75 = v112;
      v97 = v307;
      v74 = v308;
      v96 = v304;
      v26 = v298;
      v27 = v300;
      v76 = (uint64_t)v313;
    }
    *(float *)&v40 = a3->var0.var2;
    *(float *)&v41 = (float)a3->var0.var1;
    v95 = self;
    *(float *)&v73 = v81;
    *(float *)&var2 = a13;
    v89 = v97;
    objc_msgSend_enqueueBoundaryMaskPassForInputTex_inputSecondaryTex_intermediateTex_thresholdValue_boundaryScalingFactor_outputTex_blurRadius_passName_scale_context_(self, v39, v75, 0, v96, v26, CFSTR("Person"), v40, v73, v41, var2);
    v309 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v89 = v25;

    v309 = 0;
    v95 = self;
  }
  v299 = (void *)v75;
  if (v76 && (v113 = a3->var1.var3, v113 > 0.0))
  {
    v114 = (float)(v79 * v113) * a3->var3;
    if (a13 == 1.0 || a14)
    {
      v121 = v304;
      v122 = v95;
      v123 = v89;
    }
    else
    {
      objc_msgSend__mtlTextureForImage_(UniKernel, v90, (uint64_t)v27);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = v115;
      if (v115 && objc_msgSend_conformsToProtocol_(v115, v116, (uint64_t)&unk_2579B9140))
      {
        objc_msgSend_device(v117, v118, v119);
        v120 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v120 = 0;
      }
      v315 = (void *)v120;
      v124 = [UniScaleImage alloc];
      v126 = (void *)objc_msgSend_initWithDevice_(v124, v125, v120);
      v343[0] = *MEMORY[0x24BDBF988];
      objc_msgSend_vectorWithX_Y_(MEMORY[0x24BDBF690], v127, v128, a13, a13);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = *MEMORY[0x24BDBF960];
      v344[0] = v129;
      v344[1] = v313;
      v131 = *MEMORY[0x24BDBF9C8];
      v343[1] = v130;
      v343[2] = v131;
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v132, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v343[3] = CFSTR("_renderContext");
      v344[2] = v134;
      v344[3] = v89;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v135, (uint64_t)v344, v343, 4);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(v126, v137, (uint64_t)v136);
      v138 = objc_claimAutoreleasedReturnValue();

      v123 = v307;
      v76 = v138;
      v74 = v308;
      v121 = v304;
      v122 = self;
      v27 = v300;
      v75 = (uint64_t)v299;
    }
    *(float *)&v91 = a3->var1.var2;
    *(float *)&v93 = (float)a3->var1.var1;
    v95 = v122;
    v313 = (id)v76;
    *(float *)&v92 = v114;
    *(float *)&v94 = a13;
    v89 = v123;
    objc_msgSend_enqueueBoundaryMaskPassForInputTex_inputSecondaryTex_intermediateTex_thresholdValue_boundaryScalingFactor_outputTex_blurRadius_passName_scale_context_(v122, v90, v76, v75, v121, v27, CFSTR("Hair"), v123, v91, v92, v93, v94);
    v302 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v302 = 0;
  }

  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v139, (uint64_t)a4, 192);
  v140 = objc_claimAutoreleasedReturnValue();
  v141 = a3->var1.var0.var0;
  v142 = a3->var1.var0.var1 - v141;
  _Q0.f32[0] = 1.0 / v142;
  _Q0.f32[1] = (float)((float)(-1.0 / v142) * v141) + 0.0;
  _Q0.i32[2] = LODWORD(a3->var1.var0.var2);
  v144 = a3->var1.var0.var3;
  v145 = a3->var1.var0.var4 - v144;
  *(float *)&_Q1 = -1.0 / v145;
  *((float *)&_Q1 + 1) = (float)((float)(1.0 / v145) * v144) + 1.0;
  DWORD2(_Q1) = LODWORD(a3->var1.var0.var5);
  v147 = a3->var0.var0.var1 - a3->var0.var0.var0;
  *(float *)&v148 = 1.0 / v147;
  *((float *)&v148 + 1) = (float)((float)(-1.0 / v147) * a3->var0.var0.var0) + 0.0;
  DWORD2(v148) = LODWORD(a3->var0.var0.var2);
  v149 = a3->var0.var0.var3;
  v150 = a3->var0.var0.var4 - v149;
  *(float *)&v151 = -1.0 / v150;
  *((float *)&v151 + 1) = (float)((float)(1.0 / v150) * v149) + 1.0;
  DWORD2(v151) = LODWORD(a3->var0.var0.var5);
  v328 = 0u;
  v329 = 0u;
  v332 = 0u;
  v333 = 0u;
  memset(v334, 0, sizeof(v334));
  _S6 = a3->var10.var13;
  _S5 = a3->var10.var14;
  __asm { FCVT            H5, S5 }
  LOWORD(v328) = LOWORD(_S5);
  _S5 = a3->var10.var15;
  __asm { FCVT            H5, S5 }
  WORD1(v328) = LOWORD(_S5);
  v329 = _Q0;
  v330 = _Q1;
  v331 = 0u;
  *(float *)&_Q1 = a3->var1.var2;
  _Q0.f32[0] = (float)a3->var1.var1;
  __asm { FCVT            H0, S0 }
  LOWORD(v331) = _Q0.i16[0];
  __asm { FCVT            H0, S1 }
  WORD1(v331) = _Q0.i16[0];
  _Q0.i32[0] = LODWORD(a3->var1.var3);
  __asm { FCVT            H0, S0 }
  WORD2(v331) = _Q0.i16[0];
  v332 = v148;
  v333 = v151;
  _Q0.f32[0] = (float)a3->var0.var1;
  __asm { FCVT            H0, S0 }
  LOWORD(v334[0]) = _Q0.i16[0];
  _Q0.i64[0] = *(_QWORD *)&a3->var0.var2;
  _Q0.i64[1] = *(_QWORD *)&a3->var2;
  *(float16x8_t *)((char *)v334 + 2) = vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(_Q0), *(float32x4_t *)&a3->var4);
  _Q0.i32[0] = LODWORD(a3->var8);
  __asm
  {
    FCVT            H0, S0
    FCVT            S0, H0
  }
  DWORD1(v334[1]) = _Q0.i32[0];
  *((_QWORD *)&v334[1] + 1) = *(_QWORD *)&a3->var11;
  LODWORD(v334[2]) = a3->var10.var0;
  *(float16x8_t *)((char *)&v334[2] + 4) = vcvt_hight_f16_f32((int16x4_t)vcvt_f16_f32(*(float32x4_t *)&a3->var10.var1), *(float32x4_t *)&a3->var10.var5);
  *(float16x4_t *)((char *)&v334[3] + 4) = vcvt_f16_f32(*(float32x4_t *)&a3->var10.var9);
  __asm { FCVT            H0, S6 }
  WORD6(v334[3]) = _Q0.i16[0];
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v158, (uint64_t)&v328, 160);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  v159 = [UniRunInfo alloc];
  v316 = vdupq_n_s64(1uLL);
  v326 = v316;
  v327 = 1;
  v324 = xmmword_24B6F5690;
  v325 = 1;
  v161 = objc_msgSend_initWithThreadgroupsPerGrid_threadsPerThreadGroup_(v159, v160, (uint64_t)&v326, &v324);
  v341[0] = CFSTR("inputBlurMapTex");
  v341[1] = CFSTR("outputParamsTex");
  v162 = v95;
  faceParamsTex = v95->_faceParamsTex;
  v342[0] = v74;
  v342[1] = faceParamsTex;
  faceMaskCalc = v95->_faceMaskCalc;
  v341[2] = CFSTR("inputParams");
  v341[3] = CFSTR("_renderContext");
  v342[2] = v140;
  v342[3] = v89;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v165, (uint64_t)v342, v341, 4);
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  v297 = (void *)v161;
  objc_msgSend_imageByApplyingParameters_runInfo_(faceMaskCalc, v167, (uint64_t)v166, v161);
  v306 = (void *)objc_claimAutoreleasedReturnValue();

  v168 = [UniRunInfo alloc];
  v322 = v316;
  v323 = 1;
  v320 = xmmword_24B6F56A0;
  v321 = 1;
  v170 = objc_msgSend_initWithThreadgroupsPerGrid_threadsPerThreadGroup_(v168, v169, (uint64_t)&v322, &v320);
  v171 = 256;
  if (v311)
    v171 = 264;
  v172 = *(id *)((char *)&v95->super.isa + v171);
  v339[0] = CFSTR("inputBlurMapTex");
  v339[1] = CFSTR("outputEyeProtectionFacesTex");
  eyeProtectionFacesTex = v95->_eyeProtectionFacesTex;
  v340[0] = v74;
  v340[1] = eyeProtectionFacesTex;
  v339[2] = CFSTR("faceParams");
  v339[3] = CFSTR("tuningParams");
  v340[2] = v140;
  v340[3] = v310;
  v339[4] = CFSTR("_renderContext");
  v340[4] = v89;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v174, (uint64_t)v340, v339, 5);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v296 = v172;
  v176 = v172;
  v177 = v74;
  objc_msgSend_imageByApplyingParameters_runInfo_(v176, v178, (uint64_t)v175, v170);
  v179 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_extent(v74, v180, v181);
  v183 = v303;
  v314 = v184;
  v317 = v185;
  if (v303)
  {
    objc_opt_class();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_extent(v303, v182, v186);
      if (v188 != v314 || v187 != v317)
        sub_24B6EF0F4();
    }
  }
  v294 = (void *)v170;
  v295 = (void *)v140;
  v301 = (void *)v179;
  if (a13 == 1.0)
  {
    v189 = v299;
    goto LABEL_75;
  }
  v189 = v299;
  if (a14)
  {
LABEL_75:
    v210 = v306;
    goto LABEL_97;
  }
  objc_msgSend__mtlTextureForImage_(UniKernel, v182, (uint64_t)v303);
  v190 = (void *)objc_claimAutoreleasedReturnValue();
  v193 = v190;
  if (v190 && objc_msgSend_conformsToProtocol_(v190, v191, (uint64_t)&unk_2579B9140))
  {
    v194 = v299;
    objc_msgSend_device(v193, v191, v192);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v194 = v299;
    v195 = 0;
  }
  v196 = (void *)MEMORY[0x24BDBCED8];
  v337[0] = CFSTR("inputAlpha");
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v191, v192);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  v338[0] = v197;
  v337[1] = CFSTR("inputGlasses");
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v198, v199);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  v338[1] = v200;
  v337[2] = CFSTR("inputHair");
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v201, v202);
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  v338[2] = v203;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v204, (uint64_t)v338, v337, 3);
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithDictionary_(v196, v206, (uint64_t)v205);
  v207 = (void *)objc_claimAutoreleasedReturnValue();

  if (v193)
  {
    if (v194)
    {
      objc_opt_class();
      v209 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      v209 = 0;
    }
    if (v313)
    {
      objc_opt_class();
      v211 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      v211 = 0;
    }
    if (v312)
    {
      objc_opt_class();
      v212 = objc_opt_isKindOfClass() ^ 1;
    }
    else
    {
      v212 = 0;
    }
    v213 = (v211 & 1) + (v209 & 1);
    v214 = v213 + (v212 & 1);
    if (v214)
    {
      objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_numTextures_(self, v208, v304, v194, v213 + (v212 & 1u), v314, v317);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v215 || (v218 = v215, objc_msgSend_count(v215, v216, v217) != v214))
        sub_24B6EF0CC();
      if ((v209 & 1) != 0)
      {
        objc_msgSend_objectAtIndexedSubscript_(v218, v219, 0);
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v207, v221, (uint64_t)v220, CFSTR("inputAlpha"));

        v222 = 1;
        if ((v211 & 1) == 0)
          goto LABEL_91;
      }
      else
      {
        v222 = 0;
        if ((v211 & 1) == 0)
        {
LABEL_91:
          if ((v212 & 1) != 0)
          {
            objc_msgSend_objectAtIndexedSubscript_(v218, v219, v222);
            v226 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v207, v227, (uint64_t)v226, CFSTR("inputGlasses"));

          }
          goto LABEL_94;
        }
      }
      v223 = v222 + 1;
      objc_msgSend_objectAtIndexedSubscript_(v218, v219, v222);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v207, v225, (uint64_t)v224, CFSTR("inputHair"));

      v222 = v223;
      goto LABEL_91;
    }
  }
LABEL_94:
  objc_msgSend_objectForKeyedSubscript_(v207, v208, (uint64_t)CFSTR("inputAlpha"));
  v228 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v232 = (void *)MEMORY[0x24BDBF660];
    objc_msgSend_blackColor(MEMORY[0x24BDBF638], v230, v231);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithColor_(v232, v234, (uint64_t)v233);
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByCroppingToRect_(v235, v236, v237, 0.0, 0.0, v314, v317);
    v238 = (void *)objc_claimAutoreleasedReturnValue();

    v239 = [UniFakeImage alloc];
    v241 = (void *)objc_msgSend_initWithCIImage_format_(v239, v240, (uint64_t)v238, 10);
    objc_msgSend_setObject_forKeyedSubscript_(v207, v242, (uint64_t)v241, CFSTR("inputAlpha"));

  }
  objc_msgSend_objectForKeyedSubscript_(v207, v230, (uint64_t)CFSTR("inputAlpha"));
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__scaleImage_targetSize_device_useBoxFiltering_outputImage_context_(self, v244, (uint64_t)v194, v195, 1, v243, v307, v314, v317);
  v245 = objc_claimAutoreleasedReturnValue();

  v162 = self;
  objc_msgSend_objectForKeyedSubscript_(v207, v246, (uint64_t)CFSTR("inputHair"));
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__scaleImage_targetSize_device_useBoxFiltering_outputImage_context_(self, v248, (uint64_t)v313, v195, 0, v247, v307, v314, v317);
  v249 = objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_(v207, v250, (uint64_t)CFSTR("inputGlasses"));
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__scaleImage_targetSize_device_useBoxFiltering_outputImage_context_(self, v252, (uint64_t)v312, v195, 0, v251, v307, v314, v317);
  v253 = objc_claimAutoreleasedReturnValue();

  v312 = (id)v253;
  v313 = (id)v249;
  v189 = (void *)v245;
  v177 = v308;
  v183 = v303;
  v210 = v306;
  v179 = (uint64_t)v301;
LABEL_97:
  v254 = 272;
  if (v311)
    v254 = 280;
  v255 = *(id *)((char *)&v162->super.isa + v254);
  v256 = [UniRunInfo alloc];
  v257.f64[0] = v314;
  v257.f64[1] = v317;
  __asm { FMOV            V1.2D, #0.5 }
  v318 = vcvtq_u64_f64(vmulq_f64(v257, _Q1));
  v319 = 1;
  v260 = (void *)objc_msgSend_initWithGridSize_kernel_(v256, v259, (uint64_t)&v318, v255);
  objc_msgSend_setCoreImageOutputExtent_(v260, v261, v262, 0.0, 0.0, v314, v317);
  v266 = (void *)MEMORY[0x24BDBCED8];
  v336[0] = v177;
  v335[0] = CFSTR("inputBlurMapTex");
  v335[1] = CFSTR("inputPersonTex");
  v267 = v189;
  if (!v189)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v263, v264);
    v267 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v336[1] = v267;
  v335[2] = CFSTR("inputPersonDeltaTex");
  v268 = v309;
  if (!v309)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v263, v264);
    v268 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v336[2] = v268;
  v335[3] = CFSTR("outputHairDeltaTex");
  v269 = v183;
  if (!v183)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v263, v264);
    v269 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v336[3] = v269;
  v336[4] = v179;
  v335[4] = CFSTR("eyeProtectionFacesTex");
  v335[5] = CFSTR("faceParamsTex");
  v336[5] = v210;
  v336[6] = v310;
  v335[6] = CFSTR("params");
  v335[7] = CFSTR("_renderContext");
  v336[7] = v307;
  v335[8] = CFSTR("_scale");
  *(float *)&v265 = a13;
  objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v263, v264, v265);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v336[8] = v270;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v271, (uint64_t)v336, v335, 9);
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryWithDictionary_(v266, v273, (uint64_t)v272);
  v274 = (void *)objc_claimAutoreleasedReturnValue();

  v277 = v183;
  if (!v183)

  if (!v309)
  if (!v189)

  if (v311)
  {
    v278 = v312;
    v279 = v313;
    v280 = (void *)v304;
    if (v312)
    {
      objc_msgSend_setObject_forKeyedSubscript_(v274, v275, (uint64_t)v312, CFSTR("inputGlassesTex"));
    }
    else
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v275, v276);
      v284 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v274, v285, (uint64_t)v284, CFSTR("inputGlassesTex"));

    }
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v281, v282);
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v274, v287, (uint64_t)v286, CFSTR("inputGlassesDeltaTex"));
    goto LABEL_122;
  }
  v278 = v312;
  v279 = v313;
  v280 = (void *)v304;
  if (v313)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v274, v275, (uint64_t)v313, CFSTR("inputHairTex"));
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v275, v276);
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v274, v289, (uint64_t)v288, CFSTR("inputHairTex"));

  }
  if (!v302)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v283, 0);
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v274, v291, (uint64_t)v286, CFSTR("inputHairDeltaTex"));
LABEL_122:

    goto LABEL_123;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v274, v283, (uint64_t)v302, CFSTR("inputHairDeltaTex"));
LABEL_123:
  objc_msgSend_imageByApplyingParameters_runInfo_(v255, v290, (uint64_t)v274, v260);
  v292 = (void *)objc_claimAutoreleasedReturnValue();

  return v292;
}

- (unint64_t)calcShaderParamsFromConfigParams:(float *)a3
{
  float v3;
  float v4;
  BOOL v5;
  float v6;
  float v7;
  float v8;
  float v10;

  v3 = *a3;
  v4 = a3[1];
  v5 = v4 <= 0.0 || v3 <= 0.0;
  v6 = v4 / v3;
  if (v5)
    v6 = 1.0;
  v7 = a3[2];
  v8 = a3[3];
  _S1 = (float)(a3[5] * v6) / v7;
  v10 = a3[4] - v8;
  _S6 = _S1 / v10;
  _S3 = (float)((float)((float)-_S1 / v10) * v8) + 0.0;
  _S0 = (float)(v6 * a3[8]) / v7;
  _S4 = a3[6];
  *(float *)&_S5 = a3[7] - _S4;
  _S7 = (float)(0.0 - _S0) / *(float *)&_S5;
  _S2 = _S0 + (float)((float)((float)-(float)(0.0 - _S0) / *(float *)&_S5) * _S4);
  __asm
  {
    FCVT            H4, S6
    FCVT            H3, S3
    FCVT            H1, S1
    FCVT            H5, S7
    FCVT            H2, S2
    FCVT            H0, S0
  }
  return ((unint64_t)LOWORD(_S1) << 32) | ((unint64_t)_S5 << 48) | ((unint64_t)LOWORD(_S3) << 16) | LOWORD(_S4);
}

- (id)performCrispHairRefinementWithParams:(const crisp_hair_params *)a3 alpha:(id)a4 disparity:(id)a5 tmpImage0:(id)a6 tmpImage1:(id)a7 tmpImage2:(id)a8 editTimeRender:(BOOL)a9 context:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  id v23;
  double v24;
  float v25;
  int v26;
  int v27;
  BOOL v28;
  float var0;
  float var4;
  float var3;
  char isKindOfClass;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  const char *v53;
  uint64_t v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  uint64_t v59;
  UniRunInfo *v60;
  const char *v61;
  uint64_t v62;
  double v63;
  unint64_t v64;
  const char *v65;
  uint64_t v66;
  double v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  double v72;
  double v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  double v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  void *v83;
  const char *v84;
  void *v85;
  const char *v86;
  UniKernel *crispHairBlurY;
  double v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  void *v93;
  const char *v94;
  void *v95;
  const char *v96;
  UniRunInfo *v97;
  const char *v98;
  uint64_t v99;
  double v100;
  unint64_t v101;
  const char *v102;
  uint64_t v103;
  double v104;
  const char *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  double v109;
  double v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  UniKernel *crispHairExpandedDisparityX;
  const char *v117;
  void *v118;
  const char *v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  UniRunInfo *v123;
  const char *v124;
  uint64_t v125;
  double v126;
  unint64_t v127;
  const char *v128;
  uint64_t v129;
  double v130;
  const char *v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  double v135;
  double v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  double v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  double v149;
  const char *v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  void *v154;
  const char *v155;
  id v156;
  void *v158;
  void *v159;
  unsigned int v160;
  void *v161;
  UniKernel *crispHairBlurX;
  void *v163;
  id v164;
  uint64_t v165;
  id v166;
  MakeBlurMap *v167;
  void *v168;
  void *v169;
  unsigned int v170;
  void *v171;
  id v172;
  _QWORD v173[3];
  _QWORD v174[3];
  _QWORD v175[3];
  _QWORD v176[11];
  _QWORD v177[11];
  _QWORD v178[6];
  _QWORD v179[6];
  _QWORD v180[5];
  _QWORD v181[5];
  _QWORD v182[5];
  _QWORD v183[7];
  CGRect v184;
  CGRect v185;

  v183[5] = *MEMORY[0x24BDAC8D0];
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v23 = a10;
  if (!v16)
    goto LABEL_19;
  if (!v17)
  {
    v156 = 0;
    goto LABEL_21;
  }
  if (a3
    && (a3->var2 > 0.0 || a3->var1 > 0.0)
    && ((objc_msgSend_extent(v17, v21, v22),
         v25 = v24,
         v26 = (int)(float)(roundf(a3->var1 * v25) + -1.0),
         v27 = (int)(float)(roundf(a3->var2 * v25) + -1.0),
         v26 <= 0)
      ? (v28 = v27 <= 0)
      : (v28 = 0),
        !v28))
  {
    var0 = a3->var0;
    var3 = a3->var3;
    var4 = a3->var4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v172 = v20;
    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend__mtlTextureForImage_(UniKernel, v33, (uint64_t)v17);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_extent(v17, v35, v36);
      v38 = v37;
      v40 = v39;
      v43 = objc_msgSend_pixelFormat(v169, v41, v42);
      objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_pixelFormat_(self, v44, (uint64_t)v172, v172, v43, v38, v40);
      v165 = objc_claimAutoreleasedReturnValue();

      v172 = (id)v165;
    }
    v164 = v20;
    v166 = v19;
    objc_msgSend_extent(v16, v33, v34);
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    objc_msgSend_extent(v17, v53, v54);
    v185.origin.x = v55;
    v185.origin.y = v56;
    v185.size.width = v57;
    v185.size.height = v58;
    v184.origin.x = v46;
    v184.origin.y = v48;
    v184.size.width = v50;
    v184.size.height = v52;
    if (!CGRectEqualToRect(v184, v185))
      sub_24B6EF11C();
    v59 = (2 * v26);
    v160 = v59;
    v170 = 2 * v27;
    v60 = [UniRunInfo alloc];
    objc_msgSend_extent(v17, v61, v62);
    v64 = (unint64_t)(v63 * 0.5);
    objc_msgSend_extent(v17, v65, v66);
    v175[0] = v64;
    v175[1] = (unint64_t)(v67 * 0.5);
    v175[2] = 1;
    v69 = (void *)objc_msgSend_initWithGridSize_kernel_(v60, v68, (uint64_t)v175, self->_crispHairBlurX);
    objc_msgSend_extent(v17, v70, v71);
    v73 = v72;
    objc_msgSend_extent(v17, v74, v75);
    objc_msgSend_setCoreImageOutputExtent_(v69, v76, v77, 0.0, 0.0, v73);
    crispHairBlurX = self->_crispHairBlurX;
    v182[0] = CFSTR("inputTex");
    v182[1] = CFSTR("outputTex");
    v183[0] = v16;
    v183[1] = v18;
    v182[2] = CFSTR("trustedRegionAlphaThreshold");
    *(float *)&v78 = var0;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v79, v80, v78);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v183[2] = v81;
    v182[3] = CFSTR("windowSize");
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v82, v59);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v182[4] = CFSTR("_renderContext");
    v183[3] = v83;
    v183[4] = v23;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v84, (uint64_t)v183, v182, 5);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingParameters_runInfo_(crispHairBlurX, v86, (uint64_t)v85, v69);
    v167 = self;
    v163 = (void *)objc_claimAutoreleasedReturnValue();

    crispHairBlurY = self->_crispHairBlurY;
    v180[0] = CFSTR("inputTex");
    v180[1] = CFSTR("outputTex");
    v181[0] = v163;
    v181[1] = v166;
    v180[2] = CFSTR("trustedRegionAlphaThreshold");
    *(float *)&v88 = var0;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v89, v90, v88);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v181[2] = v91;
    v180[3] = CFSTR("windowSize");
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v92, v160);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v180[4] = CFSTR("_renderContext");
    v181[3] = v93;
    v181[4] = v23;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v94, (uint64_t)v181, v180, 5);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingParameters_runInfo_(crispHairBlurY, v96, (uint64_t)v95, v69);
    v161 = (void *)objc_claimAutoreleasedReturnValue();

    v97 = [UniRunInfo alloc];
    objc_msgSend_extent(v17, v98, v99);
    v101 = (unint64_t)(v100 * 0.5);
    objc_msgSend_extent(v17, v102, v103);
    v174[0] = v101;
    v174[1] = (unint64_t)(v104 * 0.5);
    v174[2] = 1;
    v106 = (void *)objc_msgSend_initWithGridSize_kernel_(v97, v105, (uint64_t)v174, v167->_crispHairExpandedDisparityX);

    v19 = v166;
    objc_msgSend_extent(v17, v107, v108);
    v110 = v109;
    objc_msgSend_extent(v17, v111, v112);
    v113 = v106;
    objc_msgSend_setCoreImageOutputExtent_(v106, v114, v115, 0.0, 0.0, v110);
    crispHairExpandedDisparityX = v167->_crispHairExpandedDisparityX;
    v178[0] = CFSTR("disparity");
    v178[1] = CFSTR("trustedRegion");
    v179[0] = v17;
    v179[1] = v161;
    v178[2] = CFSTR("outputTex");
    v178[3] = CFSTR("expandingVeryLargeDisparity");
    v179[2] = v18;
    v179[3] = &unk_251C9D6A0;
    v178[4] = CFSTR("windowSize");
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v117, v170);
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v178[5] = CFSTR("_renderContext");
    v179[4] = v118;
    v179[5] = v23;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v119, (uint64_t)v179, v178, 6);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingParameters_runInfo_(crispHairExpandedDisparityX, v121, (uint64_t)v120, v113);
    v122 = objc_claimAutoreleasedReturnValue();
    v158 = (void *)v122;

    v123 = [UniRunInfo alloc];
    objc_msgSend_extent(v17, v124, v125);
    v127 = (unint64_t)(v126 * 0.5);
    objc_msgSend_extent(v17, v128, v129);
    v173[0] = v127;
    v173[1] = (unint64_t)(v130 * 0.5);
    v173[2] = 1;
    v132 = (void *)objc_msgSend_initWithGridSize_kernel_(v123, v131, (uint64_t)v173, v167->_crispHairExpandedDisparityY);

    objc_msgSend_extent(v17, v133, v134);
    v136 = v135;
    objc_msgSend_extent(v17, v137, v138);
    v159 = v132;
    objc_msgSend_setCoreImageOutputExtent_(v132, v139, v140, 0.0, 0.0, v136);
    v142 = 424;
    if (a9)
      v142 = 432;
    v171 = *(Class *)((char *)&v167->super.isa + v142);
    v176[0] = CFSTR("expandedDispXTex");
    v176[1] = CFSTR("alphaTex");
    if (a9)
      v143 = 0;
    else
      v143 = v132;
    v168 = v143;
    v177[0] = v122;
    v177[1] = v16;
    v176[2] = CFSTR("disparityTex");
    v176[3] = CFSTR("outputTex");
    v177[2] = v17;
    v177[3] = v172;
    v176[4] = CFSTR("windowSize");
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v141, v170);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v177[4] = v144;
    v177[5] = &unk_251C9D6B0;
    v176[5] = CFSTR("expandingVeryLargeDisparityThreshold");
    v176[6] = CFSTR("expandingVerySmallDisparity");
    v177[6] = &unk_251C9D6C0;
    v177[7] = &unk_251C9D6A0;
    v176[7] = CFSTR("expandingVeryLargeDisparity");
    v176[8] = CFSTR("compositingThresholdLow");
    *(float *)&v145 = var3;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v146, v147, v145);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v177[8] = v148;
    v176[9] = CFSTR("compositingThresholdHigh");
    *(float *)&v149 = var4;
    objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v150, v151, v149);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v176[10] = CFSTR("_renderContext");
    v177[9] = v152;
    v177[10] = v23;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v153, (uint64_t)v177, v176, 11);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageByApplyingParameters_runInfo_(v171, v155, (uint64_t)v154, v168);
    v156 = (id)objc_claimAutoreleasedReturnValue();

    v20 = v164;
  }
  else
  {
LABEL_19:
    v156 = v17;
  }
LABEL_21:

  return v156;
}

- (id)createBlurMapUsingMetadata:(id)a3 simulatedAperture:(float)a4 focusWindow:(CGRect)a5 focalLengthInPixels:(float)a6 normalizedFocalLength:(float)a7 facePoints:(CGPoint *)a8 maxBlur:(float)a9 inputScale:(float)a10 inputsAlreadyScaled:(BOOL)a11 inputShiftMap:(id)a12 inputSegmentation:(id)a13 inputHair:(id)a14 inputGlasses:(id)a15 inputImageLuma:(id)a16 inputImageChroma:(id)a17 inputFaceMaskAdjBlur:(id)a18 inputWeightsX:(id)a19 inputWeightsY:(id)a20 inputPreproc:(id)a21 inputSampledD:(id)a22 inputDisparityRefineBlur:(id)a23 inputAlphaMaskDelta:(id)a24 inputHairMaskDelta:(id)a25 inputBlurRefineIntermediate:(id)a26 resultAdjBlurMap:(id)a27 coreImageRender:(BOOL)a28 context:(id)a29 captureFolderMiscPath:(id)a30
{
  double height;
  float v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _BOOL4 v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  id v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  double v68;
  float v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  float v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  float v82;
  const char *v83;
  uint64_t v84;
  NSObject *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  float v90;
  float v91;
  float v92;
  const char *v93;
  float v94;
  double v95;
  double v96;
  BOOL v97;
  float v98;
  const char *v99;
  const char *v100;
  double v101;
  const char *v102;
  double v103;
  const char *v104;
  double v105;
  double v106;
  const char *v107;
  const char *v108;
  int v109;
  const char *v110;
  int RenderingVersion;
  const char *v112;
  _OWORD *v113;
  _BOOL4 v115;
  int MattingParams_config;
  id v117;
  const char *v118;
  uint64_t v119;
  id v120;
  double v121;
  CGFloat v122;
  double v123;
  CGFloat v124;
  double v125;
  CGFloat v126;
  double v127;
  CGFloat v128;
  const char *v129;
  uint64_t v130;
  CGFloat v131;
  CGFloat v132;
  CGFloat v133;
  CGFloat v134;
  const char *v135;
  uint64_t v136;
  id v137;
  void *v138;
  void *v139;
  const char *v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  UniFakeImage *v147;
  const char *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  void *v152;
  double v153;
  unint64_t v154;
  const char *v155;
  uint64_t v156;
  double v157;
  const char *v158;
  const char *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  const char *v164;
  const char *v165;
  uint64_t v166;
  double v167;
  double v168;
  double v169;
  double v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  float v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  void *v180;
  const char *v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  UniFakeImage *v188;
  const char *v189;
  void *v190;
  MakeBlurMap *v191;
  void *v192;
  unint64_t v193;
  void *v194;
  double v195;
  unint64_t v196;
  const char *v197;
  uint64_t v198;
  double v199;
  const char *v200;
  const char *v201;
  const char *v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  void *v206;
  const char *v207;
  const char *v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  const char *v212;
  double v213;
  double v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  void *v218;
  void *v219;
  const char *v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  const char *v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  id v230;
  const char *v231;
  uint64_t v232;
  double v233;
  int v234;
  uint64_t v235;
  float v236;
  _BOOL4 v237;
  MakeBlurMap *v238;
  void *v239;
  void *v240;
  void *v241;
  const char *v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  void *v248;
  void *v249;
  UniFakeImage *v250;
  const char *v251;
  void *v252;
  MakeBlurMap *v253;
  void *v254;
  double v255;
  unint64_t v256;
  const char *v257;
  uint64_t v258;
  double v259;
  const char *v260;
  const char *v261;
  const char *v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  void *v266;
  const char *v267;
  const char *v268;
  uint64_t v269;
  const char *v270;
  unint64_t v271;
  uint64_t v272;
  double v273;
  _BOOL4 v274;
  BOOL v276;
  char v277;
  void *v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  double v283;
  CGFloat v284;
  double v285;
  CGFloat v286;
  double v287;
  CGFloat v288;
  double v289;
  CGFloat v290;
  const char *v291;
  uint64_t v292;
  CGFloat v293;
  CGFloat v294;
  CGFloat v295;
  CGFloat v296;
  const char *v297;
  uint64_t v298;
  void *v299;
  void *v300;
  const char *v301;
  void *v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  void *v308;
  UniFakeImage *v309;
  const char *v310;
  void *v311;
  const char *v312;
  uint64_t v313;
  const char *v314;
  double v315;
  double v316;
  double v317;
  double v318;
  double v319;
  double v320;
  const char *v321;
  uint64_t v322;
  const char *v323;
  uint64_t v324;
  void *v325;
  const char *v326;
  UniKernel *extractPositiveBlurValues;
  uint64_t v328;
  const char *v329;
  id v330;
  const char *v331;
  double v332;
  MakeBlurMap *v333;
  void *v334;
  UniRunInfo *v335;
  const char *v336;
  uint64_t v337;
  const char *v338;
  void *v339;
  UniKernel *faceMaskCalc;
  UniImage *faceMaskOutputParamsTex;
  void *v342;
  id v343;
  const char *v344;
  void *v345;
  const char *v346;
  void *v347;
  UniKernel *faceMaskApply;
  const char *v349;
  void *v350;
  const char *v351;
  const char *v352;
  double v353;
  const char *v354;
  void *v355;
  const char *v356;
  uint64_t v357;
  UniKernel *insertPositiveBlurValues;
  void *v359;
  const char *v360;
  uint64_t v361;
  const char *v362;
  uint64_t v363;
  double v364;
  double v365;
  double v366;
  double v367;
  const char *v368;
  uint64_t v369;
  double v370;
  double v371;
  void *v372;
  void *v373;
  const char *v374;
  void *v375;
  const char *v376;
  uint64_t v377;
  void *v378;
  UniFakeImage *v379;
  const char *v380;
  void *v381;
  UniScaleImage *v382;
  const char *v383;
  uint64_t v384;
  double v385;
  double v386;
  const char *v387;
  uint64_t v388;
  double v389;
  const char *v390;
  uint64_t v391;
  void *v392;
  uint64_t v393;
  const char *v394;
  void *v395;
  const char *v396;
  uint64_t v397;
  void *v398;
  const char *v399;
  uint64_t v400;
  const char *v401;
  uint64_t v402;
  void *v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  const char *v407;
  uint64_t v408;
  const char *v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  double *v419;
  double *v420;
  double *v421;
  void *v422;
  const char *v423;
  void *v424;
  const char *v425;
  void *v426;
  const char *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  const char *v433;
  uint64_t v434;
  double v435;
  double v436;
  const char *v437;
  uint64_t v438;
  double v439;
  const char *v440;
  uint64_t v441;
  void *v442;
  const char *v443;
  void *v444;
  const char *v445;
  void *v446;
  const char *v447;
  uint64_t v448;
  double v449;
  double v450;
  double v451;
  double v452;
  double v453;
  double v454;
  double v455;
  double v456;
  const char *v457;
  void *v458;
  const char *v459;
  uint64_t v460;
  const char *v461;
  uint64_t v462;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  _BOOL4 v468;
  id v469;
  double v470;
  double v471;
  _BOOL4 v472;
  _OWORD *v473;
  int v475;
  id v476;
  id v477;
  id v478;
  void *v479;
  void *v480;
  void *v481;
  id v482;
  id v484;
  double x;
  double y;
  double width;
  void *v488;
  id v489;
  id v490;
  id v491;
  void *v492;
  id v493;
  void *v494;
  _BOOL4 v495;
  void *v496;
  id v497;
  id v498;
  id v499;
  id v500;
  float v501;
  float v502;
  char isKindOfClass;
  void *v504;
  id v505;
  id v506;
  void *v508;
  id v509;
  float v510;
  float v511;
  unsigned int v512;
  void *v513;
  void *RenderingParametersFromMetaData;
  __int128 v515;
  __int128 v516;
  __int128 v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  _QWORD v522[2];
  int v523;
  __int128 v524;
  uint64_t v525;
  int64x2_t v526;
  uint64_t v527;
  CGAffineTransform v528;
  __int128 v529;
  _OWORD v530[3];
  _OWORD v531[3];
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  _OWORD v541[13];
  _OWORD v542[2];
  int v543;
  _OWORD v544[4];
  __int128 v545;
  int v546;
  uint64_t v547;
  uint64_t v548;
  int v549;
  _OWORD v550[3];
  uint64_t v551;
  _QWORD v552[2];
  _QWORD v553[3];
  _QWORD v554[3];
  _OWORD v555[4];
  CGAffineTransform v556;
  __int128 v557;
  _QWORD v558[4];
  _QWORD v559[4];
  _QWORD v560[4];
  _QWORD v561[4];
  _QWORD v562[4];
  _QWORD v563[4];
  _QWORD v564[4];
  _QWORD v565[4];
  _QWORD v566[3];
  _QWORD v567[3];
  CGAffineTransform v568;
  __int128 v569;
  uint64_t v570;
  CGRect v571;
  CGRect v572;
  CGRect v573;
  CGRect v574;

  height = a5.size.height;
  y = a5.origin.y;
  width = a5.size.width;
  x = a5.origin.x;
  v38 = a10;
  v570 = *MEMORY[0x24BDAC8D0];
  v500 = a3;
  v39 = a12;
  v40 = (unint64_t)a13;
  v41 = (unint64_t)a14;
  v491 = a15;
  v42 = a16;
  v509 = a17;
  v478 = a18;
  v506 = a19;
  v497 = a20;
  v43 = a21;
  v493 = a22;
  v499 = a23;
  v490 = a24;
  v489 = a25;
  v44 = a26;
  v505 = a27;
  v498 = a29;
  v477 = a30;
  v45 = v39;
  v492 = (void *)v41;
  v494 = (void *)v40;
  v46 = (v40 | v41) != 0;
  RenderingParametersFromMetaData = (void *)objc_msgSend_getRenderingParametersFromMetaData_(SDOFMetadata, v47, (uint64_t)v500);
  if (RenderingParametersFromMetaData)
  {
    v472 = v46;
    objc_msgSend_extent(v42, v48, v49);
    v476 = v44;
    v54 = v498;
    if (a7 == 0.0)
    {
      v510 = a6;
      v55 = height;
      v56 = v53;
      v57 = v52;
      objc_msgSend_image(v45, v50, v51);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_depthData(v58, v59, v60);
      v61 = (id)objc_claimAutoreleasedReturnValue();
      v64 = v61;
      if (v61)
      {
        objc_msgSend_cameraCalibrationData(v61, v62, v63);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_intrinsicMatrixReferenceDimensions(v65, v66, v67);
        v69 = v68;

        objc_msgSend_cameraCalibrationData(v64, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = v72;
        if (v72)
          objc_msgSend_intrinsicMatrix(v72, v73, v74);
        else
          v76 = 0.0;
        v82 = vabds_f32(0.5, v76 / v69);

        if (v82 <= 0.1)
        {
          objc_msgSend_cameraCalibrationData(v64, v83, v84, v82);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = v86;
          if (v86)
            objc_msgSend_intrinsicMatrix(v86, v87, v88);
          else
            v90 = 0.0;
          v501 = v90;

          a7 = v501 / v69;
        }
        else
        {
          uni_logger_general();
          v85 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
            sub_24B6EF234(v85);

          a7 = 0.0;
        }
      }
      else
      {
        a7 = 0.0;
      }

      v52 = v57;
      v53 = v56;
      height = v55;
      v38 = a10;
      a6 = v510;
    }
    if (a7 == 0.0)
      a7 = (float)(a6 * v38) / (float)(unint64_t)v52;
    v470 = v53;
    v471 = v52;
    v91 = v53;
    v92 = v52;
    v511 = v91 / v92;
    objc_msgSend_defaultSimulatedAperture_(SDOFMetadata, v50, (uint64_t)RenderingParametersFromMetaData);
    v97 = v94 <= 0.0 || a4 <= 0.0;
    v98 = v94 / a4;
    if (v97)
      v98 = 1.0;
    v502 = v98;
    v551 = 0;
    memset(v550, 0, sizeof(v550));
    *(float *)&v95 = a7;
    *(float *)&v96 = a9;
    objc_msgSend_loadLensModelParams_simulatedAperture_focusWindow_frameNormalizedFocalLength_maxBlur_(SDOFMetadata, v93, (uint64_t)RenderingParametersFromMetaData, COERCE_DOUBLE((unint64_t)LODWORD(a4)), x, y, width, height, v95, v96);
    v548 = 0;
    v547 = 0;
    v549 = 0;
    objc_msgSend_loadCrispHairParams_(SDOFMetadata, v99, (uint64_t)RenderingParametersFromMetaData);
    v546 = 0;
    v545 = 0u;
    memset(v544, 0, sizeof(v544));
    objc_msgSend_loadDisparityRefinementParams_(SDOFMetadata, v100, (uint64_t)RenderingParametersFromMetaData);
    v543 = 0;
    memset(v542, 0, sizeof(v542));
    *(float *)&v101 = a9;
    objc_msgSend_loadSegmentationFusionParams_simulatedAperture_maxBlur_(SDOFMetadata, v102, (uint64_t)RenderingParametersFromMetaData, COERCE_DOUBLE((unint64_t)LODWORD(a4)), v101);
    memset(v541, 0, 204);
    *(float *)&v103 = v38;
    objc_msgSend_loadBlurmapRefinementParams_apertureScaling_inputScale_focusWindow_segmentationFusionParams_(SDOFMetadata, v104, (uint64_t)RenderingParametersFromMetaData, v542, COERCE_DOUBLE((unint64_t)LODWORD(v502)), v103, x, y, width, height);
    v539 = 0u;
    v540 = 0u;
    v537 = 0u;
    v538 = 0u;
    v535 = 0u;
    v536 = 0u;
    v533 = 0u;
    v534 = 0u;
    v532 = 0u;
    memset(v531, 0, sizeof(v531));
    *(float *)&v105 = v511;
    *(float *)&v106 = a9;
    objc_msgSend_loadFaceMaskParams_facePoints_simulatedAperture_aspectRatio_maxBlur_(SDOFMetadata, v107, (uint64_t)RenderingParametersFromMetaData, a8, COERCE_DOUBLE((unint64_t)LODWORD(a4)), v105, v106);
    v109 = objc_msgSend_disparityRefinementVersion_(SDOFMetadata, v108, (uint64_t)RenderingParametersFromMetaData);
    RenderingVersion = objc_msgSend_getRenderingVersion_(SDOFMetadata, v110, (uint64_t)RenderingParametersFromMetaData);
    v113 = 0;
    memset(v530, 0, sizeof(v530));
    v115 = RenderingVersion > 3 && v109 > 0;
    v512 = RenderingVersion;
    v482 = v42;
    if (RenderingVersion >= 5 && v109 == 0xFFFF)
    {
      MattingParams_config = objc_msgSend_loadMattingParams_config_(SDOFMetadata, v112, (uint64_t)RenderingParametersFromMetaData, v530);
      v115 = MattingParams_config == 0;
      if (MattingParams_config)
        v113 = 0;
      else
        v113 = v530;
      if (MattingParams_config)
        v109 = 0;
      else
        v109 = 0xFFFF;
    }
    v473 = v113;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v117 = v494;
    v484 = v43;
    v480 = v117;
    v475 = v109;
    if (v494)
    {
      v120 = v117;
      objc_msgSend_extent(v117, v118, v119);
      v122 = v121;
      v124 = v123;
      v126 = v125;
      v128 = v127;
      objc_msgSend_extent(v45, v129, v130);
      v573.origin.x = v131;
      v573.origin.y = v132;
      v573.size.width = v133;
      v573.size.height = v134;
      v571.origin.x = v122;
      v571.origin.y = v124;
      v571.size.width = v126;
      v571.size.height = v128;
      v479 = v120;
      v137 = v506;
      if (!CGRectEqualToRect(v571, v573))
      {
        if ((isKindOfClass & 1) != 0)
        {
          v138 = (void *)MEMORY[0x24BDBF660];
          objc_msgSend_blackColor(MEMORY[0x24BDBF638], v135, v136);
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_imageWithColor_(v138, v140, (uint64_t)v139);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_extent(v45, v142, v143);
          objc_msgSend_imageByCroppingToRect_(v141, v144, v145);
          v146 = (void *)objc_claimAutoreleasedReturnValue();

          v147 = [UniFakeImage alloc];
          v149 = (void *)objc_msgSend_initWithCIImage_format_(v147, v148, (uint64_t)v146, 10);
          v150 = (uint64_t)v480;
          v151 = v480;
        }
        else
        {
          v152 = (void *)MEMORY[0x24BDDD740];
          objc_msgSend_extent(v45, v135, v136);
          v154 = (unint64_t)v153;
          objc_msgSend_extent(v45, v155, v156);
          objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v152, v158, 10, v154, (unint64_t)v157, 0);
          v146 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setUsage_(v146, v159, 19);
          objc_msgSend_device(self->_mtlQueue, v160, v161);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          v151 = (void *)objc_msgSend_newTextureWithDescriptor_(v162, v163, (uint64_t)v146);

          objc_msgSend_imageWithMTLTexture_(UniImage, v164, (uint64_t)v151);
          v149 = (void *)objc_claimAutoreleasedReturnValue();
          v150 = (uint64_t)v480;

        }
        if (!v149)
          sub_24B6EF1E4();
        objc_msgSend_extent(v45, v165, v166);
        v168 = v167;
        v170 = v169;
        objc_msgSend_device(self->_mtlQueue, v171, v172);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend__scaleImage_targetSize_device_useBoxFiltering_outputImage_context_(self, v174, v150, v173, 1, v149, v498, v168, v170);
        v175 = objc_claimAutoreleasedReturnValue();

        v43 = v484;
        v54 = v498;
        v479 = (void *)v175;
        if (!v175)
          sub_24B6EF20C();
      }
    }
    else
    {
      v479 = 0;
      v137 = v506;
    }
    v176 = *((float *)&v545 + 1);
    if (*((float *)&v545 + 1) >= *(float *)&v545)
      v176 = *(float *)&v545;
    v495 = enableFGBlur(v176 > 0.0);
    if (v115)
    {
      if ((isKindOfClass & 1) != 0)
      {
        v179 = (void *)MEMORY[0x24BDBF660];
        objc_msgSend_blackColor(MEMORY[0x24BDBF638], v177, v178);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageWithColor_(v179, v181, (uint64_t)v180);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_extent(v45, v183, v184);
        objc_msgSend_imageByCroppingToRect_(v182, v185, v186);
        v187 = (void *)objc_claimAutoreleasedReturnValue();

        v188 = [UniFakeImage alloc];
        v190 = (void *)objc_msgSend_initWithCIImage_format_(v188, v189, (uint64_t)v187, 25);
        v191 = self;
      }
      else
      {
        v194 = (void *)MEMORY[0x24BDDD740];
        objc_msgSend_extent(v45, v177, v178);
        v196 = (unint64_t)v195;
        objc_msgSend_extent(v45, v197, v198);
        objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v194, v200, 25, v196, (unint64_t)v199, 0);
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setUsage_(v187, v201, 19);
        v191 = self;
        objc_msgSend_device(self->_mtlQueue, v202, v203);
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        v206 = (void *)objc_msgSend_newTextureWithDescriptor_(v204, v205, (uint64_t)v187);

        objc_msgSend_imageWithMTLTexture_(UniImage, v207, (uint64_t)v206);
        v190 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = v484;
      }

      objc_msgSend_performSLMCalculatorUsingParams_inputShiftMap_faceMaskParams_version_context_isFGBlurEnabled_(v191, v208, (uint64_t)v550, v45, 0, v512, v54, v495);
      v209 = objc_claimAutoreleasedReturnValue();
      v193 = 0x251C8E000uLL;
      if (!v209)
        sub_24B6EF144();
      v192 = (void *)v209;
      objc_msgSend_extent(v45, v210, v211);
      objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_(v191, v212, (uint64_t)v43, v43, v213, v214);
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      if ((isKindOfClass & 1) != 0)
      {
        v218 = (void *)MEMORY[0x24BDBF660];
        objc_msgSend_blackColor(MEMORY[0x24BDBF638], v215, v216);
        v219 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageWithColor_(v218, v220, (uint64_t)v219);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_extent(v45, v222, v223);
        objc_msgSend_imageByCroppingToRect_(v221, v224, v225);
        v226 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_imageWithCIImage_format_(UniFakeImage, v227, (uint64_t)v226, 70);
        v228 = objc_claimAutoreleasedReturnValue();

        v217 = (void *)v228;
        v137 = v506;
        v191 = self;
      }
      objc_msgSend_performDisparityRefinementViaMatting_inputShiftmap_focusRect_inputLuma_inputChroma_simpleLensModelCalculatorImage_disparityConfigIndex_outputRefinedImage_tmpRGB_tmpDisparity_tmpRGBA_SDOFVersion_mattingParams_context_(v191, v215, (uint64_t)v479, v45, v42, v509, v192, v475, x, y, width, height, v190, v217, v137, 0, v512, v473, v54);
      v229 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v229)
        sub_24B6EF16C();
      v230 = v229;

      v45 = v230;
      v43 = v484;
    }
    else
    {
      v192 = 0;
      v193 = 0x251C8E000;
    }
    if (qword_2544D9C78 != -1)
      dispatch_once(&qword_2544D9C78, &unk_251C8F828);
    v529 = 0u;
    memset(&v528, 0, sizeof(v528));
    objc_msgSend_loadHairnetParams_(*(void **)(v193 + 3040), v177, (uint64_t)RenderingParametersFromMetaData);
    if (qword_2544D9C80 != -1)
      dispatch_once(&qword_2544D9C80, &unk_251C8F848);
    v234 = byte_2579AEB88;
    v235 = v512;
    if (byte_2579AEB88 == 121)
    {
      if (*((float *)&v528.b + 1) != 0.0)
        goto LABEL_70;
      LODWORD(v233) = LODWORD(v528.c);
      if (*(float *)&v528.c != 0.0)
        goto LABEL_70;
      objc_msgSend_defaultHairnetParams(*(void **)(v193 + 3040), v231, v232, v233);
      v235 = v512;
      v528 = v568;
      HIDWORD(v233) = HIDWORD(v568.tx);
      v529 = v569;
      v234 = byte_2579AEB88;
    }
    if (v234 == 110)
    {
      LODWORD(v528.c) = 0;
      HIDWORD(v528.b) = 0;
      LODWORD(v233) = 0;
      v236 = 0.0;
      goto LABEL_71;
    }
LABEL_70:
    v236 = *((float *)&v528.b + 1);
    LODWORD(v233) = LODWORD(v528.c);
LABEL_71:
    v237 = *(float *)&v233 != 0.0 || v236 != 0.0;
    v238 = self;
    if ((byte_2579AEB80 & 1) != 0)
    {
      v239 = v45;
      if (!byte_2579AEB81)
        goto LABEL_87;
    }
    else
    {
      v239 = v45;
      if ((int)v235 < 4)
        goto LABEL_87;
      v239 = v45;
      if (!v479)
        goto LABEL_87;
      v239 = v45;
      if (!v45)
        goto LABEL_87;
      LODWORD(v233) = v548;
      if (*(float *)&v548 <= 0.0)
      {
        LODWORD(v233) = HIDWORD(v547);
        v239 = v45;
        if (*((float *)&v547 + 1) <= 0.0)
          goto LABEL_87;
      }
    }
    if ((isKindOfClass & 1) != 0)
    {
      v240 = (void *)MEMORY[0x24BDBF660];
      objc_msgSend_blackColor(MEMORY[0x24BDBF638], v231, v232);
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageWithColor_(v240, v242, (uint64_t)v241);
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_extent(v45, v244, v245);
      objc_msgSend_imageByCroppingToRect_(v243, v246, v247);
      v248 = v45;
      v249 = (void *)objc_claimAutoreleasedReturnValue();

      v250 = [UniFakeImage alloc];
      v252 = (void *)objc_msgSend_initWithCIImage_format_(v250, v251, (uint64_t)v249, 25);
      v253 = self;
    }
    else
    {
      v254 = (void *)MEMORY[0x24BDDD740];
      objc_msgSend_extent(v45, v231, v232, v233);
      v256 = (unint64_t)v255;
      objc_msgSend_extent(v45, v257, v258);
      objc_msgSend_texture2DDescriptorWithPixelFormat_width_height_mipmapped_(v254, v260, 25, v256, (unint64_t)v259, 0);
      v248 = v45;
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setUsage_(v249, v261, 19);
      v253 = self;
      objc_msgSend_device(self->_mtlQueue, v262, v263);
      v264 = (void *)objc_claimAutoreleasedReturnValue();
      v266 = (void *)objc_msgSend_newTextureWithDescriptor_(v264, v265, (uint64_t)v249);

      objc_msgSend_imageWithMTLTexture_(UniImage, v267, (uint64_t)v266);
      v252 = (void *)objc_claimAutoreleasedReturnValue();

    }
    LOBYTE(v464) = isKindOfClass & 1;
    v137 = v506;
    objc_msgSend_performCrispHairRefinementWithParams_alpha_disparity_tmpImage0_tmpImage1_tmpImage2_editTimeRender_context_(v253, v268, (uint64_t)&v547, v479, v248, v506, v497, v252, v464, v54);
    v239 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v239)
      sub_24B6EF1BC();
    v238 = v253;
    v45 = v248;

    v42 = v482;
    v43 = v484;
    v235 = v512;
LABEL_87:
    objc_msgSend_performSLMCalculatorUsingParams_inputShiftMap_faceMaskParams_version_context_isFGBlurEnabled_(v238, v231, (uint64_t)v550, v239, v531, v235, v54, v495, v233);
    v269 = objc_claimAutoreleasedReturnValue();

    v481 = (void *)v269;
    if (!v269)
      sub_24B6EF194();
    v469 = v45;
    v271 = -1;
    v272 = -2;
    HIDWORD(v273) = DWORD1(v536);
    do
    {
      ++v271;
      v521 = v536;
      v272 += 2;
    }
    while (v271 <= 3 && *(float *)((unint64_t)&v521 & 0xFFFFFFFFFFFFFFF3 | (4 * (v271 & 3))) >= 0.0);
    if (v271)
      v274 = v237;
    else
      v274 = 0;
    v468 = v274;
    v276 = (int)v512 > 3 || v475 < 1;
    v277 = v276 | isKindOfClass ^ 1;
    if ((v277 & 1) == 0)
    {
      LODWORD(v465) = v512;
      objc_msgSend_performDisparityRefinementViaMatting_inputShiftmap_focusRect_inputLuma_inputChroma_simpleLensModelCalculatorImage_disparityConfigIndex_outputRefinedImage_tmpRGB_tmpDisparity_tmpRGBA_SDOFVersion_mattingParams_context_(v238, v270, (uint64_t)v480, v239, v42, v509, v481, x, y, width, height, v499, v43, v137, 0, v465, v473, v54);
      v278 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38 != 1.0 && !a11)
      {
        objc_msgSend_image(v278, v270, v279);
        v280 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_extent(v280, v281, v282);
        v284 = v283;
        v286 = v285;
        v288 = v287;
        v290 = v289;
        objc_msgSend_extent(v509, v291, v292);
        v574.origin.x = v293;
        v574.origin.y = v294;
        v574.size.width = v295;
        v574.size.height = v296;
        v572.origin.x = v284;
        v572.origin.y = v286;
        v572.size.width = v288;
        v572.size.height = v290;
        if (!CGRectEqualToRect(v572, v574))
        {
          if ((isKindOfClass & 1) != 0)
          {
            v299 = (void *)MEMORY[0x24BDBF660];
            objc_msgSend_blackColor(MEMORY[0x24BDBF638], v297, v298);
            v300 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_imageWithColor_(v299, v301, (uint64_t)v300);
            v302 = (void *)objc_claimAutoreleasedReturnValue();
            v303 = v509;
            objc_msgSend_extent(v509, v304, v305);
            objc_msgSend_imageByCroppingToRect_(v302, v306, v307);
            v308 = (void *)objc_claimAutoreleasedReturnValue();

            v238 = self;
            v309 = [UniFakeImage alloc];
            v311 = (void *)objc_msgSend_initWithCIImage_(v309, v310, (uint64_t)v308);

            v43 = v484;
          }
          else
          {
            v303 = v509;
            objc_msgSend_extent(v509, v297, v298);
            objc_msgSend__smallerTextureFromTexture_modelTexture_targetSize_(v238, v314, (uint64_t)v278, v509, v315, v316);
            v311 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend_extent(v303, v312, v313);
          v318 = v317;
          v320 = v319;
          objc_msgSend_extent(v280, v321, v322);
          v54 = v498;
          objc_msgSend__scaleImage_targetSize_sourceSize_device_outputImage_context_(v238, v323, (uint64_t)v278, 0, v311, v498, v318, v320);
          v324 = objc_claimAutoreleasedReturnValue();

          v278 = (void *)v324;
          v238 = self;
        }

      }
      v239 = v278;
      v137 = v506;
    }
    BYTE1(v467) = isKindOfClass & 1;
    LOBYTE(v467) = (v277 & 1) == 0;
    *(float *)&v273 = v38;
    objc_msgSend_performDisparityRefinementUsingParams_inputDisparity_inputSegmentation_inputImageLuma_inputImageChroma_inputSlmParams_inputWeightsX_inputWeightsY_inputPreproc_inputSampledD_outputBlurMap_scale_havePerformedMatting_editTimeRender_context_(v238, v270, (uint64_t)v544, v239, v480, v42, v509, v481, v273, v137, v497, v43, v493, v499, v467, v54);
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    v504 = v325;
    if (v495)
    {
      extractPositiveBlurValues = v238->_extractPositiveBlurValues;
      v566[0] = CFSTR("signedBlurMapTex");
      v566[1] = CFSTR("outputBlurMapTex");
      v567[0] = v325;
      v567[1] = v505;
      v566[2] = CFSTR("_renderContext");
      v567[2] = v54;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v326, (uint64_t)v567, v566, 3);
      v328 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(extractPositiveBlurValues, v329, v328);
      v330 = (id)objc_claimAutoreleasedReturnValue();

      v239 = (void *)v328;
    }
    else
    {
      v330 = v325;
    }

    if (v472)
    {
      LOBYTE(v466) = a11;
      v79 = v505;
      v44 = v476;
      v333 = self;
      *(float *)&v332 = v38;
      objc_msgSend_enqueueRefinementUsingParams_maskParams_inputBlurMap_inputAlpha_inputHair_inputGlasses_inputAlphaMaskDelta_inputHairMaskDelta_inputBlurRefineIntermediate_outputBlurMap_scale_inputsAlreadyScaled_context_(self, v331, (uint64_t)v541, v531, v330, v480, v492, v491, v332, v490, v489, v476, v505, v466, v54);
      v334 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v335 = [UniRunInfo alloc];
      v526 = vdupq_n_s64(1uLL);
      v527 = 1;
      v524 = xmmword_24B6F5690;
      v525 = 1;
      v337 = objc_msgSend_initWithThreadgroupsPerGrid_threadsPerThreadGroup_(v335, v336, (uint64_t)&v526, &v524);
      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v338, (uint64_t)v531, 192);
      v339 = (void *)objc_claimAutoreleasedReturnValue();
      v333 = self;
      faceMaskCalc = self->_faceMaskCalc;
      v564[0] = CFSTR("inputBlurMapTex");
      v564[1] = CFSTR("inputParams");
      v565[0] = v330;
      v565[1] = v339;
      faceMaskOutputParamsTex = self->_faceMaskOutputParamsTex;
      v564[2] = CFSTR("outputParamsTex");
      v564[3] = CFSTR("_renderContext");
      v565[2] = faceMaskOutputParamsTex;
      v565[3] = v54;
      v342 = (void *)MEMORY[0x24BDBCE70];
      v343 = v330;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(v342, v344, (uint64_t)v565, v564, 4);
      v345 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_runInfo_(faceMaskCalc, v346, (uint64_t)v345, v337);
      v347 = (void *)objc_claimAutoreleasedReturnValue();

      faceMaskApply = self->_faceMaskApply;
      v562[0] = CFSTR("paramsTex");
      v562[1] = CFSTR("inputBlurMapTex");
      v563[0] = v347;
      v563[1] = v343;
      v562[2] = CFSTR("outputBlurMapTex");
      v562[3] = CFSTR("_renderContext");
      v79 = v505;
      v563[2] = v505;
      v563[3] = v498;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v349, (uint64_t)v563, v562, 4);
      v350 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_runInfo_(faceMaskApply, v351, (uint64_t)v350, 0);
      v334 = (void *)objc_claimAutoreleasedReturnValue();

      v54 = v498;
      v330 = (id)v337;
      v44 = v476;
    }

    v522[0] = 0;
    v522[1] = 0;
    v523 = 0;
    objc_msgSend_loadBlurmapSmoothingParams_(SDOFMetadata, v352, (uint64_t)RenderingParametersFromMetaData);
    *(float *)&v353 = v38;
    objc_msgSend_performBlurmapSmoothingUsingSmoothingConfig_inputBlurMap_inputIntermediateTex_outputSmoothedBlurmap_scale_version_context_(v333, v354, (uint64_t)v522, v334, v44, v79, v512, v54, v353);
    v355 = (void *)objc_claimAutoreleasedReturnValue();

    if (v495)
    {
      insertPositiveBlurValues = v333->_insertPositiveBlurValues;
      v560[0] = CFSTR("signedBlurMapTex");
      v560[1] = CFSTR("positiveBlurMapTex");
      v561[0] = v504;
      v561[1] = v355;
      v560[2] = CFSTR("outputBlurMapTex");
      v560[3] = CFSTR("_renderContext");
      v561[2] = v505;
      v561[3] = v54;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v356, (uint64_t)v561, v560, 4);
      v359 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageByApplyingParameters_(insertPositiveBlurValues, v360, (uint64_t)v359);
      v361 = objc_claimAutoreleasedReturnValue();

      v355 = (void *)v361;
      v79 = v505;
    }
    v42 = v482;
    objc_msgSend_blurMapSize_(MakeBlurMap, v356, v357, v471, v470);
    if (a28)
    {
      v366 = v364;
      v367 = v365;
      objc_msgSend_extent(v355, v362, v363);
      if (v370 != v366 || (objc_msgSend_extent(v355, v368, v369), v371 != v366))
      {
        v372 = (void *)MEMORY[0x24BDBF660];
        objc_msgSend_blackColor(MEMORY[0x24BDBF638], v368, v369);
        v373 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageWithColor_(v372, v374, (uint64_t)v373);
        v375 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageByCroppingToRect_(v375, v376, v377, 0.0, 0.0, v366, v367);
        v378 = (void *)objc_claimAutoreleasedReturnValue();

        v379 = [UniFakeImage alloc];
        v381 = (void *)objc_msgSend_initWithCIImage_format_(v379, v380, (uint64_t)v378, 115);

        v382 = objc_alloc_init(UniScaleImage);
        objc_msgSend_extent(v355, v383, v384);
        v386 = v366 / v385;
        objc_msgSend_extent(v355, v387, v388);
        v558[0] = *MEMORY[0x24BDBF988];
        objc_msgSend_vectorWithX_Y_(MEMORY[0x24BDBF690], v390, v391, v386, v367 / v389);
        v392 = (void *)objc_claimAutoreleasedReturnValue();
        v393 = *MEMORY[0x24BDBF9C8];
        v558[1] = *MEMORY[0x24BDBF960];
        v558[2] = v393;
        v559[0] = v392;
        v559[1] = v355;
        v558[3] = CFSTR("_renderContext");
        v559[2] = v381;
        v559[3] = v54;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v394, (uint64_t)v559, v558, 4);
        v395 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_imageByApplyingParameters_(v382, v396, (uint64_t)v395);
        v397 = objc_claimAutoreleasedReturnValue();

        v42 = v482;
        v355 = (void *)v397;
        v44 = v476;
      }
      if (v468)
      {
        objc_msgSend_image(v42, v368, v369);
        v398 = (void *)objc_claimAutoreleasedReturnValue();

        if (v398)
        {
          objc_msgSend_image(v42, v399, v400);
          v508 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_image(v355, v401, v402);
          v403 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_image(v480, v404, v405);
          v406 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_image(v492, v407, v408);
          v513 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_image(v491, v409, v410);
          v488 = (void *)objc_claimAutoreleasedReturnValue();
          v411 = 0;
          v412 = 0;
          v569 = 0u;
          memset(&v568, 0, sizeof(v568));
          v557 = 0u;
          memset(&v556, 0, sizeof(v556));
          memset(v555, 0, sizeof(v555));
          v413 = v532;
          v414 = v533;
          v415 = v534;
          v416 = v535;
          v417 = v536;
          v418 = v537;
          do
          {
            v515 = v413;
            v419 = (double *)((char *)&v568.a + v411 * 16);
            *v419 = *(float *)((unint64_t)&v515 & 0xFFFFFFFFFFFFFFF3 | (4 * (v412 & 3)));
            v516 = v414;
            v419[1] = *(float *)((unint64_t)&v516 & 0xFFFFFFFFFFFFFFF3 | (4 * (v412 & 3)));
            v517 = v415;
            v420 = (double *)((char *)&v556.a + v411 * 16);
            *v420 = *(float *)((unint64_t)&v517 & 0xFFFFFFFFFFFFFFF3 | (4 * (v412 & 3)));
            v518 = v416;
            v420[1] = *(float *)((unint64_t)&v518 & 0xFFFFFFFFFFFFFFF3 | (4 * (v412 & 3)));
            v519 = v417;
            v421 = (double *)&v555[v411];
            *v421 = *(float *)((unint64_t)&v519 & 0xFFFFFFFFFFFFFFF3 | (4 * (v412 & 3)));
            v520 = v418;
            v421[1] = *(float *)((unint64_t)&v520 & 0xFFFFFFFFFFFFFFF3 | (4 * (v412++ & 3)));
            ++v411;
          }
          while (v271 != v412);
          v553[0] = CFSTR("lEye");
          objc_msgSend_vectorWithValues_count_(MEMORY[0x24BDBF690], (const char *)v419, (uint64_t)&v568, v272);
          v422 = (void *)objc_claimAutoreleasedReturnValue();
          v554[0] = v422;
          v553[1] = CFSTR("rEye");
          objc_msgSend_vectorWithValues_count_(MEMORY[0x24BDBF690], v423, (uint64_t)&v556, v272);
          v424 = (void *)objc_claimAutoreleasedReturnValue();
          v554[1] = v424;
          v553[2] = CFSTR("chin");
          objc_msgSend_vectorWithValues_count_(MEMORY[0x24BDBF690], v425, (uint64_t)v555, v272);
          v426 = (void *)objc_claimAutoreleasedReturnValue();
          v554[2] = v426;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v427, (uint64_t)v554, v553, 3);
          v428 = (void *)objc_claimAutoreleasedReturnValue();

          v496 = (void *)v406;
          if (v406)
          {
            v81 = v494;
            v42 = v482;
            v43 = v484;
            v79 = v505;
            if (v513)
            {
              v429 = v508;
              if (v403 && v428)
              {
                v568 = v528;
                v569 = v529;
                v430 = (void *)v406;
                v431 = v488;
                createInpaintingMask(v508, v430, v513, v488, v403, v428, (float *)&v568);
                v432 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_extent(v403, v433, v434);
                v436 = v435;
                objc_msgSend_extent(v432, v437, v438);
                memset(&v568, 0, sizeof(v568));
                CGAffineTransformMakeScale(&v568, v436 / v439, v436 / v439);
                objc_msgSend_imageBySamplingNearest(v432, v440, v441);
                v442 = (void *)objc_claimAutoreleasedReturnValue();

                v556 = v568;
                objc_msgSend_imageByApplyingTransform_highQualityDownsample_(v442, v443, (uint64_t)&v556, 0);
                v444 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_colorKernelWithName_(CoreImageOnlyLibrary, v445, (uint64_t)CFSTR("ccp_insertMask"));
                v446 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_extent(v355, v447, v448);
                v450 = v449;
                v452 = v451;
                v454 = v453;
                v456 = v455;
                v552[0] = v403;
                v552[1] = v444;
                objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v457, (uint64_t)v552, 2);
                v458 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_applyWithExtent_arguments_(v446, v459, (uint64_t)v458, v450, v452, v454, v456);
                v460 = objc_claimAutoreleasedReturnValue();

                objc_msgSend_imageWithObject_(UniImage, v461, v460);
                v462 = objc_claimAutoreleasedReturnValue();

                v42 = v482;
                v43 = v484;
                v403 = (void *)v460;
                v429 = v508;
                v355 = (void *)v462;
                v79 = v505;
LABEL_136:

                v44 = v476;
                goto LABEL_137;
              }
LABEL_135:
              v431 = v488;
              goto LABEL_136;
            }
          }
          else
          {
            v81 = v494;
            v42 = v482;
            v43 = v484;
            v79 = v505;
          }
          v429 = v508;
          goto LABEL_135;
        }
      }
      v81 = v494;
      v43 = v484;
      v79 = v505;
    }
    else
    {
      v81 = v494;
      v43 = v484;
    }
LABEL_137:
    free(RenderingParametersFromMetaData);
    v45 = v355;

    v77 = v45;
    v80 = v506;
    v78 = v469;
    goto LABEL_138;
  }
  v77 = 0;
  v78 = v45;
  v79 = v505;
  v80 = v506;
  v54 = v498;
  v81 = v494;
LABEL_138:

  return v77;
}

- (int)enqueueBlurMapGenerationUsingArgs:(id)a3
{
  id v4;
  void *v5;
  UniContext *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  int v93;
  const char *v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  const char *v104;
  uint64_t v105;
  int v106;
  int v107;
  const char *v108;
  uint64_t v109;
  int v110;
  int v111;
  const char *v112;
  uint64_t v113;
  int v114;
  int v115;
  const char *v116;
  uint64_t v117;
  int v118;
  int v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  double v149;
  double v150;
  double v151;
  double v152;
  const char *v153;
  void *v154;
  const char *v155;
  const char *v156;
  uint64_t v157;
  int v158;
  void *v159;
  void *v160;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  int v168;
  void *v169;
  void *v170;
  uint64_t *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  _BYTE v181[256];
  uint64_t v182;

  v182 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BD25858]();
  v6 = objc_alloc_init(UniContext);
  if (objc_msgSend_validateForMetal(v4, v7, v8))
  {
    v171 = (uint64_t *)self;
    objc_msgSend_inputShiftMap(v4, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithObject_(UniImage, v12, (uint64_t)v11);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_inputSegmentation(v4, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithObject_(UniImage, v17, (uint64_t)v16);
    v175 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_inputHair(v4, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithObject_(UniImage, v21, (uint64_t)v20);
    v174 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_inputGlasses(v4, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithObject_(UniImage, v25, (uint64_t)v24);
    v172 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_inputImageLuma(v4, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithObject_(UniImage, v29, (uint64_t)v28);
    v30 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_inputImageChroma(v4, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithObject_(UniImage, v34, (uint64_t)v33);
    v179 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_outputBlurMap(v4, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithObject_(UniImage, v38, (uint64_t)v37);
    v178 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_intermediates(v4, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputDisparityRefineBlurTex(v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithObject_(UniImage, v45, (uint64_t)v44);
    v46 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_intermediates(v4, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputPreprocTex(v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithObject_(UniImage, v53, (uint64_t)v52);
    v180 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_intermediates(v4, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputAlphaMaskDeltaTex(v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithObject_(UniImage, v60, (uint64_t)v59);
    v177 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_intermediates(v4, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputHairMaskDeltaTex(v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithObject_(UniImage, v67, (uint64_t)v66);
    v176 = (void *)objc_claimAutoreleasedReturnValue();

    v173 = (void *)v13;
    if (!v13)
      sub_24B6EF274();
    if (!v46)
      sub_24B6EF29C();
    if (!v180)
      sub_24B6EF2C4();
    objc_msgSend_intermediates(v4, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputAlphaMaskDeltaTex(v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73 && !v177)
      sub_24B6EF2EC();
    objc_msgSend_intermediates(v4, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputHairMaskDeltaTex(v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();

    if (v79 && !v176)
      sub_24B6EF314();
    if (!v30)
      sub_24B6EF33C();
    if (!v179)
      sub_24B6EF364();
    if (!v178)
      sub_24B6EF38C();
    objc_msgSend_inputSegmentation(v4, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    if (v82 && !v175)
      sub_24B6EF3B4();
    objc_msgSend_inputHair(v4, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();

    if (v85 && !v174)
      sub_24B6EF3DC();
    v163 = v5;
    objc_msgSend_facePoints(v4, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6CC480((uint64_t)v181, v88);

    objc_msgSend_metadata(v4, v89, v90);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_simulatedAperture(v4, v91, v92);
    v168 = v93;
    objc_msgSend_focusWindow(v4, v94, v95);
    v97 = v96;
    v99 = v98;
    v101 = v100;
    v103 = v102;
    objc_msgSend_focalLengthInPixels(v4, v104, v105);
    v107 = v106;
    objc_msgSend_normalizedFocalLength(v4, v108, v109);
    v111 = v110;
    objc_msgSend_maxBlur(v4, v112, v113);
    v115 = v114;
    objc_msgSend_inputScale(v4, v116, v117);
    v119 = v118;
    objc_msgSend_intermediates(v4, v120, v121);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputFaceMaskAdjBlurTex(v170, v122, v123);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_intermediates(v4, v124, v125);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputWeightsXTex(v167, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_intermediates(v4, v129, v130);
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputWeightsYTex(v166, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_intermediates(v4, v134, v135);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputSampledDTex(v164, v136, v137);
    v138 = v30;
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_intermediates(v4, v140, v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputBlurRefineIntermediateTex(v142, v143, v144);
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_captureFolderMiscPath(v4, v146, v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v162 = (void *)v138;
    LODWORD(v149) = v168;
    LODWORD(v150) = v107;
    LODWORD(v151) = v111;
    LODWORD(v152) = v115;
    objc_msgSend_createBlurMapUsingMetadata_simulatedAperture_focusWindow_focalLengthInPixels_normalizedFocalLength_facePoints_maxBlur_inputScale_inputsAlreadyScaled_inputShiftMap_inputSegmentation_inputHair_inputGlasses_inputImageLuma_inputImageChroma_inputFaceMaskAdjBlur_inputWeightsX_inputWeightsY_inputPreproc_inputSampledD_inputDisparityRefineBlur_inputAlphaMaskDelta_inputHairMaskDelta_inputBlurRefineIntermediate_resultAdjBlurMap_coreImageRender_context_captureFolderMiscPath_(v171, v153, (uint64_t)v169, v181, 1, v173, v175, v174, v149, v97, v99, v101, v103, v150, v151, v152, v119, v172, v138,
      v179,
      v165,
      v128,
      v133,
      v180,
      v139,
      v46,
      v177,
      v176,
      v145,
      v178,
      0,
      v6,
      v148);
    v154 = (void *)objc_claimAutoreleasedReturnValue();

    if (v154)
    {
      objc_msgSend_metalRender_waitUntilScheduled_waitUntilCompleted_(v154, v155, v171[1], 0, 0);
      objc_msgSend_empty(v6, v156, v157);

      v158 = 0;
    }
    else
    {
      v158 = -1;
    }
    v5 = v163;
    v160 = (void *)v46;
    v159 = v162;
  }
  else
  {
    v172 = 0;
    v173 = 0;
    v159 = 0;
    v178 = 0;
    v179 = 0;
    v160 = 0;
    v180 = 0;
    v176 = 0;
    v177 = 0;
    v174 = 0;
    v175 = 0;
    v158 = -1;
  }

  objc_autoreleasePoolPop(v5);
  return v158;
}

- (id)imageUsingArgs:(id)a3
{
  id v4;
  void *v5;
  UniContext *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  CGColorSpace *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  double x;
  double y;
  double width;
  double height;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  const char *v62;
  void *v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  void *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  UniFakeImage *v85;
  const char *v86;
  void *v87;
  UniFakeImage *v88;
  const char *v89;
  UniFakeImage *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  UniFakeImage *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  int v113;
  const char *v114;
  uint64_t v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  const char *v124;
  uint64_t v125;
  int v126;
  int v127;
  const char *v128;
  uint64_t v129;
  int v130;
  int v131;
  const char *v132;
  uint64_t v133;
  int v134;
  int v135;
  const char *v136;
  uint64_t v137;
  int v138;
  int v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  void *v149;
  const char *v150;
  uint64_t v151;
  const char *v152;
  void *v153;
  const char *v154;
  void *v155;
  const char *v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  double v165;
  double v166;
  double v167;
  double v168;
  const char *v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  id v178;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  int v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  char isKindOfClass;
  MakeBlurMap *v193;
  UniContext *v194;
  void *v195;
  double v196;
  void *v197;
  double v198;
  void *v199;
  double v200;
  void *v201;
  double v202;
  void *v203;
  CGAffineTransform v204;
  CGAffineTransform v205;
  _BYTE v206[256];
  void *v207;
  _QWORD v208[3];
  CGRect v209;
  CGRect v210;
  CGRect v211;

  v208[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BD25858]();
  v6 = objc_alloc_init(UniContext);
  if ((objc_msgSend_validateForCoreImage(v4, v7, v8) & 1) != 0)
  {
    v195 = v5;
    v193 = self;
    objc_msgSend_allocateFakeResources(self, v9, v10);
    objc_msgSend_inputImage(v4, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (!v15)
    {
      objc_msgSend_inputImageLuma(v4, v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v17 = 0x24BDBF000uLL;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (!v15)

    v194 = v6;
    objc_msgSend_inputImage(v4, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v23 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
      objc_msgSend_inputImage(v4, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_imageYCC444_matrix_fullRange_colorSpace_(MEMORY[0x24BDBF660], v27, (uint64_t)v26, 601, 1, v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      CGColorSpaceRelease(v23);
      objc_msgSend_extent(v28, v29, v30);
      v32 = v31;
      v196 = v31;
      v198 = v33;
      v34 = v33;
      v36 = v35;
      v200 = v35;
      v202 = v37;
      v38 = v37;
      objc_msgSend_colorKernelWithName_andOutputFormat_(CoreImageOnlyLibrary, v39, (uint64_t)CFSTR("ccp_chroma"), *MEMORY[0x24BDBF8C8]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_colorKernelWithName_andOutputFormat_(CoreImageOnlyLibrary, v41, (uint64_t)CFSTR("ccp_luma"), *MEMORY[0x24BDBF8D0]);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&v205, 0, sizeof(v205));
      CGAffineTransformMakeScale(&v205, 0.5, 0.5);
      v204 = v205;
      v209.origin.x = v32;
      v209.origin.y = v34;
      v209.size.width = v36;
      v209.size.height = v38;
      v210 = CGRectApplyAffineTransform(v209, &v204);
      v211 = CGRectIntegral(v210);
      x = v211.origin.x;
      y = v211.origin.y;
      width = v211.size.width;
      height = v211.size.height;
      objc_msgSend_imageByClampingToExtent(v28, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = v205;
      objc_msgSend_imageByApplyingTransform_(v49, v50, (uint64_t)&v204);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_extent(v51, v52, v53);
      v55 = v54;
      v57 = v56;
      v59 = v58;
      v61 = v60;
      v208[0] = v51;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v62, (uint64_t)v208, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_arguments_(v40, v64, (uint64_t)v63, v55, v57, v59, v61);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_imageByCroppingToRect_(v65, v66, v67, x, y, width, height);
      v68 = (void *)objc_claimAutoreleasedReturnValue();

      v207 = v28;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v69, (uint64_t)&v207, 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_applyWithExtent_arguments_(v42, v71, (uint64_t)v70, v196, v198, v200, v202);
      v201 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = 0x24BDBF000;
    }
    else
    {
      objc_msgSend_inputImageLuma(v4, v21, v22);
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_inputImageChroma(v4, v74, v75);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v76 = *(void **)(v17 + 1632);
    objc_msgSend_blackColor(MEMORY[0x24BDBF638], v72, v73);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithColor_(v76, v78, (uint64_t)v77);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = v68;
    objc_msgSend_extent(v68, v80, v81);
    objc_msgSend_imageByCroppingToRect_(v79, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();

    v85 = [UniFakeImage alloc];
    v87 = (void *)objc_msgSend_initWithCIImage_format_(v85, v86, (uint64_t)v84, 25);
    v88 = [UniFakeImage alloc];
    v203 = (void *)objc_msgSend_initWithCIImage_format_(v88, v89, (uint64_t)v84, 65);
    v90 = [UniFakeImage alloc];
    v199 = (void *)objc_msgSend_initWithCIImage_format_(v90, v91, (uint64_t)v84, 115);
    objc_msgSend_inputShiftMap(v4, v92, v93);
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = *(void **)(v17 + 1632);
    objc_msgSend_blackColor(MEMORY[0x24BDBF638], v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithColor_(v94, v98, (uint64_t)v97);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_extent(v191, v100, v101);
    objc_msgSend_imageByCroppingToRect_(v99, v102, v103);
    v190 = (void *)objc_claimAutoreleasedReturnValue();

    v104 = [UniFakeImage alloc];
    v197 = (void *)objc_msgSend_initWithCIImage_format_(v104, v105, (uint64_t)v190, 25);
    objc_msgSend_facePoints(v4, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    sub_24B6CC480((uint64_t)v206, v108);

    objc_msgSend_metadata(v4, v109, v110);
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_simulatedAperture(v4, v111, v112);
    v186 = v113;
    objc_msgSend_focusWindow(v4, v114, v115);
    v117 = v116;
    v119 = v118;
    v121 = v120;
    v123 = v122;
    objc_msgSend_focalLengthInPixels(v4, v124, v125);
    v127 = v126;
    objc_msgSend_normalizedFocalLength(v4, v128, v129);
    v131 = v130;
    objc_msgSend_maxBlur(v4, v132, v133);
    v135 = v134;
    objc_msgSend_inputScale(v4, v136, v137);
    v139 = v138;
    objc_msgSend_inputShiftMap(v4, v140, v141);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithCIImage_(UniImage, v142, (uint64_t)v189);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputSegmentation(v4, v143, v144);
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithCIImage_(UniImage, v145, (uint64_t)v185);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputHair(v4, v146, v147);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithCIImage_(UniImage, v148, (uint64_t)v184);
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputGlasses(v4, v150, v151);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithCIImage_(UniImage, v152, (uint64_t)v182);
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithCIImage_(UniImage, v154, (uint64_t)v201);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageWithCIImage_(UniImage, v156, (uint64_t)v68);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_metadata(v4, v158, v159);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_getUnifiedRenderingForegroundBlurEnabled_(SDOFMetadata, v160, (uint64_t)v180))v163 = v203;
    else
      v163 = v87;
    objc_msgSend_captureFolderMiscPath(v4, v161, v162);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v194;
    LODWORD(v165) = v186;
    LODWORD(v166) = v127;
    LODWORD(v167) = v131;
    LODWORD(v168) = v135;
    objc_msgSend_createBlurMapUsingMetadata_simulatedAperture_focusWindow_focalLengthInPixels_normalizedFocalLength_facePoints_maxBlur_inputScale_inputsAlreadyScaled_inputShiftMap_inputSegmentation_inputHair_inputGlasses_inputImageLuma_inputImageChroma_inputFaceMaskAdjBlur_inputWeightsX_inputWeightsY_inputPreproc_inputSampledD_inputDisparityRefineBlur_inputAlphaMaskDelta_inputHairMaskDelta_inputBlurRefineIntermediate_resultAdjBlurMap_coreImageRender_context_captureFolderMiscPath_(v193, v169, (uint64_t)v188, v206, 0, v181, v183, v149, v165, v117, v119, v121, v123, v166, v167, v168, v139, v153, v155,
      v157,
      v87,
      v197,
      v197,
      v199,
      v87,
      v87,
      v87,
      v87,
      v87,
      v163,
      isKindOfClass & 1,
      v194,
      v164);
    v170 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_image(v170, v171, v172);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_empty(v194, v174, v175);

    v5 = v195;
  }
  else
  {
    objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v9, v10);
    v173 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_autoreleasePoolPop(v5);
  if (v173)
  {
    v178 = v173;
  }
  else
  {
    objc_msgSend_inputImage(v4, v176, v177);
    v178 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v178;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurmap_y_smoothing_scaled_unbiased, 0);
  objc_storeStrong((id *)&self->_blurmap_x_smoothing_scaled_unbiased, 0);
  objc_storeStrong((id *)&self->_blurmap_y_smoothing_unbiased, 0);
  objc_storeStrong((id *)&self->_blurmap_x_smoothing_unbiased, 0);
  objc_storeStrong((id *)&self->_blurmap_y_smoothing_scaled, 0);
  objc_storeStrong((id *)&self->_blurmap_x_smoothing_scaled, 0);
  objc_storeStrong((id *)&self->_blurmap_y_smoothing, 0);
  objc_storeStrong((id *)&self->_blurmap_x_smoothing, 0);
  objc_storeStrong((id *)&self->_crispHairDownsamplingSingle, 0);
  objc_storeStrong((id *)&self->_crispHairExpandedDisparitySingleY, 0);
  objc_storeStrong((id *)&self->_crispHairExpandedDisparityY, 0);
  objc_storeStrong((id *)&self->_crispHairExpandedDisparityX, 0);
  objc_storeStrong((id *)&self->_crispHairBlurSingleY, 0);
  objc_storeStrong((id *)&self->_crispHairBlurSingleX, 0);
  objc_storeStrong((id *)&self->_crispHairBlurY, 0);
  objc_storeStrong((id *)&self->_crispHairBlurX, 0);
  objc_storeStrong((id *)&self->_sparseRenderingPreprocessingScaled, 0);
  objc_storeStrong((id *)&self->_guidedFilter, 0);
  objc_storeStrong((id *)&self->_fpDisparityRefinementPreprocessing, 0);
  objc_storeStrong((id *)&self->_faceMaskOutputParamsTex, 0);
  objc_storeStrong((id *)&self->_faceMaskApply, 0);
  objc_storeStrong((id *)&self->_faceMaskCalc, 0);
  objc_storeStrong((id *)&self->_segmentationFusion, 0);
  objc_storeStrong((id *)&self->_eyeProtectionFacesTex, 0);
  objc_storeStrong((id *)&self->_faceParamsTex, 0);
  objc_storeStrong((id *)&self->_morphology, 0);
  objc_storeStrong((id *)&self->_blendBackgroundBlur, 0);
  objc_storeStrong((id *)&self->_thresholdedSobel, 0);
  objc_storeStrong((id *)&self->_modifyBlurmapGlasses, 0);
  objc_storeStrong((id *)&self->_modifyBlurmap, 0);
  objc_storeStrong((id *)&self->_eyeProtectionGlassesFace, 0);
  objc_storeStrong((id *)&self->_eyeProtectionFace, 0);
  objc_storeStrong((id *)&self->_mapLinearNoSecondary, 0);
  objc_storeStrong((id *)&self->_mapLinear, 0);
  objc_storeStrong((id *)&self->_gaussian, 0);
  objc_storeStrong((id *)&self->_thresholdHard, 0);
  objc_storeStrong((id *)&self->_insertPositiveBlurValues, 0);
  objc_storeStrong((id *)&self->_extractPositiveBlurValues, 0);
  objc_storeStrong((id *)&self->_passthrough, 0);
  objc_storeStrong((id *)&self->_antialiasWithForegroundBlur, 0);
  objc_storeStrong((id *)&self->_antialias, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_preprocessing, 0);
  objc_storeStrong((id *)&self->_calcWeightsY, 0);
  objc_storeStrong((id *)&self->_calcWeightsX, 0);
  objc_storeStrong((id *)&self->_outputParamsImage, 0);
  objc_storeStrong((id *)&self->_minMaxTex, 0);
  objc_storeStrong((id *)&self->_slmCalcEyes, 0);
  objc_storeStrong((id *)&self->_slmCalc, 0);
  objc_storeStrong((id *)&self->_slmMinMax, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_mtlQueue, 0);
}

@end
