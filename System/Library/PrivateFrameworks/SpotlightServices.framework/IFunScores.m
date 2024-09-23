@implementation IFunScores

- (IFunScores)initWithSFEngagementSignal:(id)a3
{
  id v4;
  IFunScores *v5;
  uint64_t v6;
  NSNumber *serverScore;
  uint64_t v8;
  NSNumber *localScore;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDictionary *domainScores;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)IFunScores;
  v5 = -[IFunScores init](&v30, sel_init);
  if (v4)
  {
    objc_msgSend(v4, "serverScore");
    v6 = objc_claimAutoreleasedReturnValue();
    serverScore = v5->_serverScore;
    v5->_serverScore = (NSNumber *)v6;

    objc_msgSend(v4, "localScore");
    v8 = objc_claimAutoreleasedReturnValue();
    localScore = v5->_localScore;
    v5->_localScore = (NSNumber *)v8;

    objc_msgSend(v4, "domainEngagementScores");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = (void *)objc_opt_new();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v25 = v4;
      objc_msgSend(v4, "domainEngagementScores");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v27 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            if (objc_msgSend(v18, "domain"))
            {
              objc_msgSend(v18, "score");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                objc_msgSend(v18, "score");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v18, "domain"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v21);

              }
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v15);
      }

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v12);
      v22 = objc_claimAutoreleasedReturnValue();
      domainScores = v5->_domainScores;
      v5->_domainScores = (NSDictionary *)v22;

      v4 = v25;
    }
  }

  return v5;
}

- (NSNumber)serverScore
{
  return self->_serverScore;
}

- (void)setServerScore:(id)a3
{
  objc_storeStrong((id *)&self->_serverScore, a3);
}

- (NSNumber)localScore
{
  return self->_localScore;
}

- (void)setLocalScore:(id)a3
{
  objc_storeStrong((id *)&self->_localScore, a3);
}

- (NSDictionary)domainScores
{
  return self->_domainScores;
}

- (void)setDomainScores:(id)a3
{
  objc_storeStrong((id *)&self->_domainScores, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainScores, 0);
  objc_storeStrong((id *)&self->_localScore, 0);
  objc_storeStrong((id *)&self->_serverScore, 0);
}

@end
