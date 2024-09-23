@implementation IMConfiguration

- (IMConfiguration)init
{
  IMConfiguration *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pairsToKeyMap;
  NSMutableDictionary *v5;
  NSMutableDictionary *cache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMConfiguration;
  v2 = -[IMConfiguration init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pairsToKeyMap = v2->_pairsToKeyMap;
    v2->_pairsToKeyMap = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    cache = v2->_cache;
    v2->_cache = v5;

  }
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMConfiguration;
  v3 = -[IMConfiguration description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfiguration pairsToKeyMap](self, "pairsToKeyMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)valueForKey:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  unsigned int v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfiguration cache](self, "cache"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v6));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v26 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfiguration _predicateValuePairsForKey:](self, "_predicateValuePairsForKey:", v6));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "predicate"));
          v18 = objc_msgSend(v17, "evaluateWithContext:", v7);

          if (v18)
            objc_msgSend(v10, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      }
      while (v13);
    }
    if (objc_msgSend(v10, "count"))
    {
      if (objc_msgSend(v10, "count") == (char *)&dword_0 + 1)
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
      else
        v19 = objc_claimAutoreleasedReturnValue(-[IMConfiguration _selectTopScoringPairInArray:](self, "_selectTopScoringPairInArray:", v10));
      v23 = v19;
      v6 = v26;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject value](v19, "value"));
      if (v9)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfiguration cache](self, "cache"));
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v9, v26);

      }
    }
    else
    {
      v20 = BCIMLog();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v32 = "-[IMConfiguration valueForKey:context:]";
        v33 = 2080;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/ViewControllers/Configuration/IMConfiguration.m";
        v35 = 1024;
        LODWORD(v36) = 114;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v22 = BCIMLog();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      v6 = v26;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v32 = (const char *)v26;
        v33 = 2112;
        v34 = (const char *)v11;
        v35 = 2112;
        v36 = v7;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "@\"Failed to match for {%@} in {%@} ctx {%@}\", buf, 0x20u);
      }
      v9 = 0;
    }

  }
  return v9;
}

- (double)floatForKey:(id)a3 context:(id)a4
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfiguration valueForKey:context:](self, "valueForKey:context:", a3, a4));
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  return v6;
}

- (double)BOOLForKey:(id)a3 context:(id)a4
{
  void *v4;
  double v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfiguration valueForKey:context:](self, "valueForKey:context:", a3, a4));
  v5 = (double)objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (int64_t)integerForKey:(id)a3 context:(id)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfiguration valueForKey:context:](self, "valueForKey:context:", a3, a4));
  v5 = objc_msgSend(v4, "integerValue");

  return (int64_t)v5;
}

- (CGPoint)pointForKey:(id)a3 context:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfiguration valueForKey:context:](self, "valueForKey:context:", a3, a4));
  objc_msgSend(v4, "CGPointValue");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGSize)sizeForKey:(id)a3 context:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfiguration valueForKey:context:](self, "valueForKey:context:", a3, a4));
  objc_msgSend(v4, "CGSizeValue");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGRect)rectForKey:(id)a3 context:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfiguration valueForKey:context:](self, "valueForKey:context:", a3, a4));
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (UIEdgeInsets)edgeInsetsForKey:(id)a3 context:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  UIEdgeInsets result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfiguration valueForKey:context:](self, "valueForKey:context:", a3, a4));
  objc_msgSend(v4, "uiEdgeInsetsValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)addValue:(id)a3 predicate:(id)a4 forKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  IMConfigurationPredicateValuePair *v12;
  id v13;

  v13 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[IMConfiguration _predicateValuePairsForKey:](self, "_predicateValuePairsForKey:", v13));
  if (!v10)
  {
    v10 = objc_alloc_init((Class)NSMutableArray);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfiguration pairsToKeyMap](self, "pairsToKeyMap"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v13);

  }
  v12 = objc_alloc_init(IMConfigurationPredicateValuePair);
  -[IMConfigurationPredicateValuePair setPredicate:](v12, "setPredicate:", v8);

  -[IMConfigurationPredicateValuePair setValue:](v12, "setValue:", v9);
  objc_msgSend(v10, "addObject:", v12);

}

- (void)addWithPredicate:(id)a3 adder:(id)a4
{
  void (**v6)(id, IMConfigurationAdder *);
  IMConfigurationAdder *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, IMConfigurationAdder *))a4;
  if (self->_addProhibited)
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("IMConfigurationWrongAdderCalledError"), CFSTR("IMConfiguration addWithPredicate can't be called within an adder block"));
  v7 = -[IMConfigurationAdder initWithConfiguration:predicate:]([IMConfigurationAdder alloc], "initWithConfiguration:predicate:", self, v8);
  -[IMConfiguration setAddProhibited:](self, "setAddProhibited:", 1);
  -[IMConfigurationAdder setAddProhibited:](v7, "setAddProhibited:", 0);
  v6[2](v6, v7);
  -[IMConfigurationAdder setAddProhibited:](v7, "setAddProhibited:", 1);
  -[IMConfiguration setAddProhibited:](self, "setAddProhibited:", 0);

}

- (void)invalidate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IMConfiguration cache](self, "cache"));
  objc_msgSend(v2, "removeAllObjects");

}

- (id)_predicateValuePairsForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMConfiguration pairsToKeyMap](self, "pairsToKeyMap"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (id)_selectTopScoringPairInArray:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];

  v3 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0x8000000000000000;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_15DDC;
  v6[3] = &unk_28BED0;
  v6[4] = v11;
  v6[5] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  if (v8[3] == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:"));
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(v11, 8);

  return v4;
}

- (NSMutableDictionary)pairsToKeyMap
{
  return self->_pairsToKeyMap;
}

- (void)setPairsToKeyMap:(id)a3
{
  objc_storeStrong((id *)&self->_pairsToKeyMap, a3);
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (BOOL)addProhibited
{
  return self->_addProhibited;
}

- (void)setAddProhibited:(BOOL)a3
{
  self->_addProhibited = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_pairsToKeyMap, 0);
}

@end
