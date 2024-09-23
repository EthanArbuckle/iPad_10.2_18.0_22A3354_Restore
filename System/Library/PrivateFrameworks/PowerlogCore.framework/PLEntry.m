@implementation PLEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sem, 0);
  objc_storeStrong((id *)&self->_entryKey, 0);
  objc_storeStrong((id *)&self->_entryDate, 0);
  objc_storeStrong((id *)&self->_entryDefinition, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

- (NSDate)entryDate
{
  return self->_entryDate;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[PLEntry sem](self, "sem");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[PLEntry dictionary](self, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v6);

  -[PLEntry sem](self, "sem");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v9);

}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;

  v4 = a3;
  -[PLEntry sem](self, "sem");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  -[PLEntry dictionary](self, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {

    goto LABEL_6;
  }
  if (!v7)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("timestamp")))
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      -[PLEntry entryDate](self, "entryDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSince1970");
      objc_msgSend(v9, "numberWithDouble:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_13;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("entryDate")))
    {
      -[PLEntry entryDate](self, "entryDate");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v7 = (void *)v11;
      goto LABEL_13;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("ID")) & 1) != 0
      || objc_msgSend(v4, "isEqualToString:", CFSTR("entryID")))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[PLEntry entryID](self, "entryID"));
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
LABEL_6:
    v7 = 0;
  }
LABEL_13:
  -[PLEntry sem](self, "sem");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v12);

  return v7;
}

