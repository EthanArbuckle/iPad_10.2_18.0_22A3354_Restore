@implementation _CHWorkoutDetailPowerTableItem

- (NSArray)powerSamples
{
  return self->_powerSamples;
}

- (void)setPowerSamples:(id)a3
{
  objc_storeStrong((id *)&self->_powerSamples, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerSamples, 0);
}

@end
