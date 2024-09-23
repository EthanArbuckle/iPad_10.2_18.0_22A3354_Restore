@implementation SWCEnterpriseContext

- (SWCEnterpriseContext)init
{
  SWCEnterpriseContext *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SWCEnterpriseContext;
  v2 = -[SWCEnterpriseContext init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCPrefs sharedPrefs](_SWCPrefs, "sharedPrefs"));
    v2->_appleInternal = objc_msgSend(v3, "isAppleInternal");

    -[SWCEnterpriseContext _loadEnterpriseData](v2, "_loadEnterpriseData");
  }
  return v2;
}

- (id)serviceSpecifiersForApplicationIdentifier:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSError *v12;
  id v13;
  void *v15;
  id v16;

  v7 = a3;
  v8 = v7;
  if (!self->_associatedDomains)
  {
    v12 = self->_highLevelError;
    v11 = 0;
    if (!a4)
      goto LABEL_14;
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  if (!v9)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCEnterpriseContext.mm"), 93, CFSTR("Failed to get a string value from %@"), v8);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_associatedDomains, "objectForKeyedSubscript:", v9));
  if (v10)
  {
    v16 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[_SWCServiceSpecifier serviceSpecifiersWithEntitlementValue:error:](_SWCServiceSpecifier, "serviceSpecifiersWithEntitlementValue:error:", v10, &v16));
    v12 = (NSError *)v16;
    if (v11)
      v13 = v11;

  }
  else
  {
    v12 = 0;
    v11 = &__NSArray0__struct;
  }

  if (a4)
  {
LABEL_12:
    if (!v11)
      *a4 = objc_retainAutorelease(v12);
  }
LABEL_14:

  return v11;
}

- (id)isApplicationIdentifierEligibleForManagedMode:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  NSSet *v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a3;
  v8 = (void *)_SWCDiagnosticStorage[1];
  if (v8 && self->_appleInternal)
  {
    v9 = v8;
  }
  else
  {
    v9 = self->_managedModeAppIDs;
    if (!v9)
    {
      v11 = 0;
      if (!a4)
        goto LABEL_12;
      goto LABEL_10;
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleIdentifier"));
  if (!v10)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SWCEnterpriseContext.mm"), 142, CFSTR("Failed to get a string value from %@"), v7);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[NSSet containsObject:](v9, "containsObject:", v10)));

  if (a4)
  {
LABEL_10:
    if (!v11)
      *a4 = objc_retainAutorelease(self->_highLevelError);
  }
LABEL_12:

  return v11;
}

- (NSData)state
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _OWORD v11[2];

  v3 = objc_autoreleasePoolPush();
  if (-[NSDictionary count](self->_associatedDomains, "count") || -[NSSet count](self->_managedModeAppIDs, "count"))
  {
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    if (-[NSDictionary count](self->_associatedDomains, "count"))
      objc_msgSend(v4, "addObject:", self->_associatedDomains);
    if (-[NSSet count](self->_managedModeAppIDs, "count"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_managedModeAppIDs, "allObjects"));
      objc_msgSend(v4, "addObject:", v5);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v4, 2, 0));
    v7 = v6;
    if (v6)
    {
      memset(v11, 0, sizeof(v11));
      v8 = objc_retainAutorelease(v6);
      CC_SHA256(objc_msgSend(v8, "bytes", 0, 0, 0, 0), (CC_LONG)objc_msgSend(v8, "length"), (unsigned __int8 *)v11);
      v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v11, 32);
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
  return (NSData *)v9;
}

- (BOOL)isManaging
{
  return self->_managing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highLevelError, 0);
  objc_storeStrong((id *)&self->_managedModeAppIDs, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
}

- (void)_loadEnterpriseData
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  NSSet *v25;
  id v26;
  void *v27;
  void *v28;
  NSError *v29;
  NSError *highLevelError;
  NSSet *managedModeAppIDs;
  uint64_t v32;
  void *v33;
  void *context;
  id v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint8_t buf[4];
  id v45;
  _QWORD v46[3];
  _QWORD v47[3];
  _BYTE v48[128];

  context = objc_autoreleasePoolPush();
  if (qword_1000371D0 != -1)
    dispatch_once(&qword_1000371D0, &stru_100030B00);
  if (qword_1000371D8)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000371D8, "sharedConnection"));
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "associatedDomainsForManagedApps"));
    v3 = (void *)v2;
    if (v2)
    {
      v32 = v2;
      v4 = objc_alloc_init((Class)NSMutableDictionary);
      v36 = objc_alloc_init((Class)NSMutableSet);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      obj = v3;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16, v32);
      if (v5)
      {
        v6 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v6)
              objc_enumerationMutation(obj);
            v8 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("BundleID")));
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AssociatedDomains")));
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AssociatedDomainsEnableDirectDownloads")));
            if (objc_msgSend(v11, "BOOLValue"))
              objc_msgSend(v36, "addObject:", v9);

          }
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        }
        while (v5);
      }

      v12 = (unint64_t)objc_msgSend(v4, "copy");
      v13 = (unint64_t)objc_msgSend(v36, "copy");

      v14 = 0;
      v15 = 1;
      goto LABEL_22;
    }
    v16 = objc_alloc((Class)NSError);
    v47[0] = &off_100032828;
    v46[0] = CFSTR("Line");
    v46[1] = CFSTR("Function");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCEnterpriseContext(CPMCInterop) _loadEnterpriseData]"));
    v46[2] = NSDebugDescriptionErrorKey;
    v47[1] = v17;
    v47[2] = CFSTR("Failed to get associated domain data from ManagedConfiguration framework.");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 3));
    v14 = objc_msgSend(v16, "initWithDomain:code:userInfo:", _SWCErrorDomain, 1701, v18);

  }
  else
  {
    v14 = (id)qword_1000371C8;
  }
  if (qword_1000371E8 != -1)
    dispatch_once(&qword_1000371E8, &stru_100030B20);
  v19 = qword_1000371E0;
  if (os_log_type_enabled((os_log_t)qword_1000371E0, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error getting enterprise-managed associated domains data. If this device is not enterprise-managed, this is normal: %@", buf, 0xCu);
  }
  v15 = 0;
  v12 = 0;
  v13 = 0;
LABEL_22:
  objc_autoreleasePoolPop(context);
  if (v15)
  {
    v20 = objc_msgSend((id)v12, "copy");
    v21 = v20;
    if (v20)
      v22 = v20;
    else
      v22 = &__NSDictionary0__struct;
    objc_storeStrong((id *)&self->_associatedDomains, v22);

    v23 = objc_msgSend((id)v13, "copy");
    v24 = v23;
    if (v23)
      v25 = (NSSet *)v23;
    else
      v25 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    managedModeAppIDs = self->_managedModeAppIDs;
    self->_managedModeAppIDs = v25;

    self->_managing = (v12 | v13) != 0;
  }
  else if (v14)
  {
    objc_storeStrong((id *)&self->_highLevelError, v14);
  }
  else
  {
    v26 = objc_alloc((Class)NSError);
    v42[0] = CFSTR("Line");
    v42[1] = CFSTR("Function");
    v43[0] = &off_100032840;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCEnterpriseContext(CPMCInterop) _loadEnterpriseData]"));
    v43[1] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
    v29 = (NSError *)objc_msgSend(v26, "initWithDomain:code:userInfo:", _SWCErrorDomain, -1, v28);
    highLevelError = self->_highLevelError;
    self->_highLevelError = v29;

  }
}

@end
