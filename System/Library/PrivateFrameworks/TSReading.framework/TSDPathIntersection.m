@implementation TSDPathIntersection

- (TSDPathIntersection)initWithSegment:(int64_t)a3 atT:(double)a4 atPoint:(CGPoint)a5
{
  return -[TSDPathIntersection initWithSegment:atT:onSegmentB:atT:atPoint:](self, "initWithSegment:atT:onSegmentB:atT:atPoint:", a3, 0, a4, 0.0, a5.x, a5.y);
}

- (TSDPathIntersection)initWithSegment:(int64_t)a3 atT:(double)a4 onSegmentB:(int64_t)a5 atT:(double)a6 atPoint:(CGPoint)a7
{
  CGFloat y;
  CGFloat x;
  TSDPathIntersection *result;
  objc_super v14;

  y = a7.y;
  x = a7.x;
  v14.receiver = self;
  v14.super_class = (Class)TSDPathIntersection;
  result = -[TSDPathIntersection init](&v14, sel_init);
  if (result)
  {
    result->mPoint.x = x;
    result->mPoint.y = y;
    result->mSegment = a3;
    result->mSegmentB = a5;
    result->mT = a4;
    result->mTB = a6;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(A:(%ld, %.2f) B:(%ld, %.2f) @:(%.2f, %.2f))"), self->mSegment, *(_QWORD *)&self->mT, self->mSegmentB, *(_QWORD *)&self->mTB, *(_QWORD *)&self->mPoint.x, *(_QWORD *)&self->mPoint.y);
}

- (int64_t)compareSegmentAndT:(id)a3
{
  int64_t v5;
  uint64_t v6;

  v5 = -[TSDPathIntersection segment](self, "segment");
  v6 = objc_msgSend(a3, "segment");
  if (v5 < v6)
    return -1;
  if (v5 <= v6)
    return -[TSDPathIntersection compareT:](self, "compareT:", a3);
  return 1;
}

- (int64_t)compareT:(id)a3
{
  double v4;
  double v5;
  double v6;

  -[TSDPathIntersection t](self, "t");
  v5 = v4;
  objc_msgSend(a3, "t");
  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (int64_t)segment
{
  return self->mSegment;
}

- (double)t
{
  return self->mT;
}

- (CGPoint)point
{
  double x;
  double y;
  CGPoint result;

  x = self->mPoint.x;
  y = self->mPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPoint:(CGPoint)a3
{
  self->mPoint = a3;
}

- (int64_t)segmentB
{
  return self->mSegmentB;
}

- (double)tB
{
  return self->mTB;
}

@end
