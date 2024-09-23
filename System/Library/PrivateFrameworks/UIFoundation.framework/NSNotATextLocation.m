@implementation NSNotATextLocation

+ (id)notATextLocation
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__NSNotATextLocation_notATextLocation__block_invoke;
  block[3] = &unk_1E2602FF0;
  block[4] = a1;
  if (notATextLocation_onceToken != -1)
    dispatch_once(&notATextLocation_onceToken, block);
  return (id)notATextLocation_notATextLocation;
}

id __38__NSNotATextLocation_notATextLocation__block_invoke()
{
  id result;

  result = objc_alloc_init((Class)objc_opt_class());
  notATextLocation_notATextLocation = (uint64_t)result;
  return result;
}

- (int64_t)compare:(id)a3
{
  return -1;
}

@end
