@implementation UIStatusBarPersonNameItemView

- (double)standardPadding
{
  double v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarPersonNameItemView;
  -[UIStatusBarItemView standardPadding](&v4, sel_standardPadding);
  return v2 + -1.0;
}

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  uint64_t v5;
  void *v6;

  v5 = objc_msgSend(a3, "rawData");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v5 + 3049, 4);
  LOBYTE(self) = -[UIStatusBarPersonNameItemView _updateWithPersonName:maxWidth:](self, "_updateWithPersonName:maxWidth:", v6, 1.79769313e308);

  return (char)self;
}

- (BOOL)_updateWithPersonName:(id)a3 maxWidth:(double)a4
{
  id v6;
  BOOL v7;
  NSString *v8;
  NSString *personNameString;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double letterSpacing;
  void *v16;
  id v17;
  NSString *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSString isEqualToString:](self->_personNameString, "isEqualToString:", v6))
  {
    if (self->_maxWidth == a4)
    {
      v7 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    personNameString = self->_personNameString;
    self->_personNameString = v8;

  }
  v25 = v6;
  self->_maxWidth = a4;
  self->_letterSpacing = 0.0;
  -[UIView setClipsToBounds:](self, "setClipsToBounds:", 0);
  -[UIStatusBarItemView cachedImageWithText:truncatedWithEllipsesAtMaxWidth:letterSpacing:](self, "cachedImageWithText:truncatedWithEllipsesAtMaxWidth:letterSpacing:", self->_personNameString, 1.79769313e308, self->_letterSpacing);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "image");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v11;
  objc_msgSend(v11, "size");
  if (v12 <= a4)
  {
    -[UIView setClipsToBounds:](self, "setClipsToBounds:", 0);
  }
  else
  {
    -[UIView setClipsToBounds:](self, "setClipsToBounds:", 1);
    v13 = *(_QWORD *)off_1E1678D90;
    v14 = *(_QWORD *)off_1E1678E60;
    while (1)
    {
      letterSpacing = self->_letterSpacing;
      if (letterSpacing <= -1.0)
        break;
      self->_letterSpacing = letterSpacing + -0.25;
      -[UIStatusBarItemView textFont](self, "textFont");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_alloc_init((Class)off_1E1679CC0);
      v18 = self->_personNameString;
      v26[1] = v14;
      v27[0] = v16;
      v26[0] = v13;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_letterSpacing);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v19;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString boundingRectWithSize:options:attributes:context:](v18, "boundingRectWithSize:options:attributes:context:", 33, v20, v17, 1.79769313e308, 1.79769313e308);
      v22 = v21;

      if (v22 <= a4)
        goto LABEL_12;
    }
    self->_letterSpacing = 0.0;
  }
LABEL_12:

  v7 = 1;
  v6 = v25;
LABEL_13:

  return v7;
}

- (id)contentsImage
{
  return -[UIStatusBarItemView cachedImageWithText:truncatedWithEllipsesAtMaxWidth:letterSpacing:](self, "cachedImageWithText:truncatedWithEllipsesAtMaxWidth:letterSpacing:", self->_personNameString, self->_maxWidth, self->_letterSpacing);
}

- (double)resetContentOverlap
{
  double result;

  self->_maxWidth = 1.79769313e308;
  -[UIStatusBarItemView clearCachedTextImage](self, "clearCachedTextImage");
  -[UIStatusBarPersonNameItemView _updateWithPersonName:maxWidth:](self, "_updateWithPersonName:maxWidth:", self->_personNameString, 1.79769313e308);
  -[UIStatusBarItemView updateContentsAndWidth](self, "updateContentsAndWidth");
  return result;
}

- (double)addContentOverlap:(double)a3
{
  double v5;
  double v6;
  double result;

  -[UIView frame](self, "frame");
  v6 = v5 - a3;
  if (v5 - a3 < 20.0)
    v6 = 20.0;
  if (!-[UIStatusBarPersonNameItemView _updateWithPersonName:maxWidth:](self, "_updateWithPersonName:maxWidth:", self->_personNameString, v6))return 0.0;
  -[UIStatusBarItemView updateContentsAndWidth](self, "updateContentsAndWidth");
  return result;
}

- (double)extraRightPadding
{
  uint64_t v3;
  double result;
  objc_super v5;

  v3 = _UIDeviceNativeUserInterfaceIdiom();
  result = 4.0;
  if (v3 != 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIStatusBarPersonNameItemView;
    -[UIStatusBarItemView extraRightPadding](&v5, sel_extraRightPadding, 4.0);
  }
  return result;
}

- (int64_t)legibilityStyle
{
  objc_super v4;

  if (-[UIView clipsToBounds](self, "clipsToBounds"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)UIStatusBarPersonNameItemView;
  return -[UIStatusBarItemView legibilityStyle](&v4, sel_legibilityStyle);
}

- (id)accessibilityHUDRepresentation
{
  return -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:]([UIAccessibilityHUDItem alloc], "initWithTitle:image:imageInsets:", self->_personNameString, 0, 0.0, 0.0, 0.0, 0.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personNameString, 0);
}

@end
