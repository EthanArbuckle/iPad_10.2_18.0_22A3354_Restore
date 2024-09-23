@implementation USKScene

+ (id)newSceneWithURL:(id)a3
{
  return (id)MEMORY[0x24BEDD108](a1, sel_newSceneWithURL_error_, a3, 0);
}

+ (id)newSceneWithURL:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  USKScene *v19;
  const char *v20;
  unsigned int *v22;
  void *__p;
  char v24;
  pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *v25;
  _QWORD v26[2];

  v5 = a3;
  sub_2263F8F84();
  if (dword_25583D098)
  {
    sub_2263D5A14();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_226408D4C();

    v7 = 0;
  }
  else
  {
    v26[0] = 0;
    v26[1] = 0;
    sub_2263DB4B4(v26);
    sub_2263DB518();
    v25 = 0;
    objc_msgSend_path(v5, v8, v9, v10);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (char *)objc_msgSend_UTF8String(v11, v12, v13, v14);
    sub_2263AE2A8(&__p, v15);
    pxrInternal__aapl__pxrReserved__::UsdStage::CreateNew();
    if (v24 < 0)
      operator delete(__p);

    sub_2263DB554();
    if (v25)
    {
      v19 = [USKScene alloc];
      v22 = (unsigned int *)v25;
      sub_2263DA854(&v22);
      v7 = (void *)objc_msgSend_initWithUsdStage_fileURL_(v19, v20, (uint64_t)&v22, (uint64_t)v5);
      sub_2263AE450((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&v22);
    }
    else if (a4)
    {
      sub_2263DB590((uint64_t)v26, v16, v17, v18);
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    sub_2263AE450(&v25);
    sub_2263DB4B8((uint64_t)v26);
  }

  return v7;
}

+ (id)newSceneWithData:(id)a3 name:(id)a4
{
  return (id)MEMORY[0x24BEDD108](a1, sel_newSceneWithData_name_error_, a3, a4);
}

+ (id)newSceneWithData:(id)a3 name:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  pxrInternal__aapl__pxrReserved__ *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unsigned int *v33;
  unsigned int v34;
  unsigned int v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *v40;
  void *__p;
  uint64_t v42;
  char v43;
  pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *v44;
  _QWORD v45[2];
  _QWORD v46[3];
  void *v47[2];
  uint64_t v48;

  v7 = a3;
  v8 = a4;
  sub_2263F8F84();
  if (dword_25583D098)
  {
    sub_2263D5A14();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_226408D4C();
  }
  else
  {
    v10 = objc_retainAutorelease(v7);
    v14 = objc_msgSend_bytes(v10, v11, v12, v13);
    v18 = objc_msgSend_length(v10, v15, v16, v17);
    sub_2263AE2A8(v47, "ArMemoryResolver");
    pxrInternal__aapl__pxrReserved__::ArSetPreferredResolver();
    if (SHIBYTE(v48) < 0)
      operator delete(v47[0]);
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v19, (uint64_t)CFSTR("%@?address=%lx&size=%ld"), v20, v8, v14, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = 0;
    v47[1] = 0;
    v48 = 0;
    v9 = objc_retainAutorelease(v21);
    v25 = (char *)objc_msgSend_UTF8String(v9, v22, v23, v24);
    v26 = (pxrInternal__aapl__pxrReserved__ *)sub_2263AE2A8(v47, v25);
    memset(v46, 0, sizeof(v46));
    pxrInternal__aapl__pxrReserved__::ArGetResolver(v26);
    pxrInternal__aapl__pxrReserved__::ArResolver::CreateDefaultContextForAsset();
    v45[0] = 0;
    v45[1] = 0;
    sub_2263DB4B4(v45);
    sub_2263DB518();
    v44 = 0;
    v27 = objc_retainAutorelease(v8);
    v31 = (char *)objc_msgSend_UTF8String(v27, v28, v29, v30);
    sub_2263AE2A8(&__p, v31);
    pxrInternal__aapl__pxrReserved__::SdfLayer::OpenAsAnonymous();
    if (v43 < 0)
      operator delete(__p);
    v40 = 0;
    sub_2263DA8E8((uint64_t *)&__p, (uint64_t *)&v44);
    pxrInternal__aapl__pxrReserved__::UsdStage::Open();
    v32 = v42;
    if (v42)
    {
      v33 = (unsigned int *)(v42 + 8);
      do
      {
        v34 = __ldxr(v33);
        v35 = v34 - 1;
      }
      while (__stlxr(v35, v33));
      if (!v35)
        (*(void (**)(uint64_t))(*(_QWORD *)v32 + 8))(v32);
    }
    sub_2263DB554();
    if (a5)
    {
      sub_2263DB590((uint64_t)v45, v36, v37, v38);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    sub_2263AE450(&v40);
    sub_2263DA8BC(&v44);
    sub_2263DB4B8((uint64_t)v45);
    __p = v46;
    sub_2263DA544((void ***)&__p);
    if (SHIBYTE(v48) < 0)
      operator delete(v47[0]);
  }

  return 0;
}

- (USKScene)init
{
  NSObject *v3;
  USKScene *v4;
  USKScene *v6;
  pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *refBase;
  TfRefBase *v8;
  objc_super v9;

  sub_2263F8F84();
  if (dword_25583D098)
  {
    sub_2263D5A14();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_226408D4C();

    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)USKScene;
  v6 = -[USKScene init](&v9, sel_init);
  if (!v6)
  {
    self = 0;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  pxrInternal__aapl__pxrReserved__::UsdStage::CreateInMemory();
  refBase = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)v6->_usdStage._refBase;
  v6->_usdStage._refBase = v8;
  v8 = 0;
  sub_2263AE47C((_DWORD)v6 + 24, refBase);
  sub_2263AE450((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&v8);
  if (v6->_usdStage._refBase)
  {
    self = v6;
    v4 = self;
  }
  else
  {
    v4 = 0;
    self = v6;
  }
LABEL_6:

  return v4;
}

- (id)initSceneFromURL:(id)a3
{
  return (id)MEMORY[0x24BEDD108](self, sel_initSceneFromURL_error_, a3, 0);
}

- (id)initSceneFromURL:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  USKScene *v9;
  USKScene *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  TfRefBase *refBase;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *__p;
  char v27;
  TfRefBase *v28;
  _QWORD v29[2];
  objc_super v30;

  v7 = a3;
  sub_2263F8F84();
  if (dword_25583D098)
  {
    sub_2263D5A14();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_226408D4C();

    goto LABEL_5;
  }
  v30.receiver = self;
  v30.super_class = (Class)USKScene;
  v11 = -[USKScene init](&v30, sel_init);
  self = v11;
  if (!v11
    || (objc_storeStrong((id *)&v11->_fileURL, a3),
        !objc_msgSend_checkResourceIsReachableAndReturnError_(v7, v12, (uint64_t)a4, v13)))
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v29[0] = 0;
  v29[1] = 0;
  sub_2263DB4B4(v29);
  sub_2263DB518();
  objc_msgSend_path(v7, v14, v15, v16);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = (char *)objc_msgSend_UTF8String(v17, v18, v19, v20);
  sub_2263AE2A8(&__p, v21);
  pxrInternal__aapl__pxrReserved__::UsdStage::Open();
  refBase = self->_usdStage._refBase;
  self->_usdStage._refBase = v28;
  v28 = 0;
  sub_2263AE47C((_DWORD)self + 24, (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)refBase);
  sub_2263AE450((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&v28);
  if (v27 < 0)
    operator delete(__p);

  sub_2263DB554();
  if (self->_usdStage._refBase)
  {
    v9 = self;
  }
  else if (a4)
  {
    sub_2263DB590((uint64_t)v29, v23, v24, v25);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  sub_2263DB4B8((uint64_t)v29);
LABEL_6:

  return v9;
}

- (USKScene)initWithData:(id)a3 name:(id)a4
{
  return (USKScene *)MEMORY[0x24BEDD108](self, sel_initWithData_name_error_, a3, a4);
}

- (USKScene)initWithData:(id)a3 name:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  USKScene *v11;
  USKScene *v12;
  USKScene *v14;
  NSURL *fileURL;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  pxrInternal__aapl__pxrReserved__ *v31;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *refBase;
  uint64_t v38;
  unsigned int *v39;
  unsigned int v40;
  unsigned int v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  TfRefBase *v45;
  void *v46;
  uint64_t v47;
  char v48;
  pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *v49;
  _QWORD v50[2];
  void *__p[2];
  uint64_t v52;
  void *v53[2];
  uint64_t v54;
  objc_super v55;

  v8 = a3;
  v9 = a4;
  sub_2263F8F84();
  if (dword_25583D098)
  {
    sub_2263D5A14();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_226408D4C();
    v11 = 0;
    v12 = self;
  }
  else
  {
    v55.receiver = self;
    v55.super_class = (Class)USKScene;
    v14 = -[USKScene init](&v55, sel_init);
    v12 = v14;
    if (!v14)
    {
      v11 = 0;
      goto LABEL_6;
    }
    fileURL = v14->_fileURL;
    v14->_fileURL = 0;

    v16 = objc_retainAutorelease(v8);
    v20 = objc_msgSend_bytes(v16, v17, v18, v19);
    v24 = objc_msgSend_length(v16, v21, v22, v23);
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v25, (uint64_t)CFSTR("%@?address=%lx&size=%ld"), v26, v9, v20, v24);
    v53[0] = 0;
    v53[1] = 0;
    v54 = 0;
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = (char *)objc_msgSend_UTF8String(v10, v27, v28, v29);
    sub_2263AE2A8(v53, v30);
    sub_2263AE2A8(__p, "ArMemoryResolver");
    v31 = (pxrInternal__aapl__pxrReserved__ *)pxrInternal__aapl__pxrReserved__::ArSetPreferredResolver();
    if (SHIBYTE(v52) < 0)
      operator delete(__p[0]);
    __p[0] = 0;
    __p[1] = 0;
    v52 = 0;
    pxrInternal__aapl__pxrReserved__::ArGetResolver(v31);
    pxrInternal__aapl__pxrReserved__::ArResolver::CreateDefaultContextForAsset();
    v50[0] = 0;
    v50[1] = 0;
    sub_2263DB4B4(v50);
    sub_2263DB518();
    v49 = 0;
    v32 = objc_retainAutorelease(v9);
    v36 = (char *)objc_msgSend_UTF8String(v32, v33, v34, v35);
    sub_2263AE2A8(&v46, v36);
    pxrInternal__aapl__pxrReserved__::SdfLayer::OpenAsAnonymous();
    if (v48 < 0)
      operator delete(v46);
    sub_2263DA8E8((uint64_t *)&v46, (uint64_t *)&v49);
    pxrInternal__aapl__pxrReserved__::UsdStage::Open();
    refBase = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)v12->_usdStage._refBase;
    v12->_usdStage._refBase = v45;
    v45 = 0;
    sub_2263AE47C((_DWORD)v12 + 24, refBase);
    sub_2263AE450((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&v45);
    v38 = v47;
    if (v47)
    {
      v39 = (unsigned int *)(v47 + 8);
      do
      {
        v40 = __ldxr(v39);
        v41 = v40 - 1;
      }
      while (__stlxr(v41, v39));
      if (!v41)
        (*(void (**)(uint64_t))(*(_QWORD *)v38 + 8))(v38);
    }
    sub_2263DB554();
    if (v12->_usdStage._refBase)
    {
      v11 = v12;
    }
    else if (a5)
    {
      sub_2263DB590((uint64_t)v50, v42, v43, v44);
      v11 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    sub_2263DA8BC(&v49);
    sub_2263DB4B8((uint64_t)v50);
    v46 = __p;
    sub_2263DA544((void ***)&v46);
    if (SHIBYTE(v54) < 0)
      operator delete(v53[0]);
  }

LABEL_6:
  return v11;
}

- (USKScene)initWithUsdStage:(TfRefPtr<pxrInternal__aapl__pxrReserved__:(id)a4 :UsdStage>)a3 fileURL:
{
  id v7;
  NSObject *v8;
  USKScene *v9;
  USKScene *v11;
  id *p_isa;
  pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *refBase;
  objc_super v14;

  v7 = a4;
  sub_2263F8F84();
  if (dword_25583D098)
  {
    sub_2263D5A14();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_226408D4C();

    goto LABEL_5;
  }
  v14.receiver = self;
  v14.super_class = (Class)USKScene;
  v11 = -[USKScene init](&v14, sel_init);
  p_isa = (id *)&v11->super.super.isa;
  if (!v11)
  {
    self = 0;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  if (*(_QWORD *)a3._refBase)
  {
    refBase = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)v11->_usdStage._refBase;
    v11->_usdStage._refBase = *(TfRefBase **)a3._refBase;
    sub_2263DA854((unsigned int **)a3._refBase);
    sub_2263AE47C((_DWORD)p_isa + 24, refBase);
    objc_storeStrong(p_isa + 4, a4);
    self = p_isa;
    v9 = self;
  }
  else
  {
    v9 = 0;
    self = v11;
  }
LABEL_6:

  return v9;
}

- (TfRefPtr<pxrInternal__aapl__pxrReserved__::UsdStage>)usdStage
{
  unsigned int **v2;

  *v2 = (unsigned int *)self->_usdStage._refBase;
  return (TfRefPtr<pxrInternal__aapl__pxrReserved__::UsdStage>)sub_2263DA854(v2);
}

- (BOOL)exportToURL:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  _QWORD **v12;
  _QWORD *v13[2];
  void *__p;
  char v15;

  v4 = a3;
  sub_2263ADE48((id *)&self->_usdStage._refBase);
  v5 = objc_retainAutorelease(v4);
  v9 = (char *)objc_msgSend_fileSystemRepresentation(v5, v6, v7, v8);
  sub_2263AE2A8(&__p, v9);
  v13[0] = 0;
  v13[1] = 0;
  v12 = v13;
  v10 = pxrInternal__aapl__pxrReserved__::UsdStage::Export();
  sub_2263DAA5C((uint64_t)&v12, v13[0]);
  if (v15 < 0)
    operator delete(__p);

  return v10;
}

- (void)save
{
  pxrInternal__aapl__pxrReserved__::UsdStage *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(v2);
  v3 = sub_2263D67EC(&v8);
  MEMORY[0x227697E58](v3, 0);
  v4 = v9;
  if (v9)
  {
    v5 = (unsigned int *)(v9 + 8);
    do
    {
      v6 = __ldxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  }
}

- (void)saveAndCreateUSDZPackageWithURL:(id)a3
{
  id v4;
  TfRefPtr<pxrInternal__aapl__pxrReserved__::UsdStage> *p_usdStage;
  pxrInternal__aapl__pxrReserved__::UsdStage *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *refBase;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSURL *fileURL;
  char *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *v31;
  void *v32;
  char v33;
  void *v34[2];
  char v35;
  void *v36;
  uint64_t v37;
  char v38;
  void *v39;
  char v40;

  v4 = a3;
  p_usdStage = &self->_usdStage;
  v6 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(v6);
  v7 = sub_2263D67EC((uint64_t *)&v36);
  MEMORY[0x227697E58](v7, 0);
  v8 = v37;
  if (v37)
  {
    v9 = (unsigned int *)(v37 + 8);
    do
    {
      v10 = __ldxr(v9);
      v11 = v10 - 1;
    }
    while (__stlxr(v11, v9));
    if (!v11)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  }
  refBase = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)p_usdStage->_refBase;
  p_usdStage->_refBase = 0;
  v36 = 0;
  sub_2263AE47C((_DWORD)self + 24, refBase);
  sub_2263AE450((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&v36);
  fileURL = self->_fileURL;
  if (fileURL)
  {
    v17 = (char *)objc_msgSend_fileSystemRepresentation(fileURL, v13, v14, v15);
    sub_2263AE2A8(v34, v17);
    MEMORY[0x227697264](&v36, v34);
    v18 = objc_retainAutorelease(v4);
    v22 = (char *)objc_msgSend_fileSystemRepresentation(v18, v19, v20, v21);
    sub_2263AE2A8(&v32, v22);
    pxrInternal__aapl__pxrReserved__::UsdUtilsCreateNewUsdzPackage();
    if (v33 < 0)
      operator delete(v32);
    if (v40 < 0)
      operator delete(v39);
    if (v38 < 0)
      operator delete(v36);
    if (v35 < 0)
      operator delete(v34[0]);
    objc_msgSend_path(self->_fileURL, v23, v24, v25);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = (char *)objc_msgSend_UTF8String(v26, v27, v28, v29);
    sub_2263AE2A8(&v36, v30);
    pxrInternal__aapl__pxrReserved__::UsdStage::Open();
    v31 = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)p_usdStage->_refBase;
    p_usdStage->_refBase = (TfRefBase *)v34[0];
    v34[0] = 0;
    sub_2263AE47C((int)p_usdStage, v31);
    sub_2263AE450((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)v34);
    if (v38 < 0)
      operator delete(v36);

  }
  else
  {
    NSLog(CFSTR("Unable to save because file URL is invalid."));
  }

}

- (void)saveAndCreateARKitUSDZPackageWithURL:(id)a3
{
  id v4;
  TfRefPtr<pxrInternal__aapl__pxrReserved__::UsdStage> *p_usdStage;
  pxrInternal__aapl__pxrReserved__::UsdStage *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *refBase;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  NSURL *fileURL;
  char *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *v31;
  void *v32;
  char v33;
  void *v34[2];
  char v35;
  void *v36;
  uint64_t v37;
  char v38;
  void *v39;
  char v40;

  v4 = a3;
  p_usdStage = &self->_usdStage;
  v6 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(v6);
  v7 = sub_2263D67EC((uint64_t *)&v36);
  MEMORY[0x227697E58](v7, 0);
  v8 = v37;
  if (v37)
  {
    v9 = (unsigned int *)(v37 + 8);
    do
    {
      v10 = __ldxr(v9);
      v11 = v10 - 1;
    }
    while (__stlxr(v11, v9));
    if (!v11)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  }
  refBase = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)p_usdStage->_refBase;
  p_usdStage->_refBase = 0;
  v36 = 0;
  sub_2263AE47C((_DWORD)self + 24, refBase);
  sub_2263AE450((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&v36);
  fileURL = self->_fileURL;
  if (fileURL)
  {
    v17 = (char *)objc_msgSend_fileSystemRepresentation(fileURL, v13, v14, v15);
    sub_2263AE2A8(v34, v17);
    MEMORY[0x227697264](&v36, v34);
    v18 = objc_retainAutorelease(v4);
    v22 = (char *)objc_msgSend_fileSystemRepresentation(v18, v19, v20, v21);
    sub_2263AE2A8(&v32, v22);
    pxrInternal__aapl__pxrReserved__::UsdUtilsCreateNewARKitUsdzPackage();
    if (v33 < 0)
      operator delete(v32);
    if (v40 < 0)
      operator delete(v39);
    if (v38 < 0)
      operator delete(v36);
    if (v35 < 0)
      operator delete(v34[0]);
    objc_msgSend_path(self->_fileURL, v23, v24, v25);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = (char *)objc_msgSend_UTF8String(v26, v27, v28, v29);
    sub_2263AE2A8(&v36, v30);
    pxrInternal__aapl__pxrReserved__::UsdStage::Open();
    v31 = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter *)p_usdStage->_refBase;
    p_usdStage->_refBase = (TfRefBase *)v34[0];
    v34[0] = 0;
    sub_2263AE47C((int)p_usdStage, v31);
    sub_2263AE450((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)v34);
    if (v38 < 0)
      operator delete(v36);

  }
  else
  {
    NSLog(CFSTR("Unable to save because file URL is invalid."));
  }

}

