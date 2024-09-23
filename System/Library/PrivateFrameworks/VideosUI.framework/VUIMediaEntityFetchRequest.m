@implementation VUIMediaEntityFetchRequest

- (id)copyWithZone:(_NSZone *)a3
{
  VUIMediaEntityFetchRequest *v4;
  void *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSPredicate *predicate;
  uint64_t v10;
  NSArray *sortDescriptors;
  uint64_t v12;
  NSSet *properties;
  uint64_t v14;
  NSDictionary *options;
  uint64_t v16;
  NSString *groupingKeyPath;
  uint64_t v18;
  id groupingSortComparator;

  v4 = -[VUIMediaEntityFetchRequest initWithMediaEntityTypes:]([VUIMediaEntityFetchRequest alloc], "initWithMediaEntityTypes:", self->_mediaEntityTypes);
  -[VUIMediaEntityFetchRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  identifier = v4->_identifier;
  v4->_identifier = (NSString *)v6;

  v8 = -[NSPredicate copy](self->_predicate, "copy");
  predicate = v4->_predicate;
  v4->_predicate = (NSPredicate *)v8;

  v10 = -[NSArray copy](self->_sortDescriptors, "copy");
  sortDescriptors = v4->_sortDescriptors;
  v4->_sortDescriptors = (NSArray *)v10;

  v12 = -[NSSet copy](self->_properties, "copy");
  properties = v4->_properties;
  v4->_properties = (NSSet *)v12;

  v14 = -[NSDictionary copy](self->_options, "copy");
  options = v4->_options;
  v4->_options = (NSDictionary *)v14;

  v4->_range = self->_range;
  v16 = -[NSString copy](self->_groupingKeyPath, "copy");
  groupingKeyPath = v4->_groupingKeyPath;
  v4->_groupingKeyPath = (NSString *)v16;

  v18 = objc_msgSend(self->_groupingSortComparator, "copy");
  groupingSortComparator = v4->_groupingSortComparator;
  v4->_groupingSortComparator = (id)v18;

  return v4;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)_didUpdateRequestProperties
{
  -[VUIMediaEntityFetchRequest setIdentifier:](self, "setIdentifier:", 0);
}

- (void)addIsLocalOrHasExpiredDownloadPredicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_isLocalPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NIL AND %K == NO AND %K == NO"), CFSTR("downloadExpirationDate"), CFSTR("markedAsDeleted"), CFSTR("isLocal"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  v8[0] = v3;
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_predicateWithSubpredicates:compoundPredicateType:", v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIMediaEntityFetchRequest _addPredicate:](self, "_addPredicate:", v7);
}

- (void)_addPredicate:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v8 = objc_alloc_init(v4);
  objc_msgSend(v8, "addObject:", v5);

  -[VUIMediaEntityFetchRequest predicate](self, "predicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v8, "addObject:", v6);
  objc_msgSend((id)objc_opt_class(), "_predicateWithSubpredicates:compoundPredicateType:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setPredicate:](self, "setPredicate:", v7);

}

+ (id)_predicateWithSubpredicates:(id)a3 compoundPredicateType:(unint64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "vui_predicateWithSubpredicates:type:", a3, a4);
}

- (void)setSortDescriptors:(id)a3
{
  NSArray *v4;
  NSArray *sortDescriptors;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  sortDescriptors = self->_sortDescriptors;
  self->_sortDescriptors = v4;

  -[VUIMediaEntityFetchRequest _didUpdateRequestProperties](self, "_didUpdateRequestProperties");
}

- (void)setProperties:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSSet *v7;
  NSSet *properties;
  id v9;

  v9 = a3;
  v4 = v9;
  if ((VUIMediaEntityFetchRequestIsAllPropertiesSet(v9) & 1) == 0)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E20]);
    VUIMediaEntityFetchRequestRequiredProperties();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v5, "initWithSet:", v6);

    if (v9)
      objc_msgSend(v4, "unionSet:", v9);

  }
  v7 = (NSSet *)objc_msgSend(v4, "copy");
  properties = self->_properties;
  self->_properties = v7;

  -[VUIMediaEntityFetchRequest _didUpdateRequestProperties](self, "_didUpdateRequestProperties");
}

