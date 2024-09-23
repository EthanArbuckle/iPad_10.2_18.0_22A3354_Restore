@implementation UIContentUnavailableConstants_CarPlay

+ (id)sharedConstants
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedConstants___sharedConstants_99;
  if (!sharedConstants___sharedConstants_99)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_99;
    sharedConstants___sharedConstants_99 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_99;
  }
  return v3;
}

@end
