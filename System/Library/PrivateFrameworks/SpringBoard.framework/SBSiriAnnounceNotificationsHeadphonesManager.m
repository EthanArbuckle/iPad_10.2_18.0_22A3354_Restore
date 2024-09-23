@implementation SBSiriAnnounceNotificationsHeadphonesManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SBSiriAnnounceNotificationsHeadphonesManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, block);
  return (id)sharedInstance_sharedInstance_1;
}

void __62__SBSiriAnnounceNotificationsHeadphonesManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v1;

}

- (SBSiriAnnounceNotificationsHeadphonesManager)init
{
  SBSiriAnnounceNotificationsHeadphonesManager *v2;
  uint64_t v3;
  AFSiriAnnouncementRequestCapabilityManager *capabilityManager;
  AFSiriAnnouncementRequestCapabilityManager *v5;
  _QWORD v7[4];
  SBSiriAnnounceNotificationsHeadphonesManager *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSiriAnnounceNotificationsHeadphonesManager;
  v2 = -[SBSiriAnnounceNotificationsHeadphonesManager init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CFE9C0]), "initWithPlatform:", 1);
    capabilityManager = v2->_capabilityManager;
    v2->_capabilityManager = (AFSiriAnnouncementRequestCapabilityManager *)v3;

    -[AFSiriAnnouncementRequestCapabilityManager addObserver:](v2->_capabilityManager, "addObserver:", v2);
    v5 = v2->_capabilityManager;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __52__SBSiriAnnounceNotificationsHeadphonesManager_init__block_invoke;
    v7[3] = &unk_1E8EA3A88;
    v8 = v2;
    -[AFSiriAnnouncementRequestCapabilityManager fetchAvailableAnnouncementRequestTypesWithCompletion:](v5, "fetchAvailableAnnouncementRequestTypesWithCompletion:", v7);

  }
  return v2;
}

uint64_t __52__SBSiriAnnounceNotificationsHeadphonesManager_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "availableAnnouncementRequestTypesChanged:onPlatform:", a2, 1);
}

- (void)dealloc
{
  objc_super v3;

  -[AFSiriAnnouncementRequestCapabilityManager removeObserver:](self->_capabilityManager, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBSiriAnnounceNotificationsHeadphonesManager;
  -[SBSiriAnnounceNotificationsHeadphonesManager dealloc](&v3, sel_dealloc);
}

- (BOOL)canAnnounce
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  NSObject *v10;
  _DWORD v12[2];
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUILocked");

  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "inCall");

  +[SBConferenceManager sharedInstance](SBConferenceManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "inFaceTime");

  v9 = -[SBSiriAnnounceNotificationsHeadphonesManager headphonesNotificationAnnouncementsAvailable](self, "headphonesNotificationAnnouncementsAvailable");
  SBLogSiri();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67110144;
    v12[1] = v4 & ~v6 & ~v8 & v9;
    v13 = 1024;
    v14 = v4;
    v15 = 1024;
    v16 = v6;
    v17 = 1024;
    v18 = v8;
    v19 = 1024;
    v20 = v9;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Notification/LiveActivityAlert can be spoken: %{BOOL}u [ isUILocked: %{BOOL}u inCall: %{BOOL}u inFaceTime: %{BOOL}u headphonesNotificationAnnouncementsAvailable: %{BOOL}u ]", (uint8_t *)v12, 0x20u);
  }

  return v4 & ~(_BYTE)v6 & ~(_BYTE)v8 & v9;
}

- (void)availableAnnouncementRequestTypesChanged:(unint64_t)a3 onPlatform:(int64_t)a4
{
  unint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a4 == 1)
  {
    v5 = a3 & 1;
    if (-[SBSiriAnnounceNotificationsHeadphonesManager headphonesNotificationAnnouncementsAvailable](self, "headphonesNotificationAnnouncementsAvailable") != (a3 & 1))
    {
      SBLogSiri();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        AFSiriAnnouncementPlatformGetName();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138412546;
        v9 = v7;
        v10 = 1024;
        v11 = v5;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Available announcements on %@ changed to %{BOOL}u", (uint8_t *)&v8, 0x12u);

      }
      -[SBSiriAnnounceNotificationsHeadphonesManager setHeadphonesNotificationAnnouncementsAvailable:](self, "setHeadphonesNotificationAnnouncementsAvailable:", v5);
    }
  }
}

- (BOOL)headphonesNotificationAnnouncementsAvailable
{
  return self->_headphonesNotificationAnnouncementsAvailable;
}

- (void)setHeadphonesNotificationAnnouncementsAvailable:(BOOL)a3
{
  self->_headphonesNotificationAnnouncementsAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilityManager, 0);
}

@end
