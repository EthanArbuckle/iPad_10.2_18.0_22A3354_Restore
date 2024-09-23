@implementation Keybag

+ (BOOL)afterFirstUserUnlock
{
  int v2;
  int v3;
  BOOL result;
  NSObject *v5;
  _BOOL4 v6;
  _DWORD v7[2];

  v2 = MKBDeviceUnlockedSinceBoot(a1, a2);
  v3 = v2;
  if ((v2 & 0x80000000) == 0)
    return v2 == 1;
  if (qword_100417ED8 != -1)
    dispatch_once(&qword_100417ED8, &stru_100407CF0);
  v5 = qword_100417EE0;
  v6 = os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v6)
  {
    v7[0] = 67109120;
    v7[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Couldn't get unlocked since boot state.  result: %d", (uint8_t *)v7, 8u);
    return 0;
  }
  return result;
}

+ (BOOL)canRunWhenLocked
{
  BOOL v2;
  _BYTE v4[16];
  void *__p;
  char v6;
  void *v7[2];
  char v8;

  sub_10016E1D4((uint64_t)v4);
  sub_100023300((uint64_t)v4, (uint64_t)&__p, (uint64_t)v7);
  if (v8 < 0)
  {
    v2 = v7[1] != (void *)1 || *(_BYTE *)v7[0] != 65;
    operator delete(v7[0]);
    if (v6 < 0)
      goto LABEL_12;
    return v2;
  }
  if (v8 != 1)
  {
    v2 = 1;
    if (v6 < 0)
      goto LABEL_12;
    return v2;
  }
  v2 = LOBYTE(v7[0]) != 65;
  if ((v6 & 0x80000000) == 0)
    return v2;
LABEL_12:
  operator delete(__p);
  return v2;
}

+ (BOOL)isLocked
{
  return MKBGetDeviceLockState(0, a2) - 1 < 2;
}

+ (BOOL)supportsMultiUser
{
  if (qword_10041A8D8 != -1)
    dispatch_once(&qword_10041A8D8, &stru_100407CD0);
  return byte_10041A8D2;
}

- (Keybag)init
{
  -[Keybag doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (Keybag)initWithDelegate:(id)a3
{
  id v4;
  Keybag *v5;
  Keybag *v6;
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  char v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *q;
  const char *v14;
  NSObject *v15;
  uint8_t *v16;
  uint32_t v17;
  NSObject *v18;
  Keybag *v19;
  id v21;
  id location;
  objc_super v23;
  uint8_t buf[8];
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)Keybag;
  v5 = -[Keybag init](&v23, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_delegate, v4);
    v8 = MKBDeviceFormattedForContentProtection(v7);
    v9 = v8;
    if (!v8)
    {
      v11 = 0;
LABEL_9:
      v6->_formattedWithProtection = v11;
      v12 = dispatch_queue_create("com.apple.indoor.keybag", 0);
      q = v6->_q;
      v6->_q = (OS_dispatch_queue *)v12;

      objc_initWeak(&location, v6);
      objc_copyWeak(&v21, &location);
      v14 = (const char *)objc_msgSend(objc_retainAutorelease(kMobileKeyBagLockStatusNotification), "UTF8String");
      v15 = v6->_q;
      *(_QWORD *)buf = _NSConcreteStackBlock;
      v25 = 3321888768;
      v26 = sub_10033FBD0;
      v27 = &unk_100407D10;
      objc_copyWeak(&v28, &v21);
      v16 = objc_retainBlock(buf);
      objc_destroyWeak(&v28);
      v17 = notify_register_dispatch(v14, &v6->_keybagToken, v15, v16);

      if (!v17)
      {
LABEL_14:
        -[Keybag onQueueUpdateDelegate](v6, "onQueueUpdateDelegate");
        v19 = v6;
        objc_destroyWeak(&v21);
        objc_destroyWeak(&location);
        goto LABEL_15;
      }
      if (qword_100417ED8 == -1)
      {
        v18 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
        {
LABEL_13:
          v6->_keybagToken = 0;
          goto LABEL_14;
        }
      }
      else
      {
        dispatch_once(&qword_100417ED8, &stru_100407CF0);
        v18 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
          goto LABEL_13;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to register for lock state notification change: %u", buf, 8u);
      goto LABEL_13;
    }
    if (v8 != 1)
    {
      if (qword_100417ED8 != -1)
      {
        dispatch_once(&qword_100417ED8, &stru_100407CF0);
        v10 = qword_100417EE0;
        if (!os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
          goto LABEL_7;
        goto LABEL_6;
      }
      v10 = qword_100417EE0;
      if (os_log_type_enabled((os_log_t)qword_100417EE0, OS_LOG_TYPE_ERROR))
      {
LABEL_6:
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Bad response for formatted for content protection: %d", buf, 8u);
      }
    }
LABEL_7:
    v11 = 1;
    goto LABEL_9;
  }
LABEL_15:

  return v6;
}

- (void)dealloc
{
  int keybagToken;
  objc_super v4;

  keybagToken = self->_keybagToken;
  if (keybagToken)
    notify_cancel(keybagToken);
  v4.receiver = self;
  v4.super_class = (Class)Keybag;
  -[Keybag dealloc](&v4, "dealloc");
}

- (void)onQueueUpdateDelegate
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (+[Keybag isLocked](Keybag, "isLocked"))
    objc_msgSend(WeakRetained, "keybagDidLock");
  else
    objc_msgSend(WeakRetained, "keybagDidUnlock");

}

- (KeybagDelegate)delegate
{
  return (KeybagDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_q, 0);
}

@end
