@implementation PKPassLogoImageSet

- (PKPassLogoImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKPassLogoImageSet *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v32.receiver = self;
  v32.super_class = (Class)PKPassLogoImageSet;
  v13 = -[PKImageSet initWithDisplayProfile:fileURL:screenScale:suffix:](&v32, sel_initWithDisplayProfile_fileURL_screenScale_suffix_, v10, v11, v12, a5);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("logo"), v14, v12, a5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassLogoImageSet setLogoImage:](v13, "setLogoImage:");
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("background"), v14, v12, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v10, "passStyle");
    if (v15)
      v17 = 0;
    else
      v17 = v16 == 9;
    if (v17)
    {
      +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("artwork"), v14, v12, a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PKPassLogoImageSet setBackgroundImage:](v13, "setBackgroundImage:", v15);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("strip"), v14, v12, a5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassLogoImageSet setStripImage:](v13, "setStripImage:");
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("footer"), v14, v12, a5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassLogoImageSet setFooterImage:](v13, "setFooterImage:");
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("altImage"), v14, v12, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassLogoImageSet setAltImage:](v13, "setAltImage:", v18);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("secondaryLogo"), v14, v12, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassLogoImageSet setSecondaryLogoImage:](v13, "setSecondaryLogoImage:", v19);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("cardBackgroundCombined"), v14, v12, a5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassLogoImageSet setCardBackgroundCombinedImage:](v13, "setCardBackgroundCombinedImage:", v20);

    -[PKPassLogoImageSet cardBackgroundCombinedImage](v13, "cardBackgroundCombinedImage");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("bankLogo"), v14, v12, a5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassLogoImageSet setBankLogoImage:](v13, "setBankLogoImage:", v22);

      +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("networkLogo"), v14, v12, a5);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassLogoImageSet setNetworkLogoImage:](v13, "setNetworkLogoImage:", v23);

      +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("cobrandLogo"), v14, v12, a5);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassLogoImageSet setCobrandLogoImage:](v13, "setCobrandLogoImage:", v24);

      +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("cardBackground"), v14, v12, a5);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassLogoImageSet setCardBackgroundImage:](v13, "setCardBackgroundImage:", v25);

    }
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("compactBankLogoDark"), v14, v12, a5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassLogoImageSet setCompactBankLogoDarkImage:](v13, "setCompactBankLogoDarkImage:", v26);
    +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", CFSTR("compactBankLogoLight"), v14, v12, a5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassLogoImageSet setCompactBankLogoLightImage:](v13, "setCompactBankLogoLightImage:", v27);

  }
  return v13;
}

- (void)setStripImage:(id)a3
{
  objc_storeStrong((id *)&self->_stripImage, a3);
}

- (void)setLogoImage:(id)a3
{
  objc_storeStrong((id *)&self->_logoImage, a3);
}

- (void)setFooterImage:(id)a3
{
  objc_storeStrong((id *)&self->_footerImage, a3);
}

- (void)setCompactBankLogoLightImage:(id)a3
{
  objc_storeStrong((id *)&self->_compactBankLogoLightImage, a3);
}

- (void)setCompactBankLogoDarkImage:(id)a3
{
  objc_storeStrong((id *)&self->_compactBankLogoDarkImage, a3);
}

- (void)setCardBackgroundCombinedImage:(id)a3
{
  objc_storeStrong((id *)&self->_cardBackgroundCombinedImage, a3);
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (void)setAltImage:(id)a3
{
  objc_storeStrong((id *)&self->_altImage, a3);
}

- (PKImage)cardBackgroundCombinedImage
{
  return self->_cardBackgroundCombinedImage;
}

- (void)setNetworkLogoImage:(id)a3
{
  objc_storeStrong((id *)&self->_networkLogoImage, a3);
}

- (void)setCobrandLogoImage:(id)a3
{
  objc_storeStrong((id *)&self->_cobrandLogoImage, a3);
}

- (void)setCardBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_cardBackgroundImage, a3);
}

