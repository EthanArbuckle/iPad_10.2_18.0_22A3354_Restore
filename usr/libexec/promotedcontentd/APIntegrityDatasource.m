@implementation APIntegrityDatasource

+ (int64_t)reportFrequency
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v3 = +[APConfigurationMediator configurationForClass:](APConfigurationMediator, "configurationForClass:", objc_opt_class(APCSIntegrityReport));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reportingFrequency"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reportingFrequency"));
    v7 = objc_msgSend(v6, "integerValue");

  }
  else
  {
    v9.receiver = a1;
    v9.super_class = (Class)&OBJC_METACLASS___APIntegrityDatasource;
    v7 = objc_msgSendSuper2(&v9, "reportFrequency");
  }

  return (int64_t)v7;
}

- (id)reportType
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%lu"), v5, -[APBaseReport purpose](self, "purpose")));

  return v6;
}

- (id)_createProperties
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id obj;
  uint64_t v27;
  void *v28;
  id v29;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APIntegrityDatasource _eventCountDictionary](self, "_eventCountDictionary"));
  v3 = v2;
  if (v2 && objc_msgSend(v2, "count"))
  {
    v29 = objc_alloc_init((Class)NSMutableDictionary);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v31)
    {
      v27 = *(_QWORD *)v40;
      v28 = v3;
      do
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v40 != v27)
            objc_enumerationMutation(obj);
          v34 = v4;
          v5 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v4);
          v6 = objc_alloc_init((Class)NSMutableDictionary);
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[APBaseReport reportDate](self, "reportDate"));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "reportDayString"));
          objc_msgSend(v6, "setObject:forKey:", v8, CFSTR("date_MMDD"));

          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[APBaseReport purpose](self, "purpose")));
          objc_msgSend(v6, "setObject:forKey:", v9, CFSTR("report_purpose"));

          v10 = (void *)objc_claimAutoreleasedReturnValue(+[APBaseReport reportFrequencyStringKey](APIntegrityDatasource, "reportFrequencyStringKey"));
          v33 = v6;
          objc_msgSend(v6, "setObject:forKey:", v10, CFSTR("report_frequency"));

          v32 = v5;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v5));
          v12 = objc_alloc_init((Class)NSMutableDictionary);
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v13 = v11;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(_QWORD *)v36 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "event"));
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", v19));

                if (v20)
                {
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "count"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)objc_msgSend(v21, "integerValue")+ (_QWORD)objc_msgSend(v20, "integerValue")));

                }
                else
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "count"));
                }
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "event"));
                objc_msgSend(v12, "setObject:forKey:", v22, v23);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
            }
            while (v15);
          }

          objc_msgSend(v33, "setObject:forKey:", v12, CFSTR("event_count"));
          objc_msgSend(v29, "setObject:forKey:", v33, v32);

          v4 = v34 + 1;
          v3 = v28;
        }
        while ((id)(v34 + 1) != v31);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v31);
    }

    v24 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v29));
  }
  else
  {
    v24 = objc_alloc_init((Class)NSDictionary);
  }

  return v24;
}

- (id)_eventCountDictionary
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APBaseReport reportDate](self, "reportDate"));
  v4 = -[APBaseReport purpose](self, "purpose");
  if (objc_msgSend((id)objc_opt_class(self), "reportFrequency") == (id)1901
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[APBaseReport reportEventCount](self, "reportEventCount")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v3, "reportEndDay"))), v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v4)), v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupedEventCountForDayOfYear:purpose:", v6, v7)), v7, v6, v5, v8))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v8));

  }
  else
  {
    v9 = objc_alloc_init((Class)NSDictionary);
  }

  return v9;
}

- (int64_t)metric
{
  return 1500;
}

@end
