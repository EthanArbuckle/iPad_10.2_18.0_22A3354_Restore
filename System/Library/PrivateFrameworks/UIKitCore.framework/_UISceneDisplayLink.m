@implementation _UISceneDisplayLink

+ (id)sceneDisplayLinkForWindowScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_sceneComponentForKey:", CFSTR("_UISceneDisplayLinkKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScene:", v5);
      objc_msgSend(v5, "_registerSceneComponent:forKey:", v6, CFSTR("_UISceneDisplayLinkKey"));
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_UISceneDisplayLink)initWithScene:(id)a3
{
  id v4;
  _UISceneDisplayLink *v5;
  _UISceneDisplayLink *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISceneDisplayLink;
  v5 = -[_UISceneDisplayLink init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_scene, v4);

  return v6;
}

- (void)registerTarget:(id)a3 action:(SEL)a4
{
  NSMutableArray *targetsAndActions;
  NSMutableArray *v7;
  NSMutableArray *v8;
  _UISceneDisplayLinkTargetAndAction *v9;
  id v10;

  v10 = a3;
  targetsAndActions = self->_targetsAndActions;
  if (!targetsAndActions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_targetsAndActions;
    self->_targetsAndActions = v7;

    targetsAndActions = self->_targetsAndActions;
  }
  v9 = -[_UISceneDisplayLinkTargetAndAction initWithTarget:action:]([_UISceneDisplayLinkTargetAndAction alloc], "initWithTarget:action:", v10, a4);
  -[NSMutableArray addObject:](targetsAndActions, "addObject:", v9);

  -[_UISceneDisplayLink _updateStatus](self, "_updateStatus");
}

- (void)unregisterTarget:(id)a3 action:(SEL)a4
{
  id v6;
  NSMutableArray *targetsAndActions;
  id v8;
  int has_internal_diagnostics;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  uint8_t v14[8];
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  SEL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  targetsAndActions = self->_targetsAndActions;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47___UISceneDisplayLink_unregisterTarget_action___block_invoke;
  v15[3] = &unk_1E16C4BB0;
  v8 = v6;
  v17 = &v19;
  v18 = a4;
  v16 = v8;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](targetsAndActions, "enumerateObjectsWithOptions:usingBlock:", 2, v15);
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v10 = v20[3];
  if (has_internal_diagnostics)
  {
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      __UIFaultDebugAssertLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_fault_impl(&dword_185066000, v11, OS_LOG_TYPE_FAULT, "unregisterTarget: called with unregistered target/action", v14, 2u);
      }

    }
  }
  else if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = unregisterTarget_action____s_category;
    if (!unregisterTarget_action____s_category)
    {
      v12 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v12, (unint64_t *)&unregisterTarget_action____s_category);
    }
    v13 = *(NSObject **)(v12 + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_185066000, v13, OS_LOG_TYPE_ERROR, "unregisterTarget: called with unregistered target/action", v14, 2u);
    }
  }
  if (v20[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_targetsAndActions, "removeObjectAtIndex:");
    -[_UISceneDisplayLink _updateStatus](self, "_updateStatus");
  }

  _Block_object_dispose(&v19, 8);
}

- (void)_updateStatus
{
  UIScene **p_scene;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  CADisplayLink **p_displayLink;
  id v9;
  void *v10;
  void *v11;
  CADisplayLink *displayLink;
  CADisplayLink *v13;
  id obj;

  p_scene = &self->_scene;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  if (!objc_msgSend(WeakRetained, "activationState"))
  {
    v7 = -[NSMutableArray count](self->_targetsAndActions, "count");

    if (!v7)
      goto LABEL_10;
    goto LABEL_6;
  }
  v5 = objc_loadWeakRetained((id *)p_scene);
  if (objc_msgSend(v5, "activationState") != 1)
  {

    goto LABEL_10;
  }
  v6 = -[NSMutableArray count](self->_targetsAndActions, "count");

  if (v6)
  {
LABEL_6:
    p_displayLink = &self->_displayLink;
    if (self->_displayLink)
      return;
    v9 = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(v9, "screen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayLinkWithTarget:selector:", self, sel__displayLinkTick_);
    obj = (id)objc_claimAutoreleasedReturnValue();

    if (obj)
    {
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "addToRunLoop:forMode:", v11, *MEMORY[0x1E0C99860]);

      objc_storeStrong((id *)p_displayLink, obj);
    }
    else
    {
      obj = 0;
    }
LABEL_16:

    return;
  }
LABEL_10:
  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v13 = self->_displayLink;
    self->_displayLink = 0;

  }
  if (!-[NSMutableArray count](self->_targetsAndActions, "count"))
  {
    obj = objc_loadWeakRetained((id *)p_scene);
    objc_msgSend(obj, "_unregisterSceneComponentForKey:", CFSTR("_UISceneDisplayLinkKey"));
    goto LABEL_16;
  }
}

- (void)_displayLinkTick:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  NSMutableArray *targetsAndActions;
  id v10;
  int has_internal_diagnostics;
  uint64_t v12;
  NSObject *v13;
  unint64_t v14;
  NSObject *v15;
  uint8_t v16[16];
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  objc_msgSend(v4, "timestamp");
  v6 = _UIMachTimeForMediaTime(v5);
  objc_msgSend(v4, "targetTimestamp");
  v8 = _UIMachTimeForMediaTime(v7);
  _UIQOSProcessingBegin("UISceneDisplayLink", 0, v6, v8);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__74;
  v24 = __Block_byref_object_dispose__74;
  v25 = 0;
  targetsAndActions = self->_targetsAndActions;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __40___UISceneDisplayLink__displayLinkTick___block_invoke;
  v17[3] = &unk_1E16C4BD8;
  v10 = v4;
  v18 = v10;
  v19 = &v20;
  -[NSMutableArray enumerateObjectsUsingBlock:](targetsAndActions, "enumerateObjectsUsingBlock:", v17);
  has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v12 = v21[5];
  if (has_internal_diagnostics)
  {
    if (v12)
    {
      __UIFaultDebugAssertLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_fault_impl(&dword_185066000, v13, OS_LOG_TYPE_FAULT, "A _UISceneDisplayLink target was deallocated while registered.", v16, 2u);
      }

    }
  }
  else if (v12)
  {
    v14 = _displayLinkTick____s_category;
    if (!_displayLinkTick____s_category)
    {
      v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v14, (unint64_t *)&_displayLinkTick____s_category);
    }
    v15 = *(NSObject **)(v14 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "A _UISceneDisplayLink target was deallocated while registered.", v16, 2u);
    }
  }
  if (v21[5])
  {
    -[NSMutableArray removeObjectsAtIndexes:](self->_targetsAndActions, "removeObjectsAtIndexes:");
    -[_UISceneDisplayLink _updateStatus](self, "_updateStatus");
  }

  _Block_object_dispose(&v20, 8);
  _UIQOSProcessingEnd();

}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_targetsAndActions, 0);
}

@end
