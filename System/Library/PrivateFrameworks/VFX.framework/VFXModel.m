@implementation VFXModel

- (uint64_t)__createCFObject
{
  uint64_t v0;

  if (qword_1ED4CECA8 != -1)
    dispatch_once(&qword_1ED4CECA8, &unk_1E63D0990);
  v0 = sub_1B179CB90(qword_1ED4CECB0, 0xC0uLL);
  *(_QWORD *)(v0 + 80) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  *(_QWORD *)(v0 + 120) = 0;
  *(_QWORD *)(v0 + 104) = 0;
  *(_BYTE *)(v0 + 200) = 0;
  sub_1B184A63C(v0);
  return v0;
}

+ (VFXModel)modelWithMDLMesh:(id)a3 submesh:(id)a4 options:(id)a5
{
  VFXModel *v5;
  id v9;
  id v10;
  id v11;
  char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  _QWORD *v60[2];
  _QWORD **v61;
  _QWORD *v62[2];

  v5 = 0;
  if (a3 && a4)
  {
    if (objc_msgSend_indexCount(a4, a2, (uint64_t)a3, (uint64_t)a4))
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v12 = (char *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = objc_msgSend_modelElementWithMDLSubmesh_(VFXMeshElement, v13, (uint64_t)a4, v14);
      if (v15)
        objc_msgSend_addObject_(v9, v16, v15, v18);
      v19 = objc_msgSend_material(a4, v16, v17, v18);
      if (v19)
      {
        v22 = objc_msgSend_materialWithMDLMaterial_options_(VFXMaterial, v20, v19, (uint64_t)a5);
        if (v22)
          objc_msgSend_addObject_(v10, v23, v22, v21);
      }
      v62[0] = 0;
      v62[1] = 0;
      v60[1] = 0;
      v61 = v62;
      v59 = (uint64_t *)v60;
      v60[0] = 0;
      sub_1B1838E28(a4, (char *)&v61, &v59, v21);
      sub_1B1838FD0(v11, v12, a3, (uint64_t)a5);
      v57 = 0;
      v58 = 0;
      sub_1B18391F0((uint64_t)v11, (uint64_t)&v59, a3, v24);
      sub_1B18393A0((uint64_t)&v61, (char *)&v58, &v57, v25);
      v27 = (void *)objc_msgSend_meshWithSources_elements_(VFXMesh, v26, (uint64_t)v11, (uint64_t)v9);
      v31 = objc_msgSend_name(a3, v28, v29, v30);
      objc_msgSend_setName_(v27, v32, v31, v33);
      v5 = (VFXModel *)objc_msgSend_modelWithMesh_(VFXModel, v34, (uint64_t)v27, v35);
      v39 = objc_msgSend_name(a3, v36, v37, v38);
      objc_msgSend_setName_(v5, v40, v39, v41);
      v45 = objc_msgSend_name(v5, v42, v43, v44);
      objc_msgSend_setName_(v27, v46, v45, v47);
      objc_msgSend_setSubdivisionLevel_(v5, v48, 0, v49);
      objc_msgSend_setEdgeCreasesElement_(v5, v50, v57, v51);
      objc_msgSend_setEdgeCreasesSource_(v5, v52, v58, v53);
      objc_msgSend_setMaterials_(v5, v54, (uint64_t)v10, v55);

      sub_1B1805B90((uint64_t)&v59, v60[0]);
      sub_1B1805B90((uint64_t)&v61, v62[0]);
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

+ (VFXModel)modelWithMDLMesh:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;

  v6 = objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, (uint64_t)a3, v3);
  return (VFXModel *)objc_msgSend_modelWithMDLMesh_options_context_(a1, v7, (uint64_t)a3, 0, v6);
}

+ (VFXModel)modelWithMDLMesh:(id)a3 options:(id)a4 context:(id)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  VFXModel *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t j;
  void *v88;
  unint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  id v147;
  id v149;
  char *obj;
  id v151;
  id v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  uint64_t v157;
  uint64_t v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  uint64_t *v163;
  _QWORD *v164;
  uint64_t v165;
  _QWORD **v166;
  _QWORD *v167[2];
  _BYTE v168[128];
  _BYTE v169[128];
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v151 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v149 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v147 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  obj = (char *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v167[0] = 0;
  v167[1] = 0;
  v165 = 0;
  v166 = v167;
  v163 = (uint64_t *)&v164;
  v164 = 0;
  v159 = 0u;
  v160 = 0u;
  v161 = 0u;
  v162 = 0u;
  v152 = a3;
  v10 = (void *)objc_msgSend_submeshes(a3, v7, v8, v9);
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v159, (uint64_t)v169, 16);
  if (!v15)
    goto LABEL_20;
  v16 = *(_QWORD *)v160;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v160 != v16)
        objc_enumerationMutation(v10);
      v18 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * i);
      if (objc_msgSend_indexCount(v18, v12, v13, v14, v147))
      {
        v20 = objc_msgSend_modelElementWithMDLSubmesh_(VFXMeshElement, v12, (uint64_t)v18, v14);
        if (v20)
          objc_msgSend_addObject_(v151, v19, v20, v21);
        v22 = (void *)objc_msgSend_material(v18, v19, v20, v21);
        v26 = (uint64_t)v22;
        if (v22)
        {
          v28 = objc_msgSend_name(v22, v23, v24, v25);
          if (v28)
          {
            v29 = objc_msgSend_valueForKey_(a5, v23, v28, v27);
            if (v29)
            {
LABEL_15:
              objc_msgSend_setValue_forKey_(a5, v23, v29, v28);
              goto LABEL_16;
            }
          }
          v29 = objc_msgSend_materialWithMDLMaterial_options_(VFXMaterial, v23, v26, (uint64_t)a4);
          if (v29)
          {
            if (v28)
              goto LABEL_15;
LABEL_16:
            objc_msgSend_addObject_(v149, v23, v29, v25);
          }
        }
        objc_msgSend_topology(v18, v23, v24, v25);
        sub_1B1838E28(v18, (char *)&v166, &v163, v30);
        continue;
      }
    }
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v159, (uint64_t)v169, 16);
  }
  while (v15);
LABEL_20:
  v31 = v147;
  v32 = v152;
  sub_1B1838FD0(v147, obj, v152, (uint64_t)a4);
  v157 = 0;
  v158 = 0;
  sub_1B18391F0((uint64_t)v147, (uint64_t)&v163, v152, v33);
  sub_1B18393A0((uint64_t)&v166, (char *)&v158, &v157, v34);
  v38 = (void *)objc_msgSend_submeshes(v152, v35, v36, v37);
  if (objc_msgSend_count(v38, v39, v40, v41))
  {
    v45 = 0;
    v46 = *MEMORY[0x1E0CC7760];
    while (1)
    {
      v47 = (void *)objc_msgSend_vertexDescriptor(v152, v42, v43, v44, v147);
      v51 = (void *)objc_msgSend_attributes(v47, v48, v49, v50);
      if (objc_msgSend_count(v51, v52, v53, v54) <= (unint64_t)v45)
        break;
      v58 = (void *)objc_msgSend_vertexDescriptor(v152, v55, v56, v57);
      v62 = (void *)objc_msgSend_attributes(v58, v59, v60, v61);
      v65 = (void *)objc_msgSend_objectAtIndexedSubscript_(v62, v63, v45, v64);
      v69 = (void *)objc_msgSend_name(v65, v66, v67, v68);
      if ((objc_msgSend_containsString_(v69, v70, v46, v71) & 1) != 0)
        goto LABEL_28;
      ++v45;
    }
    v45 = 0;
LABEL_28:
    v80 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v81, (uint64_t)&v153, (uint64_t)v168, 16);
    if (v85)
    {
      v86 = *(_QWORD *)v154;
      do
      {
        for (j = 0; j != v85; ++j)
        {
          if (*(_QWORD *)v154 != v86)
            objc_enumerationMutation(obj);
          v88 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * j);
          v89 = objc_msgSend_unsignedLongValue(v88, v82, v83, v84);
          v93 = (void *)objc_msgSend_submeshes(v152, v90, v91, v92);
          v96 = (void *)objc_msgSend_objectAtIndexedSubscript_(v93, v94, 0, v95);
          v100 = (void *)objc_msgSend_faceIndexing(v96, v97, v98, v99);
          if (v89 >= objc_msgSend_count(v100, v101, v102, v103))
          {
            v121 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v104, v45, v106);
          }
          else
          {
            v107 = (void *)objc_msgSend_submeshes(v152, v104, v105, v106);
            v110 = (void *)objc_msgSend_objectAtIndexedSubscript_(v107, v108, 0, v109);
            v114 = (void *)objc_msgSend_faceIndexing(v110, v111, v112, v113);
            v118 = objc_msgSend_integerValue(v88, v115, v116, v117);
            v121 = objc_msgSend_objectAtIndexedSubscript_(v114, v119, v118, v120);
          }
          objc_msgSend_addObject_(v80, v122, v121, v123);
        }
        v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v82, (uint64_t)&v153, (uint64_t)v168, 16);
      }
      while (v85);
    }
    v31 = v147;
    v32 = v152;
    if (v165)
    {
      v124 = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v82, v45, v84);
      objc_msgSend_addObject_(v80, v125, v124, v126);
    }
    v73 = (void *)objc_msgSend_meshWithSources_elements_sourceChannels_(VFXMesh, v82, (uint64_t)v147, (uint64_t)v151, v80);

    v76 = objc_msgSend_modelWithMesh_(VFXModel, v127, (uint64_t)v73, v128, v147);
  }
  else
  {
    v73 = (void *)objc_msgSend_meshWithSources_elements_(VFXMesh, v42, (uint64_t)v147, (uint64_t)v151);
    v76 = objc_msgSend_modelWithMesh_(VFXModel, v74, (uint64_t)v73, v75, v147);
  }
  v72 = (VFXModel *)v76;
  v129 = objc_msgSend_name(v32, v77, v78, v79);
  objc_msgSend_setName_(v72, v130, v129, v131);
  v135 = objc_msgSend_name(v72, v132, v133, v134);
  objc_msgSend_setName_(v73, v136, v135, v137);
  objc_msgSend_setSubdivisionLevel_(v72, v138, 0, v139);
  objc_msgSend_setEdgeCreasesElement_(v72, v140, v157, v141);
  objc_msgSend_setEdgeCreasesSource_(v72, v142, v158, v143);
  objc_msgSend_setMaterials_(v72, v144, (uint64_t)v149, v145);

  sub_1B1805B90((uint64_t)&v163, v164);
  sub_1B1805B90((uint64_t)&v166, v167[0]);
  return v72;
}

+ (id)morpherWithMDLMesh:(id)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t k;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  unint64_t v97;
  const char *v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  VFXMorpher *v119;
  const char *v120;
  uint64_t v121;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  uint64_t v135;
  _QWORD v136[2];
  _BYTE v137[128];
  _BYTE v138[128];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend_vertexDescriptor(a3, a2, (uint64_t)a3, v3);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v131 = 0u;
  v132 = 0u;
  v133 = 0u;
  v134 = 0u;
  v11 = (void *)objc_msgSend_attributes(v5, v8, v9, v10);
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v131, (uint64_t)v139, 16);
  if (v13)
  {
    v17 = v13;
    v18 = *(_QWORD *)v132;
    v19 = *MEMORY[0x1E0CC7760];
    v20 = *MEMORY[0x1E0CC7750];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v132 != v18)
          objc_enumerationMutation(v11);
        v22 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * i);
        if (objc_msgSend_format(v22, v14, v15, v16))
        {
          v23 = (void *)objc_msgSend_name(v22, v14, v15, v16);
          if (objc_msgSend_containsString_(v23, v24, v19, v25))
            objc_msgSend_addObject_(v6, v26, (uint64_t)v22, v28);
          v29 = (void *)objc_msgSend_name(v22, v26, v27, v28);
          if (objc_msgSend_containsString_(v29, v30, v20, v31))
            objc_msgSend_addObject_(v7, v14, (uint64_t)v22, v16);
        }
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v131, (uint64_t)v139, 16);
    }
    while (v17);
  }
  if (objc_msgSend_count(v6, v14, v15, v16))
  {
    v32 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v36 = objc_msgSend_count(v6, v33, v34, v35);
    v39 = (void *)objc_msgSend_initWithCapacity_(v32, v37, v36, v38);
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v40, (uint64_t)&v127, (uint64_t)v138, 16);
    if (v41)
    {
      v43 = v41;
      v44 = *(_QWORD *)v128;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v128 != v44)
            objc_enumerationMutation(v6);
          v46 = objc_msgSend_geometrySourceWithMDLVertexAttribute_mesh_(VFXMeshSource, v42, *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * j), (uint64_t)a3);
          objc_msgSend_addObject_(v39, v47, v46, v48);
        }
        v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v42, (uint64_t)&v127, (uint64_t)v138, 16);
      }
      while (v43);
    }
    v49 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v53 = objc_msgSend_count(v7, v50, v51, v52);
    v56 = (void *)objc_msgSend_initWithCapacity_(v49, v54, v53, v55);
    v123 = 0u;
    v124 = 0u;
    v125 = 0u;
    v126 = 0u;
    v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v57, (uint64_t)&v123, (uint64_t)v137, 16);
    if (v58)
    {
      v61 = v58;
      v62 = *(_QWORD *)v124;
      do
      {
        for (k = 0; k != v61; ++k)
        {
          if (*(_QWORD *)v124 != v62)
            objc_enumerationMutation(v7);
          v64 = objc_msgSend_geometrySourceWithMDLVertexAttribute_mesh_(VFXMeshSource, v59, *(_QWORD *)(*((_QWORD *)&v123 + 1) + 8 * k), (uint64_t)a3);
          objc_msgSend_addObject_(v56, v65, v64, v66);
        }
        v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v59, (uint64_t)&v123, (uint64_t)v137, 16);
      }
      while (v61);
    }
    v67 = (void *)objc_msgSend_modelWithMDLMesh_(a1, v59, (uint64_t)a3, v60);
    v68 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v72 = objc_msgSend_count(v39, v69, v70, v71);
    v75 = (void *)objc_msgSend_initWithCapacity_(v68, v73, v72, v74);
    if (objc_msgSend_count(v6, v76, v77, v78) == 1)
    {
      v82 = objc_msgSend_mesh(v67, v79, v80, v81);
      objc_msgSend_addObject_(v75, v83, v82, v84);
    }
    else
    {
      v86 = objc_msgSend_count(v39, v79, v80, v81);
      v90 = objc_msgSend_count(v56, v87, v88, v89);
      v94 = objc_msgSend_count(v39, v91, v92, v93);
      if (v86 == v90)
      {
        if (v94)
        {
          v97 = 0;
          do
          {
            v136[0] = objc_msgSend_objectAtIndexedSubscript_(v39, v95, v97, v96);
            v136[1] = objc_msgSend_objectAtIndexedSubscript_(v56, v98, v97, v99);
            v101 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v100, (uint64_t)v136, 2);
            v103 = objc_msgSend_meshWithSources_elements_(VFXMesh, v102, v101, 0);
            objc_msgSend_addObject_(v75, v104, v103, v105);
            ++v97;
          }
          while (v97 < objc_msgSend_count(v39, v106, v107, v108));
        }
      }
      else if (v94)
      {
        v109 = 0;
        do
        {
          v135 = objc_msgSend_objectAtIndexedSubscript_(v39, v95, v109, v96);
          v111 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v110, (uint64_t)&v135, 1);
          v113 = objc_msgSend_meshWithSources_elements_(VFXMesh, v112, v111, 0);
          objc_msgSend_addObject_(v75, v114, v113, v115);
          ++v109;
        }
        while (v109 < objc_msgSend_count(v39, v116, v117, v118));
      }
    }

    v119 = objc_alloc_init(VFXMorpher);
    objc_msgSend_setTargets_(v119, v120, (uint64_t)v75, v121);

    return v119;
  }
  else
  {

    return 0;
  }
}

