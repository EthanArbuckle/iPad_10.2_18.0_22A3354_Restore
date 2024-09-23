@implementation PGProgressIndicator

- (PGProgressIndicator)initWithFrame:(CGRect)a3
{
  PGProgressIndicator *v3;
  PGProgressIndicator *v4;
  PGVibrantFillView *v5;
  uint64_t v6;
  PGVibrantFillView *completeTrack;
  PGVibrantFillView *v8;
  PGVibrantFillView *v9;
  void *v10;
  void *v11;
  PGVibrantFillView *v12;
  uint64_t v13;
  PGVibrantFillView *elapsedTrack;
  PGVibrantFillView *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PGProgressIndicator;
  v3 = -[PGMaterialView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PGProgressIndicator setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = [PGVibrantFillView alloc];
    -[PGProgressIndicator bounds](v4, "bounds");
    v6 = -[PGVibrantFillView initWithFrame:](v5, "initWithFrame:");
    completeTrack = v4->_completeTrack;
    v4->_completeTrack = (PGVibrantFillView *)v6;

    v8 = v4->_completeTrack;
    -[PGProgressIndicator bounds](v4, "bounds");
    -[PGVibrantFillView setFrame:](v8, "setFrame:");
    v9 = v4->_completeTrack;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGVibrantFillView setTintColor:](v9, "setTintColor:", v10);

    -[PGMaterialView contentView](v4, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v4->_completeTrack);

    v12 = [PGVibrantFillView alloc];
    -[PGProgressIndicator bounds](v4, "bounds");
    v13 = -[PGVibrantFillView initWithFrame:](v12, "initWithFrame:");
    elapsedTrack = v4->_elapsedTrack;
    v4->_elapsedTrack = (PGVibrantFillView *)v13;

    v15 = v4->_elapsedTrack;
    -[PGProgressIndicator bounds](v4, "bounds");
    -[PGVibrantFillView setFrame:](v15, "setFrame:");
    -[PGMaterialView contentView](v4, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", v4->_elapsedTrack);

    -[PGProgressIndicator _updateElapsedTrackTintColor](v4, "_updateElapsedTrackTintColor");
  }
  return v4;
}

- (void)setCustomElapsedTrackTintColor:(id)a3
{
  UIColor *v4;
  UIColor *customElapsedTrackTintColor;
  char v6;
  UIColor *v7;
  UIColor *v8;
  UIColor *v9;

  v4 = (UIColor *)a3;
  customElapsedTrackTintColor = self->_customElapsedTrackTintColor;
  if (customElapsedTrackTintColor != v4)
  {
    v9 = v4;
    v6 = -[UIColor isEqual:](customElapsedTrackTintColor, "isEqual:", v4);
    v4 = v9;
    if ((v6 & 1) == 0)
    {
      v7 = (UIColor *)-[UIColor copy](v9, "copy");
      v8 = self->_customElapsedTrackTintColor;
      self->_customElapsedTrackTintColor = v7;

      -[PGProgressIndicator _updateElapsedTrackTintColor](self, "_updateElapsedTrackTintColor");
      v4 = v9;
    }
  }

}

- (void)setProgress:(double)a3
{
  int IsValid;
  double v6;
  double v7;

  IsValid = CGFloatIsValid();
  v6 = 0.0;
  v7 = fmin(fmax(a3, 0.0), 1.0);
  if (IsValid)
    v6 = v7;
  if (self->_progress != v6)
  {
    self->_progress = v6;
    -[PGProgressIndicator _performLayout](self, "_performLayout");
  }
}

- (void)setIncludesWaitingToPlayIndicator:(BOOL)a3
{
  self->_includesWaitingToPlayIndicator = a3;
  -[PGProgressIndicator _updatePulseAnimatorIfNeeded](self, "_updatePulseAnimatorIfNeeded");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PGProgressIndicator;
  -[PGProgressIndicator setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PGProgressIndicator _performLayout](self, "_performLayout");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGProgressIndicator;
  -[PGMaterialView layoutSubviews](&v3, sel_layoutSubviews);
  -[PGProgressIndicator _performLayout](self, "_performLayout");
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)_setCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGProgressIndicator;
  -[PGMaterialView _setCornerRadius:](&v5, sel__setCornerRadius_);
  -[PGVibrantFillView _setCornerRadius:](self->_completeTrack, "_setCornerRadius:", a3);
  -[PGVibrantFillView _setCornerRadius:](self->_elapsedTrack, "_setCornerRadius:", a3);
}

