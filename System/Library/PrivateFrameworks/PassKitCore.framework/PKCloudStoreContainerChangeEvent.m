@implementation PKCloudStoreContainerChangeEvent

- (PKCloudStoreContainerChangeEvent)initWithChangeType:(unint64_t)a3 beginUniqueIdentifier:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  PKCloudStoreContainerChangeEvent *v11;
  PKCloudStoreContainerChangeEvent *v12;
  uint64_t v13;
  NSString *errorDescription;
  uint64_t v15;
  NSDate *timestamp;
  void *v17;
  uint64_t v18;
  NSString *identifier;
  objc_super v21;

  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKCloudStoreContainerChangeEvent;
  v11 = -[PKCloudStoreContainerChangeEvent init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_changeType = a3;
    objc_storeStrong((id *)&v11->_beginIntervalEventIdentifier, a4);
    objc_msgSend(v10, "debugDescription");
    v13 = objc_claimAutoreleasedReturnValue();
    errorDescription = v12->_errorDescription;
    v12->_errorDescription = (NSString *)v13;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = objc_claimAutoreleasedReturnValue();
    timestamp = v12->_timestamp;
    v12->_timestamp = (NSDate *)v15;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = objc_claimAutoreleasedReturnValue();
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v18;

  }
  return v12;
}

- (PKCloudStoreContainerChangeEvent)initWithEventType:(unint64_t)a3 changeType:(unint64_t)a4 containerIdentifier:(id)a5 beginUniqueIdentifier:(id)a6 stateName:(id)a7 objectNames:(id)a8 error:(id)a9 changeToken:(id)a10 operationGroupName:(id)a11 operationGroupNameSuffix:(id)a12
{
  id v18;
  PKCloudStoreContainerChangeEvent *v19;
  PKCloudStoreContainerChangeEvent *v20;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v27 = a5;
  v26 = a7;
  v25 = a8;
  v24 = a10;
  v23 = a11;
  v18 = a12;
  v19 = -[PKCloudStoreContainerChangeEvent initWithChangeType:beginUniqueIdentifier:error:](self, "initWithChangeType:beginUniqueIdentifier:error:", a4, a6, a9);
  v20 = v19;
  if (v19)
  {
    v19->_eventType = a3;
    objc_storeStrong((id *)&v19->_containerIdentifier, a5);
    objc_storeStrong((id *)&v20->_stateName, a7);
    objc_storeStrong((id *)&v20->_objectNames, a8);
    objc_storeStrong((id *)&v20->_changeToken, a10);
    objc_storeStrong((id *)&v20->_operationGroupName, a11);
    objc_storeStrong((id *)&v20->_operationGroupNameSuffix, a12);
  }

  return v20;
}

+ (id)signpostEventWithType:(unint64_t)a3 containerIdentifier:(id)a4 stateName:(id)a5 objectNames:(id)a6 error:(id)a7 changeToken:(id)a8 operationGroupName:(id)a9 operationGroupNameSuffix:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PKCloudStoreContainerChangeEvent *v23;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = -[PKCloudStoreContainerChangeEvent initWithEventType:changeType:containerIdentifier:beginUniqueIdentifier:stateName:objectNames:error:changeToken:operationGroupName:operationGroupNameSuffix:]([PKCloudStoreContainerChangeEvent alloc], "initWithEventType:changeType:containerIdentifier:beginUniqueIdentifier:stateName:objectNames:error:changeToken:operationGroupName:operationGroupNameSuffix:", a3, 1, v22, 0, v21, v20, v19, v18, v17, v16);

  return v23;
}

+ (id)intervalBeginEventWithType:(unint64_t)a3 containerIdentifier:(id)a4 stateName:(id)a5 objectNames:(id)a6 error:(id)a7 changeToken:(id)a8 operationGroupName:(id)a9 operationGroupNameSuffix:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  PKCloudStoreContainerChangeEvent *v23;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = -[PKCloudStoreContainerChangeEvent initWithEventType:changeType:containerIdentifier:beginUniqueIdentifier:stateName:objectNames:error:changeToken:operationGroupName:operationGroupNameSuffix:]([PKCloudStoreContainerChangeEvent alloc], "initWithEventType:changeType:containerIdentifier:beginUniqueIdentifier:stateName:objectNames:error:changeToken:operationGroupName:operationGroupNameSuffix:", a3, 2, v22, 0, v21, v20, v19, v18, v17, v16);

  return v23;
}

