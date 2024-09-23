@implementation THFlowSectionController

- (THFlowSectionController)initWithDelegate:(id)a3 pagePositionController:(id)a4 presentationType:(id)a5
{
  THFlowSectionController *result;
  CGSize size;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THFlowSectionController;
  result = -[THSectionController initWithDelegate:pagePositionController:presentationType:](&v7, "initWithDelegate:pagePositionController:presentationType:", a3, a4, a5);
  if (result)
  {
    result->_firstLineCacheRange = *(_NSRange *)NSInvalidRange;
    size = CGRectZero.size;
    result->_firstLineCacheRect.origin = CGRectZero.origin;
    result->_firstLineCacheRect.size = size;
  }
  return result;
}

- (id)infosToDisplayForRelativePageRange:(_NSRange)a3 forceLoad:(BOOL)a4
{
  id v5;
  NSArray *v6;
  _QWORD v8[5];

  v5 = -[TSUPointerKeyDictionary allValues](self->super.mSectionInfos, "allValues", a3.location, a3.length, a4);
  v6 = -[THNavigationUnit contentNodes](self->super.mCurrentNavigationUnit, "contentNodes");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_108EA0;
  v8[3] = &unk_427B40;
  v8[4] = v6;
  return objc_msgSend(v5, "sortedArrayUsingComparator:", v8);
}

- (id)infosToDisplayOnlyForRelativePageRange:(_NSRange)a3 forceLoad:(BOOL)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  id v7;

  length = a3.length;
  location = a3.location;
  v6 = -[THFlowSectionController infosToDisplayForRelativePageRange:forceLoad:](self, "infosToDisplayForRelativePageRange:forceLoad:", a3.location, a3.length, a4);
  v7 = +[NSMutableArray array](NSMutableArray, "array");
  if (location < location + length)
  {
    do
    {
      if (location >= (unint64_t)objc_msgSend(v6, "count"))
        break;
      objc_msgSend(v7, "addObject:", objc_msgSend(v6, "objectAtIndexedSubscript:", location++));
      --length;
    }
    while (length);
  }
  return v7;
}

- (id)bodyAnchorForCanvasRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v7;
  double v8;
  double v9;
  double v10;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[THFlowSectionController pageControllerForContentOffset:](self, "pageControllerForContentOffset:");
  if (!v7)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController bodyAnchorForCanvasRect:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm"), 89, CFSTR("invalid nil value for '%s'"), "pageController");
  objc_msgSend(v7, "i_rectForSectionLayout");
  v8 = v12.origin.x;
  v9 = v12.origin.y;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  v13 = CGRectIntersection(v12, v14);
  v10 = TSDSubtractPoints((__n128)v13.origin, *(__n128 *)&v13.origin.y, v8, v9);
  return objc_msgSend(v7, "bodyAnchorForRect:onMissReturnClosestBody:", 1, v10);
}

- (id)layoutAnchorForContentOffset:(CGPoint)a3
{
  double y;
  double x;
  id v5;
  THFlowLayoutAnchor *v6;

  y = a3.y;
  x = a3.x;
  v5 = -[THFlowSectionController pageControllerForContentOffset:](self, "pageControllerForContentOffset:");
  if (!v5)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController layoutAnchorForContentOffset:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm"), 103, CFSTR("invalid nil value for '%s'"), "pageController");
  v6 = -[THFlowLayoutAnchor initWithPageController:absoluteOffset:]([THFlowLayoutAnchor alloc], "initWithPageController:absoluteOffset:", v5, x, y);
  if (!v6)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController layoutAnchorForContentOffset:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm"), 107, CFSTR("invalid nil value for '%s'"), "anchor");
  return v6;
}

