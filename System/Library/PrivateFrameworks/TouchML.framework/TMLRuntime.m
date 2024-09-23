@implementation TMLRuntime

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0;
}

+ (void)bootstrap
{
  _QWORD block[5];

  TouchML_init();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_22AD4E2F0;
  block[3] = &unk_24F4FD280;
  block[4] = a1;
  if (qword_255B51C00 != -1)
    dispatch_once(&qword_255B51C00, block);
}

+ (id)rootClassDescriptor
{
  if (qword_255B51C10 != -1)
    dispatch_once(&qword_255B51C10, &unk_24F5012B0);
  return (id)qword_255B51C08;
}

+ (id)requireModule:(id)a3
{
  const char *v3;
  id v4;
  double v5;
  const char *v6;
  objc_class *v7;
  double v8;
  NSString *v9;
  Class v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  objc_class *v17;
  void *v19;
  void *v20;
  const char *v21;
  double v22;
  id v23;

  v4 = a3;
  if (qword_255B51C20 != -1)
    dispatch_once(&qword_255B51C20, &unk_24F5012D0);
  objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51C18, v3, v5, v4);
  v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v6, v8, CFSTR("%@_TMLModule"), v4);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = NSClassFromString(v9);

    if (v10)
    {
      v7 = v10;
      if ((objc_msgSend_loadModule(v7, v13, v14) & 1) != 0)
      {
        objc_msgSend_setObject_forKeyedSubscript_((void *)qword_255B51C18, v15, v16, v7, v4);
        goto LABEL_7;
      }
      v19 = (void *)MEMORY[0x24BDBCE88];
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v15, v16, CFSTR("Cannot load required module %@"), v4);
    }
    else
    {
      v19 = (void *)MEMORY[0x24BDBCE88];
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, v12, CFSTR("Cannot find required module %@"), v4);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v19, v21, v22, CFSTR("TMLRuntimeException"), v20, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v23);
  }
LABEL_7:
  v17 = v7;

  return v17;
}

+ (id)createObjectWithIdentifier:(id)a3 ofType:(id)a4 initializer:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  const char *v21;
  double v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend_classForName_(a1, v11, v12, v9);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v19 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v14, v15, CFSTR("Cannot create object of undeclared type %@"), v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v19, v21, v22, CFSTR("TMLRuntimeException"), v20, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v23);
  }
  v16 = (void *)v13;
  objc_msgSend_createObjectWithIdentifier_ofClass_initializer_(a1, v14, v15, v8, v13, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)createObjectWithIdentifier:(id)a3 ofClass:(id)a4 initializer:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, objc_class *);
  const char *v10;
  double v11;
  objc_class *v12;
  id v13;
  const char *v14;
  double v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  void *v21;
  void *v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  const char *v27;
  double v28;
  id v29;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, objc_class *))a5;
  v12 = (objc_class *)objc_msgSend_objcClass(v8, v10, v11);
  if (v9)
  {
    v9[2](v9, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = objc_alloc_init(v12);
  }
  v16 = v13;
  if (!v13)
  {
    v21 = (void *)MEMORY[0x24BDBCE88];
    v22 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_className(v8, v14, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v22, v24, v25, CFSTR("Failed to create object type %@"), v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v21, v27, v28, CFSTR("TMLRuntimeException"), v26, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v29);
  }
  objc_getAssociatedObject(v13, "ccppmsc");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    objc_setAssociatedObject(v16, "ccppmsc", v8, (void *)1);
  objc_msgSend_setTmlIdentifier_(v16, v18, v19, v7);

  return v16;
}

