@implementation NSMutableArray(Shuffling)

- (unint64_t)shuffle
{
  unint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = objc_msgSend(a1, "count");
  if (result >= 2)
  {
    v3 = result;
    v4 = 0;
    do
    {
      result = objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:", v4, v4 + arc4random_uniform(v3));
      ++v4;
      --v3;
    }
    while (v3 != 1);
  }
  return result;
}

@end
