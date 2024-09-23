@implementation UISimpleInteractionProgress

- (void)endInteraction:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UISimpleInteractionProgress;
  -[UIInteractionProgress endInteraction:](&v3, sel_endInteraction_, a3);
}

@end
