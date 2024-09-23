@implementation PKOverlayableWebServiceRequest

- (PKOverlayableWebServiceRequest)initWithCoder:(id)a3
{
  id v4;
  PKOverlayableWebServiceRequest *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *overlayParameters;
  uint64_t v16;
  NSMutableDictionary *secureOverlayParameters;
  uint64_t v18;
  NSArray *overridenKeys;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKOverlayableWebServiceRequest;
  v5 = -[PKWebServiceRequest initWithCoder:](&v21, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("overlayParameters"));
    v14 = objc_claimAutoreleasedReturnValue();
    overlayParameters = v5->_overlayParameters;
    v5->_overlayParameters = (NSMutableDictionary *)v14;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("secureOverlayParameters"));
    v16 = objc_claimAutoreleasedReturnValue();
    secureOverlayParameters = v5->_secureOverlayParameters;
    v5->_secureOverlayParameters = (NSMutableDictionary *)v16;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("overridenKeys"));
    v18 = objc_claimAutoreleasedReturnValue();
    overridenKeys = v5->_overridenKeys;
    v5->_overridenKeys = (NSArray *)v18;

    v5->_requiresConfigurationForRetry = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresConfigurationForRetry"));
    v5->_requiresConfigurationForRedirect = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresConfigurationForRedirect"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKOverlayableWebServiceRequest;
  v4 = a3;
  -[PKWebServiceRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_overlayParameters, CFSTR("overlayParameters"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_secureOverlayParameters, CFSTR("secureOverlayParameters"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_overridenKeys, CFSTR("overridenKeys"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_requiresConfigurationForRetry, CFSTR("requiresConfigurationForRetry"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_requiresConfigurationForRedirect, CFSTR("requiresConfigurationForRedirect"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKZeroingDataContainer)archivedData
{
  void *v2;
  id v3;
  void *v4;
  PKZeroingDataContainer *v5;
  id v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  v4 = v3;
  if (v3)
  {
    NSLog(CFSTR("Could not create archive with error %@"), v3);
    v5 = 0;
  }
  else
  {
    v5 = -[PKZeroingDataContainer initWithData:]([PKZeroingDataContainer alloc], "initWithData:", v2);
  }

  return v5;
}

- (PKOverlayableWebServiceRequest)init
{
  PKOverlayableWebServiceRequest *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *overlayParameters;
  NSMutableDictionary *v5;
  NSMutableDictionary *secureOverlayParameters;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKOverlayableWebServiceRequest;
  v2 = -[PKOverlayableWebServiceRequest init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    overlayParameters = v2->_overlayParameters;
    v2->_overlayParameters = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    secureOverlayParameters = v2->_secureOverlayParameters;
    v2->_secureOverlayParameters = v5;

  }
  return v2;
}

- (void)setOverlayValue:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *overlayParameters;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    overlayParameters = self->_overlayParameters;
    if (v8)
      -[NSMutableDictionary setObject:forKeyedSubscript:](overlayParameters, "setObject:forKeyedSubscript:", v8, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](overlayParameters, "removeObjectForKey:", v6);
  }

}

- (id)overlayValueForKey:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_overlayParameters, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)overlayParameters
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_overlayParameters, "copy");
}

- (void)setOverlayParameters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
    v5 = (id)objc_msgSend(v4, "mutableCopy");
  else
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v5;
  objc_storeStrong((id *)&self->_overlayParameters, v5);

}

- (void)setSecureOverlayValue:(id)a3 forKey:(id)a4
{
  id v6;
  NSMutableDictionary *secureOverlayParameters;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
  {
    secureOverlayParameters = self->_secureOverlayParameters;
    if (v8)
      -[NSMutableDictionary setObject:forKeyedSubscript:](secureOverlayParameters, "setObject:forKeyedSubscript:", v8, v6);
    else
      -[NSMutableDictionary removeObjectForKey:](secureOverlayParameters, "removeObjectForKey:", v6);
  }

}

- (id)secureOverlayValueForKey:(id)a3
{
  if (!a3)
    return 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_secureOverlayParameters, "objectForKeyedSubscript:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)secureOverlayParameters
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_secureOverlayParameters, "copy");
}

- (void)setSecureOverlayParameters:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (v4)
    v5 = (id)objc_msgSend(v4, "mutableCopy");
  else
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v5;
  objc_storeStrong((id *)&self->_secureOverlayParameters, v5);

}

- (void)_applyOverlayToDictionary:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_overlayParameters;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_overlayParameters, "objectForKeyedSubscript:", v10, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_applySecureOverlayToDictionary:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_secureOverlayParameters;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_secureOverlayParameters, "objectForKeyedSubscript:", v10, (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_setOverriddenKeys:(id)a3
{
  NSArray *v4;
  NSArray *overridenKeys;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  overridenKeys = self->_overridenKeys;
  self->_overridenKeys = v4;

}

- (void)_updateRequestForRedirect:(id)a3 overrides:(id)a4 webService:(id)a5 withCompletion:(id)a6
{
  id v9;
  void (**v10)(id, id);
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v9 = a4;
  v10 = (void (**)(id, id))a6;
  v11 = (void *)-[NSMutableDictionary mutableCopy](self->_overlayParameters, "mutableCopy");
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "removeObjectsForKeys:", self->_overridenKeys);
  if (v9)
    objc_msgSend(v12, "addEntriesFromDictionary:", v9);
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHTTPBody:", v13);

  if (v10)
    v10[2](v10, v14);

}

- (void)_updateRequestForRetry:(id)a3 retryFields:(id)a4 webService:(id)a5 withCompletion:(id)a6
{
  void (**v8)(id, id);
  void *v9;
  id v10;

  v10 = a3;
  v8 = (void (**)(id, id))a6;
  objc_msgSend((id)objc_opt_class(), "_HTTPBodyWithDictionary:", self->_overlayParameters);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHTTPBody:", v9);

  if (v8)
    v8[2](v8, v10);

}

- (BOOL)hasOverlayParameters
{
  return -[NSMutableDictionary count](self->_secureOverlayParameters, "count")
      || -[NSMutableDictionary count](self->_overlayParameters, "count") != 0;
}

- (BOOL)requiresConfigurationForRetry
{
  return self->_requiresConfigurationForRetry;
}

- (void)setRequiresConfigurationForRetry:(BOOL)a3
{
  self->_requiresConfigurationForRetry = a3;
}

- (BOOL)requiresConfigurationForRedirect
{
  return self->_requiresConfigurationForRedirect;
}

- (void)setRequiresConfigurationForRedirect:(BOOL)a3
{
  self->_requiresConfigurationForRedirect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridenKeys, 0);
  objc_storeStrong((id *)&self->_secureOverlayParameters, 0);
  objc_storeStrong((id *)&self->_overlayParameters, 0);
}

@end