- (void)setPredicate:(id)a3
{
  NSPredicate *v4;
  NSPredicate *predicate;

  v4 = (NSPredicate *)objc_msgSend(a3, "copy");
  predicate = self->_predicate;
  self->_predicate = v4;

  -[VUIMediaEntityFetchRequest _didUpdateRequestProperties](self, "_didUpdateRequestProperties");
}

- (void)setGroupingKeyPath:(id)a3
{
  NSString *v4;
  NSString *groupingKeyPath;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  groupingKeyPath = self->_groupingKeyPath;
  self->_groupingKeyPath = v4;

  -[VUIMediaEntityFetchRequest _didUpdateRequestProperties](self, "_didUpdateRequestProperties");
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (VUIMediaEntityFetchRequest)initWithMediaEntityTypes:(id)a3
{
  id v4;
  VUIMediaEntityFetchRequest *v5;
  uint64_t v6;
  NSSet *mediaEntityTypes;
  void *v8;
  uint64_t v9;
  NSSet *properties;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIMediaEntityFetchRequest;
  v5 = -[VUIMediaEntityFetchRequest init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    mediaEntityTypes = v5->_mediaEntityTypes;
    v5->_mediaEntityTypes = (NSSet *)v6;

    VUIMediaEntityFetchRequestRequiredProperties();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    properties = v5->_properties;
    v5->_properties = (NSSet *)v9;

  }
  return v5;
}

+ (id)_isLocalPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "vui_equalPredicateWithKeyPath:value:", CFSTR("isLocal"), MEMORY[0x1E0C9AAB0]);
}

- (void)addRecentlyAddedSortDescriptorWithLimit:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  -[VUIMediaEntityFetchRequest mediaEntityTypes](self, "mediaEntityTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "subtype");

  if (v8 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "_addedToDateSortDescriptor");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!v8)
  {
    objc_msgSend((id)objc_opt_class(), "_addedDateSortDescriptor");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (id)v9;
    goto LABEL_7;
  }
  v12 = 0;
LABEL_7:
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v12, 0);
  -[VUIMediaEntityFetchRequest sortDescriptors](self, "sortDescriptors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v10, "addObjectsFromArray:", v11);
  -[VUIMediaEntityFetchRequest setSortDescriptors:](self, "setSortDescriptors:", v10);
  -[VUIMediaEntityFetchRequest setRange:](self, "setRange:", 0, a3);

}

- (void)addHDRColorCapabilityOr4KResolutionPredicate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)objc_opt_class(), "_anyHDRColorCapabilityPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v3);
  objc_msgSend((id)objc_opt_class(), "_any4KResolutionPredicate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);
  objc_msgSend((id)objc_opt_class(), "_predicateWithSubpredicates:compoundPredicateType:", v6, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest _addPredicate:](self, "_addPredicate:", v5);

}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
  -[VUIMediaEntityFetchRequest _didUpdateRequestProperties](self, "_didUpdateRequestProperties");
}

- (void)setOptions:(id)a3
{
  NSDictionary *v4;
  NSDictionary *options;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  options = self->_options;
  self->_options = v4;

  -[VUIMediaEntityFetchRequest _didUpdateRequestProperties](self, "_didUpdateRequestProperties");
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSSet)properties
{
  return self->_properties;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSSet)mediaEntityTypes
{
  return self->_mediaEntityTypes;
}

- (VUIMediaEntityFetchRequest)initWithMediaEntityType:(id)a3
{
  void *v4;
  VUIMediaEntityFetchRequest *v5;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VUIMediaEntityFetchRequest initWithMediaEntityTypes:](self, "initWithMediaEntityTypes:", v4);

  return v5;
}

- (NSString)identifier
{
  NSString *identifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  identifier = self->_identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_identifier;
    self->_identifier = v5;

    identifier = self->_identifier;
  }
  return identifier;
}

- (id)groupingSortComparator
{
  return self->_groupingSortComparator;
}

- (NSString)groupingKeyPath
{
  return self->_groupingKeyPath;
}

