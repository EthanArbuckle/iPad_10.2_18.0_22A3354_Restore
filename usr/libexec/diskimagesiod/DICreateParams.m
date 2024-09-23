@implementation DICreateParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DICreateParams)initWithURL:(id)a3 numBlocks:(unint64_t)a4 error:(id *)a5
{
  DICreateParams *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DICreateParams;
  result = -[DIBaseParams initWithURL:error:](&v7, "initWithURL:error:", a3, a5);
  if (result)
    result->_numBlocks = a4;
  return result;
}

- (BOOL)supportsPstack
{
  return 0;
}

- (DICreateParams)initWithURL:(id)a3 error:(id *)a4
{
  return -[DICreateParams initWithURL:numBlocks:error:](self, "initWithURL:numBlocks:error:", a3, 0, a4);
}

- (DICreateParams)initWithCoder:(id)a3
{
  id v4;
  DICreateParams *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSString *publicKey;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *certificate;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DICreateParams;
  v5 = -[DIBaseParams initWithCoder:](&v15, "initWithCoder:", v4);
  if (v5)
  {
    v5->_numBlocks = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("numBlocks"));
    v5->_encryptionMethod = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("encryptionMethod"));
    v5->_passphrase = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("passphrase"));
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v6), CFSTR("publicKey"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    publicKey = v5->_publicKey;
    v5->_publicKey = (NSString *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("certificate"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    certificate = v5->_certificate;
    v5->_certificate = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DICreateParams;
  -[DIBaseParams encodeWithCoder:](&v7, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[DICreateParams numBlocks](self, "numBlocks"), CFSTR("numBlocks"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DICreateParams encryptionMethod](self, "encryptionMethod"), CFSTR("encryptionMethod"));
  objc_msgSend(v4, "encodeBool:forKey:", -[DICreateParams passphrase](self, "passphrase"), CFSTR("passphrase"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams publicKey](self, "publicKey"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("publicKey"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams certificate](self, "certificate"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("certificate"));

}

- (BOOL)getCertificateWithEncryptionCreator:(id)a3 outCertificate:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v13;
  char *v14;
  uint64_t v15;

  v8 = a3;
  if (a4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams certificate](self, "certificate"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams certificate](self, "certificate"));
      *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getCertificateWithCertificatePath:error:", v10, a5));

    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DICreateParams publicKey](self, "publicKey"));

      if (v13)
      {
        v15 = 0;
        v14 = (char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[DICreateParams publicKey](self, "publicKey"))), "UTF8String");
        sub_1001202C8(v14, &v15);
      }
    }
    v11 = 1;
  }
  else
  {
    v11 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("Invalid certificate out argument"), a5);
  }

  return v11;
}

- (BOOL)createEncryptionWithXPCHandler:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  int v8;

  v5 = a3;
  if (-[DICreateParams encryptionMethod](self, "encryptionMethod"))
  {
    if ((id)-[DICreateParams encryptionMethod](self, "encryptionMethod") == (id)2)
      v6 = 256;
    else
      v6 = 128;
    sub_10008A94C(&v8, v6);
    operator new();
  }

  return 1;
}

- (void)createDiskImageParamsXPC
{
  void *exception;
  void *v3;

  exception = __cxa_allocate_exception(0x40uLL);
  v3 = (void *)sub_100005410((uint64_t)exception, (uint64_t)"Invalid argument, please use one of the DICreateParams derived classes instead", 0x16u);
}

- (BOOL)createDiskImageParamsWithError:(id *)a3
{
  void *v5;
  unsigned __int8 v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  char *v13;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  v6 = objc_msgSend(v5, "isFileURL");

  if ((v6 & 1) == 0)
    return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, CFSTR("URL must have a file scheme"), a3);
  v7 = *__error();
  if (sub_1000BF0BC())
  {
    v22 = 0;
    v8 = sub_1000BF044();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
    if (v10)
      v12 = 3;
    else
      v12 = 2;
    *(_DWORD *)buf = 68158211;
    v24 = 49;
    v25 = 2080;
    v26 = "-[DICreateParams createDiskImageParamsWithError:]";
    v27 = 2113;
    v28 = v11;
    v13 = (char *)_os_log_send_and_compose_impl(v12, &v22, 0, 0, &_mh_execute_header, v9, 0, "%.*s: entry with %{private}@", buf, 28);

    if (v13)
    {
      fprintf(__stderrp, "%s\n", v13);
      free(v13);
    }
  }
  else
  {
    v15 = sub_1000BF044();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
      *(_DWORD *)buf = 68158211;
      v24 = 49;
      v25 = 2080;
      v26 = "-[DICreateParams createDiskImageParamsWithError:]";
      v27 = 2113;
      v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%.*s: entry with %{private}@", buf, 0x1Cu);

    }
  }
  *__error() = v7;
  v19 = objc_opt_class(self, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  LOBYTE(v19) = objc_msgSend((id)v19, "eraseIfExistingWithURL:error:", v20, a3);

  if ((v19 & 1) == 0)
    return 0;
  -[DICreateParams createDiskImageParamsXPC](self, "createDiskImageParamsXPC");
  return 1;
}

