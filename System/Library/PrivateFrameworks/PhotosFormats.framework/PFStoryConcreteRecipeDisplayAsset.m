@implementation PFStoryConcreteRecipeDisplayAsset

- (PFStoryConcreteRecipeDisplayAsset)initWithIdentifier:(id)a3 category:(int64_t)a4 scheme:(id)a5 cloudIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  PFStoryConcreteRecipeDisplayAsset *v14;
  uint64_t v15;
  NSString *scheme;
  uint64_t v17;
  NSString *cloudIdentifier;
  objc_super v20;

  v10 = a5;
  v11 = a6;
  v12 = a3;
  +[PFStoryConcreteRecipeDisplayAsset URLWithScheme:cloudIdentifier:](PFStoryConcreteRecipeDisplayAsset, "URLWithScheme:cloudIdentifier:", v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20.receiver = self;
  v20.super_class = (Class)PFStoryConcreteRecipeDisplayAsset;
  v14 = -[PFStoryConcreteRecipeAsset initWithIdentifier:kind:url:](&v20, sel_initWithIdentifier_kind_url_, v12, 1, v13);

  if (v14)
  {
    v14->_category = a4;
    v15 = objc_msgSend(v10, "copy");
    scheme = v14->_scheme;
    v14->_scheme = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    cloudIdentifier = v14->_cloudIdentifier;
    v14->_cloudIdentifier = (NSString *)v17;

  }
  return v14;
}

- (PFStoryConcreteRecipeDisplayAsset)initWithIdentifier:(id)a3 kind:(int64_t)a4 url:(id)a5
{
  id v6;
  id v7;
  PFStoryConcreteRecipeDisplayAsset *v8;
  SEL v9;
  id v10;

  v6 = a3;
  v7 = a5;
  v8 = (PFStoryConcreteRecipeDisplayAsset *)_PFAssertFailHandler();
  return (PFStoryConcreteRecipeDisplayAsset *)-[PFStoryConcreteRecipeDisplayAsset isEqualToAsset:](v8, v9, v10);
}

- (BOOL)isEqualToAsset:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  id v7;
  int v8;
  char v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PFStoryConcreteRecipeDisplayAsset;
  if (-[PFStoryConcreteRecipeAsset isEqualToAsset:](&v13, sel_isEqualToAsset_, v4))
  {
    v5 = -[PFStoryConcreteRecipeDisplayAsset category](self, "category");
    if (v5 == objc_msgSend(v4, "category"))
    {
      -[PFStoryConcreteRecipeDisplayAsset scheme](self, "scheme");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scheme");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqual:", v7);

        if (!v8)
        {
          v9 = 0;
LABEL_12:

          goto LABEL_13;
        }
      }
      -[PFStoryConcreteRecipeDisplayAsset cloudIdentifier](self, "cloudIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "cloudIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == v11)
        v9 = 1;
      else
        v9 = objc_msgSend(v10, "isEqual:", v11);

      goto LABEL_12;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (int64_t)category
{
  return self->_category;
}

- (NSString)scheme
{
  return self->_scheme;
}

- (NSString)cloudIdentifier
{
  return self->_cloudIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudIdentifier, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
}

+ (id)URLWithScheme:(id)a3 cloudIdentifier:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0CB3998];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setScheme:", v7);

  objc_msgSend(v8, "setHost:", CFSTR("asset"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", CFSTR("cloudIdentifier"), v6);

  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setQueryItems:", v10);

  objc_msgSend(v8, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)decomposeURL:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  BOOL v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithURL:resolvingAgainstBaseURL:", v5, 1);
  objc_msgSend(v7, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_16;
  objc_msgSend(v7, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("asset")) & 1) == 0)
  {

    goto LABEL_16;
  }
  objc_msgSend(v7, "queryItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 != 1)
  {
LABEL_16:
    v14 = 0;
    goto LABEL_17;
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v7, "queryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  v14 = v13 != 0;
  if (v13)
  {
    v15 = v13;
    v24 = v13 != 0;
    v25 = v8;
    v26 = v6;
    v27 = v5;
    v16 = 0;
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v19, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("cloudIdentifier"));

        if (v21)
        {
          objc_msgSend(v19, "value");
          v22 = objc_claimAutoreleasedReturnValue();

          v16 = (void *)v22;
        }
      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v15);

    if (!v16)
    {
      v14 = 0;
      v6 = v26;
      v5 = v27;
      v8 = v25;
      goto LABEL_17;
    }
    v8 = v25;
    v6 = v26;
    (*((void (**)(id, void *, void *))v26 + 2))(v26, v25, v16);
    v5 = v27;
    v14 = v24;
  }
  else
  {
    v16 = v12;
  }

LABEL_17:
  return v14;
}

@end
