@implementation STUIDSCacheClearerStateTable

- (STUIDSCacheClearerStateTable)init
{
  STUIDSCacheClearerStateTable *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *entriesByKey;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIDSCacheClearerStateTable;
  v2 = -[STUIDSCacheClearerStateTable init](&v6, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    entriesByKey = v2->_entriesByKey;
    v2->_entriesByKey = v3;

  }
  return v2;
}

- (id)entryForInstructorAppleID:(id)a3 courseIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  STUIDSCacheClearerStateTableEntry *v10;
  void *v11;
  _QWORD v13[2];

  v6 = a3;
  v7 = a4;
  v13[0] = v6;
  v13[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSCacheClearerStateTable entriesByKey](self, "entriesByKey"));
  v10 = (STUIDSCacheClearerStateTableEntry *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));

  if (!v10)
  {
    v10 = objc_opt_new(STUIDSCacheClearerStateTableEntry);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUIDSCacheClearerStateTable entriesByKey](self, "entriesByKey"));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v8);

  }
  return v10;
}

- (NSMutableDictionary)entriesByKey
{
  return self->_entriesByKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entriesByKey, 0);
}

@end
