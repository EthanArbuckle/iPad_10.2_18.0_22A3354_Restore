@implementation SBSystemActionSceneElementProvider

+ (uint64_t)providesSceneElementForSystemAction:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "configuredAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("VoiceMemos")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("Translate")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("MusicRecognition")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("Shortcuts"));
  }

  return v5;
}

+ (id)previewContextForSystemAction:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v2 = a2;
  objc_opt_self();
  +[SBSystemApertureSceneElement activeElements](SBSystemApertureSceneElement, "activeElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__SBSystemActionSceneElementProvider_previewContextForSystemAction___block_invoke;
  v9[3] = &unk_1E8EA6090;
  v10 = v2;
  v4 = v2;
  objc_msgSend(v3, "bs_firstObjectPassingTest:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("SBSystemActionSceneElementPreviewContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __68__SBSystemActionSceneElementProvider_previewContextForSystemAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("SBSystemActionSceneElementSystemAction"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));
  return v5;
}

- (id)initWithSystemAction:(void *)a3 systemApertureController:(void *)a4 context:
{
  id v8;
  id v9;
  id v10;
  id *v11;
  void *v13;
  objc_super v14;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (!a1)
    goto LABEL_6;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("systemAction != ((void *)0)"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionSceneElementProvider initWithSystemAction:systemApertureController:context:].cold.1(sel_initWithSystemAction_systemApertureController_context_);
LABEL_12:
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D07A0110);
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("systemApertureController != ((void *)0)"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionSceneElementProvider initWithSystemAction:systemApertureController:context:].cold.2(sel_initWithSystemAction_systemApertureController_context_);
    goto LABEL_12;
  }
  v14.receiver = a1;
  v14.super_class = (Class)SBSystemActionSceneElementProvider;
  v11 = (id *)objc_msgSendSuper2(&v14, sel_init);
  a1 = v11;
  if (v11)
  {
    objc_storeStrong(v11 + 10, a2);
    objc_storeWeak(a1 + 1, v9);
    objc_storeStrong(a1 + 4, a4);
    -[SBSystemActionSceneElementProvider _configureIdentificationWithContext:]((uint64_t)a1, v10);
    -[SBSystemActionSceneElementProvider _configurePlaceholderContentProviders]((uint64_t)a1);
  }
LABEL_6:

  return a1;
}

- (void)_configureIdentificationWithContext:(uint64_t)a1
{
  void *v3;
  id v4;
  SBSAElementIdentification *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  if (a1)
  {
    v8 = 0;
    v9 = 0;
    +[SBSystemActionSceneElementProvider _getClientIdentifier:elementIdentifier:forSystemAction:withContext:]((uint64_t)SBSystemActionSceneElementProvider, &v9, &v8, *(void **)(a1 + 80), a2);
    v3 = v9;
    v4 = v8;
    v7 = v3;
    v5 = -[SBSAElementIdentification initWithClientIdentifier:elementIdentifier:]([SBSAElementIdentification alloc], "initWithClientIdentifier:elementIdentifier:", v7, v4);
    v6 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = v5;

  }
}

- (void)_configurePlaceholderContentProviders
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)providesElementForSystemAction:(void *)a3 withContext:
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  id v10;

  v3 = a1;
  if (a1)
  {
    v9 = 0;
    v10 = 0;
    +[SBSystemActionSceneElementProvider _getClientIdentifier:elementIdentifier:forSystemAction:withContext:]((uint64_t)SBSystemActionSceneElementProvider, &v10, &v9, a2, a3);
    v4 = v10;
    v5 = v9;
    objc_msgSend(v3, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v4))
    {
      objc_msgSend(v3, "elementIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v7, "isEqualToString:", v5);

    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

+ (void)_getClientIdentifier:(_QWORD *)a3 elementIdentifier:(void *)a4 forSystemAction:(void *)a5 withContext:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v22 = a5;
  v8 = a4;
  objc_opt_self();
  objc_msgSend(v8, "configuredAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sectionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(v9, "associatedBundleIdentifier");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v22, "elementIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = (void *)*MEMORY[0x1E0DAC958];
  if (v15)
    v17 = (void *)v15;
  v18 = v17;

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("VoiceMemos")))
  {
    v19 = (id)*MEMORY[0x1E0DAC9A8];

    v18 = v19;
  }
  v20 = objc_retainAutorelease(v14);
  *a2 = v20;
  v21 = objc_retainAutorelease(v18);
  *a3 = v21;

}

