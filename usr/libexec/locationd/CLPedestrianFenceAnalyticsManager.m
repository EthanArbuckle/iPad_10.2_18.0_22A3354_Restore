@implementation CLPedestrianFenceAnalyticsManager

- (CLPedestrianFenceAnalyticsManager)init
{
  CLPedestrianFenceAnalyticsManager *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLPedestrianFenceAnalyticsManager;
  v2 = -[CLPedestrianFenceAnalyticsManager init](&v4, "init");
  if (v2)
  {
    v2->_activeOdometryClients = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_activeIntervalEvents = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_activeFenceSessions = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_fenceHistoryPerSession = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_completedSessionsAwaitingPackets = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->_timestampLastLog = 0.0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  self->_activeOdometryClients = 0;
  self->_activeIntervalEvents = 0;

  self->_activeFenceSessions = 0;
  self->_fenceHistoryPerSession = 0;

  self->_completedSessionsAwaitingPackets = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLPedestrianFenceAnalyticsManager;
  -[CLPedestrianFenceAnalyticsManager dealloc](&v3, "dealloc");
}

- (void)processSingleFenceAnalyticsData:(id)a3
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  _QWORD v9[5];
  _WORD v10[8];
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  uint8_t buf[1640];

  if ((objc_msgSend(a3, "hasValidData") & 1) != 0)
  {
    v5 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPedestrianFenceAnalyticsManager fenceHistoryPerSession](self, "fenceHistoryPerSession"), "objectForKeyedSubscript:", objc_msgSend(a3, "clientIdentifier"));
    if (!v5)
    {
      v5 = +[NSMutableArray array](NSMutableArray, "array");
      -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLPedestrianFenceAnalyticsManager fenceHistoryPerSession](self, "fenceHistoryPerSession"), "setObject:forKeyedSubscript:", v5, objc_msgSend(a3, "clientIdentifier"));
    }
    v13[0] = CFSTR("timestamp");
    objc_msgSend(a3, "timeFenceStart");
    v13[1] = CFSTR("isFenceStartEvent");
    v14[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v14[1] = &__kCFBooleanTrue;
    objc_msgSend(v5, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
    v11[0] = CFSTR("timestamp");
    objc_msgSend(a3, "timeFenceExit");
    v11[1] = CFSTR("isFenceStartEvent");
    v12[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v12[1] = &__kCFBooleanFalse;
    objc_msgSend(v5, "addObject:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100A3952C;
    v9[3] = &unk_102132010;
    v9[4] = a3;
    AnalyticsSendEventLazy(CFSTR("com.apple.CoreMotion.PedestrianFenceTrigger"), v9);
  }
  else
  {
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_102165E38);
    v6 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[Analytics] Invalid fence metadata received, skipping", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_102165E38);
      v10[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "[Analytics] Invalid fence metadata received, skipping", v10, 2);
      v8 = (uint8_t *)v7;
      sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceAnalyticsManager processSingleFenceAnalyticsData:]", "%s\n", v7);
      if (v8 != buf)
        free(v8);
    }
  }
}

- (void)startSessionForClient:(id)a3 sequenceNumber:(unint64_t)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLPedestrianFenceAnalyticsManager activeFenceSessions](self, "activeFenceSessions"), "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4), a3);
}

