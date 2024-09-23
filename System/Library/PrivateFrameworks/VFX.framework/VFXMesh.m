@implementation VFXMesh

- (uint64_t)__createCFObject
{
  uint64_t v0;
  const __CFAllocator *v1;
  const CFArrayCallBacks *v2;

  if (qword_1ED4CED50 != -1)
    dispatch_once(&qword_1ED4CED50, &unk_1E63D0D70);
  v0 = sub_1B179CB90(qword_1ED4CED58, 0xC8uLL);
  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v2 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  *(_QWORD *)(v0 + 64) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  *(_QWORD *)(v0 + 96) = CFArrayCreateMutable(v1, 0, v2);
  *(_QWORD *)(v0 + 112) = 0;
  *(_QWORD *)(v0 + 144) = 0;
  *(_BYTE *)(v0 + 200) = *(_BYTE *)(v0 + 200) & 0x87 | 0x18;
  sub_1B1873C04(v0, v0 + 64);
  return v0;
}

- (id)debugQuickLookObjectWithAssetPathResolver:(id)a3
{
  uint64_t v3;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = (id)objc_msgSend_copy(self, a2, (uint64_t)a3, v3);
  v8 = objc_msgSend_modelWithMesh_(VFXModel, v6, (uint64_t)v5, v7);
  v11 = objc_msgSend_nodeWithModel_(VFXNode, v9, v8, v10);
  return (id)MEMORY[0x1E0DE7D20](v11, sel_debugQuickLookObjectWithAssetPathResolver_, a3, v12);
}

- (id)debugQuickLookObject
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = (void *)objc_msgSend_world(self, a2, v2, v3);
  v9 = objc_msgSend_assetPathResolver(v5, v6, v7, v8);
  return (id)MEMORY[0x1E0DE7D20](self, sel_debugQuickLookObjectWithAssetPathResolver_, v9, v10);
}

- (id)debugQuickLookData
{
  uint64_t v2;
  uint64_t v3;
  UIImage *v4;

  v4 = (UIImage *)objc_msgSend_debugQuickLookObject(self, a2, v2, v3);
  return UIImagePNGRepresentation(v4);
}

- (id)_meshByUnifyingNormalsWithCreaseThreshold:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  double v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  _QWORD v83[5];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v7 = (void *)objc_msgSend_meshElements(self, a2, v3, v4);
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v84, (uint64_t)v88, 16);
  if (v9)
  {
    v13 = v9;
    v14 = *(_QWORD *)v85;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v85 != v14)
          objc_enumerationMutation(v7);
        if (objc_msgSend_primitiveType(*(void **)(*((_QWORD *)&v84 + 1) + 8 * v15), v10, v11, v12) == 4)
        {
          v54 = (id)objc_msgSend_copy(self, v10, v11, v12);
          v67 = objc_msgSend_meshRef(v54, v64, v65, v66);
          if (v67)
          {
            v75 = (const void *)sub_1B18741B0(v67, v68, v69, v70, v71, v72, v73, v74);
            sub_1B17B198C((uint64_t)v75, (uint64_t)v75, 1, 1, v76, v77, v78, v79);
            v54 = (id)objc_msgSend_meshWithMeshRef_(VFXMesh, v80, (uint64_t)v75, v81);
            if (v75)
              CFRelease(v75);
          }
          return v54;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v84, (uint64_t)v88, 16);
      if (v13)
        continue;
      break;
    }
  }
  v16 = (void *)objc_msgSend_meshSources(self, v10, v11, v12);
  v17 = (void *)MEMORY[0x1E0C99DE8];
  v21 = objc_msgSend_count(v16, v18, v19, v20);
  v24 = objc_msgSend_arrayWithCapacity_(v17, v22, v21 - 1, v23);
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = sub_1B18ECC28;
  v83[3] = &unk_1E63D6788;
  v83[4] = v24;
  objc_msgSend_enumerateObjectsUsingBlock_(v16, v25, (uint64_t)v83, v26);
  v30 = objc_msgSend_meshElements(self, v27, v28, v29);
  v32 = objc_msgSend_meshWithSources_elements_(VFXMesh, v31, v24, v30);
  v33 = (void *)MEMORY[0x1E0CC77B0];
  v36 = objc_msgSend_modelWithMesh_(VFXModel, v34, v32, v35);
  v39 = (void *)objc_msgSend_meshWithVFXModel_(v33, v37, v36, v38);
  *(float *)&v40 = a3;
  objc_msgSend_addNormalsWithAttributeNamed_creaseThreshold_(v39, v41, (uint64_t)CFSTR("normals"), v42, v40);
  objc_msgSend_begin(VFXTransaction, v43, v44, v45);
  objc_msgSend_setImmediateMode_(VFXTransaction, v46, 1, v47);
  v50 = (void *)objc_msgSend_modelWithMDLMesh_(VFXModel, v48, (uint64_t)v39, v49);
  v54 = (id)objc_msgSend_mesh(v50, v51, v52, v53);
  v58 = objc_msgSend_name(self, v55, v56, v57);
  objc_msgSend_setName_(v54, v59, v58, v60);
  objc_msgSend_commitImmediate(VFXTransaction, v61, v62, v63);
  return v54;
}

- (id)_meshByRemovingSkinnerSources
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
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
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;

  v5 = objc_msgSend_meshRef(self, a2, v2, v3);
  v13 = sub_1B18741B0(v5, v6, v7, v8, v9, v10, v11, v12);
  sub_1B187589C(v13, 5, v14, v15, v16, v17, v18, v19);
  sub_1B187589C(v13, 6, v20, v21, v22, v23, v24, v25);
  v28 = (void *)objc_msgSend_meshWithMeshRef_(VFXMesh, v26, v13, v27);
  v32 = objc_msgSend_name(self, v29, v30, v31);
  objc_msgSend_setName_(v28, v33, v32, v34);
  return v28;
}

