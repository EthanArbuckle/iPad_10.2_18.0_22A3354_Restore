@implementation CRLCanvasRep

- (CRLCanvasRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CRLCanvasRep *v12;
  CRLCanvasRep *v13;
  id v14;
  dispatch_queue_t v15;
  void *mKnobsAccessQueue;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246AE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0FD70();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246B08);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep initWithLayout:canvas:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 144, 0, "invalid nil value for '%{public}s'", "layout");

  }
  v18.receiver = self;
  v18.super_class = (Class)CRLCanvasRep;
  v12 = -[CRLCanvasRep init](&v18, "init");
  v13 = v12;
  if (v12)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v12->mLayout, a3);
      v14 = objc_storeWeak((id *)&v13->mCanvas, v8);
      objc_msgSend(v8, "i_registerRep:", v13);

      v13->mShowKnobsWhenManipulated = 0;
      v15 = dispatch_queue_create("com.apple.freeform.CRLCanvasRep.knobsQueue", 0);
      mKnobsAccessQueue = v13->mKnobsAccessQueue;
      v13->mKnobsAccessQueue = (OS_dispatch_queue *)v15;
    }
    else
    {
      mKnobsAccessQueue = v12;
      v13 = 0;
    }

  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->mCanvas, 0);
  v3.receiver = self;
  v3.super_class = (Class)CRLCanvasRep;
  -[CRLCanvasRep dealloc](&v3, "dealloc");
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  Class v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  Class v14;
  NSString *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  CGRect v22;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  objc_opt_class(v6, v7);
  v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_opt_class(v12, v13);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  -[CRLCanvasRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  v18 = NSStringFromCGRect(v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p info=<%@ %p> layout=<%@ %p> frameInUnscaledCanvas=%@>"), v5, self, v10, v11, v16, v17, v19));

  return v20;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasController"));

  if (!v4)
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246B28);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0FE00((uint64_t)self, v5);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246B48);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep interactiveCanvasController]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 179, 0, "no ICC for this rep (%@); consider asking self.canvas instead",
      self);

  }
  return (CRLInteractiveCanvasController *)v4;
}

- (CRLCanvasLayout)layout
{
  return self->mLayout;
}

- (CRLCanvasElementInfo)info
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "info"));

  return (CRLCanvasElementInfo *)v3;
}

- (_TtC8Freeform20CRLCommandController)commandController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "commandController"));

  return (_TtC8Freeform20CRLCommandController *)v3;
}

- (id)p_connectedReps
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "connectedLayouts"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas", (_QWORD)v15));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "repForLayout:", v11));

        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)p_setNeedsDisplayForParentChangeIfNeeded
{
  id WeakRetained;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->mParentRep);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v6 = objc_msgSend(v5, "isCanvasInteractive");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep ancestorRepForDrawingIntoLayer](self, "ancestorRepForDrawingIntoLayer"));
      if (v7)
      {
        v8 = v7;
        -[CRLCanvasRep setNeedsDisplay](self, "setNeedsDisplay");
        v7 = v8;
      }

    }
  }
}

- (void)setParentRep:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mParentRep);

  if (WeakRetained != obj)
  {
    -[CRLCanvasRep p_setNeedsDisplayForParentChangeIfNeeded](self, "p_setNeedsDisplayForParentChangeIfNeeded");
    objc_storeWeak((id *)&self->mParentRep, obj);
    -[CRLCanvasRep p_setNeedsDisplayForParentChangeIfNeeded](self, "p_setNeedsDisplayForParentChangeIfNeeded");
  }

}

- (NSArray)childReps
{
  if (self->mChildReps)
    return (NSArray *)self->mChildReps;
  else
    return (NSArray *)&__NSArray0__struct;
}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if ((objc_opt_respondsToSelector(self, a3) & 1) != 0)
    -[CRLCanvasRep performSelector:](self, "performSelector:", a3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "recursivelyPerformSelectorIfImplemented:", a3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v6 = a4;
  if ((objc_opt_respondsToSelector(self, a3) & 1) != 0)
    -[CRLCanvasRep performSelector:withObject:](self, "performSelector:withObject:", a3, v6);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "recursivelyPerformSelectorIfImplemented:withObject:", a3, v6);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v8 = a4;
  v9 = a5;
  if ((objc_opt_respondsToSelector(self, a3) & 1) != 0)
    -[CRLCanvasRep performSelector:withObject:withObject:](self, "performSelector:withObject:withObject:", a3, v8, v9);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "recursivelyPerformSelectorIfImplemented:withObject:withObject:", a3, v8, v9);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)recursivelyPerformSelector:(SEL)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  -[CRLCanvasRep performSelector:](self, "performSelector:");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "recursivelyPerformSelector:", a3);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)recursivelyPerformSelector:(SEL)a3 withObject:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v6 = a4;
  -[CRLCanvasRep performSelector:withObject:](self, "performSelector:withObject:", a3, v6);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "recursivelyPerformSelector:withObject:", a3, v6);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)recursivelyPerformSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v8 = a4;
  v9 = a5;
  -[CRLCanvasRep performSelector:withObject:withObject:](self, "performSelector:withObject:withObject:", a3, v8, v9);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v14), "recursivelyPerformSelector:withObject:withObject:", a3, v8, v9);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)i_willBeRemoved
{
  NSObject *mKnobsAccessQueue;
  CRLCanvasRenderable *mSelectionHighlightRenderable;
  id WeakRetained;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  _QWORD block[5];

  -[CRLCanvasRep willBeRemoved](self, "willBeRemoved");
  mKnobsAccessQueue = self->mKnobsAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100232FAC;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_sync(mKnobsAccessQueue, block);
  -[CRLCanvasRenderable setDelegate:](self->mSelectionHighlightRenderable, "setDelegate:", 0);
  mSelectionHighlightRenderable = self->mSelectionHighlightRenderable;
  self->mSelectionHighlightRenderable = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "i_unregisterRep:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v7 = objc_msgSend(v6, "isCanvasInteractive");

  if (v7)
  {
    -[CRLCanvasRep i_invalidateSelectionHighlightRenderable](self, "i_invalidateSelectionHighlightRenderable");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "i_interactiveCanvasLayerHelper"));
    objc_msgSend(v9, "repWasRemoved:", self);

  }
  +[NSRunLoop cancelPreviousPerformRequestsWithTarget:](NSRunLoop, "cancelPreviousPerformRequestsWithTarget:", self);
  self->mHasBeenRemoved = 1;
}

- (BOOL)hasBeenRemoved
{
  return self->mHasBeenRemoved;
}

- (CRLCanvasRep)parentRepToPerformSelecting
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  if (v3)
  {
    do
    {
      if ((objc_msgSend(v3, "canSelectChildRep:", self) & 1) != 0)
        break;
      v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentRep"));

      v3 = (void *)v4;
    }
    while (v4);
  }
  return (CRLCanvasRep *)v3;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)selectChildRep:(id)a3 extendingSelection:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3, a4);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101246B68);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E0FE90();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101246B88);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep selectChildRep:extendingSelection:]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 359, 0, "subclass should override this method");

}

- (BOOL)occludesSelectedRep
{
  BOOL v2;
  void *v4;
  unsigned __int8 v5;
  char v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  CRLCanvasRep *v14;
  void *v15;
  unsigned int v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep repForSelecting](self, "repForSelecting"));
  v5 = objc_msgSend(v4, "isSelected");

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "allRepsOrdered"));

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(CRLCanvasRep **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v2 = v14 != self;
          if (v14 == self)
          {
LABEL_17:
            v17 = 0;
            goto LABEL_18;
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "repForSelecting", (_QWORD)v19));
          if (objc_msgSend(v15, "isSelected"))
          {
            v16 = -[CRLCanvasRep canBeOccluded](v14, "canBeOccluded");

            if (v16)
            {
              -[CRLCanvasRep frameInUnscaledCanvas](v14, "frameInUnscaledCanvas");
              if (-[CRLCanvasRep intersectsUnscaledRect:](self, "intersectsUnscaledRect:"))
                goto LABEL_17;
            }
          }
          else
          {

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v11)
          continue;
        break;
      }
    }
    v17 = 1;
LABEL_18:

    v6 = v17 | v2;
  }
  return v6 & 1;
}

- (BOOL)canBeOccluded
{
  return 1;
}

- (BOOL)canOcclude
{
  return 1;
}

- (CRLCanvasRep)ancestorRepForDrawingIntoLayer
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->mParentRep);
  if (WeakRetained)
  {
    do
    {
      if ((objc_msgSend(WeakRetained, "drawsDescendantsIntoLayer") & 1) != 0)
        break;
      v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "parentRep"));

      WeakRetained = (id)v3;
    }
    while (v3);
  }
  return (CRLCanvasRep *)WeakRetained;
}

- (void)addToSet:(id)a3
{
  objc_msgSend(a3, "addObject:", self);
}

- (CGRect)naturalBounds
{
  void *v2;
  void *v3;
  double v4;
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
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "geometry"));
  objc_msgSend(v3, "size");
  v4 = sub_10005FDDC();
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)convertNaturalRectToUnscaledCanvas:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v7, "convertNaturalRectToUnscaledCanvas:", x, y, width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)convertNaturalRectFromUnscaledCanvas:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v7, "convertNaturalRectFromUnscaledCanvas:", x, y, width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGPath)newPathInScaledCanvasFromNaturalRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  void *v9;
  void *v10;
  id WeakRetained;
  double v12;
  double v13;
  double MinX;
  CGFloat MinY;
  double MaxX;
  CGFloat v17;
  double v18;
  CGFloat MaxY;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "transformInRoot");
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v31 = 0u;
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "viewScale");
  v13 = v12;

  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  MinX = CGRectGetMinX(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  MinY = CGRectGetMinY(v35);
  v29 = *((double *)&v33 + 1) + MinY * *((double *)&v32 + 1) + *((double *)&v31 + 1) * MinX;
  v30 = *(double *)&v33 + MinY * *(double *)&v32 + *(double *)&v31 * MinX;
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  MaxX = CGRectGetMaxX(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  v17 = CGRectGetMinY(v37);
  v27 = *((double *)&v33 + 1) + v17 * *((double *)&v32 + 1) + *((double *)&v31 + 1) * MaxX;
  v28 = *(double *)&v33 + v17 * *(double *)&v32 + *(double *)&v31 * MaxX;
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v18 = CGRectGetMaxX(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  MaxY = CGRectGetMaxY(v39);
  v20 = *(double *)&v33 + MaxY * *(double *)&v32 + *(double *)&v31 * v18;
  v21 = *((double *)&v33 + 1) + MaxY * *((double *)&v32 + 1) + *((double *)&v31 + 1) * v18;
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v22 = CGRectGetMinX(v40);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  v23 = CGRectGetMaxY(v41);
  v24 = *(double *)&v33 + v23 * *(double *)&v32 + *(double *)&v31 * v22;
  v25 = *((double *)&v33 + 1) + v23 * *((double *)&v32 + 1) + *((double *)&v31 + 1) * v22;
  CGPathMoveToPoint(Mutable, 0, v13 * v30, v13 * v29);
  CGPathAddLineToPoint(Mutable, 0, v13 * v28, v13 * v27);
  CGPathAddLineToPoint(Mutable, 0, v13 * v20, v13 * v21);
  CGPathAddLineToPoint(Mutable, 0, v13 * v24, v13 * v25);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPoint)convertNaturalPointToUnscaledCanvas:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v5, "convertNaturalPointToUnscaledCanvas:", x, y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v5, "convertNaturalPointFromUnscaledCanvas:", x, y);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGRect)frameInUnscaledCanvas
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v2, "frameInRoot");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)frameInScreenSpace
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  -[CRLCanvasRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  objc_msgSend(v3, "convertUnscaledToBoundsRect:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasView"));
  objc_msgSend(v12, "convertRect:toView:", 0, v5, v7, v9, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "window"));
  objc_msgSend(v21, "convertRect:toWindow:", 0, v14, v16, v18, v20);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v30 = v23;
  v31 = v25;
  v32 = v27;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CGRect)layerFrameInScaledCanvas
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned __int8 v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id WeakRetained;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
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
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = objc_msgSend(v3, "parentAutosizes");

  if (-[CRLCanvasRep isBeingRotated](self, "isBeingRotated"))
  {
    if (v4
      && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep")),
          (objc_msgSend(v3, "isBeingRotated") & 1) == 0))
    {

    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
      v6 = objc_msgSend(v5, "wantsNormalLayoutDuringDynamicRotation");

      if (v4)
      if ((v6 & 1) == 0)
      {
        x = self->mOriginalLayerFrameInScaledCanvas.origin.x;
        y = self->mOriginalLayerFrameInScaledCanvas.origin.y;
        width = self->mOriginalLayerFrameInScaledCanvas.size.width;
        height = self->mOriginalLayerFrameInScaledCanvas.size.height;
        goto LABEL_14;
      }
    }
  }
  if (-[CRLCanvasRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
    -[CRLCanvasRep i_baseFrameInUnscaledCanvasForPositioningLayer](self, "i_baseFrameInUnscaledCanvasForPositioningLayer");
    objc_msgSend(WeakRetained, "convertUnscaledToBoundsRect:");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v20, "contentsScale");
    x = sub_100063150(v13, v15, v17, v19, v21);
    y = v22;
    width = v23;
    height = v24;

  }
  else if (-[CRLCanvasRep isBeingDragged](self, "isBeingDragged"))
  {
    v25 = self->mOriginalLayerFrameInScaledCanvas.origin.x;
    v26 = self->mOriginalLayerFrameInScaledCanvas.origin.y;
    width = self->mOriginalLayerFrameInScaledCanvas.size.width;
    height = self->mOriginalLayerFrameInScaledCanvas.size.height;
    -[CRLCanvasRep layerOffsetForDragging](self, "layerOffsetForDragging");
    v28 = v27;
    v30 = v29;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v31, "contentsScale");
    v33 = sub_1000630F8(v28, v30, v32);
    x = sub_1000603D0(v25, v26, v33);
    y = v34;

  }
  else
  {
    -[CRLCanvasRep i_layerFrameInScaledCanvasIgnoringDragging](self, "i_layerFrameInScaledCanvasIgnoringDragging");
    x = v35;
    y = v36;
    width = v37;
    height = v38;
  }
LABEL_14:
  v39 = x;
  v40 = y;
  v41 = width;
  v42 = height;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (CGRect)i_layerFrameInScaledCanvasIgnoringDragging
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id WeakRetained;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
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
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = objc_msgSend(v3, "parentAutosizes");

  if ((v4 & 1) == 0)
  {
    if (-[CRLCanvasRep isBeingRotated](self, "isBeingRotated"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
      v6 = objc_msgSend(v5, "wantsNormalLayoutDuringDynamicRotation");

      if ((v6 & 1) == 0)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101246BA8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E0FF10();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101246BC8);
        v7 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep i_layerFrameInScaledCanvasIgnoringDragging]"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 535, 0, "i_layerFrameInScaledCanvasIgnoringDragging is invalid in this state");

      }
    }
  }
  v10 = -[CRLCanvasRep directlyManagesLayerContent](self, "directlyManagesLayerContent");
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  -[CRLCanvasRep i_baseFrameInUnscaledCanvasForPositioningLayer](self, "i_baseFrameInUnscaledCanvasForPositioningLayer");
  objc_msgSend(WeakRetained, "convertUnscaledToBoundsRect:");
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  if (v10)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v20, "contentsScale");
    v22 = sub_100063150(v16, v17, v18, v19, v21);
    v24 = v23;
    v26 = v25;
    v28 = v27;

  }
  else
  {
    v22 = sub_100063728(v12, v13, v14, v15);
    v24 = v29;
    v26 = v30;
    v28 = v31;
  }

  v32 = v22;
  v33 = v24;
  v34 = v26;
  v35 = v28;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGRect)layerFrameInScaledCanvasRelativeToParent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[CRLCanvasRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
    objc_msgSend(v12, "layerFrameInScaledCanvas");
    v4 = sub_1000603B8(v4, v6, v13);
    v6 = v14;

  }
  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGPoint)layerOffsetForDragging
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  CRLCanvasRep *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGPoint result;

  *(_QWORD *)&v3 = objc_opt_class(CRLCanvasLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parent"));
  v8 = sub_100221D0C(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "repForLayout:", v9));

  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v11, "isBeingDragged"))
  {
    v12 = v11;
    -[CRLCanvasRep layerFrameInScaledCanvas](v12, "layerFrameInScaledCanvas");
  }
  else
  {
    v12 = self;
    -[CRLCanvasRep i_layerFrameInScaledCanvasIgnoringDragging](v12, "i_layerFrameInScaledCanvasIgnoringDragging");
  }
  v15 = v13;
  v16 = v14;
  -[CRLCanvasRep i_originalLayerFrameInScaledCanvas](v12, "i_originalLayerFrameInScaledCanvas");
  v18 = sub_1000603B8(v15, v16, v17);
  v20 = v19;

  v21 = v18;
  v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGAffineTransform)transformToConvertNaturalToLayerRelative
{
  void *v5;
  void *v6;
  id WeakRetained;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v17;
  CGAffineTransform v18;

  memset(&v18, 0, sizeof(v18));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "transformInRoot");
  else
    memset(&v18, 0, sizeof(v18));

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "viewScale");
  v9 = v8;

  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&t2, v9, v9);
  t1 = v18;
  CGAffineTransformConcat(&v17, &t1, &t2);
  -[CRLCanvasRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas");
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeTranslation(&t1, -v10, -v11);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v14 = v17;
  v13 = t1;
  return CGAffineTransformConcat(retstr, &v14, &v13);
}

- (CGAffineTransform)transformToConvertNaturalFromLayerRelative
{
  CGAffineTransform v5;

  -[CRLCanvasRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGPoint)convertNaturalPointToLayerRelative:(CGPoint)a3
{
  float64x2_t v3;
  double v4;
  double y;
  double x;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CRLCanvasRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
  v3 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, y), v7, x));
  v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (CGPoint)convertNaturalPointFromLayerRelative:(CGPoint)a3
{
  float64x2_t v3;
  double v4;
  double y;
  double x;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CRLCanvasRep transformToConvertNaturalFromLayerRelative](self, "transformToConvertNaturalFromLayerRelative");
  v3 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, y), v7, x));
  v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (CGRect)convertNaturalRectToLayerRelative:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform v7;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CRLCanvasRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (CGRect)convertNaturalRectFromLayerRelative:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform v7;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CRLCanvasRep transformToConvertNaturalFromLayerRelative](self, "transformToConvertNaturalFromLayerRelative");
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[CRLCanvasRep naturalBounds](self, "naturalBounds", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (BOOL)containsPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v13;
  CGRect v14;

  v5 = sub_10005FD98(a3.x, a3.y, a4.width + a4.width);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CRLCanvasRep naturalBounds](self, "naturalBounds");
  v14.origin.x = v5;
  v14.origin.y = v7;
  v14.size.width = v9;
  v14.size.height = v11;
  return CGRectIntersectsRect(v13, v14);
}

- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4 passingTest:(id)a5
{
  _BOOL8 v5;
  uint64_t (**v7)(id, id);
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  CRLCanvasRep *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  uint64_t v28;
  CRLCanvasRep *v29;
  CRLCanvasRep *v30;
  CRLCanvasRep *v31;
  double x;
  float64x2_t v34;
  double y;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  float64x2_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v5 = a4;
  y = a3.y;
  x = a3.x;
  v7 = (uint64_t (**)(id, id))a5;
  if (-[CRLCanvasRep shouldHitTestChildrenLikeTopLevelReps](self, "shouldHitTestChildrenLikeTopLevelReps"))
  {
    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childRepsForHitTesting](self, "childRepsForHitTesting"));
    +[CRLInteractiveCanvasController smallRepOutsetForHitTestingWithPrecision:](CRLInteractiveCanvasController, "smallRepOutsetForHitTestingWithPrecision:", v5);
    v15 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hitRep:withPrecision:inTopLevelReps:smallRepOutset:unscaledPointTransformForRep:passingTest:", v5, v13, 0, v7, v9, v11, v14));

  }
  else
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childRepsForHitTesting](self, "childRepsForHitTesting"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "reverseObjectEnumerator"));

    v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v41;
      v34 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
      while (2)
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v19)
            objc_enumerationMutation(v12);
          v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layout", *(_QWORD *)&x));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "geometry"));
          v24 = v23;
          if (v23)
          {
            objc_msgSend(v23, "inverseTransform");
            v25 = v37;
            v26 = v38;
            v27 = v39;
          }
          else
          {
            v38 = 0u;
            v39 = 0u;
            v27 = 0uLL;
            v25 = 0uLL;
            v26 = 0uLL;
            v37 = 0u;
          }
          v36 = vaddq_f64(v27, vmlaq_f64(vmulq_n_f64(v26, y), v34, v25));

          v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "hitRep:withPrecision:passingTest:", v5, v7, *(_OWORD *)&v36));
          if (v28)
          {
            v15 = (CRLCanvasRep *)v28;
            goto LABEL_16;
          }
        }
        v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v18)
          continue;
        break;
      }
    }
    v15 = 0;
  }
LABEL_16:

  if (!v15)
  {
    if (-[CRLCanvasRep containsPoint:withPrecision:](self, "containsPoint:withPrecision:", v5, x, y))
      v29 = self;
    else
      v29 = 0;
    v30 = v29;
    v31 = v30;
    if (v7 && v30)
    {
      v15 = self;
      if ((v7[2](v7, v30) & 1) == 0)
      {

        v15 = 0;
      }
    }
    else
    {
      v15 = v30;
    }
  }

  return v15;
}

- (id)hitRep:(CGPoint)a3 passingTest:(id)a4
{
  return -[CRLCanvasRep hitRep:withPrecision:passingTest:](self, "hitRep:withPrecision:passingTest:", 0, a4, a3.x, a3.y);
}

- (id)hitRep:(CGPoint)a3 withPrecision:(BOOL)a4
{
  return -[CRLCanvasRep hitRep:withPrecision:passingTest:](self, "hitRep:withPrecision:passingTest:", a4, 0, a3.x, a3.y);
}

- (id)hitReps:(CGPoint)a3 withSlop:(CGSize)a4
{
  _QWORD v5[4];
  CGSize v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100234614;
  v5[3] = &unk_101246BE8;
  v6 = a4;
  return (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep hitReps:withSlopBlock:](self, "hitReps:withSlopBlock:", v5, a3.x, a3.y));
}

