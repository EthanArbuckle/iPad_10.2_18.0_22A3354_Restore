@implementation NSMutableArray(TVPlaybackAdditions)

- (unint64_t)tvp_shuffle
{
  unint64_t result;
  unint64_t v3;

  result = objc_msgSend(a1, "count");
  if (result >= 2)
  {
    v3 = result - 1;
    do
    {
      result = objc_msgSend(a1, "exchangeObjectAtIndex:withObjectAtIndex:", arc4random() % v3, v3);
      --v3;
    }
    while (v3);
  }
  return result;
}

- (void)tvp_addObjectIfNotNil:()TVPlaybackAdditions
{
  if (a3)
    return (void *)objc_msgSend(a1, "addObject:");
  return a1;
}

@end
