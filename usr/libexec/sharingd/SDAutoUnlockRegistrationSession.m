@implementation SDAutoUnlockRegistrationSession

- (void)notifyDelegateWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  id v11;

  v4 = a3;
  v5 = auto_unlock_log(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Registration session notifying delegate with error: %@", (uint8_t *)&v10, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "session:didCompleteWithError:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession delegate](self, "delegate"));
    objc_msgSend(v9, "session:didCompleteWithError:", self, v4);

  }
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession deviceID](self, "deviceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession sessionID](self, "sessionID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p deviceID=%@ sessionID=%@>"), v5, self, v6, v7));

  return v8;
}

- (void)invalidate
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  objc_super v9;
  uint8_t buf[4];
  const __CFString *v11;

  v9.receiver = self;
  v9.super_class = (Class)SDAutoUnlockRegistrationSession;
  -[SDAutoUnlockPairingSession invalidate](&v9, "invalidate");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPairingSession aksSession](self, "aksSession"));
  v4 = objc_msgSend(v3, "resetSession");

  v6 = auto_unlock_log(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = CFSTR("NO");
    if (v4)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Reset Session: %@", buf, 0xCu);
  }

  -[SDAutoUnlockPairingSession setDelegate:](self, "setDelegate:", 0);
}

@end
