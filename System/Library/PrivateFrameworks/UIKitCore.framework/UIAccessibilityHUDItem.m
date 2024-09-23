@implementation UIAccessibilityHUDItem

- (UIAccessibilityHUDItem)initWithTitle:(id)a3 image:(id)a4 imageInsets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v11;
  id v12;
  UIAccessibilityHUDItem *v13;
  UIAccessibilityHUDItem *v14;
  objc_super v16;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v11 = a3;
  v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UIAccessibilityHUDItem;
  v13 = -[UIAccessibilityHUDItem init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[UIAccessibilityHUDItem setFlattenImage:](v13, "setFlattenImage:", 1);
    -[UIAccessibilityHUDItem setTitle:](v14, "setTitle:", v11);
    -[UIAccessibilityHUDItem setImage:](v14, "setImage:", v12);
    -[UIAccessibilityHUDItem setImageInsets:](v14, "setImageInsets:", top, left, bottom, right);
  }

  return v14;
}

- (UIAccessibilityHUDItem)initWithTitle:(id)a3 image:(id)a4 imageInsets:(UIEdgeInsets)a5 scaleImage:(BOOL)a6
{
  _BOOL8 v6;
  double right;
  double bottom;
  double left;
  double top;
  id v13;
  id v14;
  UIAccessibilityHUDItem *v15;
  UIAccessibilityHUDItem *v16;
  objc_super v18;

  v6 = a6;
  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v13 = a3;
  v14 = a4;
  v18.receiver = self;
  v18.super_class = (Class)UIAccessibilityHUDItem;
  v15 = -[UIAccessibilityHUDItem init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    -[UIAccessibilityHUDItem setFlattenImage:](v15, "setFlattenImage:", 1);
    -[UIAccessibilityHUDItem setTitle:](v16, "setTitle:", v13);
    -[UIAccessibilityHUDItem setImage:](v16, "setImage:", v14);
    -[UIAccessibilityHUDItem setImageInsets:](v16, "setImageInsets:", top, left, bottom, right);
    -[UIAccessibilityHUDItem setScaleImage:](v16, "setScaleImage:", v6);
  }

  return v16;
}

- (UIAccessibilityHUDItem)initWithCustomView:(id)a3
{
  id v4;
  UIAccessibilityHUDItem *v5;
  UIAccessibilityHUDItem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIAccessibilityHUDItem;
  v5 = -[UIAccessibilityHUDItem init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[UIAccessibilityHUDItem setCustomView:](v5, "setCustomView:", v4);

  return v6;
}

+ (id)HUDItemForTabBarItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "_internalTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_internalLargeContentSizeImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc((Class)a1);
    objc_msgSend(v4, "largeContentSizeImageInsets");
    v8 = (void *)objc_msgSend(v7, "initWithTitle:image:imageInsets:", v5, v6);
  }
  else
  {
    objc_msgSend(v4, "_internalTemplateImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:image:imageInsets:scaleImage:", v5, v9, 1, 0.0, 0.0, 0.0, 0.0);

  }
  return v8;
}

+ (id)HUDItemForBarButtonItem:(id)a3 atPoint:(CGPoint)a4 inView:(id)a5 isBackButton:(BOOL)a6
{
  _BOOL4 v6;
  double y;
  double x;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v42;

  v6 = a6;
  y = a4.y;
  x = a4.x;
  v11 = a3;
  v12 = a5;
  objc_msgSend(v11, "_resolvedLargeContentSizeTitle");
  v13 = objc_claimAutoreleasedReturnValue();
  v42 = 0;
  if (objc_msgSend(v11, "isSystemItem"))
  {
    BarButtonItemResolveSystemImage(objc_msgSend(v11, "systemItem"), (void **)&v42, 0, 0);
    v14 = v42;
  }
  else
  {
    objc_msgSend(v11, "largeContentSizeImage");
    v42 = objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      objc_msgSend(v11, "largeContentSizeImageInsets");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v23 = 0;
      if (!v6)
        goto LABEL_20;
      goto LABEL_14;
    }
    objc_msgSend(v11, "image");
    v14 = objc_claimAutoreleasedReturnValue();
    v42 = v14;
  }
  if (v13 | v14)
  {
    v22 = 0.0;
    v23 = 1;
    v20 = 0.0;
    v18 = 0.0;
    v16 = 0.0;
    if (!v6)
      goto LABEL_20;
  }
  else
  {
    objc_msgSend(v11, "customView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "customView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "convertPoint:fromView:", v12, x, y);
    objc_msgSend(v24, "_largeContentViewerItemAtPoint:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      objc_msgSend(v26, "largeContentTitle");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "largeContentImage");
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v42;
      v42 = v27;

      objc_msgSend(v26, "largeContentImageInsets");
      v16 = v29;
      v18 = v30;
      v20 = v31;
      v22 = v32;
      v23 = objc_msgSend(v26, "scalesLargeContentImage");
    }
    else
    {
      v13 = 0;
      v22 = 0.0;
      v23 = 1;
      v20 = 0.0;
      v18 = 0.0;
      v16 = 0.0;
    }

    if (!v6)
      goto LABEL_20;
  }
