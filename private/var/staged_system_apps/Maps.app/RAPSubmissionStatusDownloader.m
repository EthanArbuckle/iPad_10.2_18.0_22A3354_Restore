@implementation RAPSubmissionStatusDownloader

- (RAPSubmissionStatusDownloader)init
{
  RAPSubmissionStatusDownloader *v2;
  id v3;
  NSObject *v4;
  RAPBatchSubmissionStatusTicket *v5;
  RAPBatchSubmissionStatusTicket *submissionStatusTicket;
  RAPSubmissionStatusSyncHandler *v7;
  RAPSubmissionStatusSyncHandler *syncHandler;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)RAPSubmissionStatusDownloader;
  v2 = -[RAPSubmissionStatusDownloader init](&v11, "init");
  if (v2)
  {
    v3 = sub_100AED73C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Initializing submission status downloader", v10, 2u);
    }

    v5 = objc_alloc_init(RAPBatchSubmissionStatusTicket);
    submissionStatusTicket = v2->_submissionStatusTicket;
    v2->_submissionStatusTicket = v5;

    v7 = objc_alloc_init(RAPSubmissionStatusSyncHandler);
    syncHandler = v2->_syncHandler;
    v2->_syncHandler = v7;

  }
  return v2;
}

- (void)setNotificationCenter:(id)a3
{
  MDNotificationCenter **p_notificationCenter;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_notificationCenter = &self->_notificationCenter;
  WeakRetained = objc_loadWeakRetained((id *)p_notificationCenter);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_notificationCenter, obj);
    v6 = obj;
  }

}

- (void)updateSubmissionStatusesWithCompletion:(id)a3
{
  id v4;
  uint64_t UInteger;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  UInteger = GEOConfigGetUInteger(MapsConfig_RAPSubmissionStatusQueryBatchSize, off_1014B4128);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100AED878;
  v7[3] = &unk_1011AE218;
  v8 = v4;
  v6 = v4;
  -[RAPSubmissionStatusDownloader _updateAllSubmissionStatusWithOffset:batchSize:completion:](self, "_updateAllSubmissionStatusWithOffset:batchSize:completion:", 0, UInteger, v7);

}

- (void)_updateAllSubmissionStatusWithOffset:(int64_t)a3 batchSize:(unint64_t)a4 completion:(id)a5
{
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[3];
  id location;

  v8 = a5;
  if (GEOConfigGetUInteger(MapsConfig_RAPSubmissionStatusQueryMaximumCount, off_1014B4118) >= a3)
  {
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100AEDA54;
    v9[3] = &unk_1011E21D0;
    objc_copyWeak(v11, &location);
    v10 = v8;
    v11[1] = (id)a3;
    v11[2] = (id)a4;
    -[RAPSubmissionStatusDownloader _fetchAndUpdateRAPStatusWithOffset:batchSize:completion:](self, "_fetchAndUpdateRAPStatusWithOffset:batchSize:completion:", a3, a4, v9);

    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

- (void)_fetchAndUpdateRAPStatusWithOffset:(int64_t)a3 batchSize:(unint64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  RAPSubmissionStatusSyncHandler *syncHandler;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dateByAddingTimeInterval:", -7776000.0));

  objc_initWeak(&location, self);
  syncHandler = self->_syncHandler;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100AEDC14;
  v13[3] = &unk_1011B21F8;
  objc_copyWeak(&v15, &location);
  v12 = v8;
  v14 = v12;
  -[RAPSubmissionStatusSyncHandler fetchUnresolvedRAPIdentifiersWithBatchSize:offset:oldestDate:completion:](syncHandler, "fetchUnresolvedRAPIdentifiersWithBatchSize:offset:oldestDate:completion:", a4, a3, v10, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)_updateSubmissionStatusWithIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  RAPBatchSubmissionStatusTicket *submissionStatusTicket;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  submissionStatusTicket = self->_submissionStatusTicket;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100AEDF5C;
  v10[3] = &unk_1011E2220;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  -[RAPBatchSubmissionStatusTicket fetchStatusesForIdentifiers:completion:](submissionStatusTicket, "fetchStatusesForIdentifiers:completion:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_checkForStatusChangeNotificationsNeededForRapInfos:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "rapDisplayMenu") & 0xFFFFFFFE) == 2)
          -[RAPSubmissionStatusDownloader _sendStatusChangeNotificationIfNeeded:](self, "_sendStatusChangeNotificationIfNeeded:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)_sendStatusChangeNotificationIfNeeded:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  MDNotificationCenter **p_notificationCenter;
  id WeakRetained;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t v19[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rapResponse"));
  v6 = objc_msgSend(v5, "hasNotification");

  if (v6)
  {
    p_notificationCenter = &self->_notificationCenter;
    WeakRetained = objc_loadWeakRetained((id *)p_notificationCenter);

    if (WeakRetained)
    {
      v9 = objc_loadWeakRetained((id *)p_notificationCenter);
      v10 = objc_msgSend(v9, "addRAPNotificationForProblemStatusChangeWithRapInfo:", v4);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MapsPushManager defaultManager](MapsPushManager, "defaultManager"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
      objc_msgSend(v11, "propagateIDSMessageOfType:message:", 1, v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rapResponse"));
      v14 = objc_claimAutoreleasedReturnValue(+[GEORPRapResponse RapStateIconAsString:](GEORPRapResponse, "RapStateIconAsString:", objc_msgSend(v13, "rapStateIcon")));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rapId"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rapResponse"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "responseId"));
      +[RAPNotificationLogEvent reportNotificationWasShownWithRapId:responseId:notificationType:completion:](RAPNotificationLogEvent, "reportNotificationWasShownWithRapId:responseId:notificationType:completion:", v15, v17, v14, &stru_1011E2240);

    }
    else
    {
      v18 = sub_100AED73C();
      v14 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Empty notificationCenter, cannot send a notification", v19, 2u);
      }
    }

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_notificationCenter);
  objc_storeStrong((id *)&self->_syncHandler, 0);
  objc_storeStrong((id *)&self->_submissionStatusTicket, 0);
}

@end
