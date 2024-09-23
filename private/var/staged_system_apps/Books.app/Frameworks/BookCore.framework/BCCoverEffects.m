@implementation BCCoverEffects

+ (id)sharedInstance
{
  if (qword_30DBC0 != -1)
    dispatch_once(&qword_30DBC0, &stru_290058);
  return (id)qword_30DBB8;
}

@end