- (OS_dispatch_semaphore)sem
{
  OS_dispatch_semaphore *sem;
  void *v4;
  void *v5;
  OS_dispatch_semaphore *v6;
  OS_dispatch_semaphore *v7;
  OS_dispatch_semaphore *v8;
  OS_dispatch_semaphore *v9;
  OS_dispatch_semaphore *v10;
  void *v11;
  void *v12;
  OS_dispatch_semaphore *v13;

  if (sem_onceToken != -1)
    dispatch_once(&sem_onceToken, &__block_literal_global_20_1);
  dispatch_semaphore_wait((dispatch_semaphore_t)sem_masterSem, 0xFFFFFFFFFFFFFFFFLL);
  sem = self->_sem;
  if (!sem)
  {
    v4 = (void *)sem_entryKeyToSem;
    -[PLEntry entryKey](self, "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (OS_dispatch_semaphore *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sem;
    self->_sem = v6;

    sem = self->_sem;
    if (!sem)
    {
      v8 = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
      v9 = self->_sem;
      self->_sem = v8;

      v10 = self->_sem;
      v11 = (void *)sem_entryKeyToSem;
      -[PLEntry entryKey](self, "entryKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

      sem = self->_sem;
    }
  }
  v13 = sem;
  dispatch_semaphore_signal((dispatch_semaphore_t)sem_masterSem);
  return v13;
}

- (NSMutableDictionary)dictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (signed)formaterForKey:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  signed __int16 v13;
  void *v14;

  v4 = a3;
  -[PLEntry entryKey](self, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v5);

  if (v6)
  {
    -[PLEntry entryKey](self, "entryKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSEntryKey subsystemForEntryKey:](PPSEntryKey, "subsystemForEntryKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLEntry entryKey](self, "entryKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSEntryKey categoryForEntryKey:](PPSEntryKey, "categoryForEntryKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D70A08], "getMetadataForSubsystem:category:name:", v8, v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "datatype"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[PLValueUtilties formatterFromDataType:](PLValueUtilties, "formatterFromDataType:", v12);

  }
  else
  {
    -[PLEntry definitionForKey:](self, "definitionForKey:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v13 = objc_msgSend(v8, "shortValue");
    else
      v13 = 0x8000;
  }

  return v13;
}

- (NSString)entryKey
{
  return self->_entryKey;
}

- (id)definitionForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PLEntry entryDefinition](self, "entryDefinition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Keys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)entryDefinition
{
  NSDictionary *entryDefinition;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  entryDefinition = self->_entryDefinition;
  if (!entryDefinition)
  {
    -[PLEntry entryKey](self, "entryKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLEntryDefinition definitionForEntryKey:](PLEntryDefinition, "definitionForEntryKey:", v4);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_entryDefinition;
    self->_entryDefinition = v5;

    entryDefinition = self->_entryDefinition;
  }
  return entryDefinition;
}

- (void)checkOverridesEntryDateWithNowDate:(id)a3
{
  void *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[PLEntry entryDefinition](self, "entryDefinition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PLEntryDefinition overridesEntryDateForEntryDefinition:](PLEntryDefinition, "overridesEntryDateForEntryDefinition:", v4);

  if (v5)
  {
    v6 = (uint64_t)v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (id)v6;
    -[PLEntry setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v6, CFSTR("timestampLogged"));
  }

}

- (NSArray)definedKeys
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;

  -[PLEntry entryKey](self, "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v3);

  if (v4)
  {
    -[PLEntry entryKey](self, "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSEntryKey allBaseKeysForEntryKey:](PPSEntryKey, "allBaseKeysForEntryKey:", v5);
  }
  else
  {
    -[PLEntry entryDefinition](self, "entryDefinition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLEntryDefinition allKeysForEntryDefinition:](PLEntryDefinition, "allKeysForEntryDefinition:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (BOOL)writeToDB
{
  return self->_writeToDB;
}

- (int64_t)entryID
{
  return self->_entryID;
}

- (BOOL)existsInDB
{
  return self->_existsInDB;
}

- (void)setEntryID:(int64_t)a3
{
  self->_entryID = a3;
}

- (id)subEntryKey
{
  void *v3;
  void *v4;
  void *v5;

  -[PLEntry entryDefinition](self, "entryDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLEntryDefinition subEntryKeyKeyForEntryDefinition:](PLEntryDefinition, "subEntryKeyKeyForEntryDefinition:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (PLEntry)initWithEntryKey:(id)a3 withRawData:(id)a4
{
  id v7;
  id v8;
  PLEntry *v9;
  PLEntry *v10;
  NSDate *v11;
  uint64_t v12;
  NSDate *entryDate;

  v7 = a3;
  v8 = a4;
  v9 = -[PLEntry init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entryKey, a3);
    -[PLEntry setObjectsFromRawData:](v10, "setObjectsFromRawData:", v8);
    if (v10->_entryDate)
    {
      v11 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v12 = objc_claimAutoreleasedReturnValue();
      entryDate = v10->_entryDate;
      v10->_entryDate = (NSDate *)v12;

      v11 = v10->_entryDate;
    }
    -[PLEntry checkOverridesEntryDateWithNowDate:](v10, "checkOverridesEntryDateWithNowDate:", v11);
  }

  return v10;
}

- (void)setObjectsFromRawData:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSDate *v10;
  void *entryDate;
  void *v12;
  NSDate *v13;
  NSDate *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  if (v4)
  {
    v15 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v15;
    if ((isKindOfClass & 1) == 0)
    {
      -[PLEntry entryDefinition](self, "entryDefinition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Keys"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __33__PLEntry_setObjectsFromRawData___block_invoke;
      v16[3] = &unk_1E6A53450;
      v16[4] = self;
      v8 = v15;
      v17 = v8;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v16);
      objc_msgSend(v8, "objectForKey:", CFSTR("entryDate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entryDate"));
        v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
        entryDate = self->_entryDate;
        self->_entryDate = v10;
      }
      else
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("__pl_internal_timeSensitiveSystemDate"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
LABEL_8:

          v4 = v15;
          goto LABEL_9;
        }
        objc_msgSend(v8, "objectForKey:", CFSTR("__pl_internal_timeSensitiveSystemDate"));
        entryDate = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(entryDate, "convertFromSystemToMonotonic");
        v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
        v14 = self->_entryDate;
        self->_entryDate = v13;

      }
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (void)setEntryDate:(id)a3
{
  objc_storeStrong((id *)&self->_entryDate, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v4 = objc_alloc((Class)objc_opt_class());
  -[PLEntry entryKey](self, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntry entryDate](self, "entryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithEntryKey:withDate:", v5, v6);

  -[PLEntry dictionary](self, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __24__PLEntry_copyWithZone___block_invoke;
  v11[3] = &unk_1E6A53478;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);

  return v9;
}

- (void)setWriteToDB:(BOOL)a3
{
  self->_writeToDB = a3;
}

- (BOOL)hasDynamicKeys
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  -[PLEntry entryKey](self, "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v3);

  if (v4)
  {
    -[PLEntry entryKey](self, "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PPSEntryKey hasDynamicKeys:](PPSEntryKey, "hasDynamicKeys:", v5);
  }
  else
  {
    -[PLEntry entryDefinition](self, "entryDefinition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PLEntryDefinition hasDynamicKeysForEntryDefinition:](PLEntryDefinition, "hasDynamicKeysForEntryDefinition:", v5);
  }
  v7 = v6;

  return v7;
}

- (BOOL)hasArrayKeys
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  -[PLEntry entryKey](self, "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v3);

  if (v4)
  {
    -[PLEntry entryKey](self, "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PPSEntryKey hasArrayKeys:](PPSEntryKey, "hasArrayKeys:", v5);
  }
  else
  {
    -[PLEntry entryDefinition](self, "entryDefinition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PLEntryDefinition hasArrayKeysForEntryDefinition:](PLEntryDefinition, "hasArrayKeysForEntryDefinition:", v5);
  }
  v7 = v6;

  return v7;
}

- (void)setExistsInDB:(BOOL)a3
{
  self->_existsInDB = a3;
}

- (PLEntry)initWithEntryKey:(id)a3
{
  id v5;
  PLEntry *v6;
  uint64_t v7;
  NSDate *entryDate;

  v5 = a3;
  v6 = -[PLEntry init](self, "init");
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v7 = objc_claimAutoreleasedReturnValue();
    entryDate = v6->_entryDate;
    v6->_entryDate = (NSDate *)v7;

    objc_storeStrong((id *)&v6->_entryKey, a3);
    -[PLEntry checkOverridesEntryDateWithNowDate:](v6, "checkOverridesEntryDateWithNowDate:", v6->_entryDate);
  }

  return v6;
}

- (PLEntry)initWithEntryKey:(id)a3 withDate:(id)a4
{
  id v7;
  id v8;
  PLEntry *v9;
  PLEntry *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[PLEntry init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entryDate, a4);
    objc_storeStrong((id *)&v10->_entryKey, a3);
    -[PLEntry checkOverridesEntryDateWithNowDate:](v10, "checkOverridesEntryDateWithNowDate:", 0);
  }

  return v10;
}

- (PLEntry)initWithEntryDate:(id)a3
{
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLEntry;
  v3 = -[PLEntry init](&v8, sel_init, a3);
  if (v3)
  {
    if (initWithEntryDate__onceToken != -1)
      dispatch_once(&initWithEntryDate__onceToken, &__block_literal_global_21_0);
    v4 = objc_opt_new();
    v5 = (void *)*((_QWORD *)v3 + 2);
    *((_QWORD *)v3 + 2) = v4;

    v6 = (void *)*((_QWORD *)v3 + 3);
    *((_QWORD *)v3 + 3) = 0;

    *((_QWORD *)v3 + 6) = -1;
    *(_WORD *)(v3 + 9) = 256;
  }
  return (PLEntry *)v3;
}

- (PLEntry)init
{
  return -[PLEntry initWithEntryDate:](self, "initWithEntryDate:", 0);
}

- (BOOL)isErrorEntry
{
  return self->_isErrorEntry;
}

- (BOOL)filterEntryLogging
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  -[PLEntry entryKey](self, "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v3);

  if (v4)
  {
    -[PLEntry entryKey](self, "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PPSEntryKey filterEntryLoggingForEntryKey:](PPSEntryKey, "filterEntryLoggingForEntryKey:", v5);
  }
  else
  {
    -[PLEntry entryDefinition](self, "entryDefinition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PLEntryDefinition filterEntryLoggingForEntryDefinition:](PLEntryDefinition, "filterEntryLoggingForEntryDefinition:", v5);
  }
  v7 = v6;

  return v7;
}

- (BOOL)hasDMAKeys
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  BOOL v6;
  BOOL v7;

  -[PLEntry entryKey](self, "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v3);

  if (v4)
  {
    -[PLEntry entryKey](self, "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PPSEntryKey hasDMAKeys:](PPSEntryKey, "hasDMAKeys:", v5);
  }
  else
  {
    -[PLEntry entryDefinition](self, "entryDefinition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[PLEntryDefinition hasDMAKeysForEntryDefinition:](PLEntryDefinition, "hasDMAKeysForEntryDefinition:", v5);
  }
  v7 = v6;

  return v7;
}

- (BOOL)isPPSEnabled
{
  void *v2;
  BOOL v3;

  -[PLEntry entryKey](self, "entryKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v2);

  return v3;
}

- (NSArray)dynamicKeys
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PLEntry entryKey](self, "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v3);

  if (v4)
  {
    -[PLEntry entryKey](self, "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSEntryKey allDynamicKeysForEntryKey:](PPSEntryKey, "allDynamicKeysForEntryKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C99DE8];
    -[PLEntry keys](self, "keys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithArray:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLEntry definedKeys](self, "definedKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectsInArray:", v9);

    if (objc_msgSend(v6, "containsObject:", CFSTR("timestampLogged")))
      objc_msgSend(v6, "removeObject:", CFSTR("timestampLogged"));
  }
  return (NSArray *)v6;
}

void __30__PLEntry_setObjectsFromData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("Type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shortValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_msgSend(v7, "isNil") & 1) == 0)
    {
      v15 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v7, "doubleValue");
      objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
      v16 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v16;
    }
  }
  else if (!(_WORD)v6 && (int)objc_msgSend(*(id *)(a1 + 40), "staticArraySizeForKey:", v17) >= 1 && !v7)
  {
    v7 = (void *)objc_opt_new();
    v8 = objc_msgSend(*(id *)(a1 + 40), "staticArraySizeForKey:", v17);
    if (v8 >= 1)
    {
      v9 = v8;
      v10 = 0;
      do
      {
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("_%d"), v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v7, "addObject:", v13);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = (v10 + 1);
      }
      while (v9 != (_DWORD)v10);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v17);

}

void __33__PLEntry_setObjectsFromRawData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CalculatedValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "BOOLValue") & 1) != 0)
  {
LABEL_15:

    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shortValue");

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("KeyValuePath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("KeyValuePath"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "valueForKeyPath:", v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v18;
    if (v6 && v9 == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isCFAbsoluteTime"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "BOOLValue");

        v16 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v6, "doubleValue");
        if (v15)
          objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
        else
          objc_msgSend(v16, "dateWithTimeIntervalSince1970:");
        v17 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v17;
      }
      v13 = v18;
    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v13);
    goto LABEL_15;
  }
LABEL_16:

}

uint64_t __24__PLEntry_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

- (id)initEntryWithData:(id)a3
{
  id v4;
  void *v5;
  PLEntry *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLEntry initWithEntryKey:withData:](self, "initWithEntryKey:withData:", v5, v4);

  return v6;
}

+ (id)entryWithEntryKey:(id)a3 withData:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  PLEntry *v8;
  PLEntry *v9;

  v5 = a3;
  v6 = a4;
  v7 = +[PLEntry classForEntryKey:](PLEntry, "classForEntryKey:", v5);
  if (v7 == (objc_class *)objc_opt_class())
    v8 = -[PLEntry initWithEntryKey:withData:]([PLEntry alloc], "initWithEntryKey:withData:", v5, v6);
  else
    v8 = (PLEntry *)objc_msgSend([v7 alloc], "initEntryWithData:", v6);
  v9 = v8;

  return v9;
}

+ (Class)classForEntryKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (classForEntryKey__onceToken != -1)
    dispatch_once(&classForEntryKey__onceToken, &__block_literal_global_11);
  objc_msgSend((id)_entryKeyToClass, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend((id)_entryKeyToClass, "objectForKeyedSubscript:", v3);
  else
    objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

- (PLEntry)initWithEntryKey:(id)a3 withData:(id)a4
{
  id v7;
  id v8;
  PLEntry *v9;
  PLEntry *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDate *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  NSDate *entryDate;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v7 = a3;
  v8 = a4;
  v9 = -[PLEntry init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entryKey, a3);
    -[PLEntry setObjectsFromData:](v10, "setObjectsFromData:", v8);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_entryID = objc_msgSend(v11, "longLongValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_5;
    v13 = (void *)v12;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timestamp"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 == v15)
    {
LABEL_5:
      -[PLEntry entryDefinition](v10, "entryDefinition");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Configs"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AllowNilTimestamp"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "BOOLValue");

      if (v23)
      {
        entryDate = v10->_entryDate;
        v10->_entryDate = 0;

      }
      else if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** ERROR *** missing timestamp from Database record entryKey=%@ data=%@"), v7, v8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry initWithEntryKey:withData:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v27, v28, 275);

        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timestamp"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      objc_msgSend(v16, "dateWithTimeIntervalSince1970:");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v10->_entryDate;
      v10->_entryDate = (NSDate *)v18;

    }
    if (+[PLEntryDefinition isAggregateForEntryKey:](PLEntryDefinition, "isAggregateForEntryKey:", v7))
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timeInterval"));
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timeInterval"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32 != v33)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("timeInterval"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLEntry setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v34, CFSTR("timeInterval"));

        }
      }
    }
  }

  return v10;
}

- (void)setObjectsFromData:(id)a3
{
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PLEntry *v11;

  v8 = a3;
  -[PLEntry entryKey](self, "entryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v4);

  if (v5)
  {
    -[PLEntry setObjectsUsingMetricsFromData:](self, "setObjectsUsingMetricsFromData:", v8);
  }
  else
  {
    -[PLEntry entryDefinition](self, "entryDefinition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Keys"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __30__PLEntry_setObjectsFromData___block_invoke;
    v9[3] = &unk_1E6A53450;
    v10 = v8;
    v11 = self;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
}

- (NSArray)arrayKeys
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;

  -[PLEntry entryKey](self, "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v3);

  if (v4)
  {
    -[PLEntry entryKey](self, "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSEntryKey allArrayKeysForEntryKey:](PPSEntryKey, "allArrayKeysForEntryKey:", v5);
  }
  else
  {
    -[PLEntry entryDefinition](self, "entryDefinition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLEntryDefinition arrayKeysForEntryDefinition:](PLEntryDefinition, "arrayKeysForEntryDefinition:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (int)staticArraySizeForKey:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v15;
  void *v16;

  v4 = a3;
  -[PLEntry entryKey](self, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v5);

  if (v6)
  {
    -[PLEntry entryKey](self, "entryKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSEntryKey subsystemForEntryKey:](PPSEntryKey, "subsystemForEntryKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLEntry entryKey](self, "entryKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSEntryKey categoryForEntryKey:](PPSEntryKey, "categoryForEntryKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D70A08], "getMetadataForSubsystem:category:name:", v8, v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11
      && objc_msgSend(v11, "auxiliaryType") == 3
      && objc_msgSend(v12, "fixedArraySize"))
    {
      v13 = objc_msgSend(v12, "fixedArraySize");
    }
    else
    {
      v13 = -1;
    }

    goto LABEL_10;
  }
  if (!-[PLEntry formaterForKey:](self, "formaterForKey:", v4))
  {
    -[PLEntry definitionForKey:](self, "definitionForKey:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("TypeArraySize"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[PLEntry definitionForKey:](self, "definitionForKey:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TypeArraySize"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "intValue");
LABEL_10:

      goto LABEL_11;
    }
  }
  v13 = -1;
LABEL_11:

  return v13;
}

- (int64_t)compare:(id)a3
{
  return -[PLEntry compare:options:](self, "compare:options:", a3, 0);
}

- (int64_t)compare:(id)a3 options:(signed __int16)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  char isKindOfClass;
  void *v71;
  char v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  double v78;
  void *v79;
  char v80;
  void *v81;
  void *v82;
  uint64_t v83;
  char v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  BOOL v97;
  void *v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v112;
  void *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  void *v117;
  void *v118;
  objc_class *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  void *v130;
  void *v131;
  double v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  double v137;
  double v138;
  void *v139;
  void *v140;
  double v141;
  double v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  NSObject *v157;
  void *v158;
  void *v159;
  objc_class *v160;
  void *v161;
  void *v162;
  objc_class *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  const __CFString *v170;
  void *v171;
  const __CFString *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  objc_class *v177;
  void *v178;
  void *v179;
  void *v180;
  objc_class *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  int64_t v193;
  uint64_t v194;
  uint64_t v195;
  int v196;
  void *v197;
  id obj;
  void *v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  uint8_t buf[4];
  void *v205;
  _BYTE v206[128];
  uint64_t v207;

  v4 = a4;
  v207 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLEntry entryDate](self, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  v199 = v6;
  if (v4 == 2 && PLEntryDebug)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("tolerance in play"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 547);

    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    v6 = v199;
  }
  else if (v4 == 1)
  {
    if (!PLEntryDebug)
      goto LABEL_22;
    v15 = (void *)MEMORY[0x1E0CB3940];
    -[PLEntry entryDate](self, "entryDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("PLEntry.compare date: self.date=%@ other.date=%@"), v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "lastPathComponent");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (id)v18;
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v20, v21, 550);

    PLLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
LABEL_17:
    -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
    goto LABEL_18;
  }
  -[PLEntry keys](self, "keys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");
  objc_msgSend(v6, "keys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v24 != v26)
  {
    if (!PLEntryDebug)
      goto LABEL_22;
    v37 = (void *)MEMORY[0x1E0CB3940];
    -[PLEntry keys](self, "keys");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "count");
    objc_msgSend(v6, "keys");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("PLEntry.compare key count: self.count=%lu other.count=%lu"), v39, objc_msgSend(v40, "count"));
    v41 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "lastPathComponent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (id)v41;
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v43, v44, 555);

    PLLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    goto LABEL_17;
  }
  -[PLEntry entryKey](self, "entryKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entryKey");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v27, "caseInsensitiveCompare:", v28);

  if (v29)
  {
    if (!PLEntryDebug)
      goto LABEL_22;
    v30 = (void *)MEMORY[0x1E0CB3940];
    -[PLEntry entryKey](self, "entryKey");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryKey");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("PLEntry.compare key: self.key=%@ other.key=%@"), v31, v32);
    v33 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "lastPathComponent");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    obj = (id)v33;
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v35, v36, 560);

    PLLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      goto LABEL_18;
    goto LABEL_17;
  }
  v196 = v4;
  v193 = v9;
  v202 = 0u;
  v203 = 0u;
  v200 = 0u;
  v201 = 0u;
  -[PLEntry keys](self, "keys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v194 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v206, 16);
  if (!v194)
  {
LABEL_108:

    if (PLEntryDebug)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLEntry.compare NSOrderedSame!"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "lastPathComponent");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v148, v149, 692);

      PLLogCommon();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
      v9 = 0;
LABEL_21:

    }
    else
    {
      v9 = 0;
    }
    goto LABEL_22;
  }
  v195 = *(_QWORD *)v201;
LABEL_25:
  v51 = 0;
  while (1)
  {
    if (*(_QWORD *)v201 != v195)
      objc_enumerationMutation(obj);
    v52 = *(_QWORD *)(*((_QWORD *)&v200 + 1) + 8 * v51);
    -[PLEntry entryDefinition](self, "entryDefinition");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLEntryDefinition keyConfigsForEntryDefinition:](PLEntryDefinition, "keyConfigsForEntryDefinition:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKeyedSubscript:", v52);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("FilterEntryLoggingTolerances"));
    v22 = objc_claimAutoreleasedReturnValue();

    v57 = v196 == 2 && v22 != 0;
    if (PLEntryDebug && v57)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key=%@ toleranceDefinition=%@"), v52, v22);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "lastPathComponent");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v58, v60, v61, 567);

      PLLogCommon();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v205 = v58;
        _os_log_debug_impl(&dword_1B6AB6000, v62, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
    v6 = v199;
    if (v57)
    {
      -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("Ignore"));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v63;
      if (v63 && (objc_msgSend(v63, "BOOLValue") & 1) != 0)
        goto LABEL_85;

    }
    -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v52);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {

    }
    else
    {
      objc_msgSend(v199, "objectForKeyedSubscript:", v52);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v66)
        goto LABEL_86;
    }
    objc_msgSend(v199, "objectForKeyedSubscript:", v52);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v67)
    {
      if (!PLEntryDebug)
        goto LABEL_141;
      v150 = (void *)MEMORY[0x1E0CB3940];
      -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v52);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "objectForKeyedSubscript:", v52);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "stringWithFormat:", CFSTR("PLEntry.compare(%@) nil value: self.value=%@ other.value=%@"), v52, v151, v152);
      v153 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "lastPathComponent");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v153, v155, v156, 579);

      PLLogCommon();
      v157 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
        goto LABEL_114;
      goto LABEL_133;
    }
    -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v52);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "objectForKeyedSubscript:", v52);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      if (!PLEntryDebug)
        goto LABEL_141;
      v158 = (void *)MEMORY[0x1E0CB3940];
      -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v52);
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      v160 = (objc_class *)objc_opt_class();
      NSStringFromClass(v160);
      v161 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v199, "objectForKeyedSubscript:", v52);
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = (objc_class *)objc_opt_class();
      NSStringFromClass(v163);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "stringWithFormat:", CFSTR("PLEntry.compare(%@) class value: self.value.class=%@ other.value.class=%@"), v52, v161, v164);
      v153 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "lastPathComponent");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v153, v166, v167, 584);

      PLLogCommon();
      v157 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
