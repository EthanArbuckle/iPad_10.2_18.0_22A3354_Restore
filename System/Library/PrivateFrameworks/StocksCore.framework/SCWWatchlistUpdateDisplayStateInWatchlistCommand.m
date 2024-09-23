@implementation SCWWatchlistUpdateDisplayStateInWatchlistCommand

- (SCWWatchlistUpdateDisplayStateInWatchlistCommand)initWithWatchlistIdentifier:(id)a3 displayState:(id)a4
{
  id v6;
  id v7;
  SCWWatchlistUpdateDisplayStateInWatchlistCommand *v8;
  uint64_t v9;
  NSString *watchlistIdentifier;
  uint64_t v11;
  NSNumber *displayState;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWWatchlistUpdateDisplayStateInWatchlistCommand;
  v8 = -[SCWWatchlistUpdateDisplayStateInWatchlistCommand init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    watchlistIdentifier = v8->_watchlistIdentifier;
    v8->_watchlistIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    displayState = v8->_displayState;
    v8->_displayState = (NSNumber *)v11;

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
  aBlock[2] = __68__SCWWatchlistUpdateDisplayStateInWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v4 = a3;
  v5 = _Block_copy(aBlock);
  -[SCWWatchlistUpdateDisplayStateInWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createOrUpdateRecordWithName:recordType:modifyBlock:", v6, CFSTR("Watchlist"), v5);

}

void __68__SCWWatchlistUpdateDisplayStateInWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "displayState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("displayState"));

}

- (SCWWatchlistUpdateDisplayStateInWatchlistCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SCWWatchlistUpdateDisplayStateInWatchlistCommand *v7;
  SCWWatchlistUpdateDisplayStateInWatchlistCommand *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchlistIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[SCWWatchlistUpdateDisplayStateInWatchlistCommand initWithWatchlistIdentifier:displayState:](self, "initWithWatchlistIdentifier:displayState:", v5, v6);
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
  -[SCWWatchlistUpdateDisplayStateInWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("watchlistIdentifier"));

  -[SCWWatchlistUpdateDisplayStateInWatchlistCommand displayState](self, "displayState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayState"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (NSNumber)displayState
{
  return self->_displayState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayState, 0);
  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
}

@end
