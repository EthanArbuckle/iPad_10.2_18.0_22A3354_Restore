@implementation KTAccountsSupportServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  _QWORD v16[2];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("application-identifier")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", CFSTR("com.apple.transparencyd.accounts-support")));
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) != 0)
  {
    if (qword_1002A4650 != -1)
      dispatch_once(&qword_1002A4650, &stru_100240690);
    v9 = qword_1002A4658;
    if (os_log_type_enabled((os_log_t)qword_1002A4658, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16[0] = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "accounts-support accepting new connection from %@", (uint8_t *)&v15, 0xCu);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTAccountsSupportServiceDelegate xpcQueue](self, "xpcQueue"));
    objc_msgSend(v5, "_setQueue:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAccountsSupportInterface interface](TransparencyAccountsSupportInterface, "interface"));
    objc_msgSend(v5, "setExportedInterface:", v11);

    objc_msgSend(v5, "setExportedObject:", self->_daemonContext);
    objc_msgSend(v5, "resume");
  }
  else
  {
    if (qword_1002A4650 != -1)
      dispatch_once(&qword_1002A4650, &stru_100240670);
    v12 = (void *)qword_1002A4658;
    if (os_log_type_enabled((os_log_t)qword_1002A4658, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v15 = 67109378;
      LODWORD(v16[0]) = objc_msgSend(v5, "processIdentifier");
      WORD2(v16[0]) = 2112;
      *(_QWORD *)((char *)v16 + 6) = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "accounts-support rejecting client %d/[%@] due to lack of entitlement", (uint8_t *)&v15, 0x12u);

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

- (TransparencydIDSSupportProtocol)daemonContext
{
  return (TransparencydIDSSupportProtocol *)objc_getProperty(self, a2, 16, 1);
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
