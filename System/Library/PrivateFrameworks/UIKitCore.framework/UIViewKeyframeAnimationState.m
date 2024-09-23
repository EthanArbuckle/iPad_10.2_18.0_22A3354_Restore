@implementation UIViewKeyframeAnimationState

- (id)animationForLayer:(id)a3 forKey:(id)a4 forView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _UIViewDeferredKeyframeAnimation *v13;
  void *v14;
  id v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_inFrame)
  {
    v11 = 0;
    if (v8 && v9)
    {
      objc_getAssociatedObject(v8, &_UITrackedKeyframeActionsForLayerKey);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_setAssociatedObject(v8, &_UITrackedKeyframeActionsForLayerKey, v12, (void *)1);
      }
      objc_msgSend(v12, "objectForKeyedSubscript:", v9);
      v13 = (_UIViewDeferredKeyframeAnimation *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        v13 = objc_alloc_init(_UIViewDeferredKeyframeAnimation);
        -[_UIViewDeferredAnimation setKey:](v13, "setKey:", v9);
        -[_UIViewDeferredAnimation setDuration:](v13, "setDuration:", self->super._duration);
        objc_msgSend(v10, "_initialValueForLayer:keyPath:usePresentationValue:", v8, v9, (*((unsigned __int8 *)&self->super + 172) >> 1) & 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIViewDeferredAnimation setInitialValue:](v13, "setInitialValue:", v14);

        -[_UIViewDeferredAnimation setRepeatCount:](v13, "setRepeatCount:", self->super._repeatCount);
        -[_UIViewDeferredAnimation setAutoreverses:](v13, "setAutoreverses:", (*((unsigned __int8 *)&self->super + 172) >> 3) & 1);
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v9);
      }
      -[NSMutableSet addObject:](self->_keyframeLayers, "addObject:", v8);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_keyframeLayersForCurrentKeyFrameDict, "objectForKeyedSubscript:", v9);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keyframeLayersForCurrentKeyFrameDict, "setObject:forKeyedSubscript:", v15, v9);
      }
      objc_msgSend(v15, "addObject:", v8);

      v11 = 0;
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIViewKeyframeAnimationState;
    -[UIViewAnimationState animationForLayer:forKey:forView:](&v17, sel_animationForLayer_forKey_forView_, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)setupWithDuration:(double)a3 delay:(double)a4 view:(id)a5 options:(unint64_t)a6 factory:(id)a7 parentState:(id)a8 start:(id)a9 completion:(id)a10
{
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIViewKeyframeAnimationState;
  -[UIViewAnimationState setupWithDuration:delay:view:options:factory:parentState:start:completion:](&v12, sel_setupWithDuration_delay_view_options_factory_parentState_start_completion_, a5, a6, a7, a8, a9, a10, a3, a4);
  self->_calculationMode = (a6 >> 10) & 7;
}

- (UIViewKeyframeAnimationState)init
{
  UIViewKeyframeAnimationState *v2;
  NSMutableSet *v3;
  NSMutableSet *keyframeLayers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIViewKeyframeAnimationState;
  v2 = -[UIViewAnimationState init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    keyframeLayers = v2->_keyframeLayers;
    v2->_keyframeLayers = v3;

  }
  return v2;
}

- (void)addKeyframeWithRelativeStartTime:(double)a3 relativeDuration:(double)a4 animations:(id)a5
{
  NSMutableDictionary *v9;
  NSMutableDictionary *keyframeLayersForCurrentKeyFrameDict;
  NSMutableDictionary *v11;
  void *v12;
  void (**v13)(void);

  v13 = (void (**)(void))a5;
  if (self->_inFrame)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIView.m"), 2800, CFSTR("calls to +[UIView addKeyframeWithStartTime:duration:animations:] cannot be nested within a single keyframe animation"));

  }
  self->_inFrame = 1;
  self->_frameStartTime = a3;
  self->_frameDuration = a4;
  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  keyframeLayersForCurrentKeyFrameDict = self->_keyframeLayersForCurrentKeyFrameDict;
  self->_keyframeLayersForCurrentKeyFrameDict = v9;

  v13[2]();
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_keyframeLayersForCurrentKeyFrameDict, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_440_1);
  v11 = self->_keyframeLayersForCurrentKeyFrameDict;
  self->_keyframeLayersForCurrentKeyFrameDict = 0;

  self->_inFrame = 0;
}

