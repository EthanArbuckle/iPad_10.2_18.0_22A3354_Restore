@implementation _UIDynamicButtonNotifyingGestureRecognizer

- (id)initWithPhysicalButtonConfigurations:(void *)a3 dynamicButtonObserver:
{
  id *v5;
  id *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)_UIDynamicButtonNotifyingGestureRecognizer;
  v5 = (id *)objc_msgSendSuper2(&v8, sel_initWithTarget_action_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong(v5 + 37, a2);
    objc_storeWeak(v6 + 35, a3);
    -[_UIDynamicButtonNotifyingGestureRecognizer _evaluateAllowedPhysicalButtons]((uint64_t)v6);
    objc_msgSend(v6, "_setRequiresSystemGesturesToFail:", 0);
  }
  return v6;
}

- (uint64_t)_evaluateAllowedPhysicalButtons
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)result;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(result + 296);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v2);
          v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "_button", (_QWORD)v10);
          v9 = 1 << v8;
          if (v8 >= 6)
            v9 = 0;
          v5 |= v9;
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }
    else
    {
      v5 = 0;
    }

    return objc_msgSend(v1, "_setAllowedPhysicalButtons:", v5);
  }
  return result;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  return objc_msgSend(a3, "type") == 16;
}

- (BOOL)_shouldReceiveDynamicButton:(id)a3
{
  unint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend(a3, "_physicalButton");
  if (v4 >= 6)
    v5 = 0;
  else
    v5 = 1 << v4;
  return (v5 & ~-[_UIAbstractDynamicButtonGestureRecognizer _allowedPhysicalButtons](self, "_allowedPhysicalButtons")) == 0;
}

- (void)_dynamicButtonsBegan:(id)a3 withEvent:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_UIDynamicButtonNotifyingGestureRecognizer;
  -[_UIAbstractDynamicButtonGestureRecognizer _dynamicButtonsBegan:withEvent:](&v17, sel__dynamicButtonsBegan_withEvent_);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v7);
      ++self->_activeDynamicButtons;
      if (!--v9)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (!v9)
          break;
      }
    }

  }
  else
  {

    if (!self)
      goto LABEL_11;
  }
  if (-[UIGestureRecognizer state](self, "state", v13) == UIGestureRecognizerStatePossible)
    -[UIGestureRecognizer setState:](self, "setState:", 1);
LABEL_11:
  WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicButtonObserver);
  objc_msgSend(a4, "_allDynamicButtons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_dynamicButtonGestureRecognizer:dynamicButtonsDidUpdate:allDynamicButtons:", self, v7, v12);

}

- (void)_dynamicButtonsChanged:(id)a3 withEvent:(id)a4
{
  id WeakRetained;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIDynamicButtonNotifyingGestureRecognizer;
  -[_UIAbstractDynamicButtonGestureRecognizer _dynamicButtonsChanged:withEvent:](&v9, sel__dynamicButtonsChanged_withEvent_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicButtonObserver);
  objc_msgSend(a4, "_allDynamicButtons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_dynamicButtonGestureRecognizer:dynamicButtonsDidUpdate:allDynamicButtons:", self, a3, v8);

}

- (void)_dynamicButtonsEnded:(id)a3 withEvent:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_UIDynamicButtonNotifyingGestureRecognizer;
  -[_UIAbstractDynamicButtonGestureRecognizer _dynamicButtonsEnded:withEvent:](&v17, sel__dynamicButtonsEnded_withEvent_);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v7);
      --self->_activeDynamicButtons;
      if (!--v9)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (!v9)
          break;
      }
    }

  }
  else
  {

    if (!self)
      goto LABEL_11;
  }
  if (!self->_activeDynamicButtons)
    -[UIGestureRecognizer setState:](self, "setState:", 3, v13);
LABEL_11:
  WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicButtonObserver);
  objc_msgSend(a4, "_allDynamicButtons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_dynamicButtonGestureRecognizer:dynamicButtonsDidUpdate:allDynamicButtons:", self, v7, v12);

}

- (void)_dynamicButtonsCancelled:(id)a3 withEvent:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id WeakRetained;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_UIDynamicButtonNotifyingGestureRecognizer;
  -[_UIAbstractDynamicButtonGestureRecognizer _dynamicButtonsCancelled:withEvent:](&v17, sel__dynamicButtonsCancelled_withEvent_);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v7);
      --self->_activeDynamicButtons;
      if (!--v9)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (!v9)
          break;
      }
    }

  }
  else
  {

    if (!self)
      goto LABEL_11;
  }
  if (!self->_activeDynamicButtons)
    -[UIGestureRecognizer setState:](self, "setState:", 4, v13);
LABEL_11:
  WeakRetained = objc_loadWeakRetained((id *)&self->_dynamicButtonObserver);
  objc_msgSend(a4, "_allDynamicButtons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_dynamicButtonGestureRecognizer:dynamicButtonsDidUpdate:allDynamicButtons:", self, v7, v12);

}

- (void)reset
{
  self->_activeDynamicButtons = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalButtonConfigurations, 0);
  objc_destroyWeak((id *)&self->_dynamicButtonObserver);
}

@end