- (id)previewForReason:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  SBSystemApertureSceneElement *v6;
  id WeakRetained;
  SBSystemApertureSceneElement *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  SBSystemActionCompoundPreviewAssertion *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id from;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  id v24;
  id location;
  _QWORD v26[5];

  v3 = a2;
  if (a1)
  {
    +[SBSystemApertureSceneElement activeElements](SBSystemApertureSceneElement, "activeElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke;
    v26[3] = &unk_1E8EA6090;
    v26[4] = a1;
    objc_msgSend(v4, "bs_firstObjectPassingTest:", v26);
    v6 = (SBSystemApertureSceneElement *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, (id)a1);
    if (!v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      v8 = [SBSystemApertureSceneElement alloc];
      v21[0] = v5;
      v21[1] = 3221225472;
      v21[2] = __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_2;
      v21[3] = &unk_1E8EA6108;
      objc_copyWeak(&v24, &location);
      v9 = WeakRetained;
      v22 = v9;
      v23 = a1;
      v6 = -[SBSystemApertureSceneElement initWithScene:placeholderContentProvider:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:](v8, "initWithScene:placeholderContentProvider:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:", 0, a1, v9, v21);
      objc_storeStrong((id *)(a1 + 88), v6);

      objc_destroyWeak(&v24);
    }
    if (!-[SBSystemApertureSceneElement isActivated](v6, "isActivated"))
      -[SBSystemApertureSceneElement activate](v6, "activate");
    -[SBSystemApertureSceneElement userInfo](v6, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", *(_QWORD *)(a1 + 80), CFSTR("SBSystemActionSceneElementSystemAction"));
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("SBSystemActionSceneElementPreviewContext"));
    objc_msgSend(v10, "objectForKey:", CFSTR("SBSystemActionSceneElementCompoundPreviewAssertion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_initWeak(&from, v6);
      v13 = [SBSystemActionCompoundPreviewAssertion alloc];
      v17[0] = v5;
      v17[1] = 3221225472;
      v17[2] = __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_5;
      v17[3] = &unk_1E8EA6130;
      objc_copyWeak(&v18, &from);
      objc_copyWeak(&v19, &location);
      v15[0] = v5;
      v15[1] = 3221225472;
      v15[2] = __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_6;
      v15[3] = &unk_1E8EA6158;
      objc_copyWeak(&v16, &from);
      v12 = -[SBSystemActionCompoundPreviewAssertion initWithIdentifier:stateDidChangeBlock:eventHandlingBlock:](v13, CFSTR("Scene Previewing"), v17, v15);
      objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("SBSystemActionSceneElementCompoundPreviewAssertion"));
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&from);
    }
    -[SBSystemActionCompoundPreviewAssertion acquireForReason:]((uint64_t)v12, v3);
    a1 = objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&location);
  }

  return (id)a1;
}

uint64_t __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(v3, "elementIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "elementIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id v5;
  _QWORD *WeakRetained;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "registerElement:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)WeakRetained[6];
    WeakRetained[6] = v7;

    v9 = (void *)WeakRetained[6];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_3;
    v10[3] = &unk_1E8EA60E0;
    v10[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "addInvalidationBlock:", v10);
  }

}

void __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  if (objc_msgSend(v2, "isActivated") && (objc_msgSend(v2, "isDeactivating") & 1) == 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_4;
    v5[3] = &unk_1E8EA60B8;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v2, "deactivateWhenRemovedWithHandler:", v5);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 48);
    *(_QWORD *)(v3 + 48) = 0;

  }
}

void __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  *(_QWORD *)(v1 + 48) = 0;

}

