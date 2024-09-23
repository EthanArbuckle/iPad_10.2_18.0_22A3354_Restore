@implementation VFXNode

- (int64_t)authoringCameraType
{
  id AssociatedObject;
  const char *v3;
  uint64_t v4;
  uint64_t v5;

  AssociatedObject = objc_getAssociatedObject(self, sel_authoringCameraType);
  return objc_msgSend_integerValue(AssociatedObject, v3, v4, v5);
}

- (void)setAuthoringCameraType:(int64_t)a3
{
  uint64_t v3;
  void *v5;

  v5 = (void *)objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  objc_setAssociatedObject(self, sel_authoringCameraType, v5, (void *)0x301);
}

+ (VFXNode)nodeWithMDLAsset:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init((Class)a1);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v5, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(a3);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v14 = objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
        v16 = objc_msgSend_nodeWithMDLObject_options_context_(VFXNode, v15, v13, 0, v14);
        objc_msgSend_addChildNode_(v4, v17, v16, v18);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(a3, v7, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v10);
  }
  return (VFXNode *)v4;
}

+ (VFXNode)nodeWithMDLObject:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;

  v6 = objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, (uint64_t)a3, v3);
  return (VFXNode *)objc_msgSend_nodeWithMDLObject_options_context_(a1, v7, (uint64_t)a3, 0, v6);
}

+ (VFXNode)nodeWithMDLObject:(id)a3 options:(id)a4 context:(id)a5
{
  VFXNode *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  char isKindOfClass;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t k;
  uint64_t v87;
  uint64_t v88;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t j;
  uint64_t v98;
  void *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  id obj;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v8 = (VFXNode *)objc_msgSend_node(a1, a2, (uint64_t)a3, (uint64_t)a4);
  v12 = objc_msgSend_name(a3, v9, v10, v11);
  objc_msgSend_setName_(v8, v13, v12, v14);
  if (objc_msgSend_transform(a3, v15, v16, v17))
  {
    v21 = (void *)objc_msgSend_transform(a3, v18, v19, v20);
    objc_msgSend_matrix(v21, v22, v23, v24);
    objc_msgSend_setTransform_(v8, v25, v26, v27);
    objc_msgSend_transform(a3, v28, v29, v30);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v35 = (void *)objc_msgSend_transform(a3, v32, v33, v34);
    if ((isKindOfClass & 1) != 0)
    {
LABEL_5:
      v42 = (void *)objc_msgSend_transformAnimation(v35, v36, v37, v38);
      if (v42)
      {
        v46 = (uint64_t)v42;
        objc_msgSend_duration(v42, v43, v44, v45);
        if (v48 != 0.0)
          objc_msgSend_addAnimation_forKey_(v8, v47, v46, (uint64_t)CFSTR("transform"));
      }
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = (void *)objc_msgSend_transform(a3, v39, v40, v41);
      goto LABEL_5;
    }
  }
LABEL_8:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    v52 = (void *)objc_msgSend_submeshes(a3, v49, v50, v51);
    v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v126, (uint64_t)v132, 16);
    if (v54)
    {
      v58 = v54;
      v59 = 0;
      v60 = *(_QWORD *)v127;
      while (2)
      {
        for (i = 0; i != v58; ++i)
        {
          if (*(_QWORD *)v127 != v60)
            objc_enumerationMutation(v52);
          v62 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * i);
          if (objc_msgSend_faceIndexing(v62, v55, v56, v57) && objc_msgSend_geometryType(v62, v63, v64, v65) != 5)
            return 0;
          if (objc_msgSend_faceIndexing(v62, v63, v64, v65))
            ++v59;
        }
        v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v55, (uint64_t)&v126, (uint64_t)v132, 16);
        if (v58)
          continue;
        break;
      }
      if (v59 >= 2)
      {
        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        obj = (id)objc_msgSend_submeshes(a3, v55, v56, v57);
        v94 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v93, (uint64_t)&v122, (uint64_t)v131, 16);
        if (v94)
        {
          v95 = v94;
          v96 = *(_QWORD *)v123;
          do
          {
            for (j = 0; j != v95; ++j)
            {
              if (*(_QWORD *)v123 != v96)
                objc_enumerationMutation(obj);
              v98 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * j);
              v99 = (void *)objc_msgSend_node(a1, v70, v71, v72);
              v100 = (void *)MEMORY[0x1E0CB3940];
              v104 = objc_msgSend_name(a3, v101, v102, v103);
              v107 = objc_msgSend_stringWithFormat_(v100, v105, (uint64_t)CFSTR("%@_%d"), v106, v104, 0);
              objc_msgSend_setName_(v99, v108, v107, v109);
              v111 = objc_msgSend_modelWithMDLMesh_submesh_options_(VFXModel, v110, (uint64_t)a3, v98, a4);
              objc_msgSend_setModel_(v99, v112, v111, v113);
              objc_msgSend_addChildNode_(v8, v114, (uint64_t)v99, v115);
            }
            v95 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v70, (uint64_t)&v122, (uint64_t)v131, 16);
          }
          while (v95);
        }
        goto LABEL_29;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = objc_msgSend_modelWithMDLMesh_options_context_(VFXModel, v66, (uint64_t)a3, (uint64_t)a4, a5);
    objc_msgSend_setModel_(v8, v68, v67, v69);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v75 = objc_msgSend_lightWithMDLLight_(VFXLight, v73, (uint64_t)a3, v74);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v90 = objc_msgSend_cameraWithMDLCamera_(VFXCamera, v70, (uint64_t)a3, v72);
          objc_msgSend_setCamera_(v8, v91, v90, v92);
        }
        goto LABEL_29;
      }
      v75 = objc_msgSend_lightWithMDLLightProbe_(VFXLight, v78, (uint64_t)a3, v79);
    }
    objc_msgSend_setLight_(v8, v76, v75, v77);
  }
LABEL_29:
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v80 = (void *)objc_msgSend_children(a3, v70, v71, v72);
  v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v81, (uint64_t)&v118, (uint64_t)v130, 16);
  if (v82)
  {
    v84 = v82;
    v85 = *(_QWORD *)v119;
    do
    {
      for (k = 0; k != v84; ++k)
      {
        if (*(_QWORD *)v119 != v85)
          objc_enumerationMutation(v80);
        v87 = objc_msgSend_nodeWithMDLObject_options_context_(VFXNode, v83, *(_QWORD *)(*((_QWORD *)&v118 + 1) + 8 * k), (uint64_t)a4, a5);
        if (v87)
          objc_msgSend_addChildNode_(v8, v83, v87, v88);
      }
      v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v80, v83, (uint64_t)&v118, (uint64_t)v130, 16);
    }
    while (v84);
  }
  return v8;
}

+ (VFXNode)nodeWithMDLObject:(id)a3 masterObjects:(id)a4 worldNodes:(id)a5 skinnedMeshes:(id)a6 skelNodesMap:(void *)a7 asset:(id)a8 options:(id)a9 context:(id)a10
{
  VFXNode *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  char isKindOfClass;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  int isEqualToString;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  double v64;
  double v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  double v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  id v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  VFXNode *v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t i;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  id v179;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  _BYTE v187[128];
  uint64_t v188;

  v188 = *MEMORY[0x1E0C80C00];
  v13 = (VFXNode *)objc_msgSend_node(a1, a2, (uint64_t)a3, (uint64_t)a4);
  if (objc_msgSend_transform(a3, v14, v15, v16))
  {
    v20 = (void *)objc_msgSend_transform(a3, v17, v18, v19);
    objc_msgSend_matrix(v20, v21, v22, v23);
    objc_msgSend_setTransform_(v13, v24, v25, v26);
    objc_msgSend_transform(a3, v27, v28, v29);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v37 = (void *)objc_msgSend_transform(a3, v31, v32, v33);
    if ((isKindOfClass & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_16;
      v37 = (void *)objc_msgSend_transform(a3, v17, v18, v19);
    }
    v38 = (void *)objc_msgSend_transformAnimation(v37, v34, v35, v36);
    if (v38)
    {
      v39 = v38;
      objc_msgSend_duration(v38, v17, v18, v19);
      if (v40 != 0.0)
      {
        v41 = objc_msgSend_valueForKey_(a9, v17, (uint64_t)CFSTR("kSceneSourceAnimationLoadingMode"), v19);
        if (v41)
        {
          v46 = (void *)v41;
          objc_msgSend_setRemovedOnCompletion_(v39, v42, 1, v44);
          isEqualToString = objc_msgSend_isEqualToString_(v46, v47, (uint64_t)CFSTR("playRepeatedly"), v48);
          LODWORD(v53) = 2139095040;
          if (!isEqualToString)
            *(float *)&v53 = 0.0;
          objc_msgSend_setRepeatCount_(v39, v50, v51, v52, v53);
          v56 = objc_msgSend_isEqualToString_(v46, v54, (uint64_t)CFSTR("playRepeatedly"), v55) ^ 1;
          objc_msgSend_setRemovedOnCompletion_(v39, v57, v56, v58);
        }
        else
        {
          LODWORD(v45) = 2139095040;
          objc_msgSend_setRepeatCount_(v39, v42, v43, v44, v45);
          objc_msgSend_setRemovedOnCompletion_(v39, v62, 0, v63);
        }
        objc_msgSend_endTime(a8, v59, v60, v61);
        v65 = v64;
        objc_msgSend_startTime(a8, v66, v67, v68);
        v73 = v65 - v72;
        if (v65 - v72 > 0.0)
        {
          objc_msgSend_duration(v39, v69, v70, v71);
          v75 = v74;
          objc_msgSend_beginTime(v39, v76, v77, v78);
          if (v75 < v73 - v81)
          {
            objc_msgSend_beginTime(v39, v69, v79, v80);
            objc_msgSend_setDuration_(v39, v83, v84, v85, v73 - v82);
          }
        }
        objc_msgSend_addAnimation_forKey_(v13, v69, (uint64_t)v39, (uint64_t)CFSTR("transform"));
      }
    }
  }
LABEL_16:
  v86 = objc_msgSend_name(a3, v17, v18, v19);
  objc_msgSend_setName_(v13, v87, v86, v88);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v92 = objc_msgSend_path(a3, v89, v90, v91);
    v95 = objc_msgSend_objectForKey_(a4, v93, v92, v94);
    if (v95)
    {
      objc_msgSend_setModel_(v13, v96, v95, v97);
    }
    else
    {
      v108 = objc_msgSend_modelWithMDLMesh_options_context_(VFXModel, v96, (uint64_t)a3, (uint64_t)a9, a10);
      objc_msgSend_setModel_(v13, v109, v108, v110);
      v113 = (void *)objc_msgSend_componentConformingToProtocol_(a3, v111, (uint64_t)&unk_1EF023E88, v112);
      if (v113)
      {
        v116 = v113;
        v117 = sub_1B1831FA4(v113);
        objc_msgSend_setMorpher_(v13, v118, (uint64_t)v117, v119);
        sub_1B18322D4(v116, v13, a9, v120);
      }
      if (objc_msgSend_componentConformingToProtocol_(a3, v114, (uint64_t)&unk_1EF023EE8, v115))
        objc_msgSend_addObject_(a6, v121, (uint64_t)a3, v123);
      if (objc_msgSend_subdivisionScheme(a3, v121, v122, v123))
      {
        v127 = (void *)objc_msgSend_model(v13, v124, v125, v126);
        objc_msgSend_setSubdivisionLevel_(v127, v128, 1, v129);
        v133 = (void *)objc_msgSend_model(v13, v130, v131, v132);
        objc_msgSend_setWantsAdaptiveSubdivision_(v133, v134, 1, v135);
        v136 = (void *)objc_opt_new();
        v140 = (void *)objc_msgSend_model(v13, v137, v138, v139);
        objc_msgSend_setTessellator_(v140, v141, (uint64_t)v136, v142);

      }
      v143 = objc_msgSend_model(v13, v124, v125, v126);
      objc_msgSend_setObject_forKey_(a4, v144, v143, v92);
    }
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v103 = objc_msgSend_lightWithMDLLight_(VFXLight, v101, (uint64_t)a3, v102);
LABEL_23:
    objc_msgSend_setLight_(v13, v104, v103, v105);
    goto LABEL_35;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v103 = objc_msgSend_lightWithMDLLightProbe_(VFXLight, v106, (uint64_t)a3, v107);
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v147 = objc_msgSend_cameraWithMDLCamera_(VFXCamera, v145, (uint64_t)a3, v146);
    objc_msgSend_setCamera_(v13, v148, v147, v149);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      sub_1B1837818(v13, (uint64_t *)a3, (uint64_t **)a7);
  }
LABEL_35:
  if (objc_msgSend_instance(a3, v98, v99, v100))
  {
    v153 = objc_msgSend_instance(a3, v150, v151, v152);
    v155 = objc_msgSend_nodeWithMDLObject_masterObjects_worldNodes_skinnedMeshes_skelNodesMap_asset_options_context_(VFXNode, v154, v153, (uint64_t)a4, a5, a6, a7, a8, a9, a10);
    objc_msgSend_addChildNode_(v13, v156, v155, v157);
  }
  v158 = objc_msgSend_path(a3, v150, v151, v152);
  v159 = v13;
  objc_msgSend_setObject_forKey_(a5, v160, (uint64_t)v13, v158);
  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  v179 = a3;
  v164 = (void *)objc_msgSend_children(a3, v161, v162, v163);
  v166 = objc_msgSend_countByEnumeratingWithState_objects_count_(v164, v165, (uint64_t)&v183, (uint64_t)v187, 16);
  if (v166)
  {
    v170 = v166;
    v171 = *(_QWORD *)v184;
    do
    {
      for (i = 0; i != v170; ++i)
      {
        if (*(_QWORD *)v184 != v171)
          objc_enumerationMutation(v164);
        v173 = objc_msgSend_nodeWithMDLObject_masterObjects_worldNodes_skinnedMeshes_skelNodesMap_asset_options_context_(VFXNode, v167, *(_QWORD *)(*((_QWORD *)&v183 + 1) + 8 * i), (uint64_t)a4, a5, a6, a7, a8, a9, a10);
        if (v173)
          objc_msgSend_addChildNode_(v159, v167, v173, v174);
      }
      v170 = objc_msgSend_countByEnumeratingWithState_objects_count_(v164, v167, (uint64_t)&v183, (uint64_t)v187, 16);
    }
    while (v170);
  }
  v175 = objc_msgSend_hidden(v179, v167, v168, v169);
  objc_msgSend_setHidden_(v159, v176, v175, v177);
  return v159;
}

- (void)_addSkinnerWithMDLMesh:(id)a3 worldNodes:(id)a4
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;

  v7 = objc_msgSend_componentConformingToProtocol_(a3, a2, (uint64_t)&unk_1EF023EE8, (uint64_t)a4);
  if (v7)
  {
    v11 = (void *)v7;
    v12 = (void *)objc_msgSend_model(self, v8, v9, v10);
    v16 = objc_msgSend_mesh(v12, v13, v14, v15);
    v19 = sub_1B1831BF0(v11, (char *)a4, v17, v18);
    v20 = sub_1B1831D2C(v11);
    v24 = sub_1B1837CBC(a3, v21, v22, v23);
    v28 = sub_1B1837D64(a3, v25, v26, v27);
    v30 = objc_msgSend_skinnerWithBaseMesh_bones_boneInverseBindTransforms_boneWeights_boneIndices_(VFXSkinner, v29, v16, (uint64_t)v19, v20, v24, v28);
    objc_msgSend_setSkinner_(self, v31, v30, v32);
  }
}

- (void)_bakeNodes:(id)a3 folderPath:(id)a4 inVertex:(BOOL)a5 bakeAO:(BOOL)a6 quality:(float)a7 attenuation:(float)a8 geomSetter:(id)a9 terminateSetter:(id)a10
{
  void *v18;
  id v19;
  id v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  NSObject *global_queue;
  _QWORD block[11];
  float v27;
  float v28;
  BOOL v29;
  BOOL v30;
  _QWORD v31[5];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v32[0] = self;
  v18 = (void *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v32, 1);
  v19 = VFXNodesToMDLAsset(v18);
  v20 = VFXNodesToMDLAsset(a3);
  v21 = sub_1B18314B4(v20);
  v22 = sub_1B18314B4(v19);
  v23 = sub_1B18317CC(v19);
  v24 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = sub_1B1837F74;
  v31[3] = &unk_1E63D6F80;
  v31[4] = a4;
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = v24;
  block[1] = 3221225472;
  block[2] = sub_1B1837FE0;
  block[3] = &unk_1E63D6FF8;
  v29 = a6;
  v30 = a5;
  v27 = a7;
  v28 = a8;
  block[4] = v21;
  block[5] = v22;
  block[6] = v23;
  block[7] = v20;
  block[8] = v31;
  block[9] = a9;
  block[10] = a10;
  dispatch_async(global_queue, block);
}

- (VFXNode)init
{
  VFXNode *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)VFXNode;
  v2 = -[VFXNode init](&v12, sel_init);
  if (v2)
  {
    v3 = sub_1B186A0A0();
    v2->_node = (__CFXNode *)v3;
    if (v3)
      sub_1B193E768(v3, v2, v5, v6, v7, v8, v9, v10);
    *((_BYTE *)v2 + 48) |= 0x3Eu;
    v2->_animationsLock._os_unfair_lock_opaque = 0;
    v2->_valueForKeyLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v2, v4, v5, v6);
  }
  return v2;
}

- (id)initPresentationNodeWithNodeRef:(__CFXNode *)a3
{
  VFXNode *v4;
  VFXNode *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VFXNode;
  v4 = -[VFXNode init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    *((_BYTE *)v4 + 48) |= 1u;
    v4->_node = (__CFXNode *)CFRetain(a3);
    v5->_animationsLock._os_unfair_lock_opaque = 0;
    v5->_valueForKeyLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (VFXNode)initWithNodeRef:(__CFXNode *)a3
{
  id v4;
  CFTypeRef v5;
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
  uint64_t v16;
  _QWORD v18[5];
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)VFXNode;
  v4 = -[VFXNode init](&v19, sel_init);
  if (v4)
  {
    v5 = CFRetain(a3);
    *((_QWORD *)v4 + 1) = v5;
    if (v5)
      sub_1B193E768((uint64_t)v5, v4, v7, v8, v9, v10, v11, v12);
    *((_DWORD *)v4 + 52) = 0;
    *((_DWORD *)v4 + 64) = 0;
    objc_msgSend__syncObjCModel(v4, v6, v7, v8);
    objc_msgSend__syncObjCAnimations(v4, v13, v14, v15);
    if (sub_1B186AF90(*((_QWORD *)v4 + 1)))
    {
      *((_QWORD *)v4 + 4) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = *((_QWORD *)v4 + 1);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = sub_1B188F314;
      v18[3] = &unk_1E63D7E38;
      v18[4] = v4;
      sub_1B1869628(v16, (uint64_t)v18);
    }
  }
  return (VFXNode *)v4;
}

- (void)_initChildNodesArray
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
  __CFXNode *node;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  node = self->_node;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = sub_1B188F3F8;
  v22[3] = &unk_1E63D7E38;
  v22[4] = self;
  sub_1B1869628((uint64_t)node, (uint64_t)v22);
  if (v13)
    sub_1B18797B4(v13, v15, v16, v17, v18, v19, v20, v21);
}

+ (id)node
{
  return objc_alloc_init((Class)a1);
}

+ (VFXNode)nodeWithModel:(id)a3
{
  uint64_t v3;
  VFXNode *v5;
  const char *v6;
  uint64_t v7;

  v5 = (VFXNode *)objc_msgSend_node(a1, a2, (uint64_t)a3, v3);
  objc_msgSend_setModel_(v5, v6, (uint64_t)a3, v7);
  return v5;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *childNodes;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __CFXNode *node;
  objc_super v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 48) & 1) == 0)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    childNodes = self->_childNodes;
    v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(childNodes, a2, (uint64_t)&v27, (uint64_t)v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(childNodes);
          objc_msgSend__setParent_(*(void **)(*((_QWORD *)&v27 + 1) + 8 * i), a2, 0, v3);
        }
        v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(childNodes, a2, (uint64_t)&v27, (uint64_t)v31, 16);
      }
      while (v7);
    }
  }
  if (objc_msgSend_hasPhysicBody(self, a2, v2, v3))
  {
    v13 = (void *)objc_msgSend_physicsBody(self, v10, v11, v12);
    objc_msgSend__ownerWillDie(v13, v14, v15, v16);
  }

  self->_components = 0;
  node = self->_node;
  if (node)
  {
    if ((*((_BYTE *)self + 48) & 1) == 0)
    {
      sub_1B193E768((uint64_t)node, 0, v18, v19, v20, v21, v22, v23);
      node = self->_node;
    }
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1B188F684;
    v26[3] = &unk_1E63D4AB0;
    v26[4] = node;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v17, 0, 0, v26);
  }

  free(*(void **)self->_fixedBoundingBoxExtrema);
  v25.receiver = self;
  v25.super_class = (Class)VFXNode;
  -[VFXNode dealloc](&v25, sel_dealloc);
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
      v15[2] = sub_1B188F73C;
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

  if ((*((_BYTE *)self + 48) & 1) == 0)
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

- (void)_syncObjCModel
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
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
  uint64_t v33;
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
  char v46;
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
  char v61;
  char v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
  *(double *)&v14 = sub_1B18697A0((uint64_t)self->_node, v6, v7, v8, v9, v10, v11, v12);
  *(_OWORD *)&self->_anon_40[2] = v14;
  *(_OWORD *)&self->_anon_40[18] = v15;
  *(_OWORD *)&self->_anon_40[34] = v16;
  *(_OWORD *)&self->_anon_40[50] = v17;
  *((_BYTE *)self + 49) = *((_BYTE *)self + 49) & 0xFC | 2;
  self->_opacity = sub_1B186A4D4((uint64_t)self->_node, v18, v19, v20, v21, v22, v23, v24);
  self->_renderingOrder = (int64_t)sub_1B186C9C0((uint64_t)self->_node, v25, v26, v27, v28, v29, v30, v31);
  if (sub_1B1868D5C((uint64_t)self->_node, v32, v33, v34, v35, v36, v37, v38))
    v46 = 0x80;
  else
    v46 = 0;
  *((_BYTE *)self + 49) = v46 & 0x80 | *((_BYTE *)self + 49) & 0x7F;
  *((_BYTE *)self + 50) = *((_BYTE *)self + 50) & 0xFE | sub_1B186CAF4((uint64_t)self->_node, v39, v40, v41, v42, v43, v44, v45);
  self->_categoryBitMask = sub_1B186CC98((uint64_t)self->_node, v47, v48, v49, v50, v51, v52, v53);
  if (sub_1B186CD74((uint64_t)self->_node))
    v61 = 8;
  else
    v61 = 0;
  *((_BYTE *)self + 49) = *((_BYTE *)self + 49) & 0xF7 | v61;
  if (sub_1B186A28C((uint64_t)self->_node, v54, v55, v56, v57, v58, v59, v60))
    v62 = 4;
  else
    v62 = 0;
  *((_BYTE *)self + 49) = *((_BYTE *)self + 49) & 0xFB | v62;
  if (sub_1B186CDA0((uint64_t)self->_node))
    v66 = 16;
  else
    v66 = 0;
  *((_BYTE *)self + 49) = *((_BYTE *)self + 49) & 0xEF | v66;
  objc_msgSend__syncEntityObjCModel(self, v63, v64, v65);
  if (v13)
    sub_1B18797B4(v13, v67, v68, v69, v70, v71, v72, v73);
}

- (BOOL)isPresentationObject
{
  return *((_BYTE *)self + 48) & 1;
}

- (VFXNode)presentationNode
{
  VFXNode *v2;
  VFXNode *v3;
  const char *v4;
  uint64_t v5;

  v2 = self;
  if ((*((_BYTE *)self + 48) & 1) == 0)
  {
    self = self->_presentationObject;
    if (!self)
    {
      v3 = [VFXNode alloc];
      self = (VFXNode *)objc_msgSend_initPresentationNodeWithNodeRef_(v3, v4, (uint64_t)v2->_node, v5);
      v2->_presentationObject = self;
    }
  }
  return self;
}

- (__CFXWorld)worldRef
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

  v4 = (_QWORD *)objc_msgSend___CFObject(self, a2, v2, v3);
  return (__CFXWorld *)sub_1B17C6244(v4, v5, v6, v7, v8, v9, v10, v11);
}

- (void)setWorld:(id)a3
{
  uint64_t v3;
  VFXWorld *world;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  world = self->_world;
  if (world == a3)
    return;
  if (world)
  {
    if (objc_msgSend_particleEmitter(self, a2, (uint64_t)a3, v3))
    {
      v10 = (void *)objc_msgSend_particleEmitter(self, v7, v8, v9);
    }
    else if (objc_msgSend_particleCollider(self, v7, v8, v9))
    {
      v10 = (void *)objc_msgSend_particleCollider(self, v13, v14, v15);
    }
    else
    {
      if (!objc_msgSend_behaviorGraph(self, v13, v14, v15))
        goto LABEL_10;
      v10 = (void *)objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
    }
    objc_msgSend_willBeRemovedFromWorld_(v10, v11, (uint64_t)self->_world, v12);
LABEL_10:
    if (self->_world)
    {
      v16 = (void *)objc_msgSend_model(self, a2, (uint64_t)a3, v3);
      objc_msgSend_removeWorldReference_(v16, v17, (uint64_t)self->_world, v18);
    }
  }
  self->_world = (VFXWorld *)a3;
  if (a3)
  {
    v19 = (void *)objc_msgSend_model(self, a2, (uint64_t)a3, v3);
    objc_msgSend_addWorldReference_(v19, v20, (uint64_t)a3, v21);
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v22 = (void *)objc_msgSend_childNodes(self, a2, (uint64_t)a3, v3, 0);
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v24)
  {
    v28 = v24;
    v29 = *(_QWORD *)v44;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v44 != v29)
          objc_enumerationMutation(v22);
        objc_msgSend_setWorld_(*(void **)(*((_QWORD *)&v43 + 1) + 8 * v30++), v25, (uint64_t)a3, v27);
      }
      while (v28 != v30);
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v43, (uint64_t)v47, 16);
    }
    while (v28);
  }
  if (a3)
  {
    if (objc_msgSend_particleEmitter(self, v25, v26, v27))
    {
      v34 = (void *)objc_msgSend_particleEmitter(self, v31, v32, v33);
    }
    else if (objc_msgSend_particleCollider(self, v31, v32, v33))
    {
      v34 = (void *)objc_msgSend_particleCollider(self, v37, v38, v39);
    }
    else
    {
      if (!objc_msgSend_behaviorGraph(self, v37, v38, v39))
        return;
      v34 = (void *)objc_msgSend_behaviorGraph(self, v40, v41, v42);
    }
    objc_msgSend_wasAddedToWorld_(v34, v35, (uint64_t)self->_world, v36);
  }
}

- (id)world
{
  return self->_world;
}

- (void)_dump:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
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
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend_defaultCStringEncoding(MEMORY[0x1E0CB3940], a2, (uint64_t)a3, v3);
  v9 = (const char *)objc_msgSend_cStringUsingEncoding_(a3, v7, v6, v8);
  v13 = (void *)objc_msgSend_description(self, v10, v11, v12);
  v17 = objc_msgSend_defaultCStringEncoding(MEMORY[0x1E0CB3940], v14, v15, v16);
  v20 = (const char *)objc_msgSend_cStringUsingEncoding_(v13, v18, v17, v19);
  printf("%s%s {\n", v9, v20);
  v23 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v21, (uint64_t)CFSTR("\t%@"), v22, a3);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v27 = (void *)objc_msgSend_childNodes(self, v24, v25, v26);
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v29)
  {
    v33 = v29;
    v34 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(v27);
        objc_msgSend__dump_(*(void **)(*((_QWORD *)&v40 + 1) + 8 * i), v30, v23, v32);
      }
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v40, (uint64_t)v44, 16);
    }
    while (v33);
  }
  v36 = objc_msgSend_defaultCStringEncoding(MEMORY[0x1E0CB3940], v30, v31, v32);
  v39 = (const char *)objc_msgSend_cStringUsingEncoding_(a3, v37, v36, v38);
  printf("%s}\n", v39);
}

- (void)dump
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;

  v5 = objc_msgSend_name(self, a2, v2, v3);
  NSLog(CFSTR("dump node tree (%@)"), v5);
  objc_msgSend__dump_(self, v6, (uint64_t)&stru_1E63FD500, v7);
  NSLog(CFSTR("------------------------------------------------------"));
}

+ (id)_dumpNodeTree:(id)a3 tab:(id)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend_name(a3, a2, (uint64_t)a3, (uint64_t)a4))
    v11 = objc_msgSend_name(a3, v8, v9, v10);
  else
    v11 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v8, (uint64_t)CFSTR("<%p>"), v10, a3);
  v14 = (void *)objc_msgSend_stringWithFormat_(v7, v12, (uint64_t)CFSTR("%@%@\n"), v13, a4, v11);
  v17 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("\t%@"), v16, a4);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v21 = (void *)objc_msgSend_childNodes(a3, v18, v19, v20);
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v23)
  {
    v25 = v23;
    v26 = *(_QWORD *)v33;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(v21);
        v28 = objc_msgSend__dumpNodeTree_tab_(a1, v24, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v27), v17);
        v14 = (void *)objc_msgSend_stringByAppendingString_(v14, v29, v28, v30);
        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v25);
  }
  return v14;
}

- (id)_dumpTree
{
  void *v3;
  const char *v4;

  v3 = (void *)objc_opt_class();
  return (id)objc_msgSend__dumpNodeTree_tab_(v3, v4, (uint64_t)self, (uint64_t)&stru_1E63FD500);
}

- (void)_setAttributes:(id)a3
{
  os_unfair_lock_s *p_valueForKeyLock;

  p_valueForKeyLock = &self->_valueForKeyLock;
  os_unfair_lock_lock(&self->_valueForKeyLock);

  self->_valueForKey = (NSMutableDictionary *)a3;
  os_unfair_lock_unlock(p_valueForKeyLock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)((uint64_t (*)(VFXNode *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_copyWithOptions_, 0);
}

- (id)copyWithOptions:(unint64_t)a3
{
  id v5;
  const char *v6;

  v5 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend_copyWithOptions_to_(self, v6, a3, (uint64_t)v5);
  return v5;
}

+ (id)_cloneSharable:(id)a3 remap:(__CFDictionary *)a4
{
  id result;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (!a4)
  {
    v10 = (void *)objc_msgSend_copy(a3, a2, (uint64_t)a3, 0);
    return v10;
  }
  result = (id)CFDictionaryGetValue(a4, a3);
  if (!result)
  {
    v10 = (void *)objc_msgSend_copy(a3, v7, v8, v9);
    CFDictionarySetValue(a4, a3, v10);
    return v10;
  }
  return result;
}

- (void)copyWithOptions:(unint64_t)a3 to:(id)a4
{
  objc_msgSend__copyWithOptions_to_remap_(self, a2, a3, (uint64_t)a4, 0);
}

- (void)_copyWithOptions:(unint64_t)a3 to:(id)a4 remap:(__CFDictionary *)a5
{
  char v7;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t isHidden;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  const char *v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  id v130;
  const char *v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  id v157;
  const char *v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const char *v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t i;
  void *v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t j;
  uint64_t isAuthoring;
  const char *v237;
  uint64_t v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  const char *v249;
  uint64_t v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  const char *v258;
  uint64_t v259;
  uint64_t isGizmo;
  const char *v261;
  uint64_t v262;
  NSMutableDictionary *valueForKey;
  const char *v264;
  uint64_t v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  id v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  void *v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  void *v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  const char *v296;
  uint64_t v297;
  void *v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t k;
  void *v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  id Value;
  const char *v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  id v331;
  const char *v332;
  uint64_t v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  id v341;
  const char *v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  id v351;
  const char *v352;
  uint64_t v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  void *v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  id v361;
  const char *v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  _QWORD v372[5];
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  _BYTE v381[128];
  _BYTE v382[128];
  _BYTE v383[128];
  uint64_t v384;
  _QWORD v385[3];

  v7 = a3;
  v385[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_begin(VFXTransaction, a2, a3, (uint64_t)a4);
  objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
  v14 = objc_msgSend_name(self, v11, v12, v13);
  objc_msgSend_setName_(a4, v15, v14, v16);
  if ((*((_BYTE *)self + 49) & 1) != 0)
  {
    objc_msgSend_position(self, v17, v18, v19);
    objc_msgSend_setPosition_(a4, v26, v27, v28);
    objc_msgSend_scale(self, v29, v30, v31);
    objc_msgSend_setScale_(a4, v32, v33, v34);
    v35 = (*((unsigned __int8 *)self + 49) >> 5) & 3;
    switch(v35)
    {
      case 2:
        objc_msgSend_orientation(self, v23, v24, v25);
        objc_msgSend_setOrientation_(a4, v39, v40, v41);
        break;
      case 1:
        objc_msgSend_rotation(self, v23, v24, v25);
        objc_msgSend_setRotation_(a4, v42, v43, v44);
        break;
      case 0:
        objc_msgSend_eulerAngles(self, v23, v24, v25);
        objc_msgSend_setEulerAngles_(a4, v36, v37, v38);
        break;
    }
  }
  else
  {
    objc_msgSend_transform(self, v17, v18, v19);
    objc_msgSend_setTransform_(a4, v20, v21, v22);
  }
  if ((*((_BYTE *)self + 49) & 4) != 0)
  {
    objc_msgSend_pivot(self, v23, v24, v25);
    objc_msgSend_setPivot_(a4, v45, v46, v47);
  }
  isHidden = objc_msgSend_isHidden(self, v23, v24, v25);
  objc_msgSend_setHidden_(a4, v49, isHidden, v50);
  objc_msgSend_opacity(self, v51, v52, v53);
  objc_msgSend_setOpacity_(a4, v54, v55, v56);
  v60 = objc_msgSend_renderingOrder(self, v57, v58, v59);
  objc_msgSend_setRenderingOrder_(a4, v61, v60, v62);
  v66 = objc_msgSend_categoryBitMask(self, v63, v64, v65);
  objc_msgSend_setCategoryBitMask_(a4, v67, v66, v68);
  v72 = (void *)objc_msgSend_light(self, v69, v70, v71);
  if (objc_msgSend_type(v72, v73, v74, v75) == 4)
  {
    v79 = (void *)objc_msgSend_light(self, v76, v77, v78);
    v83 = (void *)objc_msgSend_copy(v79, v80, v81, v82);
    objc_msgSend_setLight_(a4, v84, (uint64_t)v83, v85);

    if ((v7 & 2) != 0)
      goto LABEL_24;
    goto LABEL_17;
  }
  v89 = objc_msgSend_light(self, v76, v77, v78);
  if ((v7 & 4) != 0)
    v89 = objc_msgSend__cloneSharable_remap_(VFXNode, v90, v89, (uint64_t)a5);
  objc_msgSend_setLight_(a4, v90, v89, v91);
  if ((v7 & 2) == 0)
  {
LABEL_17:
    v92 = (void *)objc_msgSend_particleEmitter(self, v86, v87, v88);
    v96 = (id)objc_msgSend_copy(v92, v93, v94, v95);
    objc_msgSend_setParticleEmitter_(a4, v97, (uint64_t)v96, v98);
    v102 = (void *)objc_msgSend_particleCollider(self, v99, v100, v101);
    v106 = (id)objc_msgSend_copy(v102, v103, v104, v105);
    objc_msgSend_setParticleCollider_(a4, v107, (uint64_t)v106, v108);
    if (objc_msgSend_behaviorGraph(self, v109, v110, v111))
    {
      if (objc_msgSend_particleEmitter(a4, v86, v87, v88) || objc_msgSend_particleCollider(a4, v112, v113, v114))
      {
        v115 = (void *)objc_msgSend_particleCollider(a4, v112, v113, v114);
        v119 = (void *)objc_msgSend_coreEntityHandle(v115, v116, v117, v118);
        if (!v119)
        {
          v123 = (void *)objc_msgSend_particleEmitter(a4, v120, v121, v122);
          v119 = (void *)objc_msgSend_coreEntityHandle(v123, v124, v125, v126);
        }
        v127 = objc_msgSend_entityObject(v119, v120, v121, v122);
        v130 = (id)objc_msgSend_behaviorGraphWithEntityObject_(VFXBehaviorGraph, v128, v127, v129);
      }
      else
      {
        v364 = (void *)objc_msgSend_behaviorGraph(self, v112, v113, v114);
        v130 = (id)objc_msgSend_copy(v364, v365, v366, v367);
      }
      objc_msgSend_setBehaviorGraph_(a4, v131, (uint64_t)v130, v132);
      v136 = (void *)objc_msgSend_behaviorGraph(a4, v133, v134, v135);
      v140 = (void *)objc_msgSend_entityObject(v136, v137, v138, v139);
      v384 = objc_msgSend_identifier(self, v141, v142, v143);
      v385[0] = a4;
      v145 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v144, (uint64_t)v385, (uint64_t)&v384, 1);
      objc_msgSend_updateBridgedReferencesWithBridgeable_objectByIdentifier_(v140, v146, (uint64_t)a4, v145);
    }
  }
LABEL_24:
  v147 = objc_msgSend_camera(self, v86, v87, v88);
  if ((v7 & 4) != 0)
    v147 = objc_msgSend__cloneSharable_remap_(VFXNode, v148, v147, (uint64_t)a5);
  objc_msgSend_setCamera_(a4, v148, v147, v149);
  v153 = (void *)objc_msgSend_forceField(self, v150, v151, v152);
  v157 = (id)objc_msgSend_copy(v153, v154, v155, v156);
  objc_msgSend_setForceField_(a4, v158, (uint64_t)v157, v159);
  v163 = objc_msgSend_castsShadow(self, v160, v161, v162);
  objc_msgSend_setCastsShadow_(a4, v164, v163, v165);
  v169 = objc_msgSend_usesDepthPrePass(self, v166, v167, v168);
  objc_msgSend_setUsesDepthPrePass_(a4, v170, v169, v171);
  if (objc_msgSend_constraints(self, v172, v173, v174))
  {
    v178 = (void *)objc_msgSend_constraints(self, v175, v176, v177);
    if (objc_msgSend_count(v178, v179, v180, v181))
    {
      v182 = (void *)MEMORY[0x1E0C99DE8];
      v183 = (void *)objc_msgSend_constraints(self, v175, v176, v177);
      v187 = objc_msgSend_count(v183, v184, v185, v186);
      v190 = (void *)objc_msgSend_arrayWithCapacity_(v182, v188, v187, v189);
      v377 = 0u;
      v378 = 0u;
      v379 = 0u;
      v380 = 0u;
      v194 = (void *)objc_msgSend_constraints(self, v191, v192, v193);
      v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v195, (uint64_t)&v377, (uint64_t)v383, 16);
      if (v196)
      {
        v200 = v196;
        v201 = *(_QWORD *)v378;
        do
        {
          for (i = 0; i != v200; ++i)
          {
            if (*(_QWORD *)v378 != v201)
              objc_enumerationMutation(v194);
            v203 = (void *)objc_msgSend_copy(*(void **)(*((_QWORD *)&v377 + 1) + 8 * i), v197, v198, v199);
            objc_msgSend_addObject_(v190, v204, (uint64_t)v203, v205);

          }
          v200 = objc_msgSend_countByEnumeratingWithState_objects_count_(v194, v197, (uint64_t)&v377, (uint64_t)v383, 16);
        }
        while (v200);
      }
      objc_msgSend_setConstraints_(a4, v197, (uint64_t)v190, v199);
    }
  }
  v206 = (void *)objc_msgSend_deformers(self, v175, v176, v177);
  if (objc_msgSend_count(v206, v207, v208, v209))
  {
    if ((v7 & 4) != 0)
    {
      v216 = (void *)MEMORY[0x1E0C99DE8];
      v217 = (void *)objc_msgSend_deformers(self, v210, v211, v212);
      v221 = objc_msgSend_count(v217, v218, v219, v220);
      v224 = (void *)objc_msgSend_arrayWithCapacity_(v216, v222, v221, v223);
      v373 = 0u;
      v374 = 0u;
      v375 = 0u;
      v376 = 0u;
      v228 = (void *)objc_msgSend_deformers(self, v225, v226, v227);
      v230 = objc_msgSend_countByEnumeratingWithState_objects_count_(v228, v229, (uint64_t)&v373, (uint64_t)v382, 16);
      if (v230)
      {
        v233 = v230;
        v234 = *(_QWORD *)v374;
        do
        {
          for (j = 0; j != v233; ++j)
          {
            if (*(_QWORD *)v374 != v234)
              objc_enumerationMutation(v228);
            objc_msgSend_addObject_(v224, v231, *(_QWORD *)(*((_QWORD *)&v373 + 1) + 8 * j), v232);
          }
          v233 = objc_msgSend_countByEnumeratingWithState_objects_count_(v228, v231, (uint64_t)&v373, (uint64_t)v382, 16);
        }
        while (v233);
      }
      objc_msgSend_setConstraints_(a4, v231, (uint64_t)v224, v232);
    }
    else
    {
      v213 = objc_msgSend_deformers(self, v210, v211, v212);
      objc_msgSend_setDeformers_(a4, v214, v213, v215);
    }
  }
  isAuthoring = objc_msgSend_isAuthoring(self, v210, v211, v212);
  objc_msgSend_setIsAuthoring_(a4, v237, isAuthoring, v238);
  v242 = objc_msgSend_editorLocked(self, v239, v240, v241);
  objc_msgSend_setEditorLocked_(a4, v243, v242, v244);
  v248 = objc_msgSend_focusBehavior(self, v245, v246, v247);
  objc_msgSend_setFocusBehavior_(a4, v249, v248, v250);
  if (objc_msgSend_isAuthoring(self, v251, v252, v253)
    && objc_msgSend_authoringTargetNode(self, v254, v255, v256))
  {
    v257 = objc_msgSend_authoringTargetNode(self, v254, v255, v256);
    objc_msgSend_setAuthoringTargetNode_(a4, v258, v257, v259);
  }
  isGizmo = objc_msgSend_isGizmo(self, v254, v255, v256);
  objc_msgSend_setGizmo_(a4, v261, isGizmo, v262);
  os_unfair_lock_lock(&self->_valueForKeyLock);
  valueForKey = self->_valueForKey;
  v372[0] = MEMORY[0x1E0C809B0];
  v372[1] = 3221225472;
  v372[2] = sub_1B18908E8;
  v372[3] = &unk_1E63D54B0;
  v372[4] = a4;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(valueForKey, v264, (uint64_t)v372, v265);
  os_unfair_lock_unlock(&self->_valueForKeyLock);
  if ((v7 & 1) == 0)
    objc_msgSend__copyAnimationsFrom_(a4, v266, (uint64_t)self, v268);
  objc_msgSend_commitImmediate(VFXTransaction, v266, v267, v268);
  if (objc_msgSend_model(self, v269, v270, v271))
  {
    if ((v7 & 4) != 0)
    {
      v278 = objc_msgSend_model(self, v272, v273, v274);
      v280 = objc_msgSend__cloneSharable_remap_(VFXNode, v279, v278, (uint64_t)a5);
      objc_msgSend_setModel_(a4, v281, v280, v282);
      if (a5)
      {
        v283 = objc_alloc(MEMORY[0x1E0C99DE8]);
        v287 = (void *)objc_msgSend_model(a4, v284, v285, v286);
        v291 = (void *)objc_msgSend_materials(v287, v288, v289, v290);
        v295 = objc_msgSend_count(v291, v292, v293, v294);
        v298 = (void *)objc_msgSend_initWithCapacity_(v283, v296, v295, v297);
        v368 = 0u;
        v369 = 0u;
        v370 = 0u;
        v371 = 0u;
        v302 = (void *)objc_msgSend_model(a4, v299, v300, v301, 0);
        v306 = (void *)objc_msgSend_materials(v302, v303, v304, v305);
        v308 = objc_msgSend_countByEnumeratingWithState_objects_count_(v306, v307, (uint64_t)&v368, (uint64_t)v381, 16);
        if (v308)
        {
          v312 = v308;
          v313 = *(_QWORD *)v369;
          do
          {
            for (k = 0; k != v312; ++k)
            {
              if (*(_QWORD *)v369 != v313)
                objc_enumerationMutation(v306);
              v315 = *(void **)(*((_QWORD *)&v368 + 1) + 8 * k);
              Value = (id)CFDictionaryGetValue(a5, v315);
              if (!Value)
              {
                Value = (id)objc_msgSend_copy(v315, v316, v317, v318);
                CFDictionaryAddValue(a5, v315, Value);
              }
              objc_msgSend_addObject_(v298, v316, (uint64_t)Value, v318);
            }
            v312 = objc_msgSend_countByEnumeratingWithState_objects_count_(v306, v320, (uint64_t)&v368, (uint64_t)v381, 16);
          }
          while (v312);
        }
        v321 = (void *)objc_msgSend_model(a4, v309, v310, v311);
        objc_msgSend_setMaterials_(v321, v322, (uint64_t)v298, v323);

      }
    }
    else
    {
      v275 = objc_msgSend_model(self, v272, v273, v274);
      objc_msgSend_setModel_(a4, v276, v275, v277);
    }
  }
  if (objc_msgSend_morpher(self, v272, v273, v274))
  {
    v327 = (void *)objc_msgSend_morpher(self, v324, v325, v326);
    v331 = (id)objc_msgSend_copy(v327, v328, v329, v330);
    objc_msgSend_setMorpher_(a4, v332, (uint64_t)v331, v333);
  }
  if (objc_msgSend_skinner(self, v324, v325, v326))
  {
    v337 = (void *)objc_msgSend_skinner(self, v334, v335, v336);
    v341 = (id)objc_msgSend_copy(v337, v338, v339, v340);
    objc_msgSend_setSkinner_(a4, v342, (uint64_t)v341, v343);
  }
  if (objc_msgSend_physicsBody(self, v334, v335, v336))
  {
    v347 = (void *)objc_msgSend_physicsBody(self, v344, v345, v346);
    v351 = (id)objc_msgSend_copy(v347, v348, v349, v350);
    objc_msgSend_setPhysicsBody_(a4, v352, (uint64_t)v351, v353);
  }
  if (objc_msgSend_prefab(self, v344, v345, v346))
  {
    v357 = (void *)objc_msgSend_prefab(self, v354, v355, v356);
    v361 = (id)objc_msgSend_copy(v357, v358, v359, v360);
    objc_msgSend_setPrefab_(a4, v362, (uint64_t)v361, v363);
  }
  *((_BYTE *)a4 + 49) = *((_BYTE *)a4 + 49) & 0xF7 | *((_BYTE *)self + 49) & 8;
}

- (id)copy
{
  uint64_t v2;

  return (id)objc_msgSend_copyWithZone_(self, a2, 0, v2);
}

- (id)_copyRecursively:(unint64_t)a3 remapOut:(__CFDictionary *)a4
{
  id v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend__copyWithOptions_to_remap_(self, v8, a3, (uint64_t)v7, a4);
  if (a4)
  {
    CFDictionarySetValue(a4, self, v7);
    if (objc_msgSend_physicsBody(v7, v12, v13, v14))
    {
      v18 = (const void *)objc_msgSend_physicsBody(self, v15, v16, v17);
      v22 = (const void *)objc_msgSend_physicsBody(v7, v19, v20, v21);
      CFDictionarySetValue(a4, v18, v22);
    }
    if (objc_msgSend_behaviorGraph(v7, v15, v16, v17))
    {
      v23 = (void *)objc_msgSend_behaviorGraph(self, v9, v10, v11);
      v27 = (const void *)objc_msgSend_coreEntityHandle(v23, v24, v25, v26);
      v31 = (void *)objc_msgSend_behaviorGraph(v7, v28, v29, v30);
      v35 = (const void *)objc_msgSend_coreEntityHandle(v31, v32, v33, v34);
      CFDictionarySetValue(a4, v27, v35);
    }
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v36 = (void *)objc_msgSend_childNodes(self, v9, v10, v11, 0);
  v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v50, (uint64_t)v54, 16);
  if (v38)
  {
    v42 = v38;
    v43 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v42; ++i)
      {
        if (*(_QWORD *)v51 != v43)
          objc_enumerationMutation(v36);
        v45 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        if ((objc_msgSend_isGizmo(v45, v39, v40, v41) & 1) == 0)
        {
          v46 = (void *)objc_msgSend__copyRecursively_remapOut_(v45, v39, a3, (uint64_t)a4);
          objc_msgSend_addChildNode_(v7, v47, (uint64_t)v46, v48);

        }
      }
      v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v50, (uint64_t)v54, 16);
    }
    while (v42);
  }
  return v7;
}

- (id)_cloneWithOption:(unint64_t)a3 remapTable:(__CFDictionary *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD v18[5];

  v6 = (void *)objc_msgSend__copyRecursively_remapOut_(self, a2, a3 | 1, (uint64_t)a4);
  sub_1B1890B5C(v6, a4, v7, v8);
  if (a4)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = sub_1B1890D80;
    v18[3] = &unk_1E63D7E58;
    v18[4] = a4;
    objc_msgSend_enumerateHierarchyUsingBlock_(v6, v9, (uint64_t)v18, v11);
  }
  sub_1B1890E6C(self, v6, v10, v11, v12, v13, v14, v15, v17);
  return v6;
}

- (id)cloneWithOption:(unint64_t)a3
{
  CFMutableDictionaryRef Mutable;
  const char *v6;
  void *v7;

  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  v7 = (void *)objc_msgSend__cloneWithOption_remapTable_(self, v6, a3, (uint64_t)Mutable);
  CFRelease(Mutable);
  return v7;
}

- (id)clone
{
  return (id)((uint64_t (*)(VFXNode *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_cloneWithOption_, 0);
}

- (id)_deepCloneWithRemapTableOut:(__CFDictionary *)a3
{
  return (id)objc_msgSend__cloneWithOption_remapTable_(self, a2, 4, (uint64_t)a3);
}

- (id)deepClone
{
  CFMutableDictionaryRef Mutable;
  const char *v4;
  uint64_t v5;
  void *v6;

  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  v6 = (void *)objc_msgSend__deepCloneWithRemapTableOut_(self, v4, (uint64_t)Mutable, v5);
  CFRelease(Mutable);
  return v6;
}

- (BOOL)_isAReference
{
  return 0;
}

+ (VFXNode)nodeWithNodeRef:(__CFXNode *)a3
{
  VFXNode *result;
  id v6;
  const char *v7;
  uint64_t v8;

  result = (VFXNode *)sub_1B193E758((id *)a3);
  if (!result)
  {
    v6 = objc_alloc((Class)a1);
    return (VFXNode *)(id)objc_msgSend_initWithNodeRef_(v6, v7, (uint64_t)a3, v8);
  }
  return result;
}

- (id)childNodeWithName:(id)a3
{
  return (id)objc_msgSend_childNodeWithName_recursively_(self, a2, (uint64_t)a3, 1);
}

- (id)childNodeWithName:(id)a3 recursively:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend_childNodes(self, a2, (uint64_t)a3, a4);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v30, (uint64_t)v35, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v31;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v13)
        objc_enumerationMutation(v6);
      v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v14);
      v16 = (void *)objc_msgSend_name(v15, v9, v10, v11);
      if ((objc_msgSend_isEqualToString_(v16, v17, (uint64_t)a3, v18) & 1) != 0)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v30, (uint64_t)v35, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v15 = 0;
  }
  if (!v15 && v4)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v26, (uint64_t)v34, 16);
    if (v19)
    {
      v21 = v19;
      v22 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v6);
          v24 = (void *)objc_msgSend_childNodeWithName_recursively_(*(void **)(*((_QWORD *)&v26 + 1) + 8 * i), v20, (uint64_t)a3, 1);
          if (v24)
            return v24;
        }
        v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v20, (uint64_t)&v26, (uint64_t)v34, 16);
        v15 = 0;
        if (v21)
          continue;
        break;
      }
    }
    else
    {
      return 0;
    }
  }
  return v15;
}

- (id)objectInChildNodesWithName:(id)a3
{
  return (id)objc_msgSend_childNodeWithName_recursively_(self, a2, (uint64_t)a3, 1);
}

- (BOOL)_childNodesPassingTest:(id)a3 recursively:(BOOL)a4 output:(id)a5
{
  _BOOL4 v6;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  _BYTE v27[128];
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  if ((*((unsigned int (**)(id, VFXNode *, char *))a3 + 2))(a3, self, &v26))
    objc_msgSend_addObject_(a5, v9, (uint64_t)self, v11);
  if (v26)
    v12 = 1;
  else
    v12 = !v6;
  if (v12)
    return v26 != 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = (void *)objc_msgSend_childNodes(self, v9, v10, v11, 0);
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v22, (uint64_t)v27, 16);
  if (!v15)
    return v26 != 0;
  v17 = v15;
  v18 = *(_QWORD *)v23;
  v19 = 1;
LABEL_9:
  v20 = 0;
  while (1)
  {
    if (*(_QWORD *)v23 != v18)
      objc_enumerationMutation(v13);
    v26 = objc_msgSend__childNodesPassingTest_recursively_output_(*(void **)(*((_QWORD *)&v22 + 1) + 8 * v20), v16, (uint64_t)a3, 1, a5);
    if ((v26 & 1) != 0)
      return v19;
    if (v17 == ++v20)
    {
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v22, (uint64_t)v27, 16);
      if (v17)
        goto LABEL_9;
      return v26 != 0;
    }
  }
}

- (id)childNodesPassingTest:(id)a3 recursively:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
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
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, (uint64_t)a3, a4);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = (void *)objc_msgSend_childNodes(self, v8, v9, v10, 0);
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v20;
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v16)
        objc_enumerationMutation(v11);
      if ((objc_msgSend__childNodesPassingTest_recursively_output_(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v17), v14, (uint64_t)a3, v4, v7) & 1) != 0)break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v19, (uint64_t)v23, 16);
        if (v15)
          goto LABEL_3;
        return v7;
      }
    }
  }
  return v7;
}

- (id)childNodesPassingTest:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_childNodesPassingTest_recursively_, a3, 1);
}

- (BOOL)_enumerateChildNodesUsingBlock:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  char v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v21 = 0;
  (*((void (**)(id, VFXNode *, char *))a3 + 2))(a3, self, &v21);
  if (!v21)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = (void *)objc_msgSend_childNodes(self, v5, v6, v7, 0);
    v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v17, (uint64_t)v22, 16);
    if (v11)
    {
      v14 = v11;
      v15 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v9);
          v21 = objc_msgSend__enumerateChildNodesUsingBlock_(*(void **)(*((_QWORD *)&v17 + 1) + 8 * i), v12, (uint64_t)a3, v13);
          if ((v21 & 1) != 0)
            return 1;
        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v17, (uint64_t)v22, 16);
        if (v14)
          continue;
        break;
      }
    }
  }
  return v21 != 0;
}

- (void)enumerateChildNodesUsingBlock:(id)a3
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
  v5 = (void *)objc_msgSend_childNodes(self, a2, (uint64_t)a3, v3, 0);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v14;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v5);
      if ((objc_msgSend__enumerateChildNodesUsingBlock_(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v12), v8, (uint64_t)a3, v9) & 1) != 0)break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v13, (uint64_t)v17, 16);
        if (v10)
          goto LABEL_3;
        return;
      }
    }
  }
}

- (void)enumerateHierarchyUsingBlock:(id)a3
{
  const char *v5;
  uint64_t v6;
  char v7;

  v7 = 0;
  (*((void (**)(id, VFXNode *, char *))a3 + 2))(a3, self, &v7);
  if (!v7)
    objc_msgSend_enumerateChildNodesUsingBlock_(self, v5, (uint64_t)a3, v6);
}

- (void)_childNodesWithAttribute:(Class)a3 output:(id)a4 recursively:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v5 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v8 = (void *)objc_msgSend_childNodes(self, a2, (uint64_t)a3, (uint64_t)a4, 0);
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v13);
        if ((Class)objc_opt_class() == a3 && objc_msgSend_camera(v14, v15, v16, v17)
          || (Class)objc_opt_class() == a3 && objc_msgSend_light(v14, v18, v19, v20)
          || (Class)objc_opt_class() == a3 && objc_msgSend_model(v14, v21, v22, v23)
          || (Class)objc_opt_class() == a3 && objc_msgSend_morpher(v14, v24, v25, v26)
          || (Class)objc_opt_class() == a3 && objc_msgSend_skinner(v14, v27, v28, v29))
        {
          objc_msgSend_addObject_(a4, v27, (uint64_t)v14, v30);
        }
        if (v5)
          objc_msgSend__childNodesWithAttribute_output_recursively_(v14, v27, (uint64_t)a3, (uint64_t)a4, 1);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v27, (uint64_t)&v31, (uint64_t)v35, 16);
    }
    while (v11);
  }
}

- (id)childNodesWithAttribute:(Class)a3 recursively:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  const char *v8;

  v4 = a4;
  v7 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, (uint64_t)a3, a4);
  objc_msgSend__childNodesWithAttribute_output_recursively_(self, v8, (uint64_t)a3, (uint64_t)v7, v4);
  return v7;
}

- (id)objectInChildNodesWithAttribute:(id)a3 firstOnly:(BOOL)a4
{
  void *v6;
  const char *v7;
  _QWORD v9[6];
  _QWORD v10[3];
  BOOL v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = a4;
  v6 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, (uint64_t)a3, a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B18919D8;
  v9[3] = &unk_1E63D7E80;
  v9[4] = a3;
  v9[5] = v10;
  objc_msgSend__childNodesPassingTest_recursively_output_(self, v7, (uint64_t)v9, 1, v6);
  _Block_object_dispose(v10, 8);
  return v6;
}

- (id)jsChildNodesWithAttribute:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_objectInChildNodesWithAttribute_firstOnly_, a3, 0);
}

- (id)_findComponentWithType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *components;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  id result;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFDictionary *v25;
  uint64_t v26;
  const __CFDictionary *v27;
  uint64_t v28;
  const __CFDictionary *v29;
  uint64_t v30;
  const __CFDictionary *v31;
  uint64_t v32;

  if ((*((_BYTE *)self + 48) & 1) != 0)
  {
    switch(a3)
    {
      case 0:
        v15 = sub_1B1868FE8((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v15)
          goto LABEL_11;
        return (id)MEMORY[0x1E0DE7D20](VFXLight, sel_presentationLightWithLightRef_, v15, v3);
      case 1:
LABEL_11:
        v16 = sub_1B186CFA8((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v16)
          return 0;
        result = (id)MEMORY[0x1E0DE7D20](VFXCamera, sel_presentationCameraWithCameraRef_, v16, v17);
        break;
      case 2:
        v18 = sub_1B1868FA0((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v18)
          return 0;
        return (id)MEMORY[0x1E0DE7D20](VFXModel, sel_presentationModelWithGeometryRef_, v18, v19);
      case 3:
        v20 = sub_1B186AE38((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v20)
          return 0;
        return (id)objc_msgSend_skinnerWithSkinnerRef_(VFXSkinner, v21, v20, v22);
      case 4:
        v23 = sub_1B186ACAC((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v23)
          return 0;
        return (id)MEMORY[0x1E0DE7D20](VFXMorpher, sel_presentationMorpherWithMorpherRef_, v23, v24);
      case 5:
        return (id)sub_1B1869D10((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
      case 6:
        return 0;
      case 7:
        result = sub_1B186DB10((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!result)
          return 0;
        return result;
      case 8:
        v25 = sub_1B186DD10((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v25)
          return 0;
        return (id)MEMORY[0x1E0DE7D20](VFXForceField, sel_presentationForceFieldWithForceFieldRef_, v25, v26);
      case 9:
        return (id)sub_1B186D0F8((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
      case 10:
        v27 = sub_1B186DDFC((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v27)
          return 0;
        return (id)MEMORY[0x1E0DE7D20](VFXBehaviorGraph, sel_presentationBehaviorGraphWithCoreEntityHandleRef_, v27, v28);
      case 11:
        v29 = sub_1B1869D88((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v29)
          return 0;
        return (id)MEMORY[0x1E0DE7D20](VFXParticleEmitter, sel_presentationParticleEmitterWithCoreEntityHandleRef_, v29, v30);
      case 12:
        v31 = sub_1B186DDDC((uint64_t)self->_node, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
        if (!v31)
          return 0;
        return (id)MEMORY[0x1E0DE7D20](VFXParticleCollider, sel_presentationParticleColliderWithCoreEntityHandleRef_, v31, v32);
      default:
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: unknown component type : %d"), a3, v3, v4, v5, v6, v7, a3);
        return 0;
    }
  }
  else if ((((*((_WORD *)self + 26) & 0x3FFFu) >> a3) & 1) != 0 && (components = self->_components) != 0)
  {
    while (objc_msgSend_type(components, a2, a3, v3) != a3)
    {
      result = (id)objc_msgSend_next(components, v11, v12, v13);
      components = result;
      if (!result)
        return result;
    }
    return (id)objc_msgSend_component(components, v11, v12, v13);
  }
  else
  {
    return 0;
  }
  return result;
}

- (void)_removeComponentWithType:(int64_t)a3
{
  uint64_t v3;
  VFXNodeComponent *components;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  VFXNodeComponent *v10;
  VFXNodeComponent *v11;
  VFXNodeComponent *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  components = self->_components;
  if (components)
  {
    if (objc_msgSend_type(self->_components, a2, a3, v3) == a3)
    {
      v10 = 0;
LABEL_7:
      v16 = (void *)objc_msgSend_next(components, v7, v8, v9);
      if (v10)
      {
        objc_msgSend_setNext_(v10, v17, (uint64_t)v16, v18);
      }
      else
      {
        self->_components = (VFXNodeComponent *)v16;

      }
      *((_WORD *)self + 26) &= (unsigned __int16)~(1 << a3) | 0xC000;
    }
    else
    {
      v11 = components;
      while (1)
      {
        v12 = (VFXNodeComponent *)objc_msgSend_next(v11, v7, v8, v9);
        if (!v12)
          break;
        components = v12;
        v10 = v11;
        v11 = v12;
        if (objc_msgSend_type(v12, v13, v14, v15) == a3)
          goto LABEL_7;
      }
    }
  }
}

- (void)_assignComponent:(id)a3 toContainerWithType:(int64_t)a4
{
  int v7;
  void *components;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  VFXNodeComponent *v12;
  const char *v13;
  VFXNodeComponent *v14;
  const char *v15;
  uint64_t v16;

  v7 = 1 << a4;
  if ((*((_WORD *)self + 26) & (unsigned __int16)(1 << a4) & 0x3FFF) != 0 && (components = self->_components) != 0)
  {
    while (objc_msgSend_type(components, a2, (uint64_t)a3, a4) != a4)
    {
      components = (void *)objc_msgSend_next(components, v9, v10, v11);
      if (!components)
        goto LABEL_5;
    }
    objc_msgSend_setComponent_(components, v9, (uint64_t)a3, v11);
  }
  else
  {
LABEL_5:
    v12 = [VFXNodeComponent alloc];
    v14 = (VFXNodeComponent *)objc_msgSend_initWithType_component_(v12, v13, a4, (uint64_t)a3);
    objc_msgSend_setNext_(v14, v15, (uint64_t)self->_components, v16);

    self->_components = v14;
    *((_WORD *)self + 26) |= v7 & 0x3FFF;
  }
}

- (id)__light
{
  uint64_t v2;
  uint64_t ComponentWithType;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFDictionary *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;

  ComponentWithType = objc_msgSend__findComponentWithType_(self, a2, 0, v2);
  v8 = (void *)ComponentWithType;
  if ((*((_BYTE *)self + 48) & 2) != 0 || ComponentWithType)
    goto LABEL_8;
  v9 = objc_msgSend_worldRef(self, v5, v6, v7);
  v17 = v9;
  if (v9)
    sub_1B187973C(v9, v10, v11, v12, v13, v14, v15, v16);
  *((_BYTE *)self + 48) |= 2u;
  v18 = sub_1B1868FE8((uint64_t)self->_node, v10, v11, v12, v13, v14, v15, v16);
  if (v18)
  {
    v8 = (void *)objc_msgSend_lightWithLightRef_(VFXLight, v5, (uint64_t)v18, v7);
    objc_msgSend__setComponent_withType_(self, v23, (uint64_t)v8, 0);
    if (!v17)
      goto LABEL_8;
    goto LABEL_7;
  }
  v8 = 0;
  if (v17)
LABEL_7:
    sub_1B18797B4(v17, (uint64_t)v5, v6, v7, v19, v20, v21, v22);
LABEL_8:
  if ((*((_BYTE *)self + 48) & 1) != 0)
    return (id)objc_msgSend_presentationLight(v8, v5, v6, v7);
  else
    return v8;
}

- (id)__camera
{
  uint64_t v2;
  uint64_t ComponentWithType;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFDictionary *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;

  ComponentWithType = objc_msgSend__findComponentWithType_(self, a2, 1, v2);
  v8 = (void *)ComponentWithType;
  if ((*((_BYTE *)self + 48) & 8) != 0 || ComponentWithType)
    goto LABEL_8;
  v9 = objc_msgSend_worldRef(self, v5, v6, v7);
  v17 = v9;
  if (v9)
    sub_1B187973C(v9, v10, v11, v12, v13, v14, v15, v16);
  *((_BYTE *)self + 48) |= 8u;
  v18 = sub_1B186CFA8((uint64_t)self->_node, v10, v11, v12, v13, v14, v15, v16);
  if (v18)
  {
    v8 = (void *)objc_msgSend_cameraWithCameraRef_(VFXCamera, v5, (uint64_t)v18, v7);
    objc_msgSend__setComponent_withType_(self, v23, (uint64_t)v8, 1);
    if (!v17)
      goto LABEL_8;
    goto LABEL_7;
  }
  v8 = 0;
  if (v17)
LABEL_7:
    sub_1B18797B4(v17, (uint64_t)v5, v6, v7, v19, v20, v21, v22);
LABEL_8:
  if ((*((_BYTE *)self + 48) & 1) != 0)
    return (id)objc_msgSend_presentationCamera(v8, v5, v6, v7);
  else
    return v8;
}

- (id)__model
{
  uint64_t v2;
  uint64_t ComponentWithType;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  const char *v23;

  ComponentWithType = objc_msgSend__findComponentWithType_(self, a2, 2, v2);
  v8 = (void *)ComponentWithType;
  if ((*((_BYTE *)self + 48) & 4) != 0 || ComponentWithType)
    goto LABEL_8;
  *((_BYTE *)self + 48) |= 4u;
  v9 = objc_msgSend_worldRef(self, v5, v6, v7);
  v17 = v9;
  if (v9)
    sub_1B187973C(v9, v10, v11, v12, v13, v14, v15, v16);
  v18 = sub_1B1868FA0((uint64_t)self->_node, v10, v11, v12, v13, v14, v15, v16);
  if (v18)
  {
    v8 = (void *)objc_msgSend_modelWithGeometryRef_(VFXModel, v5, v18, v7);
    objc_msgSend__setComponent_withType_(self, v23, (uint64_t)v8, 2);
    if (!v17)
      goto LABEL_8;
    goto LABEL_7;
  }
  v8 = 0;
  if (v17)
LABEL_7:
    sub_1B18797B4(v17, (uint64_t)v5, v6, v7, v19, v20, v21, v22);
LABEL_8:
  if ((*((_BYTE *)self + 48) & 1) != 0)
    return (id)objc_msgSend_presentationModel(v8, v5, v6, v7);
  else
    return v8;
}

- (id)__skinner
{
  uint64_t v2;
  uint64_t ComponentWithType;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
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
  uint64_t v36;
  const char *v37;
  uint64_t v38;

  ComponentWithType = objc_msgSend__findComponentWithType_(self, a2, 3, v2);
  v8 = (void *)ComponentWithType;
  if ((*((_BYTE *)self + 48) & 0x10) == 0 && !ComponentWithType)
  {
    v9 = objc_msgSend_worldRef(self, v5, v6, v7);
    v17 = v9;
    if (v9)
      sub_1B187973C(v9, v10, v11, v12, v13, v14, v15, v16);
    *((_BYTE *)self + 48) |= 0x10u;
    v18 = sub_1B186AE38((uint64_t)self->_node, v10, v11, v12, v13, v14, v15, v16);
    if (!v18)
    {
      v8 = 0;
      if (!v17)
        return v8;
      goto LABEL_9;
    }
    v8 = (void *)objc_msgSend_skinnerWithSkinnerRef_(VFXSkinner, v19, v18, v21);
    if (objc_msgSend_model(self, v26, v27, v28))
    {
      v32 = (void *)objc_msgSend_model(self, v29, v30, v31);
      v36 = objc_msgSend_mesh(v32, v33, v34, v35);
      objc_msgSend__setBaseMesh_(v8, v37, v36, v38);
    }
    objc_msgSend__setComponent_withType_(self, v29, (uint64_t)v8, 3);
    if (v17)
LABEL_9:
      sub_1B18797B4(v17, (uint64_t)v19, v20, v21, v22, v23, v24, v25);
  }
  return v8;
}

- (id)__morpher
{
  uint64_t v2;
  uint64_t ComponentWithType;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
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
  const char *v24;
  uint64_t v25;
  const char *v26;

  ComponentWithType = objc_msgSend__findComponentWithType_(self, a2, 4, v2);
  v8 = (void *)ComponentWithType;
  if ((*((_BYTE *)self + 48) & 0x20) != 0 || ComponentWithType)
    goto LABEL_8;
  v9 = objc_msgSend_worldRef(self, v5, v6, v7);
  v17 = v9;
  if (v9)
    sub_1B187973C(v9, v10, v11, v12, v13, v14, v15, v16);
  *((_BYTE *)self + 48) |= 0x20u;
  v18 = sub_1B186ACAC((uint64_t)self->_node, v10, v11, v12, v13, v14, v15, v16);
  if (v18)
  {
    v23 = sub_1B17A0A4C(v18);
    v8 = (void *)objc_msgSend_morpherWithMorphRef_(VFXMorpher, v24, v23, v25);
    objc_msgSend__setComponent_withType_(self, v26, (uint64_t)v8, 4);
    if (!v17)
      goto LABEL_8;
    goto LABEL_7;
  }
  v8 = 0;
  if (v17)
LABEL_7:
    sub_1B18797B4(v17, (uint64_t)v5, v6, v7, v19, v20, v21, v22);
LABEL_8:
  if ((*((_BYTE *)self + 48) & 1) != 0)
    return (id)objc_msgSend_presentationObject(v8, v5, v6, v7);
  else
    return v8;
}

- (__CFXNode)nodeRef
{
  return self->_node;
}

- (id)hitTestWithSegmentFromPoint:(VFXNode *)self toPoint:(SEL)a2 options:(id)a3
{
  uint64_t v3;
  double v4;
  double v5;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __n128 *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  __int128 v40;
  const char *v41;
  uint64_t v42;
  __n128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  double v63;
  double v64;
  __n128 v65;
  __int128 v66;
  float32x4_t v67[2];

  v63 = v4;
  v64 = v5;
  v8 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
  if (v8)
  {
    v16 = (__n128 *)v8;
    sub_1B187973C(v8, (uint64_t)v9, v10, v11, v12, v13, v14, v15);
    memset(v67, 0, sizeof(v67));
    if (a3)
    {
      v23 = objc_msgSend_objectForKey_(a3, v17, (uint64_t)CFSTR("kHitTestRootNode"), v19);
      v24 = self;
      if (v23)
        v24 = (void *)objc_msgSend_objectForKey_(a3, v20, (uint64_t)CFSTR("kHitTestRootNode"), v22);
      v25 = objc_msgSend_nodeRef(v24, v20, v21, v22);
      v29 = (id)objc_msgSend_mutableCopy(a3, v26, v27, v28);
      objc_msgSend_setObject_forKey_(v29, v30, v25, (uint64_t)CFSTR("kHitTestRootNode"));
    }
    else
    {
      v35 = objc_msgSend_nodeRef(self, v17, v18, v19);
      v29 = (id)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v36, v37, v38);
      objc_msgSend_setObject_forKey_(v29, v39, v35, (uint64_t)CFSTR("kHitTestRootNode"));
    }
    objc_msgSend_convertPosition_toNode_(self, v31, 0, v32, v63);
    v66 = v40;
    objc_msgSend_convertPosition_toNode_(self, v41, 0, v42, v64);
    v65 = v43;
    sub_1B1824088(v67, &v66, &v65);
    v49 = (const void *)sub_1B17ACF48(v16, v67, (CFDictionaryRef)v29, v44, v45, v46, v47, v48);
    v33 = (void *)objc_msgSend_hitTestResultsFromHitTestResultRef_(VFXHitTestResult, v50, (uint64_t)v49, v51);
    if (v49)
      CFRelease(v49);
    sub_1B18797B4((uint64_t)v16, v52, v53, v54, v55, v56, v57, v58);
    v34 = objc_msgSend_count(v33, v59, v60, v61);
  }
  else
  {
    v33 = 0;
    v34 = objc_msgSend_count(0, v9, v10, v11);
  }
  if (v34)
    return v33;
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (void)_updateTransform
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;
  int v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  int v14;
  __float2 v15;
  float32x4_t v16;
  float32x4_t v17;
  __float2 v18;
  float32x4_t v19;
  float32x4_t v20;
  __float2 v21;
  uint64_t v22;
  float32x4_t v23;
  uint64_t v24;
  float32x4_t cosval_low;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  float v30;
  float32x2_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  int8x16_t v40;
  int32x4_t v41;
  __float2 v47;
  float32x4_t v48;
  float32x4_t v49;
  int8x16_t v50;
  float v51;
  float32x4_t v52;
  unsigned int v53;
  float32x2_t v54;
  unsigned int v55;
  unsigned int v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  __int128 v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  __int128 v68;
  float32x4_t v69;
  float32x4_t v70;
  __int128 v71;
  float32x4_t v72;
  float32x4_t v73;

  v9 = *((unsigned __int8 *)self + 49);
  if ((v9 & 1) == 0)
  {
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. cannot update matrix without affine"), v2, v3, v4, v5, v6, v7, (uint64_t)"_affineUpToDate");
    v9 = *((unsigned __int8 *)self + 49);
  }
  v10 = (v9 >> 5) & 3;
  if (v10 == 2)
  {
    v27 = *(float32x4_t *)&self->_anon_90[2];
    v28 = vmulq_f32(v27, v27);
    v29 = vmulq_laneq_f32(v27, v27, 3);
    v30 = vmulq_lane_f32(v27, *(float32x2_t *)v27.f32, 1).f32[0];
    v28.f32[0] = 0.5 - v28.f32[0];
    v31 = vmul_laneq_f32(*(float32x2_t *)v27.f32, v27, 2);
    v32.i32[3] = 0;
    v32.f32[0] = (float)(0.5 - v28.f32[1]) - v28.f32[2];
    v32.f32[1] = v30 + v29.f32[2];
    v32.f32[2] = v31.f32[0] - v29.f32[1];
    v33.i32[3] = 0;
    v11 = vaddq_f32(v32, v32);
    v33.f32[0] = v30 - v29.f32[2];
    v33.f32[1] = v28.f32[0] - v28.f32[2];
    v33.f32[2] = v31.f32[1] + v29.f32[0];
    *(int32x2_t *)v29.f32 = vrev64_s32(*(int32x2_t *)v29.f32);
    v34.i32[0] = vadd_f32(v31, *(float32x2_t *)v29.f32).u32[0];
    v34.i32[1] = vsub_f32(v31, *(float32x2_t *)&v29).i32[1];
    v34.f32[2] = v28.f32[0] - v28.f32[1];
    v12 = vaddq_f32(v33, v33);
    v34.i32[3] = 0;
    v13 = vaddq_f32(v34, v34);
LABEL_13:
    v14 = 1065353216;
    goto LABEL_14;
  }
  if (v10 == 1)
  {
    v35 = *(float32x4_t *)&self->_anon_90[2];
    v36 = vmulq_f32(v35, v35);
    v36.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v36, 2), vaddq_f32(v36, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 1))).u64[0];
    v37 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 0);
    v37.i32[3] = 0;
    v38 = vrsqrteq_f32(v37);
    v39 = vmulq_f32(v38, vrsqrtsq_f32(v37, vmulq_f32(v38, v38)));
    v40 = (int8x16_t)vmulq_f32(v39, vrsqrtsq_f32(v37, vmulq_f32(v39, v39)));
    v41 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v36.f32[0] != 0.0)), 0x1FuLL));
    v41.i32[3] = 0;
    __asm { FMOV            V4.4S, #1.0 }
    v65 = vmulq_f32(v35, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v41), v40, _Q4));
    v67 = (float32x4_t)_Q4;
    v47 = __sincosf_stret(v35.f32[3]);
    v48 = v65;
    v49 = vmulq_f32(v48, v48);
    v50 = (int8x16_t)vmlaq_n_f32(v49, vsubq_f32(v67, v49), v47.__cosval);
    v51 = (float)(1.0 - v47.__cosval) * vmulq_lane_f32(v48, *(float32x2_t *)v48.f32, 1).f32[0];
    v52 = vmulq_n_f32(v65, -v47.__sinval);
    *(float *)&v53 = v51 - v52.f32[2];
    v48.f32[0] = v51 + v52.f32[2];
    v54 = vmul_n_f32(vmul_laneq_f32(*(float32x2_t *)v65.f32, v65, 2), 1.0 - v47.__cosval);
    *(float *)&v55 = v54.f32[0] + v52.f32[1];
    *(float *)&v56 = v54.f32[1] - v52.f32[0];
    *(int32x2_t *)v52.f32 = vrev64_s32(*(int32x2_t *)v52.f32);
    v13.i32[0] = vsub_f32(v54, *(float32x2_t *)v52.f32).u32[0];
    v13.i32[1] = vadd_f32(v54, *(float32x2_t *)&v52).i32[1];
    v11.i64[0] = __PAIR64__(v53, v50.u32[0]);
    v11.i64[1] = v55;
    v12.i64[0] = __PAIR64__(v50.u32[1], v48.u32[0]);
    v12.i64[1] = v56;
    v13.i64[1] = vextq_s8(v50, v50, 8uLL).u32[0];
    goto LABEL_13;
  }
  v11 = 0uLL;
  v12 = 0uLL;
  v13 = 0uLL;
  v14 = 0;
  if (!v10)
  {
    v15 = __sincosf_stret(*(float *)&self->_anon_90[2]);
    v16.i32[0] = 0;
    v16.i32[1] = LODWORD(v15.__cosval);
    v16.i64[1] = LODWORD(v15.__sinval);
    v17.i32[0] = 0;
    v17.f32[1] = -v15.__sinval;
    v17.i64[1] = LODWORD(v15.__cosval);
    v64 = v17;
    v66 = v16;
    v18 = __sincosf_stret(*(float *)&self->_anon_90[6]);
    v19.i32[3] = 0;
    v19.i64[0] = LODWORD(v18.__cosval);
    v19.f32[2] = -v18.__sinval;
    v20.i64[0] = LODWORD(v18.__sinval);
    v20.i64[1] = LODWORD(v18.__cosval);
    v62 = v20;
    v63 = v19;
    v21 = __sincosf_stret(*(float *)&self->_anon_90[10]);
    v22 = 0;
    v23.i32[1] = 0;
    v23.i64[1] = 0;
    v68 = xmmword_1B2244DB0;
    v69 = v66;
    v70 = v64;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    do
    {
      *(__int128 *)((char *)&v71 + v22) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v63, COERCE_FLOAT(*(__int128 *)((char *)&v68 + v22))), (float32x4_t)xmmword_1B2244DD0, *(float32x2_t *)((char *)&v68 + v22), 1), v62, *(float32x4_t *)((char *)&v68 + v22), 2);
      v22 += 16;
    }
    while (v22 != 48);
    v24 = 0;
    cosval_low = (float32x4_t)LODWORD(v21.__cosval);
    cosval_low.i32[1] = LODWORD(v21.__sinval);
    cosval_low.i32[2] = 0;
    v23.f32[0] = -v21.__sinval;
    v26 = v23;
    v26.i32[1] = LODWORD(v21.__cosval);
    v26.i32[2] = 0;
    v68 = v71;
    v69 = v72;
    v70 = v73;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    do
    {
      *(__int128 *)((char *)&v71 + v24) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(cosval_low, COERCE_FLOAT(*(__int128 *)((char *)&v68 + v24))), v26, *(float32x2_t *)((char *)&v68 + v24), 1), (float32x4_t)xmmword_1B2244D90, *(float32x4_t *)((char *)&v68 + v24), 2);
      v24 += 16;
    }
    while (v24 != 48);
    v11 = (float32x4_t)v71;
    v12 = v72;
    v13 = v73;
    v11.i32[3] = 0;
    v12.i32[3] = 0;
    v14 = 1065353216;
    v13.i32[3] = 0;
  }
LABEL_14:
  v57 = *(float32x4_t *)&self->_scale[2];
  v58 = vmulq_n_f32(v11, v57.f32[0]);
  v59 = vmulq_lane_f32(v12, *(float32x2_t *)v57.f32, 1);
  v60 = vmulq_laneq_f32(v13, v57, 2);
  v61 = *(_OWORD *)&self->_position[2];
  HIDWORD(v61) = v14;
  *(float32x4_t *)&self->_anon_40[2] = v58;
  *(float32x4_t *)&self->_anon_40[18] = v59;
  *(float32x4_t *)&self->_anon_40[34] = v60;
  *(_OWORD *)&self->_anon_40[50] = v61;
  *((_BYTE *)self + 49) = v9 | 2;
}

- (void)_updateAffine
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if ((*((_BYTE *)self + 49) & 2) == 0)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. cannot update affine without matrix"), v2, v3, v4, v5, v6, v7, (uint64_t)"_transformUpToDate");
  sub_1B18927E4((float32x4_t *)&self->_anon_90[2], (__n128 *)&self->_position[2], (float32x4_t *)&self->_scale[2], *(float32x4_t *)&self->_anon_40[2], *(float32x4_t *)&self->_anon_40[18], *(float32x4_t *)&self->_anon_40[34], *(__n128 *)&self->_anon_40[50]);
  *((_BYTE *)self + 49) = *((_BYTE *)self + 49) & 0x9E | 0x41;
}

- (int64_t)rotationRepresentation
{
  return ((unint64_t)*((unsigned __int8 *)self + 49) >> 5) & 3;
}

- (double)_quaternion
{
  unsigned int v5;
  int v6;
  float32x4_t v7;
  float32x4_t v8;
  simd_float4 v9;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  int8x16_t v25;
  int32x4_t v26;
  simd_float4 x;
  simd_float4 v30;

  v5 = a1[3].u8[1];
  if ((v5 & 1) == 0)
  {
    objc_msgSend__updateAffine(a1, a2, a3, a4);
    v5 = a1[3].u8[1];
  }
  v6 = (v5 >> 5) & 3;
  if (v6)
  {
    if (v6 == 1)
    {
      objc_msgSend_rotation(a1, a2, a3, a4);
      v21 = vmulq_f32(v20, v20);
      v21.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v21, 2), vaddq_f32(v21, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 1))).u64[0];
      v22 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v21.f32, 0);
      v22.i32[3] = 0;
      v23 = vrsqrteq_f32(v22);
      v24 = vmulq_f32(v23, vrsqrtsq_f32(v22, vmulq_f32(v23, v23)));
      v25 = (int8x16_t)vmulq_f32(v24, vrsqrtsq_f32(v22, vmulq_f32(v24, v24)));
      v26 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v21.f32[0] != 0.0)), 0x1FuLL));
      v26.i32[3] = 0;
      __asm { FMOV            V3.4S, #1.0 }
      v7.i64[0] = vmulq_n_f32(vmulq_f32(v20, (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v26), v25, _Q3)), __sincosf_stret(vmuls_lane_f32(0.5, v20, 3)).__sinval).u64[0];
    }
    else
    {
      v7.i64[0] = 0;
      if (v6 == 2)
        v7 = a1[9];
    }
  }
  else
  {
    v8.i64[0] = 0x3F0000003F000000;
    v8.i64[1] = 0x3F0000003F000000;
    v9 = (simd_float4)vmulq_f32(a1[9], v8);
    v9.i32[3] = 0;
    x = v9;
    v30 = _simd_cos_f4(v9);
    _Q1 = _simd_sin_f4(x);
    _Q7 = v30;
    v7.f32[0] = vmlas_n_f32(-(float)(v30.f32[0] * vmuls_lane_f32(_Q1.f32[1], (float32x4_t)_Q1, 2)), vmuls_lane_f32(v30.f32[1], (float32x4_t)v30, 2), _Q1.f32[0]);
    _S4 = vmuls_lane_f32(v30.f32[0], *(float32x2_t *)_Q1.f32, 1);
    __asm { FMLA            S5, S4, V7.S[2] }
    _S4 = vmuls_lane_f32(_Q7.f32[0], *(float32x2_t *)_Q7.f32, 1);
    __asm { FMLA            S6, S4, V1.S[2] }
    v7.i32[1] = _S5;
  }
  return *(double *)v7.i64;
}

- (uint64_t)_setQuaternion:(uint64_t)a3
{
  uint64_t result;
  const char *v7;
  uint64_t v8;
  float32x4_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  float32x4_t v19;
  _QWORD v20[4];
  float32x4_t v21;
  uint64_t v22;

  if ((*(_BYTE *)(a1 + 49) & 1) == 0)
    objc_msgSend__updateAffine((void *)a1, a2, a3, a4);
  result = objc_msgSend__quaternion((void *)a1, a2, a3, a4, *(_OWORD *)&a5);
  if ((vminvq_u32((uint32x4_t)vceqq_f32(v19, v9)) & 0x80000000) == 0)
  {
    objc_msgSend_willChangeValueForKey_((void *)a1, v7, (uint64_t)CFSTR("orientation"), v8);
    v10 = *(_BYTE *)(a1 + 49);
    *(float32x4_t *)(a1 + 144) = v19;
    *(_BYTE *)(a1 + 49) = v10 & 0x9D | 0x40;
    v14 = objc_msgSend_worldRef((void *)a1, v11, v12, v13);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = sub_1B1892DA0;
    v20[3] = &unk_1E63D5468;
    v21 = v19;
    v22 = a1;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v15, v14, a1, CFSTR("orientation"), v20);
    return objc_msgSend_didChangeValueForKey_((void *)a1, v16, (uint64_t)CFSTR("orientation"), v17);
  }
  return result;
}

- (double)_euler
{
  char v5;
  float32x4_t v6;
  int8x16_t v8;
  float v9;
  __int128 v10;
  float v11;
  float v13;
  float v19;
  double v20;
  float v21;
  int *v22;
  float v23;
  float v24;
  uint64_t v25;
  float v27;
  float v28;
  float v29;
  float v30;

  v5 = *(_BYTE *)(a1 + 49);
  if ((v5 & 1) == 0)
  {
    objc_msgSend__updateAffine((void *)a1, a2, a3, a4);
    v5 = *(_BYTE *)(a1 + 49);
  }
  if ((v5 & 0x60) != 0)
  {
    objc_msgSend__quaternion((void *)a1, a2, a3, a4);
    _Q2 = v6;
    v8 = (int8x16_t)vmulq_f32(v6, v6);
    v9 = vaddv_f32(vadd_f32(*(float32x2_t *)v8.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL)));
    *(_QWORD *)&v10 = 0;
    if (v9 != 0.0)
    {
      v11 = _Q2.f32[3];
      _S9 = _Q2.f32[1];
      v13 = _Q2.f32[2];
      __asm { FMLA            S1, S9, V2.S[3] }
      v19 = _S1 / v9;
      v20 = (float)(_S1 / v9);
      if (v20 <= 0.4999)
      {
        if (v20 >= -0.4999)
        {
          v24 = *(float *)&v8.i32[1];
          v25 = v8.i64[1];
          v27 = _Q2.f32[0];
          v28 = *(float *)v8.i32;
          v30 = atan2f((float)((float)(_Q2.f32[0] * _Q2.f32[3]) + (float)(_Q2.f32[1] * _Q2.f32[2]))+ (float)((float)(_Q2.f32[0] * _Q2.f32[3]) + (float)(_Q2.f32[1] * _Q2.f32[2])), *(float *)&v8.i32[3]+ (float)(*(float *)&v8.i32[2] + (float)((float)-*(float *)v8.i32 - *(float *)&v8.i32[1])));
          v29 = asinf(v19 + v19);
          atan2f((float)((float)(v13 * v11) + (float)(v27 * _S9)) + (float)((float)(v13 * v11) + (float)(v27 * _S9)), *((float *)&v25 + 1) + (float)((float)(v28 - v24) - *(float *)&v25));
          *(_QWORD *)&v10 = __PAIR64__(LODWORD(v29), LODWORD(v30));
          return *(double *)&v10;
        }
        v23 = atan2f(_Q2.f32[0], _Q2.f32[3]);
        *(float *)&v10 = v23 + v23;
        v22 = &dword_1B2245B80;
      }
      else
      {
        v21 = atan2f(_Q2.f32[0], _Q2.f32[3]);
        *(float *)&v10 = v21 + v21;
        v22 = &dword_1B2245B84;
      }
      DWORD1(v10) = *v22;
    }
  }
  else
  {
    v10 = *(_OWORD *)(a1 + 144);
  }
  return *(double *)&v10;
}

- (void)_setPosition:(VFXNode *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  uint32x4_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  float32x4_t v14;
  _QWORD v15[4];
  float32x4_t v16;
  VFXNode *v17;

  v14 = v4;
  if ((*((_BYTE *)self + 49) & 1) == 0)
  {
    objc_msgSend__updateAffine(self, a2, v2, v3);
    v4 = v14;
  }
  v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_position[2], v4);
  v6.i32[3] = v6.i32[2];
  if ((vminvq_u32(v6) & 0x80000000) == 0)
  {
    objc_msgSend_willChangeValueForKey_(self, a2, (uint64_t)CFSTR("position"), v3);
    *((_BYTE *)self + 49) &= ~2u;
    *(float32x4_t *)&self->_position[2] = v14;
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B189302C;
    v15[3] = &unk_1E63D5468;
    v17 = self;
    v16 = v14;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, CFSTR("translation"), v15);
    objc_msgSend_didChangeValueForKey_(self, v12, (uint64_t)CFSTR("position"), v13);
  }
}

- (void)_setScale:(VFXNode *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  uint32x4_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  float32x4_t v14;
  _QWORD v15[4];
  float32x4_t v16;
  VFXNode *v17;

  v14 = v4;
  if ((*((_BYTE *)self + 49) & 1) == 0)
  {
    objc_msgSend__updateAffine(self, a2, v2, v3);
    v4 = v14;
  }
  v6 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_scale[2], v4);
  v6.i32[3] = v6.i32[2];
  if ((vminvq_u32(v6) & 0x80000000) == 0)
  {
    objc_msgSend_willChangeValueForKey_(self, a2, (uint64_t)CFSTR("scale"), v3);
    *((_BYTE *)self + 49) &= ~2u;
    *(float32x4_t *)&self->_scale[2] = v14;
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1B1893138;
    v15[3] = &unk_1E63D5468;
    v17 = self;
    v16 = v14;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, CFSTR("scale"), v15);
    objc_msgSend_didChangeValueForKey_(self, v12, (uint64_t)CFSTR("scale"), v13);
  }
}

+ (id)keyPathsForValuesAffectingPosition
{
  uint64_t v2;

  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("transform"), v2, 0);
}

+ (id)keyPathsForValuesAffectingTransform
{
  uint64_t v2;

  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("position"), v2, CFSTR("rotation"), CFSTR("eulerAngles"), CFSTR("orientation"), CFSTR("scale"), 0);
}

+ (id)keyPathsForValuesAffectingRotation
{
  uint64_t v2;

  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("eulerAngles"), v2, CFSTR("orientation"), CFSTR("transform"), 0);
}

+ (id)keyPathsForValuesAffectingEulerAngles
{
  uint64_t v2;

  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("rotation"), v2, CFSTR("orientation"), CFSTR("transform"), 0);
}

+ (id)keyPathsForValuesAffectingOrientation
{
  uint64_t v2;

  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("rotation"), v2, CFSTR("eulerAngles"), CFSTR("transform"), 0);
}

+ (id)keyPathsForValuesAffectingScale
{
  uint64_t v2;

  return (id)objc_msgSend_setWithObjects_(MEMORY[0x1E0C99E60], a2, (uint64_t)CFSTR("transform"), v2, 0);
}

- (BOOL)isHittable
{
  return sub_1B186CD48((uint64_t)self->_node);
}

- (void)setHittable:(BOOL)a3
{
  sub_1B186CD54((uint64_t)self->_node, a3);
}

- (BOOL)castsShadow
{
  uint64_t v2;
  uint64_t v3;
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
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 48) & 1) == 0)
    return *((_BYTE *)self + 50) & 1;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B186CAF4((uint64_t)self->_node, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B186CAF4((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setCastsShadow:(BOOL)a3
{
  uint64_t v3;
  char v6;
  uint64_t v7;
  const char *v8;
  _QWORD v9[5];
  BOOL v10;

  v6 = *((_BYTE *)self + 50);
  if (((v6 & 1) == 0) == a3 || (*((_BYTE *)self + 48) & 1) != 0)
  {
    *((_BYTE *)self + 50) = v6 & 0xFE | a3;
    v7 = objc_msgSend_worldRef(self, a2, a3, v3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1B1893400;
    v9[3] = &unk_1E63D5328;
    v9[4] = self;
    v10 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
  }
}

- (BOOL)usesDepthPrePass
{
  uint64_t v2;
  uint64_t v3;
  int v5;
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
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 48) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v22 = sub_1B1869D98((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
      sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
      LOBYTE(v5) = v22;
    }
    else
    {
      LOBYTE(v5) = sub_1B1869D98((uint64_t)self->_node, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    return (*((unsigned __int8 *)self + 50) >> 1) & 1;
  }
  return v5;
}

- (void)setUsesDepthPrePass:(BOOL)a3
{
  uint64_t v3;
  char v4;
  char v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = *((_BYTE *)self + 50);
  if (((((v4 & 2) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v7 = 2;
    else
      v7 = 0;
    *((_BYTE *)self + 50) = v4 & 0xFD | v7;
    v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B1893530;
    v10[3] = &unk_1E63D5328;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (unint64_t)categoryBitMask
{
  uint64_t v2;
  uint64_t v3;
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
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 48) & 1) == 0)
    return self->_categoryBitMask;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B186CC98((uint64_t)self->_node, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B186CC98((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setCategoryBitMask:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_categoryBitMask != a3)
  {
    self->_categoryBitMask = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B189363C;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (BOOL)isHidden
{
  uint64_t v2;
  uint64_t v3;
  int v5;
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
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 48) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v22 = sub_1B1868D5C((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
      sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
      LOBYTE(v5) = v22;
    }
    else
    {
      LOBYTE(v5) = sub_1B1868D5C((uint64_t)self->_node, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    return *((unsigned __int8 *)self + 49) >> 7;
  }
  return v5;
}

- (void)setHidden:(BOOL)a3
{
  uint64_t v3;
  unsigned int v6;
  char v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  BOOL v11;

  v6 = *((unsigned __int8 *)self + 49);
  if (a3 != v6 >> 7 || (*((_BYTE *)self + 48) & 1) != 0)
  {
    if (a3)
      v7 = 0x80;
    else
      v7 = 0;
    *((_BYTE *)self + 49) = v7 & 0x80 | v6 & 0x7F;
    v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B189376C;
    v10[3] = &unk_1E63D5328;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("hidden"), v10);
  }
}

- (BOOL)isHiddenOrHasHiddenAncestor
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((objc_msgSend_isHidden(self, a2, v2, v3) & 1) != 0)
    return 1;
  v9 = objc_msgSend_parentNode(self, v5, v6, v7);
  return MEMORY[0x1E0DE7D20](v9, sel_isHiddenOrHasHiddenAncestor, v10, v11);
}

- (float)opacity
{
  uint64_t v2;
  uint64_t v3;
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
  float v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 48) & 1) == 0)
    return self->_opacity;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return sub_1B186A4D4((uint64_t)self->_node, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B186A4D4((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setOpacity:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  double v6;
  float v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  float v11;

  v6 = a3;
  if (v6 > 1.0)
    v6 = 1.0;
  v7 = fmax(v6, 0.0);
  if (self->_opacity != v7 || (*((_BYTE *)self + 48) & 1) != 0)
  {
    self->_opacity = v7;
    v8 = objc_msgSend_worldRef(self, a2, v3, v4);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B18938F0;
    v10[3] = &unk_1E63D53A0;
    v10[4] = self;
    v11 = v7;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, CFSTR("opacity"), v10);
  }
}

- (int64_t)renderingOrder
{
  uint64_t v2;
  uint64_t v3;
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
  const __CFDictionary *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 48) & 1) == 0)
    return self->_renderingOrder;
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return (int64_t)sub_1B186C9C0((uint64_t)self->_node, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = sub_1B186C9C0((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return (int64_t)v22;
}

- (void)setRenderingOrder:(int64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  if (self->_renderingOrder != a3 || (*((_BYTE *)self + 48) & 1) != 0)
  {
    self->_renderingOrder = a3;
    v6 = objc_msgSend_worldRef(self, a2, a3, v3);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = sub_1B1893A08;
    v8[3] = &unk_1E63D5440;
    v8[4] = self;
    v8[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
  }
}

- (VFXNode)parentNode
{
  uint64_t v2;
  uint64_t v3;
  VFXNode *v5;
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if ((*((_BYTE *)self + 48) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef(self, a2, v2, v3);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
    v15 = sub_1B186B574((uint64_t)self->_node, v7, v8, v9, v10, v11, v12, v13);
    if (v15)
    {
      v5 = (VFXNode *)objc_msgSend_nodeWithNodeRef_(VFXNode, v16, v15, v18);
      if (!v14)
        return v5;
    }
    else
    {
      v5 = 0;
      if (!v14)
        return v5;
    }
    sub_1B18797B4(v14, (uint64_t)v16, v17, v18, v19, v20, v21, v22);
    return v5;
  }
  return self->_parent;
}

- (NSArray)childNodes
{
  uint64_t v2;
  uint64_t v3;
  NSArray *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  const char *v21;
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
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;

  if ((*((_BYTE *)self + 48) & 1) != 0)
  {
    v10 = objc_msgSend_worldRef(self, a2, v2, v3);
    v18 = v10;
    if (v10)
      sub_1B187973C(v10, v11, v12, v13, v14, v15, v16, v17);
    v19 = sub_1B186AF90((uint64_t)self->_node);
    v20 = v19;
    v9 = (NSArray *)objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v21, v19, v22);
    if (v19)
    {
      v30 = 0;
      do
      {
        v31 = sub_1B186B18C((uint64_t)self->_node, v30);
        v34 = objc_msgSend_nodeWithNodeRef_(VFXNode, v32, v31, v33);
        objc_msgSend_addObject_(v9, v35, v34, v36);
        ++v30;
      }
      while (v20 != v30);
    }
    if (v18)
      sub_1B18797B4(v18, v23, v24, v25, v26, v27, v28, v29);
  }
  else
  {
    v5 = (NSArray *)(id)objc_msgSend_copy(self->_childNodes, a2, v2, v3);
    if (objc_msgSend_count(v5, v6, v7, v8))
      return v5;
    else
      return (NSArray *)MEMORY[0x1E0C9AA60];
  }
  return v9;
}

- (id)mutableChildNodes
{
  return self->_childNodes;
}

- (void)_setComponent:(id)a3 withType:(int64_t)a4
{
  if (a3)
    objc_msgSend__assignComponent_toContainerWithType_(self, a2, (uint64_t)a3, a4);
  else
    objc_msgSend__removeComponentWithType_(self, a2, a4, a4);
}

- (void)setLight:(id)a3
{
  uint64_t v3;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[6];

  if ((id)objc_msgSend_light(self, a2, (uint64_t)a3, v3) != a3)
  {
    objc_msgSend__setComponent_withType_(self, v6, (uint64_t)a3, 0);
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1B1893C34;
    v12[3] = &unk_1E63D53C8;
    v12[4] = self;
    v12[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
  }
}

- (VFXLight)light
{
  return (VFXLight *)((uint64_t (*)(VFXNode *, char *))MEMORY[0x1E0DE7D20])(self, sel___light);
}

- (VFXSkinner)skinner
{
  return (VFXSkinner *)((uint64_t (*)(VFXNode *, char *))MEMORY[0x1E0DE7D20])(self, sel___skinner);
}

- (BOOL)isJoint
{
  return (*((unsigned __int8 *)self + 49) >> 3) & 1;
}

- (void)setIsJoint:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_BYTE *)self + 49) = *((_BYTE *)self + 49) & 0xF7 | v3;
}

- (BOOL)isGizmo
{
  return (*((unsigned __int8 *)self + 49) >> 4) & 1;
}

- (void)setGizmo:(BOOL)a3
{
  uint64_t v3;
  char v4;
  char v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = *((_BYTE *)self + 49);
  if (((((v4 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v7 = 16;
    else
      v7 = 0;
    *((_BYTE *)self + 49) = v4 & 0xEF | v7;
    v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B1893D50;
    v10[3] = &unk_1E63D5328;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (id)prefab
{
  uint64_t v2;

  return (id)objc_msgSend__findComponentWithType_(self, a2, 13, v2);
}

- (void)setPrefab:(id)a3
{
  objc_msgSend__setComponent_withType_(self, a2, (uint64_t)a3, 13);
}

- (void)setSkinner:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  _QWORD v24[6];

  if ((id)objc_msgSend_skinner(self, a2, (uint64_t)a3, v3) != a3)
  {
    if (objc_msgSend_model(self, v6, v7, v8))
    {
      v12 = (void *)objc_msgSend_model(self, v9, v10, v11);
      v16 = objc_msgSend_mesh(v12, v13, v14, v15);
      objc_msgSend__setBaseMesh_(a3, v17, v16, v18);
    }
    objc_msgSend__setComponent_withType_(self, v9, (uint64_t)a3, 3);
    v22 = objc_msgSend_worldRef(self, v19, v20, v21);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1B1893E38;
    v24[3] = &unk_1E63D53C8;
    v24[4] = self;
    v24[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v23, v22, (uint64_t)self, v24);
  }
}

- (VFXMorpher)morpher
{
  return (VFXMorpher *)((uint64_t (*)(VFXNode *, char *))MEMORY[0x1E0DE7D20])(self, sel___morpher);
}

- (void)setMorpher:(id)a3
{
  uint64_t v3;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[6];

  if ((id)objc_msgSend_morpher(self, a2, (uint64_t)a3, v3) != a3)
  {
    objc_msgSend__setComponent_withType_(self, v6, (uint64_t)a3, 4);
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1B1893F08;
    v12[3] = &unk_1E63D53C8;
    v12[4] = a3;
    v12[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
  }
}

- (id)deformers
{
  uint64_t v2;
  id result;

  result = (id)objc_msgSend__findComponentWithType_(self, a2, 9, v2);
  if (!result)
    return (id)MEMORY[0x1E0C9AA60];
  return result;
}

- (void)setDeformers:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  _QWORD v16[6];

  if ((id)objc_msgSend_deformers(self, a2, (uint64_t)a3, v3) != a3)
  {
    v9 = (void *)objc_msgSend_copy(a3, v6, v7, v8);
    objc_msgSend__setComponent_withType_(self, v10, (uint64_t)v9, 9);
    v14 = objc_msgSend_worldRef(self, v11, v12, v13);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1B189403C;
    v16[3] = &unk_1E63D53C8;
    v16[4] = self;
    v16[5] = v9;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, v16);

  }
}

- (void)setCamera:(id)a3
{
  uint64_t v3;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[6];

  if ((id)objc_msgSend_camera(self, a2, (uint64_t)a3, v3) != a3)
  {
    objc_msgSend__setComponent_withType_(self, v6, (uint64_t)a3, 1);
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1B18940E8;
    v12[3] = &unk_1E63D53C8;
    v12[4] = self;
    v12[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
  }
}

- (VFXCamera)camera
{
  return (VFXCamera *)((uint64_t (*)(VFXNode *, char *))MEMORY[0x1E0DE7D20])(self, sel___camera);
}

- (VFXModel)model
{
  return (VFXModel *)((uint64_t (*)(VFXNode *, char *))MEMORY[0x1E0DE7D20])(self, sel___model);
}

- (void)setModel:(id)a3
{
  uint64_t v3;
  id v6;
  const char *v7;
  uint64_t v8;
  VFXWorld *world;
  const char *v10;
  uint64_t v11;
  VFXWorld *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[6];

  v6 = (id)objc_msgSend_model(self, a2, (uint64_t)a3, v3);
  if (v6 != a3)
  {
    if (v6)
    {
      world = self->_world;
      if (world)
        objc_msgSend_removeWorldReference_(v6, v7, (uint64_t)world, v8);
    }
    objc_msgSend__setComponent_withType_(self, v7, (uint64_t)a3, 2);
    v12 = self->_world;
    if (v12)
      objc_msgSend_addWorldReference_(a3, v10, (uint64_t)v12, v11);
    v13 = objc_msgSend_skinner(self, v10, (uint64_t)v12, v11);
    if (v13)
    {
      v17 = (void *)v13;
      v18 = objc_msgSend_mesh(a3, v14, v15, v16);
      objc_msgSend__setBaseMesh_(v17, v19, v18, v20);
    }
    v21 = objc_msgSend_worldRef(self, v14, v15, v16);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = sub_1B1894220;
    v34[3] = &unk_1E63D53C8;
    v34[4] = self;
    v34[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v22, v21, (uint64_t)self, v34);
    v26 = (void *)objc_msgSend_physicsBody(self, v23, v24, v25);
    if (v26)
    {
      v30 = v26;
      if (objc_msgSend_hasDefaultShape(v26, v27, v28, v29))
        objc_msgSend_updateDefaultShape(v30, v31, v32, v33);
    }
  }
}

- (void)modelChanged
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

  v4 = (void *)objc_msgSend_physicsBody(self, a2, v2, v3);
  if (v4)
  {
    v8 = v4;
    if (objc_msgSend_hasDefaultShape(v4, v5, v6, v7))
      objc_msgSend_updateDefaultShape(v8, v9, v10, v11);
  }
}

- (void)setFilters:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  _QWORD v16[6];

  if ((id)objc_msgSend_filters(self, a2, (uint64_t)a3, v3) != a3)
  {
    v9 = (id)objc_msgSend_copy(a3, v6, v7, v8);
    objc_msgSend__setComponent_withType_(self, v10, (uint64_t)v9, 5);
    v14 = objc_msgSend_worldRef(self, v11, v12, v13);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1B1894334;
    v16[3] = &unk_1E63D53C8;
    v16[4] = self;
    v16[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, v16);
  }
}

- (NSArray)filters
{
  uint64_t v2;
  uint64_t v3;
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
  NSArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((*((_BYTE *)self + 48) & 1) == 0)
    return (NSArray *)objc_msgSend__findComponentWithType_(self, a2, 5, v3);
  v6 = objc_msgSend_worldRef(self, a2, v2, v3);
  if (!v6)
    return (NSArray *)sub_1B1869D10((uint64_t)self->_node, v7, v8, v9, v10, v11, v12, v13);
  v14 = v6;
  sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v22 = (NSArray *)sub_1B1869D10((uint64_t)self->_node, v15, v16, v17, v18, v19, v20, v21);
  sub_1B18797B4(v14, v23, v24, v25, v26, v27, v28, v29);
  return v22;
}

- (void)setBehaviorGraph:(id)a3
{
  uint64_t v3;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  _QWORD v23[6];

  v6 = (id)objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3);
  if (v6 != a3)
  {
    v10 = v6;
    v11 = objc_msgSend_world(self, v7, v8, v9);
    if (v11)
    {
      v14 = v11;
      objc_msgSend_willBeRemovedFromWorld_(v10, v12, v11, v13);
      objc_msgSend__setComponent_withType_(self, v15, (uint64_t)a3, 10);
      objc_msgSend_wasAddedToWorld_(a3, v16, v14, v17);
    }
    else
    {
      objc_msgSend__setComponent_withType_(self, v12, (uint64_t)a3, 10);
    }
    v21 = objc_msgSend_worldRef(self, v18, v19, v20);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1B1894494;
    v23[3] = &unk_1E63D53C8;
    v23[4] = self;
    v23[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v22, v21, (uint64_t)self, v23);
  }
}

- (VFXBehaviorGraph)behaviorGraph
{
  uint64_t v2;
  VFXBehaviorGraph *result;
  uint64_t v5;
  uint64_t v6;

  result = (VFXBehaviorGraph *)objc_msgSend__findComponentWithType_(self, a2, 10, v2);
  if ((*((_BYTE *)self + 48) & 1) != 0)
    return (VFXBehaviorGraph *)MEMORY[0x1E0DE7D20](result, sel_presentationBehaviorGraph, v5, v6);
  return result;
}

- (void)setParticleEmitter:(id)a3
{
  uint64_t v3;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  _QWORD v23[6];

  v6 = (id)objc_msgSend_particleEmitter(self, a2, (uint64_t)a3, v3);
  if (v6 != a3)
  {
    v10 = v6;
    v11 = objc_msgSend_world(self, v7, v8, v9);
    if (v11)
    {
      v14 = v11;
      objc_msgSend_willBeRemovedFromWorld_(v10, v12, v11, v13);
      objc_msgSend__setComponent_withType_(self, v15, (uint64_t)a3, 11);
      objc_msgSend_wasAddedToWorld_(a3, v16, v14, v17);
    }
    else
    {
      objc_msgSend__setComponent_withType_(self, v12, (uint64_t)a3, 11);
    }
    v21 = objc_msgSend_worldRef(self, v18, v19, v20);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1B18945E0;
    v23[3] = &unk_1E63D53C8;
    v23[4] = self;
    v23[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v22, v21, (uint64_t)self, v23);
  }
}

- (VFXParticleEmitter)particleEmitter
{
  uint64_t v2;

  return (VFXParticleEmitter *)objc_msgSend__findComponentWithType_(self, a2, 11, v2);
}

- (void)setParticleCollider:(id)a3
{
  uint64_t v3;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  _QWORD v23[6];

  v6 = (id)objc_msgSend_particleCollider(self, a2, (uint64_t)a3, v3);
  if (v6 != a3)
  {
    v10 = v6;
    v11 = objc_msgSend_world(self, v7, v8, v9);
    if (v11)
    {
      v14 = v11;
      objc_msgSend_willBeRemovedFromWorld_(v10, v12, v11, v13);
      objc_msgSend__setComponent_withType_(self, v15, (uint64_t)a3, 12);
      objc_msgSend_wasAddedToWorld_(a3, v16, v14, v17);
    }
    else
    {
      objc_msgSend__setComponent_withType_(self, v12, (uint64_t)a3, 12);
    }
    v21 = objc_msgSend_worldRef(self, v18, v19, v20);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1B18946F4;
    v23[3] = &unk_1E63D53C8;
    v23[4] = self;
    v23[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v22, v21, (uint64_t)self, v23);
  }
}

- (id)particleCollider
{
  uint64_t v2;

  return (id)objc_msgSend__findComponentWithType_(self, a2, 12, v2);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v8 = (void *)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: %p"), v7, v5, self);
  v12 = (void *)objc_msgSend_name(self, v9, v10, v11);
  if (objc_msgSend_length(v12, v13, v14, v15))
  {
    v19 = objc_msgSend_name(self, v16, v17, v18);
    objc_msgSend_appendFormat_(v8, v20, (uint64_t)CFSTR(" '%@'"), v21, v19);
  }
  objc_msgSend_position(self, v16, v17, v18);
  if (*(float *)&v25 != 0.0 || *((float *)&v25 + 1) != 0.0 || v26 != 0.0)
    objc_msgSend_appendFormat_(v8, v22, (uint64_t)CFSTR(" pos(%f %f %f)"), v24, *(float *)&v25, *((float *)&v25 + 1), v26);
  objc_msgSend_rotation(self, v22, v23, v24);
  v33 = *(float *)&v31 == 0.0 && *((float *)&v30 + 1) == 0.0 && *(float *)&v30 == 0.0;
  if (!v33 && *((float *)&v31 + 1) != 0.0)
    objc_msgSend_appendFormat_(v8, v27, (uint64_t)CFSTR(" rot(%f %f %f %f)"), v29, *(float *)&v30, *((float *)&v30 + 1), *(float *)&v31, *((float *)&v31 + 1));
  objc_msgSend_scale(self, v27, v28, v29);
  if (*(float *)&v37 != 1.0 || *((float *)&v37 + 1) != 1.0 || v38 != 1.0)
    objc_msgSend_appendFormat_(v8, v34, (uint64_t)CFSTR(" scale(%f %f %f)"), v36, *(float *)&v37, *((float *)&v37 + 1), v38);
  if (objc_msgSend_light(self, v34, v35, v36)
    || objc_msgSend_camera(self, v39, v40, v41)
    || objc_msgSend_model(self, v39, v42, v41))
  {
    objc_msgSend_appendString_(v8, v39, (uint64_t)CFSTR(" |"), v41);
  }
  if (objc_msgSend_light(self, v39, v43, v41))
  {
    v47 = objc_msgSend_light(self, v44, v45, v46);
    objc_msgSend_appendFormat_(v8, v48, (uint64_t)CFSTR(" light=%@"), v49, v47);
  }
  if (objc_msgSend_camera(self, v44, v45, v46))
  {
    v53 = objc_msgSend_camera(self, v50, v51, v52);
    objc_msgSend_appendFormat_(v8, v54, (uint64_t)CFSTR(" camera=%@"), v55, v53);
  }
  if (objc_msgSend_model(self, v50, v51, v52))
  {
    v59 = objc_msgSend_model(self, v56, v57, v58);
    objc_msgSend_appendFormat_(v8, v60, (uint64_t)CFSTR(" model=%@"), v61, v59);
  }
  v62 = (void *)objc_msgSend_childNodes(self, v56, v57, v58);
  v66 = objc_msgSend_count(v62, v63, v64, v65);
  if (v66 == 1)
  {
    objc_msgSend_appendString_(v8, v67, (uint64_t)CFSTR(" | 1 child"), v68);
  }
  else if (v66)
  {
    objc_msgSend_appendFormat_(v8, v67, (uint64_t)CFSTR(" | %d children"), v68, v66);
  }
  else
  {
    objc_msgSend_appendString_(v8, v67, (uint64_t)CFSTR(" | no child"), v68);
  }
  objc_msgSend_appendString_(v8, v69, (uint64_t)CFSTR(">"), v70);
  return (NSString *)v8;
}

- (BOOL)parseSpecialKey:(id)a3 withPath:(id)a4 intoDestination:(id *)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  __CFString *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;

  if (!objc_msgSend_hasPrefix_(a3, a2, (uint64_t)CFSTR("/"), (uint64_t)a4))
  {
    v16 = objc_msgSend_rangeOfString_(a3, v8, (uint64_t)CFSTR("["), v10);
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_12;
    v20 = v16;
    v21 = v16 + 1;
    if (v16 + 1 >= (unint64_t)objc_msgSend_length(a3, v17, v18, v19))
      goto LABEL_12;
    v24 = (__CFString *)objc_msgSend_substringToIndex_(a3, v22, v20, v23);
    v27 = (void *)objc_msgSend_substringFromIndex_(a3, v25, v21, v26);
    v30 = objc_msgSend_rangeOfString_(v27, v28, (uint64_t)CFSTR("]"), v29);
    if (v30 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_12;
    v33 = (void *)objc_msgSend_substringToIndex_(v27, v31, v30, v32);
    v37 = objc_msgSend_intValue(v33, v34, v35, v36);
    if ((objc_msgSend_isEqualToString_(v24, v38, (uint64_t)&stru_1E63FD500, v39) & 1) != 0
      || objc_msgSend_isEqualToString_(v24, v40, (uint64_t)CFSTR("nodes"), v41))
    {
      v24 = CFSTR("childNodes");
    }
    v42 = (void *)objc_msgSend_valueForKey_(self, v40, (uint64_t)v24, v41);
    if (objc_msgSend_count(v42, v43, v44, v45) <= (unint64_t)v37)
    {
LABEL_12:
      LOBYTE(v15) = 0;
      return (char)v15;
    }
    v15 = (void *)objc_msgSend_objectAtIndex_(v42, v46, v37, v47);
    goto LABEL_3;
  }
  v11 = objc_msgSend_length(a3, v8, v9, v10);
  v13 = objc_msgSend_substringWithRange_(a3, v12, 1, v11 - 1);
  v15 = (void *)objc_msgSend_childNodeWithName_recursively_(self, v14, v13, 1);
  if (v15)
  {
LABEL_3:
    *a5 = v15;
    LOBYTE(v15) = 1;
  }
  return (char)v15;
}

- (id)valueForKey:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
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
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  objc_super v49;

  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("transform"), v3))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_transform(self, v6, v7, v8);
    return (id)objc_msgSend_valueWithVFXMatrix4_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v6, (uint64_t)CFSTR("position"), v8))
  {
    v17 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_position(self, v14, v15, v16);
    return (id)objc_msgSend_valueWithVFXFloat3_(v17, v18, v19, v20);
  }
  if (objc_msgSend_isEqualToString_(a3, v14, (uint64_t)CFSTR("scale"), v16))
  {
    v17 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_scale(self, v21, v22, v23);
    return (id)objc_msgSend_valueWithVFXFloat3_(v17, v18, v19, v20);
  }
  if (objc_msgSend_isEqualToString_(a3, v21, (uint64_t)CFSTR("orientation"), v23))
  {
    v27 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_orientation(self, v24, v25, v26);
    return (id)objc_msgSend_valueWithVFXFloat4_(v27, v28, v29, v30);
  }
  if (objc_msgSend_isEqualToString_(a3, v24, (uint64_t)CFSTR("eulerAngles"), v26))
    goto LABEL_15;
  if (objc_msgSend_isEqualToString_(a3, v31, (uint64_t)CFSTR("rotation"), v33))
  {
    v27 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_rotation(self, v34, v35, v36);
    return (id)objc_msgSend_valueWithVFXFloat4_(v27, v28, v29, v30);
  }
  if (objc_msgSend_isEqualToString_(a3, v34, (uint64_t)CFSTR("euler"), v36))
  {
LABEL_15:
    v17 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_eulerAngles(self, v31, v32, v33);
    return (id)objc_msgSend_valueWithVFXFloat3_(v17, v18, v19, v20);
  }
  if (objc_msgSend_isEqualToString_(a3, v31, (uint64_t)CFSTR("pivot"), v33))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_pivot(self, v37, v38, v39);
    return (id)objc_msgSend_valueWithVFXMatrix4_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v37, (uint64_t)CFSTR("worldTransform"), v39))
  {
    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_worldTransform(self, v40, v41, v42);
    return (id)objc_msgSend_valueWithVFXMatrix4_(v9, v10, v11, v12);
  }
  if (objc_msgSend_isEqualToString_(a3, v40, (uint64_t)CFSTR("worldPosition"), v42))
  {
    v17 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_worldPosition(self, v43, v44, v45);
    return (id)objc_msgSend_valueWithVFXFloat3_(v17, v18, v19, v20);
  }
  if (objc_msgSend_isEqualToString_(a3, v43, (uint64_t)CFSTR("worldOrientation"), v45))
  {
    v27 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend_worldOrientation(self, v46, v47, v48);
    return (id)objc_msgSend_valueWithVFXFloat4_(v27, v28, v29, v30);
  }
  v49.receiver = self;
  v49.super_class = (Class)VFXNode;
  return -[VFXNode valueForKey:](&v49, sel_valueForKey_, a3);
}

- (BOOL)rawFloat4ForKey:(id)a3 value:
{
  uint64_t v3;
  _OWORD *v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int isEqualToString;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = (_OWORD *)v3;
  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("orientation"), v3))
  {
    objc_msgSend_orientation(self, v7, v8, v9);
LABEL_7:
    *v4 = v10;
    LOBYTE(isEqualToString) = 1;
    return isEqualToString;
  }
  if (objc_msgSend_isEqualToString_(a3, v7, (uint64_t)CFSTR("rotation"), v9))
  {
    objc_msgSend_rotation(self, v11, v12, v13);
    goto LABEL_7;
  }
  isEqualToString = objc_msgSend_isEqualToString_(a3, v11, (uint64_t)CFSTR("worldOrientation"), v13);
  if (isEqualToString)
  {
    objc_msgSend_worldOrientation(self, v15, v16, v17);
    goto LABEL_7;
  }
  return isEqualToString;
}

- (BOOL)rawFloat3ForKey:(id)a3 value:
{
  uint64_t v3;
  _OWORD *v4;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int isEqualToString;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = (_OWORD *)v3;
  if (objc_msgSend_isEqualToString_(a3, a2, (uint64_t)CFSTR("position"), v3))
  {
    objc_msgSend_position(self, v7, v8, v9);
  }
  else if (objc_msgSend_isEqualToString_(a3, v7, (uint64_t)CFSTR("scale"), v9))
  {
    objc_msgSend_scale(self, v11, v12, v13);
  }
  else if (objc_msgSend_isEqualToString_(a3, v11, (uint64_t)CFSTR("eulerAngles"), v13)
         || objc_msgSend_isEqualToString_(a3, v14, (uint64_t)CFSTR("euler"), v16))
  {
    objc_msgSend_eulerAngles(self, v14, v15, v16);
  }
  else
  {
    isEqualToString = objc_msgSend_isEqualToString_(a3, v14, (uint64_t)CFSTR("worldPosition"), v16);
    if (!isEqualToString)
      return isEqualToString;
    objc_msgSend_worldPosition(self, v18, v19, v20);
  }
  *v4 = v10;
  LOBYTE(isEqualToString) = 1;
  return isEqualToString;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
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
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
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
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  objc_super v67;

  if (objc_msgSend_isEqualToString_(a4, a2, (uint64_t)CFSTR("transform"), (uint64_t)a4))
  {
    objc_msgSend_VFXMatrix4Value(a3, v7, v8, v9);
    objc_msgSend_setTransform_(self, v10, v11, v12);
    return;
  }
  if (objc_msgSend_isEqualToString_(a4, v7, (uint64_t)CFSTR("position"), v9))
  {
    objc_msgSend_VFXFloat3Value(a3, v13, v14, v15);
    objc_msgSend_setPosition_(self, v16, v17, v18);
    return;
  }
  if (objc_msgSend_isEqualToString_(a4, v13, (uint64_t)CFSTR("scale"), v15))
  {
    objc_msgSend_VFXFloat3Value(a3, v19, v20, v21);
    objc_msgSend_setScale_(self, v22, v23, v24);
    return;
  }
  if (objc_msgSend_isEqualToString_(a4, v19, (uint64_t)CFSTR("orientation"), v21))
  {
    objc_msgSend_VFXFloat4Value(a3, v25, v26, v27);
    objc_msgSend_setOrientation_(self, v28, v29, v30);
    return;
  }
  if (objc_msgSend_isEqualToString_(a4, v25, (uint64_t)CFSTR("eulerAngles"), v27))
    goto LABEL_13;
  if (objc_msgSend_isEqualToString_(a4, v31, (uint64_t)CFSTR("rotation"), v33))
  {
    objc_msgSend_VFXFloat4Value(a3, v34, v35, v36);
    objc_msgSend_setRotation_(self, v37, v38, v39);
    return;
  }
  if (objc_msgSend_isEqualToString_(a4, v34, (uint64_t)CFSTR("euler"), v36))
  {
LABEL_13:
    objc_msgSend_VFXFloat3Value(a3, v31, v32, v33);
    objc_msgSend_setEulerAngles_(self, v40, v41, v42);
  }
  else if (objc_msgSend_isEqualToString_(a4, v31, (uint64_t)CFSTR("pivot"), v33))
  {
    objc_msgSend_VFXMatrix4Value(a3, v43, v44, v45);
    objc_msgSend_setPivot_(self, v46, v47, v48);
  }
  else if (objc_msgSend_isEqualToString_(a4, v43, (uint64_t)CFSTR("worldTransform"), v45))
  {
    objc_msgSend_VFXMatrix4Value(a3, v49, v50, v51);
    objc_msgSend_setWorldTransform_(self, v52, v53, v54);
  }
  else if (objc_msgSend_isEqualToString_(a4, v49, (uint64_t)CFSTR("worldPosition"), v51))
  {
    objc_msgSend_VFXFloat3Value(a3, v55, v56, v57);
    objc_msgSend_setWorldPosition_(self, v58, v59, v60);
  }
  else if (objc_msgSend_isEqualToString_(a4, v55, (uint64_t)CFSTR("worldOrientation"), v57))
  {
    objc_msgSend_VFXFloat4Value(a3, v61, v62, v63);
    objc_msgSend_setWorldOrientation_(self, v64, v65, v66);
  }
  else
  {
    v67.receiver = self;
    v67.super_class = (Class)VFXNode;
    -[VFXNode setValue:forKey:](&v67, sel_setValue_forKey_, a3, a4);
  }
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
  uint64_t v41;
  uint64_t v42;
  void *v43;

  if (!objc_msgSend_length(a3, a2, (uint64_t)a3, (uint64_t)a4))
    return 0;
  v42 = 0;
  v43 = 0;
  v41 = 0;
  sub_1B18BCE30(a3, (char *)&v42, &v41, v7);
  if (objc_msgSend_parseSpecialKey_withPath_intoDestination_(self, v8, v42, (uint64_t)a3, &v43)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend_copyAnimationChannelForKeyPath_animation_(v43, v9, v41, (uint64_t)a4);
    if (v11)
    {
      v12 = (void *)v11;
      v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
      v17 = objc_msgSend_count(v12, v14, v15, v16);
      v20 = (void *)objc_msgSend_initWithCapacity_(v13, v18, v17 + 1, v19);
      objc_msgSend_addObject_(v20, v21, v42, v22);
      objc_msgSend_addObjectsFromArray_(v20, v23, (uint64_t)v12, v24);

      return v20;
    }
    return 0;
  }
  v43 = (void *)objc_msgSend_valueForKey_(self, v9, v42, v10);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    return sub_1B18C2DEC(self, (__CFString *)a3, v26, v27);
  v28 = (void *)objc_msgSend_copyAnimationChannelForKeyPath_animation_(v43, v25, v41, (uint64_t)a4);
  if (!v28)
    return sub_1B18C2DEC(self, (__CFString *)a3, v26, v27);
  v29 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v33 = objc_msgSend_count(v28, v30, v31, v32);
  v20 = (void *)objc_msgSend_initWithCapacity_(v29, v34, v33 + 1, v35);
  objc_msgSend_addObject_(v20, v36, v42, v37);
  objc_msgSend_addObjectsFromArray_(v20, v38, (uint64_t)v28, v39);

  return v20;
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  objc_super v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_hasPrefix_(a4, a2, (uint64_t)CFSTR("filters."), (uint64_t)a4))
  {
    v41 = 0;
    v42 = 0;
    sub_1B18BCE30(a4, (char *)&v42, (uint64_t *)&v41, v7);
    if (v41)
    {
      v8 = sub_1B19C1A30(&self->_node->var0.var0.var0, (CFStringRef)a4, 0);
      if (v8)
      {
        v16 = v8;
        if (sub_1B19C4614((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15))
        {
          if (a3)
          {
            if (a4)
            {
              v39 = 0;
              v40 = 0;
              sub_1B18BCE30(v41, (char *)&v40, &v39, v17);
              v35 = 0u;
              v36 = 0u;
              v37 = 0u;
              v38 = 0u;
              v21 = (void *)objc_msgSend_filters(self, v18, v19, v20);
              v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v35, (uint64_t)v43, 16);
              if (v23)
              {
                v27 = v23;
                v28 = *(_QWORD *)v36;
                while (2)
                {
                  for (i = 0; i != v27; ++i)
                  {
                    if (*(_QWORD *)v36 != v28)
                      objc_enumerationMutation(v21);
                    v30 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
                    v31 = (void *)objc_msgSend_name(v30, v24, v25, v26);
                    if (objc_msgSend_isEqualToString_(v31, v32, v40, v33))
                    {
                      objc_msgSend_setValue_forKey_(v30, v24, (uint64_t)a3, v39);
                      goto LABEL_18;
                    }
                  }
                  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v35, (uint64_t)v43, 16);
                  if (v27)
                    continue;
                  break;
                }
              }
            }
          }
        }
LABEL_18:
        CFRelease(v16);
      }
    }
  }
  else
  {
    v34.receiver = self;
    v34.super_class = (Class)VFXNode;
    -[VFXNode setValue:forKeyPath:](&v34, sel_setValue_forKeyPath_, a3, a4);
  }
}

- (id)valueForKeyPath:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  id result;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  objc_super v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if (objc_msgSend_hasPrefix_(a3, a2, (uint64_t)CFSTR("filters."), v3))
  {
    v35 = 0;
    v36 = 0;
    v9 = objc_msgSend_length(CFSTR("filters."), v6, v7, v8);
    v12 = (void *)objc_msgSend_substringFromIndex_(a3, v10, v9, v11);
    sub_1B18BCE30(v12, (char *)&v36, &v35, v13);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = (void *)objc_msgSend_filters(self, v14, v15, v16);
    result = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v31, (uint64_t)v37, 16);
    if (result)
    {
      v23 = result;
      v24 = *(_QWORD *)v32;
      while (2)
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(v17);
          v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v25);
          v27 = (void *)objc_msgSend_name(v26, v20, v21, v22);
          if ((objc_msgSend_isEqualToString_(v27, v28, v36, v29) & 1) != 0)
            return (id)objc_msgSend_valueForKey_(v26, v20, v35, v22);
          v25 = (char *)v25 + 1;
        }
        while (v23 != v25);
        result = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v31, (uint64_t)v37, 16);
        v23 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  else
  {
    result = (id)objc_msgSend__valueForSimdVectorKeyPath_(self, v6, (uint64_t)a3, v8);
    if (!result)
    {
      v30.receiver = self;
      v30.super_class = (Class)VFXNode;
      return -[VFXNode valueForKeyPath:](&v30, sel_valueForKeyPath_, a3);
    }
  }
  return result;
}

- (id)_valueForSimdVectorKeyPath:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  void *v44;
  uint64_t v45;

  v45 = 0;
  v44 = 0;
  sub_1B18BCE30(a3, (char *)&v45, (uint64_t *)&v44, v3);
  if (qword_1EEF65F18 != -1)
    dispatch_once(&qword_1EEF65F18, &unk_1E63D0E30);
  if (!v44 || !objc_msgSend_containsObject_((void *)qword_1EEF65F10, v5, (uint64_t)v44, v6))
    return 0;
  v43 = 0;
  v42 = 0;
  if (objc_msgSend_rawFloat3ForKey_value_(self, v7, v45, (uint64_t)&v42))
  {
    if (objc_msgSend_isEqualToString_(v44, v8, (uint64_t)CFSTR("x"), v9))
    {
      LODWORD(v13) = v42;
      return (id)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v10, v11, v12, v13);
    }
    if (objc_msgSend_isEqualToString_(v44, v10, (uint64_t)CFSTR("y"), v12))
    {
      LODWORD(v18) = HIDWORD(v42);
      return (id)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v15, v16, v17, v18);
    }
    if (objc_msgSend_isEqualToString_(v44, v15, (uint64_t)CFSTR("z"), v17))
    {
      LODWORD(v21) = v43;
      return (id)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v8, v19, v20, v21);
    }
  }
  v40 = 0;
  v41 = 0;
  if (!objc_msgSend_rawFloat4ForKey_value_(self, v8, v45, (uint64_t)&v40))
    return 0;
  if (objc_msgSend_isEqualToString_(v44, v22, (uint64_t)CFSTR("x"), v23))
  {
    LODWORD(v27) = v40;
    return (id)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v24, v25, v26, v27);
  }
  if (objc_msgSend_isEqualToString_(v44, v24, (uint64_t)CFSTR("y"), v26))
  {
    LODWORD(v31) = HIDWORD(v40);
    return (id)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v28, v29, v30, v31);
  }
  if (objc_msgSend_isEqualToString_(v44, v28, (uint64_t)CFSTR("z"), v30))
  {
    LODWORD(v35) = v41;
    return (id)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v32, v33, v34, v35);
  }
  if (!objc_msgSend_isEqualToString_(v44, v32, (uint64_t)CFSTR("w"), v34))
    return 0;
  LODWORD(v39) = HIDWORD(v41);
  return (id)objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v36, v37, v38, v39);
}

- (id)valueForUndefinedKey:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  const char *v35;
  uint64_t v36;
  id v37;
  void *v39;

  if ((*((_BYTE *)self + 48) & 1) == 0)
    goto LABEL_9;
  v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v15 = (void *)sub_1B193FCB0((uint64_t)self->_node, a3, v8, v9, v10, v11, v12, v13);
  v22 = v15;
  if (v15)
  {
    v23 = (double *)sub_1B191E41C((uint64_t)v15, (uint64_t)a2, v16, v17, v18, v19, v20, v21);
    v31 = (const char *)sub_1B191E464((uint64_t)v22, v24, v25, v26, v27, v28, v29, v30);
    v22 = (void *)sub_1B19BA16C(v23, v31, v34, v32, v33);
  }
  if (v14)
    sub_1B18797B4(v14, (uint64_t)a2, v16, v17, v18, v19, v20, v21);
  if (!v22)
  {
LABEL_9:
    v39 = 0;
    if (objc_msgSend_parseSpecialKey_withPath_intoDestination_(self, a2, (uint64_t)a3, (uint64_t)a3, &v39))
    {
      return v39;
    }
    else
    {
      os_unfair_lock_lock(&self->_valueForKeyLock);
      v37 = (id)objc_msgSend_objectForKey_(self->_valueForKey, v35, (uint64_t)a3, v36);
      os_unfair_lock_unlock(&self->_valueForKeyLock);
      if (v37)
        return v37;
      else
        return 0;
    }
  }
  return v22;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  __int16 *v7;
  const char *v8;
  uint64_t v9;
  NSMutableDictionary *valueForKey;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CFXNode *node;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  _QWORD v30[7];

  v7 = (__int16 *)sub_1B19BA44C(self, a4);
  os_unfair_lock_lock(&self->_valueForKeyLock);
  valueForKey = self->_valueForKey;
  if (a3)
  {
    if (!valueForKey)
    {
      valueForKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      self->_valueForKey = valueForKey;
    }
    objc_msgSend_setObject_forKey_(valueForKey, v8, (uint64_t)a3, (uint64_t)a4);
  }
  else
  {
    objc_msgSend_removeObjectForKey_(valueForKey, v8, (uint64_t)a4, v9);
  }
  os_unfair_lock_unlock(&self->_valueForKeyLock);
  v11 = sub_1B19BA44C(self, a4);
  v17 = (void *)v11;
  if (v7 && v11)
  {
    node = self->_node;
    sub_1B193FB20((uint64_t)node, a4, v7, v12, v13, v14, v15, v16);
    v21 = (void *)objc_msgSend_stringByAppendingString_(CFSTR("customProperty"), v19, (uint64_t)CFSTR("."), v20);
    v24 = objc_msgSend_stringByAppendingString_(v21, v22, (uint64_t)a4, v23);
    v28 = objc_msgSend_worldRef(self, v25, v26, v27);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1B1895A08;
    v30[3] = &unk_1E63D7EA8;
    v30[5] = v17;
    v30[6] = node;
    v30[4] = a4;
    objc_msgSend_postCommandWithContext_object_keyPath_applyBlock_(VFXTransaction, v29, v28, (uint64_t)self, v24, v30);
  }

}

- (void)__CFObject
{
  return self->_node;
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
    v22[2] = sub_1B1895BF8;
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
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;

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
    if (objc_msgSend_isPausedOrPausedByInheritance(self, v22, v23, v24))
      objc_msgSend__pauseAnimation_forKey_pausedByNode_(self, v25, 1, v9, 1);
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
  v12[2] = sub_1B1895DE8;
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
  v14[2] = sub_1B1895E94;
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
    v13[2] = sub_1B1895F50;
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
    v15[2] = sub_1B1896014;
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
    v29[2] = sub_1B18964F4;
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
  v14[2] = sub_1B1896620;
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
  v8[2] = sub_1B18966CC;
  v8[3] = &unk_1E63D5378;
  v8[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)_setParent:(id)a3
{
  self->_parent = (VFXNode *)a3;
}

- (unint64_t)countOfChildNodes
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_childNodes, a2, v2, v3);
}

- (id)objectInChildNodesAtIndex:(unint64_t)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_sync_enter(self);
  v7 = (void *)objc_msgSend_objectAtIndex_(self->_childNodes, v5, a3, v6);
  objc_sync_exit(self);
  return v7;
}

- (void)_reSyncModelTree
{
  uint64_t v2;
  uint64_t v3;
  __CFXNode *node;
  NSMutableArray *childNodes;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend_removeAllObjects(self->_childNodes, a2, v2, v3);
  node = self->_node;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_1B1896870;
  v19[3] = &unk_1E63D7E38;
  v19[4] = self;
  sub_1B1869628((uint64_t)node, (uint64_t)v19);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  childNodes = self->_childNodes;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(childNodes, v7, (uint64_t)&v15, (uint64_t)v20, 16);
  if (v8)
  {
    v12 = v8;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(childNodes);
        objc_msgSend__reSyncModelTree(*(void **)(*((_QWORD *)&v15 + 1) + 8 * v14++), v9, v10, v11);
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(childNodes, v9, (uint64_t)&v15, (uint64_t)v20, 16);
    }
    while (v12);
  }
}

- (BOOL)canAddChildNode:(id)a3
{
  uint64_t v3;
  BOOL i;

  for (i = self == 0; self; i = self == 0)
  {
    if (self == a3)
      break;
    self = (VFXNode *)objc_msgSend_parentNode(self, a2, (uint64_t)a3, v3);
  }
  return i;
}

- (void)addChildNode:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  objc_sync_enter(self);
  v8 = objc_msgSend_countOfChildNodes(self, v5, v6, v7);
  objc_msgSend_insertObject_inChildNodesAtIndex_(self, v9, (uint64_t)a3, v8);
  objc_sync_exit(self);
}

- (void)insertObject:(id)a3 inChildNodesAtIndex:(unint64_t)a4
{
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44[8];

  if (a3)
  {
    objc_sync_enter(self);
    if (!self->_childNodes)
      self->_childNodes = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if ((objc_msgSend_canAddChildNode_(self, v7, (uint64_t)a3, v8) & 1) != 0)
    {
      if ((VFXNode *)objc_msgSend_parentNode(a3, v9, v10, v11) != self)
      {
        v16 = a3;
        v20 = objc_msgSend_world(self, v17, v18, v19);
        if (v20 == objc_msgSend_world(a3, v21, v22, v23))
          objc_msgSend__removeFromParentNodeWithoutRemovingWorldReference(a3, v24, v25, v26);
        else
          objc_msgSend_removeFromParentNode(a3, v24, v25, v26);
        objc_msgSend__setParent_(a3, v27, (uint64_t)self, v28);
        v32 = objc_msgSend_world(self, v29, v30, v31);
        objc_msgSend_setWorld_(a3, v33, v32, v34);
        objc_msgSend_insertObject_atIndex_(self->_childNodes, v35, (uint64_t)a3, a4);
        if ((*((_BYTE *)a3 + 50) & 0x10) != 0)
          objc_msgSend__setHasFocusableChild(self, v36, v37, v38);
        if (a4)
          v39 = objc_msgSend_objectAtIndex_(self->_childNodes, v36, a4 - 1, v38);
        else
          v39 = 0;
        v40 = objc_msgSend_worldRef(self, v36, v37, v38);
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = (uint64_t)sub_1B1896B10;
        v44[3] = (uint64_t)&unk_1E63D7ED0;
        v44[4] = v39;
        v44[5] = (uint64_t)self;
        v44[6] = (uint64_t)a3;
        v44[7] = a4;
        objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v41, v40, (uint64_t)self, v44);
        if (*((char *)self + 48) < 0)
          objc_msgSend__setPausedOrPausedByInheritance_(a3, v42, 1, v43);

      }
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: attempt to add a parent node as a child node"), v10, v11, v12, v13, v14, v15, v44[0]);
    }
    objc_sync_exit(self);
  }
}

- (void)__removeObjectFromChildNodesAtIndex:(unint64_t)a3
{
  VFXNode *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
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
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];

  objc_sync_enter(self);
  v5 = self;
  if (objc_msgSend_count(self->_childNodes, v6, v7, v8) <= a3)
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: removeChildNodeAtIndex - index out of bounds"), v10, v11, v12, v13, v14, v15, v26);
  }
  else
  {
    v16 = (void *)objc_msgSend_objectAtIndex_(self->_childNodes, v9, a3, v11);
    v20 = objc_msgSend_worldRef(self, v17, v18, v19);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B1896CC8;
    v27[3] = &unk_1E63D5378;
    v27[4] = v16;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v21, v20, (uint64_t)self, v27);
    objc_msgSend__setParent_(v16, v22, 0, v23);
    objc_msgSend_removeObjectAtIndex_(self->_childNodes, v24, a3, v25);
  }
  objc_sync_exit(self);
}

- (void)removeObjectFromChildNodesAtIndex:(unint64_t)a3
{
  ((void (*)(VFXNode *, char *, unint64_t))MEMORY[0x1E0DE7D20])(self, sel___removeObjectFromChildNodesAtIndex_, a3);
}

- (void)replaceObjectInChildNodesAtIndex:(unint64_t)a3 withObject:(id)a4
{
  const char *v7;
  uint64_t v8;
  const char *v9;
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
  void *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  _QWORD v38[7];

  objc_sync_enter(self);
  if (a4)
  {
    if ((objc_msgSend_canAddChildNode_(self, v7, (uint64_t)a4, v8) & 1) != 0)
    {
      v22 = (void *)objc_msgSend_objectAtIndex_(self->_childNodes, v9, a3, v11);
      if (v22)
      {
        v23 = a4;
        objc_msgSend_removeFromParentNode(a4, v24, v25, v26);
        objc_msgSend__setParent_(v22, v27, 0, v28);
        objc_msgSend__setParent_(a4, v29, (uint64_t)self, v30);
        v34 = objc_msgSend_worldRef(self, v31, v32, v33);
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = sub_1B1896E50;
        v38[3] = &unk_1E63D5350;
        v38[4] = v22;
        v38[5] = a4;
        v38[6] = self;
        objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v35, v34, (uint64_t)self, v38);
        objc_msgSend_replaceObjectAtIndex_withObject_(self->_childNodes, v36, a3, (uint64_t)a4);

      }
      else
      {
        sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: error in replaceObjectInChildNodesAtIndex -> index out of bounds"), v16, v17, v18, v19, v20, v21, v37);
      }
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: circular reference found when trying to add %@ as a child node of %@"), v10, v11, v12, v13, v14, v15, (uint64_t)a4);
    }
  }
  else
  {
    objc_msgSend_removeObjectFromChildNodesAtIndex_(self, v7, a3, v8);
  }
  objc_sync_exit(self);
}

- (void)_removeFromParentNodeWithoutRemovingWorldReference
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  VFXNode *parent;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;

  if ((*((_BYTE *)self + 48) & 0xC0) == 0x80)
    objc_msgSend__setPausedOrPausedByInheritance_(self, a2, 0, v3);
  if ((*((_BYTE *)self + 50) & 0x10) != 0)
    objc_msgSend__updateFocusableCache(self->_parent, a2, v2, v3);
  objc_sync_enter(self);
  parent = self->_parent;
  if (parent)
  {
    objc_sync_enter(self->_parent);
    v12 = objc_msgSend_indexOfChildNode_(self->_parent, v9, (uint64_t)self, v10);
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: error in removeFromParentNode : inconsistent tree"), 0x7FFFFFFFFFFFFFFFLL, v13, v14, v15, v16, v17, v31);
    else
      objc_msgSend_removeObjectFromChildNodesAtIndex_(self->_parent, v11, v12, v13);
    objc_sync_exit(parent);
  }
  else
  {
    v18 = (void *)objc_msgSend_world(self, v5, v6, v7);
    if ((VFXNode *)objc_msgSend_rootNode(v18, v19, v20, v21) == self)
    {
      v25 = (void *)objc_msgSend_world(self, v22, v23, v24);
      v29 = objc_msgSend_node(VFXNode, v26, v27, v28);
      objc_msgSend_setRootNode_forLayer_(v25, v30, v29, 0);
    }
  }
  objc_sync_exit(self);
}

- (void)removeFromParentNode
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;

  objc_msgSend__removeFromParentNodeWithoutRemovingWorldReference(self, a2, v2, v3);
  objc_msgSend_setWorld_(self, v5, 0, v6);
}

- (unint64_t)indexOfChildNode:(id)a3
{
  uint64_t v3;
  NSMutableArray *childNodes;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  childNodes = self->_childNodes;
  v6 = objc_msgSend_count(childNodes, a2, (uint64_t)a3, v3);
  if (!v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  v9 = v6;
  v10 = 0;
  while ((id)objc_msgSend_objectAtIndex_(childNodes, v7, v10, v8) != a3)
  {
    if (v9 == ++v10)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v10;
}

- (void)removeAllChilds
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  v4 = (void *)objc_msgSend_childNodes(self, a2, v2, v3, 0);
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v6)
  {
    v10 = v6;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v4);
        objc_msgSend_removeFromParentNode(*(void **)(*((_QWORD *)&v13 + 1) + 8 * v12++), v7, v8, v9);
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

- (BOOL)hasAncestor:(id)a3
{
  uint64_t v3;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL i;

  v5 = (id)objc_msgSend_parentNode(self, a2, (uint64_t)a3, v3);
  for (i = v5 != 0; v5 != a3 && v5; i = v5 != 0)
    v5 = (id)objc_msgSend_parentNode(v5, v6, v7, v8);
  return i;
}

- (void)replaceChildNode:(id)a3 with:(id)a4
{
  uint64_t v6;

  v6 = objc_msgSend_indexOfChildNode_(self, a2, (uint64_t)a3, (uint64_t)a4);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    MEMORY[0x1E0DE7D20](self, sel_replaceObjectInChildNodesAtIndex_withObject_, v6, a4);
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

- (BOOL)getBoundingBoxMin:(VFXNode *)self max:(SEL)a2
{
  float32x4_t *v2;
  uint64_t v3;
  float32x4_t *v5;
  float32x4_t *v6;
  float32x4_t *v7;
  float32x4_t v8;
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
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  float32x4_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  float32x4_t v67;
  float32x4_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  _OWORD v77[4];
  float32x4_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  uint64_t v83;
  simd_float4x4 v84;
  simd_float4x4 v85;

  v83 = *MEMORY[0x1E0C80C00];
  if (!self->_node || *((char *)self + 49) < 0)
    return 0;
  v5 = (float32x4_t *)v3;
  v6 = v2;
  v76.i32[2] = 0;
  v76.i64[0] = 0;
  v75.i32[2] = 0;
  v75.i64[0] = 0;
  if ((*((_BYTE *)self + 48) & 1) != 0)
  {
    v9 = objc_msgSend_worldRef(self, a2, (uint64_t)v2, v3);
    if (v9)
    {
      v17 = v9;
      sub_1B187973C(v9, v10, v11, v12, v13, v14, v15, v16);
      v22 = sub_1B17C5C88(self->_node, 1, (uint64_t)&v76, (uint64_t)&v75, v18, v19, v20, v21);
      sub_1B18797B4(v17, v23, v24, v25, v26, v27, v28, v29);
      if (v22)
      {
LABEL_11:
        if (v6)
          *v6 = v76;
        if (!v5)
          return 1;
        v8 = v75;
        goto LABEL_15;
      }
    }
    else if ((sub_1B17C5C88(self->_node, 1, (uint64_t)&v76, (uint64_t)&v75, v13, v14, v15, v16) & 1) != 0)
    {
      goto LABEL_11;
    }
    return 0;
  }
  v74.i32[2] = 0;
  v74.i64[0] = 0;
  v73.i32[2] = 0;
  v73.i64[0] = 0;
  v7 = *(float32x4_t **)self->_fixedBoundingBoxExtrema;
  if (v7)
  {
    if (v2)
      *v2 = *v7;
    if (!v3)
      return 1;
    v8 = *(float32x4_t *)(*(_QWORD *)self->_fixedBoundingBoxExtrema + 16);
LABEL_15:
    *v5 = v8;
    return 1;
  }
  v31 = (void *)objc_msgSend_model(self, a2, (uint64_t)v2, v3);
  if (v31 && objc_msgSend_getBoundingBoxMin_max_(v31, v32, (uint64_t)v6, (uint64_t)v5))
  {
    if (v6)
      v76 = *v6;
    if (v5)
      v75 = *v5;
    v30 = 1;
  }
  else
  {
    v30 = 0;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v36 = (void *)objc_msgSend_childNodes(self, v32, v33, v34);
  v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v69, (uint64_t)v82, 16);
  if (v38)
  {
    v40 = v38;
    v41 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v70 != v41)
          objc_enumerationMutation(v36);
        v43 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        if (objc_msgSend_getBoundingBoxMin_max_(v43, v39, (uint64_t)&v74, (uint64_t)&v73))
        {
          v67 = v73;
          v68 = v74;
          v65 = 0u;
          v66 = 0u;
          v63 = 0u;
          v64 = 0u;
          objc_msgSend_pivot(v43, v39, v44, v45);
          v85 = __invert_f4(v84);
          v61 = (float32x4_t)v85.columns[1];
          v62 = (float32x4_t)v85.columns[0];
          v59 = (float32x4_t)v85.columns[3];
          v60 = (float32x4_t)v85.columns[2];
          objc_msgSend_transform(v43, v46, v47, v48);
          v49 = 0;
          v77[0] = v50;
          v77[1] = v51;
          v77[2] = v52;
          v77[3] = v53;
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          do
          {
            *(float32x4_t *)((char *)&v78 + v49 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v62, COERCE_FLOAT(v77[v49])), v61, *(float32x2_t *)&v77[v49], 1), v60, (float32x4_t)v77[v49], 2), v59, (float32x4_t)v77[v49], 3);
            ++v49;
          }
          while (v49 != 4);
          v63 = v78;
          v64 = v79;
          v65 = v80;
          v66 = v81;
          sub_1B18692C0(&v68, &v67, &v68, &v67, &v63);
          v54 = v68;
          if (v30)
          {
            v56 = v75;
            v55 = v76;
            v54.i32[3] = 0;
            v55.i32[3] = 0;
            v54 = vminnmq_f32(v54, v55);
            v57 = v67;
            v57.i32[3] = 0;
            v56.i32[3] = 0;
            v58 = vmaxnmq_f32(v57, v56);
          }
          else
          {
            v58 = v67;
          }
          v75 = v58;
          v76 = v54;
          v30 = 1;
        }
      }
      v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v69, (uint64_t)v82, 16);
    }
    while (v40);
  }
  if (v30)
  {
    if (v6)
      *v6 = v76;
    if (v5)
      *v5 = v75;
  }
  return v30;
}

- (void)setBoundingBoxMin:(VFXNode *)self max:(SEL)a2
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
  VFXNode *v25;
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
    v22[2] = sub_1B1897768;
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
    v26[2] = sub_1B1897754;
    v26[3] = &unk_1E63D5378;
    v26[4] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v17, v16, (uint64_t)self, v26);
  }
}

- (BOOL)getFrustum:(id *)a3 withViewport:
{
  uint64_t v3;
  __n128 v4;
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
  void *v17;
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
  uint64_t v28;
  _OWORD *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int8 *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  uint64_t v53;
  int32x4_t v54;
  int32x4_t v55;
  int32x4_t v56;
  int32x4_t v57;
  float32x4_t v58;
  float32x4_t v59;
  int32x4_t v60;
  unsigned __int32 v61;
  int32x4_t v62;
  float32x2_t v63;
  float32x2_t v64;
  float32x4_t v65;
  float32x2_t v66;
  float32x2_t v67;
  float32x4_t v68;
  float32x2_t v69;
  float32x2_t v70;
  float32x2_t v71;
  float32x2_t v72;
  float32x2_t v73;
  float32x2_t v74;
  float32x4_t v75;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  __n128 v80;
  float32x4_t v81;
  _OWORD v82[11];
  __n128 v83;
  simd_float4x4 v84;
  int32x4_t v85;
  int32x4_t v86;
  __int128 v87;
  __int128 v88;
  simd_float4x4 v89;
  simd_float4x4 v90;

  v80 = v4;
  v83 = v4;
  if (objc_msgSend_isPresentationObject(self, a2, (uint64_t)a3, v3))
  {
    v10 = objc_msgSend_nodeRef(self, v7, v8, v9);
    LOBYTE(v17) = sub_1B17B30D0(v10, (float32x4_t *)a3, v11, v12, v13, v14, v15, v16, v80);
  }
  else
  {
    v17 = (void *)objc_msgSend_camera(self, v7, v8, v9);
    if (v17)
    {
      v21 = objc_msgSend_cameraRef(v17, v18, v19, v20);
      v29 = (_OWORD *)sub_1B1866E38(v21, v22, v23, v24, v25, v26, v27, v28);
      v31 = v29[1];
      v30 = v29[2];
      v82[0] = *v29;
      v82[1] = v31;
      v82[2] = v30;
      v32 = v29[6];
      v34 = v29[3];
      v33 = v29[4];
      v82[5] = v29[5];
      v82[6] = v32;
      v82[3] = v34;
      v82[4] = v33;
      v35 = v29[10];
      v37 = v29[7];
      v36 = v29[8];
      v82[9] = v29[9];
      v82[10] = v35;
      v82[7] = v37;
      v82[8] = v36;
      v44 = sub_1B18667B4((unsigned __int8 *)v82, (uint64_t)&v83, v38, v39, v40, v41, v42, v43);
      v79 = *((float32x4_t *)v44 + 1);
      v81 = *(float32x4_t *)v44;
      v77 = *((float32x4_t *)v44 + 3);
      v78 = *((float32x4_t *)v44 + 2);
      objc_msgSend_worldTransform(self, v45, v46, v47);
      v90 = __invert_f4(v89);
      v53 = 0;
      v84 = v90;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v85 + v53 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, COERCE_FLOAT(*(_OWORD *)&v84.columns[v53])), v79, *(float32x2_t *)v84.columns[v53].f32, 1), v78, (float32x4_t)v84.columns[v53], 2), v77, (float32x4_t)v84.columns[v53], 3);
        ++v53;
      }
      while (v53 != 4);
      v48.f32[0] = *(float *)&v85.i32[3] - *(float *)v85.i32;
      v48.f32[1] = *(float *)&v86.i32[3] - *(float *)v86.i32;
      v48.f32[2] = *((float *)&v87 + 3) - *(float *)&v87;
      v54 = (int32x4_t)vmulq_f32(v48, v48);
      v48.f32[3] = *((float *)&v88 + 3) - *(float *)&v88;
      v49.f32[0] = *(float *)&v85.i32[3] + *(float *)v85.i32;
      v49.f32[1] = *(float *)&v86.i32[3] + *(float *)v86.i32;
      v49.f32[2] = *((float *)&v87 + 3) + *(float *)&v87;
      v55 = (int32x4_t)vmulq_f32(v49, v49);
      v49.f32[3] = *((float *)&v88 + 3) + *(float *)&v88;
      v50.f32[0] = *(float *)&v85.i32[3] + *(float *)&v85.i32[1];
      v50.f32[1] = *(float *)&v86.i32[3] + *(float *)&v86.i32[1];
      v50.f32[2] = *((float *)&v87 + 3) + *((float *)&v87 + 1);
      v56 = (int32x4_t)vmulq_f32(v50, v50);
      v50.f32[3] = *((float *)&v88 + 3) + *((float *)&v88 + 1);
      v51.f32[0] = *(float *)&v85.i32[3] - *(float *)&v85.i32[1];
      v51.f32[1] = *(float *)&v86.i32[3] - *(float *)&v86.i32[1];
      v51.f32[2] = *((float *)&v87 + 3) - *((float *)&v87 + 1);
      v57 = (int32x4_t)vmulq_f32(v51, v51);
      v51.f32[3] = *((float *)&v88 + 3) - *((float *)&v88 + 1);
      v52.f32[0] = *(float *)&v85.i32[3] - *(float *)&v85.i32[2];
      v52.f32[1] = *(float *)&v86.i32[3] - *(float *)&v86.i32[2];
      v52.f32[2] = *((float *)&v87 + 3) - *((float *)&v87 + 2);
      v58 = v52;
      v58.f32[3] = *((float *)&v88 + 3) - *((float *)&v88 + 2);
      v59 = (float32x4_t)vzip2q_s32(v85, v86);
      v59.i32[2] = DWORD2(v87);
      v60 = (int32x4_t)vmulq_f32(v59, v59);
      v59.i32[3] = DWORD2(v88);
      v61 = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v54, 2), vadd_f32(*(float32x2_t *)v54.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v54.i8, 1))).u32[0];
      v62 = (int32x4_t)vmulq_f32(v52, v52);
      v63 = vrsqrte_f32((float32x2_t)v61);
      v64 = vmul_f32(v63, vrsqrts_f32((float32x2_t)v61, vmul_f32(v63, v63)));
      v65 = vmulq_n_f32(v48, vmul_f32(v64, vrsqrts_f32((float32x2_t)v61, vmul_f32(v64, v64))).f32[0]);
      v64.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v55, 2), vadd_f32(*(float32x2_t *)v55.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v55.i8, 1))).u32[0];
      v66 = vrsqrte_f32((float32x2_t)v64.u32[0]);
      v67 = vmul_f32(v66, vrsqrts_f32((float32x2_t)v64.u32[0], vmul_f32(v66, v66)));
      v68 = vmulq_n_f32(v49, vmul_f32(v67, vrsqrts_f32((float32x2_t)v64.u32[0], vmul_f32(v67, v67))).f32[0]);
      v67.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v56, 2), vadd_f32(*(float32x2_t *)v56.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v56.i8, 1))).u32[0];
      v69 = vrsqrte_f32((float32x2_t)v67.u32[0]);
      v70 = vmul_f32(v69, vrsqrts_f32((float32x2_t)v67.u32[0], vmul_f32(v69, v69)));
      v67.i32[0] = vmul_f32(v70, vrsqrts_f32((float32x2_t)v67.u32[0], vmul_f32(v70, v70))).u32[0];
      v70.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v57, 2), vadd_f32(*(float32x2_t *)v57.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v57.i8, 1))).u32[0];
      v71 = vrsqrte_f32((float32x2_t)v70.u32[0]);
      v72 = vmul_f32(v71, vrsqrts_f32((float32x2_t)v70.u32[0], vmul_f32(v71, v71)));
      v70.i32[0] = vmul_f32(v72, vrsqrts_f32((float32x2_t)v70.u32[0], vmul_f32(v72, v72))).u32[0];
      v60.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v60, 2), vadd_f32(*(float32x2_t *)v60.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v60.i8, 1))).u32[0];
      v73 = vrsqrte_f32((float32x2_t)v60.u32[0]);
      v74 = vmul_f32(v73, vrsqrts_f32((float32x2_t)v60.u32[0], vmul_f32(v73, v73)));
      v75 = vmulq_n_f32(v59, vmul_f32(v74, vrsqrts_f32((float32x2_t)v60.u32[0], vmul_f32(v74, v74))).f32[0]);
      v60.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v62, 2), vadd_f32(*(float32x2_t *)v62.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v62.i8, 1))).u32[0];
      *(float32x2_t *)v62.i8 = vrsqrte_f32((float32x2_t)v60.u32[0]);
      *(float32x2_t *)v62.i8 = vmul_f32(*(float32x2_t *)v62.i8, vrsqrts_f32((float32x2_t)v60.u32[0], vmul_f32(*(float32x2_t *)v62.i8, *(float32x2_t *)v62.i8)));
      *(float32x4_t *)a3 = v65;
      *((float32x4_t *)a3 + 1) = v68;
      *((float32x4_t *)a3 + 2) = vmulq_n_f32(v50, v67.f32[0]);
      *((float32x4_t *)a3 + 3) = vmulq_n_f32(v51, v70.f32[0]);
      *((float32x4_t *)a3 + 4) = v75;
      *((float32x4_t *)a3 + 5) = vmulq_n_f32(v58, vmul_f32(*(float32x2_t *)v62.i8, vrsqrts_f32((float32x2_t)v60.u32[0], vmul_f32(*(float32x2_t *)v62.i8, *(float32x2_t *)v62.i8))).f32[0]);
      LOBYTE(v17) = 1;
    }
  }
  return (char)v17;
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

- (id)flattenedClone
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  VFXModel *v6;
  const char *v7;
  uint64_t v8;
  __CFXNode *node;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  _QWORD v16[6];

  v5 = (void *)objc_msgSend_copy(self, a2, v2, v3);
  v6 = objc_alloc_init(VFXModel);
  objc_msgSend_setModel_(v5, v7, (uint64_t)v6, v8);
  node = self->_node;
  v13 = objc_msgSend_worldRef(self, v10, v11, v12);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1B1897CA8;
  v16[3] = &unk_1E63D53C8;
  v16[4] = node;
  v16[5] = v5;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v14, v13, (uint64_t)v5, v16);
  return v5;
}

- (id)flattenedCopy
{
  uint64_t v2;
  uint64_t v3;

  return (id)objc_msgSend_flattenedClone(self, a2, v2, v3);
}

- (id)_subdividedCopyWithSubdivisionLevel:(int64_t)a3
{
  uint64_t v3;
  unsigned __int16 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float32x4_t *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a3;
  v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v14 = v6;
  if (v6)
    sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
  v15 = sub_1B186A984((uint64_t)self->_node, v4, v8, v9, v10, v11, v12, v13);
  v21 = (void *)objc_msgSend_nodeWithNodeRef_(VFXNode, v16, (uint64_t)v15, v17);
  if (v15)
    CFRelease(v15);
  if (objc_msgSend_skinner(v21, v18, v19, v20))
  {
    v25 = (void *)objc_msgSend_skinner(self, v22, v23, v24);
    v29 = objc_msgSend_skeleton(v25, v26, v27, v28);
    v33 = (void *)objc_msgSend_skinner(v21, v30, v31, v32);
    objc_msgSend_setSkeleton_(v33, v34, v29, v35);
  }
  objc_msgSend__copyAnimationsFrom_(v21, v22, (uint64_t)self, v24);
  if (v14)
    sub_1B18797B4(v14, v36, v37, v38, v39, v40, v41, v42);
  return v21;
}

- (void)_setPausedOrPausedByInheritance:(BOOL)a3
{
  uint64_t v3;
  unsigned int v4;
  _BOOL8 v5;
  char v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  BOOL v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = *((unsigned __int8 *)self + 48);
  if (a3 != v4 >> 7)
  {
    v5 = a3;
    v7 = a3 ? 0x80 : 0;
    *((_BYTE *)self + 48) = v7 & 0x80 | v4 & 0x7F;
    v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1B1897F54;
    v27[3] = &unk_1E63D5328;
    v27[4] = self;
    v28 = v5;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v27);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = (void *)objc_msgSend_childNodes(self, v10, v11, v12, 0);
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v23, (uint64_t)v29, 16);
    if (v15)
    {
      v19 = v15;
      v20 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v13);
          v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((objc_msgSend_isPaused(v22, v16, v17, v18) & 1) == 0)
            objc_msgSend__setPausedOrPausedByInheritance_(v22, v16, v5, v18);
        }
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v23, (uint64_t)v29, 16);
      }
      while (v19);
    }
  }
}

- (void)setPaused:(BOOL)a3
{
  uint64_t v3;
  char v4;
  _BOOL4 v5;
  char v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;

  v4 = *((_BYTE *)self + 48);
  if (((((v4 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    v5 = a3;
    if (a3)
      v7 = 64;
    else
      v7 = 0;
    *((_BYTE *)self + 48) = v4 & 0xBF | v7;
    v8 = (void *)objc_msgSend_parentNode(self, a2, a3, v3);
    v12 = objc_msgSend_isPausedOrPausedByInheritance(v8, v9, v10, v11) | v5;
    objc_msgSend__setPausedOrPausedByInheritance_(self, v13, v12, v14);
  }
}

- (BOOL)isPausedOrPausedByInheritance
{
  return *((unsigned __int8 *)self + 48) >> 7;
}

- (BOOL)isPaused
{
  return (*((unsigned __int8 *)self + 48) >> 6) & 1;
}

- (CGRect)_focusFrameInView:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  uint64_t i;
  __int128 v22;
  float64x2_t v23;
  uint64_t v24;
  double v25;
  float64x2_t v26;
  float64x2_t v27;
  double v28;
  double v29;
  double v30;
  float32x4_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[8];
  uint64_t v38;
  CGRect result;

  v38 = *MEMORY[0x1E0C80C00];
  DWORD2(v36) = 0;
  *(_QWORD *)&v36 = 0;
  DWORD2(v35) = 0;
  *(_QWORD *)&v35 = 0;
  if (objc_msgSend_getBoundingBoxMin_max_(self, a2, (uint64_t)&v36, (uint64_t)&v35))
  {
    v8 = v36;
    v9 = v36;
    DWORD1(v9) = DWORD1(v35);
    v37[0] = v36;
    v37[2] = v9;
    v10 = v35;
    DWORD2(v10) = DWORD2(v36);
    v11 = v35;
    DWORD1(v11) = DWORD1(v36);
    v12 = v35;
    LODWORD(v12) = v36;
    v13 = v36;
    LODWORD(v8) = v35;
    v37[1] = v8;
    DWORD2(v13) = DWORD2(v35);
    v37[3] = v10;
    v37[4] = v13;
    v37[5] = v11;
    v37[6] = v12;
    v37[7] = v35;
    objc_msgSend_worldTransform(self, v5, v6, v7);
    v33 = v18;
    v34 = v17;
    v31 = v20;
    v32 = v19;
    for (i = 0; i != 8; ++i)
    {
      objc_msgSend_projectPoint_(a3, v14, v15, v16, *(double *)vaddq_f32(v31, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v34, COERCE_FLOAT(v37[i])), v33, *(float32x2_t *)&v37[i], 1), v32, (float32x4_t)v37[i], 2)).i64, *(_OWORD *)&v31, *(_OWORD *)&v32, *(_OWORD *)&v33, *(_OWORD *)&v34);
      v37[i] = v22;
    }
    v23 = vcvtq_f64_f32(*(float32x2_t *)&v37[0]);
    v24 = 1;
    v25 = v23.f64[0];
    v26 = v23;
    do
    {
      v27 = vcvtq_f64_f32(*(float32x2_t *)&v37[v24]);
      v26 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v27, v26), (int8x16_t)v26, (int8x16_t)v27);
      if (v25 < v27.f64[0])
        v25 = v27.f64[0];
      ++v24;
    }
    while (v24 != 8);
    v28 = v25 - v26.f64[0];
    v29 = v26.f64[1];
    v30 = vsubq_f64(v23, v26).f64[1];
  }
  else
  {
    v26.f64[0] = 0.0;
    v29 = 0.0;
    v28 = 0.0;
    v30 = 0.0;
  }
  result.origin.x = v26.f64[0];
  result.size.height = v30;
  result.size.width = v28;
  result.origin.y = v29;
  return result;
}

- (void)_appendFocusableNodesInRect:(CGRect)a3 ofView:(id)a4 toFocusItems:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *childNodes;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  v28 = *MEMORY[0x1E0C80C00];
  if ((*((_BYTE *)self + 50) & 0x10) != 0)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    if (objc_msgSend_isFocusInteractionEnabled(self, a2, (uint64_t)a4, (uint64_t)a5))
    {
      if ((objc_msgSend__isEffectivelyHidden(self, v12, v13, v14) & 1) == 0)
      {
        objc_msgSend__focusFrameInView_(self, v12, (uint64_t)a4, v15);
        v30.origin.x = x;
        v30.origin.y = y;
        v30.size.width = width;
        v30.size.height = height;
        if (CGRectIntersectsRect(v29, v30))
          objc_msgSend_addObject_(a5, v12, (uint64_t)self, v16);
      }
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    childNodes = self->_childNodes;
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(childNodes, v12, (uint64_t)&v23, (uint64_t)v27, 16);
    if (v18)
    {
      v20 = v18;
      v21 = *(_QWORD *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v21)
            objc_enumerationMutation(childNodes);
          objc_msgSend__appendFocusableNodesInRect_ofView_toFocusItems_(*(void **)(*((_QWORD *)&v23 + 1) + 8 * v22++), v19, (uint64_t)a4, (uint64_t)a5, x, y, width, height);
        }
        while (v20 != v22);
        v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(childNodes, v19, (uint64_t)&v23, (uint64_t)v27, 16);
      }
      while (v20);
    }
  }
}

- (int64_t)focusBehavior
{
  return ((unint64_t)*((unsigned __int8 *)self + 50) >> 2) & 3;
}

- (void)_setHasFocusableChild
{
  uint64_t v2;
  uint64_t v3;

  if ((*((_BYTE *)self + 50) & 0x10) == 0)
  {
    *((_BYTE *)self + 50) |= 0x10u;
    objc_msgSend__setHasFocusableChild(self->_parent, a2, v2, v3);
  }
}

- (void)_updateFocusableCache
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = *((_BYTE *)self + 50);
  if ((v9 & 0x10) == 0)
  {
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. _updateFocusableCache - invoked on a non focusable node (waste of time)"), v2, v3, v4, v5, v6, v7, (uint64_t)"_isFocusableOrHasFocusableChild");
    v9 = *((_BYTE *)self + 50);
  }
  if ((v9 & 0xC) == 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v10 = (void *)objc_msgSend_childNodes(self, a2, v2, v3);
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v19, (uint64_t)v23, 16);
    if (v12)
    {
      v16 = v12;
      v17 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v10);
          if ((*(_BYTE *)(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i) + 50) & 0x10) != 0)
          {
            objc_msgSend__setHasFocusableChild(self, v13, v14, v15);
            return;
          }
        }
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v19, (uint64_t)v23, 16);
        if (v16)
          continue;
        break;
      }
    }
    *((_BYTE *)self + 50) &= ~0x10u;
    objc_msgSend__updateFocusableCache(self->_parent, v13, v14, v15);
  }
}

- (void)setFocusBehavior:(int64_t)a3
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v4 = *((unsigned __int8 *)self + 50);
  if (((v4 >> 2) & 3) != a3)
  {
    v5 = v4 & 0xF3 | (4 * (a3 & 3));
    *((_BYTE *)self + 50) = v5;
    if ((a3 & 3) != 0)
    {
      *((_BYTE *)self + 50) = v5 | 0x10;
      objc_msgSend__setHasFocusableChild(self->_parent, a2, a3, v3);
    }
    else
    {
      objc_msgSend__updateFocusableCache(self, a2, a3, v3);
    }
  }
}

- (BOOL)canBecomeFocused
{
  return (*((_BYTE *)self + 50) & 0xC) == 8;
}

- (BOOL)isFocusInteractionEnabled
{
  return (*((_BYTE *)self + 50) & 0xC) != 0;
}

- (BOOL)_isEffectivelyHidden
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
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  float v16;

  v5 = (void *)objc_msgSend_parentNode(self, a2, v2, v3);
  if ((objc_msgSend__isEffectivelyHidden(v5, v6, v7, v8) & 1) != 0
    || (objc_msgSend_isHidden(self, v9, v10, v11) & 1) != 0)
  {
    return 1;
  }
  objc_msgSend_opacity(self, v12, v13, v14);
  return v16 <= 0.00000011921;
}

- (NSArray)preferredFocusEnvironments
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  return (NSArray *)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v3, 1);
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  if (objc_msgSend_parentNode(self, a2, v2, v3))
    return (UIFocusEnvironment *)objc_msgSend_parentNode(self, v5, v6, v7);
  else
    return (UIFocusEnvironment *)objc_msgSend__currentVFXViewFocusEnvironment(VFXView, v5, v6, v7);
}

- (void)setNeedsFocusUpdate
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend_focusSystemForEnvironment_(MEMORY[0x1E0DC37E0], a2, (uint64_t)self, v2);
  MEMORY[0x1E0DE7D20](v4, sel_requestFocusUpdateToEnvironment_, self, v5);
}

- (void)updateFocusIfNeeded
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = objc_msgSend_focusSystemForEnvironment_(MEMORY[0x1E0DC37E0], a2, (uint64_t)self, v2);
  MEMORY[0x1E0DE7D20](v3, sel_updateFocusIfNeeded, v4, v5);
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (BOOL)_isEligibleForFocusInteraction
{
  uint64_t v2;
  uint64_t v3;

  if ((*((_BYTE *)self + 50) & 0x10) != 0)
    return objc_msgSend__isEffectivelyHidden(self, a2, v2, v3) ^ 1;
  else
    return 0;
}

- (CGRect)frame
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  v5 = (void *)objc_msgSend__currentVFXViewFocusEnvironment(VFXView, a2, v2, v3);
  v9 = (void *)objc_msgSend_focusItemContainer(self, v6, v7, v8);
  v13 = objc_msgSend_coordinateSpace(v9, v10, v11, v12);
  if (v13 != objc_msgSend_coordinateSpace(v5, v14, v15, v16))
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Coordinate space inconsistency"), v18, v19, v20, v21, v22, v23, (uint64_t)"self.focusItemContainer.coordinateSpace == focusEnvironmentView.coordinateSpace");
  objc_msgSend__focusFrameInView_(self, v17, (uint64_t)v5, v19);
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (UICoordinateSpace)coordinateSpace
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

  v4 = (void *)objc_msgSend__currentVFXViewFocusEnvironment(VFXView, a2, v2, v3);
  v8 = (void *)objc_msgSend_focusItemContainer(v4, v5, v6, v7);
  return (UICoordinateSpace *)objc_msgSend_coordinateSpace(v8, v9, v10, v11);
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSArray)constraints
{
  uint64_t v2;
  void *ComponentWithType;
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  ComponentWithType = (void *)objc_msgSend__findComponentWithType_(self, a2, 6, v2);
  return (NSArray *)(id)objc_msgSend_copy(ComponentWithType, v4, v5, v6);
}

- (void)setConstraints:(id)a3
{
  uint64_t v3;
  id ComponentWithType;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  _QWORD v14[6];

  ComponentWithType = (id)objc_msgSend__findComponentWithType_(self, a2, 6, v3);
  if (ComponentWithType != a3)
  {
    if (ComponentWithType)
      objc_msgSend__removeComponentWithType_(self, v7, 6, v9);
    if (a3)
    {
      v10 = (id)objc_msgSend_mutableCopy(a3, v7, v8, v9);
      objc_msgSend__assignComponent_toContainerWithType_(self, v11, (uint64_t)v10, 6);
    }
    v12 = objc_msgSend_worldRef(self, v7, v8, v9);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = sub_1B1898880;
    v14[3] = &unk_1E63D53C8;
    v14[4] = a3;
    v14[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v13, v12, (uint64_t)self, v14);
  }
}

- (VFXPhysicsBody)physicsBody
{
  uint64_t v2;

  return (VFXPhysicsBody *)objc_msgSend__findComponentWithType_(self, a2, 7, v2);
}

- (void)setPhysicsBody:(id)a3
{
  uint64_t v3;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  VFXNode *v57;

  v6 = (id)objc_msgSend_physicsBody(self, a2, (uint64_t)a3, v3);
  if (v6 != a3)
  {
    v10 = v6;
    if (v6)
    {
      if ((VFXNode *)objc_msgSend__owner(v6, v7, v8, v9) != self)
      {
        objc_msgSend__owner(v10, v11, v12, v13);
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: Physics body %@ 's owner (%@) should be %@"), v14, v15, v16, v17, v18, v19, (uint64_t)v10);
      }
      objc_msgSend__removeOwner(v10, v11, v12, v13);
      objc_msgSend__removeComponentWithType_(self, v20, 7, v21);
      objc_msgSend_transform(self, v22, v23, v24);
      v50 = v26;
      v51 = v25;
      v48 = v28;
      v49 = v27;
      v32 = objc_msgSend_worldRef(self, v29, v30, v31);
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = sub_1B1898B58;
      v52[3] = &unk_1E63D6A70;
      v57 = self;
      v53 = v51;
      v54 = v50;
      v55 = v49;
      v56 = v48;
      objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v33, v32, (uint64_t)self, CFSTR("transform"), v52);
    }
    if (a3)
    {
      if (objc_msgSend__owner(a3, v7, v8, v9))
      {
        objc_msgSend__owner(a3, v34, v35, v36);
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: Physics body %@ already has a owner: %@ that is not %@"), v37, v38, v39, v40, v41, v42, (uint64_t)a3);
      }
      objc_msgSend__assignComponent_toContainerWithType_(self, v34, (uint64_t)a3, 7);
      objc_msgSend__setOwner_(a3, v43, (uint64_t)self, v44);
      objc_msgSend_resetTransform(a3, v45, v46, v47);
    }
  }
}

- (VFXForceField)forceField
{
  uint64_t v2;
  VFXForceField *result;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  result = (VFXForceField *)objc_msgSend__findComponentWithType_(self, a2, 8, v2);
  if ((*((_BYTE *)self + 48) & 1) != 0)
    return (VFXForceField *)objc_msgSend_presentationObject(result, v5, v6, v7);
  return result;
}

- (void)setForceField:(id)a3
{
  uint64_t v3;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  _QWORD v12[6];

  if ((id)objc_msgSend_forceField(self, a2, (uint64_t)a3, v3) != a3)
  {
    objc_msgSend__setComponent_withType_(self, v6, (uint64_t)a3, 8);
    v10 = objc_msgSend_worldRef(self, v7, v8, v9);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1B1898C44;
    v12[3] = &unk_1E63D53C8;
    v12[4] = self;
    v12[5] = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
  }
}

- (id)_audioPlayers
{
  uint64_t v2;
  uint64_t v3;
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
  const __CFDictionary *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v13 = v5;
  if (v5)
    sub_1B187973C(v5, (uint64_t)v6, v7, v8, v9, v10, v11, v12);
  v14 = objc_msgSend_nodeRef(self, v6, v7, v8);
  if (!v14)
  {
    v26 = 0;
    if (!v13)
      return v26;
    goto LABEL_5;
  }
  v22 = sub_1B186D220(v14, v15, v16, v17, v18, v19, v20, v21);
  v26 = (id)objc_msgSend_copy(v22, v23, v24, v25);
  if (v13)
LABEL_5:
    sub_1B18797B4(v13, v15, v16, v17, v18, v19, v20, v21);
  return v26;
}

- (id)audioPlayers
{
  return (id)((uint64_t (*)(VFXNode *, char *))MEMORY[0x1E0DE7D20])(self, sel__audioPlayers);
}

- (void)addAudioPlayer:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  const char *v11;
  _QWORD v12[6];

  if (a3)
  {
    v10 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1B1898D7C;
    v12[3] = &unk_1E63D53C8;
    v12[4] = a3;
    v12[5] = self;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v11, v10, (uint64_t)self, v12);
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: attempt to add a null audio player on %@"), 0, v3, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (void)removeAllAudioPlayers
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  _QWORD v7[5];

  v5 = objc_msgSend_worldRef(self, a2, v2, v3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1B1898E44;
  v7[3] = &unk_1E63D5378;
  v7[4] = self;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v6, v5, (uint64_t)self, v7);
}

- (void)removeAudioPlayer:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  v6 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B1898EDC;
  v8[3] = &unk_1E63D53C8;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (unint64_t)countOfAudioPlayers
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_audioPlayers(self, a2, v2, v3);
  return objc_msgSend_count(v4, v5, v6, v7);
}

- (id)objectInAudioPlayersAtIndex:(unint64_t)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;

  v5 = (void *)objc_msgSend_audioPlayers(self, a2, a3, v3);
  return (id)objc_msgSend_objectAtIndex_(v5, v6, a3, v7);
}

- (void)insertObject:(id)a3 inAudioPlayersAtIndex:(unint64_t)a4
{
  uint64_t v7;
  const char *v8;
  _QWORD v9[7];

  v7 = objc_msgSend_worldRef(self, a2, (uint64_t)a3, a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1B1898FD0;
  v9[3] = &unk_1E63D7EA8;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = a4;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v8, v7, (uint64_t)self, v9);
}

- (void)removeObjectFromAudioPlayersAtIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  _QWORD v8[6];

  v6 = objc_msgSend_worldRef(self, a2, a3, v3);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1B1899078;
  v8[3] = &unk_1E63D5440;
  v8[4] = self;
  v8[5] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v7, v6, (uint64_t)self, v8);
}

- (void)replaceObjectInAudioPlayerAtIndex:(unint64_t)a3 withObject:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  const char *v12;
  _QWORD v13[7];

  if (!a4)
    sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), a3, 0, v4, v5, v6, v7, (uint64_t)"system");
  v11 = objc_msgSend_worldRef(self, a2, a3, (uint64_t)a4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1B1899150;
  v13[3] = &unk_1E63D7EA8;
  v13[4] = self;
  v13[5] = a4;
  v13[6] = a3;
  objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v12, v11, (uint64_t)self, v13);
}

- (void)_customEncodingOfVFXNode:(id)a3 usePresentationObject:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  char isKindOfClass;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  double *v100;
  uint64_t v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  __n128 v116;
  __n128 v117;
  __n128 v118;
  __n128 v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  const char *v133;
  uint64_t v134;
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
  uint64_t v145;
  int v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const char *v154;

  v4 = a4;
  if ((*((_BYTE *)self + 49) & 1) == 0)
    objc_msgSend__updateAffine(self, a2, (uint64_t)a3, a4);
  if ((*((_BYTE *)self + 50) & 0x40) != 0)
  {
    v7 = objc_msgSend_editorLocked(self, a2, (uint64_t)a3, a4);
    objc_msgSend_encodeBool_forKey_(a3, v8, v7, (uint64_t)CFSTR("locked"));
  }
  if ((objc_msgSend__isAReference(self, a2, (uint64_t)a3, a4) & 1) == 0)
  {
    if (objc_msgSend_light(self, v9, v10, v11))
    {
      v15 = (void *)objc_msgSend_light(self, v12, v13, v14);
      v18 = (uint64_t)v15;
      if (v4)
        v18 = objc_msgSend_presentationLight(v15, v16, (uint64_t)v15, v17);
      objc_msgSend_encodeObject_forKey_(a3, v16, v18, (uint64_t)CFSTR("light"));
    }
    if (objc_msgSend_model(self, v12, v13, v14))
    {
      v22 = (void *)objc_msgSend_model(self, v19, v20, v21);
      v25 = (uint64_t)v22;
      if (v4)
        v25 = objc_msgSend_presentationModel(v22, v23, (uint64_t)v22, v24);
      objc_msgSend_encodeObject_forKey_(a3, v23, v25, (uint64_t)CFSTR("model"));
    }
    if (objc_msgSend_camera(self, v19, v20, v21))
    {
      v29 = (void *)objc_msgSend_camera(self, v26, v27, v28);
      v32 = (uint64_t)v29;
      if (v4)
        v32 = objc_msgSend_presentationCamera(v29, v30, (uint64_t)v29, v31);
      objc_msgSend_encodeObject_forKey_(a3, v30, v32, (uint64_t)CFSTR("camera"));
    }
    if (objc_msgSend_skinner(self, v26, v27, v28))
    {
      v36 = objc_msgSend_skinner(self, v33, v34, v35);
      objc_msgSend_encodeObject_forKey_(a3, v37, v36, (uint64_t)CFSTR("skinner"));
    }
    if (objc_msgSend_morpher(self, v33, v34, v35))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if (a3
        && (isKindOfClass & 1) != 0
        && (v45 = (void *)objc_msgSend_options(a3, v42, v43, v44),
            v48 = (void *)objc_msgSend_objectForKeyedSubscript_(v45, v46, (uint64_t)CFSTR("VFXWorldExportCompressMorphTargets"), v47), objc_msgSend_BOOLValue(v48, v49, v50, v51))&& sub_1B191C0E8(a3, self, v43, v44))
      {
        objc_msgSend_setSkipMorphTargets_(a3, v42, 1, v44);
        v55 = objc_msgSend_morpher(self, v52, v53, v54);
        objc_msgSend_encodeObject_forKey_(a3, v56, v55, (uint64_t)CFSTR("morpher"));
        objc_msgSend_setSkipMorphTargets_(a3, v57, 0, v58);
      }
      else
      {
        v59 = objc_msgSend_morpher(self, v42, v43, v44);
        objc_msgSend_encodeObject_forKey_(a3, v60, v59, (uint64_t)CFSTR("morpher"));
      }
    }
    v61 = objc_msgSend_deformers(self, v38, v39, v40);
    if (v61)
      objc_msgSend_encodeObject_forKey_(a3, v62, v61, (uint64_t)CFSTR("deformers"));
    if (objc_msgSend_filters(self, v62, v63, v64))
    {
      v68 = objc_msgSend_filters(self, v65, v66, v67);
      objc_msgSend_encodeObject_forKey_(a3, v69, v68, (uint64_t)CFSTR("filters"));
    }
    if (objc_msgSend_constraints(self, v65, v66, v67))
    {
      v73 = objc_msgSend_constraints(self, v70, v71, v72);
      objc_msgSend_encodeObject_forKey_(a3, v74, v73, (uint64_t)CFSTR("constraints"));
    }
    if (objc_msgSend_physicsBody(self, v70, v71, v72))
    {
      v78 = objc_msgSend_physicsBody(self, v75, v76, v77);
      objc_msgSend_encodeObject_forKey_(a3, v79, v78, (uint64_t)CFSTR("physicsBody"));
    }
    if (objc_msgSend_forceField(self, v75, v76, v77))
    {
      v83 = objc_msgSend_forceField(self, v80, v81, v82);
      objc_msgSend_encodeObject_forKey_(a3, v84, v83, (uint64_t)CFSTR("forceField"));
    }
    if (objc_msgSend_behaviorGraph(self, v80, v81, v82))
    {
      v88 = objc_msgSend_behaviorGraph(self, v85, v86, v87);
      objc_msgSend_encodeObject_forKey_(a3, v89, v88, (uint64_t)CFSTR("behaviorGraph"));
    }
    if (objc_msgSend_particleEmitter(self, v85, v86, v87))
    {
      v93 = objc_msgSend_particleEmitter(self, v90, v91, v92);
      objc_msgSend_encodeObject_forKey_(a3, v94, v93, (uint64_t)CFSTR("emitter"));
    }
    if (objc_msgSend_particleCollider(self, v90, v91, v92))
    {
      v98 = objc_msgSend_particleCollider(self, v95, v96, v97);
      objc_msgSend_encodeObject_forKey_(a3, v99, v98, (uint64_t)CFSTR("collider"));
    }
    v100 = *(double **)self->_fixedBoundingBoxExtrema;
    if (v100)
    {
      v101 = objc_msgSend_valueWithVFXFloat3_(MEMORY[0x1E0CB3B18], v95, v96, v97, *v100);
      objc_msgSend_encodeObject_forKey_(a3, v102, v101, (uint64_t)CFSTR("fixedBoundingBoxExtrema[0]"));
      v106 = objc_msgSend_valueWithVFXFloat3_(MEMORY[0x1E0CB3B18], v103, v104, v105, *(double *)(*(_QWORD *)self->_fixedBoundingBoxExtrema + 16));
      objc_msgSend_encodeObject_forKey_(a3, v107, v106, (uint64_t)CFSTR("fixedBoundingBoxExtrema[1]"));
    }
    objc_msgSend_encodeBool_forKey_(a3, v95, (*((unsigned __int8 *)self + 48) >> 6) & 1, (uint64_t)CFSTR("paused"));
    v110 = (*((unsigned __int8 *)self + 50) >> 2) & 3;
    if ((_DWORD)v110)
      objc_msgSend_encodeInt_forKey_(a3, v108, v110, (uint64_t)CFSTR("focusBehavior"));
    if ((*((_BYTE *)self + 49) & 4) != 0)
    {
      v111 = self;
      if (v4)
        v111 = (void *)objc_msgSend_presentationNode(self, v108, v110, v109);
      v112 = (void *)objc_msgSend_valueForKey_(v111, v108, (uint64_t)CFSTR("kPivotKey"), v109);
      if (v112)
      {
        objc_msgSend_VFXMatrix4Value(v112, v113, v114, v115);
        sub_1B18BD294(a3, CFSTR("pivot"), v116, v117, v118, v119);
      }
    }
  }
  os_unfair_lock_lock(&self->_valueForKeyLock);
  if (objc_msgSend_count(self->_valueForKey, v120, v121, v122))
  {
    v126 = (void *)objc_msgSend_mutableCopy(self->_valueForKey, v123, v124, v125);
    objc_msgSend_removeObjectForKey_(v126, v127, (uint64_t)CFSTR("kPivotKey"), v128);
    if (objc_msgSend_count(v126, v129, v130, v131))
      objc_msgSend_encodeObject_forKey_(a3, v132, (uint64_t)v126, (uint64_t)CFSTR("clientAttributes"));

  }
  os_unfair_lock_unlock(&self->_valueForKeyLock);
  if (objc_msgSend__isAReference(self, v133, v134, v135)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v139 = (void *)objc_msgSend_options(a3, v136, v137, v138);
    v142 = (void *)objc_msgSend_objectForKeyedSubscript_(v139, v140, (uint64_t)CFSTR("VFXWorldExportEmbedReferences"), v141);
    v146 = objc_msgSend_BOOLValue(v142, v143, v144, v145);
  }
  else
  {
    v146 = 0;
  }
  if (objc_msgSend_childNodes(self, v136, v137, v138))
  {
    if ((objc_msgSend__isAReference(self, v147, v148, v149) ^ 1 | v146) == 1)
    {
      v153 = objc_msgSend_childNodes(self, v150, v151, v152);
      objc_msgSend_encodeObject_forKey_(a3, v154, v153, (uint64_t)CFSTR("childNodes"));
    }
  }
}

- (void)_customDecodingOfVFXNode:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  char v8;
  int v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  const char *v44;
  uint64_t v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  void *v109;
  VFXBehaviorGraph *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  id v117;
  const char *v118;
  uint64_t v119;
  VFXParticleEmitter *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  id v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t i;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  _BYTE v159[128];
  __int128 v160;
  __int128 v161;
  uint64_t v162;

  v162 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_containsValueForKey_(a3, a2, (uint64_t)CFSTR("paused"), v3))
  {
    if (objc_msgSend_decodeBoolForKey_(a3, v6, (uint64_t)CFSTR("paused"), v7))
      v8 = 64;
    else
      v8 = 0;
    *((_BYTE *)self + 48) = *((_BYTE *)self + 48) & 0xBF | v8;
  }
  v9 = objc_msgSend_decodeIntForKey_(a3, v6, (uint64_t)CFSTR("focusBehavior"), v7);
  objc_msgSend_setFocusBehavior_(self, v10, v9, v11);
  v14 = objc_msgSend_decodeBoolForKey_(a3, v12, (uint64_t)CFSTR("locked"), v13);
  objc_msgSend_setEditorLocked_(self, v15, v14, v16);
  *(_OWORD *)&self->_anon_40[2] = xmmword_1B2244DB0;
  *(_OWORD *)&self->_anon_40[18] = xmmword_1B2244DD0;
  *(_OWORD *)&self->_anon_40[34] = xmmword_1B2244D90;
  *(_OWORD *)&self->_anon_40[50] = xmmword_1B2244E20;
  *((_BYTE *)self + 49) |= 2u;
  *((_BYTE *)self + 48) |= 0x3Eu;
  if (objc_msgSend_containsValueForKey_(a3, v17, (uint64_t)CFSTR("fixedBoundingBoxExtrema[0]"), v18))
  {
    v19 = objc_opt_class();
    v21 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, (uint64_t)CFSTR("fixedBoundingBoxExtrema[0]"));
    objc_msgSend_VFXFloat3Value(v21, v22, v23, v24);
    v160 = v25;
    v26 = objc_opt_class();
    v28 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v27, v26, (uint64_t)CFSTR("fixedBoundingBoxExtrema[1]"));
    objc_msgSend_VFXFloat3Value(v28, v29, v30, v31);
    v161 = v32;
    objc_msgSend_setBoundingBoxMin_max_(self, v33, (uint64_t)&v160, (uint64_t)&v161);
  }
  v34 = objc_opt_class();
  v35 = objc_opt_class();
  objc_msgSend_vfx_decodeDictionaryWithKeysOfClass_objectsOfClass_forKey_(a3, v36, v34, v35, CFSTR("whatever"));
  v37 = sub_1B18BDC88();
  v39 = (void *)objc_msgSend_decodeObjectOfClasses_forKey_(a3, v38, v37, (uint64_t)CFSTR("clientAttributes"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = (id)objc_msgSend_mutableCopy(v39, v40, v41, v42);
    objc_msgSend__setAttributes_(self, v44, (uint64_t)v43, v45);
  }
  if (objc_msgSend_containsValueForKey_(a3, v40, (uint64_t)CFSTR("pivot"), v42))
  {
    *(_QWORD *)&v46 = sub_1B18BD380(a3, CFSTR("pivot")).n128_u64[0];
    objc_msgSend_setPivot_(self, v47, v48, v49, v46);
  }
  v50 = objc_opt_class();
  v52 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v51, v50, (uint64_t)CFSTR("light"));
  objc_msgSend_setLight_(self, v53, v52, v54);
  v55 = objc_opt_class();
  v57 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v56, v55, (uint64_t)CFSTR("model"));
  objc_msgSend_setModel_(self, v58, v57, v59);
  v60 = objc_opt_class();
  v62 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v61, v60, (uint64_t)CFSTR("camera"));
  objc_msgSend_setCamera_(self, v63, v62, v64);
  v65 = objc_opt_class();
  v67 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v66, v65, (uint64_t)CFSTR("skinner"));
  objc_msgSend_setSkinner_(self, v68, v67, v69);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v70 = sub_1B191C794(a3, self);
    objc_msgSend_setAllTargetsFromAnimCodec_(a3, v71, (uint64_t)v70, v72);
    v73 = objc_opt_class();
    v75 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v74, v73, (uint64_t)CFSTR("morpher"));
    objc_msgSend_setMorpher_(self, v76, v75, v77);
    objc_msgSend_setAllTargetsFromAnimCodec_(a3, v78, 0, v79);
  }
  else
  {
    v80 = objc_opt_class();
    v82 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v81, v80, (uint64_t)CFSTR("morpher"));
    objc_msgSend_setMorpher_(self, v83, v82, v84);
  }
  v85 = objc_opt_class();
  v87 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v86, v85, (uint64_t)CFSTR("deformers"));
  objc_msgSend_setDeformers_(self, v88, v87, v89);
  v90 = objc_opt_class();
  v92 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v91, v90, (uint64_t)CFSTR("filters"));
  objc_msgSend_setFilters_(self, v93, v92, v94);
  v95 = objc_opt_class();
  v97 = objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v96, v95, (uint64_t)CFSTR("constraints"));
  objc_msgSend_setConstraints_(self, v98, v97, v99);
  v100 = objc_opt_class();
  v102 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v101, v100, (uint64_t)CFSTR("forceField"));
  objc_msgSend_setForceField_(self, v103, v102, v104);
  if (objc_msgSend_containsValueForKey_(a3, v105, (uint64_t)CFSTR("effect"), v106))
  {
    v107 = objc_opt_class();
    v109 = (void *)objc_msgSend_decodeObjectOfClass_forKey_(a3, v108, v107, (uint64_t)CFSTR("effect"));
    v110 = [VFXBehaviorGraph alloc];
    v114 = objc_msgSend_tag(v109, v111, v112, v113);
    v117 = (id)objc_msgSend_initWithTag_(v110, v115, v114, v116);
    objc_msgSend_setBehaviorGraph_(self, v118, (uint64_t)v117, v119);
    v120 = [VFXParticleEmitter alloc];
    v124 = objc_msgSend_tag(v109, v121, v122, v123);
    v127 = (id)objc_msgSend_initWithTag_(v120, v125, v124, v126);
    objc_msgSend_setParticleEmitter_(self, v128, (uint64_t)v127, v129);
  }
  else
  {
    v130 = objc_opt_class();
    v132 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v131, v130, (uint64_t)CFSTR("behaviorGraph"));
    objc_msgSend_setBehaviorGraph_(self, v133, v132, v134);
    v135 = objc_opt_class();
    v137 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v136, v135, (uint64_t)CFSTR("emitter"));
    objc_msgSend_setParticleEmitter_(self, v138, v137, v139);
    v140 = objc_opt_class();
    v142 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v141, v140, (uint64_t)CFSTR("collider"));
    objc_msgSend_setParticleCollider_(self, v143, v142, v144);
  }
  v145 = objc_opt_class();
  v147 = (void *)objc_msgSend_vfx_decodeArrayOfObjectsOfClass_forKey_(a3, v146, v145, (uint64_t)CFSTR("childNodes"));
  v155 = 0u;
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(v147, v148, (uint64_t)&v155, (uint64_t)v159, 16);
  if (v149)
  {
    v152 = v149;
    v153 = *(_QWORD *)v156;
    do
    {
      for (i = 0; i != v152; ++i)
      {
        if (*(_QWORD *)v156 != v153)
          objc_enumerationMutation(v147);
        objc_msgSend_addChildNode_(self, v150, *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * i), v151);
      }
      v152 = objc_msgSend_countByEnumeratingWithState_objects_count_(v147, v150, (uint64_t)&v155, (uint64_t)v159, 16);
    }
    while (v152);
  }
}

- (void)_didDecodeVFXNode:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  VFXBehaviorGraph *v22;
  const char *v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;

  if (!objc_msgSend_behaviorGraph(self, a2, (uint64_t)a3, v3))
  {
    v8 = (void *)objc_msgSend_particleEmitter(self, v5, v6, v7);
    v15 = objc_msgSend_tag(v8, v9, v10, v11);
    if (v15
      || (v16 = (void *)objc_msgSend_particleCollider(self, v12, v13, v14),
          (v15 = objc_msgSend_tag(v16, v17, v18, v19)) != 0)
      || (v15 = objc_msgSend_valueForUndefinedKey_(self, v20, (uint64_t)CFSTR("_entityTagIdentifier"), v21)) != 0)
    {
      v22 = [VFXBehaviorGraph alloc];
      v25 = (id)objc_msgSend_initWithTag_(v22, v23, v15, v24);
      objc_msgSend_setBehaviorGraph_(self, v26, (uint64_t)v25, v27);
    }
  }
}

- (void)_encodeNodePropertiesWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  __n128 v9;
  const __CFString *v10;
  __n128 v11;
  double v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  const char *v17;
  NSString *name;
  const char *v19;
  const char *v20;

  sub_1B18BD1D8(a3, CFSTR("position"), *(__n128 *)&self->_position[2]);
  v8 = (*((unsigned __int8 *)self + 49) >> 5) & 3;
  switch(v8)
  {
    case 2:
      v9 = *(__n128 *)&self->_anon_90[2];
      v10 = CFSTR("orientation");
LABEL_7:
      sub_1B18BD23C(a3, (const char *)v10, v9);
      break;
    case 1:
      v9 = *(__n128 *)&self->_anon_90[2];
      v10 = CFSTR("rotation");
      goto LABEL_7;
    case 0:
      sub_1B18BD1D8(a3, CFSTR("eulerAngles"), *(__n128 *)&self->_anon_90[2]);
      break;
  }
  if ((*((_BYTE *)self + 49) & 0x60) != 0x20)
  {
    objc_msgSend_rotation(self, v5, v6, v7);
    sub_1B18BD23C(a3, CFSTR("rotation"), v11);
  }
  sub_1B18BD1D8(a3, CFSTR("scale"), *(__n128 *)&self->_scale[2]);
  *(float *)&v12 = self->_opacity;
  objc_msgSend_encodeFloat_forKey_(a3, v13, (uint64_t)CFSTR("opacity"), v14, v12);
  objc_msgSend_encodeInteger_forKey_(a3, v15, self->_categoryBitMask, (uint64_t)CFSTR("categoryBitMask"));
  objc_msgSend_encodeInteger_forKey_(a3, v16, self->_renderingOrder, (uint64_t)CFSTR("renderingOrder"));
  name = self->_name;
  if (name)
    objc_msgSend_encodeObject_forKey_(a3, v17, (uint64_t)name, (uint64_t)CFSTR("name"));
  objc_msgSend_encodeBool_forKey_(a3, v17, *((unsigned __int8 *)self + 49) >> 7, (uint64_t)CFSTR("hidden"));
  objc_msgSend_encodeBool_forKey_(a3, v19, *((_BYTE *)self + 50) & 1, (uint64_t)CFSTR("castsShadow"));
  objc_msgSend_encodeBool_forKey_(a3, v20, (*((unsigned __int8 *)self + 50) >> 1) & 1, (uint64_t)CFSTR("depthPrePass"));
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v8 = (void *)objc_msgSend_options(a3, v5, v6, v7),
        v11 = (void *)objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("VFXWorldExportPresentationTree"), v10), objc_msgSend_BOOLValue(v11, v12, v13, v14)))
  {
    v17 = (void *)objc_msgSend_presentationNode(self, v5, v15, v16);
    objc_msgSend__syncObjCModel(v17, v18, v19, v20);
    objc_msgSend__updateAffine(v17, v21, v22, v23);
    objc_msgSend__customEncodingOfVFXNode_usePresentationObject_(self, v24, (uint64_t)a3, 1);
    objc_msgSend__encodeNodePropertiesWithCoder_(v17, v25, (uint64_t)a3, v26);
    sub_1B18BD9B8(a3, self, v27, v28);
  }
  else
  {
    objc_msgSend__customEncodingOfVFXNode_usePresentationObject_(self, v5, (uint64_t)a3, 0);
    objc_msgSend__encodeNodePropertiesWithCoder_(self, v29, (uint64_t)a3, v30);
    sub_1B18BD9B8(a3, self, v31, v32);
    sub_1B18BDCC8(a3, self, v33, v34);
  }
}

- (VFXNode)initWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  VFXNode *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
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
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  objc_super v92;

  v92.receiver = self;
  v92.super_class = (Class)VFXNode;
  v7 = -[VFXNode init](&v92, sel_init);
  if (v7)
  {
    v8 = objc_msgSend_immediateMode(VFXTransaction, v4, v5, v6);
    objc_msgSend_setImmediateMode_(VFXTransaction, v9, 1, v10);
    v11 = sub_1B186A0A0();
    v7->_node = (__CFXNode *)v11;
    if (v11)
      sub_1B193E768(v11, v7, v13, v14, v15, v16, v17, v18);
    v7->_valueForKeyLock._os_unfair_lock_opaque = 0;
    objc_msgSend__syncObjCModel(v7, v12, v13, v14);
    v19 = objc_opt_class();
    v21 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v20, v19, (uint64_t)CFSTR("name"));
    objc_msgSend_setName_(v7, v22, v21, v23);
    objc_msgSend__customDecodingOfVFXNode_(v7, v24, (uint64_t)a3, v25);
    v26 = sub_1B18BD300(a3, CFSTR("position"));
    objc_msgSend_setPosition_(v7, v27, v28, v29, v26);
    if (objc_msgSend_containsValueForKey_(a3, v30, (uint64_t)CFSTR("orientation"), v31))
    {
      *(_QWORD *)&v34 = sub_1B18BD344(a3, CFSTR("orientation")).n128_u64[0];
      objc_msgSend_setOrientation_(v7, v35, v36, v37, v34);
    }
    else if (objc_msgSend_containsValueForKey_(a3, v32, (uint64_t)CFSTR("eulerAngles"), v33))
    {
      v38 = sub_1B18BD300(a3, CFSTR("eulerAngles"));
      objc_msgSend_setEulerAngles_(v7, v39, v40, v41, v38);
    }
    else
    {
      *(_QWORD *)&v42 = sub_1B18BD344(a3, CFSTR("rotation")).n128_u64[0];
      objc_msgSend_setRotation_(v7, v43, v44, v45, v42);
    }
    v46 = sub_1B18BD300(a3, CFSTR("scale"));
    objc_msgSend_setScale_(v7, v47, v48, v49, v46);
    objc_msgSend_decodeFloatForKey_(a3, v50, (uint64_t)CFSTR("opacity"), v51);
    objc_msgSend_setOpacity_(v7, v52, v53, v54);
    v57 = objc_msgSend_decodeIntegerForKey_(a3, v55, (uint64_t)CFSTR("categoryBitMask"), v56);
    objc_msgSend_setCategoryBitMask_(v7, v58, v57, v59);
    v62 = objc_msgSend_decodeIntegerForKey_(a3, v60, (uint64_t)CFSTR("renderingOrder"), v61);
    objc_msgSend_setRenderingOrder_(v7, v63, v62, v64);
    v67 = objc_msgSend_decodeBoolForKey_(a3, v65, (uint64_t)CFSTR("hidden"), v66);
    objc_msgSend_setHidden_(v7, v68, v67, v69);
    v72 = objc_msgSend_decodeBoolForKey_(a3, v70, (uint64_t)CFSTR("castsShadow"), v71);
    objc_msgSend_setCastsShadow_(v7, v73, v72, v74);
    if (objc_msgSend_containsValueForKey_(a3, v75, (uint64_t)CFSTR("depthPrePass"), v76))
    {
      v79 = objc_msgSend_decodeBoolForKey_(a3, v77, (uint64_t)CFSTR("depthPrePass"), v78);
      objc_msgSend_setUsesDepthPrePass_(v7, v80, v79, v81);
    }
    v82 = objc_opt_class();
    v84 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v83, v82, (uint64_t)CFSTR("physicsBody"));
    objc_msgSend_setPhysicsBody_(v7, v85, v84, v86);
    v7->_animationsLock._os_unfair_lock_opaque = 0;
    sub_1B18BDA00(a3, v7);
    sub_1B18BDFA4(a3, v7);
    objc_msgSend__didDecodeVFXNode_(v7, v87, (uint64_t)a3, v88);
    objc_msgSend_setImmediateMode_(VFXTransaction, v89, v8, v90);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isAuthoring
{
  return (*((unsigned __int8 *)self + 50) >> 5) & 1;
}

- (void)setIsAuthoring:(BOOL)a3
{
  uint64_t v3;
  char v4;

  if (a3)
    v4 = 32;
  else
    v4 = 0;
  *((_BYTE *)self + 50) = *((_BYTE *)self + 50) & 0xDF | v4;
  if (a3)
    objc_msgSend_setCastsShadow_(self, a2, 0, v3);
}

- (BOOL)editorLocked
{
  return (*((unsigned __int8 *)self + 50) >> 6) & 1;
}

- (void)setEditorLocked:(BOOL)a3
{
  uint64_t v3;
  char v4;
  char v7;
  uint64_t v8;
  const char *v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = *((_BYTE *)self + 50);
  if (((((v4 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v7 = 64;
    else
      v7 = 0;
    *((_BYTE *)self + 50) = v4 & 0xBF | v7;
    v8 = objc_msgSend_worldRef(self, a2, a3, v3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = sub_1B189A2FC;
    v10[3] = &unk_1E63D5328;
    v10[4] = self;
    v11 = a3;
    objc_msgSend_postCommandWithContext_object_applyBlock_(VFXTransaction, v9, v8, (uint64_t)self, v10);
  }
}

- (id)authoringTargetNode
{
  return objc_getAssociatedObject(self, &unk_1EEF65F20);
}

- (void)setAuthoringTargetNode:(id)a3
{
  objc_setAssociatedObject(self, &unk_1EEF65F20, a3, 0);
}

- (BOOL)getBoundingSphereCenter:(VFXNode *)self radius:(SEL)a2
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  float32x4_t *v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  int BoundingSphereCenter_radius;
  char v12;
  float32x4_t v13;
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
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  float32x4_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  float32x4_t v55;
  __n128 v56;
  float32x4_t v57;
  float32x4_t v58;
  _DWORD *v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  float32x4_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int32 v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  simd_float4x4 v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  __int128 v81;
  _BYTE v82[128];
  uint64_t v83;
  simd_float4x4 v84;
  simd_float4x4 v85;

  v83 = *MEMORY[0x1E0C80C00];
  if (self->_node)
  {
    v4 = (_DWORD *)v3;
    v5 = (float32x4_t *)v2;
    v76 = 0uLL;
    if ((*((_BYTE *)self + 48) & 1) != 0)
    {
      v14 = objc_msgSend_worldRef(self, a2, v2, v3);
      v22 = v14;
      if (v14)
        sub_1B187973C(v14, v15, v16, v17, v18, v19, v20, v21);
      v12 = sub_1B17C5D30(self->_node, 1, (uint64_t)&v76, v17, v18, v19, v20, v21);
      if (v5)
        *v5 = v76;
      if (v4)
        *v4 = v76.i32[3];
      if (v22)
        sub_1B18797B4(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    else
    {
      v60 = (_DWORD *)v3;
      v75 = 0uLL;
      v7 = (void *)objc_msgSend_model(self, a2, v2, v3);
      v74.i32[2] = 0;
      v74.i64[0] = 0;
      v73 = 0;
      if (v7)
      {
        v78.i32[2] = 0;
        v78.i64[0] = 0;
        v77.columns[0].i32[0] = 0;
        BoundingSphereCenter_radius = objc_msgSend_getBoundingSphereCenter_radius_(v7, v8, (uint64_t)&v78, (uint64_t)&v77);
        v12 = BoundingSphereCenter_radius;
        if (BoundingSphereCenter_radius)
        {
          v13 = v78;
          v13.i32[3] = v77.columns[0].i32[0];
          v76 = v13;
        }
      }
      else
      {
        v12 = 0;
      }
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v30 = (void *)objc_msgSend_childNodes(self, v8, v9, v10);
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v69, (uint64_t)v82, 16);
      if (v32)
      {
        v34 = v32;
        v35 = *(_QWORD *)v70;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v70 != v35)
              objc_enumerationMutation(v30);
            v37 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
            v38 = objc_msgSend_getBoundingSphereCenter_radius_(v37, v33, (uint64_t)&v74, (uint64_t)&v73);
            v41 = v74;
            v41.i32[3] = v73;
            v75 = v41;
            if (v38)
            {
              v67 = 0u;
              v68 = 0u;
              v65 = 0u;
              v66 = 0u;
              objc_msgSend_transform(v37, v33, v39, v40);
              v63 = v43;
              v64 = v42;
              v61 = v45;
              v62 = v44;
              objc_msgSend_pivot(v37, v46, v47, v48);
              v85 = __invert_f4(v84);
              v54 = 0;
              v77 = v85;
              v78 = 0u;
              v79 = 0u;
              v80 = 0u;
              v81 = 0u;
              do
              {
                *(float32x4_t *)((char *)&v78 + v54 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v64, COERCE_FLOAT(*(_OWORD *)&v77.columns[v54])), v63, *(float32x2_t *)v77.columns[v54].f32, 1), v62, (float32x4_t)v77.columns[v54], 2), v61, (float32x4_t)v77.columns[v54], 3);
                ++v54;
              }
              while (v54 != 4);
              v65 = v78;
              v66 = v79;
              v67 = v80;
              v68 = v81;
              v55 = vmulq_f32(v65, v65);
              v56 = (__n128)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v55, 2), vaddq_f32(v55, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v55.f32, 1)));
              v57 = vmulq_f32(v66, v66);
              v56.n128_f32[0] = sqrtf(v56.n128_f32[0]);
              v58 = vmulq_f32(v67, v67);
              v56.n128_u32[1] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v57, 2), vaddq_f32(v57, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v57.f32, 1))).f32[0]);
              v56.n128_u32[2] = sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v58, 2), vaddq_f32(v58, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v58.f32, 1))).f32[0]);
              sub_1B17ADCE8(&v75, &v65, (uint64_t)&v75, v49, v50, v51, v52, v53, v56);
              if ((v12 & 1) != 0)
                sub_1B17D43E4(&v76, &v75, &v76);
              else
                v76 = v75;
              v12 = 1;
            }
          }
          v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v69, (uint64_t)v82, 16);
        }
        while (v34);
      }
      if ((v12 & 1) != 0)
      {
        if (v5)
          *v5 = v76;
        if (v60)
          *v60 = v76.i32[3];
      }
    }
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

- (double)pivot
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 *v15;
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
  uint64_t v26;
  uint64_t v28;

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    v14 = v6;
    if (v6)
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
    v15 = (__int128 *)sub_1B186A358(*(_QWORD *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13);
    if (v15)
    {
      v5 = *v15;
      if (!v14)
        return *(double *)&v5;
    }
    else
    {
      *(_QWORD *)&v5 = 1065353216;
      if (!v14)
        return *(double *)&v5;
    }
    v28 = v5;
    sub_1B18797B4(v14, v16, v17, v18, v19, v20, v21, v22);
    *(_QWORD *)&v5 = v28;
    return *(double *)&v5;
  }
  if ((*(_BYTE *)(a1 + 49) & 4) != 0)
  {
    v23 = (void *)objc_msgSend_valueForKey_((void *)a1, a2, (uint64_t)CFSTR("kPivotKey"), a4);
    if (v23)
      objc_msgSend_VFXMatrix4Value(v23, v24, v25, v26);
    else
      *(_QWORD *)&v5 = 1065353216;
  }
  else
  {
    *(_QWORD *)&v5 = 1065353216;
  }
  return *(double *)&v5;
}

- (BOOL)hasPhysicBody
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  if ((*((_BYTE *)self + 48) & 1) != 0)
    LOBYTE(v8) = sub_1B186DB64((uint64_t)self->_node, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  else
    return (*((unsigned __int16 *)self + 26) >> 7) & 1;
  return v8;
}

- (void)setPivot:(float32x4_t)a3
{
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  float32x4_t v20;
  int v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *ComponentWithType;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v42[6];
  _QWORD v43[4];
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;

  v9 = (void *)objc_msgSend_valueForKey_(a1, a2, (uint64_t)CFSTR("kPivotKey"), a8);
  if (v9)
  {
    objc_msgSend_VFXMatrix4Value(v9, v10, v11, v12);
  }
  else
  {
    v15 = (float32x4_t)xmmword_1B2247050;
    v16 = (float32x4_t)unk_1B2247060;
    v13 = (float32x4_t)xmmword_1B2247030;
    v14 = (float32x4_t)unk_1B2247040;
  }
  if ((vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(v13, a3), (int8x16_t)vceqq_f32(v14, a4)), vandq_s8((int8x16_t)vceqq_f32(v15, a5), (int8x16_t)vceqq_f32(v16, a6)))) & 0x80000000) == 0)
  {
    objc_msgSend_willChangeValueForKey_(a1, v10, (uint64_t)CFSTR("pivot"), v12);
    v20 = (float32x4_t)vdupq_n_s32(0x3727C5ACu);
    v21 = vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vcgeq_f32(v20, vabdq_f32(a4, *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16))), (int8x16_t)vcgeq_f32(v20, vabdq_f32(a3, *MEMORY[0x1E0C83FF0]))), vandq_s8((int8x16_t)vcgeq_f32(v20, vabdq_f32(a5, *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32))), (int8x16_t)vcgeq_f32(v20, vabdq_f32(a6, *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48))))));
    a1[49] = (a1[49] & 0xFB | (4 * (v21 < 0))) ^ 4;
    if (v21 < 0)
    {
      objc_msgSend_setValue_forKey_(a1, v17, 0, (uint64_t)CFSTR("kPivotKey"));
    }
    else
    {
      v22 = objc_msgSend_valueWithVFXMatrix4_(MEMORY[0x1E0CB3B18], v17, v18, v19);
      objc_msgSend_setValue_forKey_(a1, v23, v22, (uint64_t)CFSTR("kPivotKey"));
    }
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x6010000000;
    v43[3] = "";
    v44 = a3;
    v45 = a4;
    v46 = a5;
    v47 = a6;
    v27 = objc_msgSend_worldRef(a1, v24, v25, v26);
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = sub_1B189A9B0;
    v42[3] = &unk_1E63D7F20;
    v42[4] = a1;
    v42[5] = v43;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v28, v27, (uint64_t)a1, CFSTR("pivot"), v42);
    if (objc_msgSend_hasPhysicBody(a1, v29, v30, v31))
    {
      ComponentWithType = (void *)objc_msgSend__findComponentWithType_(a1, v32, 7, v33);
      objc_msgSend_resetTransform(ComponentWithType, v35, v36, v37);
    }
    objc_msgSend_didChangeValueForKey_(a1, v32, (uint64_t)CFSTR("pivot"), v33);
    _Block_object_dispose(v43, 8);
  }
}

- (double)transform
{
  __int128 v5;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v30;

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v30 = sub_1B18697A0(*(_QWORD *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21);
      sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(double *)&v5 = v30;
    }
    else
    {
      *(double *)&v5 = sub_1B18697A0(*(_QWORD *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    if ((*(_BYTE *)(a1 + 49) & 2) == 0)
      objc_msgSend__updateTransform((void *)a1, a2, a3, a4);
    v5 = *(_OWORD *)(a1 + 64);
  }
  return *(double *)&v5;
}

- (float32x4_t)setTransform:(uint64_t)a3
{
  float32x4_t *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint32x4_t v16;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  float32x4_t v28;
  __n128 v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *ComponentWithType;
  const char *v36;
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
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  float32x4_t v55;
  float32x4_t v59;
  float32x4_t v60;
  __n128 v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;
  __n128 v65;

  v8 = result;
  v62 = a5;
  v63 = a6;
  v64 = a7;
  v65 = a8;
  if ((result[3].i8[0] & 1) != 0)
  {
    v39 = objc_msgSend_worldRef(result, a2, a3, a4);
    if (v39)
    {
      v47 = v39;
      sub_1B187973C(v39, v40, v41, v42, v43, v44, v45, v46);
      sub_1B186BC48(v8->i64[1], (uint64_t)&v62);
      return (float32x4_t *)sub_1B18797B4(v47, v48, v49, v50, v51, v52, v53, v54);
    }
    else
    {
      return (float32x4_t *)sub_1B186BC48(v8->i64[1], (uint64_t)&v62);
    }
  }
  else if ((result[3].i8[1] & 2) == 0
         || (vminvq_u32((uint32x4_t)vandq_s8(vandq_s8((int8x16_t)vceqq_f32(a6, result[5]), (int8x16_t)vceqq_f32(a5, result[4])), vandq_s8((int8x16_t)vceqq_f32(a7, result[6]), (int8x16_t)vceqq_f32((float32x4_t)a8, result[7])))) & 0x80000000) == 0)
  {
    v55.i64[1] = a5.i64[1];
    objc_msgSend_willChangeValueForKey_(result, a2, (uint64_t)CFSTR("transform"), a4, a5.i64[0]);
    v61.n128_u32[2] = 0;
    v61.n128_u64[0] = 0;
    v60.i32[2] = 0;
    v60.i64[0] = 0;
    v59 = 0uLL;
    sub_1B18927E4(&v59, &v61, &v60, v55, a6, a7, a8);
    if ((vmaxvq_u32((uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v59), (int8x16_t)vcgezq_f32(v59)))) & 0x80000000) != 0)
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: node::setTransform - invalid matrix"), v10, v11, v12, v13, v14, v15, v55.i64[0]);
      v59 = (float32x4_t)xmmword_1B2244E20;
    }
    v16 = (uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32(v60), (int8x16_t)vcgezq_f32(v60)));
    v16.i32[3] = v16.i32[2];
    if ((vmaxvq_u32(v16) & 0x80000000) != 0)
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: node::setTransform - invalid matrix (nan in scale)"), v10, v11, v12, v13, v14, v15, v55.i64[0]);
      __asm { FMOV            V0.4S, #1.0 }
      v60 = _Q0;
    }
    objc_msgSend__setPosition_(v8, v9, v10, v11, v61.n128_f64[0]);
    objc_msgSend__setQuaternion_(v8, v22, v23, v24, *(double *)v59.i64);
    objc_msgSend__setScale_(v8, v25, v26, v27, *(double *)v60.i64);
    v28 = v63;
    v8[4] = v62;
    v8[5] = v28;
    v29 = v65;
    v8[6] = v64;
    v8[7] = (float32x4_t)v29;
    v8[3].i8[1] |= 2u;
    if (objc_msgSend_hasPhysicBody(v8, v30, v31, v32))
    {
      ComponentWithType = (void *)objc_msgSend__findComponentWithType_(v8, v33, 7, v34);
      objc_msgSend_resetTransform(ComponentWithType, v36, v37, v38);
    }
    return (float32x4_t *)objc_msgSend_didChangeValueForKey_(v8, v33, (uint64_t)CFSTR("transform"), v34);
  }
  return result;
}

- (double)position
{
  __int128 v5;
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
  double v23;

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v23 = sub_1B186B9C0(*(__n128 **)(a1 + 8));
      sub_1B18797B4(v14, v15, v16, v17, v18, v19, v20, v21);
      *(double *)&v5 = v23;
    }
    else
    {
      *(double *)&v5 = sub_1B186B9C0(*(__n128 **)(a1 + 8));
    }
  }
  else
  {
    if ((*(_BYTE *)(a1 + 49) & 1) == 0)
      objc_msgSend__updateAffine((void *)a1, a2, a3, a4);
    v5 = *(_OWORD *)(a1 + 128);
  }
  return *(double *)&v5;
}

- (void)setPosition:(VFXNode *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *ComponentWithType;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float32x4_t v31;

  if ((*((_BYTE *)self + 48) & 1) != 0)
  {
    v31 = v4;
    v15 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v15)
    {
      v23 = v15;
      sub_1B187973C(v15, v16, v17, v18, v19, v20, v21, v22);
      sub_1B186B9C8((__n128 *)self->_node, v31);
      sub_1B18797B4(v23, v24, v25, v26, v27, v28, v29, v30);
    }
    else
    {
      sub_1B186B9C8((__n128 *)self->_node, v31);
    }
  }
  else
  {
    objc_msgSend__setPosition_(self, a2, v2, v3);
    if (objc_msgSend_hasPhysicBody(self, v6, v7, v8))
    {
      ComponentWithType = (void *)objc_msgSend__findComponentWithType_(self, v9, 7, v10);
      objc_msgSend_resetTransform(ComponentWithType, v12, v13, v14);
    }
  }
}

- (double)rotation
{
  unsigned int v5;
  int v6;
  __int128 v7;
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
  uint64_t v30;
  uint64_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float v34;
  float32x2_t v35;
  float32x2_t v36;
  uint64_t v38;
  unint64_t v39;
  float32x4_t v40;
  float32x4_t v41;

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v8 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v8)
    {
      v16 = v8;
      sub_1B187973C(v8, v9, v10, v11, v12, v13, v14, v15);
      sub_1B186BB78(*(float32x4_t **)(a1 + 8), v17, v18, v19, v20, v21, v22, v23);
      v38 = v24;
      sub_1B18797B4(v16, v25, v26, v27, v28, v29, v30, v31);
      *(_QWORD *)&v7 = v38;
    }
    else
    {
      sub_1B186BB78(*(float32x4_t **)(a1 + 8), v9, v10, v11, v12, v13, v14, v15);
    }
  }
  else
  {
    v5 = *(unsigned __int8 *)(a1 + 49);
    if ((v5 & 1) == 0)
    {
      objc_msgSend__updateAffine((void *)a1, a2, a3, a4);
      v5 = *(unsigned __int8 *)(a1 + 49);
    }
    v6 = (v5 >> 5) & 3;
    if (v6)
    {
      if (v6 == 2)
      {
        v32 = *(float32x4_t *)(a1 + 144);
        v33 = vmulq_f32(v32, v32);
        LODWORD(v34) = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v33, 2), vaddq_f32(v33, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 1))).u32[0];
        v35 = vrsqrte_f32((float32x2_t)LODWORD(v34));
        v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)LODWORD(v34), vmul_f32(v35, v35)));
        v39 = vmulq_n_f32(v32, vmul_f32(v36, vrsqrts_f32((float32x2_t)LODWORD(v34), vmul_f32(v36, v36))).f32[0]).u64[0];
        atan2f(sqrtf(v34), v32.f32[3]);
        *(_QWORD *)&v7 = v39;
      }
      else
      {
        *(_QWORD *)&v7 = 0;
        if (v6 == 1)
          v7 = *(_OWORD *)(a1 + 144);
      }
    }
    else
    {
      v40 = 0u;
      v41 = 0u;
      sub_1B17C9CF0(&v41, (float32x4_t)*(unsigned int *)(a1 + 144), *(float32_t *)(a1 + 148), *(float32_t *)(a1 + 152));
      sub_1B17C993C(&v41, &v40);
      *(_QWORD *)&v7 = v40.i64[0];
    }
  }
  return *(double *)&v7;
}

- (void)setRotation:(VFXNode *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  char v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint32x4_t v11;
  int32x4_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x4_t v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *ComponentWithType;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  float32x4_t v27;
  float32x4_t v28;
  __int128 v29;
  _QWORD v30[4];
  __int128 v31;
  VFXNode *v32;

  v6 = *((_BYTE *)self + 49);
  v27 = v4;
  if ((v6 & 1) == 0)
  {
    objc_msgSend__updateAffine(self, a2, v2, v3);
    v4 = v27;
    v6 = *((_BYTE *)self + 49);
  }
  if ((v6 & 0x60) != 0x20
    || (vminvq_u32((uint32x4_t)vceqq_f32(*(float32x4_t *)&self->_anon_90[2], v4)) & 0x80000000) == 0)
  {
    objc_msgSend_willChangeValueForKey_(self, a2, (uint64_t)CFSTR("rotation"), v3, *(_OWORD *)&v27);
    v10 = *((_BYTE *)self + 49);
    *(float32x4_t *)&self->_anon_90[2] = v28;
    *((_BYTE *)self + 49) = v10 & 0x9D | 0x20;
    v11 = (uint32x4_t)vceqzq_f32(v28);
    v11.i32[3] = v11.i32[2];
    if ((vminvq_u32(v11) & 0x80000000) != 0)
    {
      v15 = v28;
    }
    else
    {
      v12 = (int32x4_t)vmulq_f32(v28, v28);
      v12.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v12, 2), vadd_f32(*(float32x2_t *)v12.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v12.i8, 1))).u32[0];
      v13 = vrsqrte_f32((float32x2_t)v12.u32[0]);
      v14 = vmul_f32(v13, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v13, v13)));
      v15 = vmulq_n_f32(v28, vmul_f32(v14, vrsqrts_f32((float32x2_t)v12.u32[0], vmul_f32(v14, v14))).f32[0]);
    }
    v15.i32[3] = v28.i32[3];
    v16 = objc_msgSend_worldRef(self, v7, v8, v9, *(_OWORD *)&v15);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1B189B004;
    v30[3] = &unk_1E63D5468;
    v32 = self;
    v31 = v29;
    objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v17, v16, (uint64_t)self, CFSTR("rotation"), v30);
    if (objc_msgSend_hasPhysicBody(self, v18, v19, v20))
    {
      ComponentWithType = (void *)objc_msgSend__findComponentWithType_(self, v21, 7, v22);
      objc_msgSend_resetTransform(ComponentWithType, v24, v25, v26);
    }
    objc_msgSend_didChangeValueForKey_(self, v21, (uint64_t)CFSTR("rotation"), v22);
  }
}

- (double)orientation
{
  double result;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v29 = sub_1B186BB70(*(float32x4_t **)(a1 + 8), v15, v16, v17, v18, v19, v20, v21);
      sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
      return v29;
    }
    else
    {
      return sub_1B186BB70(*(float32x4_t **)(a1 + 8), v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    objc_msgSend__quaternion((void *)a1, a2, a3, a4);
  }
  return result;
}

- (void)setOrientation:(uint64_t)a3
{
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *ComponentWithType;
  const char *v17;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    if ((vmaxvq_u32((uint32x4_t)vmvnq_s8(vorrq_s8((int8x16_t)vcltzq_f32((float32x4_t)a9), (int8x16_t)vcgezq_f32((float32x4_t)a9)))) & 0x80000000) != 0)
    {
      if ((byte_1EEF65F21 & 1) == 0)
      {
        byte_1EEF65F21 = 1;
        sub_1B17C4408(16, (uint64_t)CFSTR("Error: attempt to set NaN to node's quaternion"), a3, a4, a5, a6, a7, a8, a10);
      }
    }
    else
    {
      v20 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
      if (v20)
      {
        v28 = v20;
        sub_1B187973C(v20, v21, v22, v23, v24, v25, v26, v27);
        sub_1B186BBD8(*(float32x4_t **)(a1 + 8), v29, v30, v31, v32, v33, v34, v35, a9);
        sub_1B18797B4(v28, v36, v37, v38, v39, v40, v41, v42);
      }
      else
      {
        sub_1B186BBD8(*(float32x4_t **)(a1 + 8), v21, v22, v23, v24, v25, v26, v27, a9);
      }
    }
  }
  else
  {
    objc_msgSend__setQuaternion_((void *)a1, a2, a3, a4);
    if (objc_msgSend_hasPhysicBody((void *)a1, v11, v12, v13))
    {
      ComponentWithType = (void *)objc_msgSend__findComponentWithType_((void *)a1, v14, 7, v15);
      objc_msgSend_resetTransform(ComponentWithType, v17, v18, v19);
    }
  }
}

- (double)eulerAngles
{
  double result;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v29 = sub_1B186BBA8(*(float32x4_t **)(a1 + 8), v15, v16, v17, v18, v19, v20, v21);
      sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
      return v29;
    }
    else
    {
      return sub_1B186BBA8(*(float32x4_t **)(a1 + 8), v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    objc_msgSend__euler((void *)a1, a2, a3, a4);
  }
  return result;
}

- (void)setEulerAngles:(VFXNode *)self
{
  uint64_t v2;
  uint64_t v3;
  __n128 v4;
  const char *v6;
  uint64_t v7;
  float32x4_t v8;
  uint32x4_t v9;
  char v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *ComponentWithType;
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
  uint64_t v33;
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
  __n128 v48;
  float32x4_t v49;
  _QWORD v50[4];
  float32x4_t v51;
  VFXNode *v52;

  v48 = v4;
  if ((*((_BYTE *)self + 48) & 1) != 0)
  {
    v25 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v25)
    {
      v33 = v25;
      sub_1B187973C(v25, v26, v27, v28, v29, v30, v31, v32);
      sub_1B186BBB0((uint64_t)self->_node, v34, v35, v36, v37, v38, v39, v40, v48);
      sub_1B18797B4(v33, v41, v42, v43, v44, v45, v46, v47);
    }
    else
    {
      sub_1B186BBB0((uint64_t)self->_node, v26, v27, v28, v29, v30, v31, v32, v48);
    }
  }
  else
  {
    if ((*((_BYTE *)self + 49) & 1) == 0)
      objc_msgSend__updateAffine(self, a2, v2, v3);
    objc_msgSend__euler(self, a2, v2, v3, *(_OWORD *)&v48);
    v9 = (uint32x4_t)vceqq_f32(v8, v49);
    v9.i32[3] = v9.i32[2];
    if ((vminvq_u32(v9) & 0x80000000) == 0)
    {
      objc_msgSend_willChangeValueForKey_(self, v6, (uint64_t)CFSTR("eulerAngles"), v7);
      v10 = *((_BYTE *)self + 49);
      *(float32x4_t *)&self->_anon_90[2] = v49;
      *((_BYTE *)self + 49) = v10 & 0x9D;
      v14 = objc_msgSend_worldRef(self, v11, v12, v13);
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = sub_1B189B368;
      v50[3] = &unk_1E63D5468;
      v52 = self;
      v51 = v49;
      objc_msgSend_postCommandWithContext_object_key_applyBlock_(VFXTransaction, v15, v14, (uint64_t)self, CFSTR("eulerAngles"), v50);
      if (objc_msgSend_hasPhysicBody(self, v16, v17, v18))
      {
        ComponentWithType = (void *)objc_msgSend__findComponentWithType_(self, v19, 7, v20);
        objc_msgSend_resetTransform(ComponentWithType, v22, v23, v24);
      }
      objc_msgSend_didChangeValueForKey_(self, v19, (uint64_t)CFSTR("eulerAngles"), v20);
    }
  }
}

- (double)scale
{
  __int128 v5;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v30;

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v6 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v6)
    {
      v14 = v6;
      sub_1B187973C(v6, v7, v8, v9, v10, v11, v12, v13);
      v30 = sub_1B186BAFC(*(_QWORD *)(a1 + 8), v15, v16, v17, v18, v19, v20, v21);
      sub_1B18797B4(v14, v22, v23, v24, v25, v26, v27, v28);
      *(double *)&v5 = v30;
    }
    else
    {
      *(double *)&v5 = sub_1B186BAFC(*(_QWORD *)(a1 + 8), v7, v8, v9, v10, v11, v12, v13);
    }
  }
  else
  {
    if ((*(_BYTE *)(a1 + 49) & 1) == 0)
      objc_msgSend__updateAffine((void *)a1, a2, a3, a4);
    v5 = *(_OWORD *)(a1 + 160);
  }
  return *(double *)&v5;
}

- (void)setScale:(VFXNode *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *ComponentWithType;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  float32x4_t v38;

  if ((*((_BYTE *)self + 48) & 1) != 0)
  {
    v38 = v4;
    v15 = objc_msgSend_worldRef(self, a2, v2, v3);
    if (v15)
    {
      v23 = v15;
      sub_1B187973C(v15, v16, v17, v18, v19, v20, v21, v22);
      sub_1B186BB04((uint64_t)self->_node, v24, v25, v26, v27, v28, v29, v30, v38);
      sub_1B18797B4(v23, v31, v32, v33, v34, v35, v36, v37);
    }
    else
    {
      sub_1B186BB04((uint64_t)self->_node, v16, v17, v18, v19, v20, v21, v22, v38);
    }
  }
  else
  {
    objc_msgSend__setScale_(self, a2, v2, v3);
    if (objc_msgSend_hasPhysicBody(self, v6, v7, v8))
    {
      ComponentWithType = (void *)objc_msgSend__findComponentWithType_(self, v9, 7, v10);
      objc_msgSend_resetTransform(ComponentWithType, v12, v13, v14);
    }
  }
}

- (double)worldPosition
{
  double v4;

  objc_msgSend_worldTransform(a1, a2, a3, a4);
  return v4;
}

- (void)setWorldPosition:(VFXNode *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  float32x4_t v14;
  simd_float4x4 v15;
  simd_float4x4 v16;

  v14 = v4;
  if (objc_msgSend_parentNode(self, a2, v2, v3))
  {
    v9 = (void *)objc_msgSend_parentNode(self, v6, v7, v8);
    objc_msgSend_worldTransform(v9, v10, v11, v12);
    v16 = __invert_f4(v15);
    *(_QWORD *)&v13 = vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32((float32x4_t)v16.columns[3], (float32x4_t)v16.columns[2], v14, 2), (float32x4_t)v16.columns[1], *(float32x2_t *)v14.f32, 1), (float32x4_t)v16.columns[0], v14.f32[0]).u64[0];
  }
  else
  {
    v13 = *(double *)v14.i64;
  }
  objc_msgSend_setPosition_(self, v6, v7, v8, v13);
}

- (double)worldOrientation
{
  float32x4_t v4;
  int32x4_t v5;
  float32x4_t v6;
  int32x4_t v7;
  float32x4_t v8;
  int32x4_t v9;
  int32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  int32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  int32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  int8x16_t v22;
  int8x16_t v23;
  int32x4_t v24;
  int32x4_t v25;
  int8x16_t v26;
  float32x4_t v27;
  int32x4_t v28;
  float v29;
  float32x4_t v30;
  float v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  int8x16_t v36;
  int8x16_t v37;
  float v38;
  float32x2_t v39;
  float32x2_t v40;
  float32x2_t v41;
  uint64_t v42;
  int32x2_t v43;
  float32x4_t v44;
  float32x2_t v45;
  float32x2_t v46;
  double result;

  objc_msgSend_worldTransform(a1, a2, a3, a4);
  v5 = (int32x4_t)vmulq_f32(v4, v4);
  v7 = (int32x4_t)vmulq_f32(v6, v6);
  v9 = (int32x4_t)vmulq_f32(v8, v8);
  v10 = vzip2q_s32(v5, v9);
  v11 = (float32x4_t)vzip1q_s32(vzip1q_s32(v5, v9), v7);
  v12 = (float32x4_t)vtrn2q_s32(v5, v7);
  v12.i32[2] = v9.i32[1];
  v13 = vaddq_f32((float32x4_t)vzip1q_s32(v10, vdupq_laneq_s32(v7, 2)), vaddq_f32(v11, v12));
  v12.i64[0] = 0x80000000800000;
  v12.i64[1] = 0x80000000800000;
  v14 = vcgeq_f32(v12, v13);
  v13.i32[3] = 0;
  v15 = vrsqrteq_f32(v13);
  v16 = vmulq_f32(v15, vrsqrtsq_f32(v13, vmulq_f32(v15, v15)));
  v17 = v14;
  v17.i32[3] = 0;
  v18 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v17), (int8x16_t)v13, (int8x16_t)vmulq_f32(v16, vrsqrtsq_f32(v13, vmulq_f32(v16, v16))));
  v19 = vmulq_n_f32(v4, v18.f32[0]);
  v20 = vmulq_lane_f32(v6, *(float32x2_t *)v18.f32, 1);
  v21 = vmulq_laneq_f32(v8, v18, 2);
  v22 = (int8x16_t)vuzp1q_s32((int32x4_t)v21, (int32x4_t)v21);
  v23 = (int8x16_t)vuzp1q_s32((int32x4_t)v20, (int32x4_t)v20);
  v24 = (int32x4_t)v19;
  if (v14.i32[0])
  {
    v25 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v22, (int8x16_t)v21, 0xCuLL), vnegq_f32(v20)), v21, (float32x4_t)vextq_s8(v23, (int8x16_t)v20, 0xCuLL));
    v24 = (int32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v25, v25), (int8x16_t)v25, 0xCuLL);
  }
  v26 = (int8x16_t)vuzp1q_s32((int32x4_t)v19, (int32x4_t)v19);
  v27 = v20;
  if (v14.i32[1])
  {
    v28 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v26, (int8x16_t)v19, 0xCuLL), vnegq_f32(v21)), v19, (float32x4_t)vextq_s8(v22, (int8x16_t)v21, 0xCuLL));
    v27 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v28, v28), (int8x16_t)v28, 0xCuLL);
  }
  if (v14.i32[2])
  {
    v14 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v23, (int8x16_t)v20, 0xCuLL), vnegq_f32(v19)), v20, (float32x4_t)vextq_s8(v26, (int8x16_t)v19, 0xCuLL));
    v21 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v14, v14), (int8x16_t)v14, 0xCuLL);
  }
  v29 = (float)(*(float *)v24.i32 + v27.f32[1]) + v21.f32[2];
  if (v29 > 0.0)
  {
    v30 = (float32x4_t)vzip2q_s32((int32x4_t)v27, vuzp1q_s32((int32x4_t)v27, (int32x4_t)v21));
    v30.i32[2] = v24.i32[1];
    v31 = sqrtf(v29 + 1.0);
    v32 = (float32x4_t)vtrn2q_s32((int32x4_t)v21, vzip2q_s32((int32x4_t)v21, v24));
    v32.i32[2] = v27.i32[0];
    v34 = vsubq_f32(v30, v32);
    v30.f32[3] = v31;
    v32.f32[3] = v31;
    v33 = vmulq_f32(v30, v32);
    v34.i32[3] = v33.i32[3];
LABEL_18:
    v33.f32[0] = 0.5 / v31;
    v44 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v33.f32, 0);
    goto LABEL_19;
  }
  if (*(float *)v24.i32 < v27.f32[1] || *(float *)v24.i32 < v21.f32[2])
  {
    if (v27.f32[1] <= v21.f32[2])
    {
      v31 = sqrtf((float)((float)(v21.f32[2] + 1.0) - *(float *)v24.i32) - v27.f32[1]);
      *(float32x2_t *)v34.f32 = vadd_f32((float32x2_t)*(_OWORD *)&vzip2q_s32(v24, (int32x4_t)v27), *(float32x2_t *)v21.f32);
      v45 = (float32x2_t)__PAIR64__(v24.u32[1], LODWORD(v31));
      v46 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.f32, 0);
      *(float32x2_t *)v33.f32 = vsub_f32(*(float32x2_t *)v24.i8, v46);
      v46.f32[0] = v31;
      v46.i32[0] = vmul_f32(v45, v46).u32[0];
      v46.i32[1] = v33.i32[1];
      *(float32x2_t *)&v34.u32[2] = v46;
      goto LABEL_18;
    }
    v38 = sqrtf((float)((float)(v27.f32[1] + 1.0) - *(float *)v24.i32) - v21.f32[2]);
    *(int32x2_t *)v14.i8 = vdup_laneq_s32((int32x4_t)v27, 2);
    v36 = (int8x16_t)v14;
    *(float *)v36.i32 = v38;
    v36.i32[0] = vmul_f32(*(float32x2_t *)v36.i8, (float32x2_t)__PAIR64__(v21.u32[1], LODWORD(v38))).u32[0];
    v36.i32[1] = vadd_f32(*(float32x2_t *)&v14, *(float32x2_t *)&v21).i32[1];
    v37 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v24.i8, 1), v27);
    v43 = (int32x2_t)vsubq_f32(v21, (float32x4_t)vdupq_laneq_s32(v24, 2)).u64[0];
    v44 = (float32x4_t)vextq_s8(vextq_s8(v37, v37, 4uLL), v36, 0xCuLL);
    v44.i32[3] = v43.i32[0];
  }
  else
  {
    v38 = sqrtf((float)((float)(*(float *)v24.i32 + 1.0) - v27.f32[1]) - v21.f32[2]);
    v39 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v27.f32, 0);
    v40 = vadd_f32(*(float32x2_t *)v24.i8, v39);
    v39.f32[0] = v38;
    v44.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v24.u32[1], LODWORD(v38)), v39).u32[0];
    v44.i32[1] = v40.i32[1];
    v41 = (float32x2_t)vzip2q_s32(v24, (int32x4_t)v27).u64[0];
    LODWORD(v42) = vadd_f32(v41, *(float32x2_t *)v21.f32).u32[0];
    v43 = (int32x2_t)vsub_f32(v41, *(float32x2_t *)v21.f32);
    HIDWORD(v42) = v43.i32[1];
    v44.i64[1] = v42;
  }
  *(float *)v43.i32 = 0.5 / v38;
  v34 = (float32x4_t)vdupq_lane_s32(v43, 0);
LABEL_19:
  *(_QWORD *)&result = vmulq_f32(v34, v44).u64[0];
  return result;
}

- (uint64_t)setWorldOrientation:(uint64_t)a3
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int32x4_t v13;
  int32x4_t v14;
  int32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  int32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  int32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int32x4_t v28;
  int32x4_t v29;
  int8x16_t v30;
  float32x4_t v31;
  int32x4_t v32;
  float v33;
  float32x4_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  unint64_t v39;
  float32x4_t v41;
  float v42;
  int8x16_t v43;
  int8x16_t v44;
  int32x2_t v45;
  float v46;
  float32x2_t v47;
  float32x2_t v48;
  float32x2_t v49;
  uint64_t v50;
  int32x2_t v51;
  int32x4_t v54;
  float32x2_t v60;
  float32x2_t v61;
  int32x2_t v62;
  simd_float4x4 v64;
  simd_float4x4 v65;

  if (objc_msgSend_parentNode(a1, a2, a3, a4))
  {
    v9 = (void *)objc_msgSend_parentNode(a1, v6, v7, v8);
    objc_msgSend_worldTransform(v9, v10, v11, v12);
    v65 = __invert_f4(v64);
    v65.columns[3] = (simd_float4)vmulq_f32((float32x4_t)v65.columns[0], (float32x4_t)v65.columns[0]);
    v13 = (int32x4_t)vmulq_f32((float32x4_t)v65.columns[1], (float32x4_t)v65.columns[1]);
    v14 = (int32x4_t)vmulq_f32((float32x4_t)v65.columns[2], (float32x4_t)v65.columns[2]);
    v15 = vzip2q_s32((int32x4_t)v65.columns[3], v14);
    v16 = (float32x4_t)vzip1q_s32(vzip1q_s32((int32x4_t)v65.columns[3], v14), v13);
    v65.columns[3] = (simd_float4)vtrn2q_s32((int32x4_t)v65.columns[3], v13);
    v65.columns[3].i32[2] = v14.i32[1];
    v17 = vaddq_f32((float32x4_t)vzip1q_s32(v15, vdupq_laneq_s32(v13, 2)), vaddq_f32(v16, (float32x4_t)v65.columns[3]));
    v65.columns[3].i64[0] = 0x80000000800000;
    v65.columns[3].i64[1] = 0x80000000800000;
    v18 = vcgeq_f32((float32x4_t)v65.columns[3], v17);
    v17.i32[3] = 0;
    v19 = vrsqrteq_f32(v17);
    v20 = vmulq_f32(v19, vrsqrtsq_f32(v17, vmulq_f32(v19, v19)));
    v21 = v18;
    v21.i32[3] = 0;
    v22 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v21), (int8x16_t)v17, (int8x16_t)vmulq_f32(v20, vrsqrtsq_f32(v17, vmulq_f32(v20, v20))));
    v23 = vmulq_n_f32((float32x4_t)v65.columns[0], v22.f32[0]);
    v24 = vmulq_lane_f32((float32x4_t)v65.columns[1], *(float32x2_t *)v22.f32, 1);
    v25 = vmulq_laneq_f32((float32x4_t)v65.columns[2], v22, 2);
    v26 = (int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25);
    v27 = (int8x16_t)vuzp1q_s32((int32x4_t)v24, (int32x4_t)v24);
    v28 = (int32x4_t)v23;
    if (v18.i32[0])
    {
      v29 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v26, (int8x16_t)v25, 0xCuLL), vnegq_f32(v24)), v25, (float32x4_t)vextq_s8(v27, (int8x16_t)v24, 0xCuLL));
      v28 = (int32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v29, v29), (int8x16_t)v29, 0xCuLL);
    }
    v30 = (int8x16_t)vuzp1q_s32((int32x4_t)v23, (int32x4_t)v23);
    v31 = v24;
    if (v18.i32[1])
    {
      v32 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v30, (int8x16_t)v23, 0xCuLL), vnegq_f32(v25)), v23, (float32x4_t)vextq_s8(v26, (int8x16_t)v25, 0xCuLL));
      v31 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v32, v32), (int8x16_t)v32, 0xCuLL);
    }
    if (v18.i32[2])
    {
      v18 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8(v27, (int8x16_t)v24, 0xCuLL), vnegq_f32(v23)), v24, (float32x4_t)vextq_s8(v30, (int8x16_t)v23, 0xCuLL));
      v25 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v18, v18), (int8x16_t)v18, 0xCuLL);
    }
    v33 = (float)(*(float *)v28.i32 + v31.f32[1]) + v25.f32[2];
    if (v33 <= 0.0)
    {
      if (*(float *)v28.i32 < v31.f32[1] || *(float *)v28.i32 < v25.f32[2])
      {
        v41 = a5;
        if (v31.f32[1] <= v25.f32[2])
        {
          *(float32x2_t *)v25.f32 = vadd_f32((float32x2_t)*(_OWORD *)&vzip2q_s32(v28, (int32x4_t)v31), *(float32x2_t *)v25.f32);
          v60 = (float32x2_t)__PAIR64__(v28.u32[1], COERCE_UNSIGNED_INT(sqrtf((float)((float)(v25.f32[2] + 1.0) - *(float *)v28.i32) - v31.f32[1])));
          v61 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v31.f32, 0);
          v62 = (int32x2_t)vsub_f32(*(float32x2_t *)v28.i8, v61);
          v61.i32[0] = v60.i32[0];
          v61.i32[0] = vmul_f32(v60, v61).u32[0];
          v61.i32[1] = v62.i32[1];
          *(float32x2_t *)&v37.u32[2] = v61;
          *(float *)v62.i32 = 0.5 / v60.f32[0];
          v38 = (float32x4_t)vdupq_lane_s32(v62, 0);
        }
        else
        {
          v42 = sqrtf((float)((float)(v31.f32[1] + 1.0) - *(float *)v28.i32) - v25.f32[2]);
          *(int32x2_t *)v18.i8 = vdup_laneq_s32((int32x4_t)v31, 2);
          v43 = (int8x16_t)v18;
          *(float *)v43.i32 = v42;
          v43.i32[0] = vmul_f32(*(float32x2_t *)v43.i8, (float32x2_t)__PAIR64__(v25.u32[1], LODWORD(v42))).u32[0];
          v43.i32[1] = vadd_f32(*(float32x2_t *)&v18, *(float32x2_t *)&v25).i32[1];
          v44 = (int8x16_t)vaddq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.i8, 1), v31);
          v45 = (int32x2_t)vsubq_f32(v25, (float32x4_t)vdupq_laneq_s32(v28, 2)).u64[0];
          v38 = (float32x4_t)vextq_s8(vextq_s8(v44, v44, 4uLL), v43, 0xCuLL);
          v38.i32[3] = v45.i32[0];
          *(float *)v45.i32 = 0.5 / v42;
          v37 = (float32x4_t)vdupq_lane_s32(v45, 0);
        }
        goto LABEL_19;
      }
      v46 = sqrtf((float)((float)(*(float *)v28.i32 + 1.0) - v31.f32[1]) - v25.f32[2]);
      v47 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)v31.f32, 0);
      v48 = vadd_f32(*(float32x2_t *)v28.i8, v47);
      v47.f32[0] = v46;
      v38.i32[0] = vmul_f32((float32x2_t)__PAIR64__(v28.u32[1], LODWORD(v46)), v47).u32[0];
      v38.i32[1] = v48.i32[1];
      v49 = (float32x2_t)vzip2q_s32(v28, (int32x4_t)v31).u64[0];
      LODWORD(v50) = vadd_f32(v49, *(float32x2_t *)v25.f32).u32[0];
      v51 = (int32x2_t)vsub_f32(v49, *(float32x2_t *)v25.f32);
      HIDWORD(v50) = v51.i32[1];
      v38.i64[1] = v50;
      *(float *)v51.i32 = 0.5 / v46;
      v37 = (float32x4_t)vdupq_lane_s32(v51, 0);
    }
    else
    {
      v34 = (float32x4_t)vzip2q_s32((int32x4_t)v31, vuzp1q_s32((int32x4_t)v31, (int32x4_t)v25));
      v34.i32[2] = v28.i32[1];
      v35 = (float32x4_t)vtrn2q_s32((int32x4_t)v25, vzip2q_s32((int32x4_t)v25, v28));
      v35.i32[2] = v31.i32[0];
      v37 = vsubq_f32(v34, v35);
      v34.i32[3] = sqrtf(v33 + 1.0);
      v35.i32[3] = v34.i32[3];
      v36 = vmulq_f32(v34, v35);
      v37.i32[3] = v36.i32[3];
      v36.f32[0] = 0.5 / v34.f32[3];
      v38 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v36.f32, 0);
    }
    v41 = a5;
LABEL_19:
    _Q1 = vmulq_f32(v37, v38);
    _S2 = v41.i32[3];
    v54 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v41, (int32x4_t)v41), (int8x16_t)v41, 0xCuLL), vnegq_f32(_Q1)), v41, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)_Q1, (int32x4_t)_Q1), (int8x16_t)_Q1, 0xCuLL));
    v39 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(_Q1, v41, 3), v41, _Q1, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v54, v54), (int8x16_t)v54, 0xCuLL)).u64[0];
    __asm { FMLA            S3, S2, V1.S[3] }
    return objc_msgSend_setOrientation_(a1, v6, v7, v8, *(double *)&v39);
  }
  v39 = a5.i64[0];
  return objc_msgSend_setOrientation_(a1, v6, v7, v8, *(double *)&v39);
}

- (double)worldTransform
{
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
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
  uint64_t v33;
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
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
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
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  simd_float4x4 v78;
  simd_float4x4 v79;
  simd_float4x4 v80;
  simd_float4x4 v81;

  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v23 = objc_msgSend_worldRef((void *)a1, a2, a3, a4);
    if (v23)
    {
      v31 = v23;
      sub_1B187973C(v23, v24, v25, v26, v27, v28, v29, v30);
      sub_1B186BDB8(*(_QWORD *)(a1 + 8), (uint64_t)&v66, v32, v33, v34, v35, v36, v37);
      sub_1B18797B4(v31, v38, v39, v40, v41, v42, v43, v44);
    }
    else
    {
      sub_1B186BDB8(*(_QWORD *)(a1 + 8), (uint64_t)&v66, v25, v26, v27, v28, v29, v30);
    }
  }
  else
  {
    v5 = objc_msgSend_parentNode((void *)a1, a2, a3, a4);
    if (v5)
    {
      v9 = (void *)v5;
      v66 = 0u;
      v67 = 0u;
      objc_msgSend_transform((void *)a1, v6, v7, v8);
      v60 = v13;
      v63 = v14;
      v54 = v15;
      v57 = v16;
      if ((*(_BYTE *)(a1 + 49) & 4) != 0)
      {
        objc_msgSend_pivot((void *)a1, v10, v11, v12);
        v79 = __invert_f4(v78);
        v17 = 0;
        v70 = v54;
        v71 = v57;
        v72 = v60;
        v73 = v63;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v77 = 0u;
        do
        {
          *(__int128 *)((char *)&v74 + v17) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v79.columns[0], COERCE_FLOAT(*(__int128 *)((char *)&v70 + v17))), (float32x4_t)v79.columns[1], *(float32x2_t *)((char *)&v70 + v17), 1), (float32x4_t)v79.columns[2], *(float32x4_t *)((char *)&v70 + v17), 2), (float32x4_t)v79.columns[3], *(float32x4_t *)((char *)&v70 + v17), 3);
          v17 += 16;
        }
        while (v17 != 64);
        v57 = v75;
        v60 = v76;
        v63 = v77;
        v66 = v74;
        v54 = v74;
      }
      objc_msgSend_worldTransform(v9, v10, v11, v12, v54, v57, v60, v63, v66);
      v22 = 0;
      v70 = v55;
      v71 = v58;
      v72 = v61;
      v73 = v64;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      do
      {
        *(__int128 *)((char *)&v74 + v22) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v18, COERCE_FLOAT(*(__int128 *)((char *)&v70 + v22))), v19, *(float32x2_t *)((char *)&v70 + v22), 1), v20, *(float32x4_t *)((char *)&v70 + v22), 2), v21, *(float32x4_t *)((char *)&v70 + v22), 3);
        v22 += 16;
      }
      while (v22 != 64);
      goto LABEL_15;
    }
    objc_msgSend_transform((void *)a1, v6, v7, v8);
    v66 = v48;
    v67 = v49;
    v68 = v50;
    v69 = v51;
    if ((*(_BYTE *)(a1 + 49) & 4) != 0)
    {
      v56 = v48;
      v59 = v49;
      v62 = v50;
      v65 = v51;
      objc_msgSend_pivot((void *)a1, v45, v46, v47);
      v81 = __invert_f4(v80);
      v52 = 0;
      v70 = v56;
      v71 = v59;
      v72 = v62;
      v73 = v65;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      do
      {
        *(__int128 *)((char *)&v74 + v52) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v81.columns[0], COERCE_FLOAT(*(__int128 *)((char *)&v70 + v52))), (float32x4_t)v81.columns[1], *(float32x2_t *)((char *)&v70 + v52), 1), (float32x4_t)v81.columns[2], *(float32x4_t *)((char *)&v70 + v52), 2), (float32x4_t)v81.columns[3], *(float32x4_t *)((char *)&v70 + v52), 3);
        v52 += 16;
      }
      while (v52 != 64);
LABEL_15:
      v66 = v74;
      v67 = v75;
      v68 = v76;
      v69 = v77;
    }
  }
  return *(double *)&v66;
}

- (uint64_t)setWorldTransform:(uint64_t)a3
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;

  if (objc_msgSend_parentNode(a1, a2, a3, a4))
  {
    v12 = (void *)objc_msgSend_parentNode(a1, v9, v10, v11);
    objc_msgSend_convertTransform_fromNode_(v12, v13, 0, v14, a5, a6, a7, a8);
  }
  else
  {
    v18 = a8;
    v16 = a6;
    v17 = a7;
    v15 = a5;
  }
  return objc_msgSend_setTransform_(a1, v9, v10, v11, v15, v16, v17, v18);
}

- (double)convertPosition:(void *)a3 toNode:(uint64_t)a4
{
  simd_float4x4 v6;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  float32x4_t v18;
  simd_float4x4 v19;

  v6.columns[3].i64[0] = a5.i64[0];
  v8 = (uint64_t)a3;
  if (!a3)
  {
    v9 = (void *)objc_msgSend_world(a1, a2, 0, a4);
    v8 = objc_msgSend_rootNode(v9, v10, v11, v12);
    v6.columns[3].i64[0] = a5.i64[0];
  }
  if ((void *)v8 != a1)
  {
    objc_msgSend_worldTransform(a1, a2, (uint64_t)a3, a4);
    v6.columns[3] = (simd_float4)vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32((float32x4_t)v6.columns[3], (float32x4_t)v6.columns[2], a5, 2), (float32x4_t)v6.columns[1], *(float32x2_t *)a5.f32, 1), (float32x4_t)v6.columns[0], a5.f32[0]);
    if (a3)
    {
      v18 = (float32x4_t)v6.columns[3];
      objc_msgSend_worldTransform(a3, v13, v14, v15);
      v6 = __invert_f4(v19);
      v6.columns[3].i64[0] = vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32((float32x4_t)v6.columns[3], (float32x4_t)v6.columns[2], v18, 2), (float32x4_t)v6.columns[1], *(float32x2_t *)v18.f32, 1), (float32x4_t)v6.columns[0], v18.f32[0]).u64[0];
    }
  }
  return *(double *)v6.columns[3].i64;
}

- (double)convertPosition:(void *)a3 fromNode:(uint64_t)a4
{
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  simd_float4 v22;
  simd_float4 v23;
  simd_float4 v24;
  simd_float4 v25;
  float32x4_t v26;
  simd_float4x4 v27;

  v7 = (uint64_t)a3;
  v26 = (float32x4_t)a5.columns[0];
  if (!a3)
  {
    v8 = (void *)objc_msgSend_world(a1, a2, 0, a4);
    v7 = objc_msgSend_rootNode(v8, v9, v10, v11);
    a5.columns[0].i64[0] = v26.i64[0];
  }
  if ((void *)v7 != a1)
  {
    objc_msgSend_worldTransform(a1, a2, (uint64_t)a3, a4);
    a5 = __invert_f4(v27);
    v15 = (float32x4_t)a5.columns[3];
    if (a3)
    {
      v24 = a5.columns[3];
      v25 = a5.columns[0];
      v22 = a5.columns[2];
      v23 = a5.columns[1];
      objc_msgSend_worldTransform(a3, v12, v13, v14);
      v19 = vmlaq_lane_f32(vmlaq_laneq_f32(v17, v16, v26, 2), v18, *(float32x2_t *)v26.f32, 1);
      a5.columns[1] = v23;
      v15 = (float32x4_t)v24;
      a5.columns[3] = (simd_float4)vmlaq_n_f32(v19, v20, v26.f32[0]);
      a5.columns[2] = v22;
      a5.columns[0] = v25;
    }
    else
    {
      a5.columns[3] = (simd_float4)v26;
    }
    a5.columns[0].i64[0] = vmlaq_n_f32(vmlaq_lane_f32(vmlaq_laneq_f32(v15, (float32x4_t)a5.columns[2], (float32x4_t)a5.columns[3], 2), (float32x4_t)a5.columns[1], *(float32x2_t *)a5.columns[3].f32, 1), (float32x4_t)a5.columns[0], a5.columns[3].f32[0]).u64[0];
  }
  return *(double *)a5.columns[0].i64;
}

- (double)convertVector:(void *)a3 toNode:(uint64_t)a4
{
  simd_float4x4 v6;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  float32x4_t v18;
  simd_float4x4 v19;

  v6.columns[2].i64[0] = a5.i64[0];
  v8 = (uint64_t)a3;
  if (!a3)
  {
    v9 = (void *)objc_msgSend_world(a1, a2, 0, a4);
    v8 = objc_msgSend_rootNode(v9, v10, v11, v12);
    v6.columns[2].i64[0] = a5.i64[0];
  }
  if ((void *)v8 != a1)
  {
    objc_msgSend_worldTransform(a1, a2, (uint64_t)a3, a4);
    v6.columns[2] = (simd_float4)vmlaq_n_f32(vmlaq_lane_f32(vmulq_laneq_f32((float32x4_t)v6.columns[2], a5, 2), (float32x4_t)v6.columns[1], *(float32x2_t *)a5.f32, 1), (float32x4_t)v6.columns[0], a5.f32[0]);
    if (a3)
    {
      v18 = (float32x4_t)v6.columns[2];
      objc_msgSend_worldTransform(a3, v13, v14, v15);
      v6 = __invert_f4(v19);
      v6.columns[2].i64[0] = vmlaq_n_f32(vmlaq_lane_f32(vmulq_laneq_f32((float32x4_t)v6.columns[2], v18, 2), (float32x4_t)v6.columns[1], *(float32x2_t *)v18.f32, 1), (float32x4_t)v6.columns[0], v18.f32[0]).u64[0];
    }
  }
  return *(double *)v6.columns[2].i64;
}

- (double)convertVector:(void *)a3 fromNode:(uint64_t)a4
{
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  float32x4_t v15;
  float32x4_t v16;
  simd_float4 v18;
  simd_float4 v19;
  simd_float4 v20;
  float32x4_t v21;
  simd_float4x4 v22;

  v7 = (uint64_t)a3;
  v21 = (float32x4_t)a5.columns[0];
  if (!a3)
  {
    v8 = (void *)objc_msgSend_world(a1, a2, 0, a4);
    v7 = objc_msgSend_rootNode(v8, v9, v10, v11);
    a5.columns[0].i64[0] = v21.i64[0];
  }
  if ((void *)v7 != a1)
  {
    objc_msgSend_worldTransform(a1, a2, (uint64_t)a3, a4);
    a5 = __invert_f4(v22);
    a5.columns[3] = a5.columns[0];
    if (a3)
    {
      v19 = a5.columns[1];
      v20 = a5.columns[0];
      v18 = a5.columns[2];
      objc_msgSend_worldTransform(a3, v12, v13, v14);
      v15 = vmlaq_lane_f32(vmulq_laneq_f32((float32x4_t)a5.columns[2], v21, 2), (float32x4_t)a5.columns[1], *(float32x2_t *)v21.f32, 1);
      a5.columns[2] = v18;
      a5.columns[1] = v19;
      v16 = vmlaq_n_f32(v15, (float32x4_t)a5.columns[0], v21.f32[0]);
      a5.columns[3] = v20;
    }
    else
    {
      v16 = v21;
    }
    a5.columns[0].i64[0] = vmlaq_n_f32(vmlaq_lane_f32(vmulq_laneq_f32((float32x4_t)a5.columns[2], v16, 2), (float32x4_t)a5.columns[1], *(float32x2_t *)v16.f32, 1), (float32x4_t)a5.columns[3], v16.f32[0]).u64[0];
  }
  return *(double *)a5.columns[0].i64;
}

- (float32x4_t)convertTransform:(void *)a3 toNode:(uint64_t)a4
{
  float32x4_t v10;
  __n128 v11;
  __n128 v12;
  __n128 v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  float32x4_t v32;
  float32x4_t v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  float32x4_t v37;
  __n128 v38;
  __n128 v39;
  __n128 v40;
  float32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  simd_float4x4 v45;
  simd_float4x4 v46;

  if (a3)
  {
    if (a3 == a1)
      return result;
    v33 = result;
    v34 = a6;
    v35 = a7;
    v36 = a8;
    objc_msgSend_worldTransform(a1, a2, (uint64_t)a3, a4);
    v31 = v11;
    v32 = v10;
    v29 = v13;
    v30 = v12;
    objc_msgSend_worldTransform(a3, v14, v15, v16);
    v46 = __invert_f4(v45);
    v17 = 0;
    v37 = v32;
    v38 = v31;
    v39 = v30;
    v40 = v29;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v41 + v17) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v46.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v37 + v17))), (float32x4_t)v46.columns[1], *(float32x2_t *)&v37.f32[v17 / 4], 1), (float32x4_t)v46.columns[2], *(float32x4_t *)((char *)&v37 + v17), 2), (float32x4_t)v46.columns[3], *(float32x4_t *)((char *)&v37 + v17), 3);
      v17 += 16;
    }
    while (v17 != 64);
    result = v41;
    v18 = v42;
    v19 = v43;
    v20 = v44;
  }
  else
  {
    v33 = result;
    v34 = a6;
    v35 = a7;
    v36 = a8;
    v21 = (void *)objc_msgSend_world(a1, a2, 0, a4);
    if ((void *)objc_msgSend_rootNode(v21, v22, v23, v24) == a1)
      return v33;
    objc_msgSend_worldTransform(a1, v25, v26, v27);
  }
  v28 = 0;
  v37 = v33;
  v38 = v34;
  v39 = v35;
  v40 = v36;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v41 + v28) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(result, COERCE_FLOAT(*(_OWORD *)((char *)&v37 + v28))), v18, *(float32x2_t *)&v37.f32[v28 / 4], 1), v19, *(float32x4_t *)((char *)&v37 + v28), 2), v20, *(float32x4_t *)((char *)&v37 + v28), 3);
    v28 += 16;
  }
  while (v28 != 64);
  result.i64[0] = v41.i64[0];
  return result;
}

- (double)convertTransform:(void *)a3 fromNode:(uint64_t)a4
{
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  float32x4_t v18;
  unint64_t v19;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  __n128 v23;
  unint64_t v24;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  __n128 v30;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;
  simd_float4 v38;
  simd_float4 v39;
  float32x4_t v40;
  simd_float4 v41;
  simd_float4x4 v42;
  simd_float4x4 v43;

  v10 = (uint64_t)a3;
  v30 = a5;
  if (!a3)
  {
    v11 = (void *)objc_msgSend_world(a1, a2, 0, a4);
    v10 = objc_msgSend_rootNode(v11, v12, v13, v14);
    a5.n128_u64[0] = v30.n128_u64[0];
  }
  if ((void *)v10 != a1)
  {
    objc_msgSend_worldTransform(a1, a2, (uint64_t)a3, a4);
    v43 = __invert_f4(v42);
    v18 = (float32x4_t)v43.columns[2];
    if (a3)
    {
      v28 = (float32x4_t)v43.columns[1];
      v29 = (float32x4_t)v43.columns[0];
      v26 = (float32x4_t)v43.columns[3];
      v27 = (float32x4_t)v43.columns[2];
      objc_msgSend_worldTransform(a3, v15, v16, v17);
      v19 = 0;
      v34 = v20;
      v35 = v21;
      v36 = v22;
      v37 = v23;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v38 + v19) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(_OWORD *)((char *)&v34 + v19))), v28, (float32x2_t)v34.n128_u64[v19 / 8], 1), v27, *(float32x4_t *)((char *)&v34 + v19), 2), v26, *(float32x4_t *)((char *)&v34 + v19), 3);
        v19 += 16;
      }
      while (v19 != 64);
      v43.columns[0] = v38;
      v43.columns[1] = v39;
      v18 = v40;
      v43.columns[3] = v41;
    }
    v24 = 0;
    v34 = v30;
    v35 = a6;
    v36 = a7;
    v37 = a8;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v38 + v24) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v43.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v34 + v24))), (float32x4_t)v43.columns[1], (float32x2_t)v34.n128_u64[v24 / 8], 1), v18, *(float32x4_t *)((char *)&v34 + v24), 2), (float32x4_t)v43.columns[3], *(float32x4_t *)((char *)&v34 + v24), 3);
      v24 += 16;
    }
    while (v24 != 64);
    a5.n128_u64[0] = v38.i64[0];
  }
  return a5.n128_f64[0];
}

+ (double)localUp
{
  return 0.0078125;
}

+ (double)localRight
{
  double result;

  *(_QWORD *)&result = 1065353216;
  return result;
}

+ (double)localFront
{
  return 0.0;
}

- (double)worldUp
{
  float32x4_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  float32x4_t v9;
  int32x4_t v10;
  int8x16_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int32x4_t v16;
  int8x16_t v17;
  float32x4_t v18;
  float32x4_t v19;
  double result;
  float32x4_t v21;

  objc_msgSend_worldOrientation(a1, a2, a3, a4);
  v21 = v4;
  v5 = (void *)objc_opt_class();
  objc_msgSend_localUp(v5, v6, v7, v8);
  v9 = vmulq_f32(v21, (float32x4_t)xmmword_1B2244F80);
  v10 = (int32x4_t)vnegq_f32(v9);
  v11 = (int8x16_t)vtrn2q_s32((int32x4_t)v9, vtrn1q_s32((int32x4_t)v9, v10));
  v13 = vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v9, (int8x16_t)v10, 8uLL), *(float32x2_t *)v12.f32, 1);
  v14 = (float32x4_t)vrev64q_s32((int32x4_t)v9);
  v14.i32[0] = v10.i32[1];
  v14.i32[3] = v10.i32[2];
  v15 = vmlaq_laneq_f32(vmlaq_n_f32(v13, (float32x4_t)vextq_s8(v11, v11, 8uLL), v12.f32[0]), v14, v12, 2);
  v16 = (int32x4_t)vnegq_f32(v15);
  v17 = (int8x16_t)vtrn2q_s32((int32x4_t)v15, vtrn1q_s32((int32x4_t)v15, v16));
  v18 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v15, (int8x16_t)v16, 8uLL), *(float32x2_t *)v21.f32, 1), (float32x4_t)vextq_s8(v17, v17, 8uLL), v21.f32[0]);
  v19 = (float32x4_t)vrev64q_s32((int32x4_t)v15);
  v19.i32[0] = v16.i32[1];
  v19.i32[3] = v16.i32[2];
  *(_QWORD *)&result = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v15, v21, 3), v19, v21, 2), v18).u64[0];
  return result;
}

- (double)worldRight
{
  float32x4_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  float32x4_t v9;
  int32x4_t v10;
  int8x16_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int32x4_t v16;
  int8x16_t v17;
  float32x4_t v18;
  float32x4_t v19;
  double result;
  float32x4_t v21;

  objc_msgSend_worldOrientation(a1, a2, a3, a4);
  v21 = v4;
  v5 = (void *)objc_opt_class();
  objc_msgSend_localRight(v5, v6, v7, v8);
  v9 = vmulq_f32(v21, (float32x4_t)xmmword_1B2244F80);
  v10 = (int32x4_t)vnegq_f32(v9);
  v11 = (int8x16_t)vtrn2q_s32((int32x4_t)v9, vtrn1q_s32((int32x4_t)v9, v10));
  v13 = vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v9, (int8x16_t)v10, 8uLL), *(float32x2_t *)v12.f32, 1);
  v14 = (float32x4_t)vrev64q_s32((int32x4_t)v9);
  v14.i32[0] = v10.i32[1];
  v14.i32[3] = v10.i32[2];
  v15 = vmlaq_laneq_f32(vmlaq_n_f32(v13, (float32x4_t)vextq_s8(v11, v11, 8uLL), v12.f32[0]), v14, v12, 2);
  v16 = (int32x4_t)vnegq_f32(v15);
  v17 = (int8x16_t)vtrn2q_s32((int32x4_t)v15, vtrn1q_s32((int32x4_t)v15, v16));
  v18 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v15, (int8x16_t)v16, 8uLL), *(float32x2_t *)v21.f32, 1), (float32x4_t)vextq_s8(v17, v17, 8uLL), v21.f32[0]);
  v19 = (float32x4_t)vrev64q_s32((int32x4_t)v15);
  v19.i32[0] = v16.i32[1];
  v19.i32[3] = v16.i32[2];
  *(_QWORD *)&result = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v15, v21, 3), v19, v21, 2), v18).u64[0];
  return result;
}

- (double)worldFront
{
  float32x4_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  float32x4_t v9;
  int32x4_t v10;
  int8x16_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int32x4_t v16;
  int8x16_t v17;
  float32x4_t v18;
  float32x4_t v19;
  double result;
  float32x4_t v21;

  objc_msgSend_worldOrientation(a1, a2, a3, a4);
  v21 = v4;
  v5 = (void *)objc_opt_class();
  objc_msgSend_localFront(v5, v6, v7, v8);
  v9 = vmulq_f32(v21, (float32x4_t)xmmword_1B2244F80);
  v10 = (int32x4_t)vnegq_f32(v9);
  v11 = (int8x16_t)vtrn2q_s32((int32x4_t)v9, vtrn1q_s32((int32x4_t)v9, v10));
  v13 = vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v9, (int8x16_t)v10, 8uLL), *(float32x2_t *)v12.f32, 1);
  v14 = (float32x4_t)vrev64q_s32((int32x4_t)v9);
  v14.i32[0] = v10.i32[1];
  v14.i32[3] = v10.i32[2];
  v15 = vmlaq_laneq_f32(vmlaq_n_f32(v13, (float32x4_t)vextq_s8(v11, v11, 8uLL), v12.f32[0]), v14, v12, 2);
  v16 = (int32x4_t)vnegq_f32(v15);
  v17 = (int8x16_t)vtrn2q_s32((int32x4_t)v15, vtrn1q_s32((int32x4_t)v15, v16));
  v18 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v15, (int8x16_t)v16, 8uLL), *(float32x2_t *)v21.f32, 1), (float32x4_t)vextq_s8(v17, v17, 8uLL), v21.f32[0]);
  v19 = (float32x4_t)vrev64q_s32((int32x4_t)v15);
  v19.i32[0] = v16.i32[1];
  v19.i32[3] = v16.i32[2];
  *(_QWORD *)&result = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v15, v21, 3), v19, v21, 2), v18).u64[0];
  return result;
}

- (void)lookAt:(VFXNode *)self
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend_worldUp(self, a2, v2, v3);
  objc_msgSend_localFront(VFXNode, v5, v6, v7);
  MEMORY[0x1E0DE7D20](self, sel_lookAt_up_localFront_, v8, v9);
}

- (void)lookAt:(VFXNode *)self up:(SEL)a2 localFront:
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  float32x4_t v5;
  float32x4_t v6;
  float32x4_t v8;
  uint32x4_t v9;
  float32x4_t v10;
  int32x4_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x4_t v14;
  float32x4_t v15;
  int32x4_t v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x4_t v19;
  float32x4_t v20;
  unint64_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float v26;
  uint64_t v27;
  float32x2_t v28;
  float32x2_t v29;
  float32x4_t v30;
  float32x4_t v31;
  int32x4_t v32;
  float32x2_t v33;
  float32x2_t v34;
  float32x4_t v35;
  float32x4_t v36;
  float32x4_t v37;
  float32x4_t v38;
  int32x4_t v39;
  float32x4_t v40;
  int32x4_t v41;
  float32x4_t v42;
  float32x4_t v43;
  int32x4_t v44;
  int8x16_t v45;
  float32x4_t v46;
  float32x4_t v47;
  float32x4_t v48;
  int32x4_t v49;
  float32x2_t v50;
  float32x2_t v51;
  float32x4_t v52;
  int32x4_t v53;
  float32x4_t v54;
  float32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  int32x4_t v58;
  float32x4_t v59;
  int8x16_t v60;
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  int32x4_t v64;
  int8x16_t v65;
  float32x4_t v66;
  float32x4_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  int32x4_t v76;
  float32x4_t v77;
  float32x4_t v78;
  float32x4_t v79;
  float32x4_t v80;
  float32x4_t v81;
  float32x4_t v82;
  float32x4_t v83;
  int32x4_t v84;
  float32x4_t v85;
  int32x4_t v86;
  float32x4_t v87;
  float v88;
  float32x4_t v89;
  BOOL v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  int8x16_t v94;
  int32x4_t v95;
  int32x4_t v99;
  double v100;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  float32x4_t v108;
  float v109;
  float v110;
  float32x4_t v111;
  float32x4_t v112;
  int32x4_t v113;
  float32x2_t v114;
  float32x2_t v115;
  float32x4_t v116;
  float32x4_t v117;
  float32x4_t v118;
  float32x4_t v119;
  float32x4_t v120;
  int32x4_t v121;
  float32x2_t v122;
  float32x2_t v123;
  int32x2_t v124;
  float32x4_t v125;
  float32x4_t v126;
  float32x4_t v127;
  float32x4_t v128;
  float32x4_t v129;
  float32x4_t v130;
  float32x4_t v131;

  v125 = v5;
  v127 = v6;
  v130 = v4;
  objc_msgSend_worldPosition(self, a2, v2, v3);
  v9 = (uint32x4_t)vcgeq_f32((float32x4_t)vdupq_n_s32(0x3727C5ACu), vabdq_f32(v130, v8));
  v9.i32[3] = v9.i32[2];
  if ((vminvq_u32(v9) & 0x80000000) != 0)
    return;
  v10 = vsubq_f32(v130, v8);
  v11 = (int32x4_t)vmulq_f32(v10, v10);
  v11.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v11, 2), vadd_f32(*(float32x2_t *)v11.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v11.i8, 1))).u32[0];
  v12 = vrsqrte_f32((float32x2_t)v11.u32[0]);
  v13 = vmul_f32(v12, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v12, v12)));
  v14 = vmulq_n_f32(v10, vmul_f32(v13, vrsqrts_f32((float32x2_t)v11.u32[0], vmul_f32(v13, v13))).f32[0]);
  v15 = vmulq_f32(v127, v14);
  if (vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v15, 2), vaddq_f32(v15, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v15.f32, 1))).f32[0] >= 0.0)
  {
    v48 = vaddq_f32(v127, v14);
    v49 = (int32x4_t)vmulq_f32(v48, v48);
    v49.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v49, 2), vadd_f32(*(float32x2_t *)v49.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v49.i8, 1))).u32[0];
    v50 = vrsqrte_f32((float32x2_t)v49.u32[0]);
    v51 = vmul_f32(v50, vrsqrts_f32((float32x2_t)v49.u32[0], vmul_f32(v50, v50)));
    v52 = vmulq_n_f32(v48, vmul_f32(v51, vrsqrts_f32((float32x2_t)v49.u32[0], vmul_f32(v51, v51))).f32[0]);
    v53 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v52, (int32x4_t)v52), (int8x16_t)v52, 0xCuLL), vnegq_f32(v127)), v52, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v127, (int32x4_t)v127), (int8x16_t)v127, 0xCuLL));
    v47 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v53, v53), (int8x16_t)v53, 0xCuLL);
    v54 = vmulq_f32(v127, v52);
    v47.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v54, 2), vaddq_f32(v54, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v54.f32, 1))).u32[0];
    v55 = vmulq_f32(v14, v14);
    v124 = (int32x2_t)vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v55, 2), vaddq_f32(v55, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v55.f32, 1))).u64[0];
  }
  else
  {
    v16 = (int32x4_t)vmulq_f32(v127, v127);
    v16.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v16, 2), vadd_f32(*(float32x2_t *)v16.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v16.i8, 1))).u32[0];
    v17 = vrsqrte_f32((float32x2_t)v16.u32[0]);
    v18 = vmul_f32(v17, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v17, v17)));
    v19 = vmulq_n_f32(v127, vmul_f32(v18, vrsqrts_f32((float32x2_t)v16.u32[0], vmul_f32(v18, v18))).f32[0]);
    v20 = vmulq_f32(v14, v14);
    v21 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v20, 2), vaddq_f32(v20, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v20.f32, 1))).u64[0];
    v22 = vrsqrte_f32((float32x2_t)v21);
    v23 = vmul_f32(v22, vrsqrts_f32((float32x2_t)v21, vmul_f32(v22, v22)));
    v24 = vaddq_f32(v19, vmulq_n_f32(v14, vmul_f32(v23, vrsqrts_f32((float32x2_t)v21, vmul_f32(v23, v23))).f32[0]));
    v25 = vmulq_f32(v24, v24);
    v26 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v25, 2), vaddq_f32(v25, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v25.f32, 1))).f32[0];
    v124 = (int32x2_t)v21;
    if (v26 <= 1.4211e-14)
    {
      v108 = vabsq_f32(v127);
      v109 = v108.f32[1];
      v110 = v108.f32[2];
      if (v108.f32[0] > v108.f32[1] || v108.f32[0] > v108.f32[2])
      {
        v116 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v127, (int32x4_t)v127), (int8x16_t)v127, 0xCuLL);
        v56 = v125;
        if (v109 <= v110)
        {
          v117 = vmulq_f32(v127, (float32x4_t)xmmword_1B2244F20);
          v118 = (float32x4_t)xmmword_1B2244DD0;
        }
        else
        {
          v117 = vmulq_f32(v127, (float32x4_t)xmmword_1B2244EF0);
          v118 = (float32x4_t)xmmword_1B2244D90;
        }
        v119 = vmlaq_f32(v117, v118, v116);
        v120 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v119, (int32x4_t)v119), (int8x16_t)v119, 0xCuLL);
        v121 = (int32x4_t)vmulq_f32(v119, v119);
        v121.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v121.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v121, 2), *(float32x2_t *)v121.i8)).u32[0];
        v122 = vrsqrte_f32((float32x2_t)v121.u32[0]);
        v123 = vmul_f32(v122, vrsqrts_f32((float32x2_t)v121.u32[0], vmul_f32(v122, v122)));
        v47 = vmulq_n_f32(v120, vmul_f32(v123, vrsqrts_f32((float32x2_t)v121.u32[0], vmul_f32(v123, v123))).f32[0]);
        v47.i32[3] = 0;
        goto LABEL_8;
      }
      v111 = vmlaq_f32(vmulq_f32(v127, (float32x4_t)xmmword_1B2244F00), (float32x4_t)xmmword_1B2244DB0, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v127, (int32x4_t)v127), (int8x16_t)v127, 0xCuLL));
      v112 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v111, (int32x4_t)v111), (int8x16_t)v111, 0xCuLL);
      v113 = (int32x4_t)vmulq_f32(v111, v111);
      v113.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v113.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v113, 2), *(float32x2_t *)v113.i8)).u32[0];
      v114 = vrsqrte_f32((float32x2_t)v113.u32[0]);
      v115 = vmul_f32(v114, vrsqrts_f32((float32x2_t)v113.u32[0], vmul_f32(v114, v114)));
      v47 = vmulq_n_f32(v112, vmul_f32(v115, vrsqrts_f32((float32x2_t)v113.u32[0], vmul_f32(v115, v115))).f32[0]);
      v47.i32[3] = 0;
    }
    else
    {
      v27 = LODWORD(v26);
      v28 = vrsqrte_f32((float32x2_t)LODWORD(v26));
      v29 = vmul_f32(v28, vrsqrts_f32((float32x2_t)v27, vmul_f32(v28, v28)));
      v30 = vmulq_n_f32(v24, vmul_f32(v29, vrsqrts_f32((float32x2_t)v27, vmul_f32(v29, v29))).f32[0]);
      v31 = vaddq_f32(v127, v30);
      v32 = (int32x4_t)vmulq_f32(v31, v31);
      v32.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v32, 2), vadd_f32(*(float32x2_t *)v32.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v32.i8, 1))).u32[0];
      v33 = vrsqrte_f32((float32x2_t)v32.u32[0]);
      v34 = vmul_f32(v33, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(v33, v33)));
      v35 = vmulq_n_f32(v31, vmul_f32(v34, vrsqrts_f32((float32x2_t)v32.u32[0], vmul_f32(v34, v34))).f32[0]);
      v36 = vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v35, (int32x4_t)v35), (int8x16_t)v35, 0xCuLL), vnegq_f32(v127)), v35, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v127, (int32x4_t)v127), (int8x16_t)v127, 0xCuLL));
      v37 = vmulq_f32(v127, v35);
      v38 = vaddq_f32(v14, v30);
      v39 = (int32x4_t)vmulq_f32(v38, v38);
      v39.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v39, 2), vadd_f32(*(float32x2_t *)v39.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v39.i8, 1))).u32[0];
      *(float32x2_t *)v32.i8 = vrsqrte_f32((float32x2_t)v39.u32[0]);
      *(float32x2_t *)v32.i8 = vmul_f32(*(float32x2_t *)v32.i8, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(*(float32x2_t *)v32.i8, *(float32x2_t *)v32.i8)));
      v40 = vmulq_n_f32(v38, vmul_f32(*(float32x2_t *)v32.i8, vrsqrts_f32((float32x2_t)v39.u32[0], vmul_f32(*(float32x2_t *)v32.i8, *(float32x2_t *)v32.i8))).f32[0]);
      v41 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v40, (int32x4_t)v40), (int8x16_t)v40, 0xCuLL), vnegq_f32(v30)), v40, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v30, (int32x4_t)v30), (int8x16_t)v30, 0xCuLL));
      v42 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v41, v41), (int8x16_t)v41, 0xCuLL);
      v43 = vmulq_f32(v30, v40);
      v42.i32[3] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v43, 2), vaddq_f32(v43, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v43.f32, 1))).u32[0];
      v44 = (int32x4_t)vnegq_f32(v42);
      v45 = (int8x16_t)vtrn2q_s32((int32x4_t)v42, vtrn1q_s32((int32x4_t)v42, v44));
      v46 = (float32x4_t)vrev64q_s32((int32x4_t)v42);
      v46.i32[0] = v44.i32[1];
      v46.i32[3] = v44.i32[2];
      v47 = vaddq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v37, 2), vaddq_f32(v37, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v37.f32, 1))).f32[0]), v46, *(float32x2_t *)v36.f32, 1), vmlaq_laneq_f32(vmulq_n_f32((float32x4_t)vextq_s8((int8x16_t)v42, (int8x16_t)v44, 8uLL), v36.f32[0]), (float32x4_t)vextq_s8(v45, v45, 8uLL), v36, 2));
    }
  }
  v56 = v125;
LABEL_8:
  v57 = vmulq_f32(v47, (float32x4_t)xmmword_1B2244F80);
  v58 = (int32x4_t)vnegq_f32(v57);
  v59 = v47;
  v131 = v47;
  v60 = (int8x16_t)vtrn2q_s32((int32x4_t)v57, vtrn1q_s32((int32x4_t)v57, v58));
  v61 = (float32x4_t)vextq_s8((int8x16_t)v57, (int8x16_t)v58, 8uLL);
  v62 = (float32x4_t)vrev64q_s32((int32x4_t)v57);
  v62.i32[0] = v58.i32[1];
  v62.i32[3] = v58.i32[2];
  v63 = vmlaq_f32(vmlaq_f32(v61, (float32x4_t)0, (float32x4_t)vextq_s8(v60, v60, 8uLL)), (float32x4_t)0, v62);
  v64 = (int32x4_t)vnegq_f32(v63);
  v65 = (int8x16_t)vtrn2q_s32((int32x4_t)v63, vtrn1q_s32((int32x4_t)v63, v64));
  v66 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v63, (int8x16_t)v64, 8uLL), *(float32x2_t *)v59.f32, 1), (float32x4_t)vextq_s8(v65, v65, 8uLL), v59.f32[0]);
  v67 = (float32x4_t)vrev64q_s32((int32x4_t)v63);
  v67.i32[0] = v64.i32[1];
  v67.i32[3] = v64.i32[2];
  v68 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v63, v59, 3), v67, v59, 2), v66);
  v69 = vmulq_f32(v14, v68);
  v70 = vmlsq_lane_f32(v68, v14, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v69, 2), vaddq_f32(v69, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v69.f32, 1))), 0);
  v71 = vmulq_f32(v70, v70);
  v71.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v71, 2), vaddq_f32(v71, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v71.f32, 1))).u64[0];
  v72 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v71.f32, 0);
  v72.i32[3] = 0;
  v73 = vrsqrteq_f32(v72);
  v74 = vmulq_f32(v73, vrsqrtsq_f32(v72, vmulq_f32(v73, v73)));
  v75 = vmulq_f32(v74, vrsqrtsq_f32(v72, vmulq_f32(v74, v74)));
  v76 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v71.f32[0] != 0.0)), 0x1FuLL));
  v76.i32[3] = 0;
  v77 = vmulq_f32(v14, v56);
  v78 = vmlsq_lane_f32(v56, v14, (float32x2_t)*(_OWORD *)&vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v77, 2), vaddq_f32(v77, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v77.f32, 1))), 0);
  v79 = vmulq_f32(v78, v78);
  v79.i64[0] = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v79, 2), vaddq_f32(v79, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v79.f32, 1))).u64[0];
  v80 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v79.f32, 0);
  v81 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v76), (int8x16_t)vmulq_f32(v75, v70), (int8x16_t)v70);
  v80.i32[3] = 0;
  v82 = vrsqrteq_f32(v80);
  v83 = vmulq_f32(v82, vrsqrtsq_f32(v80, vmulq_f32(v82, v82)));
  v84 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(v79.f32[0] != 0.0)), 0x1FuLL));
  v84.i32[3] = 0;
  v85 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v84), (int8x16_t)vmulq_f32(v78, vmulq_f32(v83, vrsqrtsq_f32(v80, vmulq_f32(v83, v83)))), (int8x16_t)v78);
  v86 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v85, (int32x4_t)v85), (int8x16_t)v85, 0xCuLL), vnegq_f32(v81)), v85, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v81, (int32x4_t)v81), (int8x16_t)v81, 0xCuLL));
  v126 = v14;
  v128 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v86, v86), (int8x16_t)v86, 0xCuLL);
  v87 = vmulq_f32(v85, v81);
  v88 = acosf(fminf(fmaxf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v87, 2), vaddq_f32(v87, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v87.f32, 1))).f32[0], -1.0), 1.0));
  v89 = vmulq_f32(v126, v128);
  v90 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v89, 2), vaddq_f32(v89, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v89.f32, 1))).f32[0] <= 0.0;
  v91 = (float32x4_t)vdupq_lane_s32(v124, 0);
  if (v90)
    v88 = -v88;
  v91.i32[3] = 0;
  v92 = vrsqrteq_f32(v91);
  v93 = vmulq_f32(v92, vrsqrtsq_f32(v91, vmulq_f32(v92, v92)));
  v94 = (int8x16_t)vmulq_f32(v126, vmulq_f32(v93, vrsqrtsq_f32(v91, vmulq_f32(v93, v93))));
  v95 = vcltzq_s32(vshlq_n_s32((int32x4_t)vmovl_u16((uint16x4_t)vdup_n_s16(*(float *)v124.i32 != 0.0)), 0x1FuLL));
  v95.i32[3] = 0;
  v129 = (float32x4_t)vbslq_s8((int8x16_t)vcltzq_s32(v95), v94, (int8x16_t)v126);
  _KR00_8 = __sincosf_stret(v88 * 0.5);
  _Q2 = vmulq_n_f32(v129, _KR00_8.__sinval);
  _Q6 = (int32x4_t)v131;
  v99 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(_Q6, _Q6), (int8x16_t)v131, 0xCuLL), vnegq_f32(_Q2)), v131, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)_Q2, (int32x4_t)_Q2), (int8x16_t)_Q2, 0xCuLL));
  *(_QWORD *)&v100 = vaddq_f32(vmlaq_n_f32(vmulq_laneq_f32(_Q2, v131, 3), v131, _KR00_8.__cosval), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v99, v99), (int8x16_t)v99, 0xCuLL)).u64[0];
  __asm { FMLA            S2, S1, V6.S[3] }
  objc_msgSend_setWorldOrientation_(self, v105, v106, v107, v100);
}

- (void)localTranslateBy:(VFXNode *)self
{
  uint64_t v2;
  uint64_t v3;
  float32x4_t v4;
  float32x4_t v6;
  float32x4_t v7;
  int32x4_t v8;
  int8x16_t v9;
  float32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  int32x4_t v13;
  int8x16_t v14;
  float32x4_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  float32x4_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  float32x4_t v23;
  float32x4_t v24;

  v23 = v4;
  objc_msgSend_orientation(self, a2, v2, v3);
  v7 = vmulq_f32(v6, (float32x4_t)xmmword_1B2244F80);
  v8 = (int32x4_t)vnegq_f32(v7);
  v9 = (int8x16_t)vtrn2q_s32((int32x4_t)v7, vtrn1q_s32((int32x4_t)v7, v8));
  v10 = vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v7, (int8x16_t)v8, 8uLL), *(float32x2_t *)v23.f32, 1), (float32x4_t)vextq_s8(v9, v9, 8uLL), v23.f32[0]);
  v11 = (float32x4_t)vrev64q_s32((int32x4_t)v7);
  v11.i32[0] = v8.i32[1];
  v11.i32[3] = v8.i32[2];
  v12 = vmlaq_laneq_f32(v10, v11, v23, 2);
  v13 = (int32x4_t)vnegq_f32(v12);
  v14 = (int8x16_t)vtrn2q_s32((int32x4_t)v12, vtrn1q_s32((int32x4_t)v12, v13));
  v15 = (float32x4_t)vrev64q_s32((int32x4_t)v12);
  v15.i32[0] = v13.i32[1];
  v15.i32[3] = v13.i32[2];
  v24 = vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v12, v6, 3), v15, v6, 2), vmlaq_n_f32(vmulq_lane_f32((float32x4_t)vextq_s8((int8x16_t)v12, (int8x16_t)v13, 8uLL), *(float32x2_t *)v6.f32, 1), (float32x4_t)vextq_s8(v14, v14, 8uLL), v6.f32[0]));
  objc_msgSend_position(self, v16, v17, v18);
  objc_msgSend_setPosition_(self, v20, v21, v22, *(double *)vaddq_f32(v19, v24).i64);
}

- (uint64_t)localRotateBy:(uint64_t)a3
{
  int32x4_t v8;
  const char *v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend_orientation(a1, a2, a3, a4);
  _S2 = a5.u32[3];
  v8 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(a5, a5), (int8x16_t)a5, 0xCuLL), vnegq_f32(_Q0)), (float32x4_t)a5, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)_Q0, (int32x4_t)_Q0), (int8x16_t)_Q0, 0xCuLL));
  __asm { FMLA            S3, S2, V0.S[3] }
  return objc_msgSend_setOrientation_(a1, v14, v15, v16, *(double *)vaddq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(_Q0, (float32x4_t)a5, 3), (float32x4_t)a5, _Q0, 3), (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v8, v8), (int8x16_t)v8, 0xCuLL)).i64);
}

- (uint64_t)rotateBy:(uint64_t)a3 aroundTarget:(uint64_t)a4
{
  uint64_t v7;
  float32x4_t v8;
  float32x4_t v9;
  float v10;
  float32x2_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  float32x4_t v27;
  float32x4_t v29;
  float32x4_t v30;
  float32x4_t v31;
  float32x4_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  float32x4_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  float32x4_t v40;

  v7 = 0;
  v8 = vmulq_f32(a5, a5);
  v9 = vmulq_laneq_f32(a5, a5, 3);
  v10 = vmulq_lane_f32(a5, *(float32x2_t *)a5.f32, 1).f32[0];
  v8.f32[0] = 0.5 - v8.f32[0];
  v11 = vmul_laneq_f32(*(float32x2_t *)a5.f32, a5, 2);
  v12.i32[3] = 0;
  v12.f32[0] = (float)(0.5 - v8.f32[1]) - v8.f32[2];
  v12.f32[1] = v10 + v9.f32[2];
  v12.f32[2] = v11.f32[0] - v9.f32[1];
  v13.i32[3] = 0;
  v13.f32[0] = v10 - v9.f32[2];
  v13.f32[1] = v8.f32[0] - v8.f32[2];
  v13.f32[2] = v11.f32[1] + v9.f32[0];
  *(int32x2_t *)v9.f32 = vrev64_s32(*(int32x2_t *)v9.f32);
  v14.i32[0] = vadd_f32(v11, *(float32x2_t *)v9.f32).u32[0];
  v14.i32[1] = vsub_f32(v11, *(float32x2_t *)&v9).i32[1];
  v14.f32[2] = v8.f32[0] - v8.f32[1];
  v14.i32[3] = 0;
  v15 = vnegq_f32(a6);
  v15.i32[3] = 1.0;
  v16 = vaddq_f32(v12, v12);
  v17 = vaddq_f32(v13, v13);
  v18 = vaddq_f32(v14, v14);
  v33 = xmmword_1B2244DB0;
  v34 = xmmword_1B2244DD0;
  v35 = xmmword_1B2244D90;
  v36 = v15;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  do
  {
    *(__int128 *)((char *)&v37 + v7) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v16, COERCE_FLOAT(*(__int128 *)((char *)&v33 + v7))), v17, *(float32x2_t *)((char *)&v33 + v7), 1), v18, *(float32x4_t *)((char *)&v33 + v7), 2), (float32x4_t)xmmword_1B2244E20, *(float32x4_t *)((char *)&v33 + v7), 3);
    v7 += 16;
  }
  while (v7 != 64);
  v19 = 0;
  a6.i32[3] = 1.0;
  v33 = v37;
  v34 = v38;
  v35 = v39;
  v36 = v40;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  do
  {
    *(__int128 *)((char *)&v37 + v19) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1B2244DB0, COERCE_FLOAT(*(__int128 *)((char *)&v33 + v19))), (float32x4_t)xmmword_1B2244DD0, *(float32x2_t *)((char *)&v33 + v19), 1), (float32x4_t)xmmword_1B2244D90, *(float32x4_t *)((char *)&v33 + v19), 2), a6, *(float32x4_t *)((char *)&v33 + v19), 3);
    v19 += 16;
  }
  while (v19 != 64);
  v31 = (float32x4_t)v38;
  v32 = (float32x4_t)v37;
  v29 = v40;
  v30 = (float32x4_t)v39;
  objc_msgSend_worldTransform(a1, a2, a3, a4);
  v23 = 0;
  v33 = v24;
  v34 = v25;
  v35 = v26;
  v36 = v27;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  do
  {
    *(__int128 *)((char *)&v37 + v23) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(*(__int128 *)((char *)&v33 + v23))), v31, *(float32x2_t *)((char *)&v33 + v23), 1), v30, *(float32x4_t *)((char *)&v33 + v23), 2), v29, *(float32x4_t *)((char *)&v33 + v23), 3);
    v23 += 16;
  }
  while (v23 != 64);
  return objc_msgSend_setWorldTransform_(a1, v20, v21, v22, *(double *)&v37, *(double *)&v38, *(double *)&v39, *(double *)v40.i64);
}

- (id)debugQuickLookObjectWithAssetPathResolver:(id)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;

  v5 = (void *)objc_msgSend_deepClone(self, a2, (uint64_t)a3, v3);
  objc_msgSend_setHidden_(v5, v6, 0, v7);
  v11 = (void *)objc_msgSend_world(VFXWorld, v8, v9, v10);
  v15 = (void *)objc_msgSend_rootNode(v11, v12, v13, v14);
  objc_msgSend_addChildNode_(v15, v16, (uint64_t)v5, v17);
  if (a3)
  {
    objc_msgSend_setAssetPathResolver_(v11, v18, (uint64_t)a3, v20);
    v24 = (void *)objc_msgSend_rootNode(v11, v21, v22, v23);
    objc_msgSend_enumerateHierarchyUsingBlock_(v24, v25, (uint64_t)&unk_1E63D0EF0, v26);
  }
  return (id)objc_msgSend_debugQuickLookObject(v11, v18, v19, v20);
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

- (id)positionValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_position(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_position(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_position(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setPositionValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v28 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v27 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  objc_msgSend_setPosition_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)rotationValue
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
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_rotation(self, a2, v2, v3);
  v37[0] = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_rotation(self, v10, v11, v12);
  LODWORD(v13) = HIDWORD(v13);
  v37[1] = objc_msgSend_numberWithFloat_(v9, v14, v15, v16, v13);
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_rotation(self, v18, v19, v20);
  LODWORD(v22) = v21;
  v37[2] = objc_msgSend_numberWithFloat_(v17, v23, v24, v25, v22);
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_rotation(self, v27, v28, v29);
  LODWORD(v31) = v30;
  v37[3] = objc_msgSend_numberWithFloat_(v26, v32, v33, v34, v31);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v35, (uint64_t)v37, 4);
}

- (void)setRotationValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v34 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v33 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  v26 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v24, 3, v25);
  objc_msgSend_floatValue(v26, v27, v28, v29);
  objc_msgSend_setRotation_(self, v30, v31, v32, COERCE_DOUBLE(__PAIR64__(v33, v34)));
}

- (id)orientationValue
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
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_orientation(self, a2, v2, v3);
  v37[0] = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_orientation(self, v10, v11, v12);
  LODWORD(v13) = HIDWORD(v13);
  v37[1] = objc_msgSend_numberWithFloat_(v9, v14, v15, v16, v13);
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_orientation(self, v18, v19, v20);
  LODWORD(v22) = v21;
  v37[2] = objc_msgSend_numberWithFloat_(v17, v23, v24, v25, v22);
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_orientation(self, v27, v28, v29);
  LODWORD(v31) = v30;
  v37[3] = objc_msgSend_numberWithFloat_(v26, v32, v33, v34, v31);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v35, (uint64_t)v37, 4);
}

- (void)setOrientationValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v34 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v33 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  v26 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v24, 3, v25);
  objc_msgSend_floatValue(v26, v27, v28, v29);
  objc_msgSend_setOrientation_(self, v30, v31, v32, COERCE_DOUBLE(__PAIR64__(v33, v34)));
}

- (id)worldOrientationValue
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
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  _QWORD v37[5];

  v37[4] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldOrientation(self, a2, v2, v3);
  v37[0] = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldOrientation(self, v10, v11, v12);
  LODWORD(v13) = HIDWORD(v13);
  v37[1] = objc_msgSend_numberWithFloat_(v9, v14, v15, v16, v13);
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldOrientation(self, v18, v19, v20);
  LODWORD(v22) = v21;
  v37[2] = objc_msgSend_numberWithFloat_(v17, v23, v24, v25, v22);
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldOrientation(self, v27, v28, v29);
  LODWORD(v31) = v30;
  v37[3] = objc_msgSend_numberWithFloat_(v26, v32, v33, v34, v31);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v35, (uint64_t)v37, 4);
}

- (void)setWorldOrientationValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  unsigned int v34;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v34 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v33 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  v26 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v24, 3, v25);
  objc_msgSend_floatValue(v26, v27, v28, v29);
  objc_msgSend_setWorldOrientation_(self, v30, v31, v32, COERCE_DOUBLE(__PAIR64__(v33, v34)));
}

- (id)eulerAnglesValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_eulerAngles(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_eulerAngles(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_eulerAngles(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setEulerAnglesValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v28 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v27 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  objc_msgSend_setEulerAngles_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)scaleValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_scale(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_scale(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_scale(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setScaleValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v28 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v27 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  objc_msgSend_setScale_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)worldPositionValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldPosition(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldPosition(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldPosition(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)setWorldPositionValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v28 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v27 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  objc_msgSend_setWorldPosition_(self, v24, v25, v26, COERCE_DOUBLE(__PAIR64__(v27, v28)));
}

- (id)pivotValue
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
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  double v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  double v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  double v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  double v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  double v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  double v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  double v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  int v135;
  double v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  _QWORD v142[17];

  v142[16] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, a2, v2, v3);
  v142[0] = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v10, v11, v12);
  LODWORD(v13) = HIDWORD(v13);
  v142[1] = objc_msgSend_numberWithFloat_(v9, v14, v15, v16, v13);
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v18, v19, v20);
  LODWORD(v22) = v21;
  v142[2] = objc_msgSend_numberWithFloat_(v17, v23, v24, v25, v22);
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v27, v28, v29);
  LODWORD(v31) = v30;
  v142[3] = objc_msgSend_numberWithFloat_(v26, v32, v33, v34, v31);
  v35 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v36, v37, v38);
  v142[4] = objc_msgSend_numberWithFloat_(v35, v39, v40, v41, v42);
  v43 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v44, v45, v46);
  LODWORD(v48) = v47;
  v142[5] = objc_msgSend_numberWithFloat_(v43, v49, v50, v51, v48);
  v52 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v53, v54, v55);
  LODWORD(v57) = v56;
  v142[6] = objc_msgSend_numberWithFloat_(v52, v58, v59, v60, v57);
  v61 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v62, v63, v64);
  LODWORD(v66) = v65;
  v142[7] = objc_msgSend_numberWithFloat_(v61, v67, v68, v69, v66);
  v70 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v71, v72, v73);
  v142[8] = objc_msgSend_numberWithFloat_(v70, v74, v75, v76, v77);
  v78 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v79, v80, v81);
  LODWORD(v83) = v82;
  v142[9] = objc_msgSend_numberWithFloat_(v78, v84, v85, v86, v83);
  v87 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v88, v89, v90);
  LODWORD(v92) = v91;
  v142[10] = objc_msgSend_numberWithFloat_(v87, v93, v94, v95, v92);
  v96 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v97, v98, v99);
  LODWORD(v101) = v100;
  v142[11] = objc_msgSend_numberWithFloat_(v96, v102, v103, v104, v101);
  v105 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v106, v107, v108);
  v142[12] = objc_msgSend_numberWithFloat_(v105, v109, v110, v111, v112);
  v113 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v114, v115, v116);
  LODWORD(v118) = v117;
  v142[13] = objc_msgSend_numberWithFloat_(v113, v119, v120, v121, v118);
  v122 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v123, v124, v125);
  LODWORD(v127) = v126;
  v142[14] = objc_msgSend_numberWithFloat_(v122, v128, v129, v130, v127);
  v131 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_pivot(self, v132, v133, v134);
  LODWORD(v136) = v135;
  v142[15] = objc_msgSend_numberWithFloat_(v131, v137, v138, v139, v136);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v140, (uint64_t)v142, 16);
}

- (void)setPivotValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  unsigned int v115;
  double v116;
  unsigned int v117;
  unsigned int v118;
  double v119;
  unsigned int v120;
  double v121;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v120 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v117 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  v26 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v24, 3, v25);
  objc_msgSend_floatValue(v26, v27, v28, v29);
  v121 = COERCE_DOUBLE(__PAIR64__(v117, v120));
  v32 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v30, 4, v31);
  objc_msgSend_floatValue(v32, v33, v34, v35);
  v118 = v36;
  v39 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v37, 5, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);
  v114 = v43;
  v46 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v44, 6, v45);
  objc_msgSend_floatValue(v46, v47, v48, v49);
  v52 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v50, 7, v51);
  objc_msgSend_floatValue(v52, v53, v54, v55);
  v119 = COERCE_DOUBLE(__PAIR64__(v114, v118));
  v58 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v56, 8, v57);
  objc_msgSend_floatValue(v58, v59, v60, v61);
  v115 = v62;
  v65 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v63, 9, v64);
  objc_msgSend_floatValue(v65, v66, v67, v68);
  v112 = v69;
  v72 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v70, 10, v71);
  objc_msgSend_floatValue(v72, v73, v74, v75);
  v78 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v76, 11, v77);
  objc_msgSend_floatValue(v78, v79, v80, v81);
  v116 = COERCE_DOUBLE(__PAIR64__(v112, v115));
  v84 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v82, 12, v83);
  objc_msgSend_floatValue(v84, v85, v86, v87);
  v113 = v88;
  v91 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v89, 13, v90);
  objc_msgSend_floatValue(v91, v92, v93, v94);
  v111 = v95;
  v98 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v96, 14, v97);
  objc_msgSend_floatValue(v98, v99, v100, v101);
  v104 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v102, 15, v103);
  objc_msgSend_floatValue(v104, v105, v106, v107);
  objc_msgSend_setPivot_(self, v108, v109, v110, v121, v119, v116, COERCE_DOUBLE(__PAIR64__(v111, v113)));
}

- (id)worldTransformValue
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
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  double v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  double v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  double v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  double v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  double v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  double v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  double v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  double v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  double v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  int v135;
  double v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  _QWORD v142[17];

  v142[16] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, a2, v2, v3);
  v142[0] = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v10, v11, v12);
  LODWORD(v13) = HIDWORD(v13);
  v142[1] = objc_msgSend_numberWithFloat_(v9, v14, v15, v16, v13);
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v18, v19, v20);
  LODWORD(v22) = v21;
  v142[2] = objc_msgSend_numberWithFloat_(v17, v23, v24, v25, v22);
  v26 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v27, v28, v29);
  LODWORD(v31) = v30;
  v142[3] = objc_msgSend_numberWithFloat_(v26, v32, v33, v34, v31);
  v35 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v36, v37, v38);
  v142[4] = objc_msgSend_numberWithFloat_(v35, v39, v40, v41, v42);
  v43 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v44, v45, v46);
  LODWORD(v48) = v47;
  v142[5] = objc_msgSend_numberWithFloat_(v43, v49, v50, v51, v48);
  v52 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v53, v54, v55);
  LODWORD(v57) = v56;
  v142[6] = objc_msgSend_numberWithFloat_(v52, v58, v59, v60, v57);
  v61 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v62, v63, v64);
  LODWORD(v66) = v65;
  v142[7] = objc_msgSend_numberWithFloat_(v61, v67, v68, v69, v66);
  v70 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v71, v72, v73);
  v142[8] = objc_msgSend_numberWithFloat_(v70, v74, v75, v76, v77);
  v78 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v79, v80, v81);
  LODWORD(v83) = v82;
  v142[9] = objc_msgSend_numberWithFloat_(v78, v84, v85, v86, v83);
  v87 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v88, v89, v90);
  LODWORD(v92) = v91;
  v142[10] = objc_msgSend_numberWithFloat_(v87, v93, v94, v95, v92);
  v96 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v97, v98, v99);
  LODWORD(v101) = v100;
  v142[11] = objc_msgSend_numberWithFloat_(v96, v102, v103, v104, v101);
  v105 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v106, v107, v108);
  v142[12] = objc_msgSend_numberWithFloat_(v105, v109, v110, v111, v112);
  v113 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v114, v115, v116);
  LODWORD(v118) = v117;
  v142[13] = objc_msgSend_numberWithFloat_(v113, v119, v120, v121, v118);
  v122 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v123, v124, v125);
  LODWORD(v127) = v126;
  v142[14] = objc_msgSend_numberWithFloat_(v122, v128, v129, v130, v127);
  v131 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldTransform(self, v132, v133, v134);
  LODWORD(v136) = v135;
  v142[15] = objc_msgSend_numberWithFloat_(v131, v137, v138, v139, v136);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v140, (uint64_t)v142, 16);
}

- (void)setWorldTransformValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  unsigned int v111;
  unsigned int v112;
  unsigned int v113;
  unsigned int v114;
  unsigned int v115;
  double v116;
  unsigned int v117;
  unsigned int v118;
  double v119;
  unsigned int v120;
  double v121;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v120 = v10;
  v13 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v11, 1, v12);
  objc_msgSend_floatValue(v13, v14, v15, v16);
  v117 = v17;
  v20 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v18, 2, v19);
  objc_msgSend_floatValue(v20, v21, v22, v23);
  v26 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v24, 3, v25);
  objc_msgSend_floatValue(v26, v27, v28, v29);
  v121 = COERCE_DOUBLE(__PAIR64__(v117, v120));
  v32 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v30, 4, v31);
  objc_msgSend_floatValue(v32, v33, v34, v35);
  v118 = v36;
  v39 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v37, 5, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);
  v114 = v43;
  v46 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v44, 6, v45);
  objc_msgSend_floatValue(v46, v47, v48, v49);
  v52 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v50, 7, v51);
  objc_msgSend_floatValue(v52, v53, v54, v55);
  v119 = COERCE_DOUBLE(__PAIR64__(v114, v118));
  v58 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v56, 8, v57);
  objc_msgSend_floatValue(v58, v59, v60, v61);
  v115 = v62;
  v65 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v63, 9, v64);
  objc_msgSend_floatValue(v65, v66, v67, v68);
  v112 = v69;
  v72 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v70, 10, v71);
  objc_msgSend_floatValue(v72, v73, v74, v75);
  v78 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v76, 11, v77);
  objc_msgSend_floatValue(v78, v79, v80, v81);
  v116 = COERCE_DOUBLE(__PAIR64__(v112, v115));
  v84 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v82, 12, v83);
  objc_msgSend_floatValue(v84, v85, v86, v87);
  v113 = v88;
  v91 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v89, 13, v90);
  objc_msgSend_floatValue(v91, v92, v93, v94);
  v111 = v95;
  v98 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v96, 14, v97);
  objc_msgSend_floatValue(v98, v99, v100, v101);
  v104 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v102, 15, v103);
  objc_msgSend_floatValue(v104, v105, v106, v107);
  objc_msgSend_setWorldTransform_(self, v108, v109, v110, v121, v119, v116, COERCE_DOUBLE(__PAIR64__(v111, v113)));
}

- (id)convertPositionValue:(id)a3 toNode:(id)a4
{
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  int v81;
  double v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  _QWORD v94[4];

  v94[3] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v8, v9, v10, v11);
  v91 = v12;
  v15 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  v88 = v19;
  v22 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  objc_msgSend_convertPosition_toNode_(self, v26, (uint64_t)a4, v27, COERCE_DOUBLE(__PAIR64__(v88, v91)));
  v94[0] = objc_msgSend_numberWithFloat_(v7, v28, v29, v30);
  v31 = (void *)MEMORY[0x1E0CB37E8];
  v34 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v32, 0, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  v92 = v38;
  v41 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v39, 1, v40);
  objc_msgSend_floatValue(v41, v42, v43, v44);
  v89 = v45;
  v48 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v46, 2, v47);
  objc_msgSend_floatValue(v48, v49, v50, v51);
  objc_msgSend_convertPosition_toNode_(self, v52, (uint64_t)a4, v53, COERCE_DOUBLE(__PAIR64__(v89, v92)));
  LODWORD(v54) = HIDWORD(v54);
  v94[1] = objc_msgSend_numberWithFloat_(v31, v55, v56, v57, v54);
  v58 = (void *)MEMORY[0x1E0CB37E8];
  v61 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v59, 0, v60);
  objc_msgSend_floatValue(v61, v62, v63, v64);
  v93 = v65;
  v68 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v66, 1, v67);
  objc_msgSend_floatValue(v68, v69, v70, v71);
  v90 = v72;
  v75 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v73, 2, v74);
  objc_msgSend_floatValue(v75, v76, v77, v78);
  objc_msgSend_convertPosition_toNode_(self, v79, (uint64_t)a4, v80, COERCE_DOUBLE(__PAIR64__(v90, v93)));
  LODWORD(v82) = v81;
  v94[2] = objc_msgSend_numberWithFloat_(v58, v83, v84, v85, v82);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v86, (uint64_t)v94, 3);
}

- (id)convertPositionValue:(id)a3 fromNode:(id)a4
{
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  int v81;
  double v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  _QWORD v94[4];

  v94[3] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v8, v9, v10, v11);
  v91 = v12;
  v15 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  v88 = v19;
  v22 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  objc_msgSend_convertPosition_fromNode_(self, v26, (uint64_t)a4, v27, COERCE_DOUBLE(__PAIR64__(v88, v91)));
  v94[0] = objc_msgSend_numberWithFloat_(v7, v28, v29, v30);
  v31 = (void *)MEMORY[0x1E0CB37E8];
  v34 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v32, 0, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  v92 = v38;
  v41 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v39, 1, v40);
  objc_msgSend_floatValue(v41, v42, v43, v44);
  v89 = v45;
  v48 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v46, 2, v47);
  objc_msgSend_floatValue(v48, v49, v50, v51);
  objc_msgSend_convertPosition_fromNode_(self, v52, (uint64_t)a4, v53, COERCE_DOUBLE(__PAIR64__(v89, v92)));
  LODWORD(v54) = HIDWORD(v54);
  v94[1] = objc_msgSend_numberWithFloat_(v31, v55, v56, v57, v54);
  v58 = (void *)MEMORY[0x1E0CB37E8];
  v61 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v59, 0, v60);
  objc_msgSend_floatValue(v61, v62, v63, v64);
  v93 = v65;
  v68 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v66, 1, v67);
  objc_msgSend_floatValue(v68, v69, v70, v71);
  v90 = v72;
  v75 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v73, 2, v74);
  objc_msgSend_floatValue(v75, v76, v77, v78);
  objc_msgSend_convertPosition_fromNode_(self, v79, (uint64_t)a4, v80, COERCE_DOUBLE(__PAIR64__(v90, v93)));
  LODWORD(v82) = v81;
  v94[2] = objc_msgSend_numberWithFloat_(v58, v83, v84, v85, v82);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v86, (uint64_t)v94, 3);
}

- (id)convertVectorValue:(id)a3 toNode:(id)a4
{
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  int v81;
  double v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  _QWORD v94[4];

  v94[3] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v8, v9, v10, v11);
  v91 = v12;
  v15 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  v88 = v19;
  v22 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  objc_msgSend_convertVector_toNode_(self, v26, (uint64_t)a4, v27, COERCE_DOUBLE(__PAIR64__(v88, v91)));
  v94[0] = objc_msgSend_numberWithFloat_(v7, v28, v29, v30);
  v31 = (void *)MEMORY[0x1E0CB37E8];
  v34 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v32, 0, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  v92 = v38;
  v41 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v39, 1, v40);
  objc_msgSend_floatValue(v41, v42, v43, v44);
  v89 = v45;
  v48 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v46, 2, v47);
  objc_msgSend_floatValue(v48, v49, v50, v51);
  objc_msgSend_convertVector_toNode_(self, v52, (uint64_t)a4, v53, COERCE_DOUBLE(__PAIR64__(v89, v92)));
  LODWORD(v54) = HIDWORD(v54);
  v94[1] = objc_msgSend_numberWithFloat_(v31, v55, v56, v57, v54);
  v58 = (void *)MEMORY[0x1E0CB37E8];
  v61 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v59, 0, v60);
  objc_msgSend_floatValue(v61, v62, v63, v64);
  v93 = v65;
  v68 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v66, 1, v67);
  objc_msgSend_floatValue(v68, v69, v70, v71);
  v90 = v72;
  v75 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v73, 2, v74);
  objc_msgSend_floatValue(v75, v76, v77, v78);
  objc_msgSend_convertVector_toNode_(self, v79, (uint64_t)a4, v80, COERCE_DOUBLE(__PAIR64__(v90, v93)));
  LODWORD(v82) = v81;
  v94[2] = objc_msgSend_numberWithFloat_(v58, v83, v84, v85, v82);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v86, (uint64_t)v94, 3);
}

- (id)convertVectorValue:(id)a3 fromNode:(id)a4
{
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  int v81;
  double v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  unsigned int v88;
  unsigned int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  _QWORD v94[4];

  v94[3] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v8, v9, v10, v11);
  v91 = v12;
  v15 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  v88 = v19;
  v22 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  objc_msgSend_convertVector_fromNode_(self, v26, (uint64_t)a4, v27, COERCE_DOUBLE(__PAIR64__(v88, v91)));
  v94[0] = objc_msgSend_numberWithFloat_(v7, v28, v29, v30);
  v31 = (void *)MEMORY[0x1E0CB37E8];
  v34 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v32, 0, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  v92 = v38;
  v41 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v39, 1, v40);
  objc_msgSend_floatValue(v41, v42, v43, v44);
  v89 = v45;
  v48 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v46, 2, v47);
  objc_msgSend_floatValue(v48, v49, v50, v51);
  objc_msgSend_convertVector_fromNode_(self, v52, (uint64_t)a4, v53, COERCE_DOUBLE(__PAIR64__(v89, v92)));
  LODWORD(v54) = HIDWORD(v54);
  v94[1] = objc_msgSend_numberWithFloat_(v31, v55, v56, v57, v54);
  v58 = (void *)MEMORY[0x1E0CB37E8];
  v61 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v59, 0, v60);
  objc_msgSend_floatValue(v61, v62, v63, v64);
  v93 = v65;
  v68 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v66, 1, v67);
  objc_msgSend_floatValue(v68, v69, v70, v71);
  v90 = v72;
  v75 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v73, 2, v74);
  objc_msgSend_floatValue(v75, v76, v77, v78);
  objc_msgSend_convertVector_fromNode_(self, v79, (uint64_t)a4, v80, COERCE_DOUBLE(__PAIR64__(v90, v93)));
  LODWORD(v82) = v81;
  v94[2] = objc_msgSend_numberWithFloat_(v58, v83, v84, v85, v82);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v86, (uint64_t)v94, 3);
}

- (id)convertTransformValue:(id)a3 toNode:(id)a4
{
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  unsigned int v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  int v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  int v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  int v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  unsigned int v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  unsigned int v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  unsigned int v207;
  const char *v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  double v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  int v233;
  const char *v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  int v240;
  const char *v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  const char *v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  int v259;
  const char *v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  int v266;
  const char *v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  void *v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  int v285;
  const char *v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  unsigned int v292;
  const char *v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  void *v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  unsigned int v311;
  const char *v312;
  uint64_t v313;
  void *v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  unsigned int v318;
  const char *v319;
  uint64_t v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  int v333;
  double v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  int v345;
  const char *v346;
  uint64_t v347;
  void *v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  int v352;
  const char *v353;
  uint64_t v354;
  void *v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  const char *v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  const char *v365;
  uint64_t v366;
  void *v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  int v371;
  const char *v372;
  uint64_t v373;
  void *v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  int v378;
  const char *v379;
  uint64_t v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  void *v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  const char *v391;
  uint64_t v392;
  void *v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  int v397;
  const char *v398;
  uint64_t v399;
  void *v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  unsigned int v404;
  const char *v405;
  uint64_t v406;
  void *v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  const char *v411;
  uint64_t v412;
  void *v413;
  const char *v414;
  uint64_t v415;
  uint64_t v416;
  const char *v417;
  uint64_t v418;
  void *v419;
  const char *v420;
  uint64_t v421;
  uint64_t v422;
  unsigned int v423;
  const char *v424;
  uint64_t v425;
  void *v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  unsigned int v430;
  const char *v431;
  uint64_t v432;
  void *v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  const char *v437;
  uint64_t v438;
  void *v439;
  const char *v440;
  uint64_t v441;
  uint64_t v442;
  const char *v443;
  uint64_t v444;
  int v445;
  double v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  void *v450;
  const char *v451;
  uint64_t v452;
  void *v453;
  const char *v454;
  uint64_t v455;
  uint64_t v456;
  int v457;
  const char *v458;
  uint64_t v459;
  void *v460;
  const char *v461;
  uint64_t v462;
  uint64_t v463;
  int v464;
  const char *v465;
  uint64_t v466;
  void *v467;
  const char *v468;
  uint64_t v469;
  uint64_t v470;
  const char *v471;
  uint64_t v472;
  void *v473;
  const char *v474;
  uint64_t v475;
  uint64_t v476;
  const char *v477;
  uint64_t v478;
  void *v479;
  const char *v480;
  uint64_t v481;
  uint64_t v482;
  int v483;
  const char *v484;
  uint64_t v485;
  void *v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  int v490;
  const char *v491;
  uint64_t v492;
  void *v493;
  const char *v494;
  uint64_t v495;
  uint64_t v496;
  const char *v497;
  uint64_t v498;
  void *v499;
  const char *v500;
  uint64_t v501;
  uint64_t v502;
  const char *v503;
  uint64_t v504;
  void *v505;
  const char *v506;
  uint64_t v507;
  uint64_t v508;
  int v509;
  const char *v510;
  uint64_t v511;
  void *v512;
  const char *v513;
  uint64_t v514;
  uint64_t v515;
  unsigned int v516;
  const char *v517;
  uint64_t v518;
  void *v519;
  const char *v520;
  uint64_t v521;
  uint64_t v522;
  const char *v523;
  uint64_t v524;
  void *v525;
  const char *v526;
  uint64_t v527;
  uint64_t v528;
  const char *v529;
  uint64_t v530;
  void *v531;
  const char *v532;
  uint64_t v533;
  uint64_t v534;
  unsigned int v535;
  const char *v536;
  uint64_t v537;
  void *v538;
  const char *v539;
  uint64_t v540;
  uint64_t v541;
  unsigned int v542;
  const char *v543;
  uint64_t v544;
  void *v545;
  const char *v546;
  uint64_t v547;
  uint64_t v548;
  const char *v549;
  uint64_t v550;
  void *v551;
  const char *v552;
  uint64_t v553;
  uint64_t v554;
  const char *v555;
  uint64_t v556;
  const char *v557;
  uint64_t v558;
  uint64_t v559;
  double v560;
  void *v561;
  const char *v562;
  uint64_t v563;
  void *v564;
  const char *v565;
  uint64_t v566;
  uint64_t v567;
  int v568;
  const char *v569;
  uint64_t v570;
  void *v571;
  const char *v572;
  uint64_t v573;
  uint64_t v574;
  int v575;
  const char *v576;
  uint64_t v577;
  void *v578;
  const char *v579;
  uint64_t v580;
  uint64_t v581;
  const char *v582;
  uint64_t v583;
  void *v584;
  const char *v585;
  uint64_t v586;
  uint64_t v587;
  const char *v588;
  uint64_t v589;
  void *v590;
  const char *v591;
  uint64_t v592;
  uint64_t v593;
  int v594;
  const char *v595;
  uint64_t v596;
  void *v597;
  const char *v598;
  uint64_t v599;
  uint64_t v600;
  int v601;
  const char *v602;
  uint64_t v603;
  void *v604;
  const char *v605;
  uint64_t v606;
  uint64_t v607;
  const char *v608;
  uint64_t v609;
  void *v610;
  const char *v611;
  uint64_t v612;
  uint64_t v613;
  const char *v614;
  uint64_t v615;
  void *v616;
  const char *v617;
  uint64_t v618;
  uint64_t v619;
  int v620;
  const char *v621;
  uint64_t v622;
  void *v623;
  const char *v624;
  uint64_t v625;
  uint64_t v626;
  unsigned int v627;
  const char *v628;
  uint64_t v629;
  void *v630;
  const char *v631;
  uint64_t v632;
  uint64_t v633;
  const char *v634;
  uint64_t v635;
  void *v636;
  const char *v637;
  uint64_t v638;
  uint64_t v639;
  const char *v640;
  uint64_t v641;
  void *v642;
  const char *v643;
  uint64_t v644;
  uint64_t v645;
  unsigned int v646;
  const char *v647;
  uint64_t v648;
  void *v649;
  const char *v650;
  uint64_t v651;
  uint64_t v652;
  unsigned int v653;
  const char *v654;
  uint64_t v655;
  void *v656;
  const char *v657;
  uint64_t v658;
  uint64_t v659;
  const char *v660;
  uint64_t v661;
  void *v662;
  const char *v663;
  uint64_t v664;
  uint64_t v665;
  const char *v666;
  uint64_t v667;
  int v668;
  double v669;
  const char *v670;
  uint64_t v671;
  uint64_t v672;
  void *v673;
  const char *v674;
  uint64_t v675;
  void *v676;
  const char *v677;
  uint64_t v678;
  uint64_t v679;
  int v680;
  const char *v681;
  uint64_t v682;
  void *v683;
  const char *v684;
  uint64_t v685;
  uint64_t v686;
  int v687;
  const char *v688;
  uint64_t v689;
  void *v690;
  const char *v691;
  uint64_t v692;
  uint64_t v693;
  const char *v694;
  uint64_t v695;
  void *v696;
  const char *v697;
  uint64_t v698;
  uint64_t v699;
  const char *v700;
  uint64_t v701;
  void *v702;
  const char *v703;
  uint64_t v704;
  uint64_t v705;
  int v706;
  const char *v707;
  uint64_t v708;
  void *v709;
  const char *v710;
  uint64_t v711;
  uint64_t v712;
  int v713;
  const char *v714;
  uint64_t v715;
  void *v716;
  const char *v717;
  uint64_t v718;
  uint64_t v719;
  const char *v720;
  uint64_t v721;
  void *v722;
  const char *v723;
  uint64_t v724;
  uint64_t v725;
  const char *v726;
  uint64_t v727;
  void *v728;
  const char *v729;
  uint64_t v730;
  uint64_t v731;
  int v732;
  const char *v733;
  uint64_t v734;
  void *v735;
  const char *v736;
  uint64_t v737;
  uint64_t v738;
  unsigned int v739;
  const char *v740;
  uint64_t v741;
  void *v742;
  const char *v743;
  uint64_t v744;
  uint64_t v745;
  const char *v746;
  uint64_t v747;
  void *v748;
  const char *v749;
  uint64_t v750;
  uint64_t v751;
  const char *v752;
  uint64_t v753;
  void *v754;
  const char *v755;
  uint64_t v756;
  uint64_t v757;
  unsigned int v758;
  const char *v759;
  uint64_t v760;
  void *v761;
  const char *v762;
  uint64_t v763;
  uint64_t v764;
  unsigned int v765;
  const char *v766;
  uint64_t v767;
  void *v768;
  const char *v769;
  uint64_t v770;
  uint64_t v771;
  const char *v772;
  uint64_t v773;
  void *v774;
  const char *v775;
  uint64_t v776;
  uint64_t v777;
  const char *v778;
  uint64_t v779;
  int v780;
  double v781;
  const char *v782;
  uint64_t v783;
  uint64_t v784;
  void *v785;
  const char *v786;
  uint64_t v787;
  void *v788;
  const char *v789;
  uint64_t v790;
  uint64_t v791;
  int v792;
  const char *v793;
  uint64_t v794;
  void *v795;
  const char *v796;
  uint64_t v797;
  uint64_t v798;
  int v799;
  const char *v800;
  uint64_t v801;
  void *v802;
  const char *v803;
  uint64_t v804;
  uint64_t v805;
  const char *v806;
  uint64_t v807;
  void *v808;
  const char *v809;
  uint64_t v810;
  uint64_t v811;
  const char *v812;
  uint64_t v813;
  void *v814;
  const char *v815;
  uint64_t v816;
  uint64_t v817;
  int v818;
  const char *v819;
  uint64_t v820;
  void *v821;
  const char *v822;
  uint64_t v823;
  uint64_t v824;
  int v825;
  const char *v826;
  uint64_t v827;
  void *v828;
  const char *v829;
  uint64_t v830;
  uint64_t v831;
  const char *v832;
  uint64_t v833;
  void *v834;
  const char *v835;
  uint64_t v836;
  uint64_t v837;
  const char *v838;
  uint64_t v839;
  void *v840;
  const char *v841;
  uint64_t v842;
  uint64_t v843;
  int v844;
  const char *v845;
  uint64_t v846;
  void *v847;
  const char *v848;
  uint64_t v849;
  uint64_t v850;
  unsigned int v851;
  const char *v852;
  uint64_t v853;
  void *v854;
  const char *v855;
  uint64_t v856;
  uint64_t v857;
  const char *v858;
  uint64_t v859;
  void *v860;
  const char *v861;
  uint64_t v862;
  uint64_t v863;
  const char *v864;
  uint64_t v865;
  void *v866;
  const char *v867;
  uint64_t v868;
  uint64_t v869;
  unsigned int v870;
  const char *v871;
  uint64_t v872;
  void *v873;
  const char *v874;
  uint64_t v875;
  uint64_t v876;
  unsigned int v877;
  const char *v878;
  uint64_t v879;
  void *v880;
  const char *v881;
  uint64_t v882;
  uint64_t v883;
  const char *v884;
  uint64_t v885;
  void *v886;
  const char *v887;
  uint64_t v888;
  uint64_t v889;
  const char *v890;
  uint64_t v891;
  int v892;
  double v893;
  const char *v894;
  uint64_t v895;
  uint64_t v896;
  void *v897;
  const char *v898;
  uint64_t v899;
  void *v900;
  const char *v901;
  uint64_t v902;
  uint64_t v903;
  int v904;
  const char *v905;
  uint64_t v906;
  void *v907;
  const char *v908;
  uint64_t v909;
  uint64_t v910;
  int v911;
  const char *v912;
  uint64_t v913;
  void *v914;
  const char *v915;
  uint64_t v916;
  uint64_t v917;
  const char *v918;
  uint64_t v919;
  void *v920;
  const char *v921;
  uint64_t v922;
  uint64_t v923;
  const char *v924;
  uint64_t v925;
  void *v926;
  const char *v927;
  uint64_t v928;
  uint64_t v929;
  int v930;
  const char *v931;
  uint64_t v932;
  void *v933;
  const char *v934;
  uint64_t v935;
  uint64_t v936;
  int v937;
  const char *v938;
  uint64_t v939;
  void *v940;
  const char *v941;
  uint64_t v942;
  uint64_t v943;
  const char *v944;
  uint64_t v945;
  void *v946;
  const char *v947;
  uint64_t v948;
  uint64_t v949;
  const char *v950;
  uint64_t v951;
  void *v952;
  const char *v953;
  uint64_t v954;
  uint64_t v955;
  int v956;
  const char *v957;
  uint64_t v958;
  void *v959;
  const char *v960;
  uint64_t v961;
  uint64_t v962;
  unsigned int v963;
  const char *v964;
  uint64_t v965;
  void *v966;
  const char *v967;
  uint64_t v968;
  uint64_t v969;
  const char *v970;
  uint64_t v971;
  void *v972;
  const char *v973;
  uint64_t v974;
  uint64_t v975;
  const char *v976;
  uint64_t v977;
  void *v978;
  const char *v979;
  uint64_t v980;
  uint64_t v981;
  unsigned int v982;
  const char *v983;
  uint64_t v984;
  void *v985;
  const char *v986;
  uint64_t v987;
  uint64_t v988;
  unsigned int v989;
  const char *v990;
  uint64_t v991;
  void *v992;
  const char *v993;
  uint64_t v994;
  uint64_t v995;
  const char *v996;
  uint64_t v997;
  void *v998;
  const char *v999;
  uint64_t v1000;
  uint64_t v1001;
  const char *v1002;
  uint64_t v1003;
  const char *v1004;
  uint64_t v1005;
  uint64_t v1006;
  double v1007;
  void *v1008;
  const char *v1009;
  uint64_t v1010;
  void *v1011;
  const char *v1012;
  uint64_t v1013;
  uint64_t v1014;
  int v1015;
  const char *v1016;
  uint64_t v1017;
  void *v1018;
  const char *v1019;
  uint64_t v1020;
  uint64_t v1021;
  int v1022;
  const char *v1023;
  uint64_t v1024;
  void *v1025;
  const char *v1026;
  uint64_t v1027;
  uint64_t v1028;
  const char *v1029;
  uint64_t v1030;
  void *v1031;
  const char *v1032;
  uint64_t v1033;
  uint64_t v1034;
  const char *v1035;
  uint64_t v1036;
  void *v1037;
  const char *v1038;
  uint64_t v1039;
  uint64_t v1040;
  int v1041;
  const char *v1042;
  uint64_t v1043;
  void *v1044;
  const char *v1045;
  uint64_t v1046;
  uint64_t v1047;
  int v1048;
  const char *v1049;
  uint64_t v1050;
  void *v1051;
  const char *v1052;
  uint64_t v1053;
  uint64_t v1054;
  const char *v1055;
  uint64_t v1056;
  void *v1057;
  const char *v1058;
  uint64_t v1059;
  uint64_t v1060;
  const char *v1061;
  uint64_t v1062;
  void *v1063;
  const char *v1064;
  uint64_t v1065;
  uint64_t v1066;
  int v1067;
  const char *v1068;
  uint64_t v1069;
  void *v1070;
  const char *v1071;
  uint64_t v1072;
  uint64_t v1073;
  unsigned int v1074;
  const char *v1075;
  uint64_t v1076;
  void *v1077;
  const char *v1078;
  uint64_t v1079;
  uint64_t v1080;
  const char *v1081;
  uint64_t v1082;
  void *v1083;
  const char *v1084;
  uint64_t v1085;
  uint64_t v1086;
  const char *v1087;
  uint64_t v1088;
  void *v1089;
  const char *v1090;
  uint64_t v1091;
  uint64_t v1092;
  unsigned int v1093;
  const char *v1094;
  uint64_t v1095;
  void *v1096;
  const char *v1097;
  uint64_t v1098;
  uint64_t v1099;
  unsigned int v1100;
  const char *v1101;
  uint64_t v1102;
  void *v1103;
  const char *v1104;
  uint64_t v1105;
  uint64_t v1106;
  const char *v1107;
  uint64_t v1108;
  void *v1109;
  const char *v1110;
  uint64_t v1111;
  uint64_t v1112;
  const char *v1113;
  uint64_t v1114;
  int v1115;
  double v1116;
  const char *v1117;
  uint64_t v1118;
  uint64_t v1119;
  void *v1120;
  const char *v1121;
  uint64_t v1122;
  void *v1123;
  const char *v1124;
  uint64_t v1125;
  uint64_t v1126;
  int v1127;
  const char *v1128;
  uint64_t v1129;
  void *v1130;
  const char *v1131;
  uint64_t v1132;
  uint64_t v1133;
  int v1134;
  const char *v1135;
  uint64_t v1136;
  void *v1137;
  const char *v1138;
  uint64_t v1139;
  uint64_t v1140;
  const char *v1141;
  uint64_t v1142;
  void *v1143;
  const char *v1144;
  uint64_t v1145;
  uint64_t v1146;
  const char *v1147;
  uint64_t v1148;
  void *v1149;
  const char *v1150;
  uint64_t v1151;
  uint64_t v1152;
  int v1153;
  const char *v1154;
  uint64_t v1155;
  void *v1156;
  const char *v1157;
  uint64_t v1158;
  uint64_t v1159;
  int v1160;
  const char *v1161;
  uint64_t v1162;
  void *v1163;
  const char *v1164;
  uint64_t v1165;
  uint64_t v1166;
  const char *v1167;
  uint64_t v1168;
  void *v1169;
  const char *v1170;
  uint64_t v1171;
  uint64_t v1172;
  const char *v1173;
  uint64_t v1174;
  void *v1175;
  const char *v1176;
  uint64_t v1177;
  uint64_t v1178;
  int v1179;
  const char *v1180;
  uint64_t v1181;
  void *v1182;
  const char *v1183;
  uint64_t v1184;
  uint64_t v1185;
  unsigned int v1186;
  const char *v1187;
  uint64_t v1188;
  void *v1189;
  const char *v1190;
  uint64_t v1191;
  uint64_t v1192;
  const char *v1193;
  uint64_t v1194;
  void *v1195;
  const char *v1196;
  uint64_t v1197;
  uint64_t v1198;
  const char *v1199;
  uint64_t v1200;
  void *v1201;
  const char *v1202;
  uint64_t v1203;
  uint64_t v1204;
  unsigned int v1205;
  const char *v1206;
  uint64_t v1207;
  void *v1208;
  const char *v1209;
  uint64_t v1210;
  uint64_t v1211;
  unsigned int v1212;
  const char *v1213;
  uint64_t v1214;
  void *v1215;
  const char *v1216;
  uint64_t v1217;
  uint64_t v1218;
  const char *v1219;
  uint64_t v1220;
  void *v1221;
  const char *v1222;
  uint64_t v1223;
  uint64_t v1224;
  const char *v1225;
  uint64_t v1226;
  int v1227;
  double v1228;
  const char *v1229;
  uint64_t v1230;
  uint64_t v1231;
  void *v1232;
  const char *v1233;
  uint64_t v1234;
  void *v1235;
  const char *v1236;
  uint64_t v1237;
  uint64_t v1238;
  int v1239;
  const char *v1240;
  uint64_t v1241;
  void *v1242;
  const char *v1243;
  uint64_t v1244;
  uint64_t v1245;
  int v1246;
  const char *v1247;
  uint64_t v1248;
  void *v1249;
  const char *v1250;
  uint64_t v1251;
  uint64_t v1252;
  const char *v1253;
  uint64_t v1254;
  void *v1255;
  const char *v1256;
  uint64_t v1257;
  uint64_t v1258;
  const char *v1259;
  uint64_t v1260;
  void *v1261;
  const char *v1262;
  uint64_t v1263;
  uint64_t v1264;
  int v1265;
  const char *v1266;
  uint64_t v1267;
  void *v1268;
  const char *v1269;
  uint64_t v1270;
  uint64_t v1271;
  int v1272;
  const char *v1273;
  uint64_t v1274;
  void *v1275;
  const char *v1276;
  uint64_t v1277;
  uint64_t v1278;
  const char *v1279;
  uint64_t v1280;
  void *v1281;
  const char *v1282;
  uint64_t v1283;
  uint64_t v1284;
  const char *v1285;
  uint64_t v1286;
  void *v1287;
  const char *v1288;
  uint64_t v1289;
  uint64_t v1290;
  int v1291;
  const char *v1292;
  uint64_t v1293;
  void *v1294;
  const char *v1295;
  uint64_t v1296;
  uint64_t v1297;
  unsigned int v1298;
  const char *v1299;
  uint64_t v1300;
  void *v1301;
  const char *v1302;
  uint64_t v1303;
  uint64_t v1304;
  const char *v1305;
  uint64_t v1306;
  void *v1307;
  const char *v1308;
  uint64_t v1309;
  uint64_t v1310;
  const char *v1311;
  uint64_t v1312;
  void *v1313;
  const char *v1314;
  uint64_t v1315;
  uint64_t v1316;
  unsigned int v1317;
  const char *v1318;
  uint64_t v1319;
  void *v1320;
  const char *v1321;
  uint64_t v1322;
  uint64_t v1323;
  unsigned int v1324;
  const char *v1325;
  uint64_t v1326;
  void *v1327;
  const char *v1328;
  uint64_t v1329;
  uint64_t v1330;
  const char *v1331;
  uint64_t v1332;
  void *v1333;
  const char *v1334;
  uint64_t v1335;
  uint64_t v1336;
  const char *v1337;
  uint64_t v1338;
  int v1339;
  double v1340;
  const char *v1341;
  uint64_t v1342;
  uint64_t v1343;
  void *v1344;
  const char *v1345;
  uint64_t v1346;
  void *v1347;
  const char *v1348;
  uint64_t v1349;
  uint64_t v1350;
  int v1351;
  const char *v1352;
  uint64_t v1353;
  void *v1354;
  const char *v1355;
  uint64_t v1356;
  uint64_t v1357;
  int v1358;
  const char *v1359;
  uint64_t v1360;
  void *v1361;
  const char *v1362;
  uint64_t v1363;
  uint64_t v1364;
  const char *v1365;
  uint64_t v1366;
  void *v1367;
  const char *v1368;
  uint64_t v1369;
  uint64_t v1370;
  const char *v1371;
  uint64_t v1372;
  void *v1373;
  const char *v1374;
  uint64_t v1375;
  uint64_t v1376;
  int v1377;
  const char *v1378;
  uint64_t v1379;
  void *v1380;
  const char *v1381;
  uint64_t v1382;
  uint64_t v1383;
  int v1384;
  const char *v1385;
  uint64_t v1386;
  void *v1387;
  const char *v1388;
  uint64_t v1389;
  uint64_t v1390;
  const char *v1391;
  uint64_t v1392;
  void *v1393;
  const char *v1394;
  uint64_t v1395;
  uint64_t v1396;
  const char *v1397;
  uint64_t v1398;
  void *v1399;
  const char *v1400;
  uint64_t v1401;
  uint64_t v1402;
  int v1403;
  const char *v1404;
  uint64_t v1405;
  void *v1406;
  const char *v1407;
  uint64_t v1408;
  uint64_t v1409;
  unsigned int v1410;
  const char *v1411;
  uint64_t v1412;
  void *v1413;
  const char *v1414;
  uint64_t v1415;
  uint64_t v1416;
  const char *v1417;
  uint64_t v1418;
  void *v1419;
  const char *v1420;
  uint64_t v1421;
  uint64_t v1422;
  const char *v1423;
  uint64_t v1424;
  void *v1425;
  const char *v1426;
  uint64_t v1427;
  uint64_t v1428;
  unsigned int v1429;
  const char *v1430;
  uint64_t v1431;
  void *v1432;
  const char *v1433;
  uint64_t v1434;
  uint64_t v1435;
  unsigned int v1436;
  const char *v1437;
  uint64_t v1438;
  void *v1439;
  const char *v1440;
  uint64_t v1441;
  uint64_t v1442;
  const char *v1443;
  uint64_t v1444;
  void *v1445;
  const char *v1446;
  uint64_t v1447;
  uint64_t v1448;
  const char *v1449;
  uint64_t v1450;
  const char *v1451;
  uint64_t v1452;
  uint64_t v1453;
  double v1454;
  void *v1455;
  const char *v1456;
  uint64_t v1457;
  void *v1458;
  const char *v1459;
  uint64_t v1460;
  uint64_t v1461;
  int v1462;
  const char *v1463;
  uint64_t v1464;
  void *v1465;
  const char *v1466;
  uint64_t v1467;
  uint64_t v1468;
  int v1469;
  const char *v1470;
  uint64_t v1471;
  void *v1472;
  const char *v1473;
  uint64_t v1474;
  uint64_t v1475;
  const char *v1476;
  uint64_t v1477;
  void *v1478;
  const char *v1479;
  uint64_t v1480;
  uint64_t v1481;
  const char *v1482;
  uint64_t v1483;
  void *v1484;
  const char *v1485;
  uint64_t v1486;
  uint64_t v1487;
  int v1488;
  const char *v1489;
  uint64_t v1490;
  void *v1491;
  const char *v1492;
  uint64_t v1493;
  uint64_t v1494;
  int v1495;
  const char *v1496;
  uint64_t v1497;
  void *v1498;
  const char *v1499;
  uint64_t v1500;
  uint64_t v1501;
  const char *v1502;
  uint64_t v1503;
  void *v1504;
  const char *v1505;
  uint64_t v1506;
  uint64_t v1507;
  const char *v1508;
  uint64_t v1509;
  void *v1510;
  const char *v1511;
  uint64_t v1512;
  uint64_t v1513;
  int v1514;
  const char *v1515;
  uint64_t v1516;
  void *v1517;
  const char *v1518;
  uint64_t v1519;
  uint64_t v1520;
  unsigned int v1521;
  const char *v1522;
  uint64_t v1523;
  void *v1524;
  const char *v1525;
  uint64_t v1526;
  uint64_t v1527;
  const char *v1528;
  uint64_t v1529;
  void *v1530;
  const char *v1531;
  uint64_t v1532;
  uint64_t v1533;
  const char *v1534;
  uint64_t v1535;
  void *v1536;
  const char *v1537;
  uint64_t v1538;
  uint64_t v1539;
  unsigned int v1540;
  const char *v1541;
  uint64_t v1542;
  void *v1543;
  const char *v1544;
  uint64_t v1545;
  uint64_t v1546;
  unsigned int v1547;
  const char *v1548;
  uint64_t v1549;
  void *v1550;
  const char *v1551;
  uint64_t v1552;
  uint64_t v1553;
  const char *v1554;
  uint64_t v1555;
  void *v1556;
  const char *v1557;
  uint64_t v1558;
  uint64_t v1559;
  const char *v1560;
  uint64_t v1561;
  int v1562;
  double v1563;
  const char *v1564;
  uint64_t v1565;
  uint64_t v1566;
  void *v1567;
  const char *v1568;
  uint64_t v1569;
  void *v1570;
  const char *v1571;
  uint64_t v1572;
  uint64_t v1573;
  int v1574;
  const char *v1575;
  uint64_t v1576;
  void *v1577;
  const char *v1578;
  uint64_t v1579;
  uint64_t v1580;
  int v1581;
  const char *v1582;
  uint64_t v1583;
  void *v1584;
  const char *v1585;
  uint64_t v1586;
  uint64_t v1587;
  const char *v1588;
  uint64_t v1589;
  void *v1590;
  const char *v1591;
  uint64_t v1592;
  uint64_t v1593;
  const char *v1594;
  uint64_t v1595;
  void *v1596;
  const char *v1597;
  uint64_t v1598;
  uint64_t v1599;
  int v1600;
  const char *v1601;
  uint64_t v1602;
  void *v1603;
  const char *v1604;
  uint64_t v1605;
  uint64_t v1606;
  int v1607;
  const char *v1608;
  uint64_t v1609;
  void *v1610;
  const char *v1611;
  uint64_t v1612;
  uint64_t v1613;
  const char *v1614;
  uint64_t v1615;
  void *v1616;
  const char *v1617;
  uint64_t v1618;
  uint64_t v1619;
  const char *v1620;
  uint64_t v1621;
  void *v1622;
  const char *v1623;
  uint64_t v1624;
  uint64_t v1625;
  int v1626;
  const char *v1627;
  uint64_t v1628;
  void *v1629;
  const char *v1630;
  uint64_t v1631;
  uint64_t v1632;
  unsigned int v1633;
  const char *v1634;
  uint64_t v1635;
  void *v1636;
  const char *v1637;
  uint64_t v1638;
  uint64_t v1639;
  const char *v1640;
  uint64_t v1641;
  void *v1642;
  const char *v1643;
  uint64_t v1644;
  uint64_t v1645;
  const char *v1646;
  uint64_t v1647;
  void *v1648;
  const char *v1649;
  uint64_t v1650;
  uint64_t v1651;
  unsigned int v1652;
  const char *v1653;
  uint64_t v1654;
  void *v1655;
  const char *v1656;
  uint64_t v1657;
  uint64_t v1658;
  unsigned int v1659;
  const char *v1660;
  uint64_t v1661;
  void *v1662;
  const char *v1663;
  uint64_t v1664;
  uint64_t v1665;
  const char *v1666;
  uint64_t v1667;
  void *v1668;
  const char *v1669;
  uint64_t v1670;
  uint64_t v1671;
  const char *v1672;
  uint64_t v1673;
  int v1674;
  double v1675;
  const char *v1676;
  uint64_t v1677;
  uint64_t v1678;
  void *v1679;
  const char *v1680;
  uint64_t v1681;
  void *v1682;
  const char *v1683;
  uint64_t v1684;
  uint64_t v1685;
  int v1686;
  const char *v1687;
  uint64_t v1688;
  void *v1689;
  const char *v1690;
  uint64_t v1691;
  uint64_t v1692;
  int v1693;
  const char *v1694;
  uint64_t v1695;
  void *v1696;
  const char *v1697;
  uint64_t v1698;
  uint64_t v1699;
  const char *v1700;
  uint64_t v1701;
  void *v1702;
  const char *v1703;
  uint64_t v1704;
  uint64_t v1705;
  const char *v1706;
  uint64_t v1707;
  void *v1708;
  const char *v1709;
  uint64_t v1710;
  uint64_t v1711;
  int v1712;
  const char *v1713;
  uint64_t v1714;
  void *v1715;
  const char *v1716;
  uint64_t v1717;
  uint64_t v1718;
  int v1719;
  const char *v1720;
  uint64_t v1721;
  void *v1722;
  const char *v1723;
  uint64_t v1724;
  uint64_t v1725;
  const char *v1726;
  uint64_t v1727;
  void *v1728;
  const char *v1729;
  uint64_t v1730;
  uint64_t v1731;
  const char *v1732;
  uint64_t v1733;
  void *v1734;
  const char *v1735;
  uint64_t v1736;
  uint64_t v1737;
  int v1738;
  const char *v1739;
  uint64_t v1740;
  void *v1741;
  const char *v1742;
  uint64_t v1743;
  uint64_t v1744;
  unsigned int v1745;
  const char *v1746;
  uint64_t v1747;
  void *v1748;
  const char *v1749;
  uint64_t v1750;
  uint64_t v1751;
  const char *v1752;
  uint64_t v1753;
  void *v1754;
  const char *v1755;
  uint64_t v1756;
  uint64_t v1757;
  const char *v1758;
  uint64_t v1759;
  void *v1760;
  const char *v1761;
  uint64_t v1762;
  uint64_t v1763;
  unsigned int v1764;
  const char *v1765;
  uint64_t v1766;
  void *v1767;
  const char *v1768;
  uint64_t v1769;
  uint64_t v1770;
  unsigned int v1771;
  const char *v1772;
  uint64_t v1773;
  void *v1774;
  const char *v1775;
  uint64_t v1776;
  uint64_t v1777;
  const char *v1778;
  uint64_t v1779;
  void *v1780;
  const char *v1781;
  uint64_t v1782;
  uint64_t v1783;
  const char *v1784;
  uint64_t v1785;
  int v1786;
  double v1787;
  const char *v1788;
  uint64_t v1789;
  uint64_t v1790;
  const char *v1791;
  unsigned int v1793;
  unsigned int v1794;
  unsigned int v1795;
  unsigned int v1796;
  unsigned int v1797;
  unsigned int v1798;
  unsigned int v1799;
  unsigned int v1800;
  unsigned int v1801;
  unsigned int v1802;
  unsigned int v1803;
  unsigned int v1804;
  unsigned int v1805;
  unsigned int v1806;
  unsigned int v1807;
  unsigned int v1808;
  unsigned int v1809;
  unsigned int v1810;
  unsigned int v1811;
  unsigned int v1812;
  unsigned int v1813;
  unsigned int v1814;
  unsigned int v1815;
  unsigned int v1816;
  unsigned int v1817;
  unsigned int v1818;
  unsigned int v1819;
  unsigned int v1820;
  unsigned int v1821;
  unsigned int v1822;
  unsigned int v1823;
  unsigned int v1824;
  unsigned int v1825;
  unsigned int v1826;
  unsigned int v1827;
  unsigned int v1828;
  unsigned int v1829;
  unsigned int v1830;
  unsigned int v1831;
  unsigned int v1832;
  unsigned int v1833;
  unsigned int v1834;
  unsigned int v1835;
  unsigned int v1836;
  unsigned int v1837;
  unsigned int v1838;
  unsigned int v1839;
  unsigned int v1840;
  unsigned int v1841;
  unsigned int v1842;
  double v1843;
  double v1844;
  double v1845;
  double v1846;
  double v1847;
  double v1848;
  double v1849;
  double v1850;
  double v1851;
  double v1852;
  double v1853;
  double v1854;
  double v1855;
  double v1856;
  double v1857;
  double v1858;
  unsigned int v1859;
  unsigned int v1860;
  double v1861;
  double v1862;
  double v1863;
  double v1864;
  double v1865;
  double v1866;
  double v1867;
  double v1868;
  double v1869;
  double v1870;
  double v1871;
  double v1872;
  double v1873;
  double v1874;
  double v1875;
  double v1876;
  unsigned int v1877;
  double v1878;
  double v1879;
  double v1880;
  double v1881;
  double v1882;
  double v1883;
  double v1884;
  double v1885;
  double v1886;
  double v1887;
  double v1888;
  double v1889;
  double v1890;
  double v1891;
  double v1892;
  double v1893;
  _QWORD v1894[17];

  v1894[16] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v8, v9, v10, v11);
  v1877 = v12;
  v15 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  v1859 = v19;
  v22 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  v28 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v26, 3, v27);
  objc_msgSend_floatValue(v28, v29, v30, v31);
  *(_QWORD *)&v1878 = __PAIR64__(v1859, v1877);
  v34 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v32, 4, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  v1860 = v38;
  v41 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v39, 5, v40);
  objc_msgSend_floatValue(v41, v42, v43, v44);
  v1841 = v45;
  v48 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v46, 6, v47);
  objc_msgSend_floatValue(v48, v49, v50, v51);
  v54 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v52, 7, v53);
  objc_msgSend_floatValue(v54, v55, v56, v57);
  *(_QWORD *)&v1861 = __PAIR64__(v1841, v1860);
  v60 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v58, 8, v59);
  objc_msgSend_floatValue(v60, v61, v62, v63);
  v1842 = v64;
  v67 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v65, 9, v66);
  objc_msgSend_floatValue(v67, v68, v69, v70);
  v1809 = v71;
  v74 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v72, 10, v73);
  objc_msgSend_floatValue(v74, v75, v76, v77);
  v80 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v78, 11, v79);
  objc_msgSend_floatValue(v80, v81, v82, v83);
  *(_QWORD *)&v1843 = __PAIR64__(v1809, v1842);
  v86 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v84, 12, v85);
  objc_msgSend_floatValue(v86, v87, v88, v89);
  v1810 = v90;
  v93 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v91, 13, v92);
  objc_msgSend_floatValue(v93, v94, v95, v96);
  v1793 = v97;
  v100 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v98, 14, v99);
  objc_msgSend_floatValue(v100, v101, v102, v103);
  v106 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v104, 15, v105);
  objc_msgSend_floatValue(v106, v107, v108, v109);
  objc_msgSend_convertTransform_toNode_(self, v110, (uint64_t)a4, v111, v1878, v1861, v1843, COERCE_DOUBLE(__PAIR64__(v1793, v1810)));
  v1894[0] = objc_msgSend_numberWithFloat_(v7, v112, v113, v114);
  v115 = (void *)MEMORY[0x1E0CB37E8];
  v118 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v116, 0, v117);
  objc_msgSend_floatValue(v118, v119, v120, v121);
  LODWORD(v1878) = v122;
  v125 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v123, 1, v124);
  objc_msgSend_floatValue(v125, v126, v127, v128);
  LODWORD(v1861) = v129;
  v132 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v130, 2, v131);
  objc_msgSend_floatValue(v132, v133, v134, v135);
  v138 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v136, 3, v137);
  objc_msgSend_floatValue(v138, v139, v140, v141);
  *(_QWORD *)&v1879 = __PAIR64__(LODWORD(v1861), LODWORD(v1878));
  v144 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v142, 4, v143);
  objc_msgSend_floatValue(v144, v145, v146, v147);
  LODWORD(v1861) = v148;
  v151 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v149, 5, v150);
  objc_msgSend_floatValue(v151, v152, v153, v154);
  LODWORD(v1843) = v155;
  v158 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v156, 6, v157);
  objc_msgSend_floatValue(v158, v159, v160, v161);
  v164 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v162, 7, v163);
  objc_msgSend_floatValue(v164, v165, v166, v167);
  *(_QWORD *)&v1862 = __PAIR64__(LODWORD(v1843), LODWORD(v1861));
  v170 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v168, 8, v169);
  objc_msgSend_floatValue(v170, v171, v172, v173);
  LODWORD(v1843) = v174;
  v177 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v175, 9, v176);
  objc_msgSend_floatValue(v177, v178, v179, v180);
  v1811 = v181;
  v184 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v182, 10, v183);
  objc_msgSend_floatValue(v184, v185, v186, v187);
  v190 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v188, 11, v189);
  objc_msgSend_floatValue(v190, v191, v192, v193);
  *(_QWORD *)&v1844 = __PAIR64__(v1811, LODWORD(v1843));
  v196 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v194, 12, v195);
  objc_msgSend_floatValue(v196, v197, v198, v199);
  v1812 = v200;
  v203 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v201, 13, v202);
  objc_msgSend_floatValue(v203, v204, v205, v206);
  v1794 = v207;
  v210 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v208, 14, v209);
  objc_msgSend_floatValue(v210, v211, v212, v213);
  v216 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v214, 15, v215);
  objc_msgSend_floatValue(v216, v217, v218, v219);
  objc_msgSend_convertTransform_toNode_(self, v220, (uint64_t)a4, v221, v1879, v1862, v1844, COERCE_DOUBLE(__PAIR64__(v1794, v1812)));
  LODWORD(v222) = HIDWORD(v222);
  v1894[1] = objc_msgSend_numberWithFloat_(v115, v223, v224, v225, v222);
  v226 = (void *)MEMORY[0x1E0CB37E8];
  v229 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v227, 0, v228);
  objc_msgSend_floatValue(v229, v230, v231, v232);
  LODWORD(v1879) = v233;
  v236 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v234, 1, v235);
  objc_msgSend_floatValue(v236, v237, v238, v239);
  LODWORD(v1862) = v240;
  v243 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v241, 2, v242);
  objc_msgSend_floatValue(v243, v244, v245, v246);
  v249 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v247, 3, v248);
  objc_msgSend_floatValue(v249, v250, v251, v252);
  *(_QWORD *)&v1880 = __PAIR64__(LODWORD(v1862), LODWORD(v1879));
  v255 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v253, 4, v254);
  objc_msgSend_floatValue(v255, v256, v257, v258);
  LODWORD(v1862) = v259;
  v262 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v260, 5, v261);
  objc_msgSend_floatValue(v262, v263, v264, v265);
  LODWORD(v1844) = v266;
  v269 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v267, 6, v268);
  objc_msgSend_floatValue(v269, v270, v271, v272);
  v275 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v273, 7, v274);
  objc_msgSend_floatValue(v275, v276, v277, v278);
  *(_QWORD *)&v1863 = __PAIR64__(LODWORD(v1844), LODWORD(v1862));
  v281 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v279, 8, v280);
  objc_msgSend_floatValue(v281, v282, v283, v284);
  LODWORD(v1844) = v285;
  v288 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v286, 9, v287);
  objc_msgSend_floatValue(v288, v289, v290, v291);
  v1813 = v292;
  v295 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v293, 10, v294);
  objc_msgSend_floatValue(v295, v296, v297, v298);
  v301 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v299, 11, v300);
  objc_msgSend_floatValue(v301, v302, v303, v304);
  *(_QWORD *)&v1845 = __PAIR64__(v1813, LODWORD(v1844));
  v307 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v305, 12, v306);
  objc_msgSend_floatValue(v307, v308, v309, v310);
  v1814 = v311;
  v314 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v312, 13, v313);
  objc_msgSend_floatValue(v314, v315, v316, v317);
  v1795 = v318;
  v321 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v319, 14, v320);
  objc_msgSend_floatValue(v321, v322, v323, v324);
  v327 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v325, 15, v326);
  objc_msgSend_floatValue(v327, v328, v329, v330);
  objc_msgSend_convertTransform_toNode_(self, v331, (uint64_t)a4, v332, v1880, v1863, v1845, COERCE_DOUBLE(__PAIR64__(v1795, v1814)));
  LODWORD(v334) = v333;
  v1894[2] = objc_msgSend_numberWithFloat_(v226, v335, v336, v337, v334);
  v338 = (void *)MEMORY[0x1E0CB37E8];
  v341 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v339, 0, v340);
  objc_msgSend_floatValue(v341, v342, v343, v344);
  LODWORD(v1880) = v345;
  v348 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v346, 1, v347);
  objc_msgSend_floatValue(v348, v349, v350, v351);
  LODWORD(v1863) = v352;
  v355 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v353, 2, v354);
  objc_msgSend_floatValue(v355, v356, v357, v358);
  v361 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v359, 3, v360);
  objc_msgSend_floatValue(v361, v362, v363, v364);
  *(_QWORD *)&v1881 = __PAIR64__(LODWORD(v1863), LODWORD(v1880));
  v367 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v365, 4, v366);
  objc_msgSend_floatValue(v367, v368, v369, v370);
  LODWORD(v1863) = v371;
  v374 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v372, 5, v373);
  objc_msgSend_floatValue(v374, v375, v376, v377);
  LODWORD(v1845) = v378;
  v381 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v379, 6, v380);
  objc_msgSend_floatValue(v381, v382, v383, v384);
  v387 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v385, 7, v386);
  objc_msgSend_floatValue(v387, v388, v389, v390);
  *(_QWORD *)&v1864 = __PAIR64__(LODWORD(v1845), LODWORD(v1863));
  v393 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v391, 8, v392);
  objc_msgSend_floatValue(v393, v394, v395, v396);
  LODWORD(v1845) = v397;
  v400 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v398, 9, v399);
  objc_msgSend_floatValue(v400, v401, v402, v403);
  v1815 = v404;
  v407 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v405, 10, v406);
  objc_msgSend_floatValue(v407, v408, v409, v410);
  v413 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v411, 11, v412);
  objc_msgSend_floatValue(v413, v414, v415, v416);
  *(_QWORD *)&v1846 = __PAIR64__(v1815, LODWORD(v1845));
  v419 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v417, 12, v418);
  objc_msgSend_floatValue(v419, v420, v421, v422);
  v1816 = v423;
  v426 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v424, 13, v425);
  objc_msgSend_floatValue(v426, v427, v428, v429);
  v1796 = v430;
  v433 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v431, 14, v432);
  objc_msgSend_floatValue(v433, v434, v435, v436);
  v439 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v437, 15, v438);
  objc_msgSend_floatValue(v439, v440, v441, v442);
  objc_msgSend_convertTransform_toNode_(self, v443, (uint64_t)a4, v444, v1881, v1864, v1846, COERCE_DOUBLE(__PAIR64__(v1796, v1816)));
  LODWORD(v446) = v445;
  v1894[3] = objc_msgSend_numberWithFloat_(v338, v447, v448, v449, v446);
  v450 = (void *)MEMORY[0x1E0CB37E8];
  v453 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v451, 0, v452);
  objc_msgSend_floatValue(v453, v454, v455, v456);
  LODWORD(v1881) = v457;
  v460 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v458, 1, v459);
  objc_msgSend_floatValue(v460, v461, v462, v463);
  LODWORD(v1864) = v464;
  v467 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v465, 2, v466);
  objc_msgSend_floatValue(v467, v468, v469, v470);
  v473 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v471, 3, v472);
  objc_msgSend_floatValue(v473, v474, v475, v476);
  *(_QWORD *)&v1882 = __PAIR64__(LODWORD(v1864), LODWORD(v1881));
  v479 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v477, 4, v478);
  objc_msgSend_floatValue(v479, v480, v481, v482);
  LODWORD(v1864) = v483;
  v486 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v484, 5, v485);
  objc_msgSend_floatValue(v486, v487, v488, v489);
  LODWORD(v1846) = v490;
  v493 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v491, 6, v492);
  objc_msgSend_floatValue(v493, v494, v495, v496);
  v499 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v497, 7, v498);
  objc_msgSend_floatValue(v499, v500, v501, v502);
  *(_QWORD *)&v1865 = __PAIR64__(LODWORD(v1846), LODWORD(v1864));
  v505 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v503, 8, v504);
  objc_msgSend_floatValue(v505, v506, v507, v508);
  LODWORD(v1846) = v509;
  v512 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v510, 9, v511);
  objc_msgSend_floatValue(v512, v513, v514, v515);
  v1817 = v516;
  v519 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v517, 10, v518);
  objc_msgSend_floatValue(v519, v520, v521, v522);
  v525 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v523, 11, v524);
  objc_msgSend_floatValue(v525, v526, v527, v528);
  *(_QWORD *)&v1847 = __PAIR64__(v1817, LODWORD(v1846));
  v531 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v529, 12, v530);
  objc_msgSend_floatValue(v531, v532, v533, v534);
  v1818 = v535;
  v538 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v536, 13, v537);
  objc_msgSend_floatValue(v538, v539, v540, v541);
  v1797 = v542;
  v545 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v543, 14, v544);
  objc_msgSend_floatValue(v545, v546, v547, v548);
  v551 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v549, 15, v550);
  objc_msgSend_floatValue(v551, v552, v553, v554);
  objc_msgSend_convertTransform_toNode_(self, v555, (uint64_t)a4, v556, v1882, v1865, v1847, COERCE_DOUBLE(__PAIR64__(v1797, v1818)));
  v1894[4] = objc_msgSend_numberWithFloat_(v450, v557, v558, v559, v560);
  v561 = (void *)MEMORY[0x1E0CB37E8];
  v564 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v562, 0, v563);
  objc_msgSend_floatValue(v564, v565, v566, v567);
  LODWORD(v1882) = v568;
  v571 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v569, 1, v570);
  objc_msgSend_floatValue(v571, v572, v573, v574);
  LODWORD(v1865) = v575;
  v578 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v576, 2, v577);
  objc_msgSend_floatValue(v578, v579, v580, v581);
  v584 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v582, 3, v583);
  objc_msgSend_floatValue(v584, v585, v586, v587);
  *(_QWORD *)&v1883 = __PAIR64__(LODWORD(v1865), LODWORD(v1882));
  v590 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v588, 4, v589);
  objc_msgSend_floatValue(v590, v591, v592, v593);
  LODWORD(v1865) = v594;
  v597 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v595, 5, v596);
  objc_msgSend_floatValue(v597, v598, v599, v600);
  LODWORD(v1847) = v601;
  v604 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v602, 6, v603);
  objc_msgSend_floatValue(v604, v605, v606, v607);
  v610 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v608, 7, v609);
  objc_msgSend_floatValue(v610, v611, v612, v613);
  *(_QWORD *)&v1866 = __PAIR64__(LODWORD(v1847), LODWORD(v1865));
  v616 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v614, 8, v615);
  objc_msgSend_floatValue(v616, v617, v618, v619);
  LODWORD(v1847) = v620;
  v623 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v621, 9, v622);
  objc_msgSend_floatValue(v623, v624, v625, v626);
  v1819 = v627;
  v630 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v628, 10, v629);
  objc_msgSend_floatValue(v630, v631, v632, v633);
  v636 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v634, 11, v635);
  objc_msgSend_floatValue(v636, v637, v638, v639);
  *(_QWORD *)&v1848 = __PAIR64__(v1819, LODWORD(v1847));
  v642 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v640, 12, v641);
  objc_msgSend_floatValue(v642, v643, v644, v645);
  v1820 = v646;
  v649 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v647, 13, v648);
  objc_msgSend_floatValue(v649, v650, v651, v652);
  v1798 = v653;
  v656 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v654, 14, v655);
  objc_msgSend_floatValue(v656, v657, v658, v659);
  v662 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v660, 15, v661);
  objc_msgSend_floatValue(v662, v663, v664, v665);
  objc_msgSend_convertTransform_toNode_(self, v666, (uint64_t)a4, v667, v1883, v1866, v1848, COERCE_DOUBLE(__PAIR64__(v1798, v1820)));
  LODWORD(v669) = v668;
  v1894[5] = objc_msgSend_numberWithFloat_(v561, v670, v671, v672, v669);
  v673 = (void *)MEMORY[0x1E0CB37E8];
  v676 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v674, 0, v675);
  objc_msgSend_floatValue(v676, v677, v678, v679);
  LODWORD(v1883) = v680;
  v683 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v681, 1, v682);
  objc_msgSend_floatValue(v683, v684, v685, v686);
  LODWORD(v1866) = v687;
  v690 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v688, 2, v689);
  objc_msgSend_floatValue(v690, v691, v692, v693);
  v696 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v694, 3, v695);
  objc_msgSend_floatValue(v696, v697, v698, v699);
  *(_QWORD *)&v1884 = __PAIR64__(LODWORD(v1866), LODWORD(v1883));
  v702 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v700, 4, v701);
  objc_msgSend_floatValue(v702, v703, v704, v705);
  LODWORD(v1866) = v706;
  v709 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v707, 5, v708);
  objc_msgSend_floatValue(v709, v710, v711, v712);
  LODWORD(v1848) = v713;
  v716 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v714, 6, v715);
  objc_msgSend_floatValue(v716, v717, v718, v719);
  v722 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v720, 7, v721);
  objc_msgSend_floatValue(v722, v723, v724, v725);
  *(_QWORD *)&v1867 = __PAIR64__(LODWORD(v1848), LODWORD(v1866));
  v728 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v726, 8, v727);
  objc_msgSend_floatValue(v728, v729, v730, v731);
  LODWORD(v1848) = v732;
  v735 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v733, 9, v734);
  objc_msgSend_floatValue(v735, v736, v737, v738);
  v1821 = v739;
  v742 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v740, 10, v741);
  objc_msgSend_floatValue(v742, v743, v744, v745);
  v748 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v746, 11, v747);
  objc_msgSend_floatValue(v748, v749, v750, v751);
  *(_QWORD *)&v1849 = __PAIR64__(v1821, LODWORD(v1848));
  v754 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v752, 12, v753);
  objc_msgSend_floatValue(v754, v755, v756, v757);
  v1822 = v758;
  v761 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v759, 13, v760);
  objc_msgSend_floatValue(v761, v762, v763, v764);
  v1799 = v765;
  v768 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v766, 14, v767);
  objc_msgSend_floatValue(v768, v769, v770, v771);
  v774 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v772, 15, v773);
  objc_msgSend_floatValue(v774, v775, v776, v777);
  objc_msgSend_convertTransform_toNode_(self, v778, (uint64_t)a4, v779, v1884, v1867, v1849, COERCE_DOUBLE(__PAIR64__(v1799, v1822)));
  LODWORD(v781) = v780;
  v1894[6] = objc_msgSend_numberWithFloat_(v673, v782, v783, v784, v781);
  v785 = (void *)MEMORY[0x1E0CB37E8];
  v788 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v786, 0, v787);
  objc_msgSend_floatValue(v788, v789, v790, v791);
  LODWORD(v1884) = v792;
  v795 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v793, 1, v794);
  objc_msgSend_floatValue(v795, v796, v797, v798);
  LODWORD(v1867) = v799;
  v802 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v800, 2, v801);
  objc_msgSend_floatValue(v802, v803, v804, v805);
  v808 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v806, 3, v807);
  objc_msgSend_floatValue(v808, v809, v810, v811);
  *(_QWORD *)&v1885 = __PAIR64__(LODWORD(v1867), LODWORD(v1884));
  v814 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v812, 4, v813);
  objc_msgSend_floatValue(v814, v815, v816, v817);
  LODWORD(v1867) = v818;
  v821 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v819, 5, v820);
  objc_msgSend_floatValue(v821, v822, v823, v824);
  LODWORD(v1849) = v825;
  v828 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v826, 6, v827);
  objc_msgSend_floatValue(v828, v829, v830, v831);
  v834 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v832, 7, v833);
  objc_msgSend_floatValue(v834, v835, v836, v837);
  *(_QWORD *)&v1868 = __PAIR64__(LODWORD(v1849), LODWORD(v1867));
  v840 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v838, 8, v839);
  objc_msgSend_floatValue(v840, v841, v842, v843);
  LODWORD(v1849) = v844;
  v847 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v845, 9, v846);
  objc_msgSend_floatValue(v847, v848, v849, v850);
  v1823 = v851;
  v854 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v852, 10, v853);
  objc_msgSend_floatValue(v854, v855, v856, v857);
  v860 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v858, 11, v859);
  objc_msgSend_floatValue(v860, v861, v862, v863);
  *(_QWORD *)&v1850 = __PAIR64__(v1823, LODWORD(v1849));
  v866 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v864, 12, v865);
  objc_msgSend_floatValue(v866, v867, v868, v869);
  v1824 = v870;
  v873 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v871, 13, v872);
  objc_msgSend_floatValue(v873, v874, v875, v876);
  v1800 = v877;
  v880 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v878, 14, v879);
  objc_msgSend_floatValue(v880, v881, v882, v883);
  v886 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v884, 15, v885);
  objc_msgSend_floatValue(v886, v887, v888, v889);
  objc_msgSend_convertTransform_toNode_(self, v890, (uint64_t)a4, v891, v1885, v1868, v1850, COERCE_DOUBLE(__PAIR64__(v1800, v1824)));
  LODWORD(v893) = v892;
  v1894[7] = objc_msgSend_numberWithFloat_(v785, v894, v895, v896, v893);
  v897 = (void *)MEMORY[0x1E0CB37E8];
  v900 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v898, 0, v899);
  objc_msgSend_floatValue(v900, v901, v902, v903);
  LODWORD(v1885) = v904;
  v907 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v905, 1, v906);
  objc_msgSend_floatValue(v907, v908, v909, v910);
  LODWORD(v1868) = v911;
  v914 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v912, 2, v913);
  objc_msgSend_floatValue(v914, v915, v916, v917);
  v920 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v918, 3, v919);
  objc_msgSend_floatValue(v920, v921, v922, v923);
  *(_QWORD *)&v1886 = __PAIR64__(LODWORD(v1868), LODWORD(v1885));
  v926 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v924, 4, v925);
  objc_msgSend_floatValue(v926, v927, v928, v929);
  LODWORD(v1868) = v930;
  v933 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v931, 5, v932);
  objc_msgSend_floatValue(v933, v934, v935, v936);
  LODWORD(v1850) = v937;
  v940 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v938, 6, v939);
  objc_msgSend_floatValue(v940, v941, v942, v943);
  v946 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v944, 7, v945);
  objc_msgSend_floatValue(v946, v947, v948, v949);
  *(_QWORD *)&v1869 = __PAIR64__(LODWORD(v1850), LODWORD(v1868));
  v952 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v950, 8, v951);
  objc_msgSend_floatValue(v952, v953, v954, v955);
  LODWORD(v1850) = v956;
  v959 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v957, 9, v958);
  objc_msgSend_floatValue(v959, v960, v961, v962);
  v1825 = v963;
  v966 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v964, 10, v965);
  objc_msgSend_floatValue(v966, v967, v968, v969);
  v972 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v970, 11, v971);
  objc_msgSend_floatValue(v972, v973, v974, v975);
  *(_QWORD *)&v1851 = __PAIR64__(v1825, LODWORD(v1850));
  v978 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v976, 12, v977);
  objc_msgSend_floatValue(v978, v979, v980, v981);
  v1826 = v982;
  v985 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v983, 13, v984);
  objc_msgSend_floatValue(v985, v986, v987, v988);
  v1801 = v989;
  v992 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v990, 14, v991);
  objc_msgSend_floatValue(v992, v993, v994, v995);
  v998 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v996, 15, v997);
  objc_msgSend_floatValue(v998, v999, v1000, v1001);
  objc_msgSend_convertTransform_toNode_(self, v1002, (uint64_t)a4, v1003, v1886, v1869, v1851, COERCE_DOUBLE(__PAIR64__(v1801, v1826)));
  v1894[8] = objc_msgSend_numberWithFloat_(v897, v1004, v1005, v1006, v1007);
  v1008 = (void *)MEMORY[0x1E0CB37E8];
  v1011 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1009, 0, v1010);
  objc_msgSend_floatValue(v1011, v1012, v1013, v1014);
  LODWORD(v1886) = v1015;
  v1018 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1016, 1, v1017);
  objc_msgSend_floatValue(v1018, v1019, v1020, v1021);
  LODWORD(v1869) = v1022;
  v1025 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1023, 2, v1024);
  objc_msgSend_floatValue(v1025, v1026, v1027, v1028);
  v1031 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1029, 3, v1030);
  objc_msgSend_floatValue(v1031, v1032, v1033, v1034);
  *(_QWORD *)&v1887 = __PAIR64__(LODWORD(v1869), LODWORD(v1886));
  v1037 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1035, 4, v1036);
  objc_msgSend_floatValue(v1037, v1038, v1039, v1040);
  LODWORD(v1869) = v1041;
  v1044 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1042, 5, v1043);
  objc_msgSend_floatValue(v1044, v1045, v1046, v1047);
  LODWORD(v1851) = v1048;
  v1051 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1049, 6, v1050);
  objc_msgSend_floatValue(v1051, v1052, v1053, v1054);
  v1057 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1055, 7, v1056);
  objc_msgSend_floatValue(v1057, v1058, v1059, v1060);
  *(_QWORD *)&v1870 = __PAIR64__(LODWORD(v1851), LODWORD(v1869));
  v1063 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1061, 8, v1062);
  objc_msgSend_floatValue(v1063, v1064, v1065, v1066);
  LODWORD(v1851) = v1067;
  v1070 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1068, 9, v1069);
  objc_msgSend_floatValue(v1070, v1071, v1072, v1073);
  v1827 = v1074;
  v1077 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1075, 10, v1076);
  objc_msgSend_floatValue(v1077, v1078, v1079, v1080);
  v1083 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1081, 11, v1082);
  objc_msgSend_floatValue(v1083, v1084, v1085, v1086);
  *(_QWORD *)&v1852 = __PAIR64__(v1827, LODWORD(v1851));
  v1089 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1087, 12, v1088);
  objc_msgSend_floatValue(v1089, v1090, v1091, v1092);
  v1828 = v1093;
  v1096 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1094, 13, v1095);
  objc_msgSend_floatValue(v1096, v1097, v1098, v1099);
  v1802 = v1100;
  v1103 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1101, 14, v1102);
  objc_msgSend_floatValue(v1103, v1104, v1105, v1106);
  v1109 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1107, 15, v1108);
  objc_msgSend_floatValue(v1109, v1110, v1111, v1112);
  objc_msgSend_convertTransform_toNode_(self, v1113, (uint64_t)a4, v1114, v1887, v1870, v1852, COERCE_DOUBLE(__PAIR64__(v1802, v1828)));
  LODWORD(v1116) = v1115;
  v1894[9] = objc_msgSend_numberWithFloat_(v1008, v1117, v1118, v1119, v1116);
  v1120 = (void *)MEMORY[0x1E0CB37E8];
  v1123 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1121, 0, v1122);
  objc_msgSend_floatValue(v1123, v1124, v1125, v1126);
  LODWORD(v1887) = v1127;
  v1130 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1128, 1, v1129);
  objc_msgSend_floatValue(v1130, v1131, v1132, v1133);
  LODWORD(v1870) = v1134;
  v1137 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1135, 2, v1136);
  objc_msgSend_floatValue(v1137, v1138, v1139, v1140);
  v1143 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1141, 3, v1142);
  objc_msgSend_floatValue(v1143, v1144, v1145, v1146);
  *(_QWORD *)&v1888 = __PAIR64__(LODWORD(v1870), LODWORD(v1887));
  v1149 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1147, 4, v1148);
  objc_msgSend_floatValue(v1149, v1150, v1151, v1152);
  LODWORD(v1870) = v1153;
  v1156 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1154, 5, v1155);
  objc_msgSend_floatValue(v1156, v1157, v1158, v1159);
  LODWORD(v1852) = v1160;
  v1163 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1161, 6, v1162);
  objc_msgSend_floatValue(v1163, v1164, v1165, v1166);
  v1169 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1167, 7, v1168);
  objc_msgSend_floatValue(v1169, v1170, v1171, v1172);
  *(_QWORD *)&v1871 = __PAIR64__(LODWORD(v1852), LODWORD(v1870));
  v1175 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1173, 8, v1174);
  objc_msgSend_floatValue(v1175, v1176, v1177, v1178);
  LODWORD(v1852) = v1179;
  v1182 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1180, 9, v1181);
  objc_msgSend_floatValue(v1182, v1183, v1184, v1185);
  v1829 = v1186;
  v1189 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1187, 10, v1188);
  objc_msgSend_floatValue(v1189, v1190, v1191, v1192);
  v1195 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1193, 11, v1194);
  objc_msgSend_floatValue(v1195, v1196, v1197, v1198);
  *(_QWORD *)&v1853 = __PAIR64__(v1829, LODWORD(v1852));
  v1201 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1199, 12, v1200);
  objc_msgSend_floatValue(v1201, v1202, v1203, v1204);
  v1830 = v1205;
  v1208 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1206, 13, v1207);
  objc_msgSend_floatValue(v1208, v1209, v1210, v1211);
  v1803 = v1212;
  v1215 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1213, 14, v1214);
  objc_msgSend_floatValue(v1215, v1216, v1217, v1218);
  v1221 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1219, 15, v1220);
  objc_msgSend_floatValue(v1221, v1222, v1223, v1224);
  objc_msgSend_convertTransform_toNode_(self, v1225, (uint64_t)a4, v1226, v1888, v1871, v1853, COERCE_DOUBLE(__PAIR64__(v1803, v1830)));
  LODWORD(v1228) = v1227;
  v1894[10] = objc_msgSend_numberWithFloat_(v1120, v1229, v1230, v1231, v1228);
  v1232 = (void *)MEMORY[0x1E0CB37E8];
  v1235 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1233, 0, v1234);
  objc_msgSend_floatValue(v1235, v1236, v1237, v1238);
  LODWORD(v1888) = v1239;
  v1242 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1240, 1, v1241);
  objc_msgSend_floatValue(v1242, v1243, v1244, v1245);
  LODWORD(v1871) = v1246;
  v1249 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1247, 2, v1248);
  objc_msgSend_floatValue(v1249, v1250, v1251, v1252);
  v1255 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1253, 3, v1254);
  objc_msgSend_floatValue(v1255, v1256, v1257, v1258);
  *(_QWORD *)&v1889 = __PAIR64__(LODWORD(v1871), LODWORD(v1888));
  v1261 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1259, 4, v1260);
  objc_msgSend_floatValue(v1261, v1262, v1263, v1264);
  LODWORD(v1871) = v1265;
  v1268 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1266, 5, v1267);
  objc_msgSend_floatValue(v1268, v1269, v1270, v1271);
  LODWORD(v1853) = v1272;
  v1275 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1273, 6, v1274);
  objc_msgSend_floatValue(v1275, v1276, v1277, v1278);
  v1281 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1279, 7, v1280);
  objc_msgSend_floatValue(v1281, v1282, v1283, v1284);
  *(_QWORD *)&v1872 = __PAIR64__(LODWORD(v1853), LODWORD(v1871));
  v1287 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1285, 8, v1286);
  objc_msgSend_floatValue(v1287, v1288, v1289, v1290);
  LODWORD(v1853) = v1291;
  v1294 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1292, 9, v1293);
  objc_msgSend_floatValue(v1294, v1295, v1296, v1297);
  v1831 = v1298;
  v1301 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1299, 10, v1300);
  objc_msgSend_floatValue(v1301, v1302, v1303, v1304);
  v1307 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1305, 11, v1306);
  objc_msgSend_floatValue(v1307, v1308, v1309, v1310);
  *(_QWORD *)&v1854 = __PAIR64__(v1831, LODWORD(v1853));
  v1313 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1311, 12, v1312);
  objc_msgSend_floatValue(v1313, v1314, v1315, v1316);
  v1832 = v1317;
  v1320 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1318, 13, v1319);
  objc_msgSend_floatValue(v1320, v1321, v1322, v1323);
  v1804 = v1324;
  v1327 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1325, 14, v1326);
  objc_msgSend_floatValue(v1327, v1328, v1329, v1330);
  v1333 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1331, 15, v1332);
  objc_msgSend_floatValue(v1333, v1334, v1335, v1336);
  objc_msgSend_convertTransform_toNode_(self, v1337, (uint64_t)a4, v1338, v1889, v1872, v1854, COERCE_DOUBLE(__PAIR64__(v1804, v1832)));
  LODWORD(v1340) = v1339;
  v1894[11] = objc_msgSend_numberWithFloat_(v1232, v1341, v1342, v1343, v1340);
  v1344 = (void *)MEMORY[0x1E0CB37E8];
  v1347 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1345, 0, v1346);
  objc_msgSend_floatValue(v1347, v1348, v1349, v1350);
  LODWORD(v1889) = v1351;
  v1354 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1352, 1, v1353);
  objc_msgSend_floatValue(v1354, v1355, v1356, v1357);
  LODWORD(v1872) = v1358;
  v1361 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1359, 2, v1360);
  objc_msgSend_floatValue(v1361, v1362, v1363, v1364);
  v1367 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1365, 3, v1366);
  objc_msgSend_floatValue(v1367, v1368, v1369, v1370);
  *(_QWORD *)&v1890 = __PAIR64__(LODWORD(v1872), LODWORD(v1889));
  v1373 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1371, 4, v1372);
  objc_msgSend_floatValue(v1373, v1374, v1375, v1376);
  LODWORD(v1872) = v1377;
  v1380 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1378, 5, v1379);
  objc_msgSend_floatValue(v1380, v1381, v1382, v1383);
  LODWORD(v1854) = v1384;
  v1387 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1385, 6, v1386);
  objc_msgSend_floatValue(v1387, v1388, v1389, v1390);
  v1393 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1391, 7, v1392);
  objc_msgSend_floatValue(v1393, v1394, v1395, v1396);
  *(_QWORD *)&v1873 = __PAIR64__(LODWORD(v1854), LODWORD(v1872));
  v1399 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1397, 8, v1398);
  objc_msgSend_floatValue(v1399, v1400, v1401, v1402);
  LODWORD(v1854) = v1403;
  v1406 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1404, 9, v1405);
  objc_msgSend_floatValue(v1406, v1407, v1408, v1409);
  v1833 = v1410;
  v1413 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1411, 10, v1412);
  objc_msgSend_floatValue(v1413, v1414, v1415, v1416);
  v1419 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1417, 11, v1418);
  objc_msgSend_floatValue(v1419, v1420, v1421, v1422);
  *(_QWORD *)&v1855 = __PAIR64__(v1833, LODWORD(v1854));
  v1425 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1423, 12, v1424);
  objc_msgSend_floatValue(v1425, v1426, v1427, v1428);
  v1834 = v1429;
  v1432 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1430, 13, v1431);
  objc_msgSend_floatValue(v1432, v1433, v1434, v1435);
  v1805 = v1436;
  v1439 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1437, 14, v1438);
  objc_msgSend_floatValue(v1439, v1440, v1441, v1442);
  v1445 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1443, 15, v1444);
  objc_msgSend_floatValue(v1445, v1446, v1447, v1448);
  objc_msgSend_convertTransform_toNode_(self, v1449, (uint64_t)a4, v1450, v1890, v1873, v1855, COERCE_DOUBLE(__PAIR64__(v1805, v1834)));
  v1894[12] = objc_msgSend_numberWithFloat_(v1344, v1451, v1452, v1453, v1454);
  v1455 = (void *)MEMORY[0x1E0CB37E8];
  v1458 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1456, 0, v1457);
  objc_msgSend_floatValue(v1458, v1459, v1460, v1461);
  LODWORD(v1890) = v1462;
  v1465 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1463, 1, v1464);
  objc_msgSend_floatValue(v1465, v1466, v1467, v1468);
  LODWORD(v1873) = v1469;
  v1472 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1470, 2, v1471);
  objc_msgSend_floatValue(v1472, v1473, v1474, v1475);
  v1478 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1476, 3, v1477);
  objc_msgSend_floatValue(v1478, v1479, v1480, v1481);
  *(_QWORD *)&v1891 = __PAIR64__(LODWORD(v1873), LODWORD(v1890));
  v1484 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1482, 4, v1483);
  objc_msgSend_floatValue(v1484, v1485, v1486, v1487);
  LODWORD(v1873) = v1488;
  v1491 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1489, 5, v1490);
  objc_msgSend_floatValue(v1491, v1492, v1493, v1494);
  LODWORD(v1855) = v1495;
  v1498 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1496, 6, v1497);
  objc_msgSend_floatValue(v1498, v1499, v1500, v1501);
  v1504 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1502, 7, v1503);
  objc_msgSend_floatValue(v1504, v1505, v1506, v1507);
  *(_QWORD *)&v1874 = __PAIR64__(LODWORD(v1855), LODWORD(v1873));
  v1510 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1508, 8, v1509);
  objc_msgSend_floatValue(v1510, v1511, v1512, v1513);
  LODWORD(v1855) = v1514;
  v1517 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1515, 9, v1516);
  objc_msgSend_floatValue(v1517, v1518, v1519, v1520);
  v1835 = v1521;
  v1524 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1522, 10, v1523);
  objc_msgSend_floatValue(v1524, v1525, v1526, v1527);
  v1530 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1528, 11, v1529);
  objc_msgSend_floatValue(v1530, v1531, v1532, v1533);
  *(_QWORD *)&v1856 = __PAIR64__(v1835, LODWORD(v1855));
  v1536 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1534, 12, v1535);
  objc_msgSend_floatValue(v1536, v1537, v1538, v1539);
  v1836 = v1540;
  v1543 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1541, 13, v1542);
  objc_msgSend_floatValue(v1543, v1544, v1545, v1546);
  v1806 = v1547;
  v1550 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1548, 14, v1549);
  objc_msgSend_floatValue(v1550, v1551, v1552, v1553);
  v1556 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1554, 15, v1555);
  objc_msgSend_floatValue(v1556, v1557, v1558, v1559);
  objc_msgSend_convertTransform_toNode_(self, v1560, (uint64_t)a4, v1561, v1891, v1874, v1856, COERCE_DOUBLE(__PAIR64__(v1806, v1836)));
  LODWORD(v1563) = v1562;
  v1894[13] = objc_msgSend_numberWithFloat_(v1455, v1564, v1565, v1566, v1563);
  v1567 = (void *)MEMORY[0x1E0CB37E8];
  v1570 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1568, 0, v1569);
  objc_msgSend_floatValue(v1570, v1571, v1572, v1573);
  LODWORD(v1891) = v1574;
  v1577 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1575, 1, v1576);
  objc_msgSend_floatValue(v1577, v1578, v1579, v1580);
  LODWORD(v1874) = v1581;
  v1584 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1582, 2, v1583);
  objc_msgSend_floatValue(v1584, v1585, v1586, v1587);
  v1590 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1588, 3, v1589);
  objc_msgSend_floatValue(v1590, v1591, v1592, v1593);
  *(_QWORD *)&v1892 = __PAIR64__(LODWORD(v1874), LODWORD(v1891));
  v1596 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1594, 4, v1595);
  objc_msgSend_floatValue(v1596, v1597, v1598, v1599);
  LODWORD(v1874) = v1600;
  v1603 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1601, 5, v1602);
  objc_msgSend_floatValue(v1603, v1604, v1605, v1606);
  LODWORD(v1856) = v1607;
  v1610 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1608, 6, v1609);
  objc_msgSend_floatValue(v1610, v1611, v1612, v1613);
  v1616 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1614, 7, v1615);
  objc_msgSend_floatValue(v1616, v1617, v1618, v1619);
  *(_QWORD *)&v1875 = __PAIR64__(LODWORD(v1856), LODWORD(v1874));
  v1622 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1620, 8, v1621);
  objc_msgSend_floatValue(v1622, v1623, v1624, v1625);
  LODWORD(v1856) = v1626;
  v1629 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1627, 9, v1628);
  objc_msgSend_floatValue(v1629, v1630, v1631, v1632);
  v1837 = v1633;
  v1636 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1634, 10, v1635);
  objc_msgSend_floatValue(v1636, v1637, v1638, v1639);
  v1642 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1640, 11, v1641);
  objc_msgSend_floatValue(v1642, v1643, v1644, v1645);
  *(_QWORD *)&v1857 = __PAIR64__(v1837, LODWORD(v1856));
  v1648 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1646, 12, v1647);
  objc_msgSend_floatValue(v1648, v1649, v1650, v1651);
  v1838 = v1652;
  v1655 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1653, 13, v1654);
  objc_msgSend_floatValue(v1655, v1656, v1657, v1658);
  v1807 = v1659;
  v1662 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1660, 14, v1661);
  objc_msgSend_floatValue(v1662, v1663, v1664, v1665);
  v1668 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1666, 15, v1667);
  objc_msgSend_floatValue(v1668, v1669, v1670, v1671);
  objc_msgSend_convertTransform_toNode_(self, v1672, (uint64_t)a4, v1673, v1892, v1875, v1857, COERCE_DOUBLE(__PAIR64__(v1807, v1838)));
  LODWORD(v1675) = v1674;
  v1894[14] = objc_msgSend_numberWithFloat_(v1567, v1676, v1677, v1678, v1675);
  v1679 = (void *)MEMORY[0x1E0CB37E8];
  v1682 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1680, 0, v1681);
  objc_msgSend_floatValue(v1682, v1683, v1684, v1685);
  LODWORD(v1892) = v1686;
  v1689 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1687, 1, v1688);
  objc_msgSend_floatValue(v1689, v1690, v1691, v1692);
  LODWORD(v1875) = v1693;
  v1696 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1694, 2, v1695);
  objc_msgSend_floatValue(v1696, v1697, v1698, v1699);
  v1702 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1700, 3, v1701);
  objc_msgSend_floatValue(v1702, v1703, v1704, v1705);
  v1893 = COERCE_DOUBLE(__PAIR64__(LODWORD(v1875), LODWORD(v1892)));
  v1708 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1706, 4, v1707);
  objc_msgSend_floatValue(v1708, v1709, v1710, v1711);
  LODWORD(v1875) = v1712;
  v1715 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1713, 5, v1714);
  objc_msgSend_floatValue(v1715, v1716, v1717, v1718);
  LODWORD(v1857) = v1719;
  v1722 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1720, 6, v1721);
  objc_msgSend_floatValue(v1722, v1723, v1724, v1725);
  v1728 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1726, 7, v1727);
  objc_msgSend_floatValue(v1728, v1729, v1730, v1731);
  v1876 = COERCE_DOUBLE(__PAIR64__(LODWORD(v1857), LODWORD(v1875)));
  v1734 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1732, 8, v1733);
  objc_msgSend_floatValue(v1734, v1735, v1736, v1737);
  LODWORD(v1857) = v1738;
  v1741 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1739, 9, v1740);
  objc_msgSend_floatValue(v1741, v1742, v1743, v1744);
  v1839 = v1745;
  v1748 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1746, 10, v1747);
  objc_msgSend_floatValue(v1748, v1749, v1750, v1751);
  v1754 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1752, 11, v1753);
  objc_msgSend_floatValue(v1754, v1755, v1756, v1757);
  v1858 = COERCE_DOUBLE(__PAIR64__(v1839, LODWORD(v1857)));
  v1760 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1758, 12, v1759);
  objc_msgSend_floatValue(v1760, v1761, v1762, v1763);
  v1840 = v1764;
  v1767 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1765, 13, v1766);
  objc_msgSend_floatValue(v1767, v1768, v1769, v1770);
  v1808 = v1771;
  v1774 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1772, 14, v1773);
  objc_msgSend_floatValue(v1774, v1775, v1776, v1777);
  v1780 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1778, 15, v1779);
  objc_msgSend_floatValue(v1780, v1781, v1782, v1783);
  objc_msgSend_convertTransform_toNode_(self, v1784, (uint64_t)a4, v1785, v1893, v1876, v1858, COERCE_DOUBLE(__PAIR64__(v1808, v1840)));
  LODWORD(v1787) = v1786;
  v1894[15] = objc_msgSend_numberWithFloat_(v1679, v1788, v1789, v1790, v1787);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1791, (uint64_t)v1894, 16);
}

- (id)convertTransformValue:(id)a3 fromNode:(id)a4
{
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  unsigned int v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  unsigned int v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  int v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  const char *v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  int v148;
  const char *v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  int v155;
  const char *v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  const char *v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  int v174;
  const char *v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  unsigned int v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  unsigned int v200;
  const char *v201;
  uint64_t v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  unsigned int v207;
  const char *v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  double v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  int v233;
  const char *v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  int v240;
  const char *v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  const char *v247;
  uint64_t v248;
  void *v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  int v259;
  const char *v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  int v266;
  const char *v267;
  uint64_t v268;
  void *v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  void *v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  void *v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  int v285;
  const char *v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  unsigned int v292;
  const char *v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  void *v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  unsigned int v311;
  const char *v312;
  uint64_t v313;
  void *v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  unsigned int v318;
  const char *v319;
  uint64_t v320;
  void *v321;
  const char *v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  int v333;
  double v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  int v345;
  const char *v346;
  uint64_t v347;
  void *v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  int v352;
  const char *v353;
  uint64_t v354;
  void *v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  const char *v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  const char *v365;
  uint64_t v366;
  void *v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  int v371;
  const char *v372;
  uint64_t v373;
  void *v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  int v378;
  const char *v379;
  uint64_t v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  const char *v385;
  uint64_t v386;
  void *v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  const char *v391;
  uint64_t v392;
  void *v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  int v397;
  const char *v398;
  uint64_t v399;
  void *v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  unsigned int v404;
  const char *v405;
  uint64_t v406;
  void *v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  const char *v411;
  uint64_t v412;
  void *v413;
  const char *v414;
  uint64_t v415;
  uint64_t v416;
  const char *v417;
  uint64_t v418;
  void *v419;
  const char *v420;
  uint64_t v421;
  uint64_t v422;
  unsigned int v423;
  const char *v424;
  uint64_t v425;
  void *v426;
  const char *v427;
  uint64_t v428;
  uint64_t v429;
  unsigned int v430;
  const char *v431;
  uint64_t v432;
  void *v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  const char *v437;
  uint64_t v438;
  void *v439;
  const char *v440;
  uint64_t v441;
  uint64_t v442;
  const char *v443;
  uint64_t v444;
  int v445;
  double v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  void *v450;
  const char *v451;
  uint64_t v452;
  void *v453;
  const char *v454;
  uint64_t v455;
  uint64_t v456;
  int v457;
  const char *v458;
  uint64_t v459;
  void *v460;
  const char *v461;
  uint64_t v462;
  uint64_t v463;
  int v464;
  const char *v465;
  uint64_t v466;
  void *v467;
  const char *v468;
  uint64_t v469;
  uint64_t v470;
  const char *v471;
  uint64_t v472;
  void *v473;
  const char *v474;
  uint64_t v475;
  uint64_t v476;
  const char *v477;
  uint64_t v478;
  void *v479;
  const char *v480;
  uint64_t v481;
  uint64_t v482;
  int v483;
  const char *v484;
  uint64_t v485;
  void *v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  int v490;
  const char *v491;
  uint64_t v492;
  void *v493;
  const char *v494;
  uint64_t v495;
  uint64_t v496;
  const char *v497;
  uint64_t v498;
  void *v499;
  const char *v500;
  uint64_t v501;
  uint64_t v502;
  const char *v503;
  uint64_t v504;
  void *v505;
  const char *v506;
  uint64_t v507;
  uint64_t v508;
  int v509;
  const char *v510;
  uint64_t v511;
  void *v512;
  const char *v513;
  uint64_t v514;
  uint64_t v515;
  unsigned int v516;
  const char *v517;
  uint64_t v518;
  void *v519;
  const char *v520;
  uint64_t v521;
  uint64_t v522;
  const char *v523;
  uint64_t v524;
  void *v525;
  const char *v526;
  uint64_t v527;
  uint64_t v528;
  const char *v529;
  uint64_t v530;
  void *v531;
  const char *v532;
  uint64_t v533;
  uint64_t v534;
  unsigned int v535;
  const char *v536;
  uint64_t v537;
  void *v538;
  const char *v539;
  uint64_t v540;
  uint64_t v541;
  unsigned int v542;
  const char *v543;
  uint64_t v544;
  void *v545;
  const char *v546;
  uint64_t v547;
  uint64_t v548;
  const char *v549;
  uint64_t v550;
  void *v551;
  const char *v552;
  uint64_t v553;
  uint64_t v554;
  const char *v555;
  uint64_t v556;
  const char *v557;
  uint64_t v558;
  uint64_t v559;
  double v560;
  void *v561;
  const char *v562;
  uint64_t v563;
  void *v564;
  const char *v565;
  uint64_t v566;
  uint64_t v567;
  int v568;
  const char *v569;
  uint64_t v570;
  void *v571;
  const char *v572;
  uint64_t v573;
  uint64_t v574;
  int v575;
  const char *v576;
  uint64_t v577;
  void *v578;
  const char *v579;
  uint64_t v580;
  uint64_t v581;
  const char *v582;
  uint64_t v583;
  void *v584;
  const char *v585;
  uint64_t v586;
  uint64_t v587;
  const char *v588;
  uint64_t v589;
  void *v590;
  const char *v591;
  uint64_t v592;
  uint64_t v593;
  int v594;
  const char *v595;
  uint64_t v596;
  void *v597;
  const char *v598;
  uint64_t v599;
  uint64_t v600;
  int v601;
  const char *v602;
  uint64_t v603;
  void *v604;
  const char *v605;
  uint64_t v606;
  uint64_t v607;
  const char *v608;
  uint64_t v609;
  void *v610;
  const char *v611;
  uint64_t v612;
  uint64_t v613;
  const char *v614;
  uint64_t v615;
  void *v616;
  const char *v617;
  uint64_t v618;
  uint64_t v619;
  int v620;
  const char *v621;
  uint64_t v622;
  void *v623;
  const char *v624;
  uint64_t v625;
  uint64_t v626;
  unsigned int v627;
  const char *v628;
  uint64_t v629;
  void *v630;
  const char *v631;
  uint64_t v632;
  uint64_t v633;
  const char *v634;
  uint64_t v635;
  void *v636;
  const char *v637;
  uint64_t v638;
  uint64_t v639;
  const char *v640;
  uint64_t v641;
  void *v642;
  const char *v643;
  uint64_t v644;
  uint64_t v645;
  unsigned int v646;
  const char *v647;
  uint64_t v648;
  void *v649;
  const char *v650;
  uint64_t v651;
  uint64_t v652;
  unsigned int v653;
  const char *v654;
  uint64_t v655;
  void *v656;
  const char *v657;
  uint64_t v658;
  uint64_t v659;
  const char *v660;
  uint64_t v661;
  void *v662;
  const char *v663;
  uint64_t v664;
  uint64_t v665;
  const char *v666;
  uint64_t v667;
  int v668;
  double v669;
  const char *v670;
  uint64_t v671;
  uint64_t v672;
  void *v673;
  const char *v674;
  uint64_t v675;
  void *v676;
  const char *v677;
  uint64_t v678;
  uint64_t v679;
  int v680;
  const char *v681;
  uint64_t v682;
  void *v683;
  const char *v684;
  uint64_t v685;
  uint64_t v686;
  int v687;
  const char *v688;
  uint64_t v689;
  void *v690;
  const char *v691;
  uint64_t v692;
  uint64_t v693;
  const char *v694;
  uint64_t v695;
  void *v696;
  const char *v697;
  uint64_t v698;
  uint64_t v699;
  const char *v700;
  uint64_t v701;
  void *v702;
  const char *v703;
  uint64_t v704;
  uint64_t v705;
  int v706;
  const char *v707;
  uint64_t v708;
  void *v709;
  const char *v710;
  uint64_t v711;
  uint64_t v712;
  int v713;
  const char *v714;
  uint64_t v715;
  void *v716;
  const char *v717;
  uint64_t v718;
  uint64_t v719;
  const char *v720;
  uint64_t v721;
  void *v722;
  const char *v723;
  uint64_t v724;
  uint64_t v725;
  const char *v726;
  uint64_t v727;
  void *v728;
  const char *v729;
  uint64_t v730;
  uint64_t v731;
  int v732;
  const char *v733;
  uint64_t v734;
  void *v735;
  const char *v736;
  uint64_t v737;
  uint64_t v738;
  unsigned int v739;
  const char *v740;
  uint64_t v741;
  void *v742;
  const char *v743;
  uint64_t v744;
  uint64_t v745;
  const char *v746;
  uint64_t v747;
  void *v748;
  const char *v749;
  uint64_t v750;
  uint64_t v751;
  const char *v752;
  uint64_t v753;
  void *v754;
  const char *v755;
  uint64_t v756;
  uint64_t v757;
  unsigned int v758;
  const char *v759;
  uint64_t v760;
  void *v761;
  const char *v762;
  uint64_t v763;
  uint64_t v764;
  unsigned int v765;
  const char *v766;
  uint64_t v767;
  void *v768;
  const char *v769;
  uint64_t v770;
  uint64_t v771;
  const char *v772;
  uint64_t v773;
  void *v774;
  const char *v775;
  uint64_t v776;
  uint64_t v777;
  const char *v778;
  uint64_t v779;
  int v780;
  double v781;
  const char *v782;
  uint64_t v783;
  uint64_t v784;
  void *v785;
  const char *v786;
  uint64_t v787;
  void *v788;
  const char *v789;
  uint64_t v790;
  uint64_t v791;
  int v792;
  const char *v793;
  uint64_t v794;
  void *v795;
  const char *v796;
  uint64_t v797;
  uint64_t v798;
  int v799;
  const char *v800;
  uint64_t v801;
  void *v802;
  const char *v803;
  uint64_t v804;
  uint64_t v805;
  const char *v806;
  uint64_t v807;
  void *v808;
  const char *v809;
  uint64_t v810;
  uint64_t v811;
  const char *v812;
  uint64_t v813;
  void *v814;
  const char *v815;
  uint64_t v816;
  uint64_t v817;
  int v818;
  const char *v819;
  uint64_t v820;
  void *v821;
  const char *v822;
  uint64_t v823;
  uint64_t v824;
  int v825;
  const char *v826;
  uint64_t v827;
  void *v828;
  const char *v829;
  uint64_t v830;
  uint64_t v831;
  const char *v832;
  uint64_t v833;
  void *v834;
  const char *v835;
  uint64_t v836;
  uint64_t v837;
  const char *v838;
  uint64_t v839;
  void *v840;
  const char *v841;
  uint64_t v842;
  uint64_t v843;
  int v844;
  const char *v845;
  uint64_t v846;
  void *v847;
  const char *v848;
  uint64_t v849;
  uint64_t v850;
  unsigned int v851;
  const char *v852;
  uint64_t v853;
  void *v854;
  const char *v855;
  uint64_t v856;
  uint64_t v857;
  const char *v858;
  uint64_t v859;
  void *v860;
  const char *v861;
  uint64_t v862;
  uint64_t v863;
  const char *v864;
  uint64_t v865;
  void *v866;
  const char *v867;
  uint64_t v868;
  uint64_t v869;
  unsigned int v870;
  const char *v871;
  uint64_t v872;
  void *v873;
  const char *v874;
  uint64_t v875;
  uint64_t v876;
  unsigned int v877;
  const char *v878;
  uint64_t v879;
  void *v880;
  const char *v881;
  uint64_t v882;
  uint64_t v883;
  const char *v884;
  uint64_t v885;
  void *v886;
  const char *v887;
  uint64_t v888;
  uint64_t v889;
  const char *v890;
  uint64_t v891;
  int v892;
  double v893;
  const char *v894;
  uint64_t v895;
  uint64_t v896;
  void *v897;
  const char *v898;
  uint64_t v899;
  void *v900;
  const char *v901;
  uint64_t v902;
  uint64_t v903;
  int v904;
  const char *v905;
  uint64_t v906;
  void *v907;
  const char *v908;
  uint64_t v909;
  uint64_t v910;
  int v911;
  const char *v912;
  uint64_t v913;
  void *v914;
  const char *v915;
  uint64_t v916;
  uint64_t v917;
  const char *v918;
  uint64_t v919;
  void *v920;
  const char *v921;
  uint64_t v922;
  uint64_t v923;
  const char *v924;
  uint64_t v925;
  void *v926;
  const char *v927;
  uint64_t v928;
  uint64_t v929;
  int v930;
  const char *v931;
  uint64_t v932;
  void *v933;
  const char *v934;
  uint64_t v935;
  uint64_t v936;
  int v937;
  const char *v938;
  uint64_t v939;
  void *v940;
  const char *v941;
  uint64_t v942;
  uint64_t v943;
  const char *v944;
  uint64_t v945;
  void *v946;
  const char *v947;
  uint64_t v948;
  uint64_t v949;
  const char *v950;
  uint64_t v951;
  void *v952;
  const char *v953;
  uint64_t v954;
  uint64_t v955;
  int v956;
  const char *v957;
  uint64_t v958;
  void *v959;
  const char *v960;
  uint64_t v961;
  uint64_t v962;
  unsigned int v963;
  const char *v964;
  uint64_t v965;
  void *v966;
  const char *v967;
  uint64_t v968;
  uint64_t v969;
  const char *v970;
  uint64_t v971;
  void *v972;
  const char *v973;
  uint64_t v974;
  uint64_t v975;
  const char *v976;
  uint64_t v977;
  void *v978;
  const char *v979;
  uint64_t v980;
  uint64_t v981;
  unsigned int v982;
  const char *v983;
  uint64_t v984;
  void *v985;
  const char *v986;
  uint64_t v987;
  uint64_t v988;
  unsigned int v989;
  const char *v990;
  uint64_t v991;
  void *v992;
  const char *v993;
  uint64_t v994;
  uint64_t v995;
  const char *v996;
  uint64_t v997;
  void *v998;
  const char *v999;
  uint64_t v1000;
  uint64_t v1001;
  const char *v1002;
  uint64_t v1003;
  const char *v1004;
  uint64_t v1005;
  uint64_t v1006;
  double v1007;
  void *v1008;
  const char *v1009;
  uint64_t v1010;
  void *v1011;
  const char *v1012;
  uint64_t v1013;
  uint64_t v1014;
  int v1015;
  const char *v1016;
  uint64_t v1017;
  void *v1018;
  const char *v1019;
  uint64_t v1020;
  uint64_t v1021;
  int v1022;
  const char *v1023;
  uint64_t v1024;
  void *v1025;
  const char *v1026;
  uint64_t v1027;
  uint64_t v1028;
  const char *v1029;
  uint64_t v1030;
  void *v1031;
  const char *v1032;
  uint64_t v1033;
  uint64_t v1034;
  const char *v1035;
  uint64_t v1036;
  void *v1037;
  const char *v1038;
  uint64_t v1039;
  uint64_t v1040;
  int v1041;
  const char *v1042;
  uint64_t v1043;
  void *v1044;
  const char *v1045;
  uint64_t v1046;
  uint64_t v1047;
  int v1048;
  const char *v1049;
  uint64_t v1050;
  void *v1051;
  const char *v1052;
  uint64_t v1053;
  uint64_t v1054;
  const char *v1055;
  uint64_t v1056;
  void *v1057;
  const char *v1058;
  uint64_t v1059;
  uint64_t v1060;
  const char *v1061;
  uint64_t v1062;
  void *v1063;
  const char *v1064;
  uint64_t v1065;
  uint64_t v1066;
  int v1067;
  const char *v1068;
  uint64_t v1069;
  void *v1070;
  const char *v1071;
  uint64_t v1072;
  uint64_t v1073;
  unsigned int v1074;
  const char *v1075;
  uint64_t v1076;
  void *v1077;
  const char *v1078;
  uint64_t v1079;
  uint64_t v1080;
  const char *v1081;
  uint64_t v1082;
  void *v1083;
  const char *v1084;
  uint64_t v1085;
  uint64_t v1086;
  const char *v1087;
  uint64_t v1088;
  void *v1089;
  const char *v1090;
  uint64_t v1091;
  uint64_t v1092;
  unsigned int v1093;
  const char *v1094;
  uint64_t v1095;
  void *v1096;
  const char *v1097;
  uint64_t v1098;
  uint64_t v1099;
  unsigned int v1100;
  const char *v1101;
  uint64_t v1102;
  void *v1103;
  const char *v1104;
  uint64_t v1105;
  uint64_t v1106;
  const char *v1107;
  uint64_t v1108;
  void *v1109;
  const char *v1110;
  uint64_t v1111;
  uint64_t v1112;
  const char *v1113;
  uint64_t v1114;
  int v1115;
  double v1116;
  const char *v1117;
  uint64_t v1118;
  uint64_t v1119;
  void *v1120;
  const char *v1121;
  uint64_t v1122;
  void *v1123;
  const char *v1124;
  uint64_t v1125;
  uint64_t v1126;
  int v1127;
  const char *v1128;
  uint64_t v1129;
  void *v1130;
  const char *v1131;
  uint64_t v1132;
  uint64_t v1133;
  int v1134;
  const char *v1135;
  uint64_t v1136;
  void *v1137;
  const char *v1138;
  uint64_t v1139;
  uint64_t v1140;
  const char *v1141;
  uint64_t v1142;
  void *v1143;
  const char *v1144;
  uint64_t v1145;
  uint64_t v1146;
  const char *v1147;
  uint64_t v1148;
  void *v1149;
  const char *v1150;
  uint64_t v1151;
  uint64_t v1152;
  int v1153;
  const char *v1154;
  uint64_t v1155;
  void *v1156;
  const char *v1157;
  uint64_t v1158;
  uint64_t v1159;
  int v1160;
  const char *v1161;
  uint64_t v1162;
  void *v1163;
  const char *v1164;
  uint64_t v1165;
  uint64_t v1166;
  const char *v1167;
  uint64_t v1168;
  void *v1169;
  const char *v1170;
  uint64_t v1171;
  uint64_t v1172;
  const char *v1173;
  uint64_t v1174;
  void *v1175;
  const char *v1176;
  uint64_t v1177;
  uint64_t v1178;
  int v1179;
  const char *v1180;
  uint64_t v1181;
  void *v1182;
  const char *v1183;
  uint64_t v1184;
  uint64_t v1185;
  unsigned int v1186;
  const char *v1187;
  uint64_t v1188;
  void *v1189;
  const char *v1190;
  uint64_t v1191;
  uint64_t v1192;
  const char *v1193;
  uint64_t v1194;
  void *v1195;
  const char *v1196;
  uint64_t v1197;
  uint64_t v1198;
  const char *v1199;
  uint64_t v1200;
  void *v1201;
  const char *v1202;
  uint64_t v1203;
  uint64_t v1204;
  unsigned int v1205;
  const char *v1206;
  uint64_t v1207;
  void *v1208;
  const char *v1209;
  uint64_t v1210;
  uint64_t v1211;
  unsigned int v1212;
  const char *v1213;
  uint64_t v1214;
  void *v1215;
  const char *v1216;
  uint64_t v1217;
  uint64_t v1218;
  const char *v1219;
  uint64_t v1220;
  void *v1221;
  const char *v1222;
  uint64_t v1223;
  uint64_t v1224;
  const char *v1225;
  uint64_t v1226;
  int v1227;
  double v1228;
  const char *v1229;
  uint64_t v1230;
  uint64_t v1231;
  void *v1232;
  const char *v1233;
  uint64_t v1234;
  void *v1235;
  const char *v1236;
  uint64_t v1237;
  uint64_t v1238;
  int v1239;
  const char *v1240;
  uint64_t v1241;
  void *v1242;
  const char *v1243;
  uint64_t v1244;
  uint64_t v1245;
  int v1246;
  const char *v1247;
  uint64_t v1248;
  void *v1249;
  const char *v1250;
  uint64_t v1251;
  uint64_t v1252;
  const char *v1253;
  uint64_t v1254;
  void *v1255;
  const char *v1256;
  uint64_t v1257;
  uint64_t v1258;
  const char *v1259;
  uint64_t v1260;
  void *v1261;
  const char *v1262;
  uint64_t v1263;
  uint64_t v1264;
  int v1265;
  const char *v1266;
  uint64_t v1267;
  void *v1268;
  const char *v1269;
  uint64_t v1270;
  uint64_t v1271;
  int v1272;
  const char *v1273;
  uint64_t v1274;
  void *v1275;
  const char *v1276;
  uint64_t v1277;
  uint64_t v1278;
  const char *v1279;
  uint64_t v1280;
  void *v1281;
  const char *v1282;
  uint64_t v1283;
  uint64_t v1284;
  const char *v1285;
  uint64_t v1286;
  void *v1287;
  const char *v1288;
  uint64_t v1289;
  uint64_t v1290;
  int v1291;
  const char *v1292;
  uint64_t v1293;
  void *v1294;
  const char *v1295;
  uint64_t v1296;
  uint64_t v1297;
  unsigned int v1298;
  const char *v1299;
  uint64_t v1300;
  void *v1301;
  const char *v1302;
  uint64_t v1303;
  uint64_t v1304;
  const char *v1305;
  uint64_t v1306;
  void *v1307;
  const char *v1308;
  uint64_t v1309;
  uint64_t v1310;
  const char *v1311;
  uint64_t v1312;
  void *v1313;
  const char *v1314;
  uint64_t v1315;
  uint64_t v1316;
  unsigned int v1317;
  const char *v1318;
  uint64_t v1319;
  void *v1320;
  const char *v1321;
  uint64_t v1322;
  uint64_t v1323;
  unsigned int v1324;
  const char *v1325;
  uint64_t v1326;
  void *v1327;
  const char *v1328;
  uint64_t v1329;
  uint64_t v1330;
  const char *v1331;
  uint64_t v1332;
  void *v1333;
  const char *v1334;
  uint64_t v1335;
  uint64_t v1336;
  const char *v1337;
  uint64_t v1338;
  int v1339;
  double v1340;
  const char *v1341;
  uint64_t v1342;
  uint64_t v1343;
  void *v1344;
  const char *v1345;
  uint64_t v1346;
  void *v1347;
  const char *v1348;
  uint64_t v1349;
  uint64_t v1350;
  int v1351;
  const char *v1352;
  uint64_t v1353;
  void *v1354;
  const char *v1355;
  uint64_t v1356;
  uint64_t v1357;
  int v1358;
  const char *v1359;
  uint64_t v1360;
  void *v1361;
  const char *v1362;
  uint64_t v1363;
  uint64_t v1364;
  const char *v1365;
  uint64_t v1366;
  void *v1367;
  const char *v1368;
  uint64_t v1369;
  uint64_t v1370;
  const char *v1371;
  uint64_t v1372;
  void *v1373;
  const char *v1374;
  uint64_t v1375;
  uint64_t v1376;
  int v1377;
  const char *v1378;
  uint64_t v1379;
  void *v1380;
  const char *v1381;
  uint64_t v1382;
  uint64_t v1383;
  int v1384;
  const char *v1385;
  uint64_t v1386;
  void *v1387;
  const char *v1388;
  uint64_t v1389;
  uint64_t v1390;
  const char *v1391;
  uint64_t v1392;
  void *v1393;
  const char *v1394;
  uint64_t v1395;
  uint64_t v1396;
  const char *v1397;
  uint64_t v1398;
  void *v1399;
  const char *v1400;
  uint64_t v1401;
  uint64_t v1402;
  int v1403;
  const char *v1404;
  uint64_t v1405;
  void *v1406;
  const char *v1407;
  uint64_t v1408;
  uint64_t v1409;
  unsigned int v1410;
  const char *v1411;
  uint64_t v1412;
  void *v1413;
  const char *v1414;
  uint64_t v1415;
  uint64_t v1416;
  const char *v1417;
  uint64_t v1418;
  void *v1419;
  const char *v1420;
  uint64_t v1421;
  uint64_t v1422;
  const char *v1423;
  uint64_t v1424;
  void *v1425;
  const char *v1426;
  uint64_t v1427;
  uint64_t v1428;
  unsigned int v1429;
  const char *v1430;
  uint64_t v1431;
  void *v1432;
  const char *v1433;
  uint64_t v1434;
  uint64_t v1435;
  unsigned int v1436;
  const char *v1437;
  uint64_t v1438;
  void *v1439;
  const char *v1440;
  uint64_t v1441;
  uint64_t v1442;
  const char *v1443;
  uint64_t v1444;
  void *v1445;
  const char *v1446;
  uint64_t v1447;
  uint64_t v1448;
  const char *v1449;
  uint64_t v1450;
  const char *v1451;
  uint64_t v1452;
  uint64_t v1453;
  double v1454;
  void *v1455;
  const char *v1456;
  uint64_t v1457;
  void *v1458;
  const char *v1459;
  uint64_t v1460;
  uint64_t v1461;
  int v1462;
  const char *v1463;
  uint64_t v1464;
  void *v1465;
  const char *v1466;
  uint64_t v1467;
  uint64_t v1468;
  int v1469;
  const char *v1470;
  uint64_t v1471;
  void *v1472;
  const char *v1473;
  uint64_t v1474;
  uint64_t v1475;
  const char *v1476;
  uint64_t v1477;
  void *v1478;
  const char *v1479;
  uint64_t v1480;
  uint64_t v1481;
  const char *v1482;
  uint64_t v1483;
  void *v1484;
  const char *v1485;
  uint64_t v1486;
  uint64_t v1487;
  int v1488;
  const char *v1489;
  uint64_t v1490;
  void *v1491;
  const char *v1492;
  uint64_t v1493;
  uint64_t v1494;
  int v1495;
  const char *v1496;
  uint64_t v1497;
  void *v1498;
  const char *v1499;
  uint64_t v1500;
  uint64_t v1501;
  const char *v1502;
  uint64_t v1503;
  void *v1504;
  const char *v1505;
  uint64_t v1506;
  uint64_t v1507;
  const char *v1508;
  uint64_t v1509;
  void *v1510;
  const char *v1511;
  uint64_t v1512;
  uint64_t v1513;
  int v1514;
  const char *v1515;
  uint64_t v1516;
  void *v1517;
  const char *v1518;
  uint64_t v1519;
  uint64_t v1520;
  unsigned int v1521;
  const char *v1522;
  uint64_t v1523;
  void *v1524;
  const char *v1525;
  uint64_t v1526;
  uint64_t v1527;
  const char *v1528;
  uint64_t v1529;
  void *v1530;
  const char *v1531;
  uint64_t v1532;
  uint64_t v1533;
  const char *v1534;
  uint64_t v1535;
  void *v1536;
  const char *v1537;
  uint64_t v1538;
  uint64_t v1539;
  unsigned int v1540;
  const char *v1541;
  uint64_t v1542;
  void *v1543;
  const char *v1544;
  uint64_t v1545;
  uint64_t v1546;
  unsigned int v1547;
  const char *v1548;
  uint64_t v1549;
  void *v1550;
  const char *v1551;
  uint64_t v1552;
  uint64_t v1553;
  const char *v1554;
  uint64_t v1555;
  void *v1556;
  const char *v1557;
  uint64_t v1558;
  uint64_t v1559;
  const char *v1560;
  uint64_t v1561;
  int v1562;
  double v1563;
  const char *v1564;
  uint64_t v1565;
  uint64_t v1566;
  void *v1567;
  const char *v1568;
  uint64_t v1569;
  void *v1570;
  const char *v1571;
  uint64_t v1572;
  uint64_t v1573;
  int v1574;
  const char *v1575;
  uint64_t v1576;
  void *v1577;
  const char *v1578;
  uint64_t v1579;
  uint64_t v1580;
  int v1581;
  const char *v1582;
  uint64_t v1583;
  void *v1584;
  const char *v1585;
  uint64_t v1586;
  uint64_t v1587;
  const char *v1588;
  uint64_t v1589;
  void *v1590;
  const char *v1591;
  uint64_t v1592;
  uint64_t v1593;
  const char *v1594;
  uint64_t v1595;
  void *v1596;
  const char *v1597;
  uint64_t v1598;
  uint64_t v1599;
  int v1600;
  const char *v1601;
  uint64_t v1602;
  void *v1603;
  const char *v1604;
  uint64_t v1605;
  uint64_t v1606;
  int v1607;
  const char *v1608;
  uint64_t v1609;
  void *v1610;
  const char *v1611;
  uint64_t v1612;
  uint64_t v1613;
  const char *v1614;
  uint64_t v1615;
  void *v1616;
  const char *v1617;
  uint64_t v1618;
  uint64_t v1619;
  const char *v1620;
  uint64_t v1621;
  void *v1622;
  const char *v1623;
  uint64_t v1624;
  uint64_t v1625;
  int v1626;
  const char *v1627;
  uint64_t v1628;
  void *v1629;
  const char *v1630;
  uint64_t v1631;
  uint64_t v1632;
  unsigned int v1633;
  const char *v1634;
  uint64_t v1635;
  void *v1636;
  const char *v1637;
  uint64_t v1638;
  uint64_t v1639;
  const char *v1640;
  uint64_t v1641;
  void *v1642;
  const char *v1643;
  uint64_t v1644;
  uint64_t v1645;
  const char *v1646;
  uint64_t v1647;
  void *v1648;
  const char *v1649;
  uint64_t v1650;
  uint64_t v1651;
  unsigned int v1652;
  const char *v1653;
  uint64_t v1654;
  void *v1655;
  const char *v1656;
  uint64_t v1657;
  uint64_t v1658;
  unsigned int v1659;
  const char *v1660;
  uint64_t v1661;
  void *v1662;
  const char *v1663;
  uint64_t v1664;
  uint64_t v1665;
  const char *v1666;
  uint64_t v1667;
  void *v1668;
  const char *v1669;
  uint64_t v1670;
  uint64_t v1671;
  const char *v1672;
  uint64_t v1673;
  int v1674;
  double v1675;
  const char *v1676;
  uint64_t v1677;
  uint64_t v1678;
  void *v1679;
  const char *v1680;
  uint64_t v1681;
  void *v1682;
  const char *v1683;
  uint64_t v1684;
  uint64_t v1685;
  int v1686;
  const char *v1687;
  uint64_t v1688;
  void *v1689;
  const char *v1690;
  uint64_t v1691;
  uint64_t v1692;
  int v1693;
  const char *v1694;
  uint64_t v1695;
  void *v1696;
  const char *v1697;
  uint64_t v1698;
  uint64_t v1699;
  const char *v1700;
  uint64_t v1701;
  void *v1702;
  const char *v1703;
  uint64_t v1704;
  uint64_t v1705;
  const char *v1706;
  uint64_t v1707;
  void *v1708;
  const char *v1709;
  uint64_t v1710;
  uint64_t v1711;
  int v1712;
  const char *v1713;
  uint64_t v1714;
  void *v1715;
  const char *v1716;
  uint64_t v1717;
  uint64_t v1718;
  int v1719;
  const char *v1720;
  uint64_t v1721;
  void *v1722;
  const char *v1723;
  uint64_t v1724;
  uint64_t v1725;
  const char *v1726;
  uint64_t v1727;
  void *v1728;
  const char *v1729;
  uint64_t v1730;
  uint64_t v1731;
  const char *v1732;
  uint64_t v1733;
  void *v1734;
  const char *v1735;
  uint64_t v1736;
  uint64_t v1737;
  int v1738;
  const char *v1739;
  uint64_t v1740;
  void *v1741;
  const char *v1742;
  uint64_t v1743;
  uint64_t v1744;
  unsigned int v1745;
  const char *v1746;
  uint64_t v1747;
  void *v1748;
  const char *v1749;
  uint64_t v1750;
  uint64_t v1751;
  const char *v1752;
  uint64_t v1753;
  void *v1754;
  const char *v1755;
  uint64_t v1756;
  uint64_t v1757;
  const char *v1758;
  uint64_t v1759;
  void *v1760;
  const char *v1761;
  uint64_t v1762;
  uint64_t v1763;
  unsigned int v1764;
  const char *v1765;
  uint64_t v1766;
  void *v1767;
  const char *v1768;
  uint64_t v1769;
  uint64_t v1770;
  unsigned int v1771;
  const char *v1772;
  uint64_t v1773;
  void *v1774;
  const char *v1775;
  uint64_t v1776;
  uint64_t v1777;
  const char *v1778;
  uint64_t v1779;
  void *v1780;
  const char *v1781;
  uint64_t v1782;
  uint64_t v1783;
  const char *v1784;
  uint64_t v1785;
  int v1786;
  double v1787;
  const char *v1788;
  uint64_t v1789;
  uint64_t v1790;
  const char *v1791;
  unsigned int v1793;
  unsigned int v1794;
  unsigned int v1795;
  unsigned int v1796;
  unsigned int v1797;
  unsigned int v1798;
  unsigned int v1799;
  unsigned int v1800;
  unsigned int v1801;
  unsigned int v1802;
  unsigned int v1803;
  unsigned int v1804;
  unsigned int v1805;
  unsigned int v1806;
  unsigned int v1807;
  unsigned int v1808;
  unsigned int v1809;
  unsigned int v1810;
  unsigned int v1811;
  unsigned int v1812;
  unsigned int v1813;
  unsigned int v1814;
  unsigned int v1815;
  unsigned int v1816;
  unsigned int v1817;
  unsigned int v1818;
  unsigned int v1819;
  unsigned int v1820;
  unsigned int v1821;
  unsigned int v1822;
  unsigned int v1823;
  unsigned int v1824;
  unsigned int v1825;
  unsigned int v1826;
  unsigned int v1827;
  unsigned int v1828;
  unsigned int v1829;
  unsigned int v1830;
  unsigned int v1831;
  unsigned int v1832;
  unsigned int v1833;
  unsigned int v1834;
  unsigned int v1835;
  unsigned int v1836;
  unsigned int v1837;
  unsigned int v1838;
  unsigned int v1839;
  unsigned int v1840;
  unsigned int v1841;
  unsigned int v1842;
  double v1843;
  double v1844;
  double v1845;
  double v1846;
  double v1847;
  double v1848;
  double v1849;
  double v1850;
  double v1851;
  double v1852;
  double v1853;
  double v1854;
  double v1855;
  double v1856;
  double v1857;
  double v1858;
  unsigned int v1859;
  unsigned int v1860;
  double v1861;
  double v1862;
  double v1863;
  double v1864;
  double v1865;
  double v1866;
  double v1867;
  double v1868;
  double v1869;
  double v1870;
  double v1871;
  double v1872;
  double v1873;
  double v1874;
  double v1875;
  double v1876;
  unsigned int v1877;
  double v1878;
  double v1879;
  double v1880;
  double v1881;
  double v1882;
  double v1883;
  double v1884;
  double v1885;
  double v1886;
  double v1887;
  double v1888;
  double v1889;
  double v1890;
  double v1891;
  double v1892;
  double v1893;
  _QWORD v1894[17];

  v1894[16] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v8, v9, v10, v11);
  v1877 = v12;
  v15 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  v1859 = v19;
  v22 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v20, 2, v21);
  objc_msgSend_floatValue(v22, v23, v24, v25);
  v28 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v26, 3, v27);
  objc_msgSend_floatValue(v28, v29, v30, v31);
  *(_QWORD *)&v1878 = __PAIR64__(v1859, v1877);
  v34 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v32, 4, v33);
  objc_msgSend_floatValue(v34, v35, v36, v37);
  v1860 = v38;
  v41 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v39, 5, v40);
  objc_msgSend_floatValue(v41, v42, v43, v44);
  v1841 = v45;
  v48 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v46, 6, v47);
  objc_msgSend_floatValue(v48, v49, v50, v51);
  v54 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v52, 7, v53);
  objc_msgSend_floatValue(v54, v55, v56, v57);
  *(_QWORD *)&v1861 = __PAIR64__(v1841, v1860);
  v60 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v58, 8, v59);
  objc_msgSend_floatValue(v60, v61, v62, v63);
  v1842 = v64;
  v67 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v65, 9, v66);
  objc_msgSend_floatValue(v67, v68, v69, v70);
  v1809 = v71;
  v74 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v72, 10, v73);
  objc_msgSend_floatValue(v74, v75, v76, v77);
  v80 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v78, 11, v79);
  objc_msgSend_floatValue(v80, v81, v82, v83);
  *(_QWORD *)&v1843 = __PAIR64__(v1809, v1842);
  v86 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v84, 12, v85);
  objc_msgSend_floatValue(v86, v87, v88, v89);
  v1810 = v90;
  v93 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v91, 13, v92);
  objc_msgSend_floatValue(v93, v94, v95, v96);
  v1793 = v97;
  v100 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v98, 14, v99);
  objc_msgSend_floatValue(v100, v101, v102, v103);
  v106 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v104, 15, v105);
  objc_msgSend_floatValue(v106, v107, v108, v109);
  objc_msgSend_convertTransform_fromNode_(self, v110, (uint64_t)a4, v111, v1878, v1861, v1843, COERCE_DOUBLE(__PAIR64__(v1793, v1810)));
  v1894[0] = objc_msgSend_numberWithFloat_(v7, v112, v113, v114);
  v115 = (void *)MEMORY[0x1E0CB37E8];
  v118 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v116, 0, v117);
  objc_msgSend_floatValue(v118, v119, v120, v121);
  LODWORD(v1878) = v122;
  v125 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v123, 1, v124);
  objc_msgSend_floatValue(v125, v126, v127, v128);
  LODWORD(v1861) = v129;
  v132 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v130, 2, v131);
  objc_msgSend_floatValue(v132, v133, v134, v135);
  v138 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v136, 3, v137);
  objc_msgSend_floatValue(v138, v139, v140, v141);
  *(_QWORD *)&v1879 = __PAIR64__(LODWORD(v1861), LODWORD(v1878));
  v144 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v142, 4, v143);
  objc_msgSend_floatValue(v144, v145, v146, v147);
  LODWORD(v1861) = v148;
  v151 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v149, 5, v150);
  objc_msgSend_floatValue(v151, v152, v153, v154);
  LODWORD(v1843) = v155;
  v158 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v156, 6, v157);
  objc_msgSend_floatValue(v158, v159, v160, v161);
  v164 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v162, 7, v163);
  objc_msgSend_floatValue(v164, v165, v166, v167);
  *(_QWORD *)&v1862 = __PAIR64__(LODWORD(v1843), LODWORD(v1861));
  v170 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v168, 8, v169);
  objc_msgSend_floatValue(v170, v171, v172, v173);
  LODWORD(v1843) = v174;
  v177 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v175, 9, v176);
  objc_msgSend_floatValue(v177, v178, v179, v180);
  v1811 = v181;
  v184 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v182, 10, v183);
  objc_msgSend_floatValue(v184, v185, v186, v187);
  v190 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v188, 11, v189);
  objc_msgSend_floatValue(v190, v191, v192, v193);
  *(_QWORD *)&v1844 = __PAIR64__(v1811, LODWORD(v1843));
  v196 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v194, 12, v195);
  objc_msgSend_floatValue(v196, v197, v198, v199);
  v1812 = v200;
  v203 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v201, 13, v202);
  objc_msgSend_floatValue(v203, v204, v205, v206);
  v1794 = v207;
  v210 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v208, 14, v209);
  objc_msgSend_floatValue(v210, v211, v212, v213);
  v216 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v214, 15, v215);
  objc_msgSend_floatValue(v216, v217, v218, v219);
  objc_msgSend_convertTransform_fromNode_(self, v220, (uint64_t)a4, v221, v1879, v1862, v1844, COERCE_DOUBLE(__PAIR64__(v1794, v1812)));
  LODWORD(v222) = HIDWORD(v222);
  v1894[1] = objc_msgSend_numberWithFloat_(v115, v223, v224, v225, v222);
  v226 = (void *)MEMORY[0x1E0CB37E8];
  v229 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v227, 0, v228);
  objc_msgSend_floatValue(v229, v230, v231, v232);
  LODWORD(v1879) = v233;
  v236 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v234, 1, v235);
  objc_msgSend_floatValue(v236, v237, v238, v239);
  LODWORD(v1862) = v240;
  v243 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v241, 2, v242);
  objc_msgSend_floatValue(v243, v244, v245, v246);
  v249 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v247, 3, v248);
  objc_msgSend_floatValue(v249, v250, v251, v252);
  *(_QWORD *)&v1880 = __PAIR64__(LODWORD(v1862), LODWORD(v1879));
  v255 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v253, 4, v254);
  objc_msgSend_floatValue(v255, v256, v257, v258);
  LODWORD(v1862) = v259;
  v262 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v260, 5, v261);
  objc_msgSend_floatValue(v262, v263, v264, v265);
  LODWORD(v1844) = v266;
  v269 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v267, 6, v268);
  objc_msgSend_floatValue(v269, v270, v271, v272);
  v275 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v273, 7, v274);
  objc_msgSend_floatValue(v275, v276, v277, v278);
  *(_QWORD *)&v1863 = __PAIR64__(LODWORD(v1844), LODWORD(v1862));
  v281 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v279, 8, v280);
  objc_msgSend_floatValue(v281, v282, v283, v284);
  LODWORD(v1844) = v285;
  v288 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v286, 9, v287);
  objc_msgSend_floatValue(v288, v289, v290, v291);
  v1813 = v292;
  v295 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v293, 10, v294);
  objc_msgSend_floatValue(v295, v296, v297, v298);
  v301 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v299, 11, v300);
  objc_msgSend_floatValue(v301, v302, v303, v304);
  *(_QWORD *)&v1845 = __PAIR64__(v1813, LODWORD(v1844));
  v307 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v305, 12, v306);
  objc_msgSend_floatValue(v307, v308, v309, v310);
  v1814 = v311;
  v314 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v312, 13, v313);
  objc_msgSend_floatValue(v314, v315, v316, v317);
  v1795 = v318;
  v321 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v319, 14, v320);
  objc_msgSend_floatValue(v321, v322, v323, v324);
  v327 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v325, 15, v326);
  objc_msgSend_floatValue(v327, v328, v329, v330);
  objc_msgSend_convertTransform_fromNode_(self, v331, (uint64_t)a4, v332, v1880, v1863, v1845, COERCE_DOUBLE(__PAIR64__(v1795, v1814)));
  LODWORD(v334) = v333;
  v1894[2] = objc_msgSend_numberWithFloat_(v226, v335, v336, v337, v334);
  v338 = (void *)MEMORY[0x1E0CB37E8];
  v341 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v339, 0, v340);
  objc_msgSend_floatValue(v341, v342, v343, v344);
  LODWORD(v1880) = v345;
  v348 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v346, 1, v347);
  objc_msgSend_floatValue(v348, v349, v350, v351);
  LODWORD(v1863) = v352;
  v355 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v353, 2, v354);
  objc_msgSend_floatValue(v355, v356, v357, v358);
  v361 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v359, 3, v360);
  objc_msgSend_floatValue(v361, v362, v363, v364);
  *(_QWORD *)&v1881 = __PAIR64__(LODWORD(v1863), LODWORD(v1880));
  v367 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v365, 4, v366);
  objc_msgSend_floatValue(v367, v368, v369, v370);
  LODWORD(v1863) = v371;
  v374 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v372, 5, v373);
  objc_msgSend_floatValue(v374, v375, v376, v377);
  LODWORD(v1845) = v378;
  v381 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v379, 6, v380);
  objc_msgSend_floatValue(v381, v382, v383, v384);
  v387 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v385, 7, v386);
  objc_msgSend_floatValue(v387, v388, v389, v390);
  *(_QWORD *)&v1864 = __PAIR64__(LODWORD(v1845), LODWORD(v1863));
  v393 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v391, 8, v392);
  objc_msgSend_floatValue(v393, v394, v395, v396);
  LODWORD(v1845) = v397;
  v400 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v398, 9, v399);
  objc_msgSend_floatValue(v400, v401, v402, v403);
  v1815 = v404;
  v407 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v405, 10, v406);
  objc_msgSend_floatValue(v407, v408, v409, v410);
  v413 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v411, 11, v412);
  objc_msgSend_floatValue(v413, v414, v415, v416);
  *(_QWORD *)&v1846 = __PAIR64__(v1815, LODWORD(v1845));
  v419 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v417, 12, v418);
  objc_msgSend_floatValue(v419, v420, v421, v422);
  v1816 = v423;
  v426 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v424, 13, v425);
  objc_msgSend_floatValue(v426, v427, v428, v429);
  v1796 = v430;
  v433 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v431, 14, v432);
  objc_msgSend_floatValue(v433, v434, v435, v436);
  v439 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v437, 15, v438);
  objc_msgSend_floatValue(v439, v440, v441, v442);
  objc_msgSend_convertTransform_fromNode_(self, v443, (uint64_t)a4, v444, v1881, v1864, v1846, COERCE_DOUBLE(__PAIR64__(v1796, v1816)));
  LODWORD(v446) = v445;
  v1894[3] = objc_msgSend_numberWithFloat_(v338, v447, v448, v449, v446);
  v450 = (void *)MEMORY[0x1E0CB37E8];
  v453 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v451, 0, v452);
  objc_msgSend_floatValue(v453, v454, v455, v456);
  LODWORD(v1881) = v457;
  v460 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v458, 1, v459);
  objc_msgSend_floatValue(v460, v461, v462, v463);
  LODWORD(v1864) = v464;
  v467 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v465, 2, v466);
  objc_msgSend_floatValue(v467, v468, v469, v470);
  v473 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v471, 3, v472);
  objc_msgSend_floatValue(v473, v474, v475, v476);
  *(_QWORD *)&v1882 = __PAIR64__(LODWORD(v1864), LODWORD(v1881));
  v479 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v477, 4, v478);
  objc_msgSend_floatValue(v479, v480, v481, v482);
  LODWORD(v1864) = v483;
  v486 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v484, 5, v485);
  objc_msgSend_floatValue(v486, v487, v488, v489);
  LODWORD(v1846) = v490;
  v493 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v491, 6, v492);
  objc_msgSend_floatValue(v493, v494, v495, v496);
  v499 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v497, 7, v498);
  objc_msgSend_floatValue(v499, v500, v501, v502);
  *(_QWORD *)&v1865 = __PAIR64__(LODWORD(v1846), LODWORD(v1864));
  v505 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v503, 8, v504);
  objc_msgSend_floatValue(v505, v506, v507, v508);
  LODWORD(v1846) = v509;
  v512 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v510, 9, v511);
  objc_msgSend_floatValue(v512, v513, v514, v515);
  v1817 = v516;
  v519 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v517, 10, v518);
  objc_msgSend_floatValue(v519, v520, v521, v522);
  v525 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v523, 11, v524);
  objc_msgSend_floatValue(v525, v526, v527, v528);
  *(_QWORD *)&v1847 = __PAIR64__(v1817, LODWORD(v1846));
  v531 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v529, 12, v530);
  objc_msgSend_floatValue(v531, v532, v533, v534);
  v1818 = v535;
  v538 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v536, 13, v537);
  objc_msgSend_floatValue(v538, v539, v540, v541);
  v1797 = v542;
  v545 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v543, 14, v544);
  objc_msgSend_floatValue(v545, v546, v547, v548);
  v551 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v549, 15, v550);
  objc_msgSend_floatValue(v551, v552, v553, v554);
  objc_msgSend_convertTransform_fromNode_(self, v555, (uint64_t)a4, v556, v1882, v1865, v1847, COERCE_DOUBLE(__PAIR64__(v1797, v1818)));
  v1894[4] = objc_msgSend_numberWithFloat_(v450, v557, v558, v559, v560);
  v561 = (void *)MEMORY[0x1E0CB37E8];
  v564 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v562, 0, v563);
  objc_msgSend_floatValue(v564, v565, v566, v567);
  LODWORD(v1882) = v568;
  v571 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v569, 1, v570);
  objc_msgSend_floatValue(v571, v572, v573, v574);
  LODWORD(v1865) = v575;
  v578 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v576, 2, v577);
  objc_msgSend_floatValue(v578, v579, v580, v581);
  v584 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v582, 3, v583);
  objc_msgSend_floatValue(v584, v585, v586, v587);
  *(_QWORD *)&v1883 = __PAIR64__(LODWORD(v1865), LODWORD(v1882));
  v590 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v588, 4, v589);
  objc_msgSend_floatValue(v590, v591, v592, v593);
  LODWORD(v1865) = v594;
  v597 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v595, 5, v596);
  objc_msgSend_floatValue(v597, v598, v599, v600);
  LODWORD(v1847) = v601;
  v604 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v602, 6, v603);
  objc_msgSend_floatValue(v604, v605, v606, v607);
  v610 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v608, 7, v609);
  objc_msgSend_floatValue(v610, v611, v612, v613);
  *(_QWORD *)&v1866 = __PAIR64__(LODWORD(v1847), LODWORD(v1865));
  v616 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v614, 8, v615);
  objc_msgSend_floatValue(v616, v617, v618, v619);
  LODWORD(v1847) = v620;
  v623 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v621, 9, v622);
  objc_msgSend_floatValue(v623, v624, v625, v626);
  v1819 = v627;
  v630 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v628, 10, v629);
  objc_msgSend_floatValue(v630, v631, v632, v633);
  v636 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v634, 11, v635);
  objc_msgSend_floatValue(v636, v637, v638, v639);
  *(_QWORD *)&v1848 = __PAIR64__(v1819, LODWORD(v1847));
  v642 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v640, 12, v641);
  objc_msgSend_floatValue(v642, v643, v644, v645);
  v1820 = v646;
  v649 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v647, 13, v648);
  objc_msgSend_floatValue(v649, v650, v651, v652);
  v1798 = v653;
  v656 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v654, 14, v655);
  objc_msgSend_floatValue(v656, v657, v658, v659);
  v662 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v660, 15, v661);
  objc_msgSend_floatValue(v662, v663, v664, v665);
  objc_msgSend_convertTransform_fromNode_(self, v666, (uint64_t)a4, v667, v1883, v1866, v1848, COERCE_DOUBLE(__PAIR64__(v1798, v1820)));
  LODWORD(v669) = v668;
  v1894[5] = objc_msgSend_numberWithFloat_(v561, v670, v671, v672, v669);
  v673 = (void *)MEMORY[0x1E0CB37E8];
  v676 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v674, 0, v675);
  objc_msgSend_floatValue(v676, v677, v678, v679);
  LODWORD(v1883) = v680;
  v683 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v681, 1, v682);
  objc_msgSend_floatValue(v683, v684, v685, v686);
  LODWORD(v1866) = v687;
  v690 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v688, 2, v689);
  objc_msgSend_floatValue(v690, v691, v692, v693);
  v696 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v694, 3, v695);
  objc_msgSend_floatValue(v696, v697, v698, v699);
  *(_QWORD *)&v1884 = __PAIR64__(LODWORD(v1866), LODWORD(v1883));
  v702 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v700, 4, v701);
  objc_msgSend_floatValue(v702, v703, v704, v705);
  LODWORD(v1866) = v706;
  v709 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v707, 5, v708);
  objc_msgSend_floatValue(v709, v710, v711, v712);
  LODWORD(v1848) = v713;
  v716 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v714, 6, v715);
  objc_msgSend_floatValue(v716, v717, v718, v719);
  v722 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v720, 7, v721);
  objc_msgSend_floatValue(v722, v723, v724, v725);
  *(_QWORD *)&v1867 = __PAIR64__(LODWORD(v1848), LODWORD(v1866));
  v728 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v726, 8, v727);
  objc_msgSend_floatValue(v728, v729, v730, v731);
  LODWORD(v1848) = v732;
  v735 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v733, 9, v734);
  objc_msgSend_floatValue(v735, v736, v737, v738);
  v1821 = v739;
  v742 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v740, 10, v741);
  objc_msgSend_floatValue(v742, v743, v744, v745);
  v748 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v746, 11, v747);
  objc_msgSend_floatValue(v748, v749, v750, v751);
  *(_QWORD *)&v1849 = __PAIR64__(v1821, LODWORD(v1848));
  v754 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v752, 12, v753);
  objc_msgSend_floatValue(v754, v755, v756, v757);
  v1822 = v758;
  v761 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v759, 13, v760);
  objc_msgSend_floatValue(v761, v762, v763, v764);
  v1799 = v765;
  v768 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v766, 14, v767);
  objc_msgSend_floatValue(v768, v769, v770, v771);
  v774 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v772, 15, v773);
  objc_msgSend_floatValue(v774, v775, v776, v777);
  objc_msgSend_convertTransform_fromNode_(self, v778, (uint64_t)a4, v779, v1884, v1867, v1849, COERCE_DOUBLE(__PAIR64__(v1799, v1822)));
  LODWORD(v781) = v780;
  v1894[6] = objc_msgSend_numberWithFloat_(v673, v782, v783, v784, v781);
  v785 = (void *)MEMORY[0x1E0CB37E8];
  v788 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v786, 0, v787);
  objc_msgSend_floatValue(v788, v789, v790, v791);
  LODWORD(v1884) = v792;
  v795 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v793, 1, v794);
  objc_msgSend_floatValue(v795, v796, v797, v798);
  LODWORD(v1867) = v799;
  v802 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v800, 2, v801);
  objc_msgSend_floatValue(v802, v803, v804, v805);
  v808 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v806, 3, v807);
  objc_msgSend_floatValue(v808, v809, v810, v811);
  *(_QWORD *)&v1885 = __PAIR64__(LODWORD(v1867), LODWORD(v1884));
  v814 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v812, 4, v813);
  objc_msgSend_floatValue(v814, v815, v816, v817);
  LODWORD(v1867) = v818;
  v821 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v819, 5, v820);
  objc_msgSend_floatValue(v821, v822, v823, v824);
  LODWORD(v1849) = v825;
  v828 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v826, 6, v827);
  objc_msgSend_floatValue(v828, v829, v830, v831);
  v834 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v832, 7, v833);
  objc_msgSend_floatValue(v834, v835, v836, v837);
  *(_QWORD *)&v1868 = __PAIR64__(LODWORD(v1849), LODWORD(v1867));
  v840 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v838, 8, v839);
  objc_msgSend_floatValue(v840, v841, v842, v843);
  LODWORD(v1849) = v844;
  v847 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v845, 9, v846);
  objc_msgSend_floatValue(v847, v848, v849, v850);
  v1823 = v851;
  v854 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v852, 10, v853);
  objc_msgSend_floatValue(v854, v855, v856, v857);
  v860 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v858, 11, v859);
  objc_msgSend_floatValue(v860, v861, v862, v863);
  *(_QWORD *)&v1850 = __PAIR64__(v1823, LODWORD(v1849));
  v866 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v864, 12, v865);
  objc_msgSend_floatValue(v866, v867, v868, v869);
  v1824 = v870;
  v873 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v871, 13, v872);
  objc_msgSend_floatValue(v873, v874, v875, v876);
  v1800 = v877;
  v880 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v878, 14, v879);
  objc_msgSend_floatValue(v880, v881, v882, v883);
  v886 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v884, 15, v885);
  objc_msgSend_floatValue(v886, v887, v888, v889);
  objc_msgSend_convertTransform_fromNode_(self, v890, (uint64_t)a4, v891, v1885, v1868, v1850, COERCE_DOUBLE(__PAIR64__(v1800, v1824)));
  LODWORD(v893) = v892;
  v1894[7] = objc_msgSend_numberWithFloat_(v785, v894, v895, v896, v893);
  v897 = (void *)MEMORY[0x1E0CB37E8];
  v900 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v898, 0, v899);
  objc_msgSend_floatValue(v900, v901, v902, v903);
  LODWORD(v1885) = v904;
  v907 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v905, 1, v906);
  objc_msgSend_floatValue(v907, v908, v909, v910);
  LODWORD(v1868) = v911;
  v914 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v912, 2, v913);
  objc_msgSend_floatValue(v914, v915, v916, v917);
  v920 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v918, 3, v919);
  objc_msgSend_floatValue(v920, v921, v922, v923);
  *(_QWORD *)&v1886 = __PAIR64__(LODWORD(v1868), LODWORD(v1885));
  v926 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v924, 4, v925);
  objc_msgSend_floatValue(v926, v927, v928, v929);
  LODWORD(v1868) = v930;
  v933 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v931, 5, v932);
  objc_msgSend_floatValue(v933, v934, v935, v936);
  LODWORD(v1850) = v937;
  v940 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v938, 6, v939);
  objc_msgSend_floatValue(v940, v941, v942, v943);
  v946 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v944, 7, v945);
  objc_msgSend_floatValue(v946, v947, v948, v949);
  *(_QWORD *)&v1869 = __PAIR64__(LODWORD(v1850), LODWORD(v1868));
  v952 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v950, 8, v951);
  objc_msgSend_floatValue(v952, v953, v954, v955);
  LODWORD(v1850) = v956;
  v959 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v957, 9, v958);
  objc_msgSend_floatValue(v959, v960, v961, v962);
  v1825 = v963;
  v966 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v964, 10, v965);
  objc_msgSend_floatValue(v966, v967, v968, v969);
  v972 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v970, 11, v971);
  objc_msgSend_floatValue(v972, v973, v974, v975);
  *(_QWORD *)&v1851 = __PAIR64__(v1825, LODWORD(v1850));
  v978 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v976, 12, v977);
  objc_msgSend_floatValue(v978, v979, v980, v981);
  v1826 = v982;
  v985 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v983, 13, v984);
  objc_msgSend_floatValue(v985, v986, v987, v988);
  v1801 = v989;
  v992 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v990, 14, v991);
  objc_msgSend_floatValue(v992, v993, v994, v995);
  v998 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v996, 15, v997);
  objc_msgSend_floatValue(v998, v999, v1000, v1001);
  objc_msgSend_convertTransform_fromNode_(self, v1002, (uint64_t)a4, v1003, v1886, v1869, v1851, COERCE_DOUBLE(__PAIR64__(v1801, v1826)));
  v1894[8] = objc_msgSend_numberWithFloat_(v897, v1004, v1005, v1006, v1007);
  v1008 = (void *)MEMORY[0x1E0CB37E8];
  v1011 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1009, 0, v1010);
  objc_msgSend_floatValue(v1011, v1012, v1013, v1014);
  LODWORD(v1886) = v1015;
  v1018 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1016, 1, v1017);
  objc_msgSend_floatValue(v1018, v1019, v1020, v1021);
  LODWORD(v1869) = v1022;
  v1025 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1023, 2, v1024);
  objc_msgSend_floatValue(v1025, v1026, v1027, v1028);
  v1031 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1029, 3, v1030);
  objc_msgSend_floatValue(v1031, v1032, v1033, v1034);
  *(_QWORD *)&v1887 = __PAIR64__(LODWORD(v1869), LODWORD(v1886));
  v1037 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1035, 4, v1036);
  objc_msgSend_floatValue(v1037, v1038, v1039, v1040);
  LODWORD(v1869) = v1041;
  v1044 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1042, 5, v1043);
  objc_msgSend_floatValue(v1044, v1045, v1046, v1047);
  LODWORD(v1851) = v1048;
  v1051 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1049, 6, v1050);
  objc_msgSend_floatValue(v1051, v1052, v1053, v1054);
  v1057 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1055, 7, v1056);
  objc_msgSend_floatValue(v1057, v1058, v1059, v1060);
  *(_QWORD *)&v1870 = __PAIR64__(LODWORD(v1851), LODWORD(v1869));
  v1063 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1061, 8, v1062);
  objc_msgSend_floatValue(v1063, v1064, v1065, v1066);
  LODWORD(v1851) = v1067;
  v1070 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1068, 9, v1069);
  objc_msgSend_floatValue(v1070, v1071, v1072, v1073);
  v1827 = v1074;
  v1077 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1075, 10, v1076);
  objc_msgSend_floatValue(v1077, v1078, v1079, v1080);
  v1083 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1081, 11, v1082);
  objc_msgSend_floatValue(v1083, v1084, v1085, v1086);
  *(_QWORD *)&v1852 = __PAIR64__(v1827, LODWORD(v1851));
  v1089 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1087, 12, v1088);
  objc_msgSend_floatValue(v1089, v1090, v1091, v1092);
  v1828 = v1093;
  v1096 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1094, 13, v1095);
  objc_msgSend_floatValue(v1096, v1097, v1098, v1099);
  v1802 = v1100;
  v1103 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1101, 14, v1102);
  objc_msgSend_floatValue(v1103, v1104, v1105, v1106);
  v1109 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1107, 15, v1108);
  objc_msgSend_floatValue(v1109, v1110, v1111, v1112);
  objc_msgSend_convertTransform_fromNode_(self, v1113, (uint64_t)a4, v1114, v1887, v1870, v1852, COERCE_DOUBLE(__PAIR64__(v1802, v1828)));
  LODWORD(v1116) = v1115;
  v1894[9] = objc_msgSend_numberWithFloat_(v1008, v1117, v1118, v1119, v1116);
  v1120 = (void *)MEMORY[0x1E0CB37E8];
  v1123 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1121, 0, v1122);
  objc_msgSend_floatValue(v1123, v1124, v1125, v1126);
  LODWORD(v1887) = v1127;
  v1130 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1128, 1, v1129);
  objc_msgSend_floatValue(v1130, v1131, v1132, v1133);
  LODWORD(v1870) = v1134;
  v1137 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1135, 2, v1136);
  objc_msgSend_floatValue(v1137, v1138, v1139, v1140);
  v1143 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1141, 3, v1142);
  objc_msgSend_floatValue(v1143, v1144, v1145, v1146);
  *(_QWORD *)&v1888 = __PAIR64__(LODWORD(v1870), LODWORD(v1887));
  v1149 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1147, 4, v1148);
  objc_msgSend_floatValue(v1149, v1150, v1151, v1152);
  LODWORD(v1870) = v1153;
  v1156 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1154, 5, v1155);
  objc_msgSend_floatValue(v1156, v1157, v1158, v1159);
  LODWORD(v1852) = v1160;
  v1163 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1161, 6, v1162);
  objc_msgSend_floatValue(v1163, v1164, v1165, v1166);
  v1169 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1167, 7, v1168);
  objc_msgSend_floatValue(v1169, v1170, v1171, v1172);
  *(_QWORD *)&v1871 = __PAIR64__(LODWORD(v1852), LODWORD(v1870));
  v1175 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1173, 8, v1174);
  objc_msgSend_floatValue(v1175, v1176, v1177, v1178);
  LODWORD(v1852) = v1179;
  v1182 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1180, 9, v1181);
  objc_msgSend_floatValue(v1182, v1183, v1184, v1185);
  v1829 = v1186;
  v1189 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1187, 10, v1188);
  objc_msgSend_floatValue(v1189, v1190, v1191, v1192);
  v1195 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1193, 11, v1194);
  objc_msgSend_floatValue(v1195, v1196, v1197, v1198);
  *(_QWORD *)&v1853 = __PAIR64__(v1829, LODWORD(v1852));
  v1201 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1199, 12, v1200);
  objc_msgSend_floatValue(v1201, v1202, v1203, v1204);
  v1830 = v1205;
  v1208 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1206, 13, v1207);
  objc_msgSend_floatValue(v1208, v1209, v1210, v1211);
  v1803 = v1212;
  v1215 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1213, 14, v1214);
  objc_msgSend_floatValue(v1215, v1216, v1217, v1218);
  v1221 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1219, 15, v1220);
  objc_msgSend_floatValue(v1221, v1222, v1223, v1224);
  objc_msgSend_convertTransform_fromNode_(self, v1225, (uint64_t)a4, v1226, v1888, v1871, v1853, COERCE_DOUBLE(__PAIR64__(v1803, v1830)));
  LODWORD(v1228) = v1227;
  v1894[10] = objc_msgSend_numberWithFloat_(v1120, v1229, v1230, v1231, v1228);
  v1232 = (void *)MEMORY[0x1E0CB37E8];
  v1235 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1233, 0, v1234);
  objc_msgSend_floatValue(v1235, v1236, v1237, v1238);
  LODWORD(v1888) = v1239;
  v1242 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1240, 1, v1241);
  objc_msgSend_floatValue(v1242, v1243, v1244, v1245);
  LODWORD(v1871) = v1246;
  v1249 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1247, 2, v1248);
  objc_msgSend_floatValue(v1249, v1250, v1251, v1252);
  v1255 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1253, 3, v1254);
  objc_msgSend_floatValue(v1255, v1256, v1257, v1258);
  *(_QWORD *)&v1889 = __PAIR64__(LODWORD(v1871), LODWORD(v1888));
  v1261 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1259, 4, v1260);
  objc_msgSend_floatValue(v1261, v1262, v1263, v1264);
  LODWORD(v1871) = v1265;
  v1268 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1266, 5, v1267);
  objc_msgSend_floatValue(v1268, v1269, v1270, v1271);
  LODWORD(v1853) = v1272;
  v1275 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1273, 6, v1274);
  objc_msgSend_floatValue(v1275, v1276, v1277, v1278);
  v1281 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1279, 7, v1280);
  objc_msgSend_floatValue(v1281, v1282, v1283, v1284);
  *(_QWORD *)&v1872 = __PAIR64__(LODWORD(v1853), LODWORD(v1871));
  v1287 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1285, 8, v1286);
  objc_msgSend_floatValue(v1287, v1288, v1289, v1290);
  LODWORD(v1853) = v1291;
  v1294 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1292, 9, v1293);
  objc_msgSend_floatValue(v1294, v1295, v1296, v1297);
  v1831 = v1298;
  v1301 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1299, 10, v1300);
  objc_msgSend_floatValue(v1301, v1302, v1303, v1304);
  v1307 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1305, 11, v1306);
  objc_msgSend_floatValue(v1307, v1308, v1309, v1310);
  *(_QWORD *)&v1854 = __PAIR64__(v1831, LODWORD(v1853));
  v1313 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1311, 12, v1312);
  objc_msgSend_floatValue(v1313, v1314, v1315, v1316);
  v1832 = v1317;
  v1320 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1318, 13, v1319);
  objc_msgSend_floatValue(v1320, v1321, v1322, v1323);
  v1804 = v1324;
  v1327 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1325, 14, v1326);
  objc_msgSend_floatValue(v1327, v1328, v1329, v1330);
  v1333 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1331, 15, v1332);
  objc_msgSend_floatValue(v1333, v1334, v1335, v1336);
  objc_msgSend_convertTransform_fromNode_(self, v1337, (uint64_t)a4, v1338, v1889, v1872, v1854, COERCE_DOUBLE(__PAIR64__(v1804, v1832)));
  LODWORD(v1340) = v1339;
  v1894[11] = objc_msgSend_numberWithFloat_(v1232, v1341, v1342, v1343, v1340);
  v1344 = (void *)MEMORY[0x1E0CB37E8];
  v1347 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1345, 0, v1346);
  objc_msgSend_floatValue(v1347, v1348, v1349, v1350);
  LODWORD(v1889) = v1351;
  v1354 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1352, 1, v1353);
  objc_msgSend_floatValue(v1354, v1355, v1356, v1357);
  LODWORD(v1872) = v1358;
  v1361 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1359, 2, v1360);
  objc_msgSend_floatValue(v1361, v1362, v1363, v1364);
  v1367 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1365, 3, v1366);
  objc_msgSend_floatValue(v1367, v1368, v1369, v1370);
  *(_QWORD *)&v1890 = __PAIR64__(LODWORD(v1872), LODWORD(v1889));
  v1373 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1371, 4, v1372);
  objc_msgSend_floatValue(v1373, v1374, v1375, v1376);
  LODWORD(v1872) = v1377;
  v1380 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1378, 5, v1379);
  objc_msgSend_floatValue(v1380, v1381, v1382, v1383);
  LODWORD(v1854) = v1384;
  v1387 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1385, 6, v1386);
  objc_msgSend_floatValue(v1387, v1388, v1389, v1390);
  v1393 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1391, 7, v1392);
  objc_msgSend_floatValue(v1393, v1394, v1395, v1396);
  *(_QWORD *)&v1873 = __PAIR64__(LODWORD(v1854), LODWORD(v1872));
  v1399 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1397, 8, v1398);
  objc_msgSend_floatValue(v1399, v1400, v1401, v1402);
  LODWORD(v1854) = v1403;
  v1406 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1404, 9, v1405);
  objc_msgSend_floatValue(v1406, v1407, v1408, v1409);
  v1833 = v1410;
  v1413 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1411, 10, v1412);
  objc_msgSend_floatValue(v1413, v1414, v1415, v1416);
  v1419 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1417, 11, v1418);
  objc_msgSend_floatValue(v1419, v1420, v1421, v1422);
  *(_QWORD *)&v1855 = __PAIR64__(v1833, LODWORD(v1854));
  v1425 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1423, 12, v1424);
  objc_msgSend_floatValue(v1425, v1426, v1427, v1428);
  v1834 = v1429;
  v1432 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1430, 13, v1431);
  objc_msgSend_floatValue(v1432, v1433, v1434, v1435);
  v1805 = v1436;
  v1439 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1437, 14, v1438);
  objc_msgSend_floatValue(v1439, v1440, v1441, v1442);
  v1445 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1443, 15, v1444);
  objc_msgSend_floatValue(v1445, v1446, v1447, v1448);
  objc_msgSend_convertTransform_fromNode_(self, v1449, (uint64_t)a4, v1450, v1890, v1873, v1855, COERCE_DOUBLE(__PAIR64__(v1805, v1834)));
  v1894[12] = objc_msgSend_numberWithFloat_(v1344, v1451, v1452, v1453, v1454);
  v1455 = (void *)MEMORY[0x1E0CB37E8];
  v1458 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1456, 0, v1457);
  objc_msgSend_floatValue(v1458, v1459, v1460, v1461);
  LODWORD(v1890) = v1462;
  v1465 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1463, 1, v1464);
  objc_msgSend_floatValue(v1465, v1466, v1467, v1468);
  LODWORD(v1873) = v1469;
  v1472 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1470, 2, v1471);
  objc_msgSend_floatValue(v1472, v1473, v1474, v1475);
  v1478 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1476, 3, v1477);
  objc_msgSend_floatValue(v1478, v1479, v1480, v1481);
  *(_QWORD *)&v1891 = __PAIR64__(LODWORD(v1873), LODWORD(v1890));
  v1484 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1482, 4, v1483);
  objc_msgSend_floatValue(v1484, v1485, v1486, v1487);
  LODWORD(v1873) = v1488;
  v1491 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1489, 5, v1490);
  objc_msgSend_floatValue(v1491, v1492, v1493, v1494);
  LODWORD(v1855) = v1495;
  v1498 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1496, 6, v1497);
  objc_msgSend_floatValue(v1498, v1499, v1500, v1501);
  v1504 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1502, 7, v1503);
  objc_msgSend_floatValue(v1504, v1505, v1506, v1507);
  *(_QWORD *)&v1874 = __PAIR64__(LODWORD(v1855), LODWORD(v1873));
  v1510 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1508, 8, v1509);
  objc_msgSend_floatValue(v1510, v1511, v1512, v1513);
  LODWORD(v1855) = v1514;
  v1517 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1515, 9, v1516);
  objc_msgSend_floatValue(v1517, v1518, v1519, v1520);
  v1835 = v1521;
  v1524 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1522, 10, v1523);
  objc_msgSend_floatValue(v1524, v1525, v1526, v1527);
  v1530 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1528, 11, v1529);
  objc_msgSend_floatValue(v1530, v1531, v1532, v1533);
  *(_QWORD *)&v1856 = __PAIR64__(v1835, LODWORD(v1855));
  v1536 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1534, 12, v1535);
  objc_msgSend_floatValue(v1536, v1537, v1538, v1539);
  v1836 = v1540;
  v1543 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1541, 13, v1542);
  objc_msgSend_floatValue(v1543, v1544, v1545, v1546);
  v1806 = v1547;
  v1550 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1548, 14, v1549);
  objc_msgSend_floatValue(v1550, v1551, v1552, v1553);
  v1556 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1554, 15, v1555);
  objc_msgSend_floatValue(v1556, v1557, v1558, v1559);
  objc_msgSend_convertTransform_fromNode_(self, v1560, (uint64_t)a4, v1561, v1891, v1874, v1856, COERCE_DOUBLE(__PAIR64__(v1806, v1836)));
  LODWORD(v1563) = v1562;
  v1894[13] = objc_msgSend_numberWithFloat_(v1455, v1564, v1565, v1566, v1563);
  v1567 = (void *)MEMORY[0x1E0CB37E8];
  v1570 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1568, 0, v1569);
  objc_msgSend_floatValue(v1570, v1571, v1572, v1573);
  LODWORD(v1891) = v1574;
  v1577 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1575, 1, v1576);
  objc_msgSend_floatValue(v1577, v1578, v1579, v1580);
  LODWORD(v1874) = v1581;
  v1584 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1582, 2, v1583);
  objc_msgSend_floatValue(v1584, v1585, v1586, v1587);
  v1590 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1588, 3, v1589);
  objc_msgSend_floatValue(v1590, v1591, v1592, v1593);
  *(_QWORD *)&v1892 = __PAIR64__(LODWORD(v1874), LODWORD(v1891));
  v1596 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1594, 4, v1595);
  objc_msgSend_floatValue(v1596, v1597, v1598, v1599);
  LODWORD(v1874) = v1600;
  v1603 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1601, 5, v1602);
  objc_msgSend_floatValue(v1603, v1604, v1605, v1606);
  LODWORD(v1856) = v1607;
  v1610 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1608, 6, v1609);
  objc_msgSend_floatValue(v1610, v1611, v1612, v1613);
  v1616 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1614, 7, v1615);
  objc_msgSend_floatValue(v1616, v1617, v1618, v1619);
  *(_QWORD *)&v1875 = __PAIR64__(LODWORD(v1856), LODWORD(v1874));
  v1622 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1620, 8, v1621);
  objc_msgSend_floatValue(v1622, v1623, v1624, v1625);
  LODWORD(v1856) = v1626;
  v1629 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1627, 9, v1628);
  objc_msgSend_floatValue(v1629, v1630, v1631, v1632);
  v1837 = v1633;
  v1636 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1634, 10, v1635);
  objc_msgSend_floatValue(v1636, v1637, v1638, v1639);
  v1642 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1640, 11, v1641);
  objc_msgSend_floatValue(v1642, v1643, v1644, v1645);
  *(_QWORD *)&v1857 = __PAIR64__(v1837, LODWORD(v1856));
  v1648 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1646, 12, v1647);
  objc_msgSend_floatValue(v1648, v1649, v1650, v1651);
  v1838 = v1652;
  v1655 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1653, 13, v1654);
  objc_msgSend_floatValue(v1655, v1656, v1657, v1658);
  v1807 = v1659;
  v1662 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1660, 14, v1661);
  objc_msgSend_floatValue(v1662, v1663, v1664, v1665);
  v1668 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1666, 15, v1667);
  objc_msgSend_floatValue(v1668, v1669, v1670, v1671);
  objc_msgSend_convertTransform_fromNode_(self, v1672, (uint64_t)a4, v1673, v1892, v1875, v1857, COERCE_DOUBLE(__PAIR64__(v1807, v1838)));
  LODWORD(v1675) = v1674;
  v1894[14] = objc_msgSend_numberWithFloat_(v1567, v1676, v1677, v1678, v1675);
  v1679 = (void *)MEMORY[0x1E0CB37E8];
  v1682 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1680, 0, v1681);
  objc_msgSend_floatValue(v1682, v1683, v1684, v1685);
  LODWORD(v1892) = v1686;
  v1689 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1687, 1, v1688);
  objc_msgSend_floatValue(v1689, v1690, v1691, v1692);
  LODWORD(v1875) = v1693;
  v1696 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1694, 2, v1695);
  objc_msgSend_floatValue(v1696, v1697, v1698, v1699);
  v1702 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1700, 3, v1701);
  objc_msgSend_floatValue(v1702, v1703, v1704, v1705);
  v1893 = COERCE_DOUBLE(__PAIR64__(LODWORD(v1875), LODWORD(v1892)));
  v1708 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1706, 4, v1707);
  objc_msgSend_floatValue(v1708, v1709, v1710, v1711);
  LODWORD(v1875) = v1712;
  v1715 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1713, 5, v1714);
  objc_msgSend_floatValue(v1715, v1716, v1717, v1718);
  LODWORD(v1857) = v1719;
  v1722 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1720, 6, v1721);
  objc_msgSend_floatValue(v1722, v1723, v1724, v1725);
  v1728 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1726, 7, v1727);
  objc_msgSend_floatValue(v1728, v1729, v1730, v1731);
  v1876 = COERCE_DOUBLE(__PAIR64__(LODWORD(v1857), LODWORD(v1875)));
  v1734 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1732, 8, v1733);
  objc_msgSend_floatValue(v1734, v1735, v1736, v1737);
  LODWORD(v1857) = v1738;
  v1741 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1739, 9, v1740);
  objc_msgSend_floatValue(v1741, v1742, v1743, v1744);
  v1839 = v1745;
  v1748 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1746, 10, v1747);
  objc_msgSend_floatValue(v1748, v1749, v1750, v1751);
  v1754 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1752, 11, v1753);
  objc_msgSend_floatValue(v1754, v1755, v1756, v1757);
  v1858 = COERCE_DOUBLE(__PAIR64__(v1839, LODWORD(v1857)));
  v1760 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1758, 12, v1759);
  objc_msgSend_floatValue(v1760, v1761, v1762, v1763);
  v1840 = v1764;
  v1767 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1765, 13, v1766);
  objc_msgSend_floatValue(v1767, v1768, v1769, v1770);
  v1808 = v1771;
  v1774 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1772, 14, v1773);
  objc_msgSend_floatValue(v1774, v1775, v1776, v1777);
  v1780 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v1778, 15, v1779);
  objc_msgSend_floatValue(v1780, v1781, v1782, v1783);
  objc_msgSend_convertTransform_fromNode_(self, v1784, (uint64_t)a4, v1785, v1893, v1876, v1858, COERCE_DOUBLE(__PAIR64__(v1808, v1840)));
  LODWORD(v1787) = v1786;
  v1894[15] = objc_msgSend_numberWithFloat_(v1679, v1788, v1789, v1790, v1787);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v1791, (uint64_t)v1894, 16);
}

- (id)hitTestWithSegmentFrom:(id)a3 toPoint:(id)a4 options:(id)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  double v54;

  v9 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v9, v10, v11, v12);
  v53 = v13;
  v16 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v14, 1, v15);
  objc_msgSend_floatValue(v16, v17, v18, v19);
  v51 = v20;
  v23 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v21, 2, v22);
  objc_msgSend_floatValue(v23, v24, v25, v26);
  v54 = COERCE_DOUBLE(__PAIR64__(v51, v53));
  v29 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v27, 0, v28);
  objc_msgSend_floatValue(v29, v30, v31, v32);
  v52 = v33;
  v36 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v34, 1, v35);
  objc_msgSend_floatValue(v36, v37, v38, v39);
  v50 = v40;
  v43 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v41, 2, v42);
  objc_msgSend_floatValue(v43, v44, v45, v46);
  return (id)objc_msgSend_hitTestWithSegmentFromPoint_toPoint_options_(self, v47, (uint64_t)a5, v48, v54, COERCE_DOUBLE(__PAIR64__(v50, v52)));
}

+ (id)localRightValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_localRight(a1, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_localRight(a1, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_localRight(a1, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

+ (id)localFrontValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_localFront(a1, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_localFront(a1, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_localFront(a1, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

+ (id)localUpValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_localUp(a1, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_localUp(a1, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_localUp(a1, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (id)worldRightValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldRight(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldRight(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldRight(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (id)worldFrontValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldFront(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldFront(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldFront(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (id)worldUpValue
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  double v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldUp(self, a2, v2, v3);
  v9 = objc_msgSend_numberWithFloat_(v5, v6, v7, v8);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldUp(self, v11, v12, v13, v9);
  LODWORD(v14) = HIDWORD(v14);
  v29[1] = objc_msgSend_numberWithFloat_(v10, v15, v16, v17, v14);
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend_worldUp(self, v19, v20, v21);
  LODWORD(v23) = v22;
  v29[2] = objc_msgSend_numberWithFloat_(v18, v24, v25, v26, v23);
  return (id)objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v27, (uint64_t)v29, 3);
}

- (void)lookAtLocation:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v12 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  v18 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);
  MEMORY[0x1E0DE7D20](self, sel_lookAt_, v22, v23);
}

- (void)lookAtLocation:(id)a3 up:(id)a4 localFront:(id)a5
{
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
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
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v9 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v9, v10, v11, v12);
  v15 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v13, 1, v14);
  objc_msgSend_floatValue(v15, v16, v17, v18);
  v21 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v19, 2, v20);
  objc_msgSend_floatValue(v21, v22, v23, v24);
  v27 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v25, 0, v26);
  objc_msgSend_floatValue(v27, v28, v29, v30);
  v33 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v31, 1, v32);
  objc_msgSend_floatValue(v33, v34, v35, v36);
  v39 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v37, 2, v38);
  objc_msgSend_floatValue(v39, v40, v41, v42);
  v45 = (void *)objc_msgSend_objectAtIndexedSubscript_(a5, v43, 0, v44);
  objc_msgSend_floatValue(v45, v46, v47, v48);
  v51 = (void *)objc_msgSend_objectAtIndexedSubscript_(a5, v49, 1, v50);
  objc_msgSend_floatValue(v51, v52, v53, v54);
  v57 = (void *)objc_msgSend_objectAtIndexedSubscript_(a5, v55, 2, v56);
  objc_msgSend_floatValue(v57, v58, v59, v60);
  MEMORY[0x1E0DE7D20](self, sel_lookAt_up_localFront_, v61, v62);
}

- (void)localTranslateByValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v12 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  v18 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);
  MEMORY[0x1E0DE7D20](self, sel_localTranslateBy_, v22, v23);
}

- (void)localRotateByValue:(id)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, v3);
  objc_msgSend_floatValue(v6, v7, v8, v9);
  v12 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v10, 1, v11);
  objc_msgSend_floatValue(v12, v13, v14, v15);
  v18 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v16, 2, v17);
  objc_msgSend_floatValue(v18, v19, v20, v21);
  v24 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v22, 3, v23);
  objc_msgSend_floatValue(v24, v25, v26, v27);
  MEMORY[0x1E0DE7D20](self, sel_localRotateBy_, v28, v29);
}

- (void)rotateBy:(id)a3 around:(id)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  double v58;

  v7 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, a2, 0, (uint64_t)a4);
  objc_msgSend_floatValue(v7, v8, v9, v10);
  v57 = v11;
  v14 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v12, 1, v13);
  objc_msgSend_floatValue(v14, v15, v16, v17);
  v55 = v18;
  v21 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v19, 2, v20);
  objc_msgSend_floatValue(v21, v22, v23, v24);
  v27 = (void *)objc_msgSend_objectAtIndexedSubscript_(a3, v25, 3, v26);
  objc_msgSend_floatValue(v27, v28, v29, v30);
  v58 = COERCE_DOUBLE(__PAIR64__(v55, v57));
  v33 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v31, 0, v32);
  objc_msgSend_floatValue(v33, v34, v35, v36);
  v56 = v37;
  v40 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v38, 1, v39);
  objc_msgSend_floatValue(v40, v41, v42, v43);
  v54 = v44;
  v47 = (void *)objc_msgSend_objectAtIndexedSubscript_(a4, v45, 2, v46);
  objc_msgSend_floatValue(v47, v48, v49, v50);
  objc_msgSend_rotateBy_aroundTarget_(self, v51, v52, v53, v58, COERCE_DOUBLE(__PAIR64__(v54, v56)));
}

+ (VFXNode)nodeWithSceneKitNode:(id)a3 options:(id)a4
{
  const __CFDictionary *Mutable;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t PathComponent;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;
  VFXNode *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;

  Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
  objc_msgSend_begin(VFXTransaction, v7, v8, v9);
  objc_msgSend_setImmediateMode_(VFXTransaction, v10, 1, v11);
  v14 = (void *)objc_msgSend_objectForKeyedSubscript_(a4, v12, (uint64_t)CFSTR("VFXSceneKitBridgeOptionOriginalURL"), v13);
  PathComponent = objc_msgSend_URLByDeletingLastPathComponent(v14, v15, v16, v17);
  objc_msgSend_setValue_forKey_(VFXTransaction, v19, PathComponent, (uint64_t)CFSTR("VFXWorldDecodingCurrentEnclosingFolder"));
  v22 = (void *)objc_msgSend_objectForKeyedSubscript_(a4, v20, (uint64_t)CFSTR("VFXSceneKitBridgeOptionSkipLightIntensityRemapping"), v21);
  v26 = objc_msgSend_BOOLValue(v22, v23, v24, v25);
  v27 = (VFXNode *)sub_1B19874F0(a3, Mutable, v26);
  objc_msgSend_commit(VFXTransaction, v28, v29, v30);
  CFRelease(Mutable);
  return v27;
}

- (NSArray)bridgedComponentNames
{
  VFXNode *v2;
  void *v3;

  v2 = self;
  VFXNode.bridgedComponentNames.getter();

  v3 = (void *)sub_1B2228AAC();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

@end
