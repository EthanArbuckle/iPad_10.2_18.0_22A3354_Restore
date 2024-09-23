@implementation MTFeedUpdateBackgroundTask

+ (id)identifier
{
  return CFSTR("com.apple.podcasts.feed-update");
}

+ (BOOL)isEnabled
{
  double v2;

  objc_msgSend(a1, "_backgroundFetchInterval");
  return v2 > 0.0;
}

+ (double)_backgroundFetchInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "syncValueForKey:", kBackgroundFetchInterval));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

+ (double)earliestBeginTime
{
  double v2;

  objc_msgSend(a1, "_backgroundFetchInterval");
  return fmax(v2, 3600.0);
}

- (void)performWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  uint64_t v5;
  NSObject *v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  void (**v23)(id, _QWORD);
  uint8_t buf[16];

  v4 = (void (**)(id, _QWORD))a3;
  v5 = _MTLogCategoryFeedUpdate(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_signpost_id_generate(v6);

  v9 = _MTLogCategoryFeedUpdate(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, v7, "BACKGROUND_FEED_UPDATE", ", buf, 2u);
  }

  v12 = +[MTLibraryMigrationUtil needsCoreDataMigration](MTLibraryMigrationUtil, "needsCoreDataMigration");
  if ((v12 & 1) != 0
    || (v12 = +[MTLibraryMigrationUtil needsDataMigration](MTLibraryMigrationUtil, "needsDataMigration"),
        (_DWORD)v12))
  {
    v13 = _MTLogCategoryFeedUpdate(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Skipping background task feed update because a CoreData migration is required", buf, 2u);
    }

    v16 = _MTLogCategoryFeedUpdate(v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = v17;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_END, v7, "BACKGROUND_FEED_UPDATE", "MIGRATION_REQUIRED", buf, 2u);
    }

    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    self->_signpostID = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey backgroundTask](MTFeedUpdateMetricsDataKey, "backgroundTask"));
    +[IMMetrics startTimer:](IMMetrics, "startTimer:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTProcessorManager sharedInstance](MTProcessorManager, "sharedInstance"));
    objc_msgSend(v20, "startProcessorsForFeedUpdates");

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateManager sharedInstance](MTFeedUpdateManager, "sharedInstance"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000EF8CC;
    v22[3] = &unk_1004AAD00;
    v22[4] = self;
    v23 = v4;
    objc_msgSend(v21, "updateAllPodcastsInBackgroundWithSource:started:", 0, v22);

  }
}

- (void)cancel
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t signpostID;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateBackgroundTask pendingCompletion](self, "pendingCompletion"));

  if (v3)
    v4 = -[MTFeedUpdateBackgroundTask setPendingCompletion:](self, "setPendingCompletion:", 0);
  v5 = _MTLogCategoryFeedUpdate(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Background task feed update was cancelled", buf, 2u);
  }

  v8 = _MTLogCategoryFeedUpdate(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, signpostID, "BACKGROUND_FEED_UPDATE", "CANCELLED", v12, 2u);
  }

}

- (void)didFinishUpdatingAllFeedsNotification:(id)a3
{
  void *v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t signpostID;
  int v19;
  int64_t v20;
  __int16 v21;
  double v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey backgroundTask](MTFeedUpdateMetricsDataKey, "backgroundTask", a3));
  +[IMMetrics endTimer:](IMMetrics, "endTimer:", v4);

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v6 = v5;
  v7 = -[MTFeedUpdateBackgroundTask feedUpdateBeginTime](self, "feedUpdateBeginTime");
  v9 = v8;
  v10 = _MTLogCategoryFeedUpdate(v7);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134218240;
    v20 = -[MTFeedUpdateBackgroundTask initialFeedUpdateCount](self, "initialFeedUpdateCount");
    v21 = 2048;
    v22 = v6 - v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Did finish updating %lld feeds for background task in %f", (uint8_t *)&v19, 0x16u);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTFeedUpdateBackgroundTask pendingCompletion](self, "pendingCompletion"));
  if (v12)
  {
    v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MTFeedUpdateBackgroundTask pendingCompletion](self, "pendingCompletion"));
    v14[2](v14, 1);

    v13 = -[MTFeedUpdateBackgroundTask setPendingCompletion:](self, "setPendingCompletion:", 0);
  }
  v15 = _MTLogCategoryFeedUpdate(v13);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, signpostID, "BACKGROUND_FEED_UPDATE", "SUCCESS", (uint8_t *)&v19, 2u);
  }

}

- (int64_t)initialFeedUpdateCount
{
  return self->_initialFeedUpdateCount;
}

- (void)setInitialFeedUpdateCount:(int64_t)a3
{
  self->_initialFeedUpdateCount = a3;
}

- (double)feedUpdateBeginTime
{
  return self->_feedUpdateBeginTime;
}

- (void)setFeedUpdateBeginTime:(double)a3
{
  self->_feedUpdateBeginTime = a3;
}

- (id)pendingCompletion
{
  return self->_pendingCompletion;
}

- (void)setPendingCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pendingCompletion, 0);
}

@end
