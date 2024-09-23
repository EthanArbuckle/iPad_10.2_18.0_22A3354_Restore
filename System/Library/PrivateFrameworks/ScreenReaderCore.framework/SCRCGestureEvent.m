@implementation SCRCGestureEvent

- (SCRCGestureEvent)initWithDeviceIdentifier:(unint64_t)a3
{
  SCRCGestureEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCRCGestureEvent;
  v4 = -[SCRCGestureEvent init](&v6, sel_init);
  if (v4)
  {
    v4->_time = CFAbsoluteTimeGetCurrent();
    v4->_deviceIdentifier = a3;
  }
  return v4;
}

- (void)dealloc
{
  unint64_t v3;
  SCRCGestureFinger **finger;
  SCRCGestureFinger *v5;
  objc_super v6;

  if (self->_fingerCount)
  {
    v3 = 0;
    finger = self->_finger;
    do
    {
      v5 = finger[v3];
      finger[v3] = 0;

      ++v3;
    }
    while (v3 < self->_fingerCount);
  }
  v6.receiver = self;
  v6.super_class = (Class)SCRCGestureEvent;
  -[SCRCGestureEvent dealloc](&v6, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = objc_opt_class();
  -[SCRCGestureEvent time](self, "time");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@:%p] time: %lf, device: %lu, %lu fingers"), v4, self, v5, self->_deviceIdentifier, self->_fingerCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_fingerCount)
  {
    v7 = 0;
    do
      objc_msgSend(v6, "appendFormat:", CFSTR("\n\t%@"), self->_finger[v7++]);
    while (v7 < self->_fingerCount);
  }
  return v6;
}

- (unint64_t)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)addFingerWithIdentifier:(unint64_t)a3 location:(CGPoint)a4 pressure:(double)a5
{
  double y;
  CGFloat v7;
  SCRCGestureFinger *v8;
  Class *v9;
  Class v10;

  if (self->_fingerCount <= 7)
  {
    y = a4.y;
    v7 = a4.y + self->_averageLocation.y;
    self->_averageLocation.x = a4.x + self->_averageLocation.x;
    self->_averageLocation.y = v7;
    v8 = -[SCRCGestureFinger initWithIdentifier:location:pressure:]([SCRCGestureFinger alloc], "initWithIdentifier:location:pressure:", a3, a4.x, y, a5);
    v9 = &self->super.isa + self->_fingerCount;
    v10 = v9[2];
    v9[2] = (Class)v8;

    ++self->_fingerCount;
  }
}

- (void)addStylusWithIdentifier:(unint64_t)a3 location:(CGPoint)a4 pressure:(double)a5 altitude:(double)a6 azimuth:(double)a7
{
  double y;
  CGFloat v9;
  SCRCGestureStylus *v10;
  Class *v11;
  Class v12;

  if (self->_fingerCount <= 7)
  {
    y = a4.y;
    v9 = a4.y + self->_averageLocation.y;
    self->_averageLocation.x = a4.x + self->_averageLocation.x;
    self->_averageLocation.y = v9;
    v10 = -[SCRCGestureStylus initWithIdentifier:location:pressure:altitude:azimuth:]([SCRCGestureStylus alloc], "initWithIdentifier:location:pressure:altitude:azimuth:", a3, a4.x, y, a5, a6, a7);
    v11 = &self->super.isa + self->_fingerCount;
    v12 = v11[2];
    v11[2] = (Class)v10;

    ++self->_fingerCount;
  }
}

- (void)removeFingerWithIdentifier:(unint64_t)a3
{
  unint64_t fingerCount;
  unint64_t v6;
  unint64_t v7;
  SCRCGestureFinger **finger;
  SCRCGestureFinger *v9;
  float64x2_t *v10;
  SCRCGestureFinger *v11;
  unint64_t v12;
  SCRCGestureFinger *v13;
  float64x2_t *p_averageLocation;

  fingerCount = self->_fingerCount;
  self->_averageLocation = (CGPoint)*MEMORY[0x24BDBEFB0];
  if (fingerCount)
  {
    v6 = 0;
    v7 = 0;
    p_averageLocation = (float64x2_t *)&self->_averageLocation;
    finger = self->_finger;
    do
    {
      v9 = finger[v6];
      v10 = v9;
      if (*(_QWORD *)&v10->f64[1] == a3)
      {
        --fingerCount;
        v11 = finger[v6];
        finger[v6] = 0;

      }
      else
      {
        objc_storeStrong((id *)&finger[v7], v9);
        *p_averageLocation = vaddq_f64(v10[1], *p_averageLocation);
        ++v7;
      }

      ++v6;
      v12 = self->_fingerCount;
    }
    while (v6 < v12);
    while (v7 < v12)
    {
      v13 = finger[v7];
      finger[v7] = 0;

      ++v7;
      v12 = self->_fingerCount;
    }
  }
  self->_fingerCount = fingerCount;
}

