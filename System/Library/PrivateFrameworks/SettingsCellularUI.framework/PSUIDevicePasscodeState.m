@implementation PSUIDevicePasscodeState

+ (id)sharedInstance
{
  if (qword_253E96FE8 != -1)
    dispatch_once(&qword_253E96FE8, &__block_literal_global_6);
  return (id)_MergedGlobals_59;
}

void __41__PSUIDevicePasscodeState_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSUIDevicePasscodeState initPrivate]([PSUIDevicePasscodeState alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_59;
  _MergedGlobals_59 = (uint64_t)v0;

}

- (id)initPrivate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PSUIDevicePasscodeState;
  return -[PSUIDevicePasscodeState init](&v3, sel_init);
}

- (PSUIDevicePasscodeState)init
{
  NSObject *v2;
  uint8_t v3[16];

  -[PSUIDevicePasscodeState getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_2161C6000, v2, OS_LOG_TYPE_ERROR, "Unsupported initializer called", v3, 2u);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (BOOL)isPasscodeSet
{
  unsigned int v3;
  NSObject *v4;
  NSObject *v5;
  const char *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = MKBGetDeviceLockState();
  -[PSUIDevicePasscodeState getLogger](self, "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v8 = 67109120;
    LODWORD(v9) = v3;
    _os_log_debug_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEBUG, "MKBGetDeviceLockState : %d", (uint8_t *)&v8, 8u);
  }

  -[PSUIDevicePasscodeState getLogger](self, "getLogger");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = "OFF";
    if (v3 < 3)
      v7 = "ON";
    v8 = 136315138;
    v9 = v7;
    _os_log_debug_impl(&dword_2161C6000, v5, OS_LOG_TYPE_DEBUG, "Passcode : %s", (uint8_t *)&v8, 0xCu);
  }

  return v3 < 3;
}

- (id)getLogger
{
  return (id)objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("keybag.st"));
}

@end
