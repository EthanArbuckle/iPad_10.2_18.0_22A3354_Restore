@implementation NSString

void __70__NSString_TRI__triSanitizedPathComponentWithMaxLength_addHash_error___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)MEMORY[0x1A1AC6B8C]();
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.-_"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_13;
  _MergedGlobals_13 = v2;

  objc_autoreleasePoolPop(v0);
}

@end
