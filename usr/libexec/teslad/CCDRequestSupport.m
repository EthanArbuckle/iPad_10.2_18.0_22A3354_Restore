@implementation CCDRequestSupport

+ (id)userAgentString
{
  if (qword_100021638 != -1)
    dispatch_once(&qword_100021638, &stru_100018A28);
  return (id)qword_100021630;
}

@end
