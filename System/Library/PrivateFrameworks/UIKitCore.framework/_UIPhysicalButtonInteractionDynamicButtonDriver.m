@implementation _UIPhysicalButtonInteractionDynamicButtonDriver

- (_UIPhysicalButtonInteractionDynamicButtonDriver)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteractionDynamicButtonDriver.m"), 31, CFSTR("%s: init is not allowed on %@"), "-[_UIPhysicalButtonInteractionDynamicButtonDriver init]", objc_opt_class());

  return 0;
}

- (_UIPhysicalButtonInteractionDynamicButtonDriver)initWithReceiver:(id)a3
{
  _UIPhysicalButtonInteractionDynamicButtonDriver *v4;
  _UIPhysicalButtonInteractionDynamicButtonDriver *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPhysicalButtonInteractionDynamicButtonDriver;
  v4 = -[_UIPhysicalButtonInteractionDynamicButtonDriver init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeWeak((id *)&v4->_receiver, a3);
  return v5;
}

- (void)_installToViewIfNeeded:(id)a3
{
  _UIDynamicButtonNotifyingGestureRecognizer *dynamicButtonGesture;
  _UIDynamicButtonNotifyingGestureRecognizer *v6;
  id WeakRetained;
  void *v8;
  _UIDynamicButtonNotifyingGestureRecognizer *v9;
  _UIDynamicButtonNotifyingGestureRecognizer *v10;

  dynamicButtonGesture = self->_dynamicButtonGesture;
  if (!dynamicButtonGesture)
  {
    v6 = [_UIDynamicButtonNotifyingGestureRecognizer alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
    objc_msgSend(WeakRetained, "_configurationSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (_UIDynamicButtonNotifyingGestureRecognizer *)-[_UIDynamicButtonNotifyingGestureRecognizer initWithPhysicalButtonConfigurations:dynamicButtonObserver:](v6, v8, self);
    v10 = self->_dynamicButtonGesture;
    self->_dynamicButtonGesture = v9;

    dynamicButtonGesture = self->_dynamicButtonGesture;
  }
  objc_msgSend(a3, "addGestureRecognizer:", dynamicButtonGesture);
}

- (void)_uninstallFromViewIfNeeded:(id)a3
{
  objc_msgSend(a3, "removeGestureRecognizer:", self->_dynamicButtonGesture);
}

- (void)_physicalButtonConfigurationsDidChange
{
  void *v3;
  _UIDynamicButtonNotifyingGestureRecognizer *dynamicButtonGesture;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  objc_msgSend(WeakRetained, "_configurationSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dynamicButtonGesture = self->_dynamicButtonGesture;
  if (dynamicButtonGesture)
    -[_UIDynamicButtonNotifyingGestureRecognizer _evaluateAllowedPhysicalButtons]((uint64_t)dynamicButtonGesture);

}

- (int64_t)_driverType
{
  return 1;
}

- (void)_dynamicButtonGestureRecognizer:(id)a3 dynamicButtonsDidUpdate:(id)a4 allDynamicButtons:(id)a5
{
  unint64_t v7;
  id WeakRetained;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  _UIPhysicalButtonInteractionDynamicButtonDriver *v28;
  objc_class *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  id v33;
  void *v34;
  objc_class *v35;
  void *v36;
  __CFString *v37;
  id obj;
  uint64_t v40;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint8_t v52[128];
  uint8_t buf[4];
  __CFString *v54;
  __int16 v55;
  __CFString *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = _dynamicButtonGestureRecognizer_dynamicButtonsDidUpdate_allDynamicButtons____s_category;
  if (!_dynamicButtonGestureRecognizer_dynamicButtonsDidUpdate_allDynamicButtons____s_category)
  {
    v7 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v7, (unint64_t *)&_dynamicButtonGestureRecognizer_dynamicButtonsDidUpdate_allDynamicButtons____s_category);
  }
  if ((*(_BYTE *)v7 & 1) != 0)
  {
    v26 = *(id *)(v7 + 8);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      if (self)
      {
        v27 = (void *)MEMORY[0x1E0CB3940];
        v28 = self;
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@: %p>"), v30, v28);
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v31 = CFSTR("(nil)");
      }
      v32 = v31;
      v33 = objc_loadWeakRetained((id *)&self->_receiver);
      if (v33)
      {
        v34 = (void *)MEMORY[0x1E0CB3940];
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR("<%@: %p>"), v36, v33);
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v37 = CFSTR("(nil)");
      }

      *(_DWORD *)buf = 138412802;
      v54 = v32;
      v55 = 2112;
      v56 = v37;
      v57 = 2112;
      v58 = a4;
      _os_log_impl(&dword_185066000, v26, OS_LOG_TYPE_ERROR, "Received updated dynamic buttons for driver: %@; interaction: %@; buttons: %@",
        buf,
        0x20u);

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_receiver);
  objc_msgSend(WeakRetained, "_configurationSet");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = a4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v9)
  {
    v10 = v9;
    v40 = *(_QWORD *)v48;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v48 != v40)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "_physicalButton");
        objc_msgSend(v42, "_configurationForButton:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v15 = a5;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v44;
            while (2)
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v44 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
                if (v20 != v12 && objc_msgSend(v20, "_physicalButton") == v13)
                {

                  objc_msgSend(v12, "_phase");
                  goto LABEL_22;
                }
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
              if (v17)
                continue;
              break;
            }
          }

          v21 = objc_msgSend(v12, "_phase");
          if (v21 > 4)
LABEL_22:
            v22 = 1;
          else
            v22 = qword_18667AA10[v21];
          +[_UIPhysicalButtonAction _actionFromDynamicButton:withConfiguration:state:andDriver:]((uint64_t)_UIPhysicalButtonAction, v12, v14, v22, -[_UIPhysicalButtonInteractionDynamicButtonDriver _driverType](self, "_driverType"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_loadWeakRetained((id *)&self->_receiver);
          objc_msgSend(v24, "_driver:didCreateProposedAction:", self, v23);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPhysicalButtonInteractionDynamicButtonDriver.m"), 78, CFSTR("Invalid state: no configuration for physical button allowed by gesture: allowedPhysicalButtons: %lu; physicalButtonConfigurations: %@"),
            -[_UIAbstractDynamicButtonGestureRecognizer _allowedPhysicalButtons](self->_dynamicButtonGesture, "_allowedPhysicalButtons"), v42);
        }

        ++v11;
      }
      while (v11 != v10);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      v10 = v25;
    }
    while (v25);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicButtonGesture, 0);
  objc_destroyWeak((id *)&self->_receiver);
}

@end
