@implementation CarQuickRouteRefreshOperation

+ (void)initialize
{
  NSOperationQueue *v2;
  void *v3;
  NSOperationQueue *v4;
  void *v5;
  void *v6;

  if ((id)objc_opt_class(CarQuickRouteRefreshOperation) == a1)
  {
    v2 = objc_opt_new(NSOperationQueue);
    v3 = (void *)qword_1014D2028;
    qword_1014D2028 = (uint64_t)v2;

    objc_msgSend((id)qword_1014D2028, "setName:", CFSTR("SharedETARefresh"));
    objc_msgSend((id)qword_1014D2028, "setQualityOfService:", 25);
    v4 = objc_opt_new(NSOperationQueue);
    v5 = (void *)qword_1014D2030;
    qword_1014D2030 = (uint64_t)v4;

    objc_msgSend((id)qword_1014D2030, "setName:", CFSTR("SharedDelayedETARefresh"));
    objc_msgSend((id)qword_1014D2030, "setQualityOfService:", 9);
    objc_msgSend((id)qword_1014D2030, "setSuspended:", 1);
    v6 = (void *)qword_1014D2038;
    qword_1014D2038 = (uint64_t)&off_101273038;

  }
}

+ (unint64_t)throttlePreventionLevelForAvailableRequestCount:(unsigned int)a3
{
  unint64_t v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = 30;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)qword_1014D2038;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = (30 - a3) & ~((30 - a3) >> 63);
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
      v4 = (unint64_t)objc_msgSend(v11, "unsignedIntegerValue", (_QWORD)v13);
      if ((unint64_t)objc_msgSend(v11, "unsignedIntegerValue") >= v8)
        break;
      if (v7 == (id)++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  return v4;
}

+ (unint64_t)throttlePreventionLevel
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unsigned int v9;
  double v10;

  v10 = 0.0;
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOThrottlerRequester sharedRequester](GEOThrottlerRequester, "sharedRequester"));
  objc_msgSend(v3, "getThrottleStateFor:nextSafeRequestTime:availableRequestCount:error:", 672, &v10, &v9, 0);

  v4 = v10;
  v5 = v4 - CFAbsoluteTimeGetCurrent();
  if (v5 >= 0.0)
    v6 = v5;
  else
    v6 = 0.0;
  v7 = (double)(unint64_t)objc_msgSend(a1, "throttlePreventionLevelForAvailableRequestCount:", v9);
  if (v6 <= v7)
    return (unint64_t)v6;
  return (unint64_t)v7;
}

