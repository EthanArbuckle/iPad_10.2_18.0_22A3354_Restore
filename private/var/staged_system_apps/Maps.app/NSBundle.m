@implementation NSBundle

+ (id)mapsInternalExtrasBundle
{
  if (qword_1014D4230 != -1)
    dispatch_once(&qword_1014D4230, &stru_1011E7280);
  return (id)qword_1014D4238;
}

@end