- (void)endSessionForClient:(id)a3 startingAtTime:(double)a4 stoppingAtTime:(double)a5 sequenceNumber:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  double v19;
  double v20;
  void *i;
  void *v22;
  double v23;
  double v24;
  NSObject *v25;
  id v26;
  double v27;
  NSNumber *v28;
  double v29;
  double v30;
  double v31;
  const char *v32;
  uint8_t *v33;
  id v34;
  unint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[8];
  _QWORD v42[8];
  _BYTE v43[128];
  int v44;
  id v45;
  uint8_t buf[4];
  id v47;

  v11 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPedestrianFenceAnalyticsManager fenceHistoryPerSession](self, "fenceHistoryPerSession"), "objectForKeyedSubscript:", a3);
  v12 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPedestrianFenceAnalyticsManager activeFenceSessions](self, "activeFenceSessions"), "objectForKeyedSubscript:", a3);
  if (v12)
  {
    v34 = v12;
    v35 = a6;
    v36 = a3;
    v13 = objc_msgSend(v11, "sortedArrayUsingComparator:", &stru_102165E18);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = 0;
      v18 = *(_QWORD *)v38;
      v19 = 0.0;
      v20 = 0.0;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v13);
          v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("isFenceStartEvent")), "BOOLValue"))
          {
            if (v17)
            {
              ++v17;
            }
            else
            {
              objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("timestamp")), "doubleValue");
              v19 = v24;
              v17 = 1;
            }
          }
          else
          {
            ++v16;
            if (!--v17)
            {
              objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("timestamp")), "doubleValue");
              v20 = v20 + v23 - v19;
            }
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
      v20 = 0.0;
    }
    v26 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v42[0] = v36;
    v41[0] = CFSTR("fenceId");
    v41[1] = CFSTR("sessionDuration");
    v27 = a5 - a4;
    v42[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v27);
    v41[2] = CFSTR("totalDurationInFence");
    v42[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20);
    v41[3] = CFSTR("totalFenceCrossingCount");
    v42[3] = +[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", v16);
    v41[4] = CFSTR("fenceTriggerRate");
    v42[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)v16 * 3600.0 / v27);
    v42[5] = v34;
    v41[5] = CFSTR("sequenceNumberStart");
    v41[6] = CFSTR("sequenceNumberEnd");
    v28 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v35);
    v41[7] = CFSTR("metricType");
    v42[6] = v28;
    v42[7] = &off_10221BA98;
    objc_msgSend(v26, "addEntriesFromDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v42, v41, 8));
    if (v16)
    {
      objc_msgSend(v26, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20 / (double)v16), CFSTR("avgTimeInFence"));
      if (v16 != 1)
      {
        objc_msgSend(objc_msgSend(objc_msgSend(v13, "firstObject"), "objectForKey:", CFSTR("timestamp")), "doubleValue");
        v30 = v29;
        objc_msgSend(objc_msgSend(objc_msgSend(v13, "lastObject"), "objectForKey:", CFSTR("timestamp")), "doubleValue");
        objc_msgSend(v26, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (v31 - v30 - v20) / (double)(v16 - 1)), CFSTR("avgTimeBetweenFences"));
      }
    }
    -[NSMutableArray addObject:](-[CLPedestrianFenceAnalyticsManager completedSessionsAwaitingPackets](self, "completedSessionsAwaitingPackets"), "addObject:", v26);
    -[NSMutableDictionary removeObjectForKey:](-[CLPedestrianFenceAnalyticsManager activeFenceSessions](self, "activeFenceSessions"), "removeObjectForKey:", v36);
    -[NSMutableDictionary removeObjectForKey:](-[CLPedestrianFenceAnalyticsManager fenceHistoryPerSession](self, "fenceHistoryPerSession"), "removeObjectForKey:", v36);
    -[CLPedestrianFenceAnalyticsManager sendAnalyticsForAllReadySessions](self, "sendAnalyticsForAllReadySessions");
  }
  else
  {
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_102165E38);
    v25 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v47 = a3;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "[Analytics] Can't end fence session for client %{public}@ that never started", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_102165E38);
      v44 = 138543362;
      v45 = a3;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "[Analytics] Can't end fence session for client %{public}@ that never started", &v44, 12);
      v33 = (uint8_t *)v32;
      sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceAnalyticsManager endSessionForClient:startingAtTime:stoppingAtTime:sequenceNumber:]", "%s\n", v32);
      if (v33 != buf)
        free(v33);
    }
    -[NSMutableDictionary removeObjectForKey:](-[CLPedestrianFenceAnalyticsManager fenceHistoryPerSession](self, "fenceHistoryPerSession"), "removeObjectForKey:", a3);
  }
}

- (void)feedInertialOdometryPacket:(const InertialOdometryAnalytics *)a3 atTime:
{
  uint64_t *v3;
  uint64_t *v4;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CFAbsoluteTime Current;
  uint64_t **v11;
  NSObject *v12;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *p_pair1;
  _QWORD *left;
  const char *v15;
  uint8_t *v16;
  __int16 v17[8];
  uint8_t buf[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t *v25;

  v4 = v3;
  v7 = *(_OWORD *)&a3->var14;
  v22 = *(_OWORD *)&a3->var10;
  v23 = v7;
  v24 = *(_OWORD *)&a3->var18;
  LOBYTE(v25) = a3[1].var5;
  v8 = *(_OWORD *)a3->var6;
  *(_OWORD *)buf = *(_OWORD *)&a3->var0;
  v19 = v8;
  v9 = *(_OWORD *)&a3->var8[2];
  v20 = *(_OWORD *)&a3->var6[4];
  v21 = v9;
  Current = CFAbsoluteTimeGetCurrent();
  v11 = sub_100A39DF4((uint64_t **)&self->_odometryPackets, (unint64_t *)(&a3->var4 + 1));
  *((_OWORD *)v11 + 4) = v22;
  *((_OWORD *)v11 + 5) = v23;
  *((_OWORD *)v11 + 6) = v24;
  v11[14] = v25;
  *(_OWORD *)v11 = *(_OWORD *)buf;
  *((_OWORD *)v11 + 1) = v19;
  *((_OWORD *)v11 + 2) = v20;
  *((_OWORD *)v11 + 3) = v21;
  v11[15] = v4;
  *((CFAbsoluteTime *)v11 + 16) = Current;
  -[CLPedestrianFenceAnalyticsManager sendAnalyticsForAllReadySessions](self, "sendAnalyticsForAllReadySessions");
  if (self->_odometryPackets.__tree_.__pair3_.__value_ >= 0x5DD)
  {
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_102165E38);
    v12 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[Analytics] Too many packets accumulated, purging them", buf, 2u);
    }
    if (sub_1001BFF7C(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_102165E38);
      v17[0] = 0;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "[Analytics] Too many packets accumulated, purging them", v17, 2);
      v16 = (uint8_t *)v15;
      sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceAnalyticsManager feedInertialOdometryPacket:atTime:]", "%s\n", v15);
      if (v16 != buf)
        free(v16);
    }
    left = self->_odometryPackets.__tree_.__pair1_.__value_.__left_;
    p_pair1 = &self->_odometryPackets.__tree_.__pair1_;
    sub_10010E39C(left);
    p_pair1[-1].__value_.__left_ = p_pair1;
    p_pair1->__value_.__left_ = 0;
    p_pair1[1].__value_.__left_ = 0;
  }
}

