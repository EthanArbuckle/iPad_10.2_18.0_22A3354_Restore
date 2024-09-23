@implementation SCWWatchlistAddToWatchlistOrderCommand

void __58__SCWWatchlistAddToWatchlistOrderCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("watchlistIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orderedSetWithArray:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "watchlistIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v7);

  objc_msgSend(v10, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encryptedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("watchlistIDs"));
}

- (NSArray)watchlistIdentifiers
{
  return self->_watchlistIdentifiers;
}

- (void)executeWithZone:(id)a3
{
  id v3;
  void *v4;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__SCWWatchlistAddToWatchlistOrderCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v3 = a3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(v3, "createOrUpdateRecordWithName:recordType:modifyBlock:", CFSTR("watchlistorder"), CFSTR("WatchlistOrder"), v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCWWatchlistAddToWatchlistOrderCommand)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  SCWWatchlistAddToWatchlistOrderCommand *v9;
  SCWWatchlistAddToWatchlistOrderCommand *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("watchlistIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[SCWWatchlistAddToWatchlistOrderCommand initWithWatchlistIdentifiers:](self, "initWithWatchlistIdentifiers:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

- (SCWWatchlistAddToWatchlistOrderCommand)initWithWatchlistIdentifiers:(id)a3
{
  id v4;
  SCWWatchlistAddToWatchlistOrderCommand *v5;
  uint64_t v6;
  NSArray *watchlistIdentifiers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWWatchlistAddToWatchlistOrderCommand;
  v5 = -[SCWWatchlistAddToWatchlistOrderCommand init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    watchlistIdentifiers = v5->_watchlistIdentifiers;
    v5->_watchlistIdentifiers = (NSArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCWWatchlistAddToWatchlistOrderCommand watchlistIdentifiers](self, "watchlistIdentifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("watchlistIdentifiers"));

}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchlistIdentifiers, 0);
  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
}

@end
