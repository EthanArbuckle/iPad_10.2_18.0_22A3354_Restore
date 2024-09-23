@implementation TPSContextualCondition

+ (id)eventsForConditionDictionary:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "TPSSafeArrayForKey:", CFSTR("rules"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          +[TPSContextualRule eventsForRuleDictionary:](TPSContextualRule, "eventsForRuleDictionary:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
            objc_msgSend(v4, "addObjectsFromArray:", v10);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSContextualCondition)initWithDictionary:(id)a3 type:(unint64_t)a4
{
  self->_type = a4;
  return -[TPSContextualCondition initWithDictionary:](self, "initWithDictionary:", a3);
}

- (TPSContextualCondition)initWithDictionary:(id)a3
{
  id v4;
  TPSContextualCondition *v5;
  void *v6;
  void *v7;
  int *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  TPSContextualRule *v15;
  uint64_t v16;
  NSArray *rules;
  uint64_t v18;
  TPSContextualCondition *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)TPSContextualCondition;
  v5 = -[TPSSerializableObject initWithDictionary:](&v26, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_16;
  objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("joinType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_joinType = objc_msgSend(v6, "isEqualToString:", CFSTR("AND")) ^ 1;
  objc_msgSend(v4, "TPSSafeArrayForKey:", CFSTR("rules"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = &OBJC_IVAR___TPSDocument__title;
  if (objc_msgSend(v7, "count"))
  {
    v21 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = -[TPSContextualRule initWithDictionary:]([TPSContextualRule alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14));
          if (v15)
            objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v12);
    }

    v8 = &OBJC_IVAR___TPSDocument__title;
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v9);
      v16 = objc_claimAutoreleasedReturnValue();
      rules = v5->_rules;
      v5->_rules = (NSArray *)v16;

    }
    v6 = v21;
  }
  v18 = objc_msgSend(*(id *)((char *)&v5->super.super.isa + v8[143]), "count");

  if (!v18)
    v19 = 0;
  else
LABEL_16:
    v19 = v5;

  return v19;
}

- (TPSContextualCondition)initWithCoder:(id)a3
{
  id v4;
  TPSContextualCondition *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *rules;
  uint64_t v11;
  NSDate *matchedDate;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSContextualCondition;
  v5 = -[TPSSerializableObject initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_type = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("type"));
    v5->_joinType = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("joinType"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("rules"));
    v9 = objc_claimAutoreleasedReturnValue();
    rules = v5->_rules;
    v5->_rules = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchedDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    matchedDate = v5->_matchedDate;
    v5->_matchedDate = (NSDate *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSContextualCondition;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("type"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_joinType, CFSTR("joinType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_rules, CFSTR("rules"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_matchedDate, CFSTR("matchedDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSContextualCondition;
  v4 = -[TPSSerializableObject copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setType:", self->_type);
  objc_msgSend(v4, "setJoinType:", self->_joinType);
  objc_msgSend(v4, "setRules:", self->_rules);
  objc_msgSend(v4, "setMatchedDate:", self->_matchedDate);
  return v4;
}

- (id)eventIdentifiers
{
  void *v3;
  NSArray *v4;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_rules;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "eventIdentifiers", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)restartTracking
{
  NSDate *matchedDate;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  matchedDate = self->_matchedDate;
  self->_matchedDate = 0;

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_rules;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "restartTracking", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  NSDate *matchedDate;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)TPSContextualCondition;
  -[TPSSerializableObject debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %lu\n"), CFSTR("type"), self->_type);
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %lu\n"), CFSTR("joinType"), self->_joinType);
  matchedDate = self->_matchedDate;
  if (matchedDate)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("matchedDate"), matchedDate);
  if (-[NSArray count](self->_rules, "count"))
  {
    -[NSArray debugDescription](self->_rules, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("rules"), v7);

  }
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)joinType
{
  return self->_joinType;
}

- (void)setJoinType:(unint64_t)a3
{
  self->_joinType = a3;
}

- (NSDate)matchedDate
{
  return self->_matchedDate;
}

- (void)setMatchedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)rules
{
  return self->_rules;
}

- (void)setRules:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rules, 0);
  objc_storeStrong((id *)&self->_matchedDate, 0);
}

@end
