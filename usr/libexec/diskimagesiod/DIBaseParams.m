@implementation DIBaseParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)RAMdisk
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char isKindOfClass;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  v4 = objc_opt_class(DiskImageParamsRAM_XPC, v3);
  isKindOfClass = objc_opt_isKindOfClass(v2, v4);

  return isKindOfClass & 1;
}

- (DIBaseParams)initWithCoder:(id)a3
{
  id v4;
  DIBaseParams *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  DIURL *inputURL;
  uint64_t v15;
  id v16;
  uint64_t v17;
  DIShadowChain *shadowChain;
  uint64_t v19;
  id v20;
  uint64_t v21;
  DiskImageParamsXPC *diskImageParamsXPC;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSError *deserializationError;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)DIBaseParams;
  v5 = -[DIBaseParams init](&v28, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("debugLogsEnabled"));
    v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forwardLogs"));
    sub_1000BF0C8((uint64_t)v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "processName"));
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("diskimagesiod"));

    if ((v10 & 1) == 0)
      sub_1000BF0B0((uint64_t)v7);
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DIURL, v11), CFSTR("inputURL"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    inputURL = v5->_inputURL;
    v5->_inputURL = (DIURL *)v13;

    v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DIShadowChain, v15), CFSTR("shadowChain"));
    v17 = objc_claimAutoreleasedReturnValue(v16);
    shadowChain = v5->_shadowChain;
    v5->_shadowChain = (DIShadowChain *)v17;

    v5->_readPassphraseFlags = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("readPassphraseFlags"));
    v20 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(DiskImageParamsXPC, v19), CFSTR("diskImageParams"));
    v21 = objc_claimAutoreleasedReturnValue(v20);
    diskImageParamsXPC = v5->_diskImageParamsXPC;
    v5->_diskImageParamsXPC = (DiskImageParamsXPC *)v21;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSError, v23), CFSTR("deserializationError"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    deserializationError = v5->_deserializationError;
    v5->_deserializationError = (NSError *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeBool:forKey:", sub_1000BF0D4(), CFSTR("debugLogsEnabled"));
  objc_msgSend(v8, "encodeBool:forKey:", sub_1000BF0BC(), CFSTR("forwardLogs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("diskImageParams"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("inputURL"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("shadowChain"));

  objc_msgSend(v8, "encodeInteger:forKey:", -[DIBaseParams readPassphraseFlags](self, "readPassphraseFlags"), CFSTR("readPassphraseFlags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams deserializationError](self, "deserializationError"));
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("deserializationError"));

}

- (DIBaseParams)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  DIBaseParams *v7;
  DIURL *v8;
  DIURL *inputURL;
  DIShadowChain *v10;
  DIShadowChain *shadowChain;
  void *v12;
  void *v13;
  DIBaseParams *v14;
  DIBaseParams *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)DIBaseParams;
  v7 = -[DIBaseParams init](&v17, "init");
  if (v7)
  {
    v8 = +[DIURL newDIURLWithNSURL:](DIURL, "newDIURLWithNSURL:", v6);
    inputURL = v7->_inputURL;
    v7->_inputURL = v8;

    v7->_readPassphraseFlags = 7;
    v10 = objc_alloc_init(DIShadowChain);
    shadowChain = v7->_shadowChain;
    v7->_shadowChain = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIURL path](v7->_inputURL, "path"));
    if (!v12
      || (v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithURL:resolvingAgainstBaseURL:](NSURLComponents, "componentsWithURL:resolvingAgainstBaseURL:", v6, 1)), v13, v12, !v13))
    {
      v14 = (DIBaseParams *)objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, CFSTR("Malformed URL format"), a4));
      goto LABEL_9;
    }
    if (!-[DIBaseParams tryResolvePstackChain:](v7, "tryResolvePstackChain:", a4))
    {
      v15 = 0;
      goto LABEL_10;
    }
    if (-[DIBaseParams isPstack](v7, "isPstack") && !-[DIBaseParams supportsPstack](v7, "supportsPstack"))
    {
      v14 = (DIBaseParams *)objc_claimAutoreleasedReturnValue(+[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", 22, CFSTR("This operation doesn't support pstack files"), a4));
      goto LABEL_9;
    }
  }
  v14 = v7;
LABEL_9:
  v15 = v14;
LABEL_10:

  return v15;
}

