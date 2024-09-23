@implementation APTargetingExpressionResults

+ (NSMutableDictionary)mutableResults
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v2 = (void *)qword_1002687E8;
  if (!qword_1002687E8)
  {
    v3 = objc_alloc_init((Class)APUnfairRecursiveLock);
    +[APTargetingExpressionResults setLock:](APTargetingExpressionResults, "setLock:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[APTargetingExpressionResults lock](APTargetingExpressionResults, "lock"));
    objc_msgSend(v4, "lock");

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v6 = (void *)qword_1002687E8;
    qword_1002687E8 = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[APTargetingExpressionResults lock](APTargetingExpressionResults, "lock"));
    objc_msgSend(v7, "unlock");

    v2 = (void *)qword_1002687E8;
  }
  return (NSMutableDictionary *)v2;
}

+ (APUnfairRecursiveLock)lock
{
  return (APUnfairRecursiveLock *)(id)qword_1002687E0;
}

+ (void)setLock:(id)a3
{
  objc_storeStrong((id *)&qword_1002687E0, a3);
}

+ (NSDictionary)results
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[APTargetingExpressionResults mutableResults](APTargetingExpressionResults, "mutableResults"));
  v3 = objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

+ (void)addResult:(id)a3 result:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v5 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[APTargetingExpressionResults mutableResults](APTargetingExpressionResults, "mutableResults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APTargetingExpressionResults lock](APTargetingExpressionResults, "lock"));
  objc_msgSend(v6, "lock");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(v9, "setObject:forKey:", v7, v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[APTargetingExpressionResults lock](APTargetingExpressionResults, "lock"));
  objc_msgSend(v8, "unlock");

}

+ (void)clearResults
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[APTargetingExpressionResults lock](APTargetingExpressionResults, "lock"));
  objc_msgSend(v2, "lock");

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APTargetingExpressionResults mutableResults](APTargetingExpressionResults, "mutableResults"));
  objc_msgSend(v3, "removeAllObjects");

  v4 = (id)objc_claimAutoreleasedReturnValue(+[APTargetingExpressionResults lock](APTargetingExpressionResults, "lock"));
  objc_msgSend(v4, "unlock");

}

@end
