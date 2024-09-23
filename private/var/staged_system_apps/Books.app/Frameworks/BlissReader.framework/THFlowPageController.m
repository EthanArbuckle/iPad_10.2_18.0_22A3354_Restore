@implementation THFlowPageController

- (THFlowPageController)initWithDelegate:(id)a3 layoutObserver:(id)a4 contentNode:(id)a5 presentationType:(id)a6
{
  THFlowPageController *v10;
  THSectionInfo *v11;
  CGSize size;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)THFlowPageController;
  v10 = -[THFlowPageController init](&v14, "init");
  if (v10)
  {
    if (objc_msgSend(a5, "pageCountForPresentationType:", a6) != (char *)&dword_0 + 1)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController initWithDelegate:layoutObserver:contentNode:presentationType:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 84, CFSTR("flow mode only supports one page per section"));
    v10->_delegate = (THPageControllerDelegate *)a3;
    v10->_layoutObserver = (THFlowLayoutObserver *)a4;
    v10->_contentNode = (THModelContentNode *)a5;
    v10->_presentationType = (THPresentationType *)a6;
    v10->_drawablesLayoutController = -[THOffscreenLayoutController initWithCanvas:]([THOffscreenLayoutController alloc], "initWithCanvas:", 0);
    -[THOffscreenLayoutController setLayoutIsCompactWidth:](v10->_drawablesLayoutController, "setLayoutIsCompactWidth:", -[THPresentationType isCompactWidth](-[THFlowPageController presentationType](v10, "presentationType"), "isCompactWidth"));
    -[THOffscreenLayoutController setLayoutIsCompactHeight:](v10->_drawablesLayoutController, "setLayoutIsCompactHeight:", -[THPresentationType isCompactHeight](-[THFlowPageController presentationType](v10, "presentationType"), "isCompactHeight"));
    -[THOffscreenLayoutController setDelegate:](v10->_drawablesLayoutController, "setDelegate:", v10);
    v11 = objc_alloc_init(THSectionInfo);
    v10->_offscreenSectionInfo = v11;
    -[THSectionInfo setPageController:](v11, "setPageController:", v10);
    size = CGRectZero.size;
    v10->_rectForAnchor.origin = CGRectZero.origin;
    v10->_rectForAnchor.size = size;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_delegate
    || self->_drawablesLayoutController
    || self->_offscreenSectionInfo
    || self->_contentNode
    || self->_pageInfo
    || self->_bodyInfo
    || self->_presentationType)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 108, CFSTR("should have called -teardown on flow page controller"));
  }

  self->_cachedAnchorForRect = 0;
  v3.receiver = self;
  v3.super_class = (Class)THFlowPageController;
  -[THFlowPageController dealloc](&v3, "dealloc");
}

- (CGSize)widgetStackMaxContainerSizeForSize:(CGSize)a3
{
  double height;
  CGFloat width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[THPresentationType pageSize](-[THFlowPageController presentationType](self, "presentationType"), "pageSize");
  v6 = fmin(height, v5 + 10.0 * -2.0);
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)prepareForLayout
{
  objc_sync_enter(self);
  -[THFlowPageController p_ensureLoaded](self, "p_ensureLoaded");
  objc_sync_exit(self);
}

