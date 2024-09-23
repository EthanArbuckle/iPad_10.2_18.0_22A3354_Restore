@implementation _DASThunderingHerdPolicy

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;

  v3 = a3;
  if (objc_msgSend(v3, "budgeted"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fileProtection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASFileProtection complete](_DASFileProtection, "complete"));
    v6 = objc_msgSend(v4, "isEqual:", v5) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (NSArray)triggers
{
  return self->_triggers;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[4];
  _QWORD v20[4];
  _QWORD v21[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForPluginStatus](_CDContextQueries, "keyPathForPluginStatus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForKeyPath:equalToValue:withMinimumDurationInPreviousState:](_CDContextualPredicate, "predicateForKeyPath:equalToValue:withMinimumDurationInPreviousState:", v2, &off_10016E8B8, 14400.0));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForKeybagLockStatus](_CDContextQueries, "keyPathForKeybagLockStatus"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForKeyPath:equalToValue:withMinimumDurationInPreviousState:](_CDContextualPredicate, "predicateForKeyPath:equalToValue:withMinimumDurationInPreviousState:", v3, &off_10016E8D0, 14400.0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForWiFiConnectionQuality](_CDContextQueries, "keyPathForWiFiConnectionQuality"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self.value == %@"), &off_10016E8D0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextualPredicate predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:](_CDContextualPredicate, "predicateForKeyPath:withPredicate:withPredicateForPreviousState:withMinimumDurationInPreviousState:", v4, v5, v6, 14400.0));

  v19[0] = CFSTR("identifier");
  v19[1] = CFSTR("predicate");
  v20[0] = CFSTR("com.apple.duetactivityscheduler.thpolicy.lengthyUnplug");
  v20[1] = v14;
  v19[2] = CFSTR("deviceSet");
  v19[3] = CFSTR("mustWake");
  v20[2] = &off_10016E8E8;
  v20[3] = &__kCFBooleanTrue;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 4));
  v21[0] = v7;
  v17[0] = CFSTR("identifier");
  v17[1] = CFSTR("predicate");
  v18[0] = CFSTR("com.apple.duetactivityscheduler.thpolicy.lengthyLock");
  v18[1] = v13;
  v17[2] = CFSTR("deviceSet");
  v17[3] = CFSTR("mustWake");
  v18[2] = &off_10016E8E8;
  v18[3] = &__kCFBooleanTrue;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 4));
  v21[1] = v8;
  v15[0] = CFSTR("identifier");
  v15[1] = CFSTR("predicate");
  v16[0] = CFSTR("com.apple.duetactivityscheduler.thpolicy.lengthyNoNetwork");
  v16[1] = v12;
  v15[2] = CFSTR("deviceSet");
  v15[3] = CFSTR("mustWake");
  v16[2] = &off_10016E8E8;
  v16[3] = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 4));
  v21[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));

  return v10;
}

