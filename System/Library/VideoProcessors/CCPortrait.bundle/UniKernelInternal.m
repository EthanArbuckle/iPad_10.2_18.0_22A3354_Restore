@implementation UniKernelInternal

- (id)_dictToConstants:(id)a3 functionConstants:(id)a4 name:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  void *v45;
  const char *v46;
  NSObject *v47;
  const char *v48;
  id v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t j;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  BOOL v71;
  const char *v72;
  void *v73;
  NSObject *v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  id v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t k;
  const char *v89;
  const char *v90;
  const char *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  id v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  NSObject *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t m;
  void *v112;
  const char *v113;
  uint64_t v115;
  id v116;
  id v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  id v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  uint64_t v136;
  uint64_t v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _QWORD v146[2];
  _BYTE v147[128];
  _BYTE v148[128];
  uint8_t v149[128];
  uint8_t buf[4];
  uint64_t v151;
  _BYTE v152[128];
  uint64_t v153;

  v153 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v120 = a5;
  if (v7)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDDD5A0]);
    v10 = (void *)MEMORY[0x24BDBCED8];
    v13 = objc_msgSend_count(v7, v11, v12);
    objc_msgSend_dictionaryWithCapacity_(v10, v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_set(MEMORY[0x24BDBCEF0], v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v145 = 0u;
    v116 = v8;
    v19 = v8;
    v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v142, v152, 16);
    v127 = v19;
    if (v21)
    {
      v23 = v21;
      v24 = *(_QWORD *)v143;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v143 != v24)
            objc_enumerationMutation(v19);
          v26 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v19, v22, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_required(v27, v28, v29))
            objc_msgSend_addObject_(v18, v30, v26);

          v19 = v127;
        }
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v127, v22, (uint64_t)&v142, v152, 16);
      }
      while (v23);
    }

    v31 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend_allKeys(v19, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v31, v35, (uint64_t)v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)MEMORY[0x24BDBCF20];
    objc_msgSend_allKeys(v7, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v37, v41, (uint64_t)v40);
    v42 = objc_claimAutoreleasedReturnValue();

    v118 = (void *)v42;
    v119 = v36;
    if ((objc_msgSend_isEqualToSet_(v36, v43, v42) & 1) == 0)
    {
      objc_msgSend_setWithSet_(MEMORY[0x24BDBCEF0], v44, (uint64_t)v36);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_minusSet_(v45, v46, (uint64_t)v118);
      uni_logger_compile();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v48, (uint64_t)CFSTR("Potentially missing keys = %@"), v45);
        v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v52 = objc_msgSend_UTF8String(v49, v50, v51);
        *(_DWORD *)buf = 136315138;
        v151 = v52;
        _os_log_impl(&dword_24B6B5000, v47, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);

      }
    }
    v140 = 0u;
    v141 = 0u;
    v138 = 0u;
    v139 = 0u;
    v117 = v7;
    v53 = v7;
    v55 = v127;
    v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v138, v149, 16);
    if (v126)
    {
      v125 = *(_QWORD *)v139;
      v123 = v53;
      v124 = v18;
      v121 = v15;
      v122 = v9;
      do
      {
        for (j = 0; j != v126; ++j)
        {
          if (*(_QWORD *)v139 != v125)
            objc_enumerationMutation(v53);
          v58 = *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * j);
          objc_msgSend_objectForKeyedSubscript_(v53, v56, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v15, v60, (uint64_t)v59, v58);

          objc_msgSend_objectForKeyedSubscript_(v55, v61, v58);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          if (v62)
          {
            objc_msgSend_objectForKeyedSubscript_(v55, v63, v58);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_msgSend_type(v64, v65, v66);

            v136 = 0;
            v137 = 0;
            v68 = numComponentsForType(v67, &v136, &v137);
            v69 = v68;
            if (v68)
              v70 = v136 == 0;
            else
              v70 = 1;
            v71 = v70 || v137 == 0;
            if (v71 || (v73 = malloc_type_malloc(v137 * v68, 0x974C10E8uLL)) == 0)
            {
              uni_logger_compile();
              v74 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                v92 = (void *)MEMORY[0x24BDD17C8];
                v93 = v137 * v69;
                MTLDataTypeAsString(v67, v75);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                v115 = v93;
                v55 = v127;
                objc_msgSend_stringWithFormat_(v92, v95, (uint64_t)CFSTR("Unable to allocate %lu bytes for %lu elements of type %@ for key %@"), v115, v69, v94, v58);
                v96 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v99 = objc_msgSend_UTF8String(v96, v97, v98);
                *(_DWORD *)buf = 136315138;
                v151 = v99;
                _os_log_error_impl(&dword_24B6B5000, v74, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);

                v53 = v123;
              }

              v73 = 0;
            }
            objc_msgSend_objectForKeyedSubscript_(v53, v72, v58);
            v76 = objc_claimAutoreleasedReturnValue();
            v77 = (void *)v76;
            if (v69 == 1)
            {
              if (!v76 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                sub_24B6F1B24();
              packSingleValue(v77, 0, 0, v136, (uint64_t)v73);
            }
            else
            {
              if (!v76
                || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                || objc_msgSend_count(v77, v80, v81) != v69)
              {
                sub_24B6F1B4C();
              }
              v134 = 0u;
              v135 = 0u;
              v132 = 0u;
              v133 = 0u;
              v82 = v77;
              v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v83, (uint64_t)&v132, v148, 16);
              if (v84)
              {
                v85 = v84;
                v86 = 0;
                v87 = *(_QWORD *)v133;
                do
                {
                  for (k = 0; k != v85; ++k)
                  {
                    if (*(_QWORD *)v133 != v87)
                      objc_enumerationMutation(v82);
                    packSingleValue(*(void **)(*((_QWORD *)&v132 + 1) + 8 * k), v86 + k, 0, v136, (uint64_t)v73);
                  }
                  v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v82, v89, (uint64_t)&v132, v148, 16);
                  v86 += k;
                }
                while (v85);
              }

              v15 = v121;
              v9 = v122;
              v55 = v127;
              v53 = v123;
            }

            objc_msgSend_setConstantValue_type_withName_(v9, v90, (uint64_t)v73, v67, v58);
            free(v73);
            v18 = v124;
            objc_msgSend_removeObject_(v124, v91, v58);
          }
          else
          {
            uni_logger_compile();
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v79, (uint64_t)CFSTR("%@ is not a valid function constant for %@"), v58, v120);
              v100 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v103 = objc_msgSend_UTF8String(v100, v101, v102);
              *(_DWORD *)buf = 136315138;
              v151 = v103;
              _os_log_error_impl(&dword_24B6B5000, v78, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);

            }
          }
        }
        v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v138, v149, 16);
      }
      while (v126);
    }

    v130 = 0u;
    v131 = 0u;
    v128 = 0u;
    v129 = 0u;
    v104 = v18;
    v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v128, v147, 16);
    v108 = v104;
    if (v106)
    {
      v109 = v106;
      v110 = *(_QWORD *)v129;
      while (2)
      {
        for (m = 0; m != v109; ++m)
        {
          if (*(_QWORD *)v129 != v110)
            objc_enumerationMutation(v104);
          if (*(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * m))
          {

            uni_logger_compile();
            v108 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
              sub_24B6F1A90((uint64_t)v120, (const char *)v104);
            goto LABEL_65;
          }
        }
        v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v107, (uint64_t)&v128, v147, 16);
        if (v109)
          continue;
        break;
      }
      v108 = v104;
    }
