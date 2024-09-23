@implementation RPWiFiP2PTransaction

+ (id)sharedInstance
{
  if (qword_100132198 != -1)
    dispatch_once(&qword_100132198, &stru_100113770);
  return (id)qword_1001321A0;
}

- (void)activateForClient:(id)a3
{
  id v4;
  _QWORD *v5;
  RPWiFiP2PTransaction *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006FC18;
  v12[3] = &unk_100111928;
  v12[4] = self;
  v4 = a3;
  v13 = v4;
  v5 = objc_retainBlock(v12);
  v6 = self;
  objc_sync_enter(v6);
  v7 = -[NSMutableSet count](v6->_activeClients, "count");
  objc_sync_exit(v6);

  if (!v7)
  {
    v8 = -[objc_class shared](off_1001311C8(), "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006FD04;
    v10[3] = &unk_100113798;
    v10[4] = v6;
    v11 = v4;
    objc_msgSend(v9, "beginTransaction:completionHandler:", 4, v10);

  }
  ((void (*)(_QWORD *))v5[2])(v5);

}

- (void)invalidateForClient:(id)a3
{
  RPWiFiP2PTransaction *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (!-[NSMutableSet count](v4->_activeClients, "count"))
  {
LABEL_20:
    objc_sync_exit(v4);

    goto LABEL_21;
  }
  if ((-[NSMutableSet containsObject:](v4->_activeClients, "containsObject:", v7) & 1) == 0)
  {
    if (dword_100131158 <= 10
      && (dword_100131158 != -1 || _LogCategory_Initialize(&dword_100131158, 10)))
    {
      LogPrintF(&dword_100131158, "-[RPWiFiP2PTransaction invalidateForClient:]", 10, "WiFi P2P transaction invalidate failed because client '%@' is not active, current clients %@\n", v7, v4->_activeClients);
    }
    goto LABEL_20;
  }
  -[NSMutableSet removeObject:](v4->_activeClients, "removeObject:", v7);
  if (dword_100131158 <= 30 && (dword_100131158 != -1 || _LogCategory_Initialize(&dword_100131158, 30)))
    LogPrintF(&dword_100131158, "-[RPWiFiP2PTransaction invalidateForClient:]", 30, "WiFi P2P transaction invalidate for client '%@'\n", v7);
  if (-[NSMutableSet count](v4->_activeClients, "count"))
  {
    if (dword_100131158 <= 30
      && (dword_100131158 != -1 || _LogCategory_Initialize(&dword_100131158, 30)))
    {
      LogPrintF(&dword_100131158, "-[RPWiFiP2PTransaction invalidateForClient:]", 30, "WiFi P2P transacton remains active, current clients %@\n", v4->_activeClients);
    }
    goto LABEL_20;
  }
  objc_sync_exit(v4);

  v5 = -[objc_class shared](off_1001311C8(), "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "endTransaction:", 4);

  if (dword_100131158 <= 30 && (dword_100131158 != -1 || _LogCategory_Initialize(&dword_100131158, 30)))
    LogPrintF(&dword_100131158, "-[RPWiFiP2PTransaction invalidateForClient:]", 30, "WiFi P2P transaction disabled\n");
LABEL_21:

}

- (NSMutableSet)activeClients
{
  return self->_activeClients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeClients, 0);
}

@end
