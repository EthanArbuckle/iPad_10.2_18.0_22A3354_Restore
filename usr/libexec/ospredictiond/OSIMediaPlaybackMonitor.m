@implementation OSIMediaPlaybackMonitor

- (double)playbackDurationOverDuration:(double)a3 currentlyPlaying:(BOOL *)a4
{
  void *v6;
  void *v7;
  double Current;
  os_log_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  NSObject *v20;
  id v21;
  int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  double v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  double *v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t buf[4];
  double v49;

  v6 = (void *)os_transaction_create("com.apple.osintelligence.nowplaying");
  v7 = objc_autoreleasePoolPush();
  Current = CFAbsoluteTimeGetCurrent();
  v44 = 0;
  v45 = (double *)&v44;
  v46 = 0x2020000000;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_100015CA0;
  v42 = sub_100015CB0;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v9 = os_log_create("com.apple.osintelligence", "inactivity.playbackmonitor");
  v10 = objc_alloc((Class)BMPublisherOptions);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a3 * -20.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v13 = objc_msgSend(v10, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v11, v12, 0, 0, 0);

  v14 = BiomeLibrary();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "Media"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "NowPlaying"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "publisherWithOptions:", v13));
  v19 = Current - a3;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100015CBC;
  v28[3] = &unk_100060D18;
  v30 = &v38;
  v31 = &v34;
  v20 = v9;
  v33 = v19;
  v29 = v20;
  v32 = &v44;
  v21 = objc_msgSend(v18, "sinkWithCompletion:receiveInput:", &stru_100060CF0, v28);

  if (a4)
    *a4 = *((_BYTE *)v35 + 24);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v22 = *((unsigned __int8 *)v35 + 24);
    *(_DWORD *)buf = 67109120;
    LODWORD(v49) = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Currently playing: %u\n\n\n", buf, 8u);
  }
  if (*((_BYTE *)v35 + 24))
  {
    objc_msgSend((id)v39[5], "timestamp");
    if (v23 >= v19)
    {
      objc_msgSend((id)v39[5], "timestamp");
      v19 = v24;
    }
    v45[3] = Current - v19 + v45[3];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v25 = v45[3] / 60.0;
    *(_DWORD *)buf = 134217984;
    v49 = v25;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Total playback duration: %.0lfm", buf, 0xCu);
  }
  v26 = v45[3];

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  objc_autoreleasePoolPop(v7);

  return v26;
}

- (BOOL)hasPlaybackStateChangeRecently:(double)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  BOOL v19;
  _QWORD v21[7];
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  double v31;

  v5 = (void *)os_transaction_create("com.apple.osintelligence.playbackstatechange");
  v6 = objc_autoreleasePoolPush();
  CFAbsoluteTimeGetCurrent();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = sub_100015CA0;
  v22[4] = sub_100015CB0;
  v23 = 0;
  v7 = os_log_create("com.apple.osintelligence", "inactivity.playbackmonitor");
  v8 = objc_alloc((Class)BMPublisherOptions);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v11 = objc_msgSend(v8, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v9, v10, 0, 0, 0);

  v12 = BiomeLibrary();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "Media"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "NowPlaying"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "publisherWithOptions:", v11));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10001615C;
  v21[3] = &unk_100060D60;
  v21[4] = self;
  v21[5] = v22;
  v21[6] = &v24;
  v17 = objc_msgSend(v16, "sinkWithCompletion:receiveInput:", &stru_100060D38, v21);

  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v18 = v25[3];
    *(_DWORD *)buf = 134218240;
    v29 = v18;
    v30 = 2048;
    v31 = a3 / 60.0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Counted %ld unique play/pause state(s) in the last %.1f minutes", buf, 0x16u);
  }
  v19 = v25[3] > 0;

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);
  objc_autoreleasePoolPop(v6);

  return v19;
}

- (BOOL)isEventNextSongPlaying:(id)a3 fromPreviousEvent:(id)a4
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "playbackState");
  v8 = 0;
  if (v6 && v7 == (id)1)
  {
    if (objc_msgSend(v6, "playbackState") == (id)3)
    {
      objc_msgSend(v5, "absoluteTimestamp");
      v10 = v9;
      objc_msgSend(v6, "absoluteTimestamp");
      v8 = v10 - v11 < 0.01;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

@end
