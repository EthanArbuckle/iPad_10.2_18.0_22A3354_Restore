@implementation SDPowerChargingStatusNotifier

- (SDPowerChargingStatusNotifier)init
{
  SDPowerChargingStatusNotifier *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *internalQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDPowerChargingStatusNotifier;
  v2 = -[SDPowerChargingStatusNotifier init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("com.apple.sharing.powerStatusNotifier", v4);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

+ (id)sharedNotifier
{
  if (qword_1007C6B50 != -1)
    dispatch_once(&qword_1007C6B50, &stru_1007192F0);
  return (id)qword_1007C6B48;
}

- (void)notifyBatteryStatus
{
  dispatch_sync((dispatch_queue_t)self->_internalQueue, &stru_100719310);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
