@implementation _UIFocusUpdateRequest

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_destroyWeak((id *)&self->_destinationEnvironment);
}

- (_UIFocusUpdateRequest)initWithEnvironment:(id)a3
{
  id v5;
  _UIFocusUpdateRequest *v6;
  _UIFocusUpdateRequest *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusUpdateRequest.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

  }
  v10.receiver = self;
  v10.super_class = (Class)_UIFocusUpdateRequest;
  v6 = -[_UIFocusUpdateRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_focusSystem, 0);
    objc_storeWeak((id *)&v7->_environment, v5);
    objc_storeWeak((id *)&v7->_destinationEnvironment, v5);
    v7->_allowsDeferral = 1;
    v7->_allowsOverridingPreferedFocusEnvironments = 1;
  }

  return v7;
}

- (_UIFocusUpdateRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusUpdateRequest.m"), 27, CFSTR("-init is not a valid initializer for this class."));

  return 0;
}

- (_UIFocusUpdateRequest)initWithFocusSystem:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _UIFocusUpdateRequest *v10;
  _UIFocusUpdateRequest *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusUpdateRequest.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusUpdateRequest.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("environment"));

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusUpdateRequest;
  v10 = -[_UIFocusUpdateRequest init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_focusSystem, v7);
    objc_storeWeak((id *)&v11->_environment, v9);
    objc_storeWeak((id *)&v11->_destinationEnvironment, v9);
    v11->_allowsDeferral = 1;
    v11->_allowsOverridingPreferedFocusEnvironments = 1;
  }

  return v11;
}

- (_UIFocusUpdateRequest)initWithFocusSystem:(id)a3 environment:(id)a4 destinationEnvironment:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UIFocusUpdateRequest *v12;
  _UIFocusUpdateRequest *v13;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  objc_class *v19;
  void *v20;
  __CFString *v21;
  unint64_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  objc_class *v26;
  void *v27;
  __CFString *v28;
  id v29;
  void *v30;
  objc_class *v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  id v35;
  void *v36;
  objc_class *v37;
  void *v38;
  __CFString *v39;
  id v40;
  __CFString *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  id v45;
  void *v46;
  objc_class *v47;
  void *v48;
  uint8_t buf[4];
  __CFString *v50;
  __int16 v51;
  __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusUpdateRequest.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationEnvironment"));

  }
  if (!_UIFocusEnvironmentIsAncestorOfEnvironment(v10, v11))
  {
    _UIIsPrivateMainBundle();
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v11;
      if (v11)
      {
        v18 = (void *)MEMORY[0x1E0CB3940];
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@: %p>"), v20, v17);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = CFSTR("(nil)");
      }

      v29 = v10;
      if (v29)
      {
        v30 = (void *)MEMORY[0x1E0CB3940];
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "stringWithFormat:", CFSTR("<%@: %p>"), v32, v29);
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v33 = CFSTR("(nil)");
      }

      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusUpdateRequest.m"), 61, CFSTR("Cannot request a focus update to destinationEnvironment %@ from non-ancestor environment %@"), v21, v33);
      goto LABEL_4;
    }
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        goto LABEL_27;
      v40 = v11;
      if (v11)
      {
        v42 = (void *)MEMORY[0x1E0CB3940];
        v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "stringWithFormat:", CFSTR("<%@: %p>"), v44, v40);
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v41 = CFSTR("(nil)");
      }

      v34 = v41;
      v45 = v10;
      if (v45)
      {
        v46 = (void *)MEMORY[0x1E0CB3940];
        v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", CFSTR("<%@: %p>"), v48, v45);
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v39 = CFSTR("(nil)");
      }

      *(_DWORD *)buf = 138412546;
      v50 = v34;
      v51 = 2112;
      v52 = v39;
      _os_log_fault_impl(&dword_185066000, v23, OS_LOG_TYPE_FAULT, "Cannot request a focus update to destinationEnvironment %@ from non-ancestor environment %@  This will become an assert in a future version.", buf, 0x16u);
    }
    else
    {
      v22 = initWithFocusSystem_environment_destinationEnvironment____s_category;
      if (!initWithFocusSystem_environment_destinationEnvironment____s_category)
      {
        v22 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v22, (unint64_t *)&initWithFocusSystem_environment_destinationEnvironment____s_category);
      }
      v23 = *(id *)(v22 + 8);
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_27;
      v24 = v11;
      if (v11)
      {
        v25 = (void *)MEMORY[0x1E0CB3940];
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "stringWithFormat:", CFSTR("<%@: %p>"), v27, v24);
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v28 = CFSTR("(nil)");
      }

      v34 = v28;
      v35 = v10;
      if (v35)
      {
        v36 = (void *)MEMORY[0x1E0CB3940];
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("<%@: %p>"), v38, v35);
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v39 = CFSTR("(nil)");
      }

      *(_DWORD *)buf = 138412546;
      v50 = v34;
      v51 = 2112;
      v52 = v39;
      _os_log_impl(&dword_185066000, v23, OS_LOG_TYPE_ERROR, "Cannot request a focus update to destinationEnvironment %@ from non-ancestor environment %@  This will become an assert in a future version.", buf, 0x16u);
    }

