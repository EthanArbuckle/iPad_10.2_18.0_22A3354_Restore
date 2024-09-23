@implementation ATXHeroEntriesPb

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedBOOLClear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)ATXHeroEntriesPb;
  -[ATXHeroEntriesPb dealloc](&v3, sel_dealloc);
}

- (unint64_t)deltaLatitudesCount
{
  return self->_deltaLatitudes.count;
}

- (int)deltaLatitudes
{
  return self->_deltaLatitudes.list;
}

- (void)clearDeltaLatitudes
{
  PBRepeatedInt32Clear();
}

- (void)addDeltaLatitude:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)deltaLatitudeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_deltaLatitudes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_deltaLatitudes = &self->_deltaLatitudes;
  count = self->_deltaLatitudes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_deltaLatitudes->list[a3];
}

- (void)setDeltaLatitudes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)deltaLongitudesCount
{
  return self->_deltaLongitudes.count;
}

- (int)deltaLongitudes
{
  return self->_deltaLongitudes.list;
}

- (void)clearDeltaLongitudes
{
  PBRepeatedInt32Clear();
}

- (void)addDeltaLongitude:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)deltaLongitudeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_deltaLongitudes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_deltaLongitudes = &self->_deltaLongitudes;
  count = self->_deltaLongitudes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_deltaLongitudes->list[a3];
}

- (void)setDeltaLongitudes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (unint64_t)adamIdsCount
{
  return self->_adamIds.count;
}

- (unsigned)adamIds
{
  return self->_adamIds.list;
}

- (void)clearAdamIds
{
  PBRepeatedUInt32Clear();
}

- (void)addAdamId:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)adamIdAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_adamIds;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_adamIds = &self->_adamIds;
  count = self->_adamIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_adamIds->list[a3];
}

- (void)setAdamIds:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)isTouristAppsCount
{
  return self->_isTouristApps.count;
}

- (BOOL)isTouristApps
{
  return self->_isTouristApps.list;
}

- (void)clearIsTouristApps
{
  PBRepeatedBOOLClear();
}

- (void)addIsTouristApp:(BOOL)a3
{
  PBRepeatedBOOLAdd();
}

- (BOOL)isTouristAppAtIndex:(unint64_t)a3
{
  $81BD420485C44FDD3B17AC2C53A57F4D *p_isTouristApps;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_isTouristApps = &self->_isTouristApps;
  count = self->_isTouristApps.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_isTouristApps->list[a3];
}

- (void)setIsTouristApps:(BOOL *)a3 count:(unint64_t)a4
{
  PBRepeatedBOOLSet();
}

- (unint64_t)ranksCount
{
  return self->_ranks.count;
}

- (unsigned)ranks
{
  return self->_ranks.list;
}

- (void)clearRanks
{
  PBRepeatedUInt32Clear();
}

- (void)addRank:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)rankAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_ranks;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_ranks = &self->_ranks;
  count = self->_ranks.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_ranks->list[a3];
}

- (void)setRanks:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (unint64_t)radiusCount
{
  return self->_radius.count;
}

- (unsigned)radius
{
  return self->_radius.list;
}

- (void)clearRadius
{
  PBRepeatedUInt32Clear();
}

- (void)addRadius:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)radiusAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_radius;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_radius = &self->_radius;
  count = self->_radius.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_radius->list[a3];
}

- (void)setRadius:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)clearUrlHashs
{
  -[NSMutableArray removeAllObjects](self->_urlHashs, "removeAllObjects");
}

- (void)addUrlHash:(id)a3
{
  id v4;
  NSMutableArray *urlHashs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  urlHashs = self->_urlHashs;
  v8 = v4;
  if (!urlHashs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_urlHashs;
    self->_urlHashs = v6;

    v4 = v8;
    urlHashs = self->_urlHashs;
  }
  -[NSMutableArray addObject:](urlHashs, "addObject:", v4);

}

