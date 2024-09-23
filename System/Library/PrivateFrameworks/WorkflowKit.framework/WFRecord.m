@implementation WFRecord

- (WFRecord)init
{
  return -[WFRecord initWithStorage:](self, "initWithStorage:", 0);
}

- (WFRecord)initWithStorage:(id)a3
{
  return -[WFRecord initWithStorage:properties:](self, "initWithStorage:properties:", a3, 0);
}

- (WFRecord)initWithStorage:(id)a3 properties:(id)a4
{
  return -[WFRecord initWithStorage:properties:settingDefaultValues:](self, "initWithStorage:properties:settingDefaultValues:", a3, a4, 1);
}

- (WFRecord)initWithStorage:(id)a3 properties:(id)a4 settingDefaultValues:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  WFRecord *v15;
  uint64_t v16;
  NSDictionary *allPropertiesByName;
  uint64_t v18;
  NSMutableSet *fetchedPropertyNames;
  uint64_t v20;
  NSMutableSet *modifiedPropertyNamesSinceLastSave;
  uint64_t v22;
  NSMutableDictionary *lastSavedOrFetchedValues;
  uint64_t v24;
  NSMutableSet *modifiedPropertyNames;
  uint64_t v26;
  NSMutableDictionary *lastFetchedValues;
  uint64_t v28;
  NSString *storageIdentifier;
  NSObject *v30;
  NSObject *v31;
  WFRecord *v32;
  objc_super v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v5 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  getWFGeneralLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);

  getWFGeneralLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 138412290;
    v36 = (id)objc_opt_class();
    v14 = v36;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "WFRecordInitWithStorage", "class=%{signpost.description:attribute}@", buf, 0xCu);

  }
  v34.receiver = self;
  v34.super_class = (Class)WFRecord;
  v15 = -[WFRecord init](&v34, sel_init);
  if (v15)
  {
    objc_msgSend((id)objc_opt_class(), "recordSubclassProperties");
    v16 = objc_claimAutoreleasedReturnValue();
    allPropertiesByName = v15->_allPropertiesByName;
    v15->_allPropertiesByName = (NSDictionary *)v16;

    v18 = objc_opt_new();
    fetchedPropertyNames = v15->_fetchedPropertyNames;
    v15->_fetchedPropertyNames = (NSMutableSet *)v18;

    v20 = objc_opt_new();
    modifiedPropertyNamesSinceLastSave = v15->_modifiedPropertyNamesSinceLastSave;
    v15->_modifiedPropertyNamesSinceLastSave = (NSMutableSet *)v20;

    v22 = objc_opt_new();
    lastSavedOrFetchedValues = v15->_lastSavedOrFetchedValues;
    v15->_lastSavedOrFetchedValues = (NSMutableDictionary *)v22;

    v24 = objc_opt_new();
    modifiedPropertyNames = v15->_modifiedPropertyNames;
    v15->_modifiedPropertyNames = (NSMutableSet *)v24;

    v26 = objc_opt_new();
    lastFetchedValues = v15->_lastFetchedValues;
    v15->_lastFetchedValues = (NSMutableDictionary *)v26;

    objc_msgSend(v8, "identifier");
    v28 = objc_claimAutoreleasedReturnValue();
    storageIdentifier = v15->_storageIdentifier;
    v15->_storageIdentifier = (NSString *)v28;

    if (v8)
      -[WFRecord loadFromStorage:properties:](v15, "loadFromStorage:properties:", v8, v9);
    if (v5)
      -[WFRecord setDefaultPropertyValuesExceptFetched](v15, "setDefaultPropertyValuesExceptFetched");
    -[WFRecord resetModificationsForProperties:onlySinceLastSave:](v15, "resetModificationsForProperties:onlySinceLastSave:", 0, 0);
    -[WFRecord setupPropertyObservation](v15, "setupPropertyObservation");
    getWFGeneralLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C15B3000, v31, OS_SIGNPOST_INTERVAL_END, v11, "WFRecordInitWithStorage", ", buf, 2u);
    }

    v32 = v15;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;

  -[WFRecord tearDownPropertyObservation](self, "tearDownPropertyObservation");
  v3.receiver = self;
  v3.super_class = (Class)WFRecord;
  -[WFRecord dealloc](&v3, sel_dealloc);
}