LABEL_27:
  }
LABEL_4:
  v12 = -[_UIFocusUpdateRequest initWithFocusSystem:environment:](self, "initWithFocusSystem:environment:", v9, v10);
  v13 = v12;
  if (v12)
    objc_storeWeak((id *)&v12->_destinationEnvironment, v11);

  return v13;
}

+ (id)requestForRemovingFocusInFocusSystem:(id)a3
{
  id v3;
  _UIFocusUpdateRequest *v4;

  v3 = a3;
  v4 = -[_UIFocusUpdateRequest initWithFocusSystem:environment:]([_UIFocusUpdateRequest alloc], "initWithFocusSystem:environment:", v3, v3);

  v4->_isFocusRemovalRequest = 1;
  v4->_allowsFocusingCurrentItem = 1;
  return v4;
}

- (id)requestByRedirectingRequestToEnvironment:(id)a3
{
  id v4;
  id *v5;

  v4 = a3;
  v5 = (id *)-[_UIFocusUpdateRequest copy](self, "copy");
  objc_storeWeak(v5 + 4, v4);
  objc_storeWeak(v5 + 2, v4);

  objc_storeWeak(v5 + 3, 0);
  return v5;
}

- (id)requestByRedirectingRequestToNextContainerEnvironment
{
  id WeakRetained;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__217;
  v11 = __Block_byref_object_dispose__217;
  v12 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __78___UIFocusUpdateRequest_requestByRedirectingRequestToNextContainerEnvironment__block_invoke;
  v6[3] = &unk_1E16C5F90;
  v6[4] = self;
  v6[5] = &v7;
  _UIFocusEnvironmentEnumerateAncestorEnvironments(WeakRetained, v6);

  if (v8[5])
  {
    -[_UIFocusUpdateRequest requestByRedirectingRequestToEnvironment:](self, "requestByRedirectingRequestToEnvironment:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  id WeakRetained;
  uint64_t v6;
  id v7;
  id v8;

  v4 = objc_alloc((Class)objc_opt_class());
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v6 = objc_msgSend(v4, "initWithEnvironment:", WeakRetained);

  v7 = objc_loadWeakRetained((id *)&self->_focusSystem);
  objc_storeWeak((id *)(v6 + 24), v7);

  v8 = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  objc_storeWeak((id *)(v6 + 16), v8);

  *(_BYTE *)(v6 + 10) = self->_isFocusRemovalRequest;
  *(_BYTE *)(v6 + 11) = self->_shouldPlayFocusSound;
  *(_BYTE *)(v6 + 12) = self->_allowsFocusingCurrentItem;
  *(_BYTE *)(v6 + 9) = self->_allowsDeferral;
  *(_BYTE *)(v6 + 8) = self->_scrollIfNecessary;
  *(_BYTE *)(v6 + 13) = self->_allowsOverridingPreferedFocusEnvironments;
  *(_BYTE *)(v6 + 14) = self->_resetsUpdateThrottle;
  return (id)v6;
}

- (BOOL)canMergeWithRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  int v10;
  id WeakRetained;
  void *v12;
  id v13;
  id v14;
  _BOOL4 v15;
  id v16;
  id v17;
  int isFocusRemovalRequest;
  BOOL v20;

  v4 = a3;
  -[_UIFocusUpdateRequest focusSystem](self, "focusSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusSystem");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4)
    v8 = v5 == 0;
  else
    v8 = 1;
  v10 = v8 || v5 == (void *)v6;
  WeakRetained = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  if (WeakRetained)
  {
    objc_msgSend(v4, "destinationEnvironment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
      objc_msgSend(v4, "destinationEnvironment");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = v13 == v14;

    }
    else
    {
      v15 = 1;
    }

  }
  else
  {
    v15 = 1;
  }

  if (v10)
  {
    v16 = objc_loadWeakRetained((id *)&self->_environment);
    objc_msgSend(v4, "environment");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v16 == v17 && v15)
    {
      isFocusRemovalRequest = self->_isFocusRemovalRequest;
      v20 = isFocusRemovalRequest == objc_msgSend(v4, "isFocusRemovalRequest");
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)requestByMergingWithRequest:(id)a3
{
  id *v4;
  int has_internal_diagnostics;
  BOOL v6;
  _UIFocusUpdateRequest *v7;
  id WeakRetained;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v20;
  unint64_t v21;
  NSObject *v22;
  uint8_t v23[16];
  uint8_t buf[16];

  v4 = (id *)a3;
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v6 = -[_UIFocusUpdateRequest canMergeWithRequest:](self, "canMergeWithRequest:", v4);
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      __UIFaultDebugAssertLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v20, OS_LOG_TYPE_FAULT, "Cannot merge focus update requests that are not allowed to be merged.", buf, 2u);
      }

    }
  }
  else if (!v6)
  {
    v21 = requestByMergingWithRequest____s_category;
    if (!requestByMergingWithRequest____s_category)
    {
      v21 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v21, (unint64_t *)&requestByMergingWithRequest____s_category);
    }
    v22 = *(NSObject **)(v21 + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "Cannot merge focus update requests that are not allowed to be merged.", v23, 2u);
    }
  }
  v7 = [_UIFocusUpdateRequest alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  v9 = -[_UIFocusUpdateRequest initWithEnvironment:](v7, "initWithEnvironment:", WeakRetained);

  v10 = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (v10)
  {
    objc_storeWeak((id *)(v9 + 24), v10);
  }
  else
  {
    v11 = objc_loadWeakRetained(v4 + 3);
    objc_storeWeak((id *)(v9 + 24), v11);

  }
  v12 = objc_loadWeakRetained((id *)&self->_destinationEnvironment);
  if (v12)
  {
    objc_storeWeak((id *)(v9 + 16), v12);
  }
  else
  {
    v13 = objc_loadWeakRetained(v4 + 2);
    objc_storeWeak((id *)(v9 + 16), v13);

  }
  *(_BYTE *)(v9 + 10) = self->_isFocusRemovalRequest;
  if (self->_allowsDeferral)
    v14 = objc_msgSend(v4, "allowsDeferral");
  else
    v14 = 0;
  objc_msgSend((id)v9, "setAllowsDeferral:", v14);
  if (self->_scrollIfNecessary)
    v15 = 1;
  else
    v15 = objc_msgSend(v4, "shouldScrollIfNecessary");
  objc_msgSend((id)v9, "setScrollIfNecessary:", v15);
  if (self->_shouldPlayFocusSound)
    v16 = 1;
  else
    v16 = objc_msgSend(v4, "shouldPlayFocusSound");
  objc_msgSend((id)v9, "setShouldPlayFocusSound:", v16);
  if (self->_allowsFocusingCurrentItem)
    v17 = 1;
  else
    v17 = objc_msgSend(v4, "allowsFocusingCurrentItem");
  objc_msgSend((id)v9, "setAllowsFocusingCurrentItem:", v17);
  if (self->_resetsUpdateThrottle)
    v18 = 1;
  else
    v18 = objc_msgSend(v4, "resetsUpdateThrottle");
  objc_msgSend((id)v9, "setResetsUpdateThrottle:", v18);

  return (id)v9;
}

