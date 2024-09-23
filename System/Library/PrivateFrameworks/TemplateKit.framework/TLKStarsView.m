@implementation TLKStarsView

- (TLKStarsView)init
{
  TLKStarsView *v2;
  uint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TLKStarsView;
  v2 = -[TLKStarsView init](&v6, sel_init);
  if (v2)
  {
    v3 = 5;
    do
    {
      v4 = (void *)objc_opt_new();
      +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v4);
      -[TLKStackView addArrangedSubview:](v2, "addArrangedSubview:", v4);

      --v3;
    }
    while (v3);
    +[TLKLayoutUtilities requireIntrinsicSizeForView:](TLKLayoutUtilities, "requireIntrinsicSizeForView:", v2);
  }
  return v2;
}

- (void)setStarRating:(double)a3
{
  if (self->_starRating != a3)
  {
    self->_starRating = a3;
    -[TLKStarsView updateStarImages](self, "updateStarImages");
  }
}

- (void)setFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_font) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_font, a3);
    -[TLKStarsView updateStarImages](self, "updateStarImages");
  }

}

- (void)setUseCompactMode:(BOOL)a3
{
  if (self->_useCompactMode != a3)
  {
    self->_useCompactMode = a3;
    -[TLKStarsView updateStarImages](self, "updateStarImages");
  }
}

- (void)updateStarImages
{
  unint64_t i;
  const __CFString *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TLKImage *v12;

  for (i = 1; i != 6; ++i)
  {
    -[TLKStarsView starRating](self, "starRating");
    v4 = CFSTR("star.fill");
    if (v5 < (double)i)
    {
      -[TLKStarsView starRating](self, "starRating");
      if (v6 >= (double)i
        || (-[TLKStarsView starRating](self, "starRating"), v4 = CFSTR("star.leadinghalf.fill"), v7 <= (double)(i - 1)))
      {
        v4 = CFSTR("star");
      }
    }
    -[TLKStarsView arrangedSubviews](self, "arrangedSubviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", i - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSymbolScale:", TLKSnippetModernizationEnabled());
    -[TLKStarsView font](self, "font");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSymbolFont:", v11);

    v12 = -[TLKImage initWithImage:]([TLKImage alloc], "initWithImage:", v10);
    -[TLKImage setIsTemplate:](v12, "setIsTemplate:", 1);
    objc_msgSend(v9, "setTlkImage:", v12);

  }
}

- (double)starRating
{
  return self->_starRating;
}

- (UIFont)font
{
  return self->_font;
}

- (BOOL)useCompactMode
{
  return self->_useCompactMode;
}

- (double)currentStarRating
{
  return self->_currentStarRating;
}

- (void)setCurrentStarRating:(double)a3
{
  self->_currentStarRating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
}

@end
