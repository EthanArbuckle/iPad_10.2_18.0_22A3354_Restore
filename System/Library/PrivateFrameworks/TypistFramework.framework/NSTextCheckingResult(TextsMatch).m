@implementation NSTextCheckingResult(TextsMatch)

+ (id)matchText:()TextsMatch withPattern:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v5 = (void *)MEMORY[0x24BDD1798];
  v10 = 0;
  v6 = a3;
  objc_msgSend(v5, "regularExpressionWithPattern:options:error:", a4, 0, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