- (id)debugQuickLookObjectWithAssetPathResolver:(id)a3
{
  uint64_t v3;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (id)objc_msgSend_copy(self, a2, (uint64_t)a3, v3);
  v8 = objc_msgSend_nodeWithModel_(VFXNode, v6, (uint64_t)v5, v7);
  return (id)MEMORY[0x1E0DE7D20](v8, sel_debugQuickLookObjectWithAssetPathResolver_, a3, v9);
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

- (void)setValueForKey:(id)a3 optionKey:(id)a4 options:(id)a5
{
  uint64_t v7;
  const char *v8;

  v7 = objc_msgSend_objectForKey_(a5, a2, (uint64_t)a4, (uint64_t)a4);
  if (v7)
    objc_msgSend_setValue_forKey_(self, v8, v7, (uint64_t)a3);
}

+ (id)planeWithWidth:(float)a3 height:(float)a4 options:(id)a5
{
  uint64_t v5;
  void *v7;
  const char *v8;
  const char *v9;

  v7 = (void *)objc_msgSend_planeWithWidth_height_(VFXParametricModel, a2, (uint64_t)a5, v5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v8, (uint64_t)CFSTR("widthSegmentCount"), (uint64_t)CFSTR("kPrimitiveWidthSegments"), a5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v9, (uint64_t)CFSTR("heightSegmentCount"), (uint64_t)CFSTR("kPrimitiveHeightSegments"), a5);
  return v7;
}

+ (id)cubeWithWidth:(float)a3 height:(float)a4 length:(float)a5 cornerRadius:(float)a6 options:(id)a7
{
  uint64_t v7;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;

  v9 = (void *)objc_msgSend_cubeWithWidth_height_length_chamferRadius_(VFXParametricModel, a2, (uint64_t)a7, v7);
  objc_msgSend_setValueForKey_optionKey_options_(v9, v10, (uint64_t)CFSTR("widthSegmentCount"), (uint64_t)CFSTR("kPrimitiveWidthSegments"), a7);
  objc_msgSend_setValueForKey_optionKey_options_(v9, v11, (uint64_t)CFSTR("heightSegmentCount"), (uint64_t)CFSTR("kPrimitiveHeightSegments"), a7);
  objc_msgSend_setValueForKey_optionKey_options_(v9, v12, (uint64_t)CFSTR("lengthSegmentCount"), (uint64_t)CFSTR("kPrimitiveLengthSegments"), a7);
  objc_msgSend_setValueForKey_optionKey_options_(v9, v13, (uint64_t)CFSTR("chamferSegmentCount"), (uint64_t)CFSTR("kPrimitiveChamferSegments"), a7);
  return v9;
}

+ (id)pyramidWithWidth:(float)a3 height:(float)a4 length:(float)a5 options:(id)a6
{
  uint64_t v6;
  void *v8;
  const char *v9;
  const char *v10;
  const char *v11;

  v8 = (void *)objc_msgSend_pyramidWithWidth_height_length_(VFXParametricModel, a2, (uint64_t)a6, v6);
  objc_msgSend_setValueForKey_optionKey_options_(v8, v9, (uint64_t)CFSTR("widthSegmentCount"), (uint64_t)CFSTR("kPrimitiveWidthSegments"), a6);
  objc_msgSend_setValueForKey_optionKey_options_(v8, v10, (uint64_t)CFSTR("heightSegmentCount"), (uint64_t)CFSTR("kPrimitiveHeightSegments"), a6);
  objc_msgSend_setValueForKey_optionKey_options_(v8, v11, (uint64_t)CFSTR("lengthSegmentCount"), (uint64_t)CFSTR("kPrimitiveLengthSegments"), a6);
  return v8;
}

+ (id)sphereWithRadius:(float)a3 options:(id)a4
{
  uint64_t v4;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t isEqualToString;
  const char *v14;
  uint64_t v15;

  v6 = (void *)objc_msgSend_sphereWithRadius_(VFXParametricModel, a2, (uint64_t)a4, v4);
  objc_msgSend_setValueForKey_optionKey_options_(v6, v7, (uint64_t)CFSTR("segmentCount"), (uint64_t)CFSTR("kPrimitiveRotationSegments"), a4);
  v10 = (void *)objc_msgSend_objectForKey_(a4, v8, (uint64_t)CFSTR("kPrimitiveSphereType"), v9);
  if (v10)
  {
    isEqualToString = objc_msgSend_isEqualToString_(v10, v11, (uint64_t)CFSTR("kPrimitiveTypeGeosphere"), v12);
    objc_msgSend_setGeodesic_(v6, v14, isEqualToString, v15);
  }
  return v6;
}

+ (id)cylinderWithRadius:(float)a3 height:(float)a4 options:(id)a5
{
  uint64_t v5;
  void *v7;
  const char *v8;
  const char *v9;

  v7 = (void *)objc_msgSend_cylinderWithRadius_height_(VFXParametricModel, a2, (uint64_t)a5, v5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v8, (uint64_t)CFSTR("radialSegmentCount"), (uint64_t)CFSTR("kPrimitiveRotationSegments"), a5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v9, (uint64_t)CFSTR("heightSegmentCount"), (uint64_t)CFSTR("kPrimitiveHeightSegments"), a5);
  return v7;
}

+ (id)coneWithHeight:(float)a3 topRadius:(float)a4 bottomRadius:(float)a5 options:(id)a6
{
  uint64_t v6;
  double v9;
  double v10;
  double v11;
  void *v12;
  const char *v13;
  const char *v14;

  *(float *)&v9 = a4;
  *(float *)&v10 = a5;
  *(float *)&v11 = a3;
  v12 = (void *)objc_msgSend_coneWithTopRadius_bottomRadius_height_(VFXParametricModel, a2, (uint64_t)a6, v6, v9, v10, v11);
  objc_msgSend_setValueForKey_optionKey_options_(v12, v13, (uint64_t)CFSTR("radialSegmentCount"), (uint64_t)CFSTR("kPrimitiveRotationSegments"), a6);
  objc_msgSend_setValueForKey_optionKey_options_(v12, v14, (uint64_t)CFSTR("heightSegmentCount"), (uint64_t)CFSTR("kPrimitiveHeightSegments"), a6);
  return v12;
}

+ (id)tubeWithInnerRadius:(float)a3 outerRadius:(float)a4 height:(float)a5 options:(id)a6
{
  uint64_t v6;
  void *v8;
  const char *v9;
  const char *v10;

  v8 = (void *)objc_msgSend_tubeWithInnerRadius_outerRadius_height_(VFXParametricModel, a2, (uint64_t)a6, v6);
  objc_msgSend_setValueForKey_optionKey_options_(v8, v9, (uint64_t)CFSTR("radialSegmentCount"), (uint64_t)CFSTR("kPrimitiveRotationSegments"), a6);
  objc_msgSend_setValueForKey_optionKey_options_(v8, v10, (uint64_t)CFSTR("heightSegmentCount"), (uint64_t)CFSTR("kPrimitiveHeightSegments"), a6);
  return v8;
}

+ (id)capsuleWithRadius:(float)a3 height:(float)a4 options:(id)a5
{
  uint64_t v5;
  void *v7;
  const char *v8;
  const char *v9;

  v7 = (void *)objc_msgSend_capsuleWithCapRadius_height_(VFXParametricModel, a2, (uint64_t)a5, v5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v8, (uint64_t)CFSTR("radialSegmentCount"), (uint64_t)CFSTR("kPrimitiveRotationSegments"), a5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v9, (uint64_t)CFSTR("heightSegmentCount"), (uint64_t)CFSTR("kPrimitiveHeightSegments"), a5);
  return v7;
}

+ (id)torusWithRingRadius:(float)a3 pipeRadius:(float)a4 options:(id)a5
{
  uint64_t v5;
  void *v7;
  const char *v8;
  const char *v9;

  v7 = (void *)objc_msgSend_torusWithRingRadius_pipeRadius_(VFXParametricModel, a2, (uint64_t)a5, v5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v8, (uint64_t)CFSTR("radialSegmentCount"), (uint64_t)CFSTR("kPrimitiveRotationSegments"), a5);
  objc_msgSend_setValueForKey_optionKey_options_(v7, v9, (uint64_t)CFSTR("pipeSegmentCount"), (uint64_t)CFSTR("kPrimitivePipeSegments"), a5);
  return v7;
}

+ (id)floorWithOptions:(id)a3
{
  return (id)((uint64_t (*)(__objc2_class *, char *, id))MEMORY[0x1E0DE7D20])(VFXFloor, sel_floor, a3);
}

- (VFXModel)init
{
  VFXModel *v2;
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
  v15.super_class = (Class)VFXModel;
  v2 = -[VFXModel init](&v15, sel_init);
  if (v2)
  {
    v3 = -[VFXModel __createCFObject]_0();
    v2->_geometry = (__CFXGeometry *)v3;
    if (v3)
      sub_1B193E768(v3, v2, v5, v6, v7, v8, v9, v10);
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    v2->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6);
    objc_msgSend_makeUniqueID(v2, v11, v12, v13);
  }
  return v2;
}