+ (id)throttleStateDescription
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  const __CFString *v9;
  id v10;
  const __CFString *v11;
  id v12;
  const __CFString *v13;
  unsigned int v15;
  double v16;

  v16 = 0.0;
  v15 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEOThrottlerRequester sharedRequester](GEOThrottlerRequester, "sharedRequester"));
  objc_msgSend(v3, "getThrottleStateFor:nextSafeRequestTime:availableRequestCount:error:", 672, &v16, &v15, 0);

  v4 = objc_msgSend(a1, "throttlePreventionLevelForAvailableRequestCount:", v15);
  v5 = v16;
  v6 = v5 - CFAbsoluteTimeGetCurrent();
  if (v6 >= 0.0)
    v7 = v6;
  else
    v7 = 0.0;
  v8 = +[CarQuickRouteRefreshOperation throttlePreventionLevel](CarQuickRouteRefreshOperation, "throttlePreventionLevel");
  if (byte_1014D2020)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v10 = objc_msgSend((id)qword_1014D2028, "operationCount");
  if (objc_msgSend((id)qword_1014D2028, "isSuspended"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  v12 = objc_msgSend((id)qword_1014D2030, "operationCount");
  if (objc_msgSend((id)qword_1014D2030, "isSuspended"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<ThrottlePreventionLevel=%lu FullThrottleEngaged=%@ throttleState: (Level=%lu ResetTimeRemaining=%f)  PrimaryQueue: (count=%lu suspended=%@) DelayedQueue: (count=%lu suspended=%@)>"), v8, v9, v4, *(_QWORD *)&v7, v10, v11, v12, v13));
}

+ (void)suspendQueues:(BOOL)a3
{
  _BOOL8 v4;

  if (byte_1014D2020 != 1 || a3)
  {
    v4 = a3;
    if (objc_msgSend((id)qword_1014D2028, "isSuspended") != a3
      || objc_msgSend((id)qword_1014D2030, "isSuspended") != v4)
    {
      objc_msgSend((id)qword_1014D2028, "setSuspended:", v4);
      if (v4
        || !objc_msgSend((id)qword_1014D2028, "operationCount")
        && +[CarQuickRouteRefreshOperation throttlePreventionLevel](CarQuickRouteRefreshOperation, "throttlePreventionLevel") <= 4)
      {
        objc_msgSend((id)qword_1014D2030, "setSuspended:", v4);
      }
    }
  }
}

+ (void)engageFullThrottleForInterval:(double)a3
{
  dispatch_time_t v4;

  if ((byte_1014D2020 & 1) == 0)
  {
    byte_1014D2020 = 1;
    +[CarQuickRouteRefreshOperation suspendQueues:](CarQuickRouteRefreshOperation, "suspendQueues:", 1);
    v4 = dispatch_time(0, (uint64_t)((a3 + 1.0) * 1000000000.0));
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, &stru_1011B0008);
  }
}

+ (BOOL)isFullThrottleEngaged
{
  return byte_1014D2020;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarQuickRouteRefreshOperation quickRouteManager](self, "quickRouteManager"));
  if (objc_msgSend(v4, "_Car_isVisible"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarQuickRouteRefreshOperation quickRouteManager](self, "quickRouteManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mapItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p quickRouteManager isVisible=%@ name=%@>"), v3, self, v5, v8));

  return v9;
}

- (CarQuickRouteRefreshOperation)initWithQuickRoute:(id)a3
{
  id v5;
  CarQuickRouteRefreshOperation *v6;
  CarQuickRouteRefreshOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarQuickRouteRefreshOperation;
  v6 = -[CarQuickRouteRefreshOperation init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_quickRouteManager, a3);
    -[CarQuickRouteRefreshOperation setCompletionBlock:](v7, "setCompletionBlock:", &stru_1011B0028);
  }

  return v7;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue currentQueue](NSOperationQueue, "currentQueue"));
  v4 = v3;
  if (v3 == (void *)qword_1014D2028)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarQuickRouteRefreshOperation quickRouteManager](self, "quickRouteManager"));
    v6 = objc_msgSend(v5, "_Car_isVisible");

    if ((v6 & 1) == 0)
      goto LABEL_8;
  }
  else
  {

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue currentQueue](NSOperationQueue, "currentQueue"));
  v8 = v7;
  if (v7 != (void *)qword_1014D2030)
  {

LABEL_9:
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarQuickRouteRefreshOperation quickRouteManager](self, "quickRouteManager"));
    objc_msgSend(v10, "updateETA");

    v11 = (id)objc_claimAutoreleasedReturnValue(-[CarQuickRouteRefreshOperation quickRouteManager](self, "quickRouteManager"));
    objc_msgSend(v11, "set_Car_refreshOperation:", 0);
    goto LABEL_10;
  }
  v9 = +[CarQuickRouteRefreshOperation throttlePreventionLevel](CarQuickRouteRefreshOperation, "throttlePreventionLevel");

  if (v9 < 5)
    goto LABEL_9;
  objc_msgSend((id)qword_1014D2030, "setSuspended:", 1);
LABEL_8:
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CarQuickRouteRefreshOperation quickRouteManager](self, "quickRouteManager"));
  objc_msgSend(v11, "_Car_queueUpdateETA");
LABEL_10:

}

- (_MKQuickRouteManager)quickRouteManager
{
  return self->_quickRouteManager;
}

- (void)setQuickRouteManager:(id)a3
{
  objc_storeStrong((id *)&self->_quickRouteManager, a3);
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_loadWeakRetained((id *)&self->_operationQueue);
}

- (void)setOperationQueue:(id)a3
{
  objc_storeWeak((id *)&self->_operationQueue, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_operationQueue);
  objc_storeStrong((id *)&self->_quickRouteManager, 0);
}

@end
