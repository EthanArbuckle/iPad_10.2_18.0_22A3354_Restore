@implementation TVRemoteAlertVisualStyleProviding

+ (id)visualStyleForIdiom:(int64_t)a3
{
  __objc2_class **v3;

  v3 = off_24DE2B978;
  if (a3 != 1)
    v3 = &off_24DE2B980;
  return objc_alloc_init(*v3);
}

@end
