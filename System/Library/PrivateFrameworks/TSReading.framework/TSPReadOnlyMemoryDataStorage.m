@implementation TSPReadOnlyMemoryDataStorage

- (TSPReadOnlyMemoryDataStorage)initWithNSData:(id)a3
{
  id v5;
  TSPReadOnlyMemoryDataStorage *v6;
  TSPReadOnlyMemoryDataStorage *v7;
  TSPReadOnlyMemoryDataStorage *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSPReadOnlyMemoryDataStorage;
  v6 = -[TSPReadOnlyMemoryDataStorage init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_NSData, a3);
    v8 = v7;
  }

  return v7;
}

- (id)bookmarkDataWithOptions:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPReadOnlyMemoryDataStorage bookmarkDataWithOptions:]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyMemoryDataStorage.mm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 34, CFSTR("Can't create a bookmark for read only TSPData backed by NSData"));

  return 0;
}

- (CGDataProvider)newCGDataProvider
{
  CGDataProvider *v2;

  v2 = CGDataProviderCreateWithCFData((CFDataRef)self->_NSData);
  if (!v2)
    TSULogErrorInFunction();
  return v2;
}

- (CGImageSource)newCGImageSource
{
  CGImageSource *v2;

  v2 = CGImageSourceCreateWithData((CFDataRef)self->_NSData, 0);
  if (!v2)
    TSULogErrorInFunction();
  return v2;
}

- (id)NSDataWithOptions:(unint64_t)a3
{
  return self->_NSData;
}

- (id)AVAssetWithOptions:(id)a3 contentTypeUTI:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPReadOnlyMemoryDataStorage AVAssetWithOptions:contentTypeUTI:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyMemoryDataStorage.mm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 69, CFSTR("Can't create an AVAsset for read only TSPData backed by NSData"));

  return 0;
}

- (id)AVAssetWithOptions:(id)a3 usingResourceLoaderWithContentTypeUTI:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPReadOnlyMemoryDataStorage AVAssetWithOptions:usingResourceLoaderWithContentTypeUTI:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyMemoryDataStorage.mm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 75, CFSTR("Can't create an AVAsset for read only TSPData backed by NSData"));

  return 0;
}

- (NSString)documentResourceLocator
{
  return 0;
}

- (NSString)packageLocator
{
  return 0;
}

- (unsigned)packageIdentifier
{
  return 0;
}

- (id)filenameForPreferredFilename:(id)a3
{
  return a3;
}

- (unint64_t)encodedLength
{
  return -[NSData length](self->_NSData, "length");
}

- (void)performReadWithAccessor:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void)performIOChannelReadWithAccessor:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (BOOL)readOnly
{
  return 1;
}

- (BOOL)isInPackage:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_NSData, 0);
}

@end
