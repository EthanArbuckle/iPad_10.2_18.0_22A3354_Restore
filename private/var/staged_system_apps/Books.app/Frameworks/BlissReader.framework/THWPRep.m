@implementation THWPRep

- (THWPRep)initWithLayout:(id)a3 canvas:(id)a4
{
  THWPRep *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWPRep;
  result = -[THWPRep initWithLayout:canvas:](&v5, "initWithLayout:canvas:", a3, a4);
  if (result)
    result->mHighlightController = 0;
  __dmb(0xBu);
  return result;
}

- (void)p_cleanup
{
  -[CALayer setDelegate:](self->mBackgroundHighlightLayer, "setDelegate:", 0);
  -[CALayer removeFromSuperlayer](self->mBackgroundHighlightLayer, "removeFromSuperlayer");

  self->mBackgroundHighlightLayer = 0;
  -[THWPRep setActiveHighlightLayers:](self, "setActiveHighlightLayers:", 0);
  -[TSKHighlightArrayController disconnect](self->mLinkPulseArrayController, "disconnect");
  -[TSKHighlightArrayController reset](self->mLinkPulseArrayController, "reset");

  self->mLinkPulseArrayController = 0;
  -[THWPRep setLinkPulseSearchReferences:](self, "setLinkPulseSearchReferences:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[THWPRep setHighlightController:](self, "setHighlightController:", 0);
  -[THWPRep p_cleanup](self, "p_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)THWPRep;
  -[THWPRep dealloc](&v3, "dealloc");
}

- (void)willBeRemoved
{
  THWPHighlightController *mHighlightController;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWPRep;
  -[THWPRep willBeRemoved](&v4, "willBeRemoved");
  objc_sync_enter(self);
  mHighlightController = self->mHighlightController;
  if (mHighlightController)
    -[THWPHighlightController parentWillBeRemovedFromCanvas:](mHighlightController, "parentWillBeRemovedFromCanvas:", self);
  objc_sync_exit(self);
  -[THWPRep p_cleanup](self, "p_cleanup");
}

- (BOOL)canReadHighlights
{
  uint64_t v3;
  uint64_t v4;

  if (!-[THWPRep storageContentNode](self, "storageContentNode")
    || (objc_msgSend(-[THWPRep storage](self, "storage"), "preventHighlighting") & 1) != 0
    || !objc_msgSend(-[THWPRep canvas](self, "canvas"), "isCanvasInteractive")
    || (objc_opt_respondsToSelector(-[THWPRep interactiveCanvasController](self, "interactiveCanvasController"), "supportsReadingHighlights") & 1) == 0)
  {
    return 0;
  }
  v4 = objc_opt_class(THInteractiveCanvasController, v3);
  return objc_msgSend((id)TSUDynamicCast(v4, -[THWPRep interactiveCanvasController](self, "interactiveCanvasController")), "supportsReadingHighlights");
}

- (BOOL)canWriteHighlights
{
  uint64_t v3;
  uint64_t v4;

  if (!-[THWPRep storageContentNode](self, "storageContentNode")
    || !-[THWPRep canReadHighlights](self, "canReadHighlights")
    || !objc_msgSend(-[THWPRep canvas](self, "canvas"), "isCanvasInteractive")
    || (objc_opt_respondsToSelector(-[THWPRep interactiveCanvasController](self, "interactiveCanvasController"), "supportsWritingHighlights") & 1) == 0)
  {
    return 0;
  }
  v4 = objc_opt_class(THInteractiveCanvasController, v3);
  return objc_msgSend((id)TSUDynamicCast(v4, -[THWPRep interactiveCanvasController](self, "interactiveCanvasController")), "supportsWritingHighlights");
}

- (THWPHighlightController)highlightController
{
  _QWORD block[5];

  if (-[THWPRep canReadHighlights](self, "canReadHighlights"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_92034;
    block[3] = &unk_426DD0;
    block[4] = self;
    if (self->mHighlightControllerOnceToken != -1)
      dispatch_once(&self->mHighlightControllerOnceToken, block);
  }
  return self->mHighlightController;
}

- (THModelContentNode)storageContentNode
{
  return (THModelContentNode *)objc_msgSend(objc_msgSend(objc_msgSend(-[THWPRep layout](self, "layout"), "sectionLayout"), "info"), "contentNode");
}

- (id)backgroundHighlightLayer
{
  id result;
  CALayer *v4;

  result = self->mBackgroundHighlightLayer;
  if (!result)
  {
    v4 = (CALayer *)objc_alloc_init((Class)CALayer);
    self->mBackgroundHighlightLayer = v4;
    -[CALayer setAnchorPoint:](v4, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
    -[CALayer setEdgeAntialiasingMask:](self->mBackgroundHighlightLayer, "setEdgeAntialiasingMask:", 0);
    -[CALayer setDelegate:](self->mBackgroundHighlightLayer, "setDelegate:", self);
    -[CALayer setPosition:](self->mBackgroundHighlightLayer, "setPosition:", CGPointZero.x, CGPointZero.y);
    -[CALayer setZPosition:](self->mBackgroundHighlightLayer, "setZPosition:", -2.1);
    objc_msgSend(-[THWPRep canvas](self, "canvas"), "contentsScale");
    -[CALayer setContentsScale:](self->mBackgroundHighlightLayer, "setContentsScale:");
    return self->mBackgroundHighlightLayer;
  }
  return result;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  THWPHighlightController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  NSArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  id v22;
  NSEnumerator *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v36.receiver = self;
  v36.super_class = (Class)THWPRep;
  -[THWPRep addAdditionalChildLayersToArray:](&v36, "addAdditionalChildLayersToArray:");
  if (-[THWPRep canReadHighlights](self, "canReadHighlights"))
  {
    v5 = -[THWPRep highlightController](self, "highlightController");
    objc_msgSend(-[THWPRep interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(-[THWPRep canvas](self, "canvas"), "viewScale");
    v15 = -[THWPHighlightController highlightLayersInCanvasUnscaledRect:scale:](v5, "highlightLayersInCanvasUnscaledRect:scale:", v7, v9, v11, v13, v14);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v16 = -[THWPRep activeHighlightLayers](self, "activeHighlightLayers");
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v15, "containsObject:", v21) & 1) == 0)
            objc_msgSend(v21, "removeFromSuperlayer");
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      }
      while (v18);
    }
    -[THWPRep setActiveHighlightLayers:](self, "setActiveHighlightLayers:", v15);
    if (-[NSArray count](-[THWPRep activeHighlightLayers](self, "activeHighlightLayers"), "count"))
    {
      v22 = -[THWPRep backgroundHighlightLayer](self, "backgroundHighlightLayer");
      objc_msgSend(a3, "insertObject:atIndex:", v22, 0);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v23 = -[NSArray reverseObjectEnumerator](-[THWPRep activeHighlightLayers](self, "activeHighlightLayers", 0), "reverseObjectEnumerator");
      v24 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v25; j = (char *)j + 1)
          {
            if (*(_QWORD *)v29 != v26)
              objc_enumerationMutation(v23);
            objc_msgSend(v22, "insertSublayer:atIndex:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j), 0);
          }
          v25 = -[NSEnumerator countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        }
        while (v25);
      }
    }
    -[THWPRep addMarginNoteLayersToArray:](self, "addMarginNoteLayersToArray:", a3);
  }
}

