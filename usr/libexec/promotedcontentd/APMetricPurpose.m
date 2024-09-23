@implementation APMetricPurpose

- (id)stringForMetric:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name")));

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)metricIsDefined:(int64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v4));
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (BOOL)metricIsDiagnosticsAndUsage:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dnu")));
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (APEventChannel)channel
{
  return self->_channel;
}

- (BOOL)_validateMetric:(id)a3 forKey:(id)a4 fromDictionary:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  int v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  NSObject *v34;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("value")));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dnu")));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("disabled")));
    v14 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v11, v14) & 1) != 0
      && (!v12 || (v15 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v12, v15) & 1) != 0))
      && (!v13 || (v16 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v13, v16) & 1) != 0)))
    {
      v17 = 1;
    }
    else
    {
      v19 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v11, v19) & 1) == 0)
      {
        v20 = APLogForCategory(29);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v29 = 138543874;
          v30 = v7;
          v31 = 2114;
          v32 = v8;
          v33 = 2114;
          v34 = v11;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "The purpose (%{public}@) metric (%{public}@) value (%{public}@) isn't a number!", (uint8_t *)&v29, 0x20u);
        }

      }
      if (v12)
      {
        v22 = objc_opt_class(NSNumber);
        if ((objc_opt_isKindOfClass(v12, v22) & 1) == 0)
        {
          v23 = APLogForCategory(29);
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v29 = 138543874;
            v30 = v7;
            v31 = 2114;
            v32 = v8;
            v33 = 2114;
            v34 = v12;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "The purpose (%{public}@) metric (%{public}@) dnu (%{public}@) isn't a number!", (uint8_t *)&v29, 0x20u);
          }

        }
      }
      if (v13)
      {
        v25 = objc_opt_class(NSNumber);
        if ((objc_opt_isKindOfClass(v13, v25) & 1) == 0)
        {
          v26 = APLogForCategory(29);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v29 = 138543874;
            v30 = v7;
            v31 = 2114;
            v32 = v8;
            v33 = 2114;
            v34 = v13;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "The purpose (%{public}@) metric (%{public}@) dnu (%{public}@) isn't a number!", (uint8_t *)&v29, 0x20u);
          }

        }
      }
      v17 = 0;
    }

  }
  else
  {
    v18 = APLogForCategory(29);
    v11 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138543618;
      v30 = v7;
      v31 = 2114;
      v32 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "The purpose (%{public}@) value for metric (%{public}@) isn't a dictionary!", (uint8_t *)&v29, 0x16u);
    }
    v17 = 0;
  }

  return v17;
}

- (BOOL)_validateMetric:(id)a3 withMetrics:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;
  void *i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v21 = APLogForCategory(29);
    v9 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v6;
      v22 = "The purpose (%{public}@) metrics are nil!";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
    }
LABEL_22:
    v20 = 0;
    goto LABEL_23;
  }
  v8 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    v23 = APLogForCategory(29);
    v9 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = v6;
      v22 = "The purpose (%{public}@) metrics in the definition isn't a dictionary!";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v7;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    v13 = 1;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        v16 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
        {
          v17 = APLogForCategory(29);
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v30 = v6;
            v31 = 2114;
            v32 = v15;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "The purpose (%{public}@) has a metric key (%{public}@) that is not a string!", buf, 0x16u);
          }

          v13 = 0;
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v15));
        if (!-[APMetricPurpose _validateMetric:forKey:fromDictionary:](self, "_validateMetric:forKey:fromDictionary:", v6, v15, v19))v13 = 0;

      }
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v11);
    v20 = v13 & 1;
  }
  else
  {
    v20 = 1;
  }
LABEL_23:

  return v20;
}

- (BOOL)_validateRouteDefinition:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  BOOL v27;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  _BYTE v35[24];

  v4 = a3;
  if (!v4)
  {
    v9 = APLogForCategory(29);
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v35 = 0;
      v10 = "The purpose definition can not be nil!";
      v11 = v6;
      v12 = 2;
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, v35, v12);
    }
LABEL_23:

    v27 = 0;
    goto LABEL_24;
  }
  v5 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    v13 = APLogForCategory(29);
    v6 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v35 = 138543362;
      *(_QWORD *)&v35[4] = v4;
      v10 = "The purpose definition is not a dictionary! %{public}@";
      v11 = v6;
      v12 = 12;
      goto LABEL_9;
    }
    goto LABEL_23;
  }
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name")));
  v7 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    v14 = APLogForCategory(29);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v35 = 138543362;
      *(_QWORD *)&v35[4] = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "The name (%{public}@) isn't a string!", v35, 0xCu);
    }

    v8 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("purpose")));
  v17 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
  {
    v25 = APLogForCategory(29);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v35 = 138543618;
      *(_QWORD *)&v35[4] = v6;
      *(_WORD *)&v35[12] = 2114;
      *(_QWORD *)&v35[14] = v16;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "The purpose (%{public}@) number (%{public}@) in the definition isn't a number!", v35, 0x16u);
    }

    goto LABEL_23;
  }
  v18 = (unint64_t)objc_msgSend(v16, "integerValue");
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dest")));
  v20 = (void *)v19;
  if ((v18 & 0x8000000000000000) == 0)
  {
    v21 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
    {
      v22 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v20));
      if (v22)
      {
LABEL_32:

        goto LABEL_33;
      }
      v23 = APLogForCategory(29);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v35 = 138543618;
        *(_QWORD *)&v35[4] = v6;
        *(_WORD *)&v35[12] = 2114;
        *(_QWORD *)&v35[14] = v20;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "The purpose (%{public}@) destination (%{public}@) can not be converted to a URL!", v35, 0x16u);
      }

