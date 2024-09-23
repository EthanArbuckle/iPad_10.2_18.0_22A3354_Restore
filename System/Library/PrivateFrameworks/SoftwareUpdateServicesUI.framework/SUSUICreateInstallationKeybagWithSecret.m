@implementation SUSUICreateInstallationKeybagWithSecret

void __SUSUICreateInstallationKeybagWithSecret_block_invoke(_QWORD *a1)
{
  NSObject *v1;
  os_log_type_t v2;
  NSObject *v3;
  os_log_type_t v4;
  NSObject *log;
  os_log_type_t type;
  uint8_t v8[7];
  os_log_type_t v9;
  id v10;
  uint8_t v11[15];
  os_log_type_t v12;
  id v13;
  id v14;
  uint8_t v15[7];
  os_log_type_t v16;
  id location[3];

  location[2] = a1;
  location[1] = a1;
  if (a1[4])
  {
    v14 = objc_alloc_init(SUSUIControllerClient);
    if (v14)
    {
      if ((objc_msgSend(v14, "createKeybagWithSecret:", a1[4]) & 1) != 0)
      {
        v13 = SUSUILog();
        v12 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
        {
          v3 = v13;
          v4 = v12;
          __os_log_helper_16_0_0(v11);
          _os_log_impl(&dword_218F45000, v3, v4, "Successfully created keybag", v11, 2u);
        }
        objc_storeStrong(&v13, 0);
      }
      else
      {
        v10 = SUSUILog();
        v9 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
        {
          v1 = v10;
          v2 = v9;
          __os_log_helper_16_0_0(v8);
          _os_log_impl(&dword_218F45000, v1, v2, "Failed to create keybag", v8, 2u);
        }
        objc_storeStrong(&v10, 0);
      }
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    location[0] = SUSUILog();
    v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = location[0];
      type = v16;
      __os_log_helper_16_0_0(v15);
      _os_log_impl(&dword_218F45000, log, type, "No secret provided", v15, 2u);
    }
    objc_storeStrong(location, 0);
  }
}

@end
