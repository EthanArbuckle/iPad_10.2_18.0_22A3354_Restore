@implementation RETrainingScheduler

+ (RETrainingScheduler)schedulerWithBehavior:(unint64_t)a3
{
  if (a3 > 2)
    return (RETrainingScheduler *)0;
  else
    return (RETrainingScheduler *)(id)objc_opt_new();
}

@end
