@implementation CRSessionSilentModeManager

- (CRSessionSilentModeManager)initWithSessionStatus:(id)a3
{
  id v5;
  CRSessionSilentModeManager *v6;
  CRSessionSilentModeManager *v7;
  CRSessionSilentModeStatus *v8;
  CRSessionSilentModeStatus *muteStatus;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRSessionSilentModeManager;
  v6 = -[CRSessionSilentModeManager init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionStatus, a3);
    -[CARSessionStatus addSessionObserver:](v7->_sessionStatus, "addSessionObserver:", v7);
    v8 = (CRSessionSilentModeStatus *)objc_alloc_init((Class)CRSessionSilentModeStatus);
    muteStatus = v7->_muteStatus;
    v7->_muteStatus = v8;

  }
  return v7;
}

- (void)sessionDidConnect:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  __CFString *v7;
  __CFString *v8;
  unsigned __int8 v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  BOOL v17;
  uint64_t v18;
  NSObject *v19;
  int v20;
  const __CFString *v21;

  v4 = -[CRSessionSilentModeStatus getCarPlaySilentModePreference](self->_muteStatus, "getCarPlaySilentModePreference", a3);
  v5 = CarSilentModeLogging();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("CarPlay silent mode state has not been set yet");
    if (v4 == (id)2)
      v7 = CFSTR("Unmute when session starts");
    if (v4 == (id)1)
      v7 = CFSTR("Mute when session starts");
    v8 = v7;
    v20 = 138412290;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Session connecting, Silent Mode Status: %@", (uint8_t *)&v20, 0xCu);

  }
  v9 = -[CRSessionSilentModeStatus isDeviceSilentModeOn](self->_muteStatus, "isDeviceSilentModeOn");
  self->_deviceIsMuted = v9;
  *(_WORD *)&self->_shouldResetToMuted = v9;
  if (v4 == (id)1)
  {
    v14 = CarSilentModeLogging();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_deviceIsMuted)
        v16 = CFSTR("Muted, maintaining mute state");
      else
        v16 = CFSTR("Unmuted, attempting to mute.");
      v20 = 138412290;
      v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Device is %@", (uint8_t *)&v20, 0xCu);
    }

    if (!self->_deviceIsMuted)
    {
      v13 = CFSTR("Muting for CarPlay session");
      goto LABEL_23;
    }
  }
  else
  {
    if (v4 != (id)2)
    {
      v18 = CarSilentModeLogging();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Mirroring iPhone silent mode state", (uint8_t *)&v20, 2u);
      }

      v17 = 0;
      goto LABEL_27;
    }
    v10 = CarSilentModeLogging();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_deviceIsMuted)
        v12 = CFSTR("Muted, attempting to unmute");
      else
        v12 = CFSTR("Unmuted, maintaining mute state.");
      v20 = 138412290;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Device is %@", (uint8_t *)&v20, 0xCu);
    }

    if (self->_deviceIsMuted)
    {
      v13 = CFSTR("Unmuting for CarPlay session");
LABEL_23:
      -[CRSessionSilentModeManager matchDeviceSilentModeToCarPlaySilentModeWithReason:](self, "matchDeviceSilentModeToCarPlaySilentModeWithReason:", v13);
      v17 = 1;
      self->_shouldResetMuteState = 1;
LABEL_27:
      self->_lastModeChangeByCarkitd = v17;
    }
  }
  -[CRSessionSilentModeManager setupObservers](self, "setupObservers");
}

- (void)sessionDidDisconnect:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;

  v4 = CarSilentModeLogging(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_shouldResetMuteState)
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Session disconnected, will reset mute state: %@", (uint8_t *)&v7, 0xCu);
  }

  if (self->_shouldResetMuteState)
    -[CRSessionSilentModeStatus setDeviceSilentMode:reason:](self->_muteStatus, "setDeviceSilentMode:reason:", self->_shouldResetToMuted, CFSTR("CarPlay session ended."));
  -[CRSessionSilentModeManager tearDownObservers](self, "tearDownObservers");
}

