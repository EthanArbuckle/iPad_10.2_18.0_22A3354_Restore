@implementation MainServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  _BYTE v17[14];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("application-identifier")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.transparency.kt")));
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) != 0)
  {
    if (qword_1002A4650 != -1)
      dispatch_once(&qword_1002A4650, &stru_100240610);
    v9 = (void *)qword_1002A4658;
    if (os_log_type_enabled((os_log_t)qword_1002A4658, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      v16 = 138412546;
      *(_QWORD *)v17 = v6;
      *(_WORD *)&v17[8] = 1024;
      *(_DWORD *)&v17[10] = objc_msgSend(v5, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "transparency accepting new connection from: %@[%d]", (uint8_t *)&v16, 0x12u);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MainServiceDelegate xpcQueue](self, "xpcQueue"));
    objc_msgSend(v5, "_setQueue:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyXPCInterface interface](TransparencyXPCInterface, "interface"));
    objc_msgSend(v5, "setExportedInterface:", v12);

    objc_msgSend(v5, "setExportedObject:", self->_daemonContext);
    objc_msgSend(v5, "resume");
  }
  else
  {
    if (qword_1002A4650 != -1)
      dispatch_once(&qword_1002A4650, &stru_1002405F0);
    v13 = (void *)qword_1002A4658;
    if (os_log_type_enabled((os_log_t)qword_1002A4658, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      v16 = 67109378;
      *(_DWORD *)v17 = objc_msgSend(v5, "processIdentifier");
      *(_WORD *)&v17[4] = 2112;
      *(_QWORD *)&v17[6] = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "transparency rejecting client %d/[%@] due to lack of entitlement", (uint8_t *)&v16, 0x12u);

    }
  }

  return v8;
}

- (OS_dispatch_workloop)xpcQueue
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (transparencyd)daemonContext
{
  return (transparencyd *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDaemonContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonContext, 0);
  objc_storeStrong((id *)&self->_xpcQueue, 0);
}

@end
