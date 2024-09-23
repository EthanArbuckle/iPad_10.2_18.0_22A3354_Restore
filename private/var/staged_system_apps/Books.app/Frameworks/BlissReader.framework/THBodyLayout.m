@implementation THBodyLayout

- (THBodyLayout)initWithInfo:(id)a3
{
  THBodyLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THBodyLayout;
  v3 = -[THBodyLayout initWithInfo:](&v5, "initWithInfo:", a3);
  if (v3)
    v3->mAttachedDrawableLayouts = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->mAttachedDrawableLayouts = 0;
  self->mColumns = 0;

  self->_anchoredDrawablesForRelayout = 0;
  v3.receiver = self;
  v3.super_class = (Class)THBodyLayout;
  -[THBodyLayout dealloc](&v3, "dealloc");
}

- (void)willBeAddedToLayoutController:(id)a3
{
  id v4;

  v4 = objc_msgSend(-[THBodyLayout info](self, "info", a3), "bodyStorage");
  if (-[THPageController needsAnnotationSourceForLayout:](-[THBodyLayout pageController](self, "pageController"), "needsAnnotationSourceForLayout:", self))objc_msgSend(v4, "updateAnnotationSourceWithContentNode:", objc_msgSend(objc_msgSend(-[THBodyLayout sectionLayout](self, "sectionLayout"), "info"), "contentNode"));
}

- (BOOL)allowsDescendersToClip
{
  return -[THPageController allowsDescendersToClip](-[THBodyLayout pageController](self, "pageController"), "allowsDescendersToClip");
}

- (CGRect)rectForSelection:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  +[TSWPColumn rectForSelection:withColumns:](TSWPColumn, "rectForSelection:withColumns:", a3, -[THBodyLayout columns](self, "columns"));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)needsInflation
{
  return -[THBodyLayout columns](self, "columns") == 0;
}

- (void)p_killDrawableLayouts:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(a3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "isBeingManipulated") & 1) == 0)
          objc_msgSend(v8, "removeFromParent");
      }
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
}

- (void)createColumns
{
  if (!self->mColumns)
    self->mColumns = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
}

- (void)killColumns
{

  self->mColumns = 0;
  -[THBodyLayout p_killDrawableLayouts:](self, "p_killDrawableLayouts:", -[THBodyLayout currentInlineDrawableLayouts](self, "currentInlineDrawableLayouts"));
  -[THBodyLayout p_killDrawableLayouts:](self, "p_killDrawableLayouts:", -[THBodyLayout currentAnchoredDrawableLayouts](self, "currentAnchoredDrawableLayouts"));
}

- (void)processWidowAndInflation
{
  id v3;
  void *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  char *v9;
  id v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v3 = -[NSMutableArray lastObject](-[THBodyLayout columns](self, "columns"), "lastObject");
  if (v3)
  {
    v4 = v3;
    v5 = (char *)objc_msgSend(v3, "range");
    v7 = &v5[v6];
    v8 = objc_msgSend(-[THPageController i_pageHintForPageIndex:](-[THBodyLayout pageController](self, "pageController"), "i_pageHintForPageIndex:", objc_msgSend(-[THBodyLayout parent](self, "parent"), "relativePageIndex")), "lastHintForBodyIndex:", -[THBodyLayout bodyIndexInPageLayout](self, "bodyIndexInPageLayout"));
    v9 = (char *)(v8[5] + v8[4]);
    if (v9 != v7)
    {
      v10 = objc_msgSend(-[THBodyLayout info](self, "info"), "bodyStorage");
      v11 = (char *)objc_msgSend(v4, "range");
      if (v9 <= &v11[v12])
        v13 = &v11[v12];
      else
        v13 = v9;
      if (v9 >= &v11[v12])
        v14 = &v11[v12];
      else
        v14 = v9;
      objc_msgSend(v4, "trimToCharIndex:inTarget:removeAutoNumberFootnoteCount:", v9, self, objc_msgSend(v10, "autoNumberFootnoteCountForRange:", v14, v13 - v14));
      -[THBodyLayout setNeedsDisplay](self, "setNeedsDisplay");
    }
  }
  else
  {
    -[THBodyLayout invalidate](self, "invalidate");
  }
}

