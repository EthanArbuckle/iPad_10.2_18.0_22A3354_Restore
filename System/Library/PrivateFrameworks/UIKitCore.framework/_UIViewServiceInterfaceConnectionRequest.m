@implementation _UIViewServiceInterfaceConnectionRequest

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _class_setCustomDeallocInitiation();
}

- (void)_objc_initiateDealloc
{
  id v3;
  _QWORD v4[5];

  v3 = -[_UIAsyncInvocation invoke](self->_cancellationInvocation, "invoke");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65___UIViewServiceInterfaceConnectionRequest__objc_initiateDealloc__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0ls32l8;
  v4[4] = self;
  objc_msgSend(v3, "whenCompleteDo:", v4);
}

+ (id)connectToViewServiceWithBundleIdentifier:(id)a3 connectionHandler:(id)a4
{
  return (id)objc_msgSend(a1, "_connectToViewServiceWithBundleIdentifier:service:connectionHandler:", a3, 0, a4);
}

+ (id)_connectToViewServiceWithBundleIdentifier:(id)a3 service:(id)a4 connectionHandler:(id)a5
{
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  _QWORD block[5];
  _QWORD v24[6];
  _QWORD v25[7];
  _QWORD v26[6];
  char v27;

  if (!a5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("%s is nil"), "connectionHandler");
  v9 = objc_alloc_init((Class)a1);
  if (!v9)
    abort();
  v10 = v9;
  if (a3)
  {
    v9[2] = objc_msgSend(a3, "copy");
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = (objc_class *)objc_opt_class();
    v13 = (void *)objc_msgSend(v11, "stringWithFormat:", CFSTR("com.apple.UIKit.%@ %@"), NSStringFromClass(v12), a3);
  }
  else
  {
    v9[3] = a4;
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    v13 = (void *)objc_msgSend(v14, "stringWithFormat:", CFSTR("com.apple.UIKit.%@ %@"), NSStringFromClass(v15), objc_msgSend((id)v10[3], "identifier"));
  }
  v10[4] = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), 0);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3810000000;
  v26[3] = &unk_18685B0AF;
  v27 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke;
  v25[3] = &unk_1E16E8660;
  v25[4] = a5;
  v25[5] = v26;
  v25[6] = v10;
  v10[1] = objc_msgSend(v25, "copy");
  v17 = a3;
  if (!a3)
    v17 = (id)objc_msgSend((id)v10[3], "identifier");
  v24[0] = v16;
  v24[1] = 3221225472;
  v24[2] = __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_2;
  v24[3] = &unk_1E16E8688;
  v24[4] = v17;
  v24[5] = v10;
  v10[7] = +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v24);
  if (a3)
  {
    v18 = v10[4];
    block[0] = v16;
    block[1] = 3221225472;
    block[2] = __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_4;
    block[3] = &unk_1E16B41B8;
    block[4] = v10;
    dispatch_async(v18, block);
  }
  else
  {
    v19 = (void *)v10[3];
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __112___UIViewServiceInterfaceConnectionRequest__connectToViewServiceWithBundleIdentifier_service_connectionHandler___block_invoke_5;
    v22[3] = &unk_1E16E86B0;
    v22[4] = v10;
    objc_msgSend(v19, "beginUsing:", v22);
  }
  v20 = (id)v10[7];
  _Block_object_dispose(v26, 8);
  return v20;
}

+ (id)connectToViewService:(id)a3 connectionHandler:(id)a4
{
  return (id)objc_msgSend(a1, "_connectToViewServiceWithBundleIdentifier:service:connectionHandler:", 0, a3, a4);
}

- (void)dealloc
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  dispatch_release((dispatch_object_t)self->_queue);
  if (!self->_serviceSessionConnectionResumed)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v5 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "For some reason, we got deallocated without resuming our _serviceSessionConnection. This is an error.", buf, 2u);
      }
    }
    else
    {
      v3 = dealloc___s_category_11;
      if (!dealloc___s_category_11)
      {
        v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&dealloc___s_category_11);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "For some reason, we got deallocated without resuming our _serviceSessionConnection. This is an error.", buf, 2u);
      }
    }
    -[NSXPCConnection resume](self->_serviceSessionConnection, "resume");
    self->_serviceSessionConnectionResumed = 1;
  }

  self->_service = 0;
  v6.receiver = self;
  v6.super_class = (Class)_UIViewServiceInterfaceConnectionRequest;
  -[_UIViewServiceInterfaceConnectionRequest dealloc](&v6, sel_dealloc);
}

