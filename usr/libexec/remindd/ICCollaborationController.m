@implementation ICCollaborationController

- (ICCollaborationController)initWithCloudContext:(id)a3
{
  id v4;
  ICCollaborationController *v5;
  ICCollaborationController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICCollaborationController;
  v5 = -[ICCollaborationController init](&v8, "init");
  v6 = v5;
  if (v5)
    -[ICCollaborationController setCloudContext:](v5, "setCloudContext:", v4);

  return v6;
}

- (id)fetchShareForObjectWithManagedObjectID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  ICCollaborationController *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100072DD0;
  v20 = sub_100072DE0;
  v21 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
  v6 = objc_msgSend(v5, "newBackgroundContext");

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100072DE8;
  v11[3] = &unk_1007DA0F8;
  v7 = v4;
  v12 = v7;
  v8 = v6;
  v14 = self;
  v15 = &v16;
  v13 = v8;
  objc_msgSend(v8, "performBlockAndWait:", v11);
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (void)createShareForObjectWithManagedObjectID:(id)a3 appIconData:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  ICCollaborationController *v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
  v15 = objc_msgSend(v14, "newBackgroundContext");

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100072FF4;
  v21[3] = &unk_1007DA1B0;
  v22 = v10;
  v23 = v15;
  v24 = self;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  v20 = v10;
  objc_msgSend(v19, "performBlockAndWait:", v21);

}

- (id)rootRecordForObject:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ckServerRecord"));
  v5 = objc_msgSend(v4, "copy");

  if (!v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_1006827C0(v3, v6);

    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "newlyCreatedRecord"));
  }

  return v5;
}

- (id)newShareForObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController rootRecordForObject:](self, "rootRecordForObject:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ckServerRecord"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "share"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "recordID"));

  v9 = objc_alloc((Class)CKShare);
  if (v8)
  {
    v10 = objc_msgSend(v9, "initWithRootRecord:shareID:", v5, v8);
    v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_loggingDescription"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortLoggingDescription"));
      v18 = 138412546;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v14 = "Created share %@ with existing share reference for %@";
      v15 = v11;
      v16 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v18, 0x16u);

    }
  }
  else
  {
    v10 = objc_msgSend(v9, "initWithRootRecord:", v5);
    v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ic_loggingDescription"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortLoggingDescription"));
      v18 = 138412546;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v14 = "Created share %@ for %@";
      v15 = v11;
      v16 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_6;
    }
  }

  -[ICCollaborationController populateShare:withObject:](self, "populateShare:withObject:", v10, v4);
  return v10;
}

- (void)populateShare:(id)a3 withObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shareTitle"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CKShareTitleKey);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shareType"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CKShareTypeKey);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordID"));
  if (v9)
  {
    v10 = objc_msgSend(objc_alloc((Class)CKReference), "initWithRecordID:action:", v9, 0);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("RootRecord"));
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ic_loggingDescription"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortLoggingDescription"));
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Trying to populate share %@ with no record ID for %@"), v11, v12));

    objc_msgSend((id)objc_opt_class(ICCloudContext), "faultAndPromptToFileRadarWithICTap2RadarType:title:description:logMessage:", 5, CFSTR("populateShare with nil recordID"), &stru_1007FE210, v10);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "recordType"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("RootRecordType"));
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      sub_100682840();
  }

}

