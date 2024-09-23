@implementation WebBookmarkSecondaryCollection

+ (id)_syncLockFileName
{
  return CFSTR("com.apple.SecondaryBookmarks.lock");
}

- (id)initSecondarySafariBookmarkCollectionWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WBCollectionConfiguration *v9;
  WebBookmarkSecondaryCollection *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "safariDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.db"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByResolvingSymlinksInPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[WBCollectionConfiguration initWithCollectionType:databasePath:readonly:]([WBCollectionConfiguration alloc], "initWithCollectionType:databasePath:readonly:", 0, v8, 0);
  v12.receiver = self;
  v12.super_class = (Class)WebBookmarkSecondaryCollection;
  v10 = -[WebBookmarkCollection initWithConfiguration:](&v12, sel_initWithConfiguration_, v9);

  return v10;
}

- (BOOL)_primaryCollection
{
  return 0;
}

@end
