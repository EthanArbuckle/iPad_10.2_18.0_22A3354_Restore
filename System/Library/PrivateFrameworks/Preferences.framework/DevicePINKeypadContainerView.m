@implementation DevicePINKeypadContainerView

- (DevicePINKeypadContainerView)initWithKeypad:(id)a3
{
  id v5;
  DevicePINKeypadContainerView *v6;
  id v7;
  void *v8;
  uint64_t v9;
  UIVisualEffectView *backdropView;
  void *v11;
  void *v12;
  DevicePINKeypad **p_keypad;
  void *v14;
  int v15;
  void *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)DevicePINKeypadContainerView;
  v6 = -[DevicePINKeypadContainerView init](&v18, sel_init);
  if (v6)
  {
    if (PSUsePadStylePIN())
    {
      v7 = objc_alloc(MEMORY[0x1E0CEABE8]);
      objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1000);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "initWithEffect:", v8);
      backdropView = v6->_backdropView;
      v6->_backdropView = (UIVisualEffectView *)v9;

      objc_msgSend(MEMORY[0x1E0CEA478], "systemFillColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView contentView](v6->_backdropView, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBackgroundColor:", v11);

      -[DevicePINKeypadContainerView addSubview:](v6, "addSubview:", v6->_backdropView);
      v6->_iPadKeypadHeight = 226.0;
    }
    p_keypad = &v6->_keypad;
    objc_storeStrong((id *)&v6->_keypad, a3);
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "sf_isiPad");

    if (v15)
    {
      -[UIVisualEffectView contentView](v6->_backdropView, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addSubview:", *p_keypad);

    }
    else
    {
      -[DevicePINKeypadContainerView addSubview:](v6, "addSubview:", *p_keypad);
    }
  }

  return v6;
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
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  double MaxY;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  objc_super v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;

  v41 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)DevicePINKeypadContainerView;
  -[DevicePINKeypadContainerView layoutSubviews](&v38, sel_layoutSubviews);
  -[DevicePINKeypadContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if ((PSUsePadStylePIN() & 1) != 0)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[DevicePINKeypad subviews](self->_keypad, "subviews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v35;
      v15 = 0.0;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          objc_msgSend(v17, "subviews", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v31;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v31 != v21)
                  objc_enumerationMutation(v18);
                objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * j), "frame");
                MaxY = CGRectGetMaxY(v42);
                if (v15 < MaxY)
                  v15 = MaxY;
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
            }
            while (v20);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v13);

      if (v15 >= 216.0 && v15 <= 228.0)
        self->_iPadKeypadHeight = v15;
    }
    else
    {

    }
    v26 = PSRoundToPixel((self->_iPadKeypadHeight - v10) * 0.5);
    v24 = v10 + PSRoundToPixel(v26 + v26);
    -[DevicePINKeypadContainerView frame](self, "frame");
    v25 = PSRoundToPixel(v27 - v24);
    v28 = v26 + 1.0;
    v29 = 0.0;
    if (v26 >= 0.0)
      v28 = -0.0;
    else
      v29 = v26 + 1.0;
    -[UIVisualEffectView setFrame:](self->_backdropView, "setFrame:", v4, v6 + v28, v8, v10 - v29);
  }
  else
  {
    v24 = v10;
    v25 = v6;
  }
  -[UIKeyboard setFrame:](self->_keypad, "setFrame:", v4, v25, v8, v24);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if ((PSUsePadStylePIN() & 1) != 0)
  {
    v6 = 220.0;
    v7 = 320.0;
  }
  else
  {
    -[DevicePINKeypad sizeThatFits:](self->_keypad, "sizeThatFits:", width, height);
  }
  result.height = v6;
  result.width = v7;
  return result;
}

- (DevicePINKeypad)keypad
{
  return (DevicePINKeypad *)objc_getProperty(self, a2, 416, 1);
}

- (void)setKeypad:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (UIVisualEffectView)backdropView
{
  return (UIVisualEffectView *)objc_getProperty(self, a2, 424, 1);
}

- (void)setBackdropView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (double)iPadKeypadHeight
{
  return self->_iPadKeypadHeight;
}

- (void)setIPadKeypadHeight:(double)a3
{
  self->_iPadKeypadHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_keypad, 0);
}

@end
