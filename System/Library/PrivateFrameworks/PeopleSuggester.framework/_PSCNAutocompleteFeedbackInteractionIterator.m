@implementation _PSCNAutocompleteFeedbackInteractionIterator

- (_PSCNAutocompleteFeedbackInteractionIterator)initWithInteractionStore:(id)a3 bundleIds:(id)a4 startDate:(id)a5 batchSize:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  _PSCNAutocompleteFeedbackInteractionIterator *v14;
  _PSCNAutocompleteFeedbackInteractionIterator *v15;
  uint64_t v16;
  NSDate *endDate;
  NSArray *results;
  _CDInteraction *lastItem;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_PSCNAutocompleteFeedbackInteractionIterator;
  v14 = -[_PSCNAutocompleteFeedbackInteractionIterator init](&v21, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_interactionStore, a3);
    objc_storeStrong((id *)&v15->_bundleIds, a4);
    v15->_batchSize = a6;
    objc_storeStrong((id *)&v15->_startDate, a5);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = objc_claimAutoreleasedReturnValue();
    endDate = v15->_endDate;
    v15->_endDate = (NSDate *)v16;

    results = v15->_results;
    v15->_results = 0;

    lastItem = v15->_lastItem;
    v15->_lastItem = 0;

    v15->_resultsIndex = 0;
    v15->_resultsBatch = 0;
    v15->_isExhausted = 0;
  }

  return v15;
}

- (void)fetchResults
{
  _CDInteractionStore *interactionStore;
  NSDate *startDate;
  NSDate *endDate;
  NSSet *bundleIds;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *results;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;

  interactionStore = self->_interactionStore;
  startDate = self->_startDate;
  endDate = self->_endDate;
  bundleIds = self->_bundleIds;
  v7 = (void *)MEMORY[0x1A1AFCA24]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E442B558, &unk_1E442B570, 0);
  objc_autoreleasePoolPop(v7);
  LOBYTE(v13) = 1;
  LOWORD(v12) = 256;
  +[_PSInteractionStoreUtils interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:withNsUserName:singleRecipient:excludeAnonymousTemporaryRecipients:fetchLimit:fetchOffset:sortAscending:](_PSInteractionStoreUtils, "interactionsFromStore:startDate:tillDate:withMechanisms:withAccount:withBundleIds:withTargetBundleIds:withDirections:withNsUserName:singleRecipient:excludeAnonymousTemporaryRecipients:fetchLimit:fetchOffset:sortAscending:", interactionStore, startDate, endDate, 0, 0, bundleIds, 0, v8, 0, v12, self->_batchSize, self->_resultsBatch * self->_batchSize, v13);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  results = self->_results;
  self->_results = v9;

  if (!-[NSArray count](self->_results, "count"))
  {
    v11 = self->_results;
    self->_results = 0;

    self->_isExhausted = 1;
  }
}

- (id)nextObject
{
  _CDInteraction *lastItem;
  _CDInteraction *v4;
  _CDInteraction *v5;
  _CDInteraction *v6;
  int64_t resultsIndex;
  NSArray *results;

  if (!self->_results && !self->_isExhausted)
    -[_PSCNAutocompleteFeedbackInteractionIterator fetchResults](self, "fetchResults");
  if (self->_isExhausted)
  {
    lastItem = self->_lastItem;
    self->_lastItem = 0;

    v4 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_results, "objectAtIndexedSubscript:", self->_resultsIndex);
    v5 = (_CDInteraction *)objc_claimAutoreleasedReturnValue();
    v6 = self->_lastItem;
    self->_lastItem = v5;

    if (self->_resultsIndex == self->_batchSize - 1)
    {
      ++self->_resultsBatch;
      -[_PSCNAutocompleteFeedbackInteractionIterator fetchResults](self, "fetchResults");
      self->_resultsIndex = 0;
    }
    else if (-[NSArray count](self->_results, "count") < self->_batchSize
           && (resultsIndex = self->_resultsIndex, resultsIndex == -[NSArray count](self->_results, "count") - 1))
    {
      results = self->_results;
      self->_results = 0;

      self->_isExhausted = 1;
    }
    else
    {
      ++self->_resultsIndex;
    }
    v4 = self->_lastItem;
  }
  return v4;
}

- (id)fastForwardToDate:(id)a3
{
  id v4;
  _CDInteraction *lastItem;
  void *v6;
  uint64_t v7;
  _CDInteraction *v8;
  void *v10;
  uint64_t v11;
  _CDInteraction *v12;

  v4 = a3;
  if (!self->_results && !self->_isExhausted)
    -[_PSCNAutocompleteFeedbackInteractionIterator fetchResults](self, "fetchResults");
  lastItem = self->_lastItem;
  if (lastItem
    && (-[_CDInteraction startDate](lastItem, "startDate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "compare:", v4),
        v6,
        v7 == 1))
  {
    v8 = self->_lastItem;
  }
  else if (self->_isExhausted)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    while (!self->_isExhausted)
    {
      while (1)
      {
        -[_PSCNAutocompleteFeedbackInteractionIterator nextObject](self, "nextObject");
        v12 = (_CDInteraction *)objc_claimAutoreleasedReturnValue();

        v8 = v12;
        if (!v12)
          break;
        -[_CDInteraction startDate](v12, "startDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "compare:", v4);

        if (v11 != -1)
          goto LABEL_9;
      }
    }
  }
LABEL_9:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_lastItem, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_bundleIds, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
}

@end
