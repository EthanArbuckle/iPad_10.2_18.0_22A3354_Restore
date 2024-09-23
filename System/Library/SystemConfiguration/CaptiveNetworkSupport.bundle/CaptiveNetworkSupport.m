uint64_t NotifyCFCallback(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t result;

  if (a2 && a3 >= 0x18)
  {
    v4 = (uint64_t *)(a4 + 8);
    while (1)
    {
      v4 = (uint64_t *)*v4;
      if (!v4)
        break;
      if (*(_DWORD *)(a2 + 20) == *((_DWORD *)v4 + 8))
        return ((uint64_t (*)(uint64_t, uint64_t *))v4[2])(v4[3], v4);
    }
  }
  return result;
}

void UIAllowedNetworkingAppNotify(uint64_t a1, uint64_t a2)
{
  _BOOL4 v2;

  if (S_wifi_suppressed)
    v2 = 0;
  else
    v2 = (S_networking_app_in_foreground | S_wifi_settings_in_foreground) != 0;
  UIAllowedNetworkingAppCheck(a2);
  UIAllowedInvokeCallback(v2);
}

void UIAllowedNetworkingAppCheck(uint64_t a1)
{
  int v1;
  NSObject *logger;
  os_log_type_t v3;
  const char *v4;
  uint64_t v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  if (a1 && NotifyGet(a1, &v5))
    v1 = v5 & 1;
  else
    v1 = 0;
  if (S_networking_app_in_foreground != v1)
  {
    S_networking_app_in_foreground = v1;
    logger = mysyslog_get_logger();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      v4 = "";
      if (!S_networking_app_in_foreground)
        v4 = "not ";
      *(_DWORD *)buf = 136315394;
      v7 = "UIAllowedNetworkingAppCheck";
      v8 = 2080;
      v9 = v4;
      _os_log_impl(&dword_219EF1000, logger, v3, "%s: Networking App %sin foreground", buf, 0x16u);
    }
  }
}

BOOL NotifyGet(uint64_t a1, uint64_t *a2)
{
  return notify_get_state(*(_DWORD *)(a1 + 32), a2) == 0;
}

void UIAllowedInvokeCallback(int a1)
{
  _BOOL8 v1;
  NSObject *logger;
  os_log_type_t v3;
  const char *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (S_wifi_suppressed)
  {
    if ((a1 & 1) == 0)
      return;
    v1 = 0;
  }
  else
  {
    v1 = (S_networking_app_in_foreground | S_wifi_settings_in_foreground) != 0;
    if (v1 == a1)
      return;
  }
  logger = mysyslog_get_logger();
  v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    v4 = "false";
    if (v1)
      v4 = "true";
    v5 = 136315138;
    v6 = v4;
    _os_log_impl(&dword_219EF1000, logger, v3, "uiallowed: %s", (uint8_t *)&v5, 0xCu);
  }
  if (S_callback)
    S_callback(v1);
}

os_log_t mysyslog_get_logger()
{
  os_log_t result;

  result = (os_log_t)S_captive_logger;
  if (!S_captive_logger)
  {
    result = os_log_create("com.apple.captive", "Framework");
    S_captive_logger = (uint64_t)result;
  }
  return result;
}

void CaptiveHandleUIAllowedChange(int a1)
{
  uint64_t i;

  if (a1)
  {
    for (i = S_stateHeadStorage; i; i = *(_QWORD *)i)
    {
      if (*(_BYTE *)(i + 252))
        CaptiveInteract(i);
    }
  }
}

void *CopySIMStatus()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  os_log_type_t v9;
  id v11;
  uint8_t buf[4];
  NSObject *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x22073669C]();
  v1 = objc_alloc_init(MEMORY[0x24BDC2818]);
  v2 = v1;
  if (!v1)
  {
    mysyslog_get_logger();
    v6 = objc_claimAutoreleasedReturnValue();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v6, v9))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v6, v9, "failed to get the CoreTelephonyClient instance", buf, 2u);
    }
    goto LABEL_9;
  }
  GetUserPreferredSubscriptionContext(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v11 = 0;
    objc_msgSend(v2, "getSIMStatus:error:", v3, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (!v5)
    {
      v6 = v4;

      v3 = v6;
      goto LABEL_10;
    }
    v6 = v5;
    mysyslog_get_logger();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_219EF1000, v7, v8, "getSIMStatus failed with error: %@", buf, 0xCu);
    }

LABEL_9:
    v3 = 0;
LABEL_10:

  }
  objc_autoreleasePoolPop(v0);
  return v3;
}

id GetUserPreferredSubscriptionContext(void *a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  id v9;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  os_log_type_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  objc_msgSend(a1, "getSubscriptionInfoWithError:", &v27);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v27;
  if (v2)
  {
    mysyslog_get_logger();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v3, v4))
    {
LABEL_5:
      v9 = 0;
      goto LABEL_6;
    }
    *(_DWORD *)buf = 138412290;
    v30 = v2;
    v5 = "CoreTelephonyClient.getSubscriptionInfoWithError failed with error: %@";
    v6 = v3;
    v7 = v4;
    v8 = 12;
LABEL_4:
    _os_log_impl(&dword_219EF1000, v6, v7, v5, buf, v8);
    goto LABEL_5;
  }
  if (!v1)
  {
    objc_msgSend(0, "subscriptions");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18
      || (v19 = (void *)v18,
          objc_msgSend(0, "subscriptions"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "count"),
          v20,
          v19,
          !v21))
    {
      mysyslog_get_logger();
      v3 = objc_claimAutoreleasedReturnValue();
      v22 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v3, v22))
        goto LABEL_5;
      *(_WORD *)buf = 0;
      v5 = "failed to get the subscription contexts";
      v6 = v3;
      v7 = v22;
      v8 = 2;
      goto LABEL_4;
    }
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v1, "subscriptions", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v9 = (id)-[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v9)
  {
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v3);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (v13)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "userDataPreferred");
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)v14;
            objc_msgSend(v13, "userDataPreferred");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "BOOLValue");

            if (v17)
            {
              v9 = v13;
              goto LABEL_6;
            }
          }
        }
      }
      v9 = (id)-[NSObject countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_6:

  return v9;
}

uint64_t CopyPhoneNumber()
{
  void *v0;
  id v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t v8[16];

  v0 = (void *)MEMORY[0x22073669C]();
  v1 = objc_alloc_init(MEMORY[0x24BDC2818]);
  v2 = v1;
  if (v1)
  {
    GetUserPreferredSubscriptionContext(v1);
    v3 = objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v5 = 0;
      goto LABEL_9;
    }
    v4 = v3;
    -[NSObject phoneNumber](v3, "phoneNumber");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    mysyslog_get_logger();
    v4 = objc_claimAutoreleasedReturnValue();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v4, v6))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_219EF1000, v4, v6, "failed to get the CoreTelephonyClient instance", v8, 2u);
    }
    v5 = 0;
  }

LABEL_9:
  objc_autoreleasePoolPop(v0);
  return v5;
}

id CopyRATSelection()
{
  void *v0;
  id v1;
  void *v2;
  NSObject *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  os_log_type_t v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint8_t buf[16];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v0 = (void *)MEMORY[0x22073669C]();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v1 = objc_alloc_init(MEMORY[0x24BDC2818]);
  v2 = v1;
  if (!v1)
  {
    mysyslog_get_logger();
    v3 = objc_claimAutoreleasedReturnValue();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v3, v10, "failed to get the CoreTelephonyClient instance", buf, 2u);
    }
    v9 = 0;
    goto LABEL_13;
  }
  GetUserPreferredSubscriptionContext(v1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = dispatch_semaphore_create(0);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __CopyRATSelection_block_invoke;
    v12[3] = &unk_24DC16580;
    v14 = &v16;
    v5 = v4;
    v13 = v5;
    objc_msgSend(v2, "getRatSelection:completion:", v3, v12);
    v6 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      mysyslog_get_logger();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219EF1000, v7, v8, "timed out while waiting for getting RAT selection", buf, 2u);
      }

      v9 = 0;
    }
    else
    {
      v9 = (id)v17[5];
    }

LABEL_13:
    goto LABEL_14;
  }
  v9 = 0;
LABEL_14:

  _Block_object_dispose(&v16, 8);
  objc_autoreleasePoolPop(v0);
  return v9;
}

void sub_219EF31CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

id CopyMobileEquipmentInfo()
{
  void *v0;
  id v1;
  void *v2;
  NSObject *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  os_log_type_t v8;
  id v9;
  id v10;
  os_log_type_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  NSObject *v28;
  uint64_t *v29;
  uint8_t buf[16];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x22073669C]();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  v1 = objc_alloc_init(MEMORY[0x24BDC2818]);
  v2 = v1;
  if (!v1)
  {
    mysyslog_get_logger();
    v3 = objc_claimAutoreleasedReturnValue();
    v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v3, v11, "failed to get the CoreTelephonyClient instance", buf, 2u);
    }
    goto LABEL_10;
  }
  GetUserPreferredSubscriptionContext(v1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = dispatch_semaphore_create(0);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __CopyMobileEquipmentInfo_block_invoke;
    v27[3] = &unk_24DC165A8;
    v29 = &v31;
    v5 = v4;
    v28 = v5;
    objc_msgSend(v2, "copyMobileEquipmentInfo:", v27);
    v6 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v5, v6))
    {
      mysyslog_get_logger();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v7, v8))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219EF1000, v7, v8, "timed out while waiting for copying mobile equipment info list", buf, 2u);
      }
      v9 = 0;
      v10 = 0;
LABEL_7:

      goto LABEL_24;
    }
    v12 = (void *)v32[5];
    if (!v12 || !objc_msgSend(v12, "count"))
    {
      v9 = 0;
      v10 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v13 = (id)v32[5];
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v24;
LABEL_16:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v16);
        v18 = objc_msgSend(v17, "slotId", (_QWORD)v23);
        if (v18 == -[NSObject slotID](v3, "slotID"))
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
          if (v14)
            goto LABEL_16;
          goto LABEL_22;
        }
      }
      v10 = v17;

      if (!v10)
        goto LABEL_32;
      v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v10, "MEID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        objc_msgSend(v10, "MEID");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BDC2AB0]);

      }
      objc_msgSend(v10, "EUIMID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v10, "EUIMID");
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BDC2AA8]);
        goto LABEL_7;
      }
      goto LABEL_24;
    }
LABEL_22:

LABEL_32:
LABEL_10:
    v9 = 0;
    v10 = 0;
LABEL_25:

    goto LABEL_26;
  }
  v9 = 0;
  v10 = 0;
LABEL_26:

  _Block_object_dispose(&v31, 8);
  objc_autoreleasePoolPop(v0);
  return v9;
}

void sub_219EF36D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CopyCarrierAccountSettings(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  NSObject *v8;
  os_log_type_t v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t v13[16];
  _QWORD v14[6];
  uint8_t buf[8];
  uint8_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  dispatch_semaphore_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v2 = (void *)MEMORY[0x22073669C]();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v3 = objc_alloc_init(MEMORY[0x24BDC2818]);
  v4 = v3;
  if (!v3)
  {
    mysyslog_get_logger();
    v5 = objc_claimAutoreleasedReturnValue();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v10))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v5, v10, "failed to get the CoreTelephonyClient instance", buf, 2u);
    }
    goto LABEL_10;
  }
  GetUserPreferredSubscriptionContext(v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_13:
    v11 = v22[3];
    goto LABEL_14;
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC26F8]), "initWithBundleType:", 1);
  if (!v6)
  {
LABEL_12:

    goto LABEL_13;
  }
  *(_QWORD *)buf = 0;
  v16 = buf;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __CopyCarrierAccountSettings_block_invoke;
  v14[3] = &unk_24DC165D0;
  v14[4] = &v21;
  v14[5] = buf;
  objc_msgSend(v4, "copyCarrierBundleValue:key:bundleType:completion:", v5, a1, v6, v14);
  v7 = dispatch_time(0, 5000000000);
  if (!dispatch_semaphore_wait(*((dispatch_semaphore_t *)v16 + 5), v7))
  {
    _Block_object_dispose(buf, 8);

    goto LABEL_12;
  }
  mysyslog_get_logger();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v8, v9))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_219EF1000, v8, v9, "timed out while waiting for copying carrier settings", v13, 2u);
  }

  _Block_object_dispose(buf, 8);
LABEL_10:
  v11 = 0;
LABEL_14:

  _Block_object_dispose(&v21, 8);
  objc_autoreleasePoolPop(v2);
  return v11;
}

void sub_219EF3A58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

CarrierSettingsStatusIndicator *_CBAccessConnectionCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  CarrierSettingsStatusIndicator *v7;

  v6 = (void *)MEMORY[0x22073669C]();
  v7 = objc_alloc_init(CarrierSettingsStatusIndicator);
  -[CarrierSettingsStatusIndicator createConnection](v7, "createConnection");
  -[CarrierSettingsStatusIndicator setCallback:](v7, "setCallback:", a1);
  -[CarrierSettingsStatusIndicator setRunloop:](v7, "setRunloop:", a2);
  -[CarrierSettingsStatusIndicator setRunloopMode:](v7, "setRunloopMode:", a3);
  objc_autoreleasePoolPop(v6);
  return v7;
}

void CaptiveAnalyticsSessionPostNonCaptiveEvent(unsigned int *a1)
{
  int v2;
  NSObject *logger;
  os_log_type_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  int v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = analytics_send_event_lazy();
  logger = mysyslog_get_logger();
  v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v4))
  {
    v5 = "Event Post Failed";
    if (v2)
      v5 = "Event Posted";
    v6 = *a1;
    if (v6 > 4)
      v7 = "<unknown>";
    else
      v7 = CaptiveWiFiSecurityTypeGetString_names[v6];
    v8 = "true";
    v9 = *((unsigned __int8 *)a1 + 4);
    *(_DWORD *)buf = 136315906;
    if (!v9)
      v8 = "false";
    v11 = "com.apple.captive.session.non-captive";
    v12 = 2080;
    v13 = v5;
    v14 = 2080;
    v15 = v7;
    v16 = 2080;
    v17 = v8;
    _os_log_impl(&dword_219EF1000, logger, v4, "%s %s \n \t    { \n \t\tWi-Fi Security Type: %s \n \t\tCaptive Bypass: %s \n \t    }", buf, 0x2Au);
  }
}

void CaptiveAnalyticsSessionPostBuiltinEvent(uint64_t *a1)
{
  int v2;
  NSObject *logger;
  os_log_type_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = analytics_send_event_lazy();
  logger = mysyslog_get_logger();
  v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v4))
  {
    v5 = "Event Post Failed";
    if (v2)
      v5 = "Event Posted";
    v6 = *((unsigned int *)a1 + 2);
    if (v6 > 3)
      v7 = "<unknown>";
    else
      v7 = CaptiveDetectionTypeGetString_names[v6];
    v8 = *a1;
    v9 = a1[2];
    v10 = "false";
    if (*((_BYTE *)a1 + 24))
      v10 = "true";
    v12 = a1[4];
    v11 = a1[5];
    v13 = *((unsigned int *)a1 + 12);
    if (v13 > 4)
      v14 = "<unknown>";
    else
      v14 = CaptiveWiFiSecurityTypeGetString_names[v13];
    *(_DWORD *)buf = 136317186;
    v16 = "com.apple.captive.session.builtin";
    v17 = 2080;
    v18 = v5;
    v19 = 2080;
    v20 = v7;
    v21 = 2048;
    v22 = v8;
    v23 = 2048;
    v24 = v9;
    v25 = 2080;
    v26 = v10;
    v27 = 2048;
    v28 = v12;
    v29 = 2048;
    v30 = v11;
    v31 = 2080;
    v32 = v14;
    _os_log_impl(&dword_219EF1000, logger, v4, "%s %s \n \t    {\t\n \t\tDetection type: %s, \n \t\tTotal Duration %qu seconds \n \t\tMaintenance Interval: %qu, \n \t\tAuto Login Used: %s \n \t\tCorrect Passive Detection Count: %lld, \n \t\tIncorrect Passive Detection Count: %lld, \n \t\tWi-Fi Security Type: %s \n \t    }", buf, 0x5Cu);
  }
}

void CaptiveAnalyticsSessionPostHSHelperEvent(uint64_t *a1)
{
  int v2;
  NSObject *logger;
  os_log_type_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = analytics_send_event_lazy();
  logger = mysyslog_get_logger();
  v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v4))
  {
    v5 = "Event Post Failed";
    v6 = *a1;
    v7 = a1[1];
    v8 = *((unsigned __int8 *)a1 + 16);
    if (v2)
      v5 = "Event Posted";
    *(_DWORD *)buf = 136316162;
    v9 = "false";
    v11 = "com.apple.captive.session.hotspot-helper";
    v12 = 2080;
    if (v8)
      v9 = "true";
    v13 = v5;
    v14 = 2048;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    v18 = 2080;
    v19 = v9;
    _os_log_impl(&dword_219EF1000, logger, v4, "%s %s \n \t    { \n \t\tTotal Duration %qu seconds \n \t\tBundle Identifier: %@, \n \t\tInternet Access: %s \n \t    }", buf, 0x34u);
  }
}

void CaptiveAnalyticsSessionPostIncompleteEvent(unsigned int a1)
{
  int v2;
  NSObject *logger;
  os_log_type_t v4;
  const char *v5;
  const char *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = analytics_send_event_lazy();
  logger = mysyslog_get_logger();
  v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v4))
  {
    v5 = "Event Post Failed";
    if (v2)
      v5 = "Event Posted";
    if (a1 > 4)
      v6 = "<unknown>";
    else
      v6 = CaptiveIncompleteReasonGetString_names[a1];
    *(_DWORD *)buf = 136315650;
    v8 = "com.apple.captive.session.incomplete";
    v9 = 2080;
    v10 = v5;
    v11 = 2080;
    v12 = v6;
    _os_log_impl(&dword_219EF1000, logger, v4, "%s %s \n \t    { \n \t\tReason: %s, \n \t    }", buf, 0x20u);
  }
}

void CaptiveAnalyticsSessionPostInconclusiveEvent(uint64_t a1)
{
  int v2;
  NSObject *logger;
  os_log_type_t v4;
  const char *v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = analytics_send_event_lazy();
  logger = mysyslog_get_logger();
  v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v4))
  {
    v5 = "Event Post Failed";
    *(_DWORD *)buf = 136315650;
    v7 = "com.apple.captive.session.inconclusive";
    if (v2)
      v5 = "Event Posted";
    v8 = 2080;
    v9 = v5;
    v10 = 2048;
    v11 = a1;
    _os_log_impl(&dword_219EF1000, logger, v4, "%s %s \n \t    { \n \t\terror Code: %qu \n \t    }", buf, 0x20u);
  }
}

_QWORD *captive_agent_send_probe(const void *a1, const __CFString *a2, int a3, const __CFString *a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _OWORD *v15;
  _QWORD *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  const __CFString *Value;
  const __CFString *v20;
  CFTypeID v21;
  const __CFString *v22;
  NSObject *logger;
  os_log_type_t v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  CFTypeID v29;
  const __CFDictionary *v30;
  const __CFDictionary *v31;
  CFTypeID v32;
  const __CFDictionary *v33;
  const __CFDictionary *v34;
  CFTypeID v35;
  const __CFString *v36;
  const __CFString *v37;
  CFTypeID v38;
  const __CFString *v39;
  NSObject *v40;
  os_log_type_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  xpc_object_t v47;
  void *v48;
  const __CFAllocator *v49;
  void *v50;
  const __CFString *v52;
  CFStringRef v53;
  const __CFString *v54;
  const __CFString *v55;
  CFTypeID v56;
  _QWORD block[6];
  uint8_t buf[4];
  const __CFString *v60;
  __int16 v61;
  const __CFString *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v15 = malloc_type_malloc(0x38uLL, 0x10A0040D4AB39ECuLL);
  v16 = v15;
  if (!v15)
    return v16;
  *((_QWORD *)v15 + 6) = 0;
  v15[1] = 0u;
  v15[2] = 0u;
  *v15 = 0u;
  create_connection((uint64_t)v15);
  v16[4] = a6;
  *v16 = a8;
  v16[1] = a7;
  *((_DWORD *)v16 + 7) = 0;
  v17 = (const __CFDictionary *)CaptiveCopyProbeSettings();
  v18 = v17;
  if (v17)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v17, CFSTR("ProbeURL"));
    if (Value)
    {
      v20 = Value;
      v21 = CFGetTypeID(Value);
      if (v21 == CFStringGetTypeID())
        v22 = v20;
      else
        v22 = 0;
    }
    else
    {
      v22 = 0;
    }
    v27 = (const __CFString *)CFDictionaryGetValue(v18, CFSTR("UserAgent"));
    v26 = CFSTR("wispr");
    if (v27)
    {
      v28 = v27;
      v29 = CFGetTypeID(v27);
      if (v29 == CFStringGetTypeID())
        v26 = v28;
    }
    if (a1
      && (v30 = (const __CFDictionary *)CFDictionaryGetValue(v18, CFSTR("SSIDExceptions"))) != 0
      && (v31 = v30, v32 = CFGetTypeID(v30), v32 == CFDictionaryGetTypeID())
      && (v33 = (const __CFDictionary *)CFDictionaryGetValue(v31, a1)) != 0
      && (v34 = v33, v35 = CFGetTypeID(v33), v35 == CFDictionaryGetTypeID()))
    {
      v36 = (const __CFString *)CFDictionaryGetValue(v34, CFSTR("ProbeURL"));
      if (v36)
      {
        v37 = v36;
        v38 = CFGetTypeID(v36);
        if (v38 == CFStringGetTypeID())
          v25 = v37;
        else
          v25 = 0;
      }
      else
      {
        v25 = 0;
      }
      v54 = (const __CFString *)CFDictionaryGetValue(v34, CFSTR("UserAgent"));
      if (v54)
      {
        v55 = v54;
        v56 = CFGetTypeID(v54);
        if (v56 == CFStringGetTypeID())
          v26 = v55;
      }
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    logger = mysyslog_get_logger();
    v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v24))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, logger, v24, "Unable to open settings file, using default values", buf, 2u);
    }
    v25 = 0;
    v22 = 0;
    v26 = CFSTR("wispr");
  }
  if (a4)
  {
    CFRetain(a4);
    if (!a3)
      goto LABEL_58;
LABEL_29:
    v39 = CFSTR("NetworkCTS");
    goto LABEL_30;
  }
  if (a3)
  {
    a4 = CFSTR("http://netcts.cdn-apple.com");
    CFRetain(CFSTR("http://netcts.cdn-apple.com"));
    goto LABEL_29;
  }
  v52 = CFSTR("http://captive.apple.com/hotspot-detect.html");
  if (v22)
    v52 = v22;
  if (v25)
    a4 = v25;
  else
    a4 = v52;
  CFRetain(a4);
LABEL_58:
  v53 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%s %@"), "CaptiveNetworkSupport-480", v26);
  if (!v53)
  {
    v39 = CFSTR("CaptiveNetworkSupport-??? wispr");
LABEL_30:
    CFRetain(v39);
    if (!v18)
      goto LABEL_32;
    goto LABEL_31;
  }
  v39 = v53;
  if (v18)
LABEL_31:
    CFRelease(v18);
LABEL_32:
  v40 = mysyslog_get_logger();
  v41 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v40, v41))
  {
    *(_DWORD *)buf = 138412546;
    v60 = v39;
    v61 = 2112;
    v62 = a4;
    _os_log_impl(&dword_219EF1000, v40, v41, "user-agent:\"%@\" url:\"%@\"", buf, 0x16u);
  }
  v42 = (char *)copy_cstring(a2);
  if (v42)
  {
    v43 = v42;
    v44 = (char *)copy_cstring(a4);
    if (v44)
    {
      v45 = v44;
      v46 = (char *)copy_cstring(v39);
      if (v46)
      {
        v47 = xpc_dictionary_create(0, 0, 0);
        v48 = v47;
        if (v47)
        {
          xpc_dictionary_set_uint64(v47, "MessageType", 0);
          xpc_dictionary_set_string(v48, "ProbeURL", v45);
          xpc_dictionary_set_string(v48, "InterfaceName", v43);
          xpc_dictionary_set_string(v48, "UserAgent", v46);
          xpc_dictionary_set_uint64(v48, "ProbeTimeout", a5);
        }
      }
      else
      {
        v48 = 0;
      }
      v49 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x24BDBD240], v43);
      CFAllocatorDeallocate(v49, v45);
      if (v46)
        CFAllocatorDeallocate(v49, v46);
      goto LABEL_44;
    }
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x24BDBD240], v43);
  }
  v48 = 0;
LABEL_44:
  CFRelease(a4);
  if (v39)
    CFRelease(v39);
  if (v48)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = __captive_agent_send_probe_block_invoke;
    block[3] = &__block_descriptor_tmp_0;
    block[4] = v16;
    block[5] = v48;
    dispatch_sync((dispatch_queue_t)g_queue, block);
    xpc_release(v48);
  }
  else
  {
    v50 = (void *)v16[2];
    if (v50)
      xpc_release(v50);
    free(v16);
    return 0;
  }
  return v16;
}

void create_connection(uint64_t a1)
{
  _xpc_connection_s *mach_service;
  uint64_t v3;
  _QWORD handler[5];

  if (create_connection_client_init != -1)
    dispatch_once(&create_connection_client_init, &__block_literal_global);
  mach_service = xpc_connection_create_mach_service("com.apple.captiveagent", (dispatch_queue_t)g_queue, 2uLL);
  v3 = MEMORY[0x24BDAC760];
  *(_QWORD *)(a1 + 16) = mach_service;
  handler[0] = v3;
  handler[1] = 0x40000000;
  handler[2] = __create_connection_block_invoke_2;
  handler[3] = &__block_descriptor_tmp_71;
  handler[4] = a1;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(*(xpc_connection_t *)(a1 + 16));
}

void __captive_agent_send_probe_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = g_connections;
  *(_QWORD *)(v1 + 40) = g_connections;
  if (v2)
    *(_QWORD *)(v2 + 48) = v1 + 40;
  g_connections = v1;
  *(_QWORD *)(v1 + 48) = &g_connections;
  send_message(*(void **)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void send_message(void *a1, uint64_t a2)
{
  _xpc_connection_s *v4;
  _QWORD handler[5];

  if (CaptiveIsDebug())
    xpc_dictionary_set_BOOL(a1, "EnableDebug", 1);
  v4 = *(_xpc_connection_s **)(a2 + 16);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 0x40000000;
  handler[2] = __send_message_block_invoke;
  handler[3] = &__block_descriptor_tmp_79;
  handler[4] = a2;
  xpc_connection_send_message_with_reply(v4, a1, (dispatch_queue_t)g_queue, handler);
}

void captive_agent_abort_probe(_QWORD *a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __captive_agent_abort_probe_block_invoke;
  block[3] = &__block_descriptor_tmp_1;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  *a1 = 0;
}

void __captive_agent_abort_probe_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = **(_QWORD **)(a1 + 32);
  v2 = g_connections;
  if (v1)
    v3 = g_connections == 0;
  else
    v3 = 1;
  if (!v3)
  {
    while (v2 != v1)
    {
      v2 = *(_QWORD *)(v2 + 40);
      if (!v2)
        return;
    }
    *(_BYTE *)(v1 + 24) = 1;
    xpc_connection_cancel(*(xpc_connection_t *)(v1 + 16));
  }
}

_BYTE *captive_agent_login(const __CFDictionary *a1, const __CFString *a2, const __CFDictionary *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _OWORD *v12;
  _BYTE *v13;
  const __CFString *Value;
  const __CFString *v15;
  __CFDictionary *MutableCopy;
  __CFDictionary *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  BOOL v20;
  int v21;
  NSObject *logger;
  os_log_type_t v23;
  const char *v24;
  const char *v25;
  const char *v26;
  void *v27;
  CFMutableStringRef Mutable;
  const __CFString *v30;
  const __CFAllocator *v31;
  const __CFData *ExternalRepresentation;
  size_t Length;
  UInt8 *v34;
  char *v35;
  char *v36;
  char *v37;
  xpc_object_t v38;
  void *v39;
  size_t v40;
  NSObject *v41;
  os_log_type_t v42;
  NSObject *v43;
  os_log_type_t v44;
  void *v45;
  _QWORD v46[6];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  uint64_t v53;
  CFRange v54;

  v53 = *MEMORY[0x24BDAC8D0];
  v12 = malloc_type_malloc(0x38uLL, 0x10A0040D4AB39ECuLL);
  v13 = v12;
  if (!v12)
    return v13;
  *((_QWORD *)v12 + 6) = 0;
  v12[1] = 0u;
  v12[2] = 0u;
  *v12 = 0u;
  create_connection((uint64_t)v12);
  v13[24] = 0;
  *((_QWORD *)v13 + 4) = a5;
  *((_DWORD *)v13 + 7) = 1;
  *(_QWORD *)v13 = a4;
  *((_QWORD *)v13 + 1) = a6;
  Value = (const __CFString *)CFDictionaryGetValue(a1, kWISPrLoginURL[0]);
  v15 = (const __CFString *)CFDictionaryGetValue(a1, kUserAgent[0]);
  if (!a3 || (MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a3)) == 0)
  {
    v17 = 0;
    v18 = Value == 0;
    v19 = v15 == 0;
    v21 = 1;
LABEL_11:
    logger = mysyslog_get_logger();
    v23 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v23))
    {
      v24 = "";
      v25 = " url";
      if (!v18)
        v25 = "";
      v26 = " agent";
      if (!v19)
        v26 = "";
      *(_DWORD *)buf = 136315650;
      v48 = v25;
      v49 = 2080;
      v50 = v26;
      if (v21)
        v24 = " POST variables";
      v51 = 2080;
      v52 = v24;
      _os_log_impl(&dword_219EF1000, logger, v23, "wispr dictionary does not contain%s%s%s", buf, 0x20u);
    }
    if ((v21 & 1) != 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  v17 = MutableCopy;
  CFDictionaryAddValue(MutableCopy, CFSTR("OriginatingServer"), CFSTR("http://www.apple.com/"));
  CFDictionaryAddValue(v17, CFSTR("button"), CFSTR("Login"));
  CFDictionaryAddValue(v17, CFSTR("FNAME"), CFSTR("0"));
  v18 = Value == 0;
  v19 = v15 == 0;
  if (Value)
    v20 = v15 == 0;
  else
    v20 = 1;
  if (v20)
  {
    v21 = 0;
    goto LABEL_11;
  }
  Mutable = CFStringCreateMutable(0, 0);
  if (Mutable)
  {
    v30 = Mutable;
    CFDictionaryApplyFunction(v17, (CFDictionaryApplierFunction)add_post_variable, Mutable);
    v31 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], v30, 0x8000100u, 0);
    CFRelease(v30);
    if (ExternalRepresentation)
    {
      Length = CFDataGetLength(ExternalRepresentation);
      v34 = (UInt8 *)malloc_type_malloc(Length, 0xF45CFB6BuLL);
      if (v34)
      {
        v54.length = CFDataGetLength(ExternalRepresentation);
        v54.location = 0;
        CFDataGetBytes(ExternalRepresentation, v54, v34);
        v35 = (char *)copy_cstring(a2);
        if (v35)
        {
          v36 = (char *)copy_cstring(Value);
          if (v36)
          {
            v37 = (char *)copy_cstring(v15);
            if (v37)
            {
              v38 = xpc_dictionary_create(0, 0, 0);
              if (v38)
              {
                v39 = v38;
                xpc_dictionary_set_uint64(v38, "MessageType", 2uLL);
                xpc_dictionary_set_string(v39, "LoginURL", v36);
                xpc_dictionary_set_string(v39, "InterfaceName", v35);
                xpc_dictionary_set_string(v39, "UserAgent", v37);
                v40 = CFDataGetLength(ExternalRepresentation);
                xpc_dictionary_set_data(v39, "LoginBody", v34, v40);
                CFRelease(v17);
                CFRelease(ExternalRepresentation);
LABEL_41:
                free(v34);
                v45 = v39;
LABEL_42:
                if (v35)
                  CFAllocatorDeallocate(v31, v35);
                if (v36)
                  CFAllocatorDeallocate(v31, v36);
                if (v37)
                  CFAllocatorDeallocate(v31, v37);
                if (v45)
                {
                  v46[0] = MEMORY[0x24BDAC760];
                  v46[1] = 0x40000000;
                  v46[2] = __captive_agent_login_block_invoke;
                  v46[3] = &__block_descriptor_tmp_2;
                  v46[4] = v13;
                  v46[5] = v45;
                  dispatch_sync((dispatch_queue_t)g_queue, v46);
                  xpc_release(v45);
                  return v13;
                }
                goto LABEL_21;
              }
            }
LABEL_40:
            CFRelease(v17);
            CFRelease(ExternalRepresentation);
            v39 = 0;
            v45 = 0;
            if (!v34)
              goto LABEL_42;
            goto LABEL_41;
          }
LABEL_39:
          v37 = 0;
          goto LABEL_40;
        }
      }
      else
      {
        v35 = 0;
      }
      v36 = 0;
      goto LABEL_39;
    }
  }
  else
  {
    v41 = mysyslog_get_logger();
    v42 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v41, v42))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v41, v42, "CFStringCreateMutable failed", buf, 2u);
    }
  }
  v43 = mysyslog_get_logger();
  v44 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v43, v44))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219EF1000, v43, v44, "create_login_body() failed", buf, 2u);
  }
LABEL_20:
  CFRelease(v17);
LABEL_21:
  v27 = (void *)*((_QWORD *)v13 + 2);
  if (v27)
    xpc_release(v27);
  free(v13);
  return 0;
}

void __captive_agent_login_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = g_connections;
  *(_QWORD *)(v1 + 40) = g_connections;
  if (v2)
    *(_QWORD *)(v2 + 48) = v1 + 40;
  g_connections = v1;
  *(_QWORD *)(v1 + 48) = &g_connections;
  send_message(*(void **)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void captive_agent_abort_login(_QWORD *a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __captive_agent_abort_login_block_invoke;
  block[3] = &__block_descriptor_tmp_3;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  *a1 = 0;
}

void __captive_agent_abort_login_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = **(_QWORD **)(a1 + 32);
  v2 = g_connections;
  if (v1)
    v3 = g_connections == 0;
  else
    v3 = 1;
  if (!v3)
  {
    while (v2 != v1)
    {
      v2 = *(_QWORD *)(v2 + 40);
      if (!v2)
        return;
    }
    *(_BYTE *)(v1 + 24) = 1;
    xpc_connection_cancel(*(xpc_connection_t *)(v1 + 16));
  }
}

_QWORD *captive_agent_token_login(const __CFString *a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v12;
  _QWORD *v13;
  const __CFString *Value;
  const __CFString *v15;
  CFTypeID TypeID;
  const __CFAllocator *v17;
  CFDataRef ExternalRepresentation;
  CFDataRef v19;
  char *v20;
  char *v21;
  CFTypeID v22;
  char *v23;
  void *v24;
  xpc_object_t v25;
  const UInt8 *BytePtr;
  size_t Length;
  _QWORD v29[6];

  v12 = malloc_type_malloc(0x38uLL, 0x10A0040D4AB39ECuLL);
  v13 = v12;
  if (v12)
  {
    v12[6] = 0;
    *((_OWORD *)v12 + 1) = 0u;
    *((_OWORD *)v12 + 2) = 0u;
    *(_OWORD *)v12 = 0u;
    create_connection((uint64_t)v12);
    *((_BYTE *)v13 + 24) = 0;
    v13[4] = a5;
    *((_DWORD *)v13 + 7) = 5;
    *v13 = a4;
    v13[1] = a6;
    Value = (const __CFString *)CFDictionaryGetValue(a2, kTokenAuthLoginURL[0]);
    v15 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("Password"));
    TypeID = CFStringGetTypeID();
    if (!v15)
      return 0;
    if (CFGetTypeID(v15) != TypeID)
      return 0;
    v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], v15, 0x8000100u, 0);
    if (!ExternalRepresentation)
      return 0;
    v19 = ExternalRepresentation;
    v20 = (char *)copy_cstring(a1);
    if (!v20)
    {
      CFRelease(v19);
      return 0;
    }
    v21 = v20;
    v22 = CFStringGetTypeID();
    if (Value && CFGetTypeID(Value) == v22)
    {
      v23 = (char *)copy_cstring(Value);
      if (!v23)
      {
        v24 = 0;
        v23 = v21;
        goto LABEL_16;
      }
    }
    else
    {
      v23 = 0;
    }
    v25 = xpc_dictionary_create(0, 0, 0);
    v24 = v25;
    if (v25)
    {
      xpc_dictionary_set_uint64(v25, "MessageType", 0xAuLL);
      if (v23)
        xpc_dictionary_set_string(v24, "TokenAuthURL", v23);
      xpc_dictionary_set_string(v24, "InterfaceName", v21);
      xpc_dictionary_set_string(v24, "UserAgent", "CaptiveNetworkSupport-480");
      xpc_dictionary_set_uint64(v24, "TokenAuthTimeout", a3);
      BytePtr = CFDataGetBytePtr(v19);
      Length = CFDataGetLength(v19);
      xpc_dictionary_set_data(v24, "TokenAuthCredential", BytePtr, Length);
    }
    CFAllocatorDeallocate(v17, v21);
    if (!v23)
    {
LABEL_17:
      CFRelease(v19);
      if (v24)
      {
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 0x40000000;
        v29[2] = __captive_agent_token_login_block_invoke;
        v29[3] = &__block_descriptor_tmp_4;
        v29[4] = v13;
        v29[5] = v24;
        dispatch_sync((dispatch_queue_t)g_queue, v29);
        xpc_release(v24);
        return v13;
      }
      return 0;
    }
LABEL_16:
    CFAllocatorDeallocate(v17, v23);
    goto LABEL_17;
  }
  return v13;
}

void __captive_agent_token_login_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = g_connections;
  *(_QWORD *)(v1 + 40) = g_connections;
  if (v2)
    *(_QWORD *)(v2 + 48) = v1 + 40;
  g_connections = v1;
  *(_QWORD *)(v1 + 48) = &g_connections;
  send_message(*(void **)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void captive_agent_abort_token_auth(_QWORD *a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __captive_agent_abort_token_auth_block_invoke;
  block[3] = &__block_descriptor_tmp_5;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  *a1 = 0;
}

void __captive_agent_abort_token_auth_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = **(_QWORD **)(a1 + 32);
  v2 = g_connections;
  if (v1)
    v3 = g_connections == 0;
  else
    v3 = 1;
  if (!v3)
  {
    while (v2 != v1)
    {
      v2 = *(_QWORD *)(v2 + 40);
      if (!v2)
        return;
    }
    *(_BYTE *)(v1 + 24) = 1;
    xpc_connection_cancel(*(xpc_connection_t *)(v1 + 16));
  }
}

_QWORD *captive_agent_logout(const __CFDictionary *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const __CFString *Value;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  _OWORD *v14;
  _QWORD *v15;
  xpc_object_t v16;
  void *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  const char *v22;
  const __CFAllocator *v23;
  const __CFAllocator *v24;
  void *v25;
  NSObject *logger;
  os_log_type_t v27;
  void *v28;
  _QWORD v30[6];
  uint8_t buf[16];

  Value = (const __CFString *)CFDictionaryGetValue(a1, kWISPrLogoffURL[0]);
  if (!Value)
  {
    logger = mysyslog_get_logger();
    v27 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v27))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, logger, v27, "login result dictionary does not contain logout URL", buf, 2u);
    }
    return 0;
  }
  v11 = Value;
  v12 = (const __CFString *)CFDictionaryGetValue(a1, kUserAgent[0]);
  if (v12)
    v13 = v12;
  else
    v13 = CFSTR("CaptiveNetworkSupport-??? wispr");
  v14 = malloc_type_malloc(0x38uLL, 0x10A0040D4AB39ECuLL);
  v15 = v14;
  if (v14)
  {
    *((_QWORD *)v14 + 6) = 0;
    v14[1] = 0u;
    v14[2] = 0u;
    *v14 = 0u;
    create_connection((uint64_t)v14);
    v15[4] = a4;
    *v15 = a3;
    v15[1] = a5;
    *((_DWORD *)v15 + 7) = 2;
    v16 = xpc_dictionary_create(0, 0, 0);
    if (v16)
    {
      v17 = v16;
      v18 = (char *)copy_cstring(v11);
      if (v18)
      {
        v19 = v18;
        v20 = (char *)copy_cstring(a2);
        if (v20)
        {
          v21 = v20;
          v22 = (const char *)copy_cstring(v13);
          if (v22)
          {
            xpc_dictionary_set_uint64(v17, "MessageType", 4uLL);
            xpc_dictionary_set_string(v17, "LogoffURL", v19);
            xpc_dictionary_set_string(v17, "InterfaceName", v21);
            xpc_dictionary_set_string(v17, "UserAgent", v22);
          }
          v23 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x24BDBD240], v19);
          CFAllocatorDeallocate(v23, v21);
          if (!v22)
            goto LABEL_21;
          v24 = v23;
          v25 = (void *)v22;
        }
        else
        {
          v24 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v25 = v19;
        }
        CFAllocatorDeallocate(v24, v25);
      }
LABEL_21:
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 0x40000000;
      v30[2] = __captive_agent_logout_block_invoke;
      v30[3] = &__block_descriptor_tmp_7;
      v30[4] = v15;
      v30[5] = v17;
      dispatch_sync((dispatch_queue_t)g_queue, v30);
      xpc_release(v17);
      return v15;
    }
    v28 = (void *)v15[2];
    if (v28)
      xpc_release(v28);
    free(v15);
    return 0;
  }
  return v15;
}

void __captive_agent_logout_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = g_connections;
  *(_QWORD *)(v1 + 40) = g_connections;
  if (v2)
    *(_QWORD *)(v2 + 48) = v1 + 40;
  g_connections = v1;
  *(_QWORD *)(v1 + 48) = &g_connections;
  send_message(*(void **)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void captive_agent_abort_logout(_QWORD *a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __captive_agent_abort_logout_block_invoke;
  block[3] = &__block_descriptor_tmp_8;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  *a1 = 0;
}

void __captive_agent_abort_logout_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = **(_QWORD **)(a1 + 32);
  v2 = g_connections;
  if (v1)
    v3 = g_connections == 0;
  else
    v3 = 1;
  if (!v3)
  {
    while (v2 != v1)
    {
      v2 = *(_QWORD *)(v2 + 40);
      if (!v2)
        return;
    }
    *(_BYTE *)(v1 + 24) = 1;
    xpc_connection_cancel(*(xpc_connection_t *)(v1 + 16));
  }
}

_QWORD *captive_agent_query_api(uint64_t a1, const __CFString *a2, const __CFString *a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _OWORD *v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  xpc_object_t v19;
  void *v20;
  const __CFAllocator *v21;
  const __CFAllocator *v22;
  char *v23;
  const __CFAllocator *v24;
  void *v25;
  _QWORD v27[6];

  v13 = malloc_type_malloc(0x38uLL, 0x10A0040D4AB39ECuLL);
  v14 = v13;
  if (v13)
  {
    *((_QWORD *)v13 + 6) = 0;
    v13[1] = 0u;
    v13[2] = 0u;
    *v13 = 0u;
    create_connection((uint64_t)v13);
    v14[4] = a5;
    *v14 = a7;
    v14[1] = a6;
    *((_DWORD *)v14 + 7) = 4;
    v15 = (char *)copy_cstring(a2);
    if (v15)
    {
      v16 = v15;
      v17 = (char *)copy_cstring(a3);
      if (v17)
      {
        v18 = v17;
        v19 = xpc_dictionary_create(0, 0, 0);
        if (v19)
        {
          v20 = v19;
          xpc_dictionary_set_uint64(v19, "MessageType", 8uLL);
          xpc_dictionary_set_string(v20, "PortalAPIURI", v18);
          xpc_dictionary_set_string(v20, "InterfaceName", v16);
          xpc_dictionary_set_string(v20, "UserAgent", "CaptiveNetworkSupport-480");
          xpc_dictionary_set_uint64(v20, "ProbeTimeout", a4);
          v21 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x24BDBD240], v16);
          CFAllocatorDeallocate(v21, v18);
          v27[0] = MEMORY[0x24BDAC760];
          v27[1] = 0x40000000;
          v27[2] = __captive_agent_query_api_block_invoke;
          v27[3] = &__block_descriptor_tmp_9;
          v27[4] = v14;
          v27[5] = v20;
          dispatch_sync((dispatch_queue_t)g_queue, v27);
          xpc_release(v20);
          return v14;
        }
        v24 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x24BDBD240], v16);
        v22 = v24;
        v23 = v18;
      }
      else
      {
        v22 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v23 = v16;
      }
      CFAllocatorDeallocate(v22, v23);
    }
    v25 = (void *)v14[2];
    if (v25)
      xpc_release(v25);
    free(v14);
    return 0;
  }
  return v14;
}

void __captive_agent_query_api_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = g_connections;
  *(_QWORD *)(v1 + 40) = g_connections;
  if (v2)
    *(_QWORD *)(v2 + 48) = v1 + 40;
  g_connections = v1;
  *(_QWORD *)(v1 + 48) = &g_connections;
  send_message(*(void **)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void captive_agent_abort_query(_QWORD *a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __captive_agent_abort_query_block_invoke;
  block[3] = &__block_descriptor_tmp_10;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  *a1 = 0;
}

void __captive_agent_abort_query_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = **(_QWORD **)(a1 + 32);
  v2 = g_connections;
  if (v1)
    v3 = g_connections == 0;
  else
    v3 = 1;
  if (!v3)
  {
    while (v2 != v1)
    {
      v2 = *(_QWORD *)(v2 + 40);
      if (!v2)
        return;
    }
    *(_BYTE *)(v1 + 24) = 1;
    xpc_connection_cancel(*(xpc_connection_t *)(v1 + 16));
  }
}

_QWORD *captive_agent_get_credentials(const __CFString *a1, const __CFString *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _OWORD *v13;
  _QWORD *v14;
  xpc_object_t v15;
  void *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  const char *v21;
  const __CFAllocator *v22;
  const __CFAllocator *v23;
  void *v24;
  void *v25;
  _QWORD v27[6];

  v13 = malloc_type_malloc(0x38uLL, 0x10A0040D4AB39ECuLL);
  v14 = v13;
  if (v13)
  {
    *((_QWORD *)v13 + 6) = 0;
    v13[1] = 0u;
    v13[2] = 0u;
    *v13 = 0u;
    create_connection((uint64_t)v13);
    v14[4] = a5;
    *v14 = a7;
    v14[1] = a6;
    *((_DWORD *)v14 + 7) = 3;
    v15 = xpc_dictionary_create(0, 0, 0);
    if (v15)
    {
      v16 = v15;
      v17 = (char *)copy_cstring(a1);
      if (v17)
      {
        v18 = v17;
        v19 = (char *)copy_cstring(a2);
        if (v19)
        {
          v20 = v19;
          v21 = (const char *)copy_cstring(CFSTR("CaptiveNetworkSupport-480"));
          if (v21)
          {
            xpc_dictionary_set_uint64(v16, "MessageType", 6uLL);
            xpc_dictionary_set_string(v16, "CredentialsURL", v18);
            xpc_dictionary_set_string(v16, "UserAgent", v21);
            xpc_dictionary_set_string(v16, "ServiceType", v20);
            xpc_dictionary_set_uint64(v16, "ProbeTimeout", a4);
          }
          v22 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x24BDBD240], v18);
          CFAllocatorDeallocate(v22, v20);
          if (!v21)
            goto LABEL_14;
          v23 = v22;
          v24 = (void *)v21;
        }
        else
        {
          v23 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v24 = v18;
        }
        CFAllocatorDeallocate(v23, v24);
      }
LABEL_14:
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 0x40000000;
      v27[2] = __captive_agent_get_credentials_block_invoke;
      v27[3] = &__block_descriptor_tmp_13;
      v27[4] = v14;
      v27[5] = v16;
      dispatch_sync((dispatch_queue_t)g_queue, v27);
      xpc_release(v16);
      return v14;
    }
    v25 = (void *)v14[2];
    if (v25)
      xpc_release(v25);
    free(v14);
    return 0;
  }
  return v14;
}

void __captive_agent_get_credentials_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = g_connections;
  *(_QWORD *)(v1 + 40) = g_connections;
  if (v2)
    *(_QWORD *)(v2 + 48) = v1 + 40;
  g_connections = v1;
  *(_QWORD *)(v1 + 48) = &g_connections;
  send_message(*(void **)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void captive_agent_get_credentials_abort(_QWORD *a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __captive_agent_get_credentials_abort_block_invoke;
  block[3] = &__block_descriptor_tmp_14_0;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, block);
  *a1 = 0;
}

void __captive_agent_get_credentials_abort_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = **(_QWORD **)(a1 + 32);
  v2 = g_connections;
  if (v1)
    v3 = g_connections == 0;
  else
    v3 = 1;
  if (!v3)
  {
    while (v2 != v1)
    {
      v2 = *(_QWORD *)(v2 + 40);
      if (!v2)
        return;
    }
    *(_BYTE *)(v1 + 24) = 1;
    xpc_connection_cancel(*(xpc_connection_t *)(v1 + 16));
  }
}

void *copy_cstring(const __CFString *a1)
{
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  const __CFAllocator *v4;
  void *v5;

  if (!a1)
    return 0;
  Length = CFStringGetLength(a1);
  MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], MaximumSizeForEncoding, 0);
  if (v5 && !CFStringGetCString(a1, (char *)v5, MaximumSizeForEncoding, 0x8000100u))
  {
    CFAllocatorDeallocate(v4, v5);
    return 0;
  }
  return v5;
}

void add_post_variable(CFStringRef originalString, const __CFString *a2, __CFString *a3)
{
  const __CFAllocator *v5;
  CFStringRef v6;
  CFTypeID TypeID;
  BOOL v8;

  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x24BDBD240], originalString, 0, 0, 0x8000100u);
  TypeID = CFStringGetTypeID();
  if (a2)
  {
    if (CFGetTypeID(a2) == TypeID)
      a2 = CFURLCreateStringByAddingPercentEscapes(v5, a2, 0, 0, 0x8000100u);
    else
      CFRetain(a2);
  }
  if (CFStringGetLength(a3) >= 1)
    CFStringAppend(a3, CFSTR("&"));
  if (v6)
    v8 = a2 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (!v6)
    {
      if (!a2)
        return;
      goto LABEL_14;
    }
  }
  else
  {
    CFStringAppendFormat(a3, 0, CFSTR("%@=%@"), v6, a2);
  }
  CFRelease(v6);
  if (a2)
LABEL_14:
    CFRelease(a2);
}

dispatch_queue_t __create_connection_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.captiveagent", 0);
  g_queue = (uint64_t)result;
  g_connections = 0;
  return result;
}

void __create_connection_block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *logger;
  os_log_type_t v5;
  const char *string;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFRunLoop *v11;
  const void *v12;
  __int128 v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a2 && MEMORY[0x2207369CC](a2) == MEMORY[0x24BDACFB8])
  {
    logger = mysyslog_get_logger();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
      LODWORD(v13) = 136315138;
      *(_QWORD *)((char *)&v13 + 4) = string;
      _os_log_impl(&dword_219EF1000, logger, v5, "xpc event handler block got an error on the XPC connection: %s", (uint8_t *)&v13, 0xCu);
    }
    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      v8 = g_connections;
      if (g_connections)
      {
        while (v8 != v7)
        {
          v8 = *(_QWORD *)(v8 + 40);
          if (!v8)
            return;
        }
        if (*(_BYTE *)(v7 + 24))
        {
          cleanup_context(*(_QWORD **)(a1 + 32));
        }
        else
        {
          switch(*(_DWORD *)(v7 + 28))
          {
            case 0:
              schedule_probe_response_handler(*(_QWORD *)(v7 + 32), *(_QWORD *)(a1 + 32), *(CFRunLoopRef *)v7, *(_QWORD *)(v7 + 8), 13, 0);
              break;
            case 1:
              schedule_login_response_handler(*(_QWORD *)(v7 + 32), *(_QWORD *)(a1 + 32), *(CFRunLoopRef *)v7, *(_QWORD *)(v7 + 8), 0);
              break;
            case 2:
              v9 = *(_QWORD *)(v7 + 32);
              v11 = *(__CFRunLoop **)v7;
              v10 = *(_QWORD *)(v7 + 8);
              v12 = (const void *)*MEMORY[0x24BDBD5A0];
              *(_QWORD *)&v13 = MEMORY[0x24BDAC760];
              *((_QWORD *)&v13 + 1) = 0x40000000;
              v14 = __schedule_logout_response_handler_block_invoke;
              v15 = &__block_descriptor_tmp_77;
              v16 = v7;
              v17 = v9;
              v18 = v10;
              v19 = 13;
              CFRunLoopPerformBlock(v11, v12, &v13);
              CFRunLoopWakeUp(v11);
              break;
            case 3:
              schedule_get_creds_response_handler(*(_QWORD *)(v7 + 32), *(_QWORD *)(a1 + 32), *(CFRunLoopRef *)v7, *(_QWORD *)(v7 + 8), 13, 0);
              break;
            case 4:
              schedule_query_api_response_handler(*(_QWORD *)(v7 + 32), *(_QWORD *)(a1 + 32), *(CFRunLoopRef *)v7, *(_QWORD *)(v7 + 8), 13, 0);
              break;
            default:
              return;
          }
        }
      }
    }
  }
}

void cleanup_context(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = a1[5];
  if (v2)
    *(_QWORD *)(v2 + 48) = a1[6];
  *(_QWORD *)a1[6] = v2;
  v3 = (void *)a1[2];
  if (v3)
    xpc_release(v3);
  free(a1);
}

void schedule_probe_response_handler(uint64_t a1, uint64_t a2, CFRunLoopRef rl, uint64_t a4, int a5, uint64_t a6)
{
  const void *v7;
  _QWORD block[8];
  int v9;

  v7 = (const void *)*MEMORY[0x24BDBD5A0];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __schedule_probe_response_handler_block_invoke;
  block[3] = &__block_descriptor_tmp_72;
  block[4] = a2;
  block[5] = a1;
  v9 = a5;
  block[6] = a4;
  block[7] = a6;
  CFRunLoopPerformBlock(rl, v7, block);
  CFRunLoopWakeUp(rl);
}

void schedule_query_api_response_handler(uint64_t a1, uint64_t a2, CFRunLoopRef rl, uint64_t a4, int a5, uint64_t a6)
{
  const void *v7;
  _QWORD block[8];
  int v9;

  v7 = (const void *)*MEMORY[0x24BDBD5A0];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __schedule_query_api_response_handler_block_invoke;
  block[3] = &__block_descriptor_tmp_74;
  block[4] = a2;
  block[5] = a1;
  v9 = a5;
  block[6] = a4;
  block[7] = a6;
  CFRunLoopPerformBlock(rl, v7, block);
  CFRunLoopWakeUp(rl);
}

void schedule_login_response_handler(uint64_t a1, uint64_t a2, CFRunLoopRef rl, uint64_t a4, uint64_t a5)
{
  const void *v6;
  _QWORD v7[8];

  v6 = (const void *)*MEMORY[0x24BDBD5A0];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 0x40000000;
  v7[2] = __schedule_login_response_handler_block_invoke;
  v7[3] = &__block_descriptor_tmp_75;
  v7[4] = a2;
  v7[5] = a1;
  v7[6] = a4;
  v7[7] = a5;
  CFRunLoopPerformBlock(rl, v6, v7);
  CFRunLoopWakeUp(rl);
}

void schedule_get_creds_response_handler(uint64_t a1, uint64_t a2, CFRunLoopRef rl, uint64_t a4, int a5, uint64_t a6)
{
  const void *v7;
  _QWORD block[8];
  int v9;

  v7 = (const void *)*MEMORY[0x24BDBD5A0];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __schedule_get_creds_response_handler_block_invoke;
  block[3] = &__block_descriptor_tmp_76;
  block[4] = a2;
  block[5] = a1;
  v9 = a5;
  block[6] = a4;
  block[7] = a6;
  CFRunLoopPerformBlock(rl, v7, block);
  CFRunLoopWakeUp(rl);
}

void __schedule_probe_response_handler_block_invoke(uint64_t a1)
{
  const void *v2;

  if (should_process_response(*(_QWORD *)(a1 + 32)))
    (*(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v2 = *(const void **)(a1 + 56);
  if (v2)
    CFRelease(v2);
}

uint64_t should_process_response(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2000000000;
  v7 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 0x40000000;
  v3[2] = __should_process_response_block_invoke;
  v3[3] = &unk_24DC16930;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)g_queue, v3);
  v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void __should_process_response_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = g_connections;
  if (v1)
    v3 = g_connections == 0;
  else
    v3 = 1;
  if (!v3)
  {
    while (v2 != v1)
    {
      v2 = *(_QWORD *)(v2 + 40);
      if (!v2)
        return;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_BYTE *)(v1 + 24) == 0;
    cleanup_context(*(_QWORD **)(a1 + 40));
  }
}

void __schedule_query_api_response_handler_block_invoke(uint64_t a1)
{
  const void *v2;

  if (should_process_response(*(_QWORD *)(a1 + 32)))
    (*(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v2 = *(const void **)(a1 + 56);
  if (v2)
    CFRelease(v2);
}

void __schedule_login_response_handler_block_invoke(uint64_t a1)
{
  const void *v2;

  if (should_process_response(*(_QWORD *)(a1 + 32)))
    (*(void (**)(_QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(const void **)(a1 + 56);
  if (v2)
    CFRelease(v2);
}

void __schedule_get_creds_response_handler_block_invoke(uint64_t a1)
{
  const void *v2;

  if (should_process_response(*(_QWORD *)(a1 + 32)))
    (*(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v2 = *(const void **)(a1 + 56);
  if (v2)
    CFRelease(v2);
}

uint64_t __schedule_logout_response_handler_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = should_process_response(*(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));
  return result;
}

void __send_message_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFRunLoop *v8;
  int uint64;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFRunLoop *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFRunLoop *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFRunLoop *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  __CFRunLoop *v26;
  uint64_t v27;
  int v28;
  uint64_t value;
  const void *v30;
  _QWORD block[8];
  int v32;

  if (a2)
  {
    if (MEMORY[0x2207369CC](a2) == MEMORY[0x24BDACFA0])
    {
      v4 = *(_QWORD *)(a1 + 32);
      if (v4)
      {
        v5 = g_connections;
        if (g_connections)
        {
          while (v5 != v4)
          {
            v5 = *(_QWORD *)(v5 + 40);
            if (!v5)
              return;
          }
          if (*(_BYTE *)(v4 + 24))
          {
            cleanup_context((_QWORD *)v4);
          }
          else
          {
            switch(xpc_dictionary_get_uint64(a2, "MessageType"))
            {
              case 1uLL:
                v6 = *(_QWORD *)(v4 + 32);
                v8 = *(__CFRunLoop **)v4;
                v7 = *(_QWORD *)(v4 + 8);
                uint64 = xpc_dictionary_get_uint64(a2, "ResultCode");
                if (xpc_dictionary_get_value(a2, "ProbeResultDict"))
                  v10 = _CFXPCCreateCFObjectFromXPCObject();
                else
                  v10 = 0;
                schedule_probe_response_handler(v6, v4, v8, v7, uint64, v10);
                break;
              case 3uLL:
                v11 = *(_QWORD *)(v4 + 32);
                v13 = *(__CFRunLoop **)v4;
                v12 = *(_QWORD *)(v4 + 8);
                if (xpc_dictionary_get_value(a2, "LoginResultDict"))
                  v14 = _CFXPCCreateCFObjectFromXPCObject();
                else
                  v14 = 0;
                schedule_login_response_handler(v11, v4, v13, v12, v14);
                break;
              case 7uLL:
                v15 = *(_QWORD *)(v4 + 32);
                v17 = *(__CFRunLoop **)v4;
                v16 = *(_QWORD *)(v4 + 8);
                v18 = xpc_dictionary_get_uint64(a2, "ResultCode");
                if (xpc_dictionary_get_value(a2, "GetCredsResultDict"))
                  v19 = _CFXPCCreateCFObjectFromXPCObject();
                else
                  v19 = 0;
                schedule_get_creds_response_handler(v15, v4, v17, v16, v18, v19);
                break;
              case 9uLL:
                v20 = *(_QWORD *)(v4 + 32);
                v22 = *(__CFRunLoop **)v4;
                v21 = *(_QWORD *)(v4 + 8);
                v23 = xpc_dictionary_get_uint64(a2, "ResultCode");
                if (xpc_dictionary_get_value(a2, "APIResultDict"))
                  v24 = _CFXPCCreateCFObjectFromXPCObject();
                else
                  v24 = 0;
                schedule_query_api_response_handler(v20, v4, v22, v21, v23, v24);
                break;
              case 0xBuLL:
                v25 = *(_QWORD *)(v4 + 32);
                v26 = *(__CFRunLoop **)v4;
                v27 = *(_QWORD *)(v4 + 8);
                v28 = xpc_dictionary_get_uint64(a2, "ResultCode");
                value = (uint64_t)xpc_dictionary_get_value(a2, "TokenAuthResultDict");
                if (value)
                  value = _CFXPCCreateCFObjectFromXPCObject();
                v30 = (const void *)*MEMORY[0x24BDBD5A0];
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 0x40000000;
                block[2] = __schedule_token_auth_response_handler_block_invoke;
                block[3] = &__block_descriptor_tmp_86;
                block[4] = v4;
                block[5] = v25;
                v32 = v28;
                block[6] = v27;
                block[7] = value;
                CFRunLoopPerformBlock(v26, v30, block);
                CFRunLoopWakeUp(v26);
                break;
              default:
                return;
            }
          }
        }
      }
    }
  }
}

void __schedule_token_auth_response_handler_block_invoke(uint64_t a1)
{
  const void *v2;

  if (should_process_response(*(_QWORD *)(a1 + 32)))
    (*(void (**)(_QWORD, _QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v2 = *(const void **)(a1 + 56);
  if (v2)
    CFRelease(v2);
}

BOOL is_internal_install()
{
  int v0;
  int v1;

  v0 = is_internal_install_isInternal;
  if (is_internal_install_isInternal == -1)
  {
    v1 = open("/AppleInternal", 0);
    if (v1 == -1)
    {
      v0 = 0;
      is_internal_install_isInternal = 0;
    }
    else
    {
      is_internal_install_isInternal = 1;
      close(v1);
      v0 = is_internal_install_isInternal;
    }
  }
  return v0 == 1;
}

uint64_t CaptiveCopyInterfaceSSIDData(CFTypeRef cf2)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = &S_stateHeadStorage;
  do
  {
    v2 = (uint64_t *)*v2;
    if (!v2)
      return 0;
  }
  while (!CFEqual((CFTypeRef)v2[4], cf2));
  v3 = v2[7];
  if (v3)
    CFRetain((CFTypeRef)v2[7]);
  return v3;
}

uint64_t CaptiveCopyInterfaceSSID(CFTypeRef cf2)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = &S_stateHeadStorage;
  do
  {
    v2 = (uint64_t *)*v2;
    if (!v2)
      return 0;
  }
  while (!CFEqual((CFTypeRef)v2[4], cf2));
  v3 = v2[6];
  if (v3)
    CFRetain((CFTypeRef)v2[6]);
  return v3;
}

uint64_t CaptiveCopyInitialURL(CFTypeRef cf2)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = &S_stateHeadStorage;
  do
  {
    v2 = (uint64_t *)*v2;
    if (!v2)
      return 0;
  }
  while (!CFEqual((CFTypeRef)v2[4], cf2));
  v3 = v2[14];
  if (v3)
    CFRetain((CFTypeRef)v2[14]);
  return v3;
}

uint64_t CaptiveCopyPortalURL(CFTypeRef cf2)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = &S_stateHeadStorage;
  do
  {
    v2 = (uint64_t *)*v2;
    if (!v2)
      return 0;
  }
  while (!CFEqual((CFTypeRef)v2[4], cf2));
  v3 = v2[15];
  if (v3)
    CFRetain((CFTypeRef)v2[15]);
  return v3;
}

void CaptiveUpdateAPIState(CFTypeRef cf2, const void *a2)
{
  uint64_t *v4;

  v4 = &S_stateHeadStorage;
  while (1)
  {
    v4 = (uint64_t *)*v4;
    if (!v4)
      break;
    if (CFEqual((CFTypeRef)v4[4], cf2))
    {
      my_FieldSetRetainedCFType((const void **)v4 + 18, a2);
      return;
    }
  }
}

uint64_t CaptiveGetRedirectForInterface(CFTypeRef cf2)
{
  uint64_t *v2;

  v2 = &S_stateHeadStorage;
  while (1)
  {
    v2 = (uint64_t *)*v2;
    if (!v2)
      break;
    if (CFEqual((CFTypeRef)v2[4], cf2))
      return v2[16];
  }
  return 0;
}

uint64_t CaptiveGetAuthReplyForInterface(CFTypeRef cf2)
{
  uint64_t *v2;

  v2 = &S_stateHeadStorage;
  while (1)
  {
    v2 = (uint64_t *)*v2;
    if (!v2)
      break;
    if (CFEqual((CFTypeRef)v2[4], cf2))
      return v2[17];
  }
  return 0;
}

void CaptiveDumpStates()
{
  NSObject *logger;
  os_log_type_t v1;
  uint64_t i;
  NSObject *v3;
  os_log_type_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  const char *v40;
  NSObject *v41;
  os_log_type_t v42;
  const char *v43;
  NSObject *v44;
  os_log_type_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  int v56;
  NSObject *v57;
  os_log_type_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  uint8_t buf[4];
  uint64_t v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219EF1000, logger, v1, "Captive states:", buf, 2u);
  }
  for (i = S_stateHeadStorage; i; i = *(_QWORD *)i)
  {
    v3 = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 134217984;
      v63 = i;
      _os_log_impl(&dword_219EF1000, v3, v4, "State %p:", buf, 0xCu);
    }
    v5 = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = *(_QWORD *)(i + 32);
      *(_DWORD *)buf = 138412290;
      v63 = v7;
      _os_log_impl(&dword_219EF1000, v5, v6, "  interface:   %@", buf, 0xCu);
    }
    v8 = mysyslog_get_logger();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = *(_QWORD *)(i + 64);
      *(_DWORD *)buf = 138412290;
      v63 = v10;
      _os_log_impl(&dword_219EF1000, v8, v9, "  stage:       %@", buf, 0xCu);
    }
    v11 = mysyslog_get_logger();
    v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *(_QWORD *)(i + 72);
      *(_DWORD *)buf = 134217984;
      v63 = v13;
      _os_log_impl(&dword_219EF1000, v11, v12, "  detect_ref:  %p", buf, 0xCu);
    }
    v14 = mysyslog_get_logger();
    v15 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = *(_QWORD *)(i + 88);
      *(_DWORD *)buf = 134217984;
      v63 = v16;
      _os_log_impl(&dword_219EF1000, v14, v15, "  query_ref:   %p", buf, 0xCu);
    }
    v17 = mysyslog_get_logger();
    v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = *(_QWORD *)(i + 80);
      *(_DWORD *)buf = 134217984;
      v63 = v19;
      _os_log_impl(&dword_219EF1000, v17, v18, "  login_ref:   %p", buf, 0xCu);
    }
    v20 = mysyslog_get_logger();
    v21 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = *(_QWORD *)(i + 40);
      *(_DWORD *)buf = 134217984;
      v63 = v22;
      _os_log_impl(&dword_219EF1000, v20, v21, "  thirdParty:  %p", buf, 0xCu);
    }
    v23 = mysyslog_get_logger();
    v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = *(_QWORD *)(i + 48);
      *(_DWORD *)buf = 138412290;
      v63 = v25;
      _os_log_impl(&dword_219EF1000, v23, v24, "  ssid:        %@", buf, 0xCu);
    }
    v26 = mysyslog_get_logger();
    v27 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = *(_QWORD *)(i + 224);
      *(_DWORD *)buf = 134217984;
      v63 = v28;
      _os_log_impl(&dword_219EF1000, v26, v27, "  websheet:    %p", buf, 0xCu);
    }
    v29 = mysyslog_get_logger();
    v30 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = *(_QWORD *)(i + 144);
      *(_DWORD *)buf = 138412290;
      v63 = v31;
      _os_log_impl(&dword_219EF1000, v29, v30, "  api:         %@", buf, 0xCu);
    }
    v32 = mysyslog_get_logger();
    v33 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = *(_QWORD *)(i + 152);
      *(_DWORD *)buf = 138412290;
      v63 = v34;
      _os_log_impl(&dword_219EF1000, v32, v33, "  token_auth_result:         %@", buf, 0xCu);
    }
    v35 = mysyslog_get_logger();
    v36 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = *(_QWORD *)(i + 232);
      *(_DWORD *)buf = 138412290;
      v63 = v37;
      _os_log_impl(&dword_219EF1000, v35, v36, "  name:        %@", buf, 0xCu);
    }
    v38 = mysyslog_get_logger();
    v39 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = "!NULL";
      if (!*(_QWORD *)(i + 240))
        v40 = "NULL";
      *(_DWORD *)buf = 136315138;
      v63 = (uint64_t)v40;
      _os_log_impl(&dword_219EF1000, v38, v39, "  pass:        %s", buf, 0xCu);
    }
    v41 = mysyslog_get_logger();
    v42 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = "TRUE";
      if (!*(_BYTE *)(i + 252))
        v43 = "FALSE";
      *(_DWORD *)buf = 136315138;
      v63 = (uint64_t)v43;
      _os_log_impl(&dword_219EF1000, v41, v42, "  waitingonu:  %s", buf, 0xCu);
    }
    v44 = mysyslog_get_logger();
    v45 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v44, v45))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v44, v45, "  redirect:", buf, 2u);
    }
    v46 = mysyslog_get_logger();
    v47 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = *(_QWORD *)(i + 128);
      *(_DWORD *)buf = 138412290;
      v63 = v48;
      _os_log_impl(&dword_219EF1000, v46, v47, "    %@", buf, 0xCu);
    }
    v49 = mysyslog_get_logger();
    v50 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v49, v50))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v49, v50, "  authreply", buf, 2u);
    }
    v51 = mysyslog_get_logger();
    v52 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = *(_QWORD *)(i + 136);
      *(_DWORD *)buf = 138412290;
      v63 = v53;
      _os_log_impl(&dword_219EF1000, v51, v52, "    %@", buf, 0xCu);
    }
    v54 = mysyslog_get_logger();
    v55 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = *(_DWORD *)(i + 168);
      *(_DWORD *)buf = 67109120;
      LODWORD(v63) = v56;
      _os_log_impl(&dword_219EF1000, v54, v55, "  accountOn:   %d", buf, 8u);
    }
    v57 = mysyslog_get_logger();
    v58 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v57, v58))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v57, v58, "  matchingAccounts:", buf, 2u);
    }
    v59 = mysyslog_get_logger();
    v60 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = *(_QWORD *)(i + 160);
      *(_DWORD *)buf = 138412290;
      v63 = v61;
      _os_log_impl(&dword_219EF1000, v59, v60, "    %@", buf, 0xCu);
    }
  }
}

uint64_t CaptiveAuthenticateUsing(CFTypeRef cf2, const __CFString *a2, int a3)
{
  uint64_t *v6;
  const void *v8;
  _QWORD *Start;

  v6 = &S_stateHeadStorage;
  do
  {
    v6 = (uint64_t *)*v6;
    if (!v6)
      return 22;
  }
  while (!CFEqual((CFTypeRef)v6[4], cf2));
  if (v6[23] || v6[8] != kStage_WebSheet)
    return 16;
  CaptiveSetStage((uint64_t)v6, (__CFString *)kStage_CredQuery);
  *((_DWORD *)v6 + 48) = a3;
  v8 = (const void *)v6[22];
  if (v8)
  {
    CFRelease(v8);
    v6[22] = 0;
  }
  v6[22] = (uint64_t)a2;
  CFRetain(a2);
  Start = CNAccountsCredentialsQueryStart(a2, (const __CFString *)v6[6], v6[4], v6[16], (uint64_t)CaptiveHandleCredentials, (uint64_t)v6);
  v6[23] = (uint64_t)Start;
  if (Start)
    return 0;
  *((_DWORD *)v6 + 48) = 0;
  return 0xFFFFFFFFLL;
}

void CaptiveSetStage(uint64_t a1, __CFString *a2)
{
  const __CFAllocator *v4;
  const __CFString *NetworkInterfaceEntity;
  __CFDictionary *Mutable;
  NSObject *logger;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  const void **v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const __SCDynamicStore *v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  const void *v22;
  const void *Value;
  const void *v24;
  const void *v25;
  const __CFNumber *v26;
  CFTypeID TypeID;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  double valuePtr;
  _BYTE buf[12];
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (*(__CFString **)(a1 + 64) != a2)
  {
    *(_QWORD *)(a1 + 64) = a2;
    if ((__CFString *)kStage_WebSheet != a2 && kStage_UIRequired[0] != a2)
      *(_BYTE *)(a1 + 252) = 0;
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)*MEMORY[0x24BDF59B0], *(CFStringRef *)(a1 + 32), (CFStringRef)*MEMORY[0x24BE14BB8]);
    Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    logger = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      v45 = 2112;
      v46 = v10;
      _os_log_impl(&dword_219EF1000, logger, v8, "%@ - %@", buf, 0x16u);
    }
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE14BC8], *(const void **)(a1 + 64));
    v11 = (const void **)MEMORY[0x24BDBD270];
    if (!*(_BYTE *)(a1 + 252))
      v11 = (const void **)MEMORY[0x24BDBD268];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE14BD8], *v11);
    v12 = *(const void **)(a1 + 128);
    if (v12)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE14BC0], v12);
    v13 = *(const void **)(a1 + 136);
    if (v13)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE14BB0], v13);
    v14 = *(const void **)(a1 + 144);
    if (v14)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE14BA8], v14);
    v15 = *(const void **)(a1 + 152);
    if (v15)
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE14BD0], v15);
    v16 = (const __SCDynamicStore *)NetIFGetStore();
    if (!SCDynamicStoreSetValue(v16, NetworkInterfaceEntity, Mutable))
    {
      v17 = mysyslog_get_logger();
      v18 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = SCError();
        v20 = SCErrorString(v19);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v20;
        _os_log_impl(&dword_219EF1000, v17, v18, "Failed to update dynamic store, %s", buf, 0xCu);
      }
    }
    if (Mutable)
      CFRelease(Mutable);
    if (NetworkInterfaceEntity)
      CFRelease(NetworkInterfaceEntity);
    if (*(_QWORD *)(a1 + 144))
    {
      v21 = NetIFCopyCurrentWiFiNetwork(*(_QWORD *)(a1 + 32));
      if (v21)
      {
        v22 = (const void *)v21;
        Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 144), kCAPPORTUserPortalURL[0]);
        v24 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 144), kCAPPORTVenueInfoURL[0]);
        v25 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 144), kCAPPORTCanExtendSession[0]);
        v26 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 144), kCAPPORTSecondsRemaining[0]);
        TypeID = CFNumberGetTypeID();
        if (v26)
        {
          if (CFGetTypeID(v26) == TypeID)
          {
            *(_QWORD *)buf = 0;
            CFNumberGetValue(v26, kCFNumberDoubleType, buf);
            v26 = 0;
            if (*(double *)buf > 0.0)
            {
              valuePtr = CFAbsoluteTimeGetCurrent() + *(double *)buf;
              v26 = CFNumberCreate(v4, kCFNumberDoubleType, &valuePtr);
            }
          }
          else
          {
            v26 = 0;
          }
        }
        if (Value)
        {
          v31 = mysyslog_get_logger();
          v32 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v31, v32))
          {
            v33 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = Value;
            v45 = 2112;
            v46 = v33;
            _os_log_impl(&dword_219EF1000, v31, v32, "Setting UserPortalURL to %@ for interface %@", buf, 0x16u);
          }
          NetIFWiFiNetworkSetCaptivePortalUserPortalURL((uint64_t)v22, Value);
        }
        if (v24)
        {
          v34 = mysyslog_get_logger();
          v35 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v34, v35))
          {
            v36 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v24;
            v45 = 2112;
            v46 = v36;
            _os_log_impl(&dword_219EF1000, v34, v35, "Setting VenueInfoURL to %@ for interface %@", buf, 0x16u);
          }
          NetIFWiFiNetworkSetCaptivePortalVenueInfoURL((uint64_t)v22, v24);
        }
        if (v25)
        {
          v37 = mysyslog_get_logger();
          v38 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v37, v38))
          {
            v39 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v25;
            v45 = 2112;
            v46 = v39;
            _os_log_impl(&dword_219EF1000, v37, v38, "Setting CanExtendSession to %@ for interface %@", buf, 0x16u);
          }
          NetIFWiFiNetworkSetCaptivePortalCanExtendSession((uint64_t)v22, v25);
        }
        if (v26)
        {
          v40 = mysyslog_get_logger();
          v41 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v40, v41))
          {
            v42 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v26;
            v45 = 2112;
            v46 = v42;
            _os_log_impl(&dword_219EF1000, v40, v41, "Setting SessionExpiration to %@ for interface %@", buf, 0x16u);
          }
          NetIFWiFiNetworkSetCaptivePortalSessionExpiration((uint64_t)v22, v26);
          CFRelease(v26);
        }
        CFRelease(v22);
      }
      else
      {
        v28 = mysyslog_get_logger();
        v29 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v28, v29))
        {
          v30 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v30;
          _os_log_impl(&dword_219EF1000, v28, v29, "NetIFCopyCurrentWiFiNetwork returned NULL for interface %@ ", buf, 0xCu);
        }
      }
    }
  }
}

void CaptiveHandleCredentials(uint64_t a1, const __CFDictionary *a2)
{
  const __CFDictionary *v4;
  const __CFString *v5;
  CFRunLoopRef Current;
  _BYTE *v7;
  __CFRunLoopTimer *v8;
  const __CFAllocator *v9;
  CFAbsoluteTime v10;
  CFRunLoopTimerRef v11;
  __CFRunLoop *v12;
  NSObject *logger;
  os_log_type_t v14;
  mach_port_t v15;
  const void *v16;
  __CFDictionary *v17;
  CFRunLoopTimerContext v18;

  *(_QWORD *)(a1 + 184) = 0;
  CaptiveSetStage(a1, (__CFString *)kStage_Login);
  if (a2)
  {
    v4 = *(const __CFDictionary **)(a1 + 128);
    v5 = *(const __CFString **)(a1 + 32);
    Current = CFRunLoopGetCurrent();
    v7 = captive_agent_login(v4, v5, a2, (uint64_t)Current, (uint64_t)CaptiveHandleAuthenticateResult, a1);
    *(_QWORD *)(a1 + 80) = v7;
    if (v7)
    {
LABEL_3:
      v18.version = 0;
      memset(&v18.retain, 0, 24);
      v18.info = (void *)a1;
      v8 = *(__CFRunLoopTimer **)(a1 + 208);
      if (v8)
      {
        CFRunLoopTimerInvalidate(v8);
        CFRelease(*(CFTypeRef *)(a1 + 208));
      }
      v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v10 = CFAbsoluteTimeGetCurrent();
      v11 = CFRunLoopTimerCreate(v9, v10 + 15.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)CaptiveAuthTimerCallback, &v18);
      *(_QWORD *)(a1 + 208) = v11;
      if (v11)
      {
        v12 = CFRunLoopGetCurrent();
        CFRunLoopAddTimer(v12, *(CFRunLoopTimerRef *)(a1 + 208), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
      }
      logger = mysyslog_get_logger();
      v14 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v14))
      {
        LOWORD(v18.version) = 0;
        _os_log_impl(&dword_219EF1000, logger, v14, "Authenticating...", (uint8_t *)&v18, 2u);
      }
      return;
    }
  }
  else if (*(_QWORD *)(a1 + 80))
  {
    goto LABEL_3;
  }
  v15 = *(_DWORD *)(a1 + 192);
  if (v15)
  {
    AuthenticateUsingReply(v15, -1);
    *(_DWORD *)(a1 + 192) = 0;
  }
  else
  {
    v16 = *(const void **)(a1 + 256);
    ++*(_DWORD *)(a1 + 168);
    if ((CaptiveTryNextAccount(a1) & 1) == 0 && v16)
    {
      CaptiveSetStage(a1, kStage_UIRequired[0]);
      v17 = ResponseDictCreate(v16, 2);
      CNBuiltinPluginProvideResponse(v17);
      CFRelease(v17);
      CaptiveSetStage(a1, kStage_UIRequired[0]);
    }
  }
}

uint64_t CaptiveAuthenticateUsingToken(CFTypeRef cf2, const __CFString *a2, int a3)
{
  uint64_t *v6;
  const void *v8;
  _QWORD *Start;

  v6 = &S_stateHeadStorage;
  do
  {
    v6 = (uint64_t *)*v6;
    if (!v6)
      return 22;
  }
  while (!CFEqual((CFTypeRef)v6[4], cf2));
  if (v6[23])
    return 16;
  CaptiveSetStage((uint64_t)v6, (__CFString *)kStage_CredQuery);
  *((_DWORD *)v6 + 48) = a3;
  v8 = (const void *)v6[22];
  if (v8)
  {
    CFRelease(v8);
    v6[22] = 0;
  }
  if (!a2)
    a2 = (const __CFString *)v6[6];
  Start = CNAccountsCredentialsQueryStart(0, a2, v6[4], v6[16], (uint64_t)CaptiveHandleTokenCredentials, (uint64_t)v6);
  v6[23] = (uint64_t)Start;
  if (Start)
    return 0;
  *((_DWORD *)v6 + 48) = 0;
  return 0xFFFFFFFFLL;
}

void CaptiveHandleTokenCredentials(uint64_t a1, const __CFDictionary *a2)
{
  const __CFString *v4;
  CFRunLoopRef Current;
  _QWORD *v6;
  NSObject *logger;
  os_log_type_t v8;
  mach_port_t v9;
  const void *v10;
  __CFDictionary *v11;
  uint8_t v12[16];

  *(_QWORD *)(a1 + 184) = 0;
  CaptiveSetStage(a1, (__CFString *)kStage_Login);
  if (a2)
  {
    v4 = *(const __CFString **)(a1 + 32);
    Current = CFRunLoopGetCurrent();
    v6 = captive_agent_token_login(v4, a2, 0x1EuLL, (uint64_t)Current, (uint64_t)CaptiveHandleTokenAuthResponse, a1);
    *(_QWORD *)(a1 + 80) = v6;
    if (v6)
      goto LABEL_3;
  }
  else if (*(_QWORD *)(a1 + 80))
  {
LABEL_3:
    logger = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_219EF1000, logger, v8, "Authenticating using token...", v12, 2u);
    }
    return;
  }
  v9 = *(_DWORD *)(a1 + 192);
  if (v9)
  {
    AuthenticateUsingReply(v9, -1);
    *(_DWORD *)(a1 + 192) = 0;
  }
  else
  {
    v10 = *(const void **)(a1 + 256);
    if (v10)
    {
      CaptiveSetStage(a1, kStage_UIRequired[0]);
      v11 = ResponseDictCreate(v10, 2);
      CNBuiltinPluginProvideResponse(v11);
      CFRelease(v11);
      CaptiveSetStage(a1, kStage_UIRequired[0]);
    }
  }
}

BOOL CaptiveIsActive()
{
  return gActive != 0;
}

BOOL CaptiveIsDebug()
{
  return gDebug != 0;
}

BOOL CaptiveIsUIRequired(CFTypeRef cf2)
{
  uint64_t *v2;

  v2 = &S_stateHeadStorage;
  while (1)
  {
    v2 = (uint64_t *)*v2;
    if (!v2)
      break;
    if (CFEqual((CFTypeRef)v2[4], cf2))
      return WebSheetStateGetIsUIRequired(v2[28]) != 0;
  }
  return 0;
}

BOOL CaptiveIsWebSheetStagePending()
{
  uint64_t *v0;
  NSObject *logger;
  os_log_type_t v2;
  uint8_t v4[16];

  v0 = &S_stateHeadStorage;
  while (1)
  {
    v0 = (uint64_t *)*v0;
    if (!v0)
      break;
    if (v0[8] == kStage_WebSheet)
    {
      logger = mysyslog_get_logger();
      v2 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v2))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_219EF1000, logger, v2, "WebSheetStagePending == TRUE", v4, 2u);
      }
      return v0 != 0;
    }
  }
  return v0 != 0;
}

void start()
{
  NSObject *logger;
  os_log_type_t v1;
  const char *v2;
  int v3;
  int v4;
  NSObject *v5;
  os_log_type_t v6;
  pthread_t v7;
  uint8_t buf[4];
  int v9;
  pthread_attr_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  memset(&v10, 0, sizeof(v10));
  sConfigdRunLoop = (uint64_t)CFRunLoopGetCurrent();
  if (!CNSRegisterServer())
  {
    logger = mysyslog_get_logger();
    v1 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v1))
      return;
    *(_WORD *)buf = 0;
    v2 = "CNSRegisterServer failed";
    goto LABEL_7;
  }
  if (pthread_attr_init(&v10))
  {
    logger = mysyslog_get_logger();
    v1 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v1))
      return;
    *(_WORD *)buf = 0;
    v2 = "pthread_attr_init failed";
    goto LABEL_7;
  }
  if (pthread_attr_setdetachstate(&v10, 2))
  {
    logger = mysyslog_get_logger();
    v1 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v1))
    {
      *(_WORD *)buf = 0;
      v2 = "pthread_attr_setdetachstate failed";
LABEL_7:
      _os_log_impl(&dword_219EF1000, logger, v1, v2, buf, 2u);
    }
  }
  else if (pthread_create(&v7, &v10, (void *(__cdecl *)(void *))captived_thread, 0))
  {
    logger = mysyslog_get_logger();
    v1 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v1))
    {
      *(_WORD *)buf = 0;
      v2 = "pthread_create failed";
      goto LABEL_7;
    }
  }
  else
  {
    pthread_mutex_lock(&sLock);
    while (!sStopThreadSource)
    {
      v3 = pthread_cond_wait(&sCond, &sLock);
      if (v3)
      {
        v4 = v3;
        v5 = mysyslog_get_logger();
        v6 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v5, v6))
        {
          *(_DWORD *)buf = 67109120;
          v9 = v4;
          _os_log_impl(&dword_219EF1000, v5, v6, "pthread_cond_wait failed: %d", buf, 8u);
        }
      }
    }
    pthread_mutex_unlock(&sLock);
    pthread_attr_destroy(&v10);
  }
}

uint64_t captived_thread()
{
  CFRunLoopSourceContext v1;

  memset(&v1, 0, 72);
  v1.perform = (void (__cdecl *)(void *))captived_thread_stop;
  pthread_mutex_lock(&sLock);
  gThreadRunLoop = (uint64_t)CFRunLoopGetCurrent();
  sStopThreadSource = (uint64_t)CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &v1);
  CFRunLoopAddSource((CFRunLoopRef)gThreadRunLoop, (CFRunLoopSourceRef)sStopThreadSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  pthread_mutex_unlock(&sLock);
  pthread_cond_signal(&sCond);
  S_stateHeadStorage = 0;
  CaptivePrefsInit((__CFRunLoop *)gThreadRunLoop, (uint64_t (*)(void))prefs_changed);
  mysyslog_init_logger(0);
  CaptiveCheckPreferences(1);
  if (gActive)
  {
    UIAllowedRegisterForCallbacks((uint64_t (*)(_QWORD))CaptiveHandleUIAllowedChange);
    WebSheetHandlerInitialize((uint64_t (*)(_QWORD, _QWORD, _QWORD))CaptiveWebsheetDone);
    CNPluginHandlerInitialize((uint64_t)CaptiveBuiltinPluginProcessCommand);
  }
  CNSStartServer();
  CFRunLoopRun();
  pthread_mutex_lock(&sLock);
  gThreadRunLoop = 0;
  sStopThreadSource = 0;
  if (sStopConfigdSource)
  {
    CFRunLoopSourceSignal((CFRunLoopSourceRef)sStopConfigdSource);
    CFRunLoopWakeUp((CFRunLoopRef)sConfigdRunLoop);
  }
  pthread_mutex_unlock(&sLock);
  CNSShutdownServer();
  return 0;
}

uint64_t stop(__CFRunLoopSource *a1)
{
  pthread_mutex_lock(&sLock);
  if (sStopThreadSource)
  {
    sStopConfigdSource = (uint64_t)a1;
    CFRunLoopSourceSignal((CFRunLoopSourceRef)sStopThreadSource);
    CFRunLoopWakeUp((CFRunLoopRef)gThreadRunLoop);
  }
  else
  {
    CFRunLoopSourceSignal(a1);
  }
  return pthread_mutex_unlock(&sLock);
}

void CaptiveHandleAuthenticateResult(uint64_t a1, CFDictionaryRef theDict)
{
  const void *v2;
  __CFRunLoopTimer *v5;
  const void *v6;
  const __CFString *Value;
  SInt32 IntValue;
  SInt32 v9;
  const __CFString *v10;
  SInt32 v11;
  const void *v12;
  NSObject *v13;
  os_log_type_t v14;
  const __CFArray *v15;
  const void *ValueAtIndex;
  unsigned int v17;
  NSObject *logger;
  os_log_type_t v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  NSObject *v24;
  os_log_type_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  const void *v30;
  mach_port_t v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFDictionary *v37;
  const __CFDictionary *v38;
  const __CFArray *v39;
  CFTypeID TypeID;
  CFStringRef v41;
  CFStringRef v42;
  int v43;
  NSObject *v44;
  os_log_type_t v45;
  const char *v46;
  mach_port_t v47;
  NSObject *v48;
  os_log_type_t v49;
  int v50;
  __CFRunLoopTimer *v51;
  const __CFAllocator *v52;
  CFAbsoluteTime Current;
  CFRunLoopTimerRef v54;
  __CFRunLoop *v55;
  __CFDictionary *v56;
  NSObject *v57;
  os_log_type_t v58;
  const char *v59;
  const char *v60;
  const __CFString *v61;
  const __CFString *v62;
  const char *v63;
  const char *v64;
  __CFDictionary *v65;
  CFNumberRef v66;
  _BYTE v67[32];
  _BYTE v68[10];
  __int16 v69;
  const __CFString *v70;
  __int16 v71;
  const char *v72;
  uint64_t v73;
  CFRange v74;

  v73 = *MEMORY[0x24BDAC8D0];
  v2 = *(const void **)(a1 + 256);
  *(_QWORD *)(a1 + 80) = 0;
  if (!v2)
    return;
  v5 = *(__CFRunLoopTimer **)(a1 + 208);
  if (v5)
  {
    CFRunLoopTimerInvalidate(v5);
    v6 = *(const void **)(a1 + 208);
    if (v6)
    {
      CFRelease(v6);
      *(_QWORD *)(a1 + 208) = 0;
    }
  }
  if (!theDict)
  {
    logger = mysyslog_get_logger();
    v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v19))
    {
      *(_WORD *)v67 = 0;
      v20 = "Login attempt failed, no response.";
      v21 = logger;
      v22 = v19;
      v23 = 2;
LABEL_16:
      _os_log_impl(&dword_219EF1000, v21, v22, v20, v67, v23);
    }
LABEL_49:
    CaptiveSetStage(a1, kStage_UIRequired[0]);
    v56 = ResponseDictCreate(v2, 2);
    CNBuiltinPluginProvideResponse(v56);
    CFRelease(v56);
    return;
  }
  Value = (const __CFString *)CFDictionaryGetValue(theDict, kWISPrMessageType[0]);
  IntValue = CFStringGetIntValue(Value);
  if (IntValue != 120)
  {
    v9 = IntValue;
    if (IntValue != 140)
    {
      v24 = mysyslog_get_logger();
      v25 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v24, v25))
      {
        *(_QWORD *)v67 = 0x7804000300;
        *(_WORD *)&v67[8] = 1024;
        *(_DWORD *)&v67[10] = 140;
        *(_WORD *)&v67[14] = 1024;
        *(_DWORD *)&v67[16] = v9;
        v20 = "Expected AuthNotify message (%d) or AuthPollReply message (%d), received %d";
        v21 = v24;
        v22 = v25;
        v23 = 20;
        goto LABEL_16;
      }
      goto LABEL_49;
    }
  }
  v10 = (const __CFString *)CFDictionaryGetValue(theDict, kWISPrResponseCode[0]);
  v11 = CFStringGetIntValue(v10);
  v12 = CFDictionaryGetValue(theDict, kWISPrReplyMessage[0]);
  v13 = mysyslog_get_logger();
  v14 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v13, v14))
  {
    *(_DWORD *)v67 = 67109378;
    *(_DWORD *)&v67[4] = v11;
    *(_WORD *)&v67[8] = 2112;
    *(_QWORD *)&v67[10] = v12;
    _os_log_impl(&dword_219EF1000, v13, v14, "AuthNotify responseCode=%d, reply message=%@", v67, 0x12u);
  }
  v15 = *(const __CFArray **)(a1 + 160);
  if (v15)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v15, *(int *)(a1 + 168));
    v17 = CNAccountsIsCarrierCredential(ValueAtIndex);
  }
  else
  {
    v17 = 0;
    ValueAtIndex = 0;
  }
  if (v11 == 50)
  {
    v26 = mysyslog_get_logger();
    v27 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = *(_QWORD *)(a1 + 32);
      v29 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)v67 = 138412546;
      *(_QWORD *)&v67[4] = v28;
      *(_WORD *)&v67[12] = 2112;
      *(_QWORD *)&v67[14] = v29;
      _os_log_impl(&dword_219EF1000, v26, v27, "%@: Login succeeded on '%@'", v67, 0x16u);
    }
    v30 = *(const void **)(a1 + 136);
    if (v30)
      CFRelease(v30);
    *(_QWORD *)(a1 + 136) = theDict;
    CFRetain(theDict);
    v31 = *(_DWORD *)(a1 + 192);
    if (v31)
    {
      AuthenticateUsingReply(v31, 0);
      *(_DWORD *)(a1 + 192) = 0;
      v32 = *(const __CFString **)(a1 + 176);
      v33 = *(const __CFString **)(a1 + 48);
      v34 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 128), kWISPrLoginURL[0]);
      CNAccountsAddInternal(v32, 0, v33, v34, 1, 0);
    }
    v35 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kWISPrLogoffURL[0]);
    v36 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kWISPrRedirectionURL[0]);
    if (!v36)
      goto LABEL_52;
    v37 = CaptiveCopyCarrierSettings(*(const void **)(a1 + 48));
    if (v37)
    {
      v38 = v37;
      v39 = (const __CFArray *)CFDictionaryGetValue(v37, CFSTR("LandingPageURLHostNameMatchList"));
      TypeID = CFArrayGetTypeID();
      if (v39 && CFGetTypeID(v39) == TypeID && (v41 = URLStringCopyHostName(v36)) != 0)
      {
        v42 = v41;
        v74.length = CFArrayGetCount(v39);
        v74.location = 0;
        v43 = CFArrayContainsValue(v39, v74, v42);
        v44 = mysyslog_get_logger();
        v45 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v44, v45))
        {
          v46 = "";
          if (!v43)
            v46 = " not";
          *(_DWORD *)v67 = 138412546;
          *(_QWORD *)&v67[4] = v42;
          *(_WORD *)&v67[12] = 2080;
          *(_QWORD *)&v67[14] = v46;
          _os_log_impl(&dword_219EF1000, v44, v45, "%@ is%s in the LandingPageURLHostNameMatchList", v67, 0x16u);
        }
        CFRelease(v42);
        CFRelease(v38);
        if (v43)
          goto LABEL_52;
      }
      else
      {
        CFRelease(v38);
      }
    }
    v36 = 0;
LABEL_52:
    v57 = mysyslog_get_logger();
    v58 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = " (LogoffURL=";
      *(_DWORD *)v67 = 136316418;
      v60 = "";
      if (!v35)
        v59 = "";
      *(_QWORD *)&v67[4] = v59;
      v61 = &stru_24DC17C58;
      if (v35)
        v62 = v35;
      else
        v62 = &stru_24DC17C58;
      *(_WORD *)&v67[12] = 2112;
      *(_QWORD *)&v67[14] = v62;
      if (v35)
        v63 = ")";
      else
        v63 = "";
      *(_WORD *)&v67[22] = 2080;
      *(_QWORD *)&v67[24] = v63;
      v64 = " (RedirectionURL=";
      *(_WORD *)v68 = 2080;
      if (!v36)
        v64 = "";
      *(_QWORD *)&v68[2] = v64;
      if (v36)
        v61 = v36;
      v69 = 2112;
      if (v36)
        v60 = ")";
      v70 = v61;
      v71 = 2080;
      v72 = v60;
      _os_log_impl(&dword_219EF1000, v57, v58, "Online%s%@%s%s%@%s", v67, 0x3Eu);
    }
    v65 = ResponseDictCreate(v2, 0);
    if (v36)
    {
      *(_QWORD *)v67 = mach_absolute_time();
      v66 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, v67);
      CFDictionarySetValue(v65, CFSTR("RedirectionURL"), v36);
      CFDictionarySetValue(v65, CFSTR("RedirectionURLGenerationID"), v66);
      CFRelease(v66);
    }
    if (v35)
      CFDictionarySetValue(v65, CFSTR("LogoffURL"), v35);
    CFDictionarySetValue(v65, CFSTR("WISPrLoginUsed"), (const void *)*MEMORY[0x24BDBD270]);
    CNBuiltinPluginProvideResponse(v65);
    CFRelease(v65);
    CaptiveSetStage(a1, kStage_Online[0]);
    return;
  }
  v47 = *(_DWORD *)(a1 + 192);
  if (v47)
  {
    AuthenticateUsingReply(v47, v11);
    *(_DWORD *)(a1 + 192) = 0;
    goto LABEL_49;
  }
  if (v11 == 100)
    CNAccountsRejected(ValueAtIndex, *(const void **)(a1 + 48), *(_QWORD *)(a1 + 128), (uint64_t)theDict);
  if (v17)
  {
    ++*(_DWORD *)(a1 + 248);
    v48 = mysyslog_get_logger();
    v49 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = *(_DWORD *)(a1 + 248);
      *(_DWORD *)v67 = 67109634;
      *(_DWORD *)&v67[4] = v50;
      *(_WORD *)&v67[8] = 1024;
      *(_DWORD *)&v67[10] = 3;
      *(_WORD *)&v67[14] = 2112;
      *(_QWORD *)&v67[16] = v12;
      _os_log_impl(&dword_219EF1000, v48, v49, "Carrier login attempt (%d of %d) failed: %@", v67, 0x18u);
    }
    v51 = *(__CFRunLoopTimer **)(a1 + 200);
    if (v51)
    {
      CFRunLoopTimerInvalidate(v51);
      CFRelease(*(CFTypeRef *)(a1 + 200));
    }
    if (*(int *)(a1 + 248) <= 2)
    {
      *(_QWORD *)v67 = 0;
      *(_OWORD *)&v67[16] = 0u;
      *(_QWORD *)v68 = 0;
      *(_QWORD *)&v67[8] = a1;
      v52 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      Current = CFAbsoluteTimeGetCurrent();
      v54 = CFRunLoopTimerCreate(v52, Current + 1.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)CaptiveRetryCarrierCredentials, (CFRunLoopTimerContext *)v67);
      *(_QWORD *)(a1 + 200) = v54;
      if (v54)
      {
        v55 = CFRunLoopGetCurrent();
        CFRunLoopAddTimer(v55, *(CFRunLoopTimerRef *)(a1 + 200), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
        return;
      }
    }
  }
  ++*(_DWORD *)(a1 + 168);
  if ((CaptiveTryNextAccount(a1) & 1) == 0)
    goto LABEL_49;
}

const __CFArray *CaptiveTryNextAccount(uint64_t a1)
{
  const __CFArray *result;
  CFIndex v3;
  CFIndex v4;
  const void *ValueAtIndex;
  NSObject *logger;
  os_log_type_t v7;
  int v8;
  void (*v9)(uint64_t, const __CFDictionary *);
  const __CFString *v10;
  _QWORD *Start;
  uint64_t v12;
  const void *v13;
  uint8_t buf[4];
  const void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  result = *(const __CFArray **)(a1 + 160);
  if (result)
  {
    v3 = *(int *)(a1 + 168);
    if (CFArrayGetCount(result) <= v3)
    {
      return 0;
    }
    else
    {
      CaptiveSetStage(a1, (__CFString *)kStage_CredQuery);
      v4 = *(int *)(a1 + 168);
      if (CFArrayGetCount(*(CFArrayRef *)(a1 + 160)) <= v4)
      {
LABEL_14:
        v13 = *(const void **)(a1 + 160);
        if (v13)
        {
          CFRelease(v13);
          *(_QWORD *)(a1 + 160) = 0;
        }
        result = 0;
        *(_DWORD *)(a1 + 168) = 0;
      }
      else
      {
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 160), *(int *)(a1 + 168));
          logger = mysyslog_get_logger();
          v7 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v7))
          {
            *(_DWORD *)buf = 138412290;
            v15 = ValueAtIndex;
            _os_log_impl(&dword_219EF1000, logger, v7, "Resolving account %@", buf, 0xCu);
          }
          v8 = *(_DWORD *)(a1 + 268);
          v9 = v8 == 2 ? CaptiveHandleTokenCredentials : CaptiveHandleCredentials;
          v10 = v8 == 2 ? 0 : (const __CFString *)ValueAtIndex;
          Start = CNAccountsCredentialsQueryStart(v10, *(const __CFString **)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 128), (uint64_t)v9, a1);
          *(_QWORD *)(a1 + 184) = Start;
          if (Start)
            return (const __CFArray *)1;
          *(_DWORD *)(a1 + 248) = 0;
          v12 = *(int *)(a1 + 168);
          *(_DWORD *)(a1 + 168) = v12 + 1;
          if (CFArrayGetCount(*(CFArrayRef *)(a1 + 160)) <= v12 + 1)
            goto LABEL_14;
        }
      }
    }
  }
  return result;
}

__CFDictionary *ResponseDictCreate(const void *a1, int a2)
{
  __CFDictionary *Mutable;
  CFNumberRef v4;
  int valuePtr;

  valuePtr = a2;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("UniqueID"), a1);
  v4 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("Result"), v4);
  CFRelease(v4);
  return Mutable;
}

void CaptiveRetryCarrierCredentials(uint64_t a1, uint64_t a2)
{
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  NSObject *logger;
  os_log_type_t v11;
  uint64_t v12;
  _QWORD *v13;
  const void *v14;
  NSObject *v15;
  os_log_type_t v16;
  __CFString **v17;
  __CFDictionary *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = *(const void **)(a2 + 200);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a2 + 200) = 0;
  }
  v4 = *(const void **)(a2 + 112);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a2 + 112) = 0;
  }
  v5 = *(const void **)(a2 + 128);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a2 + 128) = 0;
  }
  v6 = *(const void **)(a2 + 136);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a2 + 136) = 0;
  }
  v7 = *(const void **)(a2 + 232);
  if (v7)
  {
    CFRelease(v7);
    *(_QWORD *)(a2 + 232) = 0;
  }
  v8 = *(const void **)(a2 + 240);
  if (v8)
  {
    CFRelease(v8);
    *(_QWORD *)(a2 + 240) = 0;
  }
  v9 = *(const void **)(a2 + 40);
  if (v9)
  {
    CFRelease(v9);
    *(_QWORD *)(a2 + 40) = 0;
  }
  logger = mysyslog_get_logger();
  v11 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v11))
  {
    v12 = *(_QWORD *)(a2 + 32);
    v19 = 138412290;
    v20 = v12;
    _os_log_impl(&dword_219EF1000, logger, v11, "%@: Retrying probe for carrier login", (uint8_t *)&v19, 0xCu);
  }
  v13 = captive_agent_send_probe(*(const void **)(a2 + 48), *(const __CFString **)(a2 + 32), 0, *(const __CFString **)(a2 + 112), 0x28u, (uint64_t)CaptiveHandleRedirect, a2, gThreadRunLoop);
  *(_QWORD *)(a2 + 72) = v13;
  if (!v13)
  {
    v14 = *(const void **)(a2 + 256);
    v15 = mysyslog_get_logger();
    v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_219EF1000, v15, v16, "Probe: captive_agent_send_probe failed", (uint8_t *)&v19, 2u);
    }
    if (v14)
    {
      v17 = kStage_UIRequired;
      CaptiveSetStage(a2, kStage_UIRequired[0]);
      v18 = ResponseDictCreate(v14, 2);
      CNBuiltinPluginProvideResponse(v18);
      CFRelease(v18);
    }
    else
    {
      v17 = &kStage_Unknown;
    }
    CaptiveSetStage(a2, *v17);
  }
}

CFMutableDictionaryRef CaptiveCopyCarrierSettings(const void *a1)
{
  CFRunLoopRef Current;
  NSObject *logger;
  os_log_type_t v4;
  const __CFDictionary *v5;
  const void *v6;
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v9;
  CFMutableDictionaryRef MutableCopy;
  uint8_t v12[16];

  if (!sCarrierBundleChangedRef)
  {
    CNAccountsImportCarrierCredentials();
    Current = CFRunLoopGetCurrent();
    sCarrierBundleChangedRef = (uint64_t)_CBAccessConnectionCreate((uint64_t)CaptiveSIMChanged, (uint64_t)Current, *MEMORY[0x24BDBD5A0]);
    if (!sCarrierBundleChangedRef)
    {
      logger = mysyslog_get_logger();
      v4 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v4))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_219EF1000, logger, v4, "_CBAccessConnectionCreate() returned NULL", v12, 2u);
      }
    }
  }
  v5 = (const __CFDictionary *)CopyCarrierAccountSettings((uint64_t)CFSTR("CaptiveSettings"));
  v6 = (const void *)CopyCarrierAccountSettings((uint64_t)CFSTR("CaptiveSettingsBySSID"));
  TypeID = CFDictionaryGetTypeID();
  if (!v6)
    return v5;
  if (CFGetTypeID(v6) != TypeID)
    goto LABEL_10;
  Value = CFDictionaryGetValue((CFDictionaryRef)v6, a1);
  v9 = CFDictionaryGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == v9)
    {
      CFRetain(Value);
      goto LABEL_11;
    }
LABEL_10:
    Value = 0;
  }
LABEL_11:
  CFRelease(v6);
  if (v5 && Value)
  {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, (CFDictionaryRef)Value);
    if (MutableCopy)
      CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)CaptiveMergeDictionaryApplier, MutableCopy);
    CFRelease(Value);
    CFRelease(v5);
  }
  else if (Value)
  {
    return (CFMutableDictionaryRef)Value;
  }
  else
  {
    return v5;
  }
  return MutableCopy;
}

void CaptiveSIMChanged()
{
  NSObject *logger;
  os_log_type_t v1;
  uint8_t v2[16];

  logger = mysyslog_get_logger();
  v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_219EF1000, logger, v1, "Detected updated carrier settings", v2, 2u);
  }
  CNAccountsImportCarrierCredentials();
}

void CaptiveMergeDictionaryApplier(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionaryAddValue(theDict, key, value);
}

void CaptiveHandleRedirect(uint64_t a1, int a2, const __CFDictionary *a3)
{
  const void *v3;
  unsigned int v5;
  int v7;
  char v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  const void *v19;
  int ConfidenceFromAccounts;
  NSObject *logger;
  os_log_type_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  const void *Value;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  const __CFString *v47;
  const __CFDictionary *v48;
  const __CFDictionary *v49;
  const void *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  NSObject *v61;
  os_log_type_t v62;
  uint32_t v63;
  NSObject *v64;
  os_log_type_t v65;
  __CFDictionary *v66;
  __CFDictionary *v67;
  __CFDictionary *v68;
  SInt32 v69;
  const void *v70;
  NSObject *v71;
  os_log_type_t v72;
  uint64_t v73;
  const void *v74;
  const void *v75;
  os_log_t v76;
  os_log_type_t v77;
  NSObject *v78;
  os_log_type_t v79;
  const void *v80;
  NSObject *v81;
  os_log_type_t v82;
  SInt32 IntValue;
  NSObject *v84;
  int v85;
  uint8_t buf[4];
  _BYTE v87[10];
  void *v88;
  __int16 v89;
  uint64_t v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v3 = *(const void **)(a1 + 256);
  *(_QWORD *)(a1 + 72) = 0;
  if (v3)
  {
    v5 = a2;
    v7 = 1;
    switch(a2)
    {
      case 4:
        logger = mysyslog_get_logger();
        v22 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(logger, v22))
          goto LABEL_29;
        v23 = *(_QWORD *)(a1 + 32);
        v24 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v87 = v23;
        *(_WORD *)&v87[8] = 2112;
        v88 = v24;
        v25 = "%@: received too big html document on '%@'";
        goto LABEL_28;
      case 7:
      case 8:
      case 10:
      case 11:
      case 13:
        goto LABEL_3;
      case 14:
        v26 = mysyslog_get_logger();
        v27 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v26, v27))
        {
          v28 = *(_QWORD *)(a1 + 32);
          v29 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v87 = v28;
          *(_WORD *)&v87[8] = 2112;
          v88 = v29;
          _os_log_impl(&dword_219EF1000, v26, v27, "%@: received TLS connection abort on '%@'", buf, 0x16u);
        }
        v7 = 0;
        v8 = 1;
        goto LABEL_30;
      case 15:
        logger = mysyslog_get_logger();
        v22 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v22))
        {
          v30 = *(_QWORD *)(a1 + 32);
          v31 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v87 = v30;
          *(_WORD *)&v87[8] = 2112;
          v88 = v31;
          v25 = "%@: failed to trust the server certificate chain on '%@'";
LABEL_28:
          _os_log_impl(&dword_219EF1000, logger, v22, v25, buf, 0x16u);
        }
LABEL_29:
        v8 = 0;
        v7 = 0;
LABEL_30:
        v5 = 3;
        goto LABEL_31;
      default:
        v7 = 0;
LABEL_3:
        v8 = 1;
        if (a2 > 10)
        {
          if (a2 == 11)
          {
            v9 = "Unknown state: Assuming not captive";
            goto LABEL_14;
          }
          if (a2 == 12)
          {
            v9 = "Probe whitelist detected: Marking as not captive";
            goto LABEL_14;
          }
        }
        else
        {
          if (!a2)
          {
            v9 = "No redirect detected";
            goto LABEL_14;
          }
          if (a2 == 9)
          {
            v9 = "Web proxy detected: Assuming not captive";
LABEL_14:
            v12 = mysyslog_get_logger();
            v13 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v12, v13))
            {
              v14 = *(void **)(a1 + 32);
              v15 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)v87 = v9;
              *(_WORD *)&v87[8] = 2112;
              v88 = v14;
              v89 = 2112;
              v90 = v15;
              _os_log_impl(&dword_219EF1000, v12, v13, "%s on %@ (%@)", buf, 0x20u);
            }
            v16 = *(_QWORD *)(a1 + 64);
            if (v16 == kStage_Maintain || v16 == kStage_Login)
              CaptiveSetStage(a1, kStage_Online[0]);
            v17 = 0;
            v18 = 0;
            v19 = 0;
            ConfidenceFromAccounts = 0;
            goto LABEL_79;
          }
        }
LABEL_31:
        if (*(_QWORD *)(a1 + 64) == kStage_Login)
          v7 = 2;
        if ((v5 & 0xFFFFFFFE) == 2)
        {
          v32 = mysyslog_get_logger();
          v33 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v32, v33))
          {
            v34 = *(_QWORD *)(a1 + 32);
            v35 = "WISPr";
            v36 = *(_QWORD *)(a1 + 48);
            if (v5 == 3)
              v35 = "Redirect";
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v87 = v34;
            *(_WORD *)&v87[8] = 2080;
            v88 = (void *)v35;
            v89 = 2112;
            v90 = v36;
            _os_log_impl(&dword_219EF1000, v32, v33, "%@: %s detected on '%@'", buf, 0x20u);
          }
          if (*(_QWORD *)(a1 + 64) == kStage_Maintain)
            v7 = 4;
          v18 = 1;
        }
        else
        {
          v18 = 0;
        }
        switch(v5)
        {
          case 3u:
            if (a3)
            {
              v37 = mysyslog_get_logger();
              v38 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v37, v38))
              {
                v39 = *(_QWORD *)(a1 + 32);
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v87 = v39;
                *(_WORD *)&v87[8] = 2112;
                v88 = a3;
                _os_log_impl(&dword_219EF1000, v37, v38, "%@: detected HTTP redirect %@", buf, 0x16u);
              }
              Value = CFDictionaryGetValue(a3, kInitialURL[0]);
              v19 = CFDictionaryGetValue(a3, kRedirectHostname[0]);
              if (Value)
              {
                my_FieldSetRetainedCFType((const void **)(a1 + 112), Value);
                v41 = mysyslog_get_logger();
                v42 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v41, v42))
                {
                  v43 = *(_QWORD *)(a1 + 112);
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v87 = v43;
                  _os_log_impl(&dword_219EF1000, v41, v42, "InitialURL: %@:", buf, 0xCu);
                }
              }
            }
            else
            {
              if ((v8 & 1) == 0)
              {
                v48 = (const __CFDictionary *)CaptiveCopyProbeSettings();
                if (v48)
                {
                  v49 = v48;
                  v50 = CFDictionaryGetValue(v48, CFSTR("ProbeURL"));
                  if (isA_CFString(v50))
                  {
                    my_FieldSetRetainedCFType((const void **)(a1 + 112), v50);
                    v51 = mysyslog_get_logger();
                    v52 = _SC_syslog_os_log_mapping();
                    if (os_log_type_enabled(v51, v52))
                    {
                      v53 = *(_QWORD *)(a1 + 112);
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)v87 = v53;
                      _os_log_impl(&dword_219EF1000, v51, v52, "InitialURL: %@:", buf, 0xCu);
                    }
                  }
                  CFRelease(v49);
                }
              }
              v19 = 0;
            }
            if (_os_feature_enabled_impl())
            {
              v54 = mysyslog_get_logger();
              v55 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v54, v55))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_219EF1000, v54, v55, "AirPlay/SetupAssistantCaptivePortalMitigation feature is enabled", buf, 2u);
              }
              ConfidenceFromAccounts = GetConfidenceFromAccounts(a1);
              if (ConfidenceFromAccounts)
              {
                v17 = 4 * (*(_DWORD *)(a1 + 268) == 2);
                goto LABEL_77;
              }
              CaptiveSetStage(a1, kStage_UIRequired[0]);
            }
            else
            {
              CaptiveSetStage(a1, kStage_UIRequired[0]);
              ConfidenceFromAccounts = 0;
            }
            v17 = 1;
LABEL_77:
            if (v7 != 1)
              goto LABEL_79;
            goto LABEL_78;
          case 6u:
            v56 = mysyslog_get_logger();
            v57 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v56, v57))
            {
              v58 = *(_QWORD *)(a1 + 32);
              v59 = *(void **)(a1 + 48);
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v87 = v58;
              *(_WORD *)&v87[8] = 2112;
              v88 = v59;
              v60 = "Timed out on %@ (%@), assuming online";
              v61 = v56;
              v62 = v57;
              v63 = 22;
LABEL_73:
              _os_log_impl(&dword_219EF1000, v61, v62, v60, buf, v63);
            }
            break;
          case 2u:
            if (a3)
            {
              v44 = mysyslog_get_logger();
              v45 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v44, v45))
              {
                v46 = *(_QWORD *)(a1 + 32);
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v87 = v46;
                *(_WORD *)&v87[8] = 2112;
                v88 = a3;
                _os_log_impl(&dword_219EF1000, v44, v45, "%@: detected WISPr %@", buf, 0x16u);
              }
              v47 = (const __CFString *)CFDictionaryGetValue(a3, kWISPrMessageType[0]);
              v85 = v18;
              if (v47)
                IntValue = CFStringGetIntValue(v47);
              else
                IntValue = 0;
              v19 = CFDictionaryGetValue(a3, kRedirectHostname[0]);
              v70 = CFDictionaryGetValue(a3, kInitialURL[0]);
              if (v70)
              {
                my_FieldSetRetainedCFType((const void **)(a1 + 112), v70);
                v71 = mysyslog_get_logger();
                v72 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v71, v72))
                {
                  v73 = *(_QWORD *)(a1 + 112);
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v87 = v73;
                  _os_log_impl(&dword_219EF1000, v71, v72, "InitialURL: %@:", buf, 0xCu);
                }
              }
              v69 = IntValue;
              if (IntValue == 100)
              {
                v74 = CFDictionaryGetValue(a3, kLocationURL[0]);
                v18 = v85;
                if (v74)
                {
                  v75 = v74;
                  v76 = mysyslog_get_logger();
                  v77 = _SC_syslog_os_log_mapping();
                  v84 = v76;
                  v78 = v76;
                  v79 = v77;
                  if (os_log_type_enabled(v78, v77))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v87 = v75;
                    _os_log_impl(&dword_219EF1000, v84, v79, "LocationURL: %@:", buf, 0xCu);
                  }
                }
                v80 = *(const void **)(a1 + 128);
                if (v80)
                  CFRelease(v80);
                *(_QWORD *)(a1 + 128) = a3;
                CFRetain(a3);
                if (*(_QWORD *)(a1 + 64) == kStage_Login)
                {
                  if ((CaptiveTryNextAccount(a1) & 1) != 0)
                    return;
                  CaptiveSetStage(a1, kStage_UIRequired[0]);
                  ConfidenceFromAccounts = 0;
                }
                else
                {
                  ConfidenceFromAccounts = GetConfidenceFromAccounts(a1);
                  if (!ConfidenceFromAccounts)
                    CaptiveSetStage(a1, kStage_UIRequired[0]);
                }
                v17 = 2;
                goto LABEL_77;
              }
              v18 = v85;
            }
            else
            {
              v19 = 0;
              v69 = 0;
            }
            v81 = mysyslog_get_logger();
            v82 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v81, v82))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v87 = v69;
              *(_WORD *)&v87[4] = 1024;
              *(_DWORD *)&v87[6] = 100;
              _os_log_impl(&dword_219EF1000, v81, v82, "Received message type %d, expected kWISPrMsg_Redirect (%d)", buf, 0xEu);
            }
            CaptiveSetStage(a1, kStage_UIRequired[0]);
            v17 = 0;
            ConfidenceFromAccounts = 0;
            v5 = 2;
LABEL_79:
            if (*(_BYTE *)(a1 + 254))
            {
              if ((v5 & 0xFFFFFFFE) == 2)
                v66 = (__CFDictionary *)CaptiveCopyAuthenticationResult(a1, 0, v3);
              else
                v66 = ResponseDictCreate(v3, v7);
              v68 = v66;
            }
            else
            {
              v67 = ResponseDictCreate(v3, v7);
              v68 = v67;
              if (!v7)
                ResponseDictSetIsCaptiveAndConfidence(v67, v18, ConfidenceFromAccounts, v17);
            }
            if (v68)
            {
              if (v19)
                CFDictionarySetValue(v68, CFSTR("RedirectHostname"), v19);
              CNBuiltinPluginProvideResponse(v68);
              CFRelease(v68);
            }
            return;
          default:
            v64 = mysyslog_get_logger();
            v65 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v64, v65))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)v87 = v5;
              v60 = "Unknown result value: %d, assuming online";
              v61 = v64;
              v62 = v65;
              v63 = 8;
              goto LABEL_73;
            }
            break;
        }
        ConfidenceFromAccounts = 0;
        v19 = 0;
        v17 = 0;
LABEL_78:
        CaptiveAnalyticsSessionPostInconclusiveEvent(v5);
        v7 = 1;
        goto LABEL_79;
    }
  }
  v10 = mysyslog_get_logger();
  v11 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v10, v11))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219EF1000, v10, v11, "no command to be processed", buf, 2u);
  }
}

const void *isA_CFString(const void *a1)
{
  CFTypeID TypeID;

  TypeID = CFStringGetTypeID();
  if (!a1)
    return 0;
  if (CFGetTypeID(a1) == TypeID)
    return a1;
  return 0;
}

uint64_t GetConfidenceFromAccounts(uint64_t a1)
{
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  uint64_t v5;
  CFIndex v6;
  const void *ValueAtIndex;
  const __CFString *v8;
  int v10;

  v2 = *(const __CFArray **)(a1 + 160);
  if (!v2)
  {
    v2 = CNAccountsCopyMatching(*(_QWORD *)(a1 + 48), *(const __CFDictionary **)(a1 + 128));
    *(_QWORD *)(a1 + 160) = v2;
    *(_DWORD *)(a1 + 168) = 0;
    if (!v2)
      return 0;
  }
  Count = CFArrayGetCount(v2);
  if (Count < 1)
    return 0;
  v4 = Count;
  LODWORD(v5) = 0;
  v6 = 0;
  while (1)
  {
    v10 = 0;
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 160), v6);
    v8 = (const __CFString *)CNAccountsLookupPasswordType(ValueAtIndex);
    if (CNAccountsLookupAuthType(ValueAtIndex, &v10) == 1)
      *(_DWORD *)(a1 + 268) = v10;
    if (CFStringCompare(v8, CFSTR("Keychain"), 0))
      break;
    ++v6;
    v5 = 1;
    if (v4 == v6)
      return v5;
  }
  if (CNAccountsCredentialsValidate(ValueAtIndex) == 1)
    return 2;
  else
    return v5;
}

__CFDictionary *CaptiveCopyAuthenticationResult(uint64_t a1, const __CFDictionary *a2, const void *a3)
{
  const void *v6;
  __CFDictionary *v7;
  __CFString *v9;
  char v10;

  v6 = *(const void **)(a1 + 40);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a1 + 40) = 0;
  }
  if (CaptiveBypass(a2, *(const void **)(a1 + 48), &v10))
  {
    CaptiveSetStage(a1, kStage_Online[0]);
    v7 = ResponseDictCreate(a3, 0);
    CFDictionarySetValue(v7, CFSTR("DisableMaintaining"), (const void *)*MEMORY[0x24BDBD270]);
    return v7;
  }
  v9 = *(__CFString **)(a1 + 64);
  if (v9 != kStage_UIRequired[0])
  {
    if (CaptiveTryNextAccount(a1))
    {
      my_FieldSetRetainedCFType((const void **)(a1 + 256), a3);
      return 0;
    }
    v9 = kStage_UIRequired[0];
  }
  CaptiveSetStage(a1, v9);
  return ResponseDictCreate(a3, 2);
}

void ResponseDictSetIsCaptiveAndConfidence(__CFDictionary *a1, int a2, int a3, int a4)
{
  const __CFAllocator *v6;
  __CFDictionary *Mutable;
  __CFDictionary *v8;
  const void **v9;
  CFNumberRef v10;
  CFNumberRef v11;
  int v12;
  int valuePtr;

  v12 = a4;
  valuePtr = a3;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = Mutable;
  v9 = (const void **)MEMORY[0x24BDBD270];
  if (!a2)
    v9 = (const void **)MEMORY[0x24BDBD268];
  CFDictionarySetValue(Mutable, CFSTR("IsCaptive"), *v9);
  if (a2)
  {
    v10 = CFNumberCreate(v6, kCFNumberSInt32Type, &valuePtr);
    CFDictionarySetValue(v8, CFSTR("Confidence"), v10);
    CFRelease(v10);
    v11 = CFNumberCreate(v6, kCFNumberSInt32Type, &v12);
    CFDictionarySetValue(v8, CFSTR("DetectionType"), v11);
    CFRelease(v11);
  }
  CFDictionarySetValue(a1, CFSTR("Network"), v8);
  CFRelease(v8);
}

uint64_t CaptiveBypass(const __CFDictionary *a1, const void *a2, _BYTE *a3)
{
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v8;
  uint64_t result;
  const void *v10;
  const __CFBoolean *v11;
  CFTypeID v12;
  int v13;

  TypeID = CFDictionaryGetTypeID();
  if (a1)
  {
    if (CFGetTypeID(a1) == TypeID)
    {
      Value = CFDictionaryGetValue(a1, CFSTR("CaptiveBypass"));
      v8 = CFBooleanGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == v8 && CFBooleanGetValue((CFBooleanRef)Value))
        {
          *a3 = 0;
          return 1;
        }
      }
    }
  }
  if (a2)
  {
    result = (uint64_t)CaptiveCopyCarrierSettings(a2);
    if (!result)
      return result;
    v10 = (const void *)result;
    v11 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("Bypass"));
    v12 = CFBooleanGetTypeID();
    if (v11 && CFGetTypeID(v11) == v12)
    {
      v13 = CFBooleanGetValue(v11);
      CFRelease(v10);
      if (v13)
      {
        result = 1;
        *a3 = 1;
        return result;
      }
    }
    else
    {
      CFRelease(v10);
    }
  }
  return 0;
}

void CaptiveAuthTimerCallback(uint64_t a1, uint64_t a2)
{
  NSObject *logger;
  os_log_type_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  mach_port_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v4 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v4))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_219EF1000, logger, v4, "Authentication timed out", (uint8_t *)&v9, 2u);
  }
  if (*(_QWORD *)(a2 + 64) == kStage_Login)
  {
    CaptiveSetStage(a2, (__CFString *)kStage_WebSheet);
    v8 = *(_DWORD *)(a2 + 192);
    if (v8)
    {
      AuthenticateUsingReply(v8, -1);
      *(_DWORD *)(a2 + 192) = 0;
    }
    else
    {
      CaptiveInteract(a2);
    }
  }
  else
  {
    v5 = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = *(_QWORD *)(a2 + 64);
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_219EF1000, v5, v6, "Authentication Timed out in incorrect stage=%@", (uint8_t *)&v9, 0xCu);
    }
  }
}

void CaptiveInteract(uint64_t a1)
{
  __CFString *v2;
  uint64_t v3;
  NSObject *logger;
  os_log_type_t v5;
  CFIndex v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  NSObject *v11;
  os_log_type_t v12;
  CFIndex v13;
  uint64_t v14;
  CFIndex v15;
  void *v16;
  CFRunLoopTimerRef *v17;
  __CFRunLoopTimer *v18;
  const void *v19;
  double v20;
  double v21;
  const void *v22;
  NSObject *v23;
  os_log_type_t v24;
  CFIndex v25;
  __CFDictionary *v26;
  NSObject *v27;
  uint64_t v28;
  CFAbsoluteTime Current;
  NSObject *v30;
  os_log_type_t v31;
  __CFRunLoop *v32;
  int v33;
  double v34;
  CFRunLoopTimerContext buf;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (UIAllowed())
  {
    *(_BYTE *)(a1 + 252) = 0;
    if (*(_QWORD *)(a1 + 112))
      v2 = *(__CFString **)(a1 + 112);
    else
      v2 = CFSTR("http://www.apple.com/");
    v3 = *(_QWORD *)(a1 + 224);
    logger = mysyslog_get_logger();
    if (v3)
    {
      v5 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(logger, v5))
        return;
      v6 = *(_QWORD *)(a1 + 32);
      LODWORD(buf.version) = 138412546;
      *(CFIndex *)((char *)&buf.version + 4) = v6;
      WORD2(buf.info) = 2112;
      *(void **)((char *)&buf.info + 6) = v2;
      v7 = "%@: Websheet already exists, urlstr = %@";
      v8 = logger;
      v9 = v5;
      v10 = 22;
      goto LABEL_8;
    }
    v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, (os_log_type_t)v14))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(a1 + 48);
      LODWORD(buf.version) = 138412802;
      *(CFIndex *)((char *)&buf.version + 4) = v15;
      WORD2(buf.info) = 2112;
      *(void **)((char *)&buf.info + 6) = v16;
      HIWORD(buf.retain) = 2112;
      buf.release = (void (__cdecl *)(const void *))v2;
      _os_log_impl(&dword_219EF1000, logger, (os_log_type_t)v14, "%@: Launching Websheet on SSID %@ with URL \"%@\"", (uint8_t *)&buf, 0x20u);
    }
    v17 = WebSheetStateLaunchApplication((__CFRunLoopTimer *)a1, *(const void **)(a1 + 32), v2, *(const void **)(a1 + 48));
    *(_QWORD *)(a1 + 224) = v17;
    if (v17)
    {
      WebSheetStateSetIsAllowed((uint64_t)v17, 1);
      CaptiveSetStage(a1, (__CFString *)kStage_WebSheet);
      if (!IsWebSheetRestrictionEnabled() || !*(_QWORD *)(a1 + 224) || *(_QWORD *)(a1 + 64) != kStage_WebSheet)
        goto LABEL_38;
      v18 = *(__CFRunLoopTimer **)(a1 + 216);
      if (v18)
      {
        CFRunLoopTimerInvalidate(v18);
        v19 = *(const void **)(a1 + 216);
        if (v19)
        {
          CFRelease(v19);
          *(_QWORD *)(a1 + 216) = 0;
        }
      }
      if (ApplyWebSheetRunTimeRestriction_retry > 3)
        goto LABEL_38;
      buf.version = 0;
      memset(&buf.retain, 0, 24);
      buf.info = (void *)a1;
      v20 = *(double *)&S_WebSheetInSetupDismissalInterval;
      if (ApplyWebSheetRunTimeRestriction_retry == 3)
      {
        v21 = 0.333333333;
      }
      else
      {
        if (ApplyWebSheetRunTimeRestriction_retry != 2)
        {
LABEL_34:
          Current = CFAbsoluteTimeGetCurrent();
          *(_QWORD *)(a1 + 216) = CFRunLoopTimerCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v20 + Current, 0.0, 0, 0, (CFRunLoopTimerCallBack)WebSheetDismissalTimerCallback, &buf);
          v30 = mysyslog_get_logger();
          v31 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v30, v31))
          {
            v33 = 134217984;
            v34 = v20;
            _os_log_impl(&dword_219EF1000, v30, v31, "scheduling WebSheet dismissal after %g seconds", (uint8_t *)&v33, 0xCu);
          }
          v32 = CFRunLoopGetCurrent();
          CFRunLoopAddTimer(v32, *(CFRunLoopTimerRef *)(a1 + 216), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
          if (++ApplyWebSheetRunTimeRestriction_retry == 4)
            S_canLaunchWebSheetInSetupAssistantMode = 1;
LABEL_38:
          WebSheetStateSetIsUIRequired(*(_QWORD *)(a1 + 224), 1);
          return;
        }
        v21 = 0.666666667;
      }
      v20 = *(double *)&S_WebSheetInSetupDismissalInterval * v21;
      goto LABEL_34;
    }
    v22 = *(const void **)(a1 + 256);
    v23 = mysyslog_get_logger();
    v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = *(_QWORD *)(a1 + 32);
      LODWORD(buf.version) = 138412290;
      *(CFIndex *)((char *)&buf.version + 4) = v25;
      _os_log_impl(&dword_219EF1000, v23, v24, "%@: Unknown (websheet failed)", (uint8_t *)&buf, 0xCu);
    }
    CaptiveSetStage(a1, kStage_Unknown);
    if (v22)
    {
      v26 = ResponseDictCreate(v22, 0);
      CNBuiltinPluginProvideResponse(v26);
      CFRelease(v26);
    }
    else
    {
      v27 = mysyslog_get_logger();
      v28 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v27, (os_log_type_t)v28))
      {
        LOWORD(buf.version) = 0;
        v7 = "no uniqueID";
        v8 = v27;
        v9 = v28;
        v10 = 2;
LABEL_8:
        _os_log_impl(&dword_219EF1000, v8, v9, v7, (uint8_t *)&buf, v10);
      }
    }
  }
  else if (!*(_BYTE *)(a1 + 252))
  {
    v11 = mysyslog_get_logger();
    v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = *(_QWORD *)(a1 + 32);
      LODWORD(buf.version) = 138412290;
      *(CFIndex *)((char *)&buf.version + 4) = v13;
      _os_log_impl(&dword_219EF1000, v11, v12, "%@ waiting for UI", (uint8_t *)&buf, 0xCu);
    }
    *(_BYTE *)(a1 + 252) = 1;
  }
}

BOOL IsWebSheetRestrictionEnabled()
{
  int v0;
  NSObject *logger;
  os_log_type_t v2;
  const char *v3;
  _BOOL8 result;
  int v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v0 = _AMIsDeviceSetupCompleted();
  logger = mysyslog_get_logger();
  v2 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v2))
  {
    v3 = "completed";
    if (!v0)
      v3 = "not completed";
    v8 = 136315138;
    v9 = v3;
    _os_log_impl(&dword_219EF1000, logger, v2, "device setup is %s", (uint8_t *)&v8, 0xCu);
  }
  if (v0)
    return 0;
  v5 = _AMIsDeviceActivated();
  v6 = mysyslog_get_logger();
  v7 = _SC_syslog_os_log_mapping();
  result = os_log_type_enabled(v6, v7);
  if (v5)
  {
    if (result)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_219EF1000, v6, v7, "device activation is completed", (uint8_t *)&v8, 2u);
      return 0;
    }
  }
  else
  {
    if (result)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_219EF1000, v6, v7, "device activation is not completed", (uint8_t *)&v8, 2u);
    }
    return 1;
  }
  return result;
}

void WebSheetDismissalTimerCallback(uint64_t a1, uint64_t a2)
{
  NSObject *logger;
  os_log_type_t v4;
  __CFDictionary *v5;
  uint8_t v6[16];

  if (a2 && *(_QWORD *)(a2 + 64) == kStage_WebSheet && *(_QWORD *)(a2 + 224))
  {
    logger = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_219EF1000, logger, v4, "dismissing WebSheet and tearing down Wi-Fi association ...", v6, 2u);
    }
    WebSheetStateIssueExitCommand(*(_QWORD *)(a2 + 224));
    WebSheetStateSetIsAllowed(*(_QWORD *)(a2 + 224), 0);
    *(_QWORD *)(a2 + 224) = 0;
    v5 = ResponseDictCreate(*(const void **)(a2 + 256), 1);
    CNBuiltinPluginProvideResponse(v5);
    CFRelease(v5);
    CaptiveSetStage(a2, kStage_Unknown);
  }
}

void CaptiveHandleTokenAuthResponse(uint64_t a1, unsigned int a2, const void *a3)
{
  const void *v6;
  NSObject *logger;
  os_log_type_t v8;
  __CFRunLoopTimer *v9;
  const void *v10;
  int v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  int v17;
  const __CFBoolean *v18;
  __CFString **v19;
  NSObject *v20;
  uint64_t v21;
  mach_port_t v22;
  __CFDictionary *v23;
  __CFDictionary *v24;
  NSObject *v25;
  os_log_type_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  const __CFBoolean *Value;
  CFTypeID v31;
  const __CFBoolean *v32;
  const __CFBoolean *v33;
  CFTypeID v34;
  const void *v35;
  const __CFString *v36;
  int v37;
  _BYTE v38[18];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = *(const void **)(a1 + 256);
  logger = mysyslog_get_logger();
  v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v8))
  {
    v37 = 67109378;
    *(_DWORD *)v38 = a2;
    *(_WORD *)&v38[4] = 2114;
    *(_QWORD *)&v38[6] = a3;
    _os_log_impl(&dword_219EF1000, logger, v8, "received token authentication result with code:[%d], result: %{public}@", (uint8_t *)&v37, 0x12u);
  }
  *(_QWORD *)(a1 + 96) = 0;
  if (v6)
  {
    v9 = *(__CFRunLoopTimer **)(a1 + 208);
    if (v9)
    {
      CFRunLoopTimerInvalidate(v9);
      v10 = *(const void **)(a1 + 208);
      if (v10)
      {
        CFRelease(v10);
        *(_QWORD *)(a1 + 208) = 0;
      }
    }
    v11 = 0;
    if (a2 > 0x13)
    {
      LODWORD(v18) = 0;
      v17 = 0;
      goto LABEL_19;
    }
    if (((1 << a2) & 0xEEDC2) != 0)
    {
      v12 = mysyslog_get_logger();
      v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v12, v13))
      {
        v37 = 67109120;
        *(_DWORD *)v38 = a2;
        _os_log_impl(&dword_219EF1000, v12, v13, "Token Authentication failed, result: %d", (uint8_t *)&v37, 8u);
      }
      if (a2 - 17 > 2)
      {
        v11 = 0;
        LODWORD(v18) = 0;
        v17 = 1;
        goto LABEL_19;
      }
      CNAccountsPurgeSSID(*(const void **)(a1 + 48));
      v14 = mysyslog_get_logger();
      v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = *(_QWORD *)(a1 + 48);
        v37 = 138412290;
        *(_QWORD *)v38 = v16;
        _os_log_impl(&dword_219EF1000, v14, v15, "purged account record for SSID: [%@]", (uint8_t *)&v37, 0xCu);
      }
      v11 = 0;
      v17 = 2;
      LODWORD(v18) = 1;
      v19 = kStage_UIRequired;
LABEL_15:
      CaptiveSetStage(a1, *v19);
LABEL_19:
      v22 = *(_DWORD *)(a1 + 192);
      if (v22)
      {
        AuthenticateUsingReply(v22, a2);
        *(_DWORD *)(a1 + 192) = 0;
      }
      v23 = ResponseDictCreate(v6, v17);
      v24 = v23;
      if (!v17)
        ResponseDictSetIsCaptiveAndConfidence(v23, (int)v18, v11, 4);
      if (v24)
      {
        CNBuiltinPluginProvideResponse(v24);
        CFRelease(v24);
      }
      return;
    }
    LODWORD(v18) = 0;
    v17 = 0;
    if (a2)
      goto LABEL_19;
    v25 = mysyslog_get_logger();
    v26 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v25, v26))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_219EF1000, v25, v26, "Token Authentication was successful", (uint8_t *)&v37, 2u);
    }
    if (a3)
    {
      v27 = mysyslog_get_logger();
      v28 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = *(_QWORD *)(a1 + 32);
        v37 = 138412546;
        *(_QWORD *)v38 = v29;
        *(_WORD *)&v38[8] = 2112;
        *(_QWORD *)&v38[10] = a3;
        _os_log_impl(&dword_219EF1000, v27, v28, "%@: received Token Authentication state %@", (uint8_t *)&v37, 0x16u);
      }
      my_FieldSetRetainedCFType((const void **)(a1 + 152), a3);
      Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a3, kTokenAuthWebSheetRequired[0]);
      v18 = Value;
      if (Value)
      {
        v31 = CFGetTypeID(Value);
        if (v31 == CFBooleanGetTypeID())
          LODWORD(v18) = CFBooleanGetValue(v18);
        else
          LODWORD(v18) = 0;
      }
      v32 = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a3, kTokenAuthAccessTokenUsed[0]);
      if (v32 && (v33 = v32, v34 = CFGetTypeID(v32), v34 == CFBooleanGetTypeID()) && CFBooleanGetValue(v33))
        v35 = CFDictionaryGetValue((CFDictionaryRef)a3, kTokenAuthAccessToken[0]);
      else
        v35 = 0;
      v36 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a3, kTokenAuthLoginURL[0]);
      v11 = 2;
      CNAccountsAddInternal(0, v35, *(const __CFString **)(a1 + 48), v36, 2, 0);
      if ((_DWORD)v18)
      {
        v19 = kStage_UIRequired;
        v17 = 2;
        goto LABEL_15;
      }
    }
    else
    {
      v11 = 0;
    }
    LODWORD(v18) = 0;
    v17 = 0;
    v19 = kStage_Online;
    goto LABEL_15;
  }
  v20 = mysyslog_get_logger();
  v21 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v20, (os_log_type_t)v21))
  {
    LOWORD(v37) = 0;
    _os_log_impl(&dword_219EF1000, v20, (os_log_type_t)v21, "no command to be processed", (uint8_t *)&v37, 2u);
  }
}

void captived_thread_stop()
{
  CFRunLoopStop((CFRunLoopRef)gThreadRunLoop);
}

void CaptiveWebsheetDone(uint64_t *a1, int a2, uint64_t a3)
{
  int v4;
  uint64_t *v5;
  BOOL v6;
  NSObject *logger;
  os_log_type_t v8;
  const void *v9;
  __CFString *v10;
  char v11;
  const char *v12;
  unsigned int v13;
  char v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  __CFDictionary *v21;
  __CFDictionary *v22;
  const void **v23;
  const __CFDictionary *APIStateSecondsRemaining;
  __CFString *v25;
  uint8_t buf[4];
  _BYTE v27[18];
  uint64_t v28;

  v4 = a2;
  v28 = *MEMORY[0x24BDAC8D0];
  v5 = &S_stateHeadStorage;
  do
  {
    v5 = (uint64_t *)*v5;
    if (v5)
      v6 = v5 == a1;
    else
      v6 = 1;
  }
  while (!v6);
  if (v5)
  {
    if (!a2 || (v5[28] = 0, a2 != 6))
    {
      logger = mysyslog_get_logger();
      v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v8))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v27 = v4;
        *(_WORD *)&v27[4] = 2112;
        *(_QWORD *)&v27[6] = a3;
        _os_log_impl(&dword_219EF1000, logger, v8, "WebSheet Complete, result=%d, options: %@", buf, 0x12u);
      }
      v9 = (const void *)v5[32];
      if (v9)
      {
        v25 = (__CFString *)kStage_Offline;
        v10 = 0;
        v11 = 1;
        v12 = "cancelled";
        v13 = 4;
        v14 = 1;
        switch(v4)
        {
          case 0:
            v13 = 0;
            v11 = 0;
            v4 = 0;
            v25 = kStage_Online[0];
            LOBYTE(v10) = 1;
            v12 = "success";
            goto LABEL_24;
          case 1:
            goto LABEL_24;
          case 2:
            LOBYTE(v10) = 0;
            v11 = 0;
            v4 = 6;
            v13 = 2;
            v12 = "died";
            goto LABEL_24;
          case 3:
            v13 = 0;
            v11 = 0;
            v4 = 6;
            LOBYTE(v10) = 1;
            v12 = "timed out";
            goto LABEL_24;
          case 4:
            LOBYTE(v10) = 0;
            v4 = 6;
            v13 = 2;
            v12 = "closed";
            goto LABEL_24;
          case 5:
            LOBYTE(v10) = 0;
            v14 = 0;
            v4 = 0;
            v25 = kStage_Unknown;
            v12 = "remain associated";
            v13 = 3;
LABEL_24:
            v19 = mysyslog_get_logger();
            v20 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v19, v20))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v27 = v25;
              *(_WORD *)&v27[8] = 2080;
              *(_QWORD *)&v27[10] = v12;
              _os_log_impl(&dword_219EF1000, v19, v20, "%@ (websheet: %s)", buf, 0x16u);
            }
            if ((v10 & 1) == 0)
              CaptiveAnalyticsSessionPostIncompleteEvent(v13);
            v10 = v25;
            break;
          default:
            v17 = mysyslog_get_logger();
            v18 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v17, v18))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)v27 = 0;
              *(_WORD *)&v27[8] = 1024;
              *(_DWORD *)&v27[10] = v4;
              _os_log_impl(&dword_219EF1000, v17, v18, "%@ (websheet: result %d)", buf, 0x12u);
            }
            v11 = 0;
            v4 = 6;
            v14 = 1;
            break;
        }
        *((_BYTE *)v5 + 253) = v11;
        CaptiveSetStage((uint64_t)v5, v10);
        v21 = ResponseDictCreate(v9, v4);
        v22 = v21;
        v23 = (const void **)MEMORY[0x24BDBD270];
        if (*((_BYTE *)v5 + 253))
          CFDictionarySetValue(v21, CFSTR("DisableMaintaining"), (const void *)*MEMORY[0x24BDBD270]);
        if ((v14 & 1) == 0)
          CFDictionarySetValue(v22, CFSTR("DisableAutologin"), *v23);
        if (v10 == kStage_Online[0])
          CFDictionarySetValue(v22, CFSTR("UpdateWebSheetLoginDate"), *v23);
        APIStateSecondsRemaining = CaptiveGetAPIStateSecondsRemaining((const __CFDictionary *)v5);
        if (APIStateSecondsRemaining)
          CFDictionarySetValue(v22, CFSTR("APIStateSecondsRemaining"), APIStateSecondsRemaining);
        CNBuiltinPluginProvideResponse(v22);
        CFRelease(v22);
      }
      else
      {
        v15 = mysyslog_get_logger();
        v16 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v15, v16))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219EF1000, v15, v16, "no uniqueID", buf, 2u);
        }
      }
    }
  }
}

void CaptiveBuiltinPluginProcessCommand(const __CFDictionary *a1)
{
  const void *Value;
  CFTypeID TypeID;
  void *v4;
  const __CFString *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const void *v8;
  const void *v9;
  const __CFBoolean *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t *v14;
  uint64_t v15;
  NSObject *logger;
  os_log_type_t v17;
  uint64_t v18;
  const void *v19;
  int v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  CFTypeID v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  const __CFString *v31;
  __CFDictionary *v32;
  __CFDictionary *v33;
  int ConfidenceFromAccounts;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  __CFString *v39;
  __CFDictionary *API;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  const __CFString *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  __CFDictionary *v57;
  uint64_t v58;
  const void *v59;
  __CFRunLoopTimer *v60;
  const void *v61;
  NSObject *v62;
  os_log_type_t v63;
  BOOL v64;
  const char *v65;
  NSObject *v66;
  os_log_type_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  uint64_t v73;
  __CFString *v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  CFTypeID v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  const __CFDate *LastWebSheetLoginDate;
  const __CFDate *v85;
  CFAbsoluteTime Current;
  const __CFDate *v87;
  NSObject *v88;
  os_log_type_t v89;
  CFTimeInterval TimeIntervalSinceDate;
  CFTypeRef cf;
  char v92;
  int valuePtr;
  uint8_t buf[4];
  uint64_t v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  const __CFString *v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v92 = 0;
  Value = CFDictionaryGetValue(a1, CFSTR("Type"));
  TypeID = CFNumberGetTypeID();
  if (!Value)
    return;
  if (CFGetTypeID(Value) != TypeID)
    return;
  valuePtr = 0;
  if (!CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr))
    return;
  v4 = (void *)CFDictionaryGetValue(a1, CFSTR("UniqueID"));
  v5 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("InterfaceName"));
  v6 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("Network"));
  v7 = v6;
  if (v6)
  {
    v8 = CFDictionaryGetValue(v6, CFSTR("SSIDString"));
    v9 = CFDictionaryGetValue(v7, CFSTR("SSID"));
    cf = CFDictionaryGetValue(v7, CFSTR("BecameCaptive"));
    v10 = (const __CFBoolean *)CFDictionaryGetValue(v7, CFSTR("QuickProbeRequired"));
    v11 = (const __CFString *)CFDictionaryGetValue(v7, CFSTR("PortalURL"));
    if (v11)
    {
      v12 = v11;
      if (CFStringHasPrefix(v11, CFSTR("https://")))
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v10 = 0;
    cf = 0;
    v13 = 0;
    v9 = 0;
    v8 = 0;
  }
  v14 = &S_stateHeadStorage;
  while (1)
  {
    v14 = (uint64_t *)*v14;
    if (!v14)
      break;
    if (CFEqual((CFTypeRef)v14[4], v5))
      goto LABEL_18;
  }
  v14 = (uint64_t *)malloc_type_malloc(0x110uLL, 0x10E0040162B702FuLL);
  *(_OWORD *)v14 = 0u;
  *((_OWORD *)v14 + 2) = 0u;
  *((_OWORD *)v14 + 3) = 0u;
  *((_OWORD *)v14 + 4) = 0u;
  *((_OWORD *)v14 + 5) = 0u;
  *((_OWORD *)v14 + 6) = 0u;
  *((_OWORD *)v14 + 7) = 0u;
  *((_OWORD *)v14 + 8) = 0u;
  *((_OWORD *)v14 + 9) = 0u;
  *((_OWORD *)v14 + 10) = 0u;
  *((_OWORD *)v14 + 11) = 0u;
  *((_OWORD *)v14 + 12) = 0u;
  *((_OWORD *)v14 + 13) = 0u;
  *((_OWORD *)v14 + 14) = 0u;
  *((_OWORD *)v14 + 15) = 0u;
  *((_OWORD *)v14 + 16) = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  v14[4] = (uint64_t)CFRetain(v5);
  CFStringGetCString(v5, (char *)v14 + 16, 16, 0x600u);
  v15 = S_stateHeadStorage;
  *v14 = S_stateHeadStorage;
  if (v15)
    *(_QWORD *)(v15 + 8) = v14;
  S_stateHeadStorage = (uint64_t)v14;
  v14[1] = (uint64_t)&S_stateHeadStorage;
LABEL_18:
  switch(valuePtr)
  {
    case 0:
      logger = mysyslog_get_logger();
      v17 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v17))
      {
        v18 = v14[4];
        *(_DWORD *)buf = 138412546;
        v95 = v18;
        v96 = 2112;
        v97 = v4;
        _os_log_impl(&dword_219EF1000, logger, v17, "%@ None(Cleanup) %@", buf, 0x16u);
      }
      CaptiveStateCleanup((uint64_t)v14, 1);
      return;
    case 2:
      v21 = mysyslog_get_logger();
      v22 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = v14[4];
        *(_DWORD *)buf = 138412546;
        v95 = v23;
        v96 = 2112;
        v97 = v4;
        _os_log_impl(&dword_219EF1000, v21, v22, "%@ Evaluate %@", buf, 0x16u);
      }
      CaptiveStateCleanup((uint64_t)v14, 1);
      my_FieldSetRetainedCFType((const void **)v14 + 32, 0);
      my_FieldSetRetainedCFType((const void **)v14 + 7, v9);
      my_FieldSetRetainedCFType((const void **)v14 + 6, v8);
      my_FieldSetRetainedCFType((const void **)v14 + 15, v13);
      v24 = CFBooleanGetTypeID();
      if (v10 && CFGetTypeID(v10) == v24)
        *((_BYTE *)v14 + 264) = CFBooleanGetValue(v10) != 0;
      v25 = mysyslog_get_logger();
      v26 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = v14[4];
        *(_DWORD *)buf = 138412546;
        v95 = v27;
        v96 = 2112;
        v97 = (void *)v13;
        _os_log_impl(&dword_219EF1000, v25, v26, "%@ Evaluate found portal url %@", buf, 0x16u);
      }
      if (!v8 || !v9)
      {
        v53 = mysyslog_get_logger();
        v54 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v53, v54))
          goto LABEL_76;
        v55 = v14[4];
        *(_DWORD *)buf = 138412290;
        v95 = v55;
        goto LABEL_75;
      }
      if (CaptiveBypass(v7, v8, &v92))
      {
        v28 = mysyslog_get_logger();
        v29 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v28, v29))
        {
          v30 = v14[4];
          if (v92)
            v31 = CFSTR("disabled by carrier");
          else
            v31 = CFSTR("disabled by user");
          *(_DWORD *)buf = 138412802;
          v95 = v30;
          v96 = 2112;
          v97 = (void *)v8;
          v98 = 2112;
          v99 = v31;
          _os_log_impl(&dword_219EF1000, v28, v29, "%@: Not probing '%@' (%@)", buf, 0x20u);
        }
        v32 = ResponseDictCreate(v4, 0);
        v33 = v32;
        ConfidenceFromAccounts = 1;
LABEL_107:
        ResponseDictSetIsCaptiveAndConfidence(v32, 1, ConfidenceFromAccounts, 0);
        goto LABEL_79;
      }
      if (v7
        && !my_CFDictionaryGetBooleanValue(v7, CFSTR("WasCaptive"), 0)
        && my_CFDictionaryGetBooleanValue(v7, CFSTR("IsCached"), 0))
      {
        v79 = mysyslog_get_logger();
        v80 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v79, v80))
        {
          v81 = v14[4];
          *(_DWORD *)buf = 138412546;
          v95 = v81;
          v96 = 2112;
          v97 = (void *)v8;
          _os_log_impl(&dword_219EF1000, v79, v80, "%@: Not probing '%@' (cache indicates not captive)", buf, 0x16u);
        }
        v33 = ResponseDictCreate(v4, 0);
        ResponseDictSetIsCaptiveAndConfidence(v33, 0, 0, 0);
        v74 = kStage_Unknown;
LABEL_113:
        CaptiveSetStage((uint64_t)v14, v74);
        goto LABEL_79;
      }
      if (CNAccountsIsCarrierSSID((uint64_t)v8))
      {
        v68 = mysyslog_get_logger();
        v69 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v68, v69))
        {
          v70 = v14[4];
          *(_DWORD *)buf = 138412546;
          v95 = v70;
          v96 = 2112;
          v97 = (void *)v8;
          _os_log_impl(&dword_219EF1000, v68, v69, "%@: Found carrier network '%@'", buf, 0x16u);
        }
        *((_BYTE *)v14 + 254) = 1;
        v33 = ResponseDictCreate(v4, 0);
        ConfidenceFromAccounts = GetConfidenceFromAccounts((uint64_t)v14);
        v32 = v33;
        goto LABEL_107;
      }
      SendEvaluateAck(v4);
      v39 = (__CFString *)kStage_Evaluate;
      if (!v13)
        goto LABEL_43;
      goto LABEL_125;
    case 3:
      v35 = mysyslog_get_logger();
      v36 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = v14[4];
        v38 = v14[8];
        *(_DWORD *)buf = 138412802;
        v95 = v37;
        v96 = 2112;
        v97 = v4;
        v98 = 2112;
        v99 = (const __CFString *)v38;
        _os_log_impl(&dword_219EF1000, v35, v36, "%@ Authenticate %@ %@", buf, 0x20u);
      }
      if (*((_BYTE *)v14 + 254))
      {
        v39 = (__CFString *)kStage_Evaluate;
        goto LABEL_43;
      }
      my_FieldSetRetainedCFType((const void **)v14 + 32, 0);
      API = CaptiveCopyAuthenticationResult((uint64_t)v14, v7, v4);
      goto LABEL_78;
    case 4:
      v41 = mysyslog_get_logger();
      v42 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = v14[4];
        *(_DWORD *)buf = 138412546;
        v95 = v43;
        v96 = 2112;
        v97 = v4;
        _os_log_impl(&dword_219EF1000, v41, v42, "%@ PresentUI %@", buf, 0x16u);
      }
      my_FieldSetRetainedCFType((const void **)v14 + 32, 0);
      if ((__CFString *)v14[8] != kStage_UIRequired[0])
      {
        v44 = mysyslog_get_logger();
        v45 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v44, v45))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219EF1000, v44, v45, "PresentUI command not expected (not in Websheet stage)", buf, 2u);
        }
        v19 = v4;
        v20 = 0;
LABEL_77:
        API = ResponseDictCreate(v19, v20);
        goto LABEL_78;
      }
      v58 = NetIFCopyCurrentWiFiNetwork(v14[4]);
      if (!v58)
      {
        v75 = mysyslog_get_logger();
        v76 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v75, v76))
        {
          v77 = v14[4];
          *(_DWORD *)buf = 138412290;
          v95 = v77;
          _os_log_impl(&dword_219EF1000, v75, v76, "NetIFCopyCurrentWiFiNetwork returned NULL for interface %@ ", buf, 0xCu);
        }
        goto LABEL_141;
      }
      v59 = (const void *)v58;
      if (IsWebSheetRestrictionEnabled() && S_canLaunchWebSheetInSetupAssistantMode)
      {
        v60 = (__CFRunLoopTimer *)v14[27];
        if (v60)
        {
          CFRunLoopTimerInvalidate(v60);
          v61 = (const void *)v14[27];
          if (v61)
          {
            CFRelease(v61);
            v14[27] = 0;
          }
        }
        v62 = mysyslog_get_logger();
        v63 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v62, v63))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219EF1000, v62, v63, "The device ran out of retries to login to captive network while running in setup assistant mode", buf, 2u);
        }
        v64 = 0;
        v65 = "WebSheet cannot be used in setup assistant mode anymore";
        goto LABEL_93;
      }
      if (NetIFWiFiNetworkWasAutoJoined((uint64_t)v59))
      {
        if (!NetIFWiFiNetworkIsCarPlayAndInternet())
        {
          v78 = CFBooleanGetTypeID();
          if (cf && CFGetTypeID(cf) == v78 && CFBooleanGetValue((CFBooleanRef)cf))
          {
            v64 = 0;
            v65 = "this network has become captive";
            goto LABEL_93;
          }
          LastWebSheetLoginDate = (const __CFDate *)NetIFWiFiNetworkGetLastWebSheetLoginDate();
          if (LastWebSheetLoginDate)
          {
            v85 = LastWebSheetLoginDate;
            Current = CFAbsoluteTimeGetCurrent();
            v87 = CFDateCreate(0, Current);
            v88 = mysyslog_get_logger();
            v89 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v88, v89))
            {
              *(_DWORD *)buf = 138412546;
              v95 = (uint64_t)v87;
              v96 = 2112;
              v97 = v85;
              _os_log_impl(&dword_219EF1000, v88, v89, "Current time : [%@], Last WebSheet Login time: [%@]", buf, 0x16u);
            }
            TimeIntervalSinceDate = CFDateGetTimeIntervalSinceDate(v87, v85);
            v64 = TimeIntervalSinceDate <= *(double *)&S_WebSheetLoginValidityInterval;
            if (TimeIntervalSinceDate > *(double *)&S_WebSheetLoginValidityInterval)
              v65 = "last WebSheet login is older than configured time period";
            else
              v65 = 0;
            if (v87)
              CFRelease(v87);
LABEL_93:
            CFRelease(v59);
            if (!v64 && v65)
            {
              v66 = mysyslog_get_logger();
              v67 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v66, v67))
              {
                *(_DWORD *)buf = 136315394;
                v95 = (uint64_t)v65;
                v96 = 2112;
                v97 = (void *)v8;
                _os_log_impl(&dword_219EF1000, v66, v67, "Unable to launch WebSheet because %s, blacklisting network [%@]", buf, 0x16u);
              }
              v57 = ResponseDictCreate(v4, 6);
              v33 = v57;
              goto LABEL_81;
            }
LABEL_141:
            my_FieldSetRetainedCFType((const void **)v14 + 32, v4);
            CaptiveInteract((uint64_t)v14);
            return;
          }
        }
      }
      else
      {
        v82 = mysyslog_get_logger();
        v83 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v82, v83))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219EF1000, v82, v83, "It's a manual join so no further checks required", buf, 2u);
        }
      }
      CFRelease(v59);
      goto LABEL_141;
    case 5:
      v46 = mysyslog_get_logger();
      v47 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v46, v47))
      {
        v48 = v14[4];
        *(_DWORD *)buf = 138412802;
        v95 = v48;
        v96 = 2112;
        v97 = v4;
        v98 = 2112;
        v99 = v13;
        _os_log_impl(&dword_219EF1000, v46, v47, "%@ Maintain %@ portal url: [%@]", buf, 0x20u);
      }
      if ((__CFString *)v14[8] != kStage_Online[0]
        || v7 && my_CFDictionaryGetBooleanValue(v7, CFSTR("WasJustJoined"), 0))
      {
        CaptiveStateCleanup((uint64_t)v14, 0);
      }
      *((_BYTE *)v14 + 254) = 0;
      my_FieldSetRetainedCFType((const void **)v14 + 32, 0);
      my_FieldSetRetainedCFType((const void **)v14 + 7, v9);
      my_FieldSetRetainedCFType((const void **)v14 + 6, v8);
      my_FieldSetRetainedCFType((const void **)v14 + 15, v13);
      if (v14[9])
        captive_agent_abort_probe(v14 + 9);
      if (v14[10])
        captive_agent_abort_login(v14 + 10);
      if (v14[11])
        captive_agent_abort_query(v14 + 11);
      if (v14[12])
        captive_agent_abort_token_auth(v14 + 12);
      if (!v8 || !v9)
      {
        v53 = mysyslog_get_logger();
        v54 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v53, v54))
          goto LABEL_76;
        v56 = v14[4];
        *(_DWORD *)buf = 138412290;
        v95 = v56;
LABEL_75:
        _os_log_impl(&dword_219EF1000, v53, v54, "%@: ssid is NULL", buf, 0xCu);
LABEL_76:
        CaptiveSetStage((uint64_t)v14, kStage_Unknown);
        v19 = v4;
        v20 = 1;
        goto LABEL_77;
      }
      if (CaptiveBypass(v7, v8, &v92))
      {
        v49 = mysyslog_get_logger();
        v50 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v49, v50))
        {
          v51 = v14[4];
          if (v92)
            v52 = CFSTR("disabled by carrier");
          else
            v52 = CFSTR("disabled by user");
          *(_DWORD *)buf = 138412802;
          v95 = v51;
          v96 = 2112;
          v97 = (void *)v8;
          v98 = 2112;
          v99 = v52;
          _os_log_impl(&dword_219EF1000, v49, v50, "%@: Not probing '%@' (%@)", buf, 0x20u);
        }
        v33 = ResponseDictCreate(v4, 0);
        CFDictionarySetValue(v33, CFSTR("DisableMaintaining"), (const void *)*MEMORY[0x24BDBD270]);
LABEL_112:
        v74 = kStage_Online[0];
        goto LABEL_113;
      }
      if (*((_BYTE *)v14 + 253))
      {
        v71 = mysyslog_get_logger();
        v72 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v71, v72))
        {
          v73 = v14[4];
          *(_DWORD *)buf = 138412546;
          v95 = v73;
          v96 = 2112;
          v97 = (void *)v8;
          _os_log_impl(&dword_219EF1000, v71, v72, "%@: Not probing '%@' (ignoring until next association)", buf, 0x16u);
        }
        v33 = ResponseDictCreate(v4, 0);
        goto LABEL_112;
      }
      v39 = (__CFString *)kStage_Maintain;
      if (v13)
LABEL_125:
        API = CaptiveQueryAPI((uint64_t)v14, v4, v39, v13);
      else
LABEL_43:
        API = CaptiveStartProbe((uint64_t)v14, v4, v39);
LABEL_78:
      v33 = API;
LABEL_79:
      if (v33)
      {
        v57 = v33;
LABEL_81:
        CNBuiltinPluginProvideResponse(v57);
        CFRelease(v33);
      }
      return;
    default:
      v19 = v4;
      v20 = 3;
      goto LABEL_77;
  }
}

void prefs_changed()
{
  CaptiveCheckPreferences(0);
}

void CaptiveCheckPreferences(int a1)
{
  int v2;
  int v3;
  int v4;
  NSObject *logger;
  os_log_type_t v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = gDebug;
  v3 = gVerbose;
  CaptivePrefsRefresh();
  if (a1)
    gActive = CaptivePrefsIsActive();
  gVerbose = CaptivePrefsIsVerbose();
  gDebug = CaptivePrefsIsDebug();
  v4 = gVerbose;
  if (v3 != gVerbose)
  {
    logger = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    v7 = os_log_type_enabled(logger, v6);
    if (v4 == 1)
    {
      if (v7)
      {
        LOWORD(v16) = 0;
        v8 = "Verbose mode enabled";
LABEL_9:
        _os_log_impl(&dword_219EF1000, logger, v6, v8, (uint8_t *)&v16, 2u);
      }
    }
    else if (v7)
    {
      LOWORD(v16) = 0;
      v8 = "Verbose mode disabled";
      goto LABEL_9;
    }
  }
  if (v2 != gDebug)
  {
    v9 = mysyslog_get_logger();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = "disabled";
      if (!v2)
        v11 = "enabled";
      v16 = 136315138;
      v17 = (uint64_t)v11;
      _os_log_impl(&dword_219EF1000, v9, v10, "Debug mode %s", (uint8_t *)&v16, 0xCu);
    }
  }
  CNPluginHandlerCheckPreferences();
  S_WebSheetLoginValidityInterval = CCPGetWebSheetLoginValidityInterval();
  v12 = mysyslog_get_logger();
  v13 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v12, v13))
  {
    v16 = 134217984;
    v17 = S_WebSheetLoginValidityInterval;
    _os_log_impl(&dword_219EF1000, v12, v13, "WebSheetLoginValidityInterval = %g", (uint8_t *)&v16, 0xCu);
  }
  S_WebSheetInSetupDismissalInterval = CCPGetWebSheetInSetupDismissalInterval();
  v14 = mysyslog_get_logger();
  v15 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = 134217984;
    v17 = S_WebSheetInSetupDismissalInterval;
    _os_log_impl(&dword_219EF1000, v14, v15, "WebSheetInSetupDismissalInterval = %g", (uint8_t *)&v16, 0xCu);
  }
}

const __CFDictionary *CaptiveGetAPIStateSecondsRemaining(const __CFDictionary *result)
{
  const __CFNumber *Value;
  CFTypeID TypeID;
  double valuePtr;

  if (result)
  {
    result = (const __CFDictionary *)*((_QWORD *)result + 18);
    if (result)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(result, kCAPPORTSecondsRemaining[0]);
      TypeID = CFNumberGetTypeID();
      if (Value && CFGetTypeID(Value) == TypeID)
      {
        valuePtr = 0.0;
        CFNumberGetValue(Value, kCFNumberDoubleType, &valuePtr);
        if (valuePtr <= 0.0)
          return 0;
        else
          return Value;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

void CaptiveStateCleanup(uint64_t a1, int a2)
{
  NSObject *logger;
  os_log_type_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  uint64_t v15;
  __CFRunLoopTimer *v16;
  const void *v17;
  __CFRunLoopTimer *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  int v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    v6 = *(const char **)(a1 + 64);
    v22 = 138412290;
    v23 = v6;
    _os_log_impl(&dword_219EF1000, logger, v5, "cancelling operations for built-in plugin in stage: [%@]", (uint8_t *)&v22, 0xCu);
  }
  if ((a2 == 1 || *(_QWORD *)(a1 + 64) == kStage_WebSheet) && *(_QWORD *)(a1 + 224))
  {
    v7 = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = "WebSheetStagePending == TRUE. Make Old State Go Away.";
      if (a2 == 1)
        v9 = "Make Stale WebSheet Go Away.";
      v22 = 136315138;
      v23 = v9;
      _os_log_impl(&dword_219EF1000, v7, v8, "%s", (uint8_t *)&v22, 0xCu);
    }
    WebSheetStateIssueExitCommand(*(_QWORD *)(a1 + 224));
    WebSheetStateSetIsAllowed(*(_QWORD *)(a1 + 224), 0);
    *(_QWORD *)(a1 + 224) = 0;
  }
  my_FieldSetRetainedCFType((const void **)(a1 + 256), 0);
  if (*(_QWORD *)(a1 + 72))
    captive_agent_abort_probe((_QWORD *)(a1 + 72));
  if (*(_QWORD *)(a1 + 80))
    captive_agent_abort_login((_QWORD *)(a1 + 80));
  if (*(_QWORD *)(a1 + 88))
    captive_agent_abort_query((_QWORD *)(a1 + 88));
  if (*(_QWORD *)(a1 + 96))
    captive_agent_abort_token_auth((_QWORD *)(a1 + 96));
  v10 = *(const void **)(a1 + 112);
  if (v10)
  {
    CFRelease(v10);
    *(_QWORD *)(a1 + 112) = 0;
  }
  v11 = *(const void **)(a1 + 128);
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(a1 + 128) = 0;
  }
  v12 = *(const void **)(a1 + 136);
  if (v12)
  {
    CFRelease(v12);
    *(_QWORD *)(a1 + 136) = 0;
  }
  my_FieldSetRetainedCFType((const void **)(a1 + 144), 0);
  my_FieldSetRetainedCFType((const void **)(a1 + 152), 0);
  v13 = *(const void **)(a1 + 160);
  if (v13)
  {
    CFRelease(v13);
    *(_QWORD *)(a1 + 160) = 0;
  }
  *(_DWORD *)(a1 + 168) = 0;
  v14 = *(const void **)(a1 + 176);
  if (v14)
  {
    CFRelease(v14);
    *(_QWORD *)(a1 + 176) = 0;
  }
  v15 = *(_QWORD *)(a1 + 184);
  if (v15)
  {
    CNAccountsCredentialsQueryAbort(v15);
    *(_QWORD *)(a1 + 184) = 0;
  }
  *(_DWORD *)(a1 + 192) = 0;
  v16 = *(__CFRunLoopTimer **)(a1 + 200);
  if (v16)
  {
    CFRunLoopTimerInvalidate(v16);
    v17 = *(const void **)(a1 + 200);
    if (v17)
    {
      CFRelease(v17);
      *(_QWORD *)(a1 + 200) = 0;
    }
  }
  v18 = *(__CFRunLoopTimer **)(a1 + 208);
  if (v18)
  {
    CFRunLoopTimerInvalidate(v18);
    v19 = *(const void **)(a1 + 208);
    if (v19)
    {
      CFRelease(v19);
      *(_QWORD *)(a1 + 208) = 0;
    }
  }
  v20 = *(const void **)(a1 + 232);
  if (v20)
  {
    CFRelease(v20);
    *(_QWORD *)(a1 + 232) = 0;
  }
  v21 = *(const void **)(a1 + 240);
  if (v21)
  {
    CFRelease(v21);
    *(_QWORD *)(a1 + 240) = 0;
  }
  *(_DWORD *)(a1 + 248) = 0;
  *(_BYTE *)(a1 + 252) = 0;
  my_FieldSetRetainedCFType((const void **)(a1 + 48), 0);
  my_FieldSetRetainedCFType((const void **)(a1 + 56), 0);
  my_FieldSetRetainedCFType((const void **)(a1 + 120), 0);
  my_FieldSetRetainedCFType((const void **)(a1 + 144), 0);
  *(_WORD *)(a1 + 253) = 0;
  *(_BYTE *)(a1 + 264) = 0;
}

void SendEvaluateAck(void *a1)
{
  CFNumberRef v2;
  CFDictionaryRef v3;
  int valuePtr;
  void *values[2];
  void *keys[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  valuePtr = 2;
  v2 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  *(_OWORD *)keys = xmmword_24DC16A10;
  values[0] = a1;
  values[1] = v2;
  v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CNBuiltinPluginAckEvaluateCommand(v3);
  CFRelease(v2);
  CFRelease(v3);
}

__CFDictionary *CaptiveQueryAPI(uint64_t a1, const void *a2, __CFString *cf1, const __CFString *a4)
{
  int v8;
  NSObject *logger;
  os_log_type_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *api;
  __CFDictionary *v16;
  NSObject *v17;
  os_log_type_t v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = CFEqual(cf1, (CFTypeRef)kStage_Maintain);
  logger = mysyslog_get_logger();
  v10 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v10))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = CFSTR("Maintaining");
    v13 = *(_QWORD *)(a1 + 48);
    if (!v8)
      v12 = CFSTR("Evaluating API");
    v20 = 138412802;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    _os_log_impl(&dword_219EF1000, logger, v10, "%@: %@ '%@'", (uint8_t *)&v20, 0x20u);
    goto LABEL_6;
  }
  if (a1)
  {
LABEL_6:
    v14 = *(_QWORD *)(a1 + 48);
    goto LABEL_7;
  }
  v14 = 0;
LABEL_7:
  api = captive_agent_query_api(v14, *(const __CFString **)(a1 + 32), a4, 0xAu, (uint64_t)CaptiveHandleAPIResponse, a1, gThreadRunLoop);
  *(_QWORD *)(a1 + 88) = api;
  if (api)
  {
    CaptiveSetStage(a1, cf1);
    my_FieldSetRetainedCFType((const void **)(a1 + 256), a2);
    return 0;
  }
  else
  {
    v17 = mysyslog_get_logger();
    v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_219EF1000, v17, v18, "captive_agent_query_api failed", (uint8_t *)&v20, 2u);
    }
    v16 = ResponseDictCreate(a2, 1);
    CaptiveSetStage(a1, kStage_Unknown);
  }
  return v16;
}

__CFDictionary *CaptiveStartProbe(uint64_t a1, const void *a2, __CFString *cf1)
{
  const __CFString *v6;
  NSObject *logger;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  unsigned int v13;
  _QWORD *v14;
  __CFDictionary *v15;
  NSObject *v16;
  os_log_type_t v17;
  int v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("Probing");
  if (!CFEqual(cf1, (CFTypeRef)kStage_Evaluate) && CFEqual(cf1, (CFTypeRef)kStage_Maintain))
    v6 = CFSTR("Maintaining");
  logger = mysyslog_get_logger();
  v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v8))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 48);
    v19 = 138412802;
    v20 = v9;
    v21 = 2112;
    v22 = v6;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_219EF1000, logger, v8, "%@: %@ '%@'", (uint8_t *)&v19, 0x20u);
  }
  if (*(_BYTE *)(a1 + 264))
  {
    v11 = mysyslog_get_logger();
    v12 = _SC_syslog_os_log_mapping();
    v13 = 5;
    if (os_log_type_enabled(v11, v12))
    {
      v19 = 67109120;
      LODWORD(v20) = 5;
      _os_log_impl(&dword_219EF1000, v11, v12, "quick probe is requested, setting timeout to %d seconds", (uint8_t *)&v19, 8u);
    }
  }
  else
  {
    v13 = 40;
  }
  v14 = captive_agent_send_probe(*(const void **)(a1 + 48), *(const __CFString **)(a1 + 32), 0, *(const __CFString **)(a1 + 112), v13, (uint64_t)CaptiveHandleRedirect, a1, gThreadRunLoop);
  *(_QWORD *)(a1 + 72) = v14;
  if (v14)
  {
    CaptiveSetStage(a1, cf1);
    my_FieldSetRetainedCFType((const void **)(a1 + 256), a2);
    return 0;
  }
  else
  {
    v16 = mysyslog_get_logger();
    v17 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v16, v17))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_219EF1000, v16, v17, "captive_agent_send_probe failed", (uint8_t *)&v19, 2u);
    }
    v15 = ResponseDictCreate(a2, 1);
    CaptiveSetStage(a1, kStage_Unknown);
  }
  return v15;
}

void CaptiveHandleAPIResponse(uint64_t a1, int a2, const void *a3)
{
  const void *v3;
  const void *v4;
  int v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *logger;
  os_log_type_t v10;
  uint64_t v11;
  const __CFBoolean *Value;
  const __CFBoolean *v13;
  CFTypeID v14;
  const void *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  __CFString **v19;
  __CFDictionary *v20;
  __CFDictionary *v21;
  const __CFDictionary *APIStateSecondsRemaining;
  int v23;
  uint64_t v24;
  __int16 v25;
  const void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = *(const void **)(a1 + 256);
  *(_QWORD *)(a1 + 88) = 0;
  if (v3)
  {
    v4 = a3;
    if ((a2 - 6) > 9)
    {
      v6 = 0;
      if (!a2)
      {
LABEL_4:
        if (!a3)
          goto LABEL_19;
        goto LABEL_13;
      }
    }
    else
    {
      v6 = dword_219F1D998[a2 - 6];
      if (!a2)
        goto LABEL_4;
    }
    if (a2 != 16)
    {
      LODWORD(v4) = 0;
LABEL_19:
      LODWORD(v13) = 0;
      goto LABEL_27;
    }
    if (*(_QWORD *)(a1 + 64) == kStage_Maintain)
      v6 = 4;
    if (!a3)
      goto LABEL_19;
LABEL_13:
    logger = mysyslog_get_logger();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v10))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v23 = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v4;
      _os_log_impl(&dword_219EF1000, logger, v10, "%@: received Captive API state %@", (uint8_t *)&v23, 0x16u);
    }
    my_FieldSetRetainedCFType((const void **)(a1 + 144), v4);
    Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)v4, kCAPPORTCaptiveFlag[0]);
    v13 = Value;
    if (Value)
    {
      v14 = CFGetTypeID(Value);
      if (v14 == CFBooleanGetTypeID())
        LODWORD(v13) = CFBooleanGetValue(v13);
      else
        LODWORD(v13) = 0;
    }
    v15 = CFDictionaryGetValue((CFDictionaryRef)v4, kCAPPORTUserPortalURL[0]);
    if (v15)
    {
      my_FieldSetRetainedCFType((const void **)(a1 + 112), v15);
      v16 = mysyslog_get_logger();
      v17 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = *(_QWORD *)(a1 + 112);
        v23 = 138412290;
        v24 = v18;
        _os_log_impl(&dword_219EF1000, v16, v17, "InitialURL: %@:", (uint8_t *)&v23, 0xCu);
      }
    }
    v19 = kStage_Online;
    if ((_DWORD)v13)
      v19 = kStage_UIRequired;
    CaptiveSetStage(a1, *v19);
    LODWORD(v4) = 2;
LABEL_27:
    v20 = ResponseDictCreate(v3, v6);
    v21 = v20;
    if (v6)
    {
      if (!(_DWORD)v13)
      {
LABEL_31:
        APIStateSecondsRemaining = CaptiveGetAPIStateSecondsRemaining((const __CFDictionary *)a1);
        if (APIStateSecondsRemaining)
          CFDictionarySetValue(v21, CFSTR("APIStateSecondsRemaining"), APIStateSecondsRemaining);
      }
    }
    else
    {
      ResponseDictSetIsCaptiveAndConfidence(v20, (int)v13, (int)v4, 3);
      if (!(_DWORD)v13)
        goto LABEL_31;
    }
    if (v21)
    {
      CNBuiltinPluginProvideResponse(v21);
      CFRelease(v21);
    }
    return;
  }
  v7 = mysyslog_get_logger();
  v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v7, (os_log_type_t)v8))
  {
    LOWORD(v23) = 0;
    _os_log_impl(&dword_219EF1000, v7, (os_log_type_t)v8, "no command to be processed", (uint8_t *)&v23, 2u);
  }
}

uint64_t CNSServerUnImp()
{
  return 5;
}

uint64_t CNSServerParsePost(uint64_t a1, char a2, const char *a3, const char *a4, const char *a5, const char *a6, int *a7)
{
  _BOOL4 v13;
  const __CFAllocator *v14;
  CFStringRef v15;
  const __CFString *v16;
  CFStringRef v17;
  const __CFString *v18;
  const __CFString *v19;
  BOOL v20;
  const __CFString *v23;
  const __CFString *v24;
  const __CFDictionary *RedirectForInterface;
  const __CFDictionary *v26;
  CFTypeID v27;
  const __CFString *v28;
  NSObject *logger;
  os_log_type_t v30;
  int v31;
  CFURLRef v32;
  CFURLRef v33;
  const __CFURL *v34;
  const __CFURL *v35;
  const __CFURL *v36;
  CFStringRef v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  _BOOL4 v41;
  _BOOL4 v42;
  CFDataRef ExternalRepresentation;
  NSObject *v44;
  os_log_type_t v45;
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  const char *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint32_t v52;
  NSObject *v54;
  os_log_type_t v55;
  CFStringRef theString2;
  CFStringRef theString2a;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *URLString;
  CFStringRef theString;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v64;
  __int16 v65;
  CFTypeRef v66;
  __int16 v67;
  CFTypeRef v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  if (!CaptiveIsActive())
  {
    *a7 = 6;
    return 0;
  }
  v13 = is_internal_install();
  if ((a2 & 1) == 0 || v13)
  {
    *a7 = 1;
    theString = 0;
    cf = 0;
    v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v15 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, 0x8000100u);
    v16 = CFStringCreateWithCString(v14, a5, 0x8000100u);
    v17 = CFStringCreateWithCString(v14, a4, 0x8000100u);
    v18 = CFStringCreateWithCString(v14, a6, 0x8000100u);
    v19 = v18;
    if (v15)
      v20 = v17 == 0;
    else
      v20 = 1;
    if (v20 || v16 == 0 || v18 == 0)
    {
      v23 = 0;
      v24 = 0;
      if (!v16)
        goto LABEL_63;
      goto LABEL_62;
    }
    if (!CaptivePostDataToUserNameAndPassword(v16, v18, &cf, (CFTypeRef *)&theString))
    {
      if ((a2 & 1) != 0)
      {
        v23 = 0;
        v31 = 2;
      }
      else
      {
        v28 = v17;
        logger = mysyslog_get_logger();
        v30 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v30))
        {
          *(_WORD *)buf = 0;
          v31 = 2;
          _os_log_impl(&dword_219EF1000, logger, v30, "failed to scrape credentials", buf, 2u);
          v23 = 0;
        }
        else
        {
          v23 = 0;
          v31 = 2;
        }
        v17 = v28;
      }
      goto LABEL_61;
    }
    v59 = v17;
    RedirectForInterface = (const __CFDictionary *)CaptiveGetRedirectForInterface(v15);
    if (RedirectForInterface
      && (v26 = RedirectForInterface, v27 = CFGetTypeID(RedirectForInterface), v27 == CFDictionaryGetTypeID()))
    {
      URLString = (const __CFString *)CFDictionaryGetValue(v26, kWISPrLoginURL[0]);
    }
    else
    {
      URLString = 0;
    }
    v17 = v59;
    v58 = (const __CFString *)CaptiveCopyInterfaceSSID(v15);
    if (!v58 || !URLString)
    {
LABEL_50:
      v46 = mysyslog_get_logger();
      v47 = _SC_syslog_os_log_mapping();
      v48 = os_log_type_enabled(v46, v47);
      if (URLString && v58)
      {
        if (v48)
        {
          *(_DWORD *)buf = 138412802;
          v64 = URLString;
          v65 = 2080;
          v66 = a4;
          v67 = 2112;
          v68 = cf;
          v49 = "login URL %@ does not match post url %s, not storing credentials for %@";
          v50 = v46;
          v51 = v47;
          v52 = 32;
LABEL_56:
          _os_log_impl(&dword_219EF1000, v50, v51, v49, buf, v52);
        }
      }
      else if (v48)
      {
        *(_DWORD *)buf = 136315394;
        v64 = a3;
        v65 = 2112;
        v66 = cf;
        v49 = "Couldn't determine login URL or ssid for %s, not storing credentials for %@";
        v50 = v46;
        v51 = v47;
        v52 = 22;
        goto LABEL_56;
      }
      if ((a2 & 1) != 0)
        v31 = 0;
      else
        v31 = 3;
      v23 = v58;
LABEL_61:
      *a7 = v31;
LABEL_62:
      CFRelease(v16);
      v24 = v23;
LABEL_63:
      if (v15)
        CFRelease(v15);
      if (v17)
        CFRelease(v17);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      if (theString)
      {
        CFRelease(theString);
        theString = 0;
      }
      if (v24)
        CFRelease(v24);
      if (v19)
        CFRelease(v19);
      return 0;
    }
    v32 = CFURLCreateWithString(v14, URLString, 0);
    v33 = CFURLCreateWithString(v14, v59, 0);
    v34 = v32;
    v35 = v33;
    if (v34 && v33)
    {
      v36 = v34;
      theString2 = CFURLCopyHostName(v34);
      v37 = CFURLCopyHostName(v35);
      v34 = v36;
    }
    else
    {
      v37 = 0;
      theString2 = 0;
      v38 = 0;
      v39 = 0;
      if (!v34)
        goto LABEL_36;
    }
    v40 = v37;
    CFRelease(v34);
    v38 = v40;
    v39 = theString2;
LABEL_36:
    theString2a = v38;
    if (v35)
    {
      CFRelease(v35);
      v38 = theString2a;
    }
    if (v39 && v38)
    {
      v41 = CFStringCompare(v39, v38, 1uLL) == kCFCompareEqualTo;
    }
    else
    {
      v41 = 0;
      v42 = 0;
      if (!v39)
        goto LABEL_43;
    }
    v42 = v41;
    CFRelease(v39);
LABEL_43:
    if (theString2a)
      CFRelease(theString2a);
    v17 = v59;
    if (v42)
    {
      if ((a2 & 1) != 0)
      {
        v54 = mysyslog_get_logger();
        v55 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v54, v55))
        {
          *(_DWORD *)buf = 138412290;
          v64 = cf;
          _os_log_impl(&dword_219EF1000, v54, v55, "Parsed credentails for user %@. Hostnames match, would store.", buf, 0xCu);
        }
        v31 = 0;
        v23 = v58;
        v17 = v59;
      }
      else
      {
        ExternalRepresentation = CFStringCreateExternalRepresentation(v14, theString, 0x8000100u, 0);
        v44 = mysyslog_get_logger();
        v45 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v44, v45))
        {
          *(_DWORD *)buf = 138412290;
          v64 = cf;
          _os_log_impl(&dword_219EF1000, v44, v45, "storing credentials for user %@", buf, 0xCu);
        }
        v23 = v58;
        CNAccountsAddInternal((const __CFString *)cf, ExternalRepresentation, v58, URLString, 1, 1);
        v31 = 0;
        v17 = v59;
      }
      goto LABEL_61;
    }
    goto LABEL_50;
  }
  return 0;
}

uint64_t CNSServerLogoff(uint64_t a1, int a2, const char *a3)
{
  CFStringRef v5;
  NSObject *logger;
  os_log_type_t v7;
  uint64_t AuthReplyForInterface;
  const __CFDictionary *v9;
  _QWORD *v10;
  CFRunLoopRef Current;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (CaptiveIsActive())
  {
    v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, 0x8000100u);
    logger = mysyslog_get_logger();
    v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v7))
    {
      v13 = 136315138;
      v14 = a3;
      _os_log_impl(&dword_219EF1000, logger, v7, "logging out of %s", (uint8_t *)&v13, 0xCu);
    }
    if (v5)
    {
      AuthReplyForInterface = CaptiveGetAuthReplyForInterface(v5);
      if (AuthReplyForInterface)
      {
        v9 = (const __CFDictionary *)AuthReplyForInterface;
        v10 = malloc_type_malloc(0x10uLL, 0x10800407411B482uLL);
        *(_DWORD *)v10 = a2;
        Current = CFRunLoopGetCurrent();
        v10[1] = captive_agent_logout(v9, v5, (uint64_t)Current, (uint64_t)CNSLogoutComplete, (uint64_t)v10);
        CFRelease(v5);
        if (!v10[1])
          free(v10);
      }
      else
      {
        CFRelease(v5);
      }
    }
  }
  return 0;
}

void CNSLogoutComplete(mach_port_t *a1, int a2)
{
  NSObject *logger;
  os_log_type_t v5;
  int v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    v9 = 67109120;
    v10 = a2;
    _os_log_impl(&dword_219EF1000, logger, v5, "logout complete: %d", (uint8_t *)&v9, 8u);
  }
  if (a2 == 150)
  {
    v6 = 0;
  }
  else
  {
    v7 = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = 67109120;
      v10 = a2;
      _os_log_impl(&dword_219EF1000, v7, v8, "unexpected result %d", (uint8_t *)&v9, 8u);
    }
    v6 = 5;
  }
  LogoffReply(*a1, v6);
  free(a1);
}

uint64_t CNSServerForgetNetwork(int a1, const UInt8 *a2, CFIndex length)
{
  const __CFAllocator *v3;
  const __CFData *v4;
  const __CFData *v5;
  CFStringRef v6;
  CFStringRef v7;
  NSObject *logger;
  os_log_type_t v9;
  int v11;
  CFStringRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, length);
  if (!v4)
    return 5;
  v5 = v4;
  v6 = CFStringCreateFromExternalRepresentation(v3, v4, 0x8000100u);
  if (v6)
  {
    v7 = v6;
    logger = mysyslog_get_logger();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v9))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_219EF1000, logger, v9, "Forgetting SSID '%@'", (uint8_t *)&v11, 0xCu);
    }
    CNAccountsPurgeSSID(v7);
    CNPluginHandlerForgetSSID();
    CFRelease(v7);
  }
  CFRelease(v5);
  return 0;
}

uint64_t CNSServerPurgeAccountRecord(int a1, const UInt8 *a2, CFIndex length)
{
  uint64_t result;
  const __CFAllocator *v4;
  const __CFData *v5;
  const __CFData *v6;
  CFStringRef v7;
  CFStringRef v8;
  NSObject *logger;
  os_log_type_t v10;
  int v11;
  CFStringRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  result = 5;
  if (a2 && (_DWORD)length)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, length);
    if (v5)
    {
      v6 = v5;
      v7 = CFStringCreateFromExternalRepresentation(v4, v5, 0x8000100u);
      if (v7)
      {
        v8 = v7;
        logger = mysyslog_get_logger();
        v10 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v10))
        {
          v11 = 138412290;
          v12 = v8;
          _os_log_impl(&dword_219EF1000, logger, v10, "Purging account record for SSID [%@]", (uint8_t *)&v11, 0xCu);
        }
        CNAccountsPurgeSSID(v8);
        CFRelease(v8);
      }
      CFRelease(v6);
      return 0;
    }
    else
    {
      return 5;
    }
  }
  return result;
}

uint64_t CNSServerDumpState()
{
  if (CaptiveIsActive())
    CaptiveDumpStates();
  return 0;
}

uint64_t CNSServerUserInteractionIsRequired(uint64_t a1, int *a2, _DWORD *a3, _OWORD *a4)
{
  __int128 v7;
  __CFArray *v8;
  const __CFArray *v9;
  const void *ValueAtIndex;
  int v11;
  NSObject *logger;
  os_log_type_t v13;
  _OWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!CaptiveIsActive())
    goto LABEL_7;
  v7 = a4[1];
  v15[0] = *a4;
  v15[1] = v7;
  if (!audit_token_has_BOOLean_entitlement(v15, CFSTR("com.apple.captive.private")))
  {
    logger = mysyslog_get_logger();
    v13 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v13))
    {
      LODWORD(v15[0]) = 136315138;
      *(_QWORD *)((char *)v15 + 4) = "com.apple.captive.private";
      _os_log_impl(&dword_219EF1000, logger, v13, "calling procss does not have [%s] entitlement", (uint8_t *)v15, 0xCu);
    }
    v11 = 1;
    goto LABEL_11;
  }
  v8 = CNPluginHandlerCopyInterfaceList();
  if (!v8 || (v9 = v8, CFArrayGetCount(v8) < 1) || (ValueAtIndex = CFArrayGetValueAtIndex(v9, 0)) == 0)
  {
LABEL_7:
    v11 = 6;
LABEL_11:
    *a2 = v11;
    return 0;
  }
  *a2 = 0;
  *a3 = CaptiveIsUIRequired(ValueAtIndex);
  CFRelease(v9);
  return 0;
}

uint64_t CNSServerCopySupportedInterfaces(uint64_t a1, vm_offset_t *a2, mach_msg_type_number_t *a3, _DWORD *a4)
{
  __CFArray *v7;
  __CFArray *v8;

  *a2 = 0;
  *a3 = 0;
  if (CaptiveIsActive())
  {
    *a4 = 1;
    v7 = CNPluginHandlerCopyInterfaceList();
    if (v7)
    {
      v8 = v7;
      *a4 = 0;
      MIGSerialize(v7, a2, a3);
      CFRelease(v8);
    }
  }
  else
  {
    *a4 = 6;
  }
  return 0;
}

uint64_t CNSServerCopyCurrentNetworkInfo(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _DWORD *a5, _DWORD *a6)
{
  *a6 = 0;
  *a4 = 0;
  *a5 = 0;
  return 0;
}

uint64_t CNSServerAuthenticateUsing(uint64_t a1, const char *a2, const char *a3, int *a4, int a5)
{
  const __CFAllocator *v9;
  CFStringRef v10;
  CFStringRef v11;
  const __CFString *v12;
  BOOL v13;
  NSObject *logger;
  os_log_type_t v15;
  int v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  int v22;
  const __CFString *v23;
  __int16 v24;
  CFStringRef v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (CaptiveIsActive())
  {
    v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v10 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0x8000100u);
    v11 = CFStringCreateWithCString(v9, a3, 0x8000100u);
    v12 = v11;
    *a4 = 12;
    if (v10)
      v13 = v11 == 0;
    else
      v13 = 1;
    if (v13)
    {
      if (!v10)
      {
        if (!v11)
          return 0;
        goto LABEL_17;
      }
    }
    else
    {
      logger = mysyslog_get_logger();
      v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v15))
      {
        v22 = 138412546;
        v23 = v12;
        v24 = 2112;
        v25 = v10;
        _os_log_impl(&dword_219EF1000, logger, v15, "Authenticating using %@ on %@", (uint8_t *)&v22, 0x16u);
      }
      v17 = CaptiveAuthenticateUsing(v10, v12, a5);
      *a4 = v17;
      if (v17)
      {
        v18 = mysyslog_get_logger();
        v19 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v18, v19))
        {
          v20 = *a4;
          v22 = 67109120;
          LODWORD(v23) = v20;
          _os_log_impl(&dword_219EF1000, v18, v19, "AuthenticateUsing failed: %d", (uint8_t *)&v22, 8u);
        }
      }
    }
    CFRelease(v10);
    if (v12)
LABEL_17:
      CFRelease(v12);
  }
  else
  {
    *a4 = 6;
  }
  return 0;
}

uint64_t CNSServerAuthenticateUsingToken(uint64_t a1, const char *a2, const UInt8 *a3, unsigned int a4, int *a5, int a6, _OWORD *a7)
{
  __int128 v13;
  const __CFAllocator *v14;
  CFStringRef v15;
  const __CFData *v16;
  CFStringRef v17;
  const __CFString *v18;
  BOOL v19;
  int v20;
  NSObject *logger;
  os_log_type_t v22;
  NSObject *v24;
  os_log_type_t v25;
  int v27;
  NSObject *v28;
  os_log_type_t v29;
  int v30;
  _BYTE v31[32];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (!CaptiveIsActive())
  {
    v20 = 6;
LABEL_17:
    *a5 = v20;
    return 0;
  }
  v13 = a7[1];
  *(_OWORD *)v31 = *a7;
  *(_OWORD *)&v31[16] = v13;
  if (!audit_token_has_BOOLean_entitlement(v31, CFSTR("com.apple.captive.private")))
  {
    logger = mysyslog_get_logger();
    v22 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v22))
    {
      *(_DWORD *)v31 = 136315138;
      *(_QWORD *)&v31[4] = "com.apple.captive.private";
      _os_log_impl(&dword_219EF1000, logger, v22, "calling procss does not have [%s] entitlement", v31, 0xCu);
    }
    v20 = 1;
    goto LABEL_17;
  }
  v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v15 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0x8000100u);
  v16 = CFDataCreate(v14, a3, a4);
  v17 = CFStringCreateFromExternalRepresentation(v14, v16, 0x8000100u);
  v18 = v17;
  *a5 = 12;
  if (v15)
    v19 = v17 == 0;
  else
    v19 = 1;
  if (v19)
  {
    if (!v15)
    {
      if (!v16)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else
  {
    v24 = mysyslog_get_logger();
    v25 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v24, v25))
    {
      *(_DWORD *)v31 = 138412546;
      *(_QWORD *)&v31[4] = v18;
      *(_WORD *)&v31[12] = 2112;
      *(_QWORD *)&v31[14] = v15;
      _os_log_impl(&dword_219EF1000, v24, v25, "Token Authentication using %@ on %@", v31, 0x16u);
    }
    v27 = CaptiveAuthenticateUsingToken(v15, v18, a6);
    *a5 = v27;
    if (v27)
    {
      v28 = mysyslog_get_logger();
      v29 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = *a5;
        *(_DWORD *)v31 = 67109120;
        *(_DWORD *)&v31[4] = v30;
        _os_log_impl(&dword_219EF1000, v28, v29, "CaptiveAuthenticateUsingToken failed: %d", v31, 8u);
      }
    }
  }
  CFRelease(v15);
  if (v16)
LABEL_10:
    CFRelease(v16);
LABEL_11:
  if (v18)
    CFRelease(v18);
  return 0;
}

uint64_t CNSServerCopyAccountList(uint64_t a1, vm_offset_t *a2, mach_msg_type_number_t *a3, _DWORD *a4)
{
  CFMutableArrayRef v7;
  CFMutableArrayRef v8;

  *a2 = 0;
  *a3 = 0;
  if (CaptiveIsActive())
  {
    v7 = CNAccountsCopyMatching(0, 0);
    if (v7)
    {
      v8 = v7;
      MIGSerialize(v7, a2, a3);
      CFRelease(v8);
    }
  }
  else
  {
    *a4 = 6;
  }
  return 0;
}

uint64_t CNSServerAddAccount(uint64_t a1, const char *a2, const UInt8 *a3, unsigned int a4, const char *a5, const char *a6, int a7, int *a8, _OWORD *a9)
{
  __int128 v16;
  uint64_t result;
  const __CFAllocator *v18;
  CFDataRef v19;
  CFDataRef v20;
  const __CFString *v21;
  int v22;
  NSObject *logger;
  os_log_type_t v24;
  const __CFString *v25;
  const __CFString *v26;
  _OWORD v27[2];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (!CaptiveIsActive())
  {
    result = 0;
    v22 = 6;
LABEL_12:
    *a8 = v22;
    return result;
  }
  v16 = a9[1];
  v27[0] = *a9;
  v27[1] = v16;
  if (!audit_token_has_BOOLean_entitlement(v27, CFSTR("com.apple.captive.private")))
  {
    logger = mysyslog_get_logger();
    v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v24))
    {
      LODWORD(v27[0]) = 136315138;
      *(_QWORD *)((char *)v27 + 4) = "com.apple.captive.private";
      _os_log_impl(&dword_219EF1000, logger, v24, "calling procss does not have [%s] entitlement", (uint8_t *)v27, 0xCu);
    }
    result = 0;
    v22 = 1;
    goto LABEL_12;
  }
  result = 5;
  if (a3 && a4)
  {
    v18 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v19 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, a4);
    if (v19)
    {
      v20 = v19;
      if (*a2)
        v21 = CFStringCreateWithCString(v18, a2, 0x8000100u);
      else
        v21 = 0;
      if (*a5)
        v25 = CFStringCreateWithCString(v18, a5, 0x8000100u);
      else
        v25 = 0;
      if (*a6)
        v26 = CFStringCreateWithCString(v18, a6, 0x8000100u);
      else
        v26 = 0;
      CNAccountsAddInternal(v21, v20, v25, v26, a7, 0);
      *a8 = 0;
      if (v21)
        CFRelease(v21);
      CFRelease(v20);
      if (v25)
        CFRelease(v25);
      if (v26)
        CFRelease(v26);
      return 0;
    }
    else
    {
      return 5;
    }
  }
  return result;
}

uint64_t CNSServerResolveAccount(uint64_t a1, uint64_t a2, int *a3)
{
  int v4;

  if (CaptiveIsActive())
    v4 = -1;
  else
    v4 = 6;
  *a3 = v4;
  return 0;
}

uint64_t CNSServerCopyLandingPageURL(uint64_t a1, _QWORD *a2, _DWORD *a3, _QWORD *a4, _DWORD *a5)
{
  const void *LandingPageURL;

  LandingPageURL = (const void *)CNPluginHandlerGetLandingPageURL(a4);
  if (LandingPageURL)
    LandingPageURL = my_CFPropertyListCreateVMData(LandingPageURL, a3);
  else
    *a3 = 0;
  *a2 = LandingPageURL;
  *a5 = 2 * (LandingPageURL == 0);
  return 0;
}

BOOL CNSRegisterServer()
{
  kern_return_t v0;
  NSObject *logger;
  os_log_type_t v2;
  mach_port_t sp;
  uint8_t buf[4];
  kern_return_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  sp = 0;
  CNSRegisterServer_sCaptiveNetworkServerParameters = (uint64_t)CNSServer_server;
  dword_253E53240 = 68;
  v0 = bootstrap_check_in(*MEMORY[0x24BDAD2F0], "com.apple.networking.captivenetworksupport", &sp);
  if (v0)
  {
    logger = mysyslog_get_logger();
    v2 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v2))
    {
      *(_DWORD *)buf = 67109120;
      v6 = v0;
      _os_log_impl(&dword_219EF1000, logger, v2, "bootstrap_check_in failed: 0x%x", buf, 8u);
    }
  }
  else
  {
    notify_post("com.apple.networking.captivenetworksupport.startserver");
    gServerMachPort = _SC_CFMachPortCreateWithPort();
  }
  return v0 == 0;
}

void CNSStartServer()
{
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Current;

  if (gServerMachPort)
  {
    RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFMachPortRef)gServerMachPort, 0);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    if (RunLoopSource)
      CFRelease(RunLoopSource);
  }
}

void CNSShutdownServer()
{
  if (gServerMachPort)
  {
    CFMachPortInvalidate((CFMachPortRef)gServerMachPort);
    if (gServerMachPort)
    {
      CFRelease((CFTypeRef)gServerMachPort);
      gServerMachPort = 0;
    }
  }
}

void MachServerCallback(uint64_t a1, mach_msg_header_t *a2, uint64_t a3, uint64_t a4)
{
  mach_msg_header_t *v6;
  mach_port_t msgh_remote_port;
  mach_msg_option_t v8;

  v6 = (mach_msg_header_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], *(unsigned int *)(a4 + 8), 0);
  (*(void (**)(mach_msg_header_t *, mach_msg_header_t *))a4)(a2, v6);
  if ((v6->msgh_bits & 0x80000000) == 0)
  {
    msgh_remote_port = v6[1].msgh_remote_port;
    if (msgh_remote_port == -305)
      goto LABEL_11;
    if (msgh_remote_port)
    {
      a2->msgh_remote_port = 0;
      mach_msg_destroy(a2);
    }
  }
  if (!v6->msgh_remote_port)
  {
    if ((v6->msgh_bits & 0x80000000) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  if ((v6->msgh_bits & 0x1F) == 0x12)
    v8 = 17;
  else
    v8 = 1;
  if ((mach_msg(v6, v8, v6->msgh_size, 0, 0, 0, 0) - 268435459) <= 1)
LABEL_10:
    mach_msg_destroy(v6);
LABEL_11:
  CFAllocatorDeallocate(0, v6);
}

CFTypeRef MIGCFPropertyListCreateBinaryData(CFAllocatorRef bufferAllocator, const void *a2)
{
  __CFWriteStream *v3;
  __CFWriteStream *v4;
  CFTypeRef v5;

  v3 = CFWriteStreamCreateWithAllocatedBuffers(bufferAllocator, bufferAllocator);
  if (!v3)
    return 0;
  v4 = v3;
  if (CFWriteStreamOpen(v3))
  {
    CFPropertyListWrite(a2, v4, kCFPropertyListBinaryFormat_v1_0, 0, 0);
    CFWriteStreamClose(v4);
    v5 = CFWriteStreamCopyProperty(v4, (CFStreamPropertyKey)*MEMORY[0x24BDBD5B8]);
  }
  else
  {
    v5 = 0;
  }
  CFRelease(v4);
  return v5;
}

CFPropertyListRef MIGUnserializeAndVMDealloc(UInt8 *bytes, CFIndex length)
{
  CFPropertyListRef v2;
  const __CFAllocator *v4;
  uint64_t v5;
  const __CFData *v6;
  const __CFData *v7;

  v2 = 0;
  if (bytes && (_DWORD)length)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v5 = length;
    v6 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, length, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
    if (v6)
    {
      v7 = v6;
      v2 = CFPropertyListCreateWithData(v4, v6, 0, 0, 0);
      CFRelease(v7);
    }
    else
    {
      v2 = 0;
    }
    MEMORY[0x2207368F4](*MEMORY[0x24BDAEC58], bytes, v5);
  }
  return v2;
}

const __CFData *MIGSerialize(const void *a1, vm_offset_t *a2, mach_msg_type_number_t *a3)
{
  const __CFData *result;
  const __CFData *v6;
  vm_map_read_t v7;
  const UInt8 *BytePtr;
  kern_return_t v9;
  mach_msg_type_number_t dataCnt;

  result = (const __CFData *)MIGCFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x24BDBD240], a1);
  if (result)
  {
    v6 = result;
    dataCnt = 0;
    *a3 = CFDataGetLength(result);
    v7 = *MEMORY[0x24BDAEC58];
    BytePtr = CFDataGetBytePtr(v6);
    v9 = vm_read(v7, (vm_address_t)BytePtr, *a3, a2, &dataCnt);
    CFRelease(v6);
    result = (const __CFData *)(v9 == 0);
    if (v9)
      *a2 = 0;
    *a3 = dataCnt;
  }
  return result;
}

uint64_t _AMLaunchApplicationWithIdentifier(uint64_t a1, int a2)
{
  void *v4;
  dispatch_semaphore_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  dispatch_time_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x22073669C]();
  v5 = dispatch_semaphore_create(0);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v6 = objc_alloc_init(MEMORY[0x24BE38490]);
  v7 = (void *)MEMORY[0x24BE38478];
  if (a2)
    v8 = MEMORY[0x24BDBD1C8];
  else
    v8 = MEMORY[0x24BDBD1C0];
  v27 = *MEMORY[0x24BE382B8];
  v28[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "optionsWithDictionary:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = ___AMLaunchApplicationWithIdentifier_block_invoke;
  v17[3] = &unk_24DC16A50;
  v19 = &v21;
  v20 = a1;
  v11 = v5;
  v18 = v11;
  objc_msgSend(v6, "openApplication:withOptions:completion:", a1, v10, v17);
  v12 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    mysyslog_get_logger();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      v26 = a1;
      _os_log_impl(&dword_219EF1000, v13, v14, "application [%@] launch timed out", buf, 0xCu);
    }

    v15 = 3;
    *((_DWORD *)v22 + 6) = 3;
  }
  else
  {
    v15 = *((unsigned int *)v22 + 6);
  }

  _Block_object_dispose(&v21, 8);
  objc_autoreleasePoolPop(v4);
  return v15;
}

void sub_219EFED2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AMCopyDisplayIdentifierForProcessID(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  os_log_type_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v13;
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073669C]();
  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE80C78], "handleForIdentifier:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    mysyslog_get_logger();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _SC_syslog_os_log_mapping();
    v7 = v5;
    if (os_log_type_enabled(v7, v6))
    {
      objc_msgSend(v4, "bundle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v9;
      v15 = 1024;
      v16 = a1;
      _os_log_impl(&dword_219EF1000, v7, v6, "found application bundle identifier [%@] for pid %d", (uint8_t *)&v13, 0x12u);

    }
    objc_msgSend(v4, "bundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v11;
}

id _AMCreateProcessAssertionForPID(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  int v14;
  int v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073669C]();
  v3 = objc_alloc(MEMORY[0x24BE80B10]);
  objc_msgSend(MEMORY[0x24BE80D38], "targetWithPid:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE80B88], "attributeWithDomain:name:", CFSTR("com.apple.CaptiveNetworkSupport"), CFSTR("HotspotHelper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithExplanation:target:attributes:", CFSTR("HotspotHelper"), v4, v6);

  if (v7 && objc_msgSend(v7, "acquireWithError:", 0))
  {
    mysyslog_get_logger();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v9))
    {
      v14 = 67109120;
      v15 = a1;
      _os_log_impl(&dword_219EF1000, v8, v9, "acquired assertion for pid %d", (uint8_t *)&v14, 8u);
    }

    v10 = v7;
  }
  else
  {
    mysyslog_get_logger();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      v14 = 67109120;
      v15 = a1;
      _os_log_impl(&dword_219EF1000, v11, v12, "failed to acquire assertion for pid %d", (uint8_t *)&v14, 8u);
    }

    v10 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v10;
}

void _AMInvalidateProcessAssertion(void *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t v6[16];

  v2 = (void *)MEMORY[0x22073669C]();
  v3 = a1;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      mysyslog_get_logger();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v4, v5))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_219EF1000, v4, v5, "invalidated assertion", v6, 2u);
      }

      objc_msgSend(v3, "invalidate");
    }
  }

  objc_autoreleasePoolPop(v2);
}

void *_AMCopyBackgroundModesForPID(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  os_log_type_t v11;
  int v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22073669C]();
  objc_msgSend(MEMORY[0x24BE80C90], "identifierWithPid:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE80C78], "handleForIdentifier:error:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "bundle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v5, "bundle");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "bundleInfoValueForKey:", kUIBackgroundModes);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            mysyslog_get_logger();
            v9 = objc_claimAutoreleasedReturnValue();
            v10 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v9, v10))
            {
              v13 = 67109378;
              v14 = a1;
              v15 = 2112;
              v16 = v8;
              _os_log_impl(&dword_219EF1000, v9, v10, "background modes for pid %d : %@", (uint8_t *)&v13, 0x12u);
            }
            goto LABEL_13;
          }
        }

      }
    }
  }
  else
  {
    v5 = 0;
  }
  mysyslog_get_logger();
  v9 = objc_claimAutoreleasedReturnValue();
  v11 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v9, v11))
  {
    v13 = 67109120;
    v14 = a1;
    _os_log_impl(&dword_219EF1000, v9, v11, "failed to find background modes for pid %d", (uint8_t *)&v13, 8u);
  }
  v8 = 0;
LABEL_13:

  objc_autoreleasePoolPop(v2);
  return v8;
}

void *_AMCopyLocalizedApplicationNameForDisplayIdentifier(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x22073669C]();
  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedNameForContext:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = v4;

  objc_autoreleasePoolPop(v2);
  return v4;
}

uint64_t _AMCopyApplicationDisplayIdentifiers()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  CFMutableArrayRef Mutable;

  v0 = (void *)MEMORY[0x22073669C]();
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  Mutable = 0;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = ___AMCopyApplicationDisplayIdentifiers_block_invoke;
  v4[3] = &unk_24DC16A78;
  v4[4] = &v5;
  objc_msgSend(v1, "enumerateBundlesOfType:block:", 1, v4);
  v2 = v6[3];

  _Block_object_dispose(&v5, 8);
  objc_autoreleasePoolPop(v0);
  return v2;
}

void sub_219EFF6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _AMIsDeviceActivated()
{
  void *v0;
  void *v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x22073669C]();
  v1 = (void *)MAEGetActivationStateWithError();
  v2 = 0;
  if (v2)
  {
    mysyslog_get_logger();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v4))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v2;
      _os_log_impl(&dword_219EF1000, v3, v4, "MAEGetActivationStateWithError failed, error: %@", buf, 0xCu);
    }

  }
  v5 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x24BE66A60]);

  objc_autoreleasePoolPop(v0);
  return v5 ^ 1u;
}

uint64_t _AMIsDeviceSetupCompleted()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)MEMORY[0x22073669C]();
  v1 = BYSetupAssistantNeedsToRun() ^ 1;
  objc_autoreleasePoolPop(v0);
  return v1;
}

uint64_t PassiveDetectSetCallBack(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *logger;
  os_log_type_t v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (_OWORD *)passiveDetect;
  if (!passiveDetect)
  {
    v4 = malloc_type_malloc(0x40uLL, 0x10E0040913719CAuLL);
    passiveDetect = (uint64_t)v4;
    *v4 = 0u;
    v4[1] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    *((_BYTE *)v4 + 36) = 1;
    if (a1)
      goto LABEL_4;
LABEL_9:
    if (*((_QWORD *)v4 + 6))
    {
      PassiveDetectClearInfo(0);
      CaptiveSymptomEnablePassiveDetection(0, 0);
      logger = mysyslog_get_logger();
      v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v11))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_219EF1000, logger, v11, "Captive passive detection DISABLED", (uint8_t *)&v13, 2u);
      }
    }
    return 1;
  }
  if (!*(_BYTE *)(passiveDetect + 36))
    return 0;
  if (!a1)
    goto LABEL_9;
LABEL_4:
  if (*((_QWORD *)v4 + 2))
    return 1;
  *(_QWORD *)(passiveDetect + 16) = my_CFRunLoopSourceCreateForBSDNotification("com.apple.symptoms.managed_events.captive-network", (uint64_t)handleNotification, 0, (_DWORD *)v4 + 2, (__CFMachPort **)v4);
  v5 = mysyslog_get_logger();
  v6 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_QWORD *)(passiveDetect + 40);
    v13 = 138412290;
    v14 = v7;
    _os_log_impl(&dword_219EF1000, v5, v6, "Captive passive detection ENABLED (hostname %@)", (uint8_t *)&v13, 0xCu);
  }
  v8 = passiveDetect;
  *(_QWORD *)(passiveDetect + 48) = a1;
  *(_QWORD *)(v8 + 56) = a2;
  v9 = 1;
  *(_BYTE *)(v8 + 37) = 1;
  CaptiveSymptomEnablePassiveDetection(1, *(_QWORD *)(v8 + 40));
  return v9;
}

void PassiveDetectClearInfo(int a1)
{
  uint64_t v2;
  __CFRunLoopSource *v3;
  const void *v4;
  NSObject *logger;
  os_log_type_t v6;
  uint8_t v7[16];

  v2 = passiveDetect;
  *(_QWORD *)(passiveDetect + 48) = 0;
  *(_QWORD *)(v2 + 56) = 0;
  if (*(_QWORD *)v2)
  {
    CFMachPortInvalidate(*(CFMachPortRef *)v2);
    v2 = passiveDetect;
    if (passiveDetect)
    {
      if (*(_QWORD *)passiveDetect)
      {
        CFRelease(*(CFTypeRef *)passiveDetect);
        *(_QWORD *)v2 = 0;
        v2 = passiveDetect;
      }
    }
  }
  v3 = *(__CFRunLoopSource **)(v2 + 16);
  if (v3)
  {
    CFRunLoopSourceInvalidate(v3);
    v2 = passiveDetect;
    v4 = *(const void **)(passiveDetect + 16);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(v2 + 16) = 0;
      v2 = passiveDetect;
    }
  }
  if (*(_DWORD *)(v2 + 8))
  {
    logger = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_219EF1000, logger, v6, "Disabling passive detection", v7, 2u);
    }
    notify_cancel(*(_DWORD *)(passiveDetect + 8));
    v2 = passiveDetect;
    *(_DWORD *)(passiveDetect + 8) = 0;
  }
  if (a1)
  {
    *(_DWORD *)(v2 + 32) = 0;
    *(_QWORD *)(v2 + 24) = 0;
    *(_BYTE *)(v2 + 37) = 0;
    PassiveDetectSetRedirectURLHostname(0);
  }
}

void handleNotification()
{
  double Current;
  uint64_t v1;
  int v2;
  NSObject *logger;
  os_log_type_t v4;
  uint8_t v5[8];
  uint64_t state64;

  Current = CFAbsoluteTimeGetCurrent();
  v1 = passiveDetect;
  if (*(double *)(passiveDetect + 24) + 60.0 > Current)
  {
    logger = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_219EF1000, logger, v4, "Passive notification ignored (too soon)", v5, 2u);
    }
  }
  else
  {
    state64 = 0;
    v2 = *(_DWORD *)(passiveDetect + 8);
    if (v2)
    {
      notify_get_state(v2, &state64);
      CFRunLoopGetCurrent();
      CaptiveSymptomScheduleEventFetch(state64, &__block_literal_global_0);
      v1 = passiveDetect;
    }
    *(double *)(v1 + 24) = Current;
    (*(void (**)(_QWORD))(v1 + 48))(*(_QWORD *)(v1 + 56));
  }
}

void PassiveDetectReportNotCaptive()
{
  void *v0;
  int v1;
  NSObject *logger;
  os_log_type_t v3;
  os_log_type_t v4;
  int v5;
  uint64_t state64;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)passiveDetect;
  if (passiveDetect)
  {
    if (!*(_BYTE *)(passiveDetect + 36))
      return;
  }
  else
  {
    v0 = malloc_type_malloc(0x40uLL, 0x10E0040913719CAuLL);
    passiveDetect = (uint64_t)v0;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
    *((_OWORD *)v0 + 2) = 0u;
    *((_OWORD *)v0 + 3) = 0u;
    *((_BYTE *)v0 + 36) = 1;
  }
  if (*((_BYTE *)v0 + 37))
  {
    ++*((_DWORD *)v0 + 8);
    state64 = 0;
    notify_get_state(*((_DWORD *)v0 + 2), &state64);
    CaptiveSymptomReportCaptiveState();
    v1 = *(_DWORD *)(passiveDetect + 32);
    logger = mysyslog_get_logger();
    if (v1 < 3)
    {
      v4 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v4))
      {
        v5 = *(_DWORD *)(passiveDetect + 32);
        *(_DWORD *)buf = 67109376;
        v8 = v5;
        v9 = 1024;
        v10 = 2;
        _os_log_impl(&dword_219EF1000, logger, v4, "Reporting False Positive: %d (of %d)", buf, 0xEu);
      }
    }
    else
    {
      v3 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v3))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219EF1000, logger, v3, "Exceeded threshold for false positive.", buf, 2u);
      }
      PassiveDetectSetCallBack(0, 0);
      *(_BYTE *)(passiveDetect + 36) = 0;
    }
  }
}

void PassiveDetectNewNetwork()
{
  _OWORD *v0;

  v0 = (_OWORD *)passiveDetect;
  if (!passiveDetect)
  {
    v0 = malloc_type_malloc(0x40uLL, 0x10E0040913719CAuLL);
    passiveDetect = (uint64_t)v0;
    *v0 = 0u;
    v0[1] = 0u;
    v0[2] = 0u;
    v0[3] = 0u;
    *((_BYTE *)v0 + 36) = 1;
  }
  *((_BYTE *)v0 + 36) = 1;
  PassiveDetectClearInfo(1);
}

void PassiveDetectSetRedirectURLHostname(CFTypeRef cf)
{
  void *v2;

  v2 = (void *)passiveDetect;
  if (!passiveDetect)
  {
    v2 = malloc_type_malloc(0x40uLL, 0x10E0040913719CAuLL);
    passiveDetect = (uint64_t)v2;
    *(_OWORD *)v2 = 0u;
    *((_OWORD *)v2 + 1) = 0u;
    *((_OWORD *)v2 + 2) = 0u;
    *((_OWORD *)v2 + 3) = 0u;
    *((_BYTE *)v2 + 36) = 1;
  }
  my_FieldSetRetainedCFType((const void **)v2 + 5, cf);
}

BOOL UIAllowed()
{
  return !S_wifi_suppressed
      && (S_networking_app_in_foreground | S_wifi_settings_in_foreground) != 0;
}

void UIAllowedRegisterForCallbacks(uint64_t (*a1)(_QWORD))
{
  __CFRunLoop *Current;
  int *v2;
  __CFRunLoop *v3;
  int *v4;

  S_callback = a1;
  Current = CFRunLoopGetCurrent();
  v2 = NotifyRegister(Current, "com.apple.airport.userNotification", (uint64_t)UIAllowedNetworkingAppNotify, 0);
  v3 = CFRunLoopGetCurrent();
  v4 = NotifyRegister(v3, "com.apple.airportsettingsvisible", (uint64_t)UIAllowedWiFiSettingsNotify, 0);
  UIAllowedNetworkingAppCheck((uint64_t)v2);
  UIAllowedWiFiSettingsCheck((uint64_t)v4);
}

void UIAllowedWiFiSettingsNotify(uint64_t a1, uint64_t a2)
{
  _BOOL4 v2;

  if (S_wifi_suppressed)
    v2 = 0;
  else
    v2 = (S_networking_app_in_foreground | S_wifi_settings_in_foreground) != 0;
  UIAllowedWiFiSettingsCheck(a2);
  UIAllowedInvokeCallback(v2);
}

void UIAllowedWiFiSettingsCheck(uint64_t a1)
{
  int v1;
  NSObject *logger;
  os_log_type_t v3;
  const char *v4;
  uint64_t v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v1 = a1 && NotifyGet(a1, &v5) && v5 != 0;
  if (S_wifi_settings_in_foreground != v1)
  {
    S_wifi_settings_in_foreground = v1;
    logger = mysyslog_get_logger();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      v4 = "";
      if (!S_wifi_settings_in_foreground)
        v4 = "not ";
      *(_DWORD *)buf = 136315394;
      v7 = "UIAllowedWiFiSettingsCheck";
      v8 = 2080;
      v9 = v4;
      _os_log_impl(&dword_219EF1000, logger, v3, "%s: Wi-Fi Settings %sin foreground", buf, 0x16u);
    }
  }
}

void UIAllowedNewInterface(void (__cdecl *a1)(const void *))
{
  NSObject *logger;
  os_log_type_t v3;
  const char *v4;
  uint8_t *p_buf;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  const __SCNetworkInterface *v9;
  const __SCNetworkInterface *v10;
  SCDynamicStoreRef v11;
  const __SCDynamicStore *v12;
  const __CFArray *v13;
  int v14;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Current;
  int v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  NSObject *v21;
  os_log_type_t v22;
  void *values;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  SCDynamicStoreContext buf;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (S_interface)
  {
    logger = mysyslog_get_logger();
    v3 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v3))
      return;
    LODWORD(buf.version) = 136315650;
    *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"UIAllowedNewInterface";
    WORD2(buf.info) = 2112;
    *(void **)((char *)&buf.info + 6) = (void *)SCNetworkInterfaceGetBSDName((SCNetworkInterfaceRef)S_interface);
    HIWORD(buf.retain) = 2112;
    buf.release = a1;
    v4 = "%s: %@ already registered, ignoring %@";
    goto LABEL_4;
  }
  v9 = (const __SCNetworkInterface *)_SCNetworkInterfaceCreateWithBSDName();
  S_interface = (uint64_t)v9;
  if (v9)
  {
    v10 = v9;
    buf.version = 0;
    memset(&buf.retain, 0, 24);
    buf.info = v9;
    v11 = SCDynamicStoreCreate(0, CFSTR("UIAllowed"), (SCDynamicStoreCallBack)UIAllowedInterfaceAdvisoryChanged, &buf);
    if (v11)
    {
      v12 = v11;
      values = (void *)SCNetworkInterfaceCopyAdvisoryNotificationKey();
      v13 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
      CFRelease(values);
      v14 = SCDynamicStoreSetNotificationKeys(v12, v13, 0);
      CFRelease(v13);
      if (v14)
      {
        RunLoopSource = SCDynamicStoreCreateRunLoopSource(0, v12, 0);
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
        CFRelease(RunLoopSource);
        UIAllowedWiFiSuppressedCheck(v10);
        return;
      }
      v21 = mysyslog_get_logger();
      v22 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v21, v22))
      {
        v24 = 136315138;
        v25 = "UIAllowedRegisterForAdvisoryChanges";
        v4 = "%s: SCDynamicStoreSetNotificationKeys failed";
        p_buf = (uint8_t *)&v24;
        v6 = v21;
        v7 = v22;
        v8 = 12;
        goto LABEL_5;
      }
    }
    else
    {
      v18 = mysyslog_get_logger();
      v19 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = SCError();
        v24 = 136315394;
        v25 = "UIAllowedRegisterForAdvisoryChanges";
        v26 = 2080;
        v27 = SCErrorString(v20);
        v4 = "%s: SCDynamicStoreCreate() failed, %s";
        p_buf = (uint8_t *)&v24;
        v6 = v18;
        v7 = v19;
        v8 = 22;
        goto LABEL_5;
      }
    }
  }
  else
  {
    logger = mysyslog_get_logger();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      v17 = SCError();
      LODWORD(buf.version) = 136315650;
      *(CFIndex *)((char *)&buf.version + 4) = (CFIndex)"UIAllowedNewInterface";
      WORD2(buf.info) = 2112;
      *(void **)((char *)&buf.info + 6) = a1;
      HIWORD(buf.retain) = 2080;
      buf.release = (void (__cdecl *)(const void *))SCErrorString(v17);
      v4 = "%s: _SCNetworkInterfaceCreateWithBSDName(%@) failed %s";
LABEL_4:
      p_buf = (uint8_t *)&buf;
      v6 = logger;
      v7 = v3;
      v8 = 32;
LABEL_5:
      _os_log_impl(&dword_219EF1000, v6, v7, v4, p_buf, v8);
    }
  }
}

void UIAllowedInterfaceAdvisoryChanged(uint64_t a1, uint64_t a2, const __SCNetworkInterface *a3)
{
  _BOOL4 v3;

  if (S_wifi_suppressed)
    v3 = 0;
  else
    v3 = (S_networking_app_in_foreground | S_wifi_settings_in_foreground) != 0;
  UIAllowedWiFiSuppressedCheck(a3);
  UIAllowedInvokeCallback(v3);
}

void UIAllowedWiFiSuppressedCheck(const __SCNetworkInterface *a1)
{
  int v2;
  NSObject *logger;
  os_log_type_t v4;
  CFStringRef BSDName;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  CFStringRef v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = SCNetworkInterfaceAdvisoryIsSpecificSet() != 0;
  if (S_wifi_suppressed != v2)
  {
    S_wifi_suppressed = v2;
    logger = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      BSDName = SCNetworkInterfaceGetBSDName(a1);
      v8 = "UIAllowedWiFiSuppressedCheck";
      v7 = 136315650;
      if (S_wifi_suppressed)
        v6 = "";
      else
        v6 = "not ";
      v9 = 2112;
      v10 = BSDName;
      v11 = 2080;
      v12 = v6;
      _os_log_impl(&dword_219EF1000, logger, v4, "%s: Wi-Fi %@ is %ssuppressed", (uint8_t *)&v7, 0x20u);
    }
  }
}

void BBMonitorCheckPreferences()
{
  NSObject *logger;
  os_log_type_t v1;
  NSObject *v2;
  os_log_type_t v3;
  NSObject *v4;
  os_log_type_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  S_BBMProbeTimeout = CCPGetBrokenBackhaulProbeTimeout();
  S_BBMProbeInterval = CCPGetBrokenBackhaulProbeInterval();
  logger = mysyslog_get_logger();
  v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    v6 = 134217984;
    v7 = S_BBMProbeTimeout;
    _os_log_impl(&dword_219EF1000, logger, v1, "BrokenBackhaulProbeTimeout %g", (uint8_t *)&v6, 0xCu);
  }
  v2 = mysyslog_get_logger();
  v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v2, v3))
  {
    v6 = 134217984;
    v7 = S_BBMProbeInterval;
    _os_log_impl(&dword_219EF1000, v2, v3, "BrokenBackhaulProbeInterval %g", (uint8_t *)&v6, 0xCu);
  }
  S_BBMPromptInterval = CCPGetBrokenBackhaulPromptInterval();
  v4 = mysyslog_get_logger();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = 134217984;
    v7 = S_BBMPromptInterval;
    _os_log_impl(&dword_219EF1000, v4, v5, "BrokenBackhaulPromptInterval %g", (uint8_t *)&v6, 0xCu);
  }
}

uint64_t BBMonitorCreate(uint64_t a1, const void *a2, char a3, char a4, uint64_t a5, uint64_t a6)
{
  _OWORD *v11;
  uint64_t v12;
  int v13;
  __CFRunLoopSource *v14;
  CFStringRef BSDName;
  uint64_t v16;
  const void *v17;
  const void *SSID;
  const __CFBoolean *Property;
  const void *v20;
  CFTypeID TypeID;
  CFTypeID v22;

  v11 = malloc_type_malloc(0x80uLL, 0x10E00409DCE37B5uLL);
  v12 = (uint64_t)v11;
  *(_OWORD *)((char *)v11 + 4) = 0u;
  *(_OWORD *)((char *)v11 + 20) = 0u;
  *(_OWORD *)((char *)v11 + 36) = 0u;
  *(_OWORD *)((char *)v11 + 52) = 0u;
  *(_OWORD *)((char *)v11 + 68) = 0u;
  *(_OWORD *)((char *)v11 + 84) = 0u;
  *(_OWORD *)((char *)v11 + 100) = 0u;
  v11[7] = 0u;
  if ((a4 & 1) != 0)
  {
    *((_DWORD *)v11 + 1) = 8;
    v13 = 24;
    if ((a4 & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v13 = 16;
  if ((a4 & 2) != 0)
LABEL_5:
    *((_DWORD *)v11 + 1) = v13;
LABEL_6:
  *(_DWORD *)v11 = 1;
  *((_QWORD *)v11 + 1) = _SCNetworkInterfaceCopyActive();
  *(_QWORD *)(v12 + 16) = CFRetain(a2);
  v14 = my_CFRunLoopSourceCreateForBSDNotification("com.apple.symptoms.managed_events.broken-backhaul", (uint64_t)bb_state_changed, v12, (_DWORD *)(v12 + 64), (__CFMachPort **)(v12 + 48));
  *(_QWORD *)(v12 + 56) = v14;
  *(_QWORD *)(v12 + 32) = a5;
  *(_QWORD *)(v12 + 40) = a6;
  if (!v14)
  {
    BBMonitorRelease((_QWORD *)v12);
    v12 = 0;
  }
  *(_BYTE *)(v12 + 24) = a3;
  BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(v12 + 8));
  v16 = NetIFCopyCurrentWiFiNetwork((uint64_t)BSDName);
  if (v16)
  {
    v17 = (const void *)v16;
    SSID = (const void *)WiFiNetworkGetSSID();
    if (SSID)
    {
      if (CFEqual(SSID, *(CFTypeRef *)(v12 + 16)))
      {
        Property = (const __CFBoolean *)WiFiNetworkGetProperty();
        v20 = (const void *)WiFiNetworkGetProperty();
        TypeID = CFBooleanGetTypeID();
        if (Property)
        {
          if (CFGetTypeID(Property) == TypeID)
          {
            v22 = CFDateGetTypeID();
            if (v20)
            {
              if (CFGetTypeID(v20) == v22)
              {
                *(_BYTE *)(v12 + 120) = CFBooleanGetValue(Property);
                *(double *)(v12 + 112) = MEMORY[0x220735C34](v20);
                BBMonitorLogUserChoice(v12, (uint64_t)"Loaded", (uint64_t)v20);
              }
            }
          }
        }
      }
    }
    CFRelease(v17);
  }
  return v12;
}

void bb_state_changed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  BBMonitorScheduleStateFetch(a4, 0);
}

void BBMonitorRelease(_QWORD *a1)
{
  NSObject *logger;
  os_log_type_t v3;
  int v4;
  int v5;
  int v6;
  const void *v7;
  const void *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    v4 = *(_DWORD *)a1;
    v5 = *(_DWORD *)a1 - 1;
    v9[0] = 67109376;
    v9[1] = v4;
    v10 = 1024;
    v11 = v5;
    _os_log_impl(&dword_219EF1000, logger, v3, "BBMRelease: retain_count %d -> %d", (uint8_t *)v9, 0xEu);
  }
  v6 = (*(_DWORD *)a1)--;
  if (v6 == 1)
  {
    BBMonitorInvalidate((uint64_t)a1);
    v7 = (const void *)a1[1];
    if (v7)
    {
      CFRelease(v7);
      a1[1] = 0;
    }
    v8 = (const void *)a1[2];
    if (v8)
      CFRelease(v8);
    free(a1);
  }
  else if (v6 <= 0)
  {
    abort();
  }
}

uint64_t BBMonitorInvalidate(uint64_t a1)
{
  __CFMachPort *v2;
  const void *v3;
  __CFRunLoopSource *v4;
  const void *v5;
  uint64_t result;

  BBMonitorCancelEvents(a1);
  BBMonitorReleaseWiFiAssertion(a1);
  v2 = *(__CFMachPort **)(a1 + 48);
  if (v2)
  {
    CFMachPortInvalidate(v2);
    v3 = *(const void **)(a1 + 48);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 48) = 0;
    }
  }
  v4 = *(__CFRunLoopSource **)(a1 + 56);
  if (v4)
  {
    CFRunLoopSourceInvalidate(v4);
    v5 = *(const void **)(a1 + 56);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(a1 + 56) = 0;
    }
  }
  result = *(unsigned int *)(a1 + 64);
  if ((_DWORD)result)
  {
    result = notify_cancel(result);
    *(_DWORD *)(a1 + 64) = 0;
  }
  return result;
}

void BBMonitorCancelEvents(uint64_t a1)
{
  TimerRelease((uint64_t *)(a1 + 80));
  if (*(_QWORD *)(a1 + 72))
    captive_agent_abort_probe((_QWORD *)(a1 + 72));
  BBMonitorCancelPrompt(a1);
}

void BBMonitorReleaseWiFiAssertion(uint64_t a1)
{
  NSObject *logger;
  os_log_type_t v3;
  uint8_t v4[16];

  if ((*(_BYTE *)(a1 + 4) & 0x40) != 0)
  {
    logger = mysyslog_get_logger();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_219EF1000, logger, v3, "BBMonitorReleaseWiFiAssertion", v4, 2u);
    }
    *(_DWORD *)(a1 + 4) &= ~0x40u;
    NetIFReleaseWiFiAssertion();
  }
}

void BBMonitorRetain(int *a1)
{
  NSObject *logger;
  os_log_type_t v3;
  int v4;
  int v5;
  _DWORD v6[2];
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    v4 = *a1;
    v5 = *a1 + 1;
    v6[0] = 67109376;
    v6[1] = v4;
    v7 = 1024;
    v8 = v5;
    _os_log_impl(&dword_219EF1000, logger, v3, "BBMRetain: retain_count %d -> %d", (uint8_t *)v6, 0xEu);
  }
  ++*a1;
}

void BBMonitorStart(uint64_t a1)
{
  BBMonitorScheduleStateFetch(a1, 1);
}

void BBMonitorScheduleStateFetch(uint64_t a1, int a2)
{
  CFRunLoopRef Current;
  CFRunLoopRef v5;
  _QWORD aBlock[6];
  uint64_t state64;

  Current = CFRunLoopGetCurrent();
  if (*(_QWORD *)(a1 + 56))
  {
    v5 = Current;
    state64 = 0;
    if (a2)
      state64 = 7;
    else
      notify_get_state(*(_DWORD *)(a1 + 64), &state64);
    BBMonitorRetain((int *)a1);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 0x40000000;
    aBlock[2] = __BBMonitorScheduleStateFetch_block_invoke;
    aBlock[3] = &__block_descriptor_tmp_17;
    aBlock[4] = v5;
    aBlock[5] = a1;
    if (!CaptiveSymptomScheduleEventFetch(state64, aBlock))
      BBMonitorRelease((_QWORD *)a1);
  }
}

void BBMonitorLogUserChoice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *logger;
  os_log_type_t v7;
  const char *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v7 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v7))
  {
    v8 = "Use Cellular";
    v9 = *(_QWORD *)(a1 + 16);
    if (!*(_BYTE *)(a1 + 120))
      v8 = "Remain On WiFi";
    v10 = 136315906;
    v11 = a2;
    v12 = 2080;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = a3;
    _os_log_impl(&dword_219EF1000, logger, v7, "BBMonitor: %s user's choice '%s' for SSID '%@' [%@]", (uint8_t *)&v10, 0x2Au);
  }
}

void BBMonitorCancelPrompt(uint64_t a1)
{
  NSObject *logger;
  os_log_type_t v3;
  __CFRunLoop *Current;
  const void *v5;
  __CFUserNotification *v6;
  const void *v7;
  uint8_t v8[16];

  if (*(_QWORD *)(a1 + 96))
  {
    logger = mysyslog_get_logger();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_219EF1000, logger, v3, "canceling prompt", v8, 2u);
    }
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 96), (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    v5 = *(const void **)(a1 + 96);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(a1 + 96) = 0;
    }
    _BBMonitorPostEvent(a1, 0);
  }
  v6 = *(__CFUserNotification **)(a1 + 88);
  if (v6)
  {
    CFUserNotificationCancel(v6);
    v7 = *(const void **)(a1 + 88);
    if (v7)
    {
      CFRelease(v7);
      *(_QWORD *)(a1 + 88) = 0;
    }
  }
  if (S_bb == a1)
    S_bb = 0;
}

void _BBMonitorPostEvent(uint64_t a1, int a2)
{
  double Current;
  double v5;
  unint64_t v6;
  int v7;
  NSObject *logger;
  os_log_type_t v9;
  char *v10;
  const char *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  Current = CFAbsoluteTimeGetCurrent();
  v5 = *(double *)(a1 + 104);
  if (Current <= v5)
    v6 = 0;
  else
    v6 = (unint64_t)(Current - v5);
  v7 = analytics_send_event_lazy();
  logger = mysyslog_get_logger();
  v9 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v9))
  {
    v10 = PromptResultGetString_names[a2];
    v11 = "Event Post Failed";
    *(_DWORD *)buf = 136315906;
    if (v7)
      v11 = "Event Posted";
    v13 = v11;
    v14 = 2080;
    v15 = v10;
    v16 = 1024;
    v17 = a2;
    v18 = 2048;
    v19 = v6;
    _os_log_impl(&dword_219EF1000, logger, v9, "%s %s (%d) duration %qu", buf, 0x26u);
  }
}

void BBMonitor_Idle(uint64_t a1, int a2, unsigned __int8 *a3)
{
  int v5;

  if (!a2)
  {
    BBMonitorReleaseWiFiAssertion(a1);
    if (a3)
    {
      v5 = *a3;
      BBMonitorSetState(a1, 1u);
      BBMonitorCancelEvents(a1);
      if (!v5)
        return;
    }
    else
    {
      BBMonitorSetState(a1, 1u);
      BBMonitorCancelEvents(a1);
    }
    BBMonitorReportState(a1, 0);
    BBMonitorSetInterfaceAdvisory(a1, 0);
  }
}

void BBMonitor_Probing(uint64_t a1, int a2, int *a3)
{
  int v4;
  unsigned __int8 v5;

  if (a2 == 1)
  {
    v4 = *a3;
    BBMonitorReportState(a1, *a3 == 3);
    if (v4 == 3)
      BBMonitor_Selecting(a1, 0, 0);
    else
      BBMonitor_Idle(a1, 0, 0);
  }
  else if (!a2)
  {
    BBMonitorSetState(a1, 2u);
    BBMonitorCancelEvents(a1);
    if (!BBMonitorStartProbe(a1))
    {
      v5 = 0;
      BBMonitor_Idle(a1, 0, &v5);
    }
  }
}

void BBMonitor_Detecting(uint64_t a1, int a2)
{
  NSObject *logger;
  os_log_type_t v4;
  unsigned __int8 v5;
  uint8_t buf[16];

  v5 = 0;
  if (a2 == 1)
    goto LABEL_9;
  if (!a2)
  {
    BBMonitorSetState(a1, 6u);
    BBMonitorCancelEvents(a1);
    if ((*(_BYTE *)(a1 + 4) & 0x40) == 0)
    {
      logger = mysyslog_get_logger();
      v4 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v4))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219EF1000, logger, v4, "BBMonitorRetainWiFiAssertion", buf, 2u);
      }
      *(_DWORD *)(a1 + 4) |= 0x40u;
      NetIFRetainWiFiAssertion();
    }
    if (!BBMonitorStartProbe(a1))
    {
      v5 = 0;
LABEL_9:
      BBMonitor_Idle(a1, 0, &v5);
    }
  }
}

void BBMonitorSetState(uint64_t a1, unsigned int a2)
{
  NSObject *logger;
  os_log_type_t v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    if (a2 > 6)
      v6 = "<unknown>";
    else
      v6 = off_24DC16B50[a2];
    v7 = 136315138;
    v8 = v6;
    _os_log_impl(&dword_219EF1000, logger, v5, "BBMonitorState: %s", (uint8_t *)&v7, 0xCu);
  }
  *(_DWORD *)(a1 + 28) = a2;
}

uint64_t BBMonitorReportState(uint64_t result, int a2)
{
  uint64_t v3;
  NSObject *logger;
  os_log_type_t v5;
  const char *v6;
  int v7;
  int v8;
  unsigned int v9;
  uint64_t state64;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v3 = result;
  v13 = *MEMORY[0x24BDAC8D0];
  if ((*(_DWORD *)(result + 4) & 2) == 0 || (*(_DWORD *)(result + 4) & 1) != a2)
  {
    state64 = 0;
    logger = mysyslog_get_logger();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      v6 = "";
      if (!a2)
        v6 = "not ";
      *(_DWORD *)buf = 136315138;
      v12 = v6;
      _os_log_impl(&dword_219EF1000, logger, v5, "BrokenBackhaul: telling symptoms backhaul is %sbroken", buf, 0xCu);
    }
    notify_get_state(*(_DWORD *)(v3 + 64), &state64);
    result = CaptiveSymptomReportBackhaulState();
    v7 = *(_DWORD *)(v3 + 4);
    v8 = v7 | 3;
    v9 = v7 & 0xFFFFFFFC | 2;
    if (a2)
      v9 = v8;
    *(_DWORD *)(v3 + 4) = v9;
  }
  return result;
}

void BBMonitorSetInterfaceAdvisory(uint64_t a1, int a2)
{
  const __CFString *v2;
  int v5;
  NSObject *logger;
  os_log_type_t v7;
  const char *v8;
  const char *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a2)
    v2 = CFSTR("unable to reach probe server");
  else
    v2 = CFSTR("probe server is reachable again");
  if (((*(_DWORD *)(a1 + 4) >> 2) & 1) != a2)
  {
    v5 = SCNetworkInterfaceSetAdvisory();
    logger = mysyslog_get_logger();
    v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v7))
    {
      v8 = "Set";
      if (!a2)
        v8 = "Clear";
      v10 = 136315650;
      v11 = v8;
      if (v5)
        v9 = "";
      else
        v9 = " FAILED";
      v12 = 2112;
      v13 = v2;
      v14 = 2080;
      v15 = v9;
      _os_log_impl(&dword_219EF1000, logger, v7, "BBMonitor: %sAdvisory '%@'%s", (uint8_t *)&v10, 0x20u);
    }
    *(_DWORD *)(a1 + 4) = *(_DWORD *)(a1 + 4) & 0xFFFFFFFB | (4 * (a2 != 0));
  }
}

BOOL BBMonitorStartProbe(uint64_t a1)
{
  const __CFString *BSDName;
  int v3;
  const void *v4;
  unsigned int v5;
  CFRunLoopRef Current;
  _QWORD *v7;
  _BOOL8 result;
  NSObject *logger;
  os_log_type_t v10;
  uint8_t v11[16];

  BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 8));
  BBMonitorCancelEvents(a1);
  v3 = (*(unsigned __int8 *)(a1 + 4) >> 3) & 1;
  v4 = *(const void **)(a1 + 16);
  v5 = *(double *)&S_BBMProbeTimeout;
  Current = CFRunLoopGetCurrent();
  v7 = captive_agent_send_probe(v4, BSDName, v3, 0, v5, (uint64_t)HandleProbeResult, a1, (uint64_t)Current);
  *(_QWORD *)(a1 + 72) = v7;
  if (v7)
    return 1;
  logger = mysyslog_get_logger();
  v10 = _SC_syslog_os_log_mapping();
  result = os_log_type_enabled(logger, v10);
  if (result)
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_219EF1000, logger, v10, "BBMonitor: captive_agent_send_probe failed", v11, 2u);
    return 0;
  }
  return result;
}

void BBMonitor_Selecting(uint64_t a1, int a2, _BYTE *a3)
{
  double v4;
  NSObject *logger;
  os_log_type_t v6;
  __CFDictionary *Mutable;
  __CFBundle *Bundle;
  const __CFString *v9;
  const __CFArray *v10;
  CFTypeID TypeID;
  const __CFArray *v12;
  const __CFArray *v13;
  const __CFArray *v14;
  const __CFString *ValueAtIndex;
  CFStringRef BSDName;
  uint64_t v18;
  const void *v19;
  const void *SSID;
  CFDateRef v21;
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  os_log_type_t v33;
  const char *v34;
  NSObject *v35;
  os_log_type_t v36;
  CFURLRef v37;
  CFURLRef v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const void *v42;
  uint64_t v43;
  const __CFString *v44;
  const __CFString *v45;
  CFStringRef v46;
  __CFUserNotification *v47;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *Current;
  NSObject *v50;
  os_log_type_t v51;
  NSObject *v52;
  uint64_t v53;
  SInt32 error;
  uint8_t buf[4];
  double v56;
  __int16 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  if (a2 == 3)
  {
    *(CFAbsoluteTime *)(a1 + 112) = CFAbsoluteTimeGetCurrent();
    *(_BYTE *)(a1 + 120) = *a3;
    BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 8));
    v18 = NetIFCopyCurrentWiFiNetwork((uint64_t)BSDName);
    if (v18)
    {
      v19 = (const void *)v18;
      SSID = (const void *)WiFiNetworkGetSSID();
      if (SSID && CFEqual(SSID, *(CFTypeRef *)(a1 + 16)))
      {
        WiFiNetworkSetProperty();
        v21 = CFDateCreate(0, *(CFAbsoluteTime *)(a1 + 112));
        WiFiNetworkSetProperty();
        BBMonitorLogUserChoice(a1, (uint64_t)"Saved", (uint64_t)v21);
        CFRelease(v21);
      }
      NetIFUpdateWiFiNetwork();
      CFRelease(v19);
    }
  }
  else
  {
    if (a2)
      return;
    BBMonitorSetState(a1, 3u);
    BBMonitorCancelEvents(a1);
    v4 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 112);
    if (v4 > *(double *)&S_BBMPromptInterval)
    {
      error = 0;
      if (S_bb)
      {
        logger = mysyslog_get_logger();
        v6 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v6))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219EF1000, logger, v6, "BBMonitor: canceling pending prompt", buf, 2u);
        }
        BBMonitorCancelPrompt(S_bb);
      }
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      Bundle = (__CFBundle *)CaptiveGetBundle();
      v9 = (const __CFString *)*MEMORY[0x24BDBD570];
      CFPreferencesSynchronize(CFSTR(".GlobalPreferences"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
      v10 = (const __CFArray *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), CFSTR(".GlobalPreferences"), CFSTR("mobile"), v9);
      TypeID = CFArrayGetTypeID();
      if (v10 && CFGetTypeID(v10) == TypeID)
      {
        v12 = CFBundleCopyBundleLocalizations(Bundle);
        if (!v12)
        {
          v32 = mysyslog_get_logger();
          v33 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v32, v33))
            goto LABEL_31;
          *(_WORD *)buf = 0;
          v34 = "failed to retrieve localizations";
          goto LABEL_30;
        }
        v13 = CFBundleCopyLocalizationsForPreferences(v12, v10);
        if (v13)
        {
          v14 = v13;
          if (CFArrayGetCount(v13))
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v14, 0);
LABEL_32:
            v35 = mysyslog_get_logger();
            v36 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v35, v36))
            {
              *(_DWORD *)buf = 138412290;
              v56 = *(double *)&ValueAtIndex;
              _os_log_impl(&dword_219EF1000, v35, v36, "Using localization for %@", buf, 0xCu);
            }
            CFRetain(ValueAtIndex);
            v37 = CFBundleCopyBundleURL(Bundle);
            if (v37)
            {
              v38 = v37;
              CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDBD710], v37);
              CFRelease(v38);
            }
            if (*(_BYTE *)(a1 + 24))
              v39 = CFSTR("BROKEN_BACKHAUL_ALTERNATE_BUTTON_CH");
            else
              v39 = CFSTR("BROKEN_BACKHAUL_ALTERNATE_BUTTON");
            if (*(_BYTE *)(a1 + 24))
              v40 = CFSTR("BROKEN_BACKHAUL_HEADER_FORMAT_CH");
            else
              v40 = CFSTR("BROKEN_BACKHAUL_HEADER_FORMAT");
            if (*(_BYTE *)(a1 + 24))
              v41 = CFSTR("BROKEN_BACKHAUL_MESSAGE_CH");
            else
              v41 = CFSTR("BROKEN_BACKHAUL_MESSAGE");
            v42 = (const void *)*MEMORY[0x24BDBD6D8];
            v43 = *(_QWORD *)(a1 + 16);
            v44 = (const __CFString *)CFBundleCopyLocalizedStringForLocalization();
            if (v44)
            {
              v45 = v44;
              v46 = CFStringCreateWithFormat(0, 0, v44, v43);
              CFDictionaryAddValue(Mutable, v42, v46);
              CFRelease(v46);
              CFRelease(v45);
            }
            else
            {
              CFDictionaryAddValue(Mutable, v42, v40);
            }
            add_localized_string((uint64_t)Bundle, (uint64_t)ValueAtIndex, Mutable, (const void *)*MEMORY[0x24BDBD6E0], v41);
            add_localized_string((uint64_t)Bundle, (uint64_t)ValueAtIndex, Mutable, (const void *)*MEMORY[0x24BDBD6F8], CFSTR("BROKEN_BACKHAUL_DEFAULT_BUTTON"));
            add_localized_string((uint64_t)Bundle, (uint64_t)ValueAtIndex, Mutable, (const void *)*MEMORY[0x24BDBD6F0], v39);
            v47 = CFUserNotificationCreate(0, 0.0, 0, &error, Mutable);
            CFRelease(Mutable);
            CFRelease(ValueAtIndex);
            if (v47)
            {
              RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v47, (CFUserNotificationCallBack)BBMonitorUserResponse, 0);
              Current = CFRunLoopGetCurrent();
              CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
              *(_QWORD *)(a1 + 88) = v47;
              *(_QWORD *)(a1 + 96) = RunLoopSource;
              *(CFAbsoluteTime *)(a1 + 104) = CFAbsoluteTimeGetCurrent();
              S_bb = a1;
              v50 = mysyslog_get_logger();
              v51 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v50, v51))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_219EF1000, v50, v51, "BBMonitor: prompting user, waiting for response", buf, 2u);
              }
            }
            else
            {
              v52 = mysyslog_get_logger();
              v53 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v52, (os_log_type_t)v53))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_219EF1000, v52, (os_log_type_t)v53, "BBMonitor: failed to create CFUserNotification", buf, 2u);
              }
              buf[0] = 0;
              BBMonitor_Idle(a1, 0, buf);
            }
            return;
          }
        }
        v32 = mysyslog_get_logger();
        v33 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v32, v33))
        {
          *(_WORD *)buf = 0;
          v34 = "failed to retrieve preferred localization";
          goto LABEL_30;
        }
      }
      else
      {
        v32 = mysyslog_get_logger();
        v33 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v32, v33))
        {
          *(_WORD *)buf = 0;
          v34 = "No default language";
LABEL_30:
          _os_log_impl(&dword_219EF1000, v32, v33, v34, buf, 2u);
        }
      }
LABEL_31:
      ValueAtIndex = CFSTR("en");
      goto LABEL_32;
    }
    v22 = mysyslog_get_logger();
    v23 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v22, v23))
    {
      *(_DWORD *)buf = 134218240;
      v56 = v4;
      v57 = 2048;
      v58 = S_BBMPromptInterval;
      _os_log_impl(&dword_219EF1000, v22, v23, "BBMonitor: can't show prompt (%g < %g)", buf, 0x16u);
    }
  }
  v24 = *(unsigned __int8 *)(a1 + 120);
  v25 = mysyslog_get_logger();
  v26 = _SC_syslog_os_log_mapping();
  v27 = os_log_type_enabled(v25, v26);
  if (v24)
  {
    if (v27)
    {
      v28 = *(unsigned int *)(a1 + 28);
      if (v28 > 6)
        v29 = "<unknown>";
      else
        v29 = off_24DC16B50[v28];
      *(_DWORD *)buf = 136315138;
      v56 = *(double *)&v29;
      _os_log_impl(&dword_219EF1000, v25, v26, "BBMonitor(%s): using cellular", buf, 0xCu);
    }
    BBMonitor_Broken((__CFRunLoopTimer *)a1, 0, 0);
  }
  else
  {
    if (v27)
    {
      v30 = *(unsigned int *)(a1 + 28);
      if (v30 > 6)
        v31 = "<unknown>";
      else
        v31 = off_24DC16B50[v30];
      *(_DWORD *)buf = 136315138;
      v56 = *(double *)&v31;
      _os_log_impl(&dword_219EF1000, v25, v26, "BBMonitor(%s): staying on Wi-Fi", buf, 0xCu);
    }
    BBMonitor_Ignoring(a1, 0);
  }
}

void HandleProbeResult(uint64_t a1, unsigned int a2)
{
  NSObject *logger;
  os_log_type_t v5;
  const char *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, int *);
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  char *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  void (*v17)(_QWORD, uint64_t);
  unsigned int v18;
  uint64_t v19;
  int v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a1 + 72) = 0;
  logger = mysyslog_get_logger();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    if (a2 > 0xA)
      v6 = "<unknown>";
    else
      v6 = off_24DC16BC0[a2];
    *(_DWORD *)buf = 136315394;
    v22 = (void *)v6;
    v23 = 1024;
    LODWORD(v24) = a2;
    _os_log_impl(&dword_219EF1000, logger, v5, "BBMonitor: probe result '%s' (%d)", buf, 0x12u);
  }
  v7 = *(unsigned int *)(a1 + 28);
  if (v7 <= 6 && (_DWORD)v7)
  {
    v8 = (void (*)(uint64_t, uint64_t, int *))BBMStateMachineFunctionGet_funcs[v7];
    if (a2 <= 0xC)
    {
      if (((1 << a2) & 0x1E02) != 0)
      {
        v20 = 0;
        v9 = "";
LABEL_11:
        v10 = mysyslog_get_logger();
        v11 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v10, v11))
        {
          v12 = off_24DC16B50[v7];
          if (a2 > 0xA)
            v13 = "<unknown>";
          else
            v13 = off_24DC16BC0[a2];
          *(_DWORD *)buf = 136315650;
          v22 = v12;
          v23 = 2080;
          v24 = v13;
          v25 = 2080;
          v26 = v9;
          _os_log_impl(&dword_219EF1000, v10, v11, "BBMonitor (%s): Probe Complete: Result %s%s", buf, 0x20u);
        }
        v8(a1, 1, &v20);
        v17 = *(void (**)(_QWORD, uint64_t))(a1 + 32);
        if (v17 && (v20 - 1) <= 1)
        {
          v18 = (*(_DWORD *)(a1 + 4) >> 2) & 2 | (v20 == 2);
          if ((_DWORD)v7 == 6)
            v19 = v18 | 4;
          else
            v19 = v18;
          v17(*(_QWORD *)(a1 + 40), v19);
        }
        return;
      }
      if (((1 << a2) & 0xC) != 0)
      {
        v20 = 2;
        v16 = *(_DWORD *)(a1 + 4);
        if ((v16 & 8) != 0)
        {
          *(_DWORD *)(a1 + 4) = v16 | 0x20;
          CaptiveAnalyticsSessionPostIncompleteEvent(1u);
          v9 = " [captive whitelist]";
        }
        else
        {
          v9 = " [captive]";
        }
        goto LABEL_11;
      }
      if (!a2)
      {
        v20 = 1;
        v9 = " [not captive]";
        goto LABEL_11;
      }
    }
    v20 = 3;
    v9 = " [broken]";
    goto LABEL_11;
  }
  v14 = mysyslog_get_logger();
  v15 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v14, v15))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v22) = v7;
    _os_log_impl(&dword_219EF1000, v14, v15, "BBMonitor: no function for state %d", buf, 8u);
  }
}

void BBMonitor_Broken(__CFRunLoopTimer *a1, int a2, _DWORD *a3)
{
  NSObject *v4;
  os_log_type_t v5;
  double v6;
  NSObject *logger;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 == 2)
  {
    logger = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_219EF1000, logger, v8, "BBMonitor: woke up, probing again", (uint8_t *)&v11, 2u);
    }
    BBMonitorCancelEvents((uint64_t)a1);
    if (!BBMonitorStartProbe((uint64_t)a1))
    {
      v6 = *(double *)&S_BBMProbeInterval;
LABEL_11:
      BBMonitorSetTimer((uint64_t)a1, a1, v6);
    }
  }
  else
  {
    if (a2 != 1)
    {
      if (a2)
        return;
      BBMonitorSetState((uint64_t)a1, 4u);
      BBMonitorCancelEvents((uint64_t)a1);
      BBMonitorReportState((uint64_t)a1, 1);
      BBMonitorSetInterfaceAdvisory((uint64_t)a1, 1);
      v4 = mysyslog_get_logger();
      v5 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v4, v5))
      {
        v11 = 134217984;
        v12 = S_BBMProbeInterval;
        _os_log_impl(&dword_219EF1000, v4, v5, "BBMonitor: setting timer to wake up in %g seconds", (uint8_t *)&v11, 0xCu);
      }
      v6 = *(double *)&S_BBMProbeInterval;
      goto LABEL_11;
    }
    if (*a3 == 3)
    {
      BBMonitorSetTimer((uint64_t)a1, a1, *(double *)&S_BBMProbeInterval);
    }
    else
    {
      v9 = mysyslog_get_logger();
      v10 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v9, v10))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_219EF1000, v9, v10, "BBMonitor: no longer broken", (uint8_t *)&v11, 2u);
      }
      BBMonitor_Idle((uint64_t)a1, 0, 0);
    }
  }
}

void BBMonitor_Ignoring(uint64_t a1, int a2)
{
  CFDateRef v3;
  NSObject *logger;
  os_log_type_t v5;
  uint64_t v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  CFDateRef v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a2)
  {
    BBMonitorSetState(a1, 5u);
    BBMonitorCancelEvents(a1);
    v3 = CFDateCreate(0, *(double *)(a1 + 112) + *(double *)&S_BBMPromptInterval);
    logger = mysyslog_get_logger();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      v6 = *(unsigned int *)(a1 + 28);
      if (v6 > 6)
        v7 = "<unknown>";
      else
        v7 = off_24DC16B50[v6];
      v8 = 136315394;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_219EF1000, logger, v5, "BBMonitor(%s): waiting to prompt again until %@", (uint8_t *)&v8, 0x16u);
    }
    CFRelease(v3);
  }
}

void BBMonitorSetTimer(uint64_t a1, __CFRunLoopTimer *a2, double a3)
{
  CFRunLoopTimerRef *v6;

  v6 = *(CFRunLoopTimerRef **)(a1 + 80);
  if (!v6)
  {
    TimerCreate();
    *(_QWORD *)(a1 + 80) = v6;
  }
  TimerSet(v6, (__CFRunLoopTimer *)BBMonitor_Broken, a2, (__CFRunLoopTimer *)2, 0, a3);
}

void add_localized_string(uint64_t a1, uint64_t a2, __CFDictionary *a3, const void *a4, const void *a5)
{
  const void *v8;
  const void *v9;

  v8 = (const void *)CFBundleCopyLocalizedStringForLocalization();
  if (v8)
  {
    v9 = v8;
    CFDictionaryAddValue(a3, a4, v8);
    CFRelease(v9);
  }
  else
  {
    CFDictionaryAddValue(a3, a4, a5);
  }
}

void BBMonitorUserResponse(uint64_t a1, const char *a2)
{
  NSObject *logger;
  os_log_type_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  __CFRunLoop *Current;
  const void *v14;
  const void *v15;
  int v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  const char *v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    v21 = 134217984;
    v22 = a2;
    _os_log_impl(&dword_219EF1000, logger, v5, "response flags 0x%lx", (uint8_t *)&v21, 0xCu);
  }
  v6 = S_bb;
  if (S_bb)
  {
    if (*(_QWORD *)(S_bb + 88) == a1)
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(v6 + 96), (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      v14 = *(const void **)(v6 + 96);
      if (v14)
      {
        CFRelease(v14);
        *(_QWORD *)(v6 + 96) = 0;
      }
      v15 = *(const void **)(v6 + 88);
      if (v15)
      {
        CFRelease(v15);
        *(_QWORD *)(v6 + 88) = 0;
      }
      S_bb = 0;
      if (*(_DWORD *)(v6 + 28) == 3)
      {
        LOBYTE(v21) = (a2 & 3) == 0;
        if ((a2 & 3) != 0)
          v16 = 2;
        else
          v16 = 1;
        _BBMonitorPostEvent(v6, v16);
        BBMonitor_Selecting(v6, 3, &v21);
      }
      else
      {
        v17 = mysyslog_get_logger();
        v18 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v17, v18))
        {
          v19 = *(unsigned int *)(v6 + 28);
          if (v19 > 6)
            v20 = "<unknown>";
          else
            v20 = off_24DC16B50[v19];
          v21 = 136315138;
          v22 = v20;
          v9 = "BBMonitor: not selecting (%s), ignoring";
          v10 = v17;
          v11 = v18;
          v12 = 12;
          goto LABEL_10;
        }
      }
    }
    else
    {
      v7 = mysyslog_get_logger();
      LOBYTE(v8) = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v7, (os_log_type_t)v8))
      {
        LOWORD(v21) = 0;
        v9 = "BBMonitorUserResponse: mismatch cfun";
LABEL_9:
        v10 = v7;
        v11 = v8;
        v12 = 2;
LABEL_10:
        _os_log_impl(&dword_219EF1000, v10, v11, v9, (uint8_t *)&v21, v12);
      }
    }
  }
  else
  {
    v7 = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v7, (os_log_type_t)v8))
    {
      LOWORD(v21) = 0;
      v9 = "BBMonitorUserResponse: why S_bb NULL?";
      goto LABEL_9;
    }
  }
}

uint64_t WebSheetStateSetIsAllowed(uint64_t result, char a2)
{
  if (result)
    *(_BYTE *)(result + 72) = a2;
  return result;
}

void WebSheetStateIssueExitCommand(uint64_t a1)
{
  uint64_t v2;
  NSObject *logger;
  os_log_type_t v4;
  _BOOL4 v5;
  CFDictionaryRef Command;
  uint8_t v7[16];
  uint8_t buf[16];

  v2 = *(_QWORD *)(a1 + 64);
  logger = mysyslog_get_logger();
  v4 = _SC_syslog_os_log_mapping();
  v5 = os_log_type_enabled(logger, v4);
  if (v2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, logger, v4, "WebSheet is registered, issuing exit command", buf, 2u);
    }
    my_FieldSetRetainedCFType((const void **)(a1 + 40), 0);
    Command = createCommand(3, 0, 0, 0);
    WebSheetStateIssueCommand(a1, Command, 1);
    CFRelease(Command);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_219EF1000, logger, v4, "WebSheet is not registered, cleaning up WebSheet state", v7, 2u);
    }
    WebSheetStateCleanup((uint64_t *)a1);
  }
}

CFDictionaryRef createCommand(int a1, CFStringRef a2, uint64_t a3, void *a4)
{
  CFStringRef v6;
  const __CFAllocator *v7;
  CFNumberRef v8;
  unsigned int v9;
  CFDictionaryRef v10;
  int valuePtr;
  void *values[2];
  uint64_t v14;
  uint64_t v15;
  void *keys[2];
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  valuePtr = a1;
  if (a2)
  {
    v6 = 0;
  }
  else
  {
    v6 = my_CFUUIDStringCreate(0);
    a2 = v6;
  }
  v17 = 0;
  v18 = 0;
  v14 = 0;
  v15 = 0;
  keys[0] = CFSTR("UniqueID");
  values[0] = (void *)a2;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  keys[1] = CFSTR("Type");
  values[1] = v8;
  if (a3)
  {
    v17 = CFSTR("Info");
    v14 = a3;
    v9 = 3;
    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  v9 = 2;
  if (a4)
  {
LABEL_6:
    keys[v9] = CFSTR("ProbeResult");
    values[v9++] = a4;
  }
LABEL_7:
  v10 = CFDictionaryCreate(v7, (const void **)keys, (const void **)values, v9, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v8)
    CFRelease(v8);
  if (v6)
    CFRelease(v6);
  return v10;
}

uint64_t WebSheetStateIssueCommand(uint64_t a1, void *value, int a3)
{
  __CFArray *Mutable;
  uint64_t result;

  Mutable = *(__CFArray **)(a1 + 48);
  if (Mutable)
  {
    if (a3)
    {
      CFArrayRemoveAllValues(Mutable);
      Mutable = *(__CFArray **)(a1 + 48);
    }
  }
  else
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    *(_QWORD *)(a1 + 48) = Mutable;
  }
  CFArrayAppendValue(Mutable, value);
  result = *(_QWORD *)(a1 + 64);
  if (result)
    return CommandHandlerNotify(result);
  return result;
}

void WebSheetStateCleanup(uint64_t *a1)
{
  const void *v2;
  unint64_t Count;
  uint64_t v4;
  const void **v5;
  void **v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  uint64_t v12;
  _OWORD v13[10];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1 && *((_BYTE *)a1 + 112))
  {
    *((_BYTE *)a1 + 112) = 0;
    notify_post((const char *)*MEMORY[0x24BE14BE0]);
  }
  my_FieldSetRetainedCFType((const void **)a1 + 8, 0);
  my_FieldSetRetainedCFType((const void **)a1 + 5, 0);
  v2 = (const void *)a1[6];
  if (v2)
  {
    CFRelease(v2);
    a1[6] = 0;
  }
  if (S_prober_list)
  {
    Count = CFDictionaryGetCount((CFDictionaryRef)S_prober_list);
    v4 = Count;
    if (Count < 0xB)
      v5 = (const void **)v13;
    else
      v5 = (const void **)malloc_type_malloc(16 * Count, 0xC996A348uLL);
    memset(v13, 0, sizeof(v13));
    if (v4 >= 1)
    {
      CFDictionaryGetKeysAndValues((CFDictionaryRef)S_prober_list, v5, &v5[v4]);
      v6 = (void **)v5;
      v7 = v4;
      do
      {
        v8 = *v6;
        if (*(uint64_t **)CFDataGetBytePtr((CFDataRef)v6[v4]) == a1)
          ProberContextRemove(v8);
        ++v6;
        --v7;
      }
      while (v7);
    }
    if (v5 != (const void **)v13)
      free(v5);
  }
  S_webSheetDoneCallback(a1[4], 6, 0);
  *((_WORD *)a1 + 36) = 0;
  WebSheetStateClearCheckInTimer((uint64_t)a1);
  v9 = (const void *)a1[10];
  if (v9)
  {
    CFRelease(v9);
    a1[10] = 0;
  }
  v10 = (const void *)a1[11];
  if (v10)
  {
    CFRelease(v10);
    a1[11] = 0;
  }
  v11 = (const void *)a1[2];
  if (v11)
    CFRelease(v11);
  v12 = *a1;
  if (*a1)
    *(_QWORD *)(v12 + 8) = a1[1];
  *(_QWORD *)a1[1] = v12;
  free(a1);
}

CFRunLoopTimerRef *WebSheetStateLaunchApplication(__CFRunLoopTimer *a1, const void *a2, const void *a3, const void *a4)
{
  CFTypeID TypeID;
  CFRunLoopTimerRef *v9;
  NSObject *logger;
  os_log_type_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  CFTypeID v17;
  CFRunLoopTimerRef *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  NSObject *v22;
  os_log_type_t v23;
  const __CFAllocator *v24;
  CFAbsoluteTime Current;
  CFRunLoopTimerRef v26;
  __CFRunLoop *v27;
  CFRunLoopTimerContext v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  TypeID = CFStringGetTypeID();
  if (!a2 || CFGetTypeID(a2) != TypeID)
  {
    logger = mysyslog_get_logger();
    v11 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v11))
      return 0;
    LODWORD(v28.version) = 138412290;
    *(CFIndex *)((char *)&v28.version + 4) = (CFIndex)a2;
    v12 = "Unable to find WebSheet state given interface: %@";
    v13 = logger;
    v14 = v11;
    v15 = 12;
LABEL_9:
    _os_log_impl(&dword_219EF1000, v13, v14, v12, (uint8_t *)&v28, v15);
    return 0;
  }
  v9 = (CFRunLoopTimerRef *)&S_WebSheetStateHeadStorage;
  while (1)
  {
    v9 = (CFRunLoopTimerRef *)*v9;
    if (!v9)
      break;
    if (CFEqual(a2, v9[2]))
      goto LABEL_19;
  }
  v17 = CFStringGetTypeID();
  if (CFGetTypeID(a2) == v17)
  {
    v18 = (CFRunLoopTimerRef *)malloc_type_malloc(0x78uLL, 0x10E004041B342B6uLL);
    v9 = v18;
    if (v18)
    {
      v18[14] = 0;
      *((_OWORD *)v18 + 5) = 0u;
      *((_OWORD *)v18 + 6) = 0u;
      *((_OWORD *)v18 + 3) = 0u;
      *((_OWORD *)v18 + 4) = 0u;
      *((_OWORD *)v18 + 1) = 0u;
      *((_OWORD *)v18 + 2) = 0u;
      *(_OWORD *)v18 = 0u;
      v18[2] = (CFRunLoopTimerRef)CFRetain(a2);
    }
  }
  else
  {
    v9 = 0;
  }
  v19 = S_WebSheetStateHeadStorage;
  *v9 = (CFRunLoopTimerRef)S_WebSheetStateHeadStorage;
  if (v19)
    *(_QWORD *)(v19 + 8) = v9;
  S_WebSheetStateHeadStorage = (uint64_t)v9;
  v9[1] = (CFRunLoopTimerRef)&S_WebSheetStateHeadStorage;
LABEL_19:
  v9[4] = a1;
  my_FieldSetRetainedCFType((const void **)v9 + 10, a4);
  my_FieldSetRetainedCFType((const void **)v9 + 11, a3);
  if (v9[8] || v9[3] || v9[12] || v9[13])
  {
    v20 = mysyslog_get_logger();
    v21 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v20, v21))
    {
      LOWORD(v28.version) = 0;
      _os_log_impl(&dword_219EF1000, v20, v21, "WebSheet is already running", (uint8_t *)&v28, 2u);
    }
    return v9;
  }
  if (_AMLaunchApplicationWithIdentifier((uint64_t)CFSTR("com.apple.WebSheet"), 1))
  {
    v22 = mysyslog_get_logger();
    v23 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v22, v23))
      return 0;
    LOWORD(v28.version) = 0;
    v12 = "Failed to launch WebSheet";
    v13 = v22;
    v14 = v23;
    v15 = 2;
    goto LABEL_9;
  }
  v28.version = 0;
  memset(&v28.retain, 0, 24);
  v28.info = v9;
  v24 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Current = CFAbsoluteTimeGetCurrent();
  v26 = CFRunLoopTimerCreate(v24, Current + 10.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)WebSheetLaunchTimeout, &v28);
  v9[3] = v26;
  if (v26)
  {
    v27 = CFRunLoopGetCurrent();
    CFRunLoopAddTimer(v27, v9[3], (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  }
  return v9;
}

void WebSheetLaunchTimeout(uint64_t a1, uint64_t a2)
{
  NSObject *logger;
  os_log_type_t v3;
  uint8_t v5[16];

  if (*(_QWORD *)(a2 + 24) == a1)
  {
    if (!*(_BYTE *)(a2 + 73))
    {
      *(_BYTE *)(a2 + 73) = 1;
      if (*(_BYTE *)(a2 + 72) == 1)
        S_webSheetDoneCallback(*(_QWORD *)(a2 + 32), 2, 0);
    }
    WebSheetStateCleanup((uint64_t *)a2);
  }
  else
  {
    logger = mysyslog_get_logger();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_219EF1000, logger, v3, "Timer fired but no timer set", v5, 2u);
    }
  }
}

uint64_t WebSheetStateSetIsUIRequired(uint64_t result, int a2)
{
  if (result)
  {
    if (*(unsigned __int8 *)(result + 112) != a2)
    {
      *(_BYTE *)(result + 112) = a2;
      return notify_post((const char *)*MEMORY[0x24BE14BE0]);
    }
  }
  return result;
}

uint64_t WebSheetStateGetIsUIRequired(uint64_t result)
{
  if (result)
    return *(unsigned __int8 *)(result + 112);
  return result;
}

void WebSheetHandlerInitialize(uint64_t (*a1)(_QWORD, _QWORD, _QWORD))
{
  S_WebSheetStateHeadStorage = 0;
  CommandHandlerClassRegister(1u, (uint64_t)WebSheetHandlerMethods);
  S_webSheetDoneCallback = a1;
}

uint64_t CNSServerDebugLaunchWebsheet(uint64_t a1, UInt8 *a2, unsigned int a3, _DWORD *a4, _OWORD *a5)
{
  __int128 v8;
  const __CFData *v9;
  CFTypeID TypeID;
  const __CFString *Value;
  CFTypeID v12;
  const __CFString *v13;
  const __CFString *v14;
  CFTypeID v15;
  const __CFString *v16;
  const __CFString *v17;
  CFTypeID v18;
  const __CFString *v19;
  NSObject *logger;
  os_log_type_t v21;
  CFRunLoopTimerRef *v22;
  NSObject *v23;
  os_log_type_t v24;
  NSObject *v25;
  os_log_type_t v26;
  NSObject *v28;
  os_log_type_t v29;
  _OWORD v30[2];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  *a4 = 1;
  v8 = a5[1];
  v30[0] = *a5;
  v30[1] = v8;
  if (isCallingInternalProcEntitled(v30))
  {
    if (!CaptiveIsActive())
    {
      *a4 = 6;
      goto LABEL_25;
    }
    v9 = my_CFPropertyListCreateWithBytePtrAndLength(a2, a3);
    TypeID = CFDictionaryGetTypeID();
    if (v9 && CFGetTypeID(v9) == TypeID)
    {
      Value = (const __CFString *)CFDictionaryGetValue(v9, (const void *)*MEMORY[0x24BE14B98]);
      v12 = CFStringGetTypeID();
      v13 = CFSTR("http://www.apple.com");
      if (Value && CFGetTypeID(Value) == v12)
        v13 = Value;
      v14 = (const __CFString *)CFDictionaryGetValue(v9, (const void *)*MEMORY[0x24BE14B78]);
      v15 = CFStringGetTypeID();
      v16 = CFSTR("en0");
      if (v14 && CFGetTypeID(v14) == v15)
        v16 = v14;
      v17 = (const __CFString *)CFDictionaryGetValue(v9, (const void *)*MEMORY[0x24BE14B80]);
      v18 = CFStringGetTypeID();
      v19 = CFSTR("AppleWiFi");
      if (v17 && CFGetTypeID(v17) == v18)
        v19 = v17;
      logger = mysyslog_get_logger();
      v21 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v21))
      {
        LODWORD(v30[0]) = 138412290;
        *(_QWORD *)((char *)v30 + 4) = v9;
        _os_log_impl(&dword_219EF1000, logger, v21, "launching websheet: %@", (uint8_t *)v30, 0xCu);
      }
      v22 = WebSheetStateLaunchApplication(0, v16, v13, v19);
      if (v22)
      {
        *a4 = 0;
        *((_BYTE *)v22 + 72) = 1;
      }
      else
      {
        v28 = mysyslog_get_logger();
        v29 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v28, v29))
        {
          LOWORD(v30[0]) = 0;
          _os_log_impl(&dword_219EF1000, v28, v29, "CreateWebSheet failed", (uint8_t *)v30, 2u);
        }
      }
LABEL_24:
      CFRelease(v9);
      goto LABEL_25;
    }
    v25 = mysyslog_get_logger();
    v26 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v25, v26))
    {
      LOWORD(v30[0]) = 0;
      _os_log_impl(&dword_219EF1000, v25, v26, "WebSheet data is invalid", (uint8_t *)v30, 2u);
    }
    *a4 = 22;
    if (v9)
      goto LABEL_24;
  }
  else
  {
    *a4 = 1;
    v23 = mysyslog_get_logger();
    v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      LOWORD(v30[0]) = 0;
      _os_log_impl(&dword_219EF1000, v23, v24, "Calling application is not entitled", (uint8_t *)v30, 2u);
    }
  }
LABEL_25:
  if (a2)
    MEMORY[0x2207368F4](*MEMORY[0x24BDAEC58], a2, a3);
  return 0;
}

void WebSheetStateClearCheckInTimer(uint64_t a1)
{
  __CFRunLoop *Current;
  const void *v3;

  if (*(_QWORD *)(a1 + 24))
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(Current, *(CFRunLoopTimerRef *)(a1 + 24), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(a1 + 24));
    v3 = *(const void **)(a1 + 24);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 24) = 0;
    }
  }
}

void ProberContextRemove(void *a1)
{
  const UInt8 *v2;
  const UInt8 *v3;
  uint64_t *v4;
  NSObject *logger;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = ProberContextGet(a1);
  if (v2)
  {
    v3 = v2;
    v4 = (uint64_t *)(v2 + 8);
    if (*((_QWORD *)v2 + 1))
    {
      logger = mysyslog_get_logger();
      v6 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v6))
      {
        v7 = *v4;
        v13 = 138412546;
        v14 = a1;
        v15 = 2048;
        v16 = v7;
        _os_log_impl(&dword_219EF1000, logger, v6, "prober %@ detect %p removed", (uint8_t *)&v13, 0x16u);
      }
      captive_agent_abort_probe(v4);
    }
    v9 = *((_QWORD *)v3 + 2);
    v8 = (uint64_t *)(v3 + 16);
    if (v9)
    {
      v10 = mysyslog_get_logger();
      v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = *v8;
        v13 = 138412546;
        v14 = a1;
        v15 = 2048;
        v16 = v12;
        _os_log_impl(&dword_219EF1000, v10, v11, "prober %@ query_api %p removed", (uint8_t *)&v13, 0x16u);
      }
      captive_agent_abort_query(v8);
    }
    CFDictionaryRemoveValue((CFMutableDictionaryRef)S_prober_list, a1);
    if (!CFDictionaryGetCount((CFDictionaryRef)S_prober_list))
    {
      if (S_prober_list)
      {
        CFRelease((CFTypeRef)S_prober_list);
        S_prober_list = 0;
      }
    }
  }
}

const UInt8 *ProberContextGet(void *key)
{
  const __CFData *Value;

  if (S_prober_list && (Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)S_prober_list, key)) != 0)
    return CFDataGetBytePtr(Value);
  else
    return 0;
}

uint64_t WebSheetAuthorize(_OWORD *a1)
{
  __int128 v2;
  int pid;
  __int128 v4;
  uint64_t has_BOOLean_entitlement;
  NSObject *logger;
  os_log_type_t v7;
  const char *v8;
  uint64_t *v9;
  int v10;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t *v18;
  int v19;
  _BYTE v21[32];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = a1[1];
  *(_OWORD *)v21 = *a1;
  *(_OWORD *)&v21[16] = v2;
  pid = audit_token_get_pid(v21);
  v4 = a1[1];
  *(_OWORD *)v21 = *a1;
  *(_OWORD *)&v21[16] = v4;
  has_BOOLean_entitlement = audit_token_has_BOOLean_entitlement(v21, CFSTR("com.apple.captive.private"));
  logger = mysyslog_get_logger();
  v7 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v7))
  {
    v8 = "has";
    if (!(_DWORD)has_BOOLean_entitlement)
      v8 = "does not have";
    *(_DWORD *)v21 = 67109634;
    *(_DWORD *)&v21[4] = pid;
    *(_WORD *)&v21[8] = 2080;
    *(_QWORD *)&v21[10] = v8;
    *(_WORD *)&v21[18] = 2080;
    *(_QWORD *)&v21[20] = "com.apple.captive.private";
    _os_log_impl(&dword_219EF1000, logger, v7, "pid %d %s entitlement [%s]", v21, 0x1Cu);
  }
  if ((_DWORD)has_BOOLean_entitlement)
  {
    if (pid >= 1)
    {
      v9 = &S_WebSheetStateHeadStorage;
      while (1)
      {
        v9 = (uint64_t *)*v9;
        if (!v9)
          break;
        v10 = *((_DWORD *)v9 + 19);
        if (v10 == pid && v10 >= 1)
        {
          v12 = mysyslog_get_logger();
          v13 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v12, v13))
          {
            v14 = v9[2];
            v15 = *((_DWORD *)v9 + 19);
            *(_DWORD *)v21 = 138412546;
            *(_QWORD *)&v21[4] = v14;
            *(_WORD *)&v21[12] = 1024;
            *(_DWORD *)&v21[14] = v15;
            _os_log_impl(&dword_219EF1000, v12, v13, "WebSheet for %@ already associated with pid %d", v21, 0x12u);
          }
          goto LABEL_15;
        }
      }
      v18 = &S_WebSheetStateHeadStorage;
      while (1)
      {
        v18 = (uint64_t *)*v18;
        if (!v18)
          break;
        if (!*((_DWORD *)v18 + 19))
        {
          has_BOOLean_entitlement = *((unsigned __int8 *)v18 + 72);
          if (*((_BYTE *)v18 + 72))
            v19 = pid;
          else
            v19 = 0;
          *((_DWORD *)v18 + 19) = v19;
          return has_BOOLean_entitlement;
        }
      }
    }
LABEL_15:
    v16 = mysyslog_get_logger();
    v17 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v16, v17))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_219EF1000, v16, v17, "No state found to support WebSheet", v21, 2u);
    }
  }
  return has_BOOLean_entitlement;
}

uint64_t WebSheetRegister(uint64_t *a1)
{
  int PID;
  const void *v3;
  int v4;
  const void *v5;
  const void *v6;
  uint64_t *v7;
  int v8;
  uint64_t *v10;
  int v11;
  void *v13;
  CFDictionaryRef v14;
  CFDictionaryRef v15;
  uint64_t v16;
  CFDictionaryRef Command;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  NSObject *v23;
  os_log_type_t v24;
  const char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint32_t v28;
  NSObject *logger;
  os_log_type_t v30;
  void *values;
  int8x16_t v33;
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  PID = CommandHandlerGetPID(*a1);
  v3 = (const void *)*a1;
  v4 = CommandHandlerGetPID(*a1);
  v5 = (const void *)DisplayIDCopy();
  if (v5)
  {
    v6 = v5;
    v7 = &S_WebSheetStateHeadStorage;
    while (1)
    {
      v7 = (uint64_t *)*v7;
      if (!v7)
        break;
      v8 = *((_DWORD *)v7 + 19);
      if (v8 == v4 && v8 > 0)
      {
        CommandHandlerSetInformation((uint64_t)v3, v5);
        my_FieldSetRetainedCFType((const void **)v7 + 8, v3);
        WebSheetStateClearCheckInTimer((uint64_t)v7);
        CFRelease(v6);
        v10 = &S_WebSheetStateHeadStorage;
        while (1)
        {
          v10 = (uint64_t *)*v10;
          if (!v10)
            break;
          v11 = *((_DWORD *)v10 + 19);
          if (v11 == PID && v11 > 0)
          {
            v13 = (void *)*MEMORY[0x24BE14B98];
            keys[0] = *(void **)MEMORY[0x24BE14B78];
            keys[1] = v13;
            keys[2] = *(void **)MEMORY[0x24BE14B80];
            values = (void *)v10[2];
            v33 = vextq_s8(*((int8x16_t *)v10 + 5), *((int8x16_t *)v10 + 5), 8uLL);
            v14 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            if (v14)
            {
              v15 = v14;
              v16 = 1;
              Command = createCommand(1, 0, (uint64_t)v14, 0);
              CFRelease(v15);
              my_FieldSetRetainedCFType((const void **)v10 + 5, Command);
              CFRelease(Command);
              v18 = v10[8];
              if (v18)
                CommandHandlerNotify(v18);
              return v16;
            }
            logger = mysyslog_get_logger();
            v30 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(logger, v30))
            {
              LOWORD(keys[0]) = 0;
              v25 = "info dict is NULL";
              v26 = logger;
              v27 = v30;
              v28 = 2;
LABEL_27:
              _os_log_impl(&dword_219EF1000, v26, v27, v25, (uint8_t *)keys, v28);
            }
            return 1;
          }
        }
        v23 = mysyslog_get_logger();
        v24 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v23, v24))
        {
          LODWORD(keys[0]) = 67109120;
          HIDWORD(keys[0]) = PID;
          v25 = "Couldn't find the state for pid: %d";
          v26 = v23;
          v27 = v24;
          v28 = 8;
          goto LABEL_27;
        }
        return 1;
      }
    }
    CFRelease(v5);
  }
  else
  {
    v19 = mysyslog_get_logger();
    v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v19, v20))
    {
      LODWORD(keys[0]) = 67109120;
      HIDWORD(keys[0]) = v4;
      _os_log_impl(&dword_219EF1000, v19, v20, "Cannot get display ID for pid %d", (uint8_t *)keys, 8u);
    }
  }
  v21 = mysyslog_get_logger();
  v22 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v21, v22))
  {
    LODWORD(keys[0]) = 67109120;
    HIDWORD(keys[0]) = PID;
    _os_log_impl(&dword_219EF1000, v21, v22, "Failed to register pid %d", (uint8_t *)keys, 8u);
  }
  return 0;
}

void WebSheetRemove(uint64_t a1)
{
  int PID;
  int v2;
  uint64_t *v3;
  int v4;
  NSObject *logger;
  os_log_type_t v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  PID = CommandHandlerGetPID(a1);
  v2 = PID;
  v3 = &S_WebSheetStateHeadStorage;
  while (1)
  {
    v3 = (uint64_t *)*v3;
    if (!v3)
      break;
    v4 = *((_DWORD *)v3 + 19);
    if (v4 == PID && v4 > 0)
    {
      if (!*((_BYTE *)v3 + 73))
      {
        *((_BYTE *)v3 + 73) = 1;
        if (*((_BYTE *)v3 + 72) == 1)
          S_webSheetDoneCallback(v3[4], 2, 0);
      }
      WebSheetStateCleanup(v3);
      return;
    }
  }
  logger = mysyslog_get_logger();
  v7 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v7))
  {
    v8[0] = 67109120;
    v8[1] = v2;
    _os_log_impl(&dword_219EF1000, logger, v7, "Couldn't find the state for pid: %d", (uint8_t *)v8, 8u);
  }
}

BOOL WebSheetProvideCommand(uint64_t *a1)
{
  int PID;
  int v3;
  uint64_t *v4;
  int v5;
  const __CFArray *v7;
  CFIndex Count;
  CFIndex v9;
  NSObject *logger;
  os_log_type_t v11;
  _BOOL8 result;
  __CFArray *Mutable;
  const __CFArray *v14;
  _DWORD v15[2];
  uint64_t v16;
  CFRange v17;

  v16 = *MEMORY[0x24BDAC8D0];
  PID = CommandHandlerGetPID(*a1);
  v3 = PID;
  v4 = &S_WebSheetStateHeadStorage;
  while (1)
  {
    v4 = (uint64_t *)*v4;
    if (!v4)
      break;
    v5 = *((_DWORD *)v4 + 19);
    if (v5 == PID && v5 > 0)
    {
      v7 = (const __CFArray *)v4[6];
      if (v4[5])
      {
        if (v7)
        {
          Count = CFArrayGetCount(v7);
          v9 = Count + 1;
        }
        else
        {
          Count = 0;
          v9 = 1;
        }
        Mutable = CFArrayCreateMutable(0, v9, MEMORY[0x24BDBD690]);
        CFArrayAppendValue(Mutable, (const void *)v4[5]);
        v14 = (const __CFArray *)v4[6];
        if (v14)
        {
          v17.location = 0;
          v17.length = Count;
          CFArrayAppendArray(Mutable, v14, v17);
        }
      }
      else if (v7)
      {
        Mutable = (__CFArray *)CFRetain(v7);
      }
      else
      {
        Mutable = 0;
      }
      a1[1] = (uint64_t)Mutable;
      return 1;
    }
  }
  logger = mysyslog_get_logger();
  v11 = _SC_syslog_os_log_mapping();
  result = os_log_type_enabled(logger, v11);
  if (result)
  {
    v15[0] = 67109120;
    v15[1] = v3;
    _os_log_impl(&dword_219EF1000, logger, v11, "Couldn't find the state for pid: %d", (uint8_t *)v15, 8u);
    return 0;
  }
  return result;
}

uint64_t WebSheetProcessResponse(uint64_t *a1)
{
  int PID;
  uint64_t *v3;
  int v4;
  const __CFDictionary *v6;
  const void *Value;
  CFTypeID TypeID;
  const __CFDictionary *v9;
  const void *v10;
  CFTypeID v11;
  const void *v12;
  CFTypeID v13;
  const void *v14;
  NSObject *logger;
  os_log_type_t v16;
  uint64_t result;
  int v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  NSObject *v23;
  os_log_type_t v24;
  CFIndex Count;
  CFIndex v26;
  CFIndex v27;
  const __CFDictionary *ValueAtIndex;
  uint64_t v29;
  _DWORD v30[2];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  PID = CommandHandlerGetPID(*a1);
  v3 = &S_WebSheetStateHeadStorage;
  do
  {
    v3 = (uint64_t *)*v3;
    if (!v3)
    {
      logger = mysyslog_get_logger();
      v16 = _SC_syslog_os_log_mapping();
      result = os_log_type_enabled(logger, v16);
      if (!(_DWORD)result)
        return result;
      v18 = CommandHandlerGetPID(*a1);
      v30[0] = 67109120;
      v30[1] = v18;
      v19 = "Couldn't find the state for pid: %d";
      v20 = logger;
      v21 = v16;
      v22 = 8;
LABEL_23:
      _os_log_impl(&dword_219EF1000, v20, v21, v19, (uint8_t *)v30, v22);
      return 0;
    }
    v4 = *((_DWORD *)v3 + 19);
  }
  while (v4 != PID || v4 <= 0);
  v6 = (const __CFDictionary *)a1[1];
  Value = CFDictionaryGetValue(v6, CFSTR("UniqueID"));
  TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    v23 = mysyslog_get_logger();
    v24 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(v23, v24);
    if (!(_DWORD)result)
      return result;
    LOWORD(v30[0]) = 0;
    v19 = "missing/invalid uniqueID";
    v20 = v23;
    v21 = v24;
    v22 = 2;
    goto LABEL_23;
  }
  v9 = (const __CFDictionary *)v3[5];
  if (v9 && commandContainsUniqueID(v9, Value))
  {
    v30[0] = 0;
    v10 = CFDictionaryGetValue(v6, CFSTR("Result"));
    v11 = CFNumberGetTypeID();
    if (!v10 || CFGetTypeID(v10) != v11 || !CFNumberGetValue((CFNumberRef)v10, kCFNumberSInt32Type, v30))
      v30[0] = 4;
    v12 = CFDictionaryGetValue(v6, CFSTR("ResultOptions"));
    v13 = CFDictionaryGetTypeID();
    if (v12)
    {
      if (CFGetTypeID(v12) == v13)
        v14 = v12;
      else
        v14 = 0;
    }
    else
    {
      v14 = 0;
    }
    if (!*((_BYTE *)v3 + 73))
    {
      v29 = v30[0];
      *((_BYTE *)v3 + 73) = 1;
      if (*((_BYTE *)v3 + 72) == 1)
        S_webSheetDoneCallback(v3[4], v29, v14);
    }
    return 1;
  }
  result = v3[6];
  if (result)
  {
    Count = CFArrayGetCount((CFArrayRef)result);
    if (Count >= 1)
    {
      v26 = Count;
      v27 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v3[6], v27);
        result = (uint64_t)commandContainsUniqueID(ValueAtIndex, Value);
        if ((_DWORD)result)
          break;
        if (v26 == ++v27)
          return result;
      }
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)v3[6], v27);
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t WebSheetProcessControl(uint64_t a1)
{
  int PID;
  int v3;
  uint64_t *v4;
  int v5;
  const void *Value;
  CFTypeID TypeID;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  const void *v12;
  __CFString *v13;
  const __CFString *v14;
  CFRunLoopRef Current;
  unint64_t api;
  const __CFString *v17;
  unint64_t v18;
  NSObject *logger;
  os_log_type_t v20;
  CFRunLoopRef v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  CFDataRef v26;
  NSObject *v27;
  os_log_type_t v28;
  int valuePtr;
  void *keys;
  void *values;
  _BYTE buf[24];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  PID = CommandHandlerGetPID(*(_QWORD *)a1);
  v3 = PID;
  v4 = &S_WebSheetStateHeadStorage;
  do
  {
    v4 = (uint64_t *)*v4;
    if (!v4)
    {
      logger = mysyslog_get_logger();
      v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v20))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v3;
        _os_log_impl(&dword_219EF1000, logger, v20, "Couldn't find the state for pid: %d", buf, 8u);
      }
      return 0;
    }
    v5 = *((_DWORD *)v4 + 19);
  }
  while (v5 != PID || v5 <= 0);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), CFSTR("Type"));
  TypeID = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
    return 0;
  v9 = 0;
  if (!CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr) || valuePtr != 1)
    return v9;
  v10 = (const __CFString *)v4[2];
  v11 = CaptiveCopyInterfaceSSID(v10);
  if (!v11)
    return 0;
  v12 = (const void *)v11;
  v13 = (__CFString *)my_CFUUIDStringCreate(0);
  values = v13;
  v14 = (const __CFString *)CaptiveCopyPortalURL(v10);
  if (v14)
  {
    Current = CFRunLoopGetCurrent();
    api = (unint64_t)captive_agent_query_api((uint64_t)v12, v10, v14, 0xAu, (uint64_t)WebSheetQueryAPIComplete, (uint64_t)v13, (uint64_t)Current);
    v17 = 0;
    v18 = 0;
  }
  else
  {
    v17 = (const __CFString *)CaptiveCopyInitialURL(v10);
    if (!v17)
    {
      v17 = CFSTR("http://www.apple.com/library/test/success.html");
      CFRetain(CFSTR("http://www.apple.com/library/test/success.html"));
    }
    v22 = CFRunLoopGetCurrent();
    v18 = (unint64_t)captive_agent_send_probe(v12, v10, 0, v17, 0x28u, (uint64_t)WebSheetProbeComplete, (uint64_t)v13, (uint64_t)v22);
    api = 0;
  }
  if (v18 | api)
  {
    keys = CFSTR("ProbeID");
    *(_QWORD *)(a1 + 16) = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v25 = values;
    if (!S_prober_list)
      S_prober_list = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_QWORD *)buf = v4;
    *(_QWORD *)&buf[8] = v18;
    *(_QWORD *)&buf[16] = api;
    v26 = CFDataCreate(0, buf, 24);
    CFDictionarySetValue((CFMutableDictionaryRef)S_prober_list, v25, v26);
    CFRelease(v26);
    v27 = mysyslog_get_logger();
    v28 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v27, v28))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v18;
      _os_log_impl(&dword_219EF1000, v27, v28, "prober %@ detect %p added", buf, 0x16u);
    }
    v9 = 1;
  }
  else
  {
    v23 = mysyslog_get_logger();
    v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v23, v24, "Unable to send probe to the network", buf, 2u);
    }
    v9 = 0;
  }
  CFRelease(v12);
  if (v17)
    CFRelease(v17);
  if (v14)
    CFRelease(v14);
  if (values)
    CFRelease(values);
  return v9;
}

const void *commandContainsUniqueID(const __CFDictionary *a1, const void *a2)
{
  const void *result;

  result = CFDictionaryGetValue(a1, CFSTR("UniqueID"));
  if (result)
    return (const void *)(CFEqual(result, a2) != 0);
  return result;
}

void WebSheetQueryAPIComplete(__CFString *a1, int a2, const void *a3)
{
  uint64_t *v6;
  NSObject *logger;
  os_log_type_t v8;
  uint64_t v9;
  int v10;
  CFNumberRef v11;
  CFDictionaryRef Command;
  uint64_t v13;
  int valuePtr;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t *)ProberContextGet(a1);
  logger = mysyslog_get_logger();
  if (v6)
  {
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      v9 = v6[2];
      *(_DWORD *)buf = 138412802;
      v16 = a1;
      v17 = 2048;
      v18 = v9;
      v19 = 1024;
      v20 = a2;
      _os_log_impl(&dword_219EF1000, logger, v8, "prober %@ query_api %p complete, result %d", buf, 0x1Cu);
    }
    CaptiveUpdateAPIState(*(CFTypeRef *)(*v6 + 16), a3);
    if (a2 == 16)
      v10 = 3;
    else
      v10 = a2;
    valuePtr = v10;
    v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
    Command = createCommand(2, a1, 0, v11);
    CFRelease(v11);
    WebSheetStateIssueCommand(*v6, Command, 0);
    v6[1] = 0;
    ProberContextRemove(a1);
    CFRelease(Command);
  }
  else
  {
    v13 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, (os_log_type_t)v13))
    {
      *(_DWORD *)buf = 138412290;
      v16 = a1;
      _os_log_impl(&dword_219EF1000, logger, (os_log_type_t)v13, "No context for %@", buf, 0xCu);
    }
  }
}

void WebSheetProbeComplete(__CFString *a1, int a2)
{
  uint64_t *v4;
  NSObject *logger;
  os_log_type_t v6;
  uint64_t v7;
  CFNumberRef v8;
  CFDictionaryRef Command;
  uint64_t v10;
  int valuePtr;
  uint8_t buf[4];
  __CFString *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  valuePtr = a2;
  v4 = (uint64_t *)ProberContextGet(a1);
  logger = mysyslog_get_logger();
  if (v4)
  {
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      v7 = v4[1];
      *(_DWORD *)buf = 138412802;
      v13 = a1;
      v14 = 2048;
      v15 = v7;
      v16 = 1024;
      v17 = a2;
      _os_log_impl(&dword_219EF1000, logger, v6, "prober %@ detect %p complete, result %d", buf, 0x1Cu);
    }
    v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
    Command = createCommand(2, a1, 0, v8);
    CFRelease(v8);
    WebSheetStateIssueCommand(*v4, Command, 0);
    v4[1] = 0;
    ProberContextRemove(a1);
    CFRelease(Command);
  }
  else
  {
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, (os_log_type_t)v10))
    {
      *(_DWORD *)buf = 138412290;
      v13 = a1;
      _os_log_impl(&dword_219EF1000, logger, (os_log_type_t)v10, "No context for %@", buf, 0xCu);
    }
  }
}

BOOL CaptivePostDataToUserNameAndPassword(const __CFString *a1, const __CFString *a2, CFTypeRef *a3, CFTypeRef *a4)
{
  CFTypeRef *v4;
  CFTypeRef *v5;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  CFTypeID v10;
  const void *Value;
  const void *v12;
  CFTypeID v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v16;
  os_log_type_t v17;
  CFRange v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFAllocator *v21;
  const __CFArray *ArrayBySeparatingStrings;
  uint64_t Count;
  CFMutableDictionaryRef Mutable;
  const __CFDictionary *v25;
  CFIndex v26;
  const __CFString *ValueAtIndex;
  CFIndex location;
  const __CFString *v29;
  CFIndex v30;
  CFIndex v31;
  __CFDictionary *v32;
  const __CFArray *v33;
  CFIndex v34;
  CFIndex v35;
  CFIndex v36;
  const __CFString *v37;
  CFIndex v38;
  const __CFString *v39;
  const __CFString *v40;
  CFRange v41;
  BOOL v42;
  __CFString *v43;
  NSObject *logger;
  os_log_type_t v45;
  const __CFDictionary *v46;
  _BOOL8 result;
  NSObject *v48;
  os_log_type_t v49;
  NSObject *v50;
  os_log_type_t v51;
  const char *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint32_t v55;
  const __CFArray *v56;
  CFIndex v57;
  CFIndex v58;
  CFIndex v59;
  const __CFString *v60;
  const __CFArray *v61;
  const __CFArray *v62;
  const __CFArray *v63;
  __CFDictionary *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFAllocator *v68;
  CFStringRef v69;
  __CFString *v70;
  NSObject *v71;
  os_log_type_t v72;
  NSObject *v73;
  os_log_type_t v74;
  NSObject *v75;
  os_log_type_t v76;
  const __CFArray *v77;
  const __CFArray *v78;
  CFTypeID v79;
  CFIndex v80;
  CFIndex v81;
  CFIndex v82;
  const void *v83;
  const void *v84;
  const __CFArray *v85;
  const __CFArray *v86;
  CFTypeID v87;
  CFIndex v88;
  CFIndex v89;
  CFIndex v90;
  const void *v91;
  const void *v92;
  const __CFArray *v93;
  const __CFArray *v94;
  CFTypeID v95;
  const __CFDictionary *v96;
  CFIndex v97;
  CFIndex v98;
  CFIndex v99;
  const void *v100;
  const __CFString *v101;
  const __CFString *v102;
  CFStringRef v103;
  const void *v104;
  const __CFArray *v105;
  const __CFArray *v106;
  CFTypeID v107;
  CFIndex v108;
  CFIndex v109;
  CFIndex i;
  const __CFString *v111;
  const __CFString *v112;
  NSObject *v113;
  os_log_type_t v114;
  CFTypeRef v115;
  const void *v116;
  const void *v117;
  const void *v118;
  uint64_t v119;
  CFTypeRef *v120;
  CFTypeRef *v121;
  uint8_t buf[4];
  CFTypeRef v123;
  __int16 v124;
  const void *v125;
  uint64_t v126;

  v4 = a4;
  v5 = a3;
  v126 = *MEMORY[0x24BDAC8D0];
  *a4 = 0;
  *a3 = 0;
  v8 = (const __CFDictionary *)CaptiveCopySettings();
  v9 = v8;
  if (!v8 || (v10 = CFGetTypeID(v8), v10 != CFDictionaryGetTypeID()))
  {
    logger = mysyslog_get_logger();
    v45 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v45))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, logger, v45, "failed to open settings file", buf, 2u);
    }
    if (!v9)
      return 0;
    v46 = v9;
    goto LABEL_53;
  }
  Value = CFDictionaryGetValue(v9, CFSTR("ScrapingParameters"));
  if (Value)
  {
    v12 = Value;
    v13 = CFGetTypeID(Value);
    if (v13 == CFDictionaryGetTypeID())
    {
      CFRetain(v12);
      CFRelease(v9);
      if (CaptiveIsDebug())
      {
        v14 = mysyslog_get_logger();
        v15 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)buf = 138412290;
          v123 = a1;
          _os_log_impl(&dword_219EF1000, v14, v15, "content-type: %@. content:", buf, 0xCu);
        }
        v16 = mysyslog_get_logger();
        v17 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)buf = 138412290;
          v123 = a2;
          _os_log_impl(&dword_219EF1000, v16, v17, "%@", buf, 0xCu);
        }
      }
      v120 = v4;
      v121 = v5;
      if (CFStringFind(a1, CFSTR("multipart/form-data"), 1uLL).location != -1)
      {
        v18 = CFStringFind(a1, CFSTR("boundary="), 1uLL);
        if (v18.location == -1 || (v19 = CaptiveCopyValueAfterEqual(a1, v18.location + v18.length)) == 0)
        {
          v50 = mysyslog_get_logger();
          v51 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v50, v51))
          {
            *(_DWORD *)buf = 138412290;
            v123 = a1;
            v52 = "Failed to find divider in %@";
            v53 = v50;
            v54 = v51;
            v55 = 12;
LABEL_60:
            _os_log_impl(&dword_219EF1000, v53, v54, v52, buf, v55);
          }
        }
        else
        {
          v20 = v19;
          v21 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, v19);
          CFRelease(v20);
          if (ArrayBySeparatingStrings)
          {
            Count = CFArrayGetCount(ArrayBySeparatingStrings);
            Mutable = CFDictionaryCreateMutable(v21, Count, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            v25 = Mutable;
            v119 = Count;
            if (Count >= 1 && Mutable)
            {
              v117 = v12;
              v26 = 0;
              while (1)
              {
                ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, v26);
                location = CFStringFind(ValueAtIndex, CFSTR("\r\n"), 0).location;
                v29 = CFSTR("\r\n");
                if (location == -1)
                {
                  v30 = CFStringFind(ValueAtIndex, CFSTR("\r"), 0).location;
                  v29 = CFSTR("\r");
                  if (v30 == -1)
                  {
                    v31 = CFStringFind(ValueAtIndex, CFSTR("\n"), 0).location;
                    v29 = CFSTR("\n");
                    if (v31 == -1)
                      goto LABEL_47;
                  }
                }
                v32 = v25;
                v33 = CFStringCreateArrayBySeparatingStrings(v21, ValueAtIndex, v29);
                v34 = CFArrayGetCount(v33);
                v35 = v34 - 1;
                if (v34 >= 1)
                {
                  v36 = v34;
                  v37 = 0;
                  v38 = 0;
                  while (1)
                  {
                    v39 = (const __CFString *)CFArrayGetValueAtIndex(v33, v38);
                    v40 = v39;
                    if (v37)
                    {
                      if (CFStringGetLength(v39))
                      {
                        CFRetain(v40);
                        if (!v33)
                          goto LABEL_37;
LABEL_36:
                        CFRelease(v33);
                        goto LABEL_37;
                      }
LABEL_26:
                      if (v36 == ++v38)
                        goto LABEL_34;
                    }
                    else
                    {
                      if ((unint64_t)CFStringFind(v39, CFSTR("Content-Disposition"), 1uLL).location)
                        goto LABEL_26;
                      v41 = CFStringFind(v40, CFSTR("name="), 1uLL);
                      if (v41.location == -1)
                        break;
                      v37 = CaptiveCopyValueAfterEqual(v40, v41.location + v41.length);
                      v40 = 0;
                      if (!v37)
                        goto LABEL_35;
                      v42 = v35 == v38++;
                      if (v42)
                        goto LABEL_35;
                    }
                  }
                }
                v37 = 0;
LABEL_34:
                v40 = 0;
LABEL_35:
                if (v33)
                  goto LABEL_36;
LABEL_37:
                v25 = v32;
                if (v37)
                {
                  if (v40)
                  {
                    v43 = CFStringCopyToLower(v37);
                    CFRelease(v37);
                    if (v43)
                    {
                      CFDictionaryAddValue(v32, v43, v40);
                      CFRelease(v43);
                    }
                  }
                  else
                  {
                    v40 = v37;
                  }
                }
                else if (!v40)
                {
                  goto LABEL_47;
                }
                CFRelease(v40);
LABEL_47:
                if (++v26 == v119)
                {
                  v12 = v117;
                  v4 = v120;
                  v5 = v121;
                  break;
                }
              }
            }
LABEL_82:
            CFRelease(ArrayBySeparatingStrings);
            if (v25)
            {
              if (CaptiveIsDebug())
              {
                v73 = mysyslog_get_logger();
                v74 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v73, v74))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_219EF1000, v73, v74, "Parse Dictionary:", buf, 2u);
                }
                v75 = mysyslog_get_logger();
                v76 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v75, v76))
                {
                  *(_DWORD *)buf = 138412290;
                  v123 = v25;
                  _os_log_impl(&dword_219EF1000, v75, v76, "    %@", buf, 0xCu);
                }
              }
              v77 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v12, CFSTR("UserFields"));
              if (v77)
              {
                v78 = v77;
                v79 = CFGetTypeID(v77);
                if (v79 == CFArrayGetTypeID())
                {
                  v80 = CFArrayGetCount(v78);
                  v81 = v80 - 1;
                  if (v80 >= 1)
                  {
                    v82 = 0;
                    do
                    {
                      v83 = CFArrayGetValueAtIndex(v78, v82);
                      v84 = CFDictionaryGetValue(v25, v83);
                      *v5 = v84;
                      if (v84)
                        break;
                      v42 = v81 == v82++;
                    }
                    while (!v42);
                  }
                }
              }
              v85 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v12, CFSTR("PasswordFields"));
              if (v85)
              {
                v86 = v85;
                v87 = CFGetTypeID(v85);
                if (v87 == CFArrayGetTypeID())
                {
                  v88 = CFArrayGetCount(v86);
                  v89 = v88 - 1;
                  if (v88 >= 1)
                  {
                    v90 = 0;
                    do
                    {
                      v91 = CFArrayGetValueAtIndex(v86, v90);
                      v92 = CFDictionaryGetValue(v25, v91);
                      *v4 = v92;
                      if (v92)
                        break;
                      v42 = v89 == v90++;
                    }
                    while (!v42);
                  }
                }
              }
              v93 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v12, CFSTR("RealmFields"));
              if (v93 && (v94 = v93, v95 = CFGetTypeID(v93), v95 == CFArrayGetTypeID()))
              {
                v96 = v25;
                v97 = CFArrayGetCount(v94);
                if (v97 < 1)
                {
LABEL_108:
                  v102 = 0;
                }
                else
                {
                  v98 = v97;
                  v99 = 0;
                  while (1)
                  {
                    v100 = CFArrayGetValueAtIndex(v94, v99);
                    v101 = (const __CFString *)CFDictionaryGetValue(v96, v100);
                    if (v101)
                      break;
                    if (v98 == ++v99)
                      goto LABEL_108;
                  }
                  v102 = v101;
                }
                v25 = v96;
              }
              else
              {
                v102 = 0;
              }
              if (*v5)
              {
                if (CFStringFind((CFStringRef)*v5, CFSTR("@"), 0).location == -1)
                {
                  if (v102 && CFStringGetLength(v102) >= 1)
                  {
                    if (CFStringGetCharacterAtIndex(v102, 0) == 64)
                      v103 = CFStringCreateWithFormat(v21, 0, CFSTR("%@%@"), *v5, v102);
                    else
                      v103 = CFStringCreateWithFormat(v21, 0, CFSTR("%@@%@"), *v5, v102);
                    *v5 = v103;
                  }
                  else
                  {
                    *v5 = 0;
                  }
                }
                else
                {
                  CFRetain(*v5);
                }
              }
              if (*v4)
                CFRetain(*v4);
              CFRelease(v25);
              if (*v5)
              {
                v104 = v12;
                v105 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v12, CFSTR("DisabledRealms"));
                if (v105)
                {
                  v106 = v105;
                  v107 = CFGetTypeID(v105);
                  if (v107 == CFArrayGetTypeID())
                  {
                    v108 = CFArrayGetCount(v106);
                    if (v108 >= 1)
                    {
                      v109 = v108;
                      for (i = 0; i != v109; ++i)
                      {
                        v111 = (const __CFString *)*v5;
                        v112 = (const __CFString *)CFArrayGetValueAtIndex(v106, i);
                        if (CFStringHasSuffix(v111, v112))
                        {
                          v113 = mysyslog_get_logger();
                          v114 = _SC_syslog_os_log_mapping();
                          if (os_log_type_enabled(v113, v114))
                          {
                            v115 = *v121;
                            v116 = CFArrayGetValueAtIndex(v106, i);
                            *(_DWORD *)buf = 138412546;
                            v123 = v115;
                            v124 = 2112;
                            v125 = v116;
                            _os_log_impl(&dword_219EF1000, v113, v114, "User %@ is in disabled realm %@, not caching credentials", buf, 0x16u);
                          }
                          v4 = v120;
                          v5 = v121;
                          if (*v121)
                          {
                            CFRelease(*v121);
                            *v121 = 0;
                          }
                        }
                      }
                    }
                  }
                }
                v12 = v104;
                if (*v5)
                {
                  if (*v4)
                    goto LABEL_141;
                  CFRelease(*v5);
                  *v5 = 0;
                }
              }
              if (*v4)
              {
                CFRelease(*v4);
                *v4 = 0;
              }
LABEL_141:
              CFRelease(v12);
              if (*v5)
                return *v4 != 0;
              return 0;
            }
            goto LABEL_109;
          }
          v71 = mysyslog_get_logger();
          v72 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v71, v72))
          {
            *(_WORD *)buf = 0;
            v52 = "CFStringCreateArrayBySeparatingStrings failed";
            v53 = v71;
            v54 = v72;
            v55 = 2;
            goto LABEL_60;
          }
        }
LABEL_109:
        v46 = (const __CFDictionary *)v12;
LABEL_53:
        CFRelease(v46);
        return 0;
      }
      v21 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v56 = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, CFSTR("&"));
      if (!v56)
        goto LABEL_109;
      ArrayBySeparatingStrings = v56;
      v57 = CFArrayGetCount(v56);
      if (v57 < 1)
      {
        v25 = 0;
        goto LABEL_82;
      }
      v58 = v57;
      v118 = v12;
      v59 = 0;
      v25 = 0;
      while (1)
      {
        if (!v25)
        {
          v25 = CFDictionaryCreateMutable(v21, v58, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          if (!v25)
          {
LABEL_78:
            v12 = v118;
            goto LABEL_82;
          }
        }
        v60 = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, v59);
        v61 = CFStringCreateArrayBySeparatingStrings(v21, v60, CFSTR("="));
        if (v61)
          break;
LABEL_77:
        if (v58 == ++v59)
          goto LABEL_78;
      }
      v62 = v61;
      if (CFArrayGetCount(v61) != 2)
      {
LABEL_76:
        CFRelease(v62);
        goto LABEL_77;
      }
      v63 = ArrayBySeparatingStrings;
      v64 = v25;
      v65 = (const __CFString *)CFArrayGetValueAtIndex(v62, 0);
      v66 = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(v21, v65, &stru_24DC17C58, 0x8000100u);
      v67 = (const __CFString *)CFArrayGetValueAtIndex(v62, 1);
      v68 = v21;
      v69 = CFURLCreateStringByReplacingPercentEscapesUsingEncoding(v21, v67, &stru_24DC17C58, 0x8000100u);
      if (v66)
      {
        v70 = CFStringCopyToLower(v66);
        CFRelease(v66);
        if (v70 && v69)
        {
          CFDictionaryAddValue(v64, v70, v69);
        }
        else if (!v70)
        {
          goto LABEL_74;
        }
        CFRelease(v70);
      }
LABEL_74:
      v21 = v68;
      v25 = v64;
      ArrayBySeparatingStrings = v63;
      v4 = v120;
      v5 = v121;
      if (v69)
        CFRelease(v69);
      goto LABEL_76;
    }
  }
  CFRelease(v9);
  v48 = mysyslog_get_logger();
  v49 = _SC_syslog_os_log_mapping();
  result = os_log_type_enabled(v48, v49);
  if (result)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219EF1000, v48, v49, "no scraping parameters", buf, 2u);
    return 0;
  }
  return result;
}

__CFString *CFStringCopyToLower(CFStringRef theString)
{
  __CFString *MutableCopy;
  __CFString *v2;

  MutableCopy = CFStringCreateMutableCopy(0, 0, theString);
  v2 = MutableCopy;
  if (MutableCopy)
    CFStringLowercase(MutableCopy, 0);
  return v2;
}

CFStringRef CaptiveCopyValueAfterEqual(const __CFString *a1, CFIndex a2)
{
  CFIndex Length;
  CFIndex v5;
  int CharacterAtIndex;
  int v7;
  CFIndex v8;
  unsigned int v9;
  CFRange v11;

  Length = CFStringGetLength(a1);
  if (Length < a2)
    return 0;
  v5 = Length;
  CharacterAtIndex = CFStringGetCharacterAtIndex(a1, a2);
  if (CharacterAtIndex == 34)
    ++a2;
  if (v5 <= a2)
    return 0;
  v7 = CharacterAtIndex;
  v8 = 0;
  while (1)
  {
    v9 = CFStringGetCharacterAtIndex(a1, a2 + v8);
    if (v7 == 34 && v9 == 34)
      break;
    if (v9 <= 0x3B && ((1 << v9) & 0x800000100002400) != 0)
      break;
    ++v8;
    if (a2 + v8 >= v5)
    {
      v8 = v5 - a2;
      break;
    }
  }
  if (!v8)
    return 0;
  v11.location = a2;
  v11.length = v8;
  return CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x24BDBD240], a1, v11);
}

os_log_t mysyslog_init_logger(os_log_t result)
{
  if (result <= 3 && !S_captive_logger)
  {
    result = os_log_create("com.apple.captive", S_captive_os_log_categories[result]);
    S_captive_logger = (uint64_t)result;
  }
  return result;
}

CFDataRef my_CFPropertyListCreateData(CFPropertyListRef propertyList)
{
  return CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
}

const __CFData *my_CFPropertyListCreateVMData(CFPropertyListRef propertyList, _DWORD *a2)
{
  const __CFData *result;
  const __CFData *v4;
  int Length;
  void *v6;
  const UInt8 *BytePtr;
  vm_address_t address;

  address = 0;
  *a2 = 0;
  result = CFPropertyListCreateData(0, propertyList, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (result)
  {
    v4 = result;
    Length = CFDataGetLength(result);
    if (!vm_allocate(*MEMORY[0x24BDAEC58], &address, Length, 1))
    {
      v6 = (void *)address;
      BytePtr = CFDataGetBytePtr(v4);
      memmove(v6, BytePtr, Length);
      *a2 = Length;
    }
    CFRelease(v4);
    return (const __CFData *)address;
  }
  return result;
}

const __CFData *my_CFPropertyListCreateWithBytePtrAndLength(UInt8 *bytes, int a2)
{
  const __CFData *result;
  const __CFData *v3;
  CFPropertyListRef v4;

  result = CFDataCreateWithBytesNoCopy(0, bytes, a2, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (result)
  {
    v3 = result;
    v4 = CFPropertyListCreateWithData(0, result, 0, 0, 0);
    CFRelease(v3);
    return (const __CFData *)v4;
  }
  return result;
}

uint64_t my_CFEqual(const void *a1, const void *a2)
{
  if (!a1)
    return a2 == 0;
  if (a2)
    return CFEqual(a1, a2);
  return 0;
}

CFStringRef my_CFUUIDStringCreate(const __CFAllocator *a1)
{
  const __CFUUID *v2;
  CFStringRef v3;

  v2 = CFUUIDCreate(a1);
  v3 = CFUUIDCreateString(a1, v2);
  CFRelease(v2);
  return v3;
}

void my_CFDictionaryMergeDictionary(void *context, CFDictionaryRef theDict)
{
  CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)merge_dict_applier, context);
}

void merge_dict_applier(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionaryAddValue(theDict, key, value);
}

const __CFArray *my_CFArrayContainsStringsOnly(const __CFArray *result)
{
  const __CFArray *v1;
  unsigned __int8 context;
  CFRange v3;

  context = 1;
  if (result)
  {
    v1 = result;
    v3.length = CFArrayGetCount(result);
    v3.location = 0;
    CFArrayApplyFunction(v1, v3, (CFArrayApplierFunction)CheckIsString, &context);
    return (const __CFArray *)context;
  }
  return result;
}

CFTypeID CheckIsString(const void *a1, _BYTE *a2)
{
  CFTypeID result;
  CFTypeID v5;

  result = CFStringGetTypeID();
  if (!a1 || (v5 = result, result = CFGetTypeID(a1), result != v5))
    *a2 = 0;
  return result;
}

uint64_t my_CFArrayContainsAnyArrayValues(CFArrayRef theArray, const __CFArray *a2)
{
  uint64_t result;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  CFIndex v8;
  const void *ValueAtIndex;
  CFRange v10;

  result = 0;
  if (theArray && a2)
  {
    Count = CFArrayGetCount(theArray);
    v6 = CFArrayGetCount(a2);
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      v7 = v6;
      v8 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v8);
        v10.location = 0;
        v10.length = v7;
        if (CFArrayContainsValue(a2, v10, ValueAtIndex))
          break;
        if (Count == ++v8)
          return 0;
      }
      return 1;
    }
  }
  return result;
}

void my_FieldSetRetainedCFType(const void **a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *a1;
  if (cf)
    CFRetain(cf);
  if (v4)
    CFRelease(v4);
  *a1 = cf;
}

uint64_t my_CFDictionaryGetBooleanValue(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  const __CFBoolean *Value;
  CFTypeID TypeID;

  Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  TypeID = CFBooleanGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
    return CFBooleanGetValue(Value);
  else
    return a3;
}

uint64_t my_CFArrayPointerAddValue(CFArrayRef *a1, const void *a2)
{
  const __CFArray *v3;
  __CFArray *Mutable;
  CFRange v7;

  v3 = *a1;
  if (*a1)
  {
    v7.length = CFArrayGetCount(*a1);
    v7.location = 0;
    if (CFArrayContainsValue(v3, v7, a2))
      return 0;
    Mutable = v3;
  }
  else
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    *a1 = Mutable;
  }
  CFArrayAppendValue(Mutable, a2);
  return 1;
}

CFIndex my_CFArrayFindValue(const __CFArray *a1, const void *a2)
{
  CFRange v5;

  if (!a1)
    return -1;
  v5.length = CFArrayGetCount(a1);
  v5.location = 0;
  return CFArrayGetFirstIndexOfValue(a1, v5, a2);
}

uint64_t my_CFArrayFindDictWithKeyAndValue(const __CFArray *a1, const void *a2, const void *a3)
{
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  int v11;

  if (a1)
  {
    Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      v7 = Count;
      v8 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v8);
        Value = CFDictionaryGetValue(ValueAtIndex, a2);
        v11 = a3 == 0;
        if (!Value)
          goto LABEL_7;
        if (a3)
          break;
LABEL_8:
        if (v7 == ++v8)
          return -1;
      }
      v11 = CFEqual(Value, a3);
LABEL_7:
      if (v11)
        return v8;
      goto LABEL_8;
    }
  }
  return -1;
}

CFStringRef URLStringCopyHostName(CFStringRef URLString)
{
  const __CFURL *v1;
  const __CFURL *v2;
  CFStringRef v3;

  if (!URLString)
    return 0;
  v1 = CFURLCreateWithString(0, URLString, 0);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = CFURLCopyHostName(v1);
  CFRelease(v2);
  return v3;
}

void CNSPreferencesFlush()
{
  NSObject *logger;
  os_log_type_t v1;
  BOOL v2;
  NSObject *v3;
  os_log_type_t v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  __CFWriteStream *v9;
  __CFWriteStream *v10;
  int v11;
  NSObject *v12;
  os_log_type_t v13;
  const char *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    LOWORD(v15) = 0;
    _os_log_impl(&dword_219EF1000, logger, v1, (const char *)&unk_219F1FF4A, (uint8_t *)&v15, 2u);
  }
  if (preferencesURL)
    v2 = preferences == 0;
  else
    v2 = 1;
  if (v2)
  {
    v3 = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v3, v4))
      return;
    LOWORD(v15) = 0;
    v5 = "not saving preferences - URL or preferences is NULL";
LABEL_10:
    v6 = v3;
    v7 = v4;
    v8 = 2;
    goto LABEL_24;
  }
  v9 = CFWriteStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFURLRef)preferencesURL);
  if (v9)
  {
    v10 = v9;
    if (CFWriteStreamOpen(v9))
    {
      if (CFPropertyListWrite((CFPropertyListRef)preferences, v10, (CFPropertyListFormat)preferencesFormat, 0, 0))
      {
        CFRelease(v10);
        v3 = mysyslog_get_logger();
        v4 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v3, v4))
          return;
        LOWORD(v15) = 0;
        v5 = "Updated preferences";
        goto LABEL_10;
      }
      v11 = 1;
    }
    else
    {
      v11 = 2;
    }
    CFRelease(v10);
  }
  else
  {
    v11 = 2;
  }
  v12 = mysyslog_get_logger();
  v13 = _SC_syslog_os_log_mapping();
  if (!os_log_type_enabled(v12, v13))
    return;
  v14 = "failed to open write stream";
  if (v11 == 1)
    v14 = "failed to write to stream";
  v15 = 136315138;
  v16 = v14;
  v5 = "Failed to flush preferences. err =%s";
  v6 = v12;
  v7 = v13;
  v8 = 12;
LABEL_24:
  _os_log_impl(&dword_219EF1000, v6, v7, v5, (uint8_t *)&v15, v8);
}

const void *CNSPreferencesGet(const void *a1)
{
  const __CFDictionary *v2;

  v2 = CNSPreferences();
  return CFDictionaryGetValue(v2, a1);
}

CFMutableDictionaryRef CNSPreferences()
{
  CFMutableDictionaryRef result;
  const __CFURL *v1;
  CFAllocatorRef *v2;
  BOOL v3;
  const __CFAllocator *v4;
  __CFReadStream *v5;
  __CFReadStream *v6;
  CFPropertyListRef v7;
  const void *v8;
  CFTypeID TypeID;
  uint64_t v10;
  char v11;
  __CFString *v12;
  NSObject *logger;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t v17[16];
  uint8_t buf[16];

  result = (CFMutableDictionaryRef)preferences;
  v1 = (const __CFURL *)preferencesURL;
  v2 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (__PAIR128__(preferencesURL, preferences) == 0)
  {
    v1 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)"/Library/Preferences/com.apple.captive.plist", 45, 0);
    preferencesURL = (uint64_t)v1;
    result = (CFMutableDictionaryRef)preferences;
  }
  if (result)
    v3 = 1;
  else
    v3 = v1 == 0;
  if (!v3)
  {
    v4 = *v2;
    v5 = CFReadStreamCreateWithFile(*v2, v1);
    if (v5)
    {
      v6 = v5;
      if (CFReadStreamOpen(v5))
      {
        v7 = CFPropertyListCreateWithStream(v4, v6, 0, 1uLL, (CFPropertyListFormat *)&preferencesFormat, 0);
        preferences = (uint64_t)v7;
        if (v7)
        {
          v8 = v7;
          TypeID = CFDictionaryGetTypeID();
          if (CFGetTypeID(v8) == TypeID)
          {
            v10 = 0;
            v11 = 1;
            do
            {
              while (1)
              {
                v12 = off_24DC16C70[v10];
                if (!CFDictionaryContainsKey((CFDictionaryRef)preferences, v12))
                  break;
                CFDictionaryRemoveValue((CFMutableDictionaryRef)preferences, v12);
                v11 = 0;
                v3 = v10++ == 2;
                if (v3)
                  goto LABEL_23;
              }
              ++v10;
            }
            while (v10 != 3);
            if ((v11 & 1) != 0)
              goto LABEL_24;
LABEL_23:
            CNSPreferencesFlush();
          }
          else
          {
            logger = mysyslog_get_logger();
            v14 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(logger, v14))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219EF1000, logger, v14, "preferences are the wrong format", buf, 2u);
            }
            if (preferences)
            {
              CFRelease((CFTypeRef)preferences);
              preferences = 0;
            }
          }
        }
      }
LABEL_24:
      CFRelease(v6);
    }
    result = (CFMutableDictionaryRef)preferences;
  }
  if (!result)
  {
    v15 = mysyslog_get_logger();
    v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_219EF1000, v15, v16, "Creating new preferences", v17, 2u);
    }
    result = CFDictionaryCreateMutable(*v2, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    preferences = (uint64_t)result;
  }
  return result;
}

void CNSPreferencesSet(const void *a1, const void *a2)
{
  __CFDictionary *v4;

  v4 = CNSPreferences();
  CFDictionarySetValue(v4, a1, a2);
  CNSPreferencesFlush();
}

int *NotifyRegister(__CFRunLoop *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v8;
  uint64_t *v9;
  __CFMachPort *v10;
  mach_port_t Port;
  int *v12;
  int *v13;
  __CFMachPort *v15;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoopSource *v17;
  char *v18[3];
  __int128 v19;
  uint64_t v20;
  mach_port_t notify_port;

  v8 = &sourceHead;
  while (1)
  {
    v8 = (uint64_t *)*v8;
    if (!v8)
      break;
    if ((__CFRunLoop *)v8[3] == a1)
      goto LABEL_7;
  }
  v9 = (uint64_t *)malloc_type_malloc(0x20uLL, 0x20040DC1BFBCFuLL);
  if (!v9)
    return 0;
  v8 = v9;
  v9[2] = 0;
  v9[3] = (uint64_t)a1;
  *v9 = sourceHead;
  v9[1] = 0;
  sourceHead = (uint64_t)v9;
LABEL_7:
  notify_port = 0;
  v10 = (__CFMachPort *)v8[2];
  if (v10)
  {
    Port = CFMachPortGetPort(v10);
    notify_port = Port;
  }
  else
  {
    Port = 0;
  }
  v12 = (int *)malloc_type_malloc(0x28uLL, 0x10A0040DE786E1EuLL);
  v13 = v12;
  if (v12)
  {
    v12[8] = 0;
    *((_QWORD *)v12 + 1) = v8;
    *((_QWORD *)v12 + 2) = a3;
    *((_QWORD *)v12 + 3) = a4;
    if (notify_register_mach_port(a2, &notify_port, Port != 0, v12 + 8))
    {
LABEL_12:
      free(v13);
      return 0;
    }
    if (v8[2])
      goto LABEL_15;
    v18[1] = 0;
    v19 = 0u;
    v20 = 0;
    v18[2] = (char *)v8;
    v18[0] = 0;
    asprintf(v18, "CaptiveNetworkSupport/%s", a2);
    v8[2] = _SC_CFMachPortCreateWithPort();
    free(v18[0]);
    v15 = (__CFMachPort *)v8[2];
    if (v15)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x24BDBD240], v15, 0);
      if (RunLoopSource)
      {
        v17 = RunLoopSource;
        CFRunLoopAddSource(a1, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
        CFRelease(v17);
LABEL_15:
        *(_QWORD *)v13 = v8[1];
        v8[1] = (uint64_t)v13;
        return v13;
      }
      CFMachPortInvalidate((CFMachPortRef)v8[2]);
      CFRelease((CFTypeRef)v8[2]);
      v8[2] = 0;
    }
    notify_cancel(v13[8]);
    goto LABEL_12;
  }
  return v13;
}

BOOL NotifySet(uint64_t a1, uint64_t a2)
{
  return notify_set_state(*(_DWORD *)(a1 + 32), a2) == 0;
}

void NotificationDispose(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = a1[1];
  v3 = (_QWORD *)(v2 + 8);
  while (1)
  {
    v4 = v3;
    v3 = (_QWORD *)*v3;
    if (!v3)
      break;
    if (v3 == a1)
    {
      *v4 = *a1;
      break;
    }
  }
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  if (!*(_QWORD *)(v2 + 8))
  {
    CFMachPortInvalidate(*(CFMachPortRef *)(v2 + 16));
    CFRelease(*(CFTypeRef *)(v2 + 16));
    *(_QWORD *)(v2 + 16) = 0;
  }
  notify_cancel(*((_DWORD *)a1 + 8));
  free(a1);
}

void CNAccountsImportCarrierCredentials()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  CFMutableArrayRef Mutable;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const void *ValueAtIndex;
  uint64_t v8;
  const __CFDictionary *v9;
  _BOOL4 IsDebug;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  NSObject *logger;
  os_log_type_t v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  const __CFDictionary *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v0 = (const __CFDictionary *)CNAccountsGet();
  if (!v0)
    return;
  v1 = v0;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionaryApplyFunction(v1, (CFDictionaryApplierFunction)CNAccountsCarrierPurgeApplier, Mutable);
    Count = CFArrayGetCount(v3);
    if (Count >= 1)
    {
      v5 = Count;
      for (i = 0; i != v5; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
        CFDictionaryRemoveValue(v1, ValueAtIndex);
      }
    }
    CFRelease(v3);
  }
  v8 = CopyCarrierAccountSettings((uint64_t)CFSTR("WISPrAccounts"));
  if (!v8)
  {
    logger = mysyslog_get_logger();
    v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v19))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_219EF1000, logger, v19, "no carrier credentials", (uint8_t *)&v22, 2u);
    }
    goto LABEL_17;
  }
  v9 = (const __CFDictionary *)v8;
  IsDebug = CaptiveIsDebug();
  v11 = mysyslog_get_logger();
  v12 = _SC_syslog_os_log_mapping();
  v13 = os_log_type_enabled(v11, v12);
  if (IsDebug)
  {
    if (v13)
    {
      v22 = 138412290;
      v23 = v9;
      v14 = "merging carrier accounts: %@";
      v15 = v11;
      v16 = v12;
      v17 = 12;
LABEL_15:
      _os_log_impl(&dword_219EF1000, v15, v16, v14, (uint8_t *)&v22, v17);
    }
  }
  else if (v13)
  {
    LOWORD(v22) = 0;
    v14 = "merging carrier accounts";
    v15 = v11;
    v16 = v12;
    v17 = 2;
    goto LABEL_15;
  }
  CFDictionaryApplyFunction(v9, (CFDictionaryApplierFunction)CNAccountsCarrierMergeApplier, v1);
  CFRelease(v9);
LABEL_17:
  if (CaptiveIsDebug())
  {
    v20 = mysyslog_get_logger();
    v21 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = 138412290;
      v23 = v1;
      _os_log_impl(&dword_219EF1000, v20, v21, "accounts: %@", (uint8_t *)&v22, 0xCu);
    }
  }
}

const void *CNAccountsGet()
{
  const void *result;

  result = (const void *)CNAccountsGet_preferences;
  if (!CNAccountsGet_preferences)
  {
    sSourcesHead = (uint64_t)&CNAccountsInit_keychainSource;
    qword_253E531D8 = 0;
    unk_253E531E0 = 0;
    qword_253E531C8 = (uint64_t)CFSTR("Keychain");
    unk_253E531D0 = CNAccountsKeychainQueryStart;
    CNAccountsInit_keychainSource = (uint64_t)&CNAccountsInit_attSource;
    qword_253E531A8 = (uint64_t)CNAccountsATTQueryStart;
    unk_253E531B0 = 0;
    CNAccountsInit_attSource = (uint64_t)&CNAccountsInit_sfrSource;
    unk_253E531A0 = kWISPrPasswordATTMD5;
    qword_253E531B8 = (uint64_t)CNAccountsATTValidate;
    qword_253E531F8 = (uint64_t)CNAccountsSFRQueryStart;
    unk_253E53200 = CNAccountsSFRRejected;
    CNAccountsInit_sfrSource = (uint64_t)&CNAccountsInit_vzwSource;
    unk_253E531F0 = CFSTR("SFR WiFi");
    qword_253E53208 = (uint64_t)CNAccountsSFRValidate;
    qword_253E53220 = (uint64_t)CNAccountsVZWQueryStart;
    unk_253E53228 = 0;
    CNAccountsInit_vzwSource = 0;
    *(_QWORD *)algn_253E53218 = CFSTR("Verizon WiFi");
    qword_253E53230 = (uint64_t)CNAccountsVZWValidate;
    result = CNSPreferencesGet(CFSTR("WISPrAccounts"));
    CNAccountsGet_preferences = (uint64_t)result;
    if (!result)
    {
      CNAccountsGet_preferences = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CNSPreferencesSet(CFSTR("WISPrAccounts"), (const void *)CNAccountsGet_preferences);
      CFRelease((CFTypeRef)CNAccountsGet_preferences);
      return (const void *)CNAccountsGet_preferences;
    }
  }
  return result;
}

void CNAccountsCarrierMergeApplier(const void *a1, const __CFDictionary *a2, __CFDictionary *a3)
{
  CFTypeID v6;
  CFTypeID v7;
  NSObject *logger;
  os_log_type_t v9;
  __CFDictionary *MutableCopy;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  const void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = CFGetTypeID(a1);
  if (v6 == CFStringGetTypeID() && (v7 = CFGetTypeID(a2), v7 == CFDictionaryGetTypeID()))
  {
    logger = mysyslog_get_logger();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v9))
    {
      v13 = 138412290;
      v14 = a1;
      _os_log_impl(&dword_219EF1000, logger, v9, "merging credential %@", (uint8_t *)&v13, 0xCu);
    }
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a2);
    CFDictionaryAddValue(MutableCopy, CFSTR("Source"), CFSTR("Carrier"));
    CFDictionaryAddValue(a3, a1, MutableCopy);
    if (MutableCopy)
      CFRelease(MutableCopy);
  }
  else
  {
    v11 = mysyslog_get_logger();
    v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = 138412290;
      v14 = a1;
      _os_log_impl(&dword_219EF1000, v11, v12, "invalid carrier credential %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

CFMutableArrayRef CNAccountsCopyMatching(uint64_t a1, const __CFDictionary *a2)
{
  CFMutableArrayRef Mutable;
  NSObject *logger;
  os_log_type_t v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFString *Value;
  CFStringRef v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  CFStringRef v19;
  __int128 buf;
  CFMutableArrayRef v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!a1 && a2)
    return 0;
  logger = mysyslog_get_logger();
  v6 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v6))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_impl(&dword_219EF1000, logger, v6, "looking for accounts for SSID %@", (uint8_t *)&buf, 0xCu);
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  v7 = (const __CFDictionary *)CNAccountsGet();
  if (v7 && (v8 = v7, CFDictionaryGetCount(v7) >= 1))
  {
    *(_QWORD *)&buf = a1;
    if (a2)
    {
      Value = (const __CFString *)CFDictionaryGetValue(a2, kWISPrLoginURL[0]);
      v10 = URLStringCopyHostName(Value);
    }
    else
    {
      v10 = 0;
    }
    *((_QWORD *)&buf + 1) = v10;
    v21 = Mutable;
    v13 = mysyslog_get_logger();
    v14 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v13, v14))
    {
      v16 = 138412546;
      v17 = a1;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_219EF1000, v13, v14, "Matching on ssid=%@, host=%@", (uint8_t *)&v16, 0x16u);
    }
    if (!a2 || v10)
    {
      CFDictionaryApplyFunction(v8, (CFDictionaryApplierFunction)CNAccountsMatchDictionaryIterator, &buf);
      if (*((_QWORD *)&buf + 1))
        CFRelease(*((CFTypeRef *)&buf + 1));
    }
  }
  else
  {
    v11 = mysyslog_get_logger();
    v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v11, v12))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_219EF1000, v11, v12, "No accounts to search through", (uint8_t *)&buf, 2u);
    }
  }
  if (!CFArrayGetCount(Mutable) && Mutable)
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

void CNAccountsMatchDictionaryIterator(const void *a1, const void *a2, uint64_t a3)
{
  CFTypeID TypeID;
  CFTypeID v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *logger;
  os_log_type_t v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  const __CFDictionary *Value;
  CFTypeID v17;
  const __CFArray *v18;
  const __CFArray *v19;
  CFIndex Count;
  CFIndex v21;
  CFIndex v22;
  const __CFString *ValueAtIndex;
  CFTypeID v24;
  NSObject *v25;
  os_log_type_t v26;
  NSObject *v27;
  os_log_type_t v28;
  const void *v29;
  int v30;
  const void *v31;
  __int16 v32;
  const void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID || (v7 = CFDictionaryGetTypeID(), !a2) || CFGetTypeID(a2) != v7)
  {
    logger = mysyslog_get_logger();
    v11 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v11))
      return;
    LOWORD(v30) = 0;
    v12 = "accounts contain invalid data";
    v13 = logger;
    v14 = v11;
    v15 = 2;
    goto LABEL_12;
  }
  if (*(_QWORD *)a3 && !CFEqual(*(CFTypeRef *)a3, a1))
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("MatchingSSIDs"));
    v17 = CFDictionaryGetTypeID();
    if (Value && CFGetTypeID(Value) == v17)
    {
      if (!CFDictionaryContainsKey(Value, *(const void **)a3) || !*(_QWORD *)(a3 + 8))
        return;
      v18 = (const __CFArray *)CFDictionaryGetValue(Value, *(const void **)a3);
      if (!v18)
      {
        v27 = mysyslog_get_logger();
        v28 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v27, v28))
          return;
        v29 = *(const void **)a3;
        v30 = 138412546;
        v31 = a1;
        v32 = 2112;
        v33 = v29;
        v12 = "%@ does not match ssid %@";
        v13 = v27;
        v14 = v28;
        v15 = 22;
LABEL_12:
        _os_log_impl(&dword_219EF1000, v13, v14, v12, (uint8_t *)&v30, v15);
        return;
      }
      v19 = v18;
      Count = CFArrayGetCount(v18);
      if (Count >= 1)
      {
        v21 = Count;
        v22 = 0;
        do
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v19, v22);
          v24 = CFGetTypeID(ValueAtIndex);
          if (v24 == CFStringGetTypeID())
          {
            if (CFStringHasSuffix(*(CFStringRef *)(a3 + 8), ValueAtIndex))
              goto LABEL_7;
          }
        }
        while (v21 != ++v22);
      }
      v25 = mysyslog_get_logger();
      v26 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v25, v26))
        return;
      v30 = 138412290;
      v31 = a1;
      v12 = "%@ matches ssid but not trusted hosts";
    }
    else
    {
      v25 = mysyslog_get_logger();
      v26 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v25, v26))
        return;
      v30 = 138412290;
      v31 = a1;
      v12 = "%@ contains no matching SSIDs";
    }
    v13 = v25;
    v14 = v26;
    v15 = 12;
    goto LABEL_12;
  }
LABEL_7:
  v8 = mysyslog_get_logger();
  v9 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v8, v9))
  {
    v30 = 138412290;
    v31 = a1;
    _os_log_impl(&dword_219EF1000, v8, v9, "%@ matches", (uint8_t *)&v30, 0xCu);
  }
  CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 16), a1);
}

BOOL CNAccountsIsCarrierSSID(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const __CFBoolean *v4;
  _BOOL8 result;
  NSObject *logger;
  os_log_type_t v7;
  uint64_t v8;
  CFBooleanRef BOOLean;

  v2 = (const __CFDictionary *)CNAccountsGet();
  if (v2 && (v3 = v2, CFDictionaryGetCount(v2) >= 1))
  {
    v4 = (const __CFBoolean *)*MEMORY[0x24BDBD268];
    v8 = a1;
    BOOLean = v4;
    CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)CNAccountsIsCarrierSSIDIterator, &v8);
    return CFBooleanGetValue(BOOLean) != 0;
  }
  else
  {
    logger = mysyslog_get_logger();
    v7 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(logger, v7);
    if (result)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_219EF1000, logger, v7, "No carrier accounts to search through", (uint8_t *)&v8, 2u);
      return 0;
    }
  }
  return result;
}

void CNAccountsIsCarrierSSIDIterator(const void *a1, const void *a2, uint64_t a3)
{
  CFTypeID TypeID;
  CFTypeID v7;
  const __CFDictionary *Value;
  CFTypeID v9;
  NSObject *v10;
  os_log_type_t v11;
  const void *v12;
  const char *v13;
  NSObject *v14;
  NSObject *logger;
  os_log_type_t v16;
  os_log_type_t v17;
  uint32_t v18;
  NSObject *v19;
  int v20;
  const void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID || (v7 = CFDictionaryGetTypeID(), !a2) || CFGetTypeID(a2) != v7)
  {
    logger = mysyslog_get_logger();
    v16 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v16))
      return;
    LOWORD(v20) = 0;
    v13 = "accounts contain invalid data";
    v14 = logger;
    v17 = v16;
    v18 = 2;
    goto LABEL_14;
  }
  if (CNAccountsIsCarrierCredential(a1) && *(_QWORD *)a3)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("MatchingSSIDs"));
    v9 = CFDictionaryGetTypeID();
    if (Value && CFGetTypeID(Value) == v9)
    {
      if (CFDictionaryContainsKey(Value, *(const void **)a3) == 1)
      {
        *(_QWORD *)(a3 + 8) = *MEMORY[0x24BDBD270];
        v10 = mysyslog_get_logger();
        v11 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v10, v11))
        {
          v12 = *(const void **)a3;
          v20 = 138412290;
          v21 = v12;
          v13 = "Found the carrier ssid: %@";
          v14 = v10;
LABEL_18:
          v17 = v11;
          v18 = 12;
LABEL_14:
          _os_log_impl(&dword_219EF1000, v14, v17, v13, (uint8_t *)&v20, v18);
        }
      }
    }
    else
    {
      v19 = mysyslog_get_logger();
      v11 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v11))
      {
        v20 = 138412290;
        v21 = a1;
        v13 = "%@ contains no matching SSIDs";
        v14 = v19;
        goto LABEL_18;
      }
    }
  }
}

const void *CNAccountsLookupPasswordType(const void *a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *Value;

  v2 = (const __CFDictionary *)CNAccountsGet();
  if (v2 && (Value = (const __CFDictionary *)CFDictionaryGetValue(v2, a1)) != 0)
    return CFDictionaryGetValue(Value, CFSTR("PasswordType"));
  else
    return 0;
}

uint64_t CNAccountsLookupAuthType(const void *a1, int *a2)
{
  uint64_t result;
  const void *Value;
  CFTypeID TypeID;
  int v7;

  result = (uint64_t)CNAccountsGet();
  if (!a2)
    return 0;
  *a2 = 0;
  if (!result)
    return result;
  result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, a1);
  if (!result)
    return result;
  Value = CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("AuthScheme"));
  TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
    return 0;
  if (my_CFEqual(Value, CFSTR("Form")))
  {
    v7 = 1;
LABEL_12:
    *a2 = v7;
    return 1;
  }
  result = my_CFEqual(Value, CFSTR("Bearer"));
  if ((_DWORD)result)
  {
    v7 = 2;
    goto LABEL_12;
  }
  return result;
}

uint64_t CNAccountsCredentialsValidate(const void *a1)
{
  const __CFDictionary *v2;
  const void *Value;
  CFTypeID TypeID;
  uint64_t *v5;
  uint64_t (*v6)(void);
  NSObject *v8;
  os_log_type_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  NSObject *logger;
  os_log_type_t v15;
  int v16;
  const void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (const __CFDictionary *)CNAccountsGet();
  if (!v2)
  {
    logger = mysyslog_get_logger();
    v15 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v15))
      return 0;
    LOWORD(v16) = 0;
    v10 = "Unable to create account setting";
    v11 = logger;
    v12 = v15;
    v13 = 2;
    goto LABEL_11;
  }
  Value = CFDictionaryGetValue(v2, a1);
  TypeID = CFDictionaryGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    v8 = mysyslog_get_logger();
    v9 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v8, v9))
      return 0;
    v16 = 138412290;
    v17 = a1;
    v10 = "Account %@ not found";
    v11 = v8;
    v12 = v9;
    v13 = 12;
LABEL_11:
    _os_log_impl(&dword_219EF1000, v11, v12, v10, (uint8_t *)&v16, v13);
    return 0;
  }
  v5 = CNAccountsLookupSource((const __CFDictionary *)Value);
  if (v5)
  {
    v6 = (uint64_t (*)(void))v5[4];
    if (v6)
      return v6();
  }
  return 0;
}

uint64_t *CNAccountsLookupSource(const __CFDictionary *a1)
{
  const void *Value;
  const void *v2;
  uint64_t *v3;

  Value = CFDictionaryGetValue(a1, CFSTR("PasswordType"));
  if (!Value)
    return 0;
  v2 = Value;
  v3 = &sSourcesHead;
  do
    v3 = (uint64_t *)*v3;
  while (v3 && !CFEqual(v2, (CFTypeRef)v3[1]));
  return v3;
}

_QWORD *CNAccountsCredentialsQueryStart(const __CFString *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  CFMutableDictionaryRef v12;
  CFTypeID TypeID;
  NSObject *v14;
  os_log_type_t v15;
  const char *v16;
  uint64_t *v17;
  uint64_t (*v18)(const __CFString *, CFMutableDictionaryRef, const __CFString *, uint64_t, uint64_t, uint64_t, uint64_t);
  const __CFString *v19;
  _QWORD *v20;
  _QWORD *v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint32_t v27;
  NSObject *logger;
  os_log_type_t v29;
  NSObject *v31;
  os_log_type_t v32;
  char v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  if (!CNAccountsGet())
  {
    logger = mysyslog_get_logger();
    v29 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v29))
    {
      *(_WORD *)buf = 0;
      v24 = "Unable to create accounts setting";
      v25 = logger;
      v26 = v29;
      v27 = 2;
      goto LABEL_20;
    }
    return 0;
  }
  v12 = CNAccountCopyCurrentAccountRecord(a2, a1, &v33);
  TypeID = CFDictionaryGetTypeID();
  if (!v12 || CFGetTypeID(v12) != TypeID)
  {
    v22 = mysyslog_get_logger();
    v23 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v22, v23))
    {
      *(_DWORD *)buf = 138412290;
      v35 = (void *)a1;
      v24 = "account %@ not found";
      v25 = v22;
      v26 = v23;
      v27 = 12;
LABEL_20:
      _os_log_impl(&dword_219EF1000, v25, v26, v24, buf, v27);
      return 0;
    }
    return 0;
  }
  v14 = mysyslog_get_logger();
  v15 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v14, v15))
  {
    if (v33)
      v16 = "ssid";
    else
      v16 = "name";
    *(_DWORD *)buf = 136315138;
    v35 = (void *)v16;
    _os_log_impl(&dword_219EF1000, v14, v15, "account found for %s ", buf, 0xCu);
  }
  v17 = CNAccountsLookupSource(v12);
  if (v17
    && (v18 = (uint64_t (*)(const __CFString *, CFMutableDictionaryRef, const __CFString *, uint64_t, uint64_t, uint64_t, uint64_t))v17[2]) != 0)
  {
    if (v33)
      v19 = a2;
    else
      v19 = a1;
    v20 = (_QWORD *)v18(v19, v12, a2, a3, a4, a5, a6);
    v21 = v20;
    if (v20)
    {
      *v20 = sQueriesHead;
      sQueriesHead = (uint64_t)v20;
    }
  }
  else
  {
    v31 = mysyslog_get_logger();
    v32 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v31, v32))
    {
      *(_DWORD *)buf = 138412290;
      v35 = (void *)a1;
      _os_log_impl(&dword_219EF1000, v31, v32, "unsupported password type for account %@", buf, 0xCu);
    }
    v21 = 0;
  }
  CFRelease(v12);
  return v21;
}

CFMutableDictionaryRef CNAccountCopyCurrentAccountRecord(const __CFString *a1, const __CFString *a2, _BYTE *a3)
{
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const void *Value;
  CFTypeID TypeID;
  _BOOL4 v10;
  CFTypeID v11;

  v6 = (const __CFDictionary *)CNAccountsGet();
  if (!a3)
    return 0;
  v7 = v6;
  if (!v6)
    return 0;
  *a3 = 0;
  if (!a2 || CFStringGetLength(a2) <= 0)
  {
    CFDictionaryGetTypeID();
    Value = 0;
    goto LABEL_8;
  }
  Value = CFDictionaryGetValue(v7, a2);
  TypeID = CFDictionaryGetTypeID();
  if (!Value)
  {
LABEL_8:
    v10 = 1;
    goto LABEL_9;
  }
  v10 = CFGetTypeID(Value) != TypeID;
LABEL_9:
  if (a1 && v10 && CFStringGetLength(a1) >= 1)
  {
    Value = CFDictionaryGetValue(v7, a1);
    *a3 = 1;
  }
  v11 = CFDictionaryGetTypeID();
  if (Value && CFGetTypeID(Value) == v11)
    return CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)Value);
  return 0;
}

uint64_t CNAccountsCredentialsQueryAbort(uint64_t result)
{
  uint64_t *v1;
  uint64_t *v2;

  v1 = &sQueriesHead;
  while (1)
  {
    v2 = v1;
    v1 = (uint64_t *)*v1;
    if (!v1)
      break;
    if (v1 == (uint64_t *)result)
    {
      *v2 = *(_QWORD *)result;
      *(_QWORD *)result = 0;
      return (*(uint64_t (**)(void))(result + 8))();
    }
  }
  return result;
}

const __CFDictionary *CNAccountsIsCarrierCredential(const void *a1)
{
  const __CFDictionary *result;

  result = (const __CFDictionary *)CNAccountsGet();
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, a1);
    if (result)
    {
      result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("Source"));
      if (result)
        return (const __CFDictionary *)(CFEqual(result, CFSTR("Carrier")) != 0);
    }
  }
  return result;
}

void CNAccountsAddInternal(const __CFString *a1, const void *a2, const __CFString *a3, const __CFString *a4, int a5, int a6)
{
  __CFDictionary *v12;
  __CFDictionary *v13;
  CFMutableDictionaryRef v14;
  CFMutableDictionaryRef v15;
  const __CFDictionary *v16;
  NSObject *logger;
  os_log_type_t v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  NSObject *v23;
  os_log_type_t v24;
  const __CFString *v25;
  const __CFAllocator *v26;
  __CFDictionary *Mutable;
  __CFDictionary *v28;
  const __CFString *v29;
  BOOL v30;
  const __CFString *v31;
  NSObject *v32;
  os_log_type_t v33;
  const __CFString *v34;
  __CFDictionary *v35;
  const __CFString *v36;
  CFMutableDictionaryRef v37;
  const __CFString *v38;
  NSObject *v39;
  os_log_type_t v40;
  const __CFAllocator *v41;
  __CFDictionary *v42;
  const void *v43;
  OSStatus v44;
  OSStatus v45;
  const __CFDictionary *v46;
  OSStatus v47;
  NSObject *v48;
  os_log_type_t v49;
  const char *v50;
  uint8_t *v51;
  NSObject *v52;
  NSObject *v53;
  os_log_type_t v54;
  os_log_type_t v55;
  uint32_t v56;
  NSObject *v57;
  const void *Value;
  CFTypeID TypeID;
  CFStringRef v60;
  NSObject *v61;
  os_log_type_t v62;
  const __CFDictionary *v63;
  const __CFDictionary *v64;
  CFTypeID v65;
  const __CFArray *v66;
  CFMutableArrayRef v67;
  const __CFString *v68;
  NSObject *v69;
  os_log_type_t v70;
  NSObject *v71;
  os_log_type_t v72;
  NSObject *v73;
  os_log_type_t v74;
  const __CFDictionary *v75;
  BOOL v76;
  _BYTE buf[12];
  __int16 v78;
  CFStringRef v79;
  __int16 v80;
  const __CFString *v81;
  _DWORD v82[4];
  void *values[2];
  CFRange v84;

  values[1] = *(void **)MEMORY[0x24BDAC8D0];
  v12 = (__CFDictionary *)CNAccountsGet();
  v76 = 0;
  if (!v12)
  {
    logger = mysyslog_get_logger();
    v18 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v18))
      return;
    *(_WORD *)buf = 0;
    v19 = "unable to get accounts";
    v20 = logger;
    v21 = v18;
    v22 = 2;
    goto LABEL_24;
  }
  v13 = v12;
  v14 = CNAccountCopyCurrentAccountRecord(a3, a1, &v76);
  v15 = v14;
  if (v14)
  {
    v16 = v14;
    if (!a2)
    {
LABEL_51:
      if (v76)
      {
        Value = CFDictionaryGetValue(v16, CFSTR("AuthScheme"));
        TypeID = CFStringGetTypeID();
        if (Value)
        {
          if (CFGetTypeID(Value) == TypeID && CFEqual(Value, CFSTR("Bearer")))
          {
            if (a4 && CFStringGetLength(a4) >= 9)
              CFDictionarySetValue(v16, kTokenAuthLoginURL[0], a4);
            else
              CFDictionaryRemoveValue(v16, kTokenAuthLoginURL[0]);
          }
        }
      }
      goto LABEL_59;
    }
    goto LABEL_30;
  }
  v23 = mysyslog_get_logger();
  v24 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v23, v24))
  {
    if (a1)
      v25 = a1;
    else
      v25 = a3;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v25;
    _os_log_impl(&dword_219EF1000, v23, v24, "adding new account record for %@", buf, 0xCu);
  }
  if (!a2
    || (v26 = (const __CFAllocator *)*MEMORY[0x24BDBD240],
        (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) == 0))
  {
    v32 = mysyslog_get_logger();
    v33 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v32, v33))
      return;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = a1;
    v19 = "failed to create new account record for %@";
    v20 = v32;
    v21 = v33;
    v22 = 12;
LABEL_24:
    _os_log_impl(&dword_219EF1000, v20, v21, v19, buf, v22);
    return;
  }
  v28 = Mutable;
  v76 = a1 == 0;
  if (a6)
    v29 = CFSTR("Websheet");
  else
    v29 = CFSTR("API");
  CFDictionaryAddValue(Mutable, CFSTR("Source"), v29);
  CFDictionaryAddValue(v28, CFSTR("PasswordType"), CFSTR("Keychain"));
  v30 = a5 == 2;
  v16 = v28;
  v31 = CFSTR("AuthScheme");
  if (v30)
  {
    CFDictionaryAddValue(v28, CFSTR("AuthScheme"), CFSTR("Bearer"));
    if (!a4 || CFStringGetLength(a4) < 9)
      goto LABEL_26;
    v31 = kTokenAuthLoginURL[0];
    v35 = v28;
    v34 = a4;
  }
  else
  {
    v34 = CFSTR("Form");
    v35 = v28;
  }
  CFDictionaryAddValue(v35, v31, v34);
LABEL_26:
  v36 = a3;
  if (!v76)
  {
    v37 = CFDictionaryCreateMutable(v26, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionaryAddValue(v16, CFSTR("MatchingSSIDs"), v37);
    v36 = a1;
    if (v37)
    {
      CFRelease(v37);
      v36 = a1;
    }
  }
  CFDictionaryAddValue(v13, v36, v16);
LABEL_30:
  v75 = v16;
  if (a1)
    v38 = a1;
  else
    v38 = a3;
  v39 = mysyslog_get_logger();
  v40 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v39, v40))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v38;
    _os_log_impl(&dword_219EF1000, v39, v40, "updating password for %@", buf, 0xCu);
  }
  v41 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v42 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9240]);
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x24BDE9110], kWISPrSecurityDomain);
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x24BDE90C0], (const void *)*MEMORY[0x24BDE90C8]);
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x24BDE8FC0], (const void *)*MEMORY[0x24BDE8FC8]);
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x24BDE8F60], (const void *)*MEMORY[0x24BDE8F68]);
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x24BDE8FA8], v38);
  v43 = (const void *)*MEMORY[0x24BDE9550];
  CFDictionaryAddValue(v42, (const void *)*MEMORY[0x24BDE9550], a2);
  v44 = SecItemAdd(v42, 0);
  if (!v44)
    goto LABEL_42;
  v45 = v44;
  if (v44 != -25299)
  {
    v57 = mysyslog_get_logger();
    v49 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v57, v49))
      goto LABEL_48;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v45;
    v50 = "SecItemAdd failed: %d";
    v51 = buf;
    v52 = v57;
    goto LABEL_46;
  }
  *(_QWORD *)buf = v43;
  values[0] = (void *)CFDictionaryGetValue(v42, v43);
  v46 = CFDictionaryCreate(v41, (const void **)buf, (const void **)values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionaryRemoveValue(v42, v43);
  v47 = SecItemUpdate(v42, v46);
  if (v46)
    CFRelease(v46);
  if (!v47)
  {
LABEL_42:
    v53 = mysyslog_get_logger();
    v54 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v53, v54))
      goto LABEL_48;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v38;
    v50 = "added password for account %@ to keychain";
    v51 = buf;
    v52 = v53;
    v55 = v54;
    v56 = 12;
    goto LABEL_47;
  }
  v48 = mysyslog_get_logger();
  v49 = _SC_syslog_os_log_mapping();
  if (!os_log_type_enabled(v48, v49))
    goto LABEL_48;
  v82[0] = 67109120;
  v82[1] = v47;
  v50 = "SecItemUpdate failed: %d";
  v51 = (uint8_t *)v82;
  v52 = v48;
LABEL_46:
  v55 = v49;
  v56 = 8;
LABEL_47:
  _os_log_impl(&dword_219EF1000, v52, v55, v50, v51, v56);
LABEL_48:
  if (v42)
    CFRelease(v42);
  v16 = v75;
  if (v15)
    goto LABEL_51;
LABEL_59:
  if (!a3 || !a4 || v76)
  {
LABEL_73:
    if (v15)
    {
      if (a1)
        v68 = a1;
      else
        v68 = a3;
      v69 = mysyslog_get_logger();
      v70 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v69, v70))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = a1;
        _os_log_impl(&dword_219EF1000, v69, v70, "updating account record for [%@]", buf, 0xCu);
      }
      CFDictionarySetValue(v13, v68, v16);
    }
LABEL_83:
    CFRelease(v16);
    CNSPreferencesFlush();
    return;
  }
  v60 = URLStringCopyHostName(a4);
  v61 = mysyslog_get_logger();
  v62 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v61, v62))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = a3;
    v78 = 2112;
    v79 = v60;
    v80 = 2112;
    v81 = a1;
    _os_log_impl(&dword_219EF1000, v61, v62, "adding ssid=%@, host=%@ to %@", buf, 0x20u);
  }
  if (!v60)
    goto LABEL_83;
  v63 = (const __CFDictionary *)CFDictionaryGetValue(v16, CFSTR("MatchingSSIDs"));
  if (!v63 || (v64 = v63, v65 = CFGetTypeID(v63), v65 != CFDictionaryGetTypeID()))
  {
    v71 = mysyslog_get_logger();
    v72 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v71, v72))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = a1;
      _os_log_impl(&dword_219EF1000, v71, v72, "unable to add trusted ssid/host to account %@", buf, 0xCu);
    }
    CFRelease(v60);
    goto LABEL_83;
  }
  v66 = (const __CFArray *)CFDictionaryGetValue(v64, a3);
  if (v66)
  {
LABEL_70:
    v84.length = CFArrayGetCount(v66);
    v84.location = 0;
    if (!CFArrayContainsValue(v66, v84, v60))
      CFArrayAppendValue(v66, v60);
    CFRelease(v60);
    goto LABEL_73;
  }
  v67 = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (v67)
  {
    v66 = v67;
    CFDictionaryAddValue(v64, a3, v67);
    CFRelease(v66);
    goto LABEL_70;
  }
  v73 = mysyslog_get_logger();
  v74 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v73, v74))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219EF1000, v73, v74, "failed to add trusted hosts", buf, 2u);
  }
  CFRelease(v60);
  CFRelease(v16);
}

void CNAccountsRejected(const void *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  const __CFDictionary *v8;
  const __CFDictionary *Value;
  const __CFDictionary *v10;
  CFTypeID v11;
  uint64_t *v12;
  void (*v13)(const void *, const __CFDictionary *, const void *, uint64_t, uint64_t, char *);
  const void *v14;
  __CFDictionary *v15;
  char v16;

  v8 = (const __CFDictionary *)CNAccountsGet();
  if (v8)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(v8, a1);
    if (Value)
    {
      v10 = Value;
      v11 = CFGetTypeID(Value);
      if (v11 == CFDictionaryGetTypeID())
      {
        v16 = 1;
        v12 = CNAccountsLookupSource(v10);
        if (v12
          && (v13 = (void (*)(const void *, const __CFDictionary *, const void *, uint64_t, uint64_t, char *))v12[3]) != 0)
        {
          v13(a1, v10, a2, a3, a4, &v16);
          if (!v16)
            return;
        }
        else if (CFDictionaryGetValue(v10, CFSTR("Source")))
        {
          v14 = CFDictionaryGetValue(v10, CFSTR("Source"));
          if (CFEqual(v14, CFSTR("Carrier")))
            return;
        }
        v15 = (__CFDictionary *)CFDictionaryGetValue(v10, CFSTR("MatchingSSIDs"));
        if (v15)
          CFDictionaryRemoveValue(v15, a2);
        CNSPreferencesFlush();
      }
    }
  }
}

void CNAccountsPurgeSSID(const void *a1)
{
  const __CFDictionary *v2;
  __CFDictionary *v3;
  NSObject *logger;
  os_log_type_t v5;
  const void *v6;
  CFTypeID v7;
  CFIndex Count;
  void *v9;
  const void **v10;
  const __CFDictionary *Value;
  const __CFDictionary *v12;
  CFTypeID v13;
  const void *v14;
  NSObject *v15;
  os_log_type_t v16;
  const void *v17;
  __CFDictionary *v18;
  CFTypeID TypeID;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t buf[4];
  const void *v23;
  __int16 v24;
  const void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = (const __CFDictionary *)CNAccountsGet();
  if (v2)
  {
    v3 = v2;
    if (CFDictionaryGetCount(v2))
    {
      logger = mysyslog_get_logger();
      v5 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v5))
      {
        *(_DWORD *)buf = 138412290;
        v23 = a1;
        _os_log_impl(&dword_219EF1000, logger, v5, "Removing ssid \"%@\" from all accounts", buf, 0xCu);
      }
      if (CFDictionaryContainsKey(v3, a1)
        && (v6 = CFDictionaryGetValue(v3, a1), v7 = CFDictionaryGetTypeID(), v6)
        && CFGetTypeID(v6) == v7)
      {
        CNAccountsKeychainRemovePassword(a1);
        CFDictionaryRemoveValue(v3, a1);
      }
      else
      {
        Count = CFDictionaryGetCount(v3);
        v9 = malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
        bzero(v9, 8 * Count);
        CFDictionaryGetKeysAndValues(v3, (const void **)v9, 0);
        if (Count >= 1)
        {
          v10 = (const void **)v9;
          do
          {
            Value = (const __CFDictionary *)CFDictionaryGetValue(v3, *v10);
            if (Value)
            {
              v12 = Value;
              v13 = CFGetTypeID(Value);
              if (v13 == CFDictionaryGetTypeID())
              {
                v14 = *v10;
                v15 = mysyslog_get_logger();
                v16 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v15, v16))
                {
                  *(_DWORD *)buf = 138412546;
                  v23 = v14;
                  v24 = 2112;
                  v25 = a1;
                  _os_log_impl(&dword_219EF1000, v15, v16, "Checking Account=[%@] for ssid=[%@]", buf, 0x16u);
                }
                v17 = CFDictionaryGetValue(v12, CFSTR("Source"));
                if (!CFEqual(v17, CFSTR("Carrier")))
                {
                  v18 = (__CFDictionary *)CFDictionaryGetValue(v12, CFSTR("MatchingSSIDs"));
                  TypeID = CFDictionaryGetTypeID();
                  if (v18)
                  {
                    if (CFGetTypeID(v18) == TypeID)
                    {
                      CFDictionaryRemoveValue(v18, a1);
                      if (!CFDictionaryGetCount(v18))
                      {
                        v20 = mysyslog_get_logger();
                        v21 = _SC_syslog_os_log_mapping();
                        if (os_log_type_enabled(v20, v21))
                        {
                          *(_DWORD *)buf = 138412290;
                          v23 = v14;
                          _os_log_impl(&dword_219EF1000, v20, v21, "Account %@ has no more ssids. PURGE!", buf, 0xCu);
                        }
                        CNAccountsKeychainRemovePassword(v14);
                        CFDictionaryRemoveValue(v3, v14);
                      }
                    }
                  }
                }
              }
            }
            ++v10;
            --Count;
          }
          while (Count);
        }
        free(v9);
      }
      CNSPreferencesFlush();
    }
  }
}

void CNAccountsKeychainRemovePassword(const void *a1)
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  OSStatus v4;
  OSStatus v5;
  NSObject *logger;
  os_log_type_t v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9240]);
    CFDictionaryAddValue(v3, (const void *)*MEMORY[0x24BDE9110], kWISPrSecurityDomain);
    CFDictionaryAddValue(v3, (const void *)*MEMORY[0x24BDE90C0], (const void *)*MEMORY[0x24BDE90C8]);
    CFDictionaryAddValue(v3, (const void *)*MEMORY[0x24BDE8FC0], (const void *)*MEMORY[0x24BDE8FC8]);
    CFDictionaryAddValue(v3, (const void *)*MEMORY[0x24BDE8F60], (const void *)*MEMORY[0x24BDE8F68]);
    CFDictionaryAddValue(v3, (const void *)*MEMORY[0x24BDE8FA8], a1);
    v4 = SecItemDelete(v3);
    if (v4)
    {
      v5 = v4;
      logger = mysyslog_get_logger();
      v7 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v7))
      {
        v8[0] = 67109120;
        v8[1] = v5;
        _os_log_impl(&dword_219EF1000, logger, v7, "SecItemDelete failed: %d", (uint8_t *)v8, 8u);
      }
    }
    CFRelease(v3);
  }
}

uint64_t *CNAccountsCredentialQueryInvalidate(uint64_t *result)
{
  uint64_t *v1;
  uint64_t *v2;

  v1 = &sQueriesHead;
  while (1)
  {
    v2 = v1;
    v1 = (uint64_t *)*v1;
    if (!v1)
      break;
    if (v1 == result)
    {
      *v2 = *result;
      return result;
    }
  }
  return result;
}

CFDictionaryRef WISPrCredentialsDictionaryCreate(void *a1, void *a2)
{
  CFDictionaryRef result;
  void *values[2];
  void *keys[3];

  result = 0;
  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a2)
    {
      keys[0] = CFSTR("UserName");
      keys[1] = CFSTR("Password");
      values[0] = a1;
      values[1] = a2;
      return CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    }
  }
  return result;
}

CFRunLoopSourceRef *CNAccountsKeychainQueryStart(__CFRunLoopSource *a1, __CFRunLoopSource *a2, uint64_t a3, uint64_t a4, uint64_t a5, __CFRunLoopSource *a6, __CFRunLoopSource *a7)
{
  CFRunLoopSourceRef *v11;
  CFRunLoopSourceRef *v12;
  __CFRunLoop *Current;
  CFRunLoopSourceContext v15;

  v11 = (CFRunLoopSourceRef *)malloc_type_malloc(0x38uLL, 0xE00409C3A2E09uLL);
  v12 = v11;
  if (v11)
  {
    v15.version = 0;
    memset(&v15.retain, 0, 56);
    v15.info = v11;
    v15.perform = (void (__cdecl *)(void *))CNAccountsKeychainQueryDo;
    *(_OWORD *)v11 = 0u;
    *((_OWORD *)v11 + 1) = 0u;
    v11[6] = 0;
    *((_OWORD *)v11 + 2) = 0u;
    v11[1] = (CFRunLoopSourceRef)CNAccountsKeychainQueryAbort;
    v11[2] = a6;
    v11[3] = a7;
    v11[6] = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &v15);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v12[6], (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    CFRunLoopSourceSignal(v12[6]);
    v12[4] = a1;
    CFRetain(a1);
    v12[5] = a2;
    CFRetain(a2);
  }
  return v12;
}

void CNAccountsKeychainQueryDo(uint64_t *a1)
{
  __CFRunLoop *Current;
  const void *v3;
  NSObject *logger;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFAllocator *v14;
  const __CFDictionary *v15;
  OSStatus v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  __CFString *v20;
  __CFDictionary *MutableCopy;
  const void *v22;
  const void *v23;
  CFTypeRef v24;
  CFTypeID TypeID;
  const __CFDictionary *v26;
  const __CFDictionary *v27;
  const void *Value;
  CFTypeRef result;
  uint8_t v30[4];
  uint64_t v31;
  __int16 v32;
  OSStatus v33;
  void *values[6];
  __int128 buf;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  CFRunLoopSourceInvalidate((CFRunLoopSourceRef)a1[6]);
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, (CFRunLoopSourceRef)a1[6], (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  v3 = (const void *)a1[6];
  if (v3)
  {
    CFRelease(v3);
    a1[6] = 0;
  }
  logger = mysyslog_get_logger();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    v6 = a1[4];
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_219EF1000, logger, v5, "querying keychain for %@", (uint8_t *)&buf, 0xCu);
  }
  v7 = &sQueriesHead;
  while (1)
  {
    v8 = v7;
    v7 = (uint64_t *)*v7;
    if (!v7)
      break;
    if (v7 == a1)
    {
      *v8 = *a1;
      break;
    }
  }
  v9 = *MEMORY[0x24BDE9110];
  *(_QWORD *)&buf = *MEMORY[0x24BDE9220];
  *((_QWORD *)&buf + 1) = v9;
  v10 = *MEMORY[0x24BDE90C0];
  v36 = *MEMORY[0x24BDE8FA8];
  v37 = v10;
  v11 = *MEMORY[0x24BDE94C8];
  v38 = *MEMORY[0x24BDE8FC0];
  v39 = v11;
  values[0] = *(void **)MEMORY[0x24BDE9240];
  values[1] = kWISPrSecurityDomain;
  v12 = (void *)*MEMORY[0x24BDE90C8];
  values[2] = (void *)a1[4];
  values[3] = v12;
  v13 = (void *)*MEMORY[0x24BDBD270];
  values[4] = *(void **)MEMORY[0x24BDE8FC8];
  values[5] = v13;
  v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v15 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&buf, (const void **)values, 6, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  result = 0;
  v16 = SecItemCopyMatching(v15, &result);
  if (v15)
    CFRelease(v15);
  if (v16 || (v24 = result, TypeID = CFDataGetTypeID(), !v24) || CFGetTypeID(v24) != TypeID)
  {
    v17 = mysyslog_get_logger();
    v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = a1[4];
      *(_DWORD *)v30 = 138412546;
      v31 = v19;
      v32 = 1024;
      v33 = v16;
      _os_log_impl(&dword_219EF1000, v17, v18, "Failed to get password for %@: %d", v30, 0x12u);
    }
    v20 = 0;
    goto LABEL_15;
  }
  v20 = (__CFString *)CFStringCreateFromExternalRepresentation(v14, (CFDataRef)result, 0x8000100u);
  v26 = WISPrCredentialsDictionaryCreate((void *)a1[4], v20);
  if (!v26)
  {
LABEL_15:
    MutableCopy = 0;
    goto LABEL_16;
  }
  v27 = v26;
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v26);
  if (CFDictionaryContainsKey((CFDictionaryRef)a1[5], kTokenAuthLoginURL[0]))
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)a1[5], kTokenAuthLoginURL[0]);
    CFDictionaryAddValue(MutableCopy, kTokenAuthLoginURL[0], Value);
    CFRelease(v27);
  }
  else
  {
    CFRelease(MutableCopy);
    MutableCopy = v27;
  }
LABEL_16:
  ((void (*)(uint64_t, __CFDictionary *))a1[2])(a1[3], MutableCopy);
  v22 = (const void *)a1[4];
  if (v22)
  {
    CFRelease(v22);
    a1[4] = 0;
  }
  v23 = (const void *)a1[5];
  if (v23)
  {
    CFRelease(v23);
    a1[5] = 0;
  }
  if (result)
  {
    CFRelease(result);
    result = 0;
  }
  if (v20)
    CFRelease(v20);
  if (MutableCopy)
    CFRelease(MutableCopy);
  free(a1);
}

void CNAccountsKeychainQueryAbort(uint64_t a1)
{
  __CFRunLoop *Current;
  const void *v3;
  const void *v4;
  const void *v5;

  CFRunLoopSourceInvalidate(*(CFRunLoopSourceRef *)(a1 + 48));
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 48), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 48) = 0;
  }
  v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
  free((void *)a1);
}

void CNAccountsCarrierPurgeApplier(const void *a1, CFTypeRef cf, __CFArray *a3)
{
  CFTypeID v6;
  CFTypeID v7;
  const void *Value;

  v6 = CFGetTypeID(cf);
  if (v6 != CFDictionaryGetTypeID()
    || (v7 = CFGetTypeID(a1), v7 != CFStringGetTypeID())
    || (Value = CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("Source")), CFEqual(Value, CFSTR("Carrier"))))
  {
    CFArrayAppendValue(a3, a1);
  }
}

CFRunLoopSourceRef *CNAccountsATTQueryStart(__CFRunLoopSource *a1, __CFRunLoopSource *a2, uint64_t a3, uint64_t a4, __CFRunLoopSource *a5, __CFRunLoopSource *a6, __CFRunLoopSource *a7)
{
  CFRunLoopSourceRef *v12;
  CFRunLoopSourceRef *v13;
  int v14;
  CFRunLoopSourceRef *v15;
  __CFRunLoop *Current;
  CFRunLoopSourceContext v18;

  v12 = (CFRunLoopSourceRef *)CopySIMStatus();
  v13 = v12;
  if (v12)
  {
    v14 = CFEqual(v12, (CFTypeRef)*MEMORY[0x24BDC2CD8]);
    CFRelease(v13);
    if (v14)
    {
      return 0;
    }
    else
    {
      v15 = (CFRunLoopSourceRef *)malloc_type_malloc(0x40uLL, 0xE0040B3D8CE0AuLL);
      v13 = v15;
      if (v15)
      {
        v18.version = 0;
        memset(&v18.retain, 0, 56);
        v18.info = v15;
        v18.perform = (void (__cdecl *)(void *))CNAccountsATTQueryDo;
        *(_OWORD *)v15 = 0u;
        *((_OWORD *)v15 + 1) = 0u;
        *((_OWORD *)v15 + 2) = 0u;
        *((_OWORD *)v15 + 3) = 0u;
        v15[1] = (CFRunLoopSourceRef)CNAccountsATTQueryAbort;
        v15[2] = a6;
        v15[3] = a7;
        v15[7] = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &v18);
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, v13[7], (CFRunLoopMode)*MEMORY[0x24BDBD598]);
        CFRunLoopSourceSignal(v13[7]);
        v13[4] = a1;
        CFRetain(a1);
        v13[6] = a2;
        CFRetain(a2);
        v13[5] = a5;
        CFRetain(a5);
      }
    }
  }
  return v13;
}

void CNAccountsATTQueryDo(uint64_t a1)
{
  __CFRunLoop *Current;
  const void *v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const __CFString *Value;
  const __CFAllocator *v7;
  const __CFURL *v8;
  const __CFURL *v9;
  const __CFString *String;
  const __CFArray *ArrayBySeparatingStrings;
  CFIndex Count;
  CFIndex v13;
  CFIndex v14;
  const __CFString *ValueAtIndex;
  const __CFArray *v16;
  const __CFArray *v17;
  const __CFString *v18;
  const void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  CFStringRef v25;
  NSObject *logger;
  uint64_t v27;
  const char *v28;
  char *v29;
  CFStringRef v30;
  const void *v31;
  CFStringRef v32;
  __CFString *v33;
  CFDictionaryRef v34;
  const void *v35;
  const void *v36;
  const void *v37;
  NSObject *v38;
  os_log_type_t v39;
  const __CFString *v40;
  CFIndex Length;
  CFIndex v42;
  CFStringRef v43;
  NSObject *v44;
  uint64_t v45;
  uint8_t buf[16];
  CFRange v47;

  CFRunLoopSourceInvalidate(*(CFRunLoopSourceRef *)(a1 + 56));
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 56), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  v3 = *(const void **)(a1 + 56);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 56) = 0;
  }
  CNAccountsCredentialQueryInvalidate((uint64_t *)a1);
  v4 = *(const __CFDictionary **)(a1 + 40);
  if (!v4)
  {
    logger = mysyslog_get_logger();
    LOBYTE(v27) = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, (os_log_type_t)v27))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v28 = "redirect missing";
LABEL_36:
    _os_log_impl(&dword_219EF1000, logger, (os_log_type_t)v27, v28, buf, 2u);
    goto LABEL_37;
  }
  v5 = *(const __CFDictionary **)(a1 + 48);
  if (!v5)
  {
    logger = mysyslog_get_logger();
    LOBYTE(v27) = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, (os_log_type_t)v27))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v28 = "account missing";
    goto LABEL_36;
  }
  if (!CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), kATTAuthenticationSeed[0]))
  {
    logger = mysyslog_get_logger();
    LOBYTE(v27) = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, (os_log_type_t)v27))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v28 = "Authentication seed missing";
    goto LABEL_36;
  }
  Value = (const __CFString *)CFDictionaryGetValue(v4, kWISPrLoginURL[0]);
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = CFURLCreateWithString((CFAllocatorRef)*MEMORY[0x24BDBD240], Value, 0);
  if (!v8)
  {
    logger = mysyslog_get_logger();
    LOBYTE(v27) = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, (os_log_type_t)v27))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v28 = "URL missing";
    goto LABEL_36;
  }
  v9 = v8;
  String = CFURLCopyQueryString(v8, &stru_24DC17C58);
  CFRelease(v9);
  if (!String)
  {
    logger = mysyslog_get_logger();
    v27 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, (os_log_type_t)v27))
      goto LABEL_37;
    *(_WORD *)buf = 0;
    v28 = "Query string missing";
    goto LABEL_36;
  }
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(v7, String, CFSTR("&"));
  CFRelease(String);
  if (!ArrayBySeparatingStrings)
  {
    logger = mysyslog_get_logger();
    LOBYTE(v27) = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, (os_log_type_t)v27))
    {
      *(_WORD *)buf = 0;
      v28 = "elements missing";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  Count = CFArrayGetCount(ArrayBySeparatingStrings);
  if (Count < 1)
  {
LABEL_32:
    CFRelease(ArrayBySeparatingStrings);
    logger = mysyslog_get_logger();
    LOBYTE(v27) = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, (os_log_type_t)v27))
    {
      *(_WORD *)buf = 0;
      v28 = "macAddress missing";
      goto LABEL_36;
    }
LABEL_37:
    v29 = 0;
    goto LABEL_38;
  }
  v13 = Count;
  v14 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, v14);
    v16 = CFStringCreateArrayBySeparatingStrings(v7, ValueAtIndex, CFSTR("="));
    if (v16)
      break;
LABEL_15:
    if (v13 == ++v14)
      goto LABEL_32;
  }
  v17 = v16;
  if (CFArrayGetCount(v16) != 2
    || (v18 = (const __CFString *)CFArrayGetValueAtIndex(v17, 0), CFStringCompare(v18, CFSTR("MacAddr"), 0)))
  {
    CFRelease(v17);
    goto LABEL_15;
  }
  v19 = CFArrayGetValueAtIndex(v17, 1);
  CFRetain(v19);
  CFRelease(v17);
  if (!v19)
    goto LABEL_15;
  CFRelease(ArrayBySeparatingStrings);
  v20 = (const __CFString *)CFDictionaryGetValue(v5, CFSTR("SharedSecret"));
  v21 = (void *)_SC_cfstring_to_cstring();
  v22 = (void *)_SC_cfstring_to_cstring();
  v23 = _SC_cfstring_to_cstring();
  v24 = (void *)v23;
  if (v21 && v23 && v22)
  {
    v25 = CFStringCreateWithFormat(v7, 0, CFSTR("%s%s%s"), v21, v23, v22);
    goto LABEL_60;
  }
  v38 = mysyslog_get_logger();
  v39 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v38, v39))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219EF1000, v38, v39, "Could not convert strings", buf, 2u);
  }
  v25 = 0;
  v40 = 0;
  if (v21)
  {
LABEL_60:
    free(v21);
    v40 = v25;
  }
  if (v24)
    free(v24);
  if (v22)
    free(v22);
  if (!v40)
  {
    v44 = mysyslog_get_logger();
    v45 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v44, (os_log_type_t)v45))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v44, (os_log_type_t)v45, "Could not compute pre-hash", buf, 2u);
    }
    CFRelease(v19);
    goto LABEL_37;
  }
  CFRelease(v19);
  Length = CFStringGetLength(v40);
  if (Length <= CFStringGetLength(v20))
  {
    v29 = CaptiveAccountsATTMD5Hash(v40);
  }
  else
  {
    v42 = CFStringGetLength(v40);
    v47.length = v42 - CFStringGetLength(v20);
    v47.location = 0;
    v43 = CFStringCreateWithSubstring(v7, v40, v47);
    v29 = CaptiveAccountsATTMD5Hash(v40);
    if (v43)
      CFRelease(v43);
  }
  CFRelease(v40);
LABEL_38:
  v30 = CNAccountsATTCopyPhoneNumber();
  v31 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), CFSTR("AuthenticationRealm"));
  if (v29 && v30 && v31)
  {
    v32 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@@%@"), v30, v31);
    goto LABEL_43;
  }
  v32 = 0;
  v33 = 0;
  if (v30)
  {
LABEL_43:
    CFRelease(v30);
    v33 = (__CFString *)v32;
  }
  v34 = WISPrCredentialsDictionaryCreate(v33, v29);
  (*(void (**)(_QWORD, CFDictionaryRef))(a1 + 16))(*(_QWORD *)(a1 + 24), v34);
  v35 = *(const void **)(a1 + 32);
  if (v35)
  {
    CFRelease(v35);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v36 = *(const void **)(a1 + 40);
  if (v36)
  {
    CFRelease(v36);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v37 = *(const void **)(a1 + 48);
  if (v37)
  {
    CFRelease(v37);
    *(_QWORD *)(a1 + 48) = 0;
  }
  if (v29)
    CFRelease(v29);
  if (v33)
    CFRelease(v33);
  if (v34)
    CFRelease(v34);
  free((void *)a1);
}

void CNAccountsATTQueryAbort(uint64_t a1)
{
  __CFRunLoop *Current;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;

  CFRunLoopSourceInvalidate(*(CFRunLoopSourceRef *)(a1 + 56));
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 56), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  v3 = *(const void **)(a1 + 56);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 56) = 0;
  }
  v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v5 = *(const void **)(a1 + 40);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v6 = *(const void **)(a1 + 48);
  if (v6)
    CFRelease(v6);
  free((void *)a1);
}

BOOL CNAccountsATTValidate()
{
  CFStringRef v0;
  CFStringRef v1;

  v0 = CNAccountsATTCopyPhoneNumber();
  v1 = v0;
  if (v0)
    CFRelease(v0);
  return v1 != 0;
}

CFStringRef CNAccountsATTCopyPhoneNumber()
{
  uint64_t v0;
  const __CFString *v1;
  NSObject *logger;
  os_log_type_t v3;
  CFIndex Length;
  CFStringRef v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;
  CFRange v10;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = CopyPhoneNumber();
  if (!v0)
    return 0;
  v1 = (const __CFString *)v0;
  logger = mysyslog_get_logger();
  v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    v7 = 138412290;
    v8 = v1;
    _os_log_impl(&dword_219EF1000, logger, v3, "phone number: %@", (uint8_t *)&v7, 0xCu);
  }
  Length = CFStringGetLength(v1);
  if (Length < 10)
  {
    v5 = 0;
  }
  else
  {
    v10.length = 10;
    v10.location = Length - 10;
    v5 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x24BDBD240], v1, v10);
  }
  CFRelease(v1);
  return v5;
}

char *CaptiveAccountsATTMD5Hash(const __CFString *a1)
{
  CFIndex v2;
  char *result;
  char *v4;
  CC_LONG v5;
  unsigned __int8 md[8];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = CFStringGetLength(a1) + 1;
  result = (char *)malloc_type_malloc(v2, 0x351E99B8uLL);
  if (result)
  {
    v4 = result;
    if (CFStringGetCString(a1, result, v2, 0x8000100u))
    {
      *(_QWORD *)md = 0;
      v7 = 0;
      v5 = strlen(v4);
      CC_MD5(v4, v5, md);
      free(v4);
      return (char *)CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x"), md[0], md[1], md[2], md[3], md[4], md[5], md[6], md[7], v7, BYTE1(v7), BYTE2(v7), BYTE3(v7), BYTE4(v7), BYTE5(v7), BYTE6(v7), HIBYTE(v7));
    }
    else
    {
      free(v4);
      return 0;
    }
  }
  return result;
}

void CNAccountsSFRRejected(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  const __CFAllocator *v7;
  __CFDictionary *Mutable;
  CFStringRef v9;
  NSObject *logger;
  os_log_type_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  *a6 = 0;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9240]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE90C0], (const void *)*MEMORY[0x24BDE90C8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FC0], (const void *)*MEMORY[0x24BDE8FC8]);
  v9 = CFStringCreateWithFormat(v7, 0, CFSTR("%@-%@"), kWISPrSecurityDomain, a1);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9110], v9);
  if (v9)
    CFRelease(v9);
  SecItemDelete(Mutable);
  logger = mysyslog_get_logger();
  v11 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v11))
  {
    *(_DWORD *)buf = 138412290;
    v13 = a1;
    _os_log_impl(&dword_219EF1000, logger, v11, "Purged credentials for account %@", buf, 0xCu);
  }
  if (Mutable)
    CFRelease(Mutable);
}

void SFRHandleGetResult(uint64_t a1, int a2, const __CFDictionary *a3)
{
  const __CFString *Value;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const void *v9;
  const void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  const __CFAllocator *v19;
  __CFDictionary *Mutable;
  CFStringRef v21;
  const void *v22;
  CFDataRef ExternalRepresentation;
  CFDataRef v24;
  const void *v25;
  OSStatus v26;
  OSStatus v27;
  const __CFDictionary *v28;
  OSStatus v29;
  NSObject *v30;
  os_log_type_t v31;
  const char *v32;
  uint8_t *v33;
  NSObject *v34;
  os_log_type_t v35;
  NSObject *logger;
  os_log_type_t v37;
  NSObject *v38;
  os_log_type_t v39;
  const char *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint32_t v43;
  const __CFDictionary *v44;
  const void *v45;
  NSObject *v46;
  os_log_type_t v47;
  CFDictionaryRef v48;
  NSObject *v49;
  os_log_type_t v50;
  uint32_t v51;
  NSObject *v52;
  os_log_type_t v53;
  NSObject *v54;
  os_log_type_t v55;
  _BYTE keys[22];
  _DWORD v57[2];
  void *values[3];

  values[2] = *(void **)MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 56))
    return;
  if (a2 != 5)
    *(_QWORD *)(a1 + 56) = 0;
  Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("ResponseCodeKey"));
  v6 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("UsernameKey"));
  v7 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("PasswordKey"));
  if (Value)
    v8 = Value;
  else
    v8 = CFSTR("c_response");
  v9 = CFDictionaryGetValue(a3, v8);
  if (!v9)
  {
    logger = mysyslog_get_logger();
    v37 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v37))
    {
      *(_DWORD *)keys = 138412290;
      *(_QWORD *)&keys[4] = v8;
      _os_log_impl(&dword_219EF1000, logger, v37, "%@ missing", keys, 0xCu);
    }
    v38 = mysyslog_get_logger();
    v39 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v38, v39))
      goto LABEL_40;
    *(_WORD *)keys = 0;
    v40 = "Carrier credentials failed. Unable to parse response.";
    v41 = v38;
    v42 = v39;
    v43 = 2;
    goto LABEL_39;
  }
  v10 = v9;
  v11 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("SuccessCodeValue"));
  if (v11)
    v12 = v11;
  else
    v12 = CFSTR("1");
  if (!CFEqual(v10, v12))
  {
    v44 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("ResponseCodes"));
    if (v44)
      v45 = CFDictionaryGetValue(v44, v10);
    else
      v45 = 0;
    v46 = mysyslog_get_logger();
    v47 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v46, v47))
      goto LABEL_40;
    *(_DWORD *)keys = 138412546;
    *(_QWORD *)&keys[4] = v10;
    *(_WORD *)&keys[12] = 2112;
    *(_QWORD *)&keys[14] = v45;
    v40 = "Carrier credentials failed. Response code: %@ - %@";
    v41 = v46;
    v42 = v47;
    v43 = 22;
LABEL_39:
    _os_log_impl(&dword_219EF1000, v41, v42, v40, keys, v43);
LABEL_40:
    v14 = 0;
    v17 = 0;
    goto LABEL_41;
  }
  if (v6)
    v13 = v6;
  else
    v13 = CFSTR("m_response");
  v14 = (void *)CFDictionaryGetValue(a3, v13);
  if (v7)
    v15 = v7;
  else
    v15 = CFSTR("p_response");
  v16 = (__CFString *)CFDictionaryGetValue(a3, v15);
  v17 = v16;
  if (v14 && v16)
  {
    v18 = *(_QWORD *)(a1 + 32);
    v19 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9240]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE90C0], (const void *)*MEMORY[0x24BDE90C8]);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FC0], (const void *)*MEMORY[0x24BDE8FC8]);
    v21 = CFStringCreateWithFormat(v19, 0, CFSTR("%@-%@"), kWISPrSecurityDomain, v18);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9110], v21);
    if (v21)
      CFRelease(v21);
    SecItemDelete(Mutable);
    v22 = (const void *)*MEMORY[0x24BDE8FA8];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], v14);
    ExternalRepresentation = CFStringCreateExternalRepresentation(v19, v17, 0x8000100u, 0);
    if (!ExternalRepresentation)
    {
      v49 = mysyslog_get_logger();
      v50 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v49, v50))
        goto LABEL_54;
      *(_WORD *)keys = 0;
      v32 = "CFStringCreateExternalRepresentation failed";
      v33 = keys;
      v34 = v49;
      v35 = v50;
      v51 = 2;
      goto LABEL_53;
    }
    v24 = ExternalRepresentation;
    v25 = (const void *)*MEMORY[0x24BDE9550];
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9550], ExternalRepresentation);
    CFRelease(v24);
    v26 = SecItemAdd(Mutable, 0);
    if (v26)
    {
      v27 = v26;
      if (v26 != -25299)
      {
        v54 = mysyslog_get_logger();
        v55 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v54, v55))
          goto LABEL_54;
        *(_DWORD *)keys = 67109120;
        *(_DWORD *)&keys[4] = v27;
        v32 = "SecItemAdd failed: %d";
        v33 = keys;
        v34 = v54;
        v35 = v55;
        goto LABEL_52;
      }
      *(_QWORD *)keys = v22;
      *(_QWORD *)&keys[8] = v25;
      values[0] = (void *)CFDictionaryGetValue(Mutable, v22);
      values[1] = (void *)CFDictionaryGetValue(Mutable, v25);
      v28 = CFDictionaryCreate(v19, (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionaryRemoveValue(Mutable, v25);
      v29 = SecItemUpdate(Mutable, v28);
      if (v28)
        CFRelease(v28);
      if (v29)
      {
        v30 = mysyslog_get_logger();
        v31 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v30, v31))
          goto LABEL_54;
        v57[0] = 67109120;
        v57[1] = v29;
        v32 = "SecItemUpdate failed: %d";
        v33 = (uint8_t *)v57;
        v34 = v30;
        v35 = v31;
LABEL_52:
        v51 = 8;
LABEL_53:
        _os_log_impl(&dword_219EF1000, v34, v35, v32, v33, v51);
LABEL_54:
        if (Mutable)
          CFRelease(Mutable);
        goto LABEL_41;
      }
    }
    v52 = mysyslog_get_logger();
    v53 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v52, v53))
      goto LABEL_54;
    *(_DWORD *)keys = 138412290;
    *(_QWORD *)&keys[4] = v14;
    v32 = "added password for account %@ to keychain";
    v33 = keys;
    v34 = v52;
    v35 = v53;
    v51 = 12;
    goto LABEL_53;
  }
LABEL_41:
  if (!*(_QWORD *)(a1 + 56))
  {
    v48 = WISPrCredentialsDictionaryCreate(v14, v17);
    (*(void (**)(_QWORD, CFDictionaryRef))(a1 + 16))(*(_QWORD *)(a1 + 24), v48);
    if (v48)
      CFRelease(v48);
    SFRStateCleanup((void *)a1);
  }
}

void SFRStateCleanup(void *a1)
{
  const void *v2;
  const void *v3;
  __CFRunLoopSource *v4;
  __CFRunLoop *Current;
  const void *v6;

  v2 = (const void *)*((_QWORD *)a1 + 4);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)a1 + 4) = 0;
  }
  v3 = (const void *)*((_QWORD *)a1 + 5);
  if (v3)
  {
    CFRelease(v3);
    *((_QWORD *)a1 + 5) = 0;
  }
  v4 = (__CFRunLoopSource *)*((_QWORD *)a1 + 6);
  if (v4)
  {
    CFRunLoopSourceInvalidate(v4);
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *((CFRunLoopSourceRef *)a1 + 6), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    v6 = (const void *)*((_QWORD *)a1 + 6);
    if (v6)
    {
      CFRelease(v6);
      *((_QWORD *)a1 + 6) = 0;
    }
  }
  if (*((_QWORD *)a1 + 7))
    captive_agent_get_credentials_abort((_QWORD *)a1 + 7);
  free(a1);
}

uint64_t CNAccountsSFRValidate()
{
  return 1;
}

CFRunLoopSourceRef *CNAccountsSFRQueryStart(__CFRunLoopSource *a1, __CFRunLoopSource *a2, uint64_t a3, uint64_t a4, uint64_t a5, __CFRunLoopSource *a6, __CFRunLoopSource *a7)
{
  CFRunLoopSourceRef *v11;
  CFRunLoopSourceRef *v12;
  __CFRunLoop *Current;
  CFRunLoopSourceContext v15;

  v11 = (CFRunLoopSourceRef *)malloc_type_malloc(0x40uLL, 0xE0040C44E1B7CuLL);
  v12 = v11;
  if (v11)
  {
    v15.version = 0;
    memset(&v15.retain, 0, 56);
    v15.info = v11;
    v15.perform = (void (__cdecl *)(void *))SFRQueryDo;
    *(_OWORD *)v11 = 0u;
    *((_OWORD *)v11 + 1) = 0u;
    *((_OWORD *)v11 + 2) = 0u;
    *((_OWORD *)v11 + 3) = 0u;
    v11[1] = (CFRunLoopSourceRef)SFRQueryAbort;
    v11[2] = a6;
    v11[3] = a7;
    v11[6] = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &v15);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v12[6], (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    CFRunLoopSourceSignal(v12[6]);
    v12[4] = a1;
    CFRetain(a1);
    v12[5] = a2;
    CFRetain(a2);
  }
  return v12;
}

void SFRQueryDo(uint64_t a1)
{
  __CFRunLoop *Current;
  const void *v3;
  NSObject *logger;
  os_log_type_t v5;
  uint64_t v6;
  const __CFAllocator *v7;
  CFStringRef v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFDictionary *v13;
  OSStatus v14;
  const __CFData *Value;
  __CFString *v16;
  void *v17;
  CFDictionaryRef v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  NSObject *v23;
  os_log_type_t v24;
  CFRunLoopRef v25;
  _QWORD *credentials;
  NSObject *v27;
  os_log_type_t v28;
  const char *v29;
  CFTypeRef result;
  void *values[4];
  uint64_t v32;
  uint64_t v33;
  __int128 buf;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t v39[4];
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  CFRunLoopSourceInvalidate(*(CFRunLoopSourceRef *)(a1 + 48));
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 48), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 48) = 0;
  }
  logger = mysyslog_get_logger();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    v6 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_219EF1000, logger, v5, "querying keychain for %@", (uint8_t *)&buf, 0xCu);
  }
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@-%@"), kWISPrSecurityDomain, *(_QWORD *)(a1 + 32));
  v9 = *MEMORY[0x24BDE9110];
  *(_QWORD *)&buf = *MEMORY[0x24BDE9220];
  *((_QWORD *)&buf + 1) = v9;
  v10 = *MEMORY[0x24BDE8FC0];
  v35 = *MEMORY[0x24BDE90C0];
  v36 = v10;
  v11 = *MEMORY[0x24BDE94C0];
  v37 = *MEMORY[0x24BDE94C8];
  v38 = v11;
  values[0] = *(void **)MEMORY[0x24BDE9240];
  values[1] = (void *)v8;
  v12 = (void *)*MEMORY[0x24BDE8FC8];
  values[2] = *(void **)MEMORY[0x24BDE90C8];
  values[3] = v12;
  v32 = *MEMORY[0x24BDBD270];
  v33 = v32;
  v13 = CFDictionaryCreate(v7, (const void **)&buf, (const void **)values, 6, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v8)
    CFRelease(v8);
  result = 0;
  v14 = SecItemCopyMatching(v13, &result);
  if (v13)
    CFRelease(v13);
  if (!v14 && result)
  {
    Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x24BDE9550]);
    if (Value)
      v16 = (__CFString *)CFStringCreateFromExternalRepresentation(v7, Value, 0x8000100u);
    else
      v16 = 0;
    v17 = (void *)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x24BDE8FA8]);
    CFRetain(v17);
    if (result)
    {
      CFRelease(result);
      result = 0;
    }
    if (v17 && v16)
    {
      v18 = WISPrCredentialsDictionaryCreate(v17, v16);
      (*(void (**)(_QWORD, CFDictionaryRef))(a1 + 16))(*(_QWORD *)(a1 + 24), v18);
      SFRStateCleanup((void *)a1);
      CFRelease(v17);
      CFRelease(v16);
      if (v18)
        CFRelease(v18);
      return;
    }
    if (v17)
      CFRelease(v17);
    if (v16)
      CFRelease(v16);
  }
  v19 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("CredentialsURL"));
  if (!v19)
  {
    v27 = mysyslog_get_logger();
    v28 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v27, v28))
    {
      *(_WORD *)v39 = 0;
      v29 = "carrier account is missing CredentialsURL";
      goto LABEL_36;
    }
LABEL_37:
    (*(void (**)(_QWORD, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 24), 0);
    SFRStateCleanup((void *)a1);
    return;
  }
  v20 = v19;
  v21 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), CFSTR("ServiceType"));
  if (v21)
    v22 = v21;
  else
    v22 = (const __CFString *)*MEMORY[0x24BDC2A70];
  if (CaptiveIsDebug())
  {
    v23 = mysyslog_get_logger();
    v24 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v23, v24))
    {
      *(_DWORD *)v39 = 138412290;
      v40 = v20;
      _os_log_impl(&dword_219EF1000, v23, v24, "getting credentials from %@", v39, 0xCu);
    }
  }
  v25 = CFRunLoopGetCurrent();
  credentials = captive_agent_get_credentials(v20, v22, (uint64_t)CFSTR("CaptiveNetworkSupport-480"), 0x1Eu, (uint64_t)SFRHandleGetResult, a1, (uint64_t)v25);
  *(_QWORD *)(a1 + 56) = credentials;
  if (!credentials)
  {
    v27 = mysyslog_get_logger();
    v28 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v27, v28))
    {
      *(_WORD *)v39 = 0;
      v29 = "failed to start http GET";
LABEL_36:
      _os_log_impl(&dword_219EF1000, v27, v28, v29, v39, 2u);
      goto LABEL_37;
    }
    goto LABEL_37;
  }
}

void PowerChangeRegister(uint64_t (*a1)(_QWORD))
{
  __CFRunLoop *Current;
  IONotificationPortRef thePortRef;

  if (!S_power_connection)
  {
    thePortRef = 0;
    S_power_connection = IORegisterForSystemPower(0, &thePortRef, (IOServiceInterestCallback)power_changed, (io_object_t *)&S_power_notifier);
    if (S_power_connection)
    {
      S_power_rls = (uint64_t)IONotificationPortGetRunLoopSource(thePortRef);
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, (CFRunLoopSourceRef)S_power_rls, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      if (S_power_connection)
      {
        S_awake = 1;
        S_callback_0 = a1;
      }
    }
  }
}

void PowerChangeDeregister()
{
  __CFRunLoop *Current;

  if (S_power_connection)
  {
    if (S_power_rls)
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, (CFRunLoopSourceRef)S_power_rls, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      S_power_rls = 0;
    }
    if (S_power_notifier)
    {
      IODeregisterForSystemPower((io_object_t *)&S_power_notifier);
      S_power_notifier = 0;
    }
    if (S_power_connection)
    {
      IOServiceClose(S_power_connection);
      S_power_connection = 0;
    }
    S_callback_0 = 0;
    S_awake = 0;
  }
}

uint64_t power_changed(int a1, int a2, int a3, intptr_t notificationID)
{
  uint64_t result;

  if (a3 == -536870288)
    return IOAllowPowerChange(S_power_connection, notificationID);
  if (a3 == -536870112)
  {
    if ((S_awake & 1) == 0)
    {
      S_awake = 1;
      if (S_callback_0)
        return S_callback_0(1);
    }
  }
  else if (a3 == -536870272 && S_awake == 1)
  {
    S_awake = 0;
    if (S_callback_0)
      S_callback_0(0);
    return IOAllowPowerChange(S_power_connection, notificationID);
  }
  return result;
}

const __SCPreferences *CaptivePrefsInit(__CFRunLoop *a1, uint64_t (*a2)(void))
{
  const __SCPreferences *result;
  const __CFString *v5;
  CFRunLoopSourceContext v6;

  result = SCPreferencesCreate(0, CFSTR("CaptivePrefs"), CFSTR("com.apple.captive.control.plist"));
  S_prefs = (uint64_t)result;
  if (a1)
  {
    if (a2)
    {
      S_callback_1 = a2;
      SCPreferencesSetCallback(result, (SCPreferencesCallBack)CaptivePrefsChanged, 0);
      v5 = (const __CFString *)*MEMORY[0x24BDBD598];
      SCPreferencesScheduleWithRunLoop((SCPreferencesRef)S_prefs, a1, (CFStringRef)*MEMORY[0x24BDBD598]);
      memset(&v6, 0, 72);
      v6.perform = (void (__cdecl *)(void *))prefs_changed_0;
      S_source = (uint64_t)CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &v6);
      CFRunLoopAddSource(a1, (CFRunLoopSourceRef)S_source, v5);
      dispatch_get_global_queue(0, 0);
      result = (const __SCPreferences *)_scprefs_observer_watch();
      S_prefs_observer = (uint64_t)result;
      S_runloop = (uint64_t)a1;
    }
  }
  return result;
}

uint64_t (*CaptivePrefsChanged())(void)
{
  uint64_t (*result)(void);

  result = S_callback_1;
  if (S_callback_1)
    return (uint64_t (*)(void))S_callback_1();
  return result;
}

void CaptivePrefsRefresh()
{
  if (S_prefs)
    SCPreferencesSynchronize((SCPreferencesRef)S_prefs);
  if (S_managed_prefs)
    SCPreferencesSynchronize((SCPreferencesRef)S_managed_prefs);
}

uint64_t CaptivePrefsSave()
{
  uint64_t result;
  uint64_t v1;

  result = S_prefs;
  if (S_prefs)
  {
    v1 = SCPreferencesCommitChanges((SCPreferencesRef)S_prefs);
    SCPreferencesSynchronize((SCPreferencesRef)S_prefs);
    return v1;
  }
  return result;
}

uint64_t CaptivePrefsIsActive()
{
  return CaptivePrefsGetBoolean(CFSTR("Active"), 1);
}

uint64_t CaptivePrefsGetBoolean(const __CFString *a1, uint64_t a2)
{
  const __SCPreferences *v4;
  uint64_t result;
  const __SCPreferences *v6;
  char v7;

  v7 = 0;
  v4 = (const __SCPreferences *)S_managed_prefs;
  if (!S_managed_prefs)
  {
    v4 = SCPreferencesCreate(0, CFSTR("CaptivePrefs"), CFSTR("/Library/Managed Preferences/mobile/com.apple.captive.control.plist"));
    S_managed_prefs = (uint64_t)v4;
  }
  result = prefs_common_get_BOOLean(v4, a1, a2, &v7);
  if (!v7)
  {
    v6 = (const __SCPreferences *)S_prefs;
    if (!S_prefs)
    {
      v6 = SCPreferencesCreate(0, CFSTR("CaptivePrefs"), CFSTR("com.apple.captive.control.plist"));
      S_prefs = (uint64_t)v6;
    }
    return prefs_common_get_BOOLean(v6, a1, a2, 0);
  }
  return result;
}

uint64_t CaptivePrefsIsDebug()
{
  return CaptivePrefsGetBoolean(CFSTR("Debug"), 0);
}

uint64_t CaptivePrefsIsVerbose()
{
  return CaptivePrefsGetBoolean(CFSTR("Verbose"), 0);
}

const __SCPreferences *CaptivePrefsSetActive(int a1)
{
  CFPropertyListRef *v1;

  v1 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a1)
    v1 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  return prefs_set_value(CFSTR("Active"), *v1);
}

const __SCPreferences *CaptivePrefsSetBoolean(const __CFString *a1, int a2)
{
  CFPropertyListRef *v2;

  v2 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a2)
    v2 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  return prefs_set_value(a1, *v2);
}

const __SCPreferences *CaptivePrefsSetDebug(int a1)
{
  CFPropertyListRef *v1;

  v1 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a1)
    v1 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  return prefs_set_value(CFSTR("Debug"), *v1);
}

const __SCPreferences *CaptivePrefsSetVerbose(int a1)
{
  CFPropertyListRef *v1;

  v1 = (CFPropertyListRef *)MEMORY[0x24BDBD270];
  if (!a1)
    v1 = (CFPropertyListRef *)MEMORY[0x24BDBD268];
  return prefs_set_value(CFSTR("Verbose"), *v1);
}

const __SCPreferences *CaptivePrefsUnset(CFStringRef key)
{
  const __SCPreferences *result;

  result = (const __SCPreferences *)S_prefs;
  if (S_prefs)
    return (const __SCPreferences *)SCPreferencesRemoveValue(result, key);
  result = SCPreferencesCreate(0, CFSTR("CaptivePrefs"), CFSTR("com.apple.captive.control.plist"));
  S_prefs = (uint64_t)result;
  if (result)
    return (const __SCPreferences *)SCPreferencesRemoveValue(result, key);
  return result;
}

uint64_t CaptivePrefsGetNumber(CFStringRef key, void *a2)
{
  const __SCPreferences *v4;
  const __CFNumber *Value;
  CFTypeID TypeID;

  v4 = (const __SCPreferences *)S_prefs;
  if ((S_prefs
     || (v4 = SCPreferencesCreate(0, CFSTR("CaptivePrefs"), CFSTR("com.apple.captive.control.plist")),
         (S_prefs = (uint64_t)v4) != 0))
    && (Value = (const __CFNumber *)SCPreferencesGetValue(v4, key), TypeID = CFNumberGetTypeID(), Value)
    && CFGetTypeID(Value) == TypeID)
  {
    return CFNumberGetValue(Value, kCFNumberDoubleType, a2);
  }
  else
  {
    return 0;
  }
}

void CaptivePrefsSetNumber(const __CFString *a1, double a2)
{
  CFNumberRef v3;
  double valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberDoubleType, &valuePtr);
  prefs_set_value(a1, v3);
  CFRelease(v3);
}

const __SCPreferences *prefs_set_value(CFStringRef key, CFPropertyListRef value)
{
  const __SCPreferences *result;

  result = (const __SCPreferences *)S_prefs;
  if (S_prefs)
    return (const __SCPreferences *)SCPreferencesSetValue(result, key, value);
  result = SCPreferencesCreate(0, CFSTR("CaptivePrefs"), CFSTR("com.apple.captive.control.plist"));
  S_prefs = (uint64_t)result;
  if (result)
    return (const __SCPreferences *)SCPreferencesSetValue(result, key, value);
  return result;
}

uint64_t prefs_common_get_BOOLean(const __SCPreferences *a1, const __CFString *a2, uint64_t a3, _BYTE *a4)
{
  CFPropertyListRef Value;
  CFTypeID TypeID;

  if (a4)
    *a4 = 0;
  if (!a1)
    return a3;
  Value = SCPreferencesGetValue(a1, a2);
  TypeID = CFBooleanGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
    return a3;
  if (a4)
    *a4 = 1;
  return CFBooleanGetValue((CFBooleanRef)Value);
}

uint64_t (*prefs_changed_0())(void)
{
  uint64_t (*result)(void);

  result = S_callback_1;
  if (S_callback_1)
    return (uint64_t (*)(void))S_callback_1();
  return result;
}

void __enable_prefs_observer_block_invoke()
{
  if (S_source)
  {
    CFRunLoopSourceSignal((CFRunLoopSourceRef)S_source);
    if (S_runloop)
      CFRunLoopWakeUp((CFRunLoopRef)S_runloop);
  }
}

uint64_t CNPluginHandleResponse(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t result;
  const void *v5;
  uint64_t *v6;
  _QWORD *v7;
  uint64_t *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  int v15;
  int v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *logger;
  os_log_type_t v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint32_t v24;
  void *Value;
  CFTypeID TypeID;
  __CFString *BSDName;
  NSObject *v28;
  os_log_type_t v29;
  _QWORD v30[2];
  uint8_t buf[4];
  uint64_t DisplayID;
  __int16 v33;
  const __CFDictionary *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  result = (uint64_t)CNPluginStateProcessResponse(a1, a2);
  if (result)
  {
    v5 = (const void *)result;
    v6 = &S_CNInfoHeadStorage;
    while (1)
    {
      v6 = (uint64_t *)*v6;
      if (!v6)
        break;
      if (my_CFDictionaryContainsKeyAndValue((const __CFDictionary *)v6[8], v5))
      {
        v7 = v6 + 8;
        v8 = v6 + 8;
        goto LABEL_10;
      }
      if (my_CFDictionaryContainsKeyAndValue((const __CFDictionary *)v6[14], v5))
      {
        v7 = v6 + 8;
        v8 = v6 + 14;
LABEL_10:
        v11 = *v8;
        if (v11 == *v7)
        {
          v30[0] = a1;
          v30[1] = a2;
          switch(*((_DWORD *)v6 + 14))
          {
            case 2:
              CNInfoEvaluating((uint64_t)v6, 1, (uint64_t)v30);
              break;
            case 3:
              CNInfoAuthenticating((uint64_t)v6, 1, (uint64_t)v30);
              break;
            case 5:
              CNInfoMaintaining((uint64_t)v6, 1, (uint64_t)v30);
              break;
            case 7:
              CNInfoPresentingUI((uint64_t)v6, 1, (uint64_t)v30);
              break;
            case 8:
              CNInfoLoggingOff((uint64_t)v6, 1);
              break;
            default:
              logger = mysyslog_get_logger();
              v20 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(logger, v20))
              {
                *(_DWORD *)buf = 138412546;
                DisplayID = CNPluginStateGetDisplayID(a1);
                v33 = 2112;
                v34 = a2;
                v21 = "%@: ignoring response %@";
                v22 = logger;
                v23 = v20;
                v24 = 22;
                goto LABEL_35;
              }
              break;
          }
        }
        else if (v11 == v6[14])
        {
          v12 = CNPluginStateGetDisplayID(a1);
          v13 = mysyslog_get_logger();
          v14 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v13, v14))
          {
            *(_DWORD *)buf = 138412546;
            DisplayID = v12;
            v33 = 2112;
            v34 = a2;
            _os_log_impl(&dword_219EF1000, v13, v14, "%@: filter results = %@", buf, 0x16u);
          }
          if (S_filter_request_count)
          {
            v15 = responseGetResult(a2);
            if (v15)
            {
              v16 = v15;
              v17 = mysyslog_get_logger();
              v18 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v17, v18))
              {
                *(_DWORD *)buf = 138412290;
                DisplayID = v12;
                _os_log_impl(&dword_219EF1000, v17, v18, "%@: FilterScanList failed", buf, 0xCu);
              }
              if (v16 == 3)
                CNPluginStateDisableFilterCommand(a1);
            }
            else
            {
              Value = (void *)CFDictionaryGetValue(a2, CFSTR("NetworkList"));
              TypeID = CFArrayGetTypeID();
              if (Value && CFGetTypeID(Value) == TypeID)
              {
                BSDName = (__CFString *)SCNetworkInterfaceGetBSDName((SCNetworkInterfaceRef)v6[4]);
                CNPluginStateSetFilterResults(a1, BSDName, Value);
                CNScanListFilterAggregateResults((uint64_t)v6);
              }
              else
              {
                v28 = mysyslog_get_logger();
                v29 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v28, v29))
                {
                  *(_DWORD *)buf = 138412290;
                  DisplayID = v12;
                  v21 = "%@: FilterScanList network list invalid";
                  v22 = v28;
                  v23 = v29;
                  v24 = 12;
LABEL_35:
                  _os_log_impl(&dword_219EF1000, v22, v23, v21, buf, v24);
                }
              }
            }
          }
        }
        return 1;
      }
    }
    v9 = mysyslog_get_logger();
    v10 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(v9, (os_log_type_t)v10);
    if ((_DWORD)result)
    {
      *(_DWORD *)buf = 138412290;
      DisplayID = (uint64_t)a2;
      _os_log_impl(&dword_219EF1000, v9, (os_log_type_t)v10, "can't find cninfo for %@", buf, 0xCu);
      return 0;
    }
  }
  return result;
}

void CNBuiltinPluginProvideResponse(const void *a1)
{
  if (S_builtin_plugin)
    CNPluginStateBuiltinProvideResponse(S_builtin_plugin, a1);
}

void CNBuiltinPluginAckEvaluateCommand(const void *a1)
{
  if (S_builtin_plugin)
    CNPluginStateBuiltinAckEvaluateCommand(S_builtin_plugin, a1);
}

__CFArray *CNPluginHandlerCopyInterfaceList()
{
  uint64_t v0;
  __CFArray *Mutable;
  const CFArrayCallBacks *v2;
  CFStringRef BSDName;

  v0 = S_CNInfoHeadStorage;
  if (!S_CNInfoHeadStorage)
    return 0;
  Mutable = 0;
  v2 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
  do
  {
    if (!Mutable)
      Mutable = CFArrayCreateMutable(0, 0, v2);
    BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(v0 + 32));
    CFArrayAppendValue(Mutable, BSDName);
    v0 = *(_QWORD *)v0;
  }
  while (v0);
  return Mutable;
}

_QWORD *CNPluginHandlerForgetSSID()
{
  uint64_t i;
  _QWORD *result;

  for (i = S_CNInfoHeadStorage; i; i = *(_QWORD *)i)
    result = NetCacheApplyFunction(*(_QWORD ***)(i + 136), (uint64_t (*)(void))RemoveCacheEntryWithSSID);
  return result;
}

uint64_t RemoveCacheEntryWithSSID(uint64_t *a1, const void *a2)
{
  const void *Name;
  uint64_t result;

  Name = (const void *)CNPluginStateGetName((uint64_t)a1);
  result = 0;
  if (a2 && Name)
  {
    if (CFEqual(a2, Name))
      NetCacheEntryDestroy(a1);
    return 1;
  }
  return result;
}

void *CNPluginHandlerInitialize(uint64_t a1)
{
  const char *notify_key;
  __CFRunLoopSource *v3;
  int v5;
  CFTypeRef cf;

  cf = 0;
  v5 = 0;
  CommandHandlerClassRegister(3u, (uint64_t)CNPluginHandlerMethods);
  CommandHandlerClassRegister(5u, (uint64_t)CNScanListFilterHandlerMethods);
  CNPluginStateListInitialize();
  S_CNInfoHeadStorage = 0;
  CNPluginMonitorHandlerInitialize();
  notify_key = (const char *)nwi_state_get_notify_key();
  v3 = my_CFRunLoopSourceCreateForBSDNotification(notify_key, (uint64_t)CNPluginHandlerNWIChanged, 0, &v5, (__CFMachPort **)&cf);
  if (cf)
    CFRelease(cf);
  if (v3)
    CFRelease(v3);
  S_builtin_plugin = CNPluginStateBuiltinRegister(a1);
  NetIFSetNewInterfaceCallBack((uint64_t)CNPluginHandlerInterfaceAttached);
  NetIFSetWiFiManagerRestartCallBack(CNPluginHandlerWiFiManagerRestart);
  NetIFCheckForNewInterfaces();
  return NetIFSetScanResultsCallBack(CNScanListFilterHandleScanResults);
}

void CNPluginHandlerNWIChanged()
{
  NSObject *logger;
  os_log_type_t v1;
  uint8_t v2[16];

  logger = mysyslog_get_logger();
  v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_219EF1000, logger, v1, "network information changed", v2, 2u);
  }
  CNPluginHandlerNetworkInformationChanged();
}

void CNPluginHandlerInterfaceAttached(__CFString *a1)
{
  const __SCNetworkInterface **v2;
  const __SCNetworkInterface **v3;
  NSObject *logger;
  os_log_type_t v5;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!CNInfoFind(a1))
  {
    v2 = (const __SCNetworkInterface **)CNInfoGet(a1);
    if (v2)
    {
      v3 = v2;
      logger = mysyslog_get_logger();
      v5 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v5))
      {
        v8 = 138412290;
        v9 = a1;
        _os_log_impl(&dword_219EF1000, logger, v5, "%@ added", (uint8_t *)&v8, 0xCu);
      }
      UIAllowedNewInterface((void (__cdecl *)(const void *))a1);
      if (!NetIFWiFiNetworkIsProtectedForInterface((uint64_t)a1))
      {
        v6 = mysyslog_get_logger();
        v7 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v6, v7))
        {
          v8 = 138412290;
          v9 = a1;
          _os_log_impl(&dword_219EF1000, v6, v7, "%@: joined unsecure network, setting interface rank to Never", (uint8_t *)&v8, 0xCu);
        }
        NetIFSetRankNever(v3[4]);
      }
      CNPluginHandlerNetworkInformationChanged();
    }
  }
}

void CNScanListFilterHandleScanResults(const __CFString *a1, const __CFArray *a2)
{
  void *v4;
  uint64_t v5;
  double Current;
  double v7;
  int v8;
  double v9;
  double v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t Count;
  const __CFAllocator *v18;
  __CFArray *Mutable;
  CFIndex i;
  const void *ValueAtIndex;
  CFDictionaryRef v22;
  CFStringRef v23;
  CFNumberRef v24;
  CFDictionaryRef v25;
  NSObject *v26;
  os_log_type_t v27;
  NSObject *logger;
  os_log_type_t v29;
  int valuePtr;
  void *keys[4];
  __int128 v32;
  __int128 v33;
  void *values[5];

  values[4] = *(void **)MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if (S_filter_request_count)
    {
      v4 = CNInfoGet(a1);
      if (v4)
      {
        v5 = (uint64_t)v4;
        if (!CNPluginStateListShouldSendFilterCommand())
        {
          CNInfoFlushFilterCommand(v5);
          CNPluginStateListApplyFunction((uint64_t)CNScanListFilterFlushResultsApplier, (uint64_t)a1);
          *(_DWORD *)(v5 + 128) = 0;
          logger = mysyslog_get_logger();
          v29 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(logger, v29))
            return;
          LOWORD(keys[0]) = 0;
          v13 = "No plugins can handle FilterScanList command";
          v14 = logger;
          v15 = v29;
          v16 = 2;
          goto LABEL_30;
        }
        Current = CFAbsoluteTimeGetCurrent();
        v7 = Current;
        v8 = *(_DWORD *)(v5 + 128);
        if (v8)
        {
          v9 = Current - *(double *)(v5 + 120);
          v10 = v8 >= 3 ? 30.0 : 5.0;
          if (v9 < v10)
          {
            v11 = mysyslog_get_logger();
            v12 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v11, v12))
              return;
            LODWORD(keys[0]) = 138412802;
            *(void **)((char *)keys + 4) = (void *)a1;
            WORD2(keys[1]) = 2048;
            *(void **)((char *)&keys[1] + 6) = *(void **)&v9;
            HIWORD(keys[2]) = 2048;
            keys[3] = *(void **)&v10;
            v13 = "%@: NOT issuing filter command (elapsed %g < %g)";
            v14 = v11;
            v15 = v12;
            v16 = 32;
LABEL_30:
            _os_log_impl(&dword_219EF1000, v14, v15, v13, (uint8_t *)keys, v16);
            return;
          }
        }
        Count = CFArrayGetCount(a2);
        v18 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], Count, MEMORY[0x24BDBD690]);
        if (Count >= 1)
        {
          for (i = 0; i != Count; ++i)
          {
            v32 = 0u;
            v33 = 0u;
            memset(keys, 0, sizeof(keys));
            ValueAtIndex = CFArrayGetValueAtIndex(a2, i);
            networkAttributesInit(keys, ValueAtIndex, 0, 0);
            v22 = copy_network_dict((uint64_t *)keys);
            networkAttributesRelease((uint64_t)keys);
            if (v22)
            {
              CFArrayAppendValue(Mutable, v22);
              CFRelease(v22);
            }
          }
        }
        if (CFArrayGetCount(Mutable))
        {
          valuePtr = 1;
          if (!Mutable)
            return;
          v23 = my_CFUUIDStringCreate(0);
          keys[0] = CFSTR("UniqueID");
          values[0] = (void *)v23;
          v24 = CFNumberCreate(v18, kCFNumberSInt32Type, &valuePtr);
          keys[1] = CFSTR("Type");
          keys[2] = CFSTR("InterfaceName");
          values[1] = v24;
          values[2] = (void *)a1;
          keys[3] = CFSTR("NetworkList");
          values[3] = Mutable;
          v25 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          if (v23)
            CFRelease(v23);
          if (v24)
            CFRelease(v24);
          if (v25)
          {
            ++*(_DWORD *)(v5 + 128);
            *(double *)(v5 + 120) = v7;
            CNInfoFlushFilterCommand(v5);
            CNPluginStateListApplyFunction((uint64_t)CNScanListFilterFlushResultsApplier, (uint64_t)a1);
            my_FieldSetRetainedCFType((const void **)(v5 + 112), v25);
            v26 = mysyslog_get_logger();
            v27 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v26, v27))
            {
              LODWORD(keys[0]) = 138412290;
              *(void **)((char *)keys + 4) = (void *)a1;
              _os_log_impl(&dword_219EF1000, v26, v27, "%@: issuing filter command", (uint8_t *)keys, 0xCu);
            }
            CNPluginStateListIssueFilterCommand((uint64_t)v25);
            CFRelease(v25);
            if (!CNPluginStateListShouldSendFilterCommand())
              CNScanListFilterSendClearResults(v5);
          }
        }
        else if (!Mutable)
        {
          return;
        }
        CFRelease(Mutable);
      }
    }
  }
}

uint64_t CNPluginHandlerGetLandingPageURL(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t *CacheEntry;
  uint64_t result;

  v1 = (_QWORD *)S_CNInfoHeadStorage;
  if (!S_CNInfoHeadStorage)
    return 0;
  while (1)
  {
    CacheEntry = CNInfoGetCacheEntry((uint64_t)v1);
    if (CacheEntry)
    {
      result = NetCacheEntryGetRedirectionURL((uint64_t)CacheEntry, a1);
      if (result)
        break;
    }
    v1 = (_QWORD *)*v1;
    if (!v1)
      return 0;
  }
  return result;
}

uint64_t *CNInfoGetCacheEntry(uint64_t a1)
{
  const void *SSID;
  uint64_t **v3;
  double Current;

  if (*(_QWORD *)(a1 + 40))
    SSID = (const void *)WiFiNetworkGetSSID();
  else
    SSID = 0;
  v3 = *(uint64_t ***)(a1 + 136);
  Current = CFAbsoluteTimeGetCurrent();
  return NetCacheLookupEntry(v3, *(const __CFArray **)(a1 + 48), SSID, Current);
}

BOOL CNPluginHandlerIsHandledInterface(const void *a1)
{
  return CNInfoFind(a1) != 0;
}

uint64_t *CNInfoFind(const void *a1)
{
  uint64_t *v2;
  CFStringRef BSDName;

  v2 = &S_CNInfoHeadStorage;
  do
  {
    v2 = (uint64_t *)*v2;
    if (!v2)
      break;
    BSDName = SCNetworkInterfaceGetBSDName((SCNetworkInterfaceRef)v2[4]);
  }
  while (!CFEqual(a1, BSDName));
  return v2;
}

void CNPluginHandlerCheckPreferences()
{
  NSObject *logger;
  os_log_type_t v1;
  NSObject *v2;
  os_log_type_t v3;
  NSObject *v4;
  os_log_type_t v5;
  const char *v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  BBMonitorCheckPreferences();
  S_UnwhitelistedNetworkProbeInterval = CCPGetUnwhitelistedNetworkProbeInterval();
  S_WhitelistedNetworkProbeInterval = CCPGetWhitelistedNetworkProbeInterval();
  logger = mysyslog_get_logger();
  v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    v10 = 134217984;
    v11 = S_UnwhitelistedNetworkProbeInterval;
    _os_log_impl(&dword_219EF1000, logger, v1, "UnwhitelistedNetworkProbeInterval = %g", (uint8_t *)&v10, 0xCu);
  }
  v2 = mysyslog_get_logger();
  v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v2, v3))
  {
    v10 = 134217984;
    v11 = S_WhitelistedNetworkProbeInterval;
    _os_log_impl(&dword_219EF1000, v2, v3, "WhitelistedNetworkProbeInterval = %g", (uint8_t *)&v10, 0xCu);
  }
  S_WhitelistedNetworkDetectionEnabled = CCPGetWhitelistedNetworkDetectionEnabled();
  S_WhitelistedProtectedNetworkDetectionEnabled = CCPGetWhitelistedProtectedNetworkDetectionEnabled();
  v4 = mysyslog_get_logger();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    if (S_WhitelistedNetworkDetectionEnabled)
      v6 = "on";
    else
      v6 = "off";
    v10 = 136315138;
    v11 = (uint64_t)v6;
    _os_log_impl(&dword_219EF1000, v4, v5, "WhitelistedNetworkDetectionEnabled = %s", (uint8_t *)&v10, 0xCu);
  }
  v7 = mysyslog_get_logger();
  v8 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v7, v8))
  {
    if (S_WhitelistedProtectedNetworkDetectionEnabled)
      v9 = "on";
    else
      v9 = "off";
    v10 = 136315138;
    v11 = (uint64_t)v9;
    _os_log_impl(&dword_219EF1000, v7, v8, "WhitelistedProtectedNetworkDetectionEnabled = %s", (uint8_t *)&v10, 0xCu);
  }
}

CFDictionaryRef CNPluginHandlerCopyCurrentNetworkInfo(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  void *Property;
  void *SSIDData;
  void *SSID;
  CFDictionaryRef v6;
  void *v7;
  void *values[3];
  void *keys[4];

  keys[3] = *(void **)MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v1 = NetIFCopyCurrentWiFiNetwork(a1);
  if (!v1)
    return 0;
  v2 = (const void *)v1;
  Property = (void *)WiFiNetworkGetProperty();
  SSIDData = (void *)WiFiNetworkGetSSIDData();
  SSID = (void *)WiFiNetworkGetSSID();
  v6 = 0;
  if (SSIDData && SSID && Property)
  {
    v7 = (void *)*MEMORY[0x24BDF5980];
    keys[0] = *(void **)MEMORY[0x24BDF5988];
    keys[1] = v7;
    keys[2] = *(void **)MEMORY[0x24BDF5978];
    values[0] = SSIDData;
    values[1] = SSID;
    values[2] = Property;
    v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  }
  CFRelease(v2);
  return v6;
}

void CNInfoEvaluating(uint64_t a1, int a2, uint64_t a3)
{
  CFStringRef BSDName;
  uint64_t *CacheEntry;
  uint64_t *v7;
  void *DisplayID;
  const void *Value;
  unsigned int Result;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  void *SSID;
  CFRunLoopTimerRef *v16;
  double v17;
  __CFRunLoopTimer *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  NSObject *v25;
  os_log_type_t v26;
  const void *v27;
  CFTypeID TypeID;
  const void *v29;
  CFTypeID v30;
  const void *v31;
  unsigned int Confidence;
  const __CFNumber *v33;
  CFTypeID v34;
  CFTypeID v35;
  NSObject *v36;
  os_log_type_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  os_log_type_t v43;
  __CFString *v44;
  CFDictionaryRef AuthCommand;
  unsigned int v46;
  NSObject *logger;
  int v48;
  NSObject *v49;
  os_log_type_t v50;
  int v51;
  int v52;
  NSObject *v53;
  os_log_type_t v54;
  const char *v55;
  NSObject *v56;
  os_log_type_t v57;
  CFStringRef v58;
  uint64_t v59;
  __CFRunLoop *Current;
  const void *v61;
  __CFRunLoop *v62;
  NSObject *v63;
  os_log_type_t v64;
  CFStringRef v65;
  uint64_t v66;
  NSObject *v67;
  os_log_type_t v68;
  const char *String;
  const char *v70;
  _BOOL4 HasNeverBeenCaptive;
  NSObject *v72;
  os_log_type_t v73;
  void *v74;
  uint8_t v75[16];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __CFString buf;
  uint64_t v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  switch(a2)
  {
    case 0:
      CNInfoSetAuthState(a1, 2);
      PassiveDetectSetCallBack(0, 0);
      TimerCancel(*(_QWORD *)(a1 + 88));
      my_FieldSetRetainedCFType((const void **)(a1 + 72), 0);
      *(_DWORD *)(a1 + 80) = 0;
      CNInfoFlushAuthCommand(a1);
      *(_DWORD *)(a1 + 104) &= ~1u;
      networkAttributesInit(&v76, *(CFTypeRef *)(a1 + 40), 1, 0);
      if (a3)
        *((_QWORD *)&v76 + 1) = *(_QWORD *)a3;
      if ((_QWORD)v78)
      {
        if (NetIFGetWiFiNetworkWasCaptive(v78))
          *(_QWORD *)&v77 = *MEMORY[0x24BDBD270];
        BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
        *((_QWORD *)&v79 + 1) = networkCopyCaptivePortalAPIURL((uint64_t)BSDName);
      }
      CacheEntry = CNInfoGetCacheEntry(a1);
      if (CacheEntry)
      {
        v7 = CacheEntry;
        if (NetCacheEntryGetIsCaptive((uint64_t)CacheEntry))
          NetCacheEntryDestroy(v7);
        else
          *((_QWORD *)&v77 + 1) = *MEMORY[0x24BDBD270];
      }
      v44 = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      AuthCommand = createAuthCommand(v44, 2, (uint64_t *)&v76);
      networkAttributesRelease((uint64_t)&v76);
      my_FieldSetRetainedCFType((const void **)(a1 + 64), AuthCommand);
      v46 = CNPluginStateListIssueEvaluateCommand((uint64_t)AuthCommand, *(CFArrayRef *)(a1 + 96));
      CFRelease(AuthCommand);
      if (v46)
      {
        v16 = *(CFRunLoopTimerRef **)(a1 + 88);
        v17 = 5.0;
        v18 = (__CFRunLoopTimer *)a1;
        v19 = 3;
        goto LABEL_55;
      }
      buf.info = (uint64_t)CFSTR("Evaluate command has no recipients");
      buf.isa = (void *)1;
      logger = mysyslog_get_logger();
      v48 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, (os_log_type_t)v48))
      {
        *(_WORD *)v75 = 0;
        _os_log_impl(&dword_219EF1000, logger, (os_log_type_t)v48, "Evaluate command has no recipients", v75, 2u);
      }
      CNInfoFailure(a1, &buf);
      return;
    case 1:
      DisplayID = (void *)CNPluginStateGetDisplayID(*(_QWORD *)a3);
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), CFSTR("RedirectHostname"));
      if (Value)
        PassiveDetectSetRedirectURLHostname(Value);
      Result = responseGetResult(*(const __CFDictionary **)(a3 + 8));
      CNPluginStateSetEvaluateCommandStatus(*(_QWORD *)a3, 1);
      if (Result)
      {
        v11 = mysyslog_get_logger();
        v12 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v11, v12))
        {
          LODWORD(buf.isa) = 138412802;
          *(void **)((char *)&buf.isa + 4) = DisplayID;
          WORD2(buf.info) = 2080;
          *(uint64_t *)((char *)&buf.info + 6) = (uint64_t)CNPResultGetString(Result);
          HIWORD(buf.data) = 1024;
          LODWORD(buf.length) = Result;
          _os_log_impl(&dword_219EF1000, v11, v12, "%@: Evaluate result is %s (%d)", (uint8_t *)&buf, 0x1Cu);
        }
        if (NetIFWiFiNetworkIsCarPlayAndInternet())
        {
          v13 = mysyslog_get_logger();
          v14 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v13, v14))
          {
            SSID = *(void **)(a1 + 40);
            if (SSID)
              SSID = (void *)WiFiNetworkGetSSID();
            LODWORD(buf.isa) = 138412290;
            *(void **)((char *)&buf.isa + 4) = SSID;
            _os_log_impl(&dword_219EF1000, v13, v14, "continuing to evaluate CarPlay Wi-Fi %@", (uint8_t *)&buf, 0xCu);
          }
          v16 = *(CFRunLoopTimerRef **)(a1 + 88);
          v17 = 300.0;
          v18 = (__CFRunLoopTimer *)a1;
          v19 = 0;
          goto LABEL_55;
        }
        *(_DWORD *)(a1 + 104) |= 1u;
        if (*(_DWORD *)(a1 + 232) == 1)
        {
          *(_DWORD *)(a1 + 232) = 3;
          v49 = mysyslog_get_logger();
          v50 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v49, v50))
          {
            LODWORD(buf.isa) = 138412290;
            *(void **)((char *)&buf.isa + 4) = DisplayID;
            _os_log_impl(&dword_219EF1000, v49, v50, "%@: Evaluation with IPv6 Only configuration failed", (uint8_t *)&buf, 0xCu);
          }
          v51 = *(_DWORD *)(a1 + 104);
          if ((v51 & 2) != 0)
          {
            *(_DWORD *)(a1 + 104) = v51 & 0xFFFFFFFD;
            Current = CFRunLoopGetCurrent();
            v61 = (const void *)*MEMORY[0x24BDBD5A0];
            buf.isa = (void *)MEMORY[0x24BDAC760];
            buf.info = 0x40000000;
            buf.data = (char *)___handleIPv6OnlyEvaluationFailure_block_invoke;
            buf.length = (uint64_t)&__block_descriptor_tmp_4;
            v81 = a1;
            CFRunLoopPerformBlock(Current, v61, &buf);
            v62 = CFRunLoopGetCurrent();
            CFRunLoopWakeUp(v62);
          }
          else
          {
            CNInfoInactive(a1);
          }
          return;
        }
        goto LABEL_64;
      }
      v27 = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), CFSTR("Network"));
      TypeID = CFDictionaryGetTypeID();
      if (!v27
        || CFGetTypeID(v27) != TypeID
        || (v29 = CFDictionaryGetValue((CFDictionaryRef)v27, CFSTR("IsCaptive")), v30 = CFBooleanGetTypeID(), !v29)
        || CFGetTypeID(v29) != v30
        || !CFBooleanGetValue((CFBooleanRef)v29))
      {
        v42 = mysyslog_get_logger();
        v43 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v42, v43))
        {
          LODWORD(buf.isa) = 138412290;
          *(void **)((char *)&buf.isa + 4) = DisplayID;
          _os_log_impl(&dword_219EF1000, v42, v43, "%@: network is not captive", (uint8_t *)&buf, 0xCu);
        }
        if (CNPluginStateIsBuiltin(*(_QWORD *)a3) == 1)
          postNonCaptiveAnalyticsEvent(a1);
LABEL_64:
        Confidence = 0;
        goto LABEL_65;
      }
      NetIFSetRankNever(*(const __SCNetworkInterface **)(a1 + 32));
      v31 = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), CFSTR("Network"));
      Confidence = networkGetConfidence(v31, (uint64_t)DisplayID);
      v33 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), CFSTR("Network"));
      v34 = CFDictionaryGetTypeID();
      if (v33)
      {
        if (CFGetTypeID(v33) == v34
          && (v33 = (const __CFNumber *)CFDictionaryGetValue(v33, CFSTR("DetectionType")),
              LODWORD(buf.isa) = 0,
              v35 = CFNumberGetTypeID(),
              v33)
          && CFGetTypeID(v33) == v35)
        {
          CFNumberGetValue(v33, kCFNumberSInt32Type, &buf);
          LODWORD(v33) = buf.isa;
          if (LODWORD(buf.isa) >= 4)
          {
            v36 = mysyslog_get_logger();
            v37 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v36, v37))
            {
              LODWORD(buf.isa) = 138412546;
              *(void **)((char *)&buf.isa + 4) = DisplayID;
              WORD2(buf.info) = 1024;
              *(_DWORD *)((char *)&buf.info + 6) = (_DWORD)v33;
              _os_log_impl(&dword_219EF1000, v36, v37, "%@: invalid captive detection type value %d treating as None", (uint8_t *)&buf, 0x12u);
            }
          }
        }
        else
        {
          LODWORD(v33) = 0;
        }
      }
      v67 = mysyslog_get_logger();
      v68 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v67, v68))
      {
        String = CNPConfidenceGetString(Confidence);
        v70 = CNPCaptiveDetectionTypeGetString(v33);
        LODWORD(buf.isa) = 138412802;
        *(void **)((char *)&buf.isa + 4) = DisplayID;
        WORD2(buf.info) = 2080;
        *(uint64_t *)((char *)&buf.info + 6) = (uint64_t)String;
        HIWORD(buf.data) = 2080;
        buf.length = (uint64_t)v70;
        _os_log_impl(&dword_219EF1000, v67, v68, "%@: network is captive Confidence: %s, Detection Type: %s", (uint8_t *)&buf, 0x20u);
      }
      if (!*(_QWORD *)(a1 + 72) || Confidence > *(_DWORD *)(a1 + 80))
      {
        my_FieldSetRetainedCFType((const void **)(a1 + 72), *(CFTypeRef *)a3);
        *(_DWORD *)(a1 + 80) = Confidence;
      }
      *(_DWORD *)(a1 + 164) = (_DWORD)v33;
      HasNeverBeenCaptive = NetIFWiFiNetworkHasNeverBeenCaptive(*(_QWORD *)(a1 + 40));
      *(_BYTE *)(a1 + 160) = HasNeverBeenCaptive;
      if (HasNeverBeenCaptive)
      {
        v72 = mysyslog_get_logger();
        v73 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v72, v73))
        {
          v74 = *(void **)(a1 + 40);
          if (v74)
            v74 = (void *)WiFiNetworkGetSSID();
          LODWORD(buf.isa) = 138412290;
          *(void **)((char *)&buf.isa + 4) = v74;
          _os_log_impl(&dword_219EF1000, v72, v73, "SSID %@ became captive network", (uint8_t *)&buf, 0xCu);
        }
      }
LABEL_65:
      if (!CNPluginStateListIsEvaluateResponsePending() || Confidence == 2)
      {
        if (*(_QWORD *)(a1 + 72))
        {
          SendCleanupCommandToBuiltinPluginIfNecessary(a1, 0);
          goto LABEL_69;
        }
        v52 = NetIFIsQuickProbeRequired();
        v53 = mysyslog_get_logger();
        v54 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = "was";
          if (!v52)
            v55 = "was not";
          LODWORD(buf.isa) = 136315138;
          *(void **)((char *)&buf.isa + 4) = (void *)v55;
          _os_log_impl(&dword_219EF1000, v53, v54, "quick probe %s used", (uint8_t *)&buf, 0xCu);
        }
        if (!Result || !v52)
        {
          if (v52)
          {
            v63 = mysyslog_get_logger();
            v64 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v63, v64))
            {
              v65 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
              v66 = *(_QWORD *)(a1 + 40);
              if (v66)
                v66 = WiFiNetworkGetSSID();
              LODWORD(buf.isa) = 138412546;
              *(void **)((char *)&buf.isa + 4) = (void *)v65;
              WORD2(buf.info) = 2112;
              *(uint64_t *)((char *)&buf.info + 6) = v66;
              _os_log_impl(&dword_219EF1000, v63, v64, "%@: SSID '%@' reporting quick probe success", (uint8_t *)&buf, 0x16u);
            }
            NetIFReportQuickProbeResult();
          }
          goto LABEL_88;
        }
        v56 = mysyslog_get_logger();
        v57 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v56, v57))
        {
          v58 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
          v59 = *(_QWORD *)(a1 + 40);
          if (v59)
            v59 = WiFiNetworkGetSSID();
          LODWORD(buf.isa) = 138412546;
          *(void **)((char *)&buf.isa + 4) = (void *)v58;
          WORD2(buf.info) = 2112;
          *(uint64_t *)((char *)&buf.info + 6) = v59;
          _os_log_impl(&dword_219EF1000, v56, v57, "%@: SSID '%@' reporting quick probe failure", (uint8_t *)&buf, 0x16u);
        }
        NetIFReportQuickProbeResult();
      }
      return;
    case 2:
      CNPluginStateListHandleUnregistered();
      v20 = *(_QWORD *)(a1 + 72);
      if (!v20)
      {
        v38 = mysyslog_get_logger();
        v39 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v38, v39))
        {
          LOWORD(buf.isa) = 0;
          _os_log_impl(&dword_219EF1000, v38, v39, "Evaluate timed out, these plugins did not respond:", (uint8_t *)&buf, 2u);
        }
        CNPluginStateListLogPendingCommand(*(_QWORD *)(a1 + 64));
        goto LABEL_88;
      }
      v21 = (void *)CNPluginStateGetDisplayID(v20);
      v22 = mysyslog_get_logger();
      v23 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v22, v23))
        goto LABEL_69;
      LODWORD(buf.isa) = 138412290;
      *(void **)((char *)&buf.isa + 4) = v21;
      v24 = "Evaluate timeout fired, using %@";
      goto LABEL_47;
    case 3:
      v25 = mysyslog_get_logger();
      v26 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v25, v26))
      {
        LOWORD(buf.isa) = 0;
        _os_log_impl(&dword_219EF1000, v25, v26, "Evaluate acknowledgement timeout fired", (uint8_t *)&buf, 2u);
      }
      CNPluginStateListSetEvaluateCmdAckTimeoutStatus();
      if (CNPluginStateListIsEvaluateResponsePending())
      {
        v16 = *(CFRunLoopTimerRef **)(a1 + 88);
        v17 = 40.0;
        v18 = (__CFRunLoopTimer *)a1;
        v19 = 2;
LABEL_55:
        TimerSet(v16, (__CFRunLoopTimer *)CNInfoEvaluating, v18, (__CFRunLoopTimer *)v19, 0, v17);
      }
      else
      {
        CNPluginStateListHandleUnregistered();
        v40 = *(_QWORD *)(a1 + 72);
        if (v40)
        {
          v41 = (void *)CNPluginStateGetDisplayID(v40);
          v22 = mysyslog_get_logger();
          v23 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v22, v23))
          {
            LODWORD(buf.isa) = 138412290;
            *(void **)((char *)&buf.isa + 4) = v41;
            v24 = "Evaluate acknowledgement timeout fired, using %@";
LABEL_47:
            _os_log_impl(&dword_219EF1000, v22, v23, v24, (uint8_t *)&buf, 0xCu);
          }
LABEL_69:
          CNInfoAuthenticating(a1, 0, 0);
        }
        else
        {
LABEL_88:
          CNInfoAuthenticated(a1, 0, 0);
        }
      }
      return;
    default:
      return;
  }
}

void CNInfoAuthenticating(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  __CFString *BSDName;
  CFDictionaryRef AuthCommand;
  double Current;
  double v8;
  void *DisplayID;
  unsigned int Result;
  char v12;
  const __CFString *v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v16;
  os_log_type_t v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  NSObject *logger;
  os_log_type_t v23;
  NSObject *v24;
  os_log_type_t v25;
  __CFString v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  const char *String;
  __int16 v34;
  unsigned int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  memset(&v26, 0, sizeof(v26));
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      PassiveDetectSetCallBack(0, 0);
      TimerCancel(*(_QWORD *)(a1 + 88));
      DisplayID = (void *)CNPluginStateGetDisplayID(*(_QWORD *)a3);
      Result = responseGetResult(*(const __CFDictionary **)(a3 + 8));
      v12 = 1;
      v13 = CFSTR("authentication failure");
      switch(Result)
      {
        case 0u:
          CNInfoAuthenticated(a1, 0, (CFDictionaryRef *)a3);
          return;
        case 2u:
          CNInfoPresentingUI(a1, 0, 0);
          return;
        case 5u:
          logger = mysyslog_get_logger();
          v23 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v23))
          {
            *(_DWORD *)buf = 138412290;
            v31 = DisplayID;
            _os_log_impl(&dword_219EF1000, logger, v23, "%@: Authenticate failed: Unsupported Network", buf, 0xCu);
          }
          CNInfoAddExcludedDisplayID(a1, DisplayID);
          goto LABEL_19;
        case 6u:
          v13 = 0;
          v12 = 0;
          goto LABEL_21;
        default:
LABEL_21:
          LOBYTE(v26.isa) = v12;
          v26.info = (uint64_t)v13;
          v24 = mysyslog_get_logger();
          v25 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v24, v25))
            goto LABEL_24;
          *(_DWORD *)buf = 138412802;
          v31 = DisplayID;
          v32 = 2080;
          String = CNPResultGetString(Result);
          v34 = 1024;
          v35 = Result;
          v18 = "%@: Authenticate result %s (%d)";
          v19 = v24;
          v20 = v25;
          v21 = 28;
          break;
      }
    }
    else
    {
      if (a2)
        return;
      CNInfoSetAuthState(a1, 3);
      CNInfoFlushAuthCommand(a1);
      *(_DWORD *)(a1 + 104) &= 0xFFFFFFFC;
      *(_DWORD *)(a1 + 232) = 0;
      v4 = *(_QWORD *)(a1 + 72);
      if (v4)
      {
        NetIFWiFiNetworkSetCaptive(*(_QWORD *)(a1 + 40), 1u);
        CNInfoUpdateWiFiNetwork(a1);
        networkAttributesInit(&v26.data, *(CFTypeRef *)(a1 + 40), 1, 0);
        BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
        AuthCommand = createAuthCommand(BSDName, 3, (uint64_t *)&v26.data);
        networkAttributesRelease((uint64_t)&v26.data);
        my_FieldSetRetainedCFType((const void **)(a1 + 64), AuthCommand);
        CNPluginStateIssueCommand(v4, AuthCommand);
        CFRelease(AuthCommand);
        TimerSet(*(CFRunLoopTimerRef **)(a1 + 88), (__CFRunLoopTimer *)CNInfoAuthenticating, (__CFRunLoopTimer *)a1, (__CFRunLoopTimer *)2, 0, 45.0);
        if (*(double *)(a1 + 184) > 0.0)
        {
          ++*(_DWORD *)(a1 + 192);
          Current = CFAbsoluteTimeGetCurrent();
          v8 = *(double *)(a1 + 184);
          if (Current > v8)
            *(double *)(a1 + 200) = Current - v8 + *(double *)(a1 + 200);
          *(_QWORD *)(a1 + 184) = 0;
        }
        return;
      }
      LOBYTE(v26.isa) = 1;
      v26.info = (uint64_t)CFSTR("no plugin");
      v16 = mysyslog_get_logger();
      v17 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v16, v17))
      {
LABEL_24:
        CNInfoFailure(a1, &v26);
        return;
      }
      *(_WORD *)buf = 0;
      v18 = "no plugin";
      v19 = v16;
      v20 = v17;
      v21 = 2;
    }
    _os_log_impl(&dword_219EF1000, v19, v20, v18, buf, v21);
    goto LABEL_24;
  }
  v14 = mysyslog_get_logger();
  v15 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v14, v15))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219EF1000, v14, v15, "Authenticate timed out", buf, 2u);
  }
LABEL_19:
  CNInfoEvaluating(a1, 0, 0);
}

void CNInfoMaintaining(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *DisplayID;
  const void *Value;
  unsigned int Result;
  unsigned int v11;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *logger;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  __CFString *BSDName;
  CFDictionaryRef AuthCommand;
  uint8_t v22[16];
  _OWORD v23[3];
  __int128 v24;
  __CFString buf;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  memset(v23, 0, sizeof(v23));
  switch(a2)
  {
    case 0:
      CNInfoSetAuthState(a1, 5);
      PassiveDetectSetCallBack(0, 0);
      TimerCancel(*(_QWORD *)(a1 + 88));
      CNInfoFlushAuthCommand(a1);
      *(_DWORD *)(a1 + 104) &= ~1u;
      v5 = *(_QWORD *)(a1 + 72);
      if (v5)
      {
        networkAttributesInit(v23, *(CFTypeRef *)(a1 + 40), 1, 0);
        if (a3)
        {
          *((_QWORD *)&v23[0] + 1) = *(_QWORD *)a3;
          if (*(_BYTE *)(a3 + 8))
            v6 = 3.0;
          else
            v6 = 45.0;
          if (*(_BYTE *)(a3 + 8))
            v7 = 3;
          else
            v7 = 2;
        }
        else
        {
          v7 = 2;
          v6 = 45.0;
        }
        *((_QWORD *)&v24 + 1) = NetIFWiFiNetworkCopyCaptivePortalAPIURL(*(_QWORD *)(a1 + 40));
        BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
        AuthCommand = createAuthCommand(BSDName, 5, (uint64_t *)v23);
        networkAttributesRelease((uint64_t)v23);
        my_FieldSetRetainedCFType((const void **)(a1 + 64), AuthCommand);
        CNPluginStateIssueCommand(v5, AuthCommand);
        CFRelease(AuthCommand);
        TimerSet(*(CFRunLoopTimerRef **)(a1 + 88), (__CFRunLoopTimer *)CNInfoMaintaining, (__CFRunLoopTimer *)a1, (__CFRunLoopTimer *)v7, 0, v6);
      }
      else
      {
        *(_OWORD *)&buf.isa = xmmword_24DC16DA0;
        logger = mysyslog_get_logger();
        v17 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, (os_log_type_t)v17))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl(&dword_219EF1000, logger, (os_log_type_t)v17, "no plugin", v22, 2u);
        }
        CNInfoFailure(a1, &buf);
      }
      break;
    case 1:
      PassiveDetectSetCallBack(0, 0);
      TimerCancel(*(_QWORD *)(a1 + 88));
      DisplayID = (void *)CNPluginStateGetDisplayID(*(_QWORD *)a3);
      Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a3 + 8), CFSTR("RedirectHostname"));
      if (Value)
        PassiveDetectSetRedirectURLHostname(Value);
      Result = responseGetResult(*(const __CFDictionary **)(a3 + 8));
      if (Result == 4)
      {
        NetIFSetRankNever(*(const __SCNetworkInterface **)(a1 + 32));
        if (*(_BYTE *)(a1 + 162))
          ++*(_DWORD *)(a1 + 208);
        CNInfoAuthenticating(a1, 0, 0);
      }
      else
      {
        v11 = Result;
        if (Result)
        {
          v18 = mysyslog_get_logger();
          v19 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v18, v19))
          {
            LODWORD(buf.isa) = 138412802;
            *(void **)((char *)&buf.isa + 4) = DisplayID;
            WORD2(buf.info) = 2080;
            *(uint64_t *)((char *)&buf.info + 6) = (uint64_t)CNPResultGetString(v11);
            HIWORD(buf.data) = 1024;
            LODWORD(buf.length) = v11;
            _os_log_impl(&dword_219EF1000, v18, v19, "%@: Maintain result is %s (%d)", (uint8_t *)&buf, 0x1Cu);
          }
          NetIFSetRankNever(*(const __SCNetworkInterface **)(a1 + 32));
          goto LABEL_31;
        }
        PassiveDetectReportNotCaptive();
        if (*(_BYTE *)(a1 + 162))
          ++*(_DWORD *)(a1 + 212);
        CNInfoAuthenticated(a1, 0, a3);
      }
      break;
    case 2:
      v12 = mysyslog_get_logger();
      v13 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v12, v13))
      {
        LOWORD(buf.isa) = 0;
        _os_log_impl(&dword_219EF1000, v12, v13, "Maintain timed out", (uint8_t *)&buf, 2u);
      }
LABEL_31:
      CNInfoEvaluating(a1, 0, 0);
      break;
    case 3:
      v14 = mysyslog_get_logger();
      v15 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v14, v15))
      {
        LOWORD(buf.isa) = 0;
        _os_log_impl(&dword_219EF1000, v14, v15, "Maintain timed out at wake, setting interface rank to Never", (uint8_t *)&buf, 2u);
      }
      NetIFSetRankNever(*(const __SCNetworkInterface **)(a1 + 32));
      break;
    default:
      return;
  }
}

void CNInfoPresentingUI(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v4;
  __CFString *BSDName;
  CFDictionaryRef AuthCommand;
  void *DisplayID;
  unsigned int Result;
  unsigned int v10;
  NSObject *logger;
  os_log_type_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  const __CFString *v17;
  char v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  __CFString v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  const char *String;
  __int16 v31;
  unsigned int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  memset(&v23, 0, sizeof(v23));
  if (a2 != 1)
  {
    if (a2)
      return;
    CNInfoSetAuthState(a1, 7);
    PassiveDetectSetCallBack(0, 0);
    TimerCancel(*(_QWORD *)(a1 + 88));
    CNInfoFlushAuthCommand(a1);
    v4 = *(_QWORD *)(a1 + 72);
    if (v4)
    {
      networkAttributesInit(&v23.data, *(CFTypeRef *)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 160));
      BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      AuthCommand = createAuthCommand(BSDName, 4, (uint64_t *)&v23.data);
      networkAttributesRelease((uint64_t)&v23.data);
      my_FieldSetRetainedCFType((const void **)(a1 + 64), AuthCommand);
      CNPluginStateIssueForegroundCommand(v4, AuthCommand);
      CFRelease(AuthCommand);
      return;
    }
    LOBYTE(v23.isa) = 1;
    v23.info = (uint64_t)CFSTR("no plugin");
    logger = mysyslog_get_logger();
    v12 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v12))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v13 = "no plugin";
    v14 = logger;
    v15 = v12;
    v16 = 2;
    goto LABEL_18;
  }
  DisplayID = (void *)CNPluginStateGetDisplayID(*(_QWORD *)a3);
  Result = responseGetResult(*(const __CFDictionary **)(a3 + 8));
  v10 = Result;
  if (Result == 6)
  {
    v17 = 0;
    v18 = 0;
LABEL_16:
    LOBYTE(v23.isa) = v18;
    v23.info = (uint64_t)v17;
    v21 = mysyslog_get_logger();
    v22 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v21, v22))
    {
LABEL_19:
      CNInfoFailure(a1, &v23);
      return;
    }
    *(_DWORD *)buf = 138412802;
    v28 = DisplayID;
    v29 = 2080;
    String = CNPResultGetString(v10);
    v31 = 1024;
    v32 = v10;
    v13 = "%@: PresentUI result %s (%d)";
    v14 = v21;
    v15 = v22;
    v16 = 28;
LABEL_18:
    _os_log_impl(&dword_219EF1000, v14, v15, v13, buf, v16);
    goto LABEL_19;
  }
  if (Result != 5)
  {
    if (!Result)
    {
      CNInfoAuthenticated(a1, 0, (CFDictionaryRef *)a3);
      return;
    }
    v18 = 1;
    v17 = CFSTR("PresentUI failure");
    goto LABEL_16;
  }
  v19 = mysyslog_get_logger();
  v20 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v19, v20))
  {
    *(_DWORD *)buf = 138412290;
    v28 = DisplayID;
    _os_log_impl(&dword_219EF1000, v19, v20, "%@: PresentUI failed: Unsupported Network", buf, 0xCu);
  }
  CNInfoAddExcludedDisplayID(a1, DisplayID);
  CNInfoEvaluating(a1, 0, 0);
}

void CNInfoLoggingOff(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t DisplayID;
  NSObject *logger;
  os_log_type_t v7;
  const char *v8;
  CFStringRef v9;
  NSObject *v10;
  uint64_t v11;
  __CFString *BSDName;
  CFDictionaryRef AuthCommand;
  _OWORD v14[4];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, sizeof(v14));
  v2 = *(_QWORD *)(a1 + 72);
  if (v2)
  {
    if ((a2 - 1) >= 2)
    {
      if (!a2)
      {
        CNInfoSetAuthState(a1, 8);
        PassiveDetectSetCallBack(0, 0);
        TimerCancel(*(_QWORD *)(a1 + 88));
        CNInfoFlushAuthCommand(a1);
        networkAttributesInit(v14, *(CFTypeRef *)(a1 + 40), 1, 0);
        BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
        AuthCommand = createAuthCommand(BSDName, 6, (uint64_t *)v14);
        networkAttributesRelease((uint64_t)v14);
        my_FieldSetRetainedCFType((const void **)(a1 + 64), AuthCommand);
        CNPluginStateIssueCommand(v2, AuthCommand);
        CFRelease(AuthCommand);
        TimerSet(*(CFRunLoopTimerRef **)(a1 + 88), (__CFRunLoopTimer *)CNInfoLoggingOff, (__CFRunLoopTimer *)a1, (__CFRunLoopTimer *)2, 0, 45.0);
      }
    }
    else
    {
      DisplayID = CNPluginStateGetDisplayID(*(_QWORD *)(a1 + 72));
      logger = mysyslog_get_logger();
      v7 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v7))
      {
        v8 = "complete";
        if (a2 == 2)
          v8 = "timed out";
        *(_DWORD *)buf = 136315394;
        v16 = v8;
        v17 = 2112;
        v18 = DisplayID;
        _os_log_impl(&dword_219EF1000, logger, v7, "CNPluginHandler: Logoff %s (%@)", buf, 0x16u);
      }
      PassiveDetectSetCallBack(0, 0);
      TimerCancel(*(_QWORD *)(a1 + 88));
      if (*(_QWORD *)(a1 + 40))
      {
        v9 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
        NetIFTakeWiFiNetworkOffline((uint64_t)v9, *(_QWORD *)(a1 + 40), 0, 0);
      }
      else
      {
        CNInfoInactive(a1);
      }
    }
  }
  else
  {
    v10 = mysyslog_get_logger();
    v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v10, (os_log_type_t)v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v10, (os_log_type_t)v11, "no plugin", buf, 2u);
    }
  }
}

uint64_t my_CFDictionaryContainsKeyAndValue(const __CFDictionary *a1, const void *a2)
{
  const void *Value;

  if (a1 && (Value = CFDictionaryGetValue(a1, CFSTR("UniqueID"))) != 0)
    return CFEqual(Value, a2);
  else
    return 0;
}

void CNInfoSetAuthState(uint64_t a1, int a2)
{
  uint64_t v3;
  NSObject *logger;
  os_log_type_t v5;
  _BOOL4 v6;
  CFStringRef BSDName;
  uint64_t v8;
  const char *v9;
  CFStringRef v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  int v17;
  CFStringRef v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t DisplayID;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 72);
  *(_DWORD *)(a1 + 56) = a2;
  logger = mysyslog_get_logger();
  v5 = _SC_syslog_os_log_mapping();
  v6 = os_log_type_enabled(logger, v5);
  if (v3)
  {
    if (!v6)
      return;
    BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    v8 = *(unsigned int *)(a1 + 56);
    if (v8 <= 8)
      v9 = AuthStateString_strings[v8];
    else
      v9 = "<unknown>";
    v17 = 138412802;
    v18 = BSDName;
    v19 = 2080;
    v20 = v9;
    v21 = 2112;
    DisplayID = CNPluginStateGetDisplayID(v3);
    v13 = "CNPluginHandler %@: %s (%@)";
    v14 = logger;
    v15 = v5;
    v16 = 32;
  }
  else
  {
    if (!v6)
      return;
    v10 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    v11 = *(unsigned int *)(a1 + 56);
    if (v11 <= 8)
      v12 = AuthStateString_strings[v11];
    else
      v12 = "<unknown>";
    v17 = 138412546;
    v18 = v10;
    v19 = 2080;
    v20 = v12;
    v13 = "CNPluginHandler %@: %s";
    v14 = logger;
    v15 = v5;
    v16 = 22;
  }
  _os_log_impl(&dword_219EF1000, v14, v15, v13, (uint8_t *)&v17, v16);
}

void CNInfoFlushAuthCommand(uint64_t a1)
{
  uint64_t v1;
  const void **v2;

  v2 = (const void **)(a1 + 64);
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    CNPluginStateListRemoveCommand(v1);
    my_FieldSetRetainedCFType(v2, 0);
  }
}

_OWORD *networkAttributesInit(_OWORD *result, CFTypeRef cf, int a3, int a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result[2] = 0u;
  result[3] = 0u;
  *result = 0u;
  result[1] = 0u;
  if (cf)
  {
    v7 = result;
    result = CFRetain(cf);
    v7[4] = cf;
    if (a3)
    {
      result = (_OWORD *)NetIFWiFiNetworkWasAutoJoined((uint64_t)cf);
      v8 = *MEMORY[0x24BDBD270];
      v9 = *MEMORY[0x24BDBD268];
      if ((_DWORD)result)
        v10 = *MEMORY[0x24BDBD270];
      else
        v10 = *MEMORY[0x24BDBD268];
      *v7 = v10;
    }
    else
    {
      v8 = *MEMORY[0x24BDBD270];
      v9 = *MEMORY[0x24BDBD268];
    }
    if (!a4)
      v8 = v9;
    v7[6] = v8;
  }
  return result;
}

const __CFDictionary *networkCopyCaptivePortalAPIURL(uint64_t a1)
{
  int v2;
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  NSObject *logger;
  os_log_type_t v8;
  uint8_t v9[16];

  v2 = _os_feature_enabled_impl();
  if (a1 && v2)
  {
    v3 = NetIFCopyAllServiceInformation();
    if (v3)
    {
      v4 = v3;
      v5 = NetIFCopyCaptivePortal(v3, a1);
      CFRelease(v4);
      return v5;
    }
    logger = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v8))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_219EF1000, logger, v8, "Failed to get service info", v9, 2u);
    }
  }
  return 0;
}

CFDictionaryRef createAuthCommand(void *a1, int a2, uint64_t *a3)
{
  CFStringRef v5;
  CFIndex v6;
  CFNumberRef v7;
  CFDictionaryRef v8;
  char v9;
  CFDictionaryRef v10;
  int valuePtr;
  void *values[3];
  CFDictionaryRef v14;
  void *keys[3];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  valuePtr = a2;
  v16 = 0;
  v14 = 0;
  v5 = my_CFUUIDStringCreate(0);
  keys[0] = CFSTR("UniqueID");
  values[0] = (void *)v5;
  v6 = 3;
  v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  keys[1] = CFSTR("Type");
  keys[2] = CFSTR("InterfaceName");
  values[1] = v7;
  values[2] = a1;
  if (a3)
  {
    v8 = copy_network_dict(a3);
    a3 = (uint64_t *)v8;
    if (v8)
    {
      v9 = 0;
      v16 = CFSTR("Network");
      v14 = v8;
      v6 = 4;
    }
    else
    {
      v9 = 1;
      v6 = 3;
    }
  }
  else
  {
    v9 = 1;
  }
  v10 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v6, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v5)
    CFRelease(v5);
  if (v7)
    CFRelease(v7);
  if ((v9 & 1) == 0)
    CFRelease(a3);
  return v10;
}

void networkAttributesRelease(uint64_t a1)
{
  const void *v2;
  const void *v3;

  v2 = *(const void **)(a1 + 32);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v3 = *(const void **)(a1 + 56);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 56) = 0;
  }
}

void CNInfoFailure(uint64_t a1, const __CFString *a2)
{
  const void *SSID;
  uint64_t **v5;
  double Current;
  uint64_t *v7;
  const void *v8;
  int isa_low;
  CFStringRef BSDName;

  CNInfoSetAuthState(a1, 6);
  if (*(_QWORD *)(a1 + 40))
    SSID = (const void *)WiFiNetworkGetSSID();
  else
    SSID = 0;
  v5 = *(uint64_t ***)(a1 + 136);
  Current = CFAbsoluteTimeGetCurrent();
  v7 = NetCacheLookupEntry(v5, *(const __CFArray **)(a1 + 48), SSID, Current);
  if (v7)
    NetCacheEntryDestroy(v7);
  my_FieldSetRetainedCFType((const void **)(a1 + 72), 0);
  *(_DWORD *)(a1 + 80) = 0;
  PassiveDetectSetCallBack(0, 0);
  TimerCancel(*(_QWORD *)(a1 + 88));
  CNInfoFlushAuthCommand(a1);
  v8 = *(const void **)(a1 + 96);
  if (v8)
  {
    CFRelease(v8);
    *(_QWORD *)(a1 + 96) = 0;
  }
  if (*(_QWORD *)(a1 + 40))
  {
    if (a2)
    {
      isa_low = LOBYTE(a2->isa);
      a2 = (const __CFString *)a2->info;
    }
    else
    {
      isa_low = 0;
    }
    BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    NetIFTakeWiFiNetworkOffline((uint64_t)BSDName, *(_QWORD *)(a1 + 40), isa_low, a2);
  }
  else
  {
    CNInfoInactive(a1);
  }
}

uint64_t responseGetResult(const __CFDictionary *a1)
{
  const void *Value;
  CFTypeID TypeID;
  unsigned int valuePtr;

  valuePtr = 0;
  Value = CFDictionaryGetValue(a1, CFSTR("Result"));
  TypeID = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
    return 0;
  CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr);
  return valuePtr;
}

void postNonCaptiveAnalyticsEvent(uint64_t a1)
{
  int SecurityType;
  int v3;
  uint64_t v4;

  if (!NetIFGetWiFiNetworkWasCaptive(*(_QWORD *)(a1 + 40)))
  {
    v4 = 0;
    SecurityType = NetIFWiFiNetworkGetSecurityType();
    if ((SecurityType - 1) >= 4)
      v3 = 0;
    else
      v3 = SecurityType;
    LODWORD(v4) = v3;
    BYTE4(v4) = NetIFWiFiNetworkIsUserBypass(*(_QWORD *)(a1 + 40));
    CaptiveAnalyticsSessionPostNonCaptiveEvent((unsigned int *)&v4);
  }
}

void SendCleanupCommandToBuiltinPluginIfNecessary(uint64_t a1, int a2)
{
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  __CFString *BSDName;
  CFDictionaryRef AuthCommand;

  if (a2 || (v3 = *(_QWORD *)(a1 + 72)) == 0)
  {
    if (!a2)
      return;
  }
  else if (CNPluginStateIsBuiltin(v3))
  {
    return;
  }
  v4 = CNPluginStateGet(CFSTR("__BUILTIN__"));
  if (v4)
  {
    v5 = (uint64_t)v4;
    CNPluginStateBuiltinFlushAllCommands((uint64_t)v4);
    BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    AuthCommand = createAuthCommand(BSDName, 0, 0);
    CNPluginStateIssueCommand(v5, AuthCommand);
    CFRelease(AuthCommand);
  }
}

void CNInfoAuthenticated(uint64_t a1, int a2, CFDictionaryRef *a3)
{
  CFDictionaryRef *v3;
  int v5;
  uint64_t v6;
  const __CFDictionary *v7;
  const void *Value;
  const void *v9;
  const __CFNumber *v10;
  const void *v11;
  CFTypeID TypeID;
  BOOL v13;
  int v14;
  NSObject *v15;
  os_log_type_t v16;
  CFStringRef v17;
  const char *v18;
  int BooleanValue;
  int v20;
  int v21;
  BOOL v22;
  char v23;
  int v24;
  char v25;
  NSObject *logger;
  os_log_type_t v27;
  uint64_t SSID;
  uint64_t v29;
  const void *v30;
  uint64_t v31;
  const void *DisplayID;
  NSObject *v33;
  os_log_type_t v34;
  CFStringRef v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  CFStringRef v39;
  uint64_t v40;
  uint64_t **v41;
  double Current;
  void *updated;
  uint64_t v44;
  int IsBuiltin;
  NSObject *v46;
  os_log_type_t v47;
  CFStringRef BSDName;
  CFTypeID v49;
  int v50;
  CFRunLoopTimerRef *v51;
  double v52;
  _BOOL4 IsProtected;
  char v54;
  const __CFDate *WhitelistedCaptiveNetworkProbeDate;
  const __CFDate *v56;
  int IsWhitelistedCaptiveNetwork;
  NSObject *v58;
  os_log_type_t v59;
  CFStringRef v60;
  uint64_t v61;
  const char *v62;
  CFAbsoluteTime v63;
  const __CFDate *v64;
  double TimeIntervalSinceDate;
  uint64_t *v66;
  double v67;
  NSObject *v68;
  os_log_type_t v69;
  _BOOL4 v70;
  CFStringRef v71;
  uint64_t v72;
  int v73;
  unsigned int v74;
  const __CFDictionary *v75;
  const __CFDictionary *v76;
  const __CFString *v77;
  CFTypeID v78;
  CFStringRef v79;
  uint64_t v80;
  NSObject *v81;
  os_log_type_t v82;
  CFStringRef v83;
  uint64_t v84;
  CFStringRef v85;
  uint64_t v86;
  const void *v87;
  char v88;
  uint64_t v89;
  NSObject *v90;
  os_log_type_t v91;
  _BOOL4 v92;
  NSObject *v93;
  os_log_type_t v94;
  const char *v95;
  NSObject *v96;
  os_log_type_t v97;
  NSObject *v98;
  os_log_type_t v99;
  const void *v100;
  const __CFString *v101;
  CFRunLoopRef v102;
  _QWORD *v103;
  uint64_t v104;
  const void *v105;
  int v106;
  uint64_t valuePtr;
  _BYTE buf[12];
  __int16 v109;
  uint64_t v110;
  __int16 v111;
  double v112;
  __int16 v113;
  double v114;
  uint64_t v115;

  v3 = a3;
  v115 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  if (a2 != 4)
  {
    if (a2)
      return;
    CNInfoSetAuthState(a1, 4);
    PassiveDetectSetCallBack(0, 0);
    TimerCancel(*(_QWORD *)(a1 + 88));
    CNInfoFlushAuthCommand(a1);
    v5 = *(_DWORD *)(a1 + 104);
    *(_DWORD *)(a1 + 104) = v5 & 0xFFFFFFFD;
    *(_DWORD *)(a1 + 232) = 0;
    v6 = *(_QWORD *)(a1 + 72);
    if (v3)
    {
      v7 = v3[1];
      if (v7)
      {
        Value = CFDictionaryGetValue(v7, CFSTR("LogoffURL"));
        v9 = CFDictionaryGetValue(v3[1], CFSTR("RedirectionURL"));
        v10 = (const __CFNumber *)CFDictionaryGetValue(v3[1], CFSTR("RedirectionURLGenerationID"));
        if (v10)
          CFNumberGetValue(v10, kCFNumberSInt64Type, &valuePtr);
        v11 = CFDictionaryGetValue(v3[1], CFSTR("WISPrLoginUsed"));
        TypeID = CFBooleanGetTypeID();
        v13 = v11 && CFGetTypeID(v11) == TypeID;
        *(_BYTE *)(a1 + 216) = v13;
        BooleanValue = my_CFDictionaryGetBooleanValue(v3[1], CFSTR("DisableMaintaining"), 0);
        v20 = my_CFDictionaryGetBooleanValue(v3[1], CFSTR("DisableAutologin"), 0);
        v21 = my_CFDictionaryGetBooleanValue(v3[1], CFSTR("UpdateWebSheetLoginDate"), 0);
        v3 = (CFDictionaryRef *)CFDictionaryGetValue(v3[1], CFSTR("APIStateSecondsRemaining"));
LABEL_25:
        v22 = (v5 & 1) != 0 && v6 == 0;
        v23 = !v22;
        if (v22)
        {
          NetIFSetRankDefault(*(const __SCNetworkInterface **)(a1 + 32));
        }
        else
        {
          v105 = v9;
          v106 = v21;
          v24 = BooleanValue;
          *(_DWORD *)(a1 + 104) &= ~2u;
          if (!*(_QWORD *)(a1 + 40) || !NetIFWiFiNetworkIsCarPlayAndInternet())
          {
            v25 = v23;
            logger = mysyslog_get_logger();
            v27 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(logger, v27))
            {
              SSID = *(_QWORD *)(a1 + 40);
              if (SSID)
                SSID = WiFiNetworkGetSSID();
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = SSID;
              _os_log_impl(&dword_219EF1000, logger, v27, "adding/updating network [%@] to network cache", buf, 0xCu);
            }
            v23 = v25;
            if (*(_QWORD *)(a1 + 40))
            {
              v104 = valuePtr;
              v29 = WiFiNetworkGetSSID();
              if (v29)
              {
                v30 = (const void *)v29;
                v31 = *(_QWORD *)(a1 + 72);
                if (v31)
                  DisplayID = (const void *)CNPluginStateGetDisplayID(v31);
                else
                  DisplayID = 0;
                v41 = *(uint64_t ***)(a1 + 136);
                Current = CFAbsoluteTimeGetCurrent();
                updated = NetCacheUpdateEntry(v41, *(CFArrayRef *)(a1 + 48), v30, DisplayID != 0, DisplayID, Current);
                v44 = (uint64_t)updated;
                if (Value)
                  NetCacheEntrySetLogoffURL((uint64_t)updated, Value);
                v23 = v25;
                if (v105)
                  NetCacheEntrySetRedirectionURL(v44, v105, v104);
              }
            }
          }
          NetIFSetRankDefault(*(const __SCNetworkInterface **)(a1 + 32));
          BooleanValue = v24;
          if (v6)
          {
            IsBuiltin = CNPluginStateIsBuiltin(v6);
            if (Value)
            {
              v46 = mysyslog_get_logger();
              v47 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v46, v47))
              {
                BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = BSDName;
                v109 = 2112;
                v110 = (uint64_t)Value;
                _os_log_impl(&dword_219EF1000, v46, v47, "%@: LogoffURL %@", buf, 0x16u);
              }
            }
            BooleanValue = v24;
            if (IsBuiltin != 1 || v24)
            {
              v50 = v106;
              if (!IsBuiltin)
              {
LABEL_91:
                v51 = *(CFRunLoopTimerRef **)(a1 + 88);
                v52 = 300.0;
                goto LABEL_92;
              }
              if (BooleanValue)
                goto LABEL_93;
            }
            else
            {
              v49 = CFNumberGetTypeID();
              v50 = v106;
              if (v3 && CFGetTypeID(v3) == v49)
              {
                *(_QWORD *)buf = 0;
                CFNumberGetValue((CFNumberRef)v3, kCFNumberDoubleType, buf);
                v51 = *(CFRunLoopTimerRef **)(a1 + 88);
                v52 = *(double *)buf;
LABEL_92:
                TimerSet(v51, (__CFRunLoopTimer *)CNInfoMaintaining, (__CFRunLoopTimer *)a1, 0, 0, v52);
LABEL_93:
                PowerChangeRegister((uint64_t (*)(_QWORD))CNPluginHandlerPowerChange);
                CNPluginStateGetDisplayID(v6);
                if (v20)
                  v73 = 7;
                else
                  v73 = 3;
                if (v50)
                  v74 = v73 | 0x20;
                else
                  v74 = v73;
                CNScanListFilterAggregateResults(a1);
                if (!v20)
                {
                  if (*(double *)(a1 + 168) == 0.0)
                    *(CFAbsoluteTime *)(a1 + 168) = CFAbsoluteTimeGetCurrent();
                  *(CFAbsoluteTime *)(a1 + 184) = CFAbsoluteTimeGetCurrent();
                }
                if (!IsBuiltin && !*(_QWORD *)(a1 + 224))
                {
                  v75 = (const __CFDictionary *)CaptiveCopyProbeSettings();
                  if (!v75)
                  {
                    v77 = 0;
                    goto LABEL_140;
                  }
                  v76 = v75;
                  v77 = (const __CFString *)CFDictionaryGetValue(v75, CFSTR("ProbeURL"));
                  v78 = CFStringGetTypeID();
                  if (v77 && CFGetTypeID(v77) == v78)
                  {
                    CFRelease(v76);
LABEL_140:
                    v98 = mysyslog_get_logger();
                    v99 = _SC_syslog_os_log_mapping();
                    if (os_log_type_enabled(v98, v99))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_219EF1000, v98, v99, "starting probe for an Internet access", buf, 2u);
                    }
                    if (*(_QWORD *)(a1 + 40))
                      v100 = (const void *)WiFiNetworkGetSSID();
                    else
                      v100 = 0;
                    v101 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
                    v102 = CFRunLoopGetCurrent();
                    v103 = captive_agent_send_probe(v100, v101, 0, v77, 0xAu, (uint64_t)HandleInternetAccessProbeResult, a1, (uint64_t)v102);
                    v54 = 0;
                    *(_QWORD *)(a1 + 224) = v103;
                    goto LABEL_125;
                  }
                  CFRelease(v76);
                }
                v54 = 0;
                goto LABEL_125;
              }
            }
            if (PassiveDetectSetCallBack((uint64_t)CNPluginHandlerDetectedCaptive, a1))
              goto LABEL_93;
            goto LABEL_91;
          }
        }
        IsProtected = NetIFWiFiNetworkIsProtected(*(_QWORD *)(a1 + 40));
        if (IsProtected || !S_WhitelistedNetworkDetectionEnabled)
        {
          v54 = 0;
          if (!IsProtected || !S_WhitelistedProtectedNetworkDetectionEnabled)
          {
LABEL_114:
            if (NetIFGetWiFiNetworkWasCaptive(*(_QWORD *)(a1 + 40)))
            {
              *(_BYTE *)(a1 + 162) = 0;
              PassiveDetectSetCallBack((uint64_t)CNPluginHandlerDetectedCaptive, a1);
            }
            if ((v23 & 1) != 0)
            {
              v74 = 2;
            }
            else
            {
              v81 = mysyslog_get_logger();
              v82 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v81, v82))
              {
                v83 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
                v84 = *(_QWORD *)(a1 + 40);
                if (v84)
                  v84 = WiFiNetworkGetSSID();
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = v83;
                v109 = 2112;
                v110 = v84;
                _os_log_impl(&dword_219EF1000, v81, v82, "%@ reporting inconclusive captive evaluation for '%@' to symptoms", buf, 0x16u);
              }
              CaptiveSymptomReportInconclusiveCaptiveEvaluation();
              v74 = 66;
            }
LABEL_125:
            NetIFWiFiNetworkSetCaptive(*(_QWORD *)(a1 + 40), v74);
            if (BooleanValue || *(_QWORD *)(a1 + 152))
              return;
            v85 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
            if (*(_QWORD *)(a1 + 40) && (v86 = WiFiNetworkGetSSID()) != 0)
            {
              v87 = (const void *)v86;
              v88 = IsChinaDevice();
              v89 = BBMonitorCreate((uint64_t)v85, v87, v88, v54, (uint64_t)_BrokenBackhaulMonitorComplete, a1);
              *(_QWORD *)(a1 + 152) = v89;
              v90 = mysyslog_get_logger();
              v91 = _SC_syslog_os_log_mapping();
              v92 = os_log_type_enabled(v90, v91);
              if (v89)
              {
                if (v92)
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v85;
                  v109 = 2112;
                  v110 = (uint64_t)v87;
                  _os_log_impl(&dword_219EF1000, v90, v91, "BrokenBackhaulMonitor started on %@ (%@)", buf, 0x16u);
                }
                BBMonitorStart(*(_QWORD *)(a1 + 152));
                return;
              }
              if (!v92)
                return;
              *(_WORD *)buf = 0;
              v95 = "BrokenBackhaulMonitor failed to start";
              v96 = v90;
              v97 = v91;
            }
            else
            {
              v93 = mysyslog_get_logger();
              v94 = _SC_syslog_os_log_mapping();
              if (!os_log_type_enabled(v93, v94))
                return;
              *(_WORD *)buf = 0;
              v95 = "BrokenBackhaulMonitor can't be started: no SSID";
              v96 = v93;
              v97 = v94;
            }
            _os_log_impl(&dword_219EF1000, v96, v97, v95, buf, 2u);
            return;
          }
        }
        if (*(_QWORD *)(a1 + 40))
        {
          WhitelistedCaptiveNetworkProbeDate = (const __CFDate *)NetIFWiFiNetworkGetWhitelistedCaptiveNetworkProbeDate();
          if (WhitelistedCaptiveNetworkProbeDate)
          {
            v56 = WhitelistedCaptiveNetworkProbeDate;
            IsWhitelistedCaptiveNetwork = NetIFWiFiNetworkIsWhitelistedCaptiveNetwork(*(_QWORD *)(a1 + 40));
            v58 = mysyslog_get_logger();
            v59 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v58, v59))
            {
              v60 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
              v61 = *(_QWORD *)(a1 + 40);
              if (v61)
                v61 = WiFiNetworkGetSSID();
              v62 = "already ";
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v60;
              if (!IsWhitelistedCaptiveNetwork)
                v62 = "not ";
              v109 = 2112;
              v110 = v61;
              v111 = 2080;
              v112 = *(double *)&v62;
              _os_log_impl(&dword_219EF1000, v58, v59, "%@: %@ %smarked whitelisted", buf, 0x20u);
            }
            v63 = CFAbsoluteTimeGetCurrent();
            v64 = CFDateCreate(0, v63);
            TimeIntervalSinceDate = CFDateGetTimeIntervalSinceDate(v64, v56);
            CFRelease(v64);
            v66 = &S_WhitelistedNetworkProbeInterval;
            if (!IsWhitelistedCaptiveNetwork)
              v66 = &S_UnwhitelistedNetworkProbeInterval;
            v67 = *(double *)v66;
            v68 = mysyslog_get_logger();
            v69 = _SC_syslog_os_log_mapping();
            v70 = os_log_type_enabled(v68, v69);
            if (TimeIntervalSinceDate < v67)
            {
              if (v70)
              {
                v71 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
                v72 = *(_QWORD *)(a1 + 40);
                if (v72)
                  v72 = WiFiNetworkGetSSID();
                *(_DWORD *)buf = 138413058;
                *(_QWORD *)&buf[4] = v71;
                v109 = 2112;
                v110 = v72;
                v111 = 2048;
                v112 = TimeIntervalSinceDate;
                v113 = 2048;
                v114 = v67;
                _os_log_impl(&dword_219EF1000, v68, v69, "%@: %@ BrokenBackhaulMonitor can't probe yet (%g < %g)", buf, 0x2Au);
              }
              goto LABEL_87;
            }
            if (v70)
            {
              v79 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
              v80 = *(_QWORD *)(a1 + 40);
              if (v80)
                v80 = WiFiNetworkGetSSID();
              *(_DWORD *)buf = 138413058;
              *(_QWORD *)&buf[4] = v79;
              v109 = 2112;
              v110 = v80;
              v111 = 2048;
              v112 = TimeIntervalSinceDate;
              v113 = 2048;
              v114 = v67;
              _os_log_impl(&dword_219EF1000, v68, v69, "%@: %@ BrokenBackhaulMonitor can probe again (%g >= %g)", buf, 0x2Au);
            }
          }
          v54 = 3;
          goto LABEL_114;
        }
LABEL_87:
        v54 = 1;
        goto LABEL_114;
      }
      v3 = 0;
    }
    v9 = 0;
    Value = 0;
    BooleanValue = 0;
    v21 = 0;
    v20 = 0;
    goto LABEL_25;
  }
  if (a3)
    v14 = *(unsigned __int8 *)a3;
  else
    v14 = 0;
  v15 = mysyslog_get_logger();
  v16 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    v18 = " [whitelist]";
    if (!v14)
      v18 = "";
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v17;
    v109 = 2080;
    v110 = (uint64_t)v18;
    _os_log_impl(&dword_219EF1000, v15, v16, "%@: detected captive%s", buf, 0x16u);
  }
  if (*(_QWORD *)(a1 + 72))
  {
    CNInfoMaintaining(a1, 0, 0);
  }
  else if (NetIFGetWiFiNetworkWasCaptive(*(_QWORD *)(a1 + 40)))
  {
    CNInfoEvaluating(a1, 0, 0);
  }
  else if ((*(_BYTE *)(a1 + 104) & 1) == 0 && v14)
  {
    PassiveDetectSetCallBack(0, 0);
    NetIFWiFiNetworkSetCaptive(*(_QWORD *)(a1 + 40), 0x18u);
    CNInfoUpdateWiFiNetwork(a1);
    v33 = mysyslog_get_logger();
    v34 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      v36 = *(_QWORD *)(a1 + 40);
      if (v36)
        v36 = WiFiNetworkGetSSID();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v35;
      v109 = 2112;
      v110 = v36;
      _os_log_impl(&dword_219EF1000, v33, v34, "%@: %@ whitelists our probe", buf, 0x16u);
    }
    v37 = mysyslog_get_logger();
    v38 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      v40 = *(_QWORD *)(a1 + 40);
      if (v40)
        v40 = WiFiNetworkGetSSID();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v39;
      v109 = 2112;
      v110 = v40;
      _os_log_impl(&dword_219EF1000, v37, v38, "%@: %@ disabling broken backhaul monitor", buf, 0x16u);
    }
    CNInfoStopBrokenBackhaulMonitor(a1);
  }
}

CFDictionaryRef copy_network_dict(uint64_t *a1)
{
  uint64_t v2;
  uint64_t SSID;
  unsigned int v4;
  uint64_t SSIDData;
  const void *Property;
  CFTypeID TypeID;
  _BOOL4 IsProtected;
  _QWORD *v9;
  const void *v10;
  CFTypeID v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD v20[7];
  void *keys[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  *(_OWORD *)keys = 0u;
  memset(v20, 0, sizeof(v20));
  v2 = a1[4];
  if (v2)
  {
    SSID = WiFiNetworkGetSSID();
    if (SSID)
    {
      keys[0] = CFSTR("SSIDString");
      *(_QWORD *)&v20[0] = SSID;
      v4 = 1;
    }
    else
    {
      v4 = 0;
    }
    SSIDData = WiFiNetworkGetSSIDData();
    if (SSIDData)
    {
      *(_QWORD *)((unint64_t)keys | (8 * v4)) = CFSTR("SSID");
      *(_QWORD *)((unint64_t)v20 & 0xFFFFFFFFFFFFFFF7 | (8 * (v4++ & 1))) = SSIDData;
    }
    Property = (const void *)WiFiNetworkGetProperty();
    TypeID = CFStringGetTypeID();
    if (Property && CFGetTypeID(Property) == TypeID)
    {
      keys[v4] = CFSTR("BSSID");
      *((_QWORD *)v20 + v4++) = Property;
    }
    IsProtected = NetIFWiFiNetworkIsProtected(v2);
    v9 = (_QWORD *)MEMORY[0x24BDBD270];
    if (IsProtected)
    {
      keys[v4] = CFSTR("IsProtected");
      *((_QWORD *)v20 + v4++) = *v9;
    }
    if (NetIFWiFiNetworkIsUserBypass(v2))
    {
      keys[v4] = CFSTR("CaptiveBypass");
      *((_QWORD *)v20 + v4++) = *v9;
    }
    v10 = (const void *)WiFiNetworkGetProperty();
    v11 = CFNumberGetTypeID();
    if (v10 && CFGetTypeID(v10) == v11)
    {
      keys[v4] = CFSTR("SignalStrength");
      *((_QWORD *)v20 + v4++) = v10;
    }
    if (NetIFIsQuickProbeRequired())
    {
      keys[v4] = CFSTR("QuickProbeRequired");
      *((_QWORD *)v20 + v4++) = *v9;
    }
  }
  else
  {
    v4 = 0;
  }
  v12 = *a1;
  if (*a1)
  {
    keys[v4] = CFSTR("WasAutoJoined");
    *((_QWORD *)v20 + v4++) = v12;
  }
  v13 = a1[1];
  if (v13)
  {
    keys[v4] = CFSTR("WasJustJoined");
    *((_QWORD *)v20 + v4++) = v13;
  }
  v14 = a1[2];
  if (v14)
  {
    keys[v4] = CFSTR("WasCaptive");
    *((_QWORD *)v20 + v4++) = v14;
  }
  v15 = a1[3];
  if (v15)
  {
    keys[v4] = CFSTR("IsCached");
    *((_QWORD *)v20 + v4++) = v15;
  }
  v16 = a1[5];
  if (v16)
  {
    keys[v4] = CFSTR("IsChosenPlugin");
    *((_QWORD *)v20 + v4++) = v16;
  }
  v17 = a1[6];
  if (v17)
  {
    keys[v4] = CFSTR("BecameCaptive");
    *((_QWORD *)v20 + v4++) = v17;
  }
  v18 = a1[7];
  if (v18)
  {
    keys[v4] = CFSTR("PortalURL");
    *((_QWORD *)v20 + v4++) = v18;
  }
  else if (!v4)
  {
    return 0;
  }
  return CFDictionaryCreate(0, (const void **)keys, (const void **)v20, v4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
}

void CNInfoInactive(uint64_t a1)
{
  CFStringRef BSDName;
  uint64_t v3;
  double Current;
  double v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  __int128 v9;
  int SecurityType;
  int v11;
  const void *v12;
  const void *v13;
  unint64_t v14;
  __int128 DisplayID;
  _OWORD v16[2];

  BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
  NetIFSetCarPlayModeChangeCallBack((uint64_t)BSDName, 0);
  v3 = *(_QWORD *)(a1 + 72);
  Current = CFAbsoluteTimeGetCurrent();
  if (v3)
  {
    v5 = *(double *)(a1 + 168);
    if (v5 != 0.0)
    {
      if (Current <= v5)
        v6 = 0;
      else
        v6 = (unint64_t)(Current - v5);
      if (CNPluginStateIsBuiltin(v3))
      {
        DisplayID = 0u;
        memset(v16, 0, sizeof(v16));
        LODWORD(DisplayID) = *(_DWORD *)(a1 + 164);
        v14 = v6;
        v7 = *(_DWORD *)(a1 + 192);
        if (v7 >= 1)
        {
          v8 = *(_QWORD *)(a1 + 208);
          *((_QWORD *)&DisplayID + 1) = llround(*(double *)(a1 + 200) / (double)v7);
          *(_QWORD *)&v9 = (int)v8;
          *((_QWORD *)&v9 + 1) = SHIDWORD(v8);
          *(_OWORD *)((char *)v16 + 8) = v9;
        }
        SecurityType = NetIFWiFiNetworkGetSecurityType();
        if ((SecurityType - 1) >= 4)
          v11 = 0;
        else
          v11 = SecurityType;
        DWORD2(v16[1]) = v11;
        LOBYTE(v16[0]) = *(_BYTE *)(a1 + 216);
        CaptiveAnalyticsSessionPostBuiltinEvent((uint64_t *)&v14);
      }
      else
      {
        v14 = v6;
        DisplayID = (unint64_t)CNPluginStateGetDisplayID(v3);
        BYTE8(DisplayID) = *(_BYTE *)(a1 + 217);
        CaptiveAnalyticsSessionPostHSHelperEvent((uint64_t *)&v14);
      }
    }
  }
  my_FieldSetRetainedCFType((const void **)(a1 + 72), 0);
  *(_DWORD *)(a1 + 80) = 0;
  PassiveDetectSetCallBack(0, 0);
  TimerCancel(*(_QWORD *)(a1 + 88));
  CNInfoFlushAuthCommand(a1);
  SendCleanupCommandToBuiltinPluginIfNecessary(a1, 1);
  my_FieldSetRetainedCFType((const void **)(a1 + 48), 0);
  v12 = *(const void **)(a1 + 40);
  if (v12)
  {
    CFRelease(v12);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v13 = *(const void **)(a1 + 96);
  if (v13)
  {
    CFRelease(v13);
    *(_QWORD *)(a1 + 96) = 0;
  }
  PassiveDetectNewNetwork();
  if (*(_DWORD *)(a1 + 56) >= 2u)
  {
    CNInfoSetAuthState(a1, 1);
    NetIFSetRankNever(*(const __SCNetworkInterface **)(a1 + 32));
  }
  *(_DWORD *)(a1 + 104) &= 0xFFFFFFFC;
  CNInfoStopBrokenBackhaulMonitor(a1);
  *(_DWORD *)(a1 + 232) = 0;
  PowerChangeDeregister();
}

void CNInfoStopBrokenBackhaulMonitor(uint64_t a1)
{
  NSObject *logger;
  os_log_type_t v3;
  uint8_t v4[16];

  if (*(_QWORD *)(a1 + 152))
  {
    logger = mysyslog_get_logger();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_219EF1000, logger, v3, "Stopping BrokenBackhaulMonitor", v4, 2u);
    }
    BBMonitorInvalidate(*(_QWORD *)(a1 + 152));
    BBMonitorRelease(*(_QWORD **)(a1 + 152));
    *(_QWORD *)(a1 + 152) = 0;
  }
}

uint64_t ___handleIPv6OnlyEvaluationFailure_block_invoke(uint64_t a1)
{
  NSObject *logger;
  os_log_type_t v3;
  uint8_t v5[16];

  logger = mysyslog_get_logger();
  v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219EF1000, logger, v3, "scheduling captive evaluation retry", v5, 2u);
  }
  return CNInfoEvaluating(*(_QWORD *)(a1 + 32), 0, 0);
}

const void *networkGetConfidence(const void *Confidence, uint64_t a2)
{
  CFTypeID TypeID;
  const void *Value;
  NSObject *logger;
  os_log_type_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  TypeID = CFDictionaryGetTypeID();
  if (Confidence)
  {
    if (CFGetTypeID(Confidence) != TypeID)
      return 0;
    Value = CFDictionaryGetValue((CFDictionaryRef)Confidence, CFSTR("Confidence"));
    Confidence = (const void *)numberGetConfidence(Value);
    if (Confidence >= 3)
    {
      logger = mysyslog_get_logger();
      v7 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v7))
      {
        v9 = 138412546;
        v10 = a2;
        v11 = 1024;
        v12 = (int)Confidence;
        _os_log_impl(&dword_219EF1000, logger, v7, "%@: invalid Confidence value %d treating as None", (uint8_t *)&v9, 0x12u);
      }
      return 0;
    }
  }
  return Confidence;
}

uint64_t numberGetConfidence(const void *a1)
{
  CFTypeID TypeID;
  unsigned int valuePtr;

  valuePtr = 0;
  TypeID = CFNumberGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID)
    return 0;
  CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, &valuePtr);
  return valuePtr;
}

void CNPluginHandlerDetectedCaptive(uint64_t a1)
{
  NSObject *logger;
  os_log_type_t v3;
  CFStringRef BSDName;
  uint64_t v5;
  const char *v6;
  char v7;
  uint8_t buf[4];
  CFStringRef v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  if (*(_DWORD *)(a1 + 56) == 4)
  {
    *(_BYTE *)(a1 + 162) = 1;
    CNInfoAuthenticated(a1, 4, &v7);
  }
  else
  {
    logger = mysyslog_get_logger();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      v5 = *(unsigned int *)(a1 + 56);
      if (v5 <= 8)
        v6 = AuthStateString_strings[v5];
      else
        v6 = "<unknown>";
      *(_DWORD *)buf = 138412546;
      v9 = BSDName;
      v10 = 2080;
      v11 = v6;
      _os_log_impl(&dword_219EF1000, logger, v3, "CNPluginHandler %@: passive detected in %s state, ignoring", buf, 0x16u);
    }
  }
}

void CNPluginHandlerPowerChange(int a1)
{
  NSObject *logger;
  os_log_type_t v3;
  const char *v4;
  uint64_t i;
  CFStringRef BSDName;
  uint64_t v7;
  const void *v8;
  const void *SSID;
  const void *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t v13[16];
  uint8_t buf[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    v4 = "Wake";
    if (!a1)
      v4 = "Sleep";
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v4;
    _os_log_impl(&dword_219EF1000, logger, v3, "%s", buf, 0xCu);
  }
  if (a1)
  {
    for (i = S_CNInfoHeadStorage; i; i = *(_QWORD *)i)
    {
      *(_OWORD *)buf = 0uLL;
      if (*(_QWORD *)(i + 40))
      {
        if (*(_QWORD *)(i + 72))
        {
          BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(i + 32));
          v7 = NetIFCopyCurrentWiFiNetwork((uint64_t)BSDName);
          if (v7)
          {
            v8 = (const void *)v7;
            SSID = (const void *)WiFiNetworkGetSSID();
            v10 = (const void *)WiFiNetworkGetSSID();
            LODWORD(SSID) = my_CFEqual(SSID, v10);
            CFRelease(v8);
            if ((_DWORD)SSID)
            {
              v11 = mysyslog_get_logger();
              v12 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v11, v12))
              {
                *(_WORD *)v13 = 0;
                _os_log_impl(&dword_219EF1000, v11, v12, "wake on the same captive network", v13, 2u);
              }
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = 1;
              CNInfoMaintaining(i, 0, (uint64_t)buf);
            }
          }
        }
      }
    }
  }
}

void CNScanListFilterAggregateResults(uint64_t a1)
{
  uint64_t v2;
  const __CFArray *v3;
  CFMutableArrayRef Mutable;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  __CFDictionary *MutableCopy;
  __CFDictionary *v10;
  CFIndex v11;
  CFIndex v12;
  CFIndex j;
  const void *v14;
  __CFString *v15;
  CFDictionaryRef ScanListProcessCommand;
  NSObject *v17;
  os_log_type_t v18;
  CFStringRef v19;
  NSObject *logger;
  os_log_type_t v21;
  CFStringRef BSDName;
  CFArrayRef theArray[2];
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  CFStringRef v27;
  __int16 v28;
  CFDictionaryRef v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (S_filter_request_count)
  {
    v24 = 0u;
    v25 = 0u;
    *(_OWORD *)theArray = 0u;
    BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
    {
      *((_QWORD *)&v24 + 1) = WiFiNetworkGetSSID();
      LOBYTE(v25) = NetIFWiFiNetworkIsProtected(v2);
      *((_QWORD *)&v25 + 1) = *(_QWORD *)(a1 + 72);
    }
    CNPluginStateListApplyFunction((uint64_t)CNScanListFilterAggregateResultsApplier, (uint64_t)&BSDName);
    v3 = theArray[0];
    if (theArray[0])
    {
      if (*(_QWORD *)(a1 + 144)
        || (Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]),
            (*(_QWORD *)(a1 + 144) = Mutable) != 0))
      {
        Count = CFArrayGetCount(v3);
        if (Count >= 1)
        {
          v6 = Count;
          for (i = 0; i != v6; ++i)
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, i);
            if (!NetworkArrayContainsNetwork(*(const __CFArray **)(a1 + 144), ValueAtIndex))
            {
              MutableCopy = CFDictionaryCreateMutableCopy(0, 0, ValueAtIndex);
              if (MutableCopy)
              {
                v10 = MutableCopy;
                CFDictionaryRemoveValue(MutableCopy, CFSTR("Password"));
                CFDictionaryRemoveValue(v10, CFSTR("PluginNames"));
                CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 144), v10);
                CFRelease(v10);
              }
            }
          }
        }
        v11 = CFArrayGetCount(*(CFArrayRef *)(a1 + 144));
        if (v11 >= 1)
        {
          v12 = v11;
          for (j = 0; j < v12; ++j)
          {
            v14 = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 144), j);
            if (!NetworkArrayContainsNetwork(v3, (const __CFDictionary *)v14))
            {
              CFArrayAppendValue(v3, v14);
              CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 144), j);
              --v12;
              if (j <= 0)
                j = 0;
              else
                --j;
            }
          }
        }
      }
      else
      {
        logger = mysyslog_get_logger();
        v21 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v21))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219EF1000, logger, v21, "failed to allocate memory for cached filter results.", buf, 2u);
        }
      }
      v15 = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      ScanListProcessCommand = createScanListProcessCommand(v15, theArray[0]);
      CFRelease(theArray[0]);
      if (ScanListProcessCommand)
      {
        CommandHandlerListApplyFunction(5u, (uint64_t)CNScanListFilterAppendCommandApplier, (uint64_t)ScanListProcessCommand);
        if (CaptiveIsDebug())
        {
          v17 = mysyslog_get_logger();
          v18 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v17, v18))
          {
            v19 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
            *(_DWORD *)buf = 138412546;
            v27 = v19;
            v28 = 2112;
            v29 = ScanListProcessCommand;
            _os_log_impl(&dword_219EF1000, v17, v18, "%@: %@", buf, 0x16u);
          }
        }
        CFRelease(ScanListProcessCommand);
      }
    }
    else
    {
      CNScanListFilterSendClearResults(a1);
    }
  }
}

void CNInfoUpdateWiFiNetwork(uint64_t a1)
{
  uint64_t SSID;
  const void *v3;
  CFStringRef BSDName;
  uint64_t v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  NSObject *logger;
  os_log_type_t v11;
  CFStringRef v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  CFStringRef v16;
  uint64_t v17;
  int v18;
  CFStringRef v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 40))
  {
    SSID = WiFiNetworkGetSSID();
    if (SSID)
    {
      v3 = (const void *)SSID;
      BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      v5 = NetIFCopyCurrentWiFiNetwork((uint64_t)BSDName);
      if (v5)
      {
        v6 = (const void *)v5;
        v7 = (const void *)WiFiNetworkGetSSID();
        v8 = v7;
        if (v7 && CFEqual(v7, v3))
        {
          v9 = *(const void **)(a1 + 40);
          if (v9)
            CFRelease(v9);
          *(_QWORD *)(a1 + 40) = v6;
          logger = mysyslog_get_logger();
          v11 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v11))
          {
            v12 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
            v13 = *(_QWORD *)(a1 + 40);
            if (v13)
              v13 = WiFiNetworkGetSSID();
            v18 = 138412546;
            v19 = v12;
            v20 = 2112;
            v21 = v13;
            _os_log_impl(&dword_219EF1000, logger, v11, "%@: %@ updated", (uint8_t *)&v18, 0x16u);
          }
        }
        else
        {
          v14 = mysyslog_get_logger();
          v15 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v14, v15))
          {
            v16 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
            v17 = *(_QWORD *)(a1 + 40);
            if (v17)
              v17 = WiFiNetworkGetSSID();
            v18 = 138412802;
            v19 = v16;
            v20 = 2112;
            v21 = v17;
            v22 = 2112;
            v23 = v8;
            _os_log_impl(&dword_219EF1000, v14, v15, "%@: %@ not updated (new %@)", (uint8_t *)&v18, 0x20u);
          }
          CFRelease(v6);
        }
      }
    }
  }
}

void CNScanListFilterAggregateResultsApplier(uint64_t a1, uint64_t a2)
{
  const void *DisplayID;
  const __CFArray *FilterResults;
  const __CFArray *v6;
  CFIndex v7;
  const __CFDictionary *ValueAtIndex;
  __CFDictionary *MutableCopy;
  const __CFDictionary *v10;
  const void *v11;
  const void *Name;
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v15;
  const void *v16;
  CFTypeID v17;
  const void *v18;
  const __CFBoolean *v19;
  CFTypeID v20;
  int v21;
  uint64_t v22;
  const void *v23;
  uint64_t v24;
  unsigned int Confidence;
  CFIndex v26;
  CFIndex v27;
  const __CFDictionary *v28;
  CFComparisonResult v29;
  const __CFDictionary *v30;
  const __CFDictionary *v31;
  const void *v32;
  CFTypeID v33;
  const void *v34;
  CFTypeID v35;
  NSObject *logger;
  os_log_type_t v37;
  uint64_t v38;
  CFIndex Count;
  uint8_t buf[16];

  DisplayID = (const void *)CNPluginStateGetDisplayID(a1);
  v38 = a1;
  FilterResults = CNPluginStateGetFilterResults(a1, *(const void **)a2);
  if (FilterResults)
  {
    v6 = FilterResults;
    Count = CFArrayGetCount(FilterResults);
    if (Count)
    {
      if (!*(_QWORD *)(a2 + 8))
        *(_QWORD *)(a2 + 8) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
      if (Count >= 1)
      {
        v7 = 0;
        while (1)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, v7);
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, ValueAtIndex);
          if (MutableCopy)
            break;
LABEL_37:
          if (Count == ++v7)
            return;
        }
        v10 = MutableCopy;
        if (DisplayID)
          CFDictionarySetValue(MutableCopy, CFSTR("PluginBundleID"), DisplayID);
        v11 = DisplayID;
        Name = (const void *)CNPluginStateGetName(v38);
        TypeID = CFDictionaryGetTypeID();
        if (CFGetTypeID(v10) == TypeID)
        {
          Value = CFDictionaryGetValue(v10, CFSTR("SSIDString"));
          v15 = CFStringGetTypeID();
          if (Value && CFGetTypeID(Value) != v15)
            Value = 0;
          v16 = CFDictionaryGetValue(v10, CFSTR("BSSID"));
          v17 = CFStringGetTypeID();
          if (v16)
          {
            if (CFGetTypeID(v16) == v17)
              v18 = v16;
            else
              v18 = 0;
          }
          else
          {
            v18 = 0;
          }
          v19 = (const __CFBoolean *)CFDictionaryGetValue(v10, CFSTR("IsProtected"));
          v20 = CFBooleanGetTypeID();
          if (v19 && CFGetTypeID(v19) == v20)
          {
            v21 = CFBooleanGetValue(v19);
            if (!Value)
              goto LABEL_36;
          }
          else
          {
            v21 = 0;
            if (!Value)
              goto LABEL_36;
          }
          if (!v18)
            goto LABEL_36;
          v22 = *(_QWORD *)(a2 + 48);
          if (v22)
          {
            if (v22 != v38 && *(unsigned __int8 *)(a2 + 40) == v21)
            {
              v23 = *(const void **)(a2 + 32);
              if (v23)
              {
                if (CFEqual(v23, Value))
                  goto LABEL_36;
              }
            }
          }
          v24 = CNPluginStateGetDisplayID(v38);
          Confidence = networkGetConfidence(v10, v24);
          v26 = CFArrayBSearchValues(*(CFArrayRef *)(a2 + 8), *(CFRange *)(a2 + 16), v10, (CFComparatorFunction)filterDictCompare, 0);
          if (v26 >= *(_QWORD *)(a2 + 24))
          {
            v30 = CFDictionaryCreateMutableCopy(0, 0, v10);
            filterDictAnnotate(v30, Name, Confidence);
            CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 8), v30);
            goto LABEL_35;
          }
          v27 = v26;
          v28 = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a2 + 8), v26);
          v29 = filterDictCompare(v10, v28);
          if (v29 == kCFCompareEqualTo)
          {
            v31 = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a2 + 8), v27);
            filterDictAnnotate(v31, Name, Confidence);
            v32 = CFDictionaryGetValue(v10, CFSTR("Password"));
            v33 = CFStringGetTypeID();
            if (v32 && CFGetTypeID(v32) == v33)
            {
              v34 = CFDictionaryGetValue(v31, CFSTR("Password"));
              v35 = CFStringGetTypeID();
              if (v34 && CFGetTypeID(v34) == v35)
              {
                if (!CFEqual(v32, v34))
                {
                  logger = mysyslog_get_logger();
                  v37 = _SC_syslog_os_log_mapping();
                  if (os_log_type_enabled(logger, v37))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_219EF1000, logger, v37, "Different passwords provided for the same network", buf, 2u);
                  }
                }
              }
              else
              {
                CFDictionarySetValue(v31, CFSTR("Password"), v32);
              }
            }
            goto LABEL_36;
          }
          if (v29 == kCFCompareLessThan)
          {
            v30 = CFDictionaryCreateMutableCopy(0, 0, v10);
            filterDictAnnotate(v30, Name, Confidence);
            CFArrayInsertValueAtIndex(*(CFMutableArrayRef *)(a2 + 8), v27, v30);
LABEL_35:
            CFRelease(v30);
            ++*(_QWORD *)(a2 + 24);
          }
        }
LABEL_36:
        CFRelease(v10);
        DisplayID = v11;
        goto LABEL_37;
      }
    }
  }
}

CFDictionaryRef createScanListProcessCommand(void *a1, CFArrayRef theArray)
{
  CFDictionaryRef v2;
  CFNumberRef v4;
  int valuePtr;
  void *values[4];
  void *keys[5];

  v2 = theArray;
  keys[4] = *(void **)MEMORY[0x24BDAC8D0];
  valuePtr = 1;
  if (theArray)
  {
    if (CFArrayGetCount(theArray))
    {
      keys[3] = 0;
      values[3] = 0;
      v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
      keys[0] = CFSTR("Type");
      keys[1] = CFSTR("InterfaceName");
      values[0] = v4;
      values[1] = a1;
      keys[2] = CFSTR("NetworkList");
      values[2] = v2;
      v2 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (v4)
        CFRelease(v4);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void CNScanListFilterSendClearResults(uint64_t a1)
{
  const __CFArray *v2;
  __CFString *BSDName;
  CFDictionaryRef ScanListProcessCommand;
  CFDictionaryRef v5;

  v2 = *(const __CFArray **)(a1 + 144);
  if (v2 && CFArrayGetCount(v2) >= 1)
  {
    BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    ScanListProcessCommand = createScanListProcessCommand(BSDName, *(CFArrayRef *)(a1 + 144));
    if (ScanListProcessCommand)
    {
      v5 = ScanListProcessCommand;
      CommandHandlerListApplyFunction(5u, (uint64_t)CNScanListFilterAppendCommandApplier, (uint64_t)ScanListProcessCommand);
      CFRelease(v5);
    }
    CFRelease(*(CFTypeRef *)(a1 + 144));
    *(_QWORD *)(a1 + 144) = 0;
  }
}

CFComparisonResult filterDictCompare(const __CFDictionary *a1, const __CFDictionary *a2)
{
  const __CFString *Value;
  const __CFString *v5;
  CFComparisonResult result;
  const __CFString *v7;
  const __CFString *v8;

  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("SSIDString"));
  v5 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("SSIDString"));
  result = CFStringCompare(Value, v5, 0);
  if (result == kCFCompareEqualTo)
  {
    v7 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("BSSID"));
    v8 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("BSSID"));
    return CFStringCompare(v7, v8, 0);
  }
  return result;
}

void filterDictAnnotate(const __CFDictionary *a1, const void *a2, unsigned int a3)
{
  const __CFArray *Value;
  const __CFArray *v7;
  CFAllocatorRef *v8;
  const __CFArray *Mutable;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  CFIndex v13;
  const void *ValueAtIndex;
  const void *v15;
  const __CFAllocator *v16;
  const CFArrayCallBacks *v17;
  CFNumberRef v18;
  unsigned int valuePtr;

  Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("PluginNames"));
  v7 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("__ConfidenceList"));
  v8 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (Value)
  {
    Mutable = v7;
    Count = CFArrayGetCount(Value);
    if (Count >= 1)
    {
      v11 = Count;
      v12 = 0;
      v13 = -1;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(Value, v12);
        if (CFEqual(ValueAtIndex, a2))
          return;
        if (v13 == -1)
        {
          v15 = CFArrayGetValueAtIndex(Mutable, v12);
          if (numberGetConfidence(v15) >= a3)
            v13 = -1;
          else
            v13 = v12;
        }
        if (v11 == ++v12)
          goto LABEL_13;
      }
    }
  }
  else
  {
    v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v17 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
    Value = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    CFDictionarySetValue(a1, CFSTR("PluginNames"), Value);
    CFRelease(Value);
    Mutable = CFArrayCreateMutable(v16, 0, v17);
    CFDictionarySetValue(a1, CFSTR("__ConfidenceList"), Mutable);
    CFRelease(Mutable);
  }
  v13 = -1;
LABEL_13:
  valuePtr = a3;
  v18 = CFNumberCreate(*v8, kCFNumberSInt32Type, &valuePtr);
  if (v13 == -1)
  {
    CFArrayAppendValue(Value, a2);
    CFArrayAppendValue(Mutable, v18);
  }
  else
  {
    CFArrayInsertValueAtIndex(Value, v13, a2);
    CFArrayInsertValueAtIndex(Mutable, v13, v18);
  }
  CFRelease(v18);
}

uint64_t NetworkArrayContainsNetwork(const __CFArray *a1, const __CFDictionary *a2)
{
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  const void *v9;
  uint64_t result;

  Count = CFArrayGetCount(a1);
  if (Count < 1)
    return 0;
  v5 = Count;
  v6 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v6);
    Value = CFDictionaryGetValue(a2, CFSTR("SSIDString"));
    v9 = CFDictionaryGetValue(ValueAtIndex, CFSTR("SSIDString"));
    result = CFEqual(Value, v9);
    if ((_DWORD)result == 1)
      break;
    if (v5 == ++v6)
      return 0;
  }
  return result;
}

void CNScanListFilterAppendCommandApplier(uint64_t a1, const void *a2)
{
  const __CFDictionary *Information;
  __CFArray *Value;
  CFMutableArrayRef Mutable;
  const void *v7;
  const void *v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  const __CFDictionary *ValueAtIndex;
  const void *v13;
  NSObject *logger;
  os_log_type_t v15;
  uint8_t v16[16];

  Information = (const __CFDictionary *)CommandHandlerGetInformation(a1);
  Value = (__CFArray *)CFDictionaryGetValue(Information, CFSTR("CommandList"));
  if (!Value)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    CNScanListFilterSetCommandList(a1, Mutable);
    CFRelease(Mutable);
LABEL_14:
    CFArrayAppendValue(Mutable, a2);
    CommandHandlerNotify(a1);
    return;
  }
  Mutable = Value;
  v7 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("InterfaceName"));
  if (v7)
  {
    v8 = v7;
    Count = CFArrayGetCount(Mutable);
    if (Count >= 1)
    {
      v10 = Count;
      v11 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Mutable, v11);
        v13 = CFDictionaryGetValue(ValueAtIndex, CFSTR("InterfaceName"));
        if (!v13 || CFEqual(v13, v8))
          break;
        if (v10 == ++v11)
          goto LABEL_14;
      }
      CFArrayRemoveValueAtIndex(Mutable, v11);
    }
    goto LABEL_14;
  }
  logger = mysyslog_get_logger();
  v15 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v15))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_219EF1000, logger, v15, "if_name is NULL", v16, 2u);
  }
}

void CNScanListFilterSetCommandList(uint64_t a1, const void *a2)
{
  __CFDictionary *Information;

  Information = (__CFDictionary *)CommandHandlerGetInformation(a1);
  if (Information)
  {
    if (a2)
      CFDictionarySetValue(Information, CFSTR("CommandList"), a2);
    else
      CFDictionaryRemoveValue(Information, CFSTR("CommandList"));
  }
}

void HandleInternetAccessProbeResult(uint64_t a1, unsigned int a2)
{
  NSObject *logger;
  os_log_type_t v5;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  unsigned int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a1 + 224) = 0;
  logger = mysyslog_get_logger();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    if (a2 > 0xA)
      v6 = "<unknown>";
    else
      v6 = off_24DC16DF0[a2];
    v7 = 136315394;
    v8 = v6;
    v9 = 1024;
    v10 = a2;
    _os_log_impl(&dword_219EF1000, logger, v5, "Internet Access Probe: result '%s' (%d)", (uint8_t *)&v7, 0x12u);
  }
  *(_BYTE *)(a1 + 217) = a2 == 0;
}

void _BrokenBackhaulMonitorComplete(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  NSObject *logger;
  os_log_type_t v5;
  CFStringRef BSDName;
  uint64_t v7;
  const char *v8;
  int v9;
  CFStringRef v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a1 + 56) == 4)
  {
    LOBYTE(v9) = (a2 & 2) != 0;
    if ((a2 & 1) != 0)
    {
      CNInfoAuthenticated(a1, 4, &v9);
    }
    else if (((a2 >> 1) & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      if (v3)
      {
        NetIFWiFiNetworkSetCaptive(v3, 8u);
        CNInfoUpdateWiFiNetwork(a1);
      }
    }
  }
  else
  {
    logger = mysyslog_get_logger();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      v7 = *(unsigned int *)(a1 + 56);
      if (v7 <= 8)
        v8 = AuthStateString_strings[v7];
      else
        v8 = "<unknown>";
      v9 = 138412546;
      v10 = BSDName;
      v11 = 2080;
      v12 = v8;
      _os_log_impl(&dword_219EF1000, logger, v5, "CNPluginHandler %@: probe completed in %s state, ignoring", (uint8_t *)&v9, 0x16u);
    }
  }
}

void CNInfoAddExcludedDisplayID(uint64_t a1, void *value)
{
  __CFArray *Mutable;

  Mutable = *(__CFArray **)(a1 + 96);
  if (!Mutable)
  {
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    *(_QWORD *)(a1 + 96) = Mutable;
  }
  CFArrayAppendValue(Mutable, value);
}

uint64_t CNPluginAuthorize(__int128 *a1)
{
  __int128 v2;
  uint64_t result;
  __int128 v4;
  NSObject *logger;
  os_log_type_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a1[1];
  v7 = *a1;
  v8 = v2;
  result = audit_token_has_BOOLean_entitlement(&v7, CFSTR("com.apple.developer.CaptiveNetworkPlugin"));
  if (!(_DWORD)result)
  {
    v4 = a1[1];
    v7 = *a1;
    v8 = v4;
    result = audit_token_has_BOOLean_entitlement(&v7, CFSTR("com.apple.developer.networking.HotspotHelper"));
    if (!(_DWORD)result)
    {
      logger = mysyslog_get_logger();
      v6 = _SC_syslog_os_log_mapping();
      result = os_log_type_enabled(logger, v6);
      if ((_DWORD)result)
      {
        LODWORD(v7) = 138412290;
        *(_QWORD *)((char *)&v7 + 4) = CFSTR("com.apple.developer.networking.HotspotHelper");
        _os_log_impl(&dword_219EF1000, logger, v6, "missing '%@' entitlement", (uint8_t *)&v7, 0xCu);
        return 0;
      }
    }
  }
  return result;
}

BOOL CNPluginRegister(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  const void *v7;
  _BOOL8 result;
  NSObject *logger;
  os_log_type_t v10;
  int PID;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = CNPluginStateRegister((uint64_t)a1);
  if (v2)
  {
    v3 = S_CNInfoHeadStorage;
    if (S_CNInfoHeadStorage)
    {
      v4 = v2;
      do
      {
        v5 = *(const void **)(v3 + 64);
        if (*(_DWORD *)(v3 + 56) == 2 && v5 != 0)
        {
          CNPluginStateSetEvaluateCommandStatus(v4, 0);
          CNPluginStateIssueCommand(v4, v5);
        }
        v7 = *(const void **)(v3 + 112);
        if (v7)
          CNPluginStateIssueCommand(v4, v7);
        v3 = *(_QWORD *)v3;
      }
      while (v3);
    }
    return 1;
  }
  else
  {
    logger = mysyslog_get_logger();
    v10 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(logger, v10);
    if (result)
    {
      PID = CommandHandlerGetPID(*a1);
      v12[0] = 67109120;
      v12[1] = PID;
      _os_log_impl(&dword_219EF1000, logger, v10, "failed to register pid %d", (uint8_t *)v12, 8u);
      return 0;
    }
  }
  return result;
}

void CNPluginRemove(uint64_t a1)
{
  void *Information;
  const void *v2;

  Information = (void *)CommandHandlerGetInformation(a1);
  v2 = CNPluginStateGet(Information);
  if (v2)
    CNPluginStateSetNotRunning((uint64_t)v2);
}

uint64_t CNPluginProvideCommand(uint64_t *a1)
{
  void *Information;
  const void *v3;

  Information = (void *)CommandHandlerGetInformation(*a1);
  v3 = CNPluginStateGet(Information);
  if (v3)
    a1[1] = (uint64_t)CNPluginStateCopyCommandList((uint64_t)v3);
  return 1;
}

const void *CNPluginProcessResponse(uint64_t a1)
{
  void *Information;
  const void *result;

  Information = (void *)CommandHandlerGetInformation(*(_QWORD *)a1);
  result = CNPluginStateGet(Information);
  if (result)
    return (const void *)CNPluginHandleResponse((uint64_t)result, *(const __CFDictionary **)(a1 + 8));
  return result;
}

uint64_t CNPluginProcessControl(uint64_t a1)
{
  void *Information;
  uint64_t result;
  uint64_t v4;
  const void *Value;
  CFTypeID TypeID;
  const __CFDictionary *v7;
  const void *v8;
  CFTypeID v9;
  uint64_t v10;
  const void *v11;
  CFTypeID v12;
  const void *v13;
  CFTypeID v14;
  uint64_t v15;
  __CFArray *Mutable;
  uint64_t v17;
  const __CFAllocator *v18;
  const CFArrayCallBacks *v19;
  CFStringRef BSDName;
  const void *v21;
  const void *v22;
  __CFString *v23;
  CFDictionaryRef AuthCommand;
  int valuePtr;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;

  Information = (void *)CommandHandlerGetInformation(*(_QWORD *)a1);
  result = (uint64_t)CNPluginStateGet(Information);
  if (result)
  {
    v4 = result;
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), CFSTR("Type"));
    TypeID = CFNumberGetTypeID();
    if (!Value || CFGetTypeID(Value) != TypeID)
      return 0;
    valuePtr = 0;
    result = CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr);
    if (!(_DWORD)result)
      return result;
    if (valuePtr == 2)
    {
      v15 = S_CNInfoHeadStorage;
      if (S_CNInfoHeadStorage)
      {
        Mutable = 0;
        v17 = *MEMORY[0x24BDBD270];
        v18 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v19 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
        do
        {
          v27 = 0u;
          v28 = 0u;
          memset(v26, 0, sizeof(v26));
          BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(v15 + 32));
          if (*(_QWORD *)(v15 + 72) == v4)
            v21 = (const void *)NetIFCopyCurrentWiFiNetworkWithSignal((uint64_t)BSDName);
          else
            v21 = (const void *)NetIFCopyCurrentWiFiNetwork((uint64_t)BSDName);
          v22 = v21;
          networkAttributesInit(v26, v21, 1, 0);
          if (*(_QWORD *)(v15 + 72) == v4)
            *((_QWORD *)&v27 + 1) = v17;
          v23 = (__CFString *)SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(v15 + 32));
          AuthCommand = createAuthCommand(v23, 0, (uint64_t *)v26);
          networkAttributesRelease((uint64_t)v26);
          if (v22)
            CFRelease(v22);
          if (!Mutable)
            Mutable = CFArrayCreateMutable(v18, 0, v19);
          CFArrayAppendValue(Mutable, AuthCommand);
          CFRelease(AuthCommand);
          v15 = *(_QWORD *)v15;
        }
        while (v15);
      }
      else
      {
        Mutable = 0;
      }
      *(_QWORD *)(a1 + 16) = Mutable;
      return 1;
    }
    if (valuePtr != 1)
      return 0;
    v7 = *(const __CFDictionary **)(a1 + 8);
    v8 = CFDictionaryGetValue(v7, CFSTR("InterfaceName"));
    v9 = CFStringGetTypeID();
    if (!v8 || CFGetTypeID(v8) != v9)
      return 0;
    result = (uint64_t)CNInfoFind(v8);
    if (!result)
      return result;
    v10 = result;
    if (*(_QWORD *)(result + 72) != v4)
      return 0;
    if (*(_DWORD *)(result + 56) != 4)
      return 0;
    v11 = CFDictionaryGetValue(v7, CFSTR("Network"));
    v12 = CFDictionaryGetTypeID();
    if (!v11 || CFGetTypeID(v11) != v12)
      return 0;
    if (!*(_QWORD *)(v10 + 40))
    {
LABEL_19:
      CNInfoLoggingOff(v10, 0);
      return 1;
    }
    v13 = CFDictionaryGetValue((CFDictionaryRef)v11, CFSTR("SSID"));
    v14 = CFDataGetTypeID();
    if (v13 && CFGetTypeID(v13) == v14)
    {
      result = WiFiNetworkGetSSIDData();
      if (result)
      {
        result = CFEqual(v13, (CFTypeRef)result);
        if ((_DWORD)result)
          goto LABEL_19;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const void *CNPluginProcessAck(uint64_t a1)
{
  void *Information;
  const void *result;

  Information = (void *)CommandHandlerGetInformation(*(_QWORD *)a1);
  result = CNPluginStateGet(Information);
  if (result)
    return (const void *)CNPluginStateProcessCmdAck((uint64_t)result, *(CFDictionaryRef *)(a1 + 8));
  return result;
}

uint64_t CNScanListFilterAuthorize(_OWORD *a1)
{
  __int128 v1;
  uint64_t has_BOOLean_entitlement;
  NSObject *logger;
  os_log_type_t v4;
  _OWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = a1[1];
  v6[0] = *a1;
  v6[1] = v1;
  has_BOOLean_entitlement = audit_token_has_BOOLean_entitlement(v6, CFSTR("com.apple.wifi.manager-access"));
  if (!(_DWORD)has_BOOLean_entitlement)
  {
    logger = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      LODWORD(v6[0]) = 138412290;
      *(_QWORD *)((char *)v6 + 4) = CFSTR("com.apple.wifi.manager-access");
      _os_log_impl(&dword_219EF1000, logger, v4, "missing '%@' entitlement", (uint8_t *)v6, 0xCu);
    }
  }
  return has_BOOLean_entitlement;
}

uint64_t CNScanListFilterRegister(uint64_t *a1)
{
  CFMutableDictionaryRef Mutable;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CommandHandlerSetInformation(*a1, Mutable);
  CFRelease(Mutable);
  return 1;
}

void CNScanListFilterRemove(uint64_t a1)
{
  CNScanListFilterSetIsEnabled(a1, 0);
}

uint64_t CNScanListFilterProvideCommand(uint64_t *a1)
{
  const __CFDictionary *Information;
  const void *Value;
  __CFDictionary *v4;

  Information = (const __CFDictionary *)CommandHandlerGetInformation(*a1);
  Value = CFDictionaryGetValue(Information, CFSTR("CommandList"));
  if (Value)
  {
    a1[1] = (uint64_t)CFRetain(Value);
    v4 = (__CFDictionary *)CommandHandlerGetInformation(*a1);
    if (v4)
      CFDictionaryRemoveValue(v4, CFSTR("CommandList"));
  }
  return 1;
}

uint64_t CNScanListFilterProcessResponse()
{
  return 1;
}

uint64_t CNScanListFilterProcessControl(uint64_t a1)
{
  const __CFNumber *Value;
  CFTypeID TypeID;
  uint64_t result;
  int v5;
  int valuePtr;

  Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), CFSTR("Type"));
  TypeID = CFNumberGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
  {
    valuePtr = 0;
    result = CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
    if (!(_DWORD)result)
      return result;
    if (valuePtr == 1)
    {
      v5 = 1;
      goto LABEL_10;
    }
    if (valuePtr == 2)
    {
      v5 = 0;
LABEL_10:
      CNScanListFilterSetIsEnabled(*(_QWORD *)a1, v5);
      return 1;
    }
  }
  return 0;
}

void CNScanListFilterSetIsEnabled(uint64_t a1, int a2)
{
  const __CFDictionary *Information;
  __CFDictionary *v5;
  NSObject *logger;
  os_log_type_t v7;
  _BOOL4 v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t i;
  CFStringRef BSDName;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t j;
  CFStringRef v16;
  int v17;
  int PID;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  Information = (const __CFDictionary *)CommandHandlerGetInformation(a1);
  if (Information)
  {
    v5 = Information;
    if (CFDictionaryContainsKey(Information, CFSTR("IsEnabled")) != a2)
    {
      logger = mysyslog_get_logger();
      v7 = _SC_syslog_os_log_mapping();
      v8 = os_log_type_enabled(logger, v7);
      if (a2)
      {
        if (v8)
        {
          v17 = 67109120;
          PID = CommandHandlerGetPID(a1);
          _os_log_impl(&dword_219EF1000, logger, v7, "ScanListFilter ENABLE [pid %d]", (uint8_t *)&v17, 8u);
        }
        CFDictionarySetValue(v5, CFSTR("IsEnabled"), (const void *)*MEMORY[0x24BDBD270]);
        if (!S_filter_request_count)
        {
          v9 = mysyslog_get_logger();
          v10 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v9, v10))
          {
            LOWORD(v17) = 0;
            _os_log_impl(&dword_219EF1000, v9, v10, "START monitoring scan results", (uint8_t *)&v17, 2u);
          }
          for (i = S_CNInfoHeadStorage; i; i = *(_QWORD *)i)
          {
            *(_DWORD *)(i + 128) = 0;
            BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(i + 32));
            NetIFEnableScanResults((uint64_t)BSDName);
          }
        }
        ++S_filter_request_count;
      }
      else
      {
        if (v8)
        {
          v17 = 67109120;
          PID = CommandHandlerGetPID(a1);
          _os_log_impl(&dword_219EF1000, logger, v7, "ScanListFilter DISABLE [pid %d]", (uint8_t *)&v17, 8u);
        }
        CFDictionaryRemoveValue(v5, CFSTR("IsEnabled"));
        if (!--S_filter_request_count)
        {
          v13 = mysyslog_get_logger();
          v14 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v13, v14))
          {
            LOWORD(v17) = 0;
            _os_log_impl(&dword_219EF1000, v13, v14, "STOP monitoring scan results", (uint8_t *)&v17, 2u);
          }
          CNPluginStateListApplyFunction((uint64_t)CNScanListFilterFlushResultsApplier, 0);
          for (j = S_CNInfoHeadStorage; j; j = *(_QWORD *)j)
          {
            v16 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(j + 32));
            NetIFDisableScanResults((uint64_t)v16);
            CNInfoFlushFilterCommand(j);
          }
        }
      }
    }
  }
}

void CNInfoFlushFilterCommand(uint64_t a1)
{
  uint64_t v1;
  const void **v2;

  v2 = (const void **)(a1 + 112);
  v1 = *(_QWORD *)(a1 + 112);
  if (v1)
  {
    CNPluginStateListRemoveCommand(v1);
    my_FieldSetRetainedCFType(v2, 0);
  }
}

void CNScanListFilterFlushResultsApplier(uint64_t a1, void *a2)
{
  CNPluginStateSetFilterResults(a1, a2, 0);
}

void CNPluginHandlerNetworkInformationChanged()
{
  uint64_t v0;
  NSObject *logger;
  os_log_type_t v2;
  CFDictionaryRef v3;
  uint64_t v4;
  uint64_t ifstate;
  uint64_t v6;
  uint64_t v7;
  int v8;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  CFStringRef BSDName;
  const __CFDictionary *v16;
  int v17;
  int v18;
  NSObject *v19;
  os_log_type_t v20;
  CFStringRef v21;
  const char *v22;
  uint64_t v23;
  int v24;
  int v25;
  const void *v26;
  NSObject *v27;
  os_log_type_t v28;
  __CFRunLoop *Current;
  __CFRunLoop *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t buf[4];
  CFStringRef v34;
  __int16 v35;
  const char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v0 = nwi_state_copy();
  if (!v0)
  {
    logger = mysyslog_get_logger();
    v2 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v2))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, logger, v2, "nwi_state_copy returned NULL", buf, 2u);
    }
  }
  v3 = NetIFCopyAllServiceInformation();
  v4 = S_CNInfoHeadStorage;
  if (S_CNInfoHeadStorage)
  {
    while (1)
    {
      if (v0)
      {
        ifstate = nwi_state_get_ifstate();
        if (ifstate)
          LOBYTE(ifstate) = nwi_ifstate_get_flags();
      }
      else
      {
        LOBYTE(ifstate) = 0;
      }
      v6 = ifstate & 5;
      v7 = ifstate & 6;
      v8 = *(_DWORD *)(v4 + 232);
      v10 = v6 == 5 || v7 == 6;
      v11 = ~(_BYTE)ifstate & 7;
      v12 = mysyslog_get_logger();
      v13 = _SC_syslog_os_log_mapping();
      v14 = os_log_type_enabled(v12, v13);
      if (v11)
      {
        if (v6 == 5)
        {
          if (v14)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219EF1000, v12, v13, "received nwi state change notification for DNS with IPv4", buf, 2u);
          }
          if (v8 == 1)
          {
LABEL_66:
            v31 = mysyslog_get_logger();
            v32 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v31, v32))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219EF1000, v31, v32, "IPv6 Only probe is in progress, setting evaluation retry flag", buf, 2u);
            }
            *(_DWORD *)(v4 + 104) |= 2u;
            if (!v3)
              goto LABEL_63;
LABEL_62:
            CFRelease(v3);
            goto LABEL_63;
          }
          goto LABEL_35;
        }
        if (v7 == 6)
        {
          if (v14)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219EF1000, v12, v13, "received nwi state change notification for DNS with IPv6", buf, 2u);
          }
          if (v8 != 3)
          {
            if (!v8)
              *(_DWORD *)(v4 + 232) = 1;
LABEL_35:
            BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(v4 + 32));
            v16 = NetIFCopySignatures(v3, (uint64_t)BSDName);
            v17 = 0;
            v18 = 1;
            goto LABEL_37;
          }
        }
        else
        {
          if (v14)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_219EF1000, v12, v13, "received nwi state change notification with no DNS", buf, 2u);
          }
          *(_DWORD *)(v4 + 104) &= ~2u;
          *(_DWORD *)(v4 + 232) = 0;
          if (v10)
            goto LABEL_35;
        }
      }
      else
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_219EF1000, v12, v13, "received nwi state change notification for DNS with dual stack", buf, 2u);
        }
        if (v8 == 1)
          goto LABEL_66;
        if (v10)
          goto LABEL_35;
      }
      v18 = 0;
      v16 = 0;
      v17 = 1;
LABEL_37:
      v19 = mysyslog_get_logger();
      v20 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(v4 + 32));
        *(_DWORD *)buf = 138412546;
        v22 = "is not active";
        if (v18)
          v22 = "is active";
        v34 = v21;
        v35 = 2080;
        v36 = v22;
        _os_log_impl(&dword_219EF1000, v19, v20, "interface %@ %s", buf, 0x16u);
      }
      if (v17)
      {
        CNInfoInactive(v4);
        if (!v16)
          goto LABEL_56;
        goto LABEL_55;
      }
      v23 = *(_QWORD *)(v4 + 48);
      if (!v16)
      {
        v25 = *(_DWORD *)(v4 + 56);
        my_FieldSetRetainedCFType((const void **)(v4 + 48), 0);
        if (v25 != 1 && !v23)
          goto LABEL_56;
        goto LABEL_52;
      }
      if (!v23)
      {
        my_FieldSetRetainedCFType((const void **)(v4 + 48), v16);
LABEL_52:
        v26 = *(const void **)(v4 + 96);
        if (v26)
        {
          CFRelease(v26);
          *(_QWORD *)(v4 + 96) = 0;
        }
        CNInfoStopBrokenBackhaulMonitor(v4);
        *(_DWORD *)(v4 + 104) &= ~2u;
        CNInfoNetworkActive(v4);
        if (!v16)
          goto LABEL_56;
        goto LABEL_55;
      }
      v24 = my_CFArrayContainsAnyArrayValues(*(CFArrayRef *)(v4 + 48), v16);
      my_FieldSetRetainedCFType((const void **)(v4 + 48), v16);
      if (!v24)
        goto LABEL_52;
LABEL_55:
      CFRelease(v16);
LABEL_56:
      v4 = *(_QWORD *)v4;
      if (!v4)
        goto LABEL_61;
    }
  }
  v27 = mysyslog_get_logger();
  v28 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v27, v28))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219EF1000, v27, v28, "no Wi-Fi interfaces found", buf, 2u);
  }
  Current = CFRunLoopGetCurrent();
  CFRunLoopPerformBlock(Current, (CFTypeRef)*MEMORY[0x24BDBD5A0], &__block_literal_global_2);
  v30 = CFRunLoopGetCurrent();
  CFRunLoopWakeUp(v30);
LABEL_61:
  if (v3)
    goto LABEL_62;
LABEL_63:
  if (v0)
    nwi_state_release();
}

void CNInfoNetworkActive(uint64_t a1)
{
  const void *v2;
  CFStringRef BSDName;
  uint64_t v4;
  uint64_t SSID;
  uint64_t v6;
  CFStringRef v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  _BOOL4 IsCarPlayOnly;
  NSObject *logger;
  os_log_type_t v12;
  CFStringRef v13;
  const char *v14;
  CFStringRef v15;
  _BOOL4 IsProtected;
  uint64_t *CacheEntry;
  uint64_t *v18;
  void *Information;
  const void *v20;
  _BOOL4 v21;
  char v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  CFStringRef v26;
  _BOOL4 IsCarPlayAndInternet;
  _BOOL4 v28;
  NSObject *v29;
  os_log_type_t v30;
  CFStringRef v31;
  const char *v32;
  const char *v33;
  const __SCNetworkInterface *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  CFStringRef v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v36 = 0;
  v37 = 0;
  BSDName = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
  v4 = NetIFCopyCurrentWiFiNetwork((uint64_t)BSDName);
  *(_QWORD *)(a1 + 40) = v4;
  if (v4 && (SSID = WiFiNetworkGetSSID(), *(_QWORD *)(a1 + 40)) && (v6 = SSID) != 0)
  {
    v7 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    v8 = networkCopyCaptivePortalAPIURL((uint64_t)v7);
    if (v8)
    {
      v9 = v8;
      NetIFWiFiNetworkSetCaptivePortalAPIURL(*(_QWORD *)(a1 + 40), v8);
      CFRelease(v9);
    }
    if (!NetIFWiFiNetworkIsCarPlay())
      goto LABEL_14;
    IsCarPlayOnly = NetIFWiFiNetworkIsCarPlayOnly();
    logger = mysyslog_get_logger();
    v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v12))
    {
      v13 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      v14 = "CarPlay Only";
      *(_DWORD *)buf = 138412802;
      v39 = v13;
      if (!IsCarPlayOnly)
        v14 = "CarPlay And Internet";
      v40 = 2112;
      v41 = v6;
      v42 = 2080;
      v43 = v14;
      _os_log_impl(&dword_219EF1000, logger, v12, "%@: device is associated to CarPlay network SSID '%@' in %s mode", buf, 0x20u);
    }
    v15 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
    NetIFSetCarPlayModeChangeCallBack((uint64_t)v15, (uint64_t (*)(_QWORD, _QWORD))CNPluginHandlerCarPlayModeChange);
    if (!IsCarPlayOnly)
    {
LABEL_14:
      IsProtected = NetIFWiFiNetworkIsProtected(*(_QWORD *)(a1 + 40));
      CacheEntry = CNInfoGetCacheEntry(a1);
      if (CacheEntry)
      {
        v18 = CacheEntry;
        if (NetCacheEntryGetIsCaptive((uint64_t)CacheEntry))
        {
          Information = (void *)CommandHandlerGetInformation((uint64_t)v18);
          if (Information && (v20 = CNPluginStateGet(Information)) != 0)
          {
            my_FieldSetRetainedCFType((const void **)(a1 + 72), v20);
            v21 = 0;
            *(_DWORD *)(a1 + 80) = 2;
            v22 = 1;
            v23 = "cached captive network";
          }
          else
          {
            NetCacheEntryDestroy(v18);
            v21 = 0;
            v22 = 0;
            v23 = "plugin no longer present";
          }
        }
        else
        {
          v22 = 0;
          v21 = 1;
          v23 = "cache indicates network not captive";
        }
      }
      else
      {
        v22 = 0;
        v21 = IsProtected;
        if (IsProtected)
          v23 = "protected network";
        else
          v23 = "no cache entry";
      }
      IsCarPlayAndInternet = NetIFWiFiNetworkIsCarPlayAndInternet();
      v28 = !IsCarPlayAndInternet && v21;
      v29 = mysyslog_get_logger();
      v30 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
        v32 = "Default";
        if (!v28)
          v32 = "Never";
        *(_DWORD *)buf = 138413058;
        v39 = v31;
        v40 = 2112;
        v41 = v6;
        v42 = 2080;
        v43 = v32;
        if (IsCarPlayAndInternet)
          v33 = "CarPlay Wi-Fi network";
        else
          v33 = v23;
        v44 = 2080;
        v45 = v33;
        _os_log_impl(&dword_219EF1000, v29, v30, "%@: SSID '%@' setting interface rank %s (%s)", buf, 0x2Au);
      }
      v34 = *(const __SCNetworkInterface **)(a1 + 32);
      if (v28)
        NetIFSetRankDefault(v34);
      else
        NetIFSetRankNever(v34);
      PassiveDetectNewNetwork();
      v36 = *MEMORY[0x24BDBD270];
      v37 = 0;
      v35 = *(_QWORD *)(a1 + 224);
      *(_BYTE *)(a1 + 162) = 0;
      *(_OWORD *)(a1 + 164) = 0u;
      *(_OWORD *)(a1 + 180) = 0u;
      *(_QWORD *)(a1 + 200) = 0;
      *(_QWORD *)(a1 + 208) = 0;
      *(_BYTE *)(a1 + 216) = 0;
      if (v35)
      {
        captive_agent_abort_probe((_QWORD *)(a1 + 224));
        *(_QWORD *)(a1 + 224) = 0;
      }
      if ((v22 & 1) != 0)
        CNInfoMaintaining(a1, 0, (uint64_t)&v36);
      else
        CNInfoEvaluating(a1, 0, (uint64_t)&v36);
    }
  }
  else
  {
    v24 = mysyslog_get_logger();
    v25 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = SCNetworkInterfaceGetBSDName(*(SCNetworkInterfaceRef *)(a1 + 32));
      *(_DWORD *)buf = 138412290;
      v39 = v26;
      _os_log_impl(&dword_219EF1000, v24, v25, "%@: WiFi network or SSID is NULL", buf, 0xCu);
    }
    CNInfoInactive(a1);
  }
}

void CNPluginHandlerCarPlayModeChange(int a1, uint64_t a2)
{
  NSObject *logger;
  os_log_type_t v5;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v5))
  {
    v6 = "CarPlay And Internet";
    if (!a1)
      v6 = "CarPlay Only Mode";
    v7 = 136315138;
    v8 = v6;
    _os_log_impl(&dword_219EF1000, logger, v5, "CarPlay mode changed to %s", (uint8_t *)&v7, 0xCu);
  }
  if (a1)
    CNInfoNetworkActive(a2);
  else
    CNInfoInactive(a2);
}

void *CNInfoGet(const __CFString *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *logger;
  os_log_type_t v8;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = CNInfoFind(a1);
  if (!v2)
  {
    v3 = NetIFCopyNetworkInterface();
    if (v3)
    {
      v4 = v3;
      v2 = malloc_type_malloc(0xF0uLL, 0x10E00408D8FEEA8uLL);
      *(_OWORD *)v2 = 0u;
      *((_OWORD *)v2 + 2) = 0u;
      *((_OWORD *)v2 + 3) = 0u;
      *((_OWORD *)v2 + 4) = 0u;
      *((_OWORD *)v2 + 5) = 0u;
      *((_OWORD *)v2 + 6) = 0u;
      *((_OWORD *)v2 + 7) = 0u;
      *((_OWORD *)v2 + 8) = 0u;
      *((_OWORD *)v2 + 9) = 0u;
      *((_OWORD *)v2 + 10) = 0u;
      *((_OWORD *)v2 + 11) = 0u;
      *((_OWORD *)v2 + 12) = 0u;
      *((_OWORD *)v2 + 13) = 0u;
      *((_OWORD *)v2 + 14) = 0u;
      *((_OWORD *)v2 + 1) = 0u;
      *((_QWORD *)v2 + 4) = v4;
      CFStringGetCString(a1, (char *)v2 + 16, 16, 0x600u);
      v5 = S_CNInfoHeadStorage;
      *(_QWORD *)v2 = S_CNInfoHeadStorage;
      if (v5)
        *(_QWORD *)(v5 + 8) = v2;
      S_CNInfoHeadStorage = (uint64_t)v2;
      *((_QWORD *)v2 + 1) = &S_CNInfoHeadStorage;
      TimerCreate();
      *((_QWORD *)v2 + 11) = v6;
      *((_QWORD *)v2 + 17) = NetCacheCreate();
    }
    else
    {
      logger = mysyslog_get_logger();
      v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v8))
      {
        v10 = 138412290;
        v11 = a1;
        _os_log_impl(&dword_219EF1000, logger, v8, "NetIFCopyNetworkInterface(%@) failed", (uint8_t *)&v10, 0xCu);
      }
      return 0;
    }
  }
  return v2;
}

uint64_t CNPluginStateIsBuiltin(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t CNPluginStateSetEvaluateCommandStatus(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 112) != 3)
    *(_DWORD *)(result + 112) = a2;
  return result;
}

uint64_t CNPluginStateGetDisplayID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t CNPluginStateGetName(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

const void *CNPluginStateGet(void *key)
{
  const void *result;

  result = (const void *)S_plugins;
  if (S_plugins)
    return CFDictionaryGetValue((CFDictionaryRef)S_plugins, key);
  return result;
}

void CNPluginStateListInitialize()
{
  const __SCPreferences *v0;
  CFPropertyListRef Value;
  CFTypeID TypeID;
  CFRunLoopRef Current;
  __CFNotificationCenter *DistributedCenter;
  NSObject *logger;
  os_log_type_t v6;
  uint8_t v7[16];

  v0 = (const __SCPreferences *)prefs_get();
  if (v0)
  {
    Value = SCPreferencesGetValue(v0, CFSTR("Plugins"));
    TypeID = CFDictionaryGetTypeID();
    if (Value && CFGetTypeID(Value) == TypeID)
    {
      CFRetain(Value);
      CFDictionaryApplyFunction((CFDictionaryRef)Value, (CFDictionaryApplierFunction)CNPluginStateLoadApplier, 0);
      CFRelease(Value);
    }
    Current = CFRunLoopGetCurrent();
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    if (DistributedCenter)
    {
      CFNotificationCenterAddObserver(DistributedCenter, Current, (CFNotificationCallback)AppUninstallationCallback, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0, CFNotificationSuspensionBehaviorCoalesce);
    }
    else
    {
      logger = mysyslog_get_logger();
      v6 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v6))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_219EF1000, logger, v6, "failed to get the distributed notification center", v7, 2u);
      }
    }
  }
}

uint64_t prefs_get()
{
  NSObject *logger;
  os_log_type_t v1;
  int v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!prefs_get_S_prefs)
  {
    prefs_get_S_prefs = (uint64_t)SCPreferencesCreate(0, CFSTR("com.apple.captive.plugins.plist"), CFSTR("com.apple.captive.plugins.plist"));
    if (!prefs_get_S_prefs)
    {
      logger = mysyslog_get_logger();
      v1 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v1))
      {
        v2 = SCError();
        v4 = 136315138;
        v5 = SCErrorString(v2);
        _os_log_impl(&dword_219EF1000, logger, v1, "SCPreferencesCreate failed: %s", (uint8_t *)&v4, 0xCu);
      }
    }
  }
  return prefs_get_S_prefs;
}

uint64_t CNPluginStateBuiltinRegister(uint64_t a1)
{
  NSObject *logger;
  os_log_type_t v3;
  uint64_t v4;
  __CFRunLoop *Current;
  CFRunLoopSourceContext v7;

  if (S_plugins && CFDictionaryGetValue((CFDictionaryRef)S_plugins, CFSTR("__BUILTIN__")))
  {
    logger = mysyslog_get_logger();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      LOWORD(v7.version) = 0;
      _os_log_impl(&dword_219EF1000, logger, v3, "built-in already registered", (uint8_t *)&v7, 2u);
    }
    return 0;
  }
  else
  {
    v4 = CNPluginStateAdd(CFSTR("__BUILTIN__"));
    *(_BYTE *)(v4 + 16) = 1;
    *(_QWORD *)(v4 + 32) = CFRetain(CFSTR("__NAME__"));
    *(_QWORD *)(v4 + 72) = a1;
    v7.version = 0;
    memset(&v7.retain, 0, 56);
    v7.info = (void *)v4;
    v7.perform = (void (__cdecl *)(void *))CNPluginStateBuiltinProcessSource;
    *(_QWORD *)(v4 + 80) = CFRunLoopSourceCreate(0, 0, &v7);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)(v4 + 80), (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  }
  return v4;
}

uint64_t CNPluginStateAdd(const void *a1)
{
  uint64_t Instance;
  __CFDictionary *Mutable;

  if (!__kCNPluginStateTypeID)
    __kCNPluginStateTypeID = _CFRuntimeRegisterClass();
  Instance = _CFRuntimeCreateInstance();
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 80) = 0u;
  *(_OWORD *)(Instance + 96) = 0u;
  *(_QWORD *)(Instance + 112) = 0;
  *(_QWORD *)(Instance + 24) = CFRetain(a1);
  Mutable = (__CFDictionary *)S_plugins;
  if (!S_plugins)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    S_plugins = (uint64_t)Mutable;
  }
  CFDictionarySetValue(Mutable, a1, (const void *)Instance);
  CFRelease((CFTypeRef)Instance);
  return Instance;
}

void CNPluginStateBuiltinProcessSource(uint64_t a1)
{
  const void *v2;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v8;
  const __CFArray *v9;
  CFIndex v10;
  CFIndex v11;
  CFIndex j;
  const __CFDictionary *v13;
  const void *Value;
  NSObject *logger;
  os_log_type_t v16;
  uint8_t v17[16];

  if (*(_BYTE *)(a1 + 16))
  {
    if (*(_QWORD *)(a1 + 104))
    {
      CNPluginHandleBuiltinEvaluateAck(a1);
      v2 = *(const void **)(a1 + 104);
      if (v2)
      {
        CFRelease(v2);
        *(_QWORD *)(a1 + 104) = 0;
      }
    }
    v3 = *(const __CFArray **)(a1 + 96);
    if (v3)
    {
      Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 96));
      if (Count >= 1)
      {
        v5 = Count;
        for (i = 0; i != v5; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v3, i);
          CNPluginHandleBuiltinResponse(a1, ValueAtIndex);
        }
      }
      v8 = *(const void **)(a1 + 96);
      if (v8)
      {
        CFRelease(v8);
        *(_QWORD *)(a1 + 96) = 0;
      }
    }
    v9 = *(const __CFArray **)(a1 + 56);
    if (v9)
    {
      v10 = CFArrayGetCount(*(CFArrayRef *)(a1 + 56));
      if (v10 >= 1)
      {
        v11 = v10;
        for (j = 0; j != v11; ++j)
        {
          v13 = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, j);
          Value = CFDictionaryGetValue(v13, CFSTR("UniqueID"));
          if (my_CFArrayPointerAddValue((CFArrayRef *)(a1 + 88), Value))
            (*(void (**)(const __CFDictionary *))(a1 + 72))(v13);
        }
      }
    }
  }
  else
  {
    logger = mysyslog_get_logger();
    v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v16))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_219EF1000, logger, v16, "non-builtin trying to be builtin", v17, 2u);
    }
  }
}

void CNPluginStateBuiltinProvideResponse(uint64_t a1, const void *a2)
{
  __CFRunLoopSource *v3;
  NSObject *logger;
  os_log_type_t v5;
  uint8_t v6[16];

  if (*(_BYTE *)(a1 + 16))
  {
    my_CFArrayPointerAddValue((CFArrayRef *)(a1 + 96), a2);
    if (*(_BYTE *)(a1 + 16))
    {
      v3 = *(__CFRunLoopSource **)(a1 + 80);
      if (v3)
        CFRunLoopSourceSignal(v3);
    }
  }
  else
  {
    logger = mysyslog_get_logger();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_219EF1000, logger, v5, "non-builtin trying to provide response", v6, 2u);
    }
  }
}

void CNPluginStateBuiltinAckEvaluateCommand(uint64_t a1, const void *a2)
{
  __CFRunLoopSource *v3;
  NSObject *logger;
  os_log_type_t v5;
  uint8_t v6[16];

  if (*(_BYTE *)(a1 + 16))
  {
    my_FieldSetRetainedCFType((const void **)(a1 + 104), a2);
    if (*(_BYTE *)(a1 + 16))
    {
      v3 = *(__CFRunLoopSource **)(a1 + 80);
      if (v3)
        CFRunLoopSourceSignal(v3);
    }
  }
  else
  {
    logger = mysyslog_get_logger();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_219EF1000, logger, v5, "non-builtin trying to ack", v6, 2u);
    }
  }
}

uint64_t CNPluginStateRegister(uint64_t a1)
{
  uint64_t PID;
  uint64_t v3;
  const void *v4;
  const void *v5;
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v8;
  const __CFArray *v9;
  const __CFArray *v10;
  CFTypeID v11;
  int v12;
  _BYTE *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  NSObject *logger;
  os_log_type_t v21;
  NSObject *v22;
  os_log_type_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  const __SCPreferences *v28;
  const __SCPreferences *v29;
  const __CFDictionary *entry_and_plugins;
  CFAbsoluteTime Current;
  CFDateRef v32;
  __CFDictionary *MutableCopy;
  NSObject *v34;
  os_log_type_t v35;
  __CFDictionary *v36;
  NSObject *v37;
  os_log_type_t v38;
  const void *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t v42[16];
  _BYTE buf[12];
  __int16 v44;
  const void *v45;
  uint64_t v46;
  CFRange v47;

  v46 = *MEMORY[0x24BDAC8D0];
  PID = CommandHandlerGetPID(*(_QWORD *)a1);
  v3 = DisplayIDCopy();
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = *(const void **)(a1 + 8);
    TypeID = CFDictionaryGetTypeID();
    if (v5
      && CFGetTypeID(v5) == TypeID
      && (Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), CFSTR("DisplayName")),
          v8 = CFStringGetTypeID(),
          Value)
      && CFGetTypeID(Value) == v8)
    {
      CFRetain(Value);
    }
    else
    {
      Value = _AMCopyLocalizedApplicationNameForDisplayIdentifier((uint64_t)v4);
      if (!Value)
      {
        logger = mysyslog_get_logger();
        v21 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v21))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v4;
          v44 = 1024;
          LODWORD(v45) = PID;
          _os_log_impl(&dword_219EF1000, logger, v21, "can't get application name for %@ (%d)", buf, 0x12u);
        }
        goto LABEL_26;
      }
    }
    v9 = (const __CFArray *)_AMCopyBackgroundModesForPID(PID);
    if (v9)
    {
      v10 = v9;
      v11 = CFArrayGetTypeID();
      if (CFGetTypeID(v10) == v11)
      {
        v47.length = CFArrayGetCount(v10);
        v47.location = 0;
        v12 = CFArrayContainsValue(v10, v47, CFSTR("network-authentication"));
        CFRelease(v10);
        if (v12)
        {
          CommandHandlerSetInformation(*(_QWORD *)a1, v4);
          if (S_plugins)
          {
            v13 = CFDictionaryGetValue((CFDictionaryRef)S_plugins, v4);
            if (v13)
            {
              v14 = (uint64_t)v13;
              v13[88] = 0;
              if (*((_QWORD *)v13 + 9))
              {
                v15 = mysyslog_get_logger();
                v16 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v15, v16))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v4;
                  v17 = "%@ trying to register again";
LABEL_45:
                  v24 = v15;
                  v25 = v16;
                  v26 = 12;
                  goto LABEL_24;
                }
LABEL_25:
                CFRelease(Value);
LABEL_26:
                v14 = 0;
LABEL_27:
                CFRelease(v4);
                return v14;
              }
LABEL_39:
              *(_QWORD *)(v14 + 72) = *(_QWORD *)a1;
              v39 = *(const void **)(v14 + 32);
              if (v39)
                CFRelease(v39);
              *(_QWORD *)(v14 + 32) = Value;
              v40 = mysyslog_get_logger();
              v41 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v40, v41))
              {
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)&buf[4] = Value;
                v44 = 2112;
                v45 = v4;
                _os_log_impl(&dword_219EF1000, v40, v41, "CaptiveNetworkPlugin %@ %@ RUNNING", buf, 0x16u);
              }
              goto LABEL_27;
            }
          }
          v28 = (const __SCPreferences *)prefs_get();
          *(_QWORD *)buf = 0;
          if (v28)
          {
            v29 = v28;
            entry_and_plugins = prefs_get_entry_and_plugins(v28, v4, buf);
            Current = CFAbsoluteTimeGetCurrent();
            v32 = CFDateCreate(0, Current);
            if (entry_and_plugins)
              MutableCopy = CFDictionaryCreateMutableCopy(0, 0, entry_and_plugins);
            else
              MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            v36 = MutableCopy;
            CFDictionaryAddValue(MutableCopy, CFSTR("DateFirstRegistered"), v32);
            CFDictionarySetValue(v36, CFSTR("DisplayIdentifier"), v4);
            CFDictionarySetValue(v36, CFSTR("DateLastRegistered"), v32);
            CFRelease(v32);
            prefs_set_entry(v29, *(CFDictionaryRef *)buf, v4, v36);
            CFRelease(v36);
            if (SCPreferencesCommitChanges(v29))
            {
              v14 = CNPluginStateAdd(v4);
              v37 = mysyslog_get_logger();
              v38 = _SC_syslog_os_log_mapping();
              if (os_log_type_enabled(v37, v38))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v4;
                _os_log_impl(&dword_219EF1000, v37, v38, "CaptiveNetworkPlugin %@ REGISTERED", buf, 0xCu);
              }
              CNPluginMonitorHandlerPluginListChanged();
              if (!v14)
                goto LABEL_25;
              goto LABEL_39;
            }
          }
          else
          {
            v34 = mysyslog_get_logger();
            v35 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v34, v35))
            {
              *(_WORD *)v42 = 0;
              _os_log_impl(&dword_219EF1000, v34, v35, "prefs is NULL", v42, 2u);
            }
          }
          v15 = mysyslog_get_logger();
          v16 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v15, v16))
            goto LABEL_25;
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v4;
          v17 = "failed to create registration for %@";
          goto LABEL_45;
        }
      }
      else
      {
        CFRelease(v10);
      }
    }
    v22 = mysyslog_get_logger();
    v23 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v22, v23))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v4;
      v44 = 1024;
      LODWORD(v45) = PID;
      v17 = "CaptiveNetworkPlugin %@ [pid=%d] UIBackgroundModes missing network-authentication";
      v24 = v22;
      v25 = v23;
      v26 = 18;
LABEL_24:
      _os_log_impl(&dword_219EF1000, v24, v25, v17, buf, v26);
      goto LABEL_25;
    }
    goto LABEL_25;
  }
  v18 = mysyslog_get_logger();
  v19 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v18, v19))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = PID;
    _os_log_impl(&dword_219EF1000, v18, v19, "can't get display ID for pid %d", buf, 8u);
  }
  return 0;
}

__CFArray *CNPluginStateCopyCommandList(uint64_t a1)
{
  const __CFArray *v2;
  __CFArray *Count;
  const __CFArray *v4;
  const void **v5;
  CFIndex v6;
  CFIndex v7;
  BOOL v8;
  const void *v9;
  CFRange v11;

  v2 = *(const __CFArray **)(a1 + 56);
  if (v2)
  {
    Count = (__CFArray *)CFArrayGetCount(v2);
    v5 = (const void **)(a1 + 64);
    v4 = *(const __CFArray **)(a1 + 64);
    if (!v4)
    {
      if (!Count)
        return Count;
      goto LABEL_13;
    }
  }
  else
  {
    v5 = (const void **)(a1 + 64);
    v4 = *(const __CFArray **)(a1 + 64);
    if (!v4)
      return 0;
    Count = 0;
  }
  v6 = CFArrayGetCount(v4);
  v7 = v6;
  if (Count)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (Count)
    {
LABEL_13:
      v9 = *(const void **)(a1 + 56);
      return (__CFArray *)CFRetain(v9);
    }
    if (v6)
    {
      v9 = *v5;
      return (__CFArray *)CFRetain(v9);
    }
    return 0;
  }
  Count = CFArrayCreateMutableCopy(0, (CFIndex)Count + v6, *(CFArrayRef *)(a1 + 56));
  v11.location = 0;
  v11.length = v7;
  CFArrayAppendArray(Count, *(CFArrayRef *)(a1 + 64), v11);
  return Count;
}

void CNPluginStateIssueCommand(uint64_t a1, const void *a2)
{
  __CFRunLoopSource *v3;
  uint64_t v4;
  uint64_t PID;
  int v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  NSObject *logger;
  os_log_type_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  my_CFArrayPointerAddValue((CFArrayRef *)(a1 + 56), a2);
  if (*(_BYTE *)(a1 + 16))
  {
    v3 = *(__CFRunLoopSource **)(a1 + 80);
    if (v3)
      CFRunLoopSourceSignal(v3);
    return;
  }
  v4 = *(_QWORD *)(a1 + 72);
  if (!v4)
  {
    logger = mysyslog_get_logger();
    v16 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v16))
      return;
    v17 = *(_QWORD *)(a1 + 24);
    v21 = 138412290;
    v22 = v17;
    v11 = "No command handler found for application [%@]";
    v12 = logger;
    v13 = v16;
    v14 = 12;
    goto LABEL_16;
  }
  if (!CommandHandlerNotify(*(_QWORD *)(a1 + 72)))
  {
    v18 = mysyslog_get_logger();
    v19 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v18, v19))
      return;
    LOWORD(v21) = 0;
    v11 = "CommandHandlerNotify() failed";
    goto LABEL_15;
  }
  PID = CommandHandlerGetPID(v4);
  if (!*(_BYTE *)(a1 + 16) && !*(_QWORD *)(a1 + 80))
  {
    v6 = PID;
    v7 = _AMCreateProcessAssertionForPID(PID);
    *(_QWORD *)(a1 + 80) = v7;
    v8 = mysyslog_get_logger();
    if (v7)
    {
      v9 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v8, v9))
        return;
      v10 = *(_QWORD *)(a1 + 24);
      v21 = 138412546;
      v22 = v10;
      v23 = 1024;
      v24 = v6;
      v11 = "Created process assertion for %@ (%d)";
      v12 = v8;
      v13 = v9;
      v14 = 18;
      goto LABEL_16;
    }
    v20 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v8, v20))
    {
      v21 = 67109120;
      LODWORD(v22) = v6;
      _os_log_impl(&dword_219EF1000, v8, v20, "Failed to create process assertion for pid %d", (uint8_t *)&v21, 8u);
    }
    v18 = mysyslog_get_logger();
    v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v18, v19))
    {
      LOWORD(v21) = 0;
      v11 = "CNPluginStateSetProcessAssertion() failed";
LABEL_15:
      v12 = v18;
      v13 = v19;
      v14 = 2;
LABEL_16:
      _os_log_impl(&dword_219EF1000, v12, v13, v11, (uint8_t *)&v21, v14);
    }
  }
}

void CNPluginStateIssueForegroundCommand(uint64_t a1, const void *a2)
{
  __CFRunLoopSource *v3;
  uint64_t v4;

  if (*(_BYTE *)(a1 + 16))
  {
    my_CFArrayPointerAddValue((CFArrayRef *)(a1 + 56), a2);
    if (*(_BYTE *)(a1 + 16))
    {
      v3 = *(__CFRunLoopSource **)(a1 + 80);
      if (v3)
        CFRunLoopSourceSignal(v3);
    }
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 72);
    my_CFArrayPointerAddValue((CFArrayRef *)(a1 + 64), a2);
    if (v4)
      CommandHandlerNotify(v4);
  }
}

void CNPluginStateSetNotRunning(uint64_t a1)
{
  NSObject *logger;
  os_log_type_t v3;
  uint64_t v4;
  const void *v5;
  const void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 16))
  {
    logger = mysyslog_get_logger();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      v4 = *(_QWORD *)(a1 + 24);
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_219EF1000, logger, v3, "CaptiveNetworkPlugin %@ NOT RUNNING", (uint8_t *)&v7, 0xCu);
    }
    *(_QWORD *)(a1 + 72) = 0;
    v5 = *(const void **)(a1 + 56);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(a1 + 56) = 0;
    }
    v6 = *(const void **)(a1 + 64);
    if (v6)
    {
      CFRelease(v6);
      *(_QWORD *)(a1 + 64) = 0;
    }
    CNPluginStateClearProcessAssertion(a1);
  }
}

void CNPluginStateClearProcessAssertion(uint64_t a1)
{
  NSObject *logger;
  os_log_type_t v3;
  uint64_t v4;
  const void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 16) && *(_QWORD *)(a1 + 80))
  {
    logger = mysyslog_get_logger();
    v3 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v3))
    {
      v4 = *(_QWORD *)(a1 + 24);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_219EF1000, logger, v3, "Removing assertion for %@", (uint8_t *)&v6, 0xCu);
    }
    _AMInvalidateProcessAssertion(*(void **)(a1 + 80));
    v5 = *(const void **)(a1 + 80);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(a1 + 80) = 0;
    }
  }
}

const __CFDictionary *CNPluginStateGetFilterResults(uint64_t a1, const void *a2)
{
  const __CFDictionary *result;

  result = *(const __CFDictionary **)(a1 + 40);
  if (result)
    return (const __CFDictionary *)CFDictionaryGetValue(result, a2);
  return result;
}

void CNPluginStateSetFilterResults(uint64_t a1, void *key, void *value)
{
  __CFDictionary *Mutable;

  Mutable = *(__CFDictionary **)(a1 + 40);
  if (Mutable)
  {
    if (key)
    {
      if (!value)
      {
        CFDictionaryRemoveValue(Mutable, key);
        return;
      }
      goto LABEL_8;
    }
    CFRelease(Mutable);
    *(_QWORD *)(a1 + 40) = 0;
  }
  else if (key && value)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(a1 + 40) = Mutable;
LABEL_8:
    CFDictionarySetValue(Mutable, key, value);
  }
}

uint64_t CNPluginStateDisableFilterCommand(uint64_t result)
{
  *(_BYTE *)(result + 48) = 1;
  return result;
}

const __CFDictionary *CNPluginStateListIssueCommand(uint64_t a1, CFArrayRef theArray)
{
  return CNPluginStateListIssueCommandCommon(a1, 0, 0, theArray);
}

const __CFDictionary *CNPluginStateListIssueCommandCommon(uint64_t a1, char a2, char a3, CFArrayRef theArray)
{
  const __CFDictionary *result;
  const __CFArray *v6;
  uint64_t v7;
  uint64_t v8;
  CFArrayRef v9;
  __int128 v10;
  CFArrayRef theArraya;
  void *context;
  CFArrayRef *p_theArraya;
  CFRange v14;

  result = (const __CFDictionary *)S_plugins;
  if (S_plugins)
  {
    v8 = 0;
    v10 = 0u;
    v7 = a1;
    BYTE4(v8) = a2;
    BYTE5(v8) = a3;
    v9 = theArray;
    if (!theArray
      || (*(_QWORD *)&v10 = 0,
          *((_QWORD *)&v10 + 1) = CFArrayGetCount(theArray),
          (result = (const __CFDictionary *)S_plugins) != 0))
    {
      context = CNPluginStateAddCommandApplier;
      p_theArraya = (CFArrayRef *)&v7;
      CFDictionaryApplyFunction(result, (CFDictionaryApplierFunction)CNPluginStateListApplier, &context);
      theArraya = 0;
      if (S_plugins)
      {
        context = CNPluginStateLaunchApplier;
        p_theArraya = &theArraya;
        CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, &context);
        v6 = theArraya;
        if (theArraya)
        {
          v14.length = CFArrayGetCount(theArraya);
          v14.location = 0;
          CFArrayApplyFunction(v6, v14, (CFArrayApplierFunction)CNPluginStateRemoveApplier, 0);
          CFRelease(theArraya);
          CNPluginMonitorHandlerPluginListChanged();
        }
      }
    }
    return (const __CFDictionary *)((_DWORD)v8 != 0);
  }
  return result;
}

const __CFDictionary *CNPluginStateListIssueEvaluateCommand(uint64_t a1, CFArrayRef theArray)
{
  return CNPluginStateListIssueCommandCommon(a1, 0, 1, theArray);
}

const __CFDictionary *CNPluginStateListIssueFilterCommand(uint64_t a1)
{
  return CNPluginStateListIssueCommandCommon(a1, 1, 0, 0);
}

void CNPluginStateListRemoveCommand(uint64_t a1)
{
  _QWORD v1[2];

  if (S_plugins)
  {
    v1[0] = CNPluginStateRemoveCommandApplier;
    v1[1] = a1;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, v1);
  }
}

void CNPluginStateListApplyFunction(uint64_t a1, uint64_t a2)
{
  _QWORD v2[2];

  if (S_plugins)
  {
    v2[0] = a1;
    v2[1] = a2;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, v2);
  }
}

void CNPluginStateRemoveCommandApplier(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  CFIndex v5;
  CFIndex v6;

  if (*(_BYTE *)(a1 + 16))
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("UniqueID"));
    if (Value)
      CNPluginStateBuiltinRemoveDeliveredCommand(a1, Value);
  }
  v5 = my_CFArrayFindValue(*(const __CFArray **)(a1 + 56), theDict);
  if (v5 == -1)
  {
    v6 = my_CFArrayFindValue(*(const __CFArray **)(a1 + 64), theDict);
    if (v6 != -1)
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 64), v6);
  }
  else
  {
    CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 56), v5);
    if (!CFArrayGetCount(*(CFArrayRef *)(a1 + 56)))
      CNPluginStateClearProcessAssertion(a1);
  }
}

void CNPluginStateBuiltinFlushAllCommands(uint64_t a1)
{
  const __CFArray *v2;
  const __CFArray *v3;
  NSObject *logger;
  os_log_type_t v5;
  uint8_t v6[16];

  if (*(_BYTE *)(a1 + 16))
  {
    v2 = *(const __CFArray **)(a1 + 56);
    if (v2 && CFArrayGetCount(v2))
      CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 56));
    v3 = *(const __CFArray **)(a1 + 88);
    if (v3 && CFArrayGetCount(v3))
      CFArrayRemoveAllValues(*(CFMutableArrayRef *)(a1 + 88));
    logger = mysyslog_get_logger();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_219EF1000, logger, v5, "flushed all the commands for builtin", v6, 2u);
    }
  }
}

void CNPluginStateListSetEvaluateCmdAckTimeoutStatus()
{
  int v0;
  _QWORD context[2];

  v0 = 3;
  if (S_plugins)
  {
    context[0] = CNPluginStateEvaluateCommandStatusApplier;
    context[1] = &v0;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, context);
  }
}

uint64_t CNPluginStateEvaluateCommandStatusApplier(uint64_t result, _DWORD *a2)
{
  if (!*(_DWORD *)(result + 112) && *a2 == 3)
    *(_DWORD *)(result + 112) = 3;
  return result;
}

uint64_t CNPluginStateListIsEvaluateResponsePending()
{
  uint64_t result;
  int v1;
  _QWORD context[2];

  v1 = 0;
  result = S_plugins;
  if (S_plugins)
  {
    context[0] = CNPluginStateCheckEvaluateResponsesPending;
    context[1] = &v1;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, context);
    return v1 > 0;
  }
  return result;
}

void CNPluginStateCheckEvaluateResponsesPending(uint64_t a1, _DWORD *a2)
{
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  const char *v7;
  NSObject *logger;
  os_log_type_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 16) && (*(_BYTE *)(a1 + 88) || !*(_QWORD *)(a1 + 72)))
  {
    logger = mysyslog_get_logger();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v9))
    {
      v10 = *(_QWORD *)(a1 + 24);
      if (*(_BYTE *)(a1 + 88))
        v11 = "failed to launch";
      else
        v11 = "launched";
      v12 = *(_QWORD *)(a1 + 72);
      v20 = 138412802;
      v21 = v10;
      v22 = 2080;
      if (v12)
        v13 = "handler registered";
      else
        v13 = "no handler registered";
      v23 = v11;
      v24 = 2080;
      v25 = v13;
      _os_log_impl(&dword_219EF1000, logger, v9, "[%@] [%s] [%s]", (uint8_t *)&v20, 0x20u);
    }
  }
  switch(*(_DWORD *)(a1 + 112))
  {
    case 0:
      v4 = mysyslog_get_logger();
      v5 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v4, v5))
        goto LABEL_19;
      v6 = *(_QWORD *)(a1 + 24);
      v20 = 138412290;
      v21 = v6;
      v7 = "[%@] acknowledgement is pending";
      goto LABEL_18;
    case 1:
      v14 = mysyslog_get_logger();
      v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v15))
        return;
      v16 = *(_QWORD *)(a1 + 24);
      v20 = 138412290;
      v21 = v16;
      v17 = "[%@] responded to command";
      break;
    case 2:
      v4 = mysyslog_get_logger();
      v5 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v4, v5))
      {
        v18 = *(_QWORD *)(a1 + 24);
        v20 = 138412290;
        v21 = v18;
        v7 = "[%@] acknowledged the command delivery";
LABEL_18:
        _os_log_impl(&dword_219EF1000, v4, v5, v7, (uint8_t *)&v20, 0xCu);
      }
LABEL_19:
      ++*a2;
      return;
    case 3:
      v14 = mysyslog_get_logger();
      v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v15))
        return;
      v19 = *(_QWORD *)(a1 + 24);
      v20 = 138412290;
      v21 = v19;
      v17 = "[%@] timed out to acknowledge the command delivery";
      break;
    default:
      return;
  }
  _os_log_impl(&dword_219EF1000, v14, v15, v17, (uint8_t *)&v20, 0xCu);
}

void CNPluginStateListLogPendingCommand(uint64_t a1)
{
  _QWORD v1[2];

  if (S_plugins)
  {
    v1[0] = CNPluginStateListPrintPendingCommand;
    v1[1] = a1;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, v1);
  }
}

void CNPluginStateListPrintPendingCommand(uint64_t a1, const void *a2)
{
  NSObject *logger;
  os_log_type_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 16) && (*(_BYTE *)(a1 + 88) || !*(_QWORD *)(a1 + 72)))
  {
    logger = mysyslog_get_logger();
    v5 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v5))
      return;
    v8 = *(_QWORD *)(a1 + 24);
    v9 = 138412290;
    v10 = v8;
    v7 = "Skipping %@ (launch failed or command handler not registered)";
    goto LABEL_9;
  }
  if (my_CFArrayFindValue(*(const __CFArray **)(a1 + 56), a2) != -1
    || my_CFArrayFindValue(*(const __CFArray **)(a1 + 64), a2) != -1)
  {
    logger = mysyslog_get_logger();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      v6 = *(_QWORD *)(a1 + 24);
      v9 = 138412290;
      v10 = v6;
      v7 = "%@";
LABEL_9:
      _os_log_impl(&dword_219EF1000, logger, v5, v7, (uint8_t *)&v9, 0xCu);
    }
  }
}

void CNPluginStateListHandleUnregistered()
{
  const __CFArray *Mutable;
  NSObject *logger;
  os_log_type_t v2;
  __int128 v3;
  uint64_t v4;
  CFRange v5;

  v4 = *MEMORY[0x24BDAC8D0];
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (S_plugins)
  {
    *(_QWORD *)&v3 = CNPluginStateFindPluginsWithoutHandlers;
    *((_QWORD *)&v3 + 1) = Mutable;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, &v3);
  }
  if (CFArrayGetCount(Mutable) >= 1)
  {
    logger = mysyslog_get_logger();
    v2 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v2))
    {
      LODWORD(v3) = 138412290;
      *(_QWORD *)((char *)&v3 + 4) = Mutable;
      _os_log_impl(&dword_219EF1000, logger, v2, "Forgetting plugins that failed to register %@", (uint8_t *)&v3, 0xCu);
    }
    v5.length = CFArrayGetCount(Mutable);
    v5.location = 0;
    CFArrayApplyFunction(Mutable, v5, (CFArrayApplierFunction)CNPluginStateRemoveApplier, 0);
    CNPluginMonitorHandlerPluginListChanged();
  }
  CFRelease(Mutable);
}

void CNPluginStateFindPluginsWithoutHandlers(uint64_t a1, __CFArray *a2)
{
  const void *v4;
  NSObject *logger;
  os_log_type_t v6;
  int v7;
  int v8;
  const void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 16) && !*(_BYTE *)(a1 + 88) && !*(_QWORD *)(a1 + 72))
  {
    v4 = *(const void **)(a1 + 24);
    ++*(_DWORD *)(a1 + 116);
    logger = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      v7 = *(_DWORD *)(a1 + 116);
      v8 = 138412546;
      v9 = v4;
      v10 = 1024;
      v11 = v7;
      _os_log_impl(&dword_219EF1000, logger, v6, "[%@] was launched but it did not provide command handler [no registration count: %d]", (uint8_t *)&v8, 0x12u);
    }
    if (*(int *)(a1 + 116) >= 5)
      CFArrayAppendValue(a2, v4);
  }
}

const __SCPreferences *CNPluginStateRemoveApplier(void *key)
{
  const __SCPreferences *v2;

  if (S_plugins)
    CFDictionaryRemoveValue((CFMutableDictionaryRef)S_plugins, key);
  v2 = (const __SCPreferences *)prefs_get();
  return prefs_remove_entry(v2, key);
}

uint64_t CNPluginStateListApplier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))a3)(a2, *(_QWORD *)(a3 + 8));
}

uint64_t CNPluginStateListShouldSendFilterCommand()
{
  uint64_t result;
  unsigned __int8 v1;
  _QWORD context[2];

  v1 = 0;
  result = S_plugins;
  if (S_plugins)
  {
    context[0] = CNPluginStateShouldSendFilterCommandApplier;
    context[1] = &v1;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, context);
    return v1;
  }
  return result;
}

uint64_t CNPluginStateShouldSendFilterCommandApplier(uint64_t result, _BYTE *a2)
{
  if (!*(_BYTE *)(result + 16) && !*(_BYTE *)(result + 48))
    *a2 = 1;
  return result;
}

const void *CNPluginStateProcessResponse(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  CFTypeID TypeID;
  CFIndex DictWithKeyAndValue;
  NSObject *logger;
  os_log_type_t v8;
  uint64_t v9;
  const char *v10;
  CFIndex v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  CFDictionaryRef v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  Value = CFDictionaryGetValue(theDict, CFSTR("UniqueID"));
  TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    logger = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v8))
      return 0;
    v9 = *(_QWORD *)(a1 + 24);
    v14 = 138412546;
    v15 = v9;
    v16 = 2112;
    v17 = theDict;
    v10 = "CaptiveNetworkPlugin %@ response %@ missing uniqueID";
LABEL_10:
    _os_log_impl(&dword_219EF1000, logger, v8, v10, (uint8_t *)&v14, 0x16u);
    return 0;
  }
  if (*(_BYTE *)(a1 + 16))
    CNPluginStateBuiltinRemoveDeliveredCommand(a1, Value);
  DictWithKeyAndValue = my_CFArrayFindDictWithKeyAndValue(*(const __CFArray **)(a1 + 56), CFSTR("UniqueID"), Value);
  if (DictWithKeyAndValue == -1)
  {
    v12 = my_CFArrayFindDictWithKeyAndValue(*(const __CFArray **)(a1 + 64), CFSTR("UniqueID"), Value);
    if (v12 != -1)
    {
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 64), v12);
      return Value;
    }
    logger = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v8))
      return 0;
    v13 = *(_QWORD *)(a1 + 24);
    v14 = 138412546;
    v15 = v13;
    v16 = 2112;
    v17 = theDict;
    v10 = "CaptiveNetworkPlugin %@ response %@ is stale";
    goto LABEL_10;
  }
  CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 56), DictWithKeyAndValue);
  if (!CFArrayGetCount(*(CFArrayRef *)(a1 + 56)))
    CNPluginStateClearProcessAssertion(a1);
  return Value;
}

BOOL CNPluginStateProcessCmdAck(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  const void *v5;
  CFTypeID TypeID;
  CFTypeID v7;
  int v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  const char *String;
  NSObject *logger;
  os_log_type_t v14;
  _BOOL8 result;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  os_log_type_t v19;
  uint64_t v20;
  const char *v21;
  unsigned int valuePtr;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  Value = CFDictionaryGetValue(theDict, CFSTR("UniqueID"));
  v5 = CFDictionaryGetValue(theDict, CFSTR("Type"));
  TypeID = CFStringGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
  {
    logger = mysyslog_get_logger();
    v14 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(logger, v14);
    if (!result)
      return result;
    v16 = *(_QWORD *)(a1 + 24);
    *(_DWORD *)buf = 138412290;
    v24 = v16;
    v17 = "command acknowledgement from [%@] is missing uniqueID";
LABEL_13:
    _os_log_impl(&dword_219EF1000, logger, v14, v17, buf, 0xCu);
    return 0;
  }
  v7 = CFNumberGetTypeID();
  if (!v5 || CFGetTypeID(v5) != v7 || !CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt32Type, &valuePtr))
  {
    logger = mysyslog_get_logger();
    v14 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(logger, v14);
    if (!result)
      return result;
    v18 = *(_QWORD *)(a1 + 24);
    *(_DWORD *)buf = 138412290;
    v24 = v18;
    v17 = "command acknowledgement from [%@] is missing commandType";
    goto LABEL_13;
  }
  v8 = *(_DWORD *)(a1 + 112);
  v9 = mysyslog_get_logger();
  if (v8 == 3)
  {
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = *(_QWORD *)(a1 + 24);
      String = CNPCommandTypeGetString(valuePtr);
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      v25 = 2080;
      v26 = String;
      _os_log_impl(&dword_219EF1000, v9, v10, "[%@] acknowledged delivery for command %s after acknowledgement timeout", buf, 0x16u);
    }
  }
  else
  {
    v19 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v19))
    {
      v20 = *(_QWORD *)(a1 + 24);
      v21 = CNPCommandTypeGetString(valuePtr);
      *(_DWORD *)buf = 138412546;
      v24 = v20;
      v25 = 2080;
      v26 = v21;
      _os_log_impl(&dword_219EF1000, v9, v19, "[%@] acknowledged delivery for command %s", buf, 0x16u);
    }
    if (valuePtr == 2)
      *(_DWORD *)(a1 + 112) = 2;
  }
  return 1;
}

CFMutableArrayRef CNPluginStateListCopyDisplayIDs()
{
  CFIndex Count;
  CFMutableArrayRef Mutable;
  _QWORD v3[2];

  if (S_plugins)
    Count = CFDictionaryGetCount((CFDictionaryRef)S_plugins);
  else
    Count = 0;
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x24BDBD690]);
  if (S_plugins)
  {
    v3[0] = CNPluginStateAddDisplayIDToArray;
    v3[1] = Mutable;
    CFDictionaryApplyFunction((CFDictionaryRef)S_plugins, (CFDictionaryApplierFunction)CNPluginStateListApplier, v3);
  }
  if (!CFArrayGetCount(Mutable))
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

void CNPluginStateAddDisplayIDToArray(uint64_t a1, CFMutableArrayRef theArray)
{
  if (!*(_BYTE *)(a1 + 16))
    CFArrayAppendValue(theArray, *(const void **)(a1 + 24));
}

void AppUninstallationCallback(int a1, void *a2, int a3, int a4, CFDictionaryRef theDict)
{
  const void *Value;
  CFTypeID TypeID;
  const void *v9;
  CFTypeID v10;
  CFTypeID v11;
  const void *v12;
  NSObject *logger;
  os_log_type_t v14;
  _QWORD block[5];
  uint8_t buf[16];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = 0;
  if (theDict)
  {
    if (S_plugins)
    {
      Value = CFDictionaryGetValue(theDict, CFSTR("isPlaceholder"));
      TypeID = CFBooleanGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == TypeID && CFBooleanGetValue((CFBooleanRef)Value) != 1)
        {
          v9 = CFDictionaryGetValue(theDict, CFSTR("bundleIDs"));
          v18[3] = (uint64_t)v9;
          v10 = CFArrayGetTypeID();
          if (v9)
          {
            if (CFGetTypeID(v9) == v10 && CFArrayGetCount((CFArrayRef)v18[3]))
            {
              v11 = CFGetTypeID(a2);
              if (v11 == CFRunLoopGetTypeID())
              {
                CFRetain((CFTypeRef)v18[3]);
                v12 = (const void *)*MEMORY[0x24BDBD5A0];
                block[0] = MEMORY[0x24BDAC760];
                block[1] = 0x40000000;
                block[2] = __AppUninstallationCallback_block_invoke;
                block[3] = &unk_24DC16E50;
                block[4] = &v17;
                CFRunLoopPerformBlock((CFRunLoopRef)a2, v12, block);
                CFRunLoopWakeUp((CFRunLoopRef)a2);
              }
              else
              {
                logger = mysyslog_get_logger();
                v14 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(logger, v14))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_219EF1000, logger, v14, "observer does not match CFRunLoppRef type", buf, 2u);
                }
              }
            }
          }
        }
      }
    }
  }
  _Block_object_dispose(&v17, 8);
}

uint64_t CompareAppIDWithPluginID(uint64_t result, uint64_t a2)
{
  if (!*(_BYTE *)(result + 16))
  {
    result = CFEqual(*(CFTypeRef *)a2, *(CFTypeRef *)(result + 24));
    if ((_DWORD)result)
      *(_BYTE *)(a2 + 8) = 1;
  }
  return result;
}

const __SCPreferences *prefs_remove_entry(const __SCPreferences *a1, const void *a2)
{
  const __SCPreferences *result;
  CFDictionaryRef theDict;

  theDict = 0;
  result = prefs_get_entry_and_plugins(a1, a2, &theDict);
  if (result)
  {
    prefs_set_entry(a1, theDict, a2, 0);
    return (const __SCPreferences *)SCPreferencesCommitChanges(a1);
  }
  return result;
}

const __SCPreferences *prefs_get_entry_and_plugins(const __SCPreferences *result, const void *a2, _QWORD *a3)
{
  CFPropertyListRef Value;
  CFTypeID TypeID;
  const __SCPreferences *v7;
  CFTypeID v8;

  if (!result)
  {
LABEL_13:
    Value = 0;
    if (!a3)
      return result;
    goto LABEL_14;
  }
  Value = SCPreferencesGetValue(result, CFSTR("Plugins"));
  TypeID = CFDictionaryGetTypeID();
  if (!Value)
    goto LABEL_10;
  if (CFGetTypeID(Value) != TypeID)
  {
    result = 0;
    goto LABEL_13;
  }
  v7 = (const __SCPreferences *)CFDictionaryGetValue((CFDictionaryRef)Value, a2);
  v8 = CFDictionaryGetTypeID();
  if (!v7)
  {
LABEL_10:
    result = 0;
    if (!a3)
      return result;
LABEL_14:
    *a3 = Value;
    return result;
  }
  if (CFGetTypeID(v7) == v8)
    result = v7;
  else
    result = 0;
  if (a3)
    goto LABEL_14;
  return result;
}

void prefs_set_entry(const __SCPreferences *a1, CFDictionaryRef theDict, const void *a3, const void *a4)
{
  __CFDictionary *MutableCopy;
  __CFDictionary *Mutable;

  if (!theDict)
  {
    if (!a4)
      return;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    goto LABEL_6;
  }
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  Mutable = MutableCopy;
  if (a4)
  {
LABEL_6:
    CFDictionarySetValue(Mutable, a3, a4);
    goto LABEL_7;
  }
  CFDictionaryRemoveValue(MutableCopy, a3);
LABEL_7:
  SCPreferencesSetValue(a1, CFSTR("Plugins"), Mutable);
  CFRelease(Mutable);
}

void __CNPluginStateDeallocate(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  void *v7;
  CFTypeRef *v8;
  const void *v9;
  const void *v10;
  CFTypeRef v11;
  CFTypeRef *v12;
  const void *v13;

  v2 = *(const void **)(a1 + 24);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
  v3 = *(const void **)(a1 + 32);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v4 = *(const void **)(a1 + 56);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 56) = 0;
  }
  v5 = *(const void **)(a1 + 64);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 64) = 0;
  }
  v6 = *(const void **)(a1 + 40);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v8 = (CFTypeRef *)(a1 + 80);
  v7 = *(void **)(a1 + 80);
  if (!*(_BYTE *)(a1 + 16))
  {
    _AMInvalidateProcessAssertion(v7);
    v11 = *v8;
    if (!*v8)
      return;
    goto LABEL_21;
  }
  if (v7)
  {
    CFRunLoopSourceInvalidate((CFRunLoopSourceRef)v7);
    CFRelease(*v8);
  }
  v9 = *(const void **)(a1 + 88);
  if (v9)
  {
    CFRelease(v9);
    *(_QWORD *)(a1 + 88) = 0;
  }
  v10 = *(const void **)(a1 + 96);
  if (v10)
  {
    CFRelease(v10);
    *(_QWORD *)(a1 + 96) = 0;
  }
  v13 = *(const void **)(a1 + 104);
  v12 = (CFTypeRef *)(a1 + 104);
  v11 = v13;
  if (v13)
  {
    v8 = v12;
LABEL_21:
    CFRelease(v11);
    *v8 = 0;
  }
}

CFStringRef __CNPluginStateCopyDebugDesc(uint64_t a1)
{
  const __CFAllocator *v2;
  uint64_t PID;
  uint64_t v4;

  v2 = CFGetAllocator((CFTypeRef)a1);
  if (*(_BYTE *)(a1 + 16))
  {
    PID = 0;
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 72);
    if (v4)
      PID = CommandHandlerGetPID(v4);
    else
      PID = 0xFFFFFFFFLL;
  }
  return CFStringCreateWithFormat(v2, 0, CFSTR("<CNPluginState %@ pid=%d>"), *(_QWORD *)(a1 + 24), PID);
}

void CNPluginStateAddCommandApplier(uint64_t a1, uint64_t a2)
{
  NSObject *logger;
  os_log_type_t v5;
  const void *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  const __CFArray *v10;
  const void *v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  const void *v15;
  uint64_t v16;
  CFRange v17;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a2 + 12) && (*(_BYTE *)(a1 + 16) || *(_BYTE *)(a1 + 48)))
  {
    logger = mysyslog_get_logger();
    v5 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v5))
      return;
    v6 = *(const void **)(a1 + 24);
    v14 = 138412290;
    v15 = v6;
    v7 = "Not sending filter command to %@";
    v8 = logger;
    v9 = v5;
LABEL_12:
    _os_log_impl(&dword_219EF1000, v8, v9, v7, (uint8_t *)&v14, 0xCu);
    return;
  }
  if (*(_BYTE *)(a2 + 13))
    *(_DWORD *)(a1 + 112) = 0;
  v10 = *(const __CFArray **)(a2 + 16);
  if (v10)
  {
    v11 = *(const void **)(a1 + 24);
    v17.location = *(_QWORD *)(a2 + 24);
    v17.length = *(_QWORD *)(a2 + 32);
    if (CFArrayContainsValue(v10, v17, v11))
    {
      v12 = mysyslog_get_logger();
      v13 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v12, v13))
        return;
      v14 = 138412290;
      v15 = v11;
      v7 = "Not sending command to excluded plugin %@";
      v8 = v12;
      v9 = v13;
      goto LABEL_12;
    }
  }
  CNPluginStateIssueCommand(a1, *(const void **)a2);
  ++*(_DWORD *)(a2 + 8);
}

void CNPluginStateLaunchApplier(uint64_t a1, CFArrayRef *a2)
{
  const void *v4;
  uint64_t v5;
  NSObject *logger;
  os_log_type_t v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  int v12;
  int v13;
  NSObject *v14;
  os_log_type_t v15;
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  const void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(a1 + 16))
  {
    v4 = *(const void **)(a1 + 24);
    v5 = *(_QWORD *)(a1 + 72);
    logger = mysyslog_get_logger();
    v7 = _SC_syslog_os_log_mapping();
    v8 = os_log_type_enabled(logger, v7);
    if (v5)
    {
      if (!v8)
        return;
      v18 = 138412290;
      v19 = v4;
      v9 = "Plugin %@ is already running";
      v10 = logger;
      v11 = v7;
      goto LABEL_14;
    }
    if (v8)
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl(&dword_219EF1000, logger, v7, "Launching %@ in the background", (uint8_t *)&v18, 0xCu);
    }
    v12 = _AMLaunchApplicationWithIdentifier((uint64_t)v4, 1);
    *(_BYTE *)(a1 + 88) = 0;
    if (!v12)
    {
      v14 = mysyslog_get_logger();
      v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v15))
        return;
      v18 = 138412290;
      v19 = v4;
      v9 = "Launched %@ in the background";
      goto LABEL_13;
    }
    v13 = v12;
    if (v12 == 1)
    {
      my_CFArrayPointerAddValue(a2, v4);
      v14 = mysyslog_get_logger();
      v15 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v14, v15))
        return;
      v18 = 138412290;
      v19 = v4;
      v9 = "Application %@ is no longer installed";
LABEL_13:
      v10 = v14;
      v11 = v15;
LABEL_14:
      _os_log_impl(&dword_219EF1000, v10, v11, v9, (uint8_t *)&v18, 0xCu);
      return;
    }
    v16 = mysyslog_get_logger();
    v17 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = 138412546;
      v19 = v4;
      v20 = 1024;
      v21 = v13;
      _os_log_impl(&dword_219EF1000, v16, v17, "_AMLaunchApplicationWithIdentifier(%@) failed, %d", (uint8_t *)&v18, 0x12u);
    }
    *(_BYTE *)(a1 + 88) = 1;
  }
}

void CNPluginStateBuiltinRemoveDeliveredCommand(uint64_t a1, const void *a2)
{
  const __CFArray *v3;
  CFIndex Value;
  CFIndex v6;
  NSObject *logger;
  os_log_type_t v8;
  int v9;
  const void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(const __CFArray **)(a1 + 88);
  if (v3)
  {
    Value = my_CFArrayFindValue(v3, a2);
    if (Value != -1)
    {
      v6 = Value;
      logger = mysyslog_get_logger();
      v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v8))
      {
        v9 = 138412290;
        v10 = a2;
        _os_log_impl(&dword_219EF1000, logger, v8, "Removing %@", (uint8_t *)&v9, 0xCu);
      }
      CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(a1 + 88), v6);
    }
  }
}

uint64_t CommandHandlerNotify(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 32);
  if ((_DWORD)result)
  {
    _SC_sendMachMessage();
    return 1;
  }
  return result;
}

uint64_t CNSServerConnectionEstablish(int a1, UInt8 *bytes, unsigned int a3, mach_port_name_t a4, _DWORD *a5, int *a6, __int128 *a7)
{
  ipc_space_t *v9;
  const __CFData *v14;
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v17;
  const void *v18;
  CFTypeID v19;
  const void *v20;
  char v21;
  int v22;
  unsigned int v24;
  __int128 v25;
  NSObject *logger;
  os_log_type_t v27;
  unsigned int (**v28)(__int128 *);
  __int128 v29;
  int pid;
  unint64_t Count;
  uint64_t v32;
  const void **v33;
  NSObject *v34;
  os_log_type_t v35;
  const char *v36;
  const char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  _DWORD *v41;
  NSObject *v42;
  os_log_type_t v43;
  const char *v44;
  const char *v45;
  kern_return_t v46;
  mach_error_t v47;
  NSObject *v48;
  os_log_type_t v49;
  char *v50;
  NSObject *v51;
  os_log_type_t v52;
  const char *v53;
  uint64_t Instance;
  __CFMachPort *v55;
  __CFRunLoop *Current;
  kern_return_t v57;
  mach_error_t v58;
  NSObject *v59;
  os_log_type_t v60;
  char *v61;
  NSObject *v62;
  os_log_type_t v63;
  mach_port_t Port;
  CFNumberRef v65;
  NSObject *v66;
  os_log_type_t v67;
  const char *v68;
  NSObject *v69;
  os_log_type_t v70;
  const char *v71;
  unsigned int (**v72)(__int128 *);
  const void *v73;
  __int128 v74;
  __int128 v75;
  unsigned int valuePtr;
  mach_port_name_t name[2];
  uint64_t v78;
  const void *v79;
  uint8_t buf[32];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  *a5 = 0;
  v9 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  if (!bytes)
  {
    CFDictionaryGetTypeID();
    v14 = 0;
LABEL_12:
    v21 = 1;
    if (!a4)
      goto LABEL_14;
    goto LABEL_13;
  }
  v14 = my_CFPropertyListCreateWithBytePtrAndLength(bytes, a3);
  MEMORY[0x2207368F4](*v9, bytes, a3);
  TypeID = CFDictionaryGetTypeID();
  if (!v14)
    goto LABEL_12;
  if (CFGetTypeID(v14) == TypeID)
  {
    Value = CFDictionaryGetValue(v14, CFSTR("Class"));
    v17 = CFNumberGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == v17 && CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr))
      {
        v18 = CFDictionaryGetValue(v14, CFSTR("Information"));
        v19 = CFDictionaryGetTypeID();
        if (v18)
        {
          if (CFGetTypeID(v18) == v19)
            v20 = v18;
          else
            v20 = 0;
        }
        else
        {
          v20 = 0;
        }
        v24 = valuePtr;
        v25 = a7[1];
        v74 = *a7;
        v75 = v25;
        v78 = 0;
        v79 = 0;
        *(_QWORD *)name = 0;
        if (valuePtr >= 7)
        {
          logger = mysyslog_get_logger();
          v27 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(logger, v27))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v24;
            _os_log_impl(&dword_219EF1000, logger, v27, "class %d >= kCommandHandlerClassLast", buf, 8u);
          }
          v22 = 22;
          goto LABEL_58;
        }
        v28 = (unsigned int (**)(__int128 *))S_class_methods[valuePtr];
        if (!v28)
        {
          v34 = mysyslog_get_logger();
          v22 = 6;
          v35 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v34, v35))
            goto LABEL_58;
          v36 = CommandHandlerClassString(v24);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v36;
          v37 = "no class handler for %s";
          v38 = v34;
          v39 = v35;
          goto LABEL_47;
        }
        v29 = a7[1];
        *(_OWORD *)buf = *a7;
        *(_OWORD *)&buf[16] = v29;
        pid = audit_token_get_pid(buf);
        v73 = v20;
        if (!S_handlers || (Count = CFDictionaryGetCount((CFDictionaryRef)S_handlers)) == 0)
        {
LABEL_43:
          if (!(*v28)(&v74))
          {
            v51 = mysyslog_get_logger();
            v52 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v51, v52))
            {
              v53 = CommandHandlerClassString(v24);
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v53;
              _os_log_impl(&dword_219EF1000, v51, v52, "class handler %s denied registration", buf, 0xCu);
            }
            v22 = 1;
            goto LABEL_58;
          }
          v46 = mach_port_allocate(*v9, 1u, name);
          if (v46)
          {
            v47 = v46;
            v48 = mysyslog_get_logger();
            v49 = _SC_syslog_os_log_mapping();
            if (!os_log_type_enabled(v48, v49))
            {
              v22 = 12;
LABEL_58:
              if (a4)
                mach_port_deallocate(*v9, a4);
              goto LABEL_60;
            }
            v50 = mach_error_string(v47);
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v50;
            v37 = "mach_port_allocate failed, %s";
            v22 = 12;
            v38 = v48;
            v39 = v49;
LABEL_47:
            _os_log_impl(&dword_219EF1000, v38, v39, v37, buf, 0xCu);
            goto LABEL_58;
          }
          if (!__kCommandHandlerTypeID)
            __kCommandHandlerTypeID = _CFRuntimeRegisterClass();
          Instance = _CFRuntimeCreateInstance();
          *(_OWORD *)(Instance + 16) = 0u;
          *(_OWORD *)(Instance + 32) = 0u;
          *(_QWORD *)(Instance + 48) = 0;
          v55 = (__CFMachPort *)_SC_CFMachPortCreateWithPort();
          *(_QWORD *)(Instance + 16) = v55;
          if (v55)
          {
            *(_QWORD *)(Instance + 24) = CFMachPortCreateRunLoopSource(0, v55, 0);
            Current = CFRunLoopGetCurrent();
            CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)(Instance + 24), (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
            mach_port_insert_right(*v9, name[0], name[0], 0x14u);
            v57 = mach_port_request_notification(*v9, name[0], 70, 1u, name[0], 0x15u, &name[1]);
            if (!v57)
            {
              *(_DWORD *)(Instance + 32) = a4;
              *(_DWORD *)(Instance + 36) = v24;
              *(_DWORD *)(Instance + 40) = pid;
              *(_OWORD *)buf = v74;
              *(_OWORD *)&buf[16] = v75;
              *(_DWORD *)(Instance + 44) = audit_token_get_euid(buf);
              v78 = Instance;
              v79 = v73;
              Port = CFMachPortGetPort(*(CFMachPortRef *)(Instance + 16));
              if (!S_handlers)
                S_handlers = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              *(_DWORD *)buf = Port;
              v65 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, buf);
              CFDictionarySetValue((CFMutableDictionaryRef)S_handlers, v65, (const void *)Instance);
              CFRelease(v65);
              if (v28[1]((__int128 *)&v78))
              {
                v66 = mysyslog_get_logger();
                v67 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v66, v67))
                {
                  v68 = CommandHandlerClassString(v24);
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = v68;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = pid;
                  _os_log_impl(&dword_219EF1000, v66, v67, "CommandHandlerServer: %s pid %d registered", buf, 0x12u);
                }
                v22 = 0;
              }
              else
              {
                name[0] = 0;
                remove_handler(Instance);
                v69 = mysyslog_get_logger();
                v70 = _SC_syslog_os_log_mapping();
                if (os_log_type_enabled(v69, v70))
                {
                  v71 = CommandHandlerClassString(v24);
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = v71;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = pid;
                  _os_log_impl(&dword_219EF1000, v69, v70, "Registering %s pid %d FAILED", buf, 0x12u);
                }
                v22 = 22;
              }
              goto LABEL_73;
            }
            v58 = v57;
            name[0] = 0;
            v59 = mysyslog_get_logger();
            v60 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v59, v60))
            {
              v61 = mach_error_string(v58);
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v61;
              v22 = 12;
              _os_log_impl(&dword_219EF1000, v59, v60, "request MACH_NOTIFY_NO_SENDERS failed, %s", buf, 0xCu);
LABEL_73:
              CFRelease((CFTypeRef)Instance);
LABEL_60:
              *a5 = name[0];
              goto LABEL_15;
            }
          }
          else
          {
            v62 = mysyslog_get_logger();
            v63 = _SC_syslog_os_log_mapping();
            if (os_log_type_enabled(v62, v63))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_219EF1000, v62, v63, "failed to create session port", buf, 2u);
            }
          }
          v22 = 12;
          goto LABEL_73;
        }
        v32 = Count;
        v72 = v28;
        v82 = 0u;
        v83 = 0u;
        v81 = 0u;
        memset(buf, 0, sizeof(buf));
        if (Count <= 0xA)
        {
          v33 = (const void **)buf;
          CFDictionaryGetKeysAndValues((CFDictionaryRef)S_handlers, 0, (const void **)buf);
        }
        else
        {
          v33 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
          CFDictionaryGetKeysAndValues((CFDictionaryRef)S_handlers, 0, v33);
          if (v32 < 1)
          {
LABEL_36:
            v41 = 0;
            goto LABEL_37;
          }
        }
        v40 = 0;
        while (1)
        {
          v41 = v33[v40];
          if (v41[10] == pid)
            break;
          if (v32 == ++v40)
            goto LABEL_36;
        }
LABEL_37:
        if (v33 != (const void **)buf)
          free(v33);
        v28 = v72;
        if (v41)
        {
          v42 = mysyslog_get_logger();
          v43 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v42, v43))
          {
            v44 = CommandHandlerClassString(v41[9]);
            v45 = CommandHandlerClassString(v24);
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)&buf[4] = pid;
            *(_WORD *)&buf[8] = 2080;
            *(_QWORD *)&buf[10] = v44;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = v45;
            _os_log_impl(&dword_219EF1000, v42, v43, "pid %d class %s trying to register again as class %s", buf, 0x1Cu);
          }
          v22 = 16;
          goto LABEL_58;
        }
        goto LABEL_43;
      }
    }
  }
  v21 = 0;
  if (a4)
LABEL_13:
    mach_port_deallocate(*v9, a4);
LABEL_14:
  v22 = 22;
  if ((v21 & 1) == 0)
LABEL_15:
    CFRelease(v14);
  *a6 = v22;
  return 0;
}

uint64_t CNSServerConnectionProvideResponse(int a1, UInt8 *a2, unsigned int a3, int *a4)
{
  CNSServerConnectionHandleType(a1, 1, a2, a3, 0, 0, a4);
  return 0;
}

void CNSServerConnectionHandleType(int a1, int a2, UInt8 *a3, unsigned int a4, const __CFData **a5, _DWORD *a6, int *a7)
{
  unsigned int *handler;
  unsigned int *v14;
  const __CFData *v15;
  CFTypeID TypeID;
  int v17;
  uint64_t v18;
  uint64_t (**v19)(unsigned int **);
  int v20;
  const __CFData *v21;
  int v22;
  const __CFData *v23;
  uint64_t (*v24)(unsigned int **);
  unsigned int *v25;
  const __CFData *v26;
  const __CFData *v27;

  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  handler = (unsigned int *)get_handler(a1);
  if (handler)
  {
    v14 = handler;
    if (a3)
    {
      v15 = my_CFPropertyListCreateWithBytePtrAndLength(a3, a4);
      MEMORY[0x2207368F4](*MEMORY[0x24BDAEC58], a3, a4);
      TypeID = CFDictionaryGetTypeID();
      if (!v15)
      {
LABEL_36:
        v17 = 22;
        goto LABEL_37;
      }
      if (CFGetTypeID(v15) != TypeID)
      {
        v17 = 22;
LABEL_18:
        CFRelease(v15);
        goto LABEL_37;
      }
    }
    else
    {
      v15 = 0;
    }
    v18 = v14[9];
    if (v18 <= 6 && (v19 = (uint64_t (**)(unsigned int **))S_class_methods[v18]) != 0)
    {
      switch(a2)
      {
        case 0:
          v25 = v14;
          v26 = 0;
          v20 = v19[3](&v25);
          v21 = v26;
          goto LABEL_23;
        case 1:
          if (!v15)
            goto LABEL_36;
          v25 = v14;
          v26 = v15;
          v22 = v19[4](&v25);
          goto LABEL_39;
        case 2:
          if (!v15)
            goto LABEL_36;
          v25 = v14;
          v26 = v15;
          v27 = 0;
          v20 = v19[5](&v25);
          v21 = v27;
LABEL_23:
          if (v20)
            v23 = v21;
          else
            v23 = 0;
          if (v20)
            goto LABEL_27;
          goto LABEL_40;
        case 3:
          if (!v15)
            goto LABEL_36;
          v25 = v14;
          v26 = v15;
          v24 = v19[6];
          if (v24)
            v22 = v24(&v25);
          else
            v22 = 0;
LABEL_39:
          v23 = 0;
          if (!v22)
            goto LABEL_40;
LABEL_27:
          if (v23)
          {
            if (a5)
              *a5 = my_CFPropertyListCreateVMData(v23, a6);
            CFRelease(v23);
          }
          v17 = 0;
          break;
        default:
LABEL_40:
          v17 = 22;
          break;
      }
    }
    else
    {
      v17 = 6;
    }
    if (v15)
      goto LABEL_18;
  }
  else
  {
    v17 = 2;
  }
LABEL_37:
  *a7 = v17;
}

uint64_t CNSServerConnectionSendCmdAck(int a1, UInt8 *a2, unsigned int a3, int *a4)
{
  CNSServerConnectionHandleType(a1, 3, a2, a3, 0, 0, a4);
  return 0;
}

uint64_t CNSServerConnectionProcessControl(int a1, UInt8 *a2, unsigned int a3, const __CFData **a4, _DWORD *a5, int *a6)
{
  CNSServerConnectionHandleType(a1, 2, a2, a3, a4, a5, a6);
  return 0;
}

uint64_t CNSServerConnectionGetCommandInfo(int a1, const __CFData **a2, _DWORD *a3, int *a4)
{
  CNSServerConnectionHandleType(a1, 0, 0, 0, a2, a3, a4);
  return 0;
}

uint64_t CommandHandlerGetPID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t CommandHandlerGetUID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

void CommandHandlerSetInformation(uint64_t a1, const void *a2)
{
  my_FieldSetRetainedCFType((const void **)(a1 + 48), a2);
}

uint64_t CommandHandlerGetInformation(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

void CommandHandlerListApplyFunction(unsigned int a1, uint64_t a2, uint64_t a3)
{
  _QWORD context[3];

  if (S_handlers)
  {
    context[1] = a2;
    context[0] = a1;
    context[2] = a3;
    CFDictionaryApplyFunction((CFDictionaryRef)S_handlers, (CFDictionaryApplierFunction)CommandHandlerListApplier, context);
  }
}

uint64_t CommandHandlerListApplier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (!*(_DWORD *)a3 || *(_DWORD *)a3 == *(_DWORD *)(a2 + 36))
    return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 8))(a2, *(_QWORD *)(a3 + 16));
  return result;
}

void CommandHandlerClassRegister(unsigned int a1, uint64_t a2)
{
  NSObject *logger;
  os_log_type_t v4;
  const char *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a1 >= 7)
  {
    logger = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v4))
      return;
    v6 = 136315138;
    v7 = CommandHandlerClassString(a1);
    v5 = "Class Handler for %s NOT Registered";
    goto LABEL_7;
  }
  S_class_methods[a1] = a2;
  if (CaptiveIsDebug())
  {
    logger = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      v6 = 136315138;
      v7 = CommandHandlerClassString(a1);
      v5 = "Class Handler for %s Registered";
LABEL_7:
      _os_log_impl(&dword_219EF1000, logger, v4, v5, (uint8_t *)&v6, 0xCu);
    }
  }
}

void command_handler_server(uint64_t a1, mach_msg_header_t *a2)
{
  mach_msg_header_t *v3;
  mach_port_name_t msgh_local_port;
  unsigned int *handler;
  uint64_t v6;
  uint64_t v7;
  NSObject *logger;
  os_log_type_t v9;
  const char *v10;
  int v11;
  uint64_t v12;
  mach_port_t msgh_remote_port;
  mach_msg_option_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (mach_msg_header_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 68, 0);
  if (!CNSServer_server(a2, (uint64_t)v3) && a2->msgh_id == 70)
  {
    msgh_local_port = a2->msgh_local_port;
    handler = (unsigned int *)get_handler(msgh_local_port);
    if (handler)
    {
      v6 = (uint64_t)handler;
      v7 = handler[9];
      logger = mysyslog_get_logger();
      v9 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v9))
      {
        v10 = CommandHandlerClassString(v7);
        v11 = *(_DWORD *)(v6 + 40);
        v15 = 136315394;
        v16 = v10;
        v17 = 1024;
        v18 = v11;
        _os_log_impl(&dword_219EF1000, logger, v9, "CommandHandlerServer: %s pid %d died", (uint8_t *)&v15, 0x12u);
      }
      if (v7 <= 6)
      {
        v12 = S_class_methods[v7];
        if (v12)
          (*(void (**)(uint64_t))(v12 + 16))(v6);
      }
      remove_handler(v6);
      mach_port_mod_refs(*MEMORY[0x24BDAEC58], msgh_local_port, 1u, -1);
    }
  }
  if ((v3->msgh_bits & 0x80000000) == 0)
  {
    msgh_remote_port = v3[1].msgh_remote_port;
    if (msgh_remote_port == -305)
      goto LABEL_20;
    if (msgh_remote_port)
    {
      a2->msgh_remote_port = 0;
      mach_msg_destroy(a2);
    }
  }
  if (!v3->msgh_remote_port)
  {
    if ((v3->msgh_bits & 0x80000000) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
  if ((v3->msgh_bits & 0x1F) == 0x12)
    v14 = 1;
  else
    v14 = 17;
  if ((mach_msg(v3, v14, v3->msgh_size, 0, 0, 0, 0) - 268435459) <= 1)
LABEL_19:
    mach_msg_destroy(v3);
LABEL_20:
  CFAllocatorDeallocate(0, v3);
}

void remove_handler(uint64_t a1)
{
  CFNumberRef v1;
  mach_port_t valuePtr;

  valuePtr = CFMachPortGetPort(*(CFMachPortRef *)(a1 + 16));
  v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  CFDictionaryRemoveValue((CFMutableDictionaryRef)S_handlers, v1);
  CFRelease(v1);
}

void __CommandHandlerDeallocate(uint64_t a1)
{
  __CFRunLoopSource *v2;
  __CFMachPort *v3;
  mach_port_name_t v4;

  v2 = *(__CFRunLoopSource **)(a1 + 24);
  if (v2)
  {
    CFRunLoopSourceInvalidate(v2);
    CFRelease(*(CFTypeRef *)(a1 + 24));
  }
  v3 = *(__CFMachPort **)(a1 + 16);
  if (v3)
  {
    CFMachPortInvalidate(v3);
    CFRelease(*(CFTypeRef *)(a1 + 16));
  }
  v4 = *(_DWORD *)(a1 + 32);
  if (v4)
    mach_port_deallocate(*MEMORY[0x24BDAEC58], v4);
  my_FieldSetRetainedCFType((const void **)(a1 + 48), 0);
}

CFStringRef __CommandHandlerCopyDebugDesc(unsigned int *a1)
{
  const __CFAllocator *v2;
  const char *v3;

  v2 = CFGetAllocator(a1);
  v3 = CommandHandlerClassString(a1[9]);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<CommandHandler %s pid %d>"), v3, a1[10]);
}

const void *get_handler(int a1)
{
  CFNumberRef v1;
  const void *Value;
  int valuePtr;

  if (!S_handlers)
    return 0;
  valuePtr = a1;
  v1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  Value = CFDictionaryGetValue((CFDictionaryRef)S_handlers, v1);
  CFRelease(v1);
  return Value;
}

double TimerCreate()
{
  _QWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x28uLL, 0xA00400EBEDA77uLL);
  if (v0)
  {
    v0[4] = 0;
    result = 0.0;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
  }
  return result;
}

void TimerRelease(uint64_t *a1)
{
  void *v1;

  v1 = (void *)*a1;
  if (*a1)
  {
    TimerCancel(*a1);
    free(v1);
    *a1 = 0;
  }
}

void TimerCancel(uint64_t a1)
{
  NSObject *logger;
  os_log_type_t v3;
  uint8_t v4[16];

  if (a1)
  {
    *(_QWORD *)a1 = 0;
    if (*(_QWORD *)(a1 + 32))
    {
      logger = mysyslog_get_logger();
      v3 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v3))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl(&dword_219EF1000, logger, v3, "timer: freeing timer source", v4, 2u);
      }
      CFRunLoopTimerInvalidate(*(CFRunLoopTimerRef *)(a1 + 32));
      CFRelease(*(CFTypeRef *)(a1 + 32));
      *(_QWORD *)(a1 + 32) = 0;
    }
  }
}

void TimerSet(CFRunLoopTimerRef *a1, __CFRunLoopTimer *a2, __CFRunLoopTimer *a3, __CFRunLoopTimer *a4, __CFRunLoopTimer *a5, double a6)
{
  double v12;
  NSObject *logger;
  os_log_type_t v14;
  __CFRunLoop *Current;
  CFRunLoopTimerContext v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  double v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  memset(&v16, 0, sizeof(v16));
  if (a1)
  {
    TimerCancel((uint64_t)a1);
    if (a2)
    {
      *a1 = a2;
      a1[1] = a3;
      a1[2] = a4;
      a1[3] = a5;
      v16.info = a1;
      v12 = CFAbsoluteTimeGetCurrent() + a6;
      a1[4] = CFRunLoopTimerCreate(0, v12, 0.0, 0, 0, (CFRunLoopTimerCallBack)TimerProcess, &v16);
      logger = mysyslog_get_logger();
      v14 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v14))
      {
        *(_DWORD *)buf = 134218240;
        v18 = a6;
        v19 = 2048;
        v20 = v12;
        _os_log_impl(&dword_219EF1000, logger, v14, "timer: wakeup time is (%0.09g) %0.09g", buf, 0x16u);
      }
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(Current, a1[4], (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    }
  }
}

uint64_t TimerProcess(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(_QWORD, _QWORD, _QWORD);
  uint64_t result;

  v2 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD))a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)a2 = 0;
    return v2(*(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
  }
  return result;
}

void ThirdPartyAppRegisterSSIDs(void *key, void *value)
{
  __CFDictionary *Mutable;

  Mutable = (__CFDictionary *)S_appID_list;
  if (!S_appID_list)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    S_appID_list = (uint64_t)Mutable;
  }
  CFDictionarySetValue(Mutable, key, value);
  BuildSSIDLookup();
}

void BuildSSIDLookup()
{
  const __CFAllocator *v0;
  const __CFDictionary *Mutable;

  if (S_ssid_list)
  {
    CFRelease((CFTypeRef)S_ssid_list);
    S_ssid_list = 0;
  }
  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  S_ssid_list = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  Mutable = (const __CFDictionary *)S_appID_list;
  if (!S_appID_list)
  {
    Mutable = CFDictionaryCreateMutable(v0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    S_appID_list = (uint64_t)Mutable;
  }
  CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)AppIDAddSSIDList, 0);
}

const void *ThirdPartyAppCopyIDsForSSID(void *key)
{
  const void *Value;
  NSObject *logger;
  os_log_type_t v3;
  int v5;
  const void *v6;
  uint64_t v7;

  Value = 0;
  v7 = *MEMORY[0x24BDAC8D0];
  if (key)
  {
    if (S_ssid_list)
    {
      Value = CFDictionaryGetValue((CFDictionaryRef)S_ssid_list, key);
      if (Value)
      {
        logger = mysyslog_get_logger();
        v3 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(logger, v3))
        {
          v5 = 138412290;
          v6 = Value;
          _os_log_impl(&dword_219EF1000, logger, v3, "The current ssid is found in ssidLookup: %@", (uint8_t *)&v5, 0xCu);
        }
        CFRetain(Value);
      }
    }
  }
  return Value;
}

void ThirdPartyAppRemoveSSIDs(void *key)
{
  const __CFDictionary *Mutable;
  NSObject *logger;
  os_log_type_t v4;
  __CFDictionary *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  Mutable = (const __CFDictionary *)S_appID_list;
  if (!S_appID_list)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    S_appID_list = (uint64_t)Mutable;
  }
  if (CFDictionaryContainsKey(Mutable, key))
  {
    logger = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      v6 = 138412290;
      v7 = key;
      _os_log_impl(&dword_219EF1000, logger, v4, "Removing SSID registrations for %@", (uint8_t *)&v6, 0xCu);
    }
    v5 = (__CFDictionary *)S_appID_list;
    if (!S_appID_list)
    {
      v5 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      S_appID_list = (uint64_t)v5;
    }
    CFDictionaryRemoveValue(v5, key);
    BuildSSIDLookup();
  }
}

void ThirdPartyAppHandlerInitialize()
{
  CommandHandlerClassRegister(4u, (uint64_t)ThirdPartyAppHandlerMethods);
}

void AppIDAddSSIDList(void *a1, CFArrayRef theArray)
{
  CFRange v4;

  v4.length = CFArrayGetCount(theArray);
  v4.location = 0;
  CFArrayApplyFunction(theArray, v4, (CFArrayApplierFunction)SSIDAddAppID, a1);
}

void SSIDAddAppID(void *key, const void *a2)
{
  void *Value;

  Value = (void *)CFDictionaryGetValue((CFDictionaryRef)S_ssid_list, key);
  if (!Value)
  {
    Value = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    CFDictionaryAddValue((CFMutableDictionaryRef)S_ssid_list, key, Value);
    CFRelease(Value);
  }
  CFArrayAppendValue((CFMutableArrayRef)Value, a2);
}

uint64_t ThirdPartyAppAuthorize()
{
  return 1;
}

uint64_t ThirdPartyAppRegister()
{
  return 1;
}

void ThirdPartyAppRemove(uint64_t a1)
{
  uint64_t PID;
  NSObject *logger;
  os_log_type_t v3;
  void *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  PID = CommandHandlerGetPID(a1);
  logger = mysyslog_get_logger();
  v3 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v3))
  {
    v5[0] = 67109120;
    v5[1] = PID;
    _os_log_impl(&dword_219EF1000, logger, v3, "Third party app died %d", (uint8_t *)v5, 8u);
  }
  v4 = (void *)DisplayIDCopy(PID);
  ThirdPartyAppRemoveSSIDs(v4);
  CFRelease(v4);
}

uint64_t ThirdPartyAppProvideCommand()
{
  return 0;
}

uint64_t ThirdPartyAppProcessResponse()
{
  return 0;
}

uint64_t ThirdPartyAppProcessControl()
{
  return 0;
}

double CCPGetUnwhitelistedNetworkProbeIntervalRange()
{
  return 259200.0;
}

double CCPGetUnwhitelistedNetworkProbeInterval()
{
  int Number;
  double result;
  double v3;

  v3 = 259200.0;
  Number = CaptivePrefsGetNumber(CFSTR("UnwhitelistedNetworkProbeInterval"), &v3);
  result = v3;
  if (v3 < 60.0 || Number == 0)
    return 259200.0;
  return result;
}

uint64_t CCPSetUnwhitelistedNetworkProbeInterval(double a1)
{
  if (a1 < 60.0)
    return 0;
  CaptivePrefsSetNumber(CFSTR("UnwhitelistedNetworkProbeInterval"), a1);
  return 1;
}

const __SCPreferences *CCPUnsetUnwhitelistedNetworkProbeInterval()
{
  return CaptivePrefsUnset(CFSTR("UnwhitelistedNetworkProbeInterval"));
}

double CCPGetWhitelistedNetworkProbeIntervalRange()
{
  return 86400.0;
}

double CCPGetWhitelistedNetworkProbeInterval()
{
  int Number;
  double result;
  double v3;

  v3 = 86400.0;
  Number = CaptivePrefsGetNumber(CFSTR("WhitelistedNetworkProbeInterval"), &v3);
  result = v3;
  if (v3 < 60.0 || Number == 0)
    return 86400.0;
  return result;
}

uint64_t CCPSetWhitelistedNetworkProbeInterval(double a1)
{
  if (a1 < 60.0)
    return 0;
  CaptivePrefsSetNumber(CFSTR("WhitelistedNetworkProbeInterval"), a1);
  return 1;
}

const __SCPreferences *CCPUnsetWhitelistedNetworkProbeInterval()
{
  return CaptivePrefsUnset(CFSTR("WhitelistedNetworkProbeInterval"));
}

double CCPGetBrokenBackhaulProbeIntervalRange()
{
  return 300.0;
}

double CCPGetBrokenBackhaulProbeInterval()
{
  double result;
  double v1;

  v1 = 300.0;
  if (!CaptivePrefsGetNumber(CFSTR("BrokenBackhaulProbeInterval"), &v1))
    return 300.0;
  result = v1;
  if (v1 < 5.0 || v1 > 3600.0)
    return 300.0;
  return result;
}

uint64_t CCPSetBrokenBackhaulProbeInterval(double a1)
{
  uint64_t result;

  result = 0;
  if (a1 >= 5.0 && a1 <= 3600.0)
  {
    CaptivePrefsSetNumber(CFSTR("BrokenBackhaulProbeInterval"), a1);
    return 1;
  }
  return result;
}

const __SCPreferences *CCPUnsetBrokenBackhaulProbeInterval()
{
  return CaptivePrefsUnset(CFSTR("BrokenBackhaulProbeInterval"));
}

double CCPGetBrokenBackhaulProbeTimeoutRange()
{
  return 20.0;
}

double CCPGetBrokenBackhaulProbeTimeout()
{
  double result;
  double v2;

  v2 = 20.0;
  if (!CaptivePrefsGetNumber(CFSTR("BrokenBackhaulProbeTimeout"), &v2))
    return 20.0;
  result = v2;
  if (v2 < 5.0 || v2 > 120.0)
    return 20.0;
  return result;
}

uint64_t CCPSetBrokenBackhaulProbeTimeout(double a1)
{
  if (a1 < 5.0 || a1 > 120.0)
    return 0;
  CaptivePrefsSetNumber(CFSTR("BrokenBackhaulProbeTimeout"), a1);
  return 1;
}

const __SCPreferences *CCPUnsetBrokenBackhaulProbeTimeout()
{
  return CaptivePrefsUnset(CFSTR("BrokenBackhaulProbeTimeout"));
}

double CCPGetBrokenBackhaulPromptInterval()
{
  int Number;
  double result;
  double v3;

  v3 = 86400.0;
  Number = CaptivePrefsGetNumber(CFSTR("BrokenBackhaulPromptInterval"), &v3);
  result = v3;
  if (v3 < 60.0 || Number == 0)
    return 86400.0;
  return result;
}

uint64_t CCPSetBrokenBackhaulPromptInterval(double a1)
{
  if (a1 < 60.0)
    return 0;
  CaptivePrefsSetNumber(CFSTR("BrokenBackhaulPromptInterval"), a1);
  return 1;
}

const __SCPreferences *CCPUnsetBrokenBackhaulPromptInterval()
{
  return CaptivePrefsUnset(CFSTR("BrokenBackhaulPromptInterval"));
}

uint64_t CCPGetWhitelistedNetworkDetectionEnabled()
{
  return CaptivePrefsGetBoolean(CFSTR("WhitelistedNetworkDetectionEnabled"), 1);
}

const __SCPreferences *CCPSetWhitelistedNetworkDetectionEnabled(int a1)
{
  return CaptivePrefsSetBoolean(CFSTR("WhitelistedNetworkDetectionEnabled"), a1);
}

const __SCPreferences *CCPUnsetWhitelistedNetworkDetectionEnabled()
{
  return CaptivePrefsUnset(CFSTR("WhitelistedNetworkDetectionEnabled"));
}

uint64_t CCPGetWhitelistedProtectedNetworkDetectionEnabled()
{
  return CaptivePrefsGetBoolean(CFSTR("WhitelistedProtectedNetworkDetectionEnabled"), 0);
}

const __SCPreferences *CCPSetWhitelistedProtectedNetworkDetectionEnabled(int a1)
{
  return CaptivePrefsSetBoolean(CFSTR("WhitelistedProtectedNetworkDetectionEnabled"), a1);
}

const __SCPreferences *CCPUnsetWhitelistedProtectedNetworkDetectionEnabled()
{
  return CaptivePrefsUnset(CFSTR("WhitelistedProtectedNetworkDetectionEnabled"));
}

double CCPGetWebSheetLoginValidityIntervalRange()
{
  return 2592000.0;
}

double CCPGetWebSheetLoginValidityInterval()
{
  double result;
  double v1;

  v1 = 2592000.0;
  if (!CaptivePrefsGetNumber(CFSTR("WebSheetLoginValidityInterval"), &v1))
    return 2592000.0;
  result = v1;
  if (v1 < 15.0 || v1 > 2592000.0)
    return 2592000.0;
  return result;
}

uint64_t CCPSetWebSheetLoginValidityInterval(double a1)
{
  uint64_t result;

  result = 0;
  if (a1 >= 15.0 && a1 <= 2592000.0)
  {
    CaptivePrefsSetNumber(CFSTR("WebSheetLoginValidityInterval"), a1);
    return 1;
  }
  return result;
}

const __SCPreferences *CCPUnsetWebSheetLoginValidityInterval()
{
  return CaptivePrefsUnset(CFSTR("WebSheetLoginValidityInterval"));
}

double CCPGetWebSheetInSetupDismissalIntervalRange()
{
  return 1800.0;
}

double CCPGetWebSheetInSetupDismissalInterval()
{
  double result;
  double v1;

  v1 = 1800.0;
  if (!CaptivePrefsGetNumber(CFSTR("WebSheetInSetupDismissalInterval"), &v1))
    return 1800.0;
  result = v1;
  if (v1 < 300.0 || v1 > 3600.0)
    return 1800.0;
  return result;
}

uint64_t CCPSetWebSheetInSetupDismissalInterval(double a1)
{
  uint64_t result;

  result = 0;
  if (a1 >= 300.0 && a1 <= 3600.0)
  {
    CaptivePrefsSetNumber(CFSTR("WebSheetInSetupDismissalInterval"), a1);
    return 1;
  }
  return result;
}

const __SCPreferences *CCPUnsetWebSheetInSetupDismissalInterval()
{
  return CaptivePrefsUnset(CFSTR("WebSheetInSetupDismissalInterval"));
}

uint64_t CaptiveSymptomFramework()
{
  uint64_t result;

  result = CaptiveSymptomFramework_framework;
  if (!CaptiveSymptomFramework_framework)
  {
    result = symptom_framework_init();
    CaptiveSymptomFramework_framework = result;
  }
  return result;
}

uint64_t CaptiveSymptomEnablePassiveDetection(int a1, uint64_t a2)
{
  uint64_t result;
  const char *v5;
  char *v6;

  if (!CaptiveSymptomFramework_framework)
    CaptiveSymptomFramework_framework = symptom_framework_init();
  symptom_new();
  result = symptom_send();
  if (a1)
  {
    if (!CaptiveSymptomFramework_framework)
      CaptiveSymptomFramework_framework = symptom_framework_init();
    symptom_new();
    if (a2)
    {
      v5 = (const char *)_SC_cfstring_to_cstring();
      if (v5)
      {
        v6 = (char *)v5;
        strlen(v5);
        symptom_set_additional_qualifier();
        CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x24BDBD240], v6);
      }
    }
    return symptom_send();
  }
  return result;
}

uint64_t CaptiveSymptomReportCaptiveState()
{
  if (!CaptiveSymptomFramework_framework)
    CaptiveSymptomFramework_framework = symptom_framework_init();
  symptom_new();
  symptom_set_qualifier();
  symptom_set_qualifier();
  return symptom_send();
}

uint64_t CaptiveSymptomReportInconclusiveCaptiveEvaluation()
{
  if (!CaptiveSymptomFramework_framework)
    CaptiveSymptomFramework_framework = symptom_framework_init();
  symptom_new();
  return symptom_send();
}

uint64_t CaptiveSymptomReportBackhaulState()
{
  if (!CaptiveSymptomFramework_framework)
    CaptiveSymptomFramework_framework = symptom_framework_init();
  symptom_new();
  symptom_set_qualifier();
  symptom_set_qualifier();
  return symptom_send();
}

uint64_t CaptiveSymptomScheduleEventFetch(int a1, void *aBlock)
{
  void *v2;
  uint64_t v3;

  v2 = _Block_copy(aBlock);
  v3 = managed_event_fetch();
  if ((v3 & 1) == 0)
    _Block_release(v2);
  return v3;
}

const char *CommandHandlerClassString(unsigned int a1)
{
  if (a1 <= 6)
    return CommandHandlerClassString_strings[a1];
  else
    return "<unknown>";
}

void NetIFRetainWiFiAssertion()
{
  int v0;
  NSObject *logger;
  os_log_type_t v2;
  uint8_t v3[16];

  v0 = S_assertion_refcount++;
  if (!v0 && getWiFiManagerClient())
  {
    logger = mysyslog_get_logger();
    v2 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v2))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_219EF1000, logger, v2, "NetIFRetainWiFiAssertion", v3, 2u);
    }
    WiFiManagerClientSetType();
  }
}

uint64_t getWiFiManagerClient()
{
  NSObject *logger;
  os_log_type_t v1;
  uint8_t v3[16];

  if (!getWiFiManagerClient_client)
  {
    getWiFiManagerClient_client = WiFiManagerClientCreate();
    if (!getWiFiManagerClient_client)
    {
      logger = mysyslog_get_logger();
      v1 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v1))
      {
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_219EF1000, logger, v1, "Failed to create a WiFiManager client", v3, 2u);
      }
    }
  }
  return getWiFiManagerClient_client;
}

void NetIFReleaseWiFiAssertion()
{
  int v0;
  NSObject *logger;
  os_log_type_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v0 = S_assertion_refcount;
  if (S_assertion_refcount)
  {
    --S_assertion_refcount;
    if (v0 == 1 && getWiFiManagerClient())
    {
      logger = mysyslog_get_logger();
      v2 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v2))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_219EF1000, logger, v2, "NetIFReleaseWiFiAssertion", v5, 2u);
      }
      WiFiManagerClientSetType();
    }
  }
  else
  {
    v3 = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v3, v4, "NetIFReleaseWiFiAssertion: Assertion count is zero!", buf, 2u);
    }
  }
}

void NetIFWiFiSetProperty(uint64_t a1, uint64_t a2)
{
  NSObject *logger;
  os_log_type_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (getWiFiManagerClient() && !WiFiManagerClientSetNetworkProperty())
  {
    logger = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      v5 = 138412290;
      v6 = a2;
      _os_log_impl(&dword_219EF1000, logger, v4, "WiFiManagerClientSetNetworkProperty returned FALSE for property [%@]", (uint8_t *)&v5, 0xCu);
    }
  }
}

void NetIFSetRankNever(const __SCNetworkInterface *a1)
{
  NetIFSetRank(a1, 3);
}

void NetIFSetRank(const __SCNetworkInterface *a1, int a2)
{
  CFStringRef BSDName;
  const char *v4;
  NSObject *logger;
  os_log_type_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  int v11;
  NSObject *v12;
  os_log_type_t v13;
  int v14;
  CFStringRef v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  BSDName = SCNetworkInterfaceGetBSDName(a1);
  if (a2 == 3)
    v4 = "Never";
  else
    v4 = "Default";
  if (SCNetworkInterfaceSetPrimaryRank())
  {
    logger = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(logger, v6))
      return;
    v14 = 138412546;
    v15 = BSDName;
    v16 = 2080;
    v17 = v4;
    v7 = "%@: set Rank%s";
    v8 = logger;
    v9 = v6;
    v10 = 22;
  }
  else
  {
    v11 = SCError();
    v12 = mysyslog_get_logger();
    v13 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v12, v13))
      return;
    v14 = 138412802;
    v15 = BSDName;
    v16 = 2080;
    v17 = v4;
    v18 = 2080;
    v19 = SCErrorString(v11);
    v7 = "SCNetworkInterfaceSetPrimaryRank(%@, %s) failed, %s";
    v8 = v12;
    v9 = v13;
    v10 = 32;
  }
  _os_log_impl(&dword_219EF1000, v8, v9, v7, (uint8_t *)&v14, v10);
}

void NetIFSetRankDefault(const __SCNetworkInterface *a1)
{
  NetIFSetRank(a1, 0);
}

uint64_t NetIFCopyNetworkInterface()
{
  return _SCNetworkInterfaceCopyActive();
}

uint64_t NetIFSetNewInterfaceCallBack(uint64_t result)
{
  void *v1;
  const __CFDictionary *v2;
  SCDynamicStoreRef v3;
  __CFRunLoop *Current;

  v1 = (void *)result;
  if (!S_store)
  {
    v2 = CFDictionaryCreate(0, MEMORY[0x24BDF59B8], MEMORY[0x24BDBD270], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v3 = SCDynamicStoreCreateWithOptions(0, CFSTR("Captive"), v2, 0, 0);
    CFRelease(v2);
    S_store = (uint64_t)v3;
    result = getWiFiManagerClient();
    if (result)
    {
      CFRunLoopGetCurrent();
      WiFiManagerClientScheduleWithRunLoop();
      Current = CFRunLoopGetCurrent();
      CFRunLoopWakeUp(Current);
      WiFiManagerClientRegisterDeviceAttachmentCallback();
      result = WiFiManagerClientRegisterServerRestartCallback();
    }
  }
  S_new_interface_callback = v1;
  return result;
}

void *NetIFSetWiFiManagerRestartCallBack(void *result)
{
  S_wifi_manager_restart_callback = result;
  return result;
}

void NetIFCheckForNewInterfaces()
{
  const __CFArray *v0;
  const __CFArray *v1;
  CFIndex Count;
  CFIndex v3;
  CFIndex i;
  void (*v5)(uint64_t);
  uint64_t InterfaceName;
  NSObject *logger;
  os_log_type_t v8;
  uint8_t v9[16];

  if (getWiFiManagerClient())
  {
    v0 = (const __CFArray *)WiFiManagerClientCopyDevices();
    if (v0)
    {
      v1 = v0;
      Count = CFArrayGetCount(v0);
      if (Count >= 1)
      {
        v3 = Count;
        for (i = 0; i != v3; ++i)
        {
          CFArrayGetValueAtIndex(v1, i);
          v5 = (void (*)(uint64_t))S_new_interface_callback;
          if (S_new_interface_callback)
          {
            InterfaceName = WiFiDeviceClientGetInterfaceName();
            v5(InterfaceName);
          }
        }
      }
      CFRelease(v1);
    }
    else
    {
      logger = mysyslog_get_logger();
      v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v8))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_219EF1000, logger, v8, "failed to get the Wi-Fi devices", v9, 2u);
      }
    }
  }
}

void *NetIFSetScanResultsCallBack(void *result)
{
  S_scan_results_callback = result;
  return result;
}

void NetIFEnableScanResults(uint64_t a1)
{
  registerForScanResults(a1);
}

void registerForScanResults(uint64_t a1)
{
  NSObject *logger;
  os_log_type_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (getWiFiManagerClient())
  {
    if (WiFiManagerClientGetDevice())
    {
      WiFiDeviceClientRegisterScanUpdateCallback();
    }
    else
    {
      logger = mysyslog_get_logger();
      v3 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v3))
      {
        v4 = 138412290;
        v5 = a1;
        _os_log_impl(&dword_219EF1000, logger, v3, "WiFiManagerClientGetDevice for %@ returned NULL", (uint8_t *)&v4, 0xCu);
      }
    }
  }
}

void NetIFDisableScanResults(uint64_t a1)
{
  registerForScanResults(a1);
}

uint64_t NetIFCopyCurrentWiFiNetwork(uint64_t a1)
{
  NSObject *logger;
  os_log_type_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (getWiFiManagerClient())
  {
    if (WiFiManagerClientGetDevice())
      return WiFiDeviceClientCopyCurrentNetwork();
    logger = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      v5 = 138412290;
      v6 = a1;
      _os_log_impl(&dword_219EF1000, logger, v4, "WiFiManagerClientGetDevice for %@ returned NULL", (uint8_t *)&v5, 0xCu);
    }
  }
  return 0;
}

uint64_t NetIFCopyCurrentWiFiNetworkWithSignal(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  NSObject *logger;
  os_log_type_t v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!getWiFiManagerClient())
    return 0;
  if (!WiFiManagerClientGetDevice())
  {
    logger = mysyslog_get_logger();
    v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v7))
    {
      v9 = 138412290;
      v10 = a1;
      _os_log_impl(&dword_219EF1000, logger, v7, "WiFiManagerClientGetDevice for %@ returned NULL", (uint8_t *)&v9, 0xCu);
    }
    return 0;
  }
  v2 = WiFiDeviceClientCopyCurrentNetwork();
  if (v2)
  {
    v3 = *MEMORY[0x24BE67E90];
    v4 = WiFiDeviceClientCopyProperty();
    if (v4)
    {
      v5 = (const void *)v4;
      NetIFWiFiSetProperty(v2, v3);
      CFRelease(v5);
    }
  }
  return v2;
}

uint64_t NetIFWiFiNetworkWasAutoJoined(uint64_t a1)
{
  const __CFBoolean *Property;
  CFTypeID TypeID;

  if (a1
    && (Property = (const __CFBoolean *)WiFiNetworkGetProperty(), TypeID = CFBooleanGetTypeID(), Property)
    && CFGetTypeID(Property) == TypeID)
  {
    return CFBooleanGetValue(Property);
  }
  else
  {
    return 0;
  }
}

void NetIFSetCarPlayModeChangeCallBack(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD))
{
  uint64_t WiFiManagerClient;
  NSObject *logger;
  os_log_type_t v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint32_t v10;
  NSObject *v11;
  os_log_type_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  NSObject *v17;
  os_log_type_t v18;
  NSObject *v19;
  os_log_type_t v20;
  NSObject *v21;
  os_log_type_t v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  NSObject *v27;
  os_log_type_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (S_carplay_mode_change_callback != a2)
  {
    S_carplay_mode_change_callback = a2;
    WiFiManagerClient = getWiFiManagerClient();
    if (a2)
    {
      if (WiFiManagerClient)
      {
        if (WiFiManagerClientGetDevice())
        {
          WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback();
          logger = mysyslog_get_logger();
          v6 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(logger, v6))
            return;
          v29 = 138412290;
          v30 = a1;
          v7 = "%@: registered callback for carplay mode change";
LABEL_11:
          v8 = logger;
          v9 = v6;
          v10 = 12;
LABEL_27:
          _os_log_impl(&dword_219EF1000, v8, v9, v7, (uint8_t *)&v29, v10);
          return;
        }
        v17 = mysyslog_get_logger();
        v18 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v17, v18))
          goto LABEL_17;
        v29 = 138412290;
        v30 = a1;
        v13 = "WiFiManagerClientGetDevice for %@ returned NULL";
        v14 = v17;
        v15 = v18;
        v16 = 12;
      }
      else
      {
        v11 = mysyslog_get_logger();
        v12 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v11, v12))
        {
LABEL_17:
          v19 = mysyslog_get_logger();
          v20 = _SC_syslog_os_log_mapping();
          if (!os_log_type_enabled(v19, v20))
            return;
          LOWORD(v29) = 0;
          v7 = "Failed to register a callback for CarPlay Mode Change";
LABEL_26:
          v8 = v19;
          v9 = v20;
          v10 = 2;
          goto LABEL_27;
        }
        LOWORD(v29) = 0;
        v13 = "Failed to find the WiFiManager instance";
        v14 = v11;
        v15 = v12;
        v16 = 2;
      }
      _os_log_impl(&dword_219EF1000, v14, v15, v13, (uint8_t *)&v29, v16);
      goto LABEL_17;
    }
    if (WiFiManagerClient)
    {
      if (WiFiManagerClientGetDevice())
      {
        WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback();
        logger = mysyslog_get_logger();
        v6 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(logger, v6))
          return;
        v29 = 138412290;
        v30 = a1;
        v7 = "%@: un-registered callback for carplay mode change";
        goto LABEL_11;
      }
      v27 = mysyslog_get_logger();
      v28 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v27, v28))
        goto LABEL_24;
      v29 = 138412290;
      v30 = a1;
      v23 = "WiFiManagerClientGetDevice for %@ returned NULL";
      v24 = v27;
      v25 = v28;
      v26 = 12;
    }
    else
    {
      v21 = mysyslog_get_logger();
      v22 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(v21, v22))
      {
LABEL_24:
        v19 = mysyslog_get_logger();
        v20 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v19, v20))
          return;
        LOWORD(v29) = 0;
        v7 = "Failed to un-register the callback for CarPlay Mode Change";
        goto LABEL_26;
      }
      LOWORD(v29) = 0;
      v23 = "Failed to find the WiFiManager instance";
      v24 = v21;
      v25 = v22;
      v26 = 2;
    }
    _os_log_impl(&dword_219EF1000, v24, v25, v23, (uint8_t *)&v29, v26);
    goto LABEL_24;
  }
}

BOOL NetIFWiFiNetworkIsCarPlay()
{
  return WiFiNetworkGetType() - 1 < 2;
}

BOOL NetIFWiFiNetworkIsCarPlayOnly()
{
  return WiFiNetworkGetType() == 1;
}

BOOL NetIFWiFiNetworkIsCarPlayAndInternet()
{
  return WiFiNetworkGetType() == 2;
}

const void *NetIfCopyOwnerApplicationForCurrentNetwork(uint64_t a1)
{
  uint64_t v1;
  const void *v2;
  const void *BundleIdentifier;
  const void *v4;

  v1 = NetIFCopyCurrentWiFiNetwork(a1);
  if (!v1)
    return 0;
  v2 = (const void *)v1;
  BundleIdentifier = (const void *)WiFiNetworkGetBundleIdentifier();
  v4 = BundleIdentifier;
  if (BundleIdentifier)
    CFRetain(BundleIdentifier);
  CFRelease(v2);
  return v4;
}

uint64_t NetIFIsQuickProbeRequired()
{
  uint64_t result;

  result = getWiFiManagerClient();
  if (result)
    return WiFiManagerClientPrivateMacIsQuickProbeRequired();
  return result;
}

uint64_t NetIFReportQuickProbeResult()
{
  uint64_t result;

  result = getWiFiManagerClient();
  if (result)
    return WiFiManagerClientPrivateMacReportProbeResult();
  return result;
}

void NetIFTakeWiFiNetworkOffline(uint64_t a1, uint64_t a2, int a3, const __CFString *a4)
{
  NSObject *logger;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  const __CFString *v12;
  NSObject *v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint64_t SSID;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a2 && getWiFiManagerClient())
  {
    if (WiFiNetworkGetType() == 2)
    {
      logger = mysyslog_get_logger();
      v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v8))
      {
        v19 = 138412290;
        SSID = WiFiNetworkGetSSID();
        _os_log_impl(&dword_219EF1000, logger, v8, "%@: Switching to 'CarPlay Only' mode", (uint8_t *)&v19, 0xCu);
      }
      WiFiManagerClientRemoveNetwork();
    }
    else
    {
      if (a3)
      {
        if (WiFiManagerClientIsNetworkEnabled())
        {
          v9 = mysyslog_get_logger();
          v10 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v9, v10))
          {
            v11 = WiFiNetworkGetSSID();
            v12 = CFSTR("unknown");
            if (a4)
              v12 = a4;
            v19 = 138412546;
            SSID = v11;
            v21 = 2112;
            v22 = v12;
            _os_log_impl(&dword_219EF1000, v9, v10, "Disabling AutoJoin for %@ [Reason: %@]", (uint8_t *)&v19, 0x16u);
          }
          NetIFWiFiSetProperty(a2, *MEMORY[0x24BE14B50]);
          if (a4)
            NetIFWiFiSetProperty(a2, *MEMORY[0x24BE14B58]);
          WiFiManagerClientDisableNetwork();
        }
      }
      else
      {
        v13 = mysyslog_get_logger();
        v14 = _SC_syslog_os_log_mapping();
        if (os_log_type_enabled(v13, (os_log_type_t)v14))
        {
          v19 = 138412290;
          SSID = WiFiNetworkGetSSID();
          _os_log_impl(&dword_219EF1000, v13, (os_log_type_t)v14, "Temporarily disabling (blacklisting) %@", (uint8_t *)&v19, 0xCu);
        }
        WiFiManagerClientTemporarilyDisableNetwork();
      }
      if (WiFiManagerClientGetDevice())
      {
        v15 = WiFiDeviceClientDisassociate();
        if (v15)
        {
          v16 = v15;
          v17 = mysyslog_get_logger();
          v18 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v17, v18))
          {
            v19 = 67109120;
            LODWORD(SSID) = v16;
            _os_log_impl(&dword_219EF1000, v17, v18, "WiFiDeviceClientDisassociate failed: %d", (uint8_t *)&v19, 8u);
          }
        }
      }
    }
  }
}

uint64_t NetIFWiFiNetworkIsCaptive(uint64_t a1, _BYTE *a2)
{
  const void *Property;
  CFTypeID TypeID;

  if (a2)
    *a2 = 0;
  if (!a1)
    return 0;
  Property = (const void *)WiFiNetworkGetProperty();
  TypeID = CFBooleanGetTypeID();
  if (!Property || CFGetTypeID(Property) != TypeID)
    return 0;
  if (a2)
    *a2 = 1;
  return CFBooleanGetValue((CFBooleanRef)Property);
}

uint64_t NetIFGetWiFiNetworkWasCaptive(uint64_t result)
{
  const void *Property;
  CFTypeID TypeID;
  const __CFBoolean *v3;
  CFTypeID v4;

  if (result)
  {
    Property = (const void *)WiFiNetworkGetProperty();
    TypeID = CFBooleanGetTypeID();
    if (!Property
      || CFGetTypeID(Property) != TypeID
      || (result = CFBooleanGetValue((CFBooleanRef)Property), !(_DWORD)result))
    {
      v3 = (const __CFBoolean *)WiFiNetworkGetProperty();
      v4 = CFBooleanGetTypeID();
      if (v3 && CFGetTypeID(v3) == v4)
        return CFBooleanGetValue(v3);
      else
        return 0;
    }
  }
  return result;
}

BOOL NetIFWiFiNetworkHasNeverBeenCaptive(_BOOL8 result)
{
  uint64_t v1;
  int IsCaptive;
  char v3;

  v3 = 0;
  if (result)
  {
    v1 = result;
    IsCaptive = NetIFWiFiNetworkIsCaptive(result, &v3);
    result = 0;
    if (!IsCaptive)
    {
      if (v3)
        return NetIFGetWiFiNetworkWasCaptive(v1) == 0;
    }
  }
  return result;
}

const void *NetIFWiFiNetworkCopyCaptivePortalAPIURL(uint64_t a1)
{
  const void *Property;
  CFTypeID TypeID;

  if (!a1)
    return 0;
  Property = (const void *)WiFiNetworkGetProperty();
  TypeID = CFStringGetTypeID();
  if (Property)
  {
    if (CFGetTypeID(Property) == TypeID)
    {
      CFRetain(Property);
      return Property;
    }
    return 0;
  }
  return Property;
}

void NetIFWiFiNetworkSetCaptivePortalAPIURL(uint64_t a1, const void *a2)
{
  CFTypeID TypeID;

  if (a1)
  {
    TypeID = CFStringGetTypeID();
    if (a2)
    {
      if (CFGetTypeID(a2) == TypeID)
        NetIFWiFiSetProperty(a1, *MEMORY[0x24BE14B28]);
    }
  }
}

void NetIFWiFiNetworkSetCaptivePortalUserPortalURL(uint64_t a1, const void *a2)
{
  CFTypeID TypeID;

  if (a1)
  {
    TypeID = CFStringGetTypeID();
    if (a2)
    {
      if (CFGetTypeID(a2) == TypeID)
        NetIFWiFiSetProperty(a1, *MEMORY[0x24BE14B40]);
    }
  }
}

void NetIFWiFiNetworkSetCaptivePortalVenueInfoURL(uint64_t a1, const void *a2)
{
  CFTypeID TypeID;

  if (a1)
  {
    TypeID = CFStringGetTypeID();
    if (a2)
    {
      if (CFGetTypeID(a2) == TypeID)
        NetIFWiFiSetProperty(a1, *MEMORY[0x24BE14B48]);
    }
  }
}

void NetIFWiFiNetworkSetCaptivePortalCanExtendSession(uint64_t a1, const void *a2)
{
  CFTypeID TypeID;

  if (a1)
  {
    TypeID = CFBooleanGetTypeID();
    if (a2)
    {
      if (CFGetTypeID(a2) == TypeID)
        NetIFWiFiSetProperty(a1, *MEMORY[0x24BE14B30]);
    }
  }
}

void NetIFWiFiNetworkSetCaptivePortalSessionExpiration(uint64_t a1, const void *a2)
{
  CFTypeID TypeID;

  if (a1)
  {
    TypeID = CFNumberGetTypeID();
    if (a2)
    {
      if (CFGetTypeID(a2) == TypeID)
        NetIFWiFiSetProperty(a1, *MEMORY[0x24BE14B38]);
    }
  }
}

void NetIFWiFiNetworkSetCaptive(uint64_t a1, unsigned int a2)
{
  int v4;
  NSObject *logger;
  os_log_type_t v6;
  int v7;
  uint64_t *v8;
  const void *Property;
  CFTypeID TypeID;
  int Value;
  uint64_t v12;
  CFAbsoluteTime Current;
  CFDateRef v14;
  uint64_t *v15;
  const void *v16;
  CFTypeID v17;
  int IsNetworkEnabled;
  int v19;
  _BOOL4 v20;
  uint64_t *v21;
  CFAbsoluteTime v22;
  CFDateRef v23;
  NSObject *v24;
  os_log_type_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t SSID;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (!getWiFiManagerClient())
    return;
  if ((a2 & 1) != 0)
  {
    if ((~a2 & 0x18) == 0)
    {
      logger = mysyslog_get_logger();
      v6 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v6))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_219EF1000, logger, v6, "network marked captive can't also be marked whitelisted", (uint8_t *)&v29, 2u);
      }
    }
    v4 = 1;
  }
  else
  {
    v4 = (a2 >> 3) & 1;
  }
  v7 = a2 & 1;
  v8 = (uint64_t *)MEMORY[0x24BE14B18];
  Property = (const void *)WiFiNetworkGetProperty();
  TypeID = CFBooleanGetTypeID();
  if (!Property || CFGetTypeID(Property) != TypeID)
  {
    Value = 0;
    if (WiFiNetworkIsEAP())
      v7 = 0;
    goto LABEL_17;
  }
  Value = CFBooleanGetValue((CFBooleanRef)Property);
  if (WiFiNetworkIsEAP())
    v7 = 0;
  if (v4 || Value != v7)
  {
LABEL_17:
    if (Value != v7)
      NetIFWiFiSetProperty(a1, *MEMORY[0x24BE14B68]);
    if (v4)
    {
      NetIFWiFiSetProperty(a1, *MEMORY[0x24BE14B60]);
      v12 = *MEMORY[0x24BE14BA0];
      Current = CFAbsoluteTimeGetCurrent();
      v14 = CFDateCreate(0, Current);
      NetIFWiFiSetProperty(a1, v12);
      CFRelease(v14);
    }
    if ((a2 & 0x40) == 0)
      NetIFWiFiSetProperty(a1, *v8);
    Value = v7;
  }
  v15 = (uint64_t *)MEMORY[0x24BE14B50];
  v16 = (const void *)WiFiNetworkGetProperty();
  v17 = CFBooleanGetTypeID();
  if (v16
    && CFGetTypeID(v16) == v17
    && CFBooleanGetValue((CFBooleanRef)v16)
    && ((IsNetworkEnabled = WiFiManagerClientIsNetworkEnabled(), v19 = IsNetworkEnabled, (a2 & 2) != 0)
     || !Value
     || IsNetworkEnabled))
  {
    NetIFWiFiSetProperty(a1, *v15);
    NetIFWiFiSetProperty(a1, *MEMORY[0x24BE14B58]);
    v20 = v19 == 0;
    if ((a2 & 4) != 0)
    {
LABEL_31:
      v21 = (uint64_t *)MEMORY[0x24BE14B10];
      if (!NetIFWiFiNetworkGetBoolean(a1))
        NetIFWiFiSetProperty(a1, *v21);
    }
  }
  else
  {
    v20 = 0;
    if ((a2 & 4) != 0)
      goto LABEL_31;
  }
  if ((a2 & 0x20) != 0)
  {
    v22 = CFAbsoluteTimeGetCurrent();
    v23 = CFDateCreate(0, v22);
    v24 = mysyslog_get_logger();
    v25 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v24, v25))
    {
      v29 = 138412290;
      v30 = (uint64_t)v23;
      _os_log_impl(&dword_219EF1000, v24, v25, "Updated WebSheet Login time to [%@]", (uint8_t *)&v29, 0xCu);
    }
    NetIFWiFiSetProperty(a1, *MEMORY[0x24BE14B20]);
    CFRelease(v23);
  }
  if (v20)
  {
    v26 = mysyslog_get_logger();
    v27 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v26, v27))
    {
      SSID = WiFiNetworkGetSSID();
      v29 = 138412290;
      v30 = SSID;
      _os_log_impl(&dword_219EF1000, v26, v27, "Re-enabling %@", (uint8_t *)&v29, 0xCu);
    }
    WiFiManagerClientEnableNetwork();
  }
}

uint64_t NetIFWiFiNetworkIsUserBypass(uint64_t a1)
{
  return NetIFWiFiNetworkGetBoolean(a1);
}

void NetIFDisableWiFiNetworkIfCurrent(uint64_t a1, const void *a2)
{
  uint64_t v4;
  const void *v5;
  const void *SSID;
  NSObject *logger;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const void *v14;
  __int16 v15;
  const void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = NetIFCopyCurrentWiFiNetwork(a1);
  if (v4)
  {
    v5 = (const void *)v4;
    SSID = (const void *)WiFiNetworkGetSSID();
    if (SSID && CFEqual(a2, SSID))
    {
      if (getWiFiManagerClient())
        WiFiManagerClientDisableNetwork();
    }
    else
    {
      logger = mysyslog_get_logger();
      v8 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(logger, v8))
      {
        v11 = 138412802;
        v12 = a1;
        v13 = 2112;
        v14 = a2;
        v15 = 2112;
        v16 = SSID;
        _os_log_impl(&dword_219EF1000, logger, v8, "%@: specified SSID '%@' not current '%@'", (uint8_t *)&v11, 0x20u);
      }
    }
    CFRelease(v5);
  }
  else
  {
    v9 = mysyslog_get_logger();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = 138412290;
      v12 = a1;
      _os_log_impl(&dword_219EF1000, v9, v10, "Can't get Wi-Fi network for %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

BOOL NetIFWiFiNetworkIsProtected(_BOOL8 result)
{
  if (result)
    return WiFiNetworkIsWEP() || WiFiNetworkIsWPA() || WiFiNetworkIsEAP() != 0;
  return result;
}

uint64_t NetIFWiFiNetworkGetSecurityType()
{
  if (WiFiNetworkIsEAP())
    return 4;
  if (WiFiNetworkIsWPA())
    return 3;
  if (WiFiNetworkIsWEP())
    return 2;
  return 1;
}

BOOL NetIFWiFiNetworkIsProtectedForInterface(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  _BOOL8 IsProtected;
  NSObject *logger;
  os_log_type_t v6;
  uint64_t SSID;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = NetIFCopyCurrentWiFiNetwork(a1);
  if (v2)
  {
    v3 = (const void *)v2;
    IsProtected = NetIFWiFiNetworkIsProtected(v2);
    logger = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      SSID = WiFiNetworkGetSSID();
      v8 = "secure";
      v12 = 138412802;
      v13 = a1;
      if (!IsProtected)
        v8 = "unsecure";
      v14 = 2112;
      v15 = SSID;
      v16 = 2080;
      v17 = v8;
      _os_log_impl(&dword_219EF1000, logger, v6, "%@ Wi-Fi network [%@] is %s", (uint8_t *)&v12, 0x20u);
    }
    CFRelease(v3);
  }
  else
  {
    v9 = mysyslog_get_logger();
    v10 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v9, v10))
    {
      v12 = 138412290;
      v13 = a1;
      _os_log_impl(&dword_219EF1000, v9, v10, "NetIFCopyCurrentWiFiNetwork returned NULL for %@", (uint8_t *)&v12, 0xCu);
    }
    return 0;
  }
  return IsProtected;
}

uint64_t NetIFWiFiNetworkGetBoolean(uint64_t a1)
{
  const __CFBoolean *Property;
  CFTypeID TypeID;

  if (a1
    && (Property = (const __CFBoolean *)WiFiNetworkGetProperty(), TypeID = CFBooleanGetTypeID(), Property)
    && CFGetTypeID(Property) == TypeID)
  {
    return CFBooleanGetValue(Property);
  }
  else
  {
    return 0;
  }
}

uint64_t NetIFWiFiNetworkIsWhitelistedCaptiveNetwork(uint64_t a1)
{
  return NetIFWiFiNetworkGetBoolean(a1);
}

const void *NetIFWiFiNetworkGetWhitelistedCaptiveNetworkProbeDate()
{
  const void *Property;
  CFTypeID TypeID;

  Property = (const void *)WiFiNetworkGetProperty();
  TypeID = CFDateGetTypeID();
  if (!Property)
    return 0;
  if (CFGetTypeID(Property) == TypeID)
    return Property;
  return 0;
}

const void *NetIFWiFiNetworkGetLastWebSheetLoginDate()
{
  const void *Property;
  CFTypeID TypeID;

  Property = (const void *)WiFiNetworkGetProperty();
  TypeID = CFDateGetTypeID();
  if (!Property)
    return 0;
  if (CFGetTypeID(Property) == TypeID)
    return Property;
  return 0;
}

uint64_t NetIFWiFiNetworkForgetAppOwnedNetworks()
{
  uint64_t result;

  result = getWiFiManagerClient();
  if (result)
    return WiFiManagerClientRemoveNetworksWithBundleIdentifier();
  return result;
}

uint64_t NetIFUpdateWiFiNetwork()
{
  uint64_t result;

  result = getWiFiManagerClient();
  if (result)
    return WiFiManagerClientUpdateNetwork();
  return result;
}

CFDictionaryRef NetIFCopyAllServiceInformation()
{
  uint64_t v0;
  uint64_t v1;
  const __CFString *v2;
  const __CFString *v3;
  const __CFArray *v4;
  uint64_t i;
  CFDictionaryRef v6;
  void *values[3];
  _QWORD v9[4];

  v0 = 0;
  v9[3] = *MEMORY[0x24BDAC8D0];
  v1 = *MEMORY[0x24BDF59F0];
  v9[0] = *MEMORY[0x24BDF59C8];
  v9[1] = v1;
  v9[2] = *MEMORY[0x24BDF59F8];
  memset(values, 0, sizeof(values));
  v2 = (const __CFString *)*MEMORY[0x24BDF59B0];
  v3 = (const __CFString *)*MEMORY[0x24BDF5990];
  do
  {
    values[v0] = (void *)SCDynamicStoreKeyCreateNetworkServiceEntity(0, v2, v3, (CFStringRef)v9[v0]);
    ++v0;
  }
  while (v0 != 3);
  v4 = CFArrayCreate(0, (const void **)values, 3, MEMORY[0x24BDBD690]);
  for (i = 0; i != 3; ++i)
    CFRelease(values[i]);
  v6 = SCDynamicStoreCopyMultiple((SCDynamicStoreRef)S_store, 0, v4);
  CFRelease(v4);
  return v6;
}

const __CFDictionary *NetIFCopySignatures(const __CFDictionary *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (result)
  {
    v2 = a2;
    v3 = 0;
    CFDictionaryApplyFunction(result, (CFDictionaryApplierFunction)append_signature, &v2);
    return (const __CFDictionary *)v3;
  }
  return result;
}

void append_signature(int a1, CFDictionaryRef theDict, uint64_t a3)
{
  const void *Value;
  const void *v6;
  const void *v7;
  __CFArray *Mutable;

  Value = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BDF5A68]);
  if (Value)
  {
    if (CFEqual(Value, *(CFTypeRef *)a3))
    {
      v6 = CFDictionaryGetValue(theDict, CFSTR("NetworkSignature"));
      if (v6)
      {
        v7 = v6;
        Mutable = *(__CFArray **)(a3 + 8);
        if (!Mutable)
        {
          Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
          *(_QWORD *)(a3 + 8) = Mutable;
        }
        CFArrayAppendValue(Mutable, v7);
      }
    }
  }
}

const __CFDictionary *NetIFCopyCaptivePortal(const __CFDictionary *result, uint64_t a2)
{
  const __CFDictionary *v2;
  const void *v3;
  uint64_t v4;
  const void *v5;
  const void *context;
  uint64_t v7;

  if (result)
  {
    v2 = result;
    v7 = 0;
    v4 = a2;
    v5 = 0;
    CFDictionaryApplyFunction(result, (CFDictionaryApplierFunction)find_service, &v4);
    v3 = v5;
    if (v5)
    {
      context = v5;
      CFDictionaryApplyFunction(v2, (CFDictionaryApplierFunction)find_portal, &context);
      CFRelease(v3);
      return (const __CFDictionary *)v7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t find_service(const __CFString *a1, CFDictionaryRef theDict, uint64_t a3)
{
  uint64_t result;

  result = (uint64_t)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BDF5A68]);
  if (result)
  {
    result = CFEqual((CFTypeRef)result, *(CFTypeRef *)a3);
    if ((_DWORD)result)
    {
      if (!*(_QWORD *)(a3 + 8))
      {
        result = (uint64_t)copy_service_from_path(a1, 0);
        *(_QWORD *)(a3 + 8) = result;
      }
    }
  }
  return result;
}

void find_portal(const __CFString *a1, const __CFDictionary *a2, uint64_t a3)
{
  const __CFString *v5;
  const __CFString *v6;
  CFComparisonResult v7;
  CFTypeRef v8;
  BOOL v9;
  const __CFString *Value;
  CFTypeRef cf;

  cf = 0;
  v5 = (const __CFString *)copy_service_from_path(a1, &cf);
  v6 = v5;
  if (!v5 || !*(_QWORD *)a3)
  {
    Value = 0;
    goto LABEL_11;
  }
  v7 = CFStringCompare(v5, *(CFStringRef *)a3, 0);
  v8 = cf;
  if (v7)
    v9 = 1;
  else
    v9 = cf == 0;
  if (!v9)
  {
    Value = 0;
    if (CFStringCompare((CFStringRef)cf, (CFStringRef)*MEMORY[0x24BDF59C8], 0) == kCFCompareEqualTo)
      Value = (const __CFString *)CFDictionaryGetValue(a2, (const void *)*MEMORY[0x24BDF5A70]);
LABEL_11:
    v8 = cf;
    if (!cf)
      goto LABEL_13;
    goto LABEL_12;
  }
  Value = 0;
  if (cf)
  {
LABEL_12:
    CFRelease(v8);
    cf = 0;
  }
LABEL_13:
  if (v6)
    CFRelease(v6);
  if (!*(_QWORD *)(a3 + 8) && Value)
  {
    if (CFStringHasPrefix(Value, CFSTR("https://")))
      *(_QWORD *)(a3 + 8) = CFRetain(Value);
  }
}

uint64_t NetIFGetStore()
{
  return S_store;
}

void *handle_device_attach()
{
  void *result;
  uint64_t InterfaceName;
  uint64_t (*v2)(uint64_t);

  result = S_new_interface_callback;
  if (S_new_interface_callback)
  {
    v2 = (uint64_t (*)(uint64_t))S_new_interface_callback;
    InterfaceName = WiFiDeviceClientGetInterfaceName();
    return (void *)v2(InterfaceName);
  }
  return result;
}

void handle_wifi_manager_restart()
{
  NSObject *logger;
  os_log_type_t v1;
  uint8_t v2[16];

  logger = mysyslog_get_logger();
  v1 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v1))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_219EF1000, logger, v1, "wifi manager restarted", v2, 2u);
  }
  if (S_wifi_manager_restart_callback)
    S_wifi_manager_restart_callback();
}

void handle_scan_results(int a1, int a2, CFArrayRef theArray)
{
  CFDictionaryRef v3;
  NSObject *logger;
  os_log_type_t v5;
  CFTypeRef cf;
  int valuePtr;
  void *keys[2];

  if (theArray && S_scan_results_callback && CFArrayGetCount(theArray))
  {
    keys[0] = CFSTR("SCAN_MAXAGE");
    valuePtr = -1;
    cf = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    v3 = CFDictionaryCreate(0, (const void **)keys, &cf, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFRelease(cf);
    logger = mysyslog_get_logger();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v5))
    {
      LOWORD(keys[0]) = 0;
      _os_log_impl(&dword_219EF1000, logger, v5, "received scan results", (uint8_t *)keys, 2u);
    }
    WiFiDeviceClientScanAsync();
    CFRelease(v3);
  }
}

void handle_cached_scan_results(int a1, CFArrayRef theArray)
{
  NSObject *logger;
  os_log_type_t v4;
  void (*v5)(uint64_t, CFArrayRef);
  uint64_t InterfaceName;
  uint8_t v7[16];

  if (theArray && S_scan_results_callback && CFArrayGetCount(theArray))
  {
    logger = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_219EF1000, logger, v4, "received cached scan results", v7, 2u);
    }
    v5 = (void (*)(uint64_t, CFArrayRef))S_scan_results_callback;
    InterfaceName = WiFiDeviceClientGetInterfaceName();
    v5(InterfaceName, theArray);
  }
}

void handle_carplay_mode_change(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *logger;
  os_log_type_t v6;
  NSObject *v7;
  os_log_type_t v8;
  const char *v9;
  int v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  logger = mysyslog_get_logger();
  v6 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(logger, v6))
  {
    v10 = 67109120;
    v11 = a2;
    _os_log_impl(&dword_219EF1000, logger, v6, "CarPlay mode change was notified with %u", (uint8_t *)&v10, 8u);
  }
  if ((a2 - 3) <= 0xFFFFFFFD)
  {
    v7 = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v7, v8))
      return;
    v10 = 67109120;
    v11 = a2;
    v9 = "Callback received an invalid CarPlay mode %d";
LABEL_9:
    _os_log_impl(&dword_219EF1000, v7, v8, v9, (uint8_t *)&v10, 8u);
    return;
  }
  if (handle_carplay_mode_change_current_type == a2)
  {
    v7 = mysyslog_get_logger();
    v8 = _SC_syslog_os_log_mapping();
    if (!os_log_type_enabled(v7, v8))
      return;
    v10 = 67109120;
    v11 = a2;
    v9 = "CarPlay mode change to %d was already handled";
    goto LABEL_9;
  }
  if (S_carplay_mode_change_callback)
    S_carplay_mode_change_callback(a2 == 2, a3);
  handle_carplay_mode_change_current_type = a2;
}

const void *copy_service_from_path(CFStringRef theString, _QWORD *a2)
{
  const __CFArray *ArrayBySeparatingStrings;
  CFIndex Count;
  const void *v5;
  CFIndex v6;
  const void *ValueAtIndex;

  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, theString, CFSTR("/"));
  Count = CFArrayGetCount(ArrayBySeparatingStrings);
  v5 = 0;
  if (Count < 4
    || (v6 = Count, v5 = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 3), CFRetain(v5), !a2)
    || v6 == 4)
  {
    if (!a2)
      goto LABEL_8;
    ValueAtIndex = 0;
  }
  else
  {
    ValueAtIndex = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 4);
  }
  CFRetain(ValueAtIndex);
  *a2 = ValueAtIndex;
LABEL_8:
  if (ArrayBySeparatingStrings)
    CFRelease(ArrayBySeparatingStrings);
  return v5;
}

const char *CNPCommandTypeGetString(unsigned int a1)
{
  if (a1 <= 6)
    return CNPCommandTypeGetString_strings[a1];
  else
    return "<unknown>";
}

const char *CNPResultGetString(unsigned int a1)
{
  if (a1 <= 6)
    return CNPResultGetString_strings[a1];
  else
    return "<unknown>";
}

const char *CNPConfidenceGetString(unsigned int a1)
{
  if (a1 <= 2)
    return CNPConfidenceGetString_strings[a1];
  else
    return "<unknown>";
}

const char *CNPCaptiveDetectionTypeGetString(unsigned int a1)
{
  if (a1 <= 3)
    return CNPCaptiveDetectionTypeGetString_strings[a1];
  else
    return "<unknown>";
}

uint64_t CNAccountsVZWValidate()
{
  const __CFString *v0;
  const __CFString *v1;
  id v2;
  _BOOL8 v3;

  v0 = VZWCopyPhoneNumber();
  if (!v0)
    return 0;
  v1 = v0;
  v2 = CopyMobileEquipmentInfo();
  v3 = v2 != 0;
  CFRelease(v1);
  if (v2)
  {
    CFRelease(v2);
    return 1;
  }
  return v3;
}

const __CFString *VZWCopyPhoneNumber()
{
  const __CFString *v0;
  const __CFString *v1;
  unint64_t Length;
  CFStringRef v3;
  NSObject *v4;
  os_log_type_t v5;
  NSObject *logger;
  os_log_type_t v7;
  int v9;
  const __CFString *v10;
  uint64_t v11;
  CFRange v12;

  v11 = *MEMORY[0x24BDAC8D0];
  v0 = (const __CFString *)CopyPhoneNumber();
  if (!v0
    || (v1 = v0, Length = CFStringGetLength(v0), Length >= 0xB)
    && (v12.location = Length - 10,
        v12.length = 10,
        v3 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x24BDBD240], v1, v12),
        CFRelease(v1),
        (v1 = v3) == 0))
  {
    logger = mysyslog_get_logger();
    v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v7))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_219EF1000, logger, v7, "failed to obtain the device phone number", (uint8_t *)&v9, 2u);
    }
    return 0;
  }
  if (CFStringHasPrefix(v1, CFSTR("000000")))
  {
    v4 = mysyslog_get_logger();
    v5 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v4, v5))
    {
      v9 = 138412290;
      v10 = v1;
      _os_log_impl(&dword_219EF1000, v4, v5, "ignoring device phone number %@ (cold SIM)", (uint8_t *)&v9, 0xCu);
    }
    CFRelease(v1);
    return 0;
  }
  return v1;
}

_OWORD *CNAccountsVZWQueryStart(uint64_t a1, const void *a2, uint64_t a3, const __CFString *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _OWORD *v11;
  _OWORD *v12;
  __CFRunLoop *Current;
  CFRunLoopSourceContext v15;

  v11 = malloc_type_malloc(0x38uLL, 0xE00409C3A2E09uLL);
  v12 = v11;
  if (v11)
  {
    v15.version = 0;
    memset(&v15.retain, 0, 56);
    v15.info = v11;
    v15.perform = (void (__cdecl *)(void *))VZWQueryDo;
    *v11 = 0u;
    v11[1] = 0u;
    v11[2] = 0u;
    *((_QWORD *)v11 + 6) = 0;
    *((_QWORD *)v11 + 1) = VZWQueryAbort;
    *((_QWORD *)v11 + 2) = a6;
    *((_QWORD *)v11 + 3) = a7;
    *((_QWORD *)v11 + 4) = a2;
    CFRetain(a2);
    if (a4 && CFStringGetLength(a4) >= 1)
    {
      *((_QWORD *)v12 + 5) = a4;
      CFRetain(a4);
    }
    *((_QWORD *)v12 + 6) = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &v15);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, *((CFRunLoopSourceRef *)v12 + 6), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
    CFRunLoopSourceSignal(*((CFRunLoopSourceRef *)v12 + 6));
  }
  return v12;
}

void VZWQueryDo(uint64_t a1)
{
  __CFRunLoop *Current;
  const void *v3;
  const void *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  NSObject *logger;
  os_log_type_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  NSObject *v14;
  os_log_type_t v15;
  const __CFNumber *v16;
  const __CFDictionary *v17;
  const __CFString *v18;
  const __CFString *Value;
  const __CFString *v20;
  __CFString *v21;
  CFAbsoluteTime v22;
  __CFCalendar *v23;
  CFStringRef v24;
  const __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFDictionary *v28;
  const __CFString *v29;
  const void **v30;
  const void *v31;
  const void *v32;
  const __CFString *v33;
  CFLocaleRef v34;
  const __CFLocale *v35;
  CFIndex Length;
  __CFString *MutableCopy;
  __CFString *v38;
  __CFString *v39;
  const __CFString *v40;
  char *v41;
  char *v42;
  unsigned int v43;
  char *v44;
  char *v45;
  size_t v46;
  int v47;
  char *v48;
  NSObject *v49;
  os_log_type_t v50;
  const __CFDictionary *v51;
  const __CFDictionary *v52;
  CFIndex Count;
  const __CFDictionary *cf;
  CC_SHA1_CTX c;
  char v56;
  size_t valuePtr;
  CFDictionaryRef theDict[3];
  _BYTE buf[24];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  CFRunLoopSourceInvalidate(*(CFRunLoopSourceRef *)(a1 + 48));
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 48), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 48) = 0;
  }
  memset(&c, 0, sizeof(c));
  CNAccountsCredentialQueryInvalidate((uint64_t *)a1);
  v4 = (const void *)_CTServerConnectionCreateWithIdentifier();
  theDict[0] = 0;
  LODWORD(valuePtr) = 0;
  v56 = 0;
  v5 = CopyRATSelection();
  v6 = _CTServerConnectionCopySystemCapabilities();
  if ((_DWORD)v6)
  {
    v7 = HIDWORD(v6);
    if ((_DWORD)v6 == 2)
    {
      logger = mysyslog_get_logger();
      v9 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(logger, v9))
        goto LABEL_15;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "_CTServerConnectionCopySystemCapabilities";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = mach_error_string(v7);
      v10 = "%s failed, %s";
    }
    else
    {
      if ((_DWORD)v6 != 1)
      {
        v14 = mysyslog_get_logger();
        v15 = _SC_syslog_os_log_mapping();
        if (!os_log_type_enabled(v14, v15))
          goto LABEL_15;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "_CTServerConnectionCopySystemCapabilities";
        v10 = "%s failed";
        v11 = v14;
        v12 = v15;
        v13 = 12;
        goto LABEL_14;
      }
      logger = mysyslog_get_logger();
      v9 = _SC_syslog_os_log_mapping();
      if (!os_log_type_enabled(logger, v9))
        goto LABEL_15;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "_CTServerConnectionCopySystemCapabilities";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = strerror(v7);
      v10 = "%s failed, %s";
    }
    v11 = logger;
    v12 = v9;
    v13 = 22;
LABEL_14:
    _os_log_impl(&dword_219EF1000, v11, v12, v10, buf, v13);
  }
LABEL_15:
  if (v5)
    CFRelease(v5);
  v16 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  v17 = (const __CFDictionary *)CopyMobileEquipmentInfo();
  CFRelease(v4);
  v18 = VZWCopyPhoneNumber();
  Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), CFSTR("AuthenticationRealm"));
  v20 = CFSTR("hds.vzw3g.com");
  if (Value)
    v20 = Value;
  v21 = (__CFString *)CFStringCreateWithFormat(0, 0, CFSTR("VzW3652987!%@@%@"), v18, v20);
  v22 = CFAbsoluteTimeGetCurrent();
  *(_QWORD *)buf = 0;
  valuePtr = 0;
  theDict[0] = 0;
  v23 = CFCalendarCreateWithIdentifier(0, (CFCalendarIdentifier)*MEMORY[0x24BDBD3B8]);
  CFCalendarDecomposeAbsoluteTime(v23, v22, "yMd", &valuePtr, theDict, buf);
  CFRelease(v23);
  v24 = CFStringCreateWithFormat(0, 0, CFSTR("%02d%02d%04d"), theDict[0], *(_QWORD *)buf, valuePtr);
  v25 = v24;
  v26 = 0;
  if (!v17 || !v18 || !v21)
  {
    v27 = 0;
    v28 = 0;
    v29 = 0;
    goto LABEL_30;
  }
  v27 = 0;
  v28 = 0;
  v29 = 0;
  if (!v24)
    goto LABEL_30;
  CC_SHA1_Init(&c);
  if (!addCFStringToHash(&c, v25))
    goto LABEL_76;
  v29 = 0;
  if (!addCFStringToHash(&c, v18) || !v16)
    goto LABEL_77;
  *(_DWORD *)buf = 0;
  if (!CFNumberGetValue(v16, kCFNumberIntType, buf))
    goto LABEL_76;
  if ((*(_DWORD *)buf - 1) <= 1)
  {
    v30 = (const void **)MEMORY[0x24BDC2AB0];
    goto LABEL_54;
  }
  if (*(_DWORD *)buf != 3)
  {
LABEL_76:
    v29 = 0;
LABEL_77:
    (*(void (**)(_QWORD, _QWORD))(a1 + 16))(*(_QWORD *)(a1 + 24), 0);
    v28 = 0;
    v27 = 0;
    v26 = 0;
    goto LABEL_78;
  }
  v30 = (const void **)MEMORY[0x24BDC2AA8];
LABEL_54:
  v33 = (const __CFString *)CFDictionaryGetValue(v17, *v30);
  v29 = v33;
  if (!v33)
    goto LABEL_76;
  CFRetain(v33);
  v34 = CFLocaleCopyCurrent();
  if (v34)
  {
    v35 = v34;
    Length = CFStringGetLength(v29);
    MutableCopy = CFStringCreateMutableCopy(0, Length, v29);
    if (MutableCopy)
    {
      v38 = MutableCopy;
      CFStringLowercase(MutableCopy, v35);
      CFRelease(v29);
      v29 = v38;
    }
    CFRelease(v35);
  }
  if (!addCFStringToHash(&c, v29))
    goto LABEL_77;
  CC_SHA1_Final((unsigned __int8 *)theDict, &c);
  v39 = dataCopyHexString((unsigned __int8 *)theDict, 20);
  if (!v39)
    goto LABEL_77;
  v26 = v39;
  v40 = *(const __CFString **)(a1 + 40);
  if (!v40)
  {
    v27 = 0;
    goto LABEL_81;
  }
  v41 = stringToUTF8String(v40);
  if (!v41)
    goto LABEL_72;
  v42 = v41;
  v43 = if_nametoindex(v41);
  free(v42);
  if (!v43
    || (valuePtr = 0,
        *(_OWORD *)buf = xmmword_219F1DA60,
        *(_DWORD *)&buf[16] = 3,
        *(_DWORD *)&buf[20] = v43,
        sysctl((int *)buf, 6u, 0, &valuePtr, 0, 0) < 0)
    || (v44 = (char *)malloc_type_malloc(valuePtr, 0x5CA7404EuLL)) == 0)
  {
LABEL_72:
    v49 = mysyslog_get_logger();
    v50 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v49, v50))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219EF1000, v49, v50, "VZWCopyHardwareAddressHexString: failed to obtain the WiFi interface MAC", buf, 2u);
    }
    v27 = 0;
    goto LABEL_75;
  }
  v45 = v44;
  if (sysctl((int *)buf, 6u, v44, &valuePtr, 0, 0) < 0 || !valuePtr)
  {
LABEL_71:
    free(v45);
    goto LABEL_72;
  }
  v46 = 0;
  v47 = 0;
  while (1)
  {
    v48 = &v45[v46];
    if (v48[3] == 14)
      break;
    v46 = v47 + *(unsigned __int16 *)v48;
    v47 = v46;
    if (valuePtr <= v46)
      goto LABEL_71;
  }
  v27 = dataCopyHexString((unsigned __int8 *)&v48[v48[117] + 120], v48[118]);
  free(v45);
  if (!v27)
    goto LABEL_72;
LABEL_81:
  v51 = WISPrCredentialsDictionaryCreate(v21, v26);
  if (!v51)
  {
LABEL_75:
    v28 = 0;
    goto LABEL_30;
  }
  v52 = v51;
  cf = v51;
  Count = CFDictionaryGetCount(v51);
  v28 = CFDictionaryCreateMutableCopy(0, Count + 3, v52);
  CFRelease(cf);
  if (v28)
  {
    CFDictionaryAddValue(v28, CFSTR("device-type"), v16);
    CFDictionaryAddValue(v28, CFSTR("calling-station-id"), v27);
    CFDictionaryAddValue(v28, CFSTR("device-model-number"), CFSTR("iOS-devices"));
  }
LABEL_30:
  (*(void (**)(_QWORD, __CFDictionary *))(a1 + 16))(*(_QWORD *)(a1 + 24), v28);
  if (!v17)
  {
    if (!v18)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_78:
  CFRelease(v17);
  if (v18)
LABEL_32:
    CFRelease(v18);
LABEL_33:
  if (v25)
    CFRelease(v25);
  if (v21)
    CFRelease(v21);
  if (v26)
    CFRelease(v26);
  if (v27)
    CFRelease(v27);
  if (v16)
    CFRelease(v16);
  if (v29)
    CFRelease(v29);
  if (v28)
    CFRelease(v28);
  v31 = *(const void **)(a1 + 32);
  if (v31)
  {
    CFRelease(v31);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v32 = *(const void **)(a1 + 40);
  if (v32)
    CFRelease(v32);
  free((void *)a1);
}

void VZWQueryAbort(uint64_t a1)
{
  __CFRunLoop *Current;
  const void *v3;
  const void *v4;
  const void *v5;

  CFRunLoopSourceInvalidate(*(CFRunLoopSourceRef *)(a1 + 48));
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 48), (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  v3 = *(const void **)(a1 + 48);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 48) = 0;
  }
  v4 = *(const void **)(a1 + 32);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
  free((void *)a1);
}

char *addCFStringToHash(CC_SHA1_CTX *a1, CFStringRef theString)
{
  char *result;
  void *v5;
  CC_LONG v6;

  if (CFStringGetLength(theString) < 1)
    return 0;
  result = stringToUTF8String(theString);
  if (result)
  {
    v5 = result;
    v6 = strlen(result);
    CC_SHA1_Update(a1, v5, v6);
    free(v5);
    return (char *)1;
  }
  return result;
}

__CFString *dataCopyHexString(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  __CFString *Mutable;
  unsigned int v5;

  v2 = a2;
  Mutable = CFStringCreateMutable(0, 2 * a2);
  if (Mutable && v2)
  {
    do
    {
      v5 = *a1++;
      CFStringAppendFormat(Mutable, 0, CFSTR("%02x"), v5);
      --v2;
    }
    while (v2);
  }
  return Mutable;
}

char *stringToUTF8String(const __CFString *a1)
{
  CFIndex Length;
  CFIndex v3;
  char *v4;

  Length = CFStringGetLength(a1);
  v3 = Length + 1;
  if (Length == -1)
    return 0;
  v4 = (char *)malloc_type_malloc(Length + 1, 0x7FEC8D0EuLL);
  if (v4)
    CFStringGetCString(a1, v4, v3, 0x8000100u);
  return v4;
}

void CNPluginMonitorHandlerInitialize()
{
  CommandHandlerClassRegister(6u, (uint64_t)CNPluginMonitorHandlerMethods);
}

uint64_t CNPluginMonitorHandlerPluginListChanged()
{
  CFDictionaryRef v0;

  v0 = CNPluginMonitorHandlerCopyCurrentCommand();
  CommandHandlerListApplyFunction(6u, (uint64_t)CNPluginMonitorAppendCommand, (uint64_t)v0);
  CFRelease(v0);
  return notify_post("com.apple.networking.captive.CNPluginListChanged");
}

CFDictionaryRef CNPluginMonitorHandlerCopyCurrentCommand()
{
  CFMutableArrayRef v0;
  CFIndex v1;
  CFNumberRef v2;
  CFDictionaryRef v3;
  int valuePtr;
  void *values;
  CFMutableArrayRef v7;
  void *keys;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v0 = CNPluginStateListCopyDisplayIDs();
  v1 = 1;
  valuePtr = 1;
  v9 = 0;
  v7 = 0;
  v2 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  keys = CFSTR("EventType");
  values = v2;
  if (v0)
  {
    v9 = CFSTR("DisplayIDs");
    v7 = v0;
    v1 = 2;
  }
  v3 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, v1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFRelease(v2);
  if (v0)
    CFRelease(v0);
  return v3;
}

uint64_t CNPluginMonitorAuthorize(__int128 *a1)
{
  __int128 v2;
  __int128 v3;
  uint64_t result;
  NSObject *logger;
  os_log_type_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = a1[1];
  v7 = *a1;
  v8 = v2;
  if (!audit_token_get_euid(&v7))
    return 1;
  v3 = a1[1];
  v7 = *a1;
  v8 = v3;
  result = audit_token_has_BOOLean_entitlement(&v7, CFSTR("com.apple.captive.private"));
  if (!(_DWORD)result)
  {
    logger = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    result = os_log_type_enabled(logger, v6);
    if ((_DWORD)result)
    {
      LODWORD(v7) = 136315138;
      *(_QWORD *)((char *)&v7 + 4) = "com.apple.captive.private";
      _os_log_impl(&dword_219EF1000, logger, v6, "CNPluginMonitor requires root or '%s' entitlement", (uint8_t *)&v7, 0xCu);
      return 0;
    }
  }
  return result;
}

uint64_t CNPluginMonitorRegister(uint64_t *a1)
{
  CFMutableDictionaryRef Mutable;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CommandHandlerSetInformation(*a1, Mutable);
  CFRelease(Mutable);
  return 1;
}

void CNPluginMonitorRemove(uint64_t a1)
{
  CNPluginMonitorSetIsEnabled(a1, 0);
}

uint64_t CNPluginMonitorProvideCommand(uint64_t *a1)
{
  const __CFDictionary *Information;
  const void *Value;
  __CFDictionary *v4;

  Information = (const __CFDictionary *)CommandHandlerGetInformation(*a1);
  Value = CFDictionaryGetValue(Information, CFSTR("CommandList"));
  if (Value)
  {
    a1[1] = (uint64_t)CFRetain(Value);
    v4 = (__CFDictionary *)CommandHandlerGetInformation(*a1);
    if (v4)
      CFDictionaryRemoveValue(v4, CFSTR("CommandList"));
  }
  return 1;
}

uint64_t CNPluginMonitorProcessResponse()
{
  return 0;
}

uint64_t CNPluginMonitorProcessControl(uint64_t a1)
{
  const void *Value;
  const void *v3;
  CFTypeID TypeID;
  uint64_t result;
  CFTypeID v6;
  int v7;
  int v8;
  uint64_t valuePtr;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), CFSTR("Type"));
  v3 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), CFSTR("EventType"));
  TypeID = CFNumberGetTypeID();
  if (!Value || CFGetTypeID(Value) != TypeID)
    return 0;
  valuePtr = 0;
  result = CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, &valuePtr);
  if (!(_DWORD)result)
    return result;
  v6 = CFNumberGetTypeID();
  if (!v3 || CFGetTypeID(v3) != v6)
    return 0;
  v7 = CFNumberGetValue((CFNumberRef)v3, kCFNumberSInt32Type, (char *)&valuePtr + 4);
  result = 0;
  if (v7 && HIDWORD(valuePtr) == 1)
  {
    if ((_DWORD)valuePtr == 1)
    {
      v8 = 1;
      goto LABEL_14;
    }
    if ((_DWORD)valuePtr == 2)
    {
      v8 = 0;
LABEL_14:
      CNPluginMonitorSetIsEnabled(*(_QWORD *)a1, v8);
      return 1;
    }
    return 0;
  }
  return result;
}

void CNPluginMonitorSetIsEnabled(uint64_t a1, int a2)
{
  const __CFDictionary *Information;
  __CFDictionary *v5;
  NSObject *logger;
  os_log_type_t v7;
  _BOOL4 v8;
  CFDictionaryRef v9;
  __CFDictionary *v10;
  int v11;
  int PID;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  Information = (const __CFDictionary *)CommandHandlerGetInformation(a1);
  if (Information)
  {
    v5 = Information;
    if (CFDictionaryContainsKey(Information, CFSTR("IsEnabled")) != a2)
    {
      logger = mysyslog_get_logger();
      v7 = _SC_syslog_os_log_mapping();
      v8 = os_log_type_enabled(logger, v7);
      if (a2)
      {
        if (v8)
        {
          v11 = 67109120;
          PID = CommandHandlerGetPID(a1);
          _os_log_impl(&dword_219EF1000, logger, v7, "PluginMonitor ENABLE [pid %d]", (uint8_t *)&v11, 8u);
        }
        CFDictionarySetValue(v5, CFSTR("IsEnabled"), (const void *)*MEMORY[0x24BDBD270]);
        v9 = CNPluginMonitorHandlerCopyCurrentCommand();
        CNPluginMonitorAppendCommand(a1, v9);
        CFRelease(v9);
      }
      else
      {
        if (v8)
        {
          v11 = 67109120;
          PID = CommandHandlerGetPID(a1);
          _os_log_impl(&dword_219EF1000, logger, v7, "PluginMonitor DISABLE [pid %d]", (uint8_t *)&v11, 8u);
        }
        CFDictionaryRemoveValue(v5, CFSTR("IsEnabled"));
        v10 = (__CFDictionary *)CommandHandlerGetInformation(a1);
        if (v10)
          CFDictionaryRemoveValue(v10, CFSTR("CommandList"));
      }
    }
  }
}

uint64_t CNPluginMonitorAppendCommand(uint64_t a1, void *a2)
{
  CFArrayRef v3;
  void *values;

  values = a2;
  v3 = CFArrayCreate(0, (const void **)&values, 1, MEMORY[0x24BDBD690]);
  CNScanListFilterSetCommandList(a1, v3);
  CFRelease(v3);
  return CommandHandlerNotify(a1);
}

uint64_t audit_token_get_pid(_OWORD *a1)
{
  __int128 v1;
  audit_token_t atoken;
  pid_t pidp;

  pidp = 0;
  v1 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v1;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  return pidp;
}

uint64_t audit_token_get_euid(_OWORD *a1)
{
  __int128 v1;
  audit_token_t atoken;
  uid_t euidp;

  euidp = 0;
  v1 = a1[1];
  *(_OWORD *)atoken.val = *a1;
  *(_OWORD *)&atoken.val[4] = v1;
  audit_token_to_au32(&atoken, 0, &euidp, 0, 0, 0, 0, 0, 0);
  return euidp;
}

uint64_t audit_token_has_BOOLean_entitlement(_OWORD *a1, const __CFString *a2)
{
  __int128 v3;
  __SecTask *v4;
  __SecTask *v5;
  const __CFBoolean *v6;
  const __CFBoolean *v7;
  CFTypeID TypeID;
  uint64_t Value;
  NSObject *logger;
  os_log_type_t v11;
  audit_token_t v13;

  v3 = a1[1];
  *(_OWORD *)v13.val = *a1;
  *(_OWORD *)&v13.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(0, &v13);
  if (v4)
  {
    v5 = v4;
    v6 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v4, a2, 0);
    if (v6)
    {
      v7 = v6;
      TypeID = CFBooleanGetTypeID();
      if (CFGetTypeID(v7) == TypeID)
        Value = CFBooleanGetValue(v7);
      else
        Value = 0;
      CFRelease(v7);
    }
    else
    {
      Value = 0;
    }
    CFRelease(v5);
  }
  else
  {
    logger = mysyslog_get_logger();
    v11 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v11))
    {
      LOWORD(v13.val[0]) = 0;
      _os_log_impl(&dword_219EF1000, logger, v11, "SecTaskCreateWithAuditToken failed", (uint8_t *)&v13, 2u);
    }
    return 0;
  }
  return Value;
}

BOOL isCallingInternalProcEntitled(_OWORD *a1)
{
  NSObject *logger;
  __int128 v3;
  pid_t v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  _BOOL8 value;
  int v11;
  audit_token_t *p_atoken;
  audit_token_t atoken;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (isCallingInternalProcEntitled_once != -1)
    dispatch_once(&isCallingInternalProcEntitled_once, &__block_literal_global_3);
  if (!isCallingInternalProcEntitled_result)
    return 0;
  logger = mysyslog_get_logger();
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    v3 = a1[1];
    *(_OWORD *)atoken.val = *a1;
    *(_OWORD *)&atoken.val[4] = v3;
    v4 = audit_token_to_pid(&atoken);
    proc_name(v4, &atoken, 0x40u);
    v5 = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v5, v6))
    {
      v11 = 136315138;
      p_atoken = &atoken;
      _os_log_impl(&dword_219EF1000, v5, v6, "Process [%s] is requesting current Wi-Fi network information", (uint8_t *)&v11, 0xCu);
    }
  }
  v7 = (void *)xpc_copy_entitlement_for_token();
  if (!v7)
    return 0;
  v8 = v7;
  value = xpc_BOOL_get_value(v7);
  xpc_release(v8);
  return value;
}

uint64_t __isCallingInternalProcEntitled_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  isCallingInternalProcEntitled_result = result;
  return result;
}

uint64_t IsChinaDevice()
{
  const void *v0;
  const void *v1;
  BOOL v2;
  NSObject *logger;
  os_log_type_t v4;
  int v6;
  const void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((IsChinaDevice_done & 1) == 0)
  {
    IsChinaDevice_done = 1;
    v0 = (const void *)CPGetDeviceRegionCode();
    v1 = v0;
    if (v0)
      v2 = CFEqual(v0, CFSTR("CH")) != 0;
    else
      v2 = 0;
    IsChinaDevice_is_china = v2;
    logger = mysyslog_get_logger();
    v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v4))
    {
      v6 = 138412290;
      v7 = v1;
      _os_log_impl(&dword_219EF1000, logger, v4, "Region code is %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return IsChinaDevice_is_china;
}

__CFRunLoopSource *my_CFRunLoopSourceCreateForBSDNotification(const char *a1, uint64_t a2, uint64_t a3, _DWORD *a4, __CFMachPort **a5)
{
  NSObject *logger;
  os_log_type_t v9;
  __CFMachPort *v10;
  __CFMachPort *v11;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v13;
  __CFRunLoop *Current;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  os_log_type_t v18;
  __int16 v20;
  int out_token[2];
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = 0;
  v22 = 0u;
  v23 = 0u;
  *(_QWORD *)out_token = 0;
  if (notify_register_mach_port(a1, (mach_port_t *)&out_token[1], 0, out_token))
  {
    logger = mysyslog_get_logger();
    v9 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v9))
    {
      v20 = 0;
      _os_log_impl(&dword_219EF1000, logger, v9, "notify_register_mach_port() failed", (uint8_t *)&v20, 2u);
    }
    return 0;
  }
  *((_QWORD *)&v22 + 1) = a3;
  v10 = (__CFMachPort *)_SC_CFMachPortCreateWithPort();
  if (!v10)
  {
    v15 = mysyslog_get_logger();
    v16 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v15, v16))
    {
      v20 = 0;
      _os_log_impl(&dword_219EF1000, v15, v16, "CFMachPortCreateWithPort() failed", (uint8_t *)&v20, 2u);
    }
    goto LABEL_12;
  }
  v11 = v10;
  RunLoopSource = CFMachPortCreateRunLoopSource(0, v10, 0);
  if (!RunLoopSource)
  {
    v17 = mysyslog_get_logger();
    v18 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v17, v18))
    {
      v20 = 0;
      _os_log_impl(&dword_219EF1000, v17, v18, "CFMachPortCreateRunLoopSource() failed", (uint8_t *)&v20, 2u);
    }
    CFRelease(v11);
LABEL_12:
    notify_cancel(out_token[0]);
    return 0;
  }
  v13 = RunLoopSource;
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddSource(Current, v13, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
  *a5 = v11;
  *a4 = out_token[0];
  return v13;
}

void CaptiveSetBundle(CFTypeRef cf)
{
  my_FieldSetRetainedCFType((const void **)&sBundleRef, cf);
}

uint64_t CaptiveGetBundle()
{
  return sBundleRef;
}

const void *CaptiveCopySettings()
{
  const void *result;
  const __CFURL *v1;
  const __CFURL *v2;
  const __CFAllocator *v3;
  __CFReadStream *v4;
  __CFReadStream *v5;
  CFPropertyListRef v6;
  const void *v7;
  CFTypeID TypeID;
  NSObject *v9;
  os_log_type_t v10;
  NSObject *logger;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t v17[16];
  CFPropertyListFormat format[2];

  result = (const void *)CaptiveCopySettings_settingsPlist;
  if (CaptiveCopySettings_settingsPlist)
    goto LABEL_2;
  if (!sBundleRef)
  {
    logger = mysyslog_get_logger();
    v12 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v12))
    {
      LOWORD(format[0]) = 0;
      _os_log_impl(&dword_219EF1000, logger, v12, "CaptiveGetBundle is NULL", (uint8_t *)format, 2u);
    }
    return 0;
  }
  v1 = CFBundleCopyResourceURL((CFBundleRef)sBundleRef, CFSTR("Settings"), CFSTR("plist"), 0);
  if (v1)
  {
    v2 = v1;
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v4 = CFReadStreamCreateWithFile((CFAllocatorRef)*MEMORY[0x24BDBD240], v1);
    v5 = v4;
    if (v4 && CFReadStreamOpen(v4))
    {
      format[0] = 0;
      v6 = CFPropertyListCreateWithStream(v3, v5, 0, 0, format, 0);
      CaptiveCopySettings_settingsPlist = (uint64_t)v6;
      if (v6)
      {
        v7 = v6;
        TypeID = CFDictionaryGetTypeID();
        if (CFGetTypeID(v7) != TypeID)
        {
          v9 = mysyslog_get_logger();
          v10 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v9, v10))
          {
            *(_WORD *)v17 = 0;
            _os_log_impl(&dword_219EF1000, v9, v10, "Settings.plist is not a dictionary", v17, 2u);
          }
          if (CaptiveCopySettings_settingsPlist)
          {
            CFRelease((CFTypeRef)CaptiveCopySettings_settingsPlist);
            CaptiveCopySettings_settingsPlist = 0;
          }
        }
      }
    }
    else
    {
      v13 = mysyslog_get_logger();
      v14 = _SC_syslog_os_log_mapping();
      if (os_log_type_enabled(v13, v14))
      {
        LOWORD(format[0]) = 0;
        _os_log_impl(&dword_219EF1000, v13, v14, "Could not read Settings file", (uint8_t *)format, 2u);
      }
      if (!v5)
        goto LABEL_20;
    }
    CFRelease(v5);
LABEL_20:
    CFRelease(v2);
    goto LABEL_23;
  }
  v15 = mysyslog_get_logger();
  v16 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v15, v16))
  {
    LOWORD(format[0]) = 0;
    _os_log_impl(&dword_219EF1000, v15, v16, "Could not locate Settings file", (uint8_t *)format, 2u);
  }
LABEL_23:
  result = (const void *)CaptiveCopySettings_settingsPlist;
  if (CaptiveCopySettings_settingsPlist)
  {
LABEL_2:
    CFRetain(result);
    return (const void *)CaptiveCopySettings_settingsPlist;
  }
  return result;
}

const void *CaptiveCopyProbeSettings()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const void *Value;
  CFTypeID TypeID;

  v0 = (const __CFDictionary *)CaptiveCopySettings();
  if (!v0)
    return 0;
  v1 = v0;
  Value = CFDictionaryGetValue(v0, CFSTR("ProbeParameters"));
  TypeID = CFDictionaryGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == TypeID)
      CFRetain(Value);
    else
      Value = 0;
  }
  CFRelease(v1);
  return Value;
}

void NetCacheEntryDestroy(uint64_t *a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  NetCacheEntryLog("Destroy: ", (uint64_t)a1);
  v2 = *a1;
  if (*a1)
    *(_QWORD *)(v2 + 8) = a1[1];
  *(_QWORD *)a1[1] = v2;
  v3 = (const void *)a1[4];
  if (v3)
  {
    CFRelease(v3);
    a1[4] = 0;
  }
  v4 = (const void *)a1[5];
  if (v4)
  {
    CFRelease(v4);
    a1[5] = 0;
  }
  v5 = (const void *)a1[6];
  if (v5)
  {
    CFRelease(v5);
    a1[6] = 0;
  }
  v6 = (const void *)a1[7];
  if (v6)
  {
    CFRelease(v6);
    a1[7] = 0;
  }
  v7 = (const void *)a1[8];
  if (v7)
    CFRelease(v7);
  free(a1);
}

void NetCacheEntryLog(const char *a1, uint64_t a2)
{
  int v4;
  NSObject *logger;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = *(unsigned __int8 *)(a2 + 24);
  logger = mysyslog_get_logger();
  v6 = _SC_syslog_os_log_mapping();
  v7 = os_log_type_enabled(logger, v6);
  if (v4)
  {
    if (!v7)
      return;
    v8 = *(_QWORD *)(a2 + 16);
    v9 = "";
    v11 = *(_QWORD *)(a2 + 40);
    v10 = *(_QWORD *)(a2 + 48);
    if (a1)
      v9 = a1;
    v12 = *(_QWORD *)(a2 + 32);
    v21 = 136316418;
    v22 = v9;
    v23 = 2048;
    v24 = a2;
    v25 = 2048;
    v26 = v8;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v12;
    v31 = 2112;
    v32 = v11;
    v13 = "%s<%p> %0.09g DisplayID %@ SSID=%@ Signatures=%@";
    v14 = logger;
    v15 = v6;
    v16 = 62;
  }
  else
  {
    if (!v7)
      return;
    v17 = *(_QWORD *)(a2 + 16);
    v18 = "";
    if (a1)
      v18 = a1;
    v19 = *(_QWORD *)(a2 + 32);
    v20 = *(_QWORD *)(a2 + 40);
    v21 = 136316162;
    v22 = v18;
    v23 = 2048;
    v24 = a2;
    v25 = 2048;
    v26 = v17;
    v27 = 2112;
    v28 = v19;
    v29 = 2112;
    v30 = v20;
    v13 = "%s<%p> %0.09g Not Captive SSID=%@ Signatures=%@";
    v14 = logger;
    v15 = v6;
    v16 = 52;
  }
  _os_log_impl(&dword_219EF1000, v14, v15, v13, (uint8_t *)&v21, v16);
}

uint64_t NetCacheEntryGetIsCaptive(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t NetCacheEntryGetLogoffURL(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

void NetCacheEntrySetLogoffURL(uint64_t a1, const void *a2)
{
  my_FieldSetRetainedCFType((const void **)(a1 + 56), a2);
}

uint64_t NetCacheEntryGetRedirectionURL(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v3;

  v3 = a1 + 64;
  result = *(_QWORD *)(a1 + 64);
  *a2 = *(_QWORD *)(v3 + 8);
  return result;
}

void NetCacheEntrySetRedirectionURL(uint64_t a1, const void *a2, uint64_t a3)
{
  my_FieldSetRetainedCFType((const void **)(a1 + 64), a2);
  *(_QWORD *)(a1 + 72) = a3;
}

_QWORD *NetCacheCreate()
{
  _QWORD *result;

  result = malloc_type_malloc(8uLL, 0x2004093837F09uLL);
  *result = 0;
  return result;
}

_QWORD *NetCacheApplyFunction(_QWORD **a1, uint64_t (*a2)(void))
{
  _QWORD *result;
  _QWORD *v4;
  int v5;

  result = *a1;
  do
  {
    if (!result)
      break;
    v4 = (_QWORD *)*result;
    v5 = a2();
    result = v4;
  }
  while (v5);
  return result;
}

uint64_t *NetCacheLookupEntry(uint64_t **a1, const __CFArray *a2, const void *a3, double a4)
{
  uint64_t *v4;
  int v8;
  uint64_t *v9;

  if (a2)
  {
    v4 = *a1;
    if (*a1)
    {
      v8 = 0;
      do
      {
        while (1)
        {
          v9 = v4;
          v4 = (uint64_t *)*v4;
          if (!v8)
            break;
LABEL_11:
          NetCacheEntryDestroy(v9);
          if (!v4)
            return 0;
        }
        if (*((double *)v9 + 2) + 259200.0 <= a4)
        {
          v8 = 1;
          goto LABEL_11;
        }
        if (my_CFEqual(a3, (const void *)v9[4])
          && my_CFArrayContainsAnyArrayValues((CFArrayRef)v9[5], a2))
        {
          return v9;
        }
        v8 = 0;
      }
      while (v4);
    }
  }
  return 0;
}

void *NetCacheUpdateEntry(uint64_t **a1, CFArrayRef theArray, const void *a3, char a4, const void *a5, double a6)
{
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  uint64_t *v15;
  const char *v16;

  if (!theArray || !CFArrayGetCount(theArray))
    return 0;
  v12 = NetCacheLookupEntry(a1, theArray, a3, a6);
  if (v12)
  {
    NetCacheEntryLog("Remove: ", (uint64_t)v12);
    v13 = *v12;
    if (*v12)
      *(_QWORD *)(v13 + 8) = v12[1];
    *(_QWORD *)v12[1] = v13;
    v14 = v12;
  }
  else
  {
    v14 = malloc_type_malloc(0x50uLL, 0x10E00407254A7C1uLL);
    *(_OWORD *)v14 = 0u;
    *((_OWORD *)v14 + 1) = 0u;
    *((_OWORD *)v14 + 3) = 0u;
    *((_OWORD *)v14 + 4) = 0u;
    *((_OWORD *)v14 + 2) = 0u;
    my_FieldSetRetainedCFType((const void **)v14 + 4, a3);
  }
  my_FieldSetRetainedCFType((const void **)v14 + 5, theArray);
  *((double *)v14 + 2) = a6;
  *((_BYTE *)v14 + 24) = a4;
  my_FieldSetRetainedCFType((const void **)v14 + 6, a5);
  v15 = *a1;
  *(_QWORD *)v14 = *a1;
  if (v15)
    v15[1] = (uint64_t)v14;
  *a1 = (uint64_t *)v14;
  *((_QWORD *)v14 + 1) = a1;
  if (v12)
    v16 = "Add: ";
  else
    v16 = "New: ";
  NetCacheEntryLog(v16, (uint64_t)v14);
  return v14;
}

uint64_t CNSServer_server_routine(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 28047727) >= 0xFFFFFFE6)
    return (uint64_t)*(&CNSServerCNSServer_subsystem + 5 * (v1 - 28047701) + 5);
  else
    return 0;
}

const char *_XParsePost(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  char *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  BOOL v24;
  unsigned int v25;
  int v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  _BYTE *v31;
  size_t v32;
  _BYTE *v33;
  size_t v34;
  _BYTE *v35;
  size_t v36;
  const char *v37;

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_31;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  if (v4 < 0x44 || v4 > 0x4044)
    goto LABEL_31;
  v6 = *((_DWORD *)result + 10);
  if (v6 > 0x1000)
    goto LABEL_31;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 68 < v6 || v4 < v7 + 68)
    goto LABEL_31;
  v9 = (char *)&result[v7];
  v10 = *((_DWORD *)v9 + 12);
  if (v10 > 0x1000)
    goto LABEL_31;
  v11 = v4 - v7;
  v12 = (v10 + 3) & 0xFFFFFFFC;
  if (v11 - 68 < v10 || v11 < v12 + 68)
    goto LABEL_31;
  v14 = v9 - 4096;
  v15 = (uint64_t)&v9[v12 - 4096];
  v16 = *(_DWORD *)(v15 + 4152);
  if (v16 > 0x1000)
    goto LABEL_31;
  v17 = v11 - v12;
  v18 = (v16 + 3) & 0xFFFFFFFC;
  if (v17 - 68 < v16 || v17 < v18 + 68)
    goto LABEL_31;
  v20 = v15 - 4096;
  v21 = v17 - v18;
  v22 = v15 - 4096 + v18;
  v23 = *(_DWORD *)(v22 + 8256);
  v24 = v23 <= 0x1000 && v21 - 68 >= v23;
  v25 = ((v23 + 3) & 0xFFFFFFFC) + 68;
  if (!v24 || v21 != v25)
    goto LABEL_31;
  v29 = 4140;
  if (*((unsigned int *)result + 1) < 0x102CuLL)
    v29 = *((unsigned int *)result + 1);
  result = (const char *)memchr((void *)(result + 44), 0, v29 - 44);
  if (!result)
    goto LABEL_31;
  v30 = &v3[v4];
  v31 = v14 + 4148;
  v32 = &v3[v4] - v31 >= 4096 ? 4096 : &v3[v4] - v31;
  result = (const char *)memchr(v31, 0, v32);
  if (!result
    || ((v33 = (_BYTE *)(v20 + 8252), v30 - v33 >= 4096) ? (v34 = 4096) : (v34 = v30 - v33),
        (result = (const char *)memchr(v33, 0, v34)) == 0
     || ((v35 = (_BYTE *)(v22 + 8260), v30 - v35 >= 4096) ? (v36 = 4096) : (v36 = v30 - v35),
         (result = (const char *)memchr(v35, 0, v36)) == 0)))
  {
LABEL_31:
    v27 = -304;
LABEL_32:
    *(_DWORD *)(a2 + 32) = v27;
    v28 = *MEMORY[0x24BDAC470];
    goto LABEL_33;
  }
  v37 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v37 || *((_DWORD *)v37 + 1) <= 0x1Fu)
  {
    v27 = -309;
    goto LABEL_32;
  }
  result = (const char *)CNSServerParsePost(*((unsigned int *)v3 + 3), *((_DWORD *)v3 + 8), v3 + 44, v31, v33, v35, (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v28 = *MEMORY[0x24BDAC470];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v28;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_33:
  *(_QWORD *)(a2 + 24) = v28;
  return result;
}

const char *_XLogoff(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  BOOL v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;
  BOOL v9;
  int v10;
  const char *v11;

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_13;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  v5 = v4 < 0x28 || v4 > 0x1028;
  if (v5
    || ((v6 = *((_DWORD *)result + 9), v6 <= 0x1000) ? (v7 = (int)v4 - 40 >= v6) : (v7 = 0),
        (v8 = ((v6 + 3) & 0xFFFFFFFC) + 40, v7) ? (v9 = (_DWORD)v4 == v8) : (v9 = 0),
        !v9 || (result = (const char *)memchr((void *)(result + 40), 0, v4 - 40)) == 0))
  {
LABEL_13:
    v10 = -304;
  }
  else
  {
    v11 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
    if (!*(_DWORD *)v11 && *((_DWORD *)v11 + 1) > 0x1Fu)
    {
      result = (const char *)CNSServerLogoff(*((unsigned int *)v3 + 3), *((_DWORD *)v3 + 2), v3 + 40);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      goto LABEL_15;
    }
    v10 = -309;
  }
  *(_DWORD *)(a2 + 32) = v10;
LABEL_15:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return result;
}

uint64_t _XForgetNetwork(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  CFIndex v4;
  BOOL v5;
  BOOL v6;
  int v7;
  _DWORD *v8;

  if ((*(_DWORD *)result & 0x80000000) == 0
    && (v3 = *(unsigned int *)(result + 4), v3 >= 0x24)
    && v3 <= 0x424
    && ((v4 = *(unsigned int *)(result + 32), v4 <= 0x400)
      ? (v5 = (int)v3 - 36 >= v4)
      : (v5 = 0),
        v5 ? (v6 = (_DWORD)v3 == (((_DWORD)v4 + 3) & 0xFFFFFFFC) + 36) : (v6 = 0),
        v6))
  {
    v8 = (_DWORD *)(((v3 + 3) & 0x1FFFFFFFCLL) + result);
    if (!*v8 && v8[1] > 0x1Fu)
    {
      result = CNSServerForgetNetwork(*(_DWORD *)(result + 12), (const UInt8 *)(result + 36), v4);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v7 = -309;
  }
  else
  {
    v7 = -304;
  }
  *(_DWORD *)(a2 + 32) = v7;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return result;
}

uint64_t _XPurgeAccountRecord(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  CFIndex v4;
  BOOL v5;
  BOOL v6;
  int v7;
  _DWORD *v8;

  if ((*(_DWORD *)result & 0x80000000) == 0
    && (v3 = *(unsigned int *)(result + 4), v3 >= 0x24)
    && v3 <= 0x424
    && ((v4 = *(unsigned int *)(result + 32), v4 <= 0x400)
      ? (v5 = (int)v3 - 36 >= v4)
      : (v5 = 0),
        v5 ? (v6 = (_DWORD)v3 == (((_DWORD)v4 + 3) & 0xFFFFFFFC) + 36) : (v6 = 0),
        v6))
  {
    v8 = (_DWORD *)(((v3 + 3) & 0x1FFFFFFFCLL) + result);
    if (!*v8 && v8[1] > 0x1Fu)
    {
      result = CNSServerPurgeAccountRecord(*(_DWORD *)(result + 12), (const UInt8 *)(result + 36), v4);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v7 = -309;
  }
  else
  {
    v7 = -304;
  }
  *(_DWORD *)(a2 + 32) = v7;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return result;
}

uint64_t _XDebugLaunchWebsheet(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  UInt8 *v7;
  __int128 v8;
  _OWORD v9[2];

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    v4 = -304;
    goto LABEL_10;
  }
  if (*(_BYTE *)(result + 39) != 1 || (v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    v4 = -300;
    goto LABEL_10;
  }
  if (*(_DWORD *)(result + 56) || *(_DWORD *)(result + 60) <= 0x1Fu)
  {
    v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    v5 = *MEMORY[0x24BDAC470];
    goto LABEL_11;
  }
  v6 = *(unsigned int *)(result + 12);
  v7 = *(UInt8 **)(result + 28);
  v8 = *(_OWORD *)(result + 92);
  v9[0] = *(_OWORD *)(result + 76);
  v9[1] = v8;
  result = CNSServerDebugLaunchWebsheet(v6, v7, v3, (_DWORD *)(a2 + 36), v9);
  *(_DWORD *)(a2 + 32) = result;
  v5 = *MEMORY[0x24BDAC470];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_11:
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

_DWORD *_XDumpState(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  }
  else
  {
    result = (_DWORD *)CNSServerDumpState();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

_DWORD *_XCopySupportedInterfaces(_DWORD *result, uint64_t a2)
{
  int v3;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  result = (_DWORD *)CNSServerCopySupportedInterfaces(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52), (_DWORD *)(a2 + 56));
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x24BDAC470];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 60;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return result;
}

_DWORD *_XCopyCurrentNetworkInfo(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  BOOL v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;
  BOOL v9;
  int v10;
  _DWORD *v11;

  if ((*result & 0x80000000) != 0)
    goto LABEL_13;
  v3 = result;
  v4 = result[1];
  v5 = v4 < 0x2C || v4 > 0x102C;
  if (v5
    || ((v6 = result[10], v6 <= 0x1000) ? (v7 = (int)v4 - 44 >= v6) : (v7 = 0),
        (v8 = ((v6 + 3) & 0xFFFFFFFC) + 44, v7) ? (v9 = (_DWORD)v4 == v8) : (v9 = 0),
        !v9 || (result = memchr(result + 11, 0, v4 - 44)) == 0))
  {
LABEL_13:
    v10 = -304;
LABEL_14:
    *(_DWORD *)(a2 + 32) = v10;
    goto LABEL_15;
  }
  v11 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
  if (*v11 || v11[1] <= 0x1Fu)
  {
    v10 = -309;
    goto LABEL_14;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  result = (_DWORD *)CNSServerCopyCurrentNetworkInfo(v3[3], v3[8], (uint64_t)(v3 + 11), (_QWORD *)(a2 + 28), (_DWORD *)(a2 + 52), (_DWORD *)(a2 + 56));
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x24BDAC470];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 60;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_15:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return result;
}

_DWORD *_XCopyAccountList(_DWORD *result, uint64_t a2)
{
  int v3;

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (result[6] || result[7] <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  result = (_DWORD *)CNSServerCopyAccountList(result[3], (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52), (_DWORD *)(a2 + 56));
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(_QWORD *)(a2 + 44) = *MEMORY[0x24BDAC470];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 60;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_8:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return result;
}

const char *_XAddAccount(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  char *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v26;
  const char *v27;
  _BYTE *v28;
  size_t v29;
  _BYTE *v30;
  size_t v31;
  const char *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  __int128 v37;
  uint64_t v38;
  _OWORD v39[2];

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_44;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  if (v4 < 0x40 || v4 > 0x3440)
    goto LABEL_44;
  v6 = *((_DWORD *)result + 9);
  if (v6 > 0x1000)
    goto LABEL_44;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 64 < v6 || v4 < v7 + 64)
    goto LABEL_44;
  v9 = (char *)&result[v7];
  v10 = *((_DWORD *)v9 + 10);
  if (v10 > 0x400)
    goto LABEL_44;
  v11 = v4 - v7;
  v12 = (v10 + 3) & 0xFFFFFFFC;
  if (v11 - 64 < v10 || v11 < v12 + 64)
    goto LABEL_44;
  v14 = v9 - 4096;
  v15 = (uint64_t)&v9[v12 - 4096];
  v16 = *(_DWORD *)(v15 + 4144);
  if (v16 > 0x1000)
    goto LABEL_44;
  v17 = v11 - v12;
  v18 = (v16 + 3) & 0xFFFFFFFC;
  if (v17 - 64 < v16 || v17 < v18 + 64)
    goto LABEL_44;
  v20 = v15 - 1024;
  v21 = v15 - 1024 + v18;
  v22 = *(_DWORD *)(v21 + 5176);
  if (v22 > 0x1000)
    goto LABEL_44;
  v23 = (v22 + 3) & 0xFFFFFFFC;
  v24 = v17 - v18;
  if (v24 - 64 < v22 || v24 != v23 + 64)
    goto LABEL_44;
  v26 = 4136;
  if (*((unsigned int *)result + 1) < 0x1028uLL)
    v26 = *((unsigned int *)result + 1);
  result = (const char *)memchr((void *)(result + 40), 0, v26 - 40);
  if (!result)
    goto LABEL_44;
  v27 = &v3[v4];
  v28 = (_BYTE *)(v20 + 5172);
  v29 = &v3[v4] - v28 >= 4096 ? 4096 : &v3[v4] - v28;
  result = (const char *)memchr(v28, 0, v29);
  if (!result
    || ((v38 = v21 - 4096, v30 = (_BYTE *)(v21 + 5180), v27 - v30 >= 4096) ? (v31 = 4096) : (v31 = v27 - v30),
        (result = (const char *)memchr(v30, 0, v31)) == 0))
  {
LABEL_44:
    v33 = -304;
    goto LABEL_45;
  }
  v32 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v32 || *((_DWORD *)v32 + 1) <= 0x1Fu)
  {
    v33 = -309;
LABEL_45:
    *(_DWORD *)(a2 + 32) = v33;
    v34 = *MEMORY[0x24BDAC470];
    goto LABEL_46;
  }
  v35 = *((unsigned int *)v3 + 3);
  v36 = *(_DWORD *)(v38 + v23 + 9276);
  v37 = *(_OWORD *)(v32 + 36);
  v39[0] = *(_OWORD *)(v32 + 20);
  v39[1] = v37;
  result = (const char *)CNSServerAddAccount(v35, v3 + 40, (const UInt8 *)v14 + 4140, v10, v28, v30, v36, (int *)(a2 + 36), v39);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v34 = *MEMORY[0x24BDAC470];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v34;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_46:
  *(_QWORD *)(a2 + 24) = v34;
  return result;
}

_DWORD *_XResolveAccount(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  BOOL v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;
  BOOL v9;
  int v10;
  uint64_t v11;
  _DWORD *v12;

  if ((*result & 0x80000000) != 0)
    goto LABEL_13;
  v3 = result;
  v4 = result[1];
  v5 = v4 < 0x28 || v4 > 0x1028;
  if (v5
    || ((v6 = result[9], v6 <= 0x1000) ? (v7 = (int)v4 - 40 >= v6) : (v7 = 0),
        (v8 = ((v6 + 3) & 0xFFFFFFFC) + 40, v7) ? (v9 = (_DWORD)v4 == v8) : (v9 = 0),
        !v9 || (result = memchr(result + 10, 0, v4 - 40)) == 0))
  {
LABEL_13:
    v10 = -304;
LABEL_14:
    *(_DWORD *)(a2 + 32) = v10;
    v11 = *MEMORY[0x24BDAC470];
    goto LABEL_15;
  }
  v12 = (_DWORD *)((char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL));
  if (*v12 || v12[1] <= 0x1Fu)
  {
    v10 = -309;
    goto LABEL_14;
  }
  result = (_DWORD *)CNSServerResolveAccount(v3[3], (uint64_t)(v3 + 10), (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v11 = *MEMORY[0x24BDAC470];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v11;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_15:
  *(_QWORD *)(a2 + 24) = v11;
  return result;
}

uint64_t _XAuthenticateUsing(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  size_t v16;
  _DWORD *v17;

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v5 = result;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v6 = *(unsigned int *)(result + 4);
  if (v6 < 0x40 || v6 > 0x2040)
    goto LABEL_3;
  if (*(unsigned __int16 *)(result + 38) << 16 != 1179648)
  {
    v3 = -300;
    goto LABEL_3;
  }
  v8 = *(_DWORD *)(result + 52);
  if (v8 > 0x1000)
    goto LABEL_2;
  v3 = -304;
  if ((int)v6 - 64 < v8)
    goto LABEL_3;
  v9 = (v8 + 3) & 0xFFFFFFFC;
  if (v6 < v9 + 64)
    goto LABEL_3;
  v10 = v6 - v9;
  v11 = result + v9;
  v12 = *(_DWORD *)(v11 + 60);
  v13 = v12 <= 0x1000 && v10 - 64 >= v12;
  if (!v13 || v10 != ((v12 + 3) & 0xFFFFFFFC) + 64)
    goto LABEL_2;
  v14 = 4152;
  if (*(unsigned int *)(result + 4) < 0x1038uLL)
    v14 = *(unsigned int *)(result + 4);
  result = (uint64_t)memchr((void *)(result + 56), 0, v14 - 56);
  if (!result
    || ((v15 = (void *)(v11 + 64), v5 + v6 - (uint64_t)v15 >= 4096) ? (v16 = 4096) : (v16 = v5 + v6 - (_QWORD)v15),
        (result = (uint64_t)memchr(v15, 0, v16)) == 0))
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x24BDAC470];
    goto LABEL_4;
  }
  v17 = (_DWORD *)(((v6 + 3) & 0x1FFFFFFFCLL) + v5);
  if (*v17 || v17[1] <= 0x1Fu)
  {
    v3 = -309;
    goto LABEL_3;
  }
  result = CNSServerAuthenticateUsing(*(unsigned int *)(v5 + 12), (const char *)(v5 + 56), (const char *)v15, (int *)(a2 + 36), *(_DWORD *)(v5 + 28));
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x24BDAC470];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_4:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XAuthenticateUsingToken(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  __int128 v19;
  _OWORD v20[2];

  if ((*(_DWORD *)result & 0x80000000) == 0)
    goto LABEL_2;
  v5 = result;
  v3 = -304;
  if (*(_DWORD *)(result + 24) != 1)
    goto LABEL_3;
  v6 = *(unsigned int *)(result + 4);
  if (v6 < 0x3C || v6 > 0x143C)
    goto LABEL_3;
  if (*(unsigned __int16 *)(result + 38) << 16 != 1179648)
  {
    v3 = -300;
    goto LABEL_3;
  }
  v8 = *(_DWORD *)(result + 52);
  if (v8 > 0x1000)
    goto LABEL_2;
  v3 = -304;
  if ((int)v6 - 60 < v8)
    goto LABEL_3;
  v9 = (v8 + 3) & 0xFFFFFFFC;
  if (v6 < v9 + 60)
    goto LABEL_3;
  v10 = v6 - v9;
  v11 = result + v9;
  v12 = *(_DWORD *)(v11 + 56);
  v13 = v6 - v9 - 60;
  v14 = v12 <= 0x400 && v13 >= v12;
  if (!v14 || v10 != ((v12 + 3) & 0xFFFFFFFC) + 60)
    goto LABEL_2;
  v15 = 4152;
  if (*(unsigned int *)(result + 4) < 0x1038uLL)
    v15 = *(unsigned int *)(result + 4);
  result = (uint64_t)memchr((void *)(result + 56), 0, v15 - 56);
  if (!result)
  {
LABEL_2:
    v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = *MEMORY[0x24BDAC470];
    goto LABEL_4;
  }
  v16 = ((v6 + 3) & 0x1FFFFFFFCLL) + v5;
  if (*(_DWORD *)v16 || *(_DWORD *)(v16 + 4) <= 0x1Fu)
  {
    v3 = -309;
    goto LABEL_3;
  }
  v17 = *(unsigned int *)(v5 + 12);
  v18 = *(_DWORD *)(v5 + 28);
  v19 = *(_OWORD *)(v16 + 36);
  v20[0] = *(_OWORD *)(v16 + 20);
  v20[1] = v19;
  result = CNSServerAuthenticateUsingToken(v17, (const char *)(v5 + 56), (const UInt8 *)(v11 + 60), v12, (int *)(a2 + 36), v18, v20);
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x24BDAC470];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_4:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XConnectionEstablish(uint64_t result, uint64_t a2)
{
  int v3;
  _DWORD *v4;
  int v5;
  UInt8 *v6;
  unsigned int v7;
  mach_port_name_t v8;
  __int128 v9;
  __int128 v10[2];

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 68)
  {
    v3 = -304;
    goto LABEL_11;
  }
  if (*(_BYTE *)(result + 39) != 1
    || *(unsigned __int16 *)(result + 54) << 16 != 1114112
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 64))
  {
    v3 = -300;
    goto LABEL_11;
  }
  if (*(_DWORD *)(result + 68) || *(_DWORD *)(result + 72) <= 0x1Fu)
  {
    v3 = -309;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_12;
  }
  v4 = (_DWORD *)(a2 + 28);
  *(_QWORD *)(a2 + 32) = 0x11000000000000;
  v5 = *(_DWORD *)(result + 12);
  v6 = *(UInt8 **)(result + 28);
  v7 = *(_DWORD *)(result + 40);
  v8 = *(_DWORD *)(result + 44);
  v9 = *(_OWORD *)(result + 104);
  v10[0] = *(_OWORD *)(result + 88);
  v10[1] = v9;
  result = CNSServerConnectionEstablish(v5, v6, v7, v8, v4, (int *)(a2 + 48), v10);
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 40) = *MEMORY[0x24BDAC470];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 52;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_12:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
  return result;
}

_DWORD *_XConnectionGetCommandInfo(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  result = (_DWORD *)CNSServerConnectionGetCommandInfo(result[3], (const __CFData **)(a2 + 28), (_DWORD *)(a2 + 52), (int *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(_QWORD *)(a2 + 44) = *MEMORY[0x24BDAC470];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _XConnectionProvideResponse(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  int v5;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    v4 = *MEMORY[0x24BDAC470];
    goto LABEL_10;
  }
  if (*(_BYTE *)(result + 39) != 1 || (v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    v5 = -300;
    goto LABEL_9;
  }
  result = CNSServerConnectionProvideResponse(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x24BDAC470];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _XConnectionSendCmdAck(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  int v5;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    v4 = *MEMORY[0x24BDAC470];
    goto LABEL_10;
  }
  if (*(_BYTE *)(result + 39) != 1 || (v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    v5 = -300;
    goto LABEL_9;
  }
  result = CNSServerConnectionSendCmdAck(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x24BDAC470];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

_DWORD *_XCopyLandingPageURL(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  result = (_DWORD *)CNSServerCopyLandingPageURL(result[3], (_QWORD *)(a2 + 28), (_DWORD *)(a2 + 52), (_QWORD *)(a2 + 56), (_DWORD *)(a2 + 64));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(_QWORD *)(a2 + 44) = *MEMORY[0x24BDAC470];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 68;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _XConnectionProcessControl(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }
  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 52))
  {
    v3 = -300;
    goto LABEL_9;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  result = CNSServerConnectionProcessControl(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), *(_DWORD *)(result + 40), (const __CFData **)(a2 + 28), (_DWORD *)(a2 + 52), (int *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(_QWORD *)(a2 + 44) = *MEMORY[0x24BDAC470];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *_XUserInteractionIsRequired(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    v4 = -304;
    goto LABEL_7;
  }
  v3 = result + 6;
  if (result[6] || result[7] <= 0x1Fu)
  {
    v4 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v4;
    v5 = *MEMORY[0x24BDAC470];
    goto LABEL_8;
  }
  v6 = result[3];
  v7 = *(_OWORD *)(v3 + 9);
  v8[0] = *(_OWORD *)(v3 + 5);
  v8[1] = v7;
  result = (_DWORD *)CNSServerUserInteractionIsRequired(v6, (int *)(a2 + 36), (_DWORD *)(a2 + 40), v8);
  *(_DWORD *)(a2 + 32) = (_DWORD)result;
  v5 = *MEMORY[0x24BDAC470];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 44;
    return result;
  }
LABEL_8:
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

uint64_t CNSServer_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 28047727) >= 0xFFFFFFE6
    && (v5 = (void (*)(void))*(&CNSServerCNSServer_subsystem + 5 * (v4 - 28047701) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x24BDAC470];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t LogoffReply(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x24BDAC470];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 18;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 28047703;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t AuthenticateUsingReply(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x24BDAC470];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 18;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 28047705;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return MEMORY[0x24BE85860]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB7D8](theArray, range.location, range.length, applier, context);
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x24BDBB7E0](theArray, range.location, range.length, value, comparator, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB838](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB870](theArray, idx, value);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x24BDBB878](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return (CFArrayRef)MEMORY[0x24BDBBA30](bundle);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x24BDBBA38](bundle);
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x24BDBBA60](locArray, prefArray);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x24BDBBA70]();
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x24BDBBB98](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x24BDBBBA0](calendar, v3, at);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x24BDBBD30](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBBD98](theDate);
  return result;
}

CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate)
{
  CFTimeInterval result;

  MEMORY[0x24BDBBDA0](theDate, otherDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBBFB0](allocator, port, order);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x24BDBBFC8](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x24BDBBFD0](port);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC058]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1F0](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x24BDBC208](propertyList, stream, format, options, error);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2D0](rl, timer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFTypeID CFRunLoopGetTypeID(void)
{
  return MEMORY[0x24BDBC310]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x24BDBC338](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC350](rl, timer, mode);
}

void CFRunLoopRun(void)
{
  MEMORY[0x24BDBC358]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC370](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC380](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x24BDBC390](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
  MEMORY[0x24BDBC3A8](timer);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC3B8](rl);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x24BDBC528](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC530](alloc, data, *(_QWORD *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x24BDBC618](theString, idx);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x24BDBC6B0](theString, suffix);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
  MEMORY[0x24BDBC6C8](theString, locale);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7A0](anURL);
}

CFStringRef CFURLCopyQueryString(CFURLRef anURL, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x24BDBC7C8](anURL, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC828](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC838](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapesUsingEncoding(CFAllocatorRef allocator, CFStringRef origString, CFStringRef charsToLeaveEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC848](allocator, origString, charsToLeaveEscaped, *(_QWORD *)&encoding);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D0](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC928](allocator, userNotification, callout, order);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x24BDBC968](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x24BDBC978](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x24BDBC980](alloc, bufferAllocator);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x24BDBC988](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x24BDBC9A8](stream);
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x24BE04690]();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x24BDD7EA8](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x24BDD7FC8](notifier);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x24BDD8888](refcon, thePortRef, callback, notifier);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

uint64_t MAEGetActivationStateWithError()
{
  return MEMORY[0x24BE66A40]();
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return (CFDictionaryRef)MEMORY[0x24BDF5668](store, keys, patterns);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x24BDF5678](allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDF5680](allocator, store, order);
}

SCDynamicStoreRef SCDynamicStoreCreateWithOptions(CFAllocatorRef allocator, CFStringRef name, CFDictionaryRef storeOptions, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x24BDF5688](allocator, name, storeOptions, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x24BDF56A8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x24BDF56B0](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x24BDF56D0](store, keys, patterns);
}

Boolean SCDynamicStoreSetValue(SCDynamicStoreRef store, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x24BDF56D8](store, key, value);
}

int SCError(void)
{
  return MEMORY[0x24BDF56E0]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x24BDF56E8](*(_QWORD *)&status);
}

uint64_t SCNetworkInterfaceAdvisoryIsSpecificSet()
{
  return MEMORY[0x24BDF56F8]();
}

uint64_t SCNetworkInterfaceCopyAdvisoryNotificationKey()
{
  return MEMORY[0x24BDF5700]();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x24BDF5718](interface);
}

uint64_t SCNetworkInterfaceSetAdvisory()
{
  return MEMORY[0x24BDF5740]();
}

uint64_t SCNetworkInterfaceSetPrimaryRank()
{
  return MEMORY[0x24BDF5748]();
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x24BDF5860](prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x24BDF5868](allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x24BDF5880](prefs, key);
}

Boolean SCPreferencesRemoveValue(SCPreferencesRef prefs, CFStringRef key)
{
  return MEMORY[0x24BDF5890](prefs, key);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x24BDF5898](prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return MEMORY[0x24BDF58A0](prefs, callout, context);
}

Boolean SCPreferencesSetValue(SCPreferencesRef prefs, CFStringRef key, CFPropertyListRef value)
{
  return MEMORY[0x24BDF58C0](prefs, key, value);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
  MEMORY[0x24BDF58C8](prefs);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x24BE678E8]();
}

uint64_t WiFiDeviceClientCopyProperty()
{
  return MEMORY[0x24BE67900]();
}

uint64_t WiFiDeviceClientDisassociate()
{
  return MEMORY[0x24BE67908]();
}

uint64_t WiFiDeviceClientGetInterfaceName()
{
  return MEMORY[0x24BE67918]();
}

uint64_t WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback()
{
  return MEMORY[0x24BE67938]();
}

uint64_t WiFiDeviceClientRegisterScanUpdateCallback()
{
  return MEMORY[0x24BE67960]();
}

uint64_t WiFiDeviceClientScanAsync()
{
  return MEMORY[0x24BE67968]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x24BE67990]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D0]();
}

uint64_t WiFiManagerClientDisableNetwork()
{
  return MEMORY[0x24BE679F0]();
}

uint64_t WiFiManagerClientEnableNetwork()
{
  return MEMORY[0x24BE67A08]();
}

uint64_t WiFiManagerClientGetDevice()
{
  return MEMORY[0x24BE67A10]();
}

uint64_t WiFiManagerClientIsNetworkEnabled()
{
  return MEMORY[0x24BE67A60]();
}

uint64_t WiFiManagerClientPrivateMacIsQuickProbeRequired()
{
  return MEMORY[0x24BE67A98]();
}

uint64_t WiFiManagerClientPrivateMacReportProbeResult()
{
  return MEMORY[0x24BE67AA0]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x24BE67AA8]();
}

uint64_t WiFiManagerClientRegisterServerRestartCallback()
{
  return MEMORY[0x24BE67AC8]();
}

uint64_t WiFiManagerClientRemoveNetwork()
{
  return MEMORY[0x24BE67AD8]();
}

uint64_t WiFiManagerClientRemoveNetworksWithBundleIdentifier()
{
  return MEMORY[0x24BE67AE0]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x24BE67AE8]();
}

uint64_t WiFiManagerClientSetNetworkProperty()
{
  return MEMORY[0x24BE67B20]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x24BE67B50]();
}

uint64_t WiFiManagerClientTemporarilyDisableNetwork()
{
  return MEMORY[0x24BE67B60]();
}

uint64_t WiFiManagerClientUpdateNetwork()
{
  return MEMORY[0x24BE67B70]();
}

uint64_t WiFiNetworkGetBundleIdentifier()
{
  return MEMORY[0x24BE67BD8]();
}

uint64_t WiFiNetworkGetProperty()
{
  return MEMORY[0x24BE67C38]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x24BE67C48]();
}

uint64_t WiFiNetworkGetSSIDData()
{
  return MEMORY[0x24BE67C58]();
}

uint64_t WiFiNetworkGetType()
{
  return MEMORY[0x24BE67C60]();
}

uint64_t WiFiNetworkIsEAP()
{
  return MEMORY[0x24BE67C90]();
}

uint64_t WiFiNetworkIsWEP()
{
  return MEMORY[0x24BE67CD8]();
}

uint64_t WiFiNetworkIsWPA()
{
  return MEMORY[0x24BE67CE0]();
}

uint64_t WiFiNetworkSetProperty()
{
  return MEMORY[0x24BE67D30]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _CTServerConnectionCopySystemCapabilities()
{
  return MEMORY[0x24BDC2870]();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x24BDC2898]();
}

uint64_t _SCNetworkInterfaceCopyActive()
{
  return MEMORY[0x24BDF58E8]();
}

uint64_t _SCNetworkInterfaceCreateWithBSDName()
{
  return MEMORY[0x24BDF58F0]();
}

uint64_t _SC_CFMachPortCreateWithPort()
{
  return MEMORY[0x24BDF5920]();
}

uint64_t _SC_cfstring_to_cstring()
{
  return MEMORY[0x24BDF5930]();
}

uint64_t _SC_sendMachMessage()
{
  return MEMORY[0x24BDF5938]();
}

uint64_t _SC_syslog_os_log_mapping()
{
  return MEMORY[0x24BDF5948]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _scprefs_observer_watch()
{
  return MEMORY[0x24BDF5970]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x24BE1A1F8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
  MEMORY[0x24BEDA8D8](atoken, auidp, euidp, egidp, ruidp, rgidp, pidp, asidp);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x24BEDA8F8](atoken);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2D8](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x24BDAE860](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x24BDAEB58](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x24BDAEBE8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x24BDAEC08](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

uint64_t managed_event_fetch()
{
  return MEMORY[0x24BEB35F0]();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  return MEMORY[0x24BDAF178](name, notify_port, *(_QWORD *)&flags, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
}

uint64_t nwi_ifstate_get_flags()
{
  return MEMORY[0x24BDAF1B0]();
}

uint64_t nwi_state_copy()
{
  return MEMORY[0x24BDAF1E8]();
}

uint64_t nwi_state_get_ifstate()
{
  return MEMORY[0x24BDAF200]();
}

uint64_t nwi_state_get_notify_key()
{
  return MEMORY[0x24BDAF210]();
}

uint64_t nwi_state_release()
{
  return MEMORY[0x24BDAF220]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF6E0](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7A0](a1, *(_QWORD *)&a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t symptom_framework_init()
{
  return MEMORY[0x24BEB35A8]();
}

uint64_t symptom_new()
{
  return MEMORY[0x24BEB35B8]();
}

uint64_t symptom_send()
{
  return MEMORY[0x24BEB35C8]();
}

uint64_t symptom_set_additional_qualifier()
{
  return MEMORY[0x24BEB35D8]();
}

uint64_t symptom_set_qualifier()
{
  return MEMORY[0x24BEB35E8]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

kern_return_t vm_read(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x24BDB03E0](*(_QWORD *)&target_task, address, size, data, dataCnt);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x24BDB0418](msg);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

