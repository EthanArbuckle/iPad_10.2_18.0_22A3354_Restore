@implementation RTTSendUserNotification

void ___RTTSendUserNotification_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    AXLogRTT();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      ___RTTSendUserNotification_block_invoke_cold_1((uint64_t)v2, v3);
  }
  else
  {
    RTTNotificationCenter();
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSObject getNotificationSettingsWithCompletionHandler:](v3, "getNotificationSettingsWithCompletionHandler:", &__block_literal_global_29_0);
  }

}

void ___RTTSendUserNotification_block_invoke_27(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  AXLogRTT();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4[0] = 67109120;
    v4[1] = objc_msgSend(v2, "authorizationStatus");
    _os_log_impl(&dword_21473C000, v3, OS_LOG_TYPE_INFO, "Posted notification with authorization status: %i", (uint8_t *)v4, 8u);
  }

}

void ___RTTSendUserNotification_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21473C000, a2, OS_LOG_TYPE_ERROR, "Unable to send notification: %@", (uint8_t *)&v2, 0xCu);
}

@end
