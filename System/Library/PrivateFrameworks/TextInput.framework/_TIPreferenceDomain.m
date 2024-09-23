@implementation _TIPreferenceDomain

- (NSString)notification
{
  return self->_notification;
}

- (BOOL)needsGetSync
{
  return self->_needsGetSync;
}

- (NSString)domain
{
  return self->_domain;
}

+ (id)domainWithName:(id)a3 notification:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setDomain:", v6);

  objc_msgSend(v7, "setNotification:", v5);
  return v7;
}

- (void)setNotification:(id)a3
{
  objc_storeStrong((id *)&self->_notification, a3);
}

- (void)setDomain:(id)a3
{
  objc_storeStrong((id *)&self->_domain, a3);
}

- (void)setNeedsGetSync:(BOOL)a3
{
  self->_needsGetSync = a3;
}

- (BOOL)needsSetSync
{
  return self->_needsSetSync;
}

- (void)setNeedsSetSync:(BOOL)a3
{
  self->_needsSetSync = a3;
}

- (double)lastSynchronizedTime
{
  return self->_lastSynchronizedTime;
}

- (void)setLastSynchronizedTime:(double)a3
{
  self->_lastSynchronizedTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
