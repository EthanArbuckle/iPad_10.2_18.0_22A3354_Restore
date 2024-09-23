@implementation VFXMTLDeformerStack

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXMTLDeformerStack;
  -[VFXMTLDeformerStack dealloc](&v3, sel_dealloc);
}

- (void)setupInitialBuffersWithBaseMesh:(__CFXMesh *)a3 entityName:(__CFString *)a4 info:(id)a5
{
  uint64_t v5;
  MTLBuffer *initialPositionBuffer;
  MTLBuffer *initialNormalBuffer;
  MTLBuffer *initialTangentBuffer;
  MTLStageInputOutputDescriptor *initialBuffersStageInputDescriptor;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  unint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  unint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  const void *v161;
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
  const char *v175;
  uint64_t v176;
  unint64_t v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  unint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  unint64_t v185;
  uint64_t v186;

  v5 = *(_QWORD *)&a5.var0;
  initialPositionBuffer = self->_initialPositionBuffer;
  if (initialPositionBuffer)
  {
    CFRelease(initialPositionBuffer);
    self->_initialPositionBuffer = 0;
  }
  initialNormalBuffer = self->_initialNormalBuffer;
  if (initialNormalBuffer)
  {
    CFRelease(initialNormalBuffer);
    self->_initialNormalBuffer = 0;
  }
  initialTangentBuffer = self->_initialTangentBuffer;
  if (initialTangentBuffer)
  {
    CFRelease(initialTangentBuffer);
    self->_initialTangentBuffer = 0;
  }
  initialBuffersStageInputDescriptor = self->_initialBuffersStageInputDescriptor;
  if (initialBuffersStageInputDescriptor)
  {
    CFRelease(initialBuffersStageInputDescriptor);
    self->_initialBuffersStageInputDescriptor = 0;
  }
  self->_initialPositionStageInputOutputDescriptorInfo.isActive = 0;
  self->_initialNormalStageInputOutputDescriptorInfo.isActive = 0;
  self->_initialTangentStageInputOutputDescriptorInfo.isActive = 0;
  if ((v5 & 0x100010001) != 0)
  {
    self->_initialBuffersStageInputDescriptor = (MTLStageInputOutputDescriptor *)objc_alloc_init(MEMORY[0x1E0CC6B90]);
    v16 = sub_1B1875540((uint64_t)a3, 0, 0, self->_deformDataKind, v12, v13, v14, v15);
    v27 = sub_1B17EDAE0((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
    if ((v5 & 1) != 0)
    {
      v28 = (void *)objc_msgSend_attributes(self->_initialBuffersStageInputDescriptor, v24, v25, v26);
      v31 = (void *)objc_msgSend_objectAtIndexedSubscript_(v28, v29, 0, v30);
      objc_msgSend_setFormat_(v31, v32, 30, v33);
      objc_msgSend_setOffset_(v31, v34, 0, v35);
      objc_msgSend_setBufferIndex_(v31, v36, 10, v37);
      v41 = (void *)objc_msgSend_layouts(self->_initialBuffersStageInputDescriptor, v38, v39, v40);
      v45 = objc_msgSend_bufferIndex(v31, v42, v43, v44);
      v48 = (void *)objc_msgSend_objectAtIndexedSubscript_(v41, v46, v45, v47);
      objc_msgSend_setStepFunction_(v48, v49, 5, v50);
      if ((v5 & 0x100) != 0)
      {
        v186 = 0;
        self->_initialPositionBuffer = (MTLBuffer *)objc_msgSend_newBufferForDataKind_meshSource_dataType_forStageInputOutputDescriptor_usePrivateStorageMode_outStride_(self, v51, self->_deformDataKind, (uint64_t)v16, 8, 1, 1, &v186);
        objc_msgSend_setStride_(v48, v58, v186, v59);
      }
      else
      {
        v52 = sub_1B189D6B0(30);
        self->_initialPositionBuffer = (MTLBuffer *)sub_1B18FC078((uint64_t)self->_resourceManager, (const char *)(v27 * v52), 32);
        objc_msgSend_setStride_(v48, v53, v52, v54);
      }
      v60 = objc_msgSend_format(v31, v55, v56, v57);
      v64 = objc_msgSend_offset(v31, v61, v62, v63);
      v68 = objc_msgSend_stride(v48, v65, v66, v67);
      self->_initialPositionStageInputOutputDescriptorInfo.isActive = 1;
      self->_initialPositionStageInputOutputDescriptorInfo.bufferAttributeFormat = v60;
      self->_initialPositionStageInputOutputDescriptorInfo.bufferAttributeOffset = v64;
      self->_initialPositionStageInputOutputDescriptorInfo.bufferLayoutStride = v68;
      if ((v5 & 0x10000) == 0)
      {
LABEL_12:
        if ((v5 & 0x100000000) == 0)
          return;
        goto LABEL_26;
      }
    }
    else if ((v5 & 0x10000) == 0)
    {
      goto LABEL_12;
    }
    v69 = (void *)objc_msgSend_attributes(self->_initialBuffersStageInputDescriptor, v24, v25, v26);
    v72 = (void *)objc_msgSend_objectAtIndexedSubscript_(v69, v70, 1, v71);
    objc_msgSend_setFormat_(v72, v73, 30, v74);
    objc_msgSend_setOffset_(v72, v75, 0, v76);
    objc_msgSend_setBufferIndex_(v72, v77, 11, v78);
    v82 = (void *)objc_msgSend_layouts(self->_initialBuffersStageInputDescriptor, v79, v80, v81);
    v86 = objc_msgSend_bufferIndex(v72, v83, v84, v85);
    v89 = (void *)objc_msgSend_objectAtIndexedSubscript_(v82, v87, v86, v88);
    objc_msgSend_setStepFunction_(v89, v90, 5, v91);
    if ((v5 & 0x1000000) != 0)
    {
      v108 = sub_1B1875540((uint64_t)a3, 1, 0, self->_deformDataKind, v92, v93, v94, v95);
      if (!v108)
      {
        v108 = (const void *)sub_1B17B13D4((uint64_t)a3, self->_deformDataKind, 0, v103, v104, v105, v106, v107);
        if (!v108)
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v109, v110, v111, v112, v113, v114, (uint64_t)"baseNormalSource");
        CFAutorelease(v108);
      }
      v186 = 0;
      self->_initialNormalBuffer = (MTLBuffer *)objc_msgSend_newBufferForDataKind_meshSource_dataType_forStageInputOutputDescriptor_usePrivateStorageMode_outStride_(self, v102, self->_deformDataKind, (uint64_t)v108, 8, 1, 1, &v186);
      objc_msgSend_setStride_(v89, v115, v186, v116);
    }
    else
    {
      v96 = sub_1B189D6B0(30);
      self->_initialNormalBuffer = (MTLBuffer *)sub_1B18FC078((uint64_t)self->_resourceManager, (const char *)(v27 * v96), 32);
      objc_msgSend_setStride_(v89, v97, v96, v98);
    }
    v117 = objc_msgSend_format(v72, v99, v100, v101);
    v121 = objc_msgSend_offset(v72, v118, v119, v120);
    v125 = objc_msgSend_stride(v89, v122, v123, v124);
    self->_initialNormalStageInputOutputDescriptorInfo.isActive = 1;
    self->_initialNormalStageInputOutputDescriptorInfo.bufferAttributeFormat = v117;
    self->_initialNormalStageInputOutputDescriptorInfo.bufferAttributeOffset = v121;
    self->_initialNormalStageInputOutputDescriptorInfo.bufferLayoutStride = v125;
    if ((v5 & 0x100000000) != 0)
    {
LABEL_26:
      v126 = (void *)objc_msgSend_attributes(self->_initialBuffersStageInputDescriptor, v24, v25, v26);
      v129 = (void *)objc_msgSend_objectAtIndexedSubscript_(v126, v127, 2, v128);
      objc_msgSend_setFormat_(v129, v130, 31, v131);
      objc_msgSend_setOffset_(v129, v132, 0, v133);
      objc_msgSend_setBufferIndex_(v129, v134, 12, v135);
      v139 = (void *)objc_msgSend_layouts(self->_initialBuffersStageInputDescriptor, v136, v137, v138);
      v143 = objc_msgSend_bufferIndex(v129, v140, v141, v142);
      v146 = (void *)objc_msgSend_objectAtIndexedSubscript_(v139, v144, v143, v145);
      objc_msgSend_setStepFunction_(v146, v147, 5, v148);
      if ((v5 & 0x10000000000) != 0)
      {
        v161 = sub_1B1875540((uint64_t)a3, 4, 0, self->_deformDataKind, v149, v150, v151, v152);
        if (!v161)
        {
          sub_1B17B1F4C((uint64_t)a3, self->_deformDataKind, v160, 0, v162, v163, v164, v165);
          v161 = sub_1B1875540((uint64_t)a3, 4, 0, self->_deformDataKind, v166, v167, v168, v169);
          if (!v161)
          {
            sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v170, 0, v171, v172, v173, v174, (uint64_t)"baseTangentSource");
            v161 = 0;
          }
        }
        v186 = 0;
        self->_initialTangentBuffer = (MTLBuffer *)objc_msgSend_newBufferForDataKind_meshSource_dataType_forStageInputOutputDescriptor_usePrivateStorageMode_outStride_(self, v159, self->_deformDataKind, (uint64_t)v161, 9, 1, 1, &v186);
        objc_msgSend_setStride_(v146, v175, v186, v176);
      }
      else
      {
        v153 = sub_1B189D6B0(31);
        self->_initialTangentBuffer = (MTLBuffer *)sub_1B18FC078((uint64_t)self->_resourceManager, (const char *)(v27 * v153), 32);
        objc_msgSend_setStride_(v146, v154, v153, v155);
      }
      v177 = objc_msgSend_format(v129, v156, v157, v158);
      v181 = objc_msgSend_offset(v129, v178, v179, v180);
      v185 = objc_msgSend_stride(v146, v182, v183, v184);
      self->_initialTangentStageInputOutputDescriptorInfo.isActive = 1;
      self->_initialTangentStageInputOutputDescriptorInfo.bufferAttributeFormat = v177;
      self->_initialTangentStageInputOutputDescriptorInfo.bufferAttributeOffset = v181;
      self->_initialTangentStageInputOutputDescriptorInfo.bufferLayoutStride = v185;
    }
  }
}