- (unint64_t)bodyIndexInPageLayout
{
  return (unint64_t)objc_msgSend(objc_msgSend(objc_msgSend(-[THBodyLayout parent](self, "parent"), "info"), "modelBodyInfos"), "indexOfObject:", -[THBodyLayout info](self, "info"));
}

- (unint64_t)firstCharacterIndexOverlappingPageRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  __n128 v12;
  __n128 v13;
  double v15;
  double v16;
  __int16 v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(-[THBodyLayout parent](self, "parent"), "bodyRectForChildLayout:", self);
  v8 = v18.origin.x;
  v9 = v18.origin.y;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v19 = CGRectIntersection(v18, v20);
  v10 = v19.origin.x;
  v11 = v19.origin.y;
  if (CGRectIsNull(v19))
    return 0x7FFFFFFFFFFFFFFFLL;
  v12.n128_f64[0] = v10;
  v13.n128_f64[0] = v11;
  v15 = TSDSubtractPoints(v12, v13, v8, v9);
  v17 = 0;
  return (unint64_t)+[TSWPColumn charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:](TSWPColumn, "charIndexForPoint:inColumnsArray:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:", -[THBodyLayout columns](self, "columns"), 0, 0, (char *)&v17 + 1, &v17, v15, v16);
}

- (_NSRange)columnRange
{
  id v2;
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id location;
  NSUInteger length;
  NSRange v11;
  NSRange v12;
  NSUInteger v13;
  NSUInteger v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  NSRange v20;
  _NSRange result;

  v2 = NSInvalidRange[0];
  v3 = NSInvalidRange[1];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = -[THBodyLayout columns](self, "columns", 0);
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        location = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8), "range");
        v11.location = (NSUInteger)location;
        v11.length = length;
        if (v2 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v20.location = (NSUInteger)v2;
          v20.length = (NSUInteger)v3;
          v12 = NSUnionRange(v20, v11);
          length = v12.length;
          location = (id)v12.location;
        }
        v2 = location;
        v3 = (id)length;
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  v13 = (NSUInteger)v2;
  v14 = (NSUInteger)v3;
  result.length = v14;
  result.location = v13;
  return result;
}

- (CGPoint)pageOriginOfCharacterIndex:(unint64_t)a3
{
  double v4;
  double v5;
  CGPoint result;

  -[THBodyLayout rectForSelection:](self, "rectForSelection:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", a3, 1));
  v4 = TSDAddPoints(objc_msgSend(-[THBodyLayout parent](self, "parent"), "bodyRectForChildLayout:", self));
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGSize)maximumFrameSizeForChild:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v5 = objc_msgSend(objc_msgSend(a3, "info"), "owningAttachment");
  if (v5 && (objc_msgSend(v5, "isAnchored") & 1) == 0 && -[THBodyLayout columns](self, "columns"))
  {
    objc_msgSend(-[NSMutableArray objectAtIndex:](-[THBodyLayout columns](self, "columns"), "objectAtIndex:", 0), "frameBounds");
    v7 = v6;
    v9 = v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)THBodyLayout;
    -[THBodyLayout maximumFrameSizeForChild:](&v10, "maximumFrameSizeForChild:", a3);
  }
  result.height = v9;
  result.width = v7;
  return result;
}

- (id)computeLayoutGeometry
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(-[THBodyLayout parent](self, "parent"), "bodyRectForChildLayout:", self);
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v2, v3, v4, v5);
}

- (CGPoint)capturedInfoPositionForAttachment
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)usesInflation
{
  return 1;
}

- (void)validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THBodyLayout;
  -[THBodyLayout validate](&v3, "validate");
  if (-[THBodyLayout usesInflation](self, "usesInflation"))
  {
    if (-[THBodyLayout needsInflation](self, "needsInflation"))
    {
      -[THBodyLayout createColumns](self, "createColumns");
      -[THPageController i_inflateColumnsInBodyLayout:](-[THBodyLayout pageController](self, "pageController"), "i_inflateColumnsInBodyLayout:", self);
    }
    if (-[THBodyLayout needsInflation](self, "needsInflation"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBodyLayout validate]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBodyLayout.mm"), 269, CFSTR("still need inflation after validation"));
  }
}