- (UIFocusSystem)focusSystem
{
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = v4;
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_environment);
    if (v6
      && (+[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v6),
          (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v4 = v7;
      v5 = v4;
    }
    else
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "Unable to find focus system for request. Environment does not appear to be in a valid focus environment chain.", buf, 2u);
        }

      }
      else
      {
        v8 = focusSystem___s_category;
        if (!focusSystem___s_category)
        {
          v8 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v8, (unint64_t *)&focusSystem___s_category);
        }
        v9 = *(NSObject **)(v8 + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_ERROR, "Unable to find focus system for request. Environment does not appear to be in a valid focus environment chain.", v13, 2u);
        }
      }
      +[UIScreen mainScreen](UIScreen, "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = 0;
    }

  }
  return (UIFocusSystem *)v5;
}

- (void)cacheCurrentFocusSystem
{
  id v3;

  -[_UIFocusUpdateRequest focusSystem](self, "focusSystem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_focusSystem, v3);

}

- (BOOL)isValidInFocusSystem:(id)a3
{
  id v5;
  id WeakRetained;
  id v7;
  BOOL v8;
  id v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusUpdateRequest.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  if (WeakRetained
    && (-[_UIFocusUpdateRequest focusSystem](self, "focusSystem"),
        v7 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v7 == v5))
  {
    +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", WeakRetained);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v9 == v5;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isMovementRequest
{
  return 0;
}

- (BOOL)requiresNextFocusedItem
{
  return 0;
}

- (BOOL)requiresEnvironmentValidation
{
  return 0;
}

- (BOOL)shouldPerformHapticFeedback
{
  return 0;
}

- (_UIFocusInputDeviceInfo)inputDeviceInfo
{
  return 0;
}

- (BOOL)shouldScrollIfNecessary
{
  return self->_scrollIfNecessary;
}

- (void)setScrollIfNecessary:(BOOL)a3
{
  self->_scrollIfNecessary = a3;
}

- (UIFocusEnvironment)destinationEnvironment
{
  return (UIFocusEnvironment *)objc_loadWeakRetained((id *)&self->_destinationEnvironment);
}

- (UIFocusEnvironment)environment
{
  return (UIFocusEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (BOOL)allowsDeferral
{
  return self->_allowsDeferral;
}

- (void)setAllowsDeferral:(BOOL)a3
{
  self->_allowsDeferral = a3;
}

- (BOOL)isFocusRemovalRequest
{
  return self->_isFocusRemovalRequest;
}

- (BOOL)shouldPlayFocusSound
{
  return self->_shouldPlayFocusSound;
}

- (void)setShouldPlayFocusSound:(BOOL)a3
{
  self->_shouldPlayFocusSound = a3;
}

- (BOOL)allowsFocusingCurrentItem
{
  return self->_allowsFocusingCurrentItem;
}

- (void)setAllowsFocusingCurrentItem:(BOOL)a3
{
  self->_allowsFocusingCurrentItem = a3;
}

- (BOOL)allowsOverridingPreferedFocusEnvironments
{
  return self->_allowsOverridingPreferedFocusEnvironments;
}

- (void)setAllowsOverridingPreferedFocusEnvironments:(BOOL)a3
{
  self->_allowsOverridingPreferedFocusEnvironments = a3;
}

- (BOOL)resetsUpdateThrottle
{
  return self->_resetsUpdateThrottle;
}

- (void)setResetsUpdateThrottle:(BOOL)a3
{
  self->_resetsUpdateThrottle = a3;
}

@end
