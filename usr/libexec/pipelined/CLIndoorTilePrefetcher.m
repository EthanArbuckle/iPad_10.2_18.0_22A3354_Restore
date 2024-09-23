@implementation CLIndoorTilePrefetcher

- (void)cancelInflightForegroundTasksMatching:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v4 = a3;
  if (*(_OWORD *)&self->_availableFloorForegroundSessionQueue != 0)
  {
    if (qword_100417EF8 == -1)
    {
      v5 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_5:
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher unavailableFloorForegroundSessionQueue](self, "unavailableFloorForegroundSessionQueue"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
        -[CLIndoorTilePrefetcher cancelDownloadTasksMatching:onSession:](self, "cancelDownloadTasksMatching:onSession:", v4, v7);

        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher availableFloorForegroundSessionQueue](self, "availableFloorForegroundSessionQueue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "session"));
        -[CLIndoorTilePrefetcher cancelDownloadTasksMatching:onSession:](self, "cancelDownloadTasksMatching:onSession:", v4, v9);

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v5 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_5;
    }
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Building list of in-flight foreground downloads to cancel", v10, 2u);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)onQueueNotifyDelegatePrefetchComplete
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegate](self, "delegate"));
  objc_msgSend(v2, "tilePrefetchFinishedAllDownloads");

}

- (void)cancelInflightBackgroundTasksMatching:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (self->_backgroundSessionQueue)
  {
    if (qword_100417EF8 == -1)
    {
      v5 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_5:
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher backgroundSessionQueue](self, "backgroundSessionQueue"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "session"));
        -[CLIndoorTilePrefetcher cancelDownloadTasksMatching:onSession:](self, "cancelDownloadTasksMatching:onSession:", v4, v7);

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v5 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_5;
    }
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Building list of in-flight background downloads to cancel", v8, 2u);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)requestForegroundFetchForFloors:(id)a3 withRequestUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407900);
  v8 = (id)qword_100417F00;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDString"));
    v10 = 138477827;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Request foreground fetch requests for request UUID %{private}@", (uint8_t *)&v10, 0xCu);

  }
  -[CLIndoorTilePrefetcher scheduleForegroundDownloadForFloors:withRequestUUID:](self, "scheduleForegroundDownloadForFloors:withRequestUUID:", v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionInvalidationGroup, 0);
  objc_destroyWeak((id *)&self->_delegateQ);
  objc_storeStrong((id *)&self->_downloadQ, 0);
  objc_storeStrong((id *)&self->_unavailableFloorForegroundSessionQueue, 0);
  objc_storeStrong((id *)&self->_availableFloorForegroundSessionQueue, 0);
  objc_storeStrong((id *)&self->_backgroundSessionQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tileServer, 0);
  objc_storeStrong((id *)&self->_now, 0);
}

- (void)notifyDelegatePrefetchComplete
{
  const char *Name;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  id location[2];
  _QWORD v9[5];
  id v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_1000BCD24;
  v9[4] = sub_1000BCCB8;
  Name = sel_getName(a2);
  v10 = (id)os_transaction_create(Name);
  v4 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegateQ](self, "delegateQ"));
  if (!v4)
  {
    if (qword_100417EF8 == -1)
    {
      v5 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_6;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v5 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_6;
    }
    LOWORD(location[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "delegate queue is no longer valid. Ignoring callback", (uint8_t *)location, 2u);
    goto LABEL_6;
  }
  objc_initWeak(location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000088A0;
  v6[3] = &unk_1004077F0;
  objc_copyWeak(&v7, location);
  v6[4] = v9;
  dispatch_async(v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(location);
LABEL_6:

  _Block_object_dispose(v9, 8);
}

- (void)invalidate
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[8];
  id v13;

  if (qword_100417EF8 == -1)
  {
    v3 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&qword_100417EF8, &stru_100407900);
  v3 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Prefetcher invalidating all sessions and tasks", buf, 2u);
  }
LABEL_4:
  v4 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegateQ](self, "delegateQ"));
  dispatch_assert_queue_V2(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher sessionInvalidationGroup](self, "sessionInvalidationGroup"));

  if (v5)
  {
    sub_1003451E0();

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorTilePrefetcher.mm", 282, "-[CLIndoorTilePrefetcher invalidate]");
    __break(1u);
  }
  else
  {
    if (self->_availableFloorForegroundSessionQueue
      || self->_unavailableFloorForegroundSessionQueue
      || self->_backgroundSessionQueue)
    {
      -[CLIndoorTilePrefetcher invalidateSessions](self, "invalidateSessions");
      -[CLIndoorTilePrefetcher resetSessions](self, "resetSessions");
    }
    if (qword_100417EF8 == -1)
    {
      v6 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  dispatch_once(&qword_100417EF8, &stru_100407900);
  v6 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_11:
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Cancelling all operations from the download queue", v11, 2u);
  }
LABEL_12:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher downloadQ](self, "downloadQ"));
  objc_msgSend(v7, "cancelAllOperations");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher downloadQ](self, "downloadQ"));
  objc_msgSend(v8, "waitUntilAllOperationsAreFinished");

  -[CLIndoorTilePrefetcher setDownloadQ:](self, "setDownloadQ:", 0);
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407900);
    v9 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    goto LABEL_14;
  }
  v9 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_14:
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "All download queue operations cancelled", v10, 2u);
  }
LABEL_15:

}

- (CLIndoorTilePrefetcher)initWithServerConfiguration:(const void *)a3 usingDelegate:(id)a4 queue:(id)a5 forTest:(BOOL)a6
{
  id v10;
  id v11;
  CLIndoorTilePrefetcher *v12;
  CLIndoorTilePrefetcher *v13;
  CLIndoorTilePrefetcher *v14;
  id v15;
  uint64_t v16;
  NSURL *tileServer;
  NSOperationQueue *v18;
  NSOperationQueue *downloadQ;
  NSObject *v20;
  dispatch_queue_t v21;
  void *v22;
  void *v23;
  CLIndoorTilePrefetcher *v24;
  uint8_t v26[16];
  objc_super v27;

  v10 = a4;
  v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)CLIndoorTilePrefetcher;
  v12 = -[CLIndoorTilePrefetcher init](&v27, "init");
  v13 = v12;
  v14 = v12;
  if (v12)
  {
    v12->_isDaemon = !a6;
    v12->_discretionaryBackground = !a6;
    v12->_isTest = a6;
    objc_storeWeak((id *)&v12->_delegate, v10);
    objc_storeWeak((id *)&v13->_delegateQ, v11);
    if (!v14->_isTest)
      objc_msgSend(v10, "reloadAvailabilityTilePrefetchParameters");
    v15 = sub_10000596C((uint64_t)a3);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    tileServer = v14->_tileServer;
    v14->_tileServer = (NSURL *)v16;

    v18 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    downloadQ = v14->_downloadQ;
    v14->_downloadQ = v18;

    if (qword_100417EF8 == -1)
    {
      v20 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_7:
        v21 = dispatch_queue_create("com.apple.indoord.DownloadQueue", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher downloadQ](v14, "downloadQ"));
        objc_msgSend(v22, "setMaxConcurrentOperationCount:", 1);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher downloadQ](v14, "downloadQ"));
        objc_msgSend(v23, "setUnderlyingQueue:", v21);

        +[NSURLSession _getActiveSessionIdentifiersWithCompletionHandler:](NSURLSession, "_getActiveSessionIdentifiersWithCompletionHandler:", &stru_100407698);
        v24 = v14;

        goto LABEL_8;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v20 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_7;
    }
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Downloads will be processed 1 at a time", v26, 2u);
    goto LABEL_7;
  }
LABEL_8:

  return v14;
}

- (NSOperationQueue)downloadQ
{
  return self->_downloadQ;
}

- (void)scheduleForegroundDownloadForFloors:(id)a3 withRequestUUID:(id)a4
{
  id v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  NSObject *v18;
  id v19;
  id v20;
  int v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  unsigned int v26;
  int v27;
  NSObject *v28;
  id v29;
  _BOOL4 v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  uint64_t v40;
  id v41;
  uint64_t v43;
  _QWORD v44[4];
  int v45;
  int v46;
  BOOL v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  _BOOL4 v53;
  __int16 v54;
  _BYTE v55[10];
  _BYTE v56[6];
  id v57;
  __int16 v58;
  double v59;
  __int16 v60;
  unsigned int v61;
  _BYTE v62[128];

  v5 = a3;
  v41 = a4;
  v36 = v5;
  v6 = objc_msgSend(v5, "count");
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407900);
  v7 = (id)qword_100417F00;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "UUIDString"));
    *(_DWORD *)buf = 67240451;
    v53 = v6;
    v54 = 2113;
    *(_QWORD *)v55 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Processing %{public}d foreground fetch requests for request UUID %{private}@", buf, 0x12u);

  }
  if (!v6)
  {
    if (qword_100417EF8 == -1)
    {
      v32 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_45:
        -[CLIndoorTilePrefetcher notifyDelegateForegroundTaskCompleted:](self, "notifyDelegateForegroundTaskCompleted:", 0);
        goto LABEL_56;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v32 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_45;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "WARNING: Received empty foreground download request", buf, 2u);
    goto LABEL_45;
  }
  -[CLIndoorTilePrefetcher cancelInflightBackgroundTasksMatching:](self, "cancelInflightBackgroundTasksMatching:", v5);
  -[CLIndoorTilePrefetcher cancelInflightForegroundTasksMatching:](self, "cancelInflightForegroundTasksMatching:", v5);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (v9)
  {
    v37 = 0;
    v38 = 0;
    v43 = 0;
    v40 = *(_QWORD *)v49;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v49 != v40)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)v10);
        if (objc_msgSend(v11, "hasCompleteFloor"))
          v12 = 1;
        else
          v12 = 2;
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "floorUuid"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "venueUuid"));
        v15 = objc_msgSend(v11, "locationContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "relevancy"));
        v17 = -[CLIndoorTilePrefetcher scheduleDownloadForFloorMetadata:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:](self, "scheduleDownloadForFloorMetadata:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:", v13, v14, v15, v16, objc_msgSend(v11, "allowCellularDownload"), v12, 0, v41);

        if (qword_100417EF8 != -1)
          dispatch_once(&qword_100417EF8, &stru_100407900);
        v18 = (id)qword_100417F00;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "venueUuid")));
          v20 = objc_msgSend(v19, "UTF8String");
          if (objc_msgSend(v11, "locationContext") == (id)1)
            v21 = 82;
          else
            v21 = 73;
          v22 = objc_msgSend(v11, "priority");
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "relevancy"));
          objc_msgSend(v23, "timeIntervalSinceNow");
          v25 = v24;
          v26 = objc_msgSend(v11, "allowCellularDownload");
          *(_DWORD *)buf = 67241474;
          v53 = v17;
          v54 = 2082;
          *(_QWORD *)v55 = v20;
          *(_WORD *)&v55[8] = 1026;
          *(_DWORD *)v56 = v21;
          *(_WORD *)&v56[4] = 2050;
          v57 = v22;
          v58 = 2050;
          v59 = v25 / 3600.0;
          v60 = 1026;
          v61 = v26;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "@TileFetch, reqcheck, %{public}d, %{public}s, %{public}c, priority, %{public}ld, relevancy, %{public}.1f, cell, %{public}d", buf, 0x32u);

        }
        if (v17 == 2)
        {
          LODWORD(v38) = v38 + 1;
        }
        else if (v17 == 1)
        {
          ++HIDWORD(v37);
        }
        else if (v17)
        {
          if (qword_100417EF8 != -1)
            dispatch_once(&qword_100417EF8, &stru_100407900);
          ++HIDWORD(v38);
          v28 = qword_100417F00;
          if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240192;
            v53 = v17;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "@TileFetch, unxpected, scheduled, %{public}d, #Warning", buf, 8u);
          }
        }
        else
        {
          if (objc_msgSend(v11, "locationContext") == (id)1)
            v27 = v37 + 1;
          else
            v27 = v37;
          LODWORD(v37) = v27;
        }
        v29 = objc_msgSend(v11, "locationContext");
        v30 = v29 == (id)1;
        if (v29 == (id)1)
          v31 = HIDWORD(v43) + 1;
        else
          v31 = HIDWORD(v43);
        if (v17 != 2)
          v30 = 0;
        LODWORD(v43) = v43 + v30;
        HIDWORD(v43) = v31;
        v10 = (char *)v10 + 1;
      }
      while (v9 != v10);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
    }
    while (v9);
  }
  else
  {
    v37 = 0;
    v38 = 0;
    v43 = 0;
  }

  if (qword_100417EF8 == -1)
  {
    v33 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
      goto LABEL_50;
    goto LABEL_49;
  }
  dispatch_once(&qword_100417EF8, &stru_100407900);
  v33 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
  {
LABEL_49:
    *(_DWORD *)buf = 67241216;
    v53 = v37;
    v54 = 1026;
    *(_DWORD *)v55 = HIDWORD(v37);
    *(_WORD *)&v55[4] = 1026;
    *(_DWORD *)&v55[6] = v38;
    *(_WORD *)v56 = 1026;
    *(_DWORD *)&v56[2] = 0;
    LOWORD(v57) = 1026;
    *(_DWORD *)((char *)&v57 + 2) = HIDWORD(v38);
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "@TileFetch, scheduled, foreground, mtnsu, %{public}d, %{public}d, %{public}d, %{public}d, %{public}d", buf, 0x20u);
  }
