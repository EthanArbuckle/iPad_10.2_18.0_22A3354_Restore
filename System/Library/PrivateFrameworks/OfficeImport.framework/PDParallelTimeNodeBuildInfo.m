@implementation PDParallelTimeNodeBuildInfo

- (PDAnimationTarget)target
{
  return (PDAnimationTarget *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTarget:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)delay
{
  return self->mDelay;
}

- (void)setDelay:(double)a3
{
  self->mDelay = a3;
}

- (double)duration
{
  return self->mDuration;
}

- (void)setDuration:(double)a3
{
  self->mDuration = a3;
}

- (int)iterateType
{
  return self->mIterateType;
}

- (void)setIterateType:(int)a3
{
  self->mIterateType = a3;
}

- (id)value
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mValue, 0);
  objc_storeStrong((id *)&self->mTarget, 0);
}

@end