- (void)setupFinalMeshWithMesh:(__CFXMesh *)a3 entityName:(__CFString *)a4 info:(id)a5 usingDrawIndirect:(BOOL)a6
{
  MTLBuffer *deformPositionBuffer;
  MTLBuffer *deformNormalBuffer;
  MTLBuffer *deformTangentBuffer;
  VFXMTLMesh *finalMesh;
  MTLBuffer *finalPositionBuffer;
  MTLBuffer *finalNormalBuffer;
  MTLBuffer *finalTangentBuffer;
  int finalDataKind;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  MTLBuffer *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  MTLBuffer *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  unsigned int v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  MTLBuffer *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  MTLBuffer *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  const void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  unint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  unint64_t v182;
  uint64_t v183;
  id v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  CFIndex i;
  const void *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  unsigned int v202;
  uint64_t v203;
  VFXMTLMeshElement *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  const void *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  MTLBuffer *v221;
  id v222;
  const char *v223;
  const char *v224;
  const char *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  const char *v229;
  VFXMTLMesh *v230;
  void *v231;
  BOOL v232;
  BOOL v233;
  int v234;
  uint64_t v235;
  _QWORD v236[9];
  BOOL v237;
  uint64_t v238;
  uint64_t *v239;
  uint64_t v240;
  uint64_t v241;

  deformPositionBuffer = self->_deformPositionBuffer;
  if (deformPositionBuffer)
  {
    CFRelease(deformPositionBuffer);
    self->_deformPositionBuffer = 0;
  }
  deformNormalBuffer = self->_deformNormalBuffer;
  if (deformNormalBuffer)
  {
    CFRelease(deformNormalBuffer);
    self->_deformNormalBuffer = 0;
  }
  deformTangentBuffer = self->_deformTangentBuffer;
  if (deformTangentBuffer)
  {
    CFRelease(deformTangentBuffer);
    self->_deformTangentBuffer = 0;
  }
  finalMesh = self->_finalMesh;
  if (finalMesh)
  {
    CFRelease(finalMesh);
    self->_finalMesh = 0;
  }
  finalPositionBuffer = self->_finalPositionBuffer;
  if (finalPositionBuffer)
  {
    CFRelease(finalPositionBuffer);
    self->_finalPositionBuffer = 0;
  }
  finalNormalBuffer = self->_finalNormalBuffer;
  if (finalNormalBuffer)
  {
    CFRelease(finalNormalBuffer);
    self->_finalNormalBuffer = 0;
  }
  finalTangentBuffer = self->_finalTangentBuffer;
  if (finalTangentBuffer)
  {
    CFRelease(finalTangentBuffer);
    self->_finalTangentBuffer = 0;
  }
  finalDataKind = self->_finalDataKind;
  v17 = self->_finalDataKind == 0;
  v18 = objc_msgSend_vertexDescriptor(MEMORY[0x1E0CC6BD8], a2, (uint64_t)a3, (uint64_t)a4, *(_QWORD *)&a5.var0, a6);
  v19 = sub_1B1876058((uint64_t)a3);
  v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v23 = (void *)objc_msgSend_initWithCapacity_(v20, v21, v19, v22);
  v238 = 0;
  v239 = &v238;
  v240 = 0x2020000000;
  v241 = 0;
  v24 = self->_finalDataKind;
  v236[0] = MEMORY[0x1E0C809B0];
  v236[1] = 3221225472;
  v236[2] = sub_1B1870820;
  v236[3] = &unk_1E63D7B58;
  v236[7] = &v238;
  v236[8] = a3;
  v236[4] = self;
  v236[5] = v23;
  v231 = (void *)v18;
  v236[6] = v18;
  v237 = v17;
  sub_1B1873EE0((uint64_t)a3, v24, (uint64_t)v236, v25, v26, v27, v28, v29);
  if (a5.var0)
  {
    v37 = sub_1B189D6B0(30);
    v42 = sub_1B1875540((uint64_t)a3, 0, 0, self->_deformDataKind, v38, v39, v40, v41);
    v50 = sub_1B17EDAE0((uint64_t)v42, v43, v44, v45, v46, v47, v48, v49);
    if ((*(_WORD *)&a5.var0 & 0x100) != 0)
      v52 = (MTLBuffer *)objc_msgSend_newBufferForDataKind_meshSource_dataType_forStageInputOutputDescriptor_usePrivateStorageMode_outStride_(self, v51, self->_deformDataKind, (uint64_t)v42, 8, 0, 0, 0);
    else
      v52 = (MTLBuffer *)sub_1B18FC078((uint64_t)self->_resourceManager, (const char *)(v50 * v37), 32);
    self->_deformNormalBuffer = v52;
    v57 = self->_finalDataKind;
    if ((_DWORD)v57 == self->_deformDataKind)
    {
      v58 = v52;
    }
    else
    {
      v62 = sub_1B1875540((uint64_t)a3, 0, 0, v57, v53, v54, v55, v56);
      v70 = sub_1B17EDAE0((uint64_t)v62, v63, v64, v65, v66, v67, v68, v69);
      v58 = (MTLBuffer *)sub_1B18FC078((uint64_t)self->_resourceManager, (const char *)(v70 * v37), 32);
    }
    self->_finalNormalBuffer = v58;
    v71 = objc_msgSend_count(v23, v59, v60, v61);
    objc_msgSend_addObject_(v23, v72, (uint64_t)self->_finalNormalBuffer, v73);
    v77 = (void *)objc_msgSend_attributes(v231, v74, v75, v76);
    v80 = (void *)objc_msgSend_objectAtIndexedSubscript_(v77, v78, 1, v79);
    objc_msgSend_setFormat_(v80, v81, 30, v82);
    objc_msgSend_setOffset_(v80, v83, 0, v84);
    objc_msgSend_setBufferIndex_(v80, v85, v71 + 18, v86);
    v90 = (void *)objc_msgSend_layouts(v231, v87, v88, v89);
    v94 = objc_msgSend_bufferIndex(v80, v91, v92, v93);
    v97 = (void *)objc_msgSend_objectAtIndexedSubscript_(v90, v95, v94, v96);
    objc_msgSend_setStride_(v97, v98, v37, v99);
    objc_msgSend_setStepFunction_(v97, v100, 1, v101);
    v105 = objc_msgSend_offset(v80, v102, v103, v104);
    v109 = objc_msgSend_stride(v97, v106, v107, v108);
    self->_deformNormalStageInputOutputDescriptorInfo.isActive = 1;
    self->_deformNormalStageInputOutputDescriptorInfo.bufferAttributeFormat = 30;
    self->_deformNormalStageInputOutputDescriptorInfo.bufferAttributeOffset = v105;
    self->_deformNormalStageInputOutputDescriptorInfo.bufferLayoutStride = v109;
  }
  if ((*(_DWORD *)&a5 & 0x10000) != 0)
  {
    v110 = sub_1B189D6B0(31);
    v115 = sub_1B1875540((uint64_t)a3, 0, 0, self->_deformDataKind, v111, v112, v113, v114);
    v123 = sub_1B17EDAE0((uint64_t)v115, v116, v117, v118, v119, v120, v121, v122);
    if ((*(_DWORD *)&a5 & 0x1000000) != 0)
      v125 = (MTLBuffer *)objc_msgSend_newBufferForDataKind_meshSource_dataType_forStageInputOutputDescriptor_usePrivateStorageMode_outStride_(self, v124, self->_deformDataKind, (uint64_t)v115, 9, 0, 0, 0);
    else
      v125 = (MTLBuffer *)sub_1B18FC078((uint64_t)self->_resourceManager, (const char *)(v123 * v110), 32);
    self->_deformTangentBuffer = v125;
    v130 = self->_finalDataKind;
    if ((_DWORD)v130 == self->_deformDataKind)
    {
      v131 = v125;
    }
    else
    {
      v135 = sub_1B1875540((uint64_t)a3, 0, 0, v130, v126, v127, v128, v129);
      v143 = sub_1B17EDAE0((uint64_t)v135, v136, v137, v138, v139, v140, v141, v142);
      v131 = (MTLBuffer *)sub_1B18FC078((uint64_t)self->_resourceManager, (const char *)(v143 * v110), 32);
    }
    self->_finalTangentBuffer = v131;
    v144 = objc_msgSend_count(v23, v132, v133, v134);
    objc_msgSend_addObject_(v23, v145, (uint64_t)self->_finalTangentBuffer, v146);
    v150 = (void *)objc_msgSend_attributes(v231, v147, v148, v149);
    v153 = (void *)objc_msgSend_objectAtIndexedSubscript_(v150, v151, 2, v152);
    objc_msgSend_setFormat_(v153, v154, 31, v155);
    objc_msgSend_setOffset_(v153, v156, 0, v157);
    objc_msgSend_setBufferIndex_(v153, v158, v144 + 18, v159);
    v163 = (void *)objc_msgSend_layouts(v231, v160, v161, v162);
    v167 = objc_msgSend_bufferIndex(v153, v164, v165, v166);
    v170 = (void *)objc_msgSend_objectAtIndexedSubscript_(v163, v168, v167, v169);
    objc_msgSend_setStride_(v170, v171, v110, v172);
    objc_msgSend_setStepFunction_(v170, v173, 1, v174);
    v178 = objc_msgSend_offset(v153, v175, v176, v177);
    v182 = objc_msgSend_stride(v170, v179, v180, v181);
    self->_deformTangentStageInputOutputDescriptorInfo.isActive = 1;
    self->_deformTangentStageInputOutputDescriptorInfo.bufferAttributeFormat = 31;
    self->_deformTangentStageInputOutputDescriptorInfo.bufferAttributeOffset = v178;
    self->_deformTangentStageInputOutputDescriptorInfo.bufferLayoutStride = v182;
  }
  v183 = (uint64_t)sub_1B1874BE0((uint64_t)a3, v30, v31, v32, v33, v34, v35, v36);
  v184 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v192 = (void *)objc_msgSend_initWithCapacity_(v184, v185, v183, v186);
  if (v183 >= 1)
  {
    for (i = 0; i != v183; ++i)
    {
      v194 = sub_1B1874C3C((uint64_t)a3, i, self->_finalDataKind, v187, v188, v189, v190, v191);
      v202 = sub_1B17A426C((uint64_t)v194, v195, v196, v197, v198, v199, v200, v201);
      if ((sub_1B189D25C(v202) & 1) != 0)
      {
        v204 = sub_1B18FAA70((uint64_t)self->_resourceManager, (uint64_t)v194);
        objc_msgSend_addObject_(v192, v205, (uint64_t)v204, v206);
      }
      else if (self->_finalDataKind | finalDataKind)
      {
        sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Only original data kind can have non 'GPU' primitive type"), v203, v187, v188, v189, v190, v191, (uint64_t)"_finalDataKind == kCFXMeshDataKindOriginal && subdivIsUsed");
      }
    }
  }
  v207 = self->_finalDataKind;
  if (self->_deformDataKind != (_DWORD)v207)
  {
    v208 = sub_1B1875540((uint64_t)a3, 0, 0, v207, v188, v189, v190, v191);
    self->_splatUniforms.maxIndex = sub_1B17EDAE0((uint64_t)v208, v209, v210, v211, v212, v213, v214, v215);
    v235 = 0;
    v219 = objc_msgSend_currentBlitEncoder(self, v216, v217, v218);
    objc_msgSend_deindexedToOriginalTableBufferWithBlitEncoder_indexSizeOut_(self, v220, v219, (uint64_t)&v235);
    v234 = v235;
    v221 = self->_deformTangentBuffer;
    v233 = self->_deformNormalBuffer != 0;
    v232 = v221 != 0;
    v222 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
    objc_msgSend_setConstantValue_type_atIndex_(v222, v223, (uint64_t)&v234, 33, 0);
    objc_msgSend_setConstantValue_type_atIndex_(v222, v224, (uint64_t)&v233, 53, 1);
    objc_msgSend_setConstantValue_type_atIndex_(v222, v225, (uint64_t)&v232, 53, 2);
    v228 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v226, (uint64_t)CFSTR("UInt%d-%d-%d"), v227, (8 * v234), v233, v232);
    self->_splatDeformedToFinalPipeline = (VFXMTLComputePipeline *)(id)objc_msgSend_computePipelineStateForKernel_constants_constantsHash_(self->_resourceManager, v229, (uint64_t)CFSTR("deformer_splat"), (uint64_t)v222, v228);

  }
  v230 = objc_alloc_init(VFXMTLMesh);
  self->_finalMesh = v230;
  sub_1B19558B8((uint64_t)v230, v231);
  sub_1B1955CEC(self->_finalMesh, (char *)v23);
  sub_1B1955D0C(self->_finalMesh, (char *)v192);
  sub_1B1955D88((uint64_t)self->_finalMesh, v239[3]);

  _Block_object_dispose(&v238, 8);
}