- (BOOL)shouldBeginEditingWithGesture:(id)a3
{
  unsigned int v5;
  id v6;
  BOOL result;
  id v8;

  if ((objc_opt_respondsToSelector(objc_msgSend(-[THWPRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"), "interactiveCanvasController:shouldBeginEditingTHWPRep:withGesture:") & 1) != 0)
  {
    v5 = objc_msgSend(objc_msgSend(-[THWPRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"), "interactiveCanvasController:shouldBeginEditingTHWPRep:withGesture:", -[THWPRep interactiveCanvasController](self, "interactiveCanvasController"), self, a3);
    v6 = objc_msgSend(a3, "gestureKind");
    if (!v5)
      return 0;
  }
  else
  {
    v6 = objc_msgSend(a3, "gestureKind");
  }
  v8 = v6;
  if (v6 == (id)TSWPTapAndTouch
    || -[THWPRep p_shouldStartEditingOnPress](self, "p_shouldStartEditingOnPress") && v8 == (id)TSWPImmediatePress)
  {
    return 1;
  }
  result = -[THWPRep p_shouldStartEditingOnLongPress](self, "p_shouldStartEditingOnLongPress");
  if (v8 != (id)TSWPLongPress)
    return 0;
  return result;
}

- (BOOL)canEditWithEditor:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;

  v5 = objc_opt_class(TSWPEditingController, a2);
  v6 = (void *)TSUDynamicCast(v5, a3);
  if (v6)
  {
    v7 = objc_msgSend(v6, "storage");
    if (v7 == -[THWPRep storage](self, "storage"))
      LOBYTE(v6) = objc_msgSend(-[THWPRep parentRep](self, "parentRep"), "isLocked") ^ 1;
    else
      LOBYTE(v6) = 0;
  }
  return (char)v6;
}

- (id)repForDragging
{
  return 0;
}

- (_NSRange)rangeIntersectingFirstOverlappingColumnOfRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSUInteger v10;
  NSRange v11;
  NSUInteger v12;
  NSUInteger v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  NSRange v19;
  _NSRange result;
  NSRange v21;

  length = a3.length;
  location = a3.location;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = -[THWPRep columns](self, "columns", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v21.location = (NSUInteger)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), "range");
        v21.length = v10;
        v19.location = location;
        v19.length = length;
        v11 = NSIntersectionRange(v19, v21);
        if (v11.length)
        {
          length = v11.length;
          location = v11.location;
          goto LABEL_11;
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPRep rangeIntersectingFirstOverlappingColumnOfRange:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPRep.mm"), 307, CFSTR("Couldn't find any column that intersects range"));
LABEL_11:
  v12 = location;
  v13 = length;
  result.length = v13;
  result.location = v12;
  return result;
}

- (CGRect)rectForHighlight:(_NSRange)a3 lineHasAttachment:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger length;
  NSUInteger location;
  TSWPStorage *v8;
  NSUInteger v9;
  uint64_t v10;
  TSWPSelection *v11;
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
  double v26;
  double v27;
  _NSRange v28;
  CGRect result;

  v4 = a4;
  length = a3.length;
  location = a3.location;
  v8 = (TSWPStorage *)-[THWPRep storage](self, "storage");
  v28.location = location;
  v28.length = length;
  v9 = THTrimHighlightRange(v8, v28);
  v11 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v9, v10);
  -[THWPRep boundsRectForSelection:](self, "boundsRectForSelection:", v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (v4)
  {
    -[THWPRep rectForSelection:](self, "rectForSelection:", v11);
    if (v23 > v19)
    {
      v13 = v20;
      v15 = v21;
      v17 = v22;
      v19 = v23;
    }
  }
  v24 = TSDRoundedRectForMainScreen(v13, v15, v17, v19);
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (double)firstLineBaseline
{
  id v2;
  double *v3;

  v2 = objc_msgSend(-[THWPRep columns](self, "columns"), "firstObject");
  if (!objc_msgSend(v2, "countLines"))
    return 0.0;
  v3 = (double *)objc_msgSend(v2, "lineFragmentAtIndex:", 0);
  return v3[4] + v3[5];
}

- (CGRect)popoverPresentationRectForRange:(_NSRange)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  TSWPStorage *v11;
  id v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  uint64_t v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  uint64_t v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double MinX;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  double MaxX;
  double v61;
  double MaxY;
  double MinY;
  double v64;
  double v65;
  double v66;
  double v67;
  CGRect r2;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _NSRange v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect result;
  CGRect v95;
  CGRect v96;

  v4 = -[THWPRep lineSelectionsForSelection:](self, "lineSelectionsForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3.location, a3.length));
  v5 = +[NSMutableArray array](NSMutableArray, "array");
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v73 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);
        v11 = (TSWPStorage *)-[THWPRep storage](self, "storage");
        v12 = objc_msgSend(v10, "range");
        v14 = v13;
        v78.location = (NSUInteger)v12;
        v78.length = v14;
        v15 = THTrimHighlightRange(v11, v78);
        if (v16)
          objc_msgSend(v5, "addObject:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", v15, v16));
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    }
    while (v7);
  }
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  if (objc_msgSend(v5, "count") == (char *)&dword_0 + 2)
  {
    v21 = objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 0), "range");
    -[THWPRep rectForHighlight:lineHasAttachment:](self, "rectForHighlight:lineHasAttachment:", v21, v22, objc_msgSend(-[THWPRep storage](self, "storage"), "rangeContainsAttachment:", v21, v22));
    x = v23;
    y = v24;
    width = v25;
    height = v26;
    v27 = objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 1), "range");
    -[THWPRep rectForHighlight:lineHasAttachment:](self, "rectForHighlight:lineHasAttachment:", v27, v28, objc_msgSend(-[THWPRep storage](self, "storage"), "rangeContainsAttachment:", v27, v28));
    v30 = v29;
    r2.origin.y = v31;
    v33 = v32;
    v35 = v34;
    v79.origin.x = x;
    v79.origin.y = y;
    v79.size.width = width;
    v79.size.height = height;
    MinX = CGRectGetMinX(v79);
    v80.origin.x = v30;
    v80.origin.y = r2.origin.y;
    v80.size.width = v33;
    v80.size.height = v35;
    if (MinX <= CGRectGetMaxX(v80))
    {
      v81.origin.x = x;
      v81.origin.y = y;
      v81.size.width = width;
      v81.size.height = height;
      v95.origin.x = v30;
      v95.origin.y = r2.origin.y;
      v95.size.width = v33;
      v95.size.height = v35;
      v82 = CGRectUnion(v81, v95);
      x = v82.origin.x;
      y = v82.origin.y;
      width = v82.size.width;
      height = v82.size.height;
    }
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
    r2.size = 0u;
    v69 = 0u;
    v37 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &r2.size, v76, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(_QWORD *)v69 != v39)
            objc_enumerationMutation(v5);
          v41 = *(void **)(*(_QWORD *)&r2.size.height + 8 * (_QWORD)j);
          objc_msgSend(v41, "range");
          if (v42)
          {
            v43 = objc_msgSend(v41, "range");
            v45 = v44;
            v46 = -[THWPRep storage](self, "storage");
            v47 = objc_msgSend(v41, "range");
            -[THWPRep rectForHighlight:lineHasAttachment:](self, "rectForHighlight:lineHasAttachment:", v43, v45, objc_msgSend(v46, "rangeContainsAttachment:", v47, v48));
            v50 = v49;
            v52 = v51;
            v54 = v53;
            v56 = v55;
            v83.origin.x = x;
            v83.origin.y = y;
            v83.size.width = width;
            v83.size.height = height;
            if (CGRectIsEmpty(v83))
            {
              x = v50;
              y = v52;
              width = v54;
              height = v56;
            }
            else
            {
              r2.origin.y = v50;
              v84.origin.x = v50;
              v57 = v52;
              v84.origin.y = v52;
              v58 = v54;
              v84.size.width = v54;
              v59 = v56;
              v84.size.height = v56;
              MaxX = CGRectGetMaxX(v84);
              v85.origin.x = x;
              v85.origin.y = y;
              v85.size.width = width;
              v85.size.height = height;
              if (MaxX <= CGRectGetMinX(v85))
                goto LABEL_28;
              v86.origin.x = r2.origin.y;
              v86.origin.y = v57;
              v86.size.width = v58;
              v86.size.height = v59;
              v61 = CGRectGetMinX(v86);
              v87.origin.x = x;
              v87.origin.y = y;
              v87.size.width = width;
              v87.size.height = height;
              if (v61 >= CGRectGetMaxX(v87))
                goto LABEL_28;
              v88.origin.x = r2.origin.y;
              v88.origin.y = v57;
              v88.size.width = v58;
              v88.size.height = v59;
              MaxY = CGRectGetMaxY(v88);
              v89.origin.x = x;
              v89.origin.y = y;
              v89.size.width = width;
              v89.size.height = height;
              if (MaxY > CGRectGetMaxY(v89))
              {
                v90.origin.x = r2.origin.y;
                v90.origin.y = v57;
                v90.size.width = v58;
                v90.size.height = v59;
                MinY = CGRectGetMinY(v90);
                v91.origin.x = x;
                v91.origin.y = y;
                v91.size.width = width;
                v91.size.height = height;
                if (MinY > CGRectGetMinY(v91))
                {
                  v92.origin.x = x;
                  v92.origin.y = y;
                  v92.size.width = width;
                  v92.size.height = height;
                  v96.origin.x = r2.origin.y;
                  v96.origin.y = v57;
                  v96.size.width = v58;
                  v96.size.height = v59;
                  v93 = CGRectUnion(v92, v96);
                  x = v93.origin.x;
                  y = v93.origin.y;
                  width = v93.size.width;
                  height = v93.size.height;
                }
              }
            }
          }
        }
        v38 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &r2.size, v76, 16);
      }
      while (v38);
    }
  }
