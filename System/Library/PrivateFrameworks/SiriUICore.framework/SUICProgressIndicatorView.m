@implementation SUICProgressIndicatorView

- (SUICProgressIndicatorView)initWithFrame:(CGRect)a3
{
  SUICProgressIndicatorView *v3;
  _SUICRingLayer *v4;
  _SUICRingLayer *shadowRingLayer;
  _SUICRingLayer *v6;
  void *v7;
  void *v8;
  _SUICProgressRingLayer *v9;
  _SUICProgressRingLayer *progressRingLayer;
  _SUICProgressRingLayer *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UIImageView *actionArrowImageView;
  LAUICheckmarkLayer *v19;
  LAUICheckmarkLayer *checkmarkLayer;
  LAUICheckmarkLayer *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)SUICProgressIndicatorView;
  v3 = -[SUICProgressIndicatorView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_SUICRingLayer);
    shadowRingLayer = v3->_shadowRingLayer;
    v3->_shadowRingLayer = v4;

    v6 = v3->_shadowRingLayer;
    -[SUICProgressIndicatorView traitCollection](v3, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "darkGrayColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUICRingLayer setRingColor:](v6, "setRingColor:", v8);

    v9 = objc_alloc_init(_SUICProgressRingLayer);
    progressRingLayer = v3->_progressRingLayer;
    v3->_progressRingLayer = v9;

    v11 = v3->_progressRingLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SUICRingLayer setRingColor:](v11, "setRingColor:", v12);

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("arrow.right"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageWithTintColor:renderingMode:", v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v16);
    actionArrowImageView = v3->_actionArrowImageView;
    v3->_actionArrowImageView = (UIImageView *)v17;

    -[UIImageView setContentMode:](v3->_actionArrowImageView, "setContentMode:", 1);
    v19 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E0D44440]);
    checkmarkLayer = v3->_checkmarkLayer;
    v3->_checkmarkLayer = v19;

    v21 = v3->_checkmarkLayer;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LAUICheckmarkLayer setPrimaryColor:animated:](v21, "setPrimaryColor:animated:", v22, 0);

    -[SUICProgressIndicatorView layer](v3, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSublayer:", v3->_shadowRingLayer);

    -[SUICProgressIndicatorView layer](v3, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSublayer:", v3->_progressRingLayer);

    -[SUICProgressIndicatorView layer](v3, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addSublayer:", v3->_checkmarkLayer);

    -[SUICProgressIndicatorView addSubview:](v3, "addSubview:", v3->_actionArrowImageView);
    -[SUICProgressIndicatorView setArrowVisible:](v3, "setArrowVisible:", 1);
    -[SUICProgressIndicatorView setProgressValue:](v3, "setProgressValue:", 1.0);
    -[SUICProgressIndicatorView setCheckmarkVisible:](v3, "setCheckmarkVisible:", 0);
    -[SUICProgressIndicatorView setSpinning:](v3, "setSpinning:", 0);
    -[SUICProgressIndicatorView setDarkened:](v3, "setDarkened:", 0);

  }
  return v3;
}

- (void)layoutSubviews
{
  UIImageView *actionArrowImageView;
  objc_super v4;
  CGRect v5;

  v4.receiver = self;
  v4.super_class = (Class)SUICProgressIndicatorView;
  -[SUICProgressIndicatorView layoutSubviews](&v4, sel_layoutSubviews);
  -[SUICProgressIndicatorView bounds](self, "bounds");
  CGRectGetWidth(v5);
  actionArrowImageView = self->_actionArrowImageView;
  -[SUICProgressIndicatorView bounds](self, "bounds");
  UIRectCenteredIntegralRect();
  -[UIImageView setFrame:](actionArrowImageView, "setFrame:");
}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  LAUICheckmarkLayer *checkmarkLayer;
  CGFloat v14;
  CGFloat v15;
  _SUICProgressRingLayer *progressRingLayer;
  _SUICRingLayer *shadowRingLayer;
  objc_super v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v18.receiver = self;
  v18.super_class = (Class)SUICProgressIndicatorView;
  v4 = a3;
  -[SUICProgressIndicatorView layoutSublayersOfLayer:](&v18, sel_layoutSublayersOfLayer_, v4);
  objc_msgSend(v4, "bounds", v18.receiver, v18.super_class);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  checkmarkLayer = self->_checkmarkLayer;
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  v14 = CGRectGetWidth(v19) * 0.25;
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  v15 = CGRectGetHeight(v20) * 0.25;
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  v22 = CGRectInset(v21, v14, v15);
  -[LAUICheckmarkLayer setFrame:](checkmarkLayer, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  progressRingLayer = self->_progressRingLayer;
  -[SUICProgressIndicatorView bounds](self, "bounds");
  -[_SUICRingLayer setFrame:](progressRingLayer, "setFrame:");
  shadowRingLayer = self->_shadowRingLayer;
  -[SUICProgressIndicatorView bounds](self, "bounds");
  -[_SUICRingLayer setFrame:](shadowRingLayer, "setFrame:");
}

- (void)setRingColor:(id)a3
{
  -[_SUICRingLayer setRingColor:](self->_progressRingLayer, "setRingColor:", a3);
}

- (void)setShadowColor:(id)a3
{
  -[_SUICRingLayer setRingColor:](self->_shadowRingLayer, "setRingColor:", a3);
}

- (void)setRingLineWidth:(double)a3
{
  -[_SUICRingLayer setCustomLineWidth:](self->_progressRingLayer, "setCustomLineWidth:", a3);
}

- (void)setShadowLineWidth:(double)a3
{
  -[_SUICRingLayer setCustomLineWidth:](self->_shadowRingLayer, "setCustomLineWidth:", a3);
}

- (double)progressValue
{
  double result;

  -[_SUICProgressRingLayer progress](self->_progressRingLayer, "progress");
  return result;
}

- (void)setProgressValue:(double)a3
{
  -[SUICProgressIndicatorView setProgressValue:animated:completion:](self, "setProgressValue:animated:completion:", 0, 0, a3);
}

- (void)setProgressValue:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[_SUICProgressRingLayer setProgress:animated:completion:](self->_progressRingLayer, "setProgress:animated:completion:", a4, a5, a3);
}

