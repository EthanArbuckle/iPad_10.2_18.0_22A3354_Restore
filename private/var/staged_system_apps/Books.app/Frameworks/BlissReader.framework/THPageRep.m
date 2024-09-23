@implementation THPageRep

- (THPageRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  THPageRep *v10;
  double v11;
  double v12;
  double v13;
  id v14;
  objc_super v16;

  v7 = objc_msgSend(a3, "info");
  v9 = objc_opt_class(THModelPageInfo, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageRep initWithLayout:canvas:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageRep.mm"), 78, CFSTR("bad info class"));
  v16.receiver = self;
  v16.super_class = (Class)THPageRep;
  v10 = -[THPageRep initWithLayout:canvas:](&v16, "initWithLayout:canvas:", a3, a4);
  if (v10)
  {
    -[THPageRep setMarginNotesController:](v10, "setMarginNotesController:", objc_alloc_init(THMarginNotesController));
    objc_msgSend(objc_msgSend(-[THPageRep layout](v10, "layout"), "geometryInRoot"), "size");
    -[THMarginNotesController setOwnerSize:](-[THPageRep marginNotesController](v10, "marginNotesController"), "setOwnerSize:", v11, v12);
    objc_msgSend(a4, "viewScale");
    -[THMarginNotesController setOwnerScale:](-[THPageRep marginNotesController](v10, "marginNotesController"), "setOwnerScale:", v13);
    if (objc_msgSend(-[THPageRep layout](v10, "layout"), "isReflowablePresentation")
      && (objc_msgSend(objc_msgSend(-[THPageRep layout](v10, "layout"), "layoutController"), "isCompactWidth") & 1) != 0)
    {
      v14 = &dword_0 + 1;
    }
    else
    {
      v14 = objc_msgSend(-[THPageRep layout](v10, "layout"), "isCompactFlowPresentation");
    }
    -[THMarginNotesController setCompactPresentation:](-[THPageRep marginNotesController](v10, "marginNotesController"), "setCompactPresentation:", v14);
    v10->mBookmarkStatusDirty = 1;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[THPageRep setMarginNotesController:](self, "setMarginNotesController:", 0);

  v3.receiver = self;
  v3.super_class = (Class)THPageRep;
  -[THPageRep dealloc](&v3, "dealloc");
}

- (void)viewScaleDidChange
{
  double v3;
  objc_super v4;

  objc_msgSend(-[THPageRep canvas](self, "canvas"), "viewScale");
  -[THMarginNotesController setOwnerScale:](-[THPageRep marginNotesController](self, "marginNotesController"), "setOwnerScale:", v3);
  v4.receiver = self;
  v4.super_class = (Class)THPageRep;
  -[THPageRep viewScaleDidChange](&v4, "viewScaleDidChange");
}

- (BOOL)drawsPageBackground
{
  return 1;
}

- (void)didUpdateLayer:(id)a3
{
  CGColorRef Copy;
  CGColor *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THPageRep;
  -[THPageRep didUpdateLayer:](&v7, "didUpdateLayer:");
  if (-[THPageRep drawsPageBackground](self, "drawsPageBackground"))
  {
    objc_msgSend(a3, "setOpaque:", 1);
    if (objc_msgSend(objc_msgSend(-[THPageRep interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "themeProvider"))
    {
      Copy = CGColorCreateCopy((CGColorRef)objc_msgSend(objc_msgSend(objc_msgSend(-[THPageRep interactiveCanvasController](self, "interactiveCanvasController"), "documentRoot"), "themeProvider"), "backgroundColor"));
    }
    else
    {
      Copy = (CGColorRef)TSUCGColorCreateDeviceRGB(1.0, 1.0, 1.0, 1.0);
    }
    v6 = Copy;
    objc_msgSend(a3, "setBackgroundColor:", Copy);
    CGColorRelease(v6);
  }
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  if (!CGRectIsEmpty(a3))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageRep setNeedsDisplayInRect:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageRep.mm"), 148, CFSTR("this method should never be called, and page reps should never get a bitmap allocated"));
}

- (void)drawInLayerContext:(CGContext *)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageRep drawInLayerContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageRep.mm"), 158, CFSTR("this method should never be called, and page reps should never get a bitmap allocated"));
}

- (BOOL)masksToBounds
{
  return 1;
}

- (id)hitRep:(CGPoint)a3
{
  double y;
  double x;
  THPageRep *v6;
  id v8;
  double v9;
  double v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];

  y = a3.y;
  x = a3.x;
  v22.receiver = self;
  v22.super_class = (Class)THPageRep;
  v6 = -[THPageRep hitRep:](&v22, "hitRep:");
  if (v6 == self)
  {
    v8 = -[THPageRep interactiveCanvasController](self, "interactiveCanvasController");
    objc_msgSend(v8, "convertBoundsToUnscaledSize:", kTextMarginHitSlop[0], kTextMarginHitSlop[1]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = -[THPageRep hitReps:withSlop:](self, "hitReps:withSlop:", x, y, v9, v10, 0);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v19;
LABEL_5:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v11);
        v6 = *(THPageRep **)(*((_QWORD *)&v18 + 1) + 8 * v16);
        v17 = objc_opt_class(TSWPRep, v13);
        if ((objc_opt_isKindOfClass(v6, v17) & 1) != 0
          && (-[THPageRep isEditing](v6, "isEditing") & 1) != 0)
        {
          break;
        }
        if (v14 == (id)++v16)
        {
          v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          if (v14)
            goto LABEL_5;
          return self;
        }
      }
    }
    else
    {
      return self;
    }
  }
  return v6;
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  double y;
  double x;
  objc_super v11;
  CGPoint v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  -[THPageRep naturalBounds](self, "naturalBounds");
  v12.x = x;
  v12.y = y;
  if (!CGRectContainsPoint(v13, v12))
    return 0;
  v11.receiver = self;
  v11.super_class = (Class)THPageRep;
  return -[THPageRep hitRep:withGesture:passingTest:](&v11, "hitRep:withGesture:passingTest:", a4, a5, x, y);
}

