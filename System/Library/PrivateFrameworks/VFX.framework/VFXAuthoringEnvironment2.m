@implementation VFXAuthoringEnvironment2

+ (id)authoringEnvironmentForWorld:(id)a3
{
  return (id)objc_msgSend_authoringEnvironmentForWorld_createIfNeeded_(a1, a2, (uint64_t)a3, 1);
}

+ (id)authoringEnvironmentForWorld:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;

  v4 = a4;
  v9 = (void *)objc_msgSend_authoringEnvironment2(a3, a2, (uint64_t)a3, a4);
  if (!v9 && v4)
  {
    v10 = objc_msgSend_worldRef(a3, v6, v7, v8);
    if (v10)
    {
      v18 = v10;
      sub_1B187973C(v10, v11, v12, v13, v14, v15, v16, v17);
      v9 = (void *)sub_1B187BE28(v18, (const char *)1, v19, v20);
      sub_1B18797B4(v18, v21, v22, v23, v24, v25, v26, v27);
      objc_msgSend_setAuthoringEnvironment2_(a3, v28, (uint64_t)v9, v29);
    }
    else
    {
      return 0;
    }
  }
  return v9;
}

- (VFXAuthoringEnvironment2)initWithWorld:(id)a3
{
  VFXAuthoringEnvironment2 *v4;
  const char *v5;
  uint64_t v6;
  VFXAuthoringEnvironment2 *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VFXAuthoringEnvironment2;
  v4 = -[VFXAuthoringEnvironment2 init](&v9, sel_init);
  v7 = v4;
  if (v4)
    objc_msgSend_prepareWorld_(v4, v5, (uint64_t)a3, v6);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_lightsDictionary);
  CFRelease(self->_camerasDictionary);
  CFRelease(self->_effectsDictionary);
  CFRelease(self->_forceFieldsDictionary);

  v3.receiver = self;
  v3.super_class = (Class)VFXAuthoringEnvironment2;
  -[VFXAuthoringEnvironment2 dealloc](&v3, sel_dealloc);
}

- (void)prepareWorld:(id)a3
{
  uint64_t v3;
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  VFXNode *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  VFXNode *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  double v46;
  double v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *Material;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  const void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  const char *v154;
  const char *v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  const char *v190;
  void *v191;
  uint64_t v192;
  uint64_t v193;
  float32x4_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  float32x4_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  float32x4_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  float32x4_t v209;
  uint64_t v210;
  float v211;
  float32x4_t v212;
  float32x4_t v213;
  void *v214;
  char *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  double v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  double v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  __CFXWorld *world;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  const void *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  const char *v283;
  uint64_t v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  const char *v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  void *Object;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  void *v317;
  double v318;
  double v319;
  double v320;
  double v321;
  double v322;
  float32x4_t v323;
  float32x4_t v324;
  float32x4_t v326;
  double v327;
  _QWORD v328[6];
  __int128 v329;
  __int128 v330;
  __int128 v331;
  __int128 v332;
  __int128 v333;
  uint64_t v334;
  const __CFString *v335;
  _QWORD v336[3];

  v336[1] = *MEMORY[0x1E0C80C00];
  self->_world = (__CFXWorld *)objc_msgSend_worldRef(a3, a2, (uint64_t)a3, v3);
  self->_manipulator = objc_alloc_init(VFXManipulator);
  self->_selection = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  self->_lightsDictionary = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  self->_camerasDictionary = CFDictionaryCreateMutable(0, 0, v5, v6);
  self->_effectsDictionary = CFDictionaryCreateMutable(0, 0, v5, v6);
  self->_forceFieldsDictionary = CFDictionaryCreateMutable(0, 0, v5, v6);
  self->_layerRoot = (VFXNode *)(id)objc_msgSend_node(VFXNode, v7, v8, v9);
  self->_overlayLayerRoot = (VFXNode *)(id)objc_msgSend_node(VFXNode, v10, v11, v12);
  self->_lightRoot = (VFXNode *)objc_msgSend_node(VFXNode, v13, v14, v15);
  self->_cameraRoot = (VFXNode *)objc_msgSend_node(VFXNode, v16, v17, v18);
  self->_effectRoot = (VFXNode *)objc_msgSend_node(VFXNode, v19, v20, v21);
  v332 = 0u;
  v333 = 0u;
  v330 = 0u;
  v331 = 0u;
  v329 = 0u;
  sub_1B1826F64((uint64_t)&v329, 3u);
  v23 = sub_1B182622C((uint64_t *)&v329, v22);
  v26 = (VFXNode *)objc_msgSend_nodeWithModel_(VFXNode, v24, (uint64_t)v23, v25);
  self->_cameraTarget = v26;
  objc_msgSend_setHidden_(v26, v27, 1, v28);
  if ((_QWORD)v332)
  {
    *((_QWORD *)&v332 + 1) = v332;
    operator delete((void *)v332);
  }
  if (*((_QWORD *)&v330 + 1))
  {
    *(_QWORD *)&v331 = *((_QWORD *)&v330 + 1);
    operator delete(*((void **)&v330 + 1));
  }
  if ((_QWORD)v329)
  {
    *((_QWORD *)&v329 + 1) = v329;
    operator delete((void *)v329);
  }
  self->_forceFieldsRoot = (VFXNode *)objc_msgSend_node(VFXNode, v29, v30, v31);
  self->_pointsOfViewRoot = (VFXNode *)objc_msgSend_node(VFXNode, v32, v33, v34);
  v38 = (VFXNode *)(id)objc_msgSend_node(VFXNode, v35, v36, v37);
  self->_grid = v38;
  objc_msgSend_setHidden_(v38, v39, 1, v40);
  objc_msgSend_setEulerAngles_(self->_grid, v41, v42, v43);
  objc_msgSend_setRenderingOrder_(self->_grid, v44, 0x7FFFFFFFLL, v45);
  LODWORD(v46) = 1148846080;
  LODWORD(v47) = 1148846080;
  v51 = (void *)objc_msgSend_planeWithWidth_height_(VFXParametricModel, v48, v49, v50, v46, v47);
  Material = (void *)objc_msgSend_firstMaterial(v51, v52, v53, v54);
  objc_msgSend_setShadingModel_(Material, v56, 2, v57);
  v61 = (void *)objc_msgSend_firstMaterial(v51, v58, v59, v60);
  objc_msgSend_setBlendMode_(v61, v62, 1, v63);
  v67 = (void *)objc_msgSend_firstMaterial(v51, v64, v65, v66);
  objc_msgSend_setDoubleSided_(v67, v68, 1, v69);
  v73 = (void *)objc_msgSend_firstMaterial(v51, v70, v71, v72);
  objc_msgSend_setWritesToDepthBuffer_(v73, v74, 0, v75);
  v76 = sub_1B19B83D4(CFSTR("CFX-Grid.metal"));
  v335 = CFSTR("VFXShaderModifierEntryPointFragment");
  v336[0] = v76;
  v78 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v77, (uint64_t)v336, (uint64_t)&v335, 1);
  v82 = (void *)objc_msgSend_firstMaterial(v51, v79, v80, v81);
  objc_msgSend_setShaderModifiers_(v82, v83, v78, v84);
  objc_msgSend_setModel_(self->_grid, v85, (uint64_t)v51, v86);
  objc_msgSend_setName_(self->_layerRoot, v87, (uint64_t)CFSTR("_layerRoot"), v88);
  objc_msgSend_setName_(self->_overlayLayerRoot, v89, (uint64_t)CFSTR("_overlayLayerRoot"), v90);
  objc_msgSend_setName_(self->_lightRoot, v91, (uint64_t)CFSTR("_lightRoot"), v92);
  objc_msgSend_setName_(self->_cameraRoot, v93, (uint64_t)CFSTR("_cameraRoot"), v94);
  objc_msgSend_setName_(self->_effectRoot, v95, (uint64_t)CFSTR("_effectRoot"), v96);
  objc_msgSend_setName_(self->_forceFieldsRoot, v97, (uint64_t)CFSTR("_forceFieldRoot"), v98);
  objc_msgSend_setName_(self->_pointsOfViewRoot, v99, (uint64_t)CFSTR("_pointsOfViewRoot"), v100);
  self->_paleGreen = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v101, (uint64_t)&unk_1B22461C0, v102);
  self->_paleBlue = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v103, (uint64_t)&unk_1B22461D0, v104);
  self->_red = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v105, (uint64_t)&unk_1B22461E0, v106);
  self->_green = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v107, (uint64_t)&unk_1B22461F0, v108);
  self->_blue = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v109, (uint64_t)&unk_1B2246200, v110);
  self->_cyan = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v111, (uint64_t)&unk_1B2246210, v112);
  self->_yellow = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v113, (uint64_t)&unk_1B2246220, v114);
  self->_orange = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v115, (uint64_t)&unk_1B2246230, v116);
  self->_pink = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v117, (uint64_t)&unk_1B2246240, v118);
  self->_grayLight = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v119, (uint64_t)&unk_1B2246250, v120);
  self->_grayMedium = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v121, (uint64_t)&unk_1B2246260, v122);
  self->_grayDark = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v123, (uint64_t)&unk_1B2246270, v124);
  self->_white = (UIColor *)(id)objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v125, (uint64_t)&unk_1B2246280, v126);
  objc_msgSend_setIsAuthoring_(self->_layerRoot, v127, 1, v128);
  objc_msgSend_setIsAuthoring_(self->_overlayLayerRoot, v129, 1, v130);
  objc_msgSend_setIsAuthoring_(self->_lightRoot, v131, 1, v132);
  objc_msgSend_setIsAuthoring_(self->_cameraRoot, v133, 1, v134);
  objc_msgSend_setIsAuthoring_(self->_effectRoot, v135, 1, v136);
  objc_msgSend_setIsAuthoring_(self->_forceFieldsRoot, v137, 1, v138);
  objc_msgSend_setIsAuthoring_(self->_cameraTarget, v139, 1, v140);
  objc_msgSend_setIsAuthoring_(self->_pointsOfViewRoot, v141, 1, v142);
  objc_msgSend_setIsAuthoring_(self->_grid, v143, 1, v144);
  objc_msgSend_setHidden_(self->_lightRoot, v145, 0, v146);
  objc_msgSend_setHidden_(self->_cameraRoot, v147, 0, v148);
  objc_msgSend_setHidden_(self->_effectRoot, v149, 0, v150);
  objc_msgSend_setHidden_(self->_forceFieldsRoot, v151, 0, v152);
  objc_msgSend_setRootNode_forLayer_(a3, v153, (uint64_t)self->_layerRoot, 1);
  objc_msgSend_setRootNode_forLayer_(a3, v154, (uint64_t)self->_overlayLayerRoot, 2);
  objc_msgSend_addChildNode_(self->_layerRoot, v155, (uint64_t)self->_lightRoot, v156);
  objc_msgSend_addChildNode_(self->_layerRoot, v157, (uint64_t)self->_cameraRoot, v158);
  objc_msgSend_addChildNode_(self->_layerRoot, v159, (uint64_t)self->_effectRoot, v160);
  objc_msgSend_addChildNode_(self->_layerRoot, v161, (uint64_t)self->_forceFieldsRoot, v162);
  objc_msgSend_addChildNode_(self->_layerRoot, v163, (uint64_t)self->_cameraTarget, v164);
  objc_msgSend_addChildNode_(self->_layerRoot, v165, (uint64_t)self->_pointsOfViewRoot, v166);
  objc_msgSend_addChildNode_(self->_layerRoot, v167, (uint64_t)self->_grid, v168);
  v317 = (void *)objc_msgSend_rootNode(a3, v169, v170, v171);
  objc_msgSend_begin(VFXTransaction, v172, v173, v174);
  objc_msgSend_setAnimationDuration_(VFXTransaction, v175, v176, v177, 0.0);
  v181 = objc_msgSend_worldRef(a3, v178, v179, v180);
  v328[0] = MEMORY[0x1E0C809B0];
  v328[1] = 3221225472;
  v328[2] = sub_1B17DA75C;
  v328[3] = &unk_1E63D5860;
  v328[4] = self;
  v328[5] = v181;
  objc_msgSend_enumerateChildNodesUsingBlock_(v317, v182, (uint64_t)v328, v183);
  objc_msgSend_commit(VFXTransaction, v184, v185, v186);
  v334 = objc_msgSend_rootNode(a3, v187, v188, v189);
  v191 = (void *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v190, (uint64_t)&v334, 1);
  VFXNodeGetBoundingSphere(v191, (const char *)0x10000, v192, v193);
  v326 = v194;
  objc_msgSend_localUp(VFXNode, v195, v196, v197);
  v324 = v198;
  objc_msgSend_localRight(VFXNode, v199, v200, v201);
  v323 = v202;
  objc_msgSend_localFront(VFXNode, v203, v204, v205);
  v210 = 0;
  if (v326.f32[3] <= 0.0)
    v211 = 1.0;
  else
    v211 = v326.f32[3] * 1.33;
  v212 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  *(_QWORD *)&v322 = vmlaq_f32(v326, v212, v209).u64[0];
  v213 = (float32x4_t)vdupq_n_s32(0xC47A0000);
  *(_QWORD *)&v321 = vmlaq_f32(v326, v213, v209).u64[0];
  *(_QWORD *)&v320 = vmlaq_f32(v326, v212, v323).u64[0];
  *(_QWORD *)&v319 = vmlaq_f32(v326, v213, v323).u64[0];
  *(_QWORD *)&v318 = vmlaq_f32(v326, v213, v324).u64[0];
  *(_QWORD *)&v327 = vmlaq_f32(v326, v212, v324).u64[0];
  do
  {
    v214 = (void *)objc_msgSend_camera(VFXCamera, v206, v207, v208);
    v215 = off_1E63D5880[v210];
    v218 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v216, (uint64_t)CFSTR("_authoringCamera%s"), v217, v215);
    objc_msgSend_setName_(v214, v219, v218, v220);
    objc_msgSend_setUsesOrthographicProjection_(v214, v221, v210 != 0, v222);
    objc_msgSend_setAutomaticallyAdjustsZRange_(v214, v223, 1, v224);
    *(float *)&v225 = v211;
    objc_msgSend_setOrthographicScale_(v214, v226, v227, v228, v225);
    v232 = (void *)objc_msgSend_node(VFXNode, v229, v230, v231);
    objc_msgSend_setCamera_(v232, v233, (uint64_t)v214, v234);
    v237 = objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v235, (uint64_t)v215, v236);
    objc_msgSend_setName_(v232, v238, v237, v239);
    objc_msgSend_setIsAuthoring_(v232, v240, 1, v241);
    objc_msgSend_setAuthoringCameraType_(v232, v242, v210, v243);
    switch((int)v210)
    {
      case 0:
        v247 = (void *)objc_msgSend_camera(v232, v244, v245, v246);
        LODWORD(v248) = 1036831949;
        objc_msgSend_setZNear_(v247, v249, v250, v251, v248);
        world = self->_world;
        if (world
          && (sub_1B187973C((uint64_t)world, v252, v253, v254, v255, v256, v257, v258),
              v266 = (const void *)sub_1B17B2908((__n128 *)self->_world, 1, v260, v261, v262, v263, v264, v265),
              sub_1B18797B4((uint64_t)self->_world, v267, v268, v269, v270, v271, v272, v273),
              v266))
        {
          v276 = (void *)objc_msgSend_nodeWithNodeRef_(VFXNode, v274, (uint64_t)v266, v275);
          objc_msgSend_transform(v276, v277, v278, v279);
          objc_msgSend_setTransform_(v232, v280, v281, v282);
          CFRelease(v266);
        }
        else
        {
          v301 = objc_opt_class();
          v303 = (void *)objc_msgSend_childNodesWithAttribute_recursively_(v317, v302, v301, 1);
          Object = (void *)objc_msgSend_firstObject(v303, v304, v305, v306);
          if (Object)
          {
            objc_msgSend_transform(Object, v308, v309, v310);
            objc_msgSend_setTransform_(v232, v311, v312, v313);
          }
          else
          {
            objc_msgSend_setEulerAngles_(v232, v308, v309, v310, 0.000707015742);
            objc_msgSend_setPosition_(v232, v314, v315, v316, 0.11150004);
          }
        }
        break;
      case 1:
        objc_msgSend_setEulerAngles_(v232, v244, v245, v246, COERCE_DOUBLE(3217625051));
        objc_msgSend_setWorldPosition_(v232, v283, v284, v285, v327);
        break;
      case 2:
        objc_msgSend_setEulerAngles_(v232, v244, v245, v246, COERCE_DOUBLE(1070141403));
        objc_msgSend_setWorldPosition_(v232, v286, v287, v288, v318);
        break;
      case 3:
        objc_msgSend_setEulerAngles_(v232, v244, v245, v246, -0.195796371);
        objc_msgSend_setWorldPosition_(v232, v289, v290, v291, v319);
        break;
      case 4:
        objc_msgSend_setEulerAngles_(v232, v244, v245, v246, 0.195796371);
        objc_msgSend_setWorldPosition_(v232, v292, v293, v294, v320);
        break;
      case 5:
        objc_msgSend_setEulerAngles_(v232, v244, v245, v246, 0.0);
        objc_msgSend_setWorldPosition_(v232, v295, v296, v297, v321);
        break;
      case 6:
        objc_msgSend_setEulerAngles_(v232, v244, v245, v246, -50.1238708);
        objc_msgSend_setWorldPosition_(v232, v298, v299, v300, v322);
        break;
      default:
        break;
    }
    objc_msgSend_addChildNode_(self->_pointsOfViewRoot, v244, (uint64_t)v232, v246);
    ++v210;
  }
  while (v210 != 7);
}

