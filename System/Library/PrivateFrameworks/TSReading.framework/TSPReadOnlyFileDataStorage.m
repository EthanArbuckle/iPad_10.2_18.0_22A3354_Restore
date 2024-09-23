@implementation TSPReadOnlyFileDataStorage

- (TSPReadOnlyFileDataStorage)initWithURL:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  TSPReadOnlyFileDataStorage *v9;
  TSPReadOnlyFileDataStorage *v10;
  TSPReadOnlyFileDataStorage *v11;
  objc_super v13;

  v5 = a3;
  if ((objc_msgSend(v5, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPReadOnlyFileDataStorage initWithURL:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyFileDataStorage.mm");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 21, CFSTR("Expected a file URL"));

  }
  v13.receiver = self;
  v13.super_class = (Class)TSPReadOnlyFileDataStorage;
  v9 = -[TSPReadOnlyFileDataStorage init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_URL, a3);
    v11 = v10;
  }

  return v10;
}

- (void)performReadWithAccessor:(id)a3
{
  (*((void (**)(id, NSURL *))a3 + 2))(a3, self->_URL);
}

- (BOOL)readOnly
{
  return 1;
}

- (BOOL)writeToBundleWriter:(id)a3 preferredFilename:(id)a4 filename:(id *)a5 didCopyDataToBundle:(BOOL *)a6
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPReadOnlyFileDataStorage writeToBundleWriter:preferredFilename:filename:didCopyDataToBundle:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyFileDataStorage.mm");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 45, CFSTR("Cannot save read only TSPData to a document"));

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
