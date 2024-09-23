@implementation _HKSHLocalizedSleepSchedule

- (_HKSHLocalizedSleepSchedule)initWithSleepSchedule:(id)a3 calendar:(id)a4 dayStart:(id)a5 timeFont:(id)a6 amPmFont:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _HKSHLocalizedSleepSchedule *v17;
  void *v18;
  uint64_t v19;
  NSAttributedString *localizedBedTime;
  void *v21;
  uint64_t v22;
  NSAttributedString *localizedWakeTime;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)_HKSHLocalizedSleepSchedule;
  v17 = -[_HKSHLocalizedSleepSchedule init](&v25, sel_init);
  if (v17)
  {
    objc_msgSend(v12, "bedTimeComponents");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    HKSHLocalizedTimeForComponents((uint64_t)v18, v13, (uint64_t)v14, v15, v16);
    v19 = objc_claimAutoreleasedReturnValue();
    localizedBedTime = v17->_localizedBedTime;
    v17->_localizedBedTime = (NSAttributedString *)v19;

    objc_msgSend(v12, "wakeTimeComponents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HKSHLocalizedTimeForComponents((uint64_t)v21, v13, (uint64_t)v14, v15, v16);
    v22 = objc_claimAutoreleasedReturnValue();
    localizedWakeTime = v17->_localizedWakeTime;
    v17->_localizedWakeTime = (NSAttributedString *)v22;

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  _HKSHLocalizedSleepSchedule *v4;
  _HKSHLocalizedSleepSchedule *v5;
  _HKSHLocalizedSleepSchedule *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (_HKSHLocalizedSleepSchedule *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[_HKSHLocalizedSleepSchedule localizedBedTime](self, "localizedBedTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKSHLocalizedSleepSchedule localizedBedTime](v6, "localizedBedTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToAttributedString:", v8))
    {
      -[_HKSHLocalizedSleepSchedule localizedWakeTime](self, "localizedWakeTime");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_HKSHLocalizedSleepSchedule localizedWakeTime](v6, "localizedWakeTime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToAttributedString:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[_HKSHLocalizedSleepSchedule localizedBedTime](self, "localizedBedTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[_HKSHLocalizedSleepSchedule localizedWakeTime](self, "localizedWakeTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSAttributedString)localizedBedTime
{
  return self->_localizedBedTime;
}

- (NSAttributedString)localizedWakeTime
{
  return self->_localizedWakeTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedWakeTime, 0);
  objc_storeStrong((id *)&self->_localizedBedTime, 0);
}

@end
