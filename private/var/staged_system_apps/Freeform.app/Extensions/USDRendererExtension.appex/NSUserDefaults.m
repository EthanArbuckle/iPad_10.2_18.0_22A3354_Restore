@implementation NSUserDefaults

+ (void)crl_registerDefaults
{
  if (qword_100085B30[0] != -1)
    dispatch_once(qword_100085B30, &stru_100071D70);
}

@end
