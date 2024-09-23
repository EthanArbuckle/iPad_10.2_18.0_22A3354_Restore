@implementation CCDPauseStateSolver

- (CCDPauseStateSolver)init
{
  CCDPauseStateSolver *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCDPauseStateSolver;
  result = -[CCDPauseStateSolver init](&v3, "init");
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[CCDPauseStateSolver saveUserPauseState:](self, "saveUserPauseState:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CCDPauseStateSolver;
  -[CCDPauseStateSolver dealloc](&v3, "dealloc");
}

- (void)incomingCallStatusUpdated:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
  self->_incomingCall = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)incomingCallDeclinedStatusUpdated:(BOOL)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
  self->_incomingCallDeclined = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)pauseForEvent:(int64_t)a3
{
  uint64_t v4;
  os_unfair_lock_s *p_lock;

  if ((unint64_t)a3 <= 2)
  {
    v4 = qword_1000123E0[a3];
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
    *((_BYTE *)&self->super.isa + v4) = 1;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)resumeForEvent:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
      return;
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
    self->_pauseButtonPressed = 0;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
  }
  self->_pauseForInactiveShield = 0;
  os_unfair_lock_unlock(p_lock);
}

- (void)saveUserPauseState:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  CCDPauseStateSolver *v7;
  CFPropertyListRef *v8;
  int v9;
  CCDPauseStateSolver *v10;
  __int16 v11;
  _BOOL4 v12;

  v3 = a3;
  v5 = CMContinuityCaptureLog(0, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = self;
    v11 = 1024;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Saving user pause %d", (uint8_t *)&v9, 0x12u);
  }

  v7 = self;
  objc_sync_enter(v7);
  v8 = (CFPropertyListRef *)&kCFBooleanTrue;
  if (!v3)
    v8 = (CFPropertyListRef *)&kCFBooleanFalse;
  CFPreferencesSetAppValue(CFSTR("com.apple.continuitycapture.userPressedPause"), *v8, CFSTR("com.apple.cameracapture"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.cameracapture"));
  objc_sync_exit(v7);

}

- (BOOL)isUserPauseStored
{
  CCDPauseStateSolver *v2;
  CFBooleanRef v3;
  BOOL v4;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (CFBooleanRef)CFPreferencesCopyAppValue(CFSTR("com.apple.continuitycapture.userPressedPause"), CFSTR("com.apple.cameracapture"));
  if (v3)
  {
    v4 = v3 == kCFBooleanTrue;
    CFRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v2);

  return v4;
}

- (void)sideButtonPressed
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
  *(_WORD *)&self->_sideButtonPressed = 1;
  self->_pauseForInactiveShield = 0;
  os_unfair_lock_unlock(p_lock);
  -[CCDPauseStateSolver saveUserPauseState:](self, "saveUserPauseState:", 0);
}

- (void)sideButtonReleased
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
  self->_sideButtonPressed = 0;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)resolvePauseState
{
  os_unfair_lock_s *p_lock;
  _BOOL4 sideButtonPressed;
  _BOOL4 pauseButtonPressed;
  _BOOL4 pauseForInactiveShield;
  _BOOL4 incomingCallDeclined;
  _BOOL4 incomingCall;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  _BOOL8 v14;
  int v16;
  const char *v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options(&self->_lock, 0x10000);
  sideButtonPressed = self->_sideButtonPressed;
  pauseButtonPressed = self->_pauseButtonPressed;
  pauseForInactiveShield = self->_pauseForInactiveShield;
  incomingCallDeclined = self->_incomingCallDeclined;
  incomingCall = self->_incomingCall;
  os_unfair_lock_unlock(p_lock);
  v10 = CMContinuityCaptureLog(0, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136316418;
    v17 = "-[CCDPauseStateSolver resolvePauseState]";
    v18 = 1024;
    v19 = sideButtonPressed;
    v20 = 1024;
    v21 = pauseButtonPressed;
    v22 = 1024;
    v23 = pauseForInactiveShield;
    v24 = 1024;
    v25 = incomingCallDeclined;
    v26 = 1024;
    v27 = incomingCall;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s _sideButtonPressed=%d, _pauseButtonPressed=%d, _pauseForInactiveShield=%d, _incomingCallDeclined=%d, _incomingCall=%d", (uint8_t *)&v16, 0x2Au);
  }

  if (!sideButtonPressed)
  {
    v13 = pauseForInactiveShield || pauseButtonPressed;
    if (!incomingCallDeclined || v13)
    {
      v14 = v13 != 0;
      if (!v13 || pauseButtonPressed)
        goto LABEL_10;
    }
    else if (!incomingCall)
    {
      goto LABEL_9;
    }
LABEL_13:
    LOBYTE(v14) = 1;
    return v14;
  }
  if (incomingCall)
    goto LABEL_13;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
  objc_msgSend(v12, "bringShieldUIProcessToForegroundIfApplicable");

LABEL_9:
  v14 = 0;
LABEL_10:
  -[CCDPauseStateSolver saveUserPauseState:](self, "saveUserPauseState:", v14);
  return v14;
}

@end
