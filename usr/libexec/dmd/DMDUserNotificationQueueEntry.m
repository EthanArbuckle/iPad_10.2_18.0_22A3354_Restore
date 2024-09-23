@implementation DMDUserNotificationQueueEntry

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)defaultButtonText
{
  return self->_defaultButtonText;
}

- (void)setDefaultButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_defaultButtonText, a3);
}

- (NSString)alternateButtonText
{
  return self->_alternateButtonText;
}

- (void)setAlternateButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_alternateButtonText, a3);
}

- (NSString)otherButtonText
{
  return self->_otherButtonText;
}

- (void)setOtherButtonText:(id)a3
{
  objc_storeStrong((id *)&self->_otherButtonText, a3);
}

- (BOOL)displayOnLockScreen
{
  return self->_displayOnLockScreen;
}

- (void)setDisplayOnLockScreen:(BOOL)a3
{
  self->_displayOnLockScreen = a3;
}

- (BOOL)displayInAppWhitelistModes
{
  return self->_displayInAppWhitelistModes;
}

- (void)setDisplayInAppWhitelistModes:(BOOL)a3
{
  self->_displayInAppWhitelistModes = a3;
}

- (double)dismissAfterTimeInterval
{
  return self->_dismissAfterTimeInterval;
}

- (void)setDismissAfterTimeInterval:(double)a3
{
  self->_dismissAfterTimeInterval = a3;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  objc_storeStrong(&self->_notification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notification, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_otherButtonText, 0);
  objc_storeStrong((id *)&self->_alternateButtonText, 0);
  objc_storeStrong((id *)&self->_defaultButtonText, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
