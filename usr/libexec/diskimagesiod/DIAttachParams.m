@implementation DIAttachParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIAttachParams)initWithCoder:(id)a3
{
  id v4;
  DIAttachParams *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  DIStatFS *inputStatFS;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *inputMountedFrom;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DIAttachParams;
  v5 = -[DIBaseParams initWithCoder:](&v15, "initWithCoder:", v4);
  if (v5)
  {
    v5->_autoMount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoMount"));
    v5->_commandSize = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("commandSize"));
    v5->_regEntryID = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("regEntryID"));
    v5->_handleRefCount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("handleRefCount"));
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DIStatFS, v6), CFSTR("inputStatFS"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    inputStatFS = v5->_inputStatFS;
    v5->_inputStatFS = (DIStatFS *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("inputMountedFrom"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    inputMountedFrom = v5->_inputMountedFrom;
    v5->_inputMountedFrom = (NSString *)v12;

    v5->_fileMode = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fileMode"));
    v5->_onDiskCache = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("onDiskCache"));
    v5->_uniqueDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("uniqueDevice"));
    v5->_emulateExternalDisk = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("emulateExternalDisk"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DIAttachParams;
  -[DIBaseParams encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams autoMount](self, "autoMount"), CFSTR("autoMount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIAttachParams commandSize](self, "commandSize"), CFSTR("commandSize"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[DIAttachParams regEntryID](self, "regEntryID"), CFSTR("regEntryID"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams handleRefCount](self, "handleRefCount"), CFSTR("handleRefCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachParams inputStatFS](self, "inputStatFS"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("inputStatFS"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[DIAttachParams fileMode](self, "fileMode"), CFSTR("fileMode"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams onDiskCache](self, "onDiskCache"), CFSTR("onDiskCache"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams uniqueDevice](self, "uniqueDevice"), CFSTR("uniqueDevice"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DIAttachParams emulateExternalDisk](self, "emulateExternalDisk"), CFSTR("emulateExternalDisk"));

}

- (void)setupDefaults
{
  NSURL *customCacheURL;

  self->_fileMode = 1;
  self->_autoMount = !-[DIBaseParams RAMdisk](self, "RAMdisk");
  self->_onDiskCache = 0;
  customCacheURL = self->_customCacheURL;
  self->_customCacheURL = 0;

}

- (void)setCustomCacheURL:(id)a3
{
  objc_storeStrong((id *)&self->_customCacheURL, a3);
  self->_onDiskCache = a3 != 0;
}

- (void)setOnDiskCache:(BOOL)a3
{
  NSURL *customCacheURL;

  self->_onDiskCache = a3;
  if (!a3)
  {
    customCacheURL = self->_customCacheURL;
    self->_customCacheURL = 0;

  }
}

- (DIAttachParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  DIAttachParams *v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v8 = -[DIAttachParams initWithURL:shadowURLs:error:](self, "initWithURL:shadowURLs:error:", v6, v7, a4);

  return v8;
}

- (DIAttachParams)initWithURL:(id)a3 shadowURLs:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  DIAttachParams *v10;
  DIAttachParams *v11;
  DIAttachParams *v12;
  void *v13;
  unsigned __int8 v14;
  DIAttachParams *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)DIAttachParams;
  v10 = -[DIBaseParams initWithURL:error:](&v17, "initWithURL:error:", v8, a5);
  v11 = v10;
  if (!v10)
    goto LABEL_7;
  if (!-[DIBaseParams openExistingImageWithFlags:error:](v10, "openExistingImageWithFlags:error:", 0, a5))
    goto LABEL_9;
  -[DIAttachParams setupDefaults](v11, "setupDefaults");
  if (!objc_msgSend(v9, "count"))
  {
LABEL_7:
    v12 = v11;
    goto LABEL_8;
  }
  if (!-[DIBaseParams isPstack](v11, "isPstack"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](v11, "shadowChain"));
    v14 = objc_msgSend(v13, "addShadowURLs:error:", v9, a5);

    if ((v14 & 1) != 0)
      goto LABEL_7;
LABEL_9:
    v15 = 0;
    goto LABEL_10;
  }
  v12 = (DIAttachParams *)objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Custom cache or shadow is not supported for pstack based images."), a5));