- (void)silentModeDidChangeDuringSession
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  const __CFString *v10;
  _BOOL4 lastModeChangeByCarkitd;
  const __CFString *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;

  v3 = -[CRSessionSilentModeStatus isDeviceSilentModeOn](self->_muteStatus, "isDeviceSilentModeOn");
  v6 = (int)v3;
  if (self->_deviceIsMuted != (_DWORD)v3)
  {
    v7 = CarSilentModeLogging(v3, v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("Muted");
      if (self->_deviceIsMuted)
        v10 = CFSTR("Muted");
      else
        v10 = CFSTR("Unmuted");
      if (!v6)
        v9 = CFSTR("Unmuted");
      lastModeChangeByCarkitd = self->_lastModeChangeByCarkitd;
      v14 = 138412802;
      v15 = v10;
      v16 = 2112;
      v17 = v9;
      if (lastModeChangeByCarkitd)
        v12 = CFSTR("CarPlay");
      else
        v12 = CFSTR("Other Process");
      v18 = 2112;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Silent mode changed during CarPlay session. Old State: %@ New State: %@. Changed by: %@", (uint8_t *)&v14, 0x20u);
    }

    if (self->_lastModeChangeByCarkitd)
    {
      self->_shouldResetMuteState = 1;
    }
    else
    {
      self->_shouldResetToMuted = v6;
      self->_shouldResetMuteState = 0;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
      objc_msgSend(v13, "postNotificationName:object:userInfo:", CRExternalProcessChangedSilentMode, 0, 0);

    }
  }
  self->_lastModeChangeByCarkitd = 0;
  self->_deviceIsMuted = v6;
}

- (void)setupObservers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
  v8 = AVSystemController_SilentModeEnabledDidChangeNotification;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  objc_msgSend(v3, "setAttribute:forKey:error:", v4, AVSystemController_SubscribeToNotificationsAttribute, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "addObserver:selector:name:object:", self, "silentModeDidChangeDuringSession", AVSystemController_SilentModeEnabledDidChangeNotification, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "addObserver:selector:name:object:suspensionBehavior:", self, "ringerSwitchDidChange", CRDeviceRingerSwitchToggledNotification, 0, 4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:suspensionBehavior:", self, "silentModePanelStateDidChange", CRSilentModePanelInteraction, 0, 4);

}

- (void)tearDownObservers
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)ringerSwitchDidChange
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005ACB8;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)silentModePanelStateDidChange
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10005ADE8;
  v2[3] = &unk_1000B5728;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)matchDeviceSilentModeToCarPlaySilentModeWithReason:(id)a3
{
  CRSessionSilentModeStatus *muteStatus;
  id v5;

  muteStatus = self->_muteStatus;
  v5 = a3;
  -[CRSessionSilentModeStatus setDeviceSilentMode:reason:](self->_muteStatus, "setDeviceSilentMode:reason:", -[CRSessionSilentModeStatus getCarPlaySilentModePreference](muteStatus, "getCarPlaySilentModePreference") == (id)1, v5);

}

- (CRSessionSilentModeStatus)muteStatus
{
  return self->_muteStatus;
}

- (void)setMuteStatus:(id)a3
{
  objc_storeStrong((id *)&self->_muteStatus, a3);
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStatus, a3);
}

- (BOOL)deviceIsMuted
{
  return self->_deviceIsMuted;
}

- (void)setDeviceIsMuted:(BOOL)a3
{
  self->_deviceIsMuted = a3;
}

- (BOOL)lastModeChangeByCarkitd
{
  return self->_lastModeChangeByCarkitd;
}

- (void)setLastModeChangeByCarkitd:(BOOL)a3
{
  self->_lastModeChangeByCarkitd = a3;
}

- (BOOL)shouldResetToMuted
{
  return self->_shouldResetToMuted;
}

- (void)setShouldResetToMuted:(BOOL)a3
{
  self->_shouldResetToMuted = a3;
}

- (BOOL)shouldResetMuteState
{
  return self->_shouldResetMuteState;
}

- (void)setShouldResetMuteState:(BOOL)a3
{
  self->_shouldResetMuteState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStatus, 0);
  objc_storeStrong((id *)&self->_muteStatus, 0);
}

@end
