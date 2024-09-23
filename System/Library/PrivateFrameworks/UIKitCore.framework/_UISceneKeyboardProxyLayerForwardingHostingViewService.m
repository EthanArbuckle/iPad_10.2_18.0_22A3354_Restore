@implementation _UISceneKeyboardProxyLayerForwardingHostingViewService

- (id)initWithViewServiceOperator:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)_UISceneKeyboardProxyLayerForwardingHostingViewService;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 1, v3);
  }

  return a1;
}

- (void)addLayers:(id)a3
{
  _UIViewServiceViewControllerOperator **p_viewControllerOperator;
  id v5;
  void *v6;
  id WeakRetained;

  p_viewControllerOperator = &self->_viewControllerOperator;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewControllerOperator);
  -[_UISceneKeyboardProxyLayerForwardingHostingViewService _keyboardOwnerIdentityTokensForLayers:](self, "_keyboardOwnerIdentityTokensForLayers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_addSceneForwardingLayersForOwners:", v6);
}

- (void)removeLayers:(id)a3
{
  _UIViewServiceViewControllerOperator **p_viewControllerOperator;
  id v5;
  void *v6;
  id WeakRetained;

  p_viewControllerOperator = &self->_viewControllerOperator;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_viewControllerOperator);
  -[_UISceneKeyboardProxyLayerForwardingHostingViewService _keyboardOwnerIdentityTokensForLayers:](self, "_keyboardOwnerIdentityTokensForLayers:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "_removeSceneForwardingLayersForOwners:", v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  id WeakRetained;
  id v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (id *)v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerOperator);
    if (v5)
      v7 = objc_loadWeakRetained(v5 + 1);
    else
      v7 = 0;
    v8 = BSEqualObjects();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  void *v2;
  id WeakRetained;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  WeakRetained = objc_loadWeakRetained((id *)&self->_viewControllerOperator);
  objc_msgSend(v2, "stringWithFormat:", CFSTR("_UIViewServiceViewControllerOperator:%p"), WeakRetained);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (id)_keyboardOwnerIdentityTokensForLayers:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _UISceneKeyboardProxyLayerForwardingHostingViewService *v14;
  const char *v15;
  void *v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = (void *)objc_msgSend(v5, "copy");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = v5;
          v14 = self;
          v15 = a2;
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", v15, v14, CFSTR("_UISceneKeyboardProxyLayerForwardingHostingViewService.m"), 56, CFSTR("%@ is not a FBSKeyboardProxyLayer"), v12);

          a2 = v15;
          self = v14;
          v5 = v19;
        }
        objc_msgSend(v12, "keyboardOwner");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_msgSend(v6, "copy");
  return v17;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewControllerOperator);
}

@end
