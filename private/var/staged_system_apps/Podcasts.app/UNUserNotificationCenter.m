@implementation UNUserNotificationCenter

+ (id)workQueue
{
  if (qword_1005675F8 != -1)
    dispatch_once(&qword_1005675F8, &stru_1004AC320);
  return (id)qword_1005675F0;
}

- (void)mt_removeAllNotificationsForPodcastUuid:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    v5 = _MTLogCategoryDefault(0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Invalid parameter", buf, 2u);
    }

  }
  if (objc_msgSend(v4, "length"))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100135EA8;
    v10[3] = &unk_1004AC348;
    v10[4] = self;
    v7 = v4;
    v11 = v7;
    -[UNUserNotificationCenter getPendingNotificationRequestsWithCompletionHandler:](self, "getPendingNotificationRequestsWithCompletionHandler:", v10);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100135EFC;
    v8[3] = &unk_1004AC348;
    v8[4] = self;
    v9 = v7;
    -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](self, "getDeliveredNotificationsWithCompletionHandler:", v8);

  }
}

- (void)mt_removeAllNotificationsForDeletedEpisodesOnPodcastUuid:(id)a3 ctx:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = _MTLogCategoryNotifications(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to remove notifications that contain deleted episodes for podcastUuid: %@ ", buf, 0xCu);
  }

  if (!objc_msgSend(v6, "length"))
  {
    v10 = _MTLogCategoryDefault(0);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid parameter", buf, 2u);
    }

  }
  if (objc_msgSend(v6, "length"))
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100136150;
    v17[3] = &unk_1004A8E28;
    v17[4] = self;
    v12 = v6;
    v18 = v12;
    v13 = v7;
    v19 = v13;
    -[UNUserNotificationCenter getPendingNotificationRequestsWithCompletionHandler:](self, "getPendingNotificationRequestsWithCompletionHandler:", v17);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10013634C;
    v14[3] = &unk_1004A8E28;
    v14[4] = self;
    v15 = v12;
    v16 = v13;
    -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](self, "getDeliveredNotificationsWithCompletionHandler:", v14);

  }
}

- (void)mt_removeDeliveredNotificationsForPlayerItemsWithCompletion:(id)a3
{
  id v3;
  _QWORD v4[4];
  UNUserNotificationCenter *v5;
  id v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001365D8;
  v4[3] = &unk_1004AA9E8;
  v5 = self;
  v6 = a3;
  v3 = v6;
  -[UNUserNotificationCenter getDeliveredNotificationsWithCompletionHandler:](v5, "getDeliveredNotificationsWithCompletionHandler:", v4);

}

- (id)_mt_identifiersMatchingPodcastUuid:(id)a3 inNotificationRequests:(id)a4
{
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001366E0;
  v8[3] = &unk_1004AC3F0;
  v9 = a3;
  v5 = v9;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "mt_compactMap:", v8));

  return v6;
}

- (void)_mt_identifiersMatchingDeletedEpisodesOnPodcastUuid:(id)a3 inNotificationRequests:(id)a4 ctx:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;
  id obj;
  _QWORD block[4];
  id v33;
  _QWORD *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  NSObject *v39;
  id v40;
  _QWORD *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];

  v9 = a3;
  v10 = a4;
  v30 = a5;
  v29 = a6;
  v11 = dispatch_group_create();
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = sub_100046934;
  v46[4] = sub_100046B04;
  v47 = objc_alloc_init((Class)NSMutableArray);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        dispatch_group_enter(v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
        if (+[UNNotificationRequest mt_isUuidRequestIdentifier:matchForPodcastUuid:](UNNotificationRequest, "mt_isUuidRequestIdentifier:matchForPodcastUuid:", v16, v9))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "content"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mt_notificationEpisodes"));

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mt_compactMap:", &stru_1004AC410));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v19));

          v22 = _MTLogCategoryNotifications(v21);
          v23 = objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            v24 = objc_msgSend(v20, "count");
            *(_DWORD *)buf = 134218498;
            v49 = v24;
            v50 = 2112;
            v51 = v9;
            v52 = 2112;
            v53 = v20;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Found notification with %lu episodes for podcastUuid: %@. Episode uuids in notification: %@", buf, 0x20u);
          }

          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_100136B50;
          v35[3] = &unk_1004AC438;
          v25 = v20;
          v36 = v25;
          v26 = v30;
          v37 = v26;
          v38 = v9;
          v39 = v11;
          v41 = v46;
          v40 = v16;
          objc_msgSend(v26, "performBlock:", v35);

        }
        else
        {
          dispatch_group_leave(v11);
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
    }
    while (v12);
  }

  v27 = objc_claimAutoreleasedReturnValue(+[UNUserNotificationCenter workQueue](UNUserNotificationCenter, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100136CA4;
  block[3] = &unk_1004AABA0;
  v34 = v46;
  v33 = v29;
  v28 = v29;
  dispatch_group_notify(v11, v27, block);

  _Block_object_dispose(v46, 8);
}

- (id)_mt_identifiersMatchingPlayerItemsInNotificationRequests:(id)a3
{
  return objc_msgSend(a3, "mt_compactMap:", &stru_1004AC478);
}

@end