- (id)childRepsForHitTesting
{
  id result;
  NSMutableOrderedSet *v4;
  id v5;
  id v6;
  objc_super v7;

  result = self->mSortedChildRepsForHitTesting;
  if (!result)
  {
    v7.receiver = self;
    v7.super_class = (Class)THPageRep;
    v4 = +[NSMutableOrderedSet orderedSetWithArray:](NSMutableOrderedSet, "orderedSetWithArray:", -[THPageRep childRepsForHitTesting](&v7, "childRepsForHitTesting"));
    v5 = -[NSMutableOrderedSet indexesOfObjectsPassingTest:](v4, "indexesOfObjectsPassingTest:", &stru_4279B8);
    -[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:](v4, "moveObjectsAtIndexes:toIndex:", v5, (_BYTE *)-[NSMutableOrderedSet count](v4, "count") - (_BYTE *)objc_msgSend(v5, "count"));
    v6 = -[NSMutableOrderedSet indexesOfObjectsPassingTest:](v4, "indexesOfObjectsPassingTest:", &stru_4279D8);
    -[NSMutableOrderedSet moveObjectsAtIndexes:toIndex:](v4, "moveObjectsAtIndexes:toIndex:", v6, (_BYTE *)-[NSMutableOrderedSet count](v4, "count") - (_BYTE *)objc_msgSend(v6, "count"));
    result = objc_msgSend(-[NSMutableOrderedSet array](v4, "array"), "copy");
    self->mSortedChildRepsForHitTesting = (NSArray *)result;
  }
  return result;
}

- (void)setChildReps:(id)a3
{
  objc_super v5;

  self->mSortedChildRepsForHitTesting = 0;
  v5.receiver = self;
  v5.super_class = (Class)THPageRep;
  -[THPageRep setChildReps:](&v5, "setChildReps:", a3);
}

- (void)insertChildRep:(id)a3 atIndex:(unint64_t)a4
{
  objc_super v7;

  self->mSortedChildRepsForHitTesting = 0;
  v7.receiver = self;
  v7.super_class = (Class)THPageRep;
  -[THPageRep insertChildRep:atIndex:](&v7, "insertChildRep:atIndex:", a3, a4);
}

- (void)removeChildRep:(id)a3
{
  objc_super v5;

  self->mSortedChildRepsForHitTesting = 0;
  v5.receiver = self;
  v5.super_class = (Class)THPageRep;
  -[THPageRep removeChildRep:](&v5, "removeChildRep:", a3);
}

- (void)updateBookmarkVisibleState
{
  double v3;

  *(float *)&v3 = (float)-[THPageRep p_shouldShowBookmark](self, "p_shouldShowBookmark");
  -[CALayer setOpacity:](self->mBookmarkLayer, "setOpacity:", v3);
}

- (BOOL)supportsBookmarking
{
  return 1;
}

- (void)updateFromLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THPageRep;
  -[THPageRep updateFromLayout](&v3, "updateFromLayout");
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[THPageRep p_bookmarkLayerFrame](self, "p_bookmarkLayerFrame");
  -[CALayer setFrame:](self->mBookmarkLayer, "setFrame:");
  +[CATransaction commit](CATransaction, "commit");
}

