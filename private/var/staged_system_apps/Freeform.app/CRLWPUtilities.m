@implementation CRLWPUtilities

+ (BOOL)anyInputIsNonRoman
{
  if (qword_101414F50 != -1)
    dispatch_once(&qword_101414F50, &stru_101240888);
  return byte_101414F48;
}

+ (BOOL)inputIsOnlyRoman
{
  return objc_msgSend(a1, "anyInputIsNonRoman") ^ 1;
}

@end
