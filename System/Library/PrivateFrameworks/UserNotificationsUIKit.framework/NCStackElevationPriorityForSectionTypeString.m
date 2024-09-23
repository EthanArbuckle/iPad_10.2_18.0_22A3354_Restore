@implementation NCStackElevationPriorityForSectionTypeString

void __NCStackElevationPriorityForSectionTypeString_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = (void *)MEMORY[0x1E0C99E40];
  NCNotificationListSectionTypeString(0xAuLL);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NCNotificationListSectionTypeString(2uLL);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  NCNotificationListSectionTypeString(3uLL);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NCNotificationListSectionTypeString(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "orderedSetWithObjects:", v6, v1, v2, v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)NCStackElevationPriorityForSectionTypeString_sectionTypeOrderedSet;
  NCStackElevationPriorityForSectionTypeString_sectionTypeOrderedSet = v4;

}

@end
