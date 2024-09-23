@implementation RDServer

+ (id)sharedServer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000080B4;
  block[3] = &unk_1000D0DE0;
  block[4] = a1;
  if (qword_1000DFF98 != -1)
    dispatch_once(&qword_1000DFF98, block);
  return (id)qword_1000DFF90;
}

+ (id)sharedXPCInterface
{
  if (qword_1000DFFA8 != -1)
    dispatch_once(&qword_1000DFFA8, &stru_1000D0E20);
  return (id)qword_1000DFFA0;
}

+ (id)sharedBubbleXPCInterface
{
  if (qword_1000DFFB8 != -1)
    dispatch_once(&qword_1000DFFB8, &stru_1000D0E40);
  return (id)qword_1000DFFB0;
}

- (RDServer)init
{
  RDServer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pidsToClients;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RDServer;
  v2 = -[RDServer init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    pidsToClients = v2->_pidsToClients;
    v2->_pidsToClients = v3;

  }
  return v2;
}

- (BOOL)remoteProcessHasBooleanEntitlement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", v3));

  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = 0;

  return v7;
}

- (void)addClient:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RDServer *v9;

  v4 = a3;
  v5 = qword_1000E0320;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008348;
  v7[3] = &unk_1000D0E68;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeClient:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RDServer *v9;

  v4 = a3;
  v5 = qword_1000E0320;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008480;
  v7[3] = &unk_1000D0E68;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)addBubbleClient:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RDServer *v9;

  v4 = a3;
  v5 = qword_1000E0320;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008714;
  v7[3] = &unk_1000D0E68;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeBubbleClient:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RDServer *v9;

  v4 = a3;
  v5 = qword_1000E0320;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000884C;
  v7[3] = &unk_1000D0E68;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_clientForPID:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (!v6)
    NSLog(CFSTR("We do not have a client for pid: %d"), v3);
  return v6;
}

- (void)_enumerateClientsWithBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned __int8 v16;
  _BYTE v17[128];

  v4 = (void (**)(id, void *, _BYTE *))a3;
  v16 = 0;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12));
      v4[2](v4, v10, &v16);
      v11 = v16;

      if (v11)
        break;
      if (v7 == (id)++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)criticalStakeHolder
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  v4 = 0;
  if (v3)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      v7 = v4;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v6), (_QWORD)v9));

        if ((objc_msgSend(v4, "criticalStakeHolder") & 1) != 0)
        {
          v4 = v4;
          v3 = v4;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
        v7 = v4;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)bubbleStakeHolder
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  v4 = 0;
  if (v3)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      v7 = v4;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v6), (_QWORD)v9));

        if ((objc_msgSend(v4, "bubbleStakeHolder") & 1) != 0)
        {
          v4 = v4;
          v3 = v4;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
        v7 = v4;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)registerUserSwitchStakeholderForPID:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  v7 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008DB8;
  block[3] = &unk_1000D0E90;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)registerCriticalUserSwitchStakeholderForPID:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  v7 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009138;
  block[3] = &unk_1000D0E90;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)registerBubblePopStakeholderForPID:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  v7 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000095D4;
  block[3] = &unk_1000D0E90;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (BOOL)anyBubblePopClients
{
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
LABEL_3:
    v7 = 0;
    v8 = v5;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7), (_QWORD)v11));

      v9 = objc_msgSend(v5, "bubblePopstakeholderIsRegistered");
      if ((v9 & 1) != 0)
        break;
      v7 = (char *)v7 + 1;
      v8 = v5;
      if (v4 == v7)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)inLogoutProcess
{
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  char *v6;
  uint64_t v8;
  int v9;
  unsigned int v10;

  if (qword_1000DFFD8 != -1)
    dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
  v3 = (id)qword_1000DFFD0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 0;
    LODWORD(v4) = sub_100007750(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      v4 = v4;
    else
      v4 = v4 & 0xFFFFFFFE;
    if ((_DWORD)v4)
    {
      v5 = v3;
      v9 = 67109120;
      v10 = -[RDServer switchState](self, "switchState");
      v6 = (char *)_os_log_send_and_compose_impl(v4, &v8, 0, 0);

      if (v6)
        sub_100007780(v6);
    }
    else
    {
      v6 = 0;
    }
    free(v6);
  }

  return -[RDServer switchState](self, "switchState") != 0;
}

- (void)registerUserSyncStakeholderForPID:(int)a3 machServiceName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a4;
  v9 = a5;
  v10 = qword_1000E0320;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009C64;
  v13[3] = &unk_1000D0EB8;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)unregisterStakeholderForPID:(int)a3 status:(unint64_t)a4 reason:(id)a5 completionHandler:(id)a6
{
  _QWORD block[6];
  int v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A13C;
  block[3] = &unk_1000D0EE0;
  v7 = a3;
  block[4] = self;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)qword_1000E0320, block);
}

- (id)_allowlistedPreferencesKeys
{
  if (qword_1000DFFC8 != -1)
    dispatch_once(&qword_1000DFFC8, &stru_1000D0F00);
  return (id)qword_1000DFFC0;
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 pid:(int)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  int v31;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A854;
  block[3] = &unk_1000D0F28;
  v31 = a7;
  block[4] = self;
  v26 = v14;
  v27 = v17;
  v28 = v15;
  v29 = v16;
  v30 = v18;
  v20 = v16;
  v21 = v15;
  v22 = v17;
  v23 = v18;
  v24 = v14;
  dispatch_async(v19, block);

}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 pid:(int)a6 completionHandler:(id)a7
{
  -[RDServer switchToUser:passcodeData:context:preferences:pid:completionHandler:](self, "switchToUser:passcodeData:context:preferences:pid:completionHandler:", a3, a4, a5, 0, *(_QWORD *)&a6, a7);
}

- (void)switchToLoginUserWithPID:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  v7 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B29C;
  block[3] = &unk_1000D0E90;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)logoutToLoginSessionWithPID:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  v7 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B7FC;
  block[3] = &unk_1000D0E90;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 pid:(int)a7 completionHandler:(id)a8
{
  uint64_t v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  unsigned int v20;
  uint64_t v21;
  const char *v22;
  char *v23;
  uint64_t v24;

  v9 = *(_QWORD *)&a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (qword_1000DFFD8 != -1)
    dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
  v19 = (id)qword_1000DFFD0;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 0;
    v20 = sub_100007750(1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      v21 = v20;
    else
      v21 = v20 & 0xFFFFFFFE;
    if ((_DWORD)v21)
    {
      v22 = (const char *)_os_log_send_and_compose_impl(v21, &v24, 0, 0);
      v23 = (char *)v22;
      if (v22)
        sub_100007780(v22);
    }
    else
    {
      v23 = 0;
    }
    free(v23);
  }

  -[RDServer switchToUser:passcodeData:context:preferences:pid:completionHandler:](self, "switchToUser:passcodeData:context:preferences:pid:completionHandler:", v14, v15, v16, v17, v9, v18);
}

- (BOOL)inLoginSession
{
  int v2;
  NSObject *v3;
  unsigned int v4;
  uint64_t v5;
  const char *v6;
  char *v7;
  NSObject *v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  const char *v12;
  char *v13;
  uint64_t v15;
  int v16;
  int v17;

  v2 = dword_1000E02C8;
  if (qword_1000DFFD8 != -1)
    dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
  v3 = (id)qword_1000DFFD0;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 0;
    v4 = sub_100007750(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      v5 = v4;
    else
      v5 = v4 & 0xFFFFFFFE;
    if ((_DWORD)v5)
    {
      v16 = 67109120;
      v17 = v2;
      v6 = (const char *)_os_log_send_and_compose_impl(v5, &v15, 0, 0);
      v7 = (char *)v6;
      if (v6)
        sub_100007780(v6);
    }
    else
    {
      v7 = 0;
    }
    free(v7);
  }

  if (v2 == 1)
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v8 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v9 = sub_100007750(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        v10 = v9;
      else
        v10 = v9 & 0xFFFFFFFE;
      if ((_DWORD)v10)
      {
        v16 = 67109120;
        v17 = 1;
        goto LABEL_29;
      }
      goto LABEL_31;
    }
  }
  else
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v8 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v11 = sub_100007750(1);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        v10 = v11;
      else
        v10 = v11 & 0xFFFFFFFE;
      if ((_DWORD)v10)
      {
        v16 = 67109120;
        v17 = v2;
LABEL_29:
        v12 = (const char *)_os_log_send_and_compose_impl(v10, &v15, 0, 0);
        v13 = (char *)v12;
        if (v12)
          sub_100007780(v12);
        goto LABEL_32;
      }
