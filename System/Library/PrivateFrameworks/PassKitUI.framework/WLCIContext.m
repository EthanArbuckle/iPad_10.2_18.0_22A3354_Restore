@implementation WLCIContext

void __WLCIContext_block_invoke()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = PKColorSpaceStandardRGB();
  v1 = objc_alloc(MEMORY[0x1E0C99D80]);
  v4 = (id)objc_msgSend(v1, "initWithObjectsAndKeys:", v0, *MEMORY[0x1E0C9DF90], 0);
  objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", v4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_674;
  _MergedGlobals_674 = v2;

}

@end