LABEL_131:
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_132:
      v6 = v199;
      goto LABEL_133;
    }
    -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v52);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      objc_opt_class();
      v72 = objc_opt_isKindOfClass();

      -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v52);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v73;
      if ((v72 & 1) != 0)
      {
        objc_msgSend(v73, "doubleValue");
        v76 = v75;

        objc_msgSend(v199, "objectForKeyedSubscript:", v52);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "doubleValue");
      }
      else
      {
        objc_opt_class();
        v84 = objc_opt_isKindOfClass();

        if ((v84 & 1) == 0)
        {
          if (!PLEntryDebug)
            goto LABEL_86;
          v117 = (void *)MEMORY[0x1E0CB3940];
          -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v52);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = (objc_class *)objc_opt_class();
          NSStringFromClass(v119);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "stringWithFormat:", CFSTR("bailing on class %@"), v120);
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "lastPathComponent");
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v64, v122, v123, 603);

          PLLogCommon();
          v116 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
            goto LABEL_84;
LABEL_97:
          *(_DWORD *)buf = 138412290;
          v205 = v64;
          _os_log_debug_impl(&dword_1B6AB6000, v116, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          goto LABEL_84;
        }
        -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v52);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "timeIntervalSince1970");
        v76 = v86;

        objc_msgSend(v199, "objectForKeyedSubscript:", v52);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "timeIntervalSince1970");
      }
      v87 = v78;

      -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("SpecialCase"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      if (v88)
      {
        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("SpecialCase"));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "doubleValue");
        v91 = v90;

        if (PLEntryDebug)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("specialCase! specialCase=%f thisValue=%f otherValue=%f"), *(_QWORD *)&v91, *(_QWORD *)&v76, *(_QWORD *)&v87);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "lastPathComponent");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v92, v94, v95, 608);

          PLLogCommon();
          v96 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v205 = v92;
            _os_log_debug_impl(&dword_1B6AB6000, v96, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v6 = v199;
        }
        v97 = v87 == v91 || v76 == v91;
        if (v97 && v76 != v87)
        {
          if (!PLEntryDebug)
            goto LABEL_141;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("hit specialCase!"));
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v190, "lastPathComponent");
          v191 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v153, v191, v192, 610);

          PLLogCommon();
          v157 = objc_claimAutoreleasedReturnValue();
          v9 = v193;
          if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
            goto LABEL_137;
          goto LABEL_134;
        }
      }
      -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangeBy"));
      v98 = (void *)objc_claimAutoreleasedReturnValue();

      if (v98)
      {
        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangeBy"));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "doubleValue");
        v101 = v100;

        v102 = v76 - v101;
LABEL_70:
        v103 = v76 + v101;
        goto LABEL_73;
      }
      -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangePercent"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      if (v104)
      {
        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangePercent"));
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "doubleValue");
        v107 = v106;

        v102 = v76 - v107 * v76;
        v103 = v76 + v107 * v76;
        goto LABEL_73;
      }
      -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangeByUpper"));
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      if (v124)
      {

LABEL_91:
        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangeByLower"));
        v126 = (void *)objc_claimAutoreleasedReturnValue();

        v102 = v76;
        if (v126)
        {
          -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangeByLower"));
          v127 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "doubleValue");
          v129 = v128;

          v102 = v76 - v129;
        }
        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangeByUpper"));
        v130 = (void *)objc_claimAutoreleasedReturnValue();

        if (v130)
        {
          -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangeByUpper"));
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v131, "doubleValue");
          v101 = v132;

          goto LABEL_70;
        }
