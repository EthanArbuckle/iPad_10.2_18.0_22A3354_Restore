@implementation SearchUITLKConverters

+ (int64_t)colorForSFColor:(int)a3
{
  if ((a3 - 1) > 6)
    return 0;
  else
    return qword_1DAE1D448[a3 - 1];
}

@end
