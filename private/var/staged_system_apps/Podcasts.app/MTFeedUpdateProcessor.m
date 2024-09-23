@implementation MTFeedUpdateProcessor

- (BOOL)start
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTFeedUpdateProcessor;
  v3 = -[MTBaseProcessor start](&v7, "start");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_lpmDidChange", NSProcessInfoPowerStateDidChangeNotification, 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", self, "_fetchBatchFetchEnabled", AMSBagChangedNotification, 0);

    self->_isBatchFetchEnabledBagValue = 0;
    -[MTFeedUpdateProcessor _fetchBatchFetchEnabled](self, "_fetchBatchFetchEnabled");
  }
  return v3;
}

- (id)predicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (os_feature_enabled_batch_feed_fetch(self, a2) && self->_isBatchFetchEnabledBagValue)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForNotHiddenPodcasts](MTPodcast, "predicateForNotHiddenPodcasts"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForPeriodicallyUpdatablePodcasts](MTPodcast, "predicateForPeriodicallyUpdatablePodcasts"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "AND:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForAreMediaAPI:](MTPodcast, "predicateForAreMediaAPI:", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "AND:", v6));

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForNotHiddenPodcasts](MTPodcast, "predicateForNotHiddenPodcasts"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForPeriodicallyUpdatablePodcasts](MTPodcast, "predicateForPeriodicallyUpdatablePodcasts"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "AND:", v4));
  }

  return v7;
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  -[MTFeedUpdateProcessor checkAutoDownloadsForUuids:](self, "checkAutoDownloadsForUuids:", a4);
}

- (void)checkAutoDownloadsForUuids:(id)a3
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  id v9;
  double v10;
  uint64_t v11;
  _QWORD v12[4];
  NSObject *v13;
  uint8_t buf[4];
  id v15;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = -[MTFeedUpdateProcessor _isLPMEnabled](self, "_isLPMEnabled");
    if (v5)
    {
      v6 = _MTLogCategoryFeedUpdate(v5);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v15 = objc_msgSend(v4, "count");
        v8 = "Skipping feed update for %lu podcasts because of Low Power Mode";
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 0xCu);
      }
    }
    else
    {
      v9 = -[MTFeedUpdateProcessor updatePredicateDuration](self, "updatePredicateDuration");
      if (v10 != 0.0)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1000FDCA4;
        v12[3] = &unk_1004A6200;
        v13 = v4;
        -[MTBaseProcessor enqueueWorkBlock:](self, "enqueueWorkBlock:", v12);
        v7 = v13;
        goto LABEL_10;
      }
      v11 = _MTLogCategoryFeedUpdate(v9);
      v7 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v15 = objc_msgSend(v4, "count");
        v8 = "Skipping feed update for %lu podcasts because the feed update interval is 0.";
        goto LABEL_8;
      }
    }
LABEL_10:

  }
}

- (void)startIfNeeded
{
  if (!-[MTBaseProcessor isRunning](self, "isRunning"))
    -[MTFeedUpdateProcessor start](self, "start");
}

- (id)entityName
{
  return kMTPodcastEntityName;
}

- (void)stop
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTFeedUpdateProcessor;
  -[MTBaseProcessor stop](&v4, "stop");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (double)updatePredicateDuration
{
  double result;

  -[MTFeedUpdateProcessor _feedUpdateInterval](self, "_feedUpdateInterval");
  return result;
}

- (double)_feedUpdateInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "syncValueForKey:", kBagKeyFeedUpdateProcessorInterval));
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (BOOL)_isLPMEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = objc_msgSend(v2, "isLowPowerModeEnabled");

  return v3;
}

- (void)_reCheck
{
  _BOOL8 v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  v3 = -[MTFeedUpdateProcessor _isLPMEnabled](self, "_isLPMEnabled");
  if (v3)
  {
    v4 = _MTLogCategoryFeedUpdate(v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Skipping _reCheck because of Low Power Mode", buf, 2u);
    }

  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000FDEC8;
    v6[3] = &unk_1004A6200;
    v6[4] = self;
    -[MTBaseProcessor enqueueWorkBlock:](self, "enqueueWorkBlock:", v6);
  }
}

- (void)_lpmDidChange
{
  uint64_t v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = _MTLogCategoryFeedUpdate(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Low Power Mode did change. Checking for feed updates", v5, 2u);
  }

  -[MTFeedUpdateProcessor _reCheck](self, "_reCheck");
}

- (void)_fetchBatchFetchEnabled
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "batchFeedFetchIsEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBaseProcessor workQueue](self, "workQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000FE0D4;
  v6[3] = &unk_1004AB208;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "asyncValueOnQueue:withCompletion:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

@end
