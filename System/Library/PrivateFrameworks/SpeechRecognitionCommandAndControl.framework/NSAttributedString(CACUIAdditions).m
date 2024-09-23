@implementation NSAttributedString(CACUIAdditions)

- (id)stringByReplacingNewLinesWithSymbols
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v1, "mutableString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mutableString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByReplacingNewLinesWithSymbols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setString:", v4);

  return v1;
}

@end