- (void)odometryClient:(id)a3 requestInterval:(double)a4 sequenceNumber:(unint64_t)a5
{
  id v9;
  const __CFString *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  const char *v17;
  uint8_t *v18;
  double v19;
  double v20;
  id v21;
  double v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[6];
  _QWORD v26[6];
  int v27;
  id v28;
  uint8_t buf[4];
  id v30;
  _QWORD v31[3];
  _QWORD v32[3];

  v9 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v31[0] = CFSTR("eventTime");
  -[NSDate timeIntervalSince1970](+[NSDate date](NSDate, "date"), "timeIntervalSince1970");
  v32[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v32[1] = a3;
  v31[1] = CFSTR("identifier");
  v31[2] = CFSTR("odometryEvent");
  if (a4 == 0.0)
    v10 = CFSTR("stop");
  else
    v10 = CFSTR("start");
  v32[2] = v10;
  objc_msgSend(v9, "addEntriesFromDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
  if (a4 != 0.0)
  {
    v23[0] = CFSTR("updateInterval");
    v24[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4);
    v23[1] = CFSTR("sequenceNumberStart");
    v24[1] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a5);
    v23[2] = CFSTR("timeSessionStart");
    v24[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", sub_1001FCBB4());
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"), "setObject:forKeyedSubscript:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 3), a3);
    -[CLPedestrianFenceAnalyticsManager completeIntervalEventForClient:endingAt:setNew:](self, "completeIntervalEventForClient:endingAt:setNew:", a3, a5, 1);
LABEL_21:
    objc_msgSend(v9, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4), CFSTR("updateInterval"));
    sub_10019E128((uint64_t)v9, (uint64_t)"InertialOdometryPowerMetric");
    return;
  }
  v11 = -[NSMutableDictionary objectForKey:](-[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"), "objectForKey:", a3);
  if (v11)
  {
    v12 = v11;
    -[CLPedestrianFenceAnalyticsManager completeIntervalEventForClient:endingAt:setNew:](self, "completeIntervalEventForClient:endingAt:setNew:", a3, a5, 0);
    v26[0] = a3;
    v25[0] = CFSTR("clientId");
    v25[1] = CFSTR("updateRate");
    objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("updateInterval")), "doubleValue");
    v14 = v13;
    v15 = 0.0;
    if (v14 != 0.0)
    {
      if (v14 <= 1.0)
        v15 = 1.0 / v14;
      else
        v15 = -v14;
    }
    v26[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15);
    v25[2] = CFSTR("sessionDuration");
    v19 = sub_1001FCBB4();
    objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("timeSessionStart")), "doubleValue");
    v26[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19 - v20);
    v25[3] = CFSTR("sequenceNumberStart");
    v26[3] = objc_msgSend(v12, "objectForKeyedSubscript:");
    v25[4] = CFSTR("sequenceNumberEnd");
    v25[5] = CFSTR("metricType");
    v26[4] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a5);
    v26[5] = &off_10221BAB0;
    v21 = -[NSDictionary mutableCopy](+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 6), "mutableCopy");
    -[NSMutableArray addObject:](-[CLPedestrianFenceAnalyticsManager completedSessionsAwaitingPackets](self, "completedSessionsAwaitingPackets"), "addObject:", v21);

    objc_msgSend(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("updateInterval")), "doubleValue");
    a4 = v22;
    -[NSMutableDictionary removeObjectForKey:](-[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"), "removeObjectForKey:", a3);
    -[CLPedestrianFenceAnalyticsManager sendAnalyticsForAllReadySessions](self, "sendAnalyticsForAllReadySessions");
    goto LABEL_21;
  }
  if (qword_10229FF70 != -1)
    dispatch_once(&qword_10229FF70, &stru_102165E38);
  v16 = qword_10229FF78;
  if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v30 = a3;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "[Analytics] Can't end fence session for client %{public}@ that never started", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_102165E38);
    v27 = 138543362;
    v28 = a3;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 16, "[Analytics] Can't end fence session for client %{public}@ that never started", &v27, 12);
    v18 = (uint8_t *)v17;
    sub_100512490("Generic", 1, 0, 0, "-[CLPedestrianFenceAnalyticsManager odometryClient:requestInterval:sequenceNumber:]", "%s\n", v17);
    if (v18 != buf)
      free(v18);
  }
}