- (id)nodeAtPath:(id)a3
{
  id v4;
  pxrInternal__aapl__pxrReserved__::UsdStage *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  USKNode *v9;
  unint64_t *v10;
  unint64_t v11;
  const char *v12;
  unsigned int *v13;
  unsigned int v14;
  void *v15;
  unsigned int *v16;
  unsigned int v17;
  unsigned int *v18;
  unsigned int v19;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  _BYTE v26[8];
  __int128 v27;
  __int128 v28;

  v4 = a3;
  if (v4)
  {
    v27 = 0u;
    v28 = 0u;
    v5 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
    objc_msgSend_path(v4, v6, v7, v8);
    pxrInternal__aapl__pxrReserved__::UsdStage::GetPrimAtPath(v5, (const pxrInternal__aapl__pxrReserved__::SdfPath *)v26);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)v26);
    if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v27))
    {
      v9 = [USKNode alloc];
      v21 = v27;
      v22 = *((_QWORD *)&v27 + 1);
      if (*((_QWORD *)&v27 + 1))
      {
        v10 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 48);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
      }
      sub_2263BDDD8(&v23, &v28);
      sub_2263BDE28(&v24, (_DWORD *)&v28 + 1);
      v25 = *((_QWORD *)&v28 + 1);
      if ((BYTE8(v28) & 7) != 0)
      {
        v13 = (unsigned int *)(*((_QWORD *)&v28 + 1) & 0xFFFFFFFFFFFFFFF8);
        do
          v14 = __ldxr(v13);
        while (__stxr(v14 + 2, v13));
        if ((v14 & 1) == 0)
          v25 &= 0xFFFFFFFFFFFFFFF8;
      }
      v15 = (void *)objc_msgSend_initWithUsdPrim_withSceneOwner_(v9, v12, (uint64_t)&v21, (uint64_t)self);
      if ((v25 & 7) != 0)
      {
        v16 = (unsigned int *)(v25 & 0xFFFFFFFFFFFFFFF8);
        do
          v17 = __ldxr(v16);
        while (__stlxr(v17 - 2, v16));
      }
      pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      sub_2263BDE64((uint64_t)&v23);
      if (v22)
        sub_2263DA640(v22);
    }
    else
    {
      v15 = 0;
    }
    if ((BYTE8(v28) & 7) != 0)
    {
      v18 = (unsigned int *)(*((_QWORD *)&v28 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v19 = __ldxr(v18);
      while (__stlxr(v19 - 2, v18));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v28);
    if (*((_QWORD *)&v27 + 1))
      sub_2263DA640(*((uint64_t *)&v27 + 1));
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)propertyAtPath:(id)a3
{
  id v4;
  pxrInternal__aapl__pxrReserved__::UsdStage *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  USKProperty *v11;
  unint64_t *v12;
  unint64_t v13;
  const char *v14;
  unsigned int *v15;
  unsigned int v16;
  void *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  _BYTE v28[8];
  _BYTE v29[8];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;

  v4 = a3;
  if (v4)
  {
    v33 = 0u;
    v34 = 0u;
    v5 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
    objc_msgSend_path(v4, v6, v7, v8);
    pxrInternal__aapl__pxrReserved__::UsdStage::GetObjectAtPath(v5, (const pxrInternal__aapl__pxrReserved__::SdfPath *)v28);
    sub_2263D7300((uint64_t)v29, (uint64_t)&v33);
    if ((v32 & 7) != 0)
    {
      v9 = (unsigned int *)(v32 & 0xFFFFFFFFFFFFFFF8);
      do
        v10 = __ldxr(v9);
      while (__stlxr(v10 - 2, v9));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v31);
    if (v30)
      sub_2263DA640(v30);
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)v28);
    if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v33))
    {
      v11 = [USKProperty alloc];
      v23 = v33;
      v24 = *((_QWORD *)&v33 + 1);
      if (*((_QWORD *)&v33 + 1))
      {
        v12 = (unint64_t *)(*((_QWORD *)&v33 + 1) + 48);
        do
          v13 = __ldxr(v12);
        while (__stxr(v13 + 1, v12));
      }
      sub_2263BDDD8(&v25, &v34);
      sub_2263BDE28(&v26, (_DWORD *)&v34 + 1);
      v27 = *((_QWORD *)&v34 + 1);
      if ((BYTE8(v34) & 7) != 0)
      {
        v15 = (unsigned int *)(*((_QWORD *)&v34 + 1) & 0xFFFFFFFFFFFFFFF8);
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 2, v15));
        if ((v16 & 1) == 0)
          v27 &= 0xFFFFFFFFFFFFFFF8;
      }
      v17 = (void *)objc_msgSend_initWithUsdProperty_withSceneOwner_(v11, v14, (uint64_t)&v23, (uint64_t)self);
      if ((v27 & 7) != 0)
      {
        v18 = (unsigned int *)(v27 & 0xFFFFFFFFFFFFFFF8);
        do
          v19 = __ldxr(v18);
        while (__stlxr(v19 - 2, v18));
      }
      pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      sub_2263BDE64((uint64_t)&v25);
      if (v24)
        sub_2263DA640(v24);
    }
    else
    {
      v17 = 0;
    }
    if ((BYTE8(v34) & 7) != 0)
    {
      v20 = (unsigned int *)(*((_QWORD *)&v34 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v21 = __ldxr(v20);
      while (__stlxr(v21 - 2, v20));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v34);
    if (*((_QWORD *)&v33 + 1))
      sub_2263DA640(*((uint64_t *)&v33 + 1));
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)objectAtPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  pxrInternal__aapl__pxrReserved__::UsdStage *v8;
  USKNode *v9;
  unint64_t *v10;
  unint64_t v11;
  const char *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int *v15;
  unsigned int v16;
  int v17;
  USKProperty *v18;
  unint64_t *v19;
  unint64_t v20;
  const char *v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  unsigned int *v30;
  unsigned int v31;
  int v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;

  v4 = a3;
  v47 = 0u;
  v48 = 0u;
  v8 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  if (v4)
    objc_msgSend_path(v4, v5, v6, v7);
  else
    *(_QWORD *)&v45 = 0;
  pxrInternal__aapl__pxrReserved__::UsdStage::GetObjectAtPath(v8, (const pxrInternal__aapl__pxrReserved__::SdfPath *)&v45);
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v45);
  v45 = 0u;
  v46 = 0u;
  sub_2263D783C((uint64_t)&v47, (uint64_t)&v45);
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v45))
  {
    v9 = [USKNode alloc];
    v40 = v45;
    v41 = *((_QWORD *)&v45 + 1);
    if (*((_QWORD *)&v45 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v45 + 1) + 48);
      do
        v11 = __ldxr(v10);
      while (__stxr(v11 + 1, v10));
    }
    sub_2263BDDD8(&v42, &v46);
    sub_2263BDE28(&v43, (_DWORD *)&v46 + 1);
    v44 = *((_QWORD *)&v46 + 1);
    if ((BYTE8(v46) & 7) != 0)
    {
      v13 = (unsigned int *)(*((_QWORD *)&v46 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v14 = __ldxr(v13);
      while (__stxr(v14 + 2, v13));
      if ((v14 & 1) == 0)
        v44 &= 0xFFFFFFFFFFFFFFF8;
    }
    self = (USKScene *)objc_msgSend_initWithUsdPrim_withSceneOwner_(v9, v12, (uint64_t)&v40, (uint64_t)self);
    if ((v44 & 7) != 0)
    {
      v15 = (unsigned int *)(v44 & 0xFFFFFFFFFFFFFFF8);
      do
        v16 = __ldxr(v15);
      while (__stlxr(v16 - 2, v15));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v42);
    if (v41)
      sub_2263DA640(v41);
    v17 = 1;
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
    sub_2263D7300((uint64_t)&v47, (uint64_t)&v38);
    if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v38))
    {
      v18 = [USKProperty alloc];
      v33 = v38;
      v34 = *((_QWORD *)&v38 + 1);
      if (*((_QWORD *)&v38 + 1))
      {
        v19 = (unint64_t *)(*((_QWORD *)&v38 + 1) + 48);
        do
          v20 = __ldxr(v19);
        while (__stxr(v20 + 1, v19));
      }
      sub_2263BDDD8(&v35, &v39);
      sub_2263BDE28(&v36, (_DWORD *)&v39 + 1);
      v37 = *((_QWORD *)&v39 + 1);
      if ((BYTE8(v39) & 7) != 0)
      {
        v22 = (unsigned int *)(*((_QWORD *)&v39 + 1) & 0xFFFFFFFFFFFFFFF8);
        do
          v23 = __ldxr(v22);
        while (__stxr(v23 + 2, v22));
        if ((v23 & 1) == 0)
          v37 &= 0xFFFFFFFFFFFFFFF8;
      }
      self = (USKScene *)objc_msgSend_initWithUsdProperty_withSceneOwner_(v18, v21, (uint64_t)&v33, (uint64_t)self);
      if ((v37 & 7) != 0)
      {
        v24 = (unsigned int *)(v37 & 0xFFFFFFFFFFFFFFF8);
        do
          v25 = __ldxr(v24);
        while (__stlxr(v25 - 2, v24));
      }
      pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
      sub_2263BDE64((uint64_t)&v35);
      if (v34)
        sub_2263DA640(v34);
      v17 = 1;
    }
    else
    {
      v17 = 0;
    }
    if ((BYTE8(v39) & 7) != 0)
    {
      v26 = (unsigned int *)(*((_QWORD *)&v39 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v27 = __ldxr(v26);
      while (__stlxr(v27 - 2, v26));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v39);
    if (*((_QWORD *)&v38 + 1))
      sub_2263DA640(*((uint64_t *)&v38 + 1));
  }
  if ((BYTE8(v46) & 7) != 0)
  {
    v28 = (unsigned int *)(*((_QWORD *)&v46 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v29 = __ldxr(v28);
    while (__stlxr(v29 - 2, v28));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v46);
  if (*((_QWORD *)&v45 + 1))
    sub_2263DA640(*((uint64_t *)&v45 + 1));
  if ((BYTE8(v48) & 7) != 0)
  {
    v30 = (unsigned int *)(*((_QWORD *)&v48 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v31 = __ldxr(v30);
    while (__stlxr(v31 - 2, v30));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v48);
  if (*((_QWORD *)&v47 + 1))
    sub_2263DA640(*((uint64_t *)&v47 + 1));
  if (!v17)
    self = 0;

  return self;
}

- (id)newNodeAtPath:(id)a3 type:(id)a4
{
  return (id)MEMORY[0x24BEDD108](self, sel_newNodeAtPath_type_specifier_, a3, a4);
}

- (id)newNodeAtPath:(id)a3 type:(id)a4 specifier:(id)a5
{
  id v8;
  id v9;
  __CFString *v10;
  pxrInternal__aapl__pxrReserved__::UsdStage *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  unsigned int v18;
  void *v19;
  pxrInternal__aapl__pxrReserved__::UsdStage *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int *v26;
  unsigned int v27;
  unsigned int *v28;
  unsigned int v29;
  pxrInternal__aapl__pxrReserved__::UsdStage *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int *v36;
  unsigned int v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  unsigned int *v45;
  unsigned int v46;
  unsigned int *v47;
  unsigned int v48;
  unsigned int *v49;
  unsigned int v50;
  USKNode *v51;
  unint64_t *v52;
  unint64_t v53;
  const char *v54;
  unsigned int *v55;
  unsigned int v56;
  unsigned int *v57;
  unsigned int v58;
  unsigned int *v59;
  unsigned int v60;
  int v62;
  uint64_t v63;
  int v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (__CFString *)a5;
  if (!v8)
  {
    v19 = 0;
    goto LABEL_69;
  }
  v69 = 0u;
  v70 = 0uLL;
  LODWORD(v69) = 1;
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPrimTag,24u,8u,16384u>::Handle::Handle();
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::Handle();
  if (!v10 || CFSTR("SdfSpecifierDef") == v10)
  {
    v20 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
    objc_msgSend_path(v8, v21, v22, v23);
    v67 = 0;
    pxrInternal__aapl__pxrReserved__::UsdStage::DefinePrim(v20, (const pxrInternal__aapl__pxrReserved__::SdfPath *)&v68, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v67);
    LODWORD(v69) = v71;
    v24 = v72;
    v72 = 0;
    v25 = *((_QWORD *)&v69 + 1);
    *((_QWORD *)&v69 + 1) = v24;
    if (v25)
      sub_2263DA640(v25);
    sub_2263BE05C((uint64_t)&v70, &v73);
    sub_2263BE0B0((uint64_t)&v70 + 4);
    if ((BYTE8(v70) & 7) != 0)
    {
      v26 = (unsigned int *)(*((_QWORD *)&v70 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v27 = __ldxr(v26);
      while (__stlxr(v27 - 2, v26));
    }
    *((_QWORD *)&v70 + 1) = v74;
    v74 = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v73);
    if (v72)
      sub_2263DA640(v72);
    if ((v67 & 7) != 0)
    {
      v28 = (unsigned int *)(v67 & 0xFFFFFFFFFFFFFFF8);
      do
        v29 = __ldxr(v28);
      while (__stlxr(v29 - 2, v28));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    goto LABEL_34;
  }
  if (CFSTR("SdfSpecifierOver") == v10)
  {
    v30 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
    objc_msgSend_path(v8, v31, v32, v33);
    pxrInternal__aapl__pxrReserved__::UsdStage::OverridePrim(v30, (const pxrInternal__aapl__pxrReserved__::SdfPath *)&v68);
    LODWORD(v69) = v71;
    v34 = v72;
    v72 = 0;
    v35 = *((_QWORD *)&v69 + 1);
    *((_QWORD *)&v69 + 1) = v34;
    if (v35)
      sub_2263DA640(v35);
    sub_2263BE05C((uint64_t)&v70, &v73);
    sub_2263BE0B0((uint64_t)&v70 + 4);
    if ((BYTE8(v70) & 7) != 0)
    {
      v36 = (unsigned int *)(*((_QWORD *)&v70 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v37 = __ldxr(v36);
      while (__stlxr(v37 - 2, v36));
    }
    *((_QWORD *)&v70 + 1) = v74;
    v74 = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v73);
    if (v72)
      sub_2263DA640(v72);
    goto LABEL_33;
  }
  if (CFSTR("SdfSpecifierClass") == v10)
  {
    v11 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
    objc_msgSend_path(v8, v12, v13, v14);
    pxrInternal__aapl__pxrReserved__::UsdStage::CreateClassPrim(v11, (const pxrInternal__aapl__pxrReserved__::SdfPath *)&v68);
    LODWORD(v69) = v71;
    v15 = v72;
    v72 = 0;
    v16 = *((_QWORD *)&v69 + 1);
    *((_QWORD *)&v69 + 1) = v15;
    if (v16)
      sub_2263DA640(v16);
    sub_2263BE05C((uint64_t)&v70, &v73);
    sub_2263BE0B0((uint64_t)&v70 + 4);
    if ((BYTE8(v70) & 7) != 0)
    {
      v17 = (unsigned int *)(*((_QWORD *)&v70 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v18 = __ldxr(v17);
      while (__stlxr(v18 - 2, v17));
    }
    *((_QWORD *)&v70 + 1) = v74;
    v74 = 0;
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v73);
    if (v72)
      sub_2263DA640(v72);
LABEL_33:
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
LABEL_34:
    sub_2263BDE64((uint64_t)&v68);
  }
  if (sub_2263DA5B4((pxrInternal__aapl__pxrReserved__::UsdObject *)&v69))
  {
    if (v9)
    {
      MEMORY[0x2276976D8](&v68, "typeName");
      objc_msgSend_tokenWithNodeType_(USKToken, v38, (uint64_t)v9, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v40;
      if (v40)
      {
        objc_msgSend_token(v40, v41, v42, v43);
        v71 = v67;
        v72 = (uint64_t)&off_24EDD7038 + 1;
        if ((v67 & 7) != 0)
        {
          v45 = (unsigned int *)(v67 & 0xFFFFFFFFFFFFFFF8);
          do
            v46 = __ldxr(v45);
          while (__stxr(v46 + 2, v45));
          if ((v46 & 1) == 0)
            v71 &= 0xFFFFFFFFFFFFFFF8;
        }
      }
      else
      {
        v67 = 0;
        v71 = 0;
        v72 = (uint64_t)&off_24EDD7038 + 1;
      }
      pxrInternal__aapl__pxrReserved__::UsdObject::SetMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&v69, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v68, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v71);
      sub_2263AD568((uint64_t)&v71);
      if ((v67 & 7) != 0)
      {
        v47 = (unsigned int *)(v67 & 0xFFFFFFFFFFFFFFF8);
        do
          v48 = __ldxr(v47);
        while (__stlxr(v48 - 2, v47));
      }

      if ((v68 & 7) != 0)
      {
        v49 = (unsigned int *)(v68 & 0xFFFFFFFFFFFFFFF8);
        do
          v50 = __ldxr(v49);
        while (__stlxr(v50 - 2, v49));
      }
    }
    v51 = [USKNode alloc];
    v62 = v69;
    v63 = *((_QWORD *)&v69 + 1);
    if (*((_QWORD *)&v69 + 1))
    {
      v52 = (unint64_t *)(*((_QWORD *)&v69 + 1) + 48);
      do
        v53 = __ldxr(v52);
      while (__stxr(v53 + 1, v52));
    }
    sub_2263BDDD8(&v64, &v70);
    sub_2263BDE28(&v65, (_DWORD *)&v70 + 1);
    v66 = *((_QWORD *)&v70 + 1);
    if ((BYTE8(v70) & 7) != 0)
    {
      v55 = (unsigned int *)(*((_QWORD *)&v70 + 1) & 0xFFFFFFFFFFFFFFF8);
      do
        v56 = __ldxr(v55);
      while (__stxr(v56 + 2, v55));
      if ((v56 & 1) == 0)
        v66 &= 0xFFFFFFFFFFFFFFF8;
    }
    v19 = (void *)objc_msgSend_initWithUsdPrim_withSceneOwner_(v51, v54, (uint64_t)&v62, (uint64_t)self);
    if ((v66 & 7) != 0)
    {
      v57 = (unsigned int *)(v66 & 0xFFFFFFFFFFFFFFF8);
      do
        v58 = __ldxr(v57);
      while (__stlxr(v58 - 2, v57));
    }
    pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
    sub_2263BDE64((uint64_t)&v64);
    if (v63)
      sub_2263DA640(v63);
  }
  else
  {
    v19 = 0;
  }
  if ((BYTE8(v70) & 7) != 0)
  {
    v59 = (unsigned int *)(*((_QWORD *)&v70 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v60 = __ldxr(v59);
    while (__stlxr(v60 - 2, v59));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v70);
  if (*((_QWORD *)&v69 + 1))
    sub_2263DA640(*((uint64_t *)&v69 + 1));
LABEL_69:

  return v19;
}

- (USKNode)rootNode
{
  pxrInternal__aapl__pxrReserved__::UsdStage *v3;
  USKNode *v4;
  const char *v5;
  unsigned int *v6;
  unsigned int v7;
  void *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;

  v19 = 0u;
  v20 = 0u;
  v3 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetPseudoRoot(v3);
  v4 = [USKNode alloc];
  v14 = 0;
  v15 = 0;
  sub_2263BDDD8(&v16, &v20);
  sub_2263BDE28(&v17, (_DWORD *)&v20 + 1);
  v18 = *((_QWORD *)&v20 + 1);
  if ((BYTE8(v20) & 7) != 0)
  {
    v6 = (unsigned int *)(*((_QWORD *)&v20 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 2, v6));
    if ((v7 & 1) == 0)
      v18 &= 0xFFFFFFFFFFFFFFF8;
  }
  v8 = (void *)objc_msgSend_initWithUsdPrim_withSceneOwner_(v4, v5, (uint64_t)&v14, (uint64_t)self);
  if ((v18 & 7) != 0)
  {
    v9 = (unsigned int *)(v18 & 0xFFFFFFFFFFFFFFF8);
    do
      v10 = __ldxr(v9);
    while (__stlxr(v10 - 2, v9));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v16);
  if (v15)
    sub_2263DA640(v15);
  if ((BYTE8(v20) & 7) != 0)
  {
    v11 = (unsigned int *)(*((_QWORD *)&v20 + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v12 = __ldxr(v11);
    while (__stlxr(v12 - 2, v11));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)&v20);
  if (*((_QWORD *)&v19 + 1))
    sub_2263DA640(*((uint64_t *)&v19 + 1));
  return (USKNode *)v8;
}

- (void)addSubLayerWithPath:(id)a3
{
  MEMORY[0x24BEDD108](self, sel_addSubLayerWithPath_offset_, a3, 0);
}

- (void)addSubLayerWithPath:(id)a3 offset:(id)a4
{
  id v6;
  id v7;
  pxrInternal__aapl__pxrReserved__::UsdStage *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  pxrInternal__aapl__pxrReserved__::SdfLayer *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  pxrInternal__aapl__pxrReserved__::SdfLayer *v20;
  uint64_t v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int v24;
  _QWORD v25[2];
  void *__p[2];
  char v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3;
  v7 = a4;
  if (!v6)
    goto LABEL_13;
  v28 = 0;
  v29 = 0;
  v8 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(v8);
  sub_2263D67EC(&v28);
  v9 = objc_retainAutorelease(v6);
  v13 = (char *)objc_msgSend_UTF8String(v9, v10, v11, v12);
  sub_2263AE2A8(__p, v13);
  pxrInternal__aapl__pxrReserved__::SdfLayer::InsertSubLayerPath();
  if ((v27 & 0x80000000) == 0)
  {
    if (!v7)
      goto LABEL_8;
LABEL_6:
    v14 = (pxrInternal__aapl__pxrReserved__::SdfLayer *)sub_2263D67EC(&v28);
    objc_msgSend_sdfLayerOffset(v7, v15, v16, v17);
    v25[0] = v18;
    v25[1] = v19;
    v20 = (pxrInternal__aapl__pxrReserved__::SdfLayer *)sub_2263D67EC(&v28);
    pxrInternal__aapl__pxrReserved__::SdfLayer::GetSubLayerOffsets(v20);
    pxrInternal__aapl__pxrReserved__::SdfLayer::SetSubLayerOffset(v14, (const pxrInternal__aapl__pxrReserved__::SdfLayerOffset *)v25);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    goto LABEL_8;
  }
  operator delete(__p[0]);
  if (v7)
    goto LABEL_6;
LABEL_8:
  v21 = v29;
  if (v29)
  {
    v22 = (unsigned int *)(v29 + 8);
    do
    {
      v23 = __ldxr(v22);
      v24 = v23 - 1;
    }
    while (__stlxr(v24, v22));
    if (!v24)
      (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  }
LABEL_13:

}

- (id)subLayerPaths
{
  pxrInternal__aapl__pxrReserved__::UsdStage *v2;
  pxrInternal__aapl__pxrReserved__::SdfLayer *v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  id v8;
  int v9;
  uint64_t *v10;
  const char *v11;
  uint64_t v12;
  __int128 *v13;
  __int128 *i;
  __int128 v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  __int128 v23;
  unint64_t v24;
  __int128 *v25;
  __int128 *v26;
  uint64_t v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  uint64_t v30;
  __int128 v31;
  unint64_t v32;
  __int128 __dst;
  uint64_t v34;

  v28 = 0;
  v29 = 0;
  v30 = 0;
  v2 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(v2);
  v3 = (pxrInternal__aapl__pxrReserved__::SdfLayer *)sub_2263D67EC((uint64_t *)&__dst);
  pxrInternal__aapl__pxrReserved__::SdfLayer::GetSubLayerPaths(v3);
  v4 = *((_QWORD *)&__dst + 1);
  if (*((_QWORD *)&__dst + 1))
  {
    v5 = (unsigned int *)(*((_QWORD *)&__dst + 1) + 8);
    do
    {
      v6 = __ldxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  }
  if (sub_2263D8578((uint64_t)&v28))
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = sub_2263DACE4((uint64_t)&v28);
    sub_2263D85D4((uint64_t)&v28, (uint64_t)&v23);
    if (v9)
      v10 = &v28;
    else
      v10 = 0;
    v26 = 0;
    v27 = 0;
    v25 = 0;
    *((_QWORD *)&__dst + 1) = v10;
    v34 = 0;
    v31 = v23;
    v32 = v24;
    sub_2263DAD58(&v25, (uint64_t)&__dst, (uint64_t)&v31, v24);
    v13 = v25;
    for (i = v26; v13 != i; v13 = (__int128 *)((char *)v13 + 24))
    {
      __dst = 0uLL;
      v34 = 0;
      if (*((char *)v13 + 23) < 0)
      {
        sub_2263AE36C(&__dst, *(void **)v13, *((_QWORD *)v13 + 1));
      }
      else
      {
        v15 = *v13;
        v34 = *((_QWORD *)v13 + 2);
        __dst = v15;
      }
      if (v34 >= 0)
        objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v11, (uint64_t)&__dst, v12);
      else
        objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v11, __dst, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v8, v17, (uint64_t)v16, v18);

      if (SHIBYTE(v34) < 0)
        operator delete((void *)__dst);
    }
    *(_QWORD *)&__dst = &v25;
    sub_2263DA710((void ***)&__dst);
  }
  else
  {
    v8 = 0;
  }
  v19 = v29;
  if (v29)
  {
    p_shared_owners = (unint64_t *)&v29->__shared_owners_;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  return v8;
}

- (id)subLayerOffsets
{
  pxrInternal__aapl__pxrReserved__::UsdStage *v2;
  pxrInternal__aapl__pxrReserved__::SdfLayer *v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  id v9;
  double *v10;
  double *v11;
  double v12;
  double v13;
  USKLayerOffset *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  void *__p;
  void *v25;
  uint64_t v26;

  __p = 0;
  v25 = 0;
  v26 = 0;
  v2 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(v2);
  v3 = (pxrInternal__aapl__pxrReserved__::SdfLayer *)sub_2263D67EC(&v22);
  pxrInternal__aapl__pxrReserved__::SdfLayer::GetSubLayerOffsets(v3);
  v4 = v23;
  if (v23)
  {
    v5 = (unsigned int *)(v23 + 8);
    do
    {
      v6 = __ldxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  }
  v8 = v25;
  if (v25 == __p)
  {
    v9 = 0;
    if (!v25)
      return v9;
    goto LABEL_10;
  }
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = (double *)__p;
  v11 = (double *)v25;
  if (__p != v25)
  {
    do
    {
      v12 = *v10;
      v13 = v10[1];
      v14 = [USKLayerOffset alloc];
      v18 = (void *)objc_msgSend_initWithSdfLayerOffset_(v14, v15, v16, v17, v12, v13);
      objc_msgSend_addObject_(v9, v19, (uint64_t)v18, v20);

      v10 += 2;
    }
    while (v10 != v11);
  }
  v8 = __p;
  if (__p)
  {
LABEL_10:
    v25 = v8;
    operator delete(v8);
  }
  return v9;
}

- (id)metadata
{
  void *v3;
  void *v4;
  pxrInternal__aapl__pxrReserved__::UsdStage *v5;
  unsigned int *v6;
  unsigned int v7;
  const char *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  unint64_t EmptyString;
  void *v16;
  const char *v17;
  uint64_t v18;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  unsigned int *v20;
  unsigned int v21;
  USKData *v22;
  const char *v23;
  unsigned int *v24;
  unsigned int v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  unsigned int *v29;
  unsigned int v30;
  USKData *v31;
  unsigned int *v32;
  unsigned int v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  unsigned int *v38;
  unsigned int v39;
  unsigned int *v40;
  unsigned int v41;
  unsigned int *v42;
  unsigned int v43;
  unsigned int *v44;
  unsigned int v45;
  _QWORD *v46;
  _QWORD **v47;
  BOOL v48;
  void *v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *__p[2];
  char v57;
  uint64_t v58;
  __int128 v59;
  _OWORD v60[4];
  void *v61[2];
  __int128 v62;
  __int128 v63;
  _OWORD v64[9];
  uint64_t v65;
  uint64_t v66;
  _QWORD **v67;
  _QWORD *v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  uint64_t v71;
  _QWORD v72[4];

  v72[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v67 = 0;
  v68[0] = 0;
  v68[1] = 0;
  v5 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetPseudoRoot(v5);
  pxrInternal__aapl__pxrReserved__::UsdObject::GetAllAuthoredMetadata((pxrInternal__aapl__pxrReserved__::UsdObject *)&v59);
  if ((BYTE8(v60[0]) & 7) != 0)
  {
    v6 = (unsigned int *)(*((_QWORD *)&v60[0] + 1) & 0xFFFFFFFFFFFFFFF8);
    do
      v7 = __ldxr(v6);
    while (__stlxr(v7 - 2, v6));
  }
  pxrInternal__aapl__pxrReserved__::Sdf_Pool<pxrInternal__aapl__pxrReserved__::Sdf_PathPropTag,24u,8u,16384u>::Handle::operator BOOL();
  sub_2263BDE64((uint64_t)v60);
  if (*((_QWORD *)&v59 + 1))
    sub_2263DA640(*((uint64_t *)&v59 + 1));
  v9 = v67;
  if (v67 != v68)
  {
    v10 = *MEMORY[0x24BEDB7F0];
    v52 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
    v53 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
    v51 = MEMORY[0x24BEDB848] + 16;
    do
    {
      v71 = 0;
      v72[0] = 0;
      v72[1] = 0;
      v11 = sub_2263DA68C(&v71, v9 + 4);
      v14 = (void *)MEMORY[0x24BDD17C8];
      if ((v71 & 0xFFFFFFFFFFFFFFF8) != 0)
        EmptyString = (v71 & 0xFFFFFFFFFFFFFFF8) + 16;
      else
        EmptyString = pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString((pxrInternal__aapl__pxrReserved__::TfToken *)v11);
      if (*(char *)(EmptyString + 23) < 0)
        EmptyString = *(_QWORD *)EmptyString;
      objc_msgSend_stringWithUTF8String_(v14, v12, EmptyString, v13, v51);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v3, v17, (uint64_t)v16, v18);

      v66 = 0;
      Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
      if (!Instance)
        Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
      __p[0] = 0;
      *(_QWORD *)&v59 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(Instance, (const pxrInternal__aapl__pxrReserved__::VtValue *)v72, (const pxrInternal__aapl__pxrReserved__::TfToken *)__p);
      pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v59);
      if (((uint64_t)__p[0] & 7) != 0)
      {
        v20 = (unsigned int *)((unint64_t)__p[0] & 0xFFFFFFFFFFFFFFF8);
        do
          v21 = __ldxr(v20);
        while (__stlxr(v21 - 2, v20));
      }
      if (v66)
      {
        v22 = [USKData alloc];
        sub_2263B0700(v69, v72);
        v54 = v66;
        if ((v66 & 7) != 0)
        {
          v24 = (unsigned int *)(v66 & 0xFFFFFFFFFFFFFFF8);
          do
            v25 = __ldxr(v24);
          while (__stxr(v25 + 2, v24));
          if ((v25 & 1) == 0)
            v54 &= 0xFFFFFFFFFFFFFFF8;
        }
        v26 = (void *)objc_msgSend_initWithVtValue_typeName_withSceneOwner_(v22, v23, (uint64_t)v69, (uint64_t)&v54, self);
        objc_msgSend_addObject_(v4, v27, (uint64_t)v26, v28);

        if ((v54 & 7) != 0)
        {
          v29 = (unsigned int *)(v54 & 0xFFFFFFFFFFFFFFF8);
          do
            v30 = __ldxr(v29);
          while (__stlxr(v30 - 2, v29));
        }
        sub_2263AD568((uint64_t)v69);
      }
      else
      {
        v65 = 0;
        v63 = 0u;
        memset(v64, 0, sizeof(v64));
        *(_OWORD *)v61 = 0u;
        v62 = 0u;
        memset(v60, 0, sizeof(v60));
        v59 = 0u;
        sub_2263B38C0((uint64_t)&v59);
        pxrInternal__aapl__pxrReserved__::operator<<();
        v31 = [USKData alloc];
        std::stringbuf::str();
        MEMORY[0x2276976E4](&v58, __p);
        v70[0] = v58;
        v70[1] = (char *)&off_24EDD7038 + 1;
        if ((v58 & 7) != 0)
        {
          v32 = (unsigned int *)(v58 & 0xFFFFFFFFFFFFFFF8);
          do
            v33 = __ldxr(v32);
          while (__stxr(v33 + 2, v32));
          if ((v33 & 1) == 0)
            v70[0] &= 0xFFFFFFFFFFFFFFF8;
        }
        MEMORY[0x2276976D8](&v55, "token");
        v35 = (void *)objc_msgSend_initWithVtValue_typeName_withSceneOwner_(v31, v34, (uint64_t)v70, (uint64_t)&v55, self);
        objc_msgSend_addObject_(v4, v36, (uint64_t)v35, v37);

        if ((v55 & 7) != 0)
        {
          v38 = (unsigned int *)(v55 & 0xFFFFFFFFFFFFFFF8);
          do
            v39 = __ldxr(v38);
          while (__stlxr(v39 - 2, v38));
        }
        sub_2263AD568((uint64_t)v70);
        if ((v58 & 7) != 0)
        {
          v40 = (unsigned int *)(v58 & 0xFFFFFFFFFFFFFFF8);
          do
            v41 = __ldxr(v40);
          while (__stlxr(v41 - 2, v40));
        }
        if (v57 < 0)
          operator delete(__p[0]);
        *(_QWORD *)&v59 = v10;
        *(_QWORD *)((char *)&v60[-1] + *(_QWORD *)(v10 - 24)) = v53;
        *(_QWORD *)&v60[0] = v52;
        *((_QWORD *)&v60[0] + 1) = v51;
        if (SHIBYTE(v62) < 0)
          operator delete(v61[1]);
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x2276980B0](v64);
      }
      if ((v66 & 7) != 0)
      {
        v42 = (unsigned int *)(v66 & 0xFFFFFFFFFFFFFFF8);
        do
          v43 = __ldxr(v42);
        while (__stlxr(v43 - 2, v42));
      }
      sub_2263AD568((uint64_t)v72);
      if ((v71 & 7) != 0)
      {
        v44 = (unsigned int *)(v71 & 0xFFFFFFFFFFFFFFF8);
        do
          v45 = __ldxr(v44);
        while (__stlxr(v45 - 2, v44));
      }
      v46 = (_QWORD *)v9[1];
      if (v46)
      {
        do
        {
          v47 = (_QWORD **)v46;
          v46 = (_QWORD *)*v46;
        }
        while (v46);
      }
      else
      {
        do
        {
          v47 = (_QWORD **)v9[2];
          v48 = *v47 == v9;
          v9 = v47;
        }
        while (!v48);
      }
      v9 = v47;
    }
    while (v47 != v68);
  }
  objc_msgSend_dictionaryWithObjects_forKeys_(MEMORY[0x24BDBCE70], v8, (uint64_t)v4, (uint64_t)v3);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  sub_2263DB100((uint64_t)&v67, v68[0]);

  return v49;
}

- (BOOL)setMetadataWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t Type;
  BOOL v18;
  uint64_t v19;
  const char *v20;
  const VtValue *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  pxrInternal__aapl__pxrReserved__::UsdStage *v26;
  char v27;
  pxrInternal__aapl__pxrReserved__::UsdStage *v28;
  unsigned int *v29;
  unsigned int v30;
  uint64_t v32;
  _QWORD v33[2];
  _QWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  VtValue v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v32 = 0;
  v8 = objc_retainAutorelease(v6);
  v12 = objc_msgSend_UTF8String(v8, v9, v10, v11);
  MEMORY[0x2276976D8](&v32, v12);
  v37._storage = 0;
  v37._info._ptrAndBits = 0;
  Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
  if (!Instance)
    Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
  if (pxrInternal__aapl__pxrReserved__::SdfSchemaBase::IsRegistered(Instance, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v32, (pxrInternal__aapl__pxrReserved__::VtValue *)&v37))
  {
    if (!v37._info._ptrAndBits)
      goto LABEL_12;
    Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v37);
    if (v7)
    {
      objc_msgSend_value(v7, v14, v15, v16);
    }
    else
    {
      v35 = 0;
      v36 = 0;
    }
    v19 = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v35);
    sub_2263AD568((uint64_t)&v35);
    if (Type == v19)
    {
LABEL_12:
      v26 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
      if (v7)
      {
        objc_msgSend_value(v7, v23, v24, v25);
      }
      else
      {
        v35 = 0;
        v36 = 0;
      }
      v27 = pxrInternal__aapl__pxrReserved__::UsdStage::SetMetadata(v26, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v32, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v35);
    }
    else
    {
      v35 = 0;
      v36 = 0;
      if (v7)
      {
        objc_msgSend_value(v7, v20, (uint64_t)v21, v22);
      }
      else
      {
        v33[0] = 0;
        v33[1] = 0;
      }
      pxrInternal__aapl__pxrReserved__::VtValue::CastToTypeOf((pxrInternal__aapl__pxrReserved__::VtValue *)v33, &v37, v21);
      sub_2263AD3FC(&v35, v34);
      sub_2263AD568((uint64_t)v34);
      sub_2263AD568((uint64_t)v33);
      v28 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
      v27 = pxrInternal__aapl__pxrReserved__::UsdStage::SetMetadata(v28, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v32, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v35);
    }
    v18 = v27;
    sub_2263AD568((uint64_t)&v35);
  }
  else
  {
    v18 = 0;
  }
  sub_2263AD568((uint64_t)&v37);
  if ((v32 & 7) != 0)
  {
    v29 = (unsigned int *)(v32 & 0xFFFFFFFFFFFFFFF8);
    do
      v30 = __ldxr(v29);
    while (__stlxr(v30 - 2, v29));
  }

  return v18;
}

- (BOOL)setDictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  pxrInternal__aapl__pxrReserved__::TfToken *v22;
  BOOL v23;
  _QWORD *ValueAtPath;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t Type;
  uint64_t v29;
  const char *v30;
  const VtValue *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  pxrInternal__aapl__pxrReserved__::UsdStage *v36;
  char v37;
  pxrInternal__aapl__pxrReserved__::UsdStage *v38;
  unsigned int *v39;
  unsigned int v40;
  unsigned int *v41;
  unsigned int v42;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint64_t v48;
  uint64_t v49;
  VtValue v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v45 = 0;
  v11 = objc_retainAutorelease(v8);
  v15 = objc_msgSend_UTF8String(v11, v12, v13, v14);
  MEMORY[0x2276976D8](&v45, v15);
  v44 = 0;
  v16 = objc_retainAutorelease(v9);
  v20 = objc_msgSend_UTF8String(v16, v17, v18, v19);
  MEMORY[0x2276976D8](&v44, v20);
  v50._storage = 0;
  v50._info._ptrAndBits = 0;
  Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
  if (!Instance)
    Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
  if (pxrInternal__aapl__pxrReserved__::SdfSchemaBase::IsRegistered(Instance, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v45, (pxrInternal__aapl__pxrReserved__::VtValue *)&v50))
  {
    if (((uint64_t)v50._info._ptrAndBits & 4) != 0)
      v22 = (pxrInternal__aapl__pxrReserved__::TfToken *)(*(uint64_t (**)(VtValue *))(((unint64_t)v50._info._ptrAndBits & 0xFFFFFFFFFFFFFFF8)
                                                                                              + 168))(&v50);
    else
      v22 = (pxrInternal__aapl__pxrReserved__::TfToken *)sub_2263DB168((uint64_t *)&v50);
    if ((v44 & 0xFFFFFFFFFFFFFFF8) == 0)
      pxrInternal__aapl__pxrReserved__::TfToken::_GetEmptyString(v22);
    ValueAtPath = (_QWORD *)pxrInternal__aapl__pxrReserved__::VtDictionary::GetValueAtPath();
    if (ValueAtPath)
    {
      sub_2263B2DCC(&v50, ValueAtPath);
    }
    else
    {
      v49 = 0;
      sub_2263AD3FC(&v50, &v48);
      sub_2263AD568((uint64_t)&v48);
    }
    if (!v50._info._ptrAndBits)
      goto LABEL_20;
    Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v50);
    if (v10)
    {
      objc_msgSend_value(v10, v25, v26, v27);
    }
    else
    {
      v48 = 0;
      v49 = 0;
    }
    v29 = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v48);
    sub_2263AD568((uint64_t)&v48);
    if (Type == v29)
    {
LABEL_20:
      v36 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
      if (v10)
      {
        objc_msgSend_value(v10, v33, v34, v35);
      }
      else
      {
        v48 = 0;
        v49 = 0;
      }
      v37 = pxrInternal__aapl__pxrReserved__::UsdStage::SetMetadataByDictKey(v36, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v45, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v44, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v48);
    }
    else
    {
      v48 = 0;
      v49 = 0;
      if (v10)
      {
        objc_msgSend_value(v10, v30, (uint64_t)v31, v32);
      }
      else
      {
        v46[0] = 0;
        v46[1] = 0;
      }
      pxrInternal__aapl__pxrReserved__::VtValue::CastToTypeOf((pxrInternal__aapl__pxrReserved__::VtValue *)v46, &v50, v31);
      sub_2263AD3FC(&v48, v47);
      sub_2263AD568((uint64_t)v47);
      sub_2263AD568((uint64_t)v46);
      v38 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
      v37 = pxrInternal__aapl__pxrReserved__::UsdStage::SetMetadataByDictKey(v38, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v45, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v44, (const pxrInternal__aapl__pxrReserved__::VtValue *)&v48);
    }
    v23 = v37;
    sub_2263AD568((uint64_t)&v48);
  }
  else
  {
    v23 = 0;
  }
  sub_2263AD568((uint64_t)&v50);
  if ((v44 & 7) != 0)
  {
    v39 = (unsigned int *)(v44 & 0xFFFFFFFFFFFFFFF8);
    do
      v40 = __ldxr(v39);
    while (__stlxr(v40 - 2, v39));
  }
  if ((v45 & 7) != 0)
  {
    v41 = (unsigned int *)(v45 & 0xFFFFFFFFFFFFFFF8);
    do
      v42 = __ldxr(v41);
    while (__stlxr(v42 - 2, v41));
  }

  return v23;
}

- (BOOL)setCustomMetadata:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  pxrInternal__aapl__pxrReserved__::UsdStage *v20;
  char v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int *v24;
  unsigned int v25;
  uint64_t v27;
  unsigned int *v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v28 = 0;
  v8 = atomic_load(MEMORY[0x24BEE7E98]);
  if (!v8)
    v8 = sub_2263DA79C(MEMORY[0x24BEE7E98]);
  v9 = *(unsigned int **)(v8 + 80);
  v28 = v9;
  if ((v9 & 7) != 0)
  {
    v10 = (unsigned int *)((unint64_t)v9 & 0xFFFFFFFFFFFFFFF8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 2, v10));
    if ((v11 & 1) == 0)
      v28 = v10;
  }
  v27 = 0;
  v12 = objc_retainAutorelease(v6);
  v16 = objc_msgSend_UTF8String(v12, v13, v14, v15);
  MEMORY[0x2276976D8](&v27, v16);
  v20 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  if (v7)
  {
    objc_msgSend_value(v7, v17, v18, v19);
  }
  else
  {
    v29[0] = 0;
    v29[1] = 0;
  }
  v21 = pxrInternal__aapl__pxrReserved__::UsdStage::SetMetadataByDictKey(v20, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v28, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v27, (const pxrInternal__aapl__pxrReserved__::VtValue *)v29);
  sub_2263AD568((uint64_t)v29);
  if ((v27 & 7) != 0)
  {
    v22 = (unsigned int *)(v27 & 0xFFFFFFFFFFFFFFF8);
    do
      v23 = __ldxr(v22);
    while (__stlxr(v23 - 2, v22));
  }
  if ((v28 & 7) != 0)
  {
    v24 = (unsigned int *)((unint64_t)v28 & 0xFFFFFFFFFFFFFFF8);
    do
      v25 = __ldxr(v24);
    while (__stlxr(v25 - 2, v24));
  }

  return v21;
}

- (id)metadataWithKey:(id)a3
{
  id v4;
  pxrInternal__aapl__pxrReserved__::UsdStage *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  USKData *v13;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  const char *v15;
  void *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t v22;
  uint64_t Type;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27 = 0;
  v28 = 0;
  v5 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  v6 = objc_retainAutorelease(v4);
  v10 = objc_msgSend_UTF8String(v6, v7, v8, v9);
  MEMORY[0x2276976D8](&v25, v10);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetMetadata(v5, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v25, (pxrInternal__aapl__pxrReserved__::VtValue *)&v27);
  if ((v25 & 7) != 0)
  {
    v11 = (unsigned int *)(v25 & 0xFFFFFFFFFFFFFFF8);
    do
      v12 = __ldxr(v11);
    while (__stlxr(v12 - 2, v11));
  }
  if (v28)
  {
    v13 = [USKData alloc];
    sub_2263B0700(v26, &v27);
    Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
    if (!Instance)
      Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
    v22 = 0;
    Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v27);
    v25 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(Instance, (const pxrInternal__aapl__pxrReserved__::TfType *)&Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v22);
    pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v25);
    v16 = (void *)objc_msgSend_initWithVtValue_typeName_withSceneOwner_(v13, v15, (uint64_t)v26, (uint64_t)&v24, self);
    if ((v24 & 7) != 0)
    {
      v17 = (unsigned int *)(v24 & 0xFFFFFFFFFFFFFFF8);
      do
        v18 = __ldxr(v17);
      while (__stlxr(v18 - 2, v17));
    }
    if ((v22 & 7) != 0)
    {
      v19 = (unsigned int *)(v22 & 0xFFFFFFFFFFFFFFF8);
      do
        v20 = __ldxr(v19);
      while (__stlxr(v20 - 2, v19));
    }
    sub_2263AD568((uint64_t)v26);
  }
  else
  {
    v16 = 0;
  }
  sub_2263AD568((uint64_t)&v27);

  return v16;
}