- (BOOL)openExistingImageWithFlags:(int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  NSObject *v18;
  const char *v20;
  uint64_t v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));

  if (v7)
  {
    v8 = *__error();
    if (sub_1000BF0BC())
    {
      v21 = 0;
      v9 = sub_1000BF044();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        v11 = 3;
      else
        v11 = 2;
      *(_DWORD *)buf = 68157954;
      v23 = 49;
      v24 = 2080;
      v25 = "-[DIBaseParams openExistingImageWithFlags:error:]";
      LODWORD(v20) = 18;
      v12 = (char *)_os_log_send_and_compose_impl(v11, &v21, 0, 0, &_mh_execute_header, v10, 0, "%.*s: Using existing disk image params", (int)buf, v20);

      if (v12)
      {
        fprintf(__stderrp, "%s\n", v12);
        free(v12);
      }
    }
    else
    {
      v17 = sub_1000BF044();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v23 = 49;
        v24 = 2080;
        v25 = "-[DIBaseParams openExistingImageWithFlags:error:]";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%.*s: Using existing disk image params", buf, 0x12u);
      }

    }
    *__error() = v8;
    return 1;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
    v14 = +[DiskImageParamsXPC newWithURL:fileOpenFlags:error:](DiskImageParamsXPC, "newWithURL:fileOpenFlags:error:", v13, v5, a4);
    -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    v16 = v15 != 0;

  }
  return v16;
}

- (BOOL)supportsPstack
{
  return 1;
}

- (BOOL)tryResolvePstackChain:(id *)a3
{
  void *v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  DiskImageGraph *v11;
  void *v12;
  DiskImageGraph *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  DIURL *v23;
  DIURL *inputURL;
  void *v25;
  _BOOL4 v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  const char *v40;
  DiskImageGraph *v41;
  uint64_t v42;
  id v43;
  id v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  v43 = 0;
  v44 = 0;
  v6 = +[DiskImageGraph loadPlistDictFromURL:dict:error:](DiskImageGraph, "loadPlistDictFromURL:dict:error:", v5, &v44, &v43);
  v7 = v44;
  v8 = v43;

  if ((v6 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("PstackVersion")));
    v10 = v9 == 0;

    if (!v10)
    {
      self->_isPstack = 1;
      v11 = [DiskImageGraph alloc];
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
      v13 = -[DiskImageGraph initWithData:pstackURL:imported:error:](v11, "initWithData:pstackURL:imported:error:", v7, v12, 0, a3);

      if (v13)
      {
        v41 = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DiskImageGraph activeNode](v41, "activeNode"));
        if (v15)
        {
          do
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "toDIShadowNode"));
            objc_msgSend(v14, "addObject:", v16);

            v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "parent"));
            v15 = (void *)v17;
          }
          while (v17);
        }

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastObject"));
        objc_msgSend(v14, "removeLastObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "reverseObjectEnumerator"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allObjects"));

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
        v22 = objc_msgSend(v21, "addShadowNodes:error:", v20, a3);

        if ((v22 & 1) != 0)
        {
          v23 = (DIURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URL"));
          inputURL = self->_inputURL;
          self->_inputURL = v23;

        }
      }
      else
      {
        v22 = 0;
      }

      goto LABEL_40;
    }
    if (sub_1000BF0D4())
    {
      v27 = *__error();
      if (!sub_1000BF0BC())
      {
        v35 = sub_1000BF044();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68157954;
          v46 = 38;
          v47 = 2080;
          v48 = "-[DIBaseParams tryResolvePstackChain:]";
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%.*s: Not a pstack", buf, 0x12u);
        }

        goto LABEL_38;
      }
      v42 = 0;
      v32 = sub_1000BF044();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        v34 = 3;
      else
        v34 = 2;
      *(_DWORD *)buf = 68157954;
      v46 = 38;
      v47 = 2080;
      v48 = "-[DIBaseParams tryResolvePstackChain:]";
      LODWORD(v40) = 18;
      v31 = (char *)_os_log_send_and_compose_impl(v34, &v42, 0, 0, &_mh_execute_header, v33, 2, "%.*s: Not a pstack", (int)buf, v40);

      if (v31)
        goto LABEL_17;
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  if (objc_msgSend(v25, "isEqualToString:", CFSTR("com.apple.DiskImages2.ErrorDomain")))
  {
    v26 = objc_msgSend(v8, "code") == (id)167;

    if (v26)
    {
      if (sub_1000BF0D4())
      {
        v27 = *__error();
        if (!sub_1000BF0BC())
        {
          v37 = sub_1000BF044();
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 68157954;
            v46 = 38;
            v47 = 2080;
            v48 = "-[DIBaseParams tryResolvePstackChain:]";
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "%.*s: Not a pstack", buf, 0x12u);
          }

          goto LABEL_38;
        }
        v42 = 0;
        v28 = sub_1000BF044();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          v30 = 3;
        else
          v30 = 2;
        *(_DWORD *)buf = 68157954;
        v46 = 38;
        v47 = 2080;
        v48 = "-[DIBaseParams tryResolvePstackChain:]";
        LODWORD(v40) = 18;
        v31 = (char *)_os_log_send_and_compose_impl(v30, &v42, 0, 0, &_mh_execute_header, v29, 2, "%.*s: Not a pstack", (int)buf, v40);

        if (v31)
        {
LABEL_17:
          fprintf(__stderrp, "%s\n", v31);
          free(v31);
        }
LABEL_38:
        *__error() = v27;
      }
