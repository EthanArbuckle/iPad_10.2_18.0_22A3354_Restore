@implementation SDAutoUnlockLocalDeviceController

- (SDAutoUnlockLocalDeviceController)init
{
  return -[SDAutoUnlockLocalDeviceController initWithQueue:](self, "initWithQueue:", &_dispatch_main_q);
}

- (SDAutoUnlockLocalDeviceController)initWithQueue:(id)a3
{
  id v5;
  SDAutoUnlockLocalDeviceController *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  BKDevicePearl *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  BKDevicePearl *pearlDevice;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *queue;
  _QWORD v28[4];
  id v29;
  int out_token;
  id location;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];

  v5 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SDAutoUnlockLocalDeviceController;
  v6 = -[SDAutoUnlockLocalDeviceController init](&v37, "init");
  objc_storeStrong((id *)&v6->_queue, a3);
  if (SFDeviceSupportsAutoUnlock())
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[BKDeviceManager availableDevices](BKDeviceManager, "availableDevices"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v32 = 0;
          v12 = (BKDevicePearl *)objc_claimAutoreleasedReturnValue(+[BKDevice deviceWithDescriptor:error:](BKDevice, "deviceWithDescriptor:error:", v11, &v32));
          v13 = v32;
          v15 = objc_opt_class(BKDevicePearl, v14);
          if ((objc_opt_isKindOfClass(v12, v15) & 1) != 0)
          {
            pearlDevice = v6->_pearlDevice;
            v6->_pearlDevice = v12;

            goto LABEL_12;
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

    if (!v6->_pearlDevice)
    {
      v18 = auto_unlock_log(v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_1000194A4((uint64_t)v7, v19, v20, v21, v22, v23, v24, v25);

    }
    location = 0;
    objc_initWeak(&location, v6);
    out_token = 0;
    queue = v6->_queue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100018F9C;
    v28[3] = &unk_100714590;
    objc_copyWeak(&v29, &location);
    notify_register_dispatch("com.apple.BiometricKit.lockoutStateChanged", &out_token, queue, v28);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  return v6;
}

- (BOOL)faceIDEnabled
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  BOOL v7;
  BKDevicePearl *pearlDevice;
  void *v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("phoneAutoUnlockSkipFaceID"));
  if ((_DWORD)v4)
  {
    v5 = auto_unlock_log(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Skipping FaceID check due to default phoneAutoUnlockSkipFaceID", buf, 2u);
    }
    v7 = 1;
  }
  else
  {
    pearlDevice = self->_pearlDevice;
    v21 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKDevicePearl identitiesWithError:](pearlDevice, "identitiesWithError:", &v21));
    v10 = v21;
    v6 = v10;
    if (v10)
      v11 = 1;
    else
      v11 = v9 == 0;
    if (v11)
    {
      v12 = auto_unlock_log(v10);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_100019508((uint64_t)v6, v13, v14, v15, v16, v17, v18, v19);

      v7 = 0;
    }
    else
    {
      v7 = objc_msgSend(v9, "count") != 0;
    }

  }
  return v7;
}

- (BOOL)supportsPeriocular
{
  BKDevicePearl *pearlDevice;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  id v16;

  pearlDevice = self->_pearlDevice;
  v16 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKDevicePearl supportsPeriocularEnrollmentWithError:](pearlDevice, "supportsPeriocularEnrollmentWithError:", &v16));
  v4 = v16;
  v5 = v4;
  if (v4)
  {
    v6 = auto_unlock_log(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10001956C((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

  }
  v14 = objc_msgSend(v3, "BOOLValue");

  return v14;
}

- (void)lockWithBioLockOut
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[16];

  v3 = auto_unlock_log(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Locking current device and forcing bio lockout", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLocalDeviceController pearlDevice](self, "pearlDevice"));
  v10 = 0;
  objc_msgSend(v5, "forceBioLockoutForUser:error:", getuid(), &v10);
  v6 = v10;

  if (v6)
  {
    v8 = auto_unlock_log(v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000195D0(v9);

  }
  -[SDAutoUnlockLocalDeviceController lockDevice](self, "lockDevice");
}

- (void)lockDevice
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = auto_unlock_log(self);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Locking current device", v4, 2u);
  }

  sub_100195904();
}

- (void)deviceUnlockedWithMask:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  _DWORD v7[2];

  v3 = a3;
  v5 = auto_unlock_log(self);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stored last unlocked with mask: %d", (uint8_t *)v7, 8u);
  }

  -[SDAutoUnlockLocalDeviceController setLastUnlockUsedMask:](self, "setLastUnlockUsedMask:", v3);
}

- (BOOL)shouldPrewarmAttempt
{
  return -[SDAutoUnlockLocalDeviceController lastUnlockUsedMask](self, "lastUnlockUsedMask");
}

- (void)handleBioLockoutStateChanged:(unint64_t)a3
{
  void *v4;
  void (**v5)(void);

  if (a3 == 3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLocalDeviceController deviceEnteredBioLockoutHandler](self, "deviceEnteredBioLockoutHandler"));

    if (v4)
    {
      v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SDAutoUnlockLocalDeviceController deviceEnteredBioLockoutHandler](self, "deviceEnteredBioLockoutHandler"));
      v5[2]();

    }
  }
}

- (id)deviceEnteredBioLockoutHandler
{
  return self->_deviceEnteredBioLockoutHandler;
}

- (void)setDeviceEnteredBioLockoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)wakeGestureDates
{
  return self->_wakeGestureDates;
}

- (void)setWakeGestureDates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BKDevicePearl)pearlDevice
{
  return self->_pearlDevice;
}

- (BOOL)lastUnlockUsedMask
{
  return self->_lastUnlockUsedMask;
}

- (void)setLastUnlockUsedMask:(BOOL)a3
{
  self->_lastUnlockUsedMask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pearlDevice, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wakeGestureDates, 0);
  objc_storeStrong(&self->_deviceEnteredBioLockoutHandler, 0);
}

@end
