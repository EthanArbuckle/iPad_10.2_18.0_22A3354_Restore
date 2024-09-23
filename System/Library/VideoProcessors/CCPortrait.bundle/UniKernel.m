@implementation UniKernel

- (id)ck
{
  uint64_t v2;

  return (id)objc_msgSend_ck(self->kernel, a2, v2);
}

- (id)mk
{
  uint64_t v2;

  return (id)objc_msgSend_mk(self->kernel, a2, v2);
}

- (id)getContext
{
  return self->context;
}

- (id)getRenderOrder
{
  uint64_t v2;
  UniContext *context;
  void *v5;
  const char *v6;

  context = self->context;
  if (context)
  {
    objc_msgSend_weakArray(context, a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend_weakObjectsPointerArray(MEMORY[0x24BDD1748], a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addPointer_(v5, v6, (uint64_t)self);
  }
  return v5;
}

- (unsigned)kDebugFlagForKernel
{
  uint64_t v2;
  UniKernelInternal *kernel;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;

  kernel = self->kernel;
  if (!kernel)
    goto LABEL_8;
  objc_msgSend_mk(kernel, a2, v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    return v7;
  objc_msgSend_mk(self->kernel, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_label(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
LABEL_8:
    LODWORD(v7) = 0;
    return v7;
  }
  objc_msgSend_mk(self->kernel, v12, v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_label(v7, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = 822149888;
  if ((objc_msgSend_isEqualToString_(v16, v17, (uint64_t)CFSTR("slm_calc")) & 1) == 0
    && (objc_msgSend_isEqualToString_(v16, v18, (uint64_t)CFSTR("slm_calc")) & 1) == 0)
  {
    if ((objc_msgSend_isEqualToString_(v16, v19, (uint64_t)CFSTR("sparserendering_preprocess")) & 1) != 0)
    {
      LODWORD(v7) = 822149892;
    }
    else if ((objc_msgSend_isEqualToString_(v16, v20, (uint64_t)CFSTR("sparserendering_sample_noAlpha")) & 1) != 0
           || (objc_msgSend_isEqualToString_(v16, v21, (uint64_t)CFSTR("sparserendering_sample_withAlpha")) & 1) != 0
           || (objc_msgSend_isEqualToString_(v16, v22, (uint64_t)CFSTR("sparserendering_opt2x_sample_noAlpha")) & 1) != 0)
    {
      LODWORD(v7) = 822149904;
    }
    else
    {
      LODWORD(v7) = 822149904;
      if ((objc_msgSend_isEqualToString_(v16, v23, (uint64_t)CFSTR("sparserendering_opt2x_sample_withAlpha")) & 1) == 0)
      {
        LODWORD(v7) = 822150004;
        if ((objc_msgSend_isEqualToString_(v16, v25, (uint64_t)CFSTR("blurmap_x_smoothing")) & 1) == 0
          && (objc_msgSend_isEqualToString_(v16, v26, (uint64_t)CFSTR("blurmap_y_smoothing")) & 1) == 0)
        {
          LODWORD(v7) = 822149996;
          if ((objc_msgSend_isEqualToString_(v16, v27, (uint64_t)CFSTR("sparserendering_antialias_x")) & 1) == 0
            && (objc_msgSend_isEqualToString_(v16, v28, (uint64_t)CFSTR("sparserendering_antialias_y")) & 1) == 0)
          {
            LODWORD(v7) = 822150012;
            if ((objc_msgSend_isEqualToString_(v16, v29, (uint64_t)CFSTR("sparserendering_prefilter_x")) & 1) == 0
              && (objc_msgSend_isEqualToString_(v16, v30, (uint64_t)CFSTR("sparserendering_prefilter_y")) & 1) == 0)
            {
              if (objc_msgSend_isEqualToString_(v16, v31, (uint64_t)CFSTR("segmentation_fusion_apply")))
                LODWORD(v7) = 822150648;
              else
                LODWORD(v7) = 0;
            }
          }
        }
      }
    }
  }

  return v7;
}

- (id)_findKernelInCache:(id)a3 library:(id)a4 constants:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  _BOOL4 v37;
  const char *v38;
  uint64_t v39;
  UniKernelInternal *v40;
  const char *v41;
  const char *v42;
  NSObject *v43;
  const char *v44;
  id v46;
  const char *v47;
  uint64_t v48;
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (__CFString *)a5;
  sub_24B6E0430();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  if (v8)
  {
    objc_msgSend_library(v8, v11, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_library(v8, v13, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_device(v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend_registryID(v20, v21, v22);
      objc_msgSend_numberWithUnsignedLongLong_(v16, v24, v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v25 = &unk_251C9CCD8;
    }

  }
  else
  {
    v25 = &unk_251C9CCD8;
  }
  v26 = &stru_251C92910;
  if (v9)
    v26 = v9;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v11, (uint64_t)CFSTR("%@:%@:%@"), v25, v7, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v28, (uint64_t)v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v29;
  if (v29)
  {
    objc_msgSend_ck(v29, v30, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_coreImageLibrary(v8, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36 != 0;

    if ((((v33 == 0) ^ v37) & 1) != 0)
      goto LABEL_17;
    objc_msgSend_removeAllObjects(v10, v38, v39);

  }
  v40 = [UniKernelInternal alloc];
  v32 = (void *)objc_msgSend_initWithName_library_constants_(v40, v41, (uint64_t)v7, v8, v9);
  if (v32)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v10, v42, (uint64_t)v32, v27);
  }
  else
  {
    uni_logger_compile();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v44, (uint64_t)CFSTR("Unable to find kernel for %@"), v7);
      v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      v50 = objc_msgSend_UTF8String(v46, v47, v48);
      _os_log_error_impl(&dword_24B6B5000, v43, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);

    }
    v32 = 0;
  }
LABEL_17:

  objc_sync_exit(v10);
  return v32;
}

- (id)_findKernelInCache:(id)a3 metalLibrary:(id)a4 coreImageLibrary:(id)a5 pipelineLibrary:(id)a6 constants:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const char *v28;
  void *v29;
  UniKernelInternal *v30;
  const char *v31;
  const char *v32;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (__CFString *)a7;
  sub_24B6E0430();
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v16);
  if (v12)
  {
    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_device(v12, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_registryID(v20, v21, v22);
    objc_msgSend_numberWithUnsignedLongLong_(v19, v24, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = &unk_251C9CCD8;
  }
  v26 = &stru_251C92910;
  if (v15)
    v26 = v15;
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v17, (uint64_t)CFSTR("%@:%@:%@"), v25, v11, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v16, v28, (uint64_t)v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
    v30 = [UniKernelInternal alloc];
    v29 = (void *)objc_msgSend_initWithName_metalLibrary_coreImageLibrary_pipelineLibrary_constants_(v30, v31, (uint64_t)v11, v12, v13, v14, v15);
    if (!v29)
      __assert_rtn("-[UniKernel _findKernelInCache:metalLibrary:coreImageLibrary:pipelineLibrary:constants:]", "UniKernel.m", 446, "k");
    objc_msgSend_setObject_forKeyedSubscript_(v16, v32, (uint64_t)v29, v27);
  }

  objc_sync_exit(v16);
  return v29;
}

- (UniKernel)initWithName:(id)a3 metalLibrary:(id)a4 coreImageLibrary:(id)a5 pipelineLibrary:(id)a6 constants:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  UniKernel *v17;
  const char *v18;
  UniKernel *v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  UniKernel *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  objc_super v39;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v39.receiver = self;
  v39.super_class = (Class)UniKernel;
  v17 = -[UniKernel init](&v39, sel_init);
  v19 = v17;
  if (!v17)
  {
LABEL_7:
    v24 = v19;
    goto LABEL_8;
  }
  objc_msgSend__findKernelInCache_metalLibrary_coreImageLibrary_pipelineLibrary_constants_(v17, v18, (uint64_t)v12, v13, v14, v15, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKernel_(v19, v21, (uint64_t)v20);

  objc_msgSend_kernel(v19, v22, v23);
  v24 = (UniKernel *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    if (v13)
    {
      objc_msgSend_device(v13, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setDevice_(v19, v28, (uint64_t)v27);

    }
    else
    {
      objc_msgSend_setDevice_(v19, v25, 0);
    }
    objc_msgSend_weakToWeakObjectsMapTable(MEMORY[0x24BDD1650], v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInputs_(v19, v32, (uint64_t)v31);

    objc_msgSend_setScale_(v19, v33, (uint64_t)&unk_251C9CCF0);
    objc_msgSend_setRoiCallback_(v19, v34, (uint64_t)&unk_251C8FAA8);
    objc_msgSend_setRunInfo_(v19, v35, 0);
    objc_msgSend_setContext_(v19, v36, 0);
    objc_msgSend_setPreferredOutputFormat_(v19, v37, (uint64_t)&unk_251C9CD08);
    goto LABEL_7;
  }
LABEL_8:

  return v24;
}

- (UniKernel)initWithName:(id)a3 library:(id)a4 constants:(id)a5
{
  id v8;
  id v9;
  id v10;
  UniKernel *v11;
  const char *v12;
  UniKernel *v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  UniKernel *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  objc_super v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)UniKernel;
  v11 = -[UniKernel init](&v36, sel_init);
  v13 = v11;
  if (!v11)
    goto LABEL_4;
  objc_msgSend__findKernelInCache_library_constants_(v11, v12, (uint64_t)v8, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKernel_(v13, v15, (uint64_t)v14);

  objc_msgSend_kernel(v13, v16, v17);
  v18 = (UniKernel *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend_library(v9, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_device(v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDevice_(v13, v25, (uint64_t)v24);

    objc_msgSend_weakToWeakObjectsMapTable(MEMORY[0x24BDD1650], v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInputs_(v13, v29, (uint64_t)v28);

    objc_msgSend_setScale_(v13, v30, (uint64_t)&unk_251C9CCF0);
    objc_msgSend_setRoiCallback_(v13, v31, (uint64_t)&unk_251C8FAC8);
    objc_msgSend_setRunInfo_(v13, v32, 0);
    objc_msgSend_setContext_(v13, v33, 0);
    objc_msgSend_setPreferredOutputFormat_(v13, v34, (uint64_t)&unk_251C9CD08);
LABEL_4:
    v18 = v13;
  }

  return v18;
}

- (UniKernel)initWithName:(id)a3 library:(id)a4
{
  return (UniKernel *)objc_msgSend_initWithName_library_constants_(self, a2, (uint64_t)a3, a4, 0);
}

- (UniKernel)init
{
  UniKernel *v2;
  const char *v3;
  UniKernel *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UniKernel;
  v2 = -[UniKernel init](&v15, sel_init);
  v4 = v2;
  if (v2)
  {
    objc_msgSend_setKernel_(v2, v3, 0);
    objc_msgSend_weakToWeakObjectsMapTable(MEMORY[0x24BDD1650], v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInputs_(v4, v8, (uint64_t)v7);

    objc_msgSend_setScale_(v4, v9, (uint64_t)&unk_251C9CCF0);
    objc_msgSend_setRoiCallback_(v4, v10, (uint64_t)&unk_251C8FAE8);
    objc_msgSend_setRunInfo_(v4, v11, 0);
    objc_msgSend_setContext_(v4, v12, 0);
    objc_msgSend_setPreferredOutputFormat_(v4, v13, (uint64_t)&unk_251C9CD08);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  if (!v7)
  {
    v16 = 0;
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend_device(self, v8, v9), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    v11 = v7;
    objc_msgSend_device(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend_initWithDevice_(v11, v15, (uint64_t)v14);

    if (!v16)
      goto LABEL_13;
  }
  else
  {
    v19 = v7;
    v16 = (void *)objc_msgSend_init(v19, v20, v21);
    if (!v16)
      goto LABEL_13;
  }
  objc_msgSend_inputs(self, v17, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend_copyWithZone_(v22, v23, (uint64_t)a3);
  objc_msgSend_setInputs_(v16, v25, (uint64_t)v24);

  objc_msgSend_device(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDevice_(v16, v29, (uint64_t)v28);

  objc_msgSend_scale(self, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setScale_(v16, v33, (uint64_t)v32);

  objc_msgSend_roiCallback(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRoiCallback_(v16, v37, (uint64_t)v36);

  objc_msgSend_kernel(self, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setKernel_(v16, v41, (uint64_t)v40);

  objc_msgSend_runInfo(self, v42, v43);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    objc_msgSend_runInfo(self, v44, v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend_copy(v47, v48, v49);
    objc_msgSend_setRunInfo_(v16, v51, (uint64_t)v50);

  }
  else
  {
    objc_msgSend_setRunInfo_(v16, v44, 0);
  }

  objc_msgSend_context(self, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContext_(v16, v55, (uint64_t)v54);

  objc_msgSend_preferredOutputFormat(self, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPreferredOutputFormat_(v16, v59, (uint64_t)v58);

  objc_msgSend_context(v16, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    objc_msgSend_context(v16, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v65);
    objc_msgSend_context(v16, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_weakArray(v68, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addPointer_(v71, v72, (uint64_t)v16);

    objc_sync_exit(v65);
  }
LABEL_13:

  return v16;
}

- (id)_flattenDict:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  void *v29;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v6 = v3;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v40, v45, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v41;
    v31 = *(_QWORD *)v41;
    v32 = v6;
    do
    {
      v12 = 0;
      v33 = v10;
      do
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v12);
        objc_msgSend_objectForKeyedSubscript_(v6, v9, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v35 = v12;
            objc_msgSend_removeObjectForKey_(v5, v15, v13);
            v34 = v14;
            v16 = v14;
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v36, v44, 16);
            if (v18)
            {
              v20 = v18;
              v21 = *(_QWORD *)v37;
              do
              {
                for (i = 0; i != v20; ++i)
                {
                  if (*(_QWORD *)v37 != v21)
                    objc_enumerationMutation(v16);
                  v23 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
                  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v19, (uint64_t)CFSTR("%@_%@"), v13, v23);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v16, v25, v23);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setObject_forKeyedSubscript_(v5, v27, (uint64_t)v26, v24);

                }
                v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v36, v44, 16);
              }
              while (v20);
            }

            v11 = v31;
            v6 = v32;
            v10 = v33;
            v14 = v34;
            v12 = v35;
          }
        }

        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v40, v45, 16);
    }
    while (v10);
  }

  objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v28, (uint64_t)v5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (id)_populateStruct:(id)a3 values:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  size_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  const char *v29;
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
  uint64_t i;
  void *v42;
  const char *v43;
  const char *v44;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  char *v57;
  void *v58;
  id v59;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  const char *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  id v85;
  const char *v86;
  uint64_t v87;
  id v88;
  const char *v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  id obj;
  void *v106;
  uint64_t v107;
  void *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint64_t v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend_bufferDataType(v6, v8, v9) != 1)
    goto LABEL_16;
  v12 = objc_msgSend_bufferDataSize(v6, v10, v11);
  v13 = (void *)v12;
  if (!v12)
  {
    v58 = 0;
    goto LABEL_18;
  }
  v14 = malloc_type_malloc(v12, 0x3E46312CuLL);
  if (!v14)
  {
LABEL_16:
    v58 = 0;
    v13 = 0;
LABEL_18:
    v51 = 0;
    goto LABEL_19;
  }
  v17 = v14;
  v104 = v13;
  objc_msgSend_bufferStructType(v6, v15, v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v20 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend_bufferStructType(v6, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_members(v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_count(v24, v25, v26);
    objc_msgSend_setWithCapacity_(v20, v28, v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v106 = v6;
    objc_msgSend_bufferStructType(v6, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_members(v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v119, v125, 16);
    if (v36)
    {
      v39 = v36;
      v40 = *(_QWORD *)v120;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v120 != v40)
            objc_enumerationMutation(v34);
          objc_msgSend_name(*(void **)(*((_QWORD *)&v119 + 1) + 8 * i), v37, v38);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v13, v43, (uint64_t)v42);

        }
        v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v37, (uint64_t)&v119, v125, 16);
      }
      while (v39);
    }

    objc_msgSend__flattenDict_(self, v44, (uint64_t)v7);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend_allKeys(v45, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v46, v50, (uint64_t)v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_minusSet_(v13, v52, (uint64_t)v51);
    if (objc_msgSend_count(v13, v53, v54))
    {
      uni_logger_compile();
      v57 = (char *)objc_claimAutoreleasedReturnValue();
      v6 = v106;
      if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_ERROR))
        sub_24B6F1C58((uint64_t)v13, v57);

LABEL_50:
      v58 = 0;
    }
    else
    {
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v6 = v106;
      objc_msgSend_bufferStructType(v106, v55, v56);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_members(v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      obj = v64;
      v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v115, v124, 16);
      if (v66)
      {
        v69 = v66;
        v70 = *(_QWORD *)v116;
        v101 = v45;
        v102 = v51;
        v100 = *(_QWORD *)v116;
        while (2)
        {
          v71 = 0;
          v103 = v69;
          do
          {
            if (*(_QWORD *)v116 != v70)
              objc_enumerationMutation(obj);
            v107 = v71;
            v72 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v71);
            objc_msgSend_name(v72, v67, v68);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v45, v74, (uint64_t)v73);
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            v108 = v75;
            if (!v75)
              goto LABEL_49;
            v78 = objc_msgSend_dataType(v72, v76, v77);
            v113 = 0;
            v114 = 0;
            v79 = numComponentsForType(v78, &v114, &v113);
            if (!v114 || !v113)
              goto LABEL_48;
            v80 = v79;
            if (v79 == 1)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_48;
              v83 = objc_msgSend_offset(v72, v81, v82);
              v84 = v75;
              packSingleValue(v75, 0, v83, v114, (uint64_t)v17);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_48;
              v85 = v75;
              if (objc_msgSend_count(v85, v86, v87) != v80)
              {

LABEL_48:
LABEL_49:

                goto LABEL_50;
              }
              v111 = 0u;
              v112 = 0u;
              v109 = 0u;
              v110 = 0u;
              v88 = v85;
              v90 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v89, (uint64_t)&v109, v123, 16);
              if (v90)
              {
                v93 = v90;
                v94 = 0;
                v95 = *(_QWORD *)v110;
                do
                {
                  for (j = 0; j != v93; ++j)
                  {
                    if (*(_QWORD *)v110 != v95)
                      objc_enumerationMutation(v88);
                    v97 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
                    v98 = objc_msgSend_offset(v72, v91, v92);
                    packSingleValue(v97, v94 + j, v98, v114, (uint64_t)v17);
                  }
                  v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v88, v91, (uint64_t)&v109, v123, 16);
                  v94 += j;
                }
                while (v93);

                v6 = v106;
                v45 = v101;
                v51 = v102;
                v70 = v100;
              }
              else
              {

              }
              v69 = v103;
              v84 = v108;
            }

            v71 = v107 + 1;
          }
          while (v107 + 1 != v69);
          v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v67, (uint64_t)&v115, v124, 16);
          if (v69)
            continue;
          break;
        }
      }

      objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v99, (uint64_t)v17, v104);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v58 = 0;
    v51 = 0;
    v45 = v7;
  }
  free(v17);
  v7 = v45;
LABEL_19:
  v59 = v58;

  return v59;
}

+ (id)_mtlTextureForImage:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  const char *v10;
  uint64_t v11;

  v3 = a3;
  if (!v3)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_msgSend_conformsToProtocol_(v3, v4, (uint64_t)&unk_2579B9140))
    {
      v9 = v3;
      v3 = v9;
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v10, v11);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  objc_msgSend_texture(v3, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_class();
  objc_msgSend__mtlTextureForImage_(v7, v8, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)v6;
LABEL_9:

  return v9;
}

- (id)_mtlTextureForImage:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend__mtlTextureForImage_(v4, v5, (uint64_t)v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setNumber:(id)a3 forEncoder:(id)a4 atIndex:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  char *v14;
  const char *v15;
  uint64_t v16;
  int v17;
  char v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  float v25;
  double v26;
  float v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
  float v35;

  v7 = a3;
  v8 = a4;
  if (!v7 || (v9 = v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    sub_24B6F1CEC();
  if (!v9)
    sub_24B6F1D14();
  v10 = objc_retainAutorelease(v7);
  v13 = (const char *)objc_msgSend_objCType(v10, v11, v12);
  if (!v13 || (v14 = (char *)v13, strlen(v13) != 1))
    sub_24B6F1D3C();
  v35 = 0.0;
  v17 = *v14;
  if (v17 <= 80)
  {
    if (v17 <= 72)
    {
      if (v17 == 66)
      {
        v18 = objc_msgSend_BOOLValue(v10, v15, v16);
      }
      else
      {
        if (v17 != 67)
          goto LABEL_41;
        v18 = objc_msgSend_unsignedCharValue(v10, v15, v16);
      }
LABEL_21:
      LOBYTE(v35) = v18;
      objc_msgSend_setBytes_length_atIndex_(v9, v19, (uint64_t)&v35, 1, a5);
      goto LABEL_36;
    }
    if (v17 == 73)
    {
      LODWORD(v25) = objc_msgSend_unsignedIntValue(v10, v15, v16);
LABEL_27:
      v35 = v25;
    }
    else
    {
      if (v17 != 76)
        goto LABEL_41;
      LODWORD(v35) = objc_msgSend_unsignedLongValue(v10, v15, v16);
      if ((unint64_t)objc_msgSend_unsignedLongValue(v10, v20, v21) >> 32)
        sub_24B6F1E3C();
    }
LABEL_35:
    objc_msgSend_setBytes_length_atIndex_(v9, v22, (uint64_t)&v35, 4, a5);
    goto LABEL_36;
  }
  switch(*v14)
  {
    case 'c':
      v18 = objc_msgSend_charValue(v10, v15, v16);
      goto LABEL_21;
    case 'd':
      objc_msgSend_doubleValue(v10, v15, v16);
      v27 = v26;
      goto LABEL_25;
    case 'e':
    case 'g':
    case 'h':
    case 'j':
    case 'k':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'r':
      goto LABEL_41;
    case 'f':
      objc_msgSend_floatValue(v10, v15, v16);
LABEL_25:
      v35 = v27;
      goto LABEL_35;
    case 'i':
      LODWORD(v25) = objc_msgSend_intValue(v10, v15, v16);
      goto LABEL_27;
    case 'l':
      LODWORD(v35) = objc_msgSend_longValue(v10, v15, v16);
      if (objc_msgSend_longValue(v10, v28, v29) >= 0x80000000)
        sub_24B6F1DEC();
      goto LABEL_35;
    case 'q':
      LODWORD(v35) = objc_msgSend_longLongValue(v10, v15, v16);
      if (objc_msgSend_longLongValue(v10, v30, v31) >= 0x80000000)
        sub_24B6F1E14();
      goto LABEL_35;
    case 's':
      v23 = objc_msgSend_shortValue(v10, v15, v16);
      goto LABEL_33;
    default:
      if (v17 == 81)
      {
        LODWORD(v35) = objc_msgSend_unsignedLongLongValue(v10, v15, v16);
        if ((unint64_t)objc_msgSend_unsignedLongLongValue(v10, v32, v33) >> 32)
          sub_24B6F1E64();
        goto LABEL_35;
      }
      if (v17 != 83)
      {
LABEL_41:
        uni_logger_api();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          sub_24B6F1D64(v14, v34);

        __assert_rtn("-[UniKernel _setNumber:forEncoder:atIndex:]", "UniKernel.m", 851, "length > 0");
      }
      v23 = objc_msgSend_unsignedShortValue(v10, v15, v16);
LABEL_33:
      LOWORD(v35) = v23;
      objc_msgSend_setBytes_length_atIndex_(v9, v24, (uint64_t)&v35, 2, a5);
LABEL_36:

      return;
  }
}

- (void)writeDebugTextures:(id)a3 filesWritten:(id)a4
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v11)
  {
    if (v6)
    {
      v7 = (void *)objc_opt_class();
      if (objc_msgSend_shouldWriteDebugTextures(v7, v8, v9))
        objc_msgSend__writeDebugTextures_filesWritten_(self, v10, (uint64_t)v11, v6);
    }
  }

}

+ (BOOL)shouldWriteDebugTextures
{
  return 0;
}

- (id)_regionForTexture:(id)a3 name:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  _QWORD v35[4];
  _QWORD v36[5];

  v36[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v8 = a4;
  if (v5)
  {
    objc_msgSend_buffer(v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_heap(v5, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_height(v5, v13, v14);
    v20 = objc_msgSend_bufferBytesPerRow(v5, v16, v17) * v15;
    if (v9)
    {
      v36[0] = v9;
      v21 = (void *)MEMORY[0x24BDD16E0];
      v22 = objc_msgSend_bufferOffset(v5, v18, v19);
      objc_msgSend_numberWithUnsignedInteger_(v21, v23, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v36[1] = v24;
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v25, v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = v27;
      v28 = v36;
    }
    else
    {
      if (!v12)
      {
        v29 = (void *)MEMORY[0x24BDBD1A8];
        goto LABEL_8;
      }
      v35[0] = v12;
      v30 = (void *)MEMORY[0x24BDD16E0];
      v31 = objc_msgSend_heapOffset(v5, v18, v19);
      objc_msgSend_numberWithUnsignedInteger_(v30, v32, v31);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v24;
      objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v33, v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v27;
      v28 = v35;
    }
    v28[3] = v8;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v26, (uint64_t)v28, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    goto LABEL_9;
  }
  v29 = (void *)MEMORY[0x24BDBD1A8];
LABEL_9:

  return v29;
}

- (id)run:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  id v12;
  UniKernel *v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  NSObject *v52;
  UniKernel *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  int isEqualToString;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  NSMapTable *inputs;
  void *v64;
  const char *v65;
  NSObject *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  NSObject *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  const char *v80;
  uint64_t v81;
  NSMapTable *v82;
  void *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  _BOOL4 v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  const char *v104;
  id v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  NSMapTable *v109;
  void *v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  int v116;
  const char *v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  const char *v121;
  NSObject *v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  const char *v134;
  NSObject *v135;
  int v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  const char *v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  const char *v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  id v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  const char *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  void *v192;
  const char *v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  NSObject *v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  unint64_t v210;
  const char *v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  unint64_t v216;
  UniRunInfo *v217;
  const char *v218;
  NSObject *v219;
  const char *v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  const char *v224;
  NSObject *v225;
  void *v226;
  void *v227;
  const char *v228;
  id v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  const char *v233;
  uint64_t v234;
  NSObject *v235;
  void *v236;
  uint64_t v237;
  const char *v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  void *v242;
  const char *v243;
  id v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  NSObject *v248;
  void *v250;
  void *v251;
  id v252;
  id v253;
  void *v254;
  void *v255;
  void *v256;
  UniKernel *v257;
  NSObject *v258;
  void *v259;
  NSObject *v260;
  void *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  _QWORD v266[3];
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  char shouldEmulate_sRGBForTexture;
  _QWORD v272[2];
  _BYTE buf[24];
  _BYTE v274[128];
  uint64_t v275;

  v275 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v257 = self;
  objc_msgSend_mk(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v4)
    {
      v12 = v4;
      v13 = v257;
    }
    else
    {
      v13 = v257;
      objc_msgSend_device(v257, v8, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend_newCommandQueue(v15, v16, v17);

    }
    objc_msgSend_commandBuffer(v12, v10, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mk(v13, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_label(v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      v26 = v24;
    }
    else
    {
      v27 = (void *)objc_opt_class();
      objc_msgSend_description(v27, v28, v29);
      v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    v30 = (uint64_t)v26;

    objc_msgSend_setLabel_(v18, v31, v30);
    v255 = v18;
    objc_msgSend_computeCommandEncoder(v18, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v254 = (void *)v30;
    objc_msgSend_setLabel_(v34, v35, v30);
    objc_msgSend_mk(v13, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setComputePipelineState_(v34, v39, (uint64_t)v38);

    shouldEmulate_sRGBForTexture = 0;
    v267 = 0u;
    v268 = 0u;
    v269 = 0u;
    v270 = 0u;
    objc_msgSend_kernel(v13, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arguments(v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v267, v274, 16);
    if (v47)
    {
      v50 = v47;
      v252 = v12;
      v253 = v4;
      v51 = 0;
      v52 = 0;
      v262 = -1;
      v264 = *(_QWORD *)v268;
      v256 = v34;
      v53 = v257;
      v261 = v45;
      while (1)
      {
        v54 = 0;
        do
        {
          if (*(_QWORD *)v268 != v264)
            objc_enumerationMutation(v45);
          v55 = *(void **)(*((_QWORD *)&v267 + 1) + 8 * v54);
          objc_msgSend_name(v55, v48, v49);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v56, v57, (uint64_t)CFSTR("emulate_sRGB"));

          if (isEqualToString)
          {
            v262 = objc_msgSend_index(v55, v59, v60);
            goto LABEL_38;
          }
          if (objc_msgSend_type(v55, v59, v60) == 2)
          {
            inputs = v53->inputs;
            objc_msgSend_name(v55, v61, v62);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(inputs, v65, (uint64_t)v64);
            v66 = objc_claimAutoreleasedReturnValue();

            if (v66)
            {
              objc_msgSend__mtlTextureForImage_(UniKernel, v67, (uint64_t)v66);
              v69 = objc_claimAutoreleasedReturnValue();
              if (v69)
              {
                v70 = v69;
                if (objc_msgSend_access(v55, v67, v68) == 1)
                  sub_24B6F1EB4();
                if (objc_msgSend_access(v55, v71, v72) == 2)
                {
                  v74 = v70;

                  shouldEmulate_sRGBForTexture = objc_msgSend__shouldEmulate_sRGBForTexture_(UniKernel, v75, (uint64_t)v74);
                  v51 = v74;
                  v45 = v261;
                }
                if (objc_msgSend_conformsToProtocol_(v70, v73, (uint64_t)&unk_2579B9140))
                {
                  v78 = objc_msgSend_index(v55, v76, v77);
                  objc_msgSend_setTexture_atIndex_(v34, v79, (uint64_t)v70, v78);
                }
                if (!v52)
                {
                  v70 = v70;
                  v52 = v70;
                }
                goto LABEL_36;
              }
            }
            v98 = objc_msgSend_access(v55, v67, v68);
            uni_logger_render();
            v70 = objc_claimAutoreleasedReturnValue();
            v99 = os_log_type_enabled(v70, OS_LOG_TYPE_INFO);
            if (v98 == 2)
            {
              v219 = v52;
              if (v99)
              {
                v226 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend_name(v55, v100, v101);
                v227 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringWithFormat_(v226, v228, (uint64_t)CFSTR("Output texture for %@ is missing (which may be ok)"), v227);
                v229 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v232 = objc_msgSend_UTF8String(v229, v230, v231);
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = v232;
                _os_log_impl(&dword_24B6B5000, v70, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);

              }
LABEL_95:
              v12 = v252;
              v4 = v253;
              v192 = v255;

              goto LABEL_96;
            }
            if (v99)
            {
              v102 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend_name(v55, v100, v101);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringWithFormat_(v102, v104, (uint64_t)CFSTR("Input texture for %@ is missing (which may be ok)"), v103);
              v105 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v108 = objc_msgSend_UTF8String(v105, v106, v107);
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v108;
              _os_log_impl(&dword_24B6B5000, v70, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);

            }
            v70 = 0;
LABEL_35:
            v45 = v261;
LABEL_36:

            goto LABEL_37;
          }
          if (!objc_msgSend_type(v55, v61, v62))
          {
            v109 = v53->inputs;
            objc_msgSend_name(v55, v80, v81);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v109, v111, (uint64_t)v110);
            v66 = objc_claimAutoreleasedReturnValue();

            if (!v66)
            {
              objc_msgSend_name(v55, v112, v113);
              v114 = (void *)objc_claimAutoreleasedReturnValue();
              v116 = objc_msgSend_isEqualToString_(v114, v115, (uint64_t)CFSTR("kernelScale"));

              if (!v116)
              {
                uni_logger_api();
                v66 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                {
                  v250 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend_name(v55, v160, v161);
                  v251 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_kernel(v53, v162, v163);
                  v259 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_mk(v259, v164, v165);
                  v166 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_label(v166, v167, v168);
                  v169 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_stringWithFormat_(v250, v170, (uint64_t)CFSTR("missing object for input parameter %@ on kernel %@"), v251, v169);
                  v171 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v174 = objc_msgSend_UTF8String(v171, v172, v173);
                  *(_DWORD *)buf = 136446466;
                  *(_QWORD *)&buf[4] = "-[UniKernel run:]";
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = v174;
                  _os_log_error_impl(&dword_24B6B5000, v66, OS_LOG_TYPE_ERROR, "%{public}s %s", buf, 0x16u);

                  v45 = v261;
                }
                goto LABEL_37;
              }
              objc_msgSend_scale(v53, v117, v118);
              v66 = objc_claimAutoreleasedReturnValue();
            }
            if (objc_msgSend_bufferDataType(v55, v112, v113) == 1)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend__populateStruct_values_(v53, v121, (uint64_t)v55, v66);
                v122 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  && !objc_msgSend_conformsToProtocol_(v66, v134, (uint64_t)&unk_2579BADA0))
                {
                  v219 = v52;
                  uni_logger_api();
                  v70 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                    sub_24B6F2038();
                  goto LABEL_95;
                }
                v122 = v66;
              }
              v70 = v122;
              if (!v122)
              {
                v219 = v52;
                uni_logger_api();
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                  sub_24B6F1EDC();
                goto LABEL_95;
              }
              v258 = v52;
              v135 = v51;
              v136 = objc_msgSend_conformsToProtocol_(v122, v123, (uint64_t)&unk_2579BADA0);
              v139 = objc_msgSend_length(v70, v137, v138);
              v142 = objc_msgSend_bufferDataSize(v55, v140, v141);
              if (v136)
              {
                if (v139 != v142)
                  sub_24B6F1FC0();
                v51 = v135;
                v145 = objc_msgSend_index(v55, v143, v144);
                objc_msgSend_setBuffer_offset_atIndex_(v34, v146, (uint64_t)v70, 0, v145);
              }
              else
              {
                if (v139 != v142)
                  sub_24B6F2010();
                if ((unint64_t)objc_msgSend_length(v70, v143, v144) <= 0x1000)
                {
                  v70 = objc_retainAutorelease(v70);
                  v181 = objc_msgSend_bytes(v70, v179, v180);
                  v184 = objc_msgSend_length(v70, v182, v183);
                  v187 = objc_msgSend_index(v55, v185, v186);
                  objc_msgSend_setBytes_length_atIndex_(v34, v188, v181, v184, v187);
                }
                else
                {
                  objc_msgSend_device(v53, v151, v152);
                  v153 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_bufferFromData_device_(UniDeviceCache, v154, (uint64_t)v70, v153);
                  v155 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v155)
                    sub_24B6F1FE8();
                  v158 = objc_msgSend_index(v55, v156, v157);
                  v34 = v256;
                  objc_msgSend_setBuffer_offset_atIndex_(v256, v159, (uint64_t)v155, 0, v158);

                }
                v51 = v135;
              }
              v52 = v258;
            }
            else
            {
              v124 = objc_msgSend_bufferDataType(v55, v119, v120);
              if (!isSupportedType(v124))
              {
                v219 = v52;
                uni_logger_render();
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
                {
                  v235 = v51;
                  v236 = (void *)MEMORY[0x24BDD17C8];
                  v237 = objc_msgSend_bufferDataType(v55, v233, v234);
                  MTLDataTypeAsString(v237, v238);
                  v239 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_name(v55, v240, v241);
                  v242 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_stringWithFormat_(v236, v243, (uint64_t)CFSTR("Unhandled Metal buffer data type %@ for argument: %@"), v239, v242);
                  v244 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v247 = objc_msgSend_UTF8String(v244, v245, v246);
                  *(_DWORD *)buf = 136315138;
                  *(_QWORD *)&buf[4] = v247;
                  _os_log_impl(&dword_24B6B5000, v70, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);

                  v51 = v235;
                }
                goto LABEL_95;
              }
              v70 = v66;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v149 = objc_msgSend_index(v55, v147, v148);
                  objc_msgSend__setNumber_forEncoder_atIndex_(v53, v150, (uint64_t)v70, v34, v149);
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    v219 = v52;
                    uni_logger_api();
                    v248 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v248, OS_LOG_TYPE_ERROR))
                      sub_24B6F1EDC();

                    v66 = v70;
                    goto LABEL_95;
                  }
                  *(_DWORD *)buf = 0;
                  v177 = objc_msgSend_index(v55, v175, v176);
                  objc_msgSend_setBytes_length_atIndex_(v34, v178, (uint64_t)buf, 4, v177);
                }
                goto LABEL_36;
              }
              objc_msgSend_device(v53, v125, v126);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_bufferFromData_device_(UniDeviceCache, v128, (uint64_t)v70, v127);
              v129 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v129)
                sub_24B6F211C();
              v132 = objc_msgSend_index(v55, v130, v131);
              v34 = v256;
              objc_msgSend_setBuffer_offset_atIndex_(v256, v133, (uint64_t)v129, 0, v132);

              v53 = v257;
            }
            goto LABEL_35;
          }
          if (objc_msgSend_type(v55, v80, v81) != 1)
            goto LABEL_38;
          v82 = v53->inputs;
          objc_msgSend_name(v55, v48, v49);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v82, v84, (uint64_t)v83);
          v66 = objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            sub_24B6F216C();
          v87 = objc_msgSend_unsignedIntegerValue(v66, v85, v86);
          v90 = v87 + objc_msgSend_threadgroupMemoryAlignment(v55, v88, v89) - 1;
          v95 = v90 & -objc_msgSend_threadgroupMemoryAlignment(v55, v91, v92);
          if (!v95)
            sub_24B6F2144();
          v96 = objc_msgSend_index(v55, v93, v94);
          objc_msgSend_setThreadgroupMemoryLength_atIndex_(v34, v97, v95, v96);
LABEL_37:

LABEL_38:
          ++v54;
        }
        while (v50 != v54);
        v189 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v267, v274, 16);
        v50 = v189;
        if (!v189)
        {

          if (!v52)
          {
            v12 = v252;
            v4 = v253;
            goto LABEL_80;
          }
          v4 = v253;
          v192 = v255;
          if (v262 != -1)
            objc_msgSend_setBytes_length_atIndex_(v34, v190, (uint64_t)&shouldEmulate_sRGBForTexture, 1);
          objc_msgSend_runInfo(v257, v190, v191);
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v252;
          if (!v195)
          {
            v265 = objc_msgSend_width(v51, v193, v194);
            v260 = v52;
            v198 = objc_msgSend_height(v51, v196, v197);
            objc_msgSend_mk(v257, v199, v200);
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            v263 = objc_msgSend_threadExecutionWidth(v201, v202, v203);
            objc_msgSend_mk(v257, v204, v205);
            v206 = v51;
            v207 = (void *)objc_claimAutoreleasedReturnValue();
            v210 = objc_msgSend_maxTotalThreadsPerThreadgroup(v207, v208, v209);
            objc_msgSend_mk(v257, v211, v212);
            v213 = (void *)objc_claimAutoreleasedReturnValue();
            v216 = v210 / objc_msgSend_threadExecutionWidth(v213, v214, v215);

            v34 = v256;
            v51 = v206;

            v217 = [UniRunInfo alloc];
            *(_QWORD *)buf = v265;
            *(_QWORD *)&buf[8] = v198;
            v52 = v260;
            *(_QWORD *)&buf[16] = 1;
            v266[0] = v263;
            v266[1] = v216;
            v266[2] = 1;
            v195 = (void *)objc_msgSend_initWithGridSize_threadsPerThreadGroup_(v217, v218, (uint64_t)buf, v266);
            if (!v195)
              sub_24B6F1E8C();
          }
          v219 = v52;
          objc_msgSend_dispatchOn_(v195, v193, (uint64_t)v34);
          objc_msgSend_endEncoding(v34, v220, v221);
          objc_msgSend_kDebugFlagForKernel(v257, v222, v223);
          goto LABEL_97;
        }
      }
    }

    v51 = 0;
