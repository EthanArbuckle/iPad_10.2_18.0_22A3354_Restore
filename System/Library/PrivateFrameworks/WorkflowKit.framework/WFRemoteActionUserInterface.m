@implementation WFRemoteActionUserInterface

- (WFRemoteActionUserInterface)initWithUserInterfaceType:(id)a3 listenerEndpoint:(id)a4 interface:(id)a5
{
  id v10;
  id v11;
  id v12;
  WFRemoteActionUserInterface *v13;
  WFRemoteActionUserInterface *v14;
  void *v15;
  uint64_t v16;
  WFActionRemoteUserInterface *remoteUserInterface;
  WFRemoteActionUserInterface *v18;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteActionUserInterface.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("listenerEndpoint"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteActionUserInterface.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInterfaceType"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRemoteActionUserInterface.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interface"));

LABEL_4:
  v26.receiver = self;
  v26.super_class = (Class)WFRemoteActionUserInterface;
  v13 = -[WFRemoteActionUserInterface init](&v26, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_userInterfaceType, a3);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", v11);
    objc_msgSend(v15, "setRemoteObjectInterface:", v12);
    objc_initWeak(&location, v14);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __84__WFRemoteActionUserInterface_initWithUserInterfaceType_listenerEndpoint_interface___block_invoke;
    v23[3] = &unk_1E7AF5510;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v15, "setInterruptionHandler:", v23);
    objc_msgSend(v15, "resume");
    objc_storeStrong((id *)&v14->_connection, v15);
    objc_msgSend(v15, "remoteObjectProxy");
    v16 = objc_claimAutoreleasedReturnValue();
    remoteUserInterface = v14->_remoteUserInterface;
    v14->_remoteUserInterface = (WFActionRemoteUserInterface *)v16;

    v18 = v14;
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);

  }
  return v14;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFRemoteActionUserInterface;
  if (-[WFRemoteActionUserInterface respondsToSelector:](&v5, sel_respondsToSelector_, a3))
    return self;
  -[WFRemoteActionUserInterface remoteUserInterface](self, "remoteUserInterface");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WFRemoteActionUserInterface remoteUserInterface](self, "remoteUserInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", v4);

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFRemoteActionUserInterface;
  if (-[WFRemoteActionUserInterface respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v4 = 1;
  }
  else
  {
    -[WFRemoteActionUserInterface remoteUserInterface](self, "remoteUserInterface");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

  }
  return v4 & 1;
}

- (NSString)userInterfaceType
{
  return self->_userInterfaceType;
}

- (id)onInterfaceInterruption
{
  return self->_onInterfaceInterruption;
}

- (void)setOnInterfaceInterruption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (WFActionRemoteUserInterface)remoteUserInterface
{
  return self->_remoteUserInterface;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteUserInterface, 0);
  objc_storeStrong(&self->_onInterfaceInterruption, 0);
  objc_storeStrong((id *)&self->_userInterfaceType, 0);
}

void __84__WFRemoteActionUserInterface_initWithUserInterfaceType_listenerEndpoint_interface___block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(void);
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "onInterfaceInterruption");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "onInterfaceInterruption");
    v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v2[2]();

  }
}

@end
