@implementation _DASNetworkSynchronizationPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (self->_inPossibleSynchronizationWindow
    && objc_msgSend(v4, "requiresNetwork")
    && (v6 = objc_msgSend(v5, "schedulingPriority"), (unint64_t)v6 <= _DASSchedulingPriorityUtility))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
    if (v9 || +[_DASPhotosPolicy isiCPLActivity:](_DASPhotosPolicy, "isiCPLActivity:", v5))
    {
      v7 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fastPass"));
      v7 = v10 == 0;

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[4];
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForChangeAtKeyPath:](_CDContextualPredicate, "predicateForChangeAtKeyPath:", v2));

  v7[0] = CFSTR("identifier");
  v7[1] = CFSTR("predicate");
  v8[0] = CFSTR("Network Synchronization Policy");
  v8[1] = v3;
  v7[2] = CFSTR("deviceSet");
  v7[3] = CFSTR("mustWake");
  v8[2] = &off_10016E678;
  v8[3] = &__kCFBooleanTrue;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return v5;
}

- (void)handleTimerFireAtDate:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  char *v11;
  NSUInteger v12;
  char *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  dispatch_time_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint32_t v44;
  NSObject *timer;
  dispatch_time_t v46;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "components:fromDate:", 192, v6));
  v10 = objc_msgSend(v9, "minute");
  v11 = (char *)objc_msgSend(v9, "second") + 60 * (_QWORD)v10;
  v12 = -[NSIndexSet indexGreaterThanOrEqualToIndex:](self->_affectedSeconds, "indexGreaterThanOrEqualToIndex:", v11);
  if (v12 != 0x7FFFFFFFFFFFFFFFLL && v12 == (_QWORD)v11)
  {
    v25 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("policy")));
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      sub_1000E1B28((uint64_t)v11, v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForInUseStatus](_CDContextQueries, "keyPathForInUseStatus"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v26));

    v28 = objc_msgSend(v27, "BOOLValue");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForLastUseDate](_CDContextQueries, "keyPathForLastUseDate"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v29));

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkSynchronizationPolicy lastWakeDate](self, "lastWakeDate"));
    objc_msgSend(v6, "timeIntervalSinceDate:", v31);
    v33 = v32;
    objc_msgSend(v6, "timeIntervalSinceDate:", v30);
    self->_lastUserInactivity = v34;
    if ((v28 & 1) == 0
      && v33 > 0.0
      && v33 < (double)self->_recentWakeInterval
      && v34 > (double)self->_recentActivityInterval)
    {
      if (!self->_inPossibleSynchronizationWindow)
        -[_DASNetworkSynchronizationPolicy postNotificationInWindow:](self, "postNotificationInWindow:", 1);
      self->_inPossibleSynchronizationWindow = 1;
      v35 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("policy")));
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        sub_1000E1AF4(v35, v36, v37, v38, v39, v40, v41, v42);

    }
    v43 = self->_secondsAfterSpike + self->_secondsBeforeSpike;
    v44 = arc4random_uniform(self->_randomizationInterval);
    timer = self->_timer;
    v46 = dispatch_walltime(0, 1000000000 * (v43 + v44));
    dispatch_source_set_timer(timer, v46, 0xFFFFFFFFFFFFFFFFLL, 1uLL);

  }
  else
  {
    v14 = (char *)v12;
    if (self->_inPossibleSynchronizationWindow)
      -[_DASNetworkSynchronizationPolicy postNotificationInWindow:](self, "postNotificationInWindow:", 0);
    v15 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("policy")));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      sub_1000E1B9C(v15, v16, v17, v18, v19, v20, v21, v22);

    self->_inPossibleSynchronizationWindow = 0;
    if (v14 == (char *)0x7FFFFFFFFFFFFFFFLL)
      v14 = (char *)-[NSIndexSet firstIndex](self->_affectedSeconds, "firstIndex") + 3600;
    v23 = self->_timer;
    v24 = dispatch_walltime(0, 1000000000 * (v14 - v11));
    dispatch_source_set_timer(v23, v24, 0xFFFFFFFFFFFFFFFFLL, 1uLL);
  }

}

