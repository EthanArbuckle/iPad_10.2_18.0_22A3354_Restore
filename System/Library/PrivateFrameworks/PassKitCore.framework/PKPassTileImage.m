@implementation PKPassTileImage

+ (id)_createForDictionary:(id)a3
{
  id v3;
  PKPassTileImage *v4;
  id v5;
  uint64_t v6;
  NSString *symbolName;
  uint64_t v8;
  NSString *imageName;
  void *v10;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = [PKPassTileImage alloc];
  v5 = v3;
  if (v4)
  {
    v4 = -[PKPassTileImage _init](v4, "_init");
    if (v4)
    {
      objc_msgSend(v5, "PKStringForKey:", CFSTR("symbolName"));
      v6 = objc_claimAutoreleasedReturnValue();
      symbolName = v4->_symbolName;
      v4->_symbolName = (NSString *)v6;

      objc_msgSend(v5, "PKStringForKey:", CFSTR("imageName"));
      v8 = objc_claimAutoreleasedReturnValue();
      imageName = v4->_imageName;
      v4->_imageName = (NSString *)v8;

      objc_msgSend(v5, "PKStringForKey:", CFSTR("tintColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKSemanticColorFromString(v10, &v4->_tintColor);

    }
  }

  return v4;
}

+ (id)_createDefaultDisclosureImage
{
  id v2;

  v2 = -[PKPassTileImage _init]([PKPassTileImage alloc], "_init");
  objc_msgSend(v2, "setSymbolName:", CFSTR("chevron.forward"));
  objc_msgSend(v2, "setTintColor:", 3);
  return v2;
}

- (PKPassTileImage)init
{

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassTileImage;
  return -[PKPassTileImage init](&v3, sel_init);
}

+ (id)createWithSymbolName:(id)a3 tintColor:(int64_t)a4
{
  return (id)objc_msgSend(a1, "createWithSymbolName:contextMenuSymbolName:tintColor:", a3, 0, a4);
}

+ (id)createWithSymbolName:(id)a3 contextMenuSymbolName:(id)a4 tintColor:(int64_t)a5
{
  id v5;
  id v7;
  id v8;

  v5 = a3;
  if (a3)
  {
    v7 = a4;
    v8 = v5;
    v5 = -[PKPassTileImage _init]([PKPassTileImage alloc], "_init");
    objc_msgSend(v5, "setSymbolName:", v8);

    objc_msgSend(v5, "setContextMenuSymbolName:", v7);
    objc_msgSend(v5, "setTintColor:", a5);
  }
  return v5;
}

+ (id)createImageWithImage:(id)a3 tintColor:(int64_t)a4 hasColorContent:(BOOL)a5
{
  id v8;
  id *v9;
  uint64_t v10;
  id v11;

  v8 = a3;
  if (v8)
  {
    v9 = -[PKPassTileImage _init]([PKPassTileImage alloc], "_init");
    objc_storeStrong(v9 + 4, a3);
    v9[3] = (id)a4;
    objc_msgSend(v8, "imageHash");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v9[5];
    v9[5] = (id)v10;

    *((_BYTE *)v9 + 9) = a5;
    *((_BYTE *)v9 + 8) = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)createResolvedImageWithBundle:(id)a3 privateBundle:(id)a4
{
  id v6;
  id v7;
  id *v8;
  NSString *imageName;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (self->_resolved)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPassTileImage attempting double resolution."));
  v8 = -[PKPassTileImage _init]([PKPassTileImage alloc], "_init");
  objc_storeStrong(v8 + 2, self->_symbolName);
  v8[3] = (id)self->_tintColor;
  *((_BYTE *)v8 + 9) = self->_hasColorContent;
  if (!self->_symbolName)
  {
    imageName = self->_imageName;
    if (imageName)
    {
      +[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", imageName, v6, 0, 0.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10
        || (+[PKImage imageNamed:inBundle:screenScale:suffix:](PKImage, "imageNamed:inBundle:screenScale:suffix:", self->_imageName, v7, 0, 0.0), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = v8[4];
        v8[4] = v10;
        v12 = v10;

        objc_msgSend(v12, "imageHash");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v8[5];
        v8[5] = (id)v13;

      }
    }
  }
  *((_BYTE *)v8 + 8) = 1;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileImage)initWithCoder:(id)a3
{
  id v4;
  PKPassTileImage *v5;
  uint64_t v6;
  NSString *symbolName;
  uint64_t v8;
  PKImage *image;
  uint64_t v10;
  NSData *imageHash;
  void *v12;

  v4 = a3;
  v5 = -[PKPassTileImage _init](self, "_init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolName"));
    v6 = objc_claimAutoreleasedReturnValue();
    symbolName = v5->_symbolName;
    v5->_symbolName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v8 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (PKImage *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageHash"));
    v10 = objc_claimAutoreleasedReturnValue();
    imageHash = v5->_imageHash;
    v5->_imageHash = (NSData *)v10;

    v5->_hasColorContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasColorContent"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKSemanticColorFromString(v12, &v5->_tintColor);

    v5->_resolved = 1;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (!self->_resolved)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPassTileImage attempting unresolved XPC transfer."));
    v4 = v6;
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_symbolName, CFSTR("symbolName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_image, CFSTR("image"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_imageHash, CFSTR("imageHash"));
  PKSemanticColorToString(self->_tintColor);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("tintColor"));

  objc_msgSend(v6, "encodeBool:forKey:", self->_hasColorContent, CFSTR("hasColorContent"));
}

- (unint64_t)hash
{
  NSData *imageHash;

  -[NSString hash](self->_symbolName, "hash");
  if (self->_resolved)
  {
    imageHash = self->_imageHash;
    if (imageHash)
    {
      -[NSData bytes](imageHash, "bytes");
      -[NSData length](self->_imageHash, "length");
      SipHash();
    }
  }
  else
  {
    -[NSString hash](self->_imageName, "hash");
  }
  return SipHash();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  char v6;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (v4 && (isKindOfClass & 1) != 0)
    v6 = -[PKPassTileImage _isEqual:]((uint64_t)self, v4);

  return v6;
}

- (uint64_t)_isEqual:(uint64_t)a1
{
  id *v3;
  id *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  int v16;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (*((unsigned __int8 *)v3 + 8) != *(unsigned __int8 *)(a1 + 8)
      || v3[3] != *(id *)(a1 + 24)
      || *((unsigned __int8 *)v3 + 9) != *(unsigned __int8 *)(a1 + 9))
    {
      goto LABEL_27;
    }
    v5 = *(void **)(a1 + 16);
    v6 = v3[2];
    v7 = v5;
    if (v6 == v7)
    {

    }
    else
    {
      v8 = v7;
      if (!v6 || !v7)
      {

        goto LABEL_27;
      }
      v9 = objc_msgSend(v6, "isEqualToString:", v7);

      if (!v9)
        goto LABEL_27;
    }
    if (*(_BYTE *)(a1 + 8))
    {
      v10 = v4[5];
      v11 = *(id *)(a1 + 40);
      if (v10 && v11)
      {
        if ((objc_msgSend(v10, "isEqual:") & 1) == 0)
          goto LABEL_27;
        goto LABEL_25;
      }
      if (v10 == v11)
      {
LABEL_25:
        a1 = 1;
        goto LABEL_28;
      }
    }
    else
    {
      v12 = *(void **)(a1 + 56);
      v13 = v4[7];
      v14 = v12;
      if (v13 == v14)
      {

        goto LABEL_25;
      }
      v15 = v14;
      if (v13 && v14)
      {
        v16 = objc_msgSend(v13, "isEqualToString:", v14);

        if (!v16)
          goto LABEL_27;
        goto LABEL_25;
      }

    }
LABEL_27:
    a1 = 0;
  }
LABEL_28:

  return a1;
}

- (BOOL)isEqualToUnresolvedImage:(id)a3
{
  if (self->_resolved)
    return 0;
  else
    return -[PKPassTileImage _isEqual:]((uint64_t)self, a3);
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void)setSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(int64_t)a3
{
  self->_tintColor = a3;
}

- (BOOL)isResolved
{
  return self->_resolved;
}

- (PKImage)image
{
  return self->_image;
}

- (NSData)imageHash
{
  return self->_imageHash;
}

- (BOOL)hasColorContent
{
  return self->_hasColorContent;
}

- (void)setHasColorContent:(BOOL)a3
{
  self->_hasColorContent = a3;
}

- (NSString)contextMenuSymbolName
{
  return self->_contextMenuSymbolName;
}

- (void)setContextMenuSymbolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_contextMenuSymbolName, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_symbolName, 0);
}

@end
