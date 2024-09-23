@implementation PCSMTT

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCSMTT)init
{
  PCSMTT *v2;
  uint64_t v3;
  NSUUID *UUID;
  uint64_t v5;
  NSMutableArray *completedPoints;
  PCSMTT *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PCSMTT;
  v2 = -[PCSMTT init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v3;

    objc_storeStrong((id *)&v2->_parentUUID, v2->_UUID);
    v5 = objc_opt_new();
    completedPoints = v2->_completedPoints;
    v2->_completedPoints = (NSMutableArray *)v5;

    -[PCSMTT start](v2, "start");
    v7 = v2;
  }

  return v2;
}

- (PCSMTT)initWithMTT:(id)a3
{
  id v4;
  PCSMTT *v5;
  uint64_t v6;
  NSUUID *parentUUID;

  v4 = a3;
  v5 = -[PCSMTT init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "UUID");
    v6 = objc_claimAutoreleasedReturnValue();
    parentUUID = v5->_parentUUID;
    v5->_parentUUID = (NSUUID *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("[MTT:%@:%lf"), self->_UUID, *(_QWORD *)&self->_time);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_completedPoints, "count"))
  {
    objc_msgSend(v3, "appendString:", CFSTR("<"));
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = self->_completedPoints;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "appendFormat:", CFSTR("%@"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

    objc_msgSend(v3, "appendString:", CFSTR(">"));
  }
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[PCSMTT completedPoints](self, "completedPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PCSMTT completedPoints](self, "completedPoints", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "jsonDict");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v8);
  }

  v23[0] = CFSTR("uuid");
  -[PCSMTT UUID](self, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  v23[1] = CFSTR("time");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[PCSMTT time](self, "time");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v15;
  v24[2] = v5;
  v23[2] = CFSTR("completedPoints");
  v23[3] = CFSTR("returnedExistingIdentity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PCSMTT returnedExistingIdentity](self, "returnedExistingIdentity"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)start
{
  NSDate *v3;
  NSDate *startTime;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startTime = self->_startTime;
  self->_startTime = v3;

}

- (void)stop
{
  void *v3;
  double v4;
  NSDate *startTime;

  if (self->_startTime)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", self->_startTime);
    self->_time = v4 + self->_time;

    startTime = self->_startTime;
    self->_startTime = 0;

  }
}

- (void)measure:(id)a3 block:(id)a4
{
  uint64_t (**v6)(_QWORD);
  uint64_t v7;
  id v8;

  v6 = (uint64_t (**)(_QWORD))a4;
  -[PCSMTT measurePoint:](self, "measurePoint:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6[2](v6);

  objc_msgSend(v8, "complete:", v7);
}

- (void)measure:(id)a3 success:(BOOL)a4 time:(double)a5
{
  _BOOL8 v6;
  id v8;

  v6 = a4;
  -[PCSMTT measurePoint:](self, "measurePoint:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "complete:time:", v6, a5);
  -[PCSMTT completePoint:](self, "completePoint:", v8);

}

- (id)measurePoint:(id)a3
{
  id v4;
  PCSMTTPoint *v5;

  v4 = a3;
  v5 = -[PCSMTTPoint initWithMTT:name:]([PCSMTTPoint alloc], "initWithMTT:name:", self, v4);

  return v5;
}

- (void)completePoint:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (completePoint__onceToken != -1)
    dispatch_once(&completePoint__onceToken, &__block_literal_global_16);
  v5 = (void *)completePoint__log;
  if (os_log_type_enabled((os_log_t)completePoint__log, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[PCSMTT UUID](self, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCSMTT parentUUID](self, "parentUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "time");
    v11 = 138413314;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2048;
    v18 = v10;
    v19 = 1024;
    v20 = objc_msgSend(v4, "success");
    _os_log_impl(&dword_1A9508000, v6, OS_LOG_TYPE_DEFAULT, "measure:%@:%@:%@:%f:%d", (uint8_t *)&v11, 0x30u);

  }
  -[NSMutableArray addObject:](self->_completedPoints, "addObject:", v4);

}

void __24__PCSMTT_completePoint___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("PCSMTT", "PCSMTT");
  v1 = (void *)completePoint__log;
  completePoint__log = (uint64_t)v0;

}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *UUID;
  id v5;
  void *v6;
  id v7;

  UUID = self->_UUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", UUID, CFSTR("UUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parentUUID, CFSTR("parentUUID"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_time);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("time"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_completedPoints, CFSTR("points"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PCSMTT returnedExistingIdentity](self, "returnedExistingIdentity"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("returnedExistingIdentity"));

}

- (PCSMTT)initWithCoder:(id)a3
{
  id v4;
  PCSMTT *v5;
  uint64_t v6;
  NSUUID *UUID;
  uint64_t v8;
  NSUUID *parentUUID;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSMutableArray *completedPoints;
  void *v17;
  PCSMTT *v18;

  v4 = a3;
  v5 = -[PCSMTT init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentUUID"));
    v8 = objc_claimAutoreleasedReturnValue();
    parentUUID = v5->_parentUUID;
    v5->_parentUUID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("time"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v5->_time = v11;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("points"));
    v15 = objc_claimAutoreleasedReturnValue();
    completedPoints = v5->_completedPoints;
    v5->_completedPoints = (NSMutableArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("returnedExistingIdentity"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCSMTT setReturnedExistingIdentity:](v5, "setReturnedExistingIdentity:", objc_msgSend(v17, "BOOLValue"));

    v18 = v5;
  }

  return v5;
}

- (BOOL)returnedExistingIdentity
{
  return self->_returnedExistingIdentity;
}

- (void)setReturnedExistingIdentity:(BOOL)a3
{
  self->_returnedExistingIdentity = a3;
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)completedPoints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCompletedPoints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSUUID)parentUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (double)time
{
  return self->_time;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_parentUUID, 0);
  objc_storeStrong((id *)&self->_completedPoints, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
}

@end
