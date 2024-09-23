@implementation PAAccessRecordCoalescingWindowRolledOverState

- (id)initByEndingPreviousWindow:(id)a3 reversed:(BOOL)a4 withInitialAccessRecord:(id)a5 forNewEpoch:(int64_t)a6
{
  id v10;
  id v11;
  PAAccessRecordCoalescingWindowRolledOverState *v12;
  void *v13;
  uint64_t v14;
  NSArray *groupedRecordsToRepublish;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *groupedRecordsByMatcher;
  objc_super v23;

  v10 = a3;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PAAccessRecordCoalescingWindowRolledOverState;
  v12 = -[PAAccessRecordCoalescingWindowRolledOverState init](&v23, sel_init);
  if (v12)
  {
    objc_msgSend(v10, "groupedRecordsByMatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allValues");
    v14 = objc_claimAutoreleasedReturnValue();
    groupedRecordsToRepublish = v12->_groupedRecordsToRepublish;
    v12->_groupedRecordsToRepublish = (NSArray *)v14;

    v12->_reversed = a4;
    v12->_epoch = a6;
    objc_msgSend(v11, "access");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PAAccessMatcher coalescingMatcherForAccess:](PAAccessMatcher, "coalescingMatcherForAccess:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dictionaryWithObject:forKey:", v19, v17);
    v20 = objc_claimAutoreleasedReturnValue();
    groupedRecordsByMatcher = v12->_groupedRecordsByMatcher;
    v12->_groupedRecordsByMatcher = (NSMutableDictionary *)v20;

  }
  return v12;
}

- (id)recordsToRepublish
{
  return coalesceGroupedRecordsToRepublish(self->_groupedRecordsToRepublish, self->_reversed);
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
  objc_storeStrong((id *)&self->_groupedRecordsToRepublish, 0);
}

@end
