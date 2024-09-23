@implementation CLPairedDeviceAppMonitor

- (CLPairedDeviceAppMonitor)initWithAppMonitor:(void *)a3 inUniverse:(id)a4
{
  CLPairedDeviceAppMonitor *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  CLIntersiloUniverse *v11;
  id v12;
  NSNotificationCenter *v13;
  NSNotificationCenter *v14;
  id v15;
  NRPairedDeviceRegistry *pairedDeviceRegistry;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  _BOOL4 v20;
  uint64_t v21;
  _BOOL4 v22;
  NSObject *v23;
  uint64_t v24;
  _BOOL4 v25;
  uint64_t v26;
  _BOOL4 v27;
  NSObject *v28;
  _QWORD v30[6];
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  os_activity_scope_state_s state;
  objc_super v36;
  id buf;
  __int16 v38;
  const char *v39;
  __int16 v40;
  _BYTE v41[10];

  v36.receiver = self;
  v36.super_class = (Class)CLPairedDeviceAppMonitor;
  v6 = -[CLPairedDeviceAppMonitor init](&v36, "init");
  if (!v6)
    return v6;
  sub_100197040();
  if (!sub_10019DF90())
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
    v17 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      buf = (id)68289026;
      v38 = 2082;
      v39 = "";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Not creating CLPairedDeviceAppMonitor because this device annot be a companion\"}", (uint8_t *)&buf, 0x12u);
    }
    goto LABEL_28;
  }
  if (!objc_opt_class(ACXDeviceConnection, v7)
    || !objc_opt_class(NRPairedDeviceRegistry, v8))
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
    v18 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_FAULT))
    {
      v20 = objc_opt_class(ACXDeviceConnection, v19) != 0;
      v22 = objc_opt_class(NRPairedDeviceRegistry, v21) != 0;
      buf = (id)68289538;
      v38 = 2082;
      v39 = "";
      v40 = 1026;
      *(_DWORD *)v41 = v20;
      *(_WORD *)&v41[4] = 1026;
      *(_DWORD *)&v41[6] = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#SuperRobin Not creating CLPairedDeviceAppMonitor because a required class is missing!?\", \"ACXDeviceConnection\":%{public}hhd, \"NRPairedDeviceRegistry\":%{public}hhd}", (uint8_t *)&buf, 0x1Eu);
      if (qword_1022A01D0 != -1)
        dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
    }
    v23 = qword_1022A01D8;
    if (os_signpost_enabled((os_log_t)qword_1022A01D8))
    {
      v25 = objc_opt_class(ACXDeviceConnection, v24) != 0;
      v27 = objc_opt_class(NRPairedDeviceRegistry, v26) != 0;
      buf = (id)68289538;
      v38 = 2082;
      v39 = "";
      v40 = 1026;
      *(_DWORD *)v41 = v25;
      *(_WORD *)&v41[4] = 1026;
      *(_DWORD *)&v41[6] = v27;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#SuperRobin Not creating CLPairedDeviceAppMonitor because a required class is missing!?", "{\"msg%{public}.0s\":\"#SuperRobin Not creating CLPairedDeviceAppMonitor because a required class is missing!?\", \"ACXDeviceConnection\":%{public}hhd, \"NRPairedDeviceRegistry\":%{public}hhd}", (uint8_t *)&buf, 0x1Eu);
    }
    goto LABEL_28;
  }
  if ((objc_opt_respondsToSelector(+[ACXDeviceConnection sharedDeviceConnection](ACXDeviceConnection, "sharedDeviceConnection"), "applicationIsInstalledOnAnyPairedDeviceWithCompanionBundleID:completion:") & 1) == 0)
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
    v28 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      buf = (id)68289026;
      v38 = 2082;
      v39 = "";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Not creating CLPairedDeviceAppMonitor because AppConduit lacks the features we need\"}", (uint8_t *)&buf, 0x12u);
    }
