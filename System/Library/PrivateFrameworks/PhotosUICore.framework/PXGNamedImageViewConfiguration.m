@implementation PXGNamedImageViewConfiguration

- (PXGNamedImageViewConfiguration)initWithImageName:(id)a3 contentMode:(int64_t)a4 bundle:(id)a5
{
  id v9;
  id v10;
  PXGNamedImageViewConfiguration *v11;
  PXGNamedImageViewConfiguration *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXGNamedImageViewConfiguration;
  v11 = -[PXGNamedImageViewConfiguration init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_imageName, a3);
    v12->_contentMode = a4;
    objc_storeStrong((id *)&v12->_bundle, a5);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PXGNamedImageViewConfiguration imageName](self, "imageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImageName:", v5);

  objc_msgSend(v4, "setContentMode:", -[PXGNamedImageViewConfiguration contentMode](self, "contentMode"));
  -[PXGNamedImageViewConfiguration bundle](self, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundle:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PXGNamedImageViewConfiguration *v4;
  PXGNamedImageViewConfiguration *v5;
  id v6;
  id v7;
  int v8;
  BOOL v9;
  int64_t v10;
  void *v11;
  void *v12;

  v4 = (PXGNamedImageViewConfiguration *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PXGNamedImageViewConfiguration imageName](self, "imageName");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[PXGNamedImageViewConfiguration imageName](v5, "imageName");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {

      }
      else
      {
        v8 = objc_msgSend(v6, "isEqualToString:", v7);

        if (!v8)
          goto LABEL_11;
      }
      v10 = -[PXGNamedImageViewConfiguration contentMode](self, "contentMode");
      if (v10 == -[PXGNamedImageViewConfiguration contentMode](v5, "contentMode"))
      {
        -[PXGNamedImageViewConfiguration bundle](self, "bundle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGNamedImageViewConfiguration bundle](v5, "bundle");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v11 == v12;

LABEL_12:
        goto LABEL_13;
      }
LABEL_11:
      v9 = 0;
      goto LABEL_12;
    }
    v9 = 0;
  }
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  unint64_t v7;

  -[PXGNamedImageViewConfiguration imageName](self, "imageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ (2 * -[PXGNamedImageViewConfiguration contentMode](self, "contentMode"));
  -[PXGNamedImageViewConfiguration bundle](self, "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  return v7;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
  objc_storeStrong((id *)&self->_bundle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end
