@implementation WBInMemoryChangeFilterVisible

- (id)bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet:(id)a3 inFolder:(int)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a3, "modifiedBookmarksInBookmarkFolder:", *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __96__WBInMemoryChangeFilterVisible_bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet_inFolder___block_invoke;
  v8[3] = &unk_24CB35120;
  v8[4] = self;
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet:(id)a3 inFolder:(int)a4
{
  void *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend(a3, "modifiedBookmarksInBookmarkFolder:", *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __99__WBInMemoryChangeFilterVisible_bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet_inFolder___block_invoke;
  v8[3] = &unk_24CB35120;
  v8[4] = self;
  objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isBookmarkVisible:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "extraAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("com.apple.bookmarks.OmitFromUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    LOBYTE(v6) = 0;
  else
    v6 = objc_msgSend(v3, "isHidden") ^ 1;

  return v6;
}

id __99__WBInMemoryChangeFilterVisible_bookmarkIDsModifiedInMemoryNotPassingFilterFromChangeSet_inFolder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isBookmarkVisible:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v3, "identifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id __96__WBInMemoryChangeFilterVisible_bookmarkIDsModifiedInMemoryPassingFilterFromChangeSet_inFolder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isBookmarkVisible:", v3))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v3, "identifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
