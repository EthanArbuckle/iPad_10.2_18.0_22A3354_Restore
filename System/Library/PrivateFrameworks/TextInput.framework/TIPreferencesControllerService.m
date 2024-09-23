@implementation TIPreferencesControllerService

- (TIPreferencesControllerService)init
{
  TIPreferencesControllerService *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v6;
  NSXPCListener *listener;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TIPreferencesControllerService;
  v2 = -[TIPreferencesControllerService init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.TextInput.preferences-service", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.TextInput.preferences"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v6;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener _setQueue:](v2->_listener, "_setQueue:", v2->_dispatchQueue);
    -[NSXPCListener resume](v2->_listener, "resume");

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)TIPreferencesControllerService;
  -[TIPreferencesControllerService dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  TIPreferencesControllerServiceHandler *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = objc_alloc_init(TIPreferencesControllerServiceHandler);
  objc_msgSend(v5, "setExportedObject:", v6);

  +[TIPreferencesControllerClient serviceInterface](TIPreferencesControllerClient, "serviceInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);

  -[TIPreferencesControllerService dispatchQueue](self, "dispatchQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setQueue:", v8);

  objc_msgSend(v5, "resume");
  return 1;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

+ (id)sharedPreferencesController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__TIPreferencesControllerService_sharedPreferencesController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferencesController_once_615 != -1)
    dispatch_once(&sharedPreferencesController_once_615, block);
  return (id)sharedPreferencesController_sharedController_616;
}

void __61__TIPreferencesControllerService_sharedPreferencesController__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedPreferencesController_sharedController_616;
  sharedPreferencesController_sharedController_616 = v0;

}

@end
