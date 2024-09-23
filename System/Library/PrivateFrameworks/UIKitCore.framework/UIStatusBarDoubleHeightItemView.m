@implementation UIStatusBarDoubleHeightItemView

- (BOOL)updateForNewData:(id)a3 actions:(int)a4
{
  void *v5;
  NSString **p_contentsString;
  char v7;
  void *v8;
  double v9;
  double letterSpacing;
  double v11;

  objc_msgSend(a3, "doubleHeightStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_contentsString = &self->_contentsString;
  v7 = objc_msgSend(v5, "isEqualToString:", self->_contentsString);
  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contentsString, v5);
    -[UIStatusBarItemView textFont](self, "textFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString _legacy_sizeWithFont:](*p_contentsString, "_legacy_sizeWithFont:", v8);
    self->_letterSpacing = 0.0;
    self->_ellipsize = 0;
    if (v9 > 320.0)
    {
      while (1)
      {
        letterSpacing = self->_letterSpacing;
        if (letterSpacing < -1.0)
          break;
        self->_letterSpacing = letterSpacing + -0.25;
        -[NSString sizeWithFont:forWidth:lineBreakMode:letterSpacing:](*p_contentsString, "sizeWithFont:forWidth:lineBreakMode:letterSpacing:", v8, 5, 3.40282347e38);
        if (v11 <= 320.0)
        {
          letterSpacing = self->_letterSpacing;
          break;
        }
      }
      if (letterSpacing < -1.0)
      {
        self->_letterSpacing = 0.0;
        self->_ellipsize = 1;
      }
    }

  }
  return v7 ^ 1;
}

- (id)contentsImage
{
  double v3;
  void *v4;
  NSString *contentsString;
  double letterSpacing;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  double v10;
  void *v11;

  if (-[NSString length](self->_contentsString, "length"))
  {
    if (self->_ellipsize)
      v3 = 320.0;
    else
      v3 = 1.79769313e308;
    -[UIStatusBarItemView foregroundStyle](self, "foregroundStyle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    contentsString = self->_contentsString;
    letterSpacing = self->_letterSpacing;
    v7 = -[UIStatusBarItemView textAlignment](self, "textAlignment");
    v8 = -[UIStatusBarItemView textStyle](self, "textStyle");
    v9 = -[UIStatusBarItemView legibilityStyle](self, "legibilityStyle");
    -[UIStatusBarItemView legibilityStrength](self, "legibilityStrength");
    objc_msgSend(v4, "imageWithText:ofItemType:forWidth:lineBreakMode:letterSpacing:textAlignment:style:withLegibilityStyle:legibilityStrength:", contentsString, 23, 5, v7, v8, v9, v3, letterSpacing, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (double)extraRightPadding
{
  return 10.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentsString, 0);
}

@end