- (void)_discardOriginalTopology
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
  const char *v12;
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
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend_meshRef(self, a2, v2, v3);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v9 = (void *)objc_msgSend_meshSources(self, v6, v7, v8);
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v48, (uint64_t)v53, 16);
  if (v11)
  {
    v15 = v11;
    v16 = *(_QWORD *)v49;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v49 != v16)
          objc_enumerationMutation(v9);
        v18 = objc_msgSend_meshSource(*(void **)(*((_QWORD *)&v48 + 1) + 8 * v17), v12, v13, v14);
        if (v18)
          sub_1B193E768(v18, 0, v13, v14, v19, v20, v21, v22);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v48, (uint64_t)v53, 16);
    }
    while (v15);
  }
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v23 = (void *)objc_msgSend_meshElements(self, v12, v13, v14, 0);
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v44, (uint64_t)v52, 16);
  if (v25)
  {
    v33 = v25;
    v34 = *(_QWORD *)v45;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v45 != v34)
          objc_enumerationMutation(v23);
        v36 = objc_msgSend_meshElement(*(void **)(*((_QWORD *)&v44 + 1) + 8 * v35), v26, v27, v28);
        if (v36)
          sub_1B193E768(v36, 0, v27, v28, v37, v38, v39, v40);
        ++v35;
      }
      while (v33 != v35);
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v44, (uint64_t)v52, 16);
    }
    while (v33);
  }
  sub_1B18BA2D4(v5, 0, v27, v28, v29, v30, v31, v32);
  objc_msgSend__releaseCachedSourcesAndElements(self, v41, v42, v43);
}

