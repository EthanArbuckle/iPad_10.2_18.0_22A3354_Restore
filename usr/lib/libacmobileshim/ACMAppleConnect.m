@implementation ACMAppleConnect

- (void)authenticateWithRequest:(id)a3 password:(id)a4
{
  objc_msgSend(-[ACMAppleConnect private](self, "private"), "authenticateWithRequest:password:", a3, a4);
}

+ (id)sharedInstance
{
  id result;

  result = (id)sAppleConnect;
  if (!sAppleConnect)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0)
        ACFLog(6, (uint64_t)"+[ACMAppleConnect sharedInstance]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnect.m", 47, 0, "Creating shared instance of %@ version", CFSTR("2.9.2"));
    }
    result = (id)objc_opt_new();
    sAppleConnect = (uint64_t)result;
  }
  return result;
}

- (ACMAppleConnect)init
{
  void *v3;
  ACMAppleConnect *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v3 = (void *)objc_opt_class();
  objc_sync_enter(v3);
  if (sAppleConnect)
  {
    -[ACMAppleConnect dealloc](self, "dealloc");
    v4 = (ACMAppleConnect *)(id)sAppleConnect;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ACMAppleConnect;
    v4 = -[ACMAppleConnect init](&v8, sel_init);
    sAppleConnect = (uint64_t)v4;
    v5 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    objc_msgSend(v5, "addObserver:selector:name:object:", v4, sel_handleMemoryWarningNotification_, *MEMORY[0x24BDF7538], v6);
  }
  objc_sync_exit(v3);
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_opt_class();
  objc_sync_enter(v3);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  if ((ACMAppleConnect *)sAppleConnect == self)
    sAppleConnect = 0;
  objc_sync_exit(v3);
  objc_msgSend(self->_private, "setDelegate:", 0);
  objc_msgSend(self->_private, "setMasterObject:", 0);

  self->_private = 0;
  +[ACFComponents setComponents:](ACMExternalAppleConnectImplComponents, "setComponents:", 0);
  v4.receiver = self;
  v4.super_class = (Class)ACMAppleConnect;
  -[ACMAppleConnect dealloc](&v4, sel_dealloc);
}

- (void)handleMemoryWarningNotification:(id)a3
{
  id v4;

  objc_sync_enter(self);
  v4 = self->_private;
  if (v4 && objc_msgSend(v4, "shouldReleaseOnMemoryWarning"))
  {
    objc_msgSend(self->_private, "setDelegate:", 0);
    objc_msgSend(self->_private, "setMasterObject:", 0);

    self->_private = 0;
  }
  objc_sync_exit(self);
}

- (void)setupComponents
{
  id v2;
  id v3;

  v2 = (id)objc_opt_new();
  objc_msgSend(v2, "setTransportClass:", objc_opt_class());
  objc_msgSend(v2, "setCryptograph:", (id)objc_opt_new());
  objc_msgSend(v2, "setKeychainManager:", (id)objc_opt_new());
  objc_msgSend(v2, "setCertificateStoragePolicy:", (id)objc_opt_new());
  objc_msgSend(v2, "setTgtStoragePolicy:", (id)objc_opt_new());
  objc_msgSend(v2, "setLocalAuthenticationContextClass:", objc_opt_class());
  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "setAuthContextClass:", objc_opt_class());
  objc_msgSend(v3, "setSsoTokenClass:", objc_opt_class());
  objc_msgSend(v2, "setTicketManager:", v3);
  +[ACFComponents setComponents:](ACMExternalAppleConnectImplComponents, "setComponents:", v2);
}

- (id)private
{
  id v3;
  id v4;
  id v5;

  objc_sync_enter(self);
  v3 = self->_private;
  if (!v3)
  {
    -[ACMAppleConnect setupComponents](self, "setupComponents");
    v4 = (id)ACMExternalAppleConnectPrivateCreate((uint64_t)self);
    self->_private = v4;
    objc_msgSend(v4, "setDelegate:", self->_delegate);
    v3 = self->_private;
  }
  v5 = v3;
  objc_sync_exit(self);
  return v5;
}

- (NSString)version
{
  return (NSString *)CFSTR("2.9.2");
}

- (void)authenticate:(id)a3
{
  objc_msgSend(-[ACMAppleConnect private](self, "private"), "authenticate:", a3);
}

- (void)verifyServiceTicket:(id)a3
{
  objc_msgSend(-[ACMAppleConnect private](self, "private"), "verifyServiceTicket:", a3);
}

- (void)cancelRequests
{
  objc_msgSend(-[ACMAppleConnect private](self, "private"), "cancelRequests");
}

- (id)hideAppleConnectSignInDialog
{
  return (id)objc_msgSend(-[ACMAppleConnect private](self, "private"), "hideAppleConnectSignInDialog");
}

- (id)delegate
{
  id delegate;

  objc_sync_enter(self);
  delegate = self->_delegate;
  objc_sync_exit(self);
  return delegate;
}

- (void)setDelegate:(id)a3
{
  objc_sync_enter(self);
  if (self->_delegate != a3)
  {
    self->_delegate = a3;
    objc_msgSend(self->_private, "setDelegate:", a3);
  }
  objc_sync_exit(self);
}

- (unint64_t)logLevel
{
  return objc_msgSend(-[ACMAppleConnect private](self, "private"), "logLevel");
}

- (void)setLogLevel:(unint64_t)a3
{
  objc_msgSend(-[ACMAppleConnect private](self, "private"), "setLogLevel:", a3);
}

@end
