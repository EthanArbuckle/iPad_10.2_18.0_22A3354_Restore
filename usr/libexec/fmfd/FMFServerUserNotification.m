@implementation FMFServerUserNotification

- (void)activate
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[FMFServerUserNotificationManager sharedInstance](FMFServerUserNotificationManager, "sharedInstance"));
  objc_msgSend(v3, "activateNotification:", self);

}

- (int64_t)category
{
  return self->_category;
}

- (void)setCategory:(int64_t)a3
{
  self->_category = a3;
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

- (int64_t)alertLevel
{
  return self->_alertLevel;
}

- (void)setAlertLevel:(int64_t)a3
{
  self->_alertLevel = a3;
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_alternateButtonAction, 0);
  objc_storeStrong(&self->_defaultButtonAction, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_msgText, 0);
  objc_storeStrong((id *)&self->_msgTitle, 0);
}

@end
