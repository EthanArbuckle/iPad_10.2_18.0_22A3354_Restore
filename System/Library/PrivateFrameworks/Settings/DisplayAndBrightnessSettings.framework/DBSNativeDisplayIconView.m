@implementation DBSNativeDisplayIconView

- (DBSNativeDisplayIconView)initWithFrame:(CGRect)a3 displayName:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  DBSNativeDisplayIconView *v10;
  DBSNativeDisplayIconView *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  DBSDisplayNameLabel *v21;
  DBSDisplayNameLabel *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v31;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v31.receiver = self;
  v31.super_class = (Class)DBSNativeDisplayIconView;
  v10 = -[DBSNativeDisplayIconView initWithFrame:](&v31, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[DBSNativeDisplayIconView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = objc_alloc_init(MEMORY[0x24BEBD668]);
    -[DBSNativeDisplayIconView addSubview:](v11, "addSubview:", v12);
    objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("imageView"), v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[imageView]|"), 0, 0, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activateConstraints:", v15);

    v16 = (void *)MEMORY[0x24BDD1628];
    _NSDictionaryOfVariableBindings(CFSTR("imageView"), v12, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[imageView]|"), 0, 0, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v18);

    objc_msgSend(v12, "setContentMode:", 2);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTintColor:", v19);

    -[DBSNativeDisplayIconView setImageView:](v11, "setImageView:", v12);
    -[DBSNativeDisplayIconView imageView](v11, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", 1);

    v21 = [DBSDisplayNameLabel alloc];
    v22 = -[DBSDisplayNameLabel initWithFrame:](v21, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[DBSDisplayNameLabel setText:](v22, "setText:", v9);
    -[DBSNativeDisplayIconView addSubview:](v11, "addSubview:", v22);
    -[DBSDisplayNameLabel setTranslatesAutoresizingMaskIntoConstraints:](v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DBSDisplayNameLabel centerXAnchor](v22, "centerXAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSNativeDisplayIconView centerXAnchor](v11, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    -[DBSDisplayNameLabel centerYAnchor](v22, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[DBSNativeDisplayIconView centerYAnchor](v11, "centerYAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActive:", 1);

    -[DBSNativeDisplayIconView setNameField:](v11, "setNameField:", v22);
    -[DBSNativeDisplayIconView nameField](v11, "nameField");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setHidden:", 1);

  }
  return v11;
}

- (void)setIsCurrentDisplayLocation:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v3 = a3;
  v5 = (void *)MEMORY[0x24BEBD4B8];
  DBS_BundleForDisplayAndBrightnessSettingsFramework();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v7 = CFSTR("CurrentNativeDisplayIconBackground");
  else
    v7 = CFSTR("NativeDisplayIconBackground");
  objc_msgSend(v5, "colorNamed:inBundle:compatibleWithTraitCollection:", v7, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSNativeDisplayIconView setBackgroundColor:](self, "setBackgroundColor:", v8);

  v9 = !v3;
  -[DBSNativeDisplayIconView nameField](self, "nameField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHidden:", v9);

  -[DBSNativeDisplayIconView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setHidden:", v9);

  -[DBSNativeDisplayIconView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMasksToBounds:", 1);

  -[DBSNativeDisplayIconView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", 5.0);

  -[DBSNativeDisplayIconView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBorderWidth:", 1.0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.1);
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = objc_msgSend(v17, "CGColor");
  -[DBSNativeDisplayIconView layer](self, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBorderColor:", v15);

}

- (BOOL)isCurrentDisplayLocation
{
  return self->_isCurrentDisplayLocation;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)nameField
{
  return self->_nameField;
}

- (void)setNameField:(id)a3
{
  objc_storeStrong((id *)&self->_nameField, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameField, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