- (void)layoutContentAtLayoutAnchor:(id)a3 padAbove:(double *)a4 padBelow:(double *)a5
{
  _QWORD v9[7];

  objc_sync_enter(self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_102870;
  v9[3] = &unk_429A40;
  v9[4] = a3;
  v9[5] = a4;
  v9[6] = a5;
  -[THFlowPageController p_withPageLayoutPerformBlock:](self, "p_withPageLayoutPerformBlock:", v9);
  objc_sync_exit(self);
}

- (void)layoutContentFromBottom:(double *)a3
{
  _QWORD v5[5];

  objc_sync_enter(self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1029A8;
  v5[3] = &unk_429A60;
  v5[4] = a3;
  -[THFlowPageController p_withPageLayoutPerformBlock:](self, "p_withPageLayoutPerformBlock:", v5);
  objc_sync_exit(self);
}

- (void)layoutContentFromTop:(double *)a3
{
  _QWORD v5[5];

  objc_sync_enter(self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_102A38;
  v5[3] = &unk_429A60;
  v5[4] = a3;
  -[THFlowPageController p_withPageLayoutPerformBlock:](self, "p_withPageLayoutPerformBlock:", v5);
  objc_sync_exit(self);
}

- (id)bodyAnchorForRect:(CGRect)a3
{
  return -[THFlowPageController bodyAnchorForRect:onMissReturnClosestBody:](self, "bodyAnchorForRect:onMissReturnClosestBody:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)bodyAnchorForRect:(CGRect)a3 onMissReturnClosestBody:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  unint64_t v10;
  id v11;
  CGRect v13;
  CGRect v14;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_sync_enter(self);
  -[THFlowPageController rectForAnchor](self, "rectForAnchor");
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  if (!CGRectEqualToRect(v13, v14) || !-[THFlowPageController cachedAnchorForRect](self, "cachedAnchorForRect"))
  {
    v10 = -[THFlowPageController firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:onMissReturnClosestBody:](self, "firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:onMissReturnClosestBody:", 0, v4, x, y, width, height);
    v11 = -[THModelContentNode nodeUniqueIDForInfo:forPresentationType:](self->_contentNode, "nodeUniqueIDForInfo:forPresentationType:", -[THModelBodyTextInfo bodyStorage](-[THFlowPageController bodyInfo](self, "bodyInfo"), "bodyStorage"), self->_presentationType);

    self->_cachedAnchorForRect = 0;
    self->_cachedAnchorForRect = -[THModelStorageAnchor initWithContentNode:storageUID:range:]([THModelStorageAnchor alloc], "initWithContentNode:storageUID:range:", self->_contentNode, v11, v10, 1);
    -[THFlowPageController setRectForAnchor:](self, "setRectForAnchor:", x, y, width, height);
  }
  objc_sync_exit(self);
  return -[THFlowPageController cachedAnchorForRect](self, "cachedAnchorForRect");
}

- (unint64_t)bodyIndexClosestToPoint:(CGPoint)a3
{
  double y;
  double v5;
  double v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  unint64_t v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  unint64_t v11;
  unint64_t v12;

  y = a3.y;
  -[THFlowPageController bodyOffset](self, "bodyOffset", a3.x);
  v6 = v5;
  objc_sync_enter(self);
  if (self->_isLoaded)
  {
    begin = self->_bodyHints.__begin_;
    end = self->_bodyHints.__end_;
    if (begin == end)
    {
      v9 = 0;
    }
    else
    {
      v9 = 0;
      v10 = self->_bodyHints.__begin_;
      do
      {
        if (y - v6 < *(double *)v10 + *((double *)v10 + 1))
          break;
        ++v9;
        v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v10 + 40);
      }
      while (v10 != end);
    }
    v12 = 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 3) - 1;
    if (v9 >= v12)
      v11 = v12;
    else
      v11 = v9;
  }
  else
  {
    v11 = 0;
  }
  objc_sync_exit(self);
  return v11;
}

- (double)bodyOffset
{
  double v2;

  -[THFlowPageController p_overriddenBodyFrame](self, "p_overriddenBodyFrame");
  return v2;
}

- (double)bodyTopAtIndex:(unint64_t)a3
{
  double v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v7;
  double v8;

  objc_sync_enter(self);
  v5 = 0.0;
  if (self->_isLoaded)
  {
    begin = self->_bodyHints.__begin_;
    v7 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
    if (v7 <= a3)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController bodyTopAtIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 226, CFSTR("invalid body index"));
      begin = self->_bodyHints.__begin_;
      v7 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
    }
    if (v7 > a3)
      v5 = *((double *)begin + 5 * a3);
  }
  objc_sync_exit(self);
  -[THFlowPageController bodyOffset](self, "bodyOffset");
  return v5 + v8;
}

- (_NSRange)firstLineInRect:(CGRect)a3 fromCharIndex:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _QWORD v14[10];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  __n128 (*v18)(__n128 *, __n128 *);
  uint64_t (*v19)();
  const char *v20;
  __int128 v21;
  _NSRange result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = 0;
  v16 = &v15;
  v17 = 0x4012000000;
  v18 = sub_102E80;
  v19 = nullsub_23;
  v20 = "";
  v21 = xmmword_3146B0;
  objc_sync_enter(self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_102E90;
  v14[3] = &unk_429A88;
  v14[4] = &v15;
  *(CGFloat *)&v14[5] = x;
  *(CGFloat *)&v14[6] = y;
  *(CGFloat *)&v14[7] = width;
  *(CGFloat *)&v14[8] = height;
  v14[9] = a4;
  -[THFlowPageController p_withPageLayoutPerformBlock:](self, "p_withPageLayoutPerformBlock:", v14);
  objc_sync_exit(self);
  v10 = v16[6];
  v11 = v16[7];
  _Block_object_dispose(&v15, 8);
  v12 = v10;
  v13 = v11;
  result.length = v13;
  result.location = v12;
  return result;
}