LABEL_103:
        v103 = v76;
        goto LABEL_73;
      }
      -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangeByLower"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();

      if (v125)
        goto LABEL_91;
      -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangePercentUpper"));
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      if (v133)
      {

LABEL_99:
        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangePercentLower"));
        v135 = (void *)objc_claimAutoreleasedReturnValue();

        v102 = v76;
        if (v135)
        {
          -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangePercentLower"));
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "doubleValue");
          v138 = v137;

          v102 = v76 - v76 * v138;
        }
        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangePercentUpper"));
        v139 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v139)
          goto LABEL_103;
        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangePercentUpper"));
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v140, "doubleValue");
        v142 = v141;

        v103 = v76 + v76 * v142;
LABEL_73:
        if (PLEntryDebug)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key=%@ thisValue=%f otherValue=%f lowerBound=%f upperBound=%f"), v52, *(_QWORD *)&v76, *(_QWORD *)&v87, *(_QWORD *)&v102, *(_QWORD *)&v103);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "lastPathComponent");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v108, v110, v111, 661);

          PLLogCommon();
          v112 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v112, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v205 = v108;
            _os_log_debug_impl(&dword_1B6AB6000, v112, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v6 = v199;
        }
        if (v102 <= v87 && v87 <= v103)
        {
          if (!PLEntryDebug)
            goto LABEL_86;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inside tolerance"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "lastPathComponent");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v64, v114, v115, 663);

          PLLogCommon();
          v116 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
            goto LABEL_84;
          goto LABEL_97;
        }
        if (!PLEntryDebug)
          goto LABEL_141;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("outside tolerance"));
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "lastPathComponent");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v153, v188, v189, 666);

        PLLogCommon();
        v157 = objc_claimAutoreleasedReturnValue();
        v9 = v193;
        if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
