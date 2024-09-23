@implementation REMMemberships

- (REMMemberships)initWithMembershipByMemberIdentifier:(id)a3
{
  id v5;
  REMMemberships *v6;
  REMMemberships *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMMemberships;
  v6 = -[REMMemberships init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_membershipByMemberIdentifier, a3);

  return v7;
}

- (REMMemberships)initWithMemberships:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  REMMemberships *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "memberIdentifier", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = -[REMMemberships initWithMembershipByMemberIdentifier:](self, "initWithMembershipByMemberIdentifier:", v5);
  return v13;
}

- (id)groupIdentifierOfMemberWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[REMMemberships membershipByMemberIdentifier](self, "membershipByMemberIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "groupIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mergingWith:(id)a3 mergePolicy:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  BOOL v26;
  void *v27;
  void *v28;
  id v30;
  id obj;
  void *v32;
  REMMemberships *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v6 = objc_alloc(MEMORY[0x1E0C99E08]);
  v33 = self;
  -[REMMemberships membershipByMemberIdentifier](self, "membershipByMemberIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v6, "initWithDictionary:", v7);

  if (a4 == 1)
  {
    objc_msgSend(v30, "membershipByMemberIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addEntriesFromDictionary:", v27);

    v8 = v30;
  }
  else
  {
    v8 = v30;
    if (!a4)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      objc_msgSend(v30, "membershipByMemberIdentifier");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v35;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v35 != v11)
              objc_enumerationMutation(obj);
            v13 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v12);
            objc_msgSend(v8, "membershipByMemberIdentifier", v30);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            -[REMMemberships membershipByMemberIdentifier](v33, "membershipByMemberIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v13);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v17)
              goto LABEL_14;
            objc_msgSend(v17, "modifiedOn");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "modifiedOn");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v18, "compare:", v19);

            if (v20 == -1)
              goto LABEL_14;
            if (!v20)
            {
              objc_msgSend(v17, "groupIdentifier");
              v21 = objc_claimAutoreleasedReturnValue();
              if (!v21)
                goto LABEL_14;
              v22 = (void *)v21;
              objc_msgSend(v15, "groupIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "groupIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v23, "compare:", v24);

              v26 = v25 == 1;
              v8 = v30;
              if (v26)
LABEL_14:
                objc_msgSend(v32, "setObject:forKeyedSubscript:", v15, v13);
            }

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v10);
      }

    }
  }
  v28 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMembershipByMemberIdentifier:", v32);

  return v28;
}

- (id)excludingObsoleteAndModifiedEarlierThan:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[REMMemberships membershipByMemberIdentifier](self, "membershipByMemberIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[REMMemberships membershipByMemberIdentifier](self, "membershipByMemberIdentifier", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        -[REMMemberships membershipByMemberIdentifier](self, "membershipByMemberIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          if (!objc_msgSend(v15, "isObsolete")
            || (objc_msgSend(v15, "modifiedOn"),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                v17 = objc_msgSend(v16, "compare:", v4),
                v16,
                v17 != -1))
          {
            objc_msgSend(v7, "addObject:", v15);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMemberships:", v7);
  return v18;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMMemberships membershipByMemberIdentifier](self, "membershipByMemberIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p membershipByMemberIdentifier: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[REMMemberships membershipByMemberIdentifier](self, "membershipByMemberIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "membershipByMemberIdentifier");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {
      v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      -[REMMemberships membershipByMemberIdentifier](self, "membershipByMemberIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "membershipByMemberIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[REMMemberships membershipByMemberIdentifier](self, "membershipByMemberIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithMembershipByMemberIdentifier:", v5);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMMemberships)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  REMMemberships *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("membershipByMemberIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[REMMemberships initWithMembershipByMemberIdentifier:](self, "initWithMembershipByMemberIdentifier:", v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMMemberships membershipByMemberIdentifier](self, "membershipByMemberIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("membershipByMemberIdentifier"));

}

- (NSDictionary)membershipByMemberIdentifier
{
  return self->_membershipByMemberIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_membershipByMemberIdentifier, 0);
}

@end
