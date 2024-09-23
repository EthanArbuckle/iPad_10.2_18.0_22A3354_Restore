@implementation AWDMMCSChunkingInfo

- (void)dealloc
{
  objc_super v3;

  -[AWDMMCSChunkingInfo setErrorDomain:](self, "setErrorDomain:", 0);
  -[AWDMMCSChunkingInfo setChunkingErrors:](self, "setChunkingErrors:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSChunkingInfo;
  -[AWDMMCSChunkingInfo dealloc](&v3, sel_dealloc);
}

- (void)setChunkCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_chunkCount = a3;
}

- (void)setHasChunkCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasChunkCount
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setByteCount:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_byteCount = a3;
}

- (void)setHasByteCount:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasByteCount
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setStartTime:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_startTime = a3;
}

- (void)setHasStartTime:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStartTime
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDuration:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (void)setErrorCode:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setCancelled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_cancelled = a3;
}

- (void)setHasCancelled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasCancelled
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)clearChunkingErrors
{
  -[NSMutableArray removeAllObjects](self->_chunkingErrors, "removeAllObjects");
}

- (void)addChunkingError:(id)a3
{
  NSMutableArray *chunkingErrors;

  chunkingErrors = self->_chunkingErrors;
  if (!chunkingErrors)
  {
    chunkingErrors = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_chunkingErrors = chunkingErrors;
  }
  -[NSMutableArray addObject:](chunkingErrors, "addObject:", a3);
}

- (unint64_t)chunkingErrorsCount
{
  return -[NSMutableArray count](self->_chunkingErrors, "count");
}

- (id)chunkingErrorAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_chunkingErrors, "objectAtIndex:", a3);
}

+ (Class)chunkingErrorType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDMMCSChunkingInfo;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDMMCSChunkingInfo description](&v3, sel_description), -[AWDMMCSChunkingInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *errorDomain;
  char v6;
  void *v7;
  NSMutableArray *chunkingErrors;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_chunkCount), CFSTR("chunkCount"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_byteCount), CFSTR("byteCount"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_startTime), CFSTR("startTime"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_duration), CFSTR("duration"));
LABEL_6:
  errorDomain = self->_errorDomain;
  if (errorDomain)
    objc_msgSend(v3, "setObject:forKey:", errorDomain, CFSTR("errorDomain"));
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_errorCode), CFSTR("errorCode"));
    v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_cancelled), CFSTR("cancelled"));
  if (-[NSMutableArray count](self->_chunkingErrors, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_chunkingErrors, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    chunkingErrors = self->_chunkingErrors;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chunkingErrors, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(chunkingErrors);
          objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chunkingErrors, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("chunkingError"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMMCSChunkingInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  char v5;
  NSMutableArray *chunkingErrors;
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
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_22:
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_5:
    PBDataWriterWriteInt64Field();
LABEL_6:
  if (self->_errorDomain)
    PBDataWriterWriteStringField();
  v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = (char)self->_has;
  }
  if ((v5 & 0x20) != 0)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  chunkingErrors = self->_chunkingErrors;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chunkingErrors, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(chunkingErrors);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chunkingErrors, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  char v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t i;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_QWORD *)a3 + 2) = self->_chunkCount;
    *((_BYTE *)a3 + 68) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 1) = self->_byteCount;
  *((_BYTE *)a3 + 68) |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_19:
  *((_QWORD *)a3 + 4) = self->_startTime;
  *((_BYTE *)a3 + 68) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    *((_QWORD *)a3 + 3) = self->_duration;
    *((_BYTE *)a3 + 68) |= 4u;
  }
