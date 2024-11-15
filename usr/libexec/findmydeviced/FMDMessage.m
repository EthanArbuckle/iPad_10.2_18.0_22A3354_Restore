@implementation FMDMessage

- (void)activate
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[FMDMessageMgr_iOS sharedInstance](FMDMessageMgr_iOS, "sharedInstance"));
  objc_msgSend(v3, "activateMessage:", self);

}

+ (void)stopAllSounds
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FMDMessageMgr_iOS sharedInstance](FMDMessageMgr_iOS, "sharedInstance"));
  objc_msgSend(v2, "stopAllSounds");

}

- (BOOL)showMessage
{
  return self->_showMessage;
}

- (void)setShowMessage:(BOOL)a3
{
  self->_showMessage = a3;
}

- (BOOL)playSound
{
  return self->_playSound;
}

- (void)setPlaySound:(BOOL)a3
{
  self->_playSound = a3;
}

- (BOOL)vibrate
{
  return self->_vibrate;
}

- (void)setVibrate:(BOOL)a3
{
  self->_vibrate = a3;
}

- (BOOL)torch
{
  return self->_torch;
}

- (void)setTorch:(BOOL)a3
{
  self->_torch = a3;
}

- (NSString)msgTitle
{
  return self->_msgTitle;
}

- (void)setMsgTitle:(id)a3
{
  objc_storeStrong((id *)&self->_msgTitle, a3);
}

- (NSString)msgText
{
  return self->_msgText;
}

- (void)setMsgText:(id)a3
{
  objc_storeStrong((id *)&self->_msgText, a3);
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_defaultButtonTitle, a3);
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_alternateButtonTitle, a3);
}

- (id)defaultButtonAction
{
  return self->_defaultButtonAction;
}

- (void)setDefaultButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)alternateButtonAction
{
  return self->_alternateButtonAction;
}

- (void)setAlternateButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (BOOL)showMsgInLockScreen
{
  return self->_showMsgInLockScreen;
}

- (void)setShowMsgInLockScreen:(BOOL)a3
{
  self->_showMsgInLockScreen = a3;
}

- (BOOL)dismissMsgOnUnlock
{
  return self->_dismissMsgOnUnlock;
}

- (void)setDismissMsgOnUnlock:(BOOL)a3
{
  self->_dismissMsgOnUnlock = a3;
}

- (BOOL)dismissMsgOnLock
{
  return self->_dismissMsgOnLock;
}

- (void)setDismissMsgOnLock:(BOOL)a3
{
  self->_dismissMsgOnLock = a3;
}

- (NSString)soundName
{
  return self->_soundName;
}

- (void)setSoundName:(id)a3
{
  objc_storeStrong((id *)&self->_soundName, a3);
}

- (int)soundDuration
{
  return self->_soundDuration;
}

- (void)setSoundDuration:(int)a3
{
  self->_soundDuration = a3;
}

- (BOOL)isHighPrioritySound
{
  return self->_isHighPrioritySound;
}

- (void)setIsHighPrioritySound:(BOOL)a3
{
  self->_isHighPrioritySound = a3;
}

- (BOOL)isFmipSound
{
  return self->_isFmipSound;
}

- (void)setIsFmipSound:(BOOL)a3
{
  self->_isFmipSound = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundName, 0);
  objc_storeStrong(&self->_alternateButtonAction, 0);
  objc_storeStrong(&self->_defaultButtonAction, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_msgText, 0);
  objc_storeStrong((id *)&self->_msgTitle, 0);
}

@end
