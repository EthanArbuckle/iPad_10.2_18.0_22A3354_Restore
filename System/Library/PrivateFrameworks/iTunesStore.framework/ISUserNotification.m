@implementation ISUserNotification

- (ISUserNotification)init
{
  ISUserNotification *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISUserNotification;
  result = -[ISUserNotification init](&v3, sel_init);
  if (result)
    result->_allowedRetryCount = 3;
  return result;
}

- (ISUserNotification)initWithDictionary:(id)a3 options:(unint64_t)a4
{
  ISUserNotification *v6;

  v6 = -[ISUserNotification init](self, "init");
  if (v6)
  {
    v6->_dictionary = (NSDictionary *)objc_msgSend(a3, "copy");
    v6->_optionFlags = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISUserNotification;
  -[ISUserNotification dealloc](&v3, sel_dealloc);
}

- (__CFUserNotification)copyUserNotification
{
  __CFUserNotification *result;
  BOOL v3;
  SInt32 error;

  error = 0;
  result = CFUserNotificationCreate(0, 0.0, self->_optionFlags, &error, (CFDictionaryRef)self->_dictionary);
  if (result)
    v3 = error == 0;
  else
    v3 = 1;
  if (!v3)
  {
    CFRelease(result);
    return 0;
  }
  return result;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (unint64_t)optionFlags
{
  return self->_optionFlags;
}

- (int64_t)allowedRetryCount
{
  return self->_allowedRetryCount;
}

- (void)setAllowedRetryCount:(int64_t)a3
{
  self->_allowedRetryCount = a3;
}

- (int64_t)currentRetryCount
{
  return self->_currentRetryCount;
}

- (void)setCurrentRetryCount:(int64_t)a3
{
  self->_currentRetryCount = a3;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

@end
