@implementation NSCharacterSet

void __66__NSCharacterSet_PhotosUICore__px_breakableWhitespaceCharacterSet__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR(" "));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)px_breakableWhitespaceCharacterSet_breakableWhitespaceCharacterSet;
  px_breakableWhitespaceCharacterSet_breakableWhitespaceCharacterSet = v1;

}

@end
