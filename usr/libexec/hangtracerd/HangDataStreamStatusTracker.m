@implementation HangDataStreamStatusTracker

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D464;
  block[3] = &unk_10004D420;
  block[4] = a1;
  if (qword_100060338 != -1)
    dispatch_once(&qword_100060338, block);
  return (id)qword_100060330;
}

- (HangDataStreamStatusTracker)init
{
  HangDataStreamStatusTracker *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *hangHUDStatusDict;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HangDataStreamStatusTracker;
  v2 = -[HangDataStreamStatusTracker init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    hangHUDStatusDict = v2->_hangHUDStatusDict;
    v2->_hangHUDStatusDict = v3;

  }
  return v2;
}

- (void)initializeStatus
{
  -[NSMutableDictionary removeAllObjects](self->_hangHUDStatusDict, "removeAllObjects");
}

- (BOOL)isHangEndedWithDuration:(double)a3 updateInterval:(double)a4 hangID:(id)a5
{
  id v8;
  void *v9;
  NSMutableDictionary *hangHUDStatusDict;
  HangDataStreamStatus *v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  NSObject *v16;
  int v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  int v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  _BOOL4 v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  double v40;
  __int16 v41;
  id v42;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_hangHUDStatusDict, "objectForKey:", v8));

  if (!v9)
  {
    hangHUDStatusDict = self->_hangHUDStatusDict;
    v11 = objc_alloc_init(HangDataStreamStatus);
    -[NSMutableDictionary setObject:forKey:](hangHUDStatusDict, "setObject:forKey:", v11, v8);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_hangHUDStatusDict, "objectForKeyedSubscript:", v8));
  objc_msgSend(v12, "previousDurationSinceLastUpdateMs");
  v14 = v13;
  v15 = sub_100026064();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "previousDurationSinceLastUpdateMs");
    v29 = 134219522;
    v30 = a3;
    v31 = 2048;
    v32 = v28;
    v33 = 1024;
    v34 = objc_msgSend(v12, "countsOfMeetingEndingConditions");
    v35 = 1024;
    v36 = a3 > a4;
    v37 = 1024;
    v38 = v14 < a3;
    v39 = 2048;
    v40 = a4;
    v41 = 2112;
    v42 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "isHangEndedWithDuration %f, previous_durationSinceLastUpdateMs:%f, counter:%i, is_latency_high:%i, is_latency_increasing:%i, hudUpdateInterval:%f, hangID:%@", (uint8_t *)&v29, 0x3Cu);
  }

  if (a3 <= a4 || v14 >= a3)
  {
    objc_msgSend(v12, "initStatus");
  }
  else
  {
    objc_msgSend(v12, "setCountsOfMeetingEndingConditions:", objc_msgSend(v12, "countsOfMeetingEndingConditions") + 1);
    objc_msgSend(v12, "setPreviousDurationSinceLastUpdateMs:", a3);
  }
  v17 = objc_msgSend(v12, "countsOfMeetingEndingConditions");
  v18 = sub_100026064();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
  if (v17 < 3)
  {
    if (v20)
      sub_10002EC1C((uint64_t)v8, v19, v21, v22, v23, v24, v25, v26);

  }
  else
  {
    if (v20)
      sub_10002EBB4((uint64_t)v8, v19, v21, v22, v23, v24, v25, v26);

    objc_msgSend(v12, "initStatus");
  }

  return v17 > 2;
}

- (NSMutableDictionary)hangHUDStatusDict
{
  return self->_hangHUDStatusDict;
}

- (void)setHangHUDStatusDict:(id)a3
{
  objc_storeStrong((id *)&self->_hangHUDStatusDict, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hangHUDStatusDict, 0);
}

@end
