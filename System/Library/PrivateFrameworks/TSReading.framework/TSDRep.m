@implementation TSDRep

- (TSDRep)initWithLayout:(id)a3 canvas:(id)a4
{
  TSDRep *v6;
  TSDRep *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDRep;
  v6 = -[TSDRep init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      v6->mLayout = (TSDLayout *)a3;
      v7->mCanvas = (TSDCanvas *)a4;
      objc_msgSend(a4, "i_registerRep:", v7);
      v7->mShowKnobsWhenManipulated = 0;
    }
    else
    {

      v7 = 0;
    }
  }
  __dmb(0xBu);
  return v7;
}

- (void)dealloc
{
  NSObject *mTileProviderQueue;
  objc_super v4;

  -[TSDTilingBackgroundQueue shutdown](self->mTileQueue, "shutdown");

  mTileProviderQueue = self->mTileProviderQueue;
  if (mTileProviderQueue)
    dispatch_release(mTileProviderQueue);
  CGColorRelease(self->mDefaultSelectionHighlightColor);
  -[CALayer setDelegate:](self->mSelectionHighlightLayer, "setDelegate:", 0);

  self->mCanvas = 0;
  v4.receiver = self;
  v4.super_class = (Class)TSDRep;
  -[TSDRep dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  objc_class *v6;
  NSString *v7;
  id v8;
  objc_class *v9;
  NSString *v10;
  TSDLayout *v11;
  CGRect v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  -[TSDRep info](self, "info");
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = -[TSDRep info](self, "info");
  -[TSDRep layout](self, "layout");
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  v11 = -[TSDRep layout](self, "layout");
  -[TSDRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p info=<%@ %p> layout=<%@ %p> frameInUnscaledCanvas=%@>"), v5, self, v7, v8, v10, v11, NSStringFromCGRect(v13));
}

- (BOOL)i_hasInteractiveCanvasController
{
  return -[TSDCanvas canvasController](self->mCanvas, "canvasController") != 0;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  void *v3;
  uint64_t v4;

  if (!-[TSDCanvas canvasController](self->mCanvas, "canvasController"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRep interactiveCanvasController]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 181, CFSTR("no ICC for this rep; consider asking self.canvas instead"));
  }
  return -[TSDCanvas canvasController](self->mCanvas, "canvasController");
}

- (TSDLayout)layout
{
  TSDLayout *result;

  result = self->mTemporaryMixingLayout;
  if (!result)
    return self->mLayout;
  return result;
}

- (id)info
{
  return -[TSDLayout info](-[TSDRep layout](self, "layout"), "info");
}

- (BOOL)layerUpdatesPaused
{
  return self->mLayerUpdatesPausedCount != 0;
}

- (void)pauseLayerUpdates
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)objc_opt_class();
  if (objc_msgSend(v4, "tsu_overridesSelector:ofBaseClass:", a2, objc_opt_class()))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRep pauseLayerUpdates]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 206, CFSTR("-pushLayerUpdatesPaused won't work correctly if -layerUpdatesPaused is overridden"));
  }
  ++self->mLayerUpdatesPausedCount;
}

- (void)resumeLayerUpdates
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t mLayerUpdatesPausedCount;
  void *v8;
  uint64_t v9;

  v4 = (void *)objc_opt_class();
  if (objc_msgSend(v4, "tsu_overridesSelector:ofBaseClass:", a2, objc_opt_class()))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRep resumeLayerUpdates]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 212, CFSTR("-resumeLayerUpdates won't work correctly if -layerUpdatesPaused is overridden"));
  }
  mLayerUpdatesPausedCount = self->mLayerUpdatesPausedCount;
  if (mLayerUpdatesPausedCount
    || (v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRep resumeLayerUpdates]"),
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 213, CFSTR("unbalanced calls to push/resumeLayerUpdates")), (mLayerUpdatesPausedCount = self->mLayerUpdatesPausedCount) != 0))
  {
    self->mLayerUpdatesPausedCount = mLayerUpdatesPausedCount - 1;
    -[TSDInteractiveCanvasController invalidateLayers](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateLayers");
  }
}

- (void)resumeLayerUpdatesAndLayoutImmediately
{
  -[TSDRep resumeLayerUpdates](self, "resumeLayerUpdates");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
}

- (id)connectedReps
{
  NSSet *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = -[TSDLayout connectedLayouts](-[TSDRep layout](self, "layout"), "connectedLayouts");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = -[TSDInteractiveCanvasController repForLayout:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "repForLayout:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
        if (v9)
          objc_msgSend(v4, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return v4;
}

- (void)setParentRep:(id)a3
{
  TSDContainerRep *mParentRep;

  mParentRep = self->mParentRep;
  if (mParentRep != a3)
  {
    if (mParentRep)
      -[TSDRep willBeRemovedFromParent](self, "willBeRemovedFromParent");
    self->mParentRep = (TSDContainerRep *)a3;
    if (a3)
      -[TSDRep wasAddedToParent](self, "wasAddedToParent");
  }
}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3
{
  void *v5;
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

  v15 = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDRep performSelector:](self, "performSelector:", a3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_msgSend((id)TSUProtocolCast(), "childReps", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "recursivelyPerformSelectorIfImplemented:", a3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDRep performSelector:withObject:](self, "performSelector:withObject:", a3, a4);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)objc_msgSend((id)TSUProtocolCast(), "childReps", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "recursivelyPerformSelectorIfImplemented:withObject:", a3, a4);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
}

- (void)recursivelyPerformSelectorIfImplemented:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDRep performSelector:withObject:withObject:](self, "performSelector:withObject:withObject:", a3, a4, a5);
}

- (void)recursivelyPerformSelector:(SEL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[TSDRep performSelector:](self, "performSelector:");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_msgSend((id)TSUProtocolCast(), "childReps", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "recursivelyPerformSelector:", a3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)recursivelyPerformSelector:(SEL)a3 withObject:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[TSDRep performSelector:withObject:](self, "performSelector:withObject:");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_msgSend((id)TSUProtocolCast(), "childReps", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "recursivelyPerformSelector:withObject:", a3, a4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)i_willBeRemoved
{
  -[TSDRep willBeRemoved](self, "willBeRemoved");
  -[TSDRep i_shutdownTileQueue](self, "i_shutdownTileQueue");
  -[CALayer setDelegate:](self->mSelectionHighlightLayer, "setDelegate:", 0);

  self->mSelectionHighlightLayer = 0;
  -[TSDCanvas i_unregisterRep:](self->mCanvas, "i_unregisterRep:", self);
  -[TSDRep i_invalidateSelectionHighlightLayer](self, "i_invalidateSelectionHighlightLayer");
  objc_msgSend(MEMORY[0x24BDBCF18], "cancelPreviousPerformRequestsWithTarget:", self);
  self->mHasBeenRemoved = 1;
  self->mCanvas = 0;
}

- (BOOL)hasBeenRemoved
{
  return self->mHasBeenRemoved;
}

- (id)parentRepToPerformSelecting
{
  TSDRep *v2;
  TSDContainerRep *v3;
  TSDRep *p_super;

  v2 = self;
  while (1)
  {
    v3 = -[TSDRep parentRep](self, "parentRep");
    p_super = &v3->super;
    if (!v3 || -[TSDContainerRep canSelectChildRep:](v3, "canSelectChildRep:", v2))
      break;
    self = p_super;
  }
  return p_super;
}

- (void)addToSet:(id)a3
{
  objc_msgSend(a3, "addObject:", self);
}

- (double)angleInRoot
{
  double v3;
  double v4;
  double v5;

  if (-[TSDRep parentRep](self, "parentRep"))
  {
    -[TSDRep angleInRoot](-[TSDRep parentRep](self, "parentRep"), "angleInRoot");
    v4 = v3 + 0.0;
  }
  else
  {
    v4 = 0.0;
  }
  if (objc_msgSend(-[TSDRep info](self, "info"), "geometry"))
  {
    objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "geometry"), "angle");
    return v4 + v5;
  }
  return v4;
}

- (CGRect)naturalBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](-[TSDRep layout](self, "layout"), "geometry"), "size");
  v2 = TSDRectWithSize();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isVisibleOnCanvas
{
  TSDInteractiveCanvasController *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v17;
  CGRect v18;

  v3 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  if (v3)
  {
    -[TSDInteractiveCanvasController visibleUnscaledRect](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRect");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[TSDRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
    v18.origin.x = v12;
    v18.origin.y = v13;
    v18.size.width = v14;
    v18.size.height = v15;
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.width = v9;
    v17.size.height = v11;
    LOBYTE(v3) = CGRectIntersectsRect(v17, v18);
  }
  return (char)v3;
}

- (CGRect)convertNaturalRectToUnscaledCanvas:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TSDLayout *v7;
  CGAffineTransform v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[TSDRep layout](self, "layout");
  if (v7)
    -[TSDAbstractLayout transformInRoot](v7, "transformInRoot");
  else
    memset(&v8, 0, sizeof(v8));
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  return CGRectApplyAffineTransform(v9, &v8);
}

- (CGRect)convertNaturalRectFromUnscaledCanvas:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TSDLayout *v7;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[TSDRep layout](self, "layout");
  if (v7)
    -[TSDAbstractLayout transformInRoot](v7, "transformInRoot");
  else
    memset(&v8, 0, sizeof(v8));
  CGAffineTransformInvert(&v9, &v8);
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  return CGRectApplyAffineTransform(v10, &v9);
}

- (CGPath)newPathInScaledCanvasFromNaturalRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  TSDLayout *v9;
  double v10;
  double v11;
  double MinX;
  CGFloat MinY;
  double MaxX;
  CGFloat v15;
  double v16;
  CGFloat MaxY;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v9 = -[TSDRep layout](self, "layout");
  if (v9)
  {
    -[TSDAbstractLayout transformInRoot](v9, "transformInRoot");
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v29 = 0u;
  }
  -[TSDCanvas viewScale](self->mCanvas, "viewScale");
  v11 = v10;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MinX = CGRectGetMinX(v32);
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  MinY = CGRectGetMinY(v33);
  v27 = *((double *)&v31 + 1) + MinY * *((double *)&v30 + 1) + *((double *)&v29 + 1) * MinX;
  v28 = *(double *)&v31 + MinY * *(double *)&v30 + *(double *)&v29 * MinX;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  MaxX = CGRectGetMaxX(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  v15 = CGRectGetMinY(v35);
  v25 = *((double *)&v31 + 1) + v15 * *((double *)&v30 + 1) + *((double *)&v29 + 1) * MaxX;
  v26 = *(double *)&v31 + v15 * *(double *)&v30 + *(double *)&v29 * MaxX;
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  v16 = CGRectGetMaxX(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  MaxY = CGRectGetMaxY(v37);
  v18 = *(double *)&v31 + MaxY * *(double *)&v30 + *(double *)&v29 * v16;
  v19 = *((double *)&v31 + 1) + MaxY * *((double *)&v30 + 1) + *((double *)&v29 + 1) * v16;
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v20 = CGRectGetMinX(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  v21 = CGRectGetMaxY(v39);
  v22 = *(double *)&v31 + v21 * *(double *)&v30 + *(double *)&v29 * v20;
  v23 = *((double *)&v31 + 1) + v21 * *((double *)&v30 + 1) + *((double *)&v29 + 1) * v20;
  CGPathMoveToPoint(Mutable, 0, v11 * v28, v11 * v27);
  CGPathAddLineToPoint(Mutable, 0, v11 * v26, v11 * v25);
  CGPathAddLineToPoint(Mutable, 0, v11 * v18, v11 * v19);
  CGPathAddLineToPoint(Mutable, 0, v11 * v22, v11 * v23);
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (CGPoint)convertNaturalPointToUnscaledCanvas:(CGPoint)a3
{
  TSDLayout *v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  float64x2_t v7;
  double v8;
  double y;
  double x;
  float64x2_t v11;
  float64x2_t v12;
  float64x2_t v13;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v3 = -[TSDRep layout](self, "layout");
  if (v3)
  {
    -[TSDAbstractLayout transformInRoot](v3, "transformInRoot");
    v4 = v11;
    v5 = v12;
    v6 = v13;
  }
  else
  {
    v6 = 0uLL;
    v4 = 0uLL;
    v5 = 0uLL;
  }
  v7 = vaddq_f64(v6, vmlaq_n_f64(vmulq_n_f64(v5, y), v4, x));
  v8 = v7.f64[1];
  result.x = v7.f64[0];
  result.y = v8;
  return result;
}

- (CGPoint)convertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  TSDLayout *v3;
  float64x2_t v4;
  double v5;
  double y;
  double x;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v3 = -[TSDRep layout](self, "layout");
  if (v3)
    -[TSDAbstractLayout transformInRoot](v3, "transformInRoot");
  else
    memset(&v8, 0, sizeof(v8));
  CGAffineTransformInvert(&v9, &v8);
  v4 = vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, y), *(float64x2_t *)&v9.a, x));
  v5 = v4.f64[1];
  result.x = v4.f64[0];
  result.y = v5;
  return result;
}

