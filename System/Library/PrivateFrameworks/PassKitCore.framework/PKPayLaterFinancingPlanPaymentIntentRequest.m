@implementation PKPayLaterFinancingPlanPaymentIntentRequest

- (PKPayLaterFinancingPlanPaymentIntentRequest)initWithPlanIdentifier:(id)a3 intent:(unint64_t)a4 completion:(id)a5
{
  id v9;
  id v10;
  PKPayLaterFinancingPlanPaymentIntentRequest *v11;
  NSMutableArray *v12;
  NSMutableArray *completions;
  NSMutableArray *v14;
  void *v15;
  objc_super v17;

  v9 = a3;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPayLaterFinancingPlanPaymentIntentRequest;
  v11 = -[PKPayLaterFinancingPlanPaymentIntentRequest init](&v17, sel_init);
  if (v11)
  {
    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completions = v11->_completions;
    v11->_completions = v12;

    objc_storeStrong((id *)&v11->_planIdentifier, a3);
    v11->_intent = a4;
    v14 = v11->_completions;
    v15 = _Block_copy(v10);
    -[NSMutableArray safelyAddObject:](v14, "safelyAddObject:", v15);

  }
  return v11;
}

- (void)coalesceWithRequest:(id)a3
{
  NSMutableArray *completions;
  id v4;

  completions = self->_completions;
  objc_msgSend(a3, "completions");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObjectsFromArray:](completions, "addObjectsFromArray:", v4);

}

- (void)callCompletionsWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_completions;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)identifier
{
  void *v2;
  NSString *planIdentifier;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  planIdentifier = self->_planIdentifier;
  PKFinancingPlanPaymentIntentTypeToString(self->_intent);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-%@"), planIdentifier, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)intent
{
  return self->_intent;
}

- (NSString)planIdentifier
{
  return self->_planIdentifier;
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
  objc_storeStrong((id *)&self->_planIdentifier, 0);
}

@end
