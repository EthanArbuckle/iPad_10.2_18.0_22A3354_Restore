@implementation UIViewRetargetingAnimationDescription

+ (id)description
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__UIViewRetargetingAnimationDescription_description__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECD822D8 != -1)
    dispatch_once(&qword_1ECD822D8, block);
  return (id)_MergedGlobals_1308;
}

void __52__UIViewRetargetingAnimationDescription_description__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_1308;
  _MergedGlobals_1308 = (uint64_t)v1;

}

@end
