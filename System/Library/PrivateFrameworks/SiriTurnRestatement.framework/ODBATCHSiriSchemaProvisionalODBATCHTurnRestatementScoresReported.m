@implementation ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported

- (void)clearTurnRestatementScores
{
  -[NSArray removeAllObjects](self->_turnRestatementScores, "removeAllObjects");
}

- (void)addTurnRestatementScores:(id)a3
{
  id v4;
  NSArray *turnRestatementScores;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  turnRestatementScores = self->_turnRestatementScores;
  v8 = v4;
  if (!turnRestatementScores)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_turnRestatementScores;
    self->_turnRestatementScores = v6;

    v4 = v8;
    turnRestatementScores = self->_turnRestatementScores;
  }
  -[NSArray addObject:](turnRestatementScores, "addObject:", v4);

}

- (unint64_t)turnRestatementScoresCount
{
  return -[NSArray count](self->_turnRestatementScores, "count");
}

- (id)turnRestatementScoresAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_turnRestatementScores, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReportedReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSArray *v5;
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
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_turnRestatementScores;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported turnRestatementScores](self, "turnRestatementScores");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "turnRestatementScores");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported turnRestatementScores](self, "turnRestatementScores");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported turnRestatementScores](self, "turnRestatementScores");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "turnRestatementScores");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_turnRestatementScores, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_turnRestatementScores, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_turnRestatementScores;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v4, "addObject:", v10);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("turnRestatementScores"));
  }
  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (_QWORD)v13);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported)initWithJSON:(id)a3
{
  void *v4;
  ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported)initWithDictionary:(id)a3
{
  id v4;
  ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore *v13;
  ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore *v14;
  ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported;
  v5 = -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("turnRestatementScores"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v18;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v18 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore alloc];
              v14 = -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScore initWithDictionary:](v13, "initWithDictionary:", v12, (_QWORD)v17);
              -[ODBATCHSiriSchemaProvisionalODBATCHTurnRestatementScoresReported addTurnRestatementScores:](v5, "addTurnRestatementScores:", v14);

            }
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
        }
        while (v9);
      }

    }
    v15 = v5;

  }
  return v5;
}

- (NSArray)turnRestatementScores
{
  return self->_turnRestatementScores;
}

- (void)setTurnRestatementScores:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_turnRestatementScores, 0);
}

@end
