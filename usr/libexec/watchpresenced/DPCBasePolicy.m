@implementation DPCBasePolicy

- (DPCBasePolicy)init
{
  DPCBasePolicy *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DPCBasePolicy;
  v2 = -[DPCBasePolicy init](&v11, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INTERACTIVE, 0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("com.apple.watchpresenced.fireQueue", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[DPCTelemetry sharedInstance](DPCTelemetry, "sharedInstance"));
    -[DPCBasePolicy setTelemetry:](v2, "setTelemetry:", v9);

  }
  return v2;
}

- (void)invalidateAbsenceEvent
{
  id absenceEventBlock;
  id v4;

  absenceEventBlock = self->_absenceEventBlock;
  if (absenceEventBlock)
  {
    dispatch_block_cancel(absenceEventBlock);
    v4 = self->_absenceEventBlock;
    self->_absenceEventBlock = 0;

  }
}

- (void)scheduleSendAbsenceEvent
{
  id v3;
  NSObject *v4;
  dispatch_block_t v5;
  id absenceEventBlock;
  void *v7;
  void *v8;
  float v9;
  dispatch_time_t v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  DPCBasePolicy *v15;
  id v16;
  id buf[2];

  -[DPCBasePolicy invalidateAbsenceEvent](self, "invalidateAbsenceEvent");
  v3 = sub_100002F3C((uint64_t)off_100012CB8);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Kicking off Absence Event timer.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_100001A28;
  v14 = &unk_10000C4E8;
  objc_copyWeak(&v16, buf);
  v15 = self;
  v5 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v11);
  absenceEventBlock = self->_absenceEventBlock;
  self->_absenceEventBlock = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DPCDefaults sharedInstance](DPCDefaults, "sharedInstance", v11, v12, v13, v14));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "NSNumberForDefault:", CFSTR("DPCDefaultsHoldOffSec")));
  objc_msgSend(v8, "floatValue");
  v10 = dispatch_time(0, (uint64_t)(float)(v9 * 1000000000.0) + 1);
  dispatch_after(v10, (dispatch_queue_t)self->_queue, self->_absenceEventBlock);

  objc_destroyWeak(&v16);
  objc_destroyWeak(buf);
}

- (unint64_t)onRSSIChange:(id)a3
{
  return 0;
}

- (id)detectedNewEventBlock
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setDetectedNewEventBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (id)detectedNewErrorBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setDetectedNewErrorBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)detectedNewWatchStatusEventBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setDetectedNewWatchStatusEventBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (BOOL)requireRSSI
{
  return self->_requireRSSI;
}

- (void)setRequireRSSI:(BOOL)a3
{
  self->_requireRSSI = a3;
}

- (DPCStateMachine)stateMachine
{
  return (DPCStateMachine *)objc_loadWeakRetained((id *)&self->_stateMachine);
}

- (void)setStateMachine:(id)a3
{
  objc_storeWeak((id *)&self->_stateMachine, a3);
}

- (DPCTelemetry)telemetry
{
  return (DPCTelemetry *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTelemetry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telemetry, 0);
  objc_destroyWeak((id *)&self->_stateMachine);
  objc_storeStrong(&self->_detectedNewWatchStatusEventBlock, 0);
  objc_storeStrong(&self->_detectedNewErrorBlock, 0);
  objc_storeStrong(&self->_detectedNewEventBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_absenceEventBlock, 0);
}

@end
