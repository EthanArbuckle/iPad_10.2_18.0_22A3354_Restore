@implementation TCDumpSettings

+ (void)setDumpForQA:(BOOL)a3
{
  sIsDumpForQA = a3;
}

+ (BOOL)isDumpForQA
{
  return sIsDumpForQA;
}

@end
