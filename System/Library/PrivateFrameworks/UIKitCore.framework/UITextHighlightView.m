@implementation UITextHighlightView

+ (id)preferredPreviewParametersForTextLineRects:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  UIPreviewParameters *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGRect v21;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      v8 = 0.0;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "CGRectValue", (_QWORD)v15);
          v8 = v8 + CGRectGetHeight(v21);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }
    else
    {
      v8 = 0.0;
    }

    v10 = v8 / (double)(unint64_t)objc_msgSend(v4, "count");
  }
  else
  {
    v10 = 12.0;
  }
  v11 = v10 * 0.25;
  v12 = v10 * -0.2 * 0.5;
  v13 = -[UIPreviewParameters initWithTextLineRects:]([UIPreviewParameters alloc], "initWithTextLineRects:", v3);
  -[UIPreviewParameters _setTextPathCornerRadius:](v13, "_setTextPathCornerRadius:", v11);
  -[UIPreviewParameters _setTextPathInsets:](v13, "_setTextPathInsets:", v12, -4.0, v12, -4.0);

  return v13;
}

- (UITextHighlightView)initWithPreviewProvider:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UITextHighlightView *v9;
  void *v10;
  id previewProvider;
  _UITextHighlightBackgroundView *v12;
  _UITextHighlightBackgroundView *backgroundView;
  uint64_t v14;
  CAShapeLayer *contentClippingMaskLayer;
  uint64_t v16;
  UIColor *fillColor;
  UIVisualEffectView *v18;
  void *v19;
  uint64_t v20;
  UIVisualEffectView *contentClippingEffectView;
  CAShapeLayer *v22;
  void *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UITextHighlightView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[UIView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  if (v9)
  {
    v10 = _Block_copy(v4);
    previewProvider = v9->_previewProvider;
    v9->_previewProvider = v10;

    v12 = -[_UITextHighlightBackgroundView initWithFrame:]([_UITextHighlightBackgroundView alloc], "initWithFrame:", v5, v6, v7, v8);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = v12;

    -[UIView addSubview:](v9, "addSubview:", v9->_backgroundView);
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v14 = objc_claimAutoreleasedReturnValue();
    contentClippingMaskLayer = v9->_contentClippingMaskLayer;
    v9->_contentClippingMaskLayer = (CAShapeLayer *)v14;

    _UIGetTextHighlightFillColor();
    v16 = objc_claimAutoreleasedReturnValue();
    fillColor = v9->_fillColor;
    v9->_fillColor = (UIColor *)v16;

    v18 = [UIVisualEffectView alloc];
    -[UITextHighlightView _fillEffect](v9, "_fillEffect");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[UIVisualEffectView initWithEffect:](v18, "initWithEffect:", v19);
    contentClippingEffectView = v9->_contentClippingEffectView;
    v9->_contentClippingEffectView = (UIVisualEffectView *)v20;

    -[UIView setClipsToBounds:](v9->_contentClippingEffectView, "setClipsToBounds:", 1);
    v22 = v9->_contentClippingMaskLayer;
    -[UIView layer](v9->_contentClippingEffectView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setMask:", v22);

    -[UIView addSubview:](v9, "addSubview:", v9->_contentClippingEffectView);
  }

  return v9;
}

- (id)_fillEffect
{
  void *v2;
  void *v3;

  -[UITextHighlightView fillColor](self, "fillColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColorEffect colorEffectMonochromeTint:blendingAmount:brightnessAdjustment:](UIColorEffect, "colorEffectMonochromeTint:blendingAmount:brightnessAdjustment:", v2, 1.0, 0.25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFillColor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id obj;

  v4 = a3;
  if (!v4)
  {
    _UIGetTextHighlightFillColor();
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  obj = v4;
  if (!-[UIColor isEqual:](self->_fillColor, "isEqual:", v4))
  {
    objc_storeStrong((id *)&self->_fillColor, obj);
    v5 = objc_msgSend(objc_retainAutorelease(obj), "CGColor");
    -[_UITextHighlightBackgroundView highlightLayer](self->_backgroundView, "highlightLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFillColor:", v5);

    -[UITextHighlightView _fillEffect](self, "_fillEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_contentClippingEffectView, "setEffect:", v7);

  }
}

- (void)animateWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  CGAffineTransform v9;
  CGAffineTransform v10;

  v4 = a3;
  -[UIView setAlpha:](self, "setAlpha:", 1.0);
  CGAffineTransformMakeScale(&v10, 1.2, 1.2);
  v9 = v10;
  -[UIView setTransform:](self, "setTransform:", &v9);
  v7 = v4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__UITextHighlightView_animateWithCompletion___block_invoke;
  v8[3] = &unk_1E16B1B28;
  v8[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__UITextHighlightView_animateWithCompletion___block_invoke_2;
  v6[3] = &unk_1E16B1BA0;
  v5 = v4;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2048, v8, v6, 0.15, 0.0);

}

uint64_t __45__UITextHighlightView_animateWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __45__UITextHighlightView_animateWithCompletion___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fadeAwayWithCompletion:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];

  v6 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__UITextHighlightView_fadeAwayWithCompletion___block_invoke;
  v7[3] = &unk_1E16B1B28;
  v7[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__UITextHighlightView_fadeAwayWithCompletion___block_invoke_2;
  v5[3] = &unk_1E16B1BA0;
  v4 = v6;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v7, v5, 0.2, 0.3);

}

uint64_t __46__UITextHighlightView_fadeAwayWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __46__UITextHighlightView_fadeAwayWithCompletion___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updateWithPreviewParameters:(id)a3
{
  UIEdgeInsets *p_padding;
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  p_padding = &self->_padding;
  v5 = a3;
  objc_msgSend(v5, "_textPathInsets");
  p_padding->top = v6;
  p_padding->left = v7;
  p_padding->bottom = v8;
  p_padding->right = v9;
  objc_msgSend(v5, "visiblePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v11, "bounds");
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, -v12, -v13);
  v15 = v16;
  objc_msgSend(v11, "applyTransform:", &v15);
  -[_UITextHighlightBackgroundView setVisiblePath:](self->_backgroundView, "setVisiblePath:", v11);
  v14 = objc_retainAutorelease(v11);
  -[CAShapeLayer setPath:](self->_contentClippingMaskLayer, "setPath:", objc_msgSend(v14, "CGPath"));

}

- (void)setOverriddenPreviewParameters:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[UIPreviewParameters isEqual:](self->_overriddenPreviewParameters, "isEqual:"))
  {
    -[UITextHighlightView invalidateContentView](self, "invalidateContentView");
    objc_storeStrong((id *)&self->_overriddenPreviewParameters, a3);
    -[UITextHighlightView _updateWithPreviewParameters:](self, "_updateWithPreviewParameters:", v5);
  }

}