LABEL_137:
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_134:

        goto LABEL_18;
      }
      -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("ChangePercentLower"));
      v134 = (void *)objc_claimAutoreleasedReturnValue();

      if (v134)
        goto LABEL_99;
      if (PLEntryDebug)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bailing on no matched tolerance..."));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v143, "lastPathComponent");
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v64, v144, v145, 657);

        PLLogCommon();
        v116 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
          goto LABEL_97;
LABEL_84:
        v6 = v199;

LABEL_85:
        goto LABEL_86;
      }
      goto LABEL_86;
    }
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {

LABEL_120:
      if (!PLEntryDebug)
        goto LABEL_141;
      v168 = (void *)MEMORY[0x1E0CB3940];
      -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v52);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v170 = CFSTR("YES");
      else
        v170 = CFSTR("NO");
      objc_msgSend(v199, "objectForKeyedSubscript:", v52);
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v172 = CFSTR("YES");
      else
        v172 = CFSTR("NO");
      objc_msgSend(v168, "stringWithFormat:", CFSTR("PLEntry.compare(%@) respondsToSelector: self.respondsToSelector=%@ other.respondsToSelector=%@"), v52, v170, v172);
      v153 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "lastPathComponent");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v153, v174, v175, 681);

      PLLogCommon();
      v157 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
LABEL_114:
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_133:
      v9 = v193;
      goto LABEL_134;
    }
    objc_msgSend(v199, "objectForKeyedSubscript:", v52);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_opt_respondsToSelector();

    if ((v80 & 1) == 0)
      goto LABEL_120;
    -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v52);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "objectForKeyedSubscript:", v52);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v81, "compare:", v82);

    if (v83)
      break;
LABEL_86:

    if (v194 == ++v51)
    {
      v146 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v200, v206, 16);
      v194 = v146;
      if (!v146)
        goto LABEL_108;
      goto LABEL_25;
    }
  }
  if (PLEntryDebug)
  {
    v197 = (void *)MEMORY[0x1E0CB3940];
    -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v52);
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = (objc_class *)objc_opt_class();
    NSStringFromClass(v177);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v52);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "objectForKeyedSubscript:", v52);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v181 = (objc_class *)objc_opt_class();
    NSStringFromClass(v181);
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "objectForKeyedSubscript:", v52);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v197, "stringWithFormat:", CFSTR("PLEntry.compare(%@) value: self.value(%@)=%@ other.value(%@)=%@"), v52, v178, v179, v182, v183);
    v153 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "lastPathComponent");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v153, v185, v186, 673);

    PLLogCommon();
    v157 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v157, OS_LOG_TYPE_DEBUG))
      goto LABEL_131;
    goto LABEL_132;
  }
LABEL_141:
  v9 = v193;
LABEL_18:

  if (PLEntryDebug)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLEntry.compare notSame"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "lastPathComponent");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLEntry compare:options:]");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v47, v48, 689);

    PLLogCommon();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
    goto LABEL_21;
  }
LABEL_22:

  return v9;
}

- (NSMutableArray)keys
{
  void *v2;
  void *v3;

  -[PLEntry dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMutableArray *)v3;
}

- (void)setIsErrorEntry:(BOOL)a3
{
  self->_isErrorEntry = a3;
}

