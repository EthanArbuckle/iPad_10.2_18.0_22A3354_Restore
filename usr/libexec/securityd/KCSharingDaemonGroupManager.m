@implementation KCSharingDaemonGroupManager

- (KCSharingDaemonGroupManager)initWithSyncController:(id)a3 messagingdConnection:(id)a4
{
  id v6;
  id v7;
  KCSharingDaemonGroupManager *v8;
  uint64_t v9;
  KCSharingStore *sharingStore;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)KCSharingDaemonGroupManager;
  v8 = -[KCSharingDaemonGroupManager init](&v12, "init");
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "store"));
    sharingStore = v8->_sharingStore;
    v8->_sharingStore = (KCSharingStore *)v9;

    objc_storeWeak((id *)&v8->_syncController, v6);
    objc_storeStrong((id *)&v8->_messagingdConnection, a4);
  }

  return v8;
}

- (void)sendGroupsUpdatedNotifications
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  int v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager xpcListenerDelegate](self, "xpcListenerDelegate"));
  objc_msgSend(v2, "groupsUpdated");

  v3 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  v6 = (void *)KCSharingGroupsUpdatedNotification;
  if (v5)
  {
    v7 = 138412290;
    v8 = KCSharingGroupsUpdatedNotification;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "posting notification %@", (uint8_t *)&v7, 0xCu);
  }

  notify_post((const char *)objc_msgSend(v6, "UTF8String"));
}

- (void)getGroupByGroupID:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager fetchLocalShareForGroupID:](self, "fetchLocalShareForGroupID:", v6));
  v9 = v8;
  if (v8)
  {
    v10 = sub_10004D234(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543618;
      v15 = v6;
      v16 = 2112;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Got group for groupID %{public}@: %@", (uint8_t *)&v14, 0x16u);
    }

    v7[2](v7, v11, 0);
  }
  else
  {
    v7[2](v7, 0, 0);
  }

}

- (void)handleGroupFetchRequest:(id)a3 completion:(id)a4
{
  void (**v5)(id, _QWORD, id);
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  void (**v23)(id, _QWORD, id);
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;

  v5 = (void (**)(id, _QWORD, id))a4;
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager sharingStore](self, "sharingStore"));
    v28 = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchAllSharingGroupsInMirrorWithError:", &v28));
    v8 = v28;
    v9 = objc_msgSend(v7, "mutableCopy");

    if (!v9 || v8)
    {
      v18 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v31 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to fetch groups from mirror: %{public}@", buf, 0xCu);
      }

      if (v8)
      {
        v5[2](v5, 0, v8);
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), 20, 0));
        v5[2](v5, 0, v20);

      }
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = v9;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v25;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v25 != v14)
              objc_enumerationMutation(v11);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1)
                                                                               + 8 * (_QWORD)v15), "groupID"));
            objc_msgSend(v10, "addObject:", v16);

            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v13);
      }

      if (objc_msgSend(v11, "count"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager syncController](self, "syncController"));
        objc_msgSend(v17, "setFeatureInUse");

      }
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000C85A4;
      v21[3] = &unk_1002DD100;
      v22 = v11;
      v23 = v5;
      -[KCSharingDaemonGroupManager fetchReceivedPendingGroupsExcludingGroupIDs:completion:](self, "fetchReceivedPendingGroupsExcludingGroupIDs:completion:", v10, v21);

    }
  }

}

- (void)fetchReceivedPendingGroupsExcludingGroupIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  KCSharingDaemonGroupManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager messagingdConnection](self, "messagingdConnection"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000C80F0;
  v11[3] = &unk_1002DD268;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "fetchReceivedInvitesWithCompletion:", v11);

}

- (void)fetchCKShareMetadataForGroupInvites:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v32;
  id obj;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  KCSharingDaemonGroupManager *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v5 = a3;
  v32 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v5, "count")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v5, "count")));
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v12);
        v14 = objc_alloc((Class)CKDeviceToDeviceShareInvitationToken);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "inviteToken"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "shareURL"));
        v17 = objc_msgSend(v14, "initWithSharingInvitationData:shareURL:", v15, v16);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "shareURL"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "shareURL"));
        objc_msgSend(v7, "addObject:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "groupID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "shareURL"));
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, v21);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v10);
  }

  v22 = v7;
  v23 = objc_msgSend(objc_alloc((Class)CKFetchShareMetadataOperation), "initWithShareURLs:invitationTokensByShareURL:", v7, v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager syncController](self, "syncController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "container"));

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000C7BE0;
  v38[3] = &unk_1002DD128;
  v39 = v8;
  v40 = self;
  v26 = objc_alloc_init((Class)NSMutableArray);
  v41 = v26;
  v27 = v8;
  objc_msgSend(v23, "setPerShareMetadataBlock:", v38);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000C7DD8;
  v34[3] = &unk_1002DD150;
  v36 = v26;
  v37 = v32;
  v35 = obj;
  v28 = v26;
  v29 = v32;
  v30 = obj;
  objc_msgSend(v23, "setFetchShareMetadataCompletionBlock:", v34);
  objc_msgSend(v25, "addOperation:", v23);

}