- (id)_sortIndexPropertyKeyWithMediaEntityKind:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (-[VUIMediaEntityFetchRequest _shouldGenerateSortIndexes](self, "_shouldGenerateSortIndexes"))
  {
    -[VUIMediaEntityFetchRequest sortDescriptors](self, "sortDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "propertyDescriptorForName:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "propertyType") == 4)
      {
        objc_msgSend(v9, "sortAsName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(v9, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_shouldGenerateSortIndexes
{
  void *v2;
  char v3;

  -[VUIMediaEntityFetchRequest options](self, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "vui_BOOLForKey:defaultValue:", CFSTR("IncludeSortIndexes"), 0);

  return v3;
}

- (BOOL)_shouldGenerateGroupingSortIndexes
{
  void *v3;
  void *v4;
  char v5;

  -[VUIMediaEntityFetchRequest groupingKeyPath](self, "groupingKeyPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[VUIMediaEntityFetchRequest options](self, "options");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("IncludeGroupingSortIndexes"), 0);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_manualSortDescriptorsWithMediaEntityKind:(id)a3 propertiesRequiredForSort:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v19;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[VUIMediaEntityFetchRequest sortDescriptors](self, "sortDescriptors");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    v19 = *MEMORY[0x1E0C99778];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sortingPropertyDescriptorForName:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v19, CFSTR("Unknown key for sort descriptor! %@"), v12);
        objc_msgSend(v13, "name");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", v14, objc_msgSend(v11, "ascending"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);
        objc_msgSend(v5, "addObject:", v15);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }
  if (a4)
    *a4 = objc_retainAutorelease(v6);
  objc_msgSend((id)objc_opt_class(), "_finalizedSortDescriptorsFromSortDescriptors:mediaEntityKind:", v5, v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_groupingSortComparator, 0);
  objc_storeStrong((id *)&self->_groupingKeyPath, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_mediaEntityTypes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)homeVideosFetchRequest
{
  void *v3;
  void *v4;

  +[VUIMediaEntityType homeVideo](VUIMediaEntityType, "homeVideo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_minimalPropertiesFetchRequestWithType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_titleSortDescriptor
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("title"), 1);
}

+ (id)_resolutionPredicateWithResolution:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "vui_equalPredicateWithKeyPath:value:", CFSTR("resolution"), a3);
}

+ (id)_minimalShowsPropertiesFetchRequest
{
  void *v3;
  void *v4;
  void *v5;

  +[VUIMediaEntityType show](VUIMediaEntityType, "show");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_minimalPropertiesFetchRequestWithType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  VUIMediaEntityFetchRequestMinimalShowPropertiesSet();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperties:", v5);

  return v4;
}

+ (id)_minimalPropertiesFetchRequestWithType:(id)a3
{
  id v4;
  VUIMediaEntityFetchRequest *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[VUIMediaEntityFetchRequest initWithMediaEntityType:]([VUIMediaEntityFetchRequest alloc], "initWithMediaEntityType:", v4);

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "_includeSortIndexesOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setOptions:](v5, "setOptions:", v7);

  objc_msgSend(a1, "_predicateWithSubpredicates:compoundPredicateType:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setPredicate:](v5, "setPredicate:", v8);
  objc_msgSend(a1, "_titleSortDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setSortDescriptors:](v5, "setSortDescriptors:", v10);

  VUIMediaEntityFetchRequestMinimalPropertiesSet();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setProperties:](v5, "setProperties:", v11);

  return v5;
}

+ (id)_minimalMoviesPropertiesFetchRequest
{
  void *v3;
  void *v4;
  void *v5;

  +[VUIMediaEntityType movie](VUIMediaEntityType, "movie");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_minimalPropertiesFetchRequestWithType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  VUIMediaEntityFetchRequestMinimalMoviesPropertiesSet();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperties:", v5);

  return v4;
}

+ (id)_minimalMovieRentalsPropertiesFetchRequest
{
  void *v3;
  void *v4;
  void *v5;

  +[VUIMediaEntityType movieRental](VUIMediaEntityType, "movieRental");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_minimalPropertiesFetchRequestWithType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  VUIMediaEntityFetchRequestMinimalMovieRentalsPropertiesSet();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProperties:", v5);

  return v4;
}

+ (id)_includeSortIndexesOptions
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("IncludeSortIndexes");
  v4[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_anyHDRColorCapabilityPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "vui_keyPathBitTestPredicateWithKeyPath:value:", CFSTR("colorCapability"), &unk_1EA0B9358);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "vui_keyPathBitTestPredicateWithKeyPath:value:", CFSTR("HLSColorCapability"), &unk_1EA0B9358);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  v8[0] = v2;
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_predicateWithSubpredicates:compoundPredicateType:", v5, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_any4KResolutionPredicate
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)objc_opt_class(), "_resolutionPredicateWithResolution:", &unk_1EA0B9358);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);
  objc_msgSend((id)objc_opt_class(), "_HLSResolutionPredicateWithResolution:", &unk_1EA0B9358);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);
  objc_msgSend((id)objc_opt_class(), "_predicateWithSubpredicates:compoundPredicateType:", v2, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_addedToDateSortDescriptor
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedToDate"), 0);
}

