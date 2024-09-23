@implementation PGTrialSession

- (PGTrialSession)init
{
  PGTrialSession *v2;
  uint64_t v3;
  TRIClient *trialClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGTrialSession;
  v2 = -[PGTrialSession init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 235);
    v3 = objc_claimAutoreleasedReturnValue();
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v3;

  }
  return v2;
}

- (id)levelForFactorName:(id)a3 withNamespaceType:(unsigned __int16)a4
{
  uint64_t v4;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  const __CFString *v13;
  int v15;
  const __CFString *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  -[PGTrialSession namespaceNameForNamespaceType:](self, "namespaceNameForNamespaceType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (v4 > 5)
        v13 = CFSTR("unknown");
      else
        v13 = off_1E842D508[v4];
      v15 = 138412290;
      v16 = v13;
      v11 = "[TrialSession] no namespaceName found for namespaceType %@";
      goto LABEL_10;
    }
LABEL_11:

    v8 = 0;
    goto LABEL_12;
  }
  -[TRIClient levelForFactor:withNamespaceName:](self->_trialClient, "levelForFactor:withNamespaceName:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loggingConnection");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v15 = 138412290;
      v16 = v6;
      v11 = "[TrialSession] nil level found for factor name %@";
LABEL_10:
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

- (id)dictionaryForFactorName:(id)a3 withNamespaceType:(unsigned __int16)a4
{
  uint64_t v4;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  NSObject *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PGTrialSession levelForFactorName:withNamespaceType:](self, "levelForFactorName:withNamespaceType:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "hasPath") & 1) == 0)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "[TrialSession] levelFile.hasPath evaluated to false for factor name %@", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_9;
  }
  objc_msgSend(v8, "path");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v9);
  if (!v10)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[TrialSession] failed to load dictionary at filepath %@", (uint8_t *)&v16, 0xCu);
    }

LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v11 = (void *)v10;
LABEL_10:

  return v11;
}

- (id)arrayForFactorName:(id)a3 withNamespaceType:(unsigned __int16)a4
{
  uint64_t v4;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  NSObject *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PGTrialSession levelForFactorName:withNamespaceType:](self, "levelForFactorName:withNamespaceType:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "hasPath") & 1) == 0)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v6;
      _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_INFO, "[TrialSession] levelFile.hasPath evaluated to false for factor name %@", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_9;
  }
  objc_msgSend(v8, "path");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithContentsOfFile:", v9);
  if (!v10)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[TrialSession] failed to load array at filepath %@", (uint8_t *)&v16, 0xCu);
    }

LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v11 = (void *)v10;
LABEL_10:

  return v11;
}

- (id)namespaceNameForNamespaceType:(unsigned __int16)a3
{
  if ((a3 - 1) > 4)
    return CFSTR("UNKNOWN");
  else
    return off_1E842D538[(unsigned __int16)(a3 - 1)];
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
  objc_storeStrong((id *)&self->_trialClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end
