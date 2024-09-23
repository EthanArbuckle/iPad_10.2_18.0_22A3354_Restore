@implementation BKPageCurlManager

- (BKPageCurlManager)init
{
  Class v3;
  NSString *v4;
  void *v5;
  NSString *v6;
  void *v7;

  objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = NSStringFromSelector("initWithContext:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Please use the designated initializer -[%@ %@]"), v5, v7);

  return 0;
}

- (BKPageCurlManager)initWithContext:(id)a3
{
  id v4;
  BKPageCurlManager *v5;
  NSMutableArray *v6;
  NSMutableArray *queue;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKPageCurlManager;
  v5 = -[BKPageCurlManager init](&v9, "init");
  if (v5)
  {
    v6 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 10);
    queue = v5->_queue;
    v5->_queue = v6;

    v5->_spineLocation = 1;
    objc_storeWeak((id *)&v5->_configurationContext, v4);
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->_queue, "makeObjectsPerformSelector:withObject:", "setDelegate:", 0);
  -[BKPageCurlManager setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BKPageCurlManager;
  -[BKPageCurlManager dealloc](&v3, "dealloc");
}

- (BKPageCurlConfiguration)pageCurlConfiguration
{
  BKPageCurlConfiguration *pageCurlConfiguration;
  BKPageCurlConfiguration *v4;
  id WeakRetained;
  BKPageCurlConfiguration *v6;
  BKPageCurlConfiguration *v7;

  pageCurlConfiguration = self->_pageCurlConfiguration;
  if (!pageCurlConfiguration)
  {
    v4 = [BKPageCurlConfiguration alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_configurationContext);
    v6 = -[BKPageCurlConfiguration initWithContext:](v4, "initWithContext:", WeakRetained);
    v7 = self->_pageCurlConfiguration;
    self->_pageCurlConfiguration = v6;

    pageCurlConfiguration = self->_pageCurlConfiguration;
  }
  return pageCurlConfiguration;
}

- (void)setDelegate:(id)a3
{
  BKPageCurlManagerDelegate **p_delegate;
  id v5;
  char v6;
  id WeakRetained;
  char v8;
  id v9;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  char v18;
  id v19;

  p_delegate = &self->_delegate;
  v19 = a3;
  v5 = objc_storeWeak((id *)p_delegate, v19);
  v6 = objc_opt_respondsToSelector(v19, "pageCurlManager:delayForCurl:");

  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | v6 & 1;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector(WeakRetained, "pageCurlManager:durationForCurl:") & 1) != 0)
    v8 = 2;
  else
    v8 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v8;

  v9 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector(v9, "pageCurlManagerStabilizationFactor") & 1) != 0)
    v10 = 4;
  else
    v10 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v10;

  v11 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector(v11, "pageCurlManager:didBeginCurl:") & 1) != 0)
    v12 = 8;
  else
    v12 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xF7 | v12;

  v13 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector(v13, "pageCurlManagerRemovesViews:") & 1) != 0)
    v14 = 16;
  else
    v14 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xEF | v14;

  v15 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector(v15, "pageCurlManagerShouldKillLastOpposingCurl:") & 1) != 0)
    v16 = 32;
  else
    v16 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xDF | v16;

  v17 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_opt_respondsToSelector(v17, "pageCurlManager:willCancelCurl:") & 1) != 0)
    v18 = 64;
  else
    v18 = 0;
  *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xBF | v18;

}

