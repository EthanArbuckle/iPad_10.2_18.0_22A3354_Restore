@implementation _DASViewfinderPolicy

- (NSArray)triggers
{
  return self->_triggers;
}

- (BOOL)appliesToActivity:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "schedulingPriority");
  return (unint64_t)v3 < _DASSchedulingPriorityUserInitiated;
}

- (double)weightForActivity:(id)a3
{
  return 0.01;
}

- (id)initializeTriggers
{
  void *v2;
  void *v3;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;

  v5 = CFSTR("identifier");
  v6 = CFSTR("com.apple.das.viewfinder.statuschanged");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  v7 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  return v3;
}

- (_DASViewfinderPolicy)init
{
  _DASViewfinderPolicy *v2;
  _DASViewfinderPolicy *v3;
  NSString *policyName;
  uint64_t v5;
  NSArray *triggers;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  FigCameraViewfinder *viewFinder;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_DASViewfinderPolicy;
  v2 = -[_DASViewfinderPolicy init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    policyName = v2->_policyName;
    v2->_policyName = (NSString *)CFSTR("Viewfinder Policy");

    v5 = objc_claimAutoreleasedReturnValue(-[_DASViewfinderPolicy initializeTriggers](v3, "initializeTriggers"));
    triggers = v3->_triggers;
    v3->_triggers = (NSArray *)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.dasd.viewfinderpolicy", v8);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[FigCameraViewfinder cameraViewfinder](FigCameraViewfinder, "cameraViewfinder"));
    viewFinder = v3->_viewFinder;
    v3->_viewFinder = (FigCameraViewfinder *)v11;

    -[FigCameraViewfinder setDelegate:queue:](v3->_viewFinder, "setDelegate:queue:", v3, v3->_queue);
    -[FigCameraViewfinder startWithOptions:](v3->_viewFinder, "startWithOptions:", 0);
  }
  return v3;
}

+ (id)policyInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DC65C;
  block[3] = &unk_10015D3A8;
  block[4] = a1;
  if (qword_1001ABEA8 != -1)
    dispatch_once(&qword_1001ABEA8, block);
  return (id)qword_1001ABEB0;
}

- (BOOL)shouldIgnoreTrigger:(id)a3 withState:(id)a4
{
  unsigned int v5;

  v5 = objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.das.viewfinder.statuschanged"), a4);
  if (v5)
    LOBYTE(v5) = self->_viewfinderIsActive;
  return v5;
}

- (id)responseForActivity:(id)a3 withState:(id)a4
{
  uint64_t v4;
  _DASPolicyResponseRationale *v5;
  void *v6;

  if (self->_viewfinderIsActive)
    v4 = 33;
  else
    v4 = 0;
  v5 = -[_DASPolicyResponseRationale initWithPolicyName:]([_DASPolicyResponseRationale alloc], "initWithPolicyName:", CFSTR("Viewfinder Policy"));
  -[_DASPolicyResponseRationale addRationaleForCondition:withRequiredValue:withCurrentValue:](v5, "addRationaleForCondition:withRequiredValue:withCurrentValue:", CFSTR("viewfinderActive"), 0.0, 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASPolicyResponse policyResponseWithDecision:validityDuration:rationale:](_DASPolicyResponse, "policyResponseWithDecision:validityDuration:rationale:", v4, v5, (double)0x384uLL));

  return v6;
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  const __CFString *v8;

  self->_viewfinderIsActive = 1;
  v4 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("viewfinder"), a4));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trigger: /device/system/viewfinderActive is now [1]", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v8 = CFSTR("com.apple.das.viewfinder.statuschanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  objc_msgSend(v5, "handleTriggersBatched:", v6);

}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  const __CFString *v8;

  self->_viewfinderIsActive = 0;
  v4 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("viewfinder"), a4));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trigger: /device/system/viewfinderActive is now [0]", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_DASDaemon sharedInstance](_DASDaemon, "sharedInstance"));
  v8 = CFSTR("com.apple.das.viewfinder.statuschanged");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  objc_msgSend(v5, "handleTriggersBatched:", v6);

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

- (BOOL)viewfinderIsActive
{
  return self->_viewfinderIsActive;
}

- (void)setViewfinderIsActive:(BOOL)a3
{
  self->_viewfinderIsActive = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (FigCameraViewfinder)viewFinder
{
  return self->_viewFinder;
}

- (void)setViewFinder:(id)a3
{
  objc_storeStrong((id *)&self->_viewFinder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewFinder, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_policyDescription, 0);
  objc_storeStrong((id *)&self->_policyName, 0);
}

@end
