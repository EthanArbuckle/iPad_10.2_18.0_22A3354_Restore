@implementation NavSteppingSignLayout

+ (id)sharedSteppingSignLayout
{
  if (qword_1014D4188 != -1)
    dispatch_once(&qword_1014D4188, &stru_1011E70D0);
  return (id)qword_1014D4180;
}

- (double)shieldViewTopMarginForSign:(id)a3
{
  return 13.0;
}

@end
