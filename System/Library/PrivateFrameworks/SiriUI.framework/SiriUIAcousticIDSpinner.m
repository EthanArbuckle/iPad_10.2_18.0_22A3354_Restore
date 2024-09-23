@implementation SiriUIAcousticIDSpinner

- (SiriUIAcousticIDSpinner)initWithFrame:(CGRect)a3
{
  SiriUIAcousticIDSpinner *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIVisualEffectView *vibrancyView;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UIImageView *musicNoteView;
  void *v20;
  double v21;
  id v22;
  void *v23;
  uint64_t v24;
  UIImageView *spinnerView;
  void *v26;
  double v27;
  void *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)SiriUIAcousticIDSpinner;
  v3 = -[SiriUIAcousticIDSpinner initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDF6FC8]);
    v5 = (void *)MEMORY[0x24BDF6F88];
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectForBlurEffect:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "initWithEffect:", v7);
    vibrancyView = v3->_vibrancyView;
    v3->_vibrancyView = (UIVisualEffectView *)v8;

    -[UIVisualEffectView setAutoresizingMask:](v3->_vibrancyView, "setAutoresizingMask:", 18);
    -[UIVisualEffectView setUserInteractionEnabled:](v3->_vibrancyView, "setUserInteractionEnabled:", 0);
    -[SiriUIAcousticIDSpinner insertSubview:atIndex:](v3, "insertSubview:atIndex:", v3->_vibrancyView, 0);
    -[SiriUIAcousticIDSpinner layer](v3, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupBlending:", 0);

    v11 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(v11, "setAutoresizingMask:", 18);
    objc_msgSend(v11, "setUserInteractionEnabled:", 0);
    v12 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v13 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageNamed:inBundle:", CFSTR("MusicNote"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_flatImageWithColor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v12, "initWithImage:", v17);
    musicNoteView = v3->_musicNoteView;
    v3->_musicNoteView = (UIImageView *)v18;

    -[UIImageView setUserInteractionEnabled:](v3->_musicNoteView, "setUserInteractionEnabled:", 0);
    -[UIImageView layer](v3->_musicNoteView, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = 0;
    objc_msgSend(v20, "setOpacity:", v21);

    objc_msgSend(v11, "addSubview:", v3->_musicNoteView);
    v22 = objc_alloc(MEMORY[0x24BDF6AE8]);
    -[SiriUIAcousticIDSpinner _imageForSpinner](v3, "_imageForSpinner");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "initWithImage:", v23);
    spinnerView = v3->_spinnerView;
    v3->_spinnerView = (UIImageView *)v24;

    -[UIImageView setUserInteractionEnabled:](v3->_spinnerView, "setUserInteractionEnabled:", 0);
    -[UIImageView layer](v3->_spinnerView, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = 0;
    objc_msgSend(v26, "setOpacity:", v27);

    objc_msgSend(v11, "addSubview:", v3->_spinnerView);
    -[UIVisualEffectView contentView](v3->_vibrancyView, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v11);

  }
  return v3;
}

- (id)_spinningAnimation
{
  void *v2;
  float v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation.z"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAnimationDragCoefficient();
  objc_msgSend(v2, "setDuration:", v3);
  LODWORD(v4) = 2139095040;
  objc_msgSend(v2, "setRepeatCount:", v4);
  objc_msgSend(v2, "setFromValue:", &unk_24D7EF580);
  objc_msgSend(v2, "setToValue:", &unk_24D7EF590);
  return v2;
}

- (id)_imageForSpinner
{
  CGContext *CurrentContext;
  id v3;
  CGColor *v4;
  void *v5;
  CGSize v7;

  v7.width = 22.0;
  v7.height = 22.0;
  UIGraphicsBeginImageContextWithOptions(v7, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (CGColor *)objc_msgSend(v3, "CGColor");

  CGContextSetStrokeColorWithColor(CurrentContext, v4);
  CGContextAddArc(CurrentContext, 11.0, 11.0, 10.0, 1.57079633, 1.91986218, 1);
  CGContextStrokePath(CurrentContext);
  UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v5;
}

- (BOOL)isShowing
{
  void *v2;
  float v3;
  BOOL v4;

  -[UIImageView layer](self->_musicNoteView, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "opacity");
  v4 = v3 == 1.0;

  return v4;
}

- (void)animateIn
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  id v16;

  -[UIImageView layer](self->_musicNoteView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "opacity");
  v5 = v4;

  if (v5 == 0.0)
  {
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFromValue:", &unk_24D7EF310);
    objc_msgSend(v16, "setToValue:", &unk_24D7EF328);
    -[UIImageView layer](self->_musicNoteView, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAnimation:forKey:", v16, CFSTR("AcousticIDOpacityAnimationIn"));

    -[UIImageView layer](self->_spinnerView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAnimation:forKey:", v16, CFSTR("AcousticIDOpacityAnimationIn"));

    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.scale"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFromValue:", &unk_24D7EF310);
    objc_msgSend(v8, "setToValue:", &unk_24D7EF328);
    -[UIImageView layer](self->_spinnerView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAnimation:forKey:", v8, CFSTR("AcousticIDScaleAnimationIn"));

    -[SiriUIAcousticIDSpinner _spinningAnimation](self, "_spinningAnimation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBeginTime:", CACurrentMediaTime());
    -[UIImageView layer](self->_spinnerView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAnimation:forKey:", v10, CFSTR("kAcousticIDSpinnerAnimation"));

    -[UIImageView layer](self->_musicNoteView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1.0;
    objc_msgSend(v12, "setOpacity:", v13);

    -[UIImageView layer](self->_spinnerView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 1.0;
    objc_msgSend(v14, "setOpacity:", v15);

  }
}

- (void)animateOut
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  _QWORD v13[5];

  -[UIImageView layer](self->_musicNoteView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "opacity");
  v5 = v4;

  if (v5 != 0.0)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __37__SiriUIAcousticIDSpinner_animateOut__block_invoke;
    v13[3] = &unk_24D7D91F8;
    v13[4] = self;
    objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v13);
    objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFromValue:", &unk_24D7EF328);
    objc_msgSend(v6, "setToValue:", &unk_24D7EF310);
    -[UIImageView layer](self->_musicNoteView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAnimation:forKey:", v6, CFSTR("AcousticIDOpacityAnimationOut"));

    -[UIImageView layer](self->_spinnerView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAnimation:forKey:", v6, CFSTR("AcousticIDOpacityAnimationOut"));

    -[UIImageView layer](self->_musicNoteView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = 0;
    objc_msgSend(v9, "setOpacity:", v10);

    -[UIImageView layer](self->_spinnerView, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = 0;
    objc_msgSend(v11, "setOpacity:", v12);

    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

void __37__SiriUIAcousticIDSpinner_animateOut__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 440));
  objc_msgSend(WeakRetained, "acousticIDSpinnerDidHide:", *(_QWORD *)(a1 + 32));

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 22.0;
  v4 = 22.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;

  -[SiriUIAcousticIDSpinner bounds](self, "bounds");
  -[UIImageView frame](self->_spinnerView, "frame");
  -[UIImageView setFrame:](self->_spinnerView, "setFrame:", 0.0, 0.0);
  -[UIImageView sizeToFit](self->_musicNoteView, "sizeToFit");
  -[UIImageView frame](self->_musicNoteView, "frame");
  UIRectCenteredIntegralRectScale();
  -[UIImageView setFrame:](self->_musicNoteView, "setFrame:", v3 + -1.0);
}

- (SiriUIAcousticIDSpinnerDelegate)delegate
{
  return (SiriUIAcousticIDSpinnerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_musicNoteView, 0);
}

@end
