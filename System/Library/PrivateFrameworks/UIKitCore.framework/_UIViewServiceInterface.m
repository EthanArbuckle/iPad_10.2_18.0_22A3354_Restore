@implementation _UIViewServiceInterface

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _class_setCustomDeallocInitiation();
}

- (void)_objc_initiateDealloc
{
  id v3;
  _QWORD v4[5];

  v3 = -[_UIViewServiceInterface disconnect](self, "disconnect");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48___UIViewServiceInterface__objc_initiateDealloc__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0ls32l8;
  v4[4] = self;
  objc_msgSend(v3, "whenCompleteDo:", v4);
}

+ (id)connectToViewServiceWithBundleIdentifier:(id)a3 deputyInterfaces:(id)a4 connectionHandler:(id)a5
{
  _QWORD v6[8];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __103___UIViewServiceInterface_connectToViewServiceWithBundleIdentifier_deputyInterfaces_connectionHandler___block_invoke;
  v6[3] = &unk_1E16E8750;
  v6[4] = a1;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  return +[_UIViewServiceInterfaceConnectionRequest connectToViewServiceWithBundleIdentifier:connectionHandler:](_UIViewServiceInterfaceConnectionRequest, "connectToViewServiceWithBundleIdentifier:connectionHandler:", a3, v6);
}

+ (id)connectToViewService:(id)a3 deputyInterfaces:(id)a4 connectionHandler:(id)a5
{
  _QWORD v6[8];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83___UIViewServiceInterface_connectToViewService_deputyInterfaces_connectionHandler___block_invoke;
  v6[3] = &unk_1E16E8750;
  v6[4] = a1;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  return +[_UIViewServiceInterfaceConnectionRequest connectToViewService:connectionHandler:](_UIViewServiceInterfaceConnectionRequest, "connectToViewService:connectionHandler:", a3, v6);
}

- (id)_initWithConnectionInfo:(id)a3 serviceBundleIdentifier:(id)a4 service:(id)a5 deputyInterfaces:(id)a6
{
  id var1;
  id var0;
  _UIViewServiceInterface *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  NSObject *v16;
  _QWORD v18[5];
  _QWORD v19[5];
  _QWORD v20[5];
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  var1 = a3.var1;
  var0 = a3.var0;
  v26 = *MEMORY[0x1E0C80C00];
  v21.receiver = self;
  v21.super_class = (Class)_UIViewServiceInterface;
  v11 = -[_UIViewServiceInterface init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(a5, "identifier");
    if (v12)
      v13 = v12;
    else
      v13 = (uint64_t)a4;
    _UIViewServiceInterfaceLogAssertionInfo((uint64_t)CFSTR("Initialized service interface"), v13, (uint64_t)var0);
    if (var0 && var1)
    {
      v11->_serviceProcessAssertion = (BKSProcessAssertion *)var0;
      v11->_serviceConnection = (NSXPCConnection *)var1;
      v14 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __100___UIViewServiceInterface__initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces___block_invoke;
      v20[3] = &__block_descriptor_40_e14_v16__0___v___8ls32l8;
      v20[4] = v11;
      v11->_terminateInvocation = +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v20);
      v19[0] = v14;
      v19[1] = 3221225472;
      v19[2] = __100___UIViewServiceInterface__initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces___block_invoke_2;
      v19[3] = &__block_descriptor_40_e5_v8__0ls32l8;
      v19[4] = v11;
      -[NSXPCConnection setInvalidationHandler:](v11->_serviceConnection, "setInvalidationHandler:", v19);
      v18[0] = v14;
      v18[1] = 3221225472;
      v18[2] = __100___UIViewServiceInterface__initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces___block_invoke_3;
      v18[3] = &__block_descriptor_40_e5_v8__0ls32l8;
      v18[4] = v11;
      -[NSXPCConnection setInterruptionHandler:](v11->_serviceConnection, "setInterruptionHandler:", v18);
      -[NSXPCConnection setDelegate:](v11->_serviceConnection, "setDelegate:", v11);
      if (a6)
        -[NSXPCConnection setRemoteObjectInterface:](v11->_serviceConnection, "setRemoteObjectInterface:", +[_UIViewServiceDeputyManager exportedInterfaceSupportingDeputyInterfaces:](_UIViewServiceDeputyManager, "exportedInterfaceSupportingDeputyInterfaces:", a6));
      if (a4)
        v11->_serviceBundleIdentifier = (NSString *)objc_msgSend(a4, "copy");
      if (a5)
        v11->_service = (_UIRemoteViewService *)a5;
    }
    else
    {
      v15 = _initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces____s_category;
      if (!_initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces____s_category)
      {
        v15 = __UILogCategoryGetNode("ViewServiceAssertion", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v15, (unint64_t *)&_initWithConnectionInfo_serviceBundleIdentifier_service_deputyInterfaces____s_category);
      }
      v16 = *(NSObject **)(v15 + 8);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        v23 = var0;
        v24 = 2048;
        v25 = var1;
        _os_log_impl(&dword_185066000, v16, OS_LOG_TYPE_FAULT, "<rdar://22970009>: Failed to load remote view service due to either missing process assertion (%p) or missing service connection (%p)", buf, 0x16u);
      }
      objc_msgSend(var0, "invalidate");
      objc_msgSend(var1, "invalidate");
      return 0;
    }
  }
  return v11;
}