- (id)_meshByWeldingVerticesWithThreshold:(float)a3 normalThreshold:(float)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *Object;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  size_t v25;
  char *v26;
  unint64_t *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t *v31;
  unint64_t i;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  float32x4_t v46;
  uint64_t v47;
  uint64_t v48;
  float v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  float32x4_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  const char *v101;
  unint64_t j;
  unint64_t v103;
  unint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t k;
  void *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  size_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  char *v143;
  char *v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  unint64_t v172;
  uint64_t v173;
  size_t v174;
  unint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  unint64_t v179;
  uint64_t m;
  void *v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  size_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  char *v210;
  unint64_t v211;
  BOOL v212;
  const char *v213;
  unint64_t v214;
  unint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  const void *v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
  uint64_t v239;
  void *v241;
  char *v242;
  id obj;
  id v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  char *v248;
  void *v249;
  float32x4_t v250;
  void *v251;
  uint64_t v252;
  float32x4_t v253;
  uint64_t v254;
  float __dst;
  char *__dsta;
  char *__dstb;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  _BYTE v269[128];
  _BYTE v270[128];
  uint64_t v271;

  v7 = self;
  v271 = *MEMORY[0x1E0C80C00];
  v8 = (void *)objc_msgSend_meshSourcesForSemantic_(self, a2, (uint64_t)CFSTR("kGeometrySourceSemanticPosition"), v4);
  Object = (void *)objc_msgSend_firstObject(v8, v9, v10, v11);
  v15 = (void *)objc_msgSend_meshSourcesForSemantic_(v7, v13, (uint64_t)CFSTR("kGeometrySourceSemanticNormal"), v14);
  v19 = (void *)objc_msgSend_firstObject(v15, v16, v17, v18);
  objc_msgSend_meshSourcesForSemantic_(v7, v20, (uint64_t)CFSTR("kGeometrySourceSemanticTexcoord"), v21);
  v25 = objc_msgSend_vectorCount(Object, v22, v23, v24);
  v26 = (char *)malloc_type_malloc(8 * v25, 0x100004000313F17uLL);
  v27 = (unint64_t *)malloc_type_malloc(8 * v25, 0x100004000313F17uLL);
  v31 = v27;
  if (v25)
  {
    for (i = 0; i != v25; ++i)
    {
      *(_QWORD *)&v26[8 * i] = i;
      v27[i] = i;
    }
  }
  v33 = (void *)objc_msgSend_data(Object, v28, v29, v30);
  v266 = objc_msgSend_bytes(v33, v34, v35, v36);
  v267 = objc_msgSend_dataOffset(Object, v37, v38, v39);
  v268 = objc_msgSend_dataStride(Object, v40, v41, v42);
  qsort_r(v26, v25, 8uLL, &v266, (int (__cdecl *)(void *, const void *, const void *))sub_1B18ED794);
  if (v25)
  {
    v241 = v7;
    v242 = v26;
    v47 = 0;
    v48 = 0;
    v49 = a4 + a4;
    v248 = v26 + 8;
    do
    {
      v50 = *(_QWORD *)&v26[8 * v47];
      if (v31[v50] == v50)
      {
        v51 = v266 + v267 + v268 * v50;
        v46.i64[0] = *(_QWORD *)v51;
        LODWORD(__dst) = *(_QWORD *)v51;
        v46.i32[2] = *(_DWORD *)(v51 + 8);
        v253 = v46;
        v52 = (void *)objc_msgSend_data(v19, v43, v44, v45);
        v56 = objc_msgSend_bytes(v52, v53, v54, v55);
        v60 = objc_msgSend_dataOffset(v19, v57, v58, v59);
        v64 = objc_msgSend_dataStride(v19, v61, v62, v63);
        v65.i64[0] = *(_QWORD *)(v56 + v64 * v50 + v60);
        v65.i32[2] = *(_DWORD *)(v56 + v60 + 8 + v64 * v50);
        v250 = v65;
        v69 = objc_msgSend_vectorCount(v19, v66, v67, v68);
        v70 = v47 + 1;
        if (v47 + 1 >= v69)
        {
          v71 = 0;
        }
        else
        {
          v71 = 0;
          v72 = v266;
          v73 = ~v47 + v69;
          v74 = &v248[8 * v47];
          do
          {
            v76 = *(_QWORD *)v74;
            v74 += 8;
            v75 = v76;
            if (v31[v76] == v76)
            {
              v77 = v267 + v268 * v75;
              v46.i32[0] = *(_DWORD *)(v72 + v77);
              if (vabds_f32(__dst, v46.f32[0]) > a3)
                break;
              v78 = v77 + v72;
              v46.i32[1] = *(_DWORD *)(v78 + 4);
              v46.i32[2] = *(_DWORD *)(v78 + 8);
              v79 = vsubq_f32(v253, v46);
              v80 = vmulq_f32(v79, v79);
              v46 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v80, 2), vaddq_f32(v80, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v80.f32, 1)));
              if (sqrtf(v46.f32[0]) <= a3)
              {
                v46.i64[0] = *(_QWORD *)(v56 + v75 * v64 + v60);
                v46.i32[2] = *(_DWORD *)(v56 + v60 + 8 + v75 * v64);
                v81 = vmulq_f32(v250, v46);
                v46 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v81, 2), vaddq_f32(v81, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v81.f32, 1)));
                if ((float)(1.0 - v46.f32[0]) <= v49)
                {
                  v31[v75] = v50;
                  ++v71;
                }
              }
            }
            --v73;
          }
          while (v73);
        }
        v26 = v242;
      }
      else
      {
        v71 = 0;
        v70 = v47 + 1;
      }
      v48 += v71;
      v47 = v70;
    }
    while (v70 != v25);
    if (v48)
    {
      v82 = (void *)objc_msgSend_meshSources(v241, v43, v44, v45);
      v86 = (void *)objc_msgSend_meshElements(v241, v83, v84, v85);
      v87 = (void *)MEMORY[0x1E0C99DE8];
      obj = v82;
      v91 = objc_msgSend_count(v82, v88, v89, v90);
      v251 = (void *)objc_msgSend_arrayWithCapacity_(v87, v92, v91, v93);
      v94 = (void *)MEMORY[0x1E0C99DE8];
      v244 = v86;
      v98 = objc_msgSend_count(v86, v95, v96, v97);
      v249 = (void *)objc_msgSend_arrayWithCapacity_(v94, v99, v98, v100);
      for (j = 0; j != v25; ++j)
      {
        v103 = v31[j];
        do
        {
          v104 = v103;
          v103 = v31[v103];
        }
        while (v104 > v103);
        v31[j] = v104;
        if (v104 > j && v31[v104] == v104)
        {
          v31[v104] = j;
          v31[j] = j;
        }
      }
      v264 = 0u;
      v265 = 0u;
      v262 = 0u;
      v263 = 0u;
      v246 = v48;
      v254 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v101, (uint64_t)&v262, (uint64_t)v270, 16);
      if (v254)
      {
        v245 = *(_QWORD *)v263;
        do
        {
          for (k = 0; k != v254; ++k)
          {
            if (*(_QWORD *)v263 != v245)
              objc_enumerationMutation(obj);
            v113 = *(void **)(*((_QWORD *)&v262 + 1) + 8 * k);
            v114 = objc_msgSend_bytesPerComponent(v113, v105, v106, v107);
            v118 = objc_msgSend_componentsPerVector(v113, v115, v116, v117) * v114;
            v122 = (objc_msgSend_vectorCount(v113, v119, v120, v121) - v48) * v118;
            __dsta = (char *)malloc_type_malloc(v122, 0x8D98E66BuLL);
            v126 = (void *)objc_msgSend_data(v113, v123, v124, v125);
            v130 = objc_msgSend_bytes(v126, v127, v128, v129);
            objc_msgSend_vectorCount(v113, v131, v132, v133);
            v137 = objc_msgSend_dataStride(v113, v134, v135, v136);
            v141 = 0;
            v143 = (char *)(v130 + objc_msgSend_dataOffset(v113, v138, v139, v140));
            v144 = __dsta;
            do
            {
              if (v141 == v31[v141])
              {
                memcpy(v144, v143, v118);
                v144 += v118;
              }
              v143 += v137;
              ++v141;
            }
            while (v25 != v141);
            v145 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v142, (uint64_t)__dsta, v122, 1);
            v149 = objc_msgSend_semantic(v113, v146, v147, v148);
            v48 = v246;
            v153 = objc_msgSend_vectorCount(v113, v150, v151, v152) - v246;
            v157 = objc_msgSend__componentType(v113, v154, v155, v156);
            v161 = objc_msgSend_componentsPerVector(v113, v158, v159, v160);
            v163 = objc_msgSend__modelSourceWithData_semantic_vectorCount_componentType_componentCount_dataOffset_dataStride_(VFXMeshSource, v162, v145, v149, v153, v157, v161, 0, 0);
            v167 = (void *)objc_msgSend_semantic(v113, v164, v165, v166);
            objc_msgSend_isEqualToString_(v167, v168, (uint64_t)CFSTR("kGeometrySourceSemanticPosition"), v169);
            objc_msgSend_addObject_(v251, v170, v163, v171);
          }
          v254 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v105, (uint64_t)&v262, (uint64_t)v270, 16);
        }
        while (v254);
      }
      v172 = 0;
      v173 = 0;
      v174 = v25 - v48;
      do
      {
        v175 = v31[v172];
        if (v175 > v172)
        {
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. bad redirection index after sort"), v106, v107, v108, v109, v110, v111, (uint64_t)"indexRedirection[index] <= index");
          v175 = v31[v172];
        }
        if (v172 != v175)
        {
          if (!v172)
          {
            sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. weld - bad index"), v106, v107, v108, v109, v110, v111, (uint64_t)"index>0");
            v175 = *v31;
          }
          ++v173;
          if (v175 > v172)
            sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. weld - bad redirection"), v106, v107, v108, v109, v110, v111, (uint64_t)"indexRedirection[index] <= index");
        }
        *(_QWORD *)&v242[8 * v172] = v172 - v173;
        v31[v172] = *(_QWORD *)&v242[8 * v31[v172]];
        if (*(_QWORD *)&v242[8 * v172] >= v174)
          sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. weld - redirection out of bounds"), v106, v107, v108, v109, v110, v111, (uint64_t)"indexes[index] < count - weldCount");
        ++v172;
      }
      while (v25 != v172);
      if (v173 != v246)
        sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. weld - bad duplicated vertex count"), v106, v107, v108, v109, v110, v111, (uint64_t)"offset == weldCount");
      v260 = 0u;
      v261 = 0u;
      v258 = 0u;
      v259 = 0u;
      v252 = objc_msgSend_countByEnumeratingWithState_objects_count_(v244, v105, (uint64_t)&v258, (uint64_t)v269, 16);
      if (v252)
      {
        v179 = v25 - v246;
        v247 = *(_QWORD *)v259;
        do
        {
          for (m = 0; m != v252; ++m)
          {
            if (*(_QWORD *)v259 != v247)
              objc_enumerationMutation(v244);
            v181 = *(void **)(*((_QWORD *)&v258 + 1) + 8 * m);
            v182 = objc_msgSend_bytesPerIndex(v181, v176, v177, v178);
            v186 = (void *)objc_msgSend_data(v181, v183, v184, v185);
            v190 = objc_msgSend_bytes(v186, v187, v188, v189);
            v194 = objc_msgSend_indexCount(v181, v191, v192, v193);
            if (objc_msgSend_primitiveType(v181, v195, v196, v197) == 4)
              v201 = objc_msgSend_primitiveCount(v181, v198, v199, v200) * v182;
            else
              v201 = 0;
            __dstb = (char *)malloc_type_malloc(v201 + v194 * v182, 0xBFE5E080uLL);
            if (v194)
            {
              v209 = 0;
              v210 = &__dstb[v201];
              while (v182 != 4)
              {
                if (v182 != 2)
                {
                  if (v182 != 1)
                    goto LABEL_72;
                  v211 = v31[*(unsigned __int8 *)(v190 + v209)];
                  v210[v209] = v211;
                  v212 = v179 > v211;
                  v213 = "elementDataWrt[index] < count - weldCount";
                  if (v212)
                    goto LABEL_72;
LABEL_71:
                  sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. weld: bad index"), v203, v204, v205, v206, v207, v208, (uint64_t)v213);
                  goto LABEL_72;
                }
                v214 = v31[*(unsigned __int16 *)(v190 + 2 * v209)];
                *(_WORD *)&v210[2 * v209] = v214;
                v212 = v179 > (unsigned __int16)v214;
                v213 = "((uint16_t*)elementDataWrt)[index] < count - weldCount";
                if (!v212)
                  goto LABEL_71;
LABEL_72:
                if (v194 == ++v209)
                  goto LABEL_77;
              }
              v215 = v31[*(unsigned int *)(v190 + 4 * v209)];
              *(_DWORD *)&v210[4 * v209] = v215;
              v212 = v179 > v215;
              v213 = "((uint32_t*)elementDataWrt)[index] < count - weldCount";
              if (v212)
                goto LABEL_72;
              goto LABEL_71;
            }
LABEL_77:
            if (v201)
            {
              v216 = (void *)objc_msgSend_data(v181, v202, v203, v204);
              v220 = (const void *)objc_msgSend_bytes(v216, v217, v218, v219);
              memcpy(__dstb, v220, v201);
            }
            v221 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(MEMORY[0x1E0C99D50], v202, (uint64_t)__dstb, v201 + v194 * v182, 1);
            v225 = objc_msgSend_primitiveType(v181, v222, v223, v224);
            v229 = objc_msgSend_primitiveCount(v181, v226, v227, v228);
            v231 = objc_msgSend_meshElementWithData_primitiveType_primitiveCount_bytesPerIndex_(VFXMeshElement, v230, v221, v225, v229, v182);
            objc_msgSend_addObject_(v249, v232, v231, v233);
          }
          v252 = objc_msgSend_countByEnumeratingWithState_objects_count_(v244, v176, (uint64_t)&v258, (uint64_t)v269, 16);
        }
        while (v252);
      }
      v7 = (void *)objc_msgSend_meshWithSources_elements_(VFXMesh, v176, (uint64_t)v251, (uint64_t)v249);
      v237 = objc_msgSend_name(v241, v234, v235, v236);
      objc_msgSend_setName_(v7, v238, v237, v239);
      v26 = v242;
    }
    else
    {
      v7 = v241;
    }
  }
  free(v26);
  free(v31);
  return v7;
}