LABEL_31:
      v13 = 0;
LABEL_32:
      free(v13);
    }
  }

  return v2 == 1;
}

- (void)loginComplete
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C338;
  block[3] = &unk_1000D0F50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)qword_1000E0320, block);
}

- (void)loginUICheckinForPID:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  v7 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C5D4;
  block[3] = &unk_1000D0E90;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)terminateSyncBubbleForPID:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  v7 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CDC8;
  block[3] = &unk_1000D0E90;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)resumeSyncBubbleForPID:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  v7 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D198;
  block[3] = &unk_1000D0E90;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)fetchMachServiceNameswithPID:(int)a3 WithUID:(unsigned int)a4 WithCompletionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  int v13;
  unsigned int v14;

  v8 = a5;
  v9 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D3EC;
  block[3] = &unk_1000D0F78;
  v13 = a3;
  v14 = a4;
  block[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, block);

}

- (void)removeMachServiceName:(id)a3 withPID:(int)a4 WithUID:(unsigned int)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  int v13;
  unsigned int v14;

  v8 = a3;
  v9 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D6DC;
  block[3] = &unk_1000D0FA0;
  v13 = a4;
  v14 = a5;
  block[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(v9, block);

}

- (void)StopBubbleWithPID:(int)a3 WithUID:(unsigned int)a4 WithStatus:(unint64_t)a5
{
  _QWORD block[6];
  unsigned int v6;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D868;
  block[3] = &unk_1000D0EE0;
  v6 = a4;
  block[4] = self;
  block[5] = a5;
  dispatch_async((dispatch_queue_t)qword_1000E0320, block);
}

- (void)_broadcastBubbleDidPop
{
  -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", &stru_1000D0FE0);
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4
{
  const __CFDictionary *v6;
  __CFString **v7;
  NSObject *v8;
  unsigned int v9;
  uint64_t v10;
  const char *v11;
  char *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  char *v18;
  NSObject *v19;
  void *v20;
  char v21;
  const void *Value;
  const __CFData *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  CFIndex Length;
  char *v28;
  NSObject *v29;
  unsigned int v30;
  uint64_t v31;
  const char *v32;
  char *v33;
  NSObject *v34;
  unsigned int v35;
  uint64_t v36;
  unsigned int v37;
  const char *v38;
  char *v39;
  NSObject *v40;
  unsigned int v41;
  uint64_t v42;
  const char *v43;
  char *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  char *v50;
  dispatch_source_t v51;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  char *v56;
  NSObject *v57;
  dispatch_time_t v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  int v64;
  NSObject *v65;
  unsigned int v66;
  uint64_t v67;
  const char *v68;
  char *v69;
  int v70;
  _BYTE *v71;
  _BYTE *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  _QWORD v76[4];
  const __CFDictionary *v77;
  RDServer *v78;
  _QWORD handler[5];
  _QWORD v80[2];
  _BYTE v81[24];

  v6 = (const __CFDictionary *)a3;
  v75 = a4;
  -[RDServer setUserToSwitchTo:](self, "setUserToSwitchTo:", v6);
  -[RDServer setSwitchState:](self, "setSwitchState:", 1);
  if (qword_1000DFFD8 != -1)
    dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
  v7 = &kUMUserSessionShortNameKey;
  v8 = (id)qword_1000DFFD0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)v81 = 0;
    v9 = sub_100007750(1);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v10 = v9;
    else
      v10 = v9 & 0xFFFFFFFE;
    if ((_DWORD)v10)
    {
      LOWORD(v80[0]) = 0;
      LODWORD(v73) = 2;
      v71 = v80;
      v11 = (const char *)_os_log_send_and_compose_impl(v10, v81, 0, 0);
      v12 = (char *)v11;
      if (v11)
        sub_100007780(v11);
    }
    else
    {
      v12 = 0;
    }
    free(v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
  if (v13)
  {
    if (qword_1000DFFE8 != -1)
      dispatch_once(&qword_1000DFFE8, &stru_1000D1250);
    v14 = (id)qword_1000DFFE0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v80[0] = 0;
      LODWORD(v15) = sub_100007750(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        v15 = v15;
      else
        v15 = v15 & 0xFFFFFFFE;
      if ((_DWORD)v15)
      {
        v16 = v14;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
        *(_DWORD *)v81 = 134217984;
        *(_QWORD *)&v81[4] = v17;
        LODWORD(v73) = 12;
        v71 = v81;
        v18 = (char *)_os_log_send_and_compose_impl(v15, v80, 0, 0);

        if (v18)
          sub_100007780(v18);
      }
      else
      {
        v18 = 0;
      }
      free(v18);
    }

    v19 = objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
    dispatch_source_cancel(v19);

    -[RDServer setFastLogoutTimer:](self, "setFastLogoutTimer:", 0);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients", v71, v73));
  if (objc_msgSend(v20, "count"))
  {
    v21 = _os_feature_enabled_impl("UserManagement", "LocalUserEnrollment");

    if ((v21 & 1) == 0)
      goto LABEL_91;
  }
  else
  {

  }
  -[RDServer setSwitchState:](self, "setSwitchState:", 2);
  if (CFDictionaryContainsKey(v6, CFSTR("UserSwitchTaskOpqueData")))
  {
    Value = CFDictionaryGetValue(v6, CFSTR("UserSwitchTaskOpqueData"));
    v23 = (const __CFData *)CFRetain(Value);
    CFDictionaryRemoveValue(v6, CFSTR("UserSwitchTaskOpqueData"));
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v24 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v80[0] = 0;
      LODWORD(v25) = sub_100007750(1);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        v25 = v25;
      else
        v25 = v25 & 0xFFFFFFFE;
      if ((_DWORD)v25)
      {
        v26 = v24;
        Length = CFDataGetLength(v23);
        *(_DWORD *)v81 = 134217984;
        *(_QWORD *)&v81[4] = Length;
        LODWORD(v74) = 12;
        v72 = v81;
        v28 = (char *)_os_log_send_and_compose_impl(v25, v80, 0, 0);

        if (v28)
          sub_100007780(v28);
      }
      else
      {
        v28 = 0;
      }
      free(v28);
    }

  }
  else
  {
    v23 = 0;
  }
  if (byte_1000E0312)
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v29 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v81 = 0;
      v30 = sub_100007750(1);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        v31 = v30;
      else
        v31 = v30 & 0xFFFFFFFE;
      if ((_DWORD)v31)
      {
        LOWORD(v80[0]) = 0;
        LODWORD(v74) = 2;
        v72 = v80;
        v32 = (const char *)_os_log_send_and_compose_impl(v31, v81, 0, 0);
        v33 = (char *)v32;
        if (v32)
          sub_100007780(v32);
      }
      else
      {
        v33 = 0;
      }
      free(v33);
    }

    if (sub_10002C7F0(v6, (uint64_t)v75))
    {
      if (qword_1000DFFD8 != -1)
        dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
      v34 = (id)qword_1000DFFD0;
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        goto LABEL_78;
      *(_QWORD *)v81 = 0;
      v35 = sub_100007750(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        v36 = v35;
      else
        v36 = v35 & 0xFFFFFFFE;
      if ((_DWORD)v36)
      {
        LOWORD(v80[0]) = 0;
        LODWORD(v74) = 2;
        v72 = v80;
        goto LABEL_74;
      }
    }
    else
    {
      if (qword_1000DFFD8 != -1)
        dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
      v34 = (id)qword_1000DFFD0;
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        goto LABEL_78;
      *(_QWORD *)v81 = 0;
      v37 = sub_100007750(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        v36 = v37;
      else
        v36 = v37 & 0xFFFFFFFE;
      if ((_DWORD)v36)
      {
        LOWORD(v80[0]) = 0;
        LODWORD(v74) = 2;
        v72 = v80;
LABEL_74:
        v38 = (const char *)_os_log_send_and_compose_impl(v36, v81, 0, 0);
        v39 = (char *)v38;
        if (v38)
          sub_100007780(v38);
        goto LABEL_77;
      }
    }
    v39 = 0;
LABEL_77:
    free(v39);
LABEL_78:

  }
  if (qword_1000DFFD8 != -1)
    dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
  v40 = (id)qword_1000DFFD0;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)v81 = 0;
    v41 = sub_100007750(1);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      v42 = v41;
    else
      v42 = v41 & 0xFFFFFFFE;
    if ((_DWORD)v42)
    {
      LOWORD(v80[0]) = 0;
      LODWORD(v74) = 2;
      v72 = v80;
      v43 = (const char *)_os_log_send_and_compose_impl(v42, v81, 0, 0);
      v44 = (char *)v43;
      if (v43)
        sub_100007780(v43);
    }
    else
    {
      v44 = 0;
    }
    free(v44);
  }

  sub_1000329B8(v6, v23);
