@implementation _UILegibilityView

- (_UILegibilityView)initWithStyle:(int64_t)a3 image:(id)a4
{
  return -[_UILegibilityView initWithStyle:image:shadowImage:](self, "initWithStyle:image:shadowImage:", a3, a4, 0);
}

- (_UILegibilityView)initWithStyle:(int64_t)a3 image:(id)a4 shadowImage:(id)a5
{
  return -[_UILegibilityView initWithSettings:strength:image:shadowImage:options:](self, "initWithSettings:strength:image:shadowImage:options:", +[_UILegibilitySettings sharedInstanceForStyle:](_UILegibilitySettings, "sharedInstanceForStyle:", a3, a4, a5), a4, 0, 0, 1.5);
}

- (_UILegibilityView)initWithSettings:(id)a3 strength:(double)a4 image:(id)a5
{
  return -[_UILegibilityView initWithSettings:strength:image:shadowImage:options:](self, "initWithSettings:strength:image:shadowImage:options:", a3, a5, 0, 0, a4);
}

- (_UILegibilityView)initWithSettings:(id)a3 strength:(double)a4 image:(id)a5 shadowImage:(id)a6
{
  return -[_UILegibilityView initWithSettings:strength:image:shadowImage:options:](self, "initWithSettings:strength:image:shadowImage:options:", a3, a5, a6, 0, a4);
}

- (_UILegibilityView)initWithSettings:(id)a3 strength:(double)a4 image:(id)a5 shadowImage:(id)a6 options:(int64_t)a7
{
  double v13;
  double v14;
  double v15;
  _UILegibilityView *v16;
  _UILegibilityView *v17;
  objc_super v19;

  objc_msgSend(a5, "size");
  v14 = v13;
  objc_msgSend(a5, "size");
  v19.receiver = self;
  v19.super_class = (Class)_UILegibilityView;
  v16 = -[UIView initWithFrame:](&v19, sel_initWithFrame_, 0.0, 0.0, v14, v15);
  v17 = v16;
  if (v16)
  {
    -[CALayer setAllowsGroupBlending:](-[UIView layer](v16, "layer"), "setAllowsGroupBlending:", 0);
    -[_UILegibilityView setStrength:](v17, "setStrength:", a4);
    -[_UILegibilityView setOptions:](v17, "setOptions:", a7);
    -[_UILegibilityView setSettings:image:shadowImage:](v17, "setSettings:image:shadowImage:", a3, a5, a6);
  }
  return v17;
}

- (void)setOptions:(int64_t)a3
{
  self->_options = a3;
}