- (VFXMesh)init
{
  VFXMesh *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VFXMesh;
  v2 = -[VFXMesh init](&v15, sel_init);
  if (v2)
  {
    v3 = -[VFXMesh __createCFObject]_0();
    v2->_mesh = (__CFXMesh *)v3;
    if (v3)
      sub_1B193E768(v3, v2, v5, v6, v7, v8, v9, v10);
    objc_msgSend__syncObjCModel(v2, v4, v5, v6);
    objc_msgSend_makeUniqueID(v2, v11, v12, v13);
  }
  return v2;
}

- (VFXMesh)initWithMeshRef:(__CFXMesh *)a3
{
  VFXMesh *v4;
  __CFXMesh *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VFXMesh;
  v4 = -[VFXMesh init](&v17, sel_init);
  if (v4)
  {
    v5 = (__CFXMesh *)CFRetain(a3);
    v4->_mesh = v5;
    if (v5)
      sub_1B193E768((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend_makeUniqueID(v4, v13, v14, v15);
  }
  return v4;
}

+ (VFXMesh)meshWithMeshRef:(__CFXMesh *)a3
{
  VFXMesh *result;
  id v6;
  const char *v7;
  uint64_t v8;

  result = (VFXMesh *)sub_1B193E758((id *)a3);
  if (!result)
  {
    v6 = objc_alloc((Class)a1);
    return (VFXMesh *)(id)objc_msgSend_initWithMeshRef_(v6, v7, (uint64_t)a3, v8);
  }
  return result;
}

+ (id)mesh
{
  return objc_alloc_init((Class)a1);
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXMesh *mesh;
  objc_super v10;
  _QWORD v11[5];

  mesh = self->_mesh;
  if (mesh)
  {
    if ((*((_BYTE *)self + 32) & 1) == 0)
    {
      sub_1B193E768((uint64_t)mesh, 0, v2, v3, v4, v5, v6, v7);
      mesh = self->_mesh;
    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B19A7E9C;
    v11[3] = &unk_1E63D4AB0;
    v11[4] = mesh;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, 0, v11);
  }

  v10.receiver = self;
  v10.super_class = (Class)VFXMesh;
  -[VFXMesh dealloc](&v10, sel_dealloc);
}

- (void)addWorldReference:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  _QWORD v8[5];

  if (self->_world == a3)
  {
    ++self->_worldReferenceCounter;
  }
  else
  {
    self->_world = (VFXWorld *)a3;
    self->_worldReferenceCounter = 1;
    objc_msgSend_didAttachToWorld_(self, a2, (uint64_t)a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B19A7F44;
    v8[3] = &unk_1E63D7D48;
    v8[4] = a3;
    objc_msgSend_enumerateDependencies_(self, v6, (uint64_t)v8, v7);
  }
}

- (void)removeWorldReference:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  VFXWorld *world;
  unsigned int worldReferenceCounter;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  _QWORD v15[5];

  world = self->_world;
  if (!a3 || world == a3)
  {
    worldReferenceCounter = self->_worldReferenceCounter;
    if (worldReferenceCounter)
    {
      v12 = worldReferenceCounter - 1;
      self->_worldReferenceCounter = v12;
      if (!v12)
      {
        objc_msgSend_didDetachFromWorld_(self, a2, (uint64_t)world, v3);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = sub_1B19A7FFC;
        v15[3] = &unk_1E63D7D48;
        v15[4] = a3;
        objc_msgSend_enumerateDependencies_(self, v13, (uint64_t)v15, v14);
        self->_world = 0;
      }
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Over-detach of instance %@ from world %@"), (uint64_t)world, v3, v4, v5, v6, v7, (uint64_t)self);
    }
  }
}

- (id)world
{
  return self->_world;
}

- (__CFXWorld)worldRef
{
  uint64_t v2;
  uint64_t v3;

  return (__CFXWorld *)objc_msgSend___CFObject(self->_world, a2, v2, v3);
}

- (void)setName:(id)a3
{
  uint64_t v3;
  uint64_t name;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[6];

  name = (uint64_t)self->_name;
  if ((unint64_t)a3 | name)
  {
    if ((objc_msgSend_isEqual_(a3, a2, name, v3) & 1) == 0)
    {

      self->_name = (NSString *)objc_msgSend_copy(a3, v7, v8, v9);
      v13 = objc_msgSend_worldRef(self, v10, v11, v12);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = sub_1B19A80C8;
      v15[3] = &unk_1E63D53C8;
      v15[4] = self;
      v15[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
    }
  }
}

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;
  NSString *v5;
  uint64_t v6;
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

  if ((*((_BYTE *)self + 32) & 1) == 0)
    return self->_name;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, (uint64_t)v7, v8, v9, v10, v11, v12, v13);
  v15 = objc_msgSend___CFObject(self, v7, v8, v9);
  v5 = (NSString *)sub_1B193E568(v15, v16, v17, v18, v19, v20, v21, v22);
  if (v14)
    sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v5;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = objc_msgSend___CFObject(self, a2, (uint64_t)a3, v3);
  sub_1B193E6E0(v5, a3, v6, v7, v8, v9, v10, v11);
}