LABEL_91:
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer", v72, v74));

  if (v45)
  {
    if (qword_1000DFFE8 != -1)
      dispatch_once(&qword_1000DFFE8, &stru_1000D1250);
    v46 = (id)qword_1000DFFE0;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v80[0] = 0;
      LODWORD(v47) = sub_100007750(0);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        v47 = v47;
      else
        v47 = v47 & 0xFFFFFFFE;
      if ((_DWORD)v47)
      {
        v48 = v46;
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
        *(_DWORD *)v81 = 134217984;
        *(_QWORD *)&v81[4] = v49;
        v50 = (char *)_os_log_send_and_compose_impl(v47, v80, 0, 0);

        if (v50)
          sub_100007780(v50);
        v7 = &kUMUserSessionShortNameKey;
      }
      else
      {
        v50 = 0;
      }
      free(v50);
    }
  }
  else
  {
    v51 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_1000E0320);
    -[RDServer setLogoutTimer:](self, "setLogoutTimer:", v51);

    if (qword_1000DFFE8 != -1)
      dispatch_once(&qword_1000DFFE8, &stru_1000D1250);
    v52 = (id)qword_1000DFFE0;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      v80[0] = 0;
      LODWORD(v53) = sub_100007750(0);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        v53 = v53;
      else
        v53 = v53 & 0xFFFFFFFE;
      if ((_DWORD)v53)
      {
        v54 = v52;
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
        *(_DWORD *)v81 = 134217984;
        *(_QWORD *)&v81[4] = v55;
        v56 = (char *)_os_log_send_and_compose_impl(v53, v80, 0, 0);

        if (v56)
          sub_100007780(v56);
        v7 = &kUMUserSessionShortNameKey;
      }
      else
      {
        v56 = 0;
      }
      free(v56);
    }

    v57 = objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
    v58 = dispatch_time(0, 360000000000);
    dispatch_source_set_timer(v57, v58, 0xFFFFFFFFFFFFFFFFLL, 0);

    v59 = objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000E61C;
    handler[3] = &unk_1000D0F50;
    handler[4] = self;
    dispatch_source_set_event_handler(v59, handler);

    v46 = objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
    dispatch_activate(v46);
  }

  v60 = sub_10001BE1C(qword_1000E0318);
  v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
  if (sub_10001CA60((uint64_t)v61))
  {
    v62 = sub_10001BE1C(qword_1000E0318);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    if (sub_10001CAE4((uint64_t)v63) == 502)
    {

LABEL_131:
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472;
      v76[2] = sub_10000E99C;
      v76[3] = &unk_1000D1008;
      v77 = v6;
      v78 = self;
      -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", v76);

      goto LABEL_135;
    }
    v70 = dword_1000E02C8;

    if (v70 != 1)
      goto LABEL_131;
  }
  else
  {
    v64 = dword_1000E02C8;

    if (v64 != 1)
      goto LABEL_131;
  }
  if (qword_1000DFFD8 != -1)
    dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
  v65 = v7[506];
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)v81 = 0;
    v66 = sub_100007750(1);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
      v67 = v66;
    else
      v67 = v66 & 0xFFFFFFFE;
    if ((_DWORD)v67)
    {
      LOWORD(v80[0]) = 0;
      v68 = (const char *)_os_log_send_and_compose_impl(v67, v81, 0, 0);
      v69 = (char *)v68;
      if (v68)
        sub_100007780(v68);
    }
    else
    {
      v69 = 0;
    }
    free(v69);
  }

  -[RDServer _reallySwitchUser:](self, "_reallySwitchUser:", 0);
LABEL_135:

}

- (void)switchToUser:(id)a3
{
  -[RDServer switchToUser:passcodeData:](self, "switchToUser:passcodeData:", a3, 0);
}

