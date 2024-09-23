@implementation PXIDSAddressQuery

- (PXIDSAddressQuery)initWithDestinations:(id)a3 resultHandler:(id)a4
{
  id v7;
  id v8;
  PXIDSAddressQuery *v9;
  uint64_t v10;
  NSMutableSet *mutableRemainingDestinations;
  uint64_t v12;
  id resultHandler;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "count"))
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXIDSAddressQueryController.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinations.count > 0"));

    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXIDSAddressQueryController.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultHandler"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)PXIDSAddressQuery;
  v9 = -[PXIDSAddressQuery init](&v17, sel_init);
  if (v9)
  {
    v9->_destinationsCount = objc_msgSend(v7, "count");
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v7);
    v10 = objc_claimAutoreleasedReturnValue();
    mutableRemainingDestinations = v9->_mutableRemainingDestinations;
    v9->_mutableRemainingDestinations = (NSMutableSet *)v10;

    v12 = objc_msgSend(v8, "copy");
    resultHandler = v9->_resultHandler;
    v9->_resultHandler = (id)v12;

    v9->_resultsCount = 0;
  }

  return v9;
}

- (void)stashDestination:(id)a3 withResult:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSMutableDictionary *mutableStashedResults;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a4;
  v7 = a3;
  v14 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXIDSAddressQueryController.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destination"));

    v7 = 0;
  }
  if ((-[NSMutableSet containsObject:](self->_mutableRemainingDestinations, "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXIDSAddressQueryController.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[_mutableRemainingDestinations containsObject:destination]"));

  }
  mutableStashedResults = self->_mutableStashedResults;
  ++self->_resultsCount;
  if (!mutableStashedResults)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v10 = self->_mutableStashedResults;
    self->_mutableStashedResults = v9;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableStashedResults, "setObject:forKeyedSubscript:", v11, v14);

  -[NSMutableSet removeObject:](self->_mutableRemainingDestinations, "removeObject:", v14);
}

- (id)popStashedResults
{
  void *v3;
  NSMutableDictionary *mutableStashedResults;

  v3 = (void *)-[NSMutableDictionary copy](self->_mutableStashedResults, "copy");
  mutableStashedResults = self->_mutableStashedResults;
  self->_mutableStashedResults = 0;

  return v3;
}

- (NSSet)remainingDestinations
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_mutableRemainingDestinations, "copy");
}

- (BOOL)isComplete
{
  return self->_resultsCount == self->_destinationsCount;
}

- (id)resultHandler
{
  return self->_resultHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong((id *)&self->_mutableStashedResults, 0);
  objc_storeStrong((id *)&self->_mutableRemainingDestinations, 0);
}

@end