LABEL_28:
  v64 = x;
  v65 = y;
  v66 = width;
  v67 = height;
  result.size.height = v67;
  result.size.width = v66;
  result.origin.y = v65;
  result.origin.x = v64;
  return result;
}

- (id)allLines
{
  id v3;
  void *i;
  void *v5;
  char *v6;
  char *v7;
  char *j;
  _QWORD *v9;
  TSWPSelection *v10;
  TSWPStorage *v11;
  id v12;
  NSUInteger v13;
  NSUInteger v14;
  uint64_t v15;
  id obj;
  uint64_t v18;
  id v19;
  _OWORD v20[4];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _NSRange v26;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = -[THWPRep columns](self, "columns");
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v6 = (char *)objc_msgSend(v5, "countLines");
        if (v6)
        {
          v7 = v6;
          for (j = 0; j != v7; ++j)
          {
            v9 = objc_msgSend(v5, "lineFragmentAtIndex:", j);
            v10 = +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", *v9, v9[1]);
            v11 = (TSWPStorage *)-[THWPRep storage](self, "storage");
            v12 = -[TSWPSelection range](v10, "range");
            v14 = v13;
            v26.location = (NSUInteger)v12;
            v26.length = v14;
            THTrimHighlightRange(v11, v26);
            if (v15)
            {
              if (v5)
                objc_msgSend(v5, "lineMetricsAtCharIndex:allowEndOfLine:", *v9, 0);
              else
                memset(v20, 0, sizeof(v20));
              objc_msgSend(v3, "addObject:", +[THWPRepLine lineWithLineMetrics:](THWPRepLine, "lineWithLineMetrics:", v20));
            }
          }
        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v19);
  }
  return v3;
}

