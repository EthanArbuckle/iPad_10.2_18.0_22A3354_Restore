@implementation VFXMTLMorphDeformer

+ (unint64_t)requiredInputs
{
  return 1;
}

+ (unint64_t)supportedOutputs
{
  return 3;
}

+ (unint64_t)requiredOutputs
{
  return 1;
}

- (void)dealloc
{
  __CFXMorpher *morpher;
  objc_super v4;

  morpher = self->_morpher;
  if (morpher)
  {
    CFRelease(morpher);
    self->_morpher = 0;
  }

  free(self->_morphTargets);
  v4.receiver = self;
  v4.super_class = (Class)VFXMTLMorphDeformer;
  -[VFXMTLMorphDeformer dealloc](&v4, sel_dealloc);
}

- (void)setupMorphTargetsWithComputeContext:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int8 finalMeshDataKind;
  signed __int16 v41;
  unint64_t v42;
  BOOL v43;
  signed __int16 v44;
  const __CFArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t Count;
  const void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  const void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t morphTargetCount;
  VFXMTLMorphDeformer *v83;
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
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  const char *v112;
  uint64_t v113;
  unsigned int v114;
  uint64_t v115;
  unsigned int v116;
  unint64_t v117;
  uint64_t v118;
  char v119;
  uint64_t *v120;
  uint64_t Alignment;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const void *v140;
  uint64_t resourceManager;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
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
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  unint64_t morphKind;
  uint64_t v183;
  const char *v184;
  const char *v185;
  id v186;
  const char *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  char v198;
  const __CFString *v199;
  VFXMTLResourceManager *v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  id v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  const char *v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  void *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  const char *v240;
  uint64_t v241;
  const char *v242;
  uint64_t v243;
  const char *v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  void *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  const char *v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  void *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  const char *v296;
  uint64_t v297;
  const char *v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  void *v305;
  const char *v306;
  uint64_t v307;
  void *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  const char *v317;
  uint64_t v318;
  const char *v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  const char *v323;
  unsigned int v324;
  uint64_t v325;
  uint64_t v326;
  void *updated;
  const char *v328;
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
  uint64_t v339;
  const void *v340;
  _QWORD *v341;
  const __CFArray *v342;
  uint64_t v343;
  const void *v344;
  uint64_t v345;
  uint64_t v346;
  char *v347;
  char *v348;
  uint64_t size;
  void *v350;
  VFXMTLMorphDeformer *v351;
  char v352;
  unint64_t v353;
  const __CFString *v354;
  BOOL morphNormals;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  _QWORD v361[10];
  int v362;
  char v363;
  BOOL v364;
  int v365[3];

  v8 = a3;
  v10 = sub_1B1943990((uint64_t)self->_morpher, (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7);
  v24 = sub_1B17A0848(v10, v11, v12, v13, v14, v15, v16, v17);
  if (!v24)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v18, v19, v20, v21, v22, v23, (uint64_t)"baseMesh");
  v31 = sub_1B17A0A4C((uint64_t)self->_morpher);
  if (!v31)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v25, v26, v27, v28, v29, v30, (uint64_t)"morph");
  v32 = sub_1B1942070(v31) == 0;
  v352 = sub_1B1942C9C(v31, v33, v34, v35, v36, v37, v38, v39);
  if ((v352 & 1) != 0)
  {
    finalMeshDataKind = 0;
    v41 = 43;
    v42 = 1;
  }
  else
  {
    v42 = 0;
    finalMeshDataKind = self->_finalMeshDataKind;
    v41 = 8;
  }
  v350 = v8;
  v43 = !self->_morphNormals;
  self->_morphKind = v42;
  if (v43)
    v44 = 0;
  else
    v44 = 22;
  self->_dataKindForComputeKernel = finalMeshDataKind;
  self->_basePositionDataType = 8;
  self->_baseNormalDataType = v44;
  self->_morphTargetPositionDataType = v41;
  self->_morphTargetNormalDataType = v44;
  v45 = (const __CFArray *)sub_1B17A0A4C(v31);
  Count = CFArrayGetCount(v45);
  if (!Count)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Internal consistency error"), v46, v47, v48, v49, v50, v51, (uint64_t)"maxMorphTargetCount > 0");
  v53 = sub_1B1875540(v24, 0, 0, self->_finalMeshDataKind, v48, v49, v50, v51);
  v365[0] = 0;
  v54 = sub_1B18760B0(v24, v365);
  v346 = sub_1B1816084(v24);
  v344 = sub_1B1875540(v24, 0, 0, self->_dataKindForComputeKernel, v55, v56, v57, v58);
  if (!v344)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v60, v61, v62, v63, v64, v65, (uint64_t)"basePositionSource");
  v351 = self;
  v343 = v31;
  v66 = v32;
  if (self->_morphNormals)
  {
    v67 = sub_1B1875540(v24, 1, 0, self->_dataKindForComputeKernel, v62, v63, v64, v65);
    if (!v67)
    {
      v67 = (const void *)sub_1B17B13D4(v24, self->_dataKindForComputeKernel, 0, v61, v62, v63, v64, v65);
      if (!v67)
        sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v68, v69, v70, v71, v72, v73, (uint64_t)"baseNormalSource");
      CFAutorelease(v67);
    }
  }
  else
  {
    v67 = 0;
  }
  self->_vertexCountForComputeKernel = sub_1B17EDAE0((uint64_t)v344, v59, v60, v61, v62, v63, v64, v65);
  self->_finalMeshVertexCount = sub_1B17EDAE0((uint64_t)v53, v74, v75, v76, v77, v78, v79, v80);
  v81 = malloc_type_malloc(40 * Count, 0x10600401818AB88uLL);
  v361[0] = MEMORY[0x1E0C809B0];
  v361[1] = 3221225472;
  v361[2] = sub_1B194CD0C;
  v361[3] = &unk_1E63D9A70;
  v361[4] = self;
  v361[5] = v24;
  v363 = v352;
  v361[6] = v344;
  v361[7] = v67;
  v362 = v365[0];
  v364 = v66;
  v361[8] = v54;
  v361[9] = v81;
  sub_1B17A0470(v45, (uint64_t)v361);
  morphTargetCount = self->_morphTargetCount;
  v83 = self;
  v342 = v45;
  if ((_DWORD)morphTargetCount)
  {
    self->_morphTargets = ($4C9AEC9213DCD68D17C013290EF3C758 *)malloc_type_malloc(32 * morphTargetCount, 0x100004017768742uLL);
    v91 = sub_1B179E250(self->_morphTargetPositionDataType, v84, v85, v86, v87, v88, v89, v90);
    v99 = sub_1B179E250(self->_morphTargetNormalDataType, v92, v93, v94, v95, v96, v97, v98);
    v100 = (void *)sub_1B18FD774((uint64_t)self->_resourceManager);
    v340 = v67;
    if (sub_1B189EAD8(v100, v101, v102, v103))
      v111 = (v99 + ((v91 + 3) & 0xFFFFFFFFFFFFFFFCLL) + 3) & 0xFFFFFFFFFFFFFFFCLL;
    else
      v111 = v99 + v91;
    v353 = v111;
    v114 = self->_vertexCountForComputeKernel - 1;
    v115 = 1;
    if (v114 > 0xFF)
      v115 = 2;
    v116 = HIWORD(v114);
    if (HIWORD(v114))
      v115 = 4;
    v345 = v115;
    sub_1B189D608(self->_morphTargetPositionDataType, v104, v105, v106, v107, v108, v109, v110);
    v341 = v81;
    if (self->_morphTargetCount)
    {
      v117 = 0;
      size = 0;
      v118 = 0;
      if (v116)
        v119 = 2;
      else
        v119 = v114 > 0xFF;
      v120 = v81 + 4;
      do
      {
        Alignment = MTLDataTypeGetAlignment();
        v122 = *v120;
        if (*v120 != v83->_vertexCountForComputeKernel)
        {
          v123 = MTLDataTypeGetAlignment();
          size = ((size + v123 - 1) & -v123) + (*v120 << v119);
        }
        v118 = ((v118 + Alignment - 1) & -Alignment) + v122 * v353;
        ++v117;
        v120 += 5;
      }
      while (v117 < v83->_morphTargetCount);
      v347 = (char *)malloc_type_malloc(v118, 0xE5A8494uLL);
      v124 = (char *)size;
      if (size)
        v124 = (char *)malloc_type_malloc(size, 0x8F4755B6uLL);
      else
        size = 0;
      v81 = v341;
    }
    else
    {
      v347 = (char *)malloc_type_malloc(0, 0xE5A8494uLL);
      size = 0;
      v118 = 0;
      v124 = 0;
    }
    v348 = v124;
    if (v83->_morphTargetCount)
    {
      v125 = (uint64_t)v81;
      v126 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      if (v116)
        v130 = 2;
      else
        v130 = v114 > 0xFF;
      v131 = v125;
      do
      {
        v132 = (uint64_t)&v83->_morphTargets[v126];
        *(_DWORD *)(v132 + 4) = *(_DWORD *)v131;
        v133 = MTLDataTypeGetAlignment();
        v134 = (v129 + v133 - 1) & -v133;
        v135 = MTLDataTypeGetAlignment();
        v136 = (v128 + v135 - 1) & -v135;
        objc_msgSend_createVertexBufferForMorphTarget_withSetupTarget_vertexBuffer_vertexBufferOffset_indicesBuffer_indicesBufferOffset_indexSize_originalToFirstDeindexedTable_computeContext_(v83, v137, v132, v131, v347, v134, v348, v136, v345, v346, v350);
        v138 = *(_QWORD *)(v131 + 32);
        if (v138 == v83->_vertexCountForComputeKernel)
          v139 = 0;
        else
          v139 = v138 << v130;
        CFRelease(*(CFTypeRef *)(v131 + 16));
        v140 = *(const void **)(v131 + 24);
        if (v140)
        {
          CFRelease(v140);
          *(_QWORD *)(v131 + 24) = 0;
        }
        v129 = v134 + v138 * v353;
        v128 = v139 + v136;
        v131 += 40;
        ++v127;
        v83 = v351;
        ++v126;
      }
      while (v127 < v351->_morphTargetCount);
    }
    else
    {
      v129 = 0;
      v128 = 0;
    }
    free(v341);
    resourceManager = (uint64_t)v83->_resourceManager;
    v8 = v350;
    v145 = (void *)objc_msgSend_currentBlitEncoder(v350, v142, v143, v144);
    v83->_morphTargetsVertexBuffer = (MTLBuffer *)sub_1B18FBFCC(resourceManager, v347, v118, v145);
    free(v347);
    if (v348)
    {
      v152 = (uint64_t)v83->_resourceManager;
      v153 = (void *)objc_msgSend_currentBlitEncoder(v350, v112, v146, v147);
      v83->_morphTargetsSparseIndicesBuffer = (MTLBuffer *)sub_1B18FBFCC(v152, v348, size, v153);
      free(v348);
    }
    v43 = v129 == v118;
    v45 = v342;
    v67 = v340;
    if (!v43)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Vertex buffer has not been completely written to"), v146, v147, v148, v149, v150, v151, (uint64_t)"vertexBufferOffset == vertexBufferLength");
    v113 = v343;
    if (v128 != size)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Sparse indices buffer has not been completely written to"), v146, v147, v148, v149, v150, v151, (uint64_t)"sparseIndicesBufferOffset == sparseIndicesBufferLength");
  }
  else
  {
    free(v81);
    v113 = v343;
  }
  v359 = 0;
  v360 = 0;
  v358 = 0;
  LOBYTE(v337) = 1;
  v83->_baseBufferForComputeKernel = (MTLBuffer *)objc_msgSend_newBufferForDataKind_positionSource_normalSource_positionDataType_normalDataType_forStageInputOutputDescriptor_usePrivateStorageMode_outStride_outPositionOffset_outNormalOffset_(v8, v112, v83->_dataKindForComputeKernel, (uint64_t)v344, v67, v83->_basePositionDataType, v83->_baseNormalDataType, 1, v337, &v360, &v359, &v358);
  v161 = sub_1B179E250(v83->_morphTargetPositionDataType, v154, v155, v156, v157, v158, v159, v160);
  v169 = sub_1B179E250(v83->_morphTargetNormalDataType, v162, v163, v164, v165, v166, v167, v168);
  v170 = (void *)sub_1B18FD774((uint64_t)v83->_resourceManager);
  if (sub_1B189EAD8(v170, v171, v172, v173))
  {
    v161 = (v161 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    v181 = (v169 + v161 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  }
  else
  {
    v181 = v169 + v161;
  }
  morphKind = v351->_morphKind;
  if (!morphKind)
  {
    v200 = v351->_resourceManager;
    if (v351->_morphNormals)
    {
      v351->_incrementalInitPipeline = (VFXMTLComputePipeline *)(id)objc_msgSend_computePipelineStateForKernel_(v200, v174, (uint64_t)CFSTR("blend_inc_init_8x_pn_kernel"), v176);
      v203 = (void *)objc_msgSend_computePipelineStateForKernel_(v351->_resourceManager, v201, (uint64_t)CFSTR("blend_inc_add_8x_pn_kernel"), v202);
    }
    else
    {
      v351->_incrementalInitPipeline = (VFXMTLComputePipeline *)(id)objc_msgSend_computePipelineStateForKernel_(v200, v174, (uint64_t)CFSTR("blend_inc_init_8x_p_kernel"), v176);
      v203 = (void *)objc_msgSend_computePipelineStateForKernel_(v351->_resourceManager, v211, (uint64_t)CFSTR("blend_inc_add_8x_p_kernel"), v212);
    }
    v351->_incrementalAddPipeline = (VFXMTLComputePipeline *)v203;
    goto LABEL_113;
  }
  if (morphKind != 1)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unsupported morph kind"), v175, v176, v177, v178, v179, v180, v338);
    goto LABEL_113;
  }
  v356 = 0;
  v357 = 0;
  if (!v351->_dataKindForComputeKernel && v351->_finalMeshDataKind == 1 && v346)
  {
    v183 = objc_msgSend_currentBlitEncoder(v8, v174, v175, v176);
    v351->_originalToFirstDeindexedTableBuffer = (MTLBuffer *)(id)objc_msgSend_originalToFirstDeindexedTableBufferWithBlitEncoder_indexSizeOut_(v8, v184, v183, (uint64_t)&v357);
    v351->_deindexedToFirstDeindexedTableBuffer = (MTLBuffer *)(id)objc_msgSend_deindexedToFirstDeindexedTableBufferWithBlitEncoder_indexSizeOut_(v8, v185, v183, (uint64_t)&v356);
  }
  morphNormals = v351->_morphNormals;
  v186 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
  objc_msgSend_setConstantValue_type_withName_(v186, v187, (uint64_t)&morphNormals, 53, CFSTR("morphNormal"));
  v190 = 78;
  if (!v351->_morphNormals)
    v190 = 45;
  v197 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v188, (uint64_t)CFSTR("%c"), v189, v190);
  if (!v351->_originalToFirstDeindexedTableBuffer)
    goto LABEL_86;
  if (v357 == 1)
  {
    v198 = 0;
    v354 = CFSTR("blend_indexed_u8_generic");
    v199 = CFSTR("copy_indexed_u8_generic");
    goto LABEL_87;
  }
  if (v357 == 4)
  {
    v198 = 0;
    v354 = CFSTR("blend_indexed_u32_generic");
    v199 = CFSTR("copy_indexed_u32_generic");
    goto LABEL_87;
  }
  if (v357 != 2)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unsupported index size for compute kernel"), v191, v192, v193, v194, v195, v196, v339);
