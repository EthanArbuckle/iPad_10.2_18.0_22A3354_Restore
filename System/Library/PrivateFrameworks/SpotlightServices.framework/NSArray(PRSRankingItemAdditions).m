@implementation NSArray(PRSRankingItemAdditions)

- (id)stringRepresentation
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  void *v5;

  v2 = objc_msgSend(a1, "count");
  v3 = (void *)objc_opt_new();
  if (v2)
  {
    for (i = 0; i != v2; ++i)
    {
      objc_msgSend(a1, "objectAtIndex:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v5);

      objc_msgSend(v3, "appendString:", CFSTR(" "));
    }
  }
  return v3;
}

@end