- (void)_performLayout
{
  PGVibrantFillView *completeTrack;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;

  completeTrack = self->_completeTrack;
  -[PGMaterialView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[PGVibrantFillView setFrame:](completeTrack, "setFrame:");

  -[PGMaterialView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PGProgressIndicator progress](self, "progress");
  UIRoundToViewScale();
  -[PGVibrantFillView setFrame:](self->_elapsedTrack, "setFrame:", v7, v9, v12, v11);
  -[PGProgressIndicator bounds](self, "bounds");
  -[PGProgressIndicator _setCornerRadius:](self, "_setCornerRadius:", CGRectGetHeight(v13) * 0.5);
}

- (void)_updateElapsedTrackTintColor
{
  PGVibrantFillView *elapsedTrack;
  uint64_t v3;
  void *v4;
  id v5;

  elapsedTrack = self->_elapsedTrack;
  -[PGProgressIndicator customElapsedTrackTintColor](self, "customElapsedTrackTintColor");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
  {
    -[PGVibrantFillView setTintColor:](elapsedTrack, "setTintColor:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.35);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGVibrantFillView setTintColor:](elapsedTrack, "setTintColor:", v4);

  }
}

- (void)_updatePulseAnimatorIfNeeded
{
  _BOOL4 v3;
  int64_t pulseState;
  uint64_t v5;
  char v6;

  v3 = -[PGProgressIndicator includesWaitingToPlayIndicator](self, "includesWaitingToPlayIndicator");
  pulseState = self->_pulseState;
  if (v3 && !pulseState)
  {
    v5 = 1;
LABEL_9:
    -[PGProgressIndicator _transitionToPulseStateIfNeeded:](self, "_transitionToPulseStateIfNeeded:", v5);
    return;
  }
  if (pulseState)
    v6 = v3;
  else
    v6 = 1;
  if ((v6 & 1) == 0)
  {
    v5 = 0;
    goto LABEL_9;
  }
}

- (void)_transitionToPulseStateIfNeeded:(int64_t)a3
{
  UIViewPropertyAnimator **p_pulseAnimator;
  id WeakRetained;
  double v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12[2];
  id location;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if (self->_pulseState != a3)
  {
    self->_pulseState = a3;
    p_pulseAnimator = &self->_pulseAnimator;
    WeakRetained = objc_loadWeakRetained((id *)&self->_pulseAnimator);
    if (objc_msgSend(WeakRetained, "isRunning")
      && objc_msgSend(WeakRetained, "isInterruptible"))
    {
      objc_msgSend(WeakRetained, "stopAnimation:", 0);
      objc_msgSend(WeakRetained, "finishAnimationAtPosition:", 2);
    }
    if (a3)
      v7 = 1.0;
    else
      v7 = 0.2;
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v8 = objc_alloc(MEMORY[0x1E0CEABC8]);
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __55__PGProgressIndicator__transitionToPulseStateIfNeeded___block_invoke;
    v14[3] = &unk_1E622F8C0;
    v14[4] = self;
    v20 = (id)objc_msgSend(v8, "initWithDuration:curve:animations:", 3, v14, v7);
    objc_initWeak(&location, self);
    v10 = (void *)v16[5];
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __55__PGProgressIndicator__transitionToPulseStateIfNeeded___block_invoke_2;
    v11[3] = &unk_1E622FB40;
    objc_copyWeak(v12, &location);
    v11[4] = &v15;
    v12[1] = (id)a3;
    objc_msgSend(v10, "addCompletion:", v11);
    objc_storeWeak((id *)p_pulseAnimator, (id)v16[5]);
    objc_msgSend((id)v16[5], "startAnimation");
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v15, 8);

  }
}

uint64_t __55__PGProgressIndicator__transitionToPulseStateIfNeeded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyPulseState");
}

