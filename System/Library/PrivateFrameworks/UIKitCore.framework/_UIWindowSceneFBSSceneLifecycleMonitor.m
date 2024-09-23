@implementation _UIWindowSceneFBSSceneLifecycleMonitor

- (int64_t)currentActivationState
{
  void *v3;
  void *v4;
  int64_t v5;

  if (!self->_connected)
    return -1;
  if (self->_transitioning)
    return -[NSNumber integerValue](self->_transitioningState, "integerValue");
  -[_UISceneLifecycleMonitor _scene](self, "_scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_effectiveSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[UIScene _activationStateFromSceneSettings:](UIScene, "_activationStateFromSceneSettings:", v4);

  return v5;
}

- (void)transitionToTargetState:(id)a3 fromState:(id)a4 withTransitionContext:(id)a5 preparations:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  int64_t v16;
  void (**v17)(_QWORD, _QWORD);
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void (**v22)(void *, int64_t, BOOL);
  void (**v23)(void *, int64_t, BOOL);
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  void (**v38)(void *, int64_t, BOOL);
  id v39;
  id v40;
  uint64_t *v41;
  SEL v42;
  unsigned int v43;
  _QWORD v44[5];
  _QWORD v45[5];
  _QWORD aBlock[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__23;
  v51 = __Block_byref_object_dispose__23;
  -[_UISceneLifecycleMonitor _scene](self, "_scene");
  v52 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)v48[5], "_hasLifecycle") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneLifecycleMonitor.m"), 189, CFSTR("attemmpting to use %@ for invalid frame subtype: %@ that doesn't expect lifecycle"), v30, v32);

  }
  objc_msgSend((id)v48[5], "_FBSScene");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = +[UIScene _activationStateFromSceneSettings:](UIScene, "_activationStateFromSceneSettings:", v12);
  v33 = (void *)v15;
  v34 = v11;
  v17 = (void (**)(_QWORD, _QWORD))v14;
  v35 = v12;
  v36 = v13;
  v18 = _UISceneLifecycleCompositeActionMaskFromStateToState__staticStateMap[4 * v16
                                                                           + 5
                                                                           + +[UIScene _activationStateFromSceneSettings:](UIScene, "_activationStateFromSceneSettings:", v11)];
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke;
  aBlock[3] = &unk_1E16B14C0;
  aBlock[4] = &v47;
  v20 = _Block_copy(aBlock);
  v45[0] = v19;
  v45[1] = 3221225472;
  v45[2] = __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_2;
  v45[3] = &unk_1E16B14C0;
  v45[4] = &v47;
  v21 = _Block_copy(v45);
  v44[0] = v19;
  v44[1] = 3221225472;
  v44[2] = __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_3;
  v44[3] = &unk_1E16B7780;
  v44[4] = self;
  v22 = (void (**)(void *, int64_t, BOOL))_Block_copy(v44);
  v22[2](v22, v16, v18 == 1);
  v37[0] = v19;
  v37[1] = 3221225472;
  v37[2] = __111___UIWindowSceneFBSSceneLifecycleMonitor_transitionToTargetState_fromState_withTransitionContext_preparations___block_invoke_4;
  v37[3] = &unk_1E16B77D0;
  v43 = v18;
  v37[4] = self;
  v23 = v22;
  v38 = v23;
  v41 = &v47;
  v24 = v20;
  v39 = v24;
  v25 = v21;
  v40 = v25;
  v42 = a2;
  v26 = _Block_copy(v37);
  v27 = v26;
  if (v17)
    ((void (**)(_QWORD, void *))v17)[2](v17, v26);
  else
    (*((void (**)(void *, _QWORD))v26 + 2))(v26, 0);

  _Block_object_dispose(&v47, 8);
}

- (void)willBecomeActive
{
  void *v3;
  _QWORD v4[4];
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIWindowSceneFBSSceneLifecycleMonitor;
  -[_UISceneLifecycleMonitor willBecomeActive](&v6, sel_willBecomeActive);
  -[_UIWindowSceneFBSSceneLifecycleMonitor _windowScene](self, "_windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[UIScene _systemShellOwnsInterfaceOrientation](v3) & 1) == 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __58___UIWindowSceneFBSSceneLifecycleMonitor_willBecomeActive__block_invoke;
    v4[3] = &unk_1E16B1B28;
    v5 = v3;
    objc_msgSend(v5, "_enqueuePostSettingsUpdateResponseBlock:inPhase:", v4, 0x1E16F0CA0);

  }
}

- (id)_windowScene
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[_UISceneLifecycleMonitor _scene](self, "_scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (_UIWindowSceneFBSSceneLifecycleMonitor)initWithScene:(id)a3
{
  _UIWindowSceneFBSSceneLifecycleMonitor *v3;
  _UIWindowSceneFBSSceneLifecycleMonitor *v4;
  NSNumber *transitioningState;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIWindowSceneFBSSceneLifecycleMonitor;
  v3 = -[_UISceneLifecycleMonitor initWithScene:](&v7, sel_initWithScene_, a3);
  v4 = v3;
  if (v3)
  {
    transitioningState = v3->_transitioningState;
    v3->_transitioningState = 0;

    v4->_transitioning = 0;
    v4->_connected = 0;
  }
  return v4;
}

- (void)didEnterBackground
{
  void *v3;
  _QWORD v4[4];
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIWindowSceneFBSSceneLifecycleMonitor;
  -[_UISceneLifecycleMonitor didEnterBackground](&v6, sel_didEnterBackground);
  -[_UIWindowSceneFBSSceneLifecycleMonitor _windowScene](self, "_windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[UIScene _systemShellOwnsInterfaceOrientation](v3) & 1) == 0)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60___UIWindowSceneFBSSceneLifecycleMonitor_didEnterBackground__block_invoke;
    v4[3] = &unk_1E16B1B28;
    v5 = v3;
    objc_msgSend(v5, "_enqueuePostSettingsUpdateResponseBlock:inPhase:", v4, 0x1E16F0CA0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitioningState, 0);
}

@end
