@implementation REMBaseSectionStorage

- (REMBaseSectionStorage)initWithObjectID:(id)a3 accountID:(id)a4 parentID:(id)a5 displayName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  REMBaseSectionStorage *v15;
  REMBaseSectionStorage *v16;
  REMResolutionTokenMap *v17;
  REMResolutionTokenMap *resolutionTokenMap;
  uint64_t v19;
  NSData *resolutionTokenMapData;
  NSDate *creationDate;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)REMBaseSectionStorage;
  v15 = -[REMBaseSectionStorage init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_objectID, a3);
    objc_storeStrong((id *)&v16->_accountID, a4);
    objc_storeStrong((id *)&v16->_parentID, a5);
    v17 = objc_alloc_init(REMResolutionTokenMap);
    resolutionTokenMap = v16->_resolutionTokenMap;
    v16->_resolutionTokenMap = v17;

    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v19 = objc_claimAutoreleasedReturnValue();
    resolutionTokenMapData = v16->_resolutionTokenMapData;
    v16->_resolutionTokenMapData = (NSData *)v19;

    objc_storeStrong((id *)&v16->_displayName, a6);
    creationDate = v16->_creationDate;
    v16->_creationDate = 0;

  }
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = objc_alloc((Class)objc_opt_class());
  -[REMBaseSectionStorage objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMBaseSectionStorage accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMBaseSectionStorage parentID](self, "parentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMBaseSectionStorage displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)objc_msgSend(v4, "initWithObjectID:accountID:parentID:displayName:", v5, v6, v7, v8);

  -[REMBaseSectionStorage creationDate](self, "creationDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCreationDate:", v10);

  v11 = -[REMResolutionTokenMap copy](self->_resolutionTokenMap, "copy");
  v12 = (void *)v9[10];
  v9[10] = v11;

  -[REMBaseSectionStorage resolutionTokenMapData](self, "resolutionTokenMapData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResolutionTokenMapData:", v13);

  v9[1] = self->_storeGeneration;
  v9[2] = self->_copyGeneration + 1;
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  REMBaseSectionStorage *v4;
  REMBaseSectionStorage *v5;
  REMBaseSectionStorage *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  REMResolutionTokenMap *resolutionTokenMap;
  REMResolutionTokenMap *v48;
  int v49;
  void *v50;
  __int16 v51;
  REMResolutionTokenMap *v52;
  __int16 v53;
  REMResolutionTokenMap *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = (REMBaseSectionStorage *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMBaseSectionStorage objectID](self, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMBaseSectionStorage objectID](v6, "objectID");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[REMBaseSectionStorage objectID](self, "objectID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMBaseSectionStorage objectID](v6, "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqual:", v11);

        if (!v12)
          goto LABEL_22;
      }
      -[REMBaseSectionStorage accountID](self, "accountID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMBaseSectionStorage accountID](v6, "accountID");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        -[REMBaseSectionStorage accountID](self, "accountID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMBaseSectionStorage accountID](v6, "accountID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v17, "isEqual:", v18);

        if (!v19)
          goto LABEL_22;
      }
      -[REMBaseSectionStorage parentID](self, "parentID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMBaseSectionStorage parentID](v6, "parentID");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        -[REMBaseSectionStorage parentID](self, "parentID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMBaseSectionStorage parentID](v6, "parentID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "isEqual:", v24);

        if (!v25)
          goto LABEL_22;
      }
      -[REMBaseSectionStorage displayName](self, "displayName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMBaseSectionStorage displayName](v6, "displayName");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[REMBaseSectionStorage displayName](self, "displayName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMBaseSectionStorage displayName](v6, "displayName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_22;
      }
      -[REMBaseSectionStorage creationDate](self, "creationDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMBaseSectionStorage creationDate](v6, "creationDate");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[REMBaseSectionStorage creationDate](self, "creationDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMBaseSectionStorage creationDate](v6, "creationDate");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqual:", v36);

        if (!v37)
          goto LABEL_22;
      }
      if (!self->_resolutionTokenMap || v6->_resolutionTokenMap)
      {
        +[REMLogStore read](REMLogStore, "read");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v45 = (objc_class *)objc_opt_class();
          NSStringFromClass(v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          resolutionTokenMap = self->_resolutionTokenMap;
          v48 = v6->_resolutionTokenMap;
          v49 = 138543874;
          v50 = v46;
          v51 = 2112;
          v52 = resolutionTokenMap;
          v53 = 2112;
          v54 = v48;
          _os_log_error_impl(&dword_1B4A39000, v39, OS_LOG_TYPE_ERROR, "You are about to trigger decoding the resolution token map from JSON data. This is probably not what you want for performance to trigger it from -isEqual:, unless you are running Tests then it's fine {class: %{public}@, self-map: %@, other-map: %@}", (uint8_t *)&v49, 0x20u);

        }
      }
      -[REMBaseSectionStorage resolutionTokenMap](self, "resolutionTokenMap");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMBaseSectionStorage resolutionTokenMap](v6, "resolutionTokenMap");
      v41 = objc_claimAutoreleasedReturnValue();
      if (v40 == (void *)v41)
      {
        v13 = 1;
        v42 = v40;
      }
      else
      {
        v42 = (void *)v41;
        -[REMBaseSectionStorage resolutionTokenMap](self, "resolutionTokenMap");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMBaseSectionStorage resolutionTokenMap](v6, "resolutionTokenMap");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v43, "isEqual:", v44);

      }
      goto LABEL_23;
    }
