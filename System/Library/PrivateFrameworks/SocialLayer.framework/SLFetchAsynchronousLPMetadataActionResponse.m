@implementation SLFetchAsynchronousLPMetadataActionResponse

+ (id)responseWithMetadata:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMetadata:", v4);

  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLFetchAsynchronousLPMetadataActionResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  SLFetchAsynchronousLPMetadataActionResponse *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  LPLinkMetadata *metadata;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLFetchAsynchronousLPMetadataActionResponse;
  v5 = -[SLShareableContentActionResponse initWithBSXPCCoder:](&v11, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_metadata);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (LPLinkMetadata *)v8;

  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[SLFetchAsynchronousLPMetadataActionResponse metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_metadata);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)SLFetchAsynchronousLPMetadataActionResponse;
  -[SLShareableContentActionResponse encodeWithBSXPCCoder:](&v7, sel_encodeWithBSXPCCoder_, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLFetchAsynchronousLPMetadataActionResponse)initWithCoder:(id)a3
{
  id v4;
  SLFetchAsynchronousLPMetadataActionResponse *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  LPLinkMetadata *metadata;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SLFetchAsynchronousLPMetadataActionResponse;
  v5 = -[SLShareableContentActionResponse initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_metadata);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (LPLinkMetadata *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[SLFetchAsynchronousLPMetadataActionResponse metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_metadata);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)SLFetchAsynchronousLPMetadataActionResponse;
  -[SLShareableContentActionResponse encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);

}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
