@implementation TPSContextualRule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventsForRuleDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "TPSSafeArrayForKey:", CFSTR("events"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "TPSSafeArrayForKey:", CFSTR("conditions"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v9[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (TPSContextualRule)initWithDictionary:(id)a3
{
  id v4;
  TPSContextualRule *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  int *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *eventIdentifiers;
  uint64_t v19;
  TPSContextualRule *v20;
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
  v26.super_class = (Class)TPSContextualRule;
  v5 = -[TPSSerializableObject initWithDictionary:](&v26, sel_initWithDictionary_, v4);
  if (!v5)
    goto LABEL_17;
  objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("id"));
  v6 = objc_claimAutoreleasedReturnValue();
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  if (!-[NSString length](v5->_identifier, "length"))
    goto LABEL_18;
  objc_msgSend(v4, "TPSSafeArrayForKey:", CFSTR("events"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = &OBJC_IVAR___TPSDocument__title;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          +[TPSContextualEvent identifierFromEventInfoDictionary:](TPSContextualEvent, "identifierFromEventInfoDictionary:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15), (_QWORD)v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "length"))
            objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v13);
    }

    v9 = &OBJC_IVAR___TPSDocument__title;
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v10);
      v17 = objc_claimAutoreleasedReturnValue();
      eventIdentifiers = v5->_eventIdentifiers;
      v5->_eventIdentifiers = (NSArray *)v17;

    }
  }
  v19 = objc_msgSend(*(id *)((char *)&v5->super.super.isa + v9[172]), "count", (_QWORD)v22);

  if (v19)
LABEL_17:
    v20 = v5;
  else
LABEL_18:
    v20 = 0;

  return v20;
}

- (TPSContextualRule)initWithCoder:(id)a3
{
  id v4;
  TPSContextualRule *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *eventIdentifiers;
  uint64_t v13;
  NSDate *matchedDate;
  NSDate *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)TPSContextualRule;
  v5 = -[TPSSerializableObject initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("eventIdentifiers"));
    v11 = objc_claimAutoreleasedReturnValue();
    eventIdentifiers = v5->_eventIdentifiers;
    v5->_eventIdentifiers = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("matchedDate"));
    v13 = objc_claimAutoreleasedReturnValue();
    matchedDate = v5->_matchedDate;
    v5->_matchedDate = (NSDate *)v13;

    if (v5->_matchedDate)
    {
      if (objc_msgSend(MEMORY[0x1E0C99D68], "isDateExpired:maxTimeInterval:", -63072000.0))
      {
        v15 = v5->_matchedDate;
        v5->_matchedDate = 0;

      }
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSContextualRule;
  v4 = a3;
  -[TPSSerializableObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("id"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_eventIdentifiers, CFSTR("eventIdentifiers"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_matchedDate, CFSTR("matchedDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSContextualRule;
  v4 = -[TPSSerializableObject copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setIdentifier:", self->_identifier);
  objc_msgSend(v4, "setEventIdentifiers:", self->_eventIdentifiers);
  objc_msgSend(v4, "setMatchedDate:", self->_matchedDate);
  return v4;
}

- (void)restartTracking
{
  NSDate *matchedDate;

  matchedDate = self->_matchedDate;
  self->_matchedDate = 0;

}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSDate *matchedDate;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)TPSContextualRule;
  -[TPSSerializableObject debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("id"), self->_identifier);
  if (-[NSArray count](self->_eventIdentifiers, "count"))
  {
    -[NSArray debugDescription](self->_eventIdentifiers, "debugDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("eventIdentifiers"), v6);

  }
  matchedDate = self->_matchedDate;
  if (matchedDate)
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("matchedDate"), matchedDate);
  return v5;
}

- (NSDate)matchedDate
{
  return self->_matchedDate;
}

- (void)setMatchedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)eventIdentifiers
{
  return self->_eventIdentifiers;
}

- (void)setEventIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_matchedDate, 0);
}

@end