- (NSSet)allProperties
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[WFRecord allPropertiesByName](self, "allPropertiesByName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (NSSet)fetchedProperties
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[WFRecord fetchedPropertyNames](self, "fetchedPropertyNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__WFRecord_fetchedProperties__block_invoke;
  v6[3] = &unk_1E7AEE3F0;
  v6[4] = self;
  objc_msgSend(v3, "if_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)modifiedPropertiesSinceLastSave
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[WFRecord modifiedPropertyNamesSinceLastSave](self, "modifiedPropertyNamesSinceLastSave");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__WFRecord_modifiedPropertiesSinceLastSave__block_invoke;
  v6[3] = &unk_1E7AEE3F0;
  v6[4] = self;
  objc_msgSend(v3, "if_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (NSSet)modifiedProperties
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[WFRecord modifiedPropertyNames](self, "modifiedPropertyNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__WFRecord_modifiedProperties__block_invoke;
  v6[3] = &unk_1E7AEE3F0;
  v6[4] = self;
  objc_msgSend(v3, "if_map:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)loadFromStorage:(id)a3
{
  -[WFRecord loadFromStorage:properties:](self, "loadFromStorage:properties:", a3, 0);
}

- (void)loadFromStorage:(id)a3 properties:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  WFRecordPropertyMapping *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  os_signpost_id_t spid;
  unint64_t v39;
  id obj;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  getWFGeneralLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  getWFGeneralLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v39 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "WFRecordLoadFromStorage", ", buf, 2u);
  }

  objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "recordPropertyMap");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = 0;
  }
  spid = v9;
  if (!v7)
  {
    v12 = (void *)MEMORY[0x1E0C99E60];
    -[WFRecord allPropertiesByName](self, "allPropertiesByName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v14);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v15 = objc_opt_class();
  +[WFRecord propertiesForClass:walkingSuperclassesUntilReaching:](WFRecord, "propertiesForClass:walkingSuperclassesUntilReaching:", v15, objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v7;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
  if (v16)
  {
    v17 = v16;
    v42 = *(_QWORD *)v46;
    v41 = v6;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v46 != v42)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        v20 = (void *)MEMORY[0x1C3BB3598]();
        -[WFRecord allPropertiesByName](self, "allPropertiesByName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRecord.m"), 139, CFSTR("Property name \"%@\" is invalid for class: %@"), v19, v33);

        }
        objc_msgSend(v44, "objectForKeyedSubscript:", v19);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v23)
          v25 = (void *)v23;
        else
          v25 = v19;
        v26 = v25;

        objc_msgSend(v43, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = -[WFRecordPropertyMapping initWithSourceObject:property:destinationObject:property:]([WFRecordPropertyMapping alloc], "initWithSourceObject:property:destinationObject:property:", v6, v27, self, v22);
          -[WFRecordPropertyMapping propagate:](v28, "propagate:", 1);
          -[WFRecord fetchedPropertyNames](self, "fetchedPropertyNames");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v19);
        }
        else
        {
          getWFWFRecordLogObject();
          v28 = (WFRecordPropertyMapping *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(&v28->super, OS_LOG_TYPE_INFO))
            goto LABEL_24;
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315650;
          v50 = "-[WFRecord loadFromStorage:properties:]";
          v51 = 2114;
          v52 = v26;
          v53 = 2114;
          v54 = v29;
          _os_log_impl(&dword_1C15B3000, &v28->super, OS_LOG_TYPE_INFO, "%s Not loading property %{public}@ from storage, because storage %{public}@ doesn't have it.", buf, 0x20u);
        }

        v6 = v41;
LABEL_24:

        objc_autoreleasePoolPop(v20);
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    }
    while (v17);
  }

  objc_msgSend(v6, "identifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecord setStorageIdentifier:](self, "setStorageIdentifier:", v34);

  -[WFRecord resetModificationsForProperties:onlySinceLastSave:](self, "resetModificationsForProperties:onlySinceLastSave:", obj, 0);
  getWFGeneralLogObject();
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v39 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C15B3000, v36, OS_SIGNPOST_INTERVAL_END, spid, "WFRecordLoadFromStorage", ", buf, 2u);
  }

}

