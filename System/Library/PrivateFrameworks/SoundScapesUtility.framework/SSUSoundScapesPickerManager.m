@implementation SSUSoundScapesPickerManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SSUSoundScapesPickerManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_manager;
}

void __44__SSUSoundScapesPickerManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = v0;

}

- (SSUSoundScapesPickerManager)init
{
  SSUSoundScapesPickerManager *v2;
  uint64_t v3;
  NSMapTable *targetMediaProfile;
  uint64_t v5;
  NSMapTable *delegates;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSUSoundScapesPickerManager;
  v2 = -[SSUSoundScapesPickerManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 513, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    targetMediaProfile = v2->_targetMediaProfile;
    v2->_targetMediaProfile = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 513, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    delegates = v2->_delegates;
    v2->_delegates = (NSMapTable *)v5;

  }
  return v2;
}

- (void)registerViewController:(id)a3 forMediaProfiles:(id)a4 andDelegate:(id)a5
{
  NSMapTable *targetMediaProfile;
  id v9;
  id v10;
  id v11;

  targetMediaProfile = self->_targetMediaProfile;
  v9 = a5;
  v10 = a3;
  -[NSMapTable setObject:forKey:](targetMediaProfile, "setObject:forKey:", a4, v10);
  v11 = -[_SSUSoundScapesDelegateForwarder initForViewController:]([_SSUSoundScapesDelegateForwarder alloc], "initForViewController:", v10);
  objc_msgSend(v11, "setDelegate:", v9);

  -[NSMapTable setObject:forKey:](self->_delegates, "setObject:forKey:", v11, v10);
}

+ (BOOL)pickerSupportHome:(id)a3 targetMediaProfileContainers:(id)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "residentDevices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

unint64_t __78__SSUSoundScapesPickerManager_pickerSupportHome_targetMediaProfileContainers___block_invoke(uint64_t a1, void *a2)
{
  return ((unint64_t)objc_msgSend(a2, "capabilities") >> 24) & 1;
}

+ (id)pickerIdentity
{
  if (pickerIdentity_onceToken != -1)
    dispatch_once(&pickerIdentity_onceToken, &__block_literal_global_95);
  return (id)pickerIdentity_identity;
}

void __45__SSUSoundScapesPickerManager_pickerIdentity__block_invoke()
{
  NSObject *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  _SSULoggingFacility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2478DF000, v0, OS_LOG_TYPE_INFO, "Start looking for picker", v5, 2u);
  }

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79E8]), "initWithExtensionPointIdentifier:", CFSTR("com.apple.SoundScapesViewServices.ViewService"));
  objc_msgSend(MEMORY[0x24BDC79F0], "executeQuery:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)pickerIdentity_identity;
  pickerIdentity_identity = v3;

}

+ (id)pickerForMediaProfileContainers:(id)a3 forDelegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "pickerIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _SSULoggingFacility();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    v38 = v7;
    v39 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2478DF000, v10, OS_LOG_TYPE_INFO, "Start loading picker", buf, 2u);
    }

    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDC7BB8]), "initWithExtensionIdentity:", v8);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC7BB0]), "initWithConfiguration:", v10);
    v12 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v13);

    v14 = (void *)MEMORY[0x24BDD1488];
    objc_msgSend(v8, "url");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleWithURL:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_opt_new();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ERROR"), 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v18);

    objc_msgSend(v17, "setTag:", 10001);
    objc_msgSend(v17, "setHidden:", 1);
    objc_msgSend(v17, "setTextAlignment:", 1);
    objc_msgSend(v12, "addSubview:", v17);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v12, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

    objc_msgSend(v12, "centerYAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setActive:", 1);

    objc_msgSend(v17, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeAreaLayoutGuide");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "leadingAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 20.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setActive:", 1);

    objc_msgSend(v12, "safeAreaLayoutGuide");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    objc_msgSend(v11, "setPlaceholderView:", v12);
    objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "view");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setBackgroundColor:", v33);

    +[SSUSoundScapesPickerManager sharedManager](SSUSoundScapesPickerManager, "sharedManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDelegate:", v35);
    v7 = v38;
    v6 = v39;
    objc_msgSend(v35, "registerViewController:forMediaProfiles:andDelegate:", v11, v39, v38);
    _SSULoggingFacility();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v11;
      _os_log_impl(&dword_2478DF000, v36, OS_LOG_TYPE_INFO, "Return picker: %@", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      +[SSUSoundScapesPickerManager pickerForMediaProfileContainers:forDelegate:].cold.1(v10);
    v11 = 0;
  }

  return v11;
}

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _SSULoggingFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2478DF000, v5, OS_LOG_TYPE_INFO, "Picker become active", buf, 2u);
  }

  -[NSMapTable objectForKey:](self->_targetMediaProfile, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_delegates, "objectForKey:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "anyObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hf_home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_map:", &__block_literal_global_108);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "residentDevices");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke_2;
  v27[3] = &unk_2518F25E0;
  v13 = v8;
  v28 = v13;
  objc_msgSend(v12, "na_map:", v27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _SSULoggingFacility();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v23;
    v31 = 2112;
    v32 = v14;
    _os_log_impl(&dword_2478DF000, v15, OS_LOG_TYPE_INFO, "Setup picker for target version %@, resident version %@", buf, 0x16u);
  }

  v26 = 0;
  objc_msgSend(v4, "makeXPCConnectionWithError:", &v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v26;
  if (v17)
  {
    _SSULoggingFacility();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      -[SSUSoundScapesPickerManager hostViewControllerDidActivate:].cold.1((uint64_t)v17, v18);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2576C8170);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRemoteObjectInterface:", v19);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2576C7690);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setExportedInterface:", v20);

    objc_msgSend(v16, "setExportedObject:", v22);
    objc_initWeak((id *)buf, self);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke_115;
    v24[3] = &unk_2518F2608;
    objc_copyWeak(&v25, (id *)buf);
    objc_msgSend(v16, "setInvalidationHandler:", v24);
    objc_msgSend(v22, "setConnection:", v16);
    objc_msgSend(v16, "resume");
    objc_msgSend(v16, "remoteObjectProxy");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setupDataSourceWithTargetDeviceVersions:andFallbackResidentDeviceVersions:", v23, v14);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }

}

id __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "hf_backingAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortVersionString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke_3;
  v10[3] = &unk_2518F25B8;
  v11 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "softwareVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shortVersionString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __61__SSUSoundScapesPickerManager_hostViewControllerDidActivate___block_invoke_115(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  _SSULoggingFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2478DF000, v2, OS_LOG_TYPE_INFO, "Picker connection invalidate", v3, 2u);
  }

}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  NSMapTable *delegates;
  id v6;
  id v7;

  delegates = self->_delegates;
  v6 = a3;
  -[NSMapTable objectForKey:](delegates, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pickerDismissed");
  -[NSMapTable removeObjectForKey:](self->_targetMediaProfile, "removeObjectForKey:", v6);
  -[NSMapTable removeObjectForKey:](self->_delegates, "removeObjectForKey:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_targetMediaProfile, 0);
}

+ (void)pickerForMediaProfileContainers:(os_log_t)log forDelegate:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2478DF000, log, OS_LOG_TYPE_FAULT, "No picker found to display", v1, 2u);
}

- (void)hostViewControllerDidActivate:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_2478DF000, a2, OS_LOG_TYPE_FAULT, "Failed to get picker connection: %@", (uint8_t *)&v2, 0xCu);
}

@end
