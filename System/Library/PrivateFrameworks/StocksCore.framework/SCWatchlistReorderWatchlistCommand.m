@implementation SCWatchlistReorderWatchlistCommand

- (SCWatchlistReorderWatchlistCommand)initWithWatchlistIdentifier:(id)a3 precedingWatchlistIdentifier:(id)a4
{
  id v6;
  id v7;
  SCWatchlistReorderWatchlistCommand *v8;
  uint64_t v9;
  NSString *watchlistIdentifier;
  uint64_t v11;
  NSString *precedingWatchlistIdentifier;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SCWatchlistReorderWatchlistCommand;
  v8 = -[SCWatchlistReorderWatchlistCommand init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    watchlistIdentifier = v8->_watchlistIdentifier;
    v8->_watchlistIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    precedingWatchlistIdentifier = v8->_precedingWatchlistIdentifier;
    v8->_precedingWatchlistIdentifier = (NSString *)v11;

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
  aBlock[2] = __54__SCWatchlistReorderWatchlistCommand_executeWithZone___block_invoke;
  aBlock[3] = &unk_1E5AF1B68;
  aBlock[4] = self;
  v3 = a3;
  v4 = _Block_copy(aBlock);
  objc_msgSend(v3, "createOrUpdateRecordWithName:recordType:modifyBlock:", CFSTR("watchlistorder"), CFSTR("WatchlistOrder"), v4);

}

void __54__SCWatchlistReorderWatchlistCommand_executeWithZone___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C99E10];
  v29 = v3;
  objc_msgSend(v3, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("watchlistIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedSetWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "watchlistIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "precedingWatchlistIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "watchlistIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "containsObject:", v11);

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "precedingWatchlistIdentifier");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!v13
        || (v14 = (void *)v13,
            objc_msgSend(*(id *)(a1 + 32), "precedingWatchlistIdentifier"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v7, "containsObject:", v15),
            v15,
            v14,
            v16))
      {
        objc_msgSend(*(id *)(a1 + 32), "precedingWatchlistIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = *(void **)(a1 + 32);
        if (v17)
        {
          objc_msgSend(v18, "precedingWatchlistIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v7, "indexOfObject:", v19);

          if (v20 == 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_10:
            objc_msgSend(v7, "array");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "encryptedValues");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, CFSTR("watchlistIDs"));

            goto LABEL_11;
          }
          objc_msgSend(*(id *)(a1 + 32), "watchlistIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeObject:", v21);

          objc_msgSend(*(id *)(a1 + 32), "watchlistIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v7;
          v24 = v22;
          v25 = v20;
        }
        else
        {
          objc_msgSend(v18, "watchlistIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "removeObject:", v26);

          objc_msgSend(*(id *)(a1 + 32), "watchlistIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v7;
          v24 = v22;
          v25 = 0;
        }
        objc_msgSend(v23, "insertObject:atIndex:", v24, v25);

        goto LABEL_10;
      }
    }
  }
LABEL_11:

}

- (SCWatchlistReorderWatchlistCommand)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SCWatchlistReorderWatchlistCommand *v7;
  SCWatchlistReorderWatchlistCommand *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("precedingWatchlistIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("watchlistIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[SCWatchlistReorderWatchlistCommand initWithWatchlistIdentifier:precedingWatchlistIdentifier:](self, "initWithWatchlistIdentifier:precedingWatchlistIdentifier:", v6, v5);
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
  -[SCWatchlistReorderWatchlistCommand watchlistIdentifier](self, "watchlistIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("watchlistIdentifier"));

  -[SCWatchlistReorderWatchlistCommand precedingWatchlistIdentifier](self, "precedingWatchlistIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("precedingWatchlistIdentifier"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)watchlistIdentifier
{
  return self->_watchlistIdentifier;
}

- (NSString)precedingWatchlistIdentifier
{
  return self->_precedingWatchlistIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_precedingWatchlistIdentifier, 0);
  objc_storeStrong((id *)&self->_watchlistIdentifier, 0);
}

@end
