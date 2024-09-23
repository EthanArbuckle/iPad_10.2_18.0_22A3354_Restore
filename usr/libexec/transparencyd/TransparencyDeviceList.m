@implementation TransparencyDeviceList

- (TransparencyDeviceList)init
{
  TransparencyDeviceList *v2;
  TransparencyDeviceList *v3;
  TransparencyDeviceList *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransparencyDeviceList;
  v2 = -[TransparencyDeviceList init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[TransparencyDeviceList setLock:](v2, "setLock:", 0);
    v4 = v3;
  }

  return v3;
}

- (id)_authController
{
  AKAppleIDAuthenticationController *authController;
  AKAppleIDAuthenticationController *v4;
  AKAppleIDAuthenticationController *v5;

  authController = self->_authController;
  if (!authController)
  {
    v4 = (AKAppleIDAuthenticationController *)objc_alloc_init((Class)AKAppleIDAuthenticationController);
    v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }
  return authController;
}

- (NSArray)devices
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyDeviceList cachedDevices](self, "cachedDevices"));
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)updateDevicesList:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v10);
        v12 = objc_alloc((Class)KTIDMSDevice);
        v13 = objc_msgSend(v12, "initWithAKRemoteDevice:", v11, (_QWORD)v15);
        if (v13)
          objc_msgSend(v5, "addObject:", v13);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  os_unfair_lock_lock(&self->_lock);
  -[TransparencyDeviceList setCachedDevices:](self, "setCachedDevices:", v5);
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (void)refreshDeviceList:(id)a3 complete:(id)a4
{
  id v6;
  uint64_t v7;
  void (**v8)(id, _QWORD, uint64_t);
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  void (**v19)(id, _QWORD, uint64_t);
  uint8_t buf[16];

  v6 = a3;
  v8 = (void (**)(id, _QWORD, uint64_t))a4;
  if (!v6)
  {
    v14 = objc_claimAutoreleasedReturnValue(+[NSError aa_errorWithCode:underlyingError:](NSError, "aa_errorWithCode:underlyingError:", -3, 0));
LABEL_13:
    v11 = (void *)v14;
    v8[2](v8, 0, v14);
    goto LABEL_25;
  }
  if (!objc_opt_class(AKDeviceListRequestContext, v7)
    || !objc_opt_class(AKAppleIDAuthenticationController, v9))
  {
    if (qword_1002A7A78 != -1)
      dispatch_once(&qword_1002A7A78, &stru_10024B4A8);
    v13 = qword_1002A7A80;
    if (os_log_type_enabled((os_log_t)qword_1002A7A80, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "AuthKit not available", buf, 2u);
    }
    v14 = objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -333, CFSTR("AuthKit not available")));
    goto LABEL_13;
  }
  v10 = objc_alloc_init((Class)AKDeviceListRequestContext);
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setAltDSID:", v6);
    v12 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
    if (v12)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10018AC64;
      v18[3] = &unk_10024B510;
      v18[4] = self;
      v19 = v8;
      objc_msgSend(v12, "deviceListWithContext:completion:", v11, v18);

    }
    else
    {
      if (qword_1002A7A78 != -1)
        dispatch_once(&qword_1002A7A78, &stru_10024B4E8);
      v16 = qword_1002A7A80;
      if (os_log_type_enabled((os_log_t)qword_1002A7A80, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "AKAppleIDAuthenticationController not available", buf, 2u);
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -335, CFSTR("can't get authController")));
      v8[2](v8, 0, (uint64_t)v17);

    }
  }
  else
  {
    if (qword_1002A7A78 != -1)
      dispatch_once(&qword_1002A7A78, &stru_10024B4C8);
    v15 = qword_1002A7A80;
    if (os_log_type_enabled((os_log_t)qword_1002A7A80, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "AKDeviceListRequestContext not available", buf, 2u);
    }
    v12 = (id)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -334, CFSTR("can't get AKDeviceListRequestContextClass")));
    v8[2](v8, 0, (uint64_t)v12);
  }

LABEL_25:
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSArray)cachedDevices
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDevices, 0);
  objc_storeStrong((id *)&self->_authController, 0);
}

@end
