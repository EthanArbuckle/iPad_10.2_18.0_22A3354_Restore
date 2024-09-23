@implementation TPSContextualEvent

- (TPSContextualEvent)initWithDictionary:(id)a3
{
  id v4;
  TPSContextualEvent *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *key;
  void *v10;
  void *v11;
  uint64_t v12;
  TPSContextualEvent *v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  TPSContextualEvent *state;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *userInfoPersistent;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TPSContextualEvent;
  v5 = -[TPSSerializableObject initWithDictionary:](&v23, sel_initWithDictionary_, v4);
  if (!v5)
  {
LABEL_13:
    v13 = v5;
    goto LABEL_14;
  }
  +[TPSContextualEvent identifierFromEventInfoDictionary:](TPSContextualEvent, "identifierFromEventInfoDictionary:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("key"));
  v8 = objc_claimAutoreleasedReturnValue();
  key = v5->_key;
  v5->_key = (NSString *)v8;

  if (-[NSString length](v5->_identifier, "length"))
  {
    v5->_type = +[TPSContextualEvent typeFromEventDictionary:](TPSContextualEvent, "typeFromEventDictionary:", v4);
    objc_msgSend(v4, "TPSSafeNumberForKey:", CFSTR("status"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = (int)objc_msgSend(v10, "intValue");
    else
      v12 = 1;
    v5->_status = v12;
    v14 = objc_msgSend(v4, "TPSSafeIntForKey:", CFSTR("minObservations"));
    v5->_minObservationCount = v14;
    if (!v14 || !v5->_status)
      v5->_minObservationCount = 1;
    objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("state"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[TPSContextualEvent newStateFromStateDictionary:](v5, "newStateFromStateDictionary:", v15);
    state = v5->_state;
    v5->_state = (TPSContextualEvent *)v16;

    -[TPSContextualEvent setType:](v5->_state, "setType:", v5->_type);
    v5->_lookBackDays = objc_msgSend(v4, "TPSSafeIntegerForKey:", CFSTR("lookBackDays"));
    v5->_daysSinceLastMajorUpdate = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v4, "TPSSafeNumberForKey:", CFSTR("daysSinceLastMajorUpdate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
      v5->_daysSinceLastMajorUpdate = objc_msgSend(v18, "integerValue");
    objc_msgSend(v4, "TPSSafeDictionaryForKey:", CFSTR("userInfoPersistent"));
    v20 = objc_claimAutoreleasedReturnValue();
    userInfoPersistent = v5->_userInfoPersistent;
    v5->_userInfoPersistent = (NSDictionary *)v20;

    goto LABEL_13;
  }
  v13 = 0;
LABEL_14:

  return v13;
}

+ (int64_t)typeFromEventDictionary:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  objc_msgSend(a3, "TPSSafeNumberForKey:", CFSTR("type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = (int)objc_msgSend(v3, "intValue");
  else
    v5 = -1;

  return v5;
}

+ (id)identifierFromEventInfoDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "TPSSafeStringForKey:", CFSTR("id"));
}

- (id)newStateFromStateDictionary:(id)a3
{
  return 0;
}

+ (id)eventDictionaryForIdentifier:(id)a3 type:(int64_t)a4 status:(int64_t)a5
{
  void *v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v14[0] = CFSTR("id");
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[0] = v9;
  v14[1] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  v14[2] = CFSTR("status");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {

  }
  return v12;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)status
{
  return self->_status;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unsigned)currentObservationCount
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedEventLock);
  LODWORD(self) = -[NSMutableDictionary count](self->_observationMap, "count");
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
  return self;
}

- (NSDate)eventSinceDate
{
  NSDate *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = self->_eventSinceDate;
  if (!v3)
  {
    if (-[TPSContextualEvent hasLookBackDays](self, "hasLookBackDays"))
    {
      v4 = (void *)MEMORY[0x1E0C99D68];
      -[TPSContextualEvent lookbackTimeIntervalInSeconds](self, "lookbackTimeIntervalInSeconds");
      objc_msgSend(v4, "dateWithTimeIntervalSinceNow:");
      v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
  }
  -[TPSContextualEvent eventSinceLastMajorUpdateDate](self, "eventSinceLastMajorUpdateDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (v3)
    {
      -[NSDate laterDate:](v3, "laterDate:", v5);
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (NSDate *)v7;
    }
    else
    {
      v3 = v5;
    }
  }

  return v3;
}

- (BOOL)hasLookBackDays
{
  return -[TPSContextualEvent lookBackDays](self, "lookBackDays") > 0;
}

- (int64_t)lookBackDays
{
  return self->_lookBackDays;
}

- (id)eventSinceLastMajorUpdateDate
{
  void *v3;
  void *v4;
  void *v5;

  if (-[TPSContextualEvent hasDaysSinceLastMajorUpdate](self, "hasDaysSinceLastMajorUpdate"))
  {
    +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastMajorVersionUpdateDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[TPSContextualEvent daysSinceLastMajorUpdateTimeIntervalInSeconds](self, "daysSinceLastMajorUpdateTimeIntervalInSeconds");
      objc_msgSend(v4, "dateByAddingTimeInterval:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)hasDaysSinceLastMajorUpdate
{
  return -[TPSContextualEvent daysSinceLastMajorUpdate](self, "daysSinceLastMajorUpdate") != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)daysSinceLastMajorUpdate
{
  return self->_daysSinceLastMajorUpdate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerIdentifiers, 0);
  objc_storeStrong((id *)&self->_observationMap, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_eventSinceDate, 0);
  objc_storeStrong((id *)&self->_matchedDate, 0);
  objc_storeStrong((id *)&self->_userInfoPersistent, 0);
  objc_storeStrong((id *)&self->_userInfoQuery, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSContextualEvent;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v7.receiver, v7.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v4, "encodeInt:forKey:", self->_minObservationCount, CFSTR("minObservations"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_lookBackDays, CFSTR("lookBackDays"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_daysSinceLastMajorUpdate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("daysSinceLastMajorUpdate"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_userInfoPersistent, CFSTR("userInfoPersistent"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_bookmark, CFSTR("bookmark"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_matchedDate, CFSTR("matchedDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_eventSinceDate, CFSTR("eventSinceDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("id"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_key, CFSTR("key"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_observationMap, CFSTR("observationMap"));
  -[NSMutableSet allObjects](self->_observerIdentifiers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("observerIdentifiers"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSContextualEvent)initWithCoder:(id)a3
{
  id v4;
  TPSContextualEvent *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSDictionary *userInfoPersistent;
  uint64_t v12;
  NSDate *matchedDate;
  uint64_t v14;
  TPSContextualEventBookmark *bookmark;
  NSDate *v16;
  uint64_t v17;
  NSDate *eventSinceDate;
  uint64_t v19;
  NSString *identifier;
  uint64_t v21;
  NSString *key;
  uint64_t v23;
  TPSContextualEvent *state;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSMutableDictionary *observationMap;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSMutableSet *observerIdentifiers;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)TPSContextualEvent;
  v5 = -[TPSSerializableObject initWithCoder:](&v39, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_type = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("type"));
    v5->_status = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("status"));
    v5->_minObservationCount = objc_msgSend(v4, "decodeIntForKey:", CFSTR("minObservations"));
    v5->_lookBackDays = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lookBackDays"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("daysSinceLastMajorUpdate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "integerValue");
    else
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    v5->_daysSinceLastMajorUpdate = v8;
    v9 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v9, objc_opt_class(), CFSTR("userInfoPersistent"));
    v10 = objc_claimAutoreleasedReturnValue();
    userInfoPersistent = v5->_userInfoPersistent;
    v5->_userInfoPersistent = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchedDate"));
    v12 = objc_claimAutoreleasedReturnValue();
    matchedDate = v5->_matchedDate;
    v5->_matchedDate = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bookmark"));
    v14 = objc_claimAutoreleasedReturnValue();
    bookmark = v5->_bookmark;
    v5->_bookmark = (TPSContextualEventBookmark *)v14;

    if (v5->_matchedDate
      && objc_msgSend(MEMORY[0x1E0C99D68], "isDateExpired:maxTimeInterval:", -63072000.0))
    {
      v16 = v5->_matchedDate;
      v5->_matchedDate = 0;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventSinceDate"));
    v17 = objc_claimAutoreleasedReturnValue();
    eventSinceDate = v5->_eventSinceDate;
    v5->_eventSinceDate = (NSDate *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v19 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v21 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v23 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (TPSContextualEvent *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    v27 = objc_opt_class();
    v28 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, v27, v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("observationMap"));
    v30 = objc_claimAutoreleasedReturnValue();
    observationMap = v5->_observationMap;
    v5->_observationMap = (NSMutableDictionary *)v30;

    -[TPSContextualEvent removeOutdatedObservationDates](v5, "removeOutdatedObservationDates");
    v32 = (void *)MEMORY[0x1E0C99E60];
    v33 = objc_opt_class();
    objc_msgSend(v32, "setWithObjects:", v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("observerIdentifiers"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v35);
      v36 = objc_claimAutoreleasedReturnValue();
      observerIdentifiers = v5->_observerIdentifiers;
      v5->_observerIdentifiers = (NSMutableSet *)v36;

    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setType:", self->_type);
  objc_msgSend(v4, "setStatus:", self->_status);
  objc_msgSend(v4, "setMinObservationCount:", self->_minObservationCount);
  objc_msgSend(v4, "setLookBackDays:", self->_lookBackDays);
  objc_msgSend(v4, "setDaysSinceLastMajorUpdate:", self->_daysSinceLastMajorUpdate);
  objc_msgSend(v4, "setUserInfoPersistent:", self->_userInfoPersistent);
  objc_msgSend(v4, "setBookmark:", self->_bookmark);
  objc_msgSend(v4, "setMatchedDate:", self->_matchedDate);
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setKey:", self->_key);
  objc_msgSend(v4, "setState:", self->_state);
  objc_msgSend(v4, "setObservationMap:", self->_observationMap);
  objc_msgSend(v4, "setObserverIdentifiers:", self->_observerIdentifiers);
  return v4;
}

- (BOOL)canBeRemoved
{
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedEventLock);
  LOBYTE(self) = -[NSMutableSet count](self->_observerIdentifiers, "count") == 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
  return (char)self;
}

- (double)lookbackTimeIntervalInSeconds
{
  double v3;

  +[TPSDefaultsManager contextualEventLookBackDaysInSeconds](TPSDefaultsManager, "contextualEventLookBackDaysInSeconds");
  if (v3 <= 0.0)
    v3 = (double)(86400 * -[TPSContextualEvent lookBackDays](self, "lookBackDays"));
  return -v3;
}

- (double)daysSinceLastMajorUpdateTimeIntervalInSeconds
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  +[TPSDefaultsManager contextualEventDaysSinceLastMajorUpdateInSeconds](TPSDefaultsManager, "contextualEventDaysSinceLastMajorUpdateInSeconds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = (double)(86400 * -[TPSContextualEvent daysSinceLastMajorUpdate](self, "daysSinceLastMajorUpdate"));
  }

  return v6;
}

- (void)addObserverIdentifier:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *observerIdentifiers;
  NSObject *v7;
  NSMutableSet *v8;
  NSString *identifier;
  int v10;
  id v11;
  __int16 v12;
  NSMutableSet *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedEventLock);
  if (!self->_observerIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    observerIdentifiers = self->_observerIdentifiers;
    self->_observerIdentifiers = v5;

  }
  +[TPSLogger default](TPSLogger, "default");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = self->_observerIdentifiers;
    identifier = self->_identifier;
    v10 = 138412802;
    v11 = v4;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = identifier;
    _os_log_debug_impl(&dword_19A906000, v7, OS_LOG_TYPE_DEBUG, "Add observerIdentifer %@ to map %@ for event identifier %@", (uint8_t *)&v10, 0x20u);
  }

  -[NSMutableSet addObject:](self->_observerIdentifiers, "addObject:", v4);
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);

}

- (BOOL)observedWithResults:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *observationMap;
  BOOL v7;
  unsigned int minObservationCount;
  _QWORD v10[5];

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedEventLock);
  if (objc_msgSend(v4, "count") && !self->_observationMap)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    observationMap = self->_observationMap;
    self->_observationMap = v5;

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__TPSContextualEvent_observedWithResults___block_invoke;
  v10[3] = &unk_1E395D7D0;
  v10[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
  if (-[TPSContextualEvent hasLookBackDays](self, "hasLookBackDays"))
    -[TPSContextualEvent removeOutdatedObservationDates](self, "removeOutdatedObservationDates");
  if (self->_matchedDate)
  {
    v7 = 0;
  }
  else
  {
    minObservationCount = self->_minObservationCount;
    v7 = minObservationCount <= -[TPSContextualEvent currentObservationCount](self, "currentObservationCount");
  }

  return v7;
}

uint64_t __42__TPSContextualEvent_observedWithResults___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "setObject:forKeyedSubscript:", a3, a2);
}

- (void)removeObserverIdentifiers:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedEventLock);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet minusSet:](self->_observerIdentifiers, "minusSet:", v4);

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
}

- (void)removeAllObservations
{
  TPSContextualEventBookmark *bookmark;

  os_unfair_lock_lock((os_unfair_lock_t)&_sharedEventLock);
  -[NSMutableDictionary removeAllObjects](self->_observationMap, "removeAllObjects");
  bookmark = self->_bookmark;
  self->_bookmark = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);
}

- (void)removeOutdatedObservationDates
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSMutableDictionary *observationMap;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSContextualEvent eventTimeToLiveInterval](self, "eventTimeToLiveInterval");
  v5 = v4;
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedEventLock);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableDictionary count](self->_observationMap, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  observationMap = self->_observationMap;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__TPSContextualEvent_removeOutdatedObservationDates__block_invoke;
  v10[3] = &unk_1E395D7F8;
  v13 = v5;
  v11 = v3;
  v12 = v6;
  v8 = v6;
  v9 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](observationMap, "enumerateKeysAndObjectsUsingBlock:", v10);
  -[NSMutableDictionary removeObjectsForKeys:](self->_observationMap, "removeObjectsForKeys:", v8);
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedEventLock);

}

