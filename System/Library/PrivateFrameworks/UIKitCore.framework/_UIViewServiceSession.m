@implementation _UIViewServiceSession

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _class_setCustomDeallocInitiation();
}

- (void)_objc_initiateDealloc
{
  id v3;
  _QWORD v4[5];

  v3 = -[_UIAsyncInvocation invoke](self->_invalidationInvocation, "invoke");
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46___UIViewServiceSession__objc_initiateDealloc__block_invoke;
  v4[3] = &__block_descriptor_40_e5_v8__0ls32l8;
  v4[4] = self;
  objc_msgSend(v3, "whenCompleteDo:", v4);
}

+ (id)sessionWithConnection:(id)a3 manager:(id)a4
{
  id v7;
  _UIViewServiceDeputyManager *v8;
  id v9;
  void *v10;
  objc_class *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];

  _UIApplicationIsExtension();
  v7 = objc_alloc_init((Class)a1);
  *((_QWORD *)v7 + 7) = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  v8 = objc_alloc_init(_UIViewServiceDeputyManager);
  *((_QWORD *)v7 + 4) = v8;
  -[_UIViewServiceDeputyManager setDelegate:](v8, "setDelegate:", v7);
  v9 = a3;
  *((_QWORD *)v7 + 2) = v9;
  objc_msgSend(v9, "setExportedInterface:", objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE0CF2A8));
  objc_msgSend(*((id *)v7 + 2), "setExportedObject:", *((_QWORD *)v7 + 4));
  *((_QWORD *)v7 + 3) = a4;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  v12 = (const char *)objc_msgSend((id)objc_msgSend(v10, "stringWithFormat:", CFSTR("com.apple.uikit.%@ %p"), NSStringFromClass(v11), a1), "UTF8String");
  *((_QWORD *)v7 + 1) = dispatch_queue_create(v12, 0);
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __55___UIViewServiceSession_sessionWithConnection_manager___block_invoke;
  v19[3] = &__block_descriptor_40_e14_v16__0___v___8ls32l8;
  v19[4] = v7;
  *((_QWORD *)v7 + 5) = +[_UIAsyncInvocation invocationWithBlock:](_UIAsyncInvocation, "invocationWithBlock:", v19);
  v14 = (void *)*((_QWORD *)v7 + 2);
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __55___UIViewServiceSession_sessionWithConnection_manager___block_invoke_2;
  v18[3] = &__block_descriptor_40_e5_v8__0ls32l8;
  v18[4] = v7;
  objc_msgSend(v14, "setInterruptionHandler:", v18);
  v15 = (void *)*((_QWORD *)v7 + 2);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __55___UIViewServiceSession_sessionWithConnection_manager___block_invoke_3;
  v17[3] = &__block_descriptor_40_e5_v8__0ls32l8;
  v17[4] = v7;
  objc_msgSend(v15, "setInvalidationHandler:", v17);
  objc_msgSend(*((id *)v7 + 2), "_setQueue:", *((_QWORD *)v7 + 1));
  objc_msgSend(*((id *)v7 + 2), "setDelegate:", v7);
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_connection)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIViewServiceSession.m"), 139, CFSTR("session's connection should already have been torn down by this point; overrelease probable"));
  dispatch_release((dispatch_object_t)self->_queue);
  -[_UIViewServiceDeputyManager setDelegate:](self->_deputyManager, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)_UIViewServiceSession;
  -[_UIViewServiceSession dealloc](&v3, sel_dealloc);
}

- (void)deputyManager:(id)a3 didUpdateExportedInterface:(id)a4
{
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", a4);
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  void *v6;
  _QWORD v7[5];

  objc_msgSend(a4, "retainArguments", a3);
  v6 = (void *)objc_msgSend((id)UIApp, "_systemAnimationFenceExemptQueue");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61___UIViewServiceSession_connection_handleInvocation_isReply___block_invoke;
  v7[3] = &unk_1E16B41B8;
  v7[4] = a4;
  objc_msgSend(v6, "performAsync:", v7);
}

- (void)setTerminationHandler:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47___UIViewServiceSession_setTerminationHandler___block_invoke;
  v4[3] = &unk_1E16E8810;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_invalidateUnconditionallyThen:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56___UIViewServiceSession__invalidateUnconditionallyThen___block_invoke;
  v4[3] = &unk_1E16E8DD8;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(queue, v4);
}

- (void)deputy:(id)a3 didFailWithError:(id)a4
{
  -[_UIAsyncInvocation invoke](self->_invalidationInvocation, "invoke", a3, a4);
}

- (void)registerDeputyClass:(Class)a3 withConnectionHandler:(id)a4
{
  id v7;
  _UIViewServiceDeputyManager *deputyManager;
  _QWORD v9[6];

  v7 = +[_UIWeakReference weakReferenceWrappingObject:](_UIWeakReference, "weakReferenceWrappingObject:", self);
  deputyManager = self->_deputyManager;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67___UIViewServiceSession_registerDeputyClass_withConnectionHandler___block_invoke;
  v9[3] = &unk_1E16E8E00;
  v9[4] = v7;
  v9[5] = a4;
  -[_UIViewServiceDeputyManager registerDeputyClass:withConnectionHandler:](deputyManager, "registerDeputyClass:withConnectionHandler:", a3, v9);
}