LABEL_22:
    v13 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v13 = 1;
LABEL_24:

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMBaseSectionStorage objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMBaseSectionStorage objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMBaseSectionStorage displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMBaseSectionStorage objectID](self, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ %@ [%ld.%ld]>"), v4, self, v5, v6, self->_storeGeneration, self->_copyGeneration);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)storeGeneration
{
  return self->_storeGeneration;
}

- (void)setStoreGenerationIfNeeded:(unint64_t)a3
{
  if (!self->_storeGeneration)
    self->_storeGeneration = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMBaseSectionStorage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v12;
  REMBaseSectionStorage *v13;
  REMBaseSectionStorage *v14;
  void *v15;
  void *v16;
  void *v17;
  NSData *resolutionTokenMapData;
  REMResolutionTokenMap *resolutionTokenMap;
  NSData *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
    v10 = v6 == 0;
  else
    v10 = 1;
  if (v10 || v8 == 0)
  {
    +[REMLogStore read](REMLogStore, "read");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v23 = 138544131;
      v24 = v5;
      v25 = 2114;
      v26 = v6;
      v27 = 2114;
      v28 = v7;
      v29 = 2117;
      v30 = v9;
      _os_log_fault_impl(&dword_1B4A39000, v12, OS_LOG_TYPE_FAULT, "Attempted to decode REMBaseSectionStorage missing objectID, accountID, displayName {objectID: %{public}@, accountID:%{public}@ parentID:%{public}@ displayName: %{sensitive}@}", (uint8_t *)&v23, 0x2Au);
    }

    v13 = 0;
  }
  else
  {
    v14 = -[REMBaseSectionStorage initWithObjectID:accountID:parentID:displayName:](self, "initWithObjectID:accountID:parentID:displayName:", v5, v6, v7, v8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionTokenMapData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolutionTokenMap"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v14->_resolutionTokenMap, v16);
      resolutionTokenMapData = v14->_resolutionTokenMapData;
      v14->_resolutionTokenMapData = 0;
    }
    else
    {
      resolutionTokenMap = v14->_resolutionTokenMap;
      v14->_resolutionTokenMap = 0;

      v20 = v15;
      resolutionTokenMapData = v14->_resolutionTokenMapData;
      v14->_resolutionTokenMapData = v20;
    }

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMBaseSectionStorage setCreationDate:](v14, "setCreationDate:", v21);

    self = v14;
    v13 = self;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  REMResolutionTokenMap *resolutionTokenMap;
  void *v10;
  id v11;

  v11 = a3;
  -[REMBaseSectionStorage objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("objectID"));

  -[REMBaseSectionStorage accountID](self, "accountID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("accountID"));

  -[REMBaseSectionStorage parentID](self, "parentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("parentID"));

  -[REMBaseSectionStorage displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("displayName"));

  -[REMBaseSectionStorage creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("creationDate"));

  resolutionTokenMap = self->_resolutionTokenMap;
  if (resolutionTokenMap)
  {
    objc_msgSend(v11, "encodeObject:forKey:", resolutionTokenMap, CFSTR("resolutionTokenMap"));
    objc_msgSend(v11, "encodeObject:forKey:", 0, CFSTR("resolutionTokenMapData"));
  }
  else
  {
    objc_msgSend(v11, "encodeObject:forKey:", 0, CFSTR("resolutionTokenMap"));
    -[REMBaseSectionStorage resolutionTokenMapData](self, "resolutionTokenMapData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("resolutionTokenMapData"));

  }
}

+ (id)newObjectID
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectIDWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "cdEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSString)cdEntityName
{
  objc_class *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v8;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromClass((Class)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    +[REMLogStore read](REMLogStore, "read");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      +[REMBaseSectionStorage cdEntityName].cold.1();

  }
  return (NSString *)CFSTR("REMCDBaseSection");
}

- (BOOL)isUnsupported
{
  return rem_isUnsupportedVersionByRuntime(-[REMBaseSectionStorage effectiveMinimumSupportedVersion](self, "effectiveMinimumSupportedVersion"));
}

- (id)cdKeyToStorageKeyMap
{
  objc_class *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  char v6;
  NSObject *v8;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    +[REMLogStore read](REMLogStore, "read");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[REMBaseSectionStorage cdKeyToStorageKeyMap].cold.1();

  }
  return (id)MEMORY[0x1E0C9AA70];
}

- (REMResolutionTokenMap)resolutionTokenMap
{
  REMResolutionTokenMap **p_resolutionTokenMap;
  REMResolutionTokenMap *v4;
  REMResolutionTokenMap *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;

  p_resolutionTokenMap = &self->_resolutionTokenMap;
  v4 = self->_resolutionTokenMap;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[REMBaseSectionStorage resolutionTokenMapData](self, "resolutionTokenMapData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      +[REMLogStore read](REMLogStore, "read");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[REMBaseSectionStorage resolutionTokenMap].cold.1((uint64_t)self, v7);

    }
    -[REMBaseSectionStorage cdKeyToStorageKeyMap](self, "cdKeyToStorageKeyMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[REMResolutionTokenMap resolutionTokenMapWithJSONData:keyMap:](REMResolutionTokenMap, "resolutionTokenMapWithJSONData:keyMap:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)p_resolutionTokenMap, v9);
    v5 = v9;

  }
  return v5;
}