- (void)invalidateSize
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];

  v16.receiver = self;
  v16.super_class = (Class)THBodyLayout;
  -[THBodyLayout invalidateSize](&v16, "invalidateSize");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = -[THBodyLayout currentAnchoredDrawableLayouts](self, "currentAnchoredDrawableLayouts", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
        v10 = objc_opt_class(TSDLayout, v5);
        v11 = (void *)TSUDynamicCast(v10, v9);
        if (v11)
          objc_msgSend(v11, "invalidateExteriorWrap");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }
}

- (id)columnMetricsForCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  return objc_msgSend(-[THBodyLayout info](self, "info", a3, a4), "columnStyle");
}

- (BOOL)layoutIsValid
{
  return -[NSMutableArray count](self->mColumns, "count") != 0;
}

- (TSWPOffscreenColumn)previousTargetLastColumn
{
  return (TSWPOffscreenColumn *)-[THPageController i_columnPriorToPageIndex:](-[THBodyLayout pageController](self, "pageController"), "i_columnPriorToPageIndex:", objc_msgSend(-[THBodyLayout parent](self, "parent"), "relativePageIndex"));
}

- (TSWPOffscreenColumn)nextTargetFirstColumn
{
  return (TSWPOffscreenColumn *)-[THPageController i_columnAfterPageIndex:](-[THBodyLayout pageController](self, "pageController"), "i_columnAfterPageIndex:", objc_msgSend(-[THBodyLayout parent](self, "parent"), "relativePageIndex"));
}

- (TSDHint)nextTargetFirstChildHint
{
  return (TSDHint *)-[THPageController i_firstChildHintAfterPageIndex:](-[THBodyLayout pageController](self, "pageController"), "i_firstChildHintAfterPageIndex:", objc_msgSend(-[THBodyLayout parent](self, "parent"), "relativePageIndex"));
}

- (const)previousTargetTopicNumbers
{
  return -[THPageController i_topicHintsPriorToPageIndex:](-[THBodyLayout pageController](self, "pageController"), "i_topicHintsPriorToPageIndex:", objc_msgSend(-[THBodyLayout parent](self, "parent"), "relativePageIndex"));
}

- (const)nextTargetTopicNumbers
{
  return -[THPageController i_topicHintsAfterPageIndex:](-[THBodyLayout pageController](self, "pageController"), "i_topicHintsAfterPageIndex:", objc_msgSend(-[THBodyLayout parent](self, "parent"), "relativePageIndex"));
}

- (BOOL)isLastTarget
{
  return 0;
}

