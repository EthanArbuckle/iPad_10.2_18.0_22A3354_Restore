@implementation PKPassDisplayProfile

- (void)setTallCode:(BOOL)a3
{
  self->_tallCode = a3;
}

- (void)setHasStripImage:(BOOL)a3
{
  self->_hasStripImage = a3;
}

- (void)setHasBackgroundImage:(BOOL)a3
{
  self->_hasBackgroundImage = a3;
}

- (void)setSecondaryBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryBackgroundColor, a3);
}

- (int64_t)layoutMode
{
  return PKScreenSize() <= 320.0;
}

- (PKPassDisplayProfile)initWithCoder:(id)a3
{
  id v4;
  PKPassDisplayProfile *v5;
  uint64_t v6;
  PKColor *backgroundColor;
  uint64_t v8;
  PKColor *secondaryBackgroundColor;
  uint64_t v10;
  PKColor *foregroundColor;
  uint64_t v12;
  PKColor *labelColor;
  uint64_t v14;
  PKColor *stripColor;
  uint64_t v16;
  NSData *manifestHash;
  uint64_t v18;
  PKColor *footerBackgroundColor;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPassDisplayProfile;
  v5 = -[PKDisplayProfile initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_passStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("passStyle"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secondaryBackgroundColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    secondaryBackgroundColor = v5->_secondaryBackgroundColor;
    v5->_secondaryBackgroundColor = (PKColor *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("foregroundColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    foregroundColor = v5->_foregroundColor;
    v5->_foregroundColor = (PKColor *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("labelColor"));
    v12 = objc_claimAutoreleasedReturnValue();
    labelColor = v5->_labelColor;
    v5->_labelColor = (PKColor *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stripColor"));
    v14 = objc_claimAutoreleasedReturnValue();
    stripColor = v5->_stripColor;
    v5->_stripColor = (PKColor *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manifestHash"));
    v16 = objc_claimAutoreleasedReturnValue();
    manifestHash = v5->_manifestHash;
    v5->_manifestHash = (NSData *)v16;

    v5->_tallCode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tallCode"));
    v5->_hasBackgroundImage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasBackgroundImage"));
    v5->_hasStripImage = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasStripImage"));
    v5->_supportsAutomaticForegroundVibrancy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsAutomaticForegroundVibrancy"));
    v5->_supportsAutomaticLabelVibrancy = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsAutomaticLabelVibrancy"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("footerBackgroundColor"));
    v18 = objc_claimAutoreleasedReturnValue();
    footerBackgroundColor = v5->_footerBackgroundColor;
    v5->_footerBackgroundColor = (PKColor *)v18;

    v5->_suppressesHeaderDarkening = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("suppressesHeaderDarkening"));
  }

  return v5;
}

- (BOOL)showsBackgroundImage
{
  unint64_t v3;
  BOOL result;

  v3 = -[PKPassDisplayProfile passStyle](self, "passStyle");
  result = 0;
  if (v3 <= 9 && ((1 << v3) & 0x244) != 0)
    return self->_hasBackgroundImage;
  return result;
}

- (int64_t)passStyle
{
  return self->_passStyle;
}

- (PKColor)backgroundColor
{
  return self->_backgroundColor;
}

- (PKColor)labelColor
{
  return self->_labelColor;
}

- (PKColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerBackgroundColor, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_stripColor, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_secondaryBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassDisplayProfile;
  v4 = a3;
  -[PKDisplayProfile encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_passStyle, CFSTR("passStyle"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundColor, CFSTR("backgroundColor"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_secondaryBackgroundColor, CFSTR("secondaryBackgroundColor"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_foregroundColor, CFSTR("foregroundColor"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_labelColor, CFSTR("labelColor"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_stripColor, CFSTR("stripColor"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_manifestHash, CFSTR("manifestHash"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_tallCode, CFSTR("tallCode"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasBackgroundImage, CFSTR("hasBackgroundImage"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasStripImage, CFSTR("hasStripImage"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsAutomaticForegroundVibrancy, CFSTR("supportsAutomaticForegroundVibrancy"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsAutomaticLabelVibrancy, CFSTR("supportsAutomaticLabelVibrancy"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_footerBackgroundColor, CFSTR("footerBackgroundColor"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_suppressesHeaderDarkening, CFSTR("suppressesHeaderDarkening"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)showsStripImage
{
  CGRect v4;

  v4.origin.x = PKPassFaceStripImageFrame(self);
  return !CGRectIsNull(v4) && self->_hasStripImage;
}

- (PKColor)stripColor
{
  return self->_stripColor;
}

- (int64_t)type
{
  return 0;
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (PKPassDisplayProfile)initWithDictionary:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  PKPassDisplayProfile *v8;
  unint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  PKBarcode *v26;
  PKBarcode *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  objc_super v36;

  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)PKPassDisplayProfile;
  v8 = -[PKDisplayProfile initWithDictionary:bundle:](&v36, sel_initWithDictionary_bundle_, v6, v7);
  if (v8)
  {
    v9 = PKPassStyleForCardDictionary(v6, v7);
    -[PKPassDisplayProfile setPassStyle:](v8, "setPassStyle:", v9);
    objc_msgSend(v6, "PKColorForKey:", CFSTR("backgroundColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if (v9 == 6)
      {
        v11 = 0.556862745;
        v12 = 0.576470588;
        v13 = 1.0;
        v14 = 0.556862745;
      }
      else
      {
        v11 = 1.0;
        v14 = 1.0;
        v12 = 1.0;
        v13 = 1.0;
      }
      +[PKColor colorWithR:G:B:A:](PKColor, "colorWithR:G:B:A:", v11, v14, v12, v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PKPassDisplayProfile setBackgroundColor:](v8, "setBackgroundColor:", v10);
    if (v9 == 7)
    {
      objc_msgSend(v6, "PKColorForKey:", CFSTR("secondaryBackgroundColor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassDisplayProfile setSecondaryBackgroundColor:](v8, "setSecondaryBackgroundColor:", v15);

    }
    objc_msgSend(v6, "PKColorForKey:", CFSTR("foregroundColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      if (v9 == 6)
      {
        objc_msgSend(v10, "luminance");
        if (v17 > 0.45)
        {
          v18 = 0.0;
          v19 = 0.0;
          v20 = 0.0;
        }
        else
        {
          v18 = 1.0;
          v19 = 1.0;
          v20 = 1.0;
        }
        +[PKColor colorWithR:G:B:A:](PKColor, "colorWithR:G:B:A:", v18, v19, v20, 1.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v9 == 9)
          -[PKPassDisplayProfile setSupportsAutomaticForegroundVibrancy:](v8, "setSupportsAutomaticForegroundVibrancy:", 1);
        v16 = 0;
      }
    }
    -[PKPassDisplayProfile setForegroundColor:](v8, "setForegroundColor:", v16);
    objc_msgSend(v6, "PKColorForKey:", CFSTR("labelColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      if (v9 == 9)
      {
        -[PKPassDisplayProfile setSupportsAutomaticLabelVibrancy:](v8, "setSupportsAutomaticLabelVibrancy:", 1);
        v22 = 1.0;
        v23 = 1.0;
        v24 = 1.0;
      }
      else
      {
        v22 = 0.0;
        v23 = 0.0;
        v24 = 0.0;
      }
      +[PKColor colorWithR:G:B:A:](PKColor, "colorWithR:G:B:A:", v22, v23, v24, 1.0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PKPassDisplayProfile setLabelColor:](v8, "setLabelColor:", v21);
    objc_msgSend(v6, "PKColorForKey:", CFSTR("stripColor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassDisplayProfile setStripColor:](v8, "setStripColor:", v25);

    v26 = -[PKBarcode initWithPassDictionary:bundle:]([PKBarcode alloc], "initWithPassDictionary:bundle:", v6, v7);
    v27 = v26;
    if (v26)
      -[PKPassDisplayProfile setTallCode:](v8, "setTallCode:", -[PKBarcode isTall](v26, "isTall"));
    objc_msgSend(v7, "bundleURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PKManifestHash(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassDisplayProfile setManifestHash:](v8, "setManifestHash:", v29);

    +[PKImage URLForImageNamed:inBundle:scale:](PKImage, "URLForImageNamed:inBundle:scale:", CFSTR("background"), v7, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_hasBackgroundImage = v30 != 0;

    if (v9 == 9 && !v8->_hasBackgroundImage)
    {
      +[PKImage URLForImageNamed:inBundle:scale:](PKImage, "URLForImageNamed:inBundle:scale:", CFSTR("artwork"), v7, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_hasBackgroundImage = v31 != 0;

    }
    +[PKImage URLForImageNamed:inBundle:scale:](PKImage, "URLForImageNamed:inBundle:scale:", CFSTR("strip"), v7, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_hasStripImage = v32 != 0;

    -[PKPassDisplayProfile setSuppressesHeaderDarkening:](v8, "setSuppressesHeaderDarkening:", objc_msgSend(v6, "PKBoolForKey:", CFSTR("suppressHeaderDarkening")));
    objc_msgSend(v6, "PKColorForKey:", CFSTR("footerBackgroundColor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassDisplayProfile setFooterBackgroundColor:](v8, "setFooterBackgroundColor:", v33);

    v34 = objc_msgSend(v6, "PKBoolForKey:", CFSTR("useAutomaticColors"));
    if (v9 == 9 && v34)
    {
      -[PKPassDisplayProfile setSupportsAutomaticForegroundVibrancy:](v8, "setSupportsAutomaticForegroundVibrancy:", 1);
      -[PKPassDisplayProfile setSupportsAutomaticLabelVibrancy:](v8, "setSupportsAutomaticLabelVibrancy:", 1);
    }

  }
  return v8;
}

- (void)setStripColor:(id)a3
{
  objc_storeStrong((id *)&self->_stripColor, a3);
}

- (void)setPassStyle:(int64_t)a3
{
  self->_passStyle = a3;
}

- (void)setManifestHash:(id)a3
{
  objc_storeStrong((id *)&self->_manifestHash, a3);
}

- (void)setLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_labelColor, a3);
}

- (void)setForegroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundColor, a3);
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (PKColor)secondaryBackgroundColor
{
  return self->_secondaryBackgroundColor;
}

- (BOOL)tallCode
{
  return self->_tallCode;
}

- (BOOL)hasBackgroundImage
{
  return self->_hasBackgroundImage;
}

- (BOOL)hasStripImage
{
  return self->_hasStripImage;
}

- (BOOL)supportsAutomaticForegroundVibrancy
{
  return self->_supportsAutomaticForegroundVibrancy;
}

- (void)setSupportsAutomaticForegroundVibrancy:(BOOL)a3
{
  self->_supportsAutomaticForegroundVibrancy = a3;
}

- (BOOL)supportsAutomaticLabelVibrancy
{
  return self->_supportsAutomaticLabelVibrancy;
}

- (void)setSupportsAutomaticLabelVibrancy:(BOOL)a3
{
  self->_supportsAutomaticLabelVibrancy = a3;
}

- (BOOL)suppressesHeaderDarkening
{
  return self->_suppressesHeaderDarkening;
}

- (void)setSuppressesHeaderDarkening:(BOOL)a3
{
  self->_suppressesHeaderDarkening = a3;
}

- (PKColor)footerBackgroundColor
{
  return self->_footerBackgroundColor;
}

- (void)setFooterBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_footerBackgroundColor, a3);
}

@end
