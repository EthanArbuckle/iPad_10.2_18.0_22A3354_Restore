@implementation TRIAssetIdURL

- (TRIAssetIdURL)initWithAssetId:(id)a3 url:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRIAssetIdURL *v11;
  TRIAssetIdURL *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2947, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetId != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 2948, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIAssetIdURL;
  v11 = -[TRIAssetIdURL init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_assetId, a3);
    objc_storeStrong((id *)&v12->_url, a4);
  }

  return v12;
}

+ (id)urlWithAssetId:(id)a3 url:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAssetId:url:", v7, v6);

  return v8;
}

- (id)copyWithReplacementAssetId:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssetId:url:", v4, self->_url);

  return v5;
}

- (id)copyWithReplacementUrl:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssetId:url:", self->_assetId, v4);

  return v5;
}

- (BOOL)isEqualTourl:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  TRIAssetId *assetId;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSURL *url;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_assetId != 0;
  objc_msgSend(v4, "assetId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  assetId = self->_assetId;
  if (assetId)
  {
    objc_msgSend(v5, "assetId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TRIAssetId isEqual:](assetId, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_url != 0;
  objc_msgSend(v5, "url");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    url = self->_url;
    if (url)
    {
      objc_msgSend(v5, "url");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSURL isEqual:](url, "isEqual:", v16);

    }
    else
    {
      v17 = 1;
    }
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  TRIAssetIdURL *v4;
  TRIAssetIdURL *v5;
  BOOL v6;

  v4 = (TRIAssetIdURL *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIAssetIdURL isEqualTourl:](self, "isEqualTourl:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[TRIAssetId hash](self->_assetId, "hash");
  return -[NSURL hash](self->_url, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIAssetIdURL | assetId:%@ url:%@>"), self->_assetId, self->_url);
}

- (TRIAssetId)assetId
{
  return self->_assetId;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_assetId, 0);
}

@end
