@implementation UPBezierPathElement

- (UPBezierPathElement)initWithStartPoint:(CGPoint)a3 pathElement:(const CGPathElement *)a4
{
  CGFloat y;
  CGFloat x;
  UPBezierPathElement *v7;
  uint64_t type;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  uint64_t v13;
  CGFloat *v14;
  CGFloat *v15;
  UPBezierPathElement *v16;
  objc_super v18;

  y = a3.y;
  x = a3.x;
  v18.receiver = self;
  v18.super_class = (Class)UPBezierPathElement;
  v7 = -[UPBezierPathElement init](&v18, sel_init);
  if (v7)
  {
    type = a4->type;
    v9 = 3;
    v10 = 2;
    v11 = (_DWORD)type != 2;
    if ((_DWORD)type != 2)
      v10 = 0;
    if ((_DWORD)type == 3)
      v11 = 0;
    else
      v9 = v10;
    v12 = type >= 2 && v11;
    if (type >= 2)
      v13 = v9;
    else
      v13 = 1;
    v14 = (CGFloat *)malloc_type_malloc(16 * (v13 + 1), 0xC8931B9CuLL);
    v15 = v14;
    *v14 = x;
    v14[1] = y;
    if (!v12)
      memcpy(v14 + 2, a4->points, 16 * v13);
    -[UPBezierPathElement setPoints:](v7, "setPoints:", v15);
    -[UPBezierPathElement setType:](v7, "setType:", type);
    -[UPBezierPathElement setPointCount:](v7, "setPointCount:", v13 + 1);
    v16 = v7;
  }

  return v7;
}

- (uint64_t)numberOfPointsForCGPathElementType:(uint64_t)a1
{
  uint64_t result;

  result = 0;
  if (a1)
  {
    if (a2 <= 3)
      return qword_226FF81C8[a2];
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (-[UPBezierPathElement points](self, "points"))
    free(-[UPBezierPathElement points](self, "points"));
  v3.receiver = self;
  v3.super_class = (Class)UPBezierPathElement;
  -[UPBezierPathElement dealloc](&v3, sel_dealloc);
}

- (CGPoint)startPoint
{
  CGPoint *v2;
  double x;
  double y;
  CGPoint result;

  v2 = -[UPBezierPathElement points](self, "points");
  x = v2->x;
  y = v2->y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)endPoint
{
  CGPoint *v3;
  CGPoint *v4;
  double x;
  double y;
  CGPoint result;

  v3 = -[UPBezierPathElement points](self, "points");
  v4 = &v3[-[UPBezierPathElement pointCount](self, "pointCount")];
  x = v4[-1].x;
  y = v4[-1].y;
  result.y = y;
  result.x = x;
  return result;
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (unint64_t)pointCount
{
  return self->_pointCount;
}

- (void)setPointCount:(unint64_t)a3
{
  self->_pointCount = a3;
}

- (CGPoint)points
{
  return self->_points;
}

- (void)setPoints:(CGPoint *)a3
{
  self->_points = a3;
}

@end