LABEL_50:
  if (HIDWORD(v43))
  {
    if (qword_100417EF8 != -1)
      dispatch_once(&qword_100417EF8, &stru_100407900);
    v35 = qword_100417F00;
    v34 = 100 * v43;
    if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67240704;
      v53 = HIDWORD(v43) == v43;
      v54 = 1026;
      *(_DWORD *)v55 = HIDWORD(v43);
      *(_WORD *)&v55[4] = 1026;
      *(_DWORD *)&v55[6] = v34 / SHIDWORD(v43);
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Wifi2Metric, localize, %{public}d, groups, %{public}d, pct, %{public}d", buf, 0x14u);
    }
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1003345D4;
    v44[3] = &unk_1004077A0;
    v47 = HIDWORD(v43) == (_DWORD)v43;
    v45 = HIDWORD(v43);
    v46 = v34 / SHIDWORD(v43);
    AnalyticsSendEventLazy(CFSTR("com.apple.clx.wifi2.localize"), v44);
  }
LABEL_56:

}

- (void)notifyDelegateForegroundTaskCompleted:(id)a3
{
  id v5;
  NSObject *v6;
  const char *Name;
  void *v8;
  _BYTE v9[32];

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegateQ](self, "delegateQ"));
  dispatch_assert_queue_V2(v6);

  Name = sel_getName(a2);
  sub_10007CED4((uint64_t)v9, Name);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegate](self, "delegate"));
  objc_msgSend(v8, "prefetcher:didFinishForegroundRequest:", self, v5);

  sub_10007CDC0((uint64_t)v9);
}

- (int)scheduleDownloadForFloorMetadata:(id)a3 inVenue:(id)a4 withContext:(int64_t)a5 lastRelevant:(id)a6 allowCellularDownload:(BOOL)a7 onSession:(int)a8 withResumeData:(id)a9 withRequestUUID:(id)a10
{
  uint64_t v10;
  _BOOL8 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  const char *v31;
  size_t v32;
  size_t v33;
  __int128 *p_dst;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  size_t v38;
  size_t v39;
  __n128 *p_p;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  __n128 __p;
  unint64_t v50;
  __int128 __dst;
  unint64_t v52;
  void *v53;
  std::__shared_weak_count *v54;
  char v55;
  void *v56;
  char v57;
  void *v58[2];
  uint64_t v59;

  v10 = *(_QWORD *)&a8;
  v11 = a7;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v47 = a9;
  v19 = a10;
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegate](self, "delegate"));
  if (v16)
  {
    objc_msgSend(v16, "ps_STLString");
  }
  else
  {
    v58[0] = 0;
    v58[1] = 0;
    v59 = 0;
  }
  LOBYTE(v44) = v11;
  v48 = -[IndoorRequestInfo initFloor:inVenue:withContext:requestFor:withinSession:lastRelevant:allowCellularDownloadTile:requestUUID:]([IndoorRequestInfo alloc], "initFloor:inVenue:withContext:requestFor:withinSession:lastRelevant:allowCellularDownloadTile:requestUUID:", v16, v17, a5, 0, v10, v18, v44, v19);
  sub_10008930C(&v53, (uint64_t)v58);
  v20 = -[CLIndoorTilePrefetcher shouldPrefetchFloorMetadataForFloorUuid:forSession:withLocationContext:](self, "shouldPrefetchFloorMetadataForFloorUuid:forSession:withLocationContext:", &v53, v10, a5);
  v21 = v20;
  v22 = v54;
  if (!v54)
    goto LABEL_8;
  p_shared_owners = (unint64_t *)&v54->__shared_owners_;
  do
    v24 = __ldaxr(p_shared_owners);
  while (__stlxr(v24 - 1, p_shared_owners));
  if (v24)
  {
LABEL_8:
    if ((v20 & 1) != 0)
      goto LABEL_9;
LABEL_13:
    v25 = v46;
    if (objc_msgSend(v46, "tilePrefetchShouldPrefetchTileDataForFloor:", v58))
    {
      -[CLIndoorTilePrefetcher scheduleDownloadForTile:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:](self, "scheduleDownloadForTile:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:", v16, v17, a5, v18, v11, v10, 0, v19);
      v29 = 1;

      if ((SHIBYTE(v59) & 0x80000000) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
    v45 = v19;
    v31 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    v32 = strlen(v31);
    if (v32 > 0x7FFFFFFFFFFFFFF7)
      sub_1000CDE30();
    v33 = v32;
    if (v32 >= 0x17)
    {
      v35 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v32 | 7) != 0x17)
        v35 = v32 | 7;
      v36 = v35 + 1;
      p_dst = (__int128 *)operator new(v35 + 1);
      *((_QWORD *)&__dst + 1) = v33;
      v52 = v36 | 0x8000000000000000;
      *(_QWORD *)&__dst = p_dst;
    }
    else
    {
      HIBYTE(v52) = v32;
      p_dst = &__dst;
      if (!v32)
      {
LABEL_24:
        *((_BYTE *)p_dst + v33) = 0;
        v37 = (const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
        v38 = strlen(v37);
        if (v38 > 0x7FFFFFFFFFFFFFF7)
          sub_1000CDE30();
        v39 = v38;
        if (v38 >= 0x17)
        {
          v41 = (v38 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v38 | 7) != 0x17)
            v41 = v38 | 7;
          v42 = v41 + 1;
          p_p = (__n128 *)operator new(v41 + 1);
          __p.n128_u64[1] = v39;
          v50 = v42 | 0x8000000000000000;
          __p.n128_u64[0] = (unint64_t)p_p;
          v19 = v45;
        }
        else
        {
          HIBYTE(v50) = v38;
          p_p = &__p;
          v19 = v45;
          if (!v38)
          {
LABEL_32:
            p_p->n128_u8[v39] = 0;
            *(_QWORD *)&v43 = sub_10008FD38((uint64_t)&v53, &__dst, &__p, +[CLLocationContextConversions fromCLPipelinedLocationContext:](CLLocationContextConversions, "fromCLPipelinedLocationContext:", a5)).n128_u64[0];
            v25 = v46;
            if (SHIBYTE(v50) < 0)
            {
              operator delete((void *)__p.n128_u64[0]);
              if ((SHIBYTE(v52) & 0x80000000) == 0)
                goto LABEL_34;
            }
            else if ((SHIBYTE(v52) & 0x80000000) == 0)
            {
              goto LABEL_34;
            }
            operator delete((void *)__dst);
LABEL_34:
            objc_msgSend(v46, "tilePrefetchForTileId:updateRelevancy:", &v53, v18, v43);
            if ((_DWORD)v10)
              -[CLIndoorTilePrefetcher notifyDelegateForegroundTaskCompleted:](self, "notifyDelegateForegroundTaskCompleted:", v48);
            if (v57 < 0)
            {
              operator delete(v56);
              if ((v55 & 0x80000000) == 0)
              {
LABEL_38:
                v29 = 2;

                if ((SHIBYTE(v59) & 0x80000000) == 0)
                  goto LABEL_11;
                goto LABEL_10;
              }
            }
            else if ((v55 & 0x80000000) == 0)
            {
              goto LABEL_38;
            }
            operator delete(v53);
            v29 = 2;

            if ((SHIBYTE(v59) & 0x80000000) == 0)
              goto LABEL_11;
            goto LABEL_10;
          }
        }
        memmove(p_p, v37, v39);
        goto LABEL_32;
      }
    }
    memmove(p_dst, v31, v33);
    goto LABEL_24;
  }
  ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
  std::__shared_weak_count::__release_weak(v22);
  if ((v21 & 1) == 0)
    goto LABEL_13;
LABEL_9:
  v25 = v46;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher tileServer](self, "tileServer"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorTilePrefetcher urlForAsset:forFloor:withTileServer:](CLIndoorTilePrefetcher, "urlForAsset:forFloor:withTileServer:", CFSTR("cfgp.gz"), v16, v26));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorTilePrefetcher createNewRequest:forURL:lastRelevant:](CLIndoorTilePrefetcher, "createNewRequest:forURL:lastRelevant:", v10, v27, v18));
  objc_msgSend(v48, "setOnRequest:", v28);
  -[CLIndoorTilePrefetcher scheduleDownloadForRequest:withResumeData:withSession:andExpectedByteSize:](self, "scheduleDownloadForRequest:withResumeData:withSession:andExpectedByteSize:", v28, v47, v10, 100);

  v29 = 0;
  if (SHIBYTE(v59) < 0)
LABEL_10:
    operator delete(v58[0]);
LABEL_11:

  return v29;
}

- (BOOL)shouldPrefetchFloorMetadataForFloorUuid:(const void *)a3 forSession:(int)a4 withLocationContext:(int64_t)a5
{
  void *v8;
  void *v9;
  unsigned __int8 v11;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegate](self, "delegate"));
  v9 = v8;
  if (a4 || a5)
  {
    v11 = objc_msgSend(v8, "tilePrefetchShouldPrefetchMetadataForFloor:withLocationContext:", sub_100050DB0((uint64_t)a3), a5);

    return v11;
  }
  else
  {

    return 1;
  }
}

