@implementation TSWPTextMagnifierTimeWeightedPoint

- (void)clearHistory
{
  uint64_t v2;
  _OWORD *v3;
  char *v4;

  v2 = 0;
  v3 = (_OWORD *)MEMORY[0x24BDBEFB0];
  do
  {
    v4 = (char *)self + v2;
    *((_OWORD *)v4 + 1) = *v3;
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
  double *v3;
  double v4;
  double v5;
  double Current;
  int64_t m_index;
  uint64_t v8;
  uint64_t v9;
  $8F0AA1C33CB754114AD7CC203EA9B03E *v10;
  double time;
  double y;
  double x;
  double v15;
  CGPoint result;

  v3 = (double *)MEMORY[0x24BDBEFB0];
  v4 = *MEMORY[0x24BDBEFB0];
  v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  Current = CFAbsoluteTimeGetCurrent();
  m_index = self->m_index;
  v8 = 16;
  while (1)
  {
    v9 = m_index + v8 - 1;
    if (m_index + v8 - 17 >= 0)
      v9 = m_index + v8 - 17;
    v10 = &self->m_points[v9];
    time = v10->time;
    if (time == -1.0)
      break;
    x = v10->point.x;
    y = v10->point.y;
    if (v4 == *v3 && v5 == v3[1])
    {
      v4 = v10->point.x;
      v5 = v10->point.y;
    }
    else if (Current - time > 0.15)
    {
      goto LABEL_15;
    }
    x = v4;
    y = v5;
    if (!--v8)
      goto LABEL_15;
  }
  x = v4;
  y = v5;
LABEL_15:
  v15 = x;
  result.y = y;
  result.x = v15;
  return result;
}

- (BOOL)historyCovers:(double)a3
{
  double Current;
  int64_t m_index;
  uint64_t v7;
  uint64_t v8;
  $8F0AA1C33CB754114AD7CC203EA9B03E *v9;
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
    if (v9->point.x == *MEMORY[0x24BDBEFB0] && v9->point.y == *(double *)(MEMORY[0x24BDBEFB0] + 8))
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

  -[TSWPTextMagnifierTimeWeightedPoint distanceCoveredInInterval:priorTo:](self, "distanceCoveredInInterval:priorTo:", a3, CFAbsoluteTimeGetCurrent());
  return result;
}

- (CGSize)displacementInInterval:(double)a3
{
  double v3;
  double v4;
  CGSize result;

  -[TSWPTextMagnifierTimeWeightedPoint displacementInInterval:priorTo:](self, "displacementInInterval:priorTo:", a3, CFAbsoluteTimeGetCurrent());
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)displacementInInterval:(double)a3 priorTo:(double)a4
{
  double v6;
  double v7;
  int64_t m_index;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  $8F0AA1C33CB754114AD7CC203EA9B03E *v13;
  double time;
  double x;
  double y;
  BOOL v17;
  double v18;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v6 = *MEMORY[0x24BDBF148];
  v7 = *(double *)(MEMORY[0x24BDBF148] + 8);
  m_index = self->m_index;
  v9 = 16;
  v10 = *MEMORY[0x24BDBEFB0];
  v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  do
  {
    v12 = m_index + v9 - 1;
    if (m_index + v9 - 17 >= 0)
      v12 = m_index + v9 - 17;
    v13 = &self->m_points[v12];
    time = v13->time;
    if (time == -1.0)
      break;
    x = v13->point.x;
    y = v13->point.y;
    v17 = y == *(double *)(MEMORY[0x24BDBEFB0] + 8) && x == *MEMORY[0x24BDBEFB0];
    v18 = a4 - time;
    if (v17 || v18 > a3)
      break;
    v20 = v10 - x;
    v21 = v11 - y;
    if (v9 == 16)
      v20 = -0.0;
    v6 = v6 + v20;
    v22 = v9 == 16 ? -0.0 : v21;
    v7 = v7 + v22;
    v10 = v13->point.x;
    v11 = v13->point.y;
    --v9;
  }
  while (v9);
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)distanceCoveredInInterval:(double)a3 priorTo:(double)a4
{
  double v6;
  double v7;
  int64_t m_index;
  $8F0AA1C33CB754114AD7CC203EA9B03E *m_points;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  double *p_x;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  double v20;

  v6 = *MEMORY[0x24BDBEFB0];
  v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  m_index = self->m_index;
  m_points = self->m_points;
  v10 = 0.0;
  v11 = 16;
  v12 = *MEMORY[0x24BDBEFB0];
  v13 = v7;
  do
  {
    v14 = m_index + v11 - 1;
    if (m_index + v11 - 17 >= 0)
      v14 = m_index + v11 - 17;
    p_x = &m_points[v14].point.x;
    v16 = p_x[2];
    if (v16 == -1.0)
      break;
    v17 = *p_x;
    v18 = p_x[1];
    v19 = v18 == v7 && v17 == v6;
    v20 = a4 - v16;
    if (v19 || v20 > a3)
      break;
    if (v11 != 16)
      v10 = v10 + TSDDistance(v12, v13, *p_x, p_x[1]);
    v12 = v17;
    v13 = v18;
    --v11;
  }
  while (v11);
  return v10;
}

@end
