@implementation CLHidEventManager

- (CLHidEventManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5 type:(int64_t)a6
{
  CLHidEventManager *v10;
  HIDEventSystemClient *v11;
  NSMutableArray *v12;
  HIDEventSystemClient *manager;
  NSObject *v14;
  id v15;
  uint64_t v17;
  id v18;
  const char *v19;
  uint8_t *v20;
  _QWORD v21[5];
  objc_super v22;
  int v23;
  id v24;
  uint8_t buf[4];
  id v26;

  v22.receiver = self;
  v22.super_class = (Class)CLHidEventManager;
  v10 = -[CLHidEventManager init](&v22, "init");
  if (v10)
  {
    v11 = (HIDEventSystemClient *)objc_msgSend(objc_alloc((Class)HIDEventSystemClient), "initWithType:", a6);
    v10->_delegateQueue = (OS_dispatch_queue *)a4;
    v10->_manager = v11;
    v10->_delegate = (CLHidEventManagerDelegate *)a3;
    v12 = objc_opt_new(NSMutableArray);
    v10->_matching = v12;
    -[NSMutableArray addObject:](v12, "addObject:", a5);
    -[HIDEventSystemClient setMatching:](v10->_manager, "setMatching:", v10->_matching);
    -[HIDEventSystemClient setDispatchQueue:](v10->_manager, "setDispatchQueue:", -[CLHidEventManager delegateQueue](v10, "delegateQueue"));
    manager = v10->_manager;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1012212B0;
    v21[3] = &unk_1021A9860;
    v21[4] = v10;
    -[HIDEventSystemClient setEventHandler:](manager, "setEventHandler:", v21);
    -[HIDEventSystemClient activate](v10->_manager, "activate");
    if (qword_10229FC70 != -1)
      dispatch_once(&qword_10229FC70, &stru_1021A9880);
    v14 = qword_10229FC78;
    if (os_log_type_enabled((os_log_t)qword_10229FC78, OS_LOG_TYPE_DEBUG))
    {
      v15 = -[HIDEventSystemClient services](v10->_manager, "services");
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[CLHidManager] enumerated these devices: %@", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FC70 != -1)
        dispatch_once(&qword_10229FC70, &stru_1021A9880);
      v17 = qword_10229FC78;
      v18 = -[HIDEventSystemClient services](v10->_manager, "services");
      v23 = 138412290;
      v24 = v18;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v17, 2, "[CLHidManager] enumerated these devices: %@", &v23, 12);
      v20 = (uint8_t *)v19;
      sub_100512490("Generic", 1, 0, 2, "-[CLHidEventManager initWithDelegate:queue:matching:type:]", "%s\n", v19);
      if (v20 != buf)
        free(v20);
    }
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[HIDEventSystemClient cancel](self->_manager, "cancel");

  -[NSMutableArray removeAllObjects](self->_matching, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)CLHidEventManager;
  -[CLHidEventManager dealloc](&v3, "dealloc");
}

- (CLHidEventManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLHidEventManagerDelegate *)a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HIDEventSystemClient)manager
{
  return self->_manager;
}

- (NSMutableArray)matching
{
  return self->_matching;
}

- (void)setMatching:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