- (CLIndoorTilePrefetcherDelegate)delegate
{
  return (CLIndoorTilePrefetcherDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQ
{
  return (OS_dispatch_queue *)objc_loadWeakRetained((id *)&self->_delegateQ);
}

- (void)setDownloadQ:(id)a3
{
  objc_storeStrong((id *)&self->_downloadQ, a3);
}

- (OS_dispatch_group)sessionInvalidationGroup
{
  return self->_sessionInvalidationGroup;
}

- (CLIndoorTilePrefetcher)initWithServerConfiguration:(const void *)a3 usingDelegate:(id)a4 queue:(id)a5
{
  return -[CLIndoorTilePrefetcher initWithServerConfiguration:usingDelegate:queue:forTest:](self, "initWithServerConfiguration:usingDelegate:queue:forTest:", a3, a4, a5, 0);
}

- (void)allDownloadItemsCompleted
{
  NSObject *v3;
  uint8_t v4[16];

  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407900);
    v3 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_4;
    goto LABEL_3;
  }
  v3 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_3:
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "TileFetch, allDownloadItemsCompleted", v4, 2u);
  }
LABEL_4:
  -[CLIndoorTilePrefetcher notifyDelegatePrefetchComplete](self, "notifyDelegatePrefetchComplete");
}

+ (id)createNewRequest:(int)a3 forURL:(id)a4 lastRelevant:(id)a5
{
  id v5;
  id v6;

  v5 = a4;
  v6 = objc_alloc_init((Class)NSMutableURLRequest);
  objc_msgSend(v6, "setURL:", v5);

  return v6;
}

- (CLIndoorTilePrefetcher)init
{
  -[CLIndoorTilePrefetcher doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)invalidateSessions
{
  dispatch_group_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_time_t v24;
  intptr_t v25;
  NSObject *v26;
  int v27;
  void *v28;

  v3 = dispatch_group_create();
  -[CLIndoorTilePrefetcher setSessionInvalidationGroup:](self, "setSessionInvalidationGroup:", v3);

  if (self->_availableFloorForegroundSessionQueue)
  {
    if (qword_100417EF8 == -1)
    {
      v4 = (id)qword_100417F00;
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
LABEL_5:

        v8 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher sessionInvalidationGroup](self, "sessionInvalidationGroup"));
        dispatch_group_enter(v8);

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher availableFloorForegroundSessionQueue](self, "availableFloorForegroundSessionQueue"));
        objc_msgSend(v9, "invalidateAndCancel");

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v4 = (id)qword_100417F00;
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        goto LABEL_5;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher availableFloorForegroundSessionQueue](self, "availableFloorForegroundSessionQueue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "session"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v27 = 138543362;
    v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Requesting invalidation of available floor session %{public}@", (uint8_t *)&v27, 0xCu);

    goto LABEL_5;
  }
LABEL_6:
  if (!self->_unavailableFloorForegroundSessionQueue)
    goto LABEL_11;
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407900);
    v10 = (id)qword_100417F00;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    goto LABEL_9;
  }
  v10 = (id)qword_100417F00;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
LABEL_9:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher unavailableFloorForegroundSessionQueue](self, "unavailableFloorForegroundSessionQueue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "session"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
    v27 = 138543362;
    v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Requesting invalidation of unavailable floor session %{public}@", (uint8_t *)&v27, 0xCu);

  }
LABEL_10:

  v14 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher sessionInvalidationGroup](self, "sessionInvalidationGroup"));
  dispatch_group_enter(v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher unavailableFloorForegroundSessionQueue](self, "unavailableFloorForegroundSessionQueue"));
  objc_msgSend(v15, "invalidateAndCancel");

LABEL_11:
  if (!self->_backgroundSessionQueue)
    goto LABEL_16;
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407900);
    v16 = (id)qword_100417F00;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    goto LABEL_14;
  }
  v16 = (id)qword_100417F00;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
LABEL_14:
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher backgroundSessionQueue](self, "backgroundSessionQueue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "session"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "description"));
    v27 = 138543362;
    v28 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Requesting invalidation of background session %{public}@", (uint8_t *)&v27, 0xCu);

  }
LABEL_15:

  v20 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher sessionInvalidationGroup](self, "sessionInvalidationGroup"));
  dispatch_group_enter(v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher backgroundSessionQueue](self, "backgroundSessionQueue"));
  objc_msgSend(v21, "invalidateAndCancel");

LABEL_16:
  if (qword_100417EF8 == -1)
  {
    v22 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    goto LABEL_18;
  }
  dispatch_once(&qword_100417EF8, &stru_100407900);
  v22 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_18:
    LOWORD(v27) = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Waiting for sessions to be invalidated", (uint8_t *)&v27, 2u);
  }
LABEL_19:
  v23 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher sessionInvalidationGroup](self, "sessionInvalidationGroup"));
  v24 = dispatch_time(0, 30000000000);
  v25 = dispatch_group_wait(v23, v24);

  if (v25)
  {
    sub_100344F54();
    __break(1u);
  }
  else if (qword_100417EF8 == -1)
  {
    v26 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      return;
    goto LABEL_22;
  }
  dispatch_once(&qword_100417EF8, &stru_100407900);
  v26 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_22:
    LOWORD(v27) = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Sessions invalidated", (uint8_t *)&v27, 2u);
  }
}

- (void)resetSessions
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  uint8_t buf[8];

  v3 = dispatch_group_create();
  if (self->_unavailableFloorForegroundSessionQueue)
  {
    if (qword_100417EF8 == -1)
    {
      v4 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_5:
        dispatch_group_enter(v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher unavailableFloorForegroundSessionQueue](self, "unavailableFloorForegroundSessionQueue"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100332BB4;
        v17[3] = &unk_1003EE788;
        v18 = v3;
        objc_msgSend(v5, "resetWithCompletionHandler:", v17);

        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v4 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_5;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Attempting to reset unavailable foreground session", buf, 2u);
    goto LABEL_5;
  }
LABEL_6:
  if (!self->_availableFloorForegroundSessionQueue)
    goto LABEL_11;
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407900);
    v6 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    goto LABEL_9;
  }
  v6 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_9:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Attempting to reset available foreground session", buf, 2u);
  }
LABEL_10:
  dispatch_group_enter(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher availableFloorForegroundSessionQueue](self, "availableFloorForegroundSessionQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100332C60;
  v15[3] = &unk_1003EE788;
  v16 = v3;
  objc_msgSend(v7, "resetWithCompletionHandler:", v15);

LABEL_11:
  if (!self->_backgroundSessionQueue)
    goto LABEL_16;
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407900);
    v8 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    goto LABEL_14;
  }
  v8 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_14:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Attempting to reset background session", buf, 2u);
  }
LABEL_15:
  dispatch_group_enter(v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher backgroundSessionQueue](self, "backgroundSessionQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100332D0C;
  v13[3] = &unk_1003EE788;
  v14 = v3;
  objc_msgSend(v9, "resetWithCompletionHandler:", v13);

LABEL_16:
  if (qword_100417EF8 == -1)
  {
    v10 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    goto LABEL_18;
  }
  dispatch_once(&qword_100417EF8, &stru_100407900);
  v10 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_18:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Waiting for sessions to be reset", buf, 2u);
  }
LABEL_19:
  v11 = dispatch_time(0, 30000000000);
  if (dispatch_group_wait(v3, v11))
  {
    sub_1003450AC();

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorTilePrefetcher.mm", 272, "-[CLIndoorTilePrefetcher resetSessions]");
    __break(1u);
LABEL_27:
    dispatch_once(&qword_100417EF8, &stru_100407900);
    v12 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_23;
    goto LABEL_22;
  }
  if (qword_100417EF8 != -1)
    goto LABEL_27;
  v12 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_22:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Sessions reset", buf, 2u);
  }
LABEL_23:

}

+ (id)backgroundSessionConfigurationWithDiscretionary:(BOOL)a3 isDaemon:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:](NSURLSessionConfiguration, "backgroundSessionConfigurationWithIdentifier:", CFSTR("com.apple.pipelined.TilePrefetch.v0")));
  objc_msgSend(v6, "setDiscretionary:", v5);
  objc_msgSend(v6, "setNetworkServiceType:", 3);
  if (v4)
  {
    objc_msgSend(v6, "set_sessionSendsLaunchOnDemandEvents:", 1);
    objc_msgSend(v6, "set_requiresPowerPluggedIn:", 0);
  }
  objc_msgSend(v6, "setRequestCachePolicy:", 1);
  objc_msgSend(v6, "setURLCache:", 0);
  objc_msgSend(v6, "setAllowsCellularAccess:", 0);
  objc_msgSend(v6, "set_allowsExpensiveAccess:", 0);
  return v6;
}

- (CLQueuedNSURLSession)backgroundSessionQueue
{
  CLQueuedNSURLSession *backgroundSessionQueue;
  void *v4;
  CLQueuedNSURLSession *v5;
  uint64_t v6;
  int v7;
  void *v8;
  CLQueuedNSURLSession *v9;
  CLQueuedNSURLSession *v10;
  const char *v12;
  uint64_t v13;

  backgroundSessionQueue = self->_backgroundSessionQueue;
  if (backgroundSessionQueue)
    return backgroundSessionQueue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorTilePrefetcher backgroundSessionConfigurationWithDiscretionary:isDaemon:](CLIndoorTilePrefetcher, "backgroundSessionConfigurationWithDiscretionary:isDaemon:", -[CLIndoorTilePrefetcher discretionaryBackground](self, "discretionaryBackground"), -[CLIndoorTilePrefetcher isDaemon](self, "isDaemon")));
  v5 = [CLQueuedNSURLSession alloc];
  v12 = sub_10016E278();
  v13 = v6;
  v7 = sub_1000AAF28((uint64_t)&v12, (unsigned int *)&v13 + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher downloadQ](self, "downloadQ"));
  v9 = -[CLQueuedNSURLSession initWithMaxTasks:usingDelegate:withSessionConfiguration:andProxiedSessionDelegate:andSessionDelegateQueue:](v5, "initWithMaxTasks:usingDelegate:withSessionConfiguration:andProxiedSessionDelegate:andSessionDelegateQueue:", v7, self, v4, self, v8);
  v10 = self->_backgroundSessionQueue;
  self->_backgroundSessionQueue = v9;

  return self->_backgroundSessionQueue;
}

+ (id)foregroundSessionConfigurationWithTimeout:(double)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration ephemeralSessionConfiguration](NSURLSessionConfiguration, "ephemeralSessionConfiguration"));
  objc_msgSend(v4, "setNetworkServiceType:", 0);
  objc_msgSend(v4, "set_allowsExpensiveAccess:", 1);
  objc_msgSend(v4, "setRequestCachePolicy:", 1);
  objc_msgSend(v4, "setURLCache:", 0);
  objc_msgSend(v4, "setTimeoutIntervalForResource:", a3);
  return v4;
}

