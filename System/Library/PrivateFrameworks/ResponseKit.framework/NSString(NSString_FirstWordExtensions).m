@implementation NSString(NSString_FirstWordExtensions)

- (id)lowercaseFirstWordString
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v3);
  v6 = v5;

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  objc_msgSend(a1, "substringWithRange:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v4, v6, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "isEqualToString:", v9))
  {

LABEL_4:
    v9 = a1;
  }
  return v9;
}

- (id)uppercaseFirstWordString
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v3);
  v6 = v5;

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_4;
  objc_msgSend(a1, "substringWithRange:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:", v4, v6, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "isEqualToString:", v9))
  {

LABEL_4:
    v9 = a1;
  }
  return v9;
}

@end
