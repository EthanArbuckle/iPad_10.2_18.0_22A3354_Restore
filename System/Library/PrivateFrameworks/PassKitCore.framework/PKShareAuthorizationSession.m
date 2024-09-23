@implementation PKShareAuthorizationSession

- (PKShareAuthorizationSession)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKShareAuthorizationSession;
  return -[PKShareAuthorizationSession init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  -[PKShareAuthorizationSession invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)PKShareAuthorizationSession;
  -[PKShareAuthorizationSession dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  LAContext *context;

  -[LAContext invalidate](self->_context, "invalidate");
  context = self->_context;
  self->_context = 0;

}

- (void)authorizeDeviceOwnerWithAuthHandler:(id)a3 completion:(id)a4
{
  id v6;
  LAContext *context;
  LAContext *v8;
  LAContext *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  context = self->_context;
  if (!context)
  {
    v8 = (LAContext *)objc_alloc_init(MEMORY[0x1E0CC12A0]);
    v9 = self->_context;
    self->_context = v8;

    context = self->_context;
  }
  +[PKShareAuthorizer _authorizeDeviceOwnerWithAuthHandler:completion:context:invalidateContext:](PKShareAuthorizer, "_authorizeDeviceOwnerWithAuthHandler:completion:context:invalidateContext:", v10, v6, context, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
