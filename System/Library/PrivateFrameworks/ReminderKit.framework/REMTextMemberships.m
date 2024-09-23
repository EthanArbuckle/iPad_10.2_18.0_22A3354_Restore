@implementation REMTextMemberships

- (REMTextMemberships)initWithMemberships:(id)a3 lastResetDate:(id)a4
{
  id v7;
  id v8;
  REMTextMemberships *v9;
  REMTextMemberships *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)REMTextMemberships;
  v9 = -[REMTextMemberships init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_memberships, a3);
    objc_storeStrong((id *)&v10->_lastResetDate, a4);
  }

  return v10;
}

- (REMTextMemberships)initWithMemberships:(id)a3
{
  return -[REMTextMemberships initWithMemberships:lastResetDate:](self, "initWithMemberships:lastResetDate:", a3, 0);
}

- (id)groupIdentifierOfMemberWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[REMTextMemberships memberships](self, "memberships");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mergingWith:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  REMTextMemberships *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  BOOL v51;
  void *v52;
  void *v54;
  id obj;
  void *v56;
  uint64_t v57;
  REMTextMemberships *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[REMTextMemberships lastResetDate](self, "lastResetDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastResetDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v54 = v4;
  if (v5)
  {

    if (v7)
    {
      objc_msgSend(v4, "lastResetDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMTextMemberships lastResetDate](self, "lastResetDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "compare:", v8);

      if (v10 == -1)
      {
        v11 = v8;
      }
      else
      {
        -[REMTextMemberships lastResetDate](self, "lastResetDate");
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v7 = v11;

    }
    else
    {
      -[REMTextMemberships lastResetDate](self, "lastResetDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v58 = self;
  if (v7)
  {
    v56 = (void *)v12;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    -[REMTextMemberships memberships](self, "memberships");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v64;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v64 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v18);
          -[REMTextMemberships memberships](v58, "memberships");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "modifiedOn");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "compare:", v7);

          if (v23 == 1)
          {
            -[REMTextMemberships memberships](v58, "memberships");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", v19);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "setObject:forKeyedSubscript:", v25, v19);

          }
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      }
      while (v16);
    }

  }
  else
  {
    v26 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[REMTextMemberships memberships](self, "memberships");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "initWithDictionary:", v27);

    v56 = (void *)v28;
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v29 = v54;
  objc_msgSend(v54, "memberships");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
  v31 = v58;
  if (v30)
  {
    v32 = v30;
    v57 = *(_QWORD *)v60;
    do
    {
      v33 = 0;
      do
      {
        if (*(_QWORD *)v60 != v57)
          objc_enumerationMutation(obj);
        v34 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v33);
        if (!v7)
          goto LABEL_27;
        objc_msgSend(v29, "memberships");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "modifiedOn");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "compare:", v7);

        if (v38 == 1)
        {
LABEL_27:
          objc_msgSend(v29, "memberships");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKeyedSubscript:", v34);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          -[REMTextMemberships memberships](v31, "memberships");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "objectForKeyedSubscript:", v34);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v42)
            goto LABEL_33;
          objc_msgSend(v42, "modifiedOn");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "modifiedOn");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v43, "compare:", v44);

          v31 = v58;
          if (v45 == -1)
            goto LABEL_33;
          if (!v45)
          {
            objc_msgSend(v42, "identifier");
            v46 = objc_claimAutoreleasedReturnValue();
            if (!v46)
              goto LABEL_33;
            v47 = (void *)v46;
            objc_msgSend(v40, "identifier");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "identifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v48, "compare:", v49);

            v31 = v58;
            v51 = v50 == 1;
            v29 = v54;
            if (v51)
LABEL_33:
              objc_msgSend(v56, "setObject:forKeyedSubscript:", v40, v34);
          }

        }
        ++v33;
      }
      while (v32 != v33);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
    }
    while (v32);
  }

  v52 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithMemberships:lastResetDate:", v56, v7);
  return v52;
}

- (id)removing:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = [v4 alloc];
  -[REMTextMemberships memberships](self, "memberships");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDictionary:", v7);

  objc_msgSend(v8, "removeObjectsForKeys:", v5);
  v9 = objc_alloc((Class)objc_opt_class());
  -[REMTextMemberships lastResetDate](self, "lastResetDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithMemberships:lastResetDate:", v8, v10);

  return v11;
}

- (void)reset
{
  NSDictionary *v3;
  NSDictionary *memberships;
  NSDate *v5;
  NSDate *lastResetDate;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  memberships = self->_memberships;
  self->_memberships = v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastResetDate = self->_lastResetDate;
  self->_lastResetDate = v5;

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMTextMemberships memberships](self, "memberships");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTextMemberships lastResetDate](self, "lastResetDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p memberships: %@, lastResetDate: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  char v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  -[REMTextMemberships memberships](self, "memberships");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "memberships");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMTextMemberships memberships](self, "memberships");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "memberships");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
    {
LABEL_4:
      v11 = 0;
      goto LABEL_10;
    }
  }
  -[REMTextMemberships lastResetDate](self, "lastResetDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastResetDate");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v13)
  {
    v11 = 1;
    v14 = v12;
  }
  else
  {
    v14 = (void *)v13;
    -[REMTextMemberships lastResetDate](self, "lastResetDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastResetDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v15, "isEqual:", v16);

  }
LABEL_10:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[REMTextMemberships memberships](self, "memberships");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMTextMemberships lastResetDate](self, "lastResetDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithMemberships:lastResetDate:", v5, v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMTextMemberships)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  REMTextMemberships *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("memberships"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastResetDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[REMTextMemberships initWithMemberships:lastResetDate:](self, "initWithMemberships:lastResetDate:", v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[REMTextMemberships memberships](self, "memberships");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("memberships"));

  -[REMTextMemberships lastResetDate](self, "lastResetDate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("lastResetDate"));

}

- (NSDictionary)memberships
{
  return self->_memberships;
}

- (NSDate)lastResetDate
{
  return self->_lastResetDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResetDate, 0);
  objc_storeStrong((id *)&self->_memberships, 0);
}

@end
