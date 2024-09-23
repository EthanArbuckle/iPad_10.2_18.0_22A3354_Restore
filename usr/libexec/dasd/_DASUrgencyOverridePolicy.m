@implementation _DASUrgencyOverridePolicy

- (BOOL)appliesToActivity:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableDictionary *urgentActivities;
  void *v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  urgentActivities = self->_urgentActivities;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](urgentActivities, "objectForKey:", v7));
  LOBYTE(urgentActivities) = v8 != 0;

  os_unfair_lock_unlock(p_lock);
  return (char)urgentActivities;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056624;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001AB7D8 != -1)
    dispatch_once(&qword_1001AB7D8, block);
  return (id)qword_1001AB7E0;
}

- (_DASUrgencyOverridePolicy)init
{
  _DASUrgencyOverridePolicy *v2;
  _DASUrgencyOverridePolicy *v3;
  NSString *policyName;
  id v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *urgentActivities;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_DASUrgencyOverridePolicy;
  v2 = -[_DASUrgencyOverridePolicy init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Urgency Override Policy");

    v5 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dictionaryForKey:", CFSTR("urgentActivities")));
    v7 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
    urgentActivities = v3->_urgentActivities;
    v3->_urgentActivities = v7;

    if (!v3->_urgentActivities)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v10 = v3->_urgentActivities;
      v3->_urgentActivities = v9;

    }
    v3->_lock._os_unfair_lock_opaque = 0;
  }
  return v3;
}

- (void)addActivity:(id)a3 urgencyLevel:(int64_t)a4
{
  id v6;
  NSObject *v7;
  NSMutableDictionary *urgentActivities;
  void *v9;
  id v10;
  int v11;
  id v12;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("UrgencyOverride")));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding %@ to _urgentActivities", (uint8_t *)&v11, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  urgentActivities = self->_urgentActivities;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  -[NSMutableDictionary setValue:forKey:](urgentActivities, "setValue:forKey:", v9, v6);

  os_unfair_lock_unlock(&self->_lock);
  v10 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
  objc_msgSend(v10, "setObject:forKey:", self->_urgentActivities, CFSTR("urgentActivities"));

}

- (void)removeActivity:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("UrgencyOverride")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing %@ from _urgentActivities", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_urgentActivities, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);
  v6 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.duetactivityscheduler"));
  objc_msgSend(v6, "setObject:forKey:", self->_urgentActivities, CFSTR("urgentActivities"));

}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 1;
}

- (double)weightForActivity:(id)a3
{
  return 1.0;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v5;
  int64_t v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = -[_DASUrgencyOverridePolicy makeDecisionBasedOnUrgencyOverride:](self, "makeDecisionBasedOnUrgencyOverride:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASUrgencyOverridePolicy rationaleWithUrgencyOverride:](self, "rationaleWithUrgencyOverride:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v6, v7, (double)0x384uLL));
  return v8;
}

- (int64_t)makeDecisionBasedOnUrgencyOverride:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSMutableDictionary *urgentActivities;
  void *v7;
  void *v8;
  int64_t v9;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  urgentActivities = self->_urgentActivities;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](urgentActivities, "valueForKey:", v7));
  os_unfair_lock_unlock(p_lock);
  if (objc_msgSend(v8, "intValue") == 2)
  {
    v9 = 200;
  }
  else if (objc_msgSend(v8, "intValue") == 1)
  {
    v9 = 67;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)rationaleWithUrgencyOverride:(id)a3
{
  id v4;
  _DASPolicyResponseRationale *v5;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *urgentActivities;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Urgency Override Policy"));
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  urgentActivities = self->_urgentActivities;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](urgentActivities, "valueForKey:", v8));
  os_unfair_lock_unlock(p_lock);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("urgencylevel == %@"), v9));
  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v5, "addRationaleForCondition:withRequiredValue:withCurrentValue:", v10, 1.0, 1.0);

  return v5;
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

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)urgentActivities
{
  return self->_urgentActivities;
}

- (void)setUrgentActivities:(id)a3
{
  objc_storeStrong((id *)&self->_urgentActivities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urgentActivities, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