- (NSArray)DMAKeys
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;

  -[PLEntry entryKey](self, "entryKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PPSEntryKey PPSEnabled:](PPSEntryKey, "PPSEnabled:", v3);

  if (v4)
  {
    -[PLEntry entryKey](self, "entryKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PPSEntryKey allDMAKeysForEntryKey:](PPSEntryKey, "allDMAKeysForEntryKey:", v5);
  }
  else
  {
    -[PLEntry entryDefinition](self, "entryDefinition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLEntryDefinition DMAKeysForEntryDefinition:](PLEntryDefinition, "DMAKeysForEntryDefinition:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)loadDynamicKeys
{
  void *v3;
  id v4;

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadDynamicValuesIntoEntry:", self);

}

+ (void)load
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 != objc_opt_class())
    +[PLEntry registerEntry:](PLEntry, "registerEntry:", objc_opt_class());
}

+ (void)registerEntry:(Class)a3
{
  NSObject *v4;
  id v5;

  if (registerEntry__onceToken != -1)
    dispatch_once(&registerEntry__onceToken, &__block_literal_global_42);
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[PLEntry registerEntry:].cold.1(a3, v4);

  v5 = (id)_registeredEntries;
  objc_sync_enter(v5);
  objc_msgSend((id)_registeredEntries, "addObject:", a3);
  objc_sync_exit(v5);

}

void __25__PLEntry_registerEntry___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_registeredEntries;
  _registeredEntries = v0;

}

+ (id)entryWithEntryKey:(id)a3 withRawData:(id)a4
{
  id v5;
  id v6;
  objc_class *v7;
  PLEntry *v8;
  PLEntry *v9;

  v5 = a3;
  v6 = a4;
  v7 = +[PLEntry classForEntryKey:](PLEntry, "classForEntryKey:", v5);
  if (v7 == (objc_class *)objc_opt_class())
    v8 = -[PLEntry initWithEntryKey:withRawData:]([PLEntry alloc], "initWithEntryKey:withRawData:", v5, v6);
  else
    v8 = (PLEntry *)objc_msgSend([v7 alloc], "initEntryWithRawData:", v6);
  v9 = v8;

  return v9;
}

void __28__PLEntry_classForEntryKey___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_new();
  v1 = (void *)_entryKeyToClass;
  _entryKeyToClass = v0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)_registeredEntries;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        v8 = (void *)_entryKeyToClass;
        objc_msgSend(v7, "entryKey", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

+ (id)entryKey
{
  return &stru_1E6A56538;
}

- (BOOL)hasAppIdentifierKeys
{
  void *v2;
  BOOL v3;

  -[PLEntry entryDefinition](self, "entryDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[PLEntryDefinition hasAppIdentifierKeysForEntryDefinition:](PLEntryDefinition, "hasAppIdentifierKeysForEntryDefinition:", v2);

  return v3;
}

void __14__PLEntry_sem__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)sem_masterSem;
  sem_masterSem = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)sem_entryKeyToSem;
  sem_entryKeyToSem = v2;

}

BOOL __29__PLEntry_initWithEntryDate___block_invoke()
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", objc_opt_class());
  PLEntryDebug = result;
  return result;
}

- (id)initEntryWithRawData:(id)a3
{
  id v4;
  void *v5;
  PLEntry *v6;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PLEntry initWithEntryKey:withRawData:](self, "initWithEntryKey:withRawData:", v5, v4);

  return v6;
}

- (NSMutableArray)allValues
{
  void *v2;
  void *v3;

  -[PLEntry dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSMutableArray *)v3;
}

- (void)setDynamicObjectsFromRawData:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PLEntry *v10;

  v7 = a3;
  if (-[PLEntry hasDynamicKeys](self, "hasDynamicKeys"))
  {
    -[PLEntry entryDefinition](self, "entryDefinition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Keys"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__PLEntry_setDynamicObjectsFromRawData___block_invoke;
    v8[3] = &unk_1E6A53450;
    v9 = v5;
    v10 = self;
    v6 = v5;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

void __40__PLEntry_setDynamicObjectsFromRawData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v8 = *(void **)(a1 + 40);
    if ((isKindOfClass & 1) != 0)
      objc_msgSend(v8, "setObjectsFromRawData:", v5);
    else
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v5, v9);
  }

}

- (void)setObjectsUsingMetricsFromData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PLEntry *v10;

  v4 = a3;
  -[PLEntry entryKey](self, "entryKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPSEntryKey metricsForEntryKey:](PPSEntryKey, "metricsForEntryKey:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__PLEntry_setObjectsUsingMetricsFromData___block_invoke;
  v8[3] = &unk_1E6A55B20;
  v9 = v4;
  v10 = self;
  v6 = v4;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __42__PLEntry_setObjectsUsingMetricsFromData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = objc_msgSend(a3, "datatype");
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == 4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && (objc_msgSend(v6, "isNil") & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v6, "doubleValue");
      objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v9);

}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[PLEntry sem](self, "sem");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  -[PLEntry dictionary](self, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v4);

  -[PLEntry sem](self, "sem");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_semaphore_signal(v7);

}

- (BOOL)isKeyDynamic:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[PLEntry hasDynamicKeys](self, "hasDynamicKeys"))
  {
    -[PLEntry definitionForKey:](self, "definitionForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isKeyAggregateValue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[PLEntry definitionForKey:](self, "definitionForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("IsAggregateValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("IsAggregateValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)unitForKey:(id)a3
{
  void *v3;
  void *v4;

  -[PLEntry definitionForKey:](self, "definitionForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Unit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (signed)dataFormatForMetric:(id)a3 auxiliaryMetrics:(id)a4
{
  void *v4;
  void *v5;
  signed __int16 v6;

  if (!a3 || !a4)
    return 0x8000;
  objc_msgSend(a4, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "datatype"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PLValueUtilties formatterFromDataType:](PLValueUtilties, "formatterFromDataType:", v5);

  return v6;
}

- (id)keyValuePathForKey:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PLEntry definitionForKey:](self, "definitionForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("KeyValuePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)descriptionRespectingAllowlist:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  _BOOL4 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD block[4];
  __CFString *v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v25 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB37A0];
  -[PLEntry entryDate](self, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntry entryKey](self, "entryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ [%@]"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PLEntry entryID](self, "entryID") > 0)
    goto LABEL_5;
  v8 = objc_opt_class();
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __42__PLEntry_descriptionRespectingAllowlist___block_invoke;
  block[3] = &unk_1E6A52828;
  block[1] = 3221225472;
  v31 = CFSTR("printID");
  v32 = v8;
  if (descriptionRespectingAllowlist__defaultOnce != -1)
    dispatch_once(&descriptionRespectingAllowlist__defaultOnce, block);
  v9 = descriptionRespectingAllowlist__classDebugEnabled;

  if (v9)
LABEL_5:
    objc_msgSend(v7, "appendFormat:", CFSTR(" ID=%lld; "), -[PLEntry entryID](self, "entryID"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[PLEntry keys](self, "keys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        -[PLEntry objectForKeyedSubscript:](self, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isNil") & 1) != 0)
        {
          objc_msgSend(v7, "appendFormat:", CFSTR(" %@=<unknown>;"), v15);
        }
        else
        {
          if (v25)
          {
            -[PLEntry entryKey](self, "entryKey");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = +[PLUtilities logModeForEntryKey:withKey:andValue:](PLUtilities, "logModeForEntryKey:withKey:andValue:", v17, v15, v16);

            switch(v18)
            {
              case 0:
                break;
              case 1:
                -[PLEntry unitForKey:](self, "unitForKey:", v15);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "appendFormat:", CFSTR(" %@=<private>%@;"), v15, v19, v24);
                goto LABEL_24;
              case 2:
                +[PLUtilities hashString:](PLUtilities, "hashString:", v16);
                v20 = objc_claimAutoreleasedReturnValue();

                v16 = (void *)v20;
                goto LABEL_17;
              case 3:
                goto LABEL_19;
              case 4:
LABEL_17:
                if (v18 == 4)
                {
                  +[PLUtilities hashBundleID:](PLUtilities, "hashBundleID:", v16);
                  v21 = objc_claimAutoreleasedReturnValue();
LABEL_22:
                  v22 = (void *)v21;

                  v16 = v22;
                  break;
                }
LABEL_19:
                if (v18 == 3)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v16, "lastPathComponent");
                    v21 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_22;
                  }
                }
                break;
              default:
                goto LABEL_25;
            }
          }
          -[PLEntry unitForKey:](self, "unitForKey:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "appendFormat:", CFSTR(" %@=%@%@;"), v15, v16, v19);
LABEL_24:

        }
