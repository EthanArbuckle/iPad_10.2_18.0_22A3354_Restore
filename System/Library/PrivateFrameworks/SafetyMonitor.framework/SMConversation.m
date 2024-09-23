@implementation SMConversation

- (SMConversation)initWithReceiverHandles:(id)a3 identifier:(id)a4 displayName:(id)a5
{
  id v9;
  id v10;
  id v11;
  SMConversation *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *receiverPrimaryHandles;
  SMConversation *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v28.receiver = self;
  v28.super_class = (Class)SMConversation;
  v12 = -[SMConversation init](&v28, sel_init);
  if (v12)
  {
    if (!v9 || !objc_msgSend(v9, "count"))
    {
      v22 = 0;
      goto LABEL_14;
    }
    objc_storeStrong((id *)&v12->_receiverHandles, a3);
    objc_storeStrong((id *)&v12->_identifier, a4);
    objc_storeStrong((id *)&v12->_displayName, a5);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v9;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v18), "primaryHandle", (_QWORD)v24);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v16);
    }

    v20 = objc_msgSend(v13, "copy");
    receiverPrimaryHandles = v12->_receiverPrimaryHandles;
    v12->_receiverPrimaryHandles = (NSArray *)v20;

    v12->_isGroup = (unint64_t)objc_msgSend(v14, "count") > 1;
  }
  v22 = v12;
LABEL_14:

  return v22;
}

- (BOOL)hasEqualPrimaryHandlesAsConversation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(a3, "receiverPrimaryHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[SMConversation hasEqualPrimaryHandlesAsSet:](self, "hasEqualPrimaryHandlesAsSet:", v6);
  return (char)self;
}

- (BOOL)hasEqualPrimaryHandlesAsSet:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  -[SMConversation receiverPrimaryHandles](self, "receiverPrimaryHandles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isEqualToSet:", v5);
  return (char)v6;
}

- (SMConversation)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SMHandle *v13;
  SMHandle *v14;
  void *v15;
  void *v16;
  SMConversation *v17;
  void *v18;
  SMConversation *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMReceiverHandlesKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = [SMHandle alloc];
        v14 = -[SMHandle initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v21);
        if (v14)
          objc_msgSend(v6, "addObject:", v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMConversationIDKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("__kSMChatDisplayNameKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [SMConversation alloc];
  v18 = (void *)objc_msgSend(v6, "copy");
  v19 = -[SMConversation initWithReceiverHandles:identifier:displayName:](v17, "initWithReceiverHandles:identifier:displayName:", v18, v15, v16);

  return v19;
}

- (id)outputToDictionary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[SMConversation receiverHandles](self, "receiverHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[SMConversation receiverHandles](self, "receiverHandles", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "outputToDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("__kSMReceiverHandlesKey"));

  -[SMConversation identifier](self, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[SMConversation identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("__kSMConversationIDKey"));

  }
  -[SMConversation displayName](self, "displayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SMConversation displayName](self, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("__kSMChatDisplayNameKey"));

  }
  v18 = (void *)objc_msgSend(v3, "copy");

  return v18;
}

- (id)descriptionDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[SMConversation receiverHandles](self, "receiverHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("__kSMReceiverHandlesKey"));

  -[SMConversation identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SMConversation identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("__kSMConversationIDKey"));

  }
  -[SMConversation displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SMConversation displayName](self, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("__kSMChatDisplayNameKey"));

  }
  return v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SMConversation descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[SMConversation identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SMConversation receiverHandles](self, "receiverHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SMConversation displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  SMConversation *v6;
  SMConversation *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v6 = (SMConversation *)a3;
  if (self == v6)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;
      -[SMConversation identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMConversation identifier](v7, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v9)
      {
        -[SMConversation identifier](self, "identifier");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMConversation identifier](v7, "identifier");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v4))
        {
          v10 = 0;
          goto LABEL_19;
        }
      }
      -[SMConversation receiverHandles](self, "receiverHandles");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMConversation receiverHandles](v7, "receiverHandles");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v25 = v11;
      }
      else
      {
        -[SMConversation receiverHandles](self, "receiverHandles");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMConversation receiverHandles](v7, "receiverHandles");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v13, "isEqual:"))
        {
          v10 = 0;
          goto LABEL_17;
        }
        v24 = v13;
        v25 = v11;
      }
      -[SMConversation displayName](self, "displayName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SMConversation displayName](v7, "displayName");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 == (void *)v15)
      {

        v10 = 1;
      }
      else
      {
        v16 = (void *)v15;
        -[SMConversation displayName](self, "displayName");
        v23 = v3;
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SMConversation displayName](v7, "displayName");
        v22 = v4;
        v18 = v9;
        v19 = v8;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v17, "isEqual:", v20);

        v8 = v19;
        v9 = v18;
        v4 = v22;

        v3 = v23;
      }
      v13 = v24;
      v11 = v25;
      if (v25 == v12)
      {
LABEL_18:

        if (v8 == v9)
        {
LABEL_20:

          goto LABEL_21;
        }
LABEL_19:

        goto LABEL_20;
      }
LABEL_17:

      goto LABEL_18;
    }
    v10 = 0;
  }
LABEL_21:

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *receiverHandles;
  id v5;

  receiverHandles = self->_receiverHandles;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", receiverHandles, CFSTR("__kSMReceiverHandlesKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("__kSMConversationIDKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("__kSMChatDisplayNameKey"));

}

- (SMConversation)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SMConversation *v11;

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("__kSMReceiverHandlesKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMConversationIDKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("__kSMChatDisplayNameKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SMConversation initWithReceiverHandles:identifier:displayName:](self, "initWithReceiverHandles:identifier:displayName:", v8, v9, v10);
  return v11;
}

- (NSArray)receiverHandles
{
  return self->_receiverHandles;
}

- (NSArray)receiverPrimaryHandles
{
  return self->_receiverPrimaryHandles;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_receiverPrimaryHandles, 0);
  objc_storeStrong((id *)&self->_receiverHandles, 0);
}

@end