LABEL_65:

    v146[0] = v9;
    v146[1] = v15;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v113, (uint64_t)v146, 2);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v116;
    v7 = v117;
  }
  else
  {
    v112 = 0;
  }

  return v112;
}

- (UniKernelInternal)initWithName:(id)a3 metalLibrary:(id)a4 coreImageLibrary:(id)a5 pipelineLibrary:(id)a6 constants:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  UniKernelInternal *v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  id v34;
  id *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  id v39;
  id v40;
  void *v41;
  const char *v42;
  id v43;
  void *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  id v53;
  const char *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  char *v60;
  void *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  char *v65;
  char *v67;
  id v68;
  void *v69;
  void *v70;
  NSObject *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  os_activity_scope_state_s state;
  objc_super v79;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v79.receiver = self;
  v79.super_class = (Class)UniKernelInternal;
  v17 = -[UniKernelInternal init](&v79, sel_init);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uni_activity();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = _os_activity_create(&dword_24B6B5000, "compile", v18, OS_ACTIVITY_FLAG_DEFAULT);

  os_activity_scope_enter(v19, &state);
  if (!v17)
    goto LABEL_25;
  v21 = (void *)objc_msgSend_newFunctionWithName_(v13, v20, (uint64_t)v12);
  v24 = v21;
  v71 = v19;
  v72 = v15;
  if (!v16)
  {
    objc_msgSend_setConstants_(v17, v22, 0);
LABEL_9:
    v70 = 0;
    v73 = (void *)MEMORY[0x24BDBD1B8];
    goto LABEL_10;
  }
  objc_msgSend_functionConstantsDictionary(v21, v22, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
    goto LABEL_9;
  objc_msgSend_functionConstantsDictionary(v24, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__dictToConstants_functionConstants_name_(v17, v29, (uint64_t)v16, v28, v12);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setConstants_(v17, v31, (uint64_t)v16);
  if (!v30)
    goto LABEL_9;
  objc_msgSend_objectAtIndexedSubscript_(v30, v26, 0);
  v32 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v30, v33, 1);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v30;
  if (v15 && v32)
  {
    v77 = 0;
    v34 = v15;
    v35 = (id *)&v77;
    v69 = (void *)v32;
    v36 = objc_msgSend_newFunctionWithName_constantValues_pipelineLibrary_error_(v13, v26, (uint64_t)v12, v32, v34, &v77);
    goto LABEL_28;
  }
  if (v32)
  {
    v76 = 0;
    v35 = (id *)&v76;
    v69 = (void *)v32;
    v36 = objc_msgSend_newFunctionWithName_constantValues_error_(v13, v26, (uint64_t)v12, v32, &v76);
LABEL_28:
    v37 = (void *)v36;
    v39 = *v35;

    v15 = v72;
    if (v37)
    {
      if (v39)
      {
        uni_logger_compile();
        v67 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v67, OS_LOG_TYPE_ERROR))
          sub_24B6F1B9C((uint64_t)v39, v67);

      }
      goto LABEL_12;
    }