- (VFXModel)initWithGeometryRef:(__CFXGeometry *)a3
{
  VFXModel *v4;
  __CFXGeometry *v5;
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)VFXModel;
  v4 = -[VFXModel init](&v20, sel_init);
  if (v4)
  {
    v5 = (__CFXGeometry *)CFRetain(a3);
    v4->_geometry = v5;
    if (v5)
      sub_1B193E768((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    v4->_animationsLock._os_unfair_lock_opaque = 0;
    v4->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
    objc_msgSend_makeUniqueID(v4, v16, v17, v18);
  }
  return v4;
}

- (id)initPresentationModelWithGeometryRef:(__CFXGeometry *)a3
{
  VFXModel *v4;
  VFXModel *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXModel;
  v4 = -[VFXModel init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 16) |= 1u;
    v4->_geometry = (__CFXGeometry *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
    v5->_valuesForUndefinedKeysLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

+ (VFXModel)modelWithMesh:(id)a3
{
  VFXModel *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v4 = objc_alloc_init(VFXModel);
  objc_msgSend_setMesh_(v4, v5, (uint64_t)a3, v6);
  v10 = objc_msgSend_material(VFXMaterial, v7, v8, v9);
  objc_msgSend_setFirstMaterial_(v4, v11, v10, v12);
  return v4;
}

+ (VFXModel)modelWithGeometryRef:(__CFXGeometry *)a3
{
  VFXModel *result;
  id v6;
  const char *v7;
  uint64_t v8;

  result = (VFXModel *)sub_1B193E758((id *)a3);
  if (!result)
  {
    v6 = objc_alloc((Class)a1);
    return (VFXModel *)(id)objc_msgSend_initWithGeometryRef_(v6, v7, (uint64_t)a3, v8);
  }
  return result;
}

+ (id)model
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
  __CFXGeometry *geometry;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  _QWORD v14[5];

  geometry = self->_geometry;
  if (geometry)
  {
    if ((*((_BYTE *)self + 16) & 1) == 0)
    {
      sub_1B193E768((uint64_t)geometry, 0, v2, v3, v4, v5, v6, v7);
      geometry = self->_geometry;
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B18DB31C;
    v14[3] = &unk_1E63D4AB0;
    v14[4] = geometry;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, a2, 0, 0, v14);
  }
  objc_msgSend_clientWillDie_(self->_tessellator, a2, (uint64_t)self, v3);

  objc_msgSend_ownerWillDie(self->_shadableHelper, v10, v11, v12);
  free(*(void **)self->_fixedBoundingBoxExtrema);
  v13.receiver = self;
  v13.super_class = (Class)VFXModel;
  -[VFXModel dealloc](&v13, sel_dealloc);
}

- (BOOL)isPresentationObject
{
  return *((_BYTE *)self + 16) & 1;
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
      v15[2] = sub_1B18DB3E0;
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

  if ((*((_BYTE *)self + 16) & 1) == 0)
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

- (void)_meshChanged
{
  uint64_t v2;
  VFXMesh *mesh;
  VFXWorld *world;

  mesh = self->_mesh;
  if (mesh)
  {
    world = self->_world;
    if (world)
    {
      objc_msgSend_removeWorldReference_(mesh, a2, (uint64_t)world, v2);
      mesh = self->_mesh;
    }

    self->_mesh = 0;
  }
}

- (id)_fetchMesh
{
  uint64_t v2;
  uint64_t v3;
  VFXMesh *mesh;
  VFXWorld *world;
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id result;
  VFXWorld *v25;

  mesh = self->_mesh;
  if (mesh)
  {
    world = self->_world;
    if (world)
    {
      objc_msgSend_removeWorldReference_(mesh, a2, (uint64_t)world, v3);
      mesh = self->_mesh;
    }

    self->_mesh = 0;
  }
  v7 = objc_msgSend_worldRef(self, a2, v2, v3);
  v15 = v7;
  if (v7)
    sub_1B187973C(v7, v8, v9, v10, v11, v12, v13, v14);
  v16 = sub_1B17A0848((uint64_t)self->_geometry, v8, v9, v10, v11, v12, v13, v14);
  if (v16)
    self->_mesh = (VFXMesh *)(id)objc_msgSend_meshWithMeshRef_(VFXMesh, v17, v16, v19);
  if (v15)
    sub_1B18797B4(v15, (uint64_t)v17, v18, v19, v20, v21, v22, v23);
  result = self->_mesh;
  if (result)
  {
    v25 = self->_world;
    if (v25)
    {
      objc_msgSend_addWorldReference_(result, v17, (uint64_t)v25, v19);
      return self->_mesh;
    }
  }
  return result;
}

- (VFXMesh)mesh
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  if ((*((_BYTE *)self + 16) & 1) == 0)
    return self->_mesh;
  v9 = sub_1B17A0848((uint64_t)self->_geometry, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  return (VFXMesh *)objc_msgSend_meshWithMeshRef_(VFXMesh, v10, v9, v11);
}

- (void)setMesh:(id)a3
{
  VFXMesh *mesh;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  mesh = self->_mesh;
  if (mesh != a3)
  {

    self->_mesh = (VFXMesh *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18DB6D4;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (void)_syncObjCModel
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id *v10;
  VFXMeshSource *v11;
  VFXMeshSource *v12;
  const char *v13;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  id *v17;
  VFXMeshElement *v18;
  VFXMeshElement *v19;
  const char *v20;
  uint64_t v21;

  objc_msgSend__syncEntityObjCModel(self, a2, v2, v3);
  objc_msgSend__fetchMesh(self, v5, v6, v7);
  self->_subdivisionIsAdaptive = sub_1B184A964((uint64_t)self->_geometry);
  self->_subdivisionSettings = ($FB11F3FFE165EAA867AAC892096804C2)sub_1B184A9C4((uint64_t)self->_geometry);

  self->_edgeCreasesSource = 0;
  v8 = (id *)sub_1B181E7E0((uint64_t)self->_geometry);
  if (v8)
  {
    v9 = (uint64_t)v8;
    v10 = sub_1B193E758(v8);
    if (v10)
    {
      v11 = v10;
    }
    else
    {
      v12 = [VFXMeshSource alloc];
      v11 = (VFXMeshSource *)objc_msgSend_initWithMeshSource_(v12, v13, v9, v14);
    }
    self->_edgeCreasesSource = v11;
  }

  self->_edgeCreasesElement = 0;
  v15 = (id *)sub_1B17A4568((uint64_t)self->_geometry);
  if (v15)
  {
    v16 = (uint64_t)v15;
    v17 = sub_1B193E758(v15);
    if (v17)
    {
      v18 = v17;
    }
    else
    {
      v19 = [VFXMeshElement alloc];
      v18 = (VFXMeshElement *)objc_msgSend_initWithMeshElement_(v19, v20, v16, v21);
    }
    self->_edgeCreasesElement = v18;
  }
}

- (id)modelDescription
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
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;

  v5 = (void *)objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3);
  v9 = (void *)objc_msgSend_name(self, v6, v7, v8);
  v13 = objc_msgSend_length(v9, v10, v11, v12);
  v14 = (objc_class *)objc_opt_class();
  v18 = NSStringFromClass(v14);
  if (v13)
  {
    v19 = objc_msgSend_name(self, v15, v16, v17);
    v29 = objc_msgSend_mesh(self, v20, v21, v22);
    objc_msgSend_appendFormat_(v5, v23, (uint64_t)CFSTR("%@: %p '%@' - mesh: %@"), v24, v18, self, v19, v29);
  }
  else
  {
    v28 = objc_msgSend_mesh(self, v15, v16, v17);
    objc_msgSend_appendFormat_(v5, v25, (uint64_t)CFSTR("%@: %p - mesh: %@"), v26, v18, self, v28);
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
  v5 = objc_msgSend_modelDescription(self, a2, v2, v3);
  return (NSString *)objc_msgSend_stringWithFormat_(v4, v6, (uint64_t)CFSTR("<%@>"), v7, v5);
}

- (__CFXGeometry)geometryRef
{
  return self->_geometry;
}

- (void)_setGeometryRef:(__CFXGeometry *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFXGeometry *v8;
  __CFXGeometry *geometry;
  __CFXGeometry *v11;

  v8 = a3;
  geometry = self->_geometry;
  if (geometry)
  {
    sub_1B193E768((uint64_t)geometry, 0, (uint64_t)a3, v3, v4, v5, v6, v7);
    v11 = self->_geometry;
    if (v11 == v8)
      goto LABEL_10;
    if (v11)
    {
      CFRelease(v11);
      self->_geometry = 0;
    }
    if (!v8)
      goto LABEL_9;
  }
  else if (!a3)
  {
    goto LABEL_10;
  }
  v8 = (__CFXGeometry *)CFRetain(v8);
LABEL_9:
  self->_geometry = v8;
LABEL_10:
  if (v8)
    sub_1B193E768((uint64_t)v8, self, (uint64_t)a3, v3, v4, v5, v6, v7);
}

- (void)setGeometryRef:(__CFXGeometry *)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  if (self->_geometry != a3)
  {
    objc_msgSend__setGeometryRef_(self, a2, (uint64_t)a3, v3);
    objc_msgSend__fetchMesh(self, v5, v6, v7);
    objc_msgSend_willChangeValueForKey_(self, v8, (uint64_t)CFSTR("materials"), v9);
    objc_msgSend__removeAllMaterials(self, v10, v11, v12);
    objc_msgSend_didChangeValueForKey_(self, v13, (uint64_t)CFSTR("materials"), v14);
  }
}

- (id)presentationModel
{
  if ((*((_BYTE *)self + 16) & 1) == 0)
    return (id)((uint64_t (*)(__objc2_class *, char *, _QWORD))MEMORY[0x1E0DE7D20])(VFXModel, sel_presentationModelWithGeometryRef_, *((_QWORD *)self + 1));
  return self;
}

+ (id)presentationModelWithGeometryRef:(__CFXGeometry *)a3
{
  VFXModel *v4;
  const char *v5;
  uint64_t v6;

  v4 = [VFXModel alloc];
  return (id)objc_msgSend_initPresentationModelWithGeometryRef_(v4, v5, (uint64_t)a3, v6);
}

- (BOOL)isPausedOrPausedByInheritance
{
  return 0;
}

- (void)setBehaviorGraph:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[6];

  if ((id)objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3) != a3)
  {

    self->_behaviorGraph = (VFXBehaviorGraph *)a3;
    v9 = objc_msgSend_worldRef(self, v6, v7, v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1B18DBA94;
    v11[3] = &unk_1E63D53C8;
    v11[4] = self;
    v11[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
  }
}

- (VFXBehaviorGraph)behaviorGraph
{
  VFXBehaviorGraph *result;

  result = self->_behaviorGraph;
  if ((*((_BYTE *)self + 16) & 1) != 0)
    return (VFXBehaviorGraph *)((uint64_t (*)(VFXBehaviorGraph *, char *))MEMORY[0x1E0DE7D20])(result, sel_presentationBehaviorGraph);
  return result;
}

- (BOOL)_hasFixedBoundingBoxExtrema
{
  return *(_QWORD *)self->_fixedBoundingBoxExtrema != 0;
}

- (BOOL)getBoundingBoxMin:(VFXModel *)self max:(SEL)a2
{
  _OWORD *v2;
  _OWORD *v3;
  _OWORD *v4;
  _OWORD *v5;
  _OWORD *v7;
  char v8;
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
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;

  v4 = v3;
  v5 = v2;
  v7 = *(_OWORD **)self->_fixedBoundingBoxExtrema;
  if (v7 && (*((_BYTE *)self + 16) & 1) == 0)
  {
    if (v2)
      *v2 = *v7;
    if (v3)
      *v3 = *(_OWORD *)(*(_QWORD *)self->_fixedBoundingBoxExtrema + 16);
    return 1;
  }
  v9 = objc_msgSend_worldRef(self, a2, (uint64_t)v2, (uint64_t)v3);
  v17 = v9;
  if (v9)
    sub_1B187973C(v9, (uint64_t)v10, v11, v12, v13, v14, v15, v16);
  if (!objc_msgSend_geometryRef(self, v10, v11, v12))
  {
    v8 = 0;
    if (!v17)
      return v8;
    goto LABEL_16;
  }
  DWORD2(v32) = 0;
  *(_QWORD *)&v32 = 0;
  DWORD2(v31) = 0;
  *(_QWORD *)&v31 = 0;
  v25 = (const void *)objc_msgSend_geometryRef(self, v18, v19, v20);
  v8 = sub_1B17C5C88(v25, 1, (uint64_t)&v32, (uint64_t)&v31, v26, v27, v28, v29);
  if (v5)
    *v5 = v32;
  if (v4)
    *v4 = v31;
  if (v17)
LABEL_16:
    sub_1B18797B4(v17, (uint64_t)v18, v19, v20, v21, v22, v23, v24);
  return v8;
}

- (void)setBoundingBoxMin:(VFXModel *)self max:(SEL)a2
{
  float32x4_t *v2;
  float32x4_t *v3;
  float32x4_t *v5;
  float32x4_t *v6;
  uint64_t *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  float32x4_t *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  __int128 v23;
  __int128 v24;
  VFXModel *v25;
  _QWORD v26[5];

  v5 = *(float32x4_t **)self->_fixedBoundingBoxExtrema;
  if (v2 && (v6 = v3) != 0)
  {
    v7 = (uint64_t *)v2;
    if (v5)
    {
      v11 = VFXVector3EqualToVector3(*v2, *v5);
      v12 = *(float32x4_t **)self->_fixedBoundingBoxExtrema;
      if (v11)
      {
        if ((VFXVector3EqualToVector3(*v6, v12[1]) & 1) != 0)
          return;
        v12 = *(float32x4_t **)self->_fixedBoundingBoxExtrema;
      }
    }
    else
    {
      v12 = (float32x4_t *)malloc_type_malloc(0x20uLL, 0x1000040451B5BE8uLL);
      *(_QWORD *)self->_fixedBoundingBoxExtrema = v12;
    }
    *v12 = *(float32x4_t *)v7;
    *(float32x4_t *)(*(_QWORD *)self->_fixedBoundingBoxExtrema + 16) = *v6;
    v18 = objc_msgSend_worldRef(self, v8, v9, v10, v6->i64[0], v6->i64[1], *v7, v7[1]);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1B18DBD50;
    v22[3] = &unk_1E63D7EF8;
    v23 = v21;
    v24 = v20;
    v25 = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v19, v18, (uint64_t)self, v22);
  }
  else if (v5)
  {
    free(v5);
    *(_QWORD *)self->_fixedBoundingBoxExtrema = 0;
    v16 = objc_msgSend_worldRef(self, v13, v14, v15);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1B18DBD40;
    v26[3] = &unk_1E63D5378;
    v26[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v17, v16, (uint64_t)self, v26);
  }
}

- (double)boundingBox
{
  unsigned int v2;
  double result;
  int8x16_t v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  if (objc_msgSend_getBoundingBoxMin_max_(a1, a2, (uint64_t)&v4, (uint64_t)&v5))
    v2 = -1;
  else
    v2 = 0;
  *(_QWORD *)&result = vbslq_s8((int8x16_t)vdupq_n_s32(v2), v4, (int8x16_t)VFXNullBoundingBox).u64[0];
  return result;
}

- (uint64_t)setBoundingBox:(float32x4_t)a3
{
  const char *v4;
  float32x4_t v6;
  float32x4_t v7;

  v6 = a2;
  v7 = a3;
  if (VFXBoundingBoxIsNull(a2, a3))
    return objc_msgSend_setBoundingBoxMin_max_(a1, v4, 0, 0);
  else
    return objc_msgSend_setBoundingBoxMin_max_(a1, v4, (uint64_t)&v6, (uint64_t)&v7);
}

- (BOOL)getBoundingSphereCenter:(VFXModel *)self radius:(SEL)a2
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
  v16 = (const void *)objc_msgSend_geometryRef(self, v8, v9, v10);
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

- (id)getBoundingSphere
{
  VFXBoundingSphere *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  int v11;
  double v12;
  int v13;

  v13 = 0;
  v12 = 0.0;
  v11 = 0;
  if (!objc_msgSend_getBoundingSphereCenter_radius_(self, a2, (uint64_t)&v12, (uint64_t)&v11))
    return 0;
  v2 = objc_alloc_init(VFXBoundingSphere);
  objc_msgSend_setCenter_(v2, v3, v4, v5, v12);
  LODWORD(v6) = v11;
  objc_msgSend_setRadius_(v2, v7, v8, v9, v6);
  return v2;
}

- (id)getBoundingBox
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  float32x4_t v5;
  VFXBoundingBox *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;

  objc_msgSend_boundingBox(self, a2, v2, v3);
  v14 = *(double *)v4.i64;
  v15 = *(double *)v5.i64;
  v4.i32[3] = 0;
  v5.i32[3] = 0;
  if ((VFXBoundingBoxIsNull(v4, v5) & 1) != 0)
    return 0;
  v7 = objc_alloc_init(VFXBoundingBox);
  objc_msgSend_setMin_(v7, v8, v9, v10, v14);
  objc_msgSend_setMax_(v7, v11, v12, v13, v15);
  return v7;
}

- (void)_setAttributes:(id)a3
{
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_1B18DC030;
  v4[3] = &unk_1E63D54B0;
  v4[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(a3, a2, (uint64_t)v4, v3);
}

- (void)_setupObjCModelFrom:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[5];

  objc_msgSend_begin(VFXTransaction, a2, (uint64_t)a3, v3);
  objc_msgSend_setImmediateMode_(VFXTransaction, v6, 1, v7);
  v11 = objc_msgSend_mesh(a3, v8, v9, v10);
  objc_msgSend_setMesh_(self, v12, v11, v13);
  v17 = objc_msgSend_levelsOfDetail(a3, v14, v15, v16);
  objc_msgSend_setLevelsOfDetail_(self, v18, v17, v19);
  v23 = objc_msgSend_materials(a3, v20, v21, v22);
  objc_msgSend_setMaterials_(self, v24, v23, v25);
  v29 = objc_msgSend_subdivisionLevel(a3, v26, v27, v28);
  objc_msgSend_setSubdivisionLevel_(self, v30, v29, v31);
  v35 = objc_msgSend_wantsAdaptiveSubdivision(a3, v32, v33, v34);
  objc_msgSend_setWantsAdaptiveSubdivision_(self, v36, v35, v37);
  v41 = objc_msgSend__subdivisionSettings(a3, v38, v39, v40);
  objc_msgSend_set_subdivisionSettings_(self, v42, v41, v43);
  objc_msgSend__copyAnimationsFrom_(self, v44, (uint64_t)a3, v45);
  os_unfair_lock_lock((os_unfair_lock_t)a3 + 40);
  v46 = (void *)*((_QWORD *)a3 + 19);
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = sub_1B18DC170;
  v58[3] = &unk_1E63D54B0;
  v58[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v46, v47, (uint64_t)v58, v48);
  os_unfair_lock_unlock((os_unfair_lock_t)a3 + 40);
  v52 = objc_msgSend_tessellator(a3, v49, v50, v51);
  objc_msgSend_setTessellator_(self, v53, v52, v54);
  objc_msgSend_commitImmediate(VFXTransaction, v55, v56, v57);
}

- (void)_copyAttributesTo:(id)a3
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v13 = (id)objc_msgSend_mutableCopy(self->_valuesForUndefinedKeys, v6, v7, v8);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  objc_msgSend__setAttributes_(a3, v9, (uint64_t)v13, v10);
  objc_msgSend_copyShaderModifiersAndLanguageVersionFrom_(a3, v11, (uint64_t)self, v12);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v5 = (const void *)objc_msgSend_geometryRef(self, a2, (uint64_t)a3, v3);
  v13 = (const void *)sub_1B17A148C(v5, v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_alloc((Class)objc_opt_class());
  v19 = (void *)objc_msgSend_initWithGeometryRef_(v14, v15, (uint64_t)v13, v16);
  if (v13)
    CFRelease(v13);
  objc_msgSend__setupObjCModelFrom_(v19, v17, (uint64_t)self, v18);
  if (objc_msgSend_behaviorGraph(self, v20, v21, v22))
  {
    v26 = (void *)objc_msgSend_behaviorGraph(self, v23, v24, v25);
    v30 = objc_msgSend_copy(v26, v27, v28, v29);
    objc_msgSend_setBehaviorGraph_(v19, v31, v30, v32);
    v36 = (void *)objc_msgSend_behaviorGraph(v19, v33, v34, v35);
    v40 = (void *)objc_msgSend_entityObject(v36, v37, v38, v39);
    v48 = objc_msgSend_identifier(self, v41, v42, v43);
    v49[0] = v19;
    v45 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v44, (uint64_t)v49, (uint64_t)&v48, 1);
    objc_msgSend_updateBridgedReferencesWithBridgeable_objectByIdentifier_(v40, v46, (uint64_t)v19, v45);
  }
  objc_msgSend__copyAttributesTo_(self, v23, (uint64_t)v19, v25);
  return v19;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (void)enumerateDependencies:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_msgSend_materials(self, a2, (uint64_t)a3, v3, 0);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        (*((void (**)(id, _QWORD))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v9);
  }
  (*((void (**)(id, VFXMesh *))a3 + 2))(a3, self->_mesh);
}

