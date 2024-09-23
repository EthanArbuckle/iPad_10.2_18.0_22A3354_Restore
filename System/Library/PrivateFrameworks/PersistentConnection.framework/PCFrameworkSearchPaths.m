@implementation PCFrameworkSearchPaths

void ___PCFrameworkSearchPaths_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("/System/Library/Frameworks"), CFSTR("/System/Library/PrivateFrameworks"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_PCFrameworkSearchPaths_paths;
  _PCFrameworkSearchPaths_paths = v0;

}

@end