- (id)secondsFromSpikeMinutes:(id)a3 secondsBeforeSpike:(unint64_t)a4 secondsAfterSpike:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v20 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v20)
          objc_enumerationMutation(obj);
        v12 = 60 * (_QWORD)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v11), "unsignedLongValue");
        if (a4)
        {
          v13 = v12 + 3599;
          v14 = a4;
          do
          {
            objc_msgSend(v8, "addIndex:", v13 % 0xE10);
            --v13;
            --v14;
          }
          while (v14);
        }
        v15 = 0;
        v16 = v12;
        do
        {
          objc_msgSend(v8, "addIndex:", v15 + v12 - 3600 * (v16 / 0xE10));
          ++v15;
          ++v16;
        }
        while (v15 <= a5);
        v11 = (char *)v11 + 1;
      }
      while (v11 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v17 = objc_msgSend(v8, "copy");
  return v17;
}

- (_DASNetworkSynchronizationPolicy)init
{
  _DASNetworkSynchronizationPolicy *v2;
  _DASNetworkSynchronizationPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  _CDContext *context;
  uint64_t v7;
  NSArray *triggers;
  uint64_t v9;
  NSSet *spikeMinutes;
  uint64_t v11;
  NSIndexSet *affectedSeconds;
  dispatch_queue_global_t global_queue;
  NSObject *v14;
  dispatch_source_t v15;
  OS_dispatch_source *timer;
  NSObject *v17;
  _DASNetworkSynchronizationPolicy *v18;
  void *v19;
  _QWORD handler[4];
  _DASNetworkSynchronizationPolicy *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_DASNetworkSynchronizationPolicy;
  v2 = -[_DASNetworkSynchronizationPolicy init](&v23, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Network Synchronization Policy");

    v5 = objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
    context = v3->_context;
    v3->_context = (_CDContext *)v5;

    v7 = objc_claimAutoreleasedReturnValue(-[_DASNetworkSynchronizationPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_10016E690, &off_10016E6A8, &off_10016E6C0, &off_10016E6D8, 0));
    spikeMinutes = v3->_spikeMinutes;
    v3->_spikeMinutes = (NSSet *)v9;

    *(_OWORD *)&v3->_secondsBeforeSpike = xmmword_10011D0C0;
    v11 = objc_claimAutoreleasedReturnValue(-[_DASNetworkSynchronizationPolicy secondsFromSpikeMinutes:secondsBeforeSpike:secondsAfterSpike:](v3, "secondsFromSpikeMinutes:secondsBeforeSpike:secondsAfterSpike:", v3->_spikeMinutes, 30, 15));
    affectedSeconds = v3->_affectedSeconds;
    v3->_affectedSeconds = (NSIndexSet *)v11;

    v3->_recentActivityInterval = 300;
    *(_QWORD *)&v3->_randomizationInterval = 0xA000001C2;
    if (-[NSIndexSet count](v3->_affectedSeconds, "count"))
    {
      global_queue = dispatch_get_global_queue(-2, 0);
      v14 = objc_claimAutoreleasedReturnValue(global_queue);
      v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v14);
      timer = v3->_timer;
      v3->_timer = (OS_dispatch_source *)v15;

      v17 = v3->_timer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10004B2F4;
      handler[3] = &unk_10015D4E0;
      v18 = v3;
      v22 = v18;
      dispatch_source_set_event_handler(v17, handler);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      -[_DASNetworkSynchronizationPolicy handleTimerFireAtDate:withContext:](v18, "handleTimerFireAtDate:withContext:", v19, v3->_context);

      dispatch_activate((dispatch_object_t)v3->_timer);
    }
  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001AB680 != -1)
    dispatch_once(&qword_1001AB680, &stru_10015E178);
  return (id)qword_1001AB688;
}

