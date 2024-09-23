@implementation PGUpNextMemoriesAggregator

- (PGUpNextMemoriesAggregator)initWithLowercaseTitles:(id)a3 keyAssetLocalIdentifiers:(id)a4 gateOnUserFeedback:(BOOL)a5 loggingConnection:(id)a6
{
  id v10;
  id v11;
  id v12;
  PGUpNextMemoriesAggregator *v13;
  PGUpNextMemoriesAggregator *v14;
  NSMutableArray *v15;
  NSMutableArray *acceptedMemories;
  uint64_t v17;
  NSMutableSet *lowercaseTitles;
  uint64_t v19;
  NSMutableSet *keyAssetLocalIdentifiers;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PGUpNextMemoriesAggregator;
  v13 = -[PGUpNextMemoriesAggregator init](&v22, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_gateOnUserFeedback = a5;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    acceptedMemories = v14->_acceptedMemories;
    v14->_acceptedMemories = v15;

    v17 = objc_msgSend(v10, "mutableCopy");
    lowercaseTitles = v14->_lowercaseTitles;
    v14->_lowercaseTitles = (NSMutableSet *)v17;

    v19 = objc_msgSend(v11, "mutableCopy");
    keyAssetLocalIdentifiers = v14->_keyAssetLocalIdentifiers;
    v14->_keyAssetLocalIdentifiers = (NSMutableSet *)v19;

    objc_storeStrong((id *)&v14->_loggingConnection, a6);
  }

  return v14;
}

- (BOOL)addUpNextMemory:(id)a3 debugInfo:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *loggingConnection;
  BOOL v17;
  id v18;
  NSObject *v20;
  void *v21;
  void *v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "memory");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyAssetLocalIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "memoryLocalIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "substringToIndex:", 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E8436F28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringToIndex:", 8);
  v14 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v14;
  if (-[NSMutableSet containsObject:](self->_lowercaseTitles, "containsObject:", v7))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Same title, skip memory: %@\n\t%@ - %@\n\tkeyAsset: %@"), v11, v12, v13, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v15;
LABEL_14:
      _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "[UpNext] %@", buf, 0xCu);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No key asset found for memory: %@\n\t%@ - %@)"), v11, v12, v13);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  if (-[NSMutableSet containsObject:](self->_keyAssetLocalIdentifiers, "containsObject:", v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Conflicting key asset for memory: %@\n\t%@ - %@\n\tkeyAsset: %@"), v11, v12, v13, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      goto LABEL_14;
    }
LABEL_15:
    v17 = 0;
    goto LABEL_16;
  }
  if (self->_gateOnUserFeedback && objc_msgSend(v5, "isBlockedByUserFeedback"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UserFeedbackScore below threshold, skip memory: %@\n\t%@ - %@\n\tkeyAsset: %@"), v11, v12, v13, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v15;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  -[NSMutableSet addObject:](self->_keyAssetLocalIdentifiers, "addObject:", v9);
  -[NSMutableSet addObject:](self->_lowercaseTitles, "addObject:", v7);
  -[NSMutableArray addObject:](self->_acceptedMemories, "addObject:", v23);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Accepted memory: %@\n\t%@ - %@\n\tkeyAsset: %@)"), v11, v12, v13, v14);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v20 = self->_loggingConnection;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v15;
    _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[UpNext] %@", buf, 0xCu);
  }
  v17 = 1;
LABEL_16:
  if (a4)
  {
    v18 = objc_retainAutorelease(v15);
    *a4 = v18;
    v15 = v18;
  }

  return v17;
}

- (BOOL)gateOnUserFeedback
{
  return self->_gateOnUserFeedback;
}

- (NSMutableArray)acceptedMemories
{
  return self->_acceptedMemories;
}

- (void)setAcceptedMemories:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedMemories, a3);
}

- (NSMutableSet)keyAssetLocalIdentifiers
{
  return self->_keyAssetLocalIdentifiers;
}

- (NSMutableSet)lowercaseTitles
{
  return self->_lowercaseTitles;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_acceptedMemories, 0);
  objc_storeStrong((id *)&self->_lowercaseTitles, 0);
  objc_storeStrong((id *)&self->_keyAssetLocalIdentifiers, 0);
}

@end
