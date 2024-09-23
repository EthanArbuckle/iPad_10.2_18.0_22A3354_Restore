@implementation _UIWebViewScrollView

- (_UIWebViewScrollView)initWithFrame:(CGRect)a3
{
  _UIWebViewScrollView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIWebViewScrollView;
  v3 = -[UIWebScrollView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_forwarder = objc_alloc_init(_UIWebViewScrollViewDelegateForwarder);
    v3->_contentInsetAdjustmentBehaviorWasExternallyOverridden = -[UIScrollView contentInsetAdjustmentBehavior](v3, "contentInsetAdjustmentBehavior") != UIScrollViewContentInsetAdjustmentAutomatic;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  self->_forwarder = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIWebViewScrollView;
  -[UIScrollView dealloc](&v3, sel_dealloc);
}

- (void)_weaklySetBouncesHorizontally:(BOOL)a3
{
  objc_super v3;

  if (!self->_bouncesSetExplicitly)
  {
    v3.receiver = self;
    v3.super_class = (Class)_UIWebViewScrollView;
    -[UIScrollView setBouncesHorizontally:](&v3, sel_setBouncesHorizontally_, a3);
  }
}

- (void)setBounces:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIWebViewScrollView;
  -[UIScrollView setBounces:](&v4, sel_setBounces_, a3);
  self->_bouncesSetExplicitly = 1;
}

- (void)setBouncesVertically:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIWebViewScrollView;
  -[UIScrollView setBouncesVertically:](&v4, sel_setBouncesVertically_, a3);
  self->_bouncesSetExplicitly = 1;
}

- (void)setBouncesHorizontally:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIWebViewScrollView;
  -[UIScrollView setBouncesHorizontally:](&v4, sel_setBouncesHorizontally_, a3);
  self->_bouncesSetExplicitly = 1;
}

- (void)setDelegate:(id)a3
{
  _UIWebViewScrollViewDelegateForwarder *forwarder;
  objc_super v5;
  objc_super v6;

  -[_UIWebViewScrollViewDelegateForwarder setDelegate:](self->_forwarder, "setDelegate:", a3);
  v6.receiver = self;
  v6.super_class = (Class)_UIWebViewScrollView;
  -[UIScrollView setDelegate:](&v6, sel_setDelegate_, 0);
  forwarder = self->_forwarder;
  v5.receiver = self;
  v5.super_class = (Class)_UIWebViewScrollView;
  -[UIScrollView setDelegate:](&v5, sel_setDelegate_, forwarder);
}

- (id)delegate
{
  return -[_UIWebViewScrollViewDelegateForwarder delegate](self->_forwarder, "delegate");
}

- (void)_setWebView:(id)a3
{
  _UIWebViewScrollViewDelegateForwarder *forwarder;
  objc_super v5;
  objc_super v6;

  -[_UIWebViewScrollViewDelegateForwarder setWebView:](self->_forwarder, "setWebView:", a3);
  v6.receiver = self;
  v6.super_class = (Class)_UIWebViewScrollView;
  -[UIScrollView setDelegate:](&v6, sel_setDelegate_, 0);
  forwarder = self->_forwarder;
  v5.receiver = self;
  v5.super_class = (Class)_UIWebViewScrollView;
  -[UIScrollView setDelegate:](&v5, sel_setDelegate_, forwarder);
}

- (BOOL)_contentInsetAdjustmentBehaviorWasExternallyOverridden
{
  return self->_contentInsetAdjustmentBehaviorWasExternallyOverridden;
}

- (void)setContentInsetAdjustmentBehavior:(int64_t)a3
{
  objc_super v3;

  self->_contentInsetAdjustmentBehaviorWasExternallyOverridden = 1;
  v3.receiver = self;
  v3.super_class = (Class)_UIWebViewScrollView;
  -[UIScrollView setContentInsetAdjustmentBehavior:](&v3, sel_setContentInsetAdjustmentBehavior_, a3);
}

- (void)_setContentInsetAdjustmentBehaviorInternal:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIWebViewScrollView;
  -[UIScrollView setContentInsetAdjustmentBehavior:](&v3, sel_setContentInsetAdjustmentBehavior_, a3);
}

@end