- (void)layoutContentAtLayoutAnchor:(id)a3 padAbove:(double)a4 padBelow:(double)a5 layoutController:(id)a6
{
  NSArray *v9;
  char *v10;
  char *v11;
  double v12;
  char *v13;
  id v14;
  NSUInteger v16;
  double v17;
  NSUInteger v18;
  char *v19;
  id v20;
  double v21;
  double v22;

  v21 = a5;
  v22 = a4;
  if (a3)
  {
    v9 = -[THFlowSectionController sortedPageControllers](self, "sortedPageControllers");
    v10 = -[NSArray indexOfObjectIdenticalTo:](v9, "indexOfObjectIdenticalTo:", objc_msgSend(a3, "pageController"));
    if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm"), 121, CFSTR("layout anchor is from another navigation unit"));
    }
    else
    {
      v11 = v10;
      -[THFlowSectionController p_preparePageControllerForLayout:layoutController:](self, "p_preparePageControllerForLayout:layoutController:", objc_msgSend(a3, "pageController"), a6);
      objc_msgSend(objc_msgSend(a3, "pageController"), "layoutContentAtLayoutAnchor:padAbove:padBelow:", a3, &v22, &v21);
      if (v11)
      {
        v12 = v22;
        if (v22 > 0.0)
        {
          v13 = v11 - 1;
          do
          {
            v14 = -[NSArray objectAtIndex:](v9, "objectAtIndex:", v13, v12);
            -[THFlowSectionController p_preparePageControllerForLayout:layoutController:](self, "p_preparePageControllerForLayout:layoutController:", v14, a6);
            objc_msgSend(v14, "layoutContentFromBottom:", &v22);
            if (v13-- == 0)
              break;
            v12 = v22;
          }
          while (v22 > 0.0);
        }
      }
      v16 = -[NSArray count](v9, "count", v12);
      if ((unint64_t)(v11 + 1) < v16)
      {
        v17 = v21;
        if (v21 > 0.0)
        {
          v18 = v16;
          v19 = v11 + 2;
          do
          {
            v20 = -[NSArray objectAtIndex:](v9, "objectAtIndex:", v19 - 1, v17);
            -[THFlowSectionController p_preparePageControllerForLayout:layoutController:](self, "p_preparePageControllerForLayout:layoutController:", v20, a6);
            objc_msgSend(v20, "layoutContentFromTop:", &v21);
            if ((unint64_t)v19 >= v18)
              break;
            v17 = v21;
            ++v19;
          }
          while (v21 > 0.0);
        }
      }
    }
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0, a6), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm"), 114, CFSTR("invalid nil value for '%s'"), "layoutAnchor");
  }
}

- (void)layoutContentFromBottom:(double)a3 layoutController:(id)a4
{
  NSArray *v7;
  char *v8;
  char *v9;
  id v10;
  BOOL v11;
  double v12;

  v12 = a3;
  v7 = -[THFlowSectionController sortedPageControllers](self, "sortedPageControllers");
  v8 = -[NSArray count](v7, "count");
  if (v8 && a3 > 0.0)
  {
    v9 = v8 - 1;
    do
    {
      v10 = -[NSArray objectAtIndex:](v7, "objectAtIndex:", v9);
      -[THFlowSectionController p_preparePageControllerForLayout:layoutController:](self, "p_preparePageControllerForLayout:layoutController:", v10, a4);
      objc_msgSend(v10, "layoutContentFromBottom:", &v12);
      v11 = v9-- != 0;
    }
    while (v11 && v12 > 0.0);
  }
}

- (_NSRange)firstLineInRect:(CGRect)a3 forBodyAnchor:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  BOOL v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  id v22;
  NSUInteger v23;
  _NSRange result;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[THFlowSectionController firstLineCacheRect](self, "firstLineCacheRect");
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  if (!CGRectEqualToRect(v25, v28)
    || ((v10 = -[THFlowSectionController firstLineCacheRange](self, "firstLineCacheRange"), v10 == NSInvalidRange[0])
      ? (v12 = v11 == NSInvalidRange[1])
      : (v12 = 0),
        v12))
  {
    v13 = -[TSUPointerKeyDictionary objectForKey:](self->super.mPageControllers, "objectForKey:", objc_msgSend(a4, "contentNode"));
    if (!v13)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController firstLineInRect:forBodyAnchor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm"), 168, CFSTR("invalid nil value for '%s'"), "pageController");
    objc_msgSend(v13, "i_rectForSectionLayout");
    v14 = v26.origin.x;
    v15 = v26.origin.y;
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v27 = CGRectIntersection(v26, v29);
    v16 = v27.size.width;
    v17 = v27.size.height;
    v18 = TSDSubtractPoints((__n128)v27.origin, *(__n128 *)&v27.origin.y, v14, v15);
    v20 = objc_msgSend(v13, "firstLineInRect:fromCharIndex:", objc_msgSend(a4, "range"), v18, v19, v16, v17);
    -[THFlowSectionController setFirstLineCacheRange:](self, "setFirstLineCacheRange:", v20, v21);
    -[THFlowSectionController setFirstLineCacheRect:](self, "setFirstLineCacheRect:", x, y, width, height);
  }
  v22 = -[THFlowSectionController firstLineCacheRange](self, "firstLineCacheRange");
  result.length = v23;
  result.location = (NSUInteger)v22;
  return result;
}

