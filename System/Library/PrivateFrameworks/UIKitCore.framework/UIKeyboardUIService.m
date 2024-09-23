@implementation UIKeyboardUIService

+ (id)sharedService
{
  return objc_alloc_init((Class)a1);
}

- (UIKeyboardUIService)init
{
  UIKeyboardUIService *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v7;
  NSMutableArray *slots;
  void *v9;
  id *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIKeyboardUIService;
  v2 = -[UIKeyboardUIService init](&v17, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("com.apple.inputservice.keyboardui", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
    slots = v2->_slots;
    v2->_slots = (NSMutableArray *)v7;

    v9 = (void *)MEMORY[0x1E0D23030];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __27__UIKeyboardUIService_init__block_invoke;
    v15[3] = &unk_1E16E0820;
    v10 = v2;
    v16 = v10;
    objc_msgSend(v9, "listenerWithConfigurator:", v15);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v10[1];
    v10[1] = (id)v11;

    objc_msgSend(v10[1], "activate");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v10, sel_clearSlots, CFSTR("UIApplicationDidEnterBackgroundNotification"), 0);

  }
  return v2;
}

void __27__UIKeyboardUIService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDomain:", CFSTR("com.apple.inputservice.keyboardui"));
  objc_msgSend(v3, "setService:", CFSTR("com.apple.inputservice.keyboardui"));
  objc_msgSend(v3, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)dealloc
{
  objc_super v3;

  -[UIKeyboardUIService clearSlots](self, "clearSlots");
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardUIService;
  -[UIKeyboardUIService dealloc](&v3, sel_dealloc);
}

- (void)clearSlots
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_slots;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[UIKeyboardUIService context](self, "context", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "deleteSlot:", objc_msgSend(v8, "unsignedIntValue"));

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

+ (id)serviceInterface
{
  if (qword_1ECD80958 != -1)
    dispatch_once(&qword_1ECD80958, &__block_literal_global_12_7);
  return (id)qword_1ECD80950;
}

void __39__UIKeyboardUIService_serviceInterface__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D22FE8], "interfaceWithIdentifier:", CFSTR("com.apple.inputservice.keyboardui"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE024B98);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServer:", v0);

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EE0CEA68);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v1);

  objc_msgSend(v4, "setClientMessagingExpectation:", 1);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)qword_1ECD80950;
  qword_1ECD80950 = v2;

}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6;
  OS_dispatch_queue *v7;
  void *v8;
  id v9;
  OS_dispatch_queue *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  OS_dispatch_queue *v14;
  id v15;

  v6 = a4;
  v7 = self->_dispatchQueue;
  objc_msgSend((id)objc_opt_class(), "serviceInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__UIKeyboardUIService_listener_didReceiveConnection_withContext___block_invoke;
  v12[3] = &unk_1E16E3980;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = v8;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v11, "configureConnection:", v12);
  objc_msgSend(v11, "activate");

}

void __65__UIKeyboardUIService_listener_didReceiveConnection_withContext___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  UIKeyboardUIHandle *v5;

  v3 = a2;
  v5 = -[UIKeyboardUIHandle initWithService:connection:]([UIKeyboardUIHandle alloc], "initWithService:connection:", a1[4], a1[5]);
  objc_msgSend(v3, "setTargetQueue:", a1[6]);
  objc_msgSend(MEMORY[0x1E0D23040], "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  objc_msgSend(v3, "setInterface:", a1[7]);
  objc_msgSend(v3, "setInterfaceTarget:", v5);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_24_5);
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_26_5);

}

void __65__UIKeyboardUIService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  KeyboardUIServiceLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating connection: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __65__UIKeyboardUIService_listener_didReceiveConnection_withContext___block_invoke_25(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  KeyboardUIServiceLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "Interrupting connection: %@", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(v2, "invalidate");
}

- (void)createContext
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  CAContext *v7;
  CAContext *context;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0C9AE50];
  v4 = *MEMORY[0x1E0CD2A20];
  v9[0] = *MEMORY[0x1E0CD2A40];
  v9[1] = v4;
  v10[0] = v3;
  v10[1] = CFSTR("SnapshotContext");
  v5 = *MEMORY[0x1E0CD2A38];
  v9[2] = *MEMORY[0x1E0CD2A30];
  v9[3] = v5;
  v10[2] = v3;
  v10[3] = v3;
  v9[4] = *MEMORY[0x1E0CD2A10];
  v10[4] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD2720], "remoteContextWithOptions:", v6);
  v7 = (CAContext *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  self->_context = v7;

}

- (CAContext)context
{
  CAContext *context;

  context = self->_context;
  if (!context)
  {
    -[UIKeyboardUIService createContext](self, "createContext");
    context = self->_context;
  }
  return context;
}

- (int)createSlot:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *slots;
  void *v12;

  height = a3.height;
  width = a3.width;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((unint64_t)-[NSMutableArray count](self->_slots, "count") >= 3)
  {
    -[NSMutableArray firstObject](self->_slots, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntValue");

    -[UIKeyboardUIService context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteSlot:", v7);

    -[NSMutableArray removeObjectAtIndex:](self->_slots, "removeObjectAtIndex:", 0);
  }
  -[UIKeyboardUIService context](self, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "createImageSlot:hasAlpha:", 1, width, height);

  slots = self->_slots;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](slots, "addObject:", v12);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slots, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_bsConnectionlistener, 0);
}

@end
