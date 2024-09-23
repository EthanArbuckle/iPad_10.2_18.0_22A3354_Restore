@implementation UIContentUnavailableConstants_Pad

+ (id)sharedConstants
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedConstants___sharedConstants_91;
  if (!sharedConstants___sharedConstants_91)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_91;
    sharedConstants___sharedConstants_91 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_91;
  }
  return v3;
}

@end