LABEL_39:
      v22 = 1;
      goto LABEL_40;
    }
  }
  else
  {

  }
  v22 = 0;
  if (a3)
    *a3 = objc_retainAutorelease(v8);
LABEL_40:

  return v22;
}

- (BOOL)checkBeforeSetWithIsPassphrase:(BOOL)a3 error:(id *)a4
{
  __CFString *v6;
  __CFString *v7;
  BOOL v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char isKindOfClass;

  v6 = CFSTR("Public key");
  if (a3)
    v6 = CFSTR("Passphrase");
  v7 = v6;
  if (!-[DIBaseParams hasUnlockedBackend](self, "hasUnlockedBackend"))
  {
    if (-[DIBaseParams RAMdisk](self, "RAMdisk"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("A %@ cannot be specified for RAM disks"), v7));
      v10 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 150, v9, a4);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
      v13 = objc_opt_class(DiskImageParamsLocked_XPC, v12);
      isKindOfClass = objc_opt_isKindOfClass(v11, v13);

      if ((isKindOfClass & 1) != 0)
      {
        v8 = 1;
        goto LABEL_11;
      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("A %@ was specified, but the image file doesn't seem to be encrypted"), v7));
      v10 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 150, v9, a4);
    }
    v8 = v10;

    goto LABEL_11;
  }
  v8 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Too many calls to set, the image is already unlocked"), a4);
LABEL_11:

  return v8;
}