LABEL_8:
  v15 = v12;
LABEL_10:

  return v15;
}

- (DIAttachParams)initWithExistingParams:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  DIAttachParams *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  DIAttachParams *v14;
  objc_super v16;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputURL"));
  v16.receiver = self;
  v16.super_class = (Class)DIAttachParams;
  v8 = -[DIBaseParams initWithURL:error:](&v16, "initWithURL:error:", v7, a4);

  if (!v8)
    goto LABEL_3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "diskImageParamsXPC"));
  -[DIBaseParams setDiskImageParamsXPC:](v8, "setDiskImageParamsXPC:", v9);

  -[DIAttachParams setupDefaults](v8, "setupDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](v8, "shadowChain"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shadowChain"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nodes"));
  v13 = objc_msgSend(v10, "addShadowNodes:error:", v12, a4);

  if ((v13 & 1) == 0)
    v14 = 0;
  else
LABEL_3:
    v14 = v8;

  return v14;
}

- (BOOL)shouldValidateShadows
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  v3 = objc_msgSend(v2, "shouldValidate");

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  objc_msgSend(v4, "setShouldValidate:", v3);

}

- (BOOL)reOpenIfWritableWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  char v12;
  char v13;
  unint64_t *v14;
  unint64_t v15;
  void *v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  char *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  int64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  PluginBackendXPC *v34;
  void *v35;
  PluginBackendXPC *v36;
  PluginBackendXPC *v37;
  void *v38;
  PluginBackendXPC *v39;
  int v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  char *v50;
  void *v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint8_t buf[8];
  _BYTE v57[10];
  __int16 v58;
  const char *v59;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  if (objc_msgSend(v5, "isFileURL"))
  {

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    v8 = objc_opt_class(DiskImageParamsPlugin_XPC, v7);
    isKindOfClass = objc_opt_isKindOfClass(v6, v8);

    if ((isKindOfClass & 1) == 0)
      return 1;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeShadowURL"));

  if (!v11)
  {
    -[DIBaseParams backend](self, "backend");
    v12 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)buf + 48))(*(_QWORD *)buf);
    v13 = v12;
    if (!*(_QWORD *)v57)
      goto LABEL_9;
    v14 = (unint64_t *)(*(_QWORD *)v57 + 8);
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      (*(void (**)(_QWORD))(**(_QWORD **)v57 + 16))(*(_QWORD *)v57);
      std::__shared_weak_count::__release_weak(*(std::__shared_weak_count **)v57);
      if ((v13 & 1) != 0)
        return 1;
    }
    else
    {
LABEL_9:
      if ((v12 & 1) != 0)
        return 1;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    v19 = objc_msgSend(v18, "isWritableFormat");

    v20 = *__error();
    if (sub_1000BF0BC())
    {
      v55 = 0;
      v21 = sub_1000BF044();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        v23 = 3;
      else
        v23 = 2;
      v24 = "NO";
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 44;
      *(_QWORD *)&v57[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
      *(_WORD *)v57 = 2080;
      if (v19)
        v24 = "YES";
      v58 = 2080;
      v59 = v24;
      LODWORD(v53) = 28;
      v25 = (char *)_os_log_send_and_compose_impl(v23, &v55, 0, 0, &_mh_execute_header, v22, 0, "%.*s: isWritableFormat: %s", (int)buf, v53, v54);

      if (v25)
      {
        fprintf(__stderrp, "%s\n", v25);
        free(v25);
      }
    }
    else
    {
      v26 = sub_1000BF044();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = "NO";
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&buf[4] = 44;
        *(_QWORD *)&v57[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
        *(_WORD *)v57 = 2080;
        if (v19)
          v28 = "YES";
        v58 = 2080;
        v59 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%.*s: isWritableFormat: %s", buf, 0x1Cu);
      }

    }
    *__error() = v20;
    v29 = -[DIAttachParams fileMode](self, "fileMode");
    if ((v19 & 1) != 0)
    {
      if (v29 != 2)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
        v32 = objc_opt_class(DiskImageParamsPlugin_XPC, v31);
        v33 = objc_opt_isKindOfClass(v30, v32);

        if ((v33 & 1) != 0)
        {
          v34 = [PluginBackendXPC alloc];
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
          v36 = -[PluginBackendXPC initWithURL:openMode:](v34, "initWithURL:openMode:", v35, 2);

          v37 = v36;
        }
        else
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
          v39 = +[BackendXPC newFileBackendWithURL:fileOpenFlags:error:](BackendXPC, "newFileBackendWithURL:fileOpenFlags:error:", v38, 2, a3);

          v37 = v39;
          if (!v39)
            return 0;
        }
        v40 = *__error();
        if (sub_1000BF0BC())
        {
          v55 = 0;
          v41 = sub_1000BF044();
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            v43 = 3;
          else
            v43 = 2;
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
          v45 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "path"));
          *(_DWORD *)buf = 68158211;
          *(_DWORD *)&buf[4] = 44;
          *(_WORD *)v57 = 2080;
          *(_QWORD *)&v57[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
          v58 = 2113;
          v59 = v45;
          LODWORD(v53) = 28;
          v46 = (char *)_os_log_send_and_compose_impl(v43, &v55, 0, 0, &_mh_execute_header, v42, 0, "%.*s: Image %{private}@ re-opened with RW permissions", buf, v53);

          if (v46)
          {
            fprintf(__stderrp, "%s\n", v46);
            free(v46);
          }
        }
        else
        {
          v47 = sub_1000BF044();
          v48 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
            v50 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "path"));
            *(_DWORD *)buf = 68158211;
            *(_DWORD *)&buf[4] = 44;
            *(_WORD *)v57 = 2080;
            *(_QWORD *)&v57[2] = "-[DIAttachParams reOpenIfWritableWithError:]";
            v58 = 2113;
            v59 = v50;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%.*s: Image %{private}@ re-opened with RW permissions", buf, 0x1Cu);

          }
        }
        *__error() = v40;
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "backendXPC"));
        objc_msgSend(v52, "replaceWithBackendXPC:", v37);

      }
    }
    else if (v29 == 4)
    {
      return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Image has a read-only format, attach failed due to force RW flag"), a3);
    }
  }
  return 1;
}