+ (id)createObjectWithIdentifier:(id)a3 ofType:(id)a4 initializer:(id)a5 parentObject:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  id v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  void *v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14 = a6;
  if (v14)
  {
    objc_msgSend_classForObject_(a1, v13, v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_childClassForName_inClass_(a1, v17, v18, v11, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend_createObjectWithIdentifier_ofClass_initializer_(a1, v13, v15, v10, v19, v12);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
        goto LABEL_5;
    }
  }
  objc_msgSend_createObjectWithIdentifier_ofType_initializer_(a1, v13, v15, v10, v11, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
LABEL_5:
    objc_msgSend_setTmlParent_(v20, v13, v15, v14);

  return v20;
}

+ (void)makeObject:(id)a3 implementProtocols:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  const char *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  id v25;
  const char *v26;
  double v27;
  uint64_t v28;
  const char *v29;
  double v30;
  void *v31;
  id v32;
  id v33;
  const char *v34;
  double v35;
  const char *v36;
  double v37;
  objc_class *Class;
  const char *v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  void *v47;
  void *v48;
  const char *v49;
  double v50;
  id v51;
  const char *v52;
  double v53;
  const char *v54;
  objc_class *ClassPair;
  const char *v56;
  double v57;
  const char *v58;
  void *v59;
  double v60;
  id v61;
  const char *v62;
  double v63;
  void *v64;
  id v65;
  _QWORD v66[5];
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  _QWORD v71[4];
  id v72;
  id v73;

  v65 = a3;
  v6 = a4;
  if (objc_msgSend_count(v6, v7, v8))
  {
    v9 = objc_alloc(MEMORY[0x24BDBCEF0]);
    v12 = (void *)objc_msgSend_initWithSet_(v9, v10, v11, v6);
    v15 = objc_msgSend_count(v12, v13, v14);
    v18 = MEMORY[0x24BDAC760];
    if (v15)
    {
      do
      {
        v19 = objc_msgSend_count(v12, v16, v17);
        v71[0] = v18;
        v71[1] = 3221225472;
        v71[2] = sub_22AD4EDB8;
        v71[3] = &unk_24F5012F8;
        v73 = a1;
        v20 = v12;
        v72 = v20;
        objc_msgSend_enumerateObjectsUsingBlock_(v20, v21, v22, v71);

      }
      while (objc_msgSend_count(v20, v23, v24) != v19);
    }
    v25 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v28 = objc_msgSend_count(v12, v26, v27);
    v31 = (void *)objc_msgSend_initWithCapacity_(v25, v29, v30, v28);
    v67[0] = v18;
    v67[1] = 3221225472;
    v67[2] = sub_22AD4EE48;
    v67[3] = &unk_24F501320;
    v70 = a1;
    v32 = v65;
    v68 = v32;
    v33 = v31;
    v69 = v33;
    objc_msgSend_enumerateObjectsUsingBlock_(v12, v34, v35, v67);
    if (objc_msgSend_count(v33, v36, v37))
    {
      if (!objc_getAssociatedObject(v32, "cppmsc"))
      {
        Class = object_getClass(v32);
        objc_msgSend_allObjects(v6, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sortedArrayUsingSelector_(v41, v42, v43, sel_compare_);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_componentsJoinedByString_(v44, v45, v46, CFSTR("_"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = (void *)MEMORY[0x24BDD17C8];
        NSStringFromClass(Class);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v47, v49, v50, CFSTR("%@_%@_%llu"), v48, v64, qword_255B51C28);
        v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v54 = (const char *)objc_msgSend_UTF8String(v51, v52, v53);

        ++qword_255B51C28;
        ClassPair = objc_allocateClassPair(Class, v54, 0);
        v66[0] = v18;
        v66[1] = 3221225472;
        v66[2] = sub_22AD4EF2C;
        v66[3] = &unk_24F501368;
        v66[4] = ClassPair;
        objc_msgSend_enumerateObjectsUsingBlock_(v33, v56, v57, v66);
        objc_registerClassPair(ClassPair);
        object_setClass(v32, ClassPair);
        objc_setAssociatedObject(v32, "cppmsc", ClassPair, 0);

      }
      objc_getAssociatedObject(v32, "ppmsc");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v59)
      {
        v61 = objc_alloc(MEMORY[0x24BDBCEF0]);
        v59 = (void *)objc_msgSend_initWithCapacity_(v61, v62, v63, 2);
        objc_setAssociatedObject(v32, "ppmsc", v59, (void *)1);
      }
      objc_msgSend_addObjectsFromArray_(v59, v58, v60, v33);

    }
  }

}

+ (void)registerClass:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  v4 = a3;
  objc_msgSend_className(v4, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerClass_className_(a1, v7, v8, v4, v9);

}

+ (void)registerClass:(id)a3 className:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  char v19;
  const char *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  uint64_t v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  void *v37;
  void *v38;
  const char *v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  const char *v49;
  double v50;
  void *v51;
  const char *v52;
  double v53;
  const char *v54;
  double v55;
  void *v56;
  const char *v57;
  double v58;
  const char *v59;
  double v60;
  void *v61;
  const char *v62;
  double v63;
  const char *v64;
  double v65;
  void *v66;
  id v67;
  const char *v68;
  double v69;
  const char *v70;
  double v71;
  void *v72;
  const char *v73;
  double v74;
  const char *v75;
  double v76;
  TMLClassDescriptor *v77;
  const char *v78;
  double v79;
  void *v80;
  const char *v81;
  double v82;
  void *v83;
  id v84;
  const char *v85;
  double v86;
  TMLPropertyDescriptor *v87;
  const char *v88;
  double v89;
  void *v90;
  const char *v91;
  double v92;
  TMLSignalDescriptor *v93;
  TMLPropertyDescriptor *v94;
  const char *v95;
  double v96;
  void *v97;
  const char *v98;
  double v99;
  void *v100;
  const char *v101;
  double v102;
  void *v103;
  const char *v104;
  double v105;
  TMLSignalDescriptor *v106;
  TMLPropertyDescriptor *v107;
  const char *v108;
  double v109;
  void *v110;
  const char *v111;
  double v112;
  void *v113;
  const char *v114;
  double v115;
  void *v116;
  const char *v117;
  double v118;
  void *v119;
  const char *Name;
  const char *v121;
  double v122;
  void *v123;
  const char *v124;
  double v125;
  const char *v126;
  double v127;
  void *v128;
  const char *v129;
  double v130;
  void *v131;
  void *v132;
  const char *v133;
  double v134;
  uint64_t v135;
  const char *v136;
  double v137;
  void *v138;
  const char *v139;
  double v140;
  void *v141;
  const char *v142;
  double v143;
  const char *v144;
  double v145;
  void *v146;
  id v147;
  void *v148;
  const char *v149;
  double v150;
  void *v151;
  const char *v152;
  double v153;
  const char *v154;
  double v155;
  void *v156;
  const char *v157;
  double v158;
  id v159;
  void *v160;
  void *v161;
  const char *v162;
  double v163;
  void *v164;
  const char *v165;
  double v166;
  id v167;
  Class cls;
  void *v169;
  void *v170;
  _QWORD v171[4];
  id v172;
  id v173;
  _QWORD v174[4];
  id v175;
  _QWORD v176[6];
  _QWORD v177[4];
  id v178;
  id v179;
  _QWORD v180[6];
  _QWORD v181[6];
  _QWORD v182[6];
  const __CFString *v183;
  id v184;
  void *v185;
  void *v186;
  const __CFString *v187;
  id v188;
  const __CFString *v189;
  _QWORD v190[3];

  v190[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v10 = (void *)objc_msgSend_objcClass(v6, v8, v9);
  v13 = v10;
  v14 = MEMORY[0x24BDAC760];
  if (v10)
  {
    objc_getAssociatedObject(v10, "ccppmsc");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v15;
    if (!v15 || (objc_msgSend_isEqual_(v15, v16, v17, v6) & 1) != 0)
    {
      v19 = 0;
      goto LABEL_9;
    }
    if ((objc_msgSend_canMergeFromClassDescriptor_(v18, v16, v17, v6) & 1) != 0)
    {
      v19 = objc_msgSend_mergeFromClassDescriptor_(v18, v30, v31, v6);
LABEL_9:
      objc_msgSend_superClass(v6, v16, v17);
      v32 = objc_claimAutoreleasedReturnValue();
      v170 = (void *)v32;
      if (v32)
      {
        objc_msgSend_registerClass_(a1, v33, v34, v32);
      }
      else
      {
        v131 = v18;
        objc_msgSend_superClassName(v6, v33, v34);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v135 = objc_msgSend_length(v132, v133, v134);

        if (v135)
        {
          objc_msgSend_superClassName(v6, v136, v137);
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_classForName_(a1, v139, v140, v138);
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setSuperClass_(v6, v142, v143, v141);

          objc_msgSend_superClass(v6, v144, v145);
          v146 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = v131;
          if (!v146)
          {
            objc_msgSend_addObject_((void *)qword_255B51BF8, v35, v36, v6);
            goto LABEL_27;
          }
        }
        else
        {
          objc_msgSend_rootClassDescriptor(a1, v136, v137);
          v147 = (id)objc_claimAutoreleasedReturnValue();

          v18 = v131;
          if (v147 != v6)
          {
            objc_msgSend_rootClassDescriptor(a1, v35, v36);
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setSuperClass_(v6, v149, v150, v148);

          }
        }
      }
      if ((v19 & 1) == 0)
      {
        objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51BE8, v35, v36, v7);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          if (!v18)
          {
            objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51BE8, v35, v36, v7);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51BE8, v39, v40, v7);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend_isEqual_(v41, v42, v43, v6) & 1) == 0)
              {
                v160 = (void *)MEMORY[0x24BDBCE88];
                objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v44, v45, CFSTR("Attempt to redeclare class %@"), v7);
                v161 = (void *)objc_claimAutoreleasedReturnValue();
                v187 = CFSTR("class");
                v188 = v6;
                objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v162, v163, &v188, &v187, 1);
                v164 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_exceptionWithName_reason_userInfo_(v160, v165, v166, CFSTR("TMLRuntimeException"), v161, v164);
                v167 = (id)objc_claimAutoreleasedReturnValue();

                objc_exception_throw(v167);
              }

            }
          }
LABEL_22:
          v66 = (void *)qword_255B51BE8;
          v177[0] = v14;
          v177[1] = 3221225472;
          v177[2] = sub_22AD4F980;
          v177[3] = &unk_24F501410;
          v178 = v7;
          v67 = v6;
          v179 = v67;
          objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v66, v68, v69, v177);
          objc_msgSend_childClasses(v67, v70, v71);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v176[0] = v14;
          v176[1] = 3221225472;
          v176[2] = sub_22AD4F9E4;
          v176[3] = &unk_24F501430;
          v176[4] = v13;
          v176[5] = a1;
          objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v72, v73, v74, v176);

          cls = (Class)objc_msgSend_registerState_forClass_(TMLState, v75, v76, v67, v13);
          objc_setAssociatedObject(cls, "ccppmsc", v67, (void *)1);
          v77 = [TMLClassDescriptor alloc];
          v169 = v18;
          v80 = (void *)objc_msgSend_initWithName_superClassName_initializer_optional_(v77, v78, v79, CFSTR("State"), 0, 0, 0);
          objc_msgSend_inheritedProperties(v67, v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v174[0] = v14;
          v174[1] = 3221225472;
          v174[2] = sub_22AD4FA60;
          v174[3] = &unk_24F501458;
          v175 = v80;
          v84 = v80;
          objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v83, v85, v86, v174);

          v87 = [TMLPropertyDescriptor alloc];
          v90 = (void *)objc_msgSend_initWithName_type_attributes_(v87, v88, v89, CFSTR("tmlExtends"), 17, 0);
          objc_msgSend_addProperty_(v84, v91, v92, v90);

          v93 = [TMLSignalDescriptor alloc];
          v94 = [TMLPropertyDescriptor alloc];
          v97 = (void *)objc_msgSend_initWithName_type_attributes_(v94, v95, v96, CFSTR("fromState"), 17, 0);
          v186 = v97;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v98, v99, &v186, 1);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = (void *)objc_msgSend_initWithName_parameters_(v93, v101, v102, CFSTR("enterState"), v100);
          objc_msgSend_addSignal_(v84, v104, v105, v103);

          v106 = [TMLSignalDescriptor alloc];
          v107 = [TMLPropertyDescriptor alloc];
          v110 = (void *)objc_msgSend_initWithName_type_attributes_(v107, v108, v109, CFSTR("toState"), 17, 0);
          v185 = v110;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v111, v112, &v185, 1);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = (void *)objc_msgSend_initWithName_parameters_(v106, v114, v115, CFSTR("leaveState"), v113);
          objc_msgSend_addSignal_(v84, v117, v118, v116);

          v14 = MEMORY[0x24BDAC760];
          v119 = (void *)MEMORY[0x24BDD17C8];
          Name = class_getName(cls);
          objc_msgSend_stringWithCString_encoding_(v119, v121, v122, Name, 4);
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObjcClassName_(v84, v124, v125, v123);

          objc_msgSend_addChildClass_(v67, v126, v127, v84);
          goto LABEL_23;
        }
      }
      objc_msgSend_properties(v6, v35, v36);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v182[0] = v14;
      v182[1] = 3221225472;
      v182[2] = sub_22AD4F908;
      v182[3] = &unk_24F501388;
      v182[4] = a1;
      v182[5] = v13;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v46, v47, v48, v182);

      objc_msgSend_methods(v6, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v181[0] = v14;
      v181[1] = 3221225472;
      v181[2] = sub_22AD4F914;
      v181[3] = &unk_24F5013A8;
      v181[4] = a1;
      v181[5] = v13;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v51, v52, v53, v181);

      objc_msgSend_signals(v6, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v180[0] = v14;
      v180[1] = 3221225472;
      v180[2] = sub_22AD4F920;
      v180[3] = &unk_24F5013C8;
      v180[4] = a1;
      v180[5] = v13;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v56, v57, v58, v180);

      if (qword_255B51C30 != -1)
        dispatch_once(&qword_255B51C30, &unk_24F5013E8);
      objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51BE8, v59, v60, v7);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v61)
      {
        objc_msgSend_setObject_forKeyedSubscript_((void *)qword_255B51BE8, v62, v63, v6, v7);
        objc_msgSend_removeObject_((void *)qword_255B51BF8, v64, v65, v6);
        objc_setAssociatedObject(v13, "ccppmsc", v6, (void *)1);
      }
      if ((v19 & 1) == 0)
        goto LABEL_22;