- (id)hitReps:(CGPoint)a3 withSlopBlock:(id)a4
{
  double (**v5)(id, CRLCanvasRep *);
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  void *v20;
  double width;
  double v22;
  double height;
  double x;
  float64x2_t v26;
  double y;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  float64x2_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  y = a3.y;
  x = a3.x;
  v5 = (double (**)(id, CRLCanvasRep *))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childRepsForHitTesting](self, "childRepsForHitTesting"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reverseObjectEnumerator"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
    v26 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layout", *(_QWORD *)&x));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "geometry"));
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "inverseTransform");
          v17 = v29;
          v18 = v30;
          v19 = v31;
        }
        else
        {
          v30 = 0u;
          v31 = 0u;
          v19 = 0uLL;
          v17 = 0uLL;
          v18 = 0uLL;
          v29 = 0u;
        }
        v28 = vaddq_f64(v19, vmlaq_f64(vmulq_n_f64(v18, y), v26, v17));

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hitReps:withSlopBlock:", v5, *(_OWORD *)&v28));
        if (objc_msgSend(v20, "count"))
          objc_msgSend(v6, "addObjectsFromArray:", v20);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v10);
  }

  if (v5)
  {
    width = v5[2](v5, self);
    height = v22;
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  if (-[CRLCanvasRep containsPoint:withSlop:](self, "containsPoint:withSlop:", x, y, width, height, *(_QWORD *)&x))
    objc_msgSend(v6, "addObject:", self);

  return v6;
}

- (id)hitRepChrome:(CGPoint)a3 passingTest:(id)a4
{
  uint64_t (**v5)(id, CRLCanvasRep *);
  void *v6;
  CRLCanvasRep *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  void *v19;
  CRLCanvasRep *v20;
  char v21;
  CRLCanvasRep *v22;
  double x;
  float64x2_t v25;
  double y;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  float64x2_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  y = a3.y;
  x = a3.x;
  v5 = (uint64_t (**)(id, CRLCanvasRep *))a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childRepsForHitTesting](self, "childRepsForHitTesting"));
  v7 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));

  v8 = -[CRLCanvasRep countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    v25 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout", *(_QWORD *)&x));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geometry"));
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "inverseTransform");
          v16 = v28;
          v17 = v29;
          v18 = v30;
        }
        else
        {
          v29 = 0u;
          v30 = 0u;
          v18 = 0uLL;
          v16 = 0uLL;
          v17 = 0uLL;
          v28 = 0u;
        }
        v27 = vaddq_f64(v18, vmlaq_f64(vmulq_n_f64(v17, y), v25, v16));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "hitRepChrome:passingTest:", v5, *(_OWORD *)&v27));
        if (v19)
        {
          v22 = v19;
          goto LABEL_18;
        }
      }
      v9 = -[CRLCanvasRep countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v9)
        continue;
      break;
    }
  }

  if (-[CRLCanvasRep hitRepChrome:](self, "hitRepChrome:", x, y))
  {
    v7 = self;
    v20 = 0;
    if (v7)
    {
      if (v5)
      {
        v21 = v5[2](v5, v7);
        v22 = 0;
        v20 = 0;
        if ((v21 & 1) == 0)
        {
LABEL_18:

          v20 = v22;
          v7 = v22;
        }
      }
    }
  }
  else
  {
    v20 = 0;
    v7 = 0;
  }

  return v7;
}

- (BOOL)hitRepChrome:(CGPoint)a3
{
  return 0;
}

- (id)i_smallHitRepNearPoint:(CGPoint)a3 smallRepOutset:(double)a4 forShortestDistance:(double *)a5 unscaledPointTransformForRep:(id)a6 passingTest:(id)a7
{
  unsigned int (**v11)(id, CRLCanvasRep *);
  void *v12;
  void *v13;
  id v14;
  id v15;
  CRLCanvasRep *v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float64x2_t v23;
  float64x2_t v24;
  float64x2_t v25;
  void *v26;
  void *v27;
  CRLCanvasRep *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  CRLCanvasRep *v50;
  CRLCanvasRep *v52;
  double x;
  float64x2_t v54;
  double y;
  id v56;
  float64x2_t v57;
  double v58;
  float64x2_t v59;
  float64x2_t v60;
  float64x2_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  CGPoint v67;
  CGRect v68;

  y = a3.y;
  x = a3.x;
  v56 = a6;
  v11 = (unsigned int (**)(id, CRLCanvasRep *))a7;
  if (-[CRLCanvasRep i_shouldSmallHitRepTestingRecurse](self, "i_shouldSmallHitRepTestingRecurse"))
  {
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v52 = self;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childRepsForHitTesting](self, "childRepsForHitTesting"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reverseObjectEnumerator"));

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v63;
      v54 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&x, 0);
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v63 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layout"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "geometry"));
          v22 = v21;
          if (v21)
          {
            objc_msgSend(v21, "inverseTransform");
            v23 = v59;
            v24 = v60;
            v25 = v61;
          }
          else
          {
            v60 = 0u;
            v61 = 0u;
            v25 = 0uLL;
            v23 = 0uLL;
            v24 = 0uLL;
            v59 = 0u;
          }
          v57 = vaddq_f64(v25, vmlaq_f64(vmulq_n_f64(v24, y), v54, v23));

          v58 = *a5;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "i_smallHitRepNearPoint:smallRepOutset:forShortestDistance:unscaledPointTransformForRep:passingTest:", &v58, v56, v11, *(_OWORD *)&v57, a4));
          v27 = v26;
          if (v26 && v58 < *a5)
          {
            v28 = v26;

            *a5 = v58;
            v16 = v28;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    self = v52;
  }
  else
  {
    v16 = 0;
  }
  -[CRLCanvasRep p_transformNaturalPoint:inUnscaledSpaceWithTransformFromBlock:](self, "p_transformNaturalPoint:inUnscaledSpaceWithTransformFromBlock:", v56, x, y);
  v30 = v29;
  v32 = v31;
  if (!-[CRLCanvasRep i_shouldCountAsClosestSmallRepForSizeLimit:](self, "i_shouldCountAsClosestSmallRepForSizeLimit:", a4))
  {
    LOBYTE(v58) = 0;
    -[CRLCanvasRep shortestDistanceToPoint:countAsHit:](self, "shortestDistanceToPoint:countAsHit:", &v58, v30, v32);
    if (!LOBYTE(v58))
      goto LABEL_31;
    goto LABEL_27;
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v33, "viewScale");
  v35 = v34;

  -[CRLCanvasRep naturalBounds](self, "naturalBounds");
  v40 = v39;
  v41 = v36;
  v42 = v37;
  v43 = v38;
  v44 = 0.0;
  v45 = -a4;
  v46 = 0.0;
  if (v35 * v37 < a4)
    v46 = v45 / v35;
  if (v35 * v38 < a4)
    v44 = v45 / v35;
  v47 = v40;
  v68 = CGRectInset(*(CGRect *)(&v36 - 1), v46, v44);
  v67.x = v30;
  v67.y = v32;
  if (CGRectContainsPoint(v68, v67))
  {
    v48 = sub_1000610A4(v30, v32, v40, v41, v42, v43);
LABEL_27:
    v49 = v48;
    if (v48 < *a5 && (!v11 || v11[2](v11, self)))
    {
      *a5 = v49;
      v50 = self;

      v16 = v50;
    }
  }
LABEL_31:

  return v16;
}

- (CGPoint)p_transformNaturalPoint:(CGPoint)a3 inUnscaledSpaceWithTransformFromBlock:(id)a4
{
  double y;
  double x;
  void (**v7)(float64x2_t *__return_ptr, id, CRLCanvasRep *);
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (a4)
  {
    v7 = (void (**)(float64x2_t *__return_ptr, id, CRLCanvasRep *))a4;
    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
    v14 = v9;
    v15 = v8;
    v17 = 0u;
    v18 = 0u;
    v16 = 0u;
    v7[2](&v16, v7, self);

    -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v17, v14), v16, v15)));
    x = v10;
    y = v11;
  }
  v12 = x;
  v13 = y;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)i_shouldSmallHitRepTestingRecurse
{
  return 0;
}

- (BOOL)i_shouldCountAsClosestSmallRepForSizeLimit:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  float v10;
  double v11;
  void *v12;
  double v13;
  BOOL v14;

  -[CRLCanvasRep naturalBounds](self, "naturalBounds");
  v6 = v5;
  v8 = v7;
  if (!-[CRLCanvasRep shouldExpandHitRegionWhenSmall](self, "shouldExpandHitRegionWhenSmall"))
    return 0;
  v9 = v6;
  v10 = v8;
  v11 = fminf(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v12, "viewScale");
  v14 = v13 * v11 < a3;

  return v14;
}

- (BOOL)shouldExpandHitRegionWhenSmall
{
  return 1;
}

- (BOOL)shouldHitTestChildrenLikeTopLevelReps
{
  return 0;
}

- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4
{
  return 3.40282347e38;
}

- (BOOL)intersectsUnscaledRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  CRLBezierPath *v9;
  void *v10;
  unsigned __int8 v11;
  _OWORD v13[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometry"));
  objc_msgSend(v8, "size");
  v9 = +[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:", sub_10005FDDC());
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v7)
    objc_msgSend(v7, "transformInRoot");
  else
    memset(v13, 0, sizeof(v13));
  objc_msgSend(v10, "transformUsingAffineTransform:", v13);
  v11 = objc_msgSend(v10, "intersectsRect:hasFill:", 1, x, y, width, height);

  return v11;
}

- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v7 = a4;
  v9 = a5;
  if (!v7)
    goto LABEL_10;
  objc_opt_class(_TtC8Freeform21CRLConnectionLineKnob, v8);
  if ((objc_opt_isKindOfClass(v7, v10) & 1) == 0 && (sub_100260884((char)objc_msgSend(v7, "tag")) & 0x3DE) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pointerRequest"));
    v13 = objc_msgSend(v12, "modifiers");

    if ((v13 & 0x100000) != 0
      && (v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep repForRotating](self, "repForRotating")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rep")),
          v15,
          v14,
          v14 == v15))
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rotateCursor"));
    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resizeCursor"));
    }
    goto LABEL_9;
  }
  objc_opt_class(_TtC8Freeform21CRLConnectionLineKnob, v11);
  if ((objc_opt_isKindOfClass(v7, v17) & 1) == 0)
  {
LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  v16 = objc_claimAutoreleasedReturnValue(+[CRLCursor defaultCursor](CRLCursor, "defaultCursor"));
LABEL_9:
  v18 = (void *)v16;
LABEL_11:

  return v18;
}

- (CRLCanvasRep)repForDragging
{
  return (CRLCanvasRep *)-[CRLCanvasRep p_repForDraggingIgnoringTopLevelEditing:](self, "p_repForDraggingIgnoringTopLevelEditing:", 0);
}

- (CRLCanvasRep)i_repForDraggingIgnoringTopLevelEditing
{
  return (CRLCanvasRep *)-[CRLCanvasRep p_repForDraggingIgnoringTopLevelEditing:](self, "p_repForDraggingIgnoringTopLevelEditing:", 1);
}

- (id)p_repForDraggingIgnoringTopLevelEditing:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned __int8 v19;
  CRLCanvasRep *v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  if (!objc_msgSend(v6, "isDraggable"))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  if (!objc_msgSend(v7, "isLayoutSelectable:", v8) || -[CRLCanvasRep isLocked](self, "isLocked"))
  {

LABEL_5:
LABEL_6:

    goto LABEL_7;
  }
  v12 = objc_msgSend(v5, "documentIsSharedReadOnly");

  if ((v12 & 1) != 0
    || !-[CRLCanvasRep isSelected](self, "isSelected")
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "asUIKitHost")),
        v15 = objc_msgSend(v14, "isCurrentlyInQuickSelectMode"),
        v14,
        v13,
        (v15 & 1) != 0))
  {
LABEL_7:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
    v10 = v9;
    if (a3)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "i_repForDraggingIgnoringTopLevelEditing"));
LABEL_22:
      v20 = (CRLCanvasRep *)v11;

      goto LABEL_23;
    }
LABEL_21:
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "repForDragging"));
    goto LABEL_22;
  }
  if (objc_msgSend(v5, "hasSelectedInfosInMultipleContainers"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infosForCurrentSelectionPath"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "parentInfo"));

    if (v7)
    {
      while ((objc_msgSend(v6, "containsObject:", v7) & 1) == 0)
      {
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentInfo"));

        v7 = (void *)v17;
        if (!v17)
          goto LABEL_16;
      }
      goto LABEL_5;
    }
LABEL_16:

  }
  else if (!a3)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v19 = objc_msgSend(v18, "isInTopLevelContainerForEditing");

    if ((v19 & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
      goto LABEL_21;
    }
  }
  v20 = self;
LABEL_23:

  return v20;
}

- (NSSet)additionalRepsForDragging
{
  return +[NSSet set](NSSet, "set");
}

- (id)additionalRepsForDraggingConnectionLine:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info", v6));

  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "editingCoordinator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mainBoard"));

    *(_QWORD *)&v16 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v15).n128_u64[0];
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", v16));
    v20 = sub_100221D0C(v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    if (objc_msgSend(v11, "isConnectedWithBoardItem:boardItemOwner:", v21, v14))
    {
      v22 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", self));
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101246C48);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E10010();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101246C68);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep additionalRepsForDraggingConnectionLine:]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 1007, 0, "This method should not be called if current rep is not connected to connection line.");

      v22 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    }
    v26 = (void *)v22;

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246C08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0FF90();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246C28);
    v23 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep additionalRepsForDraggingConnectionLine:]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 997, 0, "Connection line item should not be nil.");

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }

  return v26;
}

- (CRLCanvasRep)repForSelecting
{
  return (CRLCanvasRep *)-[CRLCanvasRep p_repForSelectingIgnoringTopLevelEditing:ignoringInlineEditing:](self, "p_repForSelectingIgnoringTopLevelEditing:ignoringInlineEditing:", 0, 0);
}

- (CRLCanvasRep)i_repForSelectingIgnoringTopLevelEditing
{
  return (CRLCanvasRep *)-[CRLCanvasRep p_repForSelectingIgnoringTopLevelEditing:ignoringInlineEditing:](self, "p_repForSelectingIgnoringTopLevelEditing:ignoringInlineEditing:", 1, 0);
}

- (id)p_repForSelectingIgnoringTopLevelEditing:(BOOL)a3 ignoringInlineEditing:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  CRLCanvasRep *v19;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  if ((objc_msgSend(v7, "isSelectable") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v10 = objc_msgSend(v8, "isLayoutSelectable:", v9);

    if (v10)
    {
      v11 = objc_msgSend(v6, "hasSelectedInfosInMultipleContainers");
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "freehandDrawingToolkit"));
      v13 = objc_msgSend(v12, "isInDrawingMode");

      if ((v13 & 1) != 0 || v11)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "infosForCurrentSelectionPath"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
        v22 = objc_msgSend(v14, "containsObject:", v21);

        if ((v22 & 1) != 0)
        {
          v15 = 1;
        }
        else
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "parentInfo"));

          if (v24)
          {
            while ((objc_msgSend(v14, "containsObject:", v24) & 1) == 0)
            {
              v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "parentInfo"));

              v24 = (void *)v25;
              if (!v25)
                goto LABEL_18;
            }
            v15 = 0;
          }
          else
          {
LABEL_18:
            v36 = 0u;
            v37 = 0u;
            v34 = 0u;
            v35 = 0u;
            v26 = v14;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v35;
              while (2)
              {
                for (i = 0; i != v28; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v35 != v29)
                    objc_enumerationMutation(v26);
                  v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "parentInfo", (_QWORD)v34));
                  if (v31)
                  {
                    v24 = (void *)v31;
                    while (1)
                    {
                      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));

                      if (v24 == v32)
                        break;
                      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "parentInfo"));

                      v24 = (void *)v33;
                      if (!v33)
                        goto LABEL_27;
                    }
                    v15 = 0;
                    goto LABEL_33;
                  }
LABEL_27:
                  ;
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
                v24 = 0;
                v15 = 1;
                if (v28)
                  continue;
                break;
              }
            }
            else
            {
              v24 = 0;
              v15 = 1;
            }
LABEL_33:

          }
        }
      }
      else
      {
        if (a3)
        {
LABEL_36:
          v19 = self;
          goto LABEL_12;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
        v15 = objc_msgSend(v14, "isInTopLevelContainerForEditing");
      }

      if (v15)
        goto LABEL_36;
    }
  }
  else
  {

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep", (_QWORD)v34));
  v17 = v16;
  if (a3)
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "i_repForSelectingIgnoringTopLevelEditing"));
  else
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "repForSelecting"));
  v19 = (CRLCanvasRep *)v18;

LABEL_12:
  return v19;
}

- (BOOL)everAllowedToBeSelectedAsADrawable
{
  CRLCanvasRep *v2;
  CRLCanvasRep *v3;

  v2 = self;
  v3 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep p_repForSelectingIgnoringTopLevelEditing:ignoringInlineEditing:](self, "p_repForSelectingIgnoringTopLevelEditing:ignoringInlineEditing:", 1, 1));
  LOBYTE(v2) = v3 == v2;

  return (char)v2;
}

- (CRLCanvasRep)repForRotating
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRLCanvasRep *v11;
  void *v13;
  unsigned __int8 v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  if ((objc_msgSend(v3, "hasSelectedInfosInMultipleContainers") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v4 = objc_msgSend(v5, "isInTopLevelContainerForEditing") ^ 1;

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  if (!objc_msgSend(v6, "supportsRotation") || (v4 & 1) != 0)
    goto LABEL_9;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasEditor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  if (!objc_msgSend(v8, "isLayoutSelectable:", v9) || -[CRLCanvasRep isLocked](self, "isLocked"))
  {

LABEL_9:
    goto LABEL_10;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v14 = objc_msgSend(v13, "documentIsSharedReadOnly");

  if ((v14 & 1) == 0)
  {
    v11 = self;
    return v11;
  }
LABEL_10:
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  v11 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "repForRotating"));

  return v11;
}

- (CRLCanvasRep)repForFreeTransforming
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep repForRotating](self, "repForRotating"));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep repForDragging](self, "repForDragging"));
  return (CRLCanvasRep *)v3;
}

- (BOOL)p_isNotSelectableDueToUnknownContent
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v4 = sub_1000664C4(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForInfo:", v5));

  LOBYTE(v6) = objc_msgSend(v7, "containsUnknownContent");
  return (char)v6;
}

- (void)p_showAlertForGroupWithUnknownContent
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerHost"));
  +[CRLUnknownRep presentUnsupportedItemAlertWithLayerHost:forGroup:](_TtC8Freeform13CRLUnknownRep, "presentUnsupportedItemAlertWithLayerHost:forGroup:", v2, 1);

}

- (CRLCanvasRep)repForHandleSingleTap
{
  CRLCanvasRep *v3;

  v3 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep repForSelecting](self, "repForSelecting"));
  if (!v3)
  {
    if (-[CRLCanvasRep p_isNotSelectableDueToUnknownContent](self, "p_isNotSelectableDueToUnknownContent"))
      v3 = self;
    else
      v3 = 0;
  }
  return v3;
}

- (BOOL)manuallyControlsMiniFormatter
{
  return 0;
}

- (BOOL)isPreviewable
{
  return 1;
}

- (CRLCanvasRep)repForPreviewing
{
  CRLCanvasRep *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  Class v12;
  NSString *v13;
  void *v14;

  v2 = self;
  v3 = v2;
  while (1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForSelecting"));
    if ((objc_msgSend(v4, "isPreviewable") & 1) != 0)
      break;
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentRep"));

    v3 = (void *)v5;
    if (!v5)
      goto LABEL_6;
  }
  if (v4)
    goto LABEL_18;
LABEL_6:
  v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101246C88);
  v7 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
    sub_100E10090((uint64_t)v2, v6, v7);

  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101246CA8);
  v8 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep repForPreviewing]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
  if (v2)
  {
    objc_opt_class(v2, v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v11, 1139, 0, "There should have been a rep suitable for previewing <%{public}@: %{public}p>", v14, v2);

  }
  else
  {
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v11, 1139, 0, "There should have been a rep suitable for previewing <%{public}@: %{public}p>", CFSTR("Nil"), 0);
  }

  v4 = 0;
LABEL_18:

  return (CRLCanvasRep *)v4;
}

- (NSArray)layoutsForChildReps
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "children"));

  return (NSArray *)v3;
}

- (void)updateChildrenFromLayout
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  CRLCanvasRep *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layoutsForChildReps](self, "layoutsForChildReps"));
  v5 = objc_msgSend(v4, "count");
  v30 = v3;
  if (v5 != objc_msgSend(v3, "count"))
    goto LABEL_14;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = v4;
    v10 = 0;
    v11 = *(_QWORD *)v36;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", (char *)i + v10));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layout"));
        if (v15 != v13)
        {

LABEL_13:
          v4 = v9;
LABEL_14:
          v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
          v17 = objc_alloc_init((Class)NSMutableArray);
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v28 = v4;
          v18 = v4;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (!v19)
            goto LABEL_28;
          v20 = v19;
          v21 = *(_QWORD *)v32;
          while (2)
          {
            v22 = 0;
LABEL_17:
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v22);
            v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForLayout:", v23));
            if (v24)
              goto LABEL_25;
            v24 = objc_msgSend(objc_alloc((Class)objc_msgSend(v23, "repClassOverride")), "initWithLayout:canvas:", v23, v6);
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
            if (!objc_msgSend(v25, "isCanvasInteractive"))
              goto LABEL_23;
            v26 = -[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation");

            if (v26)
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
              objc_msgSend(v24, "dynamicOperationDidBeginWithRealTimeCommands:", objc_msgSend(v25, "isInRealTimeDynamicOperation"));
LABEL_23:

            }
            if (v24)
LABEL_25:
              objc_msgSend(v17, "addObject:", v24);
            objc_msgSend(v24, "setParentRep:", self);

            if (v20 == (id)++v22)
            {
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              if (!v20)
              {
LABEL_28:

                objc_msgSend(v6, "orderRepsForLayout:", v17);
                -[CRLCanvasRep p_setChildReps:](self, "p_setChildReps:", v17);

                v4 = v28;
                goto LABEL_29;
              }
              continue;
            }
            goto LABEL_17;
          }
        }
        v16 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parentRep"));

        if (v16 != self)
          goto LABEL_13;

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      v10 += (uint64_t)i;
      if (!v8)
      {
        v4 = v9;
        break;
      }
    }
  }
LABEL_29:

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  objc_msgSend(v27, "makeObjectsPerformSelector:", a2);

}

