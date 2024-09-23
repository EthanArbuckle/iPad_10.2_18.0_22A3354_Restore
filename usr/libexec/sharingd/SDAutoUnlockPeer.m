@implementation SDAutoUnlockPeer

- (SDAutoUnlockPeer)initWithDeviceID:(id)a3
{
  id v3;
  SDAutoUnlockPeer *v4;
  NSString *v5;
  NSString *deviceID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockPeer;
  v3 = a3;
  v4 = -[SDAutoUnlockPeer init](&v8, "init");
  v5 = (NSString *)objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  deviceID = v4->_deviceID;
  v4->_deviceID = v5;

  v4->_state = 0;
  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPeer deviceID](self, "deviceID"));
  v5 = objc_msgSend((id)objc_opt_class(self, v4), "stringFromState:", -[SDAutoUnlockPeer state](self, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<SDAutoUnlockPeer: %p, deviceID = %@, state = %@>"), self, v3, v6));

  return v7;
}

- (BOOL)shouldRegister
{
  return !-[SDAutoUnlockPeer state](self, "state") || (id)-[SDAutoUnlockPeer state](self, "state") == (id)4;
}

- (BOOL)canPerformUnlocks
{
  return (id)-[SDAutoUnlockPeer state](self, "state") == (id)3;
}

- (BOOL)isKeyBagLocked
{
  return (id)-[SDAutoUnlockPeer state](self, "state") == (id)4;
}

- (void)handlePairedSuccessfully
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPeer deviceID](self, "deviceID"));
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pairing has armed: %@", (uint8_t *)&v6, 0xCu);

  }
  -[SDAutoUnlockPeer setState:](self, "setState:", 3);
}

- (void)handleRegistrationBegan
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPeer deviceID](self, "deviceID"));
    v6 = 138412290;
    v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning registration for deviceID: %@", (uint8_t *)&v6, 0xCu);

  }
  -[SDAutoUnlockPeer setState:](self, "setState:", 1);
}

- (void)handleRegistrationCompletedSuccessfully:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  -[SDAutoUnlockPeer setState:](self, "setState:", v3);
}

- (void)handleRegistrationFailedKeyLocked
{
  -[SDAutoUnlockPeer setState:](self, "setState:", 4);
}

- (void)handleDeviceUnlocked
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;

  if ((id)-[SDAutoUnlockPeer state](self, "state") == (id)2)
  {
    v3 = auto_unlock_log(2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPeer deviceID](self, "deviceID"));
      v13 = 138412290;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unlock has armed: %@", (uint8_t *)&v13, 0xCu);

    }
    -[SDAutoUnlockPeer setState:](self, "setState:", 3);
  }
  else
  {
    v6 = -[SDAutoUnlockPeer state](self, "state");
    if (v6 != 3)
    {
      v7 = auto_unlock_log(v6);
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockPeer deviceID](self, "deviceID"));
        v11 = objc_msgSend((id)objc_opt_class(self, v10), "stringFromState:", -[SDAutoUnlockPeer state](self, "state"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = 138412546;
        v14 = v9;
        v15 = 2112;
        v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unlock did not arm %@ current state is %@", (uint8_t *)&v13, 0x16u);

      }
    }
  }
}

- (void)handleBioLockout
{
  -[SDAutoUnlockPeer setState:](self, "setState:", 0);
}

- (void)handleRemoteRegistrationRequested
{
  -[SDAutoUnlockPeer setState:](self, "setState:", 1);
}

- (void)handleConfirmationFailed
{
  -[SDAutoUnlockPeer setState:](self, "setState:", 0);
}

+ (id)stringFromState:(unint64_t)a3
{
  if (a3 > 4)
    return CFSTR("Unknown");
  else
    return *(&off_100716DE0 + a3);
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceID, 0);
}

@end