- (id)deindexedToOriginalTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  id result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  BOOL v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  unint64_t deindexedToOriginalTableBufferIndexSize;
  char *v40;
  char *v41;
  char *v42;
  unint64_t i;
  unsigned int v44;
  unint64_t v45;
  char *v46;
  unsigned int v47;

  if (self->_deindexedToOriginalTableBuffer)
  {
    *a4 = self->_deindexedToOriginalTableBufferIndexSize;
  }
  else
  {
    sub_1B1875540((uint64_t)self->_baseMesh, 0, 0, 1, v4, v5, v6, v7);
    v47 = 0;
    v11 = sub_1B18760B0((uint64_t)self->_baseMesh, &v47);
    result = (id)sub_1B1816084((uint64_t)self->_baseMesh);
    if (!result)
      return result;
    v17 = sub_1B1875540((uint64_t)self->_baseMesh, 0, 0, 0, v13, v14, v15, v16);
    v25 = sub_1B17EDAE0((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
    v26 = v47;
    v27 = v47 - 1;
    if ((int)(v47 - 1) < 0)
    {
      v30 = 8;
    }
    else
    {
      v28 = v27 >> 15;
      v29 = v27 > 0x7F;
      v30 = 1;
      if (v29)
        v30 = 2;
      if (v28)
        v30 = 4;
    }
    self->_deindexedToOriginalTableBufferIndexSize = v30;
    *a4 = v30;
    v45 = self->_deindexedToOriginalTableBufferIndexSize * v26;
    v31 = (char *)malloc_type_malloc(v45, 0xAB8D993uLL);
    v38 = v31;
    deindexedToOriginalTableBufferIndexSize = self->_deindexedToOriginalTableBufferIndexSize;
    if (deindexedToOriginalTableBufferIndexSize == 1)
      v40 = v31;
    else
      v40 = 0;
    if (deindexedToOriginalTableBufferIndexSize == 2)
      v41 = v31;
    else
      v41 = 0;
    if (deindexedToOriginalTableBufferIndexSize == 4)
      v42 = v31;
    else
      v42 = 0;
    v46 = v42;
    if (v47)
    {
      for (i = 0; i < v47; ++i)
      {
        v44 = *(_DWORD *)(v11 + 4 * i);
        if (v44 >= v25)
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. buffer overflow"), v32, v33, v34, v35, v36, v37, (uint64_t)"orig < originalVertexCount");
        if (v40)
        {
          v40[i] = v44;
        }
        else if (v41)
        {
          *(_WORD *)&v41[2 * i] = v44;
        }
        else
        {
          *(_DWORD *)&v46[4 * i] = v44;
        }
      }
    }
    self->_deindexedToOriginalTableBuffer = (MTLBuffer *)sub_1B18FBFCC((uint64_t)self->_resourceManager, v38, v45, a3);
    free(v38);
  }
  return self->_deindexedToOriginalTableBuffer;
}

- (id)deindexedToFirstDeindexedTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  id result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  BOOL v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t deindexedToFirstDeindexedTableBufferIndexSize;
  char *v40;
  char *v41;
  char *v42;
  unsigned int v43;
  unint64_t i;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  unint64_t v48;
  id v49;
  char *v50;
  unsigned int v51;

  if (self->_deindexedToFirstDeindexedTableBuffer)
  {
    *a4 = self->_deindexedToFirstDeindexedTableBufferIndexSize;
  }
  else
  {
    sub_1B1875540((uint64_t)self->_baseMesh, 0, 0, 1, v4, v5, v6, v7);
    v51 = 0;
    v11 = sub_1B18760B0((uint64_t)self->_baseMesh, &v51);
    result = (id)sub_1B1816084((uint64_t)self->_baseMesh);
    if (!result)
      return result;
    v17 = (unsigned int *)result;
    v49 = a3;
    v18 = sub_1B1875540((uint64_t)self->_baseMesh, 0, 0, 0, v13, v14, v15, v16);
    v26 = sub_1B17EDAE0((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
    v27 = v51;
    v28 = v51 - 1;
    if ((int)(v51 - 1) < 0)
    {
      v31 = 8;
    }
    else
    {
      v29 = v28 >> 15;
      v30 = v28 > 0x7F;
      v31 = 1;
      if (v30)
        v31 = 2;
      if (v29)
        v31 = 4;
    }
    self->_deindexedToFirstDeindexedTableBufferIndexSize = v31;
    *a4 = v31;
    v48 = self->_deindexedToFirstDeindexedTableBufferIndexSize * v27;
    v32 = (char *)malloc_type_malloc(v48, 0x66AA2CBCuLL);
    deindexedToFirstDeindexedTableBufferIndexSize = self->_deindexedToFirstDeindexedTableBufferIndexSize;
    if (deindexedToFirstDeindexedTableBufferIndexSize == 1)
      v40 = v32;
    else
      v40 = 0;
    if (deindexedToFirstDeindexedTableBufferIndexSize == 2)
      v41 = v32;
    else
      v41 = 0;
    v47 = v32;
    if (deindexedToFirstDeindexedTableBufferIndexSize == 4)
      v42 = v32;
    else
      v42 = 0;
    v50 = v42;
    v43 = v51;
    if (v51)
    {
      for (i = 0; i < v51; ++i)
      {
        v45 = *(unsigned int *)(v11 + 4 * i);
        v46 = v17[v45];
        if (v45 >= v26)
        {
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. buffer overflow"), v33, v34, v35, v36, v37, v38, (uint64_t)"orig < originalVertexCount");
          v43 = v51;
        }
        if (v46 >= v43)
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. buffer overflow"), v33, v34, v35, v36, v37, v38, (uint64_t)"prov < deindexedVertexCount");
        if (i == v46)
        {
          if (v40)
          {
            v40[i] = -1;
          }
          else if (v41)
          {
            *(_WORD *)&v41[2 * i] = -1;
          }
          else
          {
            *(_DWORD *)&v50[4 * i] = -1;
          }
        }
        else if (v40)
        {
          v40[i] = v46;
        }
        else if (v41)
        {
          *(_WORD *)&v41[2 * i] = v46;
        }
        else
        {
          *(_DWORD *)&v50[4 * i] = v46;
        }
        v43 = v51;
      }
    }
    self->_deindexedToFirstDeindexedTableBuffer = (MTLBuffer *)sub_1B18FBFCC((uint64_t)self->_resourceManager, v47, v48, v49);
    free(v47);
  }
  return self->_deindexedToFirstDeindexedTableBuffer;
}

- (id)originalToFirstDeindexedTableBufferWithBlitEncoder:(id)a3 indexSizeOut:(unint64_t *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  const char *v31;
  char *v32;
  unint64_t originalToFirstDeindexedTableBufferIndexSize;
  const char *v34;
  const char *v35;
  char *v36;
  char *v37;
  char *v38;
  int v39;
  int v40;

  if (self->_originalToFirstDeindexedTableBuffer)
  {
    *a4 = self->_originalToFirstDeindexedTableBufferIndexSize;
  }
  else
  {
    sub_1B1875540((uint64_t)self->_baseMesh, 0, 0, 1, v4, v5, v6, v7);
    result = (id)sub_1B1816084((uint64_t)self->_baseMesh);
    if (!result)
      return result;
    v16 = (int *)result;
    v17 = sub_1B1875540((uint64_t)self->_baseMesh, 0, 0, 0, v12, v13, v14, v15);
    v25 = sub_1B17EDAE0((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
    v26 = v25;
    v27 = 1;
    if (v25 - 1 > 0xFF)
      v27 = 2;
    v28 = 4;
    if (!((v25 - 1) >> 16))
      v28 = v27;
    self->_originalToFirstDeindexedTableBufferIndexSize = v28;
    *a4 = v28;
    v29 = v25;
    v30 = self->_originalToFirstDeindexedTableBufferIndexSize * v25;
    v31 = (const char *)malloc_type_malloc(v30, 0x127B04FCuLL);
    v32 = (char *)v31;
    originalToFirstDeindexedTableBufferIndexSize = self->_originalToFirstDeindexedTableBufferIndexSize;
    if (originalToFirstDeindexedTableBufferIndexSize == 1)
      v34 = v31;
    else
      v34 = 0;
    if (originalToFirstDeindexedTableBufferIndexSize == 2)
      v35 = v31;
    else
      v35 = 0;
    if (originalToFirstDeindexedTableBufferIndexSize == 4)
      v36 = (char *)v31;
    else
      v36 = 0;
    if (v26)
    {
      v37 = (char *)v35;
      v38 = (char *)v34;
      do
      {
        v40 = *v16++;
        v39 = v40;
        if (v34)
        {
          *v38 = v39;
        }
        else if (v35)
        {
          *(_WORD *)v37 = v39;
        }
        else
        {
          *(_DWORD *)v36 = v39;
        }
        ++v38;
        v37 += 2;
        v36 += 4;
        --v29;
      }
      while (v29);
    }
    self->_originalToFirstDeindexedTableBuffer = (MTLBuffer *)sub_1B18FBFCC((uint64_t)self->_resourceManager, v31, v30, a3);
    free(v32);
  }
  return self->_originalToFirstDeindexedTableBuffer;
}

- (id)newBufferForDataKind:(unsigned __int8)a3 meshSource:(__CFXMeshSource *)a4 dataType:(signed __int16)a5 forStageInputOutputDescriptor:(BOOL)a6 usePrivateStorageMode:(BOOL)a7 outStride:(unint64_t *)a8
{
  _BOOL4 v8;
  int v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  float32x4_t v42;
  float v43;
  float v44;
  uint64_t v45;
  unsigned int v46;
  int v47;
  int v48;
  uint64_t v49;
  float32x4_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t *v63;

  v8 = a6;
  v9 = a5;
  v12 = sub_1B17EDAE0((uint64_t)a4, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, (uint64_t)a8);
  v20 = sub_1B179E250(v9, v13, v14, v15, v16, v17, v18, v19);
  if (v8)
  {
    v21 = (void *)sub_1B18FD774((uint64_t)self->_resourceManager);
    if (sub_1B189EAD8(v21, v22, v23, v24))
      v20 = (v20 + 3) & 0xFFFFFFFFFFFFFFFCLL;
  }
  v63 = (uint64_t *)self;
  v25 = v20 * v12;
  v26 = (char *)malloc_type_malloc(v20 * v12, 0xA622EBE9uLL);
  v34 = sub_1B17ED6C4((uint64_t)a4, v27, v28, v29, v30, v31, v32, v33);
  if (v12)
  {
    v45 = v34;
    v46 = 0;
    v47 = BYTE4(v35);
    v48 = BYTE5(v35);
    v49 = (uint64_t)v26;
    do
    {
      *(double *)v50.i64 = sub_1B198D4F8(v47, (const float *)(v45 + v46), v36, v37, v38, v39, v40, v41, v42, v43, v44);
      sub_1B198D91C(v9, v49, v51, v52, v53, v54, v55, v56, v50);
      v49 += v20;
      v46 += v48;
      --v12;
    }
    while (v12);
  }
  v57 = v63[1];
  if (a7)
  {
    v58 = (void *)objc_msgSend_currentBlitEncoder(v63, v35, v36, v37);
    v59 = sub_1B18FBFCC(v57, v26, v25, v58);
  }
  else
  {
    v59 = sub_1B18FBF78(v63[1], v26, v25, 0);
  }
  v60 = (void *)v59;
  free(v26);
  if (a8)
    *a8 = v20;
  return v60;
}

- (id)newBufferForDataKind:(unsigned __int8)a3 positionSource:(__CFXMeshSource *)a4 normalSource:(__CFXMeshSource *)a5 positionDataType:(signed __int16)a6 normalDataType:(signed __int16)a7 forStageInputOutputDescriptor:(BOOL)a8 usePrivateStorageMode:(BOOL)a9 outStride:(unint64_t *)a10 outPositionOffset:(unint64_t *)a11 outNormalOffset:(unint64_t *)a12
{
  _BOOL4 v12;
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
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  unint64_t v48;
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
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  float32x4_t v64;
  float v65;
  float v66;
  __int16 v67;
  __CFXMeshSource *v68;
  const char *v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  int v73;
  int v74;
  uint64_t v75;
  int v76;
  float32x4_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  float32x4_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  char *v93;
  uint64_t v94;
  void *v95;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  const char *v100;
  uint64_t v101;
  unint64_t v102;
  int v103;
  unint64_t v104;
  int v105;

  v12 = a8;
  v103 = a7;
  v105 = a6;
  if (a3 == 1
    && a5
    && (v16 = sub_1B17EDAE0((uint64_t)a4, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8),
        v16 != sub_1B17EDAE0((uint64_t)a5, v17, v18, v19, v20, v21, v22, v23)))
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Can't create an interleaved buffer for the renderable topology, possible vector count mismatch between semantics"), a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, v97);
    return 0;
  }
  else
  {
    v24 = sub_1B17EDAE0((uint64_t)a4, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
    v32 = sub_1B179E250(v105, v25, v26, v27, v28, v29, v30, v31);
    v40 = sub_1B179E250(v103, v33, v34, v35, v36, v37, v38, v39);
    v41 = v40 + v32;
    if (v12)
    {
      v42 = v40;
      v43 = (void *)sub_1B18FD774((uint64_t)self->_resourceManager);
      v47 = sub_1B189EAD8(v43, v44, v45, v46);
      v48 = (v32 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      if (v47)
      {
        v32 = (v32 + 3) & 0xFFFFFFFFFFFFFFFCLL;
        v41 = (v42 + v48 + 3) & 0xFFFFFFFFFFFFFFFCLL;
      }
    }
    v98 = v41 * v24;
    v100 = (const char *)malloc_type_malloc(v41 * v24, 0xA38DB08EuLL);
    v63 = sub_1B17ED6C4((uint64_t)a4, v49, v50, v51, v52, v53, v54, v55);
    v67 = WORD2(v56);
    v102 = v32;
    v99 = (uint64_t *)self;
    v104 = v41;
    if (a5)
    {
      v68 = a5;
      v101 = sub_1B17ED6C4((uint64_t)a5, v56, v57, v58, v59, v60, v61, v62);
    }
    else
    {
      v68 = 0;
      v101 = 0;
      v69 = 0;
    }
    if (v24)
    {
      v70 = 0;
      v71 = 0;
      v72 = v67;
      v73 = HIBYTE(v67);
      v74 = BYTE4(v69);
      v75 = (uint64_t)v100;
      v76 = BYTE5(v69);
      do
      {
        *(double *)v77.i64 = sub_1B198D4F8(v72, (const float *)(v63 + v70), v57, v58, v59, v60, v61, v62, v64, v65, v66);
        sub_1B198D91C(v105, v75, v78, v79, v80, v81, v82, v83, v77);
        if (v68)
        {
          *(double *)v84.i64 = sub_1B198D4F8(v74, (const float *)(v101 + v71), v57, v58, v59, v60, v61, v62, v64, v65, v66);
          sub_1B198D91C(v103, v75 + v102, v85, v86, v87, v88, v89, v90, v84);
        }
        v75 += v104;
        v71 += v76;
        v70 += v73;
        --v24;
      }
      while (v24);
    }
    v91 = v99[1];
    if (a9)
    {
      v92 = (void *)objc_msgSend_currentBlitEncoder(v99, v69, v57, v58);
      v93 = (char *)v100;
      v94 = sub_1B18FBFCC(v91, v100, v98, v92);
    }
    else
    {
      v93 = (char *)v100;
      v94 = sub_1B18FBF78(v99[1], v100, v98, 0);
    }
    v95 = (void *)v94;
    free(v93);
    if (a10)
      *a10 = v104;
    if (a11)
      *a11 = 0;
    if (a12)
      *a12 = v102;
  }
  return v95;
}

- (MTLBlitCommandEncoder)currentBlitEncoder
{
  uint64_t v2;
  uint64_t v3;
  MTLBlitCommandEncoder *result;

  result = self->_currentInitResourceBlitEncoder;
  if (!result)
  {
    result = *(MTLBlitCommandEncoder **)objc_msgSend_resourceBlitEncoder(self->_currentInitRenderContext, a2, v2, v3);
    self->_currentInitResourceBlitEncoder = result;
  }
  return result;
}

- (MTLStageInputOutputDescriptor)stageInputDescriptor
{
  return self->_initialBuffersStageInputDescriptor;
}

- (void)reconfigureIfNeededWithContext:(id)a3 programHashCodeRequirements:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFXMesh *v18;
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
  uint64_t v32;
  int finalDataKind;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
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
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t i;
  _BOOL4 v70;
  _BOOL4 v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  unint64_t v80;
  char v81;
  unsigned int v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  VFXMTLDeformerStack *v91;
  uint64_t j;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t k;
  unint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  uint64_t v112;
  uint64_t m;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  uint64_t v118;
  VFXMTLDeformerStack *v119;
  int v120;
  const void *v121;
  uint64_t v122;
  _BOOL4 v123;
  _BOOL4 v124;
  unsigned int v125;
  char v126;
  int v127;
  unsigned __int8 v128;
  int v129;
  int v130;
  uint64_t v131;
  uint64_t v132;
  BOOL v133;
  uint64_t v134;
  uint64_t v135;
  int v136;
  int v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  int v141;
  int v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  const void *v146;
  VFXMTLMorphDeformer *morphDeformer;
  int v148;
  const void *v149;
  _DWORD *v150;
  _QWORD *v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  id v168;
  const char *v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  id v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t n;
  void *v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  const char *v193;
  VFXModelDeformerInstanceWrapper *v194;
  _QWORD *v195;
  const char *v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  const void *v200;
  VFXMTLSmoothNormalsDeformer *smoothNormalsDeformer;
  MTLBuffer *finalTangentBuffer;
  MTLBuffer *finalNormalBuffer;
  _BOOL4 v204;
  int v205;
  uint64_t v206;
  __CFXMesh *baseMesh;
  uint64_t v208;
  uint64_t v209;
  int v210;
  int v211;
  uint64_t v212;
  VFXMTLDeformerStack *v213;
  const void *v214;
  _BOOL4 v215;
  id *v216;
  _BYTE __dst[384];
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  _OWORD __src[24];
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  _BYTE v239[128];
  _BYTE v240[128];
  _BYTE v241[128];
  _BYTE v242[128];
  _BYTE v243[128];
  uint64_t v244;

  v8 = *(_DWORD *)&a4.var0;
  v244 = *MEMORY[0x1E0C80C00];
  if (self->_isValid && (!a4.var0 || self->_finalTangentBuffer))
    return;
  self->_currentInitRenderContext = (VFXMTLRenderContext *)a3;
  v10 = sub_1B1998924((uint64_t)self->_deformers, (uint64_t)a2, (uint64_t)a3, *(uint64_t *)&a4.var0, v4, v5, v6, v7);
  v18 = (__CFXMesh *)sub_1B17A0848(v10, v11, v12, v13, v14, v15, v16, v17);
  v206 = sub_1B193E568((uint64_t)v18, v19, v20, v21, v22, v23, v24, v25);
  if (!v206)
    v206 = sub_1B193E568(v10, v26, v27, v28, v29, v30, v31, v32);
  baseMesh = self->_baseMesh;
  if (baseMesh != v18)
    self->_baseMesh = v18;
  finalDataKind = self->_finalDataKind;
  v34 = sub_1B1998A28((uint64_t)self->_deformers, v26, v27, v28, v29, v30, v31, v32);
  v49 = sub_1B1998B4C((uint64_t)self->_deformers, v35, v36, v37, v38, v39, v40, v41);
  v199 = v10;
  if (v49)
  {
    sub_1B1998924((uint64_t)self->_deformers, v42, v43, v44, v45, v46, v47, v48);
    v215 = !sub_1B18E4B20(v49);
  }
  else
  {
    v215 = 0;
  }
  v50 = (void *)sub_1B1998C64((uint64_t)self->_deformers, v42, v43, v44, v45, v46, v47, v48);
  v57 = objc_msgSend_count(v50, v51, v52, v53);
  v204 = v34 == 0;
  if (v34)
    v58 = objc_msgSend_requiredInputs(VFXMTLMorphDeformer, v54, v55, v56);
  else
    v58 = 0;
  v213 = self;
  if (v215)
    v58 |= objc_msgSend_requiredInputs(VFXMTLSkinDeformer, v54, v55, v56);
  v208 = v57;
  v238 = 0u;
  v237 = 0u;
  v236 = 0u;
  v235 = 0u;
  v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v54, (uint64_t)&v235, (uint64_t)v243, 16);
  if (v59)
  {
    v67 = v59;
    v68 = *(_QWORD *)v236;
    do
    {
      for (i = 0; i != v67; ++i)
      {
        if (*(_QWORD *)v236 != v68)
          objc_enumerationMutation(v50);
        LODWORD(v58) = objc_msgSend_requiredInputs(*(void **)(*((_QWORD *)&v235 + 1) + 8 * i), v60, v61, v62) | v58;
      }
      v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v60, (uint64_t)&v235, (uint64_t)v243, 16);
    }
    while (v67);
  }
  v70 = finalDataKind != 0;
  v71 = sub_1B18756B0((uint64_t)v18, 1, 0, 0, v63, v64, v65, v66);
  finalNormalBuffer = v213->_finalNormalBuffer;
  v79 = v8 | sub_1B18756B0((uint64_t)v18, 4, 0, 0, v72, v73, v74, v75);
  finalTangentBuffer = v213->_finalTangentBuffer;
  v214 = (const void *)v34;
  if (v34)
  {
    v80 = sub_1B194BF48((uint64_t)VFXMTLMorphDeformer, v34);
    v81 = v80;
  }
  else
  {
    v80 = 0;
    v81 = -1;
  }
  v82 = v71 | (v58 >> 1);
  v83 = v79 | (v58 >> 2);
  if (v215)
  {
    v84 = objc_msgSend_supportedOutputs(VFXMTLSkinDeformer, v76, v77, v78);
    v80 |= v84;
    v81 &= v84;
  }
  v212 = v82 & v70;
  v211 = v83 & v70;
  v234 = 0u;
  v233 = 0u;
  v232 = 0u;
  v231 = 0u;
  v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v76, (uint64_t)&v231, (uint64_t)v242, 16);
  if (v85)
  {
    v89 = v85;
    v90 = *(_QWORD *)v232;
    v91 = v213;
    do
    {
      for (j = 0; j != v89; ++j)
      {
        if (*(_QWORD *)v232 != v90)
          objc_enumerationMutation(v50);
        v93 = objc_msgSend_supportedOutputs(*(void **)(*((_QWORD *)&v231 + 1) + 8 * j), v86, v87, v88);
        v80 |= v93;
        v81 &= v93;
      }
      v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v86, (uint64_t)&v231, (uint64_t)v242, 16);
    }
    while (v89);
  }
  else
  {
    v91 = v213;
  }
  v210 = v212 & ((v81 & 2) == 0);
  v94 = 3;
  if (v210)
    v94 = 1;
  if (!(_DWORD)v212)
    v94 = 1;
  if (v211)
    v95 = v94 | 4;
  else
    v95 = v94;
  if (v214)
  {
    v96 = objc_msgSend_requiredOutputs(VFXMTLMorphDeformer, v86, v87, v88);
    v95 |= v96;
    v97 = (v96 >> 3) & 1;
  }
  else
  {
    LODWORD(v97) = 0;
  }
  if (v215)
  {
    v98 = objc_msgSend_requiredOutputs(VFXMTLSkinDeformer, v86, v87, v88);
    v95 |= v98;
    LODWORD(v97) = (v98 >> 3) & 1 | v97;
  }
  v200 = (const void *)v49;
  v230 = 0u;
  v229 = 0u;
  v228 = 0u;
  v227 = 0u;
  v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v86, (uint64_t)&v227, (uint64_t)v241, 16);
  if (v99)
  {
    v103 = v99;
    v104 = *(_QWORD *)v228;
    do
    {
      for (k = 0; k != v103; ++k)
      {
        if (*(_QWORD *)v228 != v104)
          objc_enumerationMutation(v50);
        v106 = objc_msgSend_requiredOutputs(*(void **)(*((_QWORD *)&v227 + 1) + 8 * k), v100, v101, v102);
        v95 |= v106;
        LODWORD(v97) = (v106 >> 3) & 1 | v97;
      }
      v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v100, (uint64_t)&v227, (uint64_t)v241, 16);
    }
    while (v103);
  }
  v209 = (uint64_t)v18;
  smoothNormalsDeformer = v91->_smoothNormalsDeformer;
  v223 = 0u;
  v224 = 0u;
  v225 = 0u;
  v226 = 0u;
  v107 = (void *)sub_1B1955D00((uint64_t)v91->_finalMesh);
  v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v108, (uint64_t)&v223, (uint64_t)v240, 16);
  if (v109)
  {
    v110 = v109;
    v111 = 0;
    v112 = *(_QWORD *)v224;
    do
    {
      for (m = 0; m != v110; ++m)
      {
        if (*(_QWORD *)v224 != v112)
          objc_enumerationMutation(v107);
        v111 |= v97 ^ (sub_1B1955CE0(*(_QWORD *)(*((_QWORD *)&v223 + 1) + 8 * m)) != 0);
      }
      v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v107, v114, (uint64_t)&v223, (uint64_t)v240, 16);
    }
    while (v110);
  }
  else
  {
    LOBYTE(v111) = 0;
  }
  v115 = 0;
  if (v208)
    v116 = 1;
  else
    v116 = v215;
  if ((_DWORD)v212 == (v210 & 1))
  {
    v117 = v204;
    LODWORD(v118) = v204;
    v119 = v213;
  }
  else
  {
    v117 = v204;
    LODWORD(v118) = v204;
    v119 = v213;
    if ((v81 & 2) == 0)
    {
      v118 = (v80 >> 1) & 1;
      if (!v214)
        LODWORD(v118) = 1;
      v115 = ((v80 & 2) << 7) ^ 0x100;
    }
  }
  v120 = v211;
  if ((v81 & 4) != 0)
    v120 = 0;
  if (v120 == 1)
  {
    v121 = v214;
    if (v214)
      v117 = (v80 >> 2) & 1;
    else
      v117 = 1;
    v122 = ((v80 & 4) << 22) ^ 0x1000000;
  }
  else
  {
    v122 = 0;
    v121 = v214;
  }
  v123 = finalTangentBuffer != 0;
  v124 = v121 == 0;
  v125 = (finalNormalBuffer != 0) ^ v212;
  if (baseMesh == (__CFXMesh *)v209)
    v126 = (finalNormalBuffer != 0) ^ v212;
  else
    v126 = 1;
  v127 = v123 ^ v211;
  v128 = v126 | v123 ^ v211;
  v129 = v116 ^ (v119->_initialBuffersStageInputDescriptor != 0);
  v130 = v124 ^ (v119->_morphDeformer == 0);
  if ((v128 & 1) != 0 || (v129 & 1) != 0 || v130)
  {
    v131 = 0x10000000000;
    if (!v117)
      v131 = 0;
    v132 = 0x100000000;
    if ((v211 & v116) == 0)
      v132 = 0;
    v133 = (_DWORD)v118 == 0;
    v134 = 0x1000000;
    if (v133)
      v134 = 0;
    v135 = 0x10000;
    if ((v212 & v116) == 0)
      v135 = 0;
    v205 = v127;
    v136 = v116 ^ (v119->_initialBuffersStageInputDescriptor != 0);
    v137 = v124 ^ (v119->_morphDeformer == 0);
    v138 = v115;
    v139 = v122;
    objc_msgSend_setupInitialBuffersWithBaseMesh_entityName_info_(v119, (const char *)v122, v209, v206, v116 | ((unint64_t)(v214 == 0) << 8) | v135 | v132 | v134 | v131);
    v122 = v139;
    v115 = v138;
    v130 = v137;
    v129 = v136;
    v125 = (finalNormalBuffer != 0) ^ v212;
    v127 = v205;
  }
  if (((v128 | v111) & 1) != 0)
  {
    v140 = 0x10000;
    if (!v211)
      v140 = 0;
    objc_msgSend_setupFinalMeshWithMesh_entityName_info_usingDrawIndirect_(v119, (const char *)v122, v209, v206, v140 | v212 | v115 | v122, v97 & 1);
  }
  if ((const void *)sub_1B18FD774((uint64_t)v119->_morphDeformer) == v214)
    v141 = v125;
  else
    v141 = 1;
  v142 = v210 ^ (smoothNormalsDeformer != 0);
  if (((v141 | v127) & 1) != 0 || (v142 & 1) != 0)
  {
    v144 = (uint64_t)v213;
    morphDeformer = v213->_morphDeformer;
    v145 = v208;
    if (morphDeformer)
    {
      CFRelease(morphDeformer);
      v213->_morphDeformer = 0;
    }
    v146 = v200;
    if (v214)
      v213->_morphDeformer = (VFXMTLMorphDeformer *)sub_1B194BF9C([VFXMTLMorphDeformer alloc], v214, v95, v213->_deformDataKind, (uint64_t)v213->_resourceManager, (uint64_t)v213);
  }
  else
  {
    v143 = v129 | v130;
    v144 = (uint64_t)v213;
    v145 = v208;
    v146 = v200;
    if (v143 == 1)
      sub_1B194C100((uint64_t)v213->_morphDeformer);
  }
  if ((const void *)sub_1B18FD774(*(_QWORD *)(v144 + 744)) == v146)
    v148 = v125;
  else
    v148 = 1;
  if (((v148 | v127 | v142) & 1) != 0)
  {
    v149 = *(const void **)(v144 + 744);
    if (v149)
    {
      CFRelease(v149);
      *(_QWORD *)(v144 + 744) = 0;
    }
    if (v215)
      *(_QWORD *)(v144 + 744) = sub_1B198DFB4([VFXMTLSkinDeformer alloc], v146, v199, v95, *(_BYTE *)(v144 + 41), *(_QWORD *)(v144 + 8), v144);
  }
  if ((v210 & 1) == 0)
  {

    v150 = 0;
    goto LABEL_125;
  }
  if (baseMesh != (__CFXMesh *)v209)
  {

    v150 = sub_1B18730CC([VFXMTLSmoothNormalsDeformer alloc], v209, *(unsigned __int8 *)(v144 + 40), *(void **)(v144 + 8), (void *)v144);
LABEL_125:
    *(_QWORD *)(v144 + 752) = v150;
  }
  v151 = (_QWORD *)(v144 + 400);

  *(_QWORD *)(v144 + 760) = 0;
  v152 = *(_OWORD *)(v144 + 248);
  __src[0] = *(_OWORD *)(v144 + 232);
  __src[1] = v152;
  __src[2] = __src[0];
  __src[3] = v152;
  v153 = *(_OWORD *)(v144 + 280);
  __src[4] = *(_OWORD *)(v144 + 264);
  __src[5] = v153;
  __src[6] = __src[4];
  __src[7] = v153;
  v154 = *(_OWORD *)(v144 + 312);
  __src[8] = *(_OWORD *)(v144 + 296);
  __src[9] = v154;
  __src[10] = __src[8];
  __src[11] = v154;
  memset(&__src[12], 0, 192);
  if (v145)
  {
    v216 = sub_1B193E758(*(id **)(v144 + 24));
    v159 = sub_1B1875540(v209, 0, 0, *(unsigned __int8 *)(v144 + 41), v155, v156, v157, v158);
    v167 = sub_1B17EDAE0((uint64_t)v159, v160, v161, v162, v163, v164, v165, v166);
    v168 = objc_alloc(MEMORY[0x1E0CB3748]);
    v170 = (void *)objc_msgSend_initWithKeyOptions_valueOptions_capacity_(v168, v169, 258, 0, v145);
    if (objc_msgSend_count(v50, v171, v172, v173))
    {
      v174 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v178 = objc_msgSend_count(v50, v175, v176, v177);
      *(_QWORD *)(v144 + 760) = objc_msgSend_initWithCapacity_(v174, v179, v178, v180);
      v218 = 0u;
      v219 = 0u;
      v220 = 0u;
      v221 = 0u;
      v182 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v181, (uint64_t)&v218, (uint64_t)v239, 16);
      if (v182)
      {
        v185 = v182;
        v186 = *(_QWORD *)v219;
        do
        {
          for (n = 0; n != v185; ++n)
          {
            if (*(_QWORD *)v219 != v186)
              objc_enumerationMutation(v50);
            v188 = *(void **)(*((_QWORD *)&v218 + 1) + 8 * n);
            v189 = objc_msgSend_objectForKey_(*(void **)(v144 + 768), v183, (uint64_t)v188, v184);
            if (v189)
            {
              v192 = v189;
              objc_msgSend_addObject_(*(void **)(v144 + 760), v190, v189, v191);
              objc_msgSend_setObject_forKey_(v170, v193, v192, (uint64_t)v188);
            }
            else
            {
              v194 = [VFXModelDeformerInstanceWrapper alloc];
              memcpy(__dst, __src, sizeof(__dst));
              v195 = sub_1B1871E0C(v194, v144, v188, (uint64_t)v216, v95, v167, __dst);
              objc_msgSend_addObject_(*(void **)(v144 + 760), v196, (uint64_t)v195, v197);
              objc_msgSend_setObject_forKey_(v170, v198, (uint64_t)v195, (uint64_t)v188);

            }
          }
          v185 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v183, (uint64_t)&v218, (uint64_t)v239, 16);
        }
        while (v185);
      }
    }

    *(_QWORD *)(v144 + 768) = v170;
    v151 = (_QWORD *)(v144 + 400);
  }
  else
  {

    *(_QWORD *)(v144 + 768) = 0;
  }
  *(_BYTE *)(v144 + 42) = 1;
  *v151 = 0;
  v151[1] = 0;
}