- (void)_launchService
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58___UIViewServiceInterfaceConnectionRequest__launchService__block_invoke;
  block[3] = &unk_1E16B41B8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_createProcessAssertion
{
  NSString *serviceBundleIdentifier;
  _QWORD v3[5];

  if (!self->_isCancelled)
  {
    serviceBundleIdentifier = self->_serviceBundleIdentifier;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __67___UIViewServiceInterfaceConnectionRequest__createProcessAssertion__block_invoke;
    v3[3] = &unk_1E16E8700;
    v3[4] = self;
    -[_UIViewServiceInterfaceConnectionRequest _createProcessAssertionForPID:orBundleIdentifier:acquiredHandler:](self, "_createProcessAssertionForPID:orBundleIdentifier:acquiredHandler:", 0xFFFFFFFFLL, serviceBundleIdentifier, v3);
  }
}

- (void)_createProcessAssertionForPID:(int)a3 orBundleIdentifier:(id)a4 acquiredHandler:(id)a5
{
  uint64_t v7;
  id v9;
  BKSProcessAssertion *v10;
  NSString *serviceBundleIdentifier;

  v7 = *(_QWORD *)&a3;
  v9 = objc_alloc(MEMORY[0x1E0CFE308]);
  if (a4)
    v10 = (BKSProcessAssertion *)objc_msgSend(v9, "initWithBundleIdentifier:flags:reason:name:withHandler:", a4, 15, 9, CFSTR("com.apple.viewservice.session"), a5);
  else
    v10 = (BKSProcessAssertion *)objc_msgSend(v9, "initWithPID:flags:reason:name:withHandler:", v7, 15, 9, CFSTR("com.apple.viewservice.session"), a5);
  self->_serviceProcessAssertion = v10;
  if (-[_UIRemoteViewService identifier](self->_service, "identifier"))
    serviceBundleIdentifier = (NSString *)-[_UIRemoteViewService identifier](self->_service, "identifier");
  else
    serviceBundleIdentifier = self->_serviceBundleIdentifier;
  _UIViewServiceInterfaceLogAssertionInfo((uint64_t)CFSTR("Assertion created"), (uint64_t)serviceBundleIdentifier, (uint64_t)self->_serviceProcessAssertion);
}

- (void)_createPlugInProcessAssertion
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!self->_isCancelled)
  {
    v3 = -[_UIRemoteViewService processIdentifier](self->_service, "processIdentifier");
    if ((_DWORD)v3)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __73___UIViewServiceInterfaceConnectionRequest__createPlugInProcessAssertion__block_invoke;
      v5[3] = &unk_1E16E8700;
      v5[4] = self;
      -[_UIViewServiceInterfaceConnectionRequest _createProcessAssertionForPID:orBundleIdentifier:acquiredHandler:](self, "_createProcessAssertionForPID:orBundleIdentifier:acquiredHandler:", v3, 0, v5);
    }
    else
    {
      v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find pid for %@"), self->_serviceBundleIdentifier);
      v6 = CFSTR("Message");
      v7[0] = v4;
      -[_UIViewServiceInterfaceConnectionRequest _cancelWithError:](self, "_cancelWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("_UIViewServiceInterfaceErrorDomain"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1)));
    }
  }
}

- (void)_createAndEstablishConnection
{
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3B38]);
  v4 = (void *)objc_msgSend(CFSTR("com.apple.uikit.viewservice."), "stringByAppendingString:", self->_serviceBundleIdentifier);
  v5 = objc_msgSend(v4, "length");
  if (v5 >= 0x3F)
    v6 = 63;
  else
    v6 = v5;
  self->_serviceSessionConnection = (NSXPCConnection *)objc_msgSend(v3, "initWithMachServiceName:options:", objc_msgSend(v4, "substringToIndex:", v6), 0);
  self->_serviceSessionConnectionResumed = 0;
  -[_UIViewServiceInterfaceConnectionRequest _establishConnection](self, "_establishConnection");
  -[_UIViewServiceInterfaceConnectionRequest _didConnectToService](self, "_didConnectToService");
}

