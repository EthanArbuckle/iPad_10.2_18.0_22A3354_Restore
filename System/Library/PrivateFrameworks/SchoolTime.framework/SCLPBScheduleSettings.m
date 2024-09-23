@implementation SCLPBScheduleSettings

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isEnabled = a3;
}

- (void)setHasIsEnabled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsEnabled
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearRecurrences
{
  -[NSMutableArray removeAllObjects](self->_recurrences, "removeAllObjects");
}

- (void)addRecurrences:(id)a3
{
  id v4;
  NSMutableArray *recurrences;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  recurrences = self->_recurrences;
  v8 = v4;
  if (!recurrences)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_recurrences;
    self->_recurrences = v6;

    v4 = v8;
    recurrences = self->_recurrences;
  }
  -[NSMutableArray addObject:](recurrences, "addObject:", v4);

}

- (unint64_t)recurrencesCount
{
  return -[NSMutableArray count](self->_recurrences, "count");
}

- (id)recurrencesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_recurrences, "objectAtIndex:", a3);
}

+ (Class)recurrencesType
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)SCLPBScheduleSettings;
  -[SCLPBScheduleSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLPBScheduleSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  void *v6;
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

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_version);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("version"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isEnabled);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("isEnabled"));

  }
  if (-[NSMutableArray count](self->_recurrences, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_recurrences, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_recurrences;
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

    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("recurrences"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SCLPBScheduleSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_recurrences;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  id v10;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    v4[4] = self->_version;
    *((_BYTE *)v4 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)v4 + 20) = self->_isEnabled;
    *((_BYTE *)v4 + 24) |= 2u;
  }
  v10 = v4;
  if (-[SCLPBScheduleSettings recurrencesCount](self, "recurrencesCount"))
  {
    objc_msgSend(v10, "clearRecurrences");
    v6 = -[SCLPBScheduleSettings recurrencesCount](self, "recurrencesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[SCLPBScheduleSettings recurrencesAtIndex:](self, "recurrencesAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addRecurrences:", v9);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
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

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_version;
    *(_BYTE *)(v5 + 24) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 20) = self->_isEnabled;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_recurrences;
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
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v15);
        objc_msgSend(v6, "addRecurrences:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSMutableArray *recurrences;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_version != *((_DWORD *)v4 + 4))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0)
      goto LABEL_17;
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  if ((*((_BYTE *)v4 + 24) & 2) == 0)
    goto LABEL_11;
  if (!self->_isEnabled)
  {
    if (!*((_BYTE *)v4 + 20))
      goto LABEL_17;
    goto LABEL_11;
  }
  if (!*((_BYTE *)v4 + 20))
    goto LABEL_11;
LABEL_17:
  recurrences = self->_recurrences;
  if ((unint64_t)recurrences | *((_QWORD *)v4 + 1))
    v5 = -[NSMutableArray isEqual:](recurrences, "isEqual:");
  else
    v5 = 1;
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSMutableArray hash](self->_recurrences, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_isEnabled;
  return v3 ^ v2 ^ -[NSMutableArray hash](self->_recurrences, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  void *v5;
  char v6;
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
  v5 = v4;
  v6 = *((_BYTE *)v4 + 24);
  if ((v6 & 1) != 0)
  {
    self->_version = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 1u;
    v6 = *((_BYTE *)v4 + 24);
  }
  if ((v6 & 2) != 0)
  {
    self->_isEnabled = *((_BYTE *)v4 + 20);
    *(_BYTE *)&self->_has |= 2u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *((id *)v4 + 1);
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
        -[SCLPBScheduleSettings addRecurrences:](self, "addRecurrences:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (unsigned)version
{
  return self->_version;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (NSMutableArray)recurrences
{
  return self->_recurrences;
}

- (void)setRecurrences:(id)a3
{
  objc_storeStrong((id *)&self->_recurrences, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurrences, 0);
}

@end