- (id)existingShareForObject:(id)a3
{
  id v4;
  NSString *(__cdecl **v5)(SEL);
  NSObject *v6;
  void *v7;
  id v8;
  void *i;
  NSObject *v10;
  void *v11;
  void *v12;
  NSString *(__cdecl **v13)(SEL);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  ICCollaborationController *v40;
  void *v41;
  void *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;

  v4 = a3;
  v5 = &NSStringFromSelector_ptr;
  v6 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shortLoggingDescription"));
    *(_DWORD *)buf = 138412290;
    v44 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Checking for an existing share for %@", buf, 0xCu);

  }
  v8 = v4;
  v41 = v8;
  if (v8)
  {
    v40 = self;
    for (i = v8; ; i = v23)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5[281], "cloudkitCollaboration"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "shortLoggingDescription"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "ckServerShare"));
        v13 = v5;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "ic_loggingDescription"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "ckServerRecord"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "share"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recordID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ic_loggingDescription"));
        *(_DWORD *)buf = 138412802;
        v44 = v11;
        v45 = 2112;
        v46 = v14;
        v47 = 2112;
        v48 = v18;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Checking for share on %@ serverShare=%@ serverRecord.share=%@", buf, 0x20u);

        v5 = v13;
      }

      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(i, "ckServerShare"));
      if (v19)
      {
        v29 = (void *)v19;
        -[ICCollaborationController populateShare:withObject:](v40, "populateShare:withObject:", v19, i);
        goto LABEL_21;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "ckServerRecord"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "share"));

      if (v21)
        break;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "parentCloudObject"));
      v23 = v22;
      if (!v22)
        goto LABEL_19;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "recordID"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "zoneID"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "recordID"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "zoneID"));
      v28 = objc_msgSend(v25, "isEqual:", v27);

      if ((v28 & 1) == 0)
      {
        v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5[281], "cloudkitCollaboration"));
        if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "shortLoggingDescription"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "shortLoggingDescription"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "recordID"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "zoneID"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "ic_loggingDescription"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(i, "recordID"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "zoneID"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "ic_loggingDescription"));
          *(_DWORD *)buf = 138413058;
          v44 = v33;
          v45 = 2112;
          v46 = v34;
          v47 = 2112;
          v48 = v36;
          v49 = 2112;
          v50 = v39;
          _os_log_fault_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_FAULT, "Not checking parent object %@ for %@ because it's not in the same zone (object in %@ and parent in %@)", buf, 0x2Au);

        }
LABEL_19:

        goto LABEL_20;
      }

    }
    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5[281], "cloudkitCollaboration"));
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_1006828D0(buf, v41, &v44, v30);

  }
LABEL_20:
  i = 0;
  v29 = 0;
LABEL_21:

  return v29;
}

- (void)prepareShare:(id)a3 forObject:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  ICCollaborationController *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ic_loggingDescription"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shortLoggingDescription"));
    *(_DWORD *)buf = 138412546;
    v26 = v12;
    v27 = 2112;
    v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Preparing share %@ for %@", buf, 0x16u);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedObjectContext"));
  -[ICCollaborationController setObjectContext:](self, "setObjectContext:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recordID"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100073F00;
  v20[3] = &unk_1007D8C08;
  v21 = v9;
  v22 = self;
  v23 = v8;
  v24 = v10;
  v17 = v10;
  v18 = v8;
  v19 = v9;
  objc_msgSend(v15, "finishOperationsForRecordID:completionHandler:", v16, v20);

}

- (void)saveShare:(id)a3 forObject:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  ICCollaborationController *v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[24];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v9)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      sub_100682990(v15, v16, v17);

  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100072DD0;
  v28 = sub_100072DE0;
  v29 = (id)objc_claimAutoreleasedReturnValue(-[ICCollaborationController rootRecordForObject:](self, "rootRecordForObject:", v9));
  v11 = v25[5];
  if (v11)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100074390;
    v18[3] = &unk_1007DA200;
    v19 = v9;
    v20 = self;
    v21 = v8;
    v23 = &v24;
    v22 = v10;
    -[ICCollaborationController saveShare:withRootRecord:object:completionHandler:](self, "saveShare:withRootRecord:object:completionHandler:", v21, v11, v19, v18);

    v12 = v19;
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shortLoggingDescription"));
      sub_100682944(v14, (uint64_t)v30, v13);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminders"), 208, 0));
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v12);
  }

  _Block_object_dispose(&v24, 8);
}