LABEL_33:
    sub_24B6F1B74();
  }
LABEL_10:
  v37 = (void *)objc_msgSend_newFunctionWithName_(v13, v26, (uint64_t)v12);

  if (!v37)
    goto LABEL_33;
  v69 = 0;
  v39 = 0;
LABEL_12:
  v40 = v16;
  v68 = v13;
  if (v14)
  {
    objc_msgSend_kernelWithFunctionName_constants_(v14, v38, (uint64_t)v12, v73);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCk_(v17, v42, (uint64_t)v41);

  }
  v43 = v14;
  v75 = 0;
  v44 = (void *)objc_opt_new();
  objc_msgSend_setComputeFunction_(v44, v45, (uint64_t)v37);
  objc_msgSend_setLabel_(v44, v46, (uint64_t)v12);
  objc_msgSend_setPipelineLibrary_(v44, v47, (uint64_t)v15);
  objc_msgSend_device(v37, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v39;
  v52 = (void *)objc_msgSend_newComputePipelineStateWithDescriptor_options_reflection_error_(v50, v51, (uint64_t)v44, 3, &v75, &v74);
  v53 = v74;

  objc_msgSend_setMk_(v17, v54, (uint64_t)v52);
  objc_msgSend_mk(v17, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    v14 = v43;
    v16 = v40;
    v19 = v71;
    if (v53)
    {
      uni_logger_compile();
      v60 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v60, OS_LOG_TYPE_ERROR))
        sub_24B6F1B9C((uint64_t)v53, v60);

    }
    objc_msgSend_arguments(v75, v58, v59, v68, v69, v70);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setArguments_(v17, v62, (uint64_t)v61);

    objc_msgSend_arguments(v17, v63, v64);
    v65 = (char *)objc_claimAutoreleasedReturnValue();
    v15 = v72;
    if (!v65)
      sub_24B6F1C30();
  }
  else
  {

    uni_logger_compile();
    v65 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
      sub_24B6F1B9C((uint64_t)v53, v65);
    v17 = 0;
    v14 = v43;
    v16 = v40;
    v19 = v71;
    v15 = v72;
  }

  v13 = v68;
LABEL_25:
  os_activity_scope_leave(&state);

  return v17;
}

- (UniKernelInternal)initWithName:(id)a3 library:(id)a4 constants:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  UniKernelInternal *v21;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend_library(v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_coreImageLibrary(v9, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pipelineLibrary(v9, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (UniKernelInternal *)objc_msgSend_initWithName_metalLibrary_coreImageLibrary_pipelineLibrary_constants_(self, v20, (uint64_t)v10, v13, v16, v19, v8);
  return v21;
}

- (NSArray)arguments
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setArguments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CIKernel)ck
{
  return (CIKernel *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MTLComputePipelineState)mk
{
  return (MTLComputePipelineState *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMk:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)constants
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConstants:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (id)roiCallback
{
  return self->_roiCallback;
}

- (void)setRoiCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_roiCallback, 0);
  objc_storeStrong((id *)&self->constants, 0);
  objc_storeStrong((id *)&self->mk, 0);
  objc_storeStrong((id *)&self->ck, 0);
  objc_storeStrong((id *)&self->arguments, 0);
}

@end