- (id)enqueuePageCurlWithType:(int)a3
{
  uint64_t v3;
  BKPageCurl *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  char v10;
  void *v11;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc_init(BKPageCurl);
  -[BKPageCurl setType:](v5, "setType:", v3);
  -[BKPageCurl setDelegate:](v5, "setDelegate:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager pageColor](self, "pageColor"));
  -[BKPageCurl setPageColor:](v5, "setPageColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager backColor](self, "backColor"));
  -[BKPageCurl setBackColor:](v5, "setBackColor:", v7);

  -[BKPageCurl setSpineLocation:](v5, "setSpineLocation:", -[BKPageCurlManager spineLocation](self, "spineLocation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager pageCurlConfiguration](self, "pageCurlConfiguration"));
  -[BKPageCurl setConfiguration:](v5, "setConfiguration:", v8);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector(WeakRetained, "pageCurlManagerStabilizationFactor");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager delegate](self, "delegate"));
    objc_msgSend(v11, "pageCurlManagerStabilizationFactor");
    -[BKPageCurl setStabilization:](v5, "setStabilization:");

  }
  -[NSMutableArray addObject:](self->_queue, "addObject:", v5);
  return v5;
}

- (id)pageCurls
{
  return self->_queue;
}

- (int64_t)numberOfQueuedCurls
{
  return (int64_t)-[NSMutableArray count](self->_queue, "count");
}

- (void)_startQueuedCurls
{
  NSMutableArray *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  char *v11;
  void *v12;
  char delegateFlags;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = self->_queue;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "type", (_QWORD)v16))
        {
          if (objc_msgSend(v9, "type") != 1 || v6 > 3)
            goto LABEL_25;
        }
        else if (v6 > 3)
        {
          goto LABEL_25;
        }
        v11 = (char *)objc_msgSend(v9, "state");
        if (!v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager delegate](self, "delegate"));
          objc_msgSend(v12, "pageCurlManager:willBeginCurl:", self, v9);

          delegateFlags = (char)self->_delegateFlags;
          if ((delegateFlags & 1) != 0)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager delegate](self, "delegate"));
            objc_msgSend(v14, "pageCurlManager:delayForCurl:", self, v9);
            objc_msgSend(v9, "setDelay:");

            delegateFlags = (char)self->_delegateFlags;
          }
          if ((delegateFlags & 2) != 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager delegate](self, "delegate"));
            objc_msgSend(v15, "pageCurlManager:durationForCurl:", self, v9);
            objc_msgSend(v9, "setDuration:");

          }
          objc_msgSend(v9, "startAutoCurl");
LABEL_22:
          ++v6;
          continue;
        }
        if (v11 == (_BYTE *)&dword_0 + 1)
          goto LABEL_22;
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
LABEL_25:

}

- (BOOL)killACurl:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  unsigned int v6;
  NSMutableArray *queue;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  void *v12;

  v3 = a3;
  if ((*(_BYTE *)&self->_delegateFlags & 0x20) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_msgSend(WeakRetained, "pageCurlManagerShouldKillLastOpposingCurl:", self);

    if (!v6)
      return 0;
  }
  queue = self->_queue;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("type == %d"), v3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray filteredArrayUsingPredicate:](queue, "filteredArrayUsingPredicate:", v8));

  v10 = objc_msgSend(v9, "count");
  v11 = v10 != 0;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastObject"));
    objc_msgSend(v12, "killCurl");

  }
  return v11;
}

- (void)curlPages:(id)a3 backPages:(id)a4 inContainer:(id)a5 curlPage:(BOOL)a6
{
  if (a6)
    -[BKPageCurlManager curlPages:backPages:inContainer:](self, "curlPages:backPages:inContainer:", a3, a4, a5);
  else
    -[BKPageCurlManager unCurlPages:backPages:inContainer:](self, "unCurlPages:backPages:inContainer:", a3, a4, a5);
}

- (void)curlPages:(id)a3 backPages:(id)a4 inContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v14, "count");
  if (v9
    && v10
    && objc_msgSend(v8, "count")
    && (unint64_t)objc_msgSend(v8, "count") >= 2
    && !-[BKPageCurlManager killACurl:](self, "killACurl:", 1))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v11, "postEvent:sender:", kBETestDriverPageTurnSetupEnd, self);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v12, "postEvent:sender:", kBETestDriverPageTurnAnimationStart, self);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager enqueuePageCurlWithType:](self, "enqueuePageCurlWithType:", 0));
    objc_msgSend(v13, "setExistingPages:", v14);
    objc_msgSend(v13, "setBackPages:", v8);
    objc_msgSend(v13, "setContainer:", v9);
    if ((unint64_t)objc_msgSend(v14, "count") >= 2)
      objc_msgSend(v13, "setSpineLocation:", 2);
    -[BKPageCurlManager _startQueuedCurls](self, "_startQueuedCurls");

  }
}

