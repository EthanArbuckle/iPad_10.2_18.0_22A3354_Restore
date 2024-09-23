@implementation _NFLoyaltyAndPaymentSession

+ (id)validateEntitlements:(id)a3
{
  void *specific;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  const char *Name;
  _QWORD v26[4];
  _QWORD v27[4];
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;

  if ((objc_msgSend(a3, "cardModeAccess") & 1) != 0)
    return 0;
  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(a1);
    Name = sel_getName(a2);
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(3, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", v12, ClassName, Name, 33);
  }
  v13 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v14 = NFSharedLogGetLogger(v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = object_getClass(a1);
    if (class_isMetaClass(v16))
      v17 = 43;
    else
      v17 = 45;
    *(_DWORD *)buf = 67109890;
    v29 = v17;
    v30 = 2082;
    v31 = object_getClassName(a1);
    v32 = 2082;
    v33 = sel_getName(a2);
    v34 = 1024;
    v35 = 33;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid entitlements, requiring card access", buf, 0x22u);
  }

  v18 = objc_alloc((Class)NSError);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "nfcd"));
  v26[0] = NSLocalizedDescriptionKey;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Not entitled"));
  v27[0] = v20;
  v27[1] = &off_100300A58;
  v26[1] = CFSTR("Line");
  v26[2] = CFSTR("Method");
  v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v27[2] = v21;
  v26[3] = NSDebugDescriptionErrorKey;
  v22 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 34);
  v27[3] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 4));
  v24 = objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, 32, v23);

  return v24;
}

- (_NFLoyaltyAndPaymentSession)initWithRemoteObject:(id)a3 workQueue:(id)a4 expressModeManager:(id)a5 allowsBackgroundMode:(BOOL)a6
{
  char *v6;
  id v7;
  void *v8;
  NFLoyaltyAgent *v9;
  void *v10;
  NFHostCardEmulationManager *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_NFLoyaltyAndPaymentSession;
  v6 = -[_NFContactlessPaymentSession initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:hostCardEmulationSupport:](&v14, "initWithRemoteObject:workQueue:expressModeManager:allowsBackgroundMode:hostCardEmulationSupport:", a3, a4, a5, a6, 1);
  if (v6)
  {
    v7 = objc_alloc_init((Class)NSMutableArray);
    v8 = *(void **)(v6 + 387);
    *(_QWORD *)(v6 + 387) = v7;

    v9 = objc_alloc_init(NFLoyaltyAgent);
    v10 = *(void **)(v6 + 371);
    *(_QWORD *)(v6 + 371) = v9;

    v11 = objc_alloc_init(NFHostCardEmulationManager);
    v12 = *(void **)(v6 + 379);
    *(_QWORD *)(v6 + 379) = v11;

  }
  return (_NFLoyaltyAndPaymentSession *)v6;
}

- (void)didEndSession:(id)a3
{
  id v4;
  _BYTE *v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  v4 = a3;
  if (!-[_NFSession didEnd](self, "didEnd"))
  {
    v5 = *(NFLoyaltyAgent **)((char *)&self->_loyaltyAgent + 3);
    if (v5 && v5[25])
    {
      sub_10003A418(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[_NFHardwareManager sharedHardwareManager](_NFHardwareManager, "sharedHardwareManager"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NFRoutingConfig routingOff](NFRoutingConfig, "routingOff"));
      v8 = objc_msgSend(v6, "setRoutingConfig:", v7);

      v5 = *(NFLoyaltyAgent **)((char *)&self->_loyaltyAgent + 3);
    }
    if (sub_10003A764(v5, self))
      sub_10003A7E0(*(void **)((char *)&self->_loyaltyAgent + 3), self);
  }
  v9.receiver = self;
  v9.super_class = (Class)_NFLoyaltyAndPaymentSession;
  -[_NFContactlessPaymentSession didEndSession:](&v9, "didEndSession:", v4);

}