- (void)didAttachToWorld:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
  objc_msgSend_wasAddedToWorld_(v5, v6, (uint64_t)self->_world, v7);
}

- (void)didDetachFromWorld:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
  objc_msgSend_willBeRemovedFromWorld_(v5, v6, (uint64_t)self->_world, v7);
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
    v8[2] = sub_1B18DC558;
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
        v15[2] = sub_1B18DC610;
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

- (id)keyForNodeAttributes
{
  return CFSTR("model");
}

- (void)_expand
{
  const char *v3;
  uint64_t v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const __CFArray *v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  VFXWorld *world;
  uint64_t v40;

  objc_sync_enter(self);
  objc_msgSend_willChangeValueForKey_(self, v3, (uint64_t)CFSTR("materials"), v4);
  if (self->_materials)
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: leaking materials array"), v6, v7, v8, v9, v10, v11, v40);
  v12 = objc_msgSend_geometryRef(self, v5, v6, v7);
  v20 = (uint64_t)sub_1B17A08A0(v12, v13, v14, v15, v16, v17, v18, v19);
  v21 = objc_alloc(MEMORY[0x1E0C99DE8]);
  self->_materials = (NSMutableArray *)objc_msgSend_initWithCapacity_(v21, v22, v20, v23);
  if (v20 >= 1)
  {
    for (i = 0; i != v20; ++i)
    {
      v28 = objc_msgSend_geometryRef(self, v24, (uint64_t)v25, v26);
      v25 = sub_1B17A08FC(v28, i, v29, v30, v31, v32, v33, v34);
      if (v25)
      {
        v35 = (void *)objc_msgSend_materialWithMaterialRef_(VFXMaterial, v24, (uint64_t)v25, v26);
        v38 = (uint64_t)v35;
        world = self->_world;
        if (world)
          objc_msgSend_addWorldReference_(v35, v36, (uint64_t)world, v37);
        objc_msgSend_addObject_(self->_materials, v36, v38, v37);
      }
    }
  }
  objc_msgSend_didChangeValueForKey_(self, v24, (uint64_t)CFSTR("materials"), v26);
  objc_sync_exit(self);
}

- (id)_materialWithName:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = (void *)objc_msgSend_materials(self, a2, (uint64_t)a3, v3, 0);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v19, (uint64_t)v23, 16);
  if (!v7)
    return 0;
  v11 = v7;
  v12 = *(_QWORD *)v20;
LABEL_3:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v20 != v12)
      objc_enumerationMutation(v5);
    v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
    v15 = (void *)objc_msgSend_name(v14, v8, v9, v10);
    if ((objc_msgSend_isEqualToString_(v15, v16, (uint64_t)a3, v17) & 1) != 0)
      return v14;
    if (v11 == ++v13)
    {
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v19, (uint64_t)v23, 16);
      if (v11)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)materialWithName:(id)a3
{
  uint64_t v3;
  id result;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  result = (id)objc_msgSend__materialWithName_(self, a2, (uint64_t)a3, v3);
  if ((*((_BYTE *)self + 16) & 1) != 0)
    return (id)objc_msgSend_presentationMaterial(result, v6, v7, v8);
  return result;
}

- (unint64_t)countOfMaterials
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *materials;

  materials = self->_materials;
  if (!materials)
  {
    objc_msgSend__expand(self, a2, v2, v3);
    materials = self->_materials;
  }
  return objc_msgSend_count(materials, a2, v2, v3);
}

- (id)objectInMaterialsAtIndex:(unint64_t)a3
{
  uint64_t v3;
  NSMutableArray *materials;

  materials = self->_materials;
  if (!materials)
  {
    objc_msgSend__expand(self, a2, a3, v3);
    materials = self->_materials;
  }
  return (id)objc_msgSend_objectAtIndex_(materials, a2, a3, v3);
}

- (void)insertObject:(id)a3 inMaterialsAtIndex:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *materials;
  const char *v12;
  uint64_t v13;
  VFXWorld *world;
  uint64_t v15;
  const char *v16;
  _QWORD v17[7];

  if (!a3)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), 0, a4, v4, v5, v6, v7, (uint64_t)"child");
  materials = self->_materials;
  if (!materials)
  {
    objc_msgSend__expand(self, a2, (uint64_t)a3, a4);
    materials = self->_materials;
  }
  objc_msgSend_insertObject_atIndex_(materials, a2, (uint64_t)a3, a4);
  world = self->_world;
  if (world)
    objc_msgSend_addWorldReference_(a3, v12, (uint64_t)world, v13);
  v15 = objc_msgSend_worldRef(self, v12, (uint64_t)world, v13);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = sub_1B18DC9C8;
  v17[3] = &unk_1E63D7EA8;
  v17[4] = self;
  v17[5] = a3;
  v17[6] = a4;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v16, v15, (uint64_t)self, v17);
}

- (void)removeObjectFromMaterialsAtIndex:(unint64_t)a3
{
  uint64_t v3;
  NSMutableArray *materials;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  _QWORD v22[6];

  materials = self->_materials;
  if (!materials)
  {
    objc_msgSend__expand(self, a2, a3, v3);
    materials = self->_materials;
  }
  if (objc_msgSend_count(materials, a2, a3, v3) <= a3)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. removeObjectFromMaterialsAtIndex: index out of bounds"), v8, v9, v10, v11, v12, v13, (uint64_t)"index < [_materials count]");
  if (self->_world)
  {
    v14 = (void *)objc_msgSend_objectAtIndex_(self->_materials, v7, a3, v9);
    objc_msgSend_removeWorldReference_(v14, v15, (uint64_t)self->_world, v16);
  }
  objc_msgSend_removeObjectAtIndex_(self->_materials, v7, a3, v9);
  v20 = objc_msgSend_worldRef(self, v17, v18, v19);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1B18DCAE4;
  v22[3] = &unk_1E63D5440;
  v22[4] = self;
  v22[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v22);
}

- (void)replaceObjectInMaterialsAtIndex:(unint64_t)a3 withObject:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  VFXWorld *world;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  _QWORD v21[7];

  if (!a4)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), a3, 0, v4, v5, v6, v7, (uint64_t)"child");
  if (!self->_materials)
    objc_msgSend__expand(self, a2, a3, (uint64_t)a4);
  v11 = objc_msgSend_worldRef(self, a2, a3, (uint64_t)a4);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1B18DCBE0;
  v21[3] = &unk_1E63D7EA8;
  v21[4] = self;
  v21[5] = a4;
  v21[6] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v21);
  world = self->_world;
  if (world)
  {
    objc_msgSend_addWorldReference_(a4, v13, (uint64_t)world, v14);
    v18 = (void *)objc_msgSend_objectAtIndex_(self->_materials, v16, a3, v17);
    objc_msgSend_removeWorldReference_(v18, v19, (uint64_t)self->_world, v20);
  }
  objc_msgSend_replaceObjectAtIndex_withObject_(self->_materials, v13, a3, (uint64_t)a4);
}

- (NSArray)materials
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *materials;
  NSArray *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;

  if (!self->_materials)
    objc_msgSend__expand(self, a2, v2, v3);
  materials = self->_materials;
  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v11 = objc_msgSend_count(materials, a2, v2, v3);
    v12 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v6 = (NSArray *)(id)objc_msgSend_initWithCapacity_(v12, v13, v11, v14);
    if (v11 >= 1)
    {
      for (i = 0; i != v11; ++i)
      {
        v19 = (void *)objc_msgSend_objectAtIndex_(self->_materials, v15, i, v17);
        v23 = objc_msgSend_presentationMaterial(v19, v20, v21, v22);
        objc_msgSend_addObject_(v6, v24, v23, v25);
      }
    }
    v10 = objc_msgSend_count(v6, v15, v16, v17);
  }
  else
  {
    v6 = (NSArray *)(id)objc_msgSend_copy(materials, a2, v2, v3);
    v10 = objc_msgSend_count(v6, v7, v8, v9);
  }
  if (v10)
    return v6;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)mutableMaterials
{
  uint64_t v2;
  uint64_t v3;
  id result;

  result = self->_materials;
  if (!result)
  {
    objc_msgSend__expand(self, a2, v2, v3);
    return self->_materials;
  }
  return result;
}