- (CLQueuedNSURLSession)unavailableFloorForegroundSessionQueue
{
  CLQueuedNSURLSession *unavailableFloorForegroundSessionQueue;
  void *v4;
  CLQueuedNSURLSession *v5;
  uint64_t v6;
  int v7;
  void *v8;
  CLQueuedNSURLSession *v9;
  CLQueuedNSURLSession *v10;
  const char *v12;
  uint64_t v13;

  unavailableFloorForegroundSessionQueue = self->_unavailableFloorForegroundSessionQueue;
  if (!unavailableFloorForegroundSessionQueue)
  {
    sub_10016E304((uint64_t)&v12);
    sub_100310C94((uint64_t *)&v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorTilePrefetcher foregroundSessionConfigurationWithTimeout:](CLIndoorTilePrefetcher, "foregroundSessionConfigurationWithTimeout:"));
    v5 = [CLQueuedNSURLSession alloc];
    v12 = sub_10016E278();
    v13 = v6;
    v7 = sub_1000AAF28((uint64_t)&v12, (unsigned int *)&v13 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher downloadQ](self, "downloadQ"));
    v9 = -[CLQueuedNSURLSession initWithMaxTasks:usingDelegate:withSessionConfiguration:andProxiedSessionDelegate:andSessionDelegateQueue:](v5, "initWithMaxTasks:usingDelegate:withSessionConfiguration:andProxiedSessionDelegate:andSessionDelegateQueue:", v7, self, v4, self, v8);
    v10 = self->_unavailableFloorForegroundSessionQueue;
    self->_unavailableFloorForegroundSessionQueue = v9;

    unavailableFloorForegroundSessionQueue = self->_unavailableFloorForegroundSessionQueue;
  }
  return unavailableFloorForegroundSessionQueue;
}

- (CLQueuedNSURLSession)availableFloorForegroundSessionQueue
{
  CLQueuedNSURLSession *availableFloorForegroundSessionQueue;
  void *v4;
  CLQueuedNSURLSession *v5;
  uint64_t v6;
  int v7;
  void *v8;
  CLQueuedNSURLSession *v9;
  CLQueuedNSURLSession *v10;
  const char *v12;
  uint64_t v13;

  availableFloorForegroundSessionQueue = self->_availableFloorForegroundSessionQueue;
  if (!availableFloorForegroundSessionQueue)
  {
    sub_10016E2E8((uint64_t)&v12);
    sub_100310C94((uint64_t *)&v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorTilePrefetcher foregroundSessionConfigurationWithTimeout:](CLIndoorTilePrefetcher, "foregroundSessionConfigurationWithTimeout:"));
    v5 = [CLQueuedNSURLSession alloc];
    v12 = sub_10016E278();
    v13 = v6;
    v7 = sub_1000AAF28((uint64_t)&v12, (unsigned int *)&v13 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher downloadQ](self, "downloadQ"));
    v9 = -[CLQueuedNSURLSession initWithMaxTasks:usingDelegate:withSessionConfiguration:andProxiedSessionDelegate:andSessionDelegateQueue:](v5, "initWithMaxTasks:usingDelegate:withSessionConfiguration:andProxiedSessionDelegate:andSessionDelegateQueue:", v7, self, v4, self, v8);
    v10 = self->_availableFloorForegroundSessionQueue;
    self->_availableFloorForegroundSessionQueue = v9;

    availableFloorForegroundSessionQueue = self->_availableFloorForegroundSessionQueue;
  }
  return availableFloorForegroundSessionQueue;
}

- (NSDate)now
{
  NSObject *v3;
  id v4;
  _QWORD v6[5];
  dispatch_semaphore_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1000BCD24;
  v13 = sub_1000BCCB8;
  v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003333AC;
  v6[3] = &unk_1004076C0;
  v7 = dispatch_semaphore_create(0);
  v8 = &v9;
  v6[4] = self;
  v3 = v7;
  -[CLIndoorTilePrefetcher runFromNetworkCallback:](self, "runFromNetworkCallback:", v6);
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return (NSDate *)v4;
}

- (void)setNow:(id)a3
{
  std::future<void> v4;
  _QWORD v5[7];
  std::promise<void> v6;
  id v7;
  CLIndoorTilePrefetcher *v8;

  v8 = self;
  v7 = a3;
  std::promise<void>::promise(&v6);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3321888768;
  v5[2] = sub_1003334F4;
  v5[3] = &unk_1004076E0;
  v5[4] = &v8;
  v5[5] = &v7;
  v5[6] = &v6;
  -[CLIndoorTilePrefetcher runFromNetworkCallback:](self, "runFromNetworkCallback:", v5);
  std::promise<void>::get_future(&v6);
  std::future<void>::get(&v4);
  std::future<void>::~future(&v4);
  std::promise<void>::~promise(&v6);

}

+ (id)urlForFloor:(id)a3 withTileServer:(id)a4
{
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  if ((unint64_t)v7 >= 6)
    v8 = 6;
  else
    v8 = (unint64_t)v7;
  v9 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", (char *)objc_msgSend(v5, "length") + 3 * (v8 >> 1) + 1);
  if (v8 >= 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", 0, 2));
    objc_msgSend(v9, "appendString:", v10);

    if (v8 > 3)
    {
      objc_msgSend(v9, "appendString:", CFSTR("/"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", 2, 2));
      objc_msgSend(v9, "appendString:", v11);

      if (v8 >= 6)
      {
        objc_msgSend(v9, "appendString:", CFSTR("/"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", 4, 2));
        objc_msgSend(v9, "appendString:", v12);

      }
    }
  }
  objc_msgSend(v9, "appendString:", CFSTR("/"));
  objc_msgSend(v9, "appendString:", v5);
  objc_msgSend(v9, "appendString:", CFSTR("/"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v9, v6));

  return v13;
}

+ (id)urlForAsset:(id)a3 forFloor:(id)a4 withTileServer:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorTilePrefetcher urlForFloor:withTileServer:](CLIndoorTilePrefetcher, "urlForFloor:withTileServer:", a4, a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v7, v8));

  return v9;
}

- (void)prefetch:(id)a3
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  unsigned int v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  _BYTE v40[10];
  _BYTE v41[14];
  _BYTE v42[10];
  __int16 v43;
  unsigned int v44;
  _BYTE v45[128];

  v30 = a3;
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407900);
  v3 = (id)qword_100417F00;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(v30, "count");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher tileServer](self, "tileServer"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "absoluteString")));
    *(_DWORD *)buf = 134349315;
    *(_QWORD *)v40 = v4;
    *(_WORD *)&v40[8] = 2081;
    *(_QWORD *)v41 = objc_msgSend(v6, "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "TileFetch, count, %{public}lu, server, %{private}s", buf, 0x16u);

  }
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407900);
  v7 = (id)qword_100417F00;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "description"));
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Request to prefetch: %{private}@", buf, 0xCu);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher backgroundSessionQueue](self, "backgroundSessionQueue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "session"));
  objc_msgSend(v10, "getTasksWithCompletionHandler:", &stru_100407730);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v30;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v11)
  {
    v31 = 0;
    v32 = 0;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "floorUuid"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "venueUuid"));
        v17 = objc_msgSend(v14, "locationContext");
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "relevancy"));
        v19 = -[CLIndoorTilePrefetcher scheduleDownloadForFloorMetadata:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:](self, "scheduleDownloadForFloorMetadata:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:", v15, v16, v17, v18, objc_msgSend(v14, "allowCellularDownload"), 0, 0, 0);

        if (qword_100417EF8 != -1)
          dispatch_once(&qword_100417EF8, &stru_100407900);
        v20 = (id)qword_100417F00;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "venueUuid")));
          v22 = objc_msgSend(v21, "UTF8String");
          v23 = objc_msgSend(v14, "priority");
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "relevancy"));
          objc_msgSend(v24, "timeIntervalSinceNow");
          v26 = v25;
          v27 = objc_msgSend(v14, "allowCellularDownload");
          *(_DWORD *)buf = 136381699;
          *(_QWORD *)v40 = v22;
          *(_WORD *)&v40[8] = 1026;
          *(_DWORD *)v41 = v19;
          *(_WORD *)&v41[4] = 2050;
          *(_QWORD *)&v41[6] = v23;
          *(_WORD *)v42 = 2050;
          *(double *)&v42[2] = v26 / 3600.0;
          v43 = 1026;
          v44 = v27;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "@TileFetch, reqcheck, %{private}s, %{public}d, priority, %{public}ld, relevancy, %{public}.1f, cell, %{public}d", buf, 0x2Cu);

        }
        if (v19 == 2)
        {
          LODWORD(v32) = v32 + 1;
        }
        else if (v19 == 1)
        {
          ++HIDWORD(v31);
        }
        else if (v19)
        {
          if (qword_100417EF8 != -1)
            dispatch_once(&qword_100417EF8, &stru_100407900);
          ++HIDWORD(v32);
          v28 = qword_100417F00;
          if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67240192;
            *(_DWORD *)v40 = v19;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "@TileFetch, unxpected, scheduled, %{public}d, #Warning", buf, 8u);
          }
        }
        else
        {
          LODWORD(v31) = v31 + 1;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v11);
  }
  else
  {
    v31 = 0;
    v32 = 0;
  }

  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407900);
    v29 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    goto LABEL_34;
  }
  v29 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
  {
LABEL_34:
    *(_DWORD *)buf = 67241216;
    *(_DWORD *)v40 = v31;
    *(_WORD *)&v40[4] = 1026;
    *(_DWORD *)&v40[6] = HIDWORD(v31);
    *(_WORD *)v41 = 1026;
    *(_DWORD *)&v41[2] = v32;
    *(_WORD *)&v41[6] = 1026;
    *(_DWORD *)&v41[8] = 0;
    *(_WORD *)&v41[12] = 1026;
    *(_DWORD *)v42 = HIDWORD(v32);
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "@TileFetch, scheduled, prefetch, mtnsu, %{public}d, %{public}d, %{public}d, %{public}d, %{public}d", buf, 0x20u);
  }
LABEL_35:

}

- (void)cancelDownloadTasksMatching:(id)a3 onSession:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003340E4;
  v6[3] = &unk_100407780;
  v7 = a3;
  v5 = v7;
  objc_msgSend(a4, "getTasksWithCompletionHandler:", v6);

}

- (void)cancelAllInflightForegroundDownloadTasks
{
  -[CLIndoorTilePrefetcher cancelInflightForegroundTasksMatching:](self, "cancelInflightForegroundTasksMatching:", 0);
}

