@implementation PLDisplayAZLStats

- (NSNumber)AvgPower
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAvgPower:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)azlAccum
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAzlAccum:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)nitsAccum
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setNitsAccum:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)blUpdateCount
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBlUpdateCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)blFrameCount
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBlFrameCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blFrameCount, 0);
  objc_storeStrong((id *)&self->_blUpdateCount, 0);
  objc_storeStrong((id *)&self->_nitsAccum, 0);
  objc_storeStrong((id *)&self->_azlAccum, 0);
  objc_storeStrong((id *)&self->_AvgPower, 0);
}

@end
