@implementation ICTagAllTagsItemIdentifier

+ (ICTagAllTagsItemIdentifier)sharedItemIdentifier
{
  if (sharedItemIdentifier_onceToken_2 != -1)
    dispatch_once(&sharedItemIdentifier_onceToken_2, &__block_literal_global_89);
  return (ICTagAllTagsItemIdentifier *)(id)sharedItemIdentifier_itemIdentifier_2;
}

void __50__ICTagAllTagsItemIdentifier_sharedItemIdentifier__block_invoke()
{
  ICTagAllTagsItemIdentifier *v0;
  void *v1;

  v0 = objc_alloc_init(ICTagAllTagsItemIdentifier);
  v1 = (void *)sharedItemIdentifier_itemIdentifier_2;
  sharedItemIdentifier_itemIdentifier_2 = (uint64_t)v0;

}

+ (NSString)archiveIdentifier
{
  return (NSString *)CFSTR("AllTags");
}

+ (NSString)displayText
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("All Tags"), CFSTR("All Tags"), 0, 1);
}

@end