- (unint64_t)currentFrameHash
{
  uint64_t v2;
  uint64_t v3;
  VFXMTLRenderContext *currentUpdateRenderContext;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  currentUpdateRenderContext = self->_currentUpdateRenderContext;
  v5 = objc_msgSend_engineContext(currentUpdateRenderContext, a2, v2, v3);
  v6 = sub_1B1815800(v5);
  v10 = objc_msgSend_currentFrameIndex(currentUpdateRenderContext, v7, v8, v9);
  v11 = 0x9DDFEA08EB382D69
      * (v10 ^ ((0x9DDFEA08EB382D69 * (v10 ^ (unint64_t)currentUpdateRenderContext)) >> 47) ^ (0x9DDFEA08EB382D69 * (v10 ^ (unint64_t)currentUpdateRenderContext)));
  v12 = 0xC6A4A7935BD1E995
      * ((0xC6A4A7935BD1E995
        * ((0xC6A4A7935BD1E995 * *(_QWORD *)&v6) ^ ((0xC6A4A7935BD1E995 * *(_QWORD *)&v6) >> 47))) ^ 0x35253C9ADE8F4CA8 ^ (0x9DDFEA08EB382D69 * (v11 ^ (v11 >> 47))));
  return (0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) ^ ((0xC6A4A7935BD1E995 * (v12 ^ (v12 >> 47))) >> 47);
}

