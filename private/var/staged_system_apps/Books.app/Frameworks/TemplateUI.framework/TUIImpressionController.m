@implementation TUIImpressionController

- (TUIImpressionController)initWithFeedId:(id)a3 delegate:(id)a4 tracker:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  TUIImpressionController *v13;
  TUIImpressionController *v14;
  TUIImpressionConfiguration *v15;
  TUIImpressionConfiguration *configuration;
  _TUIImpressionStats *v17;
  _TUIImpressionStats *q_stats;
  TUIImpressionSnapshot *v19;
  id WeakRetained;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)TUIImpressionController;
  v13 = -[TUIImpressionController init](&v22, "init");
  v14 = v13;
  if (v13)
  {
    v13->_feedId.uniqueIdentifier = a3.var0;
    objc_storeStrong((id *)&v13->_queue, a6);
    v15 = objc_alloc_init(TUIImpressionConfiguration);
    configuration = v14->_configuration;
    v14->_configuration = v15;

    v17 = objc_alloc_init(_TUIImpressionStats);
    q_stats = v14->_q_stats;
    v14->_q_stats = v17;

    objc_storeWeak((id *)&v14->_delegate, v10);
    objc_storeStrong((id *)&v14->_tracker, a5);
    objc_msgSend(v11, "addVisibilityObserver:", v14);
    if (+[TUIImpressionController debugEnabled](TUIImpressionController, "debugEnabled"))
    {
      v19 = -[TUIImpressionSnapshot initWithMap:]([TUIImpressionSnapshot alloc], "initWithMap:", 0);
      WeakRetained = objc_loadWeakRetained((id *)&v14->_delegate);
      objc_msgSend(WeakRetained, "impressionController:didUpdateSnapshot:", v14, v19);

    }
  }

  return v14;
}

- (void)teardown
{
  TUIVisibilityTracker *tracker;

  -[TUIVisibilityTracker removeVisibilityObserver:](self->_tracker, "removeVisibilityObserver:", self);
  tracker = self->_tracker;
  self->_tracker = 0;

}

- (void)q_updateSnapshotIfNeededWithTime:(double)a3
{
  NSMutableDictionary *v5;
  double v6;
  TUIImpressionSnapshot *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  unint64_t uniqueIdentifier;
  id WeakRetained;
  TUIImpressionSnapshot *q_previousSnapshot;
  NSMutableDictionary *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  unint64_t v27;
  _BYTE v28[128];

  if (+[TUIImpressionController debugEnabled](TUIImpressionController, "debugEnabled"))
  {
    v5 = objc_opt_new(NSMutableDictionary);
    -[TUIImpressionConfiguration timingThreshold](self->_configuration, "timingThreshold");
    -[TUIImpressionController q_collectImpressions:time:threshold:flush:stats:](self, "q_collectImpressions:time:threshold:flush:stats:", v5, 0, self->_q_stats, a3, v6);
    v21 = v5;
    v7 = -[TUIImpressionSnapshot initWithMap:]([TUIImpressionSnapshot alloc], "initWithMap:", v5);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImpressionSnapshot impressions](self->_q_previousSnapshot, "impressions"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "timingCount"))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImpressionSnapshot impressionForIdentifier:](v7, "impressionForIdentifier:", v14));

            if (!v15 || !objc_msgSend(v15, "timingCount"))
            {
              v16 = TUIDefaultLog();
              v17 = objc_claimAutoreleasedReturnValue(v16);
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                uniqueIdentifier = self->_feedId.uniqueIdentifier;
                *(_DWORD *)buf = 134217984;
                v27 = uniqueIdentifier;
                _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "[fid:%lu] unexpected change in impression", buf, 0xCu);
              }

            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      }
      while (v10);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "impressionController:didUpdateSnapshot:", self, v7);

    q_previousSnapshot = self->_q_previousSnapshot;
    self->_q_previousSnapshot = v7;

    -[TUIImpressionController q_scheduleRefreshIfNeeded](self, "q_scheduleRefreshIfNeeded");
  }
}

