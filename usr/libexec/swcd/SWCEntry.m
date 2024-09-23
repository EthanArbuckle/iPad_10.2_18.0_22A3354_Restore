@implementation SWCEntry

+ (SWCEntry)new
{
  abort();
}

- (SWCEntry)init
{
  abort();
}

- (SWCEntry)initWithApplicationIdentifier:(id)a3 service:(id)a4 domain:(id)a5
{
  id v8;
  id v9;
  id v10;
  SWCEntry *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *serviceType;
  _SWCDomain *v15;
  _SWCDomain *domain;
  _SWCApplicationIdentifier *v17;
  _SWCApplicationIdentifier *applicationIdentifier;
  uint64_t v19;
  NSDate *lastCheckedDate;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SWCEntry;
  v11 = -[SWCEntry init](&v22, "init");
  if (v11)
  {
    v12 = _SWCServiceTypeCanonicalize(v9);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    serviceType = v11->_serviceType;
    v11->_serviceType = (NSString *)v13;

    v15 = (_SWCDomain *)objc_msgSend(v10, "copy");
    domain = v11->_domain;
    v11->_domain = v15;

    v17 = (_SWCApplicationIdentifier *)objc_msgSend(v8, "copy");
    applicationIdentifier = v11->_applicationIdentifier;
    v11->_applicationIdentifier = v17;

    v19 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    lastCheckedDate = v11->_lastCheckedDate;
    v11->_lastCheckedDate = (NSDate *)v19;

  }
  return v11;
}

- (SWCEntry)initWithServiceSpecifier:(id)a3
{
  id v4;
  void *v5;
  SWCEntry *v6;
  void *v7;
  void *v8;
  SWCEntry *v9;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isFullySpecified"))
  {
    v6 = (SWCEntry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "SWCApplicationIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "SWCDomain"));
    v9 = -[SWCEntry initWithApplicationIdentifier:service:domain:](self, "initWithApplicationIdentifier:service:domain:", v6, v7, v8);

    self = v6;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)logToFile:(__sFILE *)a3 verbosity:(unsigned __int8)a4
{
  int v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t DebugDescription;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  const __CFString *v21;
  void *v22;
  SWCEntry *v23;
  SWCFields *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;

  v4 = a4;
  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](self, "serviceType"));
  _SWCLogValueForKey(a3, CFSTR("Service"), v8, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](self, "applicationIdentifier"));
  _SWCLogValueForKey(a3, CFSTR("App ID"), v9, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

  if (v4)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationVersion](self, "applicationVersion"));
    _SWCLogValueForKey(a3, CFSTR("App Version"), v10, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationPersistentIdentifier](self, "applicationPersistentIdentifier"));
    DebugDescription = _LSPersistentIdentifierGetDebugDescription();
    v13 = (void *)objc_claimAutoreleasedReturnValue(DebugDescription);
    _SWCLogValueForKey(a3, CFSTR("App PI"), v13, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
  _SWCLogValueForKey(a3, CFSTR("Domain"), v14, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

  if (v4)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry patterns](self, "patterns"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry patterns](self, "patterns"));
      _SWCLogValueForKey(a3, CFSTR("Patterns"), v16, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry substitutionVariables](self, "substitutionVariables"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry substitutionVariables](self, "substitutionVariables"));
      _SWCLogValueForKey(a3, CFSTR("Variables"), v18, 0xFFFFFFFFLL, 0xFFFFFFFFLL);

    }
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
  v20 = objc_msgSend(v19, "modeOfOperation");

  if (v20 == 1)
  {
    v21 = CFSTR("developer");
  }
  else
  {
    if (v20 != 2)
    {
      v22 = 0;
      goto LABEL_14;
    }
    v21 = CFSTR("managed");
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v21));
LABEL_14:
  v23 = objc_retainAutorelease(self);
  v24 = -[SWCEntry fields](v23, "fields");
  _SWCFieldsLogDebugDescription(*(_WORD *)v24 | ((unint64_t)v24->relativeOrder << 16), a3, v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry lastCheckedDate](v23, "lastCheckedDate"));
  v26 = v25;
  if (v25)
  {
    objc_msgSend(v25, "timeIntervalSince1970");
    if (fabs(v27) < 1.0e10)
      _SWCLogValueForKey(a3, CFSTR("Last Checked"), v26, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry nextCheckDate](v23, "nextCheckDate"));
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "timeIntervalSince1970");
    if (fabs(v30) < 1.0e10)
      _SWCLogValueForKey(a3, CFSTR("Next Check"), v29, 0xFFFFFFFFLL, 0xFFFFFFFFLL);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry lastError](v23, "lastError"));
  if (v31)
  {
    if (v4)
    {
      _SWCLogValueForKey(a3, CFSTR("Error"), v31, 0, 220);
    }
    else
    {
      v32 = objc_alloc((Class)NSString);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "domain"));
      v34 = objc_msgSend(v32, "initWithFormat:", CFSTR("%@ %lli"), v33, objc_msgSend(v31, "code"));
      _SWCLogValueForKey(a3, CFSTR("Error"), v34, 0, 220);

    }
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry retryCount](v23, "retryCount"));
  if (v35)
    _SWCLogValueForKey(a3, CFSTR("Retries"), v35, 0, 220);

  objc_autoreleasePoolPop(v7);
}

- (_SWCServiceSpecifier)serviceSpecifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc((Class)_SWCServiceSpecifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](self, "serviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](self, "applicationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
  v7 = objc_msgSend(v3, "_initWithServiceType:applicationIdentifier:domain:", v4, v5, v6);

  return (_SWCServiceSpecifier *)v7;
}

+ (void)canonicalizeEntries:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v4 = objc_opt_class(SWCEntry);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v3;
    v6 = 0;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_isKindOfClass(v10, v4) & 1) != 0)
          {
            if (!v6)
              v6 = objc_alloc_init((Class)NSMutableSet);
            objc_msgSend(v10, "canonicalizeWithObjectCache:", v6, (_QWORD)v11);
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)canonicalizeObjectAtAddress:(id *)a3 objectCache:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "member:", *a3));
  if (v5)
  {
    objc_storeStrong(a3, v5);
  }
  else if (*a3)
  {
    objc_msgSend(v6, "addObject:");
  }

}

