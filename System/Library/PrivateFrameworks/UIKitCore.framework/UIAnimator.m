@implementation UIAnimator

uint64_t __44__UIAnimator__startAnimation_withStartTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_advanceAnimationsOnScreenWithIdentifier:withTimestamp:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedAnimator
{
  void *v2;
  void *v3;
  UIAnimator *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("sharedAnimator"));
  v4 = (UIAnimator *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(UIAnimator);
    if (v4)
      objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("sharedAnimator"));
  }

  return v4;
}

- (void)removeAnimationsForTarget:(id)a3 ofKind:(Class)a4
{
  id v6;
  NSMutableArray *animations;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  Class v15;

  v6 = a3;
  animations = self->_animations;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__UIAnimator_removeAnimationsForTarget_ofKind___block_invoke;
  v13[3] = &unk_1E16B40D0;
  v14 = v6;
  v15 = a4;
  v11 = v6;
  -[NSMutableArray indexesOfObjectsPassingTest:](animations, "indexesOfObjectsPassingTest:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectsAtIndexes:](animations, "objectsAtIndexes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __47__UIAnimator_removeAnimationsForTarget_ofKind___block_invoke_2;
  v12[3] = &unk_1E16B40F8;
  v12[4] = self;
  objc_msgSend(v10, "enumerateObjectsWithOptions:usingBlock:", 2, v12);

}

- (void)removeAnimationsForTarget:(id)a3
{
  id v4;

  v4 = a3;
  -[UIAnimator removeAnimationsForTarget:ofKind:](self, "removeAnimationsForTarget:ofKind:", v4, objc_opt_class());

}

- (UIAnimator)init
{
  UIAnimator *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *animatorScreenLinks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAnimator;
  v2 = -[UIAnimator init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    animatorScreenLinks = v2->_animatorScreenLinks;
    v2->_animatorScreenLinks = v3;

  }
  return v2;
}

- (void)addAnimation:(id)a3 withDuration:(double)a4 start:(BOOL)a5
{
  _BOOL8 v5;
  double v8;
  id v9;

  v5 = a5;
  v9 = a3;
  v8 = 0.0;
  if (v5)
    v8 = CACurrentMediaTime();
  -[UIAnimator _addAnimation:withDuration:start:startTime:](self, "_addAnimation:withDuration:start:startTime:", v9, v5, a4, v8);

}

- (void)_advanceAnimationsOnScreenWithIdentifier:(id)a3 withTimestamp:(double)a4
{
  void *v6;
  int v7;
  unint64_t v8;
  void *v9;
  id v10;
  float v11;
  float v12;
  id v13;

  v13 = a3;
  v6 = (void *)-[NSMutableArray copy](self->_animations, "copy");
  v7 = objc_msgSend(v6, "count");
  if (v7 >= 1)
  {
    v8 = v7 + 1;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", (v8 - 2));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "state") == 1)
      {
        objc_msgSend(v9, "_screenIdentifier");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v13)
        {
          objc_msgSend(v9, "fractionForTime:", a4);
          v12 = v11;
          objc_msgSend(v9, "progressForFraction:");
          objc_msgSend(v9, "setProgress:");
          if (v12 == 1.0)
            -[UIAnimator stopAnimation:](self, "stopAnimation:", v9);
        }
      }

      --v8;
    }
    while (v8 > 1);
  }
  self->_lastUpdateTime = a4;

}

- (void)_addAnimation:(id)a3 withDuration:(double)a4 start:(BOOL)a5 startTime:(double)a6
{
  _BOOL4 v7;
  id v10;
  unint64_t v11;
  NSObject *v12;
  NSMutableArray *animations;
  NSMutableArray *v14;
  NSMutableArray *v15;
  int v16;
  id v17;
  uint64_t v18;

  v7 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if (objc_msgSend(v10, "state") == 1)
  {
    v11 = _addAnimation_withDuration_start_startTime____s_category;
    if (!_addAnimation_withDuration_start_startTime____s_category)
    {
      v11 = __UILogCategoryGetNode("Animation", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v11, (unint64_t *)&_addAnimation_withDuration_start_startTime____s_category);
    }
    v12 = *(NSObject **)(v11 + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = 138412290;
      v17 = v10;
      _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Attempted to add running animation: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v10, "setDuration:", UIAnimationDragCoefficient() * a4);
    animations = self->_animations;
    if (!animations)
    {
      v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = self->_animations;
      self->_animations = v14;

      animations = self->_animations;
    }
    -[NSMutableArray addObject:](animations, "addObject:", v10);
    if (v7)
      -[UIAnimator _startAnimation:withStartTime:](self, "_startAnimation:withStartTime:", v10, a6);
  }

}

