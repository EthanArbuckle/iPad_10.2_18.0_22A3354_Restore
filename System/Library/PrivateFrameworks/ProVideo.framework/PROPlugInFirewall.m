@implementation PROPlugInFirewall

- (PROPlugInFirewall)initWithProtectedObject:(id)a3 protocol:(id)a4 secondaryProtocol:(id)a5 errorHandler:(id)a6
{
  PROPlugInFirewall *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PROPlugInFirewall;
  result = -[PROPlugInFirewall init](&v11, sel_init);
  if (result)
  {
    result->errorHandler = (PROPlugInFirewallErrorHandler *)a6;
    result->protectedObject = a3;
    result->protocol = (Protocol *)a4;
    result->secondaryProtocol = (Protocol *)a5;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  self->errorHandler = 0;
  self->protectedObject = 0;
  v2.receiver = self;
  v2.super_class = (Class)PROPlugInFirewall;
  -[PROPlugInFirewall dealloc](&v2, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<[*%@ (%s)*]>"), self->protectedObject, protocol_getName(self->protocol));
}

- (id)protectedObject
{
  return self->protectedObject;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PROPlugInFirewall;
  result = -[PROPlugInFirewall methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (!result
    && (!(unint64_t)protocol_getMethodDescription(self->protocol, a3, 1, 1).name
     && !(unint64_t)protocol_getMethodDescription(self->secondaryProtocol, a3, 1, 1).name
     || (result = (id)objc_msgSend(self->protectedObject, "methodSignatureForSelector:", a3)) == 0))
  {
    v6.receiver = self;
    v6.super_class = (Class)PROPlugInFirewall;
    return -[PROPlugInFirewall methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_, sel_deadMethod);
  }
  return result;
}

- (void)forwardInvocation:(id)a3
{
  const char *v5;

  v5 = (const char *)objc_msgSend(a3, "selector");
  if (((unint64_t)protocol_getMethodDescription(self->protocol, v5, 1, 1).name
     || (unint64_t)protocol_getMethodDescription(self->secondaryProtocol, v5, 1, 1).name)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "invokeWithTarget:", self->protectedObject);
  }
  else
  {
    -[PROPlugInFirewall doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", v5);
  }
}

+ (id)methodSignatureForSelector:(SEL)a3
{
  id result;
  objc_super v6;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___PROPlugInFirewall;
  result = objc_msgSendSuper2(&v7, sel_methodSignatureForSelector_);
  if (!result)
  {
    objc_msgSend(a1, "doesNotRecognizeSelector:", a3);
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___PROPlugInFirewall;
    return objc_msgSendSuper2(&v6, sel_methodSignatureForSelector_, sel_deadMethod);
  }
  return result;
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  -[PROPlugInFirewallErrorHandler plugInFirewall:receivedBadMessage:](self->errorHandler, "plugInFirewall:receivedBadMessage:", self, a3);
}

@end