- (void)canonicalizeWithObjectCache:(id)a3
{
  id v4;

  v4 = a3;
  -[SWCEntry canonicalizeObjectAtAddress:objectCache:](self, "canonicalizeObjectAtAddress:objectCache:", &self->_applicationIdentifier);
  -[SWCEntry canonicalizeObjectAtAddress:objectCache:](self, "canonicalizeObjectAtAddress:objectCache:", &self->_domain, v4);
  -[SWCEntry canonicalizeObjectAtAddress:objectCache:](self, "canonicalizeObjectAtAddress:objectCache:", &self->_patterns, v4);
  -[SWCEntry canonicalizeObjectAtAddress:objectCache:](self, "canonicalizeObjectAtAddress:objectCache:", &self->_substitutionVariables, v4);

}

- (unint64_t)evaluateWithURLComponents:(id)a3 auditToken:(id *)a4 matchingPattern:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry patterns](self, "patterns"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry substitutionVariables](self, "substitutionVariables"));
    v11 = (unint64_t)objc_msgSend(v9, "evaluateWithURLComponents:substitutionVariables:auditToken:matchingPattern:index:", v8, v10, a4, a5, 0);

  }
  else
  {
    v11 = 200;
  }

  return v11;
}

- (SWCFields)fields
{
  return &self->_fields;
}

- (BOOL)isDownloadable
{
  return (*(_WORD *)&self->_fields & 0x1C00) == 0;
}

- (BOOL)needsFirstDownload
{
  BOOL v2;
  void *v3;

  if ((*(_WORD *)&self->_fields & 0xC) != 0)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry retryCount](self, "retryCount"));
  v2 = v3 == 0;

  return v2;
}

- (NSDate)nextCheckDate
{
  void *v3;
  SWCEntry *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  SWCEntry *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_retainAutorelease(self);
  v5 = *(_WORD *)-[SWCEntry fields](v4, "fields") & 0xC;
  if (v5)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry retryCount](v4, "retryCount"));
  v7 = v6;
  if (!v6
    || (v8 = objc_msgSend(v6, "unsignedIntegerValue"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs")),
        v10 = objc_msgSend(v9, "maximumRetryCount"),
        v9,
        v8 < v10))
  {

LABEL_5:
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
    objc_msgSend(v11, "retryIntervalAfterSuccess:", v5 != 0);
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry lastCheckedDate](v4, "lastCheckedDate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateByAddingTimeInterval:", v13));

    goto LABEL_6;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
  objc_msgSend(v17, "retryIntervalAfterReachLimitWithFailure:", objc_msgSend(v7, "unsignedIntegerValue"));
  v19 = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry lastCheckedDate](v4, "lastCheckedDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dateByAddingTimeInterval:", v19));

  if (qword_1000371C0 != -1)
    dispatch_once(&qword_1000371C0, &stru_100030AE0);
  v21 = (id)qword_1000371B8;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
    v23 = 138413058;
    v24 = v4;
    v25 = 2112;
    v26 = v15;
    v27 = 2114;
    v28 = v7;
    v29 = 2048;
    v30 = objc_msgSend(v22, "maximumRetryCount");
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "nextCheckDate for '%@' will be %@ because it is at its retry limit (%{public}@ of %llu)", (uint8_t *)&v23, 0x2Au);

  }
  if (!v15)
    goto LABEL_5;
LABEL_6:
  objc_autoreleasePoolPop(v3);
  return (NSDate *)v15;
}

- (NSError)lastError
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_lastErrorJSON)
  {
    v3 = objc_autoreleasePoolPush();
    v4 = objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", self->_lastErrorJSON, 0, 0));
    v5 = (void *)v4;
    if (v4 && _NSIsNSDictionary(v4))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("d")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("c")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("u")));
      if (_NSIsNSString(v6)
        && _NSIsNSNumber(v7)
        && (!v8 || _NSIsNSDictionary(v8)))
      {
        v9 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", v6, objc_msgSend(v7, "integerValue"), v8);
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }

    objc_autoreleasePoolPop(v3);
  }
  else
  {
    v9 = 0;
  }
  return (NSError *)v9;
}

- (void)setLastError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSData *v11;
  NSData *lastErrorJSON;
  NSData *v13;
  id v14;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;

  v14 = a3;
  if (v14)
  {
    v4 = objc_autoreleasePoolPush();
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "domain"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("d"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v14, "code")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("c"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
    v9 = v8;
    if (v8 && objc_msgSend(v8, "count"))
    {
      v15 = _NSConcreteStackBlock;
      v16 = 3221225472;
      v17 = sub_1000087CC;
      v18 = &unk_100030940;
      v10 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v9, "count"));
      v19 = v10;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", &v15);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("u"));

    }
    v11 = (NSData *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v5, 8, 0, v14, v15, v16, v17, v18));
    lastErrorJSON = self->_lastErrorJSON;
    self->_lastErrorJSON = v11;

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v13 = self->_lastErrorJSON;
    self->_lastErrorJSON = 0;

  }
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](self, "applicationIdentifier"));
  v4 = (unint64_t)objc_msgSend(v3, "hash");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](self, "serviceType"));
  v6 = (unint64_t)objc_msgSend(v5, "hash");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
  v8 = v6 ^ v4 ^ (unint64_t)objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  SWCEntry *v4;
  uint64_t v5;
  SWCEntry *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v4 = (SWCEntry *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    v5 = objc_opt_class(SWCEntry);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](self, "applicationIdentifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](v6, "applicationIdentifier"));
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](self, "serviceType"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](v6, "serviceType"));
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](v6, "domain"));
          v13 = objc_msgSend(v11, "isEqual:", v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  SWCEntry *v12;
  uint64_t DebugDescription;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v3 = objc_alloc_init((Class)NSMutableString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry patterns](self, "patterns"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry patterns](self, "patterns"));
    objc_msgSend(v3, "appendFormat:", CFSTR(", patternCount = %llu"), objc_msgSend(v5, "count"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry substitutionVariables](self, "substitutionVariables"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry substitutionVariables](self, "substitutionVariables"));
    objc_msgSend(v3, "appendFormat:", CFSTR(", subVarCount = %llu"), objc_msgSend(v7, "count"));

  }
  v8 = objc_alloc((Class)NSString);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](self, "serviceType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](self, "applicationIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
  v12 = objc_retainAutorelease(self);
  DebugDescription = _SWCServiceApprovalStateGetDebugDescription(*(_WORD *)-[SWCEntry fields](v12, "fields") & 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue(DebugDescription);
  v15 = _SWCServiceApprovalStateGetDebugDescription((*(unsigned __int8 *)-[SWCEntry fields](objc_retainAutorelease(v12), "fields") >> 2) & 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = objc_msgSend(v8, "initWithFormat:", CFSTR("{ s = %@, a = %@, d = %@, ua = %@, sa = %@%@ }"), v9, v10, v11, v14, v16, v3);

  return v17;
}

- (id)debugDescription
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)NSString);
  v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry description](self, "description"));
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p> %@"), v4, self, v5);

  return v6;
}

