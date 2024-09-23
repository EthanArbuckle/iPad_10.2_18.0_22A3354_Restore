@implementation PCLibrarySearchPaths

void ___PCLibrarySearchPaths_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("/usr/lib"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_PCLibrarySearchPaths_paths;
  _PCLibrarySearchPaths_paths = v0;

}

@end
