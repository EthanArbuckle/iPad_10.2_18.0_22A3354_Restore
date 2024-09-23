@implementation SUScrollViewScroller

- (void)dealloc
{
  objc_super v3;

  if (-[UIScrollView delegate](self->_scrollView, "delegate") == self)
    -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)SUScrollViewScroller;
  -[SUScrollViewScroller dealloc](&v3, sel_dealloc);
}

- (void)attachToScrollView:(id)a3
{
  UIScrollView *v5;

  self->_originalDelegate = 0;
  if ((SUScrollViewScroller *)objc_msgSend(a3, "delegate") != self)
    self->_originalDelegate = (UIScrollViewDelegate *)(id)objc_msgSend(a3, "delegate");

  v5 = (UIScrollView *)a3;
  self->_scrollView = v5;
  -[UIScrollView setDelegate:](v5, "setDelegate:", self);
}

- (void)detachFromScrollView
{
  if (-[UIScrollView delegate](self->_scrollView, "delegate") == self)
    -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self->_originalDelegate);

  self->_originalDelegate = 0;
  self->_scrollView = 0;
}

- (void)scrollFrameToVisible:(CGRect)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  SUScrollRequest *v12;

  v6 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = objc_alloc_init(SUScrollRequest);
  -[SUScrollRequest setAnimated:](v12, "setAnimated:", v6);
  -[SUScrollRequest setCompletionHandler:](v12, "setCompletionHandler:", a5);
  -[SUScrollRequest setFrameValue:](v12, "setFrameValue:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", x, y, width, height));
  -[SUScrollViewScroller _addScrollRequest:](self, "_addScrollRequest:", v12);

}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  _BOOL8 v6;
  double y;
  double x;
  SUScrollRequest *v10;

  v6 = a4;
  y = a3.y;
  x = a3.x;
  v10 = objc_alloc_init(SUScrollRequest);
  -[SUScrollRequest setAnimated:](v10, "setAnimated:", v6);
  -[SUScrollRequest setCompletionHandler:](v10, "setCompletionHandler:", a5);
  -[SUScrollRequest setContentOffsetValue:](v10, "setContentOffsetValue:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", x, y));
  -[SUScrollViewScroller _addScrollRequest:](self, "_addScrollRequest:", v10);

}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a3, "invokeWithTarget:", self->_originalDelegate);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUScrollViewScroller;
  result = -[SUScrollViewScroller methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  if (!result)
  {
    result = (id)protocol_getMethodDescription((Protocol *)&unk_2551A0F58, a3, 0, 1).name;
    if (result)
      return (id)-[UIScrollViewDelegate methodSignatureForSelector:](self->_originalDelegate, "methodSignatureForSelector:", a3);
  }
  return result;
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  -[SUScrollViewScroller _finishActiveScrollRequest](self, "_finishActiveScrollRequest");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIScrollViewDelegate scrollViewDidEndScrollingAnimation:](self->_originalDelegate, "scrollViewDidEndScrollingAnimation:", a3);
}

- (void)_addScrollRequest:(id)a3
{
  NSMutableArray *scrollRequests;

  scrollRequests = self->_scrollRequests;
  if (!scrollRequests)
  {
    scrollRequests = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_scrollRequests = scrollRequests;
  }
  -[NSMutableArray addObject:](scrollRequests, "addObject:", a3);
  if (-[NSMutableArray count](self->_scrollRequests, "count") == 1)
    -[SUScrollViewScroller _performNextScrollRequest](self, "_performNextScrollRequest");
}

- (void)_finishActiveScrollRequest
{
  uint64_t v3;
  uint64_t v4;
  SUScrollViewScroller *v5;

  if (-[NSMutableArray count](self->_scrollRequests, "count"))
  {
    v3 = objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_scrollRequests, "objectAtIndex:", 0), "completionHandler");
    if (v3)
    {
      v4 = v3;
      v5 = self;
      (*(void (**)(uint64_t))(v4 + 16))(v4);
    }
    -[NSMutableArray removeObjectAtIndex:](self->_scrollRequests, "removeObjectAtIndex:", 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endIgnoringInteractionEvents");
    -[SUScrollViewScroller _performNextScrollRequest](self, "_performNextScrollRequest");
  }
}

- (void)_performContentOffsetRequest:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  uint64_t v12;

  objc_msgSend((id)objc_msgSend(a3, "contentOffsetValue"), "CGPointValue");
  v6 = v5;
  v8 = v7;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v11 = v6 == v10 && v8 == v9;
  if (v11
    || (v12 = objc_msgSend(a3, "isAnimated"),
        -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", v12, v6, v8),
        (v12 & 1) == 0))
  {
    -[SUScrollViewScroller _finishActiveScrollRequest](self, "_finishActiveScrollRequest");
  }
}

- (void)_performNextScrollRequest
{
  void *v3;
  uint64_t v4;
  uint64_t v5;

  if (-[NSMutableArray count](self->_scrollRequests, "count"))
  {
    v3 = (void *)-[NSMutableArray objectAtIndex:](self->_scrollRequests, "objectAtIndex:", 0);
    v4 = objc_msgSend(v3, "contentOffsetValue");
    v5 = objc_msgSend(v3, "frameValue");
    if (v4)
    {
      -[SUScrollViewScroller _performContentOffsetRequest:](self, "_performContentOffsetRequest:", v3);
    }
    else if (v5)
    {
      -[SUScrollViewScroller _performScrollRectRequest:](self, "_performScrollRectRequest:", v3);
    }
    else
    {
      -[SUScrollViewScroller _finishActiveScrollRequest](self, "_finishActiveScrollRequest");
    }
  }
}

- (void)_performScrollRectRequest:(id)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  CGRect v22;
  CGRect v23;

  -[UIScrollView bounds](self->_scrollView, "bounds");
  v6 = v5;
  v8 = v7;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v10 = v9;
  v12 = v11;
  objc_msgSend((id)objc_msgSend(a3, "frameValue"), "CGRectValue");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
  v22.origin.x = v10;
  v22.origin.y = v12;
  v22.size.width = v6;
  v22.size.height = v8;
  v23.origin.x = v14;
  v23.origin.y = v16;
  v23.size.width = v18;
  v23.size.height = v20;
  if (CGRectContainsRect(v22, v23)
    || (v21 = objc_msgSend(a3, "isAnimated"),
        -[UIScrollView scrollRectToVisible:animated:](self->_scrollView, "scrollRectToVisible:animated:", v21, v14, v16, v18, v20), (v21 & 1) == 0))
  {
    -[SUScrollViewScroller _finishActiveScrollRequest](self, "_finishActiveScrollRequest");
  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

@end
