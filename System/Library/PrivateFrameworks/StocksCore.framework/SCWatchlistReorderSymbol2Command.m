@implementation SCWatchlistReorderSymbol2Command

- (SCWatchlistReorderSymbol2Command)initWithSymbol:(id)a3 toIndex:(unint64_t)a4
{
  id v6;
  SCWatchlistReorderSymbol2Command *v7;
  uint64_t v8;
  NSString *symbol;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCWatchlistReorderSymbol2Command;
  v7 = -[SCWatchlistReorderSymbol2Command init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    symbol = v7->_symbol;
    v7->_symbol = (NSString *)v8;

    v7->_toIndex = a4;
  }

  return v7;
}

- (void)executeWithZone:(id)a3
{
  id v3;
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__SCWatchlistReorderSymbol2Command_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v3 = a3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(v3, "createOrUpdateRecordWithName:recordType:modifyBlock:", CFSTR("watchlist"), CFSTR("Watchlist"), v4);

}

void __52__SCWatchlistReorderSymbol2Command_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)MEMORY[0x1E0C99E10];
  v4 = a2;
  objc_msgSend(v4, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("symbols"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v6);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "symbol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "symbol");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(*(id *)(a1 + 32), "toIndex");
  v10 = objc_msgSend(v14, "count");
  if (v9 >= v10)
    v11 = v10;
  else
    v11 = v9;
  objc_msgSend(v14, "insertObject:atIndex:", v8, v11);

  objc_msgSend(v14, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encryptedValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("symbols"));
}

- (SCWatchlistReorderSymbol2Command)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  SCWatchlistReorderSymbol2Command *v8;
  SCWatchlistReorderSymbol2Command *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbol"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("toIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[SCWatchlistReorderSymbol2Command initWithSymbol:toIndex:](self, "initWithSymbol:toIndex:", v5, objc_msgSend(v6, "unsignedIntegerValue"));
    v8 = self;
  }
  v9 = v8;

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SCWatchlistReorderSymbol2Command symbol](self, "symbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("symbol"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SCWatchlistReorderSymbol2Command toIndex](self, "toIndex"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("toIndex"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)symbol
{
  return self->_symbol;
}

- (unint64_t)toIndex
{
  return self->_toIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbol, 0);
}

@end