- (__n128)currentTransforms
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;

  v2 = *(_OWORD *)(a1 + 560);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 544);
  *(_OWORD *)(a2 + 144) = v2;
  v3 = *(_OWORD *)(a1 + 592);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 576);
  *(_OWORD *)(a2 + 176) = v3;
  v4 = *(_OWORD *)(a1 + 496);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 480);
  *(_OWORD *)(a2 + 80) = v4;
  v5 = *(_OWORD *)(a1 + 528);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 512);
  *(_OWORD *)(a2 + 112) = v5;
  v6 = *(_OWORD *)(a1 + 432);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 416);
  *(_OWORD *)(a2 + 16) = v6;
  result = *(__n128 *)(a1 + 448);
  v8 = *(_OWORD *)(a1 + 464);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v8;
  return result;
}

- (__n128)_currentFrustumInfo
{
  __int128 v2;
  __int128 v3;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 688);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 672);
  *(_OWORD *)(a2 + 80) = v2;
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 704);
  v3 = *(_OWORD *)(a1 + 624);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 608);
  *(_OWORD *)(a2 + 16) = v3;
  result = *(__n128 *)(a1 + 656);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 640);
  *(__n128 *)(a2 + 48) = result;
  return result;
}

- (VFXMTLComputeCommandEncoder)currentComputeEncoder
{
  uint64_t v2;
  uint64_t v3;
  VFXMTLComputeCommandEncoder *result;
  VFXMTLComputeCommandEncoder *v6;
  const char *v7;
  uint64_t v8;

  result = self->_currentUpdateComputeCommandEncoder;
  if (!result)
  {
    v6 = (VFXMTLComputeCommandEncoder *)objc_msgSend_resourceComputeEncoder(self->_currentUpdateRenderContext, a2, v2, v3);
    self->_currentUpdateComputeCommandEncoder = v6;
    objc_msgSend_pushDebugGroup_(v6->_encoder, v7, (uint64_t)CFSTR("VFX: Deformers"), v8);
    return self->_currentUpdateComputeCommandEncoder;
  }
  return result;
}

- (void)setStageInputOutputBuffersToEncoder:(VFXMTLComputeCommandEncoder *)a3
{
  const char *v5;
  const char *v6;

  objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, a2, (uint64_t)self->_initialPositionBuffer, 0, 10);
  objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, v5, (uint64_t)self->_initialNormalBuffer, 0, 11);
  objc_msgSend_setBuffer_offset_atIndex_(a3->_encoder, v6, (uint64_t)self->_initialTangentBuffer, 0, 12);
}

@end