LABEL_28:

    return 0;
  }
  v9 = _os_activity_create((void *)&_mh_execute_header, "CL: #SuperRobin Starting CLPairedDeviceAppMonitor", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v9, &state);

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
  v10 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    buf = (id)68289282;
    v38 = 2082;
    v39 = "";
    v40 = 2082;
    *(_QWORD *)v41 = "activity";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Starting CLPairedDeviceAppMonitor\", \"event\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
  }
  v6->_appMonitor = a3;
  v11 = (CLIntersiloUniverse *)a4;
  v6->_universe = v11;
  objc_msgSend(-[CLIntersiloUniverse silo](v11, "silo"), "assertInside");
  v6->_pairedDeviceIds = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  v6->_pairedDeviceRegistry = +[NRPairedDeviceRegistry sharedInstance](NRPairedDeviceRegistry, "sharedInstance");
  v12 = objc_alloc_init((Class)NSOperationQueue);
  objc_msgSend(v12, "setName:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p.CLPairedDeviceAppMonitor.queue"), v6));
  objc_msgSend(v12, "setUnderlyingQueue:", objc_msgSend(-[CLIntersiloUniverse silo](v6->_universe, "silo"), "queue"));
  objc_initWeak(&buf, v6);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_101143280;
  v33[3] = &unk_1021A2870;
  objc_copyWeak(&v34, &buf);
  v33[4] = v6;
  v13 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  v6->_unpairNotificationRegistrationToken = -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](v13, "addObserverForName:object:queue:usingBlock:", NRPairedDeviceRegistryDeviceDidUnpairNotification, v6->_pairedDeviceRegistry, v12, v33);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10114345C;
  v31[3] = &unk_1021A2870;
  objc_copyWeak(&v32, &buf);
  v31[4] = v6;
  v14 = +[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter");
  v6->_pairNotificationRegistrationToken = -[NSNotificationCenter addObserverForName:object:queue:usingBlock:](v14, "addObserverForName:object:queue:usingBlock:", NRPairedDeviceRegistryDeviceDidPairNotification, v6->_pairedDeviceRegistry, v12, v31);
  v15 = -[CLIntersiloUniverse silo](v6->_universe, "silo");
  pairedDeviceRegistry = v6->_pairedDeviceRegistry;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_101143638;
  v30[3] = &unk_1021A2898;
  v30[4] = v15;
  v30[5] = v6;
  -[NRPairedDeviceRegistry getDevicesWithBlock:](pairedDeviceRegistry, "getDevicesWithBlock:", v30);
  v6->_valid = 1;
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&buf);
  os_activity_scope_leave(&state);
  return v6;
}

- (void)dealloc
{
  CLPairedDeviceAppMonitor *v2;
  SEL v3;
  objc_super v4;

  if (self->_valid)
  {
    v2 = (CLPairedDeviceAppMonitor *)sub_101940CC4();
    -[CLPairedDeviceAppMonitor invalidate](v2, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)CLPairedDeviceAppMonitor;
    -[CLPairedDeviceAppMonitor dealloc](&v4, "dealloc");
  }
}

- (void)invalidate
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
  v3 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Shutting down CLPairedDeviceAppMonitor\"}", (uint8_t *)v4, 0x12u);
  }
  self->_valid = 0;
  self->_appMonitor = 0;
  objc_msgSend(-[CLIntersiloUniverse silo](self->_universe, "silo"), "assertInside");

  self->_universe = 0;
  self->_pairedDeviceIds = 0;
  -[ACXDeviceConnection removeObserver:](self->_deviceConnection, "removeObserver:", self);

  self->_deviceConnection = 0;
  self->_pairedDeviceRegistry = 0;
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self->_unpairNotificationRegistrationToken);

  self->_unpairNotificationRegistrationToken = 0;
  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self->_pairNotificationRegistrationToken);

  self->_pairNotificationRegistrationToken = 0;
}

