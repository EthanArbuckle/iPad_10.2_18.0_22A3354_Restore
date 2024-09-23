@implementation DiskImageParamsXPC

+ (id)newWithURL:(id)a3 fileOpenFlags:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  unsigned int v9;
  PluginBackendXPC *v10;
  DiskImageParamsRAM_XPC *v11;
  DiskImageParamsPlugin_XPC *v12;
  void *v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  uint64_t v21;
  char *v22;
  void *v23;
  unsigned int v24;
  PluginBackendXPC *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  _QWORD *p_lpsrc;
  std::__shared_weak_count *v31;
  unint64_t *p_shared_owners;
  unint64_t v33;
  char v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  void *lpsrc;
  std::__shared_weak_count *v39;
  uint8_t buf[8];
  _BYTE v41[10];
  __int16 v42;
  void *v43;
  __int16 v44;
  int v45;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheme"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("ram"));

  if (v9)
  {
    v10 = 0;
    v11 = -[DiskImageParamsRAM_XPC initWithURL:error:]([DiskImageParamsRAM_XPC alloc], "initWithURL:error:", v7, a5);
LABEL_3:
    v12 = (DiskImageParamsPlugin_XPC *)v11;
    goto LABEL_4;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheme"));
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("knox"));

  if (v15)
    operator new[]();
  if (!objc_msgSend(v7, "isFileURL"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheme"));
    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("plugin"));

    if (v24)
    {
      v25 = -[PluginBackendXPC initWithURL:openMode:]([PluginBackendXPC alloc], "initWithURL:openMode:", v7, v6);
      v12 = -[DiskImageParamsXPC initWithBackendXPC:]([DiskImageParamsPlugin_XPC alloc], "initWithBackendXPC:", v25);
      v10 = v25;
      goto LABEL_4;
    }
    v10 = 0;
    v11 = (DiskImageParamsRAM_XPC *)objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, CFSTR("Unsupported URL scheme"), a5));
    goto LABEL_3;
  }
  v10 = +[BackendXPC newFileBackendWithURL:fileOpenFlags:error:](BackendXPC, "newFileBackendWithURL:fileOpenFlags:error:", v7, v6, a5);
  if (!v10)
  {
    v12 = 0;
    goto LABEL_4;
  }
  v16 = *__error();
  if (sub_1000BF0BC())
  {
    lpsrc = 0;
    v17 = sub_1000BF044();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    *(_DWORD *)buf = 68158467;
    if (v19)
      v21 = 3;
    else
      v21 = 2;
    *(_DWORD *)&buf[4] = 53;
    *(_WORD *)v41 = 2080;
    *(_QWORD *)&v41[2] = "+[DiskImageParamsXPC newWithURL:fileOpenFlags:error:]";
    v42 = 2113;
    v43 = v20;
    v44 = 1024;
    v45 = v6;
    v22 = (char *)_os_log_send_and_compose_impl(v21, &lpsrc, 0, 0, &_mh_execute_header, v18, 0, "%.*s: Image file %{private}@ opened with flags %d", buf, 34);

    if (v22)
    {
      fprintf(__stderrp, "%s\n", v22);
      free(v22);
    }
  }
  else
  {
    v26 = sub_1000BF044();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
      *(_DWORD *)buf = 68158467;
      *(_DWORD *)&buf[4] = 53;
      *(_WORD *)v41 = 2080;
      *(_QWORD *)&v41[2] = "+[DiskImageParamsXPC newWithURL:fileOpenFlags:error:]";
      v42 = 2113;
      v43 = v28;
      v44 = 1024;
      v45 = v6;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%.*s: Image file %{private}@ opened with flags %d", buf, 0x22u);

    }
  }
  *__error() = v16;
  -[BackendXPC backend](v10, "backend");
  if (lpsrc
  {
    *(_QWORD *)buf = v29;
    *(_QWORD *)v41 = v39;
    p_lpsrc = &lpsrc;
  }
  else
  {
    p_lpsrc = buf;
  }
  *p_lpsrc = 0;
  p_lpsrc[1] = 0;
  v31 = v39;
  if (v39)
  {
    p_shared_owners = (unint64_t *)&v39->__shared_owners_;
    do
      v33 = __ldaxr(p_shared_owners);
    while (__stlxr(v33 - 1, p_shared_owners));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v12 = *(DiskImageParamsPlugin_XPC **)buf;
  if (*(_QWORD *)buf && sub_1001027E4(*(_QWORD *)(*(_QWORD *)buf + 40)))
  {
    v12 = -[DiskImageParamsXPC initWithBackendXPC:blockSize:]([DiskImageParamsRaw_XPC alloc], "initWithBackendXPC:blockSize:", v10, v12->super._cacheURL->_clients);
    v34 = 0;
  }
  else
  {
    v34 = 1;
  }
  v35 = *(std::__shared_weak_count **)v41;
  if (*(_QWORD *)v41)
  {
    v36 = (unint64_t *)(*(_QWORD *)v41 + 8);
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  if ((v34 & 1) != 0)
  {
    if (-[BackendXPC tryCreatingCryptoHeader](v10, "tryCreatingCryptoHeader"))
      v11 = -[DiskImageParamsLocked_XPC initWithBackendXPC:]([DiskImageParamsLocked_XPC alloc], "initWithBackendXPC:", v10);
    else
      v11 = +[DiskImageParamsXPC newWithUnlockedBackendXPC:error:](DiskImageParamsXPC, "newWithUnlockedBackendXPC:error:", v10, a5);
    goto LABEL_3;
  }
LABEL_4:

  return v12;
}

+ (BOOL)validateSupportedFormatWithBackendXPC:(id)a3 error:(id *)a4
{
  id v4;

  v4 = a3;
  if (v4)
    objc_msgSend(v4, "backend");
  operator new();
}

+ (BOOL)getAEAKeyFromSAKSWithMetadata:(id)a3 key:(char *)a4 error:(id *)a5
{
  id v7;
  BOOL v8;
  CC_LONG v9;
  char v11[88];

  v7 = a3;
  v8 = +[DIKeyRetriever decryptKeyWithData:destKey:destKeySize:error:](DIKeyRetriever, "decryptKeyWithData:destKey:destKeySize:error:", v7, v11, 88, a5);
  if (v8)
  {
    v9 = strnlen(v11, 0x58uLL);
    CC_SHA256(v11, v9, (unsigned __int8 *)a4);
  }

  return v8;
}

+ (BOOL)getAEAKeyWithHelper:(void *)a3 keyBuffer:(char *)a4 bufferSize:(unint64_t)a5 error:(id *)a6
{
  uint64_t v6;
  _QWORD v8[11];
  id *v9;
  unint64_t v10;
  char *v11;
  id v12;
  _QWORD *v13;

  v11 = a4;
  v12 = a1;
  v9 = a6;
  v10 = a5;
  v8[0] = &v11;
  v8[1] = &v10;
  v8[2] = &v9;
  v8[3] = &v12;
  v8[4] = &v11;
  v8[5] = &v9;
  v8[6] = &v11;
  v8[7] = &v10;
  v8[8] = &v9;
  v8[9] = &v11;
  v8[10] = &v10;
  v6 = *((unsigned int *)a3 + 10);
  if ((_DWORD)v6 == -1)
    sub_100018028();
  v13 = v8;
  return ((uint64_t (*)(_QWORD **, char *))off_10017FBF0[v6])(&v13, (char *)a3 + 8);
}

+ (id)createAEABackendWithBackendXPC:(id)a3 error:(id *)a4
{
  id v4;
  __int128 v5;
  _OWORD v7[3];
  __int128 v8;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(v4, "backend");
    v5 = v7[0];
  }
  else
  {
    v5 = 0uLL;
  }
  v8 = v5;
  sub_1000EB8CC(v7, &v8);
  operator new[]();
}

+ (id)tryCreateAEABackendWithBackendXPC:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void **p_lpsrc;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  int v12;
  int v13;
  void *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  _QWORD *exception;
  const std::error_category *v20;
  void *lpsrc;
  std::__shared_weak_count *v22;
  void *v23;
  std::__shared_weak_count *v24;
  AAByteStream v25;

  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    lpsrc = 0;
    v22 = 0;
LABEL_6:
    p_lpsrc = &v23;
    goto LABEL_7;
  }
  objc_msgSend(v5, "backend");
  if (!lpsrc)
    goto LABEL_6;
  if (!v7)
    goto LABEL_6;
  v23 = v7;
  v24 = v22;
  p_lpsrc = &lpsrc;