- (BOOL)saveChangesToStorage:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  WFRecord *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFRecord.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("storage"));

  }
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecord storageIdentifier](self, "storageIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  v11 = v9;
  v12 = v11;
  if (v10 == v11)
  {
    v13 = 1;
  }
  else
  {
    v13 = 0;
    if (v10 && v11)
      v13 = objc_msgSend(v10, "isEqual:", v11);
  }

  -[WFRecord modifiedPropertiesSinceLastSave](self, "modifiedPropertiesSinceLastSave");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if ((v13 & 1) == 0)
  {
    -[WFRecord fetchedProperties](self, "fetchedProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unionSet:", v16);

  }
  if (objc_msgSend(v15, "count"))
  {
    LODWORD(a4) = -[WFRecord saveProperties:toStorage:error:](self, "saveProperties:toStorage:error:", v15, v7, a4);
    if ((a4 & v13) == 1)
    {
      objc_msgSend(v15, "valueForKey:", CFSTR("name"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(a4) = 1;
      -[WFRecord resetModificationsForProperties:onlySinceLastSave:](self, "resetModificationsForProperties:onlySinceLastSave:", v17, 1);

    }
  }
  else
  {
    getWFDatabaseLogObject();
    a4 = (id *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)a4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v21 = "-[WFRecord saveChangesToStorage:error:]";
      v22 = 2112;
      v23 = self;
      _os_log_impl(&dword_1C15B3000, (os_log_t)a4, OS_LOG_TYPE_INFO, "%s Requested saving changes to storage, but looks like nothing changed — bailing out (%@)", buf, 0x16u);
    }

    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (BOOL)writeToStorage:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[WFRecord allProperties](self, "allProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[WFRecord saveProperties:toStorage:error:](self, "saveProperties:toStorage:error:", v7, v6, a4);

  return (char)a4;
}

- (id)description
{
  return -[WFRecord descriptionWithValues:](self, "descriptionWithValues:", 0);
}

- (id)debugDescription
{
  return -[WFRecord descriptionWithValues:](self, "descriptionWithValues:", 1);
}

- (id)descriptionWithValues:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, {\n"), v7, self);
  v8 = objc_claimAutoreleasedReturnValue();

  v26 = (void *)v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", v8);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[WFRecord allPropertiesByName](self, "allPropertiesByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingSelector:", sel_compare_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v12;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v16);
        objc_msgSend(v9, "appendString:", CFSTR("\t"));
        objc_msgSend(v9, "appendString:", v17);
        -[WFRecord fetchedPropertyNames](self, "fetchedPropertyNames");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "containsObject:", v17);

        if (v19)
          objc_msgSend(v9, "appendString:", CFSTR(" (f)"));
        -[WFRecord modifiedPropertyNames](self, "modifiedPropertyNames");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "containsObject:", v17);

        if (v21)
          objc_msgSend(v9, "appendString:", CFSTR(" (m)"));
        -[WFRecord modifiedPropertyNamesSinceLastSave](self, "modifiedPropertyNamesSinceLastSave");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "containsObject:", v17);

        if (v23)
          objc_msgSend(v9, "appendString:", CFSTR(" (u)"));
        if (v3)
        {
          -[WFRecord valueForKey:](self, "valueForKey:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendFormat:", CFSTR(" %@"), v24);

        }
        objc_msgSend(v9, "appendString:", CFSTR("\n"));
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }

  objc_msgSend(v9, "appendString:", CFSTR("}>"));
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  WFRecordPropertyMapping *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(v4, "initWithStorage:properties:settingDefaultValues:", 0, v5, 0);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[WFRecord allProperties](self, "allProperties", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1C3BB3598]();
        v14 = -[WFRecordPropertyMapping initWithSourceObject:property:destinationObject:property:]([WFRecordPropertyMapping alloc], "initWithSourceObject:property:destinationObject:property:", self, v12, v6, v12);
        -[WFRecordPropertyMapping propagate:](v14, "propagate:", 1);

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "modifiedPropertyNamesSinceLastSave");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecord modifiedPropertyNamesSinceLastSave](self, "modifiedPropertyNamesSinceLastSave");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSet:", v16);

  objc_msgSend(v6, "modifiedPropertyNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecord modifiedPropertyNames](self, "modifiedPropertyNames");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSet:", v18);

  objc_msgSend(v6, "lastFetchedValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecord lastFetchedValues](self, "lastFetchedValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setDictionary:", v20);

  objc_msgSend(v6, "lastSavedOrFetchedValues");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFRecord lastSavedOrFetchedValues](self, "lastSavedOrFetchedValues");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDictionary:", v22);

  -[WFRecord storageIdentifier](self, "storageIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStorageIdentifier:", v23);

  return v6;
}

