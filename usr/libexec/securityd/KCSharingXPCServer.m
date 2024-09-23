@implementation KCSharingXPCServer

- (KCSharingXPCServer)initWithConnection:(id)a3 allowedProtocol:(id)a4 groupManager:(id)a5 syncController:(id)a6
{
  id v11;
  Protocol *v12;
  id v13;
  id v14;
  KCSharingXPCServer *v15;
  id *p_isa;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  KCSharingXPCServer *v23;
  uint64_t v25;
  NSObject *v26;
  NSString *v27;
  void *v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;

  v11 = a3;
  v12 = (Protocol *)a4;
  v13 = a5;
  v14 = a6;
  v29.receiver = self;
  v29.super_class = (Class)KCSharingXPCServer;
  v15 = -[KCSharingXPCServer init](&v29, "init");
  p_isa = (id *)&v15->super.isa;
  if (!v15)
    goto LABEL_7;
  objc_storeStrong((id *)&v15->_connection, a3);
  objc_storeStrong(p_isa + 2, a4);
  objc_storeStrong(p_isa + 3, a5);
  objc_storeWeak(p_isa + 4, v14);
  if (protocol_isEqual(v12, (Protocol *)&OBJC_PROTOCOL___KCSharingXPCServerProtocol))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___KCSharingXPCServerProtocol));
    v18 = KCSharingSetupServerProtocol();
    v19 = objc_claimAutoreleasedReturnValue(v18);
LABEL_6:
    v21 = (void *)v19;
    objc_msgSend(v11, "setExportedInterface:", v19);

    objc_msgSend(v11, "setExportedObject:", p_isa);
    objc_msgSend(v11, "setDelegate:", p_isa);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___KCSharingXPCClientProtocol));
    objc_msgSend(v11, "setRemoteObjectInterface:", v22);

LABEL_7:
    v23 = p_isa;
    goto LABEL_8;
  }
  if (protocol_isEqual(v12, (Protocol *)&OBJC_PROTOCOL___KCSharingInvitationNotificationProtocol))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___KCSharingInvitationNotificationProtocol));
    v20 = KCSharingSetupInvitationNotificationProtocol();
    v19 = objc_claimAutoreleasedReturnValue(v20);
    goto LABEL_6;
  }
  v25 = KCSharingLogObject(CFSTR("KCSharingXPCServer"));
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = NSStringFromProtocol(v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138543362;
    v31 = v28;
    _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Rejected unsupported protocol %{public}@", buf, 0xCu);

  }
  v23 = 0;
LABEL_8:

  return v23;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  Protocol *v6;
  NSString *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (Protocol *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer allowedProtocol](self, "allowedProtocol"));
  v7 = NSStringFromProtocol(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%@): %@>"), v5, v8, self->_connection));

  return (NSString *)v9;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  void *v17;
  int v18;
  KCSharingXPCServer *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5
    || (v11 = (const char *)objc_msgSend(v9, "selector"),
        (unint64_t)protocol_getMethodDescription(self->_allowedProtocol, v11, 1, 1).name))
  {
    objc_msgSend(v10, "invoke");
  }
  else
  {
    v12 = KCSharingLogObject(CFSTR("KCSharingXPCServer"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v14 = NSStringFromSelector(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = NSStringFromProtocol(self->_allowedProtocol);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = 138543874;
      v19 = self;
      v20 = 2114;
      v21 = v15;
      v22 = 2114;
      v23 = v17;
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "%{public}@ tried to call %{public}@ which isn't part of the allowed protocol %{public}@", (uint8_t *)&v18, 0x20u);

    }
    objc_msgSend(v8, "invalidate");
  }

}

- (void)provisionWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer syncController](self, "syncController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004640;
  v7[3] = &unk_1002DEF60;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "ensureCurrentUserProvisionedWithCompletion:", v7);

}

- (void)fetchCurrentUserIdentifierWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer syncController](self, "syncController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004898;
  v7[3] = &unk_1002DEF88;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchCurrentUserIdentifierWithReply:", v7);

}

- (void)getGroupByGroupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer groupManager](self, "groupManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100127028;
  v10[3] = &unk_1002DEFB0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "getGroupByGroupID:completion:", v7, v10);

}

- (void)getGroupsWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer groupManager](self, "groupManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100126FC4;
  v10[3] = &unk_1002DEFD8;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "handleGroupFetchRequest:completion:", v7, v10);

}

