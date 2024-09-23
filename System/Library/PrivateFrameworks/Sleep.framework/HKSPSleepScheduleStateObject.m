@implementation HKSPSleepScheduleStateObject

- (HKSPSleepScheduleStateObject)initWithScheduleState:(unint64_t)a3 changeReason:(unint64_t)a4 syncAnchor:(id)a5
{
  id v8;
  HKSPSleepScheduleStateObject *v9;
  HKSPSleepScheduleStateObject *v10;
  uint64_t v11;
  HKSPSyncAnchor *syncAnchor;
  HKSPSleepScheduleStateObject *v13;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKSPSleepScheduleStateObject;
  v9 = -[HKSPSleepScheduleStateObject init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_scheduleState = a3;
    v9->_changeReason = a4;
    v11 = objc_msgSend(v8, "copyWithZone:", 0);
    syncAnchor = v10->_syncAnchor;
    v10->_syncAnchor = (HKSPSyncAnchor *)v11;

    v13 = v10;
  }

  return v10;
}

- (HKSPSleepScheduleStateObject)objectWithSyncAnchor:(id)a3
{
  return (HKSPSleepScheduleStateObject *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithScheduleState:changeReason:syncAnchor:", self->_scheduleState, self->_changeReason, self->_syncAnchor);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t scheduleState;
  id v5;

  scheduleState = self->_scheduleState;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", scheduleState, CFSTR("state"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changeReason, CFSTR("changeReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_syncAnchor, CFSTR("syncAnchor"));

}

- (HKSPSleepScheduleStateObject)initWithCoder:(id)a3
{
  id v4;
  HKSPSleepScheduleStateObject *v5;
  uint64_t v6;
  HKSPSyncAnchor *syncAnchor;
  HKSPSleepScheduleStateObject *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSPSleepScheduleStateObject;
  v5 = -[HKSPSleepScheduleStateObject init](&v10, sel_init);
  if (v5)
  {
    v5->_scheduleState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v5->_changeReason = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("changeReason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", HKSPSyncAnchorClass(), CFSTR("syncAnchor"));
    v6 = objc_claimAutoreleasedReturnValue();
    syncAnchor = v5->_syncAnchor;
    v5->_syncAnchor = (HKSPSyncAnchor *)v6;

    v8 = v5;
  }

  return v5;
}

- (HKSPSyncAnchor)syncAnchor
{
  return self->_syncAnchor;
}

- (unint64_t)scheduleState
{
  return self->_scheduleState;
}

- (unint64_t)changeReason
{
  return self->_changeReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncAnchor, 0);
}

@end
