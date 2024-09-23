@implementation NSDictionary(RTExtensions)

- (id)objectForKey:()RTExtensions defaultObject:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  objc_msgSend(a1, "objectForKey:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

@end
