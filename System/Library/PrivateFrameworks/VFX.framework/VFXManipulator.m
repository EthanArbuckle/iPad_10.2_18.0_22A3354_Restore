@implementation VFXManipulator

- (NSOrderedSet)targets
{
  return self->_targets;
}

- (void)setTargets:(id)a3
{
  uint64_t v3;
  void *v6;
  NSOrderedSet *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_authoringEnvironment(self, a2, (uint64_t)a3, v3);
  objc_sync_enter(v6);
  v7 = self->_targets;
  self->_targets = 0;
  if (a3)
  {
    v11 = (void *)MEMORY[0x1E0C99E10];
    v12 = objc_msgSend_count(a3, v8, v9, v10);
    v15 = (void *)objc_msgSend_orderedSetWithCapacity_(v11, v13, v12, v14);
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v16, (uint64_t)&v37, (uint64_t)v41, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v38;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v38 != v21)
            objc_enumerationMutation(a3);
          v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v22);
          v24 = (void *)objc_msgSend_node(v23, v17, v18, v19);
          if ((objc_msgSend_editorLocked(v24, v25, v26, v27) & 1) == 0)
          {
            if (!objc_msgSend_component(v23, v17, v18, v19))
            {
              for (i = objc_msgSend_parentItem(v23, v28, v29, v30); ; i = objc_msgSend_parentItem(v32, v17, v18, v19))
              {
                v32 = (void *)i;
                if (!i)
                  break;
                if ((objc_msgSend_containsObject_(a3, v28, i, v30) & 1) != 0)
                  goto LABEL_10;
              }
            }
            objc_msgSend_addObject_(v15, v28, (uint64_t)v23, v30);
          }
LABEL_10:
          ++v22;
        }
        while (v22 != v20);
        v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v17, (uint64_t)&v37, (uint64_t)v41, 16);
        v20 = v33;
      }
      while (v33);
    }
    self->_targets = (NSOrderedSet *)v15;
  }
  objc_sync_exit(v6);
  objc_msgSend_updateManipulatorNode(self, v34, v35, v36);
}

- (VFXNode)target
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  VFXNode *Object;

  v5 = (void *)objc_msgSend_authoringEnvironment(self, a2, v2, v3);
  objc_sync_enter(v5);
  if (objc_msgSend_count(self->_targets, v6, v7, v8))
    Object = (VFXNode *)objc_msgSend_firstObject(self->_targets, v9, v10, v11);
  else
    Object = 0;
  objc_sync_exit(v5);
  return Object;
}

- (void)setTarget:(id)a3
{
  uint64_t v3;

  if (a3)
    a3 = (id)objc_msgSend_orderedSetWithObject_(MEMORY[0x1E0C99E40], a2, (uint64_t)a3, v3);
  objc_msgSend_setTargets_(self, a2, (uint64_t)a3, v3);
}

- (VFXAuthoringEnvironment)authoringEnvironment
{
  return self->_authoringEnvironment;
}

- (void)_setAuthoringEnvironment:(id)a3
{
  self->_authoringEnvironment = (VFXAuthoringEnvironment *)a3;
}

- (__n128)transform
{
  return a1[31];
}

- (VFXManipulator)init
{
  VFXManipulator *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VFXManipulator;
  v2 = -[VFXManipulator init](&v13, sel_init);
  if (v2)
  {
    v2->_presentationItemsLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    *(_OWORD *)v2->_anon_20 = xmmword_1B2245D50;
    *(_OWORD *)&v2->_anon_20[16] = xmmword_1B2244DD0;
    *(_OWORD *)&v2->_anon_20[32] = xmmword_1B2245D60;
    *(_OWORD *)&v2->_anon_20[48] = xmmword_1B2244E20;
    *(_OWORD *)v2->_anon_60 = xmmword_1B2244DB0;
    *(_OWORD *)&v2->_anon_60[16] = xmmword_1B2246F30;
    *(_OWORD *)&v2->_anon_60[32] = xmmword_1B2246F40;
    *(_OWORD *)&v2->_anon_60[48] = xmmword_1B2244E20;
    *(_OWORD *)v2->_anon_a0 = xmmword_1B2247E20;
    *(_OWORD *)&v2->_anon_a0[16] = xmmword_1B2244DD0;
    *(_OWORD *)&v2->_anon_a0[32] = xmmword_1B2247E30;
    *(_OWORD *)&v2->_anon_a0[48] = xmmword_1B2244E20;
    *(_OWORD *)v2->_anon_e0 = xmmword_1B2244DB0;
    *(_OWORD *)&v2->_anon_e0[16] = xmmword_1B2246F10;
    *(_OWORD *)&v2->_anon_e0[32] = xmmword_1B2246F20;
    *(_OWORD *)&v2->_anon_e0[48] = xmmword_1B2244E20;
    v2->_xAlignment = 0;
    v2->_zAlignment = 0;
    v2->_yAlignment = 0;
    v2->_snapXIndexes = (NSMutableIndexSet *)(id)objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v3, v4, v5);
    v2->_snapYIndexes = (NSMutableIndexSet *)(id)objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v6, v7, v8);
    v2->_snapZIndexes = (NSMutableIndexSet *)(id)objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v9, v10, v11);
    v2->_snapLock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v2->_features = 3;
  }
  return v2;
}

- (void)dealloc
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;

  objc_msgSend__deleteOriginalData(self, v3, v4, v5);
  free(self->_snapToAlignOnX);
  free(self->_snapToAlignOnY);
  free(self->_snapToAlignOnZ);
  objc_msgSend_removeFromParentNode(self->_node, v6, v7, v8);

  v9.receiver = self;
  v9.super_class = (Class)VFXManipulator;
  -[VFXManipulator dealloc](&v9, sel_dealloc);
}

- (id)copy
{
  VFXManipulator *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  v3 = objc_alloc_init(VFXManipulator);
  v7 = objc_msgSend_target(self, v4, v5, v6);
  objc_msgSend_setTarget_(v3, v8, v7, v9);
  return v3;
}

- (int64_t)effectiveEditingSpace
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = (void *)objc_msgSend_authoringEnvironment(self, a2, v2, v3);
  if ((unint64_t)objc_msgSend_editingSpace(v5, v6, v7, v8) <= 1
    && (unint64_t)objc_msgSend_count(self->_targets, v9, v10, v11) > 1)
  {
    return 2;
  }
  v13 = (void *)objc_msgSend_authoringEnvironment(self, v9, v10, v11);
  return objc_msgSend_editingSpace(v13, v14, v15, v16);
}

- (BOOL)isDragging
{
  return self->_isMouseDown;
}

- (VFXNode)manipulatorNode
{
  uint64_t v2;
  uint64_t v3;
  VFXNode *result;

  result = self->_node;
  if (!result)
  {
    objc_msgSend_setupNode(self, a2, v2, v3);
    return self->_node;
  }
  return result;
}

- (void)setHidden:(BOOL)a3
{
  uint64_t v3;

  objc_msgSend_setHidden_(self->_node, a2, a3, v3);
}

- (BOOL)hidden
{
  uint64_t v2;
  uint64_t v3;
  VFXNode *node;

  node = self->_node;
  if (node)
    return objc_msgSend_isHidden(node, a2, v2, v3);
  else
    return 1;
}

- (void)setupNode
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
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
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  VFXNode *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  VFXNode *v73;
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
  uint64_t v86;
  VFXNode *v87;
  const char *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  VFXNode *v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  VFXNode *v222;
  const char *v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  const char *v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  const char *v286;
  uint64_t v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  VFXNode *v291;
  const char *v292;
  uint64_t v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  VFXBillboardConstraint *v297;
  const char *v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  VFXNode *v303;
  const char *v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  const char *v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  const char *v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  double v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  const char *v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  void *Material;
  const char *v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  void *v334;
  const char *v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  VFXNode *v339;
  double v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  const char *v346;
  uint64_t v347;
  double v348;
  double v349;
  double v350;
  double v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  void *v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  void *v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  const char *v367;
  uint64_t v368;
  const char *v369;
  uint64_t v370;
  uint64_t v371;
  void *v372;
  const char *v373;
  uint64_t v374;
  const char *v375;
  uint64_t v376;
  VFXNode *v377;
  const char *v378;
  uint64_t v379;
  const char *v380;
  uint64_t v381;
  const char *v382;
  uint64_t v383;
  const char *v384;
  uint64_t v385;
  uint64_t v386;
  const char *v387;
  uint64_t v388;
  unsigned int v389;

  v389 = objc_msgSend_immediateMode(VFXTransaction, a2, v2, v3);
  objc_msgSend_setImmediateMode_(VFXTransaction, v5, 1, v6);
  self->_node = (VFXNode *)(id)objc_msgSend_node(VFXNode, v7, v8, v9);
  v12 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v10, (uint64_t)&xmmword_1B22461E0, v11);
  v16 = sub_1B19A0510(v12, v13, v14, v15);
  v19 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v17, (uint64_t)&unk_1B22461F0, v18);
  v23 = sub_1B19A0510(v19, v20, v21, v22);
  v26 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v24, (uint64_t)&unk_1B2246200, v25);
  v30 = (VFXNode *)sub_1B19A0510(v26, v27, v28, v29);
  self->_zArrow = v30;
  objc_msgSend_setEulerAngles_(v16, v31, v32, v33);
  objc_msgSend_setEulerAngles_(v30, v34, v35, v36);
  objc_msgSend_setCategoryBitMask_(v16, v37, 273, v38);
  objc_msgSend_setCategoryBitMask_(v23, v39, 289, v40);
  objc_msgSend_setCategoryBitMask_(v30, v41, 305, v42);
  v45 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v43, (uint64_t)&xmmword_1B22461E0, v44);
  v49 = sub_1B19A05A8(v45, v46, v47, v48);
  v52 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v50, (uint64_t)&unk_1B22461F0, v51);
  v56 = sub_1B19A05A8(v52, v53, v54, v55);
  v59 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v57, (uint64_t)&unk_1B2246200, v58);
  v63 = sub_1B19A05A8(v59, v60, v61, v62);
  objc_msgSend_setEulerAngles_(v49, v64, v65, v66, 0.0);
  objc_msgSend_setEulerAngles_(v63, v67, v68, v69, COERCE_DOUBLE(1070141403));
  v73 = (VFXNode *)objc_msgSend_node(VFXNode, v70, v71, v72);
  self->_axis = v73;
  objc_msgSend_addChildNode_(v73, v74, (uint64_t)v49, v75);
  objc_msgSend_addChildNode_(self->_axis, v76, (uint64_t)v56, v77);
  objc_msgSend_addChildNode_(self->_axis, v78, (uint64_t)v63, v79);
  objc_msgSend_setHidden_(self->_axis, v80, 1, v81);
  objc_msgSend_addChildNode_(self->_node, v82, (uint64_t)self->_axis, v83);
  v87 = (VFXNode *)objc_msgSend_node(VFXNode, v84, v85, v86);
  objc_msgSend_addChildNode_(v87, v88, (uint64_t)v16, v89);
  objc_msgSend_addChildNode_(v87, v90, (uint64_t)v23, v91);
  objc_msgSend_addChildNode_(v87, v92, (uint64_t)v30, v93);
  self->_translateHandles = v87;
  objc_msgSend_addChildNode_(self->_node, v94, (uint64_t)v87, v95);
  v98 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v96, (uint64_t)&unk_1B2246200, v97);
  self->_planarTranslationHandleXY = (VFXNode *)sub_1B19A0640(v98, v99, v100, v101);
  v104 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v102, (uint64_t)&xmmword_1B22461E0, v103);
  self->_planarTranslationHandleYZ = (VFXNode *)sub_1B19A0640(v104, v105, v106, v107);
  v110 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v108, (uint64_t)&unk_1B22461F0, v109);
  self->_planarTranslationHandleXZ = (VFXNode *)sub_1B19A0640(v110, v111, v112, v113);
  objc_msgSend_setEulerAngles_(self->_planarTranslationHandleYZ, v114, v115, v116, -0.195796371);
  objc_msgSend_setEulerAngles_(self->_planarTranslationHandleXZ, v117, v118, v119, COERCE_DOUBLE(1070141403));
  objc_msgSend_setCategoryBitMask_(self->_planarTranslationHandleXY, v120, 561, v121);
  objc_msgSend_setCategoryBitMask_(self->_planarTranslationHandleYZ, v122, 529, v123);
  objc_msgSend_setCategoryBitMask_(self->_planarTranslationHandleXZ, v124, 545, v125);
  v129 = (VFXNode *)objc_msgSend_node(VFXNode, v126, v127, v128);
  self->_planarTranslationHandles = v129;
  objc_msgSend_addChildNode_(v129, v130, (uint64_t)self->_planarTranslationHandleXY, v131);
  objc_msgSend_addChildNode_(self->_planarTranslationHandles, v132, (uint64_t)self->_planarTranslationHandleYZ, v133);
  objc_msgSend_addChildNode_(self->_planarTranslationHandles, v134, (uint64_t)self->_planarTranslationHandleXZ, v135);
  objc_msgSend_addChildNode_(self->_node, v136, (uint64_t)self->_planarTranslationHandles, v137);
  v140 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v138, (uint64_t)&unk_1B2246200, v139);
  self->_arcHandleXY = (VFXNode *)sub_1B19A06D8(v140, v141, v142, v143);
  v146 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v144, (uint64_t)&xmmword_1B22461E0, v145);
  self->_arcHandleYZ = (VFXNode *)sub_1B19A06D8(v146, v147, v148, v149);
  v152 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v150, (uint64_t)&unk_1B22461F0, v151);
  self->_arcHandleXZ = (VFXNode *)sub_1B19A06D8(v152, v153, v154, v155);
  objc_msgSend_setEulerAngles_(self->_arcHandleXY, v156, v157, v158, COERCE_DOUBLE(3217625051));
  objc_msgSend_setEulerAngles_(self->_arcHandleYZ, v159, v160, v161, COERCE_DOUBLE(1078530011));
  objc_msgSend_setEulerAngles_(self->_arcHandleXZ, v162, v163, v164, 50.1238708);
  v168 = (void *)objc_msgSend_childNodes(self->_arcHandleXY, v165, v166, v167);
  v171 = (void *)objc_msgSend_objectAtIndexedSubscript_(v168, v169, 0, v170);
  objc_msgSend_setCategoryBitMask_(v171, v172, 561, v173);
  v177 = (void *)objc_msgSend_childNodes(self->_arcHandleYZ, v174, v175, v176);
  v180 = (void *)objc_msgSend_objectAtIndexedSubscript_(v177, v178, 0, v179);
  objc_msgSend_setCategoryBitMask_(v180, v181, 529, v182);
  v186 = (void *)objc_msgSend_childNodes(self->_arcHandleXZ, v183, v184, v185);
  v189 = (void *)objc_msgSend_objectAtIndexedSubscript_(v186, v187, 0, v188);
  objc_msgSend_setCategoryBitMask_(v189, v190, 545, v191);
  v195 = (void *)objc_msgSend_childNodes(self->_arcHandleXY, v192, v193, v194);
  v198 = (void *)objc_msgSend_objectAtIndexedSubscript_(v195, v196, 1, v197);
  objc_msgSend_setCategoryBitMask_(v198, v199, 817, v200);
  v204 = (void *)objc_msgSend_childNodes(self->_arcHandleYZ, v201, v202, v203);
  v207 = (void *)objc_msgSend_objectAtIndexedSubscript_(v204, v205, 1, v206);
  objc_msgSend_setCategoryBitMask_(v207, v208, 785, v209);
  v213 = (void *)objc_msgSend_childNodes(self->_arcHandleXZ, v210, v211, v212);
  v216 = (void *)objc_msgSend_objectAtIndexedSubscript_(v213, v214, 1, v215);
  objc_msgSend_setCategoryBitMask_(v216, v217, 801, v218);
  v222 = (VFXNode *)objc_msgSend_node(VFXNode, v219, v220, v221);
  self->_arcHandles = v222;
  objc_msgSend_addChildNode_(v222, v223, (uint64_t)self->_arcHandleXY, v224);
  objc_msgSend_addChildNode_(self->_arcHandles, v225, (uint64_t)self->_arcHandleYZ, v226);
  objc_msgSend_addChildNode_(self->_arcHandles, v227, (uint64_t)self->_arcHandleXZ, v228);
  objc_msgSend_addChildNode_(self->_node, v229, (uint64_t)self->_arcHandles, v230);
  v234 = (void *)objc_msgSend_node(VFXNode, v231, v232, v233);
  v237 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v235, (uint64_t)&xmmword_1B22461E0, v236);
  v241 = sub_1B19A0770(v237, v238, v239, v240, 1.0);
  v244 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v242, (uint64_t)&unk_1B22461F0, v243);
  v248 = sub_1B19A0770(v244, v245, v246, v247, 1.0);
  v251 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v249, (uint64_t)&unk_1B2246200, v250);
  v255 = sub_1B19A0770(v251, v252, v253, v254, 1.0);
  v258 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v256, (uint64_t)&unk_1B2246270, v257);
  v262 = sub_1B19A0770(v258, v259, v260, v261, 1.02);
  objc_msgSend_setRenderingOrder_(v241, v263, 2, v264);
  objc_msgSend_setRenderingOrder_(v248, v265, 2, v266);
  objc_msgSend_setRenderingOrder_(v255, v267, 2, v268);
  objc_msgSend_setRenderingOrder_(v262, v269, 0, v270);
  objc_msgSend_setEulerAngles_(v241, v271, v272, v273, 0.0);
  objc_msgSend_setEulerAngles_(v255, v274, v275, v276, COERCE_DOUBLE(1070141403));
  objc_msgSend_setEulerAngles_(v262, v277, v278, v279, COERCE_DOUBLE(1070141403));
  objc_msgSend_setCategoryBitMask_(v241, v280, 785, v281);
  objc_msgSend_setCategoryBitMask_(v248, v282, 801, v283);
  objc_msgSend_setCategoryBitMask_(v255, v284, 817, v285);
  objc_msgSend_setCategoryBitMask_(v262, v286, 769, v287);
  v291 = (VFXNode *)objc_msgSend_node(VFXNode, v288, v289, v290);
  objc_msgSend_addChildNode_(v291, v292, (uint64_t)v262, v293);
  v297 = (VFXBillboardConstraint *)(id)objc_msgSend_billboardConstraint(VFXBillboardConstraint, v294, v295, v296);
  self->_billboard = v297;
  objc_msgSend_setPreserveScale_(v297, v298, 1, v299);
  self->_screenSpaceRotation = v291;
  v303 = (VFXNode *)objc_msgSend_node(VFXNode, v300, v301, v302);
  self->_rotationHandles = v303;
  objc_msgSend_addChildNode_(v303, v304, (uint64_t)v241, v305);
  objc_msgSend_addChildNode_(self->_rotationHandles, v306, (uint64_t)v248, v307);
  objc_msgSend_addChildNode_(self->_rotationHandles, v308, (uint64_t)v255, v309);
  objc_msgSend_addChildNode_(v234, v310, (uint64_t)self->_rotationHandles, v311);
  objc_msgSend_addChildNode_(v234, v312, (uint64_t)v291, v313);
  objc_msgSend_addChildNode_(self->_node, v314, (uint64_t)v234, v315);
  LODWORD(v316) = 1065185444;
  v320 = (void *)objc_msgSend_sphereWithRadius_(VFXParametricModel, v317, v318, v319, v316);
  objc_msgSend_setGeodesic_(v320, v321, 1, v322);
  objc_msgSend_setSegmentCount_(v320, v323, 24, v324);
  Material = (void *)objc_msgSend_firstMaterial(v320, v325, v326, v327);
  objc_msgSend_setShadingModel_(Material, v329, 2, v330);
  v334 = (void *)objc_msgSend_firstMaterial(v320, v331, v332, v333);
  objc_msgSend_setColorBufferWriteMask_(v334, v335, 0, v336);
  v339 = (VFXNode *)objc_msgSend_nodeWithModel_(VFXNode, v337, (uint64_t)v320, v338);
  LODWORD(v340) = 1008981770;
  objc_msgSend_setOpacity_(v339, v341, v342, v343, v340);
  objc_msgSend_setRenderingOrder_(v339, v344, 1, v345);
  self->_occluder = v339;
  objc_msgSend_addChildNode_(self->_node, v346, (uint64_t)v339, v347);
  LODWORD(v348) = 1045220557;
  LODWORD(v349) = 0;
  LODWORD(v350) = 1045220557;
  LODWORD(v351) = 1045220557;
  v355 = (void *)objc_msgSend_cubeWithWidth_height_length_chamferRadius_(VFXParametricModel, v352, v353, v354, v348, v350, v351, v349);
  v358 = objc_msgSend_vfx_colorWithCFXColor_(MEMORY[0x1E0DC3658], v356, (uint64_t)&unk_1B2246220, v357);
  v362 = (void *)objc_msgSend_firstMaterial(v355, v359, v360, v361);
  v366 = (void *)objc_msgSend_diffuse(v362, v363, v364, v365);
  objc_msgSend_setContents_(v366, v367, v358, v368);
  v372 = (void *)objc_msgSend_firstMaterial(v355, v369, v370, v371);
  objc_msgSend_setShadingModel_(v372, v373, 2, v374);
  v377 = (VFXNode *)objc_msgSend_nodeWithModel_(VFXNode, v375, (uint64_t)v355, v376);
  self->_scaleNode = v377;
  objc_msgSend_setCategoryBitMask_(v377, v378, 1073, v379);
  objc_msgSend_setHidden_(self->_scaleNode, v380, 1, v381);
  objc_msgSend_addChildNode_(self->_node, v382, (uint64_t)self->_scaleNode, v383);
  objc_msgSend_updateManipulatorComponents(self, v384, v385, v386);
  objc_msgSend_setImmediateMode_(VFXTransaction, v387, v389, v388);
}

