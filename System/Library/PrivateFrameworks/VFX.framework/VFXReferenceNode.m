@implementation VFXReferenceNode

- (VFXReferenceNode)initWithURL:(id)a3
{
  VFXReferenceNode *v4;
  const char *v5;
  uint64_t v6;
  VFXReferenceNode *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VFXReferenceNode;
  v4 = -[VFXNode init](&v9, sel_init);
  v7 = v4;
  if (v4)
    objc_msgSend_setReferenceURL_(v4, v5, (uint64_t)a3, v6);
  return v7;
}

- (VFXReferenceNode)initWithNode:(id)a3
{
  VFXReferenceNode *v4;
  const char *v5;
  uint64_t v6;
  VFXReferenceNode *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VFXReferenceNode;
  v4 = -[VFXNode init](&v9, sel_init);
  v7 = v4;
  if (v4)
    objc_msgSend_setReferencedNode_(v4, v5, (uint64_t)a3, v6);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VFXReferenceNode;
  -[VFXNode dealloc](&v3, sel_dealloc);
}

- (void)_diffObject:(id)a3 with:(id)a4 path:(id)a5
{
  objc_class *v5;
  objc_property_t *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t i;
  objc_property *v12;
  const char *Attributes;
  const char *v14;
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
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *Name;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  void *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *PathComponent;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  char isEqual;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  id v72;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  unsigned int outCount;
  _BYTE v81[128];
  uint64_t v82;

  v72 = a5;
  v82 = *MEMORY[0x1E0C80C00];
  if (qword_1EEF65E90 != -1)
    dispatch_once(&qword_1EEF65E90, &unk_1E63D0CD0);
  v5 = (objc_class *)objc_opt_class();
  outCount = 0;
  v6 = class_copyPropertyList(v5, &outCount);
  v10 = (void *)objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      v12 = v6[i];
      Attributes = property_getAttributes(v12);
      v16 = (void *)objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v14, (uint64_t)Attributes, v15);
      v19 = (void *)objc_msgSend_componentsSeparatedByString_(v16, v17, (uint64_t)CFSTR(","), v18);
      v22 = (void *)objc_msgSend_objectAtIndex_(v19, v20, 0, v21);
      v25 = (void *)objc_msgSend_substringFromIndex_(v22, v23, 1, v24);
      v29 = (const char *)objc_msgSend_UTF8String(v25, v26, v27, v28);
      if (strcmp(v29, "{CATransform3D=dddddddddddddddd}"))
      {
        v32 = (void *)objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v30, (uint64_t)Attributes, v31);
        objc_msgSend_rangeOfString_(v32, v33, (uint64_t)CFSTR(",R,"), v34);
        if (v35 != 3)
        {
          v36 = (void *)MEMORY[0x1E0CB3940];
          Name = property_getName(v12);
          v40 = objc_msgSend_stringWithUTF8String_(v36, v38, (uint64_t)Name, v39);
          objc_msgSend_addObject_(v10, v41, v40, v42);
        }
      }
    }
  }
  free(v6);
  objc_msgSend_willChangeValueForKey_(self, v43, (uint64_t)CFSTR("overrides"), v44);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v45, (uint64_t)&v76, (uint64_t)v81, 16);
  if (v48)
  {
    v49 = *(_QWORD *)v77;
    do
    {
      for (j = 0; j != v48; ++j)
      {
        if (*(_QWORD *)v77 != v49)
          objc_enumerationMutation(v10);
        v51 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
        if ((objc_msgSend_containsObject_((void *)qword_1EEF65E88, v46, (uint64_t)v51, v47, v72) & 1) == 0
          && (objc_msgSend_hasPrefix_(v51, v46, (uint64_t)CFSTR("_"), v47) & 1) == 0
          && (objc_msgSend_hasPrefix_(v51, v46, (uint64_t)CFSTR("world"), v47) & 1) == 0)
        {
          v52 = (void *)objc_msgSend_valueForKey_(a3, v46, (uint64_t)v51, v47);
          v55 = (void *)objc_msgSend_valueForKey_(a4, v53, (uint64_t)v51, v54);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
            || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              PathComponent = (void *)objc_msgSend_lastPathComponent(v52, v56, v57, v58);
              v63 = objc_msgSend_lastPathComponent(v55, v60, v61, v62);
              isEqual = objc_msgSend_isEqual_(PathComponent, v64, v63, v65);
            }
            else
            {
              isEqual = objc_msgSend_isEqual_(v52, v56, (uint64_t)v55, v58);
            }
            if ((isEqual & 1) == 0)
            {
              v67 = (void *)objc_msgSend_stringByAppendingString_(v72, v46, (uint64_t)CFSTR("."), v47);
              v70 = objc_msgSend_stringByAppendingString_(v67, v68, (uint64_t)v51, v69);
              objc_msgSend_addOverride_forKeyPath_(self, v71, (uint64_t)v52, v70);
            }
          }
        }
      }
      v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v46, (uint64_t)&v76, (uint64_t)v81, 16);
    }
    while (v48);
  }
  objc_msgSend_didChangeValueForKey_(self, v46, (uint64_t)CFSTR("overrides"), v47, v72);
}