- (id)_firstMaterial
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

  v4 = (void *)objc_msgSend_mutableMaterials(self, a2, v2, v3);
  if (v4 && (v8 = v4, objc_msgSend_count(v4, v5, v6, v7)))
    return (id)objc_msgSend_objectAtIndex_(v8, v9, 0, v10);
  else
    return 0;
}

- (VFXMaterial)firstMaterial
{
  uint64_t v2;
  uint64_t v3;
  VFXMaterial *result;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  result = (VFXMaterial *)objc_msgSend__firstMaterial(self, a2, v2, v3);
  if ((*((_BYTE *)self + 16) & 1) != 0)
    return (VFXMaterial *)objc_msgSend_presentationMaterial(result, v6, v7, v8);
  return result;
}

- (void)setFirstMaterial:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  if (a3)
  {
    v6 = (void *)objc_msgSend_mutableMaterials(self, a2, (uint64_t)a3, v3);
    if (objc_msgSend_count(v6, v7, v8, v9))
      MEMORY[0x1E0DE7D20](self, sel_replaceObjectInMaterialsAtIndex_withObject_, 0, a3);
    else
      objc_msgSend_insertMaterial_atIndex_(self, v10, (uint64_t)a3, 0);
  }
  else if (objc_msgSend_count(self->_materials, a2, 0, v3))
  {
    MEMORY[0x1E0DE7D20](self, sel_removeMaterialAtIndex_, 0, v11);
  }
}

- (void)insertMaterial:(id)a3 atIndex:(unint64_t)a4
{
  MEMORY[0x1E0DE7D20](self, sel_insertObject_inMaterialsAtIndex_, a3, a4);
}

- (void)removeMaterial:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = (void *)objc_msgSend_materials(self, a2, (uint64_t)a3, v3);
  v9 = objc_msgSend_indexOfObject_(v6, v7, (uint64_t)a3, v8);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    MEMORY[0x1E0DE7D20](self, sel_removeObjectFromMaterialsAtIndex_, v9, v10);
}

- (void)removeMaterialAtIndex:(unint64_t)a3
{
  ((void (*)(VFXModel *, char *, unint64_t))MEMORY[0x1E0DE7D20])(self, sel_removeObjectFromMaterialsAtIndex_, a3);
}

- (void)replaceMaterialAtIndex:(unint64_t)a3 withMaterial:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_replaceObjectInMaterialsAtIndex_withObject_, a3, a4);
}

- (void)replaceMaterial:(id)a3 with:(id)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = (void *)objc_msgSend_materials(self, a2, (uint64_t)a3, (uint64_t)a4);
  v10 = objc_msgSend_indexOfObject_(v7, v8, (uint64_t)a3, v9);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    MEMORY[0x1E0DE7D20](self, sel_replaceObjectInMaterialsAtIndex_withObject_, v10, a4);
}

- (void)_removeAllMaterials
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *materials;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_world)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    materials = self->_materials;
    v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(materials, a2, (uint64_t)&v10, (uint64_t)v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(materials);
          objc_msgSend_removeWorldReference_(*(void **)(*((_QWORD *)&v10 + 1) + 8 * i), a2, (uint64_t)self->_world, v3);
        }
        v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(materials, a2, (uint64_t)&v10, (uint64_t)v14, 16);
      }
      while (v7);
    }
  }
  objc_msgSend_removeAllObjects(self->_materials, a2, v2, v3);
}

- (void)removeAllMaterials
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];

  objc_msgSend__removeAllMaterials(self, a2, v2, v3);
  v8 = objc_msgSend_worldRef(self, v5, v6, v7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1B18DD044;
  v10[3] = &unk_1E63D5378;
  v10[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  if (!self->_materials)
    self->_materials = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
}

- (void)setMaterials:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  const char *v15;

  objc_msgSend_removeAllMaterials(self, a2, (uint64_t)a3, v3);
  v9 = objc_msgSend_count(a3, v6, v7, v8);
  if (v9)
  {
    v12 = v9;
    for (i = 0; i != v12; ++i)
    {
      v14 = objc_msgSend_objectAtIndex_(a3, v10, i, v11);
      objc_msgSend_insertMaterial_atIndex_(self, v15, v14, i);
    }
  }
}

- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5 remainingPath:(id *)a6
{
  uint64_t v10;
  const char *v11;
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
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  id *v55;
  id *v56;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E6478B98, a2, (uint64_t)&v58, (uint64_t)v62, 16);
  if (v10)
  {
    v13 = v10;
    v55 = a6;
    v56 = a5;
    v14 = *(_QWORD *)v59;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v59 != v14)
          objc_enumerationMutation(&unk_1E6478B98);
        v16 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v15);
        v17 = (void *)objc_msgSend_stringByAppendingString_(v16, v11, (uint64_t)CFSTR("["), v12);
        if (objc_msgSend_hasPrefix_(a3, v18, (uint64_t)v17, v19))
        {
          v21 = objc_msgSend_length(v17, v11, v20, v12);
          v25 = objc_msgSend_length(a4, v22, v23, v24);
          v27 = (void *)objc_msgSend_substringWithRange_(a4, v26, v21, v25 - v21);
          v30 = objc_msgSend_rangeOfString_(v27, v28, (uint64_t)CFSTR("]"), v29);
          if (v11 == (const char *)1)
          {
            v31 = v30;
            v32 = (void *)objc_msgSend_substringWithRange_(v27, (const char *)1, 0, v30);
            v36 = objc_msgSend_intValue(v32, v33, v34, v35);
            v39 = (void *)objc_msgSend_valueForKey_(self, v37, (uint64_t)v16, v38);
            if (objc_msgSend_count(v39, v40, v41, v42) > (unint64_t)v36)
            {
              v46 = objc_msgSend_objectAtIndex_(v39, v11, v36, v12);
              if (v55)
              {
                v47 = v21 + v31 + 2;
                if (v47 >= objc_msgSend_length(a4, v43, v44, v45))
                {
                  v53 = 0;
                }
                else
                {
                  v51 = objc_msgSend_length(a4, v48, v49, v50);
                  v53 = objc_msgSend_substringWithRange_(a4, v52, v47, v51 - v47);
                }
                *v55 = (id)v53;
              }
              *v56 = (id)v46;
              LOBYTE(v10) = 1;
              return v10;
            }
          }
        }
        ++v15;
      }
      while (v13 != v15);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(&unk_1E6478B98, v11, (uint64_t)&v58, (uint64_t)v62, 16);
      v13 = v10;
      if (v10)
        continue;
      break;
    }
  }
  return v10;
}

- (id)copyAnimationChannelForKeyPath:(id)a3 animation:(id)a4
{
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;

  if (!objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4))
    return 0;
  v90 = 0;
  v91 = 0;
  sub_1B18BCE30(a3, (char *)&v91, &v90, v7);
  v88 = 0;
  v89 = 0;
  if (objc_msgSend_parseSpecialKey_withPath_intoDestination_remainingPath_(self, v8, v91, (uint64_t)a3, &v88, &v89))
  {
    v11 = objc_msgSend_copyAnimationChannelForKeyPath_animation_(v88, v9, v89, (uint64_t)a4);
    if (v11)
    {
      v12 = (void *)v11;
      v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v17 = objc_msgSend_count(v12, v14, v15, v16);
      v20 = (void *)objc_msgSend_initWithCapacity_(v13, v18, v17 + 1, v19);
      objc_msgSend_addObject_(v20, v21, v91, v22);
      objc_msgSend_addObjectsFromArray_(v20, v23, (uint64_t)v12, v24);

      return v20;
    }
    return 0;
  }
  v88 = (void *)objc_msgSend_valueForKey_(self, v9, v91, v10);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (v28 = (void *)objc_msgSend_copyAnimationChannelForKeyPath_animation_(v88, v25, v90, (uint64_t)a4)) != 0)
  {
    v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v33 = objc_msgSend_count(v28, v30, v31, v32);
    v20 = (void *)objc_msgSend_initWithCapacity_(v29, v34, v33 + 1, v35);
    objc_msgSend_addObject_(v20, v36, v91, v37);
    objc_msgSend_addObjectsFromArray_(v20, v38, (uint64_t)v28, v39);

  }
  else
  {
    if (self->_shadableHelper)
    {
      os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
      v42 = objc_msgSend_objectForKey_(self->_valuesForUndefinedKeys, v40, (uint64_t)a3, v41);
      os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
      if (!v42)
      {
        v44 = sub_1B18C1F14(a4);
        if ((_DWORD)v44)
        {
          v53 = sub_1B19BA26C(v44, v45, v46, v47, v48, v49, v50, v51, v52);
          v57 = objc_msgSend_worldRef(self, v54, v55, v56);
          if (v57)
          {
            v65 = v57;
            sub_1B187973C(v57, (uint64_t)v58, v59, v60, v61, v62, v63, v64);
            objc_msgSend_begin(VFXTransaction, v66, v67, v68);
            objc_msgSend_setImmediateMode_(VFXTransaction, v69, 1, v70);
            objc_msgSend_setValue_forUndefinedKey_(self, v71, v53, (uint64_t)a3);
            objc_msgSend_commitImmediate(VFXTransaction, v72, v73, v74);
            sub_1B18797B4(v65, v75, v76, v77, v78, v79, v80, v81);
          }
          else
          {
            objc_msgSend_begin(VFXTransaction, v58, v59, v60);
            objc_msgSend_setImmediateMode_(VFXTransaction, v82, 1, v83);
            objc_msgSend_setValue_forUndefinedKey_(self, v84, v53, (uint64_t)a3);
            objc_msgSend_commitImmediate(VFXTransaction, v85, v86, v87);
          }
        }
        else
        {
          sub_1B17C4408(0, (uint64_t)CFSTR("Warning: can't prepare shadable animation with path %@"), v46, v47, v48, v49, v50, v51, (uint64_t)a3);
        }
      }
    }
    return sub_1B18C2DEC(self, (__CFString *)a3, v26, v27);
  }
  return v20;
}

- (void)setLevelsOfDetail:(id)a3
{
  NSArray *levelsOfDetail;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  _QWORD v17[6];

  levelsOfDetail = self->_levelsOfDetail;
  if (levelsOfDetail != a3)
  {

    self->_levelsOfDetail = (NSArray *)objc_msgSend_copy(a3, v6, v7, v8);
    v11 = objc_msgSend_sortedArrayUsingComparator_(a3, v9, (uint64_t)&unk_1E63D1010, v10);
    v15 = objc_msgSend_worldRef(self, v12, v13, v14);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1B18DD674;
    v17[3] = &unk_1E63D53C8;
    v17[4] = v11;
    v17[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v16, v15, (uint64_t)self, v17);
  }
}

- (NSArray)levelsOfDetail
{
  return self->_levelsOfDetail;
}

- (VFXModelTessellator)tessellator
{
  return self->_tessellator;
}

- (void)setTessellator:(id)a3
{
  uint64_t v3;
  VFXModelTessellator *tessellator;
  VFXModelTessellator *v7;
  uint64_t v8;

  tessellator = self->_tessellator;
  if (tessellator != a3)
  {
    objc_msgSend_removeClient_(tessellator, a2, (uint64_t)self, v3);

    v7 = (VFXModelTessellator *)a3;
    self->_tessellator = v7;
    MEMORY[0x1E0DE7D20](v7, sel_addClient_, self, v8);
  }
}

- ($DCA043AFB23218D33360BC4455B4EE77)_subdivisionSettings
{
  return ($DCA043AFB23218D33360BC4455B4EE77)self->_subdivisionSettings;
}

- (void)set_subdivisionSettings:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  $DCA043AFB23218D33360BC4455B4EE77 v9;
  $DCA043AFB23218D33360BC4455B4EE77 v10;

  v10 = a3;
  if (a3 != *(_DWORD *)&self->_subdivisionSettings)
  {
    self->_subdivisionSettings = ($FB11F3FFE165EAA867AAC892096804C2)a3;
    v6 = objc_msgSend_worldRef(self, a2, *(uint64_t *)&a3.var0, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B18DD830;
    v8[3] = &unk_1E63D53A0;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (unint64_t)subdivisionLevel
{
  return self->_subdivisionLevel;
}

- (void)setSubdivisionLevel:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  VFXModelTessellator *tessellator;
  uint64_t v9;
  const char *v10;
  _QWORD v11[12];

  if (a3 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v11[10] = v4;
    v11[11] = v5;
    if (self->_subdivisionLevel != a3)
    {
      self->_subdivisionLevel = a3;
      tessellator = self->_tessellator;
      if (tessellator)
        objc_msgSend_tessellatorValueDidChangeForClient_(tessellator, a2, (uint64_t)self, v3);
      v9 = objc_msgSend_worldRef(self, a2, a3, v3);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = sub_1B18DD920;
      v11[3] = &unk_1E63D5440;
      v11[4] = self;
      v11[5] = a3;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v10, v9, (uint64_t)self, v11);
    }
  }
}

- (BOOL)wantsAdaptiveSubdivision
{
  return self->_subdivisionIsAdaptive;
}

