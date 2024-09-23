@implementation _PBFPosterSceneSnapshotViewController

- (_PBFPosterSceneSnapshotViewController)initWithProvider:(id)a3 contents:(id)a4 configurableOptions:(id)a5 configuredProperties:(id)a6 preview:(id)a7 definition:(id)a8
{
  PFPosterExtensionInstance *v14;
  id v15;
  PBFPosterSnapshotDefinition *v16;
  id v17;
  id v18;
  id v19;
  PBFPosterSnapshotDefinition *definition;
  PBFPosterSnapshotDefinition *v21;
  PFPosterExtensionInstance *extensionInstance;
  PFPosterExtensionInstance *v23;
  _PBFPosterSceneSnapshotViewController *v24;
  objc_super v26;

  v14 = (PFPosterExtensionInstance *)a3;
  v15 = a7;
  v16 = (PBFPosterSnapshotDefinition *)a8;
  objc_storeStrong((id *)&self->_preview, a7);
  v17 = a6;
  v18 = a5;
  v19 = a4;
  definition = self->_definition;
  self->_definition = v16;
  v21 = v16;

  extensionInstance = self->_extensionInstance;
  self->_extensionInstance = v14;
  v23 = v14;

  v26.receiver = self;
  v26.super_class = (Class)_PBFPosterSceneSnapshotViewController;
  v24 = -[PRSceneViewController initWithProvider:contents:configurableOptions:configuredProperties:additionalInfo:](&v26, sel_initWithProvider_contents_configurableOptions_configuredProperties_additionalInfo_, v23, v19, v18, v17, 0);

  if (v24)
  {
    -[PRSceneViewController setSceneUserInteractionEnabled:](v24, "setSceneUserInteractionEnabled:", 0);
    -[PRRenderingSceneViewController setShowDebugGear:](v24, "setShowDebugGear:", 0);
  }

  return v24;
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PBFPosterSceneSnapshotViewController;
  -[PRSceneViewController invalidate](&v3, sel_invalidate);
  -[_PBFPosterSceneSnapshotViewController setState:](self, "setState:", 2);
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  char v7;
  id v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(obj, "isEqual:", WeakRetained);

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if (self->_state == 2)
    {
      v6 = objc_loadWeakRetained((id *)&self->_delegate);
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v8, "sceneSnapshotViewController:stateChangedTo:", self, 2);

      }
    }
  }

}

- (void)setState:(int64_t)a3
{
  int64_t state;
  id v7;

  state = self->_state;
  if (state != a3 && state != 2)
  {
    -[_PBFPosterSceneSnapshotViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sceneSnapshotViewController:stateWillChangeFrom:to:", self, state, a3);
    self->_state = a3;
    objc_msgSend(v7, "sceneSnapshotViewController:stateChangedTo:", self, a3);

  }
}

- (void)setDisplayContext:(id)a3
{
  double v5;
  double v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqualToDisplayContext:", self->_displayContext) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_displayContext, a3);
    objc_msgSend(v7, "pbf_referenceBounds");
    -[PRSceneViewController _updateSceneToSize:orientation:withAnimationSettings:fence:](self, "_updateSceneToSize:orientation:withAnimationSettings:fence:", objc_msgSend(v7, "pbf_interfaceOrientation"), 0, 0, v5, v6);
  }

}

- (void)setScenePresenterIsValid:(BOOL)a3
{
  if (self->_scenePresenterIsValid != a3)
  {
    self->_scenePresenterIsValid = a3;
    -[PRSceneViewController _update](self, "_update");
  }
}

- (void)_failWithFatalError:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PBFPosterSceneSnapshotViewController;
  -[PRSceneViewController _failWithFatalError:](&v4, sel__failWithFatalError_, a3);
  -[_PBFPosterSceneSnapshotViewController invalidate](self, "invalidate");
}

- (void)_configureInitialSceneSettings:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_PBFPosterSceneSnapshotViewController;
  v4 = a3;
  -[PRSceneViewController _configureInitialSceneSettings:](&v5, sel__configureInitialSceneSettings_, v4);
  -[_PBFPosterSceneSnapshotViewController _myUpdateSettings:](self, "_myUpdateSettings:", v4, v5.receiver, v5.super_class);

}

