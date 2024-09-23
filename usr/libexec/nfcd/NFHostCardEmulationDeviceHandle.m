@implementation NFHostCardEmulationDeviceHandle

- (id)readAPDU
{
  return -[NFHostCardEmulationDeviceHandle readApduAndReturnError:](self, "readApduAndReturnError:", 0);
}

- (id)readApduAndReturnError:(id *)a3
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;

  v3 = (_QWORD *)sub_10018539C(self->_driver, (uint64_t)self->_devHandle, a3);
  v4 = v3;
  if (v3 && v3[1])
    v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", *v3, v3[1]);
  else
    v5 = 0;
  NFDataRelease(v4);
  return v5;
}

- (void)readAPDUWithCompletion:(id)a3
{
  id v4;
  void *devHandle;
  NFDriverWrapper *driver;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  driver = self->_driver;
  devHandle = self->_devHandle;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100139708;
  v8[3] = &unk_1002E8AB8;
  v9 = v4;
  v7 = v4;
  sub_100185770(driver, (uint64_t)devHandle, v8);

}

- (BOOL)sendAPDU:(id)a3
{
  NFDriverWrapper *driver;
  void *devHandle;
  id v7;
  id v8;
  id v9;
  char v10;
  void *specific;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *Name;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;

  driver = self->_driver;
  devHandle = self->_devHandle;
  v7 = objc_retainAutorelease(a3);
  v8 = objc_msgSend(v7, "bytes");
  v9 = objc_msgSend(v7, "length");

  v10 = sub_100186034(driver, (uint64_t)devHandle, (uint64_t)v8, (uint64_t)v9);
  if ((v10 & 1) == 0)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v17 = 45;
      if (isMetaClass)
        v17 = 43;
      v13(3, "%c[%{public}s %{public}s]:%i Failed to initiate send of data", v17, ClassName, Name, 53);
    }
    v18 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v19 = NFSharedLogGetLogger(v18);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(self);
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      *(_DWORD *)buf = 67109890;
      v26 = v22;
      v27 = 2082;
      v28 = object_getClassName(self);
      v29 = 2082;
      v30 = sel_getName(a2);
      v31 = 1024;
      v32 = 53;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to initiate send of data", buf, 0x22u);
    }

  }
  return v10;
}

- (void)restartDiscovery
{
  sub_1001FBF60(self->_driver);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_driver, 0);
}

@end
