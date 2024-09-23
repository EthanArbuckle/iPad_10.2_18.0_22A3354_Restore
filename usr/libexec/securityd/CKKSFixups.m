@implementation CKKSFixups

+ (id)fixupOperation:(unint64_t)a3
{
  __CFString **v3;

  if (!a3)
  {
    v3 = off_1002E9490;
    return *v3;
  }
  if (a3 != 5)
  {
    if (a3 == 1)
    {
      v3 = off_1002E9498;
      return *v3;
    }
    if (a3 < 3)
    {
      v3 = off_1002E94A0;
      return *v3;
    }
    if (a3 == 3)
    {
      v3 = off_1002E94A8;
      return *v3;
    }
    if (a3 <= 4)
    {
      v3 = off_1002E94B0;
      return *v3;
    }
  }
  return 0;
}

@end
