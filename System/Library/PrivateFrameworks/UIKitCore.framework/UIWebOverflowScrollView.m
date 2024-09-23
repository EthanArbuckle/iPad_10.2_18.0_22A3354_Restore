@implementation UIWebOverflowScrollView

- (UIWebOverflowScrollView)initWithLayer:(id)a3 node:(id)a4 webBrowserView:(id)a5
{
  UIWebOverflowScrollView *v9;
  UIWebOverflowScrollView *v10;
  objc_super v12;

  objc_msgSend(a3, "bounds");
  v12.receiver = self;
  v12.super_class = (Class)UIWebOverflowScrollView;
  v9 = -[UIScrollView initWithFrame:](&v12, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    -[UIWebOverflowScrollView replaceLayer:](v9, "replaceLayer:", a3);
    v10->_webBrowserView = (UIWebBrowserView *)a5;
    v10->_scrollListener = -[UIWebOverflowScrollListener initWithScrollView:]([UIWebOverflowScrollListener alloc], "initWithScrollView:", v10);
    -[UIWebOverflowScrollView setNode:](v10, "setNode:", a4);
    -[UIScrollView setDirectionalLockEnabled:](v10, "setDirectionalLockEnabled:", 1);
    -[UIScrollView setScrollsToTop:](v10, "setScrollsToTop:", 0);
    -[UIScrollView setContentInsetAdjustmentBehavior:](v10, "setContentInsetAdjustmentBehavior:", 2);
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWebOverflowScrollView;
  -[UIScrollView dealloc](&v3, sel_dealloc);
}

- (void)replaceLayer:(id)a3
{
  -[UIView _replaceLayer:](self, "_replaceLayer:");
  -[UIWebOverflowScrollView setWebLayer:](self, "setWebLayer:", a3);
}

- (void)willBeRemoved
{
  -[UIWebOverflowScrollView setWebLayer:](self, "setWebLayer:", 0);
}

- (id)superview
{
  CALayer *v3;
  CALayer *v4;

  v3 = -[CALayer superlayer](-[UIView layer](self, "layer"), "superlayer");
  if (v3)
  {
    v4 = v3;
    while (1)
    {
      if (-[CALayer delegate](v4, "delegate"))
      {
        -[CALayer delegate](v4, "delegate");
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          return -[CALayer delegate](v4, "delegate");
      }
      v4 = -[CALayer superlayer](v4, "superlayer");
      if (!v4)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    if (self->_beingRemoved)
      return self->_webBrowserView;
    else
      return 0;
  }
}

- (BOOL)fixUpViewAfterInsertion
{
  id v3;
  _BOOL8 v4;

  v3 = -[UIWebOverflowScrollView superview](self, "superview");
  if (v3)
  {
    -[UIView _webCustomViewWasAddedAsSubviewOfView:](self, -[UIWebOverflowScrollView superview](self, "superview"));
    v4 = (-[UIDevice userInterfaceIdiom](+[UIDevice currentDevice](UIDevice, "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1&& -[UIWebOverflowScrollView superview](self, "superview") == self->_webBrowserView;
    -[UIScrollView setScrollsToTop:](self, "setScrollsToTop:", v4);
    -[UIView _invalidateSubviewCache](self, "_invalidateSubviewCache");
  }
  return v3 != 0;
}

- (void)setContentOffset:(CGPoint)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIWebOverflowScrollView;
  -[UIScrollView setContentOffset:](&v4, sel_setContentOffset_, a3.x, a3.y);
  -[UIWebBrowserView _overflowScrollView:scrollOffsetChangedForNode:whileScrolling:](self->_webBrowserView, "_overflowScrollView:scrollOffsetChangedForNode:whileScrolling:", self, self->_node, 1);
}

- (UIWebBrowserView)webBrowserView
{
  return self->_webBrowserView;
}

- (void)setWebBrowserView:(id)a3
{
  self->_webBrowserView = (UIWebBrowserView *)a3;
}

- (UIWebOverflowScrollListener)scrollListener
{
  return self->_scrollListener;
}

- (void)setScrollListener:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 2088);
}

- (UIWebOverflowContentView)overflowContentView
{
  return self->_overflowContentView;
}

- (void)setOverflowContentView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 2096);
}

- (DOMNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 2104);
}

- (BOOL)isBeingRemoved
{
  return self->_beingRemoved;
}

- (void)setBeingRemoved:(BOOL)a3
{
  self->_beingRemoved = a3;
}

- (CALayer)webLayer
{
  return self->_webLayer;
}

- (void)setWebLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 2112);
}

@end