- (void)setWantsAdaptiveSubdivision:(BOOL)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];
  BOOL v9;

  if (self->_subdivisionIsAdaptive != a3)
  {
    self->_subdivisionIsAdaptive = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B18DD9F4;
    v8[3] = &unk_1E63D5328;
    v8[4] = self;
    v9 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (VFXMeshElement)edgeCreasesElement
{
  return self->_edgeCreasesElement;
}

- (void)setEdgeCreasesElement:(id)a3
{
  uint64_t v3;
  VFXMeshElement *edgeCreasesElement;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  _QWORD v18[5];
  uint64_t v19;

  edgeCreasesElement = self->_edgeCreasesElement;
  if (edgeCreasesElement != a3)
  {
    if (a3)
    {
      if (objc_msgSend_primitiveType(a3, a2, (uint64_t)a3, v3) != 2)
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: Cannot set edge creases element because its primitive type is not VFXMeshPrimitiveTypeLine"), v7, v8, v9, v10, v11, v12, v19);
        return;
      }
      edgeCreasesElement = self->_edgeCreasesElement;
    }

    self->_edgeCreasesElement = (VFXMeshElement *)a3;
    v16 = objc_msgSend_worldRef(self, v13, v14, v15);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B18DDAFC;
    v18[3] = &unk_1E63D5378;
    v18[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v17, v16, (uint64_t)self, v18);
  }
}

- (VFXMeshSource)edgeCreasesSource
{
  return self->_edgeCreasesSource;
}

- (void)setEdgeCreasesSource:(id)a3
{
  uint64_t v3;
  VFXMeshSource *edgeCreasesSource;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  _QWORD v21[5];
  uint64_t v22;

  edgeCreasesSource = self->_edgeCreasesSource;
  if (edgeCreasesSource != a3)
  {
    if (a3)
    {
      v7 = (void *)objc_msgSend_semantic(a3, a2, (uint64_t)a3, v3);
      if (!objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("kGeometrySourceSemanticEdgeCrease"), v9))
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: Cannot set edge creases source because its semantic is not VFXMeshSourceSemanticEdgeCrease"), v10, v11, v12, v13, v14, v15, v22);
        return;
      }
      edgeCreasesSource = self->_edgeCreasesSource;
    }

    self->_edgeCreasesSource = (VFXMeshSource *)a3;
    v19 = objc_msgSend_worldRef(self, v16, v17, v18);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = sub_1B18DDC24;
    v21[3] = &unk_1E63D5378;
    v21[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v20, v19, (uint64_t)self, v21);
  }
}

- (__CFXMaterial)materialRefCreateIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFXMaterial *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFXMaterial *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = (_QWORD *)objc_msgSend_geometryRef(self, a2, v2, v3);
  v12 = (__CFXMaterial *)sub_1B17A0A4C((uint64_t)v4);
  if (!v12)
  {
    if ((uint64_t)sub_1B17A08A0((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11) >= 1
      && (v19 = sub_1B17A08FC((uint64_t)v4, 0, v13, v14, v15, v16, v17, v18)) != 0)
    {
      v27 = (__CFXMaterial *)sub_1B1877BDC((uint64_t)v19, v20, v21, v22, v23, v24, v25, v26);
    }
    else
    {
      v27 = (__CFXMaterial *)sub_1B1877ABC();
    }
    v12 = v27;
    sub_1B17A2148(v4, v27, v28, v29, v30, v31, v32, v33);
  }
  return v12;
}

- (__CFXMaterial)materialRef
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = objc_msgSend_geometryRef(self, a2, v2, v3);
  return (__CFXMaterial *)sub_1B17A0A4C(v4);
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  if (objc_msgSend_hasPrefix_(a4, a2, (uint64_t)CFSTR("materials["), (uint64_t)a4))
  {
    v10 = 0;
    if (objc_msgSend_parseSpecialKey_withPath_intoDestination_remainingPath_(self, v7, (uint64_t)a4, (uint64_t)a4, &v10, 0)&& v10)
    {
      if (a3)
        objc_msgSend_replaceMaterial_with_(self, v8, v10, (uint64_t)a3);
      else
        objc_msgSend_removeMaterial_(self, v8, v10, v9);
    }
  }
  else
  {
    MEMORY[0x1E0DE7D20](self, sel__shadableSetValue_forUndefinedKey_, a3, a4);
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v3;
  const char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  const __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  void *v64;
  const char *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;

  if ((*((_BYTE *)self + 16) & 1) != 0)
  {
    v8 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
    v16 = v8;
    if (v8)
      sub_1B187973C(v8, v9, v10, v11, v12, v13, v14, v15);
    v17 = (void *)sub_1B193FCB0((uint64_t)self->_geometry, a3, v10, v11, v12, v13, v14, v15);
    v7 = v17;
    if (v17)
    {
      v25 = (double *)sub_1B191E41C((uint64_t)v17, v18, v19, v20, v21, v22, v23, v24);
      v33 = (const char *)sub_1B191E464((uint64_t)v7, v26, v27, v28, v29, v30, v31, v32);
      v7 = (void *)sub_1B19BA16C(v25, v33, v36, v34, v35);
    }
    if (v16)
      sub_1B18797B4(v16, v18, v19, v20, v21, v22, v23, v24);
    if (v7)
      return v7;
    v37 = sub_1B19C1A30(&self->_geometry->var0.var0.var0, (CFStringRef)a3, 0);
    if (v37)
    {
      v44 = v37;
      if (sub_1B19C4614((uint64_t)v37, v38, v39, v3, v40, v41, v42, v43))
      {
        v52 = (double *)sub_1B19C4614((uint64_t)v44, v45, v46, v47, v48, v49, v50, v51);
        v60 = (const char *)sub_1B19C4770((uint64_t)v44, v53, v54, v55, v56, v57, v58, v59);
        v64 = (void *)sub_1B19BA16C(v52, v60, v63, v61, v62);
        CFRelease(v44);
        return v64;
      }
      CFRelease(v44);
    }
  }
  v70 = 0;
  v71 = 0;
  v69 = 0;
  sub_1B18BCE30(a3, (char *)&v70, &v69, v3);
  if (objc_msgSend_parseSpecialKey_withPath_intoDestination_remainingPath_(self, v6, v70, (uint64_t)a3, &v71, 0))return v71;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v68 = (id)objc_msgSend_objectForKey_(self->_valuesForUndefinedKeys, v66, (uint64_t)a3, v67);
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
  return v68;
}

- (void)_shadableSetValue:(id)a3 forUndefinedKey:(id)a4
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  const char *v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  char isKindOfClass;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  NSMutableDictionary *valuesForUndefinedKeys;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  id v27;
  char v28;
  const char *v29;
  _UNKNOWN **v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  void *v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
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
  uint64_t v75;
  uint64_t v76;
  _QWORD v77[8];
  _QWORD v78[7];
  _QWORD cf[2];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v10 = (id)objc_msgSend_objectForKey_(self->_valuesForUndefinedKeys, v8, (uint64_t)a4, v9);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
    objc_msgSend_willChangeValueForKey_(self, v14, (uint64_t)CFSTR("customMaterialProperties"), v15);
    objc_msgSend_willChangeValueForKey_(self, v16, (uint64_t)CFSTR("customMaterialAttributes"), v17);
    os_unfair_lock_lock(p_valuesForUndefinedKeysLock);
  }
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  if (a3)
  {
    if (!valuesForUndefinedKeys)
    {
      valuesForUndefinedKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_valuesForUndefinedKeys = valuesForUndefinedKeys;
    }
    objc_msgSend_setObject_forKey_(valuesForUndefinedKeys, v11, (uint64_t)a3, (uint64_t)a4);
  }
  else
  {
    objc_msgSend_removeObjectForKey_(valuesForUndefinedKeys, v11, (uint64_t)a4, v12);
  }
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend_didChangeValueForKey_(self, v19, (uint64_t)CFSTR("customMaterialProperties"), v21);
    objc_msgSend_didChangeValueForKey_(self, v22, (uint64_t)CFSTR("customMaterialAttributes"), v23);
  }
  v24 = objc_msgSend___CFObject(self, v19, v20, v21);
  objc_opt_class();
  v27 = a4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_unlinkCustomPropertyWithParent_(v10, v25, (uint64_t)self, v26);
    v27 = 0;
  }

  objc_opt_class();
  v28 = objc_opt_isKindOfClass();
  v30 = &off_1E636B000;
  v31 = MEMORY[0x1E0C809B0];
  if ((v28 & 1) != 0)
  {
    objc_msgSend_linkCustomPropertyWithParent_andCustomName_(a3, v29, (uint64_t)self, (uint64_t)a4);
    v35 = (const void *)objc_msgSend_materialProperty(a3, v32, v33, v34);
    if (v35)
      v39 = (uint64_t)CFRetain(v35);
    else
      v39 = 0;
    v27 = 0;
  }
  else
  {
    v39 = sub_1B19BA44C(self, a4);
    if (!v39)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = (uint64_t)sub_1B19BA12C(a3, v61, v62, v63);
        if (!v39)
          goto LABEL_20;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v39 = 0;
          goto LABEL_20;
        }
        cf[0] = sub_1B18BCF20(a3, 0);
        cf[1] = v64;
        v39 = sub_1B191E290(9, 1, v65, v66, v67, v68, v69, v70);
        sub_1B191E4F4(v39, cf, v71, v72, v73, v74, v75, v76);
        if (!v39)
          goto LABEL_20;
      }
    }
    if (!v10)
    {
      v44 = sub_1B191E464(v39, (uint64_t)v36, v37, v38, v40, v41, v42, v43);
      v52 = sub_1B191E394(v44, v45, v46, v47, v48, v49, v50, v51);
      v56 = objc_msgSend_worldRef(self, v53, v54, v55);
      v78[0] = v31;
      v78[1] = 3221225472;
      v78[2] = sub_1B18DE21C;
      v78[3] = &unk_1E63D7D70;
      v78[4] = a4;
      v78[5] = v24;
      v78[6] = v52;
      v30 = &off_1E636B000;
      objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v57, v56, (uint64_t)self, v78);
    }
  }
LABEL_20:
  v58 = v30[223];
  v59 = objc_msgSend_worldRef(self, v36, v37, v38);
  v77[0] = v31;
  v77[1] = 3221225472;
  v77[2] = sub_1B18DE25C;
  v77[3] = &unk_1E63D7D98;
  v77[6] = v39;
  v77[7] = v24;
  v77[4] = a4;
  v77[5] = a3;
  objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(v58, v60, v59, (uint64_t)self, v27, v77);
}

