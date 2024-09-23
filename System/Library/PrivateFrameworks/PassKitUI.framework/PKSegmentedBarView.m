@implementation PKSegmentedBarView

- (PKSegmentedBarView)initWithFrame:(CGRect)a3
{
  PKSegmentedBarView *v3;
  uint64_t v4;
  UIImageView *bar;
  id v6;
  uint64_t v7;
  UIView *placeholder;
  uint64_t v9;
  UIColor *placeholderColor;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKSegmentedBarView;
  v3 = -[PKSegmentedBarView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
    bar = v3->_bar;
    v3->_bar = (UIImageView *)v4;

    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    placeholder = v3->_placeholder;
    v3->_placeholder = (UIView *)v7;

    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v9 = objc_claimAutoreleasedReturnValue();
    placeholderColor = v3->_placeholderColor;
    v3->_placeholderColor = (UIColor *)v9;

    -[UIImageView layer](v3->_bar, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __36__PKSegmentedBarView_initWithFrame___block_invoke(v11);

    -[UIView layer](v3->_placeholder, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __36__PKSegmentedBarView_initWithFrame___block_invoke(v12);

    -[PKSegmentedBarView addSubview:](v3, "addSubview:", v3->_placeholder);
    -[PKSegmentedBarView addSubview:](v3, "addSubview:", v3->_bar);
    -[PKSegmentedBarView _updatePlaceholder](v3, "_updatePlaceholder");
  }
  return v3;
}

void __36__PKSegmentedBarView_initWithFrame___block_invoke(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "setMasksToBounds:", 1);
  objc_msgSend(v1, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

}

- (void)configureWithBarConfiguration:(id)a3 axis:(unsigned int)a4 maximumLength:(double)a5 barLength:(double)a6 synchronous:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  void (**v15)(_QWORD);
  PKSegmentedBarConfiguration *v16;
  unsigned int axis;
  double barLength;
  double maximumLength;
  unint64_t *p_generationCounter;
  unint64_t v21;
  void (**imageCompletion)(void);
  void *v23;
  id v24;
  id v25;

  v9 = a7;
  v25 = a3;
  v15 = (void (**)(_QWORD))a8;
  if (v15)
  {
    v16 = self->_configuration;
    objc_storeStrong((id *)&self->_configuration, a3);
    axis = self->_axis;
    self->_axis = a4;
    barLength = self->_barLength;
    self->_barLength = a6;
    maximumLength = self->_maximumLength;
    self->_maximumLength = a5;
    if (PKEqualObjects()
      && self->_image
      && self->_barLength == barLength
      && self->_maximumLength == maximumLength
      && self->_axis == axis)
    {
      v15[2](v15);
    }
    else
    {
      p_generationCounter = &self->_generationCounter;
      do
        v21 = __ldaxr(p_generationCounter);
      while (__stlxr(v21 + 1, p_generationCounter));
      -[PKSegmentedBarView _updateImageWithImage:](self, "_updateImageWithImage:", 0);
      imageCompletion = (void (**)(void))self->_imageCompletion;
      if (imageCompletion)
        imageCompletion[2]();
      v23 = (void *)objc_msgSend(v15, "copy");
      v24 = self->_imageCompletion;
      self->_imageCompletion = v23;

      -[PKSegmentedBarView _generateImageForConfiguration:barLength:maximumLength:synchronous:](self, "_generateImageForConfiguration:barLength:maximumLength:synchronous:", self->_configuration, v9, a6, a5);
      -[PKSegmentedBarView setNeedsLayout](self, "setNeedsLayout");
    }

  }
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
  double v11;
  unsigned int axis;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKSegmentedBarView;
  -[PKSegmentedBarView layoutSubviews](&v18, sel_layoutSubviews);
  -[PKSegmentedBarView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_placeholder, "setFrame:");
  -[PKSegmentedBarView _updatePlaceholder](self, "_updatePlaceholder");
  PKFloatFloorToPixel();
  axis = self->_axis;
  if (axis)
    v13 = v8;
  else
    v13 = v10;
  if (axis)
    v14 = v13;
  else
    v14 = v11;
  if (axis)
    v15 = v11;
  else
    v15 = v13;
  v16 = v6 + v10 - v11;
  if (axis)
    v17 = v16;
  else
    v17 = v6;
  -[UIImageView setFrame:](self->_bar, "setFrame:", v4, v17, v14, v15);
}

- (void)_updateImageWithImage:(id)a3
{
  UIImage *v5;
  UIImage *image;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_image, a3);
  -[UIImageView image](self->_bar, "image");
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  image = self->_image;

  if (v5 != image)
    -[UIImageView setImage:](self->_bar, "setImage:", self->_image);

}

