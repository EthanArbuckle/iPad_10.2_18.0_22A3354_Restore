@implementation SXDocumentMetadataProvider

- (SXDocumentMetadataProvider)initWithDocumentProvider:(id)a3
{
  id v5;
  SXDocumentMetadataProvider *v6;
  SXDocumentMetadataProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXDocumentMetadataProvider;
  v6 = -[SXDocumentMetadataProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_documentProvider, a3);

  return v7;
}

- (SXMetadata)metadata
{
  void *v2;
  void *v3;
  void *v4;

  -[SXDocumentMetadataProvider documentProvider](self, "documentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SXMetadata *)v4;
}

- (NSString)title
{
  void *v2;
  void *v3;
  void *v4;

  -[SXDocumentMetadataProvider documentProvider](self, "documentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)language
{
  void *v2;
  void *v3;
  void *v4;

  -[SXDocumentMetadataProvider documentProvider](self, "documentProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "language");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentProvider, 0);
}

@end
