@implementation PKPaymentNotificationAppURLHelper

+ (id)appURLForMessageNotification:(id)a3 pass:(id)a4 appLaunchToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "serviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "hasAssociatedPaymentApplication");

  objc_msgSend(a1, "_appURLForNotificationOfType:paymentPass:serviceIdentifier:appLaunchToken:pathSuffix:usingDeviceAccountNumber:", CFSTR("messages"), v9, v11, v8, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)appURLForTransactionNotification:(id)a3 pass:(id)a4 appLaunchToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "serviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "hasAssociatedPaymentApplication");

  objc_msgSend(a1, "_appURLForNotificationOfType:paymentPass:serviceIdentifier:appLaunchToken:pathSuffix:usingDeviceAccountNumber:", CFSTR("transactions"), v9, v11, v8, 0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)appURLForTransactionNotification:(id)a3 excludeTransactionIdentifier:(BOOL)a4 pass:(id)a5 pathSuffix:(id)a6 appLaunchToken:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (a4)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v12, "serviceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(a1, "_appURLForNotificationOfType:paymentPass:serviceIdentifier:appLaunchToken:pathSuffix:usingDeviceAccountNumber:", CFSTR("transactions"), v13, v16, v15, v14, objc_msgSend(v12, "hasAssociatedPaymentApplication"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (BOOL)applicationExistsToHandleNotificationsForPaymentPass:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "appURLScheme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "associatedApplicationIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applicationsAvailableForOpeningURL:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v23 = v7;
    v24 = v4;
    v25 = v3;
    v14 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v16, "teamID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bundleIdentifier");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@.%@"), v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v19) = objc_msgSend(v8, "containsObject:", v20);
        if ((v19 & 1) != 0)
        {
          v21 = 1;
          goto LABEL_11;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v13)
        continue;
      break;
    }
    v21 = 0;
LABEL_11:
    v4 = v24;
    v3 = v25;
    v7 = v23;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)_appURLForNotificationOfType:(id)a3 paymentPass:(id)a4 serviceIdentifier:(id)a5 appLaunchToken:(id)a6 pathSuffix:(id)a7 usingDeviceAccountNumber:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (objc_msgSend(a1, "applicationExistsToHandleNotificationsForPaymentPass:", v15))
  {
    objc_msgSend(v15, "appURLScheme");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if (a8)
      {
        objc_msgSend(v15, "deviceAccountIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("dpan");
      }
      else
      {
        objc_msgSend(v15, "primaryAccountIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("fpan");
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@/%@/%@"), v19, v21, v20, v14);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v16)
      {
        objc_msgSend(v23, "stringByAppendingFormat:", CFSTR("/%@"), v16);
        v25 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v25;
      }
      if (v18)
      {
        objc_msgSend(v24, "stringByAppendingString:", v18);
        v26 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v26;
      }
      if (v17)
      {
        objc_msgSend(v24, "stringByAppendingFormat:", CFSTR("?token=%@"), v17);
        v27 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v27;
      }
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

@end