- (BOOL)isArrowVisible
{
  double v2;

  -[UIImageView alpha](self->_actionArrowImageView, "alpha");
  return v2 != 0.0;
}

- (void)setArrowVisible:(BOOL)a3
{
  -[SUICProgressIndicatorView setArrowVisible:delay:animated:completion:](self, "setArrowVisible:delay:animated:completion:", a3, 0, 0, 0.0);
}

- (void)setArrowVisible:(BOOL)a3 delay:(double)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  _BOOL4 v8;
  void (**v10)(id, uint64_t);
  void *v11;
  id *v12;
  dispatch_time_t v13;
  _QWORD v14[4];
  void (**v15)(id, uint64_t);
  id v16;
  BOOL v17;
  _QWORD v18[4];
  id v19;
  BOOL v20;
  id location;

  v6 = a5;
  v8 = a3;
  v10 = (void (**)(id, uint64_t))a6;
  if (-[SUICProgressIndicatorView isArrowVisible](self, "isArrowVisible") != v8)
  {
    objc_initWeak(&location, self->_actionArrowImageView);
    if (v6)
    {
      v11 = (void *)MEMORY[0x1E0DC3F10];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __71__SUICProgressIndicatorView_setArrowVisible_delay_animated_completion___block_invoke;
      v18[3] = &unk_1E4A55280;
      v12 = &v19;
      objc_copyWeak(&v19, &location);
      v20 = v8;
      objc_msgSend(v11, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v18, v10, 0.35, a4, 400.0, 1.0);
    }
    else
    {
      if (a4 == 0.0)
      {
        -[UIImageView setAlpha:](self->_actionArrowImageView, "setAlpha:", (double)v8);
        if (v10)
          v10[2](v10, 1);
        goto LABEL_11;
      }
      v13 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __71__SUICProgressIndicatorView_setArrowVisible_delay_animated_completion___block_invoke_2;
      v14[3] = &unk_1E4A552A8;
      v12 = &v16;
      objc_copyWeak(&v16, &location);
      v17 = v8;
      v15 = v10;
      dispatch_after(v13, MEMORY[0x1E0C80D38], v14);

    }
    objc_destroyWeak(v12);
LABEL_11:
    objc_destroyWeak(&location);
    goto LABEL_12;
  }
  if (v10)
    v10[2](v10, 1);
