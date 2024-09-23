@implementation SDAutoUnlockAKSSession

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  return -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:](self, "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:", a3, a4, a5, a6, a7, 0, v8, 0);
}

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 externalACMContext:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:](self, "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:", a3, a4, a5, a6, a7, 0, v9, a8);
}

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 usingEscrow:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:](self, "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:", a3, a4, a5, a6, a7, 0, v9, 0);
}

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 escrowSecret:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[SDAutoUnlockAKSSession initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:](self, "initWithLocalLTK:remoteLTK:sessionType:originator:deviceID:escrowSecret:usingEscrow:externalACMContext:", a3, a4, a5, a6, a7, a8, v9, 0);
}

- (SDAutoUnlockAKSSession)initWithLocalLTK:(id)a3 remoteLTK:(id)a4 sessionType:(int64_t)a5 originator:(BOOL)a6 deviceID:(id)a7 escrowSecret:(id)a8 usingEscrow:(BOOL)a9 externalACMContext:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  SDAutoUnlockAKSSession *v20;
  NSData *v21;
  NSData *localLTK;
  NSData *v23;
  NSData *remoteLTK;
  NSData *v25;
  NSData *escrowSecret;
  id v28;
  objc_super v29;

  v28 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a10;
  v29.receiver = self;
  v29.super_class = (Class)SDAutoUnlockAKSSession;
  v20 = -[SDAutoUnlockAKSSession init](&v29, "init");
  if (v20)
  {
    v21 = (NSData *)objc_msgSend(v28, "copy");
    localLTK = v20->_localLTK;
    v20->_localLTK = v21;

    v23 = (NSData *)objc_msgSend(v16, "copy");
    remoteLTK = v20->_remoteLTK;
    v20->_remoteLTK = v23;

    v20->_sessionType = a5;
    v20->_originator = a6;
    v25 = (NSData *)objc_msgSend(v18, "copy");
    escrowSecret = v20->_escrowSecret;
    v20->_escrowSecret = v25;

    v20->_usingEscrow = a9;
    objc_storeStrong((id *)&v20->_deviceID, a7);
    objc_storeStrong((id *)&v20->_externalACMContext, a10);
    v20->_aksSessionID = -1;
    v20->_acmContext = 0;
    -[SDAutoUnlockAKSSession setupSession](v20, "setupSession");
  }

  return v20;
}

