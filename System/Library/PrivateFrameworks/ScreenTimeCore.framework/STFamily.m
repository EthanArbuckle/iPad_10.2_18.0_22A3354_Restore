@implementation STFamily

- (STFamily)initWithFamilyCircle:(id)a3
{
  id v4;
  STFamily *v5;
  STFamily *v6;
  uint64_t i;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;
  STFamilyMember *v17;
  NSString *dataSource;
  uint64_t v19;
  NSArray *members;
  uint64_t v22;
  id v23;
  STFamily *v24;
  id obj;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  STFamilyMember *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)STFamily;
  v5 = -[STFamily init](&v34, sel_init);
  v6 = v5;
  if (v5)
  {
    v24 = v5;
    v27 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = v4;
    objc_msgSend(v4, "members");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v28)
    {
      v26 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v9 = CFSTR("Child");
          if (objc_msgSend(v8, "memberType") != 2)
          {
            v9 = CFSTR("Teen");
            if (objc_msgSend(v8, "memberType") != 1)
            {
              if (objc_msgSend(v8, "memberType"))
                v9 = CFSTR("Unknown");
              else
                v9 = CFSTR("Adult");
            }
          }
          v29 = [STFamilyMember alloc];
          objc_msgSend(v8, "dsid");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "altDSID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "appleID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "firstName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "lastName");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v8, "isMe");
          v16 = objc_msgSend(v8, "isParent");
          BYTE2(v22) = objc_msgSend(v8, "isOrganizer");
          BYTE1(v22) = v16;
          LOBYTE(v22) = v15;
          v17 = -[STFamilyMember initWithDSID:altDSID:appleID:memberType:firstName:lastName:isMe:isParent:isOrganizer:](v29, "initWithDSID:altDSID:appleID:memberType:firstName:lastName:isMe:isParent:isOrganizer:", v10, v11, v12, v9, v13, v14, v22);

          if (objc_msgSend(v8, "isMe"))
            objc_storeStrong((id *)&v24->_me, v17);
          objc_msgSend(v27, "addObject:", v17);

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v28);
    }

    v6 = v24;
    dataSource = v24->_dataSource;
    v24->_dataSource = (NSString *)CFSTR("familyCircle");

    v19 = objc_msgSend(v27, "copy");
    members = v24->_members;
    v24->_members = (NSArray *)v19;

    v4 = v23;
  }

  return v6;
}

- (STFamily)initWithMembers:(id)a3
{
  id v5;
  STFamily *v6;
  STFamily *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  STFamilyMember *me;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STFamily;
  v6 = -[STFamily init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_members, a3);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == YES"), CFSTR("isMe"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = objc_claimAutoreleasedReturnValue();
    me = v7->_me;
    v7->_me = (STFamilyMember *)v10;

  }
  return v7;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[STFamily members](self, "members");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "DSID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("dsid"));

        objc_msgSend(v8, "appleID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("appleID"));

        objc_msgSend(v8, "memberType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("memberType"));

        objc_msgSend(v8, "firstName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("firstName"));

        objc_msgSend(v8, "lastName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("lastName"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isMe"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("isMe"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isParent"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("isParent"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isOrganizer"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("isOrganizer"));

        v18 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v3, "addObject:", v18);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v5);
  }

  v28[0] = CFSTR("dataSource");
  -[STFamily dataSource](self, "dataSource");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = CFSTR("members");
  v29[0] = v19;
  v20 = (void *)objc_msgSend(v3, "copy");
  v29[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)-[NSArray copy](self->_members, "copy");
  v6 = (void *)objc_msgSend(v4, "initWithMembers:", v5);

  return v6;
}

- (NSArray)members
{
  return self->_members;
}

- (void)setMembers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (STFamilyMember)me
{
  return self->_me;
}

- (void)setMe:(id)a3
{
  objc_storeStrong((id *)&self->_me, a3);
}

- (NSString)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_members, 0);
}

@end
