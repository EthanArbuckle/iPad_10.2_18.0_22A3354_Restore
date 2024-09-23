@implementation SXComponentAnimationController

- (SXComponentAnimationController)initWithViewport:(id)a3
{
  id v5;
  SXComponentAnimationController *v6;
  SXComponentAnimationController *v7;
  uint64_t v8;
  NSMutableSet *registeredComponents;
  uint64_t v10;
  NSMutableSet *animatingComponents;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXComponentAnimationController;
  v6 = -[SXComponentAnimationController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewport, a3);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    registeredComponents = v7->_registeredComponents;
    v7->_registeredComponents = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    animatingComponents = v7->_animatingComponents;
    v7->_animatingComponents = (NSMutableSet *)v10;

    -[SXViewport addViewportChangeListener:forOptions:](v7->_viewport, "addViewportChangeListener:forOptions:", v7, 30);
  }

  return v7;
}

- (void)registerComponentView:(id)a3 animation:(id)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = (objc_class *)objc_msgSend(v6, "handlerClass");
  -[SXComponentAnimationController animatingHandlerForComponent:](self, "animatingHandlerForComponent:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = (void *)objc_msgSend([v7 alloc], "initWithComponent:withAnimation:", v10, v6);
  -[SXComponentAnimationController registeredComponents](self, "registeredComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  if (objc_msgSend(v8, "state") == 4 && (objc_msgSend(v8, "animationShouldRepeat") & 1) != 0
    || objc_msgSend(v8, "state") != 3 && objc_msgSend(v8, "state") != 4)
  {
    objc_msgSend(v8, "prepareAnimation");
  }
  -[SXComponentAnimationController updateVisibleBoundsIfNeeded](self, "updateVisibleBoundsIfNeeded");

}

- (void)unregisterComponentView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SXComponentAnimationController registeredComponents](self, "registeredComponents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v9);
      objc_msgSend(v10, "component");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11 == v4)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v12 = v10;

    if (!v12)
      goto LABEL_13;
    -[SXComponentAnimationController registeredComponents](self, "registeredComponents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v12);

    v5 = v12;
  }
LABEL_12:

LABEL_13:
}

- (void)startUpdatingAnimationForComponentView:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  -[SXComponentAnimationController registeredHandlerForComponent:](self, "registeredHandlerForComponent:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SXComponentAnimationController animatingComponents](self, "animatingComponents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "containsObject:", v6) & 1) != 0)
    {
LABEL_5:

      goto LABEL_6;
    }
    v5 = objc_msgSend(v6, "state");

    if (v5 != 4)
    {
      -[SXComponentAnimationController animatingComponents](self, "animatingComponents");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);
      goto LABEL_5;
    }
  }
LABEL_6:
  -[SXComponentAnimationController updateVisibleBoundsIfNeeded](self, "updateVisibleBoundsIfNeeded");

}

- (void)stopUpdatingAnimationForComponentView:(id)a3
{
  -[SXComponentAnimationController stopUpdatingAnimationForComponentView:finishAnimation:](self, "stopUpdatingAnimationForComponentView:finishAnimation:", a3, 0);
}

- (void)stopUpdatingAnimationForComponentView:(id)a3 finishAnimation:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[SXComponentAnimationController animatingHandlerForComponent:](self, "animatingHandlerForComponent:");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4 && !v6)
  {
    -[SXComponentAnimationController registeredHandlerForComponent:](self, "registeredHandlerForComponent:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v7)
  {
    if (objc_msgSend(v7, "state") != 4)
    {
      v8 = objc_msgSend(v7, "animationShouldRepeat");
      if ((v8 & 1) != 0 || v4)
      {
        if ((v8 & 1) != 0)
          goto LABEL_12;
      }
      else
      {
        objc_msgSend(v7, "animation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "userControllable"))
        {

          goto LABEL_12;
        }
        v11 = objc_msgSend(v7, "state");

        if (v11 == 1)
          goto LABEL_12;
      }
      objc_msgSend(v7, "finishAnimation");
    }
LABEL_12:
    -[SXComponentAnimationController animatingComponents](self, "animatingComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v7);

  }
}

- (void)updateVisibleBoundsIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  -[SXComponentAnimationController viewport](self, "viewport");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isPopulated"))
  {
    -[SXComponentAnimationController viewport](self, "viewport");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "appearState") == 2)
    {

    }
    else
    {
      -[SXComponentAnimationController viewport](self, "viewport");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "appearState");

      if (v5 != 1)
        return;
    }
    -[SXComponentAnimationController viewport](self, "viewport");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dynamicBounds");
    -[SXComponentAnimationController updateVisibleBounds:](self, "updateVisibleBounds:");
  }

}