LABEL_80:
    v192 = v255;
    uni_logger_render();
    v225 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v225, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B6B5000, v225, OS_LOG_TYPE_INFO, "First texture unspecified. Error for now", buf, 2u);
    }

    v219 = 0;
LABEL_96:
    v195 = 0;
LABEL_97:
    v14 = 0;
    if (v192 && v51)
    {
      v272[0] = v192;
      v272[1] = v51;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v224, (uint64_t)v272, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)makeBufferCpuAccessible:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  id v34;

  v3 = a3;
  objc_msgSend_device(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_length(v3, v7, v8);
  v11 = (void *)objc_msgSend_newBufferWithLength_options_(v6, v10, v9, 0);

  objc_msgSend_device(v3, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_newCommandQueue(v14, v15, v16);
  objc_msgSend_commandBuffer(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_blitCommandEncoder(v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_length(v3, v24, v25);
  objc_msgSend_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_(v23, v27, (uint64_t)v3, 0, v11, 0, v26);

  objc_msgSend_endEncoding(v23, v28, v29);
  objc_msgSend_commit(v20, v30, v31);
  objc_msgSend_waitUntilCompleted(v20, v32, v33);
  v34 = v11;

  return v34;
}

- (int)_outputFormatForMetalFormat:(unint64_t)a3
{
  int v4;
  int *v5;
  NSObject *v7;

  v4 = *MEMORY[0x24BDBF888];
  if ((uint64_t)a3 <= 64)
  {
    if ((uint64_t)a3 > 24)
    {
      if (a3 == 25)
      {
        v5 = (int *)MEMORY[0x24BDBF8D0];
        return *v5;
      }
      if (a3 == 30)
      {
        v5 = (int *)MEMORY[0x24BDBF898];
        return *v5;
      }
    }
    else
    {
      if (!a3)
        return v4;
      if (a3 == 10)
      {
        v5 = (int *)MEMORY[0x24BDBF890];
        return *v5;
      }
    }
  }
  else
  {
    if ((uint64_t)a3 > 70)
    {
      if (a3 != 71)
      {
        if (a3 == 115)
        {
          v5 = (int *)MEMORY[0x24BDBF8C0];
          return *v5;
        }
        if (a3 == 125)
        {
          v5 = (int *)MEMORY[0x24BDBF8B8];
          return *v5;
        }
        goto LABEL_22;
      }
LABEL_13:
      v5 = (int *)MEMORY[0x24BDBF8B0];
      return *v5;
    }
    if (a3 == 65)
    {
      v5 = (int *)MEMORY[0x24BDBF8C8];
      return *v5;
    }
    if (a3 == 70)
      goto LABEL_13;
  }
LABEL_22:
  uni_logger_api();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_24B6F2194(a3, v7);

  return v4;
}

- (int)_promoteFormatForCoreImage:(int)a3
{
  int *v3;

  if (*MEMORY[0x24BDBF890] == a3)
  {
    v3 = (int *)MEMORY[0x24BDBF8D0];
    return *v3;
  }
  if (*MEMORY[0x24BDBF898] == a3)
  {
    v3 = (int *)MEMORY[0x24BDBF8C8];
    return *v3;
  }
  if (*MEMORY[0x24BDBF8B0] == a3)
    return *MEMORY[0x24BDBF8C0];
  else
    return a3;
}

+ (BOOL)_shouldEmulate_sRGBForTexture:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;

  v3 = a3;
  objc_msgSend_parentTexture(v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_parentTexture(v3, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_pixelFormat(v9, v10, v11) == 71)
    {
      v14 = 1;
    }
    else
    {
      objc_msgSend_parentTexture(v3, v12, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_pixelFormat(v15, v16, v17) == 31)
      {
        v14 = 1;
      }
      else
      {
        objc_msgSend_parentTexture(v3, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend_pixelFormat(v20, v21, v22) == 11;

      }
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_outputTextureForTexture:(id)a3 force:(BOOL)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  id v20;
  char v22;

  v5 = a3;
  v8 = v5;
  if (a4)
  {
    objc_msgSend_device(v5, v6, v7, 0, 0, 0, 0, 0, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pixelFormat(v8, v10, v11);
    MTLPixelFormatGetInfoForDevice();

    if ((v22 & 8) != 0)
    {
      if ((objc_msgSend_usage(v8, v12, v13) & 0x10) == 0)
        sub_24B6F223C();
      v16 = objc_msgSend_pixelFormat(v8, v14, v15);
      switch(v16)
      {
        case 11:
          v18 = objc_msgSend_newTextureViewWithPixelFormat_(v8, v17, 10);
          break;
        case 71:
          v18 = objc_msgSend_newTextureViewWithPixelFormat_(v8, v17, 70);
          break;
        case 31:
          v18 = objc_msgSend_newTextureViewWithPixelFormat_(v8, v17, 30);
          break;
        default:
          sub_24B6F2264();
      }
      v19 = (void *)v18;

      v8 = v19;
    }
  }
  v20 = v8;

  return v20;
}

- (CGRect)extentForImage:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  v3 = a3;
  v5 = v3;
  if (v3)
  {
    if (objc_msgSend_conformsToProtocol_(v3, v4, (uint64_t)&unk_2579B9140))
    {
      v6 = v5;
      v9 = objc_msgSend_width(v6, v7, v8);
LABEL_13:
      v14 = (double)(unint64_t)v9;
      v15 = (double)(unint64_t)objc_msgSend_height(v6, v10, v11);

      v12 = 0.0;
      v13 = 0.0;
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend_texture(v5, v16, v17);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend_image(v5, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v20;
        if (v20)
        {
          objc_msgSend_extent(v20, v18, v19);
          v12 = v21;
          v13 = v22;
          v14 = v23;
          v15 = v24;

          goto LABEL_14;
        }
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_extent(v5, v18, v19);
        v12 = v25;
        v13 = v26;
        v14 = v27;
        v15 = v28;
        goto LABEL_14;
      }
      v6 = 0;
    }
    v9 = objc_msgSend_width(v6, v18, v19);
    goto LABEL_13;
  }
  v12 = *MEMORY[0x24BDBF070];
  v13 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v14 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v15 = *(double *)(MEMORY[0x24BDBF070] + 24);
LABEL_14:

  v29 = v12;
  v30 = v13;
  v31 = v14;
  v32 = v15;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (unint64_t)_outputFormatForImage:(id)a3
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;

  v3 = a3;
  v5 = v3;
  if (!v3)
    goto LABEL_7;
  if (objc_msgSend_conformsToProtocol_(v3, v4, (uint64_t)&unk_2579B9140))
  {
    v8 = (void *)objc_msgSend_pixelFormat(v5, v6, v7);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend_texture(v5, v9, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend_texture(v5, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend_pixelFormat(v13, v14, v15);

  }
LABEL_8:

  return (unint64_t)v8;
}

- (id)_ciImageForInput:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v4, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_4:
    v8 = v7;
    goto LABEL_5;
  }
  if (objc_msgSend_conformsToProtocol_(v6, v4, (uint64_t)&unk_2579B9140))
  {
    objc_msgSend_imageWithMTLTexture_options_(MEMORY[0x24BDBF660], v10, (uint64_t)v6, MEMORY[0x24BDBD1B8]);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uni_logger_api();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_24B6F228C(v18, v19, v20, v21, v22, v23, v24, v25);

    goto LABEL_18;
  }
  objc_msgSend_image(v6, v11, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_5;
  objc_msgSend__mtlTextureForImage_(UniKernel, v13, (uint64_t)v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_5;
  }
  v16 = v14;
  if (objc_msgSend_conformsToProtocol_(v14, v15, (uint64_t)&unk_2579B9140))
    objc_msgSend_imageWithMTLTexture_options_(MEMORY[0x24BDBF660], v17, (uint64_t)v16, 0);
  else
    objc_msgSend__ciImageForInput_(self, v17, (uint64_t)v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_5:
  return v8;
}

- (id)outputImageOfSize:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  UniRunInfo *v26;
  const char *v27;
  void *v28;

  v4 = a3;
  v7 = v4;
  if (v4)
  {
    objc_msgSend_kernel(v4, v5, v6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_8;
    v11 = (void *)v8;
    objc_msgSend_kernel(v7, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_runInfo(v12, v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend_kernel(v7, v15, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_runInfo(v18, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend_copy(v21, v22, v23);

    }
    else
    {
      v24 = 0;
    }

    if (!v24)
    {
LABEL_8:
      v26 = [UniRunInfo alloc];
      v24 = (void *)objc_msgSend_initWithImage_(v26, v27, (uint64_t)v7);
    }
    objc_msgSend_outputImage_(self, v25, (uint64_t)v24);
  }
  else
  {
    v24 = 0;
    objc_msgSend_outputImage_(self, v5, 0);
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)_intputOrOutputNameArray:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v3 = a3;
  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  if (v3)
    v8 = 0;
  else
    v8 = 2;
  v31 = 0uLL;
  v32 = 0uLL;
  objc_msgSend_kernel(self, v5, v6, (_QWORD)v29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arguments(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v29, v33, 16);
  if (v14)
  {
    v17 = v14;
    v18 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v12);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if (v8 == objc_msgSend_access(v20, v15, v16) && objc_msgSend_type(v20, v15, v16) == 2)
        {
          objc_msgSend_name(v20, v15, v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
            sub_24B6F22C0();

          objc_msgSend_name(v20, v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v7, v25, (uint64_t)v24);

        }
      }
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v29, v33, 16);
    }
    while (v17);
  }

  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v26, (uint64_t)v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)inputNameArray
{
  return (id)MEMORY[0x24BEDD108](self, sel__intputOrOutputNameArray_, 1);
}

- (id)outputNameArray
{
  return (id)MEMORY[0x24BEDD108](self, sel__intputOrOutputNameArray_, 0);
}

- (id)_inputOrOutputArray:(BOOL)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  void *v33;
  NSObject *v34;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if (a3)
    objc_msgSend_inputNameArray(self, a2, a3);
  else
    objc_msgSend_outputNameArray(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  if (v5 && (v9 = objc_msgSend_count(v5, v6, v7)) != 0)
  {
    objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v10, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v36 = v8;
    v12 = v8;
    v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v37, v41, 16);
    if (v14)
    {
      v17 = v14;
      v18 = *(_QWORD *)v38;
      while (2)
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v12);
          v20 = *(const char **)(*((_QWORD *)&v37 + 1) + 8 * v19);
          objc_msgSend_inputs(self, v15, v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            if (objc_msgSend_conformsToProtocol_(v23, v15, (uint64_t)&unk_2579B9140))
            {
              rootTexture(v23);
              v25 = objc_claimAutoreleasedReturnValue();

              v23 = (void *)v25;
            }
            if (a3 || (v26 = objc_opt_class(), v26 == objc_opt_class()))
            {
              objc_msgSend_addObject_(v11, v24, (uint64_t)v23);
            }
            else
            {
              objc_msgSend_inputs(self, v24, v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v28, v29, (uint64_t)v20);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v11, v31, (uint64_t)v30);

            }
          }
          else if (!a3)
          {
            uni_logger_api();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              sub_24B6F22E8(self, v20, v34);

            v33 = (void *)MEMORY[0x24BDBD1A8];
            goto LABEL_27;
          }
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v37, v41, 16);
        if (v17)
          continue;
        break;
      }
    }

    objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v32, (uint64_t)v11);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:
    v8 = v36;

  }
  else
  {
    v33 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v33;
}

- (id)_inputOrOutputBufferArray:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v3 = a3;
  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, a3);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  if (v3)
    v7 = 0;
  else
    v7 = 2;
  v38 = 0uLL;
  v39 = 0uLL;
  objc_msgSend_kernel(self, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arguments(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v36, v40, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v37 != v17)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (v7 == objc_msgSend_access(v19, v14, v15) && !objc_msgSend_type(v19, v14, v15))
        {
          objc_msgSend_inputs(self, v14, v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v19, v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v20, v24, (uint64_t)v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_access(v19, v26, v27) == 2 && v25 == 0)
          {
            uni_logger_api();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              sub_24B6F23D0();

            v32 = (void *)MEMORY[0x24BDBD1A8];
            v30 = v35;
            goto LABEL_24;
          }
          if (v25)
            objc_msgSend_addObject_(v35, v28, (uint64_t)v25);

        }
      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v36, v40, 16);
      if (v16)
        continue;
      break;
    }
  }

  v30 = v35;
  objc_msgSend_arrayWithArray_(MEMORY[0x24BDBCE30], v31, (uint64_t)v35);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:

  return v32;
}

