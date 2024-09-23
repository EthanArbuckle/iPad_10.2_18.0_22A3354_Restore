@implementation _CHWorkoutDetailDownhillRunTableItem

- (int64_t)downhillRunIndex
{
  return self->_downhillRunIndex;
}

- (void)setDownhillRunIndex:(int64_t)a3
{
  self->_downhillRunIndex = a3;
}

- (CHWorkoutDownhillRun)downhillRun
{
  return self->_downhillRun;
}

- (void)setDownhillRun:(id)a3
{
  objc_storeStrong((id *)&self->_downhillRun, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downhillRun, 0);
}

@end