LABEL_27:

      goto LABEL_28;
    }
    v22 = (void *)MEMORY[0x24BDBCE88];
    v151 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_className(v6, v30, v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v151, v152, v153, CFSTR("Attempt to redeclare class %@"), v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = CFSTR("class");
    v190[0] = v6;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v154, v155, v190, &v189, 1);
LABEL_32:
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v22, v157, v158, CFSTR("TMLRuntimeException"), v27, v156);
    v159 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v159);
  }
  if ((objc_msgSend_isOptional(v6, v11, v12) & 1) == 0)
  {
    v22 = (void *)MEMORY[0x24BDBCE88];
    v23 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_className(v6, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v23, v25, v26, CFSTR("Cannot register unknown class %@"), v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v183 = CFSTR("class");
    v184 = v6;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v28, v29, &v184, &v183, 1);
    goto LABEL_32;
  }
LABEL_23:
  objc_msgSend_tmlMakeJSObjectClass(v13, v20, v21);
  v128 = (void *)qword_255B51BF8;
  v171[0] = v14;
  v171[1] = 3221225472;
  v171[2] = sub_22AD4FA68;
  v171[3] = &unk_24F501480;
  v172 = v6;
  v173 = a1;
  objc_msgSend_enumerateObjectsUsingBlock_(v128, v129, v130, v171);

LABEL_28:
}

+ (void)registerProtocol:(id)a3
{
  const char *v4;
  double v5;
  const char *v6;
  void *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v20 = a3;
  objc_msgSend_objcProtocol(v20, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend_protocolName(v20, v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51BF0, v10, v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend_signals(v20, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = sub_22AD4FC04;
      v21[3] = &unk_24F5014A8;
      v23 = a1;
      v22 = v7;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v15, v16, v17, v21);

      if (qword_255B51C38 != -1)
        dispatch_once(&qword_255B51C38, &unk_24F5014C8);
      objc_msgSend_setObject_forKeyedSubscript_((void *)qword_255B51BF0, v18, v19, v20, v9);

    }
  }

}

