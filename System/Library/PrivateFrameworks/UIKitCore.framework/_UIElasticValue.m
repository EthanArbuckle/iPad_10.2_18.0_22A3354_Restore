@implementation _UIElasticValue

- (_UIElasticValue)init
{
  _UIElasticValue *v2;
  _UIElasticValue *v3;
  _UIElasticValue *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIElasticValue;
  v2 = -[_UIElasticValue init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_targetValue = 0.0;
    v2->_speed = 0.0;
    *(_OWORD *)&v2->_friction = xmmword_186681EA0;
    v4 = v2;
  }

  return v3;
}

- (_UIElasticValue)initWithValue:(double)a3
{
  _UIElasticValue *v4;
  _UIElasticValue *v5;
  _UIElasticValue *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIElasticValue;
  v4 = -[_UIElasticValue init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_targetValue = a3;
    v6 = v4;
  }

  return v5;
}

- (void)update:(double)a3
{
  double currentValue;
  double v4;

  currentValue = self->_currentValue;
  v4 = self->_speed * self->_momentum + (self->_targetValue - currentValue) * (1.0 - self->_friction);
  self->_speed = v4;
  self->_currentValue = currentValue + v4 * a3;
}

- (void)updateFromDisplayLink:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "duration");
  v5 = v4;
  v6 = 0.0;
  if (v5 > 0.0)
  {
    objc_msgSend(v8, "duration", 0.0);
    v6 = 0.0166666667 / v7;
  }
  -[_UIElasticValue update:](self, "update:", v6);

}

- (BOOL)isSteady
{
  double speed;
  float v3;

  speed = self->_speed;
  if (speed != 0.0)
  {
    v3 = speed * 1000.0;
    speed = roundf(v3) / 1000.0;
  }
  return speed == 0.0;
}

- (id)description
{
  void *v3;
  void *v4;
  double speed;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  __int128 v10;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)_UIElasticValue;
  -[_UIElasticValue description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_OWORD *)&self->_currentValue;
  speed = self->_speed;
  v6 = -[_UIElasticValue isSteady](self, "isSteady");
  v7 = CFSTR("NO");
  if (v6)
    v7 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {currentValue = %0.3f, targetValue = %0.3f, speed = %f, steady = %@}"), v4, v10, *(_QWORD *)&speed, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (double)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(double)a3
{
  self->_currentValue = a3;
}

- (double)targetValue
{
  return self->_targetValue;
}

- (void)setTargetValue:(double)a3
{
  self->_targetValue = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_speed = a3;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (double)momentum
{
  return self->_momentum;
}

- (void)setMomentum:(double)a3
{
  self->_momentum = a3;
}

@end
