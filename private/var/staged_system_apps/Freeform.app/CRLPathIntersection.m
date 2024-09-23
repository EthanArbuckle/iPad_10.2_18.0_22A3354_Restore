@implementation CRLPathIntersection

- (CRLPathIntersection)initWithSegment:(int64_t)a3 atT:(double)a4 atPoint:(CGPoint)a5
{
  return -[CRLPathIntersection initWithSegment:atT:onSegmentB:atT:atPoint:](self, "initWithSegment:atT:onSegmentB:atT:atPoint:", a3, 0, a4, 0.0, a5.x, a5.y);
}

- (CRLPathIntersection)initWithSegment:(int64_t)a3 atT:(double)a4 onSegmentB:(int64_t)a5 atT:(double)a6 atPoint:(CGPoint)a7
{
  CGFloat y;
  CGFloat x;
  CRLPathIntersection *result;
  objc_super v14;

  y = a7.y;
  x = a7.x;
  v14.receiver = self;
  v14.super_class = (Class)CRLPathIntersection;
  result = -[CRLPathIntersection init](&v14, "init");
  if (result)
  {
    result->mSegment = a3;
    result->mT = a4;
    result->mPoint.x = x;
    result->mPoint.y = y;
    result->mSegmentB = a5;
    result->mTB = a6;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(A:(%ld, %.2f) B:(%ld, %.2f) @:(%.2f, %.2f))"), self->mSegment, *(_QWORD *)&self->mT, self->mSegmentB, *(_QWORD *)&self->mTB, *(_QWORD *)&self->mPoint.x, *(_QWORD *)&self->mPoint.y);
}

- (int64_t)compareSegmentAndT:(id)a3
{
  id v4;
  int64_t v5;
  id v6;
  int64_t v7;

  v4 = a3;
  v5 = -[CRLPathIntersection segment](self, "segment");
  v6 = objc_msgSend(v4, "segment");
  if (v5 >= (uint64_t)v6)
  {
    if (v5 <= (uint64_t)v6)
      v7 = -[CRLPathIntersection compareT:](self, "compareT:", v4);
    else
      v7 = 1;
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (int64_t)compareT:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[CRLPathIntersection t](self, "t");
  v6 = v5;
  objc_msgSend(v4, "t");
  v8 = v7;

  if (v6 < v8)
    return -1;
  else
    return v6 > v8;
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
