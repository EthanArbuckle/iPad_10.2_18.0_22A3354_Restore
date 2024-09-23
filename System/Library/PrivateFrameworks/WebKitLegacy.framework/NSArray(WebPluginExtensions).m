@implementation NSArray(WebPluginExtensions)

- (void)_web_lowercaseStrings
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v3 = (void *)objc_msgSend(a1, "objectEnumerator");
  v4 = objc_msgSend(v3, "nextObject");
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v2, "addObject:", objc_msgSend(v5, "lowercaseString"));
      v5 = (void *)objc_msgSend(v3, "nextObject");
    }
    while (v5);
  }
  return v2;
}

@end