- (CGRect)frameInUnscaledCanvas
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDAbstractLayout frameInRoot](-[TSDRep layout](self, "layout"), "frameInRoot");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)frameInScreenSpace
{
  TSDInteractiveCanvasController *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TSDCanvasView *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v3 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  -[TSDRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](v3, "convertUnscaledToBoundsRect:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = -[TSDInteractiveCanvasController canvasView](v3, "canvasView");
  -[TSDCanvasView convertRect:toView:](v12, "convertRect:toView:", 0, v5, v7, v9, v11);
  objc_msgSend((id)-[TSDCanvasView window](v12, "window"), "convertRect:toWindow:", 0, v13, v14, v15, v16);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)layerFrameInScaledCanvas
{
  double x;
  double y;
  double width;
  double height;
  TSDCanvas *mCanvas;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGRect result;

  if (-[TSDRep isBeingRotated](self, "isBeingRotated"))
  {
    x = self->mOriginalLayerFrameInScaledCanvas.origin.x;
    y = self->mOriginalLayerFrameInScaledCanvas.origin.y;
    width = self->mOriginalLayerFrameInScaledCanvas.size.width;
    height = self->mOriginalLayerFrameInScaledCanvas.size.height;
  }
  else if (-[TSDRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
  {
    mCanvas = self->mCanvas;
    -[TSDRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
    -[TSDCanvas convertUnscaledToBoundsRect:](mCanvas, "convertUnscaledToBoundsRect:");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
    x = TSDRoundedRectForScale(v9, v11, v13, v15, v16);
  }
  else
  {
    -[TSDRep i_layerFrameInScaledCanvasIgnoringDragging](self, "i_layerFrameInScaledCanvasIgnoringDragging");
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)i_layerFrameInScaledCanvasIgnoringDragging
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  TSDCanvas *mCanvas;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  if (-[TSDRep isBeingRotated](self, "isBeingRotated"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRep i_layerFrameInScaledCanvasIgnoringDragging]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 546, CFSTR("i_layerFrameInScaledCanvasIgnoringDragging is invalid in this state"));
  }
  v5 = -[TSDRep directlyManagesLayerContent](self, "directlyManagesLayerContent");
  mCanvas = self->mCanvas;
  -[TSDRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  -[TSDCanvas convertUnscaledToBoundsRect:](mCanvas, "convertUnscaledToBoundsRect:");
  v11 = v7;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  if (v5)
  {
    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
    v16 = TSDRoundedRectForScale(v11, v12, v13, v14, v15);
  }
  else
  {
    *(CGRect *)&v16 = CGRectIntegral(*(CGRect *)&v7);
  }
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[TSDRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[TSDRep parentRep](self, "parentRep"))
  {
    -[TSDRep layerFrameInScaledCanvas](-[TSDRep parentRep](self, "parentRep"), "layerFrameInScaledCanvas");
    v4 = TSDSubtractPoints(v4, v6, v11);
    v6 = v12;
  }
  v13 = v4;
  v14 = v6;
  v15 = v8;
  v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGPoint)layerOffsetForDragging
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[TSDRep i_layerFrameInScaledCanvasIgnoringDragging](self, "i_layerFrameInScaledCanvasIgnoringDragging");
  v4 = v3;
  v6 = v5;
  -[TSDRep i_originalLayerFrameInScaledCanvas](self, "i_originalLayerFrameInScaledCanvas");
  v8 = TSDSubtractPoints(v4, v6, v7);
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGAffineTransform)transformToConvertNaturalToLayerRelative
{
  TSDLayout *v5;
  CGFloat v6;
  double v7;
  double v8;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v14;
  CGAffineTransform v15;

  memset(&v15, 0, sizeof(v15));
  v5 = -[TSDRep layout](self, "layout");
  if (v5)
    -[TSDAbstractLayout transformInRoot](v5, "transformInRoot");
  else
    memset(&v15, 0, sizeof(v15));
  -[TSDCanvas viewScale](self->mCanvas, "viewScale");
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeScale(&t2, v6, v6);
  t1 = v15;
  CGAffineTransformConcat(&v14, &t1, &t2);
  -[TSDRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas");
  memset(&t1, 0, sizeof(t1));
  CGAffineTransformMakeTranslation(&t1, -v7, -v8);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v11 = v14;
  v10 = t1;
  return CGAffineTransformConcat(retstr, &v11, &v10);
}

- (CGAffineTransform)transformToConvertNaturalFromLayerRelative
{
  CGAffineTransform v5;

  if (self)
    -[TSDRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
  else
    memset(&v5, 0, sizeof(v5));
  return CGAffineTransformInvert(retstr, &v5);
}

- (CGPoint)convertNaturalPointToLayerRelative:(CGPoint)a3
{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  double v7;
  CGFloat y;
  CGFloat x;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  CGPoint result;

  if (self)
  {
    y = a3.y;
    x = a3.x;
    -[TSDRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
    a3.y = y;
    a3.x = x;
    v4 = v10;
    v3 = v11;
    v5 = v12;
  }
  else
  {
    v5 = 0uLL;
    v4 = 0uLL;
    v3 = 0uLL;
  }
  v6 = vaddq_f64(v5, vmlaq_n_f64(vmulq_n_f64(v3, a3.y), v4, a3.x));
  v7 = v6.f64[1];
  result.x = v6.f64[0];
  result.y = v7;
  return result;
}

- (CGPoint)convertNaturalPointFromLayerRelative:(CGPoint)a3
{
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  double v7;
  CGFloat y;
  CGFloat x;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  CGPoint result;

  if (self)
  {
    y = a3.y;
    x = a3.x;
    -[TSDRep transformToConvertNaturalFromLayerRelative](self, "transformToConvertNaturalFromLayerRelative");
    a3.y = y;
    a3.x = x;
    v4 = v10;
    v3 = v11;
    v5 = v12;
  }
  else
  {
    v5 = 0uLL;
    v4 = 0uLL;
    v3 = 0uLL;
  }
  v6 = vaddq_f64(v5, vmlaq_n_f64(vmulq_n_f64(v3, a3.y), v4, a3.x));
  v7 = v6.f64[1];
  result.x = v6.f64[0];
  result.y = v7;
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
  if (self)
    -[TSDRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
  else
    memset(&v7, 0, sizeof(v7));
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
  if (self)
    -[TSDRep transformToConvertNaturalFromLayerRelative](self, "transformToConvertNaturalFromLayerRelative");
  else
    memset(&v7, 0, sizeof(v7));
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (CGPoint)convertUnscaledPointToLayerRelative:(CGPoint)a3
{
  double v4;
  double v5;
  CGPoint result;

  -[TSDRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", a3.x, a3.y);
  -[TSDRep convertNaturalPointToLayerRelative:](self, "convertNaturalPointToLayerRelative:");
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertUnscaledPointFromLayerRelative:(CGPoint)a3
{
  double v4;
  double v5;
  CGPoint result;

  -[TSDRep convertNaturalPointFromLayerRelative:](self, "convertNaturalPointFromLayerRelative:", a3.x, a3.y);
  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  result.y = v5;
  result.x = v4;
  return result;
}

- (double)scaleToConvertNaturalToLayerRelative
{
  _OWORD v3[3];

  if (self)
    -[TSDRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
  else
    memset(v3, 0, sizeof(v3));
  return TSDTransformScale((double *)v3);
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  -[TSDInteractiveCanvasController scrollRectToVisible:animated:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "scrollRectToVisible:animated:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGPoint v6;
  CGRect v7;

  y = a3.y;
  x = a3.x;
  -[TSDRep naturalBounds](self, "naturalBounds");
  v6.x = x;
  v6.y = y;
  return CGRectContainsPoint(v7, v6);
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

  v5 = TSDRectWithCenterAndSize(a3.x, a3.y, a4.width + a4.width);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[TSDRep naturalBounds](self, "naturalBounds");
  v14.origin.x = v5;
  v14.origin.y = v7;
  v14.size.width = v9;
  v14.size.height = v11;
  return CGRectIntersectsRect(v13, v14);
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  id v6;
  void *v7;

  v6 = -[TSDRep hitRep:](self, "hitRep:", a4, a3.x, a3.y);
  v7 = v6;
  if (a5 && v6 && !(*((unsigned int (**)(id, id))a5 + 2))(a5, v6))
    return 0;
  return v7;
}

- (id)hitRep:(CGPoint)a3
{
  if (-[TSDRep containsPoint:](self, "containsPoint:", a3.x, a3.y))
    return self;
  else
    return 0;
}

- (id)hitReps:(CGPoint)a3 withSlop:(CGSize)a4
{
  _QWORD v5[4];
  CGSize v6;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__TSDRep_hitReps_withSlop___block_invoke;
  v5[3] = &__block_descriptor_48_e26__CGSize_dd_16__0__TSDRep_8l;
  v6 = a4;
  return -[TSDRep hitReps:withSlopBlock:](self, "hitReps:withSlopBlock:", v5, a3.x, a3.y);
}

double __27__TSDRep_hitReps_withSlop___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (id)hitReps:(CGPoint)a3 withSlopBlock:(id)a4
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;

  y = a3.y;
  x = a3.x;
  if (a4)
  {
    v7 = (*((double (**)(id, TSDRep *))a4 + 2))(a4, self);
    v9 = v8;
  }
  else
  {
    v7 = *MEMORY[0x24BDBF148];
    v9 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  if (-[TSDRep containsPoint:withSlop:](self, "containsPoint:withSlop:", x, y, v7, v9))
    return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", self);
  else
    return 0;
}

- (id)hitRepChrome:(CGPoint)a3 passingTest:(id)a4
{
  id v5;
  void *v6;

  v5 = -[TSDRep hitRepChrome:](self, "hitRepChrome:", a3.x, a3.y);
  v6 = v5;
  if (a4 && v5 && !(*((unsigned int (**)(id, id))a4 + 2))(a4, v5))
    return 0;
  return v6;
}

- (id)hitRepChrome:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;

  y = a3.y;
  x = a3.x;
  if (!-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
    return 0;
  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
  return -[TSDInteractiveCanvasController hitRepChromeAtUnscaledPoint:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "hitRepChromeAtUnscaledPoint:", v6, v7);
}

- (BOOL)shouldExpandHitRegionWhenSmall
{
  return 1;
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
  TSDBezierPath *v8;
  TSDLayout *v9;
  _OWORD v11[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](-[TSDRep layout](self, "layout"), "geometry"), "size");
  v8 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", TSDRectWithSize());
  v9 = -[TSDRep layout](self, "layout");
  if (v9)
    -[TSDAbstractLayout transformInRoot](v9, "transformInRoot");
  else
    memset(v11, 0, sizeof(v11));
  -[TSDBezierPath transformUsingAffineTransform:](v8, "transformUsingAffineTransform:", v11);
  return -[TSDBezierPath intersectsRect:hasFill:](v8, "intersectsRect:hasFill:", 1, x, y, width, height);
}

- (id)repForDragging
{
  if (-[TSDRep isDraggable](self, "isDraggable")
    && -[TSDLayout isInTopLevelContainerForEditing](-[TSDRep layout](self, "layout"), "isInTopLevelContainerForEditing")
    && -[TSDCanvasEditor isRepSelectable:](-[TSDInteractiveCanvasController canvasEditor](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasEditor"), "isRepSelectable:", self)&& !-[TSDRep isLocked](self, "isLocked")&& !-[TSDInteractiveCanvasController inVersionBrowsingMode](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "inVersionBrowsingMode"))
  {
    return self;
  }
  else
  {
    return -[TSDRep repForDragging](-[TSDRep parentRep](self, "parentRep"), "repForDragging");
  }
}

- (id)additionalRepsForDragging
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (id)repForSelecting
{
  if (-[TSDRep isSelectable](self, "isSelectable")
    && -[TSDLayout isInTopLevelContainerForEditing](-[TSDRep layout](self, "layout"), "isInTopLevelContainerForEditing")
    && -[TSDCanvasEditor isRepSelectable:](-[TSDInteractiveCanvasController canvasEditor](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasEditor"), "isRepSelectable:", self))
  {
    return self;
  }
  else
  {
    return -[TSDRep repForSelecting](-[TSDRep parentRep](self, "parentRep"), "repForSelecting");
  }
}

- (id)repForRotating
{
  if (-[TSDAbstractLayout supportsRotation](-[TSDRep layout](self, "layout"), "supportsRotation")
    && -[TSDLayout isInTopLevelContainerForEditing](-[TSDRep layout](self, "layout"), "isInTopLevelContainerForEditing")
    && -[TSDCanvasEditor isRepSelectable:](-[TSDInteractiveCanvasController canvasEditor](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasEditor"), "isRepSelectable:", self)&& !-[TSDRep isLocked](self, "isLocked"))
  {
    return self;
  }
  else
  {
    return -[TSDRep repForRotating](-[TSDRep parentRep](self, "parentRep"), "repForRotating");
  }
}

- (void)updateFromLayout
{
  id v3;

  v3 = -[TSDAbstractLayout geometryInRoot](-[TSDRep layout](self, "layout"), "geometryInRoot");
  if ((objc_msgSend(v3, "isEqual:", self->mLastGeometryInRoot) & 1) == 0)
  {
    -[TSDRep layoutInRootChangedFrom:to:translatedOnly:](self, "layoutInRootChangedFrom:to:translatedOnly:", self->mLastGeometryInRoot, v3, objc_msgSend(v3, "differsInMoreThanTranslationFrom:", self->mLastGeometryInRoot) ^ 1);

    self->mLastGeometryInRoot = (TSDLayoutGeometry *)objc_msgSend(v3, "copy");
  }
  -[TSDLayout i_takeDirtyRect](-[TSDRep layout](self, "layout"), "i_takeDirtyRect");
  -[TSDRep setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
  -[TSDRep i_invalidateSelectionHighlightLayer](self, "i_invalidateSelectionHighlightLayer");
}

- (void)layoutInRootChangedFrom:(id)a3 to:(id)a4 translatedOnly:(BOOL)a5
{
  __int128 v5;
  TSDCanvas *mCanvas;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  double v12;
  double v13;
  TSDCanvas *v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float64x2_t v28;
  double v29;
  float64x2_t v30;
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  float64x2_t v34;
  float64x2_t v35;

  if (a5)
  {
    mCanvas = self->mCanvas;
    if (a3)
    {
      objc_msgSend(a3, "transform");
      v9 = v33;
      v10 = v34;
      v11 = v35;
    }
    else
    {
      v11 = 0uLL;
      v9 = 0uLL;
      v10 = 0uLL;
    }
    *(_QWORD *)&v5 = *(_QWORD *)(MEMORY[0x24BDBEFB0] + 8);
    -[TSDCanvas convertUnscaledToBoundsPoint:](mCanvas, "convertUnscaledToBoundsPoint:", vaddq_f64(v11, vmlaq_n_f64(vmulq_n_f64(v10, *(double *)&v5), v9, *MEMORY[0x24BDBEFB0])), vdupq_lane_s64(*MEMORY[0x24BDBEFB0], 0), v5);
    v13 = v12;
    v14 = self->mCanvas;
    if (a4)
    {
      objc_msgSend(a4, "transform");
      v15 = v30;
      v16 = v31;
      v17 = v32;
    }
    else
    {
      v17 = 0uLL;
      v15 = 0uLL;
      v16 = 0uLL;
    }
    -[TSDCanvas convertUnscaledToBoundsPoint:](v14, "convertUnscaledToBoundsPoint:", vaddq_f64(v17, vmlaq_f64(vmulq_n_f64(v16, v29), v28, v15)));
    v20 = TSDSubtractPoints(v18, v19, v13);
    v22 = v21;
    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
    TSDMultiplyPointScalar(v20, v22, v23);
    TSUFractionalPart();
    v25 = fabs(v24);
    TSUFractionalPart();
    if (v25 >= 0.00999999978 && fabs(v25 + -1.0) >= 0.00999999978
      || (v27 = fabs(v26), v27 >= 0.00999999978) && fabs(v27 + -1.0) >= 0.00999999978)
    {
      -[TSDRep setNeedsDisplay](self, "setNeedsDisplay");
    }
  }
  else
  {
    -[TSDRep setNeedsDisplay](self, "setNeedsDisplay", a3, a4);
    -[TSDRep invalidateKnobPositions](self, "invalidateKnobPositions");
  }
}

- (CGAffineTransform)layerTransform
{
  uint64_t v5;
  __int128 v6;
  CGAffineTransform *result;
  TSDLayout *v8;
  TSDLayout *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  __int128 v18;
  CGAffineTransform v19;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;

  v5 = MEMORY[0x24BDBD8B8];
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  result = (CGAffineTransform *)-[TSDRep isBeingRotated](self, "isBeingRotated");
  if ((_DWORD)result)
  {
    result = (CGAffineTransform *)-[TSDRep isBeingRotated](-[TSDRep parentRep](self, "parentRep"), "isBeingRotated");
    if ((result & 1) == 0)
    {
      memset(&v24, 0, sizeof(v24));
      v8 = -[TSDRep layout](self, "layout");
      if (v8)
        -[TSDLayout originalPureTransformInRoot](v8, "originalPureTransformInRoot");
      else
        memset(&v24, 0, sizeof(v24));
      memset(&v23, 0, sizeof(v23));
      v9 = -[TSDRep layout](self, "layout");
      if (v9)
        -[TSDLayout pureTransformInRoot](v9, "pureTransformInRoot");
      else
        memset(&v23, 0, sizeof(v23));
      memset(&v22, 0, sizeof(v22));
      t2 = v24;
      CGAffineTransformInvert(&t1, &t2);
      t2 = v23;
      CGAffineTransformConcat(&v22, &t1, &t2);
      -[TSDRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas");
      -[TSDCanvas convertBoundsToUnscaledRect:](self->mCanvas, "convertBoundsToUnscaledRect:");
      v14 = TSDCenterOfRect(v10, v11, v12, v13);
      v19 = v22;
      TSDTransformConvertForNewOrigin(&v19, &t2, v14, v15);
      v22 = t2;
      -[TSDCanvas viewScale](self->mCanvas, "viewScale");
      v22.tx = v16 * v22.tx;
      result = (CGAffineTransform *)-[TSDCanvas viewScale](self->mCanvas, "viewScale");
      v22.ty = v17 * v22.ty;
      v18 = *(_OWORD *)&v22.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v22.a;
      *(_OWORD *)&retstr->c = v18;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&v22.tx;
    }
  }
  return result;
}

- (CGAffineTransform)parentLayerInverseTransformInRootForZeroAnchor
{
  uint64_t v5;
  __int128 v6;
  CGAffineTransform *result;
  TSDContainerRep *v8;
  __int128 v9;
  __int128 v10;
  CGAffineTransform v11;

  v5 = MEMORY[0x24BDBD8B8];
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  result = -[TSDRep parentRep](self, "parentRep");
  if (result)
  {
    v8 = -[TSDRep parentRep](self, "parentRep");
    if (v8)
      -[TSDRep layerTransformInRootForZeroAnchor](v8, "layerTransformInRootForZeroAnchor");
    else
      memset(&v11, 0, sizeof(v11));
    v9 = *(_OWORD *)&v11.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v11.tx;
    v10 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v11.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v11.c = v10;
    *(_OWORD *)&v11.tx = *(_OWORD *)&retstr->tx;
    return CGAffineTransformInvert(retstr, &v11);
  }
  return result;
}

- (CGAffineTransform)layerTransformInRootForZeroAnchor
{
  uint64_t v4;
  __int128 v5;
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
  CGAffineTransform v18;
  CGAffineTransform t1;
  CGAffineTransform v20;
  CGAffineTransform v21;

  v4 = MEMORY[0x24BDBD8B8];
  v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  if (self)
  {
    v6 = self;
    do
    {
      -[CGAffineTransform layerFrameInScaledCanvasRelativeToParent](v6, "layerFrameInScaledCanvasRelativeToParent");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      memset(&v21, 0, sizeof(v21));
      -[CGAffineTransform layerTransform](v6, "layerTransform");
      t1 = v21;
      TSDTransformConvertForNewOrigin(&t1, &v20, v12 * -0.5, v14 * -0.5);
      v21 = v20;
      CGAffineTransformMakeTranslation(&v18, v8, v10);
      t1 = v21;
      CGAffineTransformConcat(&v20, &t1, &v18);
      v15 = *(_OWORD *)&v20.c;
      v21 = v20;
      v16 = *(_OWORD *)&v20.a;
      v17 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v20.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v20.c = v17;
      *(_OWORD *)&v20.tx = *(_OWORD *)&retstr->tx;
      *(_OWORD *)&t1.a = v16;
      *(_OWORD *)&t1.c = v15;
      *(_OWORD *)&t1.tx = *(_OWORD *)&v21.tx;
      CGAffineTransformConcat(retstr, &v20, &t1);
      self = (CGAffineTransform *)-[CGAffineTransform parentRep](v6, "parentRep");
      v6 = self;
    }
    while (self);
  }
  return self;
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
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

  -[TSDRep layerFrameInScaledCanvasRelativeToParent](self, "layerFrameInScaledCanvasRelativeToParent");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  if (self)
    -[TSDRep layerTransform](self, "layerTransform");
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  objc_msgSend(a3, "setIfDifferentFrame:orTransform:", v13, v6, v8, v10, v12);
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat MinY;
  CGFloat MinX;
  CGFloat v26;
  __int128 v27;
  __int128 v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v38.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v38.c = v10;
  *(_OWORD *)&v38.tx = *(_OWORD *)&a3->tx;
  if (TSDIsTransformAxisAlignedWithObjectSize(&v38.a, a4.size.width, a4.size.height))
  {
    v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v37.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v37.c = v11;
    *(_OWORD *)&v37.tx = *(_OWORD *)&a3->tx;
    memset(&v38, 0, sizeof(v38));
    TSDTransformConvertForNewOrigin(&v37, &v38, width * -0.5, height * -0.5);
    v37 = v38;
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    v40 = CGRectApplyAffineTransform(v39, &v37);
    v12 = v40.origin.x;
    v13 = v40.origin.y;
    v14 = v40.size.width;
    v15 = v40.size.height;
    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
    v17 = TSDRoundedRectForScale(v12, v13, v14, v15, v16);
    v29 = v18;
    v30 = v17;
    v20 = v19;
    v22 = v21;
    memset(&v37, 0, sizeof(v37));
    v41.origin.x = v12;
    v41.origin.y = v13;
    v41.size.width = v14;
    v41.size.height = v15;
    v31 = height;
    v23 = -CGRectGetMinX(v41);
    v42.origin.x = v12;
    v42.origin.y = v13;
    v42.size.width = v14;
    v42.size.height = v15;
    MinY = CGRectGetMinY(v42);
    CGAffineTransformMakeTranslation(&v37, v23, -MinY);
    CGAffineTransformMakeScale(&t2, v20 / v14, v22 / v15);
    t1 = v37;
    CGAffineTransformConcat(&v36, &t1, &t2);
    v37 = v36;
    v43.origin.x = v30;
    v43.origin.y = v29;
    v43.size.width = v20;
    v43.size.height = v22;
    MinX = CGRectGetMinX(v43);
    v44.origin.x = v30;
    v44.origin.y = v29;
    v44.size.width = v20;
    v44.size.height = v22;
    v26 = CGRectGetMinY(v44);
    CGAffineTransformMakeTranslation(&v33, MinX, v26);
    t1 = v37;
    CGAffineTransformConcat(&v36, &t1, &v33);
    v37 = v36;
    t1 = v36;
    TSDTransformConvertForNewOrigin(&t1, &v36, width * 0.5, v31 * 0.5);
    v37 = v36;
    v27 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v27;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    v32 = v36;
    CGAffineTransformConcat(&v36, &t1, &v32);
    v28 = *(_OWORD *)&v36.c;
    *(_OWORD *)&a3->a = *(_OWORD *)&v36.a;
    *(_OWORD *)&a3->c = v28;
    *(_OWORD *)&a3->tx = *(_OWORD *)&v36.tx;
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
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v7 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v25.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v25.c = v7;
  *(_OWORD *)&v25.tx = *(_OWORD *)&a4->tx;
  if (TSDIsTransformAxisAlignedWithObjectSize(&v25.a, a3->size.width, a3->size.height))
  {
    v8 = a3->size.width * -0.5;
    v9 = a3->size.height * -0.5;
    v10 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v24.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v24.c = v10;
    *(_OWORD *)&v24.tx = *(_OWORD *)&a4->tx;
    memset(&v25, 0, sizeof(v25));
    TSDTransformConvertForNewOrigin(&v24, &v25, v8, v9);
    v26 = *a3;
    v24 = v25;
    v27 = CGRectApplyAffineTransform(v26, &v24);
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;
    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
    v16 = TSDRoundedRectForScale(x, y, width, height, v15);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v25;
    CGAffineTransformInvert(&v23, &v24);
    v28.origin.x = v16;
    v28.origin.y = v18;
    v28.size.width = v20;
    v28.size.height = v22;
    *a3 = CGRectApplyAffineTransform(v28, &v23);
  }
}

- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4 basedOnTransform:(CGAffineTransform *)a5 andSize:(CGSize)a6
{
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  __int128 v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  double v33;
  __int128 v34;
  CGFloat v35;
  double v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  double v40;
  __int128 v41;
  double v42;
  double v43;
  CGFloat v44;
  __int128 v45;
  __int128 v46;
  CGAffineTransform v47;
  CGAffineTransform t1;
  CGAffineTransform v49;
  CGAffineTransform v50;

  objc_opt_class();
  -[TSDAbstractLayout parent](-[TSDRep layout](self, "layout"), "parent");
  v10 = TSUDynamicCast();
  if (v10)
  {
    v11 = (void *)v10;
    memset(&v50, 0, sizeof(v50));
    if (-[TSDRep isBeingRotated](self, "isBeingRotated"))
      objc_msgSend(v11, "originalTransformInRoot");
    else
      objc_msgSend(v11, "transformInRoot");
    v12 = *(_OWORD *)&a5->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a5->a;
    *(_OWORD *)&t1.c = v12;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a5->tx;
    v47 = v50;
    CGAffineTransformConcat(&v49, &t1, &v47);
    v13 = *(_OWORD *)&v49.c;
    *(_OWORD *)&a5->a = *(_OWORD *)&v49.a;
    *(_OWORD *)&a5->c = v13;
    *(_OWORD *)&a5->tx = *(_OWORD *)&v49.tx;
  }
  v14 = TSDRectWithSize();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[TSDCanvas viewScale](self->mCanvas, "viewScale");
  v22 = v21;
  v23 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v50.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v50.c = v23;
  *(_OWORD *)&v50.tx = *(_OWORD *)&a5->tx;
  v24 = TSDTransformScale(&v50.a);
  v25 = TSDMultiplyRectScalar(v14, v16, v18, v20, v22 * fabs(v24));
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v32 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v50.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v50.c = v32;
  *(_OWORD *)&v50.tx = *(_OWORD *)&a5->tx;
  v33 = TSDTransformScale(&v50.a);
  v34 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v50.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v50.c = v34;
  *(_OWORD *)&v50.tx = *(_OWORD *)&a5->tx;
  v35 = 1.0 / v33;
  v36 = TSDTransformScale(&v50.a);
  v37 = *(_OWORD *)&a5->c;
  *(_OWORD *)&v49.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v49.c = v37;
  *(_OWORD *)&v49.tx = *(_OWORD *)&a5->tx;
  CGAffineTransformScale(&v50, &v49, v35, 1.0 / v36);
  v38 = *(_OWORD *)&v50.c;
  *(_OWORD *)&a5->a = *(_OWORD *)&v50.a;
  *(_OWORD *)&a5->c = v38;
  *(_OWORD *)&a5->tx = *(_OWORD *)&v50.tx;
  -[TSDCanvas viewScale](self->mCanvas, "viewScale");
  v39 = *(_OWORD *)&a5->c;
  *(float64x2_t *)&a5->tx = vmulq_n_f64(*(float64x2_t *)&a5->tx, v40);
  *(_OWORD *)&v49.a = *(_OWORD *)&a5->a;
  *(_OWORD *)&v49.c = v39;
  *(_OWORD *)&v49.tx = *(_OWORD *)&a5->tx;
  TSDTransformConvertForNewOrigin(&v49, &v50, v29 * 0.5, v31 * 0.5);
  v41 = *(_OWORD *)&v50.c;
  *(_OWORD *)&a5->a = *(_OWORD *)&v50.a;
  *(_OWORD *)&a5->c = v41;
  *(_OWORD *)&a5->tx = *(_OWORD *)&v50.tx;
  if (-[TSDRep parentRep](self, "parentRep"))
  {
    -[TSDRep layerFrameInScaledCanvas](-[TSDRep parentRep](self, "parentRep"), "layerFrameInScaledCanvas");
    v44 = a5->ty - v43;
    a5->tx = a5->tx - v42;
    a5->ty = v44;
  }
  if (a3)
  {
    a3->origin.x = v25;
    a3->origin.y = v27;
    a3->size.width = v29;
    a3->size.height = v31;
  }
  if (a4)
  {
    v45 = *(_OWORD *)&a5->a;
    v46 = *(_OWORD *)&a5->tx;
    *(_OWORD *)&a4->c = *(_OWORD *)&a5->c;
    *(_OWORD *)&a4->tx = v46;
    *(_OWORD *)&a4->a = v45;
  }
}

- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4
{
  TSDLayoutGeometry *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v7 = -[TSDAbstractLayout geometry](-[TSDRep layout](self, "layout"), "geometry");
  if (v7)
  {
    -[TSDLayoutGeometry transform](v7, "transform");
  }
  else
  {
    v9 = 0u;
    v10 = 0u;
    v8 = 0u;
  }
  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](-[TSDRep layout](self, "layout", v8, v9, v10), "geometry"), "size");
  -[TSDRep computeDirectLayerFrame:andTransform:basedOnTransform:andSize:](self, "computeDirectLayerFrame:andTransform:basedOnTransform:andSize:", a3, a4, &v8);
}

- (void)computeDirectLayerFrame:(CGRect *)a3 andTransform:(CGAffineTransform *)a4 basedOnLayoutGeometry:(id)a5
{
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if (a5)
  {
    objc_msgSend(a5, "transform");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
  }
  objc_msgSend(a5, "size", v9, v10, v11);
  -[TSDRep computeDirectLayerFrame:andTransform:basedOnTransform:andSize:](self, "computeDirectLayerFrame:andTransform:basedOnTransform:andSize:", a3, a4, &v9);
}

- (void)processChanges:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        objc_msgSend(v9, "details");
        v10 = (void *)TSUDynamicCast();
        if (v10)
        {
          v11 = (void *)objc_msgSend(v10, "changedProperties");
          v12[0] = MEMORY[0x24BDAC760];
          v12[1] = 3221225472;
          v12[2] = __25__TSDRep_processChanges___block_invoke;
          v12[3] = &unk_24D82AF28;
          v12[4] = self;
          objc_msgSend(v11, "enumeratePropertiesUsingBlock:", v12);
        }
        else if (objc_msgSend(v9, "kind") == 5 || objc_msgSend(v9, "kind") == 6)
        {
          -[TSDRep invalidateKnobs](self, "invalidateKnobs");
          -[TSDCanvas invalidateReps](self->mCanvas, "invalidateReps");
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
}

uint64_t __25__TSDRep_processChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processChangedProperty:", a2);
}

- (void)setNeedsDisplay
{
  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
  {
    if (!-[TSDRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
      -[TSDInteractiveCanvasController i_repNeedsDisplay:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "i_repNeedsDisplay:", self);
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
  {
    if (!-[TSDRep directlyManagesLayerContent](self, "directlyManagesLayerContent"))
    {
      v8.origin.x = x;
      v8.origin.y = y;
      v8.size.width = width;
      v8.size.height = height;
      if (!CGRectIsNull(v8))
      {
        v9.origin.x = x;
        v9.origin.y = y;
        v9.size.width = width;
        v9.size.height = height;
        if (!CGRectIsEmpty(v9))
          -[TSDInteractiveCanvasController i_repNeedsDisplay:inRect:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "i_repNeedsDisplay:inRect:", self, x, y, width, height);
      }
    }
  }
}

- (void)screenScaleDidChange
{
  -[TSDRep setNeedsDisplay](self, "setNeedsDisplay");
  -[TSDRep invalidateKnobs](self, "invalidateKnobs");
  -[TSDRep i_invalidateSelectionHighlightLayer](self, "i_invalidateSelectionHighlightLayer");
}

- (void)viewScaleDidChange
{
  -[TSDRep setNeedsDisplay](self, "setNeedsDisplay");
  -[TSDRep invalidateKnobs](self, "invalidateKnobs");
  -[TSDRep i_invalidateSelectionHighlightLayer](self, "i_invalidateSelectionHighlightLayer");
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)colorBehindLayer:(id)a3
{
  return 0;
}

- (void)setupForDrawingInLayer:(id)a3 context:(CGContext *)a4
{
  double v7;
  double v8;
  CGFloat v9;
  BOOL v10;
  TSDLayout *v11;
  CGAffineTransform *v12;
  void *v13;
  uint64_t v14;
  double v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  -[TSDRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas");
  CGContextTranslateCTM(a4, -v7, -v8);
  -[TSDCanvas viewScale](self->mCanvas, "viewScale");
  CGContextScaleCTM(a4, v9, v9);
  v10 = -[TSDRep isBeingRotated](self, "isBeingRotated");
  v11 = -[TSDRep layout](self, "layout");
  if (v10)
  {
    if (v11)
    {
      v12 = (CGAffineTransform *)&v16;
      -[TSDLayout originalTransformInRoot](v11, "originalTransformInRoot");
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v16 = 0u;
      v12 = (CGAffineTransform *)&v16;
    }
  }
  else if (v11)
  {
    v12 = (CGAffineTransform *)&v19;
    -[TSDAbstractLayout transformInRoot](v11, "transformInRoot");
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v19 = 0u;
    v12 = (CGAffineTransform *)&v19;
  }
  CGContextConcatCTM(a4, v12);
  if (a3 && objc_msgSend(a3, "contentsAreFlipped"))
  {
    v13 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary");
    v14 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    objc_msgSend(v13, "setObject:forKey:", v14, objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", self));
  }
  -[TSDRep i_configureFontSmoothingForContext:layer:](self, "i_configureFontSmoothingForContext:layer:", a4, a3, v16, v17, v18, v19, v20, v21);
  if (!-[TSDCanvas allowsFontSubpixelQuantization](-[TSDRep canvas](self, "canvas"), "allowsFontSubpixelQuantization"))
  {
    CGContextSetAllowsFontSubpixelQuantization(a4, 0);
    CGContextSetShouldSubpixelQuantizeFonts(a4, 0);
  }
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  TSDSetCGContextInfo((uint64_t)a4, 0, 0, a3 != 0, 0, v15);
}

- (void)didDrawInLayer:(id)a3 context:(CGContext *)a4
{
  void *v5;

  TSDClearCGContextInfo((uint64_t)a4);
  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary");
  objc_msgSend(v5, "removeObjectForKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", self));
}

- (BOOL)isDrawingInFlippedContext
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary");
  v4 = (void *)objc_msgSend(v3, "objectForKey:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", self));
  if (v4)
    LOBYTE(v4) = objc_msgSend(v4, "BOOLValue");
  return (char)v4;
}

- (void)recursivelyDrawInContext:(CGContext *)a3
{
  TSDLayoutGeometry *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  _BOOL4 v14;
  BOOL v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect ClipBoundingBox;

  v5 = -[TSDAbstractLayout geometry](-[TSDRep layout](self, "layout"), "geometry");
  if (v5)
    -[TSDLayoutGeometry transform](v5, "transform");
  else
    memset(&v16, 0, sizeof(v16));
  CGContextConcatCTM(a3, &v16);
  -[TSDRep clipRect](self, "clipRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = -[TSDRep masksToBounds](self, "masksToBounds");
  v15 = v14;
  if (v14)
  {
    v17.origin.x = v7;
    v17.origin.y = v9;
    v17.size.width = v11;
    v17.size.height = v13;
    CGContextClipToRect(a3, v17);
  }
  ClipBoundingBox = CGContextGetClipBoundingBox(a3);
  v18.origin.x = v7;
  v18.origin.y = v9;
  v18.size.width = v11;
  v18.size.height = v13;
  if (CGRectIntersectsRect(v18, ClipBoundingBox))
  {
    CGContextSaveGState(a3);
    if (!v15)
    {
      v19.origin.x = v7;
      v19.origin.y = v9;
      v19.size.width = v11;
      v19.size.height = v13;
      CGContextClipToRect(a3, v19);
    }
    -[TSDRep drawInContext:](self, "drawInContext:", a3, *(_OWORD *)&v16.a, *(_OWORD *)&v16.c, *(_OWORD *)&v16.tx);
    CGContextRestoreGState(a3);
  }
  -[TSDRep recursivelyDrawChildrenInContext:](self, "recursivelyDrawChildrenInContext:", a3, *(_OWORD *)&v16.a, *(_OWORD *)&v16.c, *(_OWORD *)&v16.tx);
}

- (void)recursivelyDrawChildrenInContext:(CGContext *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)TSUProtocolCast();
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)objc_msgSend(v4, "childReps", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          CGContextSaveGState(a3);
          objc_msgSend(v10, "recursivelyDrawInContext:", a3);
          CGContextRestoreGState(a3);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
  }
}

- (BOOL)isSelectedIgnoringLocking
{
  return -[TSDRep isSelectable](self, "isSelectable")
      && -[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive")
      && -[TSDCanvasEditor isSelectedInfo:](-[TSDInteractiveCanvasController canvasEditor](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasEditor"), "isSelectedInfo:", -[TSDRep info](self, "info"));
}

- (BOOL)isSelected
{
  _BOOL4 v3;

  v3 = -[TSDRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking");
  if (v3)
    LOBYTE(v3) = !-[TSDRep isLocked](self, "isLocked");
  return v3;
}

- (void)becameSelected
{
  -[TSDRep invalidateKnobs](self, "invalidateKnobs");
  -[TSDCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
}

- (void)becameNotSelected
{
  -[TSDRep invalidateKnobs](self, "invalidateKnobs");
  -[TSDRep i_invalidateSelectionHighlightLayer](self, "i_invalidateSelectionHighlightLayer");
  self->mSelectionHighlightLayerValid = 0;

  self->mSelectionHighlightLayer = 0;
  -[TSDCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
}

- (NSArray)knobs
{
  NSArray *mKnobs;
  void *v4;
  NSArray *v5;
  TSDKnobTracker *mKnobTracker;
  _QWORD *v7;
  unint64_t v8;
  NSArray *v9;
  uint64_t v10;
  NSArray *result;
  _QWORD v12[5];
  _QWORD v13[6];

  mKnobs = self->mKnobs;
  if (!mKnobs)
  {
    if (-[TSDRep shouldCreateKnobs](self, "shouldCreateKnobs"))
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      -[TSDRep addKnobsToArray:](self, "addKnobsToArray:", v4);
      if (objc_msgSend(v4, "count"))
        self->mKnobPositionsInvalid = 1;
      mKnobs = v4;
      self->mKnobs = mKnobs;
    }
    else
    {
      mKnobs = self->mKnobs;
    }
  }
  if (-[NSArray count](mKnobs, "count") && self->mKnobPositionsInvalid)
    -[TSDRep updatePositionsOfKnobs:](self, "updatePositionsOfKnobs:", self->mKnobs);
  self->mKnobPositionsInvalid = 0;
  v5 = self->mKnobs;
  mKnobTracker = self->mKnobTracker;
  if (mKnobTracker && -[TSDKnobTracker didBegin](mKnobTracker, "didBegin") && !self->mShowKnobsWhenManipulated)
  {
    v8 = -[TSDKnobTracker enabledKnobMask](self->mKnobTracker, "enabledKnobMask");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __15__TSDRep_knobs__block_invoke;
    v13[3] = &unk_24D82B680;
    v13[5] = v8;
    v7 = v13;
  }
  else
  {
    if (-[TSDRep shouldShowKnobs](self, "shouldShowKnobs"))
      goto LABEL_17;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __15__TSDRep_knobs__block_invoke_2;
    v12[3] = &unk_24D82B6A8;
    v7 = v12;
  }
  v7[4] = self;
  v5 = (NSArray *)-[NSArray tsu_arrayOfObjectsPassingTest:](v5, "tsu_arrayOfObjectsPassingTest:");
LABEL_17:
  v9 = self->mKnobs;
  if (v5 != v9)
  {

    v5 = v5;
    self->mKnobs = v5;
  }
  v10 = -[NSArray count](v5, "count");
  result = self->mKnobs;
  if (!v10)
  {

    result = 0;
    self->mKnobs = 0;
  }
  return result;
}

uint64_t __15__TSDRep_knobs__block_invoke(uint64_t a1, void *a2)
{
  if ((*(_QWORD *)(a1 + 40) & TSDMaskForKnob(objc_msgSend(a2, "tag"))) != 0)
    return 1;
  else
    return objc_msgSend(*(id *)(a1 + 32), "directlyManagesVisibilityOfKnob:", a2);
}

uint64_t __15__TSDRep_knobs__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "directlyManagesVisibilityOfKnob:", a2);
}

- (void)invalidateKnobs
{
  NSArray *mKnobs;

  mKnobs = self->mKnobs;
  if (mKnobs)
  {

    self->mKnobs = 0;
    -[TSDCanvas invalidateLayers](-[TSDRep canvas](self, "canvas"), "invalidateLayers");
  }
}

- (unint64_t)enabledKnobMask
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t i;
  uint64_t v16;
  TSDLayoutGeometry *v17;
  _OWORD v19[3];
  _OWORD v20[3];

  if (objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "owningAttachmentNoRecurse"), "specifiesEnabledKnobMask"))v3 = objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "owningAttachmentNoRecurse"), "enabledKnobMask");
  else
    v3 = 990;
  -[TSDRep trackingBoundsForStandardKnobs](self, "trackingBoundsForStandardKnobs");
  v5 = v4;
  v7 = v6;
  -[TSDCanvas viewScale](self->mCanvas, "viewScale");
  v9 = TSDMultiplySizeScalar(v5, v7, v8);
  v11 = v3 & 0xFFFFFFFFFFFFFEFBLL;
  if (v9 >= 50.0)
    v11 = v3;
  if (v10 >= 50.0)
    v12 = v11;
  else
    v12 = v11 & 0xFFFFFFFFFFFFFFAFLL;
  if (objc_msgSend(-[TSDRep info](self, "info"), "isInlineWithText"))
  {
    v13 = -[TSDAbstractLayout geometryInRoot](-[TSDRep layout](self, "layout"), "geometryInRoot");
    if (v13)
      objc_msgSend(v13, "transform");
    else
      memset(v20, 0, sizeof(v20));
    TSDTransformAngle((double *)v20);
    TSURound();
    v14 = 0;
    for (i = 1; i != 10; ++i)
    {
      if ((TSDMaskForKnob(i) & v12) != 0)
      {
        v16 = TSDKnobTagByRotatingKnobByAngle(i);
        v17 = -[TSDAbstractLayout geometry](-[TSDRep layout](self, "layout"), "geometry");
        if (v17)
          -[TSDLayoutGeometry transform](v17, "transform");
        else
          memset(v19, 0, sizeof(v19));
        if (TSDIsTransformFlipped((double *)v19))
          LOBYTE(v16) = TSDKnobTagWithFlip(v16);
        v14 |= TSDMaskForKnob(v16);
      }
    }
    if (v14)
      return v14;
  }
  return v12;
}

- (void)addKnobsToArray:(id)a3
{
  if (-[TSDRep shouldCreateSelectionKnobs](self, "shouldCreateSelectionKnobs"))
  {
    -[TSDRep addSelectionKnobsToArray:](self, "addSelectionKnobsToArray:", a3);
  }
  else if (-[TSDRep shouldCreateLockedKnobs](self, "shouldCreateLockedKnobs"))
  {
    -[TSDRep addLockedKnobsToArray:](self, "addLockedKnobsToArray:", a3);
  }
  if (-[TSDRep shouldCreateCommentKnob](self, "shouldCreateCommentKnob"))
    -[TSDRep addCommentKnobToArray:](self, "addCommentKnobToArray:", a3);
  if (-[TSDRep shouldDisplayHyperlinkUI](self, "shouldDisplayHyperlinkUI"))
    -[TSDRep addHyperlinkKnobToArray:](self, "addHyperlinkKnobToArray:", a3);
  -[TSDRep addActionGhostKnobToArrayIfNecessary:](self, "addActionGhostKnobToArrayIfNecessary:", a3);
}

- (id)newSelectionKnobForType:(int)a3 tag:(unint64_t)a4
{
  uint64_t v5;
  TSDKnob *v7;

  v5 = *(_QWORD *)&a3;
  v7 = [TSDKnob alloc];
  return -[TSDKnob initWithType:position:radius:tag:onRep:](v7, "initWithType:position:radius:tag:onRep:", v5, a4, self, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 15.0);
}

- (void)addSelectionKnobsToArray:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;

  v5 = -[TSDRep enabledKnobMask](self, "enabledKnobMask");
  if (v5)
  {
    v6 = v5;
    v7 = -[TSDInteractiveCanvasController defaultKnobTypeForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "defaultKnobTypeForRep:", self);
    for (i = 1; i != 10; ++i)
    {
      if ((TSDMaskForKnob(i) & v6) != 0)
      {
        v9 = -[TSDRep newSelectionKnobForType:tag:](self, "newSelectionKnobForType:tag:", v7, i);
        objc_msgSend(a3, "addObject:", v9);

      }
    }
  }
}

- (void)addLockedKnobsToArray:(id)a3
{
  void *v5;
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

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  -[TSDRep addSelectionKnobsToArray:](self, "addSelectionKnobsToArray:", v5);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setType:", 4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  objc_msgSend(a3, "addObjectsFromArray:", v5);
}

- (void)addActionGhostKnobToArrayIfNecessary:(id)a3
{
  id v4;

  v4 = -[TSDInteractiveCanvasController actionGhostKnobForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "actionGhostKnobForRep:", self);
  if (v4)
    objc_msgSend(a3, "addObject:", v4);
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "tag") < 0xA;
}

- (CGRect)boundsForStandardKnobs
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDLayout boundsForStandardKnobs](-[TSDRep layout](self, "layout"), "boundsForStandardKnobs");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)trackingBoundsForStandardKnobs
{
  TSDKnobTracker *mKnobTracker;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  mKnobTracker = self->mKnobTracker;
  if (mKnobTracker)
    -[TSDKnobTracker currentBoundsForStandardKnobs](mKnobTracker, "currentBoundsForStandardKnobs");
  else
    -[TSDRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)updatePositionsOfKnobs:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
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
  float64x2_t v31;
  float64x2_t v32;
  float64x2_t v33;
  double v34;
  double v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[TSDRep trackingBoundsForStandardKnobs](self, "trackingBoundsForStandardKnobs");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v40 != v15)
          objc_enumerationMutation(a3);
        v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if ((unint64_t)(objc_msgSend(v17, "tag") - 1) <= 8)
        {
          -[TSDRep positionOfStandardKnob:forBounds:](self, "positionOfStandardKnob:forBounds:", v17, v6, v8, v10, v12);
LABEL_8:
          objc_msgSend(v17, "setPosition:");
          continue;
        }
        if (objc_msgSend(v17, "tag") == 31)
        {
          -[TSDRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
          v19 = v18;
          v21 = v20;
          if (-[TSDRep parentRep](self, "parentRep") && objc_msgSend(v17, "shouldDisplayDirectlyOverRep"))
          {
            -[TSDRep boundsForStandardKnobs](-[TSDRep parentRep](self, "parentRep"), "boundsForStandardKnobs");
            v19 = TSDAddPoints(v19, v21, v22);
          }
          v23 = TSDPositionOfKnobOnRectangle(1, v6, v8, v10, v12);
          v25 = v24;
          -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
          v27 = TSDAddPoints(v23, v25, v26 * -36.0);
          v29 = TSDSubtractPoints(v27, v28, v19);
          if (self)
          {
            v34 = v30;
            v35 = v29;
            -[TSDRep transformToConvertNaturalFromLayerRelative](self, "transformToConvertNaturalFromLayerRelative");
            v30 = v34;
            v29 = v35;
            v32 = v36;
            v31 = v37;
            v33 = v38;
          }
          else
          {
            v37 = 0u;
            v38 = 0u;
            v33 = 0uLL;
            v32 = 0uLL;
            v31 = 0uLL;
            v36 = 0u;
          }
          objc_msgSend(v17, "setPosition:", vaddq_f64(v33, vmlaq_n_f64(vmulq_n_f64(v31, v30), v32, v29)));
          objc_msgSend(v17, "updateHitRegionPathForRep:", self);
        }
        else
        {
          if (objc_msgSend(v17, "tag") == 33)
          {
            -[TSDRep positionOfHyperlinkKnob](self, "positionOfHyperlinkKnob");
            goto LABEL_8;
          }
          if (objc_msgSend(v17, "tag") == 34)
          {
            -[TSDRep p_positionOfActionGhostKnobForBounds:](self, "p_positionOfActionGhostKnobForBounds:", v6, v8, v10, v12);
            goto LABEL_8;
          }
        }
      }
      v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v14);
  }
}

- (BOOL)forcesPlacementOnTop
{
  return 0;
}

- (CGPoint)positionOfHyperlinkKnob
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;
  CGRect v22;
  CGRect v23;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C90], "imageNamed:inBundle:", CFSTR("TSDKnobHyperlink_N"), TSDBundle()), "size");
  v4 = v3;
  v20 = v5;
  -[TSDRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v15 = v14;
  v22.origin.x = v7;
  v22.origin.y = v9;
  v22.size.width = v11;
  v22.size.height = v13;
  v16 = -1.0 / v15;
  v17 = CGRectGetMaxX(v22) + v16 * (v4 * 0.5 + 6.0);
  v23.origin.x = v7;
  v23.origin.y = v9;
  v23.size.width = v11;
  v23.size.height = v13;
  v18 = CGRectGetMaxY(v23) + v16 * (v20 * 0.5 + 6.0);
  v19 = v17;
  result.y = v18;
  result.x = v19;
  return result;
}

- (CGPoint)positionOfActionGhostKnob
{
  double v3;
  double v4;
  CGPoint result;

  -[TSDRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
  -[TSDRep p_positionOfActionGhostKnobForBounds:](self, "p_positionOfActionGhostKnobForBounds:");
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)p_positionOfActionGhostKnobForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat MidX;
  double v13;
  double v14;
  CGPoint result;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C90], "imageNamed:inBundle:", CFSTR("sf-mac_canvas_btn_actionAdd-N"), TSDBundle()), "size");
  v9 = v8;
  -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
  v11 = 1.0 / v10;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  v13 = CGRectGetMaxY(v17) + v11 * v9 + 1.0;
  v14 = MidX;
  result.y = v13;
  result.x = v14;
  return result;
}

- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  uint64_t v11;
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
  double v22;
  double v23;
  double v24;
  double v25;
  CGPoint result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (!objc_msgSend(a3, "tag") || (unint64_t)objc_msgSend(a3, "tag") >= 0xA)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRep positionOfStandardKnob:forBounds:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 1626, CFSTR("-positionOfStandardKnob:forBounds: works for standard knobs only"));
  }
  objc_msgSend(a3, "offset");
  v13 = v12;
  v15 = v14;
  if (!objc_msgSend(a3, "offsetValid"))
  {
    -[TSDInteractiveCanvasController viewScale](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
    if (width * v16 <= 16.0)
    {
      if (objc_msgSend(a3, "tag") == 1 || objc_msgSend(a3, "tag") == 4 || objc_msgSend(a3, "tag") == 7)
      {
        -[TSDInteractiveCanvasController viewScale](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
        v13 = v13 - (8.0 / v17 + width * -0.5);
      }
      else if (objc_msgSend(a3, "tag") == 3 || objc_msgSend(a3, "tag") == 6 || objc_msgSend(a3, "tag") == 9)
      {
        -[TSDInteractiveCanvasController viewScale](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
        v13 = v13 + 8.0 / v24 + width * -0.5;
      }
    }
    -[TSDInteractiveCanvasController viewScale](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
    if (height * v18 <= 16.0)
    {
      if (objc_msgSend(a3, "tag") == 1 || objc_msgSend(a3, "tag") == 2 || objc_msgSend(a3, "tag") == 3)
      {
        -[TSDInteractiveCanvasController viewScale](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
        v15 = v15 - (8.0 / v19 + height * -0.5);
      }
      else if (objc_msgSend(a3, "tag") == 7 || objc_msgSend(a3, "tag") == 8 || objc_msgSend(a3, "tag") == 9)
      {
        -[TSDInteractiveCanvasController viewScale](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
        v15 = v15 + 8.0 / v25 + height * -0.5;
      }
    }
    objc_msgSend(a3, "setOffset:", v13, v15);
    objc_msgSend(a3, "setOffsetValid:", 1);
  }
  v20 = TSDPositionOfKnobOnRectangle(objc_msgSend(a3, "tag"), x, y, width, height);
  v22 = TSDAddPoints(v20, v21, v13);
  result.y = v23;
  result.x = v22;
  return result;
}

- (void)invalidateKnobPositions
{
  self->mKnobPositionsInvalid = 1;
  -[TSDRep i_invalidateSelectionHighlightLayer](self, "i_invalidateSelectionHighlightLayer");
  -[TSDCanvas invalidateLayers](self->mCanvas, "invalidateLayers");
}

- (id)newTrackerForKnob:(id)a3
{
  return 0;
}

- (void)p_toggleHyperlinkUIVisibility
{
  -[TSDInteractiveCanvasController toggleHyperlinkUIForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "toggleHyperlinkUIForRep:", self);
}

- (void)p_actionGhostKnobHit
{
  -[TSDInteractiveCanvasController actionGhostKnobHitForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "actionGhostKnobHitForRep:", self);
}

- (id)knobForTag:(unint64_t)a3
{
  NSArray *v4;
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
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[TSDRep knobs](self, "knobs", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
    if (objc_msgSend(v9, "tag") == a3)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (double)additionalRotationForKnobOrientation
{
  TSDLayout *v2;
  _OWORD v4[3];

  v2 = -[TSDRep layout](self, "layout");
  if (v2)
    -[TSDAbstractLayout transformInRoot](v2, "transformInRoot");
  else
    memset(v4, 0, sizeof(v4));
  return TSDTransformAngle((double *)v4);
}

- (BOOL)shouldShowSelectionHighlight
{
  _BOOL4 v3;

  v3 = -[TSDRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking");
  if (v3)
  {
    if (!-[TSDRep isInDynamicOperation](self, "isInDynamicOperation")
      || self->mShowKnobsWhenManipulated && self->mKnobsAreShowing)
    {
      LOBYTE(v3) = !-[TSDKnobTracker shouldHideSelectionHighlight](self->mKnobTracker, "shouldHideSelectionHighlight");
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)shouldCreateKnobs
{
  return 1;
}

- (BOOL)shouldCreateSelectionKnobs
{
  _BOOL4 v3;

  v3 = -[TSDRep isSelected](self, "isSelected");
  if (v3)
    LOBYTE(v3) = !-[TSDInteractiveCanvasController usesAlternateDrawableSelectionHighlight](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "usesAlternateDrawableSelectionHighlight");
  return v3;
}

- (BOOL)shouldCreateLockedKnobs
{
  _BOOL4 v3;

  v3 = -[TSDRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking");
  if (v3)
    LOBYTE(v3) = -[TSDRep isLocked](self, "isLocked");
  return v3;
}

- (BOOL)shouldCreateCommentKnob
{
  void *v3;
  BOOL v4;

  objc_opt_class();
  -[TSDRep info](self, "info");
  v3 = (void *)TSUDynamicCast();
  if (-[TSDInteractiveCanvasController shouldDisplayCommentUIForInfo:](-[TSDCanvas canvasController](-[TSDRep canvas](self, "canvas"), "canvasController"), "shouldDisplayCommentUIForInfo:", v3))
  {
    v4 = -[TSDRep shouldShowCommentHighlight](self, "shouldShowCommentHighlight");
  }
  else
  {
    v4 = 0;
  }
  return objc_msgSend(v3, "comment") && v4;
}

- (BOOL)shouldShowCommentUIDirectlyOverRep
{
  return !-[TSDRep isSelected](self, "isSelected");
}

- (BOOL)isEditingPath
{
  return 0;
}

- (BOOL)shouldDisplayHyperlinkUI
{
  void *v3;

  LODWORD(v3) = -[TSDInteractiveCanvasController shouldShowOnRepHyperlinkUI](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "shouldShowOnRepHyperlinkUI");
  if ((_DWORD)v3)
  {
    if (-[TSDRep isEditingPath](self, "isEditingPath"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      objc_opt_class();
      -[TSDRep info](self, "info");
      v3 = (void *)TSUDynamicCast();
      if (v3)
        LOBYTE(v3) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "hyperlinkURL"), "absoluteString"), "length") != 0;
    }
  }
  return (char)v3;
}

- (BOOL)shouldShowKnobs
{
  return !-[TSDRep isInDynamicOperation](self, "isInDynamicOperation")
      || self->mShowKnobsWhenManipulated
      || self->mKnobTracker != 0;
}

- (void)showKnobsDuringManipulation:(BOOL)a3
{
  self->mShowKnobsWhenManipulated = a3;
}

- (void)turnKnobsOn
{
  NSArray *mKnobs;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  float v9;
  void *v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  self->mKnobsAreShowing = 1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mKnobs = self->mKnobs;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](mKnobs, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(mKnobs);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v8, "layer"), "opacity");
        if (v9 != 1.0 && !-[TSDRep directlyManagesVisibilityOfKnob:](self, "directlyManagesVisibilityOfKnob:", v8))
        {
          v10 = (void *)objc_msgSend(v8, "layer");
          LODWORD(v11) = 1.0;
          objc_msgSend(v10, "setOpacity:", v11);
        }
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](mKnobs, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
}

- (void)fadeKnobsIn
{
  void *v3;
  double v4;
  NSArray *mKnobs;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  float v11;
  void *v12;
  void *v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  self->mKnobsAreShowing = 1;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "setDuration:", 0.150000006);
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  mKnobs = self->mKnobs;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](mKnobs, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(mKnobs);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v10, "layer"), "opacity");
        if (v11 != 1.0 && !-[TSDRep directlyManagesVisibilityOfKnob:](self, "directlyManagesVisibilityOfKnob:", v10))
        {
          v12 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend((id)objc_msgSend(v10, "layer"), "opacity");
          objc_msgSend(v3, "setFromValue:", objc_msgSend(v12, "numberWithFloat:"));
          v13 = (void *)objc_msgSend(v10, "layer");
          LODWORD(v14) = 1.0;
          objc_msgSend(v13, "setOpacity:", v14);
          objc_msgSend((id)objc_msgSend(v10, "layer"), "addAnimation:forKey:", v3, CFSTR("fade in"));
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](mKnobs, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
}

- (void)fadeKnobsOut
{
  void *v3;
  double v4;
  double v5;
  NSArray *mKnobs;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  float v12;
  void *v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  self->mKnobsAreShowing = 0;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  objc_msgSend(v3, "setDelegate:", 0);
  objc_msgSend(v3, "setDuration:", 0.150000006);
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4));
  LODWORD(v5) = 0;
  objc_msgSend(v3, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v5));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  mKnobs = self->mKnobs;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](mKnobs, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(mKnobs);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v11, "layer"), "opacity");
        if (v12 == 1.0 && !-[TSDRep directlyManagesVisibilityOfKnob:](self, "directlyManagesVisibilityOfKnob:", v11))
        {
          v13 = (void *)objc_msgSend(v11, "layer");
          LODWORD(v14) = 0;
          objc_msgSend(v13, "setOpacity:", v14);
          objc_msgSend((id)objc_msgSend(v11, "layer"), "addAnimation:forKey:", v3, CFSTR("fade out"));
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](mKnobs, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  return objc_msgSend(a3, "tag") == 31;
}

- (double)selectionHighlightWidth
{
  _BOOL4 v2;
  double result;

  v2 = -[TSDInteractiveCanvasController usesAlternateDrawableSelectionHighlight](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "usesAlternateDrawableSelectionHighlight");
  result = 1.0;
  if (v2)
    return 5.0;
  return result;
}

- (void)setSelectionHighlightColor:(CGColor *)a3
{
  CGColor *Copy;

  Copy = CGColorCreateCopy(a3);
  CGColorRelease(self->mDefaultSelectionHighlightColor);
  self->mDefaultSelectionHighlightColor = Copy;
}

- (CGColor)selectionHighlightColor
{
  CGColor *result;

  if (-[TSDRep isLocked](self, "isLocked"))
  {
    if (selectionHighlightColor_sOnce != -1)
      dispatch_once(&selectionHighlightColor_sOnce, &__block_literal_global_24);
    return (CGColor *)selectionHighlightColor_sLockedSelectionHighlightColor;
  }
  else
  {
    result = self->mDefaultSelectionHighlightColor;
    if (!result)
    {
      result = CGColorCreateCopy(-[TSDInteractiveCanvasController selectionHighlightColor](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "selectionHighlightColor"));
      self->mDefaultSelectionHighlightColor = result;
    }
  }
  return result;
}

CGColorRef __33__TSDRep_selectionHighlightColor__block_invoke()
{
  CGColorRef result;

  result = CGColorRetain((CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.85, 0.85, 0.85, 1.0), "CGColor"));
  selectionHighlightColor_sLockedSelectionHighlightColor = (uint64_t)result;
  return result;
}

- (CGAffineTransform)transformForHighlightLayer
{
  CGAffineTransform *result;

  if (self->mKnobTracker)
    return -[TSDKnobTracker transformInRootForStandardKnobs](self->mKnobTracker, "transformInRootForStandardKnobs");
  result = -[TSDRep layout](self, "layout");
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform transformInRoot](result, "transformInRoot");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (id)selectionHighlightLayer
{
  CALayer *mSelectionHighlightLayer;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  CGPath *v19;
  CGAffineTransform v21;
  CGAffineTransform t2;
  CGAffineTransform v23;
  CGAffineTransform v24;

  mSelectionHighlightLayer = self->mSelectionHighlightLayer;
  if (mSelectionHighlightLayer
    || (mSelectionHighlightLayer = (CALayer *)objc_alloc_init(MEMORY[0x24BDE5758]),
        -[CALayer setFillColor:](mSelectionHighlightLayer, "setFillColor:", 0),
        -[TSDRep selectionHighlightWidth](self, "selectionHighlightWidth"),
        -[CALayer setLineWidth:](mSelectionHighlightLayer, "setLineWidth:"),
        -[CALayer setDelegate:](mSelectionHighlightLayer, "setDelegate:", -[TSDRep interactiveCanvasController](self, "interactiveCanvasController")), (self->mSelectionHighlightLayer = mSelectionHighlightLayer) != 0))
  {
    if (!self->mSelectionHighlightLayerValid)
    {
      objc_opt_class();
      v4 = (void *)TSUDynamicCast();
      if (v4)
      {
        v5 = v4;
        objc_msgSend(v4, "setStrokeColor:", -[TSDRep selectionHighlightColor](self, "selectionHighlightColor"));
        -[TSDRep selectionHighlightWidth](self, "selectionHighlightWidth");
        objc_msgSend(v5, "setLineWidth:");
        -[TSDCanvas viewScale](self->mCanvas, "viewScale");
        v7 = v6;
        -[TSDRep boundsForHighlightLayer](self, "boundsForHighlightLayer");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;
        memset(&v24, 0, sizeof(v24));
        -[TSDRep transformForHighlightLayer](self, "transformForHighlightLayer");
        CGAffineTransformMakeScale(&t2, v7, v7);
        v21 = v24;
        CGAffineTransformConcat(&v23, &v21, &t2);
        v24 = v23;
        objc_msgSend(v5, "lineWidth");
        v17 = v16;
        -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
        v19 = TSDCreateAADefeatedRectPath((uint64_t)&v24, v9, v11, v13, v15, v17, v18);
        objc_msgSend(v5, "setPath:", v19);
        CGPathRelease(v19);
      }
      self->mSelectionHighlightLayerValid = 1;
      return self->mSelectionHighlightLayer;
    }
  }
  return mSelectionHighlightLayer;
}

- (void)i_invalidateSelectionHighlightLayer
{
  self->mSelectionHighlightLayerValid = 0;
}

- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  if (self->mKnobTracker)
    -[TSDKnobTracker convertKnobPositionToUnscaledCanvas:](self->mKnobTracker, "convertKnobPositionToUnscaledCanvas:", a3.x, a3.y);
  else
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)p_addLayersForKnobsToArray:(id)a3 withDelegate:(id)a4 isOverlay:(BOOL)a5
{
  TSDInteractiveCanvasController *v9;
  uint64_t v10;
  _QWORD v12[8];
  _QWORD v13[5];
  BOOL v14;

  v9 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  v10 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__TSDRep_p_addLayersForKnobsToArray_withDelegate_isOverlay___block_invoke;
  v13[3] = &unk_24D82B6F0;
  v13[4] = self;
  v14 = a5;
  if (!a3)
    a3 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __60__TSDRep_p_addLayersForKnobsToArray_withDelegate_isOverlay___block_invoke_2;
  v12[3] = &unk_24D82B718;
  v12[4] = a4;
  v12[5] = v9;
  v12[6] = self;
  v12[7] = a3;
  __60__TSDRep_p_addLayersForKnobsToArray_withDelegate_isOverlay___block_invoke((uint64_t)v13, (uint64_t)v12);
  return a3;
}

uint64_t __60__TSDRep_p_addLayersForKnobsToArray_withDelegate_isOverlay___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  float v13;
  float v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "knobs", 0);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v10 = objc_msgSend(v9, "layer");
        if (v10)
        {
          v11 = (void *)v10;
          v12 = *(unsigned __int8 *)(a1 + 40);
          if (v12 != objc_msgSend(v9, "shouldDisplayDirectlyOverRep"))
          {
            if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 34)
              || (objc_msgSend(v11, "opacity"), v13 != 0.0)
              || (objc_msgSend((id)objc_msgSend(v11, "presentationLayer"), "opacity"), v14 != 0.0)
              || objc_msgSend(*(id *)(a1 + 32), "directlyManagesVisibilityOfKnob:", v9))
            {
              (*(void (**)(uint64_t, void *, void *))(a2 + 16))(a2, v9, v11);
            }
          }
        }
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __60__TSDRep_p_addLayersForKnobsToArray_withDelegate_isOverlay___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;

  if (!objc_msgSend(a3, "delegate"))
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (!v6)
      v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(a3, "setDelegate:", v6);
  }
  v7 = *(void **)(a1 + 48);
  objc_msgSend(a2, "position");
  objc_msgSend(v7, "convertKnobPositionToUnscaledCanvas:");
  objc_msgSend(*(id *)(a1 + 40), "convertUnscaledToBoundsPoint:");
  v9 = v8;
  v11 = v10;
  objc_msgSend(a3, "bounds");
  v16 = TSDCenterOfRect(v12, v13, v14, v15);
  v17 = TSDSubtractPoints(v9, v11, v16);
  v19 = v18;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "canvas"), "contentsScale");
  v21 = TSDRoundedPointForScale(v17, v19, v20);
  v24 = TSDAddPoints(v21, v22, v16);
  v25 = v23;
  if (fabs(v24) == INFINITY || (v26 = fabs(v23), v26 >= INFINITY) && v26 <= INFINITY)
  {
    v27 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v28 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRep p_addLayersForKnobsToArray:withDelegate:isOverlay:]_block_invoke_2");
    return objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 2044, CFSTR("Knob layer position must be finite"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    objc_msgSend(a3, "setPosition:", v24, v25);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    return objc_msgSend(*(id *)(a1 + 56), "addObject:", a3);
  }
}