- (void)updateVisibleBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinY;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double MaxY;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  int v48;
  void *v49;
  char v50;
  double v51;
  char v52;
  void *v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  double v57;
  double v58;
  double v59;
  double v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v66 = *MEMORY[0x24BDAC8D0];
  MinY = CGRectGetMinY(a3);
  v59 = x;
  v60 = y;
  v67.origin.x = x;
  v67.origin.y = y;
  v9 = width;
  v67.size.width = width;
  v10 = height;
  v67.size.height = height;
  v11 = CGRectGetHeight(v67);
  -[SXComponentAnimationController viewport](self, "viewport");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dynamicBounds");
  v58 = CGRectGetMinY(v68);
  -[SXComponentAnimationController viewport](self, "viewport");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "documentSize");
  v15 = v14;
  -[SXComponentAnimationController viewport](self, "viewport");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[SXComponentAnimationController animatingComponents](self, "animatingComponents");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v20)
  {
    v21 = v20;
    v22 = MinY + v11;
    v57 = v15 - v18;
    v23 = *(_QWORD *)v62;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v62 != v23)
          objc_enumerationMutation(v19);
        v25 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v24);
        objc_msgSend(v25, "componentViewToAnimate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXComponentAnimationController convertRectForComponent:](self, "convertRectForComponent:", v26);
        v28 = v27;
        v30 = v29;
        v32 = v31;
        v34 = v33;

        v69.origin.x = v59;
        v69.origin.y = v60;
        v69.size.width = v9;
        v69.size.height = v10;
        v35 = CGRectGetHeight(v69);
        objc_msgSend(v25, "screenHeightStartOffset");
        v37 = v22 - v35 * v36;
        v70.origin.x = v28;
        v70.origin.y = v30;
        v70.size.width = v32;
        v70.size.height = v34;
        if (v37 < CGRectGetMinY(v70) || objc_msgSend(v25, "state") == 4 || objc_msgSend(v25, "state") == 3)
        {
          if (objc_msgSend(v25, "state") == 1)
          {
            v71.origin.x = v28;
            v71.origin.y = v30;
            v71.size.width = v32;
            v71.size.height = v34;
            MaxY = CGRectGetMaxY(v71);
            -[SXComponentAnimationController viewport](self, "viewport");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "documentSize");
            v41 = v40;
            -[SXComponentAnimationController viewport](self, "viewport");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "bounds");
            v44 = v43;
            objc_msgSend(v25, "screenHeightStartOffset");
            v46 = v41 - v44 * v45;

            if (MaxY > v46)
LABEL_11:
              objc_msgSend(v25, "startAnimation");
          }
        }
        else
        {
          objc_msgSend(v25, "animation");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "userControllable");

          if (!v48)
          {
            -[SXComponentAnimationController viewport](self, "viewport");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "appearState");

            if (v54 == 2)
              goto LABEL_11;
            goto LABEL_22;
          }
          -[SXComponentAnimationController animationHandlersToFinish](self, "animationHandlersToFinish");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "containsObject:", v25);

          if ((v50 & 1) != 0)
            goto LABEL_12;
          if ((v58 < v57 || (objc_msgSend(v25, "shouldFinishAtEndOfScrollView", v58) & 1) == 0)
            && (objc_msgSend(v25, "factorForVisibileBounds:andAbsoluteComponentRect:", v59, v60, v9, v10, v28, v30, v32, v34), v51 != 1.0)|| (v52 = objc_msgSend(v25, "animationShouldRepeat"), v51 = 1.0, (v52 & 1) != 0))
          {
            objc_msgSend(v25, "updateAnimationWithFactor:", v51);
            goto LABEL_12;
          }
          objc_msgSend(v25, "factor", 1.0);
          if (v55 >= 0.95)
          {
            objc_msgSend(v25, "updateAnimationWithFactor:", 1.0);
LABEL_22:
            objc_msgSend(v25, "finishAnimation");
            goto LABEL_12;
          }
          -[SXComponentAnimationController finishAnimationHandlerAnimated:](self, "finishAnimationHandlerAnimated:", v25);
        }
