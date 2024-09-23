@implementation _UIBlendingHighlightView

+ (BOOL)isBorderView
{
  return 0;
}

- (_UIBlendingHighlightView)initWithTopLevelFilters:(id)a3 compositingColors:(id)a4 compositingFilterModes:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _UIBlendingHighlightView *v13;
  _UIBlendingHighlightView *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableArray *blendingViews;
  unint64_t v19;
  void *v20;
  void *v21;
  UIView *v22;
  UIView *v23;
  void *v24;
  void *v25;
  void *v27;
  objc_super v28;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v10, "count");
  if (v12 != objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIBlendingHighlightView.m"), 30, CFSTR("Invalid parameter.  Blending colors/modes must have same number of items"));

  }
  v28.receiver = self;
  v28.super_class = (Class)_UIBlendingHighlightView;
  v13 = -[UIView initWithFrame:](&v28, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v14 = v13;
  if (v13)
  {
    -[UIView layer](v13, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsGroupBlending:", 0);

    -[UIView setDirectionalLayoutMargins:](v14, "setDirectionalLayoutMargins:", 0.0, 0.0, 0.0, 0.0);
    if (objc_msgSend(v9, "count"))
    {
      -[UIView layer](v14, "layer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setFilters:", v9);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = objc_claimAutoreleasedReturnValue();
    blendingViews = v14->_blendingViews;
    v14->_blendingViews = (NSMutableArray *)v17;

    if (objc_msgSend(v10, "count"))
    {
      v19 = 0;
      do
      {
        objc_msgSend(v10, "objectAtIndexedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndexedSubscript:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = [UIView alloc];
        -[UIView bounds](v14, "bounds");
        v23 = -[UIView initWithFrame:](v22, "initWithFrame:");
        -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        if (objc_msgSend((id)objc_opt_class(), "isBorderView"))
        {
          -[UIView layer](v23, "layer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setBorderColor:", objc_msgSend(objc_retainAutorelease(v20), "CGColor"));

        }
        else
        {
          -[UIView setBackgroundColor:](v23, "setBackgroundColor:", v20);
        }
        -[UIView layer](v23, "layer");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setCompositingFilter:", v21);

        -[NSMutableArray addObject:](v14->_blendingViews, "addObject:", v23);
        -[UIView addSubview:](v14, "addSubview:", v23);

        ++v19;
      }
      while (v19 < objc_msgSend(v10, "count"));
    }
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }

  return v14;
}

- (_UIBlendingHighlightView)initWithCompositingBurnColor:(id)a3 plusDColor:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _UIBlendingHighlightView *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v15[0] = a3;
  v15[1] = a4;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CD2E98];
  v14[0] = *MEMORY[0x1E0CD2BC0];
  v14[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[_UIBlendingHighlightView initWithTopLevelFilters:compositingColors:compositingFilterModes:](self, "initWithTopLevelFilters:compositingColors:compositingFilterModes:", MEMORY[0x1E0C9AA60], v9, v11);
  return v12;
}

- (UIEdgeInsets)_effectiveNonDirectionalContentInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  -[UIView directionalLayoutMargins](self, "directionalLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "layoutDirection");

  if (v12 == 1)
    v13 = v6;
  else
    v13 = v10;
  if (v12 == 1)
    v14 = v10;
  else
    v14 = v6;
  v15 = v4;
  v16 = v8;
  result.right = v13;
  result.bottom = v16;
  result.left = v14;
  result.top = v15;
  return result;
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
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[5];
  _QWORD v17[8];
  objc_super v18;

  -[_UIBlendingHighlightView _effectiveNonDirectionalContentInsets](self, "_effectiveNonDirectionalContentInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v18.receiver = self;
  v18.super_class = (Class)_UIBlendingHighlightView;
  -[UIView layoutSubviews](&v18, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __42___UIBlendingHighlightView_layoutSubviews__block_invoke;
  v17[3] = &__block_descriptor_64_e16_v16__0__UIView_8l;
  *(double *)&v17[4] = v6 + v12;
  *(double *)&v17[5] = v4 + v13;
  *(double *)&v17[6] = v14 - (v6 + v10);
  *(double *)&v17[7] = v15 - (v4 + v8);
  -[_UIBlendingHighlightView _enumerateAllBlendingViewsWithBlock:](self, "_enumerateAllBlendingViewsWithBlock:", v17);
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __42___UIBlendingHighlightView_layoutSubviews__block_invoke_2;
  v16[3] = &unk_1E16EC400;
  v16[4] = self;
  -[_UIBlendingHighlightView _enumerateBlendingBorderViewsWithBlock:](self, "_enumerateBlendingBorderViewsWithBlock:", v16);
}

+ (id)_blendingSeparatorView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)objc_opt_class());
  +[UIColor _vibrantLightDividerBurnColor](UIColor, "_vibrantLightDividerBurnColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor _vibrantLightDividerDarkeningColor](UIColor, "_vibrantLightDividerDarkeningColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithCompositingBurnColor:plusDColor:", v3, v4);

  return v5;
}

+ (id)_blendingPressedView
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc((Class)objc_opt_class());
  +[UIColor _vibrantLightFillBurnColor](UIColor, "_vibrantLightFillBurnColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIColor _vibrantLightFillDarkeningColor](UIColor, "_vibrantLightFillDarkeningColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithCompositingBurnColor:plusDColor:", v3, v4);

  return v5;
}

- (void)setCornerRadius:(double)a3
{
  void *v5;
  _QWORD v6[5];

  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCornerRadius:", a3);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44___UIBlendingHighlightView_setCornerRadius___block_invoke;
  v6[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
  *(double *)&v6[4] = a3;
  -[_UIBlendingHighlightView _enumerateAllBlendingViewsWithBlock:](self, "_enumerateAllBlendingViewsWithBlock:", v6);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBlendingHighlightView;
  -[UIView _setContinuousCornerRadius:](&v6, sel__setContinuousCornerRadius_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55___UIBlendingHighlightView__setContinuousCornerRadius___block_invoke;
  v5[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
  *(double *)&v5[4] = a3;
  -[_UIBlendingHighlightView _enumerateAllBlendingViewsWithBlock:](self, "_enumerateAllBlendingViewsWithBlock:", v5);
}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  void *v5;
  _QWORD v6[5];

  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaskedCorners:", a3);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53___UIBlendingHighlightView_setRoundedCornerPosition___block_invoke;
  v6[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
  v6[4] = a3;
  -[_UIBlendingHighlightView _enumerateAllBlendingViewsWithBlock:](self, "_enumerateAllBlendingViewsWithBlock:", v6);
}

- (void)setHighlighted:(BOOL)a3
{
  -[UIView setHidden:](self, "setHidden:", !a3);
}

- (void)_enumerateBlendingBorderViewsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  if (objc_msgSend((id)objc_opt_class(), "isBorderView"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = self->_blendingViews;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

- (void)_enumerateAllBlendingViewsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_blendingViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingViews, 0);
}

@end