- (id)overlayLayers
{
  void *v3;
  TSDInteractiveCanvasController *v4;
  id v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
  if (-[TSDRep shouldShowSelectionHighlight](self, "shouldShowSelectionHighlight"))
  {
    v5 = -[TSDRep selectionHighlightLayer](self, "selectionHighlightLayer");
    if (v5)
      objc_msgSend(v3, "addObject:", v5);
  }
  if (-[TSDInteractiveCanvasController shouldPopKnobsOutsideEnclosingScrollView](v4, "shouldPopKnobsOutsideEnclosingScrollView"))
  {
    return v3;
  }
  else
  {
    return -[TSDRep p_addLayersForKnobsToArray:withDelegate:isOverlay:](self, "p_addLayersForKnobsToArray:withDelegate:isOverlay:", v3, v4, 1);
  }
}

- (id)popoutLayers
{
  if (-[TSDInteractiveCanvasController shouldPopKnobsOutsideEnclosingScrollView](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "shouldPopKnobsOutsideEnclosingScrollView"))
  {
    return -[TSDRep p_addLayersForKnobsToArray:withDelegate:isOverlay:](self, "p_addLayersForKnobsToArray:withDelegate:isOverlay:", 0, -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), 1);
  }
  else
  {
    return 0;
  }
}

