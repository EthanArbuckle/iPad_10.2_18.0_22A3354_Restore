@implementation PKPassFieldImage

+ (id)createForDictionary:(id)a3 bundle:(id)a4 privateBundle:(id)a5 passType:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  PKPassFieldImage *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSString *symbolName;
  uint64_t v18;
  NSString *imageName;
  void *v20;
  uint64_t v21;
  PKColor *backgroundColor;
  NSString *v23;
  PKImage *v24;
  PKImage *image;
  PKImage *v26;
  uint64_t v27;
  NSData *imageHash;
  PKPassFieldImage *v29;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [PKPassFieldImage alloc];
  v13 = v11;
  v14 = v10;
  v15 = v9;
  if (!v12)
    goto LABEL_13;
  v12 = -[PKPassFieldImage _init](v12, "_init");
  if (v12)
  {
    objc_msgSend(v13, "PKStringForKey:", CFSTR("symbolName"));
    v16 = objc_claimAutoreleasedReturnValue();
    symbolName = v12->_symbolName;
    v12->_symbolName = (NSString *)v16;

    objc_msgSend(v13, "PKStringForKey:", CFSTR("imageName"));
    v18 = objc_claimAutoreleasedReturnValue();
    imageName = v12->_imageName;
    v12->_imageName = (NSString *)v18;

    if (v12->_symbolName || v12->_imageName)
    {
      objc_msgSend(v13, "PKStringForKey:", CFSTR("tintColor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      PKSemanticColorFromString(v20, &v12->_tintColor);

      objc_msgSend(v13, "PKColorForKey:", CFSTR("backgroundColor"));
      v21 = objc_claimAutoreleasedReturnValue();
      backgroundColor = v12->_backgroundColor;
      v12->_backgroundColor = (PKColor *)v21;

      if (!v12->_symbolName)
      {
        v23 = v12->_imageName;
        if (v23)
        {
          +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", v23, v14, 0, 0.0);
          v24 = (PKImage *)objc_claimAutoreleasedReturnValue();
          if (!v24)
          {
            +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", v12->_imageName, v15, 0, 0.0);
            v24 = (PKImage *)objc_claimAutoreleasedReturnValue();
          }
          image = v12->_image;
          v12->_image = v24;
          v26 = v24;

          -[PKImage imageHash](v26, "imageHash");
          v27 = objc_claimAutoreleasedReturnValue();
          imageHash = v12->_imageHash;
          v12->_imageHash = (NSData *)v27;

        }
      }
      v12->_allowInternalSymbols = a6 == 1;
      goto LABEL_11;
    }
LABEL_13:
    v29 = 0;
    goto LABEL_12;
  }
LABEL_11:
  v12 = v12;
  v29 = v12;
LABEL_12:

  return v29;
}

- (PKPassFieldImage)init
{

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassFieldImage;
  return -[PKPassFieldImage init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassFieldImage)initWithCoder:(id)a3
{
  id v4;
  PKPassFieldImage *v5;
  uint64_t v6;
  NSString *symbolName;
  void *v8;
  uint64_t v9;
  PKImage *image;
  uint64_t v11;
  NSData *imageHash;
  uint64_t v13;
  PKColor *backgroundColor;
  void *v15;

  v4 = a3;
  v5 = -[PKPassFieldImage _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
    v6 = objc_claimAutoreleasedReturnValue();
    symbolName = v5->_symbolName;
    v5->_symbolName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PKSemanticColorFromString(v8, &v5->_tintColor);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v9 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (PKImage *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageHash"));
    v11 = objc_claimAutoreleasedReturnValue();
    imageHash = v5->_imageHash;
    v5->_imageHash = (NSData *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v13 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allowInternalSymbols"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allowInternalSymbols = objc_msgSend(v15, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *symbolName;
  id v5;
  void *v6;
  id v7;

  symbolName = self->_symbolName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", symbolName, CFSTR("symbolName"));
  PKSemanticColorToString(self->_tintColor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("tintColor"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_imageHash, CFSTR("imageHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundColor, CFSTR("backgroundColor"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowInternalSymbols);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("allowInternalSymbols"));

}

- (unint64_t)hash
{
  NSData *imageHash;

  -[NSString hash](self->_symbolName, "hash");
  imageHash = self->_imageHash;
  if (imageHash)
  {
    -[NSData bytes](imageHash, "bytes");
    -[NSData length](self->_imageHash, "length");
    SipHash();
  }
  -[PKColor hash](self->_backgroundColor, "hash");
  return SipHash();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  BOOL v6;
  id *v7;
  id *v8;
  NSString *symbolName;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  _BOOL4 v13;
  NSData *v14;
  NSData *imageHash;
  PKColor *v16;
  PKColor *backgroundColor;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
  {
    v7 = (id *)v4;
    v8 = v7;
    if (!self || v7[3] != (id)self->_tintColor)
      goto LABEL_22;
    symbolName = self->_symbolName;
    v10 = (NSString *)v7[2];
    v11 = symbolName;
    if (v10 == v11)
    {

    }
    else
    {
      v12 = v11;
      if (!v10 || !v11)
      {

        goto LABEL_22;
      }
      v13 = -[NSString isEqualToString:](v10, "isEqualToString:", v11);

      if (!v13)
        goto LABEL_22;
    }
    v14 = (NSData *)v8[5];
    imageHash = self->_imageHash;
    if (v14 && imageHash)
    {
      if ((-[NSData isEqual:](v14, "isEqual:") & 1) == 0)
        goto LABEL_22;
    }
    else if (v14 != imageHash)
    {
      goto LABEL_22;
    }
    v16 = (PKColor *)v8[6];
    backgroundColor = self->_backgroundColor;
    if (v16 && backgroundColor)
    {
      if (-[PKColor isEqual:](v16, "isEqual:"))
      {
LABEL_20:
        v6 = *((unsigned __int8 *)v8 + 8) == self->_allowInternalSymbols;
LABEL_23:

        goto LABEL_24;
      }
    }
    else if (v16 == backgroundColor)
    {
      goto LABEL_20;
    }
LABEL_22:
    v6 = 0;
    goto LABEL_23;
  }
LABEL_24:

  return v6;
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (int64_t)tintColor
{
  return self->_tintColor;
}

- (PKImage)image
{
  return self->_image;
}

- (NSData)imageHash
{
  return self->_imageHash;
}

- (PKColor)backgroundColor
{
  return self->_backgroundColor;
}

- (BOOL)allowInternalSymbols
{
  return self->_allowInternalSymbols;
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