- (BOOL)isAnySessionActive
{
  return -[NSMutableDictionary count](-[CLPedestrianFenceAnalyticsManager activeFenceSessions](self, "activeFenceSessions"), "count")|| -[NSMutableDictionary count](-[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"), "count") != 0;
}

- (void)createIntervalEventStartingAt:(unint64_t)a3
{
  NSMutableDictionary *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (-[NSMutableDictionary count](-[CLPedestrianFenceAnalyticsManager activeFenceSessions](self, "activeFenceSessions"), "count"))
  {
    -[CLPedestrianFenceAnalyticsManager completeIntervalEventForClient:endingAt:setNew:](self, "completeIntervalEventForClient:endingAt:setNew:", CFSTR("fenceClient"), a3, 1);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients", 0);
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[CLPedestrianFenceAnalyticsManager completeIntervalEventForClient:endingAt:setNew:](self, "completeIntervalEventForClient:endingAt:setNew:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), a3, 1);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)sendAnalyticsForAllReadySessions
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> **left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> **v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *v5;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  id v14;
  double v15;
  double v16;
  uint64_t *v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t *v23;
  NSObject *v24;
  const char *v25;
  const char *v26;
  const __CFString *v27;
  NSString *v28;
  id v29;
  const __CFString *v30;
  NSDictionary *v31;
  uint64_t **v32;
  unint64_t v33;
  uint64_t **v34;
  char *v35;
  uint64_t v36;
  const char *v37;
  const char *v38;
  const __CFString *v39;
  NSString *v40;
  id v41;
  const char *v42;
  uint8_t *v43;
  id v44;
  uint64_t v45;
  uint64_t **p_odometryPackets;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *p_pair1;
  id v48;
  NSMutableArray *obj;
  uint64_t v50;
  unint64_t v51;
  CLPedestrianFenceAnalyticsManager *v52;
  _QWORD v53[5];
  unint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  int v59;
  NSString *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  uint64_t *v64;
  __int16 v65;
  uint64_t *v66;
  __int16 v67;
  id v68;
  uint8_t buf[4];
  NSString *v70;
  __int16 v71;
  id v72;
  __int16 v73;
  uint64_t *v74;
  __int16 v75;
  uint64_t *v76;
  __int16 v77;
  id v78;
  _BYTE v79[128];

  if (self->_odometryPackets.__tree_.__pair3_.__value_)
  {
    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> **)self->_odometryPackets.__tree_.__pair1_.__value_.__left_;
    p_pair1 = &self->_odometryPackets.__tree_.__pair1_;
    if (left)
    {
      do
      {
        v4 = left;
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> **)left[1];
      }
      while (left);
    }
    else
    {
      v5 = &self->_odometryPackets.__tree_.__pair1_;
      do
      {
        v4 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> **)v5[2].__value_.__left_;
        v6 = *v4 == v5;
        v5 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *)v4;
      }
      while (v6);
    }
    v51 = (unint64_t)v4[4];
    v48 = +[NSMutableArray array](NSMutableArray, "array");
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v52 = self;
    obj = -[CLPedestrianFenceAnalyticsManager completedSessionsAwaitingPackets](self, "completedSessionsAwaitingPackets");
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
    if (v7)
    {
      p_odometryPackets = (uint64_t **)&self->_odometryPackets;
      v50 = *(_QWORD *)v56;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v56 != v50)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v8);
          v10 = objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sequenceNumberEnd")), "unsignedShortValue");
          v11 = v10 - 1;
          if (v51 < v10 - 1)
            goto LABEL_55;
          v12 = objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sequenceNumberStart")), "unsignedShortValue");
          v54 = v12;
          v13 = objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("metricType")), "intValue");
          objc_msgSend(v9, "removeObjectForKey:", CFSTR("sequenceNumberStart"));
          objc_msgSend(v9, "removeObjectForKey:", CFSTR("sequenceNumberEnd"));
          if (!v13)
            objc_msgSend(v9, "removeObjectForKey:", CFSTR("metricType"));
          v14 = -[CLPedestrianFenceAnalyticsManager aggregateStatsFromPacket:to:useAOPDuration:](v52, "aggregateStatsFromPacket:to:useAOPDuration:", v12, v10, v13 == 2);
          objc_msgSend(v9, "addEntriesFromDictionary:", v14);
          v15 = sub_1001FCBB4();
          v16 = v15;
          if (v13 == 2 && v15 - v52->_timestampLastLog <= 0.5)
            goto LABEL_49;
          v17 = (uint64_t *)p_pair1->__value_.__left_;
          if (!p_pair1->__value_.__left_)
          {
            v20 = 0;
            goto LABEL_32;
          }
          v18 = p_pair1->__value_.__left_;
          do
          {
            v19 = v18[4];
            if (v19 <= v12)
            {
              if (v19 >= v12)
              {
                v20 = sub_100A39DF4(p_odometryPackets, &v54)[15];
                v17 = (uint64_t *)p_pair1->__value_.__left_;
                if (p_pair1->__value_.__left_)
                  goto LABEL_27;
LABEL_32:
                v23 = 0;
                goto LABEL_33;
              }
              ++v18;
            }
            v18 = (_QWORD *)*v18;
          }
          while (v18);
          v20 = 0;
          if (!v17)
            goto LABEL_32;
LABEL_27:
          v21 = v17;
          while (2)
          {
            v22 = v21[4];
            if (v11 < v22)
            {
LABEL_31:
              v21 = (uint64_t *)*v21;
              if (!v21)
                goto LABEL_32;
              continue;
            }
            break;
          }
          if (v22 < v11)
          {
            ++v21;
            goto LABEL_31;
          }
          do
          {
            while (1)
            {
              v32 = (uint64_t **)v17;
              v33 = v17[4];
              if (v11 >= v33)
                break;
              v17 = *v32;
              if (!*v32)
              {
                v34 = v32;
                goto LABEL_63;
              }
            }
            if (v33 >= v11)
              goto LABEL_64;
            v17 = v32[1];
          }
          while (v17);
          v34 = v32 + 1;