- (id)identifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_msgSend___CFObject(self, a2, v2, v3);
  return sub_1B193E67C(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (void)_syncEntityObjCModel
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = objc_msgSend___CFObject(self, a2, v2, v3);

  self->_name = (NSString *)(id)sub_1B193E568(v5, v6, v7, v8, v9, v10, v11, v12);
}

- (void)makeUniqueID
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = objc_msgSend___CFObject(self, a2, v2, v3);
  v8 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v5, v6, v7);
  v12 = (const void *)objc_msgSend_UUIDString(v8, v9, v10, v11);
  sub_1B193E6E0(v4, v12, v13, v14, v15, v16, v17, v18);
}

- (id)meshDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  NSString *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSString *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v32;

  v5 = (void *)objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3);
  v9 = (void *)objc_msgSend_name(self, v6, v7, v8);
  v13 = objc_msgSend_length(v9, v10, v11, v12);
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  v19 = v15;
  if (v13)
  {
    v32 = objc_msgSend_name(self, v16, v17, v18);
    objc_msgSend_appendFormat_(v5, v20, (uint64_t)CFSTR("%@: %p '%@'"), v21, v19, self, v32);
  }
  else
  {
    objc_msgSend_appendFormat_(v5, v16, (uint64_t)CFSTR("%@: %p"), v18, v15, self);
  }
  if (objc_msgSend_meshElementCount(self, v22, v23, v24) >= 2)
  {
    v28 = objc_msgSend_meshElementCount(self, v25, v26, v27);
    objc_msgSend_appendFormat_(v5, v29, (uint64_t)CFSTR(" | %d elements"), v30, v28);
  }
  return v5;
}

- (NSString)description
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_msgSend_meshDescription(self, a2, v2, v3);
  return (NSString *)objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("<%@>"), v7, v5);
}

- (__CFXMesh)meshRef
{
  return self->_mesh;
}

- (void)setMeshRef:(__CFXMesh *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXMesh *mesh;
  __CFXMesh *v10;
  __CFXMesh *v11;

  mesh = self->_mesh;
  if (mesh != a3)
  {
    v10 = a3;
    if (mesh)
    {
      sub_1B193E768((uint64_t)mesh, 0, (uint64_t)a3, v3, v4, v5, v6, v7);
      v11 = self->_mesh;
      if (v11 == v10)
        goto LABEL_11;
      if (v11)
      {
        CFRelease(v11);
        self->_mesh = 0;
      }
      if (!v10)
        goto LABEL_10;
    }
    else if (!a3)
    {
      goto LABEL_11;
    }
    v10 = (__CFXMesh *)CFRetain(v10);
LABEL_10:
    self->_mesh = v10;
LABEL_11:
    if (v10)
      sub_1B193E768((uint64_t)v10, self, (uint64_t)a3, v3, v4, v5, v6, v7);
  }
}

- (void)_releaseCachedSourcesAndElements
{

  self->_sources = 0;
  self->_elements = 0;
}