- (void)setupSession
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  int v21;
  void *v22;
  uint64_t v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  _QWORD v32[6];
  _QWORD v33[6];
  _QWORD v34[6];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int v38;

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  switch(-[SDAutoUnlockAKSSession sessionType](self, "sessionType"))
  {
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      v5 = -[SDAutoUnlockAKSSession originator](self, "originator");
      -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", sub_10001E5F8(v3, v4, v5, (_DWORD *)v36 + 6, 1));

      v6 = *((int *)v36 + 6);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10002F380;
      v34[3] = &unk_1007148F0;
      v34[4] = self;
      v34[5] = &v35;
      -[SDAutoUnlockAKSSession fixRemoteLTKWithStatus:retryBlock:](self, "fixRemoteLTKWithStatus:retryBlock:", v6, v34);
      goto LABEL_18;
    case 2:
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      v9 = -[SDAutoUnlockAKSSession originator](self, "originator");
      v10 = -[SDAutoUnlockAKSSession usingEscrow](self, "usingEscrow");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession escrowSecret](self, "escrowSecret"));
      -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", sub_10001EC04(v7, v8, v9, v10, 0, v11, (_DWORD *)v36 + 6));

      v12 = *((int *)v36 + 6);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_10002F4A4;
      v33[3] = &unk_1007148F0;
      v33[4] = self;
      v33[5] = &v35;
      -[SDAutoUnlockAKSSession fixRemoteLTKWithStatus:retryBlock:](self, "fixRemoteLTKWithStatus:retryBlock:", v12, v33);
      goto LABEL_18;
    case 3:
      if (!-[SDAutoUnlockAKSSession originator](self, "originator"))
        goto LABEL_14;
      goto LABEL_15;
    case 4:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      v15 = -[SDAutoUnlockAKSSession originator](self, "originator");
      -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", sub_10001E5F8(v13, v14, v15, (_DWORD *)v36 + 6, 0));
      goto LABEL_17;
    case 5:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      v16 = -[SDAutoUnlockAKSSession originator](self, "originator");
      -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", sub_10001EBE8(v13, v14, v16, (_DWORD *)v36 + 6));
      goto LABEL_17;
    case 6:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      v17 = -[SDAutoUnlockAKSSession originator](self, "originator");
      -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", sub_10001E5F8(v13, v14, v17, (_DWORD *)v36 + 6, 1));
      goto LABEL_17;
    case 7:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      v20 = -[SDAutoUnlockAKSSession originator](self, "originator");
      v21 = -[SDAutoUnlockAKSSession usingEscrow](self, "usingEscrow");
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession escrowSecret](self, "escrowSecret"));
      -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", sub_10001EDE0(v18, v19, v20, v21, 0, v22, 0, (_DWORD *)v36 + 6));

      v23 = *((int *)v36 + 6);
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10002F5FC;
      v32[3] = &unk_1007148F0;
      v32[4] = self;
      v32[5] = &v35;
      -[SDAutoUnlockAKSSession fixRemoteLTKWithStatus:retryBlock:](self, "fixRemoteLTKWithStatus:retryBlock:", v23, v32);
      goto LABEL_18;
    case 8:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      v24 = -[SDAutoUnlockAKSSession originator](self, "originator");
      v25 = -[SDAutoUnlockAKSSession usingEscrow](self, "usingEscrow");
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession escrowSecret](self, "escrowSecret"));
      -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", sub_10001EF6C(v13, v14, v24, v25, 0, v26, 0, (_DWORD *)v36 + 6));
      goto LABEL_16;
    case 9:
      if (-[SDAutoUnlockAKSSession originator](self, "originator"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession externalACMContext](self, "externalACMContext"));

        if (v27)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
          v28 = -[SDAutoUnlockAKSSession originator](self, "originator");
          v29 = -[SDAutoUnlockAKSSession usingEscrow](self, "usingEscrow");
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession externalACMContext](self, "externalACMContext"));
          -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", sub_10001EC34(v13, v14, v28, v29, 1, 1, v26, 0, (_DWORD *)v36 + 6));
        }
        else
        {
LABEL_15:
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
          v30 = -[SDAutoUnlockAKSSession originator](self, "originator");
          v31 = -[SDAutoUnlockAKSSession usingEscrow](self, "usingEscrow");
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession escrowSecret](self, "escrowSecret"));
          -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", sub_10001EC04(v13, v14, v30, v31, 1, v26, (_DWORD *)v36 + 6));
        }
LABEL_16:

LABEL_17:
      }
      else
      {
LABEL_14:
        -[SDAutoUnlockAKSSession setupAuthorizationSession](self, "setupAuthorizationSession");
      }
LABEL_18:
      _Block_object_dispose(&v35, 8);
      return;
    default:
      goto LABEL_18;
  }
}

- (void)setupAuthorizationSession
{
  NSData *externalACMContext;
  __ACMHandle **p_acmContext;
  uint64_t v5;
  void *v6;
  void *v7;
  NSData *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  NSData *v12;
  NSData *v13;
  NSObject *v14;
  void *v15;
  __ACMHandle *v16;
  NSData *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  NSData *v22;

  v20 = 0;
  externalACMContext = self->_externalACMContext;
  p_acmContext = &self->_acmContext;
  if (externalACMContext)
  {
    sub_10001D130(externalACMContext, &self->_acmContext);
    if (!*p_acmContext)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
      -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", sub_10001F0F4(v6, v7, self->_externalACMContext, 0));

    }
  }
  else
  {
    sub_10001D0E0((uint64_t *)&self->_acmContext);
  }
  if (*p_acmContext)
  {
    v8 = self->_externalACMContext;
    v9 = auto_unlock_log(v5);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        v12 = self->_externalACMContext;
        *(_DWORD *)buf = 138477827;
        v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AKS session using provided context: %{private}@", buf, 0xCu);
      }

      v13 = self->_externalACMContext;
    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "AKS session creating new context", buf, 2u);
      }

      v16 = *p_acmContext;
      v19 = 0;
      sub_10001D1BC(v16, &v19, &v20);
      v17 = (NSData *)v19;
      v13 = v17;
      if (v20)
      {
        v18 = auto_unlock_log(v17);
        v14 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_10002FDF4(&v20, v14);
        goto LABEL_16;
      }
    }
    v14 = objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession localLTK](self, "localLTK"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
    -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", sub_10001F0F4(v14, v15, v13, 0));

LABEL_16:
  }
}

