@implementation SXComponentBehaviorController

- (SXComponentBehaviorController)initWithViewport:(id)a3 andAnimator:(id)a4
{
  id v7;
  id v8;
  SXComponentBehaviorController *v9;
  SXComponentBehaviorController *v10;
  NSMutableSet *v11;
  NSMutableSet *behaviorHandlers;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SXComponentBehaviorController;
  v9 = -[SXComponentBehaviorController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewport, a3);
    objc_storeStrong((id *)&v10->_animator, a4);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    behaviorHandlers = v10->_behaviorHandlers;
    v10->_behaviorHandlers = v11;

    -[SXViewport addViewportChangeListener:forOptions:](v10->_viewport, "addViewportChangeListener:forOptions:", v10, 14);
  }

  return v10;
}

- (void)registerComponentView:(id)a3 behavior:(id)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v11, "component");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_msgSend(v6, "handlerClassForComponent:", v7);

  if (v8)
  {
    -[SXComponentBehaviorController existingHandlerForComponentView:behavior:](self, "existingHandlerForComponentView:behavior:", v11, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = (void *)objc_msgSend([v8 alloc], "initWithComponentView:withBehavior:", v11, v6);
      -[SXComponentBehaviorController behaviorHandlers](self, "behaviorHandlers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v9);

    }
  }

}

- (void)unregisterComponentView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[SXComponentBehaviorController behaviorHandlers](self, "behaviorHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "componentView");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SXComponentBehaviorController behaviorHandlers](self, "behaviorHandlers", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
        if (objc_msgSend(v18, "isSetup"))
          objc_msgSend(v18, "destroyWithBehaviorController:", self);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  -[SXComponentBehaviorController behaviorHandlers](self, "behaviorHandlers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "minusSet:", v5);

}

- (id)existingHandlerForComponentView:(id)a3 behavior:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SXComponentBehaviorController behaviorHandlers](self, "behaviorHandlers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "componentView");
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (v13 == v6)
        {
          objc_msgSend(v12, "behavior");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          if (v14 == v7)
          {
            v9 = v12;
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  return v9;
}

- (void)update
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  _BOOL4 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v38 = *MEMORY[0x24BDAC8D0];
  -[SXComponentBehaviorController viewport](self, "viewport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPopulated");

  if (v4)
  {
    -[SXComponentBehaviorController viewport](self, "viewport");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dynamicBounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[SXComponentBehaviorController viewport](self, "viewport");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15 * -2.0;
    v39.origin.x = v7;
    v39.origin.y = v9;
    v39.size.width = v11;
    v39.size.height = v13;
    v40 = CGRectInset(v39, 0.0, v16);
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[SXComponentBehaviorController behaviorHandlers](self, "behaviorHandlers", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((objc_msgSend(v26, "requiresContinuousUpdates") & 1) != 0)
            goto LABEL_9;
          objc_msgSend(v26, "componentView");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "absoluteFrame");
          v42.origin.x = v28;
          v42.origin.y = v29;
          v42.size.width = v30;
          v42.size.height = v31;
          v41.origin.x = x;
          v41.origin.y = y;
          v41.size.width = width;
          v41.size.height = height;
          v32 = CGRectIntersectsRect(v41, v42);

          if (v32)
LABEL_9:
            -[SXComponentBehaviorController updateHandler:](self, "updateHandler:", v26);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v23);
    }

  }
}

- (void)updateComponentView:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SXComponentBehaviorController viewport](self, "viewport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPopulated");

  if (v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[SXComponentBehaviorController behaviorHandlers](self, "behaviorHandlers", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v12, "componentView");
          v13 = (id)objc_claimAutoreleasedReturnValue();

          if (v13 == v4)
            -[SXComponentBehaviorController updateHandler:](self, "updateHandler:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
}

- (void)updateHandler:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "isSetup") & 1) == 0)
    objc_msgSend(v4, "setupWithBehaviorController:", self);
  objc_msgSend(v4, "updateWithBehaviorController:", self);

}

- (void)reset
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SXComponentBehaviorController viewport](self, "viewport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPopulated");

  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[SXComponentBehaviorController behaviorHandlers](self, "behaviorHandlers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(v10, "isSetup"))
            objc_msgSend(v10, "destroyWithBehaviorController:", self);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (void)setViewport:(id)a3
{
  objc_storeStrong((id *)&self->_viewport, a3);
}

- (UIDynamicAnimator)animator
{
  return self->_animator;
}

- (NSMutableSet)behaviorHandlers
{
  return self->_behaviorHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behaviorHandlers, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
}

@end
