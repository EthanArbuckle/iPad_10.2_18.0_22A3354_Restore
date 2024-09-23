@implementation SDAutoUnlockCachedEscrowSecret

- (SDAutoUnlockCachedEscrowSecret)initWithEscrowSecret:(id)a3
{
  id v4;
  SDAutoUnlockCachedEscrowSecret *v5;
  SDAutoUnlockCachedEscrowSecret *v6;
  void *v7;
  void *v8;
  dispatch_time_t v9;
  _QWORD block[4];
  SDAutoUnlockCachedEscrowSecret *v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SDAutoUnlockCachedEscrowSecret;
  v5 = -[SDAutoUnlockCachedEscrowSecret init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    -[SDAutoUnlockCachedEscrowSecret setEscrowSecret:](v5, "setEscrowSecret:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", 3600.0));
    -[SDAutoUnlockCachedEscrowSecret setExpireDate:](v6, "setExpireDate:", v8);

    v9 = dispatch_time(0, 3600000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100105460;
    block[3] = &unk_1007146D8;
    v12 = v6;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  return v6;
}

- (BOOL)isValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockCachedEscrowSecret escrowSecret](self, "escrowSecret"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockCachedEscrowSecret expireDate](self, "expireDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "laterDate:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockCachedEscrowSecret expireDate](self, "expireDate"));
    v8 = v6 == v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getEscrowSecretCopyIfValid
{
  void *v3;
  id v4;
  unsigned int v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockCachedEscrowSecret escrowSecret](self, "escrowSecret"));
  v4 = objc_msgSend(v3, "copy");

  v5 = -[SDAutoUnlockCachedEscrowSecret isValid](self, "isValid");
  v6 = 0;
  if (v5 && v4)
    v6 = v4;

  return v6;
}

- (NSData)escrowSecret
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setEscrowSecret:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)expireDate
{
  return self->_expireDate;
}

- (void)setExpireDate:(id)a3
{
  objc_storeStrong((id *)&self->_expireDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expireDate, 0);
  objc_storeStrong((id *)&self->_escrowSecret, 0);
}

@end