- (BOOL)_isNameUnique:(id)a3
{
  uint64_t v3;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_1B184E178;
  v6[3] = &unk_1E63D7240;
  v6[4] = a3;
  v6[5] = &v7;
  objc_msgSend_enumerateHierarchyUsingBlock_(self, a2, (uint64_t)v6, v3);
  v4 = *((_DWORD *)v8 + 6) == 1;
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_diffNode:(id)a3 with:(id)a4 path:(id)a5
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
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
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
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
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t i;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  VFXReferenceNode *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  const char *v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t j;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  id v181;
  id v182;
  uint64_t v183;
  id v184;
  void *v185;
  void *v186;
  uint64_t v187;
  uint64_t v188;

  if (objc_msgSend_name(a3, a2, (uint64_t)a3, (uint64_t)a4))
  {
    v12 = (void *)objc_msgSend_name(a3, v9, v10, v11);
    if ((objc_msgSend_containsString_(v12, v13, (uint64_t)CFSTR("."), v14) & 1) == 0)
    {
      v17 = objc_msgSend_name(a3, v9, v15, v16);
      if (objc_msgSend__isNameUnique_(self, v18, v17, v19))
      {
        v22 = objc_msgSend_name(a3, v9, v20, v21);
        a5 = (id)objc_msgSend_stringByAppendingString_(CFSTR("/"), v23, v22, v24);
      }
    }
  }
  v182 = a4;
  objc_msgSend__diffObject_with_path_(self, v9, (uint64_t)a3, (uint64_t)a4, a5);
  v181 = a3;
  if (objc_msgSend_model(a3, v25, v26, v27) && objc_msgSend_model(a4, v28, v29, v30))
  {
    v31 = objc_msgSend_model(a3, v28, v29, v30);
    v35 = objc_msgSend_model(v182, v32, v33, v34);
    v38 = (void *)objc_msgSend_stringByAppendingString_(a5, v36, (uint64_t)CFSTR("."), v37);
    v41 = objc_msgSend_stringByAppendingString_(v38, v39, (uint64_t)CFSTR("geometry"), v40);
    objc_msgSend__diffObject_with_path_(self, v42, v31, v35, v41);
    v46 = (void *)objc_msgSend_model(a3, v43, v44, v45);
    v50 = (void *)objc_msgSend_materials(v46, v47, v48, v49);
    v54 = objc_msgSend_count(v50, v51, v52, v53);
    v58 = (void *)objc_msgSend_model(v182, v55, v56, v57);
    v62 = (void *)objc_msgSend_materials(v58, v59, v60, v61);
    if (v54 == objc_msgSend_count(v62, v63, v64, v65))
    {
      v73 = (void *)objc_msgSend_model(a3, v66, v67, v68);
      v186 = (void *)objc_msgSend_materials(v73, v74, v75, v76);
      v80 = (void *)objc_msgSend_model(v182, v77, v78, v79);
      v185 = (void *)objc_msgSend_materials(v80, v81, v82, v83);
      if (v54)
      {
        v84 = 0;
        v183 = v54;
        v184 = a5;
        do
        {
          v85 = (void *)objc_msgSend_objectAtIndexedSubscript_(v186, v28, v84, v30);
          v88 = (void *)objc_msgSend_objectAtIndexedSubscript_(v185, v86, v84, v87);
          v91 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v89, (uint64_t)CFSTR("geometry.materials[%d]"), v90);
          v94 = (void *)objc_msgSend_stringByAppendingString_(a5, v92, (uint64_t)CFSTR("."), v93);
          v97 = (void *)objc_msgSend_stringByAppendingString_(v94, v95, v91, v96);
          objc_msgSend__diffObject_with_path_(self, v98, (uint64_t)v85, (uint64_t)v88, v97);
          v102 = (void *)objc_msgSend_properties(v85, v99, v100, v101);
          v106 = (void *)objc_msgSend_properties(v88, v103, v104, v105);
          v110 = objc_msgSend_count(v102, v107, v108, v109);
          v187 = v84;
          if (objc_msgSend_count(v106, v111, v112, v113) == v110)
          {
            if (v110)
            {
              for (i = 0; i != v110; ++i)
              {
                v119 = objc_msgSend_objectAtIndexedSubscript_(v102, v28, i, v30);
                v122 = objc_msgSend_objectAtIndexedSubscript_(v106, v120, i, v121);
                v125 = (void *)objc_msgSend_objectAtIndexedSubscript_(v102, v123, i, v124);
                v129 = self;
                v130 = objc_msgSend_materialPropertyName(v125, v126, v127, v128);
                v133 = (void *)objc_msgSend_stringByAppendingString_(v97, v131, (uint64_t)CFSTR("."), v132);
                v134 = v130;
                self = v129;
                v137 = objc_msgSend_stringByAppendingString_(v133, v135, v134, v136);
                objc_msgSend__diffObject_with_path_(v129, v138, v119, v122, v137);
              }
            }
          }
          else
          {
            sub_1B17C4408(16, (uint64_t)CFSTR("Error: inconsistency - material has custom properties - can't diff reference node"), v29, v30, v114, v115, v116, v117, v84);
          }
          v84 = v187 + 1;
          a5 = v184;
        }
        while (v187 + 1 != v183);
      }
    }
    else
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: inconsistency - material count doesn't match - can't diff reference node"), v67, v68, v69, v70, v71, v72, v180);
    }
  }
  v139 = (void *)objc_msgSend_childNodes(v181, v28, v29, v30);
  v143 = objc_msgSend_count(v139, v140, v141, v142);
  v147 = (void *)objc_msgSend_childNodes(v182, v144, v145, v146);
  if (v143 == objc_msgSend_count(v147, v148, v149, v150))
  {
    if (v143)
    {
      for (j = 0; j != v143; ++j)
      {
        v159 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v151, (uint64_t)CFSTR("[%d]"), v153, j);
        v162 = (void *)objc_msgSend_stringByAppendingString_(a5, v160, (uint64_t)CFSTR("."), v161);
        a5 = (id)objc_msgSend_stringByAppendingString_(v162, v163, v159, v164);
        v168 = (void *)objc_msgSend_childNodes(v181, v165, v166, v167);
        v171 = objc_msgSend_objectAtIndexedSubscript_(v168, v169, j, v170);
        v175 = (void *)objc_msgSend_childNodes(v182, v172, v173, v174);
        v178 = objc_msgSend_objectAtIndexedSubscript_(v175, v176, j, v177);
        objc_msgSend__diffNode_with_path_(self, v179, v171, v178, a5);
      }
    }
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: inconsistency - hierarchy doesn't match - can't diff reference node"), v152, v153, v154, v155, v156, v157, v188);
  }
}

