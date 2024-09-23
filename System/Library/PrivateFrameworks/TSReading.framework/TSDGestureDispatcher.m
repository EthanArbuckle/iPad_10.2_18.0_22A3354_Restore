@implementation TSDGestureDispatcher

- (TSDGestureDispatcher)initWithInteractiveCanvasController:(id)a3
{
  TSDGestureDispatcher *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSDGestureDispatcher;
  v4 = -[TSDGestureDispatcher init](&v8, sel_init);
  if (v4)
  {
    if (!a3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGestureDispatcher initWithInteractiveCanvasController:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGestureDispatcher.m"), 243, CFSTR("invalid nil value for '%s'"), "icc");
    }
    -[TSDGestureDispatcher setInteractiveCanvasController:](v4, "setInteractiveCanvasController:", a3);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_simultaneitySets = 0;
  self->_gesturesInFlight = 0;

  self->_targetsInFlight = 0;
  self->_priorityMap = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDGestureDispatcher;
  -[TSDGestureDispatcher dealloc](&v3, sel_dealloc);
}

- (void)teardown
{
  -[NSMutableArray removeAllObjects](self->_targetsInFlight, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_gesturesInFlight, "removeAllObjects");
}

- (void)handleGesture:(id)a3
{
  uint64_t v5;
  void *v6;
  NSMutableArray *targetsInFlight;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;

  v5 = objc_msgSend(a3, "cachedGestureTarget");
  if (v5)
  {
    v6 = (void *)v5;
    targetsInFlight = self->_targetsInFlight;
    if (!targetsInFlight)
    {
      targetsInFlight = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
      self->_targetsInFlight = targetsInFlight;
    }
    if ((-[NSMutableArray containsObject:](targetsInFlight, "containsObject:", v6) & 1) == 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "gestureSequenceWillBegin");
      -[NSMutableArray insertObject:atIndex:](self->_targetsInFlight, "insertObject:atIndex:", v6, 0);
    }
    self->_gestureDidFire = 1;
    self->_runningTargetHandleGesture = 1;
    if ((objc_msgSend(v6, "handleGesture:", a3) & 1) == 0)
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGestureDispatcher handleGesture:]");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGestureDispatcher.m");
      v11 = objc_msgSend(a3, "gestureKind");
      v12 = (objc_class *)objc_opt_class();
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 296, CFSTR("canHandleGesture previously said YES, but it wasn't handled: %@ (target=<%@=%p>)"), v11, NSStringFromClass(v12), v6);
    }
    self->_runningTargetHandleGesture = 0;
    if (objc_msgSend(a3, "isDone"))
      objc_msgSend(a3, "setTargetRep:", 0);
  }
  else
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGestureDispatcher handleGesture:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGestureDispatcher.m"), 275, CFSTR("gestureTarget should not be nil, shouldReceiveTouch should have failed this gesture"));
  }
}

- (BOOL)handleGesture:(id)a3 withTarget:(id)a4
{
  void *v6;
  uint64_t v7;

  if (!self->_runningTargetHandleGesture)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDGestureDispatcher handleGesture:withTarget:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDGestureDispatcher.m"), 307, CFSTR("handleGesture:withTarget: can only be called from a target's handleGesture: method"));
  }
  objc_msgSend(a3, "setCachedGestureTarget:", a4);
  return objc_msgSend(a4, "handleGesture:", a3);
}