LABEL_31:
      v8 = 0;
      goto LABEL_32;
    }
    v31 = APLogForCategory(29);
    v22 = objc_claimAutoreleasedReturnValue(v31);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)v35 = 138543618;
    *(_QWORD *)&v35[4] = v6;
    *(_WORD *)&v35[12] = 2114;
    *(_QWORD *)&v35[14] = v20;
    v30 = "The purpose (%{public}@) destination (%{public}@) in the definition isn't a String!";
LABEL_30:
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v30, v35, 0x16u);
    goto LABEL_31;
  }
  if (v19)
  {
    v29 = APLogForCategory(29);
    v22 = objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)v35 = 138543618;
    *(_QWORD *)&v35[4] = v6;
    *(_WORD *)&v35[12] = 2114;
    *(_QWORD *)&v35[14] = v20;
    v30 = "The purpose (%{public}@) has a destination (%{public}@) when it shouldn't!";
    goto LABEL_30;
  }
LABEL_33:
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metrics"), *(_OWORD *)v35, *(_QWORD *)&v35[16]));
  if (!-[APMetricPurpose _validateMetric:withMetrics:](self, "_validateMetric:withMetrics:", v6, v32))
    v8 = 0;
  if (!v8)
  {
    v33 = APLogForCategory(29);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v35 = 138543362;
      *(_QWORD *)&v35[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "There were type errors in the purpose definition: %{public}@", v35, 0xCu);
    }

  }
  v27 = v8 != 0;
LABEL_24:

  return v27;
}

- (id)_metricsByNumber:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v3, "count")));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value")));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dnu")));
        if (v13)
          v14 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, CFSTR("name"), v13, CFSTR("dnu"), 0, (_QWORD)v20);
        else
          v14 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v10, CFSTR("name"), 0, v18, v19, (_QWORD)v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v4));
  return v16;
}

- (APMetricPurpose)initWithPurposeJSON:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  APMetricPurpose *v9;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  id v17;

  v15 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", a3, 0, &v15));
  v5 = v15;
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error parsing purpose JSON data: %@"), v5));
    v7 = APLogForCategory(29);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Error parsing purpose JSON data: %{public}@", buf, 0xCu);
    }

    APSimulateCrash(5, v6, 0);
    goto LABEL_5;
  }
  if (v4)
  {
    v11 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
    {
      self = -[APMetricPurpose initWithPurposeDefinition:](self, "initWithPurposeDefinition:", v4);
      v9 = self;
      goto LABEL_6;
    }
    v14 = APLogForCategory(29);
    v6 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Parsed purpose definition isn't a dictionary!";
      goto LABEL_14;
    }
  }
  else
  {
    v12 = APLogForCategory(29);
    v6 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Parsed purpose definition is nil!";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }
  }
LABEL_5:

  v9 = 0;
LABEL_6:

  return v9;
}

- (APMetricPurpose)initWithPurposeDefinition:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  APMetricPurpose *v11;
  uint64_t v12;
  NSString *name;
  void *v14;
  APDestination *v15;
  void *v16;
  APDestination *v17;
  APDestination *destination;
  APEventChannel *v19;
  APEventChannel *channel;
  void *v21;
  uint64_t v22;
  NSDictionary *metrics;
  APMetricPurpose *v24;
  objc_super v26;
  uint8_t buf[4];
  int v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("purpose")));
  v6 = objc_msgSend(v5, "integerValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[APMetricPurposeRegistry metricRouteForPurpose:](APMetricPurposeRegistry, "metricRouteForPurpose:", v6));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Metric Route (%d) should not be created more than once, exiting!"), v6));
    v9 = APLogForCategory(29);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v28 = (int)v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Metric Route (%d) should not be created more than once, exiting!", buf, 8u);
    }

    APSimulateCrash(5, v8, 0);
  }
  if (-[APMetricPurpose _validateRouteDefinition:](self, "_validateRouteDefinition:", v4))
  {
    v26.receiver = self;
    v26.super_class = (Class)APMetricPurpose;
    v11 = -[APMetricPurpose init](&v26, "init");
    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name")));
      name = v11->_name;
      v11->_name = (NSString *)v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("purpose")));
      v11->_purpose = (int64_t)objc_msgSend(v14, "integerValue");

      v15 = [APDestination alloc];
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dest")));
      v17 = -[APDestination initWithString:](v15, "initWithString:", v16);
      destination = v11->_destination;
      v11->_destination = v17;

      v19 = -[APEventChannel initWithDestination:purpose:]([APEventChannel alloc], "initWithDestination:purpose:", v11->_destination, v11->_purpose);
      channel = v11->_channel;
      v11->_channel = v19;

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metrics")));
      v22 = objc_claimAutoreleasedReturnValue(-[APMetricPurpose _metricsByNumber:](v11, "_metricsByNumber:", v21));
      metrics = v11->_metrics;
      v11->_metrics = (NSDictionary *)v22;

      +[APMetricPurposeRegistry setMetricPurpose:](APMetricPurposeRegistry, "setMetricPurpose:", v11);
    }
    self = v11;
    v24 = self;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)metricIsDisabled:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_metrics, "objectForKeyedSubscript:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("disabled")));
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (int64_t)purpose
{
  return self->_purpose;
}

- (APDestination)destination
{
  return self->_destination;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