- (void)collectOverrides
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *ReferencedWorldWithURL;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *referenceNode;
  void *Object;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  objc_msgSend_removeAllOverrides(self, a2, v2, v3);
  if (self->_referenceURL)
  {
    v8 = objc_msgSend__resolveURL(self, v5, v6, v7);
    ReferencedWorldWithURL = (void *)objc_msgSend__loadReferencedWorldWithURL_(self, v9, v8, v10);
    referenceNode = (void *)objc_msgSend_rootNode(ReferencedWorldWithURL, v12, v13, v14);
    Object = self;
  }
  else
  {
    referenceNode = self->_referenceNode;
    v21 = (void *)objc_msgSend_childNodes(self, v5, v6, v7);
    Object = (void *)objc_msgSend_firstObject(v21, v22, v23, v24);
  }
  v20 = (void *)objc_msgSend_childNodes(referenceNode, v15, v16, v17);
  v28 = objc_msgSend_count(v20, v25, v26, v27);
  v32 = (void *)objc_msgSend_childNodes(Object, v29, v30, v31);
  if (v28 == objc_msgSend_count(v32, v33, v34, v35))
    objc_msgSend__diffNode_with_path_(self, v36, (uint64_t)Object, (uint64_t)referenceNode, &stru_1E63FD500);
  else
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: inconsistency - hierarchy changed - can't diff reference node"), v37, v38, v39, v40, v41, v42, v43);
}

