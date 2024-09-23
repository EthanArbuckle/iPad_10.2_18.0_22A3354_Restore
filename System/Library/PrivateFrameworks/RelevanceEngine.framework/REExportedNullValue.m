@implementation REExportedNullValue

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_32);
  return (id)sharedInstance_Null;
}

void __37__REExportedNullValue_sharedInstance__block_invoke()
{
  REExportedNullValue *v0;
  void *v1;

  v0 = objc_alloc_init(REExportedNullValue);
  v1 = (void *)sharedInstance_Null;
  sharedInstance_Null = (uint64_t)v0;

}

- (unint64_t)type
{
  return 6;
}

@end
