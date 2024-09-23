@implementation PXViewSpecOptionsWithTitleFontName

void __PXViewSpecOptionsWithTitleFontName_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PXViewSpecOptionsTitleFontNames;
  PXViewSpecOptionsTitleFontNames = v0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)PXViewSpecOptionsTitleFontNameIndexes;
  PXViewSpecOptionsTitleFontNameIndexes = v2;

}

@end
