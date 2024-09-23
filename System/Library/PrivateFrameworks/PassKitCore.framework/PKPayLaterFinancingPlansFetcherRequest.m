@implementation PKPayLaterFinancingPlansFetcherRequest

- (PKPayLaterFinancingPlansFetcherRequest)initWithStartDate:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  PKPayLaterFinancingPlansFetcherRequest *v9;
  PKPayLaterFinancingPlansFetcherRequest *v10;
  NSMutableArray *v11;
  NSMutableArray *completions;
  NSMutableArray *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFinancingPlansFetcherRequest;
  v9 = -[PKPayLaterFinancingPlansFetcherRequest init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startDate, a3);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completions = v10->_completions;
    v10->_completions = v11;

    v13 = v10->_completions;
    v14 = _Block_copy(v8);
    -[NSMutableArray safelyAddObject:](v13, "safelyAddObject:", v14);

  }
  return v10;
}

- (BOOL)coalesceRequest:(id)a3
{
  id v4;
  NSDate *startDate;
  void *v6;
  _BOOL4 v7;
  NSMutableArray *completions;
  void *v9;

  v4 = a3;
  startDate = self->_startDate;
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSDate isEqualToDate:](startDate, "isEqualToDate:", v6);

  if (v7)
  {
    completions = self->_completions;
    objc_msgSend(v4, "completions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](completions, "addObjectsFromArray:", v9);

  }
  return v7;
}

- (void)callCompletionsWithResult:(id)a3
{
  id v4;
  NSMutableArray *v5;
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
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_completions;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9));
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_completions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
