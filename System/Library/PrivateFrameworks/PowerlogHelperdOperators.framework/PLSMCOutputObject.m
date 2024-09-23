@implementation PLSMCOutputObject

+ (id)objectWithChannelValue:(double)a3 cycleCount:(unsigned int)a4 variant:(unsigned __int8)a5
{
  uint64_t v5;
  uint64_t v6;
  PLSMCOutputObject *v8;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v8 = objc_alloc_init(PLSMCOutputObject);
  -[PLSMCOutputObject setChannelValue:](v8, "setChannelValue:", a3);
  -[PLSMCOutputObject setCycleCount:](v8, "setCycleCount:", v6);
  -[PLSMCOutputObject setVariant:](v8, "setVariant:", v5);
  return v8;
}

- (double)channelValue
{
  return self->_channelValue;
}

- (void)setChannelValue:(double)a3
{
  self->_channelValue = a3;
}

- (unsigned)cycleCount
{
  return self->_cycleCount;
}

- (void)setCycleCount:(unsigned int)a3
{
  self->_cycleCount = a3;
}

- (unsigned)variant
{
  return self->_variant;
}

- (void)setVariant:(unsigned __int8)a3
{
  self->_variant = a3;
}

@end