- (void)updateManipulatorPosition:(__CFXEngineContext *)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  float v20;
  double v21;
  double v22;
  VFXNode *node;
  float32x2_t *planarTranslationLayout;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v40;
  uint64_t v41;
  float32x4_t *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v58;
  int8x16_t v59;
  int8x16_t v60;
  float32x4_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  VFXNode *arcHandleXZ;
  float64x2_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  float64x2_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int8x16_t v89;
  int8x16_t v90;
  float v91;
  float64x2_t v92;
  float v93;
  float32x4_t v94;
  float64x2_t v95;
  _OWORD v96[4];
  float32x4_t v97;
  float32x4_t v98;
  float32x4_t v99;
  __int128 v100;

  v6 = objc_msgSend_immediateMode(VFXTransaction, a2, (uint64_t)a3, v3);
  objc_msgSend_setImmediateMode_(VFXTransaction, v7, 1, v8);
  sub_1B19A0BE0(self, v9, v10, v11);
  v13 = v12;
  *(__n128 *)&self->_anon_1f0[4] = v12;
  *(__n128 *)&self->_anon_1f0[20] = v14;
  *(__n128 *)&self->_anon_1f0[36] = v15;
  *(__n128 *)&self->_anon_1f0[52] = v16;
  v12.n128_u32[0] = 1128792064;
  sub_1B17B39F8((__n128 *)a3, v12.n128_f64[0], v13, v14, v15, v16);
  *(float *)&v21 = v20;
  v22 = v20;
  node = self->_node;
  if (v22 <= 0.000001)
  {
    LODWORD(v22) = 0;
    objc_msgSend_setOpacity_(node, v17, v18, v19, v22, 0.000001, v21);
  }
  else
  {
    planarTranslationLayout = (float32x2_t *)self->_planarTranslationLayout;
    LODWORD(v22) = 1.0;
    v93 = *(float *)&v21;
    objc_msgSend_setOpacity_(node, v17, v18, v19, v22);
    objc_msgSend_setWorldTransform_(self->_node, v25, v26, v27, *(double *)vmulq_n_f32(*(float32x4_t *)&self->_anon_1f0[4], v93).i64, *(double *)vmulq_n_f32(*(float32x4_t *)&self->_anon_1f0[20], v93).i64, *(double *)vmulq_n_f32(*(float32x4_t *)&self->_anon_1f0[36], v93).i64, *(double *)&self->_anon_1f0[52]);
    v31 = objc_msgSend_effectiveEditingSpace(self, v28, v29, v30);
    if (!self->_layoutLocked || v31 == 3)
    {
      if (v31 == 3)
      {
        __asm { FMOV            V0.4S, #1.0 }
        *(_OWORD *)self->_planarTranslationLayout = _Q0;
      }
      else
      {
        v42 = (float32x4_t *)sub_1B1815A5C((uint64_t)a3, 1);
        v46 = 0;
        v47 = *v42;
        v48 = v42[1];
        v49 = v42[2];
        v50 = v42[3];
        v51 = *(_OWORD *)&self->_anon_1f0[20];
        v52 = *(_OWORD *)&self->_anon_1f0[36];
        v53 = *(_OWORD *)&self->_anon_1f0[52];
        v96[0] = *(_OWORD *)&self->_anon_1f0[4];
        v96[1] = v51;
        v96[2] = v52;
        v96[3] = v53;
        v97 = 0u;
        v98 = 0u;
        v99 = 0u;
        v100 = 0u;
        do
        {
          *(float32x4_t *)((char *)&v97 + v46 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(v96[v46])), v48, *(float32x2_t *)&v96[v46], 1), v49, (float32x4_t)v96[v46], 2), v50, (float32x4_t)v96[v46], 3);
          ++v46;
        }
        while (v46 != 4);
        _Q1.i64[1] = v98.i64[1];
        _Q3.i64[1] = 0;
        v54 = vmulq_f32(v99, (float32x4_t)0);
        v55 = vmlaq_f32(vmlaq_f32(v99, (float32x4_t)0, v98), (float32x4_t)0, v97);
        __asm
        {
          FMOV            V1.2S, #1.0
          FMOV            V3.2S, #-1.0
        }
        *(int8x8_t *)_Q1.f32 = vbsl_s8((int8x8_t)vcltz_f32((float32x2_t)*(_OWORD *)&vzip2q_s32((int32x4_t)vaddq_f32(v97, vmlaq_f32(v54, (float32x4_t)0, v98)), (int32x4_t)vmlaq_f32(vaddq_f32(v98, v54), (float32x4_t)0, v97))), *(int8x8_t *)_Q3.f32, *(int8x8_t *)_Q1.f32);
        _Q3.i32[0] = 1.0;
        if (v55.f32[2] >= 0.0)
          v55.f32[0] = 1.0;
        else
          v55.f32[0] = -1.0;
        v91 = _Q1.f32[0];
        v94 = v55;
        v58 = _Q1;
        v58.i32[2] = v55.i32[0];
        *(float32x4_t *)self->_planarTranslationLayout = v58;
        v59 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_f32(_Q1, _Q3), 0);
        v60 = (int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 1), _Q3), 0);
        objc_msgSend_setEulerAngles_(self->_arcHandleXY, v43, v44, v45, *(double *)vbslq_s8(v59, vbslq_s8(v60, (int8x16_t)xmmword_1B2268BE0, (int8x16_t)xmmword_1B2268C20), vbslq_s8(v60, (int8x16_t)xmmword_1B2268C10, (int8x16_t)xmmword_1B2245CC0)).i64, vbslq_s8(v60, (int8x16_t)xmmword_1B2268BF0, (int8x16_t)xmmword_1B2268C40), vbslq_s8(v60, (int8x16_t)xmmword_1B2268BD0, (int8x16_t)xmmword_1B2268C30));
        v61.i32[0] = 1.0;
        objc_msgSend_setEulerAngles_(self->_arcHandleYZ, v62, v63, v64, *(double *)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vceqq_f32(v94, v61), 0), v89, v90).i64);
        arcHandleXZ = self->_arcHandleXZ;
        if (v91 == 1.0)
        {
          if (v94.f32[0] == 1.0)
            objc_msgSend_setEulerAngles_(arcHandleXZ, v65, v66, v67, 50.1238708, *(double *)v94.i64);
          else
            objc_msgSend_setEulerAngles_(arcHandleXZ, v65, v66, v67, -0.195796371, *(double *)v94.i64);
        }
        else if (v94.f32[0] == 1.0)
        {
          objc_msgSend_setEulerAngles_(arcHandleXZ, v65, v66, v67, 0.195796371, *(double *)v94.i64);
        }
        else
        {
          objc_msgSend_setEulerAngles_(arcHandleXZ, v65, v66, v67, 0.0, *(double *)v94.i64);
        }
      }
    }
    v95 = (float64x2_t)vdupq_n_s64(0x3FD3333333333333uLL);
    __asm { FMOV            V1.2D, #0.5 }
    v92 = _Q1;
    objc_msgSend_setPosition_(self->_planarTranslationHandleXY, v32, v33, v34, COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vmulq_f64(vcvtq_f64_f32(*planarTranslationLayout), v95), _Q1))));
    v70 = vmulq_f64(vmulq_f64(vcvtq_f64_f32(*(float32x2_t *)&self->_planarTranslationLayout[4]), v95), v92);
    *(float32x2_t *)&v70.f64[0] = vcvt_f32_f64(v70);
    objc_msgSend_setPosition_(self->_planarTranslationHandleYZ, v71, v72, v73, *(double *)vextq_s8(vextq_s8((int8x16_t)0, (int8x16_t)0, 4uLL), (int8x16_t)v70, 0xCuLL).i64);
    v74 = vmulq_f64(vmulq_f64(vcvtq_f64_f32((float32x2_t)vzip1_s32((int32x2_t)*planarTranslationLayout, (int32x2_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)planarTranslationLayout->f32, *(int8x16_t *)planarTranslationLayout->f32, 8uLL))), v95), v92);
    *(float32x2_t *)&v74.f64[0] = vcvt_f32_f64(v74);
    objc_msgSend_setPosition_(self->_planarTranslationHandleXZ, v75, v76, v77, COERCE_DOUBLE((unint64_t)vzip1q_s32((int32x4_t)v74, (int32x4_t)v74).u32[0]));
    if (self->_screenSpaceRotation)
    {
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v79 = objc_msgSend___CFObject(self->_billboard, v40, v78, v41);
      v83 = objc_msgSend_nodeRef(self->_screenSpaceRotation, v80, v81, v82);
      if (sub_1B19BB838((uint64_t *)a3, v79, v83, &v97, v84, v85, v86, v87, 1.0))
        objc_msgSend_setTransform_(self->_screenSpaceRotation, v40, v88, v41, *(double *)v97.i64, *(double *)v98.i64, *(double *)v99.i64, *(double *)&v100);
    }
  }
  objc_msgSend_setImmediateMode_(VFXTransaction, v40, v6, v41);
}

