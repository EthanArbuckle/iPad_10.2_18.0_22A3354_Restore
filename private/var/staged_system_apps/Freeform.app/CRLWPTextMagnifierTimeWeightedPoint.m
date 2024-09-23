@implementation CRLWPTextMagnifierTimeWeightedPoint

- (void)clearHistory
{
  uint64_t v2;
  CGPoint v3;
  CGPoint *v4;

  v2 = 0;
  v3 = CGPointZero;
  do
  {
    v4 = (CGPoint *)((char *)self + v2);
    v4[1] = v3;
    v4[2].x = -1.0;
    v2 += 24;
  }
  while (v2 != 384);
}

- (void)addPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CFAbsoluteTime Current;
  int64_t m_index;
  CGFloat *v8;
  int64_t v9;

  y = a3.y;
  x = a3.x;
  Current = CFAbsoluteTimeGetCurrent();
  m_index = self->m_index;
  v8 = (CGFloat *)((char *)self + 24 * m_index);
  v8[2] = x;
  v8[3] = y;
  v8[4] = Current;
  if (m_index <= 14)
    v9 = m_index + 1;
  else
    v9 = 0;
  self->m_index = v9;
}

- (CGPoint)weightedPoint
{
  double y;
  double Current;
  int64_t m_index;
  uint64_t v6;
  double v7;
  double x;
  uint64_t v9;
  $A76C0396AC304EFB3E1CC5476AD650E9 *v10;
  double time;
  double v12;
  double v13;
  double v15;
  CGPoint result;

  y = CGPointZero.y;
  Current = CFAbsoluteTimeGetCurrent();
  m_index = self->m_index;
  v6 = 16;
  v7 = y;
  x = CGPointZero.x;
  while (1)
  {
    v9 = m_index + v6 - 1;
    if (m_index + v6 - 17 >= 0)
      v9 = m_index + v6 - 17;
    v10 = &self->m_points[v9];
    time = v10->time;
    if (time == -1.0)
      break;
    v13 = v10->point.x;
    v12 = v10->point.y;
    if (x == CGPointZero.x && v7 == y)
    {
      x = v10->point.x;
      v7 = v10->point.y;
    }
    else if (Current - time > 0.15)
    {
      goto LABEL_15;
    }
    v13 = x;
    v12 = v7;
    if (!--v6)
      goto LABEL_15;
  }
  v13 = x;
  v12 = v7;
LABEL_15:
  v15 = v13;
  result.y = v12;
  result.x = v15;
  return result;
}

- (BOOL)historyCovers:(double)a3
{
  double Current;
  int64_t m_index;
  uint64_t v7;
  uint64_t v8;
  $A76C0396AC304EFB3E1CC5476AD650E9 *v9;
  double time;

  Current = CFAbsoluteTimeGetCurrent();
  m_index = self->m_index;
  v7 = 16;
  while (1)
  {
    v8 = m_index + v7 - 1;
    if (m_index + v7 - 17 >= 0)
      v8 = m_index + v7 - 17;
    v9 = &self->m_points[v8];
    time = v9->time;
    if (time == -1.0)
      return 0;
    if (v9->point.x == CGPointZero.x && v9->point.y == CGPointZero.y)
      return 0;
    if (Current - time > a3)
      break;
    if (!--v7)
      return 0;
  }
  return 1;
}

- (double)distanceCoveredInInterval:(double)a3
{
  double result;

  -[CRLWPTextMagnifierTimeWeightedPoint distanceCoveredInInterval:priorTo:](self, "distanceCoveredInInterval:priorTo:", a3, CFAbsoluteTimeGetCurrent());
  return result;
}

- (CGSize)displacementInInterval:(double)a3
{
  double Current;
  double v6;
  double v7;
  CGSize result;

  Current = CFAbsoluteTimeGetCurrent();
  -[CRLWPTextMagnifierTimeWeightedPoint displacementInInterval:priorTo:](self, "displacementInInterval:priorTo:", a3, Current);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)displacementInInterval:(double)a3 priorTo:(double)a4
{
  double width;
  double height;
  int64_t m_index;
  uint64_t v9;
  double y;
  double x;
  uint64_t v12;
  $A76C0396AC304EFB3E1CC5476AD650E9 *v13;
  double time;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  double v20;
  double v21;
  double v22;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  m_index = self->m_index;
  v9 = 16;
  y = CGPointZero.y;
  x = CGPointZero.x;
  do
  {
    v12 = m_index + v9 - 1;
    if (m_index + v9 - 17 >= 0)
      v12 = m_index + v9 - 17;
    v13 = &self->m_points[v12];
    time = v13->time;
    if (time == -1.0)
      break;
    v15 = v13->point.x;
    v16 = v13->point.y;
    v17 = v16 == CGPointZero.y && v15 == CGPointZero.x;
    v18 = a4 - time;
    if (v17 || v18 > a3)
      break;
    v20 = x - v15;
    v21 = y - v16;
    if (v9 == 16)
      v21 = -0.0;
    height = height + v21;
    v22 = v9 == 16 ? -0.0 : v20;
    width = width + v22;
    y = v13->point.y;
    x = v13->point.x;
    --v9;
  }
  while (v9);
  result.height = height;
  result.width = width;
  return result;
}

- (double)distanceCoveredInInterval:(double)a3 priorTo:(double)a4
{
  double y;
  int64_t m_index;
  $A76C0396AC304EFB3E1CC5476AD650E9 *m_points;
  double v9;
  uint64_t v10;
  double v11;
  double x;
  uint64_t v13;
  double *p_x;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  double v19;

  y = CGPointZero.y;
  m_index = self->m_index;
  m_points = self->m_points;
  v9 = 0.0;
  v10 = 16;
  v11 = y;
  x = CGPointZero.x;
  do
  {
    v13 = m_index + v10 - 1;
    if (m_index + v10 - 17 >= 0)
      v13 = m_index + v10 - 17;
    p_x = &m_points[v13].point.x;
    v15 = p_x[2];
    if (v15 == -1.0)
      break;
    v16 = *p_x;
    v17 = p_x[1];
    v18 = v17 == y && v16 == CGPointZero.x;
    v19 = a4 - v15;
    if (v18 || v19 > a3)
      break;
    if (v10 != 16)
      v9 = v9 + sub_10006108C(x, v11, *p_x, p_x[1]);
    v11 = v17;
    x = v16;
    --v10;
  }
  while (v10);
  return v9;
}

@end
