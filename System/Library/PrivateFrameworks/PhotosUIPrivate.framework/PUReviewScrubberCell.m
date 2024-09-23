@implementation PUReviewScrubberCell

- (void)_commonPUReviewScrubberCellInitialization
{
  id v3;
  UIImageView *v4;
  UIImageView *thumbnailImageView;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  UIImageView *v15;
  UIImageView *checkmarkImageView;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  UIImageView *v21;
  UIImageView *suggestedImageView;
  void *v23;

  v3 = objc_alloc(MEMORY[0x1E0DC3890]);
  v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  thumbnailImageView = self->__thumbnailImageView;
  self->__thumbnailImageView = v4;

  -[UIImageView setAccessibilityIgnoresInvertColors:](self->__thumbnailImageView, "setAccessibilityIgnoresInvertColors:", 1);
  -[UIImageView setContentMode:](self->__thumbnailImageView, "setContentMode:", 2);
  -[UIImageView setClipsToBounds:](self->__thumbnailImageView, "setClipsToBounds:", 1);
  +[PUScrubberSettings sharedInstance](PUScrubberSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lemonadeItemCornerRadius");
  v8 = v7;
  -[UIImageView layer](self->__thumbnailImageView, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", v8);

  v10 = *MEMORY[0x1E0CD2A68];
  -[UIImageView layer](self->__thumbnailImageView, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCornerCurve:", v10);

  -[PUReviewScrubberCell contentView](self, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", self->__thumbnailImageView);

  v13 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("checkmark"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (UIImageView *)objc_msgSend(v13, "initWithImage:", v14);
  checkmarkImageView = self->__checkmarkImageView;
  self->__checkmarkImageView = v15;

  -[PUReviewScrubberCell contentView](self, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", self->__checkmarkImageView);

  v18 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "pu_PhotosUIImageNamed:", CFSTR("AvalancheReviewSuggestedDot.png"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "imageWithRenderingMode:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (UIImageView *)objc_msgSend(v18, "initWithImage:", v20);
  suggestedImageView = self->__suggestedImageView;
  self->__suggestedImageView = v21;

  -[PUReviewScrubberCell contentView](self, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", self->__suggestedImageView);

  self->_favorite = 0;
  self->_suggested = 0;
  -[PUReviewScrubberCell _updateFavoriteView](self, "_updateFavoriteView");
  -[PUReviewScrubberCell _updateSuggestedView](self, "_updateSuggestedView");
}

- (PUReviewScrubberCell)initWithFrame:(CGRect)a3
{
  PUReviewScrubberCell *v3;
  PUReviewScrubberCell *v4;
  PUReviewScrubberCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUReviewScrubberCell;
  v3 = -[PUReviewScrubberCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUReviewScrubberCell _commonPUReviewScrubberCellInitialization](v3, "_commonPUReviewScrubberCellInitialization");
    v5 = v4;
  }

  return v4;
}

- (PUReviewScrubberCell)initWithCoder:(id)a3
{
  PUReviewScrubberCell *v3;
  PUReviewScrubberCell *v4;
  PUReviewScrubberCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUReviewScrubberCell;
  v3 = -[PUReviewScrubberCell initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[PUReviewScrubberCell _commonPUReviewScrubberCellInitialization](v3, "_commonPUReviewScrubberCellInitialization");
    v5 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  UIImageView *suggestedImageView;
  void *v24;
  void *v25;
  uint64_t v26;
  objc_super v27;
  CGRect v28;

  v27.receiver = self;
  v27.super_class = (Class)PUReviewScrubberCell;
  -[PUReviewScrubberCell layoutSubviews](&v27, sel_layoutSubviews);
  -[PUReviewScrubberCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIImageView setFrame:](self->__thumbnailImageView, "setFrame:", v5, v7, v9, v11);
  -[UIImageView sizeToFit](self->__checkmarkImageView, "sizeToFit");
  -[UIImageView center](self->__thumbnailImageView, "center");
  -[UIImageView setCenter:](self->__checkmarkImageView, "setCenter:");
  -[UIImageView sizeToFit](self->__suggestedImageView, "sizeToFit");
  -[UIImageView bounds](self->__suggestedImageView, "bounds");
  v26 = 0;
  UIRectCenteredIntegralRectScale();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = 3.0;
  if (!self->_wantsSmallSuggestionIndicators)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scale");
    v18 = 1.0 / v20 + 5.0;

  }
  -[PUReviewScrubberCell contentView](self, "contentView", v26);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v22 = v18 + CGRectGetMaxY(v28);

  -[UIImageView setFrame:](self->__suggestedImageView, "setFrame:", v13, v22, v15, v17);
  suggestedImageView = self->__suggestedImageView;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "colorWithAlphaComponent:", 0.25);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](suggestedImageView, "setTintColor:", v25);

}

- (void)setImage:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    -[PUReviewScrubberCell _updateThumbnailImageView](self, "_updateThumbnailImageView");
    v5 = v6;
  }

}

- (void)setFavorite:(BOOL)a3
{
  -[PUReviewScrubberCell setFavorite:animated:](self, "setFavorite:animated:", a3, 0);
}

- (void)setFavorite:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  if (self->_favorite != a3)
  {
    v4 = a4;
    self->_favorite = a3;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __45__PUReviewScrubberCell_setFavorite_animated___block_invoke;
    aBlock[3] = &unk_1E58ABD10;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    v6 = v5;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.25);
    else
      (*((void (**)(void *))v5 + 2))(v5);

  }
}

- (void)setSuggested:(BOOL)a3
{
  -[PUReviewScrubberCell setSuggested:animated:](self, "setSuggested:animated:", a3, 0);
}

- (void)setSuggested:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  if (self->_suggested != a3)
  {
    v4 = a4;
    self->_suggested = a3;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__PUReviewScrubberCell_setSuggested_animated___block_invoke;
    aBlock[3] = &unk_1E58ABD10;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    v6 = v5;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v5, 0.25);
    else
      (*((void (**)(void *))v5 + 2))(v5);

  }
}

