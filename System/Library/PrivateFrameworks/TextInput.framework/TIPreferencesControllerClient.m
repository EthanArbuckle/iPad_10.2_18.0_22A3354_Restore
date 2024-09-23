@implementation TIPreferencesControllerClient

+ (id)sharedPreferencesController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__TIPreferencesControllerClient_sharedPreferencesController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferencesController_once_583 != -1)
    dispatch_once(&sharedPreferencesController_once_583, block);
  return (id)sharedPreferencesController_sharedController_584;
}

void __60__TIPreferencesControllerClient_sharedPreferencesController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedPreferencesController_sharedController_584;
  sharedPreferencesController_sharedController_584 = v0;

}

- (TIPreferencesControllerClient)init
{
  TIPreferencesControllerClient *v2;
  uint64_t v3;
  NSString *machName;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TIPreferencesControllerClient;
  v2 = -[TIPreferencesController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(CFSTR("com.apple.TextInput.preferences"), "copy");
    machName = v2->_machName;
    v2->_machName = (NSString *)v3;

    v2->_isValid = 0;
  }
  return v2;
}

- (void)forwardInvocation:(id)a3
{
  void *v4;
  objc_method_description MethodDescription;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = &unk_1EE050000;
  MethodDescription = protocol_getMethodDescription((Protocol *)v4, (SEL)objc_msgSend(v8, "selector"), 1, 1);
  if (MethodDescription.name && *MethodDescription.types == 118)
  {
    -[TIPreferencesControllerClient createConnectionIfNecessary](self, "createConnectionIfNecessary");
    -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[TIPreferencesController setIgnoreNextSyncNotification:](self, "setIgnoreNextSyncNotification:", 1);
      -[NSXPCConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invokeWithTarget:", v7);

    }
  }
  objc_msgSend(v8, "invokeWithTarget:", self);

}

- (void)_disconnect
{
  NSXPCConnection *connection;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  self->_isValid = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TIPreferencesControllerClient;
  -[TIPreferencesController dealloc](&v3, sel_dealloc);
}

- (void)createConnectionIfNecessary
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  void *v6;
  NSXPCConnection *v7;
  TIPreferencesControllerClient *v8;
  uint64_t v9;
  TIPreferencesControllerClient *v10;
  NSXPCConnection *v11;
  TIPreferencesControllerClient *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  TIPreferencesControllerClient *v17;
  _QWORD v18[4];
  TIPreferencesControllerClient *v19;

  if (!self->_isValid)
  {
    -[NSXPCConnection invalidate](self->_connection, "invalidate");
    connection = self->_connection;
    self->_connection = 0;

    self->_isValid = 1;
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", self->_machName, 4096);
    v5 = self->_connection;
    self->_connection = v4;

    +[TIPreferencesControllerClient serviceInterface](TIPreferencesControllerClient, "serviceInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);

    v7 = self->_connection;
    if (_preferencesClientDispatchQueue_onceToken != -1)
      dispatch_once(&_preferencesClientDispatchQueue_onceToken, &__block_literal_global_677);
    -[NSXPCConnection _setQueue:](v7, "_setQueue:", _preferencesClientDispatchQueue___xpc_queue);
    v8 = self;
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __60__TIPreferencesControllerClient_createConnectionIfNecessary__block_invoke;
    v18[3] = &unk_1E243B440;
    v10 = v8;
    v19 = v10;
    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v18);
    v13 = v9;
    v14 = 3221225472;
    v15 = __60__TIPreferencesControllerClient_createConnectionIfNecessary__block_invoke_2;
    v16 = &unk_1E243B440;
    v17 = v10;
    v11 = self->_connection;
    v12 = v10;
    -[NSXPCConnection setInvalidationHandler:](v11, "setInvalidationHandler:", &v13);
    -[NSXPCConnection resume](self->_connection, "resume", v13, v14, v15, v16);

  }
}

- (void)_pushValue:(id)a3 toPreference:(id)a4 domain:(id)a5
{
  objc_super v5;

  if (self->_writeable)
  {
    v5.receiver = self;
    v5.super_class = (Class)TIPreferencesControllerClient;
    -[TIPreferencesController _pushValue:toPreference:domain:](&v5, sel__pushValue_toPreference_domain_, a3, a4, a5);
  }
}

- (void)performWithWriteability:(BOOL)a3 operations:(id)a4
{
  BOOL writeable;

  writeable = self->_writeable;
  self->_writeable = a3;
  (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  self->_writeable = writeable;
}

- (void)updateInputModes:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TIPreferencesControllerClient *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__TIPreferencesControllerClient_updateInputModes___block_invoke;
  v6[3] = &unk_1E243B4B8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[TIPreferencesControllerClient performWithWriteability:operations:](self, "performWithWriteability:operations:", 1, v6);

}

- (NSString)machName
{
  return self->_machName;
}

- (void)setMachName:(id)a3
{
  objc_storeStrong((id *)&self->_machName, a3);
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machName, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

id __50__TIPreferencesControllerClient_updateInputModes___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)TIPreferencesControllerClient;
  return objc_msgSendSuper2(&v3, sel_updateInputModes_, v1);
}

uint64_t __60__TIPreferencesControllerClient_createConnectionIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsValid:", 0);
}

uint64_t __60__TIPreferencesControllerClient_createConnectionIfNecessary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsValid:", 0);
}

+ (id)serviceInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE050000);
}

@end
