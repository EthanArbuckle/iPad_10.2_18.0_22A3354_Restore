@implementation PREditorTitleViewControllerCoordinator

+ (Class)titleViewControllerClassForRole:(id)a3
{
  objc_msgSend(a3, "isEqual:", CFSTR("PRPosterRoleIncomingCall"));
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (PREditorTitleViewControllerCoordinator)initWithRole:(id)a3
{
  id v5;
  PREditorTitleViewControllerCoordinator *v6;
  PREditorTitleViewControllerCoordinator *v7;
  uint64_t v8;
  NSMutableDictionary *titleViewControllersForLook;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PREditorTitleViewControllerCoordinator;
  v6 = -[PREditorTitleViewControllerCoordinator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_role, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    titleViewControllersForLook = v7->_titleViewControllersForLook;
    v7->_titleViewControllersForLook = (NSMutableDictionary *)v8;

  }
  return v7;
}

- (id)titleViewControllerForLook:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_titleViewControllersForLook, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "titleViewControllerClassForRole:", self->_role));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_titleViewControllersForLook, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (void)enumerateTimeViewControllersUsingBlock:(id)a3
{
  void (**v4)(id, void *);
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_titleViewControllersForLook;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[PREditorTitleViewControllerCoordinator titleViewControllerForLook:](self, "titleViewControllerForLook:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), (_QWORD)v11);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v4[2](v4, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)updateLookWithIdentifier:(id)a3 withLook:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSMutableDictionary *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = self->_titleViewControllersForLook;
  v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
      objc_msgSend(v13, "identifier", (_QWORD)v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v6);

      if ((v15 & 1) != 0)
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v16 = v13;

    if (!v16)
      goto LABEL_13;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_titleViewControllersForLook, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_titleViewControllersForLook, "setObject:forKeyedSubscript:", 0, v16);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_titleViewControllersForLook, "setObject:forKeyedSubscript:", v17, v7);

    v8 = v16;
  }
LABEL_12:

LABEL_13:
}

- (void)prepareInteractiveTransitionForStartingLook:(id)a3
{
  void *v5;
  CSCachingVibrancyTransitionProvider *v6;
  CSCachingVibrancyTransitionProvider *cachingProvider;
  id v8;

  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_titleViewControllersForLook, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_storeStrong((id *)&self->_transitionInProgressLook, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = (CSCachingVibrancyTransitionProvider *)objc_alloc_init(MEMORY[0x1E0D1BC80]);
      cachingProvider = self->_cachingProvider;
      self->_cachingProvider = v6;

    }
  }

}

- (id)beginInteractiveTransitionForStartingLook:(id)a3 toBaseFont:(id)a4 vibrancyConfiguration:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  PREditorTitleViewControllerCSTransitionWrapper *v12;

  v8 = a4;
  v9 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_titleViewControllersForLook, "objectForKeyedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "beginInteractiveTransitionToBaseFont:vibrancyConfiguration:cachingVibrancyTransitionProvider:", v8, v9, self->_cachingProvider);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PREditorTitleViewControllerCSTransitionWrapper initWithCSTransitioning:]([PREditorTitleViewControllerCSTransitionWrapper alloc], "initWithCSTransitioning:", v11);

    }
    else
    {
      objc_msgSend(v10, "beginInteractiveTransitionToVibrancyConfiguration:", v9);
      v12 = (PREditorTitleViewControllerCSTransitionWrapper *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)invalidateInteractiveTransition
{
  CSCachingVibrancyTransitionProvider *cachingProvider;
  PREditingLook *transitionInProgressLook;

  cachingProvider = self->_cachingProvider;
  self->_cachingProvider = 0;

  transitionInProgressLook = self->_transitionInProgressLook;
  self->_transitionInProgressLook = 0;

}

- (id)cachingVibrancyProviderForLook:(id)a3
{
  if (self->_transitionInProgressLook == a3)
    return self->_cachingProvider;
  else
    return 0;
}

- (void)reloadData
{
  -[NSMutableDictionary removeAllObjects](self->_titleViewControllersForLook, "removeAllObjects");
}

- (NSString)role
{
  return self->_role;
}

- (NSMutableDictionary)titleViewControllersForLook
{
  return self->_titleViewControllersForLook;
}

- (void)setTitleViewControllersForLook:(id)a3
{
  objc_storeStrong((id *)&self->_titleViewControllersForLook, a3);
}

- (CSCachingVibrancyTransitionProvider)cachingProvider
{
  return self->_cachingProvider;
}

- (void)setCachingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_cachingProvider, a3);
}

- (PREditingLook)transitionInProgressLook
{
  return self->_transitionInProgressLook;
}

- (void)setTransitionInProgressLook:(id)a3
{
  objc_storeStrong((id *)&self->_transitionInProgressLook, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionInProgressLook, 0);
  objc_storeStrong((id *)&self->_cachingProvider, 0);
  objc_storeStrong((id *)&self->_titleViewControllersForLook, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end