- (BOOL)isInDynamicOperation
{
  return -[TSDLayout layoutState](-[TSDRep layout](self, "layout"), "layoutState") != 0;
}

- (CGPoint)i_dragOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[TSDLayoutGeometry frame](-[TSDLayout dynamicGeometry](-[TSDRep layout](self, "layout"), "dynamicGeometry"), "frame");
  v4 = v3;
  v6 = v5;
  -[TSDLayoutGeometry frame](-[TSDLayout originalGeometry](-[TSDRep layout](self, "layout"), "originalGeometry"), "frame");
  v8 = TSDSubtractPoints(v4, v6, v7);
  result.y = v9;
  result.x = v8;
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

- (void)dynamicRotateDidBegin
{
  -[TSDRep recursivelyPerformSelector:](self, "recursivelyPerformSelector:", sel_p_dynamicRotateDidBegin);
  -[TSDCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
}

- (void)p_dynamicRotateDidBegin
{
  void *v3;
  uint64_t v4;

  if (!-[TSDRep isInDynamicOperation](self, "isInDynamicOperation"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRep p_dynamicRotateDidBegin]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 2354, CFSTR("dynamic rotate began outside of dynamic operation"));
  }
  -[TSDLayout beginRotate](-[TSDRep layout](self, "layout"), "beginRotate");
}

