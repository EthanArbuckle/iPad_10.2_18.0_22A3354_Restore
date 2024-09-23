@implementation MarketingNotificationService

- (BOOL)supportsHandling:(id)a3
{
  return objc_msgSend((id)objc_opt_self(AMSUserNotification), "shouldHandleServiceExtensionNotificationRequest:", a3);
}

- (void)didReceive:(id)a3 withContentHandler:(id)a4
{
  void *v6;
  id v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  swift_retain(self);
  sub_100017EAC(v7, (uint64_t)self, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_release(self);
}

- (void)serviceExtensionTimeWillExpire
{
  uint64_t v3;

  v3 = swift_retain(self);
  sub_100017C34(v3);
  swift_release(self);
}

@end