- (BOOL)createWithError:(id *)a3
{
  DIClient2Controller_XPCHandler *v5;

  if (!-[DICreateParams numBlocks](self, "numBlocks"))
    return +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, CFSTR("Invalid size requested for the new image"), a3);
  if (-[DICreateParams createDiskImageParamsWithError:](self, "createDiskImageParamsWithError:", a3))
  {
    if (!-[DICreateParams encryptionMethod](self, "encryptionMethod"))
      return -[DICreateParams resizeWithNumBlocks:error:](self, "resizeWithNumBlocks:error:", -[DICreateParams numBlocks](self, "numBlocks"), a3);
    v5 = objc_alloc_init(DIClient2Controller_XPCHandler);
    if (-[DIClient2Controller_XPCHandler connectWithError:](v5, "connectWithError:", a3)
      && -[DICreateParams createEncryptionWithXPCHandler:error:](self, "createEncryptionWithXPCHandler:error:", v5, a3))
    {

      return -[DICreateParams resizeWithNumBlocks:error:](self, "resizeWithNumBlocks:error:", -[DICreateParams numBlocks](self, "numBlocks"), a3);
    }

  }
  return 0;
}

- (BOOL)setPassphrase:(const char *)a3 error:(id *)a4
{
  DIEncryptionCreator *v7;
  unsigned __int8 v8;
  id v9;
  unsigned int v10;
  int v11;
  void *v12;
  unsigned __int8 v13;
  id v15;

  v7 = -[DIEncryptionFrontend initWithParams:]([DIEncryptionCreator alloc], "initWithParams:", self);
  v15 = 0;
  v8 = -[DICreateParams getCertificateWithEncryptionCreator:outCertificate:error:](self, "getCertificateWithEncryptionCreator:outCertificate:error:", v7, &v15, a4);
  v9 = v15;
  if ((v8 & 1) != 0)
  {
    v10 = -[DICreateParams passphrase](self, "passphrase");
    if (v9)
      v11 = v10;
    else
      v11 = 1;
    if (v11 != 1 || a3 && *a3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
      v13 = objc_msgSend(v12, "makeNewImageEncryptedWithPassphrase:certificate:error:", a3, v9, a4);

    }
    else
    {
      v13 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, CFSTR("Passphrase cannot be empty"), a4);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)tryCreateUsingKeychainCertificateWithError:(id *)a3
{
  return -[DICreateParams setPassphrase:error:](self, "setPassphrase:error:", 0, a3);
}

- (BOOL)resizeWithNumBlocks:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  BOOL v14;
  unint64_t v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  NSObject *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[8];
  __int16 v33;
  const char *v34;
  __int16 v35;
  unint64_t v36;

  -[DICreateParams setNumBlocks:](self, "setNumBlocks:");
  v31 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams shadowChain](self, "shadowChain"));
  v9 = objc_msgSend(v8, "shouldValidate");
  if (v7)
  {
    objc_msgSend(v7, "createDiskImageWithCache:shadowValidation:", 0, v9);
    v10 = *(_QWORD *)buf;
  }
  else
  {
    v10 = 0;
  }
  v31 = v10;
  *(_QWORD *)buf = 0;

  v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 24))(v31);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC"));
  v13 = objc_msgSend(v12, "setSizeWithDiskImage:newSize:", &v31, v11 * a3);

  if ((_DWORD)v13)
  {
    v14 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", v13, CFSTR("Failed to resize the image"), a4);
    goto LABEL_20;
  }
  -[DICreateParams setNumBlocks:](self, "setNumBlocks:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 32))(v31));
  v15 = -[DICreateParams numBlocks](self, "numBlocks");
  v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 24))(v31);
  v17 = *__error();
  v18 = v16 * v15;
  if (sub_1000BF0BC())
  {
    v30 = 0;
    v19 = sub_1000BF044();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      v21 = 3;
    else
      v21 = 2;
    *(_DWORD *)buf = 68158210;
    *(_DWORD *)&buf[4] = 44;
    v33 = 2080;
    v34 = "-[DICreateParams resizeWithNumBlocks:error:]";
    v35 = 2048;
    v36 = v18;
    LODWORD(v29) = 28;
    v22 = (char *)_os_log_send_and_compose_impl(v21, &v30, 0, 0, &_mh_execute_header, v20, 0, "%.*s: Disk image resized to %llu bytes", (int)buf, v29);

    if (v22)
    {
      fprintf(__stderrp, "%s\n", v22);
      free(v22);
    }
  }
  else
  {
    v23 = sub_1000BF044();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 44;
      v33 = 2080;
      v34 = "-[DICreateParams resizeWithNumBlocks:error:]";
      v35 = 2048;
      v36 = v18;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%.*s: Disk image resized to %llu bytes", buf, 0x1Cu);
    }

  }
  *__error() = v17;
  v25 = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v31 + 136))(v31);
  v26 = sub_100013328(v25);
  if (!(_DWORD)v26)
  {
    v14 = 1;
    if (!v25)
      goto LABEL_20;
    goto LABEL_19;
  }
  v14 = +[DIError failWithPOSIXCode:error:](DIError, "failWithPOSIXCode:error:", v26, a4);
  if (v25)
