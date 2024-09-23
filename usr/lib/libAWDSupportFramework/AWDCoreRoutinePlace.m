@implementation AWDCoreRoutinePlace

- (void)dealloc
{
  objc_super v3;

  -[AWDCoreRoutinePlace setMapItem:](self, "setMapItem:", 0);
  -[AWDCoreRoutinePlace setDistanceToOtherPlaces:](self, "setDistanceToOtherPlaces:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePlace;
  -[AWDCoreRoutinePlace dealloc](&v3, sel_dealloc);
}

- (BOOL)hasMapItem
{
  return self->_mapItem != 0;
}

- (void)clearDistanceToOtherPlaces
{
  -[NSMutableArray removeAllObjects](self->_distanceToOtherPlaces, "removeAllObjects");
}

- (void)addDistanceToOtherPlaces:(id)a3
{
  NSMutableArray *distanceToOtherPlaces;

  distanceToOtherPlaces = self->_distanceToOtherPlaces;
  if (!distanceToOtherPlaces)
  {
    distanceToOtherPlaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_distanceToOtherPlaces = distanceToOtherPlaces;
  }
  -[NSMutableArray addObject:](distanceToOtherPlaces, "addObject:", a3);
}

- (unint64_t)distanceToOtherPlacesCount
{
  return -[NSMutableArray count](self->_distanceToOtherPlaces, "count");
}

- (id)distanceToOtherPlacesAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_distanceToOtherPlaces, "objectAtIndex:", a3);
}

+ (Class)distanceToOtherPlacesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePlace;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutinePlace description](&v3, sel_description), -[AWDCoreRoutinePlace dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDCoreRoutineMapItem *mapItem;
  void *v5;
  NSMutableArray *distanceToOtherPlaces;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  mapItem = self->_mapItem;
  if (mapItem)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineMapItem dictionaryRepresentation](mapItem, "dictionaryRepresentation"), CFSTR("mapItem"));
  if (-[NSMutableArray count](self->_distanceToOtherPlaces, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_distanceToOtherPlaces, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    distanceToOtherPlaces = self->_distanceToOtherPlaces;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](distanceToOtherPlaces, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(distanceToOtherPlaces);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](distanceToOtherPlaces, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("distanceToOtherPlaces"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutinePlaceReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSMutableArray *distanceToOtherPlaces;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->_mapItem)
    PBDataWriterWriteSubmessage();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  distanceToOtherPlaces = self->_distanceToOtherPlaces;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](distanceToOtherPlaces, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(distanceToOtherPlaces);
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](distanceToOtherPlaces, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if (self->_mapItem)
    objc_msgSend(a3, "setMapItem:");
  if (-[AWDCoreRoutinePlace distanceToOtherPlacesCount](self, "distanceToOtherPlacesCount"))
  {
    objc_msgSend(a3, "clearDistanceToOtherPlaces");
    v5 = -[AWDCoreRoutinePlace distanceToOtherPlacesCount](self, "distanceToOtherPlacesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addDistanceToOtherPlaces:", -[AWDCoreRoutinePlace distanceToOtherPlacesAtIndex:](self, "distanceToOtherPlacesAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *distanceToOtherPlaces;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[2] = -[AWDCoreRoutineMapItem copyWithZone:](self->_mapItem, "copyWithZone:", a3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  distanceToOtherPlaces = self->_distanceToOtherPlaces;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](distanceToOtherPlaces, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(distanceToOtherPlaces);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addDistanceToOtherPlaces:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](distanceToOtherPlaces, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  AWDCoreRoutineMapItem *mapItem;
  NSMutableArray *distanceToOtherPlaces;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    mapItem = self->_mapItem;
    if (!((unint64_t)mapItem | *((_QWORD *)a3 + 2))
      || (v5 = -[AWDCoreRoutineMapItem isEqual:](mapItem, "isEqual:")) != 0)
    {
      distanceToOtherPlaces = self->_distanceToOtherPlaces;
      if ((unint64_t)distanceToOtherPlaces | *((_QWORD *)a3 + 1))
        LOBYTE(v5) = -[NSMutableArray isEqual:](distanceToOtherPlaces, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[AWDCoreRoutineMapItem hash](self->_mapItem, "hash");
  return -[NSMutableArray hash](self->_distanceToOtherPlaces, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  AWDCoreRoutineMapItem *mapItem;
  uint64_t v6;
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
  mapItem = self->_mapItem;
  v6 = *((_QWORD *)a3 + 2);
  if (mapItem)
  {
    if (v6)
      -[AWDCoreRoutineMapItem mergeFrom:](mapItem, "mergeFrom:");
  }
  else if (v6)
  {
    -[AWDCoreRoutinePlace setMapItem:](self, "setMapItem:");
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)*((_QWORD *)a3 + 1);
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
        -[AWDCoreRoutinePlace addDistanceToOtherPlaces:](self, "addDistanceToOtherPlaces:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
}

- (AWDCoreRoutineMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)distanceToOtherPlaces
{
  return self->_distanceToOtherPlaces;
}

- (void)setDistanceToOtherPlaces:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