- (void)saveShare:(id)a3 withRootRecord:(id)a4 object:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id location;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  _QWORD v50[2];

  v32 = a3;
  v33 = a4;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "accountCKIdentifier"));
  if (objc_msgSend(v12, "length"))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController containerForAccountID:](self, "containerForAccountID:", v12));
    v13 = objc_alloc((Class)CKModifyRecordsOperation);
    v50[0] = v32;
    v50[1] = v33;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 2));
    v15 = objc_msgSend(v13, "initWithRecordsToSave:recordIDsToDelete:", v14, 0);

    objc_msgSend(v15, "setQualityOfService:", 17);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "privateCloudDatabase"));
    objc_msgSend(v15, "setDatabase:", v16);

    objc_initWeak(&location, v15);
    v17 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ic_loggingDescription"));
      v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "ic_loggingDescription"));
      v20 = objc_loadWeakRetained(&location);
      v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "ic_loggingDescription"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckIdentifier"));
      *(_DWORD *)buf = 138413058;
      v43 = v18;
      v44 = 2112;
      v45 = v19;
      v46 = 2114;
      v47 = v21;
      v48 = 2114;
      v49 = v22;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Saving Share: %@ with root record: %@ %{public}@ %{public}@", buf, 0x2Au);

    }
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100074A30;
    v34[3] = &unk_1007DA2B8;
    objc_copyWeak(&v40, &location);
    v35 = v10;
    v36 = v33;
    v37 = v12;
    v38 = v32;
    v39 = v11;
    objc_msgSend(v15, "setModifyRecordsCompletionBlock:", v34);
    v23 = objc_alloc_init((Class)CKOperationGroup);
    objc_msgSend(v23, "setName:", CFSTR("SaveShare"));
    objc_msgSend(v23, "setQuantity:", 1);
    objc_msgSend(v23, "setExpectedSendSize:", 1);
    objc_msgSend(v23, "setExpectedReceiveSize:", 1);
    objc_msgSend(v15, "setGroup:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "database"));
    objc_msgSend(v24, "addOperation:", v15);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);

    goto LABEL_9;
  }
  v25 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ckIdentifier"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "ic_loggingDescription"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "recordID"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "ic_loggingDescription"));
    *(_DWORD *)buf = 138543874;
    v43 = v27;
    v44 = 2112;
    v45 = v28;
    v46 = 2112;
    v47 = v30;
    _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Trying to saveShare with nil or empty accountID: ckIdentifier: %{public}@, share: %@, rootRecordID: %@", buf, 0x20u);

  }
  if (v11)
  {
    v26 = ICGenericError();
    v31 = (void *)objc_claimAutoreleasedReturnValue(v26);
    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v31);
LABEL_9:

  }
}

