@implementation PFStoryTitleSupportedCategories

void __PFStoryTitleSupportedCategories_block_invoke()
{
  uint64_t i;
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 6);
  for (i = 0; i != 6; ++i)
    objc_msgSend(v3, "addObject:", Vertices[i]);
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)PFStoryTitleSupportedCategories_supportedCategories;
  PFStoryTitleSupportedCategories_supportedCategories = v1;

}

@end
