@implementation CKNCloudKitDataStore

- (void)mergeRecordsWithDictionary:(id)a3 deletedRecordKeys:(id)a4 containsAllChanges:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  const char *v17;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](CKDaemon, "sharedDaemon"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100003624;
    v13[3] = &unk_100018600;
    v14 = v7;
    v15 = v8;
    objc_msgSend(v10, "keysInStoreWithIdentifier:completionHandler:", CFSTR("synched"), v13);

    v11 = v14;
LABEL_9:

    goto LABEL_10;
  }
  if (objc_msgSend(v7, "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](CKDaemon, "sharedDaemon"));
    objc_msgSend(v12, "saveKeysAndValues:toStoreWithIdentifier:completionHandler:", v7, CFSTR("synched"), &stru_100018620);

  }
  if (objc_msgSend(v8, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](CKDaemon, "sharedDaemon"));
    objc_msgSend(v11, "removeValuesForKeys:fromStoreWithIdentifier:completionHandler:", v8, CFSTR("synched"), &stru_100018640);
    goto LABEL_9;
  }
LABEL_10:

}

@end
