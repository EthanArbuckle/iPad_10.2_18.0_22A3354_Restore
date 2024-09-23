@implementation SUManagedDeviceUpdateDelay

- (SUManagedDeviceUpdateDelay)initWithDelay:(id)a3
{
  id v4;
  SUManagedDeviceUpdateDelay *v5;
  SUManagedDeviceUpdateDelay *v6;
  void *v7;
  uint64_t v8;
  NSDate *delayedStartDate;
  uint64_t v10;
  NSDate *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUManagedDeviceUpdateDelay;
  v5 = -[SUManagedDeviceUpdateDelay init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v5->_isDelayed = objc_msgSend(v4, "isDelayed");
      objc_msgSend(v4, "delayedStartDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      delayedStartDate = v6->_delayedStartDate;
      v6->_delayedStartDate = (NSDate *)v8;

      v10 = objc_msgSend(v4, "delayPeriod");
    }
    else
    {
      v5->_isDelayed = 0;
      v11 = v5->_delayedStartDate;
      v5->_delayedStartDate = 0;

      v10 = 0;
    }
    v6->_delayPeriod = v10;
  }

  return v6;
}

- (id)delayEndDate
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t delayPeriod;
  uint64_t v12;

  v3 = -[SUManagedDeviceUpdateDelay delayUnit](self, "delayUnit");
  delayPeriod = self->_delayPeriod;
  if (delayPeriod - 1 > 0x59)
  {
    v12 = 30 * v3;
    SULogInfo(CFSTR("delay interval is outside 1-90 day range. Defaulting to %d day delay interval"), v4, v5, v6, v7, v8, v9, v10, 30);
  }
  else
  {
    v12 = -[SUManagedDeviceUpdateDelay delayUnit](self, "delayUnit") * delayPeriod;
  }
  return -[NSDate dateByAddingTimeInterval:](self->_delayedStartDate, "dateByAddingTimeInterval:", (double)(unint64_t)v12);
}

- (id)description
{
  void *v2;
  _BOOL8 isDelayed;
  NSDate *delayedStartDate;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  isDelayed = self->_isDelayed;
  delayedStartDate = self->_delayedStartDate;
  -[SUManagedDeviceUpdateDelay delayEndDate](self, "delayEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("isDelayed:%d delayedStartDate: %@ delayedEndDate: %@"), isDelayed, delayedStartDate, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)delayUnit
{
  void *v2;
  int v3;

  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDelayInMinutes");

  if (v3)
    return 60;
  else
    return 86400;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUManagedDeviceUpdateDelay)initWithCoder:(id)a3
{
  id v4;
  SUManagedDeviceUpdateDelay *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SUManagedDeviceUpdateDelay;
  v5 = -[SUManagedDeviceUpdateDelay init](&v8, sel_init);
  if (v5)
  {
    -[SUManagedDeviceUpdateDelay setIsDelayed:](v5, "setIsDelayed:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isDelayedKey")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("delayedStartDateKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagedDeviceUpdateDelay setDelayedStartDate:](v5, "setDelayedStartDate:", v6);

    -[SUManagedDeviceUpdateDelay setDelayPeriod:](v5, "setDelayPeriod:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("delayedPeriod")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", -[SUManagedDeviceUpdateDelay isDelayed](self, "isDelayed"), CFSTR("isDelayedKey"));
  -[SUManagedDeviceUpdateDelay delayedStartDate](self, "delayedStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("delayedStartDateKey"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[SUManagedDeviceUpdateDelay delayPeriod](self, "delayPeriod"), CFSTR("delayedPeriod"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SUManagedDeviceUpdateDelay *v11;
  void *v12;
  SUManagedDeviceUpdateDelay *v13;
  uint64_t v15;

  v11 = objc_alloc_init(SUManagedDeviceUpdateDelay);
  if (v11)
  {
    -[SUManagedDeviceUpdateDelay setIsDelayed:](v11, "setIsDelayed:", -[SUManagedDeviceUpdateDelay isDelayed](self, "isDelayed"));
    -[SUManagedDeviceUpdateDelay delayedStartDate](self, "delayedStartDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUManagedDeviceUpdateDelay setDelayedStartDate:](v11, "setDelayedStartDate:", v12);

    -[SUManagedDeviceUpdateDelay setDelayPeriod:](v11, "setDelayPeriod:", -[SUManagedDeviceUpdateDelay delayPeriod](self, "delayPeriod"));
    v13 = v11;
  }
  else
  {
    SULogInfo(CFSTR("Failed to create copy of SUManagedDeviceUpdateDelay"), v4, v5, v6, v7, v8, v9, v10, v15);
  }

  return v11;
}

- (BOOL)isDelayed
{
  return self->_isDelayed;
}

- (void)setIsDelayed:(BOOL)a3
{
  self->_isDelayed = a3;
}

- (NSDate)delayedStartDate
{
  return self->_delayedStartDate;
}

- (void)setDelayedStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_delayedStartDate, a3);
}

- (unint64_t)delayPeriod
{
  return self->_delayPeriod;
}

- (void)setDelayPeriod:(unint64_t)a3
{
  self->_delayPeriod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedStartDate, 0);
}

@end