- (void)p_setChildReps:(id)a3
{
  id v4;
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  CRLCanvasRep *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  NSMutableArray *v21;
  NSMutableArray *mChildReps;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", self->mChildReps) & 1) == 0)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v4);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v6 = self->mChildReps;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v5, "containsObject:", v11) & 1) == 0)
          {
            v12 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parentRep"));

            if (v12 == self)
              objc_msgSend(v11, "setParentRep:", 0);
          }
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v8);
    }

    if (self->mChildReps)
      v13 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", self->mChildReps);
    else
      v13 = 0;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
          if ((objc_msgSend(v13, "containsObject:", v19, (_QWORD)v23) & 1) == 0)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "parentRep"));
            objc_msgSend(v20, "removeChildRep:", v19);

            objc_msgSend(v19, "setParentRep:", self);
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v16);
    }

    v21 = (NSMutableArray *)objc_msgSend(v14, "mutableCopy");
    mChildReps = self->mChildReps;
    self->mChildReps = v21;

  }
}

- (void)removeChildRep:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = -[NSMutableArray indexOfObjectIdenticalTo:](self->mChildReps, "indexOfObjectIdenticalTo:");
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->mChildReps, "removeObjectAtIndex:", v4);
    objc_msgSend(v5, "setParentRep:", 0);
  }

}

- (void)didAddChildRep:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  if (-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    objc_msgSend(v6, "dynamicOperationDidBeginWithRealTimeCommands:", objc_msgSend(v4, "isInRealTimeDynamicOperation"));

    if (-[CRLCanvasRep isBeingRotated](self, "isBeingRotated"))
    {
      objc_msgSend(v6, "dynamicRotateDidBegin");
    }
    else if (-[CRLCanvasRep isBeingResized](self, "isBeingResized"))
    {
      v5 = objc_msgSend(v6, "dynamicResizeDidBegin");
    }
  }

}

- (void)updateFromLayout
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  CRLCanvasLayoutGeometry *v9;
  CRLCanvasLayoutGeometry *mLastGeometryInRoot;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v4 = objc_msgSend(v3, "isCanvasInteractive");

  if (v4)
  {
    if (!-[CRLCanvasRep p_isBeingDraggedRecursive](self, "p_isBeingDraggedRecursive"))
    {
      if (!-[CRLCanvasRep isBeingRotated](self, "isBeingRotated")
        || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout")),
            v6 = objc_msgSend(v5, "wantsNormalLayoutDuringDynamicRotation"),
            v5,
            v6))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometryInRoot"));

        if ((objc_msgSend(v8, "isEqual:", self->mLastGeometryInRoot) & 1) == 0)
          -[CRLCanvasRep layoutInRootChangedFrom:to:translatedOnly:](self, "layoutInRootChangedFrom:to:translatedOnly:", self->mLastGeometryInRoot, v8, objc_msgSend(v8, "differsInMoreThanTranslationFrom:", self->mLastGeometryInRoot) ^ 1);
        v9 = (CRLCanvasLayoutGeometry *)objc_msgSend(v8, "copy");
        mLastGeometryInRoot = self->mLastGeometryInRoot;
        self->mLastGeometryInRoot = v9;

      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    objc_msgSend(v11, "i_takeDirtyRect");
    -[CRLCanvasRep setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");

    -[CRLCanvasRep i_invalidateSelectionHighlightRenderable](self, "i_invalidateSelectionHighlightRenderable");
  }
}

- (BOOL)p_isBeingDraggedRecursive
{
  char v3;
  unsigned int v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  int v10;
  uint64_t v11;

  if (-[CRLCanvasRep isBeingFreeTransformDragged](self, "isBeingFreeTransformDragged")
    && !-[CRLCanvasRep isBeingFreeTransformResized](self, "isBeingFreeTransformResized"))
  {
    v3 = !-[CRLCanvasRep isBeingFreeTransformRotated](self, "isBeingFreeTransformRotated");
  }
  else
  {
    v3 = 0;
  }
  LOBYTE(v4) = 1;
  if (!-[CRLCanvasRep isBeingDragged](self, "isBeingDragged") && (v3 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v6 = objc_msgSend(v5, "layoutState");

    if (v6 == 1 && (v7 = objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"))) != 0)
    {
      v8 = (void *)v7;
      do
      {
        if (objc_msgSend(v8, "isBeingFreeTransformDragged"))
        {
          if ((objc_msgSend(v8, "isBeingFreeTransformResized") & 1) != 0)
            v9 = 1;
          else
            v9 = objc_msgSend(v8, "isBeingFreeTransformRotated");
          v10 = v9 ^ 1;
        }
        else
        {
          v10 = 0;
        }
        v4 = objc_msgSend(v8, "isBeingDragged") | v10;
        if ((v4 & 1) != 0)
          break;
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentRep"));

        v8 = (void *)v11;
      }
      while (v11);

    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (BOOL)skipsRerenderForTranslation
{
  return 0;
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  float64x2_t v12;
  float64x2_t v13;
  float64x2_t v14;
  double v15;
  double v16;
  id v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BOOL v36;
  double v37;
  BOOL v38;
  float64x2_t v39;
  double v40;
  float64x2_t v41;
  float64x2_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v5)
  {
    if (!-[CRLCanvasRep skipsRerenderForTranslation](self, "skipsRerenderForTranslation"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
      if (v8)
      {
        objc_msgSend(v8, "transform");
        v12 = v44;
        v13 = v45;
        v14 = v46;
      }
      else
      {
        v14 = 0uLL;
        v12 = 0uLL;
        v13 = 0uLL;
      }
      objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", vaddq_f64(v14, vmlaq_n_f64(vmulq_n_f64(v13, CGPointZero.y), v12, CGPointZero.x)), vdupq_lane_s64(*(uint64_t *)&CGPointZero.x, 0), *(_QWORD *)&CGPointZero.y, v11);
      v16 = v15;

      v17 = objc_loadWeakRetained((id *)&self->mCanvas);
      if (v9)
      {
        objc_msgSend(v9, "transform");
        v18 = v41;
        v19 = v42;
        v20 = v43;
      }
      else
      {
        v20 = 0uLL;
        v18 = 0uLL;
        v19 = 0uLL;
      }
      objc_msgSend(v17, "convertUnscaledToBoundsPoint:", vaddq_f64(v20, vmlaq_f64(vmulq_n_f64(v19, v40), v39, v18)));
      v22 = v21;
      v24 = v23;

      v25 = sub_1000603B8(v22, v24, v16);
      v27 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      objc_msgSend(v28, "contentsScale");
      v30 = sub_1000603DC(v25, v27, v29);
      v32 = v31;

      v33 = sub_1003C65C8(v30);
      v34 = sub_1003C65C8(v32);
      if (v33 != 0.0)
      {
        v35 = fabs(v33);
        v36 = v35 < 0.00999999978 || v35 == 1.0;
        if (!v36 && fabs(v35 + -1.0) >= 0.00999999978)
          goto LABEL_23;
      }
      if (v34 != 0.0)
      {
        v37 = fabs(v34);
        v34 = 0.00999999978;
        v38 = v37 < 0.00999999978 || v37 == 1.0;
        if (!v38 && fabs(v37 + -1.0) >= 0.00999999978)
LABEL_23:
          -[CRLCanvasRep setNeedsDisplay](self, "setNeedsDisplay", v34);
      }
    }
  }
  else
  {
    -[CRLCanvasRep setNeedsDisplay](self, "setNeedsDisplay");
    -[CRLCanvasRep invalidateKnobPositions](self, "invalidateKnobPositions");
  }

}

- (CGAffineTransform)i_layerTransform
{
  __int128 v5;
  CGAffineTransform *result;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;

  v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  result = (CGAffineTransform *)-[CRLCanvasRep isBeingRotated](self, "isBeingRotated");
  if (!(_DWORD)result)
    return result;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  if (objc_msgSend(v7, "isBeingRotated"))
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v9 = objc_msgSend(v8, "wantsNormalLayoutDuringDynamicRotation");

    if ((v9 & 1) == 0)
    {
      v44 = 0u;
      v45 = 0u;
      v43 = 0u;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "originalPureTransformInRoot");
      }
      else
      {
        v44 = 0u;
        v45 = 0u;
        v43 = 0u;
      }

      v41 = 0u;
      v42 = 0u;
      v40 = 0u;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
      v23 = v22;
      if (v22)
      {
        objc_msgSend(v22, "pureTransformInRoot");
      }
      else
      {
        v41 = 0u;
        v42 = 0u;
        v40 = 0u;
      }

      v34 = v43;
      v35 = v44;
      v36 = v45;
      v31 = v40;
      v32 = v41;
      v33 = v42;
      result = -[CRLCanvasRep p_layerTransformForRotationFromPureTransformInRoot:toPureTransformInRoot:](self, "p_layerTransformForRotationFromPureTransformInRoot:toPureTransformInRoot:", &v34, &v31);
      v24 = v38;
      *(_OWORD *)&retstr->a = v37;
      *(_OWORD *)&retstr->c = v24;
      *(_OWORD *)&retstr->tx = v39;
      return result;
    }
  }
  v30 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  if ((objc_msgSend(v30, "isBeingRotated") & 1) == 0)
  {
LABEL_25:

    return result;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  if ((objc_msgSend(v10, "wantsNormalLayoutDuringDynamicRotation") & 1) == 0)
  {

    goto LABEL_25;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v12 = objc_msgSend(v11, "i_anyAncestorCurrentlyBeingRotatedWantsNormalLayoutDuringDynamicRotation");

  if ((v12 & 1) == 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
    if (v13)
    {
      v14 = (void *)v13;
      while (1)
      {
        if (objc_msgSend(v14, "isBeingRotated"))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parentRep"));
          v16 = objc_msgSend(v15, "isBeingRotated");

          if (!v16)
            break;
        }
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parentRep"));

        v14 = (void *)v17;
        if (!v17)
          goto LABEL_13;
      }
      v44 = 0u;
      v45 = 0u;
      v43 = 0u;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layout"));
      v26 = v25;
      if (v25)
      {
        objc_msgSend(v25, "originalPureTransformInRoot");
      }
      else
      {
        v44 = 0u;
        v45 = 0u;
        v43 = 0u;
      }

      v41 = 0u;
      v42 = 0u;
      v40 = 0u;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layout"));
      v28 = v27;
      if (v27)
      {
        objc_msgSend(v27, "pureTransformInRoot");
      }
      else
      {
        v41 = 0u;
        v42 = 0u;
        v40 = 0u;
      }

      v34 = v40;
      v35 = v41;
      v36 = v42;
      v31 = v43;
      v32 = v44;
      v33 = v45;
      -[CRLCanvasRep p_layerTransformForRotationFromPureTransformInRoot:toPureTransformInRoot:](self, "p_layerTransformForRotationFromPureTransformInRoot:toPureTransformInRoot:", &v34, &v31);
      v29 = v38;
      *(_OWORD *)&retstr->a = v37;
      *(_OWORD *)&retstr->c = v29;
      *(_OWORD *)&retstr->tx = v39;
    }
    else
    {
LABEL_13:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101246CC8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E10180();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101246CE8);
      v18 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep i_layerTransform]"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v19, 1348, 0, "Unable to find topmost rotated ancestor for counteracting the layer transform.");

    }
  }
  return result;
}

- (CGAffineTransform)p_layerTransformForRotationFromPureTransformInRoot:(SEL)a3 toPureTransformInRoot:(CGAffineTransform *)a4
{
  __int128 v8;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CRLCanvas **p_mCanvas;
  id WeakRetained;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  CGFloat v26;
  __int128 v27;
  __int128 v28;
  id v29;
  double v30;
  id v31;
  double v32;
  CGAffineTransform *result;
  _OWORD v34[3];
  CGAffineTransform t2;
  CGAffineTransform t1;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v8 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t2.c = v8;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
  CGAffineTransformInvert(&t1, &t2);
  v9 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t2.c = v9;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a5->tx;
  CGAffineTransformConcat(retstr, &t1, &t2);
  -[CRLCanvasRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  p_mCanvas = &self->mCanvas;
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "convertBoundsToUnscaledRect:", v11, v13, v15, v17);
  v24 = sub_100061400(v20, v21, v22, v23);
  v26 = v25;

  v27 = *(_OWORD *)&retstr->c;
  v34[0] = *(_OWORD *)&retstr->a;
  v34[1] = v27;
  v34[2] = *(_OWORD *)&retstr->tx;
  sub_1000796D4(v34, &t2, v24, v26);
  v28 = *(_OWORD *)&t2.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&t2.a;
  *(_OWORD *)&retstr->c = v28;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&t2.tx;
  v29 = objc_loadWeakRetained((id *)p_mCanvas);
  objc_msgSend(v29, "viewScale");
  retstr->tx = v30 * retstr->tx;

  v31 = objc_loadWeakRetained((id *)p_mCanvas);
  objc_msgSend(v31, "viewScale");
  retstr->ty = v32 * retstr->ty;

  return result;
}

- (CGAffineTransform)parentLayerInverseTransformInRootForZeroAnchor
{
  __int128 v5;
  void *v6;
  CGAffineTransform *result;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  CGAffineTransform v12;

  v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "layerTransformInRootForZeroAnchor");
    else
      memset(&v12, 0, sizeof(v12));
    v10 = *(_OWORD *)&v12.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v12.a;
    *(_OWORD *)&retstr->c = v10;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v12.tx;

    v11 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v12.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v12.c = v11;
    *(_OWORD *)&v12.tx = *(_OWORD *)&retstr->tx;
    return CGAffineTransformInvert(retstr, &v12);
  }
  return result;
}

- (CGAffineTransform)layerTransformInRootForZeroAnchor
{
  __int128 v4;
  CGAffineTransform *result;
  CGAffineTransform *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  CGAffineTransform v19;
  CGAffineTransform t1;
  CGAffineTransform v21;
  CGAffineTransform v22;

  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  result = self;
  if (result)
  {
    v6 = result;
    do
    {
      -[CGAffineTransform layerFrameInScaledCanvasRelativeToParent](v6, "layerFrameInScaledCanvasRelativeToParent");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      memset(&v22, 0, sizeof(v22));
      -[CGAffineTransform i_layerTransform](v6, "i_layerTransform");
      t1 = v22;
      sub_1000796D4(&t1, &v21, v12 * -0.5, v14 * -0.5);
      v22 = v21;
      CGAffineTransformMakeTranslation(&v19, v8, v10);
      t1 = v22;
      CGAffineTransformConcat(&v21, &t1, &v19);
      v15 = *(_OWORD *)&v21.c;
      v22 = v21;
      v16 = *(_OWORD *)&v21.a;
      v17 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v21.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v21.c = v17;
      *(_OWORD *)&v21.tx = *(_OWORD *)&retstr->tx;
      *(_OWORD *)&t1.a = v16;
      *(_OWORD *)&t1.c = v15;
      *(_OWORD *)&t1.tx = *(_OWORD *)&v22.tx;
      CGAffineTransformConcat(retstr, &v21, &t1);
      v18 = objc_claimAutoreleasedReturnValue(-[CGAffineTransform parentRep](v6, "parentRep"));

      v6 = (CGAffineTransform *)v18;
    }
    while (v18);
  }
  return result;
}

- (void)updateRenderableGeometryFromLayout:(id)a3
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
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v4 = a3;
  -[CRLCanvasRep layerFrameInScaledCanvasRelativeToParent](self, "layerFrameInScaledCanvasRelativeToParent");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  -[CRLCanvasRep i_layerTransform](self, "i_layerTransform");
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  objc_msgSend(v4, "setIfDifferentFrame:orTransform:", v13, v6, v8, v10, v12);

}

- (void)antiAliasDefeatLayerTransform:(CGAffineTransform *)a3 forFrame:(CGRect)a4
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  __int128 v10;
  __int128 v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat MinY;
  CGFloat MinX;
  CGFloat v27;
  __int128 v28;
  __int128 v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v39.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v39.c = v10;
  *(_OWORD *)&v39.tx = *(_OWORD *)&a3->tx;
  if (sub_1000792C0(&v39.a, a4.size.width, a4.size.height))
  {
    v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v38.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v38.c = v11;
    *(_OWORD *)&v38.tx = *(_OWORD *)&a3->tx;
    memset(&v39, 0, sizeof(v39));
    sub_1000796D4(&v38, &v39, width * -0.5, height * -0.5);
    v38 = v39;
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v41 = CGRectApplyAffineTransform(v40, &v38);
    v12 = v41.origin.x;
    v13 = v41.origin.y;
    v14 = v41.size.width;
    v15 = v41.size.height;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v16, "contentsScale");
    v18 = sub_100063150(v12, v13, v14, v15, v17);
    v30 = v19;
    v31 = v18;
    v21 = v20;
    v23 = v22;

    memset(&v38, 0, sizeof(v38));
    v42.origin.x = v12;
    v42.origin.y = v13;
    v42.size.width = v14;
    v42.size.height = v15;
    v32 = height;
    v24 = -CGRectGetMinX(v42);
    v43.origin.x = v12;
    v43.origin.y = v13;
    v43.size.width = v14;
    v43.size.height = v15;
    MinY = CGRectGetMinY(v43);
    CGAffineTransformMakeTranslation(&v38, v24, -MinY);
    CGAffineTransformMakeScale(&t2, v21 / v14, v23 / v15);
    t1 = v38;
    CGAffineTransformConcat(&v37, &t1, &t2);
    v38 = v37;
    v44.origin.x = v31;
    v44.origin.y = v30;
    v44.size.width = v21;
    v44.size.height = v23;
    MinX = CGRectGetMinX(v44);
    v45.origin.x = v31;
    v45.origin.y = v30;
    v45.size.width = v21;
    v45.size.height = v23;
    v27 = CGRectGetMinY(v45);
    CGAffineTransformMakeTranslation(&v34, MinX, v27);
    t1 = v38;
    CGAffineTransformConcat(&v37, &t1, &v34);
    v38 = v37;
    t1 = v37;
    sub_1000796D4(&t1, &v37, width * 0.5, v32 * 0.5);
    v38 = v37;
    v28 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v28;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    v33 = v37;
    CGAffineTransformConcat(&v37, &t1, &v33);
    v29 = *(_OWORD *)&v37.c;
    *(_OWORD *)&a3->a = *(_OWORD *)&v37.a;
    *(_OWORD *)&a3->c = v29;
    *(_OWORD *)&a3->tx = *(_OWORD *)&v37.tx;
  }
}

- (void)antiAliasDefeatLayerFrame:(CGRect *)a3 forTransform:(CGAffineTransform *)a4
{
  __int128 v7;
  CGFloat v8;
  CGFloat v9;
  __int128 v10;
  double x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v7 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v26.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v26.c = v7;
  *(_OWORD *)&v26.tx = *(_OWORD *)&a4->tx;
  if (sub_1000792C0(&v26.a, a3->size.width, a3->size.height))
  {
    v8 = a3->size.width * -0.5;
    v9 = a3->size.height * -0.5;
    v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v25.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v25.c = v10;
    *(_OWORD *)&v25.tx = *(_OWORD *)&a4->tx;
    memset(&v26, 0, sizeof(v26));
    sub_1000796D4(&v25, &v26, v8, v9);
    v27 = *a3;
    v25 = v26;
    v28 = CGRectApplyAffineTransform(v27, &v25);
    x = v28.origin.x;
    y = v28.origin.y;
    width = v28.size.width;
    height = v28.size.height;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v15, "contentsScale");
    v17 = sub_100063150(x, y, width, height, v16);
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v25 = v26;
    CGAffineTransformInvert(&v24, &v25);
    v29.origin.x = v17;
    v29.origin.y = v19;
    v29.size.width = v21;
    v29.size.height = v23;
    *a3 = CGRectApplyAffineTransform(v29, &v24);
  }
}

- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4 basedOnTransform:(CGAffineTransform *)a5 andSize:(CGSize)a6
{
  CRLCanvas **p_mCanvas;
  id WeakRetained;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  double v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  __int128 v43;
  __int128 v44;
  double v45;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v48;
  CGAffineTransform v49;

  p_mCanvas = &self->mCanvas;
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "convertUnscaledToBoundsRect:", sub_10005FDDC());
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  *(_QWORD *)&v21 = objc_opt_class(CRLCanvasLayout, v20).n128_u64[0];
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v21));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "parent"));
  v26 = sub_100221D0C(v23, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  if (v27)
  {
    memset(&v49, 0, sizeof(v49));
    if (-[CRLCanvasRep isBeingRotated](self, "isBeingRotated")
      && (v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout")),
          v29 = objc_msgSend(v28, "wantsNormalLayoutDuringDynamicRotation"),
          v28,
          (v29 & 1) == 0))
    {
      objc_msgSend(v27, "originalTransformInRoot");
    }
    else
    {
      objc_msgSend(v27, "transformInRoot");
    }
    v30 = *(_OWORD *)&a5->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&t1.c = v30;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a5->tx;
    t2 = v49;
    CGAffineTransformConcat(&v48, &t1, &t2);
    v31 = *(_OWORD *)&v48.c;
    *(_OWORD *)&a5->a = *(_OWORD *)&v48.a;
    *(_OWORD *)&a5->c = v31;
    *(_OWORD *)&a5->tx = *(_OWORD *)&v48.tx;
  }
  v32 = objc_loadWeakRetained((id *)p_mCanvas);
  objc_msgSend(v32, "viewScale");
  v45 = v33;

  v34 = *(_OWORD *)&a5->c;
  *(float64x2_t *)&a5->tx = vmulq_n_f64(*(float64x2_t *)&a5->tx, v45);
  *(_OWORD *)&v48.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v48.c = v34;
  *(_OWORD *)&v48.tx = *(_OWORD *)&a5->tx;
  sub_1000796D4(&v48, &v49, v17 * 0.5, v19 * 0.5);
  v35 = *(_OWORD *)&v49.c;
  *(_OWORD *)&a5->a = *(_OWORD *)&v49.a;
  *(_OWORD *)&a5->c = v35;
  *(_OWORD *)&a5->tx = *(_OWORD *)&v49.tx;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));

  if (v36)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
    objc_msgSend(v37, "layerFrameInScaledCanvas");
    v39 = v38;
    v41 = v40;

    v42 = a5->ty - v41;
    a5->tx = a5->tx - v39;
    a5->ty = v42;
  }
  if (a3)
  {
    a3->origin.x = v13;
    a3->origin.y = v15;
    a3->size.width = v17;
    a3->size.height = v19;
  }
  if (a4)
  {
    v43 = *(_OWORD *)&a5->a;
    v44 = *(_OWORD *)&a5->tx;
    *(_OWORD *)&a4->c = *(_OWORD *)&a5->c;
    *(_OWORD *)&a4->tx = v44;
    *(_OWORD *)&a4->a = v43;
  }

}

- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometry"));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "transform");
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v12, v13, v14));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geometry"));
  objc_msgSend(v11, "size");
  -[CRLCanvasRep computeDirectLayerFrame:andTransform:basedOnTransform:andSize:](self, "computeDirectLayerFrame:andTransform:basedOnTransform:andSize:", a3, a4, &v12);

}

- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4 basedOnLayoutGeometry:(id)a5
{
  id v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v8 = a5;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "transform");
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v10 = 0u;
  }
  objc_msgSend(v9, "size", v10, v11, v12);
  -[CRLCanvasRep computeDirectLayerFrame:andTransform:basedOnTransform:andSize:](self, "computeDirectLayerFrame:andTransform:basedOnTransform:andSize:", a3, a4, &v10);

}

- (void)processChanges:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableOrderedSet);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v10), "details"));
        v12 = v11;
        if (v11)
        {
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_100237CF4;
          v22[3] = &unk_101246D10;
          v22[4] = v5;
          objc_msgSend(v11, "enumeratePropertiesUsingBlock:", v22);
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        -[CRLCanvasRep processChangedProperty:](self, "processChangedProperty:", objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v17), "unsignedIntegerValue", (_QWORD)v18));
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v15);
  }

}

- (void)setNeedsDisplay
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasController"));
  objc_msgSend(v3, "i_repNeedsDisplay:", self);

}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    if (!CGRectIsEmpty(v10))
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasController"));
      objc_msgSend(v8, "i_repNeedsDisplay:inRect:", self, x, y, width, height);

    }
  }
}

- (void)p_invalidateContentLayers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v3, "invalidateContentLayersForRep:", self);

}

- (void)screenScaleDidChange
{
  -[CRLCanvasRep setNeedsDisplay](self, "setNeedsDisplay");
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  -[CRLCanvasRep i_invalidateSelectionHighlightRenderable](self, "i_invalidateSelectionHighlightRenderable");
}

- (void)viewScaleDidChange
{
  BOOL mShadowRenderableInvalid;

  mShadowRenderableInvalid = self->mShadowRenderableInvalid;
  -[CRLCanvasRep setNeedsDisplay](self, "setNeedsDisplay");
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  -[CRLCanvasRep i_invalidateSelectionHighlightRenderable](self, "i_invalidateSelectionHighlightRenderable");
  self->mShadowRenderableInvalid = mShadowRenderableInvalid;
}

- (Class)layerClass
{
  return (Class)objc_opt_class(CRLTilingLayer, a2);
}

- (id)colorBehindLayer:(id)a3
{
  return 0;
}

- (void)setupForDrawingInLayer:(id)a3 context:(CGContext *)a4
{
  id v6;
  double v7;
  double v8;
  id WeakRetained;
  double v10;
  CGFloat v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  CGAffineTransform *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v6 = a3;
  -[CRLCanvasRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas");
  CGContextTranslateCTM(a4, -v7, -v8);
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "viewScale");
  v11 = v10;

  CGContextScaleCTM(a4, v11, v11);
  if (-[CRLCanvasRep isBeingRotated](self, "isBeingRotated")
    && (v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout")),
        v13 = objc_msgSend(v12, "wantsNormalLayoutDuringDynamicRotation"),
        v12,
        !v13))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v15 = v17;
    if (v17)
    {
      v16 = (CGAffineTransform *)&v28;
      objc_msgSend(v17, "originalTransformInRoot");
    }
    else
    {
      v29 = 0u;
      v30 = 0u;
      v28 = 0u;
      v16 = (CGAffineTransform *)&v28;
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v15 = v14;
    if (v14)
    {
      v16 = (CGAffineTransform *)&v31;
      objc_msgSend(v14, "transformInRoot");
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v31 = 0u;
      v16 = (CGAffineTransform *)&v31;
    }
  }
  CGContextConcatCTM(a4, v16);

  if (v6)
  {
    if (objc_msgSend(v6, "contentsAreFlipped"))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "threadDictionary"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", self));
      objc_msgSend(v19, "setObject:forKey:", v20, v21);

    }
    -[CRLCanvasRep i_configureFontSmoothingForContext:layer:](self, "i_configureFontSmoothingForContext:layer:", a4, v6, v28, v29, v30, v31, v32, v33);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas", v28, v29, v30));
  v23 = objc_msgSend(v22, "allowsFontSubpixelQuantization");

  if ((v23 & 1) == 0)
  {
    CGContextSetAllowsFontSubpixelQuantization(a4, 0);
    CGContextSetShouldSubpixelQuantizeFonts(a4, 0);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v24, "contentsScale");
  v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  sub_10040F974((uint64_t)a4, 0, 0, v6 != 0, (uint64_t)objc_msgSend(v27, "shouldSuppressBackgrounds"), v26);

}

- (void)didDrawInLayer:(id)a3 context:(CGContext *)a4
{
  void *v5;
  void *v6;
  id v7;

  sub_10040F32C((uint64_t)a4);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "threadDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", self));
  objc_msgSend(v5, "removeObjectForKey:", v6);

}

- (BOOL)isDrawingInFlippedContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](NSThread, "currentThread"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "threadDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v5));

  if (v6)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = 0;

  return v7;
}

- (CGRect)i_clipRectRecursive
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  os_log_t *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  os_log_t *v18;
  NSObject *v19;
  os_log_t v20;
  void *v21;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  unsigned int v27;
  NSObject *v28;
  os_log_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  char *v33;
  NSObject *v34;
  char *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id obj;
  CGAffineTransform v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  unsigned int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  const char *v55;
  _BYTE v56[128];
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect result;
  CGRect v63;

  -[CRLCanvasRep clipRect](self, "clipRect");
  x = v57.origin.x;
  y = v57.origin.y;
  width = v57.size.width;
  height = v57.size.height;
  v7 = (os_log_t *)&off_1013D9070;
  if (CGRectIsNull(v57))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246D30);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10200();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246D50);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep i_clipRectRecursive]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1670, 0, "This rep's clipRect should not be null.");

  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v43;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layout"));
        if (!v16)
        {
          v17 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101246D70);
          v18 = v7;
          v19 = *v7;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v47 = v17;
            v48 = 2082;
            v49 = "-[CRLCanvasRep i_clipRectRecursive]";
            v50 = 2082;
            v51 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m";
            v52 = 1024;
            v53 = 1674;
            v54 = 2082;
            v55 = "currentChildLayout";
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101246D90);
          v20 = *v18;
          if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
          {
            v34 = v20;
            v35 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v47 = v17;
            v48 = 2114;
            v49 = v35;
            _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep i_clipRectRecursive]"));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 1674, 0, "invalid nil value for '%{public}s'", "currentChildLayout");

          v7 = v18;
        }
        objc_msgSend(v15, "i_clipRectRecursive");
        v23 = v58.origin.x;
        v24 = v58.origin.y;
        v25 = v58.size.width;
        v26 = v58.size.height;
        if (CGRectIsNull(v58))
        {
          v27 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101246DB0);
          v28 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v47 = v27;
            v48 = 2082;
            v49 = "-[CRLCanvasRep i_clipRectRecursive]";
            v50 = 2082;
            v51 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m";
            v52 = 1024;
            v53 = 1678;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The child's i_clipRectRecursive should not be null.", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101246DD0);
          v29 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          {
            v32 = v29;
            v33 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v47 = v27;
            v48 = 2114;
            v49 = v33;
            _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep i_clipRectRecursive]"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 1678, 0, "The child's i_clipRectRecursive should not be null.");

        }
        if (v16)
          objc_msgSend(v16, "transform");
        else
          memset(&v41, 0, sizeof(v41));
        v59.origin.x = v23;
        v59.origin.y = v24;
        v59.size.width = v25;
        v59.size.height = v26;
        v63 = CGRectApplyAffineTransform(v59, &v41);
        v60.origin.x = x;
        v60.origin.y = y;
        v60.size.width = width;
        v60.size.height = height;
        v61 = CGRectUnion(v60, v63);
        x = v61.origin.x;
        y = v61.origin.y;
        width = v61.size.width;
        height = v61.size.height;

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    }
    while (v12);
  }

  v36 = x;
  v37 = y;
  v38 = width;
  v39 = height;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (void)recursivelyDrawInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  unsigned int v20;
  char v21;
  CGAffineTransform v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect ClipBoundingBox;

  v6 = a4;
  v7 = sub_100411820((uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v8, "beginObject:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometry"));
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "transform");
  else
    memset(&v22, 0, sizeof(v22));
  CGContextConcatCTM(a3, &v22);

  -[CRLCanvasRep clipRect](self, "clipRect");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = -[CRLCanvasRep masksToBounds](self, "masksToBounds");
  v21 = v20;
  if (v20)
  {
    v23.origin.x = v13;
    v23.origin.y = v15;
    v23.size.width = v17;
    v23.size.height = v19;
    CGContextClipToRect(a3, v23);
  }
  ClipBoundingBox = CGContextGetClipBoundingBox(a3);
  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  if (CGRectIntersectsRect(v24, ClipBoundingBox))
  {
    CGContextSaveGState(a3);
    if ((v21 & 1) == 0)
    {
      v25.origin.x = v13;
      v25.origin.y = v15;
      v25.size.width = v17;
      v25.size.height = v19;
      CGContextClipToRect(a3, v25);
    }
    -[CRLCanvasRep drawInContext:](self, "drawInContext:", a3, *(_OWORD *)&v22.a, *(_OWORD *)&v22.c, *(_OWORD *)&v22.tx);
    CGContextRestoreGState(a3);
  }
  -[CRLCanvasRep recursivelyDrawChildrenInContext:keepingChildrenPassingTest:](self, "recursivelyDrawChildrenInContext:keepingChildrenPassingTest:", a3, v6, *(_OWORD *)&v22.a, *(_OWORD *)&v22.c, *(_OWORD *)&v22.tx);
  objc_msgSend(v8, "endObject:", self);

}

- (void)recursivelyDrawChildrenInContext:(CGContext *)a3 keepingChildrenPassingTest:(id)a4
{
  unsigned int (**v6)(id, _QWORD);
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = (unsigned int (**)(id, _QWORD))a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
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
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11);
        if (!v6 || v6[2](v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11)))
        {
          CGContextSaveGState(a3);
          objc_msgSend(v12, "recursivelyDrawInContext:keepingChildrenPassingTest:", a3, v6);
          CGContextRestoreGState(a3);
        }
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)isSelectedIgnoringLocking
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  if ((objc_msgSend(v3, "isSelectable") & 1) == 0)
  {

    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v5 = objc_msgSend(v4, "isCanvasInteractive");

  if (!v5)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  if (!v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246DF0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10280();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246E10);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep isSelectedIgnoringLocking]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 1748, 0, "invalid nil value for '%{public}s'", "interactiveCanvasController");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v11 = objc_msgSend(v6, "currentSelectionPathContainsInfo:", v10);

  return v11;
}

- (BOOL)isSelected
{
  _BOOL4 v3;

  v3 = -[CRLCanvasRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking");
  if (v3)
    LOBYTE(v3) = !-[CRLCanvasRep isLocked](self, "isLocked");
  return v3;
}

- (void)becameSelected
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  BOOL i;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id WeakRetained;

  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentInfo", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  for (i = v10 == 0; v3 && !v10; i = v10 == 0)
  {
    v12 = v3;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentInfo"));

    *(_QWORD *)&v14 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v13).n128_u64[0];
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentInfo", v14));
    v18 = sub_100221D0C(v16, v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v18);

  }
  if (!i)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "editorController"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "selectionPath"));
    *(_QWORD *)&v23 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v22).n128_u64[0];
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "mostSpecificSelectionOfClass:", v24, v23));

    if (!v25)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101246E30);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E10310();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101246E50);
      v26 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep becameSelected]"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 1778, 0, "If something in a group has been selected, there should  be a group selection.");

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "canvasInvalidatedForRep:", self);

}

- (void)becameNotSelected
{
  CRLCanvasRenderable *mSelectionHighlightRenderable;
  id WeakRetained;

  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  -[CRLCanvasRep i_invalidateSelectionHighlightRenderable](self, "i_invalidateSelectionHighlightRenderable");
  self->mSelectionHighlightRenderableValid = 0;
  mSelectionHighlightRenderable = self->mSelectionHighlightRenderable;
  self->mSelectionHighlightRenderable = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "canvasInvalidatedForRep:", self);

}

- (void)becameSelectable
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childRepsToInformForSelectabilityChanges](self, "childRepsToInformForSelectabilityChanges", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "becameSelectable");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)becameNotSelectable
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childRepsToInformForSelectabilityChanges](self, "childRepsToInformForSelectabilityChanges", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "becameNotSelectable");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (NSSet)childRepsToInformForSelectabilityChanges
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return (NSSet *)v3;
}

- (BOOL)shouldAddCollaboratorLayerToOverlays
{
  return 1;
}

- (BOOL)shouldShowCollaboratorCursorHighlight
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v5 = objc_msgSend(v3, "i_shouldShowCollaboratorCursorForLayout:", v4);

  return v5;
}

- (id)p_currentCollaboratorPresence
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "i_collaboratorPresenceSelectingLayout:", v4));

  return v5;
}

- (CRLColor)currentCollaboratorCursorColor
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep p_currentCollaboratorPresence](self, "p_currentCollaboratorPresence"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "owner"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collaboratorColorForType:", 2));

  return (CRLColor *)v4;
}

- (void)collaboratorCursorChangedToSelectionPath:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  CRLCanvasRep *v7;

  v4 = a3;
  if (qword_10147E4E0 != -1)
    dispatch_once(&qword_10147E4E0, &stru_101246E70);
  v5 = off_1013D91E0;
  if (os_log_type_enabled((os_log_t)off_1013D91E0, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Collaborator Cursor: Selection Path Changed called for rep: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  -[CRLCanvasRep invalidateCollaboratorCursorRenderable](self, "invalidateCollaboratorCursorRenderable");

}

- (void)hideCollaboratorCursors
{
  NSObject *v3;
  int v4;
  CRLCanvasRep *v5;

  if (qword_10147E4E0 != -1)
    dispatch_once(&qword_10147E4E0, &stru_101246E90);
  v3 = off_1013D91E0;
  if (os_log_type_enabled((os_log_t)off_1013D91E0, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Collaborator Cursor: Hiding collaborator cursors for rep: %{public}@", (uint8_t *)&v4, 0xCu);
  }
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  -[CRLCanvasRep invalidateCollaboratorCursorRenderable](self, "invalidateCollaboratorCursorRenderable");
}

- (CGAffineTransform)transformForCollaboratorCursorRenderable
{
  CRLCanvasKnobTracker **p_mKnobTracker;
  id v6;
  void *v7;
  void *v8;
  CGAffineTransform *result;
  id WeakRetained;

  p_mKnobTracker = &self->mKnobTracker;
  WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);
  if (!WeakRetained)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v7 = v8;
    if (v8)
    {
      objc_msgSend(v8, "transformInRoot");
      goto LABEL_7;
    }
LABEL_6:
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
    goto LABEL_7;
  }
  v6 = objc_loadWeakRetained((id *)p_mKnobTracker);
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  objc_msgSend(v6, "transformInRootForStandardKnobs");
LABEL_7:

  return result;
}

- (void)invalidateCollaboratorCursorRenderable
{
  void *v3;
  id v4;

  self->mCollaboratorCursorRenderableValid = 0;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasController"));
  objc_msgSend(v3, "invalidateOverlayLayersForRep:", self);

}

- (BOOL)isDragAndDropHighlightLayerValid
{
  return self->mDragAndDropHighlightRenderable != 0;
}

- (void)invalidateDragAndDropHighlightLayer
{
  CRLCanvasRenderable *mDragAndDropHighlightRenderable;

  mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  self->mDragAndDropHighlightRenderable = 0;

}