- (id)customMaterialPropertyNames
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *valuesForUndefinedKeys;
  const char *v13;
  uint64_t v14;
  _QWORD v16[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  v11 = (void *)objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1B18DE354;
  v16[3] = &unk_1E63D54B0;
  v16[4] = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(valuesForUndefinedKeys, v13, (uint64_t)v16, v14);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (id)customMaterialProperties
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  v11 = (void *)objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  v15 = (void *)objc_msgSend_allKeys(self->_valuesForUndefinedKeys, v12, v13, v14);
  v18 = (void *)objc_msgSend_sortedArrayUsingComparator_(v15, v16, (uint64_t)&unk_1E63D1B30, v17);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v28, (uint64_t)v32, 16);
  if (v20)
  {
    v23 = v20;
    v24 = *(_QWORD *)v29;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v29 != v24)
          objc_enumerationMutation(v18);
        v26 = objc_msgSend_valueForKey_(self->_valuesForUndefinedKeys, v21, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v25), v22);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend_addObject_(v11, v21, v26, v22);
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v28, (uint64_t)v32, 16);
    }
    while (v23);
  }
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (id)customMaterialAttributeNames
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *valuesForUndefinedKeys;
  const char *v13;
  uint64_t v14;
  _QWORD v16[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  v11 = (void *)objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1B18DE5C8;
  v16[3] = &unk_1E63D54B0;
  v16[4] = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(valuesForUndefinedKeys, v13, (uint64_t)v16, v14);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (id)customMaterialAttributes
{
  os_unfair_lock_s *p_valuesForUndefinedKeysLock;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *valuesForUndefinedKeys;
  const char *v13;
  uint64_t v14;
  _QWORD v16[5];

  p_valuesForUndefinedKeysLock = &self->_valuesForUndefinedKeysLock;
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  v4 = (void *)MEMORY[0x1E0C99DE8];
  v8 = objc_msgSend_count(self->_valuesForUndefinedKeys, v5, v6, v7);
  v11 = (void *)objc_msgSend_arrayWithCapacity_(v4, v9, v8, v10);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1B18DE6A8;
  v16[3] = &unk_1E63D54B0;
  v16[4] = v11;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(valuesForUndefinedKeys, v13, (uint64_t)v16, v14);
  os_unfair_lock_unlock(p_valuesForUndefinedKeysLock);
  return v11;
}

- (void)_setupShadableHelperIfNeeded
{
  VFXShadableHelper *v3;
  const char *v4;
  uint64_t v5;

  if (!self->_shadableHelper)
  {
    v3 = [VFXShadableHelper alloc];
    self->_shadableHelper = (VFXShadableHelper *)objc_msgSend_initWithOwner_(v3, v4, (uint64_t)self, v5);
  }
}

- (id)__shadableHelper
{
  return self->_shadableHelper;
}

- (VFXProgram)program
{
  uint64_t v2;
  uint64_t v3;

  return (VFXProgram *)objc_msgSend_program(self->_shadableHelper, a2, v2, v3);
}

- (void)setShaderModifiers:(id)a3
{
  uint64_t v3;

  if (a3)
    objc_msgSend__setupShadableHelperIfNeeded(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setShaderModifiers_(self->_shadableHelper, a2, (uint64_t)a3, v3);
}

- (void)copyShaderModifiersAndLanguageVersionFrom:(id)a3
{
  uint64_t v3;
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
  const char *v16;
  uint64_t v17;

  if (objc_msgSend_shaderModifiers(a3, a2, (uint64_t)a3, v3))
    objc_msgSend__setupShadableHelperIfNeeded(self, v6, v7, v8);
  v9 = (void *)objc_msgSend___shadableHelper(a3, v6, v7, v8);
  objc_msgSend_copyModifiersFrom_(self->_shadableHelper, v10, (uint64_t)v9, v11);
  v15 = objc_msgSend_minimumLanguageVersion(v9, v12, v13, v14);
  objc_msgSend_setMinimumLanguageVersion_(self->_shadableHelper, v16, v15, v17);
}

- (NSDictionary)shaderModifiers
{
  uint64_t v2;
  uint64_t v3;

  return (NSDictionary *)objc_msgSend_shaderModifiers(self->_shadableHelper, a2, v2, v3);
}

- (void)setMinimumLanguageVersion:(id)a3
{
  uint64_t v3;

  if (a3)
    objc_msgSend__setupShadableHelperIfNeeded(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setMinimumLanguageVersion_(self->_shadableHelper, a2, (uint64_t)a3, v3);
}

- (NSNumber)minimumLanguageVersion
{
  uint64_t v2;
  uint64_t v3;

  return (NSNumber *)objc_msgSend_minimumLanguageVersion(self->_shadableHelper, a2, v2, v3);
}

- (id)shaderModifiersArguments
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_shaderModifiersArguments(self->_shadableHelper, a2, v2, v3);
}

- (id)shaderModifiersArgumentWithName:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_shaderModifiersArguments(self->_shadableHelper, a2, (uint64_t)a3, v3);
  return (id)objc_msgSend_objectForKeyedSubscript_(v5, v6, (uint64_t)a3, v7);
}

- (void)setProgram:(id)a3
{
  uint64_t v3;
  id v5;
  VFXShadableHelper *shadableHelper;

  if (a3)
  {
    v5 = a3;
    objc_msgSend__setupShadableHelperIfNeeded(self, a2, (uint64_t)a3, v3);
    shadableHelper = self->_shadableHelper;
    a3 = v5;
  }
  else
  {
    shadableHelper = self->_shadableHelper;
  }
  objc_msgSend_setProgram_(shadableHelper, a2, (uint64_t)a3, v3);
}

- (void)__CFObject
{
  return self->_geometry;
}

- (__CFXAnimationManager)animationManager
{
  uint64_t v2;
  uint64_t v3;
  __CFXAnimationManager *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = (__CFXAnimationManager *)objc_msgSend_worldRef(self, a2, v2, v3);
  if (result)
    return (__CFXAnimationManager *)sub_1B187A97C((uint64_t)result, v5, v6, v7, v8, v9, v10, v11);
  return result;
}

- (BOOL)__removeAnimation:(id)a3 forKey:(id)a4
{
  os_unfair_lock_s *p_animationsLock;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  BOOL v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (!a4)
    return 0;
  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v10 = (void *)objc_msgSend_objectForKey_(self->_animations, v8, (uint64_t)a4, v9);
  v16 = objc_msgSend_animation(v10, v11, v12, v13) == (_QWORD)a3;
  if (v16)
  {
    objc_msgSend_removeObjectForKey_(self->_animations, v14, (uint64_t)a4, v15);
    v20 = (_QWORD *)objc_msgSend___CFObject(self, v17, v18, v19);
    if ((sub_1B193EBA0(v20) & 1) == 0)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. __removeAnimationForKey: cftype is not an entity"), v21, v22, v23, v24, v25, v26, (uint64_t)"CFTypeIsCFXEntity(cfObject)");
    sub_1B193F164(v20, a4, 1, v22, v23, v24, v25, v26);
  }
  os_unfair_lock_unlock(p_animationsLock);
  return v16;
}

- (void)addAnimationPlayer:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  VFXOrderedDictionary *animations;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  _QWORD v22[7];

  if (a3)
  {
    v9 = (uint64_t)a4;
    if (!a4)
    {
      v11 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, 0);
      v9 = objc_msgSend_UUIDString(v11, v12, v13, v14);
    }
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (!animations)
    {
      animations = objc_alloc_init(VFXOrderedDictionary);
      self->_animations = animations;
    }
    objc_msgSend_setObject_forKey_(animations, v15, (uint64_t)a3, v9);
    os_unfair_lock_unlock(&self->_animationsLock);
    v20 = objc_msgSend_worldRef(self, v17, v18, v19);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = sub_1B18DEA54;
    v22[3] = &unk_1E63D5350;
    v22[4] = a3;
    v22[5] = self;
    v22[6] = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v22);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: attempt to add a null animation player on %@"), 0, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  if (a3)
  {
    v9 = (uint64_t)a4;
    v10 = (uint64_t)a3;
    if (!a4)
    {
      v11 = (void *)objc_msgSend_UUID(MEMORY[0x1E0CB3A28], a2, (uint64_t)a3, 0);
      v9 = objc_msgSend_UUIDString(v11, v12, v13, v14);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = objc_msgSend_animationWithCAAnimation_(VFXAnimation, v15, v10, v16);
    v17 = (void *)objc_msgSend_animationPlayerWithVFXAnimation_(VFXAnimationPlayer, v15, v10, v16);
    objc_msgSend_addAnimationPlayer_forKey_(self, v18, (uint64_t)v17, v9);
    objc_msgSend_play(v17, v19, v20, v21);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: attempt to add a null animation on %@"), 0, (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)addAnimation:(id)a3
{
  objc_msgSend_addAnimation_forKey_(self, a2, (uint64_t)a3, 0);
}

- (void)removeAllAnimations
{
  os_unfair_lock_s *p_animationsLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[5];

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v4, v5, v6);
  os_unfair_lock_unlock(p_animationsLock);
  v10 = objc_msgSend_worldRef(self, v7, v8, v9);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1B18DEC24;
  v12[3] = &unk_1E63D5378;
  v12[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
}

- (void)removeAllAnimationsWithBlendOutDuration:(float)a3
{
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[5];
  float v15;

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  objc_msgSend_removeAllObjects(self->_animations, v6, v7, v8);
  os_unfair_lock_unlock(p_animationsLock);
  v12 = objc_msgSend_worldRef(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1B18DECD0;
  v14[3] = &unk_1E63D53A0;
  v14[4] = self;
  v15 = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
}

- (void)removeAnimationForKey:(id)a3
{
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  _QWORD v13[6];

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v6, (uint64_t)a3, v7);
    os_unfair_lock_unlock(p_animationsLock);
    v11 = objc_msgSend_worldRef(self, v8, v9, v10);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = sub_1B18DED8C;
    v13[3] = &unk_1E63D53C8;
    v13[4] = self;
    v13[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
  }
}

- (void)removeAnimationForKey:(id)a3 blendOutDuration:(float)a4
{
  os_unfair_lock_s *p_animationsLock;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v15[6];
  float v16;

  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    objc_msgSend_removeObjectForKey_(self->_animations, v8, (uint64_t)a3, v9);
    os_unfair_lock_unlock(p_animationsLock);
    v13 = objc_msgSend_worldRef(self, v10, v11, v12);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B18DEE50;
    v15[3] = &unk_1E63D53F0;
    v15[4] = self;
    v15[5] = a3;
    v16 = a4;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)self, v15);
  }
}

- (NSArray)animationKeys
{
  os_unfair_lock_s *p_animationsLock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  NSArray *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  p_animationsLock = &self->_animationsLock;
  os_unfair_lock_lock(&self->_animationsLock);
  v7 = (NSArray *)objc_msgSend_allKeys(self->_animations, v4, v5, v6);
  os_unfair_lock_unlock(p_animationsLock);
  if (objc_msgSend_count(v7, v8, v9, v10))
    return v7;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_syncObjCAnimations
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
  const char *v14;
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

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  os_unfair_lock_lock(&self->_animationsLock);

  self->_animations = objc_alloc_init(VFXOrderedDictionary);
  os_unfair_lock_unlock(&self->_animationsLock);
  v17 = (const void *)objc_msgSend___CFObject(self, v14, v15, v16);
  if (v17)
  {
    v25 = (uint64_t)v17;
    if ((sub_1B193EBA0(v17) & 1) == 0)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. sync animations: cftype is not an entity"), v27, v28, v29, v30, v31, v32, (uint64_t)"CFTypeIsCFXEntity(cfObject)");
    v33 = sub_1B193EF14(v25, v26, v27, v28, v29, v30, v31, v32);
    if (v33)
    {
      v34 = (uint64_t)v33;
      os_unfair_lock_lock(&self->_animationsLock);
      sub_1B18C00E8(v34, (uint64_t)sub_1B18C2084, (uint64_t)self->_animations);
      os_unfair_lock_unlock(&self->_animationsLock);
    }
  }
  if (v13)
    sub_1B18797B4(v13, v18, v19, v20, v21, v22, v23, v24);
}

- (id)_vfxAnimationForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  VFXOrderedDictionary *animations;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
    {
      v9 = (void *)objc_msgSend_objectForKey_(animations, v6, (uint64_t)v3, v7);
      v3 = (id)objc_msgSend_animation(v9, v10, v11, v12);
    }
    else
    {
      v3 = 0;
    }
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_copyAnimationsFrom:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (void *)objc_msgSend_animationKeys(a3, a2, (uint64_t)a3, v3, 0);
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v6);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v15 = (void *)objc_msgSend_animationPlayerForKey_(a3, v9, v14, v10);
        v19 = (void *)objc_msgSend_copy(v15, v16, v17, v18);
        objc_msgSend_addAnimationPlayer_forKey_(self, v20, (uint64_t)v19, v14);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v11);
  }
}

- (id)animationPlayerForKey:(id)a3
{
  id v3;
  os_unfair_lock_s *p_animationsLock;
  const char *v6;
  uint64_t v7;
  VFXOrderedDictionary *animations;

  v3 = a3;
  if (a3)
  {
    p_animationsLock = &self->_animationsLock;
    os_unfair_lock_lock(&self->_animationsLock);
    animations = self->_animations;
    if (animations)
      v3 = (id)objc_msgSend_objectForKey_(animations, v6, (uint64_t)v3, v7);
    else
      v3 = 0;
    os_unfair_lock_unlock(p_animationsLock);
  }
  return v3;
}

- (void)_pauseAnimation:(BOOL)a3 forKey:(id)a4 pausedByNode:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a5;
  v7 = a3;
  v9 = objc_msgSend___CFObject(self, a2, a3, (uint64_t)a4);
  if (v9)
  {
    v13 = (void *)v9;
    v14 = objc_msgSend_animationManager(self, v10, v11, v12);
    if (v14)
    {
      v15 = v14;
      v16 = CACurrentMediaTime();
      sub_1B17F41C0(v15, v13, a4, v7, v5, v17, v18, v19, v16);
    }
  }
}

- (id)_vfxBindings
{
  return self->_bindings;
}

- (void)bindAnimatablePath:(id)a3 toObject:(id)a4 withKeyPath:(id)a5 options:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  CFXBinding *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  NSMutableDictionary *bindings;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  _QWORD v29[17];

  if (self != a4)
  {
    v29[15] = v6;
    v29[16] = v7;
    v13 = objc_alloc_init(CFXBinding);
    objc_msgSend_setSourceObject_(v13, v14, (uint64_t)a4, v15);
    objc_msgSend_setKeyPathDst_(v13, v16, (uint64_t)a3, v17);
    objc_msgSend_setKeyPathSrc_(v13, v18, (uint64_t)a5, v19);
    objc_msgSend_setOptions_(v13, v20, (uint64_t)a6, v21);
    bindings = self->_bindings;
    if (!bindings)
    {
      bindings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_bindings = bindings;
    }
    objc_msgSend_setValue_forKey_(bindings, v22, (uint64_t)v13, (uint64_t)a3);

    v27 = objc_msgSend_worldRef(self, v24, v25, v26);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1B18DF330;
    v29[3] = &unk_1E63D5418;
    v29[4] = self;
    v29[5] = a4;
    v29[6] = a3;
    v29[7] = a5;
    v29[8] = a6;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v28, v27, (uint64_t)self, v29);
  }
}

- (void)unbindAnimatablePath:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[6];

  objc_msgSend_removeObjectForKey_(self->_bindings, a2, (uint64_t)a3, v3);
  if (!objc_msgSend_count(self->_bindings, v6, v7, v8))
  {

    self->_bindings = 0;
  }
  v12 = objc_msgSend_worldRef(self, v9, v10, v11);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1B18DF45C;
  v14[3] = &unk_1E63D53C8;
  v14[4] = self;
  v14[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
}