+ (id)_addedDateSortDescriptor
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 0);
}

+ (id)_HLSResolutionPredicateWithResolution:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "vui_equalPredicateWithKeyPath:value:", CFSTR("HLSResolution"), a3);
}

+ (id)_finalizedSortDescriptorsFromSortDescriptors:(id)a3 mediaEntityKind:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  else
    v8 = 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(a1, "_finalizedSortDescriptorFromSortDescriptor:mediaEntityKind:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v7, (_QWORD)v16);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

+ (id)_finalizedSortDescriptorFromSortDescriptor:(id)a3 mediaEntityKind:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_6;
  objc_msgSend(v6, "propertyDescriptorForName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "propertyType") != 4)
  {

LABEL_6:
    v9 = v5;
    goto LABEL_7;
  }
  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6A78]), "initWithKey:ascending:", v7, objc_msgSend(v5, "ascending"));

  if (!v9)
    goto LABEL_6;
LABEL_7:

  return v9;
}

+ (VUIMediaEntityFetchRequest)mediaEntityFetchRequestWithIdentifier:(id)a3
{
  id v4;
  id v5;
  VUIMediaEntityFetchRequest *v6;
  void *v7;
  VUIMediaEntityFetchRequest *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1F028F8E0))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The identifier parameter must conform to VUIMediaEntityIdentifierInternal"));
    v5 = 0;
  }
  v6 = [VUIMediaEntityFetchRequest alloc];
  objc_msgSend(v5, "mediaEntityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VUIMediaEntityFetchRequest initWithMediaEntityType:](v6, "initWithMediaEntityType:", v7);

  objc_msgSend(a1, "_identifierPredicateWithIdentifier:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setPredicate:](v8, "setPredicate:", v9);
  VUIMediaEntityFetchRequestAllPropertiesSet();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setProperties:](v8, "setProperties:", v10);

  return v8;
}

+ (id)seasonsFetchRequest
{
  return (id)objc_msgSend(a1, "_seasonsFetchRequestWithShowIdentifier:", 0);
}

+ (id)episodesFetchRequest
{
  return (id)objc_msgSend(a1, "_episodesFetchRequestWithSeasonIdentifier:showIdentifier:", 0, 0);
}

+ (id)episodesFetchRequestWithSeasonIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "_episodesFetchRequestWithSeasonIdentifier:showIdentifier:", a3, 0);
}

+ (id)episodesGroupedBySeasonIdentifierFetchRequestWithShowIdentifier:(id)a3
{
  return (id)objc_msgSend(a1, "_episodesFetchRequestWithSeasonIdentifier:showIdentifier:", 0, a3);
}

