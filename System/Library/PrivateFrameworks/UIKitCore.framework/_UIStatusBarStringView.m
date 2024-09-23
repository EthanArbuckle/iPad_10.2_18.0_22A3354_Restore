@implementation _UIStatusBarStringView

- (_UIStatusBarStringView)initWithFrame:(CGRect)a3
{
  _UIStatusBarStringView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarStringView;
  v3 = -[UILabel initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[UILabel setAllowsDefaultTighteningForTruncation:](v3, "setAllowsDefaultTighteningForTruncation:", 1);
  return v3;
}

- (BOOL)wantsCrossfade
{
  return 1;
}

- (BOOL)prefersBaselineAlignment
{
  return 1;
}

- (void)applyStyleAttributes:(id)a3
{
  int64_t fontStyle;
  id v5;
  void *v6;
  id v7;

  fontStyle = self->_fontStyle;
  v5 = a3;
  objc_msgSend(v5, "fontForStyle:", fontStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self, "setFont:", v6);

  objc_msgSend(v5, "textColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setTextColor:](self, "setTextColor:", v7);
}

- (void)setShowsAlternateText:(BOOL)a3
{
  objc_super v3;
  objc_super v4;

  if (self->_showsAlternateText != a3)
  {
    self->_showsAlternateText = a3;
    if (a3)
      -[UILabel setText:](&v4, sel_setText_, self->_alternateText, v3.receiver, v3.super_class, self, _UIStatusBarStringView);
    else
      -[UILabel setText:](&v3, sel_setText_, self->_originalText, self, _UIStatusBarStringView, v4.receiver, v4.super_class);
  }
}

- (void)setText:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[_UIStatusBarStringView setOriginalText:](self, "setOriginalText:", v4);
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarStringView;
  -[UILabel setText:](&v5, sel_setText_, v4);

}

- (void)setAlternateText:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_alternateText != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_alternateText, a3);
    -[_UIStatusBarStringView _updateAlternateTextTimer](self, "_updateAlternateTextTimer");
    v5 = v6;
  }

}

- (void)_updateAlternateTextTimer
{
  void *v3;
  BOOL v4;
  NSTimer **p_alternateTextTimer;
  NSTimer *alternateTextTimer;
  BOOL v7;
  void *v8;
  uint64_t v9;
  NSTimer *v10;
  NSTimer *v11;
  _QWORD v12[4];
  id v13;
  id location;

  if (-[NSString length](self->_alternateText, "length"))
  {
    -[UIView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

    p_alternateTextTimer = &self->_alternateTextTimer;
    alternateTextTimer = self->_alternateTextTimer;
    v7 = alternateTextTimer == 0;
    if (v3 && !alternateTextTimer)
    {
      objc_initWeak(&location, self);
      v8 = (void *)MEMORY[0x1E0C99E88];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __51___UIStatusBarStringView__updateAlternateTextTimer__block_invoke;
      v12[3] = &unk_1E16B26E0;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v8, "scheduledTimerWithTimeInterval:repeats:block:", 1, v12, 8.0);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *p_alternateTextTimer;
      *p_alternateTextTimer = (NSTimer *)v9;

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
      return;
    }
  }
  else
  {
    v4 = 0;
    p_alternateTextTimer = &self->_alternateTextTimer;
    alternateTextTimer = self->_alternateTextTimer;
    v7 = alternateTextTimer == 0;
  }
  if (!v4 && !v7)
  {
    -[NSTimer invalidate](alternateTextTimer, "invalidate");
    v11 = *p_alternateTextTimer;
    *p_alternateTextTimer = 0;

    -[_UIStatusBarStringView setShowsAlternateText:](self, "setShowsAlternateText:", 0);
  }
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  UIAccessibilityHUDItem *v3;
  void *v4;
  UIAccessibilityHUDItem *v5;

  v3 = [UIAccessibilityHUDItem alloc];
  -[_UIStatusBarStringView originalText](self, "originalText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIAccessibilityHUDItem initWithTitle:image:imageInsets:](v3, "initWithTitle:image:imageInsets:", v4, 0, 0.0, 0.0, 0.0, 0.0);

  return v5;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
}

- (void)setFontStyle:(int64_t)a3
{
  self->_fontStyle = a3;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentRectInsets.top;
  left = self->_alignmentRectInsets.left;
  bottom = self->_alignmentRectInsets.bottom;
  right = self->_alignmentRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  self->_alignmentRectInsets = a3;
}

- (NSString)alternateText
{
  return self->_alternateText;
}

- (BOOL)showsAlternateText
{
  return self->_showsAlternateText;
}

- (NSString)originalText
{
  return self->_originalText;
}

- (void)setOriginalText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 832);
}

- (NSTimer)alternateTextTimer
{
  return self->_alternateTextTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateTextTimer, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  objc_storeStrong((id *)&self->_alternateText, 0);
}

@end
