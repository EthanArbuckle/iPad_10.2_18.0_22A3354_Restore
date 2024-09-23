@implementation FRCustomAnimationCurveFactory

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", a4);
}

- (id)_timingFunctionForAnimation
{
  return -[FRCustomAnimationCurveFactory timingFunction](self, "timingFunction");
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
