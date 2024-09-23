@implementation MTExternalFeedDownloader

- (void)configureSession:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "setTimeoutIntervalForRequest:", 60.0);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader configuration](self, "configuration"));
  objc_msgSend(v5, "timeoutIntervalForResource");
  objc_msgSend(v4, "setTimeoutIntervalForResource:");

}

- (void)restoreBackgroundDownloadTasksWithCompletion:(id)a3
{
  id v4;
  MTExternalFeedDownloader *v5;
  unsigned __int8 v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[MTExternalFeedDownloader sessionTaskStateReloaded](v5, "sessionTaskStateReloaded");
  -[MTExternalFeedDownloader setSessionTaskStateReloaded:](v5, "setSessionTaskStateReloaded:", 1);
  objc_sync_exit(v5);

  if ((v6 & 1) == 0)
  {
    -[MTExternalFeedDownloader loadSessionsIfNeeded](v5, "loadSessionsIfNeeded");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader sessionForBackgroundDownloads](v5, "sessionForBackgroundDownloads"));

    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader workQueue](v5, "workQueue"));
      dispatch_suspend(v8);

      v9 = _MTLogCategoryFeedUpdate();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader workQueue](v5, "workQueue"));
        *(_DWORD *)buf = 138412290;
        v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Rebuild pending network tasks - SUSPENDING workQueue: %@.", buf, 0xCu);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader sessionForBackgroundDownloads](v5, "sessionForBackgroundDownloads"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000CD960;
      v14[3] = &unk_1004A8FB0;
      v14[4] = v5;
      objc_msgSend(v12, "getAllTasksWithCompletionHandler:", v14);

    }
  }
  v13 = objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader workQueue](v5, "workQueue"));
  dispatch_async(v13, v4);

}

- (id)temporaryDirectory
{
  NSString *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;

  v3 = NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader configuration](self, "configuration"));
  v6 = objc_msgSend(v5, "keepsFeedFileInTempDirAfterDownload");

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("FeedUpdateDownloads")));

    v4 = (void *)v7;
  }
  return v4;
}

- (void)_removeTempFiles
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _QWORD block[5];

  global_queue = dispatch_get_global_queue(-32768, 0);
  v4 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012FB0;
  block[3] = &unk_1004A6200;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)setDelegate:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id obj;

  obj = a3;
  v5 = objc_opt_class(MTBaseFeedManager, v4);
  v7 = objc_opt_class(v5, v6);
  if ((objc_opt_isKindOfClass(obj, v7) & 1) == 0)
  {
    v9 = objc_opt_class(_TtC18PodcastsFoundation14RSSFeedUpdater, v8);
    v11 = objc_opt_class(v9, v10);
    objc_opt_isKindOfClass(obj, v11);
  }
  objc_storeWeak((id *)&self->_delegate, obj);

}

- (id)backgroundSessionConfigurationIdentifier
{
  void *v3;
  void *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;
  id v9;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader delegate](self, "delegate"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader delegate](self, "delegate"));
    v5 = (objc_class *)objc_opt_class(v4);
    v6 = NSStringFromClass(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    return v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)MTExternalFeedDownloader;
    v9 = -[MTExternalFeedDownloader backgroundSessionConfigurationIdentifier](&v10, "backgroundSessionConfigurationIdentifier");
    return (id)objc_claimAutoreleasedReturnValue(v9);
  }
}

- (void)startDownloadTaskForFeedURL:(id)a3 userInitiated:(BOOL)a4 useBackgroundFetch:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader delegate](self, "delegate"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader configuration](self, "configuration"));
    if (objc_msgSend(v10, "keepsFeedFileInTempDirAfterDownload"))
    {
      v11 = -[MTExternalFeedDownloader createPrivateTempDirIfNeeded](self, "createPrivateTempDirIfNeeded");

      if ((v11 & 1) == 0)
        goto LABEL_10;
    }
    else
    {

    }
    v13 = objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader privatePathForDownload](self, "privatePathForDownload"));
    v15.receiver = self;
    v15.super_class = (Class)MTExternalFeedDownloader;
    -[MTExternalFeedDownloader startDownloadTaskForURL:userInitiated:useBackgroundFetch:usePrivatePath:downloadStartedBlock:](&v15, "startDownloadTaskForURL:userInitiated:useBackgroundFetch:usePrivatePath:downloadStartedBlock:", v8, v6, v5, v13, 0);
  }
  else
  {
    v12 = _MTLogCategoryFeedUpdate();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "urlRawString"));
      *(_DWORD *)buf = 138412290;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ - Could not start download task for external feedUrl - external feed downloader has no delegate.", buf, 0xCu);

    }
  }

