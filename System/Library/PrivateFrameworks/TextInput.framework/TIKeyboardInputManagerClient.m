@implementation TIKeyboardInputManagerClient

- (void)forwardInvocation:(id)a3
{
  id v4;
  TIKeyboardInputManagerClientRequest *v5;
  objc_super v6;

  v4 = a3;
  if (+[TIKeyboardInputManagerStub instancesRespondToSelector:](TIKeyboardInputManagerStub, "instancesRespondToSelector:", objc_msgSend(v4, "selector")))
  {
    v5 = -[TIKeyboardInputManagerClientRequest initWithInvocation:]([TIKeyboardInputManagerClientRequest alloc], "initWithInvocation:", v4);
    -[TIKeyboardInputManagerClient handleRequest:](self, "handleRequest:", v5);

  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManagerClient;
    -[TIKeyboardInputManagerClient forwardInvocation:](&v6, sel_forwardInvocation_, v4);
  }

}

- (void)handleRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void *v14;
  TIKeyboardInputManagerClient *v15;
  id v16;

  v4 = a3;
  -[TIKeyboardInputManagerClient connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "invocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TIKeyboardInputManagerClient connection](self, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __46__TIKeyboardInputManagerClient_handleRequest___block_invoke;
    v14 = &unk_1E24398F0;
    v15 = self;
    v16 = v4;
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invokeWithTarget:", v8, v11, v12, v13, v14, v15);

  }
  else
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v4, "invocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invokeWithTarget:", v9);

  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerClient;
  if (-[TIKeyboardInputManagerClient isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerClient;
  -[TIKeyboardInputManagerClient methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[TIKeyboardInputManagerStub instanceMethodSignatureForSelector:](TIKeyboardInputManagerStub, "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (TIKeyboardInputManagerClient)initWithImplProxy:(id)a3
{
  id v4;
  TIKeyboardInputManagerClient *v5;
  uint64_t v6;
  NSXPCConnection *connection;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardInputManagerClient;
  v5 = -[TIKeyboardInputManagerClient init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.TextInput"), 4096);
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    +[TIKeyboardInputManagerStub serverInterface](TIKeyboardInputManagerStub, "serverInterface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v5->_connection, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection setExportedObject:](v5->_connection, "setExportedObject:", v4);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE05A848);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v5->_connection, "setExportedInterface:", v9);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.keyboard.xpc", v10);
    if (v11)
    {
      dispatch_get_global_queue(33, 2uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      dispatch_set_target_queue(v11, v12);

      -[NSXPCConnection _setQueue:](v5->_connection, "_setQueue:", v11);
    }
    -[NSXPCConnection resume](v5->_connection, "resume");

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerClient;
  -[TIKeyboardInputManagerClient dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

- (TIKeyboardInputManagerClient)init
{

  return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerClient;
  if (-[TIKeyboardInputManagerClient respondsToSelector:](&v5, sel_respondsToSelector_))
    return 1;
  else
    return +[TIKeyboardInputManagerStub instancesRespondToSelector:](TIKeyboardInputManagerStub, "instancesRespondToSelector:", a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerClient;
  if (-[TIKeyboardInputManagerClient conformsToProtocol:](&v7, sel_conformsToProtocol_, v4))
    v5 = 1;
  else
    v5 = +[TIKeyboardInputManagerStub conformsToProtocol:](TIKeyboardInputManagerStub, "conformsToProtocol:", v4);

  return v5;
}

- (void)handleError:(id)a3 forRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v6, "setErrorCount:", objc_msgSend(v6, "errorCount") + 1);
  if ((unint64_t)objc_msgSend(v6, "errorCount") > 1)
  {
    -[TIKeyboardInputManagerClient connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[TIKeyboardInputManagerClient setConnection:](self, "setConnection:", 0);
    objc_msgSend(v6, "invocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector((SEL)objc_msgSend(v7, "selector"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Please check for kbd crash logs. %s closed connection to keyboard daemon after two consecutive failures sending %@"), "-[TIKeyboardInputManagerClient handleError:forRequest:]", v8);
  }
  else
  {
    objc_msgSend(v6, "invocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector((SEL)objc_msgSend(v7, "selector"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s will retry sending %@ to keyboard daemon after receiving %@"), "-[TIKeyboardInputManagerClient handleError:forRequest:]", v8, v10);
  }

  -[TIKeyboardInputManagerClient handleRequest:](self, "handleRequest:", v6);
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

uint64_t __46__TIKeyboardInputManagerClient_handleRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleError:forRequest:", a2, *(_QWORD *)(a1 + 40));
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___TIKeyboardInputManagerClient;
  if ((objc_msgSendSuper2(&v5, sel_instancesRespondToSelector_) & 1) != 0)
    return 1;
  else
    return +[TIKeyboardInputManagerStub instancesRespondToSelector:](TIKeyboardInputManagerStub, "instancesRespondToSelector:", a3);
}

@end
