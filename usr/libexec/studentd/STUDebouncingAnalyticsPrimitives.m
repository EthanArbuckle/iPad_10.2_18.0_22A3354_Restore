@implementation STUDebouncingAnalyticsPrimitives

- (STUDebouncingAnalyticsPrimitives)initWithUnderlyingPrimitives:(id)a3
{
  id v5;
  STUDebouncingAnalyticsPrimitives *v6;
  STUDebouncingAnalyticsPrimitives *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *eventCache;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STUDebouncingAnalyticsPrimitives;
  v6 = -[STUDebouncingAnalyticsPrimitives init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingPrimitives, a3);
    v8 = objc_opt_new(NSMutableDictionary);
    eventCache = v7->_eventCache;
    v7->_eventCache = v8;

  }
  return v7;
}

- (void)sendEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dictionaryValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUDebouncingAnalyticsPrimitives eventCache](self, "eventCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  v8 = objc_msgSend(v7, "isEqualToDictionary:", v4);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUDebouncingAnalyticsPrimitives eventCache](self, "eventCache"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "name"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUDebouncingAnalyticsPrimitives underlyingPrimitives](self, "underlyingPrimitives"));
    objc_msgSend(v11, "sendEvent:", v12);

  }
}

- (STUAnalyticsPrimitives)underlyingPrimitives
{
  return self->_underlyingPrimitives;
}

- (NSMutableDictionary)eventCache
{
  return self->_eventCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventCache, 0);
  objc_storeStrong((id *)&self->_underlyingPrimitives, 0);
}

@end
