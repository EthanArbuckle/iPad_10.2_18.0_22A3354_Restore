@implementation SCWWatchlistReorderAllSymbolsInWatchlistCommand

- (SCWWatchlistReorderAllSymbolsInWatchlistCommand)initWithSymbols:(id)a3 watchlistIdentifier:(id)a4
{
  id v6;
  id v7;
  SCWWatchlistReorderAllSymbolsInWatchlistCommand *v8;
  uint64_t v9;
  NSOrderedSet *symbols;
  uint64_t v11;
  NSString *watchlistIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWWatchlistReorderAllSymbolsInWatchlistCommand;
  v8 = -[SCWWatchlistReorderAllSymbolsInWatchlistCommand init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    symbols = v8->_symbols;
    v8->_symbols = (NSOrderedSet *)v9;

    v11 = objc_msgSend(v7, "copy");
    watchlistIdentifier = v8->_watchlistIdentifier;
    v8->_watchlistIdentifier = (NSString *)v11;

  }
  return v8;
}

- (void)executeWithZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__SCWWatchlistReorderAllSymbolsInWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v4 = a3;
  v5 = _Block_copy(aBlock);
  -[SCWWatchlistReorderAllSymbolsInWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createOrUpdateRecordWithName:recordType:modifyBlock:", v6, CFSTR("Watchlist"), v5);

}

void __67__SCWWatchlistReorderAllSymbolsInWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
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
  id v12;

  v3 = (void *)MEMORY[0x1E0C99E40];
  v4 = a2;
  objc_msgSend(v4, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("symbols"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E10];
  objc_msgSend(*(id *)(a1 + 32), "symbols");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderedSetWithOrderedSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "unionOrderedSet:", v12);
  objc_msgSend(v9, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encryptedValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("symbols"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("sortState"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, CFSTR("sortOrderState"));

}

- (SCWWatchlistReorderAllSymbolsInWatchlistCommand)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  SCWWatchlistReorderAllSymbolsInWatchlistCommand *v10;
  SCWWatchlistReorderAllSymbolsInWatchlistCommand *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("symbols"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchlistIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[SCWWatchlistReorderAllSymbolsInWatchlistCommand initWithSymbols:watchlistIdentifier:](self, "initWithSymbols:watchlistIdentifier:", v8, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SCWWatchlistReorderAllSymbolsInWatchlistCommand symbols](self, "symbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("symbols"));

  -[SCWWatchlistReorderAllSymbolsInWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("watchlistIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSOrderedSet)symbols
{
  return self->_symbols;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
  objc_storeStrong((id *)&self->_symbols, 0);
}

@end
