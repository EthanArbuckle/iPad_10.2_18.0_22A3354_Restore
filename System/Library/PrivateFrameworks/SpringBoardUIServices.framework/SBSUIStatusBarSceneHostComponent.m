@implementation SBSUIStatusBarSceneHostComponent

- (void)scene:(id)a3 willUpdateSettings:(id)a4 withTransitionContext:(id)a5
{
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;

  v9 = a4;
  if (objc_msgSend(v9, "isUISubclass"))
  {
    objc_msgSend(v9, "displayConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "statusBarForDisplayConfiguration:statusBarSceneHostComponent:", v6, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "heightForOrientation:", 1);
    objc_msgSend(v9, "setDefaultStatusBarHeight:forOrientation:", 1);
    objc_msgSend(v8, "heightForOrientation:", 2);
    objc_msgSend(v9, "setDefaultStatusBarHeight:forOrientation:", 2);
    objc_msgSend(v8, "heightForOrientation:", 4);
    objc_msgSend(v9, "setDefaultStatusBarHeight:forOrientation:", 4);
    objc_msgSend(v8, "heightForOrientation:", 3);
    objc_msgSend(v9, "setDefaultStatusBarHeight:forOrientation:", 3);

  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  int v16;
  id WeakRetained;
  void *v18;
  id v19;

  v19 = a5;
  v9 = a6;
  objc_msgSend(a3, "clientSettings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v12 = v10;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  if (v14)
  {
    v15 = v19;
    v16 = objc_msgSend(v14, "statusBarHidden");
    if (v16 != objc_msgSend(v15, "statusBarHidden"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v9, "animationSettings");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "statusBarSceneHostComponent:didChangePreferredStatusBarVisibilityWithAnimationSettings:", self, v18);

    }
  }

}

- (SBSUIStatusBarSceneHostComponentDelegate)delegate
{
  return (SBSUIStatusBarSceneHostComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