- (BOOL)setPassphrase:(const char *)a3 error:(id *)a4
{
  void *v7;
  id v8;
  BOOL v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  const char *v23;
  uint64_t v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;

  if (-[DIBaseParams checkBeforeSetWithIsPassphrase:error:](self, "checkBeforeSetWithIsPassphrase:error:", 1))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
    v8 = objc_msgSend(v7, "newWithPassphrase:error:", a3, a4);
    v9 = v8 != 0;
    if (!v8)
    {
LABEL_25:

      return v9;
    }
    if (a3)
    {
      v10 = *__error();
      if (!sub_1000BF0BC())
      {
        v18 = sub_1000BF044();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          v26 = 36;
          v27 = 2080;
          v28 = "-[DIBaseParams setPassphrase:error:]";
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%.*s: Passphrase is correct", buf, 0x12u);
        }

        goto LABEL_24;
      }
      v24 = 0;
      v11 = sub_1000BF044();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        v13 = 3;
      else
        v13 = 2;
      *(_DWORD *)buf = 68157954;
      v26 = 36;
      v27 = 2080;
      v28 = "-[DIBaseParams setPassphrase:error:]";
      LODWORD(v23) = 18;
      v14 = (char *)_os_log_send_and_compose_impl(v13, &v24, 0, 0, &_mh_execute_header, v12, 0, "%.*s: Passphrase is correct", (int)buf, v23);

      if (v14)
        goto LABEL_16;
    }
    else
    {
      v10 = *__error();
      if (!sub_1000BF0BC())
      {
        v20 = sub_1000BF044();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          v26 = 36;
          v27 = 2080;
          v28 = "-[DIBaseParams setPassphrase:error:]";
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%.*s: Found certificate in keychain", buf, 0x12u);
        }

        goto LABEL_24;
      }
      v24 = 0;
      v15 = sub_1000BF044();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        v17 = 3;
      else
        v17 = 2;
      *(_DWORD *)buf = 68157954;
      v26 = 36;
      v27 = 2080;
      v28 = "-[DIBaseParams setPassphrase:error:]";
      LODWORD(v23) = 18;
      v14 = (char *)_os_log_send_and_compose_impl(v17, &v24, 0, 0, &_mh_execute_header, v16, 0, "%.*s: Found certificate in keychain", (int)buf, v23);

      if (v14)
      {
LABEL_16:
        fprintf(__stderrp, "%s\n", v14);
        free(v14);
      }
    }
LABEL_24:
    *__error() = v10;
    -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", v8);
    goto LABEL_25;
  }
  return 0;
}

- (BOOL)tryUnlockUsingKeychainCertificateWithError:(id *)a3
{
  return -[DIBaseParams setPassphrase:error:](self, "setPassphrase:error:", 0, a3);
}

- (NSUUID)encryptionUUID
{
  id v3;

  if (*(_QWORD *)-[DIBaseParams cryptoHeader](self, "cryptoHeader"))
    v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", *(_QWORD *)-[DIBaseParams cryptoHeader](self, "cryptoHeader") + 36);
  else
    v3 = 0;
  return (NSUUID *)v3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@[%@]"), v5, v6));

  return v7;
}

- (BOOL)prepareImageWithXpcHandler:(id)a3 fileMode:(int64_t)a4 error:(id *)a5
{
  id v8;
  DIEncryptionUnlocker *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;

  v8 = a3;
  if (!*(_QWORD *)-[DIBaseParams cryptoHeader](self, "cryptoHeader")
    || (v9 = -[DIEncryptionFrontend initWithParams:]([DIEncryptionUnlocker alloc], "initWithParams:", self), v10 = -[DIEncryptionUnlocker unlockWithXpcHandler:error:](v9, "unlockWithXpcHandler:error:", v8, a5), v9, v10))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
    v12 = objc_msgSend(v11, "isEmpty");

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
      objc_msgSend(v14, "setShadowChain:", v13);

    }
    else
    {
      if (a4 != 2)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
        objc_msgSend(v15, "openWritable:createNonExisting:", 1, a4 != 3);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
        objc_msgSend(v17, "setShadowChain:", v16);

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "shadowChain"));
      v20 = v19 == 0;

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
        objc_msgSend(v21, "openWritable:createNonExisting:", 0, 0);

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
        objc_msgSend(v23, "setShadowChain:", v22);

      }
    }
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)hasUnlockedBackend
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "backendXPC"));
  v4 = objc_msgSend(v3, "isUnlocked");

  return v4;
}