- (CGSize)minSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(objc_msgSend(-[THBodyLayout info](self, "info"), "geometry"), "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)maxSize
{
  unsigned __int8 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = -[THBodyLayout autosizeFlags](self, "autosizeFlags");
  objc_msgSend(-[THBodyLayout parent](self, "parent"), "bodyRectForChildLayout:", self);
  v6 = 100000.0;
  if ((v3 & 1) != 0)
    v7 = 100000.0;
  else
    v7 = v5;
  if ((v3 & 4) == 0)
    v6 = v4;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)currentSize
{
  double v3;
  double v4;
  CGSize result;

  if (objc_msgSend(-[THBodyLayout info](self, "info"), "autosizes"))
    -[THBodyLayout maxSize](self, "maxSize");
  else
    objc_msgSend(-[THBodyLayout geometry](self, "geometry"), "size");
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGPoint)position
{
  id v2;
  float64x2_t v3;
  float64x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  double v7;
  double y;
  CGPoint v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  CGPoint result;

  y = CGPointZero.y;
  v9 = CGPointZero;
  v2 = -[THBodyLayout geometry](self, "geometry");
  if (v2)
  {
    objc_msgSend(v2, "transform");
    v3 = v10;
    v4 = v11;
    v5 = v12;
  }
  else
  {
    v5 = 0uLL;
    v3 = 0uLL;
    v4 = 0uLL;
  }
  v6 = vaddq_f64(v5, vmlaq_n_f64(vmulq_n_f64(v4, y), v3, v9.x));
  v7 = v6.f64[1];
  result.x = v6.f64[0];
  result.y = v7;
  return result;
}

- (CGPoint)anchorPoint
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (unsigned)autosizeFlags
{
  return 0;
}

- (unsigned)verticalAlignment
{
  return 0;
}

- (unsigned)naturalAlignment
{
  return 0;
}

- (BOOL)wantsLineFragments
{
  return 1;
}

- (int)naturalDirection
{
  return 0;
}

- (void)setNeedsDisplayInTargetRect:(CGRect)a3
{
  -[THBodyLayout setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGRect)targetRectForCanvasRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGRect v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[THBodyLayout frameInRoot](self, "frameInRoot");
  v8 = -v7;
  v10 = -v9;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  return CGRectOffset(v11, v8, v10);
}

- (TSDCanvas)canvas
{
  return (TSDCanvas *)objc_msgSend(-[THBodyLayout layoutController](self, "layoutController"), "canvas");
}

- (void)replaceChild:(id)a3 with:(id)a4
{
  unsigned int v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THBodyLayout;
  -[THBodyLayout replaceChild:with:](&v8, "replaceChild:with:");
  v7 = -[NSMutableSet containsObject:](self->mAttachedDrawableLayouts, "containsObject:", a3);
  if (a3 != a4)
  {
    if (v7)
      -[NSMutableSet removeObject:](self->mAttachedDrawableLayouts, "removeObject:", a3);
  }
}

- (TSWPFootnoteHeightMeasurer)footnoteHeightMeasurer
{
  return 0;
}

- (TSWPFootnoteMarkProvider)footnoteMarkProvider
{
  return 0;
}

- (BOOL)shouldPositionAttachmentsIteratively
{
  return 0;
}

- (unint64_t)iterativeAttachmentPositioningMaxPassCount
{
  return 0;
}

- (void)addAttachmentLayout:(id)a3
{
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBodyLayout addAttachmentLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THBodyLayout.mm"), 453, CFSTR("invalid nil value for '%s'"), "layout");
  if (objc_msgSend(a3, "parent") != self)
    -[THBodyLayout addChild:](self, "addChild:", a3);
  objc_msgSend(a3, "updateChildrenFromInfo");
}

- (id)p_layoutForDrawable:(id)a3 inContainingLayout:(id)a4
{
  id v7;

  v7 = objc_msgSend(objc_msgSend(a4, "layoutController"), "layoutForInfo:childOfLayout:", a3, a4);
  if (!v7)
  {
    v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(a3, "layoutClass")), "initWithInfo:", a3);
    if (v7)
    {
      -[NSMutableSet addObject:](self->mAttachedDrawableLayouts, "addObject:", v7);
      objc_msgSend(a4, "addAttachmentLayout:", v7);

    }
  }
  return v7;
}

- (id)layoutForInlineDrawable:(id)a3
{
  return -[THBodyLayout p_layoutForDrawable:inContainingLayout:](self, "p_layoutForDrawable:inContainingLayout:", a3, self);
}

- (id)validatedLayoutForAnchoredDrawable:(id)a3
{
  id v4;

  v4 = -[THBodyLayout p_layoutForDrawable:inContainingLayout:](self, "p_layoutForDrawable:inContainingLayout:", a3, -[THBodyLayout parent](self, "parent"));
  objc_msgSend(-[THBodyLayout layoutController](self, "layoutController"), "validateLayoutWithDependencies:", v4);
  return v4;
}

- (id)p_attachedLayoutsInLayout:(id)a3 anchored:(BOOL)a4
{
  int v4;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a4;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(a3, "children", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v7)
    return 0;
  v9 = v7;
  v10 = 0;
  v11 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v21 != v11)
        objc_enumerationMutation(v6);
      v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
      v14 = objc_opt_class(TSDLayout, v8);
      v15 = (void *)TSUDynamicCast(v14, v13);
      if (v15)
      {
        v16 = v15;
        v17 = objc_msgSend(objc_msgSend(v15, "info"), "owningAttachment");
        if (v17)
        {
          v18 = v17;
          if (objc_msgSend(v17, "isDrawable"))
          {
            if (objc_msgSend(v18, "isAnchored") == v4
              && -[NSMutableSet containsObject:](self->mAttachedDrawableLayouts, "containsObject:", v16))
            {
              if (v10)
                -[NSMutableArray addObject:](v10, "addObject:", v16);
              else
                v10 = +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v16);
            }
          }
        }
      }
    }
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v9);
  return v10;
}