- (BOOL)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 originalContentOffset:(CGPoint)a5 targetContentOffset:(CGPoint *)a6
{
  double y;
  double v8;
  double v11;
  double v12;
  CGFloat x;
  double v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v23;
  uint64_t v24;
  double v26;
  double v27;
  double v28;
  double v30;

  y = a4.y;
  if (fabs(a4.y) <= 0.2)
    return 0;
  v8 = a5.y;
  -[THPageControllerDelegate canvasOriginForPageController:](self->_delegate, "canvasOriginForPageController:", self);
  if (self->_bodyHints.__end_ == self->_bodyHints.__begin_)
    return 0;
  v12 = v11;
  x = a6->x;
  v14 = a6->y;
  v15 = 1;
  v16 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    v17 = v15 - 1;
    -[THFlowPageController i_rectForBodyIndex:](self, "i_rectForBodyIndex:", v15 - 1);
    v19 = v12 + v18;
    v21 = v20 + v12 + v18;
    if (v19 < v14 && v21 > v14)
      break;
    if (v21 < v14)
      v23 = v15 - 1;
    else
      v23 = 0x7FFFFFFFFFFFFFFFLL;
    if (v19 > v14)
      v24 = v15 - 1;
    else
      v24 = 0x7FFFFFFFFFFFFFFFLL;
    if (y > 0.0)
      v23 = v24;
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      v16 = v23;
    if (v15++ >= 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - self->_bodyHints.__begin_) >> 3))
      goto LABEL_26;
  }
  if (y < 0.0)
  {
LABEL_28:
    -[THFlowPageController i_rectForBodyIndex:](self, "i_rectForBodyIndex:", v17);
    v27 = v12 + v30;
    goto LABEL_29;
  }
  if (y <= 0.0
    || v17 >= 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - self->_bodyHints.__begin_) >> 3) - 1
    || (-[THFlowPageController i_rectForBodyIndex:](self, "i_rectForBodyIndex:", v15),
        v27 = v12 + v26,
        objc_msgSend(a3, "frame"),
        v27 >= v8 + v28))
  {
LABEL_26:
    v17 = v16;
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    goto LABEL_28;
  }
LABEL_29:
  a6->x = x;
  a6->y = v27;
  return 1;
}

- (THPagePositionController)pagePositionController
{
  return (THPagePositionController *)-[THPageControllerDelegate pagePositionControllerForPageController:](self->_delegate, "pagePositionControllerForPageController:", self);
}

- (unint64_t)pageCount
{
  return 1;
}

- (void)teardown
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;

  objc_sync_enter(self);
  self->_delegate = 0;
  -[THOffscreenLayoutController setDelegate:](self->_drawablesLayoutController, "setDelegate:", 0);

  self->_drawablesLayoutController = 0;
  self->_offscreenSectionInfo = 0;

  self->_contentNode = 0;
  self->_presentationType = 0;

  self->_pageInfo = 0;
  self->_bodyInfo = 0;
  begin = self->_bodyHints.__begin_;
  end = self->_bodyHints.__end_;
  while (begin != end)
  {

    *((_QWORD *)begin + 4) = 0;
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 40);
  }
  objc_sync_exit(self);
}

- (id)pageInfoForRelativePageIndex:(unint64_t)a3
{
  if (a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController pageInfoForRelativePageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 379, CFSTR("only one page in flow mode"));
  return -[THFlowPageController pageInfo](self, "pageInfo");
}

- (id)bodyInfoForCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  void *v17;

  objc_sync_enter(self);
  begin = self->_bodyHints.__begin_;
  end = self->_bodyHints.__end_;
  if (end != begin)
  {
    v8 = 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 3);
    do
    {
      v9 = v8 >> 1;
      v10 = (char *)begin + 40 * (v8 >> 1);
      v11 = *((_QWORD *)v10 + 3) + *((_QWORD *)v10 + 2);
      v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v10 + 40);
      v8 += ~(v8 >> 1);
      if (v11 <= a3)
        begin = v12;
      else
        v8 = v9;
    }
    while (v8);
  }
  if (begin == end)
  {
    v17 = 0;
  }
  else
  {
    v13 = *((_QWORD *)begin + 2);
    v15 = a3 >= v13;
    v14 = a3 - v13;
    v15 = !v15 || v14 >= *((_QWORD *)begin + 3);
    if (v15)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController bodyInfoForCharIndex:forceLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 392, CFSTR("found the wrong body hint"));
    v16 = objc_opt_class(THModelBodyTextInfo);
    v17 = (void *)TSUCheckedDynamicCast(v16, *((_QWORD *)begin + 4));
  }
  objc_sync_exit(self);
  return v17;
}

- (id)bodyInfoForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  return -[THFlowPageController bodyInfoForCharIndex:forceLayout:](self, "bodyInfoForCharIndex:forceLayout:", a3, a4);
}

