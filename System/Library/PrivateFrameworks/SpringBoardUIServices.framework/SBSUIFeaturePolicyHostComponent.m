@implementation SBSUIFeaturePolicyHostComponent

- (BOOL)shouldDisableBanners
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disablesBanners");

  return v4;
}

- (BOOL)shouldDisableAlertItems
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disablesAlertItems");

  return v4;
}

- (BOOL)shouldDisableControlCenter
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disablesControlCenter");

  return v4;
}

- (BOOL)shouldDisableSiri
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disablesSiri");

  return v4;
}

- (BOOL)shouldDisableInteractiveScreenshotGesture
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disablesInteractiveScreenshotGesture");

  return v4;
}

- (BOOL)shouldDisableReachability
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disablesReachability");

  return v4;
}

- (BOOL)allowsMenuButtonDismissal
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsMenuButtonDismissal");

  return v4;
}

- (unint64_t)desiredHardwareButtonEvents
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "desiredHardwareButtonEvents");

  return v4;
}

- (NSSet)desiredBackgroundActivities
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "desiredBackgroundActivities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)sendActions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SBSUIFeaturePolicyHostComponent_sendActions___block_invoke;
  v7[3] = &unk_1E4C3F598;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performUpdate:", v7);

}

uint64_t __47__SBSUIFeaturePolicyHostComponent_sendActions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setActions:", *(_QWORD *)(a1 + 32));
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id WeakRetained;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_msgSend(v8, "containsProperty:", sel_disablesBanners))
    objc_msgSend(WeakRetained, "featurePolicyHostComponentDidChangeShouldDisableBanners:", self);
  if (objc_msgSend(v8, "containsProperty:", sel_disablesAlertItems))
    objc_msgSend(WeakRetained, "featurePolicyHostComponentDidChangeShouldDisableAlertItems:", self);
  if (objc_msgSend(v8, "containsProperty:", sel_disablesControlCenter))
    objc_msgSend(WeakRetained, "featurePolicyHostComponentDidChangeShouldDisableControlCenter:", self);
  if (objc_msgSend(v8, "containsProperty:", sel_disablesSiri))
    objc_msgSend(WeakRetained, "featurePolicyHostComponentDidChangeShouldDisableSiri:", self);
  if (objc_msgSend(v8, "containsProperty:", sel_disablesInteractiveScreenshotGesture))
    objc_msgSend(WeakRetained, "featurePolicyHostComponentDidChangeShouldDisableInteractiveScreenshotGesture:", self);
  if (objc_msgSend(v8, "containsProperty:", sel_disablesReachability))
    objc_msgSend(WeakRetained, "featurePolicyHostComponentDidChangeShouldDisableReachability:", self);
  if (objc_msgSend(v8, "containsProperty:", sel_allowsMenuButtonDismissal))
    objc_msgSend(WeakRetained, "featurePolicyHostComponentDidChangeAllowsMenuButtonDismissal:", self);
  if (objc_msgSend(v8, "containsProperty:", sel_desiredHardwareButtonEvents))
    objc_msgSend(WeakRetained, "featurePolicyHostComponentDidChangeDesiredHardwareButtonEvents:", self);
  if (objc_msgSend(v8, "containsProperty:", sel_desiredBackgroundActivities))
    objc_msgSend(WeakRetained, "featurePolicyHostComponentDidChangeDesiredBackgroundActivities:", self);

}

- (SBSUIFeaturePolicyHostComponentDelegate)delegate
{
  return (SBSUIFeaturePolicyHostComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
