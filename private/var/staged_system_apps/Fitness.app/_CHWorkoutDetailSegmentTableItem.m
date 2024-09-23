@implementation _CHWorkoutDetailSegmentTableItem

- (int64_t)segmentIndex
{
  return self->_segmentIndex;
}

- (void)setSegmentIndex:(int64_t)a3
{
  self->_segmentIndex = a3;
}

- (CHWorkoutSegment)segment
{
  return self->_segment;
}

- (void)setSegment:(id)a3
{
  objc_storeStrong((id *)&self->_segment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segment, 0);
}

@end
