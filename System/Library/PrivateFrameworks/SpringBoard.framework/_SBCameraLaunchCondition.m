@implementation _SBCameraLaunchCondition

+ (id)conditionWithConditions:(id)a3
{
  id v3;
  _SBAggregateCameraLaunchCondition *v4;

  v3 = a3;
  v4 = objc_alloc_init(_SBAggregateCameraLaunchCondition);
  -[_SBAggregateCameraLaunchCondition setConditions:](v4, "setConditions:", v3);

  return v4;
}

+ (id)conditionWithValue:(BOOL)a3
{
  _SBCameraLaunchCondition *v4;

  v4 = objc_alloc_init(_SBCameraLaunchCondition);
  v4->_met = a3;
  return v4;
}

- (BOOL)isMet
{
  return self->_met;
}

- (void)setMet:(BOOL)a3
{
  self->_met = a3;
}

@end