- (BOOL)isBeingRotated
{
  return -[TSDLayout layoutState](-[TSDRep layout](self, "layout"), "layoutState") == 3;
}

- (double)angleForRotation
{
  double result;

  objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "geometry"), "angle");
  return result;
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

  -[TSDRep naturalBounds](self, "naturalBounds");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", MidX, CGRectGetMinY(v12));
  result.y = v9;
  result.x = v8;
  return result;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 onKnob:(id)a4
{
  return 0;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 onKnob:(id)a4
{
  return 0;
}

- (BOOL)wantsEditMenuForTapAtPoint:(CGPoint)a3 onKnob:(id)a4
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

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)canClipThemeContentToCanvas
{
  if (-[TSDRep isPlaceholder](self, "isPlaceholder"))
    return 0;
  else
    return objc_msgSend(-[TSDRep info](self, "info"), "isThemeContent");
}

- (BOOL)wantsToHandleTapsOnContainingGroup
{
  return 0;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 0;
}

- (void)setTexture:(id)a3
{
  TSDTextureSet *mTexture;

  mTexture = self->mTexture;
  if (mTexture != a3)
  {
    -[TSDTextureSet teardown](mTexture, "teardown");

    self->mTexture = (TSDTextureSet *)a3;
  }
}

- (double)textureAngle
{
  TSDLayout *v3;
  double v4;
  NSDictionary *mTextureActionAttributes;
  id v6;
  float v7;
  _OWORD v9[3];

  v3 = -[TSDRep layout](self, "layout");
  if (v3)
    -[TSDAbstractLayout transformInRoot](v3, "transformInRoot");
  else
    memset(v9, 0, sizeof(v9));
  v4 = -TSDTransformAngle((double *)v9);
  mTextureActionAttributes = self->mTextureActionAttributes;
  if (mTextureActionAttributes)
  {
    v6 = -[NSDictionary valueForKey:](mTextureActionAttributes, "valueForKey:", CFSTR("sfx-action-rotation-angle"));
    if (v6)
    {
      objc_msgSend(v6, "floatValue");
      return v4 - v7;
    }
  }
  return v4;
}