- (BOOL)LogoutToUser:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  uint64_t v7;
  const char *v8;
  char *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  char *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  char *v24;
  NSObject *v25;
  unsigned int v26;
  uint64_t v27;
  const char *v28;
  char *v29;
  dispatch_source_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  char *v35;
  NSObject *v36;
  unsigned int v37;
  uint64_t v38;
  const char *v39;
  char *v40;
  NSObject *v41;
  dispatch_time_t v42;
  NSObject *v43;
  _BYTE *v45;
  uint64_t v46;
  _QWORD v47[4];
  id v48;
  RDServer *v49;
  _QWORD handler[5];
  _QWORD v51[2];
  _BYTE v52[24];

  v4 = a3;
  -[RDServer setUserToSwitchTo:](self, "setUserToSwitchTo:", 0);
  -[RDServer setSwitchState:](self, "setSwitchState:", 1);
  if (qword_1000DFFD8 != -1)
    dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
  v5 = (id)qword_1000DFFD0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)v52 = 0;
    v6 = sub_100007750(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      v7 = v6;
    else
      v7 = v6 & 0xFFFFFFFE;
    if ((_DWORD)v7)
    {
      LOWORD(v51[0]) = 0;
      LODWORD(v46) = 2;
      v45 = v51;
      v8 = (const char *)_os_log_send_and_compose_impl(v7, v52, 0, 0);
      v9 = (char *)v8;
      if (v8)
        sub_100007780(v8);
    }
    else
    {
      v9 = 0;
    }
    free(v9);
  }

  dword_1000E02C8 = 3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));

  if (v10)
  {
    if (qword_1000DFFE8 != -1)
      dispatch_once(&qword_1000DFFE8, &stru_1000D1250);
    v11 = (id)qword_1000DFFE0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v51[0] = 0;
      LODWORD(v12) = sub_100007750(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        v12 = v12;
      else
        v12 = v12 & 0xFFFFFFFE;
      if ((_DWORD)v12)
      {
        v13 = v11;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
        *(_DWORD *)v52 = 134217984;
        *(_QWORD *)&v52[4] = v14;
        LODWORD(v46) = 12;
        v45 = v52;
        v15 = (char *)_os_log_send_and_compose_impl(v12, v51, 0, 0);

        if (v15)
          sub_100007780(v15);
      }
      else
      {
        v15 = 0;
      }
      free(v15);
    }

    v16 = objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
    dispatch_source_cancel(v16);

    -[RDServer setFastLogoutTimer:](self, "setFastLogoutTimer:", 0);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer pidsToClients](self, "pidsToClients", v45, v46));
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));

    if (v19)
    {
      if (qword_1000DFFE8 != -1)
        dispatch_once(&qword_1000DFFE8, &stru_1000D1250);
      v20 = (id)qword_1000DFFE0;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v51[0] = 0;
        LODWORD(v21) = sub_100007750(0);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          v21 = v21;
        else
          v21 = v21 & 0xFFFFFFFE;
        if ((_DWORD)v21)
        {
          v22 = v20;
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
          *(_DWORD *)v52 = 134217984;
          *(_QWORD *)&v52[4] = v23;
          v24 = (char *)_os_log_send_and_compose_impl(v21, v51, 0, 0);

          if (v24)
            sub_100007780(v24);
        }
        else
        {
          v24 = 0;
        }
        free(v24);
      }
    }
    else
    {
      v30 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_1000E0320);
      -[RDServer setLogoutTimer:](self, "setLogoutTimer:", v30);

      if (qword_1000DFFE8 != -1)
        dispatch_once(&qword_1000DFFE8, &stru_1000D1250);
      v31 = (id)qword_1000DFFE0;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v51[0] = 0;
        LODWORD(v32) = sub_100007750(0);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          v32 = v32;
        else
          v32 = v32 & 0xFFFFFFFE;
        if ((_DWORD)v32)
        {
          v33 = v31;
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
          *(_DWORD *)v52 = 134217984;
          *(_QWORD *)&v52[4] = v34;
          v35 = (char *)_os_log_send_and_compose_impl(v32, v51, 0, 0);

          if (v35)
            sub_100007780(v35);
        }
        else
        {
          v35 = 0;
        }
        free(v35);
      }

      v41 = objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
      v42 = dispatch_time(0, 360000000000);
      dispatch_source_set_timer(v41, v42, 0xFFFFFFFFFFFFFFFFLL, 0);

      v43 = objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10000F31C;
      handler[3] = &unk_1000D0F50;
      handler[4] = self;
      dispatch_source_set_event_handler(v43, handler);

      v20 = objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
      dispatch_activate(v20);
    }

    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_10000F65C;
    v47[3] = &unk_1000D1008;
    v48 = v4;
    v49 = self;
    -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", v47);

  }
  else
  {
    -[RDServer setSwitchState:](self, "setSwitchState:", 2);
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v25 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v52 = 0;
      v26 = sub_100007750(1);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        v27 = v26;
      else
        v27 = v26 & 0xFFFFFFFE;
      if ((_DWORD)v27)
      {
        LOWORD(v51[0]) = 0;
        v28 = (const char *)_os_log_send_and_compose_impl(v27, v52, 0, 0);
        v29 = (char *)v28;
        if (v28)
          sub_100007780(v28);
      }
      else
      {
        v29 = 0;
      }
      free(v29);
    }

    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v36 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v52 = 0;
      v37 = sub_100007750(1);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        v38 = v37;
      else
        v38 = v37 & 0xFFFFFFFE;
      if ((_DWORD)v38)
      {
        LOWORD(v51[0]) = 0;
        v39 = (const char *)_os_log_send_and_compose_impl(v38, v52, 0, 0);
        v40 = (char *)v39;
        if (v39)
          sub_100007780(v39);
      }
      else
      {
        v40 = 0;
      }
      free(v40);
    }

    -[RDServer _reallySwitchUser:](self, "_reallySwitchUser:", 1);
  }

  return 1;
}

- (void)_checkIfWeShouldSwitchUser:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  unsigned int v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  const char *v14;
  char *v15;
  NSObject *v16;
  unsigned int v17;
  uint64_t v18;
  const char *v19;
  char *v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  _BYTE v27[24];

  v3 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 1;
  if (qword_1000DFFD8 != -1)
    dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
  v5 = (id)qword_1000DFFD0;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 0;
    v6 = sub_100007750(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      v7 = v6;
    else
      v7 = v6 & 0xFFFFFFFE;
    if ((_DWORD)v7)
    {
      v8 = "FALSE";
      if (v3)
        v8 = "TRUE";
      *(_DWORD *)v27 = 136315138;
      *(_QWORD *)&v27[4] = v8;
      v9 = (const char *)_os_log_send_and_compose_impl(v7, &v22, 0, 0);
      v10 = (char *)v9;
      if (v9)
        sub_100007780(v9);
    }
    else
    {
      v10 = 0;
    }
    free(v10);
  }

  if (-[RDServer switchState](self, "switchState") == 1)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000FBF4;
    v21[3] = &unk_1000D1030;
    v21[4] = &v23;
    -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", v21);
    if (*((_BYTE *)v24 + 24))
    {
      if (qword_1000DFFD8 != -1)
        dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
      v11 = (id)qword_1000DFFD0;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_QWORD *)v27 = 0;
        v12 = sub_100007750(1);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          v13 = v12;
        else
          v13 = v12 & 0xFFFFFFFE;
        if ((_DWORD)v13)
        {
          LOWORD(v22) = 0;
          v14 = (const char *)_os_log_send_and_compose_impl(v13, v27, 0, 0);
          v15 = (char *)v14;
          if (v14)
            sub_100007780(v14);
        }
        else
        {
          v15 = 0;
        }
        free(v15);
      }

      -[RDServer _reallySwitchUser:](self, "_reallySwitchUser:", v3);
    }
  }
  else
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v16 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v27 = 0;
      v17 = sub_100007750(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        v18 = v17;
      else
        v18 = v17 & 0xFFFFFFFE;
      if ((_DWORD)v18)
      {
        LOWORD(v22) = 0;
        v19 = (const char *)_os_log_send_and_compose_impl(v18, v27, 0, 0);
        v20 = (char *)v19;
        if (v19)
          sub_100007780(v19);
      }
      else
      {
        v20 = 0;
      }
      free(v20);
    }

  }
  _Block_object_dispose(&v23, 8);
}

