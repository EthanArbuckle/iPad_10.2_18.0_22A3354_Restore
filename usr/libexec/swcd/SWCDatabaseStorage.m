@implementation SWCDatabaseStorage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  +[SWCEntry canonicalizeEntries:](SWCEntry, "canonicalizeEntries:", self->_entries);
  objc_msgSend(a3, "encodeInt64:forKey:", self->_databaseVersion, CFSTR("databaseVersion"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_entries, CFSTR("entries"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_settings, CFSTR("settings"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_launchServicesDatabaseGeneration, CFSTR("launchServicesDatabaseGeneration"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_enterpriseState, CFSTR("enterpriseState"));
}

- (SWCDatabaseStorage)initWithCoder:(id)a3
{
  SWCDatabaseStorage *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSNumber *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  NSOrderedSet *v22;
  NSOrderedSet *entries;
  id v24;
  void *v25;
  id v26;
  NSDictionary *v27;
  NSDictionary *settings;
  id v29;
  void *v30;
  id v31;
  NSDictionary *v32;
  NSNumber *launchServicesDatabaseGeneration;
  NSNumber *v34;
  NSData *enterpriseState;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *context;
  _QWORD v42[6];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _BYTE v56[128];
  _QWORD v57[7];
  _QWORD v58[2];

  context = objc_autoreleasePoolPush();
  v51.receiver = self;
  v51.super_class = (Class)SWCDatabaseStorage;
  v5 = -[SWCDatabaseStorage init](&v51, "init");
  if (!v5)
    goto LABEL_25;
  v5->_databaseVersion = (int64_t)objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("databaseVersion"));
  v6 = objc_opt_class(SWCEntry);
  v39 = objc_opt_class(_SWCServiceSpecifier);
  v7 = objc_alloc((Class)NSSet);
  v58[0] = objc_opt_class(NSOrderedSet);
  v58[1] = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 2));
  v9 = objc_msgSend(v7, "initWithArray:", v8);

  v10 = objc_alloc((Class)NSSet);
  v57[0] = objc_opt_class(NSDictionary);
  v57[1] = objc_opt_class(NSArray);
  v57[2] = objc_opt_class(NSString);
  v57[3] = objc_opt_class(NSNumber);
  v57[4] = objc_opt_class(NSData);
  v57[5] = objc_opt_class(NSDate);
  v57[6] = v39;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 7));
  v40 = objc_msgSend(v10, "initWithArray:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "swc_decodeObjectOfClasses:forKey:", v9, CFSTR("entries")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "swc_decodeObjectOfClasses:forKey:", v40, CFSTR("settings")));
  v14 = objc_msgSend(a3, "swc_decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("launchServicesDatabaseGeneration"));
  v15 = (NSNumber *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(a3, "swc_decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("enterpriseState"));
  v38 = objc_claimAutoreleasedReturnValue(v16);
  if (v12)
  {
    v17 = objc_opt_class(NSOrderedSet);
    if ((objc_opt_isKindOfClass(v12, v17) & 1) == 0)
    {
LABEL_16:
      v24 = objc_alloc((Class)NSError);
      v54[0] = CFSTR("Line");
      v54[1] = CFSTR("Function");
      v55[0] = &off_100032858;
      entries = (NSOrderedSet *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDatabaseStorage initWithCoder:]"));
      v55[1] = entries;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 2));
      v26 = objc_msgSend(v24, "initWithDomain:code:userInfo:", NSCocoaErrorDomain, 4864, v25);
      objc_msgSend(a3, "failWithError:", v26);

      goto LABEL_17;
    }
    +[SWCEntry canonicalizeEntries:](SWCEntry, "canonicalizeEntries:", v12);
    v37 = v9;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v48 != v20)
            objc_enumerationMutation(v18);
          if ((objc_opt_isKindOfClass(*(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i), v6) & 1) == 0)
          {

            v9 = v37;
            goto LABEL_16;
          }
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v19)
          continue;
        break;
      }
    }

    v9 = v37;
    v22 = (NSOrderedSet *)v18;
  }
  else
  {
    v22 = (NSOrderedSet *)objc_alloc_init((Class)NSOrderedSet);
  }
  entries = v5->_entries;
  v5->_entries = v22;
LABEL_17:

  if (v13)
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v46 = _NSIsNSDictionary(v13);
    if (*((_BYTE *)v44 + 24)
      && (v42[0] = _NSConcreteStackBlock,
          v42[1] = 3221225472,
          v42[2] = sub_100011A68,
          v42[3] = &unk_100030D30,
          v42[4] = &v43,
          v42[5] = v39,
          objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v42),
          *((_BYTE *)v44 + 24)))
    {
      v27 = v13;
      settings = v5->_settings;
      v5->_settings = v27;
    }
    else
    {
      v29 = objc_alloc((Class)NSError);
      v52[0] = CFSTR("Line");
      v52[1] = CFSTR("Function");
      v53[0] = &off_100032870;
      settings = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDatabaseStorage initWithCoder:]"));
      v53[1] = settings;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 2));
      v31 = objc_msgSend(v29, "initWithDomain:code:userInfo:", NSCocoaErrorDomain, 4864, v30);
      objc_msgSend(a3, "failWithError:", v31);

    }
    _Block_object_dispose(&v43, 8);
  }
  else
  {
    v32 = v5->_settings;
    v5->_settings = (NSDictionary *)&__NSDictionary0__struct;

  }
  launchServicesDatabaseGeneration = v5->_launchServicesDatabaseGeneration;
  v5->_launchServicesDatabaseGeneration = v15;
  v34 = v15;

  enterpriseState = v5->_enterpriseState;
  v5->_enterpriseState = (NSData *)v38;

LABEL_25:
  objc_autoreleasePoolPop(context);
  return v5;
}

- (int64_t)databaseVersion
{
  return self->_databaseVersion;
}

- (void)setDatabaseVersion:(int64_t)a3
{
  self->_databaseVersion = a3;
}

- (NSOrderedSet)entries
{
  return (NSOrderedSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setEntries:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSDictionary)settings
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSNumber)launchServicesDatabaseGeneration
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLaunchServicesDatabaseGeneration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSData)enterpriseState
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEnterpriseState:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enterpriseState, 0);
  objc_storeStrong((id *)&self->_launchServicesDatabaseGeneration, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
