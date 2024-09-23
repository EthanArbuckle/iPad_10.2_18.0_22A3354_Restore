@implementation TSDCanvas

- (TSDCanvas)init
{
  TSDCanvas *v2;
  TSDCanvas *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDCanvas;
  v2 = -[TSDCanvas init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->mViewScale = 1.0;
    v2->mUnscaledSize = (CGSize)vdupq_n_s64(0x4059000000000000uLL);
    *(_OWORD *)&v2->mContentInset.top = TSDEdgeInsetsZero;
    *(_OWORD *)&v2->mContentInset.bottom = *(_OWORD *)&qword_217C29098;
    v2->mInfos = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    v3->mTopLevelReps = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
    v3->mAllReps = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCF20]);
    v3->mRepsByLayout = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 0);
    v3->mLayoutController = -[TSDLayoutController initWithCanvas:]([TSDLayoutController alloc], "initWithCanvas:", v3);
    *(_WORD *)&v3->mClipToCanvas = 257;
    v3->mContentsScale = 1.0;
    v3->mWideGamut = 1;
  }
  return v3;
}

- (id)initForTemporaryLayout
{
  id result;

  result = -[TSDCanvas init](self, "init");
  if (result)
    *((_BYTE *)result + 72) = 1;
  return result;
}

- (void)teardown
{
  -[TSDCanvas setPInTearDown:](self, "setPInTearDown:", 1);

  self->mInfos = 0;
  -[TSDLayoutController i_removeAllLayouts](-[TSDCanvas layoutController](self, "layoutController"), "i_removeAllLayouts");

  self->mLayoutController = 0;
  -[TSDCanvas p_removeAllReps](self, "p_removeAllReps");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDCanvasDelegate canvasDidUpdateRepsFromLayouts:](self->mDelegate, "canvasDidUpdateRepsFromLayouts:", self);
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  __CFDictionary *mRepsByLayout;
  objc_super v6;

  if (self->mInfos)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvas dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvas.m"), 100, CFSTR("Canvas must be torn down before being deallocated"));
  }
  -[TSDLayoutController setInfos:](self->mLayoutController, "setInfos:", 0);

  self->mLayoutController = 0;
  mRepsByLayout = self->mRepsByLayout;
  if (mRepsByLayout)
  {
    CFRelease(mRepsByLayout);
    self->mRepsByLayout = 0;
  }

  self->mTopLevelReps = 0;
  self->mAllReps = 0;

  self->mAllRepsOrdered = 0;
  self->mInfos = 0;

  self->mPreviouslyVisibleLayouts = 0;
  CGColorRelease(self->mBackgroundColor);
  v6.receiver = self;
  v6.super_class = (Class)TSDCanvas;
  -[TSDCanvas dealloc](&v6, sel_dealloc);
}

- (TSKDocumentRoot)documentRoot
{
  return (TSKDocumentRoot *)-[TSDCanvasDelegate documentRoot](self->mDelegate, "documentRoot");
}

- (TSPObjectContext)objectContext
{
  return -[TSPObject context](-[TSDCanvas documentRoot](self, "documentRoot"), "context");
}

- (TSKChangeNotifier)changeNotifier
{
  return -[TSKDocumentRoot changeNotifier](-[TSDCanvas documentRoot](self, "documentRoot"), "changeNotifier");
}

- (TSKAccessController)accessController
{
  return -[TSKDocumentRoot accessController](-[TSDCanvas documentRoot](self, "documentRoot"), "accessController");
}

- (void)i_setCanvasController:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (self->mCanvasController)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvas i_setCanvasController:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvas.m"), 154, CFSTR("expected nil value for '%s'"), "mCanvasController");
  }
  if (!a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvas i_setCanvasController:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvas.m"), 155, CFSTR("invalid nil value for '%s'"), "icc");
  }
  if (!self->mCanvasController)
    self->mCanvasController = (TSDInteractiveCanvasController *)a3;
}

- (TSDInteractiveCanvasController)canvasController
{
  return self->mCanvasController;
}

- (void)setInfosToDisplay:(id)a3
{
  -[TSDCanvas i_setInfosToDisplay:updatingLayoutController:](self, "i_setInfosToDisplay:updatingLayoutController:", a3, 1);
}

- (void)i_setInfosToDisplay:(id)a3 updatingLayoutController:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *v7;

  v4 = a4;

  if (a3)
    v7 = (NSArray *)objc_msgSend(a3, "copy");
  else
    v7 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCE30]);
  self->mInfos = v7;
  if (v4)
    -[TSDCanvas i_updateInfosInLayoutController](self, "i_updateInfosInLayoutController");
}

- (void)i_updateInfosInLayoutController
{
  -[TSDLayoutController setInfos:](-[TSDCanvas layoutController](self, "layoutController"), "setInfos:", self->mInfos);
}

- (id)repForLayout:(id)a3
{
  if (a3)
    return (id)CFDictionaryGetValue(self->mRepsByLayout, a3);
  else
    return 0;
}

- (id)topLevelReps
{
  return self->mTopLevelReps;
}

- (id)allReps
{
  return self->mAllReps;
}

