@implementation PXGAssetDecorationViewConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadStatus, 0);
}

- (void)setLoadStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PXOperationStatus)loadStatus
{
  return self->_loadStatus;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PXGAssetDecorationViewConfiguration loadStatus](self, "loadStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLoadStatus:", v5);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PXGAssetDecorationViewConfiguration *v4;
  PXGAssetDecorationViewConfiguration *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (PXGAssetDecorationViewConfiguration *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXGAssetDecorationViewConfiguration loadStatus](self, "loadStatus");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGAssetDecorationViewConfiguration loadStatus](v5, "loadStatus");
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

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXGAssetDecorationViewConfiguration loadStatus](self, "loadStatus");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

@end
