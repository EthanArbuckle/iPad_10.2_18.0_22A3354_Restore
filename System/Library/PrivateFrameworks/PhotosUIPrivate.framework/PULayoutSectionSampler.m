@implementation PULayoutSectionSampler

- (int64_t)indexForUnsampledIndex:(int64_t)a3 isMainItem:(BOOL *)a4
{
  int64_t result;

  result = a3;
  if (a4)
    *a4 = 1;
  return result;
}

- (int64_t)unsampledIndexForIndex:(int64_t)a3
{
  return a3;
}

- (void)enumerateUnsampledIndexesForSampledIndexInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger location;
  NSUInteger v6;
  BOOL v7;
  char v8;

  v8 = 0;
  if ((uint64_t)a3.location < (int64_t)(a3.location + a3.length))
  {
    location = a3.location;
    v6 = a3.length - 1;
    do
    {
      (*((void (**)(id, NSUInteger, NSUInteger, char *))a4 + 2))(a4, location, location, &v8);
      ++location;
      if (v8)
        v7 = 1;
      else
        v7 = v6 == 0;
      --v6;
    }
    while (!v7);
  }
}

- (void)dumpInternalMemory
{
  NSLog(CFSTR("no internal memory"), a2);
}

@end
