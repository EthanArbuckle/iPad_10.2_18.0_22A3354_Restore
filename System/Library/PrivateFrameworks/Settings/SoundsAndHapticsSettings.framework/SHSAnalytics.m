@implementation SHSAnalytics

+ (void)trackingVibrateOnRingValueChanged:(BOOL)a3 age:(unint64_t)a4
{
  AnalyticsSendEventLazy();
}

id __54__SHSAnalytics_trackingVibrateOnRingValueChanged_age___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("value");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("age");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)trackingVibrateOnSilentValueChanged:(BOOL)a3 age:(unint64_t)a4
{
  AnalyticsSendEventLazy();
}

id __56__SHSAnalytics_trackingVibrateOnSilentValueChanged_age___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("value");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("age");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)trackingDualSIMToneValueChanged:(id)a3 didSelectDifferentTones:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v4 = a4;
  v17[2] = *MEMORY[0x24BDAC8D0];
  v16[0] = CFSTR("alertType");
  v16[1] = CFSTR("isDualSIMToneDifferent");
  v17[0] = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a3;
  objc_msgSend(v5, "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  SHSLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "+[SHSAnalytics trackingDualSIMToneValueChanged:didSelectDifferentTones:]";
    v12 = 2112;
    v13 = CFSTR("com.apple.settings.didChangeDualSIMToneSettings");
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_228D17000, v9, OS_LOG_TYPE_DEFAULT, "%s Sending analytics event: %@ with payload: %@", (uint8_t *)&v10, 0x20u);
  }

  AnalyticsSendEvent();
}

@end
