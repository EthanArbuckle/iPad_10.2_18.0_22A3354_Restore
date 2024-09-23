@implementation AWDSpringBoardPressSequence

- (void)dealloc
{
  objc_super v3;

  -[AWDSpringBoardPressSequence setSequences:](self, "setSequences:", 0);
  -[AWDSpringBoardPressSequence setType:](self, "setType:", 0);
  -[AWDSpringBoardPressSequence setUUID:](self, "setUUID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardPressSequence;
  -[AWDSpringBoardPressSequence dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearSequences
{
  -[NSMutableArray removeAllObjects](self->_sequences, "removeAllObjects");
}

- (void)addSequence:(id)a3
{
  NSMutableArray *sequences;

  sequences = self->_sequences;
  if (!sequences)
  {
    sequences = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_sequences = sequences;
  }
  -[NSMutableArray addObject:](sequences, "addObject:", a3);
}

- (unint64_t)sequencesCount
{
  return -[NSMutableArray count](self->_sequences, "count");
}

- (id)sequenceAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_sequences, "objectAtIndex:", a3);
}

+ (Class)sequenceType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (void)setDidTriggerSOS:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_didTriggerSOS = a3;
}

- (void)setHasDidTriggerSOS:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDidTriggerSOS
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setClickMax:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_clickMax = a3;
}

- (void)setHasClickMax:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClickMax
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasUUID
{
  return self->_uUID != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardPressSequence;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSpringBoardPressSequence description](&v3, sel_description), -[AWDSpringBoardPressSequence dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *sequences;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSString *type;
  char has;
  NSString *uUID;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  if (-[NSMutableArray count](self->_sequences, "count"))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_sequences, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    sequences = self->_sequences;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sequences, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(sequences);
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sequences, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("sequence"));

  }
  type = self->_type;
  if (type)
    objc_msgSend(v3, "setObject:forKey:", type, CFSTR("type"));
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_didTriggerSOS), CFSTR("didTriggerSOS"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_clickMax), CFSTR("clickMax"));
  uUID = self->_uUID;
  if (uUID)
    objc_msgSend(v3, "setObject:forKey:", uUID, CFSTR("UUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardPressSequenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *sequences;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char has;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_has & 2) != 0)
    PBDataWriterWriteUint64Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  sequences = self->_sequences;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sequences, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(sequences);
        PBDataWriterWriteSubmessage();
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sequences, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  if (self->_type)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_uUID)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  char has;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_timestamp;
    *((_BYTE *)a3 + 52) |= 2u;
  }
  if (-[AWDSpringBoardPressSequence sequencesCount](self, "sequencesCount"))
  {
    objc_msgSend(a3, "clearSequences");
    v5 = -[AWDSpringBoardPressSequence sequencesCount](self, "sequencesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addSequence:", -[AWDSpringBoardPressSequence sequenceAtIndex:](self, "sequenceAtIndex:", i));
    }
  }
  if (self->_type)
    objc_msgSend(a3, "setType:");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)a3 + 48) = self->_didTriggerSOS;
    *((_BYTE *)a3 + 52) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_clickMax;
    *((_BYTE *)a3 + 52) |= 1u;
  }
  if (self->_uUID)
    objc_msgSend(a3, "setUUID:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *sequences;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char has;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_timestamp;
    *(_BYTE *)(v5 + 52) |= 2u;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  sequences = self->_sequences;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sequences, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(sequences);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSequence:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](sequences, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_BYTE *)(v6 + 48) = self->_didTriggerSOS;
    *(_BYTE *)(v6 + 52) |= 4u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v6 + 8) = self->_clickMax;
    *(_BYTE *)(v6 + 52) |= 1u;
  }

  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_uUID, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *sequences;
  NSString *type;
  NSString *uUID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_timestamp != *((_QWORD *)a3 + 2))
        goto LABEL_26;
    }
    else if ((*((_BYTE *)a3 + 52) & 2) != 0)
    {
      goto LABEL_26;
    }
    sequences = self->_sequences;
    if (!((unint64_t)sequences | *((_QWORD *)a3 + 3))
      || (v5 = -[NSMutableArray isEqual:](sequences, "isEqual:")) != 0)
    {
      type = self->_type;
      if (!((unint64_t)type | *((_QWORD *)a3 + 4)) || (v5 = -[NSString isEqual:](type, "isEqual:")) != 0)
      {
        if ((*(_BYTE *)&self->_has & 4) == 0)
        {
          if ((*((_BYTE *)a3 + 52) & 4) != 0)
            goto LABEL_26;
          goto LABEL_19;
        }
        if ((*((_BYTE *)a3 + 52) & 4) != 0)
        {
          if (self->_didTriggerSOS)
          {
            if (!*((_BYTE *)a3 + 48))
              goto LABEL_26;
            goto LABEL_19;
          }
          if (!*((_BYTE *)a3 + 48))
          {
LABEL_19:
            if ((*(_BYTE *)&self->_has & 1) != 0)
            {
              if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_clickMax != *((_QWORD *)a3 + 1))
                goto LABEL_26;
            }
            else if ((*((_BYTE *)a3 + 52) & 1) != 0)
            {
              goto LABEL_26;
            }
            uUID = self->_uUID;
            if ((unint64_t)uUID | *((_QWORD *)a3 + 5))
              LOBYTE(v5) = -[NSString isEqual:](uUID, "isEqual:");
            else
              LOBYTE(v5) = 1;
            return v5;
          }
        }
LABEL_26:
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761u * self->_timestamp;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_sequences, "hash");
  v5 = -[NSString hash](self->_type, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v6 = 2654435761 * self->_didTriggerSOS;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_uUID, "hash");
  }
  v6 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v7 = 2654435761u * self->_clickMax;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[NSString hash](self->_uUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if ((*((_BYTE *)a3 + 52) & 2) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[AWDSpringBoardPressSequence addSequence:](self, "addSequence:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  if (*((_QWORD *)a3 + 4))
    -[AWDSpringBoardPressSequence setType:](self, "setType:");
  v10 = *((_BYTE *)a3 + 52);
  if ((v10 & 4) != 0)
  {
    self->_didTriggerSOS = *((_BYTE *)a3 + 48);
    *(_BYTE *)&self->_has |= 4u;
    v10 = *((_BYTE *)a3 + 52);
  }
  if ((v10 & 1) != 0)
  {
    self->_clickMax = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 5))
    -[AWDSpringBoardPressSequence setUUID:](self, "setUUID:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)sequences
{
  return self->_sequences;
}

- (void)setSequences:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)didTriggerSOS
{
  return self->_didTriggerSOS;
}

- (unint64_t)clickMax
{
  return self->_clickMax;
}

- (NSString)uUID
{
  return self->_uUID;
}

- (void)setUUID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
