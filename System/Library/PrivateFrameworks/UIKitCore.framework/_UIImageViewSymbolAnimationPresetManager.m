@implementation _UIImageViewSymbolAnimationPresetManager

- (void)discardPendingSymbolContentTransitions
{
  _UIImageViewPendingSymbolContentTransition *pendingSymbolContentTransition;
  void *v4;
  _UIImageViewPendingSymbolContentTransition *v5;

  v5 = self->_pendingSymbolContentTransition;
  pendingSymbolContentTransition = self->_pendingSymbolContentTransition;
  self->_pendingSymbolContentTransition = 0;

  if (v5)
  {
    -[_UIImageViewSymbolAnimationPresetManager client](self, "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationPresetManager:didDiscardPendingContentTransition:", self, v5);

  }
}

- (BOOL)hasPendingAnimationsForImage:(id)a3
{
  id v4;
  char v5;
  _UIImageViewPendingSymbolContentTransition *pendingSymbolContentTransition;
  id v7;
  id v8;
  void *v9;

  v4 = a3;
  if (-[NSMutableArray count](self->_pendingSymbolEffects, "count"))
  {
    v5 = 1;
  }
  else
  {
    pendingSymbolContentTransition = self->_pendingSymbolContentTransition;
    if (pendingSymbolContentTransition)
    {
      -[_UIImageViewPendingSymbolContentTransition targetSymbolImage](pendingSymbolContentTransition, "targetSymbolImage");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = v4;
      v9 = v8;
      if (v7 == v8)
      {
        v5 = 1;
      }
      else
      {
        v5 = 0;
        if (v8 && v7)
          v5 = objc_msgSend(v7, "isEqual:", v8);
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (_UIImageViewSymbolAnimationPresetManager)init
{
  _UIImageViewSymbolAnimationPresetManager *v2;
  uint64_t v3;
  NSMutableArray *activeSymbolEffects;
  uint64_t v5;
  NSMutableArray *pendingSymbolEffects;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIImageViewSymbolAnimationPresetManager;
  v2 = -[_UIImageViewSymbolAnimationPresetManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    activeSymbolEffects = v2->_activeSymbolEffects;
    v2->_activeSymbolEffects = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    pendingSymbolEffects = v2->_pendingSymbolEffects;
    v2->_pendingSymbolEffects = (NSMutableArray *)v5;

  }
  return v2;
}

+ (id)managerForClient:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setClient:", v3);

  return v4;
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_pendingSymbolContentTransition, 0);
  objc_storeStrong((id *)&self->_activeSymbolContentTransition, 0);
  objc_storeStrong((id *)&self->_pendingSymbolEffects, 0);
  objc_storeStrong((id *)&self->_activeSymbolEffects, 0);
}

- (_UIImageViewSymbolAnimationPresetClient)client
{
  return (_UIImageViewSymbolAnimationPresetClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)addPendingSymbolContentTransition:(id)a3 fromSymbolImage:(id)a4 toSymbolImage:(id)a5 options:(id)a6 completion:(id)a7
{
  _UIImageViewPendingSymbolContentTransition *v8;
  _UIImageViewPendingSymbolContentTransition *pendingSymbolContentTransition;

  +[_UIImageViewPendingSymbolContentTransition transitionWithTransition:sourceSymbolImage:targetSymbolImage:options:completion:](_UIImageViewPendingSymbolContentTransition, "transitionWithTransition:sourceSymbolImage:targetSymbolImage:options:completion:", a3, a4, a5, a6, a7);
  v8 = (_UIImageViewPendingSymbolContentTransition *)objc_claimAutoreleasedReturnValue();
  pendingSymbolContentTransition = self->_pendingSymbolContentTransition;
  self->_pendingSymbolContentTransition = v8;

}

- (void)addActiveSymbolEffect:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[_UIImageViewSymbolAnimationPresetManager _removeSymbolEffectsOfType:options:animated:completion:forAddingNewEffect:](self, "_removeSymbolEffectsOfType:options:animated:completion:forAddingNewEffect:", v12, v11, v6, 0, 1);
  v13 = (id)objc_opt_new();
  objc_msgSend(v13, "setSymbolEffect:", v12);

  objc_msgSend(v13, "setOptions:", v11);
  objc_msgSend(v13, "setAnimated:", v6);
  objc_msgSend(v13, "setCompletionHandler:", v10);

  -[NSMutableArray addObject:](self->_activeSymbolEffects, "addObject:", v13);
  -[_UIImageViewSymbolAnimationPresetManager _activateActiveSymbolEffectEntry:](self, "_activateActiveSymbolEffectEntry:", v13);

}

- (void)addPendingSymbolEffect:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[_UIImageViewSymbolAnimationPresetManager _removeSymbolEffectsOfType:options:animated:completion:forAddingNewEffect:](self, "_removeSymbolEffectsOfType:options:animated:completion:forAddingNewEffect:", v12, v11, v6, 0, 1);
  v13 = (id)objc_opt_new();
  objc_msgSend(v13, "setSymbolEffect:", v12);

  objc_msgSend(v13, "setOptions:", v11);
  objc_msgSend(v13, "setAnimated:", v6);
  objc_msgSend(v13, "setCompletionHandler:", v10);

  -[NSMutableArray addObject:](self->_pendingSymbolEffects, "addObject:", v13);
}

- (void)activatePendingSymbolEffects
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_pendingSymbolEffects, "copy");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        -[NSMutableArray removeObjectAtIndex:](self->_pendingSymbolEffects, "removeObjectAtIndex:", 0, (_QWORD)v10);
        -[NSMutableArray addObject:](self->_activeSymbolEffects, "addObject:", v9);
        -[_UIImageViewSymbolAnimationPresetManager _activateActiveSymbolEffectEntry:](self, "_activateActiveSymbolEffectEntry:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_activateActiveSymbolEffectEntry:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "symbolEffect");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_effectType");

  if ((unint64_t)(v5 - 5) >= 2)
  {
    if (v5 == 4)
    {
      objc_msgSend(v17, "symbolEffect");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "_level") == 2)
        v14 = 0xFFFFFFFFLL;
      else
        v14 = 1;
      -[_UIImageViewSymbolAnimationPresetManager client](self, "client");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "options");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v17, "animated");
      objc_msgSend(v17, "completionHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "animationPresetManager:didSetScale:usingEffect:options:animated:completion:", self, v14, v9, v11, v15, v13);
    }
    else
    {
      -[_UIImageViewSymbolAnimationPresetManager client](self, "client");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "symbolEffect");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "options");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v17, "animated");
      objc_msgSend(v17, "completionHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "animationPresetManager:didActivateEffect:options:animated:completion:", self, v10, v11, v16, v13);
    }
  }
  else
  {
    objc_msgSend(v17, "symbolEffect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_effectType");

    v8 = v7 == 6;
    -[_UIImageViewSymbolAnimationPresetManager client](self, "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "symbolEffect");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "options");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v17, "animated");
    objc_msgSend(v17, "completionHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animationPresetManager:didSetHiddenness:usingEffect:options:animated:completion:", self, v8, v10, v11, v12, v13);
  }

}

