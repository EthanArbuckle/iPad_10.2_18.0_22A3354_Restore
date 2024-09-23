@implementation SYDocumentFetchResult

- (SYDocumentFetchResult)initWithDocumentId:(id)a3 fileURL:(id)a4
{
  id v6;
  id v7;
  SYDocumentFetchResult *v8;
  uint64_t v9;
  NSString *documentId;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SYDocumentFetchResult;
  v8 = -[SYDocumentFetchResult init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    documentId = v8->_documentId;
    v8->_documentId = (NSString *)v9;

    objc_storeStrong((id *)&v8->_fileURL, a4);
  }

  return v8;
}

- (NSString)documentId
{
  return self->_documentId;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_documentId, 0);
}

@end
