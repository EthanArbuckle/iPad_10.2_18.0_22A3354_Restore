@implementation NSMutableDictionary(VideosUICore)

- (void)vui_setObjectIfNotNil:()VideosUICore forKey:
{
  if (a3)
  {
    if (a4)
      return (void *)objc_msgSend(a1, "setObject:forKey:");
  }
  return a1;
}

- (void)vui_setOrRemoveObject:()VideosUICore forKey:
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
