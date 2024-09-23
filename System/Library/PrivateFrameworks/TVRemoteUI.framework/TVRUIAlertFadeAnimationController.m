@implementation TVRUIAlertFadeAnimationController

- (TVRUIAlertFadeAnimationController)initWithAnimationType:(int64_t)a3 visualStyle:(id)a4
{
  id v7;
  TVRUIAlertFadeAnimationController *v8;
  TVRUIAlertFadeAnimationController *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TVRUIAlertFadeAnimationController;
  v8 = -[TVRUIAlertFadeAnimationController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_visualStyle, a4);
    v9->_animationType = a3;
  }

  return v9;
}

- (void)animateTransition:(id)a3
{
  id v4;

  v4 = a3;
  if (-[TVRUIAlertFadeAnimationController animationType](self, "animationType"))
    -[TVRUIAlertFadeAnimationController _runDismissalAnimationWithTransition:](self, "_runDismissalAnimationWithTransition:", v4);
  else
    -[TVRUIAlertFadeAnimationController _runPresentationAnimationWithTransition:](self, "_runPresentationAnimationWithTransition:", v4);

}

- (double)transitionDuration:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[TVRUIAlertFadeAnimationController visualStyle](self, "visualStyle", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "crossfadeDuration");
  v5 = v4;

  return v5;
}

- (void)_runPresentationAnimationWithTransition:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[16];

  v4 = a3;
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "#TVRUIAlertFadeAnimationController - Animate transition: presenting", buf, 2u);
  }

  objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BEBE9B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BEBE9A8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setFrame:");
  -[TVRUIAlertFadeAnimationController transitionDuration:](self, "transitionDuration:", v4);
  v9 = v8;
  v10 = objc_alloc(MEMORY[0x24BEBDB20]);
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __77__TVRUIAlertFadeAnimationController__runPresentationAnimationWithTransition___block_invoke;
  v20[3] = &unk_24DE2C198;
  v21 = v6;
  v12 = v6;
  v13 = (void *)objc_msgSend(v10, "initWithDuration:curve:animations:", 0, v20, v9);
  v15 = v11;
  v16 = 3221225472;
  v17 = __77__TVRUIAlertFadeAnimationController__runPresentationAnimationWithTransition___block_invoke_2;
  v18 = &unk_24DE2C880;
  v19 = v4;
  v14 = v4;
  objc_msgSend(v13, "addCompletion:", &v15);
  objc_msgSend(v13, "startAnimation", v15, v16, v17, v18);

}

uint64_t __77__TVRUIAlertFadeAnimationController__runPresentationAnimationWithTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __77__TVRUIAlertFadeAnimationController__runPresentationAnimationWithTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (void)_runDismissalAnimationWithTransition:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[16];

  v4 = a3;
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "#TVRUIAlertFadeAnimationController - Animate transition: dismissing", buf, 2u);
  }

  objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BEBE9A8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x24BEBE9B8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 1.0);
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "setFrame:");
  -[TVRUIAlertFadeAnimationController transitionDuration:](self, "transitionDuration:", v4);
  v9 = v8;
  v10 = objc_alloc(MEMORY[0x24BEBDB20]);
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __74__TVRUIAlertFadeAnimationController__runDismissalAnimationWithTransition___block_invoke;
  v20[3] = &unk_24DE2C198;
  v21 = v6;
  v12 = v6;
  v13 = (void *)objc_msgSend(v10, "initWithDuration:curve:animations:", 0, v20, v9);
  v15 = v11;
  v16 = 3221225472;
  v17 = __74__TVRUIAlertFadeAnimationController__runDismissalAnimationWithTransition___block_invoke_2;
  v18 = &unk_24DE2C880;
  v19 = v4;
  v14 = v4;
  objc_msgSend(v13, "addCompletion:", &v15);
  objc_msgSend(v13, "startAnimation", v15, v16, v17, v18);

}

uint64_t __74__TVRUIAlertFadeAnimationController__runDismissalAnimationWithTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __74__TVRUIAlertFadeAnimationController__runDismissalAnimationWithTransition___block_invoke_2(uint64_t a1)
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualStyle, 0);
}

@end
