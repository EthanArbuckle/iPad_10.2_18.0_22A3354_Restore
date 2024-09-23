@implementation TPSContextualClientContextEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSContextualClientContextEvent)initWithDictionary:(id)a3
{
  id v4;
  TPSContextualClientContextEvent *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TPSContextualClientContextCondition *v14;
  TPSContextualClientContextCondition *v15;
  uint64_t v16;
  NSArray *conditions;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)TPSContextualClientContextEvent;
  v5 = -[TPSContextualEvent initWithDictionary:](&v23, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "TPSSafeArrayForKey:", CFSTR("conditions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
          v14 = [TPSContextualClientContextCondition alloc];
          v15 = -[TPSContextualClientContextCondition initWithDictionary:](v14, "initWithDictionary:", v13, (_QWORD)v19);
          objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
    {
      v16 = objc_msgSend(v7, "copy");
      conditions = v5->_conditions;
      v5->_conditions = (NSArray *)v16;

    }
  }

  return v5;
}

- (TPSContextualClientContextEvent)initWithCoder:(id)a3
{
  id v4;
  TPSContextualClientContextEvent *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *conditions;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSContextualClientContextEvent;
  v5 = -[TPSContextualEvent initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("conditions"));
    v9 = objc_claimAutoreleasedReturnValue();
    conditions = v5->_conditions;
    v5->_conditions = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSContextualClientContextEvent;
  v4 = a3;
  -[TPSContextualEvent encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_conditions, CFSTR("conditions"), v5.receiver, v5.super_class);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSContextualClientContextEvent;
  v4 = -[TPSContextualEvent copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setConditions:", self->_conditions);
  return v4;
}

- (id)clientContextKeys
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_conditions;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "key", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)TPSContextualClientContextEvent;
  -[TPSContextualEvent debugDescription](&v9, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSContextualClientContextEvent conditions](self, "conditions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "debugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@"), CFSTR("conditions"), v7);

  return v5;
}

- (NSArray)conditions
{
  return self->_conditions;
}

- (void)setConditions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);
}

@end
