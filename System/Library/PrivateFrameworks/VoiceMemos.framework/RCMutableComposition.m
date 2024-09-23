@implementation RCMutableComposition

- (void)recacheComposedDuration
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RCMutableComposition;
  -[RCComposition recacheComposedDuration](&v2, sel_recacheComposedDuration);
}

@end
