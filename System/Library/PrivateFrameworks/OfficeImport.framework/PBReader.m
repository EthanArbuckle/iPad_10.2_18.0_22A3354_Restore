@implementation PBReader

- (BOOL)start
{
  PptBinaryReader *v3;
  PptBinaryReader *v4;
  void *v5;
  id v6;
  FILE *v7;
  void *v8;
  id v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;

  v3 = -[PBReader pptReader](self, "pptReader");
  if (v3)
  {
    v4 = v3;
    -[OCDReader fileName](self, "fileName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[OCDReader fileName](self, "fileName");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = fopen((const char *)objc_msgSend(v6, "UTF8String"), "rb");

      if (v7)
      {
        -[OCBReader setFile:](self, "setFile:", v7);
        (*(void (**)(PptBinaryReader *, __sFILE *))(*(_QWORD *)v4 + 16))(v4, -[OCBReader file](self, "file"));
        LOBYTE(v3) = 1;
        return (char)v3;
      }
      v11 = TCUnknownProblemMessage;
      -[OCDReader fileName](self, "fileName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[TCMessageException raise:](TCMessageException, "raise:", v11, v12);

    }
    else
    {
      -[OCDReader data](self, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[OCDReader data](self, "data");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        self->mBuffer = (const void *)objc_msgSend(v9, "bytes");

        -[OCDReader data](self, "data");
        v10 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "length");
        PptBinaryReader::start(v4, &self->mBuffer, v10);
      }
    }
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (OCCEncryptionInfoReader)encryptionInfoReader
{
  OCCEncryptionInfoReader *v2;

  v2 = -[PBReader pptReader](self, "pptReader");
  if (v2)
    return v2 + 3;
  else
    return 0;
}

- (id)read
{
  void *v3;
  OADGraphicStyleCache *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  PDPresentation *v13;

  v3 = (void *)MEMORY[0x22E2DDB58](self, a2);
  -[OCDEncryptedReader useUnencryptedDocument](self, "useUnencryptedDocument");
  v13 = objc_alloc_init(PDPresentation);

  v4 = objc_alloc_init(OADGraphicStyleCache);
  -[OCDDocument setGraphicStyleCache:](v13, "setGraphicStyleCache:", v4);

  -[OCDDocument setReader:](v13, "setReader:", self);
  -[OCDReader fileName](self, "fileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PDPresentation setIsAutoPlay:](v13, "setIsAutoPlay:", objc_msgSend(v7, "isEqualToString:", CFSTR("pps")));

  v8 = -[PBReader pptReader](self, "pptReader");
  -[OCDReader cancelDelegate](self, "cancelDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[OCDReader isThumbnail](self, "isThumbnail");
  -[OCDReader delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PBPresentation readFrom:to:cancel:asThumbnail:delegate:](PBPresentation, "readFrom:to:cancel:asThumbnail:delegate:", v8, v13, v9, v10, v11);

  objc_autoreleasePoolPop(v3);
  return v13;
}

- (void)dealloc
{
  PptObjectFactory *mPptObjectFactory;
  objc_super v4;

  mPptObjectFactory = self->mPptObjectFactory;
  if (mPptObjectFactory)
    (*((void (**)(PptObjectFactory *, SEL))mPptObjectFactory->var0 + 1))(mPptObjectFactory, a2);
  v4.receiver = self;
  v4.super_class = (Class)PBReader;
  -[OCBReader dealloc](&v4, sel_dealloc);
}

- (PBReader)initWithCancelDelegate:(id)a3
{
  id v4;
  PBReader *v5;
  PptObjectFactory *v6;
  PptBinaryReader *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBReader;
  v5 = -[OCBReader initWithCancelDelegate:](&v9, sel_initWithCancelDelegate_, v4);
  if (v5)
  {
    v6 = (PptObjectFactory *)operator new();
    PptObjectFactory::PptObjectFactory(v6);
    v5->mPptObjectFactory = v6;
    PptObjectFactory::init(v6);
    v7 = (PptBinaryReader *)operator new();
    PptBinaryReader::PptBinaryReader(v7, v5->mPptObjectFactory);
    -[OCBReader setBinaryReader:](v5, "setBinaryReader:", v7);
  }

  return v5;
}

- (OCCBinaryStreamer)allocBinaryStreamerWithCryptoKey:(OCCCryptoKey *)a3 baseOutputFilenameInUTF8:(const char *)a4
{
  PptStreamer *v7;

  v7 = (PptStreamer *)operator new();
  PptStreamer::PptStreamer(v7, (PptBinaryReader *)-[PBReader pptReader](self, "pptReader"), a3, a4);
  return (OCCBinaryStreamer *)v7;
}

@end