- (unint64_t)relativePageIndexForAnchoredCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  return 0;
}

- (unint64_t)relativePageIndexForCharIndex:(unint64_t)a3 forceLayout:(BOOL)a4
{
  return 0;
}

- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3 forRelativePageIndex:(unint64_t)a4
{
  return -[THFlowPageController firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:onMissReturnClosestBody:](self, "firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:onMissReturnClosestBody:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (unint64_t)firstBodyCharacterIndexOverlappingPageRect:(CGRect)a3 forRelativePageIndex:(unint64_t)a4 onMissReturnClosestBody:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v14;
  _QWORD v16[9];
  _QWORD v17[9];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  objc_sync_enter(self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_103458;
  v17[3] = &unk_429AB0;
  v17[4] = &v18;
  *(CGFloat *)&v17[5] = x;
  *(CGFloat *)&v17[6] = y;
  *(CGFloat *)&v17[7] = width;
  *(CGFloat *)&v17[8] = height;
  -[THFlowPageController p_withPageLayoutPerformBlock:](self, "p_withPageLayoutPerformBlock:", v17);
  v11 = v19;
  v12 = v19[3];
  if (v12 == 0x7FFFFFFFFFFFFFFFLL && v5)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_103490;
    v16[3] = &unk_429AB0;
    *(CGFloat *)&v16[5] = x;
    *(CGFloat *)&v16[6] = y;
    *(CGFloat *)&v16[7] = width;
    *(CGFloat *)&v16[8] = height;
    v16[4] = &v18;
    -[THFlowPageController p_withPageLayoutPerformBlock:](self, "p_withPageLayoutPerformBlock:", v16);
    v11 = v19;
    v12 = v19[3];
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    v11[3] = 0;
  objc_sync_exit(self);
  v14 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v14;
}

- (CGPoint)originOfCharacterIndex:(unint64_t)a3 forRelativePageIndex:(unint64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v10[6];
  uint64_t v11;
  double *v12;
  uint64_t v13;
  __n128 (*v14)(__n128 *, __n128 *);
  uint64_t (*v15)();
  const char *v16;
  CGPoint v17;
  CGPoint result;

  v11 = 0;
  v12 = (double *)&v11;
  v14 = sub_1037C4;
  v15 = nullsub_24;
  v13 = 0x4012000000;
  v16 = "";
  v17 = CGPointZero;
  objc_sync_enter(self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1037D4;
  v10[3] = &unk_429AD8;
  v10[4] = &v11;
  v10[5] = a3;
  -[THFlowPageController p_withPageLayoutPerformBlock:](self, "p_withPageLayoutPerformBlock:", v10);
  objc_sync_exit(self);
  v6 = v12[6];
  v7 = v12[7];
  _Block_object_dispose(&v11, 8);
  v8 = v6;
  v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGSize)desiredPageSizeForRelativePageIndex:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  if (a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController desiredPageSizeForRelativePageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 485, CFSTR("only one page in flow mode"));
  objc_sync_enter(self);
  -[THPagePositionController pageSize](-[THFlowPageController pagePositionController](self, "pagePositionController"), "pageSize");
  v5 = v4;
  if (self->_isLoaded)
  {
    v6 = 0.0;
    if (-[THModelFlowPageInfo hasBodyFlow](-[THFlowPageController pageInfo](self, "pageInfo"), "hasBodyFlow"))
      v6 = *((double *)self->_bodyHints.__end_ - 5) + *((double *)self->_bodyHints.__end_ - 4);
    -[THFlowPageController bodyOffset](self, "bodyOffset");
    v8 = v7;
    -[THModelPageInfo autosizeMargin](-[THFlowPageController pageInfo](self, "pageInfo"), "autosizeMargin");
    v10 = v6 + v8 + v9 + 20.0 + self->_gutterOverhang;
    v11 = ceilf(v10);
  }
  else
  {
    v11 = 5000.0;
  }
  objc_sync_exit(self);
  v12 = v5;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGPoint)pageOriginForRelativePageIndex:(unint64_t)a3 pageFrame:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[THPagePositionController pageOriginForRelativePageIndex:](-[THFlowPageController pagePositionController](self, "pagePositionController", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "pageOriginForRelativePageIndex:", a3);
  result.y = v5;
  result.x = v4;
  return result;
}

- (unint64_t)rootSearchTargetCountThroughIndex:(unint64_t)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController rootSearchTargetCountThroughIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 523, CFSTR("flow page controller can't search yet"));
  return 0;
}