- (void)handleGroupCreateRequest:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;

  if (a4)
  {
    v6 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "group"));
    v8 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupID"));
      *(_DWORD *)buf = 138543362;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Group create request for %{public}@", buf, 0xCu);

    }
    v11 = v7;
    v12 = objc_alloc((Class)CKRecordZoneID);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("group-"), v13));
    v15 = objc_msgSend(v12, "initWithZoneName:ownerName:", v14, CKCurrentUserDefaultName);

    v16 = objc_msgSend(objc_alloc((Class)CKShare), "initWithRecordZoneID:", v15);
    objc_msgSend(v16, "setParticipantSelfRemovalBehavior:", 3);
    sub_10004CF7C(v16, v11);

    -[KCSharingDaemonGroupManager fetchAndUpdateParticipantsForGroup:share:completion:](self, "fetchAndUpdateParticipantsForGroup:share:completion:", v11, v16, v6);
  }
}

- (void)handleGroupUpdateRequest:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;

  v6 = (void (**)(id, _QWORD, void *))a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "group"));
    v8 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupID"));
      v23 = 138543362;
      v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Group update request for %{public}@", (uint8_t *)&v23, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager fetchLocalShareForGroupID:](self, "fetchLocalShareForGroupID:", v11));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "owner"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentUserParticipant"));
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if ((v15 & 1) != 0)
      {
        sub_10004CF7C(v12, v7);
        -[KCSharingDaemonGroupManager fetchAndUpdateParticipantsForGroup:share:completion:](self, "fetchAndUpdateParticipantsForGroup:share:completion:", v7, v12, v6);
LABEL_14:

        goto LABEL_15;
      }
      v19 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupID"));
        v23 = 138543619;
        v24 = v22;
        v25 = 2113;
        v26 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Rejected group update request for non-owned group: %{public}@, %{private}@", (uint8_t *)&v23, 0x16u);

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), 15, 0));
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), 9, 0));
      v17 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupID"));
        v23 = 138543362;
        v24 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to fetch local share for %{public}@", (uint8_t *)&v23, 0xCu);

      }
    }
    v6[2](v6, 0, v16);

    goto LABEL_14;
  }
LABEL_15:

}

- (void)fetchAndUpdateParticipantsForGroup:(id)a3 share:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  KCSharingDaemonGroupManager *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "groupID"));
    *(_DWORD *)buf = 138543875;
    v24 = v13;
    v25 = 2113;
    v26 = v8;
    v27 = 2113;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Fetching and updating participants for %{public}@, %{private}@\n%{private}@", buf, 0x20u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "participants"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000C6F3C;
  v18[3] = &unk_1002DD178;
  v19 = v8;
  v20 = v9;
  v21 = self;
  v22 = v10;
  v15 = v9;
  v16 = v10;
  v17 = v8;
  -[KCSharingDaemonGroupManager fetchShareParticipantsForParticipants:completion:](self, "fetchShareParticipantsForParticipants:completion:", v14, v18);

}

- (void)handleGroupLeaveRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  void *v40;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupID"));
      *(_DWORD *)buf = 138543362;
      v37 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Group leave request for %{public}@", buf, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager fetchLocalShareForGroupID:](self, "fetchLocalShareForGroupID:", v11));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "owner"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentUserParticipant"));
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (!v15)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager sharingStore](self, "sharingStore"));
        v40 = v12;
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
        v35 = 0;
        v24 = objc_msgSend(v22, "stageOutgoingShares:deletionsForShares:error:", 0, v23, &v35);
        v21 = v35;

        if ((v24 & 1) != 0)
        {
          v25 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager syncController](self, "syncController"));
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_1000C6DE0;
          v31[3] = &unk_1002DD1A0;
          v31[4] = self;
          v32 = v12;
          v33 = v6;
          v34 = v7;
          objc_msgSend(v25, "saveStagedOutgoingChangesWithCompletion:", v31);

          goto LABEL_14;
        }
        v26 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupID"));
          *(_DWORD *)buf = 138543618;
          v37 = v30;
          v38 = 2114;
          v39 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to stage outgoing changes for group leave request for %{public}@: %{public}@", buf, 0x16u);

        }
