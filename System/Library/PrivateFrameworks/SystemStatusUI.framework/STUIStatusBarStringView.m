@implementation STUIStatusBarStringView

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

- (BOOL)wantsCrossfade
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
  -[STUIStatusBarStringView setFont:](self, "setFont:", v6);

  objc_msgSend(v5, "textColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarStringView setTextColor:](self, "setTextColor:", v7);
}

- (void)setText:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[STUIStatusBarStringView setOriginalText:](self, "setOriginalText:", v4);
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarStringView;
  -[STUIStatusBarStringView setText:](&v5, sel_setText_, v4);

}

- (void)setOriginalText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 832);
}

- (STUIStatusBarStringView)initWithFrame:(CGRect)a3
{
  STUIStatusBarStringView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarStringView;
  v3 = -[STUIStatusBarStringView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[STUIStatusBarStringView setAllowsDefaultTighteningForTruncation:](v3, "setAllowsDefaultTighteningForTruncation:", 1);
  return v3;
}

- (void)setFontStyle:(int64_t)a3
{
  self->_fontStyle = a3;
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
    -[STUIStatusBarStringView window](self, "window");
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
      v12[2] = __52__STUIStatusBarStringView__updateAlternateTextTimer__block_invoke;
      v12[3] = &unk_1E8D62CB0;
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

    -[STUIStatusBarStringView setShowsAlternateText:](self, "setShowsAlternateText:", 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateTextTimer, 0);
  objc_storeStrong((id *)&self->_originalText, 0);
  objc_storeStrong((id *)&self->_alternateText, 0);
}

- (BOOL)prefersBaselineAlignment
{
  return 1;
}

- (void)setShowsAlternateText:(BOOL)a3
{
  objc_super v3;
  objc_super v4;

  if (self->_showsAlternateText != a3)
  {
    self->_showsAlternateText = a3;
    if (a3)
      -[STUIStatusBarStringView setText:](&v4, sel_setText_, self->_alternateText, v3.receiver, v3.super_class, self, STUIStatusBarStringView);
    else
      -[STUIStatusBarStringView setText:](&v3, sel_setText_, self->_originalText, self, STUIStatusBarStringView, v4.receiver, v4.super_class);
  }
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
    -[STUIStatusBarStringView _updateAlternateTextTimer](self, "_updateAlternateTextTimer");
    v5 = v6;
  }

}

void __52__STUIStatusBarStringView__updateAlternateTextTimer__block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "showsAlternateText") ^ 1;
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "setShowsAlternateText:", v2);

}

- (void)setEncapsulated:(BOOL)a3
{
  id v4;

  if (a3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CA80F0]);
    -[STUIStatusBarStringView _setTextEncapsulation:](self, "_setTextEncapsulation:", v4);

  }
  else
  {
    -[STUIStatusBarStringView _setTextEncapsulation:](self, "_setTextEncapsulation:", 0);
  }
}

- (BOOL)isEncapsulated
{
  void *v2;
  BOOL v3;

  -[STUIStatusBarStringView _textEncapsulation](self, "_textEncapsulation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (UIAccessibilityHUDItem)accessibilityHUDRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0DC3418]);
  -[STUIStatusBarStringView originalText](self, "originalText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:image:imageInsets:", v4, 0, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

  return (UIAccessibilityHUDItem *)v5;
}

- (int64_t)fontStyle
{
  return self->_fontStyle;
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

- (NSTimer)alternateTextTimer
{
  return self->_alternateTextTimer;
}

@end