- (id)redactedDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SWCEntry *v9;
  uint64_t DebugDescription;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry serviceType](self, "serviceType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry applicationIdentifier](self, "applicationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "redactedDescription"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SWCEntry domain](self, "domain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "redactedDescription"));
  v9 = objc_retainAutorelease(self);
  DebugDescription = _SWCServiceApprovalStateGetDebugDescription(*(_WORD *)-[SWCEntry fields](v9, "fields") & 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(DebugDescription);
  v12 = _SWCServiceApprovalStateGetDebugDescription((*(unsigned __int8 *)-[SWCEntry fields](objc_retainAutorelease(v9), "fields") >> 2) & 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_msgSend(v3, "initWithFormat:", CFSTR("{ s = %@, a = %@, d = %@, ua = %@, sa = %@ }"), v4, v6, v8, v11, v13);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationIdentifier, CFSTR("appID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_serviceType, CFSTR("service"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_domain, CFSTR("domain"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationVersion, CFSTR("applicationVersion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_applicationPersistentIdentifier, CFSTR("applicationPersistentIdentifier"));
  _SWCFieldsEncodeWithCoder(*(_WORD *)&self->_fields | ((unint64_t)self->_fields.relativeOrder << 16), v4, CFSTR("fields"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_patterns, CFSTR("patternList"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_substitutionVariables, CFSTR("substitutionVariableList"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastCheckedDate, CFSTR("lastCheckedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_lastErrorJSON, CFSTR("lastErrorJSON"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_retryCount, CFSTR("retryCount"));

}

- (SWCEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  SWCEntry *v13;
  id v14;
  uint64_t v15;
  NSString *applicationVersion;
  id v17;
  uint64_t v18;
  NSData *applicationPersistentIdentifier;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _SWCPatternList *patterns;
  id v24;
  uint64_t v25;
  _SWCSubstitutionVariableList *substitutionVariables;
  id v27;
  uint64_t v28;
  NSDate *lastCheckedDate;
  uint64_t v30;
  NSDate *v31;
  id v32;
  uint64_t v33;
  NSData *lastErrorJSON;
  id v35;
  uint64_t v36;
  NSNumber *retryCount;
  id v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v43[2];
  _QWORD v44[2];

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(_SWCApplicationIdentifier), CFSTR("appID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("service"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(_SWCDomain), CFSTR("domain"));
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)v11;
  if (v7 && v9 && v11)
  {
    v13 = -[SWCEntry initWithApplicationIdentifier:service:domain:](self, "initWithApplicationIdentifier:service:domain:", v7, v9, v11);
    if (v13)
    {
      v14 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("applicationVersion"));
      v15 = objc_claimAutoreleasedReturnValue(v14);
      applicationVersion = v13->_applicationVersion;
      v13->_applicationVersion = (NSString *)v15;

      v17 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("applicationPersistentIdentifier"));
      v18 = objc_claimAutoreleasedReturnValue(v17);
      applicationPersistentIdentifier = v13->_applicationPersistentIdentifier;
      v13->_applicationPersistentIdentifier = (NSData *)v18;

      v20 = _SWCFieldsMakeWithCoder(v4, CFSTR("fields"));
      *(_WORD *)&v13->_fields = v20;
      v13->_fields.relativeOrder = BYTE2(v20);
      v21 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(_SWCPatternList), CFSTR("patternList"));
      v22 = objc_claimAutoreleasedReturnValue(v21);
      patterns = v13->_patterns;
      v13->_patterns = (_SWCPatternList *)v22;

      v24 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(_SWCSubstitutionVariableList), CFSTR("substitutionVariableList"));
      v25 = objc_claimAutoreleasedReturnValue(v24);
      substitutionVariables = v13->_substitutionVariables;
      v13->_substitutionVariables = (_SWCSubstitutionVariableList *)v25;

      v27 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("lastCheckedDate"));
      v28 = objc_claimAutoreleasedReturnValue(v27);
      lastCheckedDate = v13->_lastCheckedDate;
      v13->_lastCheckedDate = (NSDate *)v28;

      if (!v13->_lastCheckedDate)
      {
        v30 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
        v31 = v13->_lastCheckedDate;
        v13->_lastCheckedDate = (NSDate *)v30;

      }
      v32 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("lastErrorJSON"));
      v33 = objc_claimAutoreleasedReturnValue(v32);
      lastErrorJSON = v13->_lastErrorJSON;
      v13->_lastErrorJSON = (NSData *)v33;

      v35 = objc_msgSend(v4, "swc_decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("retryCount"));
      v36 = objc_claimAutoreleasedReturnValue(v35);
      retryCount = v13->_retryCount;
      v13->_retryCount = (NSNumber *)v36;

    }
  }
  else
  {
    v38 = objc_alloc((Class)NSError);
    v43[0] = CFSTR("Line");
    v43[1] = CFSTR("Function");
    v44[0] = &off_1000327B0;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCEntry initWithCoder:]"));
    v44[1] = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v44, v43, 2));
    v41 = objc_msgSend(v38, "initWithDomain:code:userInfo:", NSCocoaErrorDomain, 4865, v40);
    objc_msgSend(v4, "failWithError:", v41);

    v13 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v13;
}

- (_SWCApplicationIdentifier)applicationIdentifier
{
  return (_SWCApplicationIdentifier *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (_SWCDomain)domain
{
  return (_SWCDomain *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)applicationVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setApplicationVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSData)applicationPersistentIdentifier
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setApplicationPersistentIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (_SWCPatternList)patterns
{
  return (_SWCPatternList *)objc_getProperty(self, a2, 64, 1);
}

- (void)setPatterns:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (_SWCSubstitutionVariableList)substitutionVariables
{
  return (_SWCSubstitutionVariableList *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSubstitutionVariables:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDate)lastCheckedDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastCheckedDate:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSNumber)retryCount
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setRetryCount:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryCount, 0);
  objc_storeStrong((id *)&self->_lastCheckedDate, 0);
  objc_storeStrong((id *)&self->_substitutionVariables, 0);
  objc_storeStrong((id *)&self->_patterns, 0);
  objc_storeStrong((id *)&self->_applicationPersistentIdentifier, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_lastErrorJSON, 0);
}