+ (VFXMesh)meshWithSources:(id)a3 elements:(id)a4
{
  return (VFXMesh *)objc_msgSend_meshWithSources_elements_sourceChannels_(a1, a2, (uint64_t)a3, (uint64_t)a4, 0);
}

+ (VFXMesh)meshWithSources:(id)a3 elements:(id)a4 sourceChannels:(id)a5
{
  const __CFAllocator *v8;
  CFIndex v9;
  const CFArrayCallBacks *v10;
  __CFArray *Mutable;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CFIndex v15;
  __CFArray *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  const void *v37;
  const char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const void *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  _QWORD *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  Class v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v55 = (Class)a1;
  v66 = *MEMORY[0x1E0C80C00];
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = objc_msgSend_count(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v10 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  Mutable = CFArrayCreateMutable(v8, v9, MEMORY[0x1E0C9B378]);
  v15 = objc_msgSend_count(a4, v12, v13, v14);
  v16 = CFArrayCreateMutable(v8, v15, v10);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v17, (uint64_t)&v60, (uint64_t)v65, 16);
  if (v18)
  {
    v22 = v18;
    v23 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v61 != v23)
          objc_enumerationMutation(a3);
        v25 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend__clearCFXCache(v25, v19, v20, v21);
        v29 = (const void *)objc_msgSend_meshSource(v25, v26, v27, v28);
        CFArrayAppendValue(Mutable, v29);
      }
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v19, (uint64_t)&v60, (uint64_t)v65, 16);
    }
    while (v22);
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v19, (uint64_t)&v56, (uint64_t)v64, 16);
  if (v30)
  {
    v34 = v30;
    v35 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v57 != v35)
          objc_enumerationMutation(a4);
        v37 = (const void *)objc_msgSend_meshElement(*(void **)(*((_QWORD *)&v56 + 1) + 8 * j), v31, v32, v33);
        CFArrayAppendValue(v16, v37);
      }
      v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(a4, v31, (uint64_t)&v56, (uint64_t)v64, 16);
    }
    while (v34);
  }
  v38 = (const char *)objc_msgSend_count(a3, v31, v32, v33);
  v39 = (char *)&v54 - ((unint64_t)(v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B19A863C(a5, v38, a4, v39);
  v45 = (const void *)sub_1B17AF674(Mutable, v16, (uint64_t)v39, v40, v41, v42, v43, v44);
  v46 = [v55 alloc];
  v49 = (_QWORD *)objc_msgSend_initWithMeshRef_(v46, v47, (uint64_t)v45, v48);
  v49[7] = objc_msgSend_copy(a5, v50, v51, v52);
  CFRelease(Mutable);
  CFRelease(v16);
  CFRelease(v45);
  return (VFXMesh *)v49;
}

- (void)_setupMeshSources
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  __CFXMesh *mesh;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  id v24;
  CFArrayRef v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
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

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  v14 = self->_sources;
  self->_sources = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  mesh = self->_mesh;
  if (mesh)
  {
    v61 = -1;
    v16 = sub_1B1875CD4((uint64_t)mesh, &v61);
    if (v61)
      v23 = 0;
    else
      v23 = v16;
    if ((v23 & 1) != 0)
      v24 = 0;
    else
      v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v25 = sub_1B1875E80((uint64_t)mesh, 0, v17, v18, v19, v20, v21, v22);
    v29 = objc_msgSend_count(v25, v26, v27, v28);
    if (v29)
    {
      v32 = v29;
      for (i = 0; i != v32; ++i)
      {
        v34 = objc_msgSend_objectAtIndexedSubscript_(v25, v30, i, v31);
        v37 = objc_msgSend_geometrySourceWithMeshSourceRef_(VFXMeshSource, v35, v34, v36);
        objc_msgSend_addObject_(self->_sources, v38, v37, v39);
        if ((v23 & 1) == 0)
        {
          v45 = sub_1B1875D40((uint64_t)mesh, i, v40, v31, v41, v42, v43, v44);
          v48 = objc_msgSend_numberWithLong_(MEMORY[0x1E0CB37E8], v46, v45, v47);
          objc_msgSend_addObject_(v24, v49, v48, v50);
        }
      }
    }

  }
  else
  {
    v24 = 0;
  }

  self->_sourceChannels = (NSArray *)objc_msgSend_copy(v24, v51, v52, v53);
  if (v13)
    sub_1B18797B4(v13, v54, v55, v56, v57, v58, v59, v60);
}

- (void)_setupMeshElements
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFXMesh *mesh;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFArray *v23;
  const __CFArray *v24;
  CFIndex i;
  const void *v26;
  NSMutableArray *elements;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  mesh = self->_mesh;
  if (mesh)
  {
    v15 = self->_elements;
    self->_elements = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = sub_1B1874BE0((uint64_t)mesh, v16, v17, v18, v19, v20, v21, v22);
    if ((uint64_t)v23 >= 1)
    {
      v24 = v23;
      for (i = 0; (const __CFArray *)i != v24; ++i)
      {
        v26 = sub_1B1874C3C((uint64_t)mesh, i, 0, v8, v9, v10, v11, v12);
        elements = self->_elements;
        v30 = objc_msgSend_geometryElementWithMeshElementRef_(VFXMeshElement, v28, (uint64_t)v26, v29);
        objc_msgSend_addObject_(elements, v31, v30, v32);
      }
    }
  }
  if (v13)
    sub_1B18797B4(v13, v6, v7, v8, v9, v10, v11, v12);
}

- (NSArray)meshSources
{
  uint64_t v2;
  uint64_t v3;
  NSArray *result;

  result = &self->_sources->super;
  if (!result)
  {
    objc_msgSend__setupMeshSources(self, a2, v2, v3);
    return &self->_sources->super;
  }
  return result;
}

- (NSArray)meshSourceChannels
{
  return self->_sourceChannels;
}