- (BOOL)updateStatFSWithError:(id *)a3
{
  void *v5;
  unsigned int v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  DIStatFS *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v23;
  std::__shared_weak_count *v24;
  uint64_t v25;
  std::__shared_weak_count *v26;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  v6 = objc_msgSend(v5, "isFileURL");

  if (v6)
  {
    -[DIBaseParams backend](self, "backend");
    sub_10011E808((uint64_t)&v23, &v25);
    v7 = sub_100105254((uint64_t)&v25);
    v8 = v26;
    if (v26)
    {
      p_shared_owners = (unint64_t *)&v26->__shared_owners_;
      do
        v10 = __ldaxr(p_shared_owners);
      while (__stlxr(v10 - 1, p_shared_owners));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
        std::__shared_weak_count::__release_weak(v8);
      }
    }
    v11 = v24;
    if (!v24)
      goto LABEL_11;
    v12 = (unint64_t *)&v24->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
      if ((v7 & 0x80000000) == 0)
        goto LABEL_12;
    }
    else
    {
LABEL_11:
      if ((v7 & 0x80000000) == 0)
      {
LABEL_12:
        v14 = -[DIStatFS initWithFileDescriptor:error:]([DIStatFS alloc], "initWithFileDescriptor:error:", v7, a3);
        -[DIAttachParams setInputStatFS:](self, "setInputStatFS:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachParams inputStatFS](self, "inputStatFS"));
        if (!v15)
          return 0;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachParams inputStatFS](self, "inputStatFS"));
        objc_msgSend(v16, "logWithHeader:", CFSTR("Input underlying FS"));

        goto LABEL_14;
      }
    }
    return +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 150, CFSTR("Unexpected backend type for file"), a3);
  }
