@implementation TransparencyGPBDuration

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1001312F0;
  if (!qword_1001312F0)
  {
    LODWORD(v3) = 28;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", TransparencyGPBDuration, CFSTR("Duration"), off_100129B30, &off_100129AF0, 2, 16, v3);
    qword_1001312F0 = (uint64_t)result;
  }
  return result;
}

- (TransparencyGPBDuration)initWithTimeInterval:(double)a3
{
  TransparencyGPBDuration *v4;
  uint64_t v5;
  objc_super v7;
  double __y;

  v7.receiver = self;
  v7.super_class = (Class)TransparencyGPBDuration;
  v4 = -[TransparencyGPBMessage init](&v7, "init");
  if (v4)
  {
    __y = 0.0;
    v5 = (int)(modf(a3, &__y) * 1000000000.0);
    -[TransparencyGPBDuration setSeconds:](v4, "setSeconds:", (uint64_t)__y);
    -[TransparencyGPBDuration setNanos:](v4, "setNanos:", v5);
  }
  return v4;
}

- (TransparencyGPBDuration)initWithTimeIntervalSince1970:(double)a3
{
  return -[TransparencyGPBDuration initWithTimeInterval:](self, "initWithTimeInterval:", a3);
}

- (double)timeInterval
{
  id v3;

  v3 = -[TransparencyGPBDuration seconds](self, "seconds");
  return (double)(int)-[TransparencyGPBDuration nanos](self, "nanos") / 1000000000.0 + (double)(uint64_t)v3;
}

- (void)setTimeInterval:(double)a3
{
  uint64_t v4;
  double __y;

  __y = 0.0;
  v4 = (int)(modf(a3, &__y) * 1000000000.0);
  -[TransparencyGPBDuration setSeconds:](self, "setSeconds:", (uint64_t)__y);
  -[TransparencyGPBDuration setNanos:](self, "setNanos:", v4);
}

- (double)timeIntervalSince1970
{
  double result;

  -[TransparencyGPBDuration timeInterval](self, "timeInterval");
  return result;
}

- (void)setTimeIntervalSince1970:(double)a3
{
  -[TransparencyGPBDuration setTimeInterval:](self, "setTimeInterval:", a3);
}

@end