LABEL_7:
  *p_lpsrc = 0;
  p_lpsrc[1] = 0;
  v9 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  if (!v23)
    goto LABEL_15;
  v12 = (*(uint64_t (**)(void *))(*(_QWORD *)v23 + 176))(v23);
  v25 = AAFileStreamOpenWithFD(v12, 0);
  sub_1000ED388(&lpsrc, &v25);
  if (sub_1000ED3B8((AAByteStream *)&lpsrc, &v25, 4uLL, 0) < 0)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    *exception = &off_1001924F8;
    v20 = std::generic_category();
    exception[1] = 22;
    exception[2] = v20;
    *((_BYTE *)exception + 24) = 0;
    *((_BYTE *)exception + 48) = 0;
    exception[7] = "is_aea: Error reading magic.";
  }
  v13 = (int)v25;
  sub_1000ED38C((AAByteStream *)&lpsrc);
  if (v13 == 826361153)
  {
    v14 = v6;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[DiskImageParamsXPC createAEABackendWithBackendXPC:error:](DiskImageParamsXPC, "createAEABackendWithBackendXPC:error:", v6, a4));
  }
  else
  {
LABEL_15:
    v14 = 0;
  }
  v15 = v24;
  if (v24)
  {
    v16 = (unint64_t *)&v24->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }

  return v6;
}

