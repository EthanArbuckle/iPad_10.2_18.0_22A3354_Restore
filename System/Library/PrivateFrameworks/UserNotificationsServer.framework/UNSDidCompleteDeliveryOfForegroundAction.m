@implementation UNSDidCompleteDeliveryOfForegroundAction

void __UNSDidCompleteDeliveryOfForegroundAction_block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = *MEMORY[0x24BDF89E8];
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_ERROR))
      __UNSDidCompleteDeliveryOfForegroundAction_block_invoke_cold_1(v15);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89E8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v11;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_216DCB000, v15, OS_LOG_TYPE_DEFAULT, "UNSDidCompleteDeliveryOfForegroundAction removing notificationID: %@ bundleID: %@", buf, 0x16u);
    }
    +[UNSUserNotificationServer sharedInstance](UNSUserNotificationServer, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_removeNotificationRecordsForIdentifiers:bundleIdentifier:", v17, v10);

  }
}

void __UNSDidCompleteDeliveryOfForegroundAction_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_216DCB000, log, OS_LOG_TYPE_ERROR, "UNSDidCompleteDeliveryOfForegroundAction failed to decode data", v1, 2u);
}

@end
