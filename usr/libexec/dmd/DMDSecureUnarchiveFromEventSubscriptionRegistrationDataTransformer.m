@implementation DMDSecureUnarchiveFromEventSubscriptionRegistrationDataTransformer

+ (void)initialize
{
  if (qword_1000EB898 != -1)
    dispatch_once(&qword_1000EB898, &stru_1000BB040);
}

+ (id)allowedTopLevelClasses
{
  if (qword_1000EB8A8 != -1)
    dispatch_once(&qword_1000EB8A8, &stru_1000BB060);
  return (id)qword_1000EB8A0;
}

@end