void __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_5(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  id v4;
  id WeakRetained;

  v3 = -[SBSystemActionCompoundPreviewAssertion state](a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setPreviewing:", v3 & 1);
  objc_msgSend(WeakRetained, "setUrgent:", HIBYTE(v3) & 1);
  objc_msgSend(WeakRetained, "setExpanding:", (v3 >> 8) & 1);
  objc_msgSend(WeakRetained, "setProminent:", HIWORD(v3) & 1);
  if ((v3 & 1) == 0)
  {
    v4 = objc_loadWeakRetained((id *)(a1 + 40));
    -[SBSystemActionSceneElementProvider _deactivateAndRemoveSceneElementIfNecessaryWithReason:]((uint64_t)v4, CFSTR("Compound previewing ended"));

  }
}

- (void)_deactivateAndRemoveSceneElementIfNecessaryWithReason:(uint64_t)a1
{
  id v3;
  id v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    v3 = *(id *)(a1 + 88);
    v4 = *(id *)(a1 + 48);
    if (v4)
    {
      if (objc_msgSend(v3, "isActivated") && (objc_msgSend(v3, "isDeactivating") & 1) == 0)
        objc_msgSend(v3, "deactivateWhenRemovedWithHandler:", 0);
      if (objc_msgSend(v4, "isValid"))
        objc_msgSend(v4, "invalidateWithReason:", v5);
    }

  }
}

void __55__SBSystemActionSceneElementProvider_previewForReason___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  if (!a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "pop");

  }
}

- (NSString)elementIdentifier
{
  return (NSString *)-[SAElementIdentifying elementIdentifier](self->_elementIdentification, "elementIdentifier");
}

- (NSString)clientIdentifier
{
  return (NSString *)-[SAElementIdentifying clientIdentifier](self->_elementIdentification, "clientIdentifier");
}

- (UIView)leadingView
{
  UIView *leadingView;
  SBUISystemApertureContentViewProviding *v4;
  UIView *v5;
  UIView *v6;

  leadingView = self->_leadingView;
  if (!leadingView)
  {
    v4 = self->_leadingPlaceholderContentViewProvider;
    -[SBUISystemApertureContentViewProviding setContentContainer:](v4, "setContentContainer:", self);
    -[SBUISystemApertureContentViewProviding providedView](v4, "providedView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_leadingView;
    self->_leadingView = v5;

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  UIView *trailingView;
  SBUISystemApertureContentViewProviding *v4;
  UIView *v5;
  UIView *v6;

  trailingView = self->_trailingView;
  if (!trailingView)
  {
    v4 = self->_trailingPlaceholderContentViewProvider;
    -[SBUISystemApertureContentViewProviding setContentContainer:](v4, "setContentContainer:", self);
    -[SBUISystemApertureContentViewProviding providedView](v4, "providedView");
    v5 = (UIView *)objc_claimAutoreleasedReturnValue();
    v6 = self->_trailingView;
    self->_trailingView = v5;

    trailingView = self->_trailingView;
  }
  return trailingView;
}

- (int64_t)contentRole
{
  return 2;
}

- (unint64_t)presentationBehaviors
{
  return 8;
}

- (void)noteSceneClientWantsControlOfElementWithAssertionTransferBlock:(id)a3
{
  SAInvalidatable *elementAssertion;
  SAInvalidatable *v5;
  void (**v6)(id, id);

  elementAssertion = self->_elementAssertion;
  self->_elementAssertion = 0;
  v5 = elementAssertion;
  v6 = (void (**)(id, id))a3;

  v6[2](v6, v5);
}

- (UIColor)keyColor
{
  return self->_keyColor;
}

- (void)preferredContentSizeDidInvalidateForContentViewProvider:(id)a3
{
  SBSystemApertureSceneElement *sceneElement;
  SBSystemApertureSceneElement *v4;
  id v5;

  if (self)
    sceneElement = self->_sceneElement;
  else
    sceneElement = 0;
  v4 = sceneElement;
  -[SBSystemApertureSceneElement layoutHost](v4, "layoutHost");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneElement, 0);
  objc_storeStrong((id *)&self->_systemAction, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_storeStrong((id *)&self->_keyColor, 0);
  objc_storeStrong((id *)&self->_elementAssertion, 0);
  objc_storeStrong((id *)&self->_elementIdentification, 0);
  objc_storeStrong((id *)&self->_previewContext, 0);
  objc_storeStrong((id *)&self->_trailingPlaceholderContentViewProvider, 0);
  objc_storeStrong((id *)&self->_leadingPlaceholderContentViewProvider, 0);
  objc_destroyWeak((id *)&self->_systemApertureController);
}

- (void)initWithSystemAction:(const char *)a1 systemApertureController:context:.cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithSystemAction:(const char *)a1 systemApertureController:context:.cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
