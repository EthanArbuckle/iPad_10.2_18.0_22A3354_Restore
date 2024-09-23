@implementation DMDUserNotification

- (DMDUserNotification)init
{
  DMDUserNotification *v2;
  NSUUID *v3;
  NSUUID *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DMDUserNotification;
  v2 = -[DMDUserNotification init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSUUID);
    identifier = v2->_identifier;
    v2->_identifier = v3;

    v2->_displayWhenLocked = 1;
    v2->_timeout = 0.0;
  }
  return v2;
}

- (void)dealloc
{
  __CFUserNotification *notificationRef;
  objc_super v4;

  notificationRef = self->_notificationRef;
  if (notificationRef)
    CFRelease(notificationRef);
  v4.receiver = self;
  v4.super_class = (Class)DMDUserNotification;
  -[DMDUserNotification dealloc](&v4, "dealloc");
}

- (__CFUserNotification)notificationRef
{
  return self->_notificationRef;
}

- (void)setNotificationRef:(__CFUserNotification *)a3
{
  __CFUserNotification *notificationRef;
  __CFUserNotification *v6;

  notificationRef = self->_notificationRef;
  if (notificationRef != a3)
  {
    if (notificationRef)
      CFRelease(notificationRef);
    if (a3)
      v6 = (__CFUserNotification *)CFRetain(a3);
    else
      v6 = 0;
    self->_notificationRef = v6;
  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)defaultButtonTitle
{
  return self->_defaultButtonTitle;
}

- (void)setDefaultButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)alternateButtonTitle
{
  return self->_alternateButtonTitle;
}

- (void)setAlternateButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)otherButtonTitle
{
  return self->_otherButtonTitle;
}

- (void)setOtherButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)displayWhenLocked
{
  return self->_displayWhenLocked;
}

- (void)setDisplayWhenLocked:(BOOL)a3
{
  self->_displayWhenLocked = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherButtonTitle, 0);
  objc_storeStrong((id *)&self->_alternateButtonTitle, 0);
  objc_storeStrong((id *)&self->_defaultButtonTitle, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
