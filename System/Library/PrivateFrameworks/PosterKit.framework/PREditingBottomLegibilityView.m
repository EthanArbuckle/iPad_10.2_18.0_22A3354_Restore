@implementation PREditingBottomLegibilityView

+ (Class)layerClass
{
  return (Class)objc_opt_self();
}

- (PREditingBottomLegibilityView)initWithFrame:(CGRect)a3
{
  PREditingBottomLegibilityView *v3;
  uint64_t v4;
  CAGradientLayer *gradientLayer;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PREditingBottomLegibilityView;
  v3 = -[PREditingBottomLegibilityView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v4 = objc_claimAutoreleasedReturnValue();
    gradientLayer = v3->_gradientLayer;
    v3->_gradientLayer = (CAGradientLayer *)v4;

    -[CAGradientLayer setAllowsHitTesting:](v3->_gradientLayer, "setAllowsHitTesting:", 0);
    -[PREditingBottomLegibilityView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSublayer:", v3->_gradientLayer);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PREditingBottomLegibilityView setGradientColor:](v3, "setGradientColor:", v7);

    v3->_shouldOverscan = 1;
    v3->_gradientHeightMultiplier = 1;
  }
  return v3;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PREditingBottomLegibilityView;
  -[PREditingBottomLegibilityView layoutSubviews](&v11, sel_layoutSubviews);
  -[PREditingBottomLegibilityView bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  if (self->_shouldOverscan)
  {
    -[PREditingBottomLegibilityView _updateGradientHeightMultiplierIfNeededForBounds:](self, "_updateGradientHeightMultiplierIfNeededForBounds:", v3, v4, v5, v6);
    -[PREditingBottomLegibilityView _expandedGradientFrameInBounds:](self, "_expandedGradientFrameInBounds:", v7, v8, v9, v10);
  }
  else
  {
    -[PREditingBottomLegibilityView _compactGradientFrameInBounds:](self, "_compactGradientFrameInBounds:", v3, v4, v5, v6);
  }
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
}

- (void)setGradientColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_gradientColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gradientColor, a3);
    -[PREditingBottomLegibilityView _updateGradientColors](self, "_updateGradientColors");
  }

}

- (void)setGradientHeightMultiplier:(int64_t)a3
{
  if (self->_gradientHeightMultiplier != a3)
  {
    self->_gradientHeightMultiplier = a3;
    -[PREditingBottomLegibilityView _updateGradientColors](self, "_updateGradientColors");
  }
}