- (void)updateManipulatorNode
{
  uint64_t v2;
  uint64_t v3;
  VFXNode *node;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  node = self->_node;
  if (!node)
  {
    objc_msgSend_setupNode(self, a2, v2, v3);
    node = self->_node;
  }
  if (!objc_msgSend_parentNode(node, a2, v2, v3))
  {
    v9 = (void *)objc_msgSend_authoringEnvironment(self, v6, v7, v8);
    v13 = (void *)objc_msgSend_authoringOverlayLayer(v9, v10, v11, v12);
    v17 = objc_msgSend_manipulatorNode(self, v14, v15, v16);
    objc_msgSend_addChildNode_(v13, v18, v17, v19);
  }
}

- (void)updateManipulatorComponents
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  int v13;
  const char *v14;
  uint64_t v15;
  _BOOL4 v16;
  _BOOL4 v17;
  BOOL v18;
  _BOOL8 v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  int v27;
  const char *v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;

  v5 = objc_msgSend__effectiveFeatures(self, a2, v2, v3);
  v11 = objc_msgSend_effectiveEditingSpace(self, v6, v7, v8);
  v12 = (v5 & 4) != 0 && !self->_readonly;
  v13 = !v12;
  objc_msgSend_setHidden_(self->_scaleNode, v9, !v12, v10);
  if ((v5 & 2) != 0)
  {
    v16 = !self->_readonly;
    if ((v5 & 1) != 0)
      goto LABEL_6;
  }
  else
  {
    v16 = 0;
    if ((v5 & 1) != 0)
    {
LABEL_6:
      v17 = !self->_readonly;
      goto LABEL_9;
    }
  }
  v17 = 0;
LABEL_9:
  v18 = v11 == 3;
  v19 = v11 == 3;
  v20 = v17 & v13 | !v16;
  if (v18)
    objc_msgSend_setHidden_(self->_rotationHandles, v14, 1, v15);
  else
    objc_msgSend_setHidden_(self->_rotationHandles, v14, v20, v15);
  objc_msgSend_setHidden_(self->_screenSpaceRotation, v21, v20, v22);
  objc_msgSend_setHidden_(self->_translateHandles, v23, v13 & !v17, v24);
  v27 = self->_readonly || !v17;
  objc_msgSend_setHidden_(self->_planarTranslationHandles, v25, (v12 || v16) | v27, v26);
  v30 = !v16 || !v17;
  if (self->_readonly)
    v30 = 1;
  objc_msgSend_setHidden_(self->_arcHandles, v28, v30 | v12, v29);
  objc_msgSend_setHidden_(self->_axis, v31, !self->_readonly, v32);
  objc_msgSend_setHidden_(self->_zArrow, v33, v19, v34);
  objc_msgSend_setHidden_(self->_planarTranslationHandleXZ, v35, v19, v36);
  objc_msgSend_setHidden_(self->_planarTranslationHandleYZ, v37, v19, v38);
  objc_msgSend_setHidden_(self->_arcHandleXZ, v39, v19, v40);
  objc_msgSend_setHidden_(self->_arcHandleYZ, v41, v19, v42);
}

- (unint64_t)_effectiveFeatures
{
  unint64_t features;
  unint64_t v3;

  features = self->_features;
  v3 = features | 4;
  if ((features & 4) != 0)
    v3 = 7;
  if (self->_alternateMode)
    return v3;
  else
    return self->_features;
}

- (void)setFeatures:(unint64_t)a3
{
  uint64_t v3;

  self->_features = a3;
  objc_msgSend_updateManipulatorComponents(self, a2, a3, v3);
}

- (void)setAlternateMode:(BOOL)a3
{
  uint64_t v3;

  self->_alternateMode = a3;
  objc_msgSend_updateManipulatorComponents(self, a2, a3, v3);
}

- (void)setReadonly:(BOOL)a3
{
  uint64_t v3;

  self->_readonly = a3;
  objc_msgSend_updateManipulatorComponents(self, a2, a3, v3);
}

- (unint64_t)features
{
  return self->_features;
}

- (void)lockLayout
{
  self->_layoutLocked = 1;
}

- (void)unlockLayout
{
  self->_layoutLocked = 0;
}

- (void)unhighlightSelectedNode
{
  uint64_t v2;

  objc_msgSend_enumerateHierarchyUsingBlock_(self->_highlightNode, a2, (uint64_t)&unk_1E63D1410, v2);
  self->_highlightNode = 0;
}

- (id)hitTest:(id *)a3
{
  uint64_t v3;
  VFXNode *node;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t i;
  VFXNode *v44;
  VFXNode *v45;
  void *v46;
  char isHidden;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  node = self->_node;
  if (!node)
    return 0;
  objc_msgSend_opacity(node, a2, (uint64_t)a3, v3);
  if (v10 == 0.0)
    return 0;
  if ((objc_msgSend_isHidden(self->_node, v7, v8, v9) & 1) != 0)
    return 0;
  v14 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v11, v12, v13);
  objc_msgSend_setObject_forKey_(v14, v15, (uint64_t)self->_node, (uint64_t)CFSTR("kHitTestRootNode"));
  v16 = MEMORY[0x1E0C9AAA0];
  objc_msgSend_setObject_forKey_(v14, v17, MEMORY[0x1E0C9AAA0], (uint64_t)CFSTR("kHitTestSkipHiddenNode"));
  objc_msgSend_setObject_forKey_(v14, v18, (uint64_t)&unk_1E6478610, (uint64_t)CFSTR("kHitTestSearchMode"));
  objc_msgSend_setObject_forKey_(v14, v19, v16, (uint64_t)CFSTR("kHitTestClipToZRange"));
  v22 = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], v20, 4, v21);
  objc_msgSend_setObject_forKey_(v14, v23, v22, (uint64_t)CFSTR("kHitTestLayerMask"));
  v27 = (void *)objc_msgSend_authoringEnvironment(self, v24, v25, v26);
  v31 = (void *)objc_msgSend_worldRenderer(v27, v28, v29, v30);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v34 = (void *)objc_msgSend_hitTest_options_(v31, v32, (uint64_t)v14, v33, a3->var2.x, a3->var2.y, 0);
  v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v53, (uint64_t)v57, 16);
  if (!v36)
    return 0;
  v40 = v36;
  v41 = 0;
  v42 = *(_QWORD *)v54;
  do
  {
    for (i = 0; i != v40; ++i)
    {
      if (*(_QWORD *)v54 != v42)
        objc_enumerationMutation(v34);
      v44 = (VFXNode *)objc_msgSend_node(*(void **)(*((_QWORD *)&v53 + 1) + 8 * i), v37, v38, v39);
      if (v44 == self->_occluder)
        goto LABEL_20;
      v45 = v44;
      while (objc_msgSend_categoryBitMask(v44, v37, v38, v39) == 0xFFFF)
      {
        v44 = (VFXNode *)objc_msgSend_parentNode(v45, v37, v38, v39);
        v45 = v44;
      }
      if ((v41 & 1) != 0 && (VFXNode *)objc_msgSend_parentNode(v45, v37, v38, v39) == self->_rotationHandles)
      {
LABEL_20:
        v41 = 1;
      }
      else
      {
        v46 = v45;
        if (!v45)
          return v45;
        do
        {
          isHidden = objc_msgSend_isHidden(v46, v37, v38, v39);
          v51 = objc_msgSend_parentNode(v46, v48, v49, v50);
          if ((isHidden & 1) != 0)
            break;
          v46 = (void *)v51;
        }
        while (v51);
        if ((isHidden & 1) == 0)
          return v45;
      }
    }
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v53, (uint64_t)v57, 16);
    v45 = 0;
  }
  while (v40);
  return v45;
}

- (void)_updateActionWithEvent:(id *)a3
{
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  VFXNode *v11;
  VFXNode *highlightNode;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  _OWORD v18[6];

  v5 = *(_OWORD *)&a3[1].var0;
  v18[2] = *(_OWORD *)&a3->var2.y;
  v18[3] = v5;
  v6 = *(_OWORD *)&a3[1].var2.y;
  v18[4] = *(_OWORD *)&a3[1].var1.y;
  v18[5] = v6;
  v7 = *(_OWORD *)&a3->var1.y;
  v18[0] = *(_OWORD *)&a3->var0;
  v18[1] = v7;
  v11 = (VFXNode *)objc_msgSend_hitTest_(self, a2, (uint64_t)v18, v3);
  highlightNode = self->_highlightNode;
  if (highlightNode != v11)
    objc_msgSend_unhighlightSelectedNode(self, v8, v9, v10);
  if (v11)
  {
    self->_action = objc_msgSend_categoryBitMask(v11, v8, v9, v10) >> 8;
    self->_selectedAxis = objc_msgSend_categoryBitMask(v11, v13, v14, v15) >> 4;
    if (highlightNode != v11)
    {
      self->_highlightNode = v11;
      objc_msgSend_enumerateHierarchyUsingBlock_(v11, v16, (uint64_t)&unk_1E63D18F0, v17);
    }
  }
  else
  {
    self->_action = 0;
  }
}

- (BOOL)mouseMoved:(id *)a3
{
  uint64_t v3;
  int action;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[6];

  action = self->_action;
  self->_action = 0;
  if (objc_msgSend_count(self->_targets, a2, (uint64_t)a3, v3) && !self->_readonly)
  {
    if ((objc_msgSend_isHidden(self->_node, v7, v8, v9) & 1) != 0)
      return 0;
    v13 = *(_OWORD *)&a3[1].var0;
    v16[2] = *(_OWORD *)&a3->var2.y;
    v16[3] = v13;
    v14 = *(_OWORD *)&a3[1].var2.y;
    v16[4] = *(_OWORD *)&a3[1].var1.y;
    v16[5] = v14;
    v15 = *(_OWORD *)&a3->var1.y;
    v16[0] = *(_OWORD *)&a3->var0;
    v16[1] = v15;
    objc_msgSend__updateActionWithEvent_(self, v10, (uint64_t)v16, v11);
  }
  return action != self->_action;
}

- (void)updateTargetsTransforms
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *presentationNodeTransforms;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self->_presentationItemsLock, a2, v2, v3);
  presentationNodeTransforms = self->_presentationNodeTransforms;
  if (presentationNodeTransforms)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(presentationNodeTransforms, v5, (uint64_t)&v25, (uint64_t)v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(presentationNodeTransforms);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v14 = (void *)objc_msgSend_node(v13, v5, v6, v7);
          v18 = (void *)objc_msgSend_presentationNode(v14, v15, v16, v17);
          objc_msgSend_transform(v13, v19, v20, v21);
          objc_msgSend_setTransform_(v18, v22, v23, v24);
        }
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(presentationNodeTransforms, v5, (uint64_t)&v25, (uint64_t)v29, 16);
      }
      while (v10);
    }
  }
  objc_msgSend_unlock(self->_presentationItemsLock, v5, v6, v7);
}

- (void)updateItemsPosition
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSOrderedSet *targets;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t j;
  double *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  simd_float4x4 v60;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = 816;
  if (!self->_cloning)
    v5 = 16;
  v6 = *(Class *)((char *)&self->super.isa + v5);
  if (objc_msgSend_count(v6, a2, v2, v3) > (unint64_t)self->_originalDataCount)
  {
    objc_msgSend_count(v6, v7, v8, v9);
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. The set we are updating contains more elements than the number of positions we have in store, something it wrong (%d vs %d)"), v10, v11, v12, v13, v14, v15, (uint64_t)"setToApplyTo.count <= _originalDataCount");
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v53, (uint64_t)v58, 16);
  if (v16)
  {
    v20 = v16;
    v21 = 0;
    v22 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v54 != v22)
          objc_enumerationMutation(v6);
        v24 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v25 = (void *)objc_msgSend_parentItem(v24, v17, v18, v19);
        objc_msgSend_worldTransform(v25, v26, v27, v28);
        __invert_f4(v60);
        v32 = (void *)objc_msgSend_node(v24, v29, v30, v31);
        objc_msgSend_transform(v32, v33, v34, v35);
        objc_msgSend_setTransform_(v24, v36, v37, v38);
      }
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v17, (uint64_t)&v53, (uint64_t)v58, 16);
      v21 += i;
    }
    while (v20);
  }
  if (self->_cloning)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    targets = self->_targets;
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(targets, v17, (uint64_t)&v49, (uint64_t)v57, 16);
    if (v40)
    {
      v44 = v40;
      v45 = 0;
      v46 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v44; ++j)
        {
          if (*(_QWORD *)v50 != v46)
            objc_enumerationMutation(targets);
          v48 = (double *)(*(_QWORD *)&self->_anon_188[16] + ((unint64_t)(v45 + j) << 6));
          objc_msgSend_setTransform_(*(void **)(*((_QWORD *)&v49 + 1) + 8 * j), v41, v42, v43, *v48, v48[2], v48[4], v48[6]);
        }
        v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(targets, v41, (uint64_t)&v49, (uint64_t)v57, 16);
        v45 += j;
      }
      while (v44);
    }
  }
}

