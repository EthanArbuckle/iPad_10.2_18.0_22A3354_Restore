@implementation NSString(CACUIAdditions)

- (id)stringByReplacingNewLinesWithSymbols
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("↵"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