- (void)handlePairToDeviceWithPairingID:(id)a3
{
  uint64_t *v3;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  ACXDeviceConnection *v10;
  os_activity_scope_state_s v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;

  v6 = objc_msgSend(-[CLIntersiloUniverse silo](self->_universe, "silo"), "assertInside");
  if (self->_valid)
  {
    v7 = _os_activity_create((void *)&_mh_execute_header, "CL: #SuperRobin Pair detected", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v7, &v11);

    v3 = &qword_1022A0000;
    if (qword_1022A01D0 == -1)
      goto LABEL_3;
  }
  else
  {
    sub_101940E2C(v6);
    __break(1u);
  }
  dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
LABEL_3:
  v8 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2082;
    v17 = "activity";
    v18 = 2114;
    v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Pair detected\", \"event\":%{public, location:escape_only}s, \"pairingID\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  if (!self->_deviceConnection)
  {
    if (v3[58] != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Subscribing to ACXDeviceConnection\"}", buf, 0x12u);
    }
    v10 = (ACXDeviceConnection *)+[ACXDeviceConnection sharedDeviceConnection](ACXDeviceConnection, "sharedDeviceConnection");
    self->_deviceConnection = v10;
    -[ACXDeviceConnection addObserver:](v10, "addObserver:", self);
  }
  -[NSMutableSet addObject:](self->_pairedDeviceIds, "addObject:", a3);
  os_activity_scope_leave(&v11);
}

- (void)handleUnpairFromDeviceWithPairingID:(id)a3
{
  uint64_t *v3;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;

  v6 = objc_msgSend(-[CLIntersiloUniverse silo](self->_universe, "silo"), "assertInside");
  if (self->_valid)
  {
    v7 = _os_activity_create((void *)&_mh_execute_header, "CL: #SuperRobin Unpair detected", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v7, &v10);

    v3 = &qword_1022A0000;
    if (qword_1022A01D0 == -1)
      goto LABEL_3;
  }
  else
  {
    sub_101940F9C(v6);
    __break(1u);
  }
  dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
LABEL_3:
  v8 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289538;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2082;
    v16 = "activity";
    v17 = 2114;
    v18 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Unpair detected\", \"event\":%{public, location:escape_only}s, \"pairingID\":%{public, location:escape_only}@}", buf, 0x26u);
  }
  -[NSMutableSet removeObject:](self->_pairedDeviceIds, "removeObject:", a3);
  if (!-[NSMutableSet count](self->_pairedDeviceIds, "count"))
  {
    if (v3[58] != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Unsubscribing from ACXDeviceConnection\"}", buf, 0x12u);
    }
    -[ACXDeviceConnection removeObserver:](self->_deviceConnection, "removeObserver:", self);

    self->_deviceConnection = 0;
  }
  os_activity_scope_leave(&v10);
}

- (void)isAppInstalled:(id)a3 completion:(id)a4
{
  ACXDeviceConnection *deviceConnection;
  id v5;
  NSObject *v6;
  void **v7;
  uint64_t v8;
  id v12;
  NSObject *v13;
  id v14;
  _QWORD v15[11];
  os_activity_scope_state_s state;
  _QWORD v17[8];
  uint64_t buf;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;

  v12 = objc_msgSend(-[CLIntersiloUniverse silo](self->_universe, "silo"), "assertInside");
  if (!self->_valid)
  {
    sub_10194110C(v12);
    __break(1u);
LABEL_9:
    dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
    goto LABEL_4;
  }
  deviceConnection = self->_deviceConnection;
  if (!deviceConnection)
  {
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
    return;
  }
  v5 = -[CLIntersiloUniverse silo](self->_universe, "silo");
  v7 = _NSConcreteStackBlock;
  v17[0] = _NSConcreteStackBlock;
  v8 = 3221225472;
  v17[1] = 3221225472;
  v17[2] = sub_1011440F8;
  v17[3] = &unk_1021A28C0;
  v17[4] = a3;
  v17[5] = v5;
  v17[6] = self;
  v17[7] = a4;
  v6 = _os_activity_create((void *)&_mh_execute_header, "CL: #SuperRobin Checking if app is installed", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &state);
  if (qword_1022A01D0 != -1)
    goto LABEL_9;
LABEL_4:
  v13 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(a3, "UTF8String");
    buf = 68289282;
    v19 = 2082;
    v20 = "";
    v21 = 2082;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Checking if app is installed\", \"clientKey\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
  }
  v15[0] = v7;
  v15[1] = v8;
  v15[2] = sub_101144534;
  v15[3] = &unk_1021A2960;
  v15[4] = v5;
  v15[5] = self;
  v15[9] = v17;
  v15[10] = a4;
  v15[6] = v6;
  v15[7] = deviceConnection;
  v15[8] = a3;
  -[ACXDeviceConnection applicationIsInstalledOnAnyPairedDeviceWithBundleID:completion:](deviceConnection, "applicationIsInstalledOnAnyPairedDeviceWithBundleID:completion:", a3, v15);
  os_activity_scope_leave(&state);
}

