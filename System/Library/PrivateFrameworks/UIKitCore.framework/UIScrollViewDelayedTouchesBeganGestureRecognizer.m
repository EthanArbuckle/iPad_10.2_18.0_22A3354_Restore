@implementation UIScrollViewDelayedTouchesBeganGestureRecognizer

- (void)dealloc
{
  objc_super v3;

  -[UIScrollViewDelayedTouchesBeganGestureRecognizer clearTimer](self, "clearTimer");
  v3.receiver = self;
  v3.super_class = (Class)UIScrollViewDelayedTouchesBeganGestureRecognizer;
  -[UIGestureRecognizer dealloc](&v3, sel_dealloc);
}

- (void)clearTimer
{
  UIDelayedAction *touchDelay;

  -[UIDelayedAction unschedule](self->_touchDelay, "unschedule");
  touchDelay = self->_touchDelay;
  self->_touchDelay = 0;

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  UIDelayedAction *v10;
  void *v11;
  UIDelayedAction *v12;
  UIDelayedAction *touchDelay;
  CGFloat v14;
  CGFloat v15;
  id v16;

  v16 = a4;
  v6 = a3;
  -[UIScrollViewDelayedTouchesBeganGestureRecognizer clearTimer](self, "clearTimer");
  -[UIScrollViewDelayedTouchesBeganGestureRecognizer _clientView](self, "_clientView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "delaysContentTouches");

  if (v8)
  {
    v9 = -[UIScrollViewDelayedTouchesBeganGestureRecognizer _shouldMakeTimerForDelayedContentTouches:](self, "_shouldMakeTimerForDelayedContentTouches:", v6);

    if (v9)
    {
      v10 = [UIDelayedAction alloc];
      -[UIScrollViewDelayedTouchesBeganGestureRecognizer _clientView](self, "_clientView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_touchDelayForScrollDetection");
      v12 = -[UIDelayedAction initWithTarget:action:userInfo:delay:mode:](v10, "initWithTarget:action:userInfo:delay:mode:", self, sel_sendDelayedTouches, 0, *MEMORY[0x1E0C99860]);
      touchDelay = self->_touchDelay;
      self->_touchDelay = v12;

    }
    -[UIGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v16);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UIGestureRecognizer _centroidOfTouches:excludingEnded:](self, "_centroidOfTouches:excludingEnded:", v6, 0);
    self->_startSceneReferenceLocation.x = v14;
    self->_startSceneReferenceLocation.y = v15;
  }
  else
  {
    -[UIScrollViewDelayedTouchesBeganGestureRecognizer sendTouchesShouldBeginForTouches:withEvent:](self, "sendTouchesShouldBeginForTouches:withEvent:", v6, v16);
  }

}

- (void)sendTouchesShouldBeginForTouches:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int ShouldBegin;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[UIScrollViewDelayedTouchesBeganGestureRecognizer clearTimer](self, "clearTimer");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v20 = 5;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIScrollViewDelayedTouchesBeganGestureRecognizer _clientView](self, "_clientView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        ShouldBegin = _UIViewTouchShouldBegin((uint64_t)v13, v7, v14, v15);

        if (ShouldBegin)
        {
          v17 = (void *)UIApp;
          objc_msgSend(v13, "window");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (id)objc_msgSend(v17, "_touchesEventForWindow:", v18);

          -[UIGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", v13, v19);
        }
        else
        {
          v20 = 3;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  else
  {
    v20 = 5;
  }

  -[UIGestureRecognizer setState:](self, "setState:", v20);
}

- (id)_clientView
{
  UIScrollViewDelayedTouchesBeganGestureRecognizerClient **p_client;
  id WeakRetained;
  id v5;
  char v6;

  p_client = &self->_client;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);
  if (!WeakRetained)
  {
    -[UIGestureRecognizer view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        WeakRetained = v5;
        objc_storeWeak((id *)p_client, WeakRetained);
LABEL_11:

        return WeakRetained;
      }
    }
    else
    {

    }
    WeakRetained = 0;
    goto LABEL_11;
  }
  return WeakRetained;
}

- (void)_resetGestureRecognizer
{
  objc_super v3;

  -[UIScrollViewDelayedTouchesBeganGestureRecognizer clearTimer](self, "clearTimer");
  v3.receiver = self;
  v3.super_class = (Class)UIScrollViewDelayedTouchesBeganGestureRecognizer;
  -[UIGestureRecognizer _resetGestureRecognizer](&v3, sel__resetGestureRecognizer);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
  objc_storeStrong((id *)&self->_touchDelay, 0);
}

