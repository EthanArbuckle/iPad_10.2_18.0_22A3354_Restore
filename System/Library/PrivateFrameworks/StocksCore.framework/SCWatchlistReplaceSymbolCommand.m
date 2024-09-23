@implementation SCWatchlistReplaceSymbolCommand

- (SCWatchlistReplaceSymbolCommand)initWithOldSymbol:(id)a3 replacementSymbol:(id)a4
{
  id v6;
  id v7;
  SCWatchlistReplaceSymbolCommand *v8;
  uint64_t v9;
  NSString *oldSymbol;
  uint64_t v11;
  NSString *replacementSymbol;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWatchlistReplaceSymbolCommand;
  v8 = -[SCWatchlistReplaceSymbolCommand init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    oldSymbol = v8->_oldSymbol;
    v8->_oldSymbol = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    replacementSymbol = v8->_replacementSymbol;
    v8->_replacementSymbol = (NSString *)v11;

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
  aBlock[2] = __51__SCWatchlistReplaceSymbolCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v3 = a3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(v3, "createOrUpdateRecordWithName:recordType:modifyBlock:", CFSTR("watchlist"), CFSTR("Watchlist"), v4);

}

void __51__SCWatchlistReplaceSymbolCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
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

- (SCWatchlistReplaceSymbolCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  SCWatchlistReplaceSymbolCommand *v8;
  SCWatchlistReplaceSymbolCommand *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("oldSymbol"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("replacementSymbol"));
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
    self = -[SCWatchlistReplaceSymbolCommand initWithOldSymbol:replacementSymbol:](self, "initWithOldSymbol:replacementSymbol:", v5, v6);
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
  -[SCWatchlistReplaceSymbolCommand oldSymbol](self, "oldSymbol");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("oldSymbol"));

  -[SCWatchlistReplaceSymbolCommand replacementSymbol](self, "replacementSymbol");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("replacementSymbol"));

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementSymbol, 0);
  objc_storeStrong((id *)&self->_oldSymbol, 0);
}

@end
