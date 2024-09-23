@implementation SCWatchlistAddDefaultSymbolsCommand

- (void)executeWithZone:(id)a3
{
  id v4;
  void *v5;
  _QWORD aBlock[5];

  v4 = a3;
  if ((objc_msgSend(v4, "recordExistsWithName:", CFSTR("watchlist")) & 1) == 0)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__SCWatchlistAddDefaultSymbolsCommand_executeWithZone___block_invoke;
    aBlock[3] = &unk_1E5AF1B68;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    objc_msgSend(v4, "createOrUpdateRecordWithName:recordType:modifyBlock:", CFSTR("watchlist"), CFSTR("Watchlist"), v5);

  }
}

void __55__SCWatchlistAddDefaultSymbolsCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "symbols");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encryptedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("symbols"));
}

- (NSArray)symbols
{
  return self->_symbols;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCWatchlistAddDefaultSymbolsCommand)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  SCWatchlistAddDefaultSymbolsCommand *v10;
  SCWatchlistAddDefaultSymbolsCommand *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("symbols"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("deferUpload"));
  if (v8)
  {
    self = -[SCWatchlistAddDefaultSymbolsCommand initWithSymbols:deferUpload:](self, "initWithSymbols:deferUpload:", v8, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  return v11;
}

- (SCWatchlistAddDefaultSymbolsCommand)initWithSymbols:(id)a3 deferUpload:(BOOL)a4
{
  id v6;
  SCWatchlistAddDefaultSymbolsCommand *v7;
  uint64_t v8;
  NSArray *symbols;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCWatchlistAddDefaultSymbolsCommand;
  v7 = -[SCWatchlistAddDefaultSymbolsCommand init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    symbols = v7->_symbols;
    v7->_symbols = (NSArray *)v8;

    v7->_deferUpload = a4;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SCWatchlistAddDefaultSymbolsCommand symbols](self, "symbols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("symbols"));

  objc_msgSend(v5, "encodeBool:forKey:", -[SCWatchlistAddDefaultSymbolsCommand deferUpload](self, "deferUpload"), CFSTR("deferUpload"));
}

- (BOOL)deferUpload
{
  return self->_deferUpload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbols, 0);
}

@end
