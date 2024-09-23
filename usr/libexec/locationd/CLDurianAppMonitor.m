@implementation CLDurianAppMonitor

- (void)processMonitor:(id)a3 didProvideUpdate:(id)a4 forProcessHandle:(id)a5
{
  id v6;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  v6 = objc_msgSend(objc_msgSend(a4, "state", a3), "taskState");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC0E8);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289282;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2082;
    v12 = objc_msgSend((id)NSStringFromRBSTaskState(v6), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #monitor app\", \"update\":%{public, location:escape_only}s}", (uint8_t *)v8, 0x1Cu);
  }
  if ((v6 & 0xFFFFFFFD) == 1)
  {
    if (-[CLDurianAppMonitor findMyAppDidBackgroundOrExitHandler](self, "findMyAppDidBackgroundOrExitHandler"))
      (*((void (**)(void))-[CLDurianAppMonitor findMyAppDidBackgroundOrExitHandler](self, "findMyAppDidBackgroundOrExitHandler")+ 2))();
  }
}

- (CLDurianAppMonitor)initWithQueue:(id)a3
{
  CLDurianAppMonitor *v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLDurianAppMonitor;
  v4 = -[CLDurianAppMonitor init](&v7, "init");
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)a3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1014D9430;
    v6[3] = &unk_1021BC0C8;
    v6[4] = v4;
    v4->_processMonitor = +[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", v6);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianAppMonitor;
  -[CLDurianAppMonitor dealloc](&v3, "dealloc");
}

- (id)findMyAppDidBackgroundOrExitHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setFindMyAppDidBackgroundOrExitHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

@end