LABEL_14:
  if (!v42)
  {
    +[_UIBarButtonItemData standardBackButtonData](_UIBarButtonItemData, "standardBackButtonData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "backIndicatorImage");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v42;
    v42 = v34;

    v22 = 0.0;
    v23 = 1;
    v20 = 0.0;
    v18 = 0.0;
    v16 = 0.0;
  }
  if (!objc_msgSend((id)v13, "length"))
  {
    objc_msgSend(v11, "_backButtonAlternateTitles");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "firstObject");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v37, "length"))
    {
      v13 = (uint64_t)v37;
    }
    else
    {
      _UINSLocalizedStringWithDefaultValue(CFSTR("Back"), CFSTR("Back"));
      v13 = objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_20:
  v38 = (void *)(v13 | v42);
  if (v13 | v42)
  {
    v39 = objc_alloc((Class)a1);
    v40 = (void *)objc_msgSend(v39, "initWithTitle:image:imageInsets:scaleImage:", v13, v42, v23, v16, v18, v20, v22);
    objc_msgSend(v40, "setDisabledAppearance:", objc_msgSend(v11, "isEnabled") ^ 1);
    v38 = (void *)v42;
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v4 = objc_alloc((Class)objc_opt_class());
  -[UIAccessibilityHUDItem title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityHUDItem image](self, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAccessibilityHUDItem imageInsets](self, "imageInsets");
  v11 = (void *)objc_msgSend(v4, "initWithTitle:image:imageInsets:scaleImage:", v5, v6, -[UIAccessibilityHUDItem scaleImage](self, "scaleImage"), v7, v8, v9, v10);

  objc_msgSend(v11, "setFlattenImage:", -[UIAccessibilityHUDItem flattenImage](self, "flattenImage"));
  objc_msgSend(v11, "setDisabledAppearance:", -[UIAccessibilityHUDItem disabledAppearance](self, "disabledAppearance"));
  -[UIAccessibilityHUDItem customView](self, "customView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCustomView:", v12);

  objc_msgSend(v11, "setCustomUserInterfaceStyle:", -[UIAccessibilityHUDItem customUserInterfaceStyle](self, "customUserInterfaceStyle"));
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  _BOOL4 v22;
  char v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  int v28;
  int v29;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityHUDItem title](self, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      v11 = 0;
    }
    else
    {
      v11 = 1;
      if (v8 && v9)
        v11 = objc_msgSend(v8, "isEqual:", v9) ^ 1;
    }
    v29 = v11;

    objc_msgSend(v5, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityHUDItem image](self, "image");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v13;
    v16 = v14;
    v17 = v16;
    if (v15 == v16)
    {
      v18 = 0;
    }
    else
    {
      v18 = 1;
      if (v15 && v16)
        v18 = objc_msgSend(v15, "isEqual:", v16) ^ 1;
    }
    v28 = v18;

    objc_msgSend(v5, "customView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityHUDItem customView](self, "customView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_msgSend(v5, "disabledAppearance");
    v22 = -[UIAccessibilityHUDItem disabledAppearance](self, "disabledAppearance");
    v23 = objc_msgSend(v5, "flattenImage");
    v24 = -[UIAccessibilityHUDItem flattenImage](self, "flattenImage");
    v25 = objc_msgSend(v5, "customUserInterfaceStyle");
    v26 = -[UIAccessibilityHUDItem customUserInterfaceStyle](self, "customUserInterfaceStyle");
    v12 = 0;
    if (((v29 | v28) & 1) == 0 && v19 == v20 && ((v21 ^ v22) & 1) == 0)
      v12 = (v25 == v26) & ~(v23 ^ v24);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  -[UIAccessibilityHUDItem title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UIAccessibilityHUDItem image](self, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[UIAccessibilityHUDItem customView](self, "customView");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ v7;

  return v8;
}

- (BOOL)disabledAppearance
{
  return self->_disabledAppearance;
}

- (void)setDisabledAppearance:(BOOL)a3
{
  self->_disabledAppearance = a3;
}

- (BOOL)flattenImage
{
  return self->_flattenImage;
}

- (void)setFlattenImage:(BOOL)a3
{
  self->_flattenImage = a3;
}

- (BOOL)scaleImage
{
  return self->_scaleImage;
}

- (void)setScaleImage:(BOOL)a3
{
  self->_scaleImage = a3;
}

- (int64_t)customUserInterfaceStyle
{
  return self->_customUserInterfaceStyle;
}

- (void)setCustomUserInterfaceStyle:(int64_t)a3
{
  self->_customUserInterfaceStyle = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
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

- (UIView)customView
{
  return self->_customView;
}

- (void)setCustomView:(id)a3
{
  objc_storeStrong((id *)&self->_customView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