- (id)hitRep:(CGPoint)a3
{
  double y;
  double x;
  THWPRep *v5;
  objc_super v7;

  y = a3.y;
  x = a3.x;
  v5 = self;
  -[THWPRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  if (!-[THWPRep hasMarginNoteAtCanvasPoint:](v5, "hasMarginNoteAtCanvasPoint:"))
  {
    v7.receiver = v5;
    v7.super_class = (Class)THWPRep;
    return -[THWPRep hitRep:](&v7, "hitRep:", x, y);
  }
  return v5;
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  double y;
  double x;
  id result;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)THWPRep;
  result = -[THWPRep hitRep:withGesture:passingTest:](&v9, "hitRep:withGesture:passingTest:", a4, a5);
  if (!result)
  {
    -[THWPRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
    if (-[THWPRep hasMarginNoteAtCanvasPoint:](self, "hasMarginNoteAtCanvasPoint:"))
      return self;
    else
      return 0;
  }
  return result;
}

- (THMarginNotesController)marginNotesController
{
  return -[THWPHighlightController marginNotesController](-[THWPRep highlightController](self, "highlightController"), "marginNotesController");
}

- (void)addMarginNoteLayersToArray:(id)a3
{
  objc_msgSend(a3, "addObjectsFromArray:", -[THMarginNotesController layers](-[THWPRep marginNotesController](self, "marginNotesController"), "layers"));
}

- (BOOL)hasMarginNoteAtCanvasPoint:(CGPoint)a3
{
  double v4;
  double v5;

  objc_msgSend(-[THWPRep marginNotesOwner](self, "marginNotesOwner"), "convertCanvasPointToOwnerPoint:", a3.x, a3.y);
  return -[THMarginNotesController hasMarginNoteAtPoint:](-[THWPRep marginNotesController](self, "marginNotesController"), "hasMarginNoteAtPoint:", v4, v5);
}

- (void)setupMarginNotesControllerForHighlightController:(id)a3
{
  CGFloat y;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  uint64_t v11;
  int v12;
  double v13;
  CGFloat v14;
  THMarginNotesController *v15;
  CGRect v16;
  CGRect v17;

  v15 = objc_alloc_init(THMarginNotesController);
  objc_msgSend(a3, "setMarginNotesController:", v15);
  y = CGPointZero.y;
  v6 = objc_msgSend(objc_msgSend(-[THWPRep layout](self, "layout"), "geometryInRoot"), "frame");
  v8 = v7;
  v10 = v9;
  v12 = TSUPadUI(v6, v11);
  v13 = 75.0;
  if (v12)
    v13 = 45.0;
  v14 = -v13;
  v16.origin.x = CGPointZero.x;
  v16.origin.y = y;
  v16.size.width = v8;
  v16.size.height = v10;
  v17 = CGRectInset(v16, v14, 0.0);
  -[THMarginNotesController setOwnerFrame:](v15, "setOwnerFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  objc_msgSend(-[THWPRep canvas](self, "canvas"), "viewScale");
  -[THMarginNotesController setOwnerScale:](v15, "setOwnerScale:");

}

- (void)viewScaleDidChange
{
  double v3;
  objc_super v4;

  objc_msgSend(-[THWPRep canvas](self, "canvas"), "viewScale");
  -[THMarginNotesController setOwnerScale:](-[THWPHighlightController marginNotesController](-[THWPRep highlightController](self, "highlightController"), "marginNotesController"), "setOwnerScale:", v3);
  v4.receiver = self;
  v4.super_class = (Class)THWPRep;
  -[THWPRep viewScaleDidChange](&v4, "viewScaleDidChange");
}

- (id)marginNoteForAnnotation:(id)a3 inRep:(id)a4 highlightBounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  double MinY;
  id v13;
  double v14;
  CGRect v16;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  if (a4 != self)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPRep marginNoteForAnnotation:inRep:highlightBounds:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPRep.mm"), 528, CFSTR("Creating margin note for foreign rep."));
  v11 = objc_alloc_init((Class)AEMarginNote);
  objc_msgSend(v11, "setAnnotation:", a3);
  objc_msgSend(v11, "setSide:", 0);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MinY = CGRectGetMinY(v16);
  v13 = objc_msgSend(-[THWPRep canvas](self, "canvas"), "contentsScale");
  objc_msgSend(v11, "setYStart:", TSDRoundForScale(v13, MinY, v14));
  objc_msgSend(v11, "setTheme:", objc_msgSend(a3, "theme"));
  return v11;
}

- (void)showEditorForMarginNote:(id)a3
{
  -[THWPHighlightController showNoteEditorForMarginNote:](-[THWPRep highlightController](self, "highlightController"), "showNoteEditorForMarginNote:", a3);
}

- (id)overlayLayers
{
  NSMutableArray *v3;
  TSKHighlightArrayController *mLinkPulseArrayController;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWPRep;
  v3 = +[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", -[THWPRep overlayLayers](&v7, "overlayLayers"));
  mLinkPulseArrayController = self->mLinkPulseArrayController;
  if (mLinkPulseArrayController)
  {
    v5 = -[TSKHighlightArrayController layers](mLinkPulseArrayController, "layers");
    if (objc_msgSend(v5, "count"))
    {
      -[THWPRep p_updatePulseLayerPositions](self, "p_updatePulseLayerPositions");
      objc_msgSend(v5, "makeObjectsPerformSelector:withObject:", "setDelegate:", -[THWPRep interactiveCanvasController](self, "interactiveCanvasController"));
      -[NSMutableArray addObjectsFromArray:](v3, "addObjectsFromArray:", v5);
    }
  }
  return v3;
}

- (void)pulseAnimationDidStop:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWPRep;
  -[THWPRep pulseAnimationDidStop:](&v5, "pulseAnimationDidStop:");
  if (self->mLinkPulseArrayController == a3)
  {
    if (objc_msgSend(a3, "autohide"))
    {
      -[THWPRep p_setLinkPulseControllerActive:autohide:](self, "p_setLinkPulseControllerActive:autohide:", 0, 0);
      -[THWPRep p_updateLinkLayersForRangeSelection:withAnimatingPulse:](self, "p_updateLinkLayersForRangeSelection:withAnimatingPulse:", -[THWPRep selection](self, "selection"), 0);
      -[THWPRep invalidateKnobs](self, "invalidateKnobs");
      objc_msgSend(-[THWPRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
    }
  }
}

- (void)processFindUIStateChangedNotificationUserInfo:(id)a3
{
  id v5;
  objc_super v6;

  if (a3 && objc_msgSend(a3, "objectForKey:", CFSTR("THMessageIsForTHWPRep")))
  {
    v5 = objc_msgSend(objc_msgSend(a3, "objectForKey:", TSKSearchReferencesToHighlightKey), "objectForKey:", -[THWPRep storage](self, "storage"));
    if (v5)
      -[THWPRep setLinkPulseSearchReferences:](self, "setLinkPulseSearchReferences:", +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v5));
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)THWPRep;
    -[THWPRep processFindUIStateChangedNotificationUserInfo:](&v6, "processFindUIStateChangedNotificationUserInfo:", a3);
  }
}

- (void)updateFromLayout
{
  THWPHighlightController *v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWPRep;
  -[THWPRep updateFromLayout](&v7, "updateFromLayout");
  if (-[THWPRep linkPulseSearchReferences](self, "linkPulseSearchReferences"))
  {
    -[THWPRep p_setLinkPulseControllerActive:autohide:](self, "p_setLinkPulseControllerActive:autohide:", 1, 1);
    -[THWPRep setLinkPulseActivationTime:](self, "setLinkPulseActivationTime:", CACurrentMediaTime());
    -[THWPRep p_updateLinkForSelection:withAnimatingPulse:selectionFlags:](self, "p_updateLinkForSelection:withAnimatingPulse:selectionFlags:", objc_msgSend(-[NSArray objectAtIndex:](-[THWPRep linkPulseSearchReferences](self, "linkPulseSearchReferences"), "objectAtIndex:", 0), "selection"), 1, 0);
  }
  else if (self->mLinkPulseArrayController)
  {
    -[THWPRep linkPulseActivationTime](self, "linkPulseActivationTime");
    if (v4 != 0.0)
    {
      v5 = CACurrentMediaTime();
      -[THWPRep linkPulseActivationTime](self, "linkPulseActivationTime");
      if (v5 - v6 > 0.1)
      {
        -[TSKHighlightArrayController disconnect](self->mLinkPulseArrayController, "disconnect");
        -[TSKHighlightArrayController reset](self->mLinkPulseArrayController, "reset");

        self->mLinkPulseArrayController = 0;
      }
    }
  }
  -[THWPRep setLinkPulseSearchReferences:](self, "setLinkPulseSearchReferences:", 0);
  v3 = -[THWPRep highlightController](self, "highlightController");
  if (v3)
    -[THWPHighlightController updateFromLayout](v3, "updateFromLayout");
}

- (void)p_setLinkPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4
{
  TSKHighlightArrayController *mLinkPulseArrayController;
  _BOOL8 v6;

  mLinkPulseArrayController = self->mLinkPulseArrayController;
  if (a3)
  {
    v6 = a4;
    if (!mLinkPulseArrayController)
    {
      mLinkPulseArrayController = (TSKHighlightArrayController *)objc_msgSend(objc_alloc((Class)TSKHighlightArrayController), "initWithZOrder:delegate:", self, 4.0);
      self->mLinkPulseArrayController = mLinkPulseArrayController;
    }
    -[TSKHighlightArrayController setShouldPulsate:](mLinkPulseArrayController, "setShouldPulsate:", 0);
    -[TSKHighlightArrayController setAutohide:](self->mLinkPulseArrayController, "setAutohide:", v6);
  }
  else if (mLinkPulseArrayController)
  {
    -[TSKHighlightArrayController disconnect](mLinkPulseArrayController, "disconnect");
    -[TSKHighlightArrayController reset](self->mLinkPulseArrayController, "reset");

    self->mLinkPulseArrayController = 0;
  }
}

- (void)p_updatePulseLayerPositions
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  __n128 v16;
  __n128 v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  objc_msgSend(objc_msgSend(-[THWPRep layout](self, "layout"), "geometryInRoot"), "frame");
  v4 = v3;
  v6 = v5;
  -[THWPRep lastPositionInRoot](self, "lastPositionInRoot");
  if (v8 != v4 || v7 != v6)
  {
    -[THWPRep lastPositionInRoot](self, "lastPositionInRoot");
    v11 = v10;
    v13 = v12;
    v14 = -[TSKHighlightArrayController layers](self->mLinkPulseArrayController, "layers");
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v15)
    {
      v18 = v15;
      v16.n128_f64[0] = v4;
      v17.n128_f64[0] = v6;
      TSDSubtractPoints(v16, v17, v11, v13);
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v20), "setPosition:", TSDAddPoints(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v20), "position")));
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v18);
    }
  }
  -[THWPRep setLastPositionInRoot:](self, "setLastPositionInRoot:", v4, v6);
}

