@implementation RBTimeProviderEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
}

+ (id)eventWithSource:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[RBTimeProviderEvent _initWithSource:]([RBTimeProviderEvent alloc], "_initWithSource:", v3);

  return v4;
}

- (id)_initWithSource:(id)a3
{
  id v5;
  RBTimeProviderEvent *v6;
  RBTimeProviderEvent *v7;
  RBTimeProviderEvent *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RBTimeProviderEvent;
  v6 = -[RBTimeProviderEvent init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_source, a3);
    v8 = v7;
  }

  return v7;
}

- (void)cancel
{
  dispatch_source_cancel((dispatch_source_t)self->_source);
}

@end