+ (id)newWithUnlockedBackendXPC:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  DiskImageParamsSparseBundle_XPC *v9;
  void *v10;

  v6 = a3;
  v8 = objc_opt_class(SparseBundleBackendXPC, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v9 = -[DiskImageParamsXPC initWithBackendXPC:]([DiskImageParamsSparseBundle_XPC alloc], "initWithBackendXPC:", v6);
    v10 = v6;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tryCreateAEABackendWithBackendXPC:error:", v6, a4));

    if (v10)
    {
      objc_msgSend(v10, "backend");
      operator new();
    }
    v9 = 0;
  }

  return v9;
}

- (NSURL)cacheURL
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  NSURL *v8;
  NSURL *cacheURL;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
  v4 = objc_msgSend(v3, "hasBaseImageCache");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nodes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
    cacheURL = self->_cacheURL;
    self->_cacheURL = v8;

  }
  return self->_cacheURL;
}

- (BOOL)makeNewImageEncryptedWithCertificate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v8 = objc_msgSend(v7, "newUnlockedBackendXPCWithPassphrase:certificate:isNewImage:error:", 0, v6, 1, a4);
  -[DiskImageParamsXPC setBackendXPC:](self, "setBackendXPC:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  LOBYTE(a4) = v9 != 0;

  return (char)a4;
}

- (BOOL)makeNewImageEncryptedWithPassphrase:(const char *)a3 certificate:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v10 = objc_msgSend(v9, "newUnlockedBackendXPCWithPassphrase:certificate:isNewImage:error:", a3, v8, 1, a5);
  -[DiskImageParamsXPC setBackendXPC:](self, "setBackendXPC:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  LOBYTE(a5) = v11 != 0;

  return (char)a5;
}

- (DiskImageParamsXPC)initWithBackendXPC:(id)a3 blockSize:(unint64_t)a4
{
  id v7;
  DiskImageParamsXPC *v8;
  DiskImageParamsXPC *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DiskImageParamsXPC;
  v8 = -[DiskImageParamsXPC init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_backendXPC, a3);
    v9->_blockSize = a4;
  }

  return v9;
}

- (DiskImageParamsXPC)initWithBackendXPC:(id)a3
{
  return -[DiskImageParamsXPC initWithBackendXPC:blockSize:](self, "initWithBackendXPC:blockSize:", a3, 512);
}

