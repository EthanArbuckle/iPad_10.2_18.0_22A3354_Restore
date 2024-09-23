@implementation SSVGratisRequestBody

- (SSVGratisRequestBody)initWithRequestStyle:(int64_t)a3
{
  SSVGratisRequestBody *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSVGratisRequestBody;
  result = -[SSVGratisRequestBody init](&v5, sel_init);
  if (result)
    result->_style = a3;
  return result;
}

- (NSMutableDictionary)bodyDictionary
{
  id v3;
  void *v4;
  NSArray *v5;
  NSArray *v6;
  id v7;
  id v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  int64_t style;
  void *v21;
  NSNumber *accountID;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  SSVGratisRequestBody *v34;
  NSArray *v35;
  NSArray *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  if (self->_additionalParameters)
    objc_msgSend(v3, "addEntriesFromDictionary:");
  if (self->_backgroundRequest)
    objc_msgSend(v4, "setObject:forKey:", CFSTR("1"), CFSTR("is-background"));
  v5 = self->_bundleIdentifiers;
  v6 = self->_itemIdentifiers;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (-[NSArray count](self->_applications, "count"))
  {
    v35 = v6;
    v36 = v5;
    v37 = v4;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v34 = self;
    v9 = self->_applications;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v40 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v14, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v8, "addObject:", v15);
          objc_msgSend(v14, "itemIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", strtoll((const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"), 0, 10));
            objc_msgSend(v38, "addObject:", v17);

          }
          objc_msgSend(v14, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v18);

        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v11);
    }

    if (objc_msgSend(v8, "count"))
    {
      v5 = (NSArray *)v8;

    }
    else
    {
      v5 = v36;
    }
    self = v34;
    v6 = v35;
    if (objc_msgSend(v38, "count"))
    {
      v19 = (NSArray *)v38;

      v6 = v19;
    }
    v4 = v37;

  }
  style = self->_style;
  if (!style)
  {
    accountID = self->_accountID;
    if (accountID)
    {
      -[NSNumber stringValue](accountID, "stringValue");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("ds-id"));

    }
    if (v5)
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("bundle-ids"));
    if (v6)
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("item-ids"));
    v24 = CFSTR("application/json");
    v25 = CFSTR("response-content-type");
    v26 = v4;
    goto LABEL_46;
  }
  if (style != 2)
  {
    if (style != 1)
      goto LABEL_47;
    if (objc_msgSend(v7, "count"))
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("apps"));
    if (-[NSArray count](v5, "count") == 1)
    {
      -[NSArray objectAtIndex:](v5, "objectAtIndex:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("bid"));

    }
    else if (v5)
    {
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("bundle-ids"));
    }
    if (!v6)
      goto LABEL_47;
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("claim-item-ids"));
    v25 = CFSTR("download-item-ids");
    v26 = v4;
    v24 = (const __CFString *)v6;
LABEL_46:
    objc_msgSend(v26, "setObject:forKey:", v24, v25);
LABEL_47:
    v27 = 2;
    goto LABEL_48;
  }
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("apps"));
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("bundle-ids"));
  v27 = 4;
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("claim-type"));

  v29 = (void *)MGCopyAnswer();
  if (v29)
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("serial-no"));
  v30 = (void *)MGCopyAnswer();
  if (v30)
  {
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("guid"));
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("udid"));
  }
  v31 = (void *)MGCopyAnswer();
  if (v31)
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("imei"));
  v32 = (void *)MGCopyAnswer();
  if (v32)
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("meid"));

  return (NSMutableDictionary *)v4;
}

- (NSData)JSONBodyData
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[SSVGratisRequestBody bodyDictionary](self, "bodyDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (NSData)propertyListBodyData
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB38B0];
  -[SSVGratisRequestBody bodyDictionary](self, "bodyDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithPropertyList:format:options:error:", v3, 100, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (void)setValue:(id)a3 forBodyParameter:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *additionalParameters;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!self->_additionalParameters)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    additionalParameters = self->_additionalParameters;
    self->_additionalParameters = v7;

  }
  v9 = self->_additionalParameters;
  if (v10)
    -[NSMutableDictionary setObject:forKey:](v9, "setObject:forKey:", v10, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v6);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRequestStyle:", self->_style);
  v6 = -[NSNumber copyWithZone:](self->_accountID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NSMutableDictionary mutableCopyWithZone:](self->_additionalParameters, "mutableCopyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSArray copyWithZone:](self->_applications, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  *(_BYTE *)(v5 + 32) = self->_backgroundRequest;
  v12 = -[NSArray copyWithZone:](self->_bundleIdentifiers, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[NSArray copyWithZone:](self->_itemIdentifiers, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  return (id)v5;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSArray *itemIdentifiers;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)SSVGratisRequestBody;
  -[SSVGratisRequestBody description](&v9, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  itemIdentifiers = self->_itemIdentifiers;
  if (!itemIdentifiers)
    itemIdentifiers = self->_bundleIdentifiers;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: [IDs: %@]"), v4, itemIdentifiers);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)accountIdentifier
{
  return self->_accountID;
}

- (void)setAccountIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isBackgroundRequest
{
  return self->_backgroundRequest;
}

- (void)setBackgroundRequest:(BOOL)a3
{
  self->_backgroundRequest = a3;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (void)setItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)requestStyle
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_additionalParameters, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
