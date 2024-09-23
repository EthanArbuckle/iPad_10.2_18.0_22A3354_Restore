@implementation AWDSiriSession

- (void)dealloc
{
  objc_super v3;

  -[AWDSiriSession setCompanionModel:](self, "setCompanionModel:", 0);
  -[AWDSiriSession setCompanionOS:](self, "setCompanionOS:", 0);
  -[AWDSiriSession setSiriRequests:](self, "setSiriRequests:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSiriSession;
  -[AWDSiriSession dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSessionStartTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_sessionStartTimestamp = a3;
}

- (void)setHasSessionStartTimestamp:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSessionStartTimestamp
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSessionEndTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_sessionEndTimestamp = a3;
}

- (void)setHasSessionEndTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSessionEndTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasCompanionModel
{
  return self->_companionModel != 0;
}

- (BOOL)hasCompanionOS
{
  return self->_companionOS != 0;
}

- (void)clearSiriRequests
{
  -[NSMutableArray removeAllObjects](self->_siriRequests, "removeAllObjects");
}

- (void)addSiriRequest:(id)a3
{
  NSMutableArray *siriRequests;

  siriRequests = self->_siriRequests;
  if (!siriRequests)
  {
    siriRequests = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_siriRequests = siriRequests;
  }
  -[NSMutableArray addObject:](siriRequests, "addObject:", a3);
}

- (unint64_t)siriRequestsCount
{
  return -[NSMutableArray count](self->_siriRequests, "count");
}

- (id)siriRequestAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_siriRequests, "objectAtIndex:", a3);
}

+ (Class)siriRequestType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSiriSession;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSiriSession description](&v3, sel_description), -[AWDSiriSession dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *companionModel;
  NSString *companionOS;
  void *v7;
  NSMutableArray *siriRequests;
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
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sessionStartTimestamp), CFSTR("sessionStartTimestamp"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_sessionEndTimestamp), CFSTR("sessionEndTimestamp"));
LABEL_5:
  companionModel = self->_companionModel;
  if (companionModel)
    objc_msgSend(v3, "setObject:forKey:", companionModel, CFSTR("companionModel"));
  companionOS = self->_companionOS;
  if (companionOS)
    objc_msgSend(v3, "setObject:forKey:", companionOS, CFSTR("companionOS"));
  if (-[NSMutableArray count](self->_siriRequests, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_siriRequests, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    siriRequests = self->_siriRequests;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](siriRequests, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(siriRequests);
          objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](siriRequests, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("siriRequest"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSiriSessionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *siriRequests;
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

  v15 = *MEMORY[0x24BDAC8D0];
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    PBDataWriterWriteUint64Field();
LABEL_5:
  if (self->_companionModel)
    PBDataWriterWriteStringField();
  if (self->_companionOS)
    PBDataWriterWriteStringField();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  siriRequests = self->_siriRequests;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](siriRequests, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(siriRequests);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](siriRequests, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_QWORD *)a3 + 3) = self->_timestamp;
    *((_BYTE *)a3 + 56) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 2) = self->_sessionStartTimestamp;
  *((_BYTE *)a3 + 56) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)a3 + 1) = self->_sessionEndTimestamp;
    *((_BYTE *)a3 + 56) |= 1u;
  }
LABEL_5:
  if (self->_companionModel)
    objc_msgSend(a3, "setCompanionModel:");
  if (self->_companionOS)
    objc_msgSend(a3, "setCompanionOS:");
  if (-[AWDSiriSession siriRequestsCount](self, "siriRequestsCount"))
  {
    objc_msgSend(a3, "clearSiriRequests");
    v6 = -[AWDSiriSession siriRequestsCount](self, "siriRequestsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addSiriRequest:", -[AWDSiriSession siriRequestAtIndex:](self, "siriRequestAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  NSMutableArray *siriRequests;
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
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_timestamp;
    *(_BYTE *)(v5 + 56) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_sessionStartTimestamp;
  *(_BYTE *)(v5 + 56) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 8) = self->_sessionEndTimestamp;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
LABEL_5:

  *(_QWORD *)(v6 + 32) = -[NSString copyWithZone:](self->_companionModel, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 40) = -[NSString copyWithZone:](self->_companionOS, "copyWithZone:", a3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  siriRequests = self->_siriRequests;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](siriRequests, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(siriRequests);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addSiriRequest:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](siriRequests, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *companionModel;
  NSString *companionOS;
  NSMutableArray *siriRequests;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 4) == 0 || self->_timestamp != *((_QWORD *)a3 + 3))
        goto LABEL_23;
    }
    else if ((*((_BYTE *)a3 + 56) & 4) != 0)
    {
LABEL_23:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 2) == 0 || self->_sessionStartTimestamp != *((_QWORD *)a3 + 2))
        goto LABEL_23;
    }
    else if ((*((_BYTE *)a3 + 56) & 2) != 0)
    {
      goto LABEL_23;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 56) & 1) == 0 || self->_sessionEndTimestamp != *((_QWORD *)a3 + 1))
        goto LABEL_23;
    }
    else if ((*((_BYTE *)a3 + 56) & 1) != 0)
    {
      goto LABEL_23;
    }
    companionModel = self->_companionModel;
    if (!((unint64_t)companionModel | *((_QWORD *)a3 + 4))
      || (v5 = -[NSString isEqual:](companionModel, "isEqual:")) != 0)
    {
      companionOS = self->_companionOS;
      if (!((unint64_t)companionOS | *((_QWORD *)a3 + 5))
        || (v5 = -[NSString isEqual:](companionOS, "isEqual:")) != 0)
      {
        siriRequests = self->_siriRequests;
        if ((unint64_t)siriRequests | *((_QWORD *)a3 + 6))
          LOBYTE(v5) = -[NSMutableArray isEqual:](siriRequests, "isEqual:");
        else
          LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761u * self->_timestamp;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761u * self->_sessionStartTimestamp;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761u * self->_sessionEndTimestamp;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_companionModel, "hash");
  v7 = -[NSString hash](self->_companionOS, "hash");
  return v6 ^ v7 ^ -[NSMutableArray hash](self->_siriRequests, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;
  void *v6;
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
  v5 = *((_BYTE *)a3 + 56);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 3);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 56);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 56) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_sessionStartTimestamp = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 56) & 1) != 0)
  {
LABEL_4:
    self->_sessionEndTimestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((_QWORD *)a3 + 4))
    -[AWDSiriSession setCompanionModel:](self, "setCompanionModel:");
  if (*((_QWORD *)a3 + 5))
    -[AWDSiriSession setCompanionOS:](self, "setCompanionOS:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        -[AWDSiriSession addSiriRequest:](self, "addSiriRequest:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)sessionStartTimestamp
{
  return self->_sessionStartTimestamp;
}

- (unint64_t)sessionEndTimestamp
{
  return self->_sessionEndTimestamp;
}

- (NSString)companionModel
{
  return self->_companionModel;
}

- (void)setCompanionModel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSString)companionOS
{
  return self->_companionOS;
}

- (void)setCompanionOS:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)siriRequests
{
  return self->_siriRequests;
}

- (void)setSiriRequests:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

@end
