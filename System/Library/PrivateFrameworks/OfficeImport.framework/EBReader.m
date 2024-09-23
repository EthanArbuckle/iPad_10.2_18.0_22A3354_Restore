@implementation EBReader

- (BOOL)start
{
  void *v3;
  unint64_t v4;
  XlBinaryReader *v5;
  XlBinaryReader *v6;
  void *v7;
  id v8;
  FILE *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;

  -[OCDReader data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (HIDWORD(v4))
    goto LABEL_2;
  v5 = -[EBReader xlReader](self, "xlReader");
  if (!v5)
    return (char)v5;
  v6 = v5;
  -[OCDReader fileName](self, "fileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[OCDReader fileName](self, "fileName");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = fopen((const char *)objc_msgSend(v8, "UTF8String"), "rb");

    if (v9)
    {
      -[OCBReader setFile:](self, "setFile:", v9);
      (*(void (**)(XlBinaryReader *, __sFILE *))(*(_QWORD *)v6 + 16))(v6, -[OCBReader file](self, "file"));
LABEL_9:
      LOBYTE(v5) = 1;
      return (char)v5;
    }
    v13 = TCUnknownProblemMessage;
    -[OCDReader fileName](self, "fileName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[TCMessageException raise:](TCMessageException, "raise:", v13, v14);

  }
  else
  {
    -[OCDReader data](self, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[OCDReader data](self, "data");
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      self->mBuffer = (const void *)objc_msgSend(v11, "bytes");

      -[OCDReader data](self, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      XlBinaryReader::start(v6, &self->mBuffer, objc_msgSend(v12, "length"));

      goto LABEL_9;
    }
  }
LABEL_2:
  LOBYTE(v5) = 0;
  return (char)v5;
}

- (OCCEncryptionInfoReader)encryptionInfoReader
{
  OCCEncryptionInfoReader *v2;

  v2 = -[EBReader xlReader](self, "xlReader");
  if (v2)
    return v2 + 1;
  else
    return 0;
}

- (id)read
{
  void *v3;
  OcBinaryReader *v4;
  EBReaderState *v5;
  void *v6;
  EBReaderState *v7;
  void *v9;

  v3 = (void *)MEMORY[0x22E2DDB58](self, a2);
  -[OCDEncryptedReader useUnencryptedDocument](self, "useUnencryptedDocument");
  v4 = -[OCBReader binaryReader](self, "binaryReader");
  (*((void (**)(OcBinaryReader *))v4->var0 + 80))(v4);
  v5 = [EBReaderState alloc];
  -[OCDReader cancelDelegate](self, "cancelDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EBReaderState initWithXlReader:cancelDelegate:](v5, "initWithXlReader:cancelDelegate:", v4, v6);

  +[EBWorkbook readWithState:reader:](EBWorkbook, "readWithState:reader:", v7, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[EBReaderState pauseReading](v7, "pauseReading");
  objc_autoreleasePoolPop(v3);

  return v9;
}

- (BOOL)useStringOptimization
{
  return self->mUseStringOptimization;
}

- (NSString)temporaryDirectory
{
  return self->mTemporaryDirectory;
}

- (void)dealloc
{
  XlObjectFactory *mXlObjectFactory;
  objc_super v4;

  mXlObjectFactory = self->mXlObjectFactory;
  if (mXlObjectFactory)
    (*((void (**)(XlObjectFactory *, SEL))mXlObjectFactory->var0 + 1))(mXlObjectFactory, a2);
  v4.receiver = self;
  v4.super_class = (Class)EBReader;
  -[OCBReader dealloc](&v4, sel_dealloc);
}

- (EBReader)initWithCancelDelegate:(id)a3
{
  id v4;
  EBReader *v5;
  XlObjectFactory *v6;
  XlChartBinaryReader *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EBReader;
  v5 = -[OCBReader initWithCancelDelegate:](&v9, sel_initWithCancelDelegate_, v4);
  if (v5)
  {
    v6 = (XlObjectFactory *)operator new();
    v6->var0 = 0;
    v6->var1 = 0;
    XlObjectFactory::XlObjectFactory(v6);
    v6->var0 = (void **)&unk_24F3A91F0;
    v5->mXlObjectFactory = v6;
    v7 = (XlChartBinaryReader *)operator new();
    XlChartBinaryReader::XlChartBinaryReader(v7, v5->mXlObjectFactory);
    -[OCBReader setBinaryReader:](v5, "setBinaryReader:", v7);
    v5->mUseStringOptimization = 0;
  }

  return v5;
}

- (OCCBinaryStreamer)allocBinaryStreamerWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilenameInUTF8:(const char *)a4
{
  XlStreamer *v7;

  v7 = (XlStreamer *)operator new();
  XlStreamer::XlStreamer(v7, (XlBinaryReader *)-[EBReader xlReader](self, "xlReader"), a3, a4);
  return (OCCBinaryStreamer *)v7;
}

- (void)setTemporaryDirectory:(id)a3
{
  objc_storeStrong((id *)&self->mTemporaryDirectory, a3);
}

- (void)setUseStringOptimization:(BOOL)a3
{
  self->mUseStringOptimization = a3;
}

- (BOOL)isFileStructuredStorage
{
  return self->mIsFileStructuredStorage;
}

- (void)setIsFileStructuredStorage:(BOOL)a3
{
  self->mIsFileStructuredStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTemporaryDirectory, 0);
}

@end