- (void)withRootSearchTargetAtIndex:(unint64_t)a3 executeBlock:(id)a4
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController withRootSearchTargetAtIndex:executeBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 529, CFSTR("flow page controller can't search yet"));
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5, a6), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController nextRootSearchTargetIndexFromIndex:forString:options:inDirection:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 534, CFSTR("flow page controller can't search yet"));
  return a3;
}

- (unint64_t)i_bodyCount
{
  unint64_t v3;

  objc_sync_enter(self);
  if (!self->_isLoaded)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_bodyCount]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 545, CFSTR("don't know body count before being loaded"));
  v3 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - self->_bodyHints.__begin_) >> 3);
  objc_sync_exit(self);
  return v3;
}

- (CGRect)i_rectForBodyIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v14;
  double *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[THFlowPageController p_overriddenBodyFrame](self, "p_overriddenBodyFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_sync_enter(self);
  begin = self->_bodyHints.__begin_;
  v14 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  if (v14 <= a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_rectForBodyIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 557, CFSTR("no height for this body index"));
    begin = self->_bodyHints.__begin_;
    v14 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  }
  if (v14 > a3)
  {
    -[THFlowPageController bodyOffset](self, "bodyOffset");
    v15 = (double *)((char *)begin + 40 * a3);
    v12 = v15[1];
    v8 = v16 + *v15;
  }
  objc_sync_exit(self);
  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)i_setHeight:(double)a3 forBodyIndex:(unint64_t)a4
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v8;
  double v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  double *v11;
  double *i;

  objc_sync_enter(self);
  begin = self->_bodyHints.__begin_;
  v8 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  if (v8 <= a4)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_setHeight:forBodyIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 573, CFSTR("no height for this body index"));
    begin = self->_bodyHints.__begin_;
    v8 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  }
  if (v8 > a4)
  {
    v9 = a3 - *((double *)begin + 5 * a4 + 1);
    if (v9 != 0.0)
    {
      -[THFlowLayoutObserver flowPageControllerWillChangeContentHeight:](self->_layoutObserver, "flowPageControllerWillChangeContentHeight:", self);
      end = self->_bodyHints.__end_;
      v11 = (double *)((char *)self->_bodyHints.__begin_ + 40 * a4);
      v11[1] = a3;
      for (i = v11 + 5; i != (double *)end; i += 5)
        *i = v9 + *i;
    }
  }
  objc_sync_exit(self);
}

- (_NSRange)i_textRangeForBodyIndex:(unint64_t)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v6;
  char *v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  objc_sync_enter(self);
  begin = self->_bodyHints.__begin_;
  v6 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  if (v6 <= a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_textRangeForBodyIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 598, CFSTR("no text range for this body index"));
    begin = self->_bodyHints.__begin_;
    v6 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  }
  if (v6 <= a3)
  {
    v8 = 0;
    v9 = 0;
  }
  else
  {
    v7 = (char *)begin + 40 * a3;
    v9 = *((_QWORD *)v7 + 2);
    v8 = *((_QWORD *)v7 + 3);
  }
  objc_sync_exit(self);
  v10 = v9;
  v11 = v8;
  result.length = v11;
  result.location = v10;
  return result;
}

- (id)i_infoForBodyIndex:(unint64_t)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v6;
  void *v7;

  objc_sync_enter(self);
  begin = self->_bodyHints.__begin_;
  v6 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  if (v6 <= a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_infoForBodyIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 614, CFSTR("no info for this body index"));
    begin = self->_bodyHints.__begin_;
    v6 = 0xCCCCCCCCCCCCCCCDLL * ((self->_bodyHints.__end_ - begin) >> 3);
  }
  if (v6 <= a3)
    v7 = 0;
  else
    v7 = (void *)*((_QWORD *)begin + 5 * a3 + 4);
  objc_sync_exit(self);
  return v7;
}

- (double)i_gutterOverhang
{
  return self->_gutterOverhang;
}

- (void)i_setGutterOverhang:(double)a3
{
  objc_sync_enter(self);
  self->_gutterOverhang = a3;
  objc_sync_exit(self);
}

- (CGRect)i_rectForPageLayout
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = TSDRectWithSize(-[THFlowPageController desiredPageSizeForRelativePageIndex:](self, "desiredPageSizeForRelativePageIndex:", 0));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)i_pageHintForPageIndex:(unint64_t)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_pageHintForPageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 646, CFSTR("flow page controller doesn't have normal page hints"));
  return 0;
}

- (void)i_setPageHintSize:(CGSize)a3 forRelativePageIndex:(unint64_t)a4
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a4, a3.width, a3.height), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_setPageHintSize:forRelativePageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 652, CFSTR("flow page controller doesn't want to be told the page size"));
}

