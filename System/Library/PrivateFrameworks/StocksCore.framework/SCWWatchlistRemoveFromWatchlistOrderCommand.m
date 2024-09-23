@implementation SCWWatchlistRemoveFromWatchlistOrderCommand

- (SCWWatchlistRemoveFromWatchlistOrderCommand)initWithWatchlistIdentifier:(id)a3
{
  id v4;
  SCWWatchlistRemoveFromWatchlistOrderCommand *v5;
  uint64_t v6;
  NSString *watchlistIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWWatchlistRemoveFromWatchlistOrderCommand;
  v5 = -[SCWWatchlistRemoveFromWatchlistOrderCommand init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    watchlistIdentifier = v5->_watchlistIdentifier;
    v5->_watchlistIdentifier = (NSString *)v6;

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
  aBlock[2] = __63__SCWWatchlistRemoveFromWatchlistOrderCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v3 = a3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(v3, "createOrUpdateRecordWithName:recordType:modifyBlock:", CFSTR("watchlistorder"), CFSTR("WatchlistOrder"), v4);

}

void __63__SCWWatchlistRemoveFromWatchlistOrderCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
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

  objc_msgSend(*(id *)(a1 + 32), "watchlistIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v7);

  objc_msgSend(v10, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encryptedValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("watchlistIDs"));
}

- (SCWWatchlistRemoveFromWatchlistOrderCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SCWWatchlistRemoveFromWatchlistOrderCommand *v6;
  SCWWatchlistRemoveFromWatchlistOrderCommand *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchlistIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[SCWWatchlistRemoveFromWatchlistOrderCommand initWithWatchlistIdentifier:](self, "initWithWatchlistIdentifier:", v5);
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
  -[SCWWatchlistRemoveFromWatchlistOrderCommand watchlistIdentifier](self, "watchlistIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("watchlistIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
}

@end
