@implementation SPSchedulerInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SPSchedulerInformation advertisementCount](self, "advertisementCount"), CFSTR("advertisementCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SPSchedulerInformation priorityCount](self, "priorityCount"), CFSTR("priorityCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[SPSchedulerInformation lowBatteryCount](self, "lowBatteryCount"), CFSTR("lowBatteryCount"));

}

- (SPSchedulerInformation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  -[SPSchedulerInformation setAdvertisementCount:](self, "setAdvertisementCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("advertisementCount")));
  -[SPSchedulerInformation setPriorityCount:](self, "setPriorityCount:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priorityCount")));
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lowBatteryCount"));

  -[SPSchedulerInformation setLowBatteryCount:](self, "setLowBatteryCount:", v5);
  return self;
}

- (int64_t)advertisementCount
{
  return self->_advertisementCount;
}

- (void)setAdvertisementCount:(int64_t)a3
{
  self->_advertisementCount = a3;
}

- (int64_t)priorityCount
{
  return self->_priorityCount;
}

- (void)setPriorityCount:(int64_t)a3
{
  self->_priorityCount = a3;
}

- (int64_t)lowBatteryCount
{
  return self->_lowBatteryCount;
}

- (void)setLowBatteryCount:(int64_t)a3
{
  self->_lowBatteryCount = a3;
}

@end