- (void)addSortIndexesOption
{
  void *v3;
  id v4;

  -[VUIMediaEntityFetchRequest options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IncludeSortIndexes"));
  -[VUIMediaEntityFetchRequest setOptions:](self, "setOptions:", v4);

}

- (void)addGroupingSortIndexesOption
{
  void *v3;
  id v4;

  -[VUIMediaEntityFetchRequest options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("IncludeGroupingSortIndexes"));
  -[VUIMediaEntityFetchRequest setOptions:](self, "setOptions:", v4);

}

- (void)addHasItemsOption
{
  void *v3;
  id v4;
  id v5;
  id v6;

  -[VUIMediaEntityFetchRequest options](self, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "mutableCopy");

  v4 = v5;
  if (!v5)
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = v4;
  objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("CheckHasItems"));
  -[VUIMediaEntityFetchRequest setOptions:](self, "setOptions:", v6);

}

- (void)addHDRColorCapabilityPredicate
{
  id v3;

  objc_msgSend((id)objc_opt_class(), "_anyHDRColorCapabilityPredicate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest _addPredicate:](self, "_addPredicate:", v3);

}

- (void)add4KResolutionPredicate
{
  id v3;

  objc_msgSend((id)objc_opt_class(), "_any4KResolutionPredicate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest _addPredicate:](self, "_addPredicate:", v3);

}

- (void)addIsLocalPredicate
{
  id v3;

  objc_msgSend((id)objc_opt_class(), "_isLocalPredicate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest _addPredicate:](self, "_addPredicate:", v3);

}

- (void)addDownloadStatePredicateForStates:(unint64_t)a3
{
  id v5;
  void *v6;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = v5;
  if ((a3 & 1) != 0)
  {
    v36 = v5;
    v7 = (uint64_t *)MEMORY[0x1E0DAF9D0];
    if (!sDownloadManager)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0DAF4E0]);
      v9 = *MEMORY[0x1E0DAF868];
      v48[0] = *MEMORY[0x1E0DAF828];
      v48[1] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDownloadKinds:", v10);

      objc_msgSend(v8, "setShouldFilterExternalOriginatedDownloads:", 0);
      v47 = *v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPrefetchedDownloadProperties:", v11);

      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DAF4C8]), "initWithManagerOptions:", v8);
      v13 = (void *)sDownloadManager;
      sDownloadManager = v12;

    }
    v35 = a3;
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend((id)sDownloadManager, "downloads");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v42;
      v19 = *v7;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v42 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v20), "valueForProperty:", v19, v35);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v14, "addObject:", v21);

          ++v20;
        }
        while (v17 != v20);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v17);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    +[VUIDownloadManager sharedInstance](VUIDownloadManager, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "downloads");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v38;
      v27 = *MEMORY[0x1E0DB1CB8];
      do
      {
        v28 = 0;
        do
        {
          if (*(_QWORD *)v38 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v28), "mediaItem", v35);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "mediaItemMetadataForProperty:", v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v30, "longLongValue"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "addObject:", v31);

          }
          ++v28;
        }
        while (v25 != v28);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v25);
    }

    objc_msgSend((id)objc_opt_class(), "_isInPredicateWithAdamId:", v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v36;
    objc_msgSend(v36, "addObject:", v32);

    LOBYTE(a3) = v35;
  }
  if ((a3 & 2) != 0)
  {
    objc_msgSend((id)objc_opt_class(), "_isLocalPredicate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v33);

  }
  objc_msgSend((id)objc_opt_class(), "_predicateWithSubpredicates:compoundPredicateType:", v6, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest _addPredicate:](self, "_addPredicate:", v34);

}

- (void)addAdamIdPredicate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_isEqualPredicateWithAdamId:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIMediaEntityFetchRequest _addPredicate:](self, "_addPredicate:", v5);
}

- (void)addAdamIdsPredicate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_isInPredicateWithAdamId:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIMediaEntityFetchRequest _addPredicate:](self, "_addPredicate:", v5);
}