- (void)setHeightFactor:(double)a3
{
  if (self->_heightFactor != a3)
  {
    self->_heightFactor = a3;
    -[PREditingBottomLegibilityView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setShouldOverscan:(BOOL)a3
{
  if (self->_shouldOverscan != a3)
  {
    self->_shouldOverscan = a3;
    -[PREditingBottomLegibilityView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)_compactGradientFrameInBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGSize v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect slice;
  CGRect v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = a3;
  v7 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  slice.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  slice.size = v7;
  v7.width = y;
  v8 = CGRectGetHeight(a3) * self->_heightFactor;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  CGRectDivide(v15, &slice, &v13, v8, CGRectMaxYEdge);
  v9 = slice.origin.x;
  v10 = slice.origin.y;
  v11 = slice.size.width;
  v12 = slice.size.height;
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)_expandedGradientFrameInBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  v9 = CGRectGetHeight(v13);
  v10 = v9 * self->_heightFactor;
  -[PREditingBottomLegibilityView _compactGradientFrameInBounds:](self, "_compactGradientFrameInBounds:", x, y, width, height);
  v11 = sqrt(v9 * v9 + v8 * v8);
  *(float *)&v11 = sqrt(v11 * 0.5 * (v11 * 0.5) - (v9 * 0.5 - v10) * (v9 * 0.5 - v10));
  *(float *)&v11 = ceilf(*(float *)&v11);
  result = CGRectInset(v14, ((float)(*(float *)&v11 + *(float *)&v11) - v8) * -0.5, 0.0);
  v12 = v10 * (double)self->_gradientHeightMultiplier;
  result.size.height = v12;
  return result;
}

- (int64_t)_requiredGradientMultiplierForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v9 = CGRectGetHeight(v12);
  v10 = v9 * self->_heightFactor;
  *(float *)&v9 = sqrt(v9 * v9 + v8 * v8) * 0.5 - (v9 * 0.5 - v10);
  return vcvtpd_s64_f64(ceilf(*(float *)&v9) / v10);
}

- (void)_updateGradientHeightMultiplierIfNeededForBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  CGFloat x;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect *v20;
  CGRect *p_previouslyConsideredBounds;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGSize size;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  void *v31;
  double v32;
  _QWORD v33[4];
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v34 = a3;
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (*MEMORY[0x1E0C9D538] != a3.origin.x || v8 != y)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *MEMORY[0x1E0C9D538], v8);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PREditingBottomLegibilityView.m"), 180, CFSTR("we don't support not being full-screen!"));

  }
  BSSizeSwap();
  BSRectWithSize();
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  *(double *)v33 = v10;
  *(double *)&v33[1] = v12;
  *(double *)&v33[2] = v14;
  *(double *)&v33[3] = v16;
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v32 = x;
  v18 = CGRectGetHeight(v35);
  v36.origin.x = v11;
  v36.origin.y = v13;
  v36.size.width = v15;
  v36.size.height = v17;
  v19 = CGRectGetHeight(v36);
  if (v18 <= v19)
    v20 = (CGRect *)v33;
  else
    v20 = &v34;
  p_previouslyConsideredBounds = &self->_previouslyConsideredBounds;
  if (v18 <= v19)
    v23 = v13;
  else
    v23 = y;
  if (v18 <= v19)
    v24 = v15;
  else
    v24 = width;
  if (v18 <= v19)
    v25 = v17;
  else
    v25 = height;
  v37.origin.x = p_previouslyConsideredBounds->origin.x;
  v37.origin.y = self->_previouslyConsideredBounds.origin.y;
  v37.size.width = self->_previouslyConsideredBounds.size.width;
  v37.size.height = self->_previouslyConsideredBounds.size.height;
  v22 = v20->origin.x;
  if (!CGRectEqualToRect(*(CGRect *)(&v23 - 1), v37))
  {
    size = v20->size;
    p_previouslyConsideredBounds->origin = v20->origin;
    self->_previouslyConsideredBounds.size = size;
    v27 = -[PREditingBottomLegibilityView _requiredGradientMultiplierForBounds:](self, "_requiredGradientMultiplierForBounds:", v32, y, width, height);
    v28 = -[PREditingBottomLegibilityView _requiredGradientMultiplierForBounds:](self, "_requiredGradientMultiplierForBounds:", v11, v13, v15, v17);
    if (v27 <= v28)
      v29 = v28;
    else
      v29 = v27;
    -[PREditingBottomLegibilityView setGradientHeightMultiplier:](self, "setGradientHeightMultiplier:", v29);
  }
}

- (void)_updateGradientColors
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIColor colorWithAlphaComponent:](self->_gradientColor, "colorWithAlphaComponent:", 0.07, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v5 = 0.1;
  -[UIColor colorWithAlphaComponent:](self->_gradientColor, "colorWithAlphaComponent:", 0.1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_gradientHeightMultiplier < 2)
  {
    v9 = v7;
  }
  else
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    if (self->_gradientHeightMultiplier >= 2)
    {
      v10 = 1;
      do
      {
        v11 = v5 + 0.01;
        -[UIColor colorWithAlphaComponent:](self->_gradientColor, "colorWithAlphaComponent:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v12);

        v5 = v11 + 0.01;
        -[UIColor colorWithAlphaComponent:](self->_gradientColor, "colorWithAlphaComponent:", v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v13);

        ++v10;
      }
      while (v10 < self->_gradientHeightMultiplier);
    }

  }
  __54__PREditingBottomLegibilityView__updateGradientColors__block_invoke(v8, self->_gradientLayer, v9);

}

void __54__PREditingBottomLegibilityView__updateGradientColors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a2;
  objc_msgSend(a3, "bs_compactMap:", &__block_literal_global_9_1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setColors:", v5);

}

uint64_t __54__PREditingBottomLegibilityView__updateGradientColors__block_invoke_2(int a1, id a2)
{
  return objc_msgSend(objc_retainAutorelease(a2), "CGColor");
}

- (double)heightFactor
{
  return self->_heightFactor;
}

- (BOOL)shouldOverscan
{
  return self->_shouldOverscan;
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (UIColor)gradientColor
{
  return self->_gradientColor;
}

- (int64_t)gradientHeightMultiplier
{
  return self->_gradientHeightMultiplier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientColor, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
}

@end