+ (id)intervalEndEventWithBeginUniqueIdentifier:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  PKCloudStoreContainerChangeEvent *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PKCloudStoreContainerChangeEvent initWithChangeType:beginUniqueIdentifier:error:]([PKCloudStoreContainerChangeEvent alloc], "initWithChangeType:beginUniqueIdentifier:error:", 2, v6, v5);

  return v7;
}

- (id)dictionaryRepresentation
{
  id v3;
  unint64_t changeType;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("identifier"));
  changeType = self->_changeType;
  v5 = CFSTR("unknown");
  if (changeType == 1)
    v5 = CFSTR("signpost");
  if (changeType == 2)
    v6 = CFSTR("interval");
  else
    v6 = v5;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("changeType"));
  PKCloudStoreContainerChangeEventTypeToString(self->_eventType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("eventType"));

  -[NSDate description](self->_timestamp, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("timestamp"));

  if (-[NSString length](self->_containerIdentifier, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_containerIdentifier, CFSTR("containerIdentifier"));
  if (-[NSString length](self->_beginIntervalEventIdentifier, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_beginIntervalEventIdentifier, CFSTR("beginIntervalEventIdentifier"));
  if (objc_msgSend(CFSTR("operationGroupName"), "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_operationGroupName, CFSTR("operationGroupName"));
  if (-[NSString length](self->_operationGroupNameSuffix, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_operationGroupNameSuffix, CFSTR("operationGroupNameSuffix"));
  if (-[NSString length](self->_stateName, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_stateName, CFSTR("stateName"));
  if (-[NSString length](self->_errorDescription, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_errorDescription, CFSTR("errorDescription"));
  if (-[NSData length](self->_changeToken, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSData hash](self->_changeToken, "hash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("changeToken"));

  }
  if (-[NSArray count](self->_objectNames, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_objectNames, CFSTR("objectNames"));
  if (self->_timeInterval != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("timeInterval"));

  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

+ (id)csvStringForEvents:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  void *v24;
  _QWORD v25[14];

  v25[13] = *MEMORY[0x1E0C80C00];
  v25[0] = CFSTR("identifier");
  v25[1] = CFSTR("changeType");
  v25[2] = CFSTR("eventType");
  v25[3] = CFSTR("containerIdentifier");
  v25[4] = CFSTR("beginIntervalEventIdentifier");
  v25[5] = CFSTR("operationGroupName");
  v25[6] = CFSTR("operationGroupNameSuffix");
  v25[7] = CFSTR("timestamp");
  v25[8] = CFSTR("errorDescription");
  v25[9] = CFSTR("changeToken");
  v25[10] = CFSTR("stateName");
  v25[11] = CFSTR("objectNames");
  v25[12] = CFSTR("timeInterval");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v25, 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "appendString:", CFSTR("\n"));
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        +[PKCloudStoreContainerChangeEvent _csvSafeStringForEvent:](PKCloudStoreContainerChangeEvent, "_csvSafeStringForEvent:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15), (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v16);

        objc_msgSend(v7, "appendString:", CFSTR("\n"));
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_msgSend(v7, "copy");
  return v17;
}

+ (id)writeCSVFileForEvents:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("cloudStoreContainerChangeHistory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSince1970");
  objc_msgSend(v9, "stringWithFormat:", CFSTR("changeHistory-%ld.csv"), (uint64_t)v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "fileExistsAtPath:", v8) & 1) != 0
    || (v27 = 0,
        objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v27),
        (v14 = v27) == 0))
  {
    +[PKCloudStoreContainerChangeEvent csvStringForEvents:](PKCloudStoreContainerChangeEvent, "csvStringForEvents:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dataUsingEncoding:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "createFileAtPath:contents:attributes:", v13, v18, 0) & 1) != 0)
    {
      v16 = v13;
      v15 = 0;
    }
    else
    {
      v26 = v5;
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = *MEMORY[0x1E0CB2D50];
      v29[0] = CFSTR("Error");
      v21 = *MEMORY[0x1E0CB2D80];
      v28[0] = v20;
      v28[1] = v21;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error creating %@"), v12);
      v22 = a4;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("PKPassKitErrorDomain"), -1, v24);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v15 = objc_retainAutorelease(v15);
        v16 = 0;
        *v22 = v15;
      }
      else
      {
        v16 = 0;
      }
      v5 = v26;
    }

  }
  else
  {
    v15 = v14;
    if (a4)
    {
      v15 = objc_retainAutorelease(v14);
      v16 = 0;
      *a4 = v15;
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

+ (void)populateEndIntervalEvent:(id)a3 withBeginIntervalEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  v5 = a4;
  v16 = a3;
  objc_msgSend(v16, "setChangeType:", objc_msgSend(v5, "changeType"));
  objc_msgSend(v16, "setEventType:", objc_msgSend(v5, "eventType"));
  objc_msgSend(v5, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContainerIdentifier:", v6);

  objc_msgSend(v5, "operationGroupName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setOperationGroupName:", v7);

  objc_msgSend(v5, "operationGroupNameSuffix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setOperationGroupNameSuffix:", v8);

  objc_msgSend(v5, "stateName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setStateName:", v9);

  objc_msgSend(v5, "changeToken");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setChangeToken:", v10);

  objc_msgSend(v5, "objectNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObjectNames:", v11);

  objc_msgSend(v16, "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "timeIntervalSinceDate:", v13);
  v15 = v14;

  objc_msgSend(v16, "setTimeInterval:", v15);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudStoreContainerChangeEvent)initWithCoder:(id)a3
{
  id v4;
  PKCloudStoreContainerChangeEvent *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *timestamp;
  uint64_t v10;
  NSString *containerIdentifier;
  uint64_t v12;
  NSString *beginIntervalEventIdentifier;
  uint64_t v14;
  NSString *operationGroupName;
  uint64_t v16;
  NSString *operationGroupNameSuffix;
  uint64_t v18;
  NSString *stateName;
  uint64_t v20;
  NSData *changeToken;
  uint64_t v22;
  NSString *errorDescription;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *objectNames;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKCloudStoreContainerChangeEvent;
  v5 = -[PKCloudStoreContainerChangeEvent init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_changeType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("changeType"));
    v5->_eventType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eventType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v8 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containerIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    containerIdentifier = v5->_containerIdentifier;
    v5->_containerIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beginIntervalEventIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    beginIntervalEventIdentifier = v5->_beginIntervalEventIdentifier;
    v5->_beginIntervalEventIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("operationGroupName"));
    v14 = objc_claimAutoreleasedReturnValue();
    operationGroupName = v5->_operationGroupName;
    v5->_operationGroupName = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("operationGroupNameSuffix"));
    v16 = objc_claimAutoreleasedReturnValue();
    operationGroupNameSuffix = v5->_operationGroupNameSuffix;
    v5->_operationGroupNameSuffix = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stateName"));
    v18 = objc_claimAutoreleasedReturnValue();
    stateName = v5->_stateName;
    v5->_stateName = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changeToken"));
    v20 = objc_claimAutoreleasedReturnValue();
    changeToken = v5->_changeToken;
    v5->_changeToken = (NSData *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorDescription"));
    v22 = objc_claimAutoreleasedReturnValue();
    errorDescription = v5->_errorDescription;
    v5->_errorDescription = (NSString *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("objectNames"));
    v27 = objc_claimAutoreleasedReturnValue();
    objectNames = v5->_objectNames;
    v5->_objectNames = (NSArray *)v27;

    v5->_timeInterval = (double)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("timeInterval"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_changeType, CFSTR("changeType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_eventType, CFSTR("eventType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerIdentifier, CFSTR("containerIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beginIntervalEventIdentifier, CFSTR("beginIntervalEventIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operationGroupName, CFSTR("operationGroupName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_operationGroupNameSuffix, CFSTR("operationGroupNameSuffix"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stateName, CFSTR("stateName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_changeToken, CFSTR("changeToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errorDescription, CFSTR("errorDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_objectNames, CFSTR("objectNames"));
  objc_msgSend(v5, "encodeInteger:forKey:", (uint64_t)self->_timeInterval, CFSTR("timeInterval"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKCloudStoreContainerChangeEvent *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSDate *timestamp;
  uint64_t v10;
  NSString *containerIdentifier;
  uint64_t v12;
  NSString *beginIntervalEventIdentifier;
  uint64_t v14;
  NSString *operationGroupName;
  uint64_t v16;
  NSString *operationGroupNameSuffix;
  uint64_t v18;
  NSString *stateName;
  uint64_t v20;
  NSString *errorDescription;
  uint64_t v22;
  NSData *changeToken;
  uint64_t v24;
  NSArray *objectNames;

  v5 = -[PKCloudStoreContainerChangeEvent init](+[PKCloudStoreContainerChangeEvent allocWithZone:](PKCloudStoreContainerChangeEvent, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v5->_changeType = self->_changeType;
  v5->_eventType = self->_eventType;
  v8 = -[NSDate copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v8;

  v10 = -[NSString copyWithZone:](self->_containerIdentifier, "copyWithZone:", a3);
  containerIdentifier = v5->_containerIdentifier;
  v5->_containerIdentifier = (NSString *)v10;

  v12 = -[NSString copyWithZone:](self->_beginIntervalEventIdentifier, "copyWithZone:", a3);
  beginIntervalEventIdentifier = v5->_beginIntervalEventIdentifier;
  v5->_beginIntervalEventIdentifier = (NSString *)v12;

  v14 = -[NSString copyWithZone:](self->_operationGroupName, "copyWithZone:", a3);
  operationGroupName = v5->_operationGroupName;
  v5->_operationGroupName = (NSString *)v14;

  v16 = -[NSString copyWithZone:](self->_operationGroupNameSuffix, "copyWithZone:", a3);
  operationGroupNameSuffix = v5->_operationGroupNameSuffix;
  v5->_operationGroupNameSuffix = (NSString *)v16;

  v18 = -[NSString copyWithZone:](self->_stateName, "copyWithZone:", a3);
  stateName = v5->_stateName;
  v5->_stateName = (NSString *)v18;

  v20 = -[NSString copyWithZone:](self->_errorDescription, "copyWithZone:", a3);
  errorDescription = v5->_errorDescription;
  v5->_errorDescription = (NSString *)v20;

  v22 = -[NSData copyWithZone:](self->_changeToken, "copyWithZone:", a3);
  changeToken = v5->_changeToken;
  v5->_changeToken = (NSData *)v22;

  v24 = -[NSArray copyWithZone:](self->_objectNames, "copyWithZone:", a3);
  objectNames = v5->_objectNames;
  v5->_objectNames = (NSArray *)v24;

  v5->_timeInterval = self->_timeInterval;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  id v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  _BOOL4 v12;
  NSDate *timestamp;
  NSDate *v14;
  void *v15;
  NSString *v16;
  _BOOL4 v17;
  void *v18;
  NSString *v19;
  _BOOL4 v20;
  void *v21;
  NSString *v22;
  _BOOL4 v23;
  void *v24;
  NSString *v25;
  _BOOL4 v26;
  void *v27;
  NSString *v28;
  _BOOL4 v29;
  void *v30;
  NSString *v31;
  _BOOL4 v32;
  BOOL v33;
  NSData *changeToken;
  NSData *v36;
  NSArray *objectNames;
  NSArray *v38;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (!v6)
    goto LABEL_54;
  v8 = (void *)v6[1];
  v9 = self->_identifier;
  v10 = v8;
  if (v9 == v10)
  {

  }
  else
  {
    v11 = v10;
    if (!v9 || !v10)
      goto LABEL_53;
    v12 = -[NSString isEqualToString:](v9, "isEqualToString:", v10);

    if (!v12)
      goto LABEL_54;
  }
  if (self->_eventType != *((_QWORD *)v7 + 3) || self->_changeType != *((_QWORD *)v7 + 2))
    goto LABEL_54;
  timestamp = self->_timestamp;
  v14 = (NSDate *)*((_QWORD *)v7 + 4);
  if (timestamp && v14)
  {
    if ((-[NSDate isEqual:](timestamp, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (timestamp != v14)
  {
    goto LABEL_54;
  }
  v15 = (void *)*((_QWORD *)v7 + 5);
  v9 = self->_containerIdentifier;
  v16 = v15;
  if (v9 == v16)
  {

  }
  else
  {
    v11 = v16;
    if (!v9 || !v16)
      goto LABEL_53;
    v17 = -[NSString isEqualToString:](v9, "isEqualToString:", v16);

    if (!v17)
      goto LABEL_54;
  }
  v18 = (void *)*((_QWORD *)v7 + 6);
  v9 = self->_beginIntervalEventIdentifier;
  v19 = v18;
  if (v9 == v19)
  {

  }
  else
  {
    v11 = v19;
    if (!v9 || !v19)
      goto LABEL_53;
    v20 = -[NSString isEqualToString:](v9, "isEqualToString:", v19);

    if (!v20)
      goto LABEL_54;
  }
  v21 = (void *)*((_QWORD *)v7 + 7);
  v9 = self->_operationGroupName;
  v22 = v21;
  if (v9 == v22)
  {

  }
  else
  {
    v11 = v22;
    if (!v9 || !v22)
      goto LABEL_53;
    v23 = -[NSString isEqualToString:](v9, "isEqualToString:", v22);

    if (!v23)
      goto LABEL_54;
  }
  v24 = (void *)*((_QWORD *)v7 + 8);
  v9 = self->_operationGroupNameSuffix;
  v25 = v24;
  if (v9 == v25)
  {

  }
  else
  {
    v11 = v25;
    if (!v9 || !v25)
      goto LABEL_53;
    v26 = -[NSString isEqualToString:](v9, "isEqualToString:", v25);

    if (!v26)
      goto LABEL_54;
  }
  v27 = (void *)*((_QWORD *)v7 + 11);
  v9 = self->_stateName;
  v28 = v27;
  if (v9 == v28)
  {

  }
  else
  {
    v11 = v28;
    if (!v9 || !v28)
      goto LABEL_53;
    v29 = -[NSString isEqualToString:](v9, "isEqualToString:", v28);

    if (!v29)
      goto LABEL_54;
  }
  v30 = (void *)*((_QWORD *)v7 + 9);
  v9 = self->_errorDescription;
  v31 = v30;
  if (v9 != v31)
  {
    v11 = v31;
    if (v9 && v31)
    {
      v32 = -[NSString isEqualToString:](v9, "isEqualToString:", v31);

      if (!v32)
        goto LABEL_54;
      goto LABEL_57;
    }
LABEL_53:

    goto LABEL_54;
  }

LABEL_57:
  changeToken = self->_changeToken;
  v36 = (NSData *)*((_QWORD *)v7 + 10);
  if (changeToken && v36)
  {
    if ((-[NSData isEqual:](changeToken, "isEqual:") & 1) == 0)
      goto LABEL_54;
  }
  else if (changeToken != v36)
  {
    goto LABEL_54;
  }
  objectNames = self->_objectNames;
  v38 = (NSArray *)*((_QWORD *)v7 + 12);
  if (objectNames && v38)
  {
    if ((-[NSArray isEqual:](objectNames, "isEqual:") & 1) != 0)
      goto LABEL_67;
  }
  else if (objectNames == v38)
  {
LABEL_67:
    v33 = self->_timeInterval == *((double *)v7 + 13);
    goto LABEL_55;
  }
LABEL_54:
  v33 = 0;
LABEL_55:

  return v33;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_identifier);
  objc_msgSend(v3, "safelyAddObject:", self->_timestamp);
  objc_msgSend(v3, "safelyAddObject:", self->_containerIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_beginIntervalEventIdentifier);
  objc_msgSend(v3, "safelyAddObject:", self->_operationGroupName);
  objc_msgSend(v3, "safelyAddObject:", self->_operationGroupNameSuffix);
  objc_msgSend(v3, "safelyAddObject:", self->_stateName);
  objc_msgSend(v3, "safelyAddObject:", self->_errorDescription);
  objc_msgSend(v3, "safelyAddObject:", self->_changeToken);
  objc_msgSend(v3, "safelyAddObject:", self->_objectNames);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_eventType - v4 + 32 * v4;
  v6 = self->_changeType - v5 + 32 * v5;
  v7 = (unint64_t)self->_timeInterval - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t changeType;
  const __CFString *v6;
  const __CFString *v7;
  double timeInterval;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("identifier: '%@'; "), self->_identifier);
  PKCloudStoreContainerChangeEventTypeToString(self->_eventType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("eventType: '%@'; "), v4);

  changeType = self->_changeType;
  v6 = CFSTR("unknown");
  if (changeType == 1)
    v6 = CFSTR("signpost");
  if (changeType == 2)
    v7 = CFSTR("interval");
  else
    v7 = v6;
  objc_msgSend(v3, "appendFormat:", CFSTR("changeType: '%@'; "), v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("timestamp: '%@'; "), self->_timestamp);
  objc_msgSend(v3, "appendFormat:", CFSTR("containerIdentifier: '%@'; "), self->_containerIdentifier);
  if (-[NSString length](self->_beginIntervalEventIdentifier, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("beginIntervalEventIdentifier: '%@'; "),
      self->_beginIntervalEventIdentifier);
  if (-[NSString length](self->_operationGroupNameSuffix, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("operationGroupNameSuffix: '%@'; "), self->_operationGroupNameSuffix);
  if (-[NSString length](self->_operationGroupName, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("operationGroupName: '%@'; "), self->_operationGroupName);
  if (-[NSString length](self->_stateName, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("stateName: '%@'; "), self->_stateName);
  if (-[NSString length](self->_errorDescription, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("errorDescription: '%@'; "), self->_errorDescription);
  if (-[NSData length](self->_changeToken, "length"))
    objc_msgSend(v3, "appendFormat:", CFSTR("changeToken: %ld hash'; "), -[NSData hash](self->_changeToken, "hash"));
  if (-[NSArray count](self->_objectNames, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("objectNames: '%@'; "), self->_objectNames);
  timeInterval = self->_timeInterval;
  if (timeInterval != 0.0)
    objc_msgSend(v3, "appendFormat:", CFSTR("timeInterval: %ld seconds; "), (uint64_t)timeInterval);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (id)_csvSafeStringForEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v52[15];

  v52[13] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend(v4, "objectNames");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataWithJSONObject:options:error:", v8, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);
  }
  objc_msgSend(v4, "objectNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "description");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "changeToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");

  objc_msgSend(v4, "identifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_csvSafeString:");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v49;
  v15 = objc_msgSend(v4, "changeType");
  v16 = CFSTR("unknown");
  if (v15 == 1)
    v16 = CFSTR("signpost");
  if (v15 == 2)
    v16 = CFSTR("interval");
  v48 = v16;
  v52[1] = v48;
  PKCloudStoreContainerChangeEventTypeToString(objc_msgSend(v4, "eventType"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52[2] = v47;
  objc_msgSend(v4, "containerIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_csvSafeString:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v52[3] = v45;
  objc_msgSend(v4, "beginIntervalEventIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_csvSafeString:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v52[4] = v42;
  objc_msgSend(v4, "operationGroupName");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_csvSafeString:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v40;
  objc_msgSend(v4, "operationGroupNameSuffix");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_csvSafeString:");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v52[6] = v38;
  objc_msgSend(a1, "_dateFormatter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v17;
  objc_msgSend(v17, "stringFromDate:", v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_csvSafeString:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v34;
  objc_msgSend(v4, "errorDescription");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_csvSafeString:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v18;
  v19 = (void *)0x1E0CB3000;
  if (v14 < 1)
  {
    v20 = &stru_1E2ADF4C0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "description");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_csvSafeString:");
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v43 = v14;
  v52[9] = v20;
  objc_msgSend(v4, "stateName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_csvSafeString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52[10] = v22;
  v51 = v12;
  objc_msgSend(a1, "_csvSafeString:", v12);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v52[11] = v23;
  objc_msgSend(v4, "timeInterval");
  v25 = v24;
  if (v24 <= 0.0)
  {
    v27 = &stru_1E2ADF4C0;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "timeInterval");
    objc_msgSend(v26, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_csvSafeString:", v12);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v52[12] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25 > 0.0)
  {

  }
  if (v43 >= 1)
  {

  }
  objc_msgSend(v28, "componentsJoinedByString:", CFSTR(","));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)_csvSafeString:(id)a3
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;

  v3 = (__CFString *)a3;
  if (-[__CFString length](v3, "length"))
  {
    -[__CFString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("'"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "containsString:", CFSTR("\n")) & 1) != 0
      || objc_msgSend(v4, "containsString:", CFSTR(",")))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\"%@\"), v4);
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    v6 = v4;
    v3 = v6;
  }
  else
  {
    v6 = &stru_1E2ADF4C0;
  }

  return v6;
}

+ (id)_dateFormatter
{
  if (qword_1ECF22AD8 != -1)
    dispatch_once(&qword_1ECF22AD8, &__block_literal_global_188);
  return (id)_MergedGlobals_273;
}

uint64_t __50__PKCloudStoreContainerChangeEvent__dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_273;
  _MergedGlobals_273 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_273, "setLocalizedDateFormatFromTemplate:", CFSTR("MM/dd/yyyy HH:mm:ss.SSS z"));
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unint64_t)a3
{
  self->_changeType = a3;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_timestamp, a3);
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)beginIntervalEventIdentifier
{
  return self->_beginIntervalEventIdentifier;
}

- (void)setBeginIntervalEventIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (void)setOperationGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)operationGroupNameSuffix
{
  return self->_operationGroupNameSuffix;
}

- (void)setOperationGroupNameSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)changeToken
{
  return self->_changeToken;
}

- (void)setChangeToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)stateName
{
  return self->_stateName;
}

- (void)setStateName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)objectNames
{
  return self->_objectNames;
}

- (void)setObjectNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectNames, 0);
  objc_storeStrong((id *)&self->_stateName, 0);
  objc_storeStrong((id *)&self->_changeToken, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
  objc_storeStrong((id *)&self->_operationGroupNameSuffix, 0);
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_beginIntervalEventIdentifier, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