void __35__UIViewKeyframeAnimationState_pop__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  double v13;
  void *v14;
  double v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;

  v17 = a2;
  v5 = a3;
  objc_msgSend(v5, "_finalize");
  if ((objc_msgSend(v5, "isEmpty") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "repeatCount");
    v8 = v7;
    v9 = objc_msgSend(v5, "autoreverses");
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __35__UIViewKeyframeAnimationState_pop__block_invoke_2;
    v21 = &unk_1E16B1B28;
    v10 = v6;
    v22 = v10;
    +[UIView modifyAnimationsWithRepeatCount:autoreverses:animations:](UIView, "modifyAnimationsWithRepeatCount:autoreverses:animations:", v9, &v18, v8);
    objc_msgSend(v10, "setCalculationMode:", *(_QWORD *)(a1 + 32));
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v13 = *(double *)(*(_QWORD *)(a1 + 40) + 56);
    if (v13 == 0.0)
    {
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 48), "unsafeUnretainedDelegate"), "_screen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_refreshRate");
      v13 = v15;

      if (v13 == 0.0)
        v13 = 0.0166666667;
    }
    objc_msgSend(v5, "calculateFrameValues:frameTimes:withFrameInterval:valueTransformer:", v11, v12, 0, v13, v17, v18, v19, v20, v21);
    objc_msgSend(v10, "setValues:", v11);
    objc_msgSend(v10, "setKeyTimes:", v12);
    if (+[UIView _shouldTrackActionWithAnimator:](UIView, "_shouldTrackActionWithAnimator:", v10))
      v16 = +[UIViewPropertyAnimator _trackNonAdditiveAnimationWithAnimator:forLayer:forKey:](UIViewPropertyAnimator, "_trackNonAdditiveAnimationWithAnimator:forLayer:forKey:", v10, *(_QWORD *)(a1 + 48), v17);
    objc_msgSend(*(id *)(a1 + 48), "addAnimation:forKey:", v10, v17);
    if (objc_msgSend(*(id *)(a1 + 40), "_isTrackingEnabled"))
      objc_msgSend(*(id *)(a1 + 40), "_trackAnimation:withAnimationKey:forKeyPath:inLayer:", v10, v17, v17, *(_QWORD *)(a1 + 48));

  }
}

uint64_t __35__UIViewKeyframeAnimationState_pop__block_invoke_2(uint64_t a1)
{
  return +[UIView _setAnimationAttributes:](UIView, "_setAnimationAttributes:", *(_QWORD *)(a1 + 32));
}

void __93__UIViewKeyframeAnimationState_addKeyframeWithRelativeStartTime_relativeDuration_animations___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  const void *v17;
  id v18;
  __CFString *v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    v9 = &_UITrackedKeyframeActionsForLayerKey;
    v10 = CFSTR("backgroundColor");
    do
    {
      v11 = 0;
      v21 = v7;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
        objc_getAssociatedObject(v12, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "valueForKeyPath:", v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          if (-[__CFString isEqualToString:](v10, "isEqualToString:", v4))
          {
            +[UIColor clearColor](UIColor, "clearColor");
            v16 = v8;
            v17 = v9;
            v18 = v5;
            v19 = v10;
            v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v20, "CGColor");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = v19;
            v5 = v18;
            v9 = v17;
            v8 = v16;
            v7 = v21;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CD27A8], "defaultValueForKey:", v4);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        objc_msgSend(v14, "addAnimationFrameForValue:", v15);

        ++v11;
      }
      while (v7 != v11);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

}

- (id)_updateAnimationFrameWithAnimationProperties:(id)a3
{
  _UIViewAnimationFrame *v4;

  v4 = (_UIViewAnimationFrame *)a3;
  if (!v4)
    v4 = objc_alloc_init(_UIViewAnimationFrame);
  -[_UIViewAnimationFrame setStartTime:](v4, "setStartTime:", self->_frameStartTime);
  -[_UIViewAnimationFrame setDuration:](v4, "setDuration:", self->_frameDuration);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyframeLayersForCurrentKeyFrameDict, 0);
  objc_storeStrong((id *)&self->_keyframeLayers, 0);
}

- (void)pop
{
  unint64_t v3;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSMutableSet *keyframeLayers;
  NSMutableSet *obj;
  _QWORD v14[4];
  id v15;
  UIViewKeyframeAnimationState *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)UIViewKeyframeAnimationState;
  -[UIViewAnimationState pop](&v22, "pop");
  v3 = self->_calculationMode - 1;
  if (v3 > 3)
    v4 = (id *)MEMORY[0x1E0CD2938];
  else
    v4 = (id *)qword_1E16EC010[v3];
  v5 = *v4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_keyframeLayers;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_getAssociatedObject(v10, &_UITrackedKeyframeActionsForLayerKey);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __35__UIViewKeyframeAnimationState_pop__block_invoke;
        v14[3] = &unk_1E16EB210;
        v15 = v5;
        v16 = self;
        v17 = v10;
        objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v14);

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v7);
  }

  -[UIViewKeyframeAnimationState cleanupTrackedLayers](self, "cleanupTrackedLayers");
  keyframeLayers = self->_keyframeLayers;
  self->_keyframeLayers = 0;

}

- (void)cleanupTrackedLayers
{
  NSMutableSet *v2;
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
  v2 = self->_keyframeLayers;
  v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
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
        objc_setAssociatedObject(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), &_UITrackedKeyframeActionsForLayerKey, 0, (void *)1);
      }
      while (v4 != v6);
      v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)_isKeyframeAnimation
{
  return 1;
}

- (id)_createDeferredAnimationForKey:(id)a3 ignoringKeyFrames:(BOOL)a4
{
  _UIViewDeferredKeyframeAnimation *v5;
  objc_super v7;

  if (self->_inFrame && !a4)
  {
    v5 = objc_alloc_init(_UIViewDeferredKeyframeAnimation);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIViewKeyframeAnimationState;
    -[UIViewAnimationState _createDeferredAnimationForKey:ignoringKeyFrames:](&v7, sel__createDeferredAnimationForKey_ignoringKeyFrames_, a3, a4);
    v5 = (_UIViewDeferredKeyframeAnimation *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
