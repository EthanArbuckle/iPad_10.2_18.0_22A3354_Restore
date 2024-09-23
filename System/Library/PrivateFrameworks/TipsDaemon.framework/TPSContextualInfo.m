@implementation TPSContextualInfo

- (TPSContextualInfo)initWithDictionary:(id)a3
{
  id v4;
  TPSContextualInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *identifier;
  uint64_t v11;
  TPSContextualInfo *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSArray *displayBundleIDs;
  uint64_t v18;
  NSArray *eligibleContext;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  TPSContextualCondition *triggerCondition;
  void *v35;
  uint64_t v36;
  TPSContextualCondition *desiredOutcomeCondition;
  void *v38;
  uint64_t v39;
  TPSMonitoringEvents *monitoringEvents;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)TPSContextualInfo;
  v5 = -[TPSSerializableObject initWithDictionary:](&v48, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_40;
  objc_msgSend(v4, "TPSSafeNumberForKey:", CFSTR("customizationId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "integerValue");
  else
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  v5->_customizationID = v8;
  +[TPSContextualInfo identifierFromDictionary:](TPSContextualInfo, "identifierFromDictionary:", v4);
  v9 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v9;

  v11 = -[TPSContextualInfo _lastModifiedDateFromDictionary:](v5, "_lastModifiedDateFromDictionary:", v4);
  v5->_lastModifiedDate = v11;
  if (!v11 || v11 == 0x7FFFFFFFFFFFFFFFLL)
  {

    v12 = 0;
    goto LABEL_41;
  }
  objc_msgSend(v4, "TPSSafeNumberForKey:", CFSTR("displayMaxCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v13;
  if (v13)
  {
    v14 = objc_msgSend(v13, "integerValue");
    v15 = 3;
    if (v14 != -1)
      v15 = v14;
  }
  else
  {
    v15 = 3;
  }
  v42 = v7;
  v5->_displayMaxCount = v15;
  objc_msgSend(v4, "TPSSafeArrayForKey:", CFSTR("displayBundleIds"));
  v16 = objc_claimAutoreleasedReturnValue();
  displayBundleIDs = v5->_displayBundleIDs;
  v5->_displayBundleIDs = (NSArray *)v16;

  objc_msgSend(v4, "TPSSafeArrayForKey:", CFSTR("eligibleContexts"));
  v18 = objc_claimAutoreleasedReturnValue();
  eligibleContext = v5->_eligibleContext;
  v5->_eligibleContext = (NSArray *)v18;

  objc_msgSend(v4, "TPSSafeArrayForKey:", CFSTR("usageEvents"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (!v21)
  {
    v23 = 0;
    goto LABEL_30;
  }
  v22 = v21;
  v23 = 0;
  v24 = *(_QWORD *)v45;
  do
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v45 != v24)
        objc_enumerationMutation(v20);
      v26 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
      v27 = objc_msgSend(MEMORY[0x1E0DBF390], "typeFromEventDictionary:", v26);
      if (v27 == 3)
      {
        objc_msgSend(MEMORY[0x1E0DBF378], "contextualBiomeEventFromDictionary:", v26);
        v28 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v27)
          continue;
        objc_msgSend(MEMORY[0x1E0DBF378], "contextualBiomeEventFromDuetEventDictionary:", v26);
        v28 = objc_claimAutoreleasedReturnValue();
      }
      v29 = (void *)v28;
      if (v28)
      {
        if (!v23)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v20, "count"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v23, "addObject:", v29);

      }
    }
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  }
  while (v22);
LABEL_30:
  v30 = objc_msgSend(v23, "count");
  if (v30)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v23);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  objc_storeStrong((id *)&v5->_usageEvents, v31);
  if (v30)

  objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("triggers"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBF380]), "initWithDictionary:type:", v32, 0);
    triggerCondition = v5->_triggerCondition;
    v5->_triggerCondition = (TPSContextualCondition *)v33;

  }
  objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("desiredOutcome"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v36 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBF380]), "initWithDictionary:type:", v35, 1);
    desiredOutcomeCondition = v5->_desiredOutcomeCondition;
    v5->_desiredOutcomeCondition = (TPSContextualCondition *)v36;

  }
  objc_msgSend(v4, "TPSSafeDictionaryForKey:", *MEMORY[0x1E0DBF4C8]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBF3E0]), "initWithDictionary:desiredOutcomeDictionary:", v38, v35);
  monitoringEvents = v5->_monitoringEvents;
  v5->_monitoringEvents = (TPSMonitoringEvents *)v39;

LABEL_40:
  v12 = v5;
LABEL_41:

  return v12;
}

- (int64_t)_lastModifiedDateFromDictionary:(id)a3
{
  return objc_msgSend(a3, "TPSSafeIntegerForKey:", CFSTR("lastModified"));
}