+ (Class)createClass:(id)a3
{
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  objc_class *v15;
  void *v16;
  void *v17;
  const char *v18;
  double v19;
  id v20;
  const char *v21;
  double v22;
  const char *v23;
  objc_class *ClassPair;
  uint64_t v25;
  const char *v26;
  double v27;
  int isSubclassOfClass;
  uint64_t v29;
  objc_method *InstanceMethod;
  void *v31;
  void (*v32)(void);
  const char *TypeEncoding;
  uint64_t v34;
  const char *v35;
  double v36;
  objc_method *v37;
  void *v38;
  void (*v39)(void);
  const char *v40;
  uint64_t v41;
  const char *v42;
  double v43;
  objc_method *v44;
  void *v45;
  void (*v46)(void);
  const char *v47;
  objc_method *v48;
  void *v49;
  void (*v50)(void);
  const char *v51;
  objc_method *v52;
  void *v53;
  void (*v54)(void);
  objc_class *Class;
  const char *v56;
  id v57;
  const char *v58;
  double v59;
  void *v60;
  const char *v61;
  double v62;
  void *v63;
  const char *v64;
  double v65;
  const char *v66;
  double v67;
  uint64_t v68;
  id v69;
  const char *v70;
  double v71;
  const char *v72;
  double v73;
  objc_class *v74;
  id v76;
  _QWORD v77[6];
  _QWORD v78[4];
  id v79;
  id v80;
  _QWORD v81[5];
  _QWORD v82[7];
  _QWORD v83[7];
  _QWORD v84[7];
  _QWORD v85[7];
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;

  v86 = 0;
  v87 = &v86;
  v88 = 0x3032000000;
  v89 = sub_22AD50200;
  v90 = sub_22AD50210;
  v76 = a3;
  v91 = v76;
  objc_msgSend_rootObject((void *)v87[5], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_type(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ensureClass_(a1, v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (objc_class *)objc_msgSend_objcClass(v12, v13, v14);

  v16 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v16, v18, v19, CFSTR("%@_tml_%llu"), v17, qword_255B51C40);
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = (const char *)objc_msgSend_UTF8String(v20, v21, v22);

  ++qword_255B51C40;
  ClassPair = objc_allocateClassPair(v15, v23, 0);
  v25 = objc_opt_class();
  isSubclassOfClass = objc_msgSend_isSubclassOfClass_(v15, v26, v27, v25);
  v29 = MEMORY[0x24BDAC760];
  if (isSubclassOfClass)
  {
    InstanceMethod = class_getInstanceMethod(v15, sel_initWithStyle_reuseIdentifier_);
    v85[0] = v29;
    v85[1] = 3221225472;
    v85[2] = sub_22AD50218;
    v85[3] = &unk_24F5014F0;
    v85[5] = v15;
    v85[6] = sel_initWithStyle_reuseIdentifier_;
    v85[4] = &v86;
    v31 = (void *)MEMORY[0x22E2E7E44](v85);
    v32 = imp_implementationWithBlock(v31);

    TypeEncoding = method_getTypeEncoding(InstanceMethod);
    class_addMethod(ClassPair, sel_initWithStyle_reuseIdentifier_, v32, TypeEncoding);
  }
  else
  {
    v34 = objc_opt_class();
    if (objc_msgSend_isSubclassOfClass_(v15, v35, v36, v34))
    {
      v37 = class_getInstanceMethod(v15, sel_initWithReuseIdentifier_);
      v84[0] = v29;
      v84[1] = 3221225472;
      v84[2] = sub_22AD504A8;
      v84[3] = &unk_24F501518;
      v84[5] = v15;
      v84[6] = sel_initWithReuseIdentifier_;
      v84[4] = &v86;
      v38 = (void *)MEMORY[0x22E2E7E44](v84);
      v39 = imp_implementationWithBlock(v38);

      v40 = method_getTypeEncoding(v37);
      class_addMethod(ClassPair, sel_initWithReuseIdentifier_, v39, v40);
    }
    else
    {
      v41 = objc_opt_class();
      if (objc_msgSend_isSubclassOfClass_(v15, v42, v43, v41))
      {
        v44 = class_getInstanceMethod(v15, sel_initWithFrame_);
        v83[0] = v29;
        v83[1] = 3221225472;
        v83[2] = sub_22AD5053C;
        v83[3] = &unk_24F501540;
        v83[5] = v15;
        v83[6] = sel_initWithFrame_;
        v83[4] = &v86;
        v45 = (void *)MEMORY[0x22E2E7E44](v83);
        v46 = imp_implementationWithBlock(v45);

        v47 = method_getTypeEncoding(v44);
        class_addMethod(ClassPair, sel_initWithFrame_, v46, v47);
      }
      else
      {
        v48 = class_getInstanceMethod(v15, sel_init);
        v82[0] = v29;
        v82[1] = 3221225472;
        v82[2] = sub_22AD505EC;
        v82[3] = &unk_24F501568;
        v82[5] = v15;
        v82[6] = sel_init;
        v82[4] = &v86;
        v49 = (void *)MEMORY[0x22E2E7E44](v82);
        v50 = imp_implementationWithBlock(v49);

        v51 = method_getTypeEncoding(v48);
        class_addMethod(ClassPair, sel_init, v50, v51);
      }
    }
  }
  v52 = class_getInstanceMethod(v15, sel_tmlDispose);
  v81[0] = v29;
  v81[1] = 3221225472;
  v81[2] = sub_22AD5066C;
  v81[3] = &unk_24F5015B8;
  v81[4] = &v86;
  v53 = (void *)MEMORY[0x22E2E7E44](v81);
  v54 = imp_implementationWithBlock(v53);

  Class = object_getClass(ClassPair);
  v56 = method_getTypeEncoding(v52);
  class_addMethod(Class, sel_tmlDispose, v54, v56);
  v57 = objc_alloc(MEMORY[0x24BDBCEF0]);
  objc_msgSend_implements(v6, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_msgSend_initWithSet_(v57, v61, v62, v60);

  if (objc_msgSend_count(v63, v64, v65))
  {
    do
    {
      v68 = objc_msgSend_count(v63, v66, v67);
      v78[0] = v29;
      v78[1] = 3221225472;
      v78[2] = sub_22AD50724;
      v78[3] = &unk_24F5012F8;
      v80 = a1;
      v69 = v63;
      v79 = v69;
      objc_msgSend_enumerateObjectsUsingBlock_(v69, v70, v71, v78);

    }
    while (objc_msgSend_count(v69, v72, v73) != v68);
  }
  v77[0] = v29;
  v77[1] = 3221225472;
  v77[2] = sub_22AD507B4;
  v77[3] = &unk_24F5015D8;
  v77[4] = a1;
  v77[5] = ClassPair;
  objc_msgSend_enumerateObjectsUsingBlock_(v63, v66, v67, v77);
  objc_registerClassPair(ClassPair);
  v74 = ClassPair;

  _Block_object_dispose(&v86, 8);
  return v74;
}

+ (void)verifyProperty:(id)a3 withClass:(Class)a4
{
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  const char *v13;
  objc_property *Property;
  const char *v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  NSString *v20;
  const char *v21;
  Method InstanceMethod;
  const char *v23;
  double v24;
  objc_method *v25;
  void *v26;
  void *v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  NSString *v36;
  const char *v37;
  Method v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  const char *v43;
  double v44;
  NSString *v45;
  const char *v46;
  char *v47;
  const char *v48;
  double v49;
  const char *v50;
  id v51;
  size_t v52;
  const char *v53;
  double v54;
  __CFString *v55;
  const char *v56;
  double v57;
  uint64_t v58;
  const char *v59;
  double v60;
  const char *v61;
  double v62;
  void *v63;
  void *v64;
  const char *v65;
  double v66;
  void *v67;
  const char *v68;
  double v69;
  void *v70;
  const char *v71;
  double v72;
  void *v73;
  const char *v74;
  double v75;
  void *v76;
  const char *v77;
  double v78;
  NSString *v79;
  const char *v80;
  const char *v81;
  double v82;
  uint64_t v83;
  const char *v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  const char *v89;
  double v90;
  void *v91;
  const char *v92;
  double v93;
  void *v94;
  const char *v95;
  double v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  const char *v101;
  double v102;
  void *v103;
  const char *v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  const char *v109;
  double v110;
  void *v111;
  const char *v112;
  double v113;
  void *v114;
  const char *v115;
  double v116;
  void *v117;
  const char *v118;
  double v119;
  void *v120;
  const char *v121;
  double v122;
  id v123;
  void *v124;
  const char *v125;
  double v126;
  const char *v127;
  double v128;
  void *v129;
  const char *v130;
  double v131;
  id v132;
  const __CFString *v133;
  id v134;
  const __CFString *v135;
  id v136;
  const __CFString *v137;
  id v138;
  const __CFString *v139;
  _QWORD v140[2];

  v140[1] = *MEMORY[0x24BDAC8D0];
  v132 = a3;
  if (!objc_msgSend_type(v132, v6, v7))
  {
    v86 = (void *)MEMORY[0x24BDBCE88];
    v87 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_description(v132, v8, v9);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v87, v89, v90, CFSTR("Cannot register property of unsupported type %@"), v88);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = CFSTR("property");
    v140[0] = v132;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v92, v93, v140, &v139, 1);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v86, v95, v96, CFSTR("TMLRuntimeException"), v91, v94);
    v97 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_35;
  }
  objc_msgSend_propertyName(v132, v8, v9);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12);
  Property = class_getProperty(a4, v13);

  if (Property)
  {
    v18 = sub_22AD50F1C(Property);
    goto LABEL_18;
  }
  objc_msgSend_propertyName(v132, v15, v16);
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  v21 = NSSelectorFromString(v20);
  InstanceMethod = class_getInstanceMethod(a4, v21);
  if (InstanceMethod)
  {
    v25 = InstanceMethod;
  }
  else
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_substringToIndex_(v20, v23, v24, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_capitalizedString(v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_substringFromIndex_(v20, v31, v32, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v26, v34, v35, CFSTR("is%@%@"), v30, v33);
    v36 = (NSString *)objc_claimAutoreleasedReturnValue();

    v37 = NSSelectorFromString(v36);
    v38 = class_getInstanceMethod(a4, v37);
    if (v38)
    {
      v25 = v38;
    }
    else if (!objc_msgSend_isOptional(v132, v39, v40)
           || (objc_msgSend_addProperty_toClass_(a1, v41, v42, v132, a4),
               objc_msgSend_propertyName(v132, v43, v44),
               v45 = (NSString *)objc_claimAutoreleasedReturnValue(),
               v46 = NSSelectorFromString(v45),
               v25 = class_getInstanceMethod(a4, v46),
               v45,
               !v25))
    {
      v98 = (void *)MEMORY[0x24BDBCE88];
      v124 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_description(a4, v41, v42);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v124, v125, v126, CFSTR("Method %@ not found in class %@"), v36, v100);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v137 = CFSTR("property");
      v138 = v132;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v127, v128, &v138, &v137, 1);
      goto LABEL_34;
    }
    v20 = v36;
  }
  v47 = method_copyReturnType(v25);
  if (v47)
  {
    v50 = v47;
    v51 = objc_alloc(MEMORY[0x24BDD17C8]);
    v52 = strlen(v50);
    v55 = (__CFString *)objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(v51, v53, v54, v50, v52, 1, 1);
    v58 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v56, v57, v55);
  }
  else
  {
    v55 = CFSTR(" ");
    v58 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v48, v49, CFSTR(" "));
  }
  v18 = v58;

  if ((objc_msgSend_isReadonly(v132, v59, v60) & 1) != 0)
    goto LABEL_17;
  v63 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_propertyName(v132, v61, v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v64, v65, v66, 1);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_capitalizedString(v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_propertyName(v132, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringFromIndex_(v73, v74, v75, 1);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v63, v77, v78, CFSTR("set%@%@:"), v70, v76);
  v79 = (NSString *)objc_claimAutoreleasedReturnValue();

  v80 = NSSelectorFromString(v79);
  if (!class_getInstanceMethod(a4, v80))
  {
    v98 = (void *)MEMORY[0x24BDBCE88];
    v99 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_description(a4, v81, v82);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v99, v101, v102, CFSTR("Method %@ not found in class %@"), v79, v100);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = CFSTR("property");
    v136 = v132;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v104, v105, &v136, &v135, 1);
LABEL_34:
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v98, v130, v131, CFSTR("TMLRuntimeException"), v103, v129);
    v97 = (id)objc_claimAutoreleasedReturnValue();

LABEL_35:
    objc_exception_throw(v97);
  }
  v20 = v79;
LABEL_17:

