@implementation SBVODController

- (SBVODController)init
{
  SBVODController *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBVODController;
  v2 = -[SBVODController init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_RentalMovieAdded, CFSTR("com.apple.itunesstored.RentalAdded"), 0, CFNotificationSuspensionBehaviorDrop);
    -[SBVODController _launchIPodIfNecessary](v2, "_launchIPodIfNecessary");
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.itunesstored.RentalAdded"), 0);
  v4.receiver = self;
  v4.super_class = (Class)SBVODController;
  -[SBVODController dealloc](&v4, sel_dealloc);
}

+ (id)sharedInstance
{
  void *v2;
  SBVODController *v3;
  void *v4;

  v2 = (void *)sharedInstance_sController;
  if (!sharedInstance_sController)
  {
    kdebug_trace();
    v3 = objc_alloc_init(SBVODController);
    v4 = (void *)sharedInstance_sController;
    sharedInstance_sController = (uint64_t)v3;

    kdebug_trace();
    v2 = (void *)sharedInstance_sController;
  }
  return v2;
}

- (void)_launchIPodIfNecessary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t buf[16];

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", CPSharedResourcesDirectory(), CFSTR("Media"), CFSTR("iTunes_Control"), CFSTR("iTunes"), CFSTR("Rentals.plist"), 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v3);
    objc_msgSend(v4, "objectForKey:", CFSTR("Rentals"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      SBLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Launching iPod for rentals", buf, 2u);
      }

      SBWorkspaceLaunchMusicSuspended();
    }

  }
}

@end
