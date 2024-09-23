@implementation SBConferenceManager

- (BOOL)activeFaceTimeCallExists
{
  void *v2;
  BOOL v3;

  -[SBConferenceManager activeFaceTimeCall](self, "activeFaceTimeCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)activeFaceTimeCall
{
  return (id)-[TUCallCenter activeVideoCall](self->_sharedCallCenter, "activeVideoCall");
}

+ (SBConferenceManager)sharedInstance
{
  void *v2;
  SBConferenceManager *v3;
  void *v4;

  v2 = (void *)__conferenceManager;
  if (!__conferenceManager)
  {
    kdebug_trace();
    v3 = objc_alloc_init(SBConferenceManager);
    v4 = (void *)__conferenceManager;
    __conferenceManager = (uint64_t)v3;

    kdebug_trace();
    v2 = (void *)__conferenceManager;
  }
  return (SBConferenceManager *)v2;
}

+ (void)initialize
{
  id v2;

  v2 = (id)objc_msgSend(a1, "sharedInstance");
}

- (SBConferenceManager)init
{
  SBConferenceManager *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  TUCallCenter *sharedCallCenter;
  uint64_t v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBConferenceManager;
  v2 = -[SBConferenceManager init](&v12, sel_init);
  if (v2)
  {
    v2->_hasFaceTimeCapability = MGGetBoolAnswer();
    objc_initWeak(&location, v2);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("venice"));
    v3 = MEMORY[0x1E0C80D38];
    v9 = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v10, &location);
    v2->_faceTimeCapabilityUpdateToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();

    objc_msgSend(MEMORY[0x1E0D20BE8], "sharedInstance", v9, 3221225472, __27__SBConferenceManager_init__block_invoke, &unk_1E8EACFF8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addListenerID:forService:", CFSTR("com.apple.springboard"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__faceTimeStateChanged_, *MEMORY[0x1E0DBD4F0], 0);
    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v6 = objc_claimAutoreleasedReturnValue();
    sharedCallCenter = v2->_sharedCallCenter;
    v2->_sharedCallCenter = (TUCallCenter *)v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __27__SBConferenceManager_init__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    WeakRetained[8] = MGGetBoolAnswer();
    WeakRetained = v2;
  }

}

- (BOOL)hasFaceTimeCapability
{
  return self->_hasFaceTimeCapability;
}

- (BOOL)faceTimeIsAvailable
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D20BE8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "availabilityForListenerID:forService:", CFSTR("com.apple.springboard"), 0) == 1;

  return v3;
}

- (BOOL)faceTimeInvitationExists
{
  void *v2;
  BOOL v3;

  -[SBConferenceManager incomingFaceTimeCall](self, "incomingFaceTimeCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)inFaceTime
{
  void *v2;
  BOOL v3;

  -[SBConferenceManager currentFaceTimeCall](self, "currentFaceTimeCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)inFaceTimeVideo
{
  void *v2;
  char v3;

  -[SBConferenceManager currentFaceTimeCall](self, "currentFaceTimeCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVideo");

  return v3;
}

- (id)incomingFaceTimeCall
{
  return (id)-[TUCallCenter incomingVideoCall](self->_sharedCallCenter, "incomingVideoCall");
}

- (id)currentFaceTimeCall
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SBConferenceManager activeFaceTimeCall](self, "activeFaceTimeCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SBConferenceManager incomingFaceTimeCall](self, "incomingFaceTimeCall");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)canStartFaceTime
{
  return !-[SBConferenceManager inFaceTime](self, "inFaceTime");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_faceTimeCapabilityUpdateToken != (MGNotificationTokenStruct *)-1)
    MGCancelNotifications();
  objc_msgSend(MEMORY[0x1E0D20BE8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListenerID:forService:", CFSTR("com.apple.springboard"), 0);

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  v4.receiver = self;
  v4.super_class = (Class)SBConferenceManager;
  -[SBConferenceManager dealloc](&v4, sel_dealloc);
}

- (void)_faceTimeStateChanged:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[SBConferenceManager currentFaceTimeCall](self, "currentFaceTimeCall");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v16, "object");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  if (objc_msgSend(v7, "isVideo"))
  {
    v8 = objc_msgSend(v7, "status");
    if (v8 == 6 || !v8)
    {
      +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "inCall");

      if ((v10 & 1) == 0)
      {
        +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isUILocked");

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "postNotificationName:object:", CFSTR("SBLockScreenFacetimeCallUINeedsUpdateNotification"), self);

        }
      }
    }
    SBUpdateCallState();
    +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resetIdleTimerForReason:", CFSTR("SBConference:FaceTimeChanged"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("SBFaceTimeStateChangedNotification"), self);

  }
}

- (void)endFaceTime
{
  void *v3;
  void *v4;

  -[SBConferenceManager currentFaceTimeCall](self, "currentFaceTimeCall");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[TUCallCenter disconnectCall:](self->_sharedCallCenter, "disconnectCall:", v3);
    v3 = v4;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedCallCenter, 0);
}

@end