- (id)inputImageArray
{
  return (id)MEMORY[0x24BEDD108](self, sel__inputOrOutputArray_, 1);
}

- (id)outputImageArray
{
  return (id)MEMORY[0x24BEDD108](self, sel__inputOrOutputArray_, 0);
}

- (id)outputBufferArray
{
  return (id)MEMORY[0x24BEDD108](self, sel__inputOrOutputBufferArray_, 0);
}

- (id)inputBufferArray
{
  return (id)MEMORY[0x24BEDD108](self, sel__inputOrOutputBufferArray_, 1);
}

- (CGRect)_findOutputRect
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect result;
  CGRect v59;

  v53 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_kernel(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    sub_24B6F24B4();

  objc_msgSend_kernel(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arguments(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
    sub_24B6F24DC();
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend_kernel(self, v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arguments(v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v48, v52, 16);
  if (v22)
  {
    v25 = v22;
    v26 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v49 != v26)
          objc_enumerationMutation(v20);
        v28 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (objc_msgSend_access(v28, v23, v24) == 2 && objc_msgSend_type(v28, v23, v24) == 2)
        {
          objc_msgSend_inputs(self, v23, v24);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v28, v30, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v29, v33, (uint64_t)v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_extentForImage_(self, v35, (uint64_t)v34);
          v37 = v36;
          v39 = v38;
          v41 = v40;
          v43 = v42;

          v54.origin.x = v37;
          v54.origin.y = v39;
          v54.size.width = v41;
          v54.size.height = v43;
          if (!CGRectIsNull(v54))
          {
            v55.origin.x = x;
            v55.origin.y = y;
            v55.size.width = width;
            v55.size.height = height;
            if (CGRectIsNull(v55))
            {
              height = v43;
              width = v41;
              y = v39;
              x = v37;
            }
            else
            {
              v56.origin.x = x;
              v56.origin.y = y;
              v56.size.width = width;
              v56.size.height = height;
              v59.origin.x = v37;
              v59.origin.y = v39;
              v59.size.width = v41;
              v59.size.height = v43;
              v57 = CGRectUnion(v56, v59);
              x = v57.origin.x;
              y = v57.origin.y;
              width = v57.size.width;
              height = v57.size.height;
            }
          }
        }
      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v48, v52, 16);
    }
    while (v25);
  }

  v44 = x;
  v45 = y;
  v46 = width;
  v47 = height;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

+ (id)generateCIImage:(id)a3
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  const char *v19;
  uint64_t v20;
  char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  const char *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  id v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t j;
  void *v94;
  double height;
  double width;
  double y;
  double x;
  void *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  void *v108;
  const char *v109;
  void *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  const char *v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  const char *v122;
  void *v123;
  const char *v124;
  const char *v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  const char *v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  const char *v148;
  const char *v149;
  uint64_t v150;
  unint64_t k;
  const char *v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  const char *v156;
  void *v157;
  uint64_t v158;
  const char *v159;
  const char *v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  const char *v164;
  uint64_t v165;
  const char *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t m;
  void *v173;
  const char *v174;
  void *v175;
  void *v176;
  const char *v177;
  void *v178;
  const char *v179;
  void *v180;
  const char *v181;
  const char *v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
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
  void *v201;
  const char *v202;
  void *v203;
  const char *v204;
  uint64_t v205;
  void *v206;
  void *v207;
  const char *v208;
  void *v209;
  const char *v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  unsigned int v214;
  const char *v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  const char *v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  id v226;
  const char *v227;
  const char *v228;
  uint64_t v229;
  id v230;
  void *v231;
  void *v232;
  const char *v233;
  id v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  NSObject *v238;
  const char *v239;
  uint64_t v240;
  void *v241;
  _BOOL4 v242;
  const char *v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  double v247;
  double v248;
  double v249;
  double v250;
  const char *v251;
  uint64_t v252;
  void *v253;
  const char *v254;
  uint64_t v255;
  void *v256;
  const char *v257;
  const char *v258;
  uint64_t v259;
  void *v260;
  const char *v261;
  int isEqualToString;
  const char *v263;
  uint64_t v264;
  CGFloat v265;
  CGFloat v266;
  CGFloat v267;
  CGFloat v268;
  _BOOL4 IsEmpty;
  void *v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  const char *v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  const char *v282;
  const char *v283;
  uint64_t v284;
  void *v285;
  void *v286;
  const char *v287;
  const char *v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  int v292;
  const char *v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  const char *v320;
  uint64_t v321;
  const char *v322;
  id v323;
  const char *v324;
  uint64_t v325;
  NSObject *v326;
  const char *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  const char *v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  void *v343;
  const char *v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  uint64_t v348;
  void *v349;
  const char *v350;
  void *v351;
  const char *v352;
  void *v353;
  const char *v354;
  void *v355;
  const char *v356;
  void *v357;
  const char *v358;
  const char *v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  void *v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  id v370;
  const char *v371;
  uint64_t v372;
  const char *v373;
  uint64_t v374;
  uint64_t n;
  void *v376;
  NSString *v377;
  NSString *v378;
  const char *v379;
  objc_class *v380;
  void *v381;
  const char *v382;
  void *v383;
  void *v384;
  objc_class *v385;
  void *v386;
  void *v387;
  const char *v388;
  id v389;
  NSObject *v390;
  const char *v391;
  void *v392;
  void *v393;
  objc_class *v394;
  void *v395;
  const char *v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  CGFloat v400;
  CGFloat v401;
  CGFloat v402;
  CGFloat v403;
  const char *v404;
  uint64_t v405;
  const char *v406;
  uint64_t v407;
  void *v408;
  void *v409;
  const char *v410;
  uint64_t v411;
  double v412;
  double v413;
  double v414;
  double v415;
  NSObject *v416;
  uint64_t v417;
  const char *v418;
  uint64_t v419;
  id v420;
  NSObject *v421;
  const char *v422;
  uint64_t v423;
  const char *v424;
  uint64_t v425;
  uint64_t v426;
  NSObject *v427;
  const char *v428;
  uint64_t v429;
  const char *v430;
  uint64_t v431;
  NSObject *v432;
  const char *v433;
  uint64_t v434;
  id v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  NSObject *v448;
  const char *v449;
  uint64_t v450;
  const char *v451;
  uint64_t v452;
  void *v453;
  const char *v454;
  uint64_t v455;
  const char *v456;
  uint64_t v457;
  void *v458;
  const char *v459;
  uint64_t v460;
  const char *v461;
  uint64_t v462;
  void *v463;
  const char *v464;
  void *v465;
  const char *v466;
  uint64_t v467;
  uint64_t v468;
  void *v470;
  void *v471;
  const char *v472;
  uint64_t v473;
  void *v474;
  const char *v475;
  id v476;
  const char *v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  const char *v481;
  uint64_t v482;
  void *v483;
  uint64_t v484;
  const char *v485;
  void *v486;
  const char *v487;
  id v488;
  const char *v489;
  uint64_t v490;
  uint64_t v491;
  void *v492;
  void *v493;
  const char *v494;
  uint64_t v495;
  void *v496;
  const char *v497;
  id v498;
  const char *v499;
  uint64_t v500;
  uint64_t v501;
  id v502;
  const char *v503;
  uint64_t v504;
  uint64_t v505;
  const char *v506;
  uint64_t v507;
  void *v508;
  void *v509;
  const char *v510;
  uint64_t v511;
  void *v512;
  const char *v513;
  uint64_t v514;
  void *v515;
  const char *v516;
  id v517;
  const char *v518;
  uint64_t v519;
  uint64_t v520;
  void *v521;
  uint64_t v522;
  const char *v523;
  uint64_t v524;
  uint64_t v525;
  const char *v526;
  uint64_t v527;
  void *v528;
  const char *v529;
  id v530;
  const char *v531;
  uint64_t v532;
  uint64_t v533;
  int v534;
  void *v535;
  void *v536;
  unsigned int rect;
  uint64_t recta;
  CGFloat rectb;
  void *v540;
  unsigned __int8 isKindOfClass;
  id v542;
  void *v543;
  uint64_t v544;
  CGFloat v545;
  uint64_t v546;
  uint64_t v547;
  CGFloat v548;
  uint64_t v549;
  uint64_t v550;
  CGFloat v551;
  void *v552;
  void *v553;
  id v554;
  void *v555;
  void *v556;
  id obj;
  void *v558;
  void *v559;
  _QWORD v560[4];
  id v561;
  uint8_t *v562;
  uint64_t *v563;
  __int128 *p_buf;
  uint64_t *v565;
  uint64_t v566;
  uint64_t *v567;
  uint64_t v568;
  uint64_t (*v569)(uint64_t, uint64_t);
  void (*v570)(uint64_t);
  id v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  uint64_t v588;
  uint64_t *v589;
  uint64_t v590;
  uint64_t (*v591)(uint64_t, uint64_t);
  void (*v592)(uint64_t);
  id v593;
  __int128 v594;
  __int128 v595;
  __int128 v596;
  __int128 v597;
  char shouldEmulate_sRGBForTexture;
  __int128 v599;
  __int128 v600;
  __int128 v601;
  __int128 v602;
  uint8_t v603[24];
  uint64_t (*v604)(uint64_t, uint64_t);
  void (*v605)(uint64_t);
  id v606;
  _BYTE v607[128];
  _QWORD v608[3];
  uint64_t v609;
  void *v610;
  _BYTE v611[128];
  _BYTE v612[5];
  uint8_t v613[128];
  __int128 buf;
  uint64_t v615;
  uint64_t (*v616)(uint64_t, uint64_t);
  void (*v617)(uint64_t);
  id v618;
  _BYTE v619[128];
  _BYTE v620[128];
  uint64_t v621;
  CGRect v622;
  CGRect v623;
  CGRect v624;
  CGRect v625;
  CGRect v626;
  CGRect v627;
  CGRect v628;
  CGRect v629;
  CGRect v630;
  CGRect v631;
  CGRect v632;

  v621 = *MEMORY[0x24BDAC8D0];
  v554 = a3;
  objc_msgSend_runInfo(v554, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend_runInfo(v554, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_outputExtent(v8, v9, v10);
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

  }
  else
  {
    v12 = *MEMORY[0x24BDBF070];
    v14 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v16 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v18 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }

  objc_msgSend_preferredOutputFormat(v554, v19, v20);
  v21 = (char *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend_preferredOutputFormat(v554, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (char *)objc_msgSend_unsignedIntegerValue(v24, v25, v26);

  }
  v27 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend_kernel(v554, v22, v23);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arguments(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_count(v31, v32, v33);
  objc_msgSend_setWithCapacity_(v27, v35, v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v601 = 0u;
  v602 = 0u;
  v599 = 0u;
  v600 = 0u;
  objc_msgSend_kernel(v554, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arguments(v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v599, v620, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v600;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v600 != v47)
          objc_enumerationMutation(v42);
        objc_msgSend_name(*(void **)(*((_QWORD *)&v599 + 1) + 8 * i), v44, v45);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v36, v50, (uint64_t)v49);

      }
      v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v44, (uint64_t)&v599, v620, 16);
    }
    while (v46);
  }

  objc_msgSend_set(MEMORY[0x24BDBCEF0], v51, v52);
  v553 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputs(v554, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyEnumerator(v55, v56, v57);
  v552 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_nextObject(v552, v58, v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    do
    {
      objc_msgSend_addObject_(v553, v60, (uint64_t)v61);
      objc_msgSend_nextObject(v552, v62, v63);
      v64 = objc_claimAutoreleasedReturnValue();

      v61 = (void *)v64;
    }
    while (v64);
  }
  objc_msgSend_addObject_(v553, v60, (uint64_t)CFSTR("emulate_sRGB"));
  objc_msgSend_addObject_(v553, v65, (uint64_t)CFSTR("kernelScale"));
  objc_msgSend_minusSet_(v36, v66, (uint64_t)v553);
  if (objc_msgSend_count(v36, v67, v68))
  {
    uni_logger_render();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      v74 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_mk(v554, v72, v73);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_label(v75, v76, v77);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v74, v79, (uint64_t)CFSTR("For kernel %@, missing kernel arguments = %@"), v78, v36);
      v80 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v83 = objc_msgSend_UTF8String(v80, v81, v82);
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v83;
      _os_log_impl(&dword_24B6B5000, v71, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);

    }
  }
  shouldEmulate_sRGBForTexture = 0;
  v594 = 0u;
  v595 = 0u;
  v596 = 0u;
  v597 = 0u;
  objc_msgSend_kernel(v554, v69, v70);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arguments(v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v88, (uint64_t)&v594, v619, 16);
  if (v91)
  {
    v92 = *(_QWORD *)v595;
    while (2)
    {
      for (j = 0; j != v91; ++j)
      {
        if (*(_QWORD *)v595 != v92)
          objc_enumerationMutation(v87);
        v94 = *(void **)(*((_QWORD *)&v594 + 1) + 8 * j);
        if (objc_msgSend_access(v94, v89, v90) == 2)
        {
          objc_msgSend_inputs(v554, v89, v90);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_name(v94, v100, v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v99, v103, (uint64_t)v102);
          v104 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_type(v94, v105, v106) == 2)
          {
            if (!v104)
              sub_24B6F2668();
            objc_msgSend__mtlTextureForImage_(UniKernel, v107, (uint64_t)v104);
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            v110 = v108;
            if (v108 && objc_msgSend_conformsToProtocol_(v108, v109, (uint64_t)&unk_2579B9140))
              shouldEmulate_sRGBForTexture = objc_msgSend__shouldEmulate_sRGBForTexture_(UniKernel, v109, (uint64_t)v110);
            objc_msgSend_extentForImage_(v554, v109, (uint64_t)v104);
            x = v111;
            y = v112;
            width = v113;
            height = v114;
            v622.origin.x = v12;
            v622.origin.y = v14;
            v622.size.width = v16;
            v622.size.height = v18;
            if (!CGRectIsNull(v622))
            {
              v623.origin.x = v12;
              v623.origin.y = v14;
              v623.size.width = v16;
              v623.size.height = v18;
              v631.origin.x = x;
              v631.origin.y = y;
              v631.size.width = width;
              v631.size.height = height;
              v624 = CGRectUnion(v623, v631);
              x = v624.origin.x;
              y = v624.origin.y;
              width = v624.size.width;
              height = v624.size.height;
            }
            if (!v21)
              v21 = (char *)objc_msgSend__outputFormatForImage_(v554, v115, (uint64_t)v104);

          }
          else
          {
            height = v18;
            width = v16;
            y = v14;
            x = v12;
          }

          goto LABEL_40;
        }
      }
      v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v87, v89, (uint64_t)&v594, v619, 16);
      if (v91)
        continue;
      break;
    }
  }
  height = v18;
  width = v16;
  y = v14;
  x = v12;