- (void)p_updateLinkAnimationForSelection:(id)a3 withAnimatingPulse:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  id v8;
  TSKHighlightArrayController *mLinkPulseArrayController;
  id v10;
  id v11;
  id v12;
  TSKHighlightArrayController *v13;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v4 = a4;
  if ((-[TSKHighlightArrayController pulsating](self->mLinkPulseArrayController, "pulsating") & 1) == 0)
  {
    if (objc_msgSend(a3, "isValid"))
    {
      v7 = OBJC_IVAR___TSWPRep__updatingHighlights;
      if (!self->TSWPRep_opaque[OBJC_IVAR___TSWPRep__updatingHighlights])
      {
        self->TSWPRep_opaque[OBJC_IVAR___TSWPRep__updatingHighlights] = 1;
        v8 = -[THWPRep layout](self, "layout");
        if (v8)
        {
          objc_msgSend(v8, "transformInRoot");
        }
        else
        {
          v16 = 0u;
          v17 = 0u;
          v15 = 0u;
        }
        mLinkPulseArrayController = self->mLinkPulseArrayController;
        v14[0] = v15;
        v14[1] = v16;
        v14[2] = v17;
        -[TSKHighlightArrayController setTransform:](mLinkPulseArrayController, "setTransform:", v14);
        objc_msgSend(*(id *)&self->TSWPRep_opaque[OBJC_IVAR___TSDRep_mCanvas], "viewScale");
        -[TSKHighlightArrayController setViewScale:](self->mLinkPulseArrayController, "setViewScale:");
        v10 = objc_msgSend(objc_alloc((Class)TSWPSearchReference), "initWithStorage:selection:", -[THWPRep storage](self, "storage"), a3);
        v11 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v10, 0);
        v12 = -[THWPRep p_lineSearchReferencesForSearchReferences:](self, "p_lineSearchReferencesForSearchReferences:", v11);
        objc_msgSend(objc_msgSend(-[THWPRep layout](self, "layout"), "geometryInRoot"), "frame");
        -[THWPRep setLastPositionInRoot:](self, "setLastPositionInRoot:");
        v13 = self->mLinkPulseArrayController;
        objc_msgSend(-[THWPRep canvas](self, "canvas"), "contentsScale");
        -[TSKHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:](v13, "buildHighlightsForSearchReferences:contentsScaleForLayers:", v12);

        if (v4)
          -[TSKHighlightArrayController startAnimating](self->mLinkPulseArrayController, "startAnimating");
        -[THWPRep p_setSelectionLineLayersHidden:](self, "p_setSelectionLineLayersHidden:", 1);
        self->TSWPRep_opaque[v7] = 0;
      }
    }
  }
}

