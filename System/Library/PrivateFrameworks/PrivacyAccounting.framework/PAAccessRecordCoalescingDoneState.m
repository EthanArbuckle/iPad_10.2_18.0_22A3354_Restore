@implementation PAAccessRecordCoalescingDoneState

- (id)initByEndingLastWindow:(id)a3 reversed:(BOOL)a4
{
  id v6;
  PAAccessRecordCoalescingDoneState *v7;
  void *v8;
  uint64_t v9;
  NSArray *groupedRecordsToRepublish;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PAAccessRecordCoalescingDoneState;
  v7 = -[PAAccessRecordCoalescingDoneState init](&v12, sel_init);
  if (v7)
  {
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EE80D260))
    {
      objc_msgSend(v6, "groupedRecordsByMatcher");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "allValues");
      v9 = objc_claimAutoreleasedReturnValue();
      groupedRecordsToRepublish = v7->_groupedRecordsToRepublish;
      v7->_groupedRecordsToRepublish = (NSArray *)v9;

    }
    else
    {
      v8 = v7->_groupedRecordsToRepublish;
      v7->_groupedRecordsToRepublish = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    v7->_reversed = a4;
  }

  return v7;
}

- (id)recordsToRepublish
{
  return coalesceGroupedRecordsToRepublish(self->_groupedRecordsToRepublish, self->_reversed);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupedRecordsToRepublish, 0);
}

@end