- (void)unCurlPages:(id)a3 backPages:(id)a4 inContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v14, "count");
  if (v9
    && v10
    && objc_msgSend(v8, "count")
    && (unint64_t)objc_msgSend(v8, "count") >= 2
    && !-[BKPageCurlManager killACurl:](self, "killACurl:", 0))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v11, "postEvent:sender:", kBETestDriverPageTurnSetupEnd, self);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v12, "postEvent:sender:", kBETestDriverPageTurnAnimationStart, self);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager enqueuePageCurlWithType:](self, "enqueuePageCurlWithType:", 1));
    objc_msgSend(v13, "setExistingPages:", v14);
    objc_msgSend(v13, "setBackPages:", v8);
    objc_msgSend(v13, "setContainer:", v9);
    if ((unint64_t)objc_msgSend(v14, "count") >= 2)
      objc_msgSend(v13, "setSpineLocation:", 2);
    -[BKPageCurlManager _startQueuedCurls](self, "_startQueuedCurls");

  }
}

- (void)curlPages:(id)a3 backPage:(id)a4 inContainer:(id)a5 curlPage:(BOOL)a6
{
  if (a6)
    -[BKPageCurlManager curlPages:backPage:inContainer:](self, "curlPages:backPage:inContainer:", a3, a4, a5);
  else
    -[BKPageCurlManager uncurlPages:backPage:inContainer:](self, "uncurlPages:backPage:inContainer:", a3, a4, a5);
}

- (void)curlPages:(id)a3 backPage:(id)a4 inContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v14, "count");
  if (v9 && v10 && !-[BKPageCurlManager killACurl:](self, "killACurl:", 1))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v11, "postEvent:sender:", kBETestDriverPageTurnSetupEnd, self);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v12, "postEvent:sender:", kBETestDriverPageTurnAnimationStart, self);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager enqueuePageCurlWithType:](self, "enqueuePageCurlWithType:", 0));
    objc_msgSend(v13, "setExistingPages:", v14);
    objc_msgSend(v13, "setBackPage:", v8);
    objc_msgSend(v13, "setContainer:", v9);
    if ((unint64_t)objc_msgSend(v14, "count") >= 2)
      objc_msgSend(v13, "setSpineLocation:", 2);
    -[BKPageCurlManager _startQueuedCurls](self, "_startQueuedCurls");

  }
}

- (void)uncurlPages:(id)a3 backPage:(id)a4 inContainer:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v14, "count");
  if (v9 && v10 && !-[BKPageCurlManager killACurl:](self, "killACurl:", 0))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v11, "postEvent:sender:", kBETestDriverPageTurnSetupEnd, self);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
    objc_msgSend(v12, "postEvent:sender:", kBETestDriverPageTurnAnimationStart, self);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager enqueuePageCurlWithType:](self, "enqueuePageCurlWithType:", 1));
    objc_msgSend(v13, "setExistingPages:", v14);
    objc_msgSend(v13, "setBackPage:", v8);
    objc_msgSend(v13, "setContainer:", v9);
    if ((unint64_t)objc_msgSend(v14, "count") >= 2)
      objc_msgSend(v13, "setSpineLocation:", 2);
    -[BKPageCurlManager _startQueuedCurls](self, "_startQueuedCurls");

  }
}