- (id)currentInlineDrawableLayouts
{
  return -[THBodyLayout p_attachedLayoutsInLayout:anchored:](self, "p_attachedLayoutsInLayout:anchored:", self, 0);
}

- (id)currentAnchoredDrawableLayouts
{
  return -[THBodyLayout p_attachedLayoutsInLayout:anchored:](self, "p_attachedLayoutsInLayout:anchored:", -[THBodyLayout parent](self, "parent"), 1);
}

- (double)maxAnchorY
{
  double v3;
  double v4;
  double v5;

  -[THBodyLayout position](self, "position");
  v4 = v3;
  -[THBodyLayout maxSize](self, "maxSize");
  return v4 + v5;
}

- (BOOL)isLayoutOffscreen
{
  return objc_msgSend(-[THBodyLayout layoutController](self, "layoutController"), "isLayoutOffscreen");
}

- (CGPoint)layoutPositionFromAnchoredAttachmentPosition:(CGPoint)a3
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
    -[THBodyLayout transform](self, "transform");
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

- (CGPoint)anchoredAttachmentPositionFromLayoutPosition:(CGPoint)a3
{
  uint64_t v3;
  float64x2_t v4;
  double v5;
  double y;
  double x;
  CGAffineTransform v8;
  CGAffineTransform v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (self)
    -[THBodyLayout transform](self, "transform", *(_QWORD *)&a3.y, v3);
  else
    memset(&v8, 0, sizeof(v8));
  CGAffineTransformInvert(&v9, &v8);
  v4 = vaddq_f64(*(float64x2_t *)&v9.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v9.c, y), *(float64x2_t *)&v9.a, x));
  v5 = v4.f64[1];
  result.x = v4.f64[0];
  result.y = v5;
  return result;
}

- (void)layoutSearchForString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSRange v15;
  char *v16;
  id v17;
  void *v18;
  _QWORD v19[6];
  NSRange v20;
  NSRange v21;

  if (-[NSMutableArray count](-[THBodyLayout columns](self, "columns"), "count"))
  {
    v9 = -[NSMutableArray objectAtIndex:](-[THBodyLayout columns](self, "columns"), "objectAtIndex:", 0);
    v10 = -[NSMutableArray lastObject](-[THBodyLayout columns](self, "columns"), "lastObject");
    v11 = objc_msgSend(v9, "range");
    v13 = v12;
    v21.location = (NSUInteger)objc_msgSend(v10, "range");
    v21.length = v14;
    v20.location = (NSUInteger)v11;
    v20.length = v13;
    v15 = NSUnionRange(v20, v21);
    v16 = (char *)objc_msgSend(objc_msgSend(-[THBodyLayout info](self, "info"), "bodyStorage"), "length")
        - v15.location
        - v15.length;
    if ((char *)objc_msgSend(a3, "length") - 1 < v16)
      v16 = (char *)objc_msgSend(a3, "length") - 1;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_3F310;
    v19[3] = &unk_427978;
    v19[4] = self;
    v19[5] = a5;
    v17 = objc_msgSend(objc_msgSend(-[THBodyLayout info](self, "info"), "bodyStorage"), "searchInRange:forString:options:onHit:", v15.location, &v16[v15.length], a3, a4, v19);
    if (v17)
    {
      v18 = v17;
      if ((objc_msgSend(v17, "isComplete") & 1) == 0)
      {
        do
          objc_msgSend(objc_msgSend(-[THBodyLayout info](self, "info"), "bodyStorage"), "continueSearch:", v18);
        while (!objc_msgSend(v18, "isComplete"));
      }
    }
  }
}