- (void)_startAnimation:(id)a3 withStartTime:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  UIAnimator *v19;
  id v20;

  v6 = a3;
  if (objc_msgSend(v6, "state") != 1)
  {
    objc_msgSend(v6, "_screenIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_animatorScreenLinks, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_animatorScreenLinks, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAnimationCount:", (unsigned __int16)(objc_msgSend(v9, "animationCount") + 1));

    }
    else
    {
      objc_msgSend(v6, "_screen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __44__UIAnimator__startAnimation_withStartTime___block_invoke;
      v18 = &unk_1E16B4120;
      v19 = self;
      v11 = v7;
      v20 = v11;
      +[UIAnimatorScreenLink startTimerWithScreen:action:](UIAnimatorScreenLink, "startTimerWithScreen:action:", v10, &v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_animatorScreenLinks, "setObject:forKeyedSubscript:", v12, v11, v15, v16, v17, v18, v19);
    }
    objc_msgSend(v6, "markStart:", a4);
    self->_lastUpdateTime = a4;
    objc_msgSend(v6, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v13, "animator:startAnimation:", self, v6);
    if (__animatorEnabled == 1)
    {
      LODWORD(v14) = 1.0;
      objc_msgSend(v6, "setProgress:", v14);
      -[UIAnimator stopAnimation:](self, "stopAnimation:", v6);
    }

  }
}

- (void)stopAnimation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  double v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "_screenIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_animatorScreenLinks, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fractionForTime:", CACurrentMediaTime());
  v8 = v7;
  if (objc_msgSend(v4, "state") == 1)
    objc_msgSend(v6, "setAnimationCount:", (unsigned __int16)(objc_msgSend(v6, "animationCount") - 1));
  objc_msgSend(v4, "markStop");
  if (v6 && !objc_msgSend(v6, "animationCount"))
  {
    objc_msgSend(v6, "invalidate");
    -[NSMutableDictionary removeObjectForKey:](self->_animatorScreenLinks, "removeObjectForKey:", v5);
  }
  v15 = v4;
  -[NSMutableArray removeObject:](self->_animations, "removeObject:", v15);
  objc_msgSend(v15, "completion");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t))(v9 + 16))(v9);
    objc_msgSend(v15, "setCompletion:", 0);
  }
  objc_msgSend(v15, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_msgSend(v15, "action");
    if (v12)
    {
      v13 = (const char *)v12;
      if (dyld_program_sdk_at_least())
        objc_msgSend(v11, v13, v15);
      else
        objc_msgSend(v11, sel_performSelector_withObject_, v13, v15);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      LODWORD(v14) = v8;
      objc_msgSend(v11, "animator:stopAnimation:fraction:", self, v15, v14);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "animator:stopAnimation:", self, v15);
    }
  }

}

+ (void)disableAnimation
{
  __animatorEnabled = 1;
}

+ (void)enableAnimation
{
  __animatorEnabled = 0;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = self->_animations;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        -[UIAnimator stopAnimation:](self, "stopAnimation:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](self->_animatorScreenLinks, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_animatorScreenLinks, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "invalidate");

        -[NSMutableDictionary removeObjectForKey:](self->_animatorScreenLinks, "removeObjectForKey:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v10);
  }

  v15.receiver = self;
  v15.super_class = (Class)UIAnimator;
  -[UIAnimator dealloc](&v15, sel_dealloc);
}

- (void)addAnimations:(id)a3 withDuration:(double)a4 start:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  CFTimeInterval v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v5 = a5;
  v8 = a3;
  v9 = 0.0;
  v15 = v8;
  if (v5)
  {
    v10 = CACurrentMediaTime();
    v8 = v15;
    v9 = v10;
  }
  v11 = objc_msgSend(v8, "count");
  if (v11 >= 1)
  {
    v12 = 0;
    v13 = v11;
    do
    {
      objc_msgSend(v15, "objectAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIAnimator _addAnimation:withDuration:start:startTime:](self, "_addAnimation:withDuration:start:startTime:", v14, v5, a4, v9);

      ++v12;
    }
    while (v13 != v12);
  }

}

uint64_t __47__UIAnimator_removeAnimationsForTarget_ofKind___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;

  v3 = a2;
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == *(void **)(a1 + 32))
    isKindOfClass = objc_opt_isKindOfClass();
  else
    isKindOfClass = 0;

  return isKindOfClass & 1;
}

void __47__UIAnimator_removeAnimationsForTarget_ofKind___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "containsObject:"))
    objc_msgSend(*(id *)(a1 + 32), "stopAnimation:", v3);

}

- (void)startAnimation:(id)a3
{
  id v4;

  v4 = a3;
  -[UIAnimator _startAnimation:withStartTime:](self, "_startAnimation:withStartTime:", v4, CACurrentMediaTime());

}

- (BOOL)_isRunningAnimation:(id)a3
{
  return -[NSMutableArray containsObject:](self->_animations, "containsObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatorScreenLinks, 0);
  objc_storeStrong((id *)&self->_animations, 0);
}

@end