LABEL_14:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  v18 = objc_msgSend(v17, "isEmpty");

  if ((v18 & 1) != 0)
    return 1;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "statWithError:", a3));
  v19 = v21 != 0;

  return v19;
}

- (id)newAttachWithError:(id *)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  DIShadowNode *v11;
  void *v12;
  DIShadowNode *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  DIClient2Controller_XPCHandler *v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  const __CFString *v27;
  void *v28;
  BOOL v29;
  void *v30;
  unsigned __int8 v31;
  uint64_t v32;
  QuarantineFileHandler *v33;
  void *v34;
  QuarantineFileHandler *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  DIAttachParams *v46;
  DIShadowNode *v47;

  if (!-[DIBaseParams isPstack](self, "isPstack"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
    v6 = objc_msgSend(v5, "hasBaseImageCache");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nodes"));
      objc_msgSend(v8, "removeObjectAtIndex:", 0);

    }
  }
  if (!-[DIBaseParams isPstack](self, "isPstack") || !-[DIAttachParams onDiskCache](self, "onDiskCache"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachParams customCacheURL](self, "customCacheURL"));

    if (v10)
    {
      v11 = [DIShadowNode alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIAttachParams customCacheURL](self, "customCacheURL"));
      v13 = -[DIShadowNode initWithURL:isCache:](v11, "initWithURL:isCache:", v12, 1);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
      v47 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
      v16 = objc_msgSend(v14, "verifyNodes:error:", v15, a3);

      if ((v16 & 1) == 0)
      {

        return 0;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "nodes"));
      objc_msgSend(v18, "insertObject:atIndex:", v13, 0);

    }
    v19 = objc_alloc_init(DIClient2Controller_XPCHandler);
    v20 = *__error();
    if (sub_1000BF0BC())
    {
      v40 = 0;
      v21 = sub_1000BF044();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        v23 = 3;
      else
        v23 = 2;
      *(_DWORD *)buf = 68158210;
      v42 = 37;
      v43 = 2080;
      v44 = "-[DIAttachParams newAttachWithError:]";
      v45 = 2114;
      v46 = self;
      v24 = (char *)_os_log_send_and_compose_impl(v23, &v40, 0, 0, &_mh_execute_header, v22, 0, "%.*s: entry: %{public}@", buf, 28);

      if (v24)
      {
        fprintf(__stderrp, "%s\n", v24);
        free(v24);
      }
    }
    else
    {
      v25 = sub_1000BF044();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        v42 = 37;
        v43 = 2080;
        v44 = "-[DIAttachParams newAttachWithError:]";
        v45 = 2114;
        v46 = self;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }

    }
    *__error() = v20;
    if (-[DIBaseParams RAMdisk](self, "RAMdisk") && (id)-[DIAttachParams fileMode](self, "fileMode") == (id)2)
    {
      v27 = CFSTR("Cannot attach RAM disk as a read-only device");
    }
    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
      if ((objc_msgSend(v28, "isEmpty") & 1) != 0)
      {

      }
      else
      {
        v29 = (id)-[DIBaseParams rawBlockSize](self, "rawBlockSize") == (id)512;

        if (!v29)
        {
          v27 = CFSTR("The image has a 4KB block size, shadow and cache files are not supported");
          goto LABEL_44;
        }
      }
      if (!-[DIBaseParams RAMdisk](self, "RAMdisk")
        || (v30 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain")),
            v31 = objc_msgSend(v30, "isEmpty"),
            v30,
            (v31 & 1) != 0))
      {
        if (!-[DIBaseParams requiresRootDaemon](self, "requiresRootDaemon"))
        {
          if (-[DIClient2Controller_XPCHandler connectWithError:](v19, "connectWithError:", a3)
            && -[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", v19, -[DIAttachParams fileMode](self, "fileMode"), a3)&& -[DIAttachParams reOpenIfWritableWithError:](self, "reOpenIfWritableWithError:", a3)&& -[DIAttachParams updateStatFSWithError:](self, "updateStatFSWithError:", a3))
          {
            v33 = [QuarantineFileHandler alloc];
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
            v35 = -[QuarantineFileHandler initWithURL:error:](v33, "initWithURL:error:", v34, a3);

            if (v35)
            {
              if (-[DIAttachParams handleRefCount](self, "handleRefCount")
                && -[DIAttachParams uniqueDevice](self, "uniqueDevice"))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
                v37 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
                objc_msgSend(v37, "setInstanceID:", v36);

              }
              v9 = -[DIClient2Controller_XPCHandler newAttachWithParams:error:](v19, "newAttachWithParams:error:", self, a3);
              if (v9 && -[QuarantineFileHandler isQuarantined](v35, "isQuarantined"))
              {
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "BSDName"));
                -[QuarantineFileHandler applyMountPointsWithBSDName:error:](v35, "applyMountPointsWithBSDName:error:", v38, 0);

              }
            }
            else
            {
              v9 = 0;
            }

          }
          else
          {
            v9 = 0;
          }
          goto LABEL_46;
        }
        v32 = objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 45, CFSTR("Sparsebundles on SMB mounts are not supported on this system"), a3));
