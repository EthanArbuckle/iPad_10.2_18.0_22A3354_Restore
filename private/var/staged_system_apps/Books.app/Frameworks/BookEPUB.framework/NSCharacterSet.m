@implementation NSCharacterSet

+ (id)be_allowedURLPathCharacterSet
{
  if (qword_3C1AD8 != -1)
    dispatch_once(&qword_3C1AD8, &stru_3781A8);
  return (id)qword_3C1AD0;
}

@end
