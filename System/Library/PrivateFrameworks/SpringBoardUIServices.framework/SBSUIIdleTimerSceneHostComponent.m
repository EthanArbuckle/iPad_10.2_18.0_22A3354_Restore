@implementation SBSUIIdleTimerSceneHostComponent

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  id WeakRetained;
  id v16;

  v16 = a5;
  objc_msgSend(a3, "clientSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v10 = v8;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  if (v12)
  {
    v13 = v16;
    v14 = objc_msgSend(v12, "idleTimerDisabled");
    if (v14 != objc_msgSend(v13, "idleTimerDisabled"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "idleTimerSceneHostComponentDidChangeShouldDisableIdleTimer:", self);

    }
  }

}

- (SBSUIIdleTimerSceneHostComponentDelegate)delegate
{
  return (SBSUIIdleTimerSceneHostComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