- (void)i_trimPageAtIndex:(unint64_t)a3 toCharIndex:(unint64_t)a4 inTarget:(id)a5 removeAutoNumberFootnoteCount:(unint64_t)a6
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3, a4, a5, a6), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_trimPageAtIndex:toCharIndex:inTarget:removeAutoNumberFootnoteCount:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 657, CFSTR("flow page controller doesn't support trimming"));
}

- (id)i_columnPriorToPageIndex:(unint64_t)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_columnPriorToPageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 662, CFSTR("flow page controller doesn't support prior column"));
  return 0;
}

- (id)i_firstChildHintAfterPageIndex:(unint64_t)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_firstChildHintAfterPageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 668, CFSTR("flow page controller doesn't support child hints"));
  return 0;
}

- (id)i_columnAfterPageIndex:(unint64_t)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_columnAfterPageIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 674, CFSTR("flow page controller doesn't support following column"));
  return 0;
}

- (void)i_inflateColumnsInBodyLayout:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_inflateColumnsInBodyLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 680, CFSTR("flow page controller doesn't support inflation"));
}

- (void)i_registerPageLayout:(id)a3
{
  THModelFlowPageInfo *v5;
  THFlowPageLayout *cachedPageLayout;

  objc_sync_enter(self);
  v5 = (THModelFlowPageInfo *)objc_msgSend(a3, "info");
  if (v5 != -[THFlowPageController pageInfo](self, "pageInfo"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_registerPageLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 686, CFSTR("page is from different section"));
  cachedPageLayout = self->_cachedPageLayout;
  if (cachedPageLayout
    && (objc_msgSend(-[THFlowPageLayout layoutController](cachedPageLayout, "layoutController"), "isLayoutOffscreen") & 1) == 0)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_registerPageLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 687, CFSTR("should only have one onscreen layout at a time"));
  }
  if (objc_msgSend(-[THFlowPageLayout layoutController](self->_cachedPageLayout, "layoutController"), "isLayoutOffscreen"))
  {
    -[THOffscreenLayoutController setInfos:](self->_drawablesLayoutController, "setInfos:", +[NSArray array](NSArray, "array"));
    -[THOffscreenLayoutController validateLayouts](self->_drawablesLayoutController, "validateLayouts");
  }
  self->_cachedPageLayout = (THFlowPageLayout *)a3;
  -[THFlowPageController setCachedPageLayoutValidated:](self, "setCachedPageLayoutValidated:", 0);
  objc_sync_exit(self);
}

- (void)i_unregisterPageLayout:(id)a3
{
  THModelFlowPageInfo *v5;

  objc_sync_enter(self);
  v5 = (THModelFlowPageInfo *)objc_msgSend(a3, "info");
  if (v5 != -[THFlowPageController pageInfo](self, "pageInfo"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_unregisterPageLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 704, CFSTR("page is from different section"));
  if (self->_cachedPageLayout != a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController i_unregisterPageLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 705, CFSTR("should only have one page layout at a time"));
  self->_cachedPageLayout = 0;

  self->_cachedAnchorForRect = 0;
  -[THFlowPageController setCachedPageLayoutValidated:](self, "setCachedPageLayoutValidated:", 0);
  -[THFlowPageController setRectForAnchor:](self, "setRectForAnchor:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_sync_exit(self);
}

- (CGRect)i_rectForSectionLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
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
  CGRect result;

  objc_sync_enter(self);
  -[THPageControllerDelegate canvasOriginForPageController:](self->_delegate, "canvasOriginForPageController:", self);
  v4 = v3;
  v6 = v5;
  v7 = -[THFlowPageController desiredPageSizeForRelativePageIndex:](self, "desiredPageSizeForRelativePageIndex:", 0);
  v10 = TSDRectWithOriginAndSize(v7, v4, v6, v8, v9);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_sync_exit(self);
  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)needsAnnotationSourceForLayout:(id)a3
{
  return 1;
}

- (BOOL)allowsDescendersToClip
{
  return -[THPageControllerDelegate allowsDescendersToClipForPageController:](-[THFlowPageController delegate](self, "delegate"), "allowsDescendersToClipForPageController:", self);
}

- (const)i_topicHintsAfterPageIndex:(unint64_t)a3
{
  return 0;
}

- (const)i_topicHintsPriorToPageIndex:(unint64_t)a3
{
  return 0;
}

- (THModelFlowPageInfo)pageInfo
{
  THModelFlowPageInfo *result;
  uint64_t v4;
  THModelFlowPageInfo *v5;
  THModelFlowPageInfo *v6;

  result = self->_pageInfo;
  if (!result)
  {
    v4 = objc_opt_class(THModelFlowPageInfo);
    TSUDynamicCast(v4, -[THModelContentNode pageAtRelativeIndex:forPresentationType:](self->_contentNode, "pageAtRelativeIndex:forPresentationType:", 0, -[THFlowPageController presentationType](self, "presentationType")));
    self->_pageInfo = v5;
    v6 = v5;
    result = self->_pageInfo;
    if (!result)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController pageInfo]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 756, CFSTR("invalid nil value for '%s'"), "_pageInfo");
      return self->_pageInfo;
    }
  }
  return result;
}