- (void)invalidate
{
  -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", 0);
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams deserializationError](self, "deserializationError"));

  if (a3 && v5)
    *a3 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseParams deserializationError](self, "deserializationError"));
  return v5 == 0;
}

- (NSUUID)instanceID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "instanceID"));

  return (NSUUID *)v3;
}

- (unint64_t)rawBlockSize
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  v3 = objc_msgSend(v2, "blockSize");

  return (unint64_t)v3;
}

- (void)setRawBlockSize:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  objc_msgSend(v4, "setBlockSize:", a3);

}

- (BOOL)requiresRootDaemon
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  char v10;
  _QWORD *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  _QWORD *v21;
  std::__shared_weak_count *v22;
  void *lpsrc;
  std::__shared_weak_count *v24;

  -[DIBaseParams backend](self, "backend");
  sub_10011E808((uint64_t)&v21, &lpsrc);
  v2 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  if (lpsrc)
  {
    if (v5)
    {
      v6 = v5;
      v7 = v24;
      v21 = v5;
      v22 = v24;
      if (v24)
      {
        v8 = (unint64_t *)&v24->__shared_owners_;
        do
          v9 = __ldxr(v8);
        while (__stxr(v9 + 1, v8));
      }
      if (sub_1000470AC(v5[5]))
      {
        v10 = (*(uint64_t (**)(_QWORD *))(*v6 + 48))(v6);
        if (!v7)
          goto LABEL_29;
      }
      else
      {
        v10 = 0;
        if (!v7)
          goto LABEL_29;
      }
      v16 = (unint64_t *)&v7->__shared_owners_;
      do
        v15 = __ldaxr(v16);
      while (__stlxr(v15 - 1, v16));
      goto LABEL_27;
    }
  }
  if (!lpsrc
  {
    v10 = 0;
    goto LABEL_29;
  }
  v21 = v11;
  v22 = v24;
  if (v24)
  {
    v12 = (unint64_t *)&v24->__shared_owners_;
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  v10 = sub_1000470AC((uint64_t)(v11 + 3));
  v7 = v22;
  if (v22)
  {
    v14 = (unint64_t *)&v22->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
LABEL_27:
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
LABEL_29:
  v17 = v24;
  if (v24)
  {
    v18 = (unint64_t *)&v24->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  return v10;
}

- (unint64_t)readPassphraseFlags
{
  return self->_readPassphraseFlags;
}

- (void)setReadPassphraseFlags:(unint64_t)a3
{
  self->_readPassphraseFlags = a3;
}

- (DiskImageParamsXPC)diskImageParamsXPC
{
  return self->_diskImageParamsXPC;
}

- (void)setDiskImageParamsXPC:(id)a3
{
  objc_storeStrong((id *)&self->_diskImageParamsXPC, a3);
}

- (DIURL)inputURL
{
  return self->_inputURL;
}

- (void)setInputURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (DIShadowChain)shadowChain
{
  return self->_shadowChain;
}

- (BOOL)isPstack
{
  return self->_isPstack;
}

- (NSError)deserializationError
{
  return self->_deserializationError;
}

- (void)setDeserializationError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deserializationError, 0);
  objc_storeStrong((id *)&self->_shadowChain, 0);
  objc_storeStrong((id *)&self->_inputURL, 0);
  objc_storeStrong((id *)&self->_diskImageParamsXPC, 0);
}

- (shared_ptr<Backend>)backend
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  Backend *v6;
  __shared_weak_count *v7;
  id v8;
  shared_ptr<Backend> result;

  v3 = v2;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "backendXPC"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "backend");
  }
  else
  {
    *v3 = 0;
    v3[1] = 0;
  }

  result.__cntrl_ = v7;
  result.__ptr_ = v6;
  return result;
}

- (void)cryptoHeader
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "backendXPC"));
  v4 = objc_msgSend(v3, "cryptoHeader");

  return v4;
}

@end
