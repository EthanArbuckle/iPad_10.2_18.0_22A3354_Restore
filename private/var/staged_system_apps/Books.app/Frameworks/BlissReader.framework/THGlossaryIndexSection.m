@implementation THGlossaryIndexSection

- (THGlossaryIndexSection)initWithSectionTitle:(id)a3 andEntry:(id)a4
{
  THGlossaryIndexSection *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THGlossaryIndexSection;
  v6 = -[THGlossaryIndexSection init](&v8, "init");
  if (v6)
  {
    v6->mSectionTitle = (NSString *)objc_msgSend(a3, "copy");
    v6->mEntries = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", a4, 0);
    v6->mEntriesNeedSorting = 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->mSectionTitle = 0;
  self->mEntries = 0;
  v3.receiver = self;
  v3.super_class = (Class)THGlossaryIndexSection;
  -[THGlossaryIndexSection dealloc](&v3, "dealloc");
}

- (int64_t)compare:(id)a3
{
  return -[NSString localizedCaseInsensitiveCompare:](self->mSectionTitle, "localizedCaseInsensitiveCompare:", objc_msgSend(a3, "sectionTitle"));
}

- (void)addEntry:(id)a3
{
  -[NSMutableArray addObject:](self->mEntries, "addObject:", a3);
  self->mEntriesNeedSorting = 1;
}

- (id)entryAtIndex:(int64_t)a3
{
  if (self->mEntriesNeedSorting)
  {
    -[NSMutableArray sortUsingFunction:context:](self->mEntries, "sortUsingFunction:context:", sub_AF690, 0);
    self->mEntriesNeedSorting = 0;
  }
  return -[NSMutableArray objectAtIndex:](self->mEntries, "objectAtIndex:", a3);
}

- (int64_t)indexForEntry:(id)a3
{
  NSMutableArray *mEntries;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mEntries = self->mEntries;
  v5 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](mEntries, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      v10 = &v6[(_QWORD)v7];
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(mEntries);
        if (*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9) == a3)
          return (int64_t)&v9[(_QWORD)v7];
        ++v9;
      }
      while (v6 != v9);
      v6 = (char *)-[NSMutableArray countByEnumeratingWithState:objects:count:](mEntries, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)entryCount
{
  return (int64_t)-[NSMutableArray count](self->mEntries, "count");
}

- (NSArray)entries
{
  if (self->mEntriesNeedSorting)
  {
    -[NSMutableArray sortUsingFunction:context:](self->mEntries, "sortUsingFunction:context:", sub_AF690, 0);
    self->mEntriesNeedSorting = 0;
  }
  return +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", self->mEntries);
}

- (NSString)sectionTitle
{
  return self->mSectionTitle;
}

- (int64_t)sectionIndex
{
  return self->mSectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->mSectionIndex = a3;
}

@end