- (void)markTextureDirty
{

  self->mTexture = 0;
  self->mTextureContext = 0;
}

- (void)setTextureDeliveryStyle:(unint64_t)a3
{
  if (self->mTextureDeliveryStyle != a3)
    -[TSDRep markTextureDirty](self, "markTextureDirty");
  self->mTextureDeliveryStyle = a3;
}

- (void)setTextureByGlyphStyle:(int)a3
{
  if (self->mTextureByGlyphStyle != a3)
    -[TSDRep markTextureDirty](self, "markTextureDirty");
  self->mTextureByGlyphStyle = a3;
}

- (void)setTextureActionAttributes:(id)a3
{
  TSDTextureSet *mTexture;
  NSDictionary *v6;

  if (a3 || self->mTextureActionAttributes)
  {
    mTexture = self->mTexture;
    if ((!mTexture || !-[TSDTextureSet alternateLayer](mTexture, "alternateLayer"))
      && (objc_msgSend(a3, "isEqualToDictionary:", self->mTextureActionAttributes) & 1) == 0)
    {

      if (a3)
        v6 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:", a3);
      else
        v6 = 0;
      self->mTextureActionAttributes = v6;
      -[TSDRep markTextureDirty](self, "markTextureDirty");
    }
  }
}

- (CGAffineTransform)unRotatedTransform:(SEL)a3
{
  __int128 v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  CGFloat v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGAffineTransform v19;
  CGAffineTransform t1;
  CGAffineTransform v21;

  v7 = *(_OWORD *)&a4->c;
  *(_OWORD *)&v21.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&v21.c = v7;
  *(_OWORD *)&v21.tx = *(_OWORD *)&a4->tx;
  v8 = TSDTransformAngle(&v21.a);
  -[TSDRep centerForRotation](self, "centerForRotation");
  v10 = v9;
  v12 = v11;
  v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v21.c = v13;
  *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&t1.a = *(_OWORD *)&v21.a;
  *(_OWORD *)&t1.c = v13;
  *(_OWORD *)&t1.tx = *(_OWORD *)&v21.tx;
  CGAffineTransformTranslate(&v21, &t1, v9, v12);
  v19 = v21;
  CGAffineTransformRotate(&t1, &v19, v8 * -3.14159265 / 180.0);
  v21 = t1;
  v19 = t1;
  CGAffineTransformTranslate(&t1, &v19, -v10, -v12);
  v21 = t1;
  v14 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.c = v14;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
  if (TSDIsTransformFlipped(&t1.a))
  {
    v15 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t1.c = v15;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a4->tx;
    *(_OWORD *)&v19.a = *(_OWORD *)&v21.a;
    *(_OWORD *)&v19.c = *(_OWORD *)&v21.c;
    v16 = *(_OWORD *)&v21.tx;
  }
  else
  {
    t1 = v21;
    v17 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v19.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v19.c = v17;
    v16 = *(_OWORD *)&a4->tx;
  }
  *(_OWORD *)&v19.tx = v16;
  return CGAffineTransformConcat(retstr, &t1, &v19);
}

