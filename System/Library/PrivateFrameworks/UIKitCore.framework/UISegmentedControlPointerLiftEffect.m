@implementation UISegmentedControlPointerLiftEffect

- (unint64_t)options
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISegmentedControlPointerLiftEffect;
  return -[UIPointerLiftEffect options](&v3, sel_options) & 0xFFFFFFFFFFFFFEFFLL;
}

@end