+ (id)_seasonsFetchRequestWithShowIdentifier:(id)a3
{
  id v4;
  VUIMediaEntityFetchRequest *v5;
  void *v6;
  VUIMediaEntityFetchRequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [VUIMediaEntityFetchRequest alloc];
  +[VUIMediaEntityType season](VUIMediaEntityType, "season");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VUIMediaEntityFetchRequest initWithMediaEntityType:](v5, "initWithMediaEntityType:", v6);

  if (v4)
  {
    objc_msgSend(a1, "_showIdentifierPredicateWithIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntityFetchRequest setPredicate:](v7, "setPredicate:", v8);

  }
  objc_msgSend(a1, "_includeSortIndexesOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setOptions:](v7, "setOptions:", v9);

  objc_msgSend(a1, "_titleSortDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_seasonNumberSortDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setSortDescriptors:](v7, "setSortDescriptors:", v12);
  VUIMediaEntityFetchRequestAllPropertiesSet();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setProperties:](v7, "setProperties:", v13);

  return v7;
}

+ (id)_seasonsFetchRequestWithSeasonIdentifier:(id)a3
{
  id v4;
  VUIMediaEntityFetchRequest *v5;
  void *v6;
  VUIMediaEntityFetchRequest *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = [VUIMediaEntityFetchRequest alloc];
  +[VUIMediaEntityType season](VUIMediaEntityType, "season");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[VUIMediaEntityFetchRequest initWithMediaEntityType:](v5, "initWithMediaEntityType:", v6);

  if (v4)
  {
    objc_msgSend(a1, "_identifierPredicateWithIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntityFetchRequest setPredicate:](v7, "setPredicate:", v8);

  }
  VUIMediaEntityFetchRequestAllPropertiesSet();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setProperties:](v7, "setProperties:", v9);

  return v7;
}

+ (id)_episodesFetchRequestWithSeasonIdentifier:(id)a3 showIdentifier:(id)a4
{
  id v6;
  id v7;
  VUIMediaEntityFetchRequest *v8;
  void *v9;
  VUIMediaEntityFetchRequest *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[3];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = [VUIMediaEntityFetchRequest alloc];
  +[VUIMediaEntityType episode](VUIMediaEntityType, "episode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VUIMediaEntityFetchRequest initWithMediaEntityType:](v8, "initWithMediaEntityType:", v9);

  objc_msgSend(a1, "_titleSortDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  VUIMediaEntityFetchRequestMinimalEpisodePropertiesSet();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = v7;
  if (v6)
  {
    objc_msgSend(a1, "_seasonIdentifierPredicateWithIdentifier:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);
    objc_msgSend(a1, "_episodeNumberSortDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v15;
    v29[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v7)
    {
      objc_msgSend(a1, "_showIdentifierPredicateWithIdentifier:", v7);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v25);
      objc_msgSend(a1, "_episodeNumberSortDescriptor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_fractionalEpisodeNumberSortDescriptor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v23;
      v28[1] = v24;
      v28[2] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("seasonIdentifier");
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("seasonTitle"), CFSTR("seasonIdentifier"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v20, "unionSet:", v12);
      objc_msgSend(v20, "unionSet:", v19);

      v18 = &__block_literal_global_35;
      v12 = v20;
      goto LABEL_6;
    }
    v27 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = 0;
  v18 = 0;
LABEL_6:
  -[VUIMediaEntityFetchRequest setSortDescriptors:](v10, "setSortDescriptors:", v16);
  -[VUIMediaEntityFetchRequest setGroupingKeyPath:](v10, "setGroupingKeyPath:", v17);
  -[VUIMediaEntityFetchRequest setGroupingSortComparator:](v10, "setGroupingSortComparator:", v18);
  -[VUIMediaEntityFetchRequest setProperties:](v10, "setProperties:", v12);
  objc_msgSend(a1, "_predicateWithSubpredicates:compoundPredicateType:", v13, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaEntityFetchRequest setPredicate:](v10, "setPredicate:", v21);

  return v10;
}

uint64_t __96__VUIMediaEntityFetchRequest_Factory___episodesFetchRequestWithSeasonIdentifier_showIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t (**v15)(_QWORD, _QWORD, _QWORD);

  v4 = a3;
  objc_msgSend(a2, "mediaEntities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "mediaEntities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "seasonNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "seasonNumber");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10)
  {
    v12 = objc_msgSend(v9, "compare:", v10);
    if (!v12)
    {
      objc_msgSend(v6, "seasonTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "seasonTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC6A68], "titleSortComparatorWithAscending:", 1);
      v15 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v12 = ((uint64_t (**)(_QWORD, void *, void *))v15)[2](v15, v13, v14);

    }
  }
  else if (v9)
  {
    v12 = 1;
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

+ (id)_identifierPredicateWithIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "vui_equalPredicateWithKeyPath:value:", CFSTR("identifier"), a3);
}

+ (id)_showIdentifierPredicateWithIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "vui_equalPredicateWithKeyPath:value:", CFSTR("showIdentifier"), a3);
}

+ (id)_seasonIdentifierPredicateWithIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "vui_equalPredicateWithKeyPath:value:", CFSTR("seasonIdentifier"), a3);
}

+ (id)_isEqualPredicateWithAdamId:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "vui_equalPredicateWithKeyPath:value:", CFSTR("storeID"), a3);
}