- (void)addOverride:(id)a3 forKeyPath:(id)a4
{
  const char *v7;
  NSMutableDictionary *overrides;
  const char *v9;
  uint64_t v10;

  objc_msgSend_willChangeValueForKey_(self, a2, (uint64_t)CFSTR("overrides"), (uint64_t)a4);
  overrides = self->_overrides;
  if (!overrides)
  {
    overrides = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    self->_overrides = overrides;
  }
  objc_msgSend_setObject_forKey_(overrides, v7, (uint64_t)a3, (uint64_t)a4);
  objc_msgSend_didChangeValueForKey_(self, v9, (uint64_t)CFSTR("overrides"), v10);
}

- (void)removeForKeyPath:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  objc_msgSend_willChangeValueForKey_(self, a2, (uint64_t)CFSTR("overrides"), v3);
  objc_msgSend_removeObjectForKey_(self->_overrides, v6, (uint64_t)a3, v7);
  if (!objc_msgSend_count(self->_overrides, v8, v9, v10))
  {

    self->_overrides = 0;
  }
  objc_msgSend_didChangeValueForKey_(self, v11, (uint64_t)CFSTR("overrides"), v12);
}

- (void)removeAllOverrides
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  objc_msgSend_willChangeValueForKey_(self, a2, (uint64_t)CFSTR("overrides"), v2);
  objc_msgSend_removeAllObjects(self->_overrides, v4, v5, v6);
  objc_msgSend_didChangeValueForKey_(self, v7, (uint64_t)CFSTR("overrides"), v8);
}

- (id)overrides
{
  if (self->_overrides)
    return self->_overrides;
  else
    return (id)MEMORY[0x1E0C9AA70];
}

- (void)setOverrides:(id)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;

  objc_msgSend_willChangeValueForKey_(self, a2, (uint64_t)CFSTR("overrides"), v3);

  self->_overrides = (NSMutableDictionary *)objc_msgSend_mutableCopy(a3, v6, v7, v8);
  objc_msgSend_didChangeValueForKey_(self, v9, (uint64_t)CFSTR("overrides"), v10);
}

- (void)_applyOverride:(id)a3 forKeyPath:(id)a4
{
  objc_msgSend_setValue_forKeyPath_(self, a2, (uint64_t)a3, (uint64_t)a4);
}

