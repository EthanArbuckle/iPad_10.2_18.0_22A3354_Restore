@implementation SBShelfBackgroundView

- (SBShelfBackgroundView)initWithFrame:(CGRect)a3
{
  SBShelfBackgroundView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  MTMaterialView *backgroundView;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  UIView *backgroundMaskView;
  uint64_t v15;
  UIView *backgroundMaskInnerRectangleView;
  UIView *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)SBShelfBackgroundView;
  v3 = -[SBShelfBackgroundView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0D47498];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("shelfBackground"), v5, 0, 0, 1.0);
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (MTMaterialView *)v6;

    -[MTMaterialView setZoomEnabled:](v3->_backgroundView, "setZoomEnabled:", 0);
    -[MTMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:](v3->_backgroundView, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:", 1);
    -[SBShelfBackgroundView addSubview:](v3, "addSubview:", v3->_backgroundView);
    v8 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v9 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], v10, v11, v12);
    backgroundMaskView = v3->_backgroundMaskView;
    v3->_backgroundMaskView = (UIView *)v13;

    -[MTMaterialView setMaskView:](v3->_backgroundView, "setMaskView:", v3->_backgroundMaskView);
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v9, v10, v11, v12);
    backgroundMaskInnerRectangleView = v3->_backgroundMaskInnerRectangleView;
    v3->_backgroundMaskInnerRectangleView = (UIView *)v15;

    v17 = v3->_backgroundMaskInnerRectangleView;
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

    -[UIView addSubview:](v3->_backgroundMaskView, "addSubview:", v3->_backgroundMaskInnerRectangleView);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E18]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setName:", CFSTR("luminanceCurveMap"));
    objc_msgSend(v19, "setValue:forKey:", &unk_1E91CF550, *MEMORY[0x1E0CD2DD0]);
    v20 = *MEMORY[0x1E0CD2CB8];
    objc_msgSend(v19, "setValue:forKey:", &unk_1E91CFB88, *MEMORY[0x1E0CD2CB8]);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setName:", CFSTR("colorSaturate"));
    objc_msgSend(v21, "setValue:forKey:", &unk_1E91CFB98, v20);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setName:", CFSTR("gaussianBlur"));
    objc_msgSend(v22, "setValue:forKey:", CFSTR("low"), *MEMORY[0x1E0CD2D60]);
    objc_msgSend(v22, "setValue:forKey:", CFSTR("low"), *MEMORY[0x1E0CD2D88]);
    objc_msgSend(v22, "setValue:forKey:", &unk_1E91CFBA8, *MEMORY[0x1E0CD2D90]);
    -[UIView layer](v3->_backgroundMaskInnerRectangleView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v19;
    v27[1] = v21;
    v27[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFilters:", v24);

  }
  return v3;
}

- (double)weighting
{
  double result;

  -[MTMaterialView weighting](self->_backgroundView, "weighting");
  return result;
}

- (void)setWeighting:(double)a3
{
  -[MTMaterialView setWeighting:](self->_backgroundView, "setWeighting:", a3);
}

- (void)setExtendedBlurRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_extendedBlurRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_extendedBlurRect = &self->_extendedBlurRect;
  if (!CGRectEqualToRect(a3, self->_extendedBlurRect))
  {
    p_extendedBlurRect->origin.x = x;
    p_extendedBlurRect->origin.y = y;
    p_extendedBlurRect->size.width = width;
    p_extendedBlurRect->size.height = height;
    -[SBShelfBackgroundView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  UIView *backgroundMaskView;
  double v4;
  double v5;
  objc_super v6;
  CGRect v7;
  CGRect v8;
  CGRect v9;

  v6.receiver = self;
  v6.super_class = (Class)SBShelfBackgroundView;
  -[SBShelfBackgroundView layoutSubviews](&v6, sel_layoutSubviews);
  -[MTMaterialView setFrame:](self->_backgroundView, "setFrame:", self->_extendedBlurRect.origin.x, self->_extendedBlurRect.origin.y, self->_extendedBlurRect.size.width, self->_extendedBlurRect.size.height);
  backgroundMaskView = self->_backgroundMaskView;
  -[MTMaterialView bounds](self->_backgroundView, "bounds");
  -[UIView setFrame:](backgroundMaskView, "setFrame:");
  -[SBShelfBackgroundView bounds](self, "bounds");
  v7.origin.x = v4 - self->_extendedBlurRect.origin.x;
  v7.origin.y = v5 - self->_extendedBlurRect.origin.y;
  v8 = CGRectInset(v7, -22.0, -22.0);
  v9 = CGRectOffset(v8, 0.0, 44.0);
  -[UIView setFrame:](self->_backgroundMaskInnerRectangleView, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
}

- (CGRect)extendedBlurRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_extendedBlurRect.origin.x;
  y = self->_extendedBlurRect.origin.y;
  width = self->_extendedBlurRect.size.width;
  height = self->_extendedBlurRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundMaskInnerRectangleView, 0);
  objc_storeStrong((id *)&self->_backgroundMaskView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
