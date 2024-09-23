@implementation PREXPCServer

+ (void)_registerResponsesListener
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v2 = objc_opt_new();
  v3 = (void *)_registerResponsesListener_delegate;
  _registerResponsesListener_delegate = v2;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.proactive.experiments.responses"));
  v5 = (void *)_registerResponsesListener_listener;
  _registerResponsesListener_listener = v4;

  objc_msgSend((id)_registerResponsesListener_listener, "setDelegate:", _registerResponsesListener_delegate);
  objc_msgSend((id)_registerResponsesListener_listener, "resume");
  pre_sv_xpc_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_227234000, v6, OS_LOG_TYPE_DEFAULT, "Registered for Responses XPC Service", v7, 2u);
  }

}

+ (void)registerPREXPCListeners
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__PREXPCServer_registerPREXPCListeners__block_invoke;
  v8[3] = &__block_descriptor_40_e5_B8__0l;
  v8[4] = a1;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__PREXPCServer_registerPREXPCListeners__block_invoke_2;
  v6[3] = &unk_24EF87408;
  v7 = (id)MEMORY[0x2276AE11C](v8, a2);
  v2 = registerPREXPCListeners__pasOnceToken2;
  v3 = v7;
  v4 = v3;
  if (v2 == -1)
  {
    v5 = v3;
  }
  else
  {
    dispatch_once(&registerPREXPCListeners__pasOnceToken2, v6);
    v5 = v7;
  }

}

uint64_t __39__PREXPCServer_registerPREXPCListeners__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_registerResponsesListener");
  return 1;
}

void __39__PREXPCServer_registerPREXPCListeners__block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x2276ADFCC]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

@end