+ (id)entriesForBundleRecord:(id)a3 enterpriseContext:(id)a4 developerModeEnabled:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *j;
  id v39;
  id v40;
  uint64_t v41;
  void *k;
  _BYTE *v43;
  __int16 v44;
  __int16 v45;
  void *v46;
  BOOL v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *m;
  void *v53;
  void *v54;
  char IsWhitelistedForAppClips;
  NSObject *v56;
  void *v58;
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  id v79;
  id v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint8_t v84[128];
  uint8_t buf[4];
  id v86;
  __int16 v87;
  id v88;

  v5 = a5;
  v8 = a3;
  v60 = a4;
  v61 = objc_alloc_init((Class)NSMutableOrderedSet);
  v59 = objc_msgSend(objc_alloc((Class)_SWCApplicationIdentifier), "initForBundleRecord:", v8);
  if (v59)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entitlements"));
    v10 = objc_msgSend(v9, "objectForKey:ofClass:", CFSTR("com.apple.private.swc.system-app"), objc_opt_class(NSNumber));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v11, "isEqual:", &__kCFBooleanTrue);

    if ((objc_opt_respondsToSelector(v8, "isSystemPlaceholder") & 1) != 0)
      v13 = objc_msgSend(v8, "isSystemPlaceholder");
    else
      v13 = 0;
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_associatedDomainsFromEntitlementForBundleRecord:applicationIdentifier:developerModeEnabled:enterpriseContext:", v8, v59, v5, v60));
    if (objc_msgSend(v58, "count"))
    {
      if (qword_1000371C0 != -1)
        dispatch_once(&qword_1000371C0, &stru_100030AE0);
      v16 = (id)qword_1000371B8;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleVersion"));
        *(_DWORD *)buf = 138412546;
        v86 = v8;
        v87 = 2114;
        v88 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Adding bundle record %@ (version %{public}@)", buf, 0x16u);

      }
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472;
      v78[2] = sub_100009F68;
      v78[3] = &unk_100030968;
      v79 = v59;
      v80 = v61;
      objc_msgSend(v58, "enumerateKeysAndObjectsUsingBlock:", v78);

    }
    else
    {
      if (qword_1000371C0 != -1)
        dispatch_once(&qword_1000371C0, &stru_100030AE0);
      v18 = qword_1000371B8;
      if (os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v86 = v8;
        _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "No associated domains for bundle record %@", buf, 0xCu);
      }
    }
    v19 = v12 | v13;
    if (v58)
      v20 = v12 | v13;
    else
      v20 = 0;
    if (v20 == 1)
    {
      v21 = objc_autoreleasePoolPush();
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_entriesFromBuiltInJSONForBundleRecord:applicationIdentifier:", v8, v59));
      if (v22)
      {
        if (qword_1000371C0 != -1)
          dispatch_once(&qword_1000371C0, &stru_100030AE0);
        v23 = qword_1000371B8;
        if (os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v86 = v8;
          v87 = 2112;
          v88 = v22;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "App %@ had on-disk JSON, adding it to the pile: %@", buf, 0x16u);
        }
        objc_msgSend(v61, "unionOrderedSet:", v22);
      }

      objc_autoreleasePoolPop(v21);
    }
    if (v60)
    {
      v24 = objc_msgSend(v60, "isManaging");
      v25 = v58 ? v24 : 0;
      if (v25 == 1)
      {
        v26 = objc_autoreleasePoolPush();
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_enterpriseEntriesWithContext:forBundleRecord:applicationIdentifier:", v60, v8, v59));
        if (v27)
        {
          if (qword_1000371C0 != -1)
            dispatch_once(&qword_1000371C0, &stru_100030AE0);
          v28 = qword_1000371B8;
          if (os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v86 = v8;
            v87 = 2112;
            v88 = v27;
            _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "App %@ had enterprise-supplied service specifiers, adding them to the pile: %@", buf, 0x16u);
          }
          objc_msgSend(v61, "unionOrderedSet:", v27);
        }

        objc_autoreleasePoolPop(v26);
      }
    }
    if (objc_msgSend(v61, "count"))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleVersion"));
      if (v29)
      {
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v30 = v61;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v75;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(_QWORD *)v75 != v32)
                objc_enumerationMutation(v30);
              objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)i), "setApplicationVersion:", v29);
            }
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
          }
          while (v31);
        }

      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistentIdentifier"));
      if (v34)
      {
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v35 = v61;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
        if (v36)
        {
          v37 = *(_QWORD *)v71;
          do
          {
            for (j = 0; j != v36; j = (char *)j + 1)
            {
              if (*(_QWORD *)v71 != v37)
                objc_enumerationMutation(v35);
              objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)j), "setApplicationPersistentIdentifier:", v34);
            }
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v70, v83, 16);
          }
          while (v36);
        }

      }
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v39 = v61;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v67;
        do
        {
          for (k = 0; k != v40; k = (char *)k + 1)
          {
            if (*(_QWORD *)v67 != v41)
              objc_enumerationMutation(v39);
            v43 = objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)k)), "fields");
            if (v19)
            {
              v44 = *(_WORD *)v43 & 0xFFD3;
              *(_WORD *)v43 = v44 | 0x24;
              if (!v13)
                continue;
              v45 = v44 | 0x224;
            }
            else
            {
              v43[2] = 0;
              v45 = *(_WORD *)v43 & 0xFF3F;
            }
            *(_WORD *)v43 = v45;
          }
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v66, v82, 16);
        }
        while (v40);
      }

    }
    v14 = v59;
  }
  else
  {
    if (qword_1000371C0 != -1)
      dispatch_once(&qword_1000371C0, &stru_100030AE0);
    v14 = 0;
    v15 = qword_1000371B8;
    if (os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v86 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "### Add bundle record %@ failed because of missing app identifier entitlement", buf, 0xCu);
    }
  }

  if (objc_msgSend(v61, "count")
    && (objc_opt_respondsToSelector(v8, "appClipMetadata") & 1) != 0
    && (v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "appClipMetadata")),
        v47 = v46 == 0,
        v46,
        !v47))
  {
    v48 = objc_alloc_init((Class)NSMutableArray);
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v49 = v61;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
    if (v50)
    {
      v51 = *(_QWORD *)v63;
      do
      {
        for (m = 0; m != v50; m = (char *)m + 1)
        {
          if (*(_QWORD *)v63 != v51)
            objc_enumerationMutation(v49);
          v53 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)m);
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "serviceType"));
          IsWhitelistedForAppClips = _SWCServiceTypeIsWhitelistedForAppClips();

          if ((IsWhitelistedForAppClips & 1) == 0)
            objc_msgSend(v48, "addObject:", v53);
        }
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v62, v81, 16);
      }
      while (v50);
    }

    if (objc_msgSend(v48, "count"))
    {
      if (qword_1000371C0 != -1)
        dispatch_once(&qword_1000371C0, &stru_100030AE0);
      v56 = qword_1000371B8;
      if (os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v86 = v8;
        v87 = 2112;
        v88 = v48;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Ignoring these associated domains for bundle record %@ because it is an app clip: %@", buf, 0x16u);
      }
      objc_msgSend(v49, "removeObjectsInArray:", v48);
    }

  }
  else
  {
    +[SWCEntry canonicalizeEntries:](SWCEntry, "canonicalizeEntries:", v61);
  }

  return v61;
}

