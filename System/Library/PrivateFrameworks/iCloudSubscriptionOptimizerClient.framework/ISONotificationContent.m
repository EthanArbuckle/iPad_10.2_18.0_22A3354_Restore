@implementation ISONotificationContent

+ (id)notImplementedException
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("NotImplementedException: This method needs overriden."), 0);
}

- (BOOL)shouldCallMlDaemon
{
  id v2;

  +[ISONotificationContent notImplementedException](ISONotificationContent, "notImplementedException");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

@end