- (void)p_updateLinkLayersForRangeSelection:(id)a3 withAnimatingPulse:(BOOL)a4
{
  if (self->mLinkPulseArrayController)
    -[THWPRep p_updateLinkAnimationForSelection:withAnimatingPulse:](self, "p_updateLinkAnimationForSelection:withAnimatingPulse:", a3, a4);
}

- (void)p_updateLinkForSelection:(id)a3 withAnimatingPulse:(BOOL)a4 selectionFlags:(unsigned int)a5
{
  _BOOL8 v5;
  uint64_t v8;
  id v9;
  NSString *v10;
  NSString *v11;
  uint64_t v12;
  objc_class *v13;
  NSString *v14;
  uint64_t v15;
  objc_class *v16;

  v5 = a4;
  if (a3)
  {
    v8 = objc_opt_class(TSWPSelection, a2);
    if ((objc_opt_isKindOfClass(a3, v8) & 1) == 0)
    {
      v9 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v10 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWPRep p_updateLinkForSelection:withAnimatingPulse:selectionFlags:]");
      v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THWPRep.mm");
      v13 = (objc_class *)objc_opt_class(TSWPSelection, v12);
      v14 = NSStringFromClass(v13);
      v16 = (objc_class *)objc_opt_class(a3, v15);
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 751, CFSTR("%s expected %@, got %@"), "-[THWPRep p_updateLinkForSelection:withAnimatingPulse:selectionFlags:]", v14, NSStringFromClass(v16));
    }
  }
  if (*(_QWORD *)&self->TSWPRep_opaque[OBJC_IVAR___TSWPRep__caretLayer]
    && !self->TSWPRep_opaque[OBJC_IVAR___TSWPRep__suppressSelectionHighlight])
  {
    objc_msgSend(-[THWPRep layout](self, "layout"), "validate");
    if (objc_msgSend(a3, "isRange"))
      -[THWPRep p_updateLinkLayersForRangeSelection:withAnimatingPulse:](self, "p_updateLinkLayersForRangeSelection:withAnimatingPulse:", a3, v5);
  }
}