- (void)_reallySwitchUser:(BOOL)a3
{
  _BOOL4 v3;
  const __CFDictionary *v5;
  NSObject *v6;
  unsigned int v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  char *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  char *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  NSObject *v24;
  unsigned int v25;
  uint64_t v26;
  const char *v27;
  char *v28;
  NSObject *v29;
  unsigned int v30;
  uint64_t v31;
  const char *v32;
  char *v33;
  NSObject *v34;
  unsigned int v35;
  uint64_t v36;
  const char *v37;
  char *v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  unsigned int v43;
  char *v44;
  NSObject *v45;
  unsigned int v46;
  uint64_t v47;
  const char *v48;
  char *v49;
  int v50;
  int v51;
  NSObject *v52;
  unsigned int v53;
  uint64_t v54;
  NSObject *v55;
  unsigned int v56;
  uint64_t v57;
  const char *v58;
  char *v59;
  NSObject *v60;
  unsigned int v61;
  uint64_t v62;
  const char *v63;
  char *v64;
  const __CFDictionary *v65;
  NSObject *v66;
  unsigned int v67;
  uint64_t v68;
  const char *v69;
  char *v70;
  const void *Value;
  const __CFData *v72;
  NSObject *v73;
  unsigned int v74;
  uint64_t v75;
  const char *v76;
  char *v77;
  unsigned int v78;
  const char *v79;
  char *v80;
  NSObject *v81;
  unsigned int v82;
  uint64_t v83;
  const char *v84;
  char *v85;
  uint64_t *v86;
  uint64_t v87;
  _QWORD v88[4];
  const __CFDictionary *v89;
  _QWORD v90[5];
  _BYTE v91[12];
  uint64_t v92;

  v3 = a3;
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(-[RDServer userToSwitchTo](self, "userToSwitchTo"));
  if (qword_1000DFFD8 != -1)
    dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
  v6 = (id)qword_1000DFFD0;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v92 = 0;
    v7 = sub_100007750(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      v8 = v7;
    else
      v8 = v7 & 0xFFFFFFFE;
    if ((_DWORD)v8)
    {
      v9 = "FALSE";
      if (v3)
        v9 = "TRUE";
      *(_DWORD *)v91 = 136315138;
      *(_QWORD *)&v91[4] = v9;
      LODWORD(v87) = 12;
      v86 = (uint64_t *)v91;
      v10 = (const char *)_os_log_send_and_compose_impl(v8, &v92, 0, 0);
      v11 = (char *)v10;
      if (v10)
        sub_100007780(v10);
    }
    else
    {
      v11 = 0;
    }
    free(v11);
  }

  -[RDServer setSwitchState:](self, "setSwitchState:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));

  if (v12)
  {
    if (qword_1000DFFE8 != -1)
      dispatch_once(&qword_1000DFFE8, &stru_1000D1250);
    v13 = (id)qword_1000DFFE0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v92 = 0;
      LODWORD(v14) = sub_100007750(0);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        v14 = v14;
      else
        v14 = v14 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v15 = v13;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
        *(_DWORD *)v91 = 134217984;
        *(_QWORD *)&v91[4] = v16;
        LODWORD(v87) = 12;
        v86 = (uint64_t *)v91;
        v17 = (char *)_os_log_send_and_compose_impl(v14, &v92, 0, 0);

        if (v17)
          sub_100007780(v17);
      }
      else
      {
        v17 = 0;
      }
      free(v17);
    }

    v18 = objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
    dispatch_source_cancel(v18);

    -[RDServer setLogoutTimer:](self, "setLogoutTimer:", 0);
  }
  v19 = sub_10001BE1C(qword_1000E0318);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  if ((sub_10001CA60((uint64_t)v20) & 1) != 0)
  {
    v21 = sub_10001BE1C(qword_1000E0318);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = sub_10001CAE4((uint64_t)v22);

    if (v23 == 502)
    {
      if (qword_1000DFFD8 != -1)
        dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
      v24 = (id)qword_1000DFFD0;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_QWORD *)v91 = 0;
        v25 = sub_100007750(1);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          v26 = v25;
        else
          v26 = v25 & 0xFFFFFFFE;
        if ((_DWORD)v26)
        {
          LOWORD(v92) = 0;
          LODWORD(v87) = 2;
          v86 = &v92;
          v27 = (const char *)_os_log_send_and_compose_impl(v26, v91, 0, 0);
          v28 = (char *)v27;
          if (v27)
            sub_100007780(v27);
        }
        else
        {
          v28 = 0;
        }
        free(v28);
      }

      sub_1000216D4(0, 502);
      goto LABEL_67;
    }
  }
  else
  {

  }
  if ((dword_1000E02C8 & 0xFFFFFFFE) == 2)
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v29 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v91 = 0;
      v30 = sub_100007750(1);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        v31 = v30;
      else
        v31 = v30 & 0xFFFFFFFE;
      if ((_DWORD)v31)
      {
        LOWORD(v92) = 0;
        LODWORD(v87) = 2;
        v86 = &v92;
        v32 = (const char *)_os_log_send_and_compose_impl(v31, v91, 0, 0);
        v33 = (char *)v32;
        if (v32)
          sub_100007780(v32);
      }
      else
      {
        v33 = 0;
      }
      free(v33);
    }

    -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", &stru_1000D1050);
    sub_100038968();
  }
  else
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v34 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v91 = 0;
      v35 = sub_100007750(1);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        v36 = v35;
      else
        v36 = v35 & 0xFFFFFFFE;
      if ((_DWORD)v36)
      {
        LODWORD(v92) = 67109120;
        HIDWORD(v92) = dword_1000E02C8;
        LODWORD(v87) = 8;
        v86 = &v92;
        v37 = (const char *)_os_log_send_and_compose_impl(v36, v91, 0, 0);
        v38 = (char *)v37;
        if (v37)
          sub_100007780(v37);
      }
      else
      {
        v38 = 0;
      }
      free(v38);
    }

  }
LABEL_67:
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer criticalStakeHolder](self, "criticalStakeHolder", v86, v87));
  if (!v39)
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v45 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v91 = 0;
      v46 = sub_100007750(1);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        v47 = v46;
      else
        v47 = v46 & 0xFFFFFFFE;
      if ((_DWORD)v47)
      {
        LOWORD(v92) = 0;
        v48 = (const char *)_os_log_send_and_compose_impl(v47, v91, 0, 0);
        v49 = (char *)v48;
        if (v48)
          sub_100007780(v48);
      }
      else
      {
        v49 = 0;
      }
      free(v49);
    }

    goto LABEL_111;
  }
  if (qword_1000DFFD8 != -1)
    dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
  v40 = (id)qword_1000DFFD0;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)v91 = 0;
    LODWORD(v41) = sub_100007750(1);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      v41 = v41;
    else
      v41 = v41 & 0xFFFFFFFE;
    if ((_DWORD)v41)
    {
      v42 = v40;
      v43 = objc_msgSend(v39, "stakeholderIsRegistered");
      LODWORD(v92) = 67109120;
      HIDWORD(v92) = v43;
      v44 = (char *)_os_log_send_and_compose_impl(v41, v91, 0, 0);

      if (v44)
        sub_100007780(v44);
    }
    else
    {
      v44 = 0;
    }
    free(v44);
  }

  if (!objc_msgSend(v39, "stakeholderIsRegistered"))
  {
LABEL_111:
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v60 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v91 = 0;
      v61 = sub_100007750(1);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        v62 = v61;
      else
        v62 = v61 & 0xFFFFFFFE;
      if ((_DWORD)v62)
      {
        LOWORD(v92) = 0;
        v63 = (const char *)_os_log_send_and_compose_impl(v62, v91, 0, 0);
        v64 = (char *)v63;
        if (v63)
          sub_100007780(v63);
      }
      else
      {
        v64 = 0;
      }
      free(v64);
    }

    v65 = v5;
    if (v3)
    {
      v65 = (const __CFDictionary *)sub_10001D248(502);
      if (qword_1000DFFD8 != -1)
        dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
      v66 = (id)qword_1000DFFD0;
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        *(_QWORD *)v91 = 0;
        v67 = sub_100007750(1);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          v68 = v67;
        else
          v68 = v67 & 0xFFFFFFFE;
        if ((_DWORD)v68)
        {
          LOWORD(v92) = 0;
          v69 = (const char *)_os_log_send_and_compose_impl(v68, v91, 0, 0);
          v70 = (char *)v69;
          if (v69)
            sub_100007780(v69);
        }
        else
        {
          v70 = 0;
        }
        free(v70);
      }

    }
    if (v65 && CFDictionaryContainsKey(v65, CFSTR("UserSwitchTaskOpqueData")))
    {
      Value = CFDictionaryGetValue(v65, CFSTR("UserSwitchTaskOpqueData"));
      v72 = (const __CFData *)CFRetain(Value);
      CFDictionaryRemoveValue(v65, CFSTR("UserSwitchTaskOpqueData"));
    }
    else
    {
      v72 = 0;
    }
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v73 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v91 = 0;
      v74 = sub_100007750(1);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        v75 = v74;
      else
        v75 = v74 & 0xFFFFFFFE;
      if ((_DWORD)v75)
      {
        LOWORD(v92) = 0;
        v76 = (const char *)_os_log_send_and_compose_impl(v75, v91, 0, 0);
        v77 = (char *)v76;
        if (v76)
          sub_100007780(v76);
      }
      else
      {
        v77 = 0;
      }
      free(v77);
    }

    sub_1000329B8(v65, v72);
    goto LABEL_151;
  }
  if (v3)
  {
    v50 = MKBLockDeviceNow(0);
    if (v50)
    {
      v51 = v50;
      if (qword_1000DFFD8 != -1)
        dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
      v52 = (id)qword_1000DFFD0;
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        goto LABEL_167;
      *(_QWORD *)v91 = 0;
      v53 = sub_100007750(1);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        v54 = v53;
      else
        v54 = v53 & 0xFFFFFFFE;
      if ((_DWORD)v54)
      {
        LODWORD(v92) = 67109120;
        HIDWORD(v92) = v51;
        goto LABEL_160;
      }
    }
    else
    {
      if (qword_1000DFFD8 != -1)
        dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
      v52 = (id)qword_1000DFFD0;
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        goto LABEL_167;
      *(_QWORD *)v91 = 0;
      v78 = sub_100007750(1);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        v54 = v78;
      else
        v54 = v78 & 0xFFFFFFFE;
      if ((_DWORD)v54)
      {
        LOWORD(v92) = 0;
LABEL_160:
        v79 = (const char *)_os_log_send_and_compose_impl(v54, v91, 0, 0);
        v80 = (char *)v79;
        if (v79)
          sub_100007780(v79);
        goto LABEL_166;
      }
    }
    v80 = 0;
LABEL_166:
    free(v80);
LABEL_167:

    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v81 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v91 = 0;
      v82 = sub_100007750(1);
      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        v83 = v82;
      else
        v83 = v82 & 0xFFFFFFFE;
      if ((_DWORD)v83)
      {
        LOWORD(v92) = 0;
        v84 = (const char *)_os_log_send_and_compose_impl(v83, v91, 0, 0);
        v85 = (char *)v84;
        if (v84)
          sub_100007780(v84);
      }
      else
      {
        v85 = 0;
      }
      free(v85);
    }

    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_1000111A0;
    v90[3] = &unk_1000D0F50;
    v90[4] = self;
    objc_msgSend(v39, "readyToSwitchToLoginSession:completionHandler:", 0, v90);
    goto LABEL_151;
  }
  if (qword_1000DFFD8 != -1)
    dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
  v55 = (id)qword_1000DFFD0;
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_QWORD *)v91 = 0;
    v56 = sub_100007750(1);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      v57 = v56;
    else
      v57 = v56 & 0xFFFFFFFE;
    if ((_DWORD)v57)
    {
      LOWORD(v92) = 0;
      v58 = (const char *)_os_log_send_and_compose_impl(v57, v91, 0, 0);
      v59 = (char *)v58;
      if (v58)
        sub_100007780(v58);
    }
    else
    {
      v59 = 0;
    }
    free(v59);
  }

  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_100011C1C;
  v88[3] = &unk_1000D0F50;
  v89 = v5;
  objc_msgSend(v39, "readyToSwitchToUser:completionHandler:", v89, v88);

