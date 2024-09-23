@implementation SLFetchShareableContentMetadataActionResponse

+ (id)responseWithMetadata:(id)a3 initiatorRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setMetadata:", v7);

  objc_msgSend(v8, "setInitiatorRequest:", v6);
  return v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLFetchShareableContentMetadataActionResponse)initWithBSXPCCoder:(id)a3
{
  id v4;
  SLFetchShareableContentMetadataActionResponse *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  SLShareableContentMetadata *metadata;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  SLShareableContentInitiatorRequest *initiatorRequest;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SLFetchShareableContentMetadataActionResponse;
  v5 = -[SLShareableContentActionResponse initWithBSXPCCoder:](&v15, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_metadata);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (SLShareableContentMetadata *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_initiatorRequest);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    initiatorRequest = v5->_initiatorRequest;
    v5->_initiatorRequest = (SLShareableContentInitiatorRequest *)v12;

  }
  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SLFetchShareableContentMetadataActionResponse metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_metadata);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SLFetchShareableContentMetadataActionResponse initiatorRequest](self, "initiatorRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initiatorRequest);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9.receiver = self;
  v9.super_class = (Class)SLFetchShareableContentMetadataActionResponse;
  -[SLShareableContentActionResponse encodeWithBSXPCCoder:](&v9, sel_encodeWithBSXPCCoder_, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLFetchShareableContentMetadataActionResponse)initWithCoder:(id)a3
{
  id v4;
  SLFetchShareableContentMetadataActionResponse *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  SLShareableContentMetadata *metadata;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  SLShareableContentInitiatorRequest *initiatorRequest;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SLFetchShareableContentMetadataActionResponse;
  v5 = -[SLShareableContentActionResponse initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_metadata);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (SLShareableContentMetadata *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_initiatorRequest);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    initiatorRequest = v5->_initiatorRequest;
    v5->_initiatorRequest = (SLShareableContentInitiatorRequest *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SLFetchShareableContentMetadataActionResponse metadata](self, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_metadata);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SLFetchShareableContentMetadataActionResponse initiatorRequest](self, "initiatorRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initiatorRequest);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  v9.receiver = self;
  v9.super_class = (Class)SLFetchShareableContentMetadataActionResponse;
  -[SLShareableContentActionResponse encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);

}

- (SLShareableContentMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (SLShareableContentInitiatorRequest)initiatorRequest
{
  return self->_initiatorRequest;
}

- (void)setInitiatorRequest:(id)a3
{
  objc_storeStrong((id *)&self->_initiatorRequest, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatorRequest, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