- (void)updateItemsRotation:(VFXManipulator *)self
{
  float32x4_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float v12;
  float32x2_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  __int128 *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  simd_float4x4 v34;
  float32x4_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  int32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  int32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  int32x4_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  uint64_t v69;
  __int128 v70;
  uint64_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  uint64_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  NSOrderedSet *targets;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t j;
  double *v90;
  id obj;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  int8x16_t v95;
  uint64_t v96;
  uint64_t v97;
  simd_float4 v98;
  simd_float4 v99;
  __int128 v100;
  float32x4_t v101;
  float32x4_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v107;
  float32x4_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;
  simd_float4x4 v128;
  simd_float4x4 v129;
  simd_float4x4 v130;

  v108 = v2;
  v127 = *MEMORY[0x1E0C80C00];
  v3 = 816;
  if (!self->_cloning)
    v3 = 16;
  v4 = *(Class *)((char *)&self->super.isa + v3);
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  obj = v4;
  v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, a2, (uint64_t)&v113, (uint64_t)v126, 16);
  if (v97)
  {
    v8 = 0;
    v9 = v108;
    v10 = vmulq_f32(v9, v9);
    v11 = vmulq_laneq_f32(v9, v9, 3);
    v12 = vmulq_lane_f32(v9, *(float32x2_t *)v9.f32, 1).f32[0];
    v10.f32[0] = 0.5 - v10.f32[0];
    v13 = vmul_laneq_f32(*(float32x2_t *)v9.f32, v9, 2);
    v14.i32[3] = 0;
    v14.f32[0] = (float)(0.5 - v10.f32[1]) - v10.f32[2];
    v14.f32[1] = v12 + v11.f32[2];
    v14.f32[2] = v13.f32[0] - v11.f32[1];
    v15.i32[3] = 0;
    v15.f32[0] = v12 - v11.f32[2];
    v15.f32[1] = v10.f32[0] - v10.f32[2];
    v15.f32[2] = v13.f32[1] + v11.f32[0];
    *(int32x2_t *)v11.f32 = vrev64_s32(*(int32x2_t *)v11.f32);
    v16.i32[0] = vadd_f32(v13, *(float32x2_t *)v11.f32).u32[0];
    v16.i32[1] = vsub_f32(v13, *(float32x2_t *)&v11).i32[1];
    v96 = *(_QWORD *)v114;
    v16.f32[2] = v10.f32[0] - v10.f32[1];
    v16.i32[3] = 0;
    __asm { FMOV            V0.4S, #1.0 }
    v95 = _Q0;
    v93 = vaddq_f32(v15, v15);
    v94 = vaddq_f32(v14, v14);
    v92 = vaddq_f32(v16, v16);
    do
    {
      for (i = 0; i != v97; ++i)
      {
        if (*(_QWORD *)v114 != v96)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
        v24 = objc_msgSend_parentItem(v23, v5, v6, v7);
        if (v24)
        {
          v25 = (void *)v24;
          v26 = (__int128 *)(*(_QWORD *)&self->_anon_188[16] + ((unint64_t)v8 << 6));
          v104 = v26[1];
          v105 = *v26;
          v103 = v26[2];
          v107 = v26[3];
          v27 = objc_msgSend_selectionTransformMode(self->_authoringEnvironment, v5, v6, v7);
          objc_msgSend_worldTransform(v25, v28, v29, v30);
          v35 = (float32x4_t)v107;
          if (v27 != 1)
          {
            v128 = __invert_f4(v34);
            v36 = 0;
            v37 = *(_OWORD *)&self->_anon_1b0[20];
            v38 = *(_OWORD *)&self->_anon_1b0[36];
            v39 = *(_OWORD *)&self->_anon_1b0[52];
            v117 = *(_OWORD *)&self->_anon_1b0[4];
            v118 = v37;
            v119 = v38;
            v120 = v39;
            v121 = 0u;
            v122 = 0u;
            v123 = 0u;
            v124 = 0u;
            do
            {
              *(__int128 *)((char *)&v121 + v36) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v128.columns[0], COERCE_FLOAT(*(__int128 *)((char *)&v117 + v36))), (float32x4_t)v128.columns[1], *(float32x2_t *)((char *)&v117 + v36), 1), (float32x4_t)v128.columns[2], *(float32x4_t *)((char *)&v117 + v36), 2), (float32x4_t)v128.columns[3], *(float32x4_t *)((char *)&v117 + v36), 3);
              v36 += 16;
            }
            while (v36 != 64);
            v35 = (float32x4_t)v124;
          }
          v101 = v35;
          v102 = vnegq_f32(v35);
          objc_msgSend_worldTransform(v25, v31, v32, v33);
          v41 = vmulq_f32(v40, v40);
          v41.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v41, 2), vaddq_f32(v41, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 1))).u64[0];
          v42 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v41.f32, 0);
          v42.i32[3] = 0;
          v43 = vrsqrteq_f32(v42);
          v44 = vmulq_f32(v43, vrsqrtsq_f32(v42, vmulq_f32(v43, v43)));
          v45 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v41.f32[0] != 0.0)), 0x1FuLL));
          v45.i32[3] = 0;
          v46 = vmulq_f32(v40, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v45), (int8x16_t)vmulq_f32(v44, vrsqrtsq_f32(v42, vmulq_f32(v44, v44))), v95));
          v48 = vmulq_f32(v47, v47);
          v48.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v48, 2), vaddq_f32(v48, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v48.f32, 1))).u64[0];
          v49 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v48.f32, 0);
          v49.i32[3] = 0;
          v50 = vrsqrteq_f32(v49);
          v51 = vmulq_f32(v50, vrsqrtsq_f32(v49, vmulq_f32(v50, v50)));
          v52 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v48.f32[0] != 0.0)), 0x1FuLL));
          v52.i32[3] = 0;
          v129.columns[1] = (simd_float4)vmulq_f32(v47, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v52), (int8x16_t)vmulq_f32(v51, vrsqrtsq_f32(v49, vmulq_f32(v51, v51))), v95));
          v54 = vmulq_f32(v53, v53);
          v54.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v54, 2), vaddq_f32(v54, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v54.f32, 1))).u64[0];
          v55 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v54.f32, 0);
          v55.i32[3] = 0;
          v56 = vrsqrteq_f32(v55);
          v57 = vmulq_f32(v56, vrsqrtsq_f32(v55, vmulq_f32(v56, v56)));
          v58 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v54.f32[0] != 0.0)), 0x1FuLL));
          v58.i32[3] = 0;
          v129.columns[2] = (simd_float4)vmulq_f32(v53, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v58), (int8x16_t)vmulq_f32(v57, vrsqrtsq_f32(v55, vmulq_f32(v57, v57))), v95));
          v46.i32[3] = 0;
          v129.columns[1].i32[3] = 0;
          v129.columns[2].i32[3] = 0;
          v99 = v129.columns[1];
          v100 = (__int128)v46;
          v129.columns[0] = (simd_float4)v46;
          v98 = v129.columns[2];
          v129.columns[3] = (simd_float4)xmmword_1B2244E20;
          v130 = __invert_f4(v129);
          v62 = 0;
          v117 = (__int128)v94;
          v118 = (__int128)v93;
          v119 = (__int128)v92;
          v120 = xmmword_1B2244E20;
          v121 = 0u;
          v122 = 0u;
          v123 = 0u;
          v124 = 0u;
          do
          {
            *(__int128 *)((char *)&v121 + v62) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v130.columns[0], COERCE_FLOAT(*(__int128 *)((char *)&v117 + v62))), (float32x4_t)v130.columns[1], *(float32x2_t *)((char *)&v117 + v62), 1), (float32x4_t)v130.columns[2], *(float32x4_t *)((char *)&v117 + v62), 2), (float32x4_t)v130.columns[3], *(float32x4_t *)((char *)&v117 + v62), 3);
            v62 += 16;
          }
          while (v62 != 64);
          v63 = 0;
          v64 = v101;
          v64.i32[3] = 1.0;
          v65 = (float32x4_t)v121;
          v66 = (float32x4_t)v122;
          v67 = (float32x4_t)v123;
          v68 = (float32x4_t)v124;
          v117 = v100;
          v118 = (__int128)v99;
          v119 = (__int128)v98;
          v120 = xmmword_1B2244E20;
          v121 = 0uLL;
          v122 = 0uLL;
          v123 = 0uLL;
          v124 = 0uLL;
          do
          {
            *(__int128 *)((char *)&v121 + v63) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v65, COERCE_FLOAT(*(__int128 *)((char *)&v117 + v63))), v66, *(float32x2_t *)((char *)&v117 + v63), 1), v67, *(float32x4_t *)((char *)&v117 + v63), 2), v68, *(float32x4_t *)((char *)&v117 + v63), 3);
            v63 += 16;
          }
          while (v63 != 64);
          v69 = 0;
          v70 = (__int128)v102;
          HIDWORD(v70) = 1.0;
          v117 = v121;
          v118 = v122;
          v119 = v123;
          v120 = v124;
          v121 = 0uLL;
          v122 = 0uLL;
          v123 = 0uLL;
          v124 = 0uLL;
          do
          {
            *(__int128 *)((char *)&v121 + v69) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B2244DB0, COERCE_FLOAT(*(__int128 *)((char *)&v117 + v69))), (float32x4_t)xmmword_1B2244DD0, *(float32x2_t *)((char *)&v117 + v69), 1), (float32x4_t)xmmword_1B2244D90, *(float32x4_t *)((char *)&v117 + v69), 2), v64, *(float32x4_t *)((char *)&v117 + v69), 3);
            v69 += 16;
          }
          while (v69 != 64);
          v71 = 0;
          v72 = (float32x4_t)v121;
          v73 = (float32x4_t)v122;
          v74 = (float32x4_t)v123;
          v75 = (float32x4_t)v124;
          v117 = xmmword_1B2244DB0;
          v118 = xmmword_1B2244DD0;
          v119 = xmmword_1B2244D90;
          v120 = v70;
          v121 = 0uLL;
          v122 = 0uLL;
          v123 = 0uLL;
          v124 = 0uLL;
          do
          {
            *(__int128 *)((char *)&v121 + v71) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v72, COERCE_FLOAT(*(__int128 *)((char *)&v117 + v71))), v73, *(float32x2_t *)((char *)&v117 + v71), 1), v74, *(float32x4_t *)((char *)&v117 + v71), 2), v75, *(float32x4_t *)((char *)&v117 + v71), 3);
            v71 += 16;
          }
          while (v71 != 64);
          v76 = 0;
          v77 = (float32x4_t)v121;
          v78 = (float32x4_t)v122;
          v79 = (float32x4_t)v123;
          v80 = (float32x4_t)v124;
          v117 = v105;
          v118 = v104;
          v119 = v103;
          v120 = v107;
          v121 = 0uLL;
          v122 = 0uLL;
          v123 = 0uLL;
          v124 = 0uLL;
          do
          {
            *(__int128 *)((char *)&v121 + v76) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v77, COERCE_FLOAT(*(__int128 *)((char *)&v117 + v76))), v78, *(float32x2_t *)((char *)&v117 + v76), 1), v79, *(float32x4_t *)((char *)&v117 + v76), 2), v80, *(float32x4_t *)((char *)&v117 + v76), 3);
            v76 += 16;
          }
          while (v76 != 64);
          objc_msgSend_setTransform_(v23, v59, v60, v61, *(double *)&v121, *(double *)&v122, *(double *)&v123, *(double *)&v124);
        }
        ++v8;
      }
      v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v113, (uint64_t)v126, 16);
    }
    while (v97);
  }
  if (self->_cloning)
  {
    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    targets = self->_targets;
    v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(targets, v5, (uint64_t)&v109, (uint64_t)v125, 16);
    if (v82)
    {
      v86 = v82;
      v87 = 0;
      v88 = *(_QWORD *)v110;
      do
      {
        for (j = 0; j != v86; ++j)
        {
          if (*(_QWORD *)v110 != v88)
            objc_enumerationMutation(targets);
          v90 = (double *)(*(_QWORD *)&self->_anon_188[16] + ((unint64_t)(v87 + j) << 6));
          objc_msgSend_setTransform_(*(void **)(*((_QWORD *)&v109 + 1) + 8 * j), v83, v84, v85, *v90, v90[2], v90[4], v90[6]);
        }
        v86 = objc_msgSend_countByEnumeratingWithState_objects_count_(targets, v83, (uint64_t)&v109, (uint64_t)v125, 16);
        v87 += j;
      }
      while (v86);
    }
  }
}

- (void)updateItemsScale:(float)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  float32x4_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float32x4_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  __int128 *v30;
  float32x4_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  NSOrderedSet *targets;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t j;
  double *v44;
  float v45;
  float32x4_t v46;
  float v47;
  float32x4_t v48;
  float32x4_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  float32x4_t v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;
  simd_float4x4 v69;
  simd_float4x4 v70;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = 816;
  if (!self->_cloning)
    v4 = 16;
  v5 = *(Class *)((char *)&self->super.isa + v4);
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, a2, (uint64_t)&v54, (uint64_t)v67, 16, LODWORD(a3));
  if (v6)
  {
    v10 = v6;
    v11 = 0;
    v12 = *(_QWORD *)v55;
    v49 = (float32x4_t)LODWORD(v45);
    LODWORD(v13) = 0;
    *((float *)&v13 + 1) = v45;
    v47 = 1.0 - v45;
    v48 = (float32x4_t)v13;
    v14.i64[0] = 0;
    v14.i64[1] = LODWORD(v45);
    v46 = v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(v5);
        v16 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        v17 = objc_msgSend_parentItem(v16, v7, v8, v9, v46.i64[0]);
        if (v17)
        {
          v18 = (void *)v17;
          if (objc_msgSend_selectionTransformMode(self->_authoringEnvironment, v7, v8, v9) == 1)
          {
            v22 = *(_QWORD *)&self->_anon_188[16];
            v23 = v11;
            v24 = *(float32x4_t *)(v22 + ((unint64_t)v11 << 6) + 48);
          }
          else
          {
            objc_msgSend_worldTransform(v18, v19, v20, v21);
            v70 = __invert_f4(v69);
            v25 = 0;
            v26 = *(_OWORD *)&self->_anon_1b0[20];
            v27 = *(_OWORD *)&self->_anon_1b0[36];
            v28 = *(_OWORD *)&self->_anon_1b0[52];
            v58 = *(_OWORD *)&self->_anon_1b0[4];
            v59 = v26;
            v60 = v27;
            v61 = v28;
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            do
            {
              *(__int128 *)((char *)&v62 + v25) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v70.columns[0], COERCE_FLOAT(*(__int128 *)((char *)&v58 + v25))), (float32x4_t)v70.columns[1], *(float32x2_t *)((char *)&v58 + v25), 1), (float32x4_t)v70.columns[2], *(float32x4_t *)((char *)&v58 + v25), 2), (float32x4_t)v70.columns[3], *(float32x4_t *)((char *)&v58 + v25), 3);
              v25 += 16;
            }
            while (v25 != 64);
            v24 = v65;
            v22 = *(_QWORD *)&self->_anon_188[16];
            v23 = v11;
          }
          v29 = 0;
          v30 = (__int128 *)(v22 + (v23 << 6));
          *(float32x2_t *)v31.f32 = vmul_n_f32(*(float32x2_t *)v24.f32, v47);
          v31.i64[1] = __PAIR64__(1.0, COERCE_UNSIGNED_INT(vmuls_lane_f32(v47, v24, 2)));
          v32 = v30[1];
          v33 = v30[2];
          v34 = v30[3];
          v58 = *v30;
          v59 = v32;
          v60 = v33;
          v61 = v34;
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          do
          {
            *(__int128 *)((char *)&v62 + v29) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v49, COERCE_FLOAT(*(__int128 *)((char *)&v58 + v29))), v48, *(float32x2_t *)((char *)&v58 + v29), 1), v46, *(float32x4_t *)((char *)&v58 + v29), 2), v31, *(float32x4_t *)((char *)&v58 + v29), 3);
            v29 += 16;
          }
          while (v29 != 64);
          objc_msgSend_setTransform_(v16, v19, v20, v21, *(double *)&v62, *(double *)&v63, *(double *)&v64, *(double *)v65.i64);
        }
        ++v11;
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v54, (uint64_t)v67, 16);
    }
    while (v10);
  }
  if (self->_cloning)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    targets = self->_targets;
    v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(targets, v7, (uint64_t)&v50, (uint64_t)v66, 16);
    if (v36)
    {
      v40 = v36;
      v41 = 0;
      v42 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v51 != v42)
            objc_enumerationMutation(targets);
          v44 = (double *)(*(_QWORD *)&self->_anon_188[16] + ((unint64_t)(v41 + j) << 6));
          objc_msgSend_setTransform_(*(void **)(*((_QWORD *)&v50 + 1) + 8 * j), v37, v38, v39, *v44, v44[2], v44[4], v44[6]);
        }
        v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(targets, v37, (uint64_t)&v50, (uint64_t)v66, 16);
        v41 += j;
      }
      while (v40);
    }
  }
}

