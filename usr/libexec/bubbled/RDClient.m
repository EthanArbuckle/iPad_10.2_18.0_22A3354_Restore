@implementation RDClient

+ (id)clientWithXPCConnection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new(a1);
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "setXpcConnection:", v4);

  return v6;
}

+ (id)sharedXPCInterface
{
  if (qword_100011D08 != -1)
    dispatch_once(&qword_100011D08, &stru_10000C390);
  return (id)qword_100011D00;
}

+ (id)sharedBubbleXPCInterface
{
  if (qword_100011D18 != -1)
    dispatch_once(&qword_100011D18, &stru_10000C3B0);
  return (id)qword_100011D10;
}

- (RDClient)init
{
  RDClient *v2;
  NSMutableArray *v3;
  NSMutableArray *userSwitchTasks;
  NSMutableArray *v5;
  NSMutableArray *userSyncTasks;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RDClient;
  v2 = -[RDClient init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableArray);
    userSwitchTasks = v2->_userSwitchTasks;
    v2->_userSwitchTasks = v3;

    v5 = objc_opt_new(NSMutableArray);
    userSyncTasks = v2->_userSyncTasks;
    v2->_userSyncTasks = v5;

  }
  return v2;
}

- (int)pid
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient xpcConnection](self, "xpcConnection"));
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  if (!a3)
    return 1;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient xpcConnection](self, "xpcConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "valueForEntitlement:", v4));

  v8 = 0;
  if (v6)
  {
    v7 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0 && (objc_msgSend(v6, "BOOLValue") & 1) != 0)
      v8 = 1;
  }

  return v8;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)currentAuditToken
{
  void *v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  void *v6;

  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient xpcConnection](self, "xpcConnection"));
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "auditToken");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (id)proxy
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient xpcConnection](self, "xpcConnection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003E20;
  v6[3] = &unk_10000C3D8;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6));

  return v4;
}

- (id)syncProxy
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient xpcConnection](self, "xpcConnection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100003ED8;
  v6[3] = &unk_10000C3D8;
  v6[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v6));

  return v4;
}

- (void)addUserSwitchTask:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RDClient userSwitchTasks](self, "userSwitchTasks"));
  objc_msgSend(v5, "addObject:", v4);

}

- (id)taskDictionaryInArray:(id)a3 withUUIDString:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", kUMUserSwitchTaskUUIDKey, (_QWORD)v14));
        if (objc_msgSend(v6, "isEqualToString:", v12))
        {
          v8 = v11;

          goto LABEL_11;
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (BOOL)removeUserSwitchTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kUMUserSwitchTaskUUIDKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSwitchTasks](self, "userSwitchTasks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient taskDictionaryInArray:withUUIDString:](self, "taskDictionaryInArray:withUUIDString:", v6, v5));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSwitchTasks](self, "userSwitchTasks"));
    objc_msgSend(v8, "removeObject:", v7);

  }
  else
  {
    NSLog(CFSTR("Client %@ does not have user switch task %@"), self, v4);
  }

  return v7 != 0;
}

- (BOOL)hasUserSwitchTasks
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSwitchTasks](self, "userSwitchTasks"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)addUserSyncTask:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RDClient userSyncTasks](self, "userSyncTasks"));
  objc_msgSend(v5, "addObject:", v4);

}

- (BOOL)removeUserSyncTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kUMUserSwitchTaskUUIDKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSyncTasks](self, "userSyncTasks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient taskDictionaryInArray:withUUIDString:](self, "taskDictionaryInArray:withUUIDString:", v6, v5));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSyncTasks](self, "userSyncTasks"));
    objc_msgSend(v8, "removeObject:", v4);

  }
  else
  {
    NSLog(CFSTR("Client %@ does not have user sync task %@"), self, v4);
  }

  return v7 != 0;
}

- (BOOL)hasUserSyncTasks
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSyncTasks](self, "userSyncTasks"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  RDClient *v7;
  id v8;
  void *v9;
  id v10;
  RDClient *v11;
  _QWORD v12[4];
  RDClient *v13;
  id v14;

  v6 = a4;
  v7 = self;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient proxy](v7, "proxy"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000043D0;
  v12[3] = &unk_10000C400;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "willSwitchToUser:completionHandler:", v8, v12);

}