LABEL_40:

  rect = objc_msgSend__outputFormatForMetalFormat_(v554, v116, (uint64_t)v21);
  v534 = *MEMORY[0x24BDBF888];
  if (*MEMORY[0x24BDBF888] != rect)
  {
    if ((unint64_t)(v21 - 11) <= 0x3C && ((1 << (v21 - 11)) & 0x1000000000100001) != 0)
      shouldEmulate_sRGBForTexture = 1;
    else
      rect = objc_msgSend__promoteFormatForCoreImage_(v554, v117, rect);
  }
  objc_msgSend_inputs(v554, v117, v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v540 = (void *)objc_msgSend_copy(v119, v120, v121);

  shouldEmulate_sRGBForTexture = 0;
  objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v122, (uint64_t)&shouldEmulate_sRGBForTexture, 1);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v540, v124, (uint64_t)v123, CFSTR("emulate_sRGB"));

  v127 = (void *)objc_msgSend_copy(v540, v125, v126);
  objc_msgSend_setInputs_(v554, v128, (uint64_t)v127);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v615 = 0x3032000000;
  v616 = sub_24B6E5914;
  v617 = sub_24B6E5924;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v129, v130);
  v618 = (id)objc_claimAutoreleasedReturnValue();
  v588 = 0;
  v589 = &v588;
  v590 = 0x3032000000;
  v591 = sub_24B6E5914;
  v592 = sub_24B6E5924;
  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v131, v132);
  v593 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ck(v554, v133, v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_parameters(v135, v136, v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();

  v139 = (void *)MEMORY[0x24BDBCEB8];
  v142 = objc_msgSend_count(v138, v140, v141);
  objc_msgSend_arrayWithCapacity_(v139, v143, v142);
  v556 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = (void *)MEMORY[0x24BDBCEB8];
  v147 = objc_msgSend_count(v138, v145, v146);
  objc_msgSend_arrayWithCapacity_(v144, v148, v147);
  v555 = (void *)objc_claimAutoreleasedReturnValue();
  for (k = 0; k < objc_msgSend_count(v138, v149, v150); ++k)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v152, v153);
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v556, v155, (uint64_t)v154);

    objc_msgSend_setObject_atIndexedSubscript_(v555, v156, (uint64_t)&unk_251C9CCD8, k);
  }
  v157 = (void *)MEMORY[0x24BDBCED8];
  v158 = objc_msgSend_count(v138, v152, v153);
  objc_msgSend_dictionaryWithCapacity_(v157, v159, v158);
  v559 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_alphanumericCharacterSet(MEMORY[0x24BDD1690], v160, v161);
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addCharactersInString_(v162, v163, (uint64_t)CFSTR("_"));
  v536 = v162;
  objc_msgSend_invertedSet(v162, v164, v165);
  v558 = (void *)objc_claimAutoreleasedReturnValue();
  v586 = 0u;
  v587 = 0u;
  v584 = 0u;
  v585 = 0u;
  obj = v138;
  v168 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v166, (uint64_t)&v584, v613, 16);
  if (v168)
  {
    v169 = 0;
    v170 = *(_QWORD *)v585;
    v171 = *MEMORY[0x24BDBF6E8];
    do
    {
      for (m = 0; m != v168; ++m)
      {
        if (*(_QWORD *)v585 != v170)
          objc_enumerationMutation(obj);
        objc_msgSend_objectForKeyedSubscript_(*(void **)(*((_QWORD *)&v584 + 1) + 8 * m), v167, v171);
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        v175 = v173;
        if (!v173)
          __assert_rtn("+[UniKernel generateCIImage:]", "UniKernel.m", 1872, "str");
        objc_msgSend_componentsSeparatedByCharactersInSet_(v173, v174, (uint64_t)v558);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_componentsJoinedByString_(v176, v177, (uint64_t)&stru_251C92910);
        v178 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v179, v169 + m);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v559, v181, (uint64_t)v180, v178);

      }
      v168 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v167, (uint64_t)&v584, v613, 16);
      v169 += m;
    }
    while (v168);
  }

  objc_msgSend_ck(v554, v182, v183);
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v582 = 0u;
  v583 = 0u;
  v580 = 0u;
  v581 = 0u;
  objc_msgSend_kernel(v554, v185, v186);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arguments(v187, v188, v189);
  v542 = (id)objc_claimAutoreleasedReturnValue();

  v191 = objc_msgSend_countByEnumeratingWithState_objects_count_(v542, v190, (uint64_t)&v580, v612, 16);
  if (!v191)
  {
LABEL_117:

    v578 = 0u;
    v579 = 0u;
    v576 = 0u;
    v577 = 0u;
    v542 = v555;
    v334 = objc_msgSend_countByEnumeratingWithState_objects_count_(v542, v331, (uint64_t)&v576, v611, 16);
    if (v334)
    {
      v335 = 0;
      v336 = *(_QWORD *)v577;
LABEL_119:
      v337 = 0;
      v338 = v335 + v334;
      while (1)
      {
        if (*(_QWORD *)v577 != v336)
          objc_enumerationMutation(v542);
        if ((objc_msgSend_BOOLValue(*(void **)(*((_QWORD *)&v576 + 1) + 8 * v337), v332, v333) & 1) == 0)
          break;
        if (v334 == ++v337)
        {
          v334 = objc_msgSend_countByEnumeratingWithState_objects_count_(v542, v332, (uint64_t)&v576, v611, 16);
          v335 = v338;
          if (!v334)
            goto LABEL_125;
          goto LABEL_119;
        }
      }
      uni_logger_api();
      v416 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v416, OS_LOG_TYPE_ERROR))
        sub_24B6F2504(v335 + v337, v416, v417);

      objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v418, v419);
      v420 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_191;
    }
