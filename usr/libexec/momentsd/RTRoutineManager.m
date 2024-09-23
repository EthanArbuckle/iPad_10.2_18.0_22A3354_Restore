@implementation RTRoutineManager

- (RTRoutineManager)initWithUniverse:(id)a3
{
  RTRoutineManager *v4;

  v4 = (RTRoutineManager *)objc_claimAutoreleasedReturnValue(+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager", a3));

  return v4;
}

@end
