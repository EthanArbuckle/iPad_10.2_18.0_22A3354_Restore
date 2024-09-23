@implementation SBTouchHistory

- (void)updateWithLocation:(CGPoint)a3 timestamp:(double)a4 touchLatency:(double)a5
{
  unint64_t count;
  unint64_t depth;
  unint64_t start;
  TouchHistory *history;
  CGPoint *p_var0;
  long double v11;
  long double v12;
  long double v13;

  count = self->_count;
  if (count)
  {
    depth = self->_depth;
    if ((a4 - self->_history[(count + self->_start - 1) % depth].var1) * 1000.0 < 1.0)
      return;
  }
  else
  {
    depth = self->_depth;
  }
  self->_lastTouchLatency = a5;
  start = self->_start;
  if (count == depth - 1)
  {
    start = (start + 1) % depth;
    self->_start = start;
    --count;
  }
  history = self->_history;
  self->_count = count + 1;
  p_var0 = &history[(count + start) % depth].var0;
  *p_var0 = a3;
  p_var0[1].x = a4;
  -[SBTouchHistory averageTouchVelocityOverTimeDuration:](self, "averageTouchVelocityOverTimeDuration:", 0.04);
  v13 = hypot(v11, v12);
  if (v13 > self->_peakSpeed)
    self->_peakSpeed = v13;
}

- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3
{
  int v4;
  double v5;
  double v6;
  int v7;
  int v8;
  uint64_t v9;
  TouchHistory *history;
  unint64_t depth;
  unint64_t v12;
  double *p_x;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGPoint result;

  v4 = -[SBTouchHistory touchHistoryDepthForTimeDuration:forComputingDerivative:](self, "touchHistoryDepthForTimeDuration:forComputingDerivative:", 1, self->_lastTouchLatency + a3);
  v6 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v4)
  {
    v7 = v4;
    if (v4 >= 1)
    {
      v8 = 0;
      v9 = -2;
      do
      {
        history = self->_history;
        depth = self->_depth;
        v12 = v9 + self->_start + self->_count;
        p_x = &history[(v12 + 1) % depth].var0.x;
        v14 = *p_x;
        v15 = p_x[1];
        v16 = &history[v12 % depth].var0.x;
        v17 = *v16;
        v18 = v16[1];
        v19 = p_x[2] - v16[2];
        if ((BSFloatIsZero() & 1) == 0)
        {
          v6 = v6 + (v14 - v17) / v19;
          v5 = v5 + (v15 - v18) / v19;
        }
        ++v8;
        --v9;
      }
      while (v8 < v7);
    }
    v6 = v6 / (double)v7;
    v5 = v5 / (double)v7;
  }
  v20 = v6;
  v21 = v5;
  result.y = v21;
  result.x = v20;
  return result;
}

- (int)touchHistoryDepthForTimeDuration:(double)a3 forComputingDerivative:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  unint64_t count;
  uint64_t v9;
  unint64_t v10;
  double v11;

  v4 = a4;
  v7 = CACurrentMediaTime();
  count = self->_count;
  if (!count)
    return 0;
  v9 = 0;
  v10 = count - 1;
  do
  {
    if (!(v10 + v9))
      return count - 1;
    v11 = v7 - self->_history[(v10 + v9-- + self->_start) % self->_depth].var1;
  }
  while (v11 < a3);
  if (v4)
    return -(int)v9;
  else
    return ~(_DWORD)v9;
}

- (void)updateWithLocation:(CGPoint)a3 timestamp:(double)a4
{
  -[SBTouchHistory updateWithLocation:timestamp:touchLatency:](self, "updateWithLocation:timestamp:touchLatency:", a3.x, a3.y, a4, CACurrentMediaTime() - a4);
}

- (void)reset
{
  self->_peakSpeed = 0.0;
  self->_count = 0;
  self->_start = 0;
}

- (SBTouchHistory)initWithDepth:(unint64_t)a3
{
  SBTouchHistory *v4;
  SBTouchHistory *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBTouchHistory;
  v4 = -[SBTouchHistory init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_depth = a3;
    v4->_history = (TouchHistory *)malloc_type_malloc(24 * a3, 0x1000040504FFAC1uLL);
    v5->_peakSpeed = 0.0;
  }
  return v5;
}

- (SBTouchHistory)init
{
  return -[SBTouchHistory initWithDepth:](self, "initWithDepth:", 32);
}

- (void)dealloc
{
  objc_super v3;

  free(self->_history);
  v3.receiver = self;
  v3.super_class = (Class)SBTouchHistory;
  -[SBTouchHistory dealloc](&v3, sel_dealloc);
}

- (double)historyAtIndex:(_QWORD *)a1
{
  if (a1)
    return *(double *)(a1[4] + 24 * ((unint64_t)(a1[3] + ~a2 + a1[2]) % a1[1]));
  else
    return 0.0;
}

- (double)averageTouchPathAngleOverTimeDuration:(double)a3
{
  int v4;
  int v5;
  uint64_t v6;
  double v7;
  TouchHistory *history;
  unint64_t start;
  unint64_t count;
  unint64_t depth;
  double *p_x;
  double *v13;
  double v14;
  double v15;
  double v16;

  v4 = -[SBTouchHistory touchHistoryDepthForTimeDuration:forComputingDerivative:](self, "touchHistoryDepthForTimeDuration:forComputingDerivative:", 1, a3);
  if (!v4)
    return 0.0;
  v5 = v4;
  if (v4 < 1)
  {
    v7 = 0.0;
  }
  else
  {
    v6 = 0;
    v7 = 0.0;
    do
    {
      if (self)
      {
        start = self->_start;
        history = self->_history;
        depth = self->_depth;
        count = self->_count;
        p_x = &history[(start + ~v6++ + count) % depth].var0.x;
        v13 = &history[(start + ~v6 + count) % depth].var0.x;
        v14 = p_x[1] - v13[1];
        v15 = *p_x - *v13;
      }
      else
      {
        ++v6;
        v14 = 0.0;
        v15 = 0.0;
      }
      v16 = atan2(-v14, v15) * 57.2957795;
      if (v16 < 0.0)
        v16 = v16 + 360.0;
      v7 = v7 + v16;
    }
    while ((int)v6 < v5);
  }
  return v7 / (double)v5;
}

- (double)peakSpeed
{
  return self->_peakSpeed;
}

@end