LABEL_63:
          v35 = (char *)operator new(0xB0uLL);
          *((_QWORD *)v35 + 4) = v11;
          *(_OWORD *)(v35 + 40) = 0u;
          *(_OWORD *)(v35 + 56) = 0u;
          *(_OWORD *)(v35 + 72) = 0u;
          *(_OWORD *)(v35 + 88) = 0u;
          *(_OWORD *)(v35 + 104) = 0u;
          *(_OWORD *)(v35 + 120) = 0u;
          *(_OWORD *)(v35 + 136) = 0u;
          *(_OWORD *)(v35 + 152) = 0u;
          *((_QWORD *)v35 + 21) = 0;
          sub_1000145B0(p_odometryPackets, (uint64_t)v32, v34, (uint64_t *)v35);
          v32 = (uint64_t **)v35;
LABEL_64:
          v23 = v32[21];
LABEL_33:
          if (qword_10229FF70 != -1)
            dispatch_once(&qword_10229FF70, &stru_102165E38);
          v24 = qword_10229FF78;
          if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_DEFAULT))
          {
            v25 = "unexpected";
            if (v13 == 2)
              v25 = "interval";
            if (v13 == 1)
              v25 = "odometrySession";
            if (v13)
              v26 = v25;
            else
              v26 = "fenceSession";
            if (v13)
              v27 = CFSTR("clientId");
            else
              v27 = CFSTR("fenceId");
            v28 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v26);
            v29 = objc_msgSend(v9, "objectForKeyedSubscript:", v27);
            *(_DWORD *)buf = 138544386;
            v70 = v28;
            v71 = 2114;
            v72 = v29;
            v73 = 2050;
            v74 = v20;
            v75 = 2050;
            v76 = v23;
            v77 = 2114;
            v78 = v14;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[Analytics] type,%{public}@,client,%{public}@,from,%{public}f,to,%{public}f: %{public}@", buf, 0x34u);
          }
          if (sub_1001BFF7C(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_10229FF70 != -1)
              dispatch_once(&qword_10229FF70, &stru_102165E38);
            v36 = qword_10229FF78;
            v37 = "unexpected";
            if (v13 == 2)
              v37 = "interval";
            if (v13 == 1)
              v37 = "odometrySession";
            if (v13)
              v38 = v37;
            else
              v38 = "fenceSession";
            if (v13)
              v39 = CFSTR("clientId");
            else
              v39 = CFSTR("fenceId");
            v40 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v38);
            v41 = objc_msgSend(v9, "objectForKeyedSubscript:", v39);
            v59 = 138544386;
            v60 = v40;
            v61 = 2114;
            v62 = v41;
            v63 = 2050;
            v64 = v20;
            v65 = 2050;
            v66 = v23;
            v67 = 2114;
            v68 = v14;
            LODWORD(v45) = 52;
            _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, v36, 0, "[Analytics] type,%{public}@,client,%{public}@,from,%{public}f,to,%{public}f: %{public}@", &v59, v45);
            v43 = (uint8_t *)v42;
            sub_100512490("Generic", 1, 0, 2, "-[CLPedestrianFenceAnalyticsManager sendAnalyticsForAllReadySessions]", "%s\n", v42);
            if (v43 != buf)
              free(v43);
          }
          v52->_timestampLastLog = v16;
          if (v13 == 2)
          {
LABEL_49:
            if ((objc_msgSend(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("clientId")), "isEqualToString:", CFSTR("fenceClient")) & 1) == 0)goto LABEL_50;
          }
          else
          {
LABEL_50:
            if (v13)
              v30 = CFSTR("com.apple.CoreMotion.InertialOdometry");
            else
              v30 = CFSTR("com.apple.CoreMotion.PedestrianFenceSession");
            v31 = +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v9);
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = sub_100A3AB80;
            v53[3] = &unk_102132010;
            v53[4] = v31;
            AnalyticsSendEventLazy(v30, v53);
          }
          objc_msgSend(v48, "addObject:", v9);
LABEL_55:
          v8 = (char *)v8 + 1;
        }
        while (v8 != v7);
        v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
        v7 = v44;
      }
      while (v44);
    }
    -[NSMutableArray removeObjectsInArray:](-[CLPedestrianFenceAnalyticsManager completedSessionsAwaitingPackets](v52, "completedSessionsAwaitingPackets"), "removeObjectsInArray:", v48);
    -[CLPedestrianFenceAnalyticsManager cleanupPackets](v52, "cleanupPackets");
  }
}

