@implementation WFCoreDataShortcutBookmark

- (id)descriptor
{
  WFShortcutBookmarksDescriptor *v3;
  void *v4;
  void *v5;
  void *v6;
  WFShortcutBookmarksDescriptor *v7;

  v3 = [WFShortcutBookmarksDescriptor alloc];
  -[WFCoreDataShortcutBookmark identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataShortcutBookmark path](self, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFCoreDataShortcutBookmark bookmarkData](self, "bookmarkData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFShortcutBookmarksDescriptor initWithWorkflowID:path:bookmarkData:](v3, "initWithWorkflowID:path:bookmarkData:", v4, v5, v6);

  return v7;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("ShortcutBookmark"));
}

@end
