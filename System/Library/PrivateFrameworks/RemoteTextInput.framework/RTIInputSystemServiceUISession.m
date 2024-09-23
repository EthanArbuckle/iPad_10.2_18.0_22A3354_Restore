@implementation RTIInputSystemServiceUISession

- (id)valueForEntitlement:(id)a3
{
  return (id)-[BSProcessHandle valueForEntitlement:](self->_remoteProcess, "valueForEntitlement:", a3);
}

- (int)pid
{
  return -[BSProcessHandle pid](self->_remoteProcess, "pid");
}

- (id)bundleIdentifier
{
  return (id)-[BSProcessHandle bundleIdentifier](self->_remoteProcess, "bundleIdentifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteProcess, 0);
}

+ (id)sessionWithConnection:(id)a3 remoteProcess:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConnection:remoteProcess:", v7, v6);

  return v8;
}

- (RTIInputSystemServiceUISession)initWithConnection:(id)a3 remoteProcess:(id)a4
{
  id v7;
  RTIInputSystemServiceUISession *v8;
  RTIInputSystemServiceUISession *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RTIInputSystemServiceUISession;
  v8 = -[RTIInputSystemServiceSession initWithConnection:](&v11, sel_initWithConnection_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_remoteProcess, a4);

  return v9;
}

@end