- (void)_saveOriginalData
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  NSOrderedSet *targets;
  const char *v10;
  uint64_t v11;
  _QWORD v12[5];

  objc_msgSend__deleteOriginalData(self, a2, v2, v3);
  v8 = objc_msgSend_count(self->_targets, v5, v6, v7);
  self->_originalDataCount = v8;
  if (v8)
  {
    *(_QWORD *)&self->_anon_188[8] = malloc_type_malloc(16 * v8, 0x1000040451B5BE8uLL);
    *(_QWORD *)self->_anon_188 = malloc_type_malloc(16 * self->_originalDataCount, 0x1000040451B5BE8uLL);
    *(_QWORD *)&self->_anon_188[24] = malloc_type_malloc(16 * self->_originalDataCount, 0x1000040451B5BE8uLL);
    *(_QWORD *)&self->_anon_188[16] = malloc_type_malloc((unint64_t)self->_originalDataCount << 6, 0x1000040FA0F61DDuLL);
    targets = self->_targets;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1B19A2450;
    v12[3] = &unk_1E63D6788;
    v12[4] = self;
    objc_msgSend_enumerateObjectsUsingBlock_(targets, v10, (uint64_t)v12, v11);
  }
}

- (void)_deleteOriginalData
{
  unsigned __int8 *anon_188;

  anon_188 = self->_anon_188;
  free(*(void **)self->_anon_188);
  free(*(void **)&self->_anon_188[8]);
  free(*(void **)&self->_anon_188[24]);
  free(*(void **)&self->_anon_188[16]);
  self->_originalDataCount = 0;
  *(_OWORD *)anon_188 = 0u;
  *((_OWORD *)anon_188 + 1) = 0u;
}

- (void)clearRuntimeItems
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_lock(self->_presentationItemsLock, a2, v2, v3);

  self->_presentationNodeTransforms = 0;
  objc_msgSend_unlock(self->_presentationItemsLock, v5, v6, v7);
}

- (void)_updateRuntimeItems
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *presentationNodeTransforms;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSOrderedSet *targets;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  NSOrderedSet *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  VFXManipulatorNodeTransformPair *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  objc_msgSend_lock(self->_presentationItemsLock, a2, v2, v3);
  presentationNodeTransforms = self->_presentationNodeTransforms;
  if (!presentationNodeTransforms)
  {
    presentationNodeTransforms = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_presentationNodeTransforms = presentationNodeTransforms;
  }
  if (self->_cloning)
  {
    objc_msgSend_removeAllObjects(presentationNodeTransforms, v5, v6, v7);
  }
  else
  {
    v12 = objc_msgSend_count(presentationNodeTransforms, v5, v6, v7);
    if (v12 == objc_msgSend_count(self->_targets, v13, v14, v15))
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      targets = self->_targets;
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(targets, v16, (uint64_t)&v63, (uint64_t)v71, 16);
      if (v20)
      {
        v21 = v20;
        v22 = 0;
        v23 = *(_QWORD *)v64;
        do
        {
          v24 = 0;
          v25 = v22;
          do
          {
            if (*(_QWORD *)v64 != v23)
              objc_enumerationMutation(targets);
            v26 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v24);
            v27 = (void *)objc_msgSend_objectAtIndex_(self->_presentationNodeTransforms, v9, v25 + v24, v11);
            v31 = objc_msgSend_node(v26, v28, v29, v30);
            objc_msgSend_setNode_(v27, v32, v31, v33);
            objc_msgSend_draggedTransform(v26, v34, v35, v36);
            objc_msgSend_setTransform_(v27, v37, v38, v39);
            ++v24;
          }
          while (v21 != v24);
          v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(targets, v9, (uint64_t)&v63, (uint64_t)v71, 16);
          v22 = v25 + v24;
        }
        while (v21);
      }
    }
    else
    {
      objc_msgSend_removeAllObjects(self->_presentationNodeTransforms, v16, v17, v18);
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v40 = self->_targets;
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v67, (uint64_t)v72, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v68;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v68 != v44)
              objc_enumerationMutation(v40);
            v46 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
            v47 = objc_alloc_init(VFXManipulatorNodeTransformPair);
            v51 = objc_msgSend_node(v46, v48, v49, v50);
            objc_msgSend_setNode_(v47, v52, v51, v53);
            objc_msgSend_draggedTransform(v46, v54, v55, v56);
            objc_msgSend_setTransform_(v47, v57, v58, v59);
            objc_msgSend_addObject_(self->_presentationNodeTransforms, v60, (uint64_t)v47, v61);
          }
          v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v62, (uint64_t)&v67, (uint64_t)v72, 16);
        }
        while (v43);
      }
    }
  }
  objc_msgSend_unlock(self->_presentationItemsLock, v9, v10, v11);
}

- (BOOL)_applyWithEvent:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  float32x4_t v9;
  float32x4_t v10;
  float32x4_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  float v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  int shouldSnapToAlign;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  float v68;
  float v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  float32x4_t v88;
  float32x4_t v89;
  float32x4_t v90;
  float32x4_t v91;
  float32x4_t v92;
  float v93;
  float v94;
  int selectedAxis;
  float v96;
  float v97;
  float v98;
  float32x4_t v99;
  int32x4_t v100;
  float32x2_t v101;
  float32x2_t v102;
  float32x4_t v103;
  float v104;
  BOOL v105;
  double v106;
  double v107;
  double v108;
  float v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;
  float v132;
  float32x4_t v133;
  float32_t v134;
  float v135;
  float32x2_t v136;
  float32x4_t v137;
  float32x4_t v138;
  __int128 v139;
  __int128 v140;
  float32x4_t v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  int64_t v154;
  float var0;
  uint64_t v156;
  int64_t v157;
  float v158;
  uint64_t v159;
  int64_t v160;
  float v161;
  uint64_t v162;
  int64_t v163;
  float v164;
  uint64_t v165;
  int64_t v166;
  float v167;
  uint64_t v168;
  int64_t v169;
  float v170;
  uint64_t v171;
  float32x4_t v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  float32x4_t v177;
  float32x4_t v178;
  float32x4_t v179;
  float32x4_t v180;
  float v181;
  float32x4_t v182;
  float32x4_t v183;
  _OWORD v184[3];
  __int128 v185;
  __int128 v186;
  __int128 v187;
  uint64_t v188;
  simd_float4x4 v189;
  simd_float4x4 v190;

  v188 = *MEMORY[0x1E0C80C00];
  v9 = *(float32x4_t *)&a3[1].var0;
  v10 = vsubq_f32(*(float32x4_t *)&a3[1].var1.y, v9);
  switch(self->_action)
  {
    case 1u:
      v179 = *(float32x4_t *)&self->_anon_1f0[52];
      *(double *)v11.i64 = sub_1B19A3310((float32x4_t *)self, v9, v10);
      v178 = vaddq_f32(v11, *(float32x4_t *)&self->_anon_130[32]);
      objc_msgSend_begin(VFXTransaction, v12, v13, v14);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v15, v16, v17, 0.0);
      LOBYTE(v184[0]) = 0;
      v21 = (void *)objc_msgSend_authoringEnvironment(self, v18, v19, v20);
      objc_msgSend_gridUnit(v21, v22, v23, v24);
      v26 = v25;
      *((_QWORD *)&v185 + 1) = -1;
      *(_QWORD *)&v186 = -1;
      *(_QWORD *)&v185 = -1;
      v30 = (void *)objc_msgSend_authoringEnvironment(self, v27, v28, v29);
      shouldSnapToAlign = objc_msgSend_shouldSnapToAlign(v30, v31, v32, v33);
      v39 = 0;
      v40 = 0;
      if (shouldSnapToAlign)
      {
        *(float *)&v38 = v26;
        objc_msgSend__snapPositionToAlign_original_unit_axisMove_rayStart_rayDir_didSnap_snapIndexes_(self, v35, 1, (uint64_t)v184, &v185, *(double *)v178.i64, *(double *)v179.i64, v38, *(double *)self->_anon_130, *(double *)&self->_anon_130[16]);
      }
      v177.i64[1] = v40;
      v41 = (void *)objc_msgSend_authoringEnvironment(self, v35, v36, v37, v39);
      if (!objc_msgSend_shouldSnapOnGrid(v41, v42, v43, v44))
        goto LABEL_41;
      if (v26 == 0.0)
        goto LABEL_41;
      v183.i8[0] = 0;
      *(double *)v48.i64 = sub_1B19A33F4(1, &v183, v178, v179, v26, *(float32x4_t *)self->_anon_130, *(float32x4_t *)&self->_anon_130[16]);
      if (!v183.i8[0])
        goto LABEL_41;
      if (LOBYTE(v184[0]))
      {
        v49 = vsubq_f32(v48, v178);
        v50 = vmulq_f32(v49, v49);
        v51 = vsubq_f32(v177, v178);
        v52 = vmulq_f32(v51, v51);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v50, 2), vaddq_f32(v50, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v50.f32, 1))).f32[0]) >= sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v52, 2), vaddq_f32(v52, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v52.f32, 1))).f32[0]))
        {
LABEL_41:
          if (!LOBYTE(v184[0]))
            goto LABEL_77;
          objc_msgSend_lock(self->_snapLock, v45, v46, v47);
          v154 = v185;
          if ((_QWORD)v185 != -1 && (uint64_t)v185 < self->_snapToAlignCount)
          {
            var0 = self->_snapToAlignOnX[v185].var0;
            v156 = v185;
            do
            {
              if (vabds_f32(self->_snapToAlignOnX[v156].var0, var0) >= 0.00001)
                break;
              objc_msgSend_addIndex_(self->_snapXIndexes, v151, v154++, v153);
              ++v156;
            }
            while (v154 < self->_snapToAlignCount);
          }
          v157 = *((_QWORD *)&v185 + 1);
          if (*((_QWORD *)&v185 + 1) != -1 && *((uint64_t *)&v185 + 1) < self->_snapToAlignCount)
          {
            v158 = self->_snapToAlignOnY[*((_QWORD *)&v185 + 1)].var0;
            v159 = *((_QWORD *)&v185 + 1);
            do
            {
              if (vabds_f32(self->_snapToAlignOnY[v159].var0, v158) >= 0.00001)
                break;
              objc_msgSend_addIndex_(self->_snapYIndexes, v151, v157++, v153);
              ++v159;
            }
            while (v157 < self->_snapToAlignCount);
          }
          v160 = v186;
          if ((_QWORD)v186 != -1 && (uint64_t)v186 < self->_snapToAlignCount)
          {
            v161 = self->_snapToAlignOnZ[v186].var0;
            v162 = v186;
            do
            {
              if (vabds_f32(self->_snapToAlignOnZ[v162].var0, v161) >= 0.00001)
                break;
              objc_msgSend_addIndex_(self->_snapZIndexes, v151, v160++, v153);
              ++v162;
            }
            while (v160 < self->_snapToAlignCount);
          }
          goto LABEL_76;
        }
        *((_QWORD *)&v185 + 1) = -1;
        *(_QWORD *)&v186 = -1;
        *(_QWORD *)&v185 = -1;
      }
      else
      {
        LOBYTE(v184[0]) = 1;
      }
      v177 = v48;
      goto LABEL_41;
    case 2u:
      v180 = *(float32x4_t *)&self->_anon_1f0[52];
      v54 = *(float32x4_t *)&self->_anon_130[16];
      v55 = vmulq_f32(v10, v54);
      v56 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v55, 2), vaddq_f32(v55, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v55.f32, 1)));
      if (v56.f32[0] != 0.0)
      {
        v57 = vmulq_f32(v54, vsubq_f32(*(float32x4_t *)&self->_anon_130[32], v9));
        v9 = vmlaq_n_f32(v9, v10, vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v57, 2), vaddq_f32(v57, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v57.f32, 1))), v56).f32[0]);
      }
      v178 = vaddq_f32(v9, *(float32x4_t *)&self->_anon_130[48]);
      objc_msgSend_begin(VFXTransaction, a2, (uint64_t)a3, v3);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v58, v59, v60, 0.0);
      LOBYTE(v184[0]) = 0;
      v64 = (void *)objc_msgSend_authoringEnvironment(self, v61, v62, v63);
      objc_msgSend_gridUnit(v64, v65, v66, v67);
      v69 = v68;
      *((_QWORD *)&v185 + 1) = -1;
      *(_QWORD *)&v186 = -1;
      *(_QWORD *)&v185 = -1;
      v73 = (void *)objc_msgSend_authoringEnvironment(self, v70, v71, v72);
      v77 = objc_msgSend_shouldSnapToAlign(v73, v74, v75, v76);
      v82 = 0;
      v83 = 0;
      if (v77)
      {
        *(float *)&v81 = v69;
        objc_msgSend__snapPositionToAlign_original_unit_axisMove_rayStart_rayDir_didSnap_snapIndexes_(self, v78, 0, (uint64_t)v184, &v185, *(double *)v178.i64, *(double *)v180.i64, v81, 0.0, 0.0);
      }
      v177.i64[1] = v83;
      v84 = (void *)objc_msgSend_authoringEnvironment(self, v78, v79, v80, v82);
      if (!objc_msgSend_shouldSnapOnGrid(v84, v85, v86, v87))
        goto LABEL_60;
      if (v69 == 0.0)
        goto LABEL_60;
      v183.i8[0] = 0;
      *(double *)v88.i64 = sub_1B19A33F4(0, &v183, v178, v180, v69, *(float32x4_t *)&self->_anon_130[32], *(float32x4_t *)&self->_anon_130[16]);
      if (!v183.i8[0])
        goto LABEL_60;
      if (LOBYTE(v184[0]))
      {
        v89 = vsubq_f32(v88, v178);
        v90 = vmulq_f32(v89, v89);
        v91 = vsubq_f32(v177, v178);
        v92 = vmulq_f32(v91, v91);
        if (sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v90, 2), vaddq_f32(v90, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v90.f32, 1))).f32[0]) >= sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v92, 2), vaddq_f32(v92, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v92.f32, 1))).f32[0]))goto LABEL_60;
        *((_QWORD *)&v185 + 1) = -1;
        *(_QWORD *)&v186 = -1;
        *(_QWORD *)&v185 = -1;
      }
      else
      {
        LOBYTE(v184[0]) = 1;
      }
      v177 = v88;
