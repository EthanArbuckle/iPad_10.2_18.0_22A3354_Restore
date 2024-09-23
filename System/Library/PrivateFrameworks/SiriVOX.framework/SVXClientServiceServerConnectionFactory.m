@implementation SVXClientServiceServerConnectionFactory

- (id)createWithXPCConnection:(id)a3 performer:(id)a4 delegate:(id)a5
{
  id v7;
  id v8;
  id v9;
  SVXClientServiceServerConnection *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[SVXClientServiceServerConnection initWithXPCConnection:performer:delegate:]([SVXClientServiceServerConnection alloc], "initWithXPCConnection:performer:delegate:", v9, v8, v7);

  return v10;
}

@end