- (void)markPropertyModifiedIfNecessary:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  id v22;

  v22 = a3;
  -[WFRecord fetchedPropertyNames](self, "fetchedPropertyNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v22);

  if ((v5 & 1) != 0)
  {
    -[WFRecord valueForKey:](self, "valueForKey:", v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFRecord lastSavedOrFetchedValues](self, "lastSavedOrFetchedValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFRecord lastFetchedValues](self, "lastFetchedValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v6;
    v12 = v8;
    v13 = v12;
    if (v11 == v12)
    {

    }
    else
    {
      if (!v11 || !v12)
      {

LABEL_11:
        -[WFRecord modifiedPropertyNamesSinceLastSave](self, "modifiedPropertyNamesSinceLastSave");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v22);
LABEL_12:

        v16 = v11;
        v18 = v10;
        v19 = v18;
        if (v16 == v18)
        {

        }
        else
        {
          if (!v16 || !v18)
          {

LABEL_20:
            -[WFRecord modifiedPropertyNames](self, "modifiedPropertyNames");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "addObject:", v22);
            goto LABEL_21;
          }
          v20 = objc_msgSend(v16, "isEqual:", v18);

          if ((v20 & 1) == 0)
            goto LABEL_20;
        }
        -[WFRecord modifiedPropertyNames](self, "modifiedPropertyNames");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObject:", v22);
LABEL_21:

        goto LABEL_22;
      }
      v14 = objc_msgSend(v11, "isEqual:", v12);

      if ((v14 & 1) == 0)
        goto LABEL_11;
    }
    -[WFRecord modifiedPropertyNamesSinceLastSave](self, "modifiedPropertyNamesSinceLastSave");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObject:", v22);
    goto LABEL_12;
  }
  -[WFRecord modifiedPropertyNamesSinceLastSave](self, "modifiedPropertyNamesSinceLastSave");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v22);

  -[WFRecord modifiedPropertyNames](self, "modifiedPropertyNames");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v22);
LABEL_22:

}