- (id)newPageControllerForContentNode:(id)a3
{
  return -[THFlowPageController initWithDelegate:layoutObserver:contentNode:presentationType:]([THFlowPageController alloc], "initWithDelegate:layoutObserver:contentNode:presentationType:", self, -[THSectionControllerDelegate flowLayoutObserverForSectionController:](-[THSectionController delegate](self, "delegate"), "flowLayoutObserverForSectionController:", self), a3, -[THSectionController presentationType](self, "presentationType"));
}

- (id)newSectionInfoForContentNode:(id)a3
{
  THFlowSectionInfo *v4;

  v4 = objc_alloc_init(THFlowSectionInfo);
  -[THFlowSectionInfo setPresentationType:](v4, "setPresentationType:", -[THSectionController presentationType](self, "presentationType"));
  return v4;
}

- (CGSize)sectionSizeForContentNode:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(-[TSUPointerKeyDictionary objectForKey:](self->super.mPageControllers, "objectForKey:", a3), "desiredPageSizeForRelativePageIndex:", 0);
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSArray)sortedPageControllers
{
  NSArray *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (NSArray *)+[NSMutableArray array](NSMutableArray, "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[THNavigationUnit contentNodes](self->super.mCurrentNavigationUnit, "contentNodes", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[NSArray addObject:](v3, "addObject:", -[TSUPointerKeyDictionary objectForKey:](self->super.mPageControllers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8)));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)pageControllerForContentOffset:(CGPoint)a3
{
  double y;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  CGFloat x;
  CGFloat v12;
  CGFloat width;
  CGFloat height;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  CGRect v21;
  CGRect v22;

  y = a3.y;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = -[THNavigationUnit contentNodes](self->super.mCurrentNavigationUnit, "contentNodes", 0);
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v17;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v8)
      objc_enumerationMutation(v5);
    v10 = -[TSUPointerKeyDictionary objectForKey:](self->super.mPageControllers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9));
    objc_msgSend(v10, "i_rectForSectionLayout");
    x = v21.origin.x;
    v12 = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
    if (y >= CGRectGetMinY(v21))
    {
      v22.origin.x = x;
      v22.origin.y = v12;
      v22.size.width = width;
      v22.size.height = height;
      if (y < CGRectGetMaxY(v22))
        return v10;
    }
    if (v7 == (id)++v9)
    {
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        goto LABEL_3;
      return v10;
    }
  }
}

- (void)p_preparePageControllerForLayout:(id)a3 layoutController:(id)a4
{
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "prepareForLayout");
  v7 = -[TSUPointerKeyDictionary objectForKey:](self->super.mSectionInfos, "objectForKey:", objc_msgSend(a3, "contentNode"));
  v8 = objc_opt_class(THFlowSectionLayout);
  *(_QWORD *)&v9 = TSUDynamicCast(v8, objc_msgSend(a4, "layoutForInfo:", v7)).n128_u64[0];
  v11 = v10;
  if (!v10)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v9), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowSectionController p_preparePageControllerForLayout:layoutController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowSectionController.mm"), 241, CFSTR("invalid nil value for '%s'"), "sectionLayout");
  objc_msgSend(v11, "ensurePageLayoutCreated", v9);
}

- (id)description
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@=%p pageControllers=%@>"), NSStringFromClass(v3), self, -[THFlowSectionController sortedPageControllers](self, "sortedPageControllers"));
}

- (_NSRange)firstLineCacheRange
{
  _NSRange *p_firstLineCacheRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_firstLineCacheRange = &self->_firstLineCacheRange;
  location = self->_firstLineCacheRange.location;
  length = p_firstLineCacheRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setFirstLineCacheRange:(_NSRange)a3
{
  self->_firstLineCacheRange = a3;
}

- (CGRect)firstLineCacheRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_firstLineCacheRect.origin.x;
  y = self->_firstLineCacheRect.origin.y;
  width = self->_firstLineCacheRect.size.width;
  height = self->_firstLineCacheRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFirstLineCacheRect:(CGRect)a3
{
  self->_firstLineCacheRect = a3;
}

@end
