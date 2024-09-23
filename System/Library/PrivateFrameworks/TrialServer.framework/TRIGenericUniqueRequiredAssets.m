@implementation TRIGenericUniqueRequiredAssets

- (TRIGenericUniqueRequiredAssets)initWithCloudKit:(id)a3 mobileAsset:(id)a4
{
  id v8;
  id v9;
  void *v10;
  TRIGenericUniqueRequiredAssets *v11;
  TRIGenericUniqueRequiredAssets *v12;
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
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 3608, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cloudKit != nil"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIServerTupleTypes.m"), 3609, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mobileAsset != nil"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)TRIGenericUniqueRequiredAssets;
  v11 = -[TRIGenericUniqueRequiredAssets init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cloudKit, a3);
    objc_storeStrong((id *)&v12->_mobileAsset, a4);
  }

  return v12;
}

+ (id)assetsWithCloudKit:(id)a3 mobileAsset:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCloudKit:mobileAsset:", v7, v6);

  return v8;
}

- (id)copyWithReplacementCloudKit:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCloudKit:mobileAsset:", v4, self->_mobileAsset);

  return v5;
}

- (id)copyWithReplacementMobileAsset:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCloudKit:mobileAsset:", self->_cloudKit, v4);

  return v5;
}

- (BOOL)isEqualToAssets:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  NSDictionary *cloudKit;
  void *v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  NSDictionary *mobileAsset;
  void *v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_8;
  v6 = self->_cloudKit != 0;
  objc_msgSend(v4, "cloudKit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  if (v6 == v8)
    goto LABEL_8;
  cloudKit = self->_cloudKit;
  if (cloudKit)
  {
    objc_msgSend(v5, "cloudKit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSDictionary isEqual:](cloudKit, "isEqual:", v10);

    if (!v11)
      goto LABEL_8;
  }
  v12 = self->_mobileAsset != 0;
  objc_msgSend(v5, "mobileAsset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (v12 == v14)
  {
LABEL_8:
    v17 = 0;
  }
  else
  {
    mobileAsset = self->_mobileAsset;
    if (mobileAsset)
    {
      objc_msgSend(v5, "mobileAsset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[NSDictionary isEqual:](mobileAsset, "isEqual:", v16);

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
  TRIGenericUniqueRequiredAssets *v4;
  TRIGenericUniqueRequiredAssets *v5;
  BOOL v6;

  v4 = (TRIGenericUniqueRequiredAssets *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIGenericUniqueRequiredAssets isEqualToAssets:](self, "isEqualToAssets:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDictionary hash](self->_cloudKit, "hash");
  return -[NSDictionary hash](self->_mobileAsset, "hash") - v3 + 32 * v3;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIGenericUniqueRequiredAssets | cloudKit:%@ mobileAsset:%@>"), self->_cloudKit, self->_mobileAsset);
}

- (NSDictionary)cloudKit
{
  return self->_cloudKit;
}

- (NSDictionary)mobileAsset
{
  return self->_mobileAsset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAsset, 0);
  objc_storeStrong((id *)&self->_cloudKit, 0);
}

@end