+ (id)entriesForJSONObject:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)NSMutableOrderedSet);
  v9 = objc_autoreleasePoolPush();
  if (_NSIsNSDictionary(v6))
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000A2F4;
    v11[3] = &unk_100030990;
    v14 = a1;
    v12 = v8;
    v13 = v7;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  objc_autoreleasePoolPop(v9);

  return v8;
}

+ (void)enumerateJSONResourceURLsForBundleURL:(id)a3 block:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("Contents"), 1));
  v10 = v9;
  if (!v9 || (objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    v11 = v14;

    v10 = v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/SharedWebCredentials"), 1));

  objc_autoreleasePoolPop(v8);
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SWCEntry.mm"), 706, CFSTR("Unexpected failure to allocate URL for [Contents/]Library/SharedWebCredentials directory relative to bundle URL %@."), v14);

  }
  objc_msgSend(a1, "enumerateJSONResourceURLsForDirectoryAtURL:block:", v12, v7);

}

+ (void)enumerateJSONResourceURLsForDirectoryAtURL:(id)a3 block:(id)a4
{
  const __CFURL *v5;
  NSObject *v6;
  const __CFArray *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  BOOL v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  const __CFArray *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  NSObject *v35;
  const __CFArray *v36;
  id v37;
  uint64_t v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  __CFString *v47;
  const __CFArray *v48;
  const __CFString *v49;
  void *v50;
  void *context;
  CFArrayRef v52;
  void (**v53)(id, void *, void *);
  char v54;
  __CFString *v55;
  NSObject *obj;
  NSObject *obja;
  CFURLRef bundleURL;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  const __CFString *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  CFArrayRef v79;

  v5 = (const __CFURL *)a3;
  v53 = (void (**)(id, void *, void *))a4;
  context = objc_autoreleasePoolPush();
  bundleURL = v5;
  v52 = CFBundleCopyResourceURLsOfTypeInDirectory(v5, CFSTR("json"), 0);
  if (!v52)
  {
    obj = 0;
    goto LABEL_51;
  }
  if (qword_1000371C0 != -1)
    dispatch_once(&qword_1000371C0, &stru_100030AE0);
  v6 = (id)qword_1000371B8;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v49 = (const __CFString *)-[__CFArray count](v52, "count", context);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](bundleURL, "path"));
    *(_DWORD *)buf = 134218498;
    v75 = v49;
    v76 = 2112;
    v77 = v50;
    v78 = 2112;
    v79 = v52;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Found %llu JSON URLs (must filter) in directory %@: %@", buf, 0x20u);

  }
  obj = objc_alloc_init((Class)NSMutableSet);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v7 = v52;
  v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (!v8)
  {

LABEL_33:
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v25 = v7;
    v26 = -[__CFArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v64;
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v64 != v27)
            objc_enumerationMutation(v25);
          v29 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v28);
          v30 = objc_autoreleasePoolPush();
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByDeletingPathExtension"));

          if (v32)
          {
            v33 = objc_msgSend(objc_alloc((Class)_SWCDomain), "initWithString:", v32);
            v34 = v33;
            if (v33 && objc_msgSend(v33, "isValid"))
            {
              if (qword_1000371C0 != -1)
                dispatch_once(&qword_1000371C0, &stru_100030AE0);
              v35 = (id)qword_1000371B8;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                v55 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
                v36 = (const __CFArray *)objc_claimAutoreleasedReturnValue(-[__CFURL path](bundleURL, "path"));
                *(_DWORD *)buf = 138412802;
                v75 = v55;
                v76 = 2112;
                v77 = v34;
                v78 = 2112;
                v79 = v36;
                _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Found JSON file %@ for domain %@ in directory %@ (nothing model-specific)", buf, 0x20u);

              }
              v53[2](v53, v34, v29);
            }

          }
          objc_autoreleasePoolPop(v30);
          v28 = (char *)v28 + 1;
        }
        while (v26 != v28);
        v26 = -[__CFArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      }
      while (v26);
    }

    v22 = obj;
    obj = 0;
    goto LABEL_50;
  }
  v54 = 0;
  v9 = *(_QWORD *)v68;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v68 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)v10);
      v12 = objc_autoreleasePoolPush();
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByDeletingPathExtension"));

      if (v14)
      {
        v15 = objc_msgSend(v14, "rangeOfString:options:", CFSTR("."), 4);
        v16 = objc_msgSend(v14, "rangeOfString:options:", CFSTR("~"), 4);
        if (v16 == (id)0x7FFFFFFFFFFFFFFFLL || (v15 != (id)0x7FFFFFFFFFFFFFFFLL ? (v17 = v15 >= v16) : (v17 = 0), v17))
        {
          v18 = v14;
        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringToIndex:", v16));

          v19 = objc_msgSend(v18, "rangeOfString:options:", CFSTR("-macos"), 13);
          if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v54 = 1;
          }
          else
          {
            v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "substringToIndex:", v19));

            v54 = 1;
            v18 = (void *)v20;
          }
        }
        -[NSObject addObject:](obj, "addObject:", v18, context);
      }
      else
      {
        v18 = 0;
      }

      objc_autoreleasePoolPop(v12);
      v10 = (char *)v10 + 1;
    }
    while (v8 != v10);
    v21 = -[__CFArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    v8 = v21;
  }
  while (v21);

  if ((v54 & 1) == 0)
    goto LABEL_33;
  if (qword_1000371C0 != -1)
    dispatch_once(&qword_1000371C0, &stru_100030AE0);
  v22 = (id)qword_1000371B8;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v23 = (const __CFString *)-[NSObject count](obj, "count");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](bundleURL, "path"));
    *(_DWORD *)buf = 134218498;
    v75 = v23;
    v76 = 2112;
    v77 = v24;
    v78 = 2112;
    v79 = (CFArrayRef)obj;
    _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Found %llu JSON filenames (filtered) in directory %@: %@", buf, 0x20u);

  }
