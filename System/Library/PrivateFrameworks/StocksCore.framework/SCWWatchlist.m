@implementation SCWWatchlist

- (SCWWatchlist)initWithIdentifier:(id)a3 name:(id)a4 symbols:(id)a5 sortState:(id)a6 sortOrderState:(id)a7 displayState:(id)a8
{
  id v15;
  id v16;
  id v17;
  SCWWatchlist *v18;
  SCWWatchlist *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SCWWatchlist;
  v18 = -[SCWWatchlist init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_name, a4);
    objc_storeStrong((id *)&v19->_symbols, a5);
    objc_storeStrong((id *)&v19->_sortState, a6);
    objc_storeStrong((id *)&v19->_sortOrderState, a7);
    objc_storeStrong((id *)&v19->_displayState, a8);
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SCWWatchlist name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCWWatchlist symbols](self, "symbols");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCWWatchlist sortState](self, "sortState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCWWatchlist sortOrderState](self, "sortOrderState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCWWatchlist displayState](self, "displayState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<SCWWatchlist %p, name=%@ symbols=%@ sortState=%@ sortOrderState=%@ displayState=%@>"), self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)symbols
{
  return self->_symbols;
}

- (NSNumber)sortState
{
  return self->_sortState;
}

- (NSNumber)sortOrderState
{
  return self->_sortOrderState;
}

- (NSNumber)displayState
{
  return self->_displayState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayState, 0);
  objc_storeStrong((id *)&self->_sortOrderState, 0);
  objc_storeStrong((id *)&self->_sortState, 0);
  objc_storeStrong((id *)&self->_symbols, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
