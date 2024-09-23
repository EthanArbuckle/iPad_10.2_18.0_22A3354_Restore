@implementation UISmallerThanLargeContentSizeCategories

uint64_t ____UISmallerThanLargeContentSizeCategories_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v1 = (void *)qword_1EDDC84D8;
  qword_1EDDC84D8 = (uint64_t)v0;

  objc_msgSend((id)qword_1EDDC84D8, "addObject:", CFSTR("UICTContentSizeCategoryXS"));
  objc_msgSend((id)qword_1EDDC84D8, "addObject:", CFSTR("UICTContentSizeCategoryS"));
  return objc_msgSend((id)qword_1EDDC84D8, "addObject:", CFSTR("UICTContentSizeCategoryM"));
}

@end