void __52__TPSContextualEvent_removeOutdatedObservationDates__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(a3, "isTimeToDate:withinTimeInterval:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48)) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (double)eventTimeToLiveInterval
{
  double result;

  if (!-[TPSContextualEvent hasLookBackDays](self, "hasLookBackDays"))
    return -63072000.0;
  -[TPSContextualEvent lookbackTimeIntervalInSeconds](self, "lookbackTimeIntervalInSeconds");
  return result;
}

- (id)description
{
  return self->_identifier;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  int64_t lookBackDays;
  int64_t daysSinceLastMajorUpdate;
  NSDictionary *userInfoPersistent;
  TPSContextualEventBookmark *bookmark;
  NSDate *matchedDate;
  NSDate *eventSinceDate;
  NSString *identifier;
  NSString *key;
  TPSContextualEvent *state;
  NSMutableDictionary *observationMap;
  void *v16;
  NSMutableSet *observerIdentifiers;
  void *v18;
  objc_super v20;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v20.receiver = self;
  v20.super_class = (Class)TPSContextualEvent;
  -[TPSSerializableObject debugDescription](&v20, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("\n %@ = %lu\n"), CFSTR("status"), self->_status);
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %ld\n"), CFSTR("type"), self->_type);
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %d\n"), CFSTR("minObservations"), self->_minObservationCount);
  lookBackDays = self->_lookBackDays;
  if ((unint64_t)(lookBackDays - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %ld\n"), CFSTR("lookBackDays"), lookBackDays);
  daysSinceLastMajorUpdate = self->_daysSinceLastMajorUpdate;
  if (daysSinceLastMajorUpdate != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %ld\n"), CFSTR("daysSinceLastMajorUpdate"), daysSinceLastMajorUpdate);
  userInfoPersistent = self->_userInfoPersistent;
  if (userInfoPersistent)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("userInfoPersistent"), userInfoPersistent);
  bookmark = self->_bookmark;
  if (bookmark)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("bookmark"), bookmark);
  matchedDate = self->_matchedDate;
  if (matchedDate)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("matchedDate"), matchedDate);
  eventSinceDate = self->_eventSinceDate;
  if (eventSinceDate)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("eventSinceDate"), eventSinceDate);
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("id"), identifier);
  key = self->_key;
  if (key)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("key"), key);
  state = self->_state;
  if (state)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("state"), state);
  observationMap = self->_observationMap;
  if (observationMap)
  {
    -[NSMutableDictionary debugDescription](observationMap, "debugDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("observationMap"), v16);

  }
  observerIdentifiers = self->_observerIdentifiers;
  if (observerIdentifiers)
  {
    -[NSMutableSet debugDescription](observerIdentifiers, "debugDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("observerIdentifiers"), v18);

  }
  return v5;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setLookBackDays:(int64_t)a3
{
  self->_lookBackDays = a3;
}

- (void)setDaysSinceLastMajorUpdate:(int64_t)a3
{
  self->_daysSinceLastMajorUpdate = a3;
}

- (unsigned)minObservationCount
{
  return self->_minObservationCount;
}

- (void)setMinObservationCount:(unsigned int)a3
{
  self->_minObservationCount = a3;
}

- (NSDictionary)userInfoQuery
{
  return self->_userInfoQuery;
}

- (void)setUserInfoQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)userInfoPersistent
{
  return self->_userInfoPersistent;
}

- (void)setUserInfoPersistent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)matchedDate
{
  return self->_matchedDate;
}

- (void)setMatchedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setEventSinceDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (TPSContextualEventBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (TPSContextualEvent)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSMutableDictionary)observationMap
{
  return self->_observationMap;
}

- (void)setObservationMap:(id)a3
{
  objc_storeStrong((id *)&self->_observationMap, a3);
}

- (NSMutableSet)observerIdentifiers
{
  return self->_observerIdentifiers;
}

- (void)setObserverIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_observerIdentifiers, a3);
}

@end