LABEL_125:

    v542 = (id)MEMORY[0x24BDBD1B8];
    v340 = rect;
    if (v534 != rect && (int)rect >= 1)
    {
      v609 = *MEMORY[0x24BDBF9C0];
      objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v339, rect);
      v341 = (void *)objc_claimAutoreleasedReturnValue();
      v610 = v341;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v342, (uint64_t)&v610, &v609, 1);
      v542 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend_runInfo(v554, v339, v340);
    v343 = (void *)objc_claimAutoreleasedReturnValue();
    v346 = v343;
    v535 = v343;
    if (v343)
    {
      objc_msgSend_outputExtent(v343, v344, v345);
      if (CGRectIsNull(v628))
      {
        memset(v603, 0, sizeof(v603));
        objc_msgSend_getThreadsPerThreadgroup(v346, v344, v345);
        if (*(_QWORD *)v603 && *(_QWORD *)&v603[8] && *(_QWORD *)&v603[16])
        {
          objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v347, (uint64_t)v542);
          v349 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v350, *(uint64_t *)v603);
          v351 = (void *)objc_claimAutoreleasedReturnValue();
          v608[0] = v351;
          objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v352, *(uint64_t *)&v603[8]);
          v353 = (void *)objc_claimAutoreleasedReturnValue();
          v608[1] = v353;
          objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v354, *(uint64_t *)&v603[16]);
          v355 = (void *)objc_claimAutoreleasedReturnValue();
          v608[2] = v355;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v356, (uint64_t)v608, 3);
          v357 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v349, v358, (uint64_t)v357, CFSTR("kCIKernelThreadsPerThreadgroup"));

          objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCE70], v359, (uint64_t)v349);
          v360 = objc_claimAutoreleasedReturnValue();

          v542 = (id)v360;
          v346 = v535;
        }
        v566 = 0;
        v567 = 0;
        v568 = 0;
        objc_msgSend_getThreadgroupsPerGrid(v346, v347, v348);
      }
    }
    if (v556 && objc_msgSend_count(v556, v344, v345))
    {
      objc_msgSend_ck(v554, v344, v345);
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_parameters(v361, v362, v363);
      v364 = (void *)objc_claimAutoreleasedReturnValue();

      v367 = objc_msgSend_count(v364, v365, v366);
      if (v367 == objc_msgSend_count(v556, v368, v369))
      {
        v574 = 0u;
        v575 = 0u;
        v573 = 0u;
        v572 = 0u;
        v370 = v364;
        v372 = objc_msgSend_countByEnumeratingWithState_objects_count_(v370, v371, (uint64_t)&v572, v607, 16);
        if (!v372)
          goto LABEL_160;
        v550 = 0;
        v544 = *MEMORY[0x24BDBF6A0];
        v547 = *(_QWORD *)v573;
        recta = *MEMORY[0x24BDBF6E8];
        while (1)
        {
          v374 = v372;
          for (n = 0; n != v374; ++n)
          {
            if (*(_QWORD *)v573 != v547)
              objc_enumerationMutation(v370);
            v376 = *(void **)(*((_QWORD *)&v572 + 1) + 8 * n);
            objc_msgSend_objectForKeyedSubscript_(v376, v373, v544);
            v377 = (NSString *)objc_claimAutoreleasedReturnValue();
            v378 = v377;
            if (v377)
            {
              v380 = NSClassFromString(v377);
              if (v380)
              {
                objc_msgSend_objectAtIndexedSubscript_(v556, v379, v550);
                v381 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_class *)objc_opt_class() == v380)
                {
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      v392 = (void *)MEMORY[0x24BDD17C8];
                      objc_msgSend_objectForKeyedSubscript_(v376, v391, recta);
                      v393 = (void *)objc_claimAutoreleasedReturnValue();
                      v394 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v394);
                      v395 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_stringWithFormat_(v392, v396, (uint64_t)CFSTR("object named %@ is of incorrect class (%@); expecting an image or sampler."),
                        v393,
                        v395);
                      v389 = (id)objc_claimAutoreleasedReturnValue();

                      uni_logger_compile();
                      v390 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v390, OS_LOG_TYPE_ERROR))
                        goto LABEL_155;
                      goto LABEL_156;
                    }
                  }
                }
                else if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if ((isKindOfClass & 1) == 0
                    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                    || v380 != (objc_class *)objc_opt_class())
                  {
                    v383 = (void *)MEMORY[0x24BDD17C8];
                    objc_msgSend_objectForKeyedSubscript_(v376, v382, recta);
                    v384 = (void *)objc_claimAutoreleasedReturnValue();
                    v385 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v385);
                    v386 = (void *)objc_claimAutoreleasedReturnValue();
                    NSStringFromClass(v380);
                    v387 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_stringWithFormat_(v383, v388, (uint64_t)CFSTR("object named %@ is of incorrect class (%@); expecting %@"),
                      v384,
                      v386,
                      v387);
                    v389 = (id)objc_claimAutoreleasedReturnValue();

                    uni_logger_compile();
                    v390 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v390, OS_LOG_TYPE_ERROR))
                    {
LABEL_155:
                      v389 = objc_retainAutorelease(v389);
                      v399 = objc_msgSend_UTF8String(v389, v397, v398);
                      *(_DWORD *)v603 = 136446466;
                      *(_QWORD *)&v603[4] = "+[UniKernel generateCIImage:]";
                      *(_WORD *)&v603[12] = 2080;
                      *(_QWORD *)&v603[14] = v399;
                      _os_log_error_impl(&dword_24B6B5000, v390, OS_LOG_TYPE_ERROR, "%{public}s %s", v603, 0x16u);
                    }