- (void)fetchShareIfNecessaryForObject:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  id v33;
  ICCollaborationController *v34;
  id v35;
  id v36;
  id v37;
  id location;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accountCKIdentifier"));
  if (objc_msgSend(v8, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ckServerRecord"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "share"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordID"));

    if (v11
      && (v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ckServerShare")), v12, !v12))
    {
      v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ckServerRecord"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "share"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "recordID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ic_loggingDescription"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "shortLoggingDescription"));
        *(_DWORD *)buf = 138412546;
        v41 = v17;
        v42 = 2112;
        v43 = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Need to fetch share %@ for %@", buf, 0x16u);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "containerForAccountID:", v8));

      v21 = objc_alloc((Class)CKFetchRecordsOperation);
      v39 = v11;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
      v23 = objc_msgSend(v21, "initWithRecordIDs:", v22);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "databaseWithDatabaseScope:", objc_msgSend(v11, "rd_ckDatabaseScope")));
      objc_msgSend(v23, "setDatabase:", v24);

      objc_msgSend(v23, "setQueuePriority:", 8);
      objc_msgSend(v23, "setQualityOfService:", 17);
      objc_initWeak(&location, v23);
      v25 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ic_loggingDescription"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "ic_loggingDescription"));
        *(_DWORD *)buf = 138412546;
        v41 = v26;
        v42 = 2112;
        v43 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Fetching share %@ with %@", buf, 0x16u);

      }
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10007577C;
      v31[3] = &unk_1007DA2E0;
      v11 = v11;
      v32 = v11;
      objc_copyWeak(&v37, &location);
      v33 = v6;
      v34 = self;
      v35 = v8;
      v36 = v7;
      objc_msgSend(v23, "setFetchRecordsCompletionBlock:", v31);
      v28 = objc_alloc_init((Class)CKOperationGroup);
      objc_msgSend(v28, "setName:", CFSTR("FetchShare"));
      objc_msgSend(v28, "setQuantity:", 1);
      objc_msgSend(v28, "setExpectedSendSize:", 1);
      objc_msgSend(v28, "setExpectedReceiveSize:", 1);
      objc_msgSend(v23, "setGroup:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "database"));
      objc_msgSend(v29, "addOperation:", v23);

      objc_destroyWeak(&v37);
      objc_destroyWeak(&location);

    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    }
    goto LABEL_14;
  }
  v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    sub_100682D88(v6, v13);

  if (v7)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.reminders"), 214, 0));
    (*((void (**)(id, id))v7 + 2))(v7, v11);
LABEL_14:

  }
}

- (void)didSaveShare:(id)a3 accountID:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100075A98;
  v12[3] = &unk_1007D8D60;
  v13 = a5;
  v14 = a6;
  v10 = v14;
  v11 = v13;
  -[ICCollaborationController saveServerShare:accountID:completionHandler:](self, "saveServerShare:accountID:completionHandler:", a3, a4, v12);

}

- (void)saveServerShare:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
  v12 = objc_msgSend(v11, "newBackgroundContext");

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100075C40;
  v17[3] = &unk_1007D8E78;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v12;
  v21 = v10;
  v13 = v10;
  v14 = v12;
  v15 = v9;
  v16 = v8;
  objc_msgSend(v14, "performBlockAndWait:", v17);

}

- (id)objectForShare:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RootRecord")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "recordID"));
  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("RootRecordType")));
    if (!v13)
    {
      v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        sub_100682E8C(v8, v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "existingCloudObjectForRecordID:recordType:accountID:context:", v12, v13, v9, v10));

  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      sub_100682E0C(v8, v13);
    v16 = 0;
  }

  return v16;
}

- (void)didStopSharing:(id)a3 accountID:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  -[ICCollaborationController didStopSharing:recordID:accountID:queue:completionHandler:](self, "didStopSharing:recordID:accountID:queue:completionHandler:", a3, 0, a4, a5, a6);
}

- (void)didStopSharingRecordID:(id)a3 accountID:(id)a4 queue:(id)a5 completionHandler:(id)a6
{
  -[ICCollaborationController didStopSharing:recordID:accountID:queue:completionHandler:](self, "didStopSharing:recordID:accountID:queue:completionHandler:", 0, a3, a4, a5, a6);
}

- (void)didStopSharing:(id)a3 recordID:(id)a4 accountID:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  unint64_t v12;
  unint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  ICCollaborationController *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[16];

  v12 = (unint64_t)a3;
  v13 = (unint64_t)a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12 | v13)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
    v18 = objc_msgSend(v17, "newBackgroundContext");

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100076104;
    v20[3] = &unk_1007DA308;
    v21 = (id)v12;
    v22 = self;
    v23 = v14;
    v24 = v18;
    v25 = (id)v13;
    v26 = v15;
    v27 = v16;
    v19 = v18;
    -[NSObject performBlockAndWait:](v19, "performBlockAndWait:", v20);

  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "didStopSharing: Invalid arguments, share or recordID must be non-nil.", buf, 2u);
    }
  }

}

