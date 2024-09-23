@implementation STSHardwareManagerWrapper

- (id)manager
{
  STSHardwareManagerWrapper *v2;
  void *v3;
  int v4;
  int v5;
  void *v6;
  dispatch_semaphore_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  intptr_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v16;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BE6B5A0], "sharedHardwareManagerWithNoUI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[STSHardwareManagerWrapper resolvedHwManagerState](v2, "resolvedHwManagerState"))
  {
    v4 = objc_msgSend(v3, "getHwSupport");
  }
  else
  {
    objc_msgSend(v3, "registerEventListener:", v2);
    v5 = objc_msgSend(v3, "getHwSupport");
    v4 = v5;
    if (v5 != 2 && v5 != 4)
    {
      -[STSHardwareManagerWrapper sem](v2, "sem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v7 = dispatch_semaphore_create(0);
        -[STSHardwareManagerWrapper setSem:](v2, "setSem:", v7);

      }
      -[STSHardwareManagerWrapper sem](v2, "sem");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = dispatch_time(0, 60000000000);
      v10 = dispatch_semaphore_wait(v8, v9);

      if (v10)
      {
        v4 = 1;
        sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSHardwareManagerWrapper manager]", 47, v2, CFSTR("NF state timeout"), v11, v12, v16);
      }
      else
      {
        v4 = objc_msgSend(v3, "getHwSupport");
      }
    }
    -[STSHardwareManagerWrapper setResolvedHwManagerState:](v2, "setResolvedHwManagerState:", 1);
    objc_msgSend(v3, "unregisterEventListener:", v2);
  }
  if (v4 == 2)
    v13 = v3;
  else
    v13 = 0;
  v14 = v13;

  objc_sync_exit(v2);
  return v14;
}

- (void)hardwareStateDidChange
{
  void *v3;
  NSObject *v4;

  -[STSHardwareManagerWrapper sem](self, "sem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[STSHardwareManagerWrapper sem](self, "sem");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v4);

  }
}

- (OS_dispatch_semaphore)sem
{
  return self->_sem;
}

- (void)setSem:(id)a3
{
  objc_storeStrong((id *)&self->_sem, a3);
}

- (BOOL)resolvedHwManagerState
{
  return self->_resolvedHwManagerState;
}

- (void)setResolvedHwManagerState:(BOOL)a3
{
  self->_resolvedHwManagerState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sem, 0);
}

@end