LABEL_86:
    v354 = 0;
    v198 = 1;
    v199 = CFSTR("copy_generic");
    goto LABEL_87;
  }
  v198 = 0;
  v354 = CFSTR("blend_indexed_u16_generic");
  v199 = CFSTR("copy_indexed_u16_generic");
LABEL_87:
  v213 = objc_alloc_init(MEMORY[0x1E0CC6B90]);
  v217 = (void *)objc_msgSend_layouts(v213, v214, v215, v216);
  v220 = (void *)objc_msgSend_objectAtIndexedSubscript_(v217, v218, 1, v219);
  objc_msgSend_setStepFunction_(v220, v221, 5, v222);
  objc_msgSend_setStride_(v220, v223, v360, v224);
  v228 = (void *)objc_msgSend_attributes(v213, v225, v226, v227);
  v231 = (void *)objc_msgSend_objectAtIndexedSubscript_(v228, v229, 0, v230);
  v239 = sub_1B189D65C(v351->_basePositionDataType, v232, v233, v234, v235, v236, v237, v238);
  objc_msgSend_setFormat_(v231, v240, v239, v241);
  objc_msgSend_setOffset_(v231, v242, v359, v243);
  objc_msgSend_setBufferIndex_(v231, v244, 1, v245);
  if (v351->_morphNormals)
  {
    v249 = (void *)objc_msgSend_attributes(v213, v246, v247, v248);
    v252 = (void *)objc_msgSend_objectAtIndexedSubscript_(v249, v250, 1, v251);
    v260 = sub_1B189D65C(v351->_baseNormalDataType, v253, v254, v255, v256, v257, v258, v259);
    objc_msgSend_setFormat_(v252, v261, v260, v262);
    objc_msgSend_setOffset_(v252, v263, v358, v264);
    objc_msgSend_setBufferIndex_(v252, v265, 1, v266);
  }
  v351->_copyBaseBufferPipeline = (VFXMTLComputePipeline *)(id)objc_msgSend_computePipelineStateForKernel_withStageDescriptor_stageDescriptorUpdateBlock_constants_constantsHash_(v351->_resourceManager, v246, (uint64_t)v199, (uint64_t)v213, 0, v186, v197);
  objc_msgSend_reset(v213, v267, v268, v269);
  v273 = (void *)objc_msgSend_layouts(v213, v270, v271, v272);
  v276 = (void *)objc_msgSend_objectAtIndexedSubscript_(v273, v274, 1, v275);
  objc_msgSend_setStepFunction_(v276, v277, 5, v278);
  objc_msgSend_setStride_(v276, v279, v181, v280);
  v284 = (void *)objc_msgSend_attributes(v213, v281, v282, v283);
  v287 = (void *)objc_msgSend_objectAtIndexedSubscript_(v284, v285, 0, v286);
  v295 = sub_1B189D65C(v351->_morphTargetPositionDataType, v288, v289, v290, v291, v292, v293, v294);
  objc_msgSend_setFormat_(v287, v296, v295, v297);
  objc_msgSend_setOffset_(v287, v298, 0, v299);
  objc_msgSend_setBufferIndex_(v287, v300, 1, v301);
  if (morphNormals)
  {
    v305 = (void *)objc_msgSend_attributes(v213, v302, v303, v304);
    v308 = (void *)objc_msgSend_objectAtIndexedSubscript_(v305, v306, 1, v307);
    v316 = sub_1B189D65C(v351->_morphTargetNormalDataType, v309, v310, v311, v312, v313, v314, v315);
    objc_msgSend_setFormat_(v308, v317, v316, v318);
    objc_msgSend_setOffset_(v308, v319, v161, v320);
    objc_msgSend_setBufferIndex_(v308, v321, 1, v322);
  }
  v351->_blendDensePipeline = (VFXMTLComputePipeline *)(id)objc_msgSend_computePipelineStateForKernel_withStageDescriptor_stageDescriptorUpdateBlock_constants_constantsHash_(v351->_resourceManager, v302, (uint64_t)CFSTR("blend_generic"), (uint64_t)v213, 0, v186, v197);
  if ((v198 & 1) == 0)
    v351->_blendDenseIndexedPipeline = (VFXMTLComputePipeline *)(id)objc_msgSend_computePipelineStateForKernel_withStageDescriptor_stageDescriptorUpdateBlock_constants_constantsHash_(v351->_resourceManager, v323, (uint64_t)v354, (uint64_t)v213, 0, v186, v197);
  v324 = v351->_vertexCountForComputeKernel - 1;
  v325 = 1;
  if (v324 > 0xFF)
    v325 = 2;
  v43 = HIWORD(v324) == 0;
  v326 = 4;
  if (v43)
    v326 = v325;
  if (v326 == 1)
  {
    updated = (void *)objc_msgSend_computePipelineStateForKernel_withStageDescriptor_stageDescriptorUpdateBlock_constants_constantsHash_(v351->_resourceManager, v323, (uint64_t)CFSTR("blend_indexed_u8_generic"), (uint64_t)v213, 0, v186, v197);
  }
  else if (v326 == 4)
  {
    updated = (void *)objc_msgSend_computePipelineStateForKernel_withStageDescriptor_stageDescriptorUpdateBlock_constants_constantsHash_(v351->_resourceManager, v323, (uint64_t)CFSTR("blend_indexed_u32_generic"), (uint64_t)v213, 0, v186, v197);
  }
  else
  {
    updated = (void *)objc_msgSend_computePipelineStateForKernel_withStageDescriptor_stageDescriptorUpdateBlock_constants_constantsHash_(v351->_resourceManager, v323, (uint64_t)CFSTR("blend_indexed_u16_generic"), (uint64_t)v213, 0, v186, v197);
  }
  v351->_blendSparsePipeline = (VFXMTLComputePipeline *)updated;

  v45 = v342;
  if (v351->_deindexedToFirstDeindexedTableBuffer)
  {
    switch(v356)
    {
      case 1:
        v335 = (void *)objc_msgSend_computePipelineStateForKernel_constants_constantsHash_(v351->_resourceManager, v328, (uint64_t)CFSTR("splat_indexed_s8_vertices"), (uint64_t)v186, v197);
        break;
      case 4:
        v335 = (void *)objc_msgSend_computePipelineStateForKernel_constants_constantsHash_(v351->_resourceManager, v328, (uint64_t)CFSTR("splat_indexed_s32_vertices"), (uint64_t)v186, v197);
        break;
      case 2:
        v335 = (void *)objc_msgSend_computePipelineStateForKernel_constants_constantsHash_(v351->_resourceManager, v328, (uint64_t)CFSTR("splat_indexed_s16_vertices"), (uint64_t)v186, v197);
        break;
      default:
        sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unsupported index size for compute kernel"), v329, v330, v331, v332, v333, v334, v339);
        v335 = (void *)objc_msgSend_computePipelineStateForKernel_constants_constantsHash_(v351->_resourceManager, v336, 0, (uint64_t)v186, v197);
        break;
    }
    v351->_splatPipeline = (VFXMTLComputePipeline *)v335;
  }

