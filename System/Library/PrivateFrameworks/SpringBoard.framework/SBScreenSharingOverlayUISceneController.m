@implementation SBScreenSharingOverlayUISceneController

+ (BOOL)_isEssoniteEnabled
{
  if (_isEssoniteEnabled_onceToken != -1)
    dispatch_once(&_isEssoniteEnabled_onceToken, &__block_literal_global_282);
  return _isEssoniteEnabled__isEssoniteEnabled;
}

void __61__SBScreenSharingOverlayUISceneController__isEssoniteEnabled__block_invoke()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0DBD2F0]);
  _isEssoniteEnabled__isEssoniteEnabled = objc_msgSend(v0, "screenSharingRemoteControlEnabled");

}

+ (id)_setupInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[7];
  _QWORD v9[8];

  v9[7] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("class");
  v9[0] = objc_opt_class();
  v8[1] = CFSTR("enabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_isEssoniteEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  v9[2] = CFSTR("SBTraitsParticipantRoleSystemUIScene");
  v8[2] = CFSTR("traitsRole");
  v8[3] = CFSTR("hostLevel");
  v9[3] = &unk_1E91CF8C8;
  v8[4] = CFSTR("jobLabel");
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "uiSceneSessionRole");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v5;
  v9[5] = &unk_1E91D1730;
  v8[5] = CFSTR("presentationStyle");
  v8[6] = CFSTR("vendingStrategy");
  v9[6] = &unk_1E91D1730;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)scenePresenter:(id)a3 willDismissScene:(id)a4
{
  id v5;

  v5 = a4;
  -[SBScreenSharingOverlayUISceneController _setCanSetAdditionalRootLayerTransform:](self, "_setCanSetAdditionalRootLayerTransform:", 0);
  objc_msgSend(v5, "removeObserver:", self);

}

- (void)scenePresenter:(id)a3 didPresentScene:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(v7, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredSystemRootTransform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBScreenSharingOverlayUISceneController _setClientPreferredAdditionalRootLayerTransform:](self, "_setClientPreferredAdditionalRootLayerTransform:", v6);

  -[SBScreenSharingOverlayUISceneController _setCanSetAdditionalRootLayerTransform:](self, "_setCanSetAdditionalRootLayerTransform:", 1);
  objc_msgSend(v7, "addObserver:", self);

}

- (void)setDefaultPresenter:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBScreenSharingOverlayUISceneController;
  -[SBSystemUISceneController setDefaultPresenter:](&v5, sel_setDefaultPresenter_, v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setPresentingDelegate:", self);

}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a3, "clientSettings");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredSystemRootTransform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBScreenSharingOverlayUISceneController _setClientPreferredAdditionalRootLayerTransform:](self, "_setClientPreferredAdditionalRootLayerTransform:", v5);

}

- (id)_embeddedDisplayWindowScene
{
  void *v2;
  void *v3;

  objc_msgSend((id)SBApp, "windowSceneManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "embeddedDisplayWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_systemGestureWindow
{
  void *v2;
  void *v3;
  void *v4;

  -[SBScreenSharingOverlayUISceneController _embeddedDisplayWindowScene](self, "_embeddedDisplayWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemGestureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowForSystemGestures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_rootSceneWindow
{
  void *v2;
  void *v3;

  +[SBMainDisplayRootWindowScenePresentationBinder sharedInstance](SBMainDisplayRootWindowScenePresentationBinder, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSValue)_clientPreferredAdditionalRootLayerTransform
{
  NSValue *clientPreferredAdditionalRootLayerTransform;
  __int128 v4;
  _OWORD v5[3];

  clientPreferredAdditionalRootLayerTransform = self->__clientPreferredAdditionalRootLayerTransform;
  if (clientPreferredAdditionalRootLayerTransform)
    return clientPreferredAdditionalRootLayerTransform;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGAffineTransform:", v5);
  return (NSValue *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setClientPreferredAdditionalRootLayerTransform:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSValue isEqualToValue:](self->__clientPreferredAdditionalRootLayerTransform, "isEqualToValue:"))
  {
    objc_storeStrong((id *)&self->__clientPreferredAdditionalRootLayerTransform, a3);
    if (-[SBScreenSharingOverlayUISceneController _canSetAdditionalRootLayerTransform](self, "_canSetAdditionalRootLayerTransform"))
    {
      -[SBScreenSharingOverlayUISceneController _updateAdditionalRootLayerTransformsIfNeeded](self, "_updateAdditionalRootLayerTransformsIfNeeded");
    }
  }

}

- (void)_setCanSetAdditionalRootLayerTransform:(BOOL)a3
{
  if (self->__canSetAdditionalRootLayerTransform != a3)
  {
    self->__canSetAdditionalRootLayerTransform = a3;
    -[SBScreenSharingOverlayUISceneController _updateAdditionalRootLayerTransformsIfNeeded](self, "_updateAdditionalRootLayerTransformsIfNeeded");
  }
}

- (void)_updateAdditionalRootLayerTransformsIfNeeded
{
  __int128 v3;
  void *v4;
  void *v5;
  BOOL IsIdentity;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v16.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v16.c = v3;
  *(_OWORD *)&v16.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  if (-[SBScreenSharingOverlayUISceneController _canSetAdditionalRootLayerTransform](self, "_canSetAdditionalRootLayerTransform"))
  {
    -[SBScreenSharingOverlayUISceneController _clientPreferredAdditionalRootLayerTransform](self, "_clientPreferredAdditionalRootLayerTransform");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      objc_msgSend(v4, "CGAffineTransformValue");
    else
      memset(&v15, 0, sizeof(v15));
    v16 = v15;

  }
  v15 = v16;
  IsIdentity = CGAffineTransformIsIdentity(&v15);
  -[SBScreenSharingOverlayUISceneController _requireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion](self, "_requireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (IsIdentity)
  {
    objc_msgSend(v7, "invalidate");

    -[SBScreenSharingOverlayUISceneController _setRequireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion:](self, "_setRequireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion:", 0);
  }
  else
  {

    if (!v8)
    {
      -[SBScreenSharingOverlayUISceneController _embeddedDisplayWindowScene](self, "_embeddedDisplayWindowScene");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemGestureManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "acquireSystemEdgeGesturesIgnoreHIDEdgeFlagsForReason:", CFSTR("Screen Sharing Overlay UI requests it"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBScreenSharingOverlayUISceneController _setRequireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion:](self, "_setRequireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion:", v11);
    }
  }
  -[SBScreenSharingOverlayUISceneController _systemGestureWindow](self, "_systemGestureWindow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v16;
  objc_msgSend(v12, "_setAdditionalRootLayerAffineTransform:", &v15);

  -[SBScreenSharingOverlayUISceneController _rootSceneWindow](self, "_rootSceneWindow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v16;
  objc_msgSend(v13, "_setAdditionalRootLayerAffineTransform:", &v15);

  +[SBTouchRegionManager sharedInstance](SBTouchRegionManager, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v16;
  objc_msgSend(v14, "setRootWindowTransform:", &v15);

}

- (BOOL)_canSetAdditionalRootLayerTransform
{
  return self->__canSetAdditionalRootLayerTransform;
}

- (BSInvalidatable)_requireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion
{
  return self->__requireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion;
}

- (void)_setRequireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion:(id)a3
{
  objc_storeStrong((id *)&self->__requireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__requireSystemGesturesShouldIgnoreHIDEdgeFlagsAssertion, 0);
  objc_storeStrong((id *)&self->__clientPreferredAdditionalRootLayerTransform, 0);
}

@end
