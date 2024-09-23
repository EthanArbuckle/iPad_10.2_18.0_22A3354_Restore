@implementation ICTagContainerItemIdentifier

+ (ICTagContainerItemIdentifier)sharedItemIdentifier
{
  if (sharedItemIdentifier_onceToken_1 != -1)
    dispatch_once(&sharedItemIdentifier_onceToken_1, &__block_literal_global_86);
  return (ICTagContainerItemIdentifier *)(id)sharedItemIdentifier_itemIdentifier_1;
}

void __52__ICTagContainerItemIdentifier_sharedItemIdentifier__block_invoke()
{
  ICTagContainerItemIdentifier *v0;
  void *v1;

  v0 = objc_alloc_init(ICTagContainerItemIdentifier);
  v1 = (void *)sharedItemIdentifier_itemIdentifier_1;
  sharedItemIdentifier_itemIdentifier_1 = (uint64_t)v0;

}

@end