LABEL_50:

LABEL_51:
  objc_autoreleasePoolPop(context);
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obja = obj;
  v37 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v60;
    do
    {
      v39 = 0;
      do
      {
        if (*(_QWORD *)v60 != v38)
          objc_enumerationMutation(obja);
        v40 = *(const __CFString **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)v39);
        v41 = objc_autoreleasePoolPush();
        v42 = objc_msgSend(objc_alloc((Class)_SWCDomain), "initWithString:", v40);
        v43 = v42;
        if (v42 && objc_msgSend(v42, "isValid"))
        {
          v44 = CFBundleCopyResourceURLInDirectory(bundleURL, v40, CFSTR("json"), 0);
          if (v44)
          {
            if (qword_1000371C0 != -1)
              dispatch_once(&qword_1000371C0, &stru_100030AE0);
            v45 = (id)qword_1000371B8;
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              v47 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSObject lastPathComponent](v44, "lastPathComponent"));
              v48 = (const __CFArray *)objc_claimAutoreleasedReturnValue(-[__CFURL path](bundleURL, "path"));
              *(_DWORD *)buf = 138412802;
              v75 = v47;
              v76 = 2112;
              v77 = v43;
              v78 = 2112;
              v79 = v48;
              _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Found JSON file %@ for domain %@ in directory %@", buf, 0x20u);

            }
            v53[2](v53, v43, v44);
          }
        }
        else
        {
          if (qword_1000371C0 != -1)
            dispatch_once(&qword_1000371C0, &stru_100030AE0);
          v44 = (id)qword_1000371B8;
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL path](bundleURL, "path"));
            *(_DWORD *)buf = 138412546;
            v75 = v40;
            v76 = 2112;
            v77 = v46;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Could not construct a domain name object for the filename %@.json in directory %@", buf, 0x16u);

          }
        }

        objc_autoreleasePoolPop(v41);
        v39 = (char *)v39 + 1;
      }
      while (v37 != v39);
      v37 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    }
    while (v37);
  }

}

+ (id)additionalServiceDetailsDirectoryURLForApplicationIdentifier:(id)a3 createParentIfNeeded:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v25;
  id v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
  v26 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containerURLReturningError:", &v26));
  v10 = v26;

  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("AdditionalServiceDetails"), 1));
    if (v11)
    {
      if (v6)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v25 = v10;
        v13 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v25);
        v14 = v25;

        if (!v13)
        {
          v18 = 0;
          goto LABEL_13;
        }
        v10 = v14;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "UUIDRepresentation"));
      v16 = v15;
      if (v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v17, 1));
LABEL_12:

        v14 = v10;
LABEL_13:

        v10 = v14;
        goto LABEL_14;
      }
      v22 = objc_alloc((Class)NSError);
      v30[0] = &off_1000327C8;
      v29[0] = CFSTR("Line");
      v29[1] = CFSTR("Function");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[SWCEntry(JSONParsing) additionalServiceDetailsDirectoryURLForApplicationIdentifier:createParentIfNeeded:error:]"));
      v29[2] = NSDebugDescriptionErrorKey;
      v30[1] = v17;
      v30[2] = CFSTR("Could not generate a UUID for the specified application identifier.");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));
      v23 = objc_msgSend(v22, "initWithDomain:code:userInfo:", _SWCErrorDomain, -1, v21);

      v16 = 0;
      v10 = v23;
    }
    else
    {
      v19 = objc_alloc((Class)NSError);
      v28[0] = &off_1000327E0;
      v27[0] = CFSTR("Line");
      v27[1] = CFSTR("Function");
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[SWCEntry(JSONParsing) additionalServiceDetailsDirectoryURLForApplicationIdentifier:createParentIfNeeded:error:]"));
      v27[2] = NSDebugDescriptionErrorKey;
      v28[1] = v16;
      v28[2] = CFSTR("Could not create additional service details storage directory.");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3));
      v20 = objc_msgSend(v19, "initWithDomain:code:userInfo:", _SWCErrorDomain, -1, v17);
      v21 = v10;
      v10 = v20;
    }

    v18 = 0;
    goto LABEL_12;
  }
  v18 = 0;
LABEL_14:

  if (a5 && !v18)
    *a5 = objc_retainAutorelease(v10);

  return v18;
}

+ (BOOL)_shouldIncludeServiceWithDomain:(id)a3 fromBundleRecord:(id)a4 applicationIdentifier:(id)a5 developerModeEnabled:(BOOL)a6 enterpriseContext:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  void *v20;
  id v21;
  unsigned __int8 v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  if ((objc_msgSend(v11, "modeOfOperation") & 1) != 0)
  {
    if (!v8)
    {
      if (qword_1000371C0 != -1)
        dispatch_once(&qword_1000371C0, &stru_100030AE0);
      v23 = qword_1000371B8;
      if (!os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_DEBUG))
        goto LABEL_24;
      *(_DWORD *)buf = 138412290;
      v29 = v11;
      v17 = "Skipping domain %@ because developer mode is disabled";
LABEL_22:
      v18 = v23;
      v19 = 12;
LABEL_23:
      _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, v17, buf, v19);
      goto LABEL_24;
    }
    if ((objc_msgSend(v12, "swc_isBuiltForDevelopment") & 1) == 0)
    {
      if (qword_1000371C0 != -1)
        dispatch_once(&qword_1000371C0, &stru_100030AE0);
      v16 = qword_1000371B8;
      if (!os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_DEBUG))
        goto LABEL_24;
      *(_DWORD *)buf = 138412546;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      v17 = "Skipping domain %@ because bundle %@ is not developer-signed";
      v18 = v16;
      v19 = 22;
      goto LABEL_23;
    }
  }
  if ((objc_msgSend(v11, "modeOfOperation") & 2) != 0)
  {
    if (v14)
    {
      v27 = 0;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "isApplicationIdentifierEligibleForManagedMode:error:", v13, &v27));
      v21 = v27;
      if (v20)
      {
        v22 = objc_msgSend(v20, "BOOLValue");

        if ((v22 & 1) != 0)
        {
          v15 = 1;
LABEL_34:

          goto LABEL_35;
        }
      }
      else
      {
        if (qword_1000371C0 != -1)
          dispatch_once(&qword_1000371C0, &stru_100030AE0);
        v24 = qword_1000371B8;
        if (os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v11;
          v30 = 2112;
          v31 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to check if the MDM profile allows direct connections for %@: %@", buf, 0x16u);
        }
      }
      if (qword_1000371C0 != -1)
        dispatch_once(&qword_1000371C0, &stru_100030AE0);
      v25 = qword_1000371B8;
      if (os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Skipping domain %@ because the MDM profile does not allow directly connecting to it", buf, 0xCu);
      }
      v15 = 0;
      goto LABEL_34;
    }
    if (qword_1000371C0 != -1)
      dispatch_once(&qword_1000371C0, &stru_100030AE0);
    v23 = qword_1000371B8;
    if (!os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_DEBUG))
    {
LABEL_24:
      v15 = 0;
      goto LABEL_35;
    }
    *(_DWORD *)buf = 138412290;
    v29 = v11;
    v17 = "Skipping domain %@ because no MDM profile is active";
    goto LABEL_22;
  }
  v15 = 1;