- (void)acceptShareWithMetadata:(id)a3 callbackQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 *v48;
  _QWORD v49[5];
  id v50;
  __int128 *p_buf;
  uint8_t v52[4];
  void *v53;
  __int16 v54;
  id v55;
  __int128 buf;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Accepting share for metadata %@", (uint8_t *)&buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
  v13 = objc_msgSend(v12, "newBackgroundContext");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "callingParticipant"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userIdentity"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "userRecordID"));

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v57 = 0x3032000000;
  v58 = sub_100072DD0;
  v59 = sub_100072DE0;
  v60 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "containersByAccountID"));
  v19 = objc_msgSend(v18, "count") == 0;

  if (v19)
    goto LABEL_7;
  v20 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v52 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Accepting share: Accounts detected. Fetching container and accountID.", v52, 2u);
  }

  v21 = objc_claimAutoreleasedReturnValue(+[RDDispatchQueue_ObjC utilityQueue](_TtC7remindd20RDDispatchQueue_ObjC, "utilityQueue"));
  dispatch_assert_queue_not_V2(v21);

  v22 = objc_claimAutoreleasedReturnValue(+[RDDispatchQueue_ObjC xpcDefaultQueue](_TtC7remindd20RDDispatchQueue_ObjC, "xpcDefaultQueue"));
  dispatch_assert_queue_not_V2(v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController containerForUserRecordID:](self, "containerForUserRecordID:", v16));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "options"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "accountOverrideInfo"));
  v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "accountID"));
  v27 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v26;

  if (!v23)
  {
LABEL_7:
    v28 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Accepting share: Single account or unable to fetch container. Using containerWithIdentifier.", v52, 2u);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerIdentifier"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer containerWithIdentifier:](CKContainer, "containerWithIdentifier:", v29));

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "options"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "accountOverrideInfo"));
    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "accountID"));
    v33 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v32;

  }
  if (!objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "length"))
  {
    v34 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "recordName"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "containersByAccountID"));
      v39 = objc_msgSend(v38, "count");
      *(_DWORD *)v52 = 138543618;
      v53 = v40;
      v54 = 2048;
      v55 = v39;
      _os_log_fault_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_FAULT, "Accepting share: Unable to fetch account ID. Using primaryCloudKitAccountInContext. userRecordName=%{public}@, containers.count=%lu", v52, 0x16u);

    }
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1000769C0;
    v49[3] = &unk_1007D7D08;
    p_buf = &buf;
    v49[4] = self;
    v50 = v13;
    objc_msgSend(v50, "performBlockAndWait:", v49);

  }
  if (!v23)
  {
    v35 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_100682F0C();
    goto LABEL_22;
  }
  if (!objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "length"))
  {
    v35 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_100682F70();
LABEL_22:

    v36 = ICGenericError();
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    (*((void (**)(id, void *, _QWORD, _QWORD))v10 + 2))(v10, v37, 0, 0);

    goto LABEL_23;
  }
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100076A40;
  v42[3] = &unk_1007DA3D0;
  v42[4] = self;
  v43 = v8;
  v48 = &buf;
  v44 = v13;
  v45 = v9;
  v47 = v10;
  v46 = v23;
  objc_msgSend(v44, "performBlockAndWait:", v42);

LABEL_23:
  _Block_object_dispose(&buf, 8);

}

