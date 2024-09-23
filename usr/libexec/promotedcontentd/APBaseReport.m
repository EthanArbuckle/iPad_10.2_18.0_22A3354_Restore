@implementation APBaseReport

- (APBaseReport)initWithReportDate:(id)a3 purpose:(int64_t)a4 reportEventCount:(id)a5
{
  id v8;
  id v9;
  APBaseReport *v10;
  APBaseReport *v11;
  APReportDate *v12;
  APReportDate *reportDate;
  uint64_t v14;
  NSDictionary *properties;
  uint64_t v16;
  NSDictionary *environmentToBranchDic;
  objc_super v19;

  v8 = a3;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)APBaseReport;
  v10 = -[APBaseReport init](&v19, "init");
  v11 = v10;
  if (v10)
  {
    v10->_purpose = a4;
    v12 = -[APReportDate initWithDate:]([APReportDate alloc], "initWithDate:", v8);
    reportDate = v11->_reportDate;
    v11->_reportDate = v12;

    objc_storeStrong((id *)&v11->_reportEventCount, a5);
    v14 = objc_claimAutoreleasedReturnValue(-[APBaseReport _createProperties](v11, "_createProperties"));
    properties = v11->_properties;
    v11->_properties = (NSDictionary *)v14;

    v16 = objc_claimAutoreleasedReturnValue(-[APBaseReport _createBranchForEnvironments](v11, "_createBranchForEnvironments"));
    environmentToBranchDic = v11->_environmentToBranchDic;
    v11->_environmentToBranchDic = (NSDictionary *)v16;

  }
  return v11;
}

+ (int64_t)reportFrequency
{
  return 1901;
}

+ (id)reportFrequencyStringKey
{
  id v2;
  const __CFString *v3;

  v2 = objc_msgSend((id)objc_opt_class(a1), "reportFrequency");
  v3 = CFSTR("1d");
  if (v2 == (id)1902)
    v3 = CFSTR("1w");
  if (v2 == (id)1903)
    return CFSTR("1m");
  else
    return (id)v3;
}

- (void)setReportDate:(id)a3
{
  NSDictionary *v5;
  NSDictionary *properties;
  NSDictionary *v7;
  NSDictionary *environmentToBranchDic;
  id v9;

  objc_storeStrong((id *)&self->_reportDate, a3);
  v9 = a3;
  v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[APBaseReport _createProperties](self, "_createProperties"));
  properties = self->_properties;
  self->_properties = v5;

  v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue(-[APBaseReport _createBranchForEnvironments](self, "_createBranchForEnvironments"));
  environmentToBranchDic = self->_environmentToBranchDic;
  self->_environmentToBranchDic = v7;

}

- (id)_createProperties
{
  NSString *v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v4));
  APSimulateCrash(5, v5, 1);

  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v7));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v8, 0));

  objc_exception_throw(v9);
}

- (id)_eventCountDictionary
{
  NSString *v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v4));
  APSimulateCrash(5, v5, 1);

  v6 = NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v7));
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v8, 0));

  objc_exception_throw(v9);
}

- (id)_createBranchForEnvironments
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APBaseReport _eventCountDictionary](self, "_eventCountDictionary"));
  if (objc_msgSend(v2, "count"))
  {
    v20 = objc_alloc_init((Class)NSMutableDictionary);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v3)
    {
      v4 = v3;
      v19 = *(_QWORD *)v26;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(obj);
          v6 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v5);
          v7 = objc_alloc_init((Class)NSMutableSet);
          v8 = v2;
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", v6));
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v22;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v22 != v12)
                  objc_enumerationMutation(v9);
                v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1)
                                                                                   + 8 * (_QWORD)v13), "branch"));
                if (v14)
                  objc_msgSend(v7, "addObjectsFromArray:", v14);

                v13 = (char *)v13 + 1;
              }
              while (v11 != v13);
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v11);
          }
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
          objc_msgSend(v20, "setObject:forKey:", v15, v6);

          v5 = (char *)v5 + 1;
          v2 = v8;
        }
        while (v5 != v4);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v4);
    }

    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v20));
  }
  else
  {
    v16 = objc_alloc_init((Class)NSDictionary);
  }

  return v16;
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (APReportDate)reportDate
{
  return self->_reportDate;
}

- (int64_t)metric
{
  return self->_metric;
}

- (NSDictionary)environmentToBranchDic
{
  return self->_environmentToBranchDic;
}

- (NSString)reportType
{
  return self->_reportType;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (APDBReportEventCount)reportEventCount
{
  return self->_reportEventCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportEventCount, 0);
  objc_storeStrong((id *)&self->_reportType, 0);
  objc_storeStrong((id *)&self->_environmentToBranchDic, 0);
  objc_storeStrong((id *)&self->_reportDate, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