LABEL_35:

  return v15;
}

+ (id)_deduplicateServicesByMode:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = objc_autoreleasePoolPush();
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000B858;
  v9[3] = &unk_1000309E0;
  v6 = v4;
  v10 = v6;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v9);

  objc_autoreleasePoolPop(v5);
  v7 = objc_msgSend(v6, "copy");

  return v7;
}

+ (id)_associatedDomainsFromEntitlementForBundleRecord:(id)a3 applicationIdentifier:(id)a4 developerModeEnabled:(BOOL)a5 enterpriseContext:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *context;
  void *v33;
  id obj;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v7 = a5;
  v10 = a3;
  v35 = a4;
  v11 = a6;
  context = objc_autoreleasePoolPush();
  v12 = objc_autoreleasePoolPush();
  v36 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "entitlements"));
  v14 = objc_opt_class(NSArray);
  v15 = objc_msgSend(v13, "objectForKey:ofClass:valuesOfClass:", CFSTR("com.apple.developer.associated-domains"), v14, objc_opt_class(NSString));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (!v16
    || (v17 = objc_claimAutoreleasedReturnValue(+[_SWCServiceSpecifier serviceSpecifiersWithEntitlementValue:error:](_SWCServiceSpecifier, "serviceSpecifiersWithEntitlementValue:error:", v16, 0, context)), v16, (v33 = (void *)v17) == 0))
  {
    if ((objc_opt_respondsToSelector(v36, "isSystemPlaceholder") & 1) != 0)
    {
      v18 = objc_msgSend(v36, "isSystemPlaceholder");
      v19 = &__NSArray0__struct;
      if (!v18)
        v19 = 0;
      v33 = v19;
    }
    else
    {
      v33 = 0;
    }
  }
  objc_autoreleasePoolPop(v12);
  if (v33)
  {
    v20 = objc_alloc_init((Class)NSMutableDictionary);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v33;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "SWCDomain", context));
          if (objc_msgSend(a1, "_shouldIncludeServiceWithDomain:fromBundleRecord:applicationIdentifier:developerModeEnabled:enterpriseContext:", v25, v36, v35, v7, v11))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "serviceType"));
            v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", v26));
            if (!v27)
            {
              v27 = objc_alloc_init((Class)NSMutableSet);
              objc_msgSend(v20, "setObject:forKeyedSubscript:", v27, v26);
            }
            objc_msgSend(v27, "addObject:", v25);

          }
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v21);
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_deduplicateServicesByMode:", v20));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000C044;
    v37[3] = &unk_1000309E0;
    v29 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v28, "count"));
    v38 = v29;
    objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v37);
    v30 = objc_msgSend(v29, "copy");

  }
  else
  {
    v30 = 0;
  }

  objc_autoreleasePoolPop(context);
  return v30;
}

+ (id)_enterpriseEntriesWithContext:(id)a3 forBundleRecord:(id)a4 applicationIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  SWCEntry *v21;
  void *v22;
  void *v23;
  SWCEntry *v24;
  SWCEntry *v25;
  SWCFields *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  id v31;
  void *v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;

  v7 = a3;
  v34 = a4;
  v8 = a5;
  v39 = 0;
  v32 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceSpecifiersForApplicationIdentifier:error:", v8, &v39));
  v33 = v39;
  if (!v9)
  {
    if (qword_1000371C0 != -1)
      dispatch_once(&qword_1000371C0, &stru_100030AE0);
    v27 = qword_1000371B8;
    if (os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v42 = v34;
      v43 = 2112;
      v44 = v33;
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to get enterprise-supplied service specifiers for bundle record %@: %@", buf, 0x16u);
    }
    goto LABEL_31;
  }
  if (!objc_msgSend(v9, "count"))
  {
    if (qword_1000371C0 != -1)
      dispatch_once(&qword_1000371C0, &stru_100030AE0);
    v28 = qword_1000371B8;
    if (!os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_DEBUG))
      goto LABEL_31;
    *(_DWORD *)buf = 138412290;
    v42 = v34;
    v29 = "No enterprise-supplied services for bundle record %@";
    goto LABEL_34;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "entitlements"));
  v11 = objc_msgSend(v10, "objectForKey:ofClass:", CFSTR("com.apple.developer.associated-domains.mdm-managed"), objc_opt_class(NSNumber));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = objc_msgSend(v12, "isEqual:", &__kCFBooleanTrue);

  if (!v13)
  {
    if (qword_1000371C0 != -1)
      dispatch_once(&qword_1000371C0, &stru_100030AE0);
    v28 = qword_1000371B8;
    if (!os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_DEBUG))
      goto LABEL_31;
    *(_DWORD *)buf = 138412290;
    v42 = v34;
    v29 = "Bundle record %@ does not want enterprise-supplied entries; skipping lookup";
LABEL_34:
    _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, v29, buf, 0xCu);
LABEL_31:
    v16 = 0;
    goto LABEL_32;
  }
  if (qword_1000371C0 != -1)
    dispatch_once(&qword_1000371C0, &stru_100030AE0);
  v14 = (id)qword_1000371B8;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v31 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134218242;
    v42 = v31;
    v43 = 2112;
    v44 = v34;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%llu enterprise-supplied services for bundle record %@", buf, 0x16u);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v15 = v9;
  v16 = 0;
  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v21 = [SWCEntry alloc];
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "serviceType"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "SWCDomain"));
        v24 = -[SWCEntry initWithApplicationIdentifier:service:domain:](v21, "initWithApplicationIdentifier:service:domain:", v8, v22, v23);

        if (v24)
        {
          v25 = objc_retainAutorelease(v24);
          v26 = -[SWCEntry fields](v25, "fields");
          *(_WORD *)v26 |= 0x100u;
          if (!v16)
            v16 = objc_alloc_init((Class)NSMutableOrderedSet);
          objc_msgSend(v16, "addObject:", v25);
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v17);
  }

