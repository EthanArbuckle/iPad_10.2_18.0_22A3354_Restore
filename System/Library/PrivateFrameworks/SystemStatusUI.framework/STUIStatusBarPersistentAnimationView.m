@implementation STUIStatusBarPersistentAnimationView

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  STUIStatusBarPersistentAnimationView *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  STUIStatusBarPersistentAnimationView *v21;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CD3068]))
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __62__STUIStatusBarPersistentAnimationView_actionForLayer_forKey___block_invoke;
    v20 = &unk_1E8D62A38;
    v21 = self;
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CD3060]))
    {
      v11.receiver = self;
      v11.super_class = (Class)STUIStatusBarPersistentAnimationView;
      -[STUIStatusBarPersistentAnimationView actionForLayer:forKey:](&v11, sel_actionForLayer_forKey_, v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __62__STUIStatusBarPersistentAnimationView_actionForLayer_forKey___block_invoke_2;
    v15 = &unk_1E8D62A38;
    v16 = self;
  }
  _StatusBar_UIBlockBasedCAAction();
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v9 = (void *)v8;

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animations, 0);
}

- (void)setPersistentAnimations:(id)a3
{
  id v4;
  NSHashTable *animations;
  NSHashTable *v6;
  NSHashTable *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  animations = self->_animations;
  if (animations)
  {
    -[NSHashTable removeAllObjects](animations, "removeAllObjects");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_animations;
    self->_animations = v6;

  }
  -[STUIStatusBarPersistentAnimationView layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSHashTable addObject:](self->_animations, "addObject:", v15, (_QWORD)v16);
        if (!v9 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v15, "pausePersistentAnimation");
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

void __62__STUIStatusBarPersistentAnimationView_actionForLayer_forKey___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 416);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "resumePersistentAnimation", (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __62__STUIStatusBarPersistentAnimationView_actionForLayer_forKey___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
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
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 416);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "pausePersistentAnimation", (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (NSArray)persistentAnimations
{
  return -[NSHashTable allObjects](self->_animations, "allObjects");
}

- (NSHashTable)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
  objc_storeStrong((id *)&self->_animations, a3);
}

@end