LABEL_113:
  if (sub_1B1942EF4(v113, v204, v205, v206, v207, v208, v209, v210))
    sub_1B17A0470(v45, (uint64_t)&unk_1E63D12F0);
}

- (void)createVertexBufferForMorphTarget:(id *)a3 withSetupTarget:(id *)a4 vertexBuffer:(char *)a5 vertexBufferOffset:(unint64_t)a6 indicesBuffer:(char *)a7 indicesBufferOffset:(unint64_t)a8 indexSize:(unint64_t)a9 originalToFirstDeindexedTable:(unsigned int *)a10 computeContext:(id)a11
{
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  __int16 v26;
  int morphTargetPositionDataType;
  float32x4_t v28;
  float v29;
  float v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  __int16 v58;
  uint64_t v59;
  unsigned int v60;
  int v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  int v65;
  char *v66;
  float32x4_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  float v74;
  float v75;
  float32x4_t v76;
  float32x4_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unsigned int v84;
  unsigned int v85;
  int v86;
  int v87;
  int v88;
  unsigned __int8 v89;
  uint64_t v90;
  int v91;
  float32x4_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  float32x4_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unsigned int v106;
  int v107;
  int v108;
  uint64_t v109;
  char *v110;
  unint64_t v111;
  $4C9AEC9213DCD68D17C013290EF3C758 *v112;
  unint64_t v113;
  float32x4_t v114;
  float32x4_t v115;
  unint64_t v116;
  uint64_t v117;
  float v118;
  uint64_t v119;

  v119 = sub_1B17ED6C4((uint64_t)a4->var2, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8);
  v25 = v18;
  if (self->_morphNormals)
  {
    v117 = sub_1B17ED6C4((uint64_t)a4->var3, (uint64_t)v18, v19, v20, v21, v22, v23, v24);
    v26 = WORD2(v18);
  }
  else
  {
    v26 = 0;
    v117 = 0;
  }
  a3->var2 = a4->var4;
  if (self->_morphKind == 1)
    objc_msgSend_createSparseIndicesBufferForMorphTarget_withSetupTarget_indicesBuffer_indicesBufferOffset_indexSize_originalToFirstDeindexedTable_computeContext_(self, v18, (uint64_t)a3, (uint64_t)a4, a7, a8, a9, a10, a11);
  else
    a3->var4 = 0;
  morphTargetPositionDataType = (unsigned __int16)self->_morphTargetPositionDataType;
  if (morphTargetPositionDataType == 22)
  {
    *(double *)v28.i64 = sub_1B17EDE5C((uint64_t)a4->var2, (uint64_t)v18, v19, v20, v21, v22, v23, v24);
    v29 = vmaxvq_f32(v28);
    LOWORD(morphTargetPositionDataType) = self->_morphTargetPositionDataType;
    v30 = 1.0 / v29;
  }
  else
  {
    v29 = 1.0;
    v30 = 1.0;
  }
  v118 = v30;
  a3->var0 = v29;
  v31 = sub_1B179E250((__int16)morphTargetPositionDataType, (uint64_t)v18, v19, v20, v21, v22, v23, v24);
  v39 = sub_1B179E250(self->_morphTargetNormalDataType, v32, v33, v34, v35, v36, v37, v38);
  v40 = (void *)sub_1B18FD774((uint64_t)self->_resourceManager);
  v44 = sub_1B189EAD8(v40, v41, v42, v43);
  v54 = (v31 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  v55 = (v39 + v54 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  if (!v44)
    v54 = v31;
  v116 = v54;
  if (v44)
    v56 = v55;
  else
    v56 = v39 + v31;
  v57 = &a5[a6];
  v112 = a3;
  v113 = a6;
  v110 = &a5[a6];
  v111 = v56 * a3->var2;
  if (self->_morphKind == 1)
  {
    if (self->_morphNormals)
    {
      if ((_DWORD)v25)
      {
        v58 = v26;
        v59 = 0;
        v60 = 0;
        v61 = BYTE4(v25);
        v62 = BYTE5(v25);
        v63 = v58;
        v64 = v25;
        v65 = HIBYTE(v58);
        v66 = v57;
        do
        {
          *(double *)v67.i64 = sub_1B198D4F8(v61, (const float *)(v119 + v59), v45, v46, v47, v48, v49, v50, v51, v52.f32[0], v53.f32[0]);
          v114 = v67;
          *(double *)v76.i64 = sub_1B198D4F8(v63, (const float *)(v117 + v60), v68, v69, v70, v71, v72, v73, v67, v74, v75);
          v53 = v76;
          v52.i64[0] = 0x3400000034000000;
          v52.i64[1] = 0x3400000034000000;
          if ((vminvq_u32((uint32x4_t)vcgeq_f32(v52, (float32x4_t)(*(_OWORD *)&v114 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL)))) & 0x80000000) == 0|| (v51 = (float32x4_t)vcgeq_f32(v52, vabsq_f32(v76)), v51.i32[0] = vminvq_u32((uint32x4_t)v51), (v51.i32[0] & 0x80000000) == 0))
          {
            v77 = vmulq_n_f32(v114, v118);
            v115 = v53;
            sub_1B198D91C(self->_morphTargetPositionDataType, (uint64_t)v66, v45, v46, v47, v48, v49, v50, v77);
            sub_1B198D91C(self->_morphTargetNormalDataType, (uint64_t)&v66[v116], v78, v79, v80, v81, v82, v83, v115);
            v66 += v56;
          }
          v60 += v65;
          v59 += v62;
          --v64;
        }
        while (v64);
        goto LABEL_37;
      }
LABEL_36:
      v66 = &a5[a6];
      goto LABEL_37;
    }
    if (!(_DWORD)v25)
      goto LABEL_36;
    v106 = 0;
    v107 = BYTE4(v25);
    v108 = BYTE5(v25);
    v109 = v25;
    v66 = v57;
    do
    {
      *(double *)v51.i64 = sub_1B198D4F8(v107, (const float *)(v119 + v106), v45, v46, v47, v48, v49, v50, v51, v52.f32[0], v53.f32[0]);
      v53.i64[0] = 0x3400000034000000;
      v53.i64[1] = 0x3400000034000000;
      v52.i32[0] = vminvq_u32((uint32x4_t)vcgeq_f32(v53, (float32x4_t)(*(_OWORD *)&v51 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))));
      if ((v52.i32[0] & 0x80000000) == 0)
      {
        sub_1B198D91C(self->_morphTargetPositionDataType, (uint64_t)v66, v45, v46, v47, v48, v49, v50, vmulq_n_f32(v51, v118));
        v66 += v56;
      }
      v106 += v108;
      --v109;
    }
    while (v109);
  }
  else
  {
    if (!(_DWORD)v25)
      goto LABEL_36;
    v84 = 0;
    v85 = 0;
    v86 = BYTE4(v25);
    v87 = BYTE5(v25);
    v88 = v26;
    v89 = HIBYTE(v26);
    v90 = v25;
    v91 = v89;
    v66 = v57;
    do
    {
      *(double *)v92.i64 = sub_1B198D4F8(v86, (const float *)(v119 + v84), v45, v46, v47, v48, v49, v50, v51, v52.f32[0], v53.f32[0]);
      sub_1B198D91C(self->_morphTargetPositionDataType, (uint64_t)v66, v93, v94, v95, v96, v97, v98, vmulq_n_f32(v92, v118));
      if (self->_morphNormals)
      {
        *(double *)v99.i64 = sub_1B198D4F8(v88, (const float *)(v117 + v85), v45, v46, v47, v48, v49, v50, v51, v52.f32[0], v53.f32[0]);
        sub_1B198D91C(self->_morphTargetNormalDataType, (uint64_t)&v66[v116], v100, v101, v102, v103, v104, v105, v99);
      }
      v66 += v56;
      v85 += v91;
      v84 += v87;
      --v90;
    }
    while (v90);
  }
LABEL_37:
  if (v66 != &v110[v111])
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Buffer has not been completely written to"), v45, v46, v47, v48, v49, v50, (uint64_t)"dstForWriting == dst + length");
  v112->var3 = v113;
}

