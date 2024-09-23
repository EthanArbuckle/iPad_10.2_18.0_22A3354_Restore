@implementation AWDCoreRoutineMapItem

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMapItem;
  -[AWDCoreRoutineMapItem dealloc](&v3, sel_dealloc);
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
    return off_24C10D900[a3];
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

- (void)setHasMuid:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hasMuid = a3;
}

- (void)setHasHasMuid:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHasMuid
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMapItem;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDCoreRoutineMapItem description](&v3, sel_description), -[AWDCoreRoutineMapItem dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_mapItemSources;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  __CFString *v8;

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
          v8 = off_24C10D900[v7];
        objc_msgSend(v5, "addObject:", v8);
        ++v6;
      }
      while (v6 < self->_mapItemSources.count);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("mapItemSources"));
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasMuid), CFSTR("hasMuid"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMapItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_mapItemSources;
  unint64_t v5;

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
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t i;

  if (-[AWDCoreRoutineMapItem mapItemSourcesCount](self, "mapItemSourcesCount"))
  {
    objc_msgSend(a3, "clearMapItemSources");
    v5 = -[AWDCoreRoutineMapItem mapItemSourcesCount](self, "mapItemSourcesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(a3, "addMapItemSources:", -[AWDCoreRoutineMapItem mapItemSourcesAtIndex:](self, "mapItemSourcesAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)a3 + 32) = self->_hasMuid;
    *((_BYTE *)a3 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[32] = self->_hasMuid;
    v4[36] |= 1u;
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual;

  IsEqual = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (IsEqual)
  {
    IsEqual = PBRepeatedInt32IsEqual();
    if (IsEqual)
    {
      LOBYTE(IsEqual) = (*((_BYTE *)a3 + 36) & 1) == 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
      {
        if ((*((_BYTE *)a3 + 36) & 1) == 0)
        {
LABEL_5:
          LOBYTE(IsEqual) = 0;
          return IsEqual;
        }
        if (self->_hasMuid)
        {
          if (!*((_BYTE *)a3 + 32))
            goto LABEL_5;
        }
        else if (*((_BYTE *)a3 + 32))
        {
          goto LABEL_5;
        }
        LOBYTE(IsEqual) = 1;
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_hasMuid;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t i;

  v5 = objc_msgSend(a3, "mapItemSourcesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[AWDCoreRoutineMapItem addMapItemSources:](self, "addMapItemSources:", objc_msgSend(a3, "mapItemSourcesAtIndex:", i));
  }
  if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
    self->_hasMuid = *((_BYTE *)a3 + 32);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (BOOL)hasMuid
{
  return self->_hasMuid;
}

@end
