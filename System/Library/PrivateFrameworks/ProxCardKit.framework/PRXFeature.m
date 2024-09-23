@implementation PRXFeature

- (PRXFeature)initWithTitle:(id)a3 detailText:(id)a4 imageView:(id)a5 valueChangedBlock:(id)a6
{
  UIView *v10;
  id v11;
  id v12;
  id v13;
  PRXFeature *v14;
  uint64_t v15;
  NSString *title;
  uint64_t v17;
  NSString *detailText;
  UIView *imageView;
  UIView *v20;
  uint64_t v21;
  id handler;
  objc_super v24;

  v10 = (UIView *)a5;
  v24.receiver = self;
  v24.super_class = (Class)PRXFeature;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = -[PRXFeature init](&v24, sel_init);
  v15 = objc_msgSend(v13, "copy", v24.receiver, v24.super_class);

  title = v14->_title;
  v14->_title = (NSString *)v15;

  v17 = objc_msgSend(v12, "copy");
  detailText = v14->_detailText;
  v14->_detailText = (NSString *)v17;

  imageView = v14->_imageView;
  v14->_imageView = v10;
  v20 = v10;

  v21 = objc_msgSend(v11, "copy");
  handler = v14->_handler;
  v14->_handler = (id)v21;

  v14->_on = 1;
  return v14;
}

- (PRXFeature)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 tintColor:(id)a6 valueChangedBlock:(id)a7
{
  id v12;
  id v13;
  UIImage *v14;
  UIColor *v15;
  id v16;
  void *v17;
  UIImage *icon;
  UIImage *v19;
  UIColor *tintColor;
  PRXFeature *v21;

  v12 = a3;
  v13 = a4;
  v14 = (UIImage *)a5;
  v15 = (UIColor *)a6;
  v16 = a7;
  if (v14)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v14);
    objc_msgSend(v17, "setTintColor:", v15);
    objc_msgSend(v17, "setContentMode:", 1);
    self->_imageViewSize = 32.0;
  }
  else
  {
    v17 = 0;
  }
  icon = self->_icon;
  self->_icon = v14;
  v19 = v14;

  tintColor = self->_tintColor;
  self->_tintColor = v15;

  v21 = -[PRXFeature initWithTitle:detailText:imageView:valueChangedBlock:](self, "initWithTitle:detailText:imageView:valueChangedBlock:", v12, v13, v17, v16);
  return v21;
}

+ (id)optionalFeatureWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 tintColor:(id)a6 valueChangedBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:detailText:icon:tintColor:valueChangedBlock:", v16, v15, v14, v13, v12);

  return v17;
}

+ (id)featureWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 tintColor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:detailText:icon:tintColor:valueChangedBlock:", v13, v12, v11, v10, 0);

  return v14;
}

+ (id)featureWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  objc_msgSend(v8, "makeImageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithTitle:detailText:imageView:valueChangedBlock:", v10, v9, v12, 0);

  objc_msgSend(v8, "platterSize");
  v15 = v14;

  objc_msgSend(v13, "setImageViewSize:", v15);
  return v13;
}

- (void)setSwitchControl:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  _BOOL8 on;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_switchControl);

  if (WeakRetained != v4)
  {
    v6 = objc_loadWeakRetained((id *)&self->_switchControl);
    objc_msgSend(v6, "removeActionForIdentifier:forControlEvents:", CFSTR("PRXToggleSwitch"), 4096);

    v7 = objc_storeWeak((id *)&self->_switchControl, v4);
    on = self->_on;
    v9 = v7;
    objc_msgSend(v4, "setOn:", on);

    location = 0;
    objc_initWeak(&location, self);
    v10 = objc_loadWeakRetained((id *)&self->_switchControl);
    v11 = (void *)MEMORY[0x24BDF67B8];
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __31__PRXFeature_setSwitchControl___block_invoke;
    v16 = &unk_24CC31E70;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v11, "actionWithTitle:image:identifier:handler:", &stru_24CC320A8, 0, CFSTR("PRXToggleSwitch"), &v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:forControlEvents:", v12, 4096, v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

void __31__PRXFeature_setSwitchControl___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 7);
    objc_msgSend(v3, "setOn:", objc_msgSend(v2, "isOn"));

    WeakRetained = v3;
  }

}

- (void)setOn:(BOOL)a3
{
  _BOOL8 v4;
  id WeakRetained;
  id v6;

  if (self->_on != a3)
  {
    if (!self->_handler)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("Cannot turn off a non-optional PRXFeature"), 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v6);
    }
    v4 = a3;
    self->_on = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_switchControl);
    objc_msgSend(WeakRetained, "setOn:animated:", v4, 1);

    (*((void (**)(void))self->_handler + 2))();
  }
}

- (NSString)title
{
  return self->_title;
}

- (NSString)detailText
{
  return self->_detailText;
}

- (UIImage)icon
{
  return self->_icon;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (BOOL)isOn
{
  return self->_on;
}

- (id)handler
{
  return self->_handler;
}

- (UISwitch)switchControl
{
  return (UISwitch *)objc_loadWeakRetained((id *)&self->_switchControl);
}

- (UIView)imageView
{
  return self->_imageView;
}

- (double)imageViewSize
{
  return self->_imageViewSize;
}

- (void)setImageViewSize:(double)a3
{
  self->_imageViewSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_switchControl);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_detailText, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