- (void)createSparseIndicesBufferForMorphTarget:(id *)a3 withSetupTarget:(id *)a4 indicesBuffer:(char *)a5 indicesBufferOffset:(unint64_t)a6 indexSize:(unint64_t)a7 originalToFirstDeindexedTable:(unsigned int *)a8 computeContext:(id)a9
{
  __CFXMeshSource *var3;
  BOOL v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int16 v25;
  char *v26;
  char *v27;
  char *v28;
  __CFXMesh *var1;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float32x4_t v36;
  float32x4_t v37;
  unsigned __int128 v38;
  const void *v39;
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
  float32x4_t v52;
  float32x4_t v53;
  unsigned __int128 v54;
  uint64_t v55;
  int v56;
  int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int *v60;
  unsigned int v61;
  float32x4_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  float v69;
  float v70;
  unsigned int v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  unsigned int v75;
  uint64_t v76;
  int v77;
  int v78;
  float32x4_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  float v86;
  float v87;
  unsigned int v88;
  uint64_t v89;
  int v90;
  int v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int *v94;
  unsigned int v95;
  float32x4_t v96;
  unsigned int v97;
  $4C9AEC9213DCD68D17C013290EF3C758 *v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  float32x4_t v104;
  unsigned int v105;
  unint64_t v106;
  $4C9AEC9213DCD68D17C013290EF3C758 *v107;
  uint64_t v109;
  unsigned int *v110;
  char *v111;
  uint64_t v112;
  int v113;
  uint64_t v114;
  float32x4_t v115;
  float32x4_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;

  if (a3->var2 == self->_vertexCountForComputeKernel)
  {
    a3->var3 = 0;
    a3->var4 = 0;
    return;
  }
  var3 = a4->var3;
  if (self->_dataKindForComputeKernel)
  {
    v113 = 0;
  }
  else
  {
    if (a8)
      v15 = self->_finalMeshDataKind == 1;
    else
      v15 = 0;
    v16 = v15;
    v113 = v16;
  }
  v114 = sub_1B17ED6C4((uint64_t)a4->var2, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, (uint64_t)a8);
  v24 = v17;
  v107 = a3;
  if (var3)
  {
    v112 = sub_1B17ED6C4((uint64_t)a4->var3, v17, v18, v19, v20, v21, v22, v23);
    v25 = WORD2(v17);
  }
  else
  {
    v25 = 0;
    v112 = 0;
  }
  v26 = &a5[a6];
  if (a7 == 1)
    v27 = &a5[a6];
  else
    v27 = 0;
  if (a7 == 2)
    v28 = &a5[a6];
  else
    v28 = 0;
  if (a7 != 4)
    v26 = 0;
  v110 = (unsigned int *)v26;
  v111 = v28;
  var1 = a4->var1;
  v106 = a6;
  if ((uint64_t)sub_1B1874BE0((uint64_t)var1, v17, v18, v19, v20, v21, v22, v23) < 1)
  {
    v72 = v24;
    if (var3)
    {
      if ((_DWORD)v24)
      {
        v73 = v25;
        v74 = 0;
        v75 = 0;
        v76 = 0;
        v77 = 0;
        LODWORD(v24) = v73;
        v78 = HIBYTE(v73);
        while (1)
        {
          *(double *)v79.i64 = sub_1B198D4F8(BYTE4(v24), (const float *)(v114 + v74), v30, v31, v32, v33, v34, v35, v36, v37.f32[0], *(float *)&v38);
          v116 = v79;
          *(double *)v36.i64 = sub_1B198D4F8(v24, (const float *)(v112 + v75), v80, v81, v82, v83, v84, v85, v79, v86, v87);
          v38 = *(_OWORD *)&v116 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
          v37.i64[0] = 0x3400000034000000;
          v37.i64[1] = 0x3400000034000000;
          v37.i32[0] = vminvq_u32((uint32x4_t)vcgeq_f32(v37, (float32x4_t)(*(_OWORD *)&v116 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))));
          if (v37.i32[0] < 0)
          {
            v37.i64[0] = 0x3400000034000000;
            v37.i64[1] = 0x3400000034000000;
            v36 = (float32x4_t)vcgeq_f32(v37, vabsq_f32(v36));
            v36.i32[0] = vminvq_u32((uint32x4_t)v36);
            if (v36.i32[0] < 0)
              goto LABEL_63;
          }
          if ((v113 & 1) != 0)
          {
            v88 = a8[v76];
            if (!v27)
              goto LABEL_59;
          }
          else
          {
            v88 = v76;
            if (!v27)
            {
LABEL_59:
              v27 = 0;
              if (v111)
              {
                *(_WORD *)v111 = v88;
                v111 += 2;
              }
              else
              {
                *v110++ = v88;
                v111 = 0;
              }
              goto LABEL_62;
            }
          }
          *v27++ = v88;
LABEL_62:
          ++v77;
LABEL_63:
          ++v76;
          v75 += v78;
          v74 += BYTE5(v24);
          if (v72 == v76)
            goto LABEL_107;
        }
      }
LABEL_106:
      v77 = 0;
LABEL_107:
      v99 = v106;
      v98 = v107;
      if (v77 != v107->var2)
        sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Buffer has not been completely written to"), v30, v31, v32, v33, v34, v35, (uint64_t)"writtenIndexCount == runtimeTarget->vertexCount");
      goto LABEL_109;
    }
    if (!(_DWORD)v24)
      goto LABEL_106;
    v100 = 0;
    v101 = 0;
    v77 = 0;
    v102 = BYTE4(v24);
    v103 = BYTE5(v24);
    while (1)
    {
      v104.i64[0] = COERCE_UNSIGNED_INT64(sub_1B198D4F8(v102, (const float *)(v114 + v100), v30, v31, v32, v33, v34, v35, v36, v37.f32[0], *(float *)&v38)) & 0x7FFFFFFF7FFFFFFFLL;
      v104.i64[1] &= 0x7FFFFFFF7FFFFFFFuLL;
      v37.i64[0] = 0x3400000034000000;
      v37.i64[1] = 0x3400000034000000;
      v36 = (float32x4_t)vcgeq_f32(v37, v104);
      v36.i32[0] = vminvq_u32((uint32x4_t)v36);
      if ((v36.i32[0] & 0x80000000) == 0)
        break;
LABEL_104:
      ++v101;
      v100 += v103;
      if (v72 == v101)
        goto LABEL_107;
    }
    if ((v113 & 1) != 0)
    {
      v105 = a8[v101];
      if (v27)
      {
LABEL_98:
        *v27++ = v105;
LABEL_103:
        ++v77;
        goto LABEL_104;
      }
    }
    else
    {
      v105 = v101;
      if (v27)
        goto LABEL_98;
    }
    v27 = 0;
    if (v111)
    {
      *(_WORD *)v111 = v105;
      v111 += 2;
    }
    else
    {
      *v110++ = v105;
      v111 = 0;
    }
    goto LABEL_103;
  }
  v39 = sub_1B1874C3C((uint64_t)var1, 0, 0, v31, v32, v33, v34, v35);
  v120 = 0;
  v118 = 0u;
  v119 = 0u;
  v117 = 0u;
  sub_1B17A4804((uint64_t)v39, 0, v40, v41, v42, v43, v44, v45, (uint64_t)&v117);
  if (!var3)
  {
    if (!DWORD2(v117))
    {
      v90 = 0;
LABEL_111:
      v98 = v107;
      if (v90 == v107->var2)
        goto LABEL_92;
      goto LABEL_91;
    }
    v89 = 0;
    v90 = 0;
    v91 = 0;
    while (BYTE11(v118) != 4)
    {
      if (BYTE11(v118) == 2)
      {
        v92 = *(unsigned __int16 *)(v117 + 2 * (*((_QWORD *)&v119 + 1) + v120 * 2 * v89));
        v93 = *(unsigned __int16 *)(v117 + 2 * (*((_QWORD *)&v119 + 1) + v120 * ((2 * v89) | 1)));
LABEL_73:
        if (v92 < v93)
        {
          v94 = &a8[v92];
          v95 = BYTE5(v24) * v91;
          do
          {
            v96.i64[0] = COERCE_UNSIGNED_INT64(sub_1B198D4F8(BYTE4(v24), (const float *)(v114 + v95), v46, v47, v48, v49, v50, v51, v52, v53.f32[0], *(float *)&v54)) & 0x7FFFFFFF7FFFFFFFLL;
            v96.i64[1] &= 0x7FFFFFFF7FFFFFFFuLL;
            v53.i64[0] = 0x3400000034000000;
            v53.i64[1] = 0x3400000034000000;
            v52 = (float32x4_t)vcgeq_f32(v53, v96);
            v52.i32[0] = vminvq_u32((uint32x4_t)v52);
            if ((v52.i32[0] & 0x80000000) == 0)
            {
              v97 = v92;
              if (v113)
                v97 = *v94;
              if (v27)
              {
                *v27++ = v97;
              }
              else
              {
                v27 = 0;
                if (v111)
                {
                  *(_WORD *)v111 = v97;
                  v111 += 2;
                }
                else
                {
                  *v110++ = v97;
                  v111 = 0;
                }
              }
              ++v90;
            }
            ++v91;
            ++v94;
            ++v92;
            v95 += BYTE5(v24);
          }
          while (v93 != v92);
        }
        goto LABEL_87;
      }
      if (BYTE11(v118) == 1)
      {
        v92 = *(unsigned __int8 *)(v117 + *((_QWORD *)&v119 + 1) + v120 * 2 * v89);
        v93 = *(unsigned __int8 *)(v117 + *((_QWORD *)&v119 + 1) + v120 * ((2 * v89) | 1));
        goto LABEL_73;
      }
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Invalid bytes per index (%d)"), v46, v47, v48, v49, v50, v51, BYTE11(v118));
LABEL_87:
      if (++v89 >= (unint64_t)DWORD2(v117))
        goto LABEL_111;
    }
    v92 = *(_DWORD *)(v117 + 4 * (*((_QWORD *)&v119 + 1) + v120 * 2 * v89));
    v93 = *(_DWORD *)(v117 + 4 * (*((_QWORD *)&v119 + 1) + v120 * ((2 * v89) | 1)));
    goto LABEL_73;
  }
  if (DWORD2(v117))
  {
    v55 = 0;
    v56 = 0;
    v57 = 0;
    while (1)
    {
      v109 = v55;
      if (BYTE11(v118) == 4)
        break;
      if (BYTE11(v118) == 2)
      {
        v58 = *(unsigned __int16 *)(v117 + 2 * (*((_QWORD *)&v119 + 1) + v120 * 2 * v55));
        v59 = *(unsigned __int16 *)(v117 + 2 * (*((_QWORD *)&v119 + 1) + v120 * ((2 * v55) | 1)));
LABEL_33:
        if (v58 < v59)
        {
          v60 = &a8[v58];
          v61 = BYTE5(v24) * v57;
          LODWORD(v24) = HIBYTE(v25) * v57;
          do
          {
            *(double *)v62.i64 = sub_1B198D4F8(BYTE4(v24), (const float *)(v114 + v61), v46, v47, v48, v49, v50, v51, v52, v53.f32[0], *(float *)&v54);
            v115 = v62;
            *(double *)v52.i64 = sub_1B198D4F8(v25, (const float *)(v112 + v24), v63, v64, v65, v66, v67, v68, v62, v69, v70);
            v54 = *(_OWORD *)&v115 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL);
            v53.i64[0] = 0x3400000034000000;
            v53.i64[1] = 0x3400000034000000;
            v53.i32[0] = vminvq_u32((uint32x4_t)vcgeq_f32(v53, (float32x4_t)(*(_OWORD *)&v115 & __PAIR128__(0x7FFFFFFF7FFFFFFFLL, 0x7FFFFFFF7FFFFFFFLL))));
            if ((v53.i32[0] & 0x80000000) == 0
              || (v53.i64[0] = 0x3400000034000000,
                  v53.i64[1] = 0x3400000034000000,
                  v52 = (float32x4_t)vcgeq_f32(v53, vabsq_f32(v52)),
                  v52.i32[0] = vminvq_u32((uint32x4_t)v52),
                  (v52.i32[0] & 0x80000000) == 0))
            {
              v71 = v58;
              if (v113)
                v71 = *v60;
              if (v27)
              {
                *v27++ = v71;
              }
              else
              {
                v27 = 0;
                if (v111)
                {
                  *(_WORD *)v111 = v71;
                  v111 += 2;
                }
                else
                {
                  *v110++ = v71;
                  v111 = 0;
                }
              }
              ++v56;
            }
            ++v57;
            ++v60;
            ++v58;
            v61 += BYTE5(v24);
            LODWORD(v24) = v24 + HIBYTE(v25);
          }
          while (v59 != v58);
        }
        goto LABEL_48;
      }
      if (BYTE11(v118) == 1)
      {
        v58 = *(unsigned __int8 *)(v117 + *((_QWORD *)&v119 + 1) + v120 * 2 * v55);
        v59 = *(unsigned __int8 *)(v117 + *((_QWORD *)&v119 + 1) + v120 * ((2 * v55) | 1));
        goto LABEL_33;
      }
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Invalid bytes per index (%d)"), v46, v47, v48, v49, v50, v51, BYTE11(v118));
LABEL_48:
      v55 = v109 + 1;
      if (v109 + 1 >= (unint64_t)DWORD2(v117))
        goto LABEL_90;
    }
    v58 = *(_DWORD *)(v117 + 4 * (*((_QWORD *)&v119 + 1) + v120 * 2 * v55));
    v59 = *(_DWORD *)(v117 + 4 * (*((_QWORD *)&v119 + 1) + v120 * ((2 * v55) | 1)));
    goto LABEL_33;
  }
  v56 = 0;
