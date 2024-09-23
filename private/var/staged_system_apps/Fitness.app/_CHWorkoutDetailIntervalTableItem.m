@implementation _CHWorkoutDetailIntervalTableItem

- (int64_t)intervalIndex
{
  return self->_intervalIndex;
}

- (void)setIntervalIndex:(int64_t)a3
{
  self->_intervalIndex = a3;
}

- (CHWorkoutInterval)interval
{
  return self->_interval;
}

- (void)setInterval:(id)a3
{
  objc_storeStrong((id *)&self->_interval, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interval, 0);
}

@end
