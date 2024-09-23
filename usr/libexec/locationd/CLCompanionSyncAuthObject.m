@implementation CLCompanionSyncAuthObject

- (void)dealloc
{
  objc_super v3;

  -[CLCompanionSyncAuthObject setClientKey:](self, "setClientKey:", 0);
  -[CLCompanionSyncAuthObject setVectorClocks:](self, "setVectorClocks:", 0);
  -[CLCompanionSyncAuthObject setInterestZones:](self, "setInterestZones:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CLCompanionSyncAuthObject;
  -[CLCompanionSyncAuthObject dealloc](&v3, "dealloc");
}

- (unsigned)authMask
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_authMask;
  else
    return 0;
}

- (void)setAuthMask:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_authMask = a3;
}

- (void)setHasAuthMask:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAuthMask
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setCorrectiveCompensationMask:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_correctiveCompensationMask = a3;
}

- (void)setHasCorrectiveCompensationMask:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCorrectiveCompensationMask
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)clearClient
{
  return (*(_BYTE *)&self->_has & 8) != 0 && self->_clearClient;
}

- (void)setClearClient:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_clearClient = a3;
}

- (void)setHasClearClient:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasClearClient
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)notification
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_notification;
  else
    return 0;
}

- (void)setNotification:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_notification = a3;
}

- (void)setHasNotification:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNotification
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (id)notificationAsString:(int)a3
{
  if (a3 >= 3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_10217B920 + a3);
}

- (int)StringAsNotification:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("RESET")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("TOGGLE")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("MIGRATION_SYNC_RESET_VERSION_NUMBERS")))
    return 2;
  return 0;
}

- (id)operationTypeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return *(&off_10217B938 + a3 - 1);
}

- (int)StringAsOperationType:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("ADD")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("UPDATE")) & 1) != 0)
    return 2;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("DELETE")))
    return 3;
  return 1;
}

- (void)clearVectorClocks
{
  -[NSMutableArray removeAllObjects](self->_vectorClocks, "removeAllObjects");
}

- (void)addVectorClocks:(id)a3
{
  NSMutableArray *vectorClocks;

  vectorClocks = self->_vectorClocks;
  if (!vectorClocks)
  {
    vectorClocks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_vectorClocks = vectorClocks;
  }
  -[NSMutableArray addObject:](vectorClocks, "addObject:", a3);
}

- (unint64_t)vectorClocksCount
{
  return (unint64_t)-[NSMutableArray count](self->_vectorClocks, "count");
}

- (id)vectorClocksAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_vectorClocks, "objectAtIndex:", a3);
}

+ (Class)vectorClocksType
{
  return (Class)objc_opt_class(CLAuthSyncVectorClock, a2);
}

- (void)clearInterestZones
{
  -[NSMutableArray removeAllObjects](self->_interestZones, "removeAllObjects");
}

- (void)addInterestZones:(id)a3
{
  NSMutableArray *interestZones;

  interestZones = self->_interestZones;
  if (!interestZones)
  {
    interestZones = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_interestZones = interestZones;
  }
  -[NSMutableArray addObject:](interestZones, "addObject:", a3);
}

- (unint64_t)interestZonesCount
{
  return (unint64_t)-[NSMutableArray count](self->_interestZones, "count");
}

- (id)interestZonesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_interestZones, "objectAtIndex:", a3);
}

+ (Class)interestZonesType
{
  return (Class)objc_opt_class(CLCompanionSyncInterestZone, a2);
}

- (BOOL)suppressShowingInSettings
{
  return (*(_BYTE *)&self->_has & 0x10) != 0 && self->_suppressShowingInSettings;
}

- (void)setSuppressShowingInSettings:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_suppressShowingInSettings = a3;
}