- (id)beginManualCurl:(BOOL)a3 atLocation:(CGPoint)a4 inPage:(id)a5 fromPages:(id)a6 backPage:(id)a7 inContainer:(id)a8
{
  double y;
  double x;
  _BOOL4 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  y = a4.y;
  x = a4.x;
  v13 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v15)
  {
    v19 = objc_msgSend(v16, "count");
    v20 = 0;
    if (v18 && v19)
    {
      if (v13)
        v21 = 2;
      else
        v21 = 3;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager enqueuePageCurlWithType:](self, "enqueuePageCurlWithType:", v21));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v15));
      objc_msgSend(v20, "setCurlPages:", v22);

      objc_msgSend(v20, "setExistingPages:", v16);
      objc_msgSend(v20, "setBackPage:", v17);
      objc_msgSend(v20, "setContainer:", v18);
      if ((unint64_t)objc_msgSend(v16, "count") >= 2)
        objc_msgSend(v20, "setSpineLocation:", 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager delegate](self, "delegate"));
      objc_msgSend(v23, "pageCurlManager:willBeginCurl:", self, v20);

      objc_msgSend(v20, "beginManualCurlAtLocation:", x, y);
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)updateManualCurl:(id)a3 toLocation:(CGPoint)a4
{
  objc_msgSend(a3, "updateManualCurlToLocation:", a4.x, a4.y);
}

- (void)finishManualCurl:(id)a3
{
  objc_msgSend(a3, "finishManualCurl");
}

- (void)cancelManualCurl:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((*(_BYTE *)&self->_delegateFlags & 0x40) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager delegate](self, "delegate"));
    objc_msgSend(v4, "pageCurlManager:willCancelCurl:", self, v5);

  }
  objc_msgSend(v5, "cancelManualCurl");

}

- (void)pageCurl:(id)a3 finished:(BOOL)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = -[NSMutableArray copy](self->_queue, "copy", a3, a4);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = kBETestDriverPageTurnAnimationEnd;
    v10 = kBETestDriverPageTurnEnd;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
      if ((uint64_t)objc_msgSend(v12, "state") < 2)
        break;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
      objc_msgSend(v13, "postEvent:sender:", v9, self);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[AETestDriver shared](AETestDriver, "shared"));
      objc_msgSend(v14, "postEvent:sender:", v10, self);

      -[NSMutableArray removeObject:](self->_queue, "removeObject:", v12);
      objc_msgSend(v12, "setDelegate:", 0);
      v15 = objc_msgSend(v12, "state") == (char *)&dword_0 + 2 || objc_msgSend(v12, "state") == &dword_4;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager delegate](self, "delegate"));
      objc_msgSend(v16, "pageCurlManager:didFinishCurl:transitionCompleted:", self, v12, v15);

      if ((*(_BYTE *)&self->_delegateFlags & 0x10) != 0
        && (v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKPageCurlManager delegate](self, "delegate")),
            v18 = objc_msgSend(v17, "pageCurlManagerRemovesViews:", self),
            v17,
            !v18))
      {
        objc_msgSend(v12, "cleanup");
      }
      else
      {
        objc_msgSend(v12, "fullCleanup");
      }
      if (v7 == (id)++v11)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[BKPageCurlManager _startQueuedCurls](self, "_startQueuedCurls");
}

- (void)killAllCurls
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = -[NSMutableArray copy](self->_queue, "copy");
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
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "killCurl", (_QWORD)v10);
        objc_msgSend(v9, "setDelegate:", 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_queue, "removeAllObjects");
}

- (int64_t)spineLocation
{
  return self->_spineLocation;
}

- (void)setSpineLocation:(int64_t)a3
{
  self->_spineLocation = a3;
}

- (BKPageCurlManagerDelegate)delegate
{
  return (BKPageCurlManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIColor)pageColor
{
  return self->_pageColor;
}

- (void)setPageColor:(id)a3
{
  objc_storeStrong((id *)&self->_pageColor, a3);
}

- (UIColor)backColor
{
  return self->_backColor;
}

- (void)setBackColor:(id)a3
{
  objc_storeStrong((id *)&self->_backColor, a3);
}

- (void)setPageCurlConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_pageCurlConfiguration, a3);
}

- (IMFrameEnvironment)configurationContext
{
  return (IMFrameEnvironment *)objc_loadWeakRetained((id *)&self->_configurationContext);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_configurationContext);
  objc_storeStrong((id *)&self->_pageCurlConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backColor, 0);
  objc_storeStrong((id *)&self->_pageColor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