- (NSArray)allRepsOrdered
{
  NSArray *mAllRepsOrdered;
  void *v4;
  NSArray *mTopLevelReps;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  mAllRepsOrdered = self->mAllRepsOrdered;
  if (!mAllRepsOrdered)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    mTopLevelReps = self->mTopLevelReps;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](mTopLevelReps, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(mTopLevelReps);
          objc_msgSend((id)objc_opt_class(), "p_recursivelyAddOrderedChildrenOfRep:toArray:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), v4);
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](mTopLevelReps, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    mAllRepsOrdered = (NSArray *)objc_msgSend(v4, "copy");
    self->mAllRepsOrdered = mAllRepsOrdered;
  }
  return mAllRepsOrdered;
}

- (void)recreateAllLayoutsAndReps
{
  -[TSDLayoutController i_removeAllLayouts](-[TSDCanvas layoutController](self, "layoutController"), "i_removeAllLayouts");
  -[TSDCanvas p_updateRepsFromLayouts](self, "p_updateRepsFromLayouts");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDCanvasDelegate canvasDidUpdateRepsFromLayouts:](self->mDelegate, "canvasDidUpdateRepsFromLayouts:", self);
  -[TSDLayoutController setInfos:](-[TSDCanvas layoutController](self, "layoutController"), "setInfos:", self->mInfos);
  -[TSDCanvas layoutInvalidated](self, "layoutInvalidated");
}

- (void)layoutInvalidated
{
  *(_BYTE *)&self->mInvalidFlags |= 1u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDCanvasDelegate canvasLayoutInvalidated:](self->mDelegate, "canvasLayoutInvalidated:", self);
}

- (void)invalidateReps
{
  *(_BYTE *)&self->mInvalidFlags |= 2u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDCanvasDelegate canvasLayoutInvalidated:](self->mDelegate, "canvasLayoutInvalidated:", self);
}

- (void)invalidateVisibleBounds
{
  *(_BYTE *)&self->mInvalidFlags |= 4u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDCanvasDelegate canvasLayoutInvalidated:](self->mDelegate, "canvasLayoutInvalidated:", self);
}

- (void)invalidateLayers
{
  *(_BYTE *)&self->mInvalidFlags |= 8u;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDCanvasDelegate canvasLayoutInvalidated:](self->mDelegate, "canvasLayoutInvalidated:", self);
}

- (void)layoutIfNeeded
{
  void *v3;
  uint64_t v4;

  -[TSDCanvas p_layoutWithReadLock](self, "p_layoutWithReadLock");
  if ((*(_BYTE *)&self->mInvalidFlags & 0xF) == 1 && !self->mInLayout)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDCanvas layoutIfNeeded]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDCanvas.m"), 302, CFSTR("failed to clear mInvalidFlags after layout"));
  }
}

- (BOOL)i_needsLayout
{
  return (*(_BYTE *)&self->mInvalidFlags & 0xF) != 0;
}

- (BOOL)supportsAdaptiveLayout
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDCanvasDelegate supportsAdaptiveLayout](self->mDelegate, "supportsAdaptiveLayout");
  else
    return 0;
}

- (id)layoutGeometryProviderForLayout:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[TSDCanvasDelegate canvas:layoutGeometryProviderForLayout:](self->mDelegate, "canvas:layoutGeometryProviderForLayout:", self, a3);
  else
    return 0;
}

- (BOOL)spellCheckingSupported
{
  int v3;

  v3 = -[TSDCanvas isCanvasInteractive](self, "isCanvasInteractive");
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      LOBYTE(v3) = -[TSDCanvasDelegate spellCheckingSupported](self->mDelegate, "spellCheckingSupported");
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)spellCheckingSuppressed
{
  int v3;

  v3 = !-[TSDCanvas spellCheckingSupported](self, "spellCheckingSupported");
  if ((v3 & 1) != 0)
    return 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDCanvasDelegate spellCheckingSuppressed](self->mDelegate, "spellCheckingSuppressed") | v3;
  return 0;
}

- (BOOL)isCanvasInteractive
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDCanvasDelegate isCanvasInteractive](self->mDelegate, "isCanvasInteractive");
  else
    return 0;
}

- (BOOL)isPrinting
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDCanvasDelegate isPrintingCanvas](self->mDelegate, "isPrintingCanvas");
  else
    return 0;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDCanvasDelegate shouldShowTextOverflowGlyphs](self->mDelegate, "shouldShowTextOverflowGlyphs");
  else
    return 1;
}

- (BOOL)shouldShowInstructionalText
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDCanvasDelegate shouldShowInstructionalText](self->mDelegate, "shouldShowInstructionalText");
  if (-[TSDCanvas isCanvasInteractive](self, "isCanvasInteractive"))
    return 1;
  return -[TSDCanvas isTemporaryForLayout](self, "isTemporaryForLayout");
}

- (BOOL)shouldSuppressBackgrounds
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDCanvasDelegate shouldSuppressBackgrounds](self->mDelegate, "shouldSuppressBackgrounds");
  else
    return 0;
}

- (BOOL)isDrawingIntoPDF
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDCanvasDelegate isCanvasDrawingIntoPDF:](self->mDelegate, "isCanvasDrawingIntoPDF:", self);
  else
    return 0;
}

