@implementation PKPassTileAccessoryImage

+ (id)createAccessoryImageWithImage:(id)a3
{
  id v5;
  id *v6;
  objc_super v8;

  v5 = a3;
  if (v5)
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___PKPassTileAccessoryImage;
    v6 = (id *)objc_msgSendSuper2(&v8, sel__createForType_resolved_, 2, 1);
    objc_storeStrong(v6 + 3, a3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)createDefaultDisclosureAccessoryImage
{
  id v2;
  id v3;

  v2 = +[PKPassTileImage _createDefaultDisclosureImage](PKPassTileImage, "_createDefaultDisclosureImage");
  v3 = +[PKPassTileAccessory _createForType:resolved:](PKPassTileAccessory, "_createForType:resolved:", 2, 1);
  objc_msgSend(v3, "setImage:", v2);

  return v3;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4;
  void *v5;
  PKPassTileImage *v6;
  PKPassTileImage *image;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassTileAccessoryImage;
  if (-[PKPassTileAccessory _setUpWithDictionary:](&v10, sel__setUpWithDictionary_, v4))
  {
    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("image"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PKPassTileImage _createForDictionary:](PKPassTileImage, "_createForDictionary:", v5);
    image = self->_image;
    self->_image = v6;

    v8 = self->_image != 0;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)createResolvedAccessoryWithBundle:(id)a3 privateBundle:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  id v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPassTileAccessoryImage;
  v6 = a4;
  v7 = a3;
  v8 = -[PKPassTileAccessory createResolvedAccessoryWithBundle:privateBundle:](&v12, sel_createResolvedAccessoryWithBundle_privateBundle_, v7, v6);
  v9 = -[PKPassTileImage createResolvedImageWithBundle:privateBundle:](self->_image, "createResolvedImageWithBundle:privateBundle:", v7, v6, v12.receiver, v12.super_class);

  v10 = (void *)v8[3];
  v8[3] = v9;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileAccessoryImage)initWithCoder:(id)a3
{
  id v4;
  PKPassTileAccessoryImage *v5;
  uint64_t v6;
  PKPassTileImage *image;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassTileAccessoryImage;
  v5 = -[PKPassTileAccessory initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("image"));
    v6 = objc_claimAutoreleasedReturnValue();
    image = v5->_image;
    v5->_image = (PKPassTileImage *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPassTileAccessoryImage;
  v4 = a3;
  -[PKPassTileAccessory encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_image, CFSTR("image"), v5.receiver, v5.super_class);

}

- (unint64_t)hash
{
  objc_super v4;
  id v5;
  unint64_t v6;

  v4.receiver = self;
  v4.super_class = (Class)PKPassTileAccessoryImage;
  v5 = -[PKPassTileAccessory hash](&v4, sel_hash);
  v6 = -[PKPassTileImage hash](self->_image, "hash");
  return SipHash();
}

- (BOOL)_isEqual:(id)a3
{
  _QWORD *v4;
  PKPassTileImage *v5;
  PKPassTileImage *image;
  BOOL v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassTileAccessoryImage;
  if (-[PKPassTileAccessory _isEqual:](&v10, sel__isEqual_, v4))
  {
    v5 = (PKPassTileImage *)v4[3];
    image = self->_image;
    if (v5)
      v7 = image == 0;
    else
      v7 = 1;
    if (v7)
      v8 = v5 == image;
    else
      v8 = -[PKPassTileImage isEqual:](v5, "isEqual:");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (PKPassTileImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
}

@end