LABEL_18:
  v83 = objc_msgSend_type(v132, v17, v19);
  if (v83 != v18
    && (v18 != 4 || v83 != 3)
    && (v18 != 3 || v83 != 4)
    && (v18 != 5 || v83 != 7)
    && (v18 != 16 || (unint64_t)objc_msgSend_type(v132, v84, v85) <= 0xF))
  {
    if (Property)
      v18 = sub_22AD50F1C(Property);
    v106 = (void *)MEMORY[0x24BDBCE88];
    v107 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_typeNameForType_(TMLTypeRegistry, v84, v85, v18);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v132, v109, v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_propertyName(v132, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v107, v115, v116, CFSTR("Runtime type mismatch %@ vs %@ for %@"), v108, v111, v114);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = CFSTR("property");
    v134 = v132;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v118, v119, &v134, &v133, 1);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v106, v121, v122, CFSTR("TMLRuntimeException"), v117, v120);
    v123 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v123);
  }

}

+ (void)addProperty:(id)a3 toClass:(Class)a4
{
  id v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  uint64_t v10;
  const char *v11;
  double v12;
  id v13;
  const char *v14;
  double v15;
  const char *v16;
  id v17;
  const char *v18;
  double v19;
  const char *v20;
  void (*v21)(void);
  const char *v22;
  double v23;
  NSString *v24;
  const char *v25;
  const char *v26;
  double v27;
  id v28;
  const char *v29;
  double v30;
  const char *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  void *v49;
  const char *v50;
  double v51;
  NSString *v52;
  const char *v53;
  const char *v54;
  double v55;
  id v56;
  const char *v57;
  double v58;
  const char *v59;
  IMP imp;
  objc_property_attribute_t attributes;
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (objc_msgSend_isOptional(v5, v6, v7))
  {
    v10 = objc_msgSend_type(v5, v8, v9);
    objc_msgSend_encodedTypeForType_(TMLTypeRegistry, v11, v12, v10);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    attributes.name = "T";
    attributes.value = (const char *)objc_msgSend_UTF8String(v13, v14, v15);
    v62 = xmmword_24F5015F8;
    objc_msgSend_propertyName(v5, v16, COERCE_DOUBLE(0x22ADAA9FDLL));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = (const char *)objc_msgSend_UTF8String(v17, v18, v19);
    class_addProperty(a4, v20, &attributes, 2u);

    v21 = imp_implementationWithBlock(&unk_24F501608);
    objc_msgSend_propertyName(v5, v22, v23);
    v24 = (NSString *)objc_claimAutoreleasedReturnValue();
    v25 = NSSelectorFromString(v24);
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v26, v27, CFSTR("%@@:"), v13);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v31 = (const char *)objc_msgSend_UTF8String(v28, v29, v30);
    class_addMethod(a4, v25, v21, v31);

    if ((objc_msgSend_isReadonly(v5, v32, v33) & 1) == 0)
    {
      imp = imp_implementationWithBlock(&unk_24F501648);
      v34 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_propertyName(v5, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringToIndex_(v37, v38, v39, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_capitalizedString(v40, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_propertyName(v5, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_substringFromIndex_(v46, v47, v48, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v34, v50, v51, CFSTR("set%@%@:"), v43, v49);
      v52 = (NSString *)objc_claimAutoreleasedReturnValue();

      v53 = NSSelectorFromString(v52);
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v54, v55, CFSTR("v@:%@"), v13);
      v56 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v59 = (const char *)objc_msgSend_UTF8String(v56, v57, v58);
      class_addMethod(a4, v53, imp, v59);

      v24 = v52;
    }

  }
}

+ (void)registerProperty:(id)a3 forObject:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  void *v48;
  const char *v49;
  double v50;
  id v51;
  id v52;

  v52 = a3;
  v6 = a4;
  objc_getAssociatedObject(v6, "pmsc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = objc_alloc(MEMORY[0x24BDBCED8]);
    v8 = (void *)objc_msgSend_initWithCapacity_(v10, v11, v12, 4);
    objc_setAssociatedObject(v6, "pmsc", v8, (void *)1);
  }
  objc_msgSend_propertyName(v52, v7, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v14, v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_5;
  objc_msgSend_classForObject_(a1, v17, v18, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_properties(v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_propertyName(v52, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v22, v26, v27, v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
LABEL_5:
    if ((objc_msgSend_isEqual_(v16, v17, v18, v52) & 1) == 0)
    {
      v40 = (void *)MEMORY[0x24BDBCE88];
      v41 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_propertyName(v52, v28, v29);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tmlIdentifier(v6, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v41, v46, v47, CFSTR("Attempt to redeclare property %@ for %@"), v42, v45);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v40, v49, v50, CFSTR("TMLRuntimeException"), v48, 0);
      v51 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v51);
    }
  }
  else
  {
    objc_msgSend_propertyName(v52, v17, v18);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v8, v31, v32, v52, v30);

    if (objc_msgSend_subclassInstance_(TMLRuntimeObject, v33, v34, v6))
    {
      objc_msgSend_propertyName(v52, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_registerTMLProperty_(v6, v38, v39, v37);

    }
    v16 = 0;
  }

}

+ (id)property:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  void *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;

  v6 = a3;
  v7 = a4;
  objc_getAssociatedObject(v7, "pmsc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, v10, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend_classForObject_(a1, v11, v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_properties(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v17, v18, v19, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (void)registerMethod:(id)a3 forObject:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  id v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  id v28;
  void *v29;
  const char *v30;
  double v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  uint64_t v37;
  const char *v38;
  double v39;
  TMLMethodCall *v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  const char *v49;
  double v50;
  void *v51;
  const char *v52;
  double v53;
  id v54;
  void *v55;
  const char *v56;
  double v57;
  id v58;

  v58 = a3;
  v6 = a4;
  objc_getAssociatedObject(v6, "msc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = objc_alloc(MEMORY[0x24BDBCED8]);
    v8 = (void *)objc_msgSend_initWithCapacity_(v10, v11, v12, 4);
    objc_setAssociatedObject(v6, "msc", v8, (void *)1);
  }
  objc_msgSend_methodName(v58, v7, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v14, v15, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend_classForObject_(a1, v17, v18, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_methods(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_methodName(v58, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v22, v26, v27, v25);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v28 = 0;
      goto LABEL_9;
    }
  }
  if ((objc_msgSend_isEqual_(v16, v17, v18, v58) & 1) == 0)
  {
    v46 = (void *)MEMORY[0x24BDBCE88];
    v47 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_methodName(v58, v17, v18);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v47, v49, v50, CFSTR("Attempt to redeclare method %@ for %@"), v48, v6);
    goto LABEL_15;
  }
  v28 = v58;
  if (v16 == v58)
  {
LABEL_9:
    objc_msgSend_methodName(v58, v17, v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v8, v30, v31, v58, v29);

    objc_msgSend_methodSelector(v58, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {

LABEL_12:
      v37 = objc_opt_class();
      objc_msgSend_verifyMethod_withClass_(a1, v38, v39, v58, v37);
      v40 = [TMLMethodCall alloc];
      v43 = (void *)objc_msgSend_initWithMethodDescriptor_forClass_(v40, v41, v42, v58, v37);
      objc_msgSend_tmlAddMethod_(v6, v44, v45, v43);

      v16 = v28;
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_12;
    v46 = (void *)MEMORY[0x24BDBCE88];
    v55 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_methodName(v58, v35, v36);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v55, v56, v57, CFSTR("Method selector unspecified for %@ in %@"), v48, v6);
LABEL_15:
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v46, v52, v53, CFSTR("TMLRuntimeException"), v51, 0);
    v54 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v54);
  }
LABEL_13:

}

+ (void)registerSignal:(id)a3 forObject:(id)a4
{
  id v6;
  const char *v7;
  void *v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  id v45;
  id v46;

  v46 = a3;
  v6 = a4;
  objc_getAssociatedObject(v6, "sc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v10 = objc_alloc(MEMORY[0x24BDBCED8]);
    v8 = (void *)objc_msgSend_initWithCapacity_(v10, v11, v12, 4);
    objc_setAssociatedObject(v6, "sc", v8, (void *)1);
  }
  objc_msgSend_signalName(v46, v7, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v14, v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_5;
  objc_msgSend_classForObject_(a1, v17, v18, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signals(v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_signalName(v46, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v22, v26, v27, v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
LABEL_5:
    if ((objc_msgSend_isEqual_(v16, v17, v18, v46) & 1) == 0)
    {
      v34 = (void *)MEMORY[0x24BDBCE88];
      v39 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_signalName(v46, v17, v18);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v39, v40, v41, CFSTR("Attempt to redeclare signal %@ for %@"), v36, v6);
LABEL_10:
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v34, v43, v44, CFSTR("TMLRuntimeException"), v42, 0);
      v45 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v45);
    }
  }
  objc_msgSend_methodSelector(v46, v17, v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v34 = (void *)MEMORY[0x24BDBCE88];
    v35 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_signalName(v46, v29, v30);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v35, v37, v38, CFSTR("Attempt to declare signal with method selector %@ for %@"), v36, v6);
    goto LABEL_10;
  }
  objc_msgSend_signalName(v46, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v8, v32, v33, v46, v31);

}

