@implementation PKCatalog

- (NSMutableArray)groups
{
  NSMutableArray *groups;
  NSMutableArray *v4;
  NSMutableArray *v5;

  groups = self->_groups;
  if (!groups)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_groups;
    self->_groups = v4;

    groups = self->_groups;
  }
  return groups;
}

- (id)allGroupIDs
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSMutableArray count](self->_groups, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_groups;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "groupID", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *groups;
  id v5;

  groups = self->_groups;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", groups, CFSTR("groups"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

- (PKCatalog)initWithCoder:(id)a3
{
  id v4;
  PKCatalog *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *groups;
  uint64_t v12;
  NSDate *timestamp;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKCatalog;
  v5 = -[PKCatalog init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x19400CFE8]();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("groups"));
    v10 = objc_claimAutoreleasedReturnValue();
    groups = v5->_groups;
    v5->_groups = (NSMutableArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v12 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v12;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (PKCatalog)init
{
  PKCatalog *v2;
  uint64_t v3;
  NSDate *timestamp;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKCatalog;
  v2 = -[PKCatalog init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    timestamp = v2->_timestamp;
    v2->_timestamp = (NSDate *)v3;

  }
  return v2;
}

+ (id)catalogWithContentsOfURL:(id)a3 nonUbiquitousCatalogURL:(id)a4
{
  return (id)objc_msgSend(a1, "catalogWithContentsOfURL:nonUbiquitousCatalogURL:directoryCoordinator:", a3, a4, 0);
}

+ (id)catalogWithContentsOfURL:(id)a3 nonUbiquitousCatalogURL:(id)a4 directoryCoordinator:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  _QWORD aBlock[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__67;
  v34 = __Block_byref_object_dispose__67;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__67;
  v28 = __Block_byref_object_dispose__67;
  v10 = MEMORY[0x1E0C809B0];
  v29 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PKCatalog_catalogWithContentsOfURL_nonUbiquitousCatalogURL_directoryCoordinator___block_invoke;
  aBlock[3] = &unk_1E2AD8618;
  v22 = &v30;
  v11 = v7;
  v20 = v11;
  v23 = &v24;
  v12 = v8;
  v21 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  v14 = v13;
  if (v9)
  {
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __83__PKCatalog_catalogWithContentsOfURL_nonUbiquitousCatalogURL_directoryCoordinator___block_invoke_2;
    v17[3] = &unk_1E2AD3AE8;
    v18 = v13;
    objc_msgSend(v9, "performCoordinatedAction:", v17);

  }
  else
  {
    v13[2](v13);
  }
  _CatalogFromDictionaries((void *)v31[5], (void *)v25[5]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __83__PKCatalog_catalogWithContentsOfURL_nonUbiquitousCatalogURL_directoryCoordinator___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", a1[4]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", a1[5]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __83__PKCatalog_catalogWithContentsOfURL_nonUbiquitousCatalogURL_directoryCoordinator___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)writeToURL:(id)a3 nonUbiquitousCatalogURL:(id)a4 atomically:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  _DictionaryFromCatalogForUbiquity(self, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  _DictionaryFromCatalogForUbiquity(self, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "writeToURL:atomically:", v9, v5);

  objc_msgSend(v10, "writeToURL:atomically:", v8, v5);
}

- (BOOL)isEquivalentToCatalog:(id)a3
{
  id *v4;
  unint64_t v5;
  BOOL v6;
  unint64_t i;
  void *v8;
  void *v9;
  char v10;

  v4 = (id *)a3;
  v5 = -[NSMutableArray count](self->_groups, "count");
  if (v5 == objc_msgSend(v4[1], "count"))
  {
    if (v5)
    {
      v6 = 0;
      for (i = 0; i != v5; v6 = i >= v5)
      {
        -[NSMutableArray objectAtIndex:](self->_groups, "objectAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4[1], "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToGroup:", v9);

        if ((v10 & 1) == 0)
          break;
        ++i;
      }
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isNewerThanCatalog:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;

  v4 = a3;
  -[PKCatalog timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  LOBYTE(v4) = v7 > 0.0;

  return (char)v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) Groups: %@"), self->_timestamp, self->_groups);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKCatalog *v5;
  uint64_t v6;
  NSDate *timestamp;
  uint64_t v8;
  NSMutableArray *groups;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableArray *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = -[PKCatalog init](+[PKCatalog allocWithZone:](PKCatalog, "allocWithZone:"), "init");
  v6 = -[NSDate copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v6;

  if (self->_groups)
  {
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", a3), "initWithCapacity:", -[NSMutableArray count](self->_groups, "count"));
    groups = v5->_groups;
    v5->_groups = (NSMutableArray *)v8;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = self->_groups;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = v5->_groups;
          v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v18);
          -[NSMutableArray addObject:](v15, "addObject:", v16);

          ++v14;
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  return v5;
}

- (void)shuffle:(int)a3
{
  void *v5;
  uint32_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[PKCatalog groups](self, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (a3 >= 1)
  {
    do
    {
      v7 = arc4random_uniform(v6);
      v8 = arc4random_uniform(v6);
      -[PKCatalog groups](self, "groups");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[PKCatalog groups](self, "groups");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeObjectAtIndex:", v7);

      -[PKCatalog groups](self, "groups");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "insertObject:atIndex:", v10, v8);

      --a3;
    }
    while (a3);
  }
}

- (PKCatalog)initWithCloudStoreCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  PKCatalog *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("PassCatalog"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "encryptedValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("manifest"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C99E60]);
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v8, "initWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v12, v7, &v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    if (v14)
    {
      PKLogFacilityTypeGetObject(9uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v14;
        _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Error trying to read contact PKCatalog manifest data from CloudKit. %{public}@", buf, 0xCu);
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        _CatalogFromDictionaries(v13, 0);
        v16 = (PKCatalog *)objc_claimAutoreleasedReturnValue();
LABEL_10:

        goto LABEL_11;
      }
    }
    v16 = 0;
    goto LABEL_10;
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  objc_msgSend(a3, "recordsWithRecordType:", CFSTR("PassCatalog"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _DictionaryFromCatalogForUbiquity(self, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "encryptedValues");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v8, CFSTR("manifest"));
  }
  else
  {
    PKLogFacilityTypeGetObject(9uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Cannot set data for Catalog record because it is nil.", v10, 2u);
    }
  }

}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "recordNamePrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, CFSTR("manifest"), CFSTR("PassCatalog"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)primaryIdentifier
{
  return CFSTR("manifest");
}

- (unint64_t)itemType
{
  return 3;
}

+ (id)recordNamePrefix
{
  return CFSTR("catalog-");
}

+ (id)catalogWithLocalCatalog:(id)a3 ubiquitousCatalog:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  _DictionaryFromCatalogForUbiquity(a4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _DictionaryFromCatalogForUbiquity(v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _CatalogFromDictionaries(v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setGroups:(id)a3
{
  objc_storeStrong((id *)&self->_groups, a3);
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

@end
