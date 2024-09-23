@implementation AppProtectionObserver

- (AppProtectionObserver)init
{
  AppProtectionObserver *v2;
  void *v3;
  uint64_t v4;
  APSubjectMonitorSubscription *subscription;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AppProtectionObserver;
  v2 = -[AppProtectionObserver init](&v8, "init");
  if (v2 && sub_1004F9904())
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[APSubject subjectMonitorRegistry](APSubject, "subjectMonitorRegistry"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addMonitor:subjectMask:", v2, 1));
    subscription = v2->_subscription;
    v2->_subscription = (APSubjectMonitorSubscription *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[APApplication applicationWithBundleIdentifier:](APApplication, "applicationWithBundleIdentifier:", CFSTR("com.apple.MobileSMS")));
    -[AppProtectionObserver setMessagesAppLockState:](v2, "setMessagesAppLockState:", objc_msgSend(v6, "isLocked"));

  }
  return v2;
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[APApplication applicationWithBundleIdentifier:](APApplication, "applicationWithBundleIdentifier:", CFSTR("com.apple.MobileSMS"), a4));
  -[AppProtectionObserver setMessagesAppLockState:](self, "setMessagesAppLockState:", objc_msgSend(v5, "isLocked"));

}

- (void)dealloc
{
  objc_super v3;

  -[APSubjectMonitorSubscription invalidate](self->_subscription, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)AppProtectionObserver;
  -[AppProtectionObserver dealloc](&v3, "dealloc");
}

- (APSubjectMonitorSubscription)subscription
{
  return self->_subscription;
}

- (void)setSubscription:(id)a3
{
  objc_storeStrong((id *)&self->_subscription, a3);
}

- (BOOL)messagesAppLockState
{
  return self->_messagesAppLockState;
}

- (void)setMessagesAppLockState:(BOOL)a3
{
  self->_messagesAppLockState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscription, 0);
}

@end
