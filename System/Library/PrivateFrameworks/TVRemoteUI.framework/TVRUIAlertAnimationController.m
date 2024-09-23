@implementation TVRUIAlertAnimationController

- (TVRUIAlertAnimationController)initWithAnimationType:(int64_t)a3 visualStyle:(id)a4
{
  id v7;
  TVRUIAlertAnimationController *v8;
  TVRUIAlertAnimationController *v9;
  __int128 v10;
  CGAffineTransform v12;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TVRUIAlertAnimationController;
  v8 = -[TVRUIAlertAnimationController init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_visualStyle, a4);
    v9->_animationType = a3;
    v9->_foregroundBlurRadius = 20.0;
    CGAffineTransformMakeScale(&v12, 1.92, 1.92);
    v10 = *(_OWORD *)&v12.c;
    *(_OWORD *)&v9->_scaleTransform.a = *(_OWORD *)&v12.a;
    *(_OWORD *)&v9->_scaleTransform.c = v10;
    *(_OWORD *)&v9->_scaleTransform.tx = *(_OWORD *)&v12.tx;
  }

  return v9;
}

- (void)animateTransition:(id)a3
{
  id v4;

  v4 = a3;
  if (-[TVRUIAlertAnimationController animationType](self, "animationType"))
    -[TVRUIAlertAnimationController _runDismissalAnimationWithTransition:](self, "_runDismissalAnimationWithTransition:", v4);
  else
    -[TVRUIAlertAnimationController _runPresentationAnimationWithTransition:](self, "_runPresentationAnimationWithTransition:", v4);

}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)_runPresentationAnimationWithTransition:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t);
  void *v41;
  TVRUIAlertAnimationController *v42;
  id v43;
  _QWORD v44[5];
  id v45;
  _OWORD v46[6];
  uint8_t buf[16];

  v4 = a3;
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Animate transition: presenting", buf, 2u);
  }

  objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BEBE9B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BEBE9A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIAlertAnimationController backgroundMaterialView](self, "backgroundMaterialView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[TVRUIAlertAnimationController backgroundMaterialView](self, "backgroundMaterialView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    -[TVRUIAlertAnimationController backgroundMaterialView](self, "backgroundMaterialView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAutoresizingMask:", 18);

    -[TVRUIAlertAnimationController backgroundMaterialView](self, "backgroundMaterialView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:atIndex:", v19, 0);

  }
  v20 = objc_alloc(MEMORY[0x24BEBDB38]);
  -[TVRUIAlertAnimationController visualStyle](self, "visualStyle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "foregroundVisualEffect");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v20, "initWithEffect:", v22);
  -[TVRUIAlertAnimationController setForegroundVisualEffectView:](self, "setForegroundVisualEffectView:", v23);

  objc_msgSend(v6, "bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[TVRUIAlertAnimationController foregroundVisualEffectView](self, "foregroundVisualEffectView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

  -[TVRUIAlertAnimationController foregroundVisualEffectView](self, "foregroundVisualEffectView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v33);

  objc_msgSend(v6, "setAlpha:", 0.0);
  -[TVRUIAlertAnimationController scaleTransform](self, "scaleTransform");
  v46[0] = v46[3];
  v46[1] = v46[4];
  v46[2] = v46[5];
  objc_msgSend(v6, "setTransform:", v46);
  +[TVRUICubicSpringAnimator standardSpringAnimator](TVRUICubicSpringAnimator, "standardSpringAnimator");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __73__TVRUIAlertAnimationController__runPresentationAnimationWithTransition___block_invoke;
  v44[3] = &unk_24DE2C830;
  v44[4] = self;
  v45 = v6;
  v36 = v6;
  objc_msgSend(v34, "addAnimations:", v44);
  v38 = v35;
  v39 = 3221225472;
  v40 = __73__TVRUIAlertAnimationController__runPresentationAnimationWithTransition___block_invoke_2;
  v41 = &unk_24DE2C858;
  v42 = self;
  v43 = v4;
  v37 = v4;
  objc_msgSend(v34, "addCompletion:", &v38);
  objc_msgSend(v34, "startAnimation", v38, v39, v40, v41, v42);

}

uint64_t __73__TVRUIAlertAnimationController__runPresentationAnimationWithTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "foregroundVisualEffectView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEffect:", 0);

  objc_msgSend(*(id *)(a1 + 32), "backgroundMaterialView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWeighting:", 1.0);

  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
  v4 = *(void **)(a1 + 40);
  v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v7[0] = *MEMORY[0x24BDBD8B8];
  v7[1] = v5;
  v7[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  return objc_msgSend(v4, "setTransform:", v7);
}

uint64_t __73__TVRUIAlertAnimationController__runPresentationAnimationWithTransition___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "foregroundVisualEffectView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", 1);
}

