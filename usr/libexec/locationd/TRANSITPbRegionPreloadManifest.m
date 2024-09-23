@implementation TRANSITPbRegionPreloadManifest

- (void)dealloc
{
  objc_super v3;

  -[TRANSITPbRegionPreloadManifest setMarkets:](self, "setMarkets:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbRegionPreloadManifest;
  -[TRANSITPbRegionPreloadManifest dealloc](&v3, "dealloc");
}

- (void)setVersion:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
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

- (void)clearMarkets
{
  -[NSMutableArray removeAllObjects](self->_markets, "removeAllObjects");
}

- (void)addMarkets:(id)a3
{
  NSMutableArray *markets;

  markets = self->_markets;
  if (!markets)
  {
    markets = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_markets = markets;
  }
  -[NSMutableArray addObject:](markets, "addObject:", a3);
}

- (unint64_t)marketsCount
{
  return (unint64_t)-[NSMutableArray count](self->_markets, "count");
}

- (id)marketsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_markets, "objectAtIndex:", a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbRegionPreloadManifest;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[TRANSITPbRegionPreloadManifest description](&v3, "description"), -[TRANSITPbRegionPreloadManifest dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;
  id v5;
  NSMutableArray *markets;
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
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_version), CFSTR("version"));
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_generationTimeSecs), CFSTR("generationTimeSecs"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_expirationAgeSecs), CFSTR("expirationAgeSecs"));
LABEL_5:
  if (-[NSMutableArray count](self->_markets, "count"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_markets, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    markets = self->_markets;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](markets, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(markets);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](markets, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("markets"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1007921BC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *markets;
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
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field(a3, self->_version, 1);
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField(a3, 2, self->_generationTimeSecs);
  if ((*(_BYTE *)&self->_has & 2) != 0)
LABEL_4:
    PBDataWriterWriteInt32Field(a3, self->_expirationAgeSecs, 3);
LABEL_5:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  markets = self->_markets;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](markets, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(markets);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), 4);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](markets, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_3;
LABEL_11:
    *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_generationTimeSecs;
    *((_BYTE *)a3 + 36) |= 1u;
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)a3 + 8) = self->_version;
  *((_BYTE *)a3 + 36) |= 4u;
  has = (char)self->_has;
  if ((has & 1) != 0)
    goto LABEL_11;
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 4) = self->_expirationAgeSecs;
    *((_BYTE *)a3 + 36) |= 2u;
  }
LABEL_5:
  if (-[TRANSITPbRegionPreloadManifest marketsCount](self, "marketsCount"))
  {
    objc_msgSend(a3, "clearMarkets");
    v6 = -[TRANSITPbRegionPreloadManifest marketsCount](self, "marketsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addMarkets:", -[TRANSITPbRegionPreloadManifest marketsAtIndex:](self, "marketsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  char has;
  NSMutableArray *markets;
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
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_version;
    *((_BYTE *)v5 + 36) |= 4u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_generationTimeSecs;
  *((_BYTE *)v5 + 36) |= 1u;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)v5 + 4) = self->_expirationAgeSecs;
    *((_BYTE *)v5 + 36) |= 2u;
  }
LABEL_5:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  markets = self->_markets;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](markets, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(markets);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v6, "addMarkets:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](markets, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSMutableArray *markets;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 4) == 0 || self->_version != *((_DWORD *)a3 + 8))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 36) & 4) != 0)
    {
LABEL_19:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_generationTimeSecs != *((double *)a3 + 1))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
      goto LABEL_19;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_expirationAgeSecs != *((_DWORD *)a3 + 4))
        goto LABEL_19;
    }
    else if ((*((_BYTE *)a3 + 36) & 2) != 0)
    {
      goto LABEL_19;
    }
    markets = self->_markets;
    if ((unint64_t)markets | *((_QWORD *)a3 + 3))
      LOBYTE(v5) = -[NSMutableArray isEqual:](markets, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  double generationTimeSecs;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  generationTimeSecs = self->_generationTimeSecs;
  v6 = -generationTimeSecs;
  if (generationTimeSecs >= 0.0)
    v6 = self->_generationTimeSecs;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 2) != 0)
    v10 = 2654435761 * self->_expirationAgeSecs;
  else
    v10 = 0;
  return v9 ^ v4 ^ v10 ^ (unint64_t)-[NSMutableArray hash](self->_markets, "hash");
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

  v4 = *((_BYTE *)a3 + 36);
  if ((v4 & 4) != 0)
  {
    self->_version = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 4u;
    v4 = *((_BYTE *)a3 + 36);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 36) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_generationTimeSecs = *((double *)a3 + 1);
  *(_BYTE *)&self->_has |= 1u;
  if ((*((_BYTE *)a3 + 36) & 2) != 0)
  {
LABEL_4:
    self->_expirationAgeSecs = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }
LABEL_5:
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
        -[TRANSITPbRegionPreloadManifest addMarkets:](self, "addMarkets:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i));
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

- (double)generationTimeSecs
{
  return self->_generationTimeSecs;
}

- (int)expirationAgeSecs
{
  return self->_expirationAgeSecs;
}

- (NSMutableArray)markets
{
  return self->_markets;
}

- (void)setMarkets:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