- (unsigned)debugOptions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = objc_msgSend__engineContext(self->_renderer, a2, v2, v3);
  if (v4)
    LODWORD(v4) = sub_1B1814458(v4);
  return v4;
}

- (BOOL)hasDebugOption:(unsigned int)a3
{
  uint64_t v3;

  return (a3 & ~objc_msgSend_debugOptions(self, a2, *(uint64_t *)&a3, v3)) == 0;
}

- (id)authoringCameraNodes
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_childNodes(self->_pointsOfViewRoot, a2, v2, v3);
}

- (VFXManipulator)manipulator
{
  return self->_manipulator;
}

- (id)geometryForLightType:(int)a3
{
  uint64_t v3;
  VFXModel *lightGeometry;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *Material;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19[2];
  void *v20[2];
  __int128 v21;
  void *__p[2];
  __int128 v23;

  if (a3 == 4)
    return 0;
  lightGeometry = self->_lightGeometry;
  if (!lightGeometry)
  {
    *(_OWORD *)__p = 0u;
    v23 = 0u;
    *(_OWORD *)v20 = 0u;
    v21 = 0u;
    *(_OWORD *)v19 = 0u;
    sub_1B1826F64((uint64_t)v19, 3u);
    self->_lightGeometry = (VFXModel *)sub_1B182622C((uint64_t *)v19, v7);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v20[1])
    {
      *(void **)&v21 = v20[1];
      operator delete(v20[1]);
    }
    if (v19[0])
    {
      v19[1] = v19[0];
      operator delete(v19[0]);
    }
    lightGeometry = self->_lightGeometry;
  }
  v8 = (void *)objc_msgSend_copy(lightGeometry, a2, *(uint64_t *)&a3, v3);
  Material = (void *)objc_msgSend_firstMaterial(self->_lightGeometry, v9, v10, v11);
  v16 = (id)objc_msgSend_copy(Material, v13, v14, v15);
  objc_msgSend_setFirstMaterial_(v8, v17, (uint64_t)v16, v18);
  return v8;
}

- (void)addLightNode:(__CFXNode *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;

  if (CFDictionaryContainsKey(self->_lightsDictionary, a3))
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: light node already has an authoring node - skip"), v6, v7, v8, v9, v10, v11, v33);
  }
  else
  {
    v12 = sub_1B1868FE8((uint64_t)a3, v5, v6, v7, v8, v9, v10, v11);
    v20 = sub_1B186064C((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
    v23 = objc_msgSend_geometryForLightType_(self, v21, v20, v22);
    v26 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v24, v23, v25);
    objc_msgSend_setName_(v26, v27, (uint64_t)CFSTR("lightAuth"), v28);
    sub_1B17DA99C(v26, (char *)a3, v29, v30);
    objc_msgSend_addChildNode_(self->_lightRoot, v31, (uint64_t)v26, v32);
    CFDictionaryAddValue(self->_lightsDictionary, a3, v26);
  }
}

- (id)effectGeometry
{
  uint64_t v2;
  uint64_t v3;
  VFXModel *effectGeometry;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *Material;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  float32x4_t v24;
  void *v25[2];
  void *v26[2];
  __int128 v27;
  void *__p[2];
  __int128 v29;

  effectGeometry = self->_effectGeometry;
  if (!effectGeometry)
  {
    *(_OWORD *)__p = 0u;
    v29 = 0u;
    *(_OWORD *)v26 = 0u;
    v27 = 0u;
    *(_OWORD *)v25 = 0u;
    v20 = 0u;
    sub_1B1826918((uint64_t)v25, (float32x4_t *)&v20, &xmmword_1B2246280, MEMORY[0x1E0C83FF0], 0.1, 0.6);
    v20 = xmmword_1B2245D30;
    v21 = xmmword_1B2245D40;
    v22 = xmmword_1B2244D90;
    v19 = xmmword_1B2244E20;
    v23 = xmmword_1B2244E20;
    v24 = 0u;
    sub_1B1826918((uint64_t)v25, &v24, &xmmword_1B2246280, (float32x4_t *)&v20, 0.1, 0.6);
    v20 = xmmword_1B2245D50;
    v21 = xmmword_1B2244DD0;
    v22 = xmmword_1B2245D60;
    v23 = xmmword_1B2244E20;
    v24 = 0u;
    sub_1B1826918((uint64_t)v25, &v24, &xmmword_1B2246280, (float32x4_t *)&v20, 0.1, 0.6);
    self->_effectGeometry = (VFXModel *)sub_1B182622C((uint64_t *)v25, v6);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v26[1])
    {
      *(void **)&v27 = v26[1];
      operator delete(v26[1]);
    }
    if (v25[0])
    {
      v25[1] = v25[0];
      operator delete(v25[0]);
    }
    effectGeometry = self->_effectGeometry;
  }
  v7 = (void *)objc_msgSend_copy(effectGeometry, a2, v2, v3, v19);
  Material = (void *)objc_msgSend_firstMaterial(self->_effectGeometry, v8, v9, v10);
  v15 = (id)objc_msgSend_copy(Material, v12, v13, v14);
  objc_msgSend_setFirstMaterial_(v7, v16, (uint64_t)v15, v17);
  return v7;
}

- (void)addEffectNode:(__CFXNode *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;

  if (CFDictionaryContainsKey(self->_effectsDictionary, a3))
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: effect node already has an authoring node - skip"), v6, v7, v8, v9, v10, v11, v30);
  }
  else
  {
    v12 = (void *)objc_msgSend_node(VFXNode, v5, v6, v7);
    v16 = objc_msgSend_effectGeometry(self, v13, v14, v15);
    v19 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v17, v16, v18);
    objc_msgSend_setName_(v19, v20, (uint64_t)CFSTR("particlesAuth"), v21);
    sub_1B17DA99C(v19, (char *)a3, v22, v23);
    objc_msgSend_setIsAuthoring_(v12, v24, 1, v25);
    objc_msgSend_addChildNode_(v12, v26, (uint64_t)v19, v27);
    objc_msgSend_addChildNode_(self->_effectRoot, v28, (uint64_t)v12, v29);
    CFDictionaryAddValue(self->_effectsDictionary, a3, v12);
  }
}

- (id)cameraGeometry
{
  id result;

  result = self->_cameraGeometry;
  if (!result)
  {
    result = sub_1B1826588();
    self->_cameraGeometry = (VFXModel *)result;
  }
  return result;
}

