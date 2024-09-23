@implementation DBSAnalytics

+ (void)logDarkModeEvent:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "logEvent:feature:value:", CFSTR("DarkMode"), CFSTR("dark_mode"), v4);

}

+ (void)logAutomaticDarkModeEvent:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "logEvent:feature:value:", CFSTR("AutomaticDarkMode"), CFSTR("automatic_dark_mode"), v4);

}

+ (void)logTextSizeEvent:(id)a3
{
  objc_msgSend(a1, "logEvent:feature:value:", CFSTR("TextSize"), CFSTR("text_size"), a3);
}

+ (void)logBoldTextEvent:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "logEvent:feature:value:", CFSTR("BoldText"), CFSTR("bold_text"), v4);

}

+ (void)logEvent:(id)a3 feature:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  id v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;

  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x24BDBCF50];
  v11 = a3;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithSuiteName:", CFSTR("com.apple.purplebuddy.notbackedup"));
  objc_msgSend(v12, "stringForKey:", CFSTR("AppearanceModeChoice"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = (__CFString *)v13;
  else
    v14 = &stru_24F026548;
  objc_msgSend(a1, "checkAndUpdateFirst:", v11);

  v18 = v8;
  v19 = v9;
  v15 = v9;
  v16 = v8;
  v17 = v14;
  AnalyticsSendEventLazy();

}

id __39__DBSAnalytics_logEvent_feature_value___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[2];
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("child_account");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 56), "isChild"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = CFSTR("first_update");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  v8 = *(_OWORD *)(a1 + 32);
  v6[2] = CFSTR("original_size");
  v6[3] = CFSTR("update_feature");
  v6[4] = CFSTR("update_option");
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)isChild
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.purplebuddy.notbackedup"));
  objc_msgSend(v2, "objectForKey:", CFSTR("disposition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("child"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)checkAndUpdateFirst:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  objc_msgSend(CFSTR("DBSSettingsUpdated-"), "stringByAppendingString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", v3) ^ 1;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBool:forKey:", 1, v3);

  return v5;
}

@end