- (void)i_setContentsScale:(double)a3
{
  self->mContentsScale = a3;
}

- (double)contentsScale
{
  return self->mContentsScale;
}

- (void)i_setCanvasIsWideGamut:(BOOL)a3
{
  self->mWideGamut = a3;
}

- (BOOL)canvasIsWideGamut
{
  return self->mWideGamut;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  CGColor *mBackgroundColor;
  CGColor *Copy;

  mBackgroundColor = self->mBackgroundColor;
  if (mBackgroundColor != a3)
  {
    CGColorRelease(mBackgroundColor);
    if (a3)
      Copy = CGColorCreateCopy(a3);
    else
      Copy = 0;
    self->mBackgroundColor = Copy;
  }
}

- (CGRect)convertUnscaledToBoundsRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = TSDMultiplyRectScalar(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, self->mViewScale);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)convertBoundsToUnscaledRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = TSDMultiplyRectScalar(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 1.0 / self->mViewScale);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGPoint)convertUnscaledToBoundsPoint:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = TSDMultiplyPointScalar(a3.x, a3.y, self->mViewScale);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)convertBoundsToUnscaledPoint:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = TSDMultiplyPointScalar(a3.x, a3.y, 1.0 / self->mViewScale);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGSize)convertUnscaledToBoundsSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = TSDMultiplySizeScalar(a3.width, a3.height, self->mViewScale);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)convertBoundsToUnscaledSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = TSDMultiplySizeScalar(a3.width, a3.height, 1.0 / self->mViewScale);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGRect)visibleUnscaledRectForClippingReps
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDCanvasDelegate visibleScaledBoundsForClippingRepsOnCanvas:](self->mDelegate, "visibleScaledBoundsForClippingRepsOnCanvas:", self);
    -[TSDCanvas convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
  }
  else
  {
    -[TSDCanvas p_bounds](self, "p_bounds");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)hitRep:(CGPoint)a3 inTopLevelReps:(id)a4 smallRepOutset:(double)a5 withGesture:(id)a6 passingTest:(id)a7
{
  double y;
  double x;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  void *v30;
  id obj;
  uint64_t v33;
  uint64_t v34;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  y = a3.y;
  x = a3.x;
  v53 = *MEMORY[0x24BDAC8D0];
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v13 = (void *)objc_msgSend(a4, "reverseObjectEnumerator");
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v47;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v47 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v18, "convertNaturalPointFromUnscaledCanvas:", x, y);
        v19 = (void *)objc_msgSend(v18, "hitRepChrome:passingTest:", a7);
        if (v19)
          return v19;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
      if (v15)
        continue;
      break;
    }
  }
  v45 = 0x7FF0000000000000;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_msgSend(a4, "reverseObjectEnumerator");
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
  if (!v34)
    return 0;
  v20 = 0;
  v33 = *(_QWORD *)v42;
  while (2)
  {
    for (j = 0; j != v34; ++j)
    {
      if (*(_QWORD *)v42 != v33)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
      objc_msgSend(v22, "convertNaturalPointFromUnscaledCanvas:", x, y);
      v23 = objc_msgSend(v22, "hitRep:withGesture:passingTest:", a6, a7);
      if (v23)
      {
        v30 = (void *)v23;
        goto LABEL_38;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = (void *)objc_msgSend(v22, "allRepsContainedInGroup");
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v38;
          do
          {
            for (k = 0; k != v26; ++k)
            {
              if (*(_QWORD *)v38 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k);
              if ((!a7
                 || (*((unsigned int (**)(id, _QWORD))a7 + 2))(a7, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k)))&& -[TSDCanvas p_expandHitRegionOfPoint:forRep:smallRepOutset:forShortestDistance:](self, "p_expandHitRegionOfPoint:forRep:smallRepOutset:forShortestDistance:", v29, &v45, x, y, a5))
              {
                v20 = v22;
              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
          }
          while (v26);
        }
      }
      else if (-[TSDCanvas p_expandHitRegionOfPoint:forRep:smallRepOutset:forShortestDistance:](self, "p_expandHitRegionOfPoint:forRep:smallRepOutset:forShortestDistance:", v22, &v45, x, y, a5)&& (!a7 || (*((unsigned int (**)(id, void *))a7 + 2))(a7, v22)))
      {
        v20 = v22;
      }
    }
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v34)
      continue;
    break;
  }
  v30 = 0;
LABEL_38:
  if (v20)
  {
    if (!-[TSDCanvas p_shouldRep:countAsClosestSmallRepForSizeLimit:](self, "p_shouldRep:countAsClosestSmallRepForSizeLimit:", v30, a5))
    {
      v36 = 0;
      objc_msgSend(v30, "convertNaturalPointFromUnscaledCanvas:", x, y);
      objc_msgSend(v30, "shortestDistanceToPoint:countAsHit:", &v36);
      if (!v36)
        return v20;
    }
  }
  return v30;
}

- (BOOL)p_shouldRep:(id)a3 countAsClosestSmallRepForSizeLimit:(double)a4
{
  int v7;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  double v13;

  v7 = objc_msgSend(a3, "shouldExpandHitRegionWhenSmall");
  if (v7)
  {
    objc_msgSend(a3, "naturalBounds");
    v9 = v8;
    objc_msgSend(a3, "naturalBounds");
    v11 = v10;
    v12 = fminf(v9, v11);
    -[TSDCanvas viewScale](self, "viewScale");
    LOBYTE(v7) = v13 * v12 < a4;
  }
  return v7;
}