LABEL_90:
  v98 = v107;
  if (v56 == v107->var2)
    goto LABEL_92;
LABEL_91:
  sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Buffer has not been completely written to"), v46, v47, v48, v49, v50, v51, (uint64_t)"writtenIndexCount == runtimeTarget->vertexCount");
LABEL_92:
  v99 = v106;
LABEL_109:
  v98->var4 = v99;
}

- (unint64_t)updateWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5 tangents:(id)a6
{
  unint64_t v9;

  v9 = objc_msgSend_currentFrameHash(a3, a2, (uint64_t)a3, (uint64_t)a4, a5, a6);
  if (self->_currentFrameHash == v9)
    return 0;
  self->_currentFrameHash = v9;
  if (self->_morphKind == 1)
    return MEMORY[0x1E0DE7D20](self, sel_morphSparseWithComputeContext_positions_normals_, a3, a4);
  else
    return MEMORY[0x1E0DE7D20](self, sel_morphIncrementallyWithComputeContext_positions_normals_, a3, a4);
}

- (unint64_t)morphSparseWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void **v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int vertexCountForComputeKernel;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  MTLBuffer *originalToFirstDeindexedTableBuffer;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  unint64_t v37;
  $4C9AEC9213DCD68D17C013290EF3C758 *morphTargets;
  $4C9AEC9213DCD68D17C013290EF3C758 *v39;
  uint64_t var1;
  float v41;
  float v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  unsigned int v46;
  unsigned int v47;
  const char *v48;
  const char *v49;
  MTLBuffer *v50;
  uint64_t *p_blendDensePipeline;
  uint64_t v52;
  const char *v53;
  MTLBuffer *deindexedToFirstDeindexedTableBuffer;
  const char *v55;
  uint64_t v56;
  const char *v57;
  int64x2_t v59;
  float v60[2];
  unsigned int var2;
  float v62;
  const UInt8 *v63;
  void *v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int64x2_t v70;

  v65 = 0;
  v63 = 0;
  v64 = 0;
  v62 = 0.0;
  v11 = sub_1B1943804((uint64_t)self->_morpher, self->_lastMorpherIncrementalPassState, &v64, &v63, &v65, &v62, v5, v6);
  if (!v11)
    return 0;
  v15 = v11;
  v16 = (void **)objc_msgSend_currentComputeEncoder(a3, v12, v13, v14);
  objc_msgSend_resetCache(*v16, v17, v18, v19);
  objc_msgSend_setBuffer_offset_atIndex_(*v16, v20, (uint64_t)a4, 0, 0);
  if (a5)
    objc_msgSend_setBuffer_offset_atIndex_(*v16, v21, (uint64_t)a5, 0, 4);
  if (v15 == 2)
  {
    objc_msgSend_setBuffer_offset_atIndex_(*v16, v21, (uint64_t)self->_baseBufferForComputeKernel, 0, 1);
    vertexCountForComputeKernel = self->_vertexCountForComputeKernel;
    v60[0] = 0.0;
    var2 = vertexCountForComputeKernel;
    objc_msgSend_setBytes_length_atIndex_(*v16, v28, (uint64_t)v60, 12, 3);
    v29 = *v16;
    v66 = 0;
    v67 = 0;
    v68 = 0;
    v69 = var2;
    v70 = vdupq_n_s64(1uLL);
    objc_msgSend_setStageInRegion_(v29, v30, (uint64_t)&v66, v31);
    originalToFirstDeindexedTableBuffer = self->_originalToFirstDeindexedTableBuffer;
    if (originalToFirstDeindexedTableBuffer)
      objc_msgSend_setBuffer_offset_atIndex_(*v16, v32, (uint64_t)originalToFirstDeindexedTableBuffer, 0, 2);
    v34 = sub_1B18FD774((uint64_t)self->_copyBaseBufferPipeline);
    objc_msgSend_dispatchOnVertices_vertexCount_(*v16, v35, v34, var2);
    bzero(v64, 4 * v65);
  }
  if (self->_morphTargetCount)
  {
    v36 = 0;
    v37 = 0;
    v59 = vdupq_n_s64(1uLL);
    do
    {
      morphTargets = self->_morphTargets;
      v39 = &morphTargets[v36];
      var1 = morphTargets[v36].var1;
      v41 = *(float *)&v63[4 * var1];
      v42 = *((float *)v64 + var1);
      if (vabds_f32(v41, v42) > v62)
      {
        v60[0] = v41 - v42;
        v60[1] = (float)(v41 - v42) * v39->var0;
        var2 = v39->var2;
        objc_msgSend_setBytes_length_atIndex_(*v16, v21, (uint64_t)v60, 12, 3);
        v43 = *v16;
        v66 = 0;
        v67 = 0;
        v68 = 0;
        v69 = var2;
        v70 = v59;
        objc_msgSend_setStageInRegion_(v43, v44, (uint64_t)&v66, v45);
        v46 = v39->var2;
        v47 = self->_vertexCountForComputeKernel;
        objc_msgSend_setBuffer_offset_atIndex_(*v16, v48, (uint64_t)self->_morphTargetsVertexBuffer, v39->var3, 1);
        if (v46 == v47)
        {
          v50 = self->_originalToFirstDeindexedTableBuffer;
          p_blendDensePipeline = (uint64_t *)&self->_blendDensePipeline;
          if (v50)
          {
            objc_msgSend_setBuffer_offset_atIndex_(*v16, v49, (uint64_t)v50, 0, 2);
            p_blendDensePipeline = (uint64_t *)&self->_blendDenseIndexedPipeline;
          }
        }
        else
        {
          objc_msgSend_setBuffer_offset_atIndex_(*v16, v49, (uint64_t)self->_morphTargetsSparseIndicesBuffer, morphTargets[v36].var4, 2);
          p_blendDensePipeline = (uint64_t *)&self->_blendSparsePipeline;
        }
        v52 = sub_1B18FD774(*p_blendDensePipeline);
        objc_msgSend_dispatchOnVertices_vertexCount_(*v16, v53, v52, var2);
      }
      ++v37;
      ++v36;
    }
    while (v37 < self->_morphTargetCount);
  }
  deindexedToFirstDeindexedTableBuffer = self->_deindexedToFirstDeindexedTableBuffer;
  if (deindexedToFirstDeindexedTableBuffer)
  {
    var2 = self->_finalMeshVertexCount;
    objc_msgSend_setBuffer_offset_atIndex_(*v16, v21, (uint64_t)deindexedToFirstDeindexedTableBuffer, 0, 2);
    objc_msgSend_setBytes_length_atIndex_(*v16, v55, (uint64_t)v60, 12, 3);
    v56 = sub_1B18FD774((uint64_t)self->_splatPipeline);
    objc_msgSend_dispatchOnVertices_vertexCount_(*v16, v57, v56, self->_finalMeshVertexCount);
  }
  self->_lastMorpherIncrementalPassState = sub_1B1943910((uint64_t)self->_morpher, (uint64_t)v21, (uint64_t)deindexedToFirstDeindexedTableBuffer, v22, v23, v24, v25, v26);
  return 1;
}