- (id)cameraFrustumGeometry
{
  id result;

  result = self->_cameraFrustumGeometry;
  if (!result)
  {
    result = sub_1B1826B1C();
    self->_cameraFrustumGeometry = (VFXModel *)result;
  }
  return result;
}

- (id)cameraOrthographicFrustumGeometry
{
  id result;

  result = self->_cameraOrthographicFrustumGeometry;
  if (!result)
  {
    result = sub_1B1826C78();
    self->_cameraOrthographicFrustumGeometry = (VFXModel *)result;
  }
  return result;
}

- (id)cameraNearPlaneGeometry
{
  id result;

  result = self->_cameraNearPlaneGeometry;
  if (!result)
  {
    result = sub_1B1826D20();
    self->_cameraNearPlaneGeometry = (VFXModel *)result;
  }
  return result;
}

- (id)cameraFocusPlaneGeometry
{
  id result;

  result = self->_cameraFocusPlaneGeometry;
  if (!result)
  {
    result = sub_1B1826DEC();
    self->_cameraFocusPlaneGeometry = (VFXModel *)result;
  }
  return result;
}

- (id)fieldGeometry
{
  id result;

  result = self->_fieldGeometry;
  if (!result)
  {
    result = sub_1B1826EB8();
    self->_fieldGeometry = (VFXModel *)result;
  }
  return result;
}

- (void)addCameraNode:(__CFXNode *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFDictionary *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;

  if (!CFDictionaryContainsKey(self->_camerasDictionary, a3) && !sub_1B186E064((uint64_t)a3))
  {
    v12 = (void *)sub_1B186B0BC((uint64_t)a3, v5, v6, v7, v8, v9, v10, v11);
    if ((!v12 || objc_msgSend_compare_(v12, v13, (uint64_t)CFSTR("kVFXFreeViewCameraName"), v14))
      && (sub_1B186E090((uint64_t)a3) & 1) == 0)
    {
      v18 = objc_msgSend_cameraGeometry(self, v15, v16, v17);
      v21 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v19, v18, v20);
      objc_msgSend_setName_(v21, v22, (uint64_t)CFSTR("cameraAuth"), v23);
      sub_1B17DA99C(v21, (char *)a3, v24, v25);
      v33 = sub_1B186CFA8((uint64_t)a3, v26, v27, v28, v29, v30, v31, v32);
      if (sub_1B18659C0((uint64_t)v33, v34, v35, v36, v37, v38, v39, v40))
        v44 = objc_msgSend_cameraOrthographicFrustumGeometry(self, v41, v42, v43);
      else
        v44 = objc_msgSend_cameraFrustumGeometry(self, v41, v42, v43);
      v47 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v45, v44, v46);
      objc_msgSend_setName_(v47, v48, (uint64_t)CFSTR("cameraFrustumAuth"), v49);
      objc_msgSend_setIsAuthoring_(v47, v50, 1, v51);
      objc_msgSend_setHittable_(v47, v52, 0, v53);
      v57 = objc_msgSend_cameraNearPlaneGeometry(self, v54, v55, v56);
      v60 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v58, v57, v59);
      objc_msgSend_setName_(v60, v61, (uint64_t)CFSTR("cameraNearPlaneAuth"), v62);
      objc_msgSend_setIsAuthoring_(v60, v63, 1, v64);
      objc_msgSend_setHittable_(v60, v65, 0, v66);
      v70 = objc_msgSend_cameraFocusPlaneGeometry(self, v67, v68, v69);
      v73 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v71, v70, v72);
      objc_msgSend_setName_(v73, v74, (uint64_t)CFSTR("cameraFocusPlaneAuth"), v75);
      objc_msgSend_setIsAuthoring_(v73, v76, 1, v77);
      objc_msgSend_setHittable_(v73, v78, 0, v79);
      objc_msgSend_addChildNode_(self->_cameraRoot, v80, (uint64_t)v21, v81);
      objc_msgSend_addChildNode_(v21, v82, (uint64_t)v47, v83);
      objc_msgSend_addChildNode_(v47, v84, (uint64_t)v60, v85);
      objc_msgSend_addChildNode_(v47, v86, (uint64_t)v73, v87);
      CFDictionaryAddValue(self->_camerasDictionary, a3, v21);
    }
  }
}

- (void)removeCameraNode:(__CFXNode *)a3
{
  void *Value;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  Value = (void *)CFDictionaryGetValue(self->_camerasDictionary, a3);
  objc_msgSend_removeFromParentNode(Value, v6, v7, v8);
  CFDictionaryRemoveValue(self->_camerasDictionary, a3);
}

- (void)addForceFieldNode:(__CFXNode *)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  if (CFDictionaryContainsKey(self->_forceFieldsDictionary, a3))
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: forceField node already has an authoring node - skip"), v6, v7, v8, v9, v10, v11, v22);
  }
  else
  {
    v12 = objc_msgSend_fieldGeometry(self, v5, v6, v7);
    v15 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v13, v12, v14);
    objc_msgSend_setName_(v15, v16, (uint64_t)CFSTR("fieldAuth"), v17);
    sub_1B17DA99C(v15, (char *)a3, v18, v19);
    objc_msgSend_addChildNode_(self->_forceFieldsRoot, v20, (uint64_t)v15, v21);
    CFDictionaryAddValue(self->_forceFieldsDictionary, a3, v15);
  }
}

- (void)removeForceFieldNode:(__CFXNode *)a3
{
  void *Value;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  Value = (void *)CFDictionaryGetValue(self->_forceFieldsDictionary, a3);
  objc_msgSend_removeFromParentNode(Value, v6, v7, v8);
  CFDictionaryRemoveValue(self->_forceFieldsDictionary, a3);
}

- (void)removeLightNode:(__CFXNode *)a3
{
  void *Value;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  Value = (void *)CFDictionaryGetValue(self->_lightsDictionary, a3);
  objc_msgSend_removeFromParentNode(Value, v6, v7, v8);
  CFDictionaryRemoveValue(self->_lightsDictionary, a3);
}

- (void)removeEffectNode:(__CFXNode *)a3
{
  void *Value;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  Value = (void *)CFDictionaryGetValue(self->_effectsDictionary, a3);
  objc_msgSend_removeFromParentNode(Value, v6, v7, v8);
  CFDictionaryRemoveValue(self->_effectsDictionary, a3);
}

- (void)addedNode:(__CFXNode *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (sub_1B186CDDC((uint64_t)a3, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7))
    objc_msgSend_addLightNode_(self, v10, (uint64_t)a3, v12);
  if (sub_1B186DD80((uint64_t)a3, (uint64_t)v10, v11, v12, v13, v14, v15, v16))
    objc_msgSend_addEffectNode_(self, v17, (uint64_t)a3, v18);
  if (sub_1B186D018((uint64_t)a3))
    objc_msgSend_addCameraNode_(self, v19, (uint64_t)a3, v21);
  if (sub_1B186DBB0((uint64_t)a3, (uint64_t)v19, v20, v21, v22, v23, v24, v25))
    MEMORY[0x1E0DE7D20](self, sel_addForceFieldNode_, a3, v26);
}

- (void)removedNode:(__CFXNode *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (sub_1B186E090((uint64_t)a3))
  {
    if (sub_1B186CDDC((uint64_t)a3, v5, v6, v7, v8, v9, v10, v11))
      objc_msgSend_removeLightNode_(self, v12, (uint64_t)a3, v14);
    if (sub_1B186DD80((uint64_t)a3, (uint64_t)v12, v13, v14, v15, v16, v17, v18))
      objc_msgSend_removeEffectNode_(self, v19, (uint64_t)a3, v20);
    if (sub_1B186D018((uint64_t)a3))
      objc_msgSend_removeCameraNode_(self, v21, (uint64_t)a3, v23);
    if (sub_1B186DBB0((uint64_t)a3, (uint64_t)v21, v22, v23, v24, v25, v26, v27))
      MEMORY[0x1E0DE7D20](self, sel_removeForceFieldNode_, a3, v28);
  }
}

- (void)selectNodes:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableSet *selection;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_sync_enter(self);
  objc_msgSend_removeAllObjects(self->_selection, v5, v6, v7);
  if (a3)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v8, (uint64_t)&v20, (uint64_t)v24, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(a3);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if ((objc_msgSend_isAuthoring(v15, v9, v10, v11) & 1) == 0)
          {
            selection = self->_selection;
            v17 = objc_msgSend_nodeRef(v15, v9, v10, v11);
            objc_msgSend_addObject_(selection, v18, v17, v19);
          }
        }
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v9, (uint64_t)&v20, (uint64_t)v24, 16);
      }
      while (v12);
    }
  }
  objc_sync_exit(self);
}

- (void)cancelSelection
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  objc_sync_enter(self);
  objc_msgSend_removeAllObjects(self->_selection, v3, v4, v5);
  objc_sync_exit(self);
}

- (void)_resetLightAuthoringWithContainerNode:(id)a3 source:(__CFXNode *)a4 light:(__CFXLight *)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  const char *v120;
  void *v121;
  double v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  const char *v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  const char *v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  const char *v155;
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
  const char *v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  void *Material;
  const char *v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  UIColor *white;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  const char *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  const char *v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  const char *v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  const char *v252;
  const char *v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  int v257;
  unsigned int v258;
  unint64_t v259;
  unint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  id *v267;
  const char *v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  float32x4_t v276[2];
  __int128 v277;
  _QWORD v278[5];
  void *v279[2];
  void *v280[2];
  __int128 v281;
  void *__p[2];
  __int128 v283;

  objc_msgSend_removeAllChilds(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v17 = sub_1B186064C((uint64_t)a5, v10, v11, v12, v13, v14, v15, v16);
  v20 = objc_msgSend_numberWithInt_(v9, v18, v17, v19);
  objc_msgSend_setValue_forKey_(a3, v21, v20, (uint64_t)CFSTR("VFXDebugLightTypeKey"));
  objc_msgSend_setValue_forKey_(a3, v22, 0, (uint64_t)CFSTR("VFXDebugLightSubTypeKey"));
  v30 = sub_1B186064C((uint64_t)a5, v23, v24, v25, v26, v27, v28, v29);
  if (!v30)
    return;
  if (v30 == 1)
  {
    *(_OWORD *)__p = 0u;
    v283 = 0u;
    *(_OWORD *)v280 = 0u;
    v281 = 0u;
    *(_OWORD *)v279 = 0u;
    sub_1B1826F64((uint64_t)v279, 3u);
    v39 = sub_1B182622C((uint64_t *)v279, v38);
    v42 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v40, (uint64_t)v39, v41);
    objc_msgSend_setName_(v42, v43, (uint64_t)CFSTR("lightInnerAuth"), v44);
    objc_msgSend_setIsAuthoring_(v42, v45, 1, v46);
    objc_msgSend_setHittable_(v42, v47, 0, v48);
    objc_msgSend_addChildNode_(a3, v49, (uint64_t)v42, v50);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v280[1])
    {
      *(void **)&v281 = v280[1];
      operator delete(v280[1]);
    }
    if (v279[0])
    {
      v279[1] = v279[0];
      operator delete(v279[0]);
    }
    *(_OWORD *)__p = 0u;
    v283 = 0u;
    *(_OWORD *)v280 = 0u;
    v281 = 0u;
    *(_OWORD *)v279 = 0u;
    sub_1B1826F64((uint64_t)v279, 3u);
    v52 = sub_1B182622C((uint64_t *)v279, v51);
    v55 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v53, (uint64_t)v52, v54);
    objc_msgSend_setName_(v55, v56, (uint64_t)CFSTR("lightOuterAuth"), v57);
    objc_msgSend_setIsAuthoring_(v55, v58, 1, v59);
    objc_msgSend_setHittable_(v55, v60, 0, v61);
    objc_msgSend_addChildNode_(a3, v62, (uint64_t)v55, v63);
