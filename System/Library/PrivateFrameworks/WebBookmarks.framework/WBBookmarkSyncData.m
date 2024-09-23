@implementation WBBookmarkSyncData

- (id)generationForKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_generations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = objc_alloc_init(MEMORY[0x24BE830D0]);
  v6 = v5;

  return v6;
}

- (int64_t)state
{
  return self->_state;
}

- (CKShare)shareRecord
{
  return (CKShare *)(id)-[CKShare copy](self->_shareRecord, "copy");
}

- (WBSCRDTPosition)position
{
  return self->_position;
}

- (int64_t)minimumAPIVersion
{
  return self->_minimumAPIVersion;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)syncDataWithContentsOfData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x212BD4AC8]();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v3, 0);
    objc_msgSend(v5, "setClass:forClassName:", objc_opt_class(), CFSTR("CloudBookmarkSyncData"));
    objc_msgSend(v5, "setClass:forClassName:", objc_opt_class(), CFSTR("CloudBookmarkGeneration"));
    objc_msgSend(v5, "setClass:forClassName:", objc_opt_class(), CFSTR("CloudBookmarkPosition"));
    objc_msgSend(v5, "setClass:forClassName:", objc_opt_class(), CFSTR("CloudBookmarkPositionSortValue"));
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD0E88]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishDecoding");

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (WBBookmarkSyncData)initWithCoder:(id)a3
{
  id v4;
  WBBookmarkSyncData *v5;
  id v6;
  void *v7;
  uint64_t v8;
  CKRecord *record;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableDictionary *generations;
  uint64_t v16;
  WBSCRDTPosition *position;
  uint64_t v18;
  CKRecordID *parentRecordID;
  uint64_t v20;
  CKShare *shareRecord;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSMutableDictionary *v30;
  NSMutableDictionary *auxiliaryRecords;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSDictionary *extraPositionData;
  NSDictionary *v37;
  WBBookmarkSyncData *v38;
  objc_super v40;
  _QWORD v41[4];
  _QWORD v42[4];

  v42[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)WBBookmarkSyncData;
  v5 = -[WBBookmarkSyncData init](&v40, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDB91D8]);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EncodedCKRecordSystemFields"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "safari_initWithEncodedRecordData:", v7);
    record = v5->_record;
    v5->_record = (CKRecord *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v42[0] = objc_opt_class();
    v42[1] = objc_opt_class();
    v42[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("Generations"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "mutableCopy");
    generations = v5->_generations;
    v5->_generations = (NSMutableDictionary *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Position"));
    v16 = objc_claimAutoreleasedReturnValue();
    position = v5->_position;
    v5->_position = (WBSCRDTPosition *)v16;

    v5->_minimumAPIVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("MinimumAPIVersion"));
    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Deleted"));
    v5->_modifiedAttributeMask = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ModifiedAttributeMask"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ParentRecordID"));
    v18 = objc_claimAutoreleasedReturnValue();
    parentRecordID = v5->_parentRecordID;
    v5->_parentRecordID = (CKRecordID *)v18;

    v5->_isDeletingRecordZone = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsDeletedRecordZone"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ShareRecord"));
    v20 = objc_claimAutoreleasedReturnValue();
    shareRecord = v5->_shareRecord;
    v5->_shareRecord = (CKShare *)v20;

    v22 = (void *)MEMORY[0x24BDBCF20];
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, v24, v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("AuxiliaryRecords"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");
    v29 = v28;
    if (v28)
    {
      v30 = v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v30 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    }
    auxiliaryRecords = v5->_auxiliaryRecords;
    v5->_auxiliaryRecords = v30;

    v32 = (void *)MEMORY[0x24BDBCF20];
    v41[0] = objc_opt_class();
    v41[1] = objc_opt_class();
    v41[2] = objc_opt_class();
    v41[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithArray:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("ExtraPositionData"));
    v35 = objc_claimAutoreleasedReturnValue();
    extraPositionData = v5->_extraPositionData;
    v5->_extraPositionData = (NSDictionary *)v35;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v37 = v5->_extraPositionData;
      v5->_extraPositionData = (NSDictionary *)MEMORY[0x24BDBD1B8];

    }
    v38 = v5;

  }
  return v5;
}

