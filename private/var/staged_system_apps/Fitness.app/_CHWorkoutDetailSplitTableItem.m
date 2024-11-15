@implementation _CHWorkoutDetailSplitTableItem

- (int64_t)splitIndex
{
  return self->_splitIndex;
}

- (void)setSplitIndex:(int64_t)a3
{
  self->_splitIndex = a3;
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (double)expectedSplitDistance
{
  return self->_expectedSplitDistance;
}

- (void)setExpectedSplitDistance:(double)a3
{
  self->_expectedSplitDistance = a3;
}

- (FIUIWorkoutSplit)split
{
  return self->_split;
}

- (void)setSplit:(id)a3
{
  objc_storeStrong((id *)&self->_split, a3);
}

- (CHWorkoutSwimmingSplit)swimmingSplit
{
  return self->_swimmingSplit;
}

- (void)setSwimmingSplit:(id)a3
{
  objc_storeStrong((id *)&self->_swimmingSplit, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swimmingSplit, 0);
  objc_storeStrong((id *)&self->_split, 0);
  objc_storeStrong((id *)&self->_unit, 0);
}

@end