- (void)scheduleDownloadForRequest:(id)a3 withResumeData:(id)a4 withSession:(int)a5 andExpectedByteSize:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  const std::string::value_type *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  std::string *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  CLIndoorTilePrefetcher *v22;
  CLIndoorTilePrefetcher *v23;
  uint64_t v24;
  void *v25;
  CLQueuedNSURLRequest *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  std::string v32;
  _BYTE buf[12];
  __int16 v34;
  std::string *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  const __CFString *v39;
  __int16 v40;
  void *v41;

  v10 = a3;
  v11 = a4;
  v12 = v10;
  v31 = v11;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[IndoorRequestInfo indoorRequestInfoFromRequest:](IndoorRequestInfo, "indoorRequestInfoFromRequest:", v10));
  v13 = objc_msgSend(v30, "session");
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "venueUuid"));
  *((_BYTE *)&v32.__r_.__value_.__s + 23) = 0;
  v32.__r_.__value_.__s.__data_[0] = 0;
  if (v13)
  {
    if (objc_msgSend(v30, "session") == 1)
      v14 = "with available floor";
    else
      v14 = "with unavailable floor";
    std::string::assign(&v32, v14);
  }
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407900);
  v15 = (id)qword_100417F00;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = a5;
    v28 = v10;
    if (v13)
      v17 = "foreground";
    else
      v17 = "background";
    if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v18 = &v32;
    else
      v18 = (std::string *)v32.__r_.__value_.__r.__words[0];
    if (objc_msgSend(v30, "context"))
      v19 = CFSTR("Regional");
    else
      v19 = CFSTR("Indoor");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "URL"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "description"));
    *(_DWORD *)buf = 136447235;
    *(_QWORD *)&buf[4] = v17;
    v34 = 2082;
    v35 = v18;
    v36 = 2113;
    v37 = v29;
    v38 = 2113;
    v39 = v19;
    v40 = 2113;
    v41 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Scheduling %{public}s download %{public}s of '%{private}@' (%{private}@): %{private}@", buf, 0x34u);

    v12 = v28;
    a5 = v16;

  }
  if (!v13)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher backgroundSessionQueue](self, "backgroundSessionQueue"));
    v26 = -[CLQueuedNSURLRequest initWithRequest:withPriority:]([CLQueuedNSURLRequest alloc], "initWithRequest:withPriority:", v12, 1);
    objc_msgSend(v25, "resumeRequestIfAllowedOrEnqueue:", v26);
    goto LABEL_32;
  }
  v22 = self;
  v23 = v22;
  if (a5 == 2)
  {
    v24 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher unavailableFloorForegroundSessionQueue](v22, "unavailableFloorForegroundSessionQueue"));
  }
  else if (a5 == 1)
  {
    v24 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher availableFloorForegroundSessionQueue](v22, "availableFloorForegroundSessionQueue"));
  }
  else
  {
    v24 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher backgroundSessionQueue](v22, "backgroundSessionQueue"));
  }
  v25 = (void *)v24;

  if (!v25)
  {
    sub_1003452E4();

    abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/purpleslam/daemon/indoorservice/CLIndoorTilePrefetcher.mm", 658, "-[CLIndoorTilePrefetcher scheduleDownloadForRequest:withResumeData:withSession:andExpectedByteSize:]");
    __break(1u);
    goto LABEL_36;
  }
  if (!v31)
    goto LABEL_31;
  if (qword_100417EF8 != -1)
  {
LABEL_36:
    dispatch_once(&qword_100417EF8, &stru_100407900);
    v27 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_31;
    goto LABEL_30;
  }
  v27 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_30:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Using resume data", buf, 2u);
  }
LABEL_31:
  v26 = -[CLQueuedNSURLRequest initWithRequest:withPriority:andResumeData:andCountOfBytesClientExpectsToReceive:]([CLQueuedNSURLRequest alloc], "initWithRequest:withPriority:andResumeData:andCountOfBytesClientExpectsToReceive:", v12, 0, v31, a6);
  objc_msgSend(v25, "resumeRequestIfAllowedOrEnqueue:", v26);
LABEL_32:

  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v32.__r_.__value_.__l.__data_);

}

- (BOOL)scheduleDownloadForTile:(id)a3 inVenue:(id)a4 withContext:(int64_t)a5 lastRelevant:(id)a6 allowCellularDownload:(BOOL)a7 onSession:(int)a8 withResumeData:(id)a9 withRequestUUID:(id)a10
{
  uint64_t v10;
  id v16;
  id v17;
  void *v18;
  id v19;
  unsigned __int8 v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  size_t v27;
  size_t v28;
  __int128 *p_dst;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  size_t v33;
  size_t v34;
  __n128 *v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __n128 v45;
  unint64_t v46;
  __int128 __dst;
  unint64_t v48;
  __int128 __p;
  uint64_t v50;
  void *v51;
  char v52;

  v10 = *(_QWORD *)&a8;
  v16 = a3;
  v44 = a4;
  v17 = a6;
  v42 = a9;
  v43 = a10;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegate](self, "delegate"));
  LOBYTE(v40) = a7;
  v19 = -[IndoorRequestInfo initFloor:inVenue:withContext:requestFor:withinSession:lastRelevant:allowCellularDownloadTile:requestUUID:]([IndoorRequestInfo alloc], "initFloor:inVenue:withContext:requestFor:withinSession:lastRelevant:allowCellularDownloadTile:requestUUID:", v16, v44, a5, 1, v10, v17, v40, v43);
  if (v16)
  {
    objc_msgSend(v16, "ps_STLString");
  }
  else
  {
    __p = 0uLL;
    v50 = 0;
  }
  v20 = objc_msgSend(v18, "tilePrefetchShouldPrefetchTileDataForFloor:", &__p);
  v21 = v20;
  if (SHIBYTE(v50) < 0)
  {
    operator delete((void *)__p);
    if (v21)
      goto LABEL_6;
LABEL_8:
    if (qword_100417EF8 == -1)
    {
      v25 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_11;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v25 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      {
LABEL_11:
        if ((_DWORD)v10)
        {
          -[CLIndoorTilePrefetcher notifyDelegateForegroundTaskCompleted:](self, "notifyDelegateForegroundTaskCompleted:", v19);
          goto LABEL_33;
        }
        v41 = v19;
        v26 = (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
        v27 = strlen(v26);
        if (v27 > 0x7FFFFFFFFFFFFFF7)
          sub_1000CDE30();
        v28 = v27;
        if (v27 >= 0x17)
        {
          v30 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v27 | 7) != 0x17)
            v30 = v27 | 7;
          v31 = v30 + 1;
          p_dst = (__int128 *)operator new(v30 + 1);
          *((_QWORD *)&__dst + 1) = v28;
          v48 = v31 | 0x8000000000000000;
          *(_QWORD *)&__dst = p_dst;
        }
        else
        {
          HIBYTE(v48) = v27;
          p_dst = &__dst;
          if (!v27)
          {
LABEL_21:
            *((_BYTE *)p_dst + v28) = 0;
            v32 = (const char *)objc_msgSend(objc_retainAutorelease(v44), "UTF8String");
            v33 = strlen(v32);
            if (v33 > 0x7FFFFFFFFFFFFFF7)
              sub_1000CDE30();
            v34 = v33;
            if (v33 >= 0x17)
            {
              v36 = (v33 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v33 | 7) != 0x17)
                v36 = v33 | 7;
              v37 = v36 + 1;
              v35 = (__n128 *)operator new(v36 + 1);
              v45.n128_u64[1] = v34;
              v46 = v37 | 0x8000000000000000;
              v45.n128_u64[0] = (unint64_t)v35;
              v19 = v41;
            }
            else
            {
              HIBYTE(v46) = v33;
              v35 = &v45;
              v19 = v41;
              if (!v33)
              {
LABEL_29:
                v35->n128_u8[v34] = 0;
                *(_QWORD *)&v38 = sub_10008FD38((uint64_t)&__p, &__dst, &v45, +[CLLocationContextConversions fromCLPipelinedLocationContext:](CLLocationContextConversions, "fromCLPipelinedLocationContext:", a5)).n128_u64[0];
                if (SHIBYTE(v46) < 0)
                {
                  operator delete((void *)v45.n128_u64[0]);
                  if ((SHIBYTE(v48) & 0x80000000) == 0)
                    goto LABEL_31;
                }
                else if ((SHIBYTE(v48) & 0x80000000) == 0)
                {
                  goto LABEL_31;
                }
                operator delete((void *)__dst);
LABEL_31:
                objc_msgSend(v18, "tilePrefetchForTileId:updateRelevancy:", &__p, v17, v38);
                -[CLIndoorTilePrefetcher notifyDelegateIfPrefetchComplete](self, "notifyDelegateIfPrefetchComplete");
                if (v52 < 0)
                {
                  operator delete(v51);
                  if ((SHIBYTE(v50) & 0x80000000) == 0)
                    goto LABEL_33;
                }
                else if ((SHIBYTE(v50) & 0x80000000) == 0)
                {
                  goto LABEL_33;
                }
                operator delete((void *)__p);
                goto LABEL_33;
              }
            }
            memmove(v35, v32, v34);
            goto LABEL_29;
          }
        }
        memmove(p_dst, v26, v28);
        goto LABEL_21;
      }
    }
    LODWORD(__p) = 138477827;
    *(_QWORD *)((char *)&__p + 4) = v16;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Prefetch of tile data for %{private}@ is unnecessary.  Not scheduling", (uint8_t *)&__p, 0xCu);
    goto LABEL_11;
  }
  if ((v20 & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher tileServer](self, "tileServer"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorTilePrefetcher urlForAsset:forFloor:withTileServer:](CLIndoorTilePrefetcher, "urlForAsset:forFloor:withTileServer:", CFSTR("tilep.xz"), v16, v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[CLIndoorTilePrefetcher createNewRequest:forURL:lastRelevant:](CLIndoorTilePrefetcher, "createNewRequest:forURL:lastRelevant:", v10, v23, v17));
  objc_msgSend(v19, "setOnRequest:", v24);
  -[CLIndoorTilePrefetcher scheduleDownloadForRequest:withResumeData:withSession:andExpectedByteSize:](self, "scheduleDownloadForRequest:withResumeData:withSession:andExpectedByteSize:", v24, v42, v10, 0x200000);

LABEL_33:
  return v21;
}

- (void)runFromNetworkCallback:(id)a3
{
  id v5;
  const char *Name;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD block[4];
  id v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v5 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_1000BCD24;
  v19[4] = sub_1000BCCB8;
  Name = sel_getName(a2);
  v20 = (id)os_transaction_create(Name);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher downloadQ](self, "downloadQ"));
  v8 = (uint64_t)objc_msgSend(v7, "maxConcurrentOperationCount");

  if (v8 < 2)
  {
    v11 = objc_autoreleasePoolPush();
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher downloadQ](self, "downloadQ"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100335304;
    v13[3] = &unk_1004077C8;
    v14 = v5;
    v15 = v19;
    objc_msgSend(v12, "addOperationWithBlock:", v13);

    objc_autoreleasePoolPop(v11);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher downloadQ](self, "downloadQ"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "underlyingQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003352BC;
    block[3] = &unk_1004077C8;
    v17 = v5;
    v18 = v19;
    dispatch_barrier_async(v10, block);

  }
  _Block_object_dispose(v19, 8);

}

- (void)notifyDelegateForegroundFetchComplete
{
  const char *Name;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;
  id location[2];
  _QWORD v9[5];
  id v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_1000BCD24;
  v9[4] = sub_1000BCCB8;
  Name = sel_getName(a2);
  v10 = (id)os_transaction_create(Name);
  v4 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegateQ](self, "delegateQ"));
  if (!v4)
  {
    if (qword_100417EF8 == -1)
    {
      v5 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_6;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v5 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_6;
    }
    LOWORD(location[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "delegate queue is no longer valid. Ignoring callback", (uint8_t *)location, 2u);
    goto LABEL_6;
  }
  objc_initWeak(location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003354D8;
  v6[3] = &unk_1004077F0;
  objc_copyWeak(&v7, location);
  v6[4] = v9;
  dispatch_async(v4, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(location);
LABEL_6:

  _Block_object_dispose(v9, 8);
}

- (void)onQueueNotifyDelegateForegroundFetchComplete
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegate](self, "delegate"));
  objc_msgSend(v2, "tileForegroundFetchFinishedAllDownloads");

}