- (void)removeAllBindings
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];

  self->_bindings = 0;
  v6 = objc_msgSend_worldRef(self, v3, v4, v5);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B18DF508;
  v8[3] = &unk_1E63D5378;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)_customEncodingOfVFXModel:(id)a3
{
  uint64_t v3;
  double *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  NSMutableDictionary *valuesForUndefinedKeys;

  if (!self->_materials)
    objc_msgSend__expand(self, a2, (uint64_t)a3, v3);
  v6 = *(double **)self->_fixedBoundingBoxExtrema;
  if (v6)
  {
    v7 = objc_msgSend_valueWithVFXFloat3_(MEMORY[0x1E0CB3B18], a2, (uint64_t)a3, v3, *v6);
    objc_msgSend_encodeObject_forKey_(a3, v8, v7, (uint64_t)CFSTR("fixedBoundingBoxExtrema[0]"));
    v12 = objc_msgSend_valueWithVFXFloat3_(MEMORY[0x1E0CB3B18], v9, v10, v11, *(double *)(*(_QWORD *)self->_fixedBoundingBoxExtrema + 16));
    objc_msgSend_encodeObject_forKey_(a3, v13, v12, (uint64_t)CFSTR("fixedBoundingBoxExtrema[1]"));
  }
  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_mesh, (uint64_t)CFSTR("mesh"));
  os_unfair_lock_lock(&self->_valuesForUndefinedKeysLock);
  valuesForUndefinedKeys = self->_valuesForUndefinedKeys;
  if (valuesForUndefinedKeys)
    objc_msgSend_encodeObject_forKey_(a3, v14, (uint64_t)valuesForUndefinedKeys, (uint64_t)CFSTR("valuesForUndefinedKeys"));
  os_unfair_lock_unlock(&self->_valuesForUndefinedKeysLock);
}

- (void)_customDecodingOfVFXModel:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  VFXMesh *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_containsValueForKey_(a3, a2, (uint64_t)CFSTR("fixedBoundingBoxExtrema[0]"), v3))
  {
    v8 = objc_opt_class();
    v10 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v9, v8, (uint64_t)CFSTR("fixedBoundingBoxExtrema[0]"));
    objc_msgSend_VFXFloat3Value(v10, v11, v12, v13);
    v51 = v14;
    v15 = objc_opt_class();
    v17 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, (uint64_t)CFSTR("fixedBoundingBoxExtrema[1]"), v51);
    objc_msgSend_VFXFloat3Value(v17, v18, v19, v20);
    v52 = v21;
    objc_msgSend_setBoundingBoxMin_max_(self, v22, (uint64_t)&v51, (uint64_t)&v52);
  }
  if ((objc_msgSend_containsValueForKey_(a3, v6, (uint64_t)CFSTR("kGeometrySourceSemanticVertex"), v7) & 1) != 0
    || objc_msgSend_containsValueForKey_(a3, v23, (uint64_t)CFSTR("kGeometrySourceSemanticPosition"), v24))
  {
    v27 = objc_alloc_init(VFXMesh);
    objc_msgSend_decodeMeshWithCoder_(v27, v28, (uint64_t)a3, v29);
    objc_msgSend_setMesh_(self, v30, (uint64_t)v27, v31);

  }
  else if (objc_msgSend_containsValueForKey_(a3, v25, (uint64_t)CFSTR("mesh"), v26))
  {
    v46 = objc_opt_class();
    v48 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v47, v46, (uint64_t)CFSTR("mesh"));
    objc_msgSend_setMesh_(self, v49, v48, v50);
  }
  v32 = (void *)MEMORY[0x1E0C99E60];
  v33 = objc_opt_class();
  v36 = objc_msgSend_setWithObject_(v32, v34, v33, v35);
  v37 = sub_1B18BE224();
  v39 = (void *)objc_msgSend_vfx_decodeDictionaryWithKeysOfClasses_objectsOfClasses_forKey_(a3, v38, v36, v37, CFSTR("valuesForUndefinedKeys"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = (id)objc_msgSend_mutableCopy(v39, v40, v41, v42);
    objc_msgSend__setAttributes_(self, v44, (uint64_t)v43, v45);
  }
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v3;
  const char *v6;
  NSMutableArray *materials;
  NSArray *levelsOfDetail;
  const char *v9;
  const char *v10;
  VFXMeshSource *edgeCreasesSource;
  VFXMeshElement *edgeCreasesElement;
  VFXShadableHelper *shadableHelper;
  const char *v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  uint64_t v18;
  const char *v19;

  if ((*((_BYTE *)self + 16) & 1) != 0)
    objc_msgSend__syncObjCModel(self, a2, (uint64_t)a3, v3);
  objc_msgSend__customEncodingOfVFXModel_(self, a2, (uint64_t)a3, v3);
  materials = self->_materials;
  if (materials)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)materials, (uint64_t)CFSTR("materials"));
  levelsOfDetail = self->_levelsOfDetail;
  if (levelsOfDetail)
    objc_msgSend_encodeObject_forKey_(a3, v6, (uint64_t)levelsOfDetail, (uint64_t)CFSTR("levelsOfDetail"));
  objc_msgSend_encodeInteger_forKey_(a3, v6, self->_subdivisionLevel, (uint64_t)CFSTR("subdivisionLevel"));
  objc_msgSend_encodeBool_forKey_(a3, v9, self->_subdivisionIsAdaptive, (uint64_t)CFSTR("wantsAdaptiveSubdivision"));
  edgeCreasesSource = self->_edgeCreasesSource;
  if (edgeCreasesSource)
    objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)edgeCreasesSource, (uint64_t)CFSTR("edgeCreasesSource"));
  edgeCreasesElement = self->_edgeCreasesElement;
  if (edgeCreasesElement)
    objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)edgeCreasesElement, (uint64_t)CFSTR("edgeCreasesElement"));
  shadableHelper = self->_shadableHelper;
  if (shadableHelper)
    objc_msgSend_encodeObject_forKey_(a3, v10, (uint64_t)shadableHelper, (uint64_t)CFSTR("shadableHelper"));
  objc_msgSend_encodeBytes_length_forKey_(a3, v10, (uint64_t)&self->_subdivisionSettings, 4, CFSTR("subdivisionSettings"));
  name = self->_name;
  if (name)
    objc_msgSend_encodeObject_forKey_(a3, v14, (uint64_t)name, (uint64_t)CFSTR("name"));
  sub_1B18BD9B8(a3, self, (uint64_t)name, v15);
  sub_1B18BDCC8(a3, self, v17, v18);
  objc_msgSend_encodeObject_forKey_(a3, v19, (uint64_t)self->_tessellator, (uint64_t)CFSTR("tessellator"));
}

- (VFXModel)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  id v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  _DWORD *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v75;
  objc_super v76;

  v76.receiver = self;
  v76.super_class = (Class)VFXModel;
  v7 = -[VFXModel init](&v76, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    CFObject = objc_msgSend___createCFObject(v7, v11, v12, v13);
    *((_QWORD *)v7 + 1) = CFObject;
    if (CFObject)
      sub_1B193E768(CFObject, v7, v16, v17, v18, v19, v20, v21);
    objc_msgSend__syncObjCModel(v7, v15, v16, v17);
    *((_DWORD *)v7 + 40) = 0;
    objc_msgSend__customDecodingOfVFXModel_(v7, v22, (uint64_t)a3, v23);
    v24 = objc_opt_class();
    v26 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_containingNestedContainersForKey_(a3, v25, v24, (uint64_t)CFSTR("materials"));
    objc_msgSend_setMaterials_(v7, v27, v26, v28);
    v29 = objc_opt_class();
    v31 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v30, v29, (uint64_t)CFSTR("levelsOfDetail"));
    objc_msgSend_setLevelsOfDetail_(v7, v32, v31, v33);
    v36 = objc_msgSend_decodeIntegerForKey_(a3, v34, (uint64_t)CFSTR("subdivisionLevel"), v35);
    objc_msgSend_setSubdivisionLevel_(v7, v37, v36, v38);
    v41 = objc_msgSend_decodeBoolForKey_(a3, v39, (uint64_t)CFSTR("wantsAdaptiveSubdivision"), v40);
    objc_msgSend_setWantsAdaptiveSubdivision_(v7, v42, v41, v43);
    v44 = objc_opt_class();
    v46 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v45, v44, (uint64_t)CFSTR("edgeCreasesSource"));
    objc_msgSend_setEdgeCreasesSource_(v7, v47, v46, v48);
    v49 = objc_opt_class();
    v51 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v50, v49, (uint64_t)CFSTR("edgeCreasesElement"));
    objc_msgSend_setEdgeCreasesElement_(v7, v52, v51, v53);
    v54 = objc_opt_class();
    v56 = (id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v55, v54, (uint64_t)CFSTR("shadableHelper"));
    *((_QWORD *)v7 + 15) = v56;
    if ((char *)objc_msgSend_owner(v56, v57, v58, v59) != v7)
    {

      *((_QWORD *)v7 + 15) = 0;
    }
    v75 = 0;
    v61 = (_DWORD *)objc_msgSend_decodeBytesForKey_returnedLength_(a3, v60, (uint64_t)CFSTR("subdivisionSettings"), (uint64_t)&v75);
    if (v75 == 4)
      *(_DWORD *)(v7 + 97) = *v61;
    v62 = objc_opt_class();
    v64 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v63, v62, (uint64_t)CFSTR("name"));
    objc_msgSend_setName_(v7, v65, v64, v66);
    *((_DWORD *)v7 + 14) = 0;
    sub_1B18BDA00(a3, v7);
    sub_1B18BDFA4(a3, v7);
    v67 = objc_opt_class();
    v69 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v68, v67, (uint64_t)CFSTR("tessellator"));
    objc_msgSend_setTessellator_(v7, v70, v69, v71);
    objc_msgSend_setImmediateMode_(VFXTransaction, v72, v8, v73);
  }
  return (VFXModel *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (VFXModel)modelWithSources:(id)a3 elements:(id)a4
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_msgSend_meshWithSources_elements_(VFXMesh, a2, (uint64_t)a3, (uint64_t)a4);
  return (VFXModel *)objc_msgSend_modelWithMesh_(VFXModel, v5, v4, v6);
}

+ (VFXModel)modelWithSources:(id)a3 elements:(id)a4 sourceChannels:(id)a5
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v5 = objc_msgSend_meshWithSources_elements_sourceChannels_(VFXMesh, a2, (uint64_t)a3, (uint64_t)a4, a5);
  return (VFXModel *)objc_msgSend_modelWithMesh_(VFXModel, v6, v5, v7);
}

- (id)modelSources
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_meshSources(self->_mesh, a2, v2, v3);
}

- (id)modelSourcesForSemantic:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_meshSourcesForSemantic_(self->_mesh, a2, (uint64_t)a3, v3);
}

- (id)modelElements
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_meshElements(self->_mesh, a2, v2, v3);
}

- (int64_t)modelElementCount
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_meshElementCount(self->_mesh, a2, v2, v3);
}

- (id)modelElementAtIndex:(int64_t)a3
{
  uint64_t v3;

  return (id)objc_msgSend_meshElementAtIndex_(self->_mesh, a2, a3, v3);
}

- (id)modelSourceChannels
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_meshSourceChannels(self->_mesh, a2, v2, v3);
}

- (id)_geometryByUnifyingNormalsWithCreaseThreshold:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  double v8;
  const char *v9;
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

  v7 = (void *)objc_msgSend_mesh(self, a2, v3, v4);
  *(float *)&v8 = a3;
  v12 = objc_msgSend__meshByUnifyingNormalsWithCreaseThreshold_(v7, v9, v10, v11, v8);
  v15 = (void *)objc_msgSend_modelWithMesh_(VFXModel, v13, v12, v14);
  v19 = objc_msgSend_materials(self, v16, v17, v18);
  objc_msgSend_setMaterials_(v15, v20, v19, v21);
  return v15;
}

- (id)_geometryByWeldingVerticesWithThreshold:(float)a3 normalThreshold:(float)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v9;
  double v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;

  v9 = (void *)objc_msgSend_mesh(self, a2, v4, v5);
  *(float *)&v10 = a3;
  *(float *)&v11 = a4;
  v15 = objc_msgSend__meshByWeldingVerticesWithThreshold_normalThreshold_(v9, v12, v13, v14, v10, v11);
  v18 = (void *)objc_msgSend_modelWithMesh_(VFXModel, v16, v15, v17);
  v22 = objc_msgSend_materials(self, v19, v20, v21);
  objc_msgSend_setMaterials_(v18, v23, v22, v24);
  return v18;
}

- (id)_geometryByRemovingSkinnerSources
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
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v5 = (void *)objc_msgSend_mesh(self, a2, v2, v3);
  v9 = objc_msgSend__meshByRemovingSkinnerSources(v5, v6, v7, v8);
  v12 = (void *)objc_msgSend_modelWithMesh_(VFXModel, v10, v9, v11);
  v16 = objc_msgSend_materials(self, v13, v14, v15);
  objc_msgSend_setMaterials_(v12, v17, v16, v18);
  return v12;
}

- (void)_discardOriginalTopology
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend_mesh(self, a2, v2, v3);
  MEMORY[0x1E0DE7D20](v4, sel__discardOriginalTopology, v5, v6);
}

- (id)interleavedCopy
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  VFXModel *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v5 = (void *)objc_msgSend_mesh(self, a2, v2, v3);
  v9 = (void *)objc_msgSend_interleavedCopy(v5, v6, v7, v8);
  v10 = objc_alloc_init(VFXModel);
  objc_msgSend_setMesh_(v10, v11, (uint64_t)v9, v12);
  v16 = objc_msgSend_materials(self, v13, v14, v15);
  objc_msgSend_setMaterials_(v10, v17, v16, v18);

  return v10;
}

- (id)_renderableCopy
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  VFXModel *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;

  v5 = (void *)objc_msgSend_mesh(self, a2, v2, v3);
  v9 = (void *)objc_msgSend__renderableCopy(v5, v6, v7, v8);
  v10 = objc_alloc_init(VFXModel);
  objc_msgSend_setMesh_(v10, v11, (uint64_t)v9, v12);
  v16 = objc_msgSend_materials(self, v13, v14, v15);
  objc_msgSend_setMaterials_(v10, v17, v16, v18);

  return v10;
}

- (NSArray)bridgedComponentNames
{
  return (NSArray *)(id)sub_1B2228AAC();
}

@end
