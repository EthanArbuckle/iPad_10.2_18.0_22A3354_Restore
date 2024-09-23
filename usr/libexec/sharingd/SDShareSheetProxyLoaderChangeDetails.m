@implementation SDShareSheetProxyLoaderChangeDetails

- (SDShareSheetProxyLoaderChangeDetails)init
{
  SDShareSheetProxyLoaderChangeDetails *v2;
  uint64_t v3;
  NSMutableArray *proxySections;
  uint64_t v5;
  NSMutableDictionary *resultsBySectionType;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SDShareSheetProxyLoaderChangeDetails;
  v2 = -[SDShareSheetProxyLoaderChangeDetails init](&v8, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    proxySections = v2->_proxySections;
    v2->_proxySections = (NSMutableArray *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    resultsBySectionType = v2->_resultsBySectionType;
    v2->_resultsBySectionType = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (NSArray)changedProxySections
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoaderChangeDetails proxySections](self, "proxySections"));
  v3 = objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)addResult:(id)a3 forProxySection:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (!v13)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDShareSheetProxyLoaderManager.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("result"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SDShareSheetProxyLoaderManager.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("proxySection"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoaderChangeDetails resultsBySectionType](self, "resultsBySectionType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "type")));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoaderChangeDetails proxySections](self, "proxySections"));
  objc_msgSend(v10, "addObject:", v7);

}

- (id)loadedIndexesForProxySection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoaderChangeDetails resultsBySectionType](self, "resultsBySectionType"));
  v6 = objc_msgSend(v4, "type");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "loadedIndexes"));
  return v9;
}

- (id)failedIndexesForProxySection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDShareSheetProxyLoaderChangeDetails resultsBySectionType](self, "resultsBySectionType"));
  v6 = objc_msgSend(v4, "type");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "failedIndexes"));
  return v9;
}

- (NSMutableArray)proxySections
{
  return self->_proxySections;
}

- (void)setProxySections:(id)a3
{
  objc_storeStrong((id *)&self->_proxySections, a3);
}

- (NSMutableDictionary)resultsBySectionType
{
  return self->_resultsBySectionType;
}

- (void)setResultsBySectionType:(id)a3
{
  objc_storeStrong((id *)&self->_resultsBySectionType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsBySectionType, 0);
  objc_storeStrong((id *)&self->_proxySections, 0);
}

@end
