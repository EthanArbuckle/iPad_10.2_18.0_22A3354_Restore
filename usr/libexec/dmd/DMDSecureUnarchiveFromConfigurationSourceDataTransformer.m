@implementation DMDSecureUnarchiveFromConfigurationSourceDataTransformer

+ (void)initialize
{
  if (qword_1000EB838 != -1)
    dispatch_once(&qword_1000EB838, &stru_1000BAAA0);
}

+ (id)allowedTopLevelClasses
{
  if (qword_1000EB848 != -1)
    dispatch_once(&qword_1000EB848, &stru_1000BAAC0);
  return (id)qword_1000EB840;
}

@end
