@implementation AWDCoreRoutineVisit

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  -[AWDCoreRoutineVisit setPossibleMapItems:](self, "setPossibleMapItems:", 0);
  -[AWDCoreRoutineVisit setSelectedMapItem:](self, "setSelectedMapItem:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineVisit;
  -[AWDCoreRoutineVisit dealloc](&v3, sel_dealloc);
}

- (unint64_t)mapItemSourcesCount
{
  return self->_mapItemSources.count;
}

- (int)mapItemSources
{
  return self->_mapItemSources.list;
}

- (void)clearMapItemSources
{
  PBRepeatedInt32Clear();
}

- (void)addMapItemSources:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)mapItemSourcesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_mapItemSources;
  unint64_t count;

  p_mapItemSources = &self->_mapItemSources;
  count = self->_mapItemSources.count;
  if (count <= a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCB78], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count), 0), "raise");
  return p_mapItemSources->list[a3];
}

- (void)setMapItemSources:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)mapItemSourcesAsString:(int)a3
{
  if (a3 >= 0x12)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_24C10D9D8[a3];
}

- (int)StringAsMapItemSources:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceNone")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceReverseGeocode")) & 1) != 0)
    return 1;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceContacts")) & 1) != 0)
    return 2;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceMapsSupport")) & 1) != 0)
    return 3;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceUser")) & 1) != 0)
    return 4;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceMapsSupportFavorite")) & 1) != 0)
    return 5;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceMapsSupportHistoryEntry")) & 1) != 0)
    return 6;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceMapsSupportHistoryEntryRoute")) & 1) != 0)
    return 7;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceMapsSupportHistoryEntryPlaceDisplay")) & 1) != 0)
    return 8;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceEventKit")) & 1) != 0)
    return 9;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceLocalSearch")) & 1) != 0)
    return 10;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceMapItemHandle")) & 1) != 0)
    return 11;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceForwardGeocode")) & 1) != 0)
    return 12;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceProactiveExperts")) & 1) != 0)
    return 13;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourcePortrait")) & 1) != 0)
    return 14;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceLearnedPlace")) & 1) != 0)
    return 15;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceBluePOI")) & 1) != 0)
    return 16;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CoreRoutineMapItemSourceMapItemURL")))
    return 17;
  return 0;
}

- (void)clearPossibleMapItems
{
  -[NSMutableArray removeAllObjects](self->_possibleMapItems, "removeAllObjects");
}

- (void)addPossibleMapItems:(id)a3
{
  NSMutableArray *possibleMapItems;

  possibleMapItems = self->_possibleMapItems;
  if (!possibleMapItems)
  {
    possibleMapItems = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->_possibleMapItems = possibleMapItems;
  }
  -[NSMutableArray addObject:](possibleMapItems, "addObject:", a3);
}

- (unint64_t)possibleMapItemsCount
{
  return -[NSMutableArray count](self->_possibleMapItems, "count");
}

- (id)possibleMapItemsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_possibleMapItems, "objectAtIndex:", a3);
}

+ (Class)possibleMapItemsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSelectedMapItem
{
  return self->_selectedMapItem != 0;
}

- (void)setDwellTime:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_dwellTime = a3;
}