- (void)p_addRoundedRectToContext:(CGContext *)a3 rect:(CGRect)a4 forCaret:(BOOL)a5
{
  _BOOL4 v5;
  double v7;
  double v8;
  double v9;
  double x;
  double y;
  double width;
  double height;
  CGColor *DeviceRGB;
  CGColor *v15;
  CGColor *v16;
  CGColor *v17;
  const CGPath *v18;
  const __CFArray *v19;
  CGGradient *v20;
  CGSize v21;
  CGPoint v22;
  CGPoint v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v5 = a5;
  v24 = CGRectIntegral(a4);
  v7 = 4.0;
  if (v5)
    v7 = 0.1;
  v8 = -v7;
  if (v5)
    v9 = 0.0;
  else
    v9 = 3.0;
  v25 = CGRectInset(v24, v8, v8);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  CGContextBeginTransparencyLayer(a3, 0);
  DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB(0.0, 0.0, 0.0, 0.5);
  v15 = (CGColor *)TSUCGColorCreateDeviceRGB(0.996078431, 0.960784314, 0.215686275, 1.0);
  v16 = (CGColor *)TSUCGColorCreateDeviceRGB(0.964705882, 0.835294118, 0.156862745, 1.0);
  v17 = (CGColor *)TSUCGColorCreateDeviceRGB(0.0, 0.0, 0.0, 0.1);
  v18 = (const CGPath *)TSDCreateRoundRectPathForRectWithRadius(x, y, width, height, v9);
  CGContextSaveGState(a3);
  v21.width = 0.0;
  v21.height = -1.0;
  CGContextSetShadowWithColor(a3, v21, 4.0, DeviceRGB);
  CGContextAddPath(a3, v18);
  CGContextSetFillColorWithColor(a3, v15);
  CGContextFillPath(a3);
  CGContextRestoreGState(a3);
  CGContextSaveGState(a3);
  CGContextAddPath(a3, v18);
  CGContextSetStrokeColorWithColor(a3, v17);
  CGContextSetLineWidth(a3, 1.0);
  CGContextDrawPath(a3, kCGPathStroke);
  CGContextRestoreGState(a3);
  CGContextSaveGState(a3);
  v19 = (const __CFArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v15, v16, 0);
  CGContextAddPath(a3, v18);
  CGContextClip(a3);
  v20 = CGGradientCreateWithColors(0, v19, 0);

  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v23.y = CGRectGetMaxY(v26);
  v22.x = 0.0;
  v23.x = 0.0;
  v22.y = y;
  CGContextDrawLinearGradient(a3, v20, v22, v23, 0);
  CGGradientRelease(v20);
  CGContextRestoreGState(a3);
  CGColorRelease(DeviceRGB);
  CGColorRelease(v16);
  CGColorRelease(v15);
  CGColorRelease(v17);
  CGPathRelease(v18);
  CGContextEndTransparencyLayer(a3);
}

- (void)p_setSelectionLineLayersHidden:(BOOL)a3
{
  _BOOL8 v3;
  id *v4;

  v3 = a3;
  v4 = (id *)&self->TSWPRep_opaque[OBJC_IVAR___TSWPRep__selectionLineLayers];
  objc_msgSend(*v4, "setHidden:");
  objc_msgSend(v4[1], "setHidden:", v3);
}

- (id)p_lineSearchReferencesForSearchReferences:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  v4 = 0;
  if (v17)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(a3);
        v6 = -[THWPRep p_lineSelectionsForSelection:](self, "p_lineSelectionsForSelection:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v5), "selection"));
        v18 = v5;
        if (v6)
        {
          v7 = v6;
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v20;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v20 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v11);
                if (!v4)
                  v4 = +[NSMutableArray array](NSMutableArray, "array");
                v13 = objc_msgSend(objc_alloc((Class)TSWPSearchReference), "initWithStorage:selection:", -[THWPRep storage](self, "storage"), v12);
                objc_msgSend(v4, "addObject:", v13);

                v11 = (char *)v11 + 1;
              }
              while (v9 != v11);
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v9);
          }
        }
        v5 = v18 + 1;
      }
      while ((id)(v18 + 1) != v17);
      v17 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v17);
  }
  return v4;
}

