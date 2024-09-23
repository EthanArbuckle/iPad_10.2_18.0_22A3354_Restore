@implementation PKSecureElementConsistencyCheckResult

- (PKSecureElementConsistencyCheckResult)initWithCleanupActions:(int64_t)a3 resultsSummary:(id)a4 requestedActions:(id)a5 registeredRegions:(id)a6
{
  id v10;
  id v11;
  id v12;
  PKSecureElementConsistencyCheckResult *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSDictionary *summary;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = -[PKSecureElementConsistencyCheckResult init](self, "init");
  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = v14;
    if (v10)
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("state"));
    if (v12)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("registeredRegions"));
    v13->_cleanupActions = a3;
    v16 = objc_msgSend(v15, "copy");
    summary = v13->_summary;
    v13->_summary = (NSDictionary *)v16;

    objc_storeStrong((id *)&v13->_requestedActions, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PKConsistencyCheckCleanupActionsToString(self->_cleanupActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("cleanupActions: '%@'; "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("registerRegions: '%@'; "), self->_registerRegions);
  objc_msgSend(v3, "appendFormat:", CFSTR("requestedActions: '%@'; "), self->_requestedActions);
  objc_msgSend(v3, "appendFormat:", CFSTR("summary: '%@'; "), self->_summary);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (NSArray)requestedActions
{
  return self->_requestedActions;
}

- (int64_t)cleanupActions
{
  return self->_cleanupActions;
}

- (NSDictionary)summary
{
  return self->_summary;
}

- (NSArray)registerRegions
{
  return self->_registerRegions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registerRegions, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_requestedActions, 0);
}

@end
