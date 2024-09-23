@implementation TRIPushServiceConnectionCreator

- (id)connectionWithDelegate:(id)a3 environment:(unsigned __int8)a4
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  TRISandboxedPushServiceConnection *v8;
  TRISandboxedPushServiceConnection *v9;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("com.apple.triald.aps.sandbox-environment"));

  TRILogCategory_Server();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v6;
    _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Sandbox mode enabled for APS: %d", (uint8_t *)v11, 8u);
  }

  if (v6)
    v8 = objc_alloc_init(TRISandboxedPushServiceConnection);
  else
    v8 = -[TRIPushServiceConnection initWithDelegate:]([TRIPushServiceConnection alloc], "initWithDelegate:", v4);
  v9 = v8;

  return v9;
}

@end