- (id)meshSourcesForSemantic:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_meshSources(self, a2, (uint64_t)a3, v3);
  v8 = (void *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v6, 1, v7);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v9, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v10)
  {
    v14 = v10;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v5);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = (void *)objc_msgSend_semantic(v17, v11, v12, v13);
        if (objc_msgSend_isEqualToString_(v18, v19, (uint64_t)a3, v20))
          objc_msgSend_addObject_(v8, v11, (uint64_t)v17, v13);
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v11, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v14);
  }
  if (objc_msgSend_count(v8, v11, v12, v13))
    return v8;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (NSArray)meshElements
{
  uint64_t v2;
  uint64_t v3;
  NSArray *result;

  result = &self->_elements->super;
  if (!result)
  {
    objc_msgSend__setupMeshElements(self, a2, v2, v3);
    return &self->_elements->super;
  }
  return result;
}

- (int64_t)meshElementCount
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_meshElements(self, a2, v2, v3);
  return objc_msgSend_count(v4, v5, v6, v7);
}

- (id)meshElementAtIndex:(int64_t)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  v5 = (void *)objc_msgSend_meshElements(self, a2, a3, v3);
  if (objc_msgSend_count(v5, v6, v7, v8) <= (unint64_t)a3)
    return 0;
  else
    return (id)objc_msgSend_objectAtIndexedSubscript_(v5, v9, a3, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v4 = objc_msgSend_meshRef(self, a2, (uint64_t)a3, v3);
  v12 = (const void *)sub_1B18741B0(v4, v5, v6, v7, v8, v9, v10, v11);
  v13 = objc_alloc((Class)objc_opt_class());
  v16 = (void *)objc_msgSend_initWithMeshRef_(v13, v14, (uint64_t)v12, v15);
  if (v12)
    CFRelease(v12);
  return v16;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (id)interleavedCopy
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v4 = objc_msgSend_meshRef(self, a2, v2, v3);
  v12 = (const void *)sub_1B17B2334(v4, v5, v6, v7, v8, v9, v10, v11);
  v13 = objc_alloc((Class)objc_opt_class());
  v16 = (void *)objc_msgSend_initWithMeshRef_(v13, v14, (uint64_t)v12, v15);
  if (v12)
    CFRelease(v12);
  return v16;
}

- (id)_renderableCopy
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  void *v16;

  v4 = objc_msgSend_meshRef(self, a2, v2, v3);
  v12 = (const void *)sub_1B1874420(v4, v5, v6, v7, v8, v9, v10, v11);
  v13 = objc_alloc((Class)objc_opt_class());
  v16 = (void *)objc_msgSend_initWithMeshRef_(v13, v14, (uint64_t)v12, v15);
  if (v12)
    CFRelease(v12);
  return v16;
}

- (id)keyForNodeAttributes
{
  return CFSTR("mesh");
}

- (int64_t)primitiveType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t mesh;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  mesh = (int64_t)self->_mesh;
  if (mesh)
  {
    if ((uint64_t)sub_1B1874BE0(mesh, v6, v7, v8, v9, v10, v11, v12) < 1)
    {
      mesh = 0;
      if (!v13)
        return mesh;
      goto LABEL_7;
    }
    v15 = sub_1B1874C3C(mesh, 0, 0, v8, v9, v10, v11, v12);
    mesh = (int)sub_1B17A426C((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);
  }
  if (v13)
LABEL_7:
    sub_1B18797B4(v13, v6, v7, v8, v9, v10, v11, v12);
  return mesh;
}

- (void)setPrimitiveType:(int64_t)a3
{
  uint64_t v3;
  char v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFXMesh *mesh;
  const __CFArray *v16;
  const __CFArray *v17;
  CFIndex i;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a3;
  v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  mesh = self->_mesh;
  if (mesh)
  {
    if ((uint64_t)sub_1B1874BE0((uint64_t)mesh, v7, v8, v9, v10, v11, v12, v13) >= 1)
    {
      v16 = sub_1B1874BE0((uint64_t)mesh, v7, v8, v9, v10, v11, v12, v13);
      if ((uint64_t)v16 >= 1)
      {
        v17 = v16;
        for (i = 0; (const __CFArray *)i != v17; ++i)
        {
          v19 = sub_1B1874C3C((uint64_t)mesh, i, 0, v9, v10, v11, v12, v13);
          sub_1B17A3B60((uint64_t)v19, v4, v20, v21, v22, v23, v24, v25);
        }
      }
    }
  }
  if (v14)
    sub_1B18797B4(v14, v7, v8, v9, v10, v11, v12, v13);
}

- (void)__CFObject
{
  return self->_mesh;
}

- (double)boundingBox
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  __int128 v23;
  __int128 v24;

  v5 = objc_msgSend_worldRef(a1, a2, a3, a4);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_meshRef(a1, v6, v7, v8, 0, 0, 0, 0);
  if (!v14)
  {
    v23 = VFXNullBoundingBox;
    v24 = *(_OWORD *)algn_1B2268550;
    if (!v13)
      return *(double *)&v23;
    goto LABEL_5;
  }
  sub_1B1874504(v14, &v23, &v24, v17, v18, v19, v20, v21);
  if (v13)
LABEL_5:
    sub_1B18797B4(v13, v15, v16, v17, v18, v19, v20, v21);
  return *(double *)&v23;
}

- (void)setBoundingBox:(uint64_t)a3
{
  sub_1B17C4408(16, (uint64_t)CFSTR("Error: can't set a bounding box to a Mesh (readonly)"), a3, a4, a5, a6, a7, a8, a9);
}

- (BOOL)getBoundingSphereCenter:(VFXMesh *)self radius:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  _OWORD *v5;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  BOOL v24;
  __int128 v26;

  v4 = (_DWORD *)v3;
  v5 = (_OWORD *)v2;
  v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  v15 = v7;
  if (v7)
    sub_1B187973C(v7, (uint64_t)v8, v9, v10, v11, v12, v13, v14);
  v16 = (const void *)objc_msgSend_meshRef(self, v8, v9, v10);
  v26 = 0uLL;
  if (!v16 || !sub_1B17C5D30(v16, 1, (uint64_t)&v26, v19, v20, v21, v22, v23))
  {
    v24 = 0;
    if (!v15)
      return v24;
LABEL_12:
    sub_1B18797B4(v15, v17, v18, v19, v20, v21, v22, v23);
    return v24;
  }
  if (v5)
    *v5 = v26;
  if (v4)
    *v4 = HIDWORD(v26);
  v24 = 1;
  if (v15)
    goto LABEL_12;
  return v24;
}

