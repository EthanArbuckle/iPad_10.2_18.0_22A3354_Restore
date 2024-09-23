@implementation NSURL(WFTruncatedDisplay)

- (id)wf_displayStringWithCharacterLimit:()WFTruncatedDisplay
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", a1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (v9 || v7 == 0)
  {
    objc_msgSend(a1, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "hasPrefix:", CFSTR("www.")))
    {
      objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("www."), "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHost:", v12);

    }
    objc_msgSend(v5, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "substringFromIndex:", objc_msgSend(v8, "length") + 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "hasPrefix:", CFSTR("//")))
    {
      objc_msgSend(v14, "substringFromIndex:", 2);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    if (objc_msgSend(v14, "length") > a3)
    {
      objc_msgSend(v14, "substringToIndex:", a3 - 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingString:", CFSTR("…"));
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v17;
    }
    if (v14)
    {
      v18 = v14;
    }
    else
    {
      objc_msgSend(a1, "absoluteString");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v18;

  }
  return v11;
}

@end
