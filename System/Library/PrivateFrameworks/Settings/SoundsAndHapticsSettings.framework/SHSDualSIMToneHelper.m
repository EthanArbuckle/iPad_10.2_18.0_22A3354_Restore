@implementation SHSDualSIMToneHelper

+ (id)fetchCTSubscriptionsInUse
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  _SHSCTClient();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v2, "getSubscriptionInfoWithError:", &v25);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v25;

  SHSLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[SHSDualSIMToneHelper fetchCTSubscriptionsInUse].cold.1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    v13 = 0;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "subscriptionsInUse");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v28 = "+[SHSDualSIMToneHelper fetchCTSubscriptionsInUse]";
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_228D17000, v6, OS_LOG_TYPE_DEFAULT, "%s: Received subscriptionsInUse: %@", buf, 0x16u);

    }
    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v3, "subscriptionsInUse", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v6);
          v19 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if ((objc_msgSend(v19, "isSimHidden") & 1) == 0 && (objc_msgSend(v19, "isSimDataOnly") & 1) == 0)
            objc_msgSend(v13, "addObject:", v19);
        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v16);
    }
  }

  return v13;
}

+ (id)fetchShortLabelForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _SHSCTClient();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v4, "getShortLabel:error:", v3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;

  v7 = 0;
  if (!v6)
  {
    SHSLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v12 = "+[SHSDualSIMToneHelper fetchShortLabelForContext:]";
      v13 = 2112;
      v14 = v5;
      v15 = 2112;
      v16 = v3;
      _os_log_impl(&dword_228D17000, v8, OS_LOG_TYPE_DEFAULT, "%s: Received shortLabel: %@ for Context: %@", buf, 0x20u);
    }

    v7 = v5;
  }

  return v7;
}

+ (id)fetchLocalizedPhoneNumberForContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  uint64_t v28;
  const void *v29;
  __CFString *String;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __CFString *v48;
  uint64_t v50;
  id v51;

  v3 = a3;
  _SHSCTClient();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  objc_msgSend(v4, "getPhoneNumber:error:", v3, &v51);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v51;

  if (v5)
  {
    objc_msgSend(v5, "number");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      SHSLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[SHSDualSIMToneHelper fetchLocalizedPhoneNumberForContext:].cold.4(v8, v9, v10, v11, v12, v13, v14, v15);
      v16 = &stru_24F198178;
      goto LABEL_26;
    }
  }
  else
  {
    SHSLogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[SHSDualSIMToneHelper fetchLocalizedPhoneNumberForContext:].cold.3((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);

    v7 = 0;
  }
  v8 = v7;
  _SHSCTClient();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  objc_msgSend(v24, "getMobileSubscriberHomeCountryList:error:", v3, &v50);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v50;

  v27 = &stru_24F198178;
  if (!v26)
  {
    objc_msgSend(v25, "firstObject");
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v28 = CFPhoneNumberCreate();
  if (v28)
  {
    v29 = (const void *)v28;
    String = (__CFString *)CFPhoneNumberCreateString();

    if (!String)
    {
      SHSLogForCategory(0);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        +[SHSDualSIMToneHelper fetchLocalizedPhoneNumberForContext:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);

    }
    CFRelease(v29);
  }
  else
  {
    SHSLogForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      +[SHSDualSIMToneHelper fetchLocalizedPhoneNumberForContext:].cold.1(v39, v40, v41, v42, v43, v44, v45, v46);

    String = (__CFString *)v8;
  }
  v47 = -[__CFString length](String, "length");
  if (v8)
    v48 = (__CFString *)v8;
  else
    v48 = &stru_24F198178;
  if (v47)
    v48 = String;
  v16 = v48;

LABEL_26:
  return v16;
}

+ (BOOL)shouldShowSIMBasedToneCustomizationForAlertType:(int64_t)a3
{
  int v4;

  v4 = objc_msgSend(a1, "alertTypeSupportsSIMBasedToneCustomization:", a3);
  if (v4)
    LOBYTE(v4) = objc_msgSend(a1, "hasMultipleCTSubscriptionsInUse");
  return v4;
}

+ (BOOL)hasMultipleCTSubscriptionsInUse
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "fetchCTSubscriptionsInUse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

+ (BOOL)alertTypeSupportsSIMBasedToneCustomization:(int64_t)a3
{
  return a3 == 1;
}

+ (void)fetchCTSubscriptionsInUse
{
  OUTLINED_FUNCTION_2(&dword_228D17000, a2, a3, "%s Error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchLocalizedPhoneNumberForContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_228D17000, a1, a3, "%s: phoneNumberCFString is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchLocalizedPhoneNumberForContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_228D17000, a1, a3, "%s: localizedPhoneNumber is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchLocalizedPhoneNumberForContext:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_228D17000, a2, a3, "getPhoneNumber:error: in %s failed: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)fetchLocalizedPhoneNumberForContext:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_228D17000, a1, a3, "getPhoneNumber:error: in %s returned nil displayPhoneNumber", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
