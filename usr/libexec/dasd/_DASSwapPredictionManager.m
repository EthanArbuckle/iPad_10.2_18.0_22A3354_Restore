@implementation _DASSwapPredictionManager

- (_DASSwapPredictionManager)initWithAlgorithms:(id)a3
{
  id v4;
  id v5;
  _DASSwapModelCustomAggregator *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  dispatch_source_t v14;
  void *v15;
  NSObject *v16;
  int *v17;
  NSObject *v18;
  _QWORD v20[4];
  int *v21;
  _QWORD handler[4];
  int *v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_DASSwapPredictionManager;
  v5 = -[_DASSwapPredictionManager init](&v24, "init");
  if (v5)
  {
    v6 = -[_DASSwapModelCustomAggregator initWithAlgorithms:]([_DASSwapModelCustomAggregator alloc], "initWithAlgorithms:", v4);
    v7 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v6;

    v8 = objc_claimAutoreleasedReturnValue(+[_DASAppResumePLLogger sharedInstance](_DASAppResumePLLogger, "sharedInstance"));
    v9 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.dasd.smartswapqueue", v11);
    v13 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v12;

    v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *((dispatch_queue_t *)v5 + 4));
    v15 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v14;

    dispatch_set_qos_class_fallback(*((_QWORD *)v5 + 5), 17);
    v16 = *((_QWORD *)v5 + 5);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10009B138;
    handler[3] = &unk_10015D4E0;
    v17 = (int *)v5;
    v23 = v17;
    dispatch_source_set_event_handler(v16, handler);
    v17[2] = -1;
    v18 = *((_QWORD *)v5 + 4);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10009B16C;
    v20[3] = &unk_10015D9B8;
    v21 = v17;
    notify_register_dispatch("com.apple.dasd.updateswapscores", v17 + 2, v18, v20);

  }
  return (_DASSwapPredictionManager *)v5;
}

- (void)updateScores
{
  _DASSwapModelAggregating *aggregator;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)os_transaction_create("com.apple.dasd.smartswap.scoresUpdateTxn");
  -[_DASSwapModelAggregating updateScores](self->_aggregator, "updateScores");
  aggregator = self->_aggregator;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_DASSwapModelAggregating scoresForAllApplicationsAtDate:](aggregator, "scoresForAllApplicationsAtDate:", v4));
  -[_DASSwapPredictionManager updateSwapScoresWithDictionary:](self, "updateSwapScoresWithDictionary:", v5);

}

- (void)updateSwapScoresWithDictionary:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  __int128 v9;
  id v10;
  int v11;
  uint64_t v12;
  void *v13;
  char *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  _BOOL4 v19;
  int v20;
  _DASSwapPredictionManager *v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  NSDictionary *currentPredictions;
  _QWORD v26[2];
  id v27;
  _DASSwapPredictionManager *v28;
  char *v29;
  char *v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  _BOOL4 v40;
  _BYTE v41[80];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("swap")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating scores to %@", buf, 0xCu);
  }
  if (objc_msgSend(v4, "count"))
  {
    v28 = self;
    v6 = objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &off_10016ECA8, CFSTR("MobileSafari"));
    v27 = v6;
    v7 = objc_msgSend(v6, "copy");

    v26[1] = v26;
    v26[0] = objc_msgSend(v7, "count");
    v29 = (char *)v26 - ((56 * v26[0] + 15) & 0xFFFFFFFFFFFFFFF0);
    v36 = 0u;
    v35 = 0u;
    v34 = 0u;
    v33 = 0u;
    v4 = v7;
    v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v8)
    {
      v10 = v8;
      v11 = 0;
      v12 = *(_QWORD *)v34;
      v30 = v29 + 32;
      *(_QWORD *)&v9 = 138412546;
      v31 = v9;
      do
      {
        v13 = 0;
        v32 = v11;
        v14 = &v30[56 * v11];
        do
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(v4);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v13);
          *((_DWORD *)v14 - 8) = 1;
          v16 = objc_retainAutorelease(v15);
          snprintf(v14, 0x11uLL, "%s", (const char *)objc_msgSend(v16, "UTF8String"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v16));
          objc_msgSend(v17, "doubleValue");
          v19 = v18 > 0.0;

          *((_DWORD *)v14 - 5) = v19;
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v31;
            v38 = v16;
            v39 = 1024;
            v40 = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@ => %d", buf, 0x12u);
          }
          v13 = (char *)v13 + 1;
          v14 += 56;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        v11 = v32 + (_DWORD)v13;
      }
      while (v10);
    }

    v20 = memorystatus_control(100, 0, 16, v29, 56 * v26[0]);
    v21 = v28;
    if (v20)
    {
      v22 = v20;
      v23 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("swap")));
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_1000E86E0(v22, v23);

    }
    v24 = objc_claimAutoreleasedReturnValue(+[_DASAppResumePLLogger topPredictionsFromScores:](_DASAppResumePLLogger, "topPredictionsFromScores:", v4));
    currentPredictions = v21->_currentPredictions;
    v21->_currentPredictions = (NSDictionary *)v24;

  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No scores to update!", buf, 2u);
  }

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009B69C;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABCA8 != -1)
    dispatch_once(&qword_1001ABCA8, block);
  return (id)qword_1001ABCA0;
}

- (void)start
{
  NSObject *timer;
  dispatch_time_t v4;

  timer = self->_timer;
  v4 = dispatch_walltime(0, 10000000000);
  dispatch_source_set_timer(timer, v4, 0x1A3185C5000uLL, 0x45D964B800uLL);
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (void)stop
{
  dispatch_suspend((dispatch_object_t)self->_timer);
}

- (_DASSwapModelAggregating)aggregator
{
  return self->_aggregator;
}

- (void)setAggregator:(id)a3
{
  objc_storeStrong((id *)&self->_aggregator, a3);
}

- (_DASAppResumePLLogger)pLLogger
{
  return self->_pLLogger;
}

- (void)setPLLogger:(id)a3
{
  objc_storeStrong((id *)&self->_pLLogger, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (NSDictionary)currentPredictions
{
  return self->_currentPredictions;
}

- (void)setCurrentPredictions:(id)a3
{
  objc_storeStrong((id *)&self->_currentPredictions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPredictions, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_pLLogger, 0);
  objc_storeStrong((id *)&self->_aggregator, 0);
}

@end
