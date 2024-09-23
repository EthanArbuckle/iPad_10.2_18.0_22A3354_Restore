@implementation SearchUICalculatorCompletion

+ (BOOL)supportsResult:(id)a3 cardSection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "richSubtitleForResult:cardSection:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "applicationBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.calculation")) & 1) != 0)
  {
    v9 = objc_msgSend(v7, "length") != 0;
  }
  else
  {
    objc_msgSend(v5, "applicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.calculator")))
      v9 = objc_msgSend(v7, "length") != 0;
    else
      v9 = 0;

  }
  return v9;
}

- (void)updateFields
{
  void *v3;
  const __CFString *v4;
  id v5;

  -[SearchUICalculatorCompletion copyableString](self, "copyableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICompletion setExtensionString:](self, "setExtensionString:", v3);

  -[SearchUICompletion typedString](self, "typedString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (+[SearchUIUtilities stringHasRegexMatch:regex:](SearchUIUtilities, "stringHasRegexMatch:regex:", v5, CFSTR("[=＝]\\s*$")))
  {
    v4 = &stru_1EA1FB118;
  }
  else
  {
    v4 = CFSTR(" = ");
  }
  -[SearchUICompletion setBridgeString:](self, "setBridgeString:", v4);

}

- (id)copyableString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[SearchUICompletion result](self, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUICompletion cardSection](self, "cardSection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "richSubtitleForResult:cardSection:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)richSubtitleForResult:(id)a3 cardSection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v6;
  if (!v7)
  {
    +[SearchUIUtilities cardSectionsForRenderingResult:](SearchUIUtilities, "cardSectionsForRenderingResult:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v8 = v11;

  }
  objc_msgSend(v8, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
