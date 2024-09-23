@implementation CLDurianMaintenanceMetrics

- (CLDurianMaintenanceMetrics)init
{
  CLDurianMaintenanceMetrics *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CLDurianMaintenanceMetrics;
  v2 = -[CLDurianMaintenanceMetrics init](&v4, "init");
  if (v2)
  {
    v2->_groupMaintDeltas = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_maintainedReasonCountDictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->_maintainedCategoryCountDictionary = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLDurianMaintenanceMetrics;
  -[CLDurianMaintenanceMetrics dealloc](&v3, "dealloc");
}

- (void)resetWithTime:(double)a3
{
  self->_referenceTime = a3;
  *(_QWORD *)&self->_devices = 0;
  self->_neededDiscovery = 0;
  self->_coex = 0;
  self->_timeBetweenTriggers = 0.0;
  self->_duration = 0.0;
  -[CLDurianMaintenanceMetrics setForceReason:](self, "setForceReason:", CFSTR("none"));
  -[CLDurianMaintenanceMetrics setLoiType:](self, "setLoiType:", CFSTR("none"));
  -[NSMutableDictionary removeAllObjects](self->_groupMaintDeltas, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_maintainedReasonCountDictionary, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_maintainedCategoryCountDictionary, "removeAllObjects");
}

- (NSDictionary)maintainedReasonCountDictionary
{
  return (NSDictionary *)-[NSMutableDictionary copy](self->_maintainedReasonCountDictionary, "copy");
}

- (NSDictionary)maintainedCategoryCountDictionary
{
  return (NSDictionary *)-[NSMutableDictionary copy](self->_maintainedCategoryCountDictionary, "copy");
}

- (void)startNewMaintEventWithCount:(int)a3 leashable:(int)a4 deviceTypes:(id)a5 coex:(int)a6 loiType:(id)a7
{
  CFAbsoluteTime v10;

  self->_devices = a3;
  self->_leashable = a4;
  -[CLDurianMaintenanceMetrics setDeviceTypes:](self, "setDeviceTypes:", a5);
  if (self->_referenceTime == 0.0)
    v10 = -1.0;
  else
    v10 = CFAbsoluteTimeGetCurrent() - self->_referenceTime;
  self->_timeBetweenTriggers = v10;
  self->_referenceTime = CFAbsoluteTimeGetCurrent();
  self->_coex = a6;
  -[CLDurianMaintenanceMetrics setLoiType:](self, "setLoiType:", a7);
}

- (void)accumulateMaintainedReasonCountWithReason:(id)a3 andCategory:(unint64_t)a4
{
  NSNumber *v7;
  NSMutableDictionary *maintainedReasonCountDictionary;
  NSNumber *v9;
  NSMutableDictionary *maintainedCategoryCountDictionary;
  NSNumber *v11;
  NSMutableDictionary *v12;
  NSNumber *v13;
  NSMutableDictionary *v14;

  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_maintainedReasonCountDictionary, "objectForKeyedSubscript:"))
  {
    v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_maintainedReasonCountDictionary, "objectForKeyedSubscript:", a3), "intValue")+ 1);
    maintainedReasonCountDictionary = self->_maintainedReasonCountDictionary;
  }
  else
  {
    maintainedReasonCountDictionary = self->_maintainedReasonCountDictionary;
    v7 = (NSNumber *)&off_10221DE98;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](maintainedReasonCountDictionary, "setObject:forKeyedSubscript:", v7, a3);
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_maintainedCategoryCountDictionary, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4)))
  {
    v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(-[NSMutableDictionary objectForKeyedSubscript:](self->_maintainedCategoryCountDictionary, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4)), "intValue")+ 1);
    maintainedCategoryCountDictionary = self->_maintainedCategoryCountDictionary;
    v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4);
    v12 = maintainedCategoryCountDictionary;
    v13 = v9;
  }
  else
  {
    v14 = self->_maintainedCategoryCountDictionary;
    v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4);
    v13 = (NSNumber *)&off_10221DE98;
    v12 = v14;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v13, v11);
}

- (void)setGroupMaintDelta:(int)a3 forUUID:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_groupMaintDeltas, "setObject:forKeyedSubscript:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(_QWORD *)&a3), a4);
}

- (double)referenceTime
{
  return self->_referenceTime;
}

- (void)setReferenceTime:(double)a3
{
  self->_referenceTime = a3;
}

- (double)timeBetweenTriggers
{
  return self->_timeBetweenTriggers;
}

- (void)setTimeBetweenTriggers:(double)a3
{
  self->_timeBetweenTriggers = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)assertionDuration
{
  return self->_assertionDuration;
}

- (void)setAssertionDuration:(double)a3
{
  self->_assertionDuration = a3;
}

- (BOOL)neededDiscovery
{
  return self->_neededDiscovery;
}

- (void)setNeededDiscovery:(BOOL)a3
{
  self->_neededDiscovery = a3;
}

- (int)coex
{
  return self->_coex;
}

- (void)setCoex:(int)a3
{
  self->_coex = a3;
}

- (int)devices
{
  return self->_devices;
}

- (void)setDevices:(int)a3
{
  self->_devices = a3;
}

- (int)leashable
{
  return self->_leashable;
}

- (void)setLeashable:(int)a3
{
  self->_leashable = a3;
}

- (NSString)deviceTypes
{
  return self->_deviceTypes;
}

- (void)setDeviceTypes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSString)forceReason
{
  return self->_forceReason;
}

- (void)setForceReason:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSString)loiType
{
  return self->_loiType;
}

- (void)setLoiType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (NSDictionary)groupMaintDeltas
{
  return &self->_groupMaintDeltas->super;
}

@end
