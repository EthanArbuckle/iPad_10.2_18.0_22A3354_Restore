@implementation DMDSecureUnarchiveFromPayloadMetadataDataTransformer

+ (void)initialize
{
  if (qword_1000EBA10 != -1)
    dispatch_once(&qword_1000EBA10, &stru_1000BBA88);
}

+ (id)allowedTopLevelClasses
{
  if (qword_1000EBA20 != -1)
    dispatch_once(&qword_1000EBA20, &stru_1000BBAA8);
  return (id)qword_1000EBA18;
}

@end