- (unint64_t)morphIncrementallyWithComputeContext:(id)a3 positions:(id)a4 normals:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  int v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void **v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  float *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  MTLBuffer **v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  double v31;
  uint64_t v32;
  _QWORD *v33;
  float v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  unsigned int v44;
  unint64_t v45;
  const UInt8 *v46;
  char *v47;
  uint64_t v48;
  float v49;
  float v50;
  float v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  MTLBuffer **p_baseBufferForComputeKernel;
  uint64_t v63;
  MTLBuffer **v64;
  float v65;
  uint64_t v66;
  MTLBuffer **v67;
  MTLBuffer *v68;
  void **v69;
  const char *v70;
  const char *v71;
  VFXMTLMorphDeformer *v72;
  uint64_t v73;
  VFXMTLMorphDeformer *v74;
  uint64_t v75;
  void **v76;
  unsigned int v77;
  uint64_t v78;
  _BOOL4 v79;
  _BOOL4 v80;
  MTLBuffer **v81;
  float v82[8];
  unsigned int vertexCountForComputeKernel;
  float v84;
  const UInt8 *v85;
  char *v86;
  unsigned int v87;
  _OWORD v88[4];
  _OWORD v89[4];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v87 = 0;
  v86 = 0;
  v85 = 0;
  v84 = 0.0;
  v11 = sub_1B1943804((uint64_t)self->_morpher, self->_lastMorpherIncrementalPassState, &v86, &v85, &v87, &v84, v5, v6);
  if (!v11)
    return 0;
  v15 = v11;
  v16 = (void **)objc_msgSend_currentComputeEncoder(a3, v12, v13, v14);
  v20 = objc_msgSend_resetCache(*v16, v17, v18, v19);
  v73 = (uint64_t)&v73;
  MEMORY[0x1E0C80A78](v20, v21);
  v23 = (float *)((char *)&v73 - v22);
  MEMORY[0x1E0C80A78](v24, v25);
  v27 = (MTLBuffer **)((char *)&v73 - ((v26 + 15) & 0xFFFFFFFF0));
  v31 = MEMORY[0x1E0C80A78](v28, v29);
  v33 = (uint64_t *)((char *)&v73 - v32);
  v79 = v15 == 2;
  v34 = 1.0;
  if (v15 == 2)
  {
    v34 = 0.0;
    if (v87)
      bzero(v86, 4 * v87);
  }
  objc_msgSend_setBuffer_offset_atIndex_(*v16, v30, (uint64_t)a4, 0, 0, v31);
  if (a5)
    objc_msgSend_setBuffer_offset_atIndex_(*v16, v35, (uint64_t)a5, 0, 1);
  if (vabds_f32(1.0, v34) <= 0.00000011921)
  {
    v42 = 0;
  }
  else
  {
    *v23 = 1.0 - v34;
    *v27 = self->_baseBufferForComputeKernel;
    *v33 = 0;
    v42 = 1;
  }
  v44 = v87;
  if (v87 != self->_morphTargetCount)
  {
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Internal consistency error"), v36, v37, v38, v39, v40, v41, (uint64_t)"weightCount == _morphTargetCount");
    v44 = v87;
  }
  if (v44)
  {
    v45 = 0;
    v46 = v85;
    v47 = v86;
    v48 = 4 * v44;
    v49 = v84;
    do
    {
      v50 = *(float *)&v46[v45];
      v51 = *(float *)&v47[v45];
      if (vabds_f32(v50, v51) > v49)
      {
        v23[v42] = v50 - v51;
        v27[v42] = self->_morphTargetsVertexBuffer;
        v33[v42++] = self->_morphTargets[v45 / 4].var3;
      }
      v45 += 4;
    }
    while (v48 != v45);
  }
  v76 = v16;
  memset(v82, 0, sizeof(v82));
  vertexCountForComputeKernel = self->_vertexCountForComputeKernel;
  memset(v89, 0, sizeof(v89));
  memset(&v88[2], 0, 32);
  v52 = 136;
  if (v15 == 2)
    v52 = 128;
  memset(v88, 0, 32);
  v74 = self;
  v78 = sub_1B18FD774(*(uint64_t *)((char *)&self->super.isa + v52));
  v77 = v42 + 7;
  if (v42 + 7 >= 8)
  {
    v60 = 0;
    v61 = 0;
    v75 = v77 >> 3;
    p_baseBufferForComputeKernel = &v74->_baseBufferForComputeKernel;
    do
    {
      v63 = 0;
      v64 = v27;
      do
      {
        if (v60 + v63 >= (unint64_t)v42)
        {
          v66 = 0;
          v65 = 0.0;
          v67 = p_baseBufferForComputeKernel;
        }
        else
        {
          v65 = v23[v63];
          v66 = v33[v63];
          v67 = v64;
        }
        v68 = *v67;
        v82[v63] = v65;
        *((_QWORD *)v89 + v63) = v68;
        *((_QWORD *)v88 + v63++) = v66;
        ++v64;
      }
      while (v63 != 8);
      v81 = v27;
      v80 = v77 > 0xF;
      v69 = v76;
      objc_msgSend_setBuffers_offsets_withRange_(*v76, v53, (uint64_t)v89, (uint64_t)v88, 5, 8);
      objc_msgSend_setBytes_length_atIndex_(*v69, v70, (uint64_t)v82, 36, 3);
      objc_msgSend_dispatchOnVertices_vertexCount_(*v69, v71, v78, vertexCountForComputeKernel);
      if (v80 && v79)
      {
        v78 = sub_1B18FD774((uint64_t)v74->_incrementalAddPipeline);
        v79 = 0;
      }
      ++v61;
      v23 += 8;
      v27 = v81 + 8;
      v33 += 8;
      v60 += 8;
    }
    while (v61 != v75);
  }
  v72 = v74;
  v72->_lastMorpherIncrementalPassState = sub_1B1943910((uint64_t)v74->_morpher, (uint64_t)v53, v54, v55, v56, v57, v58, v59);
  return 1;
}

@end