- (void)setHasSuppressShowingInSettings:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSuppressShowingInSettings
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *clientKey;
  char has;
  uint64_t notification;
  NSString *v8;
  int v9;
  NSString *v10;
  id v11;
  NSMutableArray *vectorClocks;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  NSMutableArray *interestZones;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  clientKey = self->_clientKey;
  if (clientKey)
    objc_msgSend(v3, "setObject:forKey:", clientKey, CFSTR("clientKey"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_authMask), CFSTR("authMask"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
      goto LABEL_10;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_correctiveCompensationMask), CFSTR("correctiveCompensationMask"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0)
      goto LABEL_15;
    goto LABEL_11;
  }
LABEL_10:
  objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_clearClient), CFSTR("clearClient"));
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_15;
LABEL_11:
  notification = self->_notification;
  if (notification >= 3)
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_notification);
  else
    v8 = (NSString *)*(&off_10217B920 + notification);
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("notification"));
LABEL_15:
  v9 = self->_operationType - 1;
  if (v9 >= 3)
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_operationType);
  else
    v10 = (NSString *)*(&off_10217B938 + v9);
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("operationType"));
  if (-[NSMutableArray count](self->_vectorClocks, "count"))
  {
    v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_vectorClocks, "count"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    vectorClocks = self->_vectorClocks;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](vectorClocks, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(vectorClocks);
          objc_msgSend(v11, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](vectorClocks, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v14);
    }
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("vectorClocks"));

  }
  if (-[NSMutableArray count](self->_interestZones, "count"))
  {
    v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_interestZones, "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    interestZones = self->_interestZones;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interestZones, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(_QWORD *)v25 != v21)
            objc_enumerationMutation(interestZones);
          objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
        }
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interestZones, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v20);
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("interestZones"));

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_suppressShowingInSettings), CFSTR("suppressShowingInSettings"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100C4FE4C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *clientKey;
  char has;
  NSMutableArray *vectorClocks;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  NSMutableArray *interestZones;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  clientKey = self->_clientKey;
  if (!clientKey)
    sub_101923A78();
  PBDataWriterWriteStringField(a3, clientKey, 1);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_authMask, 2);
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_4:
      if ((has & 4) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_4;
  }
  PBDataWriterWriteBOOLField(a3, self->_clearClient, 3);
  if ((*(_BYTE *)&self->_has & 4) != 0)
LABEL_5:
    PBDataWriterWriteInt32Field(a3, self->_notification, 4);
LABEL_6:
  PBDataWriterWriteInt32Field(a3, self->_operationType, 5);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  vectorClocks = self->_vectorClocks;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](vectorClocks, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(vectorClocks);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), 6);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](vectorClocks, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v9);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  interestZones = self->_interestZones;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interestZones, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(interestZones);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j), 7);
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interestZones, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v14);
  }
  v17 = (char)self->_has;
  if ((v17 & 2) != 0)
  {
    PBDataWriterWriteUint32Field(a3, self->_correctiveCompensationMask, 8);
    v17 = (char)self->_has;
  }
  if ((v17 & 0x10) != 0)
    PBDataWriterWriteBOOLField(a3, self->_suppressShowingInSettings, 9);
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  char v12;

  objc_msgSend(a3, "setClientKey:", self->_clientKey);
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_3;
LABEL_19:
    *((_BYTE *)a3 + 56) = self->_clearClient;
    *((_BYTE *)a3 + 60) |= 8u;
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)a3 + 2) = self->_authMask;
  *((_BYTE *)a3 + 60) |= 1u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_19;
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 9) = self->_notification;
    *((_BYTE *)a3 + 60) |= 4u;
  }
