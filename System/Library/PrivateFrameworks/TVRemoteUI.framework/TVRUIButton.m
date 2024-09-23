@implementation TVRUIButton

+ (BOOL)isValidButtonType:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 0x1F || (unint64_t)a3 >> 1 == 4999;
}

+ (BOOL)buttonTypeHasTapAction:(int64_t)a3
{
  return a3 == 9998 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 6;
}

- (TVRUIButton)initWithType:(int64_t)a3 hasTapAction:(BOOL)a4
{
  return -[TVRUIButton initWithType:hasTapAction:buttonLocation:](self, "initWithType:hasTapAction:buttonLocation:", a3, a4, 0);
}

- (TVRUIButton)initWithType:(int64_t)a3 hasTapAction:(BOOL)a4 buttonLocation:(int64_t)a5
{
  TVRUIButton *v8;
  TVRUIDarkStyleProvider *v9;
  TVRUIStyleProvider *styleProvider;
  void *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  UILabel *titleLabel;
  void *v16;
  UIImageView *v17;
  UIImageView *imageView;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  TVRButtonHaptic *haptic;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  objc_super v51;
  _QWORD v52[5];

  v52[4] = *MEMORY[0x24BDAC8D0];
  v51.receiver = self;
  v51.super_class = (Class)TVRUIButton;
  v8 = -[TVRUIButton initWithFrame:](&v51, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v8)
  {
    v9 = objc_alloc_init(TVRUIDarkStyleProvider);
    styleProvider = v8->_styleProvider;
    v8->_styleProvider = (TVRUIStyleProvider *)v9;

    v8->_hasButtonShape = 1;
    v8->_buttonLocation = a5;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton setBackgroundColor:](v8, "setBackgroundColor:", v11);

    v8->_buttonType = a3;
    -[TVRUIButton layer](v8, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBorderColor:", 0);

    -[TVRUIButton layer](v8, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBorderWidth:", 0.0);

    -[TVRUIButton _darkenSystemColorsChanged:](v8, "_darkenSystemColorsChanged:", 0);
    v14 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v14;

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8->_titleLabel, "setTextColor:", v16);

    -[UILabel setTextAlignment:](v8->_titleLabel, "setTextAlignment:", 1);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v8->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TVRUIButton addSubview:](v8, "addSubview:", v8->_titleLabel);
    v17 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    imageView = v8->_imageView;
    v8->_imageView = v17;

    -[UIImageView setContentMode:](v8->_imageView, "setContentMode:", 4);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v8->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TVRUIButton addSubview:](v8, "addSubview:", v8->_imageView);
    -[TVRUIStyleProvider iconForButtonType:buttonLocation:](v8->_styleProvider, "iconForButtonType:buttonLocation:", v8->_buttonType, v8->_buttonLocation);
    v19 = objc_claimAutoreleasedReturnValue();
    v50 = (void *)v19;
    if (v19)
    {
      v20 = (void *)v19;
      -[UIImageView setImage:](v8->_imageView, "setImage:", v19);
      if ((objc_msgSend(v20, "isSymbolImage") & 1) == 0)
        -[UIImageView sizeToFit](v8->_imageView, "sizeToFit");
    }
    else
    {
      -[TVRUIStyleProvider textForButtonType:](v8->_styleProvider, "textForButtonType:", v8->_buttonType);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        -[UILabel setText:](v8->_titleLabel, "setText:", v21);
        -[TVRUIStyleProvider buttonTextColor](v8->_styleProvider, "buttonTextColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v8->_titleLabel, "setTextColor:", v22);

        -[TVRUIStyleProvider primaryButtonFont](v8->_styleProvider, "primaryButtonFont");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v8->_titleLabel, "setFont:", v23);

        -[UILabel sizeToFit](v8->_titleLabel, "sizeToFit");
      }

    }
    -[TVRUIButton _hapticForButtonType:](v8, "_hapticForButtonType:", v8->_buttonType);
    v24 = objc_claimAutoreleasedReturnValue();
    haptic = v8->_haptic;
    v8->_haptic = (TVRButtonHaptic *)v24;

    v8->_tapAction = a4;
    -[TVRUIButton _accessibilityLabelForButtonType:](v8, "_accessibilityLabelForButtonType:", a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton setAccessibilityLabel:](v8, "setAccessibilityLabel:", v26);

    -[TVRUIButton _accessibilityHintForButtonType:](v8, "_accessibilityHintForButtonType:", a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton setAccessibilityHint:](v8, "setAccessibilityHint:", v27);

    -[TVRUIButton _accessibilityIDForButtonType:](v8, "_accessibilityIDForButtonType:", a3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton setAccessibilityIdentifier:](v8, "setAccessibilityIdentifier:", v28);

    -[TVRUIButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", v8, sel__touchDown_, 1);
    -[TVRUIButton addTarget:action:forControlEvents:](v8, "addTarget:action:forControlEvents:", v8, sel__touchUp_, 448);
    -[TVRUIButton setClipsToBounds:](v8, "setClipsToBounds:", 1);
    -[TVRUIStyleProvider tintColorForButtonEnabled](v8->_styleProvider, "tintColorForButtonEnabled");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton setTintColor:](v8, "setTintColor:", v29);

    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD828]), "initWithDelegate:", v8);
    -[TVRUIButton addInteraction:](v8, "addInteraction:", v30);

    v31 = 0.0;
    if (v8->_buttonType == 2)
    {
      if (-[TVRUIButton _shouldReverseLayoutDirection](v8, "_shouldReverseLayoutDirection"))
        v31 = 2.0;
      else
        v31 = 0.0;
    }
    v45 = (void *)MEMORY[0x24BDD1628];
    -[UIImageView centerXAnchor](v8->_imageView, "centerXAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton centerXAnchor](v8, "centerXAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:constant:", v48, v31);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v47;
    -[UIImageView centerYAnchor](v8->_imageView, "centerYAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton centerYAnchor](v8, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v52[1] = v33;
    -[UILabel centerXAnchor](v8->_titleLabel, "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton centerXAnchor](v8, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v52[2] = v36;
    -[UILabel centerYAnchor](v8->_titleLabel, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton centerYAnchor](v8, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v52[3] = v39;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "activateConstraints:", v40);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:selector:name:object:", v8, sel__boldTextEnabledStatusChanged_, *MEMORY[0x24BEBDDB8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObserver:selector:name:object:", v8, sel__largeTextEnabledStatusChanged_, *MEMORY[0x24BEBE088], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addObserver:selector:name:object:", v8, sel__darkenSystemColorsChanged_, *MEMORY[0x24BEBDDE8], 0);

  }
  return v8;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)TVRUIButton;
  -[TVRUIButton layoutSubviews](&v3, sel_layoutSubviews);
  -[TVRUIButton bounds](self, "bounds");
  -[TVRUIButton _setCornerRadius:](self, "_setCornerRadius:", CGRectGetHeight(v4) * 0.5);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TVRUIButton;
  -[TVRUIButton setEnabled:](&v9, sel_setEnabled_);
  if (-[TVRUIButton buttonLocation](self, "buttonLocation") != 1)
  {
    -[TVRUIButton styleProvider](self, "styleProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "tintColorForButtonEnabled");
    else
      objc_msgSend(v5, "tintColorForButtonDisabled");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTintColor:", v7);

  }
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[TVRUIButton _descriptionBuilder](self, "_descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVRUIButton;
  -[TVRUIButton touchesBegan:withEvent:](&v5, sel_touchesBegan_withEvent_, a3, a4);
  -[TVRButtonHaptic userInteractionBegan](self->_haptic, "userInteractionBegan");
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVRUIButton;
  -[TVRUIButton touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[TVRButtonHaptic userInteractionEnded](self->_haptic, "userInteractionEnded");
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVRUIButton;
  -[TVRUIButton touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[TVRButtonHaptic userInteractionCancelled](self->_haptic, "userInteractionCancelled");
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA30]), "initWithView:", self);
  -[TVRUIButton _pointerEffectForButtonType:targetedPreview:](self, "_pointerEffectForButtonType:targetedPreview:", -[TVRUIButton buttonType](self, "buttonType"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD848], "styleWithEffect:shape:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_pointerEffectForButtonType:(int64_t)a3 targetedPreview:(id)a4
{
  id *v4;

  v4 = (id *)0x24BEBD818;
  if ((unint64_t)(a3 - 28) >= 3)
    v4 = (id *)0x24BEBD830;
  objc_msgSend(*v4, "effectWithPreview:", a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_boldTextEnabledStatusChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[TVRUIButton _boldTextEnabledStatusChanged:]";
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[TVRUIButton styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconForButtonType:buttonLocation:", -[TVRUIButton buttonType](self, "buttonType"), -[TVRUIButton buttonLocation](self, "buttonLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIButton imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

}

- (void)_largeTextEnabledStatusChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[TVRUIButton _largeTextEnabledStatusChanged:]";
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[TVRUIButton styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconForButtonType:buttonLocation:", -[TVRUIButton buttonType](self, "buttonType"), -[TVRUIButton buttonLocation](self, "buttonLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIButton imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

}

- (void)_darkenSystemColorsChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;

  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[TVRUIButton _darkenSystemColorsChanged:].cold.1(v4);

  if (-[TVRUIButton hasButtonShape](self, "hasButtonShape"))
  {
    -[TVRUIButton styleProvider](self, "styleProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buttonBackgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton setBackgroundColor:](self, "setBackgroundColor:", v6);

  }
}

- (id)_accessibilityLabelForButtonType:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = 0;
  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeSelect");
      goto LABEL_28;
    case 2:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeMenu");
      goto LABEL_28;
    case 3:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeHome");
      goto LABEL_28;
    case 4:
    case 8:
    case 9:
    case 10:
    case 11:
    case 19:
    case 20:
    case 21:
    case 22:
      return v3;
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypePlayPause");
      goto LABEL_28;
    case 6:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeSkipForward");
      goto LABEL_28;
    case 7:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeSkipBackward");
      goto LABEL_28;
    case 12:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeArrowUp");
      goto LABEL_28;
    case 13:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeArrowDown");
      goto LABEL_28;
    case 14:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeArrowLeft");
      goto LABEL_28;
    case 15:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeArrowRight");
      goto LABEL_28;
    case 16:
    case 17:
    case 18:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeCaptions");
      goto LABEL_28;
    case 23:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeBack");
      goto LABEL_28;
    case 24:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeExit");
      goto LABEL_28;
    case 25:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeInfo");
      goto LABEL_28;
    case 26:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypePageUp");
      goto LABEL_28;
    case 27:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypePageDown");
      goto LABEL_28;
    case 28:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeGuide");
      goto LABEL_28;
    case 29:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypeMute");
      goto LABEL_28;
    case 30:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("TVRUIAXLabelButtonTypePower");
LABEL_28:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DE30718, CFSTR("Localizable"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      switch(a3)
      {
        case 9992:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("TVRUIAXLabelButtonTypeMediaInfo");
          goto LABEL_28;
        case 9993:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("TVRUIAXLabelButtonTypePlay");
          goto LABEL_28;
        case 9994:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("TVRUIAXLabelButtonTypePause");
          goto LABEL_28;
        case 9995:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("TVRUIAXLabelButtonTypeFastForward");
          goto LABEL_28;
        case 9996:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("TVRUIAXLabelButtonTypeRewind");
          goto LABEL_28;
        case 9999:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("TVRUIAXLabelButtonTypeKeyboard");
          goto LABEL_28;
        default:
          return v3;
      }
  }
  return v3;
}

- (id)_accessibilityHintForButtonType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  if (a3 == 30)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("TVRUIAXHintButtonTypePower");
  }
  else
  {
    if (a3 != 29)
    {
      v6 = 0;
      return v6;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("TVRUIAXHintButtonTypeMute");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24DE30718, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_accessibilityIDForButtonType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("menu");
  switch(a3)
  {
    case 1:
      v3 = CFSTR("select");
      break;
    case 2:
      break;
    case 3:
      v3 = CFSTR("home");
      break;
    case 4:
    case 8:
    case 9:
    case 10:
    case 11:
    case 19:
    case 20:
    case 21:
    case 22:
LABEL_27:
      v3 = CFSTR("unknown");
      break;
    case 5:
      v3 = CFSTR("playPause");
      break;
    case 6:
      v3 = CFSTR("skipForward");
      break;
    case 7:
      v3 = CFSTR("skipBackward");
      break;
    case 12:
      v3 = CFSTR("arrowUp");
      break;
    case 13:
      v3 = CFSTR("arrowDown");
      break;
    case 14:
      v3 = CFSTR("arrowLeft");
      break;
    case 15:
      v3 = CFSTR("arrowRight");
      break;
    case 16:
      v3 = CFSTR("toggleCaptions");
      break;
    case 17:
      v3 = CFSTR("alwaysOnCaptions");
      break;
    case 18:
      v3 = CFSTR("captions");
      break;
    case 23:
      v3 = CFSTR("back");
      break;
    case 24:
      v3 = CFSTR("exit");
      break;
    case 25:
      v3 = CFSTR("info");
      break;
    case 26:
      v3 = CFSTR("pageUp");
      break;
    case 27:
      v3 = CFSTR("pageDown");
      break;
    case 28:
      v3 = CFSTR("guide");
      break;
    case 29:
      v3 = CFSTR("mute");
      break;
    case 30:
      v3 = CFSTR("power");
      break;
    default:
      switch(a3)
      {
        case 9993:
          v3 = CFSTR("play");
          break;
        case 9994:
          v3 = CFSTR("pause");
          break;
        case 9995:
          v3 = CFSTR("fastForward");
          break;
        case 9996:
          v3 = CFSTR("rewind");
          break;
        case 9999:
          v3 = CFSTR("keyboard");
          break;
        default:
          goto LABEL_27;
      }
      break;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UIA.TVRemoteService.%@"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)_hapticForButtonType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3 == 4)
  {
    v5 = 0;
  }
  else
  {
    +[TVRButtonHaptic hapticForView:](TVRButtonHaptic, "hapticForView:", self, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_touchUp:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[TVRUIButton highlightAnimator](self, "highlightAnimator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRunning");

  if (v5)
  {
    -[TVRUIButton highlightAnimator](self, "highlightAnimator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopAnimation:", 1);

  }
  v7 = objc_alloc(MEMORY[0x24BEBDB20]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __24__TVRUIButton__touchUp___block_invoke;
  v10[3] = &unk_24DE2C198;
  v10[4] = self;
  v8 = (void *)objc_msgSend(v7, "initWithDuration:curve:animations:", 2, v10, 0.48);
  -[TVRUIButton setUnhighlightAnimator:](self, "setUnhighlightAnimator:", v8);

  -[TVRUIButton unhighlightAnimator](self, "unhighlightAnimator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startAnimation");

}

void __24__TVRUIButton__touchUp___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __int128 v4;
  NSObject *v5;
  uint8_t v6[16];
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "defaultBackgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setDefaultBackgroundColor:", 0);
  v3 = *(void **)(a1 + 32);
  v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v7[0] = *MEMORY[0x24BDBD8B8];
  v7[1] = v4;
  v7[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v3, "setTransform:", v7);
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "#animation - button unhighlighter ran", v6, 2u);
  }

}

- (void)_touchDown:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[TVRUIButton defaultBackgroundColor](self, "defaultBackgroundColor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[TVRUIButton backgroundColor](self, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton setDefaultBackgroundColor:](self, "setDefaultBackgroundColor:", v5);

  }
  -[TVRUIButton unhighlightAnimator](self, "unhighlightAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stopAnimation:", 1);

  v7 = objc_alloc(MEMORY[0x24BEBDB20]);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __26__TVRUIButton__touchDown___block_invoke;
  v10[3] = &unk_24DE2C198;
  v10[4] = self;
  v8 = (void *)objc_msgSend(v7, "initWithDuration:curve:animations:", 3, v10, 0.2);
  -[TVRUIButton setHighlightAnimator:](self, "setHighlightAnimator:", v8);

  -[TVRUIButton highlightAnimator](self, "highlightAnimator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startAnimation");

}

void __26__TVRUIButton__touchDown___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  CGAffineTransform v8;
  CGAffineTransform v9;

  if ((objc_msgSend(*(id *)(a1 + 32), "isHighlightEffectDisabled") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "defaultBackgroundColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      goto LABEL_6;
    objc_msgSend(*(id *)(a1 + 32), "defaultBackgroundColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithDisplayP3Red:green:blue:alpha:", 0.219607843, 0.219607843, 0.235294118, 1.0);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;
  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", v3);

LABEL_6:
  CGAffineTransformMakeScale(&v9, 0.88, 0.88);
  v5 = *(void **)(a1 + 32);
  v8 = v9;
  objc_msgSend(v5, "setTransform:", &v8);
  _TVRUIViewControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "#animation - button highlighter ran", v7, 2u);
  }

}

- (id)_descriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIButton titleLabel](self, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("title"));

  v6 = (id)objc_msgSend(v3, "appendInteger:withName:", -[TVRUIButton buttonType](self, "buttonType"), CFSTR("buttonType"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUIButton hasTapAction](self, "hasTapAction"), CFSTR("hasTapAction"));
  v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUIButton isHighlightEffectDisabled](self, "isHighlightEffectDisabled"), CFSTR("highlightEffectDisabled"));
  return v3;
}

