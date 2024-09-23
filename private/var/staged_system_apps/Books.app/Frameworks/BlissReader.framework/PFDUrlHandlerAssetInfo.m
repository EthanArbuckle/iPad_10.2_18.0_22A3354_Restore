@implementation PFDUrlHandlerAssetInfo

- (PFDUrlHandlerAssetInfo)initWithContext:(id)a3 bookRootURL:(id)a4
{
  id v7;
  id v8;
  PFDUrlHandlerAssetInfo *v9;
  PFDUrlHandlerAssetInfo *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[PFDUrlHandlerAssetInfo init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bookRootURL, a4);
    objc_storeStrong((id *)&v10->_context, a3);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PFDUrlHandlerAssetInfo *v4;

  v4 = -[PFDUrlHandlerAssetInfo initWithContext:bookRootURL:](+[PFDUrlHandlerAssetInfo allocWithZone:](PFDUrlHandlerAssetInfo, "allocWithZone:", a3), "initWithContext:bookRootURL:", self->_context, self->_bookRootURL);
  -[PFDUrlHandlerAssetInfo setPath:](v4, "setPath:", self->_path);
  return v4;
}

- (PFDContext)context
{
  return self->_context;
}

- (NSURL)bookRootURL
{
  return self->_bookRootURL;
}

- (NSURL)requestedURL
{
  return self->_requestedURL;
}

- (void)setRequestedURL:(id)a3
{
  objc_storeStrong((id *)&self->_requestedURL, a3);
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (void)setFileSize:(int64_t)a3
{
  self->_fileSize = a3;
}

- (BOOL)assetIsInsideBookRootPath
{
  return self->_assetIsInsideBookRootPath;
}

- (void)setAssetIsInsideBookRootPath:(BOOL)a3
{
  self->_assetIsInsideBookRootPath = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_requestedURL, 0);
  objc_storeStrong((id *)&self->_bookRootURL, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
