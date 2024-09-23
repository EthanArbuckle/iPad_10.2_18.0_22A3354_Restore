@implementation SCWWatchlistUpdateSortStateInWatchlistCommand

- (SCWWatchlistUpdateSortStateInWatchlistCommand)initWithWatchlistIdentifier:(id)a3 sortState:(id)a4 sortOrderState:(id)a5 displayState:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SCWWatchlistUpdateSortStateInWatchlistCommand *v14;
  uint64_t v15;
  NSString *watchlistIdentifier;
  uint64_t v17;
  NSNumber *sortState;
  uint64_t v19;
  NSNumber *sortOrderState;
  uint64_t v21;
  NSNumber *displayState;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SCWWatchlistUpdateSortStateInWatchlistCommand;
  v14 = -[SCWWatchlistUpdateSortStateInWatchlistCommand init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    watchlistIdentifier = v14->_watchlistIdentifier;
    v14->_watchlistIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    sortState = v14->_sortState;
    v14->_sortState = (NSNumber *)v17;

    v19 = objc_msgSend(v12, "copy");
    sortOrderState = v14->_sortOrderState;
    v14->_sortOrderState = (NSNumber *)v19;

    v21 = objc_msgSend(v13, "copy");
    displayState = v14->_displayState;
    v14->_displayState = (NSNumber *)v21;

  }
  return v14;
}

- (void)executeWithZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__SCWWatchlistUpdateSortStateInWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v4 = a3;
  v5 = _Block_copy(aBlock);
  -[SCWWatchlistUpdateSortStateInWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createOrUpdateRecordWithName:recordType:modifyBlock:", v6, CFSTR("Watchlist"), v5);

}

void __65__SCWWatchlistUpdateSortStateInWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sortState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v3, CFSTR("sortState"));

  objc_msgSend(*(id *)(a1 + 32), "sortOrderState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("sortOrderState"));

  objc_msgSend(*(id *)(a1 + 32), "displayState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "displayState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("displayState"));

  }
}

- (SCWWatchlistUpdateSortStateInWatchlistCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SCWWatchlistUpdateSortStateInWatchlistCommand *v9;
  SCWWatchlistUpdateSortStateInWatchlistCommand *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchlistIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sortState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sortOrderState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[SCWWatchlistUpdateSortStateInWatchlistCommand initWithWatchlistIdentifier:sortState:sortOrderState:displayState:](self, "initWithWatchlistIdentifier:sortState:sortOrderState:displayState:", v5, v6, v7, v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[SCWWatchlistUpdateSortStateInWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("watchlistIdentifier"));

  -[SCWWatchlistUpdateSortStateInWatchlistCommand sortState](self, "sortState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sortState"));

  -[SCWWatchlistUpdateSortStateInWatchlistCommand sortOrderState](self, "sortOrderState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sortOrderState"));

  -[SCWWatchlistUpdateSortStateInWatchlistCommand displayState](self, "displayState");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("displayState"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (NSNumber)sortState
{
  return self->_sortState;
}

- (NSNumber)sortOrderState
{
  return self->_sortOrderState;
}

- (NSNumber)displayState
{
  return self->_displayState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayState, 0);
  objc_storeStrong((id *)&self->_sortOrderState, 0);
  objc_storeStrong((id *)&self->_sortState, 0);
  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
}

@end
