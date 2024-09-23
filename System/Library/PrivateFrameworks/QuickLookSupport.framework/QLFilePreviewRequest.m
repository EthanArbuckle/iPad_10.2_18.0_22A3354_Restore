@implementation QLFilePreviewRequest

- (QLFilePreviewRequest)initWithURL:(id)a3
{
  return -[QLFilePreviewRequest initWithURL:contentType:](self, "initWithURL:contentType:", a3, 0);
}

- (QLFilePreviewRequest)initWithURL:(id)a3 contentType:(id)a4
{
  id v7;
  id v8;
  QLFilePreviewRequest *v9;
  QLFilePreviewRequest *v10;
  UTType *v11;
  void *contentType;
  void *v13;
  uint64_t v14;
  UTType *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)QLFilePreviewRequest;
  v9 = -[QLFilePreviewRequest init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileURL, a3);
    if (v8)
    {
      v11 = (UTType *)v8;
      contentType = v10->_contentType;
      v10->_contentType = v11;
    }
    else
    {
      v13 = (void *)MEMORY[0x24BDF8238];
      objc_msgSend(MEMORY[0x24BDE5F18], "UTIForURL:", v7);
      contentType = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "typeWithIdentifier:", contentType);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v10->_contentType;
      v10->_contentType = (UTType *)v14;

    }
  }

  return v10;
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (UTType)contentType
{
  return (UTType *)objc_getProperty(self, a2, 16, 1);
}

- (void)setContentType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