- (shared_ptr<DiskImage>)createShadowDiskImageWithBackend:(shared_ptr<Backend>)a3 numBlocks:(unint64_t)a4 sinkDiskImage:(const void *)a5 cache_only:(BOOL)a6 stack_size:(unint64_t)a7
{
  uint64_t *v7;
  unint64_t v8;
  int v9;
  __shared_weak_count *cntrl;
  Backend *ptr;
  uint64_t *v13;
  int v14;
  DiskImage *v15;
  __shared_weak_count *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  void *exception;
  uint64_t v23;
  _QWORD *v24;
  const std::error_category *v25;
  _QWORD *v26;
  const std::error_category *v27;
  uint64_t v28;
  __shared_weak_count *v29;
  unint64_t v30;
  char v31;
  _BYTE v32[11];
  char v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[33];
  shared_ptr<DiskImage> result;

  v8 = a6;
  v9 = (int)a5;
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v13 = v7;
  if ((*(uint64_t (**)(unint64_t, SEL))(*(_QWORD *)a4 + 24))(a4, a2) != 512)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    sub_100005920((uint64_t)v36);
    sub_100005A0C(v36, (uint64_t)"Shadow file cannot be used with a ", 34);
    v23 = (*(uint64_t (**)(unint64_t))(*(_QWORD *)a4 + 24))(a4);
    std::ostream::operator<<(v36, v23);
    sub_100005A0C(v36, (uint64_t)"-bytes block size", 17);
    sub_100012294((uint64_t)exception, (uint64_t)v36, 0x13u);
  }
  v31 = 0;
  *(_DWORD *)&v32[7] = 0;
  *(_QWORD *)v32 = 256;
  v14 = *((_DWORD *)sub_1000388D4() + 8);
  *(_DWORD *)&v32[3] = (v14 - (v8 > 3)) & ~((v14 - (v8 > 3)) >> 31);
  v32[7] = 1;
  if (!(*(uint64_t (**)(_QWORD))(**(_QWORD **)ptr + 40))(*(_QWORD *)ptr))
  {
    v30 = 0;
    v18 = 0x10000000000000uLL / (*(uint64_t (**)(unint64_t))(*(_QWORD *)a4 + 24))(a4);
    v29 = 0;
    v30 = v18;
    if (!cntrl)
    {
      cntrl = (__shared_weak_count *)(*(uint64_t (**)(unint64_t))(*(_QWORD *)a4 + 32))(a4);
      v18 = v30;
    }
    v29 = cntrl;
    if ((unint64_t)cntrl <= v18)
    {
      v36[0] = sub_100120770();
      v36[1] = v19;
      v34 = sub_10005B13C((uint64_t (***)(_QWORD))a4);
      v35 = v20;
      v28 = (*(uint64_t (**)(unint64_t))(*(_QWORD *)a4 + 24))(a4);
      v32[0] = v9;
      if (v9)
        v21 = &v34;
      else
        v21 = v36;
      sub_10009388C((uint64_t)&v33, (unsigned __int16 *)&v28, &dword_1001438AC, (unint64_t *)&v29, &v30, ptr, (uint64_t *)&v31, v21);
    }
    v26 = __cxa_allocate_exception(0x40uLL);
    *v26 = &off_1001924F8;
    v27 = std::generic_category();
    v26[1] = 22;
    v26[2] = v27;
    *((_BYTE *)v26 + 24) = 0;
    *((_BYTE *)v26 + 48) = 0;
    v26[7] = "Size cannot exceed max ASIF size";
  }
  sub_1000D11F8(v36, *(_QWORD *)ptr);
  v15 = (DiskImage *)sub_10009374C((uint64_t *)ptr, (uint64_t)v36, (uint64_t)&v31, &v34);
  if (((((*(_BYTE *)(v34 + 44) & 1) == 0) ^ v9) & 1) == 0)
  {
    v24 = __cxa_allocate_exception(0x40uLL);
    *v24 = &off_1001924F8;
    v25 = std::generic_category();
    v24[1] = 22;
    v24[2] = v25;
    *((_BYTE *)v24 + 24) = 0;
    *((_BYTE *)v24 + 48) = 0;
    v24[7] = "Shadow/cache file mismatches the cache file attribute";
  }
  v17 = v35;
  *v13 = v34;
  v13[1] = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (BOOL)allowOnDiskCacheWithSinkDiskImage:(const void *)a3
{
  void *v3;
  unsigned __int8 v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v13;
  uint64_t v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain", a3));
  v4 = objc_msgSend(v3, "hasBaseImageCache");

  if ((v4 & 1) == 0)
  {
    v5 = *__error();
    if (sub_1000BF0BC())
    {
      v14 = 0;
      v6 = sub_1000BF044();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        v8 = 3;
      else
        v8 = 2;
      *(_DWORD *)buf = 68157954;
      v16 = 56;
      v17 = 2080;
      v18 = "-[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:]";
      LODWORD(v13) = 18;
      v9 = (char *)_os_log_send_and_compose_impl(v8, &v14, 0, 0, &_mh_execute_header, v7, 0, "%.*s: On disk cache is not supported on embedded systems", (int)buf, v13);

      if (v9)
      {
        fprintf(__stderrp, "%s\n", v9);
        free(v9);
      }
    }
    else
    {
      v10 = sub_1000BF044();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v16 = 56;
        v17 = 2080;
        v18 = "-[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%.*s: On disk cache is not supported on embedded systems", buf, 0x12u);
      }

    }
    *__error() = v5;
  }
  return 0;
}

