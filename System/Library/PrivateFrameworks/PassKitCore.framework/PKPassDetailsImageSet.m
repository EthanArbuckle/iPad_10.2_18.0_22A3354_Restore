@implementation PKPassDetailsImageSet

- (PKPassDetailsImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPassDetailsImageSet *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  PKImage *cardHolderPicture;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PKPassDetailsImageSet;
  v13 = -[PKImageSet initWithDisplayProfile:fileURL:screenScale:suffix:](&v19, sel_initWithDisplayProfile_fileURL_screenScale_suffix_, v10, v11, v12, a5);
  if (v13)
  {
    v14 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("cardHolderPicture"), v15, v12, a5);
    v16 = objc_claimAutoreleasedReturnValue();
    cardHolderPicture = v13->_cardHolderPicture;
    v13->_cardHolderPicture = (PKImage *)v16;

    objc_autoreleasePoolPop(v14);
  }

  return v13;
}

+ (int64_t)imageSetType
{
  return 5;
}

+ (BOOL)shouldCache
{
  return 0;
}

- (void)preheatImages
{
  -[PKImage preheatBitmapData](self->_cardHolderPicture, "preheatBitmapData");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassDetailsImageSet)initWithCoder:(id)a3
{
  id v4;
  PKPassDetailsImageSet *v5;
  void *v6;
  uint64_t v7;
  PKImage *cardHolderPicture;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassDetailsImageSet;
  v5 = -[PKImageSet initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardHolderPicture"));
    v7 = objc_claimAutoreleasedReturnValue();
    cardHolderPicture = v5->_cardHolderPicture;
    v5->_cardHolderPicture = (PKImage *)v7;

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
  v7.super_class = (Class)PKPassDetailsImageSet;
  v5 = -[PKImageSet encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v6 = (void *)MEMORY[0x19400CFE8](v5);
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardHolderPicture, CFSTR("cardHolderPicture"));
  objc_autoreleasePoolPop(v6);

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_cardHolderPicture, v4[3]);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKImage imageHash](self->_cardHolderPicture, "imageHash");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (PKImage)cardHolderPicture
{
  return self->_cardHolderPicture;
}

- (void)setCardHolderPicture:(id)a3
{
  objc_storeStrong((id *)&self->_cardHolderPicture, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardHolderPicture, 0);
}

@end
