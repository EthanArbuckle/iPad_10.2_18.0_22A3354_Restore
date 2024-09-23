@implementation OCCDecryptor

- (void)dealloc
{
  OCCStreamer *mStreamer;
  objc_super v4;

  -[OCCDecryptor deleteOutputFile](self, "deleteOutputFile");
  mStreamer = self->mStreamer;
  if (mStreamer)
    (*((void (**)(OCCStreamer *))mStreamer->var0 + 1))(mStreamer);
  v4.receiver = self;
  v4.super_class = (Class)OCCDecryptor;
  -[OCCDecryptor dealloc](&v4, sel_dealloc);
}

- (OCCDecryptor)initWithStreamer:(OCCStreamer *)a3
{
  OCCDecryptor *v4;
  OCCDecryptor *v5;
  char *var2;
  uint64_t v7;
  NSString *mBaseStringForOutputFilename;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OCCDecryptor;
  v4 = -[OCCDecryptor init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mStreamer = a3;
    var2 = a3->var2;
    if (var2)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", var2);
      mBaseStringForOutputFilename = v5->mBaseStringForOutputFilename;
      v5->mBaseStringForOutputFilename = (NSString *)v7;

    }
  }
  return v5;
}

- (BOOL)isReadProtectedUsingDefaultPassphrase
{
  uint64_t v3;
  void *v4;
  BOOL v5;

  v3 = (*((uint64_t (**)(OCCStreamer *, SEL))self->mStreamer->var0 + 2))(self->mStreamer, a2);
  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[OCCDecryptor verifyPassphrase:](self, "verifyPassphrase:", v4);

  return v5;
}

- (void)deleteOutputFile
{
  NSString *mOutputFilename;
  NSString *v4;
  OITSUTemporaryDirectory *mTempDirectory;

  mOutputFilename = self->mOutputFilename;
  if (mOutputFilename)
  {
    TCRemoveFileSecurely(mOutputFilename);
    v4 = self->mOutputFilename;
    self->mOutputFilename = 0;

  }
  mTempDirectory = self->mTempDirectory;
  if (mTempDirectory)
  {
    self->mTempDirectory = 0;

  }
}

- (BOOL)decrypt
{
  void *v3;
  NSString *mBaseStringForOutputFilename;
  __CFString *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v13;
  id v14;

  v3 = (void *)MEMORY[0x22E2DDB58](self, a2);
  mBaseStringForOutputFilename = self->mBaseStringForOutputFilename;
  if (mBaseStringForOutputFilename)
    v5 = mBaseStringForOutputFilename;
  else
    v5 = CFSTR("temp.tmp");
  v13 = 0;
  v14 = 0;
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "allocTempFileWithBase:outFilename:tempDirectory:", v5, &v14, &v13);
  v7 = v14;
  v8 = v14;
  v9 = v13;
  v10 = v13;
  objc_storeStrong((id *)&self->mOutputFilename, v7);
  objc_storeStrong((id *)&self->mTempDirectory, v9);
  if (v6)
  {
    objc_msgSend(v6, "closeFile");
    v11 = -[OCCDecryptor decryptIntoOutputFile](self, "decryptIntoOutputFile");
  }
  else
  {
    v11 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v11;
}

- (BOOL)verifyPassphrase:(id)a3
{
  OCCCryptoKey *var1;
  id v4;

  var1 = self->mStreamer->var1;
  objc_msgSend(a3, "getDataUsingOfficeCryptographicEncoding");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LOBYTE(var1) = OCCCryptoKey::verifyPassphrase(var1, (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));

  return (char)var1;
}

- (BOOL)decryptIntoOutputFile
{
  FILE *v3;
  FILE *v4;
  char v5;

  v3 = fopen(-[NSString UTF8String](self->mOutputFilename, "UTF8String"), "w+b");
  if (v3)
  {
    v4 = v3;
    v5 = (*((uint64_t (**)(OCCStreamer *, FILE *))self->mStreamer->var0 + 4))(self->mStreamer, v3);
    fclose(v4);
    LOBYTE(v3) = v5;
  }
  return (char)v3;
}

+ (id)allocTempFileWithBase:(id)a3 outFilename:(id *)a4 tempDirectory:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  OITSUTemporaryDirectory *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  const char *v19;
  void *v20;
  size_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id *v28;
  id v29;

  v7 = a3;
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v7, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByDeletingPathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@.XXXXXX.%@"), v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  v13 = -[OITSUTemporaryDirectory initWithError:]([OITSUTemporaryDirectory alloc], "initWithError:", &v29);
  v14 = v29;
  v15 = v14;
  if (v13)
  {
    -[OITSUTemporaryDirectory path](v13, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingPathComponent:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
      *a5 = objc_retainAutorelease(v13);
    v18 = objc_retainAutorelease(v17);
    v19 = -[NSString fileSystemRepresentation](v18, "fileSystemRepresentation");
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v20, "fileExistsAtPath:", v18) || (TCRemoveFileSecurely(v18) & 1) != 0)
    {
      if (v19)
      {
        v28 = a4;
        v21 = strlen(v19);
        v22 = (char *)malloc_type_malloc(v21 + 1, 0xA862CACBuLL);
        v23 = v22;
        if (v22)
        {
          strcpy(v22, v19);
          v24 = mkstemps(v23, objc_msgSend(v8, "length") + 1);
          if ((_DWORD)v24 != -1)
          {
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringWithFileSystemRepresentation:length:", v23, strlen(v23));
            *v28 = (id)objc_claimAutoreleasedReturnValue();

            free(v23);
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:", v24);
LABEL_14:

            goto LABEL_15;
          }
          free(v23);
        }
      }
      else
      {
        NSLog((NSString *)CFSTR("[TSUTemporaryDirectory] Temporary file system representation is null"));
      }
    }
    v26 = 0;
    goto LABEL_14;
  }
  NSLog((NSString *)CFSTR("[TSUTemporaryDirectory] Could not create temporary directory : %@"), v14);
  v26 = 0;
LABEL_15:

  return v26;
}

- (NSString)outputFilename
{
  return self->mOutputFilename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBaseStringForOutputFilename, 0);
  objc_storeStrong((id *)&self->mOutputFilename, 0);
  objc_storeStrong((id *)&self->mTempDirectory, 0);
}

+ (id)agileDescriptorNamespace
{
  return -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/2006/encryption");
}

+ (id)agilePasswordKeyEncryptorNamespace
{
  return -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/2006/keyEncryptor/password");
}

@end
