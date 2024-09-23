@implementation CRLInternalOSUtilities

+ (BOOL)isInternalOSInstall
{
  if (qword_101415268 != -1)
    dispatch_once(&qword_101415268, &stru_1012478C8);
  return byte_101415260;
}

@end