- (void)resetModificationsForProperties:(id)a3 onlySinceLastSave:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[WFRecord allProperties](self, "allProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", CFSTR("name"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[WFRecord modifiedPropertyNamesSinceLastSave](self, "modifiedPropertyNamesSinceLastSave");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minusSet:", v8);

  if (a4)
  {
    -[WFRecord lastSavedOrFetchedValues](self, "lastSavedOrFetchedValues");
  }
  else
  {
    -[WFRecord modifiedPropertyNames](self, "modifiedPropertyNames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "minusSet:", v8);

    -[WFRecord lastSavedOrFetchedValues](self, "lastSavedOrFetchedValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectsForKeys:", v13);

    -[WFRecord lastFetchedValues](self, "lastFetchedValues");
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectsForKeys:", v15);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[WFRecord valueForKey:](self, "valueForKey:", v21, (_QWORD)v25);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFRecord lastSavedOrFetchedValues](self, "lastSavedOrFetchedValues");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setValue:forKey:", v22, v21);

        if (!a4)
        {
          -[WFRecord lastFetchedValues](self, "lastFetchedValues");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setValue:forKey:", v22, v21);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }

}

- (BOOL)saveProperties:(id)a3 toStorage:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  WFRecord *v22;
  WFRecord *v23;
  void *v24;
  WFRecordPropertyMapping *v25;
  void *v26;
  objc_class *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  objc_class *v31;
  void *v32;
  id v34;
  id obj;
  void *v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  WFRecord *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v8 = objc_opt_class();
    +[WFRecord propertiesForClass:walkingSuperclassesUntilReaching:](WFRecord, "propertiesForClass:walkingSuperclassesUntilReaching:", v8, objc_opt_class());
    v9 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v38 = v9;
    v10 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "recordPropertyMap");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    v37 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v34 = v6;
    obj = v6;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v40 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v18 = (void *)MEMORY[0x1C3BB3598]();
          objc_msgSend(v17, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20;
          if (v20)
          {
            v22 = v20;
          }
          else
          {
            objc_msgSend(v17, "name");
            v22 = (WFRecord *)objc_claimAutoreleasedReturnValue();
          }
          v23 = v22;

          -[NSObject objectForKeyedSubscript:](v38, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v25 = -[WFRecordPropertyMapping initWithSourceObject:property:destinationObject:property:]([WFRecordPropertyMapping alloc], "initWithSourceObject:property:destinationObject:property:", self, v17, v10, v24);
            -[WFRecordPropertyMapping propagate](v25, "propagate");
            objc_msgSend(v24, "name");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "addObject:", v26);
          }
          else
          {
            getWFWFRecordLogObject();
            v25 = (WFRecordPropertyMapping *)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(&v25->super, OS_LOG_TYPE_INFO))
              goto LABEL_20;
            v27 = (objc_class *)objc_opt_class();
            NSStringFromClass(v27);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v44 = "-[WFRecord saveProperties:toStorage:error:]";
            v45 = 2114;
            v46 = v23;
            v47 = 2114;
            v48 = v26;
            _os_log_impl(&dword_1C15B3000, &v25->super, OS_LOG_TYPE_INFO, "%s Not saving property %{public}@ to storage, because storage %{public}@ doesn't have it.", buf, 0x20u);
          }

LABEL_20:
          objc_autoreleasePoolPop(v18);
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v14);
    }

    v7 = v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "didUpdateProperties:", v37);
    getWFWFRecordLogObject();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = objc_msgSend(obj, "count");
      -[WFRecord descriptionWithValues:](self, "descriptionWithValues:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v44 = "-[WFRecord saveProperties:toStorage:error:]";
      v45 = 2048;
      v46 = (WFRecord *)v29;
      v47 = 2114;
      v48 = v30;
      v49 = 2114;
      v50 = v32;
      _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_INFO, "%s Saved %lu properties on record %{public}@ to storage %{public}@", buf, 0x2Au);

    }
    v6 = v34;
    v12 = v38;
  }
  else
  {
    getWFDatabaseLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v44 = "-[WFRecord saveProperties:toStorage:error:]";
      v45 = 2112;
      v46 = self;
      _os_log_impl(&dword_1C15B3000, v12, OS_LOG_TYPE_INFO, "%s Requested saving a set of properties to storage, but the set is empty. Bailing (%@)", buf, 0x16u);
    }
  }

  return 1;
}

- (void)enumerateSettablePropertiesWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  const char *v14;
  objc_class *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSDictionary allValues](self->_allPropertiesByName, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1C3BB3598]();
        objc_msgSend(v10, "setter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v10, "setter");
          v13 = (NSString *)objc_claimAutoreleasedReturnValue();
          v14 = NSSelectorFromString(v13);

          v15 = (objc_class *)objc_opt_class();
          if (class_getInstanceMethod(v15, v14))
            v4[2](v4, v10);
        }
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (void)setupPropertyObservation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __36__WFRecord_setupPropertyObservation__block_invoke;
  v2[3] = &unk_1E7AEE438;
  v2[4] = self;
  -[WFRecord enumerateSettablePropertiesWithBlock:](self, "enumerateSettablePropertiesWithBlock:", v2);
}

- (void)tearDownPropertyObservation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __39__WFRecord_tearDownPropertyObservation__block_invoke;
  v2[3] = &unk_1E7AEE438;
  v2[4] = self;
  -[WFRecord enumerateSettablePropertiesWithBlock:](self, "enumerateSettablePropertiesWithBlock:", v2);
}

