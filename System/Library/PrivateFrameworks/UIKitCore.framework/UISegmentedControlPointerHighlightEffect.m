@implementation UISegmentedControlPointerHighlightEffect

- (unint64_t)options
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISegmentedControlPointerHighlightEffect;
  return -[UIPointerHighlightEffect options](&v3, sel_options) & 0xFFFFFFFFFFFFFEFFLL;
}

@end