- (void)_callCompletion
{
  id imageCompletion;
  id v4;
  void (**v5)(void);

  imageCompletion = self->_imageCompletion;
  if (imageCompletion)
  {
    v5 = (void (**)(void))_Block_copy(imageCompletion);
    v4 = self->_imageCompletion;
    self->_imageCompletion = 0;

    v5[2]();
  }
}

- (void)_generateImageForConfiguration:(id)a3 barLength:(double)a4 maximumLength:(double)a5 synchronous:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  int v12;
  double v13;
  void *v14;
  unsigned int axis;
  _BOOL4 blurDisabled;
  id BarImage;
  BOOL v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24[4];
  unsigned int v25;
  BOOL v26;
  id location;

  v6 = a6;
  v10 = a3;
  v11 = v10;
  if (a4 <= 0.0)
  {
    objc_msgSend(v10, "totalValue");
LABEL_7:
    -[PKSegmentedBarView _updateImageWithImage:](self, "_updateImageWithImage:", 0);
    -[PKSegmentedBarView _callCompletion](self, "_callCompletion");
    goto LABEL_12;
  }
  v12 = objc_msgSend(v10, "isReady");
  objc_msgSend(v11, "totalValue");
  if (!v12 || v13 <= 0.0)
    goto LABEL_7;
  -[PKSegmentedBarView traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  axis = self->_axis;
  blurDisabled = self->_blurDisabled;
  if (v6)
  {
    BarImage = CreateBarImage(v11, v14, self->_axis, !blurDisabled, a4, a5);
    -[PKSegmentedBarView _updateImageWithImage:](self, "_updateImageWithImage:", BarImage);
    -[PKSegmentedBarView _callCompletion](self, "_callCompletion");

  }
  else
  {
    v18 = !blurDisabled;
    v19 = (void *)atomic_load(&self->_generationCounter);
    objc_initWeak(&location, self);
    if (qword_1EE4F9508 != -1)
      dispatch_once(&qword_1EE4F9508, &__block_literal_global_90);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __89__PKSegmentedBarView__generateImageForConfiguration_barLength_maximumLength_synchronous___block_invoke;
    v21[3] = &unk_1E3E78BE0;
    v20 = (id)_MergedGlobals_2_3;
    objc_copyWeak(v24, &location);
    v24[1] = v19;
    v22 = v11;
    v23 = v14;
    v25 = axis;
    v24[2] = *(id *)&a4;
    v24[3] = *(id *)&a5;
    v26 = v18;
    dispatch_async(v20, v21);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }

LABEL_12:
}

void __89__PKSegmentedBarView__generateImageForConfiguration_barLength_maximumLength_synchronous___block_invoke(uint64_t a1)
{
  id *v2;
  unint64_t *WeakRetained;
  unint64_t *v4;
  unint64_t v5;
  id BarImage;
  id v7;
  _QWORD block[4];
  id v9;
  id v10[2];

  v2 = (id *)(a1 + 48);
  WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = atomic_load(WeakRetained + 60);
    if (v5 == *(_QWORD *)(a1 + 56))
    {
      BarImage = CreateBarImage(*(void **)(a1 + 32), *(void **)(a1 + 40), *(_DWORD *)(a1 + 80), *(_BYTE *)(a1 + 84), *(double *)(a1 + 64), *(double *)(a1 + 72));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __89__PKSegmentedBarView__generateImageForConfiguration_barLength_maximumLength_synchronous___block_invoke_2;
      block[3] = &unk_1E3E671C0;
      objc_copyWeak(v10, v2);
      v10[1] = *(id *)(a1 + 56);
      v9 = BarImage;
      v7 = BarImage;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(v10);
    }
  }

}