- (CRLCanvasRenderable)collaboratorCursorRenderable
{
  NSObject *v3;
  CRLCanvasRenderable *v4;
  CRLCanvasRenderable *mCollaboratorCursorRenderable;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  objc_class *v16;
  objc_class *v17;
  void *v18;
  id v19;
  void *v20;
  id WeakRetained;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  BOOL v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  double x;
  double y;
  double width;
  double height;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  void *v65;
  id v66;
  CGFloat v67;
  CGFloat v68;
  CGPath *Mutable;
  uint64_t v70;
  double v71;
  objc_class *v72;
  objc_class *v73;
  void *v74;
  id v75;
  void *v76;
  CGFloat v77;
  CGFloat v78;
  CGPath *v79;
  uint64_t v80;
  double v81;
  objc_class *v82;
  objc_class *v83;
  void *v84;
  id v85;
  void *v86;
  CGFloat v87;
  CGFloat v88;
  CGPath *v89;
  uint64_t v90;
  double v91;
  objc_class *v92;
  objc_class *v93;
  void *v94;
  id v95;
  void *v96;
  CGFloat v97;
  CGFloat v98;
  CGPath *v99;
  id v100;
  id v101;
  id v102;
  uint64_t v103;
  double v104;
  void *i;
  void *v106;
  CGAffineTransform v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  CGAffineTransform v113;
  CGAffineTransform v114;
  CGAffineTransform v115;
  CGAffineTransform v116;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v119;
  _BYTE v120[128];
  CGAffineTransform buf;
  double MinX;
  double MaxY;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;

  if (qword_10147E4E0 != -1)
    dispatch_once(&qword_10147E4E0, &stru_101246EB0);
  v3 = off_1013D91E0;
  if (os_log_type_enabled((os_log_t)off_1013D91E0, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.a) = 138543362;
    *(_QWORD *)((char *)&buf.a + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Collaborator Cursor: Requesting collaborator cursor renderable for base rep: %{public}@", (uint8_t *)&buf, 0xCu);
  }
  if (!self->mCollaboratorCursorRenderable)
  {
    v4 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
    mCollaboratorCursorRenderable = self->mCollaboratorCursorRenderable;
    self->mCollaboratorCursorRenderable = v4;

    v6 = 4;
    do
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
      objc_msgSend(v7, "setFillColor:", 0);
      -[CRLCanvasRenderable addSubrenderable:](self->mCollaboratorCursorRenderable, "addSubrenderable:", v7);

      --v6;
    }
    while (v6);
    if (!self->mCollaboratorCursorRenderable)
      goto LABEL_10;
  }
  if (!self->mCollaboratorCursorRenderableValid)
  {
    if (qword_10147E4E0 != -1)
      dispatch_once(&qword_10147E4E0, &stru_101246ED0);
    v9 = off_1013D91E0;
    if (os_log_type_enabled((os_log_t)off_1013D91E0, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.a) = 138543362;
      *(_QWORD *)((char *)&buf.a + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Collaborator Cursor: Actually re-generating renderable for base rep: %{public}@", (uint8_t *)&buf, 0xCu);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable subrenderables](self->mCollaboratorCursorRenderable, "subrenderables"));
    if (objc_msgSend(v10, "count") != (id)4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101246EF0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E10390();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101246F10);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep collaboratorCursorRenderable]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1924, 0, "Expect four collaborator sublayers");

    }
    if (objc_msgSend(v10, "count") == (id)4)
    {
      *(_QWORD *)&v15 = objc_opt_class(CRLCanvasShapeRenderable, v14).n128_u64[0];
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0, v15));
      v19 = sub_1002223BC(v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

      WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
      objc_msgSend(WeakRetained, "viewScale");
      v23 = v22;

      v24 = 10.0 / v23;
      -[CRLCanvasRep boundsForCollaboratorCursorRenderable](self, "boundsForCollaboratorCursorRenderable");
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v33, "convertUnscaledToBoundsRect:", v26, v28, v30, v32);
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;

      v42 = fabs(v39);
      v43 = (30.0 - v42) * 0.5;
      v44 = v42 < 30.0;
      v45 = 0.0;
      if (!v44)
        v43 = 0.0;
      v46 = fabs(v41);
      if (v46 < 30.0)
        v45 = (30.0 - v46) * 0.5;
      v47 = 4.0 * 0.5 + 2.0;
      v48 = -(v47 + v43);
      v49 = -(v47 + v45);
      v124.origin.x = v35;
      v124.origin.y = v37;
      v124.size.width = v39;
      v124.size.height = v41;
      v125 = CGRectInset(v124, v48, v49);
      x = v125.origin.x;
      y = v125.origin.y;
      width = v125.size.width;
      height = v125.size.height;
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v54, "convertBoundsToUnscaledRect:", x, y, width, height);
      v56 = v55;
      v58 = v57;
      v60 = v59;
      v62 = v61;

      memset(&v119, 0, sizeof(v119));
      -[CRLCanvasRep transformForCollaboratorCursorRenderable](self, "transformForCollaboratorCursorRenderable");
      CGAffineTransformMakeScale(&t2, v23, v23);
      t1 = v119;
      CGAffineTransformConcat(&buf, &t1, &t2);
      v119 = buf;
      v126.origin.x = v56;
      v126.origin.y = v58;
      v126.size.width = v60;
      v126.size.height = v62;
      buf.a = CGRectGetMinX(v126);
      v127.origin.x = v56;
      v127.origin.y = v58;
      v127.size.width = v60;
      v127.size.height = v62;
      buf.b = CGRectGetMinY(v127);
      v128.origin.x = v56;
      v128.origin.y = v58;
      v128.size.width = v60;
      v128.size.height = v62;
      buf.c = CGRectGetMaxX(v128);
      v129.origin.x = v56;
      v129.origin.y = v58;
      v129.size.width = v60;
      v129.size.height = v62;
      buf.d = CGRectGetMinY(v129);
      v130.origin.x = v56;
      v130.origin.y = v58;
      v130.size.width = v60;
      v130.size.height = v62;
      buf.tx = CGRectGetMaxX(v130);
      v131.origin.x = v56;
      v131.origin.y = v58;
      v131.size.width = v60;
      v131.size.height = v62;
      buf.ty = CGRectGetMaxY(v131);
      v132.origin.x = v56;
      v132.origin.y = v58;
      v132.size.width = v60;
      v132.size.height = v62;
      MinX = CGRectGetMinX(v132);
      v133.origin.x = v56;
      v133.origin.y = v58;
      v133.size.width = v60;
      v133.size.height = v62;
      MaxY = CGRectGetMaxY(v133);
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      objc_msgSend(v63, "contentsScale");
      sub_1000C8454(&v119.a, (uint64_t)&buf, 4, v56, v58, v60, v62, 4.0, v64);

      v65 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep currentCollaboratorCursorColor](self, "currentCollaboratorCursorColor"));
      v66 = objc_msgSend(v65, "CGColor");

      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
      t1 = v119;
      CGAffineTransformInvert(&v116, &t1);
      v67 = v116.tx + buf.b * v116.c + v116.a * buf.a;
      v68 = v116.ty + buf.b * v116.d + v116.b * buf.a;
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, v67, v24 + v68);
      CGPathAddLineToPoint(Mutable, 0, v67, v68);
      CGPathAddLineToPoint(Mutable, 0, v24 + v67, v68);
      objc_msgSend(v20, "setPath:", Mutable);
      CGPathRelease(Mutable);
      *(_QWORD *)&v71 = objc_opt_class(CRLCanvasShapeRenderable, v70).n128_u64[0];
      v73 = v72;
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1, v71));
      v75 = sub_1002223BC(v73, v74);
      v76 = (void *)objc_claimAutoreleasedReturnValue(v75);

      t1 = v119;
      CGAffineTransformInvert(&v115, &t1);
      v77 = v115.tx + buf.d * v115.c + v115.a * buf.c;
      v78 = v115.ty + buf.d * v115.d + v115.b * buf.c;
      v79 = CGPathCreateMutable();
      CGPathMoveToPoint(v79, 0, v77, v24 + v78);
      CGPathAddLineToPoint(v79, 0, v77, v78);
      CGPathAddLineToPoint(v79, 0, v77 - v24, v78);
      objc_msgSend(v76, "setPath:", v79);
      CGPathRelease(v79);

      *(_QWORD *)&v81 = objc_opt_class(CRLCanvasShapeRenderable, v80).n128_u64[0];
      v83 = v82;
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 2, v81));
      v85 = sub_1002223BC(v83, v84);
      v86 = (void *)objc_claimAutoreleasedReturnValue(v85);

      t1 = v119;
      CGAffineTransformInvert(&v114, &t1);
      v87 = v114.tx + buf.ty * v114.c + v114.a * buf.tx;
      v88 = v114.ty + buf.ty * v114.d + v114.b * buf.tx;
      v89 = CGPathCreateMutable();
      CGPathMoveToPoint(v89, 0, v87, v88 - v24);
      CGPathAddLineToPoint(v89, 0, v87, v88);
      CGPathAddLineToPoint(v89, 0, v87 - v24, v88);
      objc_msgSend(v86, "setPath:", v89);
      CGPathRelease(v89);

      *(_QWORD *)&v91 = objc_opt_class(CRLCanvasShapeRenderable, v90).n128_u64[0];
      v93 = v92;
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 3, v91));
      v95 = sub_1002223BC(v93, v94);
      v96 = (void *)objc_claimAutoreleasedReturnValue(v95);

      t1 = v119;
      CGAffineTransformInvert(&v113, &t1);
      v97 = v113.tx + MaxY * v113.c + v113.a * MinX;
      v98 = v113.ty + MaxY * v113.d + v113.b * MinX;
      v99 = CGPathCreateMutable();
      CGPathMoveToPoint(v99, 0, v97, v98 - v24);
      CGPathAddLineToPoint(v99, 0, v97, v98);
      CGPathAddLineToPoint(v99, 0, v24 + v97, v98);
      objc_msgSend(v96, "setPath:", v99);
      CGPathRelease(v99);

      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v100 = v10;
      v101 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
      if (v101)
      {
        v102 = v101;
        v103 = *(_QWORD *)v110;
        v104 = 4.0 / v23;
        do
        {
          for (i = 0; i != v102; i = (char *)i + 1)
          {
            if (*(_QWORD *)v110 != v103)
              objc_enumerationMutation(v100);
            v106 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v106, "setStrokeColor:", v66);
            objc_msgSend(v106, "setLineWidth:", v104);
            v108 = v119;
            objc_msgSend(v106, "setAffineTransform:", &v108);
          }
          v102 = objc_msgSend(v100, "countByEnumeratingWithState:objects:count:", &v109, v120, 16);
        }
        while (v102);
      }

      +[CATransaction commit](CATransaction, "commit");
      self->mCollaboratorCursorRenderableValid = 1;

    }
  }
  else
  {
LABEL_10:
    if (qword_10147E4E0 != -1)
      dispatch_once(&qword_10147E4E0, &stru_101246F30);
    v8 = off_1013D91E0;
    if (os_log_type_enabled((os_log_t)off_1013D91E0, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.a) = 138543362;
      *(_QWORD *)((char *)&buf.a + 4) = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Collaborator Cursor: Not regenerating renderable, because it was considered already valid for base rep: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  return self->mCollaboratorCursorRenderable;
}

- (CGRect)boundsForStandardKnobs
{
  void *v2;
  double v3;
  double v4;
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
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v2, "boundsForStandardKnobs");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (NSArray)knobs
{
  id v3;
  NSObject *mKnobsAccessQueue;
  void *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char isKindOfClass;
  id WeakRetained;
  void *v15;
  id v16;
  _BOOL4 mShowKnobsWhenManipulated;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _QWORD v26[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[5];
  _QWORD v34[6];
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD v42[7];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  _QWORD v53[5];
  id v54;
  _QWORD block[6];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;

  if (!-[CRLCanvasRep hasBeenRemoved](self, "hasBeenRemoved"))
  {
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    mKnobsAccessQueue = self->mKnobsAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10023A94C;
    block[3] = &unk_10122C6A0;
    block[4] = self;
    block[5] = &v56;
    dispatch_sync(mKnobsAccessQueue, block);
    if (*((_BYTE *)v57 + 24))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      -[CRLCanvasRep addKnobsToArray:](self, "addKnobsToArray:", v5);
      if (objc_msgSend(v5, "count"))
        self->mKnobPositionsInvalid = 1;
      v6 = self->mKnobsAccessQueue;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_10023A98C;
      v53[3] = &unk_10122D3D8;
      v53[4] = self;
      v54 = v5;
      v7 = v5;
      dispatch_sync(v6, v53);

    }
    v49 = 0;
    v50 = &v49;
    v51 = 0x2020000000;
    v52 = 0;
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = sub_10023A998;
    v47 = sub_10023A9A8;
    v48 = 0;
    v8 = self->mKnobsAccessQueue;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10023A9B0;
    v42[3] = &unk_101246F58;
    v42[4] = self;
    v42[5] = &v49;
    v42[6] = &v43;
    dispatch_sync(v8, v42);
    if (*((_BYTE *)v50 + 24))
      -[CRLCanvasRep updatePositionsOfKnobs:](self, "updatePositionsOfKnobs:", v44[5]);
    self->mKnobPositionsInvalid = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = sub_10023A998;
    v40 = sub_10023A9A8;
    v41 = 0;
    v9 = self->mKnobsAccessQueue;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10023AA4C;
    v35[3] = &unk_10122C5F0;
    v35[4] = self;
    v35[5] = &v36;
    dispatch_sync(v9, v35);
    if (!objc_msgSend((id)v37[5], "count"))
      goto LABEL_20;
    if (objc_msgSend((id)v37[5], "count") == (id)1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v37[5], "crl_anyObject"));
      objc_opt_class(CRLCanvasPlaceholderInvisibleKnob, v11);
      isKindOfClass = objc_opt_isKindOfClass(v10, v12);

      if ((isKindOfClass & 1) != 0)
        goto LABEL_20;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);
    if (WeakRetained)
    {
      v15 = WeakRetained;
      v16 = objc_loadWeakRetained((id *)&self->mKnobTracker);
      if ((objc_msgSend(v16, "didBegin") & 1) != 0)
      {
        mShowKnobsWhenManipulated = self->mShowKnobsWhenManipulated;

        if (!mShowKnobsWhenManipulated)
        {
          v18 = objc_loadWeakRetained((id *)&self->mKnobTracker);
          v19 = objc_msgSend(v18, "enabledKnobMask");

          v20 = (void *)v37[5];
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_10023AA60;
          v34[3] = &unk_101246F80;
          v34[4] = self;
          v34[5] = v19;
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "crl_arrayOfObjectsPassingTest:", v34));
          goto LABEL_19;
        }
      }
      else
      {

      }
    }
    if (-[CRLCanvasRep shouldShowKnobs](self, "shouldShowKnobs"))
    {
LABEL_20:
      v27 = 0;
      v28 = &v27;
      v29 = 0x3032000000;
      v30 = sub_10023A998;
      v31 = sub_10023A9A8;
      v32 = 0;
      v24 = self->mKnobsAccessQueue;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10023AB70;
      v26[3] = &unk_101246FD0;
      v26[4] = self;
      v26[5] = &v36;
      v26[6] = &v27;
      dispatch_sync(v24, v26);
      v3 = (id)v28[5];
      _Block_object_dispose(&v27, 8);

      _Block_object_dispose(&v36, 8);
      _Block_object_dispose(&v43, 8);

      _Block_object_dispose(&v49, 8);
      _Block_object_dispose(&v56, 8);
      return (NSArray *)v3;
    }
    v22 = (void *)v37[5];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10023AB64;
    v33[3] = &unk_101246FA8;
    v33[4] = self;
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "crl_arrayOfObjectsPassingTest:", v33));
LABEL_19:
    v23 = (void *)v37[5];
    v37[5] = v21;

    goto LABEL_20;
  }
  v3 = &__NSArray0__struct;
  return (NSArray *)v3;
}

- (void)invalidateKnobs
{
  NSObject *mKnobsAccessQueue;
  void *v4;
  _QWORD block[5];

  mKnobsAccessQueue = self->mKnobsAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023AC5C;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_sync(mKnobsAccessQueue, block);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v4, "invalidateOverlayLayersForRep:", self);

}

- (unint64_t)enabledKnobMask
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id WeakRetained;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  unsigned int v16;
  double height;
  double width;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  unint64_t result;
  uint64_t v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = objc_msgSend(v3, "resizeMayChangeAspectRatio");

  if (v4)
    v5 = 990;
  else
    v5 = 650;
  -[CRLCanvasRep trackingBoundsForStandardKnobs](self, "trackingBoundsForStandardKnobs");
  v7 = v6;
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "viewScale");
  v12 = sub_1000603DC(v7, v9, v11);
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v16 = objc_msgSend(v15, "resizeMayChangeAspectRatio");

  if (v16)
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    objc_msgSend(v19, "minimumSize");
    v21 = v20;
    v23 = v22;

    width = 1.0;
    if (v23 <= 1.0)
      height = v23;
    else
      height = 1.0;
    if (v21 <= 1.0)
      width = v21;
  }
  v24 = v5 & 0x2DA;
  if (v12 >= 50.0)
    v24 = v5;
  if (v7 < width)
    result = v5 & 0x104;
  else
    result = v24;
  if (v9 >= height)
  {
    if (v14 >= 50.0)
      return result;
    v26 = 910;
  }
  else
  {
    v26 = 80;
  }
  result &= v26;
  return result;
}

- (void)addKnobsToArray:(id)a3
{
  CRLCanvasPlaceholderInvisibleKnob *v4;
  id v5;

  v5 = a3;
  v4 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:]([CRLCanvasPlaceholderInvisibleKnob alloc], "initWithType:position:radius:tag:onRep:", 1, 0, self, CGPointZero.x, CGPointZero.y, 0.0);
  objc_msgSend(v5, "addObject:", v4);
  if (-[CRLCanvasRep shouldCreateSelectionKnobs](self, "shouldCreateSelectionKnobs"))
  {
    -[CRLCanvasRep addSelectionKnobsToArray:](self, "addSelectionKnobsToArray:", v5);
  }
  else if (-[CRLCanvasRep shouldCreateLockedKnobs](self, "shouldCreateLockedKnobs"))
  {
    -[CRLCanvasRep addLockedKnobsToArray:](self, "addLockedKnobsToArray:", v5);
  }

}

- (id)newSelectionKnobForType:(unint64_t)a3 tag:(unint64_t)a4
{
  return -[CRLCanvasKnob initWithType:position:radius:tag:onRep:]([CRLCanvasKnob alloc], "initWithType:position:radius:tag:onRep:", a3, a4, self, CGPointZero.x, CGPointZero.y, 15.0);
}

- (void)addSelectionKnobsToArray:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  id v8;
  _TtC8Freeform21CRLConnectionLineKnob *v9;
  _TtC8Freeform21CRLConnectionLineKnob *v10;
  _TtC8Freeform21CRLConnectionLineKnob *v11;
  _TtC8Freeform21CRLConnectionLineKnob *v12;
  void *v13;
  _QWORD v14[4];

  v4 = a3;
  v5 = -[CRLCanvasRep enabledKnobMask](self, "enabledKnobMask");
  if (v5)
  {
    v6 = v5;
    for (i = 1; i != 10; ++i)
    {
      if ((sub_100260884(i) & v6) != 0)
      {
        v8 = -[CRLCanvasRep newSelectionKnobForType:tag:](self, "newSelectionKnobForType:tag:", 0, i);
        objc_msgSend(v4, "addObject:", v8);

      }
    }
  }
  if (-[CRLCanvasRep shouldCreateConnectionLineKnobs](self, "shouldCreateConnectionLineKnobs"))
  {
    v9 = -[CRLConnectionLineKnob initWithTag:onRep:]([_TtC8Freeform21CRLConnectionLineKnob alloc], "initWithTag:onRep:", 2, self);
    v14[0] = v9;
    v10 = -[CRLConnectionLineKnob initWithTag:onRep:]([_TtC8Freeform21CRLConnectionLineKnob alloc], "initWithTag:onRep:", 8, self);
    v14[1] = v10;
    v11 = -[CRLConnectionLineKnob initWithTag:onRep:]([_TtC8Freeform21CRLConnectionLineKnob alloc], "initWithTag:onRep:", 6, self);
    v14[2] = v11;
    v12 = -[CRLConnectionLineKnob initWithTag:onRep:]([_TtC8Freeform21CRLConnectionLineKnob alloc], "initWithTag:onRep:", 4, self);
    v14[3] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 4));
    objc_msgSend(v4, "addObjectsFromArray:", v13);

  }
}

- (void)addLockedKnobsToArray:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CRLCanvasRep addSelectionKnobsToArray:](self, "addSelectionKnobsToArray:", v5);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setType:", 4, (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "addObjectsFromArray:", v6);
}

- (NSSet)additionalRepsToResize
{
  return +[NSSet set](NSSet, "set");
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "tag") < 0xA;
}

- (CGRect)trackingBoundsForStandardKnobs
{
  CRLCanvasKnobTracker **p_mKnobTracker;
  id WeakRetained;
  id v5;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  p_mKnobTracker = &self->mKnobTracker;
  WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_mKnobTracker);
    objc_msgSend(v5, "currentBoundsForStandardKnobs");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
    v7 = v14;
    v9 = v15;
    v11 = v16;
    v13 = v17;
  }
  v18 = v7;
  v19 = v9;
  v20 = v11;
  v21 = v13;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)updatePositionsOfKnobs:(id)a3
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
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  -[CRLCanvasRep trackingBoundsForStandardKnobs](self, "trackingBoundsForStandardKnobs");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if ((char *)objc_msgSend(v18, "tag", (_QWORD)v19) - 1 <= (char *)8)
        {
          -[CRLCanvasRep positionOfStandardKnob:forBounds:](self, "positionOfStandardKnob:forBounds:", v18, v6, v8, v10, v12);
          objc_msgSend(v18, "setPosition:");
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

}

- (BOOL)forcesPlacementOnTop
{
  return 0;
}

- (double)horizontalOffsetForHyperlinkKnob
{
  return 0.0;
}

- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  unsigned __int16 v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  if (!objc_msgSend(v9, "tag") || (unint64_t)objc_msgSend(v9, "tag") >= 0xA)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101246FF0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10410();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247010);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep positionOfStandardKnob:forBounds:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 2305, 0, "-positionOfStandardKnob:forBounds: works for standard knobs only");

  }
  objc_msgSend(v9, "offset");
  v14 = v13;
  v16 = v15;
  if (!objc_msgSend(v9, "offsetValid"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v17, "viewScale");
    v19 = v18;

    if (width * v19 <= 16.0)
    {
      if (objc_msgSend(v9, "tag", width * v19) == (id)1
        || objc_msgSend(v9, "tag") == (id)4
        || objc_msgSend(v9, "tag") == (id)7)
      {
        v14 = v14 - (8.0 / v19 + width * -0.5);
      }
      else if (objc_msgSend(v9, "tag") == (id)3 || objc_msgSend(v9, "tag") == (id)6 || objc_msgSend(v9, "tag") == (id)9)
      {
        v14 = v14 + 8.0 / v19 + width * -0.5;
      }
    }
    if (height * v19 > 16.0)
      goto LABEL_24;
    if (objc_msgSend(v9, "tag", height * v19) == (id)1
      || objc_msgSend(v9, "tag") == (id)2
      || objc_msgSend(v9, "tag") == (id)3)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v20, "viewScale");
      v16 = v16 - (8.0 / v21 + height * -0.5);
    }
    else
    {
      if (objc_msgSend(v9, "tag") != (id)7 && objc_msgSend(v9, "tag") != (id)8 && objc_msgSend(v9, "tag") != (id)9)
        goto LABEL_24;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v20, "viewScale");
      v16 = v16 + 8.0 / v45 + height * -0.5;
    }

LABEL_24:
    objc_msgSend(v9, "setOffset:", v14, v16);
    objc_msgSend(v9, "setOffsetValid:", 1);
  }
  v22 = sub_100260E54((uint64_t)objc_msgSend(v9, "tag"), x, y, width, height);
  v24 = sub_1000603D0(v22, v23, v14);
  v26 = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v27, "viewScale");
  v29 = v28;

  +[CRLConnectionLineKnob unscaledConnectionKnobOffsetWithEdgeKnob](_TtC8Freeform21CRLConnectionLineKnob, "unscaledConnectionKnobOffsetWithEdgeKnob");
  v31 = v30;
  +[CRLConnectionLineKnob unscaledConnectionKnobOffsetWithoutEdgeKnob](_TtC8Freeform21CRLConnectionLineKnob, "unscaledConnectionKnobOffsetWithoutEdgeKnob");
  v33 = v32;
  v34 = (unsigned __int16)-[CRLCanvasRep enabledKnobMask](self, "enabledKnobMask");
  objc_opt_class(_TtC8Freeform21CRLConnectionLineKnob, v35);
  if ((objc_opt_isKindOfClass(v9, v36) & 1) != 0)
  {
    v37 = v31 / v29;
    v38 = v33 / v29;
    if (objc_msgSend(v9, "tag") == (id)6)
    {
      if ((v34 & 0x40) != 0)
        v39 = v37;
      else
        v39 = v38;
      v24 = v24 + v39;
    }
    else if (objc_msgSend(v9, "tag") == (id)4)
    {
      if ((v34 & 0x10) != 0)
        v40 = v37;
      else
        v40 = v38;
      v24 = v24 - v40;
    }
    else if (objc_msgSend(v9, "tag") == (id)2)
    {
      if ((v34 & 4) != 0)
        v41 = v37;
      else
        v41 = v38;
      v26 = v26 - v41;
    }
    else if (objc_msgSend(v9, "tag") == (id)8)
    {
      if ((v34 & 0x100) != 0)
        v42 = v37;
      else
        v42 = v38;
      v26 = v26 + v42;
    }
  }

  v43 = v24;
  v44 = v26;
  result.y = v44;
  result.x = v43;
  return result;
}

- (void)invalidateKnobPositions
{
  void *v3;
  id v4;

  self->mKnobPositionsInvalid = 1;
  -[CRLCanvasRep i_invalidateSelectionHighlightRenderable](self, "i_invalidateSelectionHighlightRenderable");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasController"));
  objc_msgSend(v3, "invalidateOverlayLayersForRep:", self);

}

- (id)newTrackerForKnob:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  __objc2_class **v11;
  id v12;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247030);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10490();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247050);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep newTrackerForKnob:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 2382, 0, "invalid nil value for '%{public}s'", "knob");

  }
  v8 = (char *)objc_msgSend(v4, "tag");
  objc_opt_class(_TtC8Freeform21CRLConnectionLineKnob, v9);
  if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0)
  {
    v11 = &off_10122A4E0;
  }
  else
  {
    if ((unint64_t)(v8 - 1) > 8)
    {
      v12 = 0;
      goto LABEL_17;
    }
    v11 = off_101229988;
  }
  v12 = objc_msgSend(objc_alloc(*v11), "initWithRep:knob:", self, v4);
LABEL_17:

  return v12;
}

- (void)p_toggleHyperlinkUIVisibility
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v3, "toggleHyperlinkUIForRep:", self);

}

- (id)knobForTag:(unint64_t)a3
{
  void *v4;
  id v5;
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

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep knobs](self, "knobs", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "tag") == (id)a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (double)additionalRotationForKnobOrientation
{
  void *v2;
  void *v3;
  double v4;
  _OWORD v6[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "transformInRoot");
  else
    memset(v6, 0, sizeof(v6));
  v4 = sub_1000791B0(v6);

  return v4;
}

- (CRLCanvasKnob)knobForInspectorResize
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  CRLCanvasKnob *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v4 = objc_msgSend(v3, "isAnchoredAtRight");

  if (v4)
    v5 = 7;
  else
    v5 = 9;
  v6 = (CRLCanvasKnob *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep knobForTag:](self, "knobForTag:", v5));
  if (!v6)
    v6 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:]([CRLCanvasKnob alloc], "initWithType:position:radius:tag:onRep:", 0, v5, self, CGPointZero.x, CGPointZero.y, 15.0);
  return v6;
}

- (CGAffineTransform)knobPositionTransformForInspectorResize
{
  CGFloat v4;
  CGFloat v5;

  -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
  return CGAffineTransformMakeTranslation(retstr, v4, v5);
}

