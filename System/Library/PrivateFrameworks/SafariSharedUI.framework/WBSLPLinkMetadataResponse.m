@implementation WBSLPLinkMetadataResponse

- (WBSLPLinkMetadataResponse)initWithURL:(id)a3 metadata:(id)a4
{
  id v6;
  WBSLPLinkMetadataResponse *v7;
  uint64_t v8;
  LPLinkMetadata *metadata;
  WBSLPLinkMetadataResponse *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSLPLinkMetadataResponse;
  v7 = -[WBSSiteMetadataResponse initWithURL:](&v12, sel_initWithURL_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    metadata = v7->_metadata;
    v7->_metadata = (LPLinkMetadata *)v8;

    v10 = v7;
  }

  return v7;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
