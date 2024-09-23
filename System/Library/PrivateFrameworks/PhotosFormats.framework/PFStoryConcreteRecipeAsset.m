@implementation PFStoryConcreteRecipeAsset

- (PFStoryConcreteRecipeAsset)init
{
  PFStoryConcreteRecipeAsset *v2;
  SEL v3;
  id v4;
  int64_t v5;
  id v6;

  v2 = (PFStoryConcreteRecipeAsset *)_PFAssertFailHandler();
  return -[PFStoryConcreteRecipeAsset initWithIdentifier:kind:url:](v2, v3, v4, v5, v6);
}

- (PFStoryConcreteRecipeAsset)initWithIdentifier:(id)a3 kind:(int64_t)a4 url:(id)a5
{
  id v8;
  id v9;
  PFStoryConcreteRecipeAsset *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *identifier;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  NSURL *url;
  objc_super v20;

  v8 = a3;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)PFStoryConcreteRecipeAsset;
  v10 = -[PFStoryConcreteRecipeAsset init](&v20, sel_init);
  if (v10)
  {
    v11 = (void *)objc_msgSend(v8, "copy");
    v12 = v11;
    if (v11)
    {
      v13 = v11;
      identifier = v10->_identifier;
      v10->_identifier = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      identifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(identifier, "UUIDString");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v10->_identifier;
      v10->_identifier = (NSString *)v15;

    }
    v10->_kind = a4;
    v17 = objc_msgSend(v9, "copy");
    url = v10->_url;
    v10->_url = (NSURL *)v17;

  }
  return v10;
}

- (NSString)diagnosticDescription
{
  PFStoryRecipeArchiver *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(PFStoryRecipeArchiver);
  -[PFStoryRecipeArchiver archivedJSONObjectWithAsset:](v3, "archivedJSONObjectWithAsset:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isEqualToAsset:(id)a3
{
  PFStoryConcreteRecipeAsset *v4;
  int64_t v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PFStoryConcreteRecipeAsset *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = -[PFStoryConcreteRecipeAsset kind](self, "kind");
    if (v5 == -[PFStoryConcreteRecipeAsset kind](v4, "kind"))
    {
      -[PFStoryConcreteRecipeAsset url](self, "url");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PFStoryConcreteRecipeAsset url](v4, "url");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
        v8 = 1;
      else
        v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
