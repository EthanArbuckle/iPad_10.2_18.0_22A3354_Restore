@implementation PUDynamicValueFilter

- (PUDynamicValueFilter)init
{
  PUDynamicValueFilter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUDynamicValueFilter;
  v2 = -[PUValueFilter init](&v4, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    -[PUDynamicValueFilter setCurrentTime:](v2, "setCurrentTime:");
  }
  return v2;
}

- (double)outputValue
{
  double result;

  -[PUDynamicValueFilter _update](self, "_update");
  -[PUValueFilter currentValue](self, "currentValue");
  return result;
}

- (double)outputValueChangeRate
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[PUDynamicValueFilter currentTime](self, "currentTime");
  v4 = v3;
  -[PUValueFilter currentValue](self, "currentValue");
  v6 = v5;
  -[PUDynamicValueFilter _update](self, "_update");
  -[PUDynamicValueFilter currentTime](self, "currentTime");
  v8 = v7;
  -[PUValueFilter currentValue](self, "currentValue");
  return (v9 - v6) / (v8 - v4);
}

- (void)_update
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[PUDynamicValueFilter currentTime](self, "currentTime");
  v4 = v3;
  -[PUValueFilter currentValue](self, "currentValue");
  v6 = v5;
  -[PUDynamicValueFilter targetValue](self, "targetValue");
  v8 = v7;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v10 = v9;
  -[PUDynamicValueFilter updatedValue:withTargetValue:timeInterval:](self, "updatedValue:withTargetValue:timeInterval:", v6, v8, v9 - v4);
  -[PUValueFilter setCurrentValue:](self, "setCurrentValue:");
  -[PUDynamicValueFilter setCurrentTime:](self, "setCurrentTime:", v10);
}

- (double)updatedValue:(double)a3 withTargetValue:(double)a4 timeInterval:(double)a5
{
  return a4;
}

- (double)targetValue
{
  return self->_targetValue;
}

- (void)setTargetValue:(double)a3
{
  self->_targetValue = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

@end