- (void)q_scheduleRefreshIfNeeded
{
  double v3;
  dispatch_time_t v4;
  NSObject *queue;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_q_pendingRefresh)
  {
    self->_q_pendingRefresh = 1;
    objc_initWeak(&location, self);
    -[TUIImpressionConfiguration minUpdateInterval](self->_configuration, "minUpdateInterval");
    v4 = dispatch_time(0, (uint64_t)(v3 * 1000000000.0));
    queue = self->_queue;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_237C0;
    v6[3] = &unk_23DD48;
    objc_copyWeak(&v7, &location);
    dispatch_after(v4, queue, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)q_updateSnapshot
{
  double v3;

  self->_q_pendingRefresh = 0;
  v3 = sub_1C2AC();
  -[TUIImpressionController q_updateSnapshotIfNeededWithTime:](self, "q_updateSnapshotIfNeededWithTime:", v3);
}

- (void)q_collectImpressions:(id)a3 time:(double)a4 flush:(BOOL)a5 stats:(id)a6
{
  _BOOL8 v6;
  TUIImpressionConfiguration *configuration;
  id v11;
  double v12;
  id v13;

  v6 = a5;
  configuration = self->_configuration;
  v11 = a6;
  v13 = a3;
  -[TUIImpressionConfiguration timingThreshold](configuration, "timingThreshold");
  -[TUIImpressionController q_collectImpressions:time:threshold:flush:stats:](self, "q_collectImpressions:time:threshold:flush:stats:", v13, v6, v11, a4, v12);

}

- (void)q_collectImpressions:(id)a3 time:(double)a4 threshold:(double)a5 flush:(BOOL)a6 stats:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  double v18;
  double v19;
  BOOL v20;

  v8 = a6;
  v11 = a3;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "impressions"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_23974;
  v16[3] = &unk_23DD70;
  v20 = v8;
  v18 = a4;
  v19 = a5;
  v15 = v11;
  v17 = v15;
  objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v16);

  if (v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "impressions"));
    objc_msgSend(v14, "removeAllObjects");

  }
}

- (void)visibleContentsChanged:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  TUIVisibilityChangeNode *v10;
  TUIVisibilityChangeNode *q_currentVisible;
  double v12;
  double v13;

  v4 = a3;
  objc_msgSend(v4, "timestamp");
  v6 = v5;
  -[TUIImpressionConfiguration timingThreshold](self->_configuration, "timingThreshold");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNode"));
  sub_23AD4(v9, self->_q_stats, v6, v8);

  v10 = (TUIVisibilityChangeNode *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootNode"));
  q_currentVisible = self->_q_currentVisible;
  self->_q_currentVisible = v10;

  objc_msgSend(v4, "timestamp");
  v13 = v12;

  -[TUIImpressionController q_updateSnapshotIfNeededWithTime:](self, "q_updateSnapshotIfNeededWithTime:", v13);
}

- (void)reset
{
  double v3;
  NSObject *queue;
  _QWORD v5[6];

  v3 = sub_1C2AC();
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_23DE4;
  v5[3] = &unk_23D9D8;
  v5[4] = self;
  *(double *)&v5[5] = v3;
  dispatch_async(queue, v5);
}

- (void)collectAndFlush:(BOOL)a3 accumulatedImpressionsWithCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  -[TUIImpressionController collectAndFlush:accumulatedImpressionsAtTime:withCompletion:](self, "collectAndFlush:accumulatedImpressionsAtTime:withCompletion:", v4, v6, sub_1C2AC());

}

- (void)collectAndFlush:(BOOL)a3 accumulatedImpressionsAtTime:(double)a4 withCompletion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  double v13;
  BOOL v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_240FC;
  v11[3] = &unk_23DD98;
  v13 = a4;
  v14 = a3;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)collectVisibleImpressionsWithCompletion:(id)a3
{
  id v4;
  double v5;
  NSObject *queue;
  _QWORD block[5];
  id v8;
  double v9;

  v4 = a3;
  if (v4)
  {
    v5 = sub_1C2AC();
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_24240;
    block[3] = &unk_23DDC0;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(queue, block);

  }
}

+ (BOOL)debugEnabled
{
  if (qword_2CB248 != -1)
    dispatch_once(&qword_2CB248, &stru_23DDE0);
  return byte_2CB250;
}

+ (void)setDebugEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  byte_2CB250 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("TUIOverlayImpressions"));

}

- (TUIImpressionControllerDelegate)delegate
{
  return (TUIImpressionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (TUIImpressionConfiguration)configuration
{
  return self->_configuration;
}

- (TUIVisibilityTracker)tracker
{
  return self->_tracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_q_currentVisible, 0);
  objc_storeStrong((id *)&self->_q_previousSnapshot, 0);
  objc_storeStrong((id *)&self->_q_stats, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