- (void)createGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer groupManager](self, "groupManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100126F60;
  v10[3] = &unk_1002DEFB0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "handleGroupCreateRequest:completion:", v7, v10);

}

- (void)updateGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer groupManager](self, "groupManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100126EFC;
  v10[3] = &unk_1002DEFB0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "handleGroupUpdateRequest:completion:", v7, v10);

}

- (void)leaveGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer groupManager](self, "groupManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100126EB4;
  v10[3] = &unk_1002DEF60;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "handleGroupLeaveRequest:completion:", v7, v10);

}

- (void)deleteGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer groupManager](self, "groupManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100126E6C;
  v10[3] = &unk_1002DEF60;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "handleGroupDeleteRequest:completion:", v7, v10);

}

- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer groupManager](self, "groupManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100126E08;
  v10[3] = &unk_1002DEFB0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "acceptInviteForGroupID:completion:", v7, v10);

}

- (void)declineInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer groupManager](self, "groupManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100126DA4;
  v10[3] = &unk_1002DEFB0;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "declineInviteForGroupID:completion:", v7, v10);

}

- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer groupManager](self, "groupManager"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100126D40;
  v10[3] = &unk_1002EB208;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "checkAvailabilityForHandles:completion:", v7, v10);

}

- (void)setChangeTrackingEnabled:(BOOL)a3 reply:(id)a4
{
  _BOOL4 v4;
  void (**v5)(id, _QWORD);
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  unsigned int v9;
  _DWORD v10[2];

  v4 = a3;
  v5 = (void (**)(id, _QWORD))a4;
  if (v4)
    v6 = 1;
  else
    v6 = 2;
  atomic_store(v6, (unsigned int *)&unk_100340ED0);
  v7 = KCSharingLogObject(CFSTR("KCSharingXPCServer"));
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = atomic_load((unsigned int *)&unk_100340ED0);
    v10[0] = 67109120;
    v10[1] = v9 < 2;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Updated change tracking state=%d", (uint8_t *)v10, 8u);
  }

  v5[2](v5, 0);
}

- (void)fetchRemoteChangesWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer syncController](self, "syncController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100126CF8;
  v7[3] = &unk_1002DEF60;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "fetchRemoteChangesForZoneIDs:completion:", 0, v7);

}

- (void)saveLocalChangesWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer syncController](self, "syncController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100126CB0;
  v7[3] = &unk_1002DEF60;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "saveAllOutgoingChangesWithCompletion:", v7);

}

- (void)wipe:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer syncController](self, "syncController"));
  objc_msgSend(v7, "wipe:completion:", v4, v6);

}

- (void)receivedGroupInvitation:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = a3;
  v4 = KCSharingLogObject(CFSTR("KCSharingXPCServer"));
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "groupID"));
    v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "received group invite for %@", (uint8_t *)&v8, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[KCSharingXPCListenerDelegate sharedInstance](KCSharingXPCListenerDelegate, "sharedInstance"));
  objc_msgSend(v7, "groupsUpdated");

}

- (void)groupInvitationWasCancelled
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v2 = KCSharingLogObject(CFSTR("KCSharingXPCServer"));
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sender cancelled a pending invite", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[KCSharingXPCListenerDelegate sharedInstance](KCSharingXPCListenerDelegate, "sharedInstance"));
  objc_msgSend(v4, "groupsUpdated");

}

- (void)resyncWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer syncController](self, "syncController"));
  objc_msgSend(v5, "resyncFromRPC:completion:", 1, v4);

}

- (void)verifyGroupsInSyncWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer syncController](self, "syncController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100126C60;
  v7[3] = &unk_1002DF000;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "verifyGroupsInSyncWithCompletion:", v7);

}

- (void)performMaintenanceWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingXPCServer syncController](self, "syncController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100126C18;
  v7[3] = &unk_1002DEF60;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performMaintenanceWithCompletion:", v7);

}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (Protocol)allowedProtocol
{
  return self->_allowedProtocol;
}

- (KCSharingDaemonGroupManager)groupManager
{
  return self->_groupManager;
}

- (KCSharingSyncController)syncController
{
  return (KCSharingSyncController *)objc_loadWeakRetained((id *)&self->_syncController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_syncController);
  objc_storeStrong((id *)&self->_groupManager, 0);
  objc_storeStrong((id *)&self->_allowedProtocol, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