LABEL_25:

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v12);
  }

  objc_msgSend(v7, "appendFormat:", CFSTR(" existsInDB=%i;"), -[PLEntry existsInDB](self, "existsInDB"));
  return v7;
}

BOOL __42__PLEntry_descriptionRespectingAllowlist___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  descriptionRespectingAllowlist__classDebugEnabled = result;
  return result;
}

- (id)description
{
  return -[PLEntry descriptionRespectingAllowlist:](self, "descriptionRespectingAllowlist:", 1);
}

- (id)debugDescription
{
  return -[PLEntry descriptionRespectingAllowlist:](self, "descriptionRespectingAllowlist:", 0);
}

- (id)serialized
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)objc_opt_new();
  -[PLEntry dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __21__PLEntry_serialized__block_invoke;
  v10[3] = &unk_1E6A53478;
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

  -[PLEntry entryDate](self, "entryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[PLEntry entryDate](self, "entryDate");
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("timestamp"));

  -[PLEntry entryKey](self, "entryKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("EntryKey"));

  return v5;
}

void __21__PLEntry_serialized__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(v5, "isNil") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (id)serializedForJSON
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLEntry dictionary](self, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities JSONSanitizeDictionary:](PLUtilities, "JSONSanitizeDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PLEntry entryDate](self, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("timestamp"));

  return v5;
}

+ (id)summarizeAggregateEntries:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryDefinition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AggregateKeys"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "definedKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByRemovingObjectsFromArray:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLEntry summarizeAggregateEntries:withPrimaryKeys:](PLEntry, "summarizeAggregateEntries:withPrimaryKeys:", v3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)summarizeAggregateEntries:(id)a3 withPrimaryKeys:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  uint64_t v19;
  id v20;
  id v21;
  unint64_t v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *i;
  uint64_t v53;
  void *v54;
  void *v55;
  unsigned int v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  BOOL v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t j;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t k;
  uint64_t v83;
  void *v84;
  void *v85;
  double v86;
  void *v87;
  void *v89;
  id v90;
  void *v91;
  id v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  int v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  uint64_t v106;
  id obj;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  _QWORD block[4];
  __CFString *v125;
  uint64_t v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint8_t v129[128];
  uint8_t buf[4];
  uint64_t v131;
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v89 = v5;
  v7 = objc_msgSend(v5, "count");
  v103 = 0;
  if (v6 && v7)
  {
    if (objc_msgSend(v6, "count"))
    {
      v8 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[2] = __53__PLEntry_summarizeAggregateEntries_withPrimaryKeys___block_invoke;
      block[3] = &unk_1E6A52828;
      block[1] = 3221225472;
      v125 = CFSTR("sumarizeAggregate");
      v126 = v8;
      if (summarizeAggregateEntries_withPrimaryKeys__defaultOnce != -1)
        dispatch_once(&summarizeAggregateEntries_withPrimaryKeys__defaultOnce, block);
      v9 = summarizeAggregateEntries_withPrimaryKeys__classDebugEnabled;

      v10 = (void *)objc_opt_new();
      v97 = (void *)objc_opt_new();
      objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "entryDefinition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AggregateKeys"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      v100 = (void *)objc_opt_new();
      v93 = v10;
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("primaryKeys=%@\naggregateKeys=%@"), v6, v91);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLEntry summarizeAggregateEntries:withPrimaryKeys:]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v15, v16, 803);

        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        v10 = v93;
      }
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      obj = v89;
      v90 = v6;
      v95 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v132, 16);
      if (v95)
      {
        v94 = *(_QWORD *)v121;
        v18 = CFSTR("AggregateFunction");
        v98 = v9;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v121 != v94)
              objc_enumerationMutation(obj);
            v102 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v19);
            v20 = v10;
            v96 = v19;
            if (v9)
            {
              v99 = (void *)objc_opt_new();
              if (!objc_msgSend(v6, "count"))
              {
                v21 = v20;
                v105 = 0;
                goto LABEL_41;
              }
            }
            else
            {
              v99 = 0;
              if (!objc_msgSend(v6, "count"))
              {
                v105 = 0;
                goto LABEL_70;
              }
            }
            v22 = 0;
            v105 = 0;
            v23 = 0;
            do
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "objectForKeyedSubscript:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v9)
              {
                objc_msgSend(v6, "objectAtIndexedSubscript:", v22);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "setObject:forKeyedSubscript:", v25, v26);

              }
              objc_msgSend(v20, "objectForKeyedSubscript:", v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v27)
              {
                if (v22 == objc_msgSend(v6, "count") - 1)
                {
                  v28 = (void *)objc_msgSend(v102, "copy");
                  objc_msgSend(v28, "entryKey");
                  v29 = v20;
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PLEntryKey baseEntryKeyForEntryKey:](PLEntryKey, "baseEntryKeyForEntryKey:", v30);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "setEntryKey:", v31);

                  v20 = v29;
                  v9 = v98;
                  objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v25);
                  objc_msgSend(v97, "addObject:", v28);
                  v23 = 1;
                }
                else
                {
                  v28 = (void *)objc_opt_new();
                  objc_msgSend(v20, "setObject:forKeyedSubscript:", v28, v25);
                }

              }
              v32 = objc_msgSend(v6, "count") - 1;
              objc_msgSend(v20, "objectForKeyedSubscript:", v25);
              v33 = objc_claimAutoreleasedReturnValue();
              v34 = v105;
              if (v22 == v32)
                v35 = v105;
              else
                v35 = v20;
              if (v22 == v32)
                v34 = (void *)v33;
              else
                v20 = (id)v33;
              v105 = v34;

              ++v22;
            }
            while (objc_msgSend(v6, "count") > v22);
            if ((v23 & 1) != 0)
            {
              if (v9)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("first hit for %@"), v99);
                v36 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "lastPathComponent");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLEntry summarizeAggregateEntries:withPrimaryKeys:]");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v101 = (id)v36;
                +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v36, v38, v39, 838);

                PLLogCommon();
                v40 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v131 = v36;
                  _os_log_debug_impl(&dword_1B6AB6000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
                v19 = v96;
                v10 = v93;
                goto LABEL_48;
              }
