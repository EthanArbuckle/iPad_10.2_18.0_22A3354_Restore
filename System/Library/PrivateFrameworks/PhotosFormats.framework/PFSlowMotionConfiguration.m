@implementation PFSlowMotionConfiguration

- (PFSlowMotionConfiguration)init
{
  PFSlowMotionConfiguration *v2;
  PFSlowMotionConfiguration *v3;
  PFSlowMotionRampConfiguration *v4;
  PFSlowMotionRampConfiguration *rampDown;
  PFSlowMotionRampConfiguration *v6;
  PFSlowMotionRampConfiguration *rampUp;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PFSlowMotionConfiguration;
  v2 = -[PFSlowMotionConfiguration init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_volumeDuringSlowMotion = 0x3E19999A3E800000;
    v4 = -[PFSlowMotionRampConfiguration initForRampDown:]([PFSlowMotionRampConfiguration alloc], "initForRampDown:", 1);
    rampDown = v3->_rampDown;
    v3->_rampDown = v4;

    v6 = -[PFSlowMotionRampConfiguration initForRampDown:]([PFSlowMotionRampConfiguration alloc], "initForRampDown:", 0);
    rampUp = v3->_rampUp;
    v3->_rampUp = v6;

  }
  return v3;
}

- (float)volumeDuringSlowMotion
{
  return self->_volumeDuringSlowMotion;
}

- (float)volumeDuringRampToSlowMotion
{
  return self->_volumeDuringRampToSlowMotion;
}

- (PFSlowMotionRampConfiguration)rampDown
{
  return self->_rampDown;
}

- (PFSlowMotionRampConfiguration)rampUp
{
  return self->_rampUp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rampUp, 0);
  objc_storeStrong((id *)&self->_rampDown, 0);
}

@end
