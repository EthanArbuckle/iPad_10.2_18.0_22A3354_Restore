@implementation HVPBContentStateEntry

- (BOOL)hasState
{
  return self->_state != 0;
}

- (void)clearUniqueIds
{
  -[NSMutableArray removeAllObjects](self->_uniqueIds, "removeAllObjects");
}

- (void)addUniqueIds:(id)a3
{
  id v4;
  NSMutableArray *uniqueIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  uniqueIds = self->_uniqueIds;
  v8 = v4;
  if (!uniqueIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_uniqueIds;
    self->_uniqueIds = v6;

    v4 = v8;
    uniqueIds = self->_uniqueIds;
  }
  -[NSMutableArray addObject:](uniqueIds, "addObject:", v4);

}

- (unint64_t)uniqueIdsCount
{
  return -[NSMutableArray count](self->_uniqueIds, "count");
}

- (id)uniqueIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_uniqueIds, "objectAtIndex:", a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)HVPBContentStateEntry;
  -[HVPBContentStateEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HVPBContentStateEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  HVPBContentState *state;
  void *v5;
  NSMutableArray *uniqueIds;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  state = self->_state;
  if (state)
  {
    -[HVPBContentState dictionaryRepresentation](state, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("state"));

  }
  uniqueIds = self->_uniqueIds;
  if (uniqueIds)
    objc_msgSend(v3, "setObject:forKey:", uniqueIds, CFSTR("uniqueIds"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HVPBContentStateEntryReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_state)
    PBDataWriterWriteSubmessage();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_uniqueIds;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
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
  if (self->_state)
    objc_msgSend(v8, "setState:");
  if (-[HVPBContentStateEntry uniqueIdsCount](self, "uniqueIdsCount"))
  {
    objc_msgSend(v8, "clearUniqueIds");
    v4 = -[HVPBContentStateEntry uniqueIdsCount](self, "uniqueIdsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[HVPBContentStateEntry uniqueIdsAtIndex:](self, "uniqueIdsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addUniqueIds:", v7);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[HVPBContentState copyWithZone:](self->_state, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_uniqueIds;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v5, "addUniqueIds:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  HVPBContentState *state;
  NSMutableArray *uniqueIds;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((state = self->_state, !((unint64_t)state | v4[1])) || -[HVPBContentState isEqual:](state, "isEqual:")))
  {
    uniqueIds = self->_uniqueIds;
    if ((unint64_t)uniqueIds | v4[2])
      v7 = -[NSMutableArray isEqual:](uniqueIds, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HVPBContentState hash](self->_state, "hash");
  return -[NSMutableArray hash](self->_uniqueIds, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  HVPBContentState *state;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  state = self->_state;
  v6 = *((_QWORD *)v4 + 1);
  if (state)
  {
    if (v6)
      -[HVPBContentState mergeFrom:](state, "mergeFrom:");
  }
  else if (v6)
  {
    -[HVPBContentStateEntry setState:](self, "setState:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 2);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[HVPBContentStateEntry addUniqueIds:](self, "addUniqueIds:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (HVPBContentState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSMutableArray)uniqueIds
{
  return self->_uniqueIds;
}

- (void)setUniqueIds:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueIds, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

+ (Class)uniqueIdsType
{
  return (Class)objc_opt_class();
}

@end
