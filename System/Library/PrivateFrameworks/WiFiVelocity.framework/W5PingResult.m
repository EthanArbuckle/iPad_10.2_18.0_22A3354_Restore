@implementation W5PingResult

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)W5PingResult;
  -[W5PingResult dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  id v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v3, "appendFormat:", CFSTR("Address: %@\n"), self->_address);
  objc_msgSend(v3, "appendFormat:", CFSTR("Interface Name: %@\n"), self->_interfaceName);
  objc_msgSend(v3, "appendFormat:", CFSTR("Count: %ld\n"), self->_count);
  objc_msgSend(v3, "appendFormat:", CFSTR("Timeout: %f\n"), *(_QWORD *)&self->_timeout);
  objc_msgSend(v3, "appendFormat:", CFSTR("Wait: %f\n"), *(_QWORD *)&self->_wait);
  objc_msgSend(v3, "appendFormat:", CFSTR("Interval: %f\n"), *(_QWORD *)&self->_interval);
  objc_msgSend(v3, "appendFormat:", CFSTR("Traffic Class: %@\n"), W5DescriptionForPingTrafficClass(self->_trafficClass));
  objc_msgSend(v3, "appendFormat:", CFSTR("Data Length: %ldb\n"), self->_dataLength + 64);
  objc_msgSend(v3, "appendFormat:", CFSTR("Packet Loss: %.2f%%\n"), *(_QWORD *)&self->_packetLoss);
  objc_msgSend(v3, "appendFormat:", CFSTR("Min: %.2fms\n"), *(_QWORD *)&self->_min);
  objc_msgSend(v3, "appendFormat:", CFSTR("Max: %.2fms\n"), *(_QWORD *)&self->_max);
  objc_msgSend(v3, "appendFormat:", CFSTR("Avg: %.2fms\n"), *(_QWORD *)&self->_avg);
  objc_msgSend(v3, "appendFormat:", CFSTR("Std Dev: %.2fms\n"), *(_QWORD *)&self->_stddev);
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateStyle:", 0);
  objc_msgSend(v4, "setTimeStyle:", 2);
  objc_msgSend(v4, "setLocale:", objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"));
  objc_msgSend(v3, "appendFormat:", CFSTR("StartedAt: %@\n"), objc_msgSend(v4, "stringFromDate:", objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_startedAt)));
  objc_msgSend(v3, "appendFormat:", CFSTR("EndedAt: %@\n"), objc_msgSend(v4, "stringFromDate:", objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_endedAt)));
  return (id)objc_msgSend(v3, "copy");
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)W5PingResult;
  if (-[W5PingResult conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || (objc_msgSend(a3, "isEqual:", &unk_2545B0870) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a3, "isEqual:", &unk_2545B06D8);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  W5PingResult *v4;

  v4 = -[W5PingResult init](+[W5PingResult allocWithZone:](W5PingResult, "allocWithZone:", a3), "init");
  -[W5PingResult setAddress:](v4, "setAddress:", self->_address);
  -[W5PingResult setInterfaceName:](v4, "setInterfaceName:", self->_interfaceName);
  -[W5PingResult setCount:](v4, "setCount:", self->_count);
  -[W5PingResult setTimeout:](v4, "setTimeout:", self->_timeout);
  -[W5PingResult setWait:](v4, "setWait:", self->_wait);
  -[W5PingResult setInterval:](v4, "setInterval:", self->_interval);
  -[W5PingResult setPacketLoss:](v4, "setPacketLoss:", self->_packetLoss);
  -[W5PingResult setMin:](v4, "setMin:", self->_min);
  -[W5PingResult setMax:](v4, "setMax:", self->_max);
  -[W5PingResult setAvg:](v4, "setAvg:", self->_avg);
  -[W5PingResult setStddev:](v4, "setStddev:", self->_stddev);
  -[W5PingResult setStartedAt:](v4, "setStartedAt:", self->_startedAt);
  -[W5PingResult setEndedAt:](v4, "setEndedAt:", self->_endedAt);
  -[W5PingResult setTrafficClass:](v4, "setTrafficClass:", self->_trafficClass);
  -[W5PingResult setDataLength:](v4, "setDataLength:", self->_dataLength);
  -[W5PingResult setCommand:](v4, "setCommand:", self->_command);
  -[W5PingResult setOutput:](v4, "setOutput:", self->_output);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_address, CFSTR("_address"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_interfaceName, CFSTR("_interfaceName"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_count, CFSTR("_count"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_timeout"), self->_timeout);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_wait"), self->_wait);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_interval"), self->_interval);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_packetLoss"), self->_packetLoss);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_min"), self->_min);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_max"), self->_max);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_avg"), self->_avg);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_stddev"), self->_stddev);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_startedAt"), self->_startedAt);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("_endedAt"), self->_endedAt);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_trafficClass, CFSTR("_trafficClass"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_dataLength, CFSTR("_dataLength"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_command, CFSTR("_command"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_output, CFSTR("_output"));
}

- (W5PingResult)initWithCoder:(id)a3
{
  W5PingResult *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)W5PingResult;
  v4 = -[W5PingResult init](&v16, sel_init);
  if (v4)
  {
    v4->_address = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_address")), "copy");
    v4->_interfaceName = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_interfaceName")), "copy");
    v4->_count = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_count"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_timeout"));
    v4->_timeout = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_wait"));
    v4->_wait = v6;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_interval"));
    v4->_interval = v7;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_packetLoss"));
    v4->_packetLoss = v8;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_min"));
    v4->_min = v9;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_max"));
    v4->_max = v10;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_avg"));
    v4->_avg = v11;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_stddev"));
    v4->_stddev = v12;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_startedAt"));
    v4->_startedAt = v13;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("_endedAt"));
    v4->_endedAt = v14;
    v4->_trafficClass = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_trafficClass"));
    v4->_dataLength = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("_dataLength"));
    v4->_command = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_command")), "copy");
    v4->_output = (NSString *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_output")), "copy");
  }
  return v4;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (double)wait
{
  return self->_wait;
}

- (void)setWait:(double)a3
{
  self->_wait = a3;
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (int64_t)trafficClass
{
  return self->_trafficClass;
}

- (void)setTrafficClass:(int64_t)a3
{
  self->_trafficClass = a3;
}

- (unint64_t)dataLength
{
  return self->_dataLength;
}

- (void)setDataLength:(unint64_t)a3
{
  self->_dataLength = a3;
}

- (double)packetLoss
{
  return self->_packetLoss;
}

- (void)setPacketLoss:(double)a3
{
  self->_packetLoss = a3;
}

- (double)min
{
  return self->_min;
}

- (void)setMin:(double)a3
{
  self->_min = a3;
}

- (double)max
{
  return self->_max;
}

- (void)setMax:(double)a3
{
  self->_max = a3;
}

- (double)avg
{
  return self->_avg;
}

- (void)setAvg:(double)a3
{
  self->_avg = a3;
}

- (double)stddev
{
  return self->_stddev;
}

- (void)setStddev:(double)a3
{
  self->_stddev = a3;
}

- (NSString)command
{
  return self->_command;
}

- (void)setCommand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (double)startedAt
{
  return self->_startedAt;
}

- (void)setStartedAt:(double)a3
{
  self->_startedAt = a3;
}

- (double)endedAt
{
  return self->_endedAt;
}

- (void)setEndedAt:(double)a3
{
  self->_endedAt = a3;
}

@end