- (void)notifyDelegateIfPrefetchComplete
{
  NSObject *v4;
  const char *Name;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];
  id v9;
  id location;

  v4 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegateQ](self, "delegateQ"));
  dispatch_assert_queue_V2(v4);

  objc_initWeak(&location, self);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_1000BCD24;
  v8[4] = sub_1000BCCB8;
  Name = sel_getName(a2);
  v9 = (id)os_transaction_create(Name);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1003356C4;
  v6[3] = &unk_1004077F0;
  objc_copyWeak(&v7, &location);
  v6[4] = v8;
  -[CLIndoorTilePrefetcher runFromNetworkCallback:](self, "runFromNetworkCallback:", v6);
  objc_destroyWeak(&v7);
  _Block_object_dispose(v8, 8);

  objc_destroyWeak(&location);
}

- (void)notifyDelegateForegroundTaskCompleted:(id)a3 withError:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  const char *Name;
  void *v11;
  _BYTE v12[32];

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegateQ](self, "delegateQ"));
  dispatch_assert_queue_V2(v9);

  Name = sel_getName(a2);
  sub_10007CED4((uint64_t)v12, Name);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegate](self, "delegate"));
  objc_msgSend(v11, "prefetcher:didFinishForegroundRequest:withError:", self, v7, v8);

  sub_10007CDC0((uint64_t)v12);
}

- (void)sessionWillSendRequestForEstablishedConnection:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  const char *Name;
  NSObject *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17;
  void (**v18)(id, _QWORD);
  _QWORD *v19;
  id v20;
  id location[2];
  _QWORD v22[5];
  id v23;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD))a5;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_1000BCD24;
  v22[4] = sub_1000BCCB8;
  Name = sel_getName(a2);
  v23 = (id)os_transaction_create(Name);
  v13 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegateQ](self, "delegateQ"));
  if (!v13)
  {
    v11[2](v11, 0);
    if (qword_100417EF8 == -1)
    {
      v14 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_6;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v14 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_6;
    }
    LOWORD(location[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "delegate queue is no longer valid. Ignoring callback", (uint8_t *)location, 2u);
    goto LABEL_6;
  }
  objc_initWeak(location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100335D20;
  block[3] = &unk_100407880;
  objc_copyWeak(&v20, location);
  v16 = v9;
  v17 = v10;
  v18 = v11;
  v19 = v22;
  dispatch_async(v13, block);

  objc_destroyWeak(&v20);
  objc_destroyWeak(location);
LABEL_6:

  _Block_object_dispose(v22, 8);
}

- (void)onQueueSessionWillSendRequestForEstablishedConnection:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  int v5;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  NSObject *v23;
  void *v24;
  __int128 *v25;
  void *v26;
  double v27;
  NSObject *v28;
  __int128 *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *__p[2];
  uint64_t v49;
  void *__dst[2];
  uint64_t v51;
  _QWORD v52[4];
  id v53;
  id v54;
  void *v55[2];
  uint64_t v56;
  __int128 v57;
  uint64_t v58;
  _BYTE buf[22];
  char v60;
  void *v61;
  char v62;

  v45 = a3;
  v47 = a4;
  v46 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegateQ](self, "delegateQ"));
  dispatch_assert_queue_V2(v9);

  v10 = objc_autoreleasePoolPush();
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IndoorRequestInfo indoorRequestInfoFromTask:](IndoorRequestInfo, "indoorRequestInfoFromTask:", v47));
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407900);
  v12 = (id)qword_100417F00;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)&buf[4] = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Download of %{private}@ starting", buf, 0xCu);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "venueUuid"));
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "ps_STLString");
  }
  else
  {
    v57 = 0uLL;
    v58 = 0;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "floorUuid"));
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "ps_STLString");
  }
  else
  {
    v55[0] = 0;
    v55[1] = 0;
    v56 = 0;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegate](self, "delegate"));
  if ((sub_100337A7C(v11, self->_now) & 1) == 0)
  {
    if (qword_100417EF8 == -1)
    {
      v23 = (id)qword_100417F00;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
LABEL_25:
        v24 = v18;
        if (v58 >= 0)
          v25 = &v57;
        else
          v25 = (__int128 *)v57;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastRelevant"));
        objc_msgSend(v26, "timeIntervalSinceNow");
        *(_DWORD *)buf = 136380931;
        *(_QWORD *)&buf[4] = v25;
        *(_WORD *)&buf[12] = 2050;
        *(double *)&buf[14] = v27 / 3600.0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "TileFetch, reqcb, %{private}s, tooold, %{public}.1f", buf, 0x16u);

        v18 = v24;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v23 = (id)qword_100417F00;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
    }

    v5 = 1;
    goto LABEL_30;
  }
  v19 = objc_msgSend(v11, "kind");
  if (v19 != 1)
  {
    if (!v19)
    {
      sub_10008930C(buf, (uint64_t)v55);
      v5 = -[CLIndoorTilePrefetcher shouldPrefetchFloorMetadataForFloorUuid:forSession:withLocationContext:](self, "shouldPrefetchFloorMetadataForFloorUuid:forSession:withLocationContext:", buf, objc_msgSend(v11, "session"), objc_msgSend(v11, "context"))? 0: 2;
      v20 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v21 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v22 = __ldaxr(v21);
        while (__stlxr(v22 - 1, v21));
        if (!v22)
        {
          ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
          std::__shared_weak_count::__release_weak(v20);
          if (qword_100417EF8 != -1)
            goto LABEL_55;
          goto LABEL_31;
        }
      }
    }
LABEL_30:
    if (qword_100417EF8 != -1)
      goto LABEL_55;
    goto LABEL_31;
  }
  if (objc_msgSend(v18, "tilePrefetchShouldPrefetchTileDataForFloor:", v55))
    v5 = 0;
  else
    v5 = 2;
  if (qword_100417EF8 != -1)
  {
LABEL_55:
    dispatch_once(&qword_100417EF8, &stru_100407900);
    v28 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    goto LABEL_32;
  }
LABEL_31:
  v28 = qword_100417F00;
  if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEFAULT))
    goto LABEL_35;
LABEL_32:
  v29 = &v57;
  if (v58 < 0)
    v29 = (__int128 *)v57;
  *(_DWORD *)buf = 136380931;
  *(_QWORD *)&buf[4] = v29;
  *(_WORD *)&buf[12] = 1026;
  *(_DWORD *)&buf[14] = v5;
  _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "TileFetch, reqcb, %{private}s, drop, %{public}d", buf, 0x12u);
LABEL_35:
  if (v5 != 2)
  {
    if (v5 != 1)
    {
      if (v5)
        goto LABEL_71;
      if (qword_100417EF8 == -1)
      {
        v30 = (id)qword_100417F00;
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
LABEL_41:

          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_1003367E4;
          v52[3] = &unk_1003EE580;
          v54 = v46;
          v53 = v45;
          -[CLIndoorTilePrefetcher runFromNetworkCallback:](self, "runFromNetworkCallback:", v52);

          goto LABEL_71;
        }
      }
      else
      {
        dispatch_once(&qword_100417EF8, &stru_100407900);
        v30 = (id)qword_100417F00;
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          goto LABEL_41;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Continuing download of %{private}@.  Determined to be necessary", buf, 0xCu);

      goto LABEL_41;
    }
    if (qword_100417EF8 == -1)
    {
      v34 = (id)qword_100417F00;
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
LABEL_50:

        objc_msgSend(v47, "cancel");
        (*((void (**)(id, _QWORD))v46 + 2))(v46, 0);
        goto LABEL_71;
      }
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v34 = (id)qword_100417F00;
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        goto LABEL_50;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)&buf[4] = v35;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Cancelling download of %{private}@ as it's too old", buf, 0xCu);

    goto LABEL_50;
  }
  if (qword_100417EF8 == -1)
  {
    v32 = (id)qword_100417F00;
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      goto LABEL_45;
    goto LABEL_44;
  }
  dispatch_once(&qword_100417EF8, &stru_100407900);
  v32 = (id)qword_100417F00;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
LABEL_44:
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
    *(_DWORD *)buf = 138477827;
    *(_QWORD *)&buf[4] = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Cancelling download of %{private}@ as it's in the DB", buf, 0xCu);

  }
LABEL_45:

  if (SHIBYTE(v56) < 0)
  {
    sub_10006CED8(__dst, v55[0], (unint64_t)v55[1]);
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)v55;
    v51 = v56;
  }
  if (SHIBYTE(v58) < 0)
  {
    sub_10006CED8(__p, (void *)v57, *((unint64_t *)&v57 + 1));
  }
  else
  {
    *(_OWORD *)__p = v57;
    v49 = v58;
  }
  *(_QWORD *)&v36 = sub_10008FD38((uint64_t)buf, (__int128 *)__dst, (__n128 *)__p, +[CLLocationContextConversions fromCLPipelinedLocationContext:](CLLocationContextConversions, "fromCLPipelinedLocationContext:", objc_msgSend(v11, "context"))).n128_u64[0];
  if (SHIBYTE(v49) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v51) & 0x80000000) == 0)
      goto LABEL_63;
  }
  else if ((SHIBYTE(v51) & 0x80000000) == 0)
  {
    goto LABEL_63;
  }
  operator delete(__dst[0]);
LABEL_63:
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastRelevant", v36));
  objc_msgSend(v18, "tilePrefetchForTileId:updateRelevancy:", buf, v37);

  objc_msgSend(v47, "cancel");
  if (objc_msgSend(v11, "kind"))
  {
    if (objc_msgSend(v11, "session"))
      -[CLIndoorTilePrefetcher notifyDelegateForegroundTaskCompleted:](self, "notifyDelegateForegroundTaskCompleted:", v11);
  }
  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "floorUuid"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "venueUuid"));
    v39 = objc_msgSend(v11, "context");
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastRelevant"));
    v41 = objc_msgSend(v11, "allowCellularDownloadTile");
    v42 = objc_msgSend(v11, "session");
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestUUID"));
    -[CLIndoorTilePrefetcher scheduleDownloadForTile:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:](self, "scheduleDownloadForTile:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:", v38, v44, v39, v40, v41, v42, 0, v43);

  }
  (*((void (**)(id, _QWORD))v46 + 2))(v46, 0);
  if (v62 < 0)
  {
    operator delete(v61);
    if ((v60 & 0x80000000) == 0)
      goto LABEL_71;
  }
  else if ((v60 & 0x80000000) == 0)
  {
    goto LABEL_71;
  }
  operator delete(*(void **)buf);
LABEL_71:

  if (SHIBYTE(v56) < 0)
  {
    operator delete(v55[0]);
    if ((SHIBYTE(v58) & 0x80000000) == 0)
      goto LABEL_73;
LABEL_75:
    operator delete((void *)v57);
    goto LABEL_73;
  }
  if (SHIBYTE(v58) < 0)
    goto LABEL_75;
LABEL_73:

  objc_autoreleasePoolPop(v10);
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  -[CLIndoorTilePrefetcher sessionWillSendRequestForEstablishedConnection:task:completionHandler:](self, "sessionWillSendRequestForEstablishedConnection:task:completionHandler:", a5, a4, a6);
}