- (id)p_lineSelectionsForSelection:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (!objc_msgSend(a3, "isRange"))
    return 0;
  if (-[THWPRep p_isSelectionSingleAnchoredDrawableAttachment](self, "p_isSelectionSingleAnchoredDrawableAttachment"))
    return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = -[THWPRep columns](self, "columns", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v15;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v5);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "lineSelectionsForSelection:", a3);
      if (v11)
      {
        v12 = v11;
        if (!v8)
          v8 = +[NSMutableArray array](NSMutableArray, "array");
        objc_msgSend(v8, "addObjectsFromArray:", v12);
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v7);
  return v8;
}

- (BOOL)p_isSelectionSingleAnchoredDrawableAttachment
{
  return objc_msgSend(-[THWPRep textEditor](self, "textEditor"), "isSelectionSingleAnchoredDrawableAttachment");
}

- (BOOL)p_shouldStartEditingOnPress
{
  return 0;
}

- (BOOL)p_shouldStartEditingOnLongPress
{
  return 1;
}

- (void)p_enumerateBoundsRectsForRange:(_NSRange)a3 includeSpaceBefore:(BOOL)a4 includeSpaceAfter:(BOOL)a5 includeLeading:(BOOL)a6 withBlock:(id)a7
{
  -[THWPRep p_enumerateBoundsRectsForSelection:includeSpaceBefore:includeSpaceAfter:includeLeading:withBlock:](self, "p_enumerateBoundsRectsForSelection:includeSpaceBefore:includeSpaceAfter:includeLeading:withBlock:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3.location, a3.length), a4, a5, a6, a7);
}

- (void)p_enumerateBoundsRectsForSelection:(id)a3 includeSpaceBefore:(BOOL)a4 includeSpaceAfter:(BOOL)a5 includeLeading:(BOOL)a6 withBlock:(id)a7
{
  _BOOL8 v8;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id obj;
  _BOOL4 v24;
  _BOOL4 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v24 = a5;
  v25 = a6;
  if (a3)
  {
    v8 = a4;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = -[THWPRep columns](self, "columns");
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v13);
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v15 = objc_msgSend(a3, "range");
          LOWORD(v22) = 0;
          v17 = objc_msgSend(v14, "rectsForSelectionRange:selectionType:includeSpaceAfter:includeSpaceBefore:includeLeading:forParagraphMode:includeRuby:", v15, v16, objc_msgSend(a3, "type"), v24, v8, v25, v22);
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v27;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v27 != v20)
                  objc_enumerationMutation(v17);
                objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v21), "CGRectValue");
                (*((void (**)(id))a7 + 2))(a7);
                v21 = (char *)v21 + 1;
              }
              while (v19 != v21);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v19);
          }
          v13 = (char *)v13 + 1;
        }
        while (v13 != v11);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v11);
    }
  }
}

- (CGRect)boundsRectForSelection:(id)a3
{
  CGSize size;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[5];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  __n128 (*v16)(uint64_t, uint64_t);
  uint64_t (*v17)();
  const char *v18;
  CGPoint origin;
  CGSize v20;
  CGRect result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x5012000000;
  v16 = sub_9443C;
  v17 = nullsub_20;
  v18 = "";
  size = CGRectNull.size;
  origin = CGRectNull.origin;
  v20 = size;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_9444C;
  v12[3] = &unk_428BD8;
  v12[4] = &v13;
  -[THWPRep p_enumerateBoundsRectsForSelection:includeSpaceBefore:includeSpaceAfter:includeLeading:withBlock:](self, "p_enumerateBoundsRectsForSelection:includeSpaceBefore:includeSpaceAfter:includeLeading:withBlock:", a3, 0, 0, 0, v12);
  v4 = v14[6];
  v5 = v14[7];
  v6 = v14[8];
  v7 = v14[9];
  _Block_object_dispose(&v13, 8);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)visibleBoundsForTilingLayer:(id)a3
{
  THWPHighlightController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGRect result;

  if (-[THWPRep highlightController](self, "highlightController"))
  {
    v5 = -[THWPRep highlightController](self, "highlightController");
    objc_msgSend(-[THWPRep interactiveCanvasController](self, "interactiveCanvasController"), "visibleBoundsRect");
    if (-[THWPHighlightController needsToRedrawForVisibleBounds:](v5, "needsToRedrawForVisibleBounds:"))
      objc_msgSend(-[THWPRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
  }
  v10.receiver = self;
  v10.super_class = (Class)THWPRep;
  -[THWPRep visibleBoundsForTilingLayer:](&v10, "visibleBoundsForTilingLayer:", a3);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)setHighlightController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 552);
}

- (NSArray)activeHighlightLayers
{
  return self->mActiveHighlightLayers;
}

- (void)setActiveHighlightLayers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 560);
}

- (CGPoint)lastPositionInRoot
{
  double x;
  double y;
  CGPoint result;

  x = self->mLastPositionInRoot.x;
  y = self->mLastPositionInRoot.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastPositionInRoot:(CGPoint)a3
{
  self->mLastPositionInRoot = a3;
}

- (BOOL)hasBeenRemovedFromCanvas
{
  return self->_hasBeenRemovedFromCanvas;
}

- (NSArray)linkPulseSearchReferences
{
  return self->_linkPulseSearchReferences;
}

- (void)setLinkPulseSearchReferences:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 616);
}

- (double)linkPulseActivationTime
{
  return self->_linkPulseActivationTime;
}

- (void)setLinkPulseActivationTime:(double)a3
{
  self->_linkPulseActivationTime = a3;
}

@end
