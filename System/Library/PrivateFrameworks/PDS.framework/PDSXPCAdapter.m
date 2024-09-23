@implementation PDSXPCAdapter

- (id)interfaceWithProtocol:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", a3);
}

+ (BOOL)disableXPC
{
  return _XPCDisabled;
}

+ (void)setDisableXPC:(BOOL)a3
{
  _XPCDisabled = a3;
}

+ (id)defaultConnectionVendor
{
  void *v4;

  if (_XPCDisabled)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PDSXPCAdapter.m"), 41, CFSTR("XPC was disabled!"));

  }
  return (id)objc_msgSend(a1, "_sharedInstance");
}

+ (id)_sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__PDSXPCAdapter__sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedInstance_onceToken != -1)
    dispatch_once(&_sharedInstance_onceToken, block);
  return (id)_sharedInstance_sharedInstance;
}

void __32__PDSXPCAdapter__sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)_sharedInstance_sharedInstance;
  _sharedInstance_sharedInstance = v1;

}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PDSXPCAdapter;
  return -[PDSXPCAdapter init](&v3, sel_init);
}

- (id)connectionForMachService:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BDD1988];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithMachServiceName:options:", v4, 0);

  return v5;
}

@end
