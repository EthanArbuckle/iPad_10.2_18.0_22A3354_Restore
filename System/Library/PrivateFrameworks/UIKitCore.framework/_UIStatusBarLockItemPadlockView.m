@implementation _UIStatusBarLockItemPadlockView

- (_UIStatusBarLockItemPadlockView)initWithFrame:(CGRect)a3 owner:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _UIStatusBarLockItemPadlockView *v10;
  _UIStatusBarLockItemPadlockView *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  UIImageView *v15;
  UIImageView *shackleView;
  void *v17;
  void *v18;
  uint64_t v19;
  UIImageView *v20;
  UIImageView *bodyView;
  NSObject *v23;
  unint64_t v24;
  NSObject *v25;
  objc_super v26;
  uint8_t buf[16];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v9)
    {
      __UIFaultDebugAssertLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v23, OS_LOG_TYPE_FAULT, "owner must not be nil.", buf, 2u);
      }

    }
  }
  else if (!v9)
  {
    v24 = initWithFrame_owner____s_category;
    if (!initWithFrame_owner____s_category)
    {
      v24 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v24, (unint64_t *)&initWithFrame_owner____s_category);
    }
    v25 = *(NSObject **)(v24 + 8);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v25, OS_LOG_TYPE_ERROR, "owner must not be nil.", buf, 2u);
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)_UIStatusBarLockItemPadlockView;
  v10 = -[UIView initWithFrame:](&v26, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_owner, v9);
    objc_msgSend(v9, "imageWithShadowNamed:", CFSTR("LockShackle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "image");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "_shouldReverseLayoutDirection"))
    {
      objc_msgSend(v13, "imageWithHorizontallyFlippedOrientation");
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    v15 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v13);
    shackleView = v11->_shackleView;
    v11->_shackleView = v15;

    -[UIImageView setFrame:](v11->_shackleView, "setFrame:", 1.0, 2.0, 6.0, 7.0);
    -[UIView addSubview:](v11, "addSubview:", v11->_shackleView);
    objc_msgSend(v9, "imageWithShadowNamed:", CFSTR("LockBody"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "image");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "_shouldReverseLayoutDirection"))
    {
      objc_msgSend(v18, "imageWithHorizontallyFlippedOrientation");
      v19 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v19;
    }
    v20 = -[UIImageView initWithImage:]([UIImageView alloc], "initWithImage:", v18);
    bodyView = v11->_bodyView;
    v11->_bodyView = v20;

    -[UIImageView setFrame:](v11->_bodyView, "setFrame:", 0.0, 6.0, 8.0, 6.0);
    -[UIView addSubview:](v11, "addSubview:", v11->_bodyView);

  }
  return v11;
}

- (void)reset
{
  -[UIView setAlpha:](self, "setAlpha:", 1.0);
  -[UIImageView setFrame:](self->_shackleView, "setFrame:", 1.0, 2.0, 6.0, 7.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 8.0;
  v4 = 12.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)animateUnlockCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id completionBlock;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint8_t v20[16];

  v4 = a3;
  v5 = v4;
  if (self->_completionBlock)
  {
    if (v4)
      dispatch_async(MEMORY[0x1E0C80D38], v4);
  }
  else
  {
    v6 = animateUnlockCompletionBlock____s_category;
    if (!animateUnlockCompletionBlock____s_category)
    {
      v6 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&animateUnlockCompletionBlock____s_category);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v19 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Unlocking lock icon", v20, 2u);
      }
    }
    v7 = _Block_copy(v5);
    completionBlock = self->_completionBlock;
    self->_completionBlock = v7;

    -[UIImageView setFrame:](self->_shackleView, "setFrame:", 1.0, 0.0, 6.0, 7.0);
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    setDefaultLockAnimationParameters(v9);
    LODWORD(v10) = 1066192077;
    objc_msgSend(v9, "setSpeed:", v10);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", centerOfRect(1.0, 2.0, 6.0, 7.0));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFromValue:", v11);

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", centerOfRect(1.0, 0.0, 6.0, 7.0));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setToValue:", v12);

    v13 = *MEMORY[0x1E0CD2B58];
    objc_msgSend(v9, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    -[UIImageView setFrame:](self->_shackleView, "setFrame:", 1.0, 0.0, 6.0, 7.0);
    -[UIView layer](self->_shackleView, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addAnimation:forKey:", v9, CFSTR("unlock"));

    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("opacity"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    setDefaultLockAnimationParameters(v15);
    LODWORD(v16) = 1066192077;
    objc_msgSend(v15, "setSpeed:", v16);
    objc_msgSend(v15, "setFromValue:", &unk_1E1A95DD0);
    objc_msgSend(v15, "setToValue:", &unk_1E1A95DE0);
    objc_msgSend(v15, "setFillMode:", v13);
    objc_msgSend(v15, "setBeginTime:", CACurrentMediaTime() + 1.35454545);
    +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:](_UIViewWeakCAAnimationDelegate, "weakAnimationDelegate:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", v17);

    -[UIView layer](self, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAnimation:forKey:", v15, CFSTR("fadeOut"));

    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[UIView setAlpha:](self, "setAlpha:", 0.0);
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 0);

  }
}

