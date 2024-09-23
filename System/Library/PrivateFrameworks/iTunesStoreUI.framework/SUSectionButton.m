@implementation SUSectionButton

- (SUSectionButton)initWithSectionButtonDictionary:(id)a3
{
  SUSectionButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  float v11;
  void *v12;
  float v13;
  void *v14;
  float v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SUSectionButton;
  v4 = -[SUSectionButton init](&v20, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("accessibility-title"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_accessibilityTitle = (NSString *)v5;
    v6 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("title"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4->_displayTitle = (NSString *)v6;
    v7 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("tag"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4->_tag = objc_msgSend(v7, "integerValue");
    v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("inset-bottom"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "floatValue");
      v4->_imageInsets.bottom = v9;
    }
    v10 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("inset-left"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "floatValue");
      v4->_imageInsets.left = v11;
    }
    v12 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("inset-right"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "floatValue");
      v4->_imageInsets.right = v13;
    }
    v14 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("inset-top"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "floatValue");
      v4->_imageInsets.top = v15;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"), "scale");
    if (v16 == 2.0)
    {
      v17 = objc_msgSend(a3, "objectForKey:", CFSTR("image-url@2x"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4->_imageURL = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v17);
        v4->_imageURLScale = 2.0;
      }
    }
    if (!v4->_imageURL)
    {
      v18 = objc_msgSend(a3, "objectForKey:", CFSTR("image-url"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v4->_imageURL = (NSURL *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v18);
      v4->_imageURLScale = 1.0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUSectionButton;
  -[SUSectionButton dealloc](&v3, sel_dealloc);
}

- (void)applyToBarButtonItem:(id)a3
{
  UIImage *v5;

  objc_msgSend(a3, "setAccessibilityLabel:", -[SUSectionButton accessibilityTitle](self, "accessibilityTitle"));
  -[SUSectionButton imageInsets](self, "imageInsets");
  objc_msgSend(a3, "setImageInsets:");
  v5 = -[SUSectionButton image](self, "image");
  if (v5)
    objc_msgSend(a3, "setImage:", v5);
  else
    objc_msgSend(a3, "setTitle:", -[SUSectionButton displayTitle](self, "displayTitle"));
  objc_msgSend(a3, "setTag:", -[SUSectionButton tag](self, "tag"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  __int128 v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 8) = -[NSString copyWithZone:](self->_accessibilityTitle, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_displayTitle, "copyWithZone:", a3);
  *(_QWORD *)(v5 + 24) = self->_image;
  v6 = *(_OWORD *)&self->_imageInsets.bottom;
  *(_OWORD *)(v5 + 32) = *(_OWORD *)&self->_imageInsets.top;
  *(_OWORD *)(v5 + 48) = v6;
  *(_QWORD *)(v5 + 64) = -[NSURL copyWithZone:](self->_imageURL, "copyWithZone:", a3);
  *(float *)(v5 + 72) = self->_imageURLScale;
  *(_QWORD *)(v5 + 80) = self->_tag;
  return (id)v5;
}

- (NSString)accessibilityTitle
{
  return self->_accessibilityTitle;
}

- (void)setAccessibilityTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)displayTitle
{
  return self->_displayTitle;
}

- (void)setDisplayTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (UIEdgeInsets)imageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_imageInsets.top;
  left = self->_imageInsets.left;
  bottom = self->_imageInsets.bottom;
  right = self->_imageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setImageInsets:(UIEdgeInsets)a3
{
  self->_imageInsets = a3;
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (float)imageURLScale
{
  return self->_imageURLScale;
}

- (void)setImageURLScale:(float)a3
{
  self->_imageURLScale = a3;
}

- (int64_t)tag
{
  return self->_tag;
}

- (void)setTag:(int64_t)a3
{
  self->_tag = a3;
}

@end