- (int64_t)minimumSupportedVersion
{
  return self->minimumSupportedVersion;
}

- (void)setMinimumSupportedVersion:(int64_t)a3
{
  self->minimumSupportedVersion = a3;
}

- (int64_t)effectiveMinimumSupportedVersion
{
  return self->effectiveMinimumSupportedVersion;
}

- (void)setEffectiveMinimumSupportedVersion:(int64_t)a3
{
  self->effectiveMinimumSupportedVersion = a3;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_storeStrong((id *)&self->_accountID, a3);
}

- (REMObjectID)parentID
{
  return self->_parentID;
}

- (void)setParentID:(id)a3
{
  objc_storeStrong((id *)&self->_parentID, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (void)setResolutionTokenMap:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionTokenMap, a3);
}

- (NSData)resolutionTokenMapData
{
  return self->_resolutionTokenMapData;
}

- (void)setResolutionTokenMapData:(id)a3
{
  objc_storeStrong((id *)&self->_resolutionTokenMapData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionTokenMapData, 0);
  objc_storeStrong((id *)&self->_resolutionTokenMap, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_parentID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

+ (void)cdEntityName
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSectionStorage class]) isEqualToString:NSStringFromClass(self)]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage cdEntityName]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)cdKeyToStorageKeyMap
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0(&dword_1B4A39000, v1, v2, "rem_log_fault_if (![NSStringFromClass([REMBaseSectionStorage class]) isEqualToString:NSStringFromClass([self class])]) -- A subclass of REMBaseSectionStorage called '- [REMBaseSectionStorage cdKeyToStorageKeyMap]'. The subclass should override this method. {callstack: %@}", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2_2();
}

- (void)resolutionTokenMap
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "Nil resolutionTokenMapData when reading resolutionTokenMap from account storage. Initialize an empty map {list: %@}", (uint8_t *)&v2, 0xCu);
}

@end