- (void)_myUpdateSettings:(id)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v27 = a3;
  if (-[PRPosterSnapshotDefinition isUnlocked](self->_definition, "isUnlocked"))
    v4 = 1.0;
  else
    v4 = 0.0;
  -[PBFPosterPreview previewUniqueIdentifier](self->_preview, "previewUniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSceneViewController configuredProperties](self, "configuredProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "complicationLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inlineComplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  v10 = -[PRPosterSnapshotDefinition includesHeaderElements](self->_definition, "includesHeaderElements");
  objc_msgSend(v6, "complicationLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "complications");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") != 0;

  objc_msgSend(v6, "complicationLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sidebarComplications");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count") != 0;

  objc_msgSend(v6, "titleStyleConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "prefersVerticalTitleLayout");

  -[_PBFPosterSceneSnapshotViewController traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceStyle");

  objc_msgSend(v27, "pui_setSnapshot:", 0);
  objc_msgSend(v27, "pui_setContent:", 1);
  objc_msgSend(v27, "pui_setMode:", 1);
  objc_msgSend(v27, "pr_setUnlockProgress:", v4);
  objc_msgSend(v27, "pui_setPreviewIdentifier:", v5);
  objc_msgSend(v6, "titleStyleConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pr_setPosterTitleStyleConfiguration:", v20);

  objc_msgSend(v6, "ambientConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "pr_setPosterAmbientConfiguration:", v21);

  objc_msgSend(v27, "pui_setInlineComplicationConfigured:", v9);
  objc_msgSend(v27, "pui_setComplicationRowConfigured:", v13);
  objc_msgSend(v27, "pui_setComplicationSidebarConfigured:", v16);
  objc_msgSend(v27, "pui_setShowsComplications:", 0);
  objc_msgSend(v27, "pui_setShowsHeaderElements:", v10);
  objc_msgSend(v27, "pui_setUserInterfaceStyle:", v19);
  -[_PBFPosterSceneSnapshotViewController displayContext](self, "displayContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "pbf_interfaceOrientation");
  v24 = objc_msgSend(v27, "pr_setDepthEffectDisallowed:", PRIsDepthEffectDisallowed());
  if (MEMORY[0x1D17A2F74](v24))
  {
    objc_msgSend(v27, "pui_setDeviceOrientation:", v23);
    v25 = 1;
  }
  else
  {
    if (PFCurrentDeviceClass() == 1)
      v26 = v23;
    else
      v26 = 1;
    objc_msgSend(v27, "pui_setDeviceOrientation:", v26);
    v25 = objc_msgSend(v22, "pbf_interfaceOrientation");
  }
  objc_msgSend(v27, "setInterfaceOrientation:", v25);

}

- (void)_sceneContentReadinessDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PBFPosterSceneSnapshotViewController;
  -[PRSceneViewController _sceneContentReadinessDidChange](&v3, sel__sceneContentReadinessDidChange);
  -[_PBFPosterSceneSnapshotViewController setState:](self, "setState:", -[PRSceneViewController isSceneContentReady](self, "isSceneContentReady"));
}

- (void)_teardown
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PBFPosterSceneSnapshotViewController;
  -[PRSceneViewController _teardown](&v3, sel__teardown);
  -[_PBFPosterSceneSnapshotViewController setState:](self, "setState:", 2);
}

- (BOOL)scenePresenterIsValid
{
  return self->_scenePresenterIsValid;
}

- (int64_t)state
{
  return self->_state;
}

- (_PBFPosterSceneSnapshotViewControllerDelegate)delegate
{
  return (_PBFPosterSceneSnapshotViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PFPosterExtensionInstance)extensionInstance
{
  return self->_extensionInstance;
}

- (PBFPosterPreview)preview
{
  return self->_preview;
}

- (PBFPosterSnapshotDefinition)definition
{
  return self->_definition;
}

- (PBFDisplayContext)displayContext
{
  return self->_displayContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayContext, 0);
  objc_storeStrong((id *)&self->_definition, 0);
  objc_storeStrong((id *)&self->_preview, 0);
  objc_storeStrong((id *)&self->_extensionInstance, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