- (void)_applyUnsharing:(id)a3 alreadyShared:(id)a4
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  id v106;

  if ((objc_msgSend_containsObject_(a4, a2, (uint64_t)a3, (uint64_t)a4) & 1) == 0)
  {
    objc_msgSend_addObject_(a4, v7, (uint64_t)a3, v8);
    v10 = objc_msgSend_rangeOfString_options_(a3, v9, (uint64_t)CFSTR("."), 4);
    if (v13 == 1)
    {
      v14 = v10;
      v15 = v10 + 1;
      if (v10 + 1 < (unint64_t)objc_msgSend_length(a3, (const char *)1, v11, v12))
      {
        v18 = objc_msgSend_substringToIndex_(a3, v16, v14, v17);
        v21 = (void *)objc_msgSend_substringFromIndex_(a3, v19, v15, v20);
        v24 = objc_msgSend_valueForKeyPath_(self, v22, v18, v23);
        if (v24)
        {
          v25 = (void *)v24;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && objc_msgSend_isEqualToString_(v21, v26, (uint64_t)CFSTR("geometry"), v27))
          {
            v31 = (void *)objc_msgSend_model(v25, v28, v29, v30);
            v35 = (void *)objc_msgSend_copy(v31, v32, v33, v34);
            objc_msgSend_setModel_(v25, v36, (uint64_t)v35, v37);

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if ((objc_msgSend_containsObject_(a4, v38, v18, v39) & 1) == 0)
            {
              objc_msgSend__applyUnsharing_alreadyShared_(self, v40, v18, (uint64_t)a4);
              v25 = (void *)objc_msgSend_valueForKeyPath_(self, v42, v18, v43);
            }
            if ((objc_msgSend_isEqualToString_(v21, v40, (uint64_t)CFSTR("firstMaterial"), v41) & 1) != 0)
            {
              v47 = 0;
            }
            else
            {
              if (objc_msgSend_isEqualToString_(v21, v44, (uint64_t)CFSTR("materials"), v46))
              {
                v66 = (void *)objc_msgSend_materials(v25, v63, v64, v65);
                v70 = (id)objc_msgSend_copy(v66, v67, v68, v69);
                objc_msgSend_setMaterials_(v25, v71, (uint64_t)v70, v72);
                return;
              }
              v83 = objc_msgSend_rangeOfString_(v21, v63, (uint64_t)CFSTR("["), v65);
              if (v90 != 1)
              {
                sub_1B17C4408(16, (uint64_t)CFSTR("Error: failed to parse key path %@ - missing '['"), v84, v85, v86, v87, v88, v89, (uint64_t)a3);
                return;
              }
              v91 = (void *)objc_msgSend_substringFromIndex_(v21, (const char *)1, v83 + 1, v85);
              v94 = objc_msgSend_rangeOfString_(v91, v92, (uint64_t)CFSTR("]"), v93);
              if (v101 != 1)
              {
                sub_1B17C4408(16, (uint64_t)CFSTR("Error: failed to parse key path %@ - missing ']'"), v95, v96, v97, v98, v99, v100, (uint64_t)a3);
                return;
              }
              v102 = (void *)objc_msgSend_substringToIndex_(v91, (const char *)1, v94, v96);
              v47 = objc_msgSend_integerValue(v102, v103, v104, v105);
            }
            v48 = (void *)objc_msgSend_materials(v25, v44, v45, v46);
            if (v47 >= objc_msgSend_count(v48, v49, v50, v51))
            {
              v73 = (void *)objc_msgSend_materials(v25, v52, v53, v54);
              objc_msgSend_count(v73, v74, v75, v76);
              sub_1B17C4408(16, (uint64_t)CFSTR("Error: failed to evaluate key path %@ - material index %d out of bounds (%d)"), v77, v78, v79, v80, v81, v82, (uint64_t)a3);
            }
            else
            {
              v55 = (void *)objc_msgSend_materials(v25, v52, v53, v54);
              v58 = (void *)objc_msgSend_objectAtIndexedSubscript_(v55, v56, v47, v57);
              v106 = (id)objc_msgSend_copy(v58, v59, v60, v61);
              objc_msgSend_replaceMaterialAtIndex_withMaterial_(v25, v62, v47, (uint64_t)v106);

            }
          }
        }
      }
    }
  }
}

- (void)_applyOverrides
{
  NSMutableDictionary *overrides;
  uint64_t v4;
  uint64_t v5;
  NSMutableDictionary *v6;
  const char *v7;
  uint64_t v8;
  char *v9;
  _QWORD v10[5];
  _QWORD v11[6];

  v9 = (char *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  overrides = self->_overrides;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1B184EB98;
  v11[3] = &unk_1E63D7268;
  v11[4] = self;
  v11[5] = v9;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(overrides, v9, (uint64_t)v11, v5);
  v6 = self->_overrides;
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = sub_1B184EBA8;
  v10[3] = &unk_1E63D54B0;
  v10[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v7, (uint64_t)v10, v8);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VFXReferenceNode;
  v4 = -[VFXNode copyWithZone:](&v15, sel_copyWithZone_, a3);
  objc_msgSend_setReferenceURL_(v4, v5, (uint64_t)self->_referenceURL, v6);
  objc_msgSend_setReferencedNode_(v4, v7, (uint64_t)self->_referenceNode, v8);
  objc_msgSend_setLoadingPolicy_(v4, v9, self->_loadingPolicy, v10);
  v4[37] = objc_msgSend_mutableCopy(self->_overrides, v11, v12, v13);
  return v4;
}

- (BOOL)_isAReference
{
  return 1;
}

- (NSURL)referenceURL
{
  return self->_referenceURL;
}

- (void)setReferenceURL:(id)a3
{
  NSURL *referenceURL;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  referenceURL = self->_referenceURL;
  if (referenceURL != a3)
  {

    self->_referenceURL = (NSURL *)objc_msgSend_copy(a3, v6, v7, v8);
  }
}

- (BOOL)isVirtualEnvironmentNode
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend_scheme(self->_referenceURL, a2, v2, v3);
  return objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("env"), v6);
}

