@implementation _UITargetedProxy

+ (id)proxyWithTarget:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("target must not be nil"));
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v5, "_setTarget:", v4);

  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  objc_class *Superclass;
  objc_method *InstanceMethod;
  void *v7;

  Superclass = (objc_class *)objc_opt_class();
  do
  {
    InstanceMethod = class_getInstanceMethod(Superclass, a3);
    if (InstanceMethod)
    {
      objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", method_getTypeEncoding(InstanceMethod));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      return v7;
    }
    Superclass = class_getSuperclass(Superclass);
  }
  while (Superclass);
  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(self->__target, "methodSignatureForSelector:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "invokeWithTarget:", self->__target);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; target: %@>"), v5, self, self->__target);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_target
{
  return self->__target;
}

- (void)_setTarget:(id)a3
{
  objc_storeStrong(&self->__target, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__target, 0);
}

@end
