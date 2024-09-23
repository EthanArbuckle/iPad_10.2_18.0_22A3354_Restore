@implementation UIStatusBarSignalStrengthItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5;
  int v6;
  uint64_t v7;

  v5 = objc_msgSend(a3, "rawData");
  v6 = *(_DWORD *)(v5 + 440);
  if (v6 >= 4)
    v7 = 4;
  else
    v7 = v6;
  return -[UIStatusBarSignalStrengthItemView _updateWithRaw:bars:enableRSSI:showFailure:useSmallBars:](self, "_updateWithRaw:bars:enableRSSI:showFailure:useSmallBars:", *(unsigned int *)(v5 + 432), v7, (*(unsigned __int8 *)(v5 + 2529) >> 1) & 1, *(_DWORD *)(v5 + 2072) == 6, *(unsigned __int8 *)(v5 + 5));
}

- (BOOL)_updateWithRaw:(int)a3 bars:(int)a4 enableRSSI:(BOOL)a5 showFailure:(BOOL)a6 useSmallBars:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v12;

  v7 = a7;
  v8 = a6;
  if (self->_enableRSSI == a5)
  {
    v12 = 0;
  }
  else
  {
    self->_enableRSSI = a5;
    v12 = self->_showRSSI != a5;
    self->_showRSSI = a5;
    -[UIView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", self->_enableRSSI);
  }
  if (self->_signalStrengthRaw != a3)
  {
    self->_signalStrengthRaw = a3;
    LOBYTE(v12) = self->_showRSSI || v12;
  }
  if (self->_signalStrengthBars != a4)
  {
    self->_signalStrengthBars = a4;
    if (!self->_showRSSI)
      LOBYTE(v12) = 1;
  }
  if (self->_showFailure != v8)
  {
    self->_showFailure = v8;
    LOBYTE(v12) = 1;
  }
  if (self->_useSmallBars != v7)
  {
    self->_useSmallBars = v7;
    LOBYTE(v12) = 1;
  }
  return v12;
}

- (id)_signalStrengthBarsImageName
{
  uint64_t signalStrengthBars;
  const __CFString *v3;
  __CFString *v4;

  signalStrengthBars = self->_signalStrengthBars;
  if ((signalStrengthBars & 0x80000000) != 0)
  {
    v4 = CFSTR("Bars_NoSim");
  }
  else
  {
    if (self->_useSmallBars)
      v3 = CFSTR("%d_Bars-DualSIM-card");
    else
      v3 = CFSTR("%d_Bars");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v3, signalStrengthBars);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)contentsImage
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (self->_showFailure)
  {
    -[UIStatusBarItemView imageWithShadowNamed:](self, "imageWithShadowNamed:", CFSTR("CellularFailure"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_showRSSI)
    {
      -[UIStatusBarSignalStrengthItemView _stringForRSSI](self, "_stringForRSSI");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStatusBarItemView imageWithText:](self, "imageWithText:", v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIStatusBarSignalStrengthItemView _signalStrengthBarsImageName](self, "_signalStrengthBarsImageName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIStatusBarItemView imageWithShadowNamed:](self, "imageWithShadowNamed:", v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UIStatusBarItemView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      {
        objc_msgSend(v3, "imageSetWithOrientation:", 4);
        v5 = objc_claimAutoreleasedReturnValue();

        v3 = (void *)v5;
      }
    }

  }
  return v3;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (self->_enableRSSI)
  {
    self->_showRSSI ^= 1u;
    -[UIStatusBarItemView updateContentsAndWidth](self, "updateContentsAndWidth");
    if (v8 != 0.0)
    {
      v9 = v8;
      -[UIStatusBarItemView layoutManager](self, "layoutManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "itemView:sizeChangedBy:", self, v9);

    }
  }
  v11.receiver = self;
  v11.super_class = (Class)UIStatusBarSignalStrengthItemView;
  -[UIResponder touchesEnded:withEvent:](&v11, sel_touchesEnded_withEvent_, v6, v7);

}

- (double)extraRightPadding
{
  void *v3;
  int v4;
  double result;
  void *v6;
  void *v7;
  int v8;
  double v9;
  objc_super v10;
  objc_super v11;
  objc_super v12;

  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "usesVerticalLayout");

  if (v4)
  {
    -[UIStatusBarItemView extraRightPadding](&v12, sel_extraRightPadding, v10.receiver, v10.super_class, v11.receiver, v11.super_class, self, UIStatusBarSignalStrengthItemView);
  }
  else
  {
    -[UIStatusBarItemView layoutManager](self, "layoutManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "foregroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isShowingBreadcrumb");

    if (v8)
    {
      -[UIStatusBarItemView extraRightPadding](&v11, sel_extraRightPadding, v10.receiver, v10.super_class, self, UIStatusBarSignalStrengthItemView, v12.receiver, v12.super_class);
    }
    else if (_UIDeviceNativeUserInterfaceIdiom() == 1)
    {
      -[UIStatusBarItemView extraRightPadding](&v10, sel_extraRightPadding, self, UIStatusBarSignalStrengthItemView, v11.receiver, v11.super_class, v12.receiver, v12.super_class);
    }
    else
    {
      -[UIStatusBarItemView standardPadding](self, "standardPadding");
      return -floor(v9 * 0.5);
    }
  }
  return result;
}

- (double)extraLeftPadding
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarSignalStrengthItemView;
  -[UIStatusBarItemView extraRightPadding](&v3, sel_extraRightPadding);
  return result;
}

- (id)_stringForRSSI
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), self->_signalStrengthRaw);
}

- (id)accessibilityHUDRepresentation
{
  __CFString *v3;
  void *v4;
  void *v5;
  UIAccessibilityHUDItem *v6;

  if (self->_showFailure)
  {
    v3 = CFSTR("CellularFailure");
  }
  else
  {
    -[UIStatusBarSignalStrengthItemView _signalStrengthBarsImageName](self, "_signalStrengthBarsImageName");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityHUDImageNamed:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:scaleImage:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:scaleImage:", 0, v5, 1, 0.0, 0.0, 0.0, 0.0);
  return v6;
}

@end
