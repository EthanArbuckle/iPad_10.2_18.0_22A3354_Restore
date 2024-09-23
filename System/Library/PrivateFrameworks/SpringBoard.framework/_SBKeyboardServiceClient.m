@implementation _SBKeyboardServiceClient

- (_SBKeyboardServiceClient)initWithConnectionContext:(id)a3
{
  id v5;
  _SBKeyboardServiceClient *v6;
  _SBKeyboardServiceClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SBKeyboardServiceClient;
  v6 = -[_SBKeyboardServiceClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connectionContext, a3);

  return v7;
}

- (int)pid
{
  void *v2;
  int v3;

  -[_SBKeyboardServiceClient auditToken](self, "auditToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pid");

  return v3;
}

- (BSAuditToken)auditToken
{
  void *v2;
  void *v3;

  -[BSServiceConnectionContext remoteProcess](self->_connectionContext, "remoteProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "auditToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSAuditToken *)v3;
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; connection: <%p> pid:%i>"),
    v5,
    self,
    self->_connectionContext,
    -[_SBKeyboardServiceClient pid](self, "pid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BSServiceConnectionContext)connectionContext
{
  return self->_connectionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionContext, 0);
}

@end
