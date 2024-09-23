@implementation _RESignificantTimeChangeNotifier

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_14_1);
  return (id)sharedInstance_Notifier;
}

- (_RESignificantTimeChangeNotifier)init
{
  _RESignificantTimeChangeNotifier *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  REUpNextScheduler *scheduler;
  void *v7;
  void *v8;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_RESignificantTimeChangeNotifier;
  v2 = -[_RESignificantTimeChangeNotifier init](&v18, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x24BDAC9B8];
    v4 = MEMORY[0x24BDAC9B8];
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __40___RESignificantTimeChangeNotifier_init__block_invoke;
    v15 = &unk_24CF8AAC8;
    objc_copyWeak(&v16, &location);
    +[REUpNextScheduler schedulerWithQueue:delay:updateBlock:](REUpNextScheduler, "schedulerWithQueue:delay:updateBlock:", v3, &v12, 0.05);
    v5 = objc_claimAutoreleasedReturnValue();
    scheduler = v2->_scheduler;
    v2->_scheduler = (REUpNextScheduler *)v5;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v12, v13, v14, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2->_scheduler, sel_schedule, *MEMORY[0x24BDBC9E8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2->_scheduler, sel_schedule, *MEMORY[0x24BDBCBB8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2->_scheduler, sel_schedule, *MEMORY[0x24BDBCBC0], 0);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2->_scheduler, (CFNotificationCallback)_significantTimeChangeForScheduler, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_scheduler);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self->_scheduler, CFSTR("SignificantTimeChangeNotification"), 0);
  v5.receiver = self;
  v5.super_class = (Class)_RESignificantTimeChangeNotifier;
  -[_RESignificantTimeChangeNotifier dealloc](&v5, sel_dealloc);
}

- (void)_notify
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("RESignificantTimeChangeNotification"), 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