- (THModelBodyTextInfo)bodyInfo
{
  THModelBodyTextInfo *result;
  NSArray *v4;
  uint64_t v5;
  THModelBodyTextInfo *v6;
  THModelBodyTextInfo *v7;

  result = self->_bodyInfo;
  if (!result)
  {
    v4 = -[THModelPageInfo modelBodyInfos](-[THFlowPageController pageInfo](self, "pageInfo"), "modelBodyInfos");
    if ((char *)-[NSArray count](v4, "count") != (char *)&dword_0 + 1)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController bodyInfo]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 767, CFSTR("should only have one body info in flow"));
    v5 = objc_opt_class(THModelBodyTextInfo);
    TSUDynamicCast(v5, -[NSArray lastObject](v4, "lastObject"));
    self->_bodyInfo = v6;
    v7 = v6;
    result = self->_bodyInfo;
    if (!result)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController bodyInfo]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 771, CFSTR("invalid nil value for '%s'"), "_bodyInfo");
      return self->_bodyInfo;
    }
  }
  return result;
}

- (CGRect)p_overriddenBodyFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(-[THModelBodyTextInfo geometry](-[THFlowPageController bodyInfo](self, "bodyInfo"), "geometry"), "boundsBeforeRotation");
  -[THFlowLayoutObserver flowPageController:overrideForBodyFrame:](self->_layoutObserver, "flowPageController:overrideForBodyFrame:", self);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)p_ensureLoaded
{
  THWPStorage *v3;
  char *v4;
  char *v5;
  unint64_t v6;
  vector<THFlowBodyHint, std::allocator<THFlowBodyHint>> *p_bodyHints;
  double v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  THFlowBodyChunkInfo *v15;
  THFlowBodyChunkInfo *v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v26;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v28;
  __int128 v29;
  __int128 v30;

  if (!self->_isLoaded)
  {
    v3 = -[THModelBodyTextInfo bodyStorage](-[THFlowPageController bodyInfo](self, "bodyInfo"), "bodyStorage");
    v4 = (char *)-[THWPStorage paragraphCount](v3, "paragraphCount");
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      p_bodyHints = &self->_bodyHints;
      v8 = 0.0;
      do
      {
        v9 = -[THPageControllerDelegate isCompactFlowPresentationForPageController:](-[THFlowPageController delegate](self, "delegate"), "isCompactFlowPresentationForPageController:", self);
        v10 = 5;
        if (v9)
          v10 = 1;
        if (v10 >= (unint64_t)&v5[-v6])
          v11 = (unint64_t)&v5[-v6];
        else
          v11 = v10;
        v12 = -[THWPStorage textRangeForParagraphsInRange:](v3, "textRangeForParagraphsInRange:", v6, v11);
        v14 = v13;
        v15 = -[THFlowBodyChunkInfo initWithBodyInfo:]([THFlowBodyChunkInfo alloc], "initWithBodyInfo:", -[THFlowPageController bodyInfo](self, "bodyInfo"));
        v16 = v15;
        end = self->_bodyHints.__end_;
        value = self->_bodyHints.__end_cap_.__value_;
        if (end >= value)
        {
          v20 = 0xCCCCCCCCCCCCCCCDLL * ((end - p_bodyHints->__begin_) >> 3);
          v21 = v20 + 1;
          if (v20 + 1 > 0x666666666666666)
            sub_36C30();
          v22 = 0xCCCCCCCCCCCCCCCDLL * ((value - p_bodyHints->__begin_) >> 3);
          if (2 * v22 > v21)
            v21 = 2 * v22;
          if (v22 >= 0x333333333333333)
            v23 = 0x666666666666666;
          else
            v23 = v21;
          if (v23)
            v24 = (char *)sub_104D7C((uint64_t)&self->_bodyHints.__end_cap_, v23);
          else
            v24 = 0;
          v25 = &v24[40 * v20];
          *(double *)v25 = v8;
          *((_QWORD *)v25 + 1) = 0x4087700000000000;
          *((_QWORD *)v25 + 2) = v12;
          *((_QWORD *)v25 + 3) = v14;
          *((_QWORD *)v25 + 4) = v16;
          begin = self->_bodyHints.__begin_;
          v26 = self->_bodyHints.__end_;
          v28 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v25;
          if (v26 != begin)
          {
            do
            {
              v29 = *(_OWORD *)((char *)v26 - 40);
              v30 = *(_OWORD *)((char *)v26 - 24);
              *((_QWORD *)v28 - 1) = *((_QWORD *)v26 - 1);
              *(_OWORD *)((char *)v28 - 24) = v30;
              *(_OWORD *)((char *)v28 - 40) = v29;
              v28 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v28 - 40);
              v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v26 - 40);
            }
            while (v26 != begin);
            v26 = p_bodyHints->__begin_;
          }
          v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v25 + 40);
          self->_bodyHints.__begin_ = v28;
          self->_bodyHints.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v25 + 40);
          self->_bodyHints.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v24[40 * v23];
          if (v26)
            operator delete(v26);
        }
        else
        {
          *(double *)end = v8;
          *((_QWORD *)end + 1) = 0x4087700000000000;
          *((_QWORD *)end + 2) = v12;
          v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 40);
          *((_QWORD *)end + 3) = v14;
          *((_QWORD *)end + 4) = v15;
        }
        self->_bodyHints.__end_ = v19;
        v8 = v8 + 750.0;
        v6 += v11;
      }
      while (v6 < (unint64_t)v5);
    }
    self->_isLoaded = 1;
  }
}

