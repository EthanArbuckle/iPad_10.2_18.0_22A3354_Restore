@implementation SBExternalDisplayEducationObserver

- (SBExternalDisplayEducationObserver)initWithBannerPoster:(id)a3
{
  id v5;
  SBExternalDisplayEducationObserver *v6;
  SBExternalDisplayEducationObserver *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBExternalDisplayEducationObserver;
  v6 = -[SBExternalDisplayEducationObserver init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bannerPoster, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__extendedDisplayControllerDidConnect_, CFSTR("SBSystemShellExtendedDisplayControllerPolicyConnectNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__extendedDisplayControllerDidDisconnect_, CFSTR("SBSystemShellExtendedDisplayControllerPolicyDisconnectNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__deviceConnectionWindowExpired_, CFSTR("SBSystemShellExtendedDisplayControllerPolicyDeviceConnectionWindowExpiredNotification"), 0);
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__hardwareAvailabilityChanged_, CFSTR("SBSystemShellExtendedDisplayControllerHardwareAvailabilityNotification"), 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBExternalDisplayEducationObserver;
  -[SBExternalDisplayEducationObserver dealloc](&v4, sel_dealloc);
}

- (void)_extendedDisplayControllerDidConnect:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  SBExternalDisplayEducationSession *v8;
  SBExternalDisplayEducationSession *educationSession;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(a3, "userInfo");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", CFSTR("kSBSystemShellExtendedDisplayControllerDisplayIdentityKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayEducationObserver.m"), 73, CFSTR("no displayIdentity for notification userInfo: %@"), v14);

  }
  objc_msgSend(v14, "objectForKey:", CFSTR("kSBSystemShellExtendedDisplayControllerHardwareAvailabilityIsAvailableKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayEducationObserver.m"), 75, CFSTR("no hardware availability for notification userInfo: %@"), v14);

  }
  v7 = objc_msgSend(v6, "BOOLValue");
  if (self->_educationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBExternalDisplayEducationSession displayIdentity](self->_educationSession, "displayIdentity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayEducationObserver.m"), 79, CFSTR("being told a display connected when we're already tracking a session for: %@"), v13);

  }
  v8 = -[SBExternalDisplayEducationSession initWithDisplayIdentity:hardwareAvailability:bannerPoster:]([SBExternalDisplayEducationSession alloc], "initWithDisplayIdentity:hardwareAvailability:bannerPoster:", v5, v7, self->_bannerPoster);
  educationSession = self->_educationSession;
  self->_educationSession = v8;

  -[SBExternalDisplayEducationSession displayConnected](self->_educationSession, "displayConnected");
}

- (void)_extendedDisplayControllerDidDisconnect:(id)a3
{
  void *v5;
  SBExternalDisplayEducationSession *educationSession;
  SBExternalDisplayEducationSession *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("kSBSystemShellExtendedDisplayControllerDisplayIdentityKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayEducationObserver.m"), 87, CFSTR("no displayIdentity for notification userInfo: %@"), v10);

  }
  educationSession = self->_educationSession;
  if (!educationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayEducationObserver.m"), 88, CFSTR("being told a display disconnected when we're not tracking a session for that display: %@"), v5);

    educationSession = self->_educationSession;
  }
  -[SBExternalDisplayEducationSession displayDisconnected](educationSession, "displayDisconnected");
  v7 = self->_educationSession;
  self->_educationSession = 0;

}

- (void)_deviceConnectionWindowExpired:(id)a3
{
  void *v5;
  SBExternalDisplayEducationSession *educationSession;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a3, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", CFSTR("kSBSystemShellExtendedDisplayControllerDisplayIdentityKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayEducationObserver.m"), 96, CFSTR("no displayIdentity for notification userInfo: %@"), v9);

  }
  educationSession = self->_educationSession;
  if (!educationSession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayEducationObserver.m"), 97, CFSTR("being told device connection window expired when we're not tracking a session for that display: %@"), v5);

    educationSession = self->_educationSession;
  }
  -[SBExternalDisplayEducationSession deviceConnectionWindowExpired](educationSession, "deviceConnectionWindowExpired");

}

- (void)_hardwareAvailabilityChanged:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kSBSystemShellExtendedDisplayControllerDisplayIdentityKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayEducationObserver.m"), 104, CFSTR("no displayIdentity for notification userInfo: %@"), v5);

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("kSBSystemShellExtendedDisplayControllerHardwareAvailabilityIsAvailableKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayEducationObserver.m"), 106, CFSTR("no hardware availability for notification userInfo: %@"), v5);

  }
  objc_msgSend(v5, "objectForKey:", CFSTR("kSBSystemShellExtendedDisplayControllerFiredDuringDeviceConnectionWindowKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayEducationObserver.m"), 108, CFSTR("no connection window info for notification userInfo: %@"), v5);

  }
  -[SBExternalDisplayEducationSession displayIdentity](self->_educationSession, "displayIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", v6);

  if (v10)
  {
    -[SBExternalDisplayEducationSession updateHardwareAvailability:withinDisplayConnectionWindow:](self->_educationSession, "updateHardwareAvailability:withinDisplayConnectionWindow:", objc_msgSend(v7, "BOOLValue"), objc_msgSend(v8, "BOOLValue"));
  }
  else
  {
    SBLogDisplayEducation();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBExternalDisplayEducationSession displayIdentity](self->_educationSession, "displayIdentity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      v21 = 2114;
      v22 = v6;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ being told hardware availability changed but we're not tracking a session for that display. tracking: %{public}@; received: %{public}@",
        buf,
        0x20u);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_educationSession, 0);
  objc_storeStrong((id *)&self->_bannerPoster, 0);
}

@end
