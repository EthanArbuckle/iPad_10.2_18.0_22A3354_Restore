@implementation SCWWatchlistAddNewWatchlistCommand

- (SCWWatchlistAddNewWatchlistCommand)initWithName:(id)a3 identifier:(id)a4 sortState:(id)a5 sortOrderState:(id)a6 displayState:(id)a7
{
  return -[SCWWatchlistAddNewWatchlistCommand initWithName:identifier:symbols:sortState:sortOrderState:displayState:](self, "initWithName:identifier:symbols:sortState:sortOrderState:displayState:", a3, a4, MEMORY[0x1E0C9AA60], a5, a6, a7);
}

- (SCWWatchlistAddNewWatchlistCommand)initWithName:(id)a3 identifier:(id)a4 symbols:(id)a5 sortState:(id)a6 sortOrderState:(id)a7 displayState:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SCWWatchlistAddNewWatchlistCommand *v20;
  uint64_t v21;
  NSString *name;
  uint64_t v23;
  NSArray *symbols;
  uint64_t v25;
  NSString *watchlistIdentifier;
  uint64_t v27;
  NSNumber *sortState;
  uint64_t v29;
  NSNumber *sortOrderState;
  uint64_t v31;
  NSNumber *displayState;
  objc_super v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)SCWWatchlistAddNewWatchlistCommand;
  v20 = -[SCWWatchlistAddNewWatchlistCommand init](&v34, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    symbols = v20->_symbols;
    v20->_symbols = (NSArray *)v23;

    v25 = objc_msgSend(v15, "copy");
    watchlistIdentifier = v20->_watchlistIdentifier;
    v20->_watchlistIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    sortState = v20->_sortState;
    v20->_sortState = (NSNumber *)v27;

    v29 = objc_msgSend(v18, "copy");
    sortOrderState = v20->_sortOrderState;
    v20->_sortOrderState = (NSNumber *)v29;

    v31 = objc_msgSend(v19, "copy");
    displayState = v20->_displayState;
    v20->_displayState = (NSNumber *)v31;

  }
  return v20;
}

- (void)executeWithZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__SCWWatchlistAddNewWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v4 = a3;
  v5 = _Block_copy(aBlock);
  -[SCWWatchlistAddNewWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createOrUpdateRecordWithName:recordType:modifyBlock:", v6, CFSTR("Watchlist"), v5);

}

void __54__SCWWatchlistAddNewWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)MEMORY[0x1E0C99E10];
  v4 = a2;
  objc_msgSend(v4, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("symbols"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "symbols");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v7);

  objc_msgSend(v15, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encryptedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("symbols"));

  objc_msgSend(*(id *)(a1 + 32), "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encryptedValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("name"));

  objc_msgSend(*(id *)(a1 + 32), "sortState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("sortState"));

  objc_msgSend(*(id *)(a1 + 32), "sortOrderState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("sortOrderState"));

  objc_msgSend(*(id *)(a1 + 32), "displayState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("displayState"));

}

- (SCWWatchlistAddNewWatchlistCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SCWWatchlistAddNewWatchlistCommand *v14;
  SCWWatchlistAddNewWatchlistCommand *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("symbols"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchlistIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sortState"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sortOrderState"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[SCWWatchlistAddNewWatchlistCommand initWithName:identifier:symbols:sortState:sortOrderState:displayState:](self, "initWithName:identifier:symbols:sortState:sortOrderState:displayState:", v5, v10, v9, v11, v12, v13);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[SCWWatchlistAddNewWatchlistCommand name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  -[SCWWatchlistAddNewWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("watchlistIdentifier"));

  -[SCWWatchlistAddNewWatchlistCommand sortState](self, "sortState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sortState"));

  -[SCWWatchlistAddNewWatchlistCommand sortOrderState](self, "sortOrderState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("sortOrderState"));

  -[SCWWatchlistAddNewWatchlistCommand displayState](self, "displayState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("displayState"));

  -[SCWWatchlistAddNewWatchlistCommand symbols](self, "symbols");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("symbols"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)symbols
{
  return self->_symbols;
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
  objc_storeStrong((id *)&self->_symbols, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
