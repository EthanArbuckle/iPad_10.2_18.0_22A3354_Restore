@implementation RBProcessMonitorObserverConnection

- (void)sendMessage:(id)a3 replyQueue:(id)a4 completion:(id)a5
{
  objc_msgSend(a3, "sendToConnection:replyQueue:completion:", self->_connection, a4, a5);
}

- (RBProcessMonitorObserverConnection)initWithConnection:(id)a3
{
  id v5;
  RBProcessMonitorObserverConnection *v6;
  RBProcessMonitorObserverConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBProcessMonitorObserverConnection;
  v6 = -[RBProcessMonitorObserverConnection init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_connection, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| pid:%d>"), v4, xpc_connection_get_pid(self->_connection));

  return (NSString *)v5;
}

@end