- (BOOL)shouldShowSelectionHighlight
{
  id WeakRetained;
  unsigned __int8 v4;
  void *v5;

  if (!-[CRLCanvasRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking")
    || -[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation")
    && (!self->mShowKnobsWhenManipulated || !self->mKnobsAreShowing))
  {
    return 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);
  if ((objc_msgSend(WeakRetained, "shouldHideSelectionHighlight") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v4 = objc_msgSend(v5, "allowsSelectionHighlight");

  }
  return v4;
}

- (BOOL)shouldCreateKnobs
{
  return 1;
}

- (BOOL)shouldCreateConnectionLineKnobs
{
  void *v3;
  BOOL v4;
  void *v5;

  if (!+[CRLFeatureFlagGroup isEasierConnectionLinesEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isEasierConnectionLinesEnabled"))return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  if ((objc_msgSend(v3, "isInGroup") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    if (objc_msgSend(v5, "connectorKnobsEnabled"))
      v4 = +[CRLConnectionLineRep canConnectToRep:](CRLConnectionLineRep, "canConnectToRep:", self);
    else
      v4 = 0;

  }
  return v4;
}

- (BOOL)shouldCreateSelectionKnobs
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  if (!-[CRLCanvasRep shouldShowKnobs](self, "shouldShowKnobs") || !-[CRLCanvasRep isSelected](self, "isSelected"))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  if ((objc_msgSend(v3, "usesAlternateDrawableSelectionHighlight") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    if (objc_msgSend(v5, "allowsSelectionKnobs"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      if (objc_msgSend(v6, "shouldSuppressSelectionKnobsForRep:", self))
        v4 = -[CRLCanvasRep shouldIgnoreICCSuppressSelectionKnobs](self, "shouldIgnoreICCSuppressSelectionKnobs");
      else
        v4 = 1;

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (BOOL)shouldIgnoreICCSuppressSelectionKnobs
{
  return 0;
}

- (BOOL)shouldSuppressSelectionHighlightDuringMultiselection
{
  return 0;
}

- (BOOL)shouldCreateLockedKnobs
{
  _BOOL4 v3;

  v3 = -[CRLCanvasRep isLocked](self, "isLocked");
  if (v3)
    LOBYTE(v3) = -[CRLCanvasRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking");
  return v3;
}

- (BOOL)isEditingPath
{
  return 0;
}

- (BOOL)shouldShowKnobs
{
  BOOL v3;
  id WeakRetained;

  if (!-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation") || self->mShowKnobsWhenManipulated)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);
  v3 = WeakRetained != 0;

  return v3;
}

- (void)turnKnobsOn
{
  NSObject *mKnobsAccessQueue;
  _QWORD block[5];

  self->mKnobsAreShowing = 1;
  mKnobsAccessQueue = self->mKnobsAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023C160;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_sync(mKnobsAccessQueue, block);
}

- (void)fadeKnobsIn
{
  void *v3;
  double v4;
  void *v5;
  NSObject *mKnobsAccessQueue;
  id v7;
  _QWORD block[5];
  id v9;

  self->mKnobsAreShowing = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "setDuration:", 0.150000006);
  LODWORD(v4) = 1.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
  objc_msgSend(v3, "setToValue:", v5);

  mKnobsAccessQueue = self->mKnobsAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023C39C;
  block[3] = &unk_10122D3D8;
  block[4] = self;
  v9 = v3;
  v7 = v3;
  dispatch_sync(mKnobsAccessQueue, block);

}

- (void)fadeKnobsOut
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  NSObject *mKnobsAccessQueue;
  id v9;
  _QWORD block[5];
  id v11;

  self->mKnobsAreShowing = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "setDuration:", 0.150000006);
  LODWORD(v4) = 1.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
  objc_msgSend(v3, "setFromValue:", v5);

  LODWORD(v6) = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  objc_msgSend(v3, "setToValue:", v7);

  mKnobsAccessQueue = self->mKnobsAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023C660;
  block[3] = &unk_10122D3D8;
  block[4] = self;
  v11 = v3;
  v9 = v3;
  dispatch_sync(mKnobsAccessQueue, block);

}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;

  v3 = a3;
  v5 = objc_opt_class(CRLCanvasPlaceholderInvisibleKnob, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  return isKindOfClass & 1;
}

- (BOOL)knobTrackingShouldFailForForceTouchOnKnob:(id)a3 atNaturalPoint:(CGPoint)a4
{
  return 0;
}

- (double)selectionHighlightWidth
{
  return 1.0;
}

- (CRLColor)defaultSelectionHighlightColor
{
  return +[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.17254902, 0.439215686, 1.0, 1.0);
}

- (CRLColor)selectionHighlightColor
{
  id v3;
  void *v4;
  void *v5;

  if (-[CRLCanvasRep isLocked](self, "isLocked"))
  {
    if (qword_1014151C8 != -1)
      dispatch_once(&qword_1014151C8, &stru_101247070);
    v3 = (id)qword_1014151D0;
    goto LABEL_7;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionHighlightColor"));

  if (!v5)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep defaultSelectionHighlightColor](self, "defaultSelectionHighlightColor"));
LABEL_7:
    v5 = v3;
  }
  return (CRLColor *)v5;
}

- (CGAffineTransform)transformForHighlightLayer
{
  CRLCanvasKnobTracker **p_mKnobTracker;
  id v6;
  void *v7;
  void *v8;
  CGAffineTransform *result;
  id WeakRetained;

  p_mKnobTracker = &self->mKnobTracker;
  WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);
  if (!WeakRetained)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v7 = v8;
    if (v8)
    {
      objc_msgSend(v8, "transformInRoot");
      goto LABEL_7;
    }
LABEL_6:
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
    goto LABEL_7;
  }
  v6 = objc_loadWeakRetained((id *)p_mKnobTracker);
  v7 = v6;
  if (!v6)
    goto LABEL_6;
  objc_msgSend(v6, "transformInRootForStandardKnobs");
LABEL_7:

  return result;
}

- (void)invalidateSelectionHighlightRenderable
{
  CRLCanvasRenderable *mSelectionHighlightRenderable;

  -[CRLCanvasRenderable setDelegate:](self->mSelectionHighlightRenderable, "setDelegate:", 0);
  mSelectionHighlightRenderable = self->mSelectionHighlightRenderable;
  self->mSelectionHighlightRenderable = 0;

  self->mSelectionHighlightRenderableValid = 0;
}

- (CRLCanvasRenderable)selectionHighlightRenderable
{
  CRLCanvasRenderable *mSelectionHighlightRenderable;
  CRLCanvasRenderable *v4;
  CRLCanvasRenderable *v5;
  void *v6;

  mSelectionHighlightRenderable = self->mSelectionHighlightRenderable;
  if (!mSelectionHighlightRenderable)
  {
    v4 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep makeSelectionHighlightRenderable](self, "makeSelectionHighlightRenderable"));
    v5 = self->mSelectionHighlightRenderable;
    self->mSelectionHighlightRenderable = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    -[CRLCanvasRenderable setDelegate:](self->mSelectionHighlightRenderable, "setDelegate:", v6);

    self->mSelectionHighlightRenderableValid = 0;
    mSelectionHighlightRenderable = self->mSelectionHighlightRenderable;
LABEL_5:
    -[CRLCanvasRep updateSelectionHighlightRenderable:](self, "updateSelectionHighlightRenderable:", mSelectionHighlightRenderable);
    self->mSelectionHighlightRenderableValid = 1;
    mSelectionHighlightRenderable = self->mSelectionHighlightRenderable;
    return mSelectionHighlightRenderable;
  }
  if (!self->mSelectionHighlightRenderableValid)
    goto LABEL_5;
  return mSelectionHighlightRenderable;
}

- (id)makeSelectionHighlightRenderable
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
  objc_msgSend(v3, "setFillColor:", 0);
  -[CRLCanvasRep selectionHighlightWidth](self, "selectionHighlightWidth");
  objc_msgSend(v3, "setLineWidth:");
  return v3;
}

- (void)updateSelectionHighlightRenderable:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  CGPath *v25;
  CGAffineTransform v26;
  CGAffineTransform t2;
  CGAffineTransform v28;
  CGAffineTransform v29;

  v4 = a3;
  objc_opt_class(CRLCanvasShapeRenderable, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep selectionHighlightColor](self, "selectionHighlightColor"));
    objc_msgSend(v8, "setStrokeColor:", objc_msgSend(v9, "CGColor"));

    -[CRLCanvasRep selectionHighlightWidth](self, "selectionHighlightWidth");
    objc_msgSend(v8, "setLineWidth:");
    WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
    objc_msgSend(WeakRetained, "viewScale");
    v12 = v11;

    -[CRLCanvasRep boundsForHighlightLayer](self, "boundsForHighlightLayer");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    memset(&v29, 0, sizeof(v29));
    -[CRLCanvasRep transformForHighlightLayer](self, "transformForHighlightLayer");
    CGAffineTransformMakeScale(&t2, v12, v12);
    v26 = v29;
    CGAffineTransformConcat(&v28, &v26, &t2);
    v29 = v28;
    objc_msgSend(v8, "lineWidth");
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v23, "contentsScale");
    v25 = sub_1000C8504(&v29.a, v14, v16, v18, v20, v22, v24);

    objc_msgSend(v8, "setPath:", v25);
    CGPathRelease(v25);
  }

}

- (void)i_invalidateSelectionHighlightRenderable
{
  self->mSelectionHighlightRenderableValid = 0;
  -[CRLCanvasRep invalidateCollaboratorCursorRenderable](self, "invalidateCollaboratorCursorRenderable");
  -[CRLCanvasRep invalidateDragAndDropHighlightLayer](self, "invalidateDragAndDropHighlightLayer");
}

- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3
{
  double y;
  double x;
  CRLCanvasKnobTracker **p_mKnobTracker;
  id WeakRetained;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  p_mKnobTracker = &self->mKnobTracker;
  WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_mKnobTracker);
    objc_msgSend(v8, "convertKnobPositionToUnscaledCanvas:", x, y);
    v10 = v9;
    v12 = v11;

    v13 = v10;
    v14 = v12;
  }
  else
  {
    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
  }
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPoint)convertKnobPositionFromUnscaledCanvas:(CGPoint)a3
{
  double y;
  double x;
  CRLCanvasKnobTracker **p_mKnobTracker;
  id WeakRetained;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  p_mKnobTracker = &self->mKnobTracker;
  WeakRetained = objc_loadWeakRetained((id *)&self->mKnobTracker);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_mKnobTracker);
    objc_msgSend(v8, "convertKnobPositionFromUnscaledCanvas:", x, y);
    v10 = v9;
    v12 = v11;

    v13 = v10;
    v14 = v12;
  }
  else
  {
    -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", x, y);
  }
  result.y = v14;
  result.x = v13;
  return result;
}

- (id)p_addRenderablesForKnobsToArray:(id)a3 withDelegate:(id)a4 isOverlay:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char isKindOfClass;
  id v15;
  void *v16;
  _QWORD *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  void *v23;
  CRLCanvasRep *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[6];
  BOOL v29;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep knobs](self, "knobs"));
  if (!objc_msgSend(v10, "count")
    || objc_msgSend(v10, "count") == (id)1
    && (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crl_anyObject")),
        objc_opt_class(CRLCanvasPlaceholderInvisibleKnob, v12),
        isKindOfClass = objc_opt_isKindOfClass(v11, v13),
        v11,
        (isKindOfClass & 1) != 0))
  {
    v15 = v8;
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10023CFBC;
    v28[3] = &unk_1012470D8;
    v29 = a5;
    v28[4] = v10;
    v28[5] = self;
    v17 = objc_retainBlock(v28);
    if (!v8)
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10023D424;
    v26[3] = &unk_101247100;
    v26[4] = self;
    v18 = v8;
    v27 = v18;
    ((void (*)(_QWORD *, _QWORD *))v17[2])(v17, v26);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10023D49C;
    v21[3] = &unk_101247168;
    v22 = v9;
    v23 = v16;
    v24 = self;
    v19 = v18;
    v25 = v19;
    ((void (*)(_QWORD *, _QWORD *))v17[2])(v17, v21);
    v15 = v19;

  }
  return v15;
}

- (NSArray)overlayRenderables
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[CRLCanvasRep shouldShowCollaboratorCursorHighlight](self, "shouldShowCollaboratorCursorHighlight")
    && -[CRLCanvasRep shouldAddCollaboratorLayerToOverlays](self, "shouldAddCollaboratorLayerToOverlays"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep collaboratorCursorRenderable](self, "collaboratorCursorRenderable"));
    if (v4)
      objc_msgSend(v3, "addObject:", v4);

  }
  if (-[CRLCanvasRep p_shouldShowSelectionHighlight](self, "p_shouldShowSelectionHighlight"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep selectionHighlightRenderable](self, "selectionHighlightRenderable"));
    if (v5)
      objc_msgSend(v3, "addObject:", v5);

  }
  if (-[CRLCanvasRep shouldShowDragAndDropHighlight](self, "shouldShowDragAndDropHighlight"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep dragAndDropHighlightRenderable](self, "dragAndDropHighlightRenderable"));
    if (v6)
      objc_msgSend(v3, "addObject:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep p_addRenderablesForKnobsToArray:withDelegate:isOverlay:](self, "p_addRenderablesForKnobsToArray:withDelegate:isOverlay:", v3, v7, 1));

  return (NSArray *)v8;
}

- (BOOL)p_shouldShowSelectionHighlight
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  if (objc_msgSend(v3, "shouldSuppressSelectionKnobsForRep:", self))
  {
    v4 = -[CRLCanvasRep shouldSuppressSelectionHighlightDuringMultiselection](self, "shouldSuppressSelectionHighlightDuringMultiselection");

    if ((v4 & 1) == 0)
      return 1;
  }
  else
  {

  }
  return -[CRLCanvasRep shouldShowSelectionHighlight](self, "shouldShowSelectionHighlight");
}

- (double)contentsScale
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v2, "contentsScale");
  v4 = v3;

  return v4;
}

- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  -[CRLCanvasRep recursivelyPerformSelector:withObject:](self, "recursivelyPerformSelector:withObject:", "p_dynamicOperationDidBeginWithRealTimeCommands:", v4);

}

- (void)p_dynamicOperationDidBeginWithRealTimeCommands:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  id v13;
  id WeakRetained;

  v4 = a3;
  if (-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247188);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10520();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012471A8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep p_dynamicOperationDidBeginWithRealTimeCommands:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 2824, 0, "beginning dynamic operation on rep already being manipulated");

  }
  -[CRLCanvasRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas");
  self->mOriginalLayerFrameInScaledCanvas.origin.x = v8;
  self->mOriginalLayerFrameInScaledCanvas.origin.y = v9;
  self->mOriginalLayerFrameInScaledCanvas.size.width = v10;
  self->mOriginalLayerFrameInScaledCanvas.size.height = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v13 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v12, "beginDynamicOperationWithRealTimeCommands:", v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "canvasInvalidatedForRep:", self);

}

- (void)dynamicOperationDidEnd
{
  void *v3;
  void *v4;
  unsigned int v5;
  id v6;

  -[CRLCanvasRep recursivelyPerformSelector:](self, "recursivelyPerformSelector:", "p_dynamicOperationDidEnd");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep p_connectedReps](self, "p_connectedReps"));
  objc_msgSend(v3, "makeObjectsPerformSelector:", "invalidateKnobs");

  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v5 = objc_msgSend(v4, "isInGroup");

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
    objc_msgSend(v6, "p_invalidateChildKnobPositionsForEndingDynamicOperation");

  }
}

- (void)p_invalidateChildKnobPositionsForEndingDynamicOperation
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->mHasInvalidatedChildKnobPositionsForEndingDynamicOperation)
  {
    self->mHasInvalidatedChildKnobPositionsForEndingDynamicOperation = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps"));
    objc_msgSend(v3, "makeObjectsPerformSelector:", "invalidateKnobPositions");

    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10023DDE0;
    v5[3] = &unk_10122D4C0;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "performBlockAfterLayoutIfNecessary:", v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)p_dynamicOperationDidEnd
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v3, "endDynamicOperation");

  if (-[CRLCanvasRep shouldShowKnobs](self, "shouldShowKnobs"))
    -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
}

- (BOOL)isInDynamicOperation
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = objc_msgSend(v2, "layoutState") != 0;

  return v3;
}

- (BOOL)allowsSupportedDynamicOperationsToBeRealTime
{
  return 1;
}

- (CRLShadow)shadow
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLBoardItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shadow"));
  return (CRLShadow *)v9;
}

- (void)drawInContextWithoutEffectsOrChildrenForAlphaOnly:(CGContext *)a3
{
  -[CRLCanvasRep drawInContextWithoutEffectsForAlphaOnly:](self, "drawInContextWithoutEffectsForAlphaOnly:", a3);
}

- (BOOL)shouldShowShadow
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v4 = objc_msgSend(v3, "suppressesShadowsAndReflections");

  if ((v4 & 1) != 0
    || -[CRLCanvasRep isBeingResized](self, "isBeingResized")
    || -[CRLCanvasRep isBeingRotated](self, "isBeingRotated")
    || -[CRLCanvasRep isBeingFreeTransformResized](self, "isBeingFreeTransformResized"))
  {
    return 0;
  }
  else
  {
    return !-[CRLCanvasRep inFreeTransformRotateResizeMode](self, "inFreeTransformRotateResizeMode");
  }
}

- (void)p_willUpdateEffectRenderablesForRenderable:(id)a3
{
  CRLCanvasRenderable *v4;
  CRLCanvasRenderable *mShadowRenderable;
  CRLCanvasRenderable *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep shadow](self, "shadow", a3));
  if (v7 && objc_msgSend(v7, "isEnabled") && -[CRLCanvasRep shouldShowShadow](self, "shouldShowShadow"))
  {
    if (!self->mShadowRenderable)
    {
      v4 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(+[CRLNoDefaultImplicitActionRenderable renderable](CRLNoDefaultImplicitActionRenderable, "renderable"));
      mShadowRenderable = self->mShadowRenderable;
      self->mShadowRenderable = v4;

      -[CRLCanvasRep invalidateShadowRenderable](self, "invalidateShadowRenderable");
    }
  }
  else
  {
    v6 = self->mShadowRenderable;
    if (v6)
    {
      self->mShadowRenderable = 0;

    }
  }

}

- (BOOL)isInvisible
{
  return 0;
}

- (void)p_didUpdateEffectRenderablesForRenderable:(id)a3
{
  unsigned __int8 v4;
  CRLCanvasRenderable *mShadowRenderable;
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  float v41;
  double v42;
  void *v43;
  CRLCanvasRenderable *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  CGImage *v52;
  id v53;
  CGRect v54;
  CGRect v55;

  if (-[CRLCanvasRep isInvisible](self, "isInvisible", a3))
  {
    -[CRLCanvasRenderable setContents:](self->mShadowRenderable, "setContents:", 0);
    return;
  }
  v53 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = objc_msgSend(v53, "createRepsForOffscreenLayouts");
  mShadowRenderable = self->mShadowRenderable;
  if (mShadowRenderable && (v4 & 1) == 0)
  {
    objc_msgSend(v53, "visibleBoundsRectForTiling");
    objc_msgSend(v53, "convertBoundsToUnscaledRect:");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    objc_msgSend(v14, "frameForCulling");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "parent"));

    if (v24)
    {
      objc_msgSend(v24, "rectInRoot:", v16, v18, v20, v22);
      v16 = v25;
      v18 = v26;
      v20 = v27;
      v22 = v28;
    }
    v54.origin.x = v16;
    v54.origin.y = v18;
    v54.size.width = v20;
    v54.size.height = v22;
    v55.origin.x = v7;
    v55.origin.y = v9;
    v55.size.width = v11;
    v55.size.height = v13;
    if (!CGRectIntersectsRect(v54, v55))
    {
      LODWORD(v29) = 0;
      -[CRLCanvasRenderable setOpacity:](self->mShadowRenderable, "setOpacity:", v29);

      return;
    }

    mShadowRenderable = self->mShadowRenderable;
  }
  if (mShadowRenderable
    && !-[CRLCanvasRep isBeingResized](self, "isBeingResized")
    && !-[CRLCanvasRep inFreeTransformRotateResizeMode](self, "inFreeTransformRotateResizeMode"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep shadow](self, "shadow"));
    if (!v30)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012471C8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E10620();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012471E8);
      v31 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep p_didUpdateEffectRenderablesForRenderable:]"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 2978, 0, "invalid nil value for '%{public}s'", "shadow");

    }
    if ((objc_msgSend(v30, "isEnabled") & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247208);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E105A0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247228);
      v34 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep p_didUpdateEffectRenderablesForRenderable:]"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v35, v36, 2979, 0, "shouldn't have shadow renderable if shadow is not enabled");

    }
    if (v30 && objc_msgSend(v30, "isEnabled"))
    {
      -[CRLCanvasRep opacity](self, "opacity");
      v38 = v37;
      objc_msgSend(v30, "opacity");
      v40 = v38 * v39;
      -[CRLCanvasRenderable opacity](self->mShadowRenderable, "opacity");
      v42 = v41;
      if (v40 != v42)
      {
        *(float *)&v42 = v40;
        -[CRLCanvasRenderable setOpacity:](self->mShadowRenderable, "setOpacity:", v42);
      }
      if (v40 != 0.0)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable contents](self->mShadowRenderable, "contents"));

        if (!v43)
          -[CRLCanvasRep invalidateShadowRenderable](self, "invalidateShadowRenderable");
      }
      if (-[CRLCanvasRep isBeingRotated](self, "isBeingRotated"))
        -[CRLCanvasRep invalidateShadowRenderable](self, "invalidateShadowRenderable");
      v44 = self->mShadowRenderable;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
      objc_msgSend(v45, "shadowedNaturalBoundsWithoutOffset");
      -[CRLCanvasRep p_positionShadowRenderable:forShadow:withNaturalBounds:](self, "p_positionShadowRenderable:forShadow:withNaturalBounds:", v44, v30);

    }
    if (self->mShadowRenderableInvalid)
    {
      -[CRLCanvasRenderable bounds](self->mShadowRenderable, "bounds");
      v47 = v46;
      v49 = v48;
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      objc_msgSend(v50, "viewScale");
      v52 = -[CRLCanvasRep newShadowImageWithSize:unflipped:withChildren:](self, "newShadowImageWithSize:unflipped:withChildren:", 0, 1, sub_1000603DC(v47, v49, 1.0 / v51));

      -[CRLCanvasRenderable setContents:](self->mShadowRenderable, "setContents:", v52);
      self->mShadowRenderableInvalid = 0;
      CGImageRelease(v52);
    }

  }
}

- (void)invalidateShadowRenderable
{
  self->mShadowRenderableInvalid = 1;
}