LABEL_151:
}

- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4
{
  -[RDServer addUserSwitchBlockingTask:forPID:completionHandler:](self, "addUserSwitchBlockingTask:forPID:completionHandler:", a3, *(_QWORD *)&a4, 0);
}

- (void)removeUserSwitchBlockingTask:(id)a3 forPID:(int)a4
{
  -[RDServer removeUserSwitchBlockingTask:forPID:completionHandler:](self, "removeUserSwitchBlockingTask:forPID:completionHandler:", a3, *(_QWORD *)&a4, 0);
}

- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a5;
  v10 = qword_1000E0320;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100011F04;
  v13[3] = &unk_1000D0EB8;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)removeUserSwitchBlockingTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a5;
  v10 = qword_1000E0320;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100012278;
  v13[3] = &unk_1000D0EB8;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)_broadcastUserSwitchTaskListDidUpdate
{
  -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", &stru_1000D1070);
}

- (void)_broadcastDeviceLoginSessionStateDidUpdate
{
  -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", &stru_1000D1090);
}

- (void)fetchUserSwitchBlockingTaskListWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = qword_1000E0320;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012744;
  v7[3] = &unk_1000D10E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)fetchUserSyncTaskList
{
  NSMutableArray *v3;
  _QWORD v5[4];
  NSMutableArray *v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000128A4;
  v5[3] = &unk_1000D10B8;
  v3 = objc_opt_new(NSMutableArray);
  v6 = v3;
  -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", v5);

  return v3;
}

- (id)fetchUserBlockTaskList
{
  NSMutableArray *v3;
  _QWORD v5[4];
  NSMutableArray *v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012968;
  v5[3] = &unk_1000D10B8;
  v3 = objc_opt_new(NSMutableArray);
  v6 = v3;
  -[RDServer _enumerateClientsWithBlock:](self, "_enumerateClientsWithBlock:", v5);

  return v3;
}

- (void)addUserSyncTask:(id)a3 forPID:(int)a4
{
  -[RDServer addUserSyncTask:forPID:completionHandler:](self, "addUserSyncTask:forPID:completionHandler:", a3, *(_QWORD *)&a4, 0);
}

- (void)removeUserSyncTask:(id)a3 forPID:(int)a4
{
  -[RDServer removeUserSyncTask:forPID:completionHandler:](self, "removeUserSyncTask:forPID:completionHandler:", a3, *(_QWORD *)&a4, 0);
}

- (void)addUserSyncTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a5;
  v10 = qword_1000E0320;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100012A74;
  v13[3] = &unk_1000D0EB8;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)removeUserSyncTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a5;
  v10 = qword_1000E0320;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100012E18;
  v13[3] = &unk_1000D0EB8;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)suspendUserQuotaForPID:(int)a3 completionHandler:(id)a4
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a4;
  v5 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013168;
  block[3] = &unk_1000D1108;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (void)reengageUserQuotaForPID:(int)a3 completionHandler:(id)a4
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a4;
  v5 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001324C;
  block[3] = &unk_1000D1108;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

- (void)createPersona:(id)a3 passcodeData:(id)a4 forPid:(int)a5 completionHandler:(id)a6
{
  -[RDServer createPersona:passcodeData:passcodeDataType:forPid:completionHandler:](self, "createPersona:passcodeData:passcodeDataType:forPid:completionHandler:", a3, a4, 0, *(_QWORD *)&a5, a6);
}

- (void)createPersona:(id)a3 passcodeData:(id)a4 passcodeDataType:(unint64_t)a5 forPid:(int)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  NSObject *v17;
  unsigned int v18;
  uint64_t v19;
  const char *v20;
  char *v21;
  void *v22;
  int v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  _DWORD *v28;
  uint64_t v29;
  _QWORD block[5];
  id v31;
  id v32;
  id v33;
  unint64_t v34;
  unsigned int v35;
  int v36;
  uint64_t v37;
  _DWORD v38[2];
  __int16 v39;
  int v40;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v16 = objc_msgSend(v15, "processIdentifier");

  if (v16 != a6)
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v17 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v37 = 0;
      v18 = sub_100007750(1);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        v19 = v18;
      else
        v19 = v18 & 0xFFFFFFFE;
      if ((_DWORD)v19)
      {
        v38[0] = 67109376;
        v38[1] = v16;
        v39 = 1024;
        v40 = a6;
        LODWORD(v29) = 14;
        v28 = v38;
        v20 = (const char *)_os_log_send_and_compose_impl(v19, &v37, 0, 0);
        v21 = (char *)v20;
        if (v20)
          sub_100007780(v20);
      }
      else
      {
        v21 = 0;
      }
      free(v21);
    }

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection", v28, v29));
  v23 = sub_100004BCC((uint64_t)objc_msgSend(v22, "processIdentifier"));

  v24 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013518;
  block[3] = &unk_1000D1158;
  block[4] = self;
  v31 = v12;
  v33 = v14;
  v34 = a5;
  v32 = v13;
  v35 = v16;
  v36 = v23;
  v25 = v13;
  v26 = v12;
  v27 = v14;
  dispatch_async(v24, block);

}

- (void)deletePersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  void *v17;
  int v18;
  NSObject *v19;
  id v20;
  id v21;
  _DWORD *v22;
  uint64_t v23;
  _QWORD block[5];
  id v25;
  id v26;
  unsigned int v27;
  int v28;
  uint64_t v29;
  _DWORD v30[2];
  __int16 v31;
  int v32;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v11 = objc_msgSend(v10, "processIdentifier");

  if (v11 != a4)
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v12 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 0;
      v13 = sub_100007750(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v30[0] = 67109376;
        v30[1] = v11;
        v31 = 1024;
        v32 = a4;
        LODWORD(v23) = 14;
        v22 = v30;
        v15 = (const char *)_os_log_send_and_compose_impl(v14, &v29, 0, 0);
        v16 = (char *)v15;
        if (v15)
          sub_100007780(v15);
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection", v22, v23));
  v18 = sub_100004BCC((uint64_t)objc_msgSend(v17, "processIdentifier"));

  v19 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000144B0;
  block[3] = &unk_1000D1180;
  block[4] = self;
  v25 = v8;
  v27 = v11;
  v28 = v18;
  v26 = v9;
  v20 = v9;
  v21 = v8;
  dispatch_async(v19, block);

}