LABEL_10:
}

- (id)privatePathForDownload
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader configuration](self, "configuration"));
  v4 = objc_msgSend(v3, "keepsFeedFileInTempDirAfterDownload");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "globallyUniqueString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v6, CFSTR("_feed")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader temporaryDirectory](self, "temporaryDirectory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", v7));

    v11 = objc_retainAutorelease(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", objc_msgSend(v11, "fileSystemRepresentation"), 4));

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (_TtC18PodcastsFoundation29FeedManagerLocalConfiguration)configuration
{
  return self->_configuration;
}

- (MTExternalFeedDownloader)initWithDelegate:(id)a3
{
  id v4;
  MTExternalFeedDownloader *v5;
  MTExternalFeedDownloader *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  id v17;
  dispatch_queue_t v18;
  objc_super v20;
  uint8_t buf[4];
  MTExternalFeedDownloader *v22;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MTExternalFeedDownloader;
  v5 = -[MTExternalFeedDownloader init](&v20, "init");
  v6 = v5;
  if (v5)
  {
    v7 = _MTLogCategoryFeedUpdate(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "MTExternalFeedDownloader allocated: %@", buf, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[FeedManagerLocalConfiguration platformSpecificConfiguration](_TtC18PodcastsFoundation29FeedManagerLocalConfiguration, "platformSpecificConfiguration"));
    -[MTExternalFeedDownloader setConfiguration:](v6, "setConfiguration:", v9);

    if (v4)
      -[MTExternalFeedDownloader setDelegate:](v6, "setDelegate:", v4);
    -[MTExternalFeedDownloader _enqueueTempFilesDeletion](v6, "_enqueueTempFilesDeletion");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader configuration](v6, "configuration"));
    v11 = objc_msgSend(v10, "workQueueConcurrent");
    v12 = &_dispatch_queue_attr_concurrent;
    if (!v11)
      v12 = 0;
    v13 = v12;

    v14 = (objc_class *)objc_opt_class(v6);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-worker"), v16)));
    v18 = dispatch_queue_create((const char *)objc_msgSend(v17, "UTF8String"), v13);

    -[MTExternalFeedDownloader setWorkQueue:](v6, "setWorkQueue:", v18);
  }

  return v6;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void)_enqueueTempFilesDeletion
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004817C;
  block[3] = &unk_1004A6200;
  block[4] = self;
  if (qword_100567488 != -1)
    dispatch_once(&qword_100567488, block);
}