- (_DASThunderingHerdPolicy)init
{
  _DASThunderingHerdPolicy *v2;
  _DASThunderingHerdPolicy *v3;
  NSString *policyName;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  dispatch_source_t v9;
  OS_dispatch_source *shortTermTimer;
  uint64_t v11;
  NSArray *triggers;
  NSObject *v13;
  dispatch_source_t *v14;
  dispatch_source_t v15;
  dispatch_source_t v16;
  NSObject *v17;
  dispatch_source_t *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v23[4];
  dispatch_source_t *v24;
  uint8_t buf[16];
  _QWORD v26[4];
  dispatch_source_t *v27;
  _QWORD handler[4];
  dispatch_source_t *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)_DASThunderingHerdPolicy;
  v2 = -[_DASThunderingHerdPolicy init](&v30, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Thundering Herd Policy");

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.dasd.thunderingHerdPolicy.syncQueue", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v3->_queue);
    shortTermTimer = v3->_shortTermTimer;
    v3->_shortTermTimer = (OS_dispatch_source *)v9;

    v11 = objc_claimAutoreleasedReturnValue(-[_DASThunderingHerdPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v11;

    dispatch_source_set_timer((dispatch_source_t)v3->_shortTermTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xE8D4A51000uLL);
    dispatch_set_qos_class_fallback(v3->_shortTermTimer, 17);
    v13 = v3->_shortTermTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100069BD0;
    handler[3] = &unk_10015D4E0;
    v14 = v3;
    v29 = v14;
    dispatch_source_set_event_handler(v13, handler);
    dispatch_activate((dispatch_object_t)v3->_shortTermTimer);
    v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v3->_queue);
    v16 = v14[7];
    v14[7] = v15;

    dispatch_source_set_timer(v14[7], 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0xE8D4A51000uLL);
    dispatch_set_qos_class_fallback(v14[7], 17);
    v17 = v14[7];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100069BDC;
    v26[3] = &unk_10015D4E0;
    v18 = v14;
    v27 = v18;
    dispatch_source_set_event_handler(v17, v26);
    dispatch_activate(v14[7]);
    v19 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    *((_BYTE *)v18 + 10) = objc_msgSend(v19, "BOOLForKey:", CFSTR("ignoreTH"));

    if (*((_BYTE *)v18 + 10))
    {
      v20 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("thpolicy")));
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Ignoring TH triggers!", buf, 2u);
      }

    }
    v21 = v3->_queue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100069BE8;
    v23[3] = &unk_10015D9B8;
    v24 = v18;
    notify_register_dispatch("com.apple.dasd.thunderingHerdTrigger", (int *)&unk_1001AB9B0, v21, v23);

  }
  return v3;
}

- (void)setRecentTriggerEvent:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v5[2];

  v3 = a3;
  self->_recentTriggerEvent = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("thpolicy")));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting recent trigger event to %u", (uint8_t *)v5, 8u);
  }

}

- (void)setWaitingForInactivity:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v5[2];

  v3 = a3;
  self->_waitingForInactivity = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("thpolicy")));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Set waiting for user inactivity to %u", (uint8_t *)v5, 8u);
  }

}

+ (id)policyInstance
{
  if (qword_1001AB9B8 != -1)
    dispatch_once(&qword_1001AB9B8, &stru_10015E8A8);
  return (id)qword_1001AB9C0;
}

- (void)handleTriggerEvent
{
  NSObject *shortTermTimer;
  dispatch_time_t v4;
  NSObject *longTermTimer;
  dispatch_time_t v6;

  -[_DASThunderingHerdPolicy setRecentTriggerEvent:](self, "setRecentTriggerEvent:", 1);
  -[_DASThunderingHerdPolicy setWaitingForInactivity:](self, "setWaitingForInactivity:", 1);
  shortTermTimer = self->_shortTermTimer;
  v4 = dispatch_walltime(0, 300000000000);
  dispatch_source_set_timer(shortTermTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x3E8uLL);
  longTermTimer = self->_longTermTimer;
  v6 = dispatch_walltime(0, 900000000000);
  dispatch_source_set_timer(longTermTimer, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3E8uLL);
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.thpolicy.lengthyUnplug")) & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.thpolicy.lengthyLock")) & 1) != 0|| objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.duetactivityscheduler.thpolicy.lengthyNoNetwork")))
  {
    -[_DASThunderingHerdPolicy handleTriggerEvent](self, "handleTriggerEvent");
    +[_DASMetricRecorder recordOccurrenceForKey:](_DASMetricRecorder, "recordOccurrenceForKey:", CFSTR("com.apple.dasd.thunderingHerdTrigger"));
    objc_storeStrong((id *)&self->_recentTriggerReason, a3);
  }

  return 1;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _DASPolicyResponseRationale *v9;
  NSPredicate *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v21;
  const __CFString *v22;
  void *v23;

  v6 = a3;
  v7 = a4;
  if (self->_recentTriggerEvent)
  {
    if (!self->_waitingForInactivity)
      goto LABEL_7;
  }
  else if (!self->_waitingForInactivity)
  {
LABEL_8:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", 0, 0, (double)0x384uLL));
    goto LABEL_20;
  }
  if (!+[_DASDeviceActivityPolicy isDeviceInUse:](_DASDeviceActivityPolicy, "isDeviceInUse:", v7))
    -[_DASThunderingHerdPolicy setWaitingForInactivity:](self, "setWaitingForInactivity:", 0);
