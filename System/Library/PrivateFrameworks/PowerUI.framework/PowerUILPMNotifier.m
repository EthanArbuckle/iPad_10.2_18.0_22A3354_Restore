@implementation PowerUILPMNotifier

- (PowerUILPMNotifier)init
{
  PowerUILPMNotifier *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *firstUseQueue;
  void *v5;
  uint64_t v6;
  NSBundle *bundle;
  uint64_t v8;
  UNUserNotificationCenter *userNotificationCenter;
  NSObject *v10;
  _QWORD v12[4];
  PowerUILPMNotifier *v13;
  int out_token;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PowerUILPMNotifier;
  v2 = -[PowerUILPMNotifier init](&v15, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.lpm.firstusenotifyqueue", 0);
    firstUseQueue = v2->_firstUseQueue;
    v2->_firstUseQueue = (OS_dispatch_queue *)v3;

    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", CFSTR("/System/Library/PrivateFrameworks/PowerUI.framework"));
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    bundle = v2->_bundle;
    v2->_bundle = (NSBundle *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDF88B8]), "initWithBundleIdentifier:", CFSTR("com.apple.powerui.lowpowermode"));
    userNotificationCenter = v2->_userNotificationCenter;
    v2->_userNotificationCenter = (UNUserNotificationCenter *)v8;

    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered](v2->_userNotificationCenter, "setWantsNotificationResponsesDelivered");
    -[UNUserNotificationCenter setDelegate:](v2->_userNotificationCenter, "setDelegate:", v2);
    notify_register_check("com.apple.system.lowpowermode", &v2->_bsmToken);
    out_token = 0;
    v10 = v2->_firstUseQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __26__PowerUILPMNotifier_init__block_invoke;
    v12[3] = &unk_24D3FB748;
    v13 = v2;
    notify_register_dispatch("com.apple.powerui.testdisplayautodisablednotification", &out_token, v10, v12);

  }
  return v2;
}

uint64_t __26__PowerUILPMNotifier_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "displayAutoDisabledNotification");
}

- (void)displayAutoDisabledNotification
{
  id v3;

  -[PowerUILPMNotifier autoDisabledNotificationRequest](self, "autoDisabledNotificationRequest");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_userNotificationCenter, "addNotificationRequest:withCompletionHandler:", v3, 0);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_notifier;
}

void __36__PowerUILPMNotifier_sharedInstance__block_invoke()
{
  PowerUILPMNotifier *v0;
  void *v1;

  v0 = objc_alloc_init(PowerUILPMNotifier);
  v1 = (void *)sharedInstance_notifier;
  sharedInstance_notifier = (uint64_t)v0;

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void (**v6)(_QWORD);
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a4;
  v6 = (void (**)(_QWORD))a5;
  objc_msgSend(v12, "actionIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v12, "actionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "compare:", CFSTR("reenable"));

    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BE60CC8], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPowerMode:fromSource:", 1, *MEMORY[0x24BE60CD8]);

      if (!v6)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  if (v6)
LABEL_4:
    v6[2](v6);
LABEL_5:

}

- (id)autoDisabledNotificationRequest
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(MEMORY[0x24BDF8800]);
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedUserNotificationStringForKey:arguments:", CFSTR("AUTO_DISABLE_TITLE"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTitle:", v3);

  objc_msgSend(MEMORY[0x24BDD17C8], "localizedUserNotificationStringForKey:arguments:", CFSTR("AUTO_DISABLE_BODY"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBody:", v4);

  objc_msgSend(v2, "setCategoryIdentifier:", CFSTR("auto-disable"));
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=BATTERY_USAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDefaultActionURL:", v5);

  v6 = (void *)MEMORY[0x24BDF8858];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "requestWithIdentifier:content:trigger:", v8, v2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)removeAutoDisabledNotification
{
  BOOL v3;
  uint64_t state64;

  if (notify_is_valid_token(self->_bsmToken))
  {
    state64 = 0;
    if (notify_get_state(self->_bsmToken, &state64))
      v3 = 1;
    else
      v3 = state64 == 0;
    if (!v3)
      -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_userNotificationCenter, "removeAllDeliveredNotifications");
  }
}

- (void)displayFirstUseNotification
{
  NSObject *firstUseQueue;
  _QWORD block[5];

  firstUseQueue = self->_firstUseQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PowerUILPMNotifier_displayFirstUseNotification__block_invoke;
  block[3] = &unk_24D3FB7B0;
  block[4] = self;
  dispatch_async(firstUseQueue, block);
}

void __49__PowerUILPMNotifier_displayFirstUseNotification__block_invoke(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  CFOptionFlags v5;

  v2 = (void *)os_transaction_create();
  v5 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "localizedStringForKey:value:table:", CFSTR("FIRST_NOTIFY_BODY"), &stru_24D3FD658, CFSTR("PowerUI"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFUserNotificationDisplayAlert(0.0, 0x40uLL, 0, 0, 0, (CFStringRef)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "localizedStringForKey:value:table:", CFSTR("FIRST_NOTIFY_TITLE"), &stru_24D3FD658, CFSTR("PowerUI")), v3, (CFStringRef)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "localizedStringForKey:value:table:", CFSTR("FIRST_NOTIFY_CONTINUE"), &stru_24D3FD658, CFSTR("PowerUI")), (CFStringRef)objc_msgSend(
                   *(id *)(*(_QWORD *)(a1 + 32) + 24),
                   "localizedStringForKey:value:table:",
                   CFSTR("FIRST_NOTIFY_CANCEL"),
                   &stru_24D3FD658,
                   CFSTR("PowerUI")),
    0,
    &v5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE60CC8], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPowerMode:fromSource:", 0, *MEMORY[0x24BE60CD8]);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_userNotificationCenter, 0);
  objc_storeStrong((id *)&self->_firstUseQueue, 0);
}

@end
