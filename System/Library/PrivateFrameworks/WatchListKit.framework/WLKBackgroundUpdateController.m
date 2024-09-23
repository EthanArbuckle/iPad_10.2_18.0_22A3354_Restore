@implementation WLKBackgroundUpdateController

+ (id)sharedInstance
{
  if (sharedInstance___once_1 != -1)
    dispatch_once(&sharedInstance___once_1, &__block_literal_global_5);
  return (id)sharedInstance___sharedInstance_0;
}

void __47__WLKBackgroundUpdateController_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[WLKBackgroundUpdateController _init]([WLKBackgroundUpdateController alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;

}

- (WLKBackgroundUpdateController)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKBackgroundUpdateControllerInitException"), CFSTR("-init is not supported. Use +sharedInstance."));

  return 0;
}

- (id)_init
{
  WLKBackgroundUpdateController *v2;
  NSObject *v3;
  id v4;
  uint32_t v5;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WLKBackgroundUpdateController;
  v2 = -[WLKBackgroundUpdateController init](&v10, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = MEMORY[0x1E0C80D38];
    v4 = MEMORY[0x1E0C80D38];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__WLKBackgroundUpdateController__init__block_invoke;
    v7[3] = &unk_1E68A7D68;
    objc_copyWeak(&v8, &location);
    v5 = notify_register_dispatch("com.apple.WatchListKit.background-update-requested", &v2->_notifyToken, v3, v7);

    v2->_notifyTokenIsValid = v5 == 0;
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __38__WLKBackgroundUpdateController__init__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  NSLog(CFSTR("Got background update request."));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    NSLog(CFSTR("Posting WLKBackgroundUpdateRequestedNotification"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("WLKBackgroundUpdateRequestedNotification"), WeakRetained);

  }
}

- (void)dealloc
{
  objc_super v3;

  if (self->_notifyTokenIsValid)
    notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)WLKBackgroundUpdateController;
  -[WLKBackgroundUpdateController dealloc](&v3, sel_dealloc);
}

@end
