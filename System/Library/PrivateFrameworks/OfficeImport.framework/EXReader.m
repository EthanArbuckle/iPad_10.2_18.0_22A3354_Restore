@implementation EXReader

- (id)read
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  EXReadState *v7;
  void *v8;
  EXReadState *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;

  v3 = (void *)MEMORY[0x22E2DDB58](self, a2);
  -[OCDEncryptedReader useUnencryptedDocument](self, "useUnencryptedDocument");
  -[OCXReader zipPackage](self, "zipPackage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    -[OCXReader verifyFileFormat](self, "verifyFileFormat");
  -[OCXReader zipPackage](self, "zipPackage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainDocumentPart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage);
  v7 = [EXReadState alloc];
  -[OCDReader cancelDelegate](self, "cancelDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EXReadState initWithWorkbookPart:cancelDelegate:](v7, "initWithWorkbookPart:cancelDelegate:", v6, v8);

  -[OCXReader zipPackage](self, "zipPackage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCDReader fileName](self, "fileName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EXReader temporaryDirectory](self, "temporaryDirectory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[OCDReader delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = -[OCDReader isThumbnail](self, "isThumbnail");
  +[EXWorkbook edWorkbookFromState:package:reader:fileName:temporaryDirectory:delegate:forThumbnail:](EXWorkbook, "edWorkbookFromState:package:reader:fileName:temporaryDirectory:delegate:forThumbnail:", v9, v10, self, v11, v12, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v16;
}

- (NSString)temporaryDirectory
{
  return self->mTemporaryDirectory;
}

- (id)defaultPassphrase
{
  return CFSTR("VelvetSweatshop");
}

- (void)setTemporaryDirectory:(id)a3
{
  objc_storeStrong((id *)&self->mTemporaryDirectory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTemporaryDirectory, 0);
}

@end