- (void)activeSymbolEffectDidComplete:(id)a3
{
  id v4;
  NSMutableArray *activeSymbolEffects;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  activeSymbolEffects = self->_activeSymbolEffects;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74___UIImageViewSymbolAnimationPresetManager_activeSymbolEffectDidComplete___block_invoke;
  v11[3] = &unk_1E16E34A0;
  v10 = v4;
  v12 = v10;
  v6 = -[NSMutableArray indexOfObjectPassingTest:](activeSymbolEffects, "indexOfObjectPassingTest:", v11);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    -[NSMutableArray objectAtIndexedSubscript:](self->_activeSymbolEffects, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "symbolEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(objc_msgSend(v9, "_effectType") - 4) >= 3)
      -[NSMutableArray removeObjectAtIndex:](self->_activeSymbolEffects, "removeObjectAtIndex:", v7);

  }
}

- (void)removeSymbolEffectsOfType:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  -[_UIImageViewSymbolAnimationPresetManager _removeSymbolEffectsOfType:options:animated:completion:forAddingNewEffect:](self, "_removeSymbolEffectsOfType:options:animated:completion:forAddingNewEffect:", a3, a4, a5, a6, 0);
}

- (void)_removeSymbolEffectsOfType:(id)a3 options:(id)a4 animated:(BOOL)a5 completion:(id)a6 forAddingNewEffect:(BOOL)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSMutableArray *pendingSymbolEffects;
  uint64_t v17;
  NSMutableArray *activeSymbolEffects;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  BOOL v33;
  _QWORD v34[5];
  id v35;
  BOOL v36;

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = MEMORY[0x1E0C809B0];
  pendingSymbolEffects = self->_pendingSymbolEffects;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __118___UIImageViewSymbolAnimationPresetManager__removeSymbolEffectsOfType_options_animated_completion_forAddingNewEffect___block_invoke;
  v34[3] = &unk_1E16E34C8;
  v34[4] = self;
  v30 = v12;
  v35 = v30;
  v36 = a7;
  v17 = -[NSMutableArray indexOfObjectPassingTest:](pendingSymbolEffects, "indexOfObjectPassingTest:", v34);
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    activeSymbolEffects = self->_activeSymbolEffects;
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __118___UIImageViewSymbolAnimationPresetManager__removeSymbolEffectsOfType_options_animated_completion_forAddingNewEffect___block_invoke_2;
    v31[3] = &unk_1E16E34C8;
    v31[4] = self;
    v32 = v30;
    v33 = a7;
    v19 = -[NSMutableArray indexOfObjectPassingTest:](activeSymbolEffects, "indexOfObjectPassingTest:", v31);
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = v19;
      -[NSMutableArray objectAtIndexedSubscript:](self->_activeSymbolEffects, "objectAtIndexedSubscript:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectAtIndex:](self->_activeSymbolEffects, "removeObjectAtIndex:", v20);
      if (!a7)
      {
        objc_msgSend(v21, "symbolEffect");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "_effectType");

        if ((unint64_t)(v23 - 5) >= 2)
        {
          if (v23 == 4)
          {
            objc_msgSend(v21, "symbolEffect");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIImageViewSymbolAnimationPresetManager client](self, "client");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "animationPresetManager:didSetScale:usingEffect:options:animated:completion:", self, 0, v24, v13, v9, v14);
          }
          else
          {
            -[_UIImageViewSymbolAnimationPresetManager client](self, "client");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "symbolEffect");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "animationPresetManager:didRemoveEffect:options:animated:completion:wasActive:", self, v25, v13, v9, v14, 1);
          }
        }
        else
        {
          -[_UIImageViewSymbolAnimationPresetManager client](self, "client");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "symbolEffect");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "animationPresetManager:didSetHiddenness:usingEffect:options:animated:completion:", self, 0, v25, v13, v9, v14);
        }

      }
    }

  }
  else
  {
    v26 = v17;
    -[NSMutableArray objectAtIndexedSubscript:](self->_pendingSymbolEffects, "objectAtIndexedSubscript:", v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_pendingSymbolEffects, "removeObjectAtIndex:", v26);
    -[_UIImageViewSymbolAnimationPresetManager client](self, "client");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "symbolEffect");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "animationPresetManager:didRemoveEffect:options:animated:completion:wasActive:", self, v29, v13, v9, v14, 0);

  }
}

