@implementation _DASMemoryPressurePolicy

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;
  id v4;
  unsigned int v5;

  v3 = a3;
  v4 = objc_msgSend(v3, "schedulingPriority");
  if ((unint64_t)v4 >= _DASSchedulingPriorityUserInitiated)
    LOBYTE(v5) = 0;
  else
    v5 = objc_msgSend(v3, "triggersRestart") ^ 1;

  return v5;
}

- (double)weightForActivity:(id)a3
{
  return 5.0;
}

- (int64_t)systemMemoryPressure
{
  size_t v3;
  int64_t v4;

  v4 = 1;
  v3 = 8;
  sysctlbyname("kern.memorystatus_vm_pressure_level", &v4, &v3, 0, 0);
  return v4;
}

- (_DASMemoryPressurePolicy)init
{
  _DASMemoryPressurePolicy *v2;
  _DASMemoryPressurePolicy *v3;
  NSString *policyName;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  dispatch_source_t v9;
  OS_dispatch_source *timer;
  NSObject *v11;
  _QWORD handler[4];
  _DASMemoryPressurePolicy *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_DASMemoryPressurePolicy;
  v2 = -[_DASMemoryPressurePolicy init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Memory Pressure Policy");

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.dasd.memoryPressure", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)v3->_queue);
    timer = v3->_timer;
    v3->_timer = (OS_dispatch_source *)v9;

    dispatch_set_qos_class_fallback(v3->_timer, 17);
    dispatch_source_set_timer((dispatch_source_t)v3->_timer, 0, 0x37E11D600uLL, 0x3B9ACA00uLL);
    v11 = v3->_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000175C4;
    handler[3] = &unk_10015D4E0;
    v14 = v3;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_activate((dispatch_object_t)v3->_timer);

  }
  return v3;
}

+ (id)policyInstance
{
  if (qword_1001AB808 != -1)
    dispatch_once(&qword_1001AB808, &stru_10015E4E0);
  return (id)qword_1001AB810;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  return 0;
}

- (int64_t)memoryPressureLevelWithContext:(id)a3
{
  return self->_currentMemoryPressure;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _DASPolicyResponseRationale *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  unsigned int v14;
  unsigned __int8 v15;
  id v16;
  double v17;
  double v18;
  uint64_t v19;
  id v20;
  double v21;
  double v22;
  unsigned int v23;
  uint64_t v24;
  id v25;
  void *v26;

  v6 = a3;
  v7 = a4;
  v8 = -[_DASMemoryPressurePolicy memoryPressureLevelWithContext:](self, "memoryPressureLevelWithContext:", v7);
  v9 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Memory Pressure Policy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startBefore"));
  objc_msgSend(v11, "timeIntervalSinceDate:", v10);
  v13 = v12;

  if (v13 < 0.0)
  {
    v14 = +[_DASSystemContext isPluggedIn:](_DASSystemContext, "isPluggedIn:", v7);
    v15 = +[_DASDeviceActivityPolicy isDeviceInUse:](_DASDeviceActivityPolicy, "isDeviceInUse:", v7);
    if (v14)
    {
      if ((v15 & 1) == 0)
      {
        v16 = objc_msgSend(v6, "schedulingPriority");
        v17 = 2.0;
        if ((unint64_t)v16 > _DASSchedulingPriorityBackground)
          v17 = 4.0;
        -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v9, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("memoryPressure"), v17, (double)v8);
        if ((v8 & 4) == 0
          || (v25 = objc_msgSend(v6, "schedulingPriority"), (unint64_t)v25 > _DASSchedulingPriorityBackground)
          || v13 <= -86400.0)
        {
          v18 = (double)0x384uLL;
          v19 = 0;
LABEL_21:
          v24 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v19, v9, v18));
          goto LABEL_22;
        }
LABEL_20:
        v18 = (double)0x384uLL;
        v19 = 33;
        goto LABEL_21;
      }
    }
  }
  v20 = objc_msgSend(v6, "schedulingPriority");
  v21 = (double)v8;
  if ((unint64_t)v20 <= _DASSchedulingPriorityBackground)
  {
    v22 = 1.0;
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v9, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("memoryPressure"), 1.0, v21);
    v23 = !+[_DASDeviceActivityPolicy isDeviceInUse:](_DASDeviceActivityPolicy, "isDeviceInUse:", v7);
    if ((v8 & 2) == 0)
      v23 = 1;
    if (v23 != 1 || (v8 & 4) != 0)
      goto LABEL_20;
  }
  else
  {
    -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v9, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("memoryPressure"), 2.0, v21);
    if ((v8 & 4) != 0)
      goto LABEL_20;
    if (v8 <= 1)
      v22 = 1.0;
    else
      v22 = 0.5;
  }
  v24 = objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithScore:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithScore:validityDuration:rationale:", v9, v22, (double)0x384uLL));
LABEL_22:
  v26 = (void *)v24;

  return v26;
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

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)currentMemoryPressure
{
  return self->_currentMemoryPressure;
}

- (void)setCurrentMemoryPressure:(int64_t)a3
{
  self->_currentMemoryPressure = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
