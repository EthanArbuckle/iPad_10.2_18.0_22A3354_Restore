@implementation PAAccessRecordCoalescingIncompleteRecordState

- (PAAccessRecordCoalescingIncompleteRecordState)initWithPreviousState:(id)a3 recordToRepublish:(id)a4
{
  id v7;
  id v8;
  PAAccessRecordCoalescingIncompleteRecordState *v9;
  PAAccessRecordCoalescingIncompleteRecordState *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PAAccessRecordCoalescingIncompleteRecordState;
  v9 = -[PAAccessRecordCoalescingIncompleteRecordState init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_previousState, a3);
    objc_storeStrong((id *)&v10->_recordToRepublish, a4);
  }

  return v10;
}

- (id)recordsToRepublish
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_recordToRepublish;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PAAccessRecordCoalescingState)previousState
{
  return self->_previousState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousState, 0);
  objc_storeStrong((id *)&self->_recordToRepublish, 0);
}

@end
