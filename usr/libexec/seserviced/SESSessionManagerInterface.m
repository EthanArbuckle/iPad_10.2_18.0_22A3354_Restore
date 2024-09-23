@implementation SESSessionManagerInterface

+ (id)interface
{
  if (qword_10034BB00 != -1)
    dispatch_once(&qword_10034BB00, &stru_1003040E0);
  return (id)qword_10034BAF8;
}

@end