- (void)_updateButtonType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  self->_buttonType = a3;
  -[TVRUIButton styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconForButtonType:buttonLocation:", a3, -[TVRUIButton buttonLocation](self, "buttonLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIButton imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

  -[TVRUIButton _accessibilityLabelForButtonType:](self, "_accessibilityLabelForButtonType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIButton setAccessibilityLabel:](self, "setAccessibilityLabel:", v8);

  -[TVRUIButton _accessibilityHintForButtonType:](self, "_accessibilityHintForButtonType:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIButton setAccessibilityHint:](self, "setAccessibilityHint:", v9);

  -[TVRUIButton _accessibilityIDForButtonType:](self, "_accessibilityIDForButtonType:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIButton setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v10);

}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (BOOL)hasTapAction
{
  return self->_tapAction;
}

- (BOOL)isHighlightEffectDisabled
{
  return self->_disableHighlightEffect;
}

- (void)setDisableHighlightEffect:(BOOL)a3
{
  self->_disableHighlightEffect = a3;
}

- (BOOL)hasButtonShape
{
  return self->_hasButtonShape;
}

- (void)setHasButtonShape:(BOOL)a3
{
  self->_hasButtonShape = a3;
}

- (UIViewPropertyAnimator)highlightAnimator
{
  return self->_highlightAnimator;
}

- (void)setHighlightAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_highlightAnimator, a3);
}

- (UIViewPropertyAnimator)unhighlightAnimator
{
  return self->_unhighlightAnimator;
}

- (void)setUnhighlightAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_unhighlightAnimator, a3);
}

- (UIColor)defaultBackgroundColor
{
  return self->_defaultBackgroundColor;
}

- (void)setDefaultBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultBackgroundColor, a3);
}

- (TVRButtonHaptic)haptic
{
  return self->_haptic;
}

- (void)setHaptic:(id)a3
{
  objc_storeStrong((id *)&self->_haptic, a3);
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (int64_t)buttonLocation
{
  return self->_buttonLocation;
}

- (void)setButtonLocation:(int64_t)a3
{
  self->_buttonLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_haptic, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundColor, 0);
  objc_storeStrong((id *)&self->_unhighlightAnimator, 0);
  objc_storeStrong((id *)&self->_highlightAnimator, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (void)_darkenSystemColorsChanged:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TVRUIButton _darkenSystemColorsChanged:]";
  _os_log_debug_impl(&dword_21B042000, log, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v1, 0xCu);
}

@end
