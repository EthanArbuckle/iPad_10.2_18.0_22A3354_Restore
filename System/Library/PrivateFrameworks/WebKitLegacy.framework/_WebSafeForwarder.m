@implementation _WebSafeForwarder

- (_WebSafeForwarder)initWithTarget:(id)a3 defaultTarget:(id)a4
{
  _WebSafeForwarder *v6;
  _WebSafeForwarder *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_WebSafeForwarder;
  v6 = -[_WebSafeForwarder init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_target = a3;
    v6->_defaultTarget = a4;
    v6->_asyncForwarder = -[_WebSafeAsyncForwarder initWithForwarder:]([_WebSafeAsyncForwarder alloc], "initWithForwarder:", v6);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  self->_target = 0;
  self->_defaultTarget = 0;

  self->_asyncForwarder = 0;
  v3.receiver = self;
  v3.super_class = (Class)_WebSafeForwarder;
  -[_WebSafeForwarder dealloc](&v3, sel_dealloc);
}

- (void)clearTarget
{
  self->_target = 0;
}

- (void)forwardInvocation:(id)a3
{
  if (WebThreadIsCurrent())
  {
    objc_msgSend(a3, "retainArguments");
    WebThreadCallDelegate();
  }
  else
  {
    objc_msgSend(a3, "selector");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a3, "invokeWithTarget:", self->_target);
    }
    else
    {
      objc_msgSend(a3, "selector");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(a3, "invokeWithTarget:", self->_defaultTarget);
    }
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend(self->_defaultTarget, "methodSignatureForSelector:", a3);
}

- (id)asyncForwarder
{
  return self->_asyncForwarder;
}

@end
