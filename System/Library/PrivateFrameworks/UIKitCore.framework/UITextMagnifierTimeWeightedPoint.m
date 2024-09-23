@implementation UITextMagnifierTimeWeightedPoint

- (void)clearHistory
{
  uint64_t v2;
  __int128 v3;
  char *v4;

  v2 = 0;
  v3 = *MEMORY[0x1E0C9D538];
  do
  {
    v4 = (char *)self + v2;
    *((_OWORD *)v4 + 1) = v3;
    *((_QWORD *)v4 + 4) = 0xBFF0000000000000;
    v2 += 24;
  }
  while (v2 != 384);
}

- (void)addPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CFAbsoluteTime Current;
  int m_index;
  CGFloat *v8;
  int v9;

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
  double v3;
  double v4;
  double Current;
  int m_index;
  int v7;
  double v8;
  double v9;
  int v10;
  $EEFD5C701B709DECB2E766E3480DE179 *v11;
  double time;
  double y;
  double x;
  double v16;
  CGPoint result;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  Current = CFAbsoluteTimeGetCurrent();
  m_index = self->m_index;
  v7 = 15;
  v8 = v4;
  v9 = v3;
  while (1)
  {
    v10 = m_index + v7;
    if (m_index + v7 - 16 >= 0)
      v10 = m_index + v7 - 16;
    v11 = &self->m_points[v10];
    time = v11->time;
    if (time == -1.0)
      break;
    x = v11->point.x;
    y = v11->point.y;
    if (v9 == v3 && v8 == v4)
    {
      v9 = v11->point.x;
      v8 = v11->point.y;
    }
    else if (Current - time > 0.15)
    {
      goto LABEL_15;
    }
    --v7;
    x = v9;
    y = v8;
    if (v7 == -1)
      goto LABEL_15;
  }
  x = v9;
  y = v8;
LABEL_15:
  v16 = x;
  result.y = y;
  result.x = v16;
  return result;
}

- (BOOL)historyCovers:(double)a3
{
  double Current;
  int m_index;
  int v7;
  int v8;
  $EEFD5C701B709DECB2E766E3480DE179 *v9;
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
    if (v9->point.x == *MEMORY[0x1E0C9D538] && v9->point.y == *(double *)(MEMORY[0x1E0C9D538] + 8))
      return 0;
    if (Current - time > a3)
      break;
    if (!--v7)
      return 0;
  }
  return 1;
}

- (float)distanceCoveredInInterval:(double)a3
{
  float result;

  -[UITextMagnifierTimeWeightedPoint distanceCoveredInInterval:priorTo:](self, "distanceCoveredInInterval:priorTo:", a3, CFAbsoluteTimeGetCurrent());
  return result;
}

- (CGSize)displacementInInterval:(double)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UITextMagnifierTimeWeightedPoint displacementInInterval:priorTo:](self, "displacementInInterval:priorTo:", a3, CFAbsoluteTimeGetCurrent());
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)displacementInInterval:(double)a3 priorTo:(double)a4
{
  double v6;
  double v7;
  int m_index;
  int v9;
  double v10;
  double v11;
  int v12;
  $EEFD5C701B709DECB2E766E3480DE179 *v13;
  double time;
  double x;
  double y;
  BOOL v17;
  double v18;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v6 = *MEMORY[0x1E0C9D820];
  v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  m_index = self->m_index;
  v9 = 15;
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v11 = *MEMORY[0x1E0C9D538];
  do
  {
    v12 = m_index + v9;
    if (m_index + v9 - 16 >= 0)
      v12 = m_index + v9 - 16;
    v13 = &self->m_points[v12];
    time = v13->time;
    if (time == -1.0)
      break;
    x = v13->point.x;
    y = v13->point.y;
    v17 = y == *(double *)(MEMORY[0x1E0C9D538] + 8) && x == *MEMORY[0x1E0C9D538];
    v18 = a4 - time;
    if (v17 || v18 > a3)
      break;
    v20 = v11 - x;
    v21 = v10 - y;
    if (v9 == 15)
      v21 = -0.0;
    v7 = v7 + v21;
    v22 = v9 == 15 ? -0.0 : v20;
    v6 = v6 + v22;
    --v9;
    v10 = v13->point.y;
    v11 = v13->point.x;
  }
  while (v9 != -1);
  result.height = v7;
  result.width = v6;
  return result;
}

- (float)distanceCoveredInInterval:(double)a3 priorTo:(double)a4
{
  int m_index;
  float v5;
  int v6;
  double v7;
  double v8;
  int v9;
  $EEFD5C701B709DECB2E766E3480DE179 *v10;
  double time;
  double x;
  double y;
  BOOL v14;
  double v15;

  m_index = self->m_index;
  v5 = 0.0;
  v6 = 15;
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v8 = *MEMORY[0x1E0C9D538];
  do
  {
    v9 = m_index + v6;
    if (m_index + v6 - 16 >= 0)
      v9 = m_index + v6 - 16;
    v10 = &self->m_points[v9];
    time = v10->time;
    if (time == -1.0)
      break;
    x = v10->point.x;
    y = v10->point.y;
    v14 = y == *(double *)(MEMORY[0x1E0C9D538] + 8) && x == *MEMORY[0x1E0C9D538];
    v15 = a4 - time;
    if (v14 || v15 > a3)
      break;
    if (v6 != 15)
      v5 = sqrt((x - v8) * (x - v8) + (y - v7) * (y - v7)) + v5;
    --v6;
    v7 = v10->point.y;
    v8 = v10->point.x;
  }
  while (v6 != -1);
  return v5;
}

- (BOOL)isPlacedCarefully
{
  BOOL v3;
  float v4;

  v3 = -[UITextMagnifierTimeWeightedPoint historyCovers:](self, "historyCovers:", 0.2);
  -[UITextMagnifierTimeWeightedPoint distanceCoveredInInterval:](self, "distanceCoveredInInterval:", 0.2);
  return v4 < 15.0 && v3;
}

- (CGPoint)diffFromLastPoint
{
  int m_index;
  int v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  m_index = self->m_index;
  if (m_index >= 1)
    v3 = -1;
  else
    v3 = 15;
  v4 = (double *)((char *)self + 24 * v3 + 24 * m_index);
  v5 = v4[2];
  v6 = v4[3];
  -[UITextMagnifierTimeWeightedPoint weightedPoint](self, "weightedPoint");
  v8 = v7 - v5;
  v10 = v9 - v6;
  result.y = v10;
  result.x = v8;
  return result;
}

@end