- (void)p_positionShadowRenderable:(id)a3 forShadow:(id)a4 withNaturalBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  __int128 v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  __int128 v85;
  double v86;
  double v87;
  double v88;
  double v89;
  uint64_t v90;
  void *v91;
  double v92;
  double v93;
  uint64_t v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v13, "viewScale");
  v15 = v14;

  if (objc_msgSend(v12, "isDropShadow"))
  {
    sub_100060FD8(x, y, width, height, v15);
    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    v114 = 0u;
    -[CRLCanvasRep computeDirectLayerFrame:andTransform:](self, "computeDirectLayerFrame:andTransform:", &v117, &v114);
    v16 = sub_100061400(*(CGFloat *)&v117, *((CGFloat *)&v117 + 1), *(CGFloat *)&v118, *((CGFloat *)&v118 + 1));
    v18 = v17;
    objc_msgSend(v12, "offsetDelta");
    v21 = sub_1000603DC(v19, v20, v15);
    v23 = sub_1000630C4(v21, v22);
    objc_msgSend(v11, "setPosition:", sub_1000603D0(v16, v18, v23));
    objc_msgSend(v11, "setBounds:", sub_10005FDDC());
    v111 = v114;
    v112 = v115;
    v113 = v116;
    v24 = &v111;
  }
  else if (objc_msgSend(v12, "isContactShadow"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep shadow](self, "shadow"));
    objc_msgSend(v25, "boundsForRep:", self);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;

    v34 = sub_100060FD8(v27, v29, v31, v33, v15);
    v38 = sub_100061400(v34, v35, v36, v37);
    v40 = v39;
    objc_msgSend(v12, "offset");
    v42 = sub_1000603DC(0.0, v41, v15);
    v44 = sub_1000630C4(v42, v43);
    v45 = sub_1000603D0(v38, v40, v44);
    v47 = v46;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));

    if (v48)
    {
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
      objc_msgSend(v49, "layerFrameInScaledCanvas");
      v51 = v50;
      v53 = v52;

      v45 = v45 - v51;
      v47 = v47 - v53;
    }
    objc_msgSend(v11, "setPosition:", v45, v47);
    objc_msgSend(v11, "setBounds:", sub_10005FDDC());
    v54 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v108 = *(_OWORD *)&CGAffineTransformIdentity.a;
    v109 = v54;
    v110 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v24 = &v108;
  }
  else
  {
    if (!objc_msgSend(v12, "isCurvedShadow"))
      goto LABEL_12;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep shadow](self, "shadow"));
    objc_msgSend(v55, "boundsForRep:", self);
    v57 = v56;
    v59 = v58;
    v61 = v60;
    v63 = v62;

    v64 = sub_100060FD8(v57, v59, v61, v63, v15);
    v68 = sub_100061400(v64, v65, v66, v67);
    v70 = v69;
    objc_msgSend(v12, "offsetDelta");
    v73 = sub_1000603DC(v71, v72, v15);
    v75 = sub_1000630C4(v73, v74);
    v76 = sub_1000603D0(v68, v70, v75);
    v78 = v77;
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));

    if (v79)
    {
      v80 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
      objc_msgSend(v80, "layerFrameInScaledCanvas");
      v82 = v81;
      v84 = v83;

      v76 = v76 - v82;
      v78 = v78 - v84;
    }
    objc_msgSend(v11, "setPosition:", v76, v78);
    objc_msgSend(v11, "setBounds:", sub_10005FDDC());
    v85 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v105 = *(_OWORD *)&CGAffineTransformIdentity.a;
    v106 = v85;
    v107 = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v24 = &v105;
  }
  objc_msgSend(v11, "setAffineTransform:", v24, v105, v106, v107, v108, v109, v110, v111, v112, v113);
LABEL_12:
  objc_msgSend(v11, "frame");
  v87 = v86;
  v89 = v88;
  v90 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superlayer"));
  if (v90)
  {
    v91 = (void *)v90;
    do
    {
      objc_msgSend(v91, "frame");
      v87 = sub_1000603D0(v87, v89, v92);
      v89 = v93;
      v94 = objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "superlayer"));

      v91 = (void *)v94;
    }
    while (v94);
  }
  objc_msgSend(v11, "position");
  v96 = v95;
  v98 = v97;
  v99 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v99, "contentsScale");
  v101 = sub_1000630F8(v87, v89, v100);
  v103 = v102;

  v104 = sub_1000603B8(v101, v103, v87);
  objc_msgSend(v11, "setPosition:", sub_1000603D0(v96, v98, v104));

}

- (BOOL)canDrawShadowInOneStepWithChildren:(BOOL)a3
{
  return 0;
}

- (CGImage)newShadowImageWithSize:(CGSize)a3 shadow:(id)a4 drawSelector:(SEL)a5 unflipped:(BOOL)a6
{
  return (CGImage *)_objc_msgSend(a4, "newShadowImageForRep:withSize:drawSelector:unflipped:", self, a5, a6, a3.width, a3.height);
}

- (CGImage)newShadowImageWithSize:(CGSize)a3 unflipped:(BOOL)a4 withChildren:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  char **v9;
  char *v10;
  void *v11;
  CGImage *v12;

  v5 = a4;
  height = a3.height;
  width = a3.width;
  v9 = &selRef_drawInContextWithoutEffectsForAlphaOnly_;
  if (!a5)
    v9 = &selRef_drawInContextWithoutEffectsOrChildrenForAlphaOnly_;
  v10 = *v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep shadow](self, "shadow"));
  v12 = -[CRLCanvasRep newShadowImageWithSize:shadow:drawSelector:unflipped:](self, "newShadowImageWithSize:shadow:drawSelector:unflipped:", v11, v10, v5, width, height);

  return v12;
}

- (id)createAdditionalBoardItemsForCopyImaging
{
  return &__NSArray0__struct;
}

- (void)dynamicDragDidBegin
{
  id WeakRetained;

  -[CRLCanvasRep p_dynamicDragDidBegin](self, "p_dynamicDragDidBegin");
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "canvasInvalidatedForRep:", self);

}

- (NSString)actionStringForDrag
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Move"), 0, CFSTR("UndoStrings")));

  return (NSString *)v3;
}

- (void)p_dynamicDragDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247248);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E106B0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247268);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep p_dynamicDragDidBegin]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 3129, 0, "dynamic drag beginning outside of dynamic operation");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v6, "beginDrag");

}

- (BOOL)isBeingDragged
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = objc_msgSend(v2, "layoutState") == 2;

  return v3;
}

- (CGRect)snapRectForDynamicDragWithOffset:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v5, "alignmentFrameInRoot");
  v15 = CGRectOffset(v14, x, y);
  v6 = v15.origin.x;
  v7 = v15.origin.y;
  width = v15.size.width;
  height = v15.size.height;

  v10 = v6;
  v11 = v7;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (BOOL)providesGuidesWhileAligning
{
  return 0;
}

- (BOOL)exclusivelyProvidesGuidesWhileAligning
{
  return 0;
}

- (BOOL)resetGuidesAfterDragAfterReset
{
  return 0;
}

- (id)additionalRectsForSnappingWithOffset:(CGPoint)a3
{
  return &__NSArray0__struct;
}

- (void)i_dynamicDragDidEnd
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v2, "endDrag");

}

- (CGPoint)i_dragOffset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicGeometry"));
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalGeometry"));
  objc_msgSend(v10, "frame");
  v12 = sub_1000603B8(v6, v8, v11);
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGRect)i_originalLayerFrameInScaledCanvas
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mOriginalLayerFrameInScaledCanvas.origin.x;
  y = self->mOriginalLayerFrameInScaledCanvas.origin.y;
  width = self->mOriginalLayerFrameInScaledCanvas.size.width;
  height = self->mOriginalLayerFrameInScaledCanvas.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)p_dragDidChangeGeometry
{
  double v2;
  double v3;

  -[CRLCanvasRep i_dragOffset](self, "i_dragOffset");
  return !sub_10005FDF0(v2, v3, CGPointZero.x, CGPointZero.y);
}

- (BOOL)dragDidChangeGeometry
{
  return -[CRLCanvasRep p_dragDidChangeGeometry](self, "p_dragDidChangeGeometry");
}

- (BOOL)shouldAllowReplacementFromPaste
{
  return 0;
}

- (BOOL)shouldAllowReplacementFromDrop
{
  return 0;
}

- (BOOL)canPasteDataFromPhysicalKeyboard:(id)a3
{
  return 0;
}

- (id)commandForAcceptingPasteWithImageInfo:(id)a3 outSelectionBehavior:(id *)a4
{
  *a4 = 0;
  return 0;
}

- (void)dynamicDragDidEnd
{
  double v3;
  double v4;
  id WeakRetained;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  -[CRLCanvasRep i_dragOffset](self, "i_dragOffset");
  v4 = v3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);

  if (WeakRetained)
  {
    -[CRLCanvasRep recursivelyPerformSelector:](self, "recursivelyPerformSelector:", "i_dynamicDragDidEnd");
    v6 = objc_loadWeakRetained((id *)&self->mCanvas);
    objc_msgSend(v6, "canvasInvalidatedForRep:", self);

    if (-[CRLCanvasRep dragDidChangeGeometry](self, "dragDidChangeGeometry"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
      v8 = objc_msgSend(v7, "isInRealTimeDynamicOperation");

      if ((v8 & 1) == 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometry"));
        v11 = objc_msgSend(v10, "mutableCopy");

        objc_msgSend(v11, "position");
        objc_msgSend(v11, "setPosition:", sub_1000603D0(v12, v13, v4));
        objc_opt_class(_TtC8Freeform12CRLBoardItem, v14);
        v16 = sub_100221D0C(v15, v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "temporaryAdditionalBoardItemsToDisplay"));
          v20 = objc_msgSend(v19, "containsObject:", v17);

          if ((v20 & 1) == 0)
          {
            v21 = -[CRLCanvasRep newCommandToApplyGeometry:toInfo:](self, "newCommandToApplyGeometry:toInfo:", v11, v17);
            if (v21)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep commandController](self, "commandController"));
              objc_msgSend(v22, "enqueueCommand:", v21);

            }
            else
            {
              +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101247288);
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100E10730();
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_1012472A8);
              v23 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                sub_100DE7468(v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dynamicDragDidEnd]"));
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 3235, 0, "invalid nil value for '%{public}s'", "cmd");

            }
            v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
            objc_msgSend(v26, "enqueueCommandsForAdjustingPathSourcesAfterRoutingChanges");

          }
        }

      }
    }
    -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  }
}

- (BOOL)allowDragDelegate
{
  return 1;
}

- (BOOL)allowResizeDelegate
{
  return -[CRLCanvasRep allowDragDelegate](self, "allowDragDelegate");
}

- (BOOL)allowRotateDelegate
{
  return -[CRLCanvasRep allowResizeDelegate](self, "allowResizeDelegate");
}

- (BOOL)demandsExclusiveSelection
{
  return 0;
}

- (BOOL)allowDragAcrossPageBoundaries
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = objc_msgSend(v2, "isInGroup") ^ 1;

  return v3;
}

- (void)dynamicRotateDidBegin
{
  id WeakRetained;

  -[CRLCanvasRep recursivelyPerformSelector:](self, "recursivelyPerformSelector:", "p_dynamicRotateDidBegin");
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "canvasInvalidatedForRep:", self);

}

- (void)p_dynamicRotateDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (!-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012472C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E107C0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012472E8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep p_dynamicRotateDidBegin]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 3288, 0, "dynamic rotate began outside of dynamic operation");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v6, "beginRotate");

  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
}

- (BOOL)isBeingRotated
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = objc_msgSend(v2, "layoutState") == 3;

  return v3;
}

- (NSString)actionStringForRotate
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Rotate"), 0, CFSTR("UndoStrings")));

  return (NSString *)v3;
}

- (double)angleForRotation
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "geometry"));
  objc_msgSend(v3, "angle");
  v5 = v4;

  return v5;
}

- (CGPoint)unscaledGuidePosition
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v8;
  double v9;
  CGPoint result;
  CGRect v11;
  CGRect v12;

  -[CRLCanvasRep naturalBounds](self, "naturalBounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", MidX, CGRectGetMinY(v12));
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)shouldRasterizeRenderableDuringRotation
{
  return 1;
}

- (void)dynamicallyRotatingWithTracker:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v5, "takeRotationFromTracker:", v4);

}

- (void)p_dynamicRotateDidEnd
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v3, "endRotate");

  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
}

- (void)dynamicRotateDidEndWithTracker:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  _OWORD v25[3];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  -[CRLCanvasRep recursivelyPerformSelector:](self, "recursivelyPerformSelector:", "p_dynamicRotateDidEnd");
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "canvasInvalidatedForRep:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v8 = objc_msgSend(v7, "isInRealTimeDynamicOperation");

  if ((v8 & 1) == 0)
  {
    objc_opt_class(_TtC8Freeform12CRLBoardItem, v9);
    v11 = sub_100221D0C(v10, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v4)
      objc_msgSend(v4, "rotateTransform");
    else
      memset(v25, 0, sizeof(v25));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep resizedGeometryForTransform:](self, "resizedGeometryForTransform:", v25));
    if (v12)
    {
      v14 = -[CRLCanvasRep newCommandToApplyGeometry:toInfo:](self, "newCommandToApplyGeometry:toInfo:", v13, v12);
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep commandController](self, "commandController"));
        objc_msgSend(v15, "enqueueCommand:", v14);
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101247308);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E10900();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101247328);
        v23 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dynamicRotateDidEndWithTracker:]"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v24, 3348, 0, "invalid nil value for '%{public}s'", "cmd");

      }
    }
    else
    {
      v16 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247348);
      v17 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E10840(v17, (uint64_t)self, v16);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247368);
      v18 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v18);
      v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dynamicRotateDidEndWithTracker:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
      objc_opt_class(self, v19);
      v21 = NSStringFromClass(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 3354, 0, "We don't know how to rotate a %@", v22);

    }
  }

}

- (id)dynamicResizeDidBegin
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;

  if (!-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247388);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10990();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012473A8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dynamicResizeDidBegin]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 3367, 0, "resize begins without being in dynamic operation");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "canvasInvalidatedForRep:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v7, "beginResize");

  return (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
}

- (BOOL)isBeingResized
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = objc_msgSend(v2, "layoutState") == 4;

  return v3;
}

- (NSString)actionStringForResize
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Resize"), 0, CFSTR("UndoStrings")));

  return (NSString *)v3;
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  void *v4;
  CRLCanvasRep *v5;
  void *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rep"));
  if ((objc_msgSend(v4, "willHandleResizingLayoutForRep:", self) & 1) == 0)
  {

LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resizingLayoutForRep:", self));
    objc_msgSend(v6, "takeSizeFromTracker:", v8);

    goto LABEL_6;
  }
  v5 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rep"));

  if (v5 == self)
    goto LABEL_5;
LABEL_6:
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "canvasInvalidatedForRep:", self);

}

- (void)dynamicResizeDidEndWithTracker:(id)a3
{
  void *v4;
  id WeakRetained;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", a3));
  objc_msgSend(v4, "endResize");

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "canvasInvalidatedForRep:", self);

}

- (id)newCommandToApplyGeometry:(id)a3 toInfo:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  objc_opt_class(_TtC8Freeform12CRLBoardItem, v7);
  v9 = sub_100221D0C(v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v11 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v10, v5);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012473C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10A10();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012473E8);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep newCommandToApplyGeometry:toInfo:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 3409, 0, "Can't create CRLCommandSetInfoGeometry without a boardItem.");

    v11 = 0;
  }

  return v11;
}

- (BOOL)willHandleResizingLayoutForRep:(id)a3
{
  return 0;
}

- (void)dynamicFreeTransformDidBeginWithTracker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;

  v4 = a3;
  if (!-[CRLCanvasRep isInDynamicOperation](self, "isInDynamicOperation"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247408);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10A90();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247428);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dynamicFreeTransformDidBeginWithTracker:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 3426, 0, "free transform begins without being in dynamic operation");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "canvasInvalidatedForRep:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v9, "beginFreeTransformWithTracker:", v4);

}

- (BOOL)isBeingFreeTransformed
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v3 = objc_msgSend(v2, "layoutState") == 5;

  return v3;
}

- (BOOL)isBeingFreeTransformDragged
{
  void *v3;
  unint64_t v4;

  if (-[CRLCanvasRep isBeingFreeTransformed](self, "isBeingFreeTransformed"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v4 = (unint64_t)objc_msgSend(v3, "freeTransformState") & 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isBeingFreeTransformRotated
{
  void *v3;
  unint64_t v4;

  if (-[CRLCanvasRep isBeingFreeTransformed](self, "isBeingFreeTransformed"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v4 = ((unint64_t)objc_msgSend(v3, "freeTransformState") >> 1) & 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)isBeingFreeTransformResized
{
  void *v3;
  unint64_t v4;

  if (-[CRLCanvasRep isBeingFreeTransformed](self, "isBeingFreeTransformed"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v4 = ((unint64_t)objc_msgSend(v3, "freeTransformState") >> 2) & 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)inFreeTransformRotateResizeMode
{
  void *v3;
  unint64_t v4;

  if (-[CRLCanvasRep isBeingFreeTransformed](self, "isBeingFreeTransformed"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    v4 = ((unint64_t)objc_msgSend(v3, "freeTransformState") >> 3) & 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (NSString)actionStringForFreeTransform
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Free Transform"), 0, CFSTR("UndoStrings")));

  return (NSString *)v3;
}

- (void)dynamicallyFreeTransformingWithTracker:(id)a3
{
  void *v4;
  CRLCanvasRep *v5;
  void *v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v5 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedRepForLayout:", v4));

  if (v5
    && (v5 == self
     || !-[CRLCanvasRep willHandleFreeTransformingLayoutForRep:](v5, "willHandleFreeTransformingLayoutForRep:", self)))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
    objc_msgSend(v6, "takeFreeTransformFromTracker:", v8);

  }
  if (-[CRLCanvasRep isBeingFreeTransformResized](self, "isBeingFreeTransformResized")
    || -[CRLCanvasRep isBeingFreeTransformRotated](self, "isBeingFreeTransformRotated"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
    objc_msgSend(WeakRetained, "canvasInvalidatedForRep:", self);

  }
}

- (BOOL)willHandleFreeTransformingLayoutForRep:(id)a3
{
  return 0;
}

- (void)dynamicFreeTransformDidEndWithTracker:(id)a3
{
  void *v4;
  id WeakRetained;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", a3));
  objc_msgSend(v4, "endFreeTransform");

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "canvasInvalidatedForRep:", self);

}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 onKnob:(id)a4 inputType:(int64_t)a5
{
  return 0;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 onKnob:(id)a4 inputType:(int64_t)a5
{
  return 0;
}

- (BOOL)wantsEditMenuForTapAtPoint:(CGPoint)a3 onKnob:(id)a4
{
  return 0;
}

- (BOOL)wantsToManuallyHandleEditMenuTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)shouldIgnoreEditMenuTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  return 0;
}

- (BOOL)shouldIgnoreSingleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  return 0;
}

- (BOOL)handledLassoTapAtPoint:(CGPoint)a3 withInputType:(int64_t)a4
{
  return 0;
}

- (BOOL)handledDirectTouchForDrawingModePencilOnlyAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = -[CRLCanvasRep p_isNotSelectableDueToUnknownContent](self, "p_isNotSelectableDueToUnknownContent", a4, a3.x, a3.y);
  if (v5)
    -[CRLCanvasRep p_showAlertForGroupWithUnknownContent](self, "p_showAlertForGroupWithUnknownContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  if (objc_msgSend(v6, "editingDisabled"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep hyperlinkRegions](self, "hyperlinkRegions"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layerHost"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asiOSCVC"));
      LOBYTE(v5) = objc_msgSend(v10, "allowOpenLinkOnSingleTapForRepWhenEditingDisabled:", self);

    }
  }

  return v5;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return 0;
}

- (BOOL)handleMultipleTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)wantsToHandleTapsOnBehalfOfRepForSelecting
{
  return 0;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 0;
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 0;
}

- (BOOL)shouldLayoutTilingLayer:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = objc_msgSend(v5, "shouldLayoutTilingLayer:", v4);

  return v6;
}

- (CGRect)visibleBoundsForTilingLayer:(id)a3
{
  id v4;
  void *v5;
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
  double v17;
  CGRect result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v5, "visibleBoundsForTilingLayer:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)processChangedProperty:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  switch(a3)
  {
    case 6uLL:
      -[CRLCanvasRep invalidateKnobPositions](self, "invalidateKnobPositions");
      goto LABEL_4;
    case 7uLL:
      -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
LABEL_4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v4, "invalidateCollaboratorHUDControllers");

      goto LABEL_7;
    case 8uLL:
      -[CRLCanvasRep recursivelyPerformSelector:](self, "recursivelyPerformSelector:", "p_invalidateContentLayers");
      return;
    case 0xBuLL:
      -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
      -[CRLCanvasRep invalidateSelectionHighlightRenderable](self, "invalidateSelectionHighlightRenderable");
      if (-[CRLCanvasRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking"))
      {
        v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        objc_msgSend(v6, "updateMultiselectResizeInfoIfNeeded");

      }
      return;
    case 0xCuLL:
      -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
      return;
    default:
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6)
      {
LABEL_7:
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep ancestorRepForDrawingIntoLayer](self, "ancestorRepForDrawingIntoLayer"));

        if (v5)
          -[CRLCanvasRep setNeedsDisplay](self, "setNeedsDisplay");
      }
      return;
  }
}

- (BOOL)canEditWithEditor:(id)a3
{
  return 0;
}

- (void)willUpdateRenderable:(id)a3
{
  -[CRLCanvasRep p_willUpdateEffectRenderablesForRenderable:](self, "p_willUpdateEffectRenderablesForRenderable:", a3);
}

- (void)didUpdateRenderable:(id)a3
{
  -[CRLCanvasRep p_didUpdateEffectRenderablesForRenderable:](self, "p_didUpdateEffectRenderablesForRenderable:", a3);
}

- (BOOL)wantsChildRepLayerUpdatingCallsEvenWithNoChildren
{
  return 0;
}

- (NSArray)additionalRenderablesUnderRenderable
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (self->mShadowRenderable && -[CRLCanvasRep shouldShowShadow](self, "shouldShowShadow"))
    objc_msgSend(v3, "addObject:", self->mShadowRenderable);
  return (NSArray *)v3;
}

- (NSArray)additionalRenderablesToFadeDuringZoom
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->mKnobs;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "shouldDisplayDirectlyOverRep", (_QWORD)v12)
          && objc_msgSend(v9, "wantsToFadeDuringZoom"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "renderable"));
          objc_msgSend(v3, "addObject:", v10);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)directlyManagesAdditionalPlatformViewUnderRenderable
{
  return 0;
}

- (UIView)additionalPlatformViewUnderRenderable
{
  return 0;
}

- (BOOL)directlyManagesAdditionalPlatformViewOverRenderable
{
  return 0;
}

- (UIView)additionalPlatformViewOverRenderable
{
  return 0;
}

- (id)i_additionalRenderablesOverRenderableIncludingKnobs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep additionalRenderablesOverRenderable](self, "additionalRenderablesOverRenderable"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep p_addRenderablesForKnobsToArray:withDelegate:isOverlay:](self, "p_addRenderablesForKnobsToArray:withDelegate:isOverlay:", v3, v5, 0));

  return v6;
}

- (NSArray)additionalRenderablesOverRenderable
{
  return (NSArray *)&__NSArray0__struct;
}

- (BOOL)drawsDescendantsIntoLayer
{
  return 0;
}

- (BOOL)wantsRenderableToBeDescendedFromParentRepRenderable
{
  return 0;
}

- (NSSet)childrenToExcludeWhenDrawingDescendantsIntoLayer
{
  return +[NSSet set](NSSet, "set");
}

- (NSArray)allRenderables
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "renderableForRep:", self));
  objc_msgSend(v3, "crl_addNonNilObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep i_additionalRenderablesOverRenderableIncludingKnobs](self, "i_additionalRenderablesOverRenderableIncludingKnobs"));
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep additionalRenderablesUnderRenderable](self, "additionalRenderablesUnderRenderable"));
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep overlayRenderables](self, "overlayRenderables"));
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  return (NSArray *)v3;
}