LABEL_60:
      if (LOBYTE(v184[0]))
      {
        objc_msgSend_lock(self->_snapLock, v45, v46, v47);
        v163 = v185;
        if ((_QWORD)v185 != -1 && (uint64_t)v185 < self->_snapToAlignCount)
        {
          v164 = self->_snapToAlignOnX[v185].var0;
          v165 = v185;
          do
          {
            if (vabds_f32(self->_snapToAlignOnX[v165].var0, v164) >= 0.00001)
              break;
            objc_msgSend_addIndex_(self->_snapXIndexes, v151, v163++, v153);
            ++v165;
          }
          while (v163 < self->_snapToAlignCount);
        }
        v166 = *((_QWORD *)&v185 + 1);
        if (*((_QWORD *)&v185 + 1) != -1 && *((uint64_t *)&v185 + 1) < self->_snapToAlignCount)
        {
          v167 = self->_snapToAlignOnY[*((_QWORD *)&v185 + 1)].var0;
          v168 = *((_QWORD *)&v185 + 1);
          do
          {
            if (vabds_f32(self->_snapToAlignOnY[v168].var0, v167) >= 0.00001)
              break;
            objc_msgSend_addIndex_(self->_snapYIndexes, v151, v166++, v153);
            ++v168;
          }
          while (v166 < self->_snapToAlignCount);
        }
        v169 = v186;
        if ((_QWORD)v186 != -1 && (uint64_t)v186 < self->_snapToAlignCount)
        {
          v170 = self->_snapToAlignOnZ[v186].var0;
          v171 = v186;
          do
          {
            if (vabds_f32(self->_snapToAlignOnZ[v171].var0, v170) >= 0.00001)
              break;
            objc_msgSend_addIndex_(self->_snapZIndexes, v151, v169++, v153);
            ++v171;
          }
          while (v169 < self->_snapToAlignCount);
        }
LABEL_76:
        objc_msgSend_unlock(self->_snapLock, v151, v152, v153, v177.i64[0]);
        v178 = v177;
      }
LABEL_77:
      v172 = v178;
      v172.i32[3] = *(_DWORD *)&self->_anon_1f0[64];
      *(float32x4_t *)&self->_anon_1f0[52] = v172;
      objc_msgSend_updateItemsPosition(self, v45, v46, v47, v177.i64[0]);
      objc_msgSend_commit(VFXTransaction, v173, v174, v175);
      return 1;
    case 3u:
      v93 = a3->var1.y - self->_originalMouseLocation.y;
      v94 = (float)(*(float *)self->_anon_130 * v93) * 0.01;
      v183 = 0uLL;
      selectedAxis = self->_selectedAxis;
      if (self->_selectedAxis)
      {
        v96 = 0.0;
        if (selectedAxis == 1)
          v97 = 1.0;
        else
          v97 = 0.0;
        if (selectedAxis == 2)
          v98 = 1.0;
        else
          v98 = 0.0;
        if (selectedAxis == 3)
          v96 = 1.0;
        v99 = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(*(float32x4_t *)&self->_anon_1b0[36], v96), *(float32x4_t *)&self->_anon_1b0[20], v98), *(float32x4_t *)&self->_anon_1b0[4], v97);
        v100 = (int32x4_t)vmulq_f32(v99, v99);
        v100.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v100, 2), vadd_f32(*(float32x2_t *)v100.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v100.i8, 1))).u32[0];
        v101 = vrsqrte_f32((float32x2_t)v100.u32[0]);
        v102 = vmul_f32(v101, vrsqrts_f32((float32x2_t)v100.u32[0], vmul_f32(v101, v101)));
        v103 = vmulq_n_f32(v99, vmul_f32(v102, vrsqrts_f32((float32x2_t)v100.u32[0], vmul_f32(v102, v102))).f32[0]);
      }
      else
      {
        v181 = v94;
        v120 = (void *)objc_msgSend_authoringEnvironment(self, a2, (uint64_t)a3, v3);
        objc_msgSend_viewMatrix(v120, v121, v122, v123);
        v190 = __invert_f4(v189);
        v94 = v181;
        v103 = vmlaq_f32(vmlaq_f32(vnegq_f32((float32x4_t)v190.columns[2]), (float32x4_t)0, (float32x4_t)v190.columns[1]), (float32x4_t)0, (float32x4_t)v190.columns[0]);
      }
      v103.f32[3] = v94;
      v182 = v103;
      sub_1B17C9890((__n128 *)&v183, &v182);
      v127 = 0;
      v128 = v183;
      v129 = vmulq_f32(v128, v128);
      v130 = vmulq_laneq_f32(v128, v128, 3);
      v131 = vmulq_lane_f32(v128, *(float32x2_t *)v128.f32, 1);
      v132 = v129.f32[1];
      v133.f32[0] = (float)(0.5 - v129.f32[1]) - v129.f32[2];
      v134 = v131.f32[0] + v130.f32[2];
      v131.f32[0] = v131.f32[0] - v130.f32[2];
      v135 = 0.5 - v129.f32[0];
      v136 = vmul_laneq_f32(*(float32x2_t *)v128.f32, v128, 2);
      v133.f32[1] = v134;
      v133.f32[2] = v136.f32[0] - v130.f32[1];
      v137 = vaddq_f32(v133, v133);
      v131.f32[1] = (float)(0.5 - v129.f32[0]) - v129.f32[2];
      v131.f32[2] = v136.f32[1] + v130.f32[0];
      v138 = vaddq_f32(v131, v131);
      *(int32x2_t *)v130.f32 = vrev64_s32(*(int32x2_t *)v130.f32);
      v131.i32[0] = vadd_f32(v136, *(float32x2_t *)v130.f32).u32[0];
      v131.i32[1] = vsub_f32(v136, *(float32x2_t *)&v130).i32[1];
      v131.f32[2] = v135 - v132;
      v139 = *(_OWORD *)&self->_anon_1b0[20];
      v140 = *(_OWORD *)&self->_anon_1b0[36];
      v141 = vaddq_f32(v131, v131);
      v184[0] = *(_OWORD *)&self->_anon_1b0[4];
      v184[1] = v139;
      v184[2] = v140;
      v185 = 0u;
      v186 = 0u;
      v187 = 0u;
      do
      {
        *(__int128 *)((char *)&v185 + v127 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v137, COERCE_FLOAT(v184[v127])), v138, *(float32x2_t *)&v184[v127], 1), v141, (float32x4_t)v184[v127], 2);
        ++v127;
      }
      while (v127 != 3);
      v142 = v185;
      v143 = v186;
      v144 = v187;
      HIDWORD(v142) = 0;
      HIDWORD(v143) = 0;
      HIDWORD(v144) = 0;
      *(_OWORD *)&self->_anon_1f0[4] = v142;
      *(_OWORD *)&self->_anon_1f0[20] = v143;
      *(_OWORD *)&self->_anon_1f0[36] = v144;
      *(_OWORD *)&self->_anon_1f0[52] = xmmword_1B2244E20;
      objc_msgSend_begin(VFXTransaction, v124, v125, v126);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v145, v146, v147, 0.0);
      objc_msgSend_updateItemsRotation_(self, v148, v149, v150, *(double *)v183.i64);
      goto LABEL_38;
    case 4u:
      v104 = a3->var1.y - self->_originalMouseLocation.y;
      v105 = v104 <= 0.0;
      v106 = v104;
      v107 = 1.0 / ((100.0 - v106) / 100.0);
      v108 = (v106 + 100.0) / 100.0;
      if (v105)
        v108 = v107;
      v109 = v108;
      objc_msgSend_begin(VFXTransaction, a2, (uint64_t)a3, v3);
      objc_msgSend_setAnimationDuration_(VFXTransaction, v110, v111, v112, 0.0);
      *(float *)&v113 = v109;
      objc_msgSend_updateItemsScale_(self, v114, v115, v116, v113);
LABEL_38:
      objc_msgSend_commit(VFXTransaction, v117, v118, v119);
      return 1;
    default:
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unknown manipulator action"), (uint64_t)a3, v3, v4, v5, v6, v7, v176);
      return 0;
  }
}

- (void)lockSnapGuides
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_lock(self->_snapLock, a2, v2, v3);
}

- (void)unlockSnapGuides
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_unlock(self->_snapLock, a2, v2, v3);
}

- (void)clearSnapIndexes
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend_lock(self->_snapLock, a2, v2, v3);
  free(self->_snapToAlignOnX);
  free(self->_snapToAlignOnY);
  free(self->_snapToAlignOnZ);
  *(_OWORD *)&self->_snapToAlignCount = 0u;
  *(_OWORD *)&self->_snapToAlignOnY = 0u;
  objc_msgSend_removeAllIndexes(self->_snapXIndexes, v5, v6, v7);
  objc_msgSend_removeAllIndexes(self->_snapYIndexes, v8, v9, v10);
  objc_msgSend_removeAllIndexes(self->_snapZIndexes, v11, v12, v13);
  objc_msgSend_unlock(self->_snapLock, v14, v15, v16);
}

- (BOOL)mouseDragged:(id *)a3
{
  uint64_t v3;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  const char *v12;
  uint64_t v13;
  char v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  if (!self->_action)
    return 0;
  v6 = *(_OWORD *)&a3[1].var0;
  v21 = *(_OWORD *)&a3->var2.y;
  v22 = v6;
  v7 = *(_OWORD *)&a3[1].var2.y;
  v23 = *(_OWORD *)&a3[1].var1.y;
  v24 = v7;
  v8 = *(_OWORD *)&a3->var1.y;
  v19 = *(_OWORD *)&a3->var0;
  v20 = v8;
  objc_msgSend__updateCloneStateWithEvent_(self, a2, (uint64_t)&v19, v3);
  v9 = *(_OWORD *)&a3[1].var0;
  v21 = *(_OWORD *)&a3->var2.y;
  v22 = v9;
  v10 = *(_OWORD *)&a3[1].var2.y;
  v23 = *(_OWORD *)&a3[1].var1.y;
  v24 = v10;
  v11 = *(_OWORD *)&a3->var1.y;
  v19 = *(_OWORD *)&a3->var0;
  v20 = v11;
  v14 = objc_msgSend__applyWithEvent_(self, v12, (uint64_t)&v19, v13);
  objc_msgSend__updateRuntimeItems(self, v15, v16, v17);
  return v14;
}