- (void)p_setMagicMoveTextureAttributes:(id)a3
{
  double v5;

  objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "geometry"), "angle");
  objc_msgSend(a3, "setTextureAngle:", v5 * 0.0174532925);
  -[TSDRep naturalBounds](self, "naturalBounds");
  objc_msgSend(a3, "setTextureContentRect:");
  objc_msgSend(a3, "setTextureZOrder:", objc_msgSend(-[TSDCanvas topLevelReps](-[TSDRep canvas](self, "canvas"), "topLevelReps"), "indexOfObject:", self));
}

- (id)textureForContext:(id)a3
{
  uint64_t v5;
  void *v6;
  TSDLayout *v7;
  NSDictionary *mTextureActionAttributes;
  id v9;
  float v10;
  float v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  TSDTextureSet *v32;
  TSDTexturedRectangle *v33;
  double v34;
  double v35;
  TSDTexturedRectangle *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  double v46;
  CGFloat x;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[7];
  CGRect v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  _BYTE v64[128];
  uint64_t v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  v65 = *MEMORY[0x24BDAC8D0];
  if (self->mTexture
    && objc_msgSend(a3, "isEqual:", self->mTextureContext)
    && !-[TSDRep temporaryMixingLayout](self, "temporaryMixingLayout"))
  {
    return self->mTexture;
  }
  v5 = objc_msgSend(a3, "isMagicMove");
  v6 = (void *)TSUProtocolCast();
  memset(&v63, 0, sizeof(v63));
  v7 = -[TSDRep layout](self, "layout");
  if (v7)
    -[TSDAbstractLayout transformInRoot](v7, "transformInRoot");
  else
    memset(&v63, 0, sizeof(v63));
  mTextureActionAttributes = self->mTextureActionAttributes;
  if (mTextureActionAttributes)
  {
    v9 = -[NSDictionary valueForKey:](mTextureActionAttributes, "valueForKey:", CFSTR("sfx-action-rotation-angle"));
    if (v9)
    {
      objc_msgSend(v9, "floatValue");
      v11 = v10 * 0.0174532925;
      -[TSDRep centerForRotation](self, "centerForRotation");
      v13 = v12;
      v15 = v14;
      v61 = v63;
      CGAffineTransformTranslate(&v62, &v61, v12, v14);
      v63 = v62;
      v61 = v62;
      CGAffineTransformRotate(&v62, &v61, v11);
      v63 = v62;
      v61 = v62;
      CGAffineTransformTranslate(&v62, &v61, -v13, -v15);
      v63 = v62;
    }
  }
  if ((_DWORD)v5)
  {
    v61 = v63;
    -[TSDRep unRotatedTransform:](self, "unRotatedTransform:", &v61);
    v63 = v62;
  }
  -[TSDCanvas viewScale](self->mCanvas, "viewScale");
  v17 = v16;
  -[TSDRep clipRect](self, "clipRect");
  x = v66.origin.x;
  y = v66.origin.y;
  width = v66.size.width;
  height = v66.size.height;
  v62 = v63;
  v67 = CGRectApplyAffineTransform(v66, &v62);
  v21 = TSDMultiplyRectScalar(v67.origin.x, v67.origin.y, v67.size.width, v67.size.height, v17);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[TSDRep naturalBounds](self, "naturalBounds");
  v62 = v63;
  v69 = CGRectApplyAffineTransform(v68, &v62);
  v46 = TSDMultiplyRectScalar(v69.origin.x, v69.origin.y, v69.size.width, v69.size.height, v17);
  v70.origin.x = v21;
  v70.origin.y = v23;
  v70.size.width = v25;
  v70.size.height = v27;
  v71 = CGRectIntegral(v70);
  v28 = v71.origin.x;
  v29 = v71.origin.y;
  v30 = v71.size.width;
  v31 = v71.size.height;
  v53[0] = MEMORY[0x24BDAC760];
  v53[1] = 3221225472;
  v53[2] = __28__TSDRep_textureForContext___block_invoke;
  v53[3] = &unk_24D82B740;
  v54 = v71;
  v55 = x;
  v56 = y;
  v57 = width;
  v58 = height;
  v59 = v17;
  v60 = v63;
  v48 = a3;
  v53[4] = a3;
  v53[5] = self;
  v53[6] = v6;
  v32 = objc_alloc_init(TSDTextureSet);
  v33 = [TSDTexturedRectangle alloc];
  v34 = TSDSubtractPoints(v28, v29, v46);
  v36 = -[TSDTexturedRectangle initWithSize:offset:renderBlock:](v33, "initWithSize:offset:renderBlock:", v53, v30, v31, v34, v35);
  v37 = v5;
  if ((_DWORD)v5)
  {
    if ((objc_msgSend(v48, "shouldNotAddContainedReps") & 1) == 0)
    {
      v38 = objc_msgSend(MEMORY[0x24BDD16A8], "string");
      if (v6)
      {
        v39 = (void *)v38;
        v51 = 0u;
        v52 = 0u;
        v49 = 0u;
        v50 = 0u;
        v40 = (void *)objc_msgSend(v6, "childReps");
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v50;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v50 != v43)
                objc_enumerationMutation(v40);
              objc_msgSend(v39, "appendFormat:", CFSTR("%@ "), objc_opt_class());
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v49, v64, 16);
          }
          while (v42);
        }
      }
    }
  }
  -[TSDTextureSet setIsMagicMove:](v32, "setIsMagicMove:", v37);
  -[TSDTexturedRectangle setTextureType:](v36, "setTextureType:", 5);
  -[TSDTexturedRectangle setTextureOpacity:](v36, "setTextureOpacity:", 1.0);
  -[TSDTextureSet addRenderable:](v32, "addRenderable:", v36);

  -[TSDRep opacity](self, "opacity");
  -[TSDTextureSet setTextureOpacity:](v32, "setTextureOpacity:");
  -[TSDRep centerForRotation](self, "centerForRotation");
  -[TSDTextureSet setCenter:](v32, "setCenter:");
  if ((objc_msgSend(v48, "shouldNotCacheTexture") & 1) == 0)
  {
    -[TSDRep setTextureContext:](self, "setTextureContext:", v48);
    -[TSDRep setTexture:](self, "setTexture:", v32);
  }
  return v32;
}

uint64_t __28__TSDRep_textureForContext___block_invoke(uint64_t a1, CGContextRef c)
{
  double v4;
  double v5;
  CGContext *v6;
  __int128 v7;
  uint64_t result;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  CGAffineTransform transform;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  CGContextSetAllowsFontSmoothing(c, 0);
  CGContextSetAllowsFontSubpixelQuantization(c, 0);
  CGContextTranslateCTM(c, -*(double *)(a1 + 56), -*(double *)(a1 + 64));
  if (objc_msgSend(*(id *)(a1 + 32), "shouldDistortToFit"))
  {
    v4 = *(double *)(a1 + 72) / *(double *)(a1 + 104);
    v5 = *(double *)(a1 + 80) / *(double *)(a1 + 112);
    v6 = c;
  }
  else
  {
    v4 = *(double *)(a1 + 120);
    v6 = c;
    v5 = v4;
  }
  CGContextScaleCTM(v6, v4, v5);
  v7 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)&transform.a = *(_OWORD *)(a1 + 128);
  *(_OWORD *)&transform.c = v7;
  *(_OWORD *)&transform.tx = *(_OWORD *)(a1 + 160);
  CGContextConcatCTM(c, &transform);
  CGContextSaveGState(c);
  objc_msgSend(*(id *)(a1 + 40), "drawInContext:", c);
  CGContextRestoreGState(c);
  result = objc_msgSend(*(id *)(a1 + 32), "shouldNotAddContainedReps");
  if ((result & 1) == 0)
  {
    result = *(_QWORD *)(a1 + 48);
    if (result)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v9 = (void *)objc_msgSend((id)result, "childReps", 0);
      result = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (result)
      {
        v10 = result;
        v11 = *(_QWORD *)v15;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
            CGContextSaveGState(c);
            objc_msgSend(v13, "recursivelyDrawInContext:", c);
            CGContextRestoreGState(c);
            ++v12;
          }
          while (v10 != v12);
          result = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          v10 = result;
        }
        while (result);
      }
    }
  }
  return result;
}

- (BOOL)shouldLayoutTilingLayer:(id)a3
{
  return -[TSDInteractiveCanvasController shouldLayoutTilingLayer:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "shouldLayoutTilingLayer:", a3);
}