- (id)_initWithConnectionInfo:(id)a3 serviceBundleIdentifier:(id)a4 deputyInterfaces:(id)a5
{
  return -[_UIViewServiceInterface _initWithConnectionInfo:serviceBundleIdentifier:service:deputyInterfaces:](self, "_initWithConnectionInfo:serviceBundleIdentifier:service:deputyInterfaces:", a3.var0, a3.var1, a4, 0, a5);
}

- (id)_initWithConnectionInfo:(id)a3 service:(id)a4 deputyInterfaces:(id)a5
{
  return -[_UIViewServiceInterface _initWithConnectionInfo:serviceBundleIdentifier:service:deputyInterfaces:](self, "_initWithConnectionInfo:serviceBundleIdentifier:service:deputyInterfaces:", a3.var0, a3.var1, 0, a4, a5);
}

- (id)connectToDeputyWithInterface:(id)a3 fromExportedHostingObject:(id)a4 connectionHandler:(id)a5
{
  _UIRemoteViewService *service;
  NSString *serviceBundleIdentifier;
  unsigned __int8 v10;
  void *v11;
  objc_class *v12;
  const char *v13;
  dispatch_queue_t v14;
  uint64_t v15;
  NSXPCConnection *serviceConnection;
  uint64_t v17;
  void *v18;
  id *v19;
  dispatch_semaphore_t v20;
  NSObject *global_queue;
  uint64_t v22;
  _UIAsyncInvocation *v23;
  _QWORD v25[6];
  uint64_t v26;
  _QWORD v27[6];
  _QWORD *v28;
  _QWORD v29[6];
  _QWORD v30[6];
  _QWORD v31[3];
  char v32;
  _QWORD v33[5];
  _QWORD block[7];
  id v35;

  v35 = a4;
  service = self->_service;
  if (service)
    serviceBundleIdentifier = (NSString *)-[_UIRemoteViewService identifier](service, "identifier");
  else
    serviceBundleIdentifier = self->_serviceBundleIdentifier;
  os_unfair_lock_lock(&self->_terminationStateLock);
  v10 = atomic_load((unsigned __int8 *)&self->_isTerminated);
  if ((v10 & 1) != 0)
  {
    v20 = dispatch_semaphore_create(0);
    global_queue = dispatch_get_global_queue(0, 0);
    v22 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke;
    block[3] = &unk_1E16E8798;
    block[5] = v20;
    block[6] = a5;
    block[4] = serviceBundleIdentifier;
    dispatch_async(global_queue, block);
    v33[0] = v22;
    v33[1] = 3221225472;
    v33[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_2;
    v33[3] = &unk_1E16E87C0;
    v33[4] = v20;
    return +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v33);
  }
  else
  {
    os_unfair_lock_unlock(&self->_terminationStateLock);
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    v13 = (const char *)objc_msgSend((id)objc_msgSend(v11, "stringWithFormat:", CFSTR("com.apple.uikit.%@ %@ %@ %p"), NSStringFromClass(v12), serviceBundleIdentifier, a3, self), "UTF8String");
    v14 = dispatch_queue_create(v13, 0);
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v32 = 1;
    v15 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_3;
    v30[3] = &unk_1E16E8888;
    v30[4] = v14;
    v30[5] = v31;
    serviceConnection = self->_serviceConnection;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_5;
    v29[3] = &unk_1E16E8838;
    v29[4] = v30;
    v29[5] = a5;
    v17 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](serviceConnection, "remoteObjectProxyWithErrorHandler:", v29);
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_7;
    v27[3] = &unk_1E16E8860;
    v27[4] = v30;
    v27[5] = a5;
    v28 = v27;
    v18 = (void *)objc_msgSend(a3, "connectionInvocation");
    if (objc_msgSend(a3, "hostObjectInterface"))
    {
      v19 = &v35;
    }
    else
    {
      v26 = 0;
      v19 = (id *)&v26;
    }
    objc_msgSend(v18, "setArgument:atIndex:", v19, 2);
    objc_msgSend(v18, "setArgument:atIndex:", &v28, 3);
    objc_msgSend(v18, "setSelector:", objc_msgSend(a3, "connectionSelector"));
    objc_msgSend(v18, "invokeWithTarget:", v17);
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __100___UIViewServiceInterface_connectToDeputyWithInterface_fromExportedHostingObject_connectionHandler___block_invoke_9;
    v25[3] = &unk_1E16E8888;
    v25[4] = v14;
    v25[5] = v31;
    v23 = +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v25);
    _Block_object_dispose(v31, 8);
  }
  return v23;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  void (**AssociatedObject)(id, id);
  void *v7;
  _QWORD v8[5];

  if (a5
    && (AssociatedObject = (void (**)(id, id))objc_getAssociatedObject((id)objc_msgSend(a4, "target", a3), &_UIViewServiceIncomingReplyHandlerKey)) != 0)
  {
    AssociatedObject[2](AssociatedObject, a4);
  }
  else
  {
    objc_msgSend(a4, "retainArguments", a3);
    v7 = (void *)objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63___UIViewServiceInterface_connection_handleInvocation_isReply___block_invoke;
    v8[3] = &unk_1E16B41B8;
    v8[4] = a4;
    objc_msgSend(v7, "performAsync:", v8);
  }
}

