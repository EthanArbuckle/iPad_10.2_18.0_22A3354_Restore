@implementation SCWatchlistReorderSymbolCommand

- (SCWatchlistReorderSymbolCommand)initWithSymbol:(id)a3 precedingSymbol:(id)a4
{
  id v6;
  id v7;
  SCWatchlistReorderSymbolCommand *v8;
  uint64_t v9;
  NSString *symbol;
  uint64_t v11;
  NSString *precedingSymbol;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWatchlistReorderSymbolCommand;
  v8 = -[SCWatchlistReorderSymbolCommand init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    symbol = v8->_symbol;
    v8->_symbol = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    precedingSymbol = v8->_precedingSymbol;
    v8->_precedingSymbol = (NSString *)v11;

  }
  return v8;
}

- (void)executeWithZone:(id)a3
{
  id v3;
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__SCWatchlistReorderSymbolCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v3 = a3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(v3, "createOrUpdateRecordWithName:recordType:modifyBlock:", CFSTR("watchlist"), CFSTR("Watchlist"), v4);

}

void __51__SCWatchlistReorderSymbolCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E10];
  v23 = v3;
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

        objc_msgSend(*(id *)(a1 + 32), "symbol");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeObject:", v18);

        objc_msgSend(*(id *)(a1 + 32), "symbol");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(*(id *)(a1 + 32), "precedingSymbol");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "insertObject:atIndex:", v19, objc_msgSend(v7, "indexOfObject:", v20) + 1);

        }
        else
        {
          objc_msgSend(v7, "insertObject:atIndex:", v19, 0);
        }

        objc_msgSend(v7, "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "encryptedValues");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("symbols"));

      }
    }
  }

}

- (SCWatchlistReorderSymbolCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SCWatchlistReorderSymbolCommand *v7;
  SCWatchlistReorderSymbolCommand *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbol"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("precedingSymbol"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[SCWatchlistReorderSymbolCommand initWithSymbol:precedingSymbol:](self, "initWithSymbol:precedingSymbol:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SCWatchlistReorderSymbolCommand symbol](self, "symbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("symbol"));

  -[SCWatchlistReorderSymbolCommand precedingSymbol](self, "precedingSymbol");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("precedingSymbol"));

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precedingSymbol, 0);
  objc_storeStrong((id *)&self->_symbol, 0);
}

@end