- (void)personaListDidUpdateCompletionHandler:(id)a3
{
  id v4;
  RDClient *v5;
  void *v6;
  id v7;
  RDClient *v8;
  _QWORD v9[4];
  RDClient *v10;
  id v11;

  v4 = a3;
  v5 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient proxy](v5, "proxy"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000045F0;
  v9[3] = &unk_10000C400;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "personaListDidUpdateCompletionHandler:", v9);

}

- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3
{
  id v4;
  RDClient *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  RDClient *v12;
  _QWORD v13[4];
  RDClient *v14;
  id v15;
  uint64_t v16;
  _DWORD v17[2];

  v4 = a3;
  v5 = self;
  if (qword_100011D28 != -1)
    dispatch_once(&qword_100011D28, &stru_10000C420);
  v6 = (id)qword_100011D20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 0;
    LODWORD(v7) = sub_1000066E0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      v7 = v7;
    else
      v7 = v7 & 0xFFFFFFFE;
    if ((_DWORD)v7)
    {
      v8 = v6;
      v17[0] = 67109120;
      v17[1] = -[RDClient pid](v5, "pid");
      v9 = (void *)_os_log_send_and_compose_impl(v7, &v16, 0, 0, &_mh_execute_header, v8, 0, "RDCLient: calling personaUpdateCallbackForMachServiceCompletionHandler to Pid:%d", v17);

      if (v9)
        sub_1000066E8();
    }
    else
    {
      v9 = 0;
    }
    free(v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient syncProxy](v5, "syncProxy"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004930;
  v13[3] = &unk_10000C400;
  v14 = v5;
  v15 = v4;
  v11 = v4;
  v12 = v5;
  objc_msgSend(v10, "personaUpdateCallbackForMachServiceCompletionHandler:", v13);

}

- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  RDClient *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _DWORD v15[2];

  v6 = a3;
  v7 = a4;
  v8 = self;
  if (qword_100011D28 != -1)
    dispatch_once(&qword_100011D28, &stru_10000C420);
  v9 = (id)qword_100011D20;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 0;
    LODWORD(v10) = sub_1000066E0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v10 = v10;
    else
      v10 = v10 & 0xFFFFFFFE;
    if ((_DWORD)v10)
    {
      v11 = v9;
      v15[0] = 67109120;
      v15[1] = -[RDClient pid](v8, "pid");
      v12 = (void *)_os_log_send_and_compose_impl(v10, &v14, 0, 0, &_mh_execute_header, v11, 0, "RDCLient: calling readyToSwitchToUser to Pid:%d", v15);

      if (v12)
        sub_1000066E8();
    }
    else
    {
      v12 = 0;
    }
    free(v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient proxy](v8, "proxy"));
  objc_msgSend(v13, "readyToSwitchToUser:completionHandler:", v6, v7);

}

- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  RDClient *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _DWORD v15[2];

  v6 = a3;
  v7 = a4;
  v8 = self;
  if (qword_100011D28 != -1)
    dispatch_once(&qword_100011D28, &stru_10000C420);
  v9 = (id)qword_100011D20;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 0;
    LODWORD(v10) = sub_1000066E0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      v10 = v10;
    else
      v10 = v10 & 0xFFFFFFFE;
    if ((_DWORD)v10)
    {
      v11 = v9;
      v15[0] = 67109120;
      v15[1] = -[RDClient pid](v8, "pid");
      v12 = (void *)_os_log_send_and_compose_impl(v10, &v14, 0, 0, &_mh_execute_header, v11, 0, "RDCLient: calling readyToSwitchToLoginSession to Pid:%d", v15);

      if (v12)
        sub_1000066E8();
    }
    else
    {
      v12 = 0;
    }
    free(v12);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient proxy](v8, "proxy"));
  objc_msgSend(v13, "readyToSwitchToLoginSession:completionHandler:", v6, v7);

}

- (void)userSwitchTaskListDidUpdate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RDClient proxy](self, "proxy"));
  objc_msgSend(v2, "userSwitchTaskListDidUpdate");

}