- (id)_terminateWithError:(id)a3
{
  os_unfair_lock_s *p_terminationStateLock;

  p_terminationStateLock = &self->_terminationStateLock;
  os_unfair_lock_lock(&self->_terminationStateLock);
  if (!self->_terminationError)
    self->_terminationError = (NSError *)a3;
  os_unfair_lock_unlock(p_terminationStateLock);
  return -[_UIAsyncInvocation invoke](self->_terminateInvocation, "invoke");
}

- (void)_terminateUnconditionallyThen:(id)a3
{
  os_unfair_lock_s *p_terminationStateLock;
  void (**v6)(_QWORD, _QWORD);
  NSError *v7;
  NSString *serviceBundleIdentifier;
  BOOL *p_isTerminated;
  unsigned __int8 v10;
  NSXPCConnection *serviceConnection;
  NSObject *v12;
  _QWORD block[5];

  p_terminationStateLock = &self->_terminationStateLock;
  os_unfair_lock_lock(&self->_terminationStateLock);
  v6 = (void (**)(_QWORD, _QWORD))objc_msgSend(self->_terminationHandler, "copy");
  v7 = self->_terminationError;
  os_unfair_lock_unlock(p_terminationStateLock);
  if (v6)
    ((void (**)(_QWORD, NSError *))v6)[2](v6, v7);

  if (-[_UIRemoteViewService identifier](self->_service, "identifier"))
    serviceBundleIdentifier = (NSString *)-[_UIRemoteViewService identifier](self->_service, "identifier");
  else
    serviceBundleIdentifier = self->_serviceBundleIdentifier;
  _UIViewServiceInterfaceLogAssertionInfo((uint64_t)CFSTR("Terminating interface and invalidating assertion"), (uint64_t)serviceBundleIdentifier, (uint64_t)self->_serviceProcessAssertion);
  -[BKSProcessAssertion invalidate](self->_serviceProcessAssertion, "invalidate");

  self->_serviceProcessAssertion = 0;
  p_isTerminated = &self->_isTerminated;
  do
    v10 = __ldaxr((unsigned __int8 *)p_isTerminated);
  while (__stlxr(v10 | 1, (unsigned __int8 *)p_isTerminated));
  if ((v10 & 1) != 0 || (serviceConnection = self->_serviceConnection) == 0)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    -[NSXPCConnection setInvalidationHandler:](serviceConnection, "setInvalidationHandler:", 0);
    -[NSXPCConnection setInterruptionHandler:](self->_serviceConnection, "setInterruptionHandler:", 0);
    _UIViewServiceInterfaceLogAssertionInfo((uint64_t)CFSTR("Terminating interface and invalidating connection"), (uint64_t)serviceBundleIdentifier, (uint64_t)self->_serviceProcessAssertion);
    -[NSXPCConnection invalidate](self->_serviceConnection, "invalidate");
    v12 = -[NSXPCConnection _queue](self->_serviceConnection, "_queue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57___UIViewServiceInterface__terminateUnconditionallyThen___block_invoke;
    block[3] = &unk_1E16B16F0;
    block[4] = a3;
    dispatch_async(v12, block);
  }
}

