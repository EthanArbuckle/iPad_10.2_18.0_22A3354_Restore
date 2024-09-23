@implementation TIRollingLog

- (TIRollingLog)initWithMaxCount:(unint64_t)a3
{
  TIRollingLog *v4;
  TIRollingLog *v5;
  uint64_t v6;
  NSMutableArray *entries;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TIRollingLog;
  v4 = -[TIRollingLog init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maxCount = a3;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a3);
    entries = v5->_entries;
    v5->_entries = (NSMutableArray *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSMutableArray copyWithZone:](self->_entries, "copyWithZone:", a3);
    v7 = (void *)v5[1];
    v5[1] = v6;

    v5[2] = self->_nextIndex;
    v5[3] = self->_count;
    v5[4] = self->_maxCount;
  }
  return v5;
}

- (void)addEntry:(id)a3
{
  unint64_t maxCount;
  unint64_t count;
  unint64_t nextIndex;
  unint64_t v7;

  if (a3)
  {
    -[NSMutableArray setObject:atIndexedSubscript:](self->_entries, "setObject:atIndexedSubscript:", a3, self->_nextIndex);
    count = self->_count;
    maxCount = self->_maxCount;
    if (count < maxCount)
      self->_count = count + 1;
    nextIndex = self->_nextIndex;
    if (nextIndex + 1 < maxCount)
      v7 = nextIndex + 1;
    else
      v7 = 0;
    self->_nextIndex = v7;
  }
}

- (void)addEntries:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[TIRollingLog addEntry:](self, "addEntry:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (NSArray)currentEntries
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableArray subarrayWithRange:](self->_entries, "subarrayWithRange:", self->_nextIndex, self->_count - self->_nextIndex);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray subarrayWithRange:](self->_entries, "subarrayWithRange:", 0, self->_nextIndex);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)maxCount
{
  return self->_maxCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