- (BOOL)shouldLogScoreToPowerLog
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 0.00001;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Network Synchronization Policy")))
  {
    if (+[_DASDeviceActivityPolicy isDeviceInUse:](_DASDeviceActivityPolicy, "isDeviceInUse:", v6)
      && self->_inPossibleSynchronizationWindow)
    {
      v7 = 0;
      self->_inPossibleSynchronizationWindow = 0;
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)lastWakeDate
{
  void *v2;
  NSObject *v3;
  size_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[4];
  void *v9;

  v6 = 0;
  v7 = 0;
  v5 = 16;
  sysctlbyname("kern.waketime", &v6, &v5, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)v7 / 1000000000.0 + (double)v6));
  v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("policy")));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Last wake date: %@", buf, 0xCu);
  }

  return v2;
}

- (void)postNotificationInWindow:(BOOL)a3
{
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  _QWORD block[4];
  BOOL v7;

  global_queue = dispatch_get_global_queue(-2, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B5C0;
  block[3] = &unk_10015E198;
  v7 = a3;
  dispatch_async(v5, block);

}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  _DASPolicyResponseRationale *v5;
  uint64_t v6;
  void *v7;

  v5 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", self->_policyName);
  if (self->_inPossibleSynchronizationWindow
    && _os_feature_enabled_impl("DAS", "network_synchronization_policy"))
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v5, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("lastUserActivity"), (double)self->_recentActivityInterval, self->_lastUserInactivity);
    v6 = 33;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v6, v5, (double)0x384uLL));

  return v7;
}

- (NSString)policyName
{
  return self->_policyName;
}

- (void)setPolicyName:(id)a3
{
  objc_storeStrong((id *)&self->_policyName, a3);
}

- (NSString)policyDescription
{
  return self->_policyDescription;
}

- (void)setPolicyDescription:(id)a3
{
  objc_storeStrong((id *)&self->_policyDescription, a3);
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (BOOL)inPossibleSynchronizationWindow
{
  return self->_inPossibleSynchronizationWindow;
}

- (void)setInPossibleSynchronizationWindow:(BOOL)a3
{
  self->_inPossibleSynchronizationWindow = a3;
}

- (double)lastUserInactivity
{
  return self->_lastUserInactivity;
}

- (void)setLastUserInactivity:(double)a3
{
  self->_lastUserInactivity = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSIndexSet)affectedSeconds
{
  return self->_affectedSeconds;
}

- (void)setAffectedSeconds:(id)a3
{
  objc_storeStrong((id *)&self->_affectedSeconds, a3);
}

- (NSSet)spikeMinutes
{
  return self->_spikeMinutes;
}

- (void)setSpikeMinutes:(id)a3
{
  objc_storeStrong((id *)&self->_spikeMinutes, a3);
}

- (unint64_t)secondsBeforeSpike
{
  return self->_secondsBeforeSpike;
}

- (void)setSecondsBeforeSpike:(unint64_t)a3
{
  self->_secondsBeforeSpike = a3;
}

- (unint64_t)secondsAfterSpike
{
  return self->_secondsAfterSpike;
}

- (void)setSecondsAfterSpike:(unint64_t)a3
{
  self->_secondsAfterSpike = a3;
}

- (int)randomizationInterval
{
  return self->_randomizationInterval;
}

- (void)setRandomizationInterval:(int)a3
{
  self->_randomizationInterval = a3;
}

- (int)recentWakeInterval
{
  return self->_recentWakeInterval;
}

- (void)setRecentWakeInterval:(int)a3
{
  self->_recentWakeInterval = a3;
}

- (int)recentActivityInterval
{
  return self->_recentActivityInterval;
}

- (void)setRecentActivityInterval:(int)a3
{
  self->_recentActivityInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spikeMinutes, 0);
  objc_storeStrong((id *)&self->_affectedSeconds, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
