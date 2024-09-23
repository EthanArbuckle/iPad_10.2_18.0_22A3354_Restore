@implementation STUIStatusBarSignalView

- (void)setNumberOfBars:(int64_t)a3
{
  if (self->_numberOfBars != a3)
  {
    self->_numberOfBars = a3;
    -[STUIStatusBarSignalView _updateBars](self, "_updateBars");
    -[STUIStatusBarSignalView setNeedsLayout](self, "setNeedsLayout");
    -[STUIStatusBarSignalView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)_updateBars
{
  void *v2;
  id v3;

  -[STUIStatusBarSignalView layer](self, "layer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sublayers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);

}

- (void)setInactiveColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_inactiveColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_inactiveColor, a3);
    -[STUIStatusBarSignalView _colorsDidChange](self, "_colorsDidChange");
    v5 = v6;
  }

}

- (void)setActiveColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_activeColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_activeColor, a3);
    -[STUIStatusBarSignalView _colorsDidChange](self, "_colorsDidChange");
    v5 = v6;
  }

}

- (int64_t)iconSize
{
  return self->_iconSize;
}

- (UIColor)activeColor
{
  return self->_activeColor;
}

- (int64_t)numberOfActiveBars
{
  return self->_numberOfActiveBars;
}

- (int64_t)numberOfBars
{
  return self->_numberOfBars;
}

- (int64_t)signalMode
{
  return self->_signalMode;
}

- (UIColor)inactiveColor
{
  return self->_inactiveColor;
}

- (BOOL)rounded
{
  return self->_rounded;
}

- (void)setSignalMode:(int64_t)a3
{
  int64_t signalMode;

  signalMode = self->_signalMode;
  if (signalMode != a3)
  {
    self->_signalMode = a3;
    -[STUIStatusBarSignalView _updateFromMode:](self, "_updateFromMode:", signalMode);
  }
}

- (void)setNumberOfActiveBars:(int64_t)a3
{
  int64_t numberOfBars;

  if (self->_numberOfActiveBars != a3)
  {
    numberOfBars = self->_numberOfBars;
    if (numberOfBars >= (a3 & ~(a3 >> 63)))
      numberOfBars = a3 & ~(a3 >> 63);
    self->_numberOfActiveBars = numberOfBars;
    if (-[STUIStatusBarSignalView signalMode](self, "signalMode") == 2)
      -[STUIStatusBarSignalView _updateActiveBars](self, "_updateActiveBars");
  }
}

- (void)applyStyleAttributes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int rounded;

  v4 = a3;
  v5 = objc_msgSend(v4, "isRounded");
  v6 = objc_msgSend(v4, "iconSize");

  if (self->_iconSize != v6)
  {
    -[STUIStatusBarSignalView setRounded:](self, "setRounded:", v5);
    -[STUIStatusBarSignalView setIconSize:](self, "setIconSize:", v6);
    goto LABEL_5;
  }
  rounded = self->_rounded;
  -[STUIStatusBarSignalView setRounded:](self, "setRounded:", v5);
  -[STUIStatusBarSignalView setIconSize:](self, "setIconSize:", v6);
  if (rounded != (_DWORD)v5)
LABEL_5:
    -[STUIStatusBarSignalView _iconSizeDidChange](self, "_iconSizeDidChange");
}

- (void)setRounded:(BOOL)a3
{
  self->_rounded = a3;
}

- (void)setIconSize:(int64_t)a3
{
  self->_iconSize = a3;
}

- (void)_iconSizeDidChange
{
  -[STUIStatusBarSignalView _updateBars](self, "_updateBars");
  -[STUIStatusBarSignalView setNeedsLayout](self, "setNeedsLayout");
  -[STUIStatusBarSignalView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeColor, 0);
  objc_storeStrong((id *)&self->_inactiveColor, 0);
}

- (void)setSmallSize:(BOOL)a3
{
  if (self->_smallSize != a3)
  {
    self->_smallSize = a3;
    -[STUIStatusBarSignalView setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (CGSize)_intrinsicContentSizeForNumberOfBars:(int64_t)a3 iconSize:(int64_t)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)smallSize
{
  return self->_smallSize;
}

@end
