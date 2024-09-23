@implementation RWIDriverState

- (RWIDriverState)init
{
  RWIDriverState *v2;
  RWIDriverState *v3;
  RWIDriverState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RWIDriverState;
  v2 = -[RWIDriverState init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (id)active
{
  RWIDriverState *v2;

  v2 = objc_alloc_init(RWIDriverState);
  -[RWIDriverState setActive:](v2, "setActive:", 1);
  return v2;
}

+ (id)inactive
{
  RWIDriverState *v2;

  v2 = objc_alloc_init(RWIDriverState);
  -[RWIDriverState setActive:](v2, "setActive:", 0);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setActive:", -[RWIDriverState isActive](self, "isActive"));
  -[RWIDriverState sessionIdentifiers](self, "sessionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSessionIdentifiers:", v6);

  return v4;
}

+ (BOOL)isValidPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverIsActiveKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5,
        v4,
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverSessionListKey")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        (objc_opt_isKindOfClass() & 1) != 0))
  {

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverIdentifierKey"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_opt_class();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v15 = (void *)objc_opt_class();
            logUnexpectedType(v15, v12);

            v13 = 0;
            goto LABEL_14;
          }

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_14:

  }
  else
  {
    v14 = (void *)objc_opt_class();
    logUnexpectedType(v14, v5);

    v13 = 0;
  }

  return v13;
}

+ (id)decodeFromPayload:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverIsActiveKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WIRDriverSessionListKey"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        objc_opt_class();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v15 = (void *)objc_opt_class();
          logUnexpectedType(v15, v13);

          v14 = 0;
          goto LABEL_11;
        }

        objc_msgSend(v6, "addObject:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }

  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setActive:", v5);
  objc_msgSend(v14, "setSessionIdentifiers:", v6);
LABEL_11:

  return v14;
}

- (void)encodeToPayload:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(v4, "numberWithBool:", -[RWIDriverState isActive](self, "isActive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("WIRDriverIsActiveKey"));

  -[RWIDriverState sessionIdentifiers](self, "sessionIdentifiers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("WIRDriverSessionListKey"));

}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (NSSet)sessionIdentifiers
{
  return self->_sessionIdentifiers;
}

- (void)setSessionIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifiers, 0);
}

@end