LABEL_19:
    (*(void (**)(_QWORD *))(*v25 + 40))(v25);
LABEL_20:
  v27 = v31;
  v31 = 0;
  if (v27)
    (*(void (**)(uint64_t))(*(_QWORD *)v27 + 16))(v27);
  return v14;
}

+ (BOOL)checkExistingFileWithURL:(id)a3 isDirectory:(BOOL)a4 error:(id *)a5
{
  if (a4)
    return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 21, CFSTR("The requested URL is an existing folder"), a5);
  else
    return 1;
}

+ (BOOL)eraseIfExistingWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  char *v21;
  unsigned __int8 v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  unsigned __int8 v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  void *v35;

  v6 = a3;
  v29 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
  v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v29);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v12 = objc_msgSend(v10, "isWritableFileAtPath:", v11);

    if ((v12 & 1) != 0)
    {
      v14 = (void *)objc_opt_class(a1, v13);
      if (objc_msgSend(v14, "checkExistingFileWithURL:isDirectory:error:", v6, v29, a4))
      {
        v15 = *__error();
        if (sub_1000BF0BC())
        {
          v28 = 0;
          v16 = sub_1000BF044();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
          if (v18)
            v20 = 3;
          else
            v20 = 2;
          *(_DWORD *)buf = 68158211;
          v31 = 47;
          v32 = 2080;
          v33 = "+[DICreateParams eraseIfExistingWithURL:error:]";
          v34 = 2113;
          v35 = v19;
          v21 = (char *)_os_log_send_and_compose_impl(v20, &v28, 0, 0, &_mh_execute_header, v17, 0, "%.*s: Erasing %{private}@", buf, 28);

          if (v21)
          {
            fprintf(__stderrp, "%s\n", v21);
            free(v21);
          }
        }
        else
        {
          v23 = sub_1000BF044();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
            *(_DWORD *)buf = 68158211;
            v31 = 47;
            v32 = 2080;
            v33 = "+[DICreateParams eraseIfExistingWithURL:error:]";
            v34 = 2113;
            v35 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%.*s: Erasing %{private}@", buf, 0x1Cu);

          }
        }
        *__error() = v15;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v22 = objc_msgSend(v26, "removeItemAtURL:error:", v6, a4);

      }
      else
      {
        v22 = 0;
      }
    }
    else
    {
      v22 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 13, CFSTR("Image does not have write permissions"), a4);
    }
  }
  else
  {
    v22 = 1;
  }

  return v22;
}

- (BOOL)onErrorCleanup
{
  int v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  int v18;
  uint64_t v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;

  -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", 0);
  v3 = *__error();
  if (sub_1000BF0BC())
  {
    v19 = 0;
    v4 = sub_1000BF044();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      v6 = 3;
    else
      v6 = 2;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    *(_DWORD *)buf = 68158211;
    v21 = 32;
    v22 = 2080;
    v23 = "-[DICreateParams onErrorCleanup]";
    v24 = 2113;
    v25 = v8;
    v18 = 28;
    v9 = (char *)_os_log_send_and_compose_impl(v6, &v19, 0, 0, &_mh_execute_header, v5, 0, "%.*s: Creation failed, erasing %{private}@", buf, v18);

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
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
      *(_DWORD *)buf = 68158211;
      v21 = 32;
      v22 = 2080;
      v23 = "-[DICreateParams onErrorCleanup]";
      v24 = 2113;
      v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%.*s: Creation failed, erasing %{private}@", buf, 0x1Cu);

    }
  }
  *__error() = v3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DIBaseParams inputURL](self, "inputURL"));
  v16 = objc_msgSend(v14, "removeItemAtURL:error:", v15, 0);

  return v16;
}

- (unint64_t)encryptionMethod
{
  return self->_encryptionMethod;
}

- (void)setEncryptionMethod:(unint64_t)a3
{
  self->_encryptionMethod = a3;
}

- (NSString)systemKeychainAccount
{
  return self->_systemKeychainAccount;
}

- (void)setSystemKeychainAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(BOOL)a3
{
  self->_passphrase = a3;
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)numBlocks
{
  return self->_numBlocks;
}

- (void)setNumBlocks:(unint64_t)a3
{
  self->_numBlocks = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
  objc_storeStrong((id *)&self->_systemKeychainAccount, 0);
}

@end
