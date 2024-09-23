@implementation NSMutableAttributedString(SCRCMutableAttributedStringExtras)

- (uint64_t)replaceOccurrencesOfString:()SCRCMutableAttributedStringExtras withString:
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "mutableString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", v7, v6, 0, 0, objc_msgSend(v8, "length"));

  return v9;
}

- (id)attributedStringByTrimmingEmptySpaceEdges
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeOfCharacterFromSet:", v3);
  v7 = v6;

  objc_msgSend(a1, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeOfCharacterFromSet:options:", v3, 4);
  v11 = v10;

  if (v11)
    v12 = v9 + v11;
  else
    v12 = objc_msgSend(a1, "length");
  if (v7)
    v13 = v5;
  else
    v13 = 0;
  objc_msgSend(a1, "attributedSubstringFromRange:", v13, v12 - v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)appendString:()SCRCMutableAttributedStringExtras
{
  objc_class *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x24BDD1458];
    v5 = a3;
    v6 = (id)objc_msgSend([v4 alloc], "initWithString:", v5);

    objc_msgSend(a1, "appendAttributedString:", v6);
  }
}

@end