- (CGRect)p_bookmarkLayerFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v7;
  CGRect result;

  -[THPageRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  objc_msgSend(-[THPageRep canvas](self, "canvas"), "convertUnscaledToBoundsRect:", CGRectGetWidth(v7) + -48.0, 0.0, 34.0, 44.0);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)p_hasBookmark
{
  void *v3;

  v3 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THPageBookmarking, objc_msgSend(-[THPageRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
  return objc_msgSend(v3, "isPageBookmarkedForPageRep:", self);
}

- (void)p_setHasBookmark:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THPageBookmarking, objc_msgSend(-[THPageRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
  objc_msgSend(v5, "setPageBookmarked:forPageRep:", v3, self);
}

- (BOOL)p_shouldShowBookmark
{
  return objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___THPageBookmarking, objc_msgSend(-[THPageRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate")), "bookmarksShouldBeVisible");
}

- (void)p_updateBookmarkStatusAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  unsigned int v6;
  unsigned int v7;
  CABasicAnimation *v8;
  double v9;
  NSNumber *v10;
  double v11;
  float v12;
  double v13;
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  _QWORD v26[5];

  v3 = a3;
  if (!-[THPageRep supportsBookmarking](self, "supportsBookmarking"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THPageRep p_updateBookmarkStatusAnimated:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THPageRep.mm"), 303, CFSTR("shouldn't be updating the bookmark status if we don't show the bookmark layer"));
  v5 = -[CALayer contents](self->mBookmarkLayer, "contents") == 0;
  v6 = -[THPageRep p_hasBookmark](self, "p_hasBookmark");
  if (((v5 ^ v6) & 1) == 0)
  {
    v7 = v6;
    if ((v6 & 1) != 0)
    {
      -[CALayer setContents:](self->mBookmarkLayer, "setContents:", objc_msgSend(+[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", CFSTR("ib_bookmark_on_page"), THBundle()), "CGImage"));
      if (!v3)
      {
        -[THPageRep p_bookmarkLayerFrame](self, "p_bookmarkLayerFrame");
        -[CALayer setFrame:](self->mBookmarkLayer, "setFrame:");
        return;
      }
    }
    else if (!v3)
    {
      -[CALayer setContents:](self->mBookmarkLayer, "setContents:", 0);
      -[CALayer setContents:](self->mBookmarkLayer, "setContents:", 0);
      return;
    }
    -[CALayer removeAllAnimations](self->mBookmarkLayer, "removeAllAnimations");
    +[CATransaction begin](CATransaction, "begin");
    if ((v7 & 1) == 0)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_421F0;
      v26[3] = &unk_426DD0;
      v26[4] = self;
      +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v26);
    }
    v8 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("transform.translation.y"));
    LODWORD(v9) = 0;
    v10 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9);
    -[CALayer bounds](self->mBookmarkLayer, "bounds");
    v12 = v11;
    *(float *)&v13 = -v12;
    v14 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13);
    if (v7)
      v15 = v14;
    else
      v15 = v10;
    if (v7)
      v16 = v10;
    else
      v16 = v14;
    -[CABasicAnimation setFromValue:](v8, "setFromValue:", v15);
    -[CABasicAnimation setToValue:](v8, "setToValue:", v16);
    -[CALayer addAnimation:forKey:](self->mBookmarkLayer, "addAnimation:forKey:", v8, CFSTR("slide"));
    -[CALayer frame](self->mBookmarkLayer, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = objc_opt_class(NSNumber, v23);
    objc_msgSend((id)TSUDynamicCast(v24, -[CABasicAnimation toValue](v8, "toValue")), "floatValue");
    -[CALayer setFrame:](self->mBookmarkLayer, "setFrame:", v18, v25, v20, v22);
    +[CATransaction commit](CATransaction, "commit");
  }
}

- (void)updateBookmarkStatus
{
  if (-[THPageRep supportsBookmarking](self, "supportsBookmarking"))
    -[THPageRep p_updateBookmarkStatusAnimated:](self, "p_updateBookmarkStatusAnimated:", 0);
}

- (void)updateBookmarkStatusAnimated
{
  if (-[THPageRep supportsBookmarking](self, "supportsBookmarking"))
    -[THPageRep p_updateBookmarkStatusAnimated:](self, "p_updateBookmarkStatusAnimated:", 1);
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THPageRep;
  -[THPageRep addAdditionalChildLayersToArray:](&v5, "addAdditionalChildLayersToArray:");
  objc_msgSend(a3, "addObjectsFromArray:", -[THMarginNotesController layers](-[THPageRep marginNotesController](self, "marginNotesController"), "layers"));
  if (-[THPageRep supportsBookmarking](self, "supportsBookmarking"))
  {
    if (!self->mBookmarkLayer)
    {
      self->mBookmarkLayer = (CALayer *)objc_alloc_init((Class)CALayer);
      -[THPageRep p_bookmarkLayerFrame](self, "p_bookmarkLayerFrame");
      -[CALayer setFrame:](self->mBookmarkLayer, "setFrame:");
      -[THPageRep updateBookmarkVisibleState](self, "updateBookmarkVisibleState");
    }
    if (self->mBookmarkStatusDirty)
    {
      -[THPageRep p_updateBookmarkStatusAnimated:](self, "p_updateBookmarkStatusAnimated:", 0);
      self->mBookmarkStatusDirty = 0;
    }
    objc_msgSend(a3, "addObject:", self->mBookmarkLayer);
  }
}

- (id)noteMarkerForUnscaledPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)p_isToggleBookmarkGesture:(id)a3
{
  uint64_t v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGPoint v12;
  CGPoint v13;
  CGRect v14;
  CGRect v15;

  v5 = TSUProtocolCast(&OBJC_PROTOCOL___THPageBookmarking, objc_msgSend(-[THPageRep interactiveCanvasController](self, "interactiveCanvasController"), "delegate"));
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(a3, "naturalLocationForRep:", self);
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "bookmarkHotspotRegionForPage:", -[THPageRep info](self, "info"));
    v12.x = v8;
    v12.y = v10;
    if (CGRectContainsPoint(v14, v12))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      -[THPageRep p_bookmarkLayerFrame](self, "p_bookmarkLayerFrame");
      v13.x = v8;
      v13.y = v10;
      LODWORD(v5) = CGRectContainsPoint(v15, v13);
      if ((_DWORD)v5)
        LOBYTE(v5) = -[THPageRep p_hasBookmark](self, "p_hasBookmark");
    }
  }
  return v5;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v5;
  id v6;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 == (id)TSDShortTap)
    return -[THPageRep p_isToggleBookmarkGesture:](self, "p_isToggleBookmarkGesture:", a3);
  v6 = objc_msgSend(a3, "gestureKind");
  if (v6 == (id)TSDDelayedShortTap)
    return -[THPageRep p_isToggleBookmarkGesture:](self, "p_isToggleBookmarkGesture:", a3);
  else
    return 0;
}