void __89__PKSegmentedBarView__generateImageForConfiguration_barLength_maximumLength_synchronous___block_invoke_2(uint64_t a1)
{
  unint64_t *WeakRetained;
  unint64_t v3;
  unint64_t *v4;

  WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = atomic_load(WeakRetained + 60);
    if (v3 == *(_QWORD *)(a1 + 48))
    {
      v4 = WeakRetained;
      objc_msgSend(WeakRetained, "_updateImageWithImage:", *(_QWORD *)(a1 + 32));
      objc_msgSend(v4, "_callCompletion");
      WeakRetained = v4;
    }
  }

}

- (void)setShowPlaceholder:(BOOL)a3
{
  if (((!self->_showPlaceholder ^ a3) & 1) == 0)
  {
    self->_showPlaceholder = a3;
    -[PKSegmentedBarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setRoundBaselineCorners:(BOOL)a3
{
  if (((!self->_roundBaselineCorners ^ a3) & 1) == 0)
  {
    self->_roundBaselineCorners = a3;
    -[PKSegmentedBarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setUseSmallCornerRadius:(BOOL)a3
{
  if (((!self->_useSmallCornerRadius ^ a3) & 1) == 0)
  {
    self->_useSmallCornerRadius = a3;
    -[PKSegmentedBarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBlurDisabled:(BOOL)a3
{
  UIImage *image;
  unint64_t *p_generationCounter;
  unint64_t v6;

  if (((!self->_blurDisabled ^ a3) & 1) == 0)
  {
    self->_blurDisabled = a3;
    image = self->_image;
    self->_image = 0;

    p_generationCounter = &self->_generationCounter;
    do
      v6 = __ldaxr(p_generationCounter);
    while (__stlxr(v6 + 1, p_generationCounter));
    -[PKSegmentedBarView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPlaceholderColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_placeholderColor, a3);
    -[PKSegmentedBarView _updatePlaceholder](self, "_updatePlaceholder");
  }

}

- (void)_updatePlaceholder
{
  _BOOL4 useSmallCornerRadius;
  double v4;
  double v5;
  uint64_t v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  _QWORD v10[6];

  -[UIView setBackgroundColor:](self->_placeholder, "setBackgroundColor:", self->_placeholderColor);
  useSmallCornerRadius = self->_useSmallCornerRadius;
  v4 = 2.0;
  v5 = 4.0;
  if (!self->_useSmallCornerRadius)
    v4 = 4.0;
  self->_minimumLength = v4;
  v6 = 3;
  if (!self->_axis)
    v6 = 10;
  if (self->_roundBaselineCorners)
  {
    if (!useSmallCornerRadius)
      v5 = 8.0;
    self->_minimumLength = v5;
    v6 = 15;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__PKSegmentedBarView__updatePlaceholder__block_invoke;
  v10[3] = &__block_descriptor_48_e17_v16__0__CALayer_8l;
  v10[4] = v6;
  *(double *)&v10[5] = v4;
  v7 = (void (**)(void *, void *))_Block_copy(v10);
  -[UIImageView layer](self->_bar, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8);

  -[UIView layer](self->_placeholder, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v9);

  -[UIView setHidden:](self->_placeholder, "setHidden:", !self->_showPlaceholder);
}

void __40__PKSegmentedBarView__updatePlaceholder__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setMaskedCorners:", v3);
  objc_msgSend(v4, "setCornerRadius:", *(double *)(a1 + 40));

}

- (BOOL)showPlaceholder
{
  return self->_showPlaceholder;
}

- (BOOL)roundBaselineCorners
{
  return self->_roundBaselineCorners;
}

- (BOOL)useSmallCornerRadius
{
  return self->_useSmallCornerRadius;
}

- (BOOL)isBlurDisabled
{
  return self->_blurDisabled;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (double)minimumLength
{
  return self->_minimumLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong(&self->_imageCompletion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_bar, 0);
}

@end
