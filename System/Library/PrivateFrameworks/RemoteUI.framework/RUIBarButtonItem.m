@implementation RUIBarButtonItem

+ (id)tapToRadarButton
{
  RUIBarButtonItem *v2;
  void *v3;
  _QWORD v5[2];
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(RUIBarButtonItem);
  v5[0] = CFSTR("type");
  v5[1] = CFSTR("parentBar");
  v6[0] = CFSTR("tapToRadarBarItem");
  v6[1] = CFSTR("navigationBar");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIElement setAttributes:](v2, "setAttributes:", v3);

  return v2;
}

- (void)_buttonPressed:(id)a3
{
  void (**action)(void);

  action = (void (**)(void))self->_action;
  if (action)
    action[2]();
}

- (UIBarButtonItem)barButtonItem
{
  UIBarButtonItem *barButtonItem;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  UIBarButtonItem *v9;
  void *v10;
  UIBarButtonItem *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  UIBarButtonItem *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  UIButton *v31;
  UIButton *backButton;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  UIImageView *v58;
  UIImageView *imageView;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  UIBarButtonItem *v65;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  id v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  UIBarButtonItem *v79;
  UIBarButtonItem *v80;
  double v81;

  barButtonItem = self->_barButtonItem;
  if (barButtonItem)
    goto LABEL_39;
  -[RUIElement attributes](self, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[RUIElement attributes](self, "attributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("style"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v81 = -1.0;
    -[RUIBarButtonItem itemType](self, "itemType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("editBarItem"));

    if (v8)
    {
      v9 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 2, self, sel__buttonPressed_);
      v10 = 0;
    }
    else
    {
      -[RUIBarButtonItem itemType](self, "itemType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("nextBarItem"));

      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("NEXT"), &stru_24C29B280, CFSTR("Localizable"));
      }
      else
      {
        -[RUIElement attributes](self, "attributes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("label"));
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = 0;
    }
    -[RUIBarButtonItem itemType](self, "itemType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("closeButtonBarItem"));

    -[RUIElement attributes](self, "attributes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("barButtonType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "isEqualToString:", CFSTR("cancel"));

    if ((v16 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 7);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addTarget:action:forControlEvents:", self, sel__buttonPressed_, 64);
      v20 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v19);

LABEL_37:
LABEL_38:
      -[UIBarButtonItem setEnabled:](v20, "setEnabled:", -[RUIElement enabled](self, "enabled"));
      v65 = self->_barButtonItem;
      self->_barButtonItem = v20;

      barButtonItem = self->_barButtonItem;
LABEL_39:
      v11 = barButtonItem;
      return v11;
    }
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("blue")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("done")))
    {
      v21 = 2;
    }
    else
    {
      v21 = 0;
    }
    -[RUIBarButtonItem itemType](self, "itemType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("titleBarItem"));

    if (v23)
    {
      v19 = objc_alloc_init(MEMORY[0x24BEBD978]);
      objc_msgSend(v19, "setAxis:", 0);
      objc_msgSend(v19, "setAlignment:", 3);
      objc_msgSend(v19, "setDistribution:", 3);
      -[RUIElement style](self, "style");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "navBarLabelSpacingWithImage");
      v26 = v25;

      if (v26 == 0.0)
      {
        objc_msgSend(v19, "setSpacing:", 8.0);
      }
      else
      {
        -[RUIElement style](self, "style");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "navBarLabelSpacingWithImage");
        objc_msgSend(v19, "setSpacing:");

      }
      v51 = objc_alloc_init(MEMORY[0x24BEBD708]);
      objc_msgSend(v51, "setText:", v10);
      -[RUIElement style](self, "style");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "navBarButtonLabelFont");
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      if (v53)
      {
        -[RUIElement style](self, "style");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "navBarButtonLabelFont");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setFont:", v55);

      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 19.0, *MEMORY[0x24BEBB600]);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setFont:", v54);
      }

      -[RUIBarButtonItem _labelColor](self, "_labelColor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      if (v56)
      {
        -[RUIBarButtonItem _labelColor](self, "_labelColor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setTextColor:", v57);

      }
      v58 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
      imageView = self->_imageView;
      self->_imageView = v58;

      -[RUIElement attributes](self, "attributes");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectForKey:", CFSTR("imageWidth"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v61, "length"))
      {
        -[RUIElement attributes](self, "attributes");
        v78 = v10;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKey:", CFSTR("imageHeight"));
        v80 = v9;
        v63 = v6;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v64, "length");

        v6 = v63;
        v9 = v80;

        v10 = v78;
        if (v76)
          goto LABEL_34;
        -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "constraintEqualToConstant:", 25.0);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setActive:", 1);

        v9 = v80;
        -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "constraintEqualToConstant:", 25.0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setActive:", 1);
      }