- (BOOL)mouseDown:(id *)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  __int128 v28;
  __int128 v29;
  float32x4_t var1;
  unsigned int selectedAxis;
  float v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  int32x4_t v41;
  float32x2_t v42;
  float32x2_t v43;
  float32x4_t v44;
  int v46;
  float v47;
  float v48;
  float v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  int v57;
  float v58;
  float v59;
  float v60;
  float32x4_t v61;
  int32x4_t v62;
  float32x2_t v63;
  float32x2_t v64;
  float32x4_t v65;
  BOOL v66;
  float v67;
  uint64_t v68;
  float32x4_t v69;
  _OWORD v70[6];

  if ((objc_msgSend_readonly(self, a2, (uint64_t)a3, v3) & 1) != 0)
    return 0;
  v8 = *(_OWORD *)&a3[1].var0;
  v70[2] = *(_OWORD *)&a3->var2.y;
  v70[3] = v8;
  v9 = *(_OWORD *)&a3[1].var2.y;
  v70[4] = *(_OWORD *)&a3[1].var1.y;
  v70[5] = v9;
  v10 = *(_OWORD *)&a3->var1.y;
  v70[0] = *(_OWORD *)&a3->var0;
  v70[1] = v10;
  objc_msgSend__updateActionWithEvent_(self, v6, (uint64_t)v70, v7);
  if (!self->_action)
    return 0;
  v14 = 1;
  self->_isMouseDown = 1;
  objc_msgSend__saveOriginalData(self, v11, v12, v13);
  sub_1B19A0BE0(self, v15, v16, v17);
  *(float32x4_t *)&self->_anon_1f0[4] = v24;
  *(float32x4_t *)&self->_anon_1f0[20] = v25;
  *(float32x4_t *)&self->_anon_1f0[36] = v26;
  *(float32x4_t *)&self->_anon_1f0[52] = v27;
  v28 = *(_OWORD *)&self->_anon_1f0[20];
  *(_OWORD *)&self->_anon_1b0[4] = *(_OWORD *)&self->_anon_1f0[4];
  *(_OWORD *)&self->_anon_1b0[20] = v28;
  v29 = *(_OWORD *)&self->_anon_1f0[52];
  *(_OWORD *)&self->_anon_1b0[36] = *(_OWORD *)&self->_anon_1f0[36];
  *(_OWORD *)&self->_anon_1b0[52] = v29;
  var1 = (float32x4_t)a3->var1;
  self->_originalMouseLocation = (CGPoint)var1;
  switch(self->_action)
  {
    case 1u:
      selectedAxis = self->_selectedAxis;
      __asm { FMOV            V5.2S, #1.0 }
      *(int8x8_t *)var1.f32 = vand_s8((int8x8_t)vceq_s32(vdup_n_s32(selectedAxis), (int32x2_t)0x200000001), _D5);
      v37 = 0.0;
      if (selectedAxis == 3)
        v37 = 1.0;
      var1.f32[2] = v37;
      v38 = vmulq_f32(var1, (float32x4_t)vdupq_n_s32(0x42C80000u));
      v39 = vmlaq_f32(vmlaq_f32(vmlaq_f32(v27, (float32x4_t)0, v26), (float32x4_t)0, v25), (float32x4_t)0, v24);
      v40 = vsubq_f32(vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32(v27, v26, v38, 2), v25, *(float32x2_t *)v38.f32, 1), v24, v38.f32[0]), v39);
      v69 = v39;
      v41 = (int32x4_t)vmulq_f32(v40, v40);
      v41.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v41, 2), vadd_f32(*(float32x2_t *)v41.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v41.i8, 1))).u32[0];
      v42 = vrsqrte_f32((float32x2_t)v41.u32[0]);
      v43 = vmul_f32(v42, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v42, v42)));
      *(float32x4_t *)self->_anon_130 = v39;
      *(float32x4_t *)&self->_anon_130[16] = vmulq_n_f32(v40, vmul_f32(v43, vrsqrts_f32((float32x2_t)v41.u32[0], vmul_f32(v43, v43))).f32[0]);
      *(double *)v44.i64 = sub_1B19A3310((float32x4_t *)self, *(float32x4_t *)&a3[1].var0, vsubq_f32(*(float32x4_t *)&a3[1].var1.y, *(float32x4_t *)&a3[1].var0));
      *(float32x4_t *)&self->_anon_130[32] = vsubq_f32(v69, v44);
      break;
    case 2u:
      v46 = self->_selectedAxis;
      v47 = 1.0;
      if (v46 == 1)
        v48 = 1.0;
      else
        v48 = 0.0;
      if (v46 == 2)
        v49 = 1.0;
      else
        v49 = 0.0;
      if (v46 != 3)
        v47 = 0.0;
      v50 = vmlaq_f32(vmlaq_f32(vmlaq_f32(v27, (float32x4_t)0, v26), (float32x4_t)0, v25), (float32x4_t)0, v24);
      v51 = vsubq_f32(vmlaq_n_f32(vmlaq_n_f32(vmlaq_n_f32(v27, v26, v47), v25, v49), v24, v48), v50);
      *(float32x4_t *)&self->_anon_130[16] = v51;
      *(float32x4_t *)&self->_anon_130[32] = v50;
      *(float32x4_t *)self->_anon_130 = v50;
      v52 = *(float32x4_t *)&a3[1].var0;
      v53 = vsubq_f32(*(float32x4_t *)&a3[1].var1.y, v52);
      v54 = vmulq_f32(v53, v51);
      v55 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v54, 2), vaddq_f32(v54, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v54.f32, 1)));
      if (v55.f32[0] != 0.0)
      {
        v56 = vmulq_f32(vsubq_f32(v50, v52), v51);
        v52 = vmlaq_n_f32(v52, v53, vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v56, 2), vaddq_f32(v56, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v56.f32, 1))), v55).f32[0]);
      }
      *(float32x4_t *)&self->_anon_130[48] = vsubq_f32(v50, v52);
      break;
    case 3u:
      v57 = self->_selectedAxis;
      v58 = 0.0;
      if (v57 == 1)
        v59 = 1.0;
      else
        v59 = 0.0;
      if (v57 == 2)
        v60 = 1.0;
      else
        v60 = 0.0;
      if (v57 == 3)
        v58 = 1.0;
      v61 = vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v26, v58), v25, v60), v24, v59);
      v62 = (int32x4_t)vmulq_f32(v61, v61);
      v62.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v62, 2), vadd_f32(*(float32x2_t *)v62.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v62.i8, 1))).u32[0];
      v63 = vrsqrte_f32((float32x2_t)v62.u32[0]);
      v64 = vmul_f32(v63, vrsqrts_f32((float32x2_t)v62.u32[0], vmul_f32(v63, v63)));
      v65 = vmulq_f32(vsubq_f32(*(float32x4_t *)&a3[1].var1.y, *(float32x4_t *)&a3[1].var0), vmulq_n_f32(v61, vmul_f32(v64, vrsqrts_f32((float32x2_t)v62.u32[0], vmul_f32(v64, v64))).f32[0]));
      v66 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v65, 2), vaddq_f32(v65, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v65.f32, 1))).f32[0] <= 0.0;
      v67 = -1.0;
      if (v66)
        v67 = 1.0;
      *(float *)self->_anon_130 = v67;
      break;
    case 4u:
      return v14;
    default:
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unknown manipulator action"), v18, v19, v20, v21, v22, v23, v68);
      return 0;
  }
  return v14;
}

- (BOOL)mouseUp:(id *)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  const char *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  const char *v29;
  uint64_t v30;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  VFXAuthoringEnvironment *authoringEnvironment;
  uint64_t v38;
  const char *v39;
  _OWORD v40[6];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;

  if ((objc_msgSend_readonly(self, a2, (uint64_t)a3, v3) & 1) != 0)
    return 0;
  objc_msgSend_clearSnapIndexes(self, v6, v7, v8);
  v9 = self->_action != 0;
  if (self->_action)
  {
    v12 = *(_OWORD *)&a3[1].var0;
    v43 = *(_OWORD *)&a3->var2.y;
    v44 = v12;
    v13 = *(_OWORD *)&a3[1].var2.y;
    v45 = *(_OWORD *)&a3[1].var1.y;
    v46 = v13;
    v14 = *(_OWORD *)&a3->var1.y;
    v41 = *(_OWORD *)&a3->var0;
    v42 = v14;
    objc_msgSend__updateCloneStateWithEvent_(self, v10, (uint64_t)&v41, v11);
    v15 = *(_OWORD *)&a3[1].var0;
    v43 = *(_OWORD *)&a3->var2.y;
    v44 = v15;
    v16 = *(_OWORD *)&a3[1].var2.y;
    v45 = *(_OWORD *)&a3[1].var1.y;
    v46 = v16;
    v17 = *(_OWORD *)&a3->var1.y;
    v41 = *(_OWORD *)&a3->var0;
    v42 = v17;
    objc_msgSend__applyWithEvent_(self, v18, (uint64_t)&v41, v19);
    if (self->_cloning)
    {
      objc_msgSend_validateClones(self, v20, v21, v22);
    }
    else
    {
      v32 = objc_msgSend_delegate(self->_authoringEnvironment, v20, v21, v22);
      if (v32)
      {
        v33 = (void *)v32;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          authoringEnvironment = self->_authoringEnvironment;
          v38 = objc_msgSend_array(self->_targets, v34, v35, v36);
          objc_msgSend_authoringEnvironment_didMoveItems_fromTransform_(v33, v39, (uint64_t)authoringEnvironment, v38, *(_QWORD *)&self->_anon_188[16]);
        }
      }
    }
  }

  self->_cloneSet = 0;
  self->_cloning = 0;
  self->_action = 0;
  *(_OWORD *)self->_anon_130 = 0u;
  *(_OWORD *)&self->_anon_130[16] = 0u;
  *(_OWORD *)&self->_anon_130[32] = 0u;
  *(_OWORD *)&self->_anon_130[48] = 0u;
  self->_isMouseDown = 0;
  objc_msgSend_clearRuntimeItems(self, v23, v24, v25);
  v26 = *(_OWORD *)&a3[1].var0;
  v40[2] = *(_OWORD *)&a3->var2.y;
  v40[3] = v26;
  v27 = *(_OWORD *)&a3[1].var2.y;
  v40[4] = *(_OWORD *)&a3[1].var1.y;
  v40[5] = v27;
  v28 = *(_OWORD *)&a3->var1.y;
  v40[0] = *(_OWORD *)&a3->var0;
  v40[1] = v28;
  objc_msgSend_mouseMoved_(self, v29, (uint64_t)v40, v30);
  return v9;
}

- (id)world
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = (void *)objc_msgSend_authoringEnvironment(self, a2, v2, v3);
  v8 = (void *)objc_msgSend_worldRenderer(v4, v5, v6, v7);
  return (id)objc_msgSend_world(v8, v9, v10, v11);
}

- (void)removeClonesFromWorld
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  objc_msgSend_firstObject(self->_cloneSet, a2, v2, v3);
  v5 = (void *)objc_opt_class();
  v9 = objc_msgSend_array(self->_cloneSet, v6, v7, v8);
  objc_msgSend_removeItemsFromWorld_(v5, v10, v9, v11);
}

- (void)addClonesToWorld
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;

  v5 = objc_msgSend_world(self, a2, v2, v3);
  objc_msgSend_firstObject(self->_cloneSet, v6, v7, v8);
  v9 = (void *)objc_opt_class();
  v13 = objc_msgSend_array(self->_cloneSet, v10, v11, v12);
  objc_msgSend_addItems_toWorld_(v9, v14, v13, v5);
}

- (void)validateClones
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  NSOrderedSet *cloneSet;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  VFXAuthoringEnvironment *authoringEnvironment;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend_delegate(self->_authoringEnvironment, a2, v2, v3);
  if (v5)
  {
    v6 = (void *)v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = (void *)objc_msgSend_authoringEnvironment(self, v7, v8, v9);
      objc_sync_enter(v10);
      objc_msgSend_firstObject(self->_cloneSet, v11, v12, v13);
      v14 = (void *)objc_opt_class();
      v18 = objc_msgSend_array(self->_cloneSet, v15, v16, v17);
      objc_msgSend_removeItemsFromWorld_(v14, v19, v18, v20);
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      cloneSet = self->_cloneSet;
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(cloneSet, v22, (uint64_t)&v35, (uint64_t)v39, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v36 != v27)
              objc_enumerationMutation(cloneSet);
            objc_msgSend_validateClone(*(void **)(*((_QWORD *)&v35 + 1) + 8 * i), v23, v24, v25);
          }
          v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(cloneSet, v23, (uint64_t)&v35, (uint64_t)v39, 16);
        }
        while (v26);
      }
      objc_sync_exit(v10);
      authoringEnvironment = self->_authoringEnvironment;
      v33 = objc_msgSend_array(self->_cloneSet, v30, v31, v32);
      objc_msgSend_authoringEnvironment_didCloneSelection_(v6, v34, (uint64_t)authoringEnvironment, v33);
    }
  }
}

- (id)setupClones
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSOrderedSet *targets;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_orderedSet(MEMORY[0x1E0C99E10], a2, v2, v3);
  v9 = objc_msgSend_world(self, v6, v7, v8);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  targets = self->_targets;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(targets, v11, (uint64_t)&v28, (uint64_t)v33, 16);
  if (v12)
  {
    v16 = v12;
    v17 = *(_QWORD *)v29;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(targets);
        v19 = objc_msgSend_cloneForManipulators(*(void **)(*((_QWORD *)&v28 + 1) + 8 * v18), v13, v14, v15);
        if (v19)
        {
          v20 = v19;
          v21 = (void *)objc_opt_class();
          v32 = v20;
          v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v22, (uint64_t)&v32, 1);
          objc_msgSend_addItems_toWorld_(v21, v24, v23, v9);
          objc_msgSend_addObject_(v5, v25, v20, v26);
        }
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(targets, v13, (uint64_t)&v28, (uint64_t)v33, 16);
    }
    while (v16);
  }
  return v5;
}

- (id)snapGuideIndexesOnAxis:(unint64_t)a3
{
  uint64_t v3;

  v3 = 608;
  if (a3 == 2)
    v3 = 600;
  if (a3 == 1)
    v3 = 592;
  return *(Class *)((char *)&self->super.isa + v3);
}

- (const)snapInfoAtIndex:(unint64_t)a3 axis:(unint64_t)a4
{
  uint64_t v4;

  v4 = 584;
  if (a4 == 2)
    v4 = 576;
  if (a4 == 1)
    v4 = 568;
  return (const $650CE108227E718D0103F828694BDA85 *)(*(char **)((char *)&self->super.isa + v4) + 24 * a3);
}

