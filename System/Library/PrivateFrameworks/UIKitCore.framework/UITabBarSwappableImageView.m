@implementation UITabBarSwappableImageView

- (void)setCurrentImage
{
  int *v3;
  uint64_t v4;
  void *v5;
  id v6;
  objc_super v7;

  if (self->_showLandscape)
  {
    if (self->_showAlternate)
      v3 = &OBJC_IVAR___UITabBarSwappableImageView__alternate;
    else
      v3 = &OBJC_IVAR___UITabBarSwappableImageView__value;
    v4 = v3[2];
  }
  else
  {
    v3 = &OBJC_IVAR___UITabBarSwappableImageView__value;
    if (!self->_showAlternate)
    {
LABEL_9:
      v5 = *(Class *)((char *)&self->super.super.super.super.isa + *v3);
      goto LABEL_10;
    }
    v4 = 520;
  }
  v5 = *(Class *)((char *)&self->super.super.super.super.isa + v4);
  if (!v5)
    goto LABEL_9;
LABEL_10:
  v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)UITabBarSwappableImageView;
  -[UIImageView setImage:](&v7, sel_setImage_, v6);

}

- (void)showAlternateImage:(BOOL)a3
{
  if (self->_showAlternate != a3)
    self->_showAlternate = a3;
  -[UITabBarSwappableImageView setCurrentImage](self, "setCurrentImage");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  BOOL v6;
  double v7;
  double v8;
  _BOOL4 v9;
  objc_super v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (!self->_showLandscape)
    goto LABEL_8;
  if (self->_showAlternate)
  {
    if (!self->_landscapeAlternate)
    {
      v6 = -[UIImage isSymbolImage](self->_alternate, "isSymbolImage");
      v7 = 20.0;
      v8 = 20.0;
      if (!v6)
        goto LABEL_9;
    }
LABEL_8:
    v10.receiver = self;
    v10.super_class = (Class)UITabBarSwappableImageView;
    -[UIImageView sizeThatFits:](&v10, sel_sizeThatFits_, width, height);
    goto LABEL_9;
  }
  if (self->_landscapeValue)
    goto LABEL_8;
  v9 = -[UIImage isSymbolImage](self->_value, "isSymbolImage");
  v7 = 20.0;
  v8 = 20.0;
  if (v9)
    goto LABEL_8;
LABEL_9:
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setLandscape:(BOOL)a3
{
  if (self->_showLandscape != a3)
    self->_showLandscape = a3;
  -[UITabBarSwappableImageView setCurrentImage](self, "setCurrentImage");
}

- (id)_unselectedImage
{
  return self->_value;
}

- (UITabBarSwappableImageView)initWithImage:(id)a3 alternateImage:(id)a4 landscapeImage:(id)a5 landscapeAlternateImage:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  UITabBarSwappableImageView *v15;
  UITabBarSwappableImageView *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)UITabBarSwappableImageView;
  v15 = -[UIImageView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_value, a3);
    objc_storeStrong((id *)&v16->_alternate, a4);
    objc_storeStrong((id *)&v16->_landscapeValue, a5);
    objc_storeStrong((id *)&v16->_landscapeAlternate, a6);
    -[UIView setOpaque:](v16, "setOpaque:", 0);
    -[UITabBarSwappableImageView setCurrentImage](v16, "setCurrentImage");
    -[UIImageView setContentMode:](v16, "setContentMode:", 1);
  }
  -[UIImageView _setDefaultRenderingMode:](v16, "_setDefaultRenderingMode:", 2);

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_landscapeAlternate, 0);
  objc_storeStrong((id *)&self->_landscapeValue, 0);
  objc_storeStrong((id *)&self->_alternate, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

- (id)_unselectedCompactImage
{
  return self->_alternate;
}

- (id)_selectedImage
{
  return self->_landscapeValue;
}

- (id)_selectedCompactImage
{
  return self->_landscapeAlternate;
}

- (void)setAlternateImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_alternate != v5)
    objc_storeStrong((id *)&self->_alternate, a3);
  -[UITabBarSwappableImageView setCurrentImage](self, "setCurrentImage");

}

- (void)setImage:(id)a3
{
  UIImage *v5;

  v5 = (UIImage *)a3;
  if (self->_value != v5)
    objc_storeStrong((id *)&self->_value, a3);
  -[UITabBarSwappableImageView setCurrentImage](self, "setCurrentImage");

}

@end
