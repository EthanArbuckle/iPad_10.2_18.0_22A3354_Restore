@implementation UIWebOverflowScrollViewInfo

- (UIWebOverflowScrollViewInfo)initWithScrollView:(id)a3
{
  UIWebOverflowScrollViewInfo *v4;
  UIWebOverflowScrollView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UIWebOverflowScrollViewInfo;
  v4 = -[UIWebOverflowScrollViewInfo init](&v7, sel_init);
  if (v4)
  {
    v5 = (UIWebOverflowScrollView *)a3;
    v4->_scrollView = v5;
    v4->_scrollViewLayer = -[UIView layer](v5, "layer");
    v4->_oldSuperview = (UIView *)(id)objc_msgSend(a3, "superview");
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWebOverflowScrollViewInfo;
  -[UIWebOverflowScrollViewInfo dealloc](&v3, sel_dealloc);
}

- (UIWebOverflowScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (UIView)oldSuperview
{
  return self->_oldSuperview;
}

- (void)setOldSuperview:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