- (BOOL)handleGesture:(id)a3
{
  id v5;
  id v6;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 == (id)TSDShortTap || (v6 = objc_msgSend(a3, "gestureKind"), v6 == (id)TSDDelayedShortTap))
  {
    if (-[THPageRep p_isToggleBookmarkGesture:](self, "p_isToggleBookmarkGesture:", a3))
      -[THPageRep p_setHasBookmark:](self, "p_setHasBookmark:", -[THPageRep p_hasBookmark](self, "p_hasBookmark") ^ 1);
  }
  return 1;
}

- (THMarginNotesController)marginNotesController
{
  return self->mMarginNotesController;
}

- (void)setMarginNotesController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (int)marginNoteSideForPageRelativeRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = fabs(CGRectGetMinX(a3));
  -[THPageRep naturalBounds](self, "naturalBounds");
  v10 = v9;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  return v8 >= vabdd_f64(v10, CGRectGetMaxX(v12));
}

- (id)marginNoteForAnnotation:(id)a3 inRep:(id)a4 highlightBounds:(CGRect)a5
{
  double height;
  double width;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  id v23;
  CGRect v25;

  height = a5.size.height;
  width = a5.size.width;
  objc_msgSend(a4, "convertNaturalRectToUnscaledCanvas:", a5.origin.x, a5.origin.y);
  v10 = v9;
  v12 = v11;
  -[THPageRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  v14 = v13;
  v16 = v15;
  v17 = objc_msgSend(-[THPageRep canvas](self, "canvas"), "contentsScale");
  v19 = v18;
  v20 = TSDRoundForScale(v17, v10 - v14, v18);
  v22 = TSDRoundForScale(v21, v12 - v16, v19);
  v23 = objc_alloc_init((Class)AEMarginNote);
  objc_msgSend(v23, "setAnnotation:", a3);
  objc_msgSend(v23, "setTheme:", objc_msgSend(a3, "theme"));
  objc_msgSend(v23, "setSide:", -[THPageRep marginNoteSideForPageRelativeRect:](self, "marginNoteSideForPageRelativeRect:", v20, v22, width, height));
  v25.origin.x = v20;
  v25.origin.y = v22;
  v25.size.width = width;
  v25.size.height = height;
  objc_msgSend(v23, "setYStart:", CGRectGetMinY(v25));
  return v23;
}

- (void)showEditorForMarginNote:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = -[THPageRep childReps](self, "childReps", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = objc_opt_class(THBodyRep, v7);
        v13 = (void *)TSUDynamicCast(v12, v11);
        if (v13)
        {
          v14 = v13;
          if (objc_msgSend(objc_msgSend(v13, "highlightController"), "ownsMarginNote:", a3))
          {
            objc_msgSend(-[THPageRep interactiveCanvasController](self, "interactiveCanvasController"), "endEditing");
            objc_msgSend(objc_msgSend(v14, "highlightController"), "showNoteEditorForMarginNote:", a3);
            return;
          }
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
}

@end