- (void)setHasDwellTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDwellTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineVisit;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineVisit description](&v3, sel_description), -[AWDCoreRoutineVisit dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_mapItemSources;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  NSMutableArray *possibleMapItems;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  AWDCoreRoutineMapItem *selectedMapItem;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  p_mapItemSources = &self->_mapItemSources;
  if (self->_mapItemSources.count)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:");
    if (self->_mapItemSources.count)
    {
      v6 = 0;
      do
      {
        v7 = p_mapItemSources->list[v6];
        if (v7 >= 0x12)
          v8 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), p_mapItemSources->list[v6]);
        else
          v8 = off_24C10D9D8[v7];
        objc_msgSend(v5, "addObject:", v8);
        ++v6;
      }
      while (v6 < self->_mapItemSources.count);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mapItemSources"));
  }
  if (-[NSMutableArray count](self->_possibleMapItems, "count"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_possibleMapItems, "count"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    possibleMapItems = self->_possibleMapItems;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](possibleMapItems, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(possibleMapItems);
          objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](possibleMapItems, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("possibleMapItems"));

  }
  selectedMapItem = self->_selectedMapItem;
  if (selectedMapItem)
    objc_msgSend(v3, "setObject:forKey:", -[AWDCoreRoutineMapItem dictionaryRepresentation](selectedMapItem, "dictionaryRepresentation"), CFSTR("selectedMapItem"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_dwellTime), CFSTR("dwellTime"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineVisitReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_mapItemSources;
  unint64_t v5;
  NSMutableArray *possibleMapItems;
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
  p_mapItemSources = &self->_mapItemSources;
  if (self->_mapItemSources.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < p_mapItemSources->count);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  possibleMapItems = self->_possibleMapItems;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](possibleMapItems, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(possibleMapItems);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](possibleMapItems, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
  if (self->_selectedMapItem)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;

  if (-[AWDCoreRoutineVisit mapItemSourcesCount](self, "mapItemSourcesCount"))
  {
    objc_msgSend(a3, "clearMapItemSources");
    v5 = -[AWDCoreRoutineVisit mapItemSourcesCount](self, "mapItemSourcesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addMapItemSources:", -[AWDCoreRoutineVisit mapItemSourcesAtIndex:](self, "mapItemSourcesAtIndex:", i));
    }
  }
  if (-[AWDCoreRoutineVisit possibleMapItemsCount](self, "possibleMapItemsCount"))
  {
    objc_msgSend(a3, "clearPossibleMapItems");
    v8 = -[AWDCoreRoutineVisit possibleMapItemsCount](self, "possibleMapItemsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(a3, "addPossibleMapItems:", -[AWDCoreRoutineVisit possibleMapItemsAtIndex:](self, "possibleMapItemsAtIndex:", j));
    }
  }
  if (self->_selectedMapItem)
    objc_msgSend(a3, "setSelectedMapItem:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 4) = self->_dwellTime;
    *((_BYTE *)a3 + 56) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *possibleMapItems;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  possibleMapItems = self->_possibleMapItems;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](possibleMapItems, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(possibleMapItems);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPossibleMapItems:", v11);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](possibleMapItems, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  *(_QWORD *)(v5 + 48) = -[AWDCoreRoutineMapItem copyWithZone:](self->_selectedMapItem, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_dwellTime;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;
  NSMutableArray *possibleMapItems;
  AWDCoreRoutineMapItem *selectedMapItem;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    IsEqual = PBRepeatedInt32IsEqual();
    if (IsEqual)
    {
      possibleMapItems = self->_possibleMapItems;
      if (!((unint64_t)possibleMapItems | *((_QWORD *)a3 + 5))
        || (IsEqual = -[NSMutableArray isEqual:](possibleMapItems, "isEqual:")) != 0)
      {
        selectedMapItem = self->_selectedMapItem;
        if (!((unint64_t)selectedMapItem | *((_QWORD *)a3 + 6))
          || (IsEqual = -[AWDCoreRoutineMapItem isEqual:](selectedMapItem, "isEqual:")) != 0)
        {
          LOBYTE(IsEqual) = (*((_BYTE *)a3 + 56) & 1) == 0;
          if ((*(_BYTE *)&self->_has & 1) != 0)
            LOBYTE(IsEqual) = (*((_BYTE *)a3 + 56) & 1) != 0 && self->_dwellTime == *((_QWORD *)a3 + 4);
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = PBRepeatedInt32Hash();
  v4 = -[NSMutableArray hash](self->_possibleMapItems, "hash");
  v5 = -[AWDCoreRoutineMapItem hash](self->_selectedMapItem, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761u * self->_dwellTime;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  AWDCoreRoutineMapItem *selectedMapItem;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "mapItemSourcesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDCoreRoutineVisit addMapItemSources:](self, "addMapItemSources:", objc_msgSend(a3, "mapItemSourcesAtIndex:", i));
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)*((_QWORD *)a3 + 5);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[AWDCoreRoutineVisit addPossibleMapItems:](self, "addPossibleMapItems:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  selectedMapItem = self->_selectedMapItem;
  v14 = *((_QWORD *)a3 + 6);
  if (selectedMapItem)
  {
    if (v14)
      -[AWDCoreRoutineMapItem mergeFrom:](selectedMapItem, "mergeFrom:");
  }
  else if (v14)
  {
    -[AWDCoreRoutineVisit setSelectedMapItem:](self, "setSelectedMapItem:");
  }
  if ((*((_BYTE *)a3 + 56) & 1) != 0)
  {
    self->_dwellTime = *((_QWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSMutableArray)possibleMapItems
{
  return self->_possibleMapItems;
}

- (void)setPossibleMapItems:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (AWDCoreRoutineMapItem)selectedMapItem
{
  return self->_selectedMapItem;
}

- (void)setSelectedMapItem:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (unint64_t)dwellTime
{
  return self->_dwellTime;
}

@end