- (BOOL)p_expandHitRegionOfPoint:(CGPoint)a3 forRep:(id)a4 smallRepOutset:(double)a5 forShortestDistance:(double *)a6
{
  double y;
  double x;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
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
  CGFloat v29;
  CGFloat v30;
  CGFloat width;
  CGFloat height;
  CGFloat v33;
  CGFloat v34;
  _BOOL4 v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  CGFloat v46;
  CGFloat v47;
  char v48;
  CGPoint v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  y = a3.y;
  x = a3.x;
  if (!-[TSDCanvas p_shouldRep:countAsClosestSmallRepForSizeLimit:](self, "p_shouldRep:countAsClosestSmallRepForSizeLimit:", a5))
  {
    v48 = 0;
    objc_msgSend(a4, "convertNaturalPointFromUnscaledCanvas:", x, y);
    objc_msgSend(a4, "shortestDistanceToPoint:countAsHit:", &v48);
    if (!v48)
      goto LABEL_11;
    goto LABEL_9;
  }
  objc_msgSend(a4, "naturalBounds");
  v46 = v13;
  v47 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(a4, "naturalBounds");
  v19 = v18;
  -[TSDCanvas viewScale](self, "viewScale");
  v21 = v20 * v19;
  v22 = 0.0;
  v23 = 0.0;
  if (v21 < a5)
  {
    -[TSDCanvas viewScale](self, "viewScale");
    v23 = -a5 / v24;
  }
  objc_msgSend(a4, "naturalBounds");
  v26 = v25;
  -[TSDCanvas viewScale](self, "viewScale");
  if (v27 * v26 < a5)
  {
    -[TSDCanvas viewScale](self, "viewScale");
    v22 = -a5 / v28;
  }
  v50.origin.y = v46;
  v50.origin.x = v47;
  v50.size.width = v15;
  v50.size.height = v17;
  v51 = CGRectInset(v50, v23, v22);
  v29 = v51.origin.x;
  v30 = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  objc_msgSend(a4, "convertNaturalPointFromUnscaledCanvas:", x, y);
  v49.x = v33;
  v49.y = v34;
  v52.origin.x = v29;
  v52.origin.y = v30;
  v52.size.width = width;
  v52.size.height = height;
  v35 = CGRectContainsPoint(v52, v49);
  if (v35)
  {
    objc_msgSend(a4, "convertNaturalPointFromUnscaledCanvas:", x, y);
    v37 = v36;
    v39 = v38;
    objc_msgSend(a4, "naturalBounds");
    TSDDistanceToRect(v37, v39, v40, v41, v42, v43);
LABEL_9:
    if (v44 < *a6)
    {
      *a6 = v44;
      LOBYTE(v35) = 1;
      return v35;
    }
LABEL_11:
    LOBYTE(v35) = 0;
  }
  return v35;
}

- (void)i_registerRep:(id)a3
{
  const void *v5;

  if (a3 && self->mRepsByLayout)
  {
    v5 = (const void *)objc_msgSend(a3, "layout");
    if (v5)
      CFDictionarySetValue(self->mRepsByLayout, v5, a3);
  }
}

- (void)i_unregisterRep:(id)a3
{
  const void *v5;
  const void *v6;

  if (a3)
  {
    if (self->mRepsByLayout)
    {
      v5 = (const void *)objc_msgSend(a3, "layout");
      if (v5)
      {
        v6 = v5;
        if (CFDictionaryGetValue(self->mRepsByLayout, v5) == a3)
          CFDictionaryRemoveValue(self->mRepsByLayout, v6);
      }
    }
  }
}

- (CGRect)i_approximateScaledFrameOfEditingMenuAtPoint:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = TSDRectWithCenterAndSize(a3.x, a3.y + -30.0, 200.0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)i_unscaledRectOfLayouts
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDLayoutController rectOfTopLevelLayouts](-[TSDCanvas layoutController](self, "layoutController"), "rectOfTopLevelLayouts");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)i_clipRectForCreatingRepsFromLayouts
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDCanvasDelegate visibleScaledBoundsForClippingRepsOnCanvas:](self->mDelegate, "visibleScaledBoundsForClippingRepsOnCanvas:", self);
    -[TSDCanvas convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
  }
  else
  {
    v3 = *MEMORY[0x24BDBF028];
    v4 = *(double *)(MEMORY[0x24BDBF028] + 8);
    v5 = *(double *)(MEMORY[0x24BDBF028] + 16);
    v6 = *(double *)(MEMORY[0x24BDBF028] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)i_drawBackgroundInContext:(CGContext *)a3
{
  CGRect ClipBoundingBox;
  CGRect v6;

  ClipBoundingBox = CGContextGetClipBoundingBox(a3);
  v6 = CGRectIntegral(ClipBoundingBox);
  -[TSDCanvas i_drawBackgroundInContext:bounds:](self, "i_drawBackgroundInContext:bounds:", a3, v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

- (void)i_drawBackgroundInContext:(CGContext *)a3 bounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v10;

  if (self->mBackgroundColor)
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    CGContextSaveGState(a3);
    CGContextSetFillColorWithColor(a3, self->mBackgroundColor);
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    CGContextFillRect(a3, v10);
    CGContextRestoreGState(a3);
  }
}

- (void)addBitmapsToRenderingQualityInfo:(id)a3 inContext:(CGContext *)a4
{
  NSArray *mTopLevelReps;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    mTopLevelReps = self->mTopLevelReps;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](mTopLevelReps, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(mTopLevelReps);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "recursivelyPerformSelector:withObject:withObject:", sel_addBitmapsToRenderingQualityInfo_inContext_, a3, a4);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](mTopLevelReps, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
}