LABEL_156:

                  }
                }

                ++v550;
              }
            }

          }
          v372 = objc_msgSend_countByEnumeratingWithState_objects_count_(v370, v373, (uint64_t)&v572, v607, 16);
          if (!v372)
          {
LABEL_160:

            goto LABEL_161;
          }
        }
      }
      uni_logger_api();
      v448 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v448, OS_LOG_TYPE_ERROR))
      {
        v521 = (void *)MEMORY[0x24BDD17C8];
        v522 = objc_msgSend_count(v364, v449, v450);
        v525 = objc_msgSend_count(v556, v523, v524);
        objc_msgSend_ck(v554, v526, v527);
        v528 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(v521, v529, (uint64_t)CFSTR("Unexpected # of argumetns for kernel (wanted %lu, got %ld). Returning empty image for kernel %@"), v522, v525, v528);
        v530 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v533 = objc_msgSend_UTF8String(v530, v531, v532);
        *(_DWORD *)v603 = 136315138;
        *(_QWORD *)&v603[4] = v533;
        _os_log_error_impl(&dword_24B6B5000, v448, OS_LOG_TYPE_ERROR, "%s", v603, 0xCu);

      }
      objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v451, v452);
      v420 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_161:
      objc_msgSend__findOutputRect(v554, v344, v345);
      v400 = v629.origin.x;
      v401 = v629.origin.y;
      v402 = v629.size.width;
      v403 = v629.size.height;
      if (!CGRectIsNull(v629))
      {
        objc_msgSend_runInfo(v554, v404, v405);
        v408 = (void *)objc_claimAutoreleasedReturnValue();
        if (v408)
        {
          objc_msgSend_runInfo(v554, v406, v407);
          v409 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_outputExtent(v409, v410, v411);
          v548 = v413;
          v551 = v412;
          v545 = v414;
          rectb = v415;

        }
        else
        {
          v548 = *(double *)(MEMORY[0x24BDBF070] + 8);
          v551 = *MEMORY[0x24BDBF070];
          v545 = *(double *)(MEMORY[0x24BDBF070] + 16);
          rectb = *(double *)(MEMORY[0x24BDBF070] + 24);
        }

        v630.origin.y = v548;
        v630.origin.x = v551;
        v630.size.width = v545;
        v630.size.height = rectb;
        if (CGRectIsNull(v630))
        {
          height = v403;
          width = v402;
          y = v401;
          x = v400;
        }
      }
      *(_QWORD *)v603 = 0;
      *(_QWORD *)&v603[8] = v603;
      *(_QWORD *)&v603[16] = 0x3032000000;
      v604 = sub_24B6E5914;
      v605 = sub_24B6E5924;
      objc_msgSend_kernel(v554, v404, v405);
      v453 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_constants(v453, v454, v455);
      v606 = (id)objc_claimAutoreleasedReturnValue();

      v566 = 0;
      v567 = &v566;
      v568 = 0x3032000000;
      v569 = sub_24B6E5914;
      v570 = sub_24B6E5924;
      objc_msgSend_scale(v554, v456, v457);
      v458 = (void *)objc_claimAutoreleasedReturnValue();
      v571 = (id)objc_msgSend_copy(v458, v459, v460);

      objc_msgSend_ck(v554, v461, v462);
      v463 = (void *)objc_claimAutoreleasedReturnValue();
      v560[0] = MEMORY[0x24BDAC760];
      v560[1] = 3221225472;
      v560[2] = sub_24B6E592C;
      v560[3] = &unk_251C8FB10;
      v561 = v554;
      v562 = v603;
      v563 = &v588;
      p_buf = &buf;
      v565 = &v566;
      objc_msgSend_applyWithExtent_roiCallback_arguments_options_(v463, v464, (uint64_t)v560, v556, v542, x, y, width, height);
      v465 = (void *)objc_claimAutoreleasedReturnValue();

      if ((isKindOfClass & 1) == 0)
      {
        objc_msgSend_imageByCroppingToRect_(v465, v466, v467, x, y, width, height);
        v468 = objc_claimAutoreleasedReturnValue();

        v465 = (void *)v468;
      }
      v420 = v465;

      _Block_object_dispose(&v566, 8);
      _Block_object_dispose(v603, 8);

    }
    v211 = v535;
    goto LABEL_190;
  }
  v546 = v191;
  v549 = *(_QWORD *)v581;
