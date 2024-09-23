@implementation BKAudiobookPersistenceCloudKit

- (BKAudiobookPersistenceCloudKit)initWithAssetDetailManager:(id)a3
{
  id v5;
  BKAudiobookPersistenceCloudKit *v6;
  BKAudiobookPersistenceCloudKit *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKAudiobookPersistenceCloudKit;
  v6 = -[BKAudiobookPersistenceCloudKit init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetDetailManager, a3);

  return v7;
}

- (int64_t)eventThreshold
{
  return 5;
}

- (NSString)shortName
{
  return (NSString *)CFSTR("CloudKit");
}

- (BOOL)isLocal
{
  return 0;
}

- (void)bookmarkTimeForAudiobook:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *activity;
  _QWORD block[4];
  id v12;
  BKAudiobookPersistenceCloudKit *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  activity = _os_activity_create(&dword_0, "Books/audiobook-query-cloud-bookmark", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1F868;
  block[3] = &unk_39200;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  os_activity_apply(activity, block);

}

- (void)saveBookmarkTime:(double)a3 audiobook:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void (**v12)(id, void *);
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  void (**v34)(id, void *);
  id v35;
  id v36;
  id v37;
  double v38;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceCloudKit assetDetailManager](self, "assetDetailManager"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetID"));
  if (objc_msgSend(v11, "length"))
  {
    if (v10)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1FCD0;
      v33[3] = &unk_39250;
      v34 = v11;
      v38 = a3;
      v35 = v8;
      v36 = v10;
      v37 = v9;
      objc_msgSend(v36, "assetDetailForAssetID:completion:", v34, v33);

      v12 = v34;
      goto LABEL_13;
    }
    v23 = BKAudiobooksPersistenceCloudKitLog();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_22824(v24, v25, v26, v27, v28, v29, v30, v31);

    v12 = (void (**)(id, void *))objc_retainBlock(v9);
    if (v12)
    {
      v22 = 2;
      goto LABEL_12;
    }
  }
  else
  {
    v13 = BKAudiobooksPersistenceCloudKitLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_227F0(v14, v15, v16, v17, v18, v19, v20, v21);

    v12 = (void (**)(id, void *))objc_retainBlock(v9);
    if (v12)
    {
      v22 = 1;
LABEL_12:
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKAudiobooksError"), v22, 0));
      v12[2](v12, v32);

    }
  }
LABEL_13:

}

- (BCCloudAssetDetailManager)assetDetailManager
{
  return self->_assetDetailManager;
}

- (void)setAssetDetailManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetDetailManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDetailManager, 0);
}

@end
