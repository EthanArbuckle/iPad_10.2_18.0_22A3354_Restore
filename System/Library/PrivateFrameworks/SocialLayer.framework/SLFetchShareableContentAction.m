@implementation SLFetchShareableContentAction

- (SLFetchShareableContentAction)initWithSceneIdentifier:(id)a3 requestedTypeIdentifier:(id)a4 requestedItemProviderIndex:(int64_t)a5 responseHandler:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  SLFetchShareableContentAction *v16;

  v10 = (objc_class *)MEMORY[0x1E0D017D0];
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v10);
  objc_msgSend(v14, "setObject:forSetting:", v13, 1);

  objc_msgSend(v14, "setObject:forSetting:", v12, 3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forSetting:", v15, 4);

  v16 = -[SLShareableContentAction initWithInfo:responseHandler:](self, "initWithInfo:responseHandler:", v14, v11);
  return v16;
}

- (NSString)requestedTypeIdentifier
{
  NSString **p_requestedTypeIdentifier;
  NSString *requestedTypeIdentifier;
  void *v4;
  void *v5;
  void *v6;

  p_requestedTypeIdentifier = &self->_requestedTypeIdentifier;
  requestedTypeIdentifier = self->_requestedTypeIdentifier;
  if (!requestedTypeIdentifier)
  {
    -[SLShareableContentAction action](self, "action");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForSetting:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong((id *)p_requestedTypeIdentifier, v6);

    requestedTypeIdentifier = *p_requestedTypeIdentifier;
  }
  return requestedTypeIdentifier;
}

- (int64_t)requestedItemProviderIndex
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t requestedItemProviderIndex;

  -[SLShareableContentAction action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    requestedItemProviderIndex = objc_msgSend(v5, "integerValue");
    self->_requestedItemProviderIndex = requestedItemProviderIndex;
  }
  else
  {
    requestedItemProviderIndex = self->_requestedItemProviderIndex;
  }

  return requestedItemProviderIndex;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLFetchShareableContentAction)initWithCoder:(id)a3
{
  id v4;
  SLFetchShareableContentAction *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *requestedTypeIdentifier;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLFetchShareableContentAction;
  v5 = -[SLShareableContentAction initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_requestedTypeIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    requestedTypeIdentifier = v5->_requestedTypeIdentifier;
    v5->_requestedTypeIdentifier = (NSString *)v8;

    NSStringFromSelector(sel_requestedItemProviderIndex);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_requestedItemProviderIndex = objc_msgSend(v4, "decodeIntegerForKey:", v10);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  -[SLFetchShareableContentAction requestedTypeIdentifier](self, "requestedTypeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_requestedTypeIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  v7 = -[SLFetchShareableContentAction requestedItemProviderIndex](self, "requestedItemProviderIndex");
  NSStringFromSelector(sel_requestedItemProviderIndex);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", v7, v8);

  v9.receiver = self;
  v9.super_class = (Class)SLFetchShareableContentAction;
  -[SLShareableContentAction encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedTypeIdentifier, 0);
}

@end