LABEL_73:
              v19 = v96;
              goto LABEL_70;
            }
            if (!v9)
            {
              if (!v105)
              {
                v105 = 0;
                goto LABEL_73;
              }
              goto LABEL_51;
            }
            v21 = v20;
LABEL_41:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aggregating... for %@"), v99);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "lastPathComponent");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLEntry summarizeAggregateEntries:withPrimaryKeys:]");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v43, v44, 842);

            PLLogCommon();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v131 = (uint64_t)v41;
              _os_log_debug_impl(&dword_1B6AB6000, v45, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v20 = v21;
            if (!v105)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("We should not be here!"));
              v46 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLEntry.m");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "lastPathComponent");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PLEntry summarizeAggregateEntries:withPrimaryKeys:]");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v101 = (id)v46;
              +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v46, v48, v49, 864);

              PLLogCommon();
              v40 = objc_claimAutoreleasedReturnValue();
              v9 = v98;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v131 = v46;
                _os_log_debug_impl(&dword_1B6AB6000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }
              v105 = 0;
              v10 = v93;
              v19 = v96;
LABEL_48:

              goto LABEL_69;
            }
            v9 = v98;
LABEL_51:
            v19 = v96;
            v118 = 0u;
            v119 = 0u;
            v116 = 0u;
            v117 = 0u;
            v101 = v91;
            v104 = (id)objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
            if (!v104)
              goto LABEL_69;
            v92 = v20;
            v50 = *(_QWORD *)v117;
            v51 = v102;
            do
            {
              for (i = 0; i != v104; i = (char *)i + 1)
              {
                if (*(_QWORD *)v117 != v50)
                  objc_enumerationMutation(v101);
                v53 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)i);
                objc_msgSend(v51, "definitionForKey:", v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v54, "objectForKeyedSubscript:", v18);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                v56 = objc_msgSend(v55, "shortValue");

                if (v56 > 1)
                {
                  if (v56 == 3)
                  {
                    objc_msgSend(v105, "objectForKeyedSubscript:", v53);
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v51, "objectForKeyedSubscript:", v53);
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    v71 = objc_msgSend(v69, "compare:", v70);

                    v68 = v71 == -1;
                  }
                  else
                  {
                    if ((unsigned __int16)v56 != 2)
                      goto LABEL_66;
                    objc_msgSend(v105, "objectForKeyedSubscript:", v53);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v51, "objectForKeyedSubscript:", v53);
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    v67 = objc_msgSend(v65, "compare:", v66);

                    v68 = v67 == 1;
                  }
                  v51 = v102;
                  if (v68)
                  {
                    objc_msgSend(v102, "objectForKeyedSubscript:", v53);
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v105, "setObject:forKeyedSubscript:", v72, v53);

                  }
                }
                else
                {
                  v57 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v105, "objectForKeyedSubscript:", v53);
                  v58 = v18;
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "doubleValue");
                  v61 = v60;
                  objc_msgSend(v51, "objectForKeyedSubscript:", v53);
                  v62 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v62, "doubleValue");
                  objc_msgSend(v57, "numberWithDouble:", v61 + v63);
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v105, "setObject:forKeyedSubscript:", v64, v53);

                  v51 = v102;
                  v18 = v58;
                  if (v56 == 1)
                    objc_msgSend(v100, "addObject:", v53);
                }
LABEL_66:

              }
              v104 = (id)objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v116, v129, 16);
            }
            while (v104);
            v6 = v90;
            v20 = v92;
            v10 = v93;
            v9 = v98;
            v19 = v96;
LABEL_69:

LABEL_70:
            ++v19;
          }
          while (v19 != v95);
          v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v120, v132, 16);
          v95 = v73;
        }
        while (v73);
      }

      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v103 = v97;
      v74 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v112, v128, 16);
      if (v74)
      {
        v75 = v74;
        v106 = *(_QWORD *)v113;
        do
        {
          for (j = 0; j != v75; ++j)
          {
            if (*(_QWORD *)v113 != v106)
              objc_enumerationMutation(v103);
            v77 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
            v108 = 0u;
            v109 = 0u;
            v110 = 0u;
            v111 = 0u;
            v78 = v100;
            v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v108, v127, 16);
            if (v79)
            {
              v80 = v79;
              v81 = *(_QWORD *)v109;
              do
              {
                for (k = 0; k != v80; ++k)
                {
                  if (*(_QWORD *)v109 != v81)
                    objc_enumerationMutation(v78);
                  v83 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * k);
                  v84 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v77, "objectForKeyedSubscript:", v83);
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v85, "doubleValue");
                  objc_msgSend(v84, "numberWithDouble:", v86 / (double)(unint64_t)objc_msgSend(obj, "count"));
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "setObject:forKeyedSubscript:", v87, v83);

                }
                v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v108, v127, 16);
              }
              while (v80);
            }

          }
          v75 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v112, v128, 16);
        }
        while (v75);
      }

      v6 = v90;
    }
    else
    {
      v103 = 0;
    }
  }

  return v103;
}

BOOL __53__PLEntry_summarizeAggregateEntries_withPrimaryKeys___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:forKey:](PLDefaults, "isClassDebugEnabled:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  summarizeAggregateEntries_withPrimaryKeys__classDebugEnabled = result;
  return result;
}

- (void)setDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setEntryDefinition:(id)a3
{
  objc_storeStrong((id *)&self->_entryDefinition, a3);
}

- (void)setEntryKey:(id)a3
{
  objc_storeStrong((id *)&self->_entryKey, a3);
}

- (void)setSem:(id)a3
{
  objc_storeStrong((id *)&self->_sem, a3);
}

+ (void)registerEntry:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  id v4;
  id v5;
  uint8_t v6[12];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "superclass");
  OUTLINED_FUNCTION_2();
  v7 = 2112;
  v8 = a1;
  v5 = v4;
  _os_log_debug_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_DEBUG, "%@ %@ registered", v6, 0x16u);

}

@end