LABEL_5:
  *((_DWORD *)a3 + 10) = self->_operationType;
  if (-[CLCompanionSyncAuthObject vectorClocksCount](self, "vectorClocksCount"))
  {
    objc_msgSend(a3, "clearVectorClocks");
    v6 = -[CLCompanionSyncAuthObject vectorClocksCount](self, "vectorClocksCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addVectorClocks:", -[CLCompanionSyncAuthObject vectorClocksAtIndex:](self, "vectorClocksAtIndex:", i));
    }
  }
  if (-[CLCompanionSyncAuthObject interestZonesCount](self, "interestZonesCount"))
  {
    objc_msgSend(a3, "clearInterestZones");
    v9 = -[CLCompanionSyncAuthObject interestZonesCount](self, "interestZonesCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(a3, "addInterestZones:", -[CLCompanionSyncAuthObject interestZonesAtIndex:](self, "interestZonesAtIndex:", j));
    }
  }
  v12 = (char)self->_has;
  if ((v12 & 2) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_correctiveCompensationMask;
    *((_BYTE *)a3 + 60) |= 2u;
    v12 = (char)self->_has;
  }
  if ((v12 & 0x10) != 0)
  {
    *((_BYTE *)a3 + 57) = self->_suppressShowingInSettings;
    *((_BYTE *)a3 + 60) |= 0x10u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  char has;
  NSMutableArray *vectorClocks;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  NSMutableArray *interestZones;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  id v18;
  char v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");

  v5[3] = -[NSString copyWithZone:](self->_clientKey, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)v5 + 2) = self->_authMask;
    *((_BYTE *)v5 + 60) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v5 + 56) = self->_clearClient;
  *((_BYTE *)v5 + 60) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 9) = self->_notification;
    *((_BYTE *)v5 + 60) |= 4u;
  }