- (unique_ptr<const)getImageInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  _QWORD *v4;
  _BOOL4 v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v5 = a3;
  v6 = v4;
  -[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:](self, "createDiskImageWithCache:shadowValidation:", 0, 0);
  v7 = v10;
  if (v5)
    v8 = 7;
  else
    v8 = 0;
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(_QWORD *)v10 + 48))(&v10, v10, v8);
  *v6 = v10;
  return (unique_ptr<const info::DiskImageInfo, std::default_delete<const info::DiskImageInfo>>)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7);
}

- (unique_ptr<DiskImage,)createDiskImageWithCache:(BOOL)a3 shadowValidation:(BOOL)a4
{
  _QWORD *v4;
  _BOOL4 v5;
  unique_ptr<DiskImage, std::default_delete<DiskImage>> v6;
  DiskImage *var0;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  int v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  char *v44;
  uint64_t v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id v49;
  unint64_t *v50;
  unint64_t v51;
  uint64_t (***v52)(_QWORD);
  void *v53;
  void *v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  std::__shared_weak_count *v64;
  unint64_t *v65;
  unint64_t v66;
  int v67;
  unint64_t *v68;
  unint64_t v69;
  std::__shared_weak_count *v70;
  unint64_t *v71;
  unint64_t v72;
  _QWORD *exception;
  const std::error_category *v74;
  uint64_t v75;
  _QWORD *v76;
  unsigned int v77;
  id obj;
  uint64_t v80;
  std::__shared_weak_count *v81;
  __int128 v82;
  uint64_t v83;
  std::__shared_weak_count *v84;
  uint64_t v85;
  std::__shared_weak_count *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[2];
  uint64_t (***v92)(_QWORD);
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t (***v97)(_QWORD);
  _BYTE buf[20];
  void *v99;
  uint64_t v100;
  uint64_t v101;
  char v102[16];
  int v103;
  _BYTE v104[128];

  v5 = a3;
  v76 = v4;
  -[DiskImageParamsXPC createSinkDiskImage](self, "createSinkDiskImage");
  if (v5)
    v77 = -[DiskImageParamsXPC allowOnDiskCacheWithSinkDiskImage:](self, "allowOnDiskCacheWithSinkDiskImage:", &v97);
  else
    v77 = 0;
  v6.var0.var0 = (DiskImage *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
  var0 = v6.var0.var0;
  if (v6.var0.var0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
    v9 = objc_msgSend(v8, "isEmpty");

    if (((v9 ^ 1 | v77) & 1) != 0)
      goto LABEL_6;
  }
  else if ((v77 & 1) != 0)
  {
LABEL_6:
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v92 = v97;
    if (v97)
      operator new();
    v93 = 0;
    v97 = 0;
    v91[0] = 0;
    v91[1] = 0;
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nodes"));

    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v88 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fileBackend"));
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "backend");
          }
          else
          {
            v85 = 0;
            v86 = 0;
          }
          v17 = objc_msgSend(v14, "numBlocks");
          v18 = v91[0];
          v19 = objc_msgSend(v14, "isCache");
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "nodes"));
          -[DiskImageParamsXPC createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:](self, "createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:", &v85, v17, v18, v19, (char *)objc_msgSend(v21, "count") + 1);

          v22 = v86;
          if (v86)
          {
            p_shared_owners = (unint64_t *)&v86->__shared_owners_;
            do
              v24 = __ldaxr(p_shared_owners);
            while (__stlxr(v24 - 1, p_shared_owners));
            if (!v24)
            {
              ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
              std::__shared_weak_count::__release_weak(v22);
            }
          }

          if ((objc_msgSend(v14, "isCache") & 1) != 0)
          {
            v25 = 2;
          }
          else
          {
            v25 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)buf + 40))(*(_QWORD *)buf) ^ 1;
            sub_100027CB4(v91, (uint64_t *)buf);
          }
          *(_OWORD *)v102 = *(_OWORD *)buf;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          v103 = v25;
          sub_10008EB58(&v94, v94, (__n128 *)v102);
          v26 = *(std::__shared_weak_count **)&v102[8];
          if (*(_QWORD *)&v102[8])
          {
            v27 = (unint64_t *)(*(_QWORD *)&v102[8] + 8);
            do
              v28 = __ldaxr(v27);
            while (__stlxr(v28 - 1, v27));
            if (!v28)
            {
              ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
              std::__shared_weak_count::__release_weak(v26);
            }
          }
          v29 = *(std::__shared_weak_count **)&buf[8];
          if (*(_QWORD *)&buf[8])
          {
            v30 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
            do
              v31 = __ldaxr(v30);
            while (__stlxr(v31 - 1, v30));
            if (!v31)
            {
              ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
              std::__shared_weak_count::__release_weak(v29);
            }
          }
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
      }
      while (v11);
    }

    if (v77)
    {
      if (!confstr(65538, v102, 0x400uLL))
      {
        exception = __cxa_allocate_exception(0x40uLL);
        *exception = &off_1001924F8;
        v74 = std::generic_category();
        exception[1] = 2;
        exception[2] = v74;
        *((_BYTE *)exception + 24) = 0;
        *((_BYTE *)exception + 48) = 0;
        exception[7] = "Could not determine cache dir";
      }
      v100 = 0;
      v101 = 0;
      v100 = sub_10005B13C(v92);
      v101 = v32;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      if (v100 | v32)
        v33 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &v100);
      else
        v33 = (id)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC instanceID](self, "instanceID"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "UUIDString"));

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@.%@"), CFSTR("diskimage_"), v34, CFSTR("cache")));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v102, 1, 0));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "URLByAppendingPathComponent:", v35));
      -[DiskImageParamsXPC setCacheURL:](self, "setCacheURL:", v37);

      v38 = *__error();
      if (sub_1000BF0BC())
      {
        v83 = 0;
        v39 = sub_1000BF044();
        v40 = objc_claimAutoreleasedReturnValue(v39);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          v41 = 3;
        else
          v41 = 2;
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC cacheURL](self, "cacheURL"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "path"));
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&buf[4] = 64;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "-[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:]";
        *(_WORD *)&buf[18] = 2114;
        v99 = v43;
        LODWORD(v75) = 28;
        v44 = (char *)_os_log_send_and_compose_impl(v41, &v83, 0, 0, &_mh_execute_header, v40, 0, "%.*s: On disk cache path: %{public}@", buf, v75);

        if (v44)
        {
          fprintf(__stderrp, "%s\n", v44);
          free(v44);
        }
      }
      else
      {
        v45 = sub_1000BF044();
        v46 = objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC cacheURL](self, "cacheURL"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "path"));
          *(_DWORD *)buf = 68158210;
          *(_DWORD *)&buf[4] = 64;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = "-[DiskImageParamsXPC createDiskImageWithCache:shadowValidation:]";
          *(_WORD *)&buf[18] = 2114;
          v99 = v48;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%.*s: On disk cache path: %{public}@", buf, 0x1Cu);

        }
      }
      *__error() = v38;
      v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC cacheURL](self, "cacheURL")));
      *(_QWORD *)buf = objc_msgSend(v49, "fileSystemRepresentation");
      sub_1000939E4((char **)buf, &v83);

      v80 = v83;
      v81 = v84;
      if (v84)
      {
        v50 = (unint64_t *)&v84->__shared_owners_;
        do
          v51 = __ldxr(v50);
        while (__stxr(v51 + 1, v50));
      }
      v52 = v92;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "nodes"));
      -[DiskImageParamsXPC createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:](self, "createShadowDiskImageWithBackend:numBlocks:sinkDiskImage:cache_only:stack_size:", &v80, 0, v52, 1, (char *)objc_msgSend(v54, "count") + 1);

      v55 = v81;
      if (v81)
      {
        v56 = (unint64_t *)&v81->__shared_owners_;
        do
          v57 = __ldaxr(v56);
        while (__stlxr(v57 - 1, v56));
        if (!v57)
        {
          ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
          std::__shared_weak_count::__release_weak(v55);
        }
      }
      *(_OWORD *)buf = v82;
      v82 = 0uLL;
      *(_DWORD *)&buf[16] = 2;
      sub_10008ECC4(&v94, (uint64_t)buf);
      v58 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v59 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v60 = __ldaxr(v59);
        while (__stlxr(v60 - 1, v59));
        if (!v60)
        {
          ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
          std::__shared_weak_count::__release_weak(v58);
        }
      }
      v61 = (std::__shared_weak_count *)*((_QWORD *)&v82 + 1);
      if (*((_QWORD *)&v82 + 1))
      {
        v62 = (unint64_t *)(*((_QWORD *)&v82 + 1) + 8);
        do
          v63 = __ldaxr(v62);
        while (__stlxr(v63 - 1, v62));
        if (!v63)
        {
          ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
          std::__shared_weak_count::__release_weak(v61);
        }
      }
      v64 = v84;
      if (v84)
      {
        v65 = (unint64_t *)&v84->__shared_owners_;
        do
          v66 = __ldaxr(v65);
        while (__stlxr(v66 - 1, v65));
        if (!v66)
        {
          ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
          std::__shared_weak_count::__release_weak(v64);
        }
      }

    }
    v67 = (*v92)[5](v92) ^ 1;
    if (v94 != v95)
      v67 = 1;
    *(_QWORD *)v102 = v92;
    *(_QWORD *)&v102[8] = v93;
    if (v93)
    {
      v68 = (unint64_t *)(v93 + 8);
      do
        v69 = __ldxr(v68);
      while (__stxr(v69 + 1, v68));
    }
    v103 = v67;
    sub_10008ECC4(&v94, (uint64_t)v102);
    v70 = *(std::__shared_weak_count **)&v102[8];
    if (*(_QWORD *)&v102[8])
    {
      v71 = (unint64_t *)(*(_QWORD *)&v102[8] + 8);
      do
        v72 = __ldaxr(v71);
      while (__stlxr(v72 - 1, v71));
      if (!v72)
      {
        ((void (*)(std::__shared_weak_count *))v70->__on_zero_shared)(v70);
        std::__shared_weak_count::__release_weak(v70);
      }
    }
    operator new();
  }
  *v76 = v97;
  return v6;
}

