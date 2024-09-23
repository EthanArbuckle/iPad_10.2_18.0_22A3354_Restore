@implementation SHSheetActivityPerformerResult

- (SHSheetActivityPerformerResult)initWithActivity:(id)a3 completedState:(int64_t)a4 returnedItems:(id)a5 error:(id)a6
{
  id v11;
  id v12;
  id v13;
  SHSheetActivityPerformerResult *v14;
  SHSheetActivityPerformerResult *v15;
  uint64_t v16;
  NSArray *returnedItems;
  objc_super v19;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SHSheetActivityPerformerResult;
  v14 = -[SHSheetActivityPerformerResult init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_activity, a3);
    v15->_completedState = a4;
    v16 = objc_msgSend(v12, "copy");
    returnedItems = v15->_returnedItems;
    v15->_returnedItems = (NSArray *)v16;

    objc_storeStrong((id *)&v15->_error, a6);
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)SHSheetActivityPerformerResult;
  -[SHSheetActivityPerformerResult description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivityPerformerResult activity](self, "activity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SHSheetActivityPerformerResult completedState](self, "completedState");
  if (v6 > 5)
    v7 = 0;
  else
    v7 = off_1E4003330[v6];
  -[SHSheetActivityPerformerResult returnedItems](self, "returnedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSheetActivityPerformerResult error](self, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ activity:%@ completedState:%@ returnedItems:%@ error:%@>"), v4, v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (UIActivity)activity
{
  return self->_activity;
}

- (int64_t)completedState
{
  return self->_completedState;
}

- (void)setCompletedState:(int64_t)a3
{
  self->_completedState = a3;
}

- (NSArray)returnedItems
{
  return self->_returnedItems;
}

- (void)setReturnedItems:(id)a3
{
  objc_storeStrong((id *)&self->_returnedItems, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_returnedItems, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
