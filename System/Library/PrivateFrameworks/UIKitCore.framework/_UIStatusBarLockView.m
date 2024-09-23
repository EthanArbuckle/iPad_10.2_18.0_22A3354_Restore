@implementation _UIStatusBarLockView

- (_UIStatusBarLockView)initWithFrame:(CGRect)a3
{
  _UIStatusBarLockView *v3;
  _UIStatusBarImageView *v4;
  _UIStatusBarImageView *shackleView;
  _UIStatusBarImageView *v6;
  _UIStatusBarImageView *bodyView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarLockView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[_UIStatusBarImageView initWithFrame:]([_UIStatusBarImageView alloc], "initWithFrame:", 1.0, 2.0, 6.0, 7.0);
    shackleView = v3->_shackleView;
    v3->_shackleView = v4;

    -[UIView addSubview:](v3, "addSubview:", v3->_shackleView);
    v6 = -[_UIStatusBarImageView initWithFrame:]([_UIStatusBarImageView alloc], "initWithFrame:", 0.0, 6.0, 8.0, 6.0);
    bodyView = v3->_bodyView;
    v3->_bodyView = v6;

    -[UIView addSubview:](v3, "addSubview:", v3->_bodyView);
  }
  return v3;
}

- (void)applyStyleAttributes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[UIImageView image](self->_shackleView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[_UIStatusBarImageProvider sharedProvider](_UIStatusBarImageProvider, "sharedProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:styleAttributes:", CFSTR("LockShackle"), v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithRenderingMode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](self->_shackleView, "setImage:", v7);
  }
  -[_UIStatusBarImageView applyStyleAttributes:](self->_shackleView, "applyStyleAttributes:", v12);
  -[UIImageView image](self->_bodyView, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[_UIStatusBarImageProvider sharedProvider](_UIStatusBarImageProvider, "sharedProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageNamed:styleAttributes:", CFSTR("LockBody"), v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageWithRenderingMode:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](self->_bodyView, "setImage:", v11);
  }
  -[_UIStatusBarImageView applyStyleAttributes:](self->_bodyView, "applyStyleAttributes:", v12);

}

- (BOOL)prefersBaselineAlignment
{
  return 1;
}

- (void)resetLock
{
  void *v3;
  void *v4;

  -[UIView layer](self->_shackleView, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllAnimations");

  -[UIView layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimations");

  -[UIImageView setFrame:](self->_shackleView, "setFrame:", 1.0, 2.0, 6.0, 7.0);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 8.0;
  v3 = 12.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)animateUnlockWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id completionBlock;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = a3;
  if (!self->_completionBlock)
  {
    v18 = v4;
    v5 = _Block_copy(v4);
    completionBlock = self->_completionBlock;
    self->_completionBlock = v5;

    -[UIImageView setFrame:](self->_shackleView, "setFrame:", 1.0, 0.0, 6.0, 7.0);
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMass:", 2.0);
    objc_msgSend(v7, "setStiffness:", 300.0);
    objc_msgSend(v7, "setDamping:", 400.0);
    objc_msgSend(v7, "setDuration:", 0.91);
    v8 = objc_alloc(MEMORY[0x1E0CD27D0]);
    LODWORD(v9) = 1046809695;
    LODWORD(v10) = 990250344;
    LODWORD(v11) = 1057860847;
    LODWORD(v12) = 1064564184;
    v13 = (void *)objc_msgSend(v8, "initWithControlPoints::::", v9, v10, v11, v12);
    objc_msgSend(v7, "setTimingFunction:", v13);

    LODWORD(v14) = 1066192077;
    objc_msgSend(v7, "setSpeed:", v14);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", centerOfRect(1.0, 2.0, 6.0, 7.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFromValue:", v15);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", centerOfRect(1.0, 0.0, 6.0, 7.0));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setToValue:", v16);

    objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v7, "setDelegate:", self);
    -[UIImageView setFrame:](self->_shackleView, "setFrame:", 1.0, 0.0, 6.0, 7.0);
    -[UIView layer](self->_shackleView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAnimation:forKey:", v7, CFSTR("unlock"));

    goto LABEL_5;
  }
  if (v4)
  {
    v18 = v4;
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
LABEL_5:
    v4 = v18;
  }

}

- (void)jiggleWithCompletionBlock:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CATransform3D v30;
  _OWORD v31[8];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_completionBlock)
  {
    if (v4)
      v4[2](v4, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v5, "position");
    objc_msgSend(v7, "valueWithCGPoint:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFromValue:", v8);

    v9 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v5, "position");
    v11 = v10 + -20.0;
    objc_msgSend(v5, "position");
    objc_msgSend(v9, "valueWithCGPoint:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setToValue:", v12);

    objc_msgSend(v6, "setMass:", 1.2);
    objc_msgSend(v6, "setStiffness:", 1200.0);
    objc_msgSend(v6, "setDamping:", 12.0);
    objc_msgSend(v6, "setDuration:", 0.6679);
    LODWORD(v13) = 1028404955;
    LODWORD(v14) = 990250344;
    LODWORD(v15) = 1059713387;
    LODWORD(v16) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimingFunction:", v17);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v31[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v31[5] = v19;
    v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v31[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v31[7] = v20;
    v21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v31[0] = *MEMORY[0x1E0CD2610];
    v31[1] = v21;
    v22 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v31[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v31[3] = v22;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setFromValue:", v23);

    v24 = (void *)MEMORY[0x1E0CB3B18];
    CATransform3DMakeTranslation(&v30, 20.0, 0.0, 0.0);
    objc_msgSend(v24, "valueWithCATransform3D:", &v30);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setToValue:", v25);

    objc_msgSend(v18, "setDuration:", 0.1012);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTimingFunction:", v26);

    objc_msgSend(v18, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setDuration:", 0.6679);
    v32[0] = v6;
    v32[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAnimations:", v28);

    objc_msgSend(v27, "setDelegate:", self);
    -[_UIStatusBarLockView setCompletionBlock:](self, "setCompletionBlock:", v4);
    -[UIView layer](self, "layer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addAnimation:forKey:", v27, CFSTR("jiggle"));

  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  id completionBlock;
  void *v7;
  id v8;

  v4 = a4;
  v8 = _Block_copy(self->_completionBlock);
  completionBlock = self->_completionBlock;
  self->_completionBlock = 0;

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id, _BOOL8))v8 + 2))(v8, v4);
    v7 = v8;
  }

}

- (_UIStatusBarImageView)bodyView
{
  return self->_bodyView;
}

- (void)setBodyView:(id)a3
{
  objc_storeStrong((id *)&self->_bodyView, a3);
}

- (_UIStatusBarImageView)shackleView
{
  return self->_shackleView;
}

- (void)setShackleView:(id)a3
{
  objc_storeStrong((id *)&self->_shackleView, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_shackleView, 0);
  objc_storeStrong((id *)&self->_bodyView, 0);
}

@end