- (void)setDefaultPropertyValuesExceptFetched
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSDictionary allValues](self->_allPropertiesByName, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        -[WFRecord fetchedPropertyNames](self, "fetchedPropertyNames");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "containsObject:", v10);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v8, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "if_stringByUppercasingFirstCharacter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("default"), "stringByAppendingString:", v13);
          v14 = (NSString *)objc_claimAutoreleasedReturnValue();

          NSSelectorFromString(v14);
          objc_opt_class();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend((id)objc_opt_class(), "valueForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "name");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFRecord setValue:forKey:](self, "setValue:forKey:", v15, v16);

          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if ((void *)WFRecordPropertyObservationContext == a6)
  {
    -[WFRecord markPropertyModifiedIfNecessary:](self, "markPropertyModifiedIfNecessary:", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFRecord;
    -[WFRecord observeValueForKeyPath:ofObject:change:context:](&v6, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (NSDictionary)allPropertiesByName
{
  return self->_allPropertiesByName;
}

- (NSMutableSet)fetchedPropertyNames
{
  return self->_fetchedPropertyNames;
}

- (NSMutableSet)modifiedPropertyNames
{
  return self->_modifiedPropertyNames;
}

- (NSMutableDictionary)lastFetchedValues
{
  return self->_lastFetchedValues;
}

- (NSMutableSet)modifiedPropertyNamesSinceLastSave
{
  return self->_modifiedPropertyNamesSinceLastSave;
}

- (NSMutableDictionary)lastSavedOrFetchedValues
{
  return self->_lastSavedOrFetchedValues;
}

- (NSString)storageIdentifier
{
  return self->_storageIdentifier;
}

- (void)setStorageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageIdentifier, 0);
  objc_storeStrong((id *)&self->_lastSavedOrFetchedValues, 0);
  objc_storeStrong((id *)&self->_modifiedPropertyNamesSinceLastSave, 0);
  objc_storeStrong((id *)&self->_lastFetchedValues, 0);
  objc_storeStrong((id *)&self->_modifiedPropertyNames, 0);
  objc_storeStrong((id *)&self->_fetchedPropertyNames, 0);
  objc_storeStrong((id *)&self->_allPropertiesByName, 0);
}

void __39__WFRecord_tearDownPropertyObservation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:forKeyPath:context:", v2, v3, WFRecordPropertyObservationContext);

}

void __36__WFRecord_setupPropertyObservation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:forKeyPath:options:context:", v2, v3, 0, WFRecordPropertyObservationContext);

}

id __30__WFRecord_modifiedProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "allPropertiesByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__WFRecord_modifiedPropertiesSinceLastSave__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "allPropertiesByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __29__WFRecord_fetchedProperties__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "allPropertiesByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)defaultPropertyValues
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)ignoredPropertyNames
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("description"), CFSTR("debugDescription"), CFSTR("hash"), CFSTR("superclass"), CFSTR("wfName"), 0);
}

+ (id)recordSubclassProperties
{
  void *v3;

  if (recordSubclassProperties_onceToken != -1)
    dispatch_once(&recordSubclassProperties_onceToken, &__block_literal_global_158);
  objc_msgSend((id)recordSubclassProperties_cachedProperties, "objectForKey:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(a1, "propertiesForClass:walkingSuperclassesUntilReaching:", a1, objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)recordSubclassProperties_cachedProperties, "setObject:forKey:", v3, a1);
  }
  return v3;
}

+ (id)propertiesForClass:(Class)a3 walkingSuperclassesUntilReaching:(Class)a4
{
  void *v7;
  void *v8;
  void *v9;

  v7 = (void *)objc_opt_new();
  if ((-[objc_class isEqual:](a3, "isEqual:", a4) & 1) == 0)
  {
    do
    {
      if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", a4))
        break;
      v8 = (void *)MEMORY[0x1C3BB3598]();
      objc_msgSend(a1, "propertiesForClass:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addEntriesFromDictionary:", v9);

      a3 = (Class)-[objc_class superclass](a3, "superclass");
      objc_autoreleasePoolPop(v8);
    }
    while (!-[objc_class isEqual:](a3, "isEqual:", a4));
  }
  return v7;
}

+ (id)propertiesForClass:(Class)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  objc_property_t *v7;
  unint64_t i;
  void *v9;
  WFRecordProperty *v10;
  unsigned int outCount;

  v4 = (void *)objc_opt_new();
  +[WFRecord ignoredPropertyNames](WFRecord, "ignoredPropertyNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[objc_class ignoredPropertyNames](a3, "ignoredPropertyNames");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  outCount = 0;
  v7 = class_copyPropertyList(a3, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", property_getName(v7[i]));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "containsObject:", v9) & 1) == 0)
      {
        v10 = -[WFRecordProperty initWithName:property:]([WFRecordProperty alloc], "initWithName:property:", v9, v7[i]);
        if (v10)
          objc_msgSend(v4, "setObject:forKey:", v10, v9);

      }
    }
  }
  free(v7);

  return v4;
}

void __36__WFRecord_recordSubclassProperties__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)recordSubclassProperties_cachedProperties;
  recordSubclassProperties_cachedProperties = v0;

}

@end
