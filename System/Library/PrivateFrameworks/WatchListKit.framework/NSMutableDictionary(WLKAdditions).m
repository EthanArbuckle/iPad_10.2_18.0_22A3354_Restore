@implementation NSMutableDictionary(WLKAdditions)

- (void)wlk_setObjectUnlessNil:()WLKAdditions forKey:
{
  if (a3)
    return (void *)objc_msgSend(a1, "setObject:forKey:");
  return a1;
}

- (void)wlk_setObjectUnlessNilOrEmpty:()WLKAdditions forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v7, "count"))
    objc_msgSend(a1, "setObject:forKey:", v7, v6);

}

@end
