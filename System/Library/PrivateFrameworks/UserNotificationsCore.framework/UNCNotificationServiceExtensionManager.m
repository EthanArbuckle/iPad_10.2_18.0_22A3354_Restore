@implementation UNCNotificationServiceExtensionManager

- (id)extensionForBundleIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v19;

  v6 = a3;
  v19 = 0;
  -[UNCNotificationServiceExtensionManager _extensionForAppBundleIdentifier:error:](self, "_extensionForAppBundleIdentifier:error:", v6, &v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v19;
  v9 = v8;
  if (v7)
  {
    v10 = -[UNCNotificationServiceExtension _initWithExtension:serviceTime:graceTime:]([UNCNotificationServiceExtension alloc], "_initWithExtension:serviceTime:graceTime:", v7, 30.0, 1.0);
    if (!a4)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNPrivateErrorCode:userInfo:", 1904, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = *MEMORY[0x24BDF89F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F0], OS_LOG_TYPE_ERROR))
    -[UNCNotificationServiceExtensionManager extensionForBundleIdentifier:error:].cold.1((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);
  v10 = 0;
  if (a4)
  {
LABEL_9:
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
LABEL_11:

  return v10;
}

- (id)_extensionForAppBundleIdentifier:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, 0);
  v7 = v6;
  if (v6)
  {
    v34 = a4;
    v35 = (uint64_t)v5;
    objc_msgSend(v6, "applicationExtensionRecords");
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v37;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v12);
        objc_msgSend(v13, "extensionPointRecord");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.usernotifications.service"));

        if ((v16 & 1) != 0)
          break;

        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          if (v10)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v13, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        goto LABEL_13;
      objc_msgSend(MEMORY[0x24BDD1550], "extensionWithIdentifier:error:", v17, v34);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_10:

LABEL_13:
      v19 = *MEMORY[0x24BDF89F0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F0], OS_LOG_TYPE_ERROR))
      {
        v5 = (id)v35;
        -[UNCNotificationServiceExtensionManager _extensionForAppBundleIdentifier:error:].cold.2(v35, v19, v20, v21, v22, v23, v24, v25);
        v18 = 0;
        goto LABEL_16;
      }
      v18 = 0;
    }
    v5 = (id)v35;
LABEL_16:

    goto LABEL_20;
  }
  v26 = *MEMORY[0x24BDF89F0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89F0], OS_LOG_TYPE_ERROR))
    -[UNCNotificationServiceExtensionManager _extensionForAppBundleIdentifier:error:].cold.1((uint64_t)v5, v26, v27, v28, v29, v30, v31, v32);
  v18 = 0;
LABEL_20:

  return v18;
}

- (void)extensionForBundleIdentifier:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2499A5000, a2, a3, "[%{public}@] No valid extension available for bundle", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)_extensionForAppBundleIdentifier:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2499A5000, a2, a3, "[%{public}@] No app record for bundle, so cannot find an extension", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

- (void)_extensionForAppBundleIdentifier:(uint64_t)a3 error:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_2499A5000, a2, a3, "[%{public}@] No service extension record found for app", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_6();
}

@end