- (unint64_t)fingerCount
{
  return self->_fingerCount;
}

- (id)fingerAtIndex:(unint64_t)a3
{
  return self->_finger[a3];
}

- (id)fingerWithIdentifier:(unint64_t)a3
{
  unint64_t fingerCount;
  SCRCGestureFinger **i;

  fingerCount = self->_fingerCount;
  if (!fingerCount)
    return 0;
  for (i = self->_finger; (*i)->_identifier != a3; ++i)
  {
    if (!--fingerCount)
      return 0;
  }
  return *i;
}

- (id)fingerWithoutIdentifier:(unint64_t)a3
{
  unint64_t fingerCount;
  SCRCGestureFinger **i;

  fingerCount = self->_fingerCount;
  if (!fingerCount)
    return 0;
  for (i = self->_finger; (*i)->_identifier == a3; ++i)
  {
    if (!--fingerCount)
      return 0;
  }
  return *i;
}

- (id)fingers
{
  void *v3;
  unint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_fingerCount)
  {
    v4 = 0;
    do
      objc_msgSend(v3, "addObject:", self->_finger[v4++]);
    while (self->_fingerCount > v4);
  }
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (CGRect)fingerFrame
{
  unint64_t fingerCount;
  CGFloat x;
  double y;
  double v6;
  double v7;
  uint64_t v8;
  unint64_t v9;
  CGRect result;
  CGRect v11;

  fingerCount = self->_fingerCount;
  if (fingerCount)
  {
    x = self->_finger[0]->_location.x;
    y = self->_finger[0]->_location.y;
    v6 = 0.0;
    if (fingerCount == 1)
    {
      v7 = 0.0;
    }
    else
    {
      v8 = 3;
      v7 = 0.0;
      do
      {
        v11.origin.x = *(CGFloat *)(*((_QWORD *)&self->super.isa + v8) + 16);
        v11.origin.y = *(CGFloat *)(*((_QWORD *)&self->super.isa + v8) + 24);
        v11.size.width = 0.0;
        v11.size.height = 0.0;
        *(CGRect *)&x = CGRectUnion(*(CGRect *)&x, v11);
        v9 = v8++ - 1;
      }
      while (v9 < self->_fingerCount);
    }
  }
  else
  {
    x = *MEMORY[0x24BDBF090];
    y = *(double *)(MEMORY[0x24BDBF090] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v6 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  result.size.height = v6;
  result.size.width = v7;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)averageLocation
{
  unint64_t fingerCount;
  double v3;
  double v4;
  CGPoint result;

  fingerCount = self->_fingerCount;
  if (fingerCount)
  {
    v3 = self->_averageLocation.x / (double)fingerCount;
    v4 = self->_averageLocation.y / (double)fingerCount;
  }
  else
  {
    v3 = *MEMORY[0x24BDBEFB0];
    v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)balancedLocation
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double MidY;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  -[SCRCGestureEvent fingerFrame](self, "fingerFrame");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MidX = CGRectGetMidX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  MidY = CGRectGetMidY(v11);
  v8 = MidX;
  result.y = MidY;
  result.x = v8;
  return result;
}

- (BOOL)isCancelEvent
{
  return 0;
}

- (CGPoint)magneticLocation
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[SCRCGestureEvent fingerFrame](self, "fingerFrame");
  v4 = v3 + v3 / (1.0 - v2) * v2;
  v7 = v6 + v6 / (1.0 - v5) * v5;
  result.y = v7;
  result.x = v4;
  return result;
}

- (double)time
{
  return self->_time;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (void).cxx_destruct
{
  uint64_t i;

  for (i = 72; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
}

@end