+ (id)positionFromContentsOfData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)MEMORY[0x212BD4AC8]();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v4, 0);
    v7 = objc_opt_class();
    NSStringFromClass((Class)a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClass:forClassName:", v7, v8);

    objc_msgSend(v6, "setClass:forClassName:", objc_opt_class(), CFSTR("CloudBookmarkPosition"));
    objc_msgSend(v6, "setClass:forClassName:", objc_opt_class(), CFSTR("CloudBookmarkPositionSortValue"));
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD0E88]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "position");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSData)encodedBookmarkSyncData
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeObject:forKey:", self, *MEMORY[0x24BDD0E88]);
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (WBBookmarkSyncData)init
{
  WBBookmarkSyncData *v2;
  uint64_t v3;
  NSMutableDictionary *generations;
  uint64_t v5;
  NSMutableDictionary *auxiliaryRecords;
  NSDictionary *extraPositionData;
  WBBookmarkSyncData *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WBBookmarkSyncData;
  v2 = -[WBBookmarkSyncData init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    generations = v2->_generations;
    v2->_generations = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    auxiliaryRecords = v2->_auxiliaryRecords;
    v2->_auxiliaryRecords = (NSMutableDictionary *)v5;

    extraPositionData = v2->_extraPositionData;
    v2->_extraPositionData = (NSDictionary *)MEMORY[0x24BDBD1B8];

    v8 = v2;
  }

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  int64_t state;
  unint64_t modifiedAttributeMask;
  void *v8;
  id v9;

  v9 = a3;
  -[CKRecord safari_encodedSystemFieldsData](self->_record, "safari_encodedSystemFieldsData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("EncodedCKRecordSystemFields"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_generations, CFSTR("Generations"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_position, CFSTR("Position"));
  objc_msgSend(v9, "encodeInteger:forKey:", self->_minimumAPIVersion, CFSTR("MinimumAPIVersion"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_extraPositionData, CFSTR("ExtraPositionData"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_parentRecordID, CFSTR("ParentRecordID"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_shareRecord, CFSTR("ShareRecord"));
  objc_msgSend(v9, "encodeBool:forKey:", self->_isDeletingRecordZone, CFSTR("IsDeletedRecordZone"));
  if (-[NSMutableDictionary count](self->_auxiliaryRecords, "count"))
  {
    -[NSMutableDictionary safari_mapAndFilterKeysAndObjectsUsingBlock:](self->_auxiliaryRecords, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_103);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("AuxiliaryRecords"));

  }
  state = self->_state;
  if (state)
    objc_msgSend(v9, "encodeInteger:forKey:", state, CFSTR("Deleted"));
  modifiedAttributeMask = self->_modifiedAttributeMask;
  v8 = v9;
  if (modifiedAttributeMask)
  {
    objc_msgSend(v9, "encodeInteger:forKey:", modifiedAttributeMask, CFSTR("ModifiedAttributeMask"));
    v8 = v9;
  }

}

id __38__WBBookmarkSyncData_encodeWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_class();
  -[WBBookmarkSyncData encodedBookmarkSyncData](self, "encodedBookmarkSyncData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncDataWithContentsOfData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKRecord)record
{
  return (CKRecord *)(id)-[CKRecord copy](self->_record, "copy");
}

- (NSDictionary)positionDictionaryRepresentation
{
  void *v3;
  WBSCRDTPosition *position;
  void *v5;

  v3 = (void *)-[NSDictionary mutableCopy](self->_extraPositionData, "mutableCopy");
  position = self->_position;
  if (position)
  {
    -[WBSCRDTPosition dictionaryRepresentation](position, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("default"));

  }
  return (NSDictionary *)v3;
}

- (void)setPositionDictionaryRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  WBSCRDTPosition *v9;
  WBSCRDTPosition *position;
  id v11;

  v4 = a3;
  v11 = (id)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v11, "removeObjectForKey:", CFSTR("default"));
  v5 = objc_msgSend(v11, "copy");
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = (void *)MEMORY[0x24BDBD1B8];
  objc_storeStrong((id *)&self->_extraPositionData, v7);

  objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("default"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (WBSCRDTPosition *)objc_msgSend(objc_alloc(MEMORY[0x24BE830D8]), "initWithDictionaryRepresentation:", v8);
    position = self->_position;
    self->_position = v9;
  }
  else
  {
    position = self->_position;
    self->_position = 0;
  }

}

- (void)clearAllCKRecords
{
  CKRecord *record;
  CKShare *shareRecord;
  NSMutableDictionary *v5;
  NSMutableDictionary *auxiliaryRecords;

  record = self->_record;
  self->_record = 0;

  shareRecord = self->_shareRecord;
  self->_shareRecord = 0;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  auxiliaryRecords = self->_auxiliaryRecords;
  self->_auxiliaryRecords = v5;

}

- (NSArray)auxiliaryRecordIDs
{
  void *v2;
  void *v3;

  -[NSMutableDictionary allValues](self->_auxiliaryRecords, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &__block_literal_global_105);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __40__WBBookmarkSyncData_auxiliaryRecordIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

- (id)auxiliaryRecordForKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_auxiliaryRecords, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)setAuxiliaryRecord:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_auxiliaryRecords, "setObject:forKeyedSubscript:", v7, v6);

}