- (void)deviceLoginSessionStateDidUpdate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RDClient proxy](self, "proxy"));
  objc_msgSend(v2, "deviceLoginSessionStateDidUpdate");

}

- (void)uploadContentWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  NSLog(CFSTR("BD: CLIENT IS ABOUT TO SEND UPLOAD CONTENT..."));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RDClient proxy](self, "proxy"));
  objc_msgSend(v5, "uploadContentWithCompletionHandler:", v4);

}

- (void)bubbleDidPop
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RDClient proxy](self, "proxy"));
  objc_msgSend(v2, "bubbleDidPop");

}

- (void)bubbleShouldPop
{
  NSObject *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int16 v8;
  uint64_t v9;

  if (qword_100011D28 != -1)
    dispatch_once(&qword_100011D28, &stru_10000C420);
  v3 = (id)qword_100011D20;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 0;
    v4 = sub_1000066E0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      v5 = v4;
    else
      v5 = v4 & 0xFFFFFFFE;
    if ((_DWORD)v5)
    {
      v8 = 0;
      v6 = (void *)_os_log_send_and_compose_impl(v5, &v9, 0, 0, &_mh_execute_header, v3, 0, "IN bubbleShouldPop: RDClient", &v8, 2);
      if (v6)
        sub_1000066E8();
    }
    else
    {
      v6 = 0;
    }
    free(v6);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient proxy](self, "proxy"));
  objc_msgSend(v7, "bubbleShouldPop");

}

- (void)clearTaskLists
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RDClient userSwitchTasks](self, "userSwitchTasks"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RDClient userSyncTasks](self, "userSyncTasks"));
  objc_msgSend(v4, "removeAllObjects");

}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_machServiceName, a3);
}

- (BOOL)stakeholderIsRegistered
{
  return self->_stakeholderIsRegistered;
}

- (void)setStakeholderIsRegistered:(BOOL)a3
{
  self->_stakeholderIsRegistered = a3;
}

- (BOOL)wasToldWillSwitchUser
{
  return self->_wasToldWillSwitchUser;
}

- (void)setWasToldWillSwitchUser:(BOOL)a3
{
  self->_wasToldWillSwitchUser = a3;
}

- (BOOL)criticalStakeHolder
{
  return self->_criticalStakeHolder;
}

- (void)setCriticalStakeHolder:(BOOL)a3
{
  self->_criticalStakeHolder = a3;
}

- (BOOL)bubbleStakeHolder
{
  return self->_bubbleStakeHolder;
}

- (void)setBubbleStakeHolder:(BOOL)a3
{
  self->_bubbleStakeHolder = a3;
}

- (BOOL)bubblePopstakeholderIsRegistered
{
  return self->_bubblePopstakeholderIsRegistered;
}

- (void)setBubblePopstakeholderIsRegistered:(BOOL)a3
{
  self->_bubblePopstakeholderIsRegistered = a3;
}

- (int)switchStakeHolderKind
{
  return self->_switchStakeHolderKind;
}

- (void)setSwitchStakeHolderKind:(int)a3
{
  self->_switchStakeHolderKind = a3;
}

- (BOOL)personaStakeHolderIsRegistered
{
  return self->_personaStakeHolderIsRegistered;
}

- (void)setPersonaStakeHolderIsRegistered:(BOOL)a3
{
  self->_personaStakeHolderIsRegistered = a3;
}

- (NSMutableArray)userSwitchTasks
{
  return self->_userSwitchTasks;
}

- (void)setUserSwitchTasks:(id)a3
{
  objc_storeStrong((id *)&self->_userSwitchTasks, a3);
}

- (NSMutableArray)userSyncTasks
{
  return self->_userSyncTasks;
}

- (void)setUserSyncTasks:(id)a3
{
  objc_storeStrong((id *)&self->_userSyncTasks, a3);
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (NSXPCConnection)syncXPCConnection
{
  return self->_syncXPCConnection;
}

- (void)setSyncXPCConnection:(id)a3
{
  objc_storeStrong((id *)&self->_syncXPCConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncXPCConnection, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_userSyncTasks, 0);
  objc_storeStrong((id *)&self->_userSwitchTasks, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

@end