- (void)_prepareSnapToAlignData:(VFXManipulator *)self minOffset:(SEL)a2 maxOffset:(unsigned __int16)a3
{
  __int128 v3;
  __int128 v4;
  int v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  const char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  float32x4_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  uint64_t v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  uint64_t v57;
  float v58;
  int v59;
  int v60;
  uint64_t v61;
  float32x4_t v62;
  __int128 v63;
  __int128 v64;
  float32x4_t v65;
  float32x4_t v66;
  int32x4_t v67;

  v63 = v3;
  v64 = v4;
  if ((a3 - 1) >= 3)
  {
    NSLog(CFSTR("_prepareSnapToAlignDataForAxis - unexpected axis"), a2);
  }
  else
  {
    v5 = a3;
    v7 = 8 * (unsigned __int16)(a3 - 1) + 568;
    free(*(void **)((char *)&self->super.isa + v7));
    *(Class *)((char *)&self->super.isa + v7) = 0;
    if (objc_msgSend_count(self->_targets, v8, v9, v10))
    {
      v14 = (void *)objc_msgSend_world(self, v11, v12, v13);
      v18 = (void *)objc_msgSend_rootNode(v14, v15, v16, v17);
      v21 = (void *)objc_msgSend_childNodesPassingTest_(v18, v19, (uint64_t)&unk_1E63DA3F0, v20);
      v25 = objc_msgSend_count(v21, v22, v23, v24);
      v26 = v25;
      if (v25)
      {
        v27 = 0;
        v28 = 0;
        *(Class *)((char *)&self->super.isa + v7) = (Class)malloc_type_calloc(0x18uLL, 7 * v25, 0x5401205FuLL);
        v62 = (float32x4_t)xmmword_1B2244E20;
        while (1)
        {
          v31 = (char *)objc_msgSend_objectAtIndex_(v21, v29, v27, v30, *(_OWORD *)&v62);
          if ((sub_1B19A46C4(self->_targets, v31) & 1) == 0)
            break;
LABEL_17:
          if (v26 == ++v27)
          {
            self->_snapToAlignCount = v28;
            qsort(*(void **)((char *)&self->super.isa + v7), v28, 0x18uLL, (int (__cdecl *)(const void *, const void *))sub_1B19A4200);
            return;
          }
        }
        v33 = objc_msgSend_nodeRef(v31, v29, v32, v30);
        objc_msgSend_worldTransform(v31, v34, v35, v36);
        v67 = 0u;
        v65 = v37;
        v66 = 0u;
        if ((sub_1B1869150(v33, &v66) & 1) != 0)
        {
          v43 = sub_1B1869AC8(v33, (uint64_t)v29, v38, v30, v39, v40, v41, v42);
          v44 = *(float32x4_t *)(v43 + 16);
          v45 = *(float32x4_t *)(v43 + 32);
          v46 = vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32(*(float32x4_t *)(v43 + 48), v45, v66, 2), v44, *(float32x2_t *)v66.f32, 1), *(float32x4_t *)v43, v66.f32[0]);
          v46.i32[3] = v66.i32[3];
          v47 = (float32x4_t)v67;
          v47.i32[1] = v67.i32[0];
          v47.i32[2] = v67.i32[0];
          v48 = vmlaq_f32(vmlaq_f32(vmulq_f32((float32x4_t)vuzp2q_s32(vdupq_lane_s32(*(int32x2_t *)v67.i8, 1), v67), vabsq_f32(v44)), v47, vabsq_f32(*(float32x4_t *)v43)), (float32x4_t)vzip2q_s32(vtrn1q_s32(v67, v67), v67), vabsq_f32(v45));
        }
        else
        {
          v49 = v65;
          v49.i32[3] = 1.0;
          v50.i64[0] = 0x3F0000003F000000;
          v50.i64[1] = 0x3F0000003F000000;
          v46 = vmulq_f32(vaddq_f32(v49, v62), v50);
          v48 = vmulq_f32(vsubq_f32(v62, v49), v50);
        }
        v66 = v46;
        v67 = (int32x4_t)v48;
        v51 = 3 * v28;
        (*(_QWORD **)((char *)&self->super.isa + v7))[v51 + 1] = v33;
        v52 = v28 + 1;
        (*(_QWORD **)((char *)&self->super.isa + v7))[3 * v28 + 4] = v33;
        v53 = v28 + 2;
        (*(_QWORD **)((char *)&self->super.isa + v7))[3 * v28 + 7] = v33;
        v54 = v28 + 3;
        (*(_QWORD **)((char *)&self->super.isa + v7))[3 * v28 + 10] = v33;
        v55 = v28 + 4;
        (*(_QWORD **)((char *)&self->super.isa + v7))[3 * v28 + 13] = v33;
        v56 = v28 + 5;
        (*(_QWORD **)((char *)&self->super.isa + v7))[3 * v28 + 16] = v33;
        (*(_QWORD **)((char *)&self->super.isa + v7))[3 * v28 + 19] = v33;
        v57 = *(uint64_t *)((char *)&self->super.isa + v7);
        *(_DWORD *)(v57 + 8 * v51 + 16) = 0;
        switch(v5)
        {
          case 3:
            *(_DWORD *)(v57 + 24 * v28) = v65.i32[2];
            *(float *)(v57 + 24 * v52) = *((float *)&v63 + 2) + (float)(v66.f32[2] + *(float *)&v67.i32[2]);
            *(float *)(v57 + 24 * v53) = *((float *)&v64 + 2) + (float)(v66.f32[2] + *(float *)&v67.i32[2]);
            *(float *)(v57 + 24 * v54) = *((float *)&v63 + 2) + (float)(v66.f32[2] - *(float *)&v67.i32[2]);
            *(float *)(v57 + 24 * v55) = *((float *)&v64 + 2) + (float)(v66.f32[2] - *(float *)&v67.i32[2]);
            *(float *)(v57 + 24 * v56) = *((float *)&v63 + 2) + v66.f32[2];
            v58 = *((float *)&v64 + 2) + v66.f32[2];
            v59 = DWORD2(v63);
            v60 = DWORD2(v64);
            break;
          case 2:
            *(_DWORD *)(v57 + 24 * v28) = v65.i32[1];
            *(float *)(v57 + 24 * v52) = *((float *)&v63 + 1) + (float)(v66.f32[1] + *(float *)&v67.i32[1]);
            *(float *)(v57 + 24 * v53) = *((float *)&v64 + 1) + (float)(v66.f32[1] + *(float *)&v67.i32[1]);
            *(float *)(v57 + 24 * v54) = *((float *)&v63 + 1) + (float)(v66.f32[1] - *(float *)&v67.i32[1]);
            *(float *)(v57 + 24 * v55) = *((float *)&v64 + 1) + (float)(v66.f32[1] - *(float *)&v67.i32[1]);
            *(float *)(v57 + 24 * v56) = *((float *)&v63 + 1) + v66.f32[1];
            v58 = *((float *)&v64 + 1) + v66.f32[1];
            v59 = DWORD1(v63);
            v60 = DWORD1(v64);
            break;
          case 1:
            *(_DWORD *)(v57 + 24 * v28) = v65.i32[0];
            *(float *)(v57 + 24 * v52) = (float)(v66.f32[0] + *(float *)v67.i32) + *(float *)&v63;
            *(float *)(v57 + 24 * v53) = (float)(v66.f32[0] + *(float *)v67.i32) + *(float *)&v64;
            *(float *)(v57 + 24 * v54) = (float)(v66.f32[0] - *(float *)v67.i32) + *(float *)&v63;
            *(float *)(v57 + 24 * v55) = (float)(v66.f32[0] - *(float *)v67.i32) + *(float *)&v64;
            *(float *)(v57 + 24 * v56) = v66.f32[0] + *(float *)&v63;
            v58 = v66.f32[0] + *(float *)&v64;
            v59 = v63;
            v60 = v64;
            break;
          default:
LABEL_16:
            v28 += 7;
            goto LABEL_17;
        }
        v61 = v57 + 24 * (v28 + 6);
        *(float *)v61 = v58;
        *(_DWORD *)(v57 + 24 * v52 + 16) = v59;
        *(_DWORD *)(v57 + 24 * v53 + 16) = v60;
        *(_DWORD *)(v57 + 24 * v54 + 16) = v59;
        *(_DWORD *)(v57 + 24 * v55 + 16) = v60;
        *(_DWORD *)(v57 + 24 * v56 + 16) = v59;
        *(_DWORD *)(v61 + 16) = v60;
        goto LABEL_16;
      }
    }
  }
}

- (void)prepareSnapToAlignData
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  __int128 v15;
  uint64_t i;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  __int128 v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  float32x2_t v30;
  float v31;
  float v32;
  float v33;
  float v34;
  int8x8_t v35;
  float32x2_t v36;
  int32x4_t v37;
  float32x2_t v38;
  __int128 v39;
  float v40;
  unsigned int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  float32x2_t v64;
  unsigned int v65;
  double v66;
  __int128 v67;
  unsigned int v68;
  float32x2_t v69;
  double v70;
  int32x4_t v71;
  double v72;
  int v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v64 = 0;
  v5 = (void *)objc_msgSend_targets(self, a2, v2, v3);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v75, (uint64_t)v79, 16);
  v11 = 0.0;
  if (v7)
  {
    v12 = v7;
    v13 = 0;
    v14 = *(_QWORD *)v76;
    *(_QWORD *)&v15 = 0x80000000800000;
    *((_QWORD *)&v15 + 1) = 0x80000000800000;
    v67 = v15;
    v71 = vdupq_n_s32(0x7F7FFFFFu);
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v76 != v14)
          objc_enumerationMutation(v5);
        v17 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
        if (objc_msgSend_node(v17, v8, v9, v10))
        {
          DWORD2(v74) = 0;
          *(_QWORD *)&v74 = 0;
          v73 = 0;
          v72 = 0.0;
          v18 = (void *)objc_msgSend_node(v17, v8, v9, v10);
          if (objc_msgSend_getBoundingBoxMin_max_(v18, v19, (uint64_t)&v74, (uint64_t)&v72))
          {
            v20 = (void *)objc_msgSend_node(v17, v8, v9, v10);
            objc_msgSend_convertPosition_toNode_(v20, v21, 0, v22, *(double *)&v74);
            v74 = v23;
            v27 = (void *)objc_msgSend_node(v17, v24, v25, v26);
            objc_msgSend_convertPosition_toNode_(v27, v28, 0, v29, v72);
            v32 = *(float *)&v71.i32[2];
            v33 = *((float *)&v74 + 2);
            if (*((float *)&v74 + 2) >= v31)
              v34 = v31;
            else
              v34 = *((float *)&v74 + 2);
            if (*((float *)&v74 + 2) < v31)
              v33 = v31;
            if (*(float *)&v71.i32[2] >= v34)
              v32 = v34;
            v35 = (int8x8_t)vcgt_f32(v30, *(float32x2_t *)&v74);
            v36 = (float32x2_t)vbsl_s8(v35, *(int8x8_t *)&v74, (int8x8_t)v30);
            *(int8x8_t *)v37.i8 = vbsl_s8((int8x8_t)vcgt_f32(v36, *(float32x2_t *)v71.i8), *(int8x8_t *)v71.i8, (int8x8_t)v36);
            v37.i64[1] = __PAIR64__(v71.u32[3], LODWORD(v32));
            v38 = (float32x2_t)vbsl_s8(v35, (int8x8_t)v30, *(int8x8_t *)&v74);
            *(int8x8_t *)&v39 = vbsl_s8((int8x8_t)vcgt_f32(v38, *(float32x2_t *)&v67), (int8x8_t)v38, *(int8x8_t *)&v67);
            v40 = *((float *)&v67 + 2);
            if (*((float *)&v67 + 2) < v33)
              v40 = v33;
            *((_QWORD *)&v39 + 1) = __PAIR64__(HIDWORD(v67), LODWORD(v40));
            v13 = 1;
            v67 = v39;
            v71 = v37;
          }
        }
      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v75, (uint64_t)v79, 16);
    }
    while (v12);
    v11 = 0.0;
    v64 = 0;
    if ((v13 & 1) != 0)
    {
      objc_msgSend_transform(self, v8, v9, v10);
      v65 = v41;
      objc_msgSend_transform(self, v42, v43, v44);
      v64 = vsub_f32(*(float32x2_t *)&v67, (float32x2_t)__PAIR64__(v45, v65));
      objc_msgSend_transform(self, v46, v47, v48);
      objc_msgSend_transform(self, v49, v50, v51);
      v68 = v52;
      objc_msgSend_transform(self, v53, v54, v55);
      v69 = vsub_f32(*(float32x2_t *)v71.i8, (float32x2_t)__PAIR64__(v56, v68));
      objc_msgSend_transform(self, v57, v58, v59);
      v11 = *(double *)&v69;
    }
  }
  v70 = v11;
  objc_msgSend__prepareSnapToAlignData_minOffset_maxOffset_(self, v8, 1, v10, *(_QWORD *)&v64);
  objc_msgSend__prepareSnapToAlignData_minOffset_maxOffset_(self, v60, 2, v61, v70, v66);
  objc_msgSend__prepareSnapToAlignData_minOffset_maxOffset_(self, v62, 3, v63, v70, v66);
}

- (void)prepareSnapToAlignDataIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  if (!self->_snapToAlignCount)
  {
    v5 = (void *)objc_msgSend_world(self, a2, v2, v3);
    v9 = objc_msgSend_worldRef(v5, v6, v7, v8);
    if (v9)
    {
      v17 = v9;
      sub_1B187973C(v9, (uint64_t)v10, v11, v12, v13, v14, v15, v16);
      objc_msgSend_prepareSnapToAlignData(self, v18, v19, v20);
      sub_1B18797B4(v17, v21, v22, v23, v24, v25, v26, v27);
    }
    else
    {
      objc_msgSend_prepareSnapToAlignData(self, v10, v11, v12);
    }
  }
}

- (void)_snapPositionToAlign:(uint64_t)a3 original:(_BYTE *)a4 unit:(uint64_t *)a5 axisMove:(float32x4_t)a6 rayStart:(float32x4_t)a7 rayDir:(float)a8 didSnap:(__n128)a9 snapIndexes:(__n128)a10
{
  int v12;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __n128 v19;
  _BOOL8 v20;
  float32x4_t v21;
  float32x4_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float32x4_t v28;
  float32x4_t v30;
  float32x4_t v31;
  __int32 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;

  v12 = a3;
  v37 = a9;
  v36 = a10;
  objc_msgSend_prepareSnapToAlignDataIfNeeded(a1, a2, a3, (uint64_t)a4);
  *a4 = 0;
  if (a1[70] && a1[71])
  {
    v34 = 0u;
    v35 = 0u;
    v33 = 0;
    sub_1B1824088(&v34, &v37, &v36);
    v19 = (__n128)a6;
    v20 = 0;
    v21 = vsubq_f32(a6, a7);
    v22 = a6;
    v28 = v21;
    if (fabsf(v21.f32[0]) > 0.00001)
    {
      v23 = sub_1B19A4B74(a1[71], a1[70], &v33, a6.f32[0], a8);
      *a5 = v23;
      if (v23 == -1)
      {
        v20 = 0;
        v19 = (__n128)a6;
        v22 = a6;
      }
      else
      {
        v22.i32[0] = v33;
        v19 = (__n128)a6;
        *(uint64_t *)((char *)v22.i64 + 4) = *(uint64_t *)((char *)a6.i64 + 4);
        v20 = 1;
      }
      v21 = v28;
    }
    if (fabsf(v21.f32[1]) <= 0.00001)
    {
      v25 = 0;
    }
    else
    {
      v30 = v22;
      v24 = sub_1B19A4B74(a1[72], a1[70], &v33, v19.n128_f32[1], a8);
      a5[1] = v24;
      if (v24 == -1)
      {
        v25 = 0;
        v22 = v30;
      }
      else
      {
        v22.i64[0] = __PAIR64__(v33, v30.u32[0]);
        v22.i64[1] = v30.i64[1];
        v25 = 1;
      }
      v19 = (__n128)a6;
      v21.i32[2] = v28.i32[2];
    }
    if (fabsf(v21.f32[2]) <= 0.00001)
    {
      v27 = 0;
    }
    else
    {
      v31 = v22;
      v26 = sub_1B19A4B74(a1[73], a1[70], &v33, v19.n128_f32[2], a8);
      a5[2] = v26;
      if (v26 == -1)
      {
        v27 = 0;
        v22 = v31;
      }
      else
      {
        v22.i64[0] = v31.i64[0];
        v22.i64[1] = __PAIR64__(v31.u32[3], v33);
        v27 = 1;
      }
      v19 = (__n128)a6;
    }
    *a4 = v20 | v25 | v27;
    if (v20 | v25 | v27)
    {
      if (v12)
        sub_1B19A4E20(v20, v25, v27, a5, v15, v16, v17, v18, v22, v19, v34, v35);
    }
  }
}

- (BOOL)readonly
{
  return self->_readonly;
}

- (int64_t)xAlignment
{
  return self->_xAlignment;
}

- (void)setXAlignment:(int64_t)a3
{
  self->_xAlignment = a3;
}

- (int64_t)yAlignment
{
  return self->_yAlignment;
}

- (void)setYAlignment:(int64_t)a3
{
  self->_yAlignment = a3;
}

- (int64_t)zAlignment
{
  return self->_zAlignment;
}

- (void)setZAlignment:(int64_t)a3
{
  self->_zAlignment = a3;
}

@end
