@implementation ICTagOperatorItemIdentifier

void __51__ICTagOperatorItemIdentifier_sharedItemIdentifier__block_invoke()
{
  ICTagOperatorItemIdentifier *v0;
  void *v1;

  v0 = objc_alloc_init(ICTagOperatorItemIdentifier);
  v1 = (void *)sharedItemIdentifier_itemIdentifier;
  sharedItemIdentifier_itemIdentifier = (uint64_t)v0;

}

+ (ICTagOperatorItemIdentifier)sharedItemIdentifier
{
  if (sharedItemIdentifier_onceToken != -1)
    dispatch_once(&sharedItemIdentifier_onceToken, &__block_literal_global_38);
  return (ICTagOperatorItemIdentifier *)(id)sharedItemIdentifier_itemIdentifier;
}

@end
