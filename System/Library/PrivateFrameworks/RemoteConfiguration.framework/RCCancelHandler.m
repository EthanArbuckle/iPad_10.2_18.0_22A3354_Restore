@implementation RCCancelHandler

+ (id)cancelHandlerWithBlock:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBlock:", v4);

  return v5;
}

+ (id)cancelHandlerWithWeakTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithWeakTarget:selector:", v6, a4);

  return v7;
}

+ (id)cancelHandlerWithStrongTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStrongTarget:selector:", v6, a4);

  return v7;
}

- (RCCancelHandler)initWithBlock:(id)a3
{
  id v4;
  RCCancelHandler *v5;
  uint64_t v6;
  id cancelBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RCCancelHandler;
  v5 = -[RCCancelHandler init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cancelBlock = v5->_cancelBlock;
    v5->_cancelBlock = (id)v6;

  }
  return v5;
}

- (RCCancelHandler)initWithWeakTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  RCCancelHandler *v7;
  RCCancelHandler *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RCCancelHandler;
  v7 = -[RCCancelHandler init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_weakTarget, v6);
    v8->_selector = a4;
  }

  return v8;
}

- (RCCancelHandler)initWithStrongTarget:(id)a3 selector:(SEL)a4
{
  id v7;
  RCCancelHandler *v8;
  RCCancelHandler *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RCCancelHandler;
  v8 = -[RCCancelHandler init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_strongTarget, a3);
    v9->_selector = a4;
  }

  return v9;
}

- (void)cancel
{
  void *v3;
  void *v4;
  void (**v5)(void);
  void *v6;

  -[RCCancelHandler cancelBlock](self, "cancelBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RCCancelHandler cancelBlock](self, "cancelBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[RCCancelHandler cancelBlock](self, "cancelBlock");
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v5[2]();
LABEL_10:

    }
  }
  else if (-[RCCancelHandler selector](self, "selector"))
  {
    -[RCCancelHandler strongTarget](self, "strongTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[RCCancelHandler strongTarget](self, "strongTarget");
    else
      -[RCCancelHandler weakTarget](self, "weakTarget");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();

    if (v5)
      ((void (*)(void (**)(void), SEL))objc_msgSend(v5, "methodForSelector:", -[RCCancelHandler selector](self, "selector")))(v5, -[RCCancelHandler selector](self, "selector"));
    goto LABEL_10;
  }
  -[RCCancelHandler setCancelBlock:](self, "setCancelBlock:", 0);
  -[RCCancelHandler setWeakTarget:](self, "setWeakTarget:", 0);
  -[RCCancelHandler setStrongTarget:](self, "setStrongTarget:", 0);
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)weakTarget
{
  return objc_loadWeakRetained(&self->_weakTarget);
}

- (void)setWeakTarget:(id)a3
{
  objc_storeWeak(&self->_weakTarget, a3);
}

- (id)strongTarget
{
  return self->_strongTarget;
}

- (void)setStrongTarget:(id)a3
{
  objc_storeStrong(&self->_strongTarget, a3);
}

- (SEL)selector
{
  return self->_selector;
}

- (void)setSelector:(SEL)a3
{
  self->_selector = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_strongTarget, 0);
  objc_destroyWeak(&self->_weakTarget);
  objc_storeStrong(&self->_cancelBlock, 0);
}

@end
