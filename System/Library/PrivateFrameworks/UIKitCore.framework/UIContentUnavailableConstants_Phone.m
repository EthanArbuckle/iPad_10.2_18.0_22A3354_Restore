@implementation UIContentUnavailableConstants_Phone

+ (id)sharedConstants
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedConstants___sharedConstants_5;
  if (!sharedConstants___sharedConstants_5)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedConstants___sharedConstants_5;
    sharedConstants___sharedConstants_5 = (uint64_t)v4;

    v3 = (void *)sharedConstants___sharedConstants_5;
  }
  return v3;
}

@end