- (void)setTerminationHandler:(id)a3
{
  os_unfair_lock_s *p_terminationStateLock;
  id terminationHandler;

  p_terminationStateLock = &self->_terminationStateLock;
  os_unfair_lock_lock(&self->_terminationStateLock);
  terminationHandler = self->_terminationHandler;
  if (terminationHandler != a3)
  {

    self->_terminationHandler = (id)objc_msgSend(a3, "copy");
    os_unfair_lock_unlock(p_terminationStateLock);
  }
}

- (id)disconnect
{
  NSString *serviceBundleIdentifier;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (-[_UIRemoteViewService identifier](self->_service, "identifier"))
    serviceBundleIdentifier = (NSString *)-[_UIRemoteViewService identifier](self->_service, "identifier");
  else
    serviceBundleIdentifier = self->_serviceBundleIdentifier;
  _UIViewServiceInterfaceLogAssertionInfo((uint64_t)CFSTR("Disconnecting"), (uint64_t)serviceBundleIdentifier, (uint64_t)self->_serviceProcessAssertion);
  v5 = CFSTR("Message");
  v6[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Disconnecting %@"), serviceBundleIdentifier);
  return -[_UIViewServiceInterface _terminateWithError:](self, "_terminateWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceErrorDomain"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1)));
}

- (void)dealloc
{
  objc_super v3;

  self->_service = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIViewServiceInterface;
  -[_UIViewServiceInterface dealloc](&v3, sel_dealloc);
}

- (int)servicePID
{
  return -[NSXPCConnection processIdentifier](self->_serviceConnection, "processIdentifier");
}

- ($115C4C562B26FF47E01F9F4EA65B5887)serviceAuditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_serviceConnection;
  if (result)
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)-[$115C4C562B26FF47E01F9F4EA65B5887 auditToken](result, "auditToken");
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

@end
