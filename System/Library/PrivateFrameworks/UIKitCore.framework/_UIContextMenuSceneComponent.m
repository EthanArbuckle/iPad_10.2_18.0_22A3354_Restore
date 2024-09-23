@implementation _UIContextMenuSceneComponent

- (_UIContextMenuSceneComponent)initWithScene:(id)a3
{
  id v5;
  _UIContextMenuSceneComponent *v6;
  _UIContextMenuSceneComponent *v7;
  uint64_t v8;
  NSMutableSet *activePresentations;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_super v14;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIContextMenuSceneComponent.m"), 37, CFSTR("Only UIWindowScene is supported by %@."), v13);

  }
  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuSceneComponent;
  v6 = -[_UIContextMenuSceneComponent init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_scene, v5);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    activePresentations = v7->_activePresentations;
    v7->_activePresentations = (NSMutableSet *)v8;

  }
  return v7;
}

- (void)registerPresentation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIContextMenuSceneComponent activePresentations](self, "activePresentations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removePresentation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_UIContextMenuSceneComponent activePresentations](self, "activePresentations");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)dismissActiveMenus
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[_UIContextMenuSceneComponent activePresentations](self, "activePresentations", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "requestMenuDismissal");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (id)sceneComponentForView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "_window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_contextMenuSceneComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (NSMutableSet)activePresentations
{
  return self->_activePresentations;
}

- (void)setActivePresentations:(id)a3
{
  objc_storeStrong((id *)&self->_activePresentations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePresentations, 0);
  objc_destroyWeak((id *)&self->_scene);
}

@end
