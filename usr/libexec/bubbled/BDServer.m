@implementation BDServer

+ (id)sharedServer
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C88;
  block[3] = &unk_10000C450;
  block[4] = a1;
  if (qword_100011D38 != -1)
    dispatch_once(&qword_100011D38, block);
  return (id)qword_100011D30;
}

+ (id)sharedXPCInterface
{
  if (qword_100011D48 != -1)
    dispatch_once(&qword_100011D48, &stru_10000C470);
  return (id)qword_100011D40;
}

+ (id)sharedBubbleXPCInterface
{
  if (qword_100011D58 != -1)
    dispatch_once(&qword_100011D58, &stru_10000C490);
  return (id)qword_100011D50;
}

- (BDServer)init
{
  BDServer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pidsToClients;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BDServer;
  v2 = -[BDServer init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    pidsToClients = v2->_pidsToClients;
    v2->_pidsToClients = v3;

  }
  return v2;
}

- (void)addClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "pid");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BDServer pidsToClients](self, "pidsToClients"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (v7)
  {
    NSLog(CFSTR("We already have a client for pid: %d"), v4);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BDServer pidsToClients](self, "pidsToClients"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v5);

  }
}

- (void)removeClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_msgSend(a3, "pid");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BDServer _clientForPID:](self, "_clientForPID:", v4));

  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BDServer pidsToClients](self, "pidsToClients"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v6);

  }
}

- (void)addBubbleClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "pid");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BDServer pidsToClients](self, "pidsToClients"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));

  if (v7)
  {
    NSLog(CFSTR("We already have a client for pid: %d"), v4);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BDServer pidsToClients](self, "pidsToClients"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v5);

  }
}

- (void)removeBubbleClient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = objc_msgSend(a3, "pid");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BDServer _clientForPID:](self, "_clientForPID:", v4));

  if (v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[BDServer pidsToClients](self, "pidsToClients"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v6);

  }
}

- (id)_clientForPID:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BDServer pidsToClients](self, "pidsToClients"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (!v6)
    NSLog(CFSTR("We do not have a client for pid: %d"), v3);
  return v6;
}

- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4
{
  -[BDServer addUserSwitchBlockingTask:forPID:completionHandler:](self, "addUserSwitchBlockingTask:forPID:completionHandler:", a3, *(_QWORD *)&a4, 0);
}

- (void)addUserSwitchBlockingTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];
  _BYTE v21[24];

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BDServer _clientForPID:](self, "_clientForPID:", v6));
  if (v10)
  {
    if (qword_100011D68 != -1)
      dispatch_once(&qword_100011D68, &stru_10000C4B0);
    v11 = (id)qword_100011D60;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20[0] = 0;
      v12 = sub_1000066E0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        v13 = v12;
      else
        v13 = v12 & 0xFFFFFFFE;
      if ((_DWORD)v13)
      {
        *(_DWORD *)v21 = 138412290;
        *(_QWORD *)&v21[4] = v8;
        v14 = (void *)_os_log_send_and_compose_impl(v13, v20, 0, 0, &_mh_execute_header, v11, 0, "Adding BlockSwitchTask %@", v21, 12);
        if (v14)
          sub_1000066E8();
      }
      else
      {
        v14 = 0;
      }
      free(v14);
    }

    objc_msgSend(v10, "addUserSwitchTask:", v8);
    if (qword_100011D68 != -1)
      dispatch_once(&qword_100011D68, &stru_10000C4B0);
    v15 = (id)qword_100011D60;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v21 = 0;
      v16 = sub_1000066E0();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if ((_DWORD)v17)
      {
        LOWORD(v20[0]) = 0;
        LODWORD(v19) = 2;
        v18 = (void *)_os_log_send_and_compose_impl(v17, v21, 0, 0, &_mh_execute_header, v15, 0, "Adding BlockSwitchTask DONE", v20, v19);
        if (v18)
          sub_1000066E8();
      }
      else
      {
        v18 = 0;
      }
      free(v18);
    }

  }
  if (v9)
    v9[2](v9, 0);

}

- (void)addUserSyncTask:(id)a3 forPID:(int)a4
{
  -[BDServer addUserSyncTask:forPID:completionHandler:](self, "addUserSyncTask:forPID:completionHandler:", a3, *(_QWORD *)&a4, 0);
}

- (void)addUserSyncTask:(id)a3 forPID:(int)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];
  _BYTE v21[24];

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BDServer _clientForPID:](self, "_clientForPID:", v6));
  if (v10)
  {
    if (qword_100011D68 != -1)
      dispatch_once(&qword_100011D68, &stru_10000C4B0);
    v11 = (id)qword_100011D60;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20[0] = 0;
      v12 = sub_1000066E0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        v13 = v12;
      else
        v13 = v12 & 0xFFFFFFFE;
      if ((_DWORD)v13)
      {
        *(_DWORD *)v21 = 138412290;
        *(_QWORD *)&v21[4] = v8;
        v14 = (void *)_os_log_send_and_compose_impl(v13, v20, 0, 0, &_mh_execute_header, v11, 0, "Adding Sync Task %@", v21, 12);
        if (v14)
          sub_1000066E8();
      }
      else
      {
        v14 = 0;
      }
      free(v14);
    }

    objc_msgSend(v10, "addUserSyncTask:", v8);
    if (qword_100011D68 != -1)
      dispatch_once(&qword_100011D68, &stru_10000C4B0);
    v15 = (id)qword_100011D60;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_QWORD *)v21 = 0;
      v16 = sub_1000066E0();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        v17 = v16;
      else
        v17 = v16 & 0xFFFFFFFE;
      if ((_DWORD)v17)
      {
        LOWORD(v20[0]) = 0;
        LODWORD(v19) = 2;
        v18 = (void *)_os_log_send_and_compose_impl(v17, v21, 0, 0, &_mh_execute_header, v15, 0, "Adding Sync Task DONE", v20, v19);
        if (v18)
          sub_1000066E8();
      }
      else
      {
        v18 = 0;
      }
      free(v18);
    }

  }
  if (v9)
    v9[2](v9, 0);

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userToSwitchTo, 0);
  objc_storeStrong((id *)&self->_pidsToClients, 0);
}

@end
