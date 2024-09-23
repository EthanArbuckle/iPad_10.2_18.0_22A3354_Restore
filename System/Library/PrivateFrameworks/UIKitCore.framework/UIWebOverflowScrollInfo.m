@implementation UIWebOverflowScrollInfo

- (UIWebOverflowScrollInfo)initWithNode:(id)a3 offset:(CGPoint)a4 isUserScroll:(BOOL)a5
{
  CGFloat y;
  CGFloat x;
  UIWebOverflowScrollInfo *v9;
  objc_super v11;

  y = a4.y;
  x = a4.x;
  v11.receiver = self;
  v11.super_class = (Class)UIWebOverflowScrollInfo;
  v9 = -[UIWebOverflowScrollInfo init](&v11, sel_init);
  if (v9)
  {
    v9->_node = (DOMNode *)a3;
    v9->_offset.x = x;
    v9->_offset.y = y;
    v9->_isUserScroll = a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIWebOverflowScrollInfo;
  -[UIWebOverflowScrollInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)coalesceScrollForNode:(id)a3 offset:(CGPoint)a4 isUserScroll:(BOOL)a5
{
  if (self->_node != a3 || self->_isUserScroll != a5)
    return 0;
  self->_offset = a4;
  return 1;
}

- (DOMNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (BOOL)isUserScroll
{
  return self->_isUserScroll;
}

- (void)setIsUserScroll:(BOOL)a3
{
  self->_isUserScroll = a3;
}

@end