- (id)aggregateStatsFromPacket:(unint64_t)a3 to:(unint64_t)a4 useAOPDuration:(BOOL)a5
{
  double v5;
  unint64_t v7;
  unsigned __int16 v9;
  int v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  _QWORD *i;
  unint64_t v18;
  NSObject *v19;
  const char *v20;
  uint8_t *v21;
  uint64_t **v22;
  uint64_t j;
  float v24;
  uint64_t v25;
  int8x8_t v26;
  int8x8_t v27;
  id v28;
  double v29;
  float v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v46;
  _BOOL4 v47;
  uint64_t **p_odometryPackets;
  double v49;
  float v50;
  double v51;
  double v52;
  uint64_t v53;
  unint64_t v54;
  _OWORD v55[7];
  char v56;
  int v57;
  unint64_t v58;
  uint8_t buf[4];
  unint64_t v60;

  HIDWORD(v5) = 0;
  v56 = 0;
  memset(v55, 0, sizeof(v55));
  *(_DWORD *)((char *)&v55[4] + 1) = 2139095039;
  *(_DWORD *)((char *)&v55[5] + 1) = 2139095039;
  v54 = a3;
  if (a3 >= a4)
    return &__NSDictionary0__struct;
  v7 = a3;
  v47 = a5;
  v53 = 0;
  v9 = 0;
  p_odometryPackets = (uint64_t **)&self->_odometryPackets;
  v10 = 0;
  LODWORD(v5) = 2139095039;
  v11 = 0.0;
  v12 = 0.0;
  v49 = v5;
  v51 = v5;
  v52 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  v50 = 0.0;
  v15 = 0.0;
  v16 = 0.0;
  do
  {
    for (i = self->_odometryPackets.__tree_.__pair1_.__value_.__left_; i; i = (_QWORD *)*i)
    {
      v18 = i[4];
      if (v7 >= v18)
      {
        if (v18 >= v7)
        {
          v22 = sub_100A39DF4(p_odometryPackets, &v54);
          for (j = 0; j != 20; j += 4)
          {
            v24 = *(float *)((char *)v22 + j + 13);
            *(float *)(((unint64_t)v55 | 0xD) + j) = v24 + *(float *)(((unint64_t)v55 | 0xD) + j);
            v16 = v16 + v24;
          }
          v25 = 0;
          v15 = *(float *)((char *)v22 + 33) + *(float *)((char *)&v55[2] + 1);
          *(float *)((char *)&v55[2] + 1) = v15;
          do
          {
            *(float *)((char *)&v55[2] + v25 + 5) = *(float *)((char *)v22 + v25 + 37)
                                                  + *(float *)((char *)&v55[2] + v25 + 5);
            v25 += 4;
          }
          while (v25 != 20);
          v26 = *(int8x8_t *)((char *)v22 + 65);
          *(float32x2_t *)((char *)&v55[3] + 9) = vadd_f32(*(float32x2_t *)((char *)v22 + 57), *(float32x2_t *)((char *)&v55[3] + 9));
          *(int8x8_t *)((char *)&v55[4] + 1) = vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)__PAIR64__(v26.u32[1], *(unsigned int *)((char *)&v55[4] + 1)), (float32x2_t)__PAIR64__(*(unsigned int *)((char *)&v55[4] + 5), v26.u32[0])), v26, *(int8x8_t *)((char *)&v55[4] + 1));
          v27 = *(int8x8_t *)((char *)v22 + 81);
          *(float32x2_t *)((char *)&v55[4] + 9) = vadd_f32(*(float32x2_t *)((char *)v22 + 73), *(float32x2_t *)((char *)&v55[4] + 9));
          *(int8x8_t *)((char *)&v55[5] + 1) = vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)__PAIR64__(v27.u32[1], *(unsigned int *)((char *)&v55[5] + 1)), (float32x2_t)__PAIR64__(*(unsigned int *)((char *)&v55[5] + 5), v27.u32[0])), v27, *(int8x8_t *)((char *)&v55[5] + 1));
          v11 = *(float *)((char *)v22 + 89) + *(float *)((char *)&v55[5] + 9);
          *(float *)((char *)&v55[5] + 9) = v11;
          v9 += *(_WORD *)((char *)v22 + 93);
          LOWORD(v53) = v53 + *(_WORD *)((char *)v22 + 95);
          WORD2(v53) += *(_WORD *)((char *)v22 + 97);
          v50 = *(float *)((char *)&v55[3] + 9);
          v51 = *(double *)((char *)&v55[4] + 1);
          v14 = *(float *)((char *)&v55[3] + 13);
          v52 = *(double *)((char *)&v55[4] + 9);
          v12 = *(float *)((char *)&v55[4] + 13);
          v13 = *(float *)((char *)&v55[4] + 5);
          v49 = *(double *)((char *)&v55[5] + 1);
          v10 = *(_DWORD *)((char *)&v55[5] + 5);
          goto LABEL_22;
        }
        ++i;
      }
    }
    if (qword_10229FF70 != -1)
      dispatch_once(&qword_10229FF70, &stru_102165E38);
    v19 = qword_10229FF78;
    if (os_log_type_enabled((os_log_t)qword_10229FF78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v60 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Missing packet with sequence number: %{public}llu", buf, 0xCu);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_10229FF70 != -1)
        dispatch_once(&qword_10229FF70, &stru_102165E38);
      v57 = 134349056;
      v58 = v7;
      LODWORD(v46) = 12;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_10229FF78, 0, "Missing packet with sequence number: %{public}llu", &v57, v46);
      v21 = (uint8_t *)v20;
      sub_100512490("Generic", 1, 0, 2, "-[CLPedestrianFenceAnalyticsManager aggregateStatsFromPacket:to:useAOPDuration:]", "%s\n", v20);
      if (v21 != buf)
        free(v21);
    }