- (int)setSizeWithDiskImage:(const void *)a3 newSize:(unint64_t)a4
{
  return (*(uint64_t (**)(_QWORD, unint64_t))(**(_QWORD **)a3 + 64))(*(_QWORD *)a3, a4);
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  _QWORD *v2;

  *v2 = 0;
  return (unique_ptr<DiskImage, std::default_delete<DiskImage>>)self;
}

- (BOOL)lockBackendsWithWritableOnly:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  BOOL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a3;
  if (-[DiskImageParamsXPC isWritableFormat](self, "isWritableFormat") || !v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
    v8 = objc_msgSend(v7, "lock");

    if ((_DWORD)v8)
      return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", v8, CFSTR("Failed locking the image"), a4);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));

  if (v10)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain", 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nodes"));

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "fileBackend"));
          v17 = objc_msgSend(v16, "lock");

          if ((_DWORD)v17)
          {
            v18 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", v17, CFSTR("Failed locking the shadow file"), a4);

            return v18;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v13)
          continue;
        break;
      }
    }

  }
  return 1;
}

- (BOOL)lockBackendsWithError:(id *)a3
{
  return -[DiskImageParamsXPC lockBackendsWithWritableOnly:error:](self, "lockBackendsWithWritableOnly:error:", 0, a3);
}

