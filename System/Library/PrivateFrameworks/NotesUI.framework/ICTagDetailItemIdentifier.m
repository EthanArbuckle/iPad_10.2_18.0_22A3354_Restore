@implementation ICTagDetailItemIdentifier

+ (ICTagDetailItemIdentifier)sharedItemIdentifier
{
  if (sharedItemIdentifier_onceToken_3 != -1)
    dispatch_once(&sharedItemIdentifier_onceToken_3, &__block_literal_global_91);
  return (ICTagDetailItemIdentifier *)(id)sharedItemIdentifier_itemIdentifier_3;
}

void __49__ICTagDetailItemIdentifier_sharedItemIdentifier__block_invoke()
{
  ICTagDetailItemIdentifier *v0;
  void *v1;

  v0 = objc_alloc_init(ICTagDetailItemIdentifier);
  v1 = (void *)sharedItemIdentifier_itemIdentifier_3;
  sharedItemIdentifier_itemIdentifier_3 = (uint64_t)v0;

}

@end
