@implementation ICTagNewTagItemIdentifier

+ (ICTagNewTagItemIdentifier)sharedItemIdentifier
{
  if (sharedItemIdentifier_onceToken_0 != -1)
    dispatch_once(&sharedItemIdentifier_onceToken_0, &__block_literal_global_42);
  return (ICTagNewTagItemIdentifier *)(id)sharedItemIdentifier_itemIdentifier_0;
}

void __49__ICTagNewTagItemIdentifier_sharedItemIdentifier__block_invoke()
{
  ICTagNewTagItemIdentifier *v0;
  void *v1;

  v0 = objc_alloc_init(ICTagNewTagItemIdentifier);
  v1 = (void *)sharedItemIdentifier_itemIdentifier_0;
  sharedItemIdentifier_itemIdentifier_0 = (uint64_t)v0;

}

@end
