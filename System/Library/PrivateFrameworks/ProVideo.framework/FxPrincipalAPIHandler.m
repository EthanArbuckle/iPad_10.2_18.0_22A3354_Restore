@implementation FxPrincipalAPIHandler

- (FxPrincipalAPIHandler)initWithDelegate:(id)a3
{
  FxPrincipalAPIHandler *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FxPrincipalAPIHandler;
  v4 = -[FxPrincipalAPIHandler init](&v6, sel_init);
  if (v4)
    v4->_delegate = (FxPlugPrincipalDelegate *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FxPrincipalAPIHandler;
  -[FxPrincipalAPIHandler dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  FxPlugPrincipalDelegate *delegate;

  delegate = self->_delegate;
  self->_delegate = (FxPlugPrincipalDelegate *)a3;

}

- (id)delegate
{
  return self->_delegate;
}

- (id)servicePrincipal
{
  return (id)-[FxPlugPrincipalDelegate fxServiceProxy](self->_delegate, "fxServiceProxy");
}

- (BOOL)conformsToProtocol:(id)a3 version:(unsigned int)a4
{
  return 0;
}

@end
