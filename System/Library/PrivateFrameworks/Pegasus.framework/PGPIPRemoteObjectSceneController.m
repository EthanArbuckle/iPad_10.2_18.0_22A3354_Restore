@implementation PGPIPRemoteObjectSceneController

+ (id)sharedSceneWorkspace
{
  if (sharedSceneWorkspace_onceToken != -1)
    dispatch_once(&sharedSceneWorkspace_onceToken, &__block_literal_global_12);
  return (id)sharedSceneWorkspace_shared;
}

void __56__PGPIPRemoteObjectSceneController_sharedSceneWorkspace__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22988]), "initWithIdentifier:", CFSTR("com.apple.pegasus.pictureinpicture"));
  v1 = (void *)sharedSceneWorkspace_shared;
  sharedSceneWorkspace_shared = v0;

}

- (PGPIPRemoteObjectSceneController)initWithRemoteObject:(id)a3 requestedSceneIdentifier:(id)a4 affectsAppLifeCycle:(BOOL)a5
{
  id v7;
  id v8;
  PGPIPRemoteObjectSceneController *v9;
  PGPIPRemoteObjectSceneController *v10;
  void *v11;
  void *v12;
  void *v13;
  FBScene *v14;
  FBScene *scene;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  FBScene *v26;
  uint64_t v27;
  FBScene *v28;
  _QWORD v30[5];
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  objc_super v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  FBScene *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)PGPIPRemoteObjectSceneController;
  v9 = -[PGPIPRemoteObjectSceneController init](&v35, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeWeak((id *)&v9->_remoteObject, v7);
    objc_msgSend((id)objc_opt_class(), "sharedSceneWorkspace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sceneWithIdentifier:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
      scene = v10->_scene;
      v10->_scene = v14;
LABEL_9:

      goto LABEL_10;
    }
    v16 = (void *)MEMORY[0x1E0D87D68];
    v17 = (void *)MEMORY[0x1E0D87D70];
    objc_msgSend(v7, "pictureInPictureApplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifierWithPid:", objc_msgSend(v18, "processIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(v16, "handleForIdentifier:error:", v19, &v34);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    scene = (FBScene *)v34;

    if (v20)
    {
      objc_msgSend(v20, "identity");
      v21 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D231C0], "identityForProcessIdentity:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __102__PGPIPRemoteObjectSceneController_initWithRemoteObject_requestedSceneIdentifier_affectsAppLifeCycle___block_invoke;
      v31[3] = &unk_1E62307F8;
      v32 = v22;
      v33 = v8;
      v24 = v22;
      objc_msgSend(v11, "createScene:", v31);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v10->_scene;
      v10->_scene = (FBScene *)v25;

      v27 = objc_msgSend(v7, "sourceSceneSettingsInterfaceOrientation");
      v28 = v10->_scene;
      v30[0] = v23;
      v30[1] = 3221225472;
      v30[2] = __102__PGPIPRemoteObjectSceneController_initWithRemoteObject_requestedSceneIdentifier_affectsAppLifeCycle___block_invoke_2;
      v30[3] = &__block_descriptor_40_e35_v16__0__FBSMutableSceneParameters_8l;
      v30[4] = v27;
      -[FBScene configureParameters:](v28, "configureParameters:", v30);

    }
    else
    {
      PGLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        goto LABEL_8;
      _PGLogMethodProem(v10, 1);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v24;
      v38 = 2112;
      v39 = scene;
      _os_log_error_impl(&dword_1B0CD6000, v21, OS_LOG_TYPE_ERROR, "%@ not able to create scene, RBSProcessHandle look up failed with error: %@", buf, 0x16u);
    }

LABEL_8:
    goto LABEL_9;
  }
LABEL_10:

  return v10;
}

void __102__PGPIPRemoteObjectSceneController_initWithRemoteObject_requestedSceneIdentifier_affectsAppLifeCycle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  PGPIPRemoteObjectSceneSpecification *v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setClientIdentity:", v3);
  objc_msgSend(v4, "setIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = objc_alloc_init(PGPIPRemoteObjectSceneSpecification);
  objc_msgSend(v4, "setSpecification:", v5);

}

uint64_t __102__PGPIPRemoteObjectSceneController_initWithRemoteObject_requestedSceneIdentifier_affectsAppLifeCycle___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __102__PGPIPRemoteObjectSceneController_initWithRemoteObject_requestedSceneIdentifier_affectsAppLifeCycle___block_invoke_3;
  v3[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "updateSettingsWithBlock:", v3);
}

void __102__PGPIPRemoteObjectSceneController_initWithRemoteObject_requestedSceneIdentifier_affectsAppLifeCycle___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setInterfaceOrientation:", v2);
  objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayConfiguration:", v3);

  objc_msgSend(v4, "setInterfaceOrientationMode:", 2);
  objc_msgSend(v4, "setInterruptionPolicy:", 1);

}