- (void)_updateThumbnailImageView
{
  -[UIImageView setImage:](self->__thumbnailImageView, "setImage:", self->_image);
}

- (void)_updateFavoriteView
{
  double v3;
  double v4;

  v3 = 0.200000003;
  if (!self->_favorite)
    v3 = 1.0;
  -[UIImageView setAlpha:](self->__thumbnailImageView, "setAlpha:", v3);
  v4 = 0.0;
  if (self->_favorite)
    v4 = 1.0;
  -[UIImageView setAlpha:](self->__checkmarkImageView, "setAlpha:", v4);
}

- (void)_updateSuggestedView
{
  double v2;

  v2 = 1.0;
  if (!self->_suggested)
    v2 = 0.0;
  -[UIImageView setAlpha:](self->__suggestedImageView, "setAlpha:", v2);
}

- (UIImage)image
{
  return self->_image;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (BOOL)isSuggested
{
  return self->_suggested;
}

- (BOOL)wantsSmallSuggestionIndicators
{
  return self->_wantsSmallSuggestionIndicators;
}

- (void)setWantsSmallSuggestionIndicators:(BOOL)a3
{
  self->_wantsSmallSuggestionIndicators = a3;
}

- (UIImageView)_thumbnailImageView
{
  return self->__thumbnailImageView;
}

- (UIImageView)_checkmarkImageView
{
  return self->__checkmarkImageView;
}

- (UIImageView)_suggestedImageView
{
  return self->__suggestedImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__suggestedImageView, 0);
  objc_storeStrong((id *)&self->__checkmarkImageView, 0);
  objc_storeStrong((id *)&self->__thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

uint64_t __46__PUReviewScrubberCell_setSuggested_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSuggestedView");
}

uint64_t __45__PUReviewScrubberCell_setFavorite_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFavoriteView");
}

@end
