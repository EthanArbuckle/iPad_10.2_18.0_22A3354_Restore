@implementation SEMSkitReader

+ (void)initialize
{
  sub_2462CE00C();
  if (qword_25441F968 != -1)
    dispatch_once(&qword_25441F968, &unk_25175EFF8);
}

- (SEMSkitReader)initWithSkitDirectoryURL:(id)a3
{
  return (SEMSkitReader *)MEMORY[0x24BEDD108](self, sel_initWithSkitDirectoryURL_lifespan_, a3);
}

- (SEMSkitReader)initWithSkitDirectoryURL:(id)a3 lifespan:(double)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  SEMSkitWrapper *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  SEMProvisionalResourceManager *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  SEMSkitReader *v32;
  NSObject *v33;
  NSObject *v34;
  objc_super v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SEMSkitReader;
  v9 = -[SEMSkitReader init](&v36, sel_init);
  if (!v9)
    goto LABEL_5;
  v10 = objc_msgSend_copy(v6, v7, v8);
  v11 = (void *)*((_QWORD *)v9 + 1);
  *((_QWORD *)v9 + 1) = v10;

  if (!*((_QWORD *)v9 + 1))
  {
    v33 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[SEMSkitReader initWithSkitDirectoryURL:lifespan:]";
      _os_log_error_impl(&dword_2462C4000, v33, OS_LOG_TYPE_ERROR, "%s Cannot create connection with nil directory URL.", buf, 0xCu);
    }
    goto LABEL_11;
  }
  v12 = [SEMSkitWrapper alloc];
  v14 = objc_msgSend_initWithSkitDirectoryURL_(v12, v13, *((_QWORD *)v9 + 1));
  v15 = (void *)*((_QWORD *)v9 + 3);
  *((_QWORD *)v9 + 3) = v14;

  v16 = (void *)MEMORY[0x24BDD17C8];
  v17 = dword_25441F8D0++;
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v18, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v16, v20, (uint64_t)CFSTR("sv-skit-r-%@"), v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [SEMProvisionalResourceManager alloc];
  objc_msgSend__activationBlock(v9, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__deactivationBlock(v9, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_initWithResourceName_lifespan_activationBlock_deactivationBlock_serializeOperations_(v22, v29, (uint64_t)v21, v25, v28, 1, a4);
  v31 = (void *)*((_QWORD *)v9 + 2);
  *((_QWORD *)v9 + 2) = v30;

  if (!*((_QWORD *)v9 + 2))
  {
    v34 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v38 = "-[SEMSkitReader initWithSkitDirectoryURL:lifespan:]";
      v39 = 2112;
      v40 = v21;
      _os_log_error_impl(&dword_2462C4000, v34, OS_LOG_TYPE_ERROR, "%s Failed to initialize resource manager for resource: %@", buf, 0x16u);
    }

LABEL_11:
    v32 = 0;
    goto LABEL_12;
  }

LABEL_5:
  v32 = (SEMSkitReader *)v9;
LABEL_12:

  return v32;
}

- (SEMSkitReader)init
{
  id v2;

  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_deactivate(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)SEMSkitReader;
  -[SEMSkitReader dealloc](&v4, sel_dealloc);
}

- (id)_activationBlock
{
  SEMSkitWrapper *v2;
  SEMSkitWrapper *v3;
  void *v4;
  _QWORD v6[4];
  SEMSkitWrapper *v7;

  v2 = self->_skit;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_2462E350C;
  v6[3] = &unk_25175F048;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x2495571C4](v6);

  return v4;
}

- (id)_deactivationBlock
{
  SEMSkitWrapper *v2;
  SEMSkitWrapper *v3;
  void *v4;
  _QWORD v6[4];
  SEMSkitWrapper *v7;

  v2 = self->_skit;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_2462E36C4;
  v6[3] = &unk_25175F048;
  v7 = v2;
  v3 = v2;
  v4 = (void *)MEMORY[0x2495571C4](v6);

  return v4;
}

- (BOOL)deactivate
{
  SEMProvisionalResourceManager *resourceManager;
  uint64_t v3;
  id v4;
  unint64_t v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  resourceManager = self->_resourceManager;
  v8 = 0;
  v3 = objc_msgSend_deactivateWithError_(resourceManager, a2, (uint64_t)&v8);
  v4 = v8;
  v5 = v3 - 1;
  if ((unint64_t)(v3 - 1) >= 4)
  {
    v6 = qword_25441F970;
    if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[SEMSkitReader deactivate]";
      v11 = 2112;
      v12 = v4;
      _os_log_error_impl(&dword_2462C4000, v6, OS_LOG_TYPE_ERROR, "%s Failed to deactivate. error: %@", buf, 0x16u);
    }
  }

  return v5 < 4;
}

- (id)indexLocale
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  unsigned int v9;
  const char *v10;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;

  objc_msgSend_readInfo(self->_skit, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localeType(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_unsignedShortValue(v6, v7, v8);

  if ((unint64_t)v9 - 45 < 0xFFFFFFFFFFFFFFD4 || v9 == 0)
  {
    v15 = 0;
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBCEA0];
    sub_24630F170(v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localeWithLocaleIdentifier_(v12, v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (void)prewarm
{
  MEMORY[0x24BEDD108](self->_resourceManager, sel_activateAsyncWithCompletion_, &unk_25175F088);
}

- (id)matchSpans:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t *v9;
  const char *v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  SEMSkitWrapper *v15;
  SEMProvisionalResourceManager *resourceManager;
  const char *v17;
  SEMSkitWrapper *v18;
  unint64_t *v19;
  unint64_t v20;
  id v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unint64_t *v27;
  unint64_t v28;
  _QWORD v30[4];
  SEMSkitWrapper *v31;
  uint64_t *v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v6 = a3;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_2462E3D28;
  v41 = sub_2462E3D38;
  v42 = 0;
  v9 = (uint64_t *)objc_msgSend_query(v6, v7, v8);
  v12 = *v9;
  v11 = (std::__shared_weak_count *)v9[1];
  v35 = *v9;
  v36 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  if (v12)
  {
    v15 = self->_skit;
    resourceManager = self->_resourceManager;
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3321888768;
    v30[2] = sub_2462E3D40;
    v30[3] = &unk_25175F0B0;
    v18 = v15;
    v31 = v18;
    v33 = v12;
    v34 = v11;
    if (v11)
    {
      v19 = (unint64_t *)&v11->__shared_owners_;
      do
        v20 = __ldxr(v19);
      while (__stxr(v20 + 1, v19));
    }
    v32 = &v37;
    objc_msgSend_activateWithError_operationBlock_(resourceManager, v17, (uint64_t)a4, v30);
    v21 = (id)v38[5];
    v22 = v34;
    if (v34)
    {
      v23 = (unint64_t *)&v34->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }

    v11 = v36;
    if (!v36)
      goto LABEL_23;
LABEL_19:
    v27 = (unint64_t *)&v11->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    goto LABEL_23;
  }
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v10, 0x251784730, 5, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (a4 && v25)
    *a4 = objc_retainAutorelease(v25);

  v21 = 0;
  if (v11)
    goto LABEL_19;
LABEL_23:
  _Block_object_dispose(&v37, 8);

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skit, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end
