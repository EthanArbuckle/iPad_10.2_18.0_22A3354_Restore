@implementation RPClientProxyFactory

+ (id)clientProxyWithNewConnection:(id)a3 currentState:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned __int8 v8;
  RPClientProxy *v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForEntitlement:", CFSTR("com.apple.private.replay-kit")));
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) != 0)
  {
    v9 = (RPClientProxy *)objc_claimAutoreleasedReturnValue(+[RPMultipleClientProxy clientProxy](RPMultipleClientProxy, "clientProxy"));
    -[RPClientProxy handleNewConnection:currentState:](v9, "handleNewConnection:currentState:", v6, v5);
  }
  else
  {
    v9 = -[RPClientProxy initWithConnection:]([RPClientProxy alloc], "initWithConnection:", v6);
  }

  return v9;
}

@end
