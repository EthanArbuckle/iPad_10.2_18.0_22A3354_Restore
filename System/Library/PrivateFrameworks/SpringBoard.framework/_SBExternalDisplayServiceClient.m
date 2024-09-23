@implementation _SBExternalDisplayServiceClient

- (_SBExternalDisplayServiceClient)initWithConnection:(id)a3 remoteProcess:(id)a4
{
  id v8;
  id v9;
  void *v10;
  _SBExternalDisplayServiceClient *v11;
  _SBExternalDisplayServiceClient *v12;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBExternalDisplayServiceConnectionListener.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("remoteProcess"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)_SBExternalDisplayServiceClient;
  v11 = -[_SBExternalDisplayServiceClient init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connection, a3);
    objc_storeStrong((id *)&v12->_remoteProcess, a4);
  }

  return v12;
}

- (int)pid
{
  void *v2;
  int v3;

  -[_SBExternalDisplayServiceClient auditToken](self, "auditToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pid");

  return v3;
}

- (BSAuditToken)auditToken
{
  return (BSAuditToken *)-[BSProcessHandle auditToken](self->_remoteProcess, "auditToken");
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
    self->_connection,
    -[_SBExternalDisplayServiceClient pid](self, "pid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (BSProcessHandle)remoteProcess
{
  return self->_remoteProcess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteProcess, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