- (id)dictionaryMetadataWithKey:(id)a3 dictionaryKey:(id)a4
{
  id v6;
  id v7;
  pxrInternal__aapl__pxrReserved__::UsdStage *v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int *v21;
  unsigned int v22;
  uint64_t v23;
  __int128 v24;
  __int128 *v25;
  unint64_t *v26;
  unint64_t v27;
  __int128 *v28;
  __int128 *v29;
  __int128 v30;
  pxrInternal__aapl__pxrReserved__::UsdStage *v31;
  unsigned int *v32;
  unsigned int v33;
  unsigned int v34;
  void *v35;
  USKData *v36;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  const char *v38;
  unsigned int *v39;
  unsigned int v40;
  unsigned int *v41;
  unsigned int v42;
  uint64_t v44;
  unsigned int *v45;
  void *__p[2];
  uint64_t v47;
  void *__dst[2];
  uint64_t v49;
  _OWORD v50[2];
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 *v54;
  _QWORD v55[2];
  __int128 v56;
  uint64_t v57;
  void *v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v60 = 0;
  v61 = 0;
  v8 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  v9 = objc_retainAutorelease(v6);
  v13 = objc_msgSend_UTF8String(v9, v10, v11, v12);
  MEMORY[0x2276976D8](&v56, v13);
  v14 = objc_retainAutorelease(v7);
  v18 = objc_msgSend_UTF8String(v14, v15, v16, v17);
  MEMORY[0x2276976D8](&v52, v18);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetMetadataByDictKey(v8, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v56, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v52, (pxrInternal__aapl__pxrReserved__::VtValue *)&v60);
  if ((v52 & 7) != 0)
  {
    v19 = (unsigned int *)(v52 & 0xFFFFFFFFFFFFFFF8);
    do
      v20 = __ldxr(v19);
    while (__stlxr(v20 - 2, v19));
  }
  if ((v56 & 7) != 0)
  {
    v21 = (unsigned int *)(v56 & 0xFFFFFFFFFFFFFFF8);
    do
      v22 = __ldxr(v21);
    while (__stlxr(v22 - 2, v21));
  }
  if (!v61)
  {
    v35 = 0;
    goto LABEL_52;
  }
  if (!sub_2263C0C8C((pxrInternal__aapl__pxrReserved__::VtValue *)&v60))
    goto LABEL_43;
  v54 = 0;
  v52 = 0u;
  v53 = 0u;
  v23 = sub_2263B6768((pxrInternal__aapl__pxrReserved__::VtValue *)&v60);
  v24 = *(_OWORD *)(v23 + 16);
  v52 = *(_OWORD *)v23;
  v53 = v24;
  v25 = *(__int128 **)(v23 + 32);
  v54 = v25;
  if (v25)
  {
    v26 = (unint64_t *)(v25 - 1);
    if (*((_QWORD *)&v53 + 1))
      v26 = (unint64_t *)*((_QWORD *)&v53 + 1);
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  v51 = 0;
  memset(v50, 0, sizeof(v50));
  sub_2263C9B84((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v52);
  v28 = v54;
  sub_2263C9B84((pxrInternal__aapl__pxrReserved__::Vt_ArrayBase *)&v52);
  v29 = &v54[3 * v52];
  while (v28 != v29)
  {
    __dst[1] = 0;
    v49 = 0;
    __dst[0] = 0;
    if (*((char *)v28 + 23) < 0)
    {
      sub_2263AE36C(__dst, *(void **)v28, *((_QWORD *)v28 + 1));
    }
    else
    {
      v30 = *v28;
      v49 = *((_QWORD *)v28 + 2);
      *(_OWORD *)__dst = v30;
    }
    __p[0] = 0;
    __p[1] = 0;
    v47 = 0;
    if (*((char *)v28 + 47) < 0)
    {
      sub_2263AE36C(__p, *((void **)v28 + 3), *((_QWORD *)v28 + 4));
    }
    else
    {
      *(_OWORD *)__p = *(__int128 *)((char *)v28 + 24);
      v47 = *((_QWORD *)v28 + 5);
    }
    if (SHIBYTE(v47) < 0)
    {
      if (__p[1])
        goto LABEL_32;
    }
    else if (HIBYTE(v47))
    {
      goto LABEL_32;
    }
    v31 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
    pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(v31);
    pxrInternal__aapl__pxrReserved__::SdfComputeAssetPathRelativeToLayer();
    if (SHIBYTE(v47) < 0)
      operator delete(__p[0]);
    *(_OWORD *)__p = v56;
    v47 = v57;
    HIBYTE(v57) = 0;
    LOBYTE(v56) = 0;
    if (v45)
    {
      v32 = v45 + 2;
      do
      {
        v33 = __ldxr(v32);
        v34 = v33 - 1;
      }
      while (__stlxr(v34, v32));
      if (!v34)
        (*(void (**)(unsigned int *))(*(_QWORD *)v45 + 8))(v45);
    }
LABEL_32:
    MEMORY[0x227697270](&v56, __dst, __p);
    sub_2263DB1A8((uint64_t)v50, &v56);
    if (v59 < 0)
      operator delete(v58);
    if (SHIBYTE(v57) < 0)
      operator delete((void *)v56);
    if (SHIBYTE(v47) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v49) < 0)
      operator delete(__dst[0]);
    v28 += 3;
  }
  *((_QWORD *)&v56 + 1) = off_24EDD81A0;
  sub_2263B131C((uint64_t *)&v56, (uint64_t)v50);
  sub_2263AD3FC(&v60, &v56);
  sub_2263AD568((uint64_t)&v56);
  sub_2263C97A0(v50);
  sub_2263C97A0(&v52);
LABEL_43:
  v36 = [USKData alloc];
  sub_2263B0700(v55, &v60);
  Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
  if (!Instance)
    Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
  *(_QWORD *)&v52 = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v60);
  *(_QWORD *)&v50[0] = 0;
  *(_QWORD *)&v56 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(Instance, (const pxrInternal__aapl__pxrReserved__::TfType *)&v52, (const pxrInternal__aapl__pxrReserved__::TfToken *)v50);
  pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v56);
  v35 = (void *)objc_msgSend_initWithVtValue_typeName_withSceneOwner_(v36, v38, (uint64_t)v55, (uint64_t)&v44, self);
  if ((v44 & 7) != 0)
  {
    v39 = (unsigned int *)(v44 & 0xFFFFFFFFFFFFFFF8);
    do
      v40 = __ldxr(v39);
    while (__stlxr(v40 - 2, v39));
  }
  if ((v50[0] & 7) != 0)
  {
    v41 = (unsigned int *)(*(_QWORD *)&v50[0] & 0xFFFFFFFFFFFFFFF8);
    do
      v42 = __ldxr(v41);
    while (__stlxr(v42 - 2, v41));
  }
  sub_2263AD568((uint64_t)v55);