+ (void)verifyMethod:(id)a3 forProtocol:(id)a4
{
  Protocol *v5;
  const char *v6;
  double v7;
  const char *v8;
  NSString *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  const char *v17;
  const char *v18;
  double v19;
  char v20;
  const char *v21;
  double v22;
  char hasPrefix;
  double v24;
  objc_method_description MethodDescription;
  void *v26;
  const char *v27;
  double v28;
  uint64_t v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  const char *v38;
  double v39;
  uint64_t ArgumentTypeAtIndex;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  uint64_t v46;
  const char *v47;
  double v48;
  void *v49;
  const char *v50;
  double v51;
  void *v52;
  const char *v53;
  double v54;
  uint64_t v55;
  const char *v56;
  double v57;
  BOOL v58;
  id v59;
  const char *v60;
  double v61;
  uint64_t v62;
  const char *v63;
  double v64;
  void *v65;
  const char *v66;
  double v67;
  uint64_t v68;
  const char *v69;
  double v70;
  uint64_t v71;
  const char *v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  const char *v77;
  double v78;
  void *v79;
  const char *v80;
  double v81;
  void *v82;
  const char *v83;
  double v84;
  void *v85;
  const char *v86;
  double v87;
  void *v88;
  const char *v89;
  double v90;
  void *v91;
  const char *v92;
  double v93;
  id v94;
  void *v95;
  void *v96;
  const char *v97;
  const char *v98;
  double v99;
  void *v100;
  const char *v101;
  double v102;
  void *v103;
  const char *Name;
  const char *v105;
  double v106;
  const char *v107;
  double v108;
  void *v109;
  const char *v110;
  double v111;
  id v112;
  void *v113;
  void *v114;
  const char *v115;
  double v116;
  uint64_t v117;
  const char *v118;
  double v119;
  const char *v120;
  double v121;
  const char *v122;
  double v123;
  const char *v124;
  double v125;
  void *v126;
  const char *v127;
  double v128;
  id v129;
  const __CFString *v130;
  id v131;
  _QWORD v132[2];
  _QWORD v133[2];
  const __CFString *v134;
  id v135;
  const __CFString *v136;
  _QWORD v137[2];

  v137[1] = *MEMORY[0x24BDAC8D0];
  v129 = a3;
  v5 = (Protocol *)a4;
  objc_msgSend_methodSelector(v129, v6, v7);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend_methodName(v129, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_parameters(v129, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_methodSelectorForMethodName_parameters_(TMLMethodDescriptor, v15, v16, v11, v14);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  v17 = NSSelectorFromString(v9);
  v20 = objc_msgSend_isOptional(v129, v18, v19) ^ 1;
  hasPrefix = objc_msgSend_hasPrefix_(v9, v21, v22, CFSTR("+"));
  MethodDescription = protocol_getMethodDescription(v5, v17, v20, hasPrefix != 1);
  if (!MethodDescription.name)
  {
    if ((objc_msgSend_isOptional(v129, MethodDescription.types, v24) & 1) != 0)
      goto LABEL_30;
    v95 = (void *)MEMORY[0x24BDBCE88];
    v103 = (void *)MEMORY[0x24BDD17C8];
    Name = protocol_getName(v5);
    objc_msgSend_stringWithFormat_(v103, v105, v106, CFSTR("Method %@ not found in protocol %s"), v9, Name);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = CFSTR("method");
    v137[0] = v129;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v107, v108, v137, &v136, 1);
LABEL_35:
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v95, v110, v111, CFSTR("TMLRuntimeException"), v100, v109);
    v112 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v112);
  }
  objc_msgSend_signatureWithObjCTypes_(MEMORY[0x24BDBCEB0], MethodDescription.types, v24, MethodDescription.types);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_numberOfArguments(v26, v27, v28);
  objc_msgSend_parameters(v129, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend_count(v32, v33, v34);

  if (v29 - 2 != v35)
  {
    v95 = (void *)MEMORY[0x24BDBCE88];
    v96 = (void *)MEMORY[0x24BDD17C8];
    v97 = protocol_getName(v5);
    objc_msgSend_stringWithFormat_(v96, v98, v99, CFSTR("Argument count mismatch for method %@ in protocol %s"), v9, v97);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = CFSTR("method");
    v135 = v129;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v101, v102, &v135, &v134, 1);
    goto LABEL_35;
  }
  if (v29 != 2)
  {
    v36 = 2;
    while (1)
    {
      v37 = objc_retainAutorelease(v26);
      ArgumentTypeAtIndex = objc_msgSend_getArgumentTypeAtIndex_(v37, v38, v39, v36);
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v41, v42, ArgumentTypeAtIndex, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v44, v45, v43);

      objc_msgSend_parameters(v129, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v49, v50, v51, v36 - 2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = objc_msgSend_type(v52, v53, v54);
      if (v55 != v46)
      {
        v58 = v46 == 4 && v55 == 3;
        if (!v58
          && (v46 != 3 || v55 != 4)
          && (v46 != 5 || v55 != 7)
          && (v46 != 16 || (unint64_t)objc_msgSend_type(v52, v56, v57) <= 0xF))
        {
          break;
        }
      }

      if (v29 == ++v36)
        goto LABEL_19;
    }
    v74 = (void *)MEMORY[0x24BDBCE88];
    v75 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_typeNameForType_(TMLTypeRegistry, v56, v57, v46);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v52, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_propertyName(v52, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_methodName(v129, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v75, v86, v87, CFSTR("Runtime type mismatch %@ vs %@ for argument %@ in method %@"), v76, v79, v82, v85);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v132[0] = CFSTR("property");
    v132[1] = CFSTR("method");
    v133[0] = v52;
    v133[1] = v129;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v89, v90, v133, v132, 2);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v74, v92, v93, CFSTR("TMLRuntimeException"), v88, v91);
    v94 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
    objc_exception_throw(v94);
  }
LABEL_19:
  v59 = objc_retainAutorelease(v26);
  v62 = objc_msgSend_methodReturnType(v59, v60, v61);
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v63, v64, v62, 1);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v66, v67, v65);

  v71 = objc_msgSend_returnType(v129, v69, v70);
  if (v71 != v68
    && (v68 != 4 || v71 != 3)
    && (v68 != 3 || v71 != 4)
    && (v68 != 5 || v71 != 7)
    && (v68 != 16 || (unint64_t)objc_msgSend_returnType(v129, v72, v73) <= 0xF))
  {
    v113 = (void *)MEMORY[0x24BDBCE88];
    v114 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_typeNameForType_(TMLTypeRegistry, v72, v73, v68);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = objc_msgSend_returnType(v129, v115, v116);
    objc_msgSend_typeNameForType_(TMLTypeRegistry, v118, v119, v117);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_methodName(v129, v120, v121);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v114, v122, v123, CFSTR("Runtime type mismatch %@ vs %@ for return type in method %@"), v76, v79, v82);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = CFSTR("method");
    v131 = v129;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v124, v125, &v131, &v130, 1);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v113, v127, v128, CFSTR("TMLRuntimeException"), v85, v126);
    v94 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_32;
  }

LABEL_30:
}

