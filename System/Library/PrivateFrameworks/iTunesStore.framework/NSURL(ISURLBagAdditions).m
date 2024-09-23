@implementation NSURL(ISURLBagAdditions)

- (id)sanitizedURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BEB1FF8], "contextWithBagType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLBagForContext:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sanitizedURLForURL:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
