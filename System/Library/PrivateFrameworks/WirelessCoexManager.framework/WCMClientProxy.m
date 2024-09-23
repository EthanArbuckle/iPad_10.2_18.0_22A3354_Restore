@implementation WCMClientProxy

- (WCMClientProxy)init
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  xpc_release(self->mConnection);
  v3.receiver = self;
  v3.super_class = (Class)WCMClientProxy;
  -[WCMClientProxy dealloc](&v3, sel_dealloc);
}

- (WCMClientProxy)initWithClientProcessId:(int)a3 delegate:(id)a4 dispatch:(id)a5
{
  WCMClientProxy *v8;
  WCMClientProxy *v9;
  WCMClientCallback *v10;
  OS_dispatch_queue *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WCMClientProxy;
  v8 = -[WCMClientProxy init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    if (a3 && a4)
    {
      v8->mProcessId = a3;
      v10 = (WCMClientCallback *)a4;
      v11 = (OS_dispatch_queue *)MEMORY[0x24BDAC9B8];
      if (a5)
        v11 = (OS_dispatch_queue *)a5;
      v9->mDelegate = v10;
      v9->mQueue = v11;
      v9->mIsRegistered = 0;
      if (-[WCMClientProxy connectToServer](v9, "connectToServer"))
      {
        -[WCMClientProxy registerToServer](v9, "registerToServer");
        return v9;
      }
      NSLog(CFSTR("Failed to connect to WCM"));
    }

    return 0;
  }
  return v9;
}

- (BOOL)connectToServer
{
  OS_xpc_object *mConnection;
  OS_xpc_object *mach_service;
  OS_xpc_object *v5;
  _QWORD handler[5];

  self->mIsRegistered = 0;
  mConnection = self->mConnection;
  if (mConnection)
    xpc_release(mConnection);
  mach_service = xpc_connection_create_mach_service("com.apple.WirelessCoexManager", (dispatch_queue_t)self->mQueue, 0);
  v5 = mach_service;
  self->mConnection = mach_service;
  if (mach_service)
  {
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __33__WCMClientProxy_connectToServer__block_invoke;
    handler[3] = &unk_24C30D658;
    handler[4] = self;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_activate(self->mConnection);
  }
  return v5 != 0;
}

void __33__WCMClientProxy_connectToServer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  const char *string;
  uint64_t uint64;

  v4 = MEMORY[0x20BD2523C](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (a2 == (void *)MEMORY[0x24BDACF30])
    {
      objc_msgSend(*(id *)(a1 + 32), "registerToServer");
    }
    else if (a2 == (void *)MEMORY[0x24BDACF38])
    {
      objc_msgSend(*(id *)(a1 + 32), "connectToServer");
    }
    else
    {
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
      NSLog(CFSTR("XPC error: %s"), string);
    }
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    uint64 = xpc_dictionary_get_uint64(a2, "kMessageId");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "receiveMessage:argument:", uint64, xpc_dictionary_get_value(a2, "kMessageArgs"));
  }
  else
  {
    v5 = (void *)MEMORY[0x20BD251A0](a2);
    NSLog(CFSTR("Unexpected XPC message: %s"), v5);
    free(v5);
  }
}

- (void)registerToServer
{
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7[2];
  char *v8[2];
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x24BDAC8D0];
  NSLog(CFSTR("Try to re-register to WCM"), a2);
  keys[0] = "kWCMRegisterProcess_ProcessId";
  v3 = xpc_uint64_create(self->mProcessId);
  values = v3;
  v4 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  *(_OWORD *)v8 = xmmword_24C30D678;
  v5 = xpc_uint64_create(1uLL);
  v7[0] = v5;
  v7[1] = v4;
  v6 = xpc_dictionary_create((const char *const *)v8, v7, 2uLL);
  xpc_connection_send_message(self->mConnection, v6);
  xpc_release(v3);
  xpc_release(v4);
  xpc_release(v5);
  xpc_release(v6);
  self->mIsRegistered = 1;
}

- (void)sendMessage:(int)a3 argument:(id)a4
{
  NSObject *mQueue;
  _QWORD block[6];
  int v9;

  if (a4)
    xpc_retain(a4);
  mQueue = self->mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WCMClientProxy_sendMessage_argument___block_invoke;
  block[3] = &unk_24C30D690;
  v9 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async(mQueue, block);
}

void __39__WCMClientProxy_sendMessage_argument___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  xpc_object_t v3;
  void *v4;
  xpc_object_t v5;
  xpc_object_t object[2];
  char *keys[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[32])
    objc_msgSend(v2, "registerToServer");
  *(_OWORD *)keys = xmmword_24C30D678;
  v3 = xpc_uint64_create(*(unsigned int *)(a1 + 48));
  v4 = *(void **)(a1 + 40);
  object[0] = v3;
  object[1] = v4;
  v5 = xpc_dictionary_create((const char *const *)keys, object, 2uLL);
  xpc_connection_send_message(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 40), v5);
  xpc_release(*(xpc_object_t *)(a1 + 40));
  xpc_release(object[0]);
  xpc_release(v5);
}

- (void)reConnect
{
  xpc_connection_cancel(self->mConnection);
}

@end
