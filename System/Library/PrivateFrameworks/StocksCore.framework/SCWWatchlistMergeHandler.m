@implementation SCWWatchlistMergeHandler

- (id)commandsToMergeRecordWithServer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SCWWatchlistAddNewWatchlistCommand *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  SCWWatchlistAddToWatchlistOrderCommand *v22;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recordType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Watchlist"));

  if (v6)
  {
    objc_msgSend(v3, "encryptedValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("symbols"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "encryptedValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sortState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sortOrderState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("displayState"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SCWWatchlistAddNewWatchlistCommand initWithName:identifier:symbols:sortState:sortOrderState:displayState:]([SCWWatchlistAddNewWatchlistCommand alloc], "initWithName:identifier:symbols:sortState:sortOrderState:displayState:", v10, v12, v8, v13, v14, v15);
    objc_msgSend(v4, "addObject:", v16);

  }
  objc_msgSend(v3, "recordID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "recordName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("watchlistorder"));

  if (v19)
  {
    objc_msgSend(v3, "encryptedValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("watchlistIDs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v21, "count"))
    {
      v22 = -[SCWWatchlistAddToWatchlistOrderCommand initWithWatchlistIdentifiers:]([SCWWatchlistAddToWatchlistOrderCommand alloc], "initWithWatchlistIdentifiers:", v21);
      objc_msgSend(v4, "addObject:", v22);

    }
  }

  return v4;
}

@end