LABEL_18:
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v280[1])
    {
      *(void **)&v281 = v280[1];
      operator delete(v280[1]);
    }
    if (v279[0])
    {
      v279[1] = v279[0];
      operator delete(v279[0]);
    }
    return;
  }
  if ((v30 & 0xFFFFFFFB) == 2)
  {
    *(_OWORD *)__p = 0u;
    v283 = 0u;
    *(_OWORD *)v280 = 0u;
    v281 = 0u;
    *(_OWORD *)v279 = 0u;
    sub_1B18277E0((uint64_t)v279, &xmmword_1B2246230);
    v65 = sub_1B18263D4((uint64_t *)v279, v64);
    v68 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v66, (uint64_t)v65, v67);
    objc_msgSend_setName_(v68, v69, (uint64_t)CFSTR("lightArrowAuth"), v70);
    objc_msgSend_setIsAuthoring_(v68, v71, 1, v72);
    objc_msgSend_setEulerAngles_(v68, v73, v74, v75, COERCE_DOUBLE(1078530011));
    __asm { FMOV            V0.4S, #10.0 }
    objc_msgSend_setScale_(v68, v81, v82, v83, *(double *)&_Q0);
    objc_msgSend_setHittable_(v68, v84, 0, v85);
    objc_msgSend_addChildNode_(a3, v86, (uint64_t)v68, v87);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v280[1])
    {
      *(void **)&v281 = v280[1];
      operator delete(v280[1]);
    }
    if (v279[0])
    {
      v279[1] = v279[0];
      operator delete(v279[0]);
    }
    *(_OWORD *)__p = 0u;
    v283 = 0u;
    *(_OWORD *)v280 = 0u;
    v281 = 0u;
    *(_OWORD *)v279 = 0u;
    v276[0] = 0u;
    sub_1B18266F0((uint64_t)v279, v276, &xmmword_1B2246230, (float32x4_t)xmmword_1B2245DB0);
    v89 = sub_1B182622C((uint64_t *)v279, v88);
    v92 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v90, (uint64_t)v89, v91);
    objc_msgSend_setPivot_(v92, v93, v94, v95, COERCE_DOUBLE(1065353216), unk_1B2245E20, 0.0, unk_1B2245E40);
    objc_msgSend_setName_(v92, v96, (uint64_t)CFSTR("lightShadowAuth"), v97);
    objc_msgSend_setIsAuthoring_(v92, v98, 1, v99);
    objc_msgSend_setHittable_(v92, v100, 0, v101);
    objc_msgSend_addChildNode_(a3, v102, (uint64_t)v92, v103);
    goto LABEL_18;
  }
  switch(v30)
  {
    case 5:
      v277 = 0u;
      memset(v276, 0, sizeof(v276));
      *(_QWORD *)&v113 = sub_1B1860FEC((uint64_t)a5, v32, v33, v34, v35, v36, v37, (uint64_t)v276).n128_u64[0];
      v116 = objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], v114, v276[0].u8[0], v115, v113);
      objc_msgSend_setValue_forKey_(a3, v117, v116, (uint64_t)CFSTR("VFXDebugLightSubTypeKey"));
      switch(v276[0].i8[0])
      {
        case 0:
          *(_OWORD *)__p = 0u;
          v283 = 0u;
          *(_OWORD *)v280 = 0u;
          v281 = 0u;
          *(_OWORD *)v279 = 0u;
          v274 = xmmword_1B2244DB0;
          v275 = xmmword_1B2244DC0;
          sub_1B182742C((uint64_t)v279, &v275, &v274, &xmmword_1B2246230, &xmmword_1B2246230);
          v121 = sub_1B182622C((uint64_t *)v279, v120);
          goto LABEL_65;
        case 1:
          *(_OWORD *)__p = 0u;
          v283 = 0u;
          *(_OWORD *)v280 = 0u;
          v281 = 0u;
          *(_OWORD *)v279 = 0u;
          v274 = xmmword_1B2244EC0;
          v275 = xmmword_1B2245D70;
          v272 = xmmword_1B2245D90;
          v273 = xmmword_1B2245D80;
          sub_1B18274D4((uint64_t)v279, &v275, &v274, &v273, &v272, &xmmword_1B2246230);
          v121 = sub_1B182622C((uint64_t *)v279, v252);
          goto LABEL_65;
        case 2:
          *(_OWORD *)__p = 0u;
          v283 = 0u;
          *(_OWORD *)v280 = 0u;
          v281 = 0u;
          *(_OWORD *)v279 = 0u;
          sub_1B18270C0((uint64_t)v279, &xmmword_1B2246230, (int32x2_t)COERCE_UNSIGNED_INT(1.0));
          v121 = sub_1B182622C((uint64_t *)v279, v253);
          goto LABEL_65;
        case 3:
          *(_OWORD *)__p = 0u;
          v283 = 0u;
          *(_OWORD *)v280 = 0u;
          v281 = 0u;
          *(_OWORD *)v279 = 0u;
          sub_1B1826F64((uint64_t)v279, 3u);
          v121 = sub_1B182622C((uint64_t *)v279, v254);
          goto LABEL_65;
        case 4:
          *(_OWORD *)__p = 0u;
          v283 = 0u;
          *(_OWORD *)v280 = 0u;
          v281 = 0u;
          *(_OWORD *)v279 = 0u;
          v255 = v277;
          if ((_BYTE)v277)
          {
            v256 = 0;
            v257 = v277 - 1;
            do
            {
              if (v257 == (_DWORD)v256)
                v258 = 0;
              else
                v258 = v256 + 1;
              *(float *)&v259 = -COERCE_FLOAT(*(_QWORD *)(*((_QWORD *)&v277 + 1) + 8 * v256));
              HIDWORD(v259) = HIDWORD(*(_QWORD *)(*((_QWORD *)&v277 + 1) + 8 * v256));
              *(float *)&v260 = -COERCE_FLOAT(*(_QWORD *)(*((_QWORD *)&v277 + 1) + 8 * v258));
              HIDWORD(v260) = HIDWORD(*(_QWORD *)(*((_QWORD *)&v277 + 1) + 8 * v258));
              v274 = v260;
              v275 = v259;
              sub_1B182742C((uint64_t)v279, &v275, &v274, &xmmword_1B2246230, &xmmword_1B2246230);
              ++v256;
            }
            while (v255 != v256);
          }
          v121 = sub_1B182622C((uint64_t *)v279, v118);
LABEL_65:
          v261 = (uint64_t)v121;
          sub_1B17DA70C((uint64_t)v279);
          v249 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v262, v261, v263);
          break;
        default:
          v249 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v118, 0, v119);
          break;
      }
      v264 = v249;
      objc_msgSend_setName_(v249, v250, (uint64_t)CFSTR("lightAreaAuth"), v251);
      objc_msgSend_setIsAuthoring_(v264, v265, 1, v266);
      v267 = sub_1B193E758((id *)a4);
      objc_msgSend_setAuthoringTargetNode_(v264, v268, (uint64_t)v267, v269);
      objc_msgSend_addChildNode_(a3, v270, (uint64_t)v264, v271);
      break;
    case 4:
      LODWORD(v122) = dword_1B2245DC0[sub_1B1861474((uint64_t)a5, (uint64_t)v31, v32, v33, v34, v35, v36, v37) == 1];
      v126 = (void *)objc_msgSend_sphereWithRadius_(VFXParametricModel, v123, v124, v125, v122);
      objc_msgSend_setName_(v126, v127, (uint64_t)CFSTR("probeGeometry"), v128);
      *(_OWORD *)__p = 0u;
      v283 = 0u;
      *(_OWORD *)v280 = 0u;
      v281 = 0u;
      *(_OWORD *)v279 = 0u;
      v276[0] = 0u;
      __asm { FMOV            V0.4S, #1.0 }
      sub_1B18266F0((uint64_t)v279, v276, &xmmword_1B2246280, _Q0);
      v131 = sub_1B182622C((uint64_t *)v279, v130);
      v134 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v132, (uint64_t)v131, v133);
      objc_msgSend_setName_(v134, v135, (uint64_t)CFSTR("lightInnerAuth"), v136);
      objc_msgSend_setIsAuthoring_(v134, v137, 1, v138);
      objc_msgSend_setHittable_(v134, v139, 0, v140);
      objc_msgSend_addChildNode_(a3, v141, (uint64_t)v134, v142);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v280[1])
      {
        *(void **)&v281 = v280[1];
        operator delete(v280[1]);
      }
      if (v279[0])
      {
        v279[1] = v279[0];
        operator delete(v279[0]);
      }
      *(_OWORD *)__p = 0u;
      v283 = 0u;
      *(_OWORD *)v280 = 0u;
      v281 = 0u;
      *(_OWORD *)v279 = 0u;
      v276[0] = 0u;
      __asm { FMOV            V0.4S, #1.0 }
      sub_1B18266F0((uint64_t)v279, v276, &xmmword_1B2246280, _Q0);
      v145 = sub_1B182622C((uint64_t *)v279, v144);
      v148 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v146, (uint64_t)v145, v147);
      objc_msgSend_setName_(v148, v149, (uint64_t)CFSTR("lightOuterAuth"), v150);
      objc_msgSend_setIsAuthoring_(v148, v151, 1, v152);
      objc_msgSend_setHittable_(v148, v153, 0, v154);
      objc_msgSend_addChildNode_(a3, v155, (uint64_t)v148, v156);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      if (v280[1])
      {
        *(void **)&v281 = v280[1];
        operator delete(v280[1]);
      }
      if (v279[0])
      {
        v279[1] = v279[0];
        operator delete(v279[0]);
      }
      if (sub_1B1861474((uint64_t)a5, v157, v158, v159, v160, v161, v162, v163))
      {
        *(_OWORD *)__p = 0u;
        v283 = 0u;
        *(_OWORD *)v280 = 0u;
        v281 = 0u;
        *(_OWORD *)v279 = 0u;
        v276[0] = 0u;
        __asm { FMOV            V0.4S, #1.0 }
        sub_1B18266F0((uint64_t)v279, v276, &xmmword_1B22461E0, _Q0);
        v173 = sub_1B182622C((uint64_t *)v279, v172);
        v176 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v174, (uint64_t)v173, v175);
        objc_msgSend_setName_(v176, v177, (uint64_t)CFSTR("lightProbeExtents"), v178);
        objc_msgSend_setIsAuthoring_(v176, v179, 1, v180);
        objc_msgSend_setHittable_(v176, v181, 0, v182);
        objc_msgSend_addChildNode_(a3, v183, (uint64_t)v176, v184);
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if (v280[1])
        {
          *(void **)&v281 = v280[1];
          operator delete(v280[1]);
        }
        if (v279[0])
        {
          v279[1] = v279[0];
          operator delete(v279[0]);
        }
        Material = (void *)objc_msgSend_firstMaterial(v126, v185, v186, v187);
        objc_msgSend_setColorBufferWriteMask_(Material, v189, 0, v190);
      }
      else
      {
        v193 = sub_1B18613C0((uint64_t)a5, v164, v165, v166, v167, v168, v169, v170);
        white = self->_white;
        v198 = (void *)objc_msgSend_material(v126, v195, v196, v197);
        v202 = (void *)objc_msgSend_diffuse(v198, v199, v200, v201);
        objc_msgSend_setColor_(v202, v203, (uint64_t)white, v204);
        v208 = (void *)objc_msgSend_material(v126, v205, v206, v207);
        objc_msgSend_setShadingModel_(v208, v209, 2, v210);
        if (v193)
        {
          v212 = (void *)objc_msgSend_program(VFXProgram, v191, v211, v192);
          v216 = (void *)objc_msgSend__renderContextMetal(self->_renderer, v213, v214, v215);
          v220 = objc_msgSend_resourceManager(v216, v217, v218, v219);
          v221 = (void *)sub_1B18FD768(v220);
          v225 = objc_msgSend_frameworkLibrary(v221, v222, v223, v224);
          objc_msgSend_setLibrary_(v212, v226, v225, v227);
          objc_msgSend_setVertexFunctionName_(v212, v228, (uint64_t)CFSTR("vfx_probesphere_from_sh_vertex"), v229);
          objc_msgSend_setFragmentFunctionName_(v212, v230, (uint64_t)CFSTR("vfx_probesphere_from_sh_fragment"), v231);
          v278[0] = MEMORY[0x1E0C809B0];
          v278[1] = 3221225472;
          v278[2] = sub_1B17DBDB8;
          v278[3] = &unk_1E63D58B8;
          v278[4] = a5;
          objc_msgSend_handleBindingOfBufferNamed_frequency_usingBlock_(v212, v232, (uint64_t)CFSTR("sh"), 1, v278);
          v236 = (void *)objc_msgSend_material(v126, v233, v234, v235);
          objc_msgSend_setProgram_(v236, v237, (uint64_t)v212, v238);
        }
      }
      v239 = (void *)objc_msgSend_nodeWithModel_(VFXNode, v191, (uint64_t)v126, v192);
      objc_msgSend_setName_(v239, v240, (uint64_t)CFSTR("probe"), v241);
      sub_1B17DA99C(v239, (char *)a4, v242, v243);
      objc_msgSend_setHittable_(v239, v244, 1, v245);
      objc_msgSend_addChildNode_(a3, v246, (uint64_t)v239, v247);
      *(_OWORD *)__p = 0u;
      v283 = 0u;
      *(_OWORD *)v280 = 0u;
      v281 = 0u;
      *(_OWORD *)v279 = 0u;
      sub_1B1826F64((uint64_t)v279, 3u);
      sub_1B182622C((uint64_t *)v279, v248);
      goto LABEL_18;
    case 3:
      v104 = (void *)objc_msgSend_node(VFXNode, v31, v32, v33);
      objc_msgSend_setName_(v104, v105, (uint64_t)CFSTR("lightSpotAuth"), v106);
      objc_msgSend_setIsAuthoring_(v104, v107, 1, v108);
      objc_msgSend_setHittable_(v104, v109, 0, v110);
      objc_msgSend_addChildNode_(a3, v111, (uint64_t)v104, v112);
      break;
  }
}

