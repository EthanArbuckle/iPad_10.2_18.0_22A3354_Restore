@implementation NSArray(Random)

- (id)randomElement
{
  uint32_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "count");
  if (v2)
  {
    objc_msgSend(a1, "objectAtIndexedSubscript:", arc4random_uniform(v2));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

@end
