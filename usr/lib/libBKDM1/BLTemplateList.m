@implementation BLTemplateList

- (BLTemplateList)initWithIdentities:(id)a3
{
  id v4;
  BLTemplateList *v5;
  uint64_t v6;
  NSMutableDictionary *identityList;
  uint64_t v8;
  NSMutableDictionary *templateList;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  NSLock *v19;
  NSLock *listLock;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[BLTemplateList init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    identityList = v5->_identityList;
    v5->_identityList = (NSMutableDictionary *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    templateList = v5->_templateList;
    v5->_templateList = (NSMutableDictionary *)v8;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v16 = v5->_identityList;
          v17 = (void *)objc_msgSend(v15, "copy", (_QWORD)v22);
          objc_msgSend(v15, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v17, v18);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v12);
    }

    v19 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    listLock = v5->_listLock;
    v5->_listLock = v19;

  }
  return v5;
}

- (void)setIdentity:(id)a3
{
  NSLock *listLock;
  id v5;
  NSMutableDictionary *identityList;
  void *v7;
  void *v8;

  listLock = self->_listLock;
  v5 = a3;
  -[NSLock lock](listLock, "lock");
  identityList = self->_identityList;
  v7 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v5, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKey:](identityList, "setObject:forKey:", v7, v8);
  -[NSLock unlock](self->_listLock, "unlock");
}

- (id)templateNameForIdentity:(id)a3
{
  NSLock *listLock;
  id v5;
  NSMutableDictionary *templateList;
  void *v7;
  void *v8;

  listLock = self->_listLock;
  v5 = a3;
  -[NSLock lock](listLock, "lock");
  templateList = self->_templateList;
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKey:](templateList, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_listLock, "unlock");
  return v8;
}

- (id)allIdentities
{
  id v3;
  void *v4;
  void *v5;

  -[NSLock lock](self->_listLock, "lock");
  v3 = objc_alloc(MEMORY[0x24BDBCE30]);
  -[NSMutableDictionary allValues](self->_identityList, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:copyItems:", v4, 1);

  -[NSLock unlock](self->_listLock, "unlock");
  return v5;
}

- (id)identitiesForUser:(unsigned int)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_listLock, "lock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allValues](self->_identityList, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "userID") == a3)
        {
          v12 = (void *)objc_msgSend(v11, "copy");
          objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[NSLock unlock](self->_listLock, "unlock");
  return v5;
}

- (unint64_t)countForUser:(unsigned int)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_listLock, "lock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_identityList, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "userID") == a3)
          ++v8;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  -[NSLock unlock](self->_listLock, "unlock");
  return v8;
}

- (void)removeIdentity:(id)a3
{
  NSLock *listLock;
  id v5;
  NSMutableDictionary *identityList;
  void *v7;
  NSMutableDictionary *templateList;
  void *v9;

  listLock = self->_listLock;
  v5 = a3;
  -[NSLock lock](listLock, "lock");
  identityList = self->_identityList;
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](identityList, "removeObjectForKey:", v7);

  templateList = self->_templateList;
  objc_msgSend(v5, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectForKey:](templateList, "removeObjectForKey:", v9);
  -[NSLock unlock](self->_listLock, "unlock");
}

- (void)setIdentity:(id)a3 withTemplateName:(id)a4
{
  NSLock *listLock;
  id v7;
  id v8;
  NSMutableDictionary *identityList;
  void *v10;
  void *v11;
  NSMutableDictionary *templateList;
  void *v13;

  listLock = self->_listLock;
  v7 = a4;
  v8 = a3;
  -[NSLock lock](listLock, "lock");
  identityList = self->_identityList;
  v10 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v8, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](identityList, "setObject:forKey:", v10, v11);

  templateList = self->_templateList;
  objc_msgSend(v8, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKey:](templateList, "setObject:forKey:", v7, v13);
  -[NSLock unlock](self->_listLock, "unlock");
}

- (void)removeAll
{
  -[NSLock lock](self->_listLock, "lock");
  -[NSMutableDictionary removeAllObjects](self->_identityList, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_templateList, "removeAllObjects");
  -[NSLock unlock](self->_listLock, "unlock");
}

- (void)setIdentities:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *identityList;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSLock lock](self->_listLock, "lock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        identityList = self->_identityList;
        v12 = (void *)objc_msgSend(v10, "copy", (_QWORD)v14);
        objc_msgSend(v10, "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](identityList, "setObject:forKey:", v12, v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[NSLock unlock](self->_listLock, "unlock");
}

- (id)identityByUUID:(id)a3
{
  NSLock *listLock;
  id v5;
  void *v6;
  void *v7;

  listLock = self->_listLock;
  v5 = a3;
  -[NSLock lock](listLock, "lock");
  -[NSMutableDictionary objectForKey:](self->_identityList, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  -[NSLock unlock](self->_listLock, "unlock");
  return v7;
}

- (void)setIdentitiesForUser:(unsigned int)a3 withTemplateListName:(id)a4
{
  id v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[NSLock lock](self->_listLock, "lock");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_identityList;
  v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_identityList, "objectForKey:", v12, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "userID");

        if (v14 == a3)
          -[NSMutableDictionary setObject:forKey:](self->_templateList, "setObject:forKey:", v6, v12);
      }
      v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  -[NSLock unlock](self->_listLock, "unlock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listLock, 0);
  objc_storeStrong((id *)&self->_templateList, 0);
  objc_storeStrong((id *)&self->_identityList, 0);
}

@end
