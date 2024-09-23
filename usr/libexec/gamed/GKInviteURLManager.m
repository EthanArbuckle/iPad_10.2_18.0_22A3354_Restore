@implementation GKInviteURLManager

+ (id)sharedManager
{
  id v2;
  NSObject *v3;
  uint8_t v5[16];

  if (!os_log_GKGeneral)
    v2 = (id)GKOSLoggers(a1, a2);
  v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKInviteURLManager sharedManager", v5, 2u);
  }
  if (qword_100317E68 != -1)
    dispatch_once(&qword_100317E68, &stru_1002C0AD0);
  return (id)qword_100317E60;
}

- (GKInviteURLManager)init
{
  GKInviteURLManager *v2;
  void *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKInviteURLManager;
  v2 = -[GKInviteURLManager init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    -[GKInviteURLManager setAcceptingInProgressRecordIDs:](v2, "setAcceptingInProgressRecordIDs:", v3);

    v4 = dispatch_queue_create("com.apple.gamecenter.inviteurlmanager", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    -[GKInviteURLManager setInviteManagerQueue:](v2, "setInviteManagerQueue:", v4);

  }
  return v2;
}

- (BOOL)isRecordEqualToMostRecentInviteShare:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;

  if (!a3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "recordID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GKInviteURLManager mostRecentInviteShareRootRecordID](self, "mostRecentInviteShareRootRecordID"));
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (CKRecordID)mostRecentInviteShareRootRecordID
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000A197C;
  v11 = sub_1000A198C;
  v12 = 0;
  v3 = objc_claimAutoreleasedReturnValue(-[GKInviteURLManager inviteManagerQueue](self, "inviteManagerQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A1994;
  v6[3] = &unk_1002BE9C0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CKRecordID *)v4;
}

- (void)setMostRecentInviteShareRootRecordID:(id)a3
{
  CKRecordID *v4;
  NSObject *v5;
  _QWORD v6[5];
  CKRecordID *v7;

  v4 = (CKRecordID *)a3;
  if (self->_mostRecentInviteShareRootRecordID != v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[GKInviteURLManager inviteManagerQueue](self, "inviteManagerQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000A1A4C;
    v6[3] = &unk_1002BB658;
    v6[4] = self;
    v7 = v4;
    dispatch_barrier_async(v5, v6);

  }
}

- (NSMutableSet)acceptingInProgressRecordIDs
{
  return self->_acceptingInProgressRecordIDs;
}

- (void)setAcceptingInProgressRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_acceptingInProgressRecordIDs, a3);
}

- (OS_dispatch_queue)inviteManagerQueue
{
  return self->_inviteManagerQueue;
}

- (void)setInviteManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_inviteManagerQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inviteManagerQueue, 0);
  objc_storeStrong((id *)&self->_acceptingInProgressRecordIDs, 0);
  objc_storeStrong((id *)&self->_mostRecentInviteShareRootRecordID, 0);
}

@end