LABEL_13:
        (*((void (**)(id, id))v7 + 2))(v7, v21);
LABEL_14:

        goto LABEL_15;
      }
      v16 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupID"));
        *(_DWORD *)buf = 138543362;
        v37 = v29;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Rejected group leave request for owned group: %{public}@", buf, 0xCu);

      }
      v18 = 15;
    }
    else
    {
      v19 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupID"));
        *(_DWORD *)buf = 138543362;
        v37 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to fetch local share for %{public}@", buf, 0xCu);

      }
      v18 = 9;
    }
    v21 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), v18, 0));
    goto LABEL_13;
  }
LABEL_15:

}

- (void)handleGroupDeleteRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  void *v44;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupID"));
      *(_DWORD *)buf = 138543362;
      v41 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Group delete request for %{public}@", buf, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager fetchLocalShareForGroupID:](self, "fetchLocalShareForGroupID:", v11));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "owner"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentUserParticipant"));
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if ((v15 & 1) != 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager sharingStore](self, "sharingStore"));
        v44 = v12;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));
        v39 = 0;
        v18 = objc_msgSend(v16, "stageOutgoingShares:deletionsForShares:error:", 0, v17, &v39);
        v19 = v39;

        if ((v18 & 1) != 0)
        {
          v20 = sub_10004D234(v12);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager syncController](self, "syncController"));
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_1000C6A5C;
          v34[3] = &unk_1002DD218;
          v34[4] = self;
          v35 = v12;
          v36 = v6;
          v37 = v21;
          v38 = v7;
          v23 = v21;
          objc_msgSend(v22, "saveStagedOutgoingChangesWithCompletion:", v34);

LABEL_16:
          goto LABEL_17;
        }
        v29 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupID"));
          *(_DWORD *)buf = 138543618;
          v41 = v33;
          v42 = 2114;
          v43 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Failed to stage outgoing changes for group delete request for %{public}@: %{public}@", buf, 0x16u);

        }
LABEL_15:
        (*((void (**)(id, id))v7 + 2))(v7, v19);
        goto LABEL_16;
      }
      v27 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupID"));
        *(_DWORD *)buf = 138543362;
        v41 = v32;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Rejected group delete request for non-owned group: %{public}@", buf, 0xCu);

      }
      v26 = 15;
    }
    else
    {
      v24 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupID"));
        *(_DWORD *)buf = 138543362;
        v41 = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to fetch local share for %{public}@", buf, 0xCu);

      }
      v26 = 9;
    }
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), v26, 0));
    goto LABEL_15;
  }
LABEL_17:

}

- (id)translateSyncErrorForGroupRequest:(id)a3 zoneID:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  _BYTE v33[128];

  v5 = a3;
  v6 = a4;
  if (!v5)
    goto LABEL_19;
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  if (v7 != CFSTR("KCSharingErrorDomain"))
  {

LABEL_19:
    v22 = v5;
    goto LABEL_20;
  }
  v8 = objc_msgSend(v5, "code");

  if (v8 != (id)14)
    goto LABEL_19;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", NSMultipleUnderlyingErrorsKey));

  if (!v10 || !objc_msgSend(v10, "count"))
  {
    v22 = v5;
    goto LABEL_30;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (!v12)
    goto LABEL_16;
  v13 = v12;
  v14 = *(_QWORD *)v28;
  v26 = v10;
  while (2)
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(_QWORD *)v28 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
      if ((CKErrorIsCode(v16, 2) & 1) == 0)
      {
        v22 = v5;
        v10 = v26;
LABEL_29:

        goto LABEL_30;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CKPartialErrorsByItemIDKey));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v6));

      if (v19)
      {
        if (CKErrorIsCode(v19, 3))
        {
          v24 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
          v25 = objc_claimAutoreleasedReturnValue(v24);
          v10 = v26;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v32 = v6;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Sync error translation: seems we were offline for zoneID=%{public}@, returning translated error", buf, 0xCu);
          }

          v22 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("KCSharingErrorDomain"), 36, 0));
        }
        else
        {
          v22 = v5;
          v10 = v26;
        }

        goto LABEL_29;
      }
    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    v10 = v26;
    if (v13)
      continue;
    break;
  }
LABEL_16:

  v20 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v32 = v6;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Sync error translation: zoneID=%{public}@ did not error, returning nil", buf, 0xCu);
  }

  v22 = 0;
