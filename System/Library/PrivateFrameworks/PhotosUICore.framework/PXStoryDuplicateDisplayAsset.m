@implementation PXStoryDuplicateDisplayAsset

- (PXStoryDuplicateDisplayAsset)initWithDisplayAsset:(id)a3 alternateUUID:(id)a4
{
  id v7;
  id v8;
  PXStoryDuplicateDisplayAsset *v9;
  PXStoryDuplicateDisplayAsset *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryDuplicateDisplayAsset;
  v9 = -[PXStoryDuplicateDisplayAsset init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayAsset, a3);
    objc_storeStrong((id *)&v10->_alternateUUID, a4);
  }

  return v10;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXStoryDuplicateDisplayAsset;
  if (-[PXStoryDuplicateDisplayAsset respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[PXStoryDuplicateDisplayAsset displayAsset](self, "displayAsset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  char v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXStoryDuplicateDisplayAsset;
  if (-[PXStoryDuplicateDisplayAsset conformsToProtocol:](&v8, sel_conformsToProtocol_, v4))
  {
    v5 = 1;
  }
  else
  {
    -[PXStoryDuplicateDisplayAsset displayAsset](self, "displayAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "conformsToProtocol:", v4);

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXStoryDuplicateDisplayAsset displayAsset](self, "displayAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXStoryDuplicateDisplayAsset;
  -[PXStoryDuplicateDisplayAsset methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[PXStoryDuplicateDisplayAsset displayAsset](self, "displayAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignatureForSelector:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  void *v5;
  BOOL v6;
  objc_super v8;

  -[PXStoryDuplicateDisplayAsset displayAsset](self, "displayAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PXStoryDuplicateDisplayAsset;
    v6 = -[PXStoryDuplicateDisplayAsset isKindOfClass:](&v8, sel_isKindOfClass_, a3);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PXStoryDuplicateDisplayAsset displayAsset](self, "displayAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)PXStoryDuplicateDisplayAsset;
  -[PXStoryDuplicateDisplayAsset description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDuplicateDisplayAsset alternateUUID](self, "alternateUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryDuplicateDisplayAsset displayAsset](self, "displayAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ alternateUUID %@ -> %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)alternateUUID
{
  return self->_alternateUUID;
}

- (PXDisplayAsset)displayAsset
{
  return self->_displayAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAsset, 0);
  objc_storeStrong((id *)&self->_alternateUUID, 0);
}

@end
