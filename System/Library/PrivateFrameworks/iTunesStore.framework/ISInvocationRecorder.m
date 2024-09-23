@implementation ISInvocationRecorder

- (ISInvocationRecorder)init
{
  objc_super v4;

  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISInvocationRecorder;
  return -[ISInvocationRecorder init](&v4, sel_init);
}

- (ISInvocationRecorder)initWithTarget:(id)a3
{
  ISInvocationRecorder *v4;

  v4 = -[ISInvocationRecorder init](self, "init");
  if (v4)
    v4->_target = a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_target = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISInvocationRecorder;
  -[ISInvocationRecorder dealloc](&v3, sel_dealloc);
}

- (id)adjustedTargetForSelector:(SEL)a3
{
  return self->_target;
}

- (void)invokeInvocation:(id)a3
{
  objc_msgSend(a3, "invoke");
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "setTarget:", -[ISInvocationRecorder adjustedTargetForSelector:](self, "adjustedTargetForSelector:", objc_msgSend(a3, "selector")));
  -[ISInvocationRecorder invokeInvocation:](self, "invokeInvocation:", a3);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISInvocationRecorder;
  result = -[ISInvocationRecorder methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_);
  if (!result)
    return (id)objc_msgSend(-[ISInvocationRecorder adjustedTargetForSelector:](self, "adjustedTargetForSelector:", a3), "methodSignatureForSelector:", a3);
  return result;
}

@end