- (void)session:(id)a3 didFinishDownloadTask:(id)a4 toPath:(id)a5 inTempPath:(shared_ptr<TemporaryPath>)a6
{
  TemporaryPath *var0;
  id v11;
  id v12;
  id v13;
  const char *Name;
  NSObject *v15;
  id v16;
  std::__shared_weak_count *v17;
  void *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  NSObject *v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  _QWORD *v29;
  id v30[2];
  std::__shared_weak_count *v31;
  id location[2];
  _QWORD v33[5];
  id v34;

  var0 = a6.var0;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = sub_1000BCD24;
  v33[4] = sub_1000BCCB8;
  Name = sel_getName(a2);
  v34 = (id)os_transaction_create(Name);
  v15 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegateQ](self, "delegateQ"));
  if (!v15)
  {
    if (qword_100417EF8 == -1)
    {
      v24 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_14;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v24 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_14;
    }
    LOWORD(location[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "delegate queue is no longer valid. Ignoring callback", (uint8_t *)location, 2u);
    goto LABEL_14;
  }
  objc_initWeak(location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3321888768;
  block[2] = sub_100336A8C;
  block[3] = &unk_1004078A8;
  objc_copyWeak(v30, location);
  v26 = v11;
  v27 = v12;
  v16 = v13;
  v18 = *(void **)var0;
  v17 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
  v28 = v16;
  v30[1] = v18;
  v31 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v20 = __ldxr(p_shared_owners);
    while (__stxr(v20 + 1, p_shared_owners));
  }
  v29 = v33;
  dispatch_async(v15, block);
  v21 = v31;
  if (v31)
  {
    v22 = (unint64_t *)&v31->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }

  objc_destroyWeak(v30);
  objc_destroyWeak(location);
LABEL_14:

  _Block_object_dispose(v33, 8);
}

- (void)onQueueSession:(id)a3 didFinishDownloadTask:(id)a4 toPath:(id)a5 inTempPath:(shared_ptr<TemporaryPath>)a6
{
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  const char *v13;
  size_t v14;
  void *v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void **v22;
  unsigned int v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *context;
  id v32;
  void *v33;
  id v34;
  id WeakRetained;
  id v36;
  void *__dst[2];
  int64_t v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  void **v42;

  v32 = a3;
  v36 = a4;
  v34 = a5;
  v9 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegateQ](self, "delegateQ"));
  dispatch_assert_queue_V2(v9);

  v10 = objc_autoreleasePoolPush();
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IndoorRequestInfo indoorRequestInfoFromTask:](IndoorRequestInfo, "indoorRequestInfoFromTask:", v36));
  context = v10;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "response"));
  v12 = objc_retainAutorelease(v34);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  v14 = strlen(v13);
  if (v14 >= 0x7FFFFFFFFFFFFFF8)
    sub_1000CDE30();
  v15 = (void *)v14;
  if (v14 >= 0x17)
  {
    v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v17 = v14 | 7;
    v18 = v17 + 1;
    v16 = (void **)operator new(v17 + 1);
    __dst[1] = v15;
    v38 = v18 | 0x8000000000000000;
    __dst[0] = v16;
    goto LABEL_8;
  }
  HIBYTE(v38) = v14;
  v16 = __dst;
  if (v14)
LABEL_8:
    memmove(v16, v13, (size_t)v15);
  *((_BYTE *)v15 + (_QWORD)v16) = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407900);
  v19 = (id)qword_100417F00;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
    v21 = (void *)v20;
    v22 = __dst;
    if (v38 < 0)
      v22 = (void **)__dst[0];
    *(_DWORD *)buf = 138478083;
    v40 = v20;
    v41 = 2081;
    v42 = v22;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "download complete: %{private}@. tmpfile = %{private}s", buf, 0x16u);

  }
  objc_msgSend(WeakRetained, "tilePrefetchDidDownload:forRequest:", __dst, v11);
  v23 = objc_msgSend(v11, "kind");
  if (v23)
  {
    if (v23 == 1)
    {
      if (objc_msgSend(v11, "session"))
        -[CLIndoorTilePrefetcher notifyDelegateForegroundTaskCompleted:](self, "notifyDelegateForegroundTaskCompleted:", v11);
      else
        -[CLIndoorTilePrefetcher notifyDelegateIfPrefetchComplete](self, "notifyDelegateIfPrefetchComplete");
    }
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "floorUuid"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "venueUuid"));
    v26 = objc_msgSend(v11, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastRelevant"));
    v28 = objc_msgSend(v11, "allowCellularDownloadTile");
    v29 = objc_msgSend(v11, "session");
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestUUID"));
    -[CLIndoorTilePrefetcher scheduleDownloadForTile:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:](self, "scheduleDownloadForTile:inVenue:withContext:lastRelevant:allowCellularDownload:onSession:withResumeData:withRequestUUID:", v24, v25, v26, v27, v28, v29, 0, v30);

  }
  if (SHIBYTE(v38) < 0)
    operator delete(__dst[0]);

  objc_autoreleasePoolPop(context);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  unint64_t *v27;
  char *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *p_shared_owners;
  unint64_t v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  char *v50;
  std::__shared_weak_count *v51;
  id v52;
  void *v53;
  __int128 v54;
  char *v55;
  std::__shared_weak_count *v56;
  void *__p[2];
  char v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  _QWORD v63[2];
  _QWORD v64[2];

  v48 = a3;
  v8 = a4;
  v46 = a5;
  v49 = v8;
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[IndoorRequestInfo indoorRequestInfoFromTask:](IndoorRequestInfo, "indoorRequestInfoFromTask:", v8));
  if ((sub_100337A7C(v47, self->_now) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "response"));
    if ((uint64_t)objc_msgSend(v9, "statusCode") >= 200 && (uint64_t)objc_msgSend(v9, "statusCode") < 400)
    {
      v53 = operator new(0x20uLL);
      v54 = xmmword_100382FF0;
      strcpy((char *)v53, "urlSessionDidFinishDownloading");
      sub_1000D8C1C(0, (uint64_t)__p);
      sub_10031A338((uint64_t)__p, (const void **)&v53, (uint64_t)buf);
      if (v58 < 0)
        operator delete(__p[0]);
      v26 = operator new(0x38uLL);
      v26[1] = 0;
      v27 = v26 + 1;
      v26[2] = 0;
      *v26 = off_100407930;
      sub_10031A62C((_BYTE *)v26 + 24, (__int128 *)buf);
      v55 = (char *)(v26 + 3);
      v56 = (std::__shared_weak_count *)v26;
      sub_10031A7CC((uint64_t)buf);
      if (SHIBYTE(v54) < 0)
        operator delete(v53);
      v28 = (char *)(v26 + 3);
      if (*((char *)v26 + 47) < 0)
        v28 = (char *)v26[3];
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v28));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "lastPathComponent"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v29, v30));

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v32 = objc_retainAutorelease(v46);
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(v32, "fileSystemRepresentation")));
      v52 = 0;
      objc_msgSend(v31, "moveItemAtPath:toPath:error:", v33, v45, &v52);
      v34 = v52;

      if (v34)
      {
        if (qword_100417EF8 != -1)
          dispatch_once(&qword_100417EF8, &stru_100407900);
        v35 = (id)qword_100417F00;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "description"));
          v37 = objc_msgSend(objc_retainAutorelease(v32), "fileSystemRepresentation");
          *(_DWORD *)buf = 138543618;
          v60 = v36;
          v61 = 2082;
          v62 = v37;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Error moving URLSession temp file to our own temporary path. %{public}@, %{public}s", buf, 0x16u);

        }
      }
      else
      {
        v50 = (char *)(v26 + 3);
        v51 = (std::__shared_weak_count *)v26;
        do
          v41 = __ldxr(v27);
        while (__stxr(v41 + 1, v27));
        -[CLIndoorTilePrefetcher session:didFinishDownloadTask:toPath:inTempPath:](self, "session:didFinishDownloadTask:toPath:inTempPath:", v48, v49, v45, &v50);
        v42 = v51;
        if (v51)
        {
          p_shared_owners = (unint64_t *)&v51->__shared_owners_;
          do
            v44 = __ldaxr(p_shared_owners);
          while (__stlxr(v44 - 1, p_shared_owners));
          if (!v44)
          {
            ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
            std::__shared_weak_count::__release_weak(v42);
          }
        }
      }

      v38 = v56;
      if (v56)
      {
        v39 = (unint64_t *)&v56->__shared_owners_;
        do
          v40 = __ldaxr(v39);
        while (__stlxr(v40 - 1, v39));
        if (!v40)
        {
          ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
          std::__shared_weak_count::__release_weak(v38);
        }
      }
    }
    else
    {
      if (qword_100417EF8 != -1)
        dispatch_once(&qword_100417EF8, &stru_100407900);
      v10 = (id)qword_100417F00;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "description"));
        *(_DWORD *)buf = 138478083;
        v60 = v11;
        v61 = 2050;
        v62 = objc_msgSend(v9, "statusCode");
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Download of %{private}@ failed with response code %{public}ld. Synthesizing error", buf, 0x16u);

      }
      v12 = objc_msgSend(v9, "statusCode");
      v63[0] = CFSTR("response");
      v13 = v9;
      v14 = v13;
      if (v13)
        v15 = v13;
      else
        v15 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v18 = v15;

      v64[0] = v18;
      v63[1] = NSURLErrorKey;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentRequest"));
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "URL"));
      v21 = v20;
      if (v20)
        v22 = v20;
      else
        v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v23 = v22;

      v64[1] = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v64, v63, 2));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("indoor tile prefetch"), v12, v24));

      -[CLIndoorTilePrefetcher URLSession:task:didCompleteWithError:](self, "URLSession:task:didCompleteWithError:", v48, v49, v25);
      v9 = v14;
    }
  }
  else
  {
    if (qword_100417EF8 != -1)
      dispatch_once(&qword_100417EF8, &stru_100407900);
    v16 = (id)qword_100417F00;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "description"));
      *(_DWORD *)buf = 138477827;
      v60 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Downloaded %{private}@ too irrelevant to accept into db", buf, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("foobar"), -1, &__NSDictionary0__struct));
    -[CLIndoorTilePrefetcher URLSession:task:didCompleteWithError:](self, "URLSession:task:didCompleteWithError:", v48, v49, v9);
  }

}