- (void)dealloc
{
  objc_super v3;

  _DecrementImageUsage((uint64_t)self->_image);

  self->_settings = 0;
  self->_image = 0;

  self->_shadowImage = 0;
  -[UIView removeFromSuperview](self->_imageView, "removeFromSuperview");

  self->_imageView = 0;
  -[UIView removeFromSuperview](self->_shadowImageView, "removeFromSuperview");

  self->_shadowImageView = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UILegibilityView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (int64_t)style
{
  return -[_UILegibilitySettings style](-[_UILegibilityView settings](self, "settings"), "style");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIImage size](-[_UILegibilityView image](self, "image", a3.width, a3.height), "size");
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setHidesImage:(BOOL)a3
{
  self->_hidesImage = a3;
  -[UIImageView setHidden:](-[_UILegibilityView imageView](self, "imageView"), "setHidden:", a3);
}

- (void)setImage:(id)a3
{
  UIImage *image;

  image = self->_image;
  if (image != a3)
  {
    _DecrementImageUsage((uint64_t)image);

    self->_image = (UIImage *)a3;
    if (a3)
    {
      if (qword_1ECD78B40 != -1)
        dispatch_once(&qword_1ECD78B40, &__block_literal_global_396);
      objc_msgSend((id)qword_1ECD78B38, "addObject:", a3);
    }
  }
}

- (void)setImage:(id)a3 shadowImage:(id)a4
{
  -[_UILegibilityView setSettings:image:shadowImage:](self, "setSettings:image:shadowImage:", -[_UILegibilityView settings](self, "settings"), a3, a4);
}

- (void)setStyle:(int64_t)a3 image:(id)a4 shadowImage:(id)a5
{
  -[_UILegibilityView setSettings:image:shadowImage:](self, "setSettings:image:shadowImage:", +[_UILegibilitySettings sharedInstanceForStyle:](_UILegibilitySettings, "sharedInstanceForStyle:", a3), a4, a5);
}

- (void)setSettings:(id)a3 image:(id)a4 shadowImage:(id)a5
{
  double v9;
  double v10;
  UIImageView *v11;
  _UILegibilityImageView *v12;
  _UILegibilitySettings *v13;
  double v14;
  UIImage *v15;
  UIImageView *v16;
  _UILegibilityImageView *v17;
  uint64_t v18;

  -[_UILegibilityView setSettings:](self, "setSettings:");
  -[_UILegibilityView setImage:](self, "setImage:", a4);
  -[_UILegibilityView setShadowImage:](self, "setShadowImage:", a5);
  if (a4 && (objc_msgSend(a4, "size"), v9 >= 1.0) && (objc_msgSend(a4, "size"), v10 >= 1.0))
  {
    if (__51___UILegibilityView_setSettings_image_shadowImage___block_invoke(a4))
      a4 = (id)objc_msgSend(a4, "imageWithTintColor:", -[_UILegibilityView drawingColor](self, "drawingColor"));
    v11 = -[_UILegibilityView imageView](self, "imageView");
    if (v11)
    {
      v12 = (_UILegibilityImageView *)v11;
      -[UIImageView setImage:](v11, "setImage:", a4);
      -[UIView sizeToFit](-[_UILegibilityView imageView](self, "imageView"), "sizeToFit");
    }
    else
    {
      v12 = -[UIImageView initWithImage:]([_UILegibilityImageView alloc], "initWithImage:", a4);
      -[_UILegibilityView setImageView:](self, "setImageView:", v12);
      -[UIView addSubview:](self, "addSubview:", v12);
    }
    -[UIImageView setHidden:](v12, "setHidden:", self->_hidesImage);
    if (!-[_UILegibilityView shadowImage](self, "shadowImage"))
    {
      v13 = (_UILegibilitySettings *)a3;
      if (-[_UILegibilityView usesColorFilters](self, "usesColorFilters"))
      {
        v13 = -[_UILegibilitySettings initWithStyle:primaryColor:secondaryColor:shadowColor:]([_UILegibilitySettings alloc], "initWithStyle:primaryColor:secondaryColor:shadowColor:", -[_UILegibilitySettings style](self->_settings, "style"), -[_UILegibilitySettings primaryColor](self->_settings, "primaryColor"), -[_UILegibilitySettings secondaryColor](self->_settings, "secondaryColor"), +[UIColor whiteColor](UIColor, "whiteColor"));
        -[_UILegibilitySettings minFillHeight](self->_settings, "minFillHeight");
        -[_UILegibilitySettings setMinFillHeight:](v13, "setMinFillHeight:");
      }
      -[_UILegibilityView strength](self, "strength");
      if (v14 != 0.0)
      {
        v15 = -[_UILegibilityView image](self, "image");
        -[_UILegibilityView strength](self, "strength");
        -[_UILegibilityView setShadowImage:](self, "setShadowImage:", -[UIImage _imageForLegibilitySettings:strength:alphaOnly:](v15, "_imageForLegibilitySettings:strength:alphaOnly:", v13, 1));
      }
    }
    v16 = -[_UILegibilityView shadowImageView](self, "shadowImageView");
    if (v16)
    {
      v17 = (_UILegibilityImageView *)v16;
      -[UIImageView setImage:](v16, "setImage:", -[_UILegibilityView shadowImage](self, "shadowImage"));
      -[UIView sizeToFit](v17, "sizeToFit");
    }
    else
    {
      v17 = -[UIImageView initWithImage:]([_UILegibilityImageView alloc], "initWithImage:", -[_UILegibilityView shadowImage](self, "shadowImage"));
      -[_UILegibilityView setShadowImageView:](self, "setShadowImageView:", v17);
      -[UIView addSubview:](self, "addSubview:", v17);
      -[UIView sendSubviewToBack:](self, "sendSubviewToBack:", v17);
    }
    -[UIImageView _applySettingsForLegibilityStyle:](v17, "_applySettingsForLegibilityStyle:", -[_UILegibilityView style](self, "style"));
    if (__51___UILegibilityView_setSettings_image_shadowImage___block_invoke(-[UIImageView image](v17, "image")))
      v18 = objc_msgSend((id)objc_msgSend(a3, "shadowColor"), "CGColor");
    else
      v18 = 0;
    -[CALayer setContentsMultiplyColor:](-[UIView layer](v17, "layer"), "setContentsMultiplyColor:", v18);
    -[_UILegibilityView _updateFilters](self, "_updateFilters");
  }
  else
  {
    -[_UILegibilityView setImage:](self, "setImage:", 0);
    -[UIImageView setImage:](-[_UILegibilityView imageView](self, "imageView"), "setImage:", 0);
    -[UIImageView setImage:](-[_UILegibilityView shadowImageView](self, "shadowImageView"), "setImage:", 0);
  }
}

- (void)updateForChangedSettings:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIImage *v14;
  _UILegibilitySettings *v15;

  v15 = -[_UILegibilityView settings](self, "settings");
  -[_UILegibilityView setSettings:](self, "setSettings:", a3);
  if (-[_UILegibilityView usesColorFilters](self, "usesColorFilters")
    && -[_UILegibilityView image](self, "image")
    && -[_UILegibilityView imageView](self, "imageView"))
  {
    -[UIImageView _applySettingsForLegibilityStyle:](-[_UILegibilityView shadowImageView](self, "shadowImageView"), "_applySettingsForLegibilityStyle:", -[_UILegibilityView style](self, "style"));
    -[_UILegibilityView _updateFilters](self, "_updateFilters");
  }
  else
  {
    -[_UILegibilityView updateImage](self, "updateImage");
    objc_msgSend(a3, "shadowRadius");
    v6 = v5;
    -[_UILegibilitySettings shadowRadius](v15, "shadowRadius");
    if (vabdd_f64(v6, v7) <= 2.22044605e-16
      && (objc_msgSend(a3, "shadowAlpha"),
          v9 = v8,
          -[_UILegibilitySettings shadowAlpha](v15, "shadowAlpha"),
          vabdd_f64(v9, v10) <= 2.22044605e-16)
      && (objc_msgSend(a3, "minFillHeight"),
          v12 = v11,
          -[_UILegibilitySettings minFillHeight](v15, "minFillHeight"),
          vabdd_f64(v12, v13) <= 2.22044605e-16))
    {
      v14 = -[_UILegibilityView shadowImage](self, "shadowImage");
    }
    else
    {
      v14 = 0;
    }
    -[_UILegibilityView setSettings:image:shadowImage:](self, "setSettings:image:shadowImage:", a3, -[_UILegibilityView image](self, "image"), v14);
  }

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;

  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  v4 = v3;
  -[UIView frame](-[_UILegibilityView imageView](self, "imageView"), "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIView bounds](self, "bounds");
  v17 = UIRectCenteredIntegralRectScale(v6, v8, v10, v12, v13, v14, v15, v16, v4);
  -[UIImageView setFrame:](-[_UILegibilityView imageView](self, "imageView"), "setFrame:", v17, v18, v19, v20);
  -[UIView frame](-[_UILegibilityView shadowImageView](self, "shadowImageView"), "frame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[UIView bounds](self, "bounds");
  v33 = UIRectCenteredIntegralRectScale(v22, v24, v26, v28, v29, v30, v31, v32, v4);
  -[UIImageView setFrame:](-[_UILegibilityView shadowImageView](self, "shadowImageView"), "setFrame:", v33, v34, v35, v36);
}

- (BOOL)usesColorFilters
{
  return ((unint64_t)-[_UILegibilityView options](self, "options") >> 1) & 1;
}

- (BOOL)usesSecondaryColor
{
  return -[_UILegibilityView options](self, "options") & 1;
}

- (id)drawingColor
{
  _BOOL4 v3;
  _UILegibilitySettings *v4;

  v3 = -[_UILegibilityView usesSecondaryColor](self, "usesSecondaryColor");
  v4 = -[_UILegibilityView settings](self, "settings");
  if (v3)
    return -[_UILegibilitySettings secondaryColor](v4, "secondaryColor");
  else
    return -[_UILegibilitySettings primaryColor](v4, "primaryColor");
}

- (void)_updateFilters
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (-[_UILegibilityView usesColorFilters](self, "usesColorFilters"))
  {
    v3 = *MEMORY[0x1E0CD2E60];
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E60]);
    objc_msgSend(v4, "setName:", v3);
    objc_msgSend(v4, "setValue:forKey:", objc_msgSend(-[_UILegibilityView drawingColor](self, "drawingColor"), "CGColor"), CFSTR("inputColor"));
    v7[0] = v4;
    -[CALayer setFilters:](-[UIView layer](-[_UILegibilityView imageView](self, "imageView"), "layer"), "setFilters:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v3);
    objc_msgSend(v5, "setName:", v3);
    objc_msgSend(v5, "setValue:forKey:", -[UIColor CGColor](-[_UILegibilitySettings shadowColor](-[_UILegibilityView settings](self, "settings"), "shadowColor"), "CGColor"), CFSTR("inputColor"));
    v6 = v5;
    -[CALayer setFilters:](-[UIView layer](-[_UILegibilityView shadowImageView](self, "shadowImageView"), "layer"), "setFilters:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v6, 1));
  }
  else
  {
    -[CALayer setFilters:](-[UIView layer](-[_UILegibilityView imageView](self, "imageView"), "layer"), "setFilters:", 0);
    -[CALayer setFilters:](-[UIView layer](-[_UILegibilityView shadowImageView](self, "shadowImageView"), "layer"), "setFilters:", 0);
  }
}

- (_UILegibilitySettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 424);
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (void)setShadowImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 440);
}

- (double)strength
{
  return self->_strength;
}

- (void)setStrength:(double)a3
{
  self->_strength = a3;
}

- (BOOL)hidesImage
{
  return self->_hidesImage;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 456);
}

- (UIImageView)shadowImageView
{
  return self->_shadowImageView;
}

- (void)setShadowImageView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 464);
}

- (int64_t)options
{
  return self->_options;
}

@end
