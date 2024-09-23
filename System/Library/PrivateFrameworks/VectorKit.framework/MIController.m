@implementation MIController

- (MIController)init
{
  MIController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  OS_xpc_object *connection;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MIController;
  v2 = -[MIController init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.Maps.MIController", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    connection = v2->_connection;
    v2->_connection = 0;

    v2->_isActive = 0;
  }
  return v2;
}

- (void)activateController:(id)a3
{
  id v5;
  OS_xpc_object *mach_service;
  OS_xpc_object *connection;
  OS_xpc_object *v8;
  void *v9;
  _QWORD handler[5];

  v5 = a3;
  objc_storeStrong((id *)&self->_mapView, a3);
  mach_service = xpc_connection_create_mach_service("com.apple.mapinspectord", (dispatch_queue_t)self->_queue, 2uLL);
  connection = self->_connection;
  self->_connection = mach_service;

  v8 = self->_connection;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __35__MIController_activateController___block_invoke;
  handler[3] = &unk_1E42F5218;
  handler[4] = self;
  xpc_connection_set_event_handler(v8, handler);
  xpc_connection_resume(self->_connection);
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", &unk_1E43480C0, 200, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIController sendData:](self, "sendData:", v9);
  self->_isActive = 1;

}

- (void)deactivateController
{
  OS_xpc_object *connection;
  OS_xpc_object *v4;

  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v4 = self->_connection;
    self->_connection = 0;

  }
  self->_isActive = 0;
}

- (void)handleXPCEvent:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = MEMORY[0x1A1AF5C58]();
  if (v4 == MEMORY[0x1E0C812F8])
  {
    v6 = (id)_CFXPCCreateCFObjectFromXPCMessage();
    -[MIController recievedData:](self, "recievedData:", v6);
    CFRelease(v6);

  }
  else if (v4 == MEMORY[0x1E0C81310] && self->_isActive)
  {
    v5 = (void *)MEMORY[0x1A1AF5C4C](v7);
    free(v5);
    -[MIController deactivateController](self, "deactivateController");
  }

}

- (void)recievedData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("Type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("Data"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("DebugTree")))
      -[MIController decodeDebugTreeData:](self, "decodeDebugTreeData:", v6);

    v4 = v7;
  }

}

- (void)sendData:(id)a3
{
  id v4;
  id v5;
  CFDataRef v6;
  void *v7;
  id v8;

  v4 = a3;
  if (self->_connection)
  {
    v8 = v4;
    v5 = objc_retainAutorelease(v4);
    v6 = CFDataCreate(0, (const UInt8 *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
    v7 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    xpc_connection_send_message(self->_connection, v7);
    CFRelease(v6);

    v4 = v8;
  }

}

- (void)decodeDebugTreeData:(id)a3
{
  VKDebugTree *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = objc_alloc_init(VKDebugTree);
  objc_msgSend(v11, "objectForKey:", CFSTR("Options"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKDebugTree setOptions:](v4, "setOptions:", v5);
  -[VKDebugTree populateData:](v4, "populateData:", self->_mapView);
  -[VKDebugTree serializeTree](v4, "serializeTree");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v6, CFSTR("Tree Data"));
  if (v7)
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("UUID"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", CFSTR("DebugTree"), CFSTR("Type"));
  objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("Data"));
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v9, 200, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIController sendData:](self, "sendData:", v10);

}

- (BOOL)isActive
{
  return self->_isActive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __35__MIController_activateController___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleXPCEvent:", a2);
}

+ (id)sharedController
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MIController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MIController sharedController]::onceToken != -1)
    dispatch_once(&+[MIController sharedController]::onceToken, block);
  return (id)+[MIController sharedController]::sharedController;
}

void __32__MIController_sharedController__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[MIController sharedController]::sharedController;
  +[MIController sharedController]::sharedController = (uint64_t)v1;

}

@end
