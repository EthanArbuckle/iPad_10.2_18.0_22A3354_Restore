@implementation SUResponderChainInvocationRecorder

- (SUResponderChainInvocationRecorder)initWithTarget:(id)a3 protocol:(id)a4
{
  SUResponderChainInvocationRecorder *result;

  result = -[ISInvocationRecorder initWithTarget:](self, "initWithTarget:", a3);
  if (result)
    result->_protocol = (Protocol *)a4;
  return result;
}

- (id)_targetForSelector:(SEL)a3 sender:(id)a4
{
  void *i;

  for (i = *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BEC8C78]);
        i;
        i = (void *)objc_msgSend(i, "nextResponder"))
  {
    if ((objc_msgSend(i, "canPerformAction:withSender:", a3, a4) & 1) != 0)
      break;
  }
  return i;
}

- (id)adjustedTargetForSelector:(SEL)a3
{
  return -[SUResponderChainInvocationRecorder _targetForSelector:sender:](self, "_targetForSelector:sender:", a3, 0);
}

- (void)invokeInvocation:(id)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v8 = 0;
  v5 = (void *)objc_msgSend(a3, "methodSignature");
  if ((unint64_t)objc_msgSend(v5, "numberOfArguments") >= 3)
  {
    v6 = (const char *)objc_msgSend(v5, "getArgumentTypeAtIndex:", 2);
    if (v6)
    {
      if (!strcmp(v6, "@"))
        objc_msgSend(a3, "getArgument:atIndex:", &v8, 2);
    }
  }
  v7 = objc_msgSend(a3, "selector");
  objc_msgSend(a3, "invokeWithTarget:", -[SUResponderChainInvocationRecorder _targetForSelector:sender:](self, "_targetForSelector:sender:", v7, v8));
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;
  objc_method_description MethodDescription;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUResponderChainInvocationRecorder;
  result = -[ISInvocationRecorder methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!result)
  {
    result = self->_protocol;
    if (result)
    {
      MethodDescription = protocol_getMethodDescription((Protocol *)result, a3, 1, 1);
      result = (id)MethodDescription.name;
      if (MethodDescription.name)
        return (id)objc_msgSend(MEMORY[0x24BDBCEB0], "signatureWithObjCTypes:", MethodDescription.types);
    }
  }
  return result;
}

@end
