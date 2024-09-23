@implementation TSPExternalReferenceDataStorage

- (TSPExternalReferenceDataStorage)initWithURL:(id)a3
{
  id v5;
  TSPExternalReferenceDataStorage *v6;
  uint64_t v7;
  NSURL *URL;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TSPExternalReferenceDataStorage;
  v6 = -[TSPExternalReferenceDataStorage init](&v13, sel_init);
  if (v6)
  {
    if (objc_msgSend(v5, "isFileReferenceURL"))
    {
      objc_storeStrong((id *)&v6->_URL, a3);
    }
    else if (objc_msgSend(v5, "isFileURL"))
    {
      objc_msgSend(v5, "fileReferenceURL");
      v7 = objc_claimAutoreleasedReturnValue();
      URL = v6->_URL;
      v6->_URL = (NSURL *)v7;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPExternalReferenceDataStorage initWithURL:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPExternalReferenceDataStorage.mm");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 51, CFSTR("Bad URL type"));

      v6 = 0;
    }
  }

  return v6;
}

- (TSPExternalReferenceDataStorage)initWithBookmarkData:(id)a3 context:(id)a4
{
  id v7;
  id v8;
  TSPExternalReferenceDataStorage *v9;
  TSPExternalReferenceDataStorage *v10;
  TSPExternalReferenceDataStorage *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TSPExternalReferenceDataStorage;
  v9 = -[TSPExternalReferenceDataStorage init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bookmarkData, a3);
    objc_storeWeak((id *)&v10->_context, v8);
    v11 = v10;
  }

  return v10;
}

- (id)bookmarkDataForArchiver:(id)a3
{
  return self->_bookmarkData;
}

- (void)performReadWithAccessor:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (BOOL)isReadable
{
  return 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_bookmarkData, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