void __55__PGProgressIndicator__transitionToPulseStateIfNeeded___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  id v5;
  id *v6;
  id v7;
  int v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id *v14;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v14 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v6 = WeakRetained + 57;
    v7 = objc_loadWeakRetained(WeakRetained + 57);
    if (a2 || v5 != v7)
    {

    }
    else
    {
      v8 = objc_msgSend(v14, "includesWaitingToPlayIndicator");

      if (v8)
      {
        objc_storeWeak(v6, 0);
        v9 = *(_QWORD *)(a1 + 48);
        if (v9 == 2)
        {
          v10 = v14;
          v11 = 1;
          goto LABEL_10;
        }
        if (v9 == 1)
        {
          v10 = v14;
          v11 = 2;
LABEL_10:
          objc_msgSend(v10, "_transitionToPulseStateIfNeeded:", v11);
        }
      }
    }
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;

}

- (void)_applyPulseState
{
  double Width;
  double v4;
  double v5;
  int64_t pulseState;
  PGVibrantFillView *v7;
  void *v8;
  PGVibrantFillView *elapsedTrack;
  void *v10;
  PGVibrantFillView *v11;
  void *v12;
  void *v13;
  PGVibrantFillView *v14;
  void *v15;
  __int128 v16;
  CGAffineTransform *v17;
  void *v18;
  PGVibrantFillView *completeTrack;
  void *v20;
  void *v21;
  PGVibrantFillView *v22;
  void *v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  _OWORD v26[3];
  CGRect v27;

  -[PGProgressIndicator frame](self, "frame");
  Width = CGRectGetWidth(v27);
  v4 = 1.0;
  v5 = 1.0;
  if (Width > 10.0)
  {
    v5 = (Width + -1.5) / Width;
    v4 = (Width + 1.5) / Width;
  }
  pulseState = self->_pulseState;
  if (pulseState == 2)
  {
    elapsedTrack = self->_elapsedTrack;
    -[PGProgressIndicator customElapsedTrackTintColor](self, "customElapsedTrackTintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[PGVibrantFillView setTintColor:](elapsedTrack, "setTintColor:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.45);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGVibrantFillView setTintColor:](elapsedTrack, "setTintColor:", v18);

    }
    completeTrack = self->_completeTrack;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.375);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGVibrantFillView setTintColor:](completeTrack, "setTintColor:", v20);

    CGAffineTransformMakeScale(&v24, v4, v4);
    v17 = &v24;
  }
  else if (pulseState == 1)
  {
    v11 = self->_elapsedTrack;
    -[PGProgressIndicator customElapsedTrackTintColor](self, "customElapsedTrackTintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[PGVibrantFillView setTintColor:](v11, "setTintColor:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGVibrantFillView setTintColor:](v11, "setTintColor:", v21);

    }
    v22 = self->_completeTrack;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.05);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGVibrantFillView setTintColor:](v22, "setTintColor:", v23);

    CGAffineTransformMakeScale(&v25, v5, v5);
    v17 = &v25;
  }
  else
  {
    if (pulseState)
      return;
    v7 = self->_elapsedTrack;
    -[PGProgressIndicator customElapsedTrackTintColor](self, "customElapsedTrackTintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PGVibrantFillView setTintColor:](v7, "setTintColor:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.35);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGVibrantFillView setTintColor:](v7, "setTintColor:", v13);

    }
    v14 = self->_completeTrack;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGVibrantFillView setTintColor:](v14, "setTintColor:", v15);

    v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v26[0] = *MEMORY[0x1E0C9BAA8];
    v26[1] = v16;
    v26[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v17 = (CGAffineTransform *)v26;
  }
  -[PGProgressIndicator setTransform:](self, "setTransform:", v17);
}

- (double)progress
{
  return self->_progress;
}

- (UIColor)customElapsedTrackTintColor
{
  return self->_customElapsedTrackTintColor;
}

- (BOOL)includesWaitingToPlayIndicator
{
  return self->_includesWaitingToPlayIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customElapsedTrackTintColor, 0);
  objc_destroyWeak((id *)&self->_pulseAnimator);
  objc_storeStrong((id *)&self->_completeTrack, 0);
  objc_storeStrong((id *)&self->_elapsedTrack, 0);
}

@end