- (void)sessionDidCompleteTask:(id)a3 withError:(id)a4
{
  id v7;
  id v8;
  const char *Name;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  id location[2];
  _QWORD v18[5];
  id v19;

  v7 = a3;
  v8 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_1000BCD24;
  v18[4] = sub_1000BCCB8;
  Name = sel_getName(a2);
  v19 = (id)os_transaction_create(Name);
  v10 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegateQ](self, "delegateQ"));
  if (!v10)
  {
    if (qword_100417EF8 == -1)
    {
      v11 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_6;
    }
    else
    {
      dispatch_once(&qword_100417EF8, &stru_100407900);
      v11 = qword_100417F00;
      if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
        goto LABEL_6;
    }
    LOWORD(location[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "delegate queue is no longer valid. Ignoring callback", (uint8_t *)location, 2u);
    goto LABEL_6;
  }
  objc_initWeak(location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100337F68;
  v12[3] = &unk_1004078E0;
  objc_copyWeak(&v16, location);
  v13 = v7;
  v14 = v8;
  v15 = v18;
  dispatch_async(v10, v12);

  objc_destroyWeak(&v16);
  objc_destroyWeak(location);
LABEL_6:

  _Block_object_dispose(v18, 8);
}

- (void)onQueueSessionDidCompleteTask:(id)a3 withError:(id)a4
{
  id v4;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  size_t v15;
  std::string::size_type v16;
  std::string *p_dst;
  uint64_t v18;
  uint64_t v19;
  std::string *v20;
  __int128 v21;
  std::string *v22;
  __int128 v23;
  id v24;
  std::string *v25;
  __int128 v26;
  void **v27;
  std::string::size_type v28;
  unsigned int v29;
  void *v30;
  void *v31;
  NSObject *v32;
  std::string::size_type v33;
  void *v34;
  std::string *v35;
  std::string::size_type v36;
  void *v37;
  std::string *v38;
  std::string::size_type v39;
  void *v40;
  std::string *v41;
  void *context;
  std::string v43;
  std::string v44;
  void *__p[2];
  int64_t v46;
  std::string __dst;
  uint8_t buf[32];
  std::string v49;

  v7 = a3;
  v8 = a4;
  v9 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegateQ](self, "delegateQ"));
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "response"));
  v11 = objc_msgSend(v10, "statusCode");

  if (v8 || v11 != (id)200)
  {
    sub_10007CED4((uint64_t)buf, "prefetch didCompleteWithError:");
    context = objc_autoreleasePoolPush();
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[IndoorRequestInfo indoorRequestInfoFromTask:](IndoorRequestInfo, "indoorRequestInfoFromTask:", v7));
    if (v8)
    {
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description")));
      v14 = (const char *)objc_msgSend(v4, "UTF8String");
      v15 = strlen(v14);
      if (v15 < 0x7FFFFFFFFFFFFFF8)
        goto LABEL_8;
    }
    else
    {
      v14 = "no error object";
      v15 = strlen("no error object");
      if (v15 < 0x7FFFFFFFFFFFFFF8)
      {
LABEL_8:
        v16 = v15;
        if (v15 >= 0x17)
        {
          v18 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v15 | 7) != 0x17)
            v18 = v15 | 7;
          v19 = v18 + 1;
          p_dst = (std::string *)operator new(v18 + 1);
          __dst.__r_.__value_.__l.__size_ = v16;
          __dst.__r_.__value_.__r.__words[2] = v19 | 0x8000000000000000;
          __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
        }
        else
        {
          *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v15;
          p_dst = &__dst;
          if (!v15)
          {
            __dst.__r_.__value_.__s.__data_[0] = 0;
            if (!v8)
            {
LABEL_17:
              std::to_string(&v43, (uint64_t)v11);
              v20 = std::string::insert(&v43, 0, ". status = ");
              v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
              v44.__r_.__value_.__r.__words[2] = v20->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v44.__r_.__value_.__l.__data_ = v21;
              v20->__r_.__value_.__l.__size_ = 0;
              v20->__r_.__value_.__r.__words[2] = 0;
              v20->__r_.__value_.__r.__words[0] = 0;
              v22 = std::string::append(&v44, ": ");
              v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
              v49.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v49.__r_.__value_.__l.__data_ = v23;
              v22->__r_.__value_.__l.__size_ = 0;
              v22->__r_.__value_.__r.__words[2] = 0;
              v22->__r_.__value_.__r.__words[0] = 0;
              v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", v11)));
              v25 = std::string::append(&v49, (const std::string::value_type *)objc_msgSend(v24, "UTF8String"));
              v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
              v46 = v25->__r_.__value_.__r.__words[2];
              *(_OWORD *)__p = v26;
              v25->__r_.__value_.__l.__size_ = 0;
              v25->__r_.__value_.__r.__words[2] = 0;
              v25->__r_.__value_.__r.__words[0] = 0;
              if (v46 >= 0)
                v27 = __p;
              else
                v27 = (void **)__p[0];
              if (v46 >= 0)
                v28 = HIBYTE(v46);
              else
                v28 = (std::string::size_type)__p[1];
              std::string::append(&__dst, (const std::string::value_type *)v27, v28);
              if (SHIBYTE(v46) < 0)
                operator delete(__p[0]);

              if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(v49.__r_.__value_.__l.__data_);
                if ((SHIBYTE(v44.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                {
LABEL_27:
                  if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                    goto LABEL_28;
LABEL_34:
                  operator delete(v43.__r_.__value_.__l.__data_);
LABEL_28:
                  v29 = objc_msgSend(v13, "session");
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "floorUuid"));
                  v31 = v30;
                  if (v30)
                  {
                    objc_msgSend(v30, "ps_STLString");
                  }
                  else
                  {
                    __p[0] = 0;
                    __p[1] = 0;
                    v46 = 0;
                  }

                  if (objc_msgSend(v8, "code") == (id)-999)
                  {
                    if (qword_100417EF8 != -1)
                      dispatch_once(&qword_100417EF8, &stru_100407900);
                    v32 = (id)qword_100417F00;
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                    {
                      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
                      v34 = (void *)v33;
                      v35 = &__dst;
                      if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                        v35 = (std::string *)__dst.__r_.__value_.__r.__words[0];
                      LODWORD(v49.__r_.__value_.__l.__data_) = 138478083;
                      *(std::string::size_type *)((char *)v49.__r_.__value_.__r.__words + 4) = v33;
                      WORD2(v49.__r_.__value_.__r.__words[1]) = 2081;
                      *(std::string::size_type *)((char *)&v49.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v35;
                      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "WARNING: Download of %{private}@ was cancelled: %{private}s", (uint8_t *)&v49, 0x16u);

                    }
                  }
                  else if (objc_msgSend(v8, "code") == (id)-1001)
                  {
                    if (qword_100417EF8 == -1)
                    {
                      v32 = (id)qword_100417F00;
                      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                        goto LABEL_54;
                    }
                    else
                    {
                      dispatch_once(&qword_100417EF8, &stru_100407900);
                      v32 = (id)qword_100417F00;
                      if (!os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                        goto LABEL_54;
                    }
                    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
                    v37 = (void *)v36;
                    v38 = &__dst;
                    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                      v38 = (std::string *)__dst.__r_.__value_.__r.__words[0];
                    LODWORD(v49.__r_.__value_.__l.__data_) = 138478083;
                    *(std::string::size_type *)((char *)v49.__r_.__value_.__r.__words + 4) = v36;
                    WORD2(v49.__r_.__value_.__r.__words[1]) = 2081;
                    *(std::string::size_type *)((char *)&v49.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v38;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "WARNING: Download of %{private}@ timed out: %{private}s", (uint8_t *)&v49, 0x16u);

                  }
                  else
                  {
                    if (qword_100417EF8 == -1)
                    {
                      v32 = (id)qword_100417F00;
                      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                        goto LABEL_54;
                    }
                    else
                    {
                      dispatch_once(&qword_100417EF8, &stru_100407900);
                      v32 = (id)qword_100417F00;
                      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
                        goto LABEL_54;
                    }
                    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
                    v40 = (void *)v39;
                    v41 = &__dst;
                    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                      v41 = (std::string *)__dst.__r_.__value_.__r.__words[0];
                    LODWORD(v49.__r_.__value_.__l.__data_) = 138478083;
                    *(std::string::size_type *)((char *)v49.__r_.__value_.__r.__words + 4) = v39;
                    WORD2(v49.__r_.__value_.__r.__words[1]) = 2081;
                    *(std::string::size_type *)((char *)&v49.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v41;
                    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Download of %{private}@ failed: %{private}s", (uint8_t *)&v49, 0x16u);

                  }
LABEL_54:

                  if (v29)
                    -[CLIndoorTilePrefetcher notifyDelegateForegroundTaskCompleted:withError:](self, "notifyDelegateForegroundTaskCompleted:withError:", v13, v8);
                  else
                    -[CLIndoorTilePrefetcher notifyDelegateIfPrefetchComplete](self, "notifyDelegateIfPrefetchComplete");
                  if (SHIBYTE(v46) < 0)
                  {
                    operator delete(__p[0]);
                    if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                      goto LABEL_59;
                  }
                  else if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  {
LABEL_59:

                    objc_autoreleasePoolPop(context);
                    sub_10007CDC0((uint64_t)buf);
                    goto LABEL_60;
                  }
                  operator delete(__dst.__r_.__value_.__l.__data_);
                  goto LABEL_59;
                }
              }
              else if ((SHIBYTE(v44.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
              {
                goto LABEL_27;
              }
              operator delete(v44.__r_.__value_.__l.__data_);
              if ((SHIBYTE(v43.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                goto LABEL_28;
              goto LABEL_34;
            }
LABEL_16:

            goto LABEL_17;
          }
        }
        memmove(p_dst, v14, v16);
        p_dst->__r_.__value_.__s.__data_[v16] = 0;
        if (!v8)
          goto LABEL_17;
        goto LABEL_16;
      }
    }
    sub_1000CDE30();
  }
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407900);
    v12 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
      goto LABEL_60;
    goto LABEL_5;
  }
  v12 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_DEBUG))
  {
LABEL_5:
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "NSURLSessionDelegate didCompleteWithError: invoked on a successfully completed task", buf, 2u);
  }
LABEL_60:

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  -[CLIndoorTilePrefetcher sessionDidCompleteTask:withError:](self, "sessionDidCompleteTask:withError:", a4, a5);
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  if (qword_100417EF8 != -1)
    dispatch_once(&qword_100417EF8, &stru_100407900);
  v8 = (id)qword_100417F00;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));
    v14 = 138543619;
    v15 = v9;
    v16 = 2113;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Session %{public}@ invalidated with error: %{private}@", (uint8_t *)&v14, 0x16u);

  }
  v11 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher delegateQ](self, "delegateQ"));
  dispatch_assert_queue_not_V2(v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher sessionInvalidationGroup](self, "sessionInvalidationGroup"));
  LOBYTE(v11) = v12 == 0;

  if ((v11 & 1) == 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(-[CLIndoorTilePrefetcher sessionInvalidationGroup](self, "sessionInvalidationGroup"));
    dispatch_group_leave(v13);

  }
}

- (void)session:(id)a3 didResumeRequest:(id)a4 withRemainingRequests:(unint64_t)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  unint64_t v13;

  v7 = a3;
  v8 = a4;
  if (qword_100417EF8 != -1)
  {
    dispatch_once(&qword_100417EF8, &stru_100407900);
    v9 = qword_100417F00;
    if (!os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = qword_100417F00;
  if (os_log_type_enabled((os_log_t)qword_100417F00, OS_LOG_TYPE_INFO))
  {
LABEL_3:
    v10 = 138478083;
    v11 = v8;
    v12 = 2050;
    v13 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Resuming request: %{private}@ with %{public}lu remaining", (uint8_t *)&v10, 0x16u);
  }
LABEL_4:

}

- (NSURL)tileServer
{
  return self->_tileServer;
}

- (void)setTileServer:(id)a3
{
  objc_storeStrong((id *)&self->_tileServer, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setBackgroundSessionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundSessionQueue, a3);
}

- (void)setAvailableFloorForegroundSessionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_availableFloorForegroundSessionQueue, a3);
}

- (void)setUnavailableFloorForegroundSessionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableFloorForegroundSessionQueue, a3);
}

- (void)setDelegateQ:(id)a3
{
  objc_storeWeak((id *)&self->_delegateQ, a3);
}

- (BOOL)isDaemon
{
  return self->_isDaemon;
}

- (void)setIsDaemon:(BOOL)a3
{
  self->_isDaemon = a3;
}

- (BOOL)discretionaryBackground
{
  return self->_discretionaryBackground;
}

- (void)setDiscretionaryBackground:(BOOL)a3
{
  self->_discretionaryBackground = a3;
}

- (BOOL)isTest
{
  return self->_isTest;
}

- (void)setIsTest:(BOOL)a3
{
  self->_isTest = a3;
}

- (void)setSessionInvalidationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInvalidationGroup, a3);
}

@end
