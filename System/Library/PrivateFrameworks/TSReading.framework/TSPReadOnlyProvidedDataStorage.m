@implementation TSPReadOnlyProvidedDataStorage

- (TSPReadOnlyProvidedDataStorage)initWithDataRepresentation:(id)a3
{
  id v5;
  TSPReadOnlyProvidedDataStorage *v6;
  TSPReadOnlyProvidedDataStorage *v7;
  TSPReadOnlyProvidedDataStorage *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSPReadOnlyProvidedDataStorage;
  v6 = -[TSPReadOnlyProvidedDataStorage init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataRep, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)documentResourceLocator
{
  return 0;
}

- (id)filenameForPreferredFilename:(id)a3
{
  return a3;
}

- (id)bookmarkDataWithOptions:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPReadOnlyProvidedDataStorage bookmarkDataWithOptions:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyProvidedDataStorage.mm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 42, CFSTR("Can't create a bookmark for read only TSPData backed by NSData"));

  return 0;
}

- (CGDataProvider)newCGDataProvider
{
  CGDataProvider *v2;

  v2 = (CGDataProvider *)-[SFUDataRepresentation cgDataProvider](self->_dataRep, "cgDataProvider");
  if (!v2)
    TSULogErrorInFunction();
  return v2;
}

- (unint64_t)encodedLength
{
  return -[SFUDataRepresentation dataLength](self->_dataRep, "dataLength");
}

- (CGImageSource)newCGImageSource
{
  CGDataProvider *v2;
  CGDataProvider *v3;
  CGImageSource *v4;

  v2 = -[TSPReadOnlyProvidedDataStorage newCGDataProvider](self, "newCGDataProvider");
  v3 = v2;
  if (!v2 || (v4 = CGImageSourceCreateWithDataProvider(v2, 0)) == 0)
  {
    TSULogErrorInFunction();
    v4 = 0;
  }
  CGDataProviderRelease(v3);
  return v4;
}

- (id)NSDataWithOptions:(unint64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUDataRepresentation readIntoData:](self->_dataRep, "readIntoData:", v4);
  return v4;
}

- (id)AVAssetWithOptions:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPReadOnlyProvidedDataStorage AVAssetWithOptions:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyProvidedDataStorage.mm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 88, CFSTR("Can't create an AVAsset for read only TSPData backed by NSData"));

  return 0;
}

- (id)applicationDataLocator
{
  return 0;
}

- (unint64_t)length
{
  return -[SFUDataRepresentation dataLength](self->_dataRep, "dataLength");
}

- (void)performReadWithAccessor:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)performIOChannelReadWithAccessor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPReadOnlyProvidedDataStorage performIOChannelReadWithAccessor:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyProvidedDataStorage.mm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 122, CFSTR("need to implement"));

  v6[2](v6, 0);
}

- (BOOL)readOnly
{
  return 1;
}

- (BOOL)isInPackage:(id)a3
{
  return 0;
}

- (NSString)packageLocator
{
  return 0;
}

- (unsigned)packageIdentifier
{
  return 1;
}

- (id)AVAssetWithOptions:(id)a3 contentTypeUTI:(id)a4
{
  return 0;
}

- (id)AVAssetWithOptions:(id)a3 usingResourceLoaderWithContentTypeUTI:(id)a4
{
  return 0;
}

- (BOOL)writeToBundleWriter:(id)a3 preferredFilename:(id)a4 filename:(id *)a5 didCopyDataToBundle:(BOOL *)a6
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataRep, 0);
}

@end