- (void)invalidateContentView
{
  self->_contentViewValid = 0;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *contentView;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[9];
  _QWORD v30[5];
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)UITextHighlightView;
  -[UIView layoutSubviews](&v31, sel_layoutSubviews);
  v3 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __37__UITextHighlightView_layoutSubviews__block_invoke;
  v30[3] = &unk_1E16B1B28;
  v30[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v30);
  if (!self->_contentViewValid)
  {
    (*((void (**)(void))self->_previewProvider + 2))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      if (!self->_overriddenPreviewParameters)
      {
        objc_msgSend(v4, "parameters");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITextHighlightView _updateWithPreviewParameters:](self, "_updateWithPreviewParameters:", v6);

      }
      -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
      objc_msgSend(v5, "view");
      v7 = (UIView *)objc_claimAutoreleasedReturnValue();
      contentView = self->_contentView;
      self->_contentView = v7;

      -[UIVisualEffectView contentView](self->_contentClippingEffectView, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", self->_contentView);
      objc_msgSend(v5, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "frame");
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;
      objc_msgSend(v5, "target");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "container");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "convertRect:fromView:", v20, v12, v14, v16, v18);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      v29[0] = v3;
      v29[1] = 3221225472;
      v29[2] = __37__UITextHighlightView_layoutSubviews__block_invoke_2;
      v29[3] = &unk_1E16B20D8;
      v29[4] = self;
      v29[5] = v22;
      v29[6] = v24;
      v29[7] = v26;
      v29[8] = v28;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v29);
    }
    else
    {
      -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
      v9 = self->_contentView;
      self->_contentView = 0;
    }

    self->_contentViewValid = 1;
  }
}

uint64_t __37__UITextHighlightView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setFrame:");
}

uint64_t __37__UITextHighlightView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)previewProvider
{
  return self->_previewProvider;
}

- (UIPreviewParameters)overriddenPreviewParameters
{
  return self->_overriddenPreviewParameters;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong(&self->_previewProvider, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_contentClippingMaskLayer, 0);
  objc_storeStrong((id *)&self->_contentClippingEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_overriddenPreviewParameters, 0);
}

@end