LABEL_12:
        ++v24;
      }
      while (v21 != v24);
      v56 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      v21 = v56;
    }
    while (v56);
  }

}

- (CGRect)convertRectForComponent:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "center");
  v6 = v5;
  objc_msgSend(v4, "bounds");
  v8 = v6 - v7 * 0.5;
  objc_msgSend(v4, "center");
  v10 = v9;
  objc_msgSend(v4, "bounds");
  v12 = v10 - v11 * 0.5;
  objc_msgSend(v4, "bounds");
  v14 = v13;
  objc_msgSend(v4, "bounds");
  v16 = v15;
  -[SXComponentAnimationController viewport](self, "viewport");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "convertRect:fromView:", v18, v8, v12, v14, v16);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (id)registeredHandlerForComponent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SXComponentAnimationController registeredComponents](self, "registeredComponents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "component");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)animatingHandlerForComponent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SXComponentAnimationController registeredComponents](self, "registeredComponents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "component");
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)finishAnimationHandlerAnimated:(id)a3
{
  void *v4;
  void *animationHandlersToFinish;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  -[SXComponentAnimationController animationHandlersToFinish](self, "animationHandlersToFinish");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SXComponentAnimationController animationHandlersToFinish](self, "animationHandlersToFinish");
    animationHandlersToFinish = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(animationHandlersToFinish, "addObject:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", v7);
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    animationHandlersToFinish = self->_animationHandlersToFinish;
    self->_animationHandlersToFinish = v6;
  }

  -[SXComponentAnimationController startOrStopDisplayLink](self, "startOrStopDisplayLink");
}

- (void)startOrStopDisplayLink
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  CADisplayLink *v10;
  CADisplayLink *displayLink;
  void *v12;
  CADisplayLink *v13;
  void *v14;
  CADisplayLink *v15;

  -[SXComponentAnimationController displayLink](self, "displayLink");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[SXComponentAnimationController animationHandlersToFinish](self, "animationHandlersToFinish");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel_displayLinkTick_);
      v10 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->_displayLink;
      self->_displayLink = v10;

      -[SXComponentAnimationController displayLink](self, "displayLink");
      v15 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v15, "addToRunLoop:forMode:", v12, *MEMORY[0x24BDBCB80]);

      v13 = v15;
LABEL_9:

      return;
    }
  }
  -[SXComponentAnimationController displayLink](self, "displayLink");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[SXComponentAnimationController animationHandlersToFinish](self, "animationHandlersToFinish");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      -[SXComponentAnimationController displayLink](self, "displayLink");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "invalidate");

      v13 = self->_displayLink;
      self->_displayLink = 0;
      goto LABEL_9;
    }
  }
}

- (void)displayLinkTick:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  double v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "duration");
  v5 = v4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[SXComponentAnimationController animationHandlersToFinish](self, "animationHandlersToFinish", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = v5 + v5;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "factor");
        if (v15 >= 1.0)
        {
          -[SXComponentAnimationController animationHandlersToFinish](self, "animationHandlersToFinish");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeObject:", v14);

          objc_msgSend(v14, "updateAnimationWithFactor:", 1.0);
          objc_msgSend(v14, "finishAnimation");
          v10 = 1;
        }
        else
        {
          objc_msgSend(v14, "factor");
          v17 = v11 + v16;
          if (v17 > 1.0)
            v17 = 1.0;
          objc_msgSend(v14, "updateAnimationWithFactor:", v17);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);

    if ((v10 & 1) != 0)
      -[SXComponentAnimationController startOrStopDisplayLink](self, "startOrStopDisplayLink");
  }
  else
  {

  }
}

- (NSMutableSet)registeredComponents
{
  return self->_registeredComponents;
}

- (void)setRegisteredComponents:(id)a3
{
  objc_storeStrong((id *)&self->_registeredComponents, a3);
}

- (NSMutableSet)animatingComponents
{
  return self->_animatingComponents;
}

- (void)setAnimatingComponents:(id)a3
{
  objc_storeStrong((id *)&self->_animatingComponents, a3);
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (NSMutableSet)animationHandlersToFinish
{
  return self->_animationHandlersToFinish;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationHandlersToFinish, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
  objc_storeStrong((id *)&self->_animatingComponents, 0);
  objc_storeStrong((id *)&self->_registeredComponents, 0);
}

@end