LABEL_30:

LABEL_20:
  return v22;
}

- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  KCSharingDaemonGroupManager *v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Accepting group invite for %{public}@", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager messagingdConnection](self, "messagingdConnection"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000C68BC;
    v11[3] = &unk_1002DD1C8;
    v14 = v7;
    v12 = v6;
    v13 = self;
    objc_msgSend(v10, "fetchReceivedInviteWithGroupID:completion:", v12, v11);

  }
}

- (void)acceptGroupInvite:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  KCSharingDaemonGroupManager *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupID"));
    *(_DWORD *)buf = 138543619;
    v20 = v10;
    v21 = 2113;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Accepting invite for %{public}@: %{private}@", buf, 0x16u);

  }
  v18 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000C5FB4;
  v14[3] = &unk_1002DD268;
  v16 = self;
  v17 = v7;
  v15 = v6;
  v12 = v7;
  v13 = v6;
  -[KCSharingDaemonGroupManager fetchCKShareMetadataForGroupInvites:completion:](self, "fetchCKShareMetadataForGroupInvites:completion:", v11, v14);

}

- (void)declineInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  KCSharingDaemonGroupManager *v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Declining group invite for %{public}@", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager messagingdConnection](self, "messagingdConnection"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000C5DE8;
    v11[3] = &unk_1002DD1C8;
    v14 = v7;
    v12 = v6;
    v13 = self;
    objc_msgSend(v10, "fetchReceivedInviteWithGroupID:completion:", v12, v11);

  }
}

- (void)declineGroupInvite:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  KCSharingDaemonGroupManager *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupID"));
    *(_DWORD *)buf = 138543619;
    v20 = v10;
    v21 = 2113;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Declining invite for group: %{public}@, %{private}@", buf, 0x16u);

  }
  v18 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000C557C;
  v14[3] = &unk_1002DD268;
  v16 = self;
  v17 = v7;
  v15 = v6;
  v12 = v7;
  v13 = v6;
  -[KCSharingDaemonGroupManager fetchCKShareMetadataForGroupInvites:completion:](self, "fetchCKShareMetadataForGroupInvites:completion:", v11, v14);

}

- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(objc_alloc((Class)KCSharingParticipant), "initWithHandle:permissionLevel:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v14), 0);
        objc_msgSend(v9, "addObject:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000C52F4;
  v18[3] = &unk_1002DEF10;
  v19 = v10;
  v20 = v6;
  v16 = v10;
  v17 = v6;
  -[KCSharingDaemonGroupManager fetchShareParticipantsForParticipants:completion:](self, "fetchShareParticipantsForParticipants:completion:", v9, v18);

}

- (id)fetchLocalShareForGroupID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager sharingStore](self, "sharingStore"));
  v11 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchCKShareFromMirrorForGroupID:error:", v4, &v11));
  v7 = v11;

  if (!v6 || v7)
  {
    v8 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v13 = v4;
      v14 = 2114;
      v15 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to find local share for groupID %{public}@ (%{public}@)", buf, 0x16u);
    }

  }
  return v6;
}

- (void)fetchShareParticipantsForParticipants:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  _BOOL4 v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  void *v22;
  id v23;
  unsigned int v24;
  id v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  unsigned int v31;
  id v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  void *v43;
  id v44;
  KCSharingDaemonGroupManager *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  __int128 *v49;
  _QWORD v50[4];
  id v51;
  __int128 *p_buf;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 buf;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];

  v6 = a3;
  v43 = v6;
  v44 = a4;
  if (v44)
  {
    if (v6 && objc_msgSend(v6, "count"))
    {
      v45 = self;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v6, "count")));
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v58 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "handle"));
            v14 = v13 == 0;

            if (v14)
            {
              v16 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
              v15 = objc_claimAutoreleasedReturnValue(v16);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                LODWORD(buf) = 138477827;
                *(_QWORD *)((char *)&buf + 4) = v12;
                _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Skipping participant without handle. This is a bug! %{private}@", (uint8_t *)&buf, 0xCu);
              }
            }
            else
            {
              v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "handle"));
              objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v15);
            }

          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
        }
        while (v9);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingDaemonGroupManager syncController](v45, "syncController"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "container"));

      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v8, "count")));
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v18 = v8;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v54;
        do
        {
          for (j = 0; j != v19; j = (char *)j + 1)
          {
            if (*(_QWORD *)v54 != v20)
              objc_enumerationMutation(v18);
            v22 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)j);
            if ((objc_msgSend(v22, "isCurrentUser") & 1) == 0)
            {
              v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "handle"));
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v24 = objc_msgSend(v23, "_appearsToBeEmail");

                if (v24)
                {
                  v25 = objc_alloc((Class)CKUserIdentityLookupInfo);
                  v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "handle"));
                  v27 = objc_msgSend(v25, "initWithEmailAddress:", v26);
                  objc_msgSend(v46, "addObject:", v27);