LABEL_7:
  if (self->_ignoreTH)
    goto LABEL_8;
  v9 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Thundering Herd Policy"));
  if (self->_recentTriggerEvent)
  {
    v10 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("timeSinceThunderingHerdTriggerEvent < %@"), &off_10016E900, v21);
  }
  else
  {
    if (!self->_waitingForInactivity
      || !+[_DASDeviceActivityPolicy isDeviceInUse:](_DASDeviceActivityPolicy, "isDeviceInUse:", v7))
    {
      v13 = 0;
      v14 = 0;
      goto LABEL_16;
    }
    v10 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("deviceInUse == %u and timeSinceThunderingHerdTriggerEvent < %@"), 1, &off_10016E918);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("recentTriggerReason == %@"), self->_recentTriggerReason));
  -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v12);

  v13 = 1;
  v14 = 33;
LABEL_16:
  v22 = CFSTR("ThunderingHerd");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13));
  v23 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPPSDataManager sharedInstance](_DASPPSDataManager, "sharedInstance"));
  objc_msgSend(v17, "sendDataToPPS:subsystem:category:", v16, CFSTR("BackgroundProcessing"), CFSTR("SystemConditionsOther"));

  if (+[_DASPhotosPolicy isActivity:consideredNonDiscretionary:](_DASPhotosPolicy, "isActivity:consideredNonDiscretionary:", v6, v7))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isPhotosConsideredNonDiscretionary == 1")));
    -[_DASPolicyResponseRationale addRationaleWithCondition:](v9, "addRationaleWithCondition:", v18);

    v19 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", v9, 0.8, (double)0x384uLL));
  }
  else
  {
    v19 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v14, v9, (double)0x384uLL));
  }
  v8 = (void *)v19;

LABEL_20:
  return v8;
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

- (void)setTriggers:(id)a3
{
  objc_storeStrong((id *)&self->_triggers, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)shortTermTimer
{
  return self->_shortTermTimer;
}

- (void)setShortTermTimer:(id)a3
{
  objc_storeStrong((id *)&self->_shortTermTimer, a3);
}

- (OS_dispatch_source)longTermTimer
{
  return self->_longTermTimer;
}

- (void)setLongTermTimer:(id)a3
{
  objc_storeStrong((id *)&self->_longTermTimer, a3);
}

- (NSDate)eventTriggerTime
{
  return self->_eventTriggerTime;
}

- (void)setEventTriggerTime:(id)a3
{
  objc_storeStrong((id *)&self->_eventTriggerTime, a3);
}

- (NSString)recentTriggerReason
{
  return self->_recentTriggerReason;
}

- (void)setRecentTriggerReason:(id)a3
{
  objc_storeStrong((id *)&self->_recentTriggerReason, a3);
}

- (BOOL)recentTriggerEvent
{
  return self->_recentTriggerEvent;
}

- (BOOL)waitingForInactivity
{
  return self->_waitingForInactivity;
}

- (BOOL)ignoreTH
{
  return self->_ignoreTH;
}

- (void)setIgnoreTH:(BOOL)a3
{
  self->_ignoreTH = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentTriggerReason, 0);
  objc_storeStrong((id *)&self->_eventTriggerTime, 0);
  objc_storeStrong((id *)&self->_longTermTimer, 0);
  objc_storeStrong((id *)&self->_shortTermTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
