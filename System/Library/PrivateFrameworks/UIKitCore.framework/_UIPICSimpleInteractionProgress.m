@implementation _UIPICSimpleInteractionProgress

- (void)endInteraction:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIPICSimpleInteractionProgress;
  -[UISimpleInteractionProgress endInteraction:](&v4, sel_endInteraction_, a3);
  -[_UIPICSimpleInteractionProgress setDidEnd:](self, "setDidEnd:", 1);
}

- (BOOL)didEnd
{
  return self->_didEnd;
}

- (void)setDidEnd:(BOOL)a3
{
  self->_didEnd = a3;
}

@end