- (void)p_withPageLayoutPerformBlock:(id)a3
{
  THFlowPageLayout *cachedPageLayout;
  id v6;

  -[THFlowPageController p_ensureLoaded](self, "p_ensureLoaded");
  cachedPageLayout = self->_cachedPageLayout;
  if (cachedPageLayout)
  {
    if (!-[THFlowPageController cachedPageLayoutValidated](self, "cachedPageLayoutValidated"))
    {
      if ((objc_opt_respondsToSelector(self->_layoutObserver, "flowPageController:isEdgeObscured:") & 1) != 0)
        v6 = -[THFlowLayoutObserver flowPageController:isEdgeObscured:](self->_layoutObserver, "flowPageController:isEdgeObscured:", self, 2);
      else
        v6 = 0;
      -[THFlowPageLayout setMaxXEdgeObscured:](cachedPageLayout, "setMaxXEdgeObscured:", v6);
      objc_msgSend(-[THFlowPageLayout layoutController](cachedPageLayout, "layoutController"), "validateOrderedLayouts:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", cachedPageLayout));
      -[THFlowPageController setCachedPageLayoutValidated:](self, "setCachedPageLayoutValidated:", 1);
    }
  }
  else
  {
    -[THSectionInfo setPages:](self->_offscreenSectionInfo, "setPages:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", -[THFlowPageController pageInfo](self, "pageInfo")));
    -[THOffscreenLayoutController setInfos:](self->_drawablesLayoutController, "setInfos:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self->_offscreenSectionInfo));
    -[THOffscreenLayoutController validateLayouts](self->_drawablesLayoutController, "validateLayouts");
    cachedPageLayout = self->_cachedPageLayout;
    -[THFlowPageController setCachedPageLayoutValidated:](self, "setCachedPageLayoutValidated:", 0);
    if (!cachedPageLayout)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THFlowPageController p_withPageLayoutPerformBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THFlowPageController.mm"), 849, CFSTR("should have found or created a page layout"));
      cachedPageLayout = 0;
    }
  }
  (*((void (**)(id, THFlowPageLayout *))a3 + 2))(a3, cachedPageLayout);
}

- (THPageControllerDelegate)delegate
{
  return self->_delegate;
}

- (THModelContentNode)contentNode
{
  return self->_contentNode;
}

- (void)setContentNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (THPresentationType)presentationType
{
  return self->_presentationType;
}

- (void)setPresentationType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (THModelStorageAnchor)cachedAnchorForRect
{
  return self->_cachedAnchorForRect;
}

- (void)setCachedAnchorForRect:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

- (CGRect)rectForAnchor
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rectForAnchor.origin.x;
  y = self->_rectForAnchor.origin.y;
  width = self->_rectForAnchor.size.width;
  height = self->_rectForAnchor.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRectForAnchor:(CGRect)a3
{
  self->_rectForAnchor = a3;
}

- (BOOL)cachedPageLayoutValidated
{
  return self->_cachedPageLayoutValidated;
}

- (void)setCachedPageLayoutValidated:(BOOL)a3
{
  self->_cachedPageLayoutValidated = a3;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  begin = self->_bodyHints.__begin_;
  if (begin)
  {
    self->_bodyHints.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

@end
