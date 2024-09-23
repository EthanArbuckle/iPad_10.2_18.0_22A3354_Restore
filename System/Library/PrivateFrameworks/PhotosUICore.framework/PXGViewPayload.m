@implementation PXGViewPayload

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[PXGViewPayload userData](self, "userData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[objc_class hash](-[PXGViewPayload viewClass](self, "viewClass"), "hash") ^ v4;

  return v5;
}

- (PXGViewUserData)userData
{
  return self->_userData;
}

- (Class)viewClass
{
  return self->_viewClass;
}

- (BOOL)isEqual:(id)a3
{
  PXGViewPayload *v4;
  PXGViewPayload *v5;
  objc_class *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = (PXGViewPayload *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXGViewPayload viewClass](v5, "viewClass");
      if (v6 == -[PXGViewPayload viewClass](self, "viewClass"))
      {
        -[PXGViewPayload userData](v5, "userData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGViewPayload userData](self, "userData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 == v9)
          v7 = 1;
        else
          v7 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (PXGViewPayload)initWithViewClass:(Class)a3 userData:(id)a4
{
  id v6;
  PXGViewPayload *v7;
  PXGViewPayload *v8;
  uint64_t v9;
  PXGViewUserData *userData;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXGViewPayload;
  v7 = -[PXGViewPayload init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewClass, a3);
    v9 = objc_msgSend(v6, "copyWithZone:", 0);
    userData = v8->_userData;
    v8->_userData = (PXGViewUserData *)v9;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_viewClass, 0);
}

- (BOOL)shouldSeparateViewLayers
{
  return 0;
}

@end