- (void)allowSimultaneousRecognitionByRecognizers:(id)a3
{
  char v5;
  void *i;
  uint64_t *v7;
  NSMutableArray *simultaneitySets;
  uint64_t *v9;
  uint64_t v10;

  v5 = TSUSupportsTextInteraction();
  if (a3 || (v5 & 1) == 0)
  {
    v9 = &v10;
    for (i = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", a3); ; objc_msgSend(i, "addObject:"))
    {
      v7 = v9++;
      if (!*v7)
        break;
    }
    simultaneitySets = self->_simultaneitySets;
    if (!simultaneitySets)
    {
      simultaneitySets = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      self->_simultaneitySets = simultaneitySets;
    }
    -[NSMutableArray addObject:](simultaneitySets, "addObject:", i);
  }
}

- (void)prioritizeRecognizer:(id)a3 overRecognizer:(id)a4
{
  TSUNoCopyDictionary *priorityMap;
  void *v8;
  uint64_t v9;

  priorityMap = self->_priorityMap;
  if (!priorityMap)
  {
    priorityMap = (TSUNoCopyDictionary *)objc_alloc_init(MEMORY[0x24BEB3CB8]);
    self->_priorityMap = priorityMap;
  }
  v8 = (void *)-[TSUNoCopyDictionary objectForKey:](priorityMap, "objectForKey:", a4);
  if (v8)
    v9 = objc_msgSend(v8, "setByAddingObject:", a3);
  else
    v9 = objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  -[TSUNoCopyDictionary setObject:forUncopiedKey:](self->_priorityMap, "setObject:forUncopiedKey:", v9, a4);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v5;
  void *v6;
  void *v8;
  TSUNoCopyDictionary *priorityMap;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (-[TSDInteractiveCanvasController currentlyScrolling](self->_interactiveCanvasController, "currentlyScrolling")
    || (v5 = -[TSDGestureDispatcher p_getGestureTarget:](self, "p_getGestureTarget:", a3)) == 0)
  {
    if ((__CFString *)objc_msgSend(a3, "gestureKind") != CFSTR("TSWPUndefinedGestureKind")
      || (-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "asiOSCVC"), (v8 = (void *)TSUProtocolCast()) == 0)|| !objc_msgSend(v8, "gestureRecognizerShouldBegin:", a3))
    {
LABEL_5:
      objc_msgSend(a3, "setCachedGestureTarget:", 0);
      return 0;
    }
    v6 = 0;
  }
  else
  {
    v6 = v5;
    objc_msgSend(a3, "setCachedGestureTarget:", v5);
  }
  priorityMap = self->_priorityMap;
  if (priorityMap)
  {
    v10 = (void *)-[TSUNoCopyDictionary objectForKey:](priorityMap, "objectForKey:", a3);
    if (v10)
    {
      v11 = v10;
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v18;
LABEL_13:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v15);
          if (objc_msgSend(v16, "state"))
          {
            if (objc_msgSend(v16, "state") != 5)
              goto LABEL_5;
          }
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
            if (v13)
              goto LABEL_13;
            break;
          }
        }
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "willBeginHandlingGesture:", a3);
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v7;
  TSDCanvasView *v8;
  NSMutableArray *gesturesInFlight;

  if ((objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "asiOSCVC"), "shouldIgnoreTextGestures") & 1) != 0)goto LABEL_2;
  if ((__CFString *)objc_msgSend(a3, "gestureKind") == CFSTR("TSWPUndefinedGestureKind"))
  {
    v7 = (void *)TSUProtocolCast();
    if (!v7)
      return (char)v7;
    LODWORD(v7) = objc_msgSend(v7, "gestureRecognizer:shouldReceiveTouch:", a3, a4);
    if (!(_DWORD)v7)
      return (char)v7;
  }
  else
  {
    v8 = (TSDCanvasView *)objc_msgSend(a4, "view");
    if (v8 != -[TSDInteractiveCanvasController canvasView](self->_interactiveCanvasController, "canvasView")
      && (objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "asiOSCVC"), "allowTouchOutsideCanvasView:forGesture:", a4, a3) & 1) == 0)
    {
LABEL_2:
      LOBYTE(v7) = 0;
      return (char)v7;
    }
  }
  gesturesInFlight = self->_gesturesInFlight;
  if (!gesturesInFlight)
  {
    gesturesInFlight = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_gesturesInFlight = gesturesInFlight;
  }
  if (-[NSMutableArray indexOfObjectIdenticalTo:](gesturesInFlight, "indexOfObjectIdenticalTo:", a3) == 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray addObject:](self->_gesturesInFlight, "addObject:", a3);
  if (-[NSMutableArray count](self->_gesturesInFlight, "count") == 1)
  {
    self->_gestureDidFire = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDTextGesturesWillBeginNotification"), 0);
  }
  LOBYTE(v7) = 1;
  return (char)v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  NSMutableArray *simultaneitySets;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  simultaneitySets = self->_simultaneitySets;
  if (simultaneitySets)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](simultaneitySets, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(simultaneitySets);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
          if (objc_msgSend(v11, "containsObject:", a3)
            && (objc_msgSend(v11, "containsObject:", a4) & 1) != 0)
          {
            LOBYTE(v7) = 1;
            return v7;
          }
          ++v10;
        }
        while (v8 != v10);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](simultaneitySets, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v8 = v7;
        if (v7)
          continue;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (id)p_getGestureTarget:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = -[TSDInteractiveCanvasController gestureTargetStack:](-[TSDGestureDispatcher interactiveCanvasController](self, "interactiveCanvasController"), "gestureTargetStack:", a3);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(v9, "canHandleGesture:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)gestureActionShouldBegin:(id)a3
{
  id v5;
  void *v7;

  v5 = -[TSDGestureDispatcher p_getGestureTarget:](self, "p_getGestureTarget:");
  if (v5)
  {
    objc_msgSend(a3, "setCachedGestureTarget:", v5);
    return 1;
  }
  else if ((__CFString *)objc_msgSend(a3, "gestureKind") == CFSTR("TSWPUndefinedGestureKind")
         && (-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self->_interactiveCanvasController, "layerHost"), "asiOSCVC"), v7 = (void *)TSUProtocolCast(), (objc_opt_respondsToSelector() & 1) != 0))
  {
    return objc_msgSend(v7, "gestureActionShouldBegin:", a3);
  }
  else
  {
    return 0;
  }
}

- (void)gestureRemovedFromView:(id)a3
{
  if (-[NSMutableArray indexOfObjectIdenticalTo:](self->_gesturesInFlight, "indexOfObjectIdenticalTo:") != 0x7FFFFFFFFFFFFFFFLL)
    -[TSDGestureDispatcher p_gestureNoLongerInFlight:](self, "p_gestureNoLongerInFlight:", a3);
}

- (void)p_gestureNoLongerInFlight:(id)a3
{
  NSMutableArray *targetsInFlight;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "setCachedGestureTarget:", 0);
  -[NSMutableArray removeObjectIdenticalTo:](self->_gesturesInFlight, "removeObjectIdenticalTo:", a3);
  if (!-[NSMutableArray count](self->_gesturesInFlight, "count"))
  {
    if (-[NSMutableArray count](self->_targetsInFlight, "count"))
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      targetsInFlight = self->_targetsInFlight;
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](targetsInFlight, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v13 != v8)
              objc_enumerationMutation(targetsInFlight);
            v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v10, "gestureSequenceDidEnd");
          }
          v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](targetsInFlight, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v7);
      }
      -[NSMutableArray removeAllObjects](self->_targetsInFlight, "removeAllObjects");
    }
    v11 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("TSDTextGesturesDidEndNotification"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_gestureDidFire));
  }
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (void)setInteractiveCanvasController:(id)a3
{
  self->_interactiveCanvasController = (TSDInteractiveCanvasController *)a3;
}

@end