- (void)task:(id)a3 didFailWithError:(id)a4 orStatusCode:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  int64_t v29;
  char v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _BYTE *v34;
  _QWORD v35[4];
  id v36;
  id v37;
  int64_t v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[2];
  _QWORD v43[2];
  _BYTE buf[24];
  int64_t v45;
  void (*v46)(uint64_t);
  id v47;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend((id)objc_opt_class(self), "originalURLForTask:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = _MTLogCategoryFeedUpdate(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2048;
    v45 = a5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "didFailWithError: %@, error: %@, status: %ld", buf, 0x20u);
  }

  v14 = objc_msgSend(v9, "code");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "importContext"));

  if (a5 == 401 || v14 == (id)-1013 || v14 == (id)-1012)
  {
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000CD5B8;
    v39[3] = &unk_1004A6640;
    v40 = v16;
    v41 = v11;
    objc_msgSend(v40, "performBlock:", v39);

    v18 = v40;
LABEL_14:

    goto LABEL_15;
  }
  if (v9 || a5 >= 1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentRequest"));
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URL"));

    if (a5 >= 400)
    {
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000CD62C;
      v35[3] = &unk_1004A6580;
      v36 = v16;
      v37 = v11;
      v38 = a5;
      objc_msgSend(v36, "performBlock:", v35);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "absoluteString"));
    v24 = +[MTPodcast isRedirectURL:](MTPodcast, "isRedirectURL:", v19);

    if (v24)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v45 = (int64_t)sub_10004678C;
      v46 = sub_100046A3C;
      v47 = 0;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000CD744;
      v31[3] = &unk_1004A6690;
      v32 = v16;
      v33 = v11;
      v34 = buf;
      objc_msgSend(v32, "performBlockAndWait:", v31);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateManager sharedInstance](MTFeedUpdateManager, "sharedInstance"));
      objc_msgSend(v20, "_updatePodcastWithUUID:userInitiated:useBackgroundFetch:source:tryRedirectURL:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), objc_msgSend(v8, "isInteractive"), objc_msgSend(v8, "useBackgroundFetch"), 15, 0);

      _Block_object_dispose(buf, 8);
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000CD7BC;
    v25[3] = &unk_1004AA090;
    v26 = v16;
    v27 = v11;
    v29 = a5;
    v28 = v9;
    v30 = v24;
    objc_msgSend(v26, "performBlock:", v25);

    goto LABEL_14;
  }
LABEL_15:

  v42[0] = NSLocalizedDescriptionKey;
  v42[1] = NSUnderlyingErrorKey;
  v43[0] = CFSTR("Feed download failed");
  v43[1] = CFSTR("[no error]");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.podcasts.externalfeeddownloader"), -1, v21));

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader delegate](self, "delegate"));
  objc_msgSend(v23, "didDownloadFeedWithError:data:task:requestedUrl:useBackgroundFetch:", v22, 0, v8, v11, objc_msgSend(v8, "useBackgroundFetch"));

}

- (MTExternalFeedDownloaderDelegate)delegate
{
  return (MTExternalFeedDownloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setSessionTaskStateReloaded:(BOOL)a3
{
  self->_sessionTaskStateReloaded = a3;
}

- (BOOL)sessionTaskStateReloaded
{
  return self->_sessionTaskStateReloaded;
}

- (void)task:(id)a3 didCompleteWithDownloadedContentUrl:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  unsigned __int8 v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  void *v57;
  unsigned int v58;
  void *v59;
  id v60;
  id v61;
  id location;
  id v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(self), "statusCodeForTask:", v6);
  v10 = v8 == (id)200 || v8 == (id)206;
  if (v7 && v10)
  {
    v11 = objc_msgSend((id)objc_opt_class(self), "originalURLForTask:", v6);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v58 = objc_msgSend(v6, "useBackgroundFetch");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader configuration](self, "configuration"));
    v13 = objc_msgSend(v12, "keepsFeedFileInTempDirAfterDownload");

    if (v13)
    {
      v14 = v7;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "globallyUniqueString"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v16, CFSTR("_feed")));

      v18 = NSTemporaryDirectory();
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v19));
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URLByAppendingPathComponent:", v17));

      v22 = _MTLogCategoryFeedUpdate(v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absoluteString"));
        *(_DWORD *)buf = 138543618;
        v71 = v24;
        v72 = 2114;
        v73 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Moving downloaded feed from %{public}@ to %{public}@", buf, 0x16u);

      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v63 = 0;
      v27 = objc_msgSend(v26, "moveItemAtURL:toURL:error:", v7, v14, &v63);
      v28 = v63;

      if (!v27)
      {
        v68[0] = NSLocalizedDescriptionKey;
        v68[1] = NSUnderlyingErrorKey;
        v69[0] = CFSTR("Failed to move downloaded file to tmp folder");
        v69[1] = v28;
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 2));
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.podcasts.externalfeeddownloader"), -1, v50));

        v52 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader delegate](self, "delegate"));
        objc_msgSend(v52, "didDownloadFeedWithError:data:task:requestedUrl:useBackgroundFetch:", v51, 0, v6, v59, v58);