LABEL_45:
        v9 = (id)v32;
LABEL_46:

        return v9;
      }
      v27 = CFSTR("Cannot attach RAM disk with a shadow or a cache file");
    }
LABEL_44:
    v32 = objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, v27, a3));
    goto LABEL_45;
  }
  return (id)objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, CFSTR("Cache is not supported when using pstack."), a3));
}

+ (BOOL)copyWithURL:(id)a3 outURLStr:(char *)a4 maxLen:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  const char *v11;
  BOOL v12;
  unsigned __int8 v13;

  v9 = a3;
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description")));
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  if (!v11 || !*v11)
  {
    v13 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Failed converting URL to UTF8"), a6);
LABEL_7:
    v12 = v13;
    goto LABEL_8;
  }
  if (strlcpy(a4, v11, a5) >= a5)
  {
    v13 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, CFSTR("Disk image URL is too long"), a6);
    goto LABEL_7;
  }
  v12 = 1;
LABEL_8:

  return v12;
}

- (BOOL)autoMount
{
  return self->_autoMount;
}

- (void)setAutoMount:(BOOL)a3
{
  self->_autoMount = a3;
}

- (int64_t)fileMode
{
  return self->_fileMode;
}

- (void)setFileMode:(int64_t)a3
{
  self->_fileMode = a3;
}

- (BOOL)onDiskCache
{
  return self->_onDiskCache;
}

- (NSURL)customCacheURL
{
  return self->_customCacheURL;
}

- (BOOL)uniqueDevice
{
  return self->_uniqueDevice;
}

- (void)setUniqueDevice:(BOOL)a3
{
  self->_uniqueDevice = a3;
}

- (unint64_t)commandSize
{
  return self->_commandSize;
}

- (void)setCommandSize:(unint64_t)a3
{
  self->_commandSize = a3;
}

- (unint64_t)regEntryID
{
  return self->_regEntryID;
}

- (void)setRegEntryID:(unint64_t)a3
{
  self->_regEntryID = a3;
}

- (BOOL)handleRefCount
{
  return self->_handleRefCount;
}

- (void)setHandleRefCount:(BOOL)a3
{
  self->_handleRefCount = a3;
}

- (DIStatFS)inputStatFS
{
  return self->_inputStatFS;
}

- (void)setInputStatFS:(id)a3
{
  objc_storeStrong((id *)&self->_inputStatFS, a3);
}

- (NSString)inputMountedFrom
{
  return self->_inputMountedFrom;
}

- (void)setInputMountedFrom:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)emulateExternalDisk
{
  return self->_emulateExternalDisk;
}

- (void)setEmulateExternalDisk:(BOOL)a3
{
  self->_emulateExternalDisk = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMountedFrom, 0);
  objc_storeStrong((id *)&self->_inputStatFS, 0);
  objc_storeStrong((id *)&self->_customCacheURL, 0);
}

@end