- (void)jiggleCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  CATransform3D v33;
  uint8_t buf[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_completionBlock)
  {
    if (v4)
      dispatch_async(MEMORY[0x1E0C80D38], v4);
  }
  else
  {
    v6 = jiggleCompletionBlock____s_category;
    if (!jiggleCompletionBlock____s_category)
    {
      v6 = __UILogCategoryGetNode("StatusBar", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v6, (unint64_t *)&jiggleCompletionBlock____s_category);
    }
    if ((*(_BYTE *)v6 & 1) != 0)
    {
      v32 = *(NSObject **)(v6 + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v32, OS_LOG_TYPE_ERROR, "Jiggling lock icon", buf, 2u);
      }
    }
    objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v5, "position");
    objc_msgSend(v8, "valueWithCGPoint:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFromValue:", v9);

    v10 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v5, "position");
    v12 = v11 + -20.0;
    objc_msgSend(v5, "position");
    objc_msgSend(v10, "valueWithCGPoint:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setToValue:", v13);

    objc_msgSend(v7, "setMass:", 1.2);
    objc_msgSend(v7, "setStiffness:", 1200.0);
    objc_msgSend(v7, "setDamping:", 12.0);
    objc_msgSend(v7, "setDuration:", 0.6679);
    LODWORD(v14) = 1028404955;
    LODWORD(v15) = 990250344;
    LODWORD(v16) = 1059713387;
    LODWORD(v17) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimingFunction:", v18);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v38 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v39 = v20;
    v21 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v40 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v41 = v21;
    v22 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    *(_OWORD *)buf = *MEMORY[0x1E0CD2610];
    v35 = v22;
    v23 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v36 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v37 = v23;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", buf);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFromValue:", v24);

    v25 = (void *)MEMORY[0x1E0CB3B18];
    CATransform3DMakeTranslation(&v33, 20.0, 0.0, 0.0);
    objc_msgSend(v25, "valueWithCATransform3D:", &v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setToValue:", v26);

    objc_msgSend(v19, "setDuration:", 0.1012);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTimingFunction:", v27);

    objc_msgSend(v19, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    objc_msgSend(MEMORY[0x1E0CD2700], "animation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDuration:", 0.6679);
    v42[0] = v7;
    v42[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setAnimations:", v29);

    +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:](_UIViewWeakCAAnimationDelegate, "weakAnimationDelegate:", self);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDelegate:", v30);

    -[_UIStatusBarLockItemPadlockView setCompletionBlock:](self, "setCompletionBlock:", v4);
    -[UIView layer](self, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addAnimation:forKey:", v28, CFSTR("jiggle"));

  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id completionBlock;
  void *v6;
  id v7;

  v7 = _Block_copy(self->_completionBlock);
  completionBlock = self->_completionBlock;
  self->_completionBlock = 0;

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id))v7 + 2))(v7);
    v6 = v7;
  }

}

- (UIImageView)bodyView
{
  return self->_bodyView;
}

- (void)setBodyView:(id)a3
{
  objc_storeStrong((id *)&self->_bodyView, a3);
}

- (UIImageView)shackleView
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

- (UIStatusBarLockItemView)owner
{
  return (UIStatusBarLockItemView *)objc_loadWeakRetained((id *)&self->_owner);
}

- (void)setOwner:(id)a3
{
  objc_storeWeak((id *)&self->_owner, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_shackleView, 0);
  objc_storeStrong((id *)&self->_bodyView, 0);
}

@end
