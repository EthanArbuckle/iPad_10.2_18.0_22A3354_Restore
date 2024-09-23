@implementation SPUIHeaderBlurView

- (void)keyboardWillShow
{
  -[SPUIHeaderBlurView setKeyboardIsUp:](self, "setKeyboardIsUp:", 1);
}

- (SPUIHeaderBlurView)init
{
  SPUIHeaderBlurView *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SPUIHeaderBlurView;
  v2 = -[SPUIHeaderBlurView init](&v8, sel_init);
  if (v2)
  {
    if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardWillShow, *MEMORY[0x24BEBE580], 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_keyboardWillHide, *MEMORY[0x24BEBE578], 0);

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_updateEffect, *MEMORY[0x24BEBDEC0], 0);

      -[SPUIHeaderBlurView setKeyboardIsUp:](v2, "setKeyboardIsUp:", 1);
    }
    else
    {
      -[SPUIHeaderBlurView updateEffect](v2, "updateEffect");
    }
    -[SPUIHeaderBlurView contentView](v2, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0);

  }
  return v2;
}

- (void)setKeyboardIsUp:(BOOL)a3
{
  if (self->_keyboardIsUp != a3)
  {
    self->_keyboardIsUp = a3;
    -[SPUIHeaderBlurView updateEffect](self, "updateEffect");
  }
}

- (void)updateEffect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SPUIHeaderBlurView *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    v3 = (void *)MEMORY[0x24BEBD4C0];
    objc_msgSend(MEMORY[0x24BEBD4B8], "darkGrayColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "colorEffectColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIHeaderBlurView setBackgroundEffects:](self, "setBackgroundEffects:", v6);

    v7 = self;
    v8 = 0;
  }
  else
  {
    if (objc_msgSend(MEMORY[0x24BEB0808], "bottomSearchFieldEnabled"))
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BEBD428], "_effectWithBlurRadius:scale:", 30.0, 0.1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v10);

      objc_msgSend(MEMORY[0x24BEBD4C0], "colorEffectSaturate:", 1.6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      objc_msgSend(MEMORY[0x24BEBD4C0], "colorEffectBrightness:", 0.15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v12;
      objc_msgSend(MEMORY[0x24BEBD4C0], "colorEffectLuminanceCurveMap:blendingAmount:", &unk_24F9E0798, 0.5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[2] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObjectsFromArray:", v14);

      -[SPUIHeaderBlurView setBackgroundEffects:](self, "setBackgroundEffects:", v9);
      return;
    }
    objc_msgSend(MEMORY[0x24BEBD428], "effectWithBlurRadius:", 22.5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v15;
    objc_msgSend(MEMORY[0x24BEBD4C0], "colorEffectSaturate:", 1.3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUIHeaderBlurView setBackgroundEffects:](self, "setBackgroundEffects:", v17);

    v8 = CFSTR("SPUIHeaderBlurView");
    v7 = self;
  }
  -[SPUIHeaderBlurView _setGroupName:](v7, "_setGroupName:", v8);
}

- (void)keyboardWillHide
{
  -[SPUIHeaderBlurView setKeyboardIsUp:](self, "setKeyboardIsUp:", 0);
}

- (void)setUseInPlaceFilteredBlur:(BOOL)a3
{
  if (self->_useInPlaceFilteredBlur != a3)
  {
    self->_useInPlaceFilteredBlur = a3;
    -[SPUIHeaderBlurView updateEffect](self, "updateEffect");
  }
}

- (void)setTintColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPUIHeaderBlurView;
  -[SPUIHeaderBlurView setTintColor:](&v4, sel_setTintColor_, a3);
  -[SPUIHeaderBlurView updateEffect](self, "updateEffect");
}

- (BOOL)useInPlaceFilteredBlur
{
  return self->_useInPlaceFilteredBlur;
}

- (BOOL)keyboardIsUp
{
  return self->_keyboardIsUp;
}

@end
