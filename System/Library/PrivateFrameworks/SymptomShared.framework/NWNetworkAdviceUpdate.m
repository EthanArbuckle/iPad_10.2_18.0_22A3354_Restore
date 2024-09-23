@implementation NWNetworkAdviceUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NWNetworkAdviceUpdate)initWithCoder:(id)a3
{
  id v4;
  NWNetworkAdviceUpdate *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *applications;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NWNetworkAdviceUpdate;
  v5 = -[NWNetworkAdviceUpdate init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24958F0D4]();
    v5->_level = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("level"));
    v7 = objc_alloc(MEMORY[0x24BDBCF20]);
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("applications"));
    v10 = objc_claimAutoreleasedReturnValue();
    applications = v5->_applications;
    v5->_applications = (NSArray *)v10;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)MEMORY[0x24958F0D4]();
  objc_msgSend(v6, "encodeInteger:forKey:", -[NWNetworkAdviceUpdate level](self, "level"), CFSTR("level"));
  -[NWNetworkAdviceUpdate applications](self, "applications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("applications"));

  objc_autoreleasePoolPop(v4);
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 10);
  objc_msgSend(v3, "appendFormat:", CFSTR("level: %ld"), -[NWNetworkAdviceUpdate level](self, "level"));
  -[NWNetworkAdviceUpdate applications](self, "applications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "bundleIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "state");
        objc_msgSend(v9, "reason");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(", (%@, %ld, %@)"), v10, v11, v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", v3);

  return v13;
}

- (NWNetworkAdviceUpdate)initWithDictionary:(id)a3
{
  id v4;
  NWNetworkAdviceUpdate *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NWAppAdvice *v16;
  void *v17;
  void *v18;
  NWNetworkAdviceUpdate *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)NWNetworkAdviceUpdate;
  v5 = -[NWNetworkAdviceUpdate init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("detail"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NWNetworkAdviceUpdate setLevel:](v5, "setLevel:", objc_msgSend(v6, "integerValue"));
    v20 = v5;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("states"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reasons"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v9);
          v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          v16 = objc_alloc_init(NWAppAdvice);
          -[NWAppAdvice setBundleIdentifier:](v16, "setBundleIdentifier:", v15);
          objc_msgSend(v9, "objectForKeyedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[NWAppAdvice setState:](v16, "setState:", objc_msgSend(v17, "integerValue"));
          objc_msgSend(v8, "objectForKeyedSubscript:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[NWAppAdvice setReason:](v16, "setReason:", v18);
          if (!v12)
            v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v12, "addObject:", v16);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }

    v5 = v20;
    -[NWNetworkAdviceUpdate setApplications:](v20, "setApplications:", v12);

    v4 = v21;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  NWNetworkAdviceUpdate *v4;
  NWNetworkAdviceUpdate *v5;
  int64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v4 = (NWNetworkAdviceUpdate *)a3;
  if (v4 == self)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[NWNetworkAdviceUpdate level](self, "level");
      if (v6 == -[NWNetworkAdviceUpdate level](v5, "level"))
      {
        -[NWNetworkAdviceUpdate applications](self, "applications");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          -[NWNetworkAdviceUpdate applications](v5, "applications");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
          {
            v9 = objc_alloc(MEMORY[0x24BDBCF20]);
            -[NWNetworkAdviceUpdate applications](self, "applications");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (void *)objc_msgSend(v9, "initWithArray:", v10);

            v7 = objc_alloc(MEMORY[0x24BDBCF20]);
            -[NWNetworkAdviceUpdate applications](v5, "applications");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (void *)objc_msgSend(v7, "initWithArray:", v12);

            LOBYTE(v7) = objc_msgSend(v11, "isEqualToSet:", v13);
          }
          else
          {
            LOBYTE(v7) = 0;
          }
        }
        -[NWNetworkAdviceUpdate applications](self, "applications");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "count"))
        {
          -[NWNetworkAdviceUpdate applications](v5, "applications");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          if (!v16)
            LOBYTE(v7) = 1;
        }

      }
      else
      {
        LOBYTE(v7) = 0;
      }

    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }

  return (char)v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[NWNetworkAdviceUpdate description](self, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NWNetworkAdviceUpdate *v4;

  v4 = objc_alloc_init(NWNetworkAdviceUpdate);
  v4->_level = self->_level;
  objc_storeStrong((id *)&v4->_applications, self->_applications);
  return v4;
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (NSArray)applications
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApplications:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applications, 0);
}

@end
