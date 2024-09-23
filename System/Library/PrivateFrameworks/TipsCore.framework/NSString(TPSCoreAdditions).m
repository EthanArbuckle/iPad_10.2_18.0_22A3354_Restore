@implementation NSString(TPSCoreAdditions)

- (uint64_t)tps_compareBuildVersionWithString:()TPSCoreAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;

  v4 = a3;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^(\\d+)([a-zA-Z]+)(\\d+)([a-zA-Z]*)$"), 0, &v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMatchInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstMatchInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "numberOfRanges");
  v9 = objc_msgSend(v7, "numberOfRanges");
  if (v8 == 5)
  {
    if (v9 == 5)
    {
      v10 = 1;
      while (1)
      {
        v11 = objc_msgSend(v6, "rangeAtIndex:", v10);
        objc_msgSend(a1, "substringWithRange:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v7, "rangeAtIndex:", v10);
        objc_msgSend(v4, "substringWithRange:", v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v13, "compare:options:", v16, 64);

        if (v17)
          break;
        if (++v10 == 4)
        {
          v18 = objc_msgSend(v6, "rangeAtIndex:", 4);
          objc_msgSend(a1, "substringWithRange:", v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v7, "rangeAtIndex:", 4);
          objc_msgSend(v4, "substringWithRange:", v21, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v20, "length");
          v25 = objc_msgSend(v23, "length");
          if (!v24 || v25)
          {
            if (v24 || !v25)
            {
              v17 = 0;
              if (v24 && v25)
                v17 = objc_msgSend(v20, "compare:options:", v23, 2);
            }
            else
            {
              v17 = -1;
            }
          }
          else
          {
            v17 = 1;
          }

          break;
        }
      }
    }
    else
    {
      v17 = -1;
    }
  }
  else if (v9 == 5)
  {
    v17 = 1;
  }
  else
  {
    v17 = objc_msgSend(a1, "compare:options:", v4, 64);
  }

  return v17;
}

@end