- (BOOL)lockWritableBackendsWithError:(id *)a3
{
  return -[DiskImageParamsXPC lockBackendsWithWritableOnly:error:](self, "lockBackendsWithWritableOnly:error:", 1, a3);
}

- (BOOL)isWritableFormat
{
  return 0;
}

- (BOOL)isSparseFormat
{
  return 0;
}

- (unint64_t)numBlocks
{
  return 0;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[%@]"), v5, v7));

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DiskImageParamsXPC)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  BackendXPC *v7;
  BackendXPC *backendXPC;
  uint64_t v9;
  id v10;
  DIShadowChain *v11;
  DIShadowChain *shadowChain;
  uint64_t v13;
  id v14;
  NSUUID *v15;
  NSUUID *instanceID;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(BackendXPC, v5), CFSTR("backend"));
  v7 = (BackendXPC *)objc_claimAutoreleasedReturnValue(v6);
  backendXPC = self->_backendXPC;
  self->_backendXPC = v7;

  v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DIShadowChain, v9), CFSTR("shadowChain"));
  v11 = (DIShadowChain *)objc_claimAutoreleasedReturnValue(v10);
  shadowChain = self->_shadowChain;
  self->_shadowChain = v11;

  self->_blockSize = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("blockSize"));
  v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v13), CFSTR("instanceID"));
  v15 = (NSUUID *)objc_claimAutoreleasedReturnValue(v14);
  instanceID = self->_instanceID;
  self->_instanceID = v15;

  return self;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("backend"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("shadowChain"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[DiskImageParamsXPC blockSize](self, "blockSize"), CFSTR("blockSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC instanceID](self, "instanceID"));
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("instanceID"));

}

- (NSUUID)instanceID
{
  NSUUID *instanceID;
  void *v5;
  NSUUID *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  void *v15;
  NSUUID *v16;
  NSUUID *v17;
  NSUUID *v18;
  id v19;
  uint64_t v20;
  NSUUID *v21;
  NSUUID **p_instanceID;
  NSUUID *v23;
  uint64_t v24;
  _QWORD v25[2];

  instanceID = self->_instanceID;
  if (instanceID)
    return instanceID;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v6 = (NSUUID *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "instanceID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC shadowChain](self, "shadowChain"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nonCacheNodes"));

    if (v9 && objc_msgSend(v9, "count"))
    {
      v24 = (uint64_t)&v24;
      v10 = 16 * (_QWORD)objc_msgSend(v9, "count") + 16;
      -[NSUUID getUUIDBytes:](v6, "getUUIDBytes:", (char *)&v25[-1] - v10);
      v11 = 0;
      v12 = (char *)&v25[1] - v10;
      while ((unint64_t)objc_msgSend(v9, "count") > v11)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", v11));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fileBackend"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "instanceID"));

        objc_msgSend(v15, "getUUIDBytes:", v12);
        v12 += 16;
        ++v11;
      }
      v19 = objc_alloc((Class)NSUUID);
      v25[0] = sub_100120674((char *)&v25[-1] - v10, v10);
      v25[1] = v20;
      v21 = (NSUUID *)objc_msgSend(v19, "initWithUUIDBytes:", v25);
      v23 = self->_instanceID;
      p_instanceID = &self->_instanceID;
      *p_instanceID = v21;

      instanceID = *p_instanceID;
      return instanceID;
    }
  }
  else
  {
    v9 = 0;
  }
  v16 = self->_instanceID;
  self->_instanceID = v6;
  v17 = v6;

  v18 = self->_instanceID;
  return v18;
}

