@implementation NSUserDefaults

+ (void)crl_registerDefaults
{
  if (qword_10006DAD0 != -1)
    dispatch_once(&qword_10006DAD0, &stru_100061AC8);
}

@end
