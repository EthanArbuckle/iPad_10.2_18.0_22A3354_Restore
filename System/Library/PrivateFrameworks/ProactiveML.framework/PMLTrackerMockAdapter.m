@implementation PMLTrackerMockAdapter

- (PMLTrackerMockAdapter)init
{
  PMLTrackerMockAdapter *v2;
  uint64_t v3;
  NSMutableArray *trackedMessages;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PMLTrackerMockAdapter;
  v2 = -[PMLTrackerMockAdapter init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    trackedMessages = v2->_trackedMessages;
    v2->_trackedMessages = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)postMetricId:(unsigned int)a3 message:(id)a4
{
  -[NSMutableArray addObject:](self->_trackedMessages, "addObject:", a4);
}

- (void)clearAllTrackedMessages
{
  -[NSMutableArray removeAllObjects](self->_trackedMessages, "removeAllObjects");
}

- (id)trackedMessagesByClass:(Class)a3
{
  void *v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_trackedMessages;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v4, "addObject:", v10, (_QWORD)v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedMessages, 0);
}

@end
