@implementation CKRecord

+ (id)createRecordWithName:(id)a3 recordType:(id)a4 recordZone:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)CKRecordID), "initWithRecordName:zoneID:", v9, v7);

  v11 = objc_msgSend(objc_alloc((Class)CKRecord), "initWithRecordType:recordID:", v8, v10);
  return v11;
}

- (id)recordFieldForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](self, "encryptedValues"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (void)setRecordFieldForKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValues](self, "encryptedValues"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);

}

- (void)populateCKRecordInfo:(id)a3 userInfo:(id)a4 recordType:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_10002E034();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v39 = 138478339;
    v40 = v10;
    v41 = 2113;
    v42 = v8;
    v43 = 2113;
    v44 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Creating record RecordType: %{private}@ and ServiceInfo: %{private}@ \n and UserInfo %{private}@", (uint8_t *)&v39, 0x20u);
  }

  if (objc_msgSend(v10, "isEqualToString:", MSServiceAccountRecordType))
  {
    v13 = MSHomeParticipantHomeIdentifier;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kCKDatabaseAccessUserInfoHomeIDKey));
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v13, v14);

    v15 = MSHomeParticipantHomeUserIdentifier;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v15, v16);

    v17 = MediaServiceIdentifier;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "UUIDString"));
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v17, v19);

    v20 = MediaServiceAccountName;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accountName"));
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v20, v21);

    v22 = MediaServiceConfigurationURL;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configURL"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "absoluteString"));
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v22, v24);

    v25 = MediaServiceUpdateListeningHistory;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "updateListeningHistoryEnabled")));
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v25, v26);

    v27 = MediaServiceAuthFatalError;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "authFatalError")));
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v27, v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authConfiguration"));
    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authConfiguration"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v30, 1, 0));

      if (v31)
        -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", MediaServiceAuthConfiguration, v31);

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authCredential"));

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "authCredential"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v33, 1, 0));

      if (v34)
        -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", MediaServiceAuthCredential, v34);
      goto LABEL_13;
    }
  }
  else if (objc_msgSend(v10, "isEqualToString:", MSDefaultServiceRecordType))
  {
    v35 = MSHomeParticipantHomeUserIdentifier;
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kCKDatabaseAccessUserInfoHomeUserIDKey));
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v35, v36);

    v37 = MediaServiceIdentifier;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceID"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "UUIDString"));
    -[CKRecord setRecordFieldForKey:value:](self, "setRecordFieldForKey:value:", v37, v38);

LABEL_13:
  }

}

- (id)createMediaServiceObjectFromRecord
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  MSDArtworkManager *v34;
  void *v35;
  MSDArtworkManager *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  unsigned int v47;
  id v48;
  NSObject *v49;
  id v50;

  v3 = MediaServiceIdentifier;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceIdentifier));
  if (!v4)
  {
    v38 = sub_10002E034();
    v5 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000217D0(v5, v39, v40, v41, v42, v43, v44, v45);
    goto LABEL_23;
  }
  v5 = objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfoForServiceID:](MSDPublicDBManager, "getCachedPublicInfoForServiceID:", v4));
  if (!v5)
  {
    -[CKRecord _attemptToLoadPublicInfoAgain](self, "_attemptToLoadPublicInfoAgain");
    v5 = objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager getCachedPublicInfoForServiceID:](MSDPublicDBManager, "getCachedPublicInfoForServiceID:", v4));
    v6 = sub_10002E034();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100021914((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);

    if (!v5)
    {
      v50 = sub_10002E034();
      v5 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_100021840(v5);
      goto LABEL_23;
    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
  v15 = objc_msgSend(v14, "isEqualToString:", MSServiceAccountRecordType);

  if (!v15)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordType](self, "recordType"));
    v47 = objc_msgSend(v46, "isEqualToString:", MSDefaultServiceRecordType);

    if (v47)
    {
      v17 = objc_msgSend(objc_alloc((Class)MediaService), "initWithMediaServiceIdentifier:", v4);
      goto LABEL_24;
    }
    v48 = sub_10002E034();
    v49 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      sub_100021880(self, v49);

LABEL_23:
    v17 = 0;
    goto LABEL_24;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", v3));
  v17 = objc_msgSend(objc_alloc((Class)MediaService), "initWithMediaServiceIdentifier:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceUpdateListeningHistory));
  objc_msgSend(v17, "setUpdateListeningHistoryEnabled:", objc_msgSend(v18, "BOOLValue"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceAccountName));
  objc_msgSend(v17, "setAccountName:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceConfigurationURL));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v20));
  objc_msgSend(v17, "setConfigURL:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceAuthFatalError));
  objc_msgSend(v17, "setAuthFatalError:", objc_msgSend(v22, "BOOLValue"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceAuthConfiguration));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord recordFieldForKey:](self, "recordFieldForKey:", MediaServiceAuthCredential));
  if (v23)
  {
    v25 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(CMSAuthenticationConfiguration), v23, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    objc_msgSend(v17, "setAuthConfiguration:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "authConfiguration"));
    if (!v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[CMSAuthenticationConfiguration authConfigurationFromMSAuthData:](CMSAuthenticationConfiguration, "authConfigurationFromMSAuthData:", v23));
      objc_msgSend(v17, "setAuthConfiguration:", v28);

    }
  }
  if (v24)
  {
    v29 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(CMSAuthenticationCredential), v24, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    objc_msgSend(v17, "setAuthCredential:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "authCredential"));
    if (!v31)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[CMSAuthenticationCredential authCredentialFromMSAuthData:](CMSAuthenticationCredential, "authCredentialFromMSAuthData:", v24));
      objc_msgSend(v17, "setAuthCredential:", v32);

    }
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTransactionTask createTransactionWithIdentifier:](MSDTransactionTask, "createTransactionWithIdentifier:", CFSTR("com.apple.mediasetupd.imageCaching")));
  v34 = [MSDArtworkManager alloc];
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject serviceIconPath](v5, "serviceIconPath"));
  v36 = -[MSDArtworkManager initWithServiceID:remoteImageURL:](v34, "initWithServiceID:remoteImageURL:", v16, v35);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MSDArtworkManager getLocalCachedImageURL](v36, "getLocalCachedImageURL"));
  objc_msgSend(v17, "setIconImageURL:", v37);

  objc_msgSend(v33, "releaseTransaction");
LABEL_24:

  return v17;
}

- (void)_attemptToLoadPublicInfoAgain
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  dispatch_time_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  NSObject *v16;

  v2 = dispatch_semaphore_create(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](MSDPublicDBManager, "shared"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100021768;
  v15[3] = &unk_1000494E0;
  v4 = v2;
  v16 = v4;
  objc_msgSend(v3, "syncDataWithCloudKit:", v15);

  v5 = dispatch_time(0, 1000000000 * MSMaxWaitInSecondsForFetchDataFromCloudKit);
  if (dispatch_semaphore_wait(v4, v5))
  {
    v6 = sub_10002E034();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100021978(v7, v8, v9, v10, v11, v12, v13, v14);

  }
}

@end