- (void)_runDismissalAnimationWithTransition:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  __int128 v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  id v26;
  _OWORD v27[3];
  uint8_t buf[16];

  v4 = a3;
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Animate transition: dismissing", buf, 2u);
  }

  objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BEBE9A8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB38]), "initWithEffect:", 0);
  -[TVRUIAlertAnimationController setForegroundVisualEffectView:](self, "setForegroundVisualEffectView:", v7);

  objc_msgSend(v6, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[TVRUIAlertAnimationController foregroundVisualEffectView](self, "foregroundVisualEffectView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[TVRUIAlertAnimationController foregroundVisualEffectView](self, "foregroundVisualEffectView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v17);

  objc_msgSend(v6, "setAlpha:", 1.0);
  v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v27[0] = *MEMORY[0x24BDBD8B8];
  v27[1] = v18;
  v27[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v6, "setTransform:", v27);
  +[TVRUICubicSpringAnimator standardSpringAnimator](TVRUICubicSpringAnimator, "standardSpringAnimator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __70__TVRUIAlertAnimationController__runDismissalAnimationWithTransition___block_invoke;
  v25[3] = &unk_24DE2C830;
  v25[4] = self;
  v26 = v6;
  v21 = v6;
  objc_msgSend(v19, "addAnimations:", v25);
  v23[0] = v20;
  v23[1] = 3221225472;
  v23[2] = __70__TVRUIAlertAnimationController__runDismissalAnimationWithTransition___block_invoke_2;
  v23[3] = &unk_24DE2C880;
  v24 = v4;
  v22 = v4;
  objc_msgSend(v19, "addCompletion:", v23);
  objc_msgSend(v19, "startAnimation");

}

void __70__TVRUIAlertAnimationController__runDismissalAnimationWithTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _OWORD v8[3];
  __int128 v9;
  __int128 v10;
  __int128 v11;

  objc_msgSend(*(id *)(a1 + 32), "visualStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "foregroundVisualEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "foregroundVisualEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEffect:", v3);

  objc_msgSend(*(id *)(a1 + 32), "backgroundMaterialView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWeighting:", 0.0);

  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "scaleTransform");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
  }
  v7 = *(void **)(a1 + 40);
  v8[0] = v9;
  v8[1] = v10;
  v8[2] = v11;
  objc_msgSend(v7, "setTransform:", v8);

}

uint64_t __70__TVRUIAlertAnimationController__runDismissalAnimationWithTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (int64_t)animationType
{
  return self->_animationType;
}

- (TVRemoteAlertVisualStyleProviding)visualStyle
{
  return self->_visualStyle;
}

- (TVRMaterialView)backgroundMaterialView
{
  return self->_backgroundMaterialView;
}

- (void)setBackgroundMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundMaterialView, a3);
}

- (UIVisualEffectView)foregroundVisualEffectView
{
  return self->_foregroundVisualEffectView;
}

- (void)setForegroundVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_foregroundVisualEffectView, a3);
}

- (double)foregroundBlurRadius
{
  return self->_foregroundBlurRadius;
}

- (void)setForegroundBlurRadius:(double)a3
{
  self->_foregroundBlurRadius = a3;
}

- (CGAffineTransform)scaleTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (void)setScaleTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_scaleTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_scaleTransform.tx = v4;
  *(_OWORD *)&self->_scaleTransform.a = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundVisualEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
}

@end
