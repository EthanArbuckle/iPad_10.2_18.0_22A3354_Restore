@implementation OCCEncryptor

- (void)dealloc
{
  OCCStreamer *mStreamer;
  objc_super v4;

  mStreamer = self->mStreamer;
  if (mStreamer)
    (*((void (**)(OCCStreamer *, SEL))mStreamer->var0 + 1))(mStreamer, a2);
  v4.receiver = self;
  v4.super_class = (Class)OCCEncryptor;
  -[OCCEncryptor dealloc](&v4, sel_dealloc);
}

- (OCCEncryptor)initWithStreamer:(OCCStreamer *)a3
{
  OCCEncryptor *v4;
  OCCEncryptor *v5;
  char *var2;
  uint64_t v7;
  NSString *mOutputFilename;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OCCEncryptor;
  v4 = -[OCCEncryptor init](&v10, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mStreamer = a3;
    var2 = a3->var2;
    if (var2)
    {
      v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", var2);
      mOutputFilename = v5->mOutputFilename;
      v5->mOutputFilename = (NSString *)v7;

    }
  }
  return v5;
}

- (BOOL)encrypt
{
  OCCEncryptor *v2;
  void *v3;

  v2 = self;
  v3 = (void *)MEMORY[0x22E2DDB58](self, a2);
  LOBYTE(v2) = -[OCCEncryptor encryptIntoOutputFile](v2, "encryptIntoOutputFile");
  objc_autoreleasePoolPop(v3);
  return (char)v2;
}

- (BOOL)encryptIntoOutputFile
{
  FILE *v3;
  FILE *v4;
  char v5;

  v3 = fopen(-[NSString UTF8String](self->mOutputFilename, "UTF8String"), "w+b");
  if (v3)
  {
    v4 = v3;
    v5 = (*((uint64_t (**)(OCCStreamer *, FILE *))self->mStreamer->var0 + 5))(self->mStreamer, v3);
    fclose(v4);
    LOBYTE(v3) = v5;
  }
  return (char)v3;
}

+ (id)allocTempFileWithBase:(id)a3 filename:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  uint64_t v10;
  NSString *v11;
  const char *v12;
  void *v13;
  size_t v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.XXXXXX"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = getenv("CIRRUSEXPORTERTEMPDIR");
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v10;
  }
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v11 = (NSString *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = -[NSString fileSystemRepresentation](v11, "fileSystemRepresentation");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "fileExistsAtPath:", v11) && (TCRemoveFileSecurely(v11) & 1) == 0)
    goto LABEL_9;
  v14 = strlen(v12);
  v15 = (char *)malloc_type_malloc(v14 + 1, 0xB42769BCuLL);
  v16 = v15;
  if (!v15)
    goto LABEL_9;
  v17 = strcpy(v15, v12);
  v18 = mkstemp(v17);
  if ((_DWORD)v18 == -1)
  {
    free(v16);
LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFileSystemRepresentation:length:", v16, strlen(v16));
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  free(v16);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:", v18);
LABEL_10:

  return v20;
}

- (NSString)outputFilename
{
  return self->mOutputFilename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOutputFilename, 0);
}

@end
