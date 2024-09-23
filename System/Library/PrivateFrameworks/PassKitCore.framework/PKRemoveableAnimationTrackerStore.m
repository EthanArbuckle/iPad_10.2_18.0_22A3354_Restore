@implementation PKRemoveableAnimationTrackerStore

- (PKRemoveableAnimationTrackerStore)init
{
  PKRemoveableAnimationTrackerStore *v2;
  NSMutableArray *v3;
  NSMutableArray *trackers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKRemoveableAnimationTrackerStore;
  v2 = -[PKRemoveableAnimationTrackerStore init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    trackers = v2->_trackers;
    v2->_trackers = v3;

  }
  return v2;
}

- (void)preempt
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v2 = self->_trackers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (!v3)
  {
LABEL_23:

    return;
  }
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v18 != v6)
        objc_enumerationMutation(v2);
      v8 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
      if (v8 && !*(_BYTE *)(v8 + 11) && !*(_BYTE *)(v8 + 8))
      {
        if (!v5)
          v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v5, "addObject:", v8);
      }
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  }
  while (v4);

  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v2 = (NSMutableArray *)v5;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v2);
          -[PKRemoveableAnimationTracker _preempt](*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * j));
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
      }
      while (v10);
    }

    goto LABEL_23;
  }
}

- (void)remove
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self && -[NSMutableArray count](self->_trackers, "count"))
    v3 = (void *)-[NSMutableArray copy](self->_trackers, "copy");
  else
    v3 = 0;
  -[NSMutableArray removeAllObjects](self->_trackers, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if (v9)
          *(_BYTE *)(v9 + 10) = 0;
        -[PKRemoveableAnimationTracker _remove](v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (NSArray)trackers
{
  PKRemoveableAnimationTrackerStore *v2;

  if (self)
  {
    v2 = self;
    self = (PKRemoveableAnimationTrackerStore *)-[NSMutableArray count](self->_trackers, "count");
    if (self)
      self = (PKRemoveableAnimationTrackerStore *)-[NSMutableArray copy](v2->_trackers, "copy");
  }
  return (NSArray *)self;
}

- (void)setTrackers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackers, 0);
}

@end
