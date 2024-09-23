@implementation TransparencyGPBTimestamp

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1002A73C0;
  if (!qword_1002A73C0)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBTimestamp, CFSTR("Timestamp"), off_1002A1838, &off_1002A17F8, 2, 16, v3);
    qword_1002A73C0 = (uint64_t)result;
  }
  return result;
}

- (TransparencyGPBTimestamp)initWithDate:(id)a3
{
  objc_msgSend(a3, "timeIntervalSince1970");
  return -[TransparencyGPBTimestamp initWithTimeIntervalSince1970:](self, "initWithTimeIntervalSince1970:");
}

- (TransparencyGPBTimestamp)initWithTimeIntervalSince1970:(double)a3
{
  TransparencyGPBTimestamp *v4;
  double v5;
  double v6;
  uint64_t v7;
  objc_super v9;
  double __y;

  v9.receiver = self;
  v9.super_class = (Class)TransparencyGPBTimestamp;
  v4 = -[TransparencyGPBMessage init](&v9, "init");
  if (v4)
  {
    __y = 0.0;
    v5 = modf(a3, &__y);
    v6 = __y;
    if (v5 < 0.0)
    {
      v6 = __y + -1.0;
      v5 = v5 + 1.0;
    }
    v7 = (int)(v5 * 1000000000.0);
    -[TransparencyGPBTimestamp setSeconds:](v4, "setSeconds:", (uint64_t)v6);
    -[TransparencyGPBTimestamp setNanos:](v4, "setNanos:", v7);
  }
  return v4;
}

- (NSDate)date
{
  -[TransparencyGPBTimestamp timeIntervalSince1970](self, "timeIntervalSince1970");
  return +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
}

- (void)setDate:(id)a3
{
  objc_msgSend(a3, "timeIntervalSince1970");
  -[TransparencyGPBTimestamp setTimeIntervalSince1970:](self, "setTimeIntervalSince1970:");
}

- (double)timeIntervalSince1970
{
  id v3;

  v3 = -[TransparencyGPBTimestamp seconds](self, "seconds");
  return (double)(int)-[TransparencyGPBTimestamp nanos](self, "nanos") / 1000000000.0 + (double)(uint64_t)v3;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  double v4;
  double v5;
  uint64_t v6;
  double __y;

  __y = 0.0;
  v4 = modf(a3, &__y);
  v5 = __y;
  if (v4 < 0.0)
  {
    v5 = __y + -1.0;
    v4 = v4 + 1.0;
  }
  v6 = (int)(v4 * 1000000000.0);
  -[TransparencyGPBTimestamp setSeconds:](self, "setSeconds:", (uint64_t)v5);
  -[TransparencyGPBTimestamp setNanos:](self, "setNanos:", v6);
}

@end
