@implementation PXFlexMusicCurationCategories

void __PXFlexMusicCurationCategories_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  PXAllMusicCurationCategories();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  PXFilter();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithArray:", v1);
  v3 = (void *)PXFlexMusicCurationCategories_categories;
  PXFlexMusicCurationCategories_categories = v2;

}

uint64_t __PXFlexMusicCurationCategories_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("FlexMusic"));
}

@end
