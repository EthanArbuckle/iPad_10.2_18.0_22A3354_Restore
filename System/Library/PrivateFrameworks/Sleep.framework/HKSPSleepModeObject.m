@implementation HKSPSleepModeObject

- (HKSPSleepModeObject)initWithSleepMode:(int64_t)a3 changeReason:(unint64_t)a4 syncAnchor:(id)a5
{
  id v8;
  HKSPSleepModeObject *v9;
  HKSPSleepModeObject *v10;
  uint64_t v11;
  HKSPSyncAnchor *syncAnchor;
  HKSPSleepModeObject *v13;
  objc_super v15;

  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKSPSleepModeObject;
  v9 = -[HKSPSleepModeObject init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_sleepMode = a3;
    v9->_changeReason = a4;
    v11 = objc_msgSend(v8, "copyWithZone:", 0);
    syncAnchor = v10->_syncAnchor;
    v10->_syncAnchor = (HKSPSyncAnchor *)v11;

    v13 = v10;
  }

  return v10;
}

- (HKSPSleepModeObject)objectWithSyncAnchor:(id)a3
{
  return (HKSPSleepModeObject *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSleepMode:changeReason:syncAnchor:", self->_sleepMode, self->_changeReason, self->_syncAnchor);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sleepMode;
  id v5;

  sleepMode = self->_sleepMode;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", sleepMode, CFSTR("sleepMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changeReason, CFSTR("changeReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_syncAnchor, CFSTR("syncAnchor"));

}

- (HKSPSleepModeObject)initWithCoder:(id)a3
{
  id v4;
  HKSPSleepModeObject *v5;
  uint64_t v6;
  HKSPSyncAnchor *syncAnchor;
  HKSPSleepModeObject *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKSPSleepModeObject;
  v5 = -[HKSPSleepModeObject init](&v10, sel_init);
  if (v5)
  {
    v5->_sleepMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("sleepMode"));
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

- (int64_t)sleepMode
{
  return self->_sleepMode;
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