- (BOOL)hasGenerationForKey:(id)a3
{
  void *v3;
  char v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_generations, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  return v4;
}

- (void)setGeneration:(id)a3 forKey:(id)a4
{
  id v6;
  int v7;
  NSMutableDictionary *generations;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = objc_msgSend(v9, "isValid");
  generations = self->_generations;
  if (v7)
    -[NSMutableDictionary setObject:forKeyedSubscript:](generations, "setObject:forKeyedSubscript:", v9, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](generations, "removeObjectForKey:", v6);

}

- (void)incrementGenerationForKey:(id)a3 withDeviceIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[WBBookmarkSyncData generationForKey:](self, "generationForKey:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "incrementedGenerationWithDeviceIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_generations, "setObject:forKeyedSubscript:", v8, v7);
}

- (void)clearAllGenerationsExceptState
{
  uint64_t v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *generations;
  id v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_generations, "objectForKeyedSubscript:", CFSTR("Deleted"));
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v3;
  if (v3)
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v3, CFSTR("Deleted"));
  else
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  generations = self->_generations;
  self->_generations = v4;

}

- (void)enumerateGenerationsUsingBlock:(id)a3
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_generations, "enumerateKeysAndObjectsUsingBlock:", a3);
}

- (void)setRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setPosition:(id)a3
{
  objc_storeStrong((id *)&self->_position, a3);
}

- (void)setMinimumAPIVersion:(int64_t)a3
{
  self->_minimumAPIVersion = a3;
}

- (unint64_t)modifiedAttributeMask
{
  return self->_modifiedAttributeMask;
}

- (void)setModifiedAttributeMask:(unint64_t)a3
{
  self->_modifiedAttributeMask = a3;
}

- (CKRecordID)parentRecordID
{
  return self->_parentRecordID;
}

- (void)setParentRecordID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)hasRecordExpired
{
  return self->_hasRecordExpired;
}

- (void)setHasRecordExpired:(BOOL)a3
{
  self->_hasRecordExpired = a3;
}

- (void)setShareRecord:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isDeletingRecordZone
{
  return self->_isDeletingRecordZone;
}

- (void)setIsDeletingRecordZone:(BOOL)a3
{
  self->_isDeletingRecordZone = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareRecord, 0);
  objc_storeStrong((id *)&self->_parentRecordID, 0);
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_extraPositionData, 0);
  objc_storeStrong((id *)&self->_auxiliaryRecords, 0);
  objc_storeStrong((id *)&self->_generations, 0);
}

+ (void)positionFromContentsOfData:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_211022000, a2, a3, "Failed to decode _WBBookmarkSyncDataForPositionDecoding with exception: %{public}@", (uint8_t *)a2);

}

+ (void)syncDataWithContentsOfData:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_211022000, a2, a3, "Failed to decode WBBookmarkSyncData with exception: %{public}@", (uint8_t *)a2);

}

@end