- (BOOL)_isPartOfSelection:(__CFXNode *)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = (uint64_t)a3;
  if (objc_msgSend_count(self->_selection, a2, (uint64_t)a3, v3))
    v8 = v4 == 0;
  else
    v8 = 1;
  if (v8)
    return 0;
  do
  {
    v9 = objc_msgSend_containsObject_(self->_selection, v6, v4, v7);
    if ((v9 & 1) != 0)
      break;
    v4 = sub_1B186B574(v4, v10, v11, v12, v13, v14, v15, v16);
  }
  while (v4);
  return v9;
}

- (BOOL)_proximityHidden:(uint64_t)a3
{
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;

  v8 = (void *)objc_msgSend_pointOfView(*(void **)(a1 + 128), a2, a3, a4);
  objc_msgSend_worldPosition(v8, v9, v10, v11);
  v13 = vsubq_f32(v12, a8);
  v14 = vmulq_f32(v13, v13);
  return vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v14, 2), vaddq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v14.f32, 1))).f32[0] < 0.0001;
}

- (void)updateLightTypeForNode:(id)a3 source:(__CFXNode *)a4 light:(__CFXLight *)a5 screenspaceScalingFactor:(float)a6
{
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  VFXAuthoringEnvironment2 *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int isPartOfSelection;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  const char *v43;
  void *v44;
  const char *v45;
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
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *Material;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  double v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int32x2_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  int32x2_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  int v190;
  float v191;
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
  double v206;
  float v207;
  float v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  const char *v215;
  uint64_t v216;
  void *v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  void *v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  float v228;
  const char *v229;
  float v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  void *v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  int v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  int v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  void *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  void *v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  void *v343;
  const char *v344;
  uint64_t v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  const char *v350;
  uint64_t v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  int v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  BOOL v397;
  uint64_t v398;
  void *v399;
  const char *v400;
  uint64_t v401;
  uint64_t v402;
  void *v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  float32x4_t v416;
  const char *v417;
  uint64_t v418;
  uint64_t v419;
  const char *v420;
  uint64_t v421;
  int v422;
  const char *v423;
  uint64_t v424;
  const char *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  void *v434;
  const char *v435;
  uint64_t v436;
  uint64_t v437;
  void *v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  void *v442;
  const char *v443;
  uint64_t v444;
  const char *v445;
  uint64_t v446;
  int hasDebugOption;
  const char *v448;
  uint64_t v449;
  const char *v450;
  void *v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  int32x2_t v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  const char *v465;
  void *v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  int32x2_t v476;
  const char *v477;
  uint64_t v478;
  uint64_t v479;
  const char *v480;
  void *v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  __n128 v489;
  float32x4_t v490;
  const char *v491;
  uint64_t v492;
  uint64_t v493;
  const char *v494;
  void *v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  double v503;
  const char *v504;
  uint64_t v505;
  uint64_t v506;
  const char *v507;
  uint64_t v508;
  double v509;
  const char *v510;
  uint64_t v511;
  uint64_t v512;
  void *v513;
  const char *v514;
  uint64_t v515;
  void *v516;
  const char *v517;
  uint64_t v518;
  uint64_t v519;
  const char *v520;
  uint64_t v521;
  uint64_t v522;
  float32x4_t v523;
  const char *v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  int v534;
  _BOOL4 v535;
  unsigned int v536;
  float v537;
  double v538;
  uint64_t v539;
  int32x2_t v540;
  double v541;
  uint64_t v542;
  uint64_t v543;
  _QWORD v544[6];
  char v545;
  __int128 v546;
  float32x4_t v547;
  void *v548[2];
  void *v549[2];
  __int128 v550;
  __int128 __p;
  __int128 v552;

  v11 = (void *)objc_msgSend_valueForKey_(a3, a2, (uint64_t)CFSTR("VFXDebugLightTypeKey"), (uint64_t)a4);
  v15 = objc_msgSend_intValue(v11, v12, v13, v14);
  v18 = (void *)objc_msgSend_valueForKey_(a3, v16, (uint64_t)CFSTR("VFXDebugLightSubTypeKey"), v17);
  v21 = (void *)objc_msgSend_valueForKey_(a3, v19, (uint64_t)CFSTR("disabled"), v20);
  v25 = objc_msgSend_BOOLValue(v21, v22, v23, v24);
  v26 = self;
  isPartOfSelection = objc_msgSend__isPartOfSelection_(self, v27, (uint64_t)a4, v28);
  v536 = isPartOfSelection ^ 1;
  v40 = sub_1B1868D5C((uint64_t)a4, v29, v30, v31, v32, v33, v34, v35) & (isPartOfSelection ^ 1);
  v41 = v25 ^ v40;
  if (v41 == 1)
  {
    v42 = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], v37, v40, v39);
    objc_msgSend_setValue_forKey_(a3, v43, v42, (uint64_t)CFSTR("disabled"));
  }
  v44 = (void *)objc_msgSend_childNodes(a3, v37, v38, v39);
  if (objc_msgSend_count(v44, v45, v46, v47)
    && sub_1B186064C((uint64_t)a5, v48, v49, v50, v51, v52, v53, v54) == 4)
  {
    if (((isPartOfSelection | v41) & 1) != 0)
    {
      v41 = 1;
    }
    else
    {
      v539 = sub_1B18613C0((uint64_t)a5, v48, v49, v50, v51, v52, v53, v54);
      v542 = sub_1B185F0C8((uint64_t)a5, 0, v55, v56, v57, v58, v59, v60);
      v62 = (void *)objc_msgSend_childNodeWithName_recursively_(a3, v61, (uint64_t)CFSTR("probe"), 1);
      v66 = (void *)objc_msgSend_model(v62, v63, v64, v65);
      Material = (void *)objc_msgSend_firstMaterial(v66, v67, v68, v69);
      v78 = Material;
      if (Material)
      {
        v535 = objc_msgSend_program(Material, v71, v72, v73) != 0;
        v82 = (void *)objc_msgSend_reflective(v78, v79, v80, v81);
        LODWORD(v78) = objc_msgSend_contents(v82, v83, v84, v85) != 0;
      }
      else
      {
        v535 = 0;
      }
      if (sub_1B1861474((uint64_t)a5, (uint64_t)v71, v72, v73, v74, v75, v76, v77))
      {
        v41 = (v542 != 0) ^ v78;
      }
      else if (a5)
      {
        v41 = (v539 != 0) ^ v535;
      }
      else
      {
        v41 = 0;
      }
    }
  }
  if (sub_1B186064C((uint64_t)a5, v48, v49, v50, v51, v52, v53, v54) == 5)
  {
    *(_QWORD *)&v94 = sub_1B1860FEC((uint64_t)a5, v87, v88, v89, v90, v91, v92, (uint64_t)v548).n128_u64[0];
    v95 = LOBYTE(v548[0]);
    if (objc_msgSend_integerValue(v18, v96, v97, v98, v94) != v95)
      v41 = 1;
  }
  *(float *)&v93 = fmaxf(a6, 0.001);
  v543 = v93;
  if (sub_1B186064C((uint64_t)a5, v86, v87, v88, v89, v90, v91, v92) != v15 || v41)
    objc_msgSend__resetLightAuthoringWithContainerNode_source_light_(v26, v99, (uint64_t)a3, (uint64_t)a4, a5);
  v106.i32[1] = HIDWORD(v543);
  *(float *)v106.i32 = 1.0 / *(float *)&v543;
  v540 = v106;
  if (sub_1B186064C((uint64_t)a5, (uint64_t)v99, v100, v101, v102, v103, v104, v105) == 1)
  {
    v114 = (void *)objc_msgSend_childNodes(a3, v107, v108, v109);
    v117 = (void *)objc_msgSend_objectAtIndexedSubscript_(v114, v115, 0, v116);
    objc_msgSend_setScale_(v117, v118, v119, v120, 0.0);
    objc_msgSend_setHidden_(v117, v121, 1, v122);
    v126 = (void *)objc_msgSend_childNodes(a3, v123, v124, v125);
    v129 = (void *)objc_msgSend_objectAtIndexedSubscript_(v126, v127, 1, v128);
    *(float *)v140.i32 = *(float *)v540.i32 * sub_1B185FC40((uint64_t)a5, v130, v131, v132, v133, v134, v135, v136);
    if (*(float *)v140.i32 < 0.0)
      *(float *)v140.i32 = 0.0;
    v541 = *(double *)&v140;
    objc_msgSend_setScale_(v129, v137, v138, v139, *(double *)vdupq_lane_s32(v140, 0).i64);
    if (*(float *)&v541 == 0.0)
      objc_msgSend_setHidden_(v129, v141, 1, v142, v541);
    else
      objc_msgSend_setHidden_(v129, v141, v536, v142, v541);
    if (sub_1B1868D5C((uint64_t)a4, v143, v144, v145, v146, v147, v148, v149))
    {
      v153 = 280;
      if (isPartOfSelection)
        v153 = 264;
      v154 = *(uint64_t *)((char *)&v26->super.isa + v153);
      v155 = (void *)objc_msgSend_model(a3, v150, v151, v152);
      v159 = (void *)objc_msgSend_firstMaterial(v155, v156, v157, v158);
      v163 = (void *)objc_msgSend_diffuse(v159, v160, v161, v162);
      objc_msgSend_setColor_(v163, v164, v154, v165);
      v169 = (void *)objc_msgSend_model(v117, v166, v167, v168);
      v173 = (void *)objc_msgSend_firstMaterial(v169, v170, v171, v172);
      v177 = (void *)objc_msgSend_diffuse(v173, v174, v175, v176);
      objc_msgSend_setColor_(v177, v178, v154, v179);
    }
    else
    {
      v247 = 248;
      if (isPartOfSelection)
        v247 = 264;
      v248 = *(uint64_t *)((char *)&v26->super.isa + v247);
      if (isPartOfSelection)
        v249 = 264;
      else
        v249 = 256;
      v250 = (void *)objc_msgSend_model(a3, v150, v151, v152);
      v254 = (void *)objc_msgSend_firstMaterial(v250, v251, v252, v253);
      v258 = (void *)objc_msgSend_diffuse(v254, v255, v256, v257);
      objc_msgSend_setColor_(v258, v259, v248, v260);
      v261 = *(uint64_t *)((char *)&v26->super.isa + v249);
      v265 = (void *)objc_msgSend_model(v117, v262, v263, v264);
      v269 = (void *)objc_msgSend_firstMaterial(v265, v266, v267, v268);
      v273 = (void *)objc_msgSend_diffuse(v269, v270, v271, v272);
      objc_msgSend_setColor_(v273, v274, v261, v275);
      v154 = *(uint64_t *)((char *)&v26->super.isa + v249);
    }
    v276 = (void *)objc_msgSend_model(v129, v180, v181, v182);
LABEL_82:
    v399 = (void *)objc_msgSend_firstMaterial(v276, v277, v278, v279);
    v403 = (void *)objc_msgSend_diffuse(v399, v400, v401, v402);
    objc_msgSend_setColor_(v403, v404, v154, v405);
    goto LABEL_83;
  }
  v190 = isPartOfSelection;
  if (sub_1B186064C((uint64_t)a5, (uint64_t)v107, v108, v109, v110, v111, v112, v113) == 3)
  {
    v191 = fmin(sub_1B185FA20((uint64_t)a5, v183, v184, v185, v186, v187, v188, v189) / 180.0 * 3.14159265, 3.13159265);
    v206 = sub_1B186045C((uint64_t)a5, v192, v193, v194, v195, v196, v197, v198) / 180.0 * 3.14159265;
    if (v206 >= v191)
      v207 = v191;
    else
      v207 = v206;
    v208 = sub_1B185FC40((uint64_t)a5, v199, v200, v201, v202, v203, v204, v205);
    v212 = (void *)objc_msgSend_childNodes(a3, v209, v210, v211);
    v217 = (void *)objc_msgSend_objectAtIndexedSubscript_(v212, v213, 0, v214);
    if (v190)
      v218 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v215, (uint64_t)CFSTR("oa:%f ia:%f e:%f scale:%f"), v216, v191, v207, v208, 1.0);
    else
      v218 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v215, (uint64_t)CFSTR("oa:%f ia:%f e:%f scale:%f"), v216, v191, v207, v208, *(float *)&v543);
    v221 = (void *)v218;
    v222 = objc_msgSend_valueForKey_(v217, v219, (uint64_t)CFSTR("AuthEnvHash"), v220);
    if (!v222 || objc_msgSend_compare_(v221, v223, v222, v224))
    {
      __p = 0u;
      v552 = 0u;
      *(_OWORD *)v549 = 0u;
      v550 = 0u;
      *(_OWORD *)v548 = 0u;
      v547 = 0uLL;
      v546 = xmmword_1B2244DF0;
      if ((v190 & (v208 > 0.0)) == 0)
        v208 = *(float *)&v543;
      v228 = tanf(v191 * 0.5);
      sub_1B18275A0((uint64_t)v548, &v547, (float32x2_t *)&v546, &xmmword_1B2246260, v208, v208 * v228);
      if (v207 > 0.0)
      {
        v230 = tanf(v207 * 0.5);
        sub_1B18275A0((uint64_t)v548, &v547, (float32x2_t *)&v546, &xmmword_1B2246230, v208, v208 * v230);
      }
      v231 = sub_1B182622C((uint64_t *)v548, v229);
      objc_msgSend_setModel_(v217, v232, (uint64_t)v231, v233);
      objc_msgSend_setValue_forKey_(v217, v234, (uint64_t)v221, (uint64_t)CFSTR("AuthEnvHash"));
      if ((_QWORD)__p)
      {
        *((_QWORD *)&__p + 1) = __p;
        operator delete((void *)__p);
      }
      if (v549[1])
      {
        *(void **)&v550 = v549[1];
        operator delete(v549[1]);
      }
      if (v548[0])
      {
        v548[1] = v548[0];
        operator delete(v548[0]);
      }
    }
    objc_msgSend_setScale_(v217, v225, v226, v227, *(double *)vdupq_lane_s32(v540, 0).i64);
    if (sub_1B1868D5C((uint64_t)a4, v235, v236, v237, v238, v239, v240, v241))
    {
      if (v190)
        v245 = 264;
      else
        v245 = 280;
      v246 = *(uint64_t *)((char *)&v26->super.isa + v245);
    }
    else
    {
      v334 = 248;
      if (v190)
        v334 = 264;
      v246 = *(uint64_t *)((char *)&v26->super.isa + v334);
      if (v190)
        v245 = 264;
      else
        v245 = 296;
    }
    v335 = (void *)objc_msgSend_model(a3, v242, v243, v244);
    v339 = (void *)objc_msgSend_firstMaterial(v335, v336, v337, v338);
    v343 = (void *)objc_msgSend_diffuse(v339, v340, v341, v342);
    objc_msgSend_setColor_(v343, v344, v246, v345);
    v154 = *(uint64_t *)((char *)&v26->super.isa + v245);
    v276 = (void *)objc_msgSend_model(v217, v346, v347, v348);
    goto LABEL_82;
  }
  v280 = sub_1B186064C((uint64_t)a5, v183, v184, v185, v186, v187, v188, v189);
  if (v280 == 2 || sub_1B186064C((uint64_t)a5, (uint64_t)v281, v282, v283, v284, v285, v286, v287) == 6)
  {
    v292 = (void *)objc_msgSend_childNodes(a3, v281, v282, v283);
    v296 = objc_msgSend_count(v292, v293, v294, v295);
    v300 = (void *)objc_msgSend_childNodes(a3, v297, v298, v299);
    v303 = (void *)objc_msgSend_objectAtIndexedSubscript_(v300, v301, 0, v302);
    objc_msgSend_setHidden_(v303, v304, v40, v305);
    v309 = (void *)objc_msgSend_childNodes(a3, v306, v307, v308);
    v312 = (void *)objc_msgSend_objectAtIndexedSubscript_(v309, v310, v296 - 1, v311);
    if ((sub_1B18622E8((uint64_t)a5, v313, v314, v315, v316, v317, v318, v319) & 1) != 0)
    {
      objc_msgSend_setHidden_(v312, v320, 1, v322);
    }
    else
    {
      v349 = sub_1B185F4D4((uint64_t)a5, (uint64_t)v320, v321, v322, v323, v324, v325, v326) ^ 1;
      objc_msgSend_setHidden_(v312, v350, v349, v351);
    }
    if ((sub_1B18622E8((uint64_t)a5, v327, v328, v329, v330, v331, v332, v333) & 1) == 0)
    {
      sub_1B1860734((uint64_t)a5, (uint64_t)v352, v353, v354, v355, v356, v357, v358);
      objc_msgSend_setPosition_(v312, v359, v360, v361, 0.0);
      v537 = sub_1B185FFC8((uint64_t)a5, v362, v363, v364, v365, v366, v367, v368);
      v538 = COERCE_DOUBLE(vmul_n_f32((float32x2_t)__PAIR64__(COERCE_UNSIGNED_INT(sub_1B185FFC8((uint64_t)a5, v369, v370, v371, v372, v373, v374, v375)), LODWORD(v537)), *(float *)v540.i32));
      sub_1B1860694((uint64_t)a5, v369, v370, v371, v372, v373, v374, v375);
      sub_1B1860734((uint64_t)a5, v376, v377, v378, v379, v380, v381, v382);
      objc_msgSend_setScale_(v312, v383, v384, v385, v538);
    }
    v544[0] = MEMORY[0x1E0C809B0];
    v544[1] = 3221225472;
    v544[2] = sub_1B17DC884;
    v544[3] = &unk_1E63D58E0;
    v545 = v190;
    v544[4] = v26;
    v544[5] = a4;
    objc_msgSend_enumerateChildNodesUsingBlock_(a3, v352, (uint64_t)v544, v354);
    v393 = sub_1B1868D5C((uint64_t)a4, v386, v387, v388, v389, v390, v391, v392);
    v397 = v190 == 0;
    if (v393)
      v398 = 280;
    else
      v398 = 248;
LABEL_79:
    if (!v397)
      v398 = 264;
    v154 = *(uint64_t *)((char *)&v26->super.isa + v398);
    v276 = (void *)objc_msgSend_model(a3, v394, v395, v396);
    goto LABEL_82;
  }
  if (sub_1B186064C((uint64_t)a5, (uint64_t)v281, v282, v283, v288, v289, v290, v291) == 4)
  {
    v432 = 296;
    if (isPartOfSelection)
      v432 = 264;
    v433 = *(uint64_t *)((char *)&v26->super.isa + v432);
    v434 = (void *)objc_msgSend_model(a3, v425, v426, v427);
    v438 = (void *)objc_msgSend_firstMaterial(v434, v435, v436, v437);
    v442 = (void *)objc_msgSend_diffuse(v438, v439, v440, v441);
    objc_msgSend_setColor_(v442, v443, v433, v444);
    hasDebugOption = objc_msgSend_hasDebugOption_(v26, v445, 8, v446);
    objc_msgSend_setHidden_(a3, v448, hasDebugOption ^ 1u, v449);
    v451 = (void *)objc_msgSend_childNodeWithName_recursively_(a3, v450, (uint64_t)CFSTR("lightInnerAuth"), 0);
    objc_msgSend_setHidden_(v451, v452, v536, v453);
    *(float *)v461.i32 = fmaxf(sub_1B1860734((uint64_t)a5, v454, v455, v456, v457, v458, v459, v460), 0.0);
    objc_msgSend_setScale_(v451, v462, v463, v464, *(double *)vdupq_lane_s32(v461, 0).i64);
    v466 = (void *)objc_msgSend_childNodeWithName_recursively_(a3, v465, (uint64_t)CFSTR("lightOuterAuth"), 0);
    objc_msgSend_setHidden_(v466, v467, v536, v468);
    *(float *)v476.i32 = fmaxf(sub_1B1860694((uint64_t)a5, v469, v470, v471, v472, v473, v474, v475), 0.0);
    objc_msgSend_setScale_(v466, v477, v478, v479, *(double *)vdupq_lane_s32(v476, 0).i64);
    v481 = (void *)objc_msgSend_childNodeWithName_recursively_(a3, v480, (uint64_t)CFSTR("lightProbeExtents"), 0);
    v489 = sub_1B18618E0((__n128 *)a5, v482, v483, v484, v485, v486, v487, v488);
    v490.i64[0] = 0x3F0000003F000000;
    v490.i64[1] = 0x3F0000003F000000;
    objc_msgSend_setScale_(v481, v491, v492, v493, *(double *)vmulq_f32((float32x4_t)v489, v490).i64);
    v495 = (void *)objc_msgSend_childNodeWithName_recursively_(a3, v494, (uint64_t)CFSTR("probe"), 0);
    *(_QWORD *)&v503 = sub_1B1861998((__n128 *)a5, v496, v497, v498, v499, v500, v501, v502).n128_u64[0];
    objc_msgSend_setPosition_(v495, v504, v505, v506, v503);
    objc_msgSend_setHidden_(v481, v507, v536, v508);
  }
  else if (sub_1B186064C((uint64_t)a5, (uint64_t)v425, v426, v427, v428, v429, v430, v431) == 5)
  {
    *(_OWORD *)v549 = 0u;
    v550 = 0u;
    *(_OWORD *)v548 = 0u;
    *(_QWORD *)&v509 = sub_1B1860FEC((uint64_t)a5, v407, v408, v409, v410, v411, v412, (uint64_t)v548).n128_u64[0];
    v513 = (void *)objc_msgSend_childNodes(a3, v510, v511, v512, v509);
    v516 = (void *)objc_msgSend_objectAtIndexedSubscript_(v513, v514, 0, v515);
    objc_msgSend_setScale_(v516, v517, v518, v519, *(double *)vdupq_lane_s32(v540, 0).i64);
    objc_msgSend_scale(v516, v520, v521, v522);
    objc_msgSend_setScale_(v516, v524, v525, v526, *(double *)vmulq_f32(v523, *(float32x4_t *)v549).i64);
    v534 = sub_1B1868D5C((uint64_t)a4, v527, v528, v529, v530, v531, v532, v533);
    v398 = 248;
    if (v534)
      v398 = 280;
    v397 = v190 == 0;
    goto LABEL_79;
  }