- (CGPoint)calculatePointFromSearchReference:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v5 = objc_opt_class(TSWPSelection, a2);
  v6 = TSUDynamicCast(v5, objc_msgSend(a3, "selection"));
  v7 = 0.0;
  if (v6)
  {
    v8 = (void *)v6;
    v9 = 0.0;
    if (-[NSMutableArray count](-[THBodyLayout columns](self, "columns"), "count"))
    {
      v10 = objc_msgSend(objc_alloc((Class)TSWPSelection), "initWithRange:", objc_msgSend(v8, "start"), 0);
      +[TSWPColumn rectForSelection:withColumns:](TSWPColumn, "rectForSelection:withColumns:", v10, -[THBodyLayout columns](self, "columns"));
      -[THBodyLayout rectInRoot:](self, "rectInRoot:");
      v9 = v11;
      v7 = v12;

    }
  }
  else
  {
    v9 = 0.0;
  }
  v13 = v9;
  v14 = v7;
  result.y = v14;
  result.x = v13;
  return result;
}

- (BOOL)siblingTargetIsManipulatingDrawable:(id)a3
{
  return 0;
}

- (THPageController)pageController
{
  return (THPageController *)objc_msgSend(-[THBodyLayout parent](self, "parent"), "pageController");
}

- (unint64_t)pageNumber
{
  return (unint64_t)objc_msgSend(-[THBodyLayout parent](self, "parent"), "relativePageIndex");
}

- (unint64_t)pageCount
{
  return (unint64_t)-[THPageController pageCount](-[THBodyLayout pageController](self, "pageController"), "pageCount");
}

- (BOOL)textIsVertical
{
  return 0;
}

- (NSMutableArray)anchoredDrawablesForRelayout
{
  return self->_anchoredDrawablesForRelayout;
}

- (void)setAnchoredDrawablesForRelayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 264);
}

- (NSMutableArray)columns
{
  return self->mColumns;
}

- (id)nonEmptyColumns
{
  id v3;
  NSMutableArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[THBodyLayout columns](self, "columns", 0);
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        objc_msgSend(v9, "range");
        if (v10)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)nextTargetFromLayout:(id)a3 column:(id)a4
{
  id v5;

  v5 = objc_msgSend(-[THBodyLayout nonEmptyColumns](self, "nonEmptyColumns", a3), "tsu_objectAfterObjectIdenticalTo:", a4);
  if (v5)
    return -[THGuidedPanColumnTarget initWithLayout:column:]([THGuidedPanColumnTarget alloc], "initWithLayout:column:", self, v5);
  else
    return objc_msgSend(-[THBodyLayout parent](self, "parent"), "nextTargetFromLayout:column:", self, 0);
}

- (id)firstTarget
{
  id result;

  result = objc_msgSend(-[THBodyLayout nonEmptyColumns](self, "nonEmptyColumns"), "count");
  if (result)
    return -[THGuidedPanColumnTarget initWithLayout:column:]([THGuidedPanColumnTarget alloc], "initWithLayout:column:", self, objc_msgSend(-[THBodyLayout nonEmptyColumns](self, "nonEmptyColumns"), "firstObject"));
  return result;
}

- (id)previousTargetFromLayout:(id)a3 column:(id)a4
{
  id v5;

  v5 = objc_msgSend(-[THBodyLayout nonEmptyColumns](self, "nonEmptyColumns", a3), "tsu_objectBeforeObjectIdenticalTo:", a4);
  if (v5)
    return -[THGuidedPanColumnTarget initWithLayout:column:]([THGuidedPanColumnTarget alloc], "initWithLayout:column:", self, v5);
  else
    return objc_msgSend(-[THBodyLayout parent](self, "parent"), "previousTargetFromLayout:column:", self, 0);
}

- (id)lastTarget
{
  id result;

  result = objc_msgSend(-[THBodyLayout nonEmptyColumns](self, "nonEmptyColumns"), "count");
  if (result)
    return -[THGuidedPanColumnTarget initWithLayout:column:]([THGuidedPanColumnTarget alloc], "initWithLayout:column:", self, objc_msgSend(-[THBodyLayout nonEmptyColumns](self, "nonEmptyColumns"), "lastObject"));
  return result;
}

@end
