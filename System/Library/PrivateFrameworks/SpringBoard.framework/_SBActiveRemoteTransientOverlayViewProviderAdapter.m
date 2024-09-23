@implementation _SBActiveRemoteTransientOverlayViewProviderAdapter

- (void)setViewServiceProvider:(id)a3
{
  objc_storeWeak((id *)&self->_viewServiceProvider, a3);
}

- (void)setSceneBackedProvider:(id)a3
{
  objc_storeWeak((id *)&self->_sceneBackedProvider, a3);
}

- (void)presentRemoteTransientOverlayViewController:(id)a3 presentationRequest:(id)a4
{
  id v6;
  int v7;
  uint64_t v8;
  id WeakRetained;
  id v10;

  v6 = a4;
  v10 = a3;
  v7 = objc_msgSend(v6, "isSceneBacked");
  v8 = 8;
  if (v7)
    v8 = 16;
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.isa + v8));
  objc_msgSend(WeakRetained, "presentRemoteTransientOverlayViewController:presentationRequest:", v10, v6);

  objc_msgSend(v10, "updateDisplayLayoutElementWithBuilder:", &__block_literal_global_337);
}

- (void)dismissRemoteTransientOverlayViewController:(id)a3
{
  SBDeviceApplicationRemoteTransientOverlayViewProvider **p_sceneBackedProvider;
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  id WeakRetained;

  p_sceneBackedProvider = &self->_sceneBackedProvider;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sceneBackedProvider);
  v6 = objc_loadWeakRetained((id *)&self->_viewServiceProvider);
  v7 = objc_msgSend(WeakRetained, "isPresentingTransientOverlay:", v5) == 0;
  v8 = WeakRetained;
  if (v7)
    v8 = v6;
  objc_msgSend(v8, "dismissRemoteTransientOverlayViewController:", v5);

}

- (BOOL)isPresentingTransientOverlay:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewServiceProvider);
  if ((objc_msgSend(WeakRetained, "isPresentingTransientOverlay:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)&self->_sceneBackedProvider);
    v6 = objc_msgSend(v7, "isPresentingTransientOverlay:", v4);

  }
  return v6;
}

- (SBWindowScene)windowScene
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_viewServiceProvider);
  objc_msgSend(WeakRetained, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBWindowScene *)v3;
}

- (BOOL)isPresentingOnBehalfOfApplication:(id)a3
{
  SBDeviceApplicationRemoteTransientOverlayViewProvider **p_viewServiceProvider;
  id v4;
  id WeakRetained;
  char v6;

  p_viewServiceProvider = &self->_viewServiceProvider;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewServiceProvider);
  v6 = objc_msgSend(WeakRetained, "isPresentingOnBehalfOfApplication:", v4);

  return v6;
}

- (BOOL)isPresentingOnBehalfOfSceneIdentityTokenString:(id)a3
{
  SBDeviceApplicationRemoteTransientOverlayViewProvider **p_viewServiceProvider;
  id v4;
  id WeakRetained;
  char v6;

  p_viewServiceProvider = &self->_viewServiceProvider;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewServiceProvider);
  v6 = objc_msgSend(WeakRetained, "isPresentingOnBehalfOfSceneIdentityTokenString:", v4);

  return v6;
}

- (BOOL)isPresentingOnBehalfOfScenePersistentIdentifier:(id)a3
{
  SBDeviceApplicationRemoteTransientOverlayViewProvider **p_viewServiceProvider;
  id v4;
  id WeakRetained;
  char v6;

  p_viewServiceProvider = &self->_viewServiceProvider;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewServiceProvider);
  v6 = objc_msgSend(WeakRetained, "isPresentingOnBehalfOfScenePersistentIdentifier:", v4);

  return v6;
}

- (SBDeviceApplicationRemoteTransientOverlayViewProvider)viewServiceProvider
{
  return (SBDeviceApplicationRemoteTransientOverlayViewProvider *)objc_loadWeakRetained((id *)&self->_viewServiceProvider);
}

- (SBDeviceApplicationRemoteTransientOverlayViewProvider)sceneBackedProvider
{
  return (SBDeviceApplicationRemoteTransientOverlayViewProvider *)objc_loadWeakRetained((id *)&self->_sceneBackedProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sceneBackedProvider);
  objc_destroyWeak((id *)&self->_viewServiceProvider);
}

@end
