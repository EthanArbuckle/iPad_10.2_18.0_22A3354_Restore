@implementation ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent

- (void)clearContactEmbeddings
{
  -[NSMutableArray removeAllObjects](self->_contactEmbeddings, "removeAllObjects");
}

- (void)addContactEmbedding:(id)a3
{
  id v4;
  NSMutableArray *contactEmbeddings;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  contactEmbeddings = self->_contactEmbeddings;
  v8 = v4;
  if (!contactEmbeddings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_contactEmbeddings;
    self->_contactEmbeddings = v6;

    v4 = v8;
    contactEmbeddings = self->_contactEmbeddings;
  }
  -[NSMutableArray addObject:](contactEmbeddings, "addObject:", v4);

}

- (unint64_t)contactEmbeddingsCount
{
  return -[NSMutableArray count](self->_contactEmbeddings, "count");
}

- (id)contactEmbeddingAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_contactEmbeddings, "objectAtIndex:", a3);
}

+ (Class)contactEmbeddingType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent;
  -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sessinobd;
  NSString *userId;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sessinobd = self->_sessinobd;
  if (sessinobd)
    objc_msgSend(v3, "setObject:forKey:", sessinobd, CFSTR("sessinobd"));
  userId = self->_userId;
  if (userId)
    objc_msgSend(v4, "setObject:forKey:", userId, CFSTR("userId"));
  if (-[NSMutableArray count](self->_contactEmbeddings, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_contactEmbeddings, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_contactEmbeddings;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("contactEmbedding"));
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ContactEmbeddingAnalysisPETContactEmbeddingArrayEventReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_sessinobd)
    -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_userId)
    -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent writeTo:].cold.2();
  PBDataWriterWriteStringField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_contactEmbeddings;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "setSessinobd:", self->_sessinobd);
  objc_msgSend(v8, "setUserId:", self->_userId);
  if (-[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent contactEmbeddingsCount](self, "contactEmbeddingsCount"))
  {
    objc_msgSend(v8, "clearContactEmbeddings");
    v4 = -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent contactEmbeddingsCount](self, "contactEmbeddingsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent contactEmbeddingAtIndex:](self, "contactEmbeddingAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addContactEmbedding:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sessinobd, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_userId, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = self->_contactEmbeddings;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (_QWORD)v17);
        objc_msgSend(v5, "addContactEmbedding:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *sessinobd;
  NSString *userId;
  NSMutableArray *contactEmbeddings;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((sessinobd = self->_sessinobd, !((unint64_t)sessinobd | v4[2]))
     || -[NSString isEqual:](sessinobd, "isEqual:"))
    && ((userId = self->_userId, !((unint64_t)userId | v4[3]))
     || -[NSString isEqual:](userId, "isEqual:")))
  {
    contactEmbeddings = self->_contactEmbeddings;
    if ((unint64_t)contactEmbeddings | v4[1])
      v8 = -[NSMutableArray isEqual:](contactEmbeddings, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_sessinobd, "hash");
  v4 = -[NSString hash](self->_userId, "hash") ^ v3;
  return v4 ^ -[NSMutableArray hash](self->_contactEmbeddings, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (*((_QWORD *)v4 + 2))
    -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent setSessinobd:](self, "setSessinobd:");
  if (*((_QWORD *)v4 + 3))
    -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent setUserId:](self, "setUserId:");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *((id *)v4 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent addContactEmbedding:](self, "addContactEmbedding:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSString)sessinobd
{
  return self->_sessinobd;
}

- (void)setSessinobd:(id)a3
{
  objc_storeStrong((id *)&self->_sessinobd, a3);
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (NSMutableArray)contactEmbeddings
{
  return self->_contactEmbeddings;
}

- (void)setContactEmbeddings:(id)a3
{
  objc_storeStrong((id *)&self->_contactEmbeddings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_sessinobd, 0);
  objc_storeStrong((id *)&self->_contactEmbeddings, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent writeTo:]", "ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent.m", 137, "nil != self->_sessinobd");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent writeTo:]", "ContactEmbeddingAnalysisPETContactEmbeddingArrayEvent.m", 142, "nil != self->_userId");
}

@end
