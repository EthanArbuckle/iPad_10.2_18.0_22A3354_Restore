@implementation SSFamilyCircle

- (id)allITunesIdentifiers
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
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_familyMembers;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "iTunesIdentifier", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)allITunesAccountNames
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_iTunesAccountNames);
}

- (SSFamilyCircle)initWithCacheRepresentation:(id)a3
{
  id v4;
  SSFamilyCircle *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SSFamilyMember *v13;
  uint64_t v14;
  NSArray *familyMembers;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *iTunesAccountNames;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35.receiver = self;
    v35.super_class = (Class)SSFamilyCircle;
    v5 = -[SSFamilyCircle init](&v35, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("family"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v8 = v6;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v32;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v32 != v11)
                objc_enumerationMutation(v8);
              v13 = -[SSFamilyMember initWithCacheRepresentation:]([SSFamilyMember alloc], "initWithCacheRepresentation:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v12));
              if (v13)
                objc_msgSend(v7, "addObject:", v13);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
          }
          while (v10);
        }

        v14 = objc_msgSend(v7, "copy");
        familyMembers = v5->_familyMembers;
        v5->_familyMembers = (NSArray *)v14;

      }
      objc_msgSend(v4, "objectForKey:", CFSTR("accountNames"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v18 = v16;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v28;
          do
          {
            v22 = 0;
            do
            {
              if (*(_QWORD *)v28 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v22);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(v17, "addObject:", v23, (_QWORD)v27);
              ++v22;
            }
            while (v20 != v22);
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          }
          while (v20);
        }

        v24 = objc_msgSend(v17, "copy");
        iTunesAccountNames = v5->_iTunesAccountNames;
        v5->_iTunesAccountNames = (NSArray *)v24;

      }
    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (id)newCacheRepresentation
{
  id v3;
  void *v4;
  NSArray *iTunesAccountNames;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  iTunesAccountNames = self->_iTunesAccountNames;
  if (iTunesAccountNames)
    objc_msgSend(v3, "setObject:forKey:", iTunesAccountNames, CFSTR("accountNames"));
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_familyMembers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "newCacheRepresentation", (_QWORD)v14);
        if (v12)
          objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("family"));

  return v4;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;

  v3 = xpc_dictionary_create(0, 0, 0);
  SSXPCDictionarySetObject(v3, "0", self->_familyMembers);
  SSXPCDictionarySetObject(v3, "1", self->_iTunesAccountNames);
  return v3;
}

- (SSFamilyCircle)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSFamilyCircle *v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  NSArray *familyMembers;
  const __CFDictionary *v14;
  CFArrayRef v15;
  NSArray *iTunesAccountNames;
  objc_super v17;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v17.receiver = self;
    v17.super_class = (Class)SSFamilyCircle;
    v6 = -[SSFamilyCircle init](&v17, sel_init);
    if (v6)
    {
      xpc_dictionary_get_value(v5, "0");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v10 = MEMORY[0x1E0C812C8];
      if (v8 && MEMORY[0x1A85863E4](v8) == v10)
      {
        v11 = objc_opt_class();
        v12 = (NSArray *)SSXPCCreateNSArrayFromXPCEncodedArray(v9, v11);
        familyMembers = v6->_familyMembers;
        v6->_familyMembers = v12;

      }
      xpc_dictionary_get_value(v5, "1");
      v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

      if (v14 && MEMORY[0x1A85863E4](v14) == v10)
      {
        v15 = SSXPCCreateCFObjectFromXPCObject(v14);
        iTunesAccountNames = v6->_iTunesAccountNames;
        v6->_iTunesAccountNames = (NSArray *)v15;

      }
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (NSArray)familyMembers
{
  return self->_familyMembers;
}

- (void)setFamilyMembers:(id)a3
{
  objc_storeStrong((id *)&self->_familyMembers, a3);
}

- (NSArray)iTunesAccountNames
{
  return self->_iTunesAccountNames;
}

- (void)setITunesAccountNames:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesAccountNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesAccountNames, 0);
  objc_storeStrong((id *)&self->_familyMembers, 0);
}

@end