LABEL_35:
                  continue;
                }
              }
              else
              {
                v28 = KCSharingLogObject(CFSTR("KCSharingRecord"));
                v29 = objc_claimAutoreleasedReturnValue(v28);
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(buf) = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "IMFoundation not linked correctly. Returning NO from KCSharingHandleIsEmail", (uint8_t *)&buf, 2u);
                }

              }
              v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "handle"));
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v31 = objc_msgSend(v30, "_appearsToBePhoneNumber");

                if (v31)
                {
                  v32 = objc_alloc((Class)CKUserIdentityLookupInfo);
                  v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "handle"));
                  v33 = objc_msgSend(v32, "initWithPhoneNumber:", v26);
                  objc_msgSend(v46, "addObject:", v33);

                  goto LABEL_35;
                }
              }
              else
              {
                v34 = KCSharingLogObject(CFSTR("KCSharingRecord"));
                v35 = objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(buf) = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "IMFoundation not linked correctly. Returning NO from KCSharingHandleIsPhoneNumber", (uint8_t *)&buf, 2u);
                }

              }
              v36 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
              v26 = objc_claimAutoreleasedReturnValue(v36);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "handle"));
                LODWORD(buf) = 138477827;
                *(_QWORD *)((char *)&buf + 4) = v37;
                _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Participant handle %{private}@ appears to be neither an email or phone number, not looking it up in CloudKit", (uint8_t *)&buf, 0xCu);

              }
              goto LABEL_35;
            }
          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
        }
        while (v19);
      }

      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v62 = 0x3032000000;
      v63 = sub_1000C4F74;
      v64 = sub_1000C4F84;
      v65 = (id)0xAAAAAAAAAAAAAAAALL;
      v65 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v18, "count")));
      v38 = objc_msgSend(objc_alloc((Class)CKFetchShareParticipantsOperation), "initWithUserIdentityLookupInfos:", v46);
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_1000C4F8C;
      v50[3] = &unk_1002DD2E0;
      v39 = v7;
      v51 = v39;
      p_buf = &buf;
      objc_msgSend(v38, "setPerShareParticipantCompletionBlock:", v50);
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      v47[2] = sub_1000C5204;
      v47[3] = &unk_1002DD308;
      v48 = v44;
      v49 = &buf;
      objc_msgSend(v38, "setFetchShareParticipantsCompletionBlock:", v47);
      objc_msgSend(v42, "addOperation:", v38);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v40 = KCSharingLogObject(CFSTR("KCSharingDaemonGroupManager"));
      v41 = objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "No or empty participant list for which to fetch share participants", (uint8_t *)&buf, 2u);
      }

      v39 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
      (*((void (**)(id, id, _QWORD))v44 + 2))(v44, v39, 0);
    }

  }
}

- (KCSharingXPCListenerDelegate)xpcListenerDelegate
{
  return (KCSharingXPCListenerDelegate *)objc_loadWeakRetained((id *)&self->_xpcListenerDelegate);
}

- (void)setXpcListenerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_xpcListenerDelegate, a3);
}

- (KCSharingStore)sharingStore
{
  return self->_sharingStore;
}

- (void)setSharingStore:(id)a3
{
  objc_storeStrong((id *)&self->_sharingStore, a3);
}

- (KCSharingSyncController)syncController
{
  return (KCSharingSyncController *)objc_loadWeakRetained((id *)&self->_syncController);
}

- (void)setSyncController:(id)a3
{
  objc_storeWeak((id *)&self->_syncController, a3);
}

- (KCSharingMessagingdConnection)messagingdConnection
{
  return self->_messagingdConnection;
}

- (void)setMessagingdConnection:(id)a3
{
  objc_storeStrong((id *)&self->_messagingdConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagingdConnection, 0);
  objc_destroyWeak((id *)&self->_syncController);
  objc_storeStrong((id *)&self->_sharingStore, 0);
  objc_destroyWeak((id *)&self->_xpcListenerDelegate);
}

+ (id)sharedInstance
{
  if (qword_100341070 != -1)
    dispatch_once(&qword_100341070, &stru_1002DD0D8);
  return (id)qword_100341078;
}

@end
