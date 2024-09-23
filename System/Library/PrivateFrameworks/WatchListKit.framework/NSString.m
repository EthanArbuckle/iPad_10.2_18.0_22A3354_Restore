@implementation NSString

void __62__NSString_WLKAdditions__wlk_stringByAppendingPathComponents___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("/"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)wlk_stringByAppendingPathComponents___slash;
  wlk_stringByAppendingPathComponents___slash = v0;

}

@end