- (void)i_drawRepsInContext:(CGContext *)a3 distort:(CGAffineTransform *)a4
{
  _BOOL4 v7;
  NSArray *mTopLevelReps;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  CGAffineTransform v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    CGContextSaveGState(a3);
    CGContextScaleCTM(a3, self->mViewScale, self->mViewScale);
    v7 = a4->b == 0.0
      && a4->c == 0.0
      && a4->tx == 0.0
      && a4->ty == 0.0
      && fabs(a4->a + -1.0) < 0.001
      && fabs(a4->d + -1.0) < 0.001;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    mTopLevelReps = self->mTopLevelReps;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](mTopLevelReps, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(mTopLevelReps);
          v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          CGContextSaveGState(a3);
          if (!v7 || objc_msgSend(v13, "wantsToDistortWithImagerContext"))
          {
            v14 = *(_OWORD *)&a4->c;
            *(_OWORD *)&v15.a = *(_OWORD *)&a4->a;
            *(_OWORD *)&v15.c = v14;
            *(_OWORD *)&v15.tx = *(_OWORD *)&a4->tx;
            CGContextConcatCTM(a3, &v15);
          }
          objc_msgSend(v13, "recursivelyDrawInContext:", a3);
          CGContextRestoreGState(a3);
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](mTopLevelReps, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }
    CGContextRestoreGState(a3);
  }
}

