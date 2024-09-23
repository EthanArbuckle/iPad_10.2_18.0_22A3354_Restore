@implementation SCWWatchlistReorderSymbolInWatchlistCommand

- (SCWWatchlistReorderSymbolInWatchlistCommand)initWithSymbol:(id)a3 precedingSymbol:(id)a4 watchlistIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  SCWWatchlistReorderSymbolInWatchlistCommand *v11;
  uint64_t v12;
  NSString *symbol;
  uint64_t v14;
  NSString *precedingSymbol;
  uint64_t v16;
  NSString *watchlistIdentifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SCWWatchlistReorderSymbolInWatchlistCommand;
  v11 = -[SCWWatchlistReorderSymbolInWatchlistCommand init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    symbol = v11->_symbol;
    v11->_symbol = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    precedingSymbol = v11->_precedingSymbol;
    v11->_precedingSymbol = (NSString *)v14;

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
  aBlock[2] = __63__SCWWatchlistReorderSymbolInWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v4 = a3;
  v5 = _Block_copy(aBlock);
  -[SCWWatchlistReorderSymbolInWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createOrUpdateRecordWithName:recordType:modifyBlock:", v6, CFSTR("Watchlist"), v5);

}

void __63__SCWWatchlistReorderSymbolInWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E10];
  v25 = v3;
  objc_msgSend(v3, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("symbols"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedSetWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "symbol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "precedingSymbol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "symbol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "containsObject:", v11);

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "precedingSymbol");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13
        || (v14 = (void *)v13,
            objc_msgSend(*(id *)(a1 + 32), "precedingSymbol"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v7, "containsObject:", v15),
            v15,
            v14,
            v16))
      {
        objc_msgSend(*(id *)(a1 + 32), "precedingSymbol");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v7, "indexOfObject:", v17);

        objc_msgSend(*(id *)(a1 + 32), "precedingSymbol");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "symbol");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObject:", v20);

        objc_msgSend(*(id *)(a1 + 32), "symbol");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v19 || v18 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v7, "insertObject:atIndex:", v21, 0);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "precedingSymbol");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "insertObject:atIndex:", v21, objc_msgSend(v7, "indexOfObject:", v22) + 1);

        }
        objc_msgSend(v7, "array");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "encryptedValues");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("symbols"));

      }
    }
  }

}

- (SCWWatchlistReorderSymbolInWatchlistCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SCWWatchlistReorderSymbolInWatchlistCommand *v8;
  SCWWatchlistReorderSymbolInWatchlistCommand *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbol"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("precedingStockSymbol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchlistIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[SCWWatchlistReorderSymbolInWatchlistCommand initWithSymbol:precedingSymbol:watchlistIdentifier:](self, "initWithSymbol:precedingSymbol:watchlistIdentifier:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SCWWatchlistReorderSymbolInWatchlistCommand symbol](self, "symbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("symbol"));

  -[SCWWatchlistReorderSymbolInWatchlistCommand precedingSymbol](self, "precedingSymbol");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("precedingStockSymbol"));

  -[SCWWatchlistReorderSymbolInWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("watchlistIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (NSString)precedingSymbol
{
  return self->_precedingSymbol;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
  objc_storeStrong((id *)&self->_precedingSymbol, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
}

@end