LABEL_52:
  sub_2263AD568((uint64_t)&v60);

  return v35;
}

- (id)customMetadataWithKey:(id)a3
{
  id v4;
  pxrInternal__aapl__pxrReserved__::UsdStage *v5;
  unint64_t v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  USKData *v14;
  pxrInternal__aapl__pxrReserved__::SdfSchemaBase *Instance;
  const char *v16;
  void *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int *v20;
  unsigned int v21;
  uint64_t v23;
  uint64_t Type;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = 0;
  v29 = 0;
  v5 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  v6 = atomic_load(MEMORY[0x24BEE7E98]);
  if (!v6)
    v6 = sub_2263DA79C(MEMORY[0x24BEE7E98]);
  v7 = objc_retainAutorelease(v4);
  v11 = objc_msgSend_UTF8String(v7, v8, v9, v10);
  MEMORY[0x2276976D8](&v26, v11);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetMetadataByDictKey(v5, (const pxrInternal__aapl__pxrReserved__::TfToken *)(v6 + 72), (const pxrInternal__aapl__pxrReserved__::TfToken *)&v26, (pxrInternal__aapl__pxrReserved__::VtValue *)&v28);
  if ((v26 & 7) != 0)
  {
    v12 = (unsigned int *)(v26 & 0xFFFFFFFFFFFFFFF8);
    do
      v13 = __ldxr(v12);
    while (__stlxr(v13 - 2, v12));
  }
  if (v29)
  {
    v14 = [USKData alloc];
    sub_2263B0700(v27, &v28);
    Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)atomic_load((unint64_t *)off_24EDD5B58);
    if (!Instance)
      Instance = (pxrInternal__aapl__pxrReserved__::SdfSchemaBase *)pxrInternal__aapl__pxrReserved__::TfSingleton<pxrInternal__aapl__pxrReserved__::SdfSchema>::_CreateInstance();
    v23 = 0;
    Type = pxrInternal__aapl__pxrReserved__::VtValue::GetType((pxrInternal__aapl__pxrReserved__::VtValue *)&v28);
    v26 = pxrInternal__aapl__pxrReserved__::SdfSchemaBase::FindType(Instance, (const pxrInternal__aapl__pxrReserved__::TfType *)&Type, (const pxrInternal__aapl__pxrReserved__::TfToken *)&v23);
    pxrInternal__aapl__pxrReserved__::SdfValueTypeName::GetAsToken((pxrInternal__aapl__pxrReserved__::SdfValueTypeName *)&v26);
    v17 = (void *)objc_msgSend_initWithVtValue_typeName_withSceneOwner_(v14, v16, (uint64_t)v27, (uint64_t)&v25, self);
    if ((v25 & 7) != 0)
    {
      v18 = (unsigned int *)(v25 & 0xFFFFFFFFFFFFFFF8);
      do
        v19 = __ldxr(v18);
      while (__stlxr(v19 - 2, v18));
    }
    if ((v23 & 7) != 0)
    {
      v20 = (unsigned int *)(v23 & 0xFFFFFFFFFFFFFFF8);
      do
        v21 = __ldxr(v20);
      while (__stlxr(v21 - 2, v20));
    }
    sub_2263AD568((uint64_t)v27);
  }
  else
  {
    v17 = 0;
  }
  sub_2263AD568((uint64_t)&v28);

  return v17;
}

