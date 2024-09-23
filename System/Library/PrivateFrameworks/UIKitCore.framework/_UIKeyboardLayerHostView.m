@implementation _UIKeyboardLayerHostView

- (void)setCurrentPresentationContext:(id)a3
{
  id v4;
  void *v5;
  char v6;
  UIScenePresenter *presenter;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_UIKeyboardLayerHostView;
  -[_UISceneLayerHostView setCurrentPresentationContext:](&v10, sel_setCurrentPresentationContext_, v4);
  -[UIScenePresenter presentationContext](self->_presenter, "presentationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_isVisibilityPropagationEnabled");
  objc_msgSend(v4, "_isVisibilityPropagationEnabled");
  v6 = BSEqualBools();

  if ((v6 & 1) == 0)
  {
    presenter = self->_presenter;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58___UIKeyboardLayerHostView_setCurrentPresentationContext___block_invoke;
    v8[3] = &unk_1E16B8198;
    v9 = v4;
    -[UIScenePresenter modifyPresentationContext:](presenter, "modifyPresentationContext:", v8);

  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FBSSceneClientSettingsDiffInspector *keyboardSceneClientSettingsDiffInspector;
  FBSSceneClientSettingsDiffInspector *v15;
  FBSSceneClientSettingsDiffInspector *v16;
  FBSSceneClientSettingsDiffInspector *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  keyboardSceneClientSettingsDiffInspector = self->_keyboardSceneClientSettingsDiffInspector;
  if (!keyboardSceneClientSettingsDiffInspector)
  {
    v15 = (FBSSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0D231D0]);
    v16 = self->_keyboardSceneClientSettingsDiffInspector;
    self->_keyboardSceneClientSettingsDiffInspector = v15;

    v17 = self->_keyboardSceneClientSettingsDiffInspector;
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __102___UIKeyboardLayerHostView_scene_didUpdateClientSettingsWithDiff_oldClientSettings_transitionContext___block_invoke;
    v21 = &unk_1E16B81E0;
    objc_copyWeak(&v22, &location);
    -[FBSSceneClientSettingsDiffInspector observePreferredSceneHostIdentityWithBlock:](v17, "observePreferredSceneHostIdentityWithBlock:", &v18);
    objc_destroyWeak(&v22);
    keyboardSceneClientSettingsDiffInspector = self->_keyboardSceneClientSettingsDiffInspector;
  }
  -[FBSSceneClientSettingsDiffInspector inspectDiff:withContext:](keyboardSceneClientSettingsDiffInspector, "inspectDiff:withContext:", v11, 0, v18, v19, v20, v21);
  objc_destroyWeak(&location);

}

- (void)_setKeyboardScene:(id)a3
{
  FBScene *v5;
  BSInvalidatable *keyboardSceneAvailabilityObserver;
  FBScene *keyboardScene;
  FBScene *v8;
  void *v9;

  v5 = (FBScene *)a3;
  if (self->_keyboardScene)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKeyboardLayerHostView.m"), 137, CFSTR("Cannot already have a keyboard scene."));

  }
  -[BSInvalidatable invalidate](self->_keyboardSceneAvailabilityObserver, "invalidate");
  keyboardSceneAvailabilityObserver = self->_keyboardSceneAvailabilityObserver;
  self->_keyboardSceneAvailabilityObserver = 0;

  -[FBScene removeObserver:](self->_keyboardScene, "removeObserver:", self);
  keyboardScene = self->_keyboardScene;
  self->_keyboardScene = v5;
  v8 = v5;

  -[FBScene addObserver:](self->_keyboardScene, "addObserver:", self);
  -[_UIKeyboardLayerHostView _updatePairingState](self, "_updatePairingState");
}