LABEL_6:
  if (self->_errorDomain)
    objc_msgSend(a3, "setErrorDomain:");
  v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_errorCode;
    *((_BYTE *)a3 + 68) |= 0x10u;
    v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    *((_BYTE *)a3 + 64) = self->_cancelled;
    *((_BYTE *)a3 + 68) |= 0x20u;
  }
  if (-[AWDMMCSChunkingInfo chunkingErrorsCount](self, "chunkingErrorsCount"))
  {
    objc_msgSend(a3, "clearChunkingErrors");
    v7 = -[AWDMMCSChunkingInfo chunkingErrorsCount](self, "chunkingErrorsCount");
    if (v7)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
        objc_msgSend(a3, "addChunkingError:", -[AWDMMCSChunkingInfo chunkingErrorAtIndex:](self, "chunkingErrorAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  char v8;
  NSMutableArray *chunkingErrors;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_chunkCount;
    *(_BYTE *)(v5 + 68) |= 2u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 8) = self->_byteCount;
  *(_BYTE *)(v5 + 68) |= 1u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_20:
  *(_QWORD *)(v5 + 32) = self->_startTime;
  *(_BYTE *)(v5 + 68) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    *(_QWORD *)(v5 + 24) = self->_duration;
    *(_BYTE *)(v5 + 68) |= 4u;
  }
LABEL_6:

  *(_QWORD *)(v6 + 56) = -[NSString copyWithZone:](self->_errorDomain, "copyWithZone:", a3);
  v8 = (char)self->_has;
  if ((v8 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_errorCode;
    *(_BYTE *)(v6 + 68) |= 0x10u;
    v8 = (char)self->_has;
  }
  if ((v8 & 0x20) != 0)
  {
    *(_BYTE *)(v6 + 64) = self->_cancelled;
    *(_BYTE *)(v6 + 68) |= 0x20u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  chunkingErrors = self->_chunkingErrors;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chunkingErrors, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(chunkingErrors);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addChunkingError:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](chunkingErrors, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  char has;
  NSString *errorDomain;
  NSMutableArray *chunkingErrors;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    has = (char)self->_has;
    if ((has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 2) == 0 || self->_chunkCount != *((_QWORD *)a3 + 2))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 68) & 2) != 0)
    {
      goto LABEL_34;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 1) == 0 || self->_byteCount != *((_QWORD *)a3 + 1))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 68) & 1) != 0)
    {
      goto LABEL_34;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 8) == 0 || self->_startTime != *((_QWORD *)a3 + 4))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 68) & 8) != 0)
    {
      goto LABEL_34;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 4) == 0 || self->_duration != *((_QWORD *)a3 + 3))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 68) & 4) != 0)
    {
      goto LABEL_34;
    }
    errorDomain = self->_errorDomain;
    if ((unint64_t)errorDomain | *((_QWORD *)a3 + 7))
    {
      v5 = -[NSString isEqual:](errorDomain, "isEqual:");
      if (!v5)
        return v5;
      has = (char)self->_has;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 0x10) == 0 || self->_errorCode != *((_DWORD *)a3 + 12))
        goto LABEL_34;
    }
    else if ((*((_BYTE *)a3 + 68) & 0x10) != 0)
    {
      goto LABEL_34;
    }
    if ((has & 0x20) != 0)
    {
      if ((*((_BYTE *)a3 + 68) & 0x20) != 0)
      {
        if (self->_cancelled)
        {
          if (!*((_BYTE *)a3 + 64))
            goto LABEL_34;
          goto LABEL_40;
        }
        if (!*((_BYTE *)a3 + 64))
        {
LABEL_40:
          chunkingErrors = self->_chunkingErrors;
          if ((unint64_t)chunkingErrors | *((_QWORD *)a3 + 5))
            LOBYTE(v5) = -[NSMutableArray isEqual:](chunkingErrors, "isEqual:");
          else
            LOBYTE(v5) = 1;
          return v5;
        }
      }
    }
    else if ((*((_BYTE *)a3 + 68) & 0x20) == 0)
    {
      goto LABEL_40;
    }
LABEL_34:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_chunkCount;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_byteCount;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_8:
      v5 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_8;
LABEL_4:
  v5 = 2654435761 * self->_startTime;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_5:
    v6 = 2654435761 * self->_duration;
    goto LABEL_10;
  }
LABEL_9:
  v6 = 0;
LABEL_10:
  v7 = -[NSString hash](self->_errorDomain, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v8 = 2654435761 * self->_errorCode;
    if ((*(_BYTE *)&self->_has & 0x20) != 0)
      goto LABEL_12;
LABEL_14:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v7 ^ -[NSMutableArray hash](self->_chunkingErrors, "hash");
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
    goto LABEL_14;
LABEL_12:
  v9 = 2654435761 * self->_cancelled;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ v7 ^ -[NSMutableArray hash](self->_chunkingErrors, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  char v6;
  void *v7;
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
  v5 = *((_BYTE *)a3 + 68);
  if ((v5 & 2) != 0)
  {
    self->_chunkCount = *((_QWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 68);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_22;
    }
  }
  else if ((*((_BYTE *)a3 + 68) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_byteCount = *((_QWORD *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)a3 + 68);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_22:
  self->_startTime = *((_QWORD *)a3 + 4);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 68) & 4) != 0)
  {
LABEL_5:
    self->_duration = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_6:
  if (*((_QWORD *)a3 + 7))
    -[AWDMMCSChunkingInfo setErrorDomain:](self, "setErrorDomain:");
  v6 = *((_BYTE *)a3 + 68);
  if ((v6 & 0x10) != 0)
  {
    self->_errorCode = *((_DWORD *)a3 + 12);
    *(_BYTE *)&self->_has |= 0x10u;
    v6 = *((_BYTE *)a3 + 68);
  }
  if ((v6 & 0x20) != 0)
  {
    self->_cancelled = *((_BYTE *)a3 + 64);
    *(_BYTE *)&self->_has |= 0x20u;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 5);
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
        -[AWDMMCSChunkingInfo addChunkingError:](self, "addChunkingError:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
}

- (int64_t)chunkCount
{
  return self->_chunkCount;
}

- (int64_t)byteCount
{
  return self->_byteCount;
}

- (int64_t)startTime
{
  return self->_startTime;
}

- (int64_t)duration
{
  return self->_duration;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (int)errorCode
{
  return self->_errorCode;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (NSMutableArray)chunkingErrors
{
  return self->_chunkingErrors;
}

- (void)setChunkingErrors:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