+ (id)identifierFromDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeStringForKey:", CFSTR("documentId"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredOutcomeCondition, 0);
  objc_storeStrong((id *)&self->_triggerCondition, 0);
  objc_storeStrong((id *)&self->_usageEvents, 0);
  objc_storeStrong((id *)&self->_monitoringEvents, 0);
  objc_storeStrong((id *)&self->_eligibleContext, 0);
  objc_storeStrong((id *)&self->_displayBundleIDs, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSArray)usageEvents
{
  return self->_usageEvents;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSContextualInfo;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_customizationID, CFSTR("customizationId"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_displayMaxCount, CFSTR("displayMaxCount"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("documentId"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayBundleIDs, CFSTR("displayBundleIds"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_eligibleContext, CFSTR("eligibleContexts"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_monitoringEvents, *MEMORY[0x1E0DBF4C8]);
  objc_msgSend(v4, "encodeObject:forKey:", self->_usageEvents, CFSTR("usageEvents"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_lastModifiedDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("lastModified"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_triggerCondition, CFSTR("triggers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_desiredOutcomeCondition, CFSTR("desiredOutcome"));

}

+ (id)contentDictionaryWithTipDeliveryInfoId:(id)a3 deliveryInfoMap:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("documentId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("documentId"));

  objc_msgSend(v4, "TPSSafeNumberForKey:", CFSTR("lastModified"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("lastModified"));

  objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("triggers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("triggers"));

  objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("desiredOutcome"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("desiredOutcome"));

  v10 = *MEMORY[0x1E0DBF4C8];
  objc_msgSend(v4, "TPSSafeDictionaryForKey:", *MEMORY[0x1E0DBF4C8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v10);

  objc_msgSend(v4, "TPSSafeArrayForKey:", CFSTR("usageEvents"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("usageEvents"));

  objc_msgSend(v4, "TPSSafeNumberForKey:", CFSTR("customizationId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("customizationId"));

  objc_msgSend(v4, "TPSSafeNumberForKey:", CFSTR("displayMaxCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("displayMaxCount"));

  objc_msgSend(v4, "TPSSafeArrayForKey:", CFSTR("displayBundleIds"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("displayBundleIds"));

  objc_msgSend(v4, "TPSSafeArrayForKey:", CFSTR("eligibleContexts"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("eligibleContexts"));

  v17 = (void *)objc_msgSend(v5, "copy");
  return v17;
}

+ (void)eventsInfoArrayForContextualInfoDictionary:(id)a3 triggerEvents:(id *)a4 desiredOutcomeEvents:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a3;
  v10 = v7;
  if (a4)
  {
    objc_msgSend(v7, "TPSSafeDictionaryForKey:", CFSTR("triggers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBF380], "eventsForConditionDictionary:", v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v10;
  }
  if (a5)
  {
    objc_msgSend(v10, "TPSSafeDictionaryForKey:", CFSTR("desiredOutcome"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DBF380], "eventsForConditionDictionary:", v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v7 = v10;
  }

}

- (TPSContextualInfo)initWithCoder:(id)a3
{
  id v4;
  TPSContextualInfo *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSString *identifier;
  uint64_t v12;
  NSArray *displayBundleIDs;
  uint64_t v14;
  NSArray *eligibleContext;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSArray *usageEvents;
  void *v21;
  uint64_t v22;
  TPSContextualCondition *triggerCondition;
  uint64_t v24;
  TPSContextualCondition *desiredOutcomeCondition;
  uint64_t v26;
  TPSMonitoringEvents *monitoringEvents;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TPSContextualInfo;
  v5 = -[TPSSerializableObject initWithCoder:](&v29, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_customizationID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("customizationId"));
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayMaxCount"));
    v5->_displayMaxCount = v6;
    if ((v6 | 0x8000000000000000) == 0xFFFFFFFFFFFFFFFFLL)
      v5->_displayMaxCount = 3;
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("documentId"));
    v10 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("displayBundleIds"));
    v12 = objc_claimAutoreleasedReturnValue();
    displayBundleIDs = v5->_displayBundleIDs;
    v5->_displayBundleIDs = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("eligibleContexts"));
    v14 = objc_claimAutoreleasedReturnValue();
    eligibleContext = v5->_eligibleContext;
    v5->_eligibleContext = (NSArray *)v14;

    v16 = (void *)MEMORY[0x1E0C99E60];
    v17 = objc_opt_class();
    objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("usageEvents"));
    v19 = objc_claimAutoreleasedReturnValue();
    usageEvents = v5->_usageEvents;
    v5->_usageEvents = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastModified"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lastModifiedDate = objc_msgSend(v21, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggers"));
    v22 = objc_claimAutoreleasedReturnValue();
    triggerCondition = v5->_triggerCondition;
    v5->_triggerCondition = (TPSContextualCondition *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("desiredOutcome"));
    v24 = objc_claimAutoreleasedReturnValue();
    desiredOutcomeCondition = v5->_desiredOutcomeCondition;
    v5->_desiredOutcomeCondition = (TPSContextualCondition *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x1E0DBF4C8]);
    v26 = objc_claimAutoreleasedReturnValue();
    monitoringEvents = v5->_monitoringEvents;
    v5->_monitoringEvents = (TPSMonitoringEvents *)v26;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSContextualInfo;
  v4 = -[TPSSerializableObject copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setCustomizationID:", self->_customizationID);
  objc_msgSend(v4, "setDisplayMaxCount:", self->_displayMaxCount);
  objc_msgSend(v4, "setDisplayBundleIDs:", self->_displayBundleIDs);
  objc_msgSend(v4, "setEligibleContext:", self->_eligibleContext);
  objc_msgSend(v4, "setMonitoringEvents:", self->_monitoringEvents);
  objc_msgSend(v4, "setUsageEvents:", self->_usageEvents);
  objc_msgSend(v4, "setLastModifiedDate:", self->_lastModifiedDate);
  objc_msgSend(v4, "setTriggerCondition:", self->_triggerCondition);
  objc_msgSend(v4, "setDesiredOutcomeCondition:", self->_desiredOutcomeCondition);
  return v4;
}

- (id)displayBundleID
{
  return -[NSArray firstObject](self->_displayBundleIDs, "firstObject");
}

- (id)triggerEventIdentifiers
{
  return (id)-[TPSContextualCondition eventIdentifiers](self->_triggerCondition, "eventIdentifiers");
}

- (id)desiredOutcomeEventIdentifiers
{
  return (id)-[TPSContextualCondition eventIdentifiers](self->_desiredOutcomeCondition, "eventIdentifiers");
}

- (BOOL)hasChangesFromDictionary:(id)a3
{
  return -[TPSContextualInfo _lastModifiedDateFromDictionary:](self, "_lastModifiedDateFromDictionary:", a3) != self->_lastModifiedDate;
}

- (id)conditionForType:(unint64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___TPSContextualInfo__triggerCondition;
  if (a3 == 1)
    v3 = &OBJC_IVAR___TPSContextualInfo__desiredOutcomeCondition;
  return *(id *)((char *)&self->super.super.isa + *v3);
}

- (void)restartTriggerTracking
{
  -[TPSContextualCondition restartTracking](self->_triggerCondition, "restartTracking");
}

- (void)restartDesiredOutcomeTracking
{
  -[TPSContextualCondition restartTracking](self->_desiredOutcomeCondition, "restartTracking");
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  NSString *identifier;
  int64_t customizationID;
  int64_t displayMaxCount;
  TPSContextualCondition *triggerCondition;
  void *v10;
  TPSContextualCondition *desiredOutcomeCondition;
  void *v12;
  NSArray *displayBundleIDs;
  NSArray *eligibleContext;
  NSArray *usageEvents;
  void *v16;
  TPSMonitoringEvents *monitoringEvents;
  uint64_t v18;
  void *v19;
  objc_super v21;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v21.receiver = self;
  v21.super_class = (Class)TPSContextualInfo;
  -[TPSSerializableObject debugDescription](&v21, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("documentId"), identifier);
  customizationID = self->_customizationID;
  if (customizationID != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %zd\n"), CFSTR("customizationId"), customizationID);
  displayMaxCount = self->_displayMaxCount;
  if (displayMaxCount != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %zd\n"), CFSTR("displayMaxCount"), displayMaxCount);
  triggerCondition = self->_triggerCondition;
  if (triggerCondition)
  {
    -[TPSContextualCondition debugDescription](triggerCondition, "debugDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("triggers"), v10);

  }
  desiredOutcomeCondition = self->_desiredOutcomeCondition;
  if (desiredOutcomeCondition)
  {
    -[TPSContextualCondition debugDescription](desiredOutcomeCondition, "debugDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("desiredOutcome"), v12);

  }
  displayBundleIDs = self->_displayBundleIDs;
  if (displayBundleIDs)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("displayBundleIds"), displayBundleIDs);
  eligibleContext = self->_eligibleContext;
  if (eligibleContext)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("eligibleContexts"), eligibleContext);
  usageEvents = self->_usageEvents;
  if (usageEvents)
  {
    -[NSArray description](usageEvents, "description");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("usageEvents"), v16);

  }
  monitoringEvents = self->_monitoringEvents;
  if (monitoringEvents)
  {
    v18 = *MEMORY[0x1E0DBF4C8];
    -[TPSMonitoringEvents description](monitoringEvents, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), v18, v19);

  }
  return v5;
}

- (int)priority
{
  return self->_priority;
}

- (int64_t)customizationID
{
  return self->_customizationID;
}

- (void)setCustomizationID:(int64_t)a3
{
  self->_customizationID = a3;
}

- (int64_t)displayMaxCount
{
  return self->_displayMaxCount;
}

- (void)setDisplayMaxCount:(int64_t)a3
{
  self->_displayMaxCount = a3;
}

- (int64_t)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(int64_t)a3
{
  self->_lastModifiedDate = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)displayBundleIDs
{
  return self->_displayBundleIDs;
}

- (void)setDisplayBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)eligibleContext
{
  return self->_eligibleContext;
}

- (void)setEligibleContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (TPSMonitoringEvents)monitoringEvents
{
  return self->_monitoringEvents;
}

- (void)setMonitoringEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setUsageEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (TPSContextualCondition)triggerCondition
{
  return self->_triggerCondition;
}

- (void)setTriggerCondition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (TPSContextualCondition)desiredOutcomeCondition
{
  return self->_desiredOutcomeCondition;
}

- (void)setDesiredOutcomeCondition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

@end
