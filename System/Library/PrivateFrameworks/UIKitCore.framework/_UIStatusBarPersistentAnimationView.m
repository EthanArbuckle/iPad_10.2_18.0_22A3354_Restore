@implementation _UIStatusBarPersistentAnimationView

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  UIViewBlockBasedCAAction *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CD3068]))
  {
    v8 = [UIViewBlockBasedCAAction alloc];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __61___UIStatusBarPersistentAnimationView_actionForLayer_forKey___block_invoke;
    v15[3] = &unk_1E16B1B28;
    v15[4] = self;
    v9 = v15;
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CD3060]))
    {
      v13.receiver = self;
      v13.super_class = (Class)_UIStatusBarPersistentAnimationView;
      -[UIView actionForLayer:forKey:](&v13, sel_actionForLayer_forKey_, v6, v7);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v8 = [UIViewBlockBasedCAAction alloc];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61___UIStatusBarPersistentAnimationView_actionForLayer_forKey___block_invoke_2;
    v14[3] = &unk_1E16B1B28;
    v14[4] = self;
    v9 = v14;
  }
  v10 = -[UIViewBlockBasedCAAction initWithEmptyBlock:](v8, "initWithEmptyBlock:", v9);
LABEL_7:
  v11 = (void *)v10;

  return v11;
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
  -[UIView layer](self, "layer");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animations, 0);
}

@end
