@implementation SCWWatchlistRenameWatchlistCommand

- (SCWWatchlistRenameWatchlistCommand)initWithWatchlistIdentifier:(id)a3 updatedName:(id)a4
{
  id v6;
  id v7;
  SCWWatchlistRenameWatchlistCommand *v8;
  uint64_t v9;
  NSString *watchlistIdentifier;
  uint64_t v11;
  NSString *updatedName;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWWatchlistRenameWatchlistCommand;
  v8 = -[SCWWatchlistRenameWatchlistCommand init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    watchlistIdentifier = v8->_watchlistIdentifier;
    v8->_watchlistIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    updatedName = v8->_updatedName;
    v8->_updatedName = (NSString *)v11;

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
  aBlock[2] = __54__SCWWatchlistRenameWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v4 = a3;
  v5 = _Block_copy(aBlock);
  -[SCWWatchlistRenameWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createOrUpdateRecordWithName:recordType:modifyBlock:", v6, CFSTR("Watchlist"), v5);

}

void __54__SCWWatchlistRenameWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "updatedName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encryptedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("name"));
}

- (SCWWatchlistRenameWatchlistCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SCWWatchlistRenameWatchlistCommand *v7;
  SCWWatchlistRenameWatchlistCommand *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchlistIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[SCWWatchlistRenameWatchlistCommand initWithWatchlistIdentifier:updatedName:](self, "initWithWatchlistIdentifier:updatedName:", v5, v6);
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
  -[SCWWatchlistRenameWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("watchlistIdentifier"));

  -[SCWWatchlistRenameWatchlistCommand updatedName](self, "updatedName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("name"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (NSString)updatedName
{
  return self->_updatedName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedName, 0);
  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
}

@end