- (void)unregisterDeputyClass:(Class)a3
{
  -[_UIViewServiceDeputyManager unregisterDeputyClass:](self->_deputyManager, "unregisterDeputyClass:", a3);
}

- (void)viewControllerOperator:(id)a3 didCreateServiceViewControllerOfClass:(Class)a4
{
  -[_UIViewServiceDeputyManager viewControllerOperator:didCreateServiceViewControllerOfClass:](self->_deputyManager, "viewControllerOperator:didCreateServiceViewControllerOfClass:", a3, a4);
}

- (void)viewControllerOperator:(id)a3 didCreateServiceViewController:(id)a4 contextToken:(id)a5
{
  -[_UIViewServiceSessionManagerDelegate viewServiceSessionManager:didCreateViewController:contextToken:](-[_UIViewServiceSessionManager delegate](-[_UIViewServiceSession manager](self, "manager", a3), "delegate"), "viewServiceSessionManager:didCreateViewController:contextToken:", -[_UIViewServiceSession manager](self, "manager"), a4, a5);
}

- (BOOL)requiresExtensionContextForViewControllerOperator:(id)a3
{
  if (-[_UIViewServiceSessionManager delegate](-[_UIViewServiceSession manager](self, "manager", a3), "delegate"))
    return -[_UIViewServiceSessionManagerDelegate requiresExtensionContextForViewServiceSessionManager:](-[_UIViewServiceSessionManager delegate](-[_UIViewServiceSession manager](self, "manager"), "delegate"), "requiresExtensionContextForViewServiceSessionManager:", -[_UIViewServiceSession manager](self, "manager"));
  else
    return 1;
}

- (id)viewControllerClassNameForViewControllerOperator:(id)a3
{
  id result;

  if (-[_UIViewServiceSessionManager delegate](-[_UIViewServiceSession manager](self, "manager", a3), "delegate"))
    return (id)-[_UIViewServiceSessionManagerDelegate viewControllerClassNameForViewServiceSessionManager:](-[_UIViewServiceSessionManager delegate](-[_UIViewServiceSession manager](self, "manager"), "delegate"), "viewControllerClassNameForViewServiceSessionManager:", -[_UIViewServiceSession manager](self, "manager"));
  result = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_class performSelector:](NSClassFromString(CFSTR("UIKit_PKSubsystem")), "performSelector:", sel_sharedInstance), "valueForKey:", CFSTR("infoDictionary")), "objectForKeyedSubscript:", CFSTR("NSExtension")), "objectForKeyedSubscript:", CFSTR("NSExtensionPrincipalClass"));
  if (!result)
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "infoDictionary"), "objectForKeyedSubscript:", CFSTR("NSExtensionPrincipalClass"));
  return result;
}

- (id)containingViewControllerClassNameForViewControllerOperator:(id)a3
{
  if (-[_UIViewServiceSessionManager delegate](-[_UIViewServiceSession manager](self, "manager", a3), "delegate"))
    return (id)-[_UIViewServiceSessionManagerDelegate containingViewControllerClassNameForViewServiceSessionManager:](-[_UIViewServiceSessionManager delegate](-[_UIViewServiceSession manager](self, "manager"), "delegate"), "containingViewControllerClassNameForViewServiceSessionManager:", -[_UIViewServiceSession manager](self, "manager"));
  else
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_class performSelector:](NSClassFromString(CFSTR("UIKit_PKSubsystem")), "performSelector:", sel_sharedInstance), "valueForKey:", CFSTR("infoDictionary")), "objectForKeyedSubscript:", CFSTR("NSExtension")), "objectForKeyedSubscript:", CFSTR("NSExtensionContainingViewControllerClass"));
}

- (id)mainStoryboardNameForViewControllerOperator:(id)a3
{
  if (-[_UIViewServiceSessionManager delegate](-[_UIViewServiceSession manager](self, "manager", a3), "delegate"))
    return (id)-[_UIViewServiceSessionManagerDelegate mainStoryboardNameForViewServiceSessionManager:](-[_UIViewServiceSessionManager delegate](-[_UIViewServiceSession manager](self, "manager"), "delegate"), "mainStoryboardNameForViewServiceSessionManager:", -[_UIViewServiceSession manager](self, "manager"));
  else
    return (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[objc_class performSelector:](NSClassFromString(CFSTR("UIKit_PKSubsystem")), "performSelector:", sel_sharedInstance), "valueForKey:", CFSTR("infoDictionary")), "objectForKeyedSubscript:", CFSTR("NSExtension")), "objectForKeyedSubscript:", CFSTR("NSExtensionMainStoryboard"));
}

- (_UIViewServiceSessionManager)manager
{
  return self->_manager;
}

- (id)terminationHandler
{
  return self->_terminationHandler;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

@end