- (unint64_t)urlHashsCount
{
  return -[NSMutableArray count](self->_urlHashs, "count");
}

- (id)urlHashAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_urlHashs, "objectAtIndex:", a3);
}

+ (Class)urlHashType
{
  return (Class)objc_opt_class();
}

- (void)clearPoiCategorys
{
  -[NSMutableArray removeAllObjects](self->_poiCategorys, "removeAllObjects");
}

- (void)addPoiCategory:(id)a3
{
  id v4;
  NSMutableArray *poiCategorys;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  poiCategorys = self->_poiCategorys;
  v8 = v4;
  if (!poiCategorys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_poiCategorys;
    self->_poiCategorys = v6;

    v4 = v8;
    poiCategorys = self->_poiCategorys;
  }
  -[NSMutableArray addObject:](poiCategorys, "addObject:", v4);

}

- (unint64_t)poiCategorysCount
{
  return -[NSMutableArray count](self->_poiCategorys, "count");
}

- (id)poiCategoryAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_poiCategorys, "objectAtIndex:", a3);
}

+ (Class)poiCategoryType
{
  return (Class)objc_opt_class();
}

- (unint64_t)muidsCount
{
  return self->_muids.count;
}

- (unint64_t)muids
{
  return self->_muids.list;
}

- (void)clearMuids
{
  PBRepeatedUInt64Clear();
}

- (void)addMuid:(unint64_t)a3
{
  PBRepeatedUInt64Add();
}

- (unint64_t)muidAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_muids;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_muids = &self->_muids;
  count = self->_muids.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_muids->list[a3];
}

