@implementation UniLibrary

- (UniLibrary)initWithDevice:(id)a3 metalOnly:(BOOL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  UniLibrary *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  void *v23;
  id v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  void *v32;
  const char *v33;
  void *v34;
  id v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  char *v40;
  UniLibrary *v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  id v46;
  id v47;
  objc_super v48;

  v6 = a3;
  v48.receiver = self;
  v48.super_class = (Class)UniLibrary;
  v9 = -[UniLibrary init](&v48, sel_init);
  if (!v9)
  {
LABEL_14:
    v41 = v9;
    goto LABEL_18;
  }
  if (!v6)
  {
    objc_msgSend_metalDevice(MEMORY[0x24BE11A10], v7, v8);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)MEMORY[0x24BDD1488];
  v11 = objc_opt_class();
  objc_msgSend_bundleForClass_(v10, v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend_setCoreImageLibrary_(v9, v16, (uint64_t)v15);

    objc_msgSend_coreImageLibrary(v9, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      sub_24B6F28EC();

  }
  objc_msgSend_pathForResource_ofType_(v14, v13, (uint64_t)CFSTR("default"), CFSTR("metallib"));
  v20 = objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v22 = (void *)v20;
    v47 = 0;
    v23 = (void *)objc_msgSend_newLibraryWithFile_error_(v6, v21, v20, &v47);
    v24 = v47;
    objc_msgSend_setLibrary_(v9, v25, (uint64_t)v23);

    objc_msgSend_resourcePath(v14, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__identifyGPU_(v9, v29, (uint64_t)v6);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v31, (uint64_t)CFSTR("%@/%@"), v28, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v24;
    v34 = (void *)objc_msgSend_newPipelineLibraryWithFilePath_error_(v6, v33, (uint64_t)v32, &v46);
    v35 = v46;

    objc_msgSend_setPipelineLibrary_(v9, v36, (uint64_t)v34);
    objc_msgSend_library(v9, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39 || v35)
    {
      uni_logger_api();
      v40 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR))
        sub_24B6F2830((uint64_t)v35, v40);

    }
    goto LABEL_14;
  }
  uni_logger_compile();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    sub_24B6F279C((uint64_t)v42, v43, v44);

  v41 = 0;
LABEL_18:

  return v41;
}

- (id)_identifyGPU:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  char v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  __CFString *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  char v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  const char *v26;
  char v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;

  v3 = a3;
  objc_msgSend_name(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_containsString_(v6, v7, (uint64_t)CFSTR("Apple")))
  {
    v15 = &stru_251C92910;
LABEL_14:

    goto LABEL_15;
  }
  NSSelectorFromString(CFSTR("architecture"));
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend_architecture(v3, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_name(v6, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v13, v14, (uint64_t)CFSTR("applegpu_"), &stru_251C92910);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_revision(v6, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_containsString_(v18, v19, (uint64_t)CFSTR("A")) & 1) != 0)
    {
      v21 = 0;
    }
    else if (objc_msgSend_containsString_(v15, v20, (uint64_t)CFSTR("g16p")))
    {
      objc_msgSend_revision(v6, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_containsString_(v24, v25, (uint64_t)CFSTR("B0")) ^ 1;

    }
    else
    {
      v21 = 1;
    }

    v27 = objc_msgSend_containsString_(v15, v26, (uint64_t)CFSTR("g17p"));
    if ((v21 & 1) == 0 && (v27 & 1) == 0)
    {
      v30 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_revision(v6, v28, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lowercaseString(v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v30, v35, (uint64_t)CFSTR("%@_%@"), v15, v34);
      v36 = objc_claimAutoreleasedReturnValue();

      v15 = (__CFString *)v36;
    }

    goto LABEL_14;
  }
  v15 = &stru_251C92910;
LABEL_15:

  return v15;
}

- (MTLLibrary)library
{
  return (MTLLibrary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLibrary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (MTLPipelineLibrarySPI)pipelineLibrary
{
  return self->pipelineLibrary;
}

- (void)setPipelineLibrary:(id)a3
{
  objc_storeStrong((id *)&self->pipelineLibrary, a3);
}

- (CoreImageLibrary)coreImageLibrary
{
  return (CoreImageLibrary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCoreImageLibrary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->coreImageLibrary, 0);
  objc_storeStrong((id *)&self->pipelineLibrary, 0);
  objc_storeStrong((id *)&self->library, 0);
}

@end
