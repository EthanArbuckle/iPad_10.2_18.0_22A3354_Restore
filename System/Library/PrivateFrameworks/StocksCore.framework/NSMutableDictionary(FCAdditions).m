@implementation NSMutableDictionary(FCAdditions)

- (void)scw_safelySetObjectAllowingNil:()FCAdditions forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v6)
  {
    if (v7)
      objc_msgSend(a1, "setObject:forKey:", v7, v6);
    else
      objc_msgSend(a1, "removeObjectForKey:", v6);
  }

}

@end