- (id)_initWithLayer:(id)a3 owningScene:(id)a4 keyboardMatchingPredicate:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UIKeyboardLayerHostView *v12;
  void *v13;
  id sceneLayerMatchingPredicate;
  void *v15;
  uint64_t v16;
  BSInvalidatable *keyboardSceneAvailabilityObserver;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKeyboardLayerHostView.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

    if (v11)
      goto LABEL_4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKeyboardLayerHostView.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layer"));

  if (!v10)
    goto LABEL_10;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKeyboardLayerHostView.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate"));

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)_UIKeyboardLayerHostView;
  v12 = -[_UISceneLayerHostView initWithSceneLayer:](&v25, sel_initWithSceneLayer_, v9);
  if (v12)
  {
    v13 = _Block_copy(v11);
    sceneLayerMatchingPredicate = v12->_sceneLayerMatchingPredicate;
    v12->_sceneLayerMatchingPredicate = v13;

    objc_storeStrong((id *)&v12->_owningScene, a4);
    objc_initWeak(&location, v12);
    v15 = (void *)MEMORY[0x1E0D22968];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __81___UIKeyboardLayerHostView__initWithLayer_owningScene_keyboardMatchingPredicate___block_invoke;
    v22[3] = &unk_1E16B8148;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v15, "observeKeyboardSceneAvailability:", v22);
    v16 = objc_claimAutoreleasedReturnValue();
    keyboardSceneAvailabilityObserver = v12->_keyboardSceneAvailabilityObserver;
    v12->_keyboardSceneAvailabilityObserver = (BSInvalidatable *)v16;

    if (v12->_keyboardScene)
      -[_UIKeyboardLayerHostView _updatePairingState](v12, "_updatePairingState");
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)_updatePairingState
{
  FBScene *keyboardScene;
  void *v5;
  FBSSceneIdentityToken *v6;
  FBSSceneIdentityToken *keyboardPreferredHostIdentity;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  UIScenePresenter *v13;
  UIScenePresenter *presenter;
  UIScenePresenter *v15;
  void *v16;
  UIScenePresenter *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];

  keyboardScene = self->_keyboardScene;
  if (!keyboardScene || !self->_owningScene)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIKeyboardLayerHostView.m"), 152, CFSTR("Require a keyboard scene."));

    keyboardScene = self->_keyboardScene;
  }
  -[FBScene clientSettings](keyboardScene, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredSceneHostIdentity");
  v6 = (FBSSceneIdentityToken *)objc_claimAutoreleasedReturnValue();
  keyboardPreferredHostIdentity = self->_keyboardPreferredHostIdentity;
  self->_keyboardPreferredHostIdentity = v6;

  v8 = (*((uint64_t (**)(void))self->_sceneLayerMatchingPredicate + 2))();
  if (self->_isPaired != v8)
  {
    self->_isPaired = v8;
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0CB3940]);
      v10 = _updatePairingState___hostViewRequesterCount++;
      -[FBScene identifier](self->_keyboardScene, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("UIKeyboardSceneLayerHostView-%i:%@"), v10, v11);

      -[FBScene uiPresentationManager](self->_keyboardScene, "uiPresentationManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "createPresenterWithIdentifier:priority:", v19, objc_msgSend(v12, "_defaultPresentationPriority") - 1);
      v13 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
      presenter = self->_presenter;
      self->_presenter = v13;

      v15 = self->_presenter;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __47___UIKeyboardLayerHostView__updatePairingState__block_invoke;
      v20[3] = &unk_1E16B8198;
      v20[4] = self;
      -[UIScenePresenter modifyPresentationContext:](v15, "modifyPresentationContext:", v20);
      -[UIScenePresenter activate](self->_presenter, "activate");
      -[UIScenePresenter presentationView](self->_presenter, "presentationView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView addSubview:](self, "addSubview:", v16);

    }
    else
    {
      -[UIScenePresenter invalidate](self->_presenter, "invalidate");
      v17 = self->_presenter;
      self->_presenter = 0;

    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[UIScenePresenter invalidate](self->_presenter, "invalidate");
  -[FBScene removeObserver:](self->_keyboardScene, "removeObserver:", self);
  -[BSInvalidatable invalidate](self->_keyboardSceneAvailabilityObserver, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_UIKeyboardLayerHostView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (_UIKeyboardLayerHostView)initWithKeyboardLayer:(id)a3 owningScene:(id)a4
{
  id v6;
  id v7;
  id v8;
  _UIKeyboardLayerHostView *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62___UIKeyboardLayerHostView_initWithKeyboardLayer_owningScene___block_invoke;
  v11[3] = &unk_1E16B8170;
  objc_copyWeak(&v13, &location);
  v8 = v7;
  v12 = v8;
  v9 = -[_UIKeyboardLayerHostView _initWithLayer:owningScene:keyboardMatchingPredicate:](self, "_initWithLayer:owningScene:keyboardMatchingPredicate:", v6, v8, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_keyboardPreferredHostIdentity, 0);
  objc_storeStrong((id *)&self->_keyboardSceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_keyboardSceneAvailabilityObserver, 0);
  objc_storeStrong((id *)&self->_keyboardScene, 0);
  objc_storeStrong((id *)&self->_owningScene, 0);
  objc_storeStrong(&self->_sceneLayerMatchingPredicate, 0);
}

- (_UIKeyboardLayerHostView)initWithKeyboardProxyLayer:(id)a3 owningScene:(id)a4
{
  id v6;
  id v7;
  id v8;
  _UIKeyboardLayerHostView *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67___UIKeyboardLayerHostView_initWithKeyboardProxyLayer_owningScene___block_invoke;
  v11[3] = &unk_1E16B8170;
  objc_copyWeak(&v13, &location);
  v8 = v6;
  v12 = v8;
  v9 = -[_UIKeyboardLayerHostView _initWithLayer:owningScene:keyboardMatchingPredicate:](self, "_initWithLayer:owningScene:keyboardMatchingPredicate:", v8, v7, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

- (void)setInheritsSecurity:(BOOL)a3
{
  UIScenePresenter *presenter;
  _QWORD v6[4];
  BOOL v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIKeyboardLayerHostView;
  -[_UISceneLayerHostView setInheritsSecurity:](&v8, sel_setInheritsSecurity_);
  if (self->_isPaired)
  {
    presenter = self->_presenter;
    if (presenter)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __48___UIKeyboardLayerHostView_setInheritsSecurity___block_invoke;
      v6[3] = &__block_descriptor_33_e43_v16__0__UIMutableScenePresentationContext_8l;
      v7 = a3;
      -[UIScenePresenter modifyPresentationContext:](presenter, "modifyPresentationContext:", v6);
    }
  }
}

@end
