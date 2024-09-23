@implementation PFStoryColorGradeSupportedCategories

void __PFStoryColorGradeSupportedCategories_block_invoke()
{
  uint64_t i;
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 13);
  for (i = 0; i != 312; i += 24)
    objc_msgSend(v3, "addObject:", *(__CFString **)((char *)&Vertices_9814 + i));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)PFStoryColorGradeSupportedCategories_supportedCategories;
  PFStoryColorGradeSupportedCategories_supportedCategories = v1;

}

@end