- (void)fixRemoteLTK
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to fix remote LTK", v10, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession deviceID](self, "deviceID"));
  objc_msgSend(v5, "resignRemoteLTKForDeviceID:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockAKSManager sharedManager](SDAutoUnlockAKSManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession deviceID](self, "deviceID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteLTKForDeviceID:", v8));
  -[SDAutoUnlockAKSSession setRemoteLTK:](self, "setRemoteLTK:", v9);

}

- (BOOL)sessionIsValid
{
  return -[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID") >= 0;
}

- (BOOL)stepSessionWithData:(id)a3 outputData:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;

  v6 = a3;
  if (!-[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid"))
    goto LABEL_5;
  if (!sub_10001F2EC(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"), v6, a4))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
    sub_10001DB10(v8);

LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v7 = 1;
LABEL_6:

  return v7;
}

- (id)generateEscrowSecret
{
  id v3;
  void *v4;

  if (-[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid"))
  {
    v3 = sub_10001F450(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)finalizeEscrowPairing:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;

  v4 = a3;
  if (-[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid"))
  {
    v5 = sub_10001F4F4(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockAKSSession remoteLTK](self, "remoteLTK"));
    sub_10001DB10(v6);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)finalizeRegistration
{
  if (-[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid"))
    return sub_10001F690(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"));
  else
    return 0;
}

- (BOOL)confirmSession
{
  _BOOL4 v3;

  v3 = -[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid");
  if (v3)
    LOBYTE(v3) = sub_10001F6FC(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"));
  return v3;
}

- (BOOL)resetSession
{
  _BOOL4 v3;
  BOOL v4;

  v3 = -[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid");
  if (v3)
  {
    v4 = sub_10001F728(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"));
    -[SDAutoUnlockAKSSession setAksSessionID:](self, "setAksSessionID:", -1);
    LOBYTE(v3) = v4;
  }
  return v3;
}

- (id)generateSessionToken
{
  id v3;
  void *v4;

  if (-[SDAutoUnlockAKSSession sessionIsValid](self, "sessionIsValid"))
  {
    v3 = sub_10001F108(-[SDAutoUnlockAKSSession aksSessionID](self, "aksSessionID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)generateACMContextData
{
  __ACMHandle *acmContext;
  __ACMHandle *v4;
  id v6;
  uint64_t v7;

  v7 = 0;
  acmContext = self->_acmContext;
  if (acmContext)
  {
    if (!sub_10001D4A8(acmContext))
    {
LABEL_5:
      acmContext = 0;
      return acmContext;
    }
    v4 = self->_acmContext;
    v6 = 0;
    sub_10001D1BC(v4, &v6, &v7);
    acmContext = (__ACMHandle *)v6;
    if (v7)
    {

      goto LABEL_5;
    }
  }
  return acmContext;
}

- (int64_t)aksSessionID
{
  return self->_aksSessionID;
}

- (void)setAksSessionID:(int64_t)a3
{
  self->_aksSessionID = a3;
}

- (BOOL)ltkNeedsFixing
{
  return self->_ltkNeedsFixing;
}

- (void)setLtkNeedsFixing:(BOOL)a3
{
  self->_ltkNeedsFixing = a3;
}

- (NSData)localLTK
{
  return self->_localLTK;
}

- (void)setLocalLTK:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)remoteLTK
{
  return self->_remoteLTK;
}

- (void)setRemoteLTK:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(int64_t)a3
{
  self->_sessionType = a3;
}

- (BOOL)originator
{
  return self->_originator;
}

- (void)setOriginator:(BOOL)a3
{
  self->_originator = a3;
}

- (NSData)escrowSecret
{
  return self->_escrowSecret;
}

- (void)setEscrowSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)usingEscrow
{
  return self->_usingEscrow;
}

- (void)setUsingEscrow:(BOOL)a3
{
  self->_usingEscrow = a3;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceID, a3);
}

- (NSData)externalACMContext
{
  return self->_externalACMContext;
}

- (void)setExternalACMContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalACMContext, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_escrowSecret, 0);
  objc_storeStrong((id *)&self->_remoteLTK, 0);
  objc_storeStrong((id *)&self->_localLTK, 0);
}

@end
