@implementation NSMutableDictionary(EMBordersPropertyCache)

- (id)addToCacheAndReturnCssString:()EMBordersPropertyCache
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "cssString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKey:", v5, v4);
  }

  return v5;
}

@end
