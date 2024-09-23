@implementation _UILegibilityImageSet

+ (id)imageFromImage:(id)a3 withShadowImage:(id)a4
{
  return -[_UILegibilityImageSet initWithImage:shadowImage:]([_UILegibilityImageSet alloc], "initWithImage:shadowImage:", a3, a4);
}

- (_UILegibilityImageSet)initWithImage:(id)a3 shadowImage:(id)a4
{
  _UILegibilityImageSet *v6;
  _UILegibilityImageSet *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UILegibilityImageSet;
  v6 = -[_UILegibilityImageSet init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[_UILegibilityImageSet setImage:](v6, "setImage:", a3);
    -[_UILegibilityImageSet setShadowImage:](v7, "setShadowImage:", a4);
  }
  return v7;
}

- (id)imageSetFlippedForRightToLeft
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImage:shadowImage:", -[UIImage imageFlippedForRightToLeftLayoutDirection](-[_UILegibilityImageSet image](self, "image"), "imageFlippedForRightToLeftLayoutDirection"), -[UIImage imageFlippedForRightToLeftLayoutDirection](-[_UILegibilityImageSet shadowImage](self, "shadowImage"), "imageFlippedForRightToLeftLayoutDirection"));
}

- (_UILegibilityImageSet)imageSetWithOrientation:(int64_t)a3
{
  UIImage *v5;
  UIImage *v6;
  uint64_t v7;
  UIImage *v8;
  uint64_t v9;

  v5 = -[_UILegibilityImageSet image](self, "image");
  v6 = -[_UILegibilityImageSet shadowImage](self, "shadowImage");
  v7 = -[UIImage CGImage](v5, "CGImage");
  -[UIImage scale](v5, "scale");
  v8 = +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v7, a3);
  v9 = -[UIImage CGImage](v6, "CGImage");
  -[UIImage scale](v6, "scale");
  return (_UILegibilityImageSet *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithImage:shadowImage:", v8, +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v9, a3));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UILegibilityImageSet;
  -[_UILegibilityImageSet dealloc](&v3, sel_dealloc);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (void)setShadowImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
