@implementation TRANSITPbTransitMacTile

- (void)dealloc
{
  objc_super v3;

  -[TRANSITPbTransitMacTile setMacs:](self, "setMacs:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbTransitMacTile;
  -[TRANSITPbTransitMacTile dealloc](&v3, "dealloc");
}

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setTileX:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_tileX = a3;
}

- (void)setHasTileX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTileX
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setTileY:(int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_tileY = a3;
}

- (void)setHasTileY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTileY
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setGenerationTimeSecs:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_generationTimeSecs = a3;
}

- (void)setHasGenerationTimeSecs:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGenerationTimeSecs
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setExpirationAgeSecs:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_expirationAgeSecs = a3;
}

- (void)setHasExpirationAgeSecs:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpirationAgeSecs
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)clearMacs
{
  -[NSMutableArray removeAllObjects](self->_macs, "removeAllObjects");
}

- (void)addMacs:(id)a3
{
  NSMutableArray *macs;

  macs = self->_macs;
  if (!macs)
  {
    macs = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_macs = macs;
  }
  -[NSMutableArray addObject:](macs, "addObject:", a3);
}

- (unint64_t)macsCount
{
  return (unint64_t)-[NSMutableArray count](self->_macs, "count");
}

- (id)macsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_macs, "objectAtIndex:", a3);
}

+ (Class)macsType
{
  return (Class)objc_opt_class(TRANSITPbTransitMac, a2);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbTransitMacTile;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[TRANSITPbTransitMacTile description](&v3, "description"), -[TRANSITPbTransitMacTile dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;
  id v5;
  NSMutableArray *macs;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_version), CFSTR("version"));
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_tileX), CFSTR("tileX"));
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_tileY), CFSTR("tileY"));
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_generationTimeSecs), CFSTR("generationTimeSecs"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_expirationAgeSecs), CFSTR("expirationAgeSecs"));
LABEL_7:
  if (-[NSMutableArray count](self->_macs, "count"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_macs, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    macs = self->_macs;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](macs, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(macs);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](macs, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("macs"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1008C693C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *macs;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_version, 1);
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field(a3, self->_tileX, 2);
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field(a3, self->_tileY, 3);
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_18:
  PBDataWriterWriteDoubleField(a3, 4, self->_generationTimeSecs);
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_6:
    PBDataWriterWriteInt32Field(a3, self->_expirationAgeSecs, 5);
LABEL_7:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  macs = self->_macs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](macs, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(macs);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), 7);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](macs, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_version;
    *((_BYTE *)a3 + 44) |= 0x10u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 8) = self->_tileX;
  *((_BYTE *)a3 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
LABEL_15:
    *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_generationTimeSecs;
    *((_BYTE *)a3 + 44) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_14:
  *((_DWORD *)a3 + 9) = self->_tileY;
  *((_BYTE *)a3 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_15;
LABEL_5:
  if ((has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)a3 + 4) = self->_expirationAgeSecs;
    *((_BYTE *)a3 + 44) |= 2u;
  }
LABEL_7:
  if (-[TRANSITPbTransitMacTile macsCount](self, "macsCount"))
  {
    objc_msgSend(a3, "clearMacs");
    v6 = -[TRANSITPbTransitMacTile macsCount](self, "macsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addMacs:", -[TRANSITPbTransitMacTile macsAtIndex:](self, "macsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  char has;
  NSMutableArray *macs;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_version;
    *((_BYTE *)v5 + 44) |= 0x10u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 8) = self->_tileX;
  *((_BYTE *)v5 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v5 + 9) = self->_tileY;
  *((_BYTE *)v5 + 44) |= 8u;
  has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_18:
  *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_generationTimeSecs;
  *((_BYTE *)v5 + 44) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((_DWORD *)v5 + 4) = self->_expirationAgeSecs;
    *((_BYTE *)v5 + 44) |= 2u;
  }
LABEL_7:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  macs = self->_macs;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](macs, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(macs);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v6, "addMacs:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](macs, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSMutableArray *macs;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 0x10) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 0x10) == 0 || self->_version != *((_DWORD *)a3 + 10))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 44) & 0x10) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_tileX != *((_DWORD *)a3 + 8))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 44) & 4) != 0)
    {
      goto LABEL_29;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 8) == 0 || self->_tileY != *((_DWORD *)a3 + 9))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 44) & 8) != 0)
    {
      goto LABEL_29;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_generationTimeSecs != *((double *)a3 + 1))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 44) & 1) != 0)
    {
      goto LABEL_29;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_expirationAgeSecs != *((_DWORD *)a3 + 4))
        goto LABEL_29;
    }
    else if ((*((_BYTE *)a3 + 44) & 2) != 0)
    {
      goto LABEL_29;
    }
    macs = self->_macs;
    if ((unint64_t)macs | *((_QWORD *)a3 + 3))
      LOBYTE(v5) = -[NSMutableArray isEqual:](macs, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double generationTimeSecs;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;

  has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_tileX;
      if ((*(_BYTE *)&self->_has & 8) != 0)
        goto LABEL_4;
LABEL_11:
      v6 = 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        goto LABEL_5;
LABEL_12:
      v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_11;
LABEL_4:
  v6 = 2654435761 * self->_tileY;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_12;
LABEL_5:
  generationTimeSecs = self->_generationTimeSecs;
  v8 = -generationTimeSecs;
  if (generationTimeSecs >= 0.0)
    v8 = self->_generationTimeSecs;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_15:
  if ((has & 2) != 0)
    v12 = 2654435761 * self->_expirationAgeSecs;
  else
    v12 = 0;
  return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ (unint64_t)-[NSMutableArray hash](self->_macs, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = *((_BYTE *)a3 + 44);
  if ((v4 & 0x10) != 0)
  {
    self->_version = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 0x10u;
    v4 = *((_BYTE *)a3 + 44);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0)
        goto LABEL_4;
      goto LABEL_17;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_tileX = *((_DWORD *)a3 + 8);
  *(_BYTE *)&self->_has |= 4u;
  v4 = *((_BYTE *)a3 + 44);
  if ((v4 & 8) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0)
      goto LABEL_5;
    goto LABEL_18;
  }
LABEL_17:
  self->_tileY = *((_DWORD *)a3 + 9);
  *(_BYTE *)&self->_has |= 8u;
  v4 = *((_BYTE *)a3 + 44);
  if ((v4 & 1) == 0)
  {
LABEL_5:
    if ((v4 & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_18:
  self->_generationTimeSecs = *((double *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 44) & 2) != 0)
  {
LABEL_6:
    self->_expirationAgeSecs = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_7:
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 3);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[TRANSITPbTransitMacTile addMacs:](self, "addMacs:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (int)version
{
  return self->_version;
}

- (int)tileX
{
  return self->_tileX;
}

- (int)tileY
{
  return self->_tileY;
}

- (double)generationTimeSecs
{
  return self->_generationTimeSecs;
}

- (int)expirationAgeSecs
{
  return self->_expirationAgeSecs;
}

- (NSMutableArray)macs
{
  return self->_macs;
}

- (void)setMacs:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
