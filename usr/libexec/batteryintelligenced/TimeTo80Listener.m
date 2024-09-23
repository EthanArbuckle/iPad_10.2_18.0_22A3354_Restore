@implementation TimeTo80Listener

+ (id)sharedInstance
{
  if (qword_1000352E0 != -1)
    dispatch_once(&qword_1000352E0, &stru_10002CB08);
  return (id)qword_1000352D8;
}

- (TimeTo80Listener)init
{
  TimeTo80Listener *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *collectionQueue;
  void *v10;
  TimeTo80Listener *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TimeTo80Listener;
  v2 = -[TimeTo80Listener init](&v13, "init");
  if (v2)
  {
    v3 = sub_10001714C("TimeTo80Listener");
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)qword_1000352E8;
    qword_1000352E8 = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("com.apple.batteryintelligence.collectionqueue", v7);
    collectionQueue = v2->_collectionQueue;
    v2->_collectionQueue = (OS_dispatch_queue *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BatteryIntelligenceNotificationManager sharedInstance](BatteryIntelligenceNotificationManager, "sharedInstance"));
    v11 = v2;

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10002005C();
  }

  return v2;
}

- (void)setupConnectionListenerForTT80
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD *v21;
  uint32_t v22;
  NSObject *v23;
  _QWORD handler[4];
  id v25;
  uint64_t *v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint8_t buf[4];
  int v33;

  v3 = (void *)os_transaction_create("com.apple.batteryintelligenced.tt80.setuplistener", a2);
  v4 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = (void *)qword_1000352F0;
  qword_1000352F0 = v4;

  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v31 = sub_100019000();
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000190B0;
  v27[3] = &unk_10002CB30;
  v27[4] = &v28;
  v6 = objc_retainBlock(v27);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000352F0, "objectForKey:", CFSTR("LastConnectedState")));
  if (v7
    && ((v8 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v7, v8) & 1) == 0)
     || (v9 = objc_msgSend(v7, "unsignedIntValue"), v9 == *((unsigned __int8 *)v29 + 24))))
  {
    v10 = qword_1000352E8;
    if (os_log_type_enabled((os_log_t)qword_1000352E8, OS_LOG_TYPE_INFO))
    {
      v11 = *((unsigned __int8 *)v29 + 24);
      *(_DWORD *)buf = 67109120;
      v33 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Connected state %u unchanged", buf, 8u);
    }
  }
  else
  {
    v12 = qword_1000352E8;
    if (os_log_type_enabled((os_log_t)qword_1000352E8, OS_LOG_TYPE_DEBUG))
      sub_100020124(v12, v13, v14, v15, v16, v17, v18, v19);
    ((void (*)(_QWORD *, _QWORD))v6[2])(v6, *((unsigned __int8 *)v29 + 24));
  }
  *(_DWORD *)buf = 0;
  v20 = objc_claimAutoreleasedReturnValue(-[TimeTo80Listener collectionQueue](self, "collectionQueue"));
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001924C;
  handler[3] = &unk_10002CB58;
  v26 = &v28;
  v21 = v6;
  v25 = v21;
  v22 = notify_register_dispatch("com.apple.system.powersources.source", (int *)buf, v20, handler);

  if (v22)
  {
    v23 = qword_1000352E8;
    if (os_log_type_enabled((os_log_t)qword_1000352E8, OS_LOG_TYPE_ERROR))
      sub_10002009C(v22, v23);
  }

  _Block_object_dispose(&v28, 8);
}

- (void)runTT80ModelwithParams:(id)a3 andSetupNextAlarm:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[TimeTo80Listener collectionQueue](self, "collectionQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100019400;
  v9[3] = &unk_10002CB80;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, v9);

}

- (OS_dispatch_queue)collectionQueue
{
  return self->_collectionQueue;
}

- (void)setCollectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_collectionQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionQueue, 0);
}

@end
