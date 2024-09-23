@implementation SYBacklinkFilterCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_activityTypes, 0);
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *activityTypes;
  id v5;

  activityTypes = self->_activityTypes;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", activityTypes, CFSTR("types"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_data, CFSTR("data"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYBacklinkFilterCache)initWithCoder:(id)a3
{
  id v4;
  SYBacklinkFilterCache *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *activityTypes;
  uint64_t v11;
  NSData *data;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SYBacklinkFilterCache;
  v5 = -[SYBacklinkFilterCache init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("types"));
    v9 = objc_claimAutoreleasedReturnValue();
    activityTypes = v5->_activityTypes;
    v5->_activityTypes = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("data"));
    v11 = objc_claimAutoreleasedReturnValue();
    data = v5->_data;
    v5->_data = (NSData *)v11;

  }
  return v5;
}

- (SYBacklinkFilterCache)initWithActivityTypes:(id)a3
{
  id v4;
  SYBacklinkFilterCache *v5;
  uint64_t v6;
  NSArray *activityTypes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SYBacklinkFilterCache;
  v5 = -[SYBacklinkFilterCache init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    activityTypes = v5->_activityTypes;
    v5->_activityTypes = (NSArray *)v6;

  }
  return v5;
}

- (void)finalize
{
  void *v3;
  NSMutableArray *entries;
  NSData *v5;
  NSData *data;
  _QWORD v7[5];

  if (-[NSMutableArray count](self->_entries, "count"))
  {
    -[NSMutableArray sortUsingComparator:](self->_entries, "sortUsingComparator:", &__block_literal_global_10);
    v3 = malloc_type_malloc(2 * -[NSMutableArray count](self->_entries, "count"), 0x6A1E12A5uLL);
    entries = self->_entries;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__SYBacklinkFilterCache_finalize__block_invoke_2;
    v7[3] = &__block_descriptor_40_e25_v32__0__NSNumber_8Q16_B24l;
    v7[4] = v3;
    -[NSMutableArray enumerateObjectsUsingBlock:](entries, "enumerateObjectsUsingBlock:", v7);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v3, 2 * -[NSMutableArray count](self->_entries, "count"), 1);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  data = self->_data;
  self->_data = v5;

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSMutableArray isEqualToArray:](self->_entries, "isEqualToArray:", v4[2]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  void *data;

  data = self->_data;
  if (!data)
    data = self->_entries;
  return objc_msgSend(data, "hash");
}

- (void)addEntriesForItem:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *entries;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableArray *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;

  v4 = a3;
  v29 = v4;
  if (!self->_entries)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 150);
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    entries = self->_entries;
    self->_entries = v5;

    v4 = v29;
  }
  objc_msgSend(v4, "persistentIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_entries;
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v29, "persistentIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "hash"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v8, "addObject:", v11);

  }
  objc_msgSend(v29, "targetContentIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = self->_entries;
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v29, "targetContentIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "hash"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v13, "addObject:", v16);

  }
  objc_msgSend(v29, "canonicalURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = self->_entries;
    v19 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v29, "canonicalURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_lp_simplifiedURLStringForFuzzyMatching");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v21, "hash"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v18, "addObject:", v22);

  }
  objc_msgSend(v29, "webpageURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = self->_entries;
    v25 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v29, "webpageURL");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_lp_simplifiedURLStringForFuzzyMatching");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v27, "hash"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v24, "addObject:", v28);

  }
}

uint64_t __33__SYBacklinkFilterCache_finalize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unsigned int v5;
  unsigned int v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "unsignedShortValue");
  v6 = objc_msgSend(v4, "unsignedShortValue");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

uint64_t __33__SYBacklinkFilterCache_finalize__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "unsignedShortValue");
  *(_WORD *)(*(_QWORD *)(a1 + 32) + 2 * a3) = result;
  return result;
}

- (BOOL)containsMatchingEntriesForItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  unsigned __int16 v12;
  void *v13;
  void *v14;
  unsigned __int16 v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int16 v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int16 v23;
  BOOL v24;

  v4 = a3;
  v5 = os_log_create("com.apple.synapse", "SYBacklinkFilterCache");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SYBacklinkFilterCache containsMatchingEntriesForItem:].cold.1((uint64_t)v4, v5);

  -[SYBacklinkFilterCache activityTypes](self, "activityTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "containsObject:", v7);

  if (!v8)
    goto LABEL_13;
  v9 = -[NSData length](self->_data, "length") >> 1;
  objc_msgSend(v4, "persistentIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "persistentIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hash");

    if (-[NSData _sy_containsUnsignedShort:inRange:](self->_data, "_sy_containsUnsignedShort:inRange:", v12, 0, v9))
      goto LABEL_12;
  }
  objc_msgSend(v4, "targetContentIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "targetContentIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "hash");

    if (-[NSData _sy_containsUnsignedShort:inRange:](self->_data, "_sy_containsUnsignedShort:inRange:", v15, 0, v9))
      goto LABEL_12;
  }
  objc_msgSend(v4, "canonicalURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "canonicalURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_lp_simplifiedURLStringForFuzzyMatching");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hash");

    if (-[NSData _sy_containsUnsignedShort:inRange:](self->_data, "_sy_containsUnsignedShort:inRange:", v19, 0, v9))
      goto LABEL_12;
  }
  objc_msgSend(v4, "webpageURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
    goto LABEL_13;
  objc_msgSend(v4, "webpageURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_lp_simplifiedURLStringForFuzzyMatching");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "hash");

  if (-[NSData _sy_containsUnsignedShort:inRange:](self->_data, "_sy_containsUnsignedShort:inRange:", v23, 0, v9))
LABEL_12:
    v24 = 1;
  else
LABEL_13:
    v24 = 0;

  return v24;
}

- (NSArray)activityTypes
{
  return self->_activityTypes;
}

- (void)setActivityTypes:(id)a3
{
  objc_storeStrong((id *)&self->_activityTypes, a3);
}

- (NSMutableArray)entries
{
  return self->_entries;
}

- (void)setEntries:(id)a3
{
  objc_storeStrong((id *)&self->_entries, a3);
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void)containsMatchingEntriesForItem:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1BCC38000, a2, OS_LOG_TYPE_DEBUG, "containsMatchingEntriesForItem: %@", (uint8_t *)&v2, 0xCu);
}

@end
