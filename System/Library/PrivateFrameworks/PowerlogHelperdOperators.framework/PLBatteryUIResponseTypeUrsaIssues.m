@implementation PLBatteryUIResponseTypeUrsaIssues

- (id)dependencies
{
  return 0;
}

- (void)configure:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLEnergyIssuesService, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("UrsaDefinition"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  objc_msgSend(v6, "timeIntervalSince1970");
  v9 = v8;
  objc_msgSend(v7, "timeIntervalSince1970");
  v11 = v10;

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ > %f"), CFSTR("timestampInvalid"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryUIResponseTypeUrsaIssues responderService](self, "responderService");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "storage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "entriesForKey:inTimeRange:withFilters:", v4, v18, v9, v11 - v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUrsaIssues setDbResult:](self, "setDbResult:", v19);

}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[PLBatteryUIResponseTypeUrsaIssues setIssues:](self, "setIssues:", v3);

  -[PLBatteryUIResponseTypeUrsaIssues dbResult](self, "dbResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[PLBatteryUIResponseTypeUrsaIssues dbResult](self, "dbResult", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
          if (v11)
          {
            objc_msgSend(v11, "dictionary");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    if (objc_msgSend(v5, "count"))
    {
      -[PLBatteryUIResponseTypeUrsaIssues issues](self, "issues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKey:", v5, CFSTR("UrsaDefinition"));

    }
  }
}

- (id)result
{
  void *v2;
  void *v3;

  -[PLBatteryUIResponseTypeUrsaIssues issues](self, "issues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponderService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)dbResult
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDbResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)issues
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIssues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issues, 0);
  objc_storeStrong((id *)&self->_dbResult, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end