LABEL_83:
  if (a5)
  {
    if (sub_1B186064C((uint64_t)a5, v406, v407, v408, v409, v410, v411, v412) != 4)
    {
      objc_msgSend_scale(a3, v413, v414, v415);
      objc_msgSend_setScale_(a3, v417, v418, v419, *(double *)vmulq_n_f32(v416, *(float *)&v543).i64);
      v422 = objc_msgSend_hasDebugOption_(v26, v420, 4, v421);
      objc_msgSend_setHidden_(a3, v423, v422 ^ 1u, v424);
    }
  }
}

- (void)updateLightNode:(id)a3 withSourceNode:(__CFXNode *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  __CFXNode *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __n128 *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  char isPartOfSelection;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  __n128 *v53;
  double v54;
  const char *v55;
  __n128 v56;
  __n128 v57;
  __n128 v58;
  __n128 v59;

  v11 = sub_1B1868FE8((uint64_t)a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  if (!v11)
  {
    objc_msgSend_removeLightNode_(self, v12, (uint64_t)a4, v14);
    return;
  }
  v19 = (uint64_t)v11;
  v20 = sub_1B186C66C((uint64_t)a4, (uint64_t)v12, v13, v14, v15, v16, v17, v18);
  v24 = (void *)objc_msgSend_pointOfView(self->_renderer, v21, v22, v23);
  v28 = (__CFXNode *)objc_msgSend_nodeRef(v24, v25, v26, v27);
  v35 = 1;
  if (!v20 && v28 != a4)
  {
    v36 = (__n128 *)sub_1B1869AC8((uint64_t)a4, (uint64_t)v29, 1, v30, v31, v32, v33, v34);
    v58 = v36[1];
    v59 = *v36;
    v56 = v36[3];
    v57 = v36[2];
    if ((objc_msgSend__proximityHidden_(self, v37, v38, v39) & 1) != 0)
    {
LABEL_5:
      v35 = 1;
      goto LABEL_13;
    }
    isPartOfSelection = objc_msgSend__isPartOfSelection_(self, v29, (uint64_t)a4, v30);
    v48 = sub_1B186064C(v19, v41, v42, v43, v44, v45, v46, v47);
    if ((isPartOfSelection & 1) == 0)
    {
      if (v48 == 4)
      {
        if (!objc_msgSend_hasDebugOption_(self, v29, 8, v30))
          goto LABEL_5;
      }
      else if ((objc_msgSend_hasDebugOption_(self, v29, 4, v30) & 1) == 0)
      {
        goto LABEL_5;
      }
    }
    objc_msgSend_setWorldTransform_(a3, v29, v49, v30, v59.n128_f64[0], v58.n128_f64[0], v57.n128_f64[0], v56.n128_f64[0]);
    v53 = (__n128 *)objc_msgSend__engineContext(self->_renderer, v50, v51, v52);
    LODWORD(v54) = 25.0;
    sub_1B17B39F8(v53, v54, v59, v58, v57, v56);
    objc_msgSend_updateLightTypeForNode_source_light_screenspaceScalingFactor_(self, v55, (uint64_t)a3, (uint64_t)a4, v19);
    v35 = 0;
  }
LABEL_13:
  objc_msgSend_setHidden_(a3, v29, v35, v30);
}

- (void)updateEffectNode:(id)a3 withSourceNode:(__CFXNode *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __n128 *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  int isPartOfSelection;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  __n128 *v36;
  double v37;
  int32x2_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  int isHidden;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *Material;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __n128 v70;
  __n128 v71;
  __n128 v72;
  __n128 v73;
  int32x2_t v74;

  if (sub_1B186DD80((uint64_t)a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7))
  {
    if ((sub_1B1868D5C((uint64_t)a4, (uint64_t)v11, v12, v13, v14, v15, v16, v17) & 1) != 0
      || (v25 = (__n128 *)sub_1B1869AC8((uint64_t)a4, (uint64_t)v18, v19, v20, v21, v22, v23, v24),
          v72 = v25[1],
          v73 = *v25,
          v70 = v25[3],
          v71 = v25[2],
          (objc_msgSend__proximityHidden_(self, v26, v27, v28) & 1) != 0)
      || (isPartOfSelection = objc_msgSend__isPartOfSelection_(self, v18, (uint64_t)a4, v20),
          !objc_msgSend_hasDebugOption_(self, v30, 2048, v31)))
    {
      v69 = 1;
    }
    else
    {
      objc_msgSend_setTransform_(a3, v18, v32, v20, v73.n128_f64[0], v72.n128_f64[0], v71.n128_f64[0], v70.n128_f64[0]);
      v36 = (__n128 *)objc_msgSend__engineContext(self->_renderer, v33, v34, v35);
      LODWORD(v37) = 25.0;
      sub_1B17B39F8(v36, v37, v73, v72, v71, v70);
      v74 = v38;
      v42 = (void *)objc_msgSend_childNodes(a3, v39, v40, v41);
      v45 = (void *)objc_msgSend_objectAtIndexedSubscript_(v42, v43, 0, v44);
      isHidden = objc_msgSend_isHidden(v45, v46, v47, v48);
      v53 = 248;
      if (isHidden)
        v53 = 280;
      if (isPartOfSelection)
        v53 = 264;
      v54 = *(uint64_t *)((char *)&self->super.isa + v53);
      v55 = (void *)objc_msgSend_model(v45, v50, v51, v52);
      Material = (void *)objc_msgSend_firstMaterial(v55, v56, v57, v58);
      v63 = (void *)objc_msgSend_diffuse(Material, v60, v61, v62);
      objc_msgSend_setColor_(v63, v64, v54, v65);
      objc_msgSend_setScale_(v45, v66, v67, v68, *(double *)vdupq_lane_s32(v74, 0).i64);
      v69 = 0;
    }
    objc_msgSend_setHidden_(a3, v18, v69, v20);
  }
  else
  {
    objc_msgSend_removeEffectNode_(self, v11, (uint64_t)a4, v13);
  }
}

- (void)updateCameraNode:(id)a3 withSourceNode:(__CFXNode *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  __CFXNode *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int isPartOfSelection;
  __n128 *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __n128 *v49;
  double v50;
  int32x2_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  float v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  float v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  float v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  int32x2_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  __n128 *v121;
  __n128 v122;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  float64x2_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  UIColor *grayMedium;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  void *Material;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  __n128 v225;
  __n128 v226;
  long double v227;
  __n128 v228;
  int32x2_t v229;
  __n128 v230;
  __n128 v231;
  int32x2_t v232;
  uint64_t v233;

  v11 = sub_1B186CFA8((uint64_t)a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7);
  if (v11)
  {
    v19 = (uint64_t)v11;
    v20 = sub_1B186C66C((uint64_t)a4, (uint64_t)v12, v13, v14, v15, v16, v17, v18);
    v24 = (void *)objc_msgSend_pointOfView(self->_renderer, v21, v22, v23);
    v28 = (__CFXNode *)objc_msgSend_nodeRef(v24, v25, v26, v27);
    v31 = 1;
    if (!v20 && v28 != a4)
    {
      isPartOfSelection = objc_msgSend__isPartOfSelection_(self, v29, (uint64_t)a4, v30);
      if ((isPartOfSelection & 1) == 0 && !objc_msgSend_hasDebugOption_(self, v32, 1024, v34)
        || (v40 = (__n128 *)sub_1B1869AC8((uint64_t)a4, (uint64_t)v32, v33, v34, v35, v36, v37, v38),
            v228 = v40[1],
            v230 = *v40,
            v225 = v40[3],
            v226 = v40[2],
            v44 = objc_msgSend__proximityHidden_(self, v41, v42, v43),
            objc_msgSend_setTransform_(a3, v45, v46, v47, v230.n128_f64[0], v228.n128_f64[0], v226.n128_f64[0], v225.n128_f64[0]), (v44 & 1) != 0))
      {
        objc_msgSend_setHidden_(a3, v32, 1, v34);
        return;
      }
      v49 = (__n128 *)objc_msgSend__engineContext(self->_renderer, v32, v48, v34);
      LODWORD(v50) = 25.0;
      sub_1B17B39F8(v49, v50, v230, v228, v226, v225);
      v231.n128_u64[0] = (unint64_t)v51;
      objc_msgSend_setScale_(a3, v52, v53, v54, *(double *)vdupq_lane_s32(v51, 0).i64);
      v62 = sub_1B1865B1C(v19, v55, v56, v57, v58, v59, v60, v61);
      v70 = sub_1B1865AD4(v19, v63, v64, v65, v66, v67, v68, v69);
      v78 = sub_1B1865DD8(v19, v71, v72, v73, v74, v75, v76, v77);
      v86 = sub_1B18659C0(v19, v79, v80, v81, v82, v83, v84, v85);
      v90 = (void *)objc_msgSend_childNodes(a3, v87, v88, v89);
      v96 = (void *)objc_msgSend_objectAtIndexedSubscript_(v90, v91, 0, v92);
      if (v86)
      {
        v97 = objc_msgSend_cameraOrthographicFrustumGeometry(self, v93, v94, v95);
        objc_msgSend_setModel_(v96, v98, v97, v99);
        *(float *)&v107 = sub_1B1865978(v19, v100, v101, v102, v103, v104, v105, v106) / v231.n128_f32[0];
        HIDWORD(v107) = LODWORD(v107);
        objc_msgSend_setScale_(v96, v108, v109, v110, v107);
      }
      else
      {
        v115 = objc_msgSend_cameraFrustumGeometry(self, v93, v94, v95);
        objc_msgSend_setModel_(v96, v116, v115, v117);
        v233 = 0;
        v121 = (__n128 *)objc_msgSend__engineContext(self->_renderer, v118, v119, v120);
        v122 = sub_1B1815A98(v121);
        __asm { FMOV            V1.2S, #1.0 }
        v122.n128_u64[0] = (unint64_t)vmaxnm_f32((float32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v122, (int8x16_t)v122, 8uLL), _D1);
        sub_1B18661D8(v19, (float *)&v233 + 1, (float *)&v233, v127, v128, v129, v130, v131, vdiv_f32((float32x2_t)v122.n128_u64[0], (float32x2_t)vdup_lane_s32((int32x2_t)v122.n128_u64[0], 1)).f32[0]);
        v114.i32[1] = v231.n128_i32[1];
        if (v231.n128_f32[0] != 0.0)
        {
          v227 = tan(*(float *)&v233 * 0.5 / 180.0 * 3.14159265);
          v132.f64[0] = tan(*((float *)&v233 + 1) * 0.5 / 180.0 * 3.14159265);
          v132.f64[1] = v227;
          objc_msgSend_setScale_(v96, v133, v134, v135, COERCE_DOUBLE(vdiv_f32(vcvt_f32_f64(vmulq_n_f64(v132, v70)), (float32x2_t)vdup_lane_s32((int32x2_t)v231.n128_u64[0], 0))));
        }
      }
      *(float *)v114.i32 = v62 / v70;
      v229 = v114;
      *(float *)v114.i32 = v78 / v70;
      v232 = v114;
      v136 = (void *)objc_msgSend_childNodes(v96, v111, v112, v113);
      v139 = (void *)objc_msgSend_objectAtIndexedSubscript_(v136, v137, 0, v138);
      objc_msgSend_setScale_(v139, v140, v141, v142, *(double *)vdupq_lane_s32(v229, 0).i64);
      v146 = (void *)objc_msgSend_childNodes(v96, v143, v144, v145);
      v147 = 1;
      v150 = (void *)objc_msgSend_objectAtIndexedSubscript_(v146, v148, 1, v149);
      objc_msgSend_setScale_(v150, v151, v152, v153, *(double *)vdupq_lane_s32(v232, 0).i64);
      if (isPartOfSelection)
      {
        v147 = objc_msgSend_hasDebugOption_(self, v154, 1024, v155) ^ 1;
        objc_msgSend_setHidden_(v96, v156, v147, v157);
      }
      objc_msgSend_setHidden_(v139, v154, v147, v155);
      objc_msgSend_setHidden_(v150, v158, v147, v159);
      objc_msgSend_setHidden_(v96, v160, isPartOfSelection ^ 1u, v161);
      grayMedium = self->_grayMedium;
      v166 = (void *)objc_msgSend_model(a3, v163, v164, v165);
      Material = (void *)objc_msgSend_firstMaterial(v166, v167, v168, v169);
      v174 = (void *)objc_msgSend_diffuse(Material, v171, v172, v173);
      objc_msgSend_setColor_(v174, v175, (uint64_t)grayMedium, v176);
      _ZF = isPartOfSelection == 0;
      if (isPartOfSelection)
        v181 = 264;
      else
        v181 = 208;
      v182 = *(uint64_t *)((char *)&self->super.isa + v181);
      if (_ZF)
        v183 = 208;
      else
        v183 = 240;
      v184 = (void *)objc_msgSend_model(v96, v177, v178, v179);
      v188 = (void *)objc_msgSend_firstMaterial(v184, v185, v186, v187);
      v192 = (void *)objc_msgSend_diffuse(v188, v189, v190, v191);
      objc_msgSend_setColor_(v192, v193, v182, v194);
      v195 = *(uint64_t *)((char *)&self->super.isa + v181);
      v199 = (void *)objc_msgSend_model(v139, v196, v197, v198);
      v203 = (void *)objc_msgSend_firstMaterial(v199, v200, v201, v202);
      v207 = (void *)objc_msgSend_diffuse(v203, v204, v205, v206);
      objc_msgSend_setColor_(v207, v208, v195, v209);
      v210 = *(uint64_t *)((char *)&self->super.isa + v183);
      v214 = (void *)objc_msgSend_model(v150, v211, v212, v213);
      v218 = (void *)objc_msgSend_firstMaterial(v214, v215, v216, v217);
      v222 = (void *)objc_msgSend_diffuse(v218, v219, v220, v221);
      objc_msgSend_setColor_(v222, v223, v210, v224);
      v31 = 0;
    }
    objc_msgSend_setHidden_(a3, v29, v31, v30);
  }
  else
  {
    objc_msgSend_removeCameraNode_(self, v12, (uint64_t)a4, v14);
  }
}

- (void)updateFieldNode:(id)a3 withSourceNode:(__CFXNode *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *Material;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;

  if ((sub_1B186DBB0((uint64_t)a4, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7) & 1) != 0)
  {
    if ((sub_1B1868D5C((uint64_t)a4, v11, v12, v13, v14, v15, v16, v17) & 1) != 0)
      goto LABEL_4;
    v25 = (__int128 *)sub_1B1869AC8((uint64_t)a4, (uint64_t)v18, v19, v20, v21, v22, v23, v24);
    v49 = v25[1];
    v50 = *v25;
    v47 = v25[3];
    v48 = v25[2];
    if ((objc_msgSend__proximityHidden_(self, v26, v27, v28) & 1) != 0)
      goto LABEL_4;
    if ((objc_msgSend__isPartOfSelection_(self, v18, (uint64_t)a4, v20) & 1) != 0)
    {
      v31 = 264;
    }
    else
    {
      if (!objc_msgSend_hasDebugOption_(self, v18, 16, v20))
      {
LABEL_4:
        v29 = 1;
LABEL_5:
        objc_msgSend_setHidden_(a3, v18, v29, v20);
        return;
      }
      v31 = 208;
    }
    objc_msgSend_setTransform_(a3, v18, v30, v20, *(double *)&v50, *(double *)&v49, *(double *)&v48, *(double *)&v47);
    v32 = *(uint64_t *)((char *)&self->super.isa + v31);
    v36 = (void *)objc_msgSend_model(a3, v33, v34, v35);
    Material = (void *)objc_msgSend_firstMaterial(v36, v37, v38, v39);
    v44 = (void *)objc_msgSend_diffuse(Material, v41, v42, v43);
    objc_msgSend_setColor_(v44, v45, v32, v46);
    v29 = 0;
    goto LABEL_5;
  }
  MEMORY[0x1E0DE7D20](self, sel_removeForceFieldNode_, a4, v13);
}

- (void)updateWithRenderer:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  int hasDebugOption;
  VFXManipulator *manipulator;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  int v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  _QWORD v76[6];
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  BOOL v80;

  objc_sync_enter(self);
  self->_renderer = (VFXRenderer *)a3;
  v8 = objc_msgSend__engineContext(a3, v5, v6, v7);
  v16 = (void *)sub_1B1813BC4(v8, v9, v10, v11, v12, v13, v14, v15);
  if (v16 && objc_msgSend_showsAuthoringEnvironment(v16, v17, v18, v19))
  {
    CFDictionaryApplyFunction(self->_lightsDictionary, (CFDictionaryApplierFunction)sub_1B17DD2D8, self);
    CFDictionaryApplyFunction(self->_camerasDictionary, (CFDictionaryApplierFunction)sub_1B17DD2E8, self);
    CFDictionaryApplyFunction(self->_effectsDictionary, (CFDictionaryApplierFunction)sub_1B17DD2F8, self);
    CFDictionaryApplyFunction(self->_forceFieldsDictionary, (CFDictionaryApplierFunction)sub_1B17DD308, self);
    v23 = (void *)objc_msgSend_privateRendererOwner(a3, v20, v21, v22);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = (void *)objc_msgSend_defaultCameraController(v23, v24, v25, v26);
      objc_msgSend_target(v27, v28, v29, v30);
      objc_msgSend_setPosition_(self->_cameraTarget, v31, v32, v33);
    }
    v34 = 1;
    objc_msgSend_setHidden_(self->_cameraTarget, v24, 1, v26);
  }
  else
  {
    v34 = 0;
  }
  hasDebugOption = objc_msgSend_hasDebugOption_(self, v17, 0x80000, v19);
  manipulator = self->_manipulator;
  if (hasDebugOption)
  {
    if (objc_msgSend_isDragging(manipulator, v35, v36, v37))
      objc_msgSend_updateTargetsTransforms(self->_manipulator, v40, v41, v42);
    objc_msgSend_updateManipulatorPosition_(self->_manipulator, v40, v8, v42);
    v46 = (void *)objc_msgSend_privateRendererOwner(a3, v43, v44, v45);
    v50 = v46;
    if (v46 && objc_msgSend_pointOfView(v46, v47, v48, v49))
    {
      v77 = 0;
      v78 = &v77;
      v79 = 0x2020000000;
      v80 = 0;
      v52 = (void *)objc_msgSend_targets(self->_manipulator, v47, v51, v49);
      v80 = objc_msgSend_count(v52, v53, v54, v55) == 0;
      v59 = (void *)objc_msgSend_targets(self->_manipulator, v56, v57, v58);
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = sub_1B17DD318;
      v76[3] = &unk_1E63D5908;
      v76[4] = v50;
      v76[5] = &v77;
      objc_msgSend_enumerateObjectsUsingBlock_(v59, v60, (uint64_t)v76, v61);
      v62 = *((unsigned __int8 *)v78 + 24);
      v66 = (void *)objc_msgSend_manipulatorNode(self->_manipulator, v63, v64, v65);
      objc_msgSend_setHidden_(v66, v67, v62 != 0, v68);
      _Block_object_dispose(&v77, 8);
    }
    else
    {
      objc_msgSend_setHidden_(self->_manipulator, v47, 1, v49);
    }
  }
  else
  {
    objc_msgSend_setHidden_(manipulator, v35, 1, v37);
  }
  if (v34 == objc_msgSend_isHidden(self->_layerRoot, v69, v70, v71))
  {
    objc_msgSend_setHidden_(self->_layerRoot, v72, v34 ^ 1u, v73);
    objc_msgSend_setHidden_(self->_overlayLayerRoot, v74, v34 ^ 1u, v75);
  }
  self->_renderer = 0;
  objc_sync_exit(self);
}

