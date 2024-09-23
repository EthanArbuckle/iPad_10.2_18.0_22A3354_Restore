@implementation PAAccessRecordCoalescingInWindowState

- (PAAccessRecordCoalescingInWindowState)initWithFirstAccessRecord:(id)a3 forEpoch:(int64_t)a4
{
  id v6;
  PAAccessRecordCoalescingInWindowState *v7;
  PAAccessRecordCoalescingInWindowState *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *groupedRecordsByMatcher;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PAAccessRecordCoalescingInWindowState;
  v7 = -[PAAccessRecordCoalescingInWindowState init](&v16, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_epoch = a4;
    objc_msgSend(v6, "access");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PAAccessMatcher coalescingMatcherForAccess:](PAAccessMatcher, "coalescingMatcherForAccess:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dictionaryWithObject:forKey:", v12, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    groupedRecordsByMatcher = v8->_groupedRecordsByMatcher;
    v8->_groupedRecordsByMatcher = (NSMutableDictionary *)v13;

  }
  return v8;
}

- (id)initByContinuingWindow:(id)a3 withAccessRecord:(id)a4
{
  id v6;
  id v7;
  PAAccessRecordCoalescingInWindowState *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableDictionary *groupedRecordsByMatcher;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PAAccessRecordCoalescingInWindowState;
  v8 = -[PAAccessRecordCoalescingInWindowState init](&v18, sel_init);
  if (v8)
  {
    v8->_epoch = objc_msgSend(v6, "epoch");
    objc_msgSend(v7, "access");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PAAccessMatcher coalescingMatcherForAccess:](PAAccessMatcher, "coalescingMatcherForAccess:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "groupedRecordsByMatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "addObject:", v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "groupedRecordsByMatcher");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v10);

    }
    objc_msgSend(v6, "groupedRecordsByMatcher");
    v15 = objc_claimAutoreleasedReturnValue();
    groupedRecordsByMatcher = v8->_groupedRecordsByMatcher;
    v8->_groupedRecordsByMatcher = (NSMutableDictionary *)v15;

  }
  return v8;
}

- (id)recordsToRepublish
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (int64_t)epoch
{
  return self->_epoch;
}

- (NSMutableDictionary)groupedRecordsByMatcher
{
  return self->_groupedRecordsByMatcher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupedRecordsByMatcher, 0);
}

@end
