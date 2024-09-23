@implementation TRANSITPbRegionPreloadMarket

- (void)dealloc
{
  objc_super v3;

  -[TRANSITPbRegionPreloadMarket setTiles:](self, "setTiles:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbRegionPreloadMarket;
  -[TRANSITPbRegionPreloadMarket dealloc](&v3, "dealloc");
}

- (void)setNorthWestLatitude:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_northWestLatitude = a3;
}

- (void)setHasNorthWestLatitude:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNorthWestLatitude
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setNorthWestLongitude:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_northWestLongitude = a3;
}

- (void)setHasNorthWestLongitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNorthWestLongitude
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSouthEastLatitude:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_southEastLatitude = a3;
}

- (void)setHasSouthEastLatitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSouthEastLatitude
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setSouthEastLongitude:(double)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_southEastLongitude = a3;
}

- (void)setHasSouthEastLongitude:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSouthEastLongitude
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)clearTiles
{
  -[NSMutableArray removeAllObjects](self->_tiles, "removeAllObjects");
}

- (void)addTiles:(id)a3
{
  NSMutableArray *tiles;

  tiles = self->_tiles;
  if (!tiles)
  {
    tiles = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_tiles = tiles;
  }
  -[NSMutableArray addObject:](tiles, "addObject:", a3);
}

- (unint64_t)tilesCount
{
  return (unint64_t)-[NSMutableArray count](self->_tiles, "count");
}

- (id)tilesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_tiles, "objectAtIndex:", a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRANSITPbRegionPreloadMarket;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[TRANSITPbRegionPreloadMarket description](&v3, "description"), -[TRANSITPbRegionPreloadMarket dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  char has;
  id v5;
  NSMutableArray *tiles;
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
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_northWestLatitude), CFSTR("northWestLatitude"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_northWestLongitude), CFSTR("northWestLongitude"));
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_southEastLatitude), CFSTR("southEastLatitude"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_southEastLongitude), CFSTR("southEastLongitude"));
LABEL_6:
  if (-[NSMutableArray count](self->_tiles, "count"))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_tiles, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    tiles = self->_tiles;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tiles, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(tiles);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tiles, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("tiles"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100886358(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *tiles;
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
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField(a3, 1, self->_northWestLatitude);
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField(a3, 2, self->_northWestLongitude);
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteDoubleField(a3, 3, self->_southEastLatitude);
  if ((*(_BYTE *)&self->_has & 8) != 0)
LABEL_5:
    PBDataWriterWriteDoubleField(a3, 4, self->_southEastLongitude);
LABEL_6:
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  tiles = self->_tiles;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tiles, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(tiles);
        PBDataWriterWriteSubmessage(a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), 5);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tiles, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = *(_QWORD *)&self->_northWestLatitude;
    *((_BYTE *)a3 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
LABEL_13:
      *((_QWORD *)a3 + 3) = *(_QWORD *)&self->_southEastLatitude;
      *((_BYTE *)a3 + 48) |= 4u;
      if ((*(_BYTE *)&self->_has & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 2) = *(_QWORD *)&self->_northWestLongitude;
  *((_BYTE *)a3 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_13;
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((_QWORD *)a3 + 4) = *(_QWORD *)&self->_southEastLongitude;
    *((_BYTE *)a3 + 48) |= 8u;
  }
LABEL_6:
  if (-[TRANSITPbRegionPreloadMarket tilesCount](self, "tilesCount"))
  {
    objc_msgSend(a3, "clearTiles");
    v6 = -[TRANSITPbRegionPreloadMarket tilesCount](self, "tilesCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addTiles:", -[TRANSITPbRegionPreloadMarket tilesAtIndex:](self, "tilesAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  char has;
  NSMutableArray *tiles;
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
  if ((has & 1) != 0)
  {
    *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_northWestLatitude;
    *((_BYTE *)v5 + 48) |= 1u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)v5 + 2) = *(_QWORD *)&self->_northWestLongitude;
  *((_BYTE *)v5 + 48) |= 2u;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_16:
  *((_QWORD *)v5 + 3) = *(_QWORD *)&self->_southEastLatitude;
  *((_BYTE *)v5 + 48) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_5:
    *((_QWORD *)v5 + 4) = *(_QWORD *)&self->_southEastLongitude;
    *((_BYTE *)v5 + 48) |= 8u;
  }
LABEL_6:
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  tiles = self->_tiles;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tiles, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(tiles);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v6, "addTiles:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](tiles, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSMutableArray *tiles;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 1) == 0 || self->_northWestLatitude != *((double *)a3 + 1))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 1) != 0)
    {
LABEL_24:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 2) == 0 || self->_northWestLongitude != *((double *)a3 + 2))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 2) != 0)
    {
      goto LABEL_24;
    }
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 4) == 0 || self->_southEastLatitude != *((double *)a3 + 3))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 4) != 0)
    {
      goto LABEL_24;
    }
    if ((*(_BYTE *)&self->_has & 8) != 0)
    {
      if ((*((_BYTE *)a3 + 48) & 8) == 0 || self->_southEastLongitude != *((double *)a3 + 4))
        goto LABEL_24;
    }
    else if ((*((_BYTE *)a3 + 48) & 8) != 0)
    {
      goto LABEL_24;
    }
    tiles = self->_tiles;
    if ((unint64_t)tiles | *((_QWORD *)a3 + 5))
      LOBYTE(v5) = -[NSMutableArray isEqual:](tiles, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  char has;
  unint64_t v4;
  double northWestLatitude;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double northWestLongitude;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double southEastLatitude;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double southEastLongitude;
  double v21;
  long double v22;
  double v23;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    northWestLatitude = self->_northWestLatitude;
    v6 = -northWestLatitude;
    if (northWestLatitude >= 0.0)
      v6 = self->_northWestLatitude;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((has & 2) != 0)
  {
    northWestLongitude = self->_northWestLongitude;
    v11 = -northWestLongitude;
    if (northWestLongitude >= 0.0)
      v11 = self->_northWestLongitude;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((has & 4) != 0)
  {
    southEastLatitude = self->_southEastLatitude;
    v16 = -southEastLatitude;
    if (southEastLatitude >= 0.0)
      v16 = self->_southEastLatitude;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((has & 8) != 0)
  {
    southEastLongitude = self->_southEastLongitude;
    v21 = -southEastLongitude;
    if (southEastLongitude >= 0.0)
      v21 = self->_southEastLongitude;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ (unint64_t)-[NSMutableArray hash](self->_tiles, "hash");
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

  v4 = *((_BYTE *)a3 + 48);
  if ((v4 & 1) != 0)
  {
    self->_northWestLatitude = *((double *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v4 = *((_BYTE *)a3 + 48);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)a3 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_northWestLongitude = *((double *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  v4 = *((_BYTE *)a3 + 48);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_16:
  self->_southEastLatitude = *((double *)a3 + 3);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)a3 + 48) & 8) != 0)
  {
LABEL_5:
    self->_southEastLongitude = *((double *)a3 + 4);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_6:
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 5);
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
        -[TRANSITPbRegionPreloadMarket addTiles:](self, "addTiles:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (double)northWestLatitude
{
  return self->_northWestLatitude;
}

- (double)northWestLongitude
{
  return self->_northWestLongitude;
}

- (double)southEastLatitude
{
  return self->_southEastLatitude;
}

- (double)southEastLongitude
{
  return self->_southEastLongitude;
}

- (NSMutableArray)tiles
{
  return self->_tiles;
}

- (void)setTiles:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