- (id)nodeIterator
{
  USKNodeSubtreeIterator *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v12;
  uint64_t v13;

  v3 = [USKNodeSubtreeIterator alloc];
  sub_2263DB360(&v12, (uint64_t *)&self->_usdStage);
  v6 = (void *)objc_msgSend_initWithScene_(v3, v4, (uint64_t)&v12, v5);
  v7 = v13;
  if (v13)
  {
    v8 = (unsigned int *)(v13 + 8);
    do
    {
      v9 = __ldxr(v8);
      v10 = v9 - 1;
    }
    while (__stlxr(v10, v8));
    if (!v10)
      (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  }
  return v6;
}

- (id)loadedNodeIterator
{
  USKNodeSubtreeIterator *v3;
  const char *v4;
  void *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  int64x2_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v3 = [USKNodeSubtreeIterator alloc];
  sub_2263DB360(&v13, (uint64_t *)&self->_usdStage);
  v12 = 0;
  v11 = vdupq_n_s64(2uLL);
  v5 = (void *)objc_msgSend_initWithScene_withPredicate_(v3, v4, (uint64_t)&v13, (uint64_t)&v11);
  v6 = v14;
  if (v14)
  {
    v7 = (unsigned int *)(v14 + 8);
    do
    {
      v8 = __ldxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  }
  return v5;
}

- (void)dumpUSDA
{
  pxrInternal__aapl__pxrReserved__::UsdStage *v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  void *p_p;
  uint64_t v8;
  _QWORD *v9;
  const std::locale::facet *v10;
  std::locale v11;
  uint64_t v12;
  void *__p;
  uint64_t v14;
  uint64_t v15;

  __p = 0;
  v14 = 0;
  v15 = 0;
  v2 = (pxrInternal__aapl__pxrReserved__::UsdStage *)sub_2263ADE48((id *)&self->_usdStage._refBase);
  pxrInternal__aapl__pxrReserved__::UsdStage::GetRootLayer(v2);
  sub_2263D67EC((uint64_t *)&v11);
  pxrInternal__aapl__pxrReserved__::SdfLayer::ExportToString();
  v3 = v12;
  if (v12)
  {
    v4 = (unsigned int *)(v12 + 8);
    do
    {
      v5 = __ldxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  }
  if (v15 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  if (v15 >= 0)
    v8 = HIBYTE(v15);
  else
    v8 = v14;
  v9 = sub_2263B0814(MEMORY[0x24BEDB318], (uint64_t)p_p, v8);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
  v10 = std::locale::use_facet(&v11, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
  std::locale::~locale(&v11);
  std::ostream::put();
  std::ostream::flush();
  if (SHIBYTE(v15) < 0)
    operator delete(__p);
}

- (void)dealloc
{
  pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **p_usdStage;
  objc_super v4;

  p_usdStage = (pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&self->_usdStage;
  if (*p_usdStage)
    sub_2263DA47C(p_usdStage);
  v4.receiver = self;
  v4.super_class = (Class)USKScene;
  -[USKScene dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  sub_2263AE450((pxrInternal__aapl__pxrReserved__::Tf_RefPtr_UniqueChangedCounter **)&self->_usdStage);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
