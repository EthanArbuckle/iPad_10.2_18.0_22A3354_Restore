@implementation NSLocale(TVPlaybackAdditions)

- (id)tvp_subtitleLanguageCode
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:", *MEMORY[0x24BDBCB40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  if (objc_msgSend(v2, "length"))
    objc_msgSend(v4, "addObject:", v2);
  if (objc_msgSend(v3, "length"))
    objc_msgSend(v4, "addObject:", v3);
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("-"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