LABEL_34:
        goto LABEL_35;
      }
      v30 = _MTLogCategoryFeedUpdate(v29);
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "absoluteString"));
        *(_DWORD *)buf = 138412290;
        v71 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Downloaded feed: %@", buf, 0xCu);

      }
    }
    v33 = objc_initWeak(&location, self);
    v34 = _MTLogCategoryFeedUpdate(v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "absoluteString"));
      *(_DWORD *)buf = 138412290;
      v71 = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Started processing feed: %@", buf, 0xCu);

    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
    v61 = 0;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v37, 9, &v61));
    v39 = (__CFString *)v61;

    if (v38)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v60 = 0;
      v41 = objc_msgSend(v40, "removeItemAtURL:error:", v14, &v60);
      v42 = v60;

      if ((v41 & 1) != 0)
      {
        v44 = _MTLogCategoryFeedUpdate(v43);
        v45 = objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
          *(_DWORD *)buf = 138412290;
          v71 = v46;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Temporary feed file has been removed:%@", buf, 0xCu);

        }
        v47 = 0;
      }
      else
      {
        v64[0] = NSLocalizedDescriptionKey;
        v64[1] = NSUnderlyingErrorKey;
        v65[0] = CFSTR("Failed to remove temporary feed file");
        v65[1] = v42;
        v45 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 2));
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.podcasts.externalfeeddownloader"), -1, v45));
      }

      v54 = _MTLogCategoryFeedUpdate(v53);
      v55 = objc_claimAutoreleasedReturnValue(v54);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "absoluteString"));
        *(_DWORD *)buf = 138412290;
        v71 = v56;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Finished processing feed: %@", buf, 0xCu);

      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader delegate](self, "delegate"));
      objc_msgSend(v57, "didDownloadFeedWithError:data:task:requestedUrl:useBackgroundFetch:", v47, v38, v6, v59, v58);

    }
    else
    {
      v66[0] = NSLocalizedDescriptionKey;
      v66[1] = NSUnderlyingErrorKey;
      v48 = CFSTR("[no error]");
      if (v39)
        v48 = v39;
      v67[0] = CFSTR("Failed to read feed data from file");
      v67[1] = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v67, v66, 2));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.podcasts.externalfeeddownloader"), -1, v49));

      v42 = (id)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader delegate](self, "delegate"));
      objc_msgSend(v42, "didDownloadFeedWithError:data:task:requestedUrl:useBackgroundFetch:", v47, 0, v6, v59, v58);
    }

    objc_destroyWeak(&location);
    goto LABEL_34;
  }
  -[MTExternalFeedDownloader task:didFailWithError:orStatusCode:](self, "task:didFailWithError:orStatusCode:", v6, 0, v8);
LABEL_35:

}

- (BOOL)createPrivateTempDirIfNeeded
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTExternalFeedDownloader temporaryDirectory](self, "temporaryDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  if ((v4 & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v12 = 0;
    v5 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 0, 0, &v12);
    v7 = v12;

    if ((v5 & 1) == 0)
    {
      v9 = _MTLogCategoryFeedUpdate(v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to create feed-update response download directory. Error=%@ ", buf, 0xCu);
      }

    }
  }

  return v5;
}

- (BOOL)isFileExpired:(id)a3 inDirectory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  double v18;
  double v19;
  double v20;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v5));

  v22 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributesOfItemAtPath:error:", v8, &v22));
  v10 = v22;

  if (v9)
  {
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", NSFileModificationDate));
    v13 = v12;
    if (v12)
      v14 = v12;
    else
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", NSFileCreationDate));
    v17 = v14;
    -[NSObject timeIntervalSinceReferenceDate](v14, "timeIntervalSinceReferenceDate");
    v19 = v18;
    +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
    v16 = v19 + 10800.0 <= v20;

  }
  else
  {
    v15 = _MTLogCategoryFeedUpdate(v11);
    v13 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v5;
      v25 = 2112;
      v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to obtain attributes for file:%@, error:%@", buf, 0x16u);
    }
    v16 = 1;
  }

  return v16;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