- (void)disablePersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  void *v17;
  int v18;
  NSObject *v19;
  id v20;
  id v21;
  _DWORD *v22;
  uint64_t v23;
  _QWORD block[5];
  id v25;
  id v26;
  unsigned int v27;
  int v28;
  uint64_t v29;
  _DWORD v30[2];
  __int16 v31;
  int v32;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v11 = objc_msgSend(v10, "processIdentifier");

  if (v11 != a4)
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v12 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 0;
      v13 = sub_100007750(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v30[0] = 67109376;
        v30[1] = v11;
        v31 = 1024;
        v32 = a4;
        LODWORD(v23) = 14;
        v22 = v30;
        v15 = (const char *)_os_log_send_and_compose_impl(v14, &v29, 0, 0);
        v16 = (char *)v15;
        if (v15)
          sub_100007780(v15);
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection", v22, v23));
  v18 = sub_100004BCC((uint64_t)objc_msgSend(v17, "processIdentifier"));

  v19 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014C88;
  block[3] = &unk_1000D1180;
  block[4] = self;
  v25 = v8;
  v27 = v11;
  v28 = v18;
  v26 = v9;
  v20 = v9;
  v21 = v8;
  dispatch_async(v19, block);

}

- (void)fetchPersonaListforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  int v13;
  int v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v8 = sub_100004BCC((uint64_t)objc_msgSend(v7, "processIdentifier"));

  v9 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000152FC;
  block[3] = &unk_1000D0F78;
  v13 = a3;
  v14 = v8;
  block[4] = self;
  v12 = v6;
  v10 = v6;
  dispatch_async(v9, block);

}

- (void)fetchAllUsersPersonaListforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  v7 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015898;
  block[3] = &unk_1000D0E90;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)fetchAsidMapforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  v7 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015DE0;
  block[3] = &unk_1000D0E90;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)fetchPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int v18;
  int v19;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v11 = sub_100004BCC((uint64_t)objc_msgSend(v10, "processIdentifier"));

  v12 = qword_1000E0320;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100016238;
  v15[3] = &unk_1000D1180;
  v15[4] = self;
  v16 = v8;
  v18 = a4;
  v19 = v11;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  dispatch_async(v12, v15);

}

- (void)setSinglePersonaBundlesIdentifiers:(id)a3 forPersona:(id)a4 forPid:(int)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  unsigned int v16;
  uint64_t v17;
  const char *v18;
  char *v19;
  void *v20;
  int v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  _DWORD *v26;
  uint64_t v27;
  _QWORD block[5];
  id v29;
  id v30;
  id v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  _DWORD v35[2];
  __int16 v36;
  int v37;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v14 = objc_msgSend(v13, "processIdentifier");

  if (v14 != a5)
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v15 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v34 = 0;
      v16 = sub_100007750(1);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if ((_DWORD)v17)
      {
        v35[0] = 67109376;
        v35[1] = v14;
        v36 = 1024;
        v37 = a5;
        LODWORD(v27) = 14;
        v26 = v35;
        v18 = (const char *)_os_log_send_and_compose_impl(v17, &v34, 0, 0);
        v19 = (char *)v18;
        if (v18)
          sub_100007780(v18);
      }
      else
      {
        v19 = 0;
      }
      free(v19);
    }

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection", v26, v27));
  v21 = sub_100004BCC((uint64_t)objc_msgSend(v20, "processIdentifier"));

  v22 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016B60;
  block[3] = &unk_1000D11A8;
  block[4] = self;
  v29 = v11;
  v32 = v14;
  v33 = v21;
  v30 = v10;
  v31 = v12;
  v23 = v12;
  v24 = v10;
  v25 = v11;
  dispatch_async(v22, block);

}

- (void)fetchBundleIdentifiersForPersona:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int v18;
  int v19;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v11 = sub_100004BCC((uint64_t)objc_msgSend(v10, "processIdentifier"));

  v12 = qword_1000E0320;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000172F8;
  v15[3] = &unk_1000D1180;
  v15[4] = self;
  v16 = v8;
  v18 = a4;
  v19 = v11;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  dispatch_async(v12, v15);

}

- (void)setMultiPersonaBundlesIdentifiers:(id)a3 forPid:(int)a4 WithcompletionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  unsigned int v13;
  uint64_t v14;
  const char *v15;
  char *v16;
  void *v17;
  int v18;
  NSObject *v19;
  id v20;
  id v21;
  _DWORD *v22;
  uint64_t v23;
  _QWORD block[5];
  id v25;
  id v26;
  unsigned int v27;
  int v28;
  uint64_t v29;
  _DWORD v30[2];
  __int16 v31;
  int v32;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v11 = objc_msgSend(v10, "processIdentifier");

  if (v11 != a4)
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v12 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 0;
      v13 = sub_100007750(1);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        v14 = v13;
      else
        v14 = v13 & 0xFFFFFFFE;
      if ((_DWORD)v14)
      {
        v30[0] = 67109376;
        v30[1] = v11;
        v31 = 1024;
        v32 = a4;
        LODWORD(v23) = 14;
        v22 = v30;
        v15 = (const char *)_os_log_send_and_compose_impl(v14, &v29, 0, 0);
        v16 = (char *)v15;
        if (v15)
          sub_100007780(v15);
      }
      else
      {
        v16 = 0;
      }
      free(v16);
    }

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection", v22, v23));
  v18 = sub_100004BCC((uint64_t)objc_msgSend(v17, "processIdentifier"));

  v19 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017BE4;
  block[3] = &unk_1000D1180;
  block[4] = self;
  v25 = v8;
  v27 = v11;
  v28 = v18;
  v26 = v9;
  v20 = v9;
  v21 = v8;
  dispatch_async(v19, block);

}

- (void)fetchMultiPersonaBundleIdentifiersforPid:(int)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  _QWORD block[5];
  id v12;
  int v13;
  int v14;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v8 = sub_100004BCC((uint64_t)objc_msgSend(v7, "processIdentifier"));

  v9 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001826C;
  block[3] = &unk_1000D0F78;
  v13 = a3;
  v14 = v8;
  block[4] = self;
  v12 = v6;
  v10 = v6;
  dispatch_async(v9, block);

}

- (void)personaLoginWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6
{
  id v7;
  id v8;

  if (a6)
  {
    v7 = a6;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 45, 0));
    (*((void (**)(id, id))a6 + 2))(v7, v8);

  }
}

- (void)personaLogoutWithPid:(int)a3 WithUserODuuid:(id)a4 withUid:(unsigned int)a5 completionHandler:(id)a6
{
  id v7;
  id v8;

  if (a6)
  {
    v7 = a6;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 45, 0));
    (*((void (**)(id, id))a6 + 2))(v7, v8);

  }
}

- (void)_broadcastPersonaUpdates:(id)a3 withAuid:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  unsigned int v8;
  uint64_t v9;
  const char *v10;
  char *v11;
  CFArrayRef v12;
  CFArrayRef v13;
  _QWORD v14[5];
  unsigned int v15;
  __int16 v16;
  uint64_t v17;

  v6 = a3;
  if (qword_1000DFFD8 != -1)
    dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
  v7 = (id)qword_1000DFFD0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 0;
    v8 = sub_100007750(1);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      v9 = v8;
    else
      v9 = v8 & 0xFFFFFFFE;
    if ((_DWORD)v9)
    {
      v16 = 0;
      v10 = (const char *)_os_log_send_and_compose_impl(v9, &v17, 0, 0);
      v11 = (char *)v10;
      if (v10)
        sub_100007780(v10);
    }
    else
    {
      v11 = 0;
    }
    free(v11);
  }

  v12 = sub_100049DB0(v6);
  v13 = v12;
  if (v12)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100018AA4;
    v14[3] = &unk_1000D11D0;
    v14[4] = self;
    v15 = a4;
    -[__CFArray enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:", v14);
  }

}