- (void)_establishConnection
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3052000000;
  v4[3] = __Block_byref_object_copy__222;
  v4[4] = __Block_byref_object_dispose__222;
  v4[5] = self;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64___UIViewServiceInterfaceConnectionRequest__establishConnection__block_invoke;
  v3[3] = &unk_1E16B14C0;
  v3[4] = v4;
  -[NSXPCConnection _setQueue:](self->_serviceSessionConnection, "_setQueue:", self->_queue);
  -[NSXPCConnection setInterruptionHandler:](self->_serviceSessionConnection, "setInterruptionHandler:", v3);
  -[NSXPCConnection setInvalidationHandler:](self->_serviceSessionConnection, "setInvalidationHandler:", v3);
  -[NSXPCConnection resume](self->_serviceSessionConnection, "resume");
  self->_serviceSessionConnectionResumed = 1;
  _Block_object_dispose(v4, 8);
}

- (void)_didConnectToService
{
  BKSProcessAssertion *serviceProcessAssertion;
  BKSProcessAssertion *v4;
  NSXPCConnection *v5;
  NSString *serviceBundleIdentifier;

  if (!self->_isCancelled)
  {
    serviceProcessAssertion = self->_serviceProcessAssertion;
    v4 = serviceProcessAssertion;
    self->_serviceProcessAssertion = 0;
    v5 = self->_serviceSessionConnection;
    self->_serviceSessionConnection = 0;
    if (-[_UIRemoteViewService identifier](self->_service, "identifier"))
      serviceBundleIdentifier = (NSString *)-[_UIRemoteViewService identifier](self->_service, "identifier");
    else
      serviceBundleIdentifier = self->_serviceBundleIdentifier;
    _UIViewServiceInterfaceLogAssertionInfo((uint64_t)CFSTR("Did connect to service"), (uint64_t)serviceBundleIdentifier, (uint64_t)serviceProcessAssertion);
    (*((void (**)(void))self->_connectionHandler + 2))();
    self->_successfullyHandledConnection = 1;
  }
}

- (void)_cancelWithError:(id)a3
{
  unint64_t v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = _cancelWithError____s_category;
  if (!_cancelWithError____s_category)
  {
    v5 = __UILogCategoryGetNode("ViewServiceConnectionRequest", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v5, (unint64_t *)&_cancelWithError____s_category);
  }
  v6 = *(NSObject **)(v5 + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = a3;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Cancelled view service connection request with error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  if (!self->_cancellationError)
    self->_cancellationError = (NSError *)a3;
  -[_UIAsyncInvocation invoke](self->_cancellationInvocation, "invoke");
}

- (void)_cancelUnconditionallyThen:(id)a3
{
  NSString *serviceBundleIdentifier;
  BKSProcessAssertion *serviceProcessAssertion;
  unint64_t v7;
  NSObject *v8;
  NSObject *queue;
  NSObject *v10;
  _QWORD block[7];
  uint8_t buf[16];

  self->_isCancelled = 1;
  if (-[_UIRemoteViewService identifier](self->_service, "identifier"))
    serviceBundleIdentifier = (NSString *)-[_UIRemoteViewService identifier](self->_service, "identifier");
  else
    serviceBundleIdentifier = self->_serviceBundleIdentifier;
  serviceProcessAssertion = self->_serviceProcessAssertion;
  if (!self->_successfullyHandledConnection || serviceProcessAssertion)
    _UIViewServiceInterfaceLogAssertionInfo((uint64_t)CFSTR("Cancelled active service request"), (uint64_t)serviceBundleIdentifier, (uint64_t)serviceProcessAssertion);
  if (!self->_serviceSessionConnectionResumed)
  {
    if (os_variant_has_internal_diagnostics())
    {
      v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Connection request invalidated without resuming our _serviceSessionConnection. This is an error.", buf, 2u);
      }
    }
    else
    {
      v7 = _cancelUnconditionallyThen____s_category;
      if (!_cancelUnconditionallyThen____s_category)
      {
        v7 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v7, (unint64_t *)&_cancelUnconditionallyThen____s_category);
      }
      v8 = *(NSObject **)(v7 + 8);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v8, OS_LOG_TYPE_ERROR, "Connection request invalidated without resuming our _serviceSessionConnection. This is an error.", buf, 2u);
      }
    }
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71___UIViewServiceInterfaceConnectionRequest__cancelUnconditionallyThen___block_invoke;
  block[3] = &unk_1E16E8728;
  block[5] = a3;
  block[6] = self;
  block[4] = serviceBundleIdentifier;
  dispatch_async(queue, block);
}

@end