- (void)i_drawRepsInContext:(CGContext *)a3
{
  __int128 v3;
  _OWORD v4[3];

  v3 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v4[0] = *MEMORY[0x24BDBD8B8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  -[TSDCanvas i_drawRepsInContext:distort:](self, "i_drawRepsInContext:distort:", a3, v4);
}

- (void)i_clipsImagesToBounds:(BOOL)a3
{
  self->mClipToCanvas = a3;
}

- (CGImage)i_image
{
  return -[TSDCanvas i_imageInScaledRect:](self, "i_imageInScaledRect:", *MEMORY[0x24BDBF028], *(double *)(MEMORY[0x24BDBF028] + 8), *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
}

- (CGImage)i_imageInScaledRect:(CGRect)a3
{
  return -[TSDCanvas i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:](self, "i_imageInScaledRect:withTargetIntegralSize:distortedToMatch:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8));
}

- (CGImage)i_imageInScaledRect:(CGRect)a3 withTargetIntegralSize:(CGSize)a4 distortedToMatch:(BOOL)a5
{
  _BOOL8 v5;
  CGContext *v7;
  CGContext *v8;
  CGImage *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v5 = a5;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v7 = -[TSDCanvas i_createContextToDrawImageInScaledRect:withTargetIntegralSize:returningBounds:integralBounds:](self, "i_createContextToDrawImageInScaledRect:withTargetIntegralSize:returningBounds:integralBounds:", &v13, &v11, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.width, a4.height);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = -[TSDCanvas i_newImageInContext:bounds:integralBounds:distortedToMatch:](self, "i_newImageInContext:bounds:integralBounds:distortedToMatch:", v7, v5, v13, v14, v11, v12);
  CGContextRelease(v8);
  return v9;
}

- (CGContext)i_createContextToDrawImageInScaledRect:(CGRect)a3 withTargetIntegralSize:(CGSize)a4 returningBounds:(CGRect *)a5 integralBounds:(CGRect *)a6
{
  double v8;
  double v9;
  double y;
  double x;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
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
  double v27;
  CGColor *mBackgroundColor;
  char v29;
  char v30;
  CGContext *result;
  double height;
  double width;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  height = a4.height;
  width = a4.width;
  v8 = a3.size.height;
  v9 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->mClipToCanvas)
  {
    -[TSDCanvas p_bounds](self, "p_bounds");
    v34.origin.x = TSDMultiplyRectScalar(v13, v14, v15, v16, self->mViewScale);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = v9;
    v37.size.height = v8;
    v35 = CGRectIntersection(v34, v37);
    x = v35.origin.x;
    y = v35.origin.y;
    v9 = v35.size.width;
    v8 = v35.size.height;
  }
  v17 = TSDRoundedRect(x, y, v9, v8);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  if (width > 0.0 && height > 0.0)
  {
    v24 = TSDCeilSize(width);
    v26 = v21 - v24;
    v27 = v23 - v25;
    if (v21 - v24 > 0.0 || v27 > 0.0)
    {
      if (v26 > 0.0)
        v21 = v24;
      if (v27 > 0.0)
        v23 = v25;
    }
    else if (v26 < 0.0 && v27 < 0.0)
    {
      if (v26 <= v27)
        v23 = v25;
      else
        v21 = v24;
    }
  }
  if (TSDNearlyEqualRects(x, y, v9, v8, v17, v19, v21, v23))
  {
    x = v17;
    y = v19;
    v9 = v21;
    v8 = v23;
  }
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = v9;
  v36.size.height = v8;
  v38.origin.x = v17;
  v38.origin.y = v19;
  v38.size.width = v21;
  v38.size.height = v23;
  if (CGRectEqualToRect(v36, v38)
    && (mBackgroundColor = self->mBackgroundColor) != 0
    && CGColorGetAlpha(mBackgroundColor) == 1.0)
  {
    v29 = 1;
  }
  else
  {
    v29 = 3;
  }
  if (-[TSDCanvas canvasIsWideGamut](self, "canvasIsWideGamut", *(_QWORD *)&height))
    v30 = v29 | 0x20;
  else
    v30 = v29;
  result = TSDBitmapContextCreate(v30, v21);
  if (a5)
  {
    a5->origin.x = x;
    a5->origin.y = y;
    a5->size.width = v9;
    a5->size.height = v8;
  }
  if (a6)
  {
    a6->origin.x = v17;
    a6->origin.y = v19;
    a6->size.width = v21;
    a6->size.height = v23;
  }
  return result;
}

- (CGImage)i_newImageInContext:(CGContext *)a3 bounds:(CGRect)a4 integralBounds:(CGRect)a5 distortedToMatch:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  __int128 v15;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGRect v19;

  if (!a3)
    return 0;
  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4.size.height;
  v12 = a4.size.width;
  CGContextSaveGState(a3);
  CGContextTranslateCTM(a3, 0.0, height);
  CGContextScaleCTM(a3, 1.0, -1.0);
  CGContextTranslateCTM(a3, -x, -y);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  CGContextClipToRect(a3, v19);
  v15 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v18.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v18.c = v15;
  *(_OWORD *)&v18.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  if (v6)
    CGAffineTransformMakeScale(&v18, width / v12, height / v11);
  -[TSDCanvas i_drawBackgroundInContext:](self, "i_drawBackgroundInContext:", a3);
  v17 = v18;
  -[TSDCanvas i_drawRepsInContext:distort:](self, "i_drawRepsInContext:distort:", a3, &v17);
  CGContextRestoreGState(a3);
  return CGBitmapContextCreateImage(a3);
}

- (CGRect)p_bounds
{
  double v3;
  double top;
  double left;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v3 = TSDRectWithSize();
  top = self->mContentInset.top;
  left = self->mContentInset.left;
  v6 = v3 + left;
  v8 = top + v7;
  v10 = v9 - (left + self->mContentInset.right);
  v12 = v11 - (top + self->mContentInset.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (void)p_layoutWithReadLock
{
  char mInvalidFlags;
  BOOL v4;

  if (self->mInLayout)
    return;
  self->mInLayout = 1;
  mInvalidFlags = (char)self->mInvalidFlags;
  if ((mInvalidFlags & 3) != 0)
  {
    if ((*(_BYTE *)&self->mInvalidFlags & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[TSDCanvasDelegate canvasWillLayout:](self->mDelegate, "canvasWillLayout:", self);
      -[TSDLayoutController validateLayouts](-[TSDCanvas layoutController](self, "layoutController"), "validateLayouts");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[TSDCanvasDelegate canvasDidValidateLayouts:](self->mDelegate, "canvasDidValidateLayouts:", self);
    }
    goto LABEL_10;
  }
  if ((*(_BYTE *)&self->mInvalidFlags & 4) != 0)
  {
LABEL_10:
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TSDCanvasDelegate canvasWillUpdateRepsFromLayouts:](self->mDelegate, "canvasWillUpdateRepsFromLayouts:", self);
    v4 = -[TSDCanvas p_updateRepsFromLayouts](self, "p_updateRepsFromLayouts");
    *(_BYTE *)&self->mInvalidFlags &= 0xF9u;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TSDCanvasDelegate canvasDidUpdateVisibleBounds:](self->mDelegate, "canvasDidUpdateVisibleBounds:", self);
    goto LABEL_14;
  }
  v4 = 0;
LABEL_14:
  if ((mInvalidFlags & 1) != 0 || v4 || (*(_BYTE *)&self->mInvalidFlags & 8) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TSDCanvasDelegate canvasDidUpdateRepsFromLayouts:](self->mDelegate, "canvasDidUpdateRepsFromLayouts:", self);
    *(_BYTE *)&self->mInvalidFlags &= ~8u;
    if ((mInvalidFlags & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      -[TSDCanvasDelegate canvasDidLayout:](self->mDelegate, "canvasDidLayout:", self);
  }
  *(_BYTE *)&self->mInvalidFlags &= ~1u;
  self->mInLayout = 0;
}

- (BOOL)p_updateRepsFromLayouts
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  uint64_t v31;
  TSDCanvas *v33;
  NSSet *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  NSArray *mTopLevelReps;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  void *v46;
  NSSet *mAllReps;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t ii;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t jj;
  uint64_t v57;
  char *v58;
  NSArray *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  -[TSDCanvas i_clipRectForCreatingRepsFromLayouts](self, "i_clipRectForCreatingRepsFromLayouts");
  v7 = -[TSDLayoutController layoutsInRect:](-[TSDCanvas layoutController](self, "layoutController"), "layoutsInRect:", v3, v4, v5, v6);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)-[TSDCanvasDelegate additionalVisibleInfosForCanvas:](self->mDelegate, "additionalVisibleInfosForCanvas:", self);
    v88 = 0u;
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v89;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v89 != v11)
            objc_enumerationMutation(v8);
          v13 = -[TSDLayoutController layoutForInfo:](self->mLayoutController, "layoutForInfo:", TSDTopmostInfoFromInfo(*(void **)(*((_QWORD *)&v88 + 1) + 8 * i)));
          if (v13)
          {
            v14 = v13;
            if ((objc_msgSend(v7, "containsObject:", v13) & 1) == 0)
              v7 = (id)objc_msgSend(v7, "arrayByAddingObject:", v14);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
      }
      while (v10);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = (void *)-[TSDCanvasDelegate infosToHideForCanvas:](self->mDelegate, "infosToHideForCanvas:", self);
    if (objc_msgSend(v15, "count"))
    {
      v16 = (void *)objc_msgSend(v7, "mutableCopy");
      v84 = 0u;
      v85 = 0u;
      v86 = 0u;
      v87 = 0u;
      v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v85;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v85 != v19)
              objc_enumerationMutation(v7);
            v21 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
            if (objc_msgSend(v15, "containsObject:", objc_msgSend(v21, "info")))
              objc_msgSend(v16, "removeObject:", v21);
          }
          v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
        }
        while (v18);
      }
      v7 = v16;
    }
  }
  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v23 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v81;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v81 != v25)
          objc_enumerationMutation(v7);
        objc_msgSend(v22, "addObjectsFromArray:", objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * k), "additionalLayoutsForRepCreation"));
      }
      v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
    }
    while (v24);
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v27 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v77;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v77 != v29)
          objc_enumerationMutation(v22);
        v31 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * m);
        if ((objc_msgSend(v7, "containsObject:", v31) & 1) == 0)
          v7 = (id)objc_msgSend(v7, "arrayByAddingObject:", v31);
      }
      v28 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
    }
    while (v28);
  }

  if ((*(_BYTE *)&self->mInvalidFlags & 3) == 0
    && (objc_msgSend(v7, "isEqualToArray:", self->mPreviouslyVisibleLayouts) & 1) != 0)
  {
    return 0;
  }

  v33 = self;
  self->mPreviouslyVisibleLayouts = (NSArray *)v7;
  v59 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v34 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v35 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v95, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v73;
    do
    {
      v38 = 0;
      v58 = sel_canvas_willLayoutRep_;
      do
      {
        if (*(_QWORD *)v73 != v37)
          objc_enumerationMutation(v7);
        v39 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v38);
        v40 = -[TSDCanvas repForLayout:](v33, "repForLayout:", v39, v58);
        if (v40)
          goto LABEL_52;
        v40 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend(v39, "repClassOverride")), "initWithLayout:canvas:", v39, v33);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[TSDCanvasDelegate canvas:willLayoutRep:](v33->mDelegate, "canvas:willLayoutRep:", v33, v40);
        objc_msgSend(v40, "wasAddedToParent");
        if (v40)
        {
LABEL_52:
          objc_msgSend(v40, "setParentRep:", 0);
          -[NSArray addObject:](v59, "addObject:", v40);
          objc_msgSend(v40, "updateChildrenFromLayout");
          objc_msgSend(v40, "recursivelyPerformSelector:", sel_updateFromLayout);
          objc_msgSend(v40, "recursivelyPerformSelector:withObject:", sel_addToSet_, v34);

        }
        ++v38;
      }
      while (v36 != v38);
      v36 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v72, v95, 16);
    }
    while (v36);
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  mTopLevelReps = v33->mTopLevelReps;
  v42 = -[NSArray countByEnumeratingWithState:objects:count:](mTopLevelReps, "countByEnumeratingWithState:objects:count:", &v68, v94, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v69;
    do
    {
      for (n = 0; n != v43; ++n)
      {
        if (*(_QWORD *)v69 != v44)
          objc_enumerationMutation(mTopLevelReps);
        v46 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * n);
        if ((-[NSArray tsu_containsObjectIdenticalTo:](v59, "tsu_containsObjectIdenticalTo:", v46) & 1) == 0)
          objc_msgSend(v46, "willBeRemovedFromParent");
      }
      v43 = -[NSArray countByEnumeratingWithState:objects:count:](mTopLevelReps, "countByEnumeratingWithState:objects:count:", &v68, v94, 16);
    }
    while (v43);
  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  mAllReps = v33->mAllReps;
  v48 = -[NSSet countByEnumeratingWithState:objects:count:](mAllReps, "countByEnumeratingWithState:objects:count:", &v64, v93, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v65;
    do
    {
      for (ii = 0; ii != v49; ++ii)
      {
        if (*(_QWORD *)v65 != v50)
          objc_enumerationMutation(mAllReps);
        v52 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * ii);
        if (!-[NSSet containsObject:](v34, "containsObject:", v52))
          objc_msgSend(v52, "i_willBeRemoved");
      }
      v49 = -[NSSet countByEnumeratingWithState:objects:count:](mAllReps, "countByEnumeratingWithState:objects:count:", &v64, v93, 16);
    }
    while (v49);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v53 = -[NSSet countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v60, v92, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v61;
      do
      {
        for (jj = 0; jj != v54; ++jj)
        {
          if (*(_QWORD *)v61 != v55)
            objc_enumerationMutation(v34);
          v57 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * jj);
          if (!-[NSSet containsObject:](v33->mAllReps, "containsObject:", v57))
            -[TSDCanvasDelegate canvas:createdRep:](v33->mDelegate, "canvas:createdRep:", v33, v57);
        }
        v54 = -[NSSet countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v60, v92, 16);
      }
      while (v54);
    }
  }
  -[NSArray sortUsingComparator:](v59, "sortUsingComparator:", &__block_literal_global_43);

  v33->mAllReps = v34;
  v33->mTopLevelReps = v59;

  v33->mAllRepsOrdered = 0;
  return 1;
}

