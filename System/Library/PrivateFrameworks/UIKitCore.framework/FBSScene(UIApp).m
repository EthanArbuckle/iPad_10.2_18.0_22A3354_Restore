@implementation FBSScene(UIApp)

- (id)uiSettings
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FBSScene+UIApp.m"), 32, CFSTR("settings is of an unexpected class : %@"), v4);

  }
  return v4;
}

- (uint64_t)uiCanReceiveDeviceOrientationEvents
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isUISubclass"))
    v2 = objc_msgSend(v1, "deviceOrientationEventsEnabled");
  else
    v2 = 1;

  return v2;
}

- (id)uiClientSettings
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "clientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FBSScene+UIApp.m"), 38, CFSTR("clientSettings is of an unexpected class : %@"), v4);

  }
  return v4;
}

- (void)updateUIClientSettingsWithBlock:()UIApp
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  _QWORD block[5];
  id v11;

  v5 = a3;
  if ((dyld_program_sdk_at_least() & 1) == 0 && pthread_main_np() != 1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__FBSScene_UIApp__updateUIClientSettingsWithBlock___block_invoke;
    block[3] = &unk_1E16B1D18;
    block[4] = a1;
    v11 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v6 = v11;
    goto LABEL_7;
  }
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __51__FBSScene_UIApp__updateUIClientSettingsWithBlock___block_invoke_2;
    v7[3] = &unk_1E16C7978;
    v9 = a2;
    v7[4] = a1;
    v8 = v5;
    objc_msgSend(a1, "updateClientSettingsWithBlock:", v7);
    v6 = v8;
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(a1, "updateClientSettingsWithBlock:", 0);
LABEL_8:

}

- (void)updateUIClientSettingsWithTransitionBlock:()UIApp
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  _QWORD block[5];
  id v11;

  v5 = a3;
  if ((dyld_program_sdk_at_least() & 1) == 0 && pthread_main_np() != 1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__FBSScene_UIApp__updateUIClientSettingsWithTransitionBlock___block_invoke;
    block[3] = &unk_1E16B1D18;
    block[4] = a1;
    v11 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v6 = v11;
    goto LABEL_7;
  }
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__FBSScene_UIApp__updateUIClientSettingsWithTransitionBlock___block_invoke_2;
    v7[3] = &unk_1E16B2738;
    v9 = a2;
    v7[4] = a1;
    v8 = v5;
    objc_msgSend(a1, "updateClientSettingsWithTransitionBlock:", v7);
    v6 = v8;
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(a1, "updateClientSettingsWithTransitionBlock:", 0);
LABEL_8:

}

- (BOOL)isPersistable
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isUISubclass"))
  {
    objc_msgSend(a1, "uiSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "persistenceIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)uiAlwaysSupportsAllInterfaceOrientations
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "settings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isUISubclass"))
    v2 = objc_msgSend(v1, "interfaceOrientationMode") == 2;
  else
    v2 = 1;

  return v2;
}

@end
