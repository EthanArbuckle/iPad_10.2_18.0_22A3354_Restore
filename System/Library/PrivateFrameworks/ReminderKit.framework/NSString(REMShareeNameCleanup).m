@implementation NSString(REMShareeNameCleanup)

- (id)rem_tidyFormattedNameString
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

@end
