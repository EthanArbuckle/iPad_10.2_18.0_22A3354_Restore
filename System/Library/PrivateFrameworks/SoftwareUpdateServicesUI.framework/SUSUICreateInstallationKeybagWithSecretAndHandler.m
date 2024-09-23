@implementation SUSUICreateInstallationKeybagWithSecretAndHandler

void __SUSUICreateInstallationKeybagWithSecretAndHandler_block_invoke(_QWORD *a1)
{
  NSObject *v1;
  os_log_type_t v2;
  NSObject *v3;
  os_log_type_t v4;
  NSObject *v5;
  os_log_type_t v6;
  NSObject *log;
  os_log_type_t type;
  uint8_t v10[7];
  os_log_type_t v11;
  id v12;
  uint8_t v13[7];
  os_log_type_t v14;
  id v15;
  uint8_t v16[15];
  os_log_type_t v17;
  id v18;
  id v19;
  uint8_t v20[7];
  os_log_type_t v21;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  if (!a1[4] && a1[5])
  {
    location[0] = SUSUILog();
    v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = location[0];
      type = v21;
      __os_log_helper_16_0_0(v20);
      _os_log_impl(&dword_218F45000, log, type, "No secret provided", v20, 2u);
    }
    objc_storeStrong(location, 0);
    (*(void (**)(void))(a1[5] + 16))();
  }
  v19 = objc_alloc_init(SUSUIControllerClient);
  if (v19)
  {
    if ((objc_msgSend(v19, "createKeybagWithSecret:", a1[4]) & 1) != 0)
    {
      v18 = SUSUILog();
      v17 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_DEFAULT))
      {
        v5 = v18;
        v6 = v17;
        __os_log_helper_16_0_0(v16);
        _os_log_impl(&dword_218F45000, v5, v6, "Successfully created keybag", v16, 2u);
      }
      objc_storeStrong(&v18, 0);
      if (a1[5])
        (*(void (**)(void))(a1[5] + 16))();
    }
    else
    {
      v15 = SUSUILog();
      v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
      {
        v3 = v15;
        v4 = v14;
        __os_log_helper_16_0_0(v13);
        _os_log_impl(&dword_218F45000, v3, v4, "Failed to create keybag", v13, 2u);
      }
      objc_storeStrong(&v15, 0);
      if (a1[5])
        (*(void (**)(void))(a1[5] + 16))();
    }
  }
  else
  {
    v12 = SUSUILog();
    v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      v1 = v12;
      v2 = v11;
      __os_log_helper_16_0_0(v10);
      _os_log_impl(&dword_218F45000, v1, v2, "Failed to create SUSUIControllerClient", v10, 2u);
    }
    objc_storeStrong(&v12, 0);
    if (a1[5])
      (*(void (**)(void))(a1[5] + 16))();
  }
  objc_storeStrong(&v19, 0);
}

@end
