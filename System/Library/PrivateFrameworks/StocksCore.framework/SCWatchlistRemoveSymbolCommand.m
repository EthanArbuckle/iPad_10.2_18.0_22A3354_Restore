@implementation SCWatchlistRemoveSymbolCommand

- (SCWatchlistRemoveSymbolCommand)initWithSymbol:(id)a3
{
  id v4;
  SCWatchlistRemoveSymbolCommand *v5;
  uint64_t v6;
  NSString *symbol;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWatchlistRemoveSymbolCommand;
  v5 = -[SCWatchlistRemoveSymbolCommand init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    symbol = v5->_symbol;
    v5->_symbol = (NSString *)v6;

  }
  return v5;
}

- (void)executeWithZone:(id)a3
{
  id v3;
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__SCWatchlistRemoveSymbolCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v3 = a3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(v3, "createOrUpdateRecordWithName:recordType:modifyBlock:", CFSTR("watchlist"), CFSTR("Watchlist"), v4);

}

void __50__SCWatchlistRemoveSymbolCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99E10];
  v4 = a2;
  objc_msgSend(v4, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("symbols"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "symbol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v7);

  objc_msgSend(v10, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encryptedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("symbols"));
}

- (SCWatchlistRemoveSymbolCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SCWatchlistRemoveSymbolCommand *v6;
  SCWatchlistRemoveSymbolCommand *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbol"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[SCWatchlistRemoveSymbolCommand initWithSymbol:](self, "initWithSymbol:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCWatchlistRemoveSymbolCommand symbol](self, "symbol");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("symbol"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
}

@end
