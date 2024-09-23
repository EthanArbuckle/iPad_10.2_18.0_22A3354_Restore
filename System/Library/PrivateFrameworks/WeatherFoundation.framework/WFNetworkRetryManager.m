@implementation WFNetworkRetryManager

- (WFNetworkRetryManager)init
{
  WFNetworkRetryManager *v2;
  uint64_t v3;
  NSMutableDictionary *failTrackerDict;
  uint64_t v5;
  NSMutableSet *failingAPIVersionsSet;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFNetworkRetryManager;
  v2 = -[WFNetworkRetryManager init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    failTrackerDict = v2->_failTrackerDict;
    v2->_failTrackerDict = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    failingAPIVersionsSet = v2->_failingAPIVersionsSet;
    v2->_failingAPIVersionsSet = (NSMutableSet *)v5;

  }
  return v2;
}

- (id)apiVersionForSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  -[WFNetworkRetryManager failTrackerDict](self, "failTrackerDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "apiVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFNetworkRetryManager defaultAPIVersionIsFailingForSettings:failTracker:](self, "defaultAPIVersionIsFailingForSettings:failTracker:", v4, v7))
  {
    -[WFNetworkRetryManager failingAPIVersionsSet](self, "failingAPIVersionsSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "apiVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(v4, "apiVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[WFNetworkRetryManager failingAPIVersionsSet](self, "failingAPIVersionsSet");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "apiVersion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

      }
    }
    objc_msgSend(v4, "apiVersionFallback");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "apiVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[WFNetworkRetryManager failingAPIVersionsSet](self, "failingAPIVersionsSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "apiVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObject:", v17);

    }
    objc_msgSend(v4, "apiVersion");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v14;

  return v18;
}

- (void)requestSuccessForAPIVersion:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[WFNetworkRetryManager failTrackerDict](self, "failTrackerDict");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v4);

  }
}

- (void)requestFailureForAPIVersion:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  if (v5)
  {
    v9 = v5;
    -[WFNetworkRetryManager failTrackerDict](self, "failTrackerDict");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v7 = (void *)objc_opt_new();
      -[WFNetworkRetryManager failTrackerDict](self, "failTrackerDict");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    }
    objc_msgSend(v7, "incrementFailCount");

    v5 = v9;
  }

}

- (BOOL)defaultAPIVersionIsFailingForSettings:(id)a3 failTracker:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6
    && (v8 = objc_msgSend(v6, "numConsecutiveFails"),
        objc_msgSend(v5, "networkFailedAttemptsLimit") < (unint64_t)v8))
  {
    v9 = objc_msgSend(v7, "lastFailTimeExpiredForSettings:", v5) ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (NSArray)apiVersions
{
  void *v2;
  void *v3;

  -[WFNetworkRetryManager failTrackerDict](self, "failTrackerDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)failingAPIVersions
{
  void *v2;
  void *v3;

  -[WFNetworkRetryManager failingAPIVersionsSet](self, "failingAPIVersionsSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int)consecutiveFailsForAPIVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFNetworkRetryManager failTrackerDict](self, "failTrackerDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "numConsecutiveFails");
  return (int)v4;
}

- (double)lastFailTimeInSecondsForAPIVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[WFNetworkRetryManager failTrackerDict](self, "failTrackerDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastFailTimeInSeconds");
  v8 = v7;

  return v8;
}

- (NSMutableDictionary)failTrackerDict
{
  return self->_failTrackerDict;
}

- (NSMutableSet)failingAPIVersionsSet
{
  return self->_failingAPIVersionsSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failingAPIVersionsSet, 0);
  objc_storeStrong((id *)&self->_failTrackerDict, 0);
}

@end