- (void)removeAllSymbolEffectsWithOptions:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMutableArray arrayByAddingObjectsFromArray:](self->_pendingSymbolEffects, "arrayByAddingObjectsFromArray:", self->_activeSymbolEffects);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "symbolEffect");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIImageViewSymbolAnimationPresetManager removeSymbolEffectsOfType:options:animated:completion:](self, "removeSymbolEffectsOfType:options:animated:completion:", v12, v6, v4, 0);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)_symbolEffect:(id)a3 collidesWithSymbolEffect:(id)a4 forAddingEffect:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if ((unint64_t)(objc_msgSend(v7, "_effectType") - 5) > 1 || !v5)
  {
    v10 = objc_msgSend(v7, "_effectType");
    v11 = objc_msgSend(v8, "_effectType");
LABEL_10:
    v12 = v10 == v11;
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "_effectType") != 5)
  {
    v10 = objc_msgSend(v8, "_effectType");
    v11 = 6;
    goto LABEL_10;
  }
  v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)hasPendingContentTransition
{
  return self->_pendingSymbolContentTransition != 0;
}

- (id)pendingSymbolContentTransitionForSettingSymbolImage:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  _UIImageViewPendingSymbolContentTransition *v10;

  v4 = a3;
  -[_UIImageViewPendingSymbolContentTransition targetSymbolImage](self->_pendingSymbolContentTransition, "targetSymbolImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  if (v7 == v6)
  {

  }
  else
  {
    v8 = v7;
    if (!v6 || !v7)
    {

LABEL_9:
      v10 = 0;
      goto LABEL_10;
    }
    v9 = objc_msgSend(v6, "isEqual:", v7);

    if (!v9)
      goto LABEL_9;
  }
  v10 = self->_pendingSymbolContentTransition;
LABEL_10:

  return v10;
}

- (void)activatePendingSymbolContentTransition:(id)a3
{
  _UIImageViewPendingSymbolContentTransition *v4;
  NSSymbolContentTransition *v5;
  NSSymbolContentTransition *activeSymbolContentTransition;
  _UIImageViewPendingSymbolContentTransition *v7;

  v4 = (_UIImageViewPendingSymbolContentTransition *)a3;
  if (self->_pendingSymbolContentTransition == v4)
  {
    self->_pendingSymbolContentTransition = 0;
    v7 = v4;

    -[_UIImageViewPendingSymbolContentTransition symbolContentTransition](v7, "symbolContentTransition");
    v5 = (NSSymbolContentTransition *)objc_claimAutoreleasedReturnValue();
    activeSymbolContentTransition = self->_activeSymbolContentTransition;
    self->_activeSymbolContentTransition = v5;

    v4 = v7;
  }

}

- (void)activeSymbolContentTransitionDidComplete:(id)a3
{
  id v4;
  NSSymbolContentTransition *activeSymbolContentTransition;
  NSSymbolContentTransition *v6;
  int v7;
  NSSymbolContentTransition *v8;

  v4 = a3;
  activeSymbolContentTransition = self->_activeSymbolContentTransition;
  v6 = (NSSymbolContentTransition *)v4;
  v8 = v6;
  if (activeSymbolContentTransition == v6)
  {

  }
  else
  {
    if (!v6 || !activeSymbolContentTransition)
    {

      goto LABEL_9;
    }
    v7 = -[NSSymbolContentTransition isEqual:](activeSymbolContentTransition, "isEqual:", v6);

    if (!v7)
      goto LABEL_10;
  }
  activeSymbolContentTransition = self->_activeSymbolContentTransition;
  self->_activeSymbolContentTransition = 0;
LABEL_9:

LABEL_10:
}

@end
