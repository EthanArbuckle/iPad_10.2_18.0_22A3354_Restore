@implementation NSString(CIMCandidateController)

- (uint64_t)chinesePinyinCompare:()CIMCandidateController
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  GetCurrentLocale();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "compare:options:range:locale:", v4, 512, 0, v5, v6);

  return v7;
}

- (uint64_t)traditionalChineseZhuyinCompare:()CIMCandidateController
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  int v18;
  unsigned int v19;
  uint64_t v20;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  GetCurrentLocale();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "compare:options:range:locale:", v4, 512, 0, v5, v6);

  v8 = objc_msgSend(a1, "length");
  if (v8)
  {
    v9 = v8;
    if (v8 == objc_msgSend(v4, "length"))
    {
      v10 = v9 - 1;
      objc_msgSend(a1, "substringToIndex:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "substringToIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v13)
      {
        objc_msgSend(a1, "substringFromIndex:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "substringFromIndex:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0;
        do
        {
          v17 = kZhuyinToneMarks[v16];
          v18 = -[__CFString isEqualToString:](v17, "isEqualToString:", v14);
          v19 = -[__CFString isEqualToString:](v17, "isEqualToString:", v15);
          if (v19)
            v20 = 1;
          else
            v20 = v7;
          if (v18)
            v7 = (v18 & v19) - 1;
          else
            v7 = v20;
          if ((v18 & 1) != 0)
            break;
          if ((v19 & 1) != 0)
            break;
        }
        while (v16++ != 4);

      }
    }
  }

  return v7;
}

@end
