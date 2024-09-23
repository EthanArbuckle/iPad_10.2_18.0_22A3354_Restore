@implementation PFPosterMediaImage

- (PFPosterMediaImage)initWithImageName:(id)a3
{
  id v4;
  PFPosterMediaImage *v5;
  PFPosterMediaImage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PFPosterMediaImage;
  v5 = -[PFPosterMedia initWithAssetUUID:](&v8, sel_initWithAssetUUID_, v4);
  v6 = v5;
  if (v5)
  {
    -[PFPosterMedia setMediaType:](v5, "setMediaType:", 3);
    -[PFPosterMediaImage setImageName:](v6, "setImageName:", v4);
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PFPosterMediaImage initWithImageName:](+[PFPosterMediaImage allocWithZone:](PFPosterMediaImage, "allocWithZone:", a3), "initWithImageName:", self->_imageName);
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PFPosterMediaImage;
  v3 = -[PFPosterMedia hash](&v7, sel_hash);
  -[PFPosterMediaImage imageName](self, "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ (2 * objc_msgSend(v4, "hash"));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PFPosterMediaImage *v4;
  PFPosterMediaImage *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = (PFPosterMediaImage *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v10.receiver = self;
      v10.super_class = (Class)PFPosterMediaImage;
      if (-[PFPosterMedia isEqual:](&v10, sel_isEqual_, v5))
      {
        -[PFPosterMediaImage imageName](self, "imageName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[PFPosterMediaImage imageName](v5, "imageName");
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
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFPosterMediaImage;
  v4 = a3;
  -[PFPosterMedia encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[PFPosterMediaImage imageName](self, "imageName", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("imageName"));

}

- (PFPosterMediaImage)initWithCoder:(id)a3
{
  id v4;
  PFPosterMediaImage *v5;
  uint64_t v6;
  NSString *imageName;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PFPosterMediaImage;
  v5 = -[PFPosterMedia initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageName"));
    v6 = objc_claimAutoreleasedReturnValue();
    imageName = v5->_imageName;
    v5->_imageName = (NSString *)v6;

  }
  return v5;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imageName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