- (id)containerForUserRecordID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  void *v30;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "recordName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containersByAccountID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));

  v8 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "containersByAccountID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
    *(_DWORD *)buf = 138543362;
    v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "containerForUserRecordID accountIDs=%{public}@", buf, 0xCu);

  }
  v12 = objc_claimAutoreleasedReturnValue(+[RDDispatchQueue_ObjC utilityQueue](_TtC7remindd20RDDispatchQueue_ObjC, "utilityQueue"));
  dispatch_assert_queue_not_V2(v12);

  v13 = objc_claimAutoreleasedReturnValue(+[RDDispatchQueue_ObjC xpcDefaultQueue](_TtC7remindd20RDDispatchQueue_ObjC, "xpcDefaultQueue"));
  dispatch_assert_queue_not_V2(v13);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v7;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v17 = *(_QWORD *)v25;
    *(_QWORD *)&v16 = 138543362;
    v23 = v16;
    while (2)
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICCloudContext userRecordNameForContainer:](ICCloudContext, "userRecordNameForContainer:", v19, v23, (_QWORD)v24));
        v21 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v23;
          v30 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "containerForUserRecordID containerUserRecordName=%{public}@", buf, 0xCu);
        }

        if (objc_msgSend(v20, "isEqualToString:", v4))
        {
          v15 = v19;

          goto LABEL_15;
        }

      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v15)
        continue;
      break;
    }
  }
LABEL_15:

  return v15;
}

- (id)containerForAccountID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containersByAccountID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_100682FD4(v8);

    v7 = 0;
  }

  return v7;
}

- (void)acceptShareWithMetadata:(id)a3 container:(id)a4 accountID:(id)a5 fetchObjectWithCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  ICCollaborationController *v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id location;
  id v46;
  uint8_t buf[4];
  id v48;
  __int16 v49;
  id v50;

  v10 = a3;
  v33 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "share"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URL"));

  if (!v34)
  {
    v29 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      sub_100683014(v29, v30, v31);

  }
  v14 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v48 = v34;
    v49 = 2114;
    v50 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Accepting shared object at URL: %@, account ID = %{public}@", buf, 0x16u);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[ICCollaborationController cloudContext](self, "cloudContext"));
  v15 = objc_alloc((Class)CKAcceptSharesOperation);
  v46 = v10;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
  v17 = objc_msgSend(v15, "initWithShareMetadatas:", v16);

  objc_msgSend(v17, "setQualityOfService:", 17);
  objc_msgSend(v17, "setQueuePriority:", 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "configuration"));
  objc_msgSend(v18, "setContainer:", v33);

  objc_initWeak(&location, v17);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000776C4;
  v43[3] = &unk_1007DA3F8;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v44 = v19;
  objc_msgSend(v17, "setPerShareCompletionBlock:", v43);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100077718;
  v36[3] = &unk_1007DA470;
  v20 = v10;
  v37 = v20;
  objc_copyWeak(&v42, &location);
  v21 = v12;
  v41 = v21;
  v32 = v11;
  v38 = v32;
  v39 = self;
  v22 = v19;
  v40 = v22;
  objc_msgSend(v17, "setAcceptSharesCompletionBlock:", v36);
  v23 = objc_alloc_init((Class)CKOperationGroup);
  objc_msgSend(v23, "setName:", CFSTR("AcceptShare"));
  objc_msgSend(v23, "setQuantity:", 1);
  objc_msgSend(v23, "setExpectedSendSize:", 1);
  objc_msgSend(v23, "setExpectedReceiveSize:", 1);
  objc_msgSend(v17, "setGroup:", v23);
  v24 = objc_claimAutoreleasedReturnValue(+[REMLog cloudkitCollaboration](REMLog, "cloudkitCollaboration"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "share"));
    v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ic_loggingDescription"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ic_loggingDescription"));
    *(_DWORD *)buf = 138412546;
    v48 = v26;
    v49 = 2112;
    v50 = v27;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Accepting %@ with %@", buf, 0x16u);

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "operationQueue"));
  objc_msgSend(v28, "addOperation:", v17);

  objc_msgSend(v35, "errorAndPromptToFileRadarWithICTap2RadarTypeTooManyOperationsInOperationQueueIfNecessary");
  objc_destroyWeak(&v42);

  objc_destroyWeak(&location);
}

- (ICCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (NSManagedObjectContext)objectContext
{
  return self->_objectContext;
}

- (void)setObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_objectContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectContext, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end