- (VFXNode)authoringLayer
{
  return self->_layerRoot;
}

- (VFXNode)authoringOverlayLayer
{
  return self->_overlayLayerRoot;
}

- (void)debugOptionsDidChange:(unint64_t)a3
{
  uint64_t v3;

  objc_msgSend_setHidden_(self->_grid, a2, (a3 & 0x40000) == 0, v3);
}

- (BOOL)didTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (void)setAuthoringCamera:(int64_t)a3 forView:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  float32x4_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  float32x4_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  float v41;
  float v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  float32x4_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  float32x4_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  float32x4_t v67;
  float32x2_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float v71;
  float32x4_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x2_t v82;
  float32x4_t v83;
  _QWORD v84[2];

  v84[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_world(a4, a2, a3, (uint64_t)a4))
  {
    v10 = (void *)objc_msgSend_defaultCameraController(a4, v7, v8, v9);
    objc_msgSend_simdTarget(v10, v11, v12, v13);
    v83 = v14;
    v18 = (void *)objc_msgSend_childNodes(self->_pointsOfViewRoot, v15, v16, v17);
    v21 = (void *)objc_msgSend_objectAtIndexedSubscript_(v18, v19, a3, v20);
    v25 = (void *)objc_msgSend_world(a4, v22, v23, v24);
    v84[0] = objc_msgSend_rootNode(v25, v26, v27, v28);
    v30 = (void *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v29, (uint64_t)v84, 1);
    VFXNodeGetBoundingSphere(v30, (const char *)0x10000, v31, v32);
    v81 = v33;
    v37 = (void *)objc_msgSend_camera(v21, v34, v35, v36);
    objc_msgSend_zNear(v37, v38, v39, v40);
    v42 = v41;
    objc_msgSend_localUp(VFXNode, v43, v44, v45);
    v80 = v46;
    objc_msgSend_localRight(VFXNode, v47, v48, v49);
    v79 = v50;
    objc_msgSend_localFront(VFXNode, v51, v52, v53);
    v58 = v57;
    v59 = vsubq_f32(v83, v81);
    v60 = vmulq_f32(v59, v59);
    v57.f32[0] = v42
               + (float)(v81.f32[3]
                       + sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v60, 2), vaddq_f32(v60, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v60.f32, 1))).f32[0]));
    v82 = *(float32x2_t *)v57.f32;
    switch(a3)
    {
      case 1:
        objc_msgSend_setEulerAngles_(v21, v54, v55, v56, COERCE_DOUBLE(3217625051));
        goto LABEL_11;
      case 2:
        objc_msgSend_setEulerAngles_(v21, v54, v55, v56, COERCE_DOUBLE(1070141403));
        goto LABEL_8;
      case 3:
        objc_msgSend_setEulerAngles_(v21, v54, v55, v56, -0.195796371);
        v68 = v82;
        v67 = v83;
        v69 = v79;
        goto LABEL_9;
      case 4:
        objc_msgSend_setEulerAngles_(v21, v54, v55, v56, 0.195796371);
        v71 = v82.f32[0];
        v70 = v83;
        v72 = v79;
        goto LABEL_12;
      case 5:
        v80 = v58;
        objc_msgSend_setEulerAngles_(v21, v54, v55, v56, 0.0);
LABEL_8:
        v68 = v82;
        v67 = v83;
        v69 = v80;
LABEL_9:
        objc_msgSend_setWorldPosition_(v21, v64, v65, v66, *(double *)vmlsq_lane_f32(v67, v69, v68, 0).i64);
        break;
      case 6:
        v80 = v58;
        objc_msgSend_setEulerAngles_(v21, v54, v55, v56, -50.1238708);
LABEL_11:
        v71 = v82.f32[0];
        v70 = v83;
        v72 = v80;
LABEL_12:
        objc_msgSend_setWorldPosition_(v21, v61, v62, v63, *(double *)vmlaq_n_f32(v70, v72, v71).i64);
        break;
      default:
        break;
    }
    objc_msgSend_setPointOfView_(a4, v54, (uint64_t)v21, v56);
    v76 = (void *)objc_msgSend_defaultCameraController(a4, v73, v74, v75);
    objc_msgSend_setPointOfView_(v76, v77, (uint64_t)v21, v78);
  }
}

- (id)authoringCamera:(int64_t)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_childNodes(self->_pointsOfViewRoot, a2, a3, v3);
  return (id)objc_msgSend_objectAtIndexedSubscript_(v5, v6, a3, v7);
}

@end
