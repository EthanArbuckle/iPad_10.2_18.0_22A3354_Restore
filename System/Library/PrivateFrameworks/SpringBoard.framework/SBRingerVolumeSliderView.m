@implementation SBRingerVolumeSliderView

- (SBRingerVolumeSliderView)initWithFrame:(CGRect)a3
{
  SBRingerVolumeSliderView *v3;
  SBRingerVolumeSliderView *v4;
  UIView *v5;
  UIView *backgroundView;
  UIView *v7;
  UIView *fillView;
  UIViewFloatAnimatableProperty *v9;
  UIViewFloatAnimatableProperty *valueSpring;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)SBRingerVolumeSliderView;
  v3 = -[SBRingerVolumeSliderView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SBRingerVolumeSliderView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v5;

    -[UIView setClipsToBounds:](v4->_backgroundView, "setClipsToBounds:", 1);
    -[SBRingerVolumeSliderView addSubview:](v4, "addSubview:", v4->_backgroundView);
    v7 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    fillView = v4->_fillView;
    v4->_fillView = v7;

    -[UIView addSubview:](v4->_backgroundView, "addSubview:", v4->_fillView);
    v4->_style = -1;
    -[SBRingerVolumeSliderView setStyle:](v4, "setStyle:", 0);
    v4->_layoutAxis = 0;
    v4->_roundedStyle = 0;
    v9 = (UIViewFloatAnimatableProperty *)objc_alloc_init(MEMORY[0x1E0CEABC0]);
    valueSpring = v4->_valueSpring;
    v4->_valueSpring = v9;

    objc_initWeak(&location, v4);
    v11 = (void *)MEMORY[0x1E0CEABB0];
    v18[0] = v4->_valueSpring;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42__SBRingerVolumeSliderView_initWithFrame___block_invoke;
    v14[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v11, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v12, v14);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __42__SBRingerVolumeSliderView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setNeedsLayout");
    objc_msgSend(v2, "layoutIfNeeded");
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[UIViewFloatAnimatableProperty invalidate](self->_valueSpring, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBRingerVolumeSliderView;
  -[SBRingerVolumeSliderView dealloc](&v3, sel_dealloc);
}

- (void)setStyle:(unint64_t)a3
{
  UIView *backgroundView;
  void *v5;
  UIView *fillView;
  void *v7;
  id v8;

  if (self->_style != a3)
  {
    self->_style = a3;
    backgroundView = self->_backgroundView;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](backgroundView, "setBackgroundColor:", v5);

      fillView = self->_fillView;
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](backgroundView, "setBackgroundColor:", v7);

      fillView = self->_fillView;
      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    }
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](fillView, "setBackgroundColor:");

  }
}

- (void)setLayoutAxis:(int64_t)a3
{
  if (self->_layoutAxis != a3)
  {
    self->_layoutAxis = a3;
    -[SBRingerVolumeSliderView setNeedsLayout](self, "setNeedsLayout");
    -[SBRingerVolumeSliderView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setValue:(double)a3
{
  -[SBRingerVolumeSliderView setValue:animated:](self, "setValue:animated:", 0, a3);
}

- (void)setValue:(double)a3 animated:(BOOL)a4
{
  _QWORD v4[6];
  _QWORD v5[6];

  if (self->_value != a3)
  {
    self->_value = a3;
    if (a4)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __46__SBRingerVolumeSliderView_setValue_animated___block_invoke;
      v5[3] = &unk_1E8E9DE88;
      v5[4] = self;
      *(double *)&v5[5] = a3;
      objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v5, 0, 281.84, 33.58);
    }
    else
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __46__SBRingerVolumeSliderView_setValue_animated___block_invoke_2;
      v4[3] = &unk_1E8E9DE88;
      v4[4] = self;
      *(double *)&v4[5] = a3;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v4);
    }
  }
}

uint64_t __46__SBRingerVolumeSliderView_setValue_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setValue:", *(double *)(a1 + 40));
}

uint64_t __46__SBRingerVolumeSliderView_setValue_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setValue:", *(double *)(a1 + 40));
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
  double v12;
  double v13;
  double v14;
  int64_t v15;
  int64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __int128 v37;

  -[SBRingerVolumeSliderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIViewFloatAnimatableProperty presentationValue](self->_valueSpring, "presentationValue");
  v12 = v11;
  v37 = 0u;
  BYTE8(v37) = 1;
  BSUIConstrainValueToIntervalWithRubberBand();
  v14 = v13;
  if (v13 >= 0.0)
  {
    v14 = 0.0;
    if (v13 > 1.0)
      v14 = v13 + -1.0;
  }
  v15 = -[SBRingerVolumeSliderView layoutAxis](self, "layoutAxis", v37, 0x3FF0000000000000, 1);
  v16 = v15;
  v17 = v8 + fabs(v8 * v14 * 0.5 / 3.0);
  v18 = fabs(v10 * v14 * 4.0 / 3.0);
  v19 = -0.0;
  if (v14 < 0.0)
    v19 = v8 * v14 * 0.5 / 3.0;
  v20 = v6 + v18 * 0.5;
  v21 = fabs(v8 * v14 * 4.0 / 3.0);
  v22 = v8 - v21;
  v23 = v21 * 0.5;
  v24 = fabs(v10 * v14 * 0.5 / 3.0);
  v25 = v24 * 0.5;
  if (v14 < 0.0)
  {
    v25 = v24;
    v24 = 0.0;
  }
  v26 = v6 - v24;
  v27 = v10 + v25;
  if (v15 == 1)
    v28 = v22;
  else
    v28 = v10 - v18;
  if (v15 == 1)
    v29 = v27;
  else
    v29 = v10 - v18;
  if (v15 == 1)
    v30 = v22;
  else
    v30 = v17;
  if (v15 == 1)
    v20 = v26;
  else
    v23 = v19;
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v4 + v23, v20, v30, v29, v22);
  -[UIView _setContinuousCornerRadius:](self->_backgroundView, "_setContinuousCornerRadius:", v28 * 0.5);
  if (-[SBRingerVolumeSliderView isRoundedStyle](self, "isRoundedStyle"))
    -[UIView _setContinuousCornerRadius:](self->_fillView, "_setContinuousCornerRadius:", v28 * 0.5);
  v31 = fmin(fmax(v12, 0.0625), 1.0);
  v32 = v30 * v31;
  v33 = 0.0;
  v34 = v29 - v31 * v29;
  v35 = v29 * v31;
  if (v16 == 1)
  {
    v33 = v34;
    v32 = v30;
    v36 = v35;
  }
  else
  {
    v36 = v29;
  }
  -[UIView setFrame:](self->_fillView, "setFrame:", 0.0, v33, v32, v36);
}

- (unint64_t)style
{
  return self->_style;
}

- (int64_t)layoutAxis
{
  return self->_layoutAxis;
}

- (BOOL)isRoundedStyle
{
  return self->_roundedStyle;
}

- (void)setRoundedStyle:(BOOL)a3
{
  self->_roundedStyle = a3;
}

- (double)value
{
  return self->_value;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)fillView
{
  return self->_fillView;
}

- (void)setFillView:(id)a3
{
  objc_storeStrong((id *)&self->_fillView, a3);
}

- (UIViewFloatAnimatableProperty)valueSpring
{
  return self->_valueSpring;
}

- (void)setValueSpring:(id)a3
{
  objc_storeStrong((id *)&self->_valueSpring, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSpring, 0);
  objc_storeStrong((id *)&self->_fillView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