- (VFXNode)referencedNode
{
  return self->_referenceNode;
}

- (void)setReferencedNode:(id)a3
{
  VFXNode *referenceNode;

  referenceNode = self->_referenceNode;
  if (referenceNode != a3)
  {

    self->_referenceNode = (VFXNode *)a3;
  }
}

- (id)_resolveURL
{
  uint64_t v2;
  uint64_t v3;
  NSURL *referenceURL;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSURL *sourceDocumentURL;
  void *PathComponent;
  const char *v18;
  uint64_t v19;
  const __CFURL *v20;

  referenceURL = self->_referenceURL;
  if (!referenceURL)
    return 0;
  if (objc_msgSend_scheme(self->_referenceURL, a2, v2, v3)
    && !objc_msgSend_isFileURL(referenceURL, v6, v7, v8))
  {
    return referenceURL;
  }
  v9 = (void *)objc_msgSend_relativePath(referenceURL, v6, v7, v8);
  if ((objc_msgSend_isAbsolutePath(v9, v10, v11, v12) & 1) != 0)
    return referenceURL;
  sourceDocumentURL = self->_sourceDocumentURL;
  if (!sourceDocumentURL)
    return referenceURL;
  PathComponent = (void *)objc_msgSend_URLByDeletingLastPathComponent(sourceDocumentURL, v13, v14, v15);
  v20 = (const __CFURL *)objc_msgSend_URLByAppendingPathComponent_(PathComponent, v18, (uint64_t)v9, v19);
  if (!sub_1B198F028(v20))
    return referenceURL;
  return v20;
}

- (void)unload
{
  uint64_t v2;
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_msgSend_childNodes(self, a2, v2, v3, 0);
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v7)
  {
    v11 = v7;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v5);
        objc_msgSend_removeFromParentNode(*(void **)(*((_QWORD *)&v14 + 1) + 8 * v13++), v8, v9, v10);
      }
      while (v11 != v13);
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v11);
  }
  self->_loaded = 0;
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (id)_loadReferencedWorldWithURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3)
    return (id)objc_msgSend_worldWithURL_options_error_(VFXWorld, a2, (uint64_t)a3, 0, 0);
  sub_1B17C4408(16, (uint64_t)CFSTR("Error: failed to locate world reference %@"), 0, v3, v4, v5, v6, v7, (uint64_t)self);
  return 0;
}

- (void)load
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  VFXNode *referenceNode;

  if (!self->_loaded)
  {
    v5 = objc_msgSend__resolveURL(self, a2, v2, v3);
    if (v5)
    {
      MEMORY[0x1E0DE7D20](self, sel__loadWithURL_, v5, v6);
    }
    else
    {
      referenceNode = self->_referenceNode;
      if (referenceNode)
        MEMORY[0x1E0DE7D20](self, sel__loadWithNode_fromURL_, referenceNode, 0);
    }
  }
}

- (void)_loadWithNode:(id)a3 fromURL:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  const char *v8;
  uint64_t v9;
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
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  self->_loaded = 1;
  v7 = (void *)objc_msgSend_clone(a3, a2, (uint64_t)a3, a4);
  objc_msgSend_enumerateHierarchyUsingBlock_(v7, v8, (uint64_t)&unk_1E63D1B50, v9);
  if (v4)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = (void *)objc_msgSend_childNodes(v7, v10, v11, v12, 0);
    v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v24, (uint64_t)v28, 16);
    if (v15)
    {
      v18 = v15;
      v19 = *(_QWORD *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v13);
          objc_msgSend_addChildNode_(self, v16, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v20++), v17);
        }
        while (v18 != v20);
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v24, (uint64_t)v28, 16);
      }
      while (v18);
    }
    objc_msgSend__copyAnimationsFrom_(self, v16, (uint64_t)a3, v17);
  }
  else
  {
    objc_msgSend_addChildNode_(self, v10, (uint64_t)v7, v12);
  }
  objc_msgSend__applyOverrides(self, v21, v22, v23);
}

