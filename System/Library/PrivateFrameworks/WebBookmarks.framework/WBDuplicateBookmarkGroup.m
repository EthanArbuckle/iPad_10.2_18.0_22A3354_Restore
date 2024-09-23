@implementation WBDuplicateBookmarkGroup

- (WBDuplicateBookmarkGroup)initWithOriginalBookmark:(id)a3
{
  id v5;
  WBDuplicateBookmarkGroup *v6;
  uint64_t v7;
  NSMutableArray *dupicateBookmarks;
  uint64_t v9;
  NSMutableArray *dupicateBookmarksToKeep;
  WBDuplicateBookmarkGroup *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WBDuplicateBookmarkGroup;
  v6 = -[WBDuplicateBookmarkGroup init](&v13, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    dupicateBookmarks = v6->_dupicateBookmarks;
    v6->_dupicateBookmarks = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    dupicateBookmarksToKeep = v6->_dupicateBookmarksToKeep;
    v6->_dupicateBookmarksToKeep = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v6->_originalBookmark, a3);
    v11 = v6;
  }

  return v6;
}

- (NSArray)duplicates
{
  return (NSArray *)self->_dupicateBookmarks;
}

- (NSArray)duplicatesToKeep
{
  return (NSArray *)self->_dupicateBookmarksToKeep;
}

- (void)addDuplicateBookmark:(id)a3 replaceOriginal:(BOOL)a4
{
  id v7;
  NSMutableArray *dupicateBookmarks;
  id v9;

  v7 = a3;
  self->_foundDuplicates = 1;
  dupicateBookmarks = self->_dupicateBookmarks;
  v9 = v7;
  if (a4)
  {
    -[NSMutableArray addObject:](dupicateBookmarks, "addObject:", self->_originalBookmark);
    objc_storeStrong((id *)&self->_originalBookmark, a3);
  }
  else
  {
    -[NSMutableArray addObject:](dupicateBookmarks, "addObject:", v7);
  }

}

- (void)addDuplicateBookmarkToKeep:(id)a3
{
  -[NSMutableArray addObject:](self->_dupicateBookmarksToKeep, "addObject:", a3);
}

- (void)exchangeOriginalBookmarkWithBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_originalBookmark, a3);
}

- (void)removeAllDuplicates
{
  -[NSMutableArray removeAllObjects](self->_dupicateBookmarks, "removeAllObjects");
}

- (WebBookmark)originalBookmark
{
  return self->_originalBookmark;
}

- (BOOL)foundDuplicates
{
  return self->_foundDuplicates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalBookmark, 0);
  objc_storeStrong((id *)&self->_dupicateBookmarksToKeep, 0);
  objc_storeStrong((id *)&self->_dupicateBookmarks, 0);
}

@end
