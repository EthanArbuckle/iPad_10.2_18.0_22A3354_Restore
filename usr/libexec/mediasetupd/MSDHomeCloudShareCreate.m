@implementation MSDHomeCloudShareCreate

+ (id)cloudShareForHome:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithHome:", v4);

  return v5;
}

- (MSDHomeCloudShareCreate)initWithHome:(id)a3
{
  id v5;
  MSDHomeCloudShareCreate *v6;
  id *v7;
  MSDHomeCloudShareCreate *v8;
  id v9;
  NSObject *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MSDHomeCloudShareCreate;
  v6 = -[MSDHomeCloudShareCreate self](&v12, "self");
  v7 = (id *)objc_claimAutoreleasedReturnValue(v6);

  if (!v7)
    goto LABEL_4;
  if (v5)
  {
    objc_storeStrong(v7 + 1, a3);
LABEL_4:
    v8 = v7;
    goto LABEL_8;
  }
  v9 = sub_10002E034();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_100010054();

  v8 = 0;
LABEL_8:

  return v8;
}

+ (void)acceptInvitation:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v5 = a3;
  v6 = a4;
  v7 = sub_10002E034();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shareToken"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shareURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "user"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fromUser"));
    *(_DWORD *)buf = 138478595;
    v23 = v9;
    v24 = 2113;
    v25 = v10;
    v26 = 2113;
    v27 = v11;
    v28 = 2113;
    v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Invitation details shareToken %{private}@, shareURL %{private}@, ToUSer %{private}@, fromUSer %{private}@", buf, 0x2Au);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containerID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](CKContainer, "containerWithIdentifier:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shareURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shareToken"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000F020;
  v19[3] = &unk_100049360;
  v20 = v14;
  v21 = v6;
  v17 = v6;
  v18 = v14;
  objc_msgSend(v18, "fetchShareMetadataForShareURL:withShareToken:completion:", v15, v16, v19);

}

- (void)setupShareForHomeParticipant:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  HMHome *home;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  char *v30;
  void *v31;
  MSDFetchCKDataOptions *v32;
  void *v33;
  id v34;
  id v35;
  NSObject *v36;
  _QWORD v37[4];
  id v38;
  MSDHomeCloudShareCreate *v39;
  id v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  HMHome *v46;

  v6 = a3;
  v7 = a4;
  v8 = sub_10002E034();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
    home = self->_home;
    *(_DWORD *)buf = 136315651;
    v42 = "-[MSDHomeCloudShareCreate setupShareForHomeParticipant:completion:]";
    v43 = 2113;
    v44 = v10;
    v45 = 2113;
    v46 = home;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s for recordID %{private}@ and home %{private}@", buf, 0x20u);

  }
  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
    if (objc_msgSend(v12, "isEqualToString:", MSServiceAccountRecordType))
    {

LABEL_9:
      v24 = objc_alloc((Class)CKShare);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "zoneID"));
      v27 = objc_msgSend(v24, "initWithRecordZoneID:", v26);

      v28 = sub_10002E034();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "recordID"));
        *(_DWORD *)buf = 138477827;
        v42 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Created CKShare with recordID %{private}@", buf, 0xCu);

      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "privateCloudDatabase"));

      v32 = objc_alloc_init(MSDFetchCKDataOptions);
      -[MSDFetchCKDataOptions setUserInitiatedRequest:](v32, "setUserInitiatedRequest:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "recordID"));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10000F5A4;
      v37[3] = &unk_100049388;
      v38 = v27;
      v39 = self;
      v40 = v7;
      v34 = v27;
      -[NSObject fetchRecordWithID:withOptions:completion:](v14, "fetchRecordWithID:withOptions:completion:", v33, v32, v37);

      goto LABEL_15;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
    v23 = objc_msgSend(v22, "isEqualToString:", MSDefaultServiceRecordType);

    if ((v23 & 1) != 0)
      goto LABEL_9;
    v35 = sub_10002E034();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_1000101B0();

    v14 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSErrorDomain, 1, 0));
    (*((void (**)(id, _QWORD, NSObject *))v7 + 2))(v7, 0, v14);
  }
  else
  {
    v13 = sub_10002E034();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100010140(v14, v15, v16, v17, v18, v19, v20, v21);
  }
LABEL_15:

}

- (void)shareRecordWithOwner:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  HMHome *home;
  HMHome *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  NSObject *v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  HMHome *v30;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = sub_10002E034();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        home = self->_home;
        *(_DWORD *)buf = 136315651;
        v26 = "-[MSDHomeCloudShareCreate shareRecordWithOwner:completion:]";
        v27 = 2113;
        v28 = v6;
        v29 = 2113;
        v30 = home;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s for record %{private}@ home %{private}@", buf, 0x20u);
      }

      v12 = self->_home;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10000F9F0;
      v23[3] = &unk_1000493B0;
      v24 = v7;
      -[HMHome establishShareWithHomeOwner:container:allowWriteAccess:completionHandler:](v12, "establishShareWithHomeOwner:container:allowWriteAccess:completionHandler:", v6, v13, 1, v23);

      v14 = v24;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100010358();

      v14 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CKErrorDomain, 12, 0));
      (*((void (**)(id, _QWORD, NSObject *))v7 + 2))(v7, 0, v14);
    }
  }
  else
  {
    v15 = sub_10002E034();
    v14 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000102E8(v14, v16, v17, v18, v19, v20, v21, v22);
  }

}

- (void)_handleMultiplePeopleOnShare:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "participants"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "na_firstObjectPassingTest:", &stru_1000493F0));

    if (v9)
    {
      v10 = objc_msgSend(v9, "permission");
      v11 = objc_msgSend(v9, "acceptanceStatus");
      v12 = sub_10002E034();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = CKStringFromParticipantAcceptanceStatus(v11);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = CKStringFromParticipantPermission(v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v24 = 138412546;
        v25 = v15;
        v26 = 2112;
        v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Current Participant status: Acceptance: %@ Permission: %@", (uint8_t *)&v24, 0x16u);

      }
      if (v11 == (id)2 && v10 == (id)3)
      {
        v18 = sub_10002E034();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v24) = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "All Participants in share have accepted with permission read/write", (uint8_t *)&v24, 2u);
        }

        if (v7)
          (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
        goto LABEL_21;
      }
      if (v10 == (id)2)
      {
        objc_msgSend(v9, "setPermission:", 3);
        objc_msgSend(v6, "addParticipant:", v9);
        -[MSDHomeCloudShareCreate _saveRecordAndShare:completion:](self, "_saveRecordAndShare:completion:", v6, v7);
        goto LABEL_21;
      }
      if (v10 != (id)3 || v11 == (id)2)
        goto LABEL_21;
    }
    else
    {
      v22 = sub_10002E034();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_100010410();

    }
    -[MSDHomeCloudShareCreate shareRecordWithOwner:completion:](self, "shareRecordWithOwner:completion:", v6, v7);
LABEL_21:

    goto LABEL_22;
  }
  v20 = sub_10002E034();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    sub_1000103E4();

  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", MSErrorDomain, 1, 0));
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v9);
    goto LABEL_21;
  }
LABEL_22:

}

- (void)_saveRecordAndShare:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](CKContainer, "MSDCloudKitContainer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "privateCloudDatabase"));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000FE90;
  v11[3] = &unk_100049100;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "saveRecord:withOptions:completion:", v7, 0, v11);

}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
}

@end