- (void)sendTouchesShouldBeginForDelayedTouches:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int ShouldBegin;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[UIScrollViewDelayedTouchesBeganGestureRecognizer clearTimer](self, "clearTimer");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v5)
  {
    v6 = v5;
    v22 = *(_QWORD *)v24;
    v20 = 5;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v22)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v7);
        if (v8)
        {
          v9 = *(id *)(v8 + 24);
          v10 = *(id *)(v8 + 48);
          v11 = *(void **)(v8 + 32);
        }
        else
        {
          v10 = 0;
          v9 = 0;
          v11 = 0;
        }
        v12 = v11;
        objc_msgSend(v12, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIScrollViewDelayedTouchesBeganGestureRecognizer _clientView](self, "_clientView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        ShouldBegin = _UIViewTouchShouldBegin((uint64_t)v9, v10, v13, v14);

        if (ShouldBegin)
        {
          if (v8)
          {
            v16 = *(id *)(v8 + 24);
            v17 = *(void **)(v8 + 48);
          }
          else
          {
            v16 = 0;
            v17 = 0;
          }
          v18 = v17;
          -[UIGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", v16, v18);

        }
        else
        {
          v20 = 3;
        }
        ++v7;
      }
      while (v6 != v7);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v6 = v19;
    }
    while (v19);
  }
  else
  {
    v20 = 5;
  }

  -[UIGestureRecognizer setState:](self, "setState:", v20);
}

- (BOOL)_shouldMakeTimerForDelayedContentTouches:(id)a3
{
  return 1;
}

- (void)sendDelayedTouches
{
  uint64_t v3;
  id v4;

  if (self)
    v3 = -[NSMutableArray copy](self->super._delayedTouches, "copy");
  else
    v3 = 0;
  v4 = (id)v3;
  -[UIScrollViewDelayedTouchesBeganGestureRecognizer sendTouchesShouldBeginForDelayedTouches:](self, "sendTouchesShouldBeginForDelayedTouches:", v3);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char isKindOfClass;
  double v16;
  double v17;
  char v18;
  char v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  float v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  v10 = v8;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i), "view", (_QWORD)v34);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {

          -[UIScrollViewDelayedTouchesBeganGestureRecognizer _clientView](self, "_clientView");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "_scrollHysteresis");
          v17 = v16;
          v18 = objc_msgSend(v10, "_canScrollX");
          v19 = objc_msgSend(v10, "_canScrollY");
          -[UIGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v7);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIGestureRecognizer _centroidOfTouches:excludingEnded:](self, "_centroidOfTouches:excludingEnded:", v20, 0);
          v22 = v21;
          v24 = v23;

          v25 = v22 - self->_startSceneReferenceLocation.x;
          v26 = v24 - self->_startSceneReferenceLocation.y;
          -[UIGestureRecognizer view](self, "view");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "window");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            objc_msgSend(v27, "window");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "_convertOffsetFromSceneReferenceSpace:", v25, v26);
            v25 = -[UIView _convertOffset:fromView:](v27, 0, v30, v31);
            v26 = v32;

          }
          v33 = v17;
          if ((v18 & 1) == 0 && fabs(v25) > v33 || (v19 & 1) == 0 && fabs(v26) > v33)
            -[UIScrollViewDelayedTouchesBeganGestureRecognizer sendDelayedTouches](self, "sendDelayedTouches");

          goto LABEL_18;
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v11)
        continue;
      break;
    }
    v10 = v8;
  }
LABEL_18:

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  UIScrollViewDelayedTouchesBeganGestureRecognizer *v5;
  uint64_t v6;
  id v7;

  if (-[UIGestureRecognizer state](self, "state", a3, a4) == UIGestureRecognizerStateBegan)
  {
    v5 = self;
    v6 = 3;
  }
  else
  {
    if (self->_touchDelay)
    {
      v7 = (id)-[NSMutableArray copy](self->super._delayedTouches, "copy");
      -[UIScrollViewDelayedTouchesBeganGestureRecognizer sendTouchesShouldBeginForDelayedTouches:](self, "sendTouchesShouldBeginForDelayedTouches:", v7);

      return;
    }
    v5 = self;
    v6 = 5;
  }
  -[UIGestureRecognizer setState:](v5, "setState:", v6);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[UIScrollViewDelayedTouchesBeganGestureRecognizer clearTimer](self, "clearTimer", a3, a4);
  -[UIGestureRecognizer setState:](self, "setState:", 5);
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

@end