- (BOOL)useFilteredApplets
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *specific;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession connection](self, "connection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "NF_whitelistChecker"));

  v6 = objc_msgSend(v5, "useUnfilteredApplets");
  if (v6)
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v9(6, "%c[%{public}s %{public}s]:%i Using unfiltered applets!", v13, ClassName, Name, 76);
    }
    v14 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v15 = NFSharedLogGetLogger(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = object_getClass(self);
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      *(_DWORD *)buf = 67109890;
      v22 = v18;
      v23 = 2082;
      v24 = object_getClassName(self);
      v25 = 2082;
      v26 = sel_getName(a2);
      v27 = 1024;
      v28 = 76;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Using unfiltered applets!", buf, 0x22u);
    }

  }
  return v6 ^ 1;
}

- (void)setHostCards:(id)a3
{
  id v5;
  OS_dispatch_queue *v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  SEL v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_NFLoyaltyAndPaymentSession;
  v6 = -[_NFSession workQueue](&v12, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue(v6);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100190B60;
  block[3] = &unk_1002E5C80;
  v10 = v5;
  v11 = a2;
  block[4] = self;
  v8 = v5;
  dispatch_async(v7, block);

}

- (id)hostCardEmulationLog
{
  void *specific;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  id *v16;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  Logger = NFLogGetLogger(specific);
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 100);
  }
  v11 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v12 = NFSharedLogGetLogger(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = object_getClass(self);
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    *(_DWORD *)buf = 67109890;
    v20 = v15;
    v21 = 2082;
    v22 = object_getClassName(self);
    v23 = 2082;
    v24 = sel_getName(a2);
    v25 = 1024;
    v26 = 100;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
  }

  v16 = sub_10003AAE8(*(id **)((char *)&self->_loyaltyAgent + 3));
  return (id)objc_claimAutoreleasedReturnValue(v16);
}

- (void)supportPayment:(BOOL)a3
{
  objc_msgSend(*(id *)(&self->_emulationActive + 3), "supportPayment:", a3);
}

- (BOOL)readyForVAS
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->_emulationActive + 3), "hostCards"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)handleSelect:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->_emulationActive + 3), "handleSelect:", a3));
  if (v4)
  {
    objc_msgSend(*(id *)((char *)&self->_hceManager + 3), "removeAllObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v5, "didSelectValueAddedService:", 1);

  }
  return v4;
}

- (id)handleAPDU:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->_emulationActive + 3), "handleAPDU:", a3));
  if ((objc_msgSend(*(id *)(&self->_emulationActive + 3), "isComplete") & 1) != 0
    || objc_msgSend(*(id *)(&self->_emulationActive + 3), "hasError"))
  {
    v5 = *(NFHostCardEmulationManager **)((char *)&self->_hceManager + 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(&self->_emulationActive + 3), "getTransactionEvent"));
    objc_msgSend(v5, "addObject:", v6);

  }
  return v4;
}

- (void)handleDeselect
{
  void *v3;

  if (objc_msgSend(*(id *)((char *)&self->_hceManager + 3), "count"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[_NFXPCSession remoteObject](self, "remoteObject"));
    objc_msgSend(v3, "didPerformValueAddedServiceTransactions:", *(NFHostCardEmulationManager **)((char *)&self->_hceManager + 3));

  }
  objc_msgSend(*(id *)(&self->_emulationActive + 3), "handleDeselect");
}

- (void)handleHostCardReaderDetected:(id)a3
{
  void *v4;
  id v5;

  v4 = *(NFLoyaltyAgent **)((char *)&self->_loyaltyAgent + 3);
  v5 = a3;
  if ((sub_10003A764(v4, self) & 1) == 0)
    sub_10003A6D8(*(void **)((char *)&self->_loyaltyAgent + 3), self);
  sub_10003AC8C(*(void **)((char *)&self->_loyaltyAgent + 3), v5, -[_NFContactlessPaymentSession readyForPayment](self, "readyForPayment"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_hceManager + 3), 0);
  objc_storeStrong((id *)((char *)&self->_loyaltyAgent + 3), 0);
  objc_storeStrong((id *)(&self->_emulationActive + 3), 0);
}

@end
