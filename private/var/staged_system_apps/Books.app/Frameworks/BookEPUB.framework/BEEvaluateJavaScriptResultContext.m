@implementation BEEvaluateJavaScriptResultContext

- (BEEvaluateJavaScriptResultContext)init
{
  BEEvaluateJavaScriptResultContext *v2;
  uint64_t v3;
  NSMutableDictionary *results;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BEEvaluateJavaScriptResultContext;
  v2 = -[BEEvaluateJavaScriptResultContext init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    results = v2->_results;
    v2->_results = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)addResult:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = v9;
  if (!v9)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BEEvaluateJavaScriptResultContext results](self, "results"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v6);

  if (!v9)
}

- (id)resultForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BEEvaluateJavaScriptResultContext results](self, "results"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)stringResultForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class(NSString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEEvaluateJavaScriptResultContext resultForKey:](self, "resultForKey:", v4));

  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)dictionaryResultForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class(NSDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEEvaluateJavaScriptResultContext resultForKey:](self, "resultForKey:", v4));

  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)valueResultForKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class(NSValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEEvaluateJavaScriptResultContext resultForKey:](self, "resultForKey:", v4));

  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (NSArray)allKeys
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BEEvaluateJavaScriptResultContext results](self, "results"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));

  return (NSArray *)v3;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BEEvaluateJavaScriptResultContext results](self, "results"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> - results: %@"), v5, self, v6));

  return v7;
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
}

@end
