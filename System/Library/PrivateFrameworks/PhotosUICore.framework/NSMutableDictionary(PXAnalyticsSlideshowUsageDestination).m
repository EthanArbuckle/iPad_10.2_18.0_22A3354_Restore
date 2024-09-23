@implementation NSMutableDictionary(PXAnalyticsSlideshowUsageDestination)

- (void)_px_transformExistingValueForKey:()PXAnalyticsSlideshowUsageDestination usingBlock:
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  objc_msgSend(a1, "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v6[2](v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v8, v9);

  }
}

@end