- (NSArray)allPlatformViews
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep contentPlatformView](self, "contentPlatformView"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep contentPlatformView](self, "contentPlatformView"));
    -[NSMutableArray addObject:](v3, "addObject:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep additionalPlatformViewOverRenderable](self, "additionalPlatformViewOverRenderable"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep additionalPlatformViewOverRenderable](self, "additionalPlatformViewOverRenderable"));
    -[NSMutableArray addObject:](v3, "addObject:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep additionalPlatformViewUnderRenderable](self, "additionalPlatformViewUnderRenderable"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep additionalPlatformViewUnderRenderable](self, "additionalPlatformViewUnderRenderable"));
    -[NSMutableArray addObject:](v3, "addObject:", v9);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep childReps](self, "childReps", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v14), "allPlatformViews"));
        -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  v16 = -[NSMutableArray copy](v3, "copy");
  return (NSArray *)v16;
}

- (BOOL)masksToBounds
{
  return 0;
}

- (CGRect)rectToClipChildRepRenderables
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)opacity
{
  return 1.0;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)shouldShowDragHUD
{
  return 1;
}

- (BOOL)shouldShowSizesInRulers
{
  return 1;
}

- (BOOL)shouldSuppressFontSmoothing
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasController"));

  if (v3)
    v4 = objc_msgSend(v3, "shouldSuppressFontSmoothing");
  else
    v4 = 1;

  return v4;
}

- (int64_t)dragTypeAtCanvasPoint:(CGPoint)a3 forTouchType:(int64_t)a4
{
  void *v5;
  unsigned int v6;
  int v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep repForSelecting](self, "repForSelecting", a3.x, a3.y));
  v6 = objc_msgSend(v5, "isSelected");

  if (a4 == 3)
    v7 = 1;
  else
    v7 = v6;
  if (v7)
    return 3;
  else
    return 1;
}

- (BOOL)supportsAlternatePressureDrag
{
  return 0;
}

- (int64_t)dragHUDAndGuidesTypeAtCanvasPoint:(CGPoint)a3
{
  return 2;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (BOOL)isLocked
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v3 = sub_1000665A8(v2);

  return v3;
}

- (BOOL)handlesEditMenu
{
  return 0;
}

- (NSArray)itemsToAddToEditMenu
{
  return (NSArray *)&__NSArray0__struct;
}

- (CGRect)targetRectForEditMenu
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)wantsContextMenuAtPoint:(CGPoint)a3 withPlatformObject:(id)a4 onKnob:(id)a5
{
  return 1;
}

- (BOOL)handleContextMenuClickAtPoint:(CGPoint)a3 withPlatformObject:(id)a4 onKnob:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep repForSelecting](self, "repForSelecting", a4, a5, a3.x, a3.y));
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isSelectedIgnoringLocking") & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasEditor"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPathWithInfo:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "editorController"));
    objc_msgSend(v13, "setSelectionPath:", v11);

  }
  return v7 != 0;
}

- (id)resizedGeometryForTransform:(CGAffineTransform *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  __int128 v10;
  void *v11;
  _OWORD v13[3];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infoGeometryBeforeDynamicOperation"));
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometry"));

  }
  v10 = *(_OWORD *)&a3->c;
  v13[0] = *(_OWORD *)&a3->a;
  v13[1] = v10;
  v13[2] = *(_OWORD *)&a3->tx;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geometryByAppendingTransform:", v13));

  return v11;
}

- (unint64_t)adjustedKnobForComputingResizeGeometry:(unint64_t)a3
{
  return a3;
}

- (BOOL)canFlipDuringResize
{
  return 1;
}

- (BOOL)wantsGuidesWhileResizing
{
  return 1;
}

- (BOOL)wantsGuidesWhileDragging
{
  return 1;
}

- (BOOL)directlyManagesLayerContent
{
  return 0;
}

- (CGPoint)centerForRotation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  objc_msgSend(v2, "centerForRotation");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  return 0;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  return 0;
}

- (void)updateDragAndDropUIForPoint:(CGPoint)a3 dragInfo:(id)a4
{
  id v5;

  if (!self->mShowDragAndDropHighlight)
  {
    self->mShowDragAndDropHighlight = 1;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController", a4, a3.x, a3.y));
    objc_msgSend(v5, "invalidateOverlayLayersForRep:", self);

  }
}

- (void)hideDragAndDropUI
{
  CRLCanvasRenderable *mDragAndDropHighlightRenderable;
  id v4;

  if (self->mShowDragAndDropHighlight)
  {
    self->mShowDragAndDropHighlight = 0;
    mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
    self->mDragAndDropHighlightRenderable = 0;

    v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v4, "invalidateOverlayLayersForRep:", self);

  }
}

- (CGPath)newHighlightPathInScaledSpace
{
  id WeakRetained;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGAffineTransform v15;
  CGAffineTransform t2;
  CGAffineTransform v17;
  CGAffineTransform transform;
  CGRect v19;

  WeakRetained = objc_loadWeakRetained((id *)&self->mCanvas);
  objc_msgSend(WeakRetained, "viewScale");
  v5 = v4;

  -[CRLCanvasRep boundsForHighlightLayer](self, "boundsForHighlightLayer");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  memset(&transform, 0, sizeof(transform));
  -[CRLCanvasRep transformForHighlightLayer](self, "transformForHighlightLayer");
  CGAffineTransformMakeScale(&t2, v5, v5);
  v15 = transform;
  CGAffineTransformConcat(&v17, &v15, &t2);
  transform = v17;
  v19.origin.x = v7;
  v19.origin.y = v9;
  v19.size.width = v11;
  v19.size.height = v13;
  return CGPathCreateWithRect(v19, &transform);
}

- (CRLCanvasRenderable)dragAndDropHighlightRenderable
{
  CRLCanvasRenderable *mDragAndDropHighlightRenderable;
  CRLCanvasRenderable *v4;
  CRLCanvasRenderable *v5;

  mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  if (!mDragAndDropHighlightRenderable)
  {
    v4 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep p_highlightRenderable](self, "p_highlightRenderable"));
    v5 = self->mDragAndDropHighlightRenderable;
    self->mDragAndDropHighlightRenderable = v4;

    mDragAndDropHighlightRenderable = self->mDragAndDropHighlightRenderable;
  }
  return mDragAndDropHighlightRenderable;
}

- (id)p_highlightRenderable
{
  CGPath *v3;
  CRLDragAndDropCanvasHighlightDecorator *v4;
  void *v5;
  CRLDragAndDropCanvasHighlightDecorator *v6;
  void *v7;

  v3 = -[CRLCanvasRep newHighlightPathInScaledSpace](self, "newHighlightPathInScaledSpace");
  v4 = [CRLDragAndDropCanvasHighlightDecorator alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = -[CRLDragAndDropCanvasHighlightDecorator initWithInteractiveCanvasController:highlightPath:](v4, "initWithInteractiveCanvasController:highlightPath:", v5, v3);

  CFRelease(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropCanvasHighlightDecorator dragAndDropHighlightRenderable](v6, "dragAndDropHighlightRenderable"));

  return v7;
}

- (BOOL)shouldSelectInfoWhenTargetOfDrag:(id)a3
{
  return 1;
}

- (int64_t)tilingMode
{
  return 0;
}

- (BOOL)directlyManagesContentPlatformView
{
  return 0;
}

- (UIView)contentPlatformView
{
  return 0;
}

- (BOOL)wantsToDistortWithImagerContext
{
  return 0;
}

- (NSArray)hyperlinkRegions
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  CRLHyperlinkRegion *v22;
  void *v23;
  CRLHyperlinkRegion *v24;
  void *v25;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLBoardItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
    goto LABEL_6;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hyperlinkURL"));
  if (!v9)
    goto LABEL_6;
  v10 = (void *)v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hyperlinkURL"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "absoluteString"));
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    *(_QWORD *)&v15 = objc_opt_class(CRLCanvasLayout, v14).n128_u64[0];
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout", v15));
    v19 = sub_100221D0C(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "i_wrapPath"));
      v22 = [CRLHyperlinkRegion alloc];
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hyperlinkURL"));
      v24 = -[CRLHyperlinkRegion initWithURL:bezierPath:](v22, "initWithURL:bezierPath:", v23, v21);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v24));
    }
    else
    {
      v25 = &__NSArray0__struct;
    }

  }
  else
  {
LABEL_6:
    v25 = &__NSArray0__struct;
  }

  return (NSArray *)v25;
}

- (BOOL)crlaxShouldSetAccessibilityFrameWithFrameInUnscaledCanvasForMarqueeSelecting
{
  return 0;
}

- (BOOL)containsUnknownContent
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  v3 = objc_msgSend(v2, "isSupported") ^ 1;

  return v3;
}

- (id)contextMenuConfigurationAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)contextMenuPreviewForHighlightingMenuAtPoint:(CGPoint)a3 withConfiguration:(id)a4
{
  return 0;
}

- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3
{
  return 0;
}

- (CGPoint)p_centerForPreviewFrame:(CGRect)a3
{
  double height;
  double width;
  double v5;
  double v6;
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  v5 = sub_100061400(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (width < 50.0 && height < 50.0)
    v6 = v6 + (50.0 - height) * -0.5;
  result.y = v6;
  result.x = v5;
  return result;
}

- (id)dragItemsForBeginningDragAtPoint:(CGPoint)a3
{
  CFArrayRef (__cdecl **v4)(CTFontDescriptorRef, CFSetRef);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *j;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  CRLCanvasRep *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  CRLItemProviderItemWriter *v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];

  v4 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", a3.x, a3.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep repForSelecting](self, "repForSelecting"));
  *(_QWORD *)&v9 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v8).n128_u64[0];
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info", v9));
  v13 = sub_100221D0C(v11, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (objc_msgSend(v14, "allowedToBeDragAndDropped"))
  {
    if (objc_msgSend(v7, "isSelected")
      && (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditor")),
          v16 = objc_msgSend(v15, "canvasEditorCanCopyWithSender:", 0),
          v15,
          v16))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionModelTranslator"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selectionPath"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "boardItemsForSelectionPath:", v19));

      v21 = (void *)v20;
      v4 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    }
    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layerHost"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "asiOSCVC"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "delegate"));

      if ((objc_opt_respondsToSelector(v17, "currentDocumentMode") & 1) != 0
        && (v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentDocumentMode")),
            v25 = objc_msgSend(v24, "allowsDragOnUnselectedReps"),
            v24,
            v25)
        && (objc_msgSend(v14, "shouldBeIgnoredWhenCopying") & 1) == 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v14));
      }
      else
      {
        v21 = 0;
      }
    }

    if (objc_msgSend(v21, "count"))
    {
      v59 = v7;
      v55 = v5;
      v60 = objc_alloc_init(CRLItemProviderItemWriter);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topLevelZOrderedSiblingsOfInfos:", v21));
      v57 = v21;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "crl_arrayWithObjectsInSet:", v21));

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4[413], "array"));
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v29 = v27;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
      if (v30)
      {
        v32 = v30;
        v33 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(_QWORD *)v67 != v33)
              objc_enumerationMutation(v29);
            v35 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
            objc_opt_class(_TtC8Freeform12CRLBoardItem, v31);
            if ((objc_opt_isKindOfClass(v35, v36) & 1) != 0)
            {
              v37 = v35;
              if (objc_msgSend(v37, "allowedToBeDragAndDropped"))
                objc_msgSend(v28, "addObject:", v37);

            }
          }
          v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
        }
        while (v32);
      }
      v54 = self;
      v58 = v14;
      v56 = v29;

      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v40 = v28;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v63;
        do
        {
          for (j = 0; j != v42; j = (char *)j + 1)
          {
            if (*(_QWORD *)v63 != v43)
              objc_enumerationMutation(v40);
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)j)));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "unscaledPathToIncludeForSystemPreviewOutline"));
            if (v46)
              objc_msgSend(v38, "addObject:", v46);
            if (objc_msgSend(v40, "count") == (id)1)
            {
              v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "backgroundColorForDragPreview"));

              v39 = (void *)v47;
            }

          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
        }
        while (v42);
      }

      v61 = 0;
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLItemProviderItemWriter createItemProviderWithCopyOfBoardItems:fromInteractiveCanvasController:outCopiedBoardItems:](v60, "createItemProviderWithCopyOfBoardItems:fromInteractiveCanvasController:outCopiedBoardItems:", v40, v6, &v61));
      v49 = v61;
      if (v48)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep dragItemsForBeginningDragWithItemProvider:deepCopiedBoardItems:withUnscaledTracedPaths:previewBackgroundColor:localObjectProvider:](v54, "dragItemsForBeginningDragWithItemProvider:deepCopiedBoardItems:withUnscaledTracedPaths:previewBackgroundColor:localObjectProvider:", v48, v49, v38, v39, 0));
        v50 = v55;
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101247448);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E10B10();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101247468);
        v5 = v55;
        v51 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v51);
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dragItemsForBeginningDragAtPoint:]"));
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v52, 4269, 0, "invalid nil value for '%{public}s'", "itemProvider");

      }
      v21 = v57;

      v14 = v58;
      v7 = v59;
    }

  }
  return v5;
}

- (id)dragItemsForBeginningDragWithItemProvider:(id)a3 deepCopiedBoardItems:(id)a4 withUnscaledTracedPaths:(id)a5 previewBackgroundColor:(id)a6 localObjectProvider:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  id v23;
  dispatch_semaphore_t v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  dispatch_queue_global_t global_queue;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  CRLiOSCanvasDragItem *v36;
  id v37;
  NSObject *v38;
  id v39;
  id v40;
  id v41;
  CRLiOSCanvasDragItem *v42;
  void *v43;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  NSObject *v51;
  id v52;
  CRLCanvasRep *v53;
  id v54;
  id v55;
  _QWORD *v56;
  _QWORD block[4];
  id v58;
  id v59;
  id v60;
  id v61;
  NSObject *v62;
  _QWORD *v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  id v68;
  _QWORD v69[5];
  id v70;
  CRLiOSCanvasDragItem *v71;
  uint8_t buf[32];

  v48 = a3;
  v12 = a4;
  v47 = a5;
  v45 = a6;
  v46 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep p_newImagerToGenerateSystemPreviewOfBoardItems:](self, "p_newImagerToGenerateSystemPreviewOfBoardItems:", v12));
  objc_msgSend(v14, "unscaledClipRect");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = objc_msgSend(v14, "newImage");
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = sub_10023A998;
  v69[4] = sub_10023A9A8;
  v70 = 0;
  v24 = dispatch_semaphore_create(0);
  if (v23)
  {
    v25 = objc_alloc_init((Class)UIView);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layer"));
    objc_msgSend(v26, "setContents:", v23);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v27, "viewScale");
    objc_msgSend(v25, "setFrame:", sub_100060FD8(v16, v18, v20, v22, v28));

    global_queue = dispatch_get_global_queue(0, 0);
    v30 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100242144;
    block[3] = &unk_101247490;
    v58 = v47;
    v59 = v12;
    v63 = v69;
    v64 = v16;
    v65 = v18;
    v66 = v20;
    v67 = v22;
    v60 = v13;
    v68 = v23;
    v61 = v14;
    v62 = v24;
    dispatch_async(v30, block);

    v31 = v58;
  }
  else
  {
    v32 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012474B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10BA0((uint64_t)v12, v32);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012474D0);
    v33 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100E02830(v34, buf, v32, (os_log_t)v33);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasRep dragItemsForBeginningDragWithItemProvider:deepCopiedBoardItems:withUnscaledTracedPaths:previewBackgroundColor:localObjectProvider:]"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasRep.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v35, 4333, 0, "Unable to make a preview drag image for infos %@", v12, v45);

    v25 = 0;
  }

  v36 = [CRLiOSCanvasDragItem alloc];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_100242340;
  v49[3] = &unk_1012474F8;
  v37 = v25;
  v50 = v37;
  v38 = v24;
  v51 = v38;
  v56 = v69;
  v39 = v13;
  v52 = v39;
  v53 = self;
  v40 = v45;
  v54 = v40;
  v41 = v46;
  v55 = v41;
  v42 = -[CRLiOSCanvasDragItem initWithItemProvider:previewGeneratingBlock:](v36, "initWithItemProvider:previewGeneratingBlock:", v48, v49);
  v71 = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v71, 1));

  _Block_object_dispose(v69, 8);
  return v43;
}

- (id)p_newImagerToGenerateSystemPreviewOfBoardItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRLCanvasImager *v7;
  void *v8;
  void *v9;
  CRLCanvasImager *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v7 = [CRLCanvasImager alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "board"));
  v10 = -[CRLCanvasImager initWithBoard:](v7, "initWithBoard:", v9);

  -[CRLCanvasImager setInfos:](v10, "setInfos:", v4);
  objc_msgSend(v5, "viewScale");
  -[CRLCanvasImager setViewScale:](v10, "setViewScale:");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasImager canvas](v10, "canvas"));
  objc_msgSend(v11, "setSuppressesShadowsAndReflections:", 1);
  objc_msgSend(v11, "setShouldRenderInvisibleContentForNonInteractiveCanvas:", 1);
  objc_msgSend(v6, "viewScale");
  objc_msgSend(v11, "setI_viewScaleForAudioObjectsInNonInteractiveCanvas:");
  objc_msgSend(v6, "contentsScale");
  -[CRLCanvasImager setContentsScale:](v10, "setContentsScale:");
  v12 = sub_10040EB4C();
  v14 = v13;
  -[CRLCanvasImager actualScaledClipRect](v10, "actualScaledClipRect");
  v18 = v17;
  v20 = v19;
  v21 = v15;
  if (v16 > v14 || (v22 = v16, v14 = v16, v15 > v12))
  {
    if (v12 < v15)
      v21 = v12;
    v22 = v14;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasImager canvas](v10, "canvas"));
  objc_msgSend(v23, "viewScale");
  v25 = sub_100060FD8(v18, v20, v21, v22, 1.0 / v24);
  v27 = v26;
  v29 = v28;
  v31 = v30;

  -[CRLCanvasImager setUnscaledClipRect:](v10, "setUnscaledClipRect:", v25, v27, v29, v31);
  return v10;
}

- (BOOL)shouldOverrideParentForBeginningDragAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)dragItemsForBeginningDragOfChildRep:(id)a3
{
  return 0;
}

- (BOOL)allowDragOnPhoneAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)supportsAlternateLiftDelay:(double)a3
{
  return 0;
}

- (id)backgroundColorForDragPreview
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

- (BOOL)wantsBestGuessCanvasBackgroundColorForContextMenuPreview
{
  return 1;
}

- (id)backgroundColorForContextMenuPreview
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

- (id)unscaledPathToIncludeForSystemPreviewOutline
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _OWORD v10[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep layout](self, "layout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "i_wrapPath"));
  v5 = objc_msgSend(v4, "copy");

  if (!v5 || objc_msgSend(v5, "isEmpty"))
  {
    -[CRLCanvasRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
    v6 = objc_claimAutoreleasedReturnValue(+[CRLBezierPath bezierPathWithRect:](CRLBezierPath, "bezierPathWithRect:"));

    v5 = (id)v6;
  }
  if (v3)
    objc_msgSend(v3, "transformInRoot");
  else
    memset(v10, 0, sizeof(v10));
  objc_msgSend(v5, "transformUsingAffineTransform:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayOfSubpathsWithEffectivelyEmptySubpathsRemoved:", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath uniteBezierPaths:](CRLBezierPath, "uniteBezierPaths:", v7));

  return v8;
}

- (BOOL)shouldPreventMarqueeInitiationAtPoint:(CGPoint)a3 withTouchType:(int64_t)a4
{
  void *v5;
  unsigned __int8 v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep repForDragging](self, "repForDragging", a4, a3.x, a3.y));
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep repForSelecting](self, "repForSelecting"));
    v6 = objc_msgSend(v7, "demandsExclusiveSelection");

  }
  return v6;
}

- (BOOL)shouldBeginScribbleAtPoint:(CGPoint)a3
{
  return !-[CRLCanvasRep isLocked](self, "isLocked", a3.x, a3.y);
}

- (BOOL)handleSingleTapsWhileExtendingSelectionAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return 0;
}

- (BOOL)isCollaboratorCursorRenderableValid
{
  return self->mCollaboratorCursorRenderableValid;
}

- (CRLCanvas)canvas
{
  return (CRLCanvas *)objc_loadWeakRetained((id *)&self->mCanvas);
}

- (CRLCanvasRep)parentRep
{
  return (CRLCanvasRep *)objc_loadWeakRetained((id *)&self->mParentRep);
}

- (CRLCanvasKnobTracker)currentKnobTracker
{
  return (CRLCanvasKnobTracker *)objc_loadWeakRetained((id *)&self->mKnobTracker);
}

- (void)setCurrentKnobTracker:(id)a3
{
  objc_storeWeak((id *)&self->mKnobTracker, a3);
}

- (BOOL)showKnobsDuringManipulation
{
  return self->mShowKnobsWhenManipulated;
}

- (void)setShowKnobsDuringManipulation:(BOOL)a3
{
  self->mShowKnobsWhenManipulated = a3;
}

- (BOOL)knobsAreShowing
{
  return self->mKnobsAreShowing;
}

- (BOOL)isSelectionHighlightRenderableValid
{
  return self->mSelectionHighlightRenderableValid;
}

- (CRLCanvasRenderable)shadowRenderable
{
  return self->mShadowRenderable;
}

- (BOOL)shouldShowDragAndDropHighlight
{
  return self->mShowDragAndDropHighlight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mShadowRenderable, 0);
  objc_storeStrong((id *)&self->mProgressBarWhiteBackingRenderable, 0);
  objc_storeStrong((id *)&self->mProgressBarRenderable, 0);
  objc_storeStrong((id *)&self->mKnobs, 0);
  objc_storeStrong((id *)&self->mKnobsAccessQueue, 0);
  objc_storeStrong((id *)&self->mLastGeometryInRoot, 0);
  objc_storeStrong((id *)&self->mLayout, 0);
  objc_storeStrong((id *)&self->mDragAndDropHighlightRenderable, 0);
  objc_storeStrong((id *)&self->mCollaboratorCursorRenderable, 0);
  objc_storeStrong((id *)&self->mSelectionHighlightRenderable, 0);
  objc_destroyWeak((id *)&self->mKnobTracker);
  objc_storeStrong((id *)&self->mChildReps, 0);
  objc_destroyWeak((id *)&self->mParentRep);
  objc_destroyWeak((id *)&self->mCanvas);
}

- (id)getConnectionLineLayoutToCopyStyleForNewConnectionLine
{
  CRLCanvasRep *v2;
  id v3;

  v2 = self;
  v3 = sub_1006BCF58();

  return v3;
}

@end