LABEL_12:

}

void __71__SUICProgressIndicatorView_setArrowVisible_delay_animated_completion___block_invoke(uint64_t a1)
{
  unint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LOBYTE(v2) = *(_BYTE *)(a1 + 40);
  objc_msgSend(WeakRetained, "setAlpha:", (double)v2);

}

void __71__SUICProgressIndicatorView_setArrowVisible_delay_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  unint64_t v3;
  uint64_t v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  LOBYTE(v3) = *(_BYTE *)(a1 + 48);
  v5 = WeakRetained;
  objc_msgSend(WeakRetained, "setAlpha:", (double)v3);
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);

}

- (BOOL)isSpinning
{
  return -[_SUICProgressRingLayer spinning](self->_progressRingLayer, "spinning");
}

- (void)setSpinning:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[_SUICProgressRingLayer spinning](self->_progressRingLayer, "spinning") != a3)
    -[_SUICProgressRingLayer setSpinning:](self->_progressRingLayer, "setSpinning:", v3);
}

- (BOOL)isCheckmarkVisible
{
  return -[LAUICheckmarkLayer isRevealed](self->_checkmarkLayer, "isRevealed");
}

- (void)setCheckmarkVisible:(BOOL)a3
{
  -[SUICProgressIndicatorView setCheckmarkVisible:animated:completion:](self, "setCheckmarkVisible:animated:completion:", a3, 0, 0);
}

- (void)setCheckmarkVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void (**v8)(id, uint64_t);

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  if (-[SUICProgressIndicatorView isCheckmarkVisible](self, "isCheckmarkVisible") == v6)
  {
    if (v8)
      v8[2](v8, 1);
  }
  else
  {
    -[LAUICheckmarkLayer setRevealed:animated:withCompletion:](self->_checkmarkLayer, "setRevealed:animated:withCompletion:", v6, v5, v8);
  }

}

- (BOOL)isDarkened
{
  id v3;
  CGColor *v4;

  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGColor *)objc_msgSend(v3, "CGColor");

  return CGColorEqualToColor((CGColorRef)-[_SUICProgressRingLayer fillColor](self->_progressRingLayer, "fillColor"), v4);
}

- (void)setDarkened:(BOOL)a3
{
  -[SUICProgressIndicatorView setDarkened:animated:completion:](self, "setDarkened:animated:completion:", a3, 0, 0);
}

- (void)setDarkened:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void (**v7)(id, uint64_t);
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12[2];
  id location;

  v5 = a3;
  v7 = (void (**)(id, uint64_t))a5;
  if (-[SUICProgressIndicatorView isDarkened](self, "isDarkened") == v5)
  {
    if (v7)
      v7[2](v7, 1);
  }
  else
  {
    if (v5)
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = (void *)objc_msgSend(v8, "CGColor");

    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x1E0DC3F10];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__SUICProgressIndicatorView_setDarkened_animated_completion___block_invoke;
    v11[3] = &unk_1E4A55238;
    objc_copyWeak(v12, &location);
    v12[1] = v9;
    objc_msgSend(v10, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v11, v7, 0.35, 0.0, 400.0, 1.0);
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }

}

void __61__SUICProgressIndicatorView_setDarkened_animated_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[53], "setFillColor:", *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionArrowImageView, 0);
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);
  objc_storeStrong((id *)&self->_progressRingLayer, 0);
  objc_storeStrong((id *)&self->_shadowRingLayer, 0);
}

@end