LABEL_22:
    v54 = ++v7;
  }
  while (v7 != a4);
  if (v16 < 0.1)
    return &__NSDictionary0__struct;
  v28 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if (v47)
  {
    *(float *)&v29 = v16;
    objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v29), CFSTR("sessionDuration"));
  }
  v30 = 100.0 / v16;
  *(float *)&v29 = v30 * *(float *)((char *)v55 + 13);
  objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v29), CFSTR("percentTimeInNull"));
  *(float *)&v31 = v30 * *(float *)((char *)&v55[1] + 1);
  objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v31), CFSTR("percentTimeInKM"));
  *(float *)&v32 = v30 * *(float *)((char *)&v55[1] + 5);
  objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v32), CFSTR("percentTimeInPDR"));
  *(float *)&v33 = v30 * *(float *)((char *)&v55[1] + 9);
  objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v33), CFSTR("percentTimeInPDRSemiStatic"));
  *(float *)&v34 = v30 * *(float *)((char *)&v55[1] + 13);
  objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34), CFSTR("percentTimeInStatic"));
  *(float *)&v35 = v30 * v15;
  objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v35), CFSTR("percentTimeInPedestrian"));
  if (v15 > 0.0)
  {
    *(float *)&v36 = (float)(100.0 / v15) * *(float *)((char *)&v55[2] + 5);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v36), CFSTR("percentTimePlacementIsUnknown"));
    *(float *)&v37 = (float)(100.0 / v15) * *(float *)((char *)&v55[2] + 9);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v37), CFSTR("percentTimePlacementIsOnBody"));
    *(float *)&v38 = (float)(100.0 / v15) * *(float *)((char *)&v55[2] + 13);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v38), CFSTR("percentTimePlacementIsViewing"));
    *(float *)&v39 = (float)(100.0 / v15) * *(float *)((char *)&v55[3] + 1);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v39), CFSTR("percentTimePlacementIsArmSwing"));
    *(float *)&v40 = (float)(100.0 / v15) * *(float *)((char *)&v55[3] + 5);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v40), CFSTR("percentTimePlacementIsLegSwing"));
  }
  *(float *)&v36 = sqrtf((float)(v14 * v14) + (float)(v50 * v50));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v36), CFSTR("horizontalDisplacement"));
  HIDWORD(v41) = HIDWORD(v51);
  *(float *)&v41 = v13 - *(float *)&v51;
  objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v41), CFSTR("maxDeltaElevation"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v52), CFSTR("distanceTraveled"));
  v42 = *(float *)&v52;
  if (*(float *)&v52 > 0.000001)
  {
    *(float *)&v42 = (float)(100.0 / *(float *)&v52) * (float)(*(float *)&v52 - v12);
    objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v42), CFSTR("percentDisplacementInKM"));
    *(float *)&v43 = (float)(100.0 / *(float *)&v52) * v12;
    objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v43), CFSTR("percentDisplacementInPDR"));
  }
  if (v9)
  {
    *(float *)&v42 = v11 / (float)v9;
    objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v42), CFSTR("avgSpeed"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v49), CFSTR("minSpeed"));
    LODWORD(v44) = v10;
    objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v44), CFSTR("maxSpeed"));
  }
  objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", (unsigned __int16)v53), CFSTR("dotJumpCount"));
  objc_msgSend(v28, "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", WORD2(v53)), CFSTR("placementTransitionCount"));
  return v28;
}

