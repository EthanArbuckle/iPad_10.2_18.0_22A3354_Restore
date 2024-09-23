@implementation NSString(TokenMatch)

- (uint64_t)tokenMatch:()TokenMatch
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a1, "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hasPrefix:", v6);

  if (v7)
  {
    v8 = objc_msgSend(a1, "length");
    if (v8 == objc_msgSend(v4, "length"))
      v9 = 2;
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