+ (void)verifyMethod:(id)a3 withClass:(Class)a4
{
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;
  NSString *v12;
  const char *v13;
  const char *v14;
  objc_method *ClassMethod;
  double v16;
  uint64_t v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  uint64_t v23;
  const char *v24;
  double v25;
  uint64_t i;
  char *v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  uint64_t v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  void *v39;
  const char *v40;
  double v41;
  uint64_t v42;
  const char *v43;
  double v44;
  BOOL v45;
  char *v46;
  const char *v47;
  double v48;
  void *v49;
  const char *v50;
  double v51;
  uint64_t v52;
  const char *v53;
  double v54;
  uint64_t v55;
  const char *v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  const char *v61;
  double v62;
  uint64_t v63;
  const char *v64;
  double v65;
  void *v66;
  const char *v67;
  double v68;
  void *v69;
  const char *v70;
  double v71;
  void *v72;
  const char *v73;
  double v74;
  void *v75;
  const char *v76;
  double v77;
  id v78;
  const char *v79;
  const char *v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  const char *v85;
  double v86;
  void *v87;
  const char *v88;
  double v89;
  void *v90;
  const char *v91;
  double v92;
  void *v93;
  const char *v94;
  double v95;
  void *v96;
  const char *v97;
  double v98;
  void *v99;
  const char *v100;
  double v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  const char *v106;
  double v107;
  void *v108;
  const char *v109;
  double v110;
  void *v111;
  const char *v112;
  double v113;
  const char *v114;
  double v115;
  void *v116;
  const char *v117;
  double v118;
  id v119;
  id v120;
  const __CFString *v121;
  id v122;
  _QWORD v123[2];
  _QWORD v124[2];
  const __CFString *v125;
  id v126;
  const __CFString *v127;
  _QWORD v128[2];

  v128[1] = *MEMORY[0x24BDAC8D0];
  v120 = a3;
  objc_msgSend_methodSelector(v120, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_hasPrefix_(v7, v8, v9, CFSTR("+")))
  {
    objc_msgSend_substringFromIndex_(v7, v10, v11, 1);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();

    v13 = NSSelectorFromString(v12);
    ClassMethod = class_getClassMethod(a4, v13);
    v7 = v12;
    if (ClassMethod)
      goto LABEL_3;
LABEL_29:
    if ((objc_msgSend_isOptional(v120, v14, v16) & 1) != 0)
      goto LABEL_30;
    v103 = (void *)MEMORY[0x24BDBCE88];
    v111 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_description(a4, v80, v81);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v111, v112, v113, CFSTR("Method %@ not found in class %@"), v7, v105);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = CFSTR("method");
    v128[0] = v120;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v114, v115, v128, &v127, 1);
LABEL_34:
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v103, v117, v118, CFSTR("TMLRuntimeException"), v108, v116);
    v119 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v119);
  }
  v79 = NSSelectorFromString((NSString *)v7);
  ClassMethod = class_getInstanceMethod(a4, v79);
  if (!ClassMethod)
    goto LABEL_29;
LABEL_3:
  v17 = method_getNumberOfArguments(ClassMethod) - 2;
  objc_msgSend_parameters(v120, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend_count(v20, v21, v22);

  if (v23 != v17)
  {
    v103 = (void *)MEMORY[0x24BDBCE88];
    v104 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_description(a4, v24, v25);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v104, v106, v107, CFSTR("Argument count mismatch for method %@ in class %@"), v7, v105);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = CFSTR("method");
    v126 = v120;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v109, v110, &v126, &v125, 1);
    goto LABEL_34;
  }
  if ((_DWORD)v17)
  {
    for (i = 0; i != v17; ++i)
    {
      v27 = method_copyArgumentType(ClassMethod, (int)i + 2);
      objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v28, v29, v27, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v31, v32, v30);

      free(v27);
      objc_msgSend_parameters(v120, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v36, v37, v38, i);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = objc_msgSend_type(v39, v40, v41);
      if (v42 != v33)
      {
        v45 = v33 == 4 && v42 == 3;
        if (!v45
          && (v33 != 3 || v42 != 4)
          && (v33 != 5 || v42 != 7)
          && (v33 != 16 || (unint64_t)objc_msgSend_type(v39, v43, v44) <= 0xF))
        {
          v82 = (void *)MEMORY[0x24BDBCE88];
          v83 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_typeNameForType_(TMLTypeRegistry, v43, v44, v33);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(v39, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_propertyName(v39, v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_methodName(v120, v91, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v83, v94, v95, CFSTR("Runtime type mismatch %@ vs %@ for argument %@ in method %@"), v84, v87, v90, v93);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v123[0] = CFSTR("property");
          v123[1] = CFSTR("method");
          v124[0] = v39;
          v124[1] = v120;
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v97, v98, v124, v123, 2);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_exceptionWithName_reason_userInfo_(v82, v100, v101, CFSTR("TMLRuntimeException"), v96, v99);
          v102 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v102);
        }
      }

    }
  }
  v46 = method_copyReturnType(ClassMethod);
  objc_msgSend_stringWithCString_encoding_(MEMORY[0x24BDD17C8], v47, v48, v46, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_typeForEncodedType_(TMLTypeRegistry, v50, v51, v49);

  free(v46);
  v55 = objc_msgSend_returnType(v120, v53, v54);
  if (v55 != v52
    && (v52 != 4 || v55 != 3)
    && (v52 != 3 || v55 != 4)
    && (v52 != 5 || v55 != 7)
    && (v52 != 16 || (unint64_t)objc_msgSend_returnType(v120, v56, v57) <= 0xF))
  {
    v58 = (void *)MEMORY[0x24BDBCE88];
    v59 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_typeNameForType_(TMLTypeRegistry, v56, v57, v52);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend_returnType(v120, v61, v62);
    objc_msgSend_typeNameForType_(TMLTypeRegistry, v64, v65, v63);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_methodName(v120, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v59, v70, v71, CFSTR("Runtime type mismatch %@ vs %@ for return type in method %@"), v60, v66, v69);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = CFSTR("method");
    v122 = v120;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v73, v74, &v122, &v121, 1);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v58, v76, v77, CFSTR("TMLRuntimeException"), v72, v75);
    v78 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v78);
  }
LABEL_30:

}

+ (id)signal:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const char *v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  const char *v14;
  double v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  double v23;
  void *v24;
  void *v25;
  const char *v26;
  double v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  double v31;
  void *v32;
  BOOL v33;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v6 = a3;
  v7 = a4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_22AD50200;
  v43 = sub_22AD50210;
  v44 = 0;
  objc_getAssociatedObject(v7, "ppmsc");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = sub_22AD52768;
    v35[3] = &unk_24F501670;
    v38 = &v39;
    v36 = v6;
    v37 = v7;
    objc_msgSend_enumerateObjectsUsingBlock_(v8, v9, v10, v35);
    v11 = (void *)v40[5];
    if (v11)
    {
      v12 = v11;

      v13 = v36;
      goto LABEL_17;
    }

  }
  objc_getAssociatedObject(v7, "sc");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v13, v14, v15, v6);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v40[5];
  v40[5] = v16;

  v20 = (void *)v40[5];
  if (!v20)
  {
    objc_msgSend_classForObject_(a1, v18, v19, v7);
    v21 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v21;
    if (v40[5] || !v21)
    {
      v32 = (void *)v21;
    }
    else
    {
      do
      {
        objc_msgSend_signals(v24, v22, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v25, v26, v27, v6);
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v40[5];
        v40[5] = v28;

        objc_msgSend_superClass(v24, v30, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40[5])
          v33 = 1;
        else
          v33 = v32 == 0;
        v24 = v32;
      }
      while (!v33);
    }

    v20 = (void *)v40[5];
  }
  v12 = v20;
LABEL_17:

  _Block_object_dispose(&v39, 8);
  return v12;
}

+ (id)classForObject:(id)a3
{
  unint64_t v3;
  void *v4;
  void *Superclass;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  id v9;

  v3 = (unint64_t)a3;
  objc_getAssociatedObject((id)v3, "ccppmsc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    Superclass = (void *)objc_opt_class();
    objc_getAssociatedObject(Superclass, "ccppmsc");
    v6 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v6;
    v7 = v6 == 0;
    if (Superclass && !v6)
    {
      do
      {
        Superclass = class_getSuperclass((Class)Superclass);
        objc_getAssociatedObject(Superclass, "ccppmsc");
        v8 = objc_claimAutoreleasedReturnValue();
        v4 = (void *)v8;
        v7 = v8 == 0;
      }
      while (Superclass && !v8);
    }
    if ((v3 & 0x8000000000000000) == 0 && !v7)
      objc_setAssociatedObject((id)v3, "ccppmsc", v4, (void *)1);
  }
  v9 = v4;

  return v9;
}

