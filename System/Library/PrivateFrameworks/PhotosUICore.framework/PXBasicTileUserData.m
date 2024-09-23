@implementation PXBasicTileUserData

- (PXBasicTileUserData)init
{
  return (PXBasicTileUserData *)-[PXBasicTileUserData _initWithViewSpec:](self, "_initWithViewSpec:", 0);
}

- (id)_initWithViewSpec:(id)a3
{
  id v5;
  PXBasicTileUserData *v6;
  PXBasicTileUserData *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXBasicTileUserData;
  v6 = -[PXBasicTileUserData init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_viewSpec, a3);

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PXBasicTileUserData viewSpec](self, "viewSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXBasicTileUserData viewSpec](self, "viewSpec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewSpec");
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

  return v8;
}

- (PXViewSpec)viewSpec
{
  return self->_viewSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewSpec, 0);
}

+ (PXBasicTileUserData)userDataWithViewSpec:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PXBasicTileUserData _initWithViewSpec:]([PXBasicTileUserData alloc], "_initWithViewSpec:", v3);

  return (PXBasicTileUserData *)v4;
}

@end