- (BOOL)mountedOnAPFS
{
  void *v2;
  void *v3;
  _QWORD *v4;
  void **p_lpsrc;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  BOOL v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  void *lpsrc;
  std::__shared_weak_count *v20;
  _QWORD *v21;
  std::__shared_weak_count *v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageParamsXPC backendXPC](self, "backendXPC"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "backend");
  }
  else
  {
    v17 = 0;
    v18 = 0;
  }
  sub_10011E808((uint64_t)&v17, &lpsrc);
  if (lpsrc
  {
    v21 = v4;
    v22 = v20;
    p_lpsrc = &lpsrc;
  }
  else
  {
    p_lpsrc = (void **)&v21;
  }
  *p_lpsrc = 0;
  p_lpsrc[1] = 0;
  v6 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v9 = v18;
  if (v18)
  {
    v10 = (unint64_t *)&v18->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }

  if (v21)
    v12 = sub_100092AD4(v21[5]);
  else
    v12 = 0;
  v13 = v22;
  if (v22)
  {
    v14 = (unint64_t *)&v22->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  return v12;
}

- (BackendXPC)backendXPC
{
  return self->_backendXPC;
}

- (void)setBackendXPC:(id)a3
{
  objc_storeStrong((id *)&self->_backendXPC, a3);
}

- (DIShadowChain)shadowChain
{
  return self->_shadowChain;
}

- (void)setShadowChain:(id)a3
{
  objc_storeStrong((id *)&self->_shadowChain, a3);
}

- (BackendXPC)cacheBackendXPC
{
  return self->_cacheBackendXPC;
}

- (void)setCacheBackendXPC:(id)a3
{
  objc_storeStrong((id *)&self->_cacheBackendXPC, a3);
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (void)setBlockSize:(unint64_t)a3
{
  self->_blockSize = a3;
}

- (void)setCacheURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setInstanceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_cacheBackendXPC, 0);
  objc_storeStrong((id *)&self->_shadowChain, 0);
  objc_storeStrong((id *)&self->_backendXPC, 0);
}

@end
