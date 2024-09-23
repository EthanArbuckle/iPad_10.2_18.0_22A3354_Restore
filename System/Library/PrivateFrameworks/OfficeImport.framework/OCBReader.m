@implementation OCBReader

- (void)setBinaryReader:(OcBinaryReader *)a3
{
  self->mBinaryReader = a3;
}

- (OcBinaryReader)binaryReader
{
  return self->mBinaryReader;
}

- (BOOL)retainDecryptorWithErrorCode:(int *)a3
{
  OCCEncryptionInfoReader *v5;
  OCCEncryptionInfoReader *v6;
  OCCCryptoAPICryptoKey *UsingEncryptionInfoBuffer;
  OCCCryptoAPICryptoKey *v8;
  void *v9;
  OCCDecryptor *v10;
  OCCDecryptor *mDecryptor;
  int v12;
  _DWORD v14[3];

  v5 = -[OCBReader encryptionInfoReader](self, "encryptionInfoReader");
  if (!v5)
    return (char)v5;
  if (self->super.mDecryptor)
  {
    LOBYTE(v5) = 1;
    return (char)v5;
  }
  memset(v14, 0, sizeof(v14));
  v6 = -[OCBReader encryptionInfoReader](self, "encryptionInfoReader");
  if ((*((unsigned int (**)(OCCEncryptionInfoReader *, _DWORD *, _DWORD *, int *))v6->var0 + 2))(v6, &v14[1], v14, a3))
  {
    UsingEncryptionInfoBuffer = OCCCryptoKey::createUsingEncryptionInfoBuffer(0, *(unsigned __int16 **)&v14[1], (const void *)v14[0]);
    if (!UsingEncryptionInfoBuffer)
    {
      v12 = 8003;
      goto LABEL_9;
    }
    v8 = UsingEncryptionInfoBuffer;
    -[OCDReader fileName](self, "fileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[OCBReader allocDecryptorWithCryptoKey:baseOutputFilename:](self, "allocDecryptorWithCryptoKey:baseOutputFilename:", v8, v9);
    mDecryptor = self->super.mDecryptor;
    self->super.mDecryptor = v10;

    if (!self->super.mDecryptor)
    {
      v12 = 8000;
LABEL_9:
      *a3 = v12;
    }
  }
  if (*(_QWORD *)&v14[1])
    MEMORY[0x22E2DD3F0](*(_QWORD *)&v14[1], 0x1000C8077774924);
  LOBYTE(v5) = self->super.mDecryptor != 0;
  return (char)v5;
}

- (void)dealloc
{
  OcBinaryReader *mBinaryReader;
  objc_super v4;

  mBinaryReader = self->mBinaryReader;
  if (mBinaryReader)
    (*((void (**)(OcBinaryReader *, SEL))mBinaryReader->var0 + 1))(mBinaryReader, a2);
  -[OCBReader closeFile](self, "closeFile");
  v4.receiver = self;
  v4.super_class = (Class)OCBReader;
  -[OCBReader dealloc](&v4, sel_dealloc);
}

- (void)closeFile
{
  FILE *mFile;

  mFile = self->mFile;
  if (mFile)
  {
    fclose(mFile);
    self->mFile = 0;
  }
}

- (OCBReader)initWithCancelDelegate:(id)a3
{
  OCBReader *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OCBReader;
  result = -[OCDReader initWithCancelDelegate:](&v4, sel_initWithCancelDelegate_, a3);
  if (result)
  {
    result->mBinaryReader = 0;
    result->mFile = 0;
  }
  return result;
}

- (void)setFile:(__sFILE *)a3
{
  int v3;
  int v4;
  uint64_t v5;
  int st_size;
  stat v7;

  self->mFile = a3;
  v3 = fileno(a3);
  if (v3 >= 1)
  {
    v4 = v3;
    fstat(v3, &v7);
    v5 = 0;
    st_size = v7.st_size;
    fcntl(v4, 44, &v5);
  }
}

- (OCCEncryptionInfoReader)encryptionInfoReader
{
  return 0;
}

- (BOOL)isBinaryReader
{
  return 1;
}

- (OCCBinaryStreamer)allocBinaryStreamerWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilenameInUTF8:(const char *)a4
{
  return 0;
}

- (id)allocDecryptorWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilename:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  OCCBinaryStreamer *v9;

  v6 = a4;
  -[OCDReader fileName](self, "fileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  else
    v8 = 0;
  v9 = -[OCBReader allocBinaryStreamerWithCryptoKey:baseOutputFilenameInUTF8:](self, "allocBinaryStreamerWithCryptoKey:baseOutputFilenameInUTF8:", a3, v8);
  if (v9)
    v9 = -[OCCDecryptor initWithStreamer:]([OCCDecryptor alloc], "initWithStreamer:", v9);

  return v9;
}

- (void)restartReaderToUseDecryptedDocument
{
  OcBinaryReader *v3;
  void *v4;

  v3 = -[OCBReader binaryReader](self, "binaryReader");
  (*((void (**)(OcBinaryReader *))v3->var0 + 3))(v3);
  -[OCBReader closeFile](self, "closeFile");
  -[OCCDecryptor outputFilename](self->super.mDecryptor, "outputFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCDReader setFileName:](self, "setFileName:", v4);

  if (!-[OCBReader start](self, "start"))
    +[TCMessageException raise:](TCMessageException, "raise:", TCDecryptionFailedMessage);
}

- (BOOL)start
{
  return 0;
}

- (id)read
{
  return 0;
}

- (__sFILE)file
{
  return self->mFile;
}

@end
