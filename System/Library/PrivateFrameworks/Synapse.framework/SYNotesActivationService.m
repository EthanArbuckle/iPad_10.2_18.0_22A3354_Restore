@implementation SYNotesActivationService

- (SYNotesActivationService)init
{
  SYNotesActivationService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *serviceQueue;
  SYNotesActivationObserver *v6;
  SYNotesActivationObserver *notesActivationObserver;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SYNotesActivationService;
  v2 = -[SYNotesActivationService init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.synapse.NotesActivationService", v3);
    serviceQueue = v2->__serviceQueue;
    v2->__serviceQueue = (OS_dispatch_queue *)v4;

    v6 = -[SYNotesActivationObserver initWithHandler:]([SYNotesActivationObserver alloc], "initWithHandler:", &__block_literal_global_8);
    notesActivationObserver = v2->__notesActivationObserver;
    v2->__notesActivationObserver = v6;

  }
  return v2;
}

- (void)beginListeningToConnections
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SYNotesActivationService _listener](self, "_listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.synapse.notes-activation-service"));
    -[SYNotesActivationService _setListener:](self, "_setListener:", v4);

    -[SYNotesActivationService _listener](self, "_listener");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SYNotesActivationService _serviceQueue](self, "_serviceQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setQueue:", v6);

    -[SYNotesActivationService _listener](self, "_listener");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[SYNotesActivationService _listener](self, "_listener");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resume");

  }
}

- (void)activateNotesWithContext:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  int v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if (SYIsPhone())
  {
    if (SYIsQuickNoteOnPhoneEnabled())
    {
      -[SYNotesActivationService _notesActivationObserver](self, "_notesActivationObserver");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isVisible");

      if (!v8)
      {
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.SystemPaperViewService"), CFSTR("ViewController"));
        v10 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
        v11 = (void *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v9, v10);
        v12 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
        objc_msgSend(v23, "processHandle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = objc_alloc(MEMORY[0x1E0DAAFA8]);
          objc_msgSend(v23, "processHandle");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v14, "initWithTargetProcess:", v15);
          objc_msgSend(v12, "setPresentationTarget:", v16);

        }
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "contextID") && objc_msgSend(v23, "renderID"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v23, "renderID"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("renderID"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v23, "contextID"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("contextID"));

        }
        objc_msgSend(v23, "userActivityData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v23, "userActivityData");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v21, CFSTR("userActivityData"));

        }
        v22 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(v12, "setUserInfo:", v22);

        objc_msgSend(v11, "activateWithContext:", v12);
        if (v6)
          v6[2](v6, 0);

        goto LABEL_6;
      }
    }
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.synapse"), -127, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v6)[2](v6, v9);
LABEL_6:

  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[SYNotesActivationService _listener](self, "_listener");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    -[SYNotesActivationService _serviceQueue](self, "_serviceQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setQueue:", v9);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF495688);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExportedInterface:", v10);

    objc_msgSend(v6, "setExportedObject:", self);
    objc_msgSend(v6, "resume");
  }

  return v8 == v7;
}

- (NSXPCListener)_listener
{
  return self->__listener;
}

- (void)_setListener:(id)a3
{
  objc_storeStrong((id *)&self->__listener, a3);
}

- (OS_dispatch_queue)_serviceQueue
{
  return self->__serviceQueue;
}

- (void)_setServiceQueue:(id)a3
{
  objc_storeStrong((id *)&self->__serviceQueue, a3);
}

- (SYNotesActivationObserver)_notesActivationObserver
{
  return self->__notesActivationObserver;
}

- (void)_setNotesActivationObserver:(id)a3
{
  objc_storeStrong((id *)&self->__notesActivationObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__notesActivationObserver, 0);
  objc_storeStrong((id *)&self->__serviceQueue, 0);
  objc_storeStrong((id *)&self->__listener, 0);
}

@end
