@implementation NSDictionary(SFUJsonAdditions)

- (uint64_t)appendJsonStringToString:()SFUJsonAdditions
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  objc_msgSend(a3, "appendString:", CFSTR("{"));
  v5 = (void *)objc_msgSend(a1, "keyEnumerator");
  v6 = objc_msgSend(a1, "count");
  v7 = objc_msgSend(v5, "nextObject");
  if (v7)
  {
    v8 = (void *)v7;
    v9 = 1;
    do
    {
      objc_msgSend(v8, "appendJsonStringToString:", a3);
      objc_msgSend(a3, "appendString:", CFSTR(":"));
      objc_msgSend((id)objc_msgSend(a1, "objectForKey:", v8), "appendJsonStringToString:", a3);
      if (v9 < v6)
        objc_msgSend(a3, "appendString:", CFSTR(","));
      v8 = (void *)objc_msgSend(v5, "nextObject");
      ++v9;
    }
    while (v8);
  }
  return objc_msgSend(a3, "appendString:", CFSTR("}"));
}

@end