- (BOOL)canDrawTilingLayerInBackground:(id)a3
{
  return !-[TSDRep mustDrawTilingLayerOnMainThread:](self, "mustDrawTilingLayerOnMainThread:", a3)
      && -[TSDInteractiveCanvasController supportsBackgroundTileRendering](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "supportsBackgroundTileRendering")&& -[TSDInteractiveCanvasController currentlyScrolling](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling");
}

- (BOOL)mustDrawTilingLayerOnMainThread:(id)a3
{
  return -[TSDInteractiveCanvasController mustDrawTilingLayerOnMainThread:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "mustDrawTilingLayerOnMainThread:", a3);
}

- (CGRect)visibleBoundsForTilingLayer:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TSDInteractiveCanvasController visibleBoundsForTilingLayer:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "visibleBoundsForTilingLayer:", a3);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)queueForDrawingTilingLayerInBackground:(id)a3
{
  return -[TSDInteractiveCanvasController queueForDrawingTilingLayerInBackground:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController", a3), "queueForDrawingTilingLayerInBackground:", -[TSDInteractiveCanvasController layerForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self));
}

- (BOOL)shouldBeginDrawingTilingLayerInBackground:(id)a3 returningToken:(id *)a4 andQueue:(id *)a5
{
  TSDInteractiveCanvasController *v8;

  v8 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController", a3);
  return -[TSDInteractiveCanvasController shouldBeginDrawingTilingLayerInBackground:returningToken:andQueue:](v8, "shouldBeginDrawingTilingLayerInBackground:returningToken:andQueue:", -[TSDInteractiveCanvasController layerForRep:](v8, "layerForRep:", self), a4, a5);
}

- (void)didEndDrawingTilingLayerInBackground:(id)a3 withToken:(id)a4
{
  TSDInteractiveCanvasController *v6;

  v6 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController", a3);
  -[TSDInteractiveCanvasController didEndDrawingTilingLayerInBackground:withToken:](v6, "didEndDrawingTilingLayerInBackground:withToken:", -[TSDInteractiveCanvasController layerForRep:](v6, "layerForRep:", self), a4);
}

- (BOOL)repDirectlyManagesContentsScaleOfLayer:(id)a3
{
  return 0;
}

- (void)processChangedProperty:(int)a3
{
  if (a3 <= 520)
  {
    if (a3 != 512)
    {
      if (a3 == 513)
        -[TSDRep invalidateKnobPositions](self, "invalidateKnobPositions");
      return;
    }
LABEL_7:
    -[TSDRep invalidateKnobs](self, "invalidateKnobs");
    return;
  }
  if (a3 == 521 || a3 == 524)
    goto LABEL_7;
}

- (id)beginEditing
{
  return 0;
}

- (BOOL)canEditWithEditor:(id)a3
{
  return 0;
}

- (void)willUpdateLayer:(id)a3
{
  _BOOL8 v5;

  v5 = (objc_msgSend(a3, "shouldRasterize") & 1) != 0 || -[TSDRep forceRasterization](self, "forceRasterization");
  objc_msgSend(a3, "setShouldRasterize:", v5);
}

- (id)additionalLayersUnderLayer
{
  return 0;
}

- (id)additionalLayersOverLayer
{
  return -[TSDRep p_addLayersForKnobsToArray:withDelegate:isOverlay:](self, "p_addLayersForKnobsToArray:withDelegate:isOverlay:", objc_msgSend(MEMORY[0x24BDBCEB8], "array"), -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), 0);
}

- (BOOL)shouldShowCommentHighlight
{
  void *v3;
  BOOL v4;
  BOOL v5;
  char v6;

  objc_opt_class();
  -[TSDRep info](self, "info");
  v3 = (void *)TSUDynamicCast();
  v4 = -[TSDInteractiveCanvasController shouldDisplayCommentUIForInfo:](-[TSDCanvas canvasController](-[TSDRep canvas](self, "canvas"), "canvasController"), "shouldDisplayCommentUIForInfo:", v3);
  if (self)
  {
    do
    {
      v5 = -[TSDRep isBeingRotated](self, "isBeingRotated");
      if (v5)
        break;
      self = -[TSDRep parentRep](self, "parentRep");
    }
    while (self);
    v6 = !v5;
    if (v3)
      goto LABEL_5;
    return 0;
  }
  v6 = 1;
  if (!v3)
    return 0;
LABEL_5:
  if (objc_msgSend(v3, "comment"))
    return v4 & v6;
  else
    return 0;
}

- (void)invalidateAnnotationColor
{
  if (-[TSDRep shouldShowCommentHighlight](self, "shouldShowCommentHighlight"))
    -[TSDInteractiveCanvasController invalidateLayers](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "invalidateLayers");
  -[TSDRep invalidateKnobs](self, "invalidateKnobs");
}

- (id)allLayers
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", -[TSDInteractiveCanvasController layerForRep:](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self));
  objc_msgSend(v3, "addObjectsFromArray:", -[TSDRep additionalLayersOverLayer](self, "additionalLayersOverLayer"));
  objc_msgSend(v3, "addObjectsFromArray:", -[TSDRep additionalLayersUnderLayer](self, "additionalLayersUnderLayer"));
  objc_msgSend(v3, "addObjectsFromArray:", -[TSDRep overlayLayers](self, "overlayLayers"));
  return v3;
}

- (BOOL)masksToBounds
{
  return 0;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)isDraggable
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

- (int)dragTypeAtCanvasPoint:(CGPoint)a3
{
  if (objc_msgSend(-[TSDRep repForSelecting](self, "repForSelecting", a3.x, a3.y), "isSelected"))
    return 3;
  else
    return 1;
}

- (int)dragHUDAndGuidesTypeAtCanvasPoint:(CGPoint)a3
{
  return 2;
}

- (BOOL)isPlaceholder
{
  return 0;
}

- (BOOL)isLocked
{
  void *v3;

  objc_opt_class();
  -[TSDRep info](self, "info");
  v3 = (void *)TSUDynamicCast();
  return v3 && (objc_msgSend(v3, "isLocked") & 1) != 0
      || -[TSDRep isLocked](-[TSDRep parentRep](self, "parentRep"), "isLocked");
}

- (BOOL)handlesEditMenu
{
  return 0;
}

- (id)itemsToAddToEditMenu
{
  return 0;
}

- (CGRect)targetRectForEditMenu
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF070];
  v3 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF070] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)adjustedKnobForComputingResizeGeometry:(unint64_t)a3
{
  unint64_t v5;

  if (objc_msgSend(-[TSDRep info](self, "info"), "isAnchoredToText")
    && (objc_opt_class(),
        -[TSDRep info](self, "info"),
        (objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "exteriorTextWrap"), "isHTMLWrap") & 1) != 0)
    || objc_msgSend(-[TSDRep info](self, "info"), "isInlineWithText"))
  {
    v5 = 9;
    if (a3 != 7)
      v5 = a3;
    if (a3 == 4)
      return 6;
    else
      return v5;
  }
  return a3;
}

- (double)opacity
{
  return 1.0;
}

- (BOOL)resizeFromCenterOnly
{
  return 0;
}

- (BOOL)wantsGuidesWhileResizing
{
  return !-[TSDLayout isInGroup](-[TSDRep layout](self, "layout"), "isInGroup");
}

- (CGPoint)centerForRotation
{
  double v2;
  double v3;
  CGPoint result;

  -[TSDLayout centerForRotation](-[TSDRep layout](self, "layout"), "centerForRotation");
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)directlyManagesLayerContent
{
  return 0;
}

- (int)tilingMode
{
  return 0;
}

- (BOOL)canDrawInBackgroundDuringScroll
{
  return 0;
}

- (BOOL)canDrawInParallel
{
  return 0;
}

- (BOOL)mustDrawOnMainThreadForInteractiveCanvas
{
  return 0;
}

- (id)i_queueForTileProvider
{
  int64_t *p_mTileProviderQueueLock;
  int64_t mTileProviderQueueLock;
  _QWORD block[5];

  mTileProviderQueueLock = self->mTileProviderQueueLock;
  p_mTileProviderQueueLock = &self->mTileProviderQueueLock;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__TSDRep_i_queueForTileProvider__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = self;
  if (mTileProviderQueueLock != -1)
    dispatch_once(p_mTileProviderQueueLock, block);
  return self->mTileProviderQueue;
}

dispatch_queue_t __32__TSDRep_i_queueForTileProvider__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_queue_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "canDrawInParallel"))
    v2 = MEMORY[0x24BDAC9C0];
  else
    v2 = 0;
  result = dispatch_queue_create("com.apple.iwork.TSDTileProvider", v2);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 256) = result;
  return result;
}

- (id)i_tileQueue
{
  int64_t *p_mTileQueueOnce;
  int64_t mTileQueueOnce;
  _QWORD block[5];

  mTileQueueOnce = self->mTileQueueOnce;
  p_mTileQueueOnce = &self->mTileQueueOnce;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __21__TSDRep_i_tileQueue__block_invoke;
  block[3] = &unk_24D829278;
  block[4] = self;
  if (mTileQueueOnce != -1)
    dispatch_once(p_mTileQueueOnce, block);
  return self->mTileQueue;
}

TSDTilingBackgroundQueue *__21__TSDRep_i_tileQueue__block_invoke(uint64_t a1)
{
  TSDTilingBackgroundQueue *result;

  result = -[TSDTilingBackgroundQueue initWithAccessController:]([TSDTilingBackgroundQueue alloc], "initWithAccessController:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "canvas"), "accessController"));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232) = result;
  return result;
}

- (void)i_shutdownTileQueue
{
  -[TSDTilingBackgroundQueue shutdown](self->mTileQueue, "shutdown");
}

- (BOOL)wantsToDistortWithImagerContext
{
  return 0;
}

- (NSArray)hyperlinkRegions
{
  void *v3;
  void *v4;
  void *v5;
  TSDHyperlinkRegion *v6;

  objc_opt_class();
  -[TSDRep info](self, "info");
  v3 = (void *)TSUDynamicCast();
  if (!v3)
    return 0;
  v4 = v3;
  if (!objc_msgSend(v3, "hyperlinkURL"))
    return 0;
  if (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "hyperlinkURL"), "absoluteString"), "length"))
    return 0;
  objc_opt_class();
  -[TSDRep layout](self, "layout");
  v5 = (void *)TSUDynamicCast();
  if (!v5)
    return 0;
  v6 = -[TSDHyperlinkRegion initWithURL:bezierPath:]([TSDHyperlinkRegion alloc], "initWithURL:bezierPath:", objc_msgSend(v4, "hyperlinkURL"), objc_msgSend(v5, "i_wrapPath"));
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v6);
}

- (void)willReplaceContentsFromRep:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = -[TSDRep info](self, "info");
  if (v5 != (id)objc_msgSend(a3, "info"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRep willReplaceContentsFromRep:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 3350, CFSTR("Reps do not share a common info:\n%@\n%@"), self, a3);
  }
}

- (void)replaceContentsFromRep:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = -[TSDRep info](self, "info");
  if (v5 != (id)objc_msgSend(a3, "info"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDRep replaceContentsFromRep:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDRep.m"), 3357, CFSTR("Reps do not share a common info:\n%@\n%@"), self, a3);
  }
}

- (id)delegateConformingToProtocol:(id)a3 forRep:(id)a4
{
  return 0;
}

- (TSDCanvas)canvas
{
  return self->mCanvas;
}

- (BOOL)forceRasterization
{
  return self->mForceRasterization;
}

- (void)setForceRasterization:(BOOL)a3
{
  self->mForceRasterization = a3;
}

- (TSDLayout)temporaryMixingLayout
{
  return self->mTemporaryMixingLayout;
}

- (void)setTemporaryMixingLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (TSDContainerRep)parentRep
{
  return self->mParentRep;
}

- (TSDKnobTracker)currentKnobTracker
{
  return self->mKnobTracker;
}

- (void)setCurrentKnobTracker:(id)a3
{
  self->mKnobTracker = (TSDKnobTracker *)a3;
}

- (TSDTextureSet)texture
{
  return self->mTexture;
}

- (unint64_t)textureDeliveryStyle
{
  return self->mTextureDeliveryStyle;
}

- (int)textureByGlyphStyle
{
  return self->mTextureByGlyphStyle;
}

- (TSDTextureContext)textureContext
{
  return self->mTextureContext;
}

- (void)setTextureContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)textureStage
{
  return self->mTextureStage;
}

- (NSDictionary)textureActionAttributes
{
  return self->mTextureActionAttributes;
}

- (NSDictionary)textureAnimationInfo
{
  return self->mTextureAnimationInfo;
}

- (id)subviewsController
{
  TSDContainerRep *v3;

  if (-[TSDRep parentRep](self, "parentRep"))
    v3 = -[TSDRep parentRep](self, "parentRep");
  else
    v3 = -[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost");
  return -[TSDRep subviewsController](v3, "subviewsController");
}

- (CGRect)i_partition_deepClipRect
{
  double v2;
  CGFloat x;
  double v4;
  CGFloat y;
  double v6;
  CGFloat width;
  double v8;
  CGFloat height;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;
  CGRect v35;

  v30 = *MEMORY[0x24BDAC8D0];
  -[TSDRep clipRect](self, "clipRect");
  x = v2;
  y = v4;
  width = v6;
  height = v8;
  v10 = (void *)TSUProtocolCast();
  if (v10)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v11 = (void *)objc_msgSend(v10, "childReps");
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
          memset(&v24, 0, sizeof(v24));
          v17 = (void *)objc_msgSend((id)objc_msgSend(v16, "layout"), "geometry");
          if (v17)
            objc_msgSend(v17, "transform");
          else
            memset(&v23, 0, sizeof(v23));
          CGAffineTransformInvert(&v24, &v23);
          objc_msgSend(v16, "i_partition_deepClipRect");
          v22 = v24;
          v35 = CGRectApplyAffineTransform(v31, &v22);
          v32.origin.x = x;
          v32.origin.y = y;
          v32.size.width = width;
          v32.size.height = height;
          v33 = CGRectUnion(v32, v35);
          x = v33.origin.x;
          y = v33.origin.y;
          width = v33.size.width;
          height = v33.size.height;
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }
  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)allowTrackingContainedRep:(id)a3
{
  return 1;
}

@end