LABEL_58:
  v194 = 0;
  while (1)
  {
    if (*(_QWORD *)v581 != v549)
      objc_enumerationMutation(v542);
    v195 = *(void **)(*((_QWORD *)&v580 + 1) + 8 * v194);
    if (objc_msgSend_access(v195, v192, v193) != 2)
      break;
LABEL_108:
    if (v546 == ++v194)
    {
      v330 = objc_msgSend_countByEnumeratingWithState_objects_count_(v542, v192, (uint64_t)&v580, v612, 16);
      v546 = v330;
      if (!v330)
        goto LABEL_117;
      goto LABEL_58;
    }
  }
  if (objc_msgSend_type(v195, v192, v193) != 2)
  {
    objc_msgSend_inputs(v554, v196, v197);
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v195, v199, v200);
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v198, v202, (uint64_t)v201);
    v203 = (void *)objc_claimAutoreleasedReturnValue();

    if (v203)
    {
      v206 = (void *)v589[5];
      objc_msgSend_name(v195, v204, v205);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v206, v208, (uint64_t)v203, v207);

    }
  }
  objc_msgSend_name(v195, v196, v197);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v559, v210, (uint64_t)v209);
  v211 = (void *)objc_claimAutoreleasedReturnValue();

  if (v211)
  {
    v214 = objc_msgSend_unsignedIntValue(v211, v212, v213);
    if (objc_msgSend_count(obj, v215, v216) <= (unint64_t)v214)
    {
      uni_logger_api();
      v427 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v427, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend_name(v195, v428, v429);
        v502 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v505 = objc_msgSend_UTF8String(v502, v503, v504);
        *(_DWORD *)v603 = 136315394;
        *(_QWORD *)&v603[4] = v505;
        *(_WORD *)&v603[12] = 2048;
        *(_QWORD *)&v603[14] = v214;
        _os_log_error_impl(&dword_24B6B5000, v427, OS_LOG_TYPE_ERROR, "Index out of range for argument %s (%ld).", v603, 0x16u);

      }
    }
    else
    {
      if (objc_msgSend_type(v195, v217, v218) == 2)
      {
        objc_msgSend_inputs(v554, v219, v220);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v195, v222, v223);
        v224 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v221, v225, (uint64_t)v224);
        v226 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend__ciImageForInput_(v554, v227, (uint64_t)v226);
        v230 = (id)objc_claimAutoreleasedReturnValue();
        if (!v230)
        {
          v231 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend_name(v195, v228, v229);
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringWithFormat_(v231, v233, (uint64_t)CFSTR("input image for texture named %@ is nil"), v232);
          v234 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v237 = objc_msgSend_UTF8String(v234, v235, v236);

          uni_logger_api();
          v238 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v238, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v603 = 136315138;
            *(_QWORD *)&v603[4] = v237;
            _os_log_error_impl(&dword_24B6B5000, v238, OS_LOG_TYPE_ERROR, "%s", v603, 0xCu);
          }

          objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v239, v240);
          v230 = (id)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend_runInfo(v554, v228, v229);
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        v242 = v241 == 0;

        if (v242)
        {
          v625.origin.x = x;
          v625.origin.y = y;
          v625.size.width = width;
          v625.size.height = height;
          if (CGRectIsNull(v625))
          {
            objc_msgSend_extent(v230, v245, v246);
          }
          else
          {
            objc_msgSend_extent(v230, v245, v246);
            v632.origin.x = v265;
            v632.origin.y = v266;
            v632.size.width = v267;
            v632.size.height = v268;
            v626.origin.x = x;
            v626.origin.y = y;
            v626.size.width = width;
            v626.size.height = height;
            *(CGRect *)&v247 = CGRectUnion(v626, v632);
          }
          x = v247;
          y = v248;
          width = v249;
          height = v250;
        }
        objc_msgSend_extent(v230, v243, v244);
        IsEmpty = CGRectIsEmpty(v627);
        v270 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        v271 = (void *)MEMORY[0x24BDBF690];
        objc_msgSend_extent(v230, v272, v273);
        objc_msgSend_vectorWithCGRect_(v271, v274, v275);
        v276 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v270, v277, (uint64_t)v276);

        v279 = (uint64_t)v230;
        if (((IsEmpty | isKindOfClass) & 1) == 0)
        {
          objc_msgSend_imageByClampingToExtent(v230, v278, (uint64_t)v230);
          v543 = (void *)objc_claimAutoreleasedReturnValue();
          v279 = (uint64_t)v543;
        }
        objc_msgSend_setObject_atIndexedSubscript_(v556, v278, v279, v214);
        if (((IsEmpty | isKindOfClass) & 1) == 0)

        objc_msgSend_setObject_atIndexedSubscript_(v555, v280, (uint64_t)&unk_251C9CCF0, v214);
        v281 = v214 + 1;
        objc_msgSend_setObject_atIndexedSubscript_(v555, v282, (uint64_t)&unk_251C9CCF0, v281);
        v285 = (void *)MEMORY[0x24BDBF690];
        if (IsEmpty)
        {
          objc_msgSend_vectorWithCGRect_(MEMORY[0x24BDBF690], v283, v284, 0.0, 0.0, 0.0, 0.0);
        }
        else
        {
          objc_msgSend_extent(v230, v283, v284);
          objc_msgSend_vectorWithCGRect_(v285, v288, v289);
        }
        v286 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_atIndexedSubscript_(v556, v287, (uint64_t)v286, v281);

        goto LABEL_107;
      }
      if (!objc_msgSend_type(v195, v219, v220) || objc_msgSend_type(v195, v251, v252) == 1)
      {
        objc_msgSend_inputs(v554, v251, v252);
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v195, v254, v255);
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v253, v257, (uint64_t)v256);
        v226 = (id)objc_claimAutoreleasedReturnValue();

        if (!v226)
        {
          objc_msgSend_name(v195, v258, v259);
          v260 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v260, v261, (uint64_t)CFSTR("kernelScale"));

          if (isEqualToString)
          {
            objc_msgSend_scale(v554, v263, v264);
            v226 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend_name(v195, v263, v264);
            v290 = (void *)objc_claimAutoreleasedReturnValue();
            v292 = objc_msgSend_isEqualToString_(v290, v291, (uint64_t)CFSTR("emulate_sRGB"));

            if (!v292)
            {
              v470 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend_name(v195, v293, v294);
              v471 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_ck(v554, v472, v473);
              v474 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringWithFormat_(v470, v475, (uint64_t)CFSTR("Missing parameter for input named %@ for kernel %@; returning empty image."),
                v471,
                v474);
              v476 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v479 = objc_msgSend_UTF8String(v476, v477, v478);

              uni_logger_api();
              v421 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v421, OS_LOG_TYPE_ERROR))
                sub_24B6F25CC(v479, v421, v480);
              goto LABEL_170;
            }
            v603[0] = 0;
            objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v293, (uint64_t)v603, 1);
            v226 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
        if (objc_msgSend_type(v195, v258, v259))
        {
          if (objc_msgSend_type(v195, v295, v296) != 1)
            goto LABEL_175;
          v299 = objc_msgSend_threadgroupMemoryDataSize(v195, v297, v298);
          v302 = objc_msgSend_arrayLength(v195, v300, v301);
          v305 = objc_msgSend_threadgroupMemoryAlignment(v195, v303, v304);
          v308 = objc_msgSend_threadgroupMemoryAlignment(v195, v306, v307);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v311 = objc_msgSend_unsignedIntegerValue(v226, v309, v310);
            v314 = objc_msgSend_threadgroupMemoryAlignment(v195, v312, v313);
            v317 = objc_msgSend_threadgroupMemoryAlignment(v195, v315, v316);
            v318 = v311 + v314 - 1;
            v319 = -v317;
          }
          else
          {
            v318 = v305 + v302 * v299 - 1;
            v319 = -v308;
          }
          v325 = v318 & v319;
          uni_logger_render();
          v326 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v326, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v603 = 136315394;
            *(_QWORD *)&v603[4] = "threadgroup memory size = ";
            *(_WORD *)&v603[12] = 2048;
            *(_QWORD *)&v603[14] = v325;
            _os_log_impl(&dword_24B6B5000, v326, OS_LOG_TYPE_INFO, "%s %ld", v603, 0x16u);
          }

          objc_msgSend_dataWithLength_(MEMORY[0x24BDBCEC8], v327, v325);
          v323 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (objc_msgSend_bufferDataType(v195, v295, v296) != 1)
          {
            v329 = objc_msgSend_bufferDataType(v195, v320, v321);
            if (!isSupportedType(v329))
            {
              uni_logger_api();
              v432 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v432, OS_LOG_TYPE_ERROR))
              {
                v483 = (void *)MEMORY[0x24BDD17C8];
                v484 = objc_msgSend_bufferDataType(v195, v481, v482);
                MTLDataTypeAsString(v484, v485);
                v486 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringWithFormat_(v483, v487, (uint64_t)CFSTR("Don't know how to set type %@"), v486);
                v488 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v491 = objc_msgSend_UTF8String(v488, v489, v490);
                *(_DWORD *)v603 = 136315138;
                *(_QWORD *)&v603[4] = v491;
                _os_log_error_impl(&dword_24B6B5000, v432, OS_LOG_TYPE_ERROR, "%s", v603, 0xCu);

              }
              goto LABEL_177;
            }
            v230 = v226;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                __assert_rtn("+[UniKernel generateCIImage:]", "UniKernel.m", 1985, "[object isKindOfClass:[NSData class]] || [object isKindOfClass:[NSNumber class]]");
            }
            goto LABEL_105;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend__populateStruct_values_(v554, v322, (uint64_t)v195, v226);
            v323 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              uni_logger_api();
              v432 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v432, OS_LOG_TYPE_ERROR))
              {
                v508 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend_name(v195, v506, v507);
                v509 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_kernel(v554, v510, v511);
                v512 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_ck(v512, v513, v514);
                v515 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_stringWithFormat_(v508, v516, (uint64_t)CFSTR("For argument %@ on kernel %@ we expect either NSData or a NSDictionary."), v509, v515);
                v517 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v520 = objc_msgSend_UTF8String(v517, v518, v519);
                *(_DWORD *)v603 = 136315138;
                *(_QWORD *)&v603[4] = v520;
                _os_log_error_impl(&dword_24B6B5000, v432, OS_LOG_TYPE_ERROR, "%s", v603, 0xCu);

              }
              goto LABEL_177;
            }
            v323 = v226;
          }
        }
        v230 = v323;