uint64_t __36__TSDCanvas_p_updateRepsFromLayouts__block_invoke()
{
  void *v0;
  void *v1;

  objc_opt_class();
  v0 = (void *)TSUDynamicCast();
  objc_opt_class();
  v1 = (void *)TSUDynamicCast();
  if (objc_msgSend(v0, "forcesPlacementOnTop") && (objc_msgSend(v1, "forcesPlacementOnTop") & 1) != 0)
    return 0;
  if ((objc_msgSend(v0, "forcesPlacementOnTop") & 1) != 0)
    return 1;
  return objc_msgSend(v1, "forcesPlacementOnTop") << 63 >> 63;
}

- (void)p_removeAllReps
{
  NSArray *mTopLevelReps;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSSet *mAllReps;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  mTopLevelReps = self->mTopLevelReps;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](mTopLevelReps, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(mTopLevelReps);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "willBeRemovedFromParent");
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](mTopLevelReps, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  mAllReps = self->mAllReps;
  v9 = -[NSSet countByEnumeratingWithState:objects:count:](mAllReps, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(mAllReps);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * j), "i_willBeRemoved");
      }
      v10 = -[NSSet countByEnumeratingWithState:objects:count:](mAllReps, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

  self->mAllReps = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  self->mTopLevelReps = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);

  self->mAllRepsOrdered = 0;
}

