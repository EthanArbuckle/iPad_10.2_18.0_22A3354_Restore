@implementation KPFEventAnimationDelegate

- (KPFEventAnimationDelegate)initWithEvent:(id)a3
{
  KPFEventAnimationDelegate *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)KPFEventAnimationDelegate;
  result = -[KPFEventAnimationDelegate init](&v5, "init");
  if (result)
    result->_weakEvent = (KPFEvent *)a3;
  return result;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  -[KPFEvent animationDidStop:finished:](-[KPFEventAnimationDelegate weakEvent](self, "weakEvent"), "animationDidStop:finished:", a3, a4);
}

- (KPFEvent)weakEvent
{
  return self->_weakEvent;
}

- (void)setWeakEvent:(id)a3
{
  self->_weakEvent = (KPFEvent *)a3;
}

@end