- (void)completeIntervalEventForClient:(id)a3 endingAt:(unint64_t)a4 setNew:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[4];
  _QWORD v15[4];

  v5 = a5;
  if (-[NSMutableDictionary objectForKey:](-[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"), "objectForKey:", a3)&& objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](-[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"), "objectForKeyedSubscript:", a3), "unsignedLongLongValue") != (id)a4)
  {
    v9 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    v15[0] = a3;
    v14[0] = CFSTR("clientId");
    v14[1] = CFSTR("sequenceNumberStart");
    v15[1] = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"), "objectForKeyedSubscript:", a3);
    v14[2] = CFSTR("sequenceNumberEnd");
    v14[3] = CFSTR("metricType");
    v15[2] = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4);
    v15[3] = &off_10221BAC8;
    objc_msgSend(v9, "addEntriesFromDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 4));
    v10 = -[NSMutableDictionary objectForKeyedSubscript:](-[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"), "objectForKeyedSubscript:", a3);
    if (v10)
    {
      objc_msgSend(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("updateInterval")), "doubleValue");
      v12 = v11;
      v13 = 0.0;
      if (v12 != 0.0)
      {
        if (v12 <= 1.0)
          v13 = 1.0 / v12;
        else
          v13 = -v12;
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13), CFSTR("updateRate"));
    }
    -[NSMutableArray addObject:](-[CLPedestrianFenceAnalyticsManager completedSessionsAwaitingPackets](self, "completedSessionsAwaitingPackets"), "addObject:", v9);
  }
  if (v5)
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"), "setObject:forKeyedSubscript:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a4), a3);
  else
    -[NSMutableDictionary removeObjectForKey:](-[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"), "removeObjectForKey:", a3);
}

- (void)cleanupPackets
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *i;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *k;
  void *v18;
  NSMutableArray *v19;
  id v20;
  uint64_t v21;
  void *m;
  void *v23;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *begin_node;
  CLPedestrianFenceAnalyticsManager *left;
  CLPedestrianFenceAnalyticsManager **v26;
  CLPedestrianFenceAnalyticsManager *v27;
  BOOL v28;
  uint64_t *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];

  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v3 = -[NSMutableDictionary allValues](-[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"), "allValues");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v43;
    v6 = -1;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        if (v6 >= objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sequenceNumberStart")), "unsignedShortValue"))v6 = objc_msgSend(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sequenceNumberStart")), "unsignedShortValue");
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    }
    while (v4);
  }
  else
  {
    v6 = -1;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = -[NSMutableDictionary allValues](-[CLPedestrianFenceAnalyticsManager activeFenceSessions](self, "activeFenceSessions"), "allValues");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)j);
        if (v6 >= objc_msgSend(v13, "unsignedShortValue"))
          v6 = objc_msgSend(v13, "unsignedShortValue");
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v10);
  }
  if (!-[NSMutableDictionary count](-[CLPedestrianFenceAnalyticsManager activeFenceSessions](self, "activeFenceSessions"), "count")&& !-[NSMutableDictionary count](-[CLPedestrianFenceAnalyticsManager activeOdometryClients](self, "activeOdometryClients"), "count"))
  {
    -[NSMutableDictionary removeAllObjects](-[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"), "removeAllObjects");
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = -[NSMutableDictionary allValues](-[CLPedestrianFenceAnalyticsManager activeIntervalEvents](self, "activeIntervalEvents"), "allValues");
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v15; k = (char *)k + 1)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)k);
        if (v6 >= objc_msgSend(v18, "unsignedShortValue"))
          v6 = objc_msgSend(v18, "unsignedShortValue");
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v15);
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = -[CLPedestrianFenceAnalyticsManager completedSessionsAwaitingPackets](self, "completedSessionsAwaitingPackets", 0);
  v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v31;
    do
    {
      for (m = 0; m != v20; m = (char *)m + 1)
      {
        if (*(_QWORD *)v31 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)m);
        if (v6 >= objc_msgSend(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("sequenceNumberStart")), "unsignedShortValue"))v6 = objc_msgSend(objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("sequenceNumberStart")), "unsignedShortValue");
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v30, v46, 16);
    }
    while (v20);
  }
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *)self->_odometryPackets.__tree_.__begin_node_;
  if (begin_node != &self->_odometryPackets.__tree_.__pair1_)
  {
    do
    {
      left = (CLPedestrianFenceAnalyticsManager *)begin_node[1].__value_.__left_;
      if (begin_node[4].__value_.__left_ >= (void *)v6)
      {
        if (left)
        {
          do
          {
            v27 = left;
            left = (CLPedestrianFenceAnalyticsManager *)left->super.isa;
          }
          while (left);
        }
        else
        {
          do
          {
            v27 = (CLPedestrianFenceAnalyticsManager *)begin_node[2].__value_.__left_;
            v28 = v27->super.isa == (Class)begin_node;
            begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *)v27;
          }
          while (!v28);
        }
      }
      else
      {
        v26 = (CLPedestrianFenceAnalyticsManager **)begin_node;
        if (left)
        {
          do
          {
            v27 = left;
            left = (CLPedestrianFenceAnalyticsManager *)left->super.isa;
          }
          while (left);
        }
        else
        {
          do
          {
            v27 = v26[2];
            v28 = v27->super.isa == (Class)v26;
            v26 = (CLPedestrianFenceAnalyticsManager **)v27;
          }
          while (!v28);
        }
        if (self->_odometryPackets.__tree_.__begin_node_ == begin_node)
          self->_odometryPackets.__tree_.__begin_node_ = v27;
        v29 = (uint64_t *)self->_odometryPackets.__tree_.__pair1_.__value_.__left_;
        --self->_odometryPackets.__tree_.__pair3_.__value_;
        sub_10025F998(v29, (uint64_t *)begin_node);
        operator delete(begin_node);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, (anonymous namespace)::OdometryPacket>, void *>>> *)v27;
    }
    while (v27 != (CLPedestrianFenceAnalyticsManager *)&self->_odometryPackets.__tree_.__pair1_);
  }
}

- (NSMutableDictionary)activeOdometryClients
{
  return self->_activeOdometryClients;
}

- (void)setActiveOdometryClients:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableDictionary)activeIntervalEvents
{
  return self->_activeIntervalEvents;
}

- (void)setActiveIntervalEvents:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableDictionary)activeFenceSessions
{
  return self->_activeFenceSessions;
}

- (void)setActiveFenceSessions:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSMutableArray)completedSessionsAwaitingPackets
{
  return self->_completedSessionsAwaitingPackets;
}

- (void)setCompletedSessionsAwaitingPackets:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSMutableDictionary)fenceHistoryPerSession
{
  return self->_fenceHistoryPerSession;
}

- (void)setFenceHistoryPerSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  sub_10010E39C((_QWORD *)self->_odometryPackets.__tree_.__pair1_.__value_.__left_);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 2) = (char *)self + 24;
  return self;
}

@end