LABEL_5:
  *((_DWORD *)v5 + 10) = self->_operationType;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  vectorClocks = self->_vectorClocks;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](vectorClocks, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(vectorClocks);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v5, "addVectorClocks:", v12);

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](vectorClocks, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  interestZones = self->_interestZones;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interestZones, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(interestZones);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        objc_msgSend(v5, "addInterestZones:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](interestZones, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }
  v19 = (char)self->_has;
  if ((v19 & 2) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_correctiveCompensationMask;
    *((_BYTE *)v5 + 60) |= 2u;
    v19 = (char)self->_has;
  }
  if ((v19 & 0x10) != 0)
  {
    *((_BYTE *)v5 + 57) = self->_suppressShowingInSettings;
    *((_BYTE *)v5 + 60) |= 0x10u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *clientKey;
  NSMutableArray *vectorClocks;
  NSMutableArray *interestZones;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (!v5)
    return v5;
  clientKey = self->_clientKey;
  if ((unint64_t)clientKey | *((_QWORD *)a3 + 3))
  {
    v5 = -[NSString isEqual:](clientKey, "isEqual:");
    if (!v5)
      return v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 60) & 1) == 0 || self->_authMask != *((_DWORD *)a3 + 2))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)a3 + 60) & 1) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)a3 + 60) & 8) == 0)
      goto LABEL_34;
    if (self->_clearClient)
    {
      if (!*((_BYTE *)a3 + 56))
        goto LABEL_34;
    }
    else if (*((_BYTE *)a3 + 56))
    {
      goto LABEL_34;
    }
  }
  else if ((*((_BYTE *)a3 + 60) & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)a3 + 60) & 4) == 0 || self->_notification != *((_DWORD *)a3 + 9))
      goto LABEL_34;
  }
  else if ((*((_BYTE *)a3 + 60) & 4) != 0)
  {
    goto LABEL_34;
  }
  if (self->_operationType != *((_DWORD *)a3 + 10))
  {
LABEL_34:
    LOBYTE(v5) = 0;
    return v5;
  }
  vectorClocks = self->_vectorClocks;
  if (!((unint64_t)vectorClocks | *((_QWORD *)a3 + 6))
    || (v5 = -[NSMutableArray isEqual:](vectorClocks, "isEqual:")) != 0)
  {
    interestZones = self->_interestZones;
    if (!((unint64_t)interestZones | *((_QWORD *)a3 + 2))
      || (v5 = -[NSMutableArray isEqual:](interestZones, "isEqual:")) != 0)
    {
      if ((*(_BYTE *)&self->_has & 2) != 0)
      {
        if ((*((_BYTE *)a3 + 60) & 2) == 0 || self->_correctiveCompensationMask != *((_DWORD *)a3 + 8))
          goto LABEL_34;
      }
      else if ((*((_BYTE *)a3 + 60) & 2) != 0)
      {
        goto LABEL_34;
      }
      LOBYTE(v5) = (*((_BYTE *)a3 + 60) & 0x10) == 0;
      if ((*(_BYTE *)&self->_has & 0x10) != 0)
      {
        if ((*((_BYTE *)a3 + 60) & 0x10) == 0)
          goto LABEL_34;
        if (self->_suppressShowingInSettings)
        {
          if (!*((_BYTE *)a3 + 57))
            goto LABEL_34;
        }
        else if (*((_BYTE *)a3 + 57))
        {
          goto LABEL_34;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t operationType;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_clientKey, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761 * self->_authMask;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_clearClient;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_notification;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  operationType = self->_operationType;
  v8 = (unint64_t)-[NSMutableArray hash](self->_vectorClocks, "hash");
  v9 = (unint64_t)-[NSMutableArray hash](self->_interestZones, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v10 = 2654435761 * self->_correctiveCompensationMask;
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
      goto LABEL_10;
LABEL_12:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ (2654435761 * operationType) ^ v10 ^ v11;
  }
  v10 = 0;
  if ((*(_BYTE *)&self->_has & 0x10) == 0)
    goto LABEL_12;
LABEL_10:
  v11 = 2654435761 * self->_suppressShowingInSettings;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v9 ^ (2654435761 * operationType) ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  if (*((_QWORD *)a3 + 3))
    -[CLCompanionSyncAuthObject setClientKey:](self, "setClientKey:");
  v5 = *((_BYTE *)a3 + 60);
  if ((v5 & 1) != 0)
  {
    self->_authMask = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)a3 + 60) & 8) == 0)
  {
    goto LABEL_5;
  }
  self->_clearClient = *((_BYTE *)a3 + 56);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)a3 + 60) & 4) != 0)
  {
LABEL_6:
    self->_notification = *((_DWORD *)a3 + 9);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_7:
  self->_operationType = *((_DWORD *)a3 + 10);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = (void *)*((_QWORD *)a3 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        -[CLCompanionSyncAuthObject addVectorClocks:](self, "addVectorClocks:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = (void *)*((_QWORD *)a3 + 2);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        -[CLCompanionSyncAuthObject addInterestZones:](self, "addInterestZones:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }
  v16 = *((_BYTE *)a3 + 60);
  if ((v16 & 2) != 0)
  {
    self->_correctiveCompensationMask = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v16 = *((_BYTE *)a3 + 60);
  }
  if ((v16 & 0x10) != 0)
  {
    self->_suppressShowingInSettings = *((_BYTE *)a3 + 57);
    *(_BYTE *)&self->_has |= 0x10u;
  }
}

- (NSString)clientKey
{
  return self->_clientKey;
}

- (void)setClientKey:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (unsigned)correctiveCompensationMask
{
  return self->_correctiveCompensationMask;
}

- (int)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(int)a3
{
  self->_operationType = a3;
}

- (NSMutableArray)vectorClocks
{
  return self->_vectorClocks;
}

- (void)setVectorClocks:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)interestZones
{
  return self->_interestZones;
}

- (void)setInterestZones:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (id)syncId
{
  return self->_clientKey;
}

- (void)setSyncId:(id)a3
{
  self->_clientKey = (NSString *)a3;
}

- (NSString)objectIdentifier
{
  return self->_clientKey;
}

- (void)setObjectIdentifier:(id)a3
{
  self->_clientKey = (NSString *)a3;
}

- (NSString)sequencer
{
  return 0;
}

- (int64_t)changeType
{
  uint64_t v2;

  v2 = (self->_operationType - 1);
  if (v2 < 3)
    return v2 + 1;
  else
    return 0;
}

- (void)setChangeType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 2)
    self->_operationType = a3;
}

- (NSString)description
{
  uint64_t v4;

  if (-[CLCompanionSyncAuthObject hasNotification](self, "hasNotification"))
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[notification: %d, globalAuth: %d]"), self->_notification, self->_authMask, v4);
  else
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[clientKey: %@, auth: %d, clear: %d]"), self->_clientKey, self->_authMask, self->_clearClient);
}

@end
