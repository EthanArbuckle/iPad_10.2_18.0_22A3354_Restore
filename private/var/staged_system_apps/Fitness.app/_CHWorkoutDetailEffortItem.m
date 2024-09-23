@implementation _CHWorkoutDetailEffortItem

- (HKQuantity)effortQuantity
{
  return self->_effortQuantity;
}

- (void)setEffortQuantity:(id)a3
{
  objc_storeStrong((id *)&self->_effortQuantity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effortQuantity, 0);
}

@end
