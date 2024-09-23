@implementation TLKImage

+ (BOOL)isTemplateImage:(id)a3
{
  return objc_msgSend(a3, "renderingMode") == 2;
}

- (TLKImage)init
{
  return -[TLKImage initWithImage:](self, "initWithImage:", 0);
}

- (TLKImage)initWithImage:(id)a3
{
  id v4;
  TLKImage *v5;
  TLKImage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TLKImage;
  v5 = -[TLKImage init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[TLKImage setUiImage:](v5, "setUiImage:", v4);
    if ((objc_msgSend((id)objc_opt_class(), "imageIsSymbol:", v4) & 1) == 0)
    {
      objc_msgSend(v4, "size");
      -[TLKImage setSize:](v6, "setSize:");
    }
    -[TLKImage setIsTemplate:](v6, "setIsTemplate:", objc_msgSend((id)objc_opt_class(), "isTemplateImage:", v4));
  }

  return v6;
}

+ (id)templateImageForImage:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  if ((objc_msgSend(a1, "isTemplateImage:", v4) & 1) == 0)
  {
    objc_msgSend(v4, "imageWithRenderingMode:", 2);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  return v4;
}

+ (id)applyTintColor:(id)a3 toImage:(id)a4
{
  return (id)objc_msgSend(a4, "imageWithTintColor:", a3);
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[TLKImage uiImage](self, "uiImage");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, uint64_t))a5 + 2))(v7, v8, 1);

}

- (id)cachedImageForScale:(double)a3 isDarkStyle:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  -[TLKImage imageCache](self, "imageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "keyForScale:isDarkStyle:", v4, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)cacheImage:(id)a3 forScale:(double)a4 isDarkStyle:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v8 = a3;
  -[TLKImage imageCache](self, "imageCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = (void *)objc_opt_new();
    -[TLKImage setImageCache:](self, "setImageCache:", v10);

  }
  -[TLKImage imageCache](self, "imageCache");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "keyForScale:isDarkStyle:", v5, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v8, v11);

}

+ (id)keyForScale:(double)a3 isDarkStyle:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)imageIsSymbol:(id)a3
{
  return objc_msgSend(a3, "isSymbolImage");
}

- (double)aspectRatio
{
  double v3;
  double v4;

  -[TLKImage size](self, "size");
  if (v4 == 0.0)
    return self->_aspectRatio;
  else
    return v3 / v4;
}

- (UIImage)uiImage
{
  return self->_uiImage;
}

- (void)setUiImage:(id)a3
{
  objc_storeStrong((id *)&self->_uiImage, a3);
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (BOOL)isTemplate
{
  return self->_isTemplate;
}

- (void)setIsTemplate:(BOOL)a3
{
  self->_isTemplate = a3;
}

- (unint64_t)cornerRoundingStyle
{
  return self->_cornerRoundingStyle;
}

- (void)setCornerRoundingStyle:(unint64_t)a3
{
  self->_cornerRoundingStyle = a3;
}

- (BOOL)supportsFastPathShadow
{
  return self->_supportsFastPathShadow;
}

- (void)setSupportsFastPathShadow:(BOOL)a3
{
  self->_supportsFastPathShadow = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (TLKImage)badgeImage
{
  return self->_badgeImage;
}

- (void)setBadgeImage:(id)a3
{
  objc_storeStrong((id *)&self->_badgeImage, a3);
}

- (NSCache)imageCache
{
  return (NSCache *)objc_getProperty(self, a2, 56, 1);
}

- (void)setImageCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_badgeImage, 0);
  objc_storeStrong((id *)&self->_uiImage, 0);
}

@end
