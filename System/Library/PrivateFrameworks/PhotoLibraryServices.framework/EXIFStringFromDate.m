@implementation EXIFStringFromDate

void __EXIFStringFromDate_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = (void *)EXIFStringFromDate_pl_once_object_20;
  EXIFStringFromDate_pl_once_object_20 = v1;

}

@end