- (void)setMuids:(unint64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt64Set();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ATXHeroEntriesPb;
  -[ATXHeroEntriesPb description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeroEntriesPb dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *urlHashs;
  NSMutableArray *poiCategorys;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_tileLatitudeE7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("tileLatitudeE7"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_tileLongitudeE7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("tileLongitudeE7"));

  PBRepeatedInt32NSArray();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("deltaLatitude"));

  PBRepeatedInt32NSArray();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("deltaLongitude"));

  PBRepeatedUInt32NSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("adamId"));

  PBRepeatedBOOLNSArray();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("isTouristApp"));

  PBRepeatedUInt32NSArray();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("rank"));

  PBRepeatedUInt32NSArray();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("radius"));

  urlHashs = self->_urlHashs;
  if (urlHashs)
    objc_msgSend(v3, "setObject:forKey:", urlHashs, CFSTR("urlHash"));
  poiCategorys = self->_poiCategorys;
  if (poiCategorys)
    objc_msgSend(v3, "setObject:forKey:", poiCategorys, CFSTR("poiCategory"));
  PBRepeatedUInt64NSArray();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("muid"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ATXHeroEntriesPbReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  $D9041E0417540B7714261C3B5E8BB314 *p_muids;
  unint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  PBDataWriterWriteSfixed32Field();
  PBDataWriterWriteSfixed32Field();
  if (self->_deltaLatitudes.count)
  {
    v31 = 0;
    PBDataWriterPlaceMark();
    if (self->_deltaLatitudes.count)
    {
      v5 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v5;
      }
      while (v5 < self->_deltaLatitudes.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_deltaLongitudes.count)
  {
    v31 = 0;
    PBDataWriterPlaceMark();
    if (self->_deltaLongitudes.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_deltaLongitudes.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_adamIds.count)
  {
    v31 = 0;
    PBDataWriterPlaceMark();
    if (self->_adamIds.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_adamIds.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_isTouristApps.count)
  {
    v31 = 0;
    PBDataWriterPlaceMark();
    if (self->_isTouristApps.count)
    {
      v8 = 0;
      do
      {
        PBDataWriterWriteBOOLField();
        ++v8;
      }
      while (v8 < self->_isTouristApps.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_ranks.count)
  {
    v31 = 0;
    PBDataWriterPlaceMark();
    if (self->_ranks.count)
    {
      v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v9 < self->_ranks.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_radius.count)
  {
    v31 = 0;
    PBDataWriterPlaceMark();
    if (self->_radius.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v10;
      }
      while (v10 < self->_radius.count);
    }
    PBDataWriterRecallMark();
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = self->_urlHashs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteDataField();
        ++v15;
      }
      while (v13 != v15);
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v13);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_poiCategorys;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v18);
  }

  p_muids = &self->_muids;
  if (p_muids->count)
  {
    v31 = 0;
    PBDataWriterPlaceMark();
    if (p_muids->count)
    {
      v22 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v22;
      }
      while (v22 < p_muids->count);
    }
    PBDataWriterRecallMark();
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  unint64_t v14;
  unint64_t v15;
  uint64_t m;
  unint64_t v17;
  unint64_t v18;
  uint64_t n;
  unint64_t v20;
  unint64_t v21;
  uint64_t ii;
  unint64_t v23;
  unint64_t v24;
  uint64_t jj;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t kk;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t mm;
  id v34;

  v4 = a3;
  v4[46] = self->_tileLatitudeE7;
  v34 = v4;
  v4[47] = self->_tileLongitudeE7;
  if (-[ATXHeroEntriesPb deltaLatitudesCount](self, "deltaLatitudesCount"))
  {
    objc_msgSend(v34, "clearDeltaLatitudes");
    v5 = -[ATXHeroEntriesPb deltaLatitudesCount](self, "deltaLatitudesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v34, "addDeltaLatitude:", -[ATXHeroEntriesPb deltaLatitudeAtIndex:](self, "deltaLatitudeAtIndex:", i));
    }
  }
  if (-[ATXHeroEntriesPb deltaLongitudesCount](self, "deltaLongitudesCount"))
  {
    objc_msgSend(v34, "clearDeltaLongitudes");
    v8 = -[ATXHeroEntriesPb deltaLongitudesCount](self, "deltaLongitudesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v34, "addDeltaLongitude:", -[ATXHeroEntriesPb deltaLongitudeAtIndex:](self, "deltaLongitudeAtIndex:", j));
    }
  }
  if (-[ATXHeroEntriesPb adamIdsCount](self, "adamIdsCount"))
  {
    objc_msgSend(v34, "clearAdamIds");
    v11 = -[ATXHeroEntriesPb adamIdsCount](self, "adamIdsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
        objc_msgSend(v34, "addAdamId:", -[ATXHeroEntriesPb adamIdAtIndex:](self, "adamIdAtIndex:", k));
    }
  }
  if (-[ATXHeroEntriesPb isTouristAppsCount](self, "isTouristAppsCount"))
  {
    objc_msgSend(v34, "clearIsTouristApps");
    v14 = -[ATXHeroEntriesPb isTouristAppsCount](self, "isTouristAppsCount");
    if (v14)
    {
      v15 = v14;
      for (m = 0; m != v15; ++m)
        objc_msgSend(v34, "addIsTouristApp:", -[ATXHeroEntriesPb isTouristAppAtIndex:](self, "isTouristAppAtIndex:", m));
    }
  }
  if (-[ATXHeroEntriesPb ranksCount](self, "ranksCount"))
  {
    objc_msgSend(v34, "clearRanks");
    v17 = -[ATXHeroEntriesPb ranksCount](self, "ranksCount");
    if (v17)
    {
      v18 = v17;
      for (n = 0; n != v18; ++n)
        objc_msgSend(v34, "addRank:", -[ATXHeroEntriesPb rankAtIndex:](self, "rankAtIndex:", n));
    }
  }
  if (-[ATXHeroEntriesPb radiusCount](self, "radiusCount"))
  {
    objc_msgSend(v34, "clearRadius");
    v20 = -[ATXHeroEntriesPb radiusCount](self, "radiusCount");
    if (v20)
    {
      v21 = v20;
      for (ii = 0; ii != v21; ++ii)
        objc_msgSend(v34, "addRadius:", -[ATXHeroEntriesPb radiusAtIndex:](self, "radiusAtIndex:", ii));
    }
  }
  if (-[ATXHeroEntriesPb urlHashsCount](self, "urlHashsCount"))
  {
    objc_msgSend(v34, "clearUrlHashs");
    v23 = -[ATXHeroEntriesPb urlHashsCount](self, "urlHashsCount");
    if (v23)
    {
      v24 = v23;
      for (jj = 0; jj != v24; ++jj)
      {
        -[ATXHeroEntriesPb urlHashAtIndex:](self, "urlHashAtIndex:", jj);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addUrlHash:", v26);

      }
    }
  }
  if (-[ATXHeroEntriesPb poiCategorysCount](self, "poiCategorysCount"))
  {
    objc_msgSend(v34, "clearPoiCategorys");
    v27 = -[ATXHeroEntriesPb poiCategorysCount](self, "poiCategorysCount");
    if (v27)
    {
      v28 = v27;
      for (kk = 0; kk != v28; ++kk)
      {
        -[ATXHeroEntriesPb poiCategoryAtIndex:](self, "poiCategoryAtIndex:", kk);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addPoiCategory:", v30);

      }
    }
  }
  if (-[ATXHeroEntriesPb muidsCount](self, "muidsCount"))
  {
    objc_msgSend(v34, "clearMuids");
    v31 = -[ATXHeroEntriesPb muidsCount](self, "muidsCount");
    if (v31)
    {
      v32 = v31;
      for (mm = 0; mm != v32; ++mm)
        objc_msgSend(v34, "addMuid:", -[ATXHeroEntriesPb muidAtIndex:](self, "muidAtIndex:", mm));
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _DWORD *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[46] = self->_tileLatitudeE7;
  v5[47] = self->_tileLongitudeE7;
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedBOOLCopy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = self->_urlHashs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10), "copyWithZone:", a3);
        objc_msgSend(v5, "addUrlHash:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = self->_poiCategorys;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v19);
        objc_msgSend(v5, "addPoiCategory:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  PBRepeatedUInt64Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *urlHashs;
  NSMutableArray *poiCategorys;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_tileLatitudeE7 == *((_DWORD *)v4 + 46)
    && self->_tileLongitudeE7 == *((_DWORD *)v4 + 47)
    && PBRepeatedInt32IsEqual()
    && PBRepeatedInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedBOOLIsEqual()
    && PBRepeatedUInt32IsEqual()
    && PBRepeatedUInt32IsEqual()
    && ((urlHashs = self->_urlHashs, !((unint64_t)urlHashs | *((_QWORD *)v4 + 24)))
     || -[NSMutableArray isEqual:](urlHashs, "isEqual:"))
    && ((poiCategorys = self->_poiCategorys, !((unint64_t)poiCategorys | *((_QWORD *)v4 + 22)))
     || -[NSMutableArray isEqual:](poiCategorys, "isEqual:")))
  {
    IsEqual = PBRepeatedUInt64IsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (2654435761 * self->_tileLongitudeE7) ^ (2654435761 * self->_tileLatitudeE7);
  v4 = PBRepeatedInt32Hash();
  v5 = v4 ^ PBRepeatedInt32Hash();
  v6 = v5 ^ PBRepeatedUInt32Hash();
  v7 = v6 ^ PBRepeatedBOOLHash();
  v8 = v7 ^ PBRepeatedUInt32Hash();
  v9 = v8 ^ PBRepeatedUInt32Hash();
  v10 = v9 ^ -[NSMutableArray hash](self->_urlHashs, "hash");
  v11 = v10 ^ -[NSMutableArray hash](self->_poiCategorys, "hash");
  return v3 ^ v11 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  uint64_t v12;
  uint64_t k;
  uint64_t v14;
  uint64_t v15;
  uint64_t m;
  uint64_t v17;
  uint64_t v18;
  uint64_t n;
  uint64_t v20;
  uint64_t v21;
  uint64_t ii;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t jj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  self->_tileLatitudeE7 = *((_DWORD *)v4 + 46);
  self->_tileLongitudeE7 = *((_DWORD *)v4 + 47);
  v5 = objc_msgSend(v4, "deltaLatitudesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[ATXHeroEntriesPb addDeltaLatitude:](self, "addDeltaLatitude:", objc_msgSend(v4, "deltaLatitudeAtIndex:", i));
  }
  v8 = objc_msgSend(v4, "deltaLongitudesCount");
  if (v8)
  {
    v9 = v8;
    for (j = 0; j != v9; ++j)
      -[ATXHeroEntriesPb addDeltaLongitude:](self, "addDeltaLongitude:", objc_msgSend(v4, "deltaLongitudeAtIndex:", j));
  }
  v11 = objc_msgSend(v4, "adamIdsCount");
  if (v11)
  {
    v12 = v11;
    for (k = 0; k != v12; ++k)
      -[ATXHeroEntriesPb addAdamId:](self, "addAdamId:", objc_msgSend(v4, "adamIdAtIndex:", k));
  }
  v14 = objc_msgSend(v4, "isTouristAppsCount");
  if (v14)
  {
    v15 = v14;
    for (m = 0; m != v15; ++m)
      -[ATXHeroEntriesPb addIsTouristApp:](self, "addIsTouristApp:", objc_msgSend(v4, "isTouristAppAtIndex:", m));
  }
  v17 = objc_msgSend(v4, "ranksCount");
  if (v17)
  {
    v18 = v17;
    for (n = 0; n != v18; ++n)
      -[ATXHeroEntriesPb addRank:](self, "addRank:", objc_msgSend(v4, "rankAtIndex:", n));
  }
  v20 = objc_msgSend(v4, "radiusCount");
  if (v20)
  {
    v21 = v20;
    for (ii = 0; ii != v21; ++ii)
      -[ATXHeroEntriesPb addRadius:](self, "addRadius:", objc_msgSend(v4, "radiusAtIndex:", ii));
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v23 = *((id *)v4 + 24);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        -[ATXHeroEntriesPb addUrlHash:](self, "addUrlHash:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v27++));
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v25);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v28 = *((id *)v4 + 22);
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v37;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v37 != v31)
          objc_enumerationMutation(v28);
        -[ATXHeroEntriesPb addPoiCategory:](self, "addPoiCategory:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v32++), (_QWORD)v36);
      }
      while (v30 != v32);
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v30);
  }

  v33 = objc_msgSend(v4, "muidsCount");
  if (v33)
  {
    v34 = v33;
    for (jj = 0; jj != v34; ++jj)
      -[ATXHeroEntriesPb addMuid:](self, "addMuid:", objc_msgSend(v4, "muidAtIndex:", jj, (_QWORD)v36));
  }

}

- (int)tileLatitudeE7
{
  return self->_tileLatitudeE7;
}

- (void)setTileLatitudeE7:(int)a3
{
  self->_tileLatitudeE7 = a3;
}

- (int)tileLongitudeE7
{
  return self->_tileLongitudeE7;
}

- (void)setTileLongitudeE7:(int)a3
{
  self->_tileLongitudeE7 = a3;
}

- (NSMutableArray)urlHashs
{
  return self->_urlHashs;
}

- (void)setUrlHashs:(id)a3
{
  objc_storeStrong((id *)&self->_urlHashs, a3);
}

- (NSMutableArray)poiCategorys
{
  return self->_poiCategorys;
}

- (void)setPoiCategorys:(id)a3
{
  objc_storeStrong((id *)&self->_poiCategorys, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlHashs, 0);
  objc_storeStrong((id *)&self->_poiCategorys, 0);
}

@end
