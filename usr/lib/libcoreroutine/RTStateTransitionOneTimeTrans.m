@implementation RTStateTransitionOneTimeTrans

- (RTStateTransitionOneTimeTrans)initWithStart:(double)a3 stop:(double)a4 motionActivityType:(unint64_t)a5
{
  RTStateTransitionOneTimeTrans *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RTStateTransitionOneTimeTrans;
  result = -[RTStateTransitionOneTimeTrans init](&v9, sel_init);
  if (result)
  {
    result->_start_s = a3;
    result->_stop_s = a4;
    result->_motionActivityType = a5;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double start_s;
  id v5;

  start_s = self->_start_s;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("start_s"), start_s);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("stop_s"), self->_stop_s);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_motionActivityType, CFSTR("motionActivityType"));

}

- (RTStateTransitionOneTimeTrans)initWithCoder:(id)a3
{
  id v4;
  RTStateTransitionOneTimeTrans *v5;
  double v6;
  double v7;
  uint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTStateTransitionOneTimeTrans;
  v5 = -[RTStateTransitionOneTimeTrans init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("start_s"));
    v5->_start_s = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("stop_s"));
    v5->_stop_s = v7;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("motionActivityType")))
      v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("motionActivityType"));
    else
      v8 = 0;
    v5->_motionActivityType = v8;
  }

  return v5;
}

- (double)start_s
{
  return self->_start_s;
}

- (void)setStart_s:(double)a3
{
  self->_start_s = a3;
}

- (double)stop_s
{
  return self->_stop_s;
}

- (void)setStop_s:(double)a3
{
  self->_stop_s = a3;
}

- (unint64_t)motionActivityType
{
  return self->_motionActivityType;
}

- (void)setMotionActivityType:(unint64_t)a3
{
  self->_motionActivityType = a3;
}

@end
