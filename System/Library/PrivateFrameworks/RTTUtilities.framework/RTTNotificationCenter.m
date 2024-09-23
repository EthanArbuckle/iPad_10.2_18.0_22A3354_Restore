@implementation RTTNotificationCenter

void __RTTNotificationCenter_block_invoke()
{
  void *v0;
  objc_class *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v0 = (void *)getUNUserNotificationCenterClass_softClass;
  v17 = getUNUserNotificationCenterClass_softClass;
  if (!getUNUserNotificationCenterClass_softClass)
  {
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __getUNUserNotificationCenterClass_block_invoke;
    v12 = &unk_24D203C78;
    v13 = &v14;
    __getUNUserNotificationCenterClass_block_invoke((uint64_t)&v9);
    v0 = (void *)v15[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v14, 8);
  v2 = objc_msgSend([v1 alloc], "initWithBundleIdentifier:", CFSTR("com.apple.RTTNotifications"));
  v3 = (void *)RTTNotificationCenter_rttNotificationCenter;
  RTTNotificationCenter_rttNotificationCenter = v2;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v4 = (void *)getUNNotificationCategoryClass_softClass;
  v17 = getUNNotificationCategoryClass_softClass;
  if (!getUNNotificationCategoryClass_softClass)
  {
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __getUNNotificationCategoryClass_block_invoke;
    v12 = &unk_24D203C78;
    v13 = &v14;
    __getUNNotificationCategoryClass_block_invoke((uint64_t)&v9);
    v4 = (void *)v15[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v5, "categoryWithIdentifier:actions:intentIdentifiers:options:", CFSTR("com.apple.RTTNotifications.message"), MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)RTTNotificationCenter_rttNotificationCenter;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNotificationCategories:", v8);

}

@end