LABEL_105:
        if (v230)
        {
          objc_msgSend_setObject_atIndexedSubscript_(v556, v324, (uint64_t)v230, v214);
          objc_msgSend_setObject_atIndexedSubscript_(v555, v328, (uint64_t)&unk_251C9CCF0, v214);
LABEL_107:

          goto LABEL_108;
        }
LABEL_175:
        uni_logger_api();
        v432 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v432, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_name(v195, v433, v434);
          v435 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v438 = objc_msgSend_UTF8String(v435, v436, v437);
          sub_24B6F256C(v438, (uint64_t)v603, v432, v435);
        }
LABEL_177:

        objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v439, v440);
        v420 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_190;
      }
      uni_logger_api();
      v427 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v427, OS_LOG_TYPE_ERROR))
        sub_24B6F2634(v427, v441, v442, v443, v444, v445, v446, v447);
    }

    objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v430, v431);
    v426 = objc_claimAutoreleasedReturnValue();
    goto LABEL_174;
  }
  uni_logger_api();
  v421 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v421, OS_LOG_TYPE_ERROR))
  {
    v492 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_name(v195, v422, v423);
    v493 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v559, v494, v495);
    v496 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v492, v497, (uint64_t)CFSTR("Unable to find matching Core Image kernel parameter for name %@.Available names are %@"), v493, v496);
    v498 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v501 = objc_msgSend_UTF8String(v498, v499, v500);
    *(_DWORD *)v603 = 136315138;
    *(_QWORD *)&v603[4] = v501;
    _os_log_error_impl(&dword_24B6B5000, v421, OS_LOG_TYPE_ERROR, "%s", v603, 0xCu);

  }
LABEL_170:

  objc_msgSend_emptyImage(MEMORY[0x24BDBF660], v424, v425);
  v426 = objc_claimAutoreleasedReturnValue();
LABEL_174:
  v420 = (id)v426;
LABEL_190:

LABEL_191:
  _Block_object_dispose(&v588, 8);

  _Block_object_dispose(&buf, 8);
  return v420;
}

- (void)_setRunInfoBasedOnCoreImage
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
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
  double v25;
  double v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  double x;
  double y;
  double width;
  double height;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  unint64_t v46;
  const char *v47;
  uint64_t v48;
  unint64_t v49;
  UniRunInfo *v50;
  const char *v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  id v59;
  _QWORD v60[3];
  _QWORD v61[3];
  CGRect v62;
  CGRect v63;

  objc_msgSend_runInfo(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_2;
  objc_msgSend_kernel(self, v5, v6);
  v59 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ck(v59, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v4 = v59;
LABEL_2:

    return;
  }
  v12 = (void *)v9;
  objc_msgSend_kernel(self, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mk(v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend_kernel(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ck(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_outputGroupSize(v22, v23, v24);
    v26 = v25;
    v28 = v27;

    objc_msgSend__findOutputRect(self, v29, v30);
    x = v62.origin.x;
    y = v62.origin.y;
    width = v62.size.width;
    height = v62.size.height;
    if (!CGRectIsNull(v62))
    {
      v63.origin.x = x;
      v63.origin.y = y;
      v63.size.width = width;
      v63.size.height = height;
      if (!CGRectIsEmpty(v63))
      {
        objc_msgSend_kernel(self, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mk(v37, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = objc_msgSend_threadExecutionWidth(v40, v41, v42);
        v46 = objc_msgSend_maxTotalThreadsPerThreadgroup(v40, v44, v45);
        v49 = v46 / objc_msgSend_threadExecutionWidth(v40, v47, v48);
        v50 = [UniRunInfo alloc];
        v61[0] = (unint64_t)(width / v26);
        v61[1] = (unint64_t)(height / v28);
        v61[2] = 1;
        v60[0] = v43;
        v60[1] = v49;
        v60[2] = 1;
        v52 = (void *)objc_msgSend_initWithGridSize_threadsPerThreadGroup_(v50, v51, (uint64_t)v61, v60);
        objc_msgSend_setRunInfo_(self, v53, (uint64_t)v52);

        objc_msgSend_runInfo(self, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setCoreImageOutputExtent_(v56, v57, v58, x, y, width, height);

      }
    }
  }
}

- (id)outputImage:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  UniImage *v33;
  const char *v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;

  v4 = a3;
  v7 = (void *)objc_msgSend_copy(self, v5, v6);
  if (!v7)
    sub_24B6F2690();
  v10 = v7;
  objc_msgSend__replace_sRGBTexturesIfNeeded(v7, v8, v9);
  objc_msgSend_setRunInfo_(v10, v11, (uint64_t)v4);
  objc_msgSend__setRunInfoBasedOnCoreImage(v10, v12, v13);
  objc_msgSend_outputImageArray(v10, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16
    || (v19 = v16, !objc_msgSend_count(v16, v17, v18))
    || (objc_msgSend_objectAtIndexedSubscript_(v19, v20, 0), (v21 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    sub_24B6F26B8();
  }

  objc_msgSend_ck(v10, v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24
    && (v25 = (void *)v24,
        v26 = (void *)objc_opt_class(),
        objc_msgSend_generateCIImage_(v26, v27, (uint64_t)v10),
        v28 = (void *)objc_claimAutoreleasedReturnValue(),
        v25,
        v28))
  {
    objc_msgSend_imageWithCIImage_(UniImage, v29, (uint64_t)v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setKernel_(v30, v31, (uint64_t)v10);
  }
  else
  {
    v33 = [UniImage alloc];
    v30 = (void *)objc_msgSend_initWithKernel_(v33, v34, (uint64_t)v10);
    v28 = 0;
  }
  if (!v30)
    sub_24B6F26E0();
  objc_msgSend_objectAtIndexedSubscript_(v19, v32, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTexture_(v30, v36, (uint64_t)v35);

  objc_msgSend_texture(v30, v37, v38);
  v39 = objc_claimAutoreleasedReturnValue();
  if (!v39)
    goto LABEL_18;
  v42 = (void *)v39;
  objc_msgSend_texture(v30, v40, v41);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_conformsToProtocol_(v43, v44, (uint64_t)&unk_2579B9140) & 1) == 0)
  {
    objc_msgSend_texture(v30, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {

      goto LABEL_14;
    }
LABEL_18:
    sub_24B6F2708();
  }
LABEL_14:

  return v30;
}

- (void)setValues:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v19, v25, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v4, v7, (uint64_t)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if (objc_msgSend_isEqualToString_(v11, v12, (uint64_t)CFSTR("_renderContext")))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend_setContext_(self, v14, (uint64_t)v13);
              goto LABEL_17;
            }
          }
          if (objc_msgSend_isEqualToString_(v11, v14, (uint64_t)CFSTR("_kernelScale")))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend_setScale_(self, v15, (uint64_t)v13);
              goto LABEL_17;
            }
          }
          objc_msgSend_inputs(self, v15, v16);
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v17, v18, (uint64_t)v13, v11);
        }
        else
        {
          uni_logger_api();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            sub_24B6F2730(v23, v11, &v24, v17);
        }

LABEL_17:
      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v19, v25, 16);
    }
    while (v8);
  }

}

- (id)imageByApplyingParameters:(id)a3 runInfo:(id)a4
{
  id v6;
  const char *v7;
  const char *v8;
  void *v9;

  v6 = a4;
  objc_msgSend_setValues_(self, v7, (uint64_t)a3);
  objc_msgSend_outputImage_(self, v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)imageByApplyingParameters:(id)a3 extent:(id)a4
{
  id v6;
  const char *v7;
  const char *v8;
  void *v9;

  v6 = a4;
  objc_msgSend_setValues_(self, v7, (uint64_t)a3);
  objc_msgSend_outputImageOfSize_(self, v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)imageByApplyingParameters:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_imageByApplyingParameters_extent_, a3);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  const char *v39;
  void *v40;
  const char *v41;
  void *v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  const char *v65;
  void *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  __CFString *v73;
  const char *v74;
  void *v75;
  const char *v76;
  const char *v77;
  void *v79;
  UniKernel *v80;
  NSMapTable *obj;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = objc_opt_class();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p "), v4, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mk(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0x24BDD1000uLL;
  v80 = self;
  if (v9)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend_mk(self, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_label(v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v13, v18, (uint64_t)CFSTR("MTL pipeline = %@"), v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v6, v20, (uint64_t)v19);

    self = v80;
  }
  objc_msgSend_kernel(self, v10, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_constants(v21, v22, v23);
  v24 = objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v25, (uint64_t)CFSTR("\n\t<constants = \n\t%@\n\t>"), v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v6, v27, (uint64_t)v26);

  }
  v79 = (void *)v24;
  objc_msgSend_appendString_(v6, v25, (uint64_t)CFSTR("\n\t<inputs = \n"));
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = self->inputs;
  v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v82, v86, 16);
  if (v29)
  {
    v31 = v29;
    v32 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v83 != v32)
          objc_enumerationMutation(obj);
        v34 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(self->inputs, v30, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringWithFormat_(*(void **)(v12 + 1992), v36, (uint64_t)CFSTR("\t\t%@ = "), v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v6, v38, (uint64_t)v37);

        if (objc_msgSend_conformsToProtocol_(v35, v39, (uint64_t)&unk_2579B9140))
          v40 = v35;
        else
          v40 = 0;
        v42 = v35;
        if (v40)
        {
          if (!v35)
            goto LABEL_28;
LABEL_15:
          if (v42 && objc_msgSend_conformsToProtocol_(v42, v41, (uint64_t)&unk_2579B9140))
          {
            shortTextureDescription(v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_appendString_(v6, v44, (uint64_t)v43);

            self = v80;
            goto LABEL_31;
          }
          goto LABEL_25;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend_kernel(v35, v41, v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_mk(v47, v48, v49);
          v50 = objc_claimAutoreleasedReturnValue();
          if (v50)
          {
            v53 = (void *)v50;
            objc_msgSend_mk(v47, v51, v52);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_label(v54, v55, v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (v57)
            {
              objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v51, (uint64_t)CFSTR("(%@) "), v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_appendString_(v6, v59, (uint64_t)v58);

            }
          }
          objc_msgSend_texture(v35, v51, v52);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          self = v80;
          v12 = 0x24BDD1000;
          if (!v35)
          {
LABEL_28:
            objc_msgSend_appendString_(v6, v41, (uint64_t)CFSTR("nil\n"));
            goto LABEL_31;
          }
          goto LABEL_15;
        }
        v42 = 0;
        if (!v35)
          goto LABEL_28;
LABEL_25:
        objc_msgSend__mtlTextureForImage_(UniKernel, v41, (uint64_t)v35);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v60;
        if (v60 && objc_msgSend_conformsToProtocol_(v60, v61, (uint64_t)&unk_2579B9140))
        {
          shortTextureDescription(v63);
          v64 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend_description(v35, v61, v62);
          v64 = objc_claimAutoreleasedReturnValue();
        }
        v66 = (void *)v64;
        objc_msgSend_appendString_(v6, v65, v64);

        v12 = 0x24BDD1000uLL;
LABEL_31:
        objc_msgSend_appendString_(v6, v45, (uint64_t)CFSTR("\n"));

      }
      v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v82, v86, 16);
    }
    while (v31);
  }

  v67 = *(void **)(v12 + 1992);
  objc_msgSend_runInfo(self, v68, v69);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    objc_msgSend_runInfo(self, v70, v71);
    v73 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v67, v74, (uint64_t)CFSTR("\trunInfo = %@\n"), v73);
  }
  else
  {
    v73 = CFSTR("(Unspecified)");
    objc_msgSend_stringWithFormat_(v67, v70, (uint64_t)CFSTR("\trunInfo = %@\n"), CFSTR("(Unspecified)"));
  }
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_appendString_(v6, v76, (uint64_t)v75);

  if (v72)
  objc_msgSend_appendString_(v6, v77, (uint64_t)CFSTR("\t>\n"));

  return v6;
}

- (NSMapTable)inputs
{
  return (NSMapTable *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInputs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)scale
{
  return self->scale;
}

- (void)setScale:(id)a3
{
  objc_storeStrong((id *)&self->scale, a3);
}

- (UniKernelInternal)kernel
{
  return (UniKernelInternal *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKernel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (UniRunInfo)runInfo
{
  return (UniRunInfo *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRunInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (UniContext)context
{
  return (UniContext *)objc_getProperty(self, a2, 48, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSNumber)preferredOutputFormat
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPreferredOutputFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (id)roiCallback
{
  return self->_roiCallback;
}

- (void)setRoiCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_roiCallback, 0);
  objc_storeStrong((id *)&self->preferredOutputFormat, 0);
  objc_storeStrong((id *)&self->context, 0);
  objc_storeStrong((id *)&self->runInfo, 0);
  objc_storeStrong((id *)&self->device, 0);
  objc_storeStrong((id *)&self->kernel, 0);
  objc_storeStrong((id *)&self->scale, 0);
  objc_storeStrong((id *)&self->inputs, 0);
}

@end