+ (id)childClassForName:(id)a3 inClass:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  void *v16;
  id v17;
  void *v18;
  const char *v19;
  double v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *, _BYTE *);
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  v7 = a4;
  v9 = v7;
  if (v7)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = sub_22AD50200;
    v32 = sub_22AD50210;
    v33 = 0;
    objc_msgSend_childClasses(v7, v8, COERCE_DOUBLE(0x3032000000));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = sub_22AD52A74;
    v25 = &unk_24F501698;
    v11 = v6;
    v26 = v11;
    v27 = &v28;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v10, v12, v13, &v22);

    v16 = (void *)v29[5];
    if (v16)
    {
      v17 = v16;
    }
    else
    {
      objc_msgSend_superClass(v9, v14, v15, v22, v23, v24, v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_childClassForName_inClass_(a1, v19, v20, v11, v18);
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)classForName:(id)a3
{
  double v3;

  return (id)objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51BE8, a2, v3, a3);
}

+ (id)protocolForName:(id)a3
{
  double v3;

  return (id)objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51BF0, a2, v3, a3);
}

+ (id)property:(id)a3 forClass:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend_properties(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v9, v10, v11, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  while (!v12 && v6)
  {
    v15 = v6;
    objc_msgSend_superClass(v6, v13, v14);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend_properties(v6, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v18, v19, v20, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)propertyWithKeyPath:(id)a3 inClass:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  double v9;
  unint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  const char *v21;
  void *v22;
  double v23;
  uint64_t v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  double v32;
  void *v33;
  const char *v34;
  double v35;
  void *v36;
  void *v37;
  const char *v38;
  double v39;
  void *v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  void *v46;
  const char *v47;
  double v48;
  id v49;
  void *v51;
  void *v52;
  void *v53;
  const char *v54;
  double v55;
  void *v56;
  const char *v57;
  double v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  const char *v63;
  double v64;
  void *v65;
  const char *v66;
  double v67;
  id v68;

  v6 = a3;
  v8 = a4;
  if (qword_255B51C50 != -1)
    dispatch_once(&qword_255B51C50, &unk_24F5016B8);
  v10 = 0x24BDD1000uLL;
  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_objcClassName(v8, v7, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend_objcClassName(v8, v12, v14);
  else
    objc_msgSend_className(v8, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v11, v16, v17, CFSTR("%@:%@"), v15, v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objectForKeyedSubscript_((void *)qword_255B51C48, v19, v20, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    v24 = objc_msgSend_rangeOfString_(v6, v21, v23, CFSTR("."));
    if (v24 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend_property_forClass_(a1, v25, v26, v6, v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
LABEL_9:
        objc_msgSend_setObject_forKeyedSubscript_((void *)qword_255B51C48, v27, v28, v22, v18);
        goto LABEL_17;
      }
    }
    else
    {
      v29 = v24;
      objc_msgSend_substringToIndex_(v6, v25, v26, v24);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_property_forClass_(a1, v31, v32, v30, v8);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v33;
      if (v33)
      {
        objc_msgSend_typeClassName(v33, v34, v35);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_classForName_(a1, v38, v39, v37);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v40)
        {
          v60 = (void *)MEMORY[0x24BDBCE88];
          v61 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_typeClassName(v36, v41, v42);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v61, v63, v64, CFSTR("Attempt to access undeclared class %@"), v62);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_exceptionWithName_reason_userInfo_(v60, v66, v67, CFSTR("TMLRuntimeException"), v65, 0);
          v68 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v68);
        }
        objc_msgSend_substringFromIndex_(v6, v41, v42, v29 + 1);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_propertyWithKeyPath_inClass_(a1, v44, v45, v43, v40);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = 0x24BDD1000;
      }
      else
      {
        v22 = 0;
      }

      if (v22)
        goto LABEL_9;
    }
    v46 = (void *)objc_msgSend_objcClass(v8, v27, v28);
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend_tmlPropertyWithKeyPath_(v46, v47, v48, v6),
          (v22 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v51 = (void *)MEMORY[0x24BDBCE88];
      v52 = *(void **)(v10 + 1992);
      objc_msgSend_className(v8, v47, v48);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v52, v54, v55, CFSTR("Attempt to access undeclared property %@ in class %@"), v6, v53);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v51, v57, v58, CFSTR("TMLRuntimeException"), v56, 0);
      v59 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v59);
    }
  }
LABEL_17:
  v49 = v22;

  return v49;
}

+ (id)propertyWithKeyPath:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  void *v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  id v23;
  uint64_t v24;
  const char *v25;
  double v26;
  void *v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  void *v38;
  void *v39;
  uint64_t v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  uint64_t v46;
  const char *v47;
  double v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const char *v52;
  double v53;
  id v54;
  const __CFString *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend_tmlParent(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_getAssociatedObject(v10, "pmsc");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_getAssociatedObject(v7, "pmsc");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v6;
  v16 = objc_msgSend_rangeOfString_(v12, v13, v14, CFSTR("."));
  v18 = v12;
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend_substringToIndex_(v12, v15, v17, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_objectForKeyedSubscript_(v11, v15, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v19;
  if (v19)
  {
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = v19;
    }
    else
    {
      objc_msgSend_typeClassName(v19, v20, v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_classForName_(a1, v29, v30, v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_substringFromIndex_(v12, v32, v33, v16 + 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_propertyWithKeyPath_inClass_(a1, v35, v36, v34, v31);
      v23 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend_classForObject_(a1, v20, v21, v7);
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v38 = (void *)MEMORY[0x24BDBCE88];
      v39 = (void *)MEMORY[0x24BDD17C8];
      v40 = objc_opt_class();
      objc_msgSend_stringWithFormat_(v39, v41, v42, CFSTR("Attempt to access undeclared class %@"), v40);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = CFSTR("identifier");
      objc_msgSend_tmlIdentifier(v7, v44, v45);
      v46 = objc_claimAutoreleasedReturnValue();
      v49 = (void *)v46;
      v50 = &stru_24F505EA8;
      if (v46)
        v50 = (const __CFString *)v46;
      v56[0] = v50;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v47, v48, v56, &v55, 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_exceptionWithName_reason_userInfo_(v38, v52, v53, CFSTR("TMLRuntimeException"), v43, v51);
      v54 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v54);
    }
    v27 = (void *)v24;
    objc_msgSend_propertyWithKeyPath_inClass_(TMLRuntime, v25, v26, v12, v24);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v23;
}

+ (id)ensurePropertyWithKeyPath:(id)a3 forObject:(id)a4 writable:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  uint64_t v36;
  const char *v37;
  double v38;
  const __CFString *v39;
  void *v40;
  const char *v41;
  double v42;
  id v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  _QWORD v47[2];

  v5 = a5;
  v47[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend_propertyWithKeyPath_forObject_(a1, v10, v11, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v17 = (void *)MEMORY[0x24BDBCE88];
    v18 = (void *)MEMORY[0x24BDD17C8];
    v19 = objc_opt_class();
    objc_msgSend_stringWithFormat_(v18, v20, v21, CFSTR("Attempt to access undeclared property %@ in class %@"), v8, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = CFSTR("identifier");
    objc_msgSend_tmlIdentifier(v9, v23, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v25;
    v29 = &stru_24F505EA8;
    if (v25)
      v29 = (const __CFString *)v25;
    v47[0] = v29;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v26, v27, v47, &v46, 1);
LABEL_11:
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v17, v41, v42, CFSTR("TMLRuntimeException"), v22, v40);
    v43 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v43);
  }
  v15 = v12;
  if (v5 && objc_msgSend_isReadonly(v12, v13, v14))
  {
    v17 = (void *)MEMORY[0x24BDBCE88];
    v30 = (void *)MEMORY[0x24BDD17C8];
    v31 = objc_opt_class();
    objc_msgSend_stringWithFormat_(v30, v32, v33, CFSTR("Attempt to modify read-only property %@ in class %@"), v8, v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = CFSTR("identifier");
    objc_msgSend_tmlIdentifier(v9, v34, v35);
    v36 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v36;
    v39 = &stru_24F505EA8;
    if (v36)
      v39 = (const __CFString *)v36;
    v45 = v39;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v37, v38, &v45, &v44, 1);
    goto LABEL_11;
  }

  return v15;
}

+ (id)ensureClass:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  uint64_t v7;
  const char *v8;
  double v9;
  void *v10;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  id v16;

  v4 = a3;
  objc_msgSend_classForName_(a1, v5, v6, v4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v12 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, v9, CFSTR("Attempt to access undeclared class %@"), v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_exceptionWithName_reason_userInfo_(v12, v14, v15, CFSTR("TMLRuntimeException"), v13, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v16);
  }
  v10 = (void *)v7;

  return v10;
}

@end