LABEL_32:
  return v16;
}

+ (void)_enumerateJSONFilesForBundleRecord:(id)a3 applicationIdentifier:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void ***v12;
  void *v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  char v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  if (v11)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 1;
    v19 = _NSConcreteStackBlock;
    v20 = 3221225472;
    v21 = sub_10000C928;
    v22 = &unk_100030A48;
    v23 = v10;
    v24 = &v25;
    v12 = objc_retainBlock(&v19);
    objc_msgSend(a1, "enumerateJSONResourceURLsForBundleURL:block:", v11, v12, v19, v20, v21, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entitlements"));
    v14 = objc_msgSend(v13, "objectForKey:ofClass:", CFSTR("com.apple.private.swc.additional-service-details-consumer"), objc_opt_class(NSNumber));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = objc_msgSend(v15, "isEqual:", &__kCFBooleanTrue);

    v17 = v16 ^ 1;
    if (!v9)
      v17 = 1;
    if ((v17 & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "additionalServiceDetailsDirectoryURLForApplicationIdentifier:createParentIfNeeded:error:", v9, 0, 0));
      if (objc_msgSend(v18, "checkResourceIsReachableAndReturnError:", 0))
      {
        *((_BYTE *)v26 + 24) = 3;
        objc_msgSend(a1, "enumerateJSONResourceURLsForDirectoryAtURL:block:", v18, v12);
      }

    }
    _Block_object_dispose(&v25, 8);
  }

}

+ (id)_entriesFromBuiltInJSONForBundleRecord:(id)a3 applicationIdentifier:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_10000CDF8;
  v26 = sub_10000CE08;
  v27 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000CE10;
  v18[3] = &unk_100030A70;
  v20 = &v22;
  v21 = a1;
  v5 = a4;
  v19 = v5;
  objc_msgSend(v21, "_enumerateJSONFilesForBundleRecord:applicationIdentifier:block:", a3, v5, v18);
  if (v23[5])
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = (id)v23[5];
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v28, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), "setLastCheckedDate:", v6, (_QWORD)v14);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v28, 16);
      }
      while (v8);
    }

    v11 = (void *)v23[5];
  }
  else
  {
    v11 = 0;
  }
  v12 = objc_msgSend(v11, "copy", (_QWORD)v14);

  _Block_object_dispose(&v22, 8);
  return v12;
}

+ (void)_addEntryToOrderedSet:(id)a3 forUniversalLinksFromSingleDetailsDictionary:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  char v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  __int16 v47;
  void *v48;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v30 = a7;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("appIDs"), v11));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("appID")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("relativeOrder")));
  LOBYTE(a7) = _SWCEnabledConfigurationGetFromDetails(v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPatternList patternListWithDetailsDictionary:defaults:](_SWCPatternList, "patternListWithDetailsDictionary:defaults:", v12, v30));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10000D4C4;
  v37[3] = &unk_100030A98;
  v16 = v13;
  v38 = v16;
  v29 = v15;
  v39 = v29;
  v17 = v14;
  v40 = v17;
  v43 = (char)a7;
  v18 = v28;
  v41 = v18;
  v19 = v11;
  v42 = v19;
  v20 = objc_retainBlock(v37);
  if (v32 && _NSIsNSArray(v32))
  {
    if (qword_1000371C0 != -1)
      dispatch_once(&qword_1000371C0, &stru_100030AE0);
    v21 = (id)qword_1000371B8;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = objc_msgSend(v32, "count");
      *(_DWORD *)buf = 134218242;
      v46 = v22;
      v47 = 2112;
      v48 = v32;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "JSON entry had %llu appIDs: %@", buf, 0x16u);
    }

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v23 = v32;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v23);
          ((void (*)(_QWORD *, _QWORD))v20[2])(v20, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i));
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v44, 16);
      }
      while (v24);
    }

  }
  else
  {
    if (qword_1000371C0 != -1)
      dispatch_once(&qword_1000371C0, &stru_100030AE0);
    v27 = qword_1000371B8;
    if (os_log_type_enabled((os_log_t)qword_1000371B8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v31;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "JSON entry had one appID: %@", buf, 0xCu);
    }
    ((void (*)(_QWORD *, void *))v20[2])(v20, v31);
  }

}

+ (void)_addEntriesToOrderedSet:(id)a3 forUniversalLinksFromDetailsArray:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7 maximum:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v23 = a3;
  v14 = a4;
  v24 = a5;
  v15 = a6;
  v16 = a7;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v18)
  {
    v19 = 0;
    v20 = *(_QWORD *)v26;
LABEL_3:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v20)
        objc_enumerationMutation(v17);
      v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v21);
      if (_NSIsNSDictionary(v22))
      {
        objc_msgSend(a1, "_addEntryToOrderedSet:forUniversalLinksFromSingleDetailsDictionary:domain:substitutionVariables:defaults:", v23, v22, v24, v15, v16);
        if (++v19 >= a8)
          break;
      }
      if (v18 == (id)++v21)
      {
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v18)
          goto LABEL_3;
        break;
      }
    }
  }

}

+ (void)_addEntriesToOrderedSet:(id)a3 forUniversalLinksFromDetailsDictionary:(id)a4 domain:(id)a5 substitutionVariables:(id)a6 defaults:(id)a7 maximum:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  id v24;
  unint64_t v25;
  _QWORD v26[4];

  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000D95C;
  v18[3] = &unk_100030AC0;
  v19 = a3;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = v26;
  v24 = a1;
  v25 = a8;
  v14 = v22;
  v15 = v21;
  v16 = v20;
  v17 = v19;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v18);

  _Block_object_dispose(v26, 8);
}

+ (void)_addEntriesToOrderedSet:(id)a3 forService:(id)a4 fromAppsArray:(id)a5 domain:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  id v17;
  SWCEntry *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v19 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if (_NSIsNSString(v16))
        {
          v17 = objc_msgSend(objc_alloc((Class)_SWCApplicationIdentifier), "initWithString:", v16);
          v18 = -[SWCEntry initWithApplicationIdentifier:service:domain:]([SWCEntry alloc], "initWithApplicationIdentifier:service:domain:", v17, v9, v11);
          objc_msgSend(v19, "addObject:", v18);

        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

}

@end
