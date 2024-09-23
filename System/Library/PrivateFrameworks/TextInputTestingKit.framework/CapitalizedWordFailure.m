@implementation CapitalizedWordFailure

- (BOOL)doesMatchResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "corrected");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", &stru_24FD49B78);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "intended");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", &stru_24FD49B78);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", v7) & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(v3, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (!v11)
      goto LABEL_8;
    if (v11 != 1)
    {
      objc_msgSend(v3, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "characterAtIndex:", v11 - 1);

      objc_msgSend(v3, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "characterAtIndex:", v11 - 2);

      if (v13 == 32 && v15 <= 0x3F && ((1 << v15) & 0x8000400200000000) != 0)
      {
LABEL_8:
        objc_msgSend(v9, "substringToIndex:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lowercaseString");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", 0, 1, v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v18;
      }
    }
    objc_msgSend(v9, "lowercaseString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v19, "isEqualToString:", v9) ^ 1;

  }
  return v8;
}

@end