- (void)_loadWithURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  uint64_t v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *ReferencedWorldWithURL;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if (a3)
  {
    v12 = (id)objc_msgSend_valueForKey_(VFXTransaction, a2, (uint64_t)CFSTR("VFXReferenceLoadingStack"), v3);
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend_setValue_forKey_(VFXTransaction, v13, (uint64_t)v12, (uint64_t)CFSTR("VFXReferenceLoadingStack"));

    }
    if (objc_msgSend_containsObject_(v12, v10, (uint64_t)a3, v11))
    {
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: failed to resolve referenced world (%@) cycle detected"), v15, v16, v17, v18, v19, v20, (uint64_t)a3);
    }
    else
    {
      objc_msgSend_addObject_(v12, v14, (uint64_t)a3, v16);
      ReferencedWorldWithURL = (void *)objc_msgSend__loadReferencedWorldWithURL_(self, v21, (uint64_t)a3, v22);
      objc_msgSend_removeObject_(v12, v24, (uint64_t)a3, v25);
      if (ReferencedWorldWithURL)
      {
        v29 = objc_msgSend_rootNode(ReferencedWorldWithURL, v26, v27, v28);
        MEMORY[0x1E0DE7D20](self, sel__loadWithNode_fromURL_, v29, 1);
      }
    }
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: failed to locate world reference %@"), 0, v3, v4, v5, v6, v7, (uint64_t)self);
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  const char *v6;
  uint64_t v7;
  void *referenceURL;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  referenceURL = self->_referenceURL;
  if (!referenceURL)
    referenceURL = self->_referenceNode;
  return (id)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: %p source=%@>"), v7, v5, self, referenceURL);
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *referenceURL;
  VFXNode *referenceNode;
  const char *v7;
  NSMutableDictionary *overrides;
  objc_super v9;

  referenceURL = self->_referenceURL;
  if (referenceURL)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)referenceURL, (uint64_t)CFSTR("referenceURL"));
  referenceNode = self->_referenceNode;
  if (referenceNode)
    objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)referenceNode, (uint64_t)CFSTR("referenceNode"));
  objc_msgSend_encodeInteger_forKey_(a3, a2, self->_loadingPolicy, (uint64_t)CFSTR("loadingPolicy"));
  overrides = self->_overrides;
  if (overrides)
    objc_msgSend_encodeObject_forKey_(a3, v7, (uint64_t)overrides, (uint64_t)CFSTR("overrides"));
  v9.receiver = self;
  v9.super_class = (Class)VFXReferenceNode;
  -[VFXNode encodeWithCoder:](&v9, sel_encodeWithCoder_, a3);
}

- (VFXReferenceNode)initWithCoder:(id)a3
{
  VFXReferenceNode *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  objc_super v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v37.receiver = self;
  v37.super_class = (Class)VFXReferenceNode;
  v4 = -[VFXNode initWithCoder:](&v37, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v6, (uint64_t)v38, 2);
    v10 = objc_msgSend_setWithArray_(v5, v8, v7, v9);
    v12 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v11, v10, (uint64_t)CFSTR("referenceURL"));
    objc_msgSend_setReferenceURL_(v4, v13, v12, v14);
    v15 = objc_opt_class();
    v17 = objc_msgSend_decodeObjectOfClass_forKey_(a3, v16, v15, (uint64_t)CFSTR("referenceNode"));
    objc_msgSend_setReferencedNode_(v4, v18, v17, v19);
    v22 = objc_msgSend_decodeIntegerForKey_(a3, v20, (uint64_t)CFSTR("loadingPolicy"), v21);
    objc_msgSend_setLoadingPolicy_(v4, v23, v22, v24);
    v25 = sub_1B18BDC88();
    v27 = objc_msgSend_decodeObjectOfClasses_forKey_(a3, v26, v25, (uint64_t)CFSTR("overrides"));
    objc_msgSend_setOverrides_(v4, v28, v27, v29);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_sourceDocumentURL = (NSURL *)(id)objc_msgSend_documentURL(a3, v30, v31, v32);
    if ((objc_msgSend_containsValueForKey_(a3, v30, (uint64_t)CFSTR("childNodes"), v32) & 1) == 0 && !v4->_loadingPolicy)
      objc_msgSend_load(v4, v33, v34, v35);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)loadingPolicy
{
  return self->_loadingPolicy;
}

- (void)setLoadingPolicy:(int64_t)a3
{
  self->_loadingPolicy = a3;
}

@end
