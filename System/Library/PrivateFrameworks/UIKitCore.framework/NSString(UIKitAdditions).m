@implementation NSString(UIKitAdditions)

- (id)_uikit_unescapedQueryValue
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "stringByRemovingPercentEncoding");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("+"), CFSTR(" "), 2, 0, objc_msgSend(v2, "length"));
  return v2;
}

- (id)queryKeysAndValues
{
  int v2;
  void *v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v2 = objc_msgSend(a1, "length");
  v3 = 0;
  v4 = v2;
  if (v2)
  {
    v5 = v2 - 1;
    if (v2 != 1)
    {
      v3 = 0;
      v6 = 0;
      do
      {
        v7 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("="), 2, v6);
        v8 = (v7 + 1);
        if (v7 == 0x7FFFFFFFFFFFFFFFLL || v8 > v5)
          break;
        v10 = (v4 - v8);
        v11 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR("&"), 2, v8, v10);
        v12 = v11;
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          v10 = v11 - v8;
        v13 = v7 - v6;
        if (v13 && v10)
        {
          if (!v3)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v3 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(a1, "substringWithRange:", v6, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "lowercaseString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(a1, "substringWithRange:", v8, v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "_uikit_unescapedQueryValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "length") && objc_msgSend(v17, "length"))
            objc_msgSend(v3, "setObject:forKey:", v17, v15);

        }
        if (v12 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v6 = (v12 + 1);
      }
      while (v6 < v5);
    }
  }
  return v3;
}

@end