+ (void)p_recursivelyAddOrderedChildrenOfRep:(id)a3 toArray:(id)a4
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
  objc_msgSend(a4, "addObject:");
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
        objc_msgSend(a1, "p_recursivelyAddOrderedChildrenOfRep:toArray:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), a4);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (BOOL)pInTearDown
{
  return self->pInTearDown;
}

- (void)setPInTearDown:(BOOL)a3
{
  self->pInTearDown = a3;
}

- (TSDCanvasDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (TSDCanvasDelegate *)a3;
}

- (NSArray)infosToDisplay
{
  return self->mInfos;
}

- (TSDLayoutController)layoutController
{
  return self->mLayoutController;
}

- (CGColor)backgroundColor
{
  return self->mBackgroundColor;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->mContentInset.top;
  left = self->mContentInset.left;
  bottom = self->mContentInset.bottom;
  right = self->mContentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->mContentInset = a3;
}

- (BOOL)allowsFontSubpixelQuantization
{
  return self->mAllowsFontSubpixelQuantization;
}

- (void)setAllowsFontSubpixelQuantization:(BOOL)a3
{
  self->mAllowsFontSubpixelQuantization = a3;
}

- (CGSize)unscaledSize
{
  double width;
  double height;
  CGSize result;

  width = self->mUnscaledSize.width;
  height = self->mUnscaledSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setUnscaledSize:(CGSize)a3
{
  self->mUnscaledSize = a3;
}

- (double)viewScale
{
  return self->mViewScale;
}

- (void)setViewScale:(double)a3
{
  self->mViewScale = a3;
}

- (BOOL)isTemporaryForLayout
{
  return self->mIsTemporaryForLayout;
}

- (id)textRendererForLayer:(id)a3 context:(CGContext *)a4
{
  TSWPRenderer *v7;
  double v8;
  _BOOL8 v9;

  v7 = -[TSWPRenderer initWithContext:]([TSWPRenderer alloc], "initWithContext:", a4);
  if (TSDCGContextIsShadowContext((uint64_t)a4))
  {
    -[TSWPRenderer setFlipShadows:](v7, "setFlipShadows:", 1);
    v8 = 1.0;
  }
  else
  {
    v9 = a3 && (objc_msgSend(a3, "contentsAreFlipped") & 1) != 0 || -[TSDCanvas isPrinting](self, "isPrinting");
    -[TSWPRenderer setFlipShadows:](v7, "setFlipShadows:", v9);
    -[TSDCanvas viewScale](self, "viewScale");
  }
  -[TSWPRenderer setViewScale:](v7, "setViewScale:", v8);
  return v7;
}

@end