- (UIView)sceneView
{
  UIView *sceneView;
  UIScenePresenter *scenePresenter;
  void *v5;
  void *v6;
  void *v7;
  UIScenePresenter *v8;
  UIScenePresenter *v9;
  UIView *v10;
  UIView *v11;

  sceneView = self->_sceneView;
  if (!sceneView)
  {
    scenePresenter = self->_scenePresenter;
    if (!scenePresenter)
    {
      -[FBScene uiPresentationManager](self->_scene, "uiPresentationManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "createPresenterWithIdentifier:", v7);
      v8 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue();
      v9 = self->_scenePresenter;
      self->_scenePresenter = v8;

      scenePresenter = self->_scenePresenter;
    }
    -[UIScenePresenter modifyPresentationContext:](scenePresenter, "modifyPresentationContext:", &__block_literal_global_110);
    -[UIScenePresenter activate](self->_scenePresenter, "activate");
    -[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
    v10 = (UIView *)objc_claimAutoreleasedReturnValue();
    v11 = self->_sceneView;
    self->_sceneView = v10;

    sceneView = self->_sceneView;
  }
  return sceneView;
}

void __45__PGPIPRemoteObjectSceneController_sceneView__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPresentedLayerTypes:", 26);
  objc_msgSend(v2, "setAppearanceStyle:", 2);

}

- (void)activateIfNeeded
{
  FBScene *scene;
  _QWORD v4[5];

  if (-[FBScene isValid](self->_scene, "isValid"))
  {
    if ((-[FBScene isActive](self->_scene, "isActive") & 1) == 0)
    {
      scene = self->_scene;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __52__PGPIPRemoteObjectSceneController_activateIfNeeded__block_invoke;
      v4[3] = &unk_1E62308A0;
      v4[4] = self;
      -[FBScene performUpdate:](scene, "performUpdate:", v4);
    }
  }
}

uint64_t __52__PGPIPRemoteObjectSceneController_activateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 24), *(double *)(*(_QWORD *)(a1 + 32) + 32), *(double *)(*(_QWORD *)(a1 + 32) + 40), *(double *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)updateInterfaceOrientation
{
  id WeakRetained;
  uint64_t v4;
  int v5;
  char v6;
  FBScene *scene;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteObject);
  v4 = objc_msgSend(WeakRetained, "sourceSceneSettingsInterfaceOrientation");

  -[FBScene settings](self->_scene, "settings");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "interfaceOrientation") == v4)
  {

  }
  else
  {
    v5 = -[FBScene isValid](self->_scene, "isValid");

    if (v5)
    {
      v6 = -[FBScene isActive](self->_scene, "isActive");
      scene = self->_scene;
      if ((v6 & 1) != 0)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __62__PGPIPRemoteObjectSceneController_updateInterfaceOrientation__block_invoke_2;
        v9[3] = &__block_descriptor_40_e33_v16__0__FBSMutableSceneSettings_8l;
        v9[4] = v4;
        -[FBScene updateSettings:](scene, "updateSettings:", v9);
      }
      else
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __62__PGPIPRemoteObjectSceneController_updateInterfaceOrientation__block_invoke;
        v10[3] = &__block_descriptor_40_e63_v24__0__FBSMutableSceneSettings_8__FBSSceneTransitionContext_16l;
        v10[4] = v4;
        -[FBScene performUpdate:](scene, "performUpdate:", v10);
      }
    }
  }
}

uint64_t __62__PGPIPRemoteObjectSceneController_updateInterfaceOrientation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInterfaceOrientation:", *(_QWORD *)(a1 + 32));
}

uint64_t __62__PGPIPRemoteObjectSceneController_updateInterfaceOrientation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setInterfaceOrientation:", *(_QWORD *)(a1 + 32));
}

