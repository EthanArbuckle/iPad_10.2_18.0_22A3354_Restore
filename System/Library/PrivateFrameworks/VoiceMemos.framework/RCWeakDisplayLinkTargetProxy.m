@implementation RCWeakDisplayLinkTargetProxy

- (RCWeakDisplayLinkTargetProxy)initWithTarget:(id)a3 selector:(SEL)a4
{
  RCWeakDisplayLinkTargetProxy *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RCWeakDisplayLinkTargetProxy;
  v6 = -[RCWeakDisplayLinkTargetProxy init](&v8, sel_init);
  if (v6)
  {
    v6->_weakTarget = +[RCWeakRef weakRefWithObject:](RCWeakRef, "weakRefWithObject:", a3);
    v6->_weakTargetSelector = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_weakTarget = 0;
  v3.receiver = self;
  v3.super_class = (Class)RCWeakDisplayLinkTargetProxy;
  -[RCWeakDisplayLinkTargetProxy dealloc](&v3, sel_dealloc);
}

- (void)displayLinkFired:(id)a3
{
  id v5;

  v5 = -[RCWeakRef object](self->_weakTarget, "object");
  if (v5)
    objc_msgSend(v5, "performSelector:withObject:", self->_weakTargetSelector, a3);
  else
    objc_msgSend(a3, "invalidate");
}

@end