LABEL_34:
      if (-[RUIElement loadImage](self, "loadImage"))
        objc_msgSend(v19, "addArrangedSubview:", self->_imageView);
      objc_msgSend(v19, "addArrangedSubview:", v51);
      v20 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v19);

      goto LABEL_37;
    }
    v79 = v9;
    -[RUIBarButtonItem itemType](self, "itemType");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("backButtonBarItem"));

    if (!v29)
    {
      v42 = v6;
      -[RUIBarButtonItem itemType](self, "itemType");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("tapToRadarBarItem"));

      if (v44)
      {
        objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/AppleInternal/Library/Bundles/RemoteUIInternal.bundle"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 25.0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:withConfiguration:", CFSTR("tap.to.radar.circle"), v46, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "imageWithRenderingMode:", 2);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v45, "setTitle:forState:", CFSTR("Tap-To-Radar"), 0);
        objc_msgSend(v45, "setImage:forState:", v49, 0);
        objc_msgSend(v45, "addTarget:action:forControlEvents:", self, sel__buttonPressed_, 64);
        v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD4B8]), "initWithDynamicProvider:", &__block_literal_global_10);
        objc_msgSend(v45, "setTintColor:", v50);

        v20 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v45);
      }
      else if (objc_msgSend(v10, "length"))
      {
        -[RUIBarButtonItem _createBarButtonItemWithTitle:style:](self, "_createBarButtonItemWithTitle:style:", v10, v21);
        v20 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();

        -[RUIBarButtonItem _labelColor](self, "_labelColor");
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        if (v67)
        {
          -[RUIBarButtonItem _labelColor](self, "_labelColor");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIBarButtonItem setTintColor:](v20, "setTintColor:", v68);

        }
      }
      else
      {
        v20 = v79;
      }
      v6 = v42;
      goto LABEL_38;
    }
    -[RUIElement URLAttributeForImageName:getScale:](self, "URLAttributeForImageName:getScale:", CFSTR("image"), &v81);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (UIButton *)objc_alloc_init(MEMORY[0x24BEBD430]);
    backButton = self->_backButton;
    self->_backButton = v31;

    objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 25.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIElement attributes](self, "attributes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKey:", CFSTR("systemImage"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("chevron.backward"), v33);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = (void *)v36;
    v75 = (void *)v30;
    v77 = v6;
    if (v35)
    {
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 30.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", v35, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v35, "isEqualToString:", CFSTR("backButton")))
      {
LABEL_51:
        objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "userInterfaceLayoutDirection");

        if (v73 == 1)
          v74 = (id)objc_msgSend(v39, "imageFlippedForRightToLeftLayoutDirection");
        -[UIButton setImage:forState:](self->_backButton, "setImage:forState:", v39, 0);
        -[UIButton addTarget:action:forControlEvents:](self->_backButton, "addTarget:action:forControlEvents:", self, sel__buttonPressed_, 64);
        v20 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", self->_backButton);

        v6 = v77;
        goto LABEL_38;
      }
      objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("chevron.backward.circle.fill"), v38);
      v40 = objc_claimAutoreleasedReturnValue();

      -[RUIBarButtonItem updateBackButtonColors](self, "updateBackButtonColors");
      -[UIButton layer](self->_backButton, "layer");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setCornerRadius:", 30.0);
      v39 = (void *)v40;
    }
    else
    {
      if (!v30)
      {
        v38 = v33;
        v39 = (void *)v36;
        goto LABEL_51;
      }
      +[RUIImageLoader sharedImageLoader](RUIImageLoader, "sharedImageLoader");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v41, "imageForURL:loadIfAbsent:", v30, 1);
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v69, 0, v81);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = v33;
    }

    goto LABEL_51;
  }
  v11 = 0;
  return v11;
}

id __33__RUIBarButtonItem_barButtonItem__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = objc_alloc(MEMORY[0x24BEBD4B8]);
    v3 = 0.51372549;
    v4 = 0.184313725;
    v5 = 0.631372549;
  }
  else
  {
    v2 = objc_alloc(MEMORY[0x24BEBD4B8]);
    v3 = 0.705882353;
    v4 = 0.254901961;
    v5 = 0.866666667;
  }
  return (id)objc_msgSend(v2, "initWithDisplayP3Red:green:blue:alpha:", v3, v4, v5, 1.0);
}

- (id)_createBarButtonItemWithTitle:(id)a3 style:(int64_t)a4
{
  objc_class *v6;
  id v7;
  void *v8;

  v6 = (objc_class *)MEMORY[0x24BEBD410];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithTitle:style:target:action:", v7, a4, self, sel__buttonPressed_);

  return v8;
}

- (id)_labelColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[RUIElement attributes](self, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("labelColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BEBD4B8];
    -[RUIElement attributes](self, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("labelColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_remoteUI_colorWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSString)itemType
{
  void *v2;
  void *v3;

  -[RUIElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)RUIBarButtonItem;
  -[RUIElement setEnabled:](&v5, sel_setEnabled_);
  -[UIBarButtonItem setEnabled:](self->_barButtonItem, "setEnabled:", v3);
}

- (void)updateBackButtonColors
{
  void *v3;
  uint64_t v4;
  UIButton *backButton;
  void *v6;
  UIButton *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEBDAB0], "_currentTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  backButton = self->_backButton;
  if (v4 == 2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemDarkGrayColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](backButton, "setTintColor:", v6);

    v7 = self->_backButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemExtraLightGrayColor");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemExtraLightGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](backButton, "setTintColor:", v8);

    v7 = self->_backButton;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  }
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[UIButton setBackgroundColor:](v7, "setBackgroundColor:");

}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (void)setImageSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  height = a3.height;
  width = a3.width;
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToConstant:", height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActive:", 1);

  -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", width);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_barButtonItem, 0);
}

@end
