@implementation SCWWatchlistRemoveWatchlistCommand

- (SCWWatchlistRemoveWatchlistCommand)initWithWatchlistIdentifier:(id)a3
{
  id v4;
  SCWWatchlistRemoveWatchlistCommand *v5;
  uint64_t v6;
  NSString *watchlistIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCWWatchlistRemoveWatchlistCommand;
  v5 = -[SCWWatchlistRemoveWatchlistCommand init](&v9, sel_init);
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
  id v4;
  id v5;

  v4 = a3;
  -[SCWWatchlistRemoveWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteRecordWithName:", v5);

}

- (SCWWatchlistRemoveWatchlistCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SCWWatchlistRemoveWatchlistCommand *v6;
  SCWWatchlistRemoveWatchlistCommand *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchlistIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[SCWWatchlistRemoveWatchlistCommand initWithWatchlistIdentifier:](self, "initWithWatchlistIdentifier:", v5);
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
  -[SCWWatchlistRemoveWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
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