- (void)computeAllowableAuthorizationMaskForApplication:(id)a3 pairingID:(id)a4
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  unint64_t v12;
  char v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;

  v7 = -[CLPairedDeviceAppMonitor getLocationUsageDescriptionKeys:](self, "getLocationUsageDescriptionKeys:");
  if (objc_msgSend(v7, "count"))
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_101144B48;
    v21[3] = &unk_1021A2988;
    v21[4] = v7;
    v8 = sub_1001AC3FC(2, (uint64_t)v21);
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
    v9 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_msgSend(a3, "companionAppBundleID");
      if (!v10)
        v10 = objc_msgSend(a3, "bundleIdentifier");
      *(_DWORD *)buf = 68289794;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2050;
      v27 = (id)v8;
      v28 = 2114;
      v29 = (uint64_t)a4;
      v30 = 2114;
      v31 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SuperRobin Determined intermediate mask\", \"intermediateMask\":%{public}lu, \"pairingID\":%{public, location:escape_only}@, \"clientKey\":%{public, location:escape_only}@}", buf, 0x30u);
    }
  }
  else
  {
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
    v11 = qword_1022A01D8;
    if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289538;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2082;
      v27 = objc_msgSend(objc_msgSend(a3, "bundleIdentifier"), "UTF8String");
      v28 = 2114;
      v29 = (uint64_t)a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin location usage description key-values are not found\", \"bundleId\":%{public, location:escape_only}s, \"pairingID\":%{public, location:escape_only}@}", buf, 0x26u);
    }
    v8 = 1;
  }
  v12 = (unint64_t)sub_101141938(objc_msgSend(a3, "companionAppBundleID"));
  if (!v13)
    goto LABEL_20;
  v14 = (id)v12;
  v8 |= v12;
  if (qword_1022A01D0 != -1)
    dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
  v15 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
  {
    v16 = objc_msgSend(a3, "companionAppBundleID");
    if (!v16)
      v16 = objc_msgSend(a3, "bundleIdentifier");
    *(_DWORD *)buf = 68289538;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2050;
    v27 = v14;
    v28 = 2114;
    v29 = (uint64_t)v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SuperRobin Determined companion mask\", \"companionMask\":%{public}lu, \"clientKey\":%{public, location:escape_only}@}", buf, 0x26u);