- (BOOL)notifyNextPersonaObserver:(id)a3 withUser:(unsigned int)a4
{
  id v5;
  NSObject *v6;
  unsigned int v7;
  uint64_t v8;
  const char *v9;
  char *v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  const char *v14;
  char *v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  unsigned int v20;
  uint64_t v21;
  const char *v22;
  char *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  _BYTE v30[24];

  v5 = a3;
  if (v5)
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v6 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 0;
      v7 = sub_100007750(1);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        v8 = v7;
      else
        v8 = v7 & 0xFFFFFFFE;
      if ((_DWORD)v8)
      {
        *(_DWORD *)v30 = 138412290;
        *(_QWORD *)&v30[4] = v5;
        v9 = (const char *)_os_log_send_and_compose_impl(v8, &v29, 0, 0);
        v10 = (char *)v9;
        if (v9)
          sub_100007780(v9);
      }
      else
      {
        v10 = 0;
      }
      free(v10);
    }

    v16 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", v5, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RDClient sharedXPCInterface](RDClient, "sharedXPCInterface"));
    objc_msgSend(v16, "setRemoteObjectInterface:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[RDServer sharedXPCInterface](RDServer, "sharedXPCInterface"));
    objc_msgSend(v16, "setExportedInterface:", v18);

    objc_msgSend(v16, "setExportedObject:", self);
    objc_msgSend(v16, "setInterruptionHandler:", &stru_1000D11F0);
    objc_msgSend(v16, "setInvalidationHandler:", &stru_1000D1210);
    objc_msgSend(v16, "resume");
    v11 = objc_claimAutoreleasedReturnValue(+[RDClient clientWithXPCConnection:](RDClient, "clientWithXPCConnection:", v16));
    if (!v11)
    {
      if (qword_1000DFFD8 != -1)
        dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
      v19 = (id)qword_1000DFFD0;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_QWORD *)v30 = 0;
        v20 = sub_100007750(1);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          v21 = v20;
        else
          v21 = v20 & 0xFFFFFFFE;
        if ((_DWORD)v21)
        {
          LOWORD(v29) = 0;
          v22 = (const char *)_os_log_send_and_compose_impl(v21, v30, 0, 0);
          v23 = (char *)v22;
          if (v22)
            sub_100007780(v22);
        }
        else
        {
          v23 = 0;
        }
        free(v23);
      }

    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10001926C;
    v26[3] = &unk_1000D0E68;
    v27 = v5;
    v28 = v16;
    v24 = v16;
    -[NSObject personaUpdateCallbackForMachServiceCompletionHandler:](v11, "personaUpdateCallbackForMachServiceCompletionHandler:", v26);

  }
  else
  {
    if (qword_1000DFFD8 != -1)
      dispatch_once(&qword_1000DFFD8, &stru_1000D1230);
    v11 = (id)qword_1000DFFD0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v30 = 0;
      v12 = sub_100007750(1);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        v13 = v12;
      else
        v13 = v12 & 0xFFFFFFFE;
      if ((_DWORD)v13)
      {
        LOWORD(v29) = 0;
        v14 = (const char *)_os_log_send_and_compose_impl(v13, v30, 0, 0);
        v15 = (char *)v14;
        if (v14)
          sub_100007780(v14);
      }
      else
      {
        v15 = 0;
      }
      free(v15);
    }
  }

  return v5 != 0;
}

- (void)registerUserPersonaStakeholderForPID:(int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int v11;

  v6 = a4;
  v7 = qword_1000E0320;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019440;
  block[3] = &unk_1000D0E90;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)registerUserPersonaObserverForPID:(int)a3 withMachServiceName:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  int v18;
  int v19;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](NSXPCConnection, "currentConnection"));
  v11 = sub_100004BCC((uint64_t)objc_msgSend(v10, "processIdentifier"));

  v12 = qword_1000E0320;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100019984;
  v15[3] = &unk_1000D1180;
  v15[4] = self;
  v16 = v8;
  v18 = a3;
  v19 = v11;
  v17 = v9;
  v13 = v9;
  v14 = v8;
  dispatch_async(v12, v15);

}

- (int)asidForClient:(id)a3 withAuid:(unsigned int *)a4 withPid:(int)a5
{
  if (a4)
    *a4 = -1;
  return -1;
}

- (void)provisionDevice:(id)a3 forPid:(int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a5;
  v10 = qword_1000E0320;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100019FE8;
  v13[3] = &unk_1000D0EB8;
  v16 = a4;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

- (void)resetStateForUserSwitch
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  char *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  char *v15;
  NSObject *v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;

  dispatch_assert_queue_V2((dispatch_queue_t)qword_1000E0320);
  -[RDServer setSwitchState:](self, "setSwitchState:", 0);
  -[RDServer setUserToSwitchTo:](self, "setUserToSwitchTo:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));

  if (v3)
  {
    if (qword_1000DFFE8 != -1)
      dispatch_once(&qword_1000DFFE8, &stru_1000D1250);
    v4 = (id)qword_1000DFFE0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 0;
      LODWORD(v5) = sub_100007750(0);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        v5 = v5;
      else
        v5 = v5 & 0xFFFFFFFE;
      if ((_DWORD)v5)
      {
        v6 = v4;
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
        v20 = 134217984;
        v21 = v7;
        LODWORD(v18) = 12;
        v17 = &v20;
        v8 = (char *)_os_log_send_and_compose_impl(v5, &v19, 0, 0);

        if (v8)
          sub_100007780(v8);
      }
      else
      {
        v8 = 0;
      }
      free(v8);
    }

    v9 = objc_claimAutoreleasedReturnValue(-[RDServer logoutTimer](self, "logoutTimer"));
    dispatch_source_cancel(v9);

    -[RDServer setLogoutTimer:](self, "setLogoutTimer:", 0);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer", v17, v18));

  if (v10)
  {
    if (qword_1000DFFE8 != -1)
      dispatch_once(&qword_1000DFFE8, &stru_1000D1250);
    v11 = (id)qword_1000DFFE0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 0;
      LODWORD(v12) = sub_100007750(0);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        v12 = v12;
      else
        v12 = v12 & 0xFFFFFFFE;
      if ((_DWORD)v12)
      {
        v13 = v11;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
        v20 = 134217984;
        v21 = v14;
        v15 = (char *)_os_log_send_and_compose_impl(v12, &v19, 0, 0);

        if (v15)
          sub_100007780(v15);
      }
      else
      {
        v15 = 0;
      }
      free(v15);
    }

    v16 = objc_claimAutoreleasedReturnValue(-[RDServer fastLogoutTimer](self, "fastLogoutTimer"));
    dispatch_source_cancel(v16);

    -[RDServer setFastLogoutTimer:](self, "setFastLogoutTimer:", 0);
  }
}

- (NSMutableDictionary)pidsToClients
{
  return self->_pidsToClients;
}

- (void)setPidsToClients:(id)a3
{
  objc_storeStrong((id *)&self->_pidsToClients, a3);
}

- (NSMutableDictionary)userToSwitchTo
{
  return self->_userToSwitchTo;
}

- (void)setUserToSwitchTo:(id)a3
{
  objc_storeStrong((id *)&self->_userToSwitchTo, a3);
}

- (int)switchState
{
  return self->_switchState;
}

- (void)setSwitchState:(int)a3
{
  self->_switchState = a3;
}

- (OS_dispatch_source)logoutTimer
{
  return self->_logoutTimer;
}

- (void)setLogoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_logoutTimer, a3);
}

- (OS_dispatch_source)fastLogoutTimer
{
  return self->_fastLogoutTimer;
}

- (void)setFastLogoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_fastLogoutTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fastLogoutTimer, 0);
  objc_storeStrong((id *)&self->_logoutTimer, 0);
  objc_storeStrong((id *)&self->_userToSwitchTo, 0);
  objc_storeStrong((id *)&self->_pidsToClients, 0);
}

@end