+ (id)_isInPredicateWithAdamId:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "vui_inPredicateWithKeyPath:value:", CFSTR("storeID"), a3);
}

+ (id)_releaseYearSortDescriptor
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("releaseYear"), 1);
}

+ (id)_releaseDateSortDescriptor
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("releaseDate"), 0);
}

+ (id)_seasonNumberSortDescriptor
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("seasonNumber"), 1);
}

+ (id)_showTitleSortDescriptor
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("showTitle"), 1);
}

+ (id)_episodeNumberSortDescriptor
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("episodeNumber"), 1);
}

+ (id)_fractionalEpisodeNumberSortDescriptor
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("fractionalEpisodeNumber"), 1);
}

- (VUIMediaEntityFetchRequest)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (void)setGroupingSortComparator:(id)a3
{
  void *v4;
  id groupingSortComparator;

  v4 = (void *)objc_msgSend(a3, "copy");
  groupingSortComparator = self->_groupingSortComparator;
  self->_groupingSortComparator = v4;

  -[VUIMediaEntityFetchRequest _didUpdateRequestProperties](self, "_didUpdateRequestProperties");
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v40;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40.receiver = self;
  v40.super_class = (Class)VUIMediaEntityFetchRequest;
  -[VUIMediaEntityFetchRequest description](&v40, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchRequest identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchRequest mediaEntityTypes](self, "mediaEntityTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("mediaEntityTypes"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchRequest predicate](self, "predicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("predicate"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchRequest sortDescriptors](self, "sortDescriptors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("sortDescriptors"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchRequest properties](self, "properties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("properties"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v19);

  v20 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[VUIMediaEntityFetchRequest range](self, "range"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[VUIMediaEntityFetchRequest range](self, "range");
  objc_msgSend(v22, "numberWithUnsignedInteger:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@,%@"), v21, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("range"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  v27 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchRequest groupingKeyPath](self, "groupingKeyPath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("groupingKeyPath"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v29);

  v30 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchRequest groupingSortComparator](self, "groupingSortComparator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("groupingSortComparator"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v32);

  v33 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchRequest options](self, "options");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("options"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v35);

  v36 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("<%@>"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VUIMediaEntityFetchRequest identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VUIMediaEntityFetchRequest *v4;
  VUIMediaEntityFetchRequest *v5;
  VUIMediaEntityFetchRequest *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v4 = (VUIMediaEntityFetchRequest *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[VUIMediaEntityFetchRequest identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntityFetchRequest identifier](v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
      v12 = 1;
    }
    else
    {
      v12 = 0;
      if (v9 && v10)
        v12 = objc_msgSend(v9, "isEqual:", v10);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_isItemsFetch
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[VUIMediaEntityFetchRequest mediaEntityTypes](self, "mediaEntityTypes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "subtype"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_isCollectionsFetch
{
  return !-[VUIMediaEntityFetchRequest _isItemsFetch](self, "_isItemsFetch");
}

- (BOOL)_isShowsFetch
{
  void *v2;
  void *v3;
  char v4;

  -[VUIMediaEntityFetchRequest mediaEntityTypes](self, "mediaEntityTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType show](VUIMediaEntityType, "show");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)_isSeasonsFetch
{
  void *v2;
  void *v3;
  char v4;

  -[VUIMediaEntityFetchRequest mediaEntityTypes](self, "mediaEntityTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[VUIMediaEntityType season](VUIMediaEntityType, "season");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)setMediaEntityTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