LABEL_20:
    if (qword_1022A01D0 != -1)
      dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
  }
  v17 = qword_1022A01D8;
  if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_msgSend(a3, "companionAppBundleID");
    if (!v18)
      v18 = objc_msgSend(a3, "bundleIdentifier");
    *(_DWORD *)buf = 68289538;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2114;
    v27 = v18;
    v28 = 2050;
    v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#SuperRobin Determined allowable service mask for app\", \"clientKey\":%{public, location:escape_only}@, \"mask\":%{public}lu}", buf, 0x26u);
  }
  v19 = objc_msgSend(-[CLIntersiloUniverse vendor](self->_universe, "vendor"), "proxyForService:", CFSTR("CLClientManager"));
  v20 = objc_msgSend(a3, "companionAppBundleID");
  if (!v20)
    v20 = objc_msgSend(a3, "bundleIdentifier");
  objc_msgSend(v19, "setAllowableAuthorizationMask:forClientKey:", v8, v20);
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v7;
  _QWORD v8[7];

  objc_msgSend(-[CLIntersiloUniverse silo](self->_universe, "silo"), "assertOutside");
  v7 = -[CLIntersiloUniverse silo](self->_universe, "silo");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101144BF0;
  v8[3] = &unk_10212BBA8;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a3;
  objc_msgSend(v7, "async:", v8);
}

- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v7;
  _QWORD v8[7];

  objc_msgSend(-[CLIntersiloUniverse silo](self->_universe, "silo"), "assertOutside");
  v7 = -[CLIntersiloUniverse silo](self->_universe, "silo");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101144E00;
  v8[3] = &unk_10212BBA8;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a3;
  objc_msgSend(v7, "async:", v8);
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  id v7;
  _QWORD v8[7];

  objc_msgSend(-[CLIntersiloUniverse silo](self->_universe, "silo"), "assertOutside");
  v7 = -[CLIntersiloUniverse silo](self->_universe, "silo");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_101145090;
  v8[3] = &unk_10212BBA8;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a3;
  objc_msgSend(v7, "async:", v8);
}

- (id)getLocationUsageDescriptionKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  __int128 v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];

  v20 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = objc_msgSend(a3, "localizedInfoPlistStrings");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  if (qword_10230CDA8 != -1)
    dispatch_once(&qword_10230CDA8, &stru_1021A2B58);
  v5 = (void *)qword_10230CDA0;
  v6 = objc_msgSend((id)qword_10230CDA0, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v22;
    *(_QWORD *)&v7 = 68289538;
    v19 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v10);
        v12 = objc_msgSend(v4, "objectForKey:", v11, v19);
        if (v12)
        {
          v13 = objc_msgSend(v12, "objectForKey:", &stru_1021D8FB8);
          if (v13)
          {
            v14 = v13;
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v13, v11);
            if (qword_1022A01D0 != -1)
              dispatch_once(&qword_1022A01D0, &stru_1021A2C00);
            v15 = qword_1022A01D8;
            if (os_log_type_enabled((os_log_t)qword_1022A01D8, OS_LOG_TYPE_DEBUG))
            {
              v16 = objc_msgSend(v11, "UTF8String");
              v17 = objc_msgSend(v14, "UTF8String");
              *(_DWORD *)buf = v19;
              v26 = 0;
              v27 = 2082;
              v28 = "";
              v29 = 2082;
              v30 = v16;
              v31 = 2082;
              v32 = v17;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#SuperRobin Found Location usage description in Info.plist for Remote application\", \"key\":%{public, location:escape_only}s, \"value\":%{public, location:escape_only}s}", buf, 0x26u);
            }
          }
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v8);
  }
  return v20;
}

- (void)appMonitor
{
  return self->_appMonitor;
}

- (void)setAppMonitor:(void *)a3
{
  self->_appMonitor = a3;
}

- (CLIntersiloUniverse)universe
{
  return self->_universe;
}

- (void)setUniverse:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (ACXDeviceConnection)deviceConnection
{
  return self->_deviceConnection;
}

- (void)setDeviceConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NRPairedDeviceRegistry)pairedDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (void)setPairedDeviceRegistry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSObject)unpairNotificationRegistrationToken
{
  return self->_unpairNotificationRegistrationToken;
}

- (void)setUnpairNotificationRegistrationToken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSObject)pairNotificationRegistrationToken
{
  return self->_pairNotificationRegistrationToken;
}

- (void)setPairNotificationRegistrationToken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (NSMutableSet)pairedDeviceIds
{
  return self->_pairedDeviceIds;
}

- (void)setPairedDeviceIds:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
