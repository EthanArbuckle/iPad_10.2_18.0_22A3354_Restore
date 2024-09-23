@implementation PLDisplayAPLStats

- (NSNumber)avgRed
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAvgRed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)avgGreen
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAvgGreen:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)avgBlue
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAvgBlue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSNumber)frames
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFrames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSNumber)avgPower
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAvgPower:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSNumber)avgAPL
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAvgAPL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avgAPL, 0);
  objc_storeStrong((id *)&self->_avgPower, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_storeStrong((id *)&self->_avgBlue, 0);
  objc_storeStrong((id *)&self->_avgGreen, 0);
  objc_storeStrong((id *)&self->_avgRed, 0);
}

@end