- (void)decodeMeshWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFAllocator *v27;
  CFIndex v28;
  const CFArrayCallBacks *v29;
  __CFArray *Mutable;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  CFIndex v35;
  __CFArray *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  const void *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  const void *v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __CFXMesh *mesh;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  VFXMesh *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v5 = sub_1B1874018();
  if (v5 == CFGetTypeID(self->_mesh))
  {
    v73 = self;
    v6 = objc_opt_class();
    v72 = (void *)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v7, v6, (uint64_t)CFSTR("elements"));
    v11 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10);
    v12 = objc_opt_class();
    v14 = (void *)sub_1B19B3860(v12, v13);
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v82, (uint64_t)v88, 16);
    if (v16)
    {
      v20 = v16;
      v21 = *(_QWORD *)v83;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v83 != v21)
            objc_enumerationMutation(v14);
          v23 = *(__CFString **)(*((_QWORD *)&v82 + 1) + 8 * v22);
          v24 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v17, v12, (uint64_t)v23);
          if (v24
            || v23 == CFSTR("kGeometrySourceSemanticPosition")
            && (v24 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v17, v12, (uint64_t)CFSTR("kGeometrySourceSemanticVertex"))) != 0)
          {
            objc_msgSend_addObjectsFromArray_(v11, v17, v24, v25);
          }
          ++v22;
        }
        while (v20 != v22);
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v82, (uint64_t)v88, 16);
        v20 = v26;
      }
      while (v26);
    }
    v27 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v28 = objc_msgSend_count(v11, v17, v18, v19);
    v29 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
    Mutable = CFArrayCreateMutable(v27, v28, MEMORY[0x1E0C9B378]);
    v31 = v72;
    v35 = objc_msgSend_count(v72, v32, v33, v34);
    v36 = CFArrayCreateMutable(v27, v35, v29);
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v37, (uint64_t)&v78, (uint64_t)v87, 16);
    if (v38)
    {
      v42 = v38;
      v43 = *(_QWORD *)v79;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v79 != v43)
            objc_enumerationMutation(v11);
          v45 = (const void *)objc_msgSend_meshSource(*(void **)(*((_QWORD *)&v78 + 1) + 8 * i), v39, v40, v41);
          CFArrayAppendValue(Mutable, v45);
        }
        v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v39, (uint64_t)&v78, (uint64_t)v87, 16);
      }
      while (v42);
    }
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v39, (uint64_t)&v74, (uint64_t)v86, 16);
    if (v46)
    {
      v50 = v46;
      v51 = *(_QWORD *)v75;
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v75 != v51)
            objc_enumerationMutation(v72);
          v53 = (const void *)objc_msgSend_meshElement(*(void **)(*((_QWORD *)&v74 + 1) + 8 * j), v47, v48, v49);
          CFArrayAppendValue(v36, v53);
        }
        v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v47, (uint64_t)&v74, (uint64_t)v86, 16);
      }
      while (v50);
    }
    v54 = objc_opt_class();
    self = v73;
    v73->_sourceChannels = (NSArray *)(id)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v55, v54, (uint64_t)CFSTR("sourceChannels"));
    v59 = (const char *)objc_msgSend_count(v11, v56, v57, v58);
    v60 = (char *)&v72 - ((unint64_t)(v59 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_1B19A863C(self->_sourceChannels, v59, v31, v60);
    mesh = self->_mesh;
    if (mesh)
    {
      CFRelease(mesh);
      self->_mesh = 0;
    }
    self->_mesh = (__CFXMesh *)sub_1B17AF674(Mutable, v36, (uint64_t)v60, v61, v62, v63, v64, v65);
    CFRelease(Mutable);
    CFRelease(v36);
  }
  v67 = objc_opt_class();
  v69 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v68, v67, (uint64_t)CFSTR("name"));
  objc_msgSend_setName_(self, v70, v69, v71);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  CFTypeID v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *sourceChannels;
  NSString *name;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = sub_1B1874018();
  v6 = CFGetTypeID(self->_mesh);
  if (v5 == v6)
  {
    v9 = (void *)sub_1B19B3860(v6, v7);
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, (uint64_t)v30, 16);
    if (v11)
    {
      v15 = v11;
      v16 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v27 != v16)
            objc_enumerationMutation(v9);
          v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          v19 = objc_msgSend_meshSourcesForSemantic_(self, v12, v18, v14);
          if (v19)
            objc_msgSend_encodeObject_forKey_(a3, v12, v19, v18);
        }
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v26, (uint64_t)v30, 16);
      }
      while (v15);
    }
    v20 = (void *)objc_msgSend_meshElements(self, v12, v13, v14);
    if (objc_msgSend_count(v20, v21, v22, v23))
      objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)v20, (uint64_t)CFSTR("elements"));
    sourceChannels = self->_sourceChannels;
    if (sourceChannels)
      objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)sourceChannels, (uint64_t)CFSTR("sourceChannels"));
  }
  name = self->_name;
  if (name)
    objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)name, (uint64_t)CFSTR("name"));
  sub_1B18BD9B8(a3, self, (uint64_t)name, v8);
}

- (VFXMesh)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXMesh *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t CFObject;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)VFXMesh;
  v7 = -[VFXMesh init](&v27, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    CFObject = objc_msgSend___createCFObject(v7, v11, v12, v13);
    v7->_mesh = (__CFXMesh *)CFObject;
    if (CFObject)
      sub_1B193E768(CFObject, v7, v16, v17, v18, v19, v20, v21);
    objc_msgSend__syncObjCModel(v7, v15, v16, v17);
    objc_msgSend_decodeMeshWithCoder_(v7, v22, (uint64_t)a3, v23);
    sub_1B18BDA00(a3, v7);
    objc_msgSend_setImmediateMode_(VFXTransaction, v24, v8, v25);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
