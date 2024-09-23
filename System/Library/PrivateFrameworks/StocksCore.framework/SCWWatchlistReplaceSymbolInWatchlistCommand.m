@implementation SCWWatchlistReplaceSymbolInWatchlistCommand

- (SCWWatchlistReplaceSymbolInWatchlistCommand)initWithOldSymbol:(id)a3 replacementSymbol:(id)a4 watchlistIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  SCWWatchlistReplaceSymbolInWatchlistCommand *v11;
  uint64_t v12;
  NSString *oldSymbol;
  uint64_t v14;
  NSString *replacementSymbol;
  uint64_t v16;
  NSString *watchlistIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SCWWatchlistReplaceSymbolInWatchlistCommand;
  v11 = -[SCWWatchlistReplaceSymbolInWatchlistCommand init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    oldSymbol = v11->_oldSymbol;
    v11->_oldSymbol = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    replacementSymbol = v11->_replacementSymbol;
    v11->_replacementSymbol = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    watchlistIdentifier = v11->_watchlistIdentifier;
    v11->_watchlistIdentifier = (NSString *)v16;

  }
  return v11;
}

- (void)executeWithZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__SCWWatchlistReplaceSymbolInWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v4 = a3;
  v5 = _Block_copy(aBlock);
  -[SCWWatchlistReplaceSymbolInWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createOrUpdateRecordWithName:recordType:modifyBlock:", v6, CFSTR("Watchlist"), v5);

}

void __63__SCWWatchlistReplaceSymbolInWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)MEMORY[0x1E0C99E10];
  v4 = a2;
  objc_msgSend(v4, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("symbols"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "oldSymbol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v12, "indexOfObject:", v7);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "replacementSymbol");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "replaceObjectAtIndex:withObject:", v8, v9);

  }
  objc_msgSend(v12, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encryptedValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("symbols"));
}

- (SCWWatchlistReplaceSymbolInWatchlistCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  SCWWatchlistReplaceSymbolInWatchlistCommand *v9;
  SCWWatchlistReplaceSymbolInWatchlistCommand *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("oldSymbol"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replacementSymbol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchlistIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    self = -[SCWWatchlistReplaceSymbolInWatchlistCommand initWithOldSymbol:replacementSymbol:watchlistIdentifier:](self, "initWithOldSymbol:replacementSymbol:watchlistIdentifier:", v5, v6, v7);
    v9 = self;
  }
  v10 = v9;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SCWWatchlistReplaceSymbolInWatchlistCommand oldSymbol](self, "oldSymbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("oldSymbol"));

  -[SCWWatchlistReplaceSymbolInWatchlistCommand replacementSymbol](self, "replacementSymbol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("replacementSymbol"));

  -[SCWWatchlistReplaceSymbolInWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("watchlistIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)oldSymbol
{
  return self->_oldSymbol;
}

- (NSString)replacementSymbol
{
  return self->_replacementSymbol;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
  objc_storeStrong((id *)&self->_replacementSymbol, 0);
  objc_storeStrong((id *)&self->_oldSymbol, 0);
}

@end