- (void)setBankLogoImage:(id)a3
{
  objc_storeStrong((id *)&self->_bankLogoImage, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassLogoImageSet)initWithCoder:(id)a3
{
  id v4;
  PKPassLogoImageSet *v5;
  void *v6;
  uint64_t v7;
  PKImage *logoImage;
  uint64_t v9;
  PKImage *backgroundImage;
  uint64_t v11;
  PKImage *stripImage;
  uint64_t v13;
  PKImage *footerImage;
  uint64_t v15;
  PKImage *altImage;
  uint64_t v17;
  PKImage *bankLogoImage;
  uint64_t v19;
  PKImage *networkLogoImage;
  uint64_t v21;
  PKImage *cobrandLogoImage;
  uint64_t v23;
  PKImage *cardBackgroundImage;
  uint64_t v25;
  PKImage *cardBackgroundCombinedImage;
  uint64_t v27;
  PKImage *thumbnailImage;
  uint64_t v29;
  PKImage *compactBankLogoDarkImage;
  uint64_t v31;
  PKImage *compactBankLogoLightImage;
  uint64_t v33;
  PKImage *secondaryLogoImage;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PKPassLogoImageSet;
  v5 = -[PKImageSet initWithCoder:](&v36, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logoImage"));
    v7 = objc_claimAutoreleasedReturnValue();
    logoImage = v5->_logoImage;
    v5->_logoImage = (PKImage *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundImage"));
    v9 = objc_claimAutoreleasedReturnValue();
    backgroundImage = v5->_backgroundImage;
    v5->_backgroundImage = (PKImage *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stripImage"));
    v11 = objc_claimAutoreleasedReturnValue();
    stripImage = v5->_stripImage;
    v5->_stripImage = (PKImage *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footerImage"));
    v13 = objc_claimAutoreleasedReturnValue();
    footerImage = v5->_footerImage;
    v5->_footerImage = (PKImage *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altImage"));
    v15 = objc_claimAutoreleasedReturnValue();
    altImage = v5->_altImage;
    v5->_altImage = (PKImage *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bankLogoImage"));
    v17 = objc_claimAutoreleasedReturnValue();
    bankLogoImage = v5->_bankLogoImage;
    v5->_bankLogoImage = (PKImage *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkLogoImage"));
    v19 = objc_claimAutoreleasedReturnValue();
    networkLogoImage = v5->_networkLogoImage;
    v5->_networkLogoImage = (PKImage *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cobrandLogoImage"));
    v21 = objc_claimAutoreleasedReturnValue();
    cobrandLogoImage = v5->_cobrandLogoImage;
    v5->_cobrandLogoImage = (PKImage *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardBackgroundImage"));
    v23 = objc_claimAutoreleasedReturnValue();
    cardBackgroundImage = v5->_cardBackgroundImage;
    v5->_cardBackgroundImage = (PKImage *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cardBackgroundCombinedImage"));
    v25 = objc_claimAutoreleasedReturnValue();
    cardBackgroundCombinedImage = v5->_cardBackgroundCombinedImage;
    v5->_cardBackgroundCombinedImage = (PKImage *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thumbnailImage"));
    v27 = objc_claimAutoreleasedReturnValue();
    thumbnailImage = v5->_thumbnailImage;
    v5->_thumbnailImage = (PKImage *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compactBankLogoDarkImage"));
    v29 = objc_claimAutoreleasedReturnValue();
    compactBankLogoDarkImage = v5->_compactBankLogoDarkImage;
    v5->_compactBankLogoDarkImage = (PKImage *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("compactBankLogoLightImage"));
    v31 = objc_claimAutoreleasedReturnValue();
    compactBankLogoLightImage = v5->_compactBankLogoLightImage;
    v5->_compactBankLogoLightImage = (PKImage *)v31;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryLogoImage"));
    v33 = objc_claimAutoreleasedReturnValue();
    secondaryLogoImage = v5->_secondaryLogoImage;
    v5->_secondaryLogoImage = (PKImage *)v33;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryLogoImage, 0);
  objc_storeStrong((id *)&self->_compactBankLogoLightImage, 0);
  objc_storeStrong((id *)&self->_compactBankLogoDarkImage, 0);
  objc_storeStrong((id *)&self->_cardBackgroundCombinedImage, 0);
  objc_storeStrong((id *)&self->_cardBackgroundImage, 0);
  objc_storeStrong((id *)&self->_cobrandLogoImage, 0);
  objc_storeStrong((id *)&self->_networkLogoImage, 0);
  objc_storeStrong((id *)&self->_bankLogoImage, 0);
  objc_storeStrong((id *)&self->_altImage, 0);
  objc_storeStrong((id *)&self->_footerImage, 0);
  objc_storeStrong((id *)&self->_stripImage, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_logoImage, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKPassLogoImageSet;
  v5 = -[PKImageSet encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v6 = (void *)MEMORY[0x19400CFE8](v5);
  objc_msgSend(v4, "encodeObject:forKey:", self->_logoImage, CFSTR("logoImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundImage, CFSTR("backgroundImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_stripImage, CFSTR("stripImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_footerImage, CFSTR("footerImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_altImage, CFSTR("altImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bankLogoImage, CFSTR("bankLogoImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_networkLogoImage, CFSTR("networkLogoImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cobrandLogoImage, CFSTR("cobrandLogoImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardBackgroundImage, CFSTR("cardBackgroundImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_cardBackgroundCombinedImage, CFSTR("cardBackgroundCombinedImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_thumbnailImage, CFSTR("thumbnailImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_compactBankLogoDarkImage, CFSTR("compactBankLogoDarkImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_compactBankLogoLightImage, CFSTR("compactBankLogoLightImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_secondaryLogoImage, CFSTR("secondaryLogoImage"));
  objc_autoreleasePoolPop(v6);

}

- (PKImage)altImage
{
  return self->_altImage;
}

+ (BOOL)shouldCache
{
  return 0;
}

+ (int64_t)imageSetType
{
  return 4;
}

+ (unsigned)currentVersion
{
  return 7;
}

+ (id)archiveName
{
  return CFSTR("Logo");
}

- (PKImage)logoImage
{
  return self->_logoImage;
}

- (void)preheatImages
{
  -[PKImage preheatBitmapData](self->_logoImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_backgroundImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_stripImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_footerImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_altImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_bankLogoImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_networkLogoImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_cobrandLogoImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_cardBackgroundImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_cardBackgroundCombinedImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_compactBankLogoDarkImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_compactBankLogoLightImage, "preheatBitmapData");
  -[PKImage preheatBitmapData](self->_secondaryLogoImage, "preheatBitmapData");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_logoImage, v5[3])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_secondaryLogoImage, v5[16])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_backgroundImage, v5[4])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_stripImage, v5[6])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_footerImage, v5[7])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_altImage, v5[8])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_bankLogoImage, v5[9])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_networkLogoImage, v5[10])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_cobrandLogoImage, v5[11])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_cardBackgroundImage, v5[12])
      && -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_cardBackgroundCombinedImage, v5[13])&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_compactBankLogoDarkImage, v5[14])&& -[PKImageSet _isSetImage:equalToImage:](self, "_isSetImage:equalToImage:", self->_compactBankLogoLightImage, v5[15]);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  -[PKImage imageHash](self->_logoImage, "imageHash");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v29, "hash");
  -[PKImage imageHash](self->_secondaryLogoImage, "imageHash");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v28, "hash") + v3;
  -[PKImage imageHash](self->_backgroundImage, "imageHash");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v27, "hash");
  -[PKImage imageHash](self->_stripImage, "imageHash");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 + v5 + objc_msgSend(v26, "hash");
  -[PKImage imageHash](self->_footerImage, "imageHash");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v25, "hash");
  -[PKImage imageHash](self->_altImage, "imageHash");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 + objc_msgSend(v24, "hash");
  -[PKImage imageHash](self->_bankLogoImage, "imageHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 + v8 + objc_msgSend(v9, "hash");
  -[PKImage imageHash](self->_networkLogoImage, "imageHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[PKImage imageHash](self->_cobrandLogoImage, "imageHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 + objc_msgSend(v13, "hash");
  -[PKImage imageHash](self->_cardBackgroundImage, "imageHash");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 + objc_msgSend(v15, "hash");
  -[PKImage imageHash](self->_cardBackgroundCombinedImage, "imageHash");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v10 + v16 + objc_msgSend(v17, "hash");
  -[PKImage imageHash](self->_compactBankLogoDarkImage, "imageHash");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash");
  -[PKImage imageHash](self->_compactBankLogoLightImage, "imageHash");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v18 + v20 + objc_msgSend(v21, "hash");

  return v22;
}

- (PKImage)backgroundImage
{
  return self->_backgroundImage;
}

- (PKImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImage, a3);
}

- (PKImage)stripImage
{
  return self->_stripImage;
}

- (PKImage)footerImage
{
  return self->_footerImage;
}

- (PKImage)bankLogoImage
{
  return self->_bankLogoImage;
}

- (PKImage)networkLogoImage
{
  return self->_networkLogoImage;
}

- (PKImage)cobrandLogoImage
{
  return self->_cobrandLogoImage;
}

- (PKImage)cardBackgroundImage
{
  return self->_cardBackgroundImage;
}

- (PKImage)compactBankLogoDarkImage
{
  return self->_compactBankLogoDarkImage;
}

- (PKImage)compactBankLogoLightImage
{
  return self->_compactBankLogoLightImage;
}

- (PKImage)secondaryLogoImage
{
  return self->_secondaryLogoImage;
}

- (void)setSecondaryLogoImage:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLogoImage, a3);
}

@end
