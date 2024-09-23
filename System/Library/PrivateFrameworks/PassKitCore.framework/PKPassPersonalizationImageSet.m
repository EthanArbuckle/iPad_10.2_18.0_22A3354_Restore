@implementation PKPassPersonalizationImageSet

- (PKPassPersonalizationImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10;
  id v11;
  PKPassPersonalizationImageSet *v12;
  void *v13;
  uint64_t v14;
  PKImage *logoImage;
  objc_super v17;

  v10 = a4;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PKPassPersonalizationImageSet;
  v12 = -[PKImageSet initWithDisplayProfile:fileURL:screenScale:suffix:](&v17, sel_initWithDisplayProfile_fileURL_screenScale_suffix_, a3, v10, v11, a5);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("personalizationLogo"), v13, v11, a5);
    v14 = objc_claimAutoreleasedReturnValue();
    logoImage = v12->_logoImage;
    v12->_logoImage = (PKImage *)v14;

  }
  return v12;
}

+ (int64_t)imageSetType
{
  return 3;
}

+ (BOOL)shouldCache
{
  return 0;
}

- (void)preheatImages
{
  -[PKImage preheatBitmapData](self->_logoImage, "preheatBitmapData");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassPersonalizationImageSet)initWithCoder:(id)a3
{
  id v4;
  PKPassPersonalizationImageSet *v5;
  void *v6;
  uint64_t v7;
  PKImage *logoImage;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassPersonalizationImageSet;
  v5 = -[PKImageSet initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logoImage"));
    v7 = objc_claimAutoreleasedReturnValue();
    logoImage = v5->_logoImage;
    v5->_logoImage = (PKImage *)v7;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassPersonalizationImageSet;
  v5 = -[PKImageSet encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v6 = (void *)MEMORY[0x19400CFE8](v5);
  objc_msgSend(v4, "encodeObject:forKey:", self->_logoImage, CFSTR("logoImage"));
  objc_autoreleasePoolPop(v6);

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_logoImage, v4[3]);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKImage imageHash](self->_logoImage, "imageHash");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (PKImage)logoImage
{
  return self->_logoImage;
}

- (void)setLogoImage:(id)a3
{
  objc_storeStrong((id *)&self->_logoImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logoImage, 0);
}

@end
