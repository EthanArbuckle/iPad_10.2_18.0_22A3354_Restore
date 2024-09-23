@implementation UIThreadSafeNode

+ (id)threadSafeNodeWithNode:(id)a3
{
  id v3;
  UIThreadSafeNode *v4;
  UIThreadSafeNode *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = (UIThreadSafeNode *)v3;
  else
    v4 = -[UIThreadSafeNode initWithNode:]([UIThreadSafeNode alloc], "initWithNode:", v3);
  v5 = v4;

  return v5;
}

- (UIThreadSafeNode)initWithNode:(id)a3
{
  id v5;
  UIThreadSafeNode *v6;
  UIThreadSafeNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIThreadSafeNode;
  v6 = -[UIThreadSafeNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_node, a3);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (WebThreadNotCurrent())
    WebThreadLock();
  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)UIThreadSafeNode;
  -[UIThreadSafeNode description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOMNode description](self->_node, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ representing: %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isKindOfClass:(Class)a3
{
  char isKindOfClass;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIThreadSafeNode;
  if (-[UIThreadSafeNode isKindOfClass:](&v5, sel_isKindOfClass_))
  {
    isKindOfClass = 1;
  }
  else
  {
    WebThreadLock();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)isEqual:(id)a3
{
  return self == a3 || self->_node == a3;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)UIThreadSafeNode;
  if (-[UIThreadSafeNode conformsToProtocol:](&v7, sel_conformsToProtocol_, v4))
    v5 = 1;
  else
    v5 = -[DOMNode conformsToProtocol:](self->_node, "conformsToProtocol:", v4);

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v6;

  if (WebThreadNotCurrent())
    WebThreadLock();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)UIThreadSafeNode;
  return -[UIThreadSafeNode respondsToSelector:](&v6, sel_respondsToSelector_, a3);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "selector");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (WebThreadNotCurrent())
      WebThreadLock();
    objc_msgSend(v4, "invokeWithTarget:", self->_node);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)UIThreadSafeNode;
    -[UIThreadSafeNode forwardInvocation:](&v5, sel_forwardInvocation_, v4);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
}

- (id)_realNode
{
  return self->_node;
}

@end
