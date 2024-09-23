@implementation NSString(UserNotificationsKit)

- (__CFString)nc_stringByRemovingCharactersFromSet:()UserNotificationsKit
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  CFRange v10;

  v4 = a3;
  v5 = -[__CFString length](a1, "length");
  if (v5 << 32
    && (v10.length = (int)v5, v10.location = 0, CFStringFindCharacterFromSet(a1, (CFCharacterSetRef)v4, v10, 0, 0)))
  {
    v6 = (__CFString *)-[__CFString mutableCopy](a1, "mutableCopy");
    v7 = -[__CFString length](v6, "length");
    if (v7 - 1 >= 0)
    {
      v8 = v7;
      do
      {
        if (objc_msgSend(v4, "characterIsMember:", -[__CFString characterAtIndex:](v6, "characterAtIndex:", --v8)))-[__CFString deleteCharactersInRange:](v6, "deleteCharactersInRange:", v8, 1);
      }
      while (v8 > 0);
    }
  }
  else
  {
    v6 = a1;
  }

  return v6;
}

@end
