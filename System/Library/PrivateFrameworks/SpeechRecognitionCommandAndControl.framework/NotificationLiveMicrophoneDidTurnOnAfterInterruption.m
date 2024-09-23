@implementation NotificationLiveMicrophoneDidTurnOnAfterInterruption

void ___NotificationLiveMicrophoneDidTurnOnAfterInterruption_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  int v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x24BDF88B8], "currentNotificationCenter");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)objc_opt_new();
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("UserNotification.ListeningInterruptionEnded.TelephonyTitle"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTitle:", v1);

  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "assistantIsEnabled");

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_telephonyRequiresAirPods");

  v6 = CFSTR("UserNotification.ListeningInterruptionEnded.TelephonyEnableSiriUseAirPods");
  if (v3)
    v6 = CFSTR("UserNotification.ListeningInterruptionEnded.TelephonyUseAirPods");
  if (v5)
    v7 = v6;
  else
    v7 = CFSTR("UserNotification.ListeningInterruptionEnded.TelephonyEnableSiri");
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBody:", v8);

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=SIRI_AND_SEARCH"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setDefaultActionURL:", v9);
  v10 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestWithIdentifier:content:trigger:", v12, v0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addNotificationRequest:withCompletionHandler:", v13, &__block_literal_global_1236);
}

void ___NotificationLiveMicrophoneDidTurnOnAfterInterruption_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    CACLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      ___NotificationLiveMicrophoneDidTurnOnAfterInterruption_block_invoke_2_cold_1();

  }
}

void ___NotificationLiveMicrophoneDidTurnOnAfterInterruption_block_invoke_1237()
{
  void *v0;
  id v1;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("InfoMessage.ListeningInterruptionEnded"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayMessageString:type:", v0, 0);

}

void ___NotificationLiveMicrophoneDidTurnOnAfterInterruption_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1(&dword_229A40000, v0, v1, "Error sending local notification: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