- (void)updateSize:(CGSize)a3 animationType:(int64_t)a4 initialSpringVelocity:(double)a5
{
  void *v8;
  int v9;
  _QWORD v10[5];
  _QWORD v11[6];
  _QWORD v12[5];
  id v13;

  self->_currentFrame.size = a3;
  self->_currentFrame.origin = (CGPoint)*MEMORY[0x1E0C9D538];
  if (-[FBScene isActive](self->_scene, "isActive"))
  {
    -[FBScene settings](self->_scene, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isForeground");

    if (v9)
    {
      v12[0] = 0;
      v12[1] = v12;
      v12[2] = 0x3032000000;
      v12[3] = __Block_byref_object_copy__2;
      v12[4] = __Block_byref_object_dispose__2;
      objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v10[4] = v12;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __83__PGPIPRemoteObjectSceneController_updateSize_animationType_initialSpringVelocity___block_invoke;
      v11[3] = &unk_1E6230910;
      v11[4] = self;
      v11[5] = v12;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __83__PGPIPRemoteObjectSceneController_updateSize_animationType_initialSpringVelocity___block_invoke_3;
      v10[3] = &unk_1E6230938;
      -[PGPIPRemoteObjectSceneController _performAnimationWithType:initialSpringVelocity:animations:completion:](self, "_performAnimationWithType:initialSpringVelocity:animations:completion:", a4, v11, v10, a5);
      _Block_object_dispose(v12, 8);

    }
  }
}

void __83__PGPIPRemoteObjectSceneController_updateSize_animationType_initialSpringVelocity___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(v3 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__PGPIPRemoteObjectSceneController_updateSize_animationType_initialSpringVelocity___block_invoke_2;
  v7[3] = &unk_1E62308E8;
  v8 = v2;
  v9 = v4;
  v7[4] = v3;
  v6 = v2;
  objc_msgSend(v5, "performUpdate:", v7);

}

void __83__PGPIPRemoteObjectSceneController_updateSize_animationType_initialSpringVelocity___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  objc_msgSend(a2, "setFrame:", *(double *)(a1[4] + 24), *(double *)(a1[4] + 32), *(double *)(a1[4] + 40), *(double *)(a1[4] + 48));
  v6 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  v7 = v5;
  objc_msgSend(v7, "setAnimationFence:", v6);
  objc_msgSend(v7, "setAnimationSettings:", a1[5]);

}

void __83__PGPIPRemoteObjectSceneController_updateSize_animationType_initialSpringVelocity___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1B5E0FCE8]();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  objc_autoreleasePoolPop(v2);
}

- (void)_performAnimationWithType:(int64_t)a3 initialSpringVelocity:(double)a4 animations:(id)a5 completion:(id)a6
{
  void (**v9)(id, uint64_t);
  id v10;

  v10 = a5;
  v9 = (void (**)(id, uint64_t))a6;
  switch(a3)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0CEABB0], "PG_animateUsingDefaultDampedSpringWithInitialSpringVelocity:animations:completion:", v10, v9, a4);
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0CEABB0], "PG_animateUsingDefaultTimingWithAnimations:completion:", v10, v9);
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0CEABB0], "PG_performWithoutAnimation:", v10);
      v9[2](v9, 1);
      break;
  }

}

- (void)setForeground:(BOOL)a3
{
  int v3;
  int v5;
  FBScene *v6;
  FBScene *scene;
  id v8;
  _QWORD v9[5];
  char v10;
  _QWORD v11[5];
  char v12;

  v3 = a3;
  -[FBScene settings](self->_scene, "settings");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isForeground") == v3)
  {

  }
  else
  {
    v5 = -[FBScene isValid](self->_scene, "isValid");

    if (v5)
    {
      if (v3 && (-[FBScene isActive](self->_scene, "isActive") & 1) == 0)
      {
        scene = self->_scene;
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __50__PGPIPRemoteObjectSceneController_setForeground___block_invoke;
        v11[3] = &unk_1E6230960;
        v12 = v3;
        v11[4] = self;
        -[FBScene performUpdate:](scene, "performUpdate:", v11);
      }
      else
      {
        v6 = self->_scene;
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __50__PGPIPRemoteObjectSceneController_setForeground___block_invoke_2;
        v9[3] = &unk_1E6230988;
        v10 = v3;
        v9[4] = self;
        -[FBScene updateSettings:](v6, "updateSettings:", v9);
      }
    }
  }
}

void __50__PGPIPRemoteObjectSceneController_setForeground___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setForeground:", v3);
  objc_msgSend(v4, "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 24), *(double *)(*(_QWORD *)(a1 + 32) + 32), *(double *)(*(_QWORD *)(a1 + 32) + 40), *(double *)(*(_QWORD *)(a1 + 32) + 48));

}

void __50__PGPIPRemoteObjectSceneController_setForeground___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setForeground:", v3);
  objc_msgSend(v4, "setFrame:", *(double *)(*(_QWORD *)(a1 + 32) + 24), *(double *)(*(_QWORD *)(a1 + 32) + 32), *(double *)(*(_QWORD *)(a1 + 32) + 40), *(double *)(*(_QWORD *)(a1 + 32) + 48));

}

- (BOOL)isInvalidated
{
  PGPIPRemoteObjectSceneController *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setInvalidated:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
  FBScene *v3;
  FBScene *v4;

  if (!-[PGPIPRemoteObjectSceneController isInvalidated](self, "isInvalidated"))
  {
    -[PGPIPRemoteObjectSceneController setInvalidated:](self, "setInvalidated:", 1);
    v4 = self->_scene;
    v3 = v4;
    BSDispatchMain();

  }
}

uint64_t __46__PGPIPRemoteObjectSceneController_invalidate__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "updateSettings:", &__block_literal_global_116);
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __46__PGPIPRemoteObjectSceneController_invalidate__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[PGPIPRemoteObjectSceneController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PGPIPRemoteObjectSceneController;
  -[PGPIPRemoteObjectSceneController dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_destroyWeak((id *)&self->_remoteObject);
}

@end
